# Leetcode 813 Largest Sum of Averages
Since this problem requires us to find the maximum number. Thus we have to set the impossible status to minimum number.
```cpp
class Solution {
public:
    double largestSumOfAverages(vector<int>& nums, int K) {
        vector<int> sum(nums.size()+1,0);
        vector<vector<double> >dp(nums.size()+1,vector<double>(K+1,0));
        for (int i=1;i<=nums.size();++i){
            dp[i][0]=-0x7f7f7f7f;
        }
        for (int i=0;i<nums.size();++i) sum[i+1]=sum[i]+nums[i];
        for (int i=1;i<=nums.size();++i){
            for (int k=1;k<=min(K,i);++k){
                for (int j=0;j<i;++j){
                    dp[i][k]=max(dp[i][k],dp[j][k-1]+(double)(sum[i]-sum[j])/(i-j));
                }
            }
        }
        double ret=0;
        for (int i=1;i<=K;++i) ret=max(ret,dp.back()[i]);
        return ret;
    }
};
```
