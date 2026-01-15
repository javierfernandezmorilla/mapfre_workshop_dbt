with stg_nation as (

    select *

    from {{ ref('stg_tpch_sf1__nation') }}

)


, nation as (

    select

        {{ dbt_utils.generate_surrogate_key(['nation_key']) }} as id_nation

        , {{ dbt_utils.generate_surrogate_key(['region_key']) }} as id_region

        , nation_key

        , region_key

        , nation_name

        , nation_comment

        , loaded_at_utc

        , staged_at_utc

    from stg_nation

    where

        nation_key is not null

        and region_key is not null

)


select *

from nation
