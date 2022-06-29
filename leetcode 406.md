# Leetcode 406 Queue Reconstruction by Height

This problem give us a queue, each element of which is a pair, respectively the height and the number of people whose height is not lower than the current height.
First,we take a look at a simple method. We can use sort to sort them, put the height one a head thus we will insert the bigger one firstly on the same place, then it's thei lower one.
For the returned element, we should create an empty array, iterate through the previous sorted array and insert each element into its corresponding position according to its second element.
```cpp
class Solution {
public:
    vector<vector<int>> reconstructQueue(vector<vector<int>>& people) {
        sort(begin(people),end(people),[](auto &a,auto &b){ return a[0]>b[0]||(a[0]==b[0]&&a[1]<b[1]);});
        vector<vector<int> >ret;
        for (auto &i:people){
            ret.insert(ret.begin()+i[1],i);
        }
        return ret;
    }
};
```
