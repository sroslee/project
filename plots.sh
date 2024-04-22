#!/bin/bash

#unpack R file
tar -xzf R413.tar.gz
tar -xzf packages_FITSio.tar.gz

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages


Rscript plots.R $1
