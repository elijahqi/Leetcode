# Leetcode 921


In this question, we only have one kind of parentheses. Thus we can only use o(1) space to solve this question.
if now =='(' we should need more "right" ")". However, if we currently do not have ")", we will add another "(" to balance this string,
```cpp
class Solution {
public:
    int minAddToMakeValid(string s) {
        int l=0,r=0;
        for (char c:s){
            if(c=='(') ++r;
            else if (r) --r;
            else ++l;
        }
        return l+r;
    }
};
```
