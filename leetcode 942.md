# Leetcode 942 DI String Match


We can use greedy algorithm to construct this problem.
Assume we have 0 - n this permutation , we want to construct this problem.
Then we need to find the consecutive D, and since this feature, we can reverse the whole "D" area then the new permutation then be constructed.
```cpp
class Solution {
public:
    vector<int> diStringMatch(string s) {
        int n=s.size();
        vector<int> ret; 
        for (int i=0;i<=n;++i) ret.push_back(i);
        for (int i=0;i<n;++i){
            if (s[i]!='D') continue;int j=i;
            while(s[i]=='D'&&i<n)++i;
            reverse(ret.begin()+j,ret.begin()+i+1);--i;
        }
        return ret;
    }
};
```
