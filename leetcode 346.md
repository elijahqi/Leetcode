#Leetcode 346 Moving Average from Data Stream


Use deque to mock moving slding window

```cpp
class MovingAverage {
public:
    MovingAverage(int size) {
        sz=size;
    }
    
    double next(int val) {
        
        if (q.size()+1<=sz){
            q.push_back(val);
            sum+=val;
            return (double)sum/q.size();
        }
        sum-=q.front();
        q.pop_front();
        q.push_back(val);
        sum+=val;
        return (double)sum/q.size();
    }
private:
    int sz,sum=0;
    deque<int> q;
};

/**
 * Your MovingAverage object will be instantiated and called as such:
 * MovingAverage* obj = new MovingAverage(size);
 * double param_1 = obj->next(val);
 */
```
