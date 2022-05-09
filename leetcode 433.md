#Leetcode 433


We can use dfs to do the search.
use mp as the flag to mark whether this word are discovered to avoid the infinite loop.
```cpp
class Solution {
public:
    int minMutation(string start, string end, vector<string>& bank) {
        ed=end;dp[start]=0x7f7f7f7f;
        for (int i=0;i<bank.size();++i) dp[bank[i]]=0x7f7f7f7f;
        dfs(start,bank);
        if(dp[start]==0x7f7f7f7f) return -1;else return dp[start];
    }
private:
    string ed;
    bool check(string &a,string &b){
        if (a.size()!=b.size()) return false;
        int dif=0;
        for (int i=0;i<a.size();++i) if (a[i]!=b[i])++dif;
        if (dif>1) return false;
        return true;
    }
    void dfs(string &cur,vector<string>&bank){
        if (cur==ed){
            dp[cur]=0;return;
        }
        
        if (dp[cur]!=0x7f7f7f7f) return;int mn=0x7f7f7f7f;
        if (mp[cur]) return;
        mp[cur]=true;
        for (int i=0;i<bank.size();++i){
            if (check(cur,bank[i])){
                dfs(bank[i],bank);
                if (dp[bank[i]]!=0x7f7f7f7f) mn=min(mn,dp[bank[i]]+1);
            }
        }
        mp[cur]=false;
        dp[cur]=mn;
    }
    unordered_map<string,bool> mp;
    unordered_map<string,int> dp;
};
```
