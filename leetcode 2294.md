# Leetcode 2294 Partition Array Such That Maximum Difference Is K

Sort and binary search
```cpp
class Solution {
public:
    bool check(vector<int> nums,int as,int k){
        int mn=INT_MAX,mx=INT_MIN;int cnt=1;
        for (int i=0;i<nums.size();++i){
            int mn1=min(mn,nums[i]);
            int mx1=max(mx,nums[i]);
            if ((mx1-mn1)>k){
                ++cnt;
                if (cnt>as) return false;
                mn=mx=nums[i];
            }
            mn=min(mn,nums[i]);
            mx=max(mx,nums[i]);
        }
        return true;
    }
    int partitionArray(vector<int>& nums, int k) {
        sort(nums.begin(),nums.end());
        int l=1,r=nums.size();
        while(l<r){
            int mid=(l+r)/2;
            if (check(nums,mid,k)) r=mid;
            else l=mid+1;
        }
        return l;
    }
};
```
