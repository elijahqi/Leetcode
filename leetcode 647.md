# Leetcode  647 Palindromic Substrings

Use for loop to do the n^2 loop that's not possible.
but we can try to loop the string from the middle to become broad.
If it encounter something that's not possible, then it will automatically stop.
```cpp
class Solution {
public:
    int countSubstrings(string s) {
        int ret=0;
        for (int i=0;i<s.size();++i){
            ret+=check(i,i,s);
            if (i<s.size()-1) ret+=check(i,i+1,s);
        }
        return ret;
    }
private:
    int check(int l,int r,string &s){
        int ret=0;
        while(l>=0&&r<s.size()){
            if (s[l]!=s[r]) break;
            --l;++r;++ret;
        }
        return ret;
    }
};
```
