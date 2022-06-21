# Leetcode 542 01 Matrix


Since the answer can be come from every four directions. And repeat the path can not make the anwer better.
Thus we can from the left top end to the right low end do loop one time.
Then we can from the right low end to left top end do the loop again.
```cpp

class Solution {
public:
    vector<vector<int>> updateMatrix(vector<vector<int>>& mat) {
        ret.resize(mat.size(),vector<int>(mat[0].size(),0));
        for (int i=0;i<mat.size();++i){
            for (int j=0;j<mat[0].size();++j){
                if (!mat[i][j]) continue;
                ret[i][j]=INT_MAX;
            }
        }
        
        for (int i=0;i<mat.size();++i){
            for (int j=0;j<mat[i].size();++j){
                int x_=i+1,y_=j;
                int x_1=i,y_1=j+1;
                if (x_<mat.size()){
                    if (ret[i][j]!=INT_MAX){
                        ret[x_][y_]=min(ret[x_][y_],ret[i][j]+1);
                    }
                }
                if (y_1<mat[0].size()){
                    if (ret[i][j]!=INT_MAX){
                        ret[x_1][y_1]=min(ret[x_1][y_1],ret[i][j]+1);
                    }
                }
            }
        }
        for (int i=mat.size()-1;i>=0;--i){
            for (int j=mat[i].size()-1;j>=0;--j){
                int x_=i-1,y_=j;
                int x_1=i,y_1=j-1;
                if (x_>=0){
                    if (ret[i][j]!=INT_MAX){
                        ret[x_][y_]=min(ret[x_][y_],ret[i][j]+1);
                    }
                }
                if (y_1>=0){
                    if (ret[i][j]!=INT_MAX){
                        ret[x_1][y_1]=min(ret[x_1][y_1],ret[i][j]+1);
                    }
                }
            }
        }
        
        return ret;
    }
private:
    vector<vector<int> >ret;
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    vector<vector<bool> >vis;
    void dfs(int x,int y){
        if (vis[x][y]) return;
        vis[x][y]=true;
        int mn=ret[x][y];
        for (int i=0;i<4;++i){
            int x_=x+dir[i][0],y_=y+dir[i][1];
            if (x_<0||x_>=vis.size()||y_<0||y_>=vis[0].size()) continue;
            dfs(x_,y_);
            mn=min(mn,ret[x_][y_]);
        }
        if (!ret[x][y]) return;
        ret[x][y]=mn+1;
    }
};
```
