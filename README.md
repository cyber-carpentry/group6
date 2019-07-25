# Group6
This is a clone of the repo that hosts the code of a hydrology-related research paper published by Sadler et al. 2018 https://doi.org/10.1016/j.jhydrol.2018.01.044.
This repo serves as a use case of setting up and running a research reproducibility workflow. 

The following changes & additions were made:
* Re-run and slightly modified python, Jupyter Notebook, and R codes locally (local machines) to define dependencies, check packages, and fix broken links to data (minor changes can be tracked by checking our commits).
* Addition of docker containers for 3 processes (2 parallel for data analytics and a subsequent serial one for modeling).
* Snakefiles used to automate the workflow process.
* Binder for interactively testing scripts.

There are 3 methods that can be followed to reproduce the papers results:
* All 3 methods will need that you can clone this github to your local machine. (git clone https://github.com/cyber-carpentry/group6.git)
* These methods will refer to PATH TO GITHUB REPOSITORY which is the path from you home directory to the github repository on your local machine.
### Method 1: Snakemake with Docker Images
0. This method requires Docker(https://www.docker.com/) and Singularity (https://sylabs.io/docs/) to be installed on your machine
1. SNAKEMAKE STUFF DOCKER? REQUIRED? ALSO snakefile need to have better file pointers
2. Run snakemake using "snakemake" in the command line
  * This command should be run in the main github directory (PATH TO GITHUB REPOSITORY)
  * There will be a file called snakefile in this directory
3. Completed, flood_events.csv, nor_daily_observations.csv, and for_model_avgs.csv should be created in db_scripts

### Method 2: Build Docker Image
0. This method requires Docker(https://www.docker.com/) to be installed on your machine
1. build docker image "docker build -t flood_pred ."
* This command should be run in the main github directory (PATH TO GITHUB REPOSITORY)
* There will be a file called dockerfile in this directory
2. Run the docker image using "docker run -v PATH TO GITHUB REPOSITORY/group6:/group6 flood_pred"
3. Completed, flood_events.csv, nor_daily_observations.csv, and for_model_avgs.csv should be created in db_scripts

### Method 3: Creating and Running Manually
0. This method requires creating both the python and R enviroment for running the scripts.
* Python 2.7.16 was used and the required python modules with there verisons can be seen in requirements.txt
* R information
0.1: change to repository directory "cd PATH TO REPOSITORY"
0.2 Change to parent directory of repository directory "cd .."
1. Get file from hydroshare "wget https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite"
* This will download a file in the current directory (Outside respository directory)
2. Go to database scripts directory cd group6/db_scripts
3. Run python script to process street floods data "python prepare_flood_events_table.py"
* This will create flood_events.csv
4. Run python scirpt to process enviromental data "python make_dly_obs_table.py"
* This will create nor_daily_observations.csv
5. Run python script for combining flood and enviromental data "python by_event_for_model.py"
* This requires flood_events.csv and nor_daily_observations.csv and creates for_model_avgs.csv
6. 
  * Run snakemake easy or hard  
  * Build your own docker and run it combined (images and run them)
  * Commands follow those (inputs and outputs) complete process

The team members that led this effort were participants of the Cyber Carpentry 2019 workshop at the University of North Carolina at Chapel Hill.
Note: You can access the original repository here: https://github.com/uva-hydroinformatics/flood_data.

