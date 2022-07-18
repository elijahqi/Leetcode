# Leetcode 1386 Cinema Seat Allocation

Simulation, but to remember to do the sum for the left a few lines.
```cpp
class Solution {
public:
    int maxNumberOfFamilies(int n, vector<vector<int>>& reservedSeats) {
        sort(begin(reservedSeats),end(reservedSeats),[](auto &a,auto &b){
            return a[0]==b[0]?a[1]<b[1]:a[0]<b[0];
        });
        int ret=0;
        int pos=0;
        int pre=0;
        for (int i=0;i<reservedSeats.size();++i){
            ret+=(reservedSeats[i][0]-1-pre)*2;
            pre=reservedSeats[i][0];
            int j=i;
            vector<bool> flag(11,false);
            while(j<reservedSeats.size()&&reservedSeats[j][0]==reservedSeats[i][0])
                flag[reservedSeats[j++][1]]=true;
            i=j-1;
            bool flag1[3];
            flag1[0]=flag1[1]=flag1[2]=true;
            for (int k=2;k<=5;++k) {
                if (flag[k]) {flag1[0]=false;break;}
            }
            for (int k=4;k<=7;++k){
                if (flag[k]) {flag1[1]=false;break;}
            }
            for (int k=6;k<=9;++k){
                if (flag[k]) {flag1[2]=false;break;}
            }
            if (flag1[0]&&flag1[2]) ret+=2;
            else if (flag1[1]||flag1[0]||flag1[2]) ret+=1;
        }
        if(pre<n) ret+=(n-pre)*2;
        return ret;
    }
    
};
```
