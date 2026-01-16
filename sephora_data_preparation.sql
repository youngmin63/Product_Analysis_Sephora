DROP TABLE IF EXISTS products_clean;

CREATE TABLE products_clean AS
SELECT
  product_id,
  product_name,
  brand_name,
  primary_category,
  price,
  rating,
  reviews,
  loves_count
FROM products
WHERE price IS NOT NULL
  AND price > 0
  AND rating IS NOT NULL
  AND reviews IS NOT NULL
  AND reviews >= 10;
  
CREATE TABLE products_final AS
SELECT
  product_id,
  product_name,
  brand_name,
  primary_category,
  price,
  rating,
  reviews,
  loves_count,
  CASE
    WHEN price < 30 THEN 'Low'
    WHEN price < 80 THEN 'Mid'
    ELSE 'High'
  END AS price_tier,
  FLOOR(price / 10) * 10 AS price_bin_10
FROM products_clean;


