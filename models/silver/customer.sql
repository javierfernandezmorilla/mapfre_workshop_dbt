with

stg_customer as (

    select * from {{ ref('stg_tpch_sf1__customer') }}

)

select * from stg_customer
