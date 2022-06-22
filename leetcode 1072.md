# Leetcode 1072 Longest Arithmetic Subsequence
The most straightforward way is to use a one-dimensional array where dp[i] represents the length of the longest series of equal differences in the interval [0, i], but it is difficult to find the state transfer equation if we define it this way. It is difficult to update the dp value without including this information because some hidden information is ignored, which is the equal difference value of the equal difference series. So here we need a two-dimensional array, dp[i][j] means the difference in the interval [0, i] in the longest equal difference series j length minus 1, here minus 1 because the starting number is not counted, but it does not matter, and then add back in the end on the line. There is one more thing to note, because the difference of the series may be negative, and the subscript of the array can not be negative, so you need to deal with it, the topic limits the range of numbers in the array between 0 and 500, so the range of the difference is between -500 and 500, you can add a 1000 to the difference, so the difference range is 500 to 1500, two-dimensional dp array of When updating the dp value, first iterate through the array, for each number iterated to, then iterate through all the previous numbers, calculate the diff value, then add 1000, then the dp[i][diff] can be assigned to dp[j][diff]+1, then use this new dp value to update the result res, and finally Don't forget to add 1 to res and return, see the code as follows.


```cpp
class Solution {
public:
    int longestArithSeqLength(vector<int>& nums) {
        int ret=0,n=nums.size();
        vector<vector<int> >dp(n,vector<int>(2000));
        for (int i=0;i<n;++i){
            for (int j=0;j<i;++j){
                int diff=nums[i]-nums[j]+1000;
                dp[i][diff]=dp[j][diff]+1;
                ret=max(ret,dp[i][diff]);
            }
        }
        return ret+1;
    }
};
```
