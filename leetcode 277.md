# Leetcode 277

For loop where j traverses all numbers:

If knows(candidate, j) == 1 we eliminate the current candidate and set `candidate = j`.
If knows(candidate, j) == 0 we eliminate j=1 and keep the current candidate.
After running up all numbers, we will get a final candidate X. Also we know that, if a celebrity exists, it must be X.

Here is a tree that demonstrates all possible paths. At each level we will add a new number to compare with, so the height/time cost is theta(n).
Are we done? No. This final candidate X is just our best guess! Remember to check if X is the real celebrity!

Why? Because we only compared the final candidate X once, we don’t know the relationship between X and other numbers. Since there can be no celebrity, maybe X is not. We trust X just because other numbers are definitely not!

So, we need one more step to check X:

3. Check if knows(final candidate, k) == 0 && knows(k, final candidate) == 1. If true, it is the real celebrity that we are looking for.
```cpp
/* The knows API is defined for you.
      bool knows(int a, int b); */

class Solution {
public:
    int findCelebrity(int n) {
        int cele=0;
        for (int i=1;i<n;++i){
            if (knows(cele,i)) cele=i;
        }
        for (int i=0;i<n;++i){
            if (i==cele) continue;
            if (knows(cele,i)||!knows(i,cele)) return -1;
        }
        return cele;
    }
};
```
