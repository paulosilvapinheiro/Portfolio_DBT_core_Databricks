{{
    config(
        tags=['comercial']
    )
}}

with pedidos as (

    select 
        *
    from {{ ref('stg__pedidos') }}
)

, clientes as (

    select
        *
    from {{ ref('stg__clientes') }}
)

, itens_pedidos as (

    select
        *
    from {{ ref('stg__itens_pedidos') }}
)

, produtos as (

    select
        *
    from {{ ref('stg__produtos') }}
)

, pagamentos as (

    select
        *
    from {{ ref('stg__pagamentos') }}
)

, categorias as (

    select
        *
    from {{ ref('stg__categorias')}}
)

, joined as (

    select
        pedidos.data_pedido
        , clientes.nome as nome_do_cliente
        , clientes.email
        , pagamentos.valor
        , pagamentos.metodo
        , pagamentos.status
        , pagamentos.data_pagamento
        , produtos.nome as produto
        , categorias.nome as categoria
        , itens_pedidos.quantidade
        , itens_pedidos.preco_unitario
    from pedidos
    left join clientes
        on pedidos.cliente_id = clientes.id
    left join pagamentos
        on pedidos.id = pagamentos.pedido_id
    left join itens_pedidos 
        on pedidos.id = itens_pedidos.pedido_id
    left join produtos
        on itens_pedidos.produto_id = produtos.id
    left join categorias
        on produtos.categoria_id = categorias.id
    
)

select * from joined