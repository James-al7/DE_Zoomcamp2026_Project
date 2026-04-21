select
    product_id,
    product_name,
    aisle,
    department
from {{ ref('stg_products') }}