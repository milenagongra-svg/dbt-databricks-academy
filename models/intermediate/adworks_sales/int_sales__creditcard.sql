with
    staging as (
        select *
        from {{ ref('stg_adwork__creditcard') }}
    )

    , final as (
        select
            credit_card_id_pk
            -- Trata possíveis nulos e padroniza a caixa do texto
            , coalesce(trim(card_type), 'Não Informado') as card_type
        from staging
    )

select *
from final