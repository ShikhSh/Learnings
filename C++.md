# C++ Basics
- https://www.geeksforgeeks.org/c-plus-plus/?ref=lbp
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

## Class vs Struct:

## Pass by value/reference:
- Passed by value by default!
- For Vectors/Maps/Sets or anything else including int, etc -> use & operator
  - void pass_by_ref(vector<int>& v) {...}
- For array -> can use pointers

## Memory Allocation and Resource Management:
https://stackoverflow.com/questions/6500313/why-should-c-programmers-minimize-use-of-new
https://isocpp.org/wiki/faq/freestore-mgmt#:~:text=Having%20said%20that%2C%20benefits%20of,which%20isn't%20type%20safe.
https://stackoverflow.com/questions/655065/when-should-i-use-the-new-keyword-in-c

new/delete vs malloc vs static allocation
- RAII - https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization
  -  Resource allocation (or acquisition) is done during object creation (specifically initialization), by the constructor, while resource deallocation (release) is done during object destruction (specifically finalization), by the destructor. In other words, resource acquisition must succeed for initialization to succeed. Thus the resource is guaranteed to be held between when initialization finishes and finalization starts (holding the resources is a class invariant), and to be held only when the object is alive. Thus if there are no object leaks, there are no resource leaks.
  -  RAII greatly simplifies resource management, reduces overall code size, and helps ensure program correctness. RAII is therefore recommended by industry-standard guidelines, and most of the C++ standard library follows the idiom.
  -  Local variables allow easy management of multiple resources within a single function: they are destroyed in the reverse order of their construction, and an object is destroyed only if fully constructed.
  -  Provides encapsulation.
  -  Resource management therefore needs to be tied to the lifespan of suitable objects in order to gain automatic allocation and reclamation. Resources are acquired during initialization, when there is no chance of them being used before they are available, and released with the destruction of the same objects, which is guaranteed to take place even in case of errors.
  -  Ownership of dynamically allocated objects (memory allocated with new in C++) can also be controlled with RAII, such that the object is released when the RAII (stack-based) object is destroyed. For this purpose, the C++11 standard library defines the smart pointer classes std::unique_ptr for single-owned objects and std::shared_ptr for objects with shared ownership.
  -  Perl, Python (in the CPython implementation),[20] and PHP[21] manage object lifetime by reference counting, which makes it possible to use RAII. Objects that are no longer referenced are immediately destroyed or finalized and released, so a destructor or finalizer can release the resource at that time.
- Dynamic
- Static
  
## Features:
### Virtual functions + Runtime Polymorphism + Dynamic/Late Binding
https://www.geeksforgeeks.org/virtual-function-cpp/#

# C++ Data Structures
`abs`
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
