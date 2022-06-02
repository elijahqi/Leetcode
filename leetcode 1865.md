# Leetcode 1865 Finding Pairs With a Certain Sum

```cpp
class FindSumPairs {
public:
    FindSumPairs(vector<int>& nums1, vector<int>& nums2) :num1(nums1),num2(nums2){
        for (auto i:nums2) mp[i]++;
    }
    
    void add(int index, int val) {
        if(--mp[num2[index]]==0) mp.erase(num2[index]);
        ++mp[num2[index]+=val];
    }
    
    int count(int tot) {
        int ret=0;
        for (auto i:num1){
            int l=tot-i;
            auto find_it=mp.find(l);
            if (find_it==mp.end()) continue;
            ret+=find_it->second;
        }
        return ret;
    }
private:
    unordered_map<int,int> mp;
    vector<int> num1,num2;
};

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * FindSumPairs* obj = new FindSumPairs(nums1, nums2);
 * obj->add(index,val);
 * int param_2 = obj->count(tot);
 */
```
