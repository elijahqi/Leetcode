# Leetcode 716 Max Stack

For pop_max, we can use another temperary stack to find that and pop it from stack1.
And when push all the contents back to s1, we need to use the push function at the same time to maintain the stack2
```cpp
class MaxStack {
public:
    MaxStack() {
        
    }
    
    void push(int x) {
        s1.push(x);
        if (s2.empty()||x>=s2.top()) s2.push(x);
    }
    
    int pop() {
        int ret=s1.top();
        if (s1.top()==s2.top()) s2.pop();
        s1.pop();
        return ret;
    }
    
    int top() {
        return s1.top();
    }
    
    int peekMax() {
        return s2.top();
    }
    
    int popMax() {
        int mx=s2.top();
        stack<int> t;
        while(s1.top()!=mx){
            t.push(s1.top());s1.pop();
        }
        s1.pop();s2.pop();
        while(!t.empty()) {push(t.top());t.pop();}
        return mx;
        
    }
private:
    stack<int> s1,s2;
};

/**
 * Your MaxStack object will be instantiated and called as such:
 * MaxStack* obj = new MaxStack();
 * obj->push(x);
 * int param_2 = obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->peekMax();
 * int param_5 = obj->popMax();
 */
```
