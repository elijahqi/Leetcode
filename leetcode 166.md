# Leetcode 166 Fraction to Recurring Decimal


```cpp
class Solution {
public:
    string fractionToDecimal(int numerator, int denominator) {
        int s1=numerator>=0?1:-1;
        int s2=denominator>=0?1:-1;
        long long numer=abs(numerator);
        long long denom=abs(denominator);
        long long out=numer/denom;
        long long rem=numer%denom;
        unordered_map<long long,int> mp;
        string ret=to_string(out);
        if (s1*s2==-1&&(out>0||rem>0)) ret="-"+ret;
        if (rem==0) return ret;ret+=".";
        string decim;
        int p=0;
        while(rem!=0){
            if (mp.find(rem)!=mp.end()){
                decim.insert(mp[rem],"(");
                decim+=")";
                return ret+decim;
            }
            mp[rem]=p;
            decim+=to_string(rem*10/denom);
            rem=rem*10%denom;
            ++p;
        }
        return ret+decim;
    }
};
```
