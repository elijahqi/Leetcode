# Leetcode 1564 Put Boxes Into the Warehouse I
Since the boxes have to be continued to decrease, at least non-increase, thus we should prepare the warehouse such that each warehouse it the minimum from the first cell.
Then, since there has boxes that have the same height. Thus we should go back from last one to first one.
```cpp
class Solution {
public:
    int maxBoxesInWarehouse(vector<int>& boxes, vector<int>& warehouse) {
        int mn=warehouse[0];
        for (int i=1;i<warehouse.size();++i){
            mn=min(mn,warehouse[i]);
            warehouse[i]=mn;
        }
        sort(begin(boxes),end(boxes),greater<int>());
        int ret=0;
        int i=boxes.size()-1,j=warehouse.size()-1;
        while(i>=0&&j>=0){
            if (boxes[i]<=warehouse[j]) {
                --i;--j;++ret;
            }else --j;
        }
        return ret;
    }
};
```
