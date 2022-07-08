# Leetcode 712 Minimum ASCII Delete Sum for Two Strings

The minimum delete sum which is equal to the maximum same.
Then we can use the total score to deduct the maximum matched scores.
```cpp
class Solution {
public:
    int minimumDeleteSum(string s1, string s2) {
        int sum=0;
        for (auto i:s1) sum+=i;for (auto i:s2) sum+=i;
        vector<vector<int> > dp(s1.size()+1,vector<int>(s2.size()+1));
        for (int i=1;i<=s1.size();++i){
            for (int j=1;j<=s2.size();++j){
                if (s1[i-1]!=s2[j-1]) dp[i][j]=max(max(dp[i-1][j],dp[i-1][j-1]),dp[i][j-1]);
                else dp[i][j]=max(dp[i][j],dp[i-1][j-1]+s1[i-1]*2);
            }
        }
        return sum-dp[s1.size()][s2.size()];
    }
};
```
