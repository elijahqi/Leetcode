# Leetcode 115 Distinct Subsequences

Some middle calculation will exceed the integer. But the final answer won't be affected.
```cpp
class Solution {
// Check dp[i][j] means ith in S string jth in T string how many possible matches for both of them. The requirement is the character in S can be match but in T can not be match
public:
    int numDistinct(string s, string t) {
        if (s.empty()||t.empty()) return 0;
        vector<vector<uint> >dp(s.size()+1,vector<uint>(t.size()+1,0));
        for (int i=0;i<=s.size();++i) dp[i][0]=1;
        for (int i=1;i<=s.size();++i){
            for (int j=1;j<=t.size();++j){
                dp[i][j]=dp[i-1][j];
                if (s[i-1]==t[j-1]) dp[i][j]+=dp[i-1][j-1];
            }
        }
        return dp[s.size()][t.size()];
    }
};
```
