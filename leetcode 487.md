# Leetcode 487 Max Consecutive Ones II

```cpp
class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        vector<vector<int> >dp(nums.size()+1,vector<int>(2,0));
        dp[0][1]=-0x7f7f7f7f;
        for (int i=1;i<=nums.size();++i){
            dp[i][0]=(nums[i-1]==1?max(dp[i][0],dp[i-1][0]+1):0);
            if (nums[i-1]==1) dp[i][1]=max(dp[i-1][1]+1,dp[i][1]);
            if (nums[i-1]==0) dp[i][1]=max(dp[i][1],dp[i-1][0]+1);
        }
        int ret=0;
        for (int i=1;i<=nums.size();++i) ret=max(ret,max(dp[i][0],dp[i][1]));
        return ret;
    }
};
```
