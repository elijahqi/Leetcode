# Leetcode 375 Guess Number Higher or Lower II

for (int len=1; len<=N; len++)
for (int i=1; i+len-1<=N; i++)
      {
          int j = i+len-1;
	    for (int k=i; k<=j; k++)
              dp[i][j] = min(dp[i][j],
k + max(dp[i][k-1],dp[k+1][j]);
       }

```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int getMoneyAmount(int n) {
        vector<vector<int> >dp(n+2,vector<int>(n+2,inf));
        for (int i=1;i<=n+1;++i)
            for (int j=0;j<i;++j) dp[i][j]=0;
        for (int l=0;l<n;++l){
            for (int i=1;i<=n;++i){
                int j=i+l;
                if (j>n) continue;
                if (i==j) {dp[i][i]=0;continue;}
                for (int k=i;k<=j;++k){
                    dp[i][j]=min(dp[i][j],k+max(dp[i][k-1],dp[k+1][j]));
                }
            }
        }
        return dp[1][n];
    }
};
```
