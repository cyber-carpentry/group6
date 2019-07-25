# Group6
This is a clone of the repo that hosts the code of a hydrology-related research paper published by Sadler et al. 2018 https://doi.org/10.1016/j.jhydrol.2018.01.044.
This repo serves as a use case of setting up and running a research reproducibility workflow. 

The following changes & additions were made:
* Re-run and slightly modified python, Jupyter Notebook, and R codes locally (local machines) to define dependencies, check packages, and fix broken links to data (minor changes can be tracked by checking our commits).
* Addition of docker containers for 3 processes (2 parallel for data analytics and a subsequent serial one for modeling).
* Snakefiles used to automate the workflow process.
* Binder for interactively testing scripts.

* Step 0: Base that you need, docker, snakemake, singularity, and clone github 
* Step 1: Reproducibility sorted based on ease of execution 
  * Run snakemake easy or hard  
  * Build your own docker and run it combined (images and run them)
  * Commands follow those (inputs and outputs) complete process

The team members that led this effort were participants of the Cyber Carpentry 2019 workshop at the University of North Carolina at Chapel Hill.
Note: You can access the original repository here: https://github.com/uva-hydroinformatics/flood_data.

