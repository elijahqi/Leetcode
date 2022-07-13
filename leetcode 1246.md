# Leetcode 1246 Palindrome Removal
State definition: copy problem dp[i][j] => For string s[i:j], delete one of the palindromes substring at a time and ask how many times the deletion is completed.
Transfer of states.
The first level of loops is the interval size.
The second level loop is the starting point.
Thousands of ways to transfer dp[i][j] of the large interval to dp[i'][j'] of the small interval.


```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int minimumMoves(vector<int>& arr) {
        const int n=arr.size();
        vector<vector<int> >dp(n+2,vector<int>(n+2,inf));
        for (int i=1;i<=n+1;++i)
            for (int j=0;j<=i;++j) dp[i][j]=0;
        for (int l=0;l<n;++l){
            for (int i=1;i<=n;++i){
                int j=l+i;
                if (j>n) continue;
                if (i==j) {dp[i][j]=1;continue;}
                for (int k=i;k<=j;++k){
                    if (arr[k-1]==arr[j-1]){
                        dp[i][j]=min(dp[i][j],dp[i][k-1]+max(1,dp[k+1][j-1]));
                    }
                }
            }
        }
        return dp[1][n];
    }
};
```
