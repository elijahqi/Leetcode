# Leetcode 97 Interleaving String
It's a feasibility issues, quite similar to leetcode 44.
only the element in s1==s3 or s2==s3 then we can judge whether we are able to advance one element to the next.
For the initialization, we should judge whether s1 or s2 is same to s3
```cpp
class Solution {
public:
    bool isInterleave(string s1, string s2, string s3) {
        int n1=s1.size(),n2=s2.size();
        if ((n1+n2)!=s3.size()) return false;
        vector<vector<bool> >dp(n1+1,vector<bool>(n2+1,false));
        dp[0][0]=1;
        for (int i=1;i<=n2;++i) if (s2[i-1]==s3[i-1]) dp[0][i]=1; else break;
        for (int i=1;i<=n1;++i) if (s1[i-1]==s3[i-1]) dp[i][0]=1; else break;
        for (int i=1;i<=n1;++i){
            for (int j=1;j<=n2;++j){
                if (dp[i-1][j]&&s1[i-1]==s3[i+j-1]) dp[i][j]=1;
                if (dp[i][j-1]&&s2[j-1]==s3[i+j-1]) dp[i][j]=1;
            }
        }
        return dp[n1][n2];
    }
};
```
