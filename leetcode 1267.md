# Leetcode 1267 Count Servers that Communicate

Simulation,  don't need to consider the situations that for each pair, we only need to consider about each single nodes.
```cpp
class Solution {
public:
    int countServers(vector<vector<int>>& grid) {
        vector<int> r(grid.size());
        vector<int> c(grid[0].size());
        for (int i=0;i<grid.size();++i){
            for (int j=0;j<grid[0].size();++j){
                if (!grid[i][j]) continue;
                ++r[i];++c[j];
            }
        }
        int ret=0;
        for (int i=0;i<grid.size();++i){
            for (int j=0;j<grid[0].size();++j){
                if (grid[i][j]&&(c[j]>1||r[i]>1)) ++ret;
            }
        }
        return ret;
    }
};
```
