# Leetcode 1963 1963. Minimum Number of Swaps to Make the String Balanced


Firstly, to pair all the [] greedy, and the left one will be unpaired.
And we make unpaired to be upper divided
```cpp
class Solution {
public:
    int minSwaps(string s) {
        int cnt=0,unmatch=0;
        for (auto c:s){
            if (c=='[') ++cnt;
            else --cnt;
            if (cnt<0) {
                unmatch++;cnt=0;
            }
        }
        return (unmatch+1)/2;// Upfloor integer division
    }
};
```
