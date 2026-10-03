{{
    config(
        tags=['ecommerce']
    )
}}

with renamed as (
    
    select
        *
    from {{ source('ecommerce','pagamentos') }}
)
select * from renamed