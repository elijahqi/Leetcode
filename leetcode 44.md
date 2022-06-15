# leetcode 44 Wildcard Matching

1. if p[j]='?' then it must match the ith element in the s, dp[i][j]=dp[i-1][j-1]
2. for p[j]='*' it can match the arbitrary elements for the string s.
3. if p[j] is ordinary char, then it must be the exactly same as the ith element in the s string

Then we should consider the edge cases.
```
s=""
p=****
```

if p[j]=='\*' then we can use the dp value in the previous j-1
```cpp
class Solution {
public:
    bool isMatch(string s, string p) {
        int ls=s.size(),lp=p.size();
        vector<vector<bool> >dp(ls+1,vector<bool>(lp+1,false));
        dp[0][0]=true;
        for (int i=1;i<=lp;++i){
            if (p[i-1]!='*') break;
            dp[0][i]=true;
        }
        for (int i=1;i<=ls;++i){
            for (int j=1;j<=lp;++j){
                if (p[j-1]=='?') {
                    dp[i][j]=dp[i-1][j-1];
                }
                else if (p[j-1]=='*') {
                    dp[i][j]=dp[i-1][j]||dp[i][j-1];
                }
                else if (p[j-1]==s[i-1]) dp[i][j]=dp[i-1][j-1];
            }
        }
        return dp[ls][lp];
    }
};
```
