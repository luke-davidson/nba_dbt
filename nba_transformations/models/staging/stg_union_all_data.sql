select * from {{ ref('raw_2010_2011_data') }}

UNION ALL

select * from {{ ref('raw_2011_2012_data') }}

UNION ALL

select * from {{ ref('raw_2012_2013_data') }}

UNION ALL

select * from {{ ref('raw_2013_2014_data') }}

UNION ALL

select * from {{ ref('raw_2014_2015_data') }}