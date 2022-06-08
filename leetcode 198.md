# Leetcode 198 House Robber
classical DP
```cpp
class Solution {
public:
    int rob(vector<int>& nums) {
        if (nums.empty()) return 0;
        dp.resize(nums.size(),INT_MIN);
        int ret=0;
        for (int i=0;i<nums.size();++i){
            dp[i]=nums[i];
            if(i) dp[i]=max(dp[i-1],dp[i]);
            if (i>1) dp[i]=max(dp[i],dp[i-2]+nums[i]);
            ret=max(ret,dp[i]);
        }
        return ret;
    }
private:
    vector<int> dp;
};
```
