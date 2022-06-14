# Leetcode 261 Graph Valid Tree


The only thing should care about is to avoid to dfs the father again.
And also to construct a tree, the whole graph should be connected.
```cpp
class Solution {
public:
    vector<vector<int> >G;
    bool dfs(int x,vector<vector<int> >&edges,int fa){
        vis[x]=true;
        for (int i=0;i<edges[x].size();++i){
            int y=edges[x][i];
            if (y==fa) continue;
            if (vis[y]) return false;
            dfs(y,edges,x);
        }
        return true;
    }
    bool validTree(int n, vector<vector<int>>& edges) {
        G.resize(n,vector<int>());
        for (int i=0;i<edges.size();++i) G[edges[i][0]].push_back(edges[i][1]),
        G[edges[i][1]].push_back(edges[i][0]);
        vis.resize(n,false);
        if (!dfs(0,G,0)) return false;
        for (auto i:vis){
            if (!i) return false;
        }
        return true;
    }
private:
    vector<bool> vis;
    
};
```
