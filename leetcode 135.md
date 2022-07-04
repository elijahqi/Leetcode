# Leetcode 135 Candy

Sort all the values from least to the highest .
To make sure every decision will not have after-effects.
```cpp
class Solution {
public:
    int candy(vector<int>& ratings) {
        vector<pair<int,int> >q;
        for (int i=0;i<ratings.size();++i) q.push_back(make_pair(ratings[i],i));
        sort(begin(q),end(q));
        vector<int> dp(ratings.size(),0);
        for (int i=0;i<q.size();++i){
            auto id=q[i].second;
            auto l=(id==0)?0:dp[id-1];
            auto r=(id==q.size()-1)?0:dp[id+1];
            if(!l&&!r) {dp[id]=1;continue;}
            if (id!=0&&ratings[id]<=ratings[id-1]) l=0;
            if (id!=(dp.size()-1)&&ratings[id+1]>=ratings[id]) r=0;
            dp[id]=max(l,r)+1;
        }
        int ret=0;
        for (int i=0;i<dp.size();++i) ret+=dp[i];
        return ret;
    }
};
```
