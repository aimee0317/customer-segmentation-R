# Read processed data 
data <- read_csv("./data/processed/clean_data.csv", show_col_types = FALSE)

# Start building dataset 
library(dplyr)
dataset <- data |> dplyr::select(where(is.numeric))
character <- data |> dplyr::select(where(is.character))

# Transform character into numerical / dummy 
library(fastDummies)
character <- dummy_cols(character, 
                        remove_most_frequent_dummy = TRUE)

# Finalize the data set 
dataset <- cbind(dataset, character[, 6:18])
dataset[, 1:16] <- scale(dataset[, 1:16])
write.csv(dataset, 'data/processed/data_clean.csv')

# Determining the amounts of segments 
library(factoextra)
fviz_nbclust(dataset, kmeans, method = "wss") + 
  labs(subtitle = 'Elbow Method')

# Cluster 
clusters <- kmeans(dataset, centers = 6, iter.max= 10)
clusters$centers 
write.csv(clusters$centers, file = 'clusters.csv')
dataset <- dataset |> dplyr::mutate(clusters = clusters$cluster)

# Plot the cluster 
# install.packages("cluster")
library(cluster)
clusplot(dataset, 
         clusters$cluster, 
         color = TRUE, 
         shade = TRUE, 
         main = "Cluster Plot for Customer Segmentation",
         labels = 0, 
         lines = 0)
