# Leetcode 2223 Sum of Scores of Built Strings

This question requires us to calculate each suffix array 's common string with the whole string. And add them together and then return back.
We can definitely use suffix array or SAM, but one more easier method will be uesing Z-algorithm.(also called ex kmp)


Then we can introduce the z algorithm.
The majority is refer to https://oi-wiki.org/string/z-func/

```cpp
class Solution {
using ll = long long;
public:
    long long sumScores(string s) {
        int n=int(s.size());
        vector<int> z(n);
        for (int i=1,l=0,r=0;i<n;++i){
            if (i<=r && z[i-l]<r-i+1) z[i]=z[i-l];
            else {
                z[i]=max(0,r-i+1);
                while(i+z[i]<n&&s[z[i]]==s[i+z[i]])++z[i];
            }
            if (i+z[i]-1>r) l=i,r=i+z[i]-1;
        }z[0]=n;
        ll sum=0;
        for (int e:z) sum+=e;
        return sum;
    }
};
```
