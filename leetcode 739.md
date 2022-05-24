# Leetcode 739 Daily Temperatures

This algorithm only use o(n) time complexity and o(1) auxiliary space.
It will iterate from end to the begining, and the start point is assigned to the location just one after current position.
And just follow that sequence to jump will be fine.
```cpp
class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& temp) {
        vector<int> ret(temp.size());
        for (int i=temp.size()-1;i>=0;--i){
            int j=i+1;
            while(j<temp.size()&&temp[i]>=temp[j]){
                if (ret[j]) j=ret[j]+j;
                else j=temp.size();
            }
            if (j<temp.size()) ret[i]=j-i;
        }
        return ret;
    }
};
```
