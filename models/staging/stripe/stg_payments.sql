/* Raw payment data from Snowflake */
with payment as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        {{ cents_to_dollars('amount', 4) }} as amount,
        created as created_dt
    from {{source('stripe','payment')}}    )
select * from payment
