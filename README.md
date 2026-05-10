# Airbnb Pricing Anomaly Detection Project

## Introduction
This project focuses on analyzing Airbnb listing data to identify pricing anomalies using data analysis, visualization, and self-supervised machine learning techniques. The goal is to detect listings that may be significantly overpriced or underpriced compared to similar properties.

The project combines:
- Data preprocessing and cleaning
- Exploratory Data Analysis (EDA)
- Autoencoder-based anomaly detection
- Neural Architecture Search (NAS) for model optimization

---
## How to Use the Jupyter Notebooks

It is recommended to use a virtual environment (`venv`) to ensure all dependencies are installed with compatible versions.

> **Note:** Python 3.11 is required because TensorFlow does not currently support newer Python versions.

### Create and Activate the Virtual Environment

```bash
python3.11 -m venv venv
source venv/bin/activate
```

### Install Requirements

```bash
pip install -r requirements.txt
```

### Launch Jupyter Notebook

```bash
jupyter notebook
```

### Select the Correct Kernel

When opening the notebooks, make sure the selected kernel uses the virtual environment:

```text
Python (ML Project)
```


## Business Problem
Airbnb pricing can vary greatly depending on location, room type, seasonality, reviews, and availability. Incorrect pricing may reduce booking performance or indicate unusual market behavior.

This project aims to:
- Discover pricing patterns across neighborhoods
- Detect unusual listings using anomaly detection
- Improve model performance through NAS optimization
- Provide insights for pricing strategy and market analysis

---

## Dataset
The dataset contains Airbnb listing information including:
- Price
- Neighbourhood
- Room type
- Availability
- Reviews
- Minimum nights
- Host information

### Initial Findings
- Some listings had invalid prices (`price = 0`)
- High-price outliers (`price > 1000`) were identified
- Extremely high minimum stay requirements were detected
- Overall dataset quality was good with very few missing values

---

## Project Structure

### Member 1 — Data Loading & Exploration (Abdullah)
- Dataset loading and inspection
- Understanding data structure
- Identifying important variables
- Initial dataset summary

### Member 2 — Data Cleaning & Preprocessing (Paul)
- Handling missing values and duplicates
- Data type conversion
- Feature engineering (month and season extraction)
- Preparing clean dataset for modeling

### Member 3 — Exploratory Data Analysis (Leah)
- Data visualization using Matplotlib and Seaborn
- Price distribution analysis
- Neighborhood comparison
- Seasonal pricing trends

### Member 4 — Self-Supervised Learning Model (Preh)
- Autoencoder model development
- Reconstruction error calculation
- Anomaly score generation

### Member 5 — NAS Optimization
- Hyperparameter tuning using Keras Tuner / Optuna
- Model architecture optimization
- Performance comparison with baseline model

### Member 6 — Evaluation & Integration (Marwa)
- Defining anomaly thresholds
- Evaluating detected anomalies
- Integrating final outputs and insights
- Identifying overpriced and underpriced listings

---

## Technologies Used
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- TensorFlow / Keras
- Optuna / Keras Tuner

---

## Expected Outputs
- Cleaned dataset
- Visual analysis and graphs
- Anomaly detection model
- Optimized neural network
- Final dataset with anomaly labels and scores
- Business insights and conclusions

---

## Conclusion
This project demonstrates how machine learning and data analytics can be applied to real-world pricing problems. By combining EDA, anomaly detection, and NAS optimization, the team aims to identify unusual Airbnb listings and provide meaningful pricing insights.
