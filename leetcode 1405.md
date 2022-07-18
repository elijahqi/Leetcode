# Leetcode 1405 Longest Happy String

Greedy Alrogithm
```cpp
class Solution {
public:
    string longestDiverseString(int a, int b, int c) {
        int tot=a+b+c;
        vector<int> cnt{a,b,c};
        vector<int> left{0,0,0};
        string ret;
        for (int owo=1;owo<=tot;++owo){
            for (int i=0;i<3;++i){
                int j=(i+1)%3,k=(i+2)%3;
                if (cnt[i]>=cnt[j]&&cnt[i]>=cnt[k]&&left[i]!=2){
                   ret+='a'+i;++left[i];--cnt[i];left[j]=left[k]=0; 
                    break;
                }else if (cnt[i]>0&&(left[j]==2||left[k]==2)){
                    ret+='a'+i;++left[i];--cnt[i];left[j]=left[k]=0; 
                    break;
                }
            }
        }
        return ret;
    }
};
```
