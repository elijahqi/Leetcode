# Leetcode 2328 Number of Increasing Paths in a Grid

Look at the mod, we will consider using dynamic programming. 
To use DP, we should consider dp without after-effects.
Thus, we could sort all the elements in the matrix, and from the least go to the largest.
```cpp
class Solution {
const int mod=1e9+7;
public:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    int countPaths(vector<vector<int>>& grid) {
        vector<vector<int> >dp(grid.size(),vector<int>(grid[0].size(),1));
        vector<pair<int,pair<int,int> >> q;
        for (int i=0;i<grid.size();++i)
            for (int j=0;j<grid[0].size();++j) q.push_back({grid[i][j],{i,j}});
        sort(begin(q),end(q));
        for (int i=0;i<q.size();++i){
            int x=q[i].second.first,y=q[i].second.second;
            for (int k=0;k<4;++k){
                int _x=x+dir[k][0],_y=y+dir[k][1];
                if (_x<0||_x>=grid.size()) continue;
                if (_y<0||_y>=grid[0].size()) continue;
                if (grid[_x][_y]<=grid[x][y]) continue;
                dp[_x][_y]+=dp[x][y];
                dp[_x][_y]%=mod;
            }
        }
        int ret=0;
        for (int i=0;i<grid.size();++i){
            for (int j=0;j<grid[0].size();++j){
                ret+=dp[i][j];
                ret%=mod;
            }
        }
        return ret;
    }
};
```
