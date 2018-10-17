################################################################################
# DIAGNOSTICS
################################################################################
# Helper functions
################################################################################
#Install packages if not present
install <- function(mypkg){
  # Install package passed as parameter if not already installed
  # Parameters:
  # - mypkg: Package to be loaded
  # Returns:
  # No return value

  if (!(mypkg %in% installed.packages())){
    cat("Package not installed, so installing with dependencies... \n Press CTRL C to abort.")
    Sys.sleep(5)
    install.packages(mypkg, dependencies = T)
  }
}

create_dir_if_nonexist <- function(output_path, name){
  # Create name directory if not already present
  # Parameters:
  # - output_path: Absolute path to the output directory
  # Returns:
  # No return value
    path = paste(output_path, name, sep = "")
    if (!dir.exists(path)){
      warning("Creating directory ", path, "...\n")
      dir.create(path)
    }
  }
################################################################################
run_diagnostics <- function(input_file, output_path){
  # Run the following diagnostics:
  # 1. Install the required packages if not already installed
  # 2. Load these packages
  # 3. Check if `input_file` exists
  # 4. Check if `output_path` exists. If not create it
  # 5. Create required folders in output directory, if not already present
  #
  # Parameters:
  # - input_file: Absolute path to the dataset file
  # - output_path: Absolute path to the output directory
  #
  # Returns:
  # No return value

  #1. Install the required packages if not already present
  #install("ProNet") No longer supported by CRAN
  install("igraph")
  install("abind")
  install("sna")
  install("ergm.count")
  install("network")
  #install("tcltk") No longer supported by CRAN
  install("tcltk2")

  #2. Load the packages
  #library(ProNet) No longer supported by CRAN
  library(igraph)
  library(abind)
  library(sna)
  library(ergm.count)
  library(network)
  #library(tcltk) No longer supported by CRAN
  library(tcltk2)

  #3. Check if `input_file` exists
  if (!file.exists(input_file)){
    stop(input_file, " doesn't exist")
  }

  #4. Check if `output_path` exists. If not create it
  if (!dir.exists(output_path)){
    warning(output_path, " doesn't exist")
    cat("Creating", output_path, "...")
    dir.create(output_path)
  }

  #5. Create required folders in output directory if not already present
  for (name in c('/abscut/', '/cluster/', '/fixcut/', '/randhist/', '/randplot/', '/sample/', '/screeplot/', '/sdcut/')){
    create_dir_if_nonexist(output_path, name)
  }
}
