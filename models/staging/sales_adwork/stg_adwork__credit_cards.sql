with
    source_sales_creditcard as (
        select *
        from {{ source('adwork', 'sales_creditcard') }}
    )

    , renamed as (
        select
            cast(creditcardid as bigint) as credit_card_pk
            , cast(cardtype as string) as card_type
        from source_sales_creditcard
    )

select *
from renamed