# Leetcode 1037 Valid Boomerang
This question defines a kind of boomerang is not in the same line of three points, now given the same plane of three points, let determine whether a boomerang can be formed. In fact, it is a geometry problem in junior high school, to determine whether the three points share a line, forgetting that it is not easy to do, although it is only an easy question. We all know that two points can determine a straight line, so for three points p1, p2, and p3, as long as p1 and p2 connected to a straight line and p1 and p3 connected to a straight line overlap, it means that the three points coincide. The easiest way to determine the coincidence of the line is to see if the slope is equal, knowing that the slope of the two points is also very simple, as long as it meets (y3 - y1) / (x3 - x1) = (y2 - y1) / (x2 - x1), it means that the three points coincide, which is replaced by the multiplicative form of (y3 - y1) * (x2 - x1) = (y2 - y1) * (x3 - x1), and the title says The boomerang is the case where the three points are not co-linear, so replace the equal sign here with an unequal sign

```cpp
class Solution {
public:
    bool isBoomerang(vector<vector<int>>& points) {
        return (points[2][1]-points[0][1])*(points[1][0]-points[0][0])!=(points[1][1]-points[0][1])*(points[2][0]-points[0][0]);
    }
};
```
