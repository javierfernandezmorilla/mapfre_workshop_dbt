with stg_lineitem as (
    select *
    from {{ ref('stg_tpch_sf1__lineitem') }}
)

, lineitem as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_number','line_number']) }} as id_lineitem
        , {{ dbt_utils.generate_surrogate_key(['order_number']) }} as id_order
        , {{ dbt_utils.generate_surrogate_key(['part_number']) }} as id_part
        , {{ dbt_utils.generate_surrogate_key(['supplier_number']) }} as id_supplier
        , order_number
        , line_number
        , part_number
        , supplier_number
        , quantity_qty
        , extended_price_usd
        , discount_pct
        , tax_pct
        , return_flag
        , line_status
        , ship_date_utc
        , commit_date_utc
        , receipt_date_utc
        , ship_instructions
        , ship_mode
        , line_comment
        , loaded_at_utc
        , staged_at_utc
    from stg_lineitem
    where
        order_number is not null
        and part_number is not null
        and supplier_number is not null
        and line_number is not null
)

select *
from lineitem
