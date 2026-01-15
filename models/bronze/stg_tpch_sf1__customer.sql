with source as (
    select *
    from {{ source('tpch_sf1','customer') }}
)

, renamed as (
    select
        cast(c_custkey as number) as customer_key
        , cast(c_nationkey as number) as nation_key
        , trim(c_name) as customer_name
        , trim(c_address) as customer_address
        , trim(c_phone) as customer_phone
        , cast(c_acctbal as decimal(12, 2)) as account_balance_usd
        , trim(c_mktsegment) as marketing_segment
        , trim(c_comment) as customer_comment
        , loaded_at as loaded_at_utc
        , convert_timezone('UTC', current_timestamp()) as staged_at_utc
        , '{{ invocation_id }}' as dbt_invocation_id
        , '{{ env_var("DBT_CLOUD_RUN_ID","local") }}' as dbt_cloud_run_id
        , '{{ env_var("DBT_CLOUD_JOB_ID","manual") }}' as dbt_cloud_job_id
    from source
)

select *
from renamed
