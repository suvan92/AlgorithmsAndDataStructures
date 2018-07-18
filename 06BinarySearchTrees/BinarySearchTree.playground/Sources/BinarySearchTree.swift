import Foundation

public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    // this is a recursive method for insertion
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        // this is the base case to terminate the recurssion
        // if the given node is nil, so there is no root, or the given child is nil
        // create a node with the given value and return it
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        // depending on whether the given value is less than or greater than the value of the current node
        // try to assign the new value as the left/right child of the current node
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        // return the node passed in as an argument as no changes need to be made
        return node
    }
}

extension BinarySearchTree {
    public func contains(_ value: Element) -> Bool {
        
        // set the current node to the root node
        var current = root
        
        // while the current node is not nil
        while let node = current {
            // if the value of the current node matches the value of interest
            // return true
            if node.value == value {
                return true
            }
            
            // decide if you're going to check the left or right side of the tree/subtree
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

private extension BinaryNode {
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

extension BinarySearchTree {
    
    public mutating func remove(_ value: Element) {
        root = remove(from: root, value: value)
    }
    
    private func remove(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            // if the current node is the leaf node, return nil
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            // if there is no left child, return the right child to reconnect the right subtree
            if node.leftChild == nil {
                return node.rightChild
            }
            // if there is no right child, return the left child to reconnect the left subtree
            if node.rightChild == nil {
                return node.leftChild
            }
            
            // this means that the node to be removed has both a left and right child
            // you replace the current node's value with the smallest value (x) in the right subtree
            // and remove x from the right subtree
            node.value = node.rightChild!.min.value
            node.rightChild = remove(from: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(from: node.leftChild, value: value)
        } else {
            node.rightChild = remove(from: node.rightChild, value: value)
        }
        
        return node
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        return root?.description ?? "empty tree"
    }
}
