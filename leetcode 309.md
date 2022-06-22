# Leetcode 309 Best Time to Buy and Sell Stock with Cooldown
DP problem, we should set three situations.
One is rest(when we are undergoing rest).
The other one is sold. sold can only lead to rest.
rest can lead to new rest and rwest can lead to new hold.
```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        
        int hold=INT_MIN;
        int rest=0;
        int sold=0;
        for (auto p:prices){
            int pre_s =sold;
            sold=hold+p;
            hold=max(hold,rest-p);
            rest=max(rest,pre_s);
        }
        return max(rest,sold);
    }
};
```
