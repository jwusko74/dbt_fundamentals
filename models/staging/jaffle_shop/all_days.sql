with all_days as (
{{dbt_utils.date_spine(
	datepart='day',
	start_date="to_date('01/01/2020','mm/dd/yyyy')",
	end_date="dateadd(day, 1, '12/31/2020')"
)
}}
)

select * from all_days

