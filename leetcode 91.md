# Leetcode 91  Decode Ways

Memorization Search
```cpp
class Solution {
public:
    int numDecodings(string s) {
        rett=0;
        memset(dp,0,sizeof(dp));
        
        return dfs(s,0);
        
    }
private:
    string ret;
    int rett;
    bool flag;
    int dp[110];
    int dfs(string &s,int id){
        if (id==s.size()) {return 1;}
        if (dp[id]) return dp[id];
        if (s[id]=='0') return dp[id];
        ret.push_back('A'+s[id]-'1');
        dp[id]=dfs(s,id+1);
        
        ret.pop_back();
        if ((id+1)==s.size()) return dp[id];
        if(s[id]=='2'&&s[id+1]>'6') return dp[id];
        if (s[id]>'2') return dp[id];
        ret.push_back('A'+(s[id]-'0')*10+s[id+1]-'1');
        dp[id]+=dfs(s,id+2);
        ret.pop_back();
        return dp[id];
    }
};
```
