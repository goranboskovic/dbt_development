{{ config(
    materialized="table"
)}}

select
  g.*
  , SPLIT_PART(g.path, '/', 1) as root_id
from
  {{ ref('stg_groups') }} as g
  left join {{ ref('stg_groups') }} as gc on
    g.id = gc.parent_id
    and gc.is_archived = 0 
where
  gc.id is null
order by
  g.company_id desc