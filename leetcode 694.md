# Leetcode 694 Number of Distinct Islands

Use dfs to search for the pattern. We can use the direction as the pattern. and to distinguish, we need to add a letter 'X', after each search so that we can know where we did this direction change

```cpp
class Solution {
public:
    int numDistinctIslands(vector<vector<int>>& grid) {
        for (int i=0;i<grid.size();++i){
            for (int j=0;j<grid[i].size();++j){
                if (!grid[i][j]) continue;
                string s;
                dfs(i,j,s,grid);
                cout <<i<<" "<<j<<" "<<s<<endl;
                st.insert(s);
            }
            cout << "-----"<<endl;
            cout << st.size() <<endl;
        }
        return st.size();
    }
private:
    unordered_set<string> st;
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    char dic[4]={'R','L','D','U'};
    void dfs(int x,int y,string &s,vector<vector<int>> &grid){
        grid[x][y]=0;
        for (int k=0;k<4;++k){
            int t_x=x+dir[k][0];
            int t_y=y+dir[k][1];
            if (t_x<0||t_x>=grid.size()||t_y<0||t_y>=grid[0].size()) continue;
            if (!grid[t_x][t_y]) continue;
            s.push_back(dic[k]);
            dfs(t_x,t_y,s,grid);
            s.push_back('X');
        }
    }
};
```
