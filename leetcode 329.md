# Leetcode 329 Longest Increasing Path in a Matrix

```cpp
class Solution {
public:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    int longestIncreasingPath(vector<vector<int>>& matrix) {
        vector<pair<int,pair<int,int> > >q;
        for (int i=0;i<matrix.size();++i){
            for (int j=0;j<matrix[i].size();++j){
                q.push_back(make_pair(matrix[i][j],make_pair(i,j)));
            }
        }
        sort(begin(q),end(q));
        vector<vector<int> >dp(matrix.size(),vector<int>(matrix[0].size(),1));
        for (int i=0;i<q.size();++i){
            auto t=q[i].second;
            for (int k=0;k<4;++k){
                int _x=t.first+dir[k][0];
                int _y=t.second+dir[k][1];
                if (_x<0||_x>=matrix.size()) continue;
                if (_y<0||_y>=matrix[0].size()) continue;
                if (matrix[_x][_y]<=matrix[t.first][t.second]) continue;
                dp[_x][_y]=max(dp[_x][_y],dp[t.first][t.second]+1);
            }
        }
        int ret=0;
        for (int i=0;i<matrix.size();++i){
            for (int j=0;j<matrix[i].size();++j){
                ret=max(ret,dp[i][j]);
            }
        }
        return ret;
    }
};
```
