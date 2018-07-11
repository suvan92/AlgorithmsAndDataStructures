import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    /**
     push(_:) Adds a value to the front of the linked list
     */
    public mutating func push(_ value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /**
     append(_:) Adds a value to the end of the linked list
     */
    public mutating func append(_ value: Value) {
        copyNodes()
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    /**
     node(at:) attempts to return a node at the given index
     
     nodes can only be accessed via the head node so this has to be iterative
     */
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    /**
     insert(_:, after:) inserts a value after the given node and returns the newly inserted node
     */
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /**
     pop() removes the head node and returns the value contained in the head node
     the value is optional as the list could be empty
     */
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    /**
     removeLast() removes the last node from the linked list and sets the second last node as the tail
     */
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        // if the head is nil, list is empty, return nil
        guard let head = head else {
            return nil
        }
        
        // if there is only one element, return head and clear list (handled by pop())
        guard head.next != nil else {
            return pop()
        }
        
        // you cannot just return the tail because you have to clear the reference to the tail from the previous node
        // hence the implementation of this while loop
        
        // we start at the head
        var prevNode = head
        var current = head
        
        // as long as there is a next node, continue the traversal
        while let next = current.next {
            // keep reference to the previous node
            prevNode = current
            // get reference to the next node
            current = next
        }
        
        // once you reach the tail, set the reference to the second last node to nil (effectively making it the tail node)
        prevNode.next = nil
        // explicitly set the second last node to be the tail node
        tail = prevNode
        // return the value of the currentNode (previous tail)
        // after this all references to the tail are removed so it will also be removed from memory
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        copyNodes()
        defer {
            // if the given node is the second last node, set it to the tail
            if node.next === tail {
                tail = node
            }
            // link the given node's next's next node to the given node (1 -> 2 -> 3 becomes 1 -> 3)
            // effectively removing the node after the given node
            node.next = node.next?.next
        }
        // return the value of the node after the given node
        return node.next?.value
    }
    
    /**
     copyNodes() allows LinkedList to have value semantics
     it is called at the beginning of any methods that mutate the data structure
     
     These include (6):
     
     push(_:)
     append(_:)
     pop()
     insert(after:)
     remove(after:)
     removeLast()
     
     */
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head),
            var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
}

extension LinkedList: Collection {
    
    // start index is defined as the head of the linked list
    public var startIndex: Index {
        return Index(node: head)
    }
    
    // end index (as per the Collection protocol) is definied as the index after the last element
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    // index(after:) dictates how the index can be incremented (simply give it the index of the next node)
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    /**
     subscript is used to map an Index to the value in the collection (list[3] returns the value at node 4)
     Because Index is custom in this case, mapping the index to the value can be done in constant time
     by just returning the node's value
     */
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        
        return String(describing: head)
    }
    
}
