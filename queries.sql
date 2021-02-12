/* Use the Chinook database */
use Chinook;

/*
Select the name column for each of the records in
the `Artist` table
*/
select Name from Artist;

/*
Select the `FirstName` and `LastName` for each of the
records in the `Customer` table
*/
select FirstName, LastName from Customer;

/*
Select all of the columns for every record in the `Track`
table
*/
select * from Track;

/*
Select all of the names from the `MediaType` table
*/
select Name from MediaType;

/*
Select all `Track` records where the `Composer` is `U2`
*/
select * from Track
where Composer = 'U2';

/*
Select all `Album` records where the `AlbumId` is 232;
*/
select * from Album
where AlbumId = 232;

/*
Select the `FirstName`, `LastName` and `Title` for every
`Employee` that has a `Title` of "IT Staff"
*/
select FirstName, LastName, Title from Employee
where Title = 'IT Staff';

/*
Select all of the data for every `Track` record across 
both the `Track` and `Album` tables
*/
select * from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Select the Track's Name, the Album's Title and the Artist's ArtistId for every
`Track` record across both the `Track` and `Album` tables
*/
select Name, Title, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Use MySQL's aliases to display friendlier column names
*/
select Name as Track, Title as Album, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Instead of just getting the Artist's ID, we'll do an additional join
to get the Artist's name from the `Artist` table
*/
SELECT Track.Name as Track, Title as Album, Album.ArtistId, Artist.Name as Artist from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId;

/*
Show all of the Track names, album titles and artist name where the artist's name
is "U2"
*/
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "U2";

/*
Show all of the Track names, album titles and artist name where the artist's name
is "U2" and the name of the track is "Pride (In The Name Of Love)"
*/
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "U2" AND Track.Name = "Pride (In The Name Of Love)";

/*
Show all of the track names, album titles, and artist names where the track name
is "Believe"
*/
SELECT Track.Name as Track, Title as Album, Artist.Name as Artist FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Track.Name = "Believe";

/*
Select every track name and the track's associated media type
*/
SELECT Track.Name, MediaType.Name FROM Track 
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId;

/*
Select every track name and the track's associated genre, where the
name of the genre is "Jazz"
*/
SELECT Track.Name, Genre.Name FROM Track
INNER JOIN Genre on Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Jazz';

/*
Select every track name and the track's associated media type
and genre, where the name of the mdeia type is 
"Protected AAC audio file" and the genre is "Soundtrack"
*/
SELECT Track.Name, MediaType.Name, Genre.Name FROM Track
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
INNER JOIN Genre on Track.GenreId = Genre.GenreId
WHERE MediaType.Name = 'Protected AAC audio file' AND Genre.Name = 'Soundtrack';

SELECT Playlist.Name AS Playlist, Track.Name AS Track, Album.Title AS Album, Artist.Name AS Artist FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Playlist.Name = 'Grunge';

SELECT Playlist.Name as Playlist, COUNT(*) From Playlist INNER JOIN PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId  GROUP BY Playlist HAVING count(*) = 1;

/*
Order all of the `Album` records by the `Title` field in 
ascending order
*/
SELECT * FROM Album ORDER BY Title;

/*
Order all of the `Album` records by the `Title` field in
descending order
*/
SELECT * FROM Album ORDER BY Title DESC;

/*
Order all of the `Album` records by the `ArtistId` field in 
ascending order, and within that, order by `Title`
*/
SELECT * FROM Album ORDER BY ArtistId, Title;

/*
Select the Track name and the Album title and order them
by the Album title, and then by the track name
*/
SELECT Track.Name, Album.Title FROM Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
ORDER BY Album.Title, Track.Name;

/*
Select the `InvoiceDate`, `BillingCity` and `Total` from the
`Invoice` table. Order them descendingly and limit the results
to 5
*/
SELECT InvoiceDate, BillingCity, Total FROM Invoice
ORDER BY Total DESC
LIMIT 5;

