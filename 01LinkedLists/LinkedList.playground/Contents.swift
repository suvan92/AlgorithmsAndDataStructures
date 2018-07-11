// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    
    list.append(1)
    list.append(2)
    list.append(3)
    
    print(list)
}

example(of: "insert after") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    
    print("After inserting: \(list)")
}

example(of: "pop") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Before popping the list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}

example(of: "removing the last node") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print("Before removing last: \(list)")
    let lastValue = list.removeLast()
    print("After removing last: \(list)")
    print("Last value: " + String(describing: lastValue))
}

example(of: "removing a node after a given node") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)

    print("Before removing: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)

    print("After removing index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "using collection") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }
    
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")
    print("Sum of all elements in list: \(list.reduce(0, +))")
}

example(of: "COW (Copy on Write)") {
    let array1 = [1, 2]
    var array2 = array1
    
    print("array1: \(array1)")
    print("array2: \(array2)")
    
    print("---After appending '3' to array2---")
    // Initially array1 and array2 are both pointing to the same place in memory
    // however once append is called on array2, it makes a copy before writing
    // Hence COW
    array2.append(3)
    print("array1: \(array1)")
    print("array2: \(array2)")
}

example(of: "linked list COW") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    var list2 = list1
    
    print("list1: \(list1)")
    print("list2: \(list2)")
    
    print("---After appending '3' to list2---")
    list2.append(3)
    print("list1: \(list1)")
    print("list2: \(list2)")
}
