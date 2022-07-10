# Leetcode 2335 Minimum Amount of Time to Fill Cups

```cpp
class Solution {
public:
    int fillCups(vector<int>& amount) {
        int cnt=0;
        sort(begin(amount),end(amount));
        while(1){
            if (!amount[0]&&!amount[1]&&!amount[2]) break;
            ++cnt;
            if (amount[1]) --amount[1];
            if (amount[2]) --amount[2];
            sort(begin(amount),end(amount));
        }
        return cnt;
    }
};
```
