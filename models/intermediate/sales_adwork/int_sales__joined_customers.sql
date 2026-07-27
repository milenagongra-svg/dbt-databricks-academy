with
    customers as (
        select *
        from {{ ref('stg_adwork__customers') }}
    )

    , persons as (
        select *
        from {{ ref('stg_adwork__persons') }}
    )

    , stores as (
        select *
        from {{ ref('stg_adwork__stores') }}
    )

    , joined_customers as (
        select
            customers.customer_pk as customer_sk
            , customers.person_fk
            , customers.store_fk
            , customers.territory_fk
            , coalesce(persons.full_name, stores.store_name, 'Not Informed') as customer_name
            , case
                when customers.person_fk is not null
                    and customers.store_fk is null
                    then 'Individual'
                when customers.store_fk is not null
                    and customers.person_fk is null
                    then 'Corporate Store'
                when customers.store_fk is not null
                    and customers.person_fk is not null
                    then 'Corporate Store (with Contact)'
                else 'Not Informed'
            end as customer_type
        from customers
        left join persons
            on customers.person_fk = persons.person_pk
        left join stores
            on customers.store_fk = stores.store_pk
    )

    , unmapped as (
        select
            -1 as customer_sk
            , -1 as person_fk
            , -1 as store_fk
            , -1 as territory_fk
            , 'Not Informed Customer' as customer_name
            , 'Not Applicable' as customer_type
    )

    , combined as (
        select *
        from joined_customers
        union all
        select *
        from unmapped
    )

select *
from combined