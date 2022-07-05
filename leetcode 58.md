# Leetcode 58 Length of Last Word

```cpp
class Solution {
public:
    int lengthOfLastWord(string s) {
        stringstream ss(s);
        string s1;
        while(ss>>s1);
        return s1.size();
    }
};
```
