# Leetcode 325 Maximum Size Subarray Sum Equals k

Pay attention to the situation that sum more than integer
```cpp
class Solution {
public:
    int maxSubArrayLen(vector<int>& nums, int k) {
        long long sum=0;
        unordered_map<int,int> mp;
        mp[0]=-1;
        int ret=0;
        for (int i=0;i<nums.size();++i){
            sum+=nums[i];
            auto find_it=mp.find(sum-k);
            if (find_it!=mp.end()){
                ret=max(ret,i-find_it->second);
            }
            find_it=mp.find(sum);
            if (find_it==mp.end()){
                mp[sum]=i;
            }
        }
        return ret;
    }
};
```
