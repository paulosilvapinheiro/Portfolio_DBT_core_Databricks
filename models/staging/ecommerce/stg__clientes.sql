{{
    config(
        tags=['ecommerce']
    )
}}

with renamed as (
    
    select
        *
    from {{ source('ecommerce','clientes') }}
)
select * from renamed