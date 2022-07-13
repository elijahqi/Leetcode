# Leetcode 410 Split Array Largest Sum

In this program, we indeed can add it from the back end without prepare the sum of all segements
```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int splitArray(vector<int>& nums, int m) {
        vector<vector<int> >dp(nums.size()+1,vector<int>(m+1,inf));
        vector<vector<int> >sum(nums.size()+1,vector<int>(nums.size()+1,0));
        for (int i=1;i<=nums.size();++i){
            for (int j=i;j<=nums.size();++j){
                if (i==j) {sum[i][j]=nums[i-1];continue;}
                sum[i][j]=sum[i][j-1]+nums[j-1];
            }
        }
        dp[0][0]=0;
        for (int i=1;i<=nums.size();++i){
            for (int k=1;k<=min(m,i);++k){
                for (int j=k-1;j<=i-1;++j){
                    dp[i][k]=min(dp[i][k],max(dp[j][k-1],sum[j+1][i]));
                }
            }
        }
        return dp[nums.size()][m];
    }
};
```
