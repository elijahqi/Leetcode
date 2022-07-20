# Leetcode 496 Next Greater Element I

```cpp
class Solution {
private:
    unordered_map<int,int> mp;
public:
    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        for (int i=0;i<nums2.size();++i) mp[nums2[i]]=i;
        vector<int> ret,nxt;
        stack<int>q;
        nxt.resize(nums2.size(),-1);
        for (int i=nums2.size()-1;i>=0;--i){
            while(!q.empty()&&nums2[i]>q.top()){
                q.pop();
            }
            if (!q.empty()) nxt[i]=q.top();
            q.push(nums2[i]);
        }
        for (int i=0;i<nums1.size();++i){
            ret.push_back(nxt[mp[nums1[i]]]);
        }
        return ret;
    }
};
```
