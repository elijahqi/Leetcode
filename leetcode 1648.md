# Leetcode 1648 Sell Diminishing-Valued Colored Balls

The basic strategy for this problem is to arrange all the colors in descending order of quantity. We prioritize taking a ball for the color with the highest current number (a), so that the total value + a. Then we take a ball for the color with the highest current remaining number (b) (which may still be the same color), so that the total value + b... until we reach the number of operations inorders.

As an example, after we sort the inventory from highest to lowest, suppose the array looks like this.

10 7 4 3 2 1
Round 1: The largest value of 10 is our operation goal, we take a ball and add 10 points to the total value. But after taking it, we find that the maximum number of colors is still it, but 9 balls, meaning we can still take another ball to add another 9 points. We can keep taking this color until the number of that color is equal to the number of the second most colors (both 7). So this round our value increase is (10+9+8).

Round 2: The current value of the largest 7 is our target for the operation. Note that this time we can take 2 balls: the two colors that include the first and the second in the number of colors. In addition, we can take from +7, +6, all the way to +5 (because the third highest number of colors is 4), so the increased value is (7+6+5)*2

It can be seen that for each turn, we advance one color. When dealing with the ith color, we can take i+1 balls in one round, which correspond to the same score, from inventory[i], inventory[i]+1... up to inventory[i+1]+1.

One of the more critical points here is that we must stop when the total number of balls reaches orders. In which round of which round to stop, and what is the "zero", need to be handled properly. From the above, we can see that in round i, each round can take i+1 balls, so we need to do q = orders/(i+1) rounds, and the remaining fractions r = orders%(i+1) balls corresponding to the score of inventory[i]-q.

Another point of note is that for 10 10 8 .... In this case, according to the algorithm described above, there is actually no need to do any operation in the first round because the first and second have the same number of colors. In the second round of the operation it is straightforward to take both balls together.


```cpp
class Solution {
private:
    const int mod=1e9+7;
public:
    int maxProfit(vector<int>& inventory, int orders) {
        sort(rbegin(inventory),rend(inventory));
        const int n=inventory.size();
        long long cnt=0,cur=inventory[0],ret=0;
        while(orders){
            while(cnt<n&&inventory[cnt]==cur) ++cnt;
            int nxt=cnt==n?0:inventory[cnt];
            int ct=min((long long)orders,cnt*(cur-nxt));
            int t=cur-nxt;
            int r=0;
            if (orders<cnt*(cur-nxt)){
                t=orders/cnt;
                r=orders%cnt;
                
            }
            long long nxt_p=cur-t;
            ret+=(cur+nxt_p+1)*t/2*cnt%mod+nxt_p*r%mod;
            ret%=mod;
            orders-=ct;cur=nxt;
        }
        return ret;
    }
};
```
