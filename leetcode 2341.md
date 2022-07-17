# Leetcode 2341 Maximum Number of Pairs in Array


```cpp
class Solution {
private:
    unordered_map<int,int> mp;
public:
    vector<int> numberOfPairs(vector<int>& nums) {
        for (int i=0;i<nums.size();++i){
            mp[nums[i]]++;
        }
        int ret=0;
        for (auto &m:mp){
            ret+=m.second/2;
        }
        vector<int> retr;
        retr.push_back(ret);
        retr.push_back(nums.size()-ret*2);
        return retr;
    }
};
```
