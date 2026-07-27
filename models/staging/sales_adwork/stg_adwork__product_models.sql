with
    source_production_productmodel as (
        select *
        from {{ source('adwork', 'production_productmodel') }}
    )

    , renamed as (
        select
            cast(productmodelid as int) as product_model_pk
            , cast(name as string) as model_name
        from source_production_productmodel
    )

select *
from renamed