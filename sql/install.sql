SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS pulse_uni;
CREATE SCHEMA pulse_uni;
USE pulse_uni;

-- Drop in reverse order
DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS resale_transaction;
DROP TABLE IF EXISTS resale_request;
DROP TABLE IF EXISTS resale_offer;
DROP TABLE IF EXISTS ticket_pricing;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS ticket_category;
DROP TABLE IF EXISTS payment_method;
DROP TABLE IF EXISTS visitor;
DROP TABLE IF EXISTS performer_genre;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS artist_band;
DROP TABLE IF EXISTS band;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS event_staff;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS experience_level;
DROP TABLE IF EXISTS staff_role;
DROP TABLE IF EXISTS performance;
DROP TABLE IF EXISTS performer;
DROP TABLE IF EXISTS performance_type;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS stage_equipment;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS stage;
DROP TABLE IF EXISTS festival;
DROP TABLE IF EXISTS location;

CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address_street VARCHAR(100) NOT NULL,
    address_number SMALLINT NOT NULL,
    address_zip VARCHAR(10) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50),
    continent VARCHAR(20) CHECK (continent IN ('Europe', 'Asia', 'North America', 'South America', 'Africa', 'Oceania')),
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    image VARCHAR(100),
    description TEXT
);

CREATE TABLE festival (
    year YEAR PRIMARY KEY,
    name VARCHAR(50) GENERATED ALWAYS AS (CONCAT('Pulse University Festival ', year)) STORED,
    start_date DATE NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    end_date DATE GENERATED ALWAYS AS (DATE_ADD(start_date, INTERVAL duration - 1 DAY)) STORED,
    image VARCHAR(100),
    description TEXT,
    -- FK
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES location(location_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    INDEX idx_fest_location (location_id),
    INDEX idx_fest_loc (year, location_id)
);

CREATE TABLE stage (
    stage_id INT,
    year YEAR NOT NULL,
    PRIMARY KEY (stage_id, year),
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    location_id INT NOT NULL,
    image VARCHAR(100),
    description TEXT,
    -- FK
    FOREIGN KEY (year) REFERENCES festival(year),
    FOREIGN KEY (location_id) REFERENCES location(location_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_stage_festival (year),
    KEY idx_stage_location (location_id),
    INDEX idx_stage_capacity (stage_id, year, capacity)
);

CREATE TABLE equipment (
    equipment_id INT  AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(100)
);

CREATE TABLE stage_equipment (
    stage_id INT  NOT NULL,
    year YEAR NOT NULL,
    equipment_id INT NOT NULL,
    PRIMARY KEY (stage_id, year, equipment_id),
    quantity INT NOT NULL CHECK (quantity >= 0),
    -- FK
    FOREIGN KEY (year) REFERENCES festival(year),
    FOREIGN KEY (stage_id, year) REFERENCES stage(stage_id, year),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_steq_festival (year),
    KEY idx_steq_stage (stage_id, year),
    KEY idx_steq_equipment (equipment_id)
);

CREATE TABLE event (
    event_id INT  AUTO_INCREMENT PRIMARY KEY,
    year YEAR NOT NULL,
    stage_id INT NOT NULL,
    date DATE NOT NULL,
    festival_day INT NOT NULL CHECK (festival_day > 0),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    num_of_perf INT NOT NULL CHECK (num_of_perf > 0),
    image VARCHAR(100),
    description TEXT,
    UNIQUE (year, stage_id, festival_day),
    -- FK
    FOREIGN KEY (year) REFERENCES festival(year) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (stage_id, year) REFERENCES stage(stage_id, year),
    -- Indexes
    KEY idx_ev_year (year),
    KEY idx_event_stage (stage_id, year),
    INDEX idx_event_year (event_id, year),
    INDEX idx_event_date (event_id, date),
    INDEX idx_event_day_stage (year, date, stage_id)
);

CREATE TABLE performance_type (
    type_id INT  AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

CREATE TABLE performer (
    performer_id INT  AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK (name <> ''),
    image VARCHAR(100),
    description TEXT,
    site VARCHAR(100),
    instagram VARCHAR(100)
);

CREATE TABLE performance (
    performance_id INT  AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    performer_id INT NOT NULL,
    type_id INT NOT NULL,
    event_order INT NOT NULL CHECK (event_order > 0),
    start_time DATETIME NOT NULL,
    duration INT NOT NULL CHECK (duration <= 180),
    end_time DATETIME GENERATED ALWAYS AS (DATE_ADD(start_time, INTERVAL duration MINUTE)) STORED,
    UNIQUE (event_id, event_order),
    UNIQUE (event_id, performer_id),
    -- FK
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (type_id) REFERENCES performance_type(type_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_perf_event (event_id),
    KEY idx_perf_performer (performer_id),
    KEY idx_perf_type (type_id),
    INDEX idx_perf_performer_event (performer_id, event_id),
    INDEX idx_performance_performer (performer_id, performance_id),
    INDEX idx_perf_type_event_perrformer (type_id, event_id, performer_id)
);

CREATE TABLE staff_role (
    role_id INT  AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE experience_level (
    level_id INT  AUTO_INCREMENT PRIMARY KEY,
    level_name VARCHAR(50) NOT NULL,
    level_order INT NOT NULL CHECK(level_order > 0 AND level_order <= 5)
);

CREATE TABLE staff (
    staff_id INT  AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    age INT,
    role_id INT NOT NULL,
    level_id INT NOT NULL,
    is_assigned BOOLEAN DEFAULT FALSE,
    -- FK
    FOREIGN KEY (role_id) REFERENCES staff_role(role_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (level_id) REFERENCES experience_level(level_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_staff_role (role_id),
    KEY idx_staff_exp (level_id)
);

CREATE TABLE event_staff (
    event_id INT NOT NULL,
    staff_id INT NOT NULL,
    PRIMARY KEY (event_id, staff_id),
    -- FK
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_event_staff_event (event_id),
    KEY idx_event_staff_staff (staff_id)
);

CREATE TABLE artist (
    performer_id INT PRIMARY KEY,
    stage_name VARCHAR(100),
    birth_date DATE NOT NULL,
    age INT,
    -- FK
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_artist_performer (performer_id),
    INDEX idx_artist_age (age)
);


CREATE TABLE band (
    performer_id INT PRIMARY KEY,
    formation_year YEAR NOT NULL,
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    KEY idx_band_performer (performer_id)
);

CREATE TABLE artist_band (
    artist_id INT NOT NULL,
    band_id INT NOT NULL,
    PRIMARY KEY (artist_id, band_id),
    -- FK
    FOREIGN KEY (artist_id) REFERENCES artist(performer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (band_id) REFERENCES band(performer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_artist_band_artist (artist_id),
    KEY idx_artist_band_band (band_id)
);

CREATE TABLE genre (
    genre_id INT  AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    parent_genre_id INT,
    -- FK
    FOREIGN KEY (parent_genre_id) REFERENCES genre(genre_id) ON DELETE SET NULL ON UPDATE CASCADE,
    -- Indexes
    KEY idx_genre_parent_genre (parent_genre_id),
    INDEX idx_genre_name (genre_name)
);

CREATE TABLE performer_genre (
    performer_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (performer_id, genre_id),
    -- FK
    FOREIGN KEY (performer_id) REFERENCES performer(performer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_pg_performer (performer_id),
    KEY idx_pg_genre (genre_id)
);

CREATE TABLE visitor (
    visitor_id INT  AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    full_name VARCHAR(201) GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)) STORED,
    birth_date DATE NOT NULL,
    age INT,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    UNIQUE (first_name, last_name, email)
);

CREATE TABLE payment_method (
    method_id INT  AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL
);

CREATE TABLE ticket_category (
    category_id INT  AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE ticket (
    ticket_id INT  AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    visitor_id INT NOT NULL,
    category_id INT NOT NULL,
    purchase_timestamp DATETIME NOT NULL,
    payment_method_id INT NOT NULL,
    price_paid DECIMAL(5,2) NOT NULL CHECK (price_paid > 0),
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ean_code VARCHAR(20) NOT NULL UNIQUE,
    CHECK (ean_code REGEXP '^[0-9]{13}$'),
    is_activated BOOLEAN DEFAULT FALSE,
    UNIQUE (visitor_id, event_id),
    -- FK
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(method_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_ticket_event (event_id),
    KEY idx_ticket_visitor (visitor_id),
    KEY idx_ticket_category (category_id),
    KEY idx_ticket_payment (payment_method_id),
    INDEX idx_tick_vis_ev (visitor_id, event_id, is_activated),
    INDEX idx_ticket_event_pm_price (event_id, payment_method_id, price_paid)
);

CREATE TABLE ticket_pricing (
    event_id INT NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(5,2) NOT NULL CHECK (price > 0),
    PRIMARY KEY (event_id, category_id),
    -- FK
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_ticket_pricing_event (event_id),
    KEY idx_ticket_pricing_category (category_id)
);

CREATE TABLE resale_offer (
    offer_id INT  AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ticket_id INT NOT NULL,
    visitor_id INT NOT NULL,
    offer_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_available BOOLEAN DEFAULT TRUE,
    UNIQUE (ticket_id),
    -- FK
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_resale_offer_ticket (ticket_id),
    KEY idx_resale_offer_visitor (visitor_id)
);

CREATE TABLE resale_request (
    request_id INT  AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    visitor_id INT NOT NULL,
    offer_id INT DEFAULT NULL,
    CHECK (
        (offer_id IS NOT NULL AND event_id IS NULL AND category_id IS NULL) OR
        (offer_id IS NULL AND event_id IS NOT NULL AND category_id IS NOT NULL)
    ),
    event_id INT,
    category_id INT,
    payment_method_id INT NOT NULL,
    request_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_fulfilled BOOLEAN DEFAULT FALSE,
    -- FK
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (offer_id) REFERENCES resale_offer(offer_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(method_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_resale_request_visitor (visitor_id),
    KEY idx_resale_request_offer (offer_id),
    KEY idx_resale_request_event (event_id),
    KEY idx_resale_request_category (category_id),
    KEY idx_resale_request_payment (payment_method_id)
);

CREATE TABLE resale_transaction (
    transaction_id INT  AUTO_INCREMENT PRIMARY KEY,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    offer_id INT NOT NULL,
    request_id INT NOT NULL,
    transaction_timestamp DATETIME NOT NULL,
    is_complete BOOLEAN DEFAULT FALSE,
    seller_id INT NOT NULL,
    buyer_id INT NOT NULL,
    UNIQUE (offer_id, request_id),
    -- FK
    FOREIGN KEY (offer_id) REFERENCES resale_offer(offer_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (request_id) REFERENCES resale_request(request_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (seller_id) REFERENCES visitor(visitor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (buyer_id) REFERENCES visitor(visitor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Indexes
    KEY idx_resale_transaction_offer (offer_id),
    KEY idx_resale_transaction_request (request_id),
    KEY idx_resale_transaction_seller (seller_id),
    KEY idx_resale_transaction_buyer (buyer_id)
);

CREATE TABLE rating (
    rating_id INT  AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    performance_id INT NOT NULL,
    score_performance TINYINT NOT NULL CHECK (score_performance BETWEEN 1 AND 5),
    score_audio_visual TINYINT NOT NULL CHECK (score_audio_visual BETWEEN 1 AND 5),
    score_stage_presence TINYINT NOT NULL CHECK (score_stage_presence BETWEEN 1 AND 5),
    score_organization TINYINT NOT NULL CHECK (score_organization BETWEEN 1 AND 5),
    score_overall TINYINT NOT NULL CHECK (score_overall BETWEEN 1 AND 5),
    UNIQUE (performance_id, ticket_id),
    -- FK
    FOREIGN KEY (performance_id) REFERENCES performance(performance_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Indexes
    KEY idx_rating_ticket_perf (ticket_id, performance_id),
    KEY idx_rating_perf (performance_id),
    KEY idx_rating_ticket (ticket_id)
);

SET FOREIGN_KEY_CHECKS = 1;

-- ================================================================================================
--                                      Triggers & Procedures
-- ===============================================================================================
SET GLOBAL event_scheduler = ON;

DELIMITER $$
-- Checks ticket limit for each event
CREATE TRIGGER check_stage_capacity
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE stage_capacity INT;
    DECLARE ticket_count INT;
    
    -- Get the stage capacity for the event
    SELECT s.capacity INTO stage_capacity
    FROM event e
    JOIN stage s ON e.stage_id = s.stage_id AND e.year = s.year
    WHERE e.event_id = NEW.event_id;

    -- Count existing tickets for the event
    SELECT COUNT(*) INTO ticket_count
    FROM ticket
    WHERE event_id = NEW.event_id;

    -- Block if the stage capacity is exceeded
    IF ticket_count >= stage_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sold out!';
    END IF;
END$$


-- Block updates to specific ticket fields
CREATE TRIGGER prevent_ticket_update
BEFORE UPDATE ON ticket
FOR EACH ROW
BEGIN
    -- Event
    IF NEW.event_id <> OLD.event_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change event!';
    END IF;
    -- Category
    IF NEW.category_id <> OLD.category_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change ticket category!';
    END IF;
    -- Price
    IF NEW.price_paid <> OLD.price_paid THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change ticket price!';
    END IF;
    -- EAN code
    IF NEW.ean_code <> OLD.ean_code THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change EAN code!';
    END IF;
END$$

-- VIP Ticket <= 10% 
CREATE TRIGGER vip_tickets_limit
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE vip_tick_id INT;
    DECLARE vip_tick_count INT;
    DECLARE stage_capacity INT;

    -- Fetch the ticket category_id for VIP tickets
    SELECT category_id INTO vip_tick_id
    FROM ticket_category
    WHERE category_name = 'VIP';

    -- Check if new ticket is VIP
    IF NEW.category_id = vip_tick_id THEN
        -- Get the stage capacity 
        SELECT s.capacity INTO stage_capacity
        FROM event e
        JOIN stage s ON e.stage_id = s.stage_id AND e.year = s.year
        WHERE e.event_id = NEW.event_id;

        -- Count existing VIP tickets for the event
        SELECT COUNT(*) INTO vip_tick_count
        FROM ticket
        WHERE event_id = NEW.event_id AND category_id = vip_tick_id;

        -- Block if VIP limit is exceeded
        IF vip_tick_count > FLOOR(stage_capacity * 0.1) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'VIP tickets sold out! Make a request in the resale market, or check for other categories!';
        END IF;
    END IF;
END$$

-- ========================================= Resale System ====================================
-- Only allow resale offers when the event is sold out
CREATE TRIGGER allow_resale_offer
BEFORE INSERT ON resale_offer
FOR EACH ROW
BEGIN
    DECLARE c_evnt_id INT;
    DECLARE c_stage_capacity INT;
    DECLARE c_ticket_count INT;

    -- Get the stage capacity for the event associated with the offered ticket
    SELECT s.capacity INTO c_stage_capacity
    FROM ticket t
    JOIN event e ON t.event_id = e.event_id
    JOIN stage s ON e.stage_id = s.stage_id AND e.year = s.year
    WHERE t.ticket_id = NEW.ticket_id;

    -- Count existing tickets for the event
    SELECT COUNT(*) INTO c_ticket_count
    FROM ticket 
    WHERE event_id = (SELECT event_id FROM ticket WHERE ticket_id = NEW.ticket_id);

    IF c_ticket_count < c_stage_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Resale offers are only allowed when the event is sold out!';
    END IF;
END$$

-- Only allow resale requests when the event is sold out
CREATE TRIGGER allow_resale_request
BEFORE INSERT ON resale_request
FOR EACH ROW
BEGIN
    DECLARE r_stg_capacity INT;
    DECLARE r_ticket_count INT;

    -- Get the stage capacity for the event associated with the requested ticket
    SELECT s.capacity INTO r_stg_capacity
    FROM event e
    JOIN stage s ON e.stage_id = s.stage_id AND e.year = s.year
    WHERE e.event_id = NEW.event_id;

    -- Count existing tickets for the event
    SELECT COUNT(*) INTO r_ticket_count
    FROM ticket 
    WHERE event_id = NEW.event_id;

    IF r_ticket_count < r_stg_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Resale requests are only allowed when the event is sold out!';
    END IF;
END$$

-- Prevent resale offers for activated or past tickets 
CREATE TRIGGER prevent_resale_activated_tickets
BEFORE INSERT ON resale_offer
FOR EACH ROW
BEGIN
    DECLARE ticket_status BOOLEAN;
    DECLARE event_date DATE;

    -- Get the event date for the ticket
    SELECT date INTO event_date
    FROM event
    WHERE event_id = (SELECT event_id FROM ticket WHERE ticket_id = NEW.ticket_id);

    -- Get the activation status of the ticket
    SELECT is_activated INTO ticket_status
    FROM ticket
    WHERE ticket_id = NEW.ticket_id;

    -- Block if the ticket is already activated
    IF ticket_status = TRUE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ticket is already activated!';
    ELSEIF event_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ticket is for a past event!';
    END IF;
END$$

-- Reject invalid resale requests
CREATE TRIGGER prevent_invalid_resale_request
BEFORE INSERT ON resale_request
FOR EACH ROW
BEGIN
    -- Valid offer_id?
    IF NEW.offer_id IS NOT NULL THEN
        IF NOT EXISTS (
            SELECT 1
            FROM resale_offer
            WHERE offer_id = NEW.offer_id AND is_available = TRUE
            ) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid or unavailable offer_id!';
        END IF;
    END IF;

    -- Valid event_id + category_id?
    IF NEW.offer_id IS NULL THEN
        IF NOT EXISTS (
            SELECT 1 FROM ticket
            WHERE event_id = NEW.event_id AND category_id = NEW.category_id
            LIMIT 1 )
            THEN SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Invalid event_id or category_id!';
        END IF;
    END IF;
END$$        


CREATE PROCEDURE fifo_matching()
BEGIN
    DECLARE done INT DEFAULT FALSE;

    DECLARE req_id INT;
    DECLARE buyer_id INT;
    DECLARE matched_offer_id INT;
    DECLARE req_event_id INT;
    DECLARE req_category_id INT;
    DECLARE req_payment_method_id INT;
    DECLARE req_ticket_id INT;
    DECLARE seller_id INT;

    -- Cursor for unfulfilled requests
    DECLARE request_cursor CURSOR FOR
        SELECT request_id, visitor_id, offer_id, event_id, category_id, payment_method_id
        FROM resale_request 
        WHERE is_fulfilled = FALSE 
        ORDER BY request_timestamp;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN request_cursor;
    read_loop: LOOP
        FETCH request_cursor INTO req_id, buyer_id, matched_offer_id, req_event_id, req_category_id, req_payment_method_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET req_ticket_id = NULL;
        SET seller_id = NULL;

        -- CASE 1: Match by specific offer_id
        IF matched_offer_id IS NOT NULL THEN
            BEGIN
                DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET req_ticket_id = NULL;
                SELECT ro.ticket_id, ro.visitor_id
                INTO req_ticket_id, seller_id
                FROM resale_offer ro
                WHERE ro.offer_id = matched_offer_id AND ro.is_available = TRUE
                LIMIT 1;
            END;
        -- CASE 2: Match by event_id and category_id
        ELSE
            BEGIN
                -- Session variable cause something doesn't work
                SET @match_event_id = req_event_id;
                SET @match_category_id = req_category_id;

                SELECT sub.offer_id, sub.ticket_id, sub.visitor_id
                INTO matched_offer_id, req_ticket_id, seller_id
                FROM (
                    SELECT ro.offer_id, ro.ticket_id, ro.visitor_id
                    FROM resale_offer ro
                    JOIN ticket t ON ro.ticket_id = t.ticket_id
                    WHERE ro.is_available = TRUE
                      AND t.event_id = @match_event_id
                      AND t.category_id = @match_category_id
                    ORDER BY ro.offer_timestamp
                    LIMIT 1
                ) AS sub;
            END;
        END IF;

        -- If match found, perform updates
        IF req_ticket_id IS NOT NULL THEN
            UPDATE ticket
            SET visitor_id = buyer_id,
                purchase_timestamp = NOW(),
                payment_method_id = req_payment_method_id
            WHERE ticket_id = req_ticket_id;

            UPDATE resale_offer
            SET is_available = FALSE
            WHERE offer_id = matched_offer_id;

            UPDATE resale_request
            SET is_fulfilled = TRUE
            WHERE request_id = req_id;

            INSERT INTO resale_transaction (
                offer_id, request_id, transaction_timestamp, is_complete, seller_id, buyer_id
            ) VALUES (
                matched_offer_id, req_id, NOW(), TRUE, seller_id, buyer_id
            );
        END IF;
    END LOOP;

    CLOSE request_cursor;
END$$



-- ================================= Staff Assignment(CALL manually) ============================
-- Level 1: Assign staff per event
CREATE PROCEDURE assign_staff_for_event(IN ev_id INT)
BEGIN
    DECLARE stage_capacity INT;
    DECLARE required_sec INT;
    DECLARE required_sup INT;
    DECLARE required_tech INT DEFAULT 20;

    CREATE TEMPORARY TABLE temp_assigned_staff (staff_id INT);

    -- Get stage capacity for the event
    SELECT s.capacity INTO stage_capacity
    FROM event e
    JOIN stage s ON e.stage_id = s.stage_id AND e.year = s.year
    WHERE e.event_id = ev_id;

    SET required_sec = CEIL(stage_capacity * 0.05);
    SET required_sup = CEIL(stage_capacity * 0.02);

    -- Assign technical staff (role_id = 1)
    INSERT INTO temp_assigned_staff (staff_id)
    SELECT s.staff_id
    FROM staff s
    LEFT JOIN event_staff es ON s.staff_id = es.staff_id AND es.event_id = ev_id
    WHERE s.role_id = 1 AND es.staff_id IS NULL
    ORDER BY RAND()
    LIMIT required_tech;

    INSERT INTO event_staff (event_id, staff_id)
    SELECT ev_id, staff_id FROM temp_assigned_staff;

    -- Assign security staff (role_id = 2)
    DELETE FROM temp_assigned_staff;
    INSERT INTO temp_assigned_staff (staff_id)
    SELECT s.staff_id
    FROM staff s
    LEFT JOIN event_staff es ON s.staff_id = es.staff_id AND es.event_id = ev_id
    WHERE s.role_id = 2 AND es.staff_id IS NULL
    ORDER BY RAND()
    LIMIT required_sec;

    INSERT INTO event_staff (event_id, staff_id)
    SELECT ev_id, staff_id FROM temp_assigned_staff;

    -- Assign support staff (role_id = 3)
    DELETE FROM temp_assigned_staff;
    INSERT INTO temp_assigned_staff (staff_id)
    SELECT s.staff_id
    FROM staff s
    LEFT JOIN event_staff es ON s.staff_id = es.staff_id AND es.event_id = ev_id
    WHERE s.role_id = 3 AND es.staff_id IS NULL
    ORDER BY RAND()
    LIMIT required_sup;

    INSERT INTO event_staff (event_id, staff_id)
    SELECT ev_id, staff_id FROM temp_assigned_staff;

    DROP TEMPORARY TABLE IF EXISTS temp_assigned_staff;
END$$

-- Level 2: Assign staff per day
CREATE PROCEDURE assign_staff_for_day(IN event_date DATE)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE e_id INT;
    DECLARE cur CURSOR FOR SELECT event_id FROM event WHERE date = event_date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO e_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL assign_staff_for_event(e_id);
    END LOOP;
    CLOSE cur;

    -- Reset all staff for reuse on the next day
    UPDATE staff SET is_assigned = FALSE;
END$$

-- Level 3: Assign staff per festival
CREATE PROCEDURE assign_staff_for_festival(IN fest_year YEAR)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE fest_day DATE;
    DECLARE cur CURSOR FOR
        SELECT DISTINCT date FROM event WHERE year = fest_year ORDER BY date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO fest_day;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL assign_staff_for_day(fest_day);
    END LOOP;
    CLOSE cur;
END$$
-- ===========================================================================================

-- Enforce 5'<=break<=30' rule when inserting performances
CREATE TRIGGER enforce_break_rule_insert
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
    DECLARE prev_end TIME;
    DECLARE gap_minutes INT;
    DECLARE msg TEXT;

    SET msg = CONCAT('Break between performances must be between 5 and 30 minutes!  ',
           'event_id=', NEW.event_id,
           ', order=', NEW.event_order,
           ', start_time=', NEW.start_time
            );       

    IF NEW.event_order > 1 THEN
        -- Get end time of the previous performance
        SELECT end_time INTO prev_end
        FROM performance
        WHERE event_id = NEW.event_id AND event_order = NEW.event_order - 1;
        
        IF prev_end IS NULL THEN
            -- Calculate the gap in minutes
            SET gap_minutes = TIMESTAMPDIFF(MINUTE, prev_end, NEW.start_time);
            -- Enforce the break rule (5<break<30)
            IF gap_minutes < 5 OR gap_minutes > 30 THEN
                SIGNAL SQLSTATE '45000' 
                SET MESSAGE_TEXT = msg;
            END IF;
        END IF;
    END IF;
END$$

-- Enforce 5'<=break<=30' rule when updating performances
CREATE TRIGGER enforce_break_rule_update
BEFORE UPDATE ON performance
FOR EACH ROW
BEGIN
    DECLARE next_start TIME;
    DECLARE new_end TIME;
    DECLARE gap_minutes INT;
        DECLARE msg TEXT;

    SET msg = CONCAT('Break between performances must be between 5 and 30 minutes!',
           'event_id=', NEW.event_id,
           ', order=', NEW.event_order,
           ', start_time=', NEW.start_time
            );       


    -- Check only if event_order, start_time, or duration is updated
    IF NEW.event_order <> OLD.event_order OR
       NEW.start_time <> OLD.start_time OR
       NEW.duration <> OLD.duration THEN

       -- Calculate new end time
       SET new_end = ADDTIME(NEW.start_time, SEC_TO_TIME(NEW.duration * 60));

       -- Get start time of the next performance
       SELECT start_time INTO next_start
       FROM performance
       WHERE event_id = NEW.event_id AND event_order = NEW.event_order + 1;

       -- Calculate the gap 
       SET gap_minutes = TIMESTAMPDIFF(MINUTE, new_end, next_start);

       -- Enforce the break rule (5<break<30)
       IF next_start IS NOT NULL AND (gap_minutes < 5 OR gap_minutes > 30) THEN
            SIGNAL SQLSTATE '45000' 
           SET MESSAGE_TEXT = msg;
       END IF;
    END IF;
END$$

-- Prevent ovelapping performances for a performer on insert
CREATE TRIGGER no_performer_overlap_insert
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
    DECLARE perf_date DATE;
    DECLARE has_overlap BOOLEAN DEFAULT FALSE;

    -- Get the date of the event
    SELECT date INTO perf_date
    FROM event
    WHERE event_id = NEW.event_id;

    -- Check for overlapping performances for the same performer on the same date
    SELECT EXISTS (
        SELECT 1
        FROM performance p
        JOIN event e ON p.event_id = e.event_id
        WHERE p.performer_id = NEW.performer_id
        AND e.date = perf_date
        AND (
            NEW.start_time < p.end_time AND NEW.end_time > p.start_time
        )
    ) INTO has_overlap;

    IF has_overlap THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Performer has overlapping performances!';
    END IF;
END$$

-- Prevent performer from participating for more than 3 consecutive years
CREATE TRIGGER prevent_fourth_consecutive_year
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
    DECLARE new_year YEAR;
    DECLARE y1 YEAR;
    DECLARE y2 YEAR;
    DECLARE y3 YEAR;

    -- Get the year of the new performance
    SELECT year INTO new_year
    FROM event WHERE event_id = NEW.event_id;

    -- Check for three prior consecutive years of participation
    SELECT MIN(y) INTO y1 FROM (
        SELECT DISTINCT e.year AS y
        FROM performance p
        JOIN event e ON p.event_id = e.event_id
        WHERE p.performer_id = NEW.performer_id AND e.year < new_year
    ) AS years
    WHERE EXISTS (
        SELECT 1 FROM performance p2
        JOIN event e2 ON p2.event_id = e2.event_id
        WHERE p2.performer_id = NEW.performer_id AND e2.year = y1 + 1
    )
    AND EXISTS (
        SELECT 1 FROM performance p3
        JOIN event e3 ON p3.event_id = e3.event_id
        WHERE p3.performer_id = NEW.performer_id AND e3.year = y1 + 2
    );

    IF y1 IS NOT NULL AND new_year = y1 + 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Performer cannot participate for more than 3 consecutive years.';
    END IF;
END$$

-- Allow rating only for activated tickets
CREATE TRIGGER rating_only_for_activated_tickets
BEFORE INSERT ON rating
FOR EACH ROW
BEGIN
    DECLARE active BOOLEAN;

    SELECT is_activated INTO active
    FROM ticket
    WHERE ticket_id = NEW.ticket_id;

    IF active = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rating is allowed only for activated tickets!';
    END IF;
END$$

-- Each stage can host only one event at a time
CREATE TRIGGER prevent_stage_conflict
BEFORE INSERT ON event
FOR EACH ROW
BEGIN
    DECLARE conflict_exists BOOLEAN DEFAULT FALSE;

    SELECT EXISTS (
        SELECT 1
        FROM event e
        WHERE e.stage_id = NEW.stage_id AND e.year = NEW.year
        AND e.date = NEW.date
        AND (
            NEW.start_time < e.end_time AND NEW.end_time > e.start_time
        )
    ) INTO conflict_exists;

    IF conflict_exists THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stage is already booked for this time!';
    END IF;
END$$

-- Festivals can't be cancelled
CREATE TRIGGER prevent_festival_cancellation
BEFORE DELETE ON festival
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Festival cannot be cancelled!';
END$$

-- Events can't be cancelled
CREATE TRIGGER prevent_event_cancellation
BEFORE DELETE ON event
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Event cannot be cancelled!';
END$$

-- Buying tickets for past events is not allowed
CREATE TRIGGER prevent_ticket_purchase_past_event
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE event_date DATE;

    IF @skip_triggers IS NULL OR @skip_triggers = FALSE THEN
        -- Get the date of the event
        SELECT date INTO event_date
        FROM event
        WHERE event_id = NEW.event_id;

        -- Check if the event date is in the past
        IF event_date < CURDATE() THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tickets for past events cannot be purchased!';
        END IF;
    END IF;
END$$

-- Sets price on ticket from ticket_pricing
CREATE TRIGGER set_ticket_price
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE t_price DECIMAL(5,2);

    SELECT price INTO t_price
    FROM ticket_pricing
    WHERE event_id = NEW.event_id AND category_id = NEW.category_id;

    IF t_price IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Price not found for this event and category!';
    ELSE
        SET NEW.price_paid = t_price;
    END IF;
END$$

-- Calculate visitor age
CREATE TRIGGER set_visitor_age_before_insert
BEFORE INSERT ON visitor
FOR EACH ROW
BEGIN
    SET NEW.age = TIMESTAMPDIFF(YEAR, NEW.birth_date, CURDATE());
END$$

-- Calculate artist age
CREATE TRIGGER set_artist_age_before_insert
BEFORE INSERT ON artist
FOR EACH ROW
BEGIN
    SET NEW.age = TIMESTAMPDIFF(YEAR, NEW.birth_date, CURDATE());
END$$

-- Calculate staff age
CREATE TRIGGER set_staff_age_before_insert
BEFORE INSERT ON staff
FOR EACH ROW
BEGIN
    SET NEW.age = TIMESTAMPDIFF(YEAR, NEW.birth_date, CURDATE());
END$$

DELIMITER ;

-- ===============================================================================================
--                                             Events
-- ===============================================================================================
SET GLOBAL event_scheduler = ON;

-- Automatic event for matching resale offers and requests
CREATE EVENT fifo_match_every_minute
ON SCHEDULE EVERY 30 SECOND
DO
  CALL fifo_matching();

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ===============================================================================================
--                                             Views
-- ===============================================================================================
CREATE VIEW band_full_info AS
SELECT 
    b.performer_id AS id,
    bp.name AS band_name,
    b.formation_year,
    bp.description,
    bp.image,
    bp.site,
    bp.instagram,
    GROUP_CONCAT(ap.name ORDER BY ap.name SEPARATOR ', ') AS member_real_names
FROM band b
JOIN performer bp ON b.performer_id = bp.performer_id
LEFT JOIN artist_band ab ON ab.band_id = b.performer_id
LEFT JOIN artist a ON ab.artist_id = a.performer_id
LEFT JOIN performer ap ON a.performer_id = ap.performer_id
GROUP BY 
    b.performer_id, 
    bp.name, 
    b.formation_year,
    bp.description,
    bp.image,
    bp.site,
    bp.instagram;

-- ===========================================================
CREATE VIEW performer_full_info AS
SELECT 
    p.performer_id AS artist_id,
    p.name AS legal_name,
    a.stage_name,
    a.birth_date,
    a.age,
    p.image,
    p.description,
    p.site,
    p.instagram
FROM artist a
JOIN performer p ON a.performer_id = p.performer_id;

-- ===========================================================
CREATE VIEW performance_schedule_view AS
SELECT
  p.performance_id,
  p.event_id,
  p.event_order,
  pt.type_name AS performance_type,
  pr.name AS performer_name,
  p.start_time,
  p.duration,
  p.end_time
FROM performance p
JOIN performer pr ON p.performer_id = pr.performer_id
JOIN performance_type pt ON p.type_id = pt.type_id
ORDER BY p.event_id ,p.event_order;

-- ===========================================================
CREATE VIEW ticket_details_view AS
SELECT
  t.ticket_id,
  t.event_id,
  e.start_time,
  e.end_time,
  tc.category_name,
  v.visitor_id,  
  v.first_name,
  v.last_name,
  v.email,
  t.purchase_timestamp,
  t.price_paid,
  t.is_activated
FROM ticket t
JOIN visitor v ON t.visitor_id = v.visitor_id
JOIN ticket_category tc ON t.category_id = tc.category_id
JOIN event e ON t.event_id = e.event_id
ORDER BY ticket_id;