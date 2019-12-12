**TESTING DOCUMENTATION**

This directory contains an automated test suite written for the R API client using the [testthat package](https://github.com/r-lib/testthat).

Directory structure is as follows:

* testthat: Contains the test suites as individual .R files (required by testthat)
* output:   Default output directory for methods that download files (i.e. orderDataProduct())

Additionally, the testthat package generates the file "tests/testthat.R" to run tests (don't delete/edit).

Test suite files group test cases under the same context. Each test verifies multiple "expectations" and considers each expectation as an individual test. This means that if a test case has 3 expectations failing, the final report will count 3 failures instead of 1.

As R is a young language at the time of this writing, maintainers are encouraged to update this testing framework if in the future the testthat package introduces functionality that allows to structure tests in a better way. For the same reason, make sure these tests work with the latest version of R and its packages, as testthat is reliant on the latest system library packages.


**TESTING REQUIREMENTS**

1. Tests are run from the Console in RStudio (if you prefer a different IDE, please document here what was needed)
2. Install the "testthat" and "R.utils" packages.


**RUNNING THE TESTS**

1. Set the "onc" directory of the R client library as the working directory.

2. Create a global variable "token" with your token

3. Run tests using the following commands in the R console:

To run all tests:

    devtools::test()

To run a single test suite:

	test_file("tests/testthat/test-01-locations.R")

To run a single test from R Studio, select and run the beggining of the test suite file (before test_that() cases begin) so that the onc object and other data and functions get loaded in the environment, and then select and run test cases as needed.


**DEVELOPING TESTS**

New tests and test suites are detected automatically.

Test suites share global variables and functions from the "testthat/global.R" file. Review this file before developing new tests to spot any possible code reusability.

Creating a new test suite requires to create a new file with test_that() test cases and a unique context() title (the title of this test suite). It's recommended to duplicate test suites / test cases for starters.

Documentation on the available testthat expectation functions can be found at: https://testthat.r-lib.org/reference/index.html


**CODE DOCUMENTATION**

For code documentation, we loosely follow the [Google R style guide](https://google.github.io/styleguide/Rguide.xml) for R functions that are not test cases (i.e. those in "global.R"). Code indentation is 4 spaces to take advantage of ONC's computers with big screens.

Test cases are written exactly as described at the [Automated user test documentation](https://internal.oceannetworks.ca/x/xYI2Ag) so documenting their code might be redundant.


**ACKNOWLEDGEMENTS**

Initial author: dcabrera@uvic.ca
Maintainers: 
