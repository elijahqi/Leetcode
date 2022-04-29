# Leetcode 886 Possible Bipartition

Since not all nodes are connected, we need to loop through all N nodes and find where we need to process from those that have not been processed.
THen we can use dfs or bfs to color all the vertices.

## BFS method
```cpp
class Solution {
public:
    bool possibleBipartition(int n, vector<vector<int>>& dislikes) {
        vector<vector<int> > g(n);
        // To define the color, we will use 0 as unknow, and 1 as red and -1 as blue just described in the problem
        vector<int> vis(n,0); 
        for (const auto &e:dislikes)
            g[e[1]-1].push_back(e[0]-1),
            g[e[0]-1].push_back(e[1]-1);
        // 
        for (int i=0;i<n;++i){
            if (vis[i]) continue;
            q.push(i);vis[i]=1;// Force every vertex to be red.
            while(!q.empty()){
                int x=q.front();q.pop();
                for (int &y:g[x]){
                    if (vis[y]==vis[x]) return false;
                    if (vis[y]) continue;
                    vis[y]=-vis[x];
                    q.push(y);
                }
            }
        }
        return true;
    }
private:
    
    queue<int> q;
    
    
};
```

## DFS method

```cpp
class Solution {
public:
    bool dfs(int x,int c){
        vis[x]=c;
        for (int &y:g[x]){
            if (vis[y]==vis[x]) return false;
            if(vis[y]) continue;
            if (!dfs(y,-c)) return false;
        }
        return true;
    }
    bool possibleBipartition(int n, vector<vector<int>>& dislikes) {
        g=vector<vector<int> >(n);
        vis=vector<int> (n,0);
        for (const auto &e:dislikes)
            g[e[1]-1].push_back(e[0]-1),
            g[e[0]-1].push_back(e[1]-1);
        for (int i=0;i<n;++i){
            if (vis[i]) continue;
            if (!dfs(i,1)) return false;
        }
        return true;
    }
private:
    
    queue<int> q;
    vector<vector<int> > g;
        // To define the color, we will use 0 as unknow, and 1 as red and -1 as blue just described in the problem
        vector<int> vis; 
    
};
```
