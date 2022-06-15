# Leetcode 72 Edit Distance
we can add, remove and change one of the element of the string. Thus if in the loop i,j are not the same. We can choose the min of them and add one to construct the answer.

```cpp
class Solution {
public:
    int minDistance(string word1, string word2) {
        int n1=word1.size(),n2=word2.size();
        vector<vector<int> >dp(n1+1,vector<int>(n2+1,INT_MAX));
        dp[0][0]=0;
        for (int i=1;i<=n1;++i) dp[i][0]=i;
        for (int j=1;j<=n2;++j) dp[0][j]=j;
        for (int i=1;i<=n1;++i){
            for (int j=1;j<=n2;++j){
                if (word1[i-1]==word2[j-1]) dp[i][j]=dp[i-1][j-1];
                else dp[i][j]=min(dp[i-1][j],min(dp[i-1][j-1],dp[i][j-1]))+1;
            }
        }
        return dp[n1][n2];
    }
};
```
