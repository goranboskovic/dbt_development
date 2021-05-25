{{ config(
    materialized="table"
    )
}}

select
  lg.*
from
  raw.demo.companies c 
--   , [leaf_groups as lg]
  , {{ ref('leaf_groups') }} as lg 
where
--   c.is_archived is false
      c.is_archived = false 
  and c.name not like '%archived%'
  and c.management_hierarchy_group_id = lg.root_id