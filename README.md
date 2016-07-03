# NEC-rundirectory-to-dataframe
Functions to take a NEC CAMS AMS measurement batch directory as input and scrape all the run directories to compile all the cycle data into a data frame.

## Structure of a run directory
The run directories exist under a top level batch directory. Batch directories are named by staff as `batchXXXX` where the `X`s represent a four digit number assigned sequentially. The run directories are created automatically during measurement by the NEC AccelNet software. They are named `runNN.MM`, where `NN` is an item number (at least two digits, e.g. item 2 is 02, while item 124 is 124) assigned to each cathode in the runlist and `MM` is the measurement number (again, at least two digits, e.g. measurement 4 is 04). The structure is outlined below:

batch1657
* run00.01
  + cntr
  + evt14C
  + gates
  + he12C
  + he13C
  + hist
  + le12C
  + le13C
  + setup
* run01.01
* ...
* run134.15

### File descriptions
* cntr
  + Contains the cycle batch (every 10 cycles) data for the detector events.
* evt14C
  + 14C event data for every cycle in the run.
* gates
  + General information about the gate setup.
* he12C
  + High energy 12C+ current for each cycle in Amperes.
* he13C
  + High energy 13C+ current for each cycle in Amperes.
* hist
  + Histogram data used by NEC software (energy spread of detected events maybe?)
* le12C
  + Low energy 12C- current for each cycle in Amperes.
* le13C
  + Low energy 13C= current for each cycle in Amperes.
* setup
  + Contains all the metadata for the run being measured such as the sample name cathode position, isotope being measured, charge state, injection energy, accelerator voltage, etc.
  
