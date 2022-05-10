# Leetcode 219

Use unordered_map to record the most recent location. If exist the distance less or equal than k. We can then return true
```cpp
class Solution {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        if (nums.size()<=1) return false;
        mp[nums[0]]=0;
        for (int i=1;i<nums.size();++i){
            if (mp.find(nums[i])==mp.end()) mp[nums[i]]=i;
            else if (i-mp[nums[i]]<=k) return true;
            else mp[nums[i]]=i;
        }
        return false;
    }
private:
    unordered_map<int,int> mp;
};
```
