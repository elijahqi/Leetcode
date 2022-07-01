# Leetcode 66 Plus One


```cpp
class Solution {
public:
    vector<int> plusOne(vector<int>& digits) {
        vector<int> ret;
        int car=0;
        auto t=digits.back()+1;
        if (t>=10) t=0,car=1;
        ret.push_back(t);
        for (int i=digits.size()-2;i>=0;--i){
            auto t=digits[i]+car;
            car=0;
            if (t==10) t=0,car=1;
            ret.push_back(t);
        }
        if (car) ret.push_back(car);
        reverse(begin(ret),end(ret));
        return ret;
    }
};
```
