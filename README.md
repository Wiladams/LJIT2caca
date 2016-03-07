# LJIT2caca
Serious shit wrapped in Lua goodness

No, seriously.  libcaca (https://github.com/cacalabs) is a library that 
supports "ascii art".  The library has routines to essentialy take any 
bitmap image and display using only ascii charaters.

For the most part this is just a toy/stunt/waste of time, but it's
an interesting engineering challenge nonetheless.

The LuaJIT binding is no joke.  It wraps the entire library with at
least a bare minimum of ffi interop calls.  Additionally, it lifts the
various constants up so they are easily accessible from a table.

There are simple 'objects' which consolidate various calls into 
logical groupings, to make it even simpler to write applications 
using the library.

The general feel of the binding is similar to the Python binding.
No worries about alloc/free, no worries about converting between 
types and the like.

Overall, this is as good a binding/library to learn LuaJIT ffi
as any.

