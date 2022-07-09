# Leetcode 43 Multiply Strings


Simulation
```cpp
class Solution {
public:
    string multiply(string num1, string num2) {
        int l1=num1.size(),l2=num2.size();
        string ans(l1+l2,'0');
        for (int i=l1-1;i>=0;--i){
            for (int j=l2-1;j>=0;--j){
                int sum=(ans[i+j+1]-'0')+(num1[i]-'0')*(num2[j]-'0');
                ans[i+j+1]=sum%10+'0';
                ans[i+j]+=sum/10;
            }
        }
        for (int i=0;i<ans.size();++i){
            if (ans[i]!='0'||i==ans.size()-1) return ans.substr(i);
        }
        return ans;
    }
};
```
