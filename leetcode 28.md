# Leetcode 28 Implement strStr()

The Intuitive algorithms is to enumerate the starting point, and then try to match every character in these two strings.
```cpp
class Solution {
public:
    int strStr(string haystack, string needle) {
        int n=needle.size();
        if (!n) return 0;
        int dif=haystack.size()-needle.size();
        for (int i=0;i<=dif;++i){
            for (int j=0;j<n;++j){
                if (haystack[i+j]!=needle[j]) break;
                if (j==n-1) return i;
            }
        }
        return -1;
    }
};
```

The other way is that we can apply kmp algorithm to this problem.
https://www.cnblogs.com/lijingran/p/8619711.html

```cpp
class Solution {
public:
    int strStr(string haystack, string needle) {
        cal_next(needle);int k=-1;
        for (int i=0;i<haystack.size();++i){
        while (k >-1&&needle[k+1]!=haystack[i]) k=next[k];
            //ptr和str不匹配，且k>-1（表示ptr和str有部分匹配）
            //往前回溯
        if (needle[k + 1]==haystack[i]) k=k+1;
        if (k==needle.size()-1){
            //说明k移动到ptr的最末端
            //cout << "在位置" << i-plen+1<< endl;
            //k = -1;//重新初始化，寻找下一个
            //i = i - plen + 1;//i定位到该位置，外层for循环i++可以继续找下一个（这里默认存在两个匹配字符串可以部分重叠），感谢评论中同学指出错误。
            return i-needle.size()+1;//返回相应的位置
            }
        }
        return -1;  
    }
private:
    int next[11000];
    void cal_next(const string &s){
        next[0]=-1;int k=-1;
        for (int i=1;i<s.size();++i){
            while (k!=-1&&s[k+1]!=s[i]){
                //如果下一个不同，那么k就变成next[k]，注意next[k]是小于k的，无论k取任何值。
                k=next[k];//往前回溯
            }
            if (s[k+1]==s[i]){
                //如果相同，k++
                k=k+1;
            }
            next[i]=k;//这个是把算的k的值（就是相同的最大前缀和最大后缀长）赋给next[q]
        }
    }
};
```
