# Leetcode 926  Flip String to Monotone Increasing
use the last to record which is the last we have that is monotone
```cpp
class Solution {
public:
    int minFlipsMonoIncr(string s) {
        dp.resize(s.size()+1,vector<int>(2,0));
        for (int i=1;i<=s.size();++i){
            if (s[i-1]=='0'){
                dp[i][0]=dp[i-1][0];
                dp[i][1]=min(dp[i-1][0]+1,dp[i-1][1]+1);
            }
            if (s[i-1]=='1'){
                dp[i][1]=min(dp[i-1][1],dp[i-1][0]);
                dp[i][0]=dp[i-1][0]+1;
            }
        }
        int ret=INT_MAX;
        ret=min(dp[s.size()][0],dp[s.size()][1]);
        return ret;
    }
private:
    vector<vector<int> >dp;
};
```
