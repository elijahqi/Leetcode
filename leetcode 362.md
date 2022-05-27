# Leetcode 362
 
 Use Queue to mock this process. If the queue's front is far more 300s than right now, then we should pop out the front
```cpp
class HitCounter {
public:
    HitCounter() {
        
    }
    
    void hit(int timestamp) {
        while(!q.empty()&&(q.front()+300)<=timestamp) q.pop();
        q.push(timestamp);
    }
    
    int getHits(int timestamp) {
        while(!q.empty()&&(q.front()+300)<=timestamp) q.pop();
        return q.size();
    }
private:
    queue<int >q;
};

/**
 * Your HitCounter object will be instantiated and called as such:
 * HitCounter* obj = new HitCounter();
 * obj->hit(timestamp);
 * int param_2 = obj->getHits(timestamp);
 */
```
