select started_at::date as date,
	   count(*) as trips,
	   max(price) / 100 as max_price_rub,
	   avg(distance) as avg_distance_km
from scooters_raw.trips
group by started_at::date
order by started_at::date