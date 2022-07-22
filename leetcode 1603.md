# Leetcode 1603 Design Parking System

```cpp
class ParkingSystem {
private:
    int big,medium,small;
public:
    ParkingSystem(int big_, int medium_, int small_) {
        big=big_;medium=medium_;small=small_;
    }
    
    bool addCar(int carType) {
        if (carType==1) {
            if (!big) return false; 
            big--;
        }
        if (carType==2){
            if (!medium) return false;
            medium--;
        }
        if (carType==3){
            if (!small) return false;
            small--;
        }
        return true;
    }
};

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * ParkingSystem* obj = new ParkingSystem(big, medium, small);
 * bool param_1 = obj->addCar(carType);
 */
```
