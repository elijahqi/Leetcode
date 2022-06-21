# Leetcode 1642 Furthest Building You Can Reach

Binary search for the answer and use greedy algorithm to check the answer.
We need to choose the number of ladders, maximum differences, then the other should use bricks.
If answer is okay, then we change the left otherwise, we change the right.
```cpp
class Solution {
public:
    int furthestBuilding(vector<int>& heights, int bricks, int ladders) {
        int n=heights.size();
        if (ladders>=n-1)  return n-1;
        vector<int> dif(n);
        for (int i=0;i<n-1;++i) {
            dif[i]=heights[i+1]-heights[i];
            dif[i]=max(0,dif[i]);
        }
        int l=ladders,r=n;
        while(l<r){
            int mid=(l+r)>>1;
            vector<int> df(begin(dif),begin(dif)+mid);
            nth_element(begin(df),end(df)-ladders,end(df));
            if (accumulate(begin(df),end(df)-ladders,0)>bricks) r=mid;
            else l=mid+1;
        }
        return l-1;
    }
};
```
