select
    product_id::int as product_id,
    product_name,
    aisle_id::int as aisle_id,
    department_id::int as department_id
from {{ source('instacart', 'raw_products') }}