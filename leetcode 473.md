# Leetcode 473 Matchsticks to Square

Firstly, we should check the sum to check whether it is divisible by 4.
Then we use status compression dp.
There is a wait list that can be used to check which status is satisfied with the target number.
Then each time we check the wait vector to see whether they don't have intersetction with previous one. If not we combine them together to be the half. Then we check whether both half can be used to satisfy 
```cpp
class Solution {
public:
    bool makesquare(vector<int>& matchsticks) {
        int sum=0;
        for (auto m:matchsticks) sum+=m;
        if (sum%4) return false;
        int n=matchsticks.size(),all=(1<<n)-1,target=sum/4;
        vector<int> wait,validhf(1<<n,false);
        for (int i=0;i<=all;++i){
            int cur=0;
            for (int j=n;j>=0;--j)
                if ((i>>j)&1) cur+=matchsticks[j];
            if (cur==target){
                for (int x:wait){
                    if (x&i) continue;
                    int half=x|i;
                    validhf[half]=true;
                    if (validhf[all^half]) return true;
                }
                wait.push_back(i);
            }
        }
        return false;
    }
};
```
