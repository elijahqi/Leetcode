# Leetcode 315

```cpp
class Solution {
private:
    vector<int> s;
    int mx=0;
    void add(int x){
        for (int i=x;i<=mx;i+=i&(-i)) s[i]++;
    }
    int query(int x){
        int ret=0;
        while(x){
            ret+=s[x];
            x-=x&(-x);
        }
        return ret;
    }
public:
    vector<int> countSmaller(vector<int>& nums) {
        for (int i=0;i<nums.size();++i) {
            nums[i]+=20000;mx=max(mx,nums[i]);
        }
        vector<int> ret(nums.size(),0);
        s.resize(mx+1,0);
        for (int i=nums.size()-1;i>=0;--i){
            ret[i]=query(nums[i]-1);
            add(nums[i]);
        }
        return ret;
    }
};
```
