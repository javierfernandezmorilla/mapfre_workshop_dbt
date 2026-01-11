with source as (
    select *
    from {{ source('tpch_sf1','lineitem') }}
)

, renamed as (
    select
        cast(l_orderkey as number) as order_number
        , cast(l_linenumber as number) as line_number
        , cast(l_partkey as number) as part_number
        , cast(l_suppkey as number) as supplier_number
        , cast(l_quantity as decimal(12, 3)) as quantity_qty
        , cast(l_extendedprice as decimal(12, 2)) as extended_price_usd
        , cast(l_discount as decimal(6, 4)) as discount_pct
        , cast(l_tax as decimal(6, 4)) as tax_pct
        , trim(l_returnflag) as return_flag
        , trim(l_linestatus) as line_status
        , cast(l_shipdate as date) as ship_date_utc
        , cast(l_commitdate as date) as commit_date_utc
        , cast(l_receiptdate as date) as receipt_date_utc
        , trim(l_shipinstruct) as ship_instructions
        , trim(l_shipmode) as ship_mode
        , trim(l_comment) as line_comment
        , loaded_at as loaded_at_utc
        , convert_timezone('UTC', current_timestamp()) as staged_at_utc
        , '{{ invocation_id }}' as dbt_invocation_id
        , '{{ env_var("DBT_CLOUD_RUN_ID","local") }}' as dbt_cloud_run_id
        , '{{ env_var("DBT_CLOUD_JOB_ID","manual") }}' as dbt_cloud_job_id
    from source
)

select *
from renamed
