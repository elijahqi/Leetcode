# Leetcode 2342 Max Sum of a Pair With Equal Sum of Digits


```cpp
class Solution {
private:
    unordered_map<int,vector<int> > mp;
    int calc(int x){
        int ret=0;
        while(x){
            ret+=x%10;
            x/=10;
        }
        return ret;
    }
public:
    int maximumSum(vector<int>& nums) {
        for (int i=0;i<nums.size();++i){
            int ct=calc(nums[i]);
            mp[ct].push_back(nums[i]);
        }
        int ret=-1;
        for (auto &m:mp){
            sort(begin(m.second),end(m.second));
            if(m.second.size()<2) continue;
            ret=max(ret,m.second.back()+m.second[m.second.size()-2]);
        }
        return ret;
    }
};
```
