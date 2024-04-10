with
    age_date_group as (
        select
            t.started_at::date as date,
            extract(year from started_at) - extract(year from birth_date) as age,
            count(*) as trips
        from scooters_raw.trips t
        inner join scooters_raw.users u on t.user_id = u.id
        group by date, age
    )
select age, avg(trips)
from age_date_group
group by age
