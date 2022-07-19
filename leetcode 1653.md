# Leetcode 1653  Minimum Deletions to Make String Balanced


DP solution

```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int minimumDeletions(string s) {
        vector<vector<int> >dp(s.size()+1,vector<int>(2,inf));
        dp[0][0]=0;
        for (int i=1;i<=s.size();++i){
            if (s[i-1]=='a'){
                dp[i][0]=min(dp[i][0],dp[i-1][0]);
                
                dp[i][1]=min(dp[i][1],dp[i-1][1]+1);
            }else{
                dp[i][1]=min(dp[i][1],dp[i-1][0]);
                dp[i][1]=min(dp[i][1],dp[i-1][1]);
                dp[i][0]=min(dp[i][0],dp[i-1][0]+1);
            }
        }
        return min(dp[s.size()][0],dp[s.size()][1]);
    }
};
```

Simulation solution

```cpp
class Solution {
private:
    const int inf=0x7f7f7f7f;
public:
    int minimumDeletions(string s) {
        int cnta=0,cntb=0,ret=inf;
        for (int i=0;i<s.size();++i) cnta+=(s[i]=='a');
        ret=cnta;
        for (int i=0;i<s.size();++i) {
            if (s[i]=='a')  --cnta;
            else ++cntb;
            ret=min(ret,cnta+cntb);
        }
        return ret;
    }
};
```
