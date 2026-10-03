{{
    config(
        tags=['ecommerce']
    )
}}

with renamed as (
    
    select
        *
    from {{ source('ecommerce','itens_pedidos') }}
)
select * from renamed