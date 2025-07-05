SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    Booking b
INNER JOIN "User" u ON b.user_id = u.user_id;

SELECT
    p.property_id,
    p.name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM
    Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM
    "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
