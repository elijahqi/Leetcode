# Leetcode 2110
pre[i] means the maximum length of smooth sequence for then sequence ending at ith element.

```cpp
class Solution {
public:
    long long getDescentPeriods(vector<int>& prices) {
        long long ret=1;
       
        vector<int> pre(prices.size(),1);
        for (int i=1;i<prices.size();++i) {
            if (prices[i-1]-1==prices[i]){
                pre[i]=pre[i-1]+1;
            }
            ret+=pre[i];
        }
        
        return ret;
    }
};
```
