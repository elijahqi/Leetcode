# Leetcode 1046

Use priority queue to mock this process, and the maintaining time complexity is only log(n)
```cpp
class Solution {
public:
    int lastStoneWeight(vector<int>& stones) {
        for (size_t i=0;i<stones.size();++i) q.push(stones[i]);
        while(q.size()>1){
            auto t1=q.top();q.pop();
            auto t2=q.top();q.pop();
            if (t1==t2) continue;
            q.push(max(t1,t2)-min(t1,t2));
        }
        if(q.empty()) return 0;
        return q.top();
    }
private:
    priority_queue<int,vector<int>, less<int> >q;
};
```
