# Leetcode 2128 Remove All Ones With Row and Column Flips
Assuming that there is a series of operations that can achieve all flips to 0, then the order of these operations is arbitrarily disrupted, which should not affect the final result. So we might as well do only column flipping first, then row flipping.

I can imagine that if I want to achieve all 0s by flipping some rows, there can only be one case: the elements of these rows have been flipped several times to 1. Considering that the operation of column flipping affects multiple rows, this means that the column elements of these rows must be equal.

Similarly, if some rows can achieve all zeros without row flipping, there is only one case: the elements of these rows have previously been turned into zeros by several column flipping, which means that the column elements of these rows must be equal, considering that the operation of column flipping affects several rows.

In summary, there are only two possible patterns for all rows in the original matrix, and both patterns happen to be mutually exclusive (i.e., 001101 and 110010). This gives us a number of rows with all 1's and a number of rows with all 0's after a number of column flips.


```cpp
class Solution {
public:
    bool removeOnes(vector<vector<int>>& grid) {
        for (int i=1;i<grid.size();++i){
            bool flag=true;
            for (int j=0;j<grid[0].size();++j){
                if (grid[0][j]==grid[i][j]) continue;
                flag=false;break;
                
                
            }
            if (flag) continue;flag=true;
            for (int j=0;j<grid[0].size();++j){
                if (grid[0][j]==(1-grid[i][j])) continue;
                flag=false;break;
            }
            if (flag) continue;
            return false;
            
        }
        return true;
    }
};
```
