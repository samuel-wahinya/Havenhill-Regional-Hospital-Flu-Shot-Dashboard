# Flu Shot Analytics: 2022 Compliance Report for Havenhill Regional Hospital

# Table of Contents

1. [Project Background](#1-project-background)
2. [Data Structure](#2-data-structure)
   - [Core Tables](#core-tables)
   - [ERD (Entity Relationship Diagram)](#erd-entity-relationship-diagram)
3. [Executive Summary](#3-executive-summary)
   - [Dashboard Snapshot](#dashboard-snapshot)
   - [Key Insights](#key-insights)
4. [Recommendations](#4-recommendations)

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
  - [Pull Required Columns - `flu_shot_2022.sql`](script/flu_shot_2022.sql)
  - [Perform Quality Checks - `flu_shot_2022_quality_check.sql`](script/flu_shot_2022_quality_check.sql)
  - [Clean and Standardize Data - `flu_shot_2022_data_cleaning.sql`](script/flu_shot_2022_data_cleaning.sql)  
- **Tableau** for interactive data visualization
  - 🔗 **[View Interactive Tableau Dashboard](https://public.tableau.com/views/ImmunizationDashboard_17157938691190/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

The resulting dashboard is now a central resource used by Havenhill’s medical directors and community outreach teams to identify underserved groups, evaluate performance, and drive targeted vaccination efforts.

## 2) Data Structure

The data for this project was extracted from Havenhill Regional Hospital’s internal relational database, which follows a normalized structure. Below is an overview of the key tables used:

### Core Tables

- **Patients**
  - Contains demographic details such as name, birth date, race, county, and death date.
  
- **Encounters**
  - Records patient visits to the hospital, including start and stop times.

- **Immunizations**
  - Logs administered vaccines, with codes identifying the vaccine type (e.g., flu shots use code `5302`).

### ERD (Entity Relationship Diagram)

![Healthcare ERD](docs/Healthcare%20ERD.jpg)

## 3) Executive Summary

This report empowers hospital leadership to make data-informed decisions for improving outreach and achieving public health targets.

### 🖼️ Dashboard Snapshot  
![Healthcare Dashboard](docs/Healthcare-Dashboard.jpg)

🔗 **[View Interactive Tableau Dashboard](https://public.tableau.com/views/ImmunizationDashboard_17157938691190/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

---

### 🧠 Key Insights

- **Total Flu Shots Administered**  
  A total of **8,101** flu shots were given to eligible patients, reflecting strong hospital engagement in public health.

- **Overall Compliance Rate**  
  **81.4%** of active patients received their flu shots in 2022, indicating high awareness and access to immunizations.

- **Vaccination by Age Group**  
  - Ages **0–17** and **50–64** had the **highest compliance** (92.1% and 94%), possibly due to school requirements and senior care initiatives.  
  - Ages **18–49** showed **lower uptake**, highlighting an opportunity for targeted awareness campaigns among younger adults.

- **Vaccination by Race**  
  Compliance was **consistently above 80%** across all racial groups, with **Native Americans (85.7%)** and **Black patients (84.9%)** having the highest rates.

- **Vaccination by County**  
  Counties like **Barnstable** (82.5%) and **Berkshire** (82.3%) led in compliance, while **Dukes** and **Nantucket** (80%) show room for slight improvement through localized outreach.

## 4) Recommendations

1. **Target Awareness for Young Adults (18–49)**  
   Patients aged **18–34** (65.8% compliance) and **35–49** (67.6% compliance) showed the lowest flu shot uptake compared to other age groups.  
   ➔ Launch focused educational campaigns and workplace initiatives for this group, highlighting that even healthy adults benefit from annual flu vaccinations.

2. **Outreach in Lower-Compliant Counties**  
   While most counties showed flu shot compliance above 82%, **Dukes** and **Nantucket counties** lagged behind at **80% compliance**.  
   ➔ Consider deploying mobile clinics, partnering with local organizations, or hosting pop-up vaccination events to improve access and awareness.

3. **Earlier and Sustained Campaign Rollout**  
   With an overall compliance of **81.4%**, a stronger push earlier in the flu season could boost numbers.  
   ➔ Initiate flu shot awareness campaigns and appointment scheduling at the **start of Q3**. Reinforce with reminder systems via SMS, email, or patient portal notifications to maximize patient follow-through.

4. **Collaborate with Community Leaders**  
   Strong compliance was observed among the **0–17** (92.1%) and **65+** (91.6%) age groups, likely due to existing community outreach efforts.  
   ➔ Deepen partnerships with schools, local churches, and elder care centers to maintain high vaccination rates among youth and seniors, while expanding reach to mid-aged adults.
