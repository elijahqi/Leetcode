# Leetcode 702 Search in a Sorted Array of Unknown Size

给定未知长度的数组，然后要求同样做二分查找。
解题方法：首先使用倍增找到能够覆盖target的的右边界，然后在此边界内做二分查找
