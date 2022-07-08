# Leetcode 727 Minimum Window Subsequence

Let dp[i][j] be the situation that we at the position of s1[i], and we try to match the first j of s2.
How many characters in s1 do we need at least.
Then we shoud judge the special case that we don't have any match in the string
```cpp
class Solution {
public:
    string minWindow(string s1, string s2) {
        vector<vector<int> >dp(s1.size()+1,vector<int>(s2.size()+1,0x7f7f7f7f));
        dp[0][0]=0;
        for (int i=1;i<=s1.size();++i) dp[i][0]=0;
        for (int i=1;i<=s1.size();++i){
            for (int j=1;j<=s2.size();++j){
                if (s1[i-1]==s2[j-1]){
                    if (dp[i-1][j-1]==0x7f7f7f7f) continue;
                    dp[i][j]=min(dp[i][j],dp[i-1][j-1]+1);
                }else{
                    dp[i][j]=min(dp[i][j],dp[i-1][j]+1);
                }
            }
        }
        int ret=0x7f7f7f7f,id=-1;
        for (int i=1;i<=s1.size();++i) if (ret>dp[i][s2.size()]) ret=dp[i][s2.size()],id=i;
        if (id==-1) return "";
        return s1.substr(id-dp[id][s2.size()],ret);
        
    }
};
```
