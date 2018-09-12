### What are the defining characteristics of an Array?
Elements are indexed, starting from 0. When an array is declared, a consecutive set of vacant memory addresses is being allocated for use in the program.

### What are four operations we typically study for a Data Structure?
- Read
- Search
- Insert
- Delete

### What does Big(O) notation measure? What does the "N" represent in the Big(O) notation?
Big(O) measures the complexity of an algorithm. N represents the number of data points in a given dataset.

### Does O(1) mean the algorithm completes in one step?
O(1) means that the algorithm completes in a constant time, no matter how large or small the size of inputs. It does not necessarily mean that it completes in one step, although it often does.

### What's the English explanation of O(Log N) and O(N LOG(N))?
Logarithmic complexity. For O(log(N)), the algorithm increases one step each time the data is double - the number of steps to keep halving the data elements until we remain with one. For O(N log(N)), for each halving of the data elements, we perform N comparisons or iterate through the entire halved set of elements.
(log N)Every step has to cut the problem space in half