# Leetcode 1423 Maximum Points You Can Obtain from Cards
Loop through the first k numbers of the array, and then replace the n numbers at the end in turn
```cpp
class Solution {
public:
    int maxScore(vector<int>& cardPoints, int k) {
        int sum=0;
        if (k>=cardPoints.size()) k=cardPoints.size();
        for (int i=0;i<k;++i) sum+=cardPoints[i];
        int ret=sum;
        for (int i=0;i<k;++i) {
            sum-=cardPoints[k-i-1];
            sum+=cardPoints[cardPoints.size()-1-i];
            ret=max(ret,sum);
        }
        return ret;
    }
};
```
