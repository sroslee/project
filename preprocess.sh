	#!/bin/bash

#download data and unpack --> becomes airlines.csv

wget https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/airline.tar.gz
tar -xzf airlines.tar.gz

# split by column 7 AA DL F9 WN UA
# keep 3 (month), 5 (dayofweek), 17 (state of origin), 30 (crsdeptime), 32 (departure delay), 48 (cancelled), 55 (distance), 62 (1st departure time),  
#split data by desired areas into many smaller files




#remove big data file but keep split up files

rm airlines.tar.gz
rm airlines.csv

#ls the smaller file names into input_file_list
#ls <file names> > input_file_list
