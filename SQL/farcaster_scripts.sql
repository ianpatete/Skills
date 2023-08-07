--Pulled csvs

-- this is probably the most simple cast dashboard to pull. 
-- used in my first viz
select c.timestamp
, c.created_at 
, c.fid
, c.text
, encode(c.hash, 'hex')
, encode(c.parent_hash, 'hex')
, c.mentions
, c.embeds
from casts c
order by 1 desc
