{% test if_then(model, if_condition, then_condition) -%}

select *
from {{ model }}
where
    coalesce(({{ if_condition }}), false)
    and not coalesce(({{ then_condition }}), false)

{%- endtest %}
