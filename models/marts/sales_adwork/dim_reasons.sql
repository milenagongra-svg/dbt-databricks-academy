with
    int_reasons as (
        select *
        from {{ ref('int_sales__joined_reasons') }}
    )

    , dimensions as (
        select distinct
            reason_fk as reason_sk
            , reason_name
            , reason_type
        from int_reasons
    )

select *
from dimensions