import Foundation

example(of: "creating a tree") {
    let beverages = TreeNode<String>("beverages")
    beverages.add(TreeNode("Hot"))
    beverages.add(TreeNode("Cold"))
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black tea")
    let greenTea = TreeNode("green tea")
    let chai = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let coke = TreeNode("coke")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chai)
    
    soda.add(gingerAle)
    soda.add(coke)
    
    return tree
}

example(of: "depth-first traversal") {
    let tree = makeBeverageTree()
    tree.forEachDepthFirst(visit: { (node) in
        print(node.value)
    })
}

example(of: "level-order traveral") {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder(visit: { (node) in
        print(node.value)
    })
}

example(of: "level-order search") {
    let tree = makeBeverageTree()
    
    if let firstResult = tree.search("coke") {
        print("Found node: \(firstResult.value)")
    }
    
    if let secondResult = tree.search("beer") {
        print("Found node: \(secondResult.value)")
    } else {
        print("Could not find 'beer'")
    }
}
