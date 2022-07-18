# Leetcode 1074 Number of Submatrices That Sum to Target

Pre_process the pre fix sum. Then enumerate the column, use the same prefix idea to pre_process it(using unordered_map)

```cpp
class Solution {
public:
    int numSubmatrixSumTarget(vector<vector<int>>& matrix, int target) {
        int ret=0;
        for (auto &row:matrix)
            for (int i=1;i<row.size();++i) row[i]+=row[i-1];
        for (int i=0;i<matrix[0].size();++i){
            for (int j=i;j<matrix[0].size();++j){
                unordered_map<int,int> mp{{0,1}};
                int sum=0;
                for (int k=0;k<matrix.size();++k){
                    if (i>0) sum-=matrix[k][i-1];
                    sum+=matrix[k][j];
                    if (mp.count(sum-target)) ret+=mp[sum-target];
                    mp[sum]++;
                }
            }
        }
        return ret;
    }
};
```
