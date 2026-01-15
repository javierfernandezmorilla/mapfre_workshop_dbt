with stg_partsupp as (

    select *

    from {{ ref('stg_tpch_sf1__partsupp') }}

)


, partsupp as (

    select

        {{ dbt_utils.generate_surrogate_key(['part_key','supplier_key']) }} as id_partsupp

        , {{ dbt_utils.generate_surrogate_key(['part_key']) }} as id_part

        , {{ dbt_utils.generate_surrogate_key(['supplier_key']) }} as id_supplier

        , part_key

        , supplier_key

        , available_qty

        , supply_cost_usd

        , partsupp_comment

        , loaded_at_utc

        , staged_at_utc

    from stg_partsupp

    where

        part_key is not null

        and supplier_key is not null

)


select *

from partsupp
