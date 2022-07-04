# Leetcode 202 Happy Number

Use unordered_set to remember all the possible solutions.
Then check whether there is a loop
```cpp
class Solution {
private:
    unordered_set<int> s;
    int get_next(int n){
        int ret=0;
        while(n){
            auto t=n%10;
            ret+=t*t;
            n/=10;
        }
        return ret;
    }
public:
    bool isHappy(int n) {
        s.insert(n);
        while(n!=1){
            n=get_next(n);
            auto t=s.insert(n);
            if (!t.second) return false;
        }
        return true;
    }
};
```
