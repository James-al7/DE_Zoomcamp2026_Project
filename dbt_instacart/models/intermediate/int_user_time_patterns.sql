select
    user_id,

    avg(order_hour) as avg_order_hour,

    mode() within group (order by order_day_of_week) as most_common_day,

    count(case when time_of_day = 'morning' then 1 end) as morning_orders,
    count(case when time_of_day = 'afternoon' then 1 end) as afternoon_orders,
    count(case when time_of_day = 'evening' then 1 end) as evening_orders,
    count(case when time_of_day = 'night' then 1 end) as night_orders
from {{ ref('stg_orders') }}
group by user_id