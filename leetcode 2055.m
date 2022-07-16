# Leetcode 2055 Plates Between Candles

This is an extreme application of the use of prefix sum, just record the candles to the left of the current position, the nearest candle to the right to determine their true query range, and then by prefix sum you can figure out how many plates are in them
```cpp
class Solution {
public:
    vector<int> platesBetweenCandles(string s, vector<vector<int>>& queries) {
        vector<int> pres_c(s.size()+1,0);
        vector<int> pres_p(s.size()+1,0);
        vector<int> pre(s.size()+1,-1);
        vector<int> suc(s.size()+2,-1);
        for (int i=0;i<s.size();++i) {
            pres_c[i+1]=pres_c[i]+(s[i]=='|');
            pres_p[i+1]=pres_p[i]+(s[i]=='*');
        }
        for (int i=1;i<=s.size();++i){
            if (s[i-1]=='|') pre[i]=0;
            else {
                if (pre[i-1]==-1) continue;
                pre[i]=pre[i-1]+1;
            }
        }
        for (int i=s.size();i>=1;--i){
            if (s[i-1]=='|') suc[i]=0;
            else {
                if (suc[i+1]==-1) continue;
                suc[i]=suc[i+1]+1;
            }
        }
        vector<int> ret;
        for (auto &q:queries){
            int l=q[0]+1,r=q[1]+1;
            if(suc[l]==-1||pre[r]==-1) {ret.push_back(0);continue;}
            l=l+suc[l];r=r-pre[r];
            if (l>=r) {ret.push_back(0);continue;}
            int ans=pres_p[r]-pres_p[l-1];
            ret.push_back(ans);
        }
        return ret;
    }
};
```
