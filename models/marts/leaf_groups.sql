{{ config(
    materialized="table"
)}}

select
  g.*
  , SPLIT_PART(g.path, '/', 1) as root_id
from
  raw.demo.groups g
  left join raw.demo.groups gc on
    g.id = gc.parent_id and gc.is_archived = 0
where
--   g.is_archived is false
      g.is_archived = false 
  and g.name not like '%archived%'
  and gc.id is null
order by
  g.company_id desc