# Leetcode 1360 Number of Days Between Two Dates


```cpp
class Solution {
private:
    int mon[12]={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int check(int year){
        if (year%4==0&&(year%100!=0||year%400==0)) return 1;
        return 0;
    }
    int calc(string &s){
        int year=stoi(s.substr(0,4));
        int month=stoi(s.substr(5,2));
        int day=stoi(s.substr(8,2));
        int ret=0;
        for (int i=1970;i<year;++i){
            ret+=365+check(i);
        }
        ret+=day;
        for (int i=1;i<month;++i) ret+=mon[i-1];
        ret+=month>2&&check(year);
        return ret;
    }
public:
    int daysBetweenDates(string date1, string date2) {
        return abs(calc(date2)-calc(date1));
    }
};
```
