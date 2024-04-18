
#!/bin/bash

#download data and unpack --> becomes airlines.csv

wget https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/airline.tar.gz
tar -xzf airline.tar.gz

cat airline.csv | cut -d, -f3,5,7,17,30,32,48,55,62 | awk -F, '{ if ($3 == "AA") {print $0} }' > American.csv
cat airline.csv | cut -d, -f3,5,7,17,30,32,48,55,62 | awk -F, '{ if ($3 == "DL") {print $0} }' > Delta.csv
cat airline.csv | cut -d, -f3,5,7,17,30,32,48,55,62 | awk -F, '{ if ($3 == "F9") {print $0} }' > Frontier.csv
cat airline.csv | cut -d, -f3,5,7,17,30,32,48,55,62 | awk -F, '{ if ($3 == "WN") {print $0} }' > Southwest.csv
cat airline.csv | cut -d, -f3,5,7,17,30,32,48,55,62 | awk -F, '{ if ($3 == "UA") {print $0} }' > United.csv
# split by column 7 AA DL F9 WN UA
# keep 3 (month), 5 (dayofweek), 17 (state of origin), 30 (crsdeptime), 32 (departure delay), 48 (cancelled), 55 (distance), 62 (1st departure time),  
#split data by desired areas into many smaller files

#edit


#remove big data file but keep split up files

rm airline.tar.gz
rm airline.csv

#ls the smaller file names into input_file_list
#ls <file names> > input_file_list
ls *.csv > input_file_list
