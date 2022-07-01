# Leetcode 1710 Maximum Units on a Truck

Sort+greedy
Put number of units first.
if number of units are the same, then we should compare their number of boxes. If smaller then put at the front.
```cpp
class Solution {
public:
    int maximumUnits(vector<vector<int>>& boxTypes, int truckSize) {
        sort(begin(boxTypes),end(boxTypes),[](auto &a,auto &b){return a[1]==b[1]?a[0]<b[0]:a[1]>b[1];});
        int ret=0,cut_sz=0;
        for (auto &b:boxTypes){
            for (int i=b[0];i>=0;--i){
                if (cut_sz+i<=truckSize){
                    cut_sz+=i;
                    ret+=i*b[1];
                    break;
                }
            }
            if (cut_sz==truckSize) break;
        }
        return ret;
    }
};
```
