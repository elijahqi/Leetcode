# Leetcode 665 Non-decreasing Array


Use greedy algorithm.
If current i >= i-2 then we use i to replace i-1;
other wise, we use i-1 to replace i.
```java
class Solution {
    public boolean checkPossibility(int[] nums) {
        int cnt=1,n=nums.length;
        for (int i=1;i<n;++i){
            if (nums[i-1]>nums[i]){
                if (cnt==0) return  false;
                if (i==1||nums[i]>=nums[i-2]) nums[i-1]=nums[i];
                else nums[i]=nums[i-1];
                --cnt;
            }
        }
        return true;
    }
}
```
