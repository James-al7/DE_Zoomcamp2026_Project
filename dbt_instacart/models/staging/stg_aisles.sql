select
    aisle_id,
    aisle
from {{ source('instacart', 'raw_aisles') }}