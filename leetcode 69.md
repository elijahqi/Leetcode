# Leetcode 69 Sqrt(x)

I set the criteria to be greater than x than change my r.
Thus the final answer will be r.
 ```cpp
 class Solution {
public:
    int mySqrt(int x) {
        if (x<1) return 0;
        long long l=1,r=x;
        while(l<=r){
            long long mid=l+r>>1;
            if (mid*mid>x) r=mid-1;
            else l=mid+1;
        }
        return r;
    }
};
 ```
