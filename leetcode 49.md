# Leetcode 49 Group Anagrams

Sort every string so that the anagrams will all become the same.
Then we use hash table that the unordered_map to deal this as the key and push_back the result as value of the unordered_map
```cpp
class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        for (auto i:strs){
            string tmp=i;
            sort(i.begin(),i.end());
            mp[i].push_back(tmp);
        }
        for (auto i:mp){
            ret.push_back(i.second);
        }
        return ret;
    }
private:
    vector<vector<string> >ret;
    unordered_map<string,vector<string> >mp;
};
```
