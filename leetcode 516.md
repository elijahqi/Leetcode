# Leetcode 516 Longest Palindromic Subsequence


Don't forget to make dp[i][j] to be zero where i>j
```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int longestPalindromeSubseq(string s) {
        vector<vector<int> >dp(s.size(),vector<int>(s.size(),-inf));
        for (int i=0;i<s.size();++i)
            for (int j=0;j<i;++j) dp[i][j]=0;
        
        for (int l=0;l<s.size();++l){
            for (int i=0;i<s.size();++i){
                int j=i+l;
                if(j>=s.size()) continue;
                if (i==j) {dp[i][j]=1;continue;}
                if (s[i]==s[j]) dp[i][j]=max(dp[i][j],dp[i+1][j-1]+2);
                else{
                    dp[i][j]=max(dp[i][j-1],dp[i+1][j]);
                }
            }
        }
        return dp[0][s.size()-1];
    }
};
```
