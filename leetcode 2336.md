# Leetcode 2336 Smallest Number in Infinite Set


```cpp
class SmallestInfiniteSet {
private:
    set<int> s;
public:
    SmallestInfiniteSet() {
        for (int i=1;i<=1010;++i) s.insert(i);
    }
    
    int popSmallest() {
        auto t=*s.begin();
        s.erase(s.begin());
        return t;
    }
    
    void addBack(int num) {
        s.insert(num);
    }
};

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * SmallestInfiniteSet* obj = new SmallestInfiniteSet();
 * int param_1 = obj->popSmallest();
 * obj->addBack(num);
 */
```
