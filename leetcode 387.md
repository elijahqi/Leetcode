# Leetcode 387 First Unique Character in a String


```cpp
class Solution {
public:
    int firstUniqChar(string s) {
        for (int i=0;i<s.size();++i) mp[s[i]]++;
        for (int i=0;i<s.size();++i) if (mp[s[i]]==1) return i;
        return -1;
    }
    
private:
    unordered_map<char,int> mp;
};
```
