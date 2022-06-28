# Leetcode 1689 Partitioning Into Minimum Number Of Deci-Binary Numbers
Go through the string, and find the maximum num in the string, then return it reduce to zero.
```cpp
class Solution {
public:
    int minPartitions(string n) {
        int ret=0;
        for (int i=0;i<n.size();++i) ret=max(ret,(int)n[i]);
        return ret-'0';
    }
};
```
