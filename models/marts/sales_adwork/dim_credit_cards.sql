with
    int_credit_cards as (
        select *
        from {{ ref('int_sales__credit_cards') }}
    )

    , dimensions as (
        select
            credit_card_pk
            , card_type
        from int_credit_cards
    )

select *
from dimensions