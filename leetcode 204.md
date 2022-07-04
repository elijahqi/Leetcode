# Leetcode 204 Count Primes
The sieve of Euler.

```cpp
class Solution {
public:
    int countPrimes(int n) {
        if (!n) return 0;
        vector<int> prime;
        vector<bool> not_prime(n,false);
        not_prime[1]=true;
        for (int i=2;i<n;++i){
            if (!not_prime[i]) prime.push_back(i);
            for (int j=0;prime[j]*i<n;++j){
                not_prime[prime[j]*i]=true;
                if (i%prime[j]==0) break;
            }
            
        }
        return prime.size();
    }
};
```

