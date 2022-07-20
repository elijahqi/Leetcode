# Leetcode 1730 Shortest Path to Get Food

Bfs to find the minimum path
```cpp
class Solution {
private:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
public:
    int getFood(vector<vector<char>>& grid) {
        pair<int,int> st;
        bool flag=false;
        vector<vector<bool> >vis(grid.size(),vector<bool>(grid[0].size(),false));
        for (int i=0;i<grid.size();++i){
            if (flag) break;
            for (int j=0;j<grid[i].size();++j)
                if (grid[i][j]=='*') {st.first=i,st.second=j;flag=true;break;}
        }
        queue<pair<int,int> >q;
        q.push(st);
        int ret=0;
        while(!q.empty()){
            int sz=q.size();++ret;
            for(int owo=1;owo<=sz;++owo){
                auto cur=q.front();q.pop();
                vis[cur.first][cur.second]=true;
                for (int k=0;k<4;++k){
                    int x=cur.first+dir[k][0];
                    int y=cur.second+dir[k][1];
                    if (x<0||x>=grid.size()||y<0||y>=grid[0].size()) continue;
                    if (grid[x][y]=='X') continue;
                    if (grid[x][y]=='#') return ret;
                    if(vis[x][y]) continue;
                    vis[x][y]=true;
                    q.push({x,y});
                }
            }
        }
        return -1;
    }
};
```
