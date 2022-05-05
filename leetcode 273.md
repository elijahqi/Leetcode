# Leetcode 273 Integer to English Words

The number under 20 is only constructed by 1 word. And the vocabulary under 100 is constructed by specific part and together the word under 10.
More then 100 is another rules which includes hundred, thousand, million, billion.
Then we can directly from high to low to deal with it.

```cpp
class Solution {
public:
    string numberToWords(int num) {
        if (!num) return "Zero";
        return gao(num).substr(1);
    }
private:
    string gao(int n){
        if (!n) return "";
        if (n<20) return string(" ")+NU20[n-1];
        if (n<100) return string(" ")+NU100[n/10-2]+gao(n%10);
        for (int i=3;~i;--i){
            if (n>=LN[i]) return gao(n/LN[i])+" "+LNC[i]+gao(n%LN[i]);
        }
        return "";
    }

char *NU20[21]={"One", "Two", "Three", "Four", "Five", 
                               "Six", "Seven", "Eight", "Nine","Ten",
                               "Eleven", "Twelve", "Thirteen", "Fourteen",
                               "Fifteen", "Sixteen", "Seventeen", "Eighteen", 
                               "Nineteen"};
char *NU100[20] = {"Twenty", "Thirty", "Forty", "Fifty", 
                                "Sixty", "Seventy", "Eighty", "Ninety"};
char *LNC[20] = {"Hundred", "Thousand", "Million", "Billion"};
long long LN[20] = {100, 1000, 1000*1000, 1000*1000*1000};
};
```
