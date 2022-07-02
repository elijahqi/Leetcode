# Leetcode 221 Maximal Square

Use dp to solve this problem.
DP[i][j] means the matrix that ends with i,j. What will the square end with i,j the length will have.
```cpp
class Solution {
public:
    int maximalSquare(vector<vector<char>>& matrix) {
        if (matrix.empty()) return 0;
        vector<vector<int> >dp(matrix.size(),vector<int>(matrix[0].size(),0));
        int ret=0;
        for (int i=0;i<matrix.size();++i){
            for (int j=0;j<matrix[i].size();++j){
                dp[i][j]=matrix[i][j]-'0';
                if (!dp[i][j]) continue;
                if (!i||!j){} else{
                    dp[i][j]=min(dp[i-1][j-1],min(dp[i-1][j],dp[i][j-1]))+1;    
                }
                ret=max(ret,dp[i][j]*dp[i][j]);
            }
        }
        return ret;
    }
};
```
