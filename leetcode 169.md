#Leetcode 169

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int major=nums[0];
        int cnt=0;
        for (int i:nums){
            if (i==major)++cnt;
            else if (--cnt==0) major=i,cnt=1;
        }
        return major;
    }
};
```


Bit count
```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int ret=0,num=0,n=nums.size();
        for (int i=0;i<32;++i){
            int t=1<<i;num=0;
            for (int j:nums){
                if ((j&t)&&(++num>n/2)){ret|=t;break;}
            }
        }
        return ret;
    }
};
```
