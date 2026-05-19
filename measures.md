# DAX Measures — EV Charging & Route Planner Dashboard

All custom DAX measures used in this Power BI report.

---

## KPI Measures

### Total Trips
```dax
Total Trips = COUNTROWS(Trips)
```

### Total Charging Sessions
```dax
Total Charging Sessions = COUNTROWS(ChargingSessions)
```

### Total Energy KWh
```dax
Total Energy KWh = SUM(ChargingSessions[EnergyKWh])
```

### Average Charging Time (Min)
```dax
Avg Charging Time Min = AVERAGE(ChargingSessions[DurationMin])
```

---

## Rate Measures

### Planner Usage %
```dax
Planner Usage % =
DIVIDE(
    CALCULATE(COUNTROWS(Trips), Trips[UsedPlanner] = "Yes"),
    COUNTROWS(Trips),
    0
)
```

### Charging Error Rate %
```dax
Charging Error Rate % =
DIVIDE(
    CALCULATE(COUNTROWS(ChargingSessions), ChargingSessions[ErrorFlag] = 1),
    COUNTROWS(ChargingSessions),
    0
)
```

---

## Trend Measures

### Total Trips by Month
```dax
Total Trips by Month =
CALCULATE(
    COUNTROWS(Trips),
    ALLEXCEPT(DateTable, DateTable[Month])
)
```

### Total Charging Sessions by Month
```dax
Total Sessions by Month =
CALCULATE(
    COUNTROWS(ChargingSessions),
    ALLEXCEPT(DateTable, DateTable[Month])
)
```

---

## Averages by Dimension

### Avg Trip Distance KM by Planner Used
```dax
Avg Distance by Planner =
CALCULATE(
    AVERAGE(Trips[DistanceKM]),
    ALLEXCEPT(Trips, Trips[UsedPlanner])
)
```

### Avg Charging Time by Station Type
```dax
Avg Charging Time by StationType =
CALCULATE(
    AVERAGE(ChargingSessions[DurationMin]),
    ALLEXCEPT(ChargingSessions, ChargingSessions[StationType])
)
```
