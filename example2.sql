/*Questions:
How many tracks does each album have? Your solution should include Album id and its number of tracks sorted from highest to lowest.

Find the album title of the tracks. Your solution should include track name and its album title.

Find the minimum duration of the track in each album. Your solution should include album id, album title and duration of the track sorted from highest to lowest.

Find the total duration of each album. Your solution should include album id, album title and its total duration sorted from highest to lowest.

Based on the previous question, find the albums whose total duration is higher than 70 minutes. Your solution should include album title and total duration.

Note: use chinhook database */

--ANSWERS

/* Question 1*/
SELECT AlbumId, count(name) AS sarki
FROM tracks
GROUP BY AlbumId
ORDER BY sarki DESC;
/* Question 2*/
SELECT tracks.Name, albums.Title
FROM tracks
JOIN albums
ON tracks.AlbumId = albums.AlbumId
/* Question 3*/
SELECT
albums.AlbumId,
albums.Title,
Min (tracks.Milliseconds)
FROM tracks
LEFT JOIN albums
ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.AlbumId
ORDER BY min(tracks.Milliseconds) DESC
/* Question 4*/
SELECT
albums.AlbumId,
albums.Title,
SUM(tracks.Milliseconds)
FROM tracks
JOIN albums
ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.AlbumId
ORDER BY total(tracks.Milliseconds) DESC
/* Question 5*/
SELECT
albums.Title,
SUM(tracks.Milliseconds) AS toplam
FROM tracks
JOIN albums
ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.Title
HAVING toplam > 4200000
ORDER BY toplam DESC
