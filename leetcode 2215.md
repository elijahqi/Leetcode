# Leetcode 2215 Find the Difference of Two Arrays

Time complexity o(nlogn), storage complexity o(1)
```cpp
class Solution {
public:
    vector<vector<int>> findDifference(vector<int>& nums1, vector<int>& nums2) {
        set<int> s1,s2;
        for (auto i:nums1) s1.insert(i);
        for (auto i:nums2) s2.insert(i);
        vector<vector<int> >ret(2);
        for (auto i:s1)
            if (s2.count(i)==0) ret[0].push_back(i);
        for (auto i:s2)
            if (s1.count(i)==0) ret[1].push_back(i);
        return ret;
    }
};
```
