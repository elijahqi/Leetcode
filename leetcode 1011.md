# Leetcode 1011 Capacity To Ship Packages Within D Days

Binary search, we try to search every answer and see whether it can satisfy the answer.If it can, then mae the range smaller.
```cpp
class Solution {
bool check(int mx,vector<int>&weights,int days){
    int ret=1,sum=0;
    for (int i=0;i<weights.size();++i){
        if (weights[i]>mx) return false;
        if (sum+weights[i]>mx){
            sum=weights[i];++ret;
        }else sum+=weights[i];
    }
    return ret<=days;
}
public:
    int shipWithinDays(vector<int>& weights, int days) {
        int sum=accumulate(begin(weights),end(weights),0);
        int l=0,r=sum;
        while(l<r){
            int mid=(l+r)>>1;
            if (check(mid,weights,days)) r=mid;
            else l=mid+1;
        }
        return l;
    }
};
```
