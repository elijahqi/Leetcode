# Leetcode 341 Flatten Nested List Iterator

Use dfs to flat the data structure. This data structure provide the interface for us to do the mock.
We can also use stack to mock this process.


```cpp
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *   public:
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     bool isInteger() const;
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     int getInteger() const;
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     const vector<NestedInteger> &getList() const;
 * };
 */

class NestedIterator {
private:
    vector<int> ans;int num=0;
public:
    void dfs(vector<NestedInteger> &x){
        for (auto i:x){
            if (i.isInteger()) ans.push_back(i.getInteger());
            else dfs(i.getList());
        }
    }
    NestedIterator(vector<NestedInteger> &nestedList) {
        dfs(nestedList);
    }
    
    int next() {
        return ans[num++];
    }
    
    bool hasNext() {
        return (num<ans.size());
    }
};

/**
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i(nestedList);
 * while (i.hasNext()) cout << i.next();
 */
```
