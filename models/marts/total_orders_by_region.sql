with orders as (
    select * from {{ ref('jaffle_shop', 'fct_orders') }}
),

agg as (
    select
        order_date,
        customer_id, 
        count(order_id) as order_count,
        sum(amount) as orders_revenue
    from orders 
    group by 1,2
)

select * from agg