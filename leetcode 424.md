# Leetcode 424 Longest Repeating Character Replacement

Slinding window, and recored the maximum category and the return value.
```cpp
class Solution {
public:
    int characterReplacement(string s, int k) {
        memset(bk,0,sizeof(bk));
        int cat=0,ret=0;
        int l=0,r=0;
        while(r<s.size()){
            ++bk[s[r]];
            cat=max(cat,bk[s[r++]]);
            while(r-l-cat>k){
                --bk[s[l++]];
            }
            ret=max(ret,r-l);
        }
        return ret;
    }
private:
    int bk[260];
    
};
```
