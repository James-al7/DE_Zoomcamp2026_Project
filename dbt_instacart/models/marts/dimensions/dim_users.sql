select
    user_id,

    count(order_id) as total_orders,
    min(order_number) as first_order,
    max(order_number) as last_order,

    avg(days_since_prior_order) as avg_days_between_orders
from {{ ref('stg_orders') }}
group by user_id