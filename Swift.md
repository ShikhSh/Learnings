# Swift

## Design patterns:
- https://medium.com/swlh/ios-design-patterns-a9bd07818129
- https://anupharbade.medium.com/ios-design-patterns-part-2-viper-fa3522b22b6b
- https://www.twilio.com/blog/migrating-swift-ios-mvc-mvvm-html 
1. MVC
2. MVP
3. MVVM
4. VIPER

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
