# Leetcode 2104 Sum of Subarray Ranges

Pre_process the sub interval min and max
```cpp
class Solution {
public:
    long long subArrayRanges(vector<int>& nums) {
        long long ret=0;
        for (int i=0;i<nums.size();++i){
            int mn=nums[i],mx=nums[i];
            for (int j=i;j<nums.size();++j){
                mn=min(mn,nums[j]);
                mx=max(mx,nums[j]);
                ret+=mx-mn;
            }
        }
        return ret;
    }
};
```
