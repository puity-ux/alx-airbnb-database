-- Enable profiling (MySQL only)
SET PROFILING = 1;

-- Analyze frequent query: Bookings by property
SELECT * FROM Booking WHERE property_id = 'abc-123' ORDER BY start_date DESC;

-- Check profiling results (MySQL)
SHOW PROFILES;
SHOW PROFILE FOR QUERY 1;

-- Analyze execution plan (MySQL/PostgreSQL)
EXPLAIN SELECT * FROM Booking WHERE property_id = 'abc-123' ORDER BY start_date DESC;

-- Add composite index to optimize Booking query
CREATE INDEX idx_property_start_date ON Booking(property_id, start_date DESC);

-- Analyze execution plan again to confirm improvement
EXPLAIN SELECT * FROM Booking WHERE property_id = 'abc-123' ORDER BY start_date DESC;

-- Analyze query: Fetch all properties in Nairobi
SELECT * FROM Property WHERE city = 'Nairobi';

-- Add index to optimize Property city search
CREATE INDEX idx_city ON Property(city);

-- Re-analyze Property query
EXPLAIN SELECT * FROM Property WHERE city = 'Nairobi';
