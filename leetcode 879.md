# Leetcode 879 Profitable Schemes
There are a series of tasks. Each task needs to consume manpower and generate value. Ask how many combinations of these tasks you pick that satisfy a total manpower less than or equal to G but a total value greater than or equal to P. State definition: dp[i][g][p] => Consider the solution (i.e., the number of combinations of solutions) when only a subset of the first i tasks are chosen and the chosen manpower is g and the total value is p.
State transfer: the current cost is (g,p), then what is the cost of the previous round? (g,p) or (g-gi,p-pi)


```cpp
for (int i=1; i<=N; i++)
for (int g=1; g<=MaxG; g++)
    for (int p=1; p<=MaxP; p++)
      	    {
          	dp[i][g][p] = dp[i-1][g][p] + dp[i-1][g-gi][p-pi];
           }
 
   Ans = sum {dp[N][g][p] } for g<=G, p>=P

```







```cpp
class Solution {
private:
    const int mod=1e9+7;
public:
    int profitableSchemes(int n, int minProfit, vector<int>& group, vector<int>& profit) {
        const int N=profit.size();
        vector<vector<vector<int> > >dp(N+1,vector<vector<int> >(n+1,vector<int>(minProfit+1,0)));
        dp[0][0][0]=1;
        for (int i=1;i<=N;++i){
            int p=profit[i-1],g=group[i-1];
            for (int j=0;j<=n;++j){
                for (int z=0;z<=minProfit;++z){
                    dp[i][j][z]+=dp[i-1][j][z];
                    dp[i][j][z]%=mod;
                    auto t=0;
                    if (j<g) t=0;
                    else t=dp[i-1][j-g][max(0,z-p)]%mod;
                    dp[i][j][z]+=t;
                    dp[i][j][z]%=mod;
                }
            }
        }
        long long ret=0;
        for (int i=0;i<=n;++i) ret+=dp[N][i][minProfit],ret%=mod;
        return ret;
    }
};
```
