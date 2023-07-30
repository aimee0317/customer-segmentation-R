# Load Libraries 
library(dplyr)
library(tidyverse)
library(fastDummies)
library(factoextra)
library(cluster)

# Read processed data 
data <- read_csv("./data/processed/clean_data.csv", show_col_types = FALSE)

# Start building dataset 
dataset <- data |> dplyr::select(where(is.numeric))
character <- data |> dplyr::select(where(is.character))

# Transform character into numerical / dummy 
character <- dummy_cols(character, 
                        remove_most_frequent_dummy = TRUE)

# Finalize the data set 
dataset <- cbind(dataset, character[, 6:18])
dataset[, 1:16] <- scale(dataset[, 1:16])

# Determining the amounts of segments 
elbow_plot <- fviz_nbclust(dataset, kmeans, method = "wss") +
  labs(subtitle = 'Elbow Method')
ggsave("./results/elbow_plot.png", plot = elbow_plot, dpi = 300)

# Kmeans Clustering 
clusters <- kmeans(dataset, centers = 6, iter.max= 10)
saveRDS(clusters, file = "results/model.rds")

# Plot the cluster 
dataset <- dataset |> dplyr::mutate(clusters = clusters$cluster)
write.csv(dataset, file = "data/processed/clusters.csv", row.names = FALSE)
cluster_plot = clusplot(dataset, 
                        clusters$cluster, 
                        color = TRUE, 
                        shade = TRUE, 
                        main = "Cluster Plot for Customer Segmentation",
                        labels = 0, 
                        lines = 0)