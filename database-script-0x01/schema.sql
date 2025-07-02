Project airbnb_database {
  database_type: "PostgreSQL"
  note: "ERD for ALX Airbnb Project"
}

Table User {
  user_id UUID [pk, unique, not null]
  first_name VARCHAR [not null]
  last_name VARCHAR [not null]
  email VARCHAR [unique, not null, note: "Indexed"]
  password_hash VARCHAR [not null]
  phone_number VARCHAR
  role ENUM("guest", "host", "admin") [not null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]

  Indexes {
    (email)
  }
}

Table Property {
  property_id UUID [pk, unique, not null]
  host_id UUID [ref: > User.user_id]
  name VARCHAR [not null]
  description TEXT [not null]
  location VARCHAR [not null]
  pricepernight DECIMAL [not null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  updated_at TIMESTAMP [note: "Updated automatically on change"]

  Indexes {
    (property_id)
  }
}

Table Booking {
  booking_id UUID [pk, unique, not null]
  property_id UUID [ref: > Property.property_id]
  user_id UUID [ref: > User.user_id]
  start_date DATE [not null]
  end_date DATE [not null]
  total_price DECIMAL [not null]
  status ENUM("pending", "confirmed", "canceled") [not null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]

  Indexes {
    (booking_id)
    (property_id)
  }
}

Table Payment {
  payment_id UUID [pk, unique, not null]
  booking_id UUID [ref: > Booking.booking_id]
  amount DECIMAL [not null]
  payment_date TIMESTAMP [default: `CURRENT_TIMESTAMP`]
  payment_method ENUM("credit_card", "paypal", "stripe") [not null]

  Indexes {
    (booking_id)
  }
}

Table Review {
  review_id UUID [pk, unique, not null]
  property_id UUID [ref: > Property.property_id]
  user_id UUID [ref: > User.user_id]
  rating INTEGER [not null, note: "Must be between 1 and 5"]
  comment TEXT [not null]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Message {
  message_id UUID [pk, unique, not null]
  sender_id UUID [ref: > User.user_id]
  recipient_id UUID [ref: > User.user_id]
  message_body TEXT [not null]
  sent_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}
