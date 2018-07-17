# AlgorithmsAndDataStructures

This is a repositiory for familiarizing myself with various data structures, algorithms, and CS related concepts

### Contents

1. [Linked Lists](#linked-lists)
2. [Stacks](#stacks)
3. [Queues](#queues)<br>
&nbsp;&nbsp;&nbsp;i. [Array Based](#array-based-implementation)<br>
&nbsp;&nbsp;&nbsp;ii. [Doubly Linked List Based](#doubly-linked-list-based-implementation)<br>
&nbsp;&nbsp;&nbsp;iii. [Ring Buffer Based](#ring-buffer-based-implementation)<br>
&nbsp;&nbsp;&nbsp;iv. [Double Stack Based](#double-stack-based-implementation)<br>
4. [Trees](#trees)
5. [Binary Trees](#binary-trees)
6. [Binary Search Trees (BST)](#binary-search-trees-bst)

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

On the surface the doubly linked list based implementation seems to solve the main problem with the [array based implementation](#array-based-implementation) because all that is necessary to enqueue and dequeue is to update the references on the tail and head, respectively. However, each element has extra overhead in the form of the node object and references to the previous and next node. Additionally, everytime a new element is added memory must be allocated dynamically. In this respect the array based implementation is preferable as arrays employ bulk allocation.

### Ring buffer based implementation

|Operation|Best Case|Worst Case|
|:-------:|:-------:|:--------:|
| **enque(_:)** | O(1) | O(1) |
| **dequeue** | O(1) | O(1) |
| Space Complexity | O(n) | O(n) |

A ring buffer is essentially an array of fixed length with the addition of a read and write pointer. This means that once the array is full the first element will be overwritten by the next incoming element. The ring buffer has similar performance to the [doubly linked list based implementation](#doubly-linked-list-based-implementation). The main issue is that enque can fail if the maximum capacity has been reached.

### Double stack based implementation

|Operation|Best Case|Worst Case|
|:-------:|:-------:|:--------:|
| **enque(_:)** | O(1) | O(1) |
| **dequeue** | O(1) | O(1) (Amortized) |
| Space Complexity | O(n) | O(n) |

The double stack based implementation is the most effecient of the implementations discussed so far. When an element is enqueued, it is appended to the right stack. When dequeue is called, if the left stack contains elements it simply pops the last element (O(1)). If the left stack is empty however, the right stack is reversed and assigned to the left stack, and then cleared. Reversing an array (stack) is an O(n) operation but because the underlying data structure is an array, memory is allocated in bulk and the O(n) operation only happens once all the memory block previously allocated is full. Essentially the O(n) operations are distributed over multiple enqueues so overall is is cheaper. The diagram below should provide some clarification.

![Amortized push/enque operations](https://upload.wikimedia.org/wikipedia/commons/e/e5/AmortizedPush.png)

## Trees

Trees are immensely important data strucutres. Some of the numerous use cases include:

* Representing hierarchical relationships
* managing sorted data
* facilicating fast look up operations

Like linked lists, trees also use nodes. Each node, except for the root node, has exactly one parent node. The nodes stemming from a particular node are called child nodes. The leaves are the end of the tree and have no child nodes.

Iterations through linear collections such as arrays is relatively straightforward as there is a defined begninning and end. Interating through a tree however is less clear. There are two main strategies that you can employ: 1) Depth first and 2) Breadth first.

### Depth first search

The depth-first traversal goes as deep as possible into a tree before tracking back and exploring other children. The implmentation uses a recursive strategy as outlined below.

```swift
extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}
```

The result of the code above is illustrated below.

![Depth-first traveral](https://upload.wikimedia.org/wikipedia/commons/1/1f/Depth-first-tree.svg)

### Breadth first search

The breadth-first or level-order traversal looks at each child of the 'root' before exploring the grandchilren nodes. The implementation uses are queue to keep track of the order in which to visit each node. When a node is reached, all of it's children are added to the queue before moving on to the next node on the same level.

```swift
extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}
```

The result of the level-order traversal is illustrated below.

![Level-order traveral](https://www.geeksforgeeks.org/wp-content/uploads/level_order_traversal.png)

# Binary Trees

Binary trees are like trees discussed previously, except that each node has either 0, 1, or 2 children.

Let's use this tree as an example:

```
 ┌──nil
┌──9
│ └──8
7
│ ┌──5
└──1
 └──0
 ```

#### In-order traversal

An in-order traversal follows these 3 rules:

1. If the current node has a left child, recursively visit this child first
2. Then visit the node itself
3. If current node has a right child, recurseively visit this child
 
In the case of our example tree above, the order of traversal would be _0, 1, 5, 7, 8, 9_. You may have noticed that the nodes are visited in ascending order. If the tree is structured in a particular way this will always be the case (more on this in the next section).

#### Pre-order traversal

A pre-order traversal is similar to a in-order traversal except that the current node is visited before the left child.

If we take example tree from above, the order of traversal would be _7, 1, 0, 5, 9, 8_.

#### Post-order traversal

A post-order traversal is similar to the two previous types of traversals except that the current node is visited only after the left and right child nodes, respectively.

Using the sample from above the order of traversal would be _0, 5, 1, 8, 9, 7_.

All of these traversal algorithms have a time and space complexity of _O(n)_.

# Binary Search Trees (BST)

A binary search tree is a data structure that facilatates fast look up, addition, and removal operations. Each of these operations has an average time complexity of _O(log n)_, which is considerably faster than linear data structures such as arrays or linked lists as you can immediately ignore half the values once you make a decision at any given node. For this improve performance two rules must be followed:

1. The value of the left child must be less than that of the parent
2. The value of the right child must be more than that of the parent
