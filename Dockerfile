# Docker file for Customer Segmentation Project
# Amelia Tang

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install R packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    

# install the kableExtra package using install.packages
RUN Rscript -e "install.packages('kableExtra')"