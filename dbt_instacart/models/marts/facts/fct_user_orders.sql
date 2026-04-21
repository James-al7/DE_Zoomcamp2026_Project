{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
    order_id,
    user_id,
    order_number,
    order_day_of_week,
    order_hour,
    time_of_day,
    days_since_prior_order
from {{ ref('stg_orders') }}

{% if is_incremental() %}
where order_id > (select max(order_id) from {{ this }})
{% endif %}