# Swift
## System Design Approach:
- https://www.youtube.com/watch?v=pfrjGFDXRt4
- Additional resources (if needed) - https://medium.com/@m3amer/ios-system-design-architecture-example-d55384da1449

## Design patterns:
- https://medium.com/swlh/ios-design-patterns-a9bd07818129
- https://anupharbade.medium.com/ios-design-patterns-part-2-viper-fa3522b22b6b
- https://www.twilio.com/blog/migrating-swift-ios-mvc-mvvm-html 
1. MVC
2. MVP
3. MVVM
4. VIPER

## Protocols and Protocol-based programming:
- The protocol-oriented programming (POP) approach in iOS development is similar to using interfaces in other programming languages, such as Java or Swift's predecessor, Objective-C. Protocols in Swift are akin to interfaces in other languages, providing a way to define a set of methods and properties that a conforming type must implement.
- Here are some key similarities:
- Definition of Contracts:
- Both protocols and interfaces define a contract or blueprint for a set of methods and properties that conforming types or classes must adhere to.
    - Conformance: Types in Swift conform to protocols, just as classes in other languages implement interfaces. Conformance implies that the type provides implementations for all the requirements specified by the protocol or interface.
    - Polymorphism: Protocols support polymorphism, allowing multiple types to conform to the same protocol. This facilitates the use of generic code that can work with any type adhering to a specific protocol.
    - Code Reusability: Both protocols and interfaces promote code reusability by allowing different types to share a common set of functionalities.
- However, there are also differences between protocols in Swift and interfaces in some other languages:
    - Protocol Extensions: Swift introduces the concept of protocol extensions, allowing you to provide default implementations for methods in a protocol. This enables retroactive modeling of protocols, meaning you can make existing types conform to a protocol without modifying their source code.
    - Value Types: In Swift, both classes and value types (structs and enums) can conform to protocols. This is different from some other languages where interfaces are typically implemented by classes.
    - Associated Types: Swift protocols can include associated types, allowing protocols to represent generic types that are not specified until the protocol is adopted.

## Dependency Injection:
- https://www.youtube.com/watch?v=RlfLCWKxHJ0

## @nonescaping closures:
- Closures by default -> non-escaping, i.e. they will not exit the scope of the current function to which they are passed on to.
- by defining them as non-escaping -> let them go beyond the scope of the current function.
- Helps in compiler optimization - because if the compiler knows that the closure is non-escaping, will take care about the memory allocation for the closure.
- Another one is, we can use self without problems in non-escaping closures because the closure executes before the function returns so the self will be there by sure. We don’t need to use weak self.

    // Function taking an escaping closure as a parameter
    func performAsyncOperation(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            // Simulating an asynchronous operation
            // ...
    
            // Call the completion closure when the operation is done
            completion()
        }
    }
    // Example of using the function
    performAsyncOperation {
        print("Asynchronous operation completed")
    }

- Here closure escapes the execution of the current function since it is passed on to an async queue.
