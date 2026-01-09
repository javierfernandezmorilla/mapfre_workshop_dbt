with

dim_customer as (

    select * from {{ ref('dim_customer') }}

)

select * from dim_customer
