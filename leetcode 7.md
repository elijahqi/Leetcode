# Leetcode 7
Firstly, we look at whether it's negative.
And divide 10 each time to change to a string ,and reverse it then times the negative sign.


```cpp
class Solution {
public:
    int reverse(int x) {
        long long  tmp=x;
        long long ret=0;
        bool f=x<0?1:0;
        if (tmp<0) tmp*=-1;
        while(tmp>0) ret*=10,ret+=tmp%10,tmp/=10;
        if (ret>INT_MAX) return 0;
        if (f) ret*=-1;
        return ret;
    }
};
```
