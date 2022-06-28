# Leetcode 2321 Maximum Score Of Spliced Array


It needs us to swap consecutive substrings in the two strings.
Thus we should firstly, use first vector to minus the second vector.
Then applied dynamic programming to calculate the maximum consecutive sums.
```cpp
class Solution {
public:
    int maximumsSplicedArray(vector<int>& nums1, vector<int>& nums2) {
        int sum1=0,sum2=0;
        for (int i=0;i<nums1.size();++i) sum1+=nums1[i],sum2+=nums2[i];
        if (sum1>sum2) swap(nums1,nums2),swap(sum1,sum2);
        vector<int> it(nums1.size(),0);
        vector<int> it1(nums1.size(),0);
        for (int i=0;i<nums1.size();++i) it[i]=nums1[i]-nums2[i],it1[i]=nums2[i]-nums1[i];
        int last=0,ret=0;
        for (int i=0;i<nums1.size();++i) {
            last=max(0,last)+it[i];
            ret=max(last,ret);
        }
        int last1=0,ret1=0;
        for (int i=0;i<nums1.size();++i) {
            last1=max(0,last1)+it1[i];
            ret1=max(last1,ret1);
        }
        return max(sum2+ret,sum1+ret1);
    }
};
```
