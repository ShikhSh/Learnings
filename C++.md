# C++ Basics
- https://www.geeksforgeeks.org/c-plus-plus/?ref=lbp
- Machine Independent + Cross-Platform (NOT platform independent) extension to C (Machine Independent but Platform Dependent: A C++ executable is not platform-independent (compiled programs on Linux won’t run on Windows), however they are machine independent.)
- High-level (+ supports Mid-level) language: It is a mid-level language as we can do both systems-programming (drivers, kernels, networking etc.) and build large-scale user applications (Media Players, Photoshop, Game Engines etc.)
- Compiled Language: C++ is a compiled language, contributing to its speed.
- Object Oriented (thus make maintainable and extensible programs)
- Supports Procedural Functions
- Speed of execution: C++ programs excel in execution speed. Since, it is a compiled language, and also hugely procedural. Newer languages have extra in-built default features such as garbage-collection, dynamic typing etc. which slow the execution of the program overall. Since there is no additional processing overhead like this in C++, it is blazing fast. Code is transformed into machine code before it is executed. This can result in faster execution times and improved performance compared to interpreted languages like Python.
- Support low-level, system-level programming (gives low level control to memory through Pointer and direct Memory-Access) in addition to providing abstractions and supporting High Level Programming
- Supports Generic programming styles through templates
## TODO:
- https://www.geeksforgeeks.org/executing-main-in-c-behind-the-scene/
## Important Includes:
- What does #include do?
  - #something -> Directive - https://learn.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp?view=msvc-170
  - Tells the Compiler/Preprocessor to include the contents of a specified file at the point where the directive appears before this code is compiled.
  - Makes it easier to read, maintain, and modify code.
  - Important Directives:
    - #include <bits/stdc++.h> -> It is basically a header file that includes every standard library. In programming contests, using this file is a good idea, when you want to reduce the time wasted in doing chores; especially when your rank is time sensitive.
      - vectors - #include <vector>
      - https://www.geeksforgeeks.org/bitsstdc-h-c/

## Features:
### Class vs Struct:

### Pass by value/reference:
- Passed by value by default!
- For Vectors/Maps/Sets or anything else including int, etc -> use & operator
  - void pass_by_ref(vector<int>& v) {...}
- For array -> can use pointers

### Memory Allocation and Resource Management:
https://stackoverflow.com/questions/6500313/why-should-c-programmers-minimize-use-of-new
https://isocpp.org/wiki/faq/freestore-mgmt#:~:text=Having%20said%20that%2C%20benefits%20of,which%20isn't%20type%20safe.
https://stackoverflow.com/questions/655065/when-should-i-use-the-new-keyword-in-c

new/delete vs malloc vs static allocation
- RAII - https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization
  -  Resource allocation (or acquisition) is done during object creation (specifically initialization), by the constructor, while resource deallocation (release) is done during object destruction (specifically finalization), by the destructor. In other words, resource acquisition must succeed for initialization to succeed. Thus the resource is guaranteed to be held between when initialization finishes and finalization starts (holding the resources is a class invariant), and to be held only when the object is alive. Thus if there are no object leaks, there are no resource leaks.
  -  RAII greatly simplifies resource management, reduces overall code size, and helps ensure program correctness. RAII is therefore recommended by industry-standard guidelines, and most of the C++ standard library follows the idiom.
  -  Local variables allow easy management of multiple resources within a single function: they are destroyed in the reverse order of their construction, and an object is destroyed only if fully constructed.
  -  Provides encapsulation - encapsulate each resource into a class, where
    - the constructor acquires the resource and establishes all class invariants or throws an exception if that cannot be done,
    - the destructor releases the resource and never throws exceptions;
  -  Resource management therefore needs to be tied to the lifespan of suitable objects in order to gain automatic allocation and reclamation. Resources are acquired during initialization, when there is no chance of them being used before they are available, and released with the destruction of the same objects, which is guaranteed to take place even in case of errors.
  -  Ownership of dynamically allocated objects (memory allocated with new in C++) can also be controlled with RAII, such that the object is released when the RAII (stack-based) object is destroyed. For this purpose, the C++11 standard library defines the smart pointer classes std::unique_ptr for single-owned objects and std::shared_ptr for objects with shared ownership.
  -  Perl, Python (in the CPython implementation),[20] and PHP[21] manage object lifetime by reference counting, which makes it possible to use RAII. Objects that are no longer referenced are immediately destroyed or finalized and released, so a destructor or finalizer can release the resource at that time.

