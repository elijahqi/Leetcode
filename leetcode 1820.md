# Leetcode 1820  Maximum Number of Accepted Invitations

We consider all students as nodes, with some of the nodes connected by edges (in this problem it is just between boys and girls). Obviously, this must be a bipartite graph. Then, we want to select the maximum number of edges and each node can be connected to at most one edge. So this is the template problem for finding the maximum matching of an unweighted bipartite graph, using the classical Hungarian algorithm.

DFS
First define two concepts.

Alternate paths: The path formed from an unmatched point, passing through non-matching edges, matching edges, and non-matching edges in turn ...... is called an alternate path. The so-called matching edge is that this edge is selected; the non-matching edge is that this edge is not selected.
Augmenting path: If you start from an unmatched point, take an alternating path, and finally reach another unmatched point (must be the opposite node), then this alternating path is called an augmenting path (agumenting path). The characteristic of an augmenting path is that the number of non-matching edges is exactly one more than the number of matching edges.
Let's look at the nodes of the left graph in turn. Let's remember that the current left node A is not yet matched, so we use DFS to find an augmenting path starting from A (just find one), assuming the end point is B. The number of matching edges on this augmenting path is k, and the number of non-matching edges is k+1. We then do an important operation: cancel all matching edges and replace the non-matching edges with matching edges. The result of this operation is that 1. no contradiction is introduced, i.e., no point is connected to two points on the opposite side. 2. one more pair is matched than before. 3. A is guaranteed to be matched. If we can't find such an augmented path starting with A, then it means that we can't match A without affecting the total number of matched edges, which means we have to give up the matching of A.

One of the core dfs code: if the right side has j connected to the left side i but not matched, then the augmented path get; otherwise we start from match[j] (which is a left node) and then continue the recursion.


```cpp
class Solution {
private:
    vector<vector<int> >G;
    vector<int> match;
    vector<bool> vis;
    bool dfs(int x){
        for (int y:G[x]){
            if (vis[y]) continue;
            vis[y]=true;
            if (match[y]==-1||dfs(match[y])){
                match[x]=y;
                match[y]=x;
                return true;
            }
        }
        return false;
    }
public:
    int maximumInvitations(vector<vector<int>>& grid) {
        int boy_n=grid.size();
        int girl_n=grid[0].size();
        int total=boy_n+girl_n;
        G.resize(total);
        for (int i=0;i<boy_n;++i)
            for (int j=0;j<girl_n;++j)
                if (grid[i][j])
                    G[i].push_back(j+boy_n),
                    G[boy_n+j].push_back(i);
        match.resize(total,-1);
        int ret=0;
        for (int i=0;i<boy_n;++i){
            vis.assign(total,false);
            if (dfs(i)) ++ret; 
        }
        return ret;
    }
};
```
