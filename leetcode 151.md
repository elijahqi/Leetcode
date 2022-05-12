# Leetcode 151 Reverse Words in a String

Change string to streamstring and then use getline to read and use vector to store them, and then read back from them.

```cpp

class Solution {
public:
    string reverseWords(string s) {
        stringstream ss(s);
        string s1;
        vector<string> ret;
        while(getline(ss,s1,' ')){
            if (!s1.empty()) ret.push_back(s1);
        }
        string ret1;
        for (int i=ret.size()-1;i>0;--i){
            ret1+=ret[i]+" ";
        }
        ret1+=ret[0];
        return ret1;
        
    }
};
```
