# Uber_Supply_Demand_Gap_Analysis

## 📖 Project Summary

This project aims to analyze the Uber trip request data to identify the demand-supply gap. The objective is to understand the patterns and key metrics that cause trip cancellations, lack of available cars, and ultimately help Uber optimize its operations.

## 🎯 Problem Statement

The trip request data contains entries with empty `"Drop timestamp"` for two valid cases:

* The trip was **cancelled**.
* **No cars were available** to service the request.

This behavior is expected and not considered as missing data. Similarly, the `"Driver id"` is null for failed trip requests, which is also expected.

## 📊 Analysis Steps

1. **Data Loading & Cleaning**

   * Load the trip request data (`Uber Request Data.csv`).
   * Handle nulls appropriately (for `"Drop timestamp"` and `"Driver id"`).
2. **Exploratory Data Analysis (EDA)**

   * **Univariate Analysis** — Assess distributions of request statuses and pickup points.
   * **Bivariate Analysis** — Explore relationships between time of day, request status, and other features.
   * **Multivariate Analysis** — Investigate how multiple features jointly affect demand-supply gaps.

## 🧠 Insights

Some key observations:

* Null drop timestamps are valid and represent failed trips.
* Requests that failed often have missing driver information as no car was allocated.

## 🛠️ Tools & Libraries

* `Python` 3.x
* `Pandas` for data wrangling
* `NumPy` for numerical computing
* `Seaborn` and `Matplotlib` for data visualization

## 🏁 Next Steps

1. **Visualize demand-supply trends** — heatmaps for hourly and geographic patterns.
2. **Identify peak-demand periods** where failed trips spike.
3. **Optimize fleet deployment** — derive actionable recommendations to minimize supply-demand gaps.
