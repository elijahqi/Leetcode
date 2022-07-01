# Leetcode 84 Largest Rectangle in Histogram
Use stack, every time when encounter a smaller one, would calculate the previous answer. And also use the monotone stack, only sotre the increasing one.
```cpp
class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        stack<int> s;
        int l=0,ret=0;
        while(l<heights.size()){
            if (s.empty()||heights[s.top()]<=heights[l]) s.push(l++);
            else{
                auto t=s.top();
                s.pop();
                auto area=(s.empty()?l:l-s.top()-1)*heights[t];
                ret=max(ret,area);
            }
        }
        //Pop the reamining bars from the stack and calculate the area that is around by them.
        while(!s.empty()){
            auto t=s.top();
                s.pop();
                auto area=(s.empty()?l:l-s.top()-1)*heights[t];
                ret=max(ret,area);
        }
        return ret;
    }
};
```
