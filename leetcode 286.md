# Leetcode 286  Walls and Gates
Use BFS to search the minimum routes
```cpp
class Solution {
private:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
public:
    void wallsAndGates(vector<vector<int>>& rooms) {
        queue<pair<int,int> >q;
        for (int i=0;i<rooms.size();++i){
            for (int j=0;j<rooms[i].size();++j){
                if (!rooms[i][j]) q.push({i,j});
            }
        }
        while(!q.empty()){
            int sz=q.size();
            for (int i=0;i<sz;++i){
                auto t=q.front();q.pop();
                int x=t.first,y=t.second;
                for (int k=0;k<4;++k){
                    int _x=x+dir[k][0],_y=y+dir[k][1];
                    if (_x<0||_x>=rooms.size()||_y<0||_y>=rooms[0].size()) continue;
                    if (rooms[_x][_y]==-1) continue;
                    if (rooms[_x][_y]>rooms[x][y]+1){
                        rooms[_x][_y]=rooms[x][y]+1;
                        q.push({_x,_y});
                    }
                }
            }
        }
    }
};
```
