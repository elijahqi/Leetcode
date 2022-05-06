# Leetcode 933 Number of Recent Calls


Use queue to maintain the calls. And every time call RecentCounter, we need to have a new queue so that we can process next request.
And use the feature of queue, every time pop the not required element from the front of the queue.

```cpp
class RecentCounter {
public:
    RecentCounter() {
        q=queue<int>();
    }
    
    int ping(int t) {
        q.push(t);
        while(!q.empty()&&q.front()<(t-3000)) q.pop();
        return q.size();
    }
private:
    queue<int> q;
};

/**
 * Your RecentCounter object will be instantiated and called as such:
 * RecentCounter* obj = new RecentCounter();
 * int param_1 = obj->ping(t);
 */
```
