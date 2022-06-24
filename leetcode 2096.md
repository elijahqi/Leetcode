# Leetcode 2096 Step-By-Step Directions From a Binary Tree Node to Another


Firstly, use lca to find the LCA of two points.
Then we use dfs to find the path from LCA to each point.
And from the start point to the LCA is the path that only with "U".
Then our return string should covert the path from LCA to start point only with U but with the length from start point to LCA.
```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    private String st;
    private String ed;
    public String getDirections(TreeNode root, int startValue, int destValue) {
        dfs(lca(root,startValue,destValue),startValue,destValue,new StringBuilder());
        return "U".repeat(st.length())+ed;
    }
    private TreeNode lca(TreeNode x, int p,int q){
        if (x==null||x.val==p||x.val==q) return x;
        TreeNode l=lca(x.left,p,q);
        TreeNode r=lca(x.right,p,q);
        if (l!=null&&r!=null) return x;
        return l==null?r:l;
    }
    private void dfs(TreeNode x,int p,int q,StringBuilder path){
        if (x==null) return;
        if (x.val==p) st=path.toString();
        if (x.val==q) ed=path.toString();
        dfs(x.left,p,q,path.append('L'));
        path.deleteCharAt(path.length()-1);
        dfs(x.right,p,q,path.append('R'));
        path.deleteCharAt(path.length()-1);
        
    }
}
```
