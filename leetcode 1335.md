# Leetcode 1335 Minimum Difficulty of a Job Schedule


```cpp
class Solution {
const int inf=0x7f7f7f7f;
public:
    int minDifficulty(vector<int>& jobDifficulty, int d) {
        int n=jobDifficulty.size();
        vector<vector<int> >dp(n+1,vector<int>(d+1,inf));
        dp[0][0]=0;
        for (int i=1;i<=n;++i){
            for (int k=1;k<=d;++k){
                int mx=0;
                for (int j=i-1;j>=k-1;--j){
                    mx=max(mx,jobDifficulty[j]);
                    dp[i][k]=min(dp[i][k],dp[j][k-1]+mx);
                }
            }
        }
        
        return dp[n][d]==inf?-1:dp[n][d];
    }
};
```
