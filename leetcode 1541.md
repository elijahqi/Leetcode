# Leetcode 1541 Minimum Insertions to Balance a Parentheses String

Just simulate directly.
```cpp
class Solution {
public:
    int minInsertions(string s) {
        int left=0,ret=0,right=0;
        for (int i=0;i<s.size();++i){
            if (s[i]=='(') {
                if(right) {
                    right=0;
                    if (left) --left,ret+=1;
                    else ret+=2;
                }
                ++left;continue;
            }else{
                ++right;
                if (right==2){
                    right=0;
                    if (left) {--left;continue;}
                    ++ret;
                }
            }
        }
        if (left) ret+=left*2-right;
        else if (right) ret+=2;
        return ret;
    }
};
```
