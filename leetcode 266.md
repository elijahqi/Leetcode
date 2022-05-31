# Leetcode 266 Palindrome Permutation
 To check whether the permutation have palindrome, we have to check whether each character exist more than even number times.
 If it is odd and exist more than two times than it should not be palindrome

```cpp
class Solution {
public:
    bool canPermutePalindrome(string s) {
        unordered_map<char,int> mp;
        for (auto i:s) mp[i]++;
        bool flag=false;
        int cnt=0;
        if (s.size()&1) flag=true;
        for (auto i:mp){
            if (i.second%2) ++cnt;
        }
        if (cnt>=2) return false;
        if (cnt==1) if(flag) return true;
        return true;
    }
};
```
