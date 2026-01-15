with silver as (

    select *

    from {{ ref('part') }}

)


select

    id_part

    , part_name

    , manufacturer

    , brand

    , part_type

    , size_qty

    , container_type

    , retail_price_usd

    , part_comment

    , convert_timezone('UTC', current_timestamp()) as staged_at_utc

from silver
