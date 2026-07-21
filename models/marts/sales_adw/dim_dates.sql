{% set min_max_query %}
    select
        coalesce(cast(min(order_date) as string), '2020-01-01') as min_date
        , coalesce(cast(max(order_date) as string), '2030-12-31') as max_date
    from {{ ref('fct_orders') }}
{% endset %}

{% if execute %}
    {% set results = run_query(min_max_query) %}
    {% set start_date = results.columns[0].values()[0] %}
    {% set end_date = results.columns[1].values()[0] %}
{% else %}
    {% set start_date = '2020-01-01' %}
    {% set end_date = '2030-12-31' %}
{% endif %}

with
    date_dimension as (
        {{ dbt_date.get_date_dimension(
            start_date=start_date,
            end_date=end_date
        ) }}
    )

select *
from date_dimension