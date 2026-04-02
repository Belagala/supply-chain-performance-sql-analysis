-- Supply Chain Performance Analysis
-- Author: Belagala Charan

-- 1. View all supply chain records
SELECT *
FROM supply_chain_data;

-- 2. Total shipment quantity by region
SELECT supplier_region,
       SUM(shipment_quantity) AS total_units_shipped
FROM supply_chain_data
GROUP BY supplier_region
ORDER BY total_units_shipped DESC;

-- 3. Average delivery time by supplier
SELECT supplier_name,
       AVG(delivery_time_days) AS avg_delivery_days
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY avg_delivery_days;

-- 4. Average defect rate by product category
SELECT product_category,
       AVG(defect_rate) AS avg_defect_rate
FROM supply_chain_data
GROUP BY product_category
ORDER BY avg_defect_rate;

-- 5. Transport cost analysis by region
SELECT supplier_region,
       SUM(transport_cost) AS total_transport_cost
FROM supply_chain_data
GROUP BY supplier_region
ORDER BY total_transport_cost DESC;

-- 6. Identify suppliers with lowest defect rates
SELECT supplier_name,
       AVG(defect_rate) AS defect_rate
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY defect_rate
LIMIT 3;

-- 7. Monthly shipment trend
SELECT MONTH(shipment_date) AS shipment_month,
       SUM(shipment_quantity) AS monthly_shipments
FROM supply_chain_data
GROUP BY MONTH(shipment_date)
ORDER BY shipment_month;

-- 8. Cost per shipped unit
SELECT supplier_name,
       SUM(transport_cost) / SUM(shipment_quantity) AS cost_per_unit
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY cost_per_unit;

-- 9. Fastest suppliers based on delivery time
SELECT supplier_name,
       MIN(delivery_time_days) AS fastest_delivery
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY fastest_delivery;

-- 10. Supplier performance score
SELECT supplier_name,
       AVG(delivery_time_days) AS avg_delivery,
       AVG(defect_rate) AS avg_defect_rate
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY avg_delivery, avg_defect_rate;
