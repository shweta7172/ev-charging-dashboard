# ⚡ EV Charging \& Route Planner Usage Dashboard

> Analyzing EV trip behavior, charging patterns, and route-planner usage to understand user journeys across regions and brands.

\---

## 📌 Project Overview

This Power BI dashboard was built to explore how EV users interact with charging infrastructure and route planning tools. The goal was to identify behavioral patterns across **brands, regions, and charging station types** — and surface actionable insights about user experience and network performance.

This project mirrors real-world BI tasks in the mobility \& automotive space: modeling data, writing DAX measures, and telling a clear story through interactive dashboards.

\---

## 🖥️ Dashboard Preview

!\[EV Charging \& Route Planner Usage Dashboard](./assets/dashboard-preview.png)

\---

## 📊 Key KPIs

|Metric|Value|
|-|-|
|Total Trips|600|
|Total Charging Sessions|909|
|Total Energy Consumed|35,000 KWh|
|Planner Usage Rate|52%|
|Charging Error Rate|49%|
|Avg. Charging Time|32.26 min|

\---

## 🔍 Key Insights

* **VW dominates** trip share at 48.83%, followed by Porsche (30.17%), Audi (12%), and Skoda (9%)
* **Fast charging stations** have a significantly higher average charging time than Normal stations
* **ES-Region** shows the highest charging error rate among origin regions
* **Route planner users** travel longer average distances per trip, suggesting the tool is used for longer journeys
* Trips and charging sessions follow consistent **monthly patterns** throughout the year

\---

## 🛠️ Tech Stack

|Tool|Usage|
|-|-|
|**Power BI Desktop**|Dashboard design \& interactive visuals|
|**DAX**|Custom measures \& KPI calculations|
|**SQL (MySQL)**|Data querying \& transformation|
|**Excel**|Raw data source|

\---

## 🗂️ Data Model

The dataset includes the following key dimensions and facts:

* **Trips** — trip ID, brand, origin region, distance KM, planner used (Yes/No)
* **Charging Sessions** — session ID, station type (Fast/Normal), energy KWh, duration min, error flag
* **Date Table** — month-level time intelligence for trend analysis

\---

## 📁 Repository Structure

```
ev-charging-dashboard/
│
├── assets/
│   └── dashboard-preview.png       # Dashboard screenshot
│
├── data/
│   └── ev\_charging\_data.xlsx       # Source data (Excel)
│
├── dax/
│   └── measures.md                 # All DAX measures documented
│
├── sql/
│   └── queries.sql                 # SQL queries used for data prep
│
└── README.md
```

\---

## 📐 DAX Measures (Highlights)

```dax
-- Planner Usage %
Planner Usage % =
DIVIDE(
    CALCULATE(COUNTROWS(Trips), Trips\[UsedPlanner] = "Yes"),
    COUNTROWS(Trips)
)

-- Charging Error Rate %
Charging Error Rate % =
DIVIDE(
    CALCULATE(COUNTROWS(ChargingSessions), ChargingSessions\[ErrorFlag] = 1),
    COUNTROWS(ChargingSessions)
)

-- Average Charging Time (Min)
Avg Charging Time =
AVERAGE(ChargingSessions\[DurationMin])
```

\---

## 💡 What I Learned

* Designing an **end-to-end analytics workflow**: raw data → data model → DAX → dashboard
* Writing **time intelligence** measures in DAX for monthly trend analysis
* Structuring visuals to tell a coherent story about **user behavior and network health**
* Applying **cross-filtering** between brand, region, and station type slicers

\---

## 🔗 Live Dashboard

> 📎 https://app.powerbi.com/links/7Dqjbn2R5s?ctid=ff28a236-881c-4b29-9b77-71405b66aca2&pbi_source=linkShare

\---

## 👤 Author

**Shweta Kale**


\---

*This project was built as part of a personal portfolio to demonstrate data analytics and BI skills.*

