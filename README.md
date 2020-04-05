# manual_c_cpp
Examples of manually wrapping C/C++ externals in Eiffel

## Purpose
The purpose of this example project (especially the `test` target) is to demonstrate successful hand-coded wrapping of either C API code directly or external DLLs.

## Prerequisites
This code was developed on MS Windows 10 using Visual Studio 2020 and Eiffel 19.11. If you are using any other OS (e.g. Linux, Mac) then the "test" code will not work.

## Documentation Style
Documentation comes to you from several angles at once.

1. Self-documenting code — great care is being taken to name features, arguments, and other identifiers in such a way that they tell their own story without need of other documentation (see below). Not only this, but look to self-documentation from Design-by-Contract code as well.

2. Wrapped Classes — each class which either wraps C API code or DLL functions (MS Windows) will have both class-level and feature-level note clauses, which will include EIS links to any external documentation (e.g. websites and so on).

3. Test Classes — each Wrapped Class will have a Test Class, which exercises the features of the former in the latter. The test features will have their own self-documenting aspects as well as class and feature-level notes to tell a greater story (if needed).

Together—the three items above ought to provide you with enough information to successfully do your own hand-coded C API or DLL wrappers of equal simplicity or complexity.

Note that the present code demonstrates very simplistic wrapping. More complex examples will come in time. If you have suggestions or other feedback on this or other matters, please feel free to offer them in the Eiffel Community at: https://groups.google.com/forum/#!forum/eiffel-users (specifically here: https://groups.google.com/forum/#!topic/eiffel-users/Rm4qM7o2RU4)

## DLL Wrapping
Apparently, there is more than one way to wrap a DLL (MS Windows). The hand-wrapped code uses one method. There are others.
