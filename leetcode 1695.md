# Leetcode 1695 Maximum Erasure Value

Since this question requires the unique element.
Thus by using slding window, if it's not fall in the requirement, we should move the left point
```cpp
class Solution {
public:
    int maximumUniqueSubarray(vector<int>& nums) {
        memset(cnt,0,sizeof(cnt));
        int sum=0;int ret=0;int l=0;
        for (int i=0;i<nums.size();++i){
            ++cnt[nums[i]];sum+=nums[i];
            if (cnt[nums[i]]==1){
                ret=max(ret,sum);continue;
            }
            while(cnt[nums[i]]>1){
                cnt[nums[l]]--;
                sum-=nums[l++];
            }
        }
        return ret;
    }
private:
    int cnt[11000];
};
```
