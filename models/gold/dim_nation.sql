with silver as (

    select *

    from {{ ref('nation') }}

)


select

    id_nation

    , id_region

    , nation_key

    , region_key

    , nation_name

    , nation_comment

    , convert_timezone('UTC', current_timestamp()) as staged_at_utc

from silver
