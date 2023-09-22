select 
    * 
from {{ source('nba_franchises', 'nba_franchises_years_active') }}