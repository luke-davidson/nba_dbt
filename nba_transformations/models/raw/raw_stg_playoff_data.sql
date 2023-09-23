select 
    * 
from {{ ref('raw_stg_union_all_data') }}
where 
    data_set like '%Playoffs'