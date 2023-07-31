# Customer Segmentation Cluster Analysis in R
- Author: Amelia Tang 

## About

This project aims to identify customer segments using a subset of the customer information dataset from [kaggle.com](https://www.kaggle.com/datasets/vetrirah/customer). The dataset contains 6718 rows of non-null data. To conduct the customer segmentation analysis, I utilized the k-means clustering algorithm and implemented the algorithm in R. 

K-means is a popular unsupervised machine learning algorithm used for clustering data points into K distinct clusters based on their similarity. It's one of the most popular algorithms for customer segmentation analysis. The below diagram illustrates how the algorithm works step by step:

![k-means](doc/kmeans_steps.png)

After clustering the data, the clusters are visualized using `clusplot`. Clusplot shows first two principal components to explain the clusters.
<br>
<img src="results/cluster_for_readme.png" alt="cluster plot" width="500">



## Reports 
[EDA Report using ggplot2](doc/Customer_Segmentation_EDA_Report.pdf)
<br>
[Customer Segmentation using K-means Clustering Project Report](doc/Customer_Segmentation_Project_Report.pdf)

## Usage

There are two suggested ways to run this analysis:

#### 1. Using Docker
TBU
#### 2. Without using Docker
TBU

## Dependencies
TBU 
