SET FOREIGN_KEY_CHECKS = 0;

-- Drop in reverse order
DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS resale_transaction;
DROP TABLE IF EXISTS resale_request;
DROP TABLE IF EXISTS resale_offer;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS payment_method;
DROP TABLE IF EXISTS ticket_category;
DROP TABLE IF EXISTS event_staff;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS staff_role;
DROP TABLE IF EXISTS experience_level;
DROP TABLE IF EXISTS performance;
DROP TABLE IF EXISTS performance_type;
DROP TABLE IF EXISTS artist_band;
DROP TABLE IF EXISTS band;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS performer_genre;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS performer;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS stage_equipment;
DROP TABLE IF EXISTS stage;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS festival;
DROP TABLE IF EXISTS location;

CREATE TABLE location (
    location_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255),
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    city VARCHAR(255),
    country VARCHAR(100),
    continent VARCHAR(100),
    image VARCHAR(255),
    description TEXT
);

CREATE TABLE festival (
    year YEAR PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location_id INT NOT NULL,
    start_date DATE NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    end_date DATE GENERATED ALWAYS AS (DATE_ADD(start_date, INTERVAL duration - 1 DAY)) STORED,
    image VARCHAR(255),
    description TEXT,
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

CREATE TABLE stage (
    stage_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    location_id INT NOT NULL,
    image VARCHAR(255),
    description TEXT,
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

CREATE TABLE equipment (
    equipment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255)
);

CREATE TABLE stage_equipment (
    stage_id INT UNSIGNED NOT NULL,
    equipment_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),
    PRIMARY KEY (stage_id, equipment_id),
    FOREIGN KEY (stage_id) REFERENCES stage(stage_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

CREATE TABLE event (
    event_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    year YEAR NOT NULL,
    stage_id INT NOT NULL,
    date DATE NOT NULL,
    festival_day INT NOT NULL CHECK (festival_day > 0),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    num_of_perf INT NOT NULL CHECK (num_of_perf > 0),
    image VARCHAR(255),
    description TEXT,
    FOREIGN KEY (year) REFERENCES festival(year),
    FOREIGN KEY (stage_id) REFERENCES stage(stage_id)
);

CREATE TABLE performance_type (
    type_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

CREATE TABLE performer (
    performer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image VARCHAR(255),
    description TEXT,
    site VARCHAR(255),
    instagram VARCHAR(255)
);

CREATE TABLE performance (
    performance_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    performer_id INT NOT NULL,
    type_id INT NOT NULL,
    event_order INT NOT NULL CHECK (event_order > 0),
    start_time TIME NOT NULL,
    duration INT NOT NULL CHECK (duration <= 180),
    end_time TIME GENERATED ALWAYS AS (ADDTIME(start_time, SEC_TO_TIME(duration * 60))) STORED,
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id),
    FOREIGN KEY (type_id) REFERENCES performance_type(type_id)
);

CREATE TABLE staff_role (
    role_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE experience_level (
    level_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    level_name VARCHAR(50) NOT NULL,
    level_order INT NOT NULL CHECK
);

CREATE TABLE staff (
    staff_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    age INT GENERATED ALWAYS AS (TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) STORED,
    role_id INT NOT NULL,
    level_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES staff_role(role_id),
    FOREIGN KEY (level_id) REFERENCES experience_level(level_id)
);

CREATE TABLE event_staff (
    event_id INT NOT NULL,
    staff_id INT NOT NULL,
    PRIMARY KEY (event_id, staff_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE artist (
    performer_id INT PRIMARY KEY,
    stage_name VARCHAR(100),
    birth_date DATE,
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id)
);

CREATE TABLE band (
    performer_id INT PRIMARY KEY,
    formation_year YEAR,
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id)
);

CREATE TABLE artist_band (
    artist_id INT NOT NULL,
    band_id INT NOT NULL,
    PRIMARY KEY (artist_id, band_id),
    FOREIGN KEY (artist_id) REFERENCES artist(performer_id),
    FOREIGN KEY (band_id) REFERENCES band(performer_id)
);

CREATE TABLE genre (
    genre_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    parent_genre_id INT,
    FOREIGN KEY (parent_genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE performer_genre (
    performer_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (performer_id, genre_id),
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE visitor (
    visitor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    age INT GENERATED ALWAYS AS (TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) STORED,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE payment_method (
    method_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL
);

CREATE TABLE ticket_category (
    category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE ticket (
    ticket_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    visitor_id INT NOT NULL,
    category_id INT NOT NULL,
    purchase_timestamp DATETIME NOT NULL,
    payment_method_id INT NOT NULL,
    price_paid DECIMAL(5,2) NOT NULL CHECK (price_paid > 0),
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ean_code VARCHAR(20) NOT NULL UNIQUE,
    is_activated BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id),
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(method_id),
    UNIQUE (visitor_id, event_id)
);

CREATE TABLE ticket_pricing (
    event_id INT NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(5,2) NOT NULL CHECK (price > 0),
    PRIMARY KEY (event_id, category_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id)
)

CREATE TABLE resale_offer (
    offer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ticket_id INT NOT NULL,
    visitor_id INT NOT NULL,
    offer_timestamp DATETIME NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id)
);

CREATE TABLE resale_request (
    request_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    visitor_id INT NOT NULL,
    offer_id INT,
    event_id INT,
    category_id INT,
    request_timestamp DATETIME NOT NULL,
    is_fulfilled BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id),
    FOREIGN KEY (offer_id) REFERENCES resale_offer(offer_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id),
    CHECK (
        (offer_id IS NOT NULL AND event_id IS NULL AND category_id IS NULL) OR
        (offer_id IS NULL AND event_id IS NOT NULL AND category_id IS NOT NULL)
    )
);

CREATE TABLE resale_transaction (
    transaction_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    offer_id INT NOT NULL,
    request_id INT NOT NULL,
    transaction_timestamp DATETIME NOT NULL,
    is_complete BOOLEAN DEFAULT FALSE,
    seller_id INT NOT NULL,
    buyer_id INT NOT NULL,
    FOREIGN KEY (offer_id) REFERENCES resale_offer(offer_id),
    FOREIGN KEY (request_id) REFERENCES resale_request(request_id),
    FOREIGN KEY (seller_id) REFERENCES visitor(visitor_id),
    FOREIGN KEY (buyer_id) REFERENCES visitor(visitor_id),
    UNIQUE (offer_id, request_id)
);

CREATE TABLE rating (
    rating_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    performance_id INT NOT NULL,
    visitor_id INT NOT NULL,
    score_performance INT NOT NULL CHECK (score_performance BETWEEN 1 AND 5),
    score_audio_visual INT NOT NULL CHECK (score_audio_visual BETWEEN 1 AND 5),
    score_stage_presence INT NOT NULL CHECK (score_stage_presence BETWEEN 1 AND 5),
    score_organization INT NOT NULL CHECK (score_organization BETWEEN 1 AND 5),
    score_overall INT NOT NULL CHECK (score_overall BETWEEN 1 AND 5),
    FOREIGN KEY (performance_id) REFERENCES performance(performance_id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id),
    UNIQUE (performance_id, visitor_id)
);

SET FOREIGN_KEY_CHECKS = 1;