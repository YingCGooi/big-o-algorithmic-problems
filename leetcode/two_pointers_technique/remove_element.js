// Given an array nums and a value val, remove all instances of that value in-place and return the new length.

// Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

// The order of elements can be changed. It doesn't matter what you leave beyond the new length.

  [0, 1, 2, 2, 3, 0, 4, 2, 7]; // target = 2

  [0, 0, 1, 2, 2, 2, 3, 4, 7]; // Sort the array O(n log n)
// ^L                         // initialize left pointer at 0
  [0, 0, 1, 2, 2, 2, 3, 4, 7]; // if left pointer value != target then move one step to the right
//    ^L
  [0, 0, 1, 2, 2, 2, 3, 4, 7]; // if left pointer value == target
//          ^L 
  [0, 0, 1, 2, 2, 2, 3, 4, 7]; // initialize right pointer as the next index
//          ^L ^R             // compare right pointer value to target value, if equal,
  [0, 0, 1, 2, 2, 2, 3, 4, 7]; // move right pointer until found an element that != target
//          ^L       ^R       
  [0, 0, 1,[2, 2, 2],3, 4, 7]; // Splice the elements from L until one less than R
//          ^L       ^R
  [0, 0, 1, 3, 4, 7]; // Final array

function remove_element(arr, target) {
  arr = arr.sort((a, b) => a > b); // sorting is O(log N)

  const last = arr.length - 1;
  let left = 0;

  while (arr[left] != target && left < last) left += 1;
  let right = left + 1;

  while (arr[right] == target && right <= last) right += 1;

  arr.splice(left, right - left);
  return arr.length;
}


console.log(remove_element([3, 2, 2, 3], 2)) // [3, 3] 2
console.log(remove_element([3, 2, 2, 3], 3)) // [2, 2] 2
console.log(remove_element([0,1,2,2,3,0,4,2,7], 2)) // [0, 1, 3, 0, 4, 7] 6
console.log(remove_element([0, 8, 9, 3, 9, 9, 9], 9)) // 3
console.log(remove_element([], 3)) // [] 0
console.log(remove_element([0, 0, 0], 0)) // [] 0