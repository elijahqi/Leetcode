# Leetcode 1155 Number of Dice Rolls With Target Sum

We need to notice that every dices should be thrown. THus we can not eliminate one dimension from the dp array.
```cpp
const int mod=1e9+7;

class Solution {
public:
    int numRollsToTarget(int n, int k, int target) {
        memset(dp,0,sizeof(dp));dp[0][0]=1;
        for (int i=1;i<=n;++i){
            for (int j=target;j>0;--j){
                for (int kk=1;kk<=k;++kk){
                    if(j<kk) continue;
                    dp[i][j]+=dp[i-1][j-kk];
                    dp[i][j]%=mod;
                }
            }
            
        }
        return dp[n][target];
    }
private:
    int dp[33][1010];
};
```
