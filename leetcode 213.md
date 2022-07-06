# Leetcode 213 House Robber II
Since the start and the end will connect to become a circle.
Then at least one of them can not be robbered.
```cpp
class Solution {
public:
    int rob(vector<int>& nums) {
        if (nums.empty()) return 0;
        if (nums.size()==1) return nums[0];
        vector<vector<int> >dp(nums.size(),vector<int>(2,0));
        dp[0][0]=0;
        dp[0][1]=nums[0];
        for (int i=0;i<nums.size()-2;++i){
            dp[i+1][0]=max(dp[i][0],max(dp[i+1][0],dp[i][1]));
            dp[i+1][1]=max(dp[i+1][1],dp[i][0]+nums[i+1]);
        }
        int ret=max(dp[nums.size()-2][0],dp[nums.size()-2][1]);
        dp.clear();
        dp.resize(nums.size(),vector<int>(2,0));
        for (int i=0;i<nums.size()-1;++i){
            dp[i+1][0]=max(dp[i][0],max(dp[i+1][0],dp[i][1]));
            dp[i+1][1]=max(dp[i+1][1],dp[i][0]+nums[i+1]);
        }
        ret=max(ret,max(dp.back()[0],dp.back()[1]));
        return ret;
    }
};
```
