# Leetcode 38 Count and Say

Do n times simulations.
```cpp
class Solution {
private:
    string gao(string &s){
        string ret;
        int st=0;
        for (int i=1;i<=s.size();++i){
            if (i==s.size()||s[i]!=s[st]){
                ret+='0'+i-st;
                ret+=s[st];
                st=i;
            }
        }
        return ret;
    }
public:
    string countAndSay(int n) {
        string ret="1";
        for (int i=1;i<n;++i) ret=gao(ret);
        return ret;
    }
};
```
