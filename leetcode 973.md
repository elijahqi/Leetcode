# Leetcode 973 K Closest Points to Origin
This question gives a series of points on the plane and asks to find the K points closest to the origin. Basically, there is no difficulty, it is just to know how to find the distance between points. A more direct way is to sort this two-dimensional array, custom sorting method, according to the distance from the origin of the smallest to the largest sort, note that here we do not need to find out the specific distance value, as long as we know the relationship between the size of each other can be, so do not need to open the square. After sorting, return the first k points, see the code as follows.

```cpp
class Solution {
public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        sort(points.begin(),points.end(),[](const auto &a,const auto &b){
            return ((long long)a[0]*a[0]+(long long)a[1]*a[1])<
                ((long long)b[0]*b[0]+(long long)b[1]*b[1]);
        });
        vector<vector<int> >ret;
        for (int i=0;i<k;++i) 
            ret.push_back(points[i]);
        return ret;
        
    }

};
```
