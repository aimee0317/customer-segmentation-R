# Docker file for Customer Segmentation Project
# Amelia Tang

# use arm64v8/r-base as the base image 
FROM docker pull arm64v8/r-base

# install R packages using install.packages
RUN Rscript -e "install.packages(c('kableExtra', 'tidyverse', 'ggplot2', 'fastDummies', 'factoextra', 'cluster', 'knitr', 'ggthemes')"

