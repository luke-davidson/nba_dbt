select 
    * 
from {{ source('nba_stats', 'nba_10_11_raw') }}