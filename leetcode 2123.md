# Leetcode 2123 Minimum Operations to Remove Adjacent Ones in Matrix


```cpp
class Solution {
private:
    vector<vector<int> >id;
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    vector<vector<int> >G;
    vector<int> match;
    vector<bool> vis;
    bool dfs(int x){
        for (int y:G[x]){
            if (vis[y]) continue;
            vis[y]=true;
            if (match[y]==-1||dfs(match[y])){
                match[y]=x;
                match[x]=y;
                return true;
            }
        }
        return false;
    }
public:
    int minimumOperations(vector<vector<int>>& grid) {
        id.resize(grid.size(),vector<int>(grid[0].size(),0));
        int cnt=0;
        for (int i=0;i<grid.size();++i)
            for (int j=0;j<grid[i].size();++j)
                id[i][j]=cnt++;
        G.resize(cnt);
         for (int i=0;i<grid.size();++i){
             for (int j=0;j<grid[i].size();++j){
                 if (!grid[i][j]) continue;
                 for (int k=0;k<4;++k){
                     int x=i+dir[k][0],y=j+dir[k][1];
                     if (x<0||x>=grid.size()||y<0||y>=grid[i].size()) continue;
                     if (!grid[x][y]) continue;
                     G[id[i][j]].push_back(id[x][y]);
                 }
             }
         }   
        match.resize(cnt,-1);
        int ans=0;
        for (int i=0;i<cnt;++i){
            if (match[i]!=-1) continue;
            vis.assign(cnt,false);
            if (dfs(i)) ++ans;
        }
        return ans;
    }
};
```
