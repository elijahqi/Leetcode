# Leetcode 575 Distribute Candies


```cpp
class Solution {
private:
    unordered_map<int,int> mp;
public:
    int distributeCandies(vector<int>& candyType) {
        for (int i:candyType) mp[i]++;
        return mp.size()<=(candyType.size()/2)?mp.size():(candyType.size()/2);
    }
};
```
