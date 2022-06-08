# Leetcode 1332 Remove Palindromic Subsequences

The string only contains a,b then there are only three conditions.
If the string is empty then the answer should be returned 0.
If it's not palindromic, the the answer will be 2. 
Otherwise will be 1.
```cpp
class Solution {
public:
    int removePalindromeSub(string s) {
        if (s.empty()) return 0;
        int le=s.size();
        for (int i=0;i<le/2;++i)
            if (s[i]!=s[le-i-1]) return 2;
        
        return 1;
    }
};
```
