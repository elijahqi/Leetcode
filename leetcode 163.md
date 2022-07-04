# Leetcode 163 Missing Ranges

Check some tricky cases.This question asks us to find the missing interval, similar to the previous Summary Ranges, given a range of space [lower upper], the range of the missing interval needs to be within the given interval. If the current number num is greater than lower, it means that there is a missing interval and at least one lower number is missing, if num-1 is greater than lower, it means that the missing interval is an interval [lower, num-1], otherwise just one number can be added. Since OJ has added many tricky test cases, many solutions on the forum have failed. In fact, many of them are knee-deep in integer overflow, when the array has an integer maximum, when lower is updated to num+1, it will overflow, so before updating, we should judge first, if num is already an integer maximum, return the result directly to res; otherwise, update lower and continue the loop. for loop exit, there may still be a missing interval, that is, at this time lower is still less than or equal to upper, the number lower can be missing

```cpp
class Solution {
public:
    vector<string> findMissingRanges(vector<int>& nums, int lower, int upper) {
        vector<string> ret;
        for (auto nm:nums){
            if(nm>lower) ret.push_back(to_string(lower)+(nm-1>lower?"->"+ to_string(nm-1):""));
            if (nm==upper) return ret;
            lower=nm+1;
        }
        if (lower<=upper) ret.push_back(to_string(lower)+(upper>lower?("->"+to_string(upper)):""));
        return ret;
    }
};
```
