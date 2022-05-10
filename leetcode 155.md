# Leetcode 155
This minimum stack has an additional function compared to the original stack, which is to return the minimum value of the stack. Two stacks are used to implement this, one to store the data pushed in in order and the other to store the minimum value that has occurred. The code is as follows:
```cpp
class MinStack {
public:
    MinStack() {
        
    }
    
    void push(int val) {
        s1.push(val);
        if (s2.empty()||val<=s2.top()) s2.push(val);
    }
    
    void pop() {
        if (s1.top()==s2.top()) s2.pop();
        s1.pop();
    }
    
    int top() {
        return s1.top();
    }
    
    int getMin() {
        return s2.top();
    }
private:
    stack<int> s1,s2;
};

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack* obj = new MinStack();
 * obj->push(val);
 * obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->getMin();
 */
```
