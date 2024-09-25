# Nashville Housing Data Cleaning Project

## Overview

In this project, we take raw housing data and transform it in SQL Server to make it more usable for analysis. The focus is on improving data quality by performing several key cleaning tasks, including:

- **Standardizing Date Formats**: Converting `SaleDate` values into a consistent `Date` format.
- **Populating Missing Property Addresses**: Filling in `NULL` values for property addresses using available data from other records.
- **Splitting Address Fields**: Breaking down property and owner addresses into individual components (e.g., address, city, state).
- **Standardizing Categorical Values**: Converting 'Y'/'N' values in the "Sold as Vacant" field to 'Yes'/'No' for clarity.
- **Removing Duplicates**: Identifying and eliminating duplicate records based on key attributes such as `ParcelID`, `SalePrice`, and `SaleDate`.

## Key SQL Operations

- **Data Conversion**: Using the `CONVERT` function to ensure date consistency.
- **Data Population**: Utilizing `ISNULL` and joins to fill in missing data.
- **String Manipulation**: Applying `SUBSTRING`, `CHARINDEX`, and `PARSENAME` to split address data into separate fields.
- **Conditional Updates**: Using `CASE` statements to update values for better readability.
- **Duplicate Removal**: Leveraging `ROW_NUMBER()` to detect and manage duplicate entries.

## Final Outcome

After these transformations, the dataset is clean, consistent, and ready for analysis, enabling more reliable insights and reporting.
