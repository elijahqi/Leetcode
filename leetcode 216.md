#Leetcode 216 Combination Sum III

Use dfs to solve this problem
```cpp
class Solution {
public:
    vector<vector<int>> combinationSum3(int k, int n) {
        if (n<3||n>45) return ret;
        total_num=k;
        dfs(0,n,1);
        return ret;
    }
private:
    vector<vector<int> >ret;
    vector<int> ans;
    int total_num;
    bool vis[10];
    void dfs(int x,int res,int cut){
        if (x==total_num&&res==0){
            ret.push_back(ans);return;
        }
        for (int i=cut;i<=9;++i){
            if(i>res) continue;
            ans.push_back(i);
            dfs(x+1,res-i,i+1);
            ans.pop_back();
        }
    }
};
```
