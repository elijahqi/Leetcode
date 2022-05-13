# Leetcode 884 Uncommon Words from Two Sentences

Use unordered_map to solve this problem.
```cpp
class Solution {
public:
    vector<string> uncommonFromSentences(string s1, string s2) {
        stringstream ss1(s1);
        stringstream ss2(s2);
        string s;
        vector<string>ret;
        while(getline(ss1,s,' ')){
            if (!s.empty()) mp1[s]++;
        }
        while(getline(ss2,s,' ')){
            if (!s.empty()) mp2[s]++;
        }
        for (auto i:mp1){
            if (i.second==1&&mp2.find(i.first)==mp2.end()) ret.push_back(i.first);
        }
        for (auto i:mp2){
            if (i.second==1&&mp1.find(i.first)==mp1.end()) ret.push_back(i.first);
        }
        return ret;
    }
private:
    unordered_map<string,int> mp1,mp2;
};
```
