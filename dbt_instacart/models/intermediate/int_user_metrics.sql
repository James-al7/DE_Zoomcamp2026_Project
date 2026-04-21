select
    user_id,

    count(order_id) as total_orders,

    avg(days_since_prior_order) as avg_days_between_orders,

    min(order_number) as first_order_number,

    max(order_number) as last_order_number
from {{ ref('stg_orders') }}
group by user_id