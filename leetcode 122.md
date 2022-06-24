# Leetcode 122 Best Time to Buy and Sell Stock II

Use greedy to tae every time that selling prices can be higher than the bought prices
```java
class Solution {
    public int maxProfit(int[] prices) {
        int mx=0;
        for (int i=1;i<prices.length;++i){
            if (prices[i]>prices[i-1]) mx+=prices[i]-prices[i-1];
        }
        return mx;
    }
}
```
