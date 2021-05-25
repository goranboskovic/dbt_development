{{ config(
    materialized="view"
    )
}}
with users as ( 
    select
        *
    from
        raw.demo.users
)
select * from users