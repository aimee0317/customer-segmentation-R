# Customer Segmentation Data Pipe 
# Author: Amelia Tang

# Make all 
all: doc/customer_segmentation_report.html

# Process data 
data/processed/clean_data.csv: src/clean_data.R data/raw/data.csv
	Rscript src/clean_data.R

# Exploratory Data Analysis (EDA)
results/eda1.png results/eda2.png: src/eda.R data/processed/clean_data.csv
	Rscript src/eda.R

# Model Training
results/model.rds results/cluster.csv results/elbow_plot.png: src/clustering_model.R data/processed/clean_data.csv
	Rscript src/clustering_model.R
	
# Report Rendering
doc/customer_segmentation_report.html: doc/customer_segmentation_report.Rmd doc/customer_segmentation.bib results/eda1.png results/eda2.png results/model.rds results/cluster.csv results/elbow_plot.png   
	Rscript -e "rmarkdown::render('doc/customer_segmentation_report.Rmd')"

clean: clean_cleaned_data clean_eda clean_model clean_report

clean_cleaned_data: 
	rm -rf data/processed/clean_data.csv
	
clean_eda:
	rm -rf results/eda1.png
	rm -rf results/eda2.png
	
clean_model:
	rm -rf results/model.rds
	rm -rf results/cluster.csv
	rm -rf results/elbow_plot.png

clean_report: 
	rm -rf doc/customer_segmentation_report.html
