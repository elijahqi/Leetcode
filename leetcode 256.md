# Leetcode 256 Paint House

Dynamic programming
```cpp
class Solution {
public:
    int minCost(vector<vector<int>>& costs) {
        vector<vector<int> > dp(costs.size()+10,vector<int> (3,0x7f7f7f7f));
        dp[0][0]=0;
        dp[0][1]=0;
        dp[0][2]=0;
        for (int i=0;i<costs.size();++i){
            for (int j=0;j<3;++j){
                if(dp[i][j]==0x7f7f7f7f) continue;
                int y=j+1;
                if (y<3) dp[i+1][y]=min(dp[i+1][y],costs[i][y]+dp[i][j]);
                y=j+2;
                if (y<3) dp[i+1][y]=min(dp[i+1][y],costs[i][y]+dp[i][j]);
                y=j-1;
                if (y>=0) dp[i+1][y]=min(dp[i+1][y],costs[i][y]+dp[i][j]);
                y=j-2;
                if (y>=0) dp[i+1][y]=min(dp[i+1][y],costs[i][y]+dp[i][j]);
            }
        }
        int mn=INT_MAX;
        for (int i=0;i<3;++i) mn=min(mn,dp[costs.size()][i]);
        return mn;
    }
};
```
