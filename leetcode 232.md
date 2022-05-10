#Leetcode 232



Just use stack to mock the queue, every time have new element we push to the stack2, and if we want to pop then we will pop from stack1.

```cpp
class MyQueue {
public:
    MyQueue() {
        
    }
    
    void push(int x) {
        q2.push(x);
    }
    
    int pop() {
        int ret;
        if (!q1.empty()) {ret=q1.top();q1.pop();return ret;}
        while(!q2.empty()) {q1.push(q2.top());q2.pop();}
        ret=q1.top();
        q1.pop();
        return ret;
    }
    
    int peek() {
        int ret;
        if (!q1.empty()) {ret=q1.top();return ret;}
        while(!q2.empty()) {q1.push(q2.top());q2.pop();}
        ret=q1.top();
        return ret;
    }
    
    bool empty() {
        return q1.empty()&&q2.empty();
    }
private:
    stack<int> q1;
    stack<int> q2;
};

/**
 * Your MyQueue object will be instantiated and called as such:
 * MyQueue* obj = new MyQueue();
 * obj->push(x);
 * int param_2 = obj->pop();
 * int param_3 = obj->peek();
 * bool param_4 = obj->empty();
 */
```
