# Hydro-analytics Paper Reproducibility Project
This is a clone of the repository that hosts the code of a hydrology-related research paper, published by Sadler et al. 2018 (https://doi.org/10.1016/j.jhydrol.2018.01.044). This repo serves as a use case of setting up and running a research reproducibility workflow. 

The following changes & additions were made:
* Debug and modified python, Jupyter Notebook, and R codes to determine dependencies and fix broken links to data.
* Docker containers for 3 processes (2 parallel for data analytics and a subsequent serial one for modeling).
* Automated the entire workflow process using dockers.

## Reproducibility Instructions
There are 3 methods that can be followed to reproduce the Sadler et al. 2018 paper's results:
* All 3 methods will need that you can clone this github to your local machine. \
```$ git clone https://github.com/cyber-carpentry/group6.git``` 
* These methods will refer to PATH TO GITHUB REPOSITORY which is the path from your home directory to the github repository on your local machine. Enter ```$ pwd``` in the command line when you are in the github repository to see the path.

### Method 1: Automated Docker Images
0. This method requires [Docker](https://www.docker.com/) to be installed on your machine.
1. Run all the Dockers using ```$ ../all.sh``` in the command line.
  * This command should be run in the main github directory (PATH TO GITHUB REPOSITORY).
2. Completed, flood_events.csv, nor_daily_observations.csv, and for_model_avgs.csv should be created in the db_scripts folder.

### Method 2: Build Docker Image
0. This method requires [Docker](https://www.docker.com/) to be installed on your machine.
1. Build Docker image \
```$ docker build -t flood_pred . ```
* This command should run in the main GitHub directory (PATH TO GITHUB REPOSITORY)
* There will be a file called Dockerfile in this directory.
2. Run the Docker image using \
```$ docker run -v PATH TO GITHUB REPOSITORY/group6:/group6 flood_pred```
3. Completed, flood_events.csv, nor_daily_observations.csv, and for_model_avgs.csv should be created in the db_scripts folder.

### Method 3: Running Manually
0. This method requires creating both the python and R enviroment for running the scripts.
* Python 2.7.16 was used and the required python modules with there verisons can be seen in requirements.txt
* R 3.5.1 was used with caret, ggfortify, ggplot2, dplyr, RSQlite, DBI, class, and randomForest packages. All packages were installed from the http<span></span>://cran.rstudio.com/ repo.
1. Change to parent directory of repository directory \
```$ cd PATH TO REPOSITORY/..```
2. Get file from [Hydroshare](https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite) \
```$ wget https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite```
* This will download a file in the current directory (Outside respository directory)
3. Go to database scripts directory \
```$ cd group6/db_scripts```
4. Run python script to process street floods data \
```$ python prepare_flood_events_table.py```
* This will create flood_events.csv
5. Run python scirpt to process enviromental data \
```$ python make_dly_obs_table.py```
* This will create nor_daily_observations.csv
6. Run python script for combining flood and enviromental data \
```$ python by_event_for_model.py```
* This requires flood_events.csv and nor_daily_observations.csv and creates for_model_avgs.csv
7. Change to the model directory \
```$ cd ../models```
8. Run R scripts for analysis \
```$ Rscript final_model_output_script.r```

The team members that led this effort were participants of the Cyber Carpentry 2019 workshop at the University of North Carolina at Chapel Hill.
Note: You can access the original repository [here](https://github.com/uva-hydroinformatics/flood_data).

