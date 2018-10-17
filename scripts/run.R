###############################################################
# SET PARAMETERS
###############################################################
#Check if working directory is `Influence`
#If not, throw error and proceed only after directory is properly set.
dirs <- strsplit(getwd(), "/")
if (dirs[[1]][length(dirs[[1]])] != "Influence"){
  stop("Working directory is ", getwd(), ". Set working directory to the  Influence directory.")
}

#Read `params.csv` and set the parameters
params <- read.csv('../params.csv', header = F, stringsAsFactors = F)
for (key in params[[1]]){
  input_file_idx = match("input file", tolower(params[[1]]))
  if (input_file_idx == NA){
    stop("Column 1 of params.csv not as expected. Please revert the first value of column 1 to 'Input file' verbatim")
  }
  input_file = params[[2]][input_file_idx]

  file_sep_idx = match("file separator", tolower(params[[1]]))
  if (file_sep_idx == NA){
    stop("Column 1 of params.csv not as expected. Please revert the second value of column 1 to 'File separator' verbatim")
  }
  file_sep = params[[2]][file_sep_idx]

  file_header_idx = match("file header", tolower(params[[1]]))
  if (file_header_idx == NA){
    stop("Column 1 of params.csv not as expected. Please revert the third value of column 1 to 'File header' verbatim")
  }
  file_header = as.logical(params[[2]][file_header_idx])

  output_path_idx = match("output path", tolower(params[[1]]))
  if (output_path_idx == NA){
    stop("Column 1 of params.csv not as expected. Please revert the fourth value of column 1 to 'Output path' verbatim")
  }
  output_path = params[[2]][output_path_idx]

  seed_idx = match("seed", tolower(params[[1]]))
  if (seed_idx == NA){
    stop("Column 1 of params.csv not as expected. Please revert the last value of column 1 to 'Seed' verbatim")
  }
  set.seed(params[[2]][seed_idx])
}
###############################################################
# Load files
###############################################################
source("diagnostics.R")
source("inf_analyze.R")
###############################################################
# Execute
###############################################################
run <- function(input_file, file_sep, file_header, output_path){
  cat("Running diagnostics...")
  run_diagnostics(input_file, output_path)
  cat("Diagnostics successfully run")
  cat("\n")
  cat("Performing influence analysis for ", input_file, "...")
  inf_analyze(input_file, file_sep, file_header, output_path)
  cat("Output files generated in ", output_path)
}
###############################################################
run(input_file, file_sep, file_header, output_path)
