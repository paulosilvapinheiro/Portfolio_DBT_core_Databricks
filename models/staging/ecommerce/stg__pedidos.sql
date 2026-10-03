{{
    config(
        tags=['ecommerce']
    )
}}

with renamed as (
    
    select
        *
    from {{ source('ecommerce','pedidos') }}
)
select * from renamed