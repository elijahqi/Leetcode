# Leetcode 1779 Find Nearest Point That Has the Same X or Y Coordinate

O(n) for loop , and check whether satisfy the requirement.
```cpp
class Solution {
public:
    int nearestValidPoint(int x, int y, vector<vector<int>>& points) {
        int dist=INT_MAX,id=-1;
        for (int i=0;i<points.size();++i){
            int dis=abs(x-points[i][0])+abs(y-points[i][1]);
            if ((x==points[i][0]||y==points[i][1]) && dis<dist) dist=dis,id=i;
        }
        return id;
    }
};
```
