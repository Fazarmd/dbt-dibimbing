{{ config(materialized='table') }}

WITH t_data AS (
  SELECT DISTINCT
    `Sales Channel ` AS sales_channel
  FROM
    `dibimbing-435704.dibimbing.amazon_sale_report`
)

SELECT 
  {{ dbt_utils.generate_surrogate_key([
      'sales_channel'
    ]) }} as sales_channel_id, *
FROM t_data
