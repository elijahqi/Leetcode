# Leetcode 1312 Minimum Insertion Steps to Make a String Palindrome


```cpp
class Solution {
public:
    int minInsertions(string s) {
        vector<vector<int> >dp(s.size(),vector<int>(s.size(),0x7f7f7f7f));
        for (int i=0;i<s.size();++i) {
            dp[i][i]=0;
            for (int j=0;j<i;++j) dp[i][j]=0;
        }
        for (int l=0;l<s.size();++l){
            for (int i=0;i<s.size();++i){
                if(i+l>=s.size()) continue;
                int j=i+l;
                if (i==j) continue;
                if (s[i]==s[j]) dp[i][j]=min(dp[i+1][j-1],dp[i][j]);
                else{
                    dp[i][j]=min(dp[i][j-1]+1,dp[i][j]);
                    dp[i][j]=min(dp[i][j],dp[i+1][j]+1);
                }
            }
        }
        return dp[0][s.size()-1];
    }
};
```
