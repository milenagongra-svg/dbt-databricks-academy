with
    stg_sales_reasons as (
        select *
        from {{ ref('stg_adwork__sales_reasons') }}
    )

    , dimensions as (
        select
            sales_reason_pk as reason_pk
            , reason_name
            , reason_type
        from stg_sales_reasons
    )

    , final as (
        select
            reason_pk
            , reason_name
            , reason_type
        from dimensions
    )

select *
from final