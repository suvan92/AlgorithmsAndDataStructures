import Foundation

public struct Stack<Element> {
    
    private var storage = [Element]()
    
    public init() {}
    
    /**
     push(_:) adds an element to the top of the stack
     */
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    /**
     pop() removes and returns the top element in the stack
     */
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        
        let stackElements = storage
            .map{"\($0)"}
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
    
}
