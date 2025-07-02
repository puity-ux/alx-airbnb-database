-- =====================
-- INSERT INTO USER
-- =====================
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('00000000-0000-0000-0000-000000000001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pass_1', '0712345678', 'guest'),
('00000000-0000-0000-0000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pass_2', '0723456789', 'host'),
('00000000-0000-0000-0000-000000000003', 'Carol', 'White', 'carol@example.com', 'hashed_pass_3', NULL, 'admin');

-- =====================
-- INSERT INTO PROPERTY
-- =====================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', 'Serene Cottage', 'A peaceful retreat in the countryside.', 'Nanyuki, Kenya', 60.00),
('11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000002', 'Seaside Villa', 'Oceanfront villa with a pool.', 'Diani, Kenya', 200.00);

-- =====================
-- INSERT INTO BOOKING
-- =====================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('22222222-2222-2222-2222-222222222221', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', '2025-07-10', '2025-07-13', 180.00, 'confirmed'),
('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000001', '2025-08-01', '2025-08-06', 1000.00, 'pending');

-- =====================
-- INSERT INTO PAYMENT
-- =====================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('33333333-3333-3333-3333-333333333331', '22222222-2222-2222-2222-222222222221', 180.00, 'credit_card');

-- =====================
-- INSERT INTO REVIEW
-- =====================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('44444444-4444-4444-4444-444444444441', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 5, 'Lovely experience. Clean and quiet.'),
('44444444-4444-4444-4444-444444444442', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000001', 4, 'Great location, but the WiFi was spotty.');

-- =====================
-- INSERT INTO MESSAGE
-- =====================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('55555555-5555-5555-5555-555555555551', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi Bob, I’m interested in booking the Seaside Villa.'),
('55555555-5555-5555-5555-555555555552', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Hi Alice, it’s available for your dates!');
