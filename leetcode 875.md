# Leetcode 875 Koko Eating Bananas

Binary search the answer, and check whether it satisfy the requirement.
```cpp
class Solution {
public:
    int minEatingSpeed(vector<int>& piles, int h) {
        int mx=INT_MIN;
        for (int i=0;i<piles.size();++i) mx=max(mx,piles[i]);
        int l=1,r=mx;
        while(l<r){
            int mid=(l+r)>>1;
            if (check(mid,piles)<=h) r=mid;
            else l=mid+1;
        }
        return l;
    }
private:
    int check(int md,vector<int> &p){
        int ret=0;
        for (int i=0;i<p.size();++i) ret+=ceil((double)p[i]/md);
        return ret;
    }
};
```
