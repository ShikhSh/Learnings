# C++ Basics
## Important Includes:
- What does #include do?
  - #something -> Directive - https://learn.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp?view=msvc-170
  - Tells the Compiler/Preprocessor to include the contents of a specified file at the point where the directive appears before this code is compiled.
  - Makes it easier to read, maintain, and modify code.
  - Important Directives:
    - #include <bits/stdc++.h> -> It is basically a header file that includes every standard library. In programming contests, using this file is a good idea, when you want to reduce the time wasted in doing chores; especially when your rank is time sensitive.
      - vectors - #include <vector>
      - https://www.geeksforgeeks.org/bitsstdc-h-c/
## Pass by value/reference:
- Passed by value by default!
- For Vectors/Maps/Sets, etc -> use & operator
  - void pass_by_ref(vector<int>& v) {...}
- For array -> can use pointers
# C++ Data Structures
`abs`
## Vectors:
### Size:
- v.size()
### Access elements:
- v.back() ; v.front()
### Update:
- v.push_back(ele)
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
