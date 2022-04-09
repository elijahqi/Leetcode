#leetcode 2221 Find Triangular Sum of an Array
```cpp
class Solution {
public:
    int triangularSum(vector<int>& nums) {
        vector<int> sum=nums;
        while(sum.size()>1){
            vector<int> nsum;
            int lst=sum[0];
            for (int i=1;i<sum.size();++i){
                nsum.push_back((sum[i]+lst)%10);
                lst=sum[i];
            }
            sum=nsum;
        }
        return sum[0];
    }
};
```
