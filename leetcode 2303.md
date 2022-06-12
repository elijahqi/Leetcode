# Leetcode 2303 Calculate Amount Paid in Taxes

```cpp
class Solution {
public:
    double calculateTax(vector<vector<int>>& brackets, int income) {
        if (!income) return income;
        int cnt=0;double tax;
        for (int i=0;i<brackets.size();++i){
            if (brackets[i][0]<=income){
                double tax_amount;
                if (i==0) tax_amount=brackets[i][0];
                else tax_amount=brackets[i][0]-brackets[i-1][0];
                
                tax+=tax_amount*brackets[i][1]/100;
            }else{
                double tax_amount;
                if (i==0) tax_amount=income;
                else tax_amount=income-brackets[i-1][0];
                tax+=tax_amount*brackets[i][1]/100;
                break;
            }
            
        }
        return tax;
    }
};
```
