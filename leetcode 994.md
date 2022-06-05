# Leetcode 994  Rotting Oranges

BFS search for all the orange
```cpp
class Solution {
public:
    int orangesRotting(vector<vector<int>>& grid) {
        vis.resize(grid.size(),vector<bool>(grid[0].size(),false));
        for (int i=0;i<grid.size();++i){
            for (int j=0;j<grid[0].size();++j){
                if (grid[i][j]==0) {vis[i][j]=true;continue;}
                if (grid[i][j]==1) continue;
                q.push(OR(i,j,0));vis[i][j]=true;
            }
        }
        int ret=0;
        while(!q.empty()){
            auto cur=q.front();q.pop();
            ret=cur.level;int x=cur.x,y=cur.y;
            for (int k=0;k<4;++k){
                int t_x=x+dir[k][0],t_y=y+dir[k][1];
                if (t_x<0||t_x>=grid.size()) continue;
                if (t_y<0||t_y>=grid[0].size()) continue;
                if (vis[t_x][t_y]) continue;
                vis[t_x][t_y]=true;
                q.push(OR(t_x,t_y,cur.level+1));
            }
        }
        bool flag=true;
        for (int i=0;i<grid.size();++i){
            for (int j=0;j<grid[0].size();++j){
                if (!vis[i][j]) {flag=false;break;}
            }
            if (!flag) break;
        }
        if (!flag) return -1;
        return ret;
    }
private:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    vector<vector<bool> >vis;
    struct OR{
        OR(int x_,int y_,int level_):x(x_),y(y_),level(level_){
            
        }
      int x,y,level;  
    };
    queue<OR >q;
};
```
