# Leetcode 324 Wiggle Sort II

Find the medium and need to be careful about whether the number is odd or even.
We should put bigger number first to avoid some special case like 4,5,5,6
```cppclass Solution {
public:
    void wiggleSort(vector<int>& nums) {
        vector<int> nm=nums;
        sort(begin(nm),end(nm));
        int sz=nums.size()/2;
        
        nums.clear();
        if (nm.size()&1){
            nums.push_back(nm[sz]);
            for (int i=0;i<sz;++i){
                nums.push_back(nm[nm.size()-1-i]);
                nums.push_back(nm[sz-i-1]);
                
            }
            
        }else{
            for (int i=0;i<sz;++i){
                
                nums.push_back(nm[sz-i-1]);
                nums.push_back(nm[nm.size()-1-i]);
            }
        }
        
        //0 1 2 3 
        //0 2 1 3 
    }
};
```
