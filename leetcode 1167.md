# Leetcode 1167. Minimum Cost to Connect Sticks
Use heap to maintain the minimum two sticks.
Every time, we pop the minimum two sticks add them together.
And add the sum of them to the final result
```cpp
class Solution {
public:
    int connectSticks(vector<int>& sticks) {
        priority_queue<int,vector<int>,greater<int> >q(begin(sticks),end(sticks));
        int ret=0;
        while(q.size()>1){
            auto t=q.top();q.pop();
            auto t1=q.top();q.pop();
            ret+=t1+t;
            q.push(t1+t);
        }
        //if (!q.empty()) ret+=q.top();
        return ret;
    }
};
```
