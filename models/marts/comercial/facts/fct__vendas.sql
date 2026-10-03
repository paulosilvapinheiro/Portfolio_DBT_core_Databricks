{{
    config(
        tags=['comercial']
    )
}}

with vendas as (

    select
        *
    from {{ ref('int__orders') }}

)

select * from vendas