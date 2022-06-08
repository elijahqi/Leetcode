# Leetcode 525Contiguous Array

This problem gives us a problem that with only binary array.
We need to find the maximum length of the subarray that have same number of 0 and 1.
Cumulative sum is used in this quesiton, if we encounter 1 then sum+1 otherwise sum-1.
Then if this position have sum=x, we need to use hash map to find previous location which have the same sum.
Then we initialize the unordered_map with {0,-1};
```cpp
class Solution {
public:
    int findMaxLength(vector<int>& nums) {
        int sum=0,ret=0;
        unordered_map<int,int> mp{{0,-1}};
        for (int i=0;i<nums.size();++i){
            sum+=(nums[i]==1)?1:-1;
            auto find_it=mp.find(sum);
            if (find_it==end(mp)) mp[sum]=i;
            else ret=max(ret,i-find_it->second);
        }
        return ret;
    }
};
```
