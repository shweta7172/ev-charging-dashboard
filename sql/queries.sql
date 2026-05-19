-- ============================================================
-- EV Charging & Route Planner Usage Dashboard
-- SQL Queries (MySQL) — Data Preparation
-- ============================================================


-- 1. Total trips per brand
SELECT
    Brand,
    COUNT(*) AS TotalTrips,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS TripSharePct
FROM Trips
GROUP BY Brand
ORDER BY TotalTrips DESC;


-- 2. Charging error rate by origin region
SELECT
    t.OriginRegion,
    COUNT(cs.SessionID) AS TotalSessions,
    SUM(cs.ErrorFlag) AS ErrorSessions,
    ROUND(SUM(cs.ErrorFlag) * 100.0 / COUNT(cs.SessionID), 2) AS ErrorRatePct
FROM ChargingSessions cs
JOIN Trips t ON cs.TripID = t.TripID
GROUP BY t.OriginRegion
ORDER BY ErrorRatePct DESC;


-- 3. Average charging time by station type
SELECT
    StationType,
    ROUND(AVG(DurationMin), 2) AS AvgChargingTimeMin
FROM ChargingSessions
GROUP BY StationType;


-- 4. Average trip distance by route planner usage
SELECT
    UsedPlanner,
    ROUND(AVG(DistanceKM), 2) AS AvgDistanceKM,
    COUNT(*) AS TripCount
FROM Trips
GROUP BY UsedPlanner;


-- 5. Monthly trips and charging sessions trend
SELECT
    MONTH(t.TripDate) AS Month,
    MONTHNAME(t.TripDate) AS MonthName,
    COUNT(DISTINCT t.TripID) AS TotalTrips,
    COUNT(cs.SessionID) AS TotalChargingSessions
FROM Trips t
LEFT JOIN ChargingSessions cs ON t.TripID = cs.TripID
GROUP BY MONTH(t.TripDate), MONTHNAME(t.TripDate)
ORDER BY Month;


-- 6. Energy consumption summary
SELECT
    SUM(EnergyKWh) AS TotalEnergyKWh,
    ROUND(AVG(EnergyKWh), 2) AS AvgEnergyPerSession
FROM ChargingSessions;
