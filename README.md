# Influence Analysis

This repository contains the code for implementing the algorithms given in [Krishnaraj, P. M., Ankith Mohan, and K. G. Srinivasa. "Performance of procedures for identifying influentials in a social network: prediction of time and memory usage as a function of network properties." Social Network Analysis and Mining 7.1 (2017): 34.](https://link.springer.com/content/pdf/10.1007%2Fs13278-017-0454-1.pdf).

To execute the scripts, do the following:
1. In *params.csv*, edit the values in column 2, the values after each of the commas.
   1. **Do not change column 1, i.e, Input file, File separator, File header, Output path or Seed**.
   2. **Do not give a space after the comma**.
   3. Failure to comply with either of the above steps will result in code failure or abnormal behavior.  

2. **Set the current directory to the `Influence` directory**.

3. Run `source("scripts/run.R")`

The output will be the following directories:
1. *abscut*: An eps file for each of the detected cluster with its influentials identified by the *absolute cut score method* in red.
2. *cluster*: An eps file for each of the detected cluster.
3. *fixcut*: An eps file for each of the detected cluster with its influentials identified by the *fixed percentage of propulation method* in blue.
4. *randhist*: A png file for each of the detected cluster with the frequency as function of the in-degree of each of the vertices in this cluster. All vertices with in-degree greater than its random counterpart at 95% level of significance is considered an influential.
5. *randplot*: An eps file for each of the detected cluster with its influentials identified by the *random permutation method* in chocolate.
6. *sample*: An eps file for each of the samples until the statistically significant sample is found using the stopping criteria. Each eps file shows the clusters in a different color.
7. *screeplot*: An eps file for each of the detected cluster with the screeplot of the indegree of all the vertices corresponding to this cluster:
	1. A vertical blue line for *fixed percentage of population method*. All vertices to the left of this line are influentials.
	2. A horizontal red line for *absolute cut score method*. All vertices above this line are influentials.
	3. A horizontal green line for *standard deviation method*. All vertices above this line are influentials.
8. *sdcut*: An eps file for each of the detected cluster with its influentials identified by the *standard deviation method* in green.
