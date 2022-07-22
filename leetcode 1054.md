# Leetcode 1054 Distant Barcodes
Keep the size of priority queue greater than 2. And don't forget to add the last one to the answer vector.

```cpp
class Solution {
public:
    vector<int> rearrangeBarcodes(vector<int>& barcodes) {
        vector<int> ret;
        unordered_map<int,int> mp;
        for (int i=0;i<barcodes.size();++i) mp[barcodes[i]]++;
        priority_queue<pair<int,int> >q;
        for (auto &m:mp) q.push({m.second,m.first});
        while(q.size()>1){
            auto t=q.top();q.pop();
            auto t1=q.top();q.pop();
            ret.push_back(t.second);
            ret.push_back(t1.second);
            t.first--;t1.first--;
            if (t.first) q.push(t);
            if (t1.first) q.push(t1);
        }
        if (!q.empty()) ret.push_back(q.top().second);
        return ret;
    }
};
```
