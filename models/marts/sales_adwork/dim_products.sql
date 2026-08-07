with
    int_products as (
        select *
        from {{ ref('int_sales__joined_products') }}
    )

    , dimensions as (
        select
            product_pk
            , product_name
            , product_number
            , subcategory_name
            , category_name
            , model_name
            , standard_cost
            , list_price
        from int_products
    )

select *
from dimensions