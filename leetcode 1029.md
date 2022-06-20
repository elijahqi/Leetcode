# Leetcode 1029 Two City Scheduling

DP algorithm
```cpp
class Solution {
public:
    int twoCitySchedCost(vector<vector<int>>& costs) {
        memset(dp,0x7f,sizeof(dp));dp[0][0]=0;
        int n=costs.size()>>1;
        for (int i=0;i<costs.size();++i){
            for (int j=n;j>=0;--j){
                for (int k=n;k>=0;--k){
                    if (dp[j][k]==0x7f7f7f7f) continue;
                    dp[j+1][k]=min(dp[j+1][k],dp[j][k]+costs[i][0]);
                    dp[j][k+1]=min(dp[j][k+1],dp[j][k]+costs[i][1]);
                }
            }
        }
        return dp[n][n];
    }
int dp[110][110];
};
```

Greedy algorithm

Since every city will contribute to the answer, thus we use their difference to sort if a[0]>a[1] greater then we will choose a[1] 
```cpp
class Solution {
public:
    int twoCitySchedCost(vector<vector<int>>& costs) {
       sort(costs.begin(),costs.end(),[](const vector<int>&a,const vector<int> &b){return a[0]-a[1]<b[0]-b[1];});
        int ret=0;
        for (int i=0;i<costs.size()>>1;++i) ret+=costs[i][0]+costs[costs.size()-i-1][1];
        return ret;
    }

};
```
