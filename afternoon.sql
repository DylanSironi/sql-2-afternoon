select * from invoice i
join invoice_line il 
on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c 
on i.customer_id = c.customer_id;

t c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e
on c.support_rep_id = e.employee_id;

select al.title, ar.name
from album al
join artist ar
on al.artist_id = ar.artist_id;

select pt.track_id
from playlist_track pt
join playlist p 
on p.playlist_id = pt.playlist_id
where p.name = 'Music';

SELECT t.name
FROM track t
JOIN playlist_track pt 
ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name
FROM track t
JOIN playlist_track pt 
ON t.track_id = pt.track_id
JOIN playlist p 
ON pt.playlist_id = p.playlist_id;

SELECT t.name, a.title
FROM track t
JOIN album a 
ON t.album_id = a.album_id
JOIN genre g 
ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';

-- part 2

SELECT *
FROM invoice
WHERE invoice_id 
IN (
    SELECT invoice_id 
    FROM invoice_line 
    WHERE unit_price > 0.99 
);

SELECT *
FROM playlist_track
WHERE playlist_id 
IN (
     SELECT playlist_id 
     FROM playlist 
     WHERE name = 'Music' 
);

SELECT name
FROM track
WHERE track_id IN ( 
    SELECT track_id 
    FROM playlist_track
    WHERE playlist_id = 5 
);

SELECT *
FROM track
WHERE genre_id 
IN (
    SELECT genre_id 
    FROM genre 
    WHERE name = 'Comedy' 
);

SELECT *
FROM track
WHERE album_id IN ( 
    SELECT album_id 
    FROM album 
    WHERE title = 'Fireball' 
);

SELECT *
FROM track
WHERE album_id IN ( 
  SELECT album_id FROM album WHERE artist_id IN ( 
    SELECT artist_id FROM artist WHERE name = 'Queen'
  )
); SELECT *
FROM track
WHERE album_id IN 
( 
    SELECT album_id 
    FROM album 
    WHERE artist_id 
    IN ( 
        SELECT artist_id 
        FROM artist 
        WHERE name = 'Queen'
    )
); 

-- part 3

UPDATE customer
SET fax = null
WHERE fax IS NOT null;

UPDATE customer
SET company = 'Self'
WHERE company IS null;

UPDATE customer 
SET last_name = 'Thompson' 
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = ( 
    SELECT genre_id 
    FROM genre 
    WHERE name = 'Metal' 
)
AND composer IS null;

-- part 4

SELECT COUNT(*), g.name
FROM track t
JOIN genre g 
ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name
FROM track t
JOIN genre g 
ON g.genre_id = t.genre_id
WHERE g.name = 'Pop' 
OR g.name = 'Rock'
GROUP BY g.name;

SELECT ar.name, COUNT(*)
FROM album al
JOIN artist ar 
ON ar.artist_id = al.artist_id
GROUP BY ar.name

-- part 5

select distinct composer 
from track;

select distinct billing_postal_code
from invoice;

select distinct company 
from customer;

-- part 6

DELETE 
FROM practice_delete 
WHERE type = 'bronze';

DELETE 
FROM practice_delete 
WHERE type = 'silver';

DELETE 
FROM practice_delete 
WHERE value = 150;

