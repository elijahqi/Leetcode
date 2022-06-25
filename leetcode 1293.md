# Leetcode 1293  Shortest Path in a Grid with Obstacles Elimination


To represent this concept of multiple grids, we only need a minor change in code.
Each node, instead of representing just a position(x, y) will now represent a triplet (x, y, d) indicating the position (x, y) and number of obstacles destroyed (d).

Pseudocode:

Initialize empty queue Q.
Initialize 3D-array VISITED[m][n][k] to mark visited nodes.
Insert starting node (0, 0, 0) to Q.
Run BFS.
Return the distance to the first node discovered by BFS with position (m-1, n-1).
If no such node is reachable, return -1.
```java

class Solution {
    int[][] dir= new int[][]{{0,1},{0,-1},{1,0},{-1,0}};
    public int shortestPath(int[][] grid, int k) {
        int n=grid.length;
        int m=grid[0].length;
        Queue<int[]> q= new LinkedList();
        boolean [][][] vis=new boolean[n][m][k+1];
        vis[0][0][0]=true;
        q.add(new int[]{0,0,0});
        int ret=0;
        while(!q.isEmpty()){
            int sz=q.size();
            for (int i=0;i<sz;++i){
                int [] x=q.poll();
                int curr=x[0];
                int curc=x[1];
                int curk=x[2];
                if (curr==n-1&&curc==m-1) return ret;
                for (int[] d:dir){
                    int nxtr=curr+d[0];
                    int nxtc=curc+d[1];
                    int nxtk=curk;
                    if (nxtr<0) continue;
                    if (nxtc<0) continue;
                    if (nxtr>=n) continue;
                    if (nxtc>=m) continue;
                    if (grid[nxtr][nxtc]==1) ++nxtk;
                    if (nxtk>k) continue;
                    if (vis[nxtr][nxtc][nxtk]) continue;
                    vis[nxtr][nxtc][nxtk]=true;
                    q.add(new int[]{nxtr,nxtc,nxtk});
                }
            }
           
            ++ret;
        }
        return -1;
    }
}
```
