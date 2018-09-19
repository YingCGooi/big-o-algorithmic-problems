// Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

// Note:

// The number of elements initialized in nums1 and nums2 are m and n respectively.
// You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
function merge(arr, m, otherArr, n) {
  if (n == 0) return arr;

  let r1 = m - 1;
  let r2 = n - 1;
  let write = m + n - 1;

  while (r2 >= 0) {
    const val1 = arr[r1]; // || -INF
    const val2 = otherArr[r2];

    if (val1 > val2) {
      arr[write] = val1;
      r1 -= 1;
    } else {
      arr[write] = val2;
      r2 -= 1;
    }

    write -= 1;
  }

  return arr;
}

// Example:

const nums1 = [1,2,3,0,0,0]; 
const nums2 = [2,5,6];
console.log(merge(nums1, 3, nums2, 3)); // [1, 2, 2, 3, 5, 6]

const nums3 = [1, 2, 5, 7, 9, 9, 0, 0, 0, 0];
const nums4 = [2, 4, 5, 8];
console.log(merge(nums3, 6, nums4, 4)); // [1, 2, 2, 4, 5, 5, 7, 8, 9, 9]

console.log(merge([1, 2, 3], 3, [], 0)); // [1, 2, 3]
