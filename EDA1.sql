select * from spotify where
duration_min=0

DELETE FROM spotify where duration_min=0

select * from spotify where duration_min=0

------------------------------------
--BUSINESS PROBLEM SOLVING USING SQL
------------------------------------

--Retrieve the names of all tracks that have more than 1 billion streams.

select track from spotify where stream>1000000000

--List all albums along with their respective artists.
select distinct album, artist from spotify order by 1

--Get the total number of comments for tracks where licensed = TRUE.
select * from spotify

select sum(comments) from spotify where licensed=true

--Find all tracks that belong to the album type single.
select track from spotify where album_type='single'

--Count the total number of tracks by each artist.
select 
	artist,
	count(*) as total_songs
from spotify group by artist

--Medium level
--Calculate the average danceability of tracks in each album.
select * from spotify
select 
	   album,  ---1
       avg(danceability)  ---2
from spotify 
group by album
order by 2 desc



--Find the top 5 tracks with the highest energy values.
select * from spotify

select track,
		max(energy)
from spotify 
group by 1 
order by 2 
desc limit 5

--List all tracks along with their views and likes where official_video = TRUE.
select * from spotify

select track,sum(views) as total_views,sum(likes) as total_likes from spotify where official_video='true' group by 1

--For each album, calculate the total views of all associated tracks.
select album,
	   track,
		sum(views)
from spotify
group by 1,2



--Retrieve the track names that have been streamed on Spotify more than YouTube.
select * from spotify

---COALESCE PUTS zero in place of null values or whatever you specify in place of zero
select * from
(select track,
	   -- most_played_on,
	   COALESCE(SUM(CASE WHEN most_played_on='Youtube' THEN stream END),0)
	   as most_streamed_youtube,
	   COALESCE(SUM(CASE WHEN most_played_on='Spotify' THEN stream END),0)
	   as most_streamed_spotify
from spotify
group by 1) as T1 where
most_streamed_spotify> most_streamed_youtube AND most_streamed_youtube <> 0


---Advance Level
--Find the top 3 most-viewed tracks for each artist using window functions.
select * from spotify
--Write a query to find tracks where the liveness score is above the average.
--Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
--Find tracks where the energy-to-liveness ratio is greater than 1.2.
--Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.



