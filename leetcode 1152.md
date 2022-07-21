# Leetcode 1152 Analyze User Website Visit Pattern

sort according to the timestamp, then use unordered_map for every name to store the webite. Use brute force to check all possible situations.
```cpp
class Solution {
private:
    vector<tuple<string,int,string> >person;
    unordered_map<string,vector<string> >mp;
    map<tuple<string,string,string>,int> ct;
public:
    vector<string> mostVisitedPattern(vector<string>& username, vector<int>& timestamp, vector<string>& website) {
        vector<string> ret;
        for (int i=0;i<username.size();++i) person.emplace_back(username[i],timestamp[i],website[i]);
        sort(begin(person),end(person),[](auto &a,auto &b){
            return get<1>(a)<get<1>(b);
        });
        for (int i=0;i<person.size();++i){
            mp[get<0>(person[i])].push_back(get<2>(person[i]));
        }
        
        for (auto &m:mp){
            auto &vt=m.second;
            set<tuple<string,string,string> >s;
            for (int i=0;i<vt.size();++i){
                for (int j=i+1;j<vt.size();++j){
                    for (int k=j+1;k<vt.size();++k){
                        auto &a=vt[i],&b=vt[j],&c=vt[k];
                        s.insert({a,b,c});
                    }
                }
            }
            for (auto &t:s) ct[t]++;
        }
        int cnt=0;
        for (auto &m:ct){
            auto &t=m.first;
            if (m.second>cnt){
                cnt=m.second;
                ret.clear();
                ret.push_back(get<0>(t));
                ret.push_back(get<1>(t));
                ret.push_back(get<2>(t));
            }
        }
        return ret;
    }
};
```
