# Leetcode 149 Max Points on a Line

```cpp
class Solution {
private:
    bool check_same(vector<int> &a,vector<int> &b){
        return a[0]==b[0]&&a[1]==b[1];
    }
    double calc(vector<int> &a,vector<int> &b){
        if (a[0]==b[0]) return numeric_limits<double>::max();
        if (a[1]==b[1]) return 0;
        return ((double)a[0]-b[0])/(a[1]-b[1]);
    }
public:
    int maxPoints(vector<vector<int>>& points) {
        if (points.size()<2) return points.size();
        unordered_set<string> s;
        int ret=1;// THis is the maximum number of points in one line.
        for (int i=0;i<points.size()&&(s.find(to_string(points[i][0])+"-"+to_string(points[i][1]))==s.end());++i){
            auto p=points[i];
            unordered_map<double,int> mp;
            int same=0,local_mx=1;
            for (int j=i+1;j<points.size();++j){
                if (check_same(p,points[j])) continue;
                auto slope=calc(p,points[j]);
                mp[slope]=mp.count(slope)==0?2:++mp[slope];
                local_mx=max(local_mx,mp[slope]);
                
            }
            s.insert(to_string(points[i][0])+"-"+to_string(points[i][1]));
            ret=max(ret,local_mx);
        }
        return ret;
    }
};
```
