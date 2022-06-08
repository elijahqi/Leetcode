# Leetcode 207 Course Schedule
The key issue is to find a circle.
If we use dfs then the time complexity will be O(n^2).
If we use topological sort, it will be O(n)
```cpp
class Solution {
public:
    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        G.resize(numCourses);
        in.resize(numCourses,0);
        for (auto &i:prerequisites) G[i[0]].push_back(i[1]),++in[i[1]];
        queue<int> q;int ret=0;
        for (int i=0;i<numCourses;++i) if (!in[i]) q.push(i),++ret;
        while(!q.empty()){
            int x=q.front();q.pop();
            for (auto i:G[x]){
                if (!(--in[i])) ++ret,q.push(i);
            }
        }
        return ret==numCourses;
        
    }
private:
    vector<vector<int> >G;
    vector<int> in;
};
```
