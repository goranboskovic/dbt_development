{{ config(
    materialized="table"
)}}

select
  lg.* 
from
--  companies c --  will have to full qualify the tables, see below 
    raw.demo.companies as c
--   [leaf_groups_incl_archived as lg] -- referencing will also have to be updated as below 
  , {{ ref('leaf_groups_incl_archived') }} as lg 

where
--   c.is_archived is false -- "is" doesn't work in Snowflake, will encounter some syntax incompatabilities in Snowflake
  c.is_archived = false 
  and c.name not like '%archived%'
  and c.management_hierarchy_group_id = lg.root_id