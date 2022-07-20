# Leetcode 243 Shortest Word Distance


```cpp
class Solution {
public:
    int shortestDistance(vector<string>& wordsDict, string word1, string word2) {
        vector<int> q1,q2;
        for (int i=0;i<wordsDict.size();++i){
            if(wordsDict[i]==word1) q1.push_back(i);
            if (wordsDict[i]==word2) q2.push_back(i);
        }
        int ret=INT_MAX;
        int l=0,r=0;
        while(l<q1.size()&&r<q2.size()){
            ret=min(ret,abs(q1[l]-q2[r]));
            if (q1[l]<q2[r]) ++l;
            else ++r;
        }
        while(l<q1.size()){
            ret=min(ret,abs(q1[l++]-q2[r-1]));
        }
        while(r<q2.size()){
            ret=min(ret,abs(q1[l-1]-q2[r++]));
        }
        return ret;
    }
};
```
