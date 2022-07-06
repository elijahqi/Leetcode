# Leetcode 1186 Maximum Subarray Sum with One Deletion

```cpp
class Solution {
public:
    int maximumSum(vector<int>& nums) {
        vector<vector<int> >dp(nums.size()+1,vector<int>(2,-0x7f7f7f7f));
        //dp[0][0]=0;
        for (int i=1;i<=nums.size();++i){
            dp[i][0]=max(dp[i][0],nums[i-1]);
            dp[i][0]=max(dp[i-1][0]+nums[i-1],dp[i][0]);
            dp[i][1]=max(dp[i][1],dp[i-1][0]);
            dp[i][1]=max(dp[i][1],dp[i-1][1]+nums[i-1]);
        }
        int ret=-0x7f7f7f7f;
        for (int i=1;i<=nums.size();++i) ret=max(ret,max(dp[i][0],dp[i][1]));
        return ret;
    }
};
```
