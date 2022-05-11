# Leetcode 73 Set Matrix Zeroes


How to use O(1) space to solve this problem. We can use the first row and first column to deal with this problem. 
But one thing we need to remember is that we need to deal with the situation that we originally have 0 in the first column or first row.
```cpp
class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        
        bool col=false,row=false;
        for (int i=0;i<matrix.size();++i) row|=matrix[i][0]==0;
        for (int i=0;i<matrix[0].size();++i) col|=matrix[0][i]==0;
        
        
        for (int i=1;i<matrix.size();++i){
            for (int j=1;j<matrix[i].size();++j){
                if (!matrix[i][j]){
                    matrix[i][0]=matrix[0][j]=0;
                }
            }
        }
        for (int i=1;i<matrix.size();++i){
            if (!matrix[i][0]){
                for (int j=0;j<matrix[i].size();++j) matrix[i][j]=0;
            }
        }
        for (int i=1;i<matrix[0].size();++i){
            if (!matrix[0][i]){
                for (int j=0;j<matrix.size();++j) matrix[j][i]=0;
            }
        }
        if (row) for (int i=0;i<matrix.size();++i) matrix[i][0]=0;
        if (col) for (int i=0;i<matrix[0].size();++i) matrix[0][i]=0;
    }
};
```
