create database choco_analytics2;
use choco_analytics2;

select * from product_info;
select * from nutrient_info;
select * from derived_metrics;

1. Count products per brand 
select brand, count(*)
from product_info
group by brand;

2.Count unique products per brand
SELECT brand, COUNT(DISTINCT product_code) as unique_products
FROM product_info
GROUP BY brand;

3. Top 5 brands by product count 
select brand, count(*) as product_count
from product_info
group by brand
order by product_count desc
limit 5;

4.  Products with missing product name 
select * from product_info
where product_name is null or product_name = '';

5.  Number of unique brands 
select count(distinct brand) as unique_brands
from product_info;

6.  Products with code starting with '3' 
select * from product_info
where product_code like '3%';

nutrient_info
1. Top 10 products with highest energy-kcal_value
SELECT energy_kcal_value 
FROM nutrient_info 
ORDER BY energy_kcal_value DESC 
LIMIT 10;


2.  Average sugars_value per nova-group 
select nova_group, avg(sugars_value) as average_value
from nutrient_info
group by nova_group;

3. Count products with fat_value > 20g 
select count(*) as total_product_with_fat 
from nutrient_info
where fat_value > 20;
select fat_value from nutrient_info;

4.Average carbohydrates_value per product
select avg(carbohydrates_value) as avg_carb_value
from nutrient_info;

5.Products with sodium_value > 1g 
select * from nutrient_info
where sodium_value > 1;

6.Count products with non-zero fruits-vegetables-nuts content
SELECT COUNT(*) as total_non_zero_nuts
FROM nutrient_info
WHERE `fruits_vegetables_nuts_estimate_from_ingredients_100g` > 0;

7.Products with energy-kcal_value > 500 
select * from nutrient_info
where energy_kcal_value > 500;

derived_metrics

1.Count products per calorie_category
SELECT calorie_category, COUNT(*) AS product_count
FROM derived_metrics
GROUP BY calorie_category;

2. Count of High Sugar products
SELECT sugar_category, COUNT(*) AS high_sugar_product_count
FROM derived_metrics
WHERE sugar_category = 'High';

3. Average sugar_to_carb_ratio for High Calorie products
SELECT AVG(sugar_to_carb_ratio) AS avg_sugar_to_carb_ratio
FROM derived_metrics
WHERE calorie_category = 'High';

4.  Products that are both High Calorie and High Sugar
SELECT *
FROM derived_metrics
WHERE calorie_category = 'High' 
AND sugar_category = 'High';

5. Number of products marked as ultra-processed
SELECT COUNT(*) AS ultra_processed_count
FROM derived_metrics
WHERE is_ultra_processed = 'Yes';

6. Products with sugar_to_carb_ratio > 0.7
SELECT *
FROM derived_metrics
WHERE sugar_to_carb_ratio > 0.7;

7. Average sugar_to_carb_ratio per calorie_category
select calorie_category, avg(sugar_to_carb_ratio) as avg_sugar_to_carb_ratio
from derived_metrics
group by calorie_category;

join queries

1. Top 5 brands with most High Calorie products
SELECT p.brand, COUNT(*) AS high_calorie_product_count
FROM product_info p
JOIN derived_metrics d ON p.product_code = d.product_code
WHERE d.calorie_category = 'High'
GROUP BY p.brand
ORDER BY high_calorie_product_count DESC
LIMIT 5;
 
2.Average energy-kcal_value for each calorie_category
SELECT d.calorie_category, AVG(n.energy_kcal_value) AS avg_energy_kcal
FROM derived_metrics d
JOIN nutrient_info n ON d.product_code = n.product_code
GROUP BY d.calorie_category;

3.Count of ultra-processed products per brand
SELECT p.brand, COUNT(*) AS ultra_processed_count
FROM product_info p
JOIN derived_metrics d ON p.product_code = d.product_code
WHERE d.is_ultra_processed = 'Yes'
GROUP BY p.brand
ORDER BY ultra_processed_count DESC;

4.Products with High Sugar and High Calorie along with brand
SELECT p.product_name, p.brand, d.calorie_category, d.sugar_category
FROM product_info p
JOIN derived_metrics d ON p.product_code = d.product_code
WHERE d.calorie_category = 'High' AND d.sugar_category = 'High';

5.Average sugar content per brand for ultra-processed products
SELECT p.brand, AVG(n.sugars_value) AS avg_sugar_content
FROM product_info p
JOIN derived_metrics d ON p.product_code = d.product_code
JOIN nutrient_info n ON p.product_code = n.product_code
WHERE d.is_ultra_processed = 'Yes'
GROUP BY p.brand;

6.Number of products with fruits/vegetables/nuts content in each calorie_category
SELECT d.calorie_category, COUNT(*) AS product_count
FROM derived_metrics d
JOIN nutrient_info n ON d.product_code = n.product_code
WHERE n.fruits_vegetables_nuts_estimate_from_ingredients_100g > 0
GROUP BY d.calorie_category;

7.Top 5 products by sugar_to_carb_ratio with their calorie and sugar category
SELECT product_code, sugar_to_carb_ratio, calorie_category, sugar_category
FROM derived_metrics
ORDER BY sugar_to_carb_ratio DESC
LIMIT 5;