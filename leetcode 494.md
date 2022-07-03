# Leetcode 494 Target Sum

DP[i][j] means at ith elements, and now is j. How many methods do we have.
The thing we should consider is s<abs(target) then we should return 0.
otherwise, like sum=100, target=200 will give us an error
```cpp

class Solution {
public:
    int findTargetSumWays(vector<int>& nums, int target) {
        int s=accumulate(begin(nums),end(nums),0);
        if (s<abs(target)) return 0;
        vector<vector<int> >dp(nums.size()+1,vector<int>(s*2+1,0));
        dp[0][s]=1;
        for (int i=0;i<nums.size();++i){
            for (int j=nums[i];j<s*2-nums[i]+1;++j){
                if (dp[i][j]){
                    dp[i+1][j+nums[i]]+=dp[i][j];
                    dp[i+1][j-nums[i]]+=dp[i][j];
                }
            }
        }
        return dp[nums.size()][target+s];
    }
};
```
