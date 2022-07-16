# Leetcode 576 Out of Boundary Paths

dp[i][j][s] means when we stand at the position i,j with s steps. How many possibilities do we have.
If we go out of the boundary then the number of methods will only be one.
```cpp
class Solution {
private:
    const int mod=1e9+7;
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
public:
    int findPaths(int m, int n, int maxMove, int startRow, int startColumn) {
        vector<vector<vector<int> > >dp(m,vector<vector<int> >(n,vector<int>(maxMove+1,0)));
        for (int s=1;s<=maxMove;++s){
            for (int i=0;i<m;++i){
                for (int j=0;j<n;++j){
                    for (int k=0;k<4;++k){
                        int x=i+dir[k][0];
                        int y=j+dir[k][1];
                        if (x<0||y<0||x>=m||y>=n){
                            dp[i][j][s]+=1;
                        }else{
                            dp[i][j][s]=(dp[i][j][s]+dp[x][y][s-1])%mod;
                        }
                    }
                }
            }
        }
        return dp[startRow][startColumn][maxMove];
    }
};
```
