# Leetcodd 1216 Valid Palindrome III

This question is quite similar to leetcode 1312.
Use range DP to calculate the minimum number to remove. Finally judge whether it's less or equal to the given K

```cpp
class Solution {
public:
    bool isValidPalindrome(string s, int k) {
        vector<vector<int> >dp(s.size(),vector<int>(s.size(),0x7f7f7f7f));
        for (int i=0;i<s.size();++i){
            dp[i][i]=0;
            for (int j=0;j<i;++j){
                dp[i][j]=0;
            }
        }
        for (int l=0;l<s.size();++l){
            for (int i=0;i<s.size();++i){
                int j=i+l;
                if (j>=s.size()) continue;
                if (i==j) continue;
                if (s[i]==s[j]) dp[i][j]=min(dp[i][j],dp[i+1][j-1]);
                else{
                    dp[i][j]=min(dp[i+1][j],dp[i][j-1])+1;
                }
            }
        }
        return dp[0][s.size()-1]<=k;
    }
};
```
