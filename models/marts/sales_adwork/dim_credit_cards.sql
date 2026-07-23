with
    credit_card as (
        select *
        from {{ ref('int_sales__credit_cards') }}
    )

    , final as (
        select
            credit_card_id_pk
            , card_type
        from int_sales__creditcard

        union all
        -- Linha fictícia para representar vendas sem cartão de crédito
        select
            -1 as credit_card_id_pk
            , 'Não Utilizado / Sem Cartão' as card_type
    )

select *
from final