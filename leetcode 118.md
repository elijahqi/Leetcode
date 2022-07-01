# Leetcode 118 Pascal's Triangle

```cpp
class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<vector<int> >ret(numRows);
        ret[0].push_back(1);
        if (numRows==1) return ret;
        ret[1].push_back(1);
        ret[1].push_back(1);
        for (int i=2;i<numRows;++i){
            ret[i].push_back(1);
            for (int j=0;j<i-1;++j){
                auto t=ret[i-1][j]+ret[i-1][j+1];
                ret[i].push_back(t);
            }
            ret[i].push_back(1);
        }
        return ret;
    }
};
```
