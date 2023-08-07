--FINDING the days of events for farcaster
SELECT distinct date_trunc('day', "timestamp")
from user_data ud 
order by 1 DESC

--FINDING total Registered names
SELECT distinct date_trunc('day', "timestamp")
from casts c
order by 1 desc


SELECT v."timestamp" 
,v.fid
, v.claim 
from verifications v  
join 


SELECT *, CONCAT('0x', encode(custody_address,'hex'))as "Ethereum Address"
from fnames 
order by 2 desc

--Counting the public signer apps
SELECT name, COUNT(timestamp)
from public.signers
group by 1
order by 2 DESC


-- Casts by day
SELECT count(hash) as cast
, date_trunc('day', "timestamp")
from casts c
group by 2
order by 2 DESC


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

order by 1 DESC

---Linking fin to custody address. 
-- the created at tab unfortunatly keeps track of when i made the db

SELECT *
, f.created_at as "Created"
, f.fid
--, fn.fname
, CONCAT('0x', encode(f.custody_address,'hex'))as "Custody Address"
from fids f 
-- left join fnames fn on fn.custody_address = f.custody_address
order by created_at  desc

--what is signers
-- seems to be the application that initiated a fid registration
--Represents signers that users have registered as authorized to sign Farcaster messages
select s."timestamp" 
,  s.fid
, s.custody_address
from signers s 
order by 1

--claiming eth addresses
select *, substring(claim::json->'address' as addressfrom verifications




--- REACTION 

select fid, COUNT(target_fid) from reactions r group by 1 ORDER by 2 DESC




--My casts 
select c.timestamp
, c.created_at 
, c.fid
, c.text
, encode(c.hash, 'hex')
, encode(c.parent_hash, 'hex')
, c.mentions
, c.embeds
from casts c
where c.fid = 5270
order by "timestamp" DESC

--- looking for 2 events.
-- I like a page and then recasted
-- lets see how long it takes to get some results
-- 2023-05-26 1:25 pm (18:25 utc prob)
select * from reactions r 
where fid = 5270
ORDER by "timestamp" desc


