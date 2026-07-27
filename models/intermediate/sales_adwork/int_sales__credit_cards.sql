with
    staging as (
        select *
        from {{ ref('stg_adwork__credit_cards') }}
    )

    , transformed as (
        select
            credit_card_pk as credit_card_sk
            , coalesce(trim(card_type), 'Not Informed') as card_type
        from staging
    )

    , unmapped as (
        select
            -1 as credit_card_sk
            , 'Not Informed / No Card' as card_type
    )

    , combined as (
        select *
        from transformed
        union all
        select *
        from unmapped
    )

select *
from combined