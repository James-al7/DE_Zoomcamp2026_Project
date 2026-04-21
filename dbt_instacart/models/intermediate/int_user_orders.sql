select
    user_id,
    order_id,
    order_number,
    order_day_of_week,
    order_hour,
    days_since_prior_order,
    time_of_day
from {{ ref('stg_orders') }}