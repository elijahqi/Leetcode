# Leetcode 51 N-Queens

We need to try to record the information.Since every line and every rwo can only have one queen. Thus, we can search line by line, and for each line, we can search coloumn by column.
How to record the diagonal, just record i+j and i-j will be fine.
```cpp
class Solution {
public:
    vector<vector<string>> solveNQueens(int n) {
        vector<string> vts(n,string(n,'.'));
        vector<bool> vis(5*n,true);
        dfs(vts,0,n,vis);
        return ret;
    }
private:
    vector<vector<string> >ret;
    void dfs(vector<string> &ans,int i,int n,vector<bool> &vis){
        if (i==n) {ret.push_back(ans);return;}
        for (int j=0;j<n;++j){
            if(vis[j]&&vis[n+i+j]&&vis[4*n+i-j]){
                ans[i][j]='Q';
                vis[j]=vis[n+i+j]=vis[4*n+i-j]=false;
                dfs(ans,i+1,n,vis);
                ans[i][j]='.';
                vis[j]=vis[n+i+j]=vis[4*n+i-j]=true;
            }
        }
    }
};
```
