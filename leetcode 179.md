# Leetcode 179 Largest Number

Check whether a+b is greater or b+a is greater
```cpp
class Solution {
public:
    string largestNumber(vector<int>& nums) {
        vector<string> q;
        for (int i=0;i<nums.size();++i) q.push_back(to_string(nums[i]));
        sort(begin(q),end(q),[](string &a,string &b){
            return a+b>b+a;
            
        });
        string ret;
        for (auto t:q) ret+=t;
        return ret[0]=='0'?"0":ret;
    }
};
```
