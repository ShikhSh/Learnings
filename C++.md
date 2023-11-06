# C++ Basics
### Important Includes:
- What does #include do?
  - #something -> Directive - https://learn.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp?view=msvc-170
  - Tells the preprocessor to include the contents of a specified file at the point where the directive appears.
  - Makes it easier to read, maintain, and modify code.
  - Important Directives:
    - #include <bits/stdc++.h> -> includes most of the important functionalities like:
      - vectors - #include <vector>
## Pass by value/reference:
- Passed by value by default!
- For Vectors/Maps/Sets, etc -> use & operator
  - void pass_by_ref(vector<int>& v) {...}
- For array -> can use pointers
# C++ Data Structures
## Vectors:
### Size:
- v.size()
### Access elements:
- v.back() ; v.front()
- 
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
- 
