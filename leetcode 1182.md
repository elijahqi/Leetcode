# Leetcode 1182 Shortest Distance to Target Color

We can pre_process the pre suffix and succeed suffix, then go through the whole queries.
```cpp
class Solution {
public:
    vector<int> shortestDistanceColor(vector<int>& colors, vector<vector<int>>& queries) {
        vector<vector<int> >pre(colors.size(),vector<int>(4,-1));
        vector<vector<int> >suf(colors.size(),vector<int>(4,-1));
        pre[0][colors[0]]=0;
        for (int i=1;i<colors.size();++i){
            pre[i][colors[i]]=0;
            for (int j=1;j<=3;++j){
                if (j==colors[i]) continue;
                if (pre[i-1][j]==-1) continue;
                pre[i][j]=pre[i-1][j]+1;
            }
        }
        suf[colors.size()-1][colors.back()]=0;
        for (int i=colors.size()-2;i>=0;--i){
            suf[i][colors[i]]=0;
            for (int j=1;j<=3;++j){
                if (j==colors[i]) continue;
                if (suf[i+1][j]==-1) continue;
                suf[i][j]=suf[i+1][j]+1;
            }
        }
        vector<int> ret;
        for (int i=0;i<queries.size();++i){
            auto x=queries[i][0],c=queries[i][1];
            if (pre[x][c]==suf[x][c]&&pre[x][c]==-1) {
                ret.push_back(-1);continue;
            }
            auto t=0;
            if(pre[x][c]==-1) t=suf[x][c];
            else if (suf[x][c]==-1) t=pre[x][c];
            else t=min(pre[x][c],suf[x][c]);
            ret.push_back(t);
        }
        return ret;
    }
};
```
