SELECT
    *
from {{ ref('stg_transaction') }}
WHERE REVENUE<0