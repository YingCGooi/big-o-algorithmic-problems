// Implement Merge Sort

function mergeSort(arr) {
  if (arr.length <= 1) return arr;

  const mid = Math.ceil(arr.length / 2);
  const leftHalf = arr.slice(0, mid);
  const rightHalf = arr.slice(mid);

  const sortedLeft = mergeSort(leftHalf);
  const sortedRight = mergeSort(rightHalf);

  return merge(sortedLeft, sortedRight);
}

function mergeSort(arr, left=0, right=arr.length - 1) {
  if (arr.length === 0) return [];
  if (left === right) return [arr[left]];

  console.log(arr[left], arr[right])

  mid = Math.floor((left + right) / 2);

  leftArr = mergeSort(arr, left, mid);
  rightArr = mergeSort(arr, mid + 1, right);

  return merge(leftArr, rightArr);
}

function merge(arr, otherArr) {
  const [m, n] = [arr.length, otherArr.length];
  if (n == 0) return arr;

  let r1 = m - 1;
  let r2 = n - 1;
  let write = m + n - 1;

  while (r2 >= 0) {
    const val1 = arr[r1] || -Infinity;
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

// console.log(merge([1, 2, 3], [3, 4, 5]));
// console.log(merge([4], [1, 2, 3]));
console.log(mergeSort([5, 6, 1, 2, 8, 4, 3, 2, 1])); // [1, 1, 2, 2, 3, 4, 5, 6, 8]