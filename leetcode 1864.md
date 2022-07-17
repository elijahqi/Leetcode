# Leetcode 1864 Minimum Number of Swaps to Make the Binary String Alternating

Go through the string, check the status that for the odd size situation.
```cpp
class Solution {
public:
    int minSwaps(string s) {
        int cnt0=0,cnt1=0;
        for (int i=0;i<s.size();++i) cnt0+=(s[i]=='0'),cnt1+=(s[i]=='1');
        if (abs(cnt0-cnt1)>1) return -1;
        int t0=0,t1=0;
        for (int i=0;i<s.size();++i){
            if (i%2==0){
                if (s[i]=='0') ++t0;
                if (s[i]=='1') ++t1;
            }
        }
        if (s.size()%2==1){
            if (cnt0>cnt1) return cnt0-t0;
            else return cnt1-t1;
        }
        return min(cnt0-t0,cnt1-t1);
    }
};
```
