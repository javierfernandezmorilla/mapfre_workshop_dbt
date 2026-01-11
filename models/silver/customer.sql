with stg_customer as (
    select *
    from {{ ref('stg_tpch_sf1__customer') }}
)

, customer as (
    select
        {{ dbt_utils.generate_surrogate_key(['customer_key']) }} as id_customer
        , {{ dbt_utils.generate_surrogate_key(['nation_key']) }} as id_nation
        , customer_key
        , nation_key
        , customer_name
        , customer_address
        , customer_phone
        , account_balance_usd
        , marketing_segment
        , customer_comment
        , loaded_at_utc
        , staged_at_utc
    from stg_customer
    where
        customer_key is not null
        and nation_key is not null
)

select *
from customer
