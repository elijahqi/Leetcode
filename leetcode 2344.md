# Leetcode 2344 Minimum Deletions to Make Array Divisible

Find the gcd of the numsDivide, and sort the nums and check each of them whether it's possible to be divided by the gcd.
If we can not find the answer then return -1.
```cpp
class Solution {
private:
    int gcd(int x,int y){
        if (y==0) return x;
        return gcd(y,x%y);
    }
    
public:
    int minOperations(vector<int>& nums, vector<int>& numsDivide) {
        sort(begin(nums),end(nums));
        int ret=gcd(numsDivide[0],numsDivide[0]);
        for (int i=1;i<numsDivide.size();++i){
            ret=gcd(ret,numsDivide[i]);
        }
        bool flag=false;
        int id=-1;
        for (int i=0;i<nums.size();++i){
            if (ret%nums[i]==0){
                flag=true;id=i;
                break;
            }
        }
        return id;
    }
};
```
