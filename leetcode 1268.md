# Leetcode 1268 Search Suggestions System

```cpp
class Solution {
public:
    vector<vector<string>> suggestedProducts(vector<string>& products, string searchWord) {
        sort(products.begin(),products.end());
        vector<vector<string> >ret;
        for (int i=1;i<=searchWord.size();++i){
            vector<string> itt;
            string strs=searchWord.substr(0,i);
            for (auto &s:products){//here we can use the binary search to speed up the search process
                if (i>s.size()) continue;
                if (s.substr(0,i)==strs) itt.push_back(s);
            }
            if (itt.size()>3) itt.resize(3);
         
            ret.push_back(itt);
        }
        return ret;
    }
};
```
