# Leetcode 228 Summary Ranges

We should pay attention to the nums[i+j]-nums[i]. This may be exceed the maximum of integer.
```cpp
class Solution {
public:
    vector<string> summaryRanges(vector<int>& nums) {
        vector<string> ret;
        int i=0;
        while(i<nums.size()){
            int j=1;
            while(i+j<nums.size()&&(long long)nums[i+j]-nums[i]==j) ++j;
            ret.push_back(j==1?to_string(nums[i]):to_string(nums[i])+"->"+to_string(nums[i+j-1]));
            i+=j;
        }
        return ret;
    }
};
```
