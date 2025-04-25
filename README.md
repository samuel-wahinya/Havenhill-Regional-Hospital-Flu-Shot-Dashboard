# healthcare

## 1) Project Background

As a **Data Analyst at Havenhill Regional Hospital**, I support clinical and administrative teams by turning healthcare data into actionable insights that improve patient outcomes and hospital operations. 

In 2022, the hospital prioritized increasing uptake of the **seasonal influenza (flu) vaccine**—a critical preventive measure for high-risk populations including the elderly, young children, and individuals with chronic illnesses.

To aid this public health effort, I was tasked with building a **Seasonal Flu Vaccination Dashboard** using our internal hospital data. This dashboard would visualize:
- Vaccination trends over time
- Coverage across different demographics
- Geographic distribution across counties
- A full patient-level breakdown of those who received or missed the flu shot

This project utilized:
- **SQL Server** for data extraction and transformation  
- **Tableau** for interactive data visualization

The resulting dashboard is now a central resource used by Havenhill’s medical directors and community outreach teams to identify underserved groups, evaluate performance, and drive targeted vaccination efforts.

## 2) Data Structure

The data for this project was extracted from Havenhill Regional Hospital’s internal relational database, which follows a normalized structure. Below is an overview of the key tables used:

### 📌 Core Tables

- **Patients**
  - Contains demographic details such as name, birth date, race, county, and death date.
  
- **Encounters**
  - Records patient visits to the hospital, including start and stop times.

- **Immunizations**
  - Logs administered vaccines, with codes identifying the vaccine type (e.g., flu shots use code `5302`).

### 📎 ERD (Entity Relationship Diagram)

![Healthcare ERD](docs/Healthcare%20ERD.jpg)
