{{
    config(
        tags=['ecommerce']
    )
}}

with renamed as (
    
    select
        *
    from {{ source('ecommerce','produtos') }}
)
select * from renamed