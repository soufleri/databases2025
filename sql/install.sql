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
    payment_method_id INT NOT NULL,
    request_timestamp DATETIME NOT NULL,
    is_fulfilled BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id),
    FOREIGN KEY (offer_id) REFERENCES resale_offer(offer_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (category_id) REFERENCES ticket_category(category_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(method_id),
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
    ticket_id INT NOT NULL,
    performance_id INT NOT NULL,
    --visitor_id INT NOT NULL,
    score_performance TINYINT NOT NULL CHECK (score_performance BETWEEN 1 AND 7),
    score_audio_visual TINYINT NOT NULL CHECK (score_audio_visual BETWEEN 1 AND 7),
    score_stage_presence TINYINT NOT NULL CHECK (score_stage_presence BETWEEN 1 AND 7),
    score_organization TINYINT NOT NULL CHECK (score_organization BETWEEN 1 AND 7),
    score_overall TINYINT NOT NULL CHECK (score_overall BETWEEN 1 AND 7),
    FOREIGN KEY (performance_id) REFERENCES performance(performance_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id),
    --FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id),
    UNIQUE (performance_id, ticket_id)
);

SET FOREIGN_KEY_CHECKS = 1;

-- ===============================================================
-- Triggers & Procedures
-- ===============================================================
DELIMITER //
-- Enforce that stage capacity is not exceeded
CREATE TRIGGER check_stage_capacity
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE stage_capacity INT;
    DECLARE ticket_count INT;
    
    -- Get the stage capacity for the event
    SELECT s.capacity INTO stage_capacity
    FROM event e
    JOIN stage s ON e.stage_id = s.stage_id
    WHERE e.event_id = NEW.event_id;

    -- Count existing tickets for the event
    SELECT COUNT(*) INTO ticket_count
    FROM ticket
    WHERE event_id = NEW.event_id 

    -- Block if the stage capacity is exceeded
    IF ticket_count >= stage_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sold out!';
    END IF;
END;
//

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
END;
//

-- VIP Ticket <= 10% 
CREATE TRIGGER vip_tickets_limit
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE vip_tick_id INT;
    DECLARE vip_tick_count INT;
    DECLARE stage_capacity INT;

    -- Fetch the ticket category ID for VIP tickets
    SELECT category_id INTO vip_tick_id
    FROM ticket_category
    WHERE category_name = 'VIP';

    -- Check if new ticket is VIP
    IF NEW.category_id = vip_tick_id THEN
        -- Get the stage capacity for the event
        SELECT s.capacity INTO stage_capacity
        FROM event e
        JOIN stage s ON e.stage_id = s.stage_id
        WHERE e.event_id = NEW.event_id;

        -- Count existing VIP tickets for the event
        SELECT COUNT(*) INTO vip_tick_count
        FROM ticket
        WHERE event_id = NEW.event_id AND category_id = vip_tick_id;

        -- Block if VIP limit is exceeded
        IF vip_tick_count >= FLOOR(stage_capacity * 0.1) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'VIP tickets sold out!';
        END IF;
    END IF;
END;
//

-- Prevent resale of activated tickets
CREATE TRIGGER prevent_resale_activated_tickets
BEFORE INSERT ON resale_offer
FOR EACH ROW
BEGIN
    DECLARE ticket_status BOOLEAN;

    -- Get the activation status of the ticket
    SELECT is_activated INTO ticket_status
    FROM ticket
    WHERE ticket_id = NEW.ticket_id;

    -- Block if the ticket is already activated
    IF ticket_status = TRUE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ticket is already activated!';
    END IF;
END;
//

