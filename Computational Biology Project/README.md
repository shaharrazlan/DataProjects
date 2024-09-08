# Single-Cell RNA-Seq Analysis of CLL Expression Clusters

### Overview

This project explores the prediction and implications of Chronic Lymphocytic Leukemia (CLL) RNA expression subtypes at the single-cell level. The research focuses on the development of a predictive tool that can classify CLL cells based on gene expression profiles into predefined Expression Clusters (ECs). The analysis integrates scRNA-seq data processing, gene filtering, normalization, correlation analysis, and the application of advanced single-cell analysis techniques. 

### Team
- **Shahar Razlan** (myself)
- **Sarah Lampert**

### Supervisor
- **Dr. Binyamin Knisbacher**, Head of Research, CLL-Map Project

### Project Goals

3. **Build a Predictive Tool**: To classify CLL cells into molecular subtypes at the single-cell level based on gene expression.
2. **Analyze CLL Temporal Dynamics**: To understand disease progression and how it relates to treatment outcomes.
1. **Data Collection & Standardization**: Standardize scRNA-seq data for CLL to make it applicable to the predictive model.

### Biological Background

Chronic Lymphocytic Leukemia (CLL) is a B-cell cancer, which results in the accumulation of leukemic cells in the bone marrow, blood, and lymphoid tissues. The disease impacts the immune system, increasing risks of infections and autoimmune disorders. 

In 2024, the U.S. alone reported 20,700 new cases of CLL, with 4,440 deaths. Molecular classification of CLL, based on gene mutations and epigenetic markers such as IGHV, has led to the identification of several subtypes, each with distinct clinical behaviors.

### Methods

#### 1. Bulk RNA-Seq Predictive Tool
- **Gene Filtering**: Marker genes for each EC are used to filter the dataset.
- **Expression Calculation**: Calculate average expression per EC type.
- **Normalization**: Normalize gene expression to ensure comparability across EC types.
- **Spearman Correlation**: Measure correlation between the patient’s gene expression profile and predefined EC types.
- **Prediction Comparison**: Compare real vs. predicted ECs and visualize using confusion matrices.

#### 2. Single-Cell RNA-Seq Predictive Tool
- **Data Collection**: scRNA-seq data was obtained from the [3CA website](https://www.weizmann.ac.il/sites/3CA/).
- **Gene Filtering & Normalization**: Similar to the bulk RNA-seq tool, marker genes are used to filter scRNA-seq data.
- **Spearman Correlation**: Correlation analysis to identify EC membership.
  
#### 3. Advanced Methods
- **SAVER**: Used for expression recovery to handle the sparse nature of single-cell data.
- **SingleR**: Automatic tool for cell type annotation in scRNA-seq data. Compared gene profiles against EC profiles.

### Results

1. **Bulk RNA-Seq Predictor**: High performance in predicting ECs from bulk RNA-seq data, with a clear correlation between the highest Spearman coefficient and the correct EC classification.
  
2. **Single-Cell RNA-Seq**: 
   - Using the SAVER imputation did not significantly improve predictions.
   - SingleR provided some improvements but was still not significant enough for reliable EC classification.

3. **Next Steps**: The future direction includes combining scRNA-seq data into pseudo-bulk samples to improve statistical power and developing machine learning algorithms (e.g., XGBoost) for more accurate predictions.

### Project Significance

- **Intra- and Inter-patient Diversity**: Understanding the diversity within and between patients at the single-cell level.
- **CLL Treatment Response**: Insights gained from molecular classification can potentially lead to personalized treatment plans.
- **Temporal Dynamics**: The study of gene expression over time to understand how CLL progresses and responds to different treatments.

### Data Sources
- **CLL-Map**: Multi-omic dataset from over 1,100 CLL samples, including RNA-seq and methylation profiles, with 6+ years of clinical outcome data ([Knisbacher et al, 2022](https://www.nature.com/articles/s41588-022-01070-5)).

### Tools and Libraries Used
- **Python (Scanpy)**: For scRNA-seq data processing and clustering using the Leiden algorithm.
- **SAVER**: For expression recovery of scRNA-seq data.
- **SingleR**: Automated tool for cell type annotation.
- **Spearman Correlation**: For classification of EC types.
- **Confusion Matrices**: For comparing actual vs. predicted ECs.

### Conclusion

This project demonstrates the application of advanced computational biology methods to analyze single-cell RNA-seq data. By developing predictive tools to classify CLL subtypes, the research contributes to understanding disease progression at the molecular level and aids in identifying personalized treatment approaches.

### Presentation
- [Final Presentation](link_to_presentation)
