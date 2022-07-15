# Leetcode 218 The Skyline Problem


Two tricky things we should remember, then apply the scan line algorithm.
```cpp
class Solution {
private:
    using pa=pair<int,int>;
    multiset<int> hp;
    int max_h(){
        if (hp.empty()) return 0;
        return *hp.rbegin();
    }
public:
    vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {
        vector<pa> lines;
        for (auto &bd:buildings)
            lines.push_back({bd[0],bd[2]}),
            lines.push_back({bd[1],-bd[2]});
        sort(begin(lines),end(lines),[](const auto &a,const auto &b){ 
            return a.first==b.first? a.second>b.second:a.first<b.first;
        });
        vector<vector<int> >ret;
        for (auto &l:lines){
            int x=l.first,h=abs(l.second);
            bool e_t=l.second>0;
            if (e_t){
                if (h>max_h()) {
                    vector<int> t;t.push_back(x);t.push_back(h);
                    ret.push_back(t);
                }
                hp.insert(h);
            }else{
                hp.erase(hp.equal_range(h).first);
                if (h>max_h()){
                    vector<int> t;t.push_back(x);t.push_back(max_h());
                    ret.push_back(t);
                }
            }
        }
        return ret;
    }
};
```
