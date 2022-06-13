# Leetcode 1658 Minimum Operations to Reduce X to Zero
First, let's translate the target value X. Because the question is actually asking about a subarray in the middle of the array that satisfies its sum = the sum of all the numbers in the array - some numbers on both sides, so the target value X = the sum of all the elements of the array totalSum - the sum of some elements on the left - the sum of some elements on the right.
So this problem can be transformed into finding a subarray with sum totalSum - x and trying to maximize the length of this subarray so that we can find the minimum number of elements to remove.
```cpp
class Solution {
public:
    int minOperations(vector<int>& nums, int x) {
        int target=0;
        for (int i:nums) target+=i;
        if (target==x) return nums.size();
        target-=x;
        mp[0]=-1;
        int ret=INT_MIN,sum=0;
        for (int i=0;i<nums.size();++i){
            sum+=nums[i];
            auto find_it=mp.find(sum-target);
            if (find_it!=mp.end()){
                ret=max(ret,i-find_it->second);
            }
            mp[sum]=i;
        }
        return ret==INT_MIN?-1:nums.size()-ret;
    }
private:
    unordered_map<int,int> mp;
};
```
