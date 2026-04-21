select
    product_id::int as product_id,
    product_name,
    aisle_id::int as aisle,
    department_id::int as department
from {{ source('instacart', 'raw_products') }}