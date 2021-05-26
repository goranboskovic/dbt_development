-- data test will pass if there is 0 rows returned
-- fail if there is more that 0 rows returned 

select 
    id
    , count(*) as user_count 
from {{ ref('stg_users') }}
where logged_in_at is not null 
and verified_at is null 
group by 1 
having user_count > 0 