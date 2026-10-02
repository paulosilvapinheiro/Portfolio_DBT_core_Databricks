
config(
    tags=['comercial']
)
with renamed as (

    select
        orderid as order_id
        , customerid as customer_id
        , employeeid as employee_id
        , orderdate as order_date
        , requireddate as required_date
        , shippeddate as shipped_date
        , shipvia as ship_via
        , freight
        , shipname as ship_name
        , shipaddress as ship_address
        , shipcity as ship_city
        , shipregion as ship_region
        , shippostalcode as ship_postal_code
        , shipcountry as ship_country
    from {{ source('northwind_db', 'orders') }}

),final as(
    select
        order_id
        , customer_id
        , employee_id
        , order_date
        , required_date
        , shipped_date
        , ship_via
        , freight
        , ship_name
        , ship_address
        , ship_city
        , ship_region
        , ship_postal_code
        , ship_country
        , case
            when shipped_date is null then 'envio pendente'
            else 'enviado'
        end as ship_status 
    from renamed
)

select
    *
from final