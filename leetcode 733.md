# Leetcode 733 Flood Fill
Dfs to fill the graph
```cpp
class Solution {
public:
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int newColor) {       
        vis.resize(image.size(),vector<bool>(image[0].size(),false));
        dfs(image,sr,sc,newColor,image[sr][sc]);
        return image;
    }
private:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    vector<vector<bool>> vis;
    void dfs(vector<vector<int>> &image,int x,int y,int nc,int oc){
        image[x][y]=nc;vis[x][y]=true;
        for (int k=0;k<4;++k){
            int t_x=x+dir[k][0],t_y=y+dir[k][1];
            if (t_x>=image.size()||t_x<0) continue;
            if (t_y>=image[0].size()||t_y<0) continue;
            if (vis[t_x][t_y]) continue;
            if (image[t_x][t_y]!=oc) continue;
            
            dfs(image,t_x,t_y,nc,oc);
        }
    }
    
};
```
