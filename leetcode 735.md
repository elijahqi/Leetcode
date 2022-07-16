# Leetcode 735 Asteroid Collision
Simulation
```cpp
class Solution {
public:
    vector<int> asteroidCollision(vector<int>& asteroids) {
        vector<int> ret;
        //int cnt0=0,cnt1=0;//cnt0  from left to right
        //cnt1 from right to left
        for (int i=0;i<asteroids.size();++i){
            if (asteroids[i]>0){
                ret.push_back(asteroids[i]);
            }else{
                while(!ret.empty()&&ret.back()>0&&abs(asteroids[i])>ret.back()) ret.pop_back();
                if (!ret.empty()&&ret.back()==abs(asteroids[i])){
                    ret.pop_back();continue;
                }
                if (!ret.empty()&&ret.back()>abs(asteroids[i])) continue;
                ret.push_back(asteroids[i]);
            }
        }
        return ret;
    }
};
```
