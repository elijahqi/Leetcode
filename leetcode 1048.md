# Leetcode 1048 Longest String Chain

Dynamic programming
Record how many word in every level it have, and use hash map to record this location.
THen use memorization to do the search.
```cpp
class Solution {
public:
    int longestStrChain(vector<string>& words) {
        v.resize(17);mp.resize(17);
        dp.resize(17);
        for (auto &i:words){
            v[i.size()].push_back(i);
            mp[i.size()][i]=v[i.size()].size()-1;
        }
        int ret=0;
        for (int i=16;i>=1;--i) dp[i].resize(v[i].size(),-1);
        for (int i=16;i>=1;--i){
            if(v[i].empty()) continue;
            for (int j=0;j<v[i].size();++j) ret=max(ret,dfs(i,j));
        }
        return ret;
    }
private:
    vector<vector<string> >v;
    vector<unordered_map<string,int> >mp;
    vector<vector<int> >dp;
    int dfs(int lev,int now){
        if (lev==1) return dp[lev][now]=1;
        if (dp[lev][now]!=-1) return dp[lev][now];
        int ret=0;
        for (int i=0;i<v[lev][now].size();++i){
            string s1=v[lev][now];
            s1.erase(i,1);
            auto find_it=mp[lev-1].find(s1);
            if (find_it==mp[lev-1].end()) continue;
            ret=max(ret,dfs(lev-1,find_it->second));
        }
        return dp[lev][now]=(ret+1);
    }
};
```
