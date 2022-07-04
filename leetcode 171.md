# Leetcode 171 Excel Sheet Column Number


```cpp
class Solution {
public:
    int titleToNumber(string columnTitle) {
        int ret=0;
        for (int i=columnTitle.size()-1;i>=0;--i){
            auto t=columnTitle[i]-'A'+1;
            t*=pow(26,columnTitle.size()-1-i);
            ret+=t;
        }
        return ret;
    }
};
```
