select 
    * 
from {{ source('nba_stats', 'nba_11_12_raw') }}