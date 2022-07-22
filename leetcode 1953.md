# Leetcode 1953 Maximum-Number-of-Weeks-for-Which-You-Can-Work
This problem is similar to other task planning problems that use PQ to solve "interval constraints". However, this problem is unique in that it does not require the output of a specific solution. Why? Because this problem gives a large amount of data, essentially there will be 1e5*1e9 milestones to be scheduled. According to the PQ practice of 054.Distant-Barcodes, then running 1e14/2 times PQ pop-up and join operations will obviously TLE.

In fact, this question has an obvious greedy algorithm. We can imagine that if some task X has a particularly large number of milestones, more than half of the overall number (plus 1), then according to the drawer principle, there must be two identical tasks X that will be adjacent to each other. Conversely, we can necessarily have tasks X spaced at least one place apart from each other, allowing other tasks to fill them, i.e., we can complete the arrangement of all milestones.

For the former, the scheme for the maximum number of milestones we can arrange is similar to XOXOXOXOX XXXX .... , and obviously the length of the answer depends on how many milestones there are for tasks that are not X.

```cpp
class Solution {
public:
    long long numberOfWeeks(vector<int>& milestones) {
        long long sum=accumulate(begin(milestones),end(milestones),0ll);
        int mx=*max_element(begin(milestones),end(milestones));
        if (mx>sum/2){
            return (sum-mx)*2+1;
        }else return sum;
    }
};
```
