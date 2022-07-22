# Leetcode 767 Reorganize String
Use priority_queue and greedy algorithm to pop up two elements every time.And also this may caused by pigeon hole theorem, when the largest one greater than the half of the total size. Then it may not be able to form a string that no two characters are the same.
```cpp
class Solution {
public:
    string reorganizeString(string s) {
        unordered_map<char,int> mp;
        priority_queue<pair<int,char> >q;
        for (auto c:s) mp[c]++;
        for (auto &m:mp) q.push({m.second,m.first});
        string ret;
        if (q.top().first>(s.size()+1)/2) return ret;
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
