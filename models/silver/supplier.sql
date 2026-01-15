with stg_supplier as (

    select *

    from {{ ref('stg_tpch_sf1__supplier') }}

)


, supplier as (

    select

        {{ dbt_utils.generate_surrogate_key(['supplier_key']) }} as id_supplier

        , {{ dbt_utils.generate_surrogate_key(['nation_key']) }} as id_nation

        , supplier_key

        , nation_key

        , supplier_name

        , supplier_address

        , supplier_phone

        , account_balance_usd

        , supplier_comment

        , loaded_at_utc

        , staged_at_utc

    from stg_supplier

    where

        supplier_key is not null

        and nation_key is not null

)


select *

from supplier
