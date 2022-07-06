# Leetcode 123 Best Time to Buy and Sell Stock III
0:Maximum gain for the 1st share I have held this round
1:The maximum gain of the 1st share I have sold this round
2:Maximum gain for the 2nd share I have held this round
3:Maximum gain for the 2nd share I have sold this round

```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        vector<vector<int> >dp(prices.size()+1,vector<int>(4,INT_MIN));
        dp[0][0]=-0x7f7f7f7f;
        for (int i=1;i<=prices.size();++i){
            dp[i][0]=max(dp[i-1][0],-prices[i-1]);
            dp[i][1]=max(dp[i-1][1],dp[i-1][0]+prices[i-1]);
            if (i==1) continue;
            dp[i][2]=max(dp[i-1][2],dp[i-1][1]-prices[i-1]);
            dp[i][3]=max(dp[i-1][3],dp[i-1][2]+prices[i-1]);
        }
        int ret=max(max(dp.back()[0],dp.back()[1]),max(dp.back()[2],dp.back()[3]));
        return max(ret,0);
    }
};
```
