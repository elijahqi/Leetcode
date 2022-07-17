# Leetcode 435 Non-overlapping Intervals

We have done a similar quesiton which requires us to put lines as many as possible. This quesiton requires us to remove least. Then we can have the maximum lines put on line. Then use total number to deduce the maximum, we will get the answer.
```cpp
class Solution {
public:
    int eraseOverlapIntervals(vector<vector<int>>& intervals) {
        sort(begin(intervals),end(intervals),[](auto &a,auto &b){
            return a[1]==b[1]?a[0]>b[0]:a[1]<b[1];
        });
        int ret=0;vector<vector<int> >ans;
        for (int i=0;i<intervals.size();++i){
            if (ans.empty()){
                ans.push_back(intervals[i]);
            }else{
                if (intervals[i][0]<ans.back()[1]) continue;
                ans.push_back(intervals[i]);
            }
        }
        return intervals.size()-ans.size();
    }
};
```
