# Leetcode 2304 Minimum Path Cost in a Grid

Classical dp
```cpp
class Solution {
public:
    int minPathCost(vector<vector<int>>& grid, vector<vector<int>>& moveCost) {
        dp.resize(grid.size(),vector<int>(grid[0].size(),0x7f7f7f7f));
        for (int i=0;i<grid[0].size();++i) dp[0][i]=grid[0][i];
        for (int i=0;i<grid.size()-1;++i){
            for (int j=0;j<grid[i].size();++j){
                for (int k=0;k<grid[i].size();++k){
                    if((dp[i][j]+moveCost[grid[i][j]][k]+grid[i+1][k])<dp[i+1][k]){
                        dp[i+1][k]=dp[i][j]+moveCost[grid[i][j]][k]+grid[i+1][k];
                    }
                }
            }
        }
        int ret=0x7f7f7f7f;
        for (int i=0;i<grid[0].size();++i) ret=min(ret,dp[grid.size()-1][i]);
        return ret;
    }
private:
    vector<vector<int> >dp;
};
```
