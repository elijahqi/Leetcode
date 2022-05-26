# Leetcode 128 Longest Consecutive Sequence

Firstly, sort.
Then use for loop to judge and don't forget to set the flag.
```cpp
class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        sort(begin(nums),end(nums));
        int pre=INT_MIN,mx=0,cnt=0;
        for (int i=0;i<nums.size();++i){
            if (nums[i]==pre) continue;
            if (nums[i]==(pre+1)){
                pre=nums[i];
                ++cnt;
                mx=max(mx,cnt);
                continue;
            }
            cnt=1;pre=nums[i];
            mx=max(mx,cnt);
        }
        return mx;
    }
};
```
