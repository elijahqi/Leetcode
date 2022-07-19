# Leetcode 1578 Minimum Time to Make Rope Colorful

Greedy Algorithm, try to delete all the numbers for a consecutive range except the maximum one.
```cpp
class Solution {
public:
    int minCost(string colors, vector<int>& neededTime) {
        int pre_color=-1;
        int ret=0,s=0,mx=0;
        for (int i=0;i<colors.size();++i){
            int col=colors[i]-'a';
            if (col!=pre_color){
                ret+=s-mx;
                s=mx=0;
            }
            pre_color=col;
            mx=max(neededTime[i],mx);
            s+=neededTime[i];
        }
        ret+=s-mx;
        return ret;
    }
};
```
