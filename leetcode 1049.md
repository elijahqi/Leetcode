# Leetcode 1049 Last Stone Weight II
You are given an array of nums. Each time you can choose two adjacent numbers to eliminate, leaving only the absolute value of the difference between them in place, and keep operating until only one number remains. Ask what is the minimum of this number? Analysis: Any complete elimination operation scheme actually corresponds to adding +/- signs in front of all numbers. For example, [1,4] => -1+4 = 3, [1,2,3] => -1-2+3 = 0
The converse does not hold, but has no effect on the question (finding the smallest positive number left). (No in-depth discussion)
This question can be transformed into an advanced version of 494. target sum: you are given an array of nums and can add positive and negative signs before each element. Ask what is the smallest positive number that makes the final overall result?

State definition: dp[i][s] => Consider whether it is feasible to add symbols to a subset of the first i elements only, with the resulting valuation being exactly s.
State transfer: the current valuation is s, what is the valuation of the previous round? s-nums[i] or s+nums[i].



```cpp
class Solution {
public:
    int lastStoneWeightII(vector<int>& stones) {
        const int n=stones.size();
        const int mx_sum=100*n;
        vector<vector<bool > >dp(n+1,vector<bool>(110*n*2,false));
        dp[0][mx_sum]=true;
        for (int i=0;i<n;++i){
            for (int j=0;j<=mx_sum*2;++j){
                if (!dp[i][j]) continue;
                auto t=j+stones[i];
                //cout << t<<endl;
                if (t>mx_sum*2||t<0) continue;
                dp[i+1][t]=true;
                t=j-stones[i];
                if (t>mx_sum*2||t<0) continue;
                dp[i+1][t]=true;
            }
        }
        int ret=0;
        for (int i=mx_sum;i<=mx_sum*2;++i) if (dp[n][i]) {ret=i-mx_sum;break;}
        return ret;
    }
};
```
