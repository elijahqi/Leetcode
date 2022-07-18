# Leetcode 1404 Number of Steps to Reduce a Number in Binary Representation to One

Simulation but do the simply simulation fro binary addition.
```cpp
class Solution {
public:
    int numSteps(string s) {
        int ret=0;
        while(s.size()>1){
            ++ret;
            if (s.back()=='1'){
                int car=0;
                s.back()++;
                for (int i=s.size()-1;i>=0;--i){
                    int t=s[i]-'0';
                    t+=car;
                    s[i]='0'+t%2;
                    car=t/2;
                }
                if (car) s.insert(0,"1");
            }else s.pop_back();
        }
        return ret;
    }
};
```
