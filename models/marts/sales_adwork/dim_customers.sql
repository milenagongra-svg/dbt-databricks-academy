with
    int_customers as (
        select *
        from {{ ref('int_sales__joined_customers') }}
    )

    , final as (
        select
            {{ dbt_utils.generate_surrogate_key(['customer_id_pk']) }} as customer_sk
            , customer_id_pk
            , customer_name
            , customer_type
            , territory_id_fk
        from int_customers

        union all

        -- Linha para tratar vendas sem cliente associado (-1)
        select
            {{ dbt_utils.generate_surrogate_key(['-1']) }} as customer_sk
            , -1 as customer_id_pk
            , 'Cliente Não Informado' as customer_name
            , 'Não Aplicável' as customer_type
            , -1 as territory_id_fk
    )

select * 
from final