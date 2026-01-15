with stg_region as (
    select *
    from {{ ref('stg_tpch_sf1__region') }}
)

, region as (
    select
        {{ dbt_utils.generate_surrogate_key(['region_key']) }} as id_region
        , region_key
        , region_name
        , region_comment
        , loaded_at_utc
        , staged_at_utc
    from stg_region
    where
        region_key is not null
)

select *
from region
