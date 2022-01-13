# Leetcode 702 Search in a Sorted Array of Unknown Size

给定未知长度的数组，然后要求同样做二分查找。
解题方法：首先使用倍增找到能够覆盖target的的右边界同时把旧有的右边界值赋值给左边界，然后在此2的阶乘次的空间内内做二分查找
