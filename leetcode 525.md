# Leetcode 525Contiguous Array

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
