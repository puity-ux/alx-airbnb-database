EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = '00000000-0000-0000-0000-000000000001';

EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id;

EXPLAIN ANALYZE
SELECT property_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY property_id;

EXPLAIN ANALYZE
SELECT * FROM Property
WHERE location = 'Nairobi, Kenya';

EXPLAIN ANALYZE
SELECT p.property_id, p.name,
       COUNT(b.booking_id) AS booking_count,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
