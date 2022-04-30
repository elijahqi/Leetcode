# Leetcode 125 Valid Palindrome

For this question, we only need to set up two pointers for the beginning and the end.
Then for the not alpha or not digit one, we have to skip these. THus we applied while loop.


```cpp
class Solution {
public:
    bool isPalindrome(string s) {
        int i=0,j=s.size()-1;
        while(i<j){
            while (!isdigit(s[i])&&!isalpha(s[i])&&i<j) ++i;
            while (!isdigit(s[j])&&!isalpha(s[j])&&i<j) --j;
            if(i>=j) break;
            if (toupper(s[i])!=toupper(s[j])) return false;
            ++i;--j;
        }
        return true;
    }
};
```
