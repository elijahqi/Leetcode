# leetcode 2220 Minimum Bit Flips to Convert Number

```cpp
class Solution {
public:
    int minBitFlips(int start, int goal) {
        vector<int> sv;
        vector<int> gv;
        while(start){
            sv.push_back(start&1);
            start>>=1;
        }
        while(goal){
            gv.push_back(goal&1);
            goal>>=1;
        }
        int ans=0,i=0,j=0;
        while(i<sv.size()&&j<gv.size()){
            if (sv[i++]!=gv[j++]) ++ans;
        }
        while(i<sv.size()) if (sv[i++])++ans;
        while(j<gv.size()) if (gv[j++])++ans;
        return ans;
    }
};
```
