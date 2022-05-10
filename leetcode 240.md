# Leetcode 240

Search the integer in 2-D arrays.
From EECS 281 course, we learn that we can search from the top right to the down left.
Since this matrix have sequence, thus frstly we search the first row, if it's greater than target, the we will move it to left.
if to some where we find that it's smaller than target. Then we will want to move downward since for the column, the bottom one will be bigger than previous one.
Finally, if we move out of the matrix, this indicates we can not find this exact value in this 2-D matrix.

Time complexity is m+n(number of rows+number of columns)
```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int row=0,col=matrix[0].size()-1;
        while(row<matrix.size()&&col>=0){
            while(col>=0&&matrix[row][col]>target) --col;
            if(row>=matrix.size()||col<0) break;
            if (matrix[row][col]==target) return true;
            while(row<matrix.size()&&matrix[row][col]<target)++row;
            if(row>=matrix.size()||col<0) break;
            if (matrix[row][col]==target) return true;
        }
        return false;
    }
};
```
