# Leetcode 260 
Use unordered_map
```cpp
class Solution {
public:
    vector<int> singleNumber(vector<int>& nums) {
        for (int i=0;i<nums.size();++i) ++mp[nums[i]];
        vector<int> ret;
        for (auto it:mp){
            if (it.second==1) ret.push_back(it.first);
        }
        return ret;
    }
private:
    unordered_map<int,int> mp;
};
```
