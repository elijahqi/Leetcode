# Leetcode 2327 Number of People Aware of a Secret

We set dp[i] as the the number of people that newly know the secret on the i_th day.
```cpp
class Solution {
private:
    const int mod=1e9+7;
public:
    
    int peopleAwareOfSecret(int n, int delay, int forget) {
        vector<int >dp(n+1,0);
        dp[1]=1;
        long long now=0;
        //dp[i] represents how many net people share the secret at the date i
        for (int i=2;i<=n;++i){
            long long new_people=dp[max(0,i-delay)];// New people know the secret
            long long forget_people=dp[max(0,i-forget)]; // the people that will forget the secret
            now+=(new_people+(-forget_people+mod)%mod)%mod;
            now%=mod;
            dp[i]=now;
        }
        int ret=0;
        for (int i=n-forget+1;i<=n;++i) ret+=dp[i],ret%=mod;
        return ret;
    }
};
```
