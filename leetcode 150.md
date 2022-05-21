# Leetcode 150 Evaluate Reverse Polish Notation

Use stack and judge whether each character is equal to the operator. If this character is equal to operator then we should pop two elements from the stack use the operator to do the operation.
Then push it back to the stack.

```cpp
class Solution {
public:
    int evalRPN(vector<string>& tokens) {
        int ret=0;
        stack<int> nb;
        for (int i=0;i<tokens.size();++i){
            if ((tokens[i].size()>1)||tokens[i][0]!='+'&&tokens[i][0]!='-'&&tokens[i][0]!='*'&&tokens[i][0]!='/'){
                nb.push(stoi(tokens[i]));
                
            }else{
                int a,b,t;
                b=nb.top();nb.pop();
                a=nb.top();nb.pop();
                if (tokens[i][0]=='+') t=a+b;
                if (tokens[i][0]=='-') t=a-b;
                if (tokens[i][0]=='*') t=a*b;
                if (tokens[i][0]=='/') t=a/b;
                nb.push(t);
            }
        }
        return nb.top();
    }
};
```
