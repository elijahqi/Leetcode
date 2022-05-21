# Leetcode 347 Top K Frequent Elements

Use priority queue and follow the instruction
```cpp
class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        for (auto i:nums) ++mp[i];
        for (auto i:mp){
            q.push(make_pair(i.second,i.first));
        }
        vector<int> ret;int cnt=0;
        while(!q.empty()&&cnt<k){
            ret.push_back(q.top().second);q.pop();
            ++cnt;
        }
        return ret;
    }
private:
    unordered_map<int,int> mp;
    priority_queue<pair<int,int> >q;
};
```
