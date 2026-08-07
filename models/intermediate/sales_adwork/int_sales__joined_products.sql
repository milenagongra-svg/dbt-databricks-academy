with
    products as (
        select *
        from {{ ref('stg_adwork__products') }}
    )

    , subcategories as (
        select *
        from {{ ref('stg_adwork__subcategories') }}
    )

    , categories as (
        select *
        from {{ ref('stg_adwork__categories') }}
    )

    , product_models as (
        select *
        from {{ ref('stg_adwork__product_models') }}
    )

    , joined as (
        select
            products.product_pk as product_pk
            , products.product_name
            , products.product_number
            , coalesce(subcategories.subcategory_name, 'Not Informed') as subcategory_name
            , coalesce(categories.category_name, 'Not Informed') as category_name
            , coalesce(product_models.model_name, 'Not Informed') as model_name
            , products.standard_cost
            , products.list_price
        from products
        left join subcategories
            on products.product_subcategory_fk = subcategories.product_subcategory_pk
        left join categories
            on subcategories.product_category_fk = categories.product_category_pk
        left join product_models
            on products.product_model_fk = product_models.product_model_pk
    )

    , unmapped as (
        select
            -1 as product_pk
            , 'Not Informed Product' as product_name
            , 'NA' as product_number
            , 'Not Informed' as subcategory_name
            , 'Not Informed' as category_name
            , 'Not Informed' as model_name
            , cast(0.00 as numeric(18, 2)) as standard_cost
            , cast(0.00 as numeric(18, 2)) as list_price
    )

    , combined as (
        select *
        from joined
        union all
        select *
        from unmapped
    )

select *
from combined