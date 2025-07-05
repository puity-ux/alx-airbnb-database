-- ========================
-- Partitioning Setup Script: Booking Table by Month (start_date)
-- ========================

-- Step 1: Drop old table if it exists
DROP TABLE IF EXISTS Booking CASCADE;

-- Step 2: Create Partitioned Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES "User"(user_id)
) PARTITION BY RANGE (start_date);

-- Step 3: Create Monthly Partitions (example: Jan–Mar 2025)
CREATE TABLE Booking_2025_01 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE Booking_2025_02 PARTITION OF Booking
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE Booking_2025_03 PARTITION OF Booking
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Add index to improve partition-level scans
CREATE INDEX idx_booking_user_id_2025_01 ON Booking_2025_01(user_id);
CREATE INDEX idx_booking_user_id_2025_02 ON Booking_2025_02(user_id);
CREATE INDEX idx_booking_user_id_2025_03 ON Booking_2025_03(user_id);

-- Step 4: Query test with EXPLAIN ANALYZE (use in psql)
-- EXPLAIN ANALYZE
-- SELECT * FROM Booking
-- WHERE start_date BETWEEN '2025-02-10' AND '2025-02-20';
