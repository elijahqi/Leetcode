# Leetcode 2338 Count the Number of Ideal Arrays

Correct the variable names first, then change back to ab ≡ 1(mod p) for b

p%a = p-(p/a)*a; in c++ / is integer division.

(p/a)*a = p-(p%a); change the position

(p/a)*a = -(p%a); p can be approximately dropped in the mod p sense and can be done without this step

a = -(p%a)/(p/a); change the position again

a-1 = -(p%a)-1*(p/a);

So a-1 can be introduced with (p%a)-1, so it is possible to use recursion to introduce the inverse of all numbers from 1 to a.


First we think about the problem by considering only the last number, and then assume that the last number is how much then we go to construct the previous case. Then first decompose the prime factors for the last number, and then use the combinatorial math partition method to count according to the number of times they appear
```cpp
#define N 400001
class Solution {
private:
    const int mod=1e9+7;
    long long factor[N],factorer[N],inv[N];
	void pre_(){
        factor[0]=factorer[0]=inv[1]=1;
        for (int i=2;i<N;++i) inv[i]=inv[mod%i]*(mod-mod/i)%mod;
        for (int i=1;i<N;++i) factor[i]=factor[i-1]*i%mod,factorer[i]=factorer[i-1]*inv[i]%mod;
    }
	long long calc(int NN,int CC){
        if (CC<0||CC>NN) return 0;
        return factorer[CC]*factor[NN]%mod*factorer[NN-CC]%mod;
    }
	long long calc1(long long p, long long q){
        return (p==0&&q==0)?1:calc(p+q-1,q);
    }
public:
    int idealArrays(int n, int maxValue) {
        pre_();
        long long ret=0;
		for (int i=1;i<=maxValue;++i){
            long long tmp=1;
            unordered_map<int,int> mp;
            int x=i;
            for (int j=2;j*j<=x;++j){
                while(x%j==0){
                    x/=j;++mp[j];
                }
            }
            if (x>1) ++mp[x];
            for (auto &m:mp) tmp=tmp*calc1(n,m.second)%mod;
            ret+=tmp;
            ret%=mod;
        }
		return ret;
    }
};
```