/*
Select the `InvoiceDate`, `BillingAddress` and `Total` from the
`Invoice` table. Order them descendingly according to the `InvoiceDate`
*/
SELECT InvoiceDate, BillingAddress, Total FROM Invoice ORDER BY InvoiceDate DESC;

SELECT EmployeeId, LastName, FirstName, HireDate FROM Employee
ORDER BY HireDate DESC
LIMIT 3;

SELECT EmployeeId, LastName, FirstName, HireDate FROM Employee
ORDER BY HireDate DESC, EmployeeId DESC
LIMIT 3;

SELECT 
    concat(Customer.FirstName, " ", Customer.LastName) as Name,
    Invoice.InvoiceDate as Date,
    Invoice.Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Total DESC, InvoiceDate DESC
LIMIT 10;

/*
Get a count of all of the records in the `Customer` table
*/
SELECT COUNT(*) FROM Customer;

/*
Get a count of all of the records in the `Customer` table
*/
SELECT COUNT(FirstName) FROM Customer;

/*
Get a count of all of the records in the `Customer` table
where the customer's `FirstName` is "Frank"
*/
SELECT COUNT(*) FROM Customer WHERE FirstName = 'Frank';

SELECT COUNT(FirstName) FROM Customer WHERE SupportRepId = 4;

SELECT Employee.FirstName AS Employee, COUNT(Customer.FirstName) AS Customer FROM Employee
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane';

SELECT MIN(LastName) FROM Customer;

SELECT MIN(BirthDate) FROM Employee;

SELECT MAX(LastName) FROM Customer;

SELECT MAX(HireDate) FROM Employee;

SELECT AVG(Total) FROM Invoice;

SELECT ROUND(AVG(Total), 2) FROM Invoice;

SELECT TOTAL FROM Invoice
WHERE InvoiceId = 2;

SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine
WHERE InvoiceId = 2;

SELECT COUNT(*) FROM  Track
GROUP BY AlbumId;

SELECT AlbumId, COUNT(*) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, COUNT(*) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;

SELECT AlbumId, MIN(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, MAX(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, ROUND(SUM(UnitPrice), 2) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, ROUND(SUM(UnitPrice), 2) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;

SELECT COUNT(city) FROM Customer WHERE city = "Berlin";

SELECT SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), Track.Name AS Track FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";

SELECT Artist.Name AS Artist, COUNT(Track.TrackId) AS Track FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.Name)
DESC LIMIT 5;

/*
Create a dummy `MediaType`
*/
INSERT INTO MediaType (Name)
VALUES ("Test Media 1");

/*
Create a new `Album` record with a name of "Boy" and an
ArtistId of 150. This ArtistId is for U2
*/
INSERT INTO Album (Title, ArtistId)
VALUES ("Boy", 150);

/*
Get all of the relevant information that we need to enter all of
tracks for U2's "Boy" album
*/
SELECT AlbumId FROM Album WHERE Title = "Boy";

SELECT MediaTypeId FROM MediaType WHERE Name = "Protected AAC audio file";

SELECT GenreId FROM Genre WHERE Name = "Rock";

/*
Use the above information to create the new tracks
*/
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES ("I Will Follow", 348, 2, 1, "U2", 220000, 1234, 0.99);

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Twilight", 348, 2, 1, "U2", 210000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("An Cat Dubh", 348, 2, 1, "U2", 110000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Into the Heart", 348, 2, 1, "U2", 200000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Out of Control", 348, 2, 1, "U2", 100000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Stories for Boys", 348, 2, 1, "U2", 150000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("The Ocean", 348, 2, 1, "U2", 175000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("A Day Without Me", 348, 2, 1, "U2", 185000, 1234, 0.99);

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES("Extra Track", 348, 2, 1, "U2", 290000, 1234, 0.99);

INSERT INTO Track
    (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
    ("Another Time, Another Place", 348, 2, 1, "U2", 210000, 1234, 0.99),
    ("The Electric Co.", 348, 2, 1, "U2", 200000, 1234, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, "U2", 150000, 1234, 0.99);
