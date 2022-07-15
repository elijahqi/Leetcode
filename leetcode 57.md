# Leetcode 57 Insert Interval

This problem when I look at it firstly, I was thinking there were multiple intervals waiting to be inserted. However, it's only one. Thus, we only need to go though whole intervals and insert it to certain location.
Then go through all the intervals, and then modify if the last is not smaller than the next one.
```cpp
class Solution {
public:
    vector<vector<int>> insert(vector<vector<int>>& intervals, vector<int>& newInterval) {
        vector<vector<int> >ret;
        auto it=intervals.begin();
        for (;it!=intervals.end();++it)
            if ((*it)[0]<newInterval[0]) ret.push_back(*it);
            else break;
        intervals.insert(it,newInterval);
        for (auto &it:intervals)
            if (ret.empty()||it[0]>ret.back()[1]) ret.push_back(it);
            else ret.back()[1]=max(ret.back()[1],it[1]);
        return ret;
    }
};
```
