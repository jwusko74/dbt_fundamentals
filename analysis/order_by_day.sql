with orders as (
    select * 
    from {{ref('stg_orders')}}
),

daily as (
    select order_date, count(*) as order_num 
    from orders 
    group by 1
),
/*select * from daily,*/
compared as (
    select *,
    lag(order_num) over (order by order_date) as previous_days_orders
    from daily
    order by 1
)
select * from compared