# Leetcode 74 Search a 2D Matrix

This 2-D Array can be changed to 1-D array, just use binary search and then use that result to the size of each line to be the row number and the remainder to be the column number.

```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int n=matrix.size();
        int m=matrix[0].size();
        int sz=n*m-1;
        int l=0,r=sz;
        while(l<r){
            int mid=(l+r)>>1;
            int row=mid/m;
            int col=mid%m;
            if (matrix[row][col]>=target) r=mid;
            else l=mid+1;
        }
        if (matrix[l/m][l%m]!=target) return false;
        else return true;
    }
};
```
