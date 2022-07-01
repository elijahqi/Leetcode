# Leetcode 172

e.g. 1000! has 249 trailing zeros:

1000/5 = 200

1000/25 = 40

1000/125 = 8

1000/625 = 1

200 + 40 + 8 + 1 = 249

alternatively, we can do the following

1000/5 = 200

200/5 = 40

40/5 = 8

8/5 = 1

1/5 = 0

200 + 40 + 8 + 1 + 0 = 249
```cpp
class Solution {
private:
    int fat(int n){
        return n<5?0:n/5+fat(n/5);
    }
public:
    int trailingZeroes(int n) {
        return fat(n);
    }
};
```
