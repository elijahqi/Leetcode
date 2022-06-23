# Leetcode 1229 Meeting Scheduler
Sliding window + two pointers.
check if two window still have intersection, then we should calculate the answer.
sort two slots to have monotonicity
```cpp
class Solution {
public:
    vector<int> minAvailableDuration(vector<vector<int>>& slots1, vector<vector<int>>& slots2, int duration) {
        vector<int> ret;
        sort(slots1.begin(),slots1.end(),[](auto &a,auto &b){return a[1]<b[1];});
        sort(slots2.begin(),slots2.end(),[](auto &a,auto &b){return a[1]<b[1];});
        int cur=0;
        for (auto &s:slots1){
            if ((s[1]-s[0])<duration) continue;
            while(cur<slots2.size()&&slots2[cur][1]<s[0]) ++cur;
            if (cur==slots2.size()) break;
            while(cur<slots2.size()&&slots2[cur][0]<=s[1]){
                int mx=max(slots2[cur][0],s[0]);
                int mn=min(slots2[cur][1],s[1]);
                if(mn-mx>=duration) {ret.push_back(mx),ret.push_back(mx+duration);return ret;}
                ++cur;
            }
        }
        return ret;
    }
};
```
