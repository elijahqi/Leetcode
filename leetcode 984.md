# Leetcode 984 String Without AAA or BBB


```cpp
class Solution {
public:
    string strWithout3a3b(int a, int b) {
        int tot=a+b;
        vector<int> cnt{a,b};
        vector<int> left{0,0};
        string ret;
        for (int owo=1;owo<=tot;++owo){
            for (int i=0;i<2;++i){
                int j=(i+1)%2;
                if (cnt[i]>=cnt[j]&&left[i]!=2){
                   ret+='a'+i;++left[i];--cnt[i];left[j]=0; 
                    break;
                }else if (cnt[i]>0&&left[j]==2){
                    ret+='a'+i;++left[i];--cnt[i];left[j]=0; 
                    break;
                }
            }
        }
        return ret;
    }
};
```
