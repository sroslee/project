#!/bin/bash

#unpack R file
tar -xzf R413.tar.gz

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages


Rscript Rscript.R $1
