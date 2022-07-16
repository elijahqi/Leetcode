# Leetcode 688 688 Knight Probability in Chessboard


Use Dp to calculate the number of movements that the knight can stay on the chessboard finally. The total nubmer of possible movements will be 8^k.
Then we sum all the ways on the chessboard and then divided by the total possibilities
```cpp
class Solution {
private:
    int dir[8][2]={{-2,-1},{-1,-2},{1,-2},{2,-1},{2,1},{1,2},{-1,2},{-2,1}};
public:
    double knightProbability(int n, int k, int row, int column) {
        vector<vector<double> >dp(n,vector<double>(n,0));
        dp[row][column]=1;
        for (int owo=1;owo<=k;++owo){
            vector<vector<double> >dp1(n,vector<double>(n,0));
            for (int i=0;i<n;++i){
                for (int j=0;j<n;++j){
                    for (int kk=0;kk<8;++kk){
                        int x=i+dir[kk][0],y=j+dir[kk][1];
                        if (x<0||x>=n||y<0||y>=n) continue;
                        dp1[x][y]+=dp[i][j];
                    }
                }
            }
            swap(dp,dp1);
        }
        double ret=0;
        for (int i=0;i<n;++i)
            for (int j=0;j<n;++j) ret+=dp[i][j];
        double total=pow(8.0,k);
        return ret/total;
    }
};
```
