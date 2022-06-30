# Leetcode 2323 Find Minimum Time to Finish All Jobs II

Greedy, sort both jobs and workers at the same time. Then assign each work to each worker, calculate the maximum time.
```java
class Solution {
    public int minimumTime(int[] jobs, int[] workers) {
        Arrays.sort(jobs);
        Arrays.sort(workers);
        int ret=0;
        for (int i=0;i<jobs.length;++i){
            ret=(int)Math.max(ret,Math.ceil((double)jobs[i]/workers[i]));
        }
        return ret;
    }
}
```
