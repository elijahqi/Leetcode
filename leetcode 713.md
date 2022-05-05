# Leetcode 713

Sliding window, select each number as the start, if the end's product exceed K then stop, count the number.
```cpp
class Solution {
public:
    int numSubarrayProductLessThanK(vector<int>& nums, int k) {
        if (nums.empty()) return 0;
        if (nums.size()==1) return (nums[0]<k);
        long long pd=1;int ans=0;int r=0;
        for (int i=0;i<nums.size();++i){
            if(r<i) r=i,pd=1;
            while(r<nums.size()&&pd*nums[r]<k) pd*=nums[r],++r;
            ans+=r-i;pd/=nums[i];
        }
        return ans;
    }
};
```
