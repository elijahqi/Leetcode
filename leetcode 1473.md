# Leetcode 1473 Paint House III

Three dimensions,and consider the boundary situation
```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
    const int st=1;
public:
    int minCost(vector<int>& houses, vector<vector<int>>& cost, int m, int n, int target) {
        if (target>m) return -1;
        //dp[i][j][k] represents the situation that the ith house painted with jth color have k neighbours
        vector<vector<vector<int> > > dp(m+1,vector<vector<int>>(n+1,vector<int>(target+1,inf)));
        for (int i=0;i<=n;++i) dp[0][i][0]=0;
        for (int tg=1;tg<=target;++tg){
            for (int i=tg;i<=m;++i){
                auto ch_i=houses[i-1];
                auto ch_i_1=i>=2?houses[i-2]:0;
                auto bg_ed_i=ch_i?make_pair(ch_i,ch_i):make_pair(st,n);
                auto bg_ed_i_1=ch_i_1?make_pair(ch_i_1,ch_i_1):make_pair(st,n);
                for (int j=bg_ed_i.first;j<=bg_ed_i.second;++j){
                    auto val=ch_i==j?0:cost[i-1][j-1];
                    for (int k=bg_ed_i_1.first;k<=bg_ed_i_1.second;++k){
                        dp[i][j][tg]=min(dp[i][j][tg],dp[i-1][k][tg-(j!=k)]+val);
                    }
                }
            }
        }
        int ret=inf;
        for (int i=1;i<=n;++i) ret=min(ret,dp[m][i][target]);
        if (ret==inf) return -1;
        return ret;
    }
};
```
