# Leetcode 2034 Stock Price Fluctuation

Use two maps to record the timestamp to price and also the price to the count.
```cpp
class StockPrice {
private:
    map<int,int> mp1,mp2;
    //mp1 from timestamp to stock price.
    //mp2 from stock price to the number of it
public:
    StockPrice() {
        
    }
    
    void update(int timestamp, int price) {
        if (mp1.count(timestamp)){
            int pre_p=mp1[timestamp];
            if (--mp2[pre_p]==0) mp2.erase(pre_p);
        }
        mp1[timestamp]=price;
        ++mp2[price];
    }
    
    int current() {
        return rbegin(mp1)->second;
    }
    
    int maximum() {
        return rbegin(mp2)->first;
    }
    
    int minimum() {
        return begin(mp2)->first;
    }
};

/**
 * Your StockPrice object will be instantiated and called as such:
 * StockPrice* obj = new StockPrice();
 * obj->update(timestamp,price);
 * int param_2 = obj->current();
 * int param_3 = obj->maximum();
 * int param_4 = obj->minimum();
 */
```
