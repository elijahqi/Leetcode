# leetcode 13 Roman to Integer

Firstly, we need to know the mechanism of Roman number. That's
|symbol|value|
| ----------- | ----------- |
| I      | 1       |
| V   | 5       |
| X   | 10      |
| L   | 50      |
| C   | 100     |
| D   | 500     |
| M   | 1000    |

```cpp
class Solution {
public:
    int romanToInt(string s) {
        int ret=0;
        for (int i=0;i<s.size();++i){
            if (i+1<s.size()&&table[s[i]]<table[s[i+1]]) ret-=table[s[i]];
            else ret+=table[s[i]];
        }
        return ret;
    }
private:
    unordered_map<char,int>table{{'I',1},{'V',5},{'X',10},{'L',50},{'C',100},{'D',500},{'M',1000}};
};
```
