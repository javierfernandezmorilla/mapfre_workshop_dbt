with silver as (

    select *

    from {{ ref('region') }}

)


select

    id_region

    , region_name

    , region_comment

    , convert_timezone('UTC', current_timestamp()) as staged_at_utc

from silver
