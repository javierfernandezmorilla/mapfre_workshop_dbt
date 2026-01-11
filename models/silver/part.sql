with stg_part as (

    select *

    from {{ ref('stg_tpch_sf1__part') }}

)


, part as (

    select

        {{ dbt_utils.generate_surrogate_key(['part_key']) }} as id_part

        , part_key

        , part_name

        , manufacturer

        , brand

        , part_type

        , size_qty

        , container_type

        , retail_price_usd

        , part_comment

        , loaded_at_utc

        , staged_at_utc

    from stg_part

    where

        part_key is not null

)


select *

from part
