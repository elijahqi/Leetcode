# Leetcode 2315 Count Asterisks


```cpp
class Solution {
public:
    int countAsterisks(string s) {
        int ret=0,flag=0,num_s=0;
        for (int i=0;i<s.size();++i){
            if (s[i]=='|') {
                flag^=1;
                if (flag) ret+=num_s;
                num_s=0;
                continue;
            }
            if (s[i]=='*') ++num_s;
        }
        ret+=num_s;
        return ret;
    }
};
```
