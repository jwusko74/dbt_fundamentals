with payments as (
    select * 
    from {{ref('stg_payments')}}
),

aggregated as (
    select 
      sum(amount) as total_revenue
    from payments
    where status='success'
    group by status
)

select * from aggregated