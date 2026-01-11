with base as (
    select *
    from {{ ref('fct_order_items') }}
)
select
    id_lineitem
    , id_order
    , id_part
    , id_supplier
    , id_ship_mode
    , order_date
    , quantity_qty
    , net_revenue_usd
    , {{ plt_order_size('net_revenue_usd') }} as plt_order_size
    , convert_timezone('UTC', current_timestamp()) as staged_at_utc
from base
