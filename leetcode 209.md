# Leetcode 209 Minimum Size Subarray Sum

Use pre sum array to do the presuffix sum. And use o(n) time complexity to loop all the elements, use binary search to search for the point that can satisfy the requirement.
```cpp
class Solution {
public:
    int minSubArrayLen(int target, vector<int>& nums) {
        nums.push_back(0);
        sum.resize(nums.size()+1);sum[0]=0;
        for (int i=nums.size()-1;i>0;--i) nums[i]=nums[i-1];
        for (int i=1;i<nums.size();++i) sum[i]=sum[i-1]+nums[i];
        int mn=INT_MAX;
        for (int i=1;i<nums.size();++i){
            int l=i,r=nums.size()-1;
            while(l<r){
                int mid=(l+r)>>1;
                if (check(mid,i,target)) l=mid+1;
                else r=mid;
            }
            if ((sum[l]-sum[i-1])>=target) mn=min(mn,l-i+1);
        }
        return mn==INT_MAX?0:mn;
    }
private:
    vector<int> sum;
    bool check(int mid,int l,int target){
        if ((sum[mid]-sum[l-1])<target) return true;
        else return false;
    }
};
```
