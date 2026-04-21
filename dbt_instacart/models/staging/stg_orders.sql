select
    order_id::int as order_id,
    user_id::int as user_id,
    order_number::int as order_number,
    order_dow::int as order_day_of_week,
    order_hour_of_day::int as order_hour,
    coalesce(days_since_prior_order, 0)::float as days_since_prior_order,

    case
        when order_hour_of_day between 6 and 11 then 'morning'
        when order_hour_of_day between 12 and 17 then 'afternoon'
        when order_hour_of_day between 18 and 22 then 'evening'
        else 'night'
    end as time_of_day

from {{ source('instacart', 'raw_orders') }}