import Foundation

var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

var largeExampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(50)
    bst.insert(25)
    bst.insert(75)
    bst.insert(12)
    bst.insert(37)
    bst.insert(10)
    bst.insert(17)
    bst.insert(32)
    bst.insert(27)
    bst.insert(33)
    bst.insert(45)
    bst.insert(63)
    bst.insert(87)
    return bst
}

example(of: "building an unbalanced BST") {
    var bst = BinarySearchTree<Int>()
    for i in 0..<6 {
        bst.insert(i)
    }
    print(bst)
}

example(of: "building a balanced BST") {
    print(exampleTree)
}

example(of: "finding a node") {
    let valueOfInterest = 5
    if exampleTree.contains(valueOfInterest) {
        print("Found \(valueOfInterest)!")
    } else {
        print("Couldn't find \(valueOfInterest)")
    }
}

example(of: "removing a node") {
    var tree = largeExampleTree
    print("Tree before removal:")
    print(tree)
    tree.remove(25)
    print("Tree after removal:")
    print(tree)
}

example(of: "removing the root") {
    var tree = exampleTree
    print("Tree before removal:")
    print(tree)
    tree.remove(3)
    print("Tree after removal:")
    print(tree)
}
