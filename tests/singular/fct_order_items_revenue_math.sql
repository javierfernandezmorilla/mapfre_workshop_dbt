-- El test pasa si esta query devuelve 0 filas.

-- Valida que `net_revenue_usd` coincide con la fórmula:
-- `gross_revenue_usd - discount_amount_usd + tax_amount_usd`

with base as (
    select
        id_lineitem
        , gross_revenue_usd
        , discount_amount_usd
        , tax_amount_usd
        , net_revenue_usd
    from {{ ref('fct_order_items') }}
),

calc as (
    select
        *
        , (gross_revenue_usd - discount_amount_usd + tax_amount_usd) as expected_net_revenue_usd
        , abs(net_revenue_usd - (gross_revenue_usd - discount_amount_usd + tax_amount_usd)) as diff
    from base
)

select *
from calc
where
    gross_revenue_usd is null
    or discount_amount_usd is null
    or tax_amount_usd is null
    or net_revenue_usd is null
    -- tolerancia por decimales
    or diff > 0.01