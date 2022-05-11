# Leetcode 318 Maximum Product of Word Lengths

Since if we compare each position in the stirng it's very time consuming, but the number of lower case letter is 26. Thus we try every time to for loop 26 times to see whether this exist in both strings.
If so we skip otherwise we use these two strings' lengths to calculate the result.
```cpp
class Solution {
public:
    int maxProduct(vector<string>& words) {
        int ret=0;
        for (int i=0;i<words.size();++i){
            for (int j=0;j<26;++j){
                char c='a'+j;
                auto a=words[i].find_first_of(c);
                if (a!=string::npos) num[j]=true;
            }
            for (int j=i+1;j<words.size();++j){
                bool flag=true;
                for (int k=0;k<26;++k){
                    if (!num[k]) continue;
                    char c='a'+k;
                    auto a=words[j].find_first_of(c);
                    if (a!=string::npos) {flag=false;break;}
                        
                }
                if (flag) ret=max(ret,(int)(words[i].size()*words[j].size()));
            }
            memset(num,0,sizeof(num));
        }
        return ret;
    }
private:
    bool num[26];
};
```
