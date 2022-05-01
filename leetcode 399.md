# Leetcode 399

In this question we use unordered map plus unordered set to construct the visted array and also use it to construct the edge between integer. The thing
that we need to care about is to simplfy this question, we can add double edges ,and the only difference is only the value of double.

```cpp
class Solution {
public:
    vector<double> calcEquation(vector<vector<string>>& equations, vector<double>& values, vector<vector<string>>& queries) {
        for (int i=0;i<equations.size();++i){
            double v=values[i];
            string a=equations[i][0],b=equations[i][1];
            g[a][b]=v;g[b][a]=1/v;
        }
        vector<double> ret;
        for (int i=0;i<queries.size();++i){
            if (!g.count(queries[i][0])||!g.count(queries[i][1])){
                ret.push_back(-1);continue;
            }
            visited.clear();
            ret.push_back(dfs(queries[i][0],queries[i][1]));
        }
        return ret;
    }
private:
    unordered_map<string,unordered_map<string,double> >g;
    unordered_set<string> visited;
    double dfs(string &a,string &b){
        if (a==b) return 1;
        visited.insert(a);
        for (auto &p:g[a]){
            string y=p.first;
            if (visited.count(y)) continue;
            double d=dfs(y,b); 
            if (d>0) return d*g[a][y];
        }        
        return -1;
    }
};
```
