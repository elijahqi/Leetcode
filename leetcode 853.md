# Leetcode 853 Car Fleet


Calculate the arrival time and sort the cars by position. if the previous car is fast then right now, then they will come together.
```cpp
class Solution {
public:
    int carFleet(int target, vector<int>& position, vector<int>& speed) {
        car.resize(position.size());
        for (int i=0;i<position.size();++i) car[i]={position[i],(double)(target-position[i])/speed[i]};
        sort(begin(car),end(car));
        int ret=0;
        for (int i=position.size()-1;i>0;--i){
            if (car[i].second<car[i-1].second) ++ret;
            else car[i-1].second=car[i].second;
        }
        if (car.size()==1||car[0].second>=car[1].second) ret++;
        return ret;
        
    }
private:
    vector<pair<int,double> >car;
};
```
