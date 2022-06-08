# Leetcode 1151 Minimum Swaps to Group All 1's Together
Find number of 1 in the vector, and then use the sliding window to find the maximum number of 1 that a subarray contains.
Then use the total number of 1 to minus the maximum number of 1.
```cpp
class Solution {
public:
    int minSwaps(vector<int>& data) {
        int num1=count(begin(data),end(data),1);
        int sum1=0,mx=0;
        for (int i=0;i<data.size();++i){
            if(i>=num1&&data[i-num1]) --sum1;
            if (data[i]) ++sum1;
            mx=max(mx,sum1);
        }
        return num1-mx;
    }
};
```