- IMP! For DSA - If creating a Treenode or TrieNode, use dynamic memory allocation with New, since they need to persist beyond the scope of the current object/function to be tested on online platforms.
- Dynamic
- Static

### Virtual functions + Runtime Polymorphism + Dynamic/Late Binding
https://www.geeksforgeeks.org/virtual-function-cpp/#

### Auto Keyword:
- The idea of the auto keyword was to form the C++ compiler to deduce the data type while compiling instead of making you declare the data type every freaking time. Do keep in mind that you cannot declare something without an initializer. There must be some way for the compiler to deduce your type.
- https://www.geeksforgeeks.org/type-inference-in-c-auto-and-decltype/

### Global and local variables with same name:
- scope resolution for the global variable
- https://www.geeksforgeeks.org/scope-resolution-operator-in-c/
  - ::x
  - this->x

### Datatypes:
- Primitive
- Derived - https://www.geeksforgeeks.org/derived-data-types-in-c/?ref=lbp
- User-defined
#### Reference vs Pointers:
- Pointers are symbolic representation of addresses. They enable programs to simulate call-by-reference as well as to create and manipulate dynamic data structures.
- When a variable is declared as reference, it becomes an alternative name for an existing variable. A variable can be declared as reference by putting ‘&’ in the declaration.

### Static Variables
- Static variables in a Function: When a variable is declared as static, space for it gets allocated for the lifetime of the program. Even if the function is called multiple times, space for the static variable is allocated only once and the value of the variable in the previous call gets carried through the next function call.
- Static variables in a class: As the variables declared as static are initialized only once as they are allocated space in separate static storage so, the static variables in a class are shared by the objects.
- Static functions in a class: Just like the static data members or static variables inside the class, static member functions also do not depend on the object of the class. We are allowed to invoke a static member function using the object and the ‘.’ operator but it is recommended to invoke the static members using the class name and the scope resolution operator. Static member functions are allowed to access only the static data members or other static member functions, they can not access the non-static data members or member functions of the class. 

### Inline functions:
- https://www.geeksforgeeks.org/inline-functions-cpp/?ref=lbp
- C++ provides inline functions to reduce the function call overhead. An inline function is a function that is expanded in line when it is called. When the inline function is called whole code of the inline function gets inserted or substituted at the point of the inline function call. This substitution is performed by the C++ compiler at compile time. An inline function may increase efficiency if it is small.
- Function call overhead doesn’t occur.
- It also saves the overhead of push/pop variables on the stack when a function is called.
- It also saves the overhead of a return call from a function.
- When you inline a function, you may enable the compiler to perform context-specific optimization on the body of the function.


# C++ Data Structures
### Macros for data type ranges
- INT_MIN - The minimum value for an object of type int
- INT_MAX - Maximum value for an object of type int
- UINT_MAX - Maximum value for an object of type Unsigned int
- LONG_MIN - The minimum value for an object of type long int
- LONG_MAX - Maximum value for an object of type long int
- ULONG_MAX - Maximum value for an object of type Unsigned long int
- LLONG_MIN - The minimum value for an object of type long long int
- LLONG_MAX - Maximum value for an object of type long long int
- Primitive data types - https://www.geeksforgeeks.org/cpp-data-types/?ref=lbp
### Implicit Type conversion
`bool -> char -> short int -> int -> unsigned int -> long -> unsigned -> long long -> float -> double -> long double`
## Vectors:
### Size:
- v.size()
### Access elements:
- v.back() ; v.front()
### Update:
- v.push_back(ele) -> for vector of vectors, creates a deep copy and then stores it (https://www.geeksforgeeks.org/push_back-vs-emplace_back-in-cpp-stl-vectors/)
- v.pop_back()
- v.clear() -> remove all
- v.erase()
### Iterators:
- Vector iterators are used to point to the memory address of a vector element. In some ways, they act like pointers in C++.
- v.begin() -> first element
- v.end() -> comes AFTER the last element
- Access element by dereferencing -> *iter
- vector<int>::iterator it;
- for(it = v.begin(); it != v.end(); it++)
    cout << *it << "\n"; -> IMP!! - how to access item through vector -> *it
### References:
- https://www.programiz.com/cpp-programming/vectors

## Template:
### Size
### Access/find
### Update
### Iterators
### References

## Template:
### Size
### Access/find
### Update
### Iterators
### References
