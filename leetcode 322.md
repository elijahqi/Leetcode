# Leetcode 322 Coin Change
The complete backpack model is similar to the 0-1 backpack, except that an item can be selected an infinite number of times instead of only once.

We can borrow the idea of the 0-1 backpack and define the state as the maximum value of the backpack with a capacity of when only the first item can be selected.

Note that although the definition is similar to that of the 0-1 backpack, the state transfer equation is not the same as that of the 0-1 backpack.

Consider a plain approach: for the first item, enumerate how many of them are selected to be transferred. The time complexity of doing so is the same as that of the 0-1 backpack.

The state transfer equation is as follows.


```cpp
class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        if(coins.empty()) return -1;
        memset(dp,0x7f,sizeof(dp));
        dp[0]=0;
        
        for (int i=0;i<coins.size();++i){
            for (int j=coins[i];j<=amount;++j){
                dp[j]=min(dp[j],dp[j-coins[i]]+1);
            }
        }
        return dp[amount]==0x7f7f7f7f?-1:dp[amount];
        
    }
    
private:
    int dp[11000];
};
```
