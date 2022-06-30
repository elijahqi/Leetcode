# Leetcode 134  Gas Station
double difference array, and find the largest consecutive sequence in the array.
find the answer,then go though the whole array to see whether there is a negative number exist.
If so then return -1.
```cpp
class Solution {
public:
    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
        vector<int> df;
        for (int i=0;i<gas.size();++i) df.push_back(gas[i]-cost[i]);
        int last=0,mx=-1,id=0,ret=-1;
        for (int i=0;i<cost.size();++i) df.push_back(df[i]);
        for (int i=0;i<df.size();++i){
            if (last<0) last=0,id=i;
            last+=df[i];
            if (mx<last) mx=last,ret=id;
        }
        int sum=0;
        for (int i=ret;i<df.size();++i){
            sum+=df[i];
            if (sum<0) return -1;
        }
        for (int i=0;i<ret;++i){
            sum+=df[i];
            if (sum<0) return -1;
        }
        return ret;
    }
};
```