-- Procedure for FIFO logic matching
CREATE PROCEDURE fifo_matching()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE req_id INT;
    DECLARE buyer_id INT;
    DECLARE ticket_id INT;
    DECLARE offer_match_id INT;
    DECLARE seller_id INT;
    DECLARE event_id INT;
    DECLARE category_id INT;
    DECLARE pm_id INT;

    DECLARE request_cursor CURSOR FOR
        SELECT request_id, visitor_id, offer_id, event_id, category_id, payment_method_id
        FROM resale_request 
        WHERE is_fulfilled = FALSE 
        ORDER BY request_timestamp;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN request_cursor;
    read_loop: LOOP
        FETCH request_cursor INTO req_id, buyer_id, offer_match_id, event_id, category_id, pm_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET ticket_id = NULL;
        SET seller_id = NULL;

        -- CASE 1: Request for specific offer_id
        IF offer_match_id IS NOT NULL THEN
            SELECT ro.ticket_id, ro.visitor_id INTO ticket_id, seller_id
            FROM resale_offer ro
            WHERE ro.offer_id = offer_match_id AND ro.is_available = TRUE;
            LIMIT 1;
        -- CASE 2: Request for event_id and category_id
        ELSE
            SELECT ro.offer_id, ro.ticket_id, ro.visitor_id
            INTO offer_match_id, ticket_id, seller_id
            FROM resale_offer ro
            JOIN ticket t ON ro.ticket_id = t.ticket_id
            WHERE ro.is_available = TRUE AND t.event_id = event_id AND t.category_id = category_id
            ORDER BY ro.offer_timestamp
            LIMIT 1;
        END IF;

        -- Match found
        IF ticket_id IS NOT NULL THEN
            -- Transfer ticket ownership
            UPDATE ticket
            SET visitor_id = buyer_id,
                purchase_timestamp = NOW(),
                payment_method_id = pm_id,
            WHERE ticket_id = ticket_id;
            -- Change Boolean flags
            UPDATE resale_offer SET is_available = FALSE WHERE offer_id = offer_match_id;
            UPDATE resale_request SET is_fulfilled = TRUE WHERE request_id = req_id;
            -- Create transaction record
            INSERT INTO resale_transaction (offer_id, request_id, transaction_timestamp, is_complete, seller_id, buyer_id)
            VALUES (offer_match_id, req_id, NOW(), TRUE, seller_id, buyer_id);
        END IF;
    END LOOP;

    CLOSE request_cursor;
END;
//

-- Call procedure after every insert on resale_request
CREATE TRIGGER call_fifo_after_request
AFTER INSERT ON resale_request
FOR EACH ROW
BEGIN
    CALL fifo_matching();
END;
//

-- Call procedure after every insert on resale_offer
CREATE TRIGGER call_fifo_after_offer
AFTER INSERT ON resale_offer
FOR EACH ROW
BEGIN
    CALL fifo_matching();
END;
//

-- Procedure for staff assignment
CREATE PROCEDURE staff_assignment_check(IN ev_id INT)
BEGIN
    DECLARE cap INT;
    DECLARE security_count INT;
    DECLARE support_count INT;

    -- Count tickets sold for the event (num of attendees)
    SELECT COUNT(*) INTO attendees
    FROM ticket
    WHERE e.event_id = ev_id;

    -- Count current security staff
    SELECT COUNT(*) INTO security_count
    FROM event_staff es
    JOIN staff st ON es.staff_id = st.staff_id
    JOIN staff_role sr ON st.role_id = sr.role_id
    WHERE es.event_id = ev_id AND sr.role_name = 'Security';

    -- Count current support staff
    SELECT COUNT(*) INTO support_count
    FROM event_staff es
    JOIN staff st ON es.staff_id = st.staff_id
    JOIN staff_role sr ON st.role_id = sr.role_id
    WHERE es.event_id = ev_id AND sr.role_name = 'Support';

    -- Check minimum staff requirements
    IF security_count < FLOOR(attendees * 0.05) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Security staff must be at least 5% of attendees!';
    END IF;

    IF support_count < FLOOR(attendees * 0.02) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Support staff must be at least 2% of attendees!';
    END IF;
END;
//

-- Call procedure after every insert on event_staff
CREATE TRIGGER call_staff_assignment_insert
AFTER INSERT ON event_staff
FOR EACH ROW
BEGIN
    CALL staff_assignment_check(NEW.event_id);
END;
//
-- Call procedure after every delete on event_staff
CREATE TRIGGER call_staff_assignment_delete
AFTER DELETE ON event_staff
FOR EACH ROW
BEGIN
    CALL staff_assignment_check(OLD.event_id);
END;
//

-- Enforce 5'<break<30' rule when inserting performances
CREATE TRIGGER enforce_break_rule_insert
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
    DECLARE prev_end TIME;
    DECLARE gap_minutes INT;

    IF NEW.event_order > 1 THEN
        -- Get end time of the previous performance
        SELECT end_time INTO prev_end
        FROM performance
        WHERE event_id = NEW.event_id AND event_order = NEW.event_order - 1;
        -- Calculate the gap in minutes
        SET gap_minutes = TIMESTAMPDIFF(MINUTE, prev_end, NEW.start_time);

        --Enforce the break rule (5<break<30)
        IF gap_minutes < 5 OR gap_minutes > 30 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Break between performances must be between 5 and 30 minutes!';
        END IF;
    END IF;
