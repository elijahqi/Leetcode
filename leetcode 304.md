# Leetcode 304 Range Sum Query 2D - Immutable


2d matrix sum
```cpp
class NumMatrix {
public:
    NumMatrix(vector<vector<int>>& matrix) {
        memset(sum,0,sizeof(sum));
        for (int i=1;i<=matrix.size();++i){
            for (int j=1;j<=matrix[i-1].size();++j){
                sum[i][j]=sum[i-1][j]+sum[i][j-1]+matrix[i-1][j-1]-sum[i-1][j-1];
            }
        }
    }
    
    int sumRegion(int row1, int col1, int row2, int col2) {
        row1;col1;row2++;col2++;
        return sum[row2][col2]-sum[row1][col2]-sum[row2][col1]+sum[row1][col1];
    }
private:
    int sum[220][220];
};

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix* obj = new NumMatrix(matrix);
 * int param_1 = obj->sumRegion(row1,col1,row2,col2);
 */
```
