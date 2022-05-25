# Leetcode 1338 Reduce Array Size to The Half

Use unordered_map to record, and use sort to sort the vector.
```cpp
class Solution {
public:
    int minSetSize(vector<int>& arr) {
        for (int i:arr) ++mp[i];
        for (auto i:mp) cnt.push_back(i);
        sort(begin(cnt),end(cnt),[](auto &a,auto &b){return a.second>b.second;});
        int sz=arr.size(),tot=0;
        for (int i=0;i<cnt.size();++i){
            tot+=cnt[i].second;
            if(tot>=sz/2) return i+1;
        }
        return 0;
    }
private:
    unordered_map<int,int> mp;
    vector<pair<int,int> >cnt;
};
```
