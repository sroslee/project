Directions on how to clone:

The large original csv was split in the /home/groups/STAT_DSCP/group10 directory into 11 files. These were referenced from here in our submission script.

To run computation on (CHTC): condor_submit job.sub
- This generates 11 smaller csv files in the format ##.csv_predicted.csv which includes a predicted column
- The model summary outputs will be in the output folder (11 will be generated)
