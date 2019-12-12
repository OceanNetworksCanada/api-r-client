**Development and Contribution Guidelines**

*Code Style*

This package follows the tidyverse style guide (https://style.tidyverse.org)
with the following variations:

1. This package can only contain classes of the Reference Class model

2. Private class method names always start with a dot (same as Google's R style guide)
   Examples: .print(), .myPrivate()

3. Public class method names always start with a lowercase letter

4. Indentation level: 4 spaces (no tabs)

5. Prefer to write function parameters in the same line of text, except when
   the function header is more than 120 characters long.

6. Adding spaces to visually align lists of contiguous similar lines of code is
   loosely encouraged (not mandatory).
   
   Good example:
   
      myVar <- 3
      faq   <- TRUE
   
   However, it's discouraged in cases where an excess of additional spaces would make
   the code harder to read.
   
   Don't do this:
   
      a                   <- 2
      stopCallbackHandler <- function() (...)
      b                   <- 1
   
   Instead, do:
      a <- 2
      b <- 1
      stopCallbackHandler <- function() (...)
      

*Code documentation*

At the time of this writing (2019) Roxygen2 doesn't have reasonable support for
reference classes. However, in preparation of a future where this changes,
we document with Roxygen2 with the following indications:

1. Do NOT use roxygen imports (i.e. @importFrom). Edit NAMESPACE manually.

2. RC class methods are documented the same way as a normal function, except for
   those in the Onc class, which only carry a docstring (the only method 
   documentation supported by doxygen2).

3. Do not include @examples, there's a plethora of them at our Wiki

Once Roxygen2 improves its RC support or an alternative documentation method becomes
more suitable, feel free to update this section.
