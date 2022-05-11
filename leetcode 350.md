# Leetcode 350 Intersection of Two Arrays II

if both number in nums1 ans nums2 appeared, then we push_back the minimum number of them.
```cpp
class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
        for (int i:nums1) ++mp1[i];
        for (int i:nums2) ++mp2[i];
        for (auto i:mp1){
            if (mp2.find(i.first)!=mp2.end()){
                int mn=min(i.second,mp2[i.first]);
                
                for (int j=0;j<mn;++j) ret.push_back(i.first);
                
            }
        }
        return ret;
    }
private:
    unordered_map<int,int> mp1,mp2;
    vector<int> ret;
};
```
