From python:2.7.16

#WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN wget https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite 
CMD cd group6/db_scripts/ && python ./make_dly_obs_table.py

From r-base:3.5.1
RUN R -e "install.packages('caret',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggfortify',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggplot2',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('RSQLite',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DBI',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('class',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('randomForest',dependencies=TRUE,repos='http://cran.rstudio.com/')"

WORKDIR /group6/models/ 
# RUN Rscript final_model_output_script.R
CMD ["Rscript","final_model_output_script.R"]

