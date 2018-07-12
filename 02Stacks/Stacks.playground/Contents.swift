example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped element: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let arr = ["A", "B", "C", "D"]
    var stack = Stack(arr)
    print(stack)
    print("---After popping---")
    stack.pop()
    print(stack)
}

example(of: "initializing from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    print("---After popping---")
    if let poppedValue = stack.pop() {
        print(stack)
        print("Popped value: \(poppedValue)")
    }
}
