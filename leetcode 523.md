# Leetcode 523 Continuous Subarray Sum

Pay attention to negative number
```cpp
class Solution {
public:
    bool checkSubarraySum(vector<int>& nums, int k) {
        if(nums.size()<2) return false;
        unordered_map<int,int> mp;
        mp[0]=1;
        long long sum=nums[0];sum%=k;
        for (int i=1;i<nums.size();++i){
            nums[i]%=k;
            sum+=nums[i];sum%=k;sum+=k;sum%=k;
            auto find_it=mp.find(sum);
            if(find_it!=mp.end()) return true;
            sum-=nums[i];sum+=k;sum%=k;
            mp[sum]++;
            sum+=nums[i];sum+=k;sum%=k;
        }
        return false;
    }
};
```
