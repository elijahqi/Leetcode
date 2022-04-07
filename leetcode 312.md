对于有很多数的区间 [i, j]，如何来更新呢？现在是想知道 dp[i][j] 的值，这个区间可能比较大，但是如果知道了所有的小区间的 dp 值，然后聚沙成塔，逐步的就能推出大区间的 dp 值了。还是要遍历这个区间内的每个气球，就用k来遍历吧，k在区间 [i, j] 中，假如第k个气球最后被打爆，那么此时区间 [i, j] 被分成了三部分，[i, k-1]，[k]，和 [k+1, j]，只要之前更新过了 [i, k-1] 和 [k+1, j] 这两个子区间的 dp 值，可以直接用 dp[i][k-1] 和 dp[k+1][j]，那么最后被打爆的第k个气球的得分该怎么算呢，你可能会下意识的说，就乘以周围两个气球被 nums[k-1] * nums[k] * nums[k+1]，但其实这样是错误的，为啥呢？dp[i][k-1] 的意义是什么呢，是打爆区间 [i, k-1] 内所有的气球后的最大得分，此时第 k-1 个气球已经不能用了，同理，第 k+1 个气球也不能用了，相当于区间 [i, j] 中除了第k个气球，其他的已经爆了，那么周围的气球只能是第 i-1 个，和第 j+1 个了，所以得分应为 nums[i-1] * nums[k] * nums[j+1]，分析到这里，状态转移方程应该已经跃然纸上了吧，如下所示：

dp[i][j] = max(dp[i][j], nums[i - 1] * nums[k] * nums[j + 1] + dp[i][k - 1] + dp[k + 1][j])                 ( i ≤ k ≤ j )

```cpp
class Solution {
public:
    int a[550],n,dp[550][550];
    int maxCoins(vector<int>& nums) {
        n=nums.size();a[0]=a[n+1]=1;
        for (int i=0;i<n;++i) a[i+1]=nums[i];
        for (int l=1;l<=n;++l){
            for (int i=1;i<=n-l+1;++i){
                int j=i+l-1;
                for (int k=i;k<=j;++k){
                    dp[i][j]=max(dp[i][j],dp[i][k-1]+dp[k+1][j]+a[i-1]*a[k]*a[j+1]);
                }
            }
        }
        return dp[1][n];
    }
    
};
```
