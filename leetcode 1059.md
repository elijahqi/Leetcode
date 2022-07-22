# Leetcode 1059 All Paths from Source Lead to Destination

Use memorization search to check all the situations.
```cpp
class Solution {
private:
    vector<vector<int> >G;
    vector<int> dp;
    vector<bool> vis;
    bool dfs(int x,vector<vector<int> >&edges,int destination){
        if (dp[x]!=-1) return dp[x];
        if (x==destination) return true;
        if (edges[x].size()==0) return false;
        bool flag=true;vis[x]=true;
        for (auto y:edges[x]){
            if (vis[y]) {flag=false;break;}
            flag&=dfs(y,edges,destination);
        }
        vis[x]=false;
        dp[x]=flag;
        return flag;
    }
public:
    bool leadsToDestination(int n, vector<vector<int>>& edges, int source, int destination) {
        G.resize(n);
        dp.resize(n,-1);
        for (auto &e:edges) G[e[0]].push_back(e[1]);
        vis.resize(n,false);
        if (G[destination].size()>0) return false;
        return dfs(source,G,destination);
    }
};
```
