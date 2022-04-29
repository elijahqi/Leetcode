# Leetcode 785

exactly same as 886. Possible Bipartition
```cpp
class Solution {
public:
    bool dfs(int x,int c){
        vis[x]=c;
        for (int &y:g[x]){
            if (vis[y]==vis[x]) return false;
            if (vis[y]) continue;
            if (!dfs(y,-c)) return false;
        }
        return true;
    }
    bool isBipartite(vector<vector<int>>& graph) {
        int n=graph.size();g=graph;
        vis=vector<int> (n,0);
        for (int i=0;i<n;++i){
            if (vis[i]) continue;
            if (!dfs(i,1)) return false;
        }
        return true;
    }
private:
    vector<int> vis;
    vector<vector<int> >g;
};
```
