# Leetcode 1051 Height Checker
Sort the original one,check each place whether it's same as the previous one.
If not the ++ the count
```cpp
class Solution {
public:
    int heightChecker(vector<int>& heights) {
        vector<int> a=heights;
        sort(a.begin(),a.end());
        int ret=0;
        for (int i=0;i<heights.size();++i) if(a[i]!=heights[i]) ++ret;
        
        return ret;
        
    }
};
```
