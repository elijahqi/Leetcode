# Leetcode 956 Tallest Billboard

State definition: dp[i][d] => Consider the maximum value of the corresponding left length when choosing only a subset of the first i sticks and spelling out the difference between the left length and the right length as d.
State transfer: the current state is d, then what is the state of the previous round? d or d-hi or d+hi

```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int tallestBillboard(vector<int>& rods) {
        int mxd=accumulate(begin(rods),end(rods),0);
        vector<vector<int> > dp(rods.size()+1,vector<int>(mxd*2+10,-inf));
        dp[0][mxd]=0;
        for (int i=1;i<=rods.size();++i){
            for (int d=0;d<=2*mxd;++d){
                dp[i][d]=max(dp[i][d],dp[i-1][d]);
                if (d-rods[i-1]>=0)
                    dp[i][d]=max(dp[i-1][d-rods[i-1]]+rods[i-1],dp[i][d]);
                if (d+rods[i-1]<=2*mxd)
                    dp[i][d]=max(dp[i-1][d+rods[i-1]],dp[i][d]);
            }
        }
        return dp[rods.size()][mxd];
    }
};
```
