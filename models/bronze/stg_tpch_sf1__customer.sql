with

source as (

    select * from {{ source('tpch_sf1', 'customer') }}

),

renamed as (

    select
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment,
        loaded_at

    from source

)

select * from renamed
