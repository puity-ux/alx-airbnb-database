-- ==========================================
-- Performance Comparison SQL Script
-- ==========================================

-- 🔍 Initial Query (Unoptimized)
-- Retrieves full booking, user, property, and payment info
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- 🔧 Refactored Query (Optimized)
-- - Removed unnecessary columns
-- - Ensured indexed columns are used in joins
-- - Reduced memory load with fewer SELECT fields
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name || ' ' || u.last_name AS guest_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- 🧪 Use EXPLAIN ANALYZE before each query to measure performance
-- Example:
-- EXPLAIN ANALYZE
-- SELECT ...
