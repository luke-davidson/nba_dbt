select
    *
from {{ source('nba_franchises', 'nba_teams') }}