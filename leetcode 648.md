# Leetcode 648 Replace Words

Use hash maps(unordered_set)
time complexity O(N*M^2)
```cpp
class Solution {
public:
    string replaceWords(vector<string>& prefixes, string se) {
        stringstream ss(se);
        string s1;vector<string> sentence;
        while(getline(ss,s1,' ')){
            if(!s1.empty()) sentence.push_back(s1);
        }
        string ret;
          unordered_set<string> s;
          for (int i=0;i<prefixes.size();++i) s.insert(prefixes[i]);

          for (auto &i:sentence){
            size_t sz=i.size();
            for (size_t j=1;j<=sz;++j){
              auto find_it=s.find(i.substr(0,j));
              if (find_it==end(s)){
                if (j==sz) {ret+=i+" ";break;}
              }else {ret+=*find_it+" ";break;}
            }
          }
            if (ret.back()==' ') ret.pop_back();
          return ret;
    }
};
```
