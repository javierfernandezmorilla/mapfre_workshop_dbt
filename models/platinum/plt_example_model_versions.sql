with gold as (

    select *
    from {{ ref('dim_customer',v=1) }}
    --from {{ ref('dim_customer') }}
    --from {{ ref('dim_customer',v=3) }}

)


select
    *

from gold
