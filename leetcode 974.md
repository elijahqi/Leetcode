# Leetcode 974 Subarray Sums Divisible by K


```cpp
class Solution {
public:
    int subarraysDivByK(vector<int>& nums, int k) {
        unordered_map<int,int> mp;
        int sum=0,ret=0;
        mp[0]=1;
        for (int i=0;i<nums.size();++i){
            sum+=nums[i];sum%=k;sum+=k;sum%=k;
            auto find_it=mp.find(sum);
            if (find_it==mp.end()) {
                ret+=0;
            }else{ret+=find_it->second;}
            mp[sum]++;
        }
        return ret;
    }
};
```
