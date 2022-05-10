# Leetcode 242 Valid Anagram

Use hash map to check whether two string have the exactly same number of characters.
```cpp
class Solution {
public:
    bool isAnagram(string s, string t) {
        for (auto i:s) mp1[i]++;
        for (auto i:t) mp2[i]++;
        if (mp1.size()!=mp2.size()) return false;
        for (auto i=mp1.begin();i!=mp1.end();++i){
            
            if (mp1[i->first]!=mp2[i->first]) return false;
        }
        return true;
    }
private:
    unordered_map<char,int> mp1,mp2;
};
```
