# Leetcode 867 Transpose Matrix

```cpp
class Solution {
public:
    vector<vector<int>> transpose(vector<vector<int>>& matrix) {
        vector<vector<int> >ret;
        ret.resize(matrix[0].size(),vector<int>());
        for (int i=0;i<matrix[0].size();++i){
            for (int j=0;j<matrix.size();++j){
                ret[i].push_back(matrix[j][i]);
            }
        }
        return ret;
    }
};
```
