{{ config(materialized='table') }}
select * from (values (1),(2),(3),(4),(5)) as t(id)
