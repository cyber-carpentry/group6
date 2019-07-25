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