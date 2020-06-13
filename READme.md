# MATLAB qPCR Data Reader
These scripts are to read CSV files from a RT-qPCR thermocycler and extracts data and visualizes replicates with their error bars.

### Exporting CSV Files from qPCR Reader:

1. After completing your experiment, fill in your samples for each well as normal.
2. Export data files in CSV format, you will need the one ending in '_QuantificationCqResults.csv' specifically.

Note that any spaces ' ' may need to be switched to underscores '_' or dashes '-' for MATLAB to read the file properly.

## File Guide:

*SampleRun_qPCRreader.m*: Hard coded copy to enter inputs, including the information about the sample set and your data.

### Functions:
*qPCRreader.m*: This will read the file and extract your raw deltaCq and dCq expression values for technical replicates
*qPCRbioreps.m*: This function takes your data of all biological replicates and calculates the mean and standard deviations (if more than one data file) and will output figures depicting the normalized gene expression for your samples.
