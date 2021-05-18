with groups as ( 
    select
        ID
        , NAME
        , COMPANY_ID
        , IS_ARCHIVED
        , CREATED_AT
        , UPDATED_AT
        , PARENT_ID
        , PATH
        , IS_MANUAL
        , KIND
        , POTENTIAL_USER_COUNT
        , TIMECLOCK_STATUS
    from
        raw.demo.groups
)
select * from groups