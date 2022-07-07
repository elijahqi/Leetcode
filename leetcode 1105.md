# Leetcode 1105 Filling Bookcase Shelves

```cpp
class Solution {
public:
    int minHeightShelves(vector<vector<int>>& books, int shelfWidth) {
        vector<vector<int> >mx_arr(books.size(),vector<int> (books.size(),0));
        vector<vector<int> >wid(books.size(),vector<int>(books.size(),0));
        for (int i=0;i<books.size();++i){
            for (int j=i;j<books.size();++j){
                if (i==j) {mx_arr[i][j]=books[i][1];wid[i][j]=books[i][0];continue;}
                mx_arr[i][j]=max(mx_arr[i][j-1],books[j][1]);
                wid[i][j]=wid[i][j-1]+books[j][0];
            }
        }
        vector<int >dp(books.size()+1,0);
        dp[1]=books[0][1];
        for (int i=2;i<=books.size();++i){
            dp[i]=dp[i-1]+books[i-1][1];
        }
        for (int i=1;i<=books.size();++i){
            for (int j=0;j<i;++j){
                if (wid[j][i-1]<=shelfWidth){
                    dp[i]=min(dp[i],dp[j]+mx_arr[j][i-1]);
                }
            }
        }
        return dp.back();
    }
};
```
