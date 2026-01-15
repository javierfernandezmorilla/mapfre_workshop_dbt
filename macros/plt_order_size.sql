{% macro plt_order_size(amount_expr) -%}
    {% set thresholds = [

        {'min': 5000, 'label': 'GRANDE'},

        {'min': 1000, 'label': 'NORMAL'}

    ] %}


    case

        when {{ amount_expr }} is null then 'DESCONOCIDA'

        {%- for t in thresholds %}

        when {{ amount_expr }} >= {{ t['min'] }} then '{{ t['label'] }}'

        {%- endfor %}

        else 'PEQUEÑA'

    end

{%- endmacro %}
