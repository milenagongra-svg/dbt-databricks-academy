with
    vendas_2011 as (
        select 
            sum(gross_total) as total_bruto
        from {{ ref('fct_orders') }}
        where year(order_date) = 2011
    )

select 
    total_bruto
from vendas_2011
where abs(total_bruto - 12646105.58) > 10.00