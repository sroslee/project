#!/bin/bash

#unpack R file
tar -xzf R413.tar.gz

#unpack R libraries
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages
#R script for statistical method
Rscript job.R $1
