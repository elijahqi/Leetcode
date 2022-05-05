# Leetcode 1823 Find the Winner of the Circular Game

This is a classic Joseph problem.
For Joseph problem, we have dp(n,m)=dp((n-1,m)+m)%n
dp(n,m) represents in total n people and every m people the m_th people will leave this circle.

```cpp
class Solution {
public:
    int findTheWinner(int n, int k) {
        int ret=0;
        for (int i=1;i<=n;++i){
            ret=(ret+k)%i;
        }
        return ret+1;
    }
};
```
