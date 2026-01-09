with

customer as (

    select * from {{ ref('customer') }}

)

select * from customer
