# Leetcode 484 find permutation


To this question, we can applied the greedy algorithm. Assume we don't have letter "D", then the permutation will from 1 to n is the smallest.
But here, we have letter D, to make ti smalles, we can change the consecutive to be small then we will have the answer.
```cpp
class Solution {
public:
    vector<int> findPermutation(string s) {
        int n=s.size();vector<int> ret;
        for (int i=0;i<=n;++i) ret.push_back(i+1);
        for (int i=0;i<n;++i){
            if (s[i]!='D') continue;int j=i;
            while(s[i]=='D'&&i<n)++i;
            reverse(ret.begin()+j,ret.begin()+i+1);--i;
        }
        return ret;
    }
};
```
