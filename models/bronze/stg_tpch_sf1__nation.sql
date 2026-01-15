with source as (
    select *
    from {{ source('tpch_sf1','nation') }}
)

, renamed as (
    select
        cast(n_nationkey as number) as nation_key
        , cast(n_regionkey as number) as region_key
        , trim(n_name) as nation_name
        , trim(n_comment) as nation_comment
        , loaded_at as loaded_at_utc
        , convert_timezone('UTC', current_timestamp()) as staged_at_utc
        , '{{ invocation_id }}' as dbt_invocation_id
        , '{{ env_var("DBT_CLOUD_RUN_ID","local") }}' as dbt_cloud_run_id
        , '{{ env_var("DBT_CLOUD_JOB_ID","manual") }}' as dbt_cloud_job_id
    from source
)

select *
from renamed
