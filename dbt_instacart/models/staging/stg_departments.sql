select
    department_id,
    department
from {{ source('instacart', 'raw_departments') }}