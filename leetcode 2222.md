# leetcode 2222 Number of Ways to Select Buildings
 ```cpp
 class Solution {
public:
    char s1[110000];
    int sum1[110000];
    int sum0[110000];
    long long numberOfWays(string s) {
        for (int i=0;i<s.size();++i) s1[i+1]=s[i];
        for (int i=1;i<=s.size();++i) {
            sum0[i]=(sum0[i-1]+(s1[i]=='0'));
            sum1[i]=(sum1[i-1]+(s1[i]=='1'));
            //cout << sum0[i] << " " <<sum1[i] <<endl;
        }

        long long ans=0;
        for (int i=1;i<=s.size();++i){
            if (s1[i]=='0') ans+=(long long)sum1[i-1]*(sum1[s.size()]-sum1[i]);
            else ans+=(long long) sum0[i-1]*(sum0[s.size()]-sum0[i]);
        }
        return ans;
    }
};
 ```
