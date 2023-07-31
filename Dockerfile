# Docker file for Customer Segmentation Project
# Amelia Tang

# Use arm64v8/r-base as the base image
FROM arm64v8/r-base

# Install R packages using install.packages
RUN Rscript -e "install.packages(c('kableExtra', 'tidyverse', 'ggplot2', 'fastDummies', 'factoextra', 'cluster', 'knitr', 'ggthemes'))"
