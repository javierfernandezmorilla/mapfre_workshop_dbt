with stg_orders as (

    select *

    from {{ ref('stg_tpch_sf1__orders') }}

)


, orders as (

    select

        {{ dbt_utils.generate_surrogate_key(['order_key']) }} as id_order

        , {{ dbt_utils.generate_surrogate_key(['customer_key']) }} as id_customer

        , order_key

        , customer_key

        , order_status

        , is_fulfilled

        , order_date_utc

        , total_price_usd

        , order_priority

        , order_clerk

        , ship_priority_rank

        , order_comment

        , loaded_at_utc

        , staged_at_utc

    from stg_orders

    where

        order_key is not null

        and customer_key is not null

)


select *

from orders
