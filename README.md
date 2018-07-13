# AlgorithmsAndDataStructures

This is a repositiory for familiarizing myself with various data structures, algorithms, and CS related concepts

### Contents

1. [Linked Lists](#linked-lists)
2. [Stacks](#stacks)
3. [Queues](#queues)
  a. [Array Based](#array-based-implementation)
  b. [Doubly Linked List Based](#doubly-linked-list-based-implementation)
  c. [Ring Buffer Based](#ring-buffer-based-implementation)
  d. [Double Stack Based](#double-stack-based-implementation)
4. [Trees](#trees)

## Linked Lists

The linked list is a chain of nodes. A node has two responsibities
1. Hold the value for that node
2. Hold a reference to the next node (a nil value represents the end of the list)

There are 7 methods associated with Linked lists. They are:

1. **push(_:)**: Adds a value to the front of the list
2. **append(_:)**: Adds a value to the end of the list
3. **insert(after:)**: Adds a value after the node given as an argument
4. **node(at:)**: Returns a node at a particular index if it exists
5. **pop()**: Removes the first value from the linked list
6. **removeLast()**: Removes the last value from the list
7. **remove(after:)**: Removes the node after the given node and returns the removed node's value

Let's look at the time complexity associated with each of these operations.

| Operation | Behaviour | Time Complexity | Explanation |
|:---------:|:---------:|:---------------:|:------------|
| **push** | insert at head | O(1)| The list has reference to the head so it simply updates the next references |
| **append** | insert at tail | O(1)| The list has reference to the tail so it simply updates the next refrences |
| **insert(after:)** | insert after a node | O(1)| The list has reference to the particular node so it simply updates the references like in **push** and **append** |
| **node(at:)** | returns a node at a given index | O(i), where i is the given index| Because a linked list is not a random access collection (i.e. you cannot index into it like an array or map) you must iterate through the list till you find the node you're looking for |
| **pop** | remove at head | O(1)| The list has reference to the head so it simply must update the head to the previously second node, remove the old head, and return it's value |
| **removeLast** | remove at tail | O(n)| The list has to update the tail so it needs reference to the second last node to update it's next reference to nil (making it the tail) so you must iterate |
| **remove(after:)** | remove the immediate next node | O(1)| You already have reference to the node to be removed via the next property of the given node, all that's left is to update the next property of the given to node to point to the node after the node to be removed |

## Stacks

Stacks are a **LIFO** (last in first out) data structure. They are also a very simple data structure in that there are only two methods associated with them. They are:

1. **push(_:)**: Adds an element to the top of the stack
2. **pop()**: Removes the top element from the stack

Stacks are used in iOS development to push and pop viewControllers into and out of view, for memory allocation, as well as search and conquer algorithms (to be discussed later).

|Operation|Behaviour|Time Complexity|Explanation|
|:-------:|:-------:|:-------------:|:----------|
| **push** | Add element to top of stack | O(1) | The swift implementation of a stack uses an array. The swift array allows constant time insertions and deletions of the last element |
| **pop** | Removes element from the top of the stack | O(1) | Again, the array underneath allows constant time insertions and deletions of the last element |

## Queues

Queues are a **FIFO** (first in first out) data structure. There are several potential ways to implement this data structure in Swift. We will explore them here but first let's look at the two main methods associated with queues.

1. **enqueue(_:)**: Adds an element to the back of the queue
2. **dequeue**: Removes an element from the front of the queue

### Array based implementation

|Operation|Best Case|Worst Case|
|:-------:|:-------:|:--------:|
| **enque(_:)** | O(1) | O(1) |
| **dequeue** | O(n) | O(n) |
| Space Complexity | O(n) | O(n) |

Enqueuing an element with an array based implementation is a O(1) operation which is ideal but dequeuing is an O(n) operation. Because elements of an array are held next to one another in blocks of memory, once the first element is dequeued, each subsequent element must be moved over one place. This is a large overhead for performing one of the key functions of this data structure.

### Doubly linked list based implementation

|Operation|Best Case|Worst Case|
|:-------:|:-------:|:--------:|
| **enque(_:)** | O(1) | O(1) |
| **dequeue** | O(1) | O(1) |
| Space Complexity | O(n) | O(n) |


### Ring buffer based implementation

|Operation|Best Case|Worst Case|
|:-------:|:-------:|:--------:|
| **enque(_:)** | O(1) | O(1) |
| **dequeue** | O(1) | O(1) |
| Space Complexity | O(n) | O(n) |

### Double stack based implementation

|Operation|Best Case|Worst Case|
|:-------:|:-------:|:--------:|
| **enque(_:)** | O(1) | O(1) |
| **dequeue** | O(1) | O(1) (Amortized) |
| Space Complexity | O(n) | O(n) |

## Trees
