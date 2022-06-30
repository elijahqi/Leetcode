# Leetcode 54 Spiral Matrix

If you find the conversion of subscripts in the above solution difficult, you can also use the following method with slightly simpler coordinates. For this spiral traversal method, the important thing is to determine the position of the top and bottom left and right four edges, so when initializing, the top edge up is 0, the bottom edge down is m-1, the left left is 0, the right right is n-1. Similarly, for the bottom, left, and right, the corresponding operations are performed in turn, which makes the coordinates very regular and less prone to errors

```cpp
class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        vector<int> ret;
        if (matrix.empty()||matrix[0].empty()) return ret;
        int up=0,left=0,right=matrix[0].size()-1,down=matrix.size()-1;
        while(1){
            for (int i=left;i<=right;++i) ret.push_back(matrix[up][i]);
            if (++up>down) break;
            for (int i=up;i<=down;++i) ret.push_back(matrix[i][right]);
            if (--right<left) break;
            for (int i=right;i>=left;--i) ret.push_back(matrix[down][i]);
            if (--down<up) break;
            for (int i=down;i>=up;--i) ret.push_back(matrix[i][left]);
            if (++left>right) break;
        }
        return ret;
    }
};
```
