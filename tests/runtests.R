# This scripts allows test execution directly from the terminal
# Usage: Rscript runtests.R --token ${token} --suite ${suite}
# suite can be a number or "all"

# Install packages required if needed
if (!require("pacman")) install.packages("pacman")
pacman::p_load(devtools, methods, R.utils, testthat, xml2, stringi, lubridate, tictoc, Hmisc, anytime, humanize, crayon)


# load the onc development package
devtools::load_all("~/API_Samples/R/onc")
library(onc)

# parse arguments
args <- R.utils::commandArgs(asValues = TRUE)

validSuites <- list(
	"0" = "",
	"1" = "test-01-locations.R",
	"2" = "test-02-deployments.R",
	"3" = "test-03-deviceCategories.R",
	"4" = "test-04-devices.R",
	"5" = "test-05-properties.R",
	"6" = "test-06-data-product-discovery.R",
	"7" = "test-07-data-product-delivery.R",
	"8" = "test-08-realtime.R",
	"9" = "test-09-archivefiles.R",
	"all" = "")

# Guard against incomplete arguments
argNames = names(args)
if (!("token" %in% argNames && "suite" %in% argNames)) {
    print(argNames)
    print("ERROR: Insufficient arguments.")
    print("token" %in% argNames)
    print("suite" %in% argNames)
    quit(status = -1)
}

token <- args$token
suite <- args$suite

multiRep <- MultiReporter$new(list(
    ProgressReporter$new(),
    JunitReporter$new(file = "report/output.xml")
))


if (suite %in% names(validSuites)) {
	if (suite == "all") {
		# Test all suites
		testthat::test_dir("testthat", reporter = CheckReporter)
	} else {
		# Test a single suite
		filename <- validSuites[[suite]]
		filepath <- paste("testthat/", filename, sep = "")
		testthat::test_file(filepath, reporter = ProgressReporter)
	}
} else {
	print("ERROR: Invalid suite.")
	quit(status = -1)
}
