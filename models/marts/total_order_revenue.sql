with orders as (
    select * from {{ ref('jaffle_shop', 'fct_orders') }}
), 

agg as (
    select 
        order_date,
        sum(amount) as order_revenue 
    from orders 
    group by 1
)

select * from agg