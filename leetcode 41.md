# Leetcode 41 First Missing Positive

First pass, marking nums[i] to INT_MAX if nums[i] <= 0
Second pass, use a negative number to mark the presence of a number x at nums[x – 1]
Third pass, the first positive number is the missing index i, return i +1
If not found return n + 1.
```cpp
class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        for (auto &i:nums) if (i<=0) i=INT_MAX;
        for (auto &i:nums){
            int x=abs(i);
            if (x>=1&&x<=nums.size()&&nums[x-1]>0) nums[x-1]*=-1;
            
        }
        for (int i=0;i<nums.size();++i){
            if (nums[i]>0) return i+1;
        }
        return nums.size()+1;
    }
};
```
