# Leetcode 412 Fizz Buzz

```cpp
class Solution {
public:
    vector<string> fizzBuzz(int n) {
        vector<string> ret;
        for (int i=1;i<=n;++i){
            string tmp;
            if (i%3==0) tmp+="Fizz";
            if (i%5==0) tmp+="Buzz";
            if (tmp.empty()) tmp=to_string(i);
            ret.push_back(tmp);
        }
        return ret;
    }
};
```