END;
//

-- Enforce 5'<break<30' rule when updating performances
CREATE TRIGGER enforce_break_rule_update
BEFORE UPDATE ON performance
FOR EACH ROW
BEGIN
    DECLARE next_start TIME;
    DECLARE new_end TIME;
    DECLARE gap_minutes INT;

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

       --Enforce the break rule (5<break<30)
       IF next_start IS NOT NULL AND (gap_minutes < 5 OR gap_minutes > 30) THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Break between performances must be between 5 and 30 minutes!';
       END IF;
    END IF;
END;
//

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
END;
//

-- Prevent performer from participating for more than 3 consecutive years
-- Procedure to check consecutive years
CREATE PROCEDURE check_consecutive_years(IN perf_id INT, IN new_year YEAR)
BEGIN
    DECLARE y INT;
    DECLARE prev INT DEFAULT NULL;
    DECLARE consecutive_count INT DEFAULT 1;

    -- Temp table to store years
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_years (
        y YEAR PRIMARY KEY
    );
    DELETE FROM temp_years;

    -- Insert years of performances for the performer
    INSERT INTO temp_years (y)
    SELECT DISTINCT e.year
    FROM performance p
    JOIN event e ON p.event_id = e.event_id
    WHERE p.performer_id = perf_id

    -- Add the new year
    INSERT IGNORE INTO temp_years (y) VALUES (new_year);

    -- Cursor to iterate through the years
    DECLARE year_cursor CURSOR FOR
        SELECT y FROM temp_years ORDER BY y;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET y = NULL;

    OPEN year_cursor;
    read_loop: LOOP
        FETCH year_cursor INTO y;
        IF y IS NULL THEN
            LEAVE read_loop;
        END IF;

        IF prev IS NOT NULL THEN
            IF y = prev + 1 THEN
                SET consecutive_count = consecutive_count + 1;
                IF consecutive_count >= 4 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Performer cannot participate for more than 3 consecutive years!';
                END IF;
            ELSE
                SET consecutive_count = 1;
            END IF;
        END IF;

        SET prev = y;
    END LOOP;
    CLOSE year_cursor;
    DROP TEMPORARY TABLE IF EXISTS temp_years;
END;
//
-- Call procedure before inserting a performance
CREATE TRIGGER check_performer_years_insert
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
    DECLARE ev_year YEAR;

    SELECT year INTO ev_year
    FROM event
    WHERE event_id = NEW.event_id;

    CALL check_consecutive_years(NEW.performer_id, ev_year);
END;
//
-- Call procedure before updating a performance
CREATE TRIGGER check_performer_years_update
BEFORE UPDATE ON performance
FOR EACH ROW
BEGIN
    DECLARE ev_year YEAR;

    IF NEW.performer_id <> OLD.performer_id THEN
        SELECT year INTO ev_year
        FROM event
        WHERE event_id = NEW.event_id;

        CALL check_consecutive_years(NEW.performer_id, ev_year);
    END IF;
END;
//

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
END;
//

-- Each stage can host only one event at a time
CREATE TRIGGER prevent_stage_conflict
BEFORE INSERT ON event
FOR EACH ROW
BEGIN
    DECLARE conflict_exists BOOLEAN DEFAULT FALSE;

    SELECT EXISTS (
        SELECT 1
        FROM event e
        WHERE e.stage_id = NEW.stage_id
        AND e.date = NEW.date
        AND (
            NEW.start_time < e.end_time AND NEW.end_time > e.start_time
        )
    ) INTO conflict_exists;

    IF conflict_exists THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stage is already booked for this time!';
    END IF;
END;
//

-- Festivals can't be cancelled
CREATE TRIGGER prevent_festival_cancellation
BEFORE DELETE ON festival
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Festival cannot be cancelled!';
END;
//

-- Events can't be cancelled
CREATE TRIGGER prevent_event_cancellation
BEFORE DELETE ON event
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Event cannot be cancelled!';
END;
//

