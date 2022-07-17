# Leetcode 165 Compare Version Numbers

The first trick is to use "... " to split the string into decimal points.

Then compare the two arrays until the end is reached or there is already a winner.

The goal of this problem is to find all the different cases, including the edge cases.

You don't know how many layers a version number has in total. So 1.3.2.4.5.6 is also possible, it is not common in real life, but it is a valid version number in this problem.

```cpp
class Solution {
private:
    vector<int> calc(string &s){
        vector<int> ret;
        int t=0;
        for (char c:s){
            if (c=='.'){
                ret.push_back(t);
                t=0;
            }else{
                t*=10;t+=c-'0';
            }
        }
        ret.push_back(t);
        return ret;
    }
public:
    int compareVersion(string version1, string version2) {
        auto t1=calc(version1);
        auto t2=calc(version2);
        int l1=0,l2=0;
        while(l1<t1.size()||l2<t2.size()){
            auto tt1=l1<t1.size()?t1[l1++]:0;
            auto tt2=l2<t2.size()?t2[l2++]:0;
            if(tt1<tt2) return -1;
            if (tt1>tt2) return 1;
        }
        return 0;
    }
};
```
