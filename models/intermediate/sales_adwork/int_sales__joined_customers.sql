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
            customers.customer_id_pk
            , customers.person_id_fk
            , customers.store_id_fk
            , customers.territory_id_fk
            
            -- Se tiver nome de pessoa usa, senão usa o nome da loja
            , coalesce(persons.full_name, stores.store_name, 'Desconhecido') as customer_name
            
            -- Define o tipo de cliente com base na presença dos IDs
            , case 
                when customers.person_id_fk is not null and customers.store_id_fk is null 
                    then 'Pessoa Física'
                when customers.store_id_fk is not null and customers.person_id_fk is null 
                    then 'Pessoa Jurídica'
                when customers.store_id_fk is not null and customers.person_id_fk is not null 
                    then 'Pessoa Jurídica (com Contato)'
                else 'Não Informado'
            end as customer_type
        from customers
        left join persons
            on customers.person_id_fk = persons.person_id_pk
        left join stores
            on customers.store_id_fk = stores.store_id_pk
    )

    , final as (
        select
            customer_id_pk
            , person_id_fk
            , store_id_fk
            , territory_id_fk
            , customer_name
            , customer_type
        from joined_customers
    )

select *
from final