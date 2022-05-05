# Leetcode 12 Integer to Roman 


This problem have an advantage is that the variants of roman number are small, and the situation like 90 40 9 4 and 400 we can manully add it to the conversion table.
```cpp
class Solution {
public:
    string intToRoman(int num) {
        auto it=tb.begin();
        string ret;
        while(num){
            if (num>=it->first){
                num-=it->first;
                ret+=it->second;
            }else ++it;
        }
        return ret;
    }
private:
    vector<pair<int,string> >tb{{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
                               { 100, "C"}, { 90, "XC"}, { 50, "L"}, { 40, "XL"}, 
                               {  10, "X"}, {  9, "IX"}, {  5, "V"}, {  4, "IV"}, 
                               {   1, "I"}};
};
```
