# Leetcode 630 Course Schedule III

Use greedy algorithm, sort the courses according to their deadline.
Also use priority_queue to do the greedy.
Everytime, we need to add the courses firstly,if until now, our current time is over the deadline. We should delete the most time-consuming course so that we can have a better result in the future.
```cpp
class Solution {
public:
    int scheduleCourse(vector<vector<int>>& courses) {
        sort(courses.begin(),courses.end(),[](auto &a,auto &b){return a[1]<b[1];});
        priority_queue<int,vector<int> >q;
        int cur=0,cnt=0;
        for (int i=0;i<courses.size();++i){
            cur+=courses[i][0];
            q.push(courses[i][0]);
            if (cur>courses[i][1]){
                cur-=q.top();q.pop();
            }
        }
        return q.size();
    }
};
```
