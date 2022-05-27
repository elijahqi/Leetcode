# Leetcode 349 Intersection of Two Arrays


Use unordered_map to storage all the informaltion, and went through mp1 to find whether the element is in mp2.
This method is not efficient in memory but efficient in time complexity
```cpp
class Solution {
public:
    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {
        for (int i=0;i<nums1.size();++i) ++mp1[nums1[i]];
        for (int i=0;i<nums2.size();++i) ++mp2[nums2[i]];
        vector<int> ret;
        for (auto it:mp1){
            if (mp2.find(it.first)!=mp2.end()) ret.push_back(it.first);
        }
        return ret;
    }
private:
    unordered_map<int,int> mp1,mp2;
};
```
