# Leetcode 52 N-queens
Same to leetcode 51, but only need to return the number.
```cpp
class Solution {
public:
    int totalNQueens(int n) {
        vector<bool> vis(5*n,true);
        dfs(0,n,vis);
        return ret;
    }
private:
    int ret;
    void dfs(int i,int n,vector<bool> &vis){
        if (i==n) {ret++;return;}
        for (int j=0;j<n;++j){
            if(vis[j]&&vis[n+i+j]&&vis[4*n+i-j]){
                vis[j]=vis[n+i+j]=vis[4*n+i-j]=false;
                dfs(i+1,n,vis);
                vis[j]=vis[n+i+j]=vis[4*n+i-j]=true;
            }
        }
    }
};

```
