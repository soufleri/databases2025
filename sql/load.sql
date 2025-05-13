USE pulse_uni;

-- =====================================================
-- Lookup Tables
-- =====================================================
INSERT INTO experience_level (level_id, level_name, level_order) VALUES 
(1, 'Intern', 1),
(2, 'Junior', 2),
(3, 'Intermediate', 3),
(4, 'Senior', 4),
(5, 'Expert', 5);

INSERT INTO staff_role (role_id, role_name) VALUES 
(1, 'Tech Crew'),
(2, 'Security'),
(3, 'Support');

INSERT INTO performance_type (type_id, type_name) VALUES 
(1, 'Opening'),
(2, 'Middle Act'),
(3, 'Headline'),
(4, 'DJ Set');

INSERT INTO ticket_category (category_id, category_name) VALUES
(1, 'VIP'),
(2, 'General Admission'),
(3, 'Early Bird');

INSERT INTO payment_method (method_id, method_name) VALUES
(1, 'Credit Card'),
(2, 'Paypal'),
(3, 'Bank Transfer'),
(4, 'Debit Card'),
(5, 'Google/Apple Pay');

INSERT INTO genre (genre_id, genre_name, parent_genre_id) VALUES
(1, 'Rock', NULL),
(2, 'Pop', NULL),
(3, 'Rap', NULL),
(4, 'EDM', NULL),
(5, 'Jazz', NULL),
(6, 'Metal', 1),
(7, 'R&B', NULL),
(8, 'Blues', NULL),
(9, 'Alternative Rock', 1),
(10, 'Hard Rock', 1),
(11, 'Rock & Roll', 1),
(12, 'Dance Pop', 2),
(13, 'K-Pop', 2),
(14, 'Indie Pop', 2),
(15, 'Trap', 3),
(16, 'Low Bap', 3),
(17, 'Dubstep', 4),
(18, 'House', 4),
(19, 'Techno', 4),
(20, 'Deep House', 18),
(21, 'Synth-pop', 19),
(22, 'Heavy Metal', 6),
(23, 'Thrash Metal', 6),
(24, 'Nu Metal', 6),
(25, 'Chigago Blues', 8);

-- =====================================================================
-- Core Entities
-- =====================================================================
INSERT INTO location (location_id, name, address_street, address_number, address_zip, city, country, continent, latitude, longitude, image, description) VALUES
(1, 'OAKA Stadium', 'Avenue Spyrou Loui', 1, '15123', 'Athens', 'Greece', 'Europe', 37.98, 23.73, 'https://picsum.photos/200/300', 'A large stadium located in the heart of Athens, known for hosting major events.'),
(2, 'Salle Pleyel', 'Rue du Faubourg', 252, '75008', 'Paris', 'France', 'Europe', 48.8773, 2.3005, 'https://picsum.photos/200/300', 'A historic concert hall in Paris, famous for its acoustics and architecture.'),
(3, 'Tokyo Dome City Hall', 'Kasuga-dori', 1, '112-0004', 'Tokyo', 'Japan', 'Asia', 35.7056, 139.7519, 'https://picsum.photos/200/300', 'A multi-purpose indoor arena located in Bunkyo, Tokyo.'),
(4, 'Red Rocks Amphitheatre', 'Red Rocks Park Rd', 18300, '80465', 'Morrison', 'USA', 'North America', 39.6654, -105.2057, 'https://picsum.photos/200/300', 'An open-air amphitheater built into a rock structure, known for its stunning views and acoustics.'),
(5, 'Luna Park', 'Av. Madero', 420, 'C1106', 'Buenos Aires', 'Argentina', 'South America', -34.6026, -58.3704, 'https://picsum.photos/200/300', 'A historic amusement park located in Buenos Aires, known for its iconic rides and attractions.'),
(6, 'Cape Town Stadium', 'Fritz Sonnenberg Rd', 6, '8051', 'Cape Town', 'South Africa', 'Africa', -33.9036, 18.4114, 'https://picsum.photos/200/300', 'A multi-purpose stadium located in Cape Town, known for its modern design and stunning views of Table Mountain.'),
(7, 'Sydney Opera House', 'Bennelong Point', 1, '2000', 'Sydney', 'Australia', 'Oceania', -33.8568, 151.2153, 'https://picsum.photos/200/300', 'An iconic performing arts center located in Sydney, known for its unique architecture and cultural significance.'),
(8, 'Staples Center', 'S Figueroa St', 1111, '90015', 'Los Angeles', 'USA', 'North America', 34.0430, -118.2673, 'https://picsum.photos/200/300', 'A multi-purpose arena located in downtown Los Angeles, known for hosting major sports and entertainment events.'),
(9, 'Wembley Stadium', 'Wembley', 1, 'HA9 0WS', 'London', 'UK', 'Europe', 51.5560, -0.2795, 'https://picsum.photos/200/300', 'A world-renowned stadium located in London, known for its iconic arch and hosting major sporting events.');

INSERT INTO festival (year, location_id, start_date, duration, image, description) VALUES 
(2018, 1, '2018-07-23', 2, 'https://picsum.photos/200/300', 'The early days of Pulse Festival in Athens.'),
(2019, 2, '2019-06-15', 3, 'https://picsum.photos/200/300', 'The first international edition of Pulse Festival in Paris.'),
(2020, 3, '2020-08-10', 2, 'https://picsum.photos/200/300', 'The first edition of Pulse Festival in Asia, COVID didn not stop us'),
(2021, 4, '2021-07-01', 3, 'https://picsum.photos/200/300', 'The first edition of Pulse Festival in the USA.'),
(2022, 5, '2022-06-20', 2, 'https://picsum.photos/200/300', 'The first edition of Pulse Festival in South America.'),
(2023, 6, '2023-08-15', 2, 'https://picsum.photos/200/300', 'The first edition of Pulse Festival in Africa.'),
(2024, 7, '2024-07-01', 3, 'https://picsum.photos/200/300', 'The first edition of Pulse Festival in Oceania.'),
(2025, 1, '2025-06-01', 2, 'https://picsum.photos/200/300', 'Back to our roots in Athens.'),
(2026, 9, '2026-06-01', 2, 'https://picsum.photos/200/300', 'The first edition of Pulse Festival in the UK.'),
(2027, 8, '2027-07-01', 3, 'https://picsum.photos/200/300', 'Back to the USA for the second time.');

INSERT INTO stage (stage_id, year, name, capacity, location_id, image, description) VALUES
-- 2018
(1, 2018, 'Main Stage', 350, 1, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2018, 'Electro Tent', 120, 1, 'https://picsum.photos/200/300', 'Pumping electronic music all night.'),
(3, 2018, 'Rock Zone', 80, 1, 'https://picsum.photos/200/300', 'Rock and metal all day.'),
-- 2019
(1, 2019, 'Main Stage', 500, 2, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2019, 'Acoustic Garden', 200, 2, 'https://picsum.photos/200/300', 'Unplugged sets among the trees.'),
(3, 2019, 'Chill Out Zone', 100, 2, 'https://picsum.photos/200/300', 'Relax and recharge with ambient music.'),
-- 2020
(1, 2020, 'Main Stage', 700, 3, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2020, 'Neon Hall', 500, 3, 'https://picsum.photos/200/300', 'K-pop and J-pop fusion.'),
(3, 2020, 'Indie Stage', 200, 3, 'https://picsum.photos/200/300', 'Indie and alternative music.'),
-- 2021
(1, 2021, 'Main Stage', 800, 4, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2021, 'Hip Hop Arena', 200, 4, 'https://picsum.photos/200/300', 'Hip hop and rap all night.'),
(3, 2021, 'Rock Zone', 150, 4, 'https://picsum.photos/200/300', 'Rock and metal all day.'),
-- 2022
(1, 2022, 'Main Stage', 700, 5, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2022, 'Techno Dome', 300, 5, 'https://picsum.photos/200/300', 'Dark, heavy, immersive sets.'),
(3, 2022, 'Chill Out Zone', 100, 5, 'https://picsum.photos/200/300', 'Relax and recharge with ambient music.'),
-- 2023
(1, 2023, 'Main Stage', 500, 6, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2023, 'Urban Cave', 80, 6, 'https://picsum.photos/200/300', 'Gritty underground hip-hop.'),
(3, 2023, 'Indie Stage', 100, 6, 'https://picsum.photos/200/300', 'Indie and alternative music.'),
-- 2024
(1, 2024, 'Main Stage', 800, 7, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2024, 'Sunset Stage', 300, 7, 'https://picsum.photos/200/300', 'Performances with ocean views.'),
(3, 2024, 'Rave Zone', 200, 7, 'https://picsum.photos/200/300', 'Trance and progressive house.'),
-- 2025
(1, 2025, 'Main Stage', 600, 1, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2025, 'Metal Pit', 600, 1, 'https://picsum.photos/200/300', 'Heavy metal and hard rock.'),
(3, 2025, 'Trance Zone', 60, 1, 'https://picsum.photos/200/300', 'Trance and progressive house.'),
-- 2026
(1, 2026, 'Main Stage', 900, 9, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2026, 'Pop Arena', 500, 9, 'https://picsum.photos/200/300', 'Pop and dance music.'),
(3, 2026, 'Jazz Lounge', 200, 9, 'https://picsum.photos/200/300', 'Smooth jazz and blues.'),
-- 2027
(1, 2027, 'Main Stage', 700, 8, 'https://picsum.photos/200/300', 'The main stage of the festival'),
(2, 2027, 'R&B Lounge', 400, 8, 'https://picsum.photos/200/300', 'Smooth R&B and soul.'),
(3, 2027, 'Blues Stage', 100, 8, 'https://picsum.photos/200/300', 'Classic blues and rock & roll.');

INSERT INTO equipment (equipment_id, name, description, image) VALUES
(1, 'Wireless Microphone Set', 'High-quality UHF microphones for performers and presenters.', 'https://picsum.photos/200/300'),
(2, 'LED Moving Head Lights', 'Programmable moving lights for stage effects.', 'https://picsum.photos/200/300'),
(3, 'Fog Machine', 'Generates atmospheric fog for visual stage impact.', 'https://picsum.photos/200/300'),
(4, 'Stage Monitor Speakers', 'Used by performers to hear themselves on stage.', 'https://picsum.photos/200/300'),
(5, 'Subwoofer Array', 'Low-frequency sound reinforcement for large venues.', 'https://picsum.photos/200/300'),
(6, 'Mixing Console', 'Main audio mixing board for FOH sound engineers.', 'https://picsum.photos/200/300'),
(7, 'Lighting Control Console', 'Controls intelligent lighting systems and effects.', 'https://picsum.photos/200/300'),
(8, 'Power Distribution Rack', 'Ensures reliable power to all stage systems.', 'https://picsum.photos/200/300'),
(9, 'Video Wall Panels', 'Modular high-res LED video panels.', 'https://picsum.photos/200/300'),
(10, 'Projector System', 'Visual projection for background effects or branding.', 'https://picsum.photos/200/300'),
(11, 'Stage Risers', 'Modular platforms to elevate drums and performers.', 'https://picsum.photos/200/300'),
(12, 'Wireless In-Ear Monitors', 'Custom audio monitoring for lead performers.', 'https://picsum.photos/200/300'),
(13, 'Drum Shield', 'Acrylic enclosure to isolate drum sound.', 'https://picsum.photos/200/300'),
(14, 'Digital Snake System', 'Remote audio input/output over CAT5/6.', 'https://picsum.photos/200/300'),
(15, 'Stage Cabling Kit', 'Includes all essential XLR, power, and signal cables.', 'https://picsum.photos/200/300');

-- Tech Crew (64)
insert into staff (full_name,  birth_date, role_id, level_id) values ('Filip Southcomb', '1968-01-26', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Xerxes Tonepohl', '2006-11-14', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Emily Alcoran', '2001-04-11', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Percival Gasquoine', '1986-07-09', 1, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Emmalynne Tomek', '1981-09-25', 1, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Gasparo Scully', '1972-07-19', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Trula Quest', '1984-12-15', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Don Semonin', '2006-03-04', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Mirella Lorriman', '1989-08-01', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Evered Twiddle', '1989-03-22', 1, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Mavis Ferrolli', '2005-05-10', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jayson Mc Grath', '2006-12-08', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jesus Wrightim', '1969-12-21', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Calida Bramelt', '1990-09-19', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Cherise Wintour', '2002-07-03', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Berkley Fawson', '1991-03-05', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Audie Friese', '1982-07-06', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ardelia Weightman', '1980-10-23', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Revkah de Guise', '1980-04-03', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Gilli Claeskens', '2006-07-25', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Dom Hann', '1978-12-16', 1, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Melessa Arstingall', '1966-09-02', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ondrea Haws', '1991-07-12', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Yardley Elles', '1972-08-11', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Madge Lauder', '2006-03-31', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sharai Chart', '1977-03-04', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Stephana Kayzer', '1986-08-10', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Janek Baylie', '1986-10-13', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Amargo Schankel', '2004-02-11', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Phaidra Healks', '2003-06-22', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jeffy Ritchard', '2002-11-03', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Claudina Velareal', '1997-11-05', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Flory Hulance', '1986-05-17', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Royall Kraft', '1999-05-18', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ossie Rook', '1988-06-28', 1, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Thorn Borne', '1993-05-26', 1, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Lacey Lyddy', '1967-06-23', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Timotheus Myers', '2006-01-19', 1, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Eustace Raye', '1969-07-18', 1, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Elijah Di Dello', '1986-01-22', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Lyndsey Lathom', '1988-01-14', 1, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Glen Hutton', '1984-01-14', 1, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Andy Awsome', '2001-09-15', 1, 2);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Nicole Gomez', '1968-09-26', 1, 5);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Matthew Gardner', '1975-07-23', 1, 2);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Sandra Stevenson', '1973-10-09', 1, 4);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Alexis Wolfe', '2006-05-20', 1, 5);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Ryan Oconnell', '1979-09-09', 1, 3);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Amanda Moore', '1978-03-07', 1, 1);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Melissa Griffin', '1980-06-04', 1, 3);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Craig Duncan', '1985-10-16', 1, 3);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Brian Hawkins', '1982-02-12', 1, 2);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Shawn Romero', '1990-12-02', 1, 5);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Theresa Gross', '1984-07-28', 1, 1);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Lindsey Roberts', '2000-05-15', 1, 2);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Anthony Ferguson', '1998-01-06', 1, 2);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Nicholas Turner', '1983-08-24', 1, 5);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Joshua Byrd', '1970-11-21', 1, 3);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Travis Allen', '1986-10-10', 1, 1);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Jessica Guerrero', '1994-07-12', 1, 3);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Lisa Pierce', '1992-02-28', 1, 4);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Jesse Meyer', '1988-06-19', 1, 2);
INSERT INTO staff (full_name, birth_date, role_id, level_id) VALUES ('Richard Evans', '1967-11-04', 1, 4);

-- Security (100)
insert into staff (full_name,  birth_date, role_id, level_id) values ('Damara Lowensohn', '1973-03-30', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Otha Kohen', '1997-06-16', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Goldie Cooke', '1984-02-10', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Herminia Skelhorn', '2004-04-05', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Saxon Ismead', '1977-10-26', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Grove Bestall', '1987-09-03', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Vera Winson', '1993-01-30', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Walliw Zelner', '2006-12-18', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Alaric Adaway', '1970-12-25', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Rina Peppett', '1987-04-29', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sydelle Cargill', '1993-03-26', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ruperta Thandi', '1977-04-11', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Micheal Seedull', '2002-09-11', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Bev Darleston', '1975-10-26', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jere Ambage', '1984-02-09', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Helaina Alforde', '1973-02-03', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Kev VanBrugh', '1999-02-21', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Daisie Gostick', '1970-06-14', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Falito Suller', '1983-05-20', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Carroll Kanwell', '1988-03-30', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Alleyn Hatherill', '1965-04-15', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Adler Bull', '2001-01-02', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Zach Aldritt', '1967-09-15', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Weidar Housecroft', '1967-02-15', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Donall Duiguid', '1989-05-18', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Gris di Rocca', '1973-07-28', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sibbie Hastin', '1992-08-31', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Madella Dumke', '1982-01-14', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Leola Calendar', '1978-08-13', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Louisa Ubank', '2002-09-21', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Cristabel Warrell', '1968-05-27', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Janette Mathonnet', '1966-08-09', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Christophe Phipp', '1990-07-24', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Fernandina Le feuvre', '1982-03-21', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Dom Ruckledge', '1988-11-07', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Isadora Drought', '1998-03-21', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Rusty Nutty', '1980-09-30', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Agna Limmer', '1998-12-20', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Shane Catlette', '1978-11-18', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Cozmo Hughland', '1984-01-22', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Pierette Titman', '1984-05-21', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Reginauld Fleming', '1965-10-06', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Merrill Eddicott', '1997-07-02', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Brietta Wardale', '1994-10-26', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sanders Seth', '1966-01-24', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Winnie Mannock', '1980-08-14', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Shirl Twaits', '1969-08-02', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Niall Rutty', '1969-07-12', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Roldan Yate', '1985-05-20', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ciel Vyvyan', '1989-09-13', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Grantham Kiwitz', '1984-01-07', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Natassia Brandoni', '1983-01-07', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Engracia McKinley', '1970-10-06', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Mehetabel Maddigan', '1988-03-31', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Willa Heiss', '1965-05-12', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Alair Scatcher', '1982-05-11', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Keane Conry', '1978-05-31', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Hadria Pembridge', '1996-01-26', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Marybelle Tour', '1989-03-04', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Elena Dunsmore', '1993-04-07', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Florry Goghin', '1997-10-20', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Zebulen Francis', '1975-02-11', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Constancia Askham', '1973-11-30', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Janetta Ughelli', '1973-10-26', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Alice Danford', '2003-12-07', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Christie Corbitt', '1979-11-30', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Margie Emilien', '1996-06-02', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Shalna Stower', '2002-05-03', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jerad Kinmond', '1991-03-04', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Nicoline Aberdein', '1970-06-26', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Rosana Jackling', '1983-11-30', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Anthia Le Fevre', '1970-12-19', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Constantin Culbert', '1984-06-20', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Carie Haberjam', '1978-01-05', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Chrissy Pomphrett', '1986-03-23', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Quintina Czaple', '2002-03-03', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Lorine Boumphrey', '1971-04-10', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Beverley Hick', '2002-08-14', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Joshuah Kopmann', '2006-09-20', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Elmer Minghi', '1977-11-22', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Salvidor Tivnan', '2002-11-11', 2, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jackson Bramah', '1977-11-03', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Cori Looker', '1994-05-10', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Bridget Hazell', '1978-10-17', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Abran Bohea', '2003-05-16', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Monika Mousley', '1983-09-21', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Keeley De Leek', '1967-10-11', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Cristiano Durden', '2001-02-23', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Stefanie Pebworth', '1981-03-22', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Kelly Reiach', '1981-04-16', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Emilie Lissenden', '1966-05-12', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Delmer Lyosik', '1992-11-29', 2, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Addy Currane', '2005-04-24', 2, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Winni Gianinotti', '1988-06-07', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Giff Bonnavant', '1990-02-03', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Abbie Awmack', '1992-06-09', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Teressa Falla', '1968-06-15', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Dunn Dorsey', '1975-01-10', 2, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Tova Gibbetts', '1967-06-04', 2, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Doralynne Shoveller', '1996-02-06', 2, 1);

-- Support (50)
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jerri Cumming', '1993-04-26', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ema Keeves', '1994-12-21', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Abbot Millberg', '2001-05-20', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Corette MacKenny', '1966-07-16', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Clovis Manuely', '1982-07-20', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Della Thomkins', '1997-03-10', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jacynth Fookes', '1972-09-08', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Demetris Drewry', '1996-06-08', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Grace Suttill', '1987-02-09', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Val Tarn', '1984-11-20', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Larissa McCann', '1980-08-16', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Maurizia Maciunas', '1969-03-13', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Corbie Southwick', '1990-12-04', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Forest Merriment', '1983-11-20', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Langston Castan', '2006-03-08', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Ralina Peotz', '1973-03-07', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Dallas Gosnell', '1988-05-15', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Euell Tolhurst', '1991-10-14', 3, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sheri Exter', '1981-08-01', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Harcourt Tester', '1968-01-24', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Husain Channon', '1965-03-30', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Tybi Dolton', '1973-05-17', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Andrey Duffy', '1976-05-21', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Arvin Dickerson', '1974-09-15', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Felizio Ruslen', '1996-02-13', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Levon Fleming', '1966-11-03', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Alyson Grimsell', '1977-07-01', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jammie Pauluzzi', '1967-06-29', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Roxine Fischer', '1983-03-11', 3, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Juliette Mursell', '1994-05-04', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Weider Curson', '1985-10-22', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Danella Flieger', '1973-12-18', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Desmond Beinke', '1988-06-05', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Worth Mattiello', '1984-03-15', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Thayne Silkston', '1997-04-13', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Shep Keable', '1972-01-31', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Lorant Artingstall', '1977-04-21', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Adamo MacGillivrie', '1976-08-23', 3, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Etty Toghill', '1983-12-30', 3, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Conway Rojas', '1969-08-15', 3, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Letisha Diperaus', '1987-09-28', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Parnell McKinless', '1982-06-16', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Perceval Montier', '1971-07-03', 3, 4);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Gordan Pablos', '1967-12-24', 3, 5);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Boyd Gladstone', '1989-11-03', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Jude Waterstone', '1965-03-09', 3, 2);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sheeree Ransom', '1984-06-13', 3, 3);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Lorenza Shinner', '2003-10-13', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Tristam Clashe', '1974-02-16', 3, 1);
insert into staff (full_name,  birth_date, role_id, level_id) values ('Sal Seedman', '1971-12-27', 3, 3);

-- Visitor (300 + 5 for resale)
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Andronikos', 'Giannousiadis', '2001-09-15', 'elwhatever@ntua.gr', '328-771-0419');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Alexandra', 'Soufleri', '2003-01-01', 'eldontknow@ntua.gr', '312-125-9564');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Babette', 'Baglin', '1971-02-26', 'bbaglin2@pbs.org', '783-157-1704');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lloyd', 'Defraine', '1977-03-21', 'ldefraine3@purevolume.com', '423-880-4134');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Barnebas', 'Di Roberto', '1986-03-20', 'bdiroberto4@over-blog.com', '649-853-7686');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Vinnie', 'Agglione', '1991-05-27', 'vagglione5@sbwire.com', '971-883-6866');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Malissa', 'Carnachen', '2006-07-24', 'mcarnachen6@wunderground.com', '662-706-5966');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Taffy', 'Brugemann', '2004-02-06', 'tbrugemann7@webs.com', '945-686-8646');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ernst', 'Hadny', '2008-03-18', 'ehadny8@infoseek.co.jp', '343-613-0907');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Shelly', 'Dunrige', '1994-06-30', 'sdunrige9@unblog.fr', '383-533-1345');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Callie', 'Jerdein', '1986-06-07', 'cjerdeina@usatoday.com', '863-175-7004');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Orton', 'Jankiewicz', '2006-10-21', 'ojankiewiczb@google.co.uk', '955-996-3379');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Currie', 'Rollins', '1982-11-01', 'crollinsc@sfgate.com', '576-868-0297');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sloane', 'Coplestone', '1990-05-27', 'scoplestoned@typepad.com', '933-402-7756');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Rickert', 'Balderston', '2006-12-07', 'rbalderstone@nba.com', '199-310-3851');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Callida', 'Silcocks', '2008-06-25', 'csilcocksf@biblegateway.com', '840-444-2763');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Chiquita', 'Gostage', '1977-08-01', 'cgostageg@alibaba.com', '653-332-4525');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gerianne', 'Semered', '2005-09-16', 'gsemeredh@qq.com', '950-148-7929');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sven', 'Brewers', '2008-01-10', 'sbrewersi@nhs.uk', '680-549-3376');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bay', 'Adamski', '1989-01-28', 'badamskij@delicious.com', '289-940-4697');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hailey', 'Wolvey', '1988-11-08', 'hwolveyk@1688.com', '539-133-2690');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Carey', 'Grazier', '2003-06-22', 'cgrazierl@paginegialle.it', '373-835-4094');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Burgess', 'O''Curran', '1987-10-18', 'bocurranm@baidu.com', '851-666-8928');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tobit', 'Mocher', '1982-07-21', 'tmochern@unesco.org', '649-629-7510');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dougy', 'Iacovino', '1974-07-07', 'diacovinoo@aol.com', '386-450-2827');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dorene', 'Lyttle', '1991-11-26', 'dlyttlep@ezinearticles.com', '533-420-6894');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Frances', 'Drewry', '1984-01-28', 'fdrewryq@army.mil', '466-902-2439');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Alverta', 'Kibbe', '1970-06-13', 'akibber@google.com.au', '573-914-6814');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Karine', 'Nannoni', '1975-03-15', 'knannonis@devhub.com', '754-377-8587');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lesley', 'Tyrer', '1973-07-28', 'ltyrert@howstuffworks.com', '944-998-2182');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Binky', 'Anthes', '1980-06-08', 'banthesu@google.nl', '639-649-5479');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Otes', 'Antognelli', '1979-11-22', 'oantognelliv@bloomberg.com', '146-479-7949');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Oswald', 'Cousin', '1981-04-19', 'ocousinw@tripadvisor.com', '142-804-3850');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Rolfe', 'McCuffie', '1984-04-28', 'rmccuffiex@earthlink.net', '740-351-6948');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Anatol', 'Gauld', '1972-01-24', 'agauldy@gov.uk', '444-529-6536');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tedd', 'Sheldrick', '1973-07-27', 'tsheldrickz@telegraph.co.uk', '446-597-0184');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sayer', 'Sitford', '1974-06-30', 'ssitford10@nytimes.com', '414-566-5314');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Prudy', 'Pepperrall', '2008-02-04', 'ppepperrall11@pcworld.com', '989-471-5993');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Livvie', 'Andress', '2001-10-20', 'landress12@nsw.gov.au', '515-365-1606');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Rafaellle', 'McCullum', '1983-06-07', 'rmccullum13@dedecms.com', '322-886-9490');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cam', 'Hedden', '1992-02-18', 'chedden14@imgur.com', '137-190-9602');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tansy', 'Towler', '1982-08-30', 'ttowler15@myspace.com', '110-432-7083');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Rebbecca', 'Brimming', '1979-01-04', 'rbrimming16@imgur.com', '395-722-1949');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Rafaellle', 'Odell', '1980-01-31', 'rodell17@npr.org', '404-944-0887');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Pearce', 'Jikylls', '2003-04-12', 'pjikylls18@cocolog-nifty.com', '616-412-3276');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sherm', 'Ionn', '1999-07-29', 'sionn19@wordpress.org', '599-846-5600');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lyndel', 'Stellin', '1973-09-05', 'lstellin1a@businesswire.com', '486-655-7108');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Joelynn', 'Offa', '2001-10-09', 'joffa1b@java.com', '830-765-1238');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Parrnell', 'Giraudoux', '2002-04-05', 'pgiraudoux1c@theatlantic.com', '790-611-7257');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Karlens', 'Ford', '1985-11-18', 'kford1d@yellowbook.com', '205-772-6510');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Merrielle', 'Trimming', '1995-03-02', 'mtrimming1e@slideshare.net', '979-753-7461');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hedi', 'Mistry', '1970-03-28', 'hmistry1f@pinterest.com', '396-547-1867');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jemmie', 'Garrigan', '1995-04-18', 'jgarrigan1g@hao123.com', '156-166-4087');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Peterus', 'Lattie', '1997-04-19', 'plattie1h@uol.com.br', '120-418-9219');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tanney', 'Siely', '2007-10-14', 'tsiely1i@gnu.org', '832-199-1488');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Helen-elizabeth', 'Keates', '1983-12-07', 'hkeates1j@edublogs.org', '667-444-8052');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Parke', 'Spillman', '2009-04-05', 'pspillman1k@amazon.com', '461-314-1135');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bailie', 'Axston', '1984-08-14', 'baxston1l@sbwire.com', '410-670-5817');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Travers', 'Tunny', '1993-12-12', 'ttunny1m@discuz.net', '541-360-9961');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dexter', 'Dunbobin', '2008-01-26', 'ddunbobin1n@patch.com', '799-956-4106');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Anya', 'Birchill', '1989-02-26', 'abirchill1o@yellowpages.com', '972-713-4236');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ryley', 'Winnett', '1992-07-02', 'rwinnett1p@indiatimes.com', '535-742-0188');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dominic', 'Rykert', '1974-03-17', 'drykert1q@friendfeed.com', '883-923-7285');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Inna', 'Grzegorzewski', '1989-09-22', 'igrzegorzewski1r@usnews.com', '437-160-7525');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Fabio', 'Spitell', '1981-09-09', 'fspitell1s@yahoo.com', '559-414-6721');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Johannah', 'Haugeh', '1984-04-11', 'jhaugeh1t@creativecommons.org', '740-554-1197');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dorelle', 'Behnke', '1972-04-30', 'dbehnke1u@bizjournals.com', '114-730-5250');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Marion', 'Morrott', '1974-10-03', 'mmorrott1v@ted.com', '713-157-4319');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jordanna', 'Mabley', '1981-01-11', 'jmabley1w@usa.gov', '944-633-1036');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Carroll', 'Angelini', '1975-04-20', 'cangelini1x@bravesites.com', '732-576-6512');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Skyler', 'Ballchin', '1974-07-14', 'sballchin1y@discuz.net', '438-880-5230');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Giulio', 'Fines', '1996-10-27', 'gfines1z@skyrock.com', '797-148-5127');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sheridan', 'Alberti', '2000-10-29', 'salberti20@arizona.edu', '447-944-0772');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Corbet', 'Arthur', '2001-05-31', 'carthur21@fda.gov', '207-203-0842');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Riki', 'Penna', '2002-07-10', 'rpenna22@infoseek.co.jp', '948-232-9150');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Alverta', 'Juggins', '2006-10-28', 'ajuggins23@adobe.com', '314-142-2056');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Laural', 'Le Ball', '2003-10-14', 'lleball24@who.int', '352-405-3620');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Werner', 'Kempster', '2002-01-05', 'wkempster25@google.pl', '265-832-2315');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hube', 'Andreev', '2002-12-20', 'handreev26@amazon.de', '848-304-3615');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Silvie', 'Twinn', '1997-07-19', 'stwinn27@hhs.gov', '439-956-4490');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Janey', 'Radborn', '2005-05-18', 'jradborn28@constantcontact.com', '727-138-6741');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Heinrik', 'Busher', '2003-09-17', 'hbusher29@exblog.jp', '540-546-3592');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Marlon', 'Allsobrook', '2001-08-24', 'mallsobrook2a@house.gov', '673-480-7792');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Baillie', 'Stolting', '1994-04-23', 'bstolting2b@amazonaws.com', '119-562-5992');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Samaria', 'Cleaver', '1998-08-01', 'scleaver2c@cocolog-nifty.com', '591-637-3406');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ranique', 'Warham', '1972-12-07', 'rwarham2d@adobe.com', '392-455-2834');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Urbano', 'Stairmond', '1978-01-10', 'ustairmond2e@nhs.uk', '662-849-0102');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Meier', 'Littlefair', '1991-03-25', 'mlittlefair2f@answers.com', '650-782-4223');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hermon', 'Housbie', '1979-06-09', 'hhousbie2g@myspace.com', '760-853-8814');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Pembroke', 'Furness', '1984-09-02', 'pfurness2h@github.com', '936-204-6467');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hyacinth', 'Coryndon', '1988-04-17', 'hcoryndon2i@mapquest.com', '193-954-1916');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kristofor', 'Shorto', '1978-06-28', 'kshorto2j@purevolume.com', '553-490-4556');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Davy', 'Curless', '2003-11-29', 'dcurless2k@ameblo.jp', '202-606-5380');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sile', 'Cottisford', '1997-11-17', 'scottisford2l@indiegogo.com', '113-876-8281');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bernita', 'Joskowitz', '1982-12-13', 'bjoskowitz2m@canalblog.com', '309-260-0980');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Onfre', 'Bassill', '1998-08-04', 'obassill2n@howstuffworks.com', '646-993-0451');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Berton', 'Jelf', '2000-05-31', 'bjelf2o@businessweek.com', '678-702-7516');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Durante', 'Berney', '2001-01-22', 'dberney2p@php.net', '818-512-4847');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lian', 'Tether', '1992-02-01', 'ltether2q@squidoo.com', '464-459-5821');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Zita', 'Flintoffe', '2000-01-25', 'zflintoffe2r@netvibes.com', '542-682-1988');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Patsy', 'Nurden', '1998-08-01', 'pnurden2s@cornell.edu', '370-784-9377');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Allyn', 'Sheeres', '2007-01-08', 'asheeres2t@typepad.com', '588-897-9548');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Alyson', 'Reyburn', '2000-05-06', 'areyburn2u@angelfire.com', '554-163-2578');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Eydie', 'Scoyne', '1993-11-09', 'escoyne2v@upenn.edu', '727-978-0499');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Abbie', 'Bradnick', '1995-06-17', 'abradnick2w@hc360.com', '845-579-5472');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Thaxter', 'Choat', '1973-04-22', 'tchoat2x@prnewswire.com', '404-241-9352');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Desiri', 'Adamkiewicz', '2000-08-06', 'dadamkiewicz2y@toplist.cz', '434-255-0351');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bathsheba', 'Sorsbie', '2008-11-05', 'bsorsbie2z@timesonline.co.uk', '893-491-9267');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Nicol', 'Lassell', '1985-01-03', 'nlassell30@senate.gov', '953-324-5236');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Harriot', 'Naylor', '1977-08-08', 'hnaylor31@nba.com', '178-983-3328');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Keriann', 'Kemmett', '1974-11-07', 'kkemmett32@fastcompany.com', '962-531-4912');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Penrod', 'Barabich', '2001-08-12', 'pbarabich33@upenn.edu', '975-604-7089');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lyssa', 'Renak', '2003-11-07', 'lrenak34@independent.co.uk', '720-745-1038');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Marge', 'Danslow', '1999-01-14', 'mdanslow35@com.com', '948-245-4340');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Talya', 'Goodsal', '1998-07-01', 'tgoodsal36@businesswire.com', '924-317-3695');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Edwina', 'Radnage', '2006-02-10', 'eradnage37@merriam-webster.com', '105-967-7379');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cairistiona', 'Breckin', '1983-06-12', 'cbreckin38@europa.eu', '423-170-6459');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Shanda', 'Hullot', '1972-12-18', 'shullot39@uiuc.edu', '822-363-5731');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('April', 'Struttman', '2004-06-17', 'astruttman3a@ucoz.com', '407-423-0090');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cory', 'Cone', '1985-12-28', 'ccone3b@ehow.com', '333-299-9939');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lauritz', 'Ower', '2009-06-11', 'lower3c@trellian.com', '952-722-0836');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ham', 'Peachey', '2006-10-16', 'hpeachey3d@alibaba.com', '233-168-4677');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Alexandr', 'Ginty', '2004-05-05', 'aginty3e@imgur.com', '521-509-3524');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Inez', 'Worsall', '1993-05-19', 'iworsall3f@mysql.com', '575-581-9705');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cassondra', 'Dockrell', '1975-02-26', 'cdockrell3g@blog.com', '535-352-7767');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Leigh', 'Grichukhin', '2005-09-26', 'lgrichukhin3h@netscape.com', '810-674-0819');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Skipper', 'Diable', '1985-01-07', 'sdiable3i@ftc.gov', '682-357-2492');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Mariette', 'Nehl', '1981-11-21', 'mnehl3j@wordpress.com', '426-949-1647');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Shawn', 'Lumsdall', '2003-02-02', 'slumsdall3k@youku.com', '144-813-4204');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Erastus', 'Jumel', '1980-10-29', 'ejumel3l@blogger.com', '785-260-5620');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Richardo', 'Joutapavicius', '1973-01-29', 'rjoutapavicius3m@chron.com', '971-533-1555');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Earvin', 'Johnsey', '1985-02-07', 'ejohnsey3n@prnewswire.com', '457-899-4072');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Margaux', 'Tee', '2005-08-10', 'mtee3o@dell.com', '355-977-9054');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Terrence', 'Ronan', '2001-09-15', 'tronan3p@ovh.net', '888-347-2943');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Fabio', 'Saxon', '1992-05-28', 'fsaxon3q@hc360.com', '117-416-9869');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Konstantine', 'Sayre', '2002-01-13', 'ksayre3r@goodreads.com', '728-431-7851');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Boycie', 'MacPharlain', '1984-05-30', 'bmacpharlain3s@bluehost.com', '755-818-9812');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Constance', 'Pashbee', '1982-01-29', 'cpashbee3t@naver.com', '599-181-7909');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bronnie', 'Feldberger', '2005-09-27', 'bfeldberger3u@shareasale.com', '524-703-7497');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Doy', 'Piddle', '1993-09-12', 'dpiddle3v@sina.com.cn', '106-881-7633');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Analise', 'Dibbin', '1988-01-19', 'adibbin3w@comsenz.com', '694-258-4169');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Merilee', 'Peealess', '1997-04-15', 'mpeealess3x@mozilla.com', '543-762-1620');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Wrennie', 'Lace', '2004-01-05', 'wlace3y@samsung.com', '493-122-4675');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Joey', 'Grishenkov', '2009-04-09', 'jgrishenkov3z@umn.edu', '308-434-6981');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ira', 'Cranfield', '1980-03-16', 'icranfield40@miibeian.gov.cn', '322-498-1478');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Benton', 'McGraffin', '1991-06-08', 'bmcgraffin41@whitehouse.gov', '213-163-4387');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gayler', 'Whitloe', '1983-03-23', 'gwhitloe42@webmd.com', '530-161-9295');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ashlee', 'Coronado', '1970-12-20', 'acoronado43@dedecms.com', '339-559-7761');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Mandel', 'Barkley', '1992-06-02', 'mbarkley44@independent.co.uk', '333-979-2539');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Carlen', 'Brussels', '1985-04-17', 'cbrussels45@nbcnews.com', '993-928-2420');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Mavra', 'Brearley', '2004-05-16', 'mbrearley46@clickbank.net', '729-614-2270');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Pegeen', 'Showl', '1999-03-01', 'pshowl47@soup.io', '251-646-3465');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Terrel', 'Yellop', '1986-11-16', 'tyellop48@sphinn.com', '762-701-5734');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ruby', 'Clemmens', '2004-08-02', 'rclemmens49@microsoft.com', '997-858-5239');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Anne-corinne', 'Stodart', '1996-06-10', 'astodart4a@deviantart.com', '846-916-5403');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gilburt', 'Stinson', '2002-04-17', 'gstinson4b@phpbb.com', '123-967-7533');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jaynell', 'O''Griffin', '1982-10-16', 'jogriffin4c@house.gov', '478-197-0662');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jud', 'Philimore', '1986-05-12', 'jphilimore4d@java.com', '233-266-2282');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Vyky', 'Janak', '2004-02-08', 'vjanak4e@example.com', '961-795-6122');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Shanda', 'Ferres', '1979-02-06', 'sferres4f@skype.com', '694-368-9376');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Peter', 'Coverdale', '2000-02-12', 'pcoverdale4g@opensource.org', '706-637-9652');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lou', 'Utridge', '1985-09-01', 'lutridge4h@linkedin.com', '474-702-6414');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kelly', 'Comer', '1989-08-02', 'kcomer4i@umn.edu', '946-718-3488');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gavrielle', 'Vigne', '1992-08-13', 'gvigne4j@washington.edu', '102-302-4006');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kile', 'Brownfield', '1984-07-04', 'kbrownfield4k@angelfire.com', '665-575-2351');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Issie', 'Clewlow', '1982-01-02', 'iclewlow4l@businessweek.com', '767-138-8118');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kimberley', 'Tweddle', '1986-08-26', 'ktweddle4m@wikimedia.org', '571-764-4130');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Illa', 'Outibridge', '1970-01-02', 'ioutibridge4n@dmoz.org', '167-607-8419');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Mal', 'Streatley', '1978-02-01', 'mstreatley4o@github.io', '982-312-5840');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Heywood', 'Aberdeen', '1991-01-18', 'haberdeen4p@desdev.cn', '251-703-8127');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Brunhilda', 'Ovington', '2008-07-03', 'bovington4q@webnode.com', '142-788-1387');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Christiane', 'Gedney', '1991-03-26', 'cgedney4r@japanpost.jp', '651-781-4688');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Angelle', 'Karczinski', '1974-09-05', 'akarczinski4s@oakley.com', '679-927-6442');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Freddy', 'Brokenbrow', '1985-11-18', 'fbrokenbrow4t@jigsy.com', '770-360-0596');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Conant', 'Orman', '2000-10-17', 'corman4u@google.cn', '313-286-1842');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gustaf', 'Lere', '1986-03-30', 'glere4v@spotify.com', '144-487-9445');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Aleen', 'Balassi', '1997-02-04', 'abalassi4w@youtu.be', '879-500-5625');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Celle', 'Keddie', '1993-12-01', 'ckeddie4x@google.co.jp', '449-797-1125');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tansy', 'De Blase', '1994-03-01', 'tdeblase4y@sphinn.com', '394-118-6164');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kara-lynn', 'MacMeeking', '1974-05-27', 'kmacmeeking4z@paypal.com', '205-556-5830');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Billy', 'McCrainor', '1981-01-21', 'bmccrainor50@cisco.com', '808-142-4118');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Juliette', 'Scoggins', '2005-11-27', 'jscoggins51@google.fr', '472-572-1622');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cherie', 'Fawckner', '1991-06-12', 'cfawckner52@vimeo.com', '802-862-3782');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Arluene', 'Seeger', '1992-03-06', 'aseeger53@va.gov', '875-190-6549');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lucais', 'Vescovo', '1978-05-12', 'lvescovo54@intel.com', '726-934-3515');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Amandi', 'O''Crigan', '1986-03-25', 'aocrigan55@ihg.com', '714-142-8726');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Terrel', 'Bircher', '1993-12-03', 'tbircher56@skyrock.com', '502-216-8540');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Reid', 'Ricciardiello', '2003-02-23', 'rricciardiello57@yelp.com', '449-184-7542');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Janelle', 'Ekless', '1995-05-12', 'jekless58@shop-pro.jp', '604-256-7027');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hailey', 'McCawley', '1977-02-15', 'hmccawley59@ning.com', '240-352-1159');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Vlad', 'Grahlmans', '1970-03-18', 'vgrahlmans5a@wikipedia.org', '114-902-8001');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Arleyne', 'Canti', '1993-01-30', 'acanti5b@usnews.com', '183-173-9853');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jilleen', 'Yepiskopov', '1996-07-17', 'jyepiskopov5c@vimeo.com', '225-141-1344');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Brigitte', 'Priter', '2002-12-02', 'bpriter5d@google.co.jp', '149-568-2716');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Irene', 'Ranklin', '1984-10-10', 'iranklin5e@thetimes.co.uk', '483-289-0906');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gertrud', 'Gowry', '1975-01-19', 'ggowry5f@de.vu', '886-279-0579');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Madelina', 'Sweedy', '1972-04-08', 'msweedy5g@yandex.ru', '323-104-2167');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dal', 'Bandy', '1972-05-04', 'dbandy5h@example.com', '233-391-8178');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Eduardo', 'Placstone', '1993-08-07', 'eplacstone5i@bloglovin.com', '276-582-4152');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Colet', 'Kerne', '1979-10-14', 'ckerne5j@simplemachines.org', '253-399-7886');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Karina', 'Beardsall', '1980-03-18', 'kbeardsall5k@addthis.com', '665-617-0201');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Errick', 'Woolmer', '1980-07-19', 'ewoolmer5l@wix.com', '891-433-4113');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Odie', 'de Courcey', '1999-03-12', 'odecourcey5m@free.fr', '352-127-4931');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Adolphus', 'Dawtre', '1989-01-27', 'adawtre5n@stumbleupon.com', '720-878-3909');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Garrek', 'Pheasant', '1982-03-31', 'gpheasant5o@ucoz.com', '537-273-6211');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cesaro', 'Braiden', '1988-09-15', 'cbraiden5p@de.vu', '873-617-3460');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Shena', 'McCrae', '2008-07-17', 'smccrae5q@prlog.org', '560-660-7085');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dorene', 'Aggus', '1990-07-27', 'daggus5r@odnoklassniki.ru', '685-310-2071');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Brande', 'Oaks', '1982-12-31', 'boaks5s@wordpress.com', '869-923-4713');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Eadmund', 'Killich', '2006-10-31', 'ekillich5t@google.de', '614-719-5401');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hollis', 'McFaell', '1992-02-07', 'hmcfaell5u@a8.net', '416-268-1461');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Victoria', 'Shark', '2008-07-06', 'vshark5v@simplemachines.org', '636-338-3464');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Flor', 'Pavia', '1982-08-28', 'fpavia5w@seesaa.net', '778-218-7290');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Heather', 'MacGragh', '1974-11-26', 'hmacgragh5x@walmart.com', '228-472-7006');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Perceval', 'Kilgallon', '1976-03-11', 'pkilgallon5y@reference.com', '877-362-0429');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ketty', 'Matzke', '2001-04-02', 'kmatzke5z@hp.com', '923-893-1947');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Inez', 'Lundbech', '1981-10-17', 'ilundbech60@columbia.edu', '762-424-4060');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ciel', 'Creamen', '1993-08-11', 'ccreamen61@domainmarket.com', '403-953-0450');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jard', 'Howison', '1986-11-08', 'jhowison62@ca.gov', '822-138-6355');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Seana', 'Hounsom', '2005-04-07', 'shounsom63@imgur.com', '524-111-9085');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sherie', 'Phuprate', '1993-10-20', 'sphuprate64@microsoft.com', '299-906-8583');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lotte', 'Lauritsen', '2001-02-27', 'llauritsen65@aboutads.info', '504-587-0113');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kimble', 'Hallawell', '2004-05-02', 'khallawell66@diigo.com', '205-145-7225');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Judye', 'Stones', '2008-02-03', 'jstones67@sohu.com', '652-972-4794');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Alisun', 'Jouanot', '2002-10-27', 'ajouanot68@altervista.org', '985-793-6479');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kerk', 'Mirando', '1997-05-03', 'kmirando69@boston.com', '705-788-1665');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gallard', 'Durkin', '2004-06-24', 'gdurkin6a@kickstarter.com', '702-368-6591');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jo ann', 'Coulter', '1988-03-28', 'jcoulter6b@blogtalkradio.com', '973-501-9798');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Elmer', 'Peegrem', '1997-02-06', 'epeegrem6c@accuweather.com', '527-832-5472');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Valerye', 'Philpault', '1988-10-02', 'vphilpault6d@independent.co.uk', '102-297-0937');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Idaline', 'Bramo', '1986-04-07', 'ibramo6e@freewebs.com', '113-476-5076');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dulci', 'Jozefowicz', '1976-02-10', 'djozefowicz6f@qq.com', '856-721-7044');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Farrand', 'McElwee', '1983-11-23', 'fmcelwee6g@army.mil', '463-752-1124');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('La verne', 'Leithgoe', '1980-01-15', 'lleithgoe6h@youku.com', '704-233-1377');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Pincus', 'Camillo', '1984-12-20', 'pcamillo6i@ucla.edu', '770-593-5080');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kriste', 'Salomon', '2004-07-22', 'ksalomon6j@microsoft.com', '901-391-9303');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Luciana', 'Calbaithe', '1981-12-23', 'lcalbaithe6k@desdev.cn', '512-494-7327');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Madison', 'Clarkson', '1995-02-11', 'mclarkson6l@skype.com', '191-764-8173');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Hilton', 'Brownrigg', '2001-11-27', 'hbrownrigg6m@tinyurl.com', '786-180-3402');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Malachi', 'Voden', '1971-07-25', 'mvoden6n@chicagotribune.com', '509-194-0186');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Karlis', 'Richings', '1976-03-25', 'krichings6o@twitpic.com', '510-940-6230');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Janelle', 'Albion', '1984-01-17', 'jalbion6p@ustream.tv', '306-559-1866');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Myranda', 'Agge', '1979-12-08', 'magge6q@istockphoto.com', '576-971-8648');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kimball', 'Cogin', '1982-12-05', 'kcogin6r@photobucket.com', '154-825-0889');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Licha', 'Mumbeson', '1976-11-06', 'lmumbeson6s@joomla.org', '979-163-3698');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lilyan', 'Beardshaw', '1994-11-05', 'lbeardshaw6t@g.co', '549-693-9899');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gus', 'Holsall', '1974-05-11', 'gholsall6u@squidoo.com', '429-606-9966');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Forrest', 'Covely', '1976-10-23', 'fcovely6v@exblog.jp', '648-453-6689');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Corrina', 'Sunter', '1989-01-18', 'csunter6w@patch.com', '735-493-6283');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kiersten', 'Gopsell', '1981-05-09', 'kgopsell6x@oracle.com', '993-883-9244');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Layne', 'Rawcliff', '2007-05-05', 'lrawcliff6y@lycos.com', '604-325-5089');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Valentina', 'Rembrant', '1999-09-14', 'vrembrant6z@prnewswire.com', '930-718-5720');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Terrence', 'Dukesbury', '1983-11-29', 'tdukesbury70@usatoday.com', '594-455-3597');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Maurita', 'Whitley', '1977-12-15', 'mwhitley71@google.es', '590-758-9258');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ursulina', 'Bavage', '1974-07-03', 'ubavage72@prweb.com', '597-837-7056');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ettie', 'Bricket', '1971-01-15', 'ebricket73@paginegialle.it', '182-759-5741');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tristan', 'Guierre', '1974-08-17', 'tguierre74@statcounter.com', '943-645-5267');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Inez', 'Asher', '1982-09-23', 'iasher75@nifty.com', '545-579-1986');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Cornie', 'Vaudre', '1976-12-02', 'cvaudre76@apache.org', '568-984-9045');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Danika', 'McCalister', '1982-10-21', 'dmccalister77@mapy.cz', '822-190-4512');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dell', 'Travis', '2007-11-17', 'dtravis78@taobao.com', '555-794-6383');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lela', 'Eddins', '1989-09-04', 'leddins79@google.de', '156-146-8468');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Mike', 'Lippiett', '1994-02-17', 'mlippiett7a@samsung.com', '246-681-5035');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Melodee', 'Bleue', '2005-12-20', 'mbleue7b@usa.gov', '695-679-7200');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Mohandas', 'Bagg', '1970-09-04', 'mbagg7c@intel.com', '865-824-0719');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lily', 'Uzelli', '1979-02-28', 'luzelli7d@cam.ac.uk', '824-332-1252');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kerry', 'Lansberry', '2005-08-26', 'klansberry7e@ed.gov', '592-526-3786');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Rayna', 'Golsworthy', '2003-03-06', 'rgolsworthy7f@123-reg.co.uk', '154-952-6167');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Salem', 'Ostrich', '1973-07-20', 'sostrich7g@shareasale.com', '264-384-9685');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Ban', 'Gitthouse', '2005-09-17', 'bgitthouse7h@marriott.com', '442-197-1356');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Aloise', 'Holme', '1972-05-26', 'aholme7i@webmd.com', '779-249-3679');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gwenette', 'Baseke', '1976-01-17', 'gbaseke7j@tamu.edu', '720-830-4648');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dani', 'Skipperbottom', '1994-07-07', 'dskipperbottom7k@wufoo.com', '516-462-5888');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Issie', 'Spencock', '1987-01-01', 'ispencock7l@comcast.net', '614-525-8355');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Winnie', 'Breem', '1993-09-05', 'wbreem7m@jugem.jp', '630-511-8030');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Emmalee', 'Bruyet', '1975-09-09', 'ebruyet7n@mashable.com', '791-719-2073');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Danit', 'Wareing', '1994-11-13', 'dwareing7o@indiatimes.com', '964-902-3069');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Barbara-anne', 'Jakubovitch', '1988-10-07', 'bjakubovitch7p@arstechnica.com', '389-507-6234');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tamiko', 'Minshaw', '1983-05-28', 'tminshaw7q@theatlantic.com', '509-690-2102');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bernadine', 'Megarrell', '1982-06-25', 'bmegarrell7r@creativecommons.org', '789-785-1146');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Heather', 'Chipperfield', '2008-05-28', 'hchipperfield7s@spotify.com', '971-418-8669');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Filippa', 'Peirson', '1981-03-02', 'fpeirson7t@whitehouse.gov', '775-450-6763');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Giffie', 'Bartholomew', '1997-02-24', 'gbartholomew7u@t.co', '187-814-1433');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Waring', 'Williamson', '1993-05-01', 'wwilliamson7v@discovery.com', '303-385-5919');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Wilfred', 'Keveren', '2002-03-27', 'wkeveren7w@msu.edu', '241-958-8716');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Johnna', 'Seward', '1991-08-29', 'jseward7x@google.com.au', '292-969-9856');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Esta', 'Ibarra', '1980-02-14', 'eibarra7y@woothemes.com', '755-334-4554');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Sapphire', 'Boller', '2005-07-27', 'sboller7z@people.com.cn', '411-280-8217');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Dorena', 'Scholer', '2003-09-08', 'dscholer80@reuters.com', '336-849-2290');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Brier', 'MacIlriach', '1973-05-30', 'bmacilriach81@irs.gov', '809-572-0321');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Marjorie', 'Strange', '2006-12-10', 'mstrange82@photobucket.com', '984-290-3921');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Berton', 'Lansbury', '1997-05-31', 'blansbury83@blogtalkradio.com', '988-120-4867');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Stephan', 'Maddin', '1973-09-21', 'smaddin84@mayoclinic.com', '407-953-7736');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Jenilee', 'Beardsdale', '1985-08-25', 'jbeardsdale85@reverbnation.com', '621-786-0107');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Amelie', 'Hydes', '2003-12-08', 'ahydes86@nba.com', '763-399-1858');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Tadd', 'Gally', '1985-01-01', 'tgally87@amazon.co.jp', '974-619-4179');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Thelma', 'Grisewood', '1975-05-29', 'tgrisewood88@webnode.com', '808-295-5418');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Bria', 'Pomery', '1987-06-09', 'bpomery89@vkontakte.ru', '148-700-1442');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Gwendolin', 'Barks', '2009-05-11', 'gbarks8a@abc.net.au', '633-213-2000');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Klarrisa', 'Smiley', '2006-01-25', 'ksmiley8b@xrea.com', '695-286-1628');
-- Without tickets (for resale requests)
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Warde', 'Earwaker', '1985-08-14', 'wearwaker0@globo.com', '283-901-2991');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Lauren', 'McGeachey', '2002-01-14', 'lmcgeachey1@vinaora.com', '460-527-6354');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Kaye', 'Sibbit', '1995-01-23', 'ksibbit2@networksolutions.com', '245-564-3171');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Riordan', 'Nisbith', '1982-02-26', 'rnisbith3@plala.or.jp', '523-607-0263');
insert into visitor (first_name, last_name, birth_date, email, phone) values ('Micheline', 'Simpson', '1990-01-09', 'msimpson4@usgs.gov', '477-532-0641');


INSERT INTO performer (performer_id, name, image, description, site, instagram) VALUES
(1, 'Corey Taylor', 'https://picsum.photos/200/300', 'Lead singer of Slipknot and Stone Sour.', 'https://coreytaylor.com/', '@coreytaylor'),
(2, 'George Guy', 'https://picsum.photos/200/300', 'American blues guitarist and singer.', 'https://www.buddyguy.net/', '@therealbuddyguy'),
(3, 'Taylor Swift', 'https://picsum.photos/200/300', 'American singer-songwriter.', 'https://www.taylorswift.com/', '@taylorswift'),
(4, 'Kendrick Lamar', 'https://picsum.photos/200/300', 'American rapper and songwriter.', 'https://www.kendricklamar.com/', '@kendricklamar'),
(5, 'David Guetta', 'https://picsum.photos/200/300', 'French DJ and music producer.', 'https://www.davidguetta.com/', '@davidguetta'),
(6, 'Billie Eilish Pirate Baird O"Connell', 'https://picsum.photos/200/300', 'American singer-songwriter.', 'https://www.billieeilish.com/', '@billieeilish'),
(7, 'Dua Lipa', 'https://picsum.photos/200/300', 'British singer-songwriter.', 'https://www.dualipa.com/', '@dualipa'),
(8, 'Abel Makkonen Tesfaye', 'https://picsum.photos/200/300', 'Canadian singer-songwriter.', 'https://www.theweeknd.com/', '@theweeknd'),
(9, 'Austin Richard Post', 'https://picsum.photos/200/300', 'American rapper and singer.', 'https://www.postmalone.com/', '@postmalone'),
(10, 'Kim Min-ji', 'https://picsum.photos/200/300', 'South Korean singer and DJ.', 'https://peggygou.com/', '@peggygou_'),
(11, 'Jeon Jung-kook', 'https://picsum.photos/200/300', 'South Korean singer and member of BTS.', NULL, '@jungkook.97'),
(12, 'Min Yoon-gi', 'https://picsum.photos/200/300', 'South Korean rapper and member of BTS.', NULL, '@agustd'),
(13, 'Christian Martucci', 'https://picsum.photos/200/300', 'American guitarist and member of Stone Sour.', NULL, '@christianmartucci'),
(14, 'Matthew Charles Sanders', 'https://picsum.photos/200/300', 'American singer and songwriter.', NULL, '@m_shadows'),
(15, 'Brian Elwin Haner Jr', 'https://picsum.photos/200/300', 'American guitarist and songwriter.', NULL, '@synyster_gates'),
(16, 'Harry Styles', 'https://picsum.photos/200/300', 'British singer and member of One Direction.', 'https://www.harrystyles.com/', '@harrystyles'),
(17, 'Robyn Rihanna Fenty', 'https://picsum.photos/200/300', 'Barbadian singer and businesswoman.', 'https://www.rihannanow.com/', '@badgalriri'),
(18, 'Ariana Grande', 'https://picsum.photos/200/300', 'American singer and actress.', 'https://www.arianagrande.com/', '@arianagrande'),
(19, 'Thomas Bangalter', 'https://picsum.photos/200/300', 'French DJ and music producer.', NULL, '@thomasbangalter'),
(20, 'Guy-Manuel de Homem-Christo', 'https://picsum.photos/200/300', 'French DJ and music producer.', NULL, '@guymanuel'),
(21, 'Tim Bergling', 'https://picsum.photos/200/300', 'Swedish DJ and music producer.', 'https://www.avicii.com/', '@avicii'),
(22, 'Beyoncé Giselle Knowles-Carter', 'https://picsum.photos/200/300', 'American singer and actress.', 'https://www.beyonce.com/', '@beyonce'),
(23, 'Kanye West', 'https://picsum.photos/200/300', 'American rapper and producer.', 'https://www.kanyewest.com/', '@kanyewest'),
(24, 'Louis Armstrong', 'https://picsum.photos/200/300', 'American trumpeter and singer.', NULL, NULL),
(25, 'Sonny John Moore', 'https://picsum.photos/200/300', 'American DJ and music producer.', 'https://www.skrillex.com/', '@skrillex'),
(26, 'Tash Sultana', 'https://picsum.photos/200/300', 'Australian singer-songwriter', 'https://www.tashsultana.com/', '@tashsultana'),
(27, 'Elizabeth Woolridge Grant', 'https://picsum.photos/200/300', 'American singer-songwriter', 'https://www.lanadelrey.com/', '@lanadelrey'),
(28, 'Michael Mytakidis', 'https://picsum.photos/200/300', 'Greek singer-songwriter', NULL, NULL),
(29, 'Chris Martin', 'https://picsum.photos/200/300', 'British singer and member of Coldplay.', NULL, '@chrismartinfeed'),
(30, 'James Hetfield', 'https://picsum.photos/200/300', 'American singer and member of Metallica.', NULL, '@jameshetfield'),
(31, 'Dave Mustaine', 'https://picsum.photos/200/300', 'American guitarist and member of Megadeth.', NULL, '@davemustaine'),
(32, 'Benito Antonio Martínez Ocasio', 'https://picsum.photos/200/300', 'Puerto Rican rapper and singer.', 'https://www.badbunny.com/', '@badbunnypr'),
(33, 'Dimitris Giannoulis', 'https://picsum.photos/200/300', 'Greek singer-songwriter.', NULL, '@snikthehustla'),
(34, 'Sabrina Carpenter', 'https://picsum.photos/200/300', 'American singer and actress.', 'https://www.sabrinacarpenter.com/', '@sabrinacarpenter'),
(35, 'Joelle Joanie Siwa', 'https://picsum.photos/200/300', 'American singer and dancer.', 'https://www.siwaj.com/', '@itsjojosiwa'),
(36, 'Marshall Bruce Mathers III', 'https://picsum.photos/200/300', 'American rapper and songwriter.', 'https://www.eminem.com/', '@eminem'),

(37, 'Stone Sour', 'https://picsum.photos/200/300', 'American rock band formed in 1992.', 'https://www.stonesour.com/', '@stonesour'),
(38, 'BTS', 'https://picsum.photos/200/300', 'South Korean K-pop band', 'https://ibighit.com/bts/eng/', '@bts.bighitofficial'),
(39, 'Daft Punk', 'https://picsum.photos/200/300', 'French electronic music duo.', 'https://www.daftpunk.com/', '@daftpunk'),
(40, 'Metallica', 'https://picsum.photos/200/300', 'American heavy thrash band.', 'https://www.metallica.com/', '@metallica'),
(41, 'Megadeth', 'https://picsum.photos/200/300', 'American heavy thrash band.', 'https://www.megadeth.com/', '@megadeth'),
(42, 'Coldplay', 'https://picsum.photos/200/300', 'British rock band.', 'https://www.coldplay.com/', '@coldplay'),
(43, 'Nickelodeon', 'https://picsum.photos/200/300', 'Nickelodeon ex actresses', NULL, NULL),
(44, 'NPC Music', 'https://picsum.photos/200/300', 'NPC Music', NULL, NULL),
(45, 'One Direction', 'https://picsum.photos/200/300', 'British pop band.', NULL, '@onedirection'),

(46, 'Cordozar Calvin Broadus Jr', 'https://picsum.photos/200/300', 'American rapper and actor.', 'https://www.snoopdogg.com/', '@snoopdogg'),
(47, 'Adele Laurie Blue Adkins', 'https://picsum.photos/200/300', 'British singer-songwriter.', 'https://www.adele.com/', '@adele'),
(48, 'Benson Boone', 'https://picsum.photos/200/300', 'American singer-songwriter.', 'https://www.bensonboonemusic.com/', '@bensonboone'),
(49, 'Andrew John Hozier-Byrne', 'https://picsum.photos/200/300', 'Irish singer-songwriter.', 'https://www.hozier.com/', '@hozier'),
(50, 'Olivia Rodrigo', 'https://picsum.photos/200/300', 'American singer-songwriter.', 'https://www.oliviarodrigo.com/', '@oliviarodrigo');


INSERT INTO artist (performer_id, stage_name, birth_date) VALUES 
(1, NULL, '1973-12-08'),
(2, 'Buddy Guy', '1936-07-30'),
(3, NULL, '1989-12-13'),
(4, NULL, '1987-06-17'),
(5, NULL, '1967-11-07'),
(6, 'Billie Eilish', '2001-12-18'),
(7, NULL, '1995-08-22'),
(8, 'The Weeknd', '1990-02-16'),
(9, 'Post Malone', '1995-07-04'),
(10, 'Peggy Gou', '1991-07-03'),
(11, 'Jungkook', '1997-09-01'),
(12, 'Agust D', '1993-03-09'),
(13, NULL, '1977-06-05'),
(14, 'M. Shadows', '1981-07-31'),
(15, 'Synyster Gates', '1981-07-07'),
(16, NULL, '1994-02-01'),
(17, 'Rihanna', '1988-02-20'),
(18, NULL, '1993-06-26'),
(19, NULL, '1974-01-03'),
(20, 'Guy-Manuel', '1974-03-08'),
(21, 'Avicii', '1989-09-08'),
(22, 'Beyoncé', '1981-09-04'),
(23, 'Ye', '1977-06-08'),
(24, NULL, '1901-08-04'),
(25, 'Skrillex', '1988-01-15'),
(26, NULL, '1995-06-15'),
(27, 'Lana Del Rey', '1985-06-21'),
(28, 'B.D. Foxmoor', '1967-08-21'),
(29, NULL, '1977-03-02'),
(30, NULL, '1963-08-03'),
(31, NULL, '1961-09-13'),
(32, 'Bad Bunny', '1994-03-10'),
(33, 'Snik', '1993-02-01'),
(34, NULL, '1999-05-11'),
(35, 'JoJo Siwa', '2003-05-19'),
(36, 'Eminem', '1972-10-17'),
(46, 'Snoop Dogg', '1971-10-20'),
(47, 'Adele', '1988-05-05'),
(48, NULL, '2002-06-25'),
(49, 'Hozier', '1990-03-17'),
(50, NULL, '2003-02-18');

INSERT INTO band (performer_id, formation_year) VALUES
(37, 1992),
(38, 2013),
(39, 1993),
(40, 1981),
(41, 1983),
(42, 1996),
(43, 2000),
(44, 2020),
(45, 2010);


-- Relations & Junctions
INSERT INTO artist_band (artist_id, band_id) VALUES 
(1, 37),
(13, 37),

(11, 38),
(12, 38),

(19, 39),
(20, 39),

(30, 40),
(31, 40),

(31, 41),
(35, 41),

(29, 42),
(33, 42),

(34, 43),
(18, 43),

(34, 44),
(3, 44),

(46, 45),
(16, 45);

-- Performer Genres
INSERT INTO performer_genre (performer_id, genre_id) VALUES (1, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (1, 7);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (2, 16);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (3, 13);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (4, 15);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (4, 2);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (5, 1);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (6, 3);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (7, 7);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (7, 18);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (8, 2);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (8, 12);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (9, 14);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (9, 13);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (10, 8);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (10, 9);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (11, 12);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (12, 15);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (13, 10);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (13, 8);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (14, 17);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (15, 16);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (16, 8);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (16, 14);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (17, 14);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (18, 24);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (19, 12);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (20, 17);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (20, 19);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (21, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (21, 24);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (22, 18);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (23, 9);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (24, 4);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (25, 22);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (26, 3);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (27, 16);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (28, 22);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (29, 17);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (30, 7);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (30, 19);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (31, 19);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (32, 3);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (33, 19);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (33, 22);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (34, 23);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (35, 20);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (36, 5);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (36, 17);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (37, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (37, 15);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (38, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (39, 1);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (39, 22);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (40, 24);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (40, 16);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (41, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (41, 20);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (42, 8);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (43, 7);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (44, 4);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (45, 22);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (46, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (46, 11);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (47, 21);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (47, 11);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (48, 6);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (48, 4);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (49, 22);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (50, 19);
INSERT INTO performer_genre (performer_id, genre_id) VALUES (50, 7);

-- Inherit parent genres (not realistic, just an option)
/*
INSERT INTO performer_genre (performer_id, genre_id)
SELECT DISTINCT pg.performer_id, g.parent_genre_id
FROM performer_genre pg
JOIN genre g ON g.genre_id = pg.genre_id
LEFT JOIN performer_genre existing
  ON existing.performer_id = pg.performer_id AND existing.genre_id = g.parent_genre_id
WHERE g.parent_genre_id IS NOT NULL AND existing.performer_id IS NULL;
*/

INSERT INTO stage_equipment (stage_id, year, equipment_id, quantity) VALUES 
(1, 2018, 10, 4),
(1, 2018, 15, 10),
(1, 2018, 8, 3),
(1, 2018, 9, 9),
(1, 2018, 3, 2),
(2, 2018, 6, 3),
(2, 2018, 2, 10),
(2, 2018, 11, 10),
(2, 2018, 10, 2),
(2, 2018, 3, 4),
(2, 2018, 15, 4),
(2, 2018, 7, 7),
(3, 2018, 7, 7),
(3, 2018, 8, 10),
(3, 2018, 2, 8),
(3, 2018, 3, 2),
(3, 2018, 13, 3),
(1, 2019, 2, 2),
(1, 2019, 11, 8),
(1, 2019, 3, 7),
(1, 2019, 12, 2),
(1, 2019, 10, 3),
(1, 2019, 13, 5),
(2, 2019, 10, 10),
(2, 2019, 9, 2),
(2, 2019, 5, 6),
(2, 2019, 8, 3),
(2, 2019, 14, 6),
(3, 2019, 8, 2),
(3, 2019, 15, 4),
(3, 2019, 10, 4),
(3, 2019, 13, 6),
(3, 2019, 9, 2),
(3, 2019, 14, 9),
(1, 2020, 12, 7),
(1, 2020, 3, 5),
(1, 2020, 5, 8),
(1, 2020, 2, 4),
(1, 2020, 15, 2),
(2, 2020, 6, 5),
(2, 2020, 4, 5),
(2, 2020, 3, 5),
(2, 2020, 7, 6),
(2, 2020, 1, 6),
(2, 2020, 9, 4),
(3, 2020, 6, 6),
(3, 2020, 5, 10),
(3, 2020, 2, 3),
(3, 2020, 9, 6),
(3, 2020, 12, 10),
(3, 2020, 3, 10),
(1, 2021, 8, 3),
(1, 2021, 15, 10),
(1, 2021, 6, 10),
(1, 2021, 2, 6),
(1, 2021, 12, 10),
(1, 2021, 14, 4),
(2, 2021, 10, 8),
(2, 2021, 7, 2),
(2, 2021, 1, 5),
(2, 2021, 5, 6),
(2, 2021, 14, 4),
(2, 2021, 15, 9),
(3, 2021, 5, 3),
(3, 2021, 13, 4),
(3, 2021, 2, 10),
(3, 2021, 10, 7),
(3, 2021, 9, 8),
(3, 2021, 12, 4),
(3, 2021, 14, 3),
(1, 2022, 6, 6),
(1, 2022, 3, 10),
(1, 2022, 13, 4),
(1, 2022, 15, 7),
(1, 2022, 2, 6),
(2, 2022, 12, 2),
(2, 2022, 15, 8),
(2, 2022, 7, 10),
(2, 2022, 5, 5),
(2, 2022, 11, 7),
(3, 2022, 11, 6),
(3, 2022, 12, 4),
(3, 2022, 15, 9),
(3, 2022, 8, 5),
(3, 2022, 5, 6),
(3, 2022, 14, 3),
(3, 2022, 9, 3),
(1, 2023, 6, 9),
(1, 2023, 8, 7),
(1, 2023, 15, 8),
(1, 2023, 14, 4),
(1, 2023, 5, 6),
(1, 2023, 7, 2),
(1, 2023, 12, 4),
(2, 2023, 4, 7),
(2, 2023, 12, 9),
(2, 2023, 9, 9),
(2, 2023, 5, 6),
(2, 2023, 2, 4),
(2, 2023, 14, 7),
(2, 2023, 8, 9),
(3, 2023, 4, 10),
(3, 2023, 15, 7),
(3, 2023, 11, 2),
(3, 2023, 10, 4),
(3, 2023, 1, 6),
(1, 2024, 12, 4),
(1, 2024, 14, 8),
(1, 2024, 3, 4),
(1, 2024, 15, 4),
(1, 2024, 6, 3),
(1, 2024, 8, 4),
(1, 2024, 9, 4),
(2, 2024, 10, 3),
(2, 2024, 5, 10),
(2, 2024, 14, 3),
(2, 2024, 4, 3),
(2, 2024, 7, 6),
(2, 2024, 11, 5),
(2, 2024, 8, 4),
(3, 2024, 5, 7),
(3, 2024, 8, 4),
(3, 2024, 3, 7),
(3, 2024, 9, 4),
(3, 2024, 6, 7),
(3, 2024, 4, 6),
(1, 2025, 8, 7),
(1, 2025, 4, 5),
(1, 2025, 9, 2),
(1, 2025, 14, 4),
(1, 2025, 7, 10),
(1, 2025, 13, 10),
(2, 2025, 7, 10),
(2, 2025, 2, 7),
(2, 2025, 6, 3),
(2, 2025, 3, 8),
(2, 2025, 13, 4),
(2, 2025, 1, 10),
(2, 2025, 4, 3),
(3, 2025, 10, 6),
(3, 2025, 7, 2),
(3, 2025, 11, 5),
(3, 2025, 14, 6),
(3, 2025, 9, 4),
(3, 2025, 15, 8),
(1, 2026, 6, 8),
(1, 2026, 5, 9),
(1, 2026, 15, 2),
(1, 2026, 12, 6),
(1, 2026, 4, 6),
(1, 2026, 13, 5),
(1, 2026, 1, 4),
(2, 2026, 1, 3),
(2, 2026, 4, 7),
(2, 2026, 10, 8),
(2, 2026, 11, 5),
(2, 2026, 5, 4),
(3, 2026, 9, 3),
(3, 2026, 2, 10),
(3, 2026, 4, 3),
(3, 2026, 1, 5),
(3, 2026, 5, 10),
(3, 2026, 15, 2),
(1, 2027, 5, 7),
(1, 2027, 13, 3),
(1, 2027, 2, 2),
(1, 2027, 7, 3),
(1, 2027, 8, 6),
(2, 2027, 10, 5),
(2, 2027, 2, 3),
(2, 2027, 13, 8),
(2, 2027, 1, 2),
(2, 2027, 6, 9),
(3, 2027, 14, 9),
(3, 2027, 15, 6),
(3, 2027, 7, 8),
(3, 2027, 12, 6),
(3, 2027, 5, 4),
(3, 2027, 2, 8);

-- Events & Performances
INSERT INTO event (event_id, year, stage_id, date, festival_day, start_time, end_time, num_of_perf, image, description) VALUES 
-- 2018
(1, 2018, 1, '2018-07-23', 1, '19:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(2, 2018, 3, '2018-07-23', 1, '15:45:00', '19:00:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Rock Zone'),

(3, 2018, 1, '2018-07-24', 2, '19:00:00', '23:00:00', 3, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(4, 2018, 2, '2018-07-24', 2, '17:15:00', '19:15:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Electro Tent'),

-- 2019
(5, 2019, 1, '2019-06-15', 1, '18:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(6, 2019, 2, '2019-06-15', 1, '17:00:00', '21:00:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Acoustic Garden'),

(7, 2019, 1, '2019-06-16', 2, '18:30:00', '23:00:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(8, 2019, 3, '2019-06-16', 2, '17:00:00', '19:00:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Chill Out Zone'),

(9, 2019, 1, '2019-06-17', 3, '18:00:00', '23:00:00', 3, 'https://picsum.photos/200/300', 'Day 3 event on Main Stage'),

-- 2020
(10, 2020, 1, '2020-08-10', 1, '18:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(11, 2020, 2, '2020-08-10', 1, '18:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Neon Hall'),

(12, 2020, 1, '2020-08-11', 2, '18:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(13, 2020, 3, '2020-08-11', 2, '18:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on Indie Stage'),

-- 2021
(14, 2021, 1, '2021-07-01', 1, '17:00:00', '23:45:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(15, 2021, 2, '2021-07-01', 1, '15:00:00', '17:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Hip Hop Arena'),
(16, 2021, 3, '2021-07-01', 1, '20:00:00', '23:00:00', 1, 'https://picsum.photos/200/300', 'Day 1 event on Rock Zone'),

(17, 2021, 1, '2021-07-02', 2, '17:00:00', '22:30:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(18, 2021, 2, '2021-07-02', 2, '15:00:00', '17:30:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Hip Hop Arena'),

(19, 2021, 1, '2021-07-03', 3, '17:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 3 event on Main Stage'),
(20, 2021, 3, '2021-07-03', 3, '20:00:00', '23:00:00', 2, 'https://picsum.photos/200/300', 'Day 3 event on Rock Zone'),

-- 2022
(21, 2022, 1, '2022-06-20', 1, '17:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(22, 2022, 3, '2022-06-20', 1, '15:00:00', '17:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Chill Out Zone'),

(23, 2022, 1, '2022-06-21', 2, '17:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(24, 2022, 2, '2022-06-21', 2, '15:00:00', '17:30:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Techno Dome'),

-- 2023
(25, 2023, 1, '2023-08-15', 1, '17:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(26, 2023, 2, '2023-08-15', 1, '15:00:00', '17:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Urban Cave'),

(27, 2023, 1, '2023-08-16', 2, '17:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(28, 2023, 3, '2023-08-16', 2, '15:00:00', '17:30:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Indie Stage'),

-- 2024
(29, 2024, 1, '2024-07-01', 1, '17:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(30, 2024, 2, '2024-07-01', 1, '15:00:00', '17:30:00', 1, 'https://picsum.photos/200/300', 'Day 1 event on Sunset Stage'),

(31, 2024, 1, '2024-07-02', 2, '17:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(32, 2024, 2, '2024-07-02', 2, '15:00:00', '17:30:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Sunset Stage'),

(33, 2024, 1, '2024-07-03', 3, '17:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 3 event on Main Stage'),
(34, 2024, 3, '2024-07-03', 3, '20:00:00', '23:00:00', 1, 'https://picsum.photos/200/300', 'Day 3 event on Rave Zone'),

-- 2025
(35, 2025, 1, '2025-06-01', 1, '17:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(36, 2025, 2, '2025-06-01', 1, '20:00:00', '23:00:00', 1, 'https://picsum.photos/200/300', 'Day 1 event on Metal Pit'),
(37, 2025, 3, '2025-06-01', 1, '15:00:00', '17:00:00', 1, 'https://picsum.photos/200/300', 'Day 1 event on Trance Zone'),

(38, 2025, 1, '2025-06-02', 2, '17:00:00', '23:00:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(39, 2025, 2, '2025-06-02', 2, '20:00:00', '22:00:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Metal Pit'),
(40, 2025, 3, '2025-06-02', 2, '22:00:00', '23:30:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Trance Zone'),

-- 2026
(41, 2026, 1, '2026-06-01', 1, '19:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(42, 2026, 2, '2026-06-01', 1, '19:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Pop Arena'),

(43, 2026, 1, '2026-06-02', 2, '19:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(44, 2026, 3, '2026-06-02', 2, '19:00:00', '21:00:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Jazz Lounge'),

-- 2027
(45, 2027, 1, '2027-07-01', 1, '19:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on Main Stage'),
(46, 2027, 2, '2027-07-01', 1, '20:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 1 event on R&B Lounge'),

(47, 2027, 1, '2027-07-02', 2, '19:00:00', '23:30:00', 3, 'https://picsum.photos/200/300', 'Day 2 event on Main Stage'),
(48, 2027, 2, '2027-07-02', 2, '20:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 2 event on R&B Lounge'),
(49, 2027, 3, '2027-07-02', 2, '19:00:00', '20:00:00', 1, 'https://picsum.photos/200/300', 'Day 2 event on Blues Stage'),

(50, 2027, 1, '2027-07-03', 3, '20:00:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 3 event on Main Stage'),
(51, 2027, 2, '2027-07-03', 3, '19:00:00', '20:30:00', 1, 'https://picsum.photos/200/300', 'Day 3 event on R&B Lounge'),
(52, 2027, 3, '2027-07-03', 3, '20:30:00', '23:30:00', 2, 'https://picsum.photos/200/300', 'Day 3 event on Blues Stage');

INSERT INTO performance (event_id, performer_id, type_id, event_order, start_time, duration) VALUES
-- 2018
(1, 10, 1, 1, '2018-07-23 19:00:00', 60),
(1, 38, 2, 2, '2018-07-23 20:15:00', 90),
(1, 41, 3, 3, '2018-07-23 22:00:00', 90),

(2, 8, 1, 1, '2018-07-23 15:45:00', 60),
(2, 7, 3, 2, '2018-07-23 17:00:00', 110),

(3, 21, 1, 1, '2018-07-24 19:00:00', 60),
(3, 35, 2, 2, '2018-07-24 20:15:00', 60),
(3, 3, 3, 3, '2018-07-24 21:30:00', 90),

(4, 46, 4, 1, '2018-07-24 17:15:00', 120),

-- 2019
(5, 37, 1, 1, '2019-06-15 18:00:00', 60),
(5, 42, 2, 2, '2019-06-15 19:15:00', 90),
(5, 27, 3, 3, '2019-06-15 21:00:00', 120),

(6, 37, 1, 1, '2019-06-15 17:00:00', 60),
(6, 13, 3, 2, '2019-06-15 18:30:00', 150),

(7, 6, 4, 1, '2019-06-16 18:30:00', 90),
(7, 46, 3, 2, '2019-06-16 20:30:00', 150),

(8, 31, 3, 1, '2019-06-16 17:00:00', 120),

(9, 37, 1, 1, '2019-06-17 18:00:00', 60),
(9, 40, 2, 2, '2019-06-17 19:15:00', 90),
(9, 16, 3, 3, '2019-06-17 21:00:00', 120),

-- 2020
(10, 26, 1, 1, '2020-08-10 18:00:00', 120),
(10, 3, 3, 2, '2020-08-10 20:30:00', 150),

(11, 44, 1, 1, '2020-08-10 18:00:00', 120),
(11, 45, 4, 2, '2020-08-10 20:30:00', 150),

(12, 34, 1, 1, '2020-08-11 18:00:00', 60),
(12, 2, 2, 2, '2020-08-11 19:15:00', 90),
(12, 46, 3, 3, '2020-08-11 21:00:00', 120),

(13, 50, 4, 1, '2020-08-11 18:00:00', 120),
(13, 36, 3, 2, '2020-08-11 20:30:00', 150),

-- 2021
(14, 47, 1, 1, '2021-07-01 17:00:00', 120),
(14, 12, 3, 3, '2021-07-01 19:30:00', 180),

(15, 32, 4, 1, '2021-07-01 15:00:00', 60),
(15, 35, 4, 2, '2021-07-01 16:30:00', 60),

(16, 20, 1, 3, '2021-07-01 20:00:00', 180),

(17, 21, 1, 1, '2021-07-02 17:00:00', 150),
(17, 14, 3, 2, '2021-07-02 20:00:00', 120),

(18, 48, 4, 1, '2021-07-02 15:00:00', 150),

(19, 40, 1, 1, '2021-07-03 17:00:00', 90),
(19, 27, 2, 2, '2021-07-03 18:45:00', 90),
(19, 3, 3, 3, '2021-07-03 20:30:00', 180),

(20, 47, 1, 1, '2021-07-03 20:00:00', 60),
(20, 17, 3, 2, '2021-07-03 21:30:00', 90),

-- 2022
(21, 29, 1, 1, '2022-06-20 17:00:00', 90),
(21, 7, 2, 2, '2022-06-20 18:45:00', 90),
(21, 28, 3, 3, '2022-06-20 20:30:00', 180),

(22, 17, 4, 1, '2022-06-20 15:00:00', 45),
(22, 46, 4, 2, '2022-06-20 16:00:00', 90), 

(23, 32, 1, 1, '2022-06-21 17:00:00', 90),
(23, 43, 2, 2, '2022-06-21 18:45:00', 90),
(23, 1, 3, 3, '2022-06-21 20:30:00', 180),

(24, 26, 4, 1, '2022-06-21 15:00:00', 45),
(24, 11, 4, 2, '2022-06-21 16:00:00', 90),

-- 2023
(25, 46, 1, 1, '2023-08-15 17:00:00', 180),
(25, 1, 3, 2, '2023-08-15 20:30:00', 180),

(26, 48, 1, 1, '2023-08-15 15:00:00', 55),
(26, 31, 3, 2, '2023-08-15 16:00:00', 90),

(27, 47, 1, 1, '2023-08-16 17:00:00', 180),
(27, 20, 3, 2, '2023-08-16 20:30:00', 180), 

(28, 50, 3, 1, '2023-08-16 15:00:00', 150),

-- 2024
(29, 33, 1, 1, '2024-07-01 17:00:00', 90),
(29, 35, 2, 2, '2024-07-01 18:45:00', 90),
(29, 46, 3, 3, '2024-07-01 20:30:00', 180),

(30, 1, 3, 1, '2024-07-01 15:00:00', 150),

(31, 33, 1, 1, '2024-07-02 17:00:00', 90),
(31, 39, 2, 2, '2024-07-02 18:45:00', 90),
(31, 44, 3, 3, '2024-07-02 20:30:00', 180),

(32, 48, 3, 1, '2024-07-02 15:00:00', 150),

(33, 33, 1, 1, '2024-07-03 17:00:00', 180),
(33, 32, 3, 2, '2024-07-03 20:30:00', 180),

(34, 24, 3, 1, '2024-07-03 15:00:00', 150),

-- 2025
(35, 47, 1, 1, '2025-06-01 17:00:00', 90),
(35, 14, 2, 2, '2025-06-01 18:45:00', 90),
(35, 20, 3, 3, '2025-06-01 20:30:00', 180),

(36, 2, 3, 1, '2025-06-01 20:00:00', 180),

(37, 31, 4, 1, '2025-06-01 15:00:00', 120),

(38, 45, 1, 1, '2025-06-02 17:00:00', 180),
(38, 4, 3, 2, '2025-06-02 20:30:00', 150),

(39, 39, 3, 1, '2025-06-02 20:00:00', 120),

(40, 40, 4, 1, '2025-06-02 22:00:00', 90),

-- 2026
(41, 34, 1, 1, '2026-06-01 19:00:00', 120),
(41, 49, 3, 2, '2026-06-01 21:30:00', 120),

(42, 22, 1, 1, '2026-06-01 19:00:00', 120),
(42, 4, 3, 2, '2026-06-01 21:30:00', 120),

(43, 24, 1, 1, '2026-06-02 19:00:00', 120),
(43, 47, 3, 2, '2026-06-02 21:30:00', 120),

(44, 30, 4, 1, '2026-06-02 19:00:00', 120),

-- 2027
(45, 50, 1, 1, '2027-07-01 19:00:00', 120),
(45, 49, 3, 2, '2027-07-01 21:30:00', 120),

(46, 45, 1, 1, '2027-07-01 20:00:00', 60),
(46, 16, 3, 2, '2027-07-01 21:30:00', 120),

(47, 50, 1, 1, '2027-07-02 19:00:00', 60),
(47, 40, 2, 2, '2027-07-02 20:15:00', 90),
(47, 44, 3, 3, '2027-07-02 22:00:00', 90),

(48, 30, 1, 1, '2027-07-02 20:00:00', 60),
(48, 35, 3, 2, '2027-07-02 21:30:00', 120),

(49, 4, 3, 1, '2027-07-02 19:00:00', 60),

(50, 50, 1, 1, '2027-07-03 20:00:00', 90),
(50, 6, 3, 2, '2027-07-03 22:00:00', 90),

(51, 11, 4, 1, '2027-07-03 19:00:00', 90),

(52, 24, 1, 1, '2027-07-03 20:30:00', 60),
(52, 42, 3, 2, '2027-07-03 22:00:00', 90);


-- Staff Assignment (event_staff)
CALL assign_staff_for_festival(2018);
CALL assign_staff_for_festival(2019);
CALL assign_staff_for_festival(2020);
CALL assign_staff_for_festival(2021);
CALL assign_staff_for_festival(2022);
CALL assign_staff_for_festival(2023);
CALL assign_staff_for_festival(2024);
CALL assign_staff_for_festival(2025);
CALL assign_staff_for_festival(2026);
CALL assign_staff_for_festival(2027);


-- Ticket Pricing
INSERT INTO ticket_pricing (event_id, category_id, price) VALUES
-- 2018
(1, 1, 100.00), (1, 2, 70.00), (1, 3, 60.00),
(2, 1, 80.00), (2, 2, 60.00), (2, 3, 50.00),
(3, 1, 110.00), (3, 2, 80.00), (3, 3, 70.00),
(4, 1, 60.00), (4, 2, 40.00), (4, 3, 35.00),
-- 2019
(5, 1, 120.00), (5, 2, 80.00), (5, 3, 70.00),
(6, 1, 90.00), (6, 2, 60.00), (6, 3, 50.00),
(7, 1, 100.00), (7, 2, 70.00), (7, 3, 60.00),
(8, 1, 80.00), (8, 2, 50.00), (8, 3, 40.00),
(9, 1, 120.00), (9, 2, 80.00), (9, 3, 70.00),
-- 2020
(10, 1, 100.00), (10, 2, 70.00), (10, 3, 60.00),
(11, 1, 80.00), (11, 2, 60.00), (11, 3, 50.00),
(12, 1, 130.00), (12, 2, 90.00), (12, 3, 80.00),
(13, 1, 90.00), (13, 2, 50.00), (13, 3, 40.00),
-- 2021
(14, 1, 100.00), (14, 2, 70.00), (14, 3, 60.00),
(15, 1, 70.00), (15, 2, 50.00), (15, 3, 40.00),
(16, 1, 80.00), (16, 2, 60.00), (16, 3, 50.00),
(17, 1, 100.00), (17, 2, 70.00), (17, 3, 60.00),
(18, 1, 60.00), (18, 2, 40.00), (18, 3, 35.00),
(19, 1, 130.00), (19, 2, 90.00), (19, 3, 80.00),
(20, 1, 90.00), (20, 2, 60.00), (20, 3, 50.00),
-- 2022
(21, 1, 100.00), (21, 2, 70.00), (21, 3, 60.00),
(22, 1, 80.00), (22, 2, 60.00), (22, 3, 50.00),
(23, 1, 130.00), (23, 2, 90.00), (23, 3, 80.00),
(24, 1, 80.00), (24, 2, 60.00), (24, 3, 50.00),
-- 2023
(25, 1, 110.00), (25, 2, 80.00), (25, 3, 70.00),
(26, 1, 90.00), (26, 2, 60.00), (26, 3, 50.00),
(27, 1, 120.00), (27, 2, 80.00), (27, 3, 70.00),
(28, 1, 80.00), (28, 2, 50.00), (28, 3, 40.00),
-- 2024
(29, 1, 130.00), (29, 2, 90.00), (29, 3, 80.00),
(30, 1, 150.00), (30, 2, 100.00), (30, 3, 90.00),
(31, 1, 130.00), (31, 2, 90.00), (31, 3, 80.00),
(32, 1, 150.00), (32, 2, 100.00), (32, 3, 90.00),
(33, 1, 130.00), (33, 2, 90.00), (33, 3, 80.00),
(34, 1, 150.00), (34, 2, 100.00), (34, 3, 90.00),
-- 2025
(35, 1, 130.00), (35, 2, 90.00), (35, 3, 80.00),
(36, 1, 110.00), (36, 2, 80.00), (36, 3, 70.00),
(37, 1, 70.00), (37, 2, 50.00), (37, 3, 40.00),
(38, 1, 130.00), (38, 2, 90.00), (38, 3, 80.00),
(39, 1, 110.00), (39, 2, 80.00), (39, 3, 70.00),
(40, 1, 100.00), (40, 2, 70.00), (40, 3, 60.00),
-- 2026
(43, 1, 130.00), (43, 2, 90.00), (43, 3, 80.00),
(44, 1, 120.00), (44, 2, 80.00), (44, 3, 70.00),
(45, 1, 130.00), (45, 2, 90.00), (45, 3, 80.00),
(46, 1, 110.00), (46, 2, 70.00), (46, 3, 60.00),
-- 2027
(47, 1, 150.00), (47, 2, 100.00), (47, 3, 90.00),
(48, 1, 90.00), (48, 2, 60.00), (48, 3, 50.00),
(49, 1, 200.00), (49, 2, 140.00), (49, 3, 120.00),
(50, 1, 150.00), (50, 2, 100.00), (50, 3, 90.00),
(51, 1, 90.00), (51, 2, 60.00), (51, 3, 50.00),
(52, 1, 150.00), (52, 2, 100.00), (52, 3, 90.00);

SET @skip_triggers = TRUE;
INSERT INTO ticket (event_id, visitor_id, category_id, purchase_timestamp, payment_method_id, ean_code, is_activated) VALUES
-- 2023 (sold out ev26) id 1-80
(26, 80, 1, '2023-04-01 14:00:00', 1, '1000000000121', TRUE),
(26, 76, 2, '2023-04-02 14:01:00', 2, '1000000000122', TRUE),
(26, 77, 3, '2023-04-03 14:02:00', 3, '1000000000123', TRUE),
(26, 79, 3, '2023-04-01 14:03:00', 4, '1000000000124', TRUE),
(26, 78, 2, '2023-04-02 14:04:00', 5, '1000000000125', TRUE),
(26, 66, 3, '2023-04-03 14:05:00', 1, '1000000000126', TRUE),
(26, 4, 1, '2023-04-01 14:06:00', 2, '1000000000127', TRUE),
(26, 17, 2, '2023-04-02 14:07:00', 3, '1000000000128', TRUE),
(26, 30, 3, '2023-04-03 14:08:00', 4, '1000000000129', TRUE),
(26, 43, 2, '2023-04-01 14:09:00', 5, '1000000000130', TRUE),
(26, 56, 2, '2023-04-02 14:10:00', 1, '1000000000131', TRUE),
(26, 69, 3, '2023-04-03 14:11:00', 2, '1000000000132', TRUE),
(26, 7, 1, '2023-04-01 14:12:00', 3, '1000000000133', TRUE),
(26, 20, 2, '2023-04-02 14:13:00', 4, '1000000000134', TRUE),
(26, 33, 3, '2023-04-03 14:14:00', 5, '1000000000135', TRUE),
(26, 46, 3, '2023-04-01 14:15:00', 1, '1000000000136', TRUE),
(26, 59, 2, '2023-04-02 14:16:00', 2, '1000000000137', TRUE),
(26, 72, 3, '2023-04-03 14:17:00', 3, '1000000000138', TRUE),
(26, 10, 2, '2023-04-01 14:18:00', 4, '1000000000139', TRUE),
(26, 23, 2, '2023-04-02 14:19:00', 5, '1000000000140', TRUE),
(26, 36, 3, '2023-04-03 14:20:00', 1, '1000000000141', TRUE),
(26, 49, 3, '2023-04-01 14:21:00', 2, '1000000000142', TRUE),
(26, 62, 2, '2023-04-02 14:22:00', 3, '1000000000143', TRUE),
(26, 75, 3, '2023-04-03 14:23:00', 4, '1000000000144', TRUE),
(26, 13, 1, '2023-04-01 14:24:00', 5, '1000000000145', TRUE),
(26, 26, 2, '2023-04-02 14:25:00', 1, '1000000000146', TRUE),
(26, 39, 3, '2023-04-03 14:26:00', 2, '1000000000147', TRUE),
(26, 52, 3, '2023-04-01 14:27:00', 3, '1000000000148', TRUE),
(26, 65, 2, '2023-04-02 14:28:00', 4, '1000000000149', TRUE),
(26, 3, 3, '2023-04-03 14:29:00', 5, '1000000000150', TRUE),
(26, 16, 2, '2023-04-01 14:30:00', 1, '1000000000151', TRUE),
(26, 29, 2, '2023-04-02 14:31:00', 2, '1000000000152', TRUE),
(26, 42, 3, '2023-04-03 14:32:00', 3, '1000000000153', TRUE),
(26, 55, 3, '2023-04-01 14:33:00', 4, '1000000000154', TRUE),
(26, 68, 2, '2023-04-02 14:34:00', 5, '1000000000155', TRUE),
(26, 6, 3, '2023-04-03 14:35:00', 1, '1000000000156', TRUE),
(26, 19, 3, '2023-04-01 14:36:00', 2, '1000000000157', TRUE),
(26, 32, 2, '2023-04-02 14:37:00', 3, '1000000000158', TRUE),
(26, 45, 3, '2023-04-03 14:38:00', 4, '1000000000159', TRUE),
(26, 58, 2, '2023-04-01 14:39:00', 5, '1000000000160', TRUE),
(26, 71, 2, '2023-04-02 14:40:00', 1, '1000000000161', TRUE),
(26, 9, 3, '2023-04-03 14:41:00', 2, '1000000000162', TRUE),
(26, 22, 2, '2023-04-01 14:42:00', 3, '1000000000163', TRUE),
(26, 35, 2, '2023-04-02 14:43:00', 4, '1000000000164', TRUE),
(26, 48, 3, '2023-04-03 14:44:00', 5, '1000000000165', TRUE),
(26, 61, 3, '2023-04-01 14:45:00', 1, '1000000000166', TRUE),
(26, 74, 2, '2023-04-02 14:46:00', 2, '1000000000167', TRUE),
(26, 12, 3, '2023-04-03 14:47:00', 3, '1000000000168', TRUE),
(26, 25, 1, '2023-04-01 14:48:00', 4, '1000000000169', TRUE),
(26, 38, 2, '2023-04-02 14:49:00', 5, '1000000000170', TRUE),
(26, 51, 3, '2023-04-03 14:50:00', 1, '1000000000171', TRUE),
(26, 64, 1, '2023-04-01 14:51:00', 2, '1000000000172', TRUE),
(26, 2, 2, '2023-04-02 14:52:00', 3, '1000000000173', TRUE),
(26, 15, 3, '2023-04-03 14:53:00', 4, '1000000000174', TRUE),
(26, 28, 2, '2023-04-01 14:54:00', 5, '1000000000175', TRUE),
(26, 41, 2, '2023-04-02 14:55:00', 1, '1000000000176', TRUE),
(26, 54, 3, '2023-04-03 14:56:00', 2, '1000000000177', FALSE),
(26, 67, 3, '2023-04-01 14:57:00', 3, '1000000000178', FALSE),
(26, 5, 2, '2023-04-02 14:58:00', 4, '1000000000179', FALSE),
(26, 18, 3, '2023-04-03 14:59:00', 5, '1000000000180', TRUE),
(26, 31, 2, '2023-04-01 14:00:00', 1, '1000000000181', TRUE),
(26, 44, 2, '2023-04-02 14:01:00', 2, '1000000000182', TRUE),
(26, 57, 3, '2023-04-03 14:02:00', 3, '1000000000183', TRUE),
(26, 70, 1, '2023-04-01 14:03:00', 4, '1000000000184', TRUE),
(26, 8, 2, '2023-04-02 14:04:00', 5, '1000000000185', TRUE),
(26, 21, 3, '2023-04-03 14:05:00', 1, '1000000000186', TRUE),
(26, 34, 2, '2023-04-01 14:06:00', 2, '1000000000187', TRUE),
(26, 47, 2, '2023-04-02 14:07:00', 3, '1000000000188', TRUE),
(26, 60, 3, '2023-04-03 14:08:00', 4, '1000000000189', FALSE),
(26, 73, 3, '2023-04-01 14:09:00', 5, '1000000000190', TRUE),
(26, 11, 2, '2023-04-02 14:10:00', 1, '1000000000191', TRUE),
(26, 24, 3, '2023-04-03 14:11:00', 2, '1000000000192', TRUE),
(26, 37, 2, '2023-04-01 14:12:00', 3, '1000000000193', TRUE),
(26, 50, 2, '2023-04-02 14:13:00', 4, '1000000000194', TRUE),
(26, 63, 3, '2023-04-03 14:14:00', 5, '1000000000195', TRUE),
(26, 1, 1, '2023-04-01 14:15:00', 1, '1000000000196', TRUE),
(26, 14, 2, '2023-04-02 14:16:00', 2, '1000000000197', FALSE),
(26, 27, 3, '2023-04-03 14:17:00', 3, '1000000000198', TRUE),
(26, 40, 2, '2023-04-01 14:18:00', 4, '1000000000199', TRUE),
(26, 53, 2, '2023-04-02 14:19:00', 5, '1000000000200', TRUE),
-- ev_id 25 id 81-90
(25, 66, 3, '2023-04-03 14:20:00', 1, '1000000000201', TRUE),
(25, 75, 3, '2023-04-03 14:38:00', 4, '1000000000219', TRUE),
(25, 30, 3, '2023-04-03 14:23:00', 4, '1000000000204', TRUE),
(25, 69, 3, '2023-04-03 14:26:00', 2, '1000000000207', TRUE),
(25, 33, 3, '2023-04-03 14:29:00', 5, '1000000000210', TRUE),
(25, 36, 3, '2023-04-03 14:35:00', 1, '1000000000216', TRUE),
(25, 72, 3, '2023-04-03 14:32:00', 3, '1000000000213', TRUE),
(25, 4, 1, '2023-04-01 14:21:00', 5, '1000001000001', TRUE),
(25, 17, 2, '2023-04-02 14:24:00', 1, '1000001000002', TRUE),
(25, 20, 2, '2023-04-02 14:27:00', 4, '1000001000003', TRUE),
-- ev_id 27 id 91-100
(27, 4, 1, '2023-04-01 14:21:00', 2, '1000000000202', TRUE),
(27, 43, 1, '2023-04-01 14:24:00', 5, '1000000000205', TRUE),
(27, 7, 3, '2023-04-01 14:27:00', 3, '1000000000208', TRUE),
(27, 46, 1, '2023-04-01 14:30:00', 1, '1000000000211', TRUE),
(27, 10, 2, '2023-04-01 14:33:00', 4, '1000000000214', TRUE),
(27, 49, 1, '2023-04-01 14:36:00', 2, '1000000000217', TRUE),
(27, 13, 3, '2023-04-01 14:39:00', 5, '1000000000220', FALSE),
(27, 52, 2, '2023-04-01 14:42:00', 1, '1010000000068', TRUE),
(27, 55, 2, '2023-04-01 14:45:00', 2, '1010000000069', TRUE),
(27, 58, 3, '2023-04-01 14:48:00', 3, '1010000000070', TRUE),
-- ev_id 28 id 101-110
(28, 17, 2, '2023-04-02 14:22:00', 3, '1000000000203', TRUE),
(28, 56, 2, '2023-04-02 14:25:00', 1, '1000000000206', TRUE),
(28, 20, 2, '2023-04-02 14:28:00', 4, '1000000000209', TRUE),
(28, 59, 2, '2023-04-02 14:31:00', 2, '1000000000212', TRUE),
(28, 23, 2, '2023-04-02 14:34:00', 5, '1000000000215', TRUE),
(28, 62, 2, '2023-04-02 14:37:00', 3, '1000000000218', TRUE),
(28, 26, 1, '2023-04-02 14:40:00', 1, '1005100000014', TRUE),
(28, 65, 1, '2023-04-02 14:43:00', 2, '1005100000015', TRUE),
(28, 29, 2, '2023-04-02 14:46:00', 4, '1005100000016', TRUE),
(28, 68, 2, '2023-04-02 14:49:00', 5, '1005100000017', TRUE);

-- 2024
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 2, 30, 2, '2024-06-10 00:17:29', 3305504211563, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 3, 144, 3, '2023-08-10 06:45:04', 5346121678526, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 3, 45, 3, '2023-06-05 01:56:00', 6738682481919, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 2, 118, 1, '2024-08-16 17:08:18', 1714736189740, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 2, 260, 4, '2024-07-26 19:32:10', 9684624635231, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 2, 10, 1, '2023-08-15 17:30:57', 6547376488325, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 3, 35, 1, '2024-06-11 00:12:27', 9022279280429, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 1, 153, 3, '2024-04-05 04:27:07', 7773269740558, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 1, 40, 5, '2023-06-15 05:08:46', 3851121115482, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 2, 24, 2, '2023-08-11 07:40:20', 1533516248772, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 2, 83, 1, '2024-02-14 10:30:19', 2630840314280, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 1, 121, 5, '2024-02-23 06:57:52', 2251249273599, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 2, 279, 2, '2023-05-15 21:54:31', 4257783667391, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (32, 1, 224, 4, '2024-12-15 18:21:51', 7810901179851, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 2, 76, 3, '2024-11-19 00:28:08', 4147260911300, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 1, 101, 1, '2023-05-17 10:09:33', 6497490452345, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 1, 292, 4, '2025-02-22 20:33:07', 8167287731585, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 2, 11, 3, '2023-09-27 13:48:27', 3414270975285, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (31, 2, 101, 5, '2024-08-09 06:00:49', 9440402653187, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 1, 192, 5, '2024-06-30 16:43:30', 3291609990329, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (32, 2, 6, 1, '2024-01-12 21:02:45', 7959765841808, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 2, 48, 1, '2024-08-22 21:01:05', 7190655958126, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 2, 8, 4, '2024-06-08 03:29:47', 8360786978331, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 1, 24, 3, '2023-10-22 02:02:06', 6935482804834, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 1, 47, 5, '2023-06-03 16:01:37', 1288070907520, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 2, 212, 4, '2024-07-30 17:32:59', 3643290961363, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 3, 24, 5, '2025-02-25 15:08:40', 4227457230216, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 3, 254, 4, '2024-03-29 01:08:19', 9687203068388, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 3, 59, 3, '2024-12-26 20:45:13', 8648889132162, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 1, 15, 2, '2024-07-21 23:58:48', 9811523470671, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 3, 8, 1, '2023-12-30 10:15:15', 6353569805992, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 1, 203, 2, '2024-06-22 16:15:37', 2680059057363, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 2, 152, 4, '2023-06-21 18:43:15', 5258918359346, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 2, 246, 4, '2025-02-05 06:58:09', 2554510620863, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 3, 278, 1, '2023-12-01 18:22:43', 9922710597274, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 2, 114, 4, '2024-05-11 22:10:49', 9049990777574, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 1, 34, 5, '2024-07-26 22:33:42', 2257665558597, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 1, 281, 5, '2024-02-14 18:37:37', 2378940896104, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (32, 3, 185, 3, '2024-06-29 14:53:42', 9112766218648, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 1, 38, 5, '2024-11-19 12:13:37', 1333230092315, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 3, 192, 5, '2024-10-19 15:18:09', 1348211035626, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 1, 15, 4, '2024-02-16 01:41:56', 3435971443849, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 3, 115, 3, '2024-10-12 16:59:55', 3831911917619, FALSE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (33, 2, 126, 3, '2024-05-02 16:35:46', 7796749736094, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 3, 112, 1, '2025-02-06 02:08:00', 6143178909261, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 2, 184, 1, '2023-10-17 07:50:02', 4114689201637, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 3, 54, 1, '2023-07-30 03:03:36', 8473694539626, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (34, 3, 126, 1, '2024-07-15 05:59:23', 8471192023562, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (30, 2, 138, 2, '2023-05-14 08:19:30', 3198440926597, TRUE);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code, is_activated) VALUES (29, 3, 167, 4, '2024-03-06 11:17:05', 6281797807786, TRUE);

SET @skip_triggers = FALSE;

-- 2025 (sold out event 37)
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 1, 1, '2025-03-20 23:59:59', 1000000000001);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 1, 209, 5, '2025-03-14 14:18:07', 9424126077140);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 41, 4, '2025-03-19 15:14:43', 9241789058912);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 108, 3, '2025-03-13 11:19:06', 8966777884586);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 1, 198, 1, '2025-03-21 02:27:34', 3459378102988);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 240, 1, '2025-03-12 19:05:55', 6073007565760);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 251, 1, '2025-05-05 10:29:27', 7700650015969);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 250, 4, '2025-04-03 22:27:48', 5060451166590);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 1, 48, 3, '2025-03-15 10:15:12', 8385150334221);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 1, 256, 1, '2025-03-12 08:32:53', 5619264282725);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 102, 3, '2025-04-10 03:34:29', 4997995519743);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 1, 248, 4, '2025-04-03 15:12:10', 1724971519097);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 1, 116, 2, '2025-04-22 15:41:25', 1562529833966);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 184, 3, '2025-04-06 04:25:23', 6967666002386);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 86, 5, '2025-03-27 19:52:45', 1634926690220);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 257, 2, '2025-04-02 08:54:29', 1022437604253);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 292, 3, '2025-05-08 20:49:50', 2932100753027);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 274, 1, '2025-03-22 03:16:44', 4528244930064);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 15, 5, '2025-05-05 11:23:02', 3331426587775);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 249, 1, '2025-04-11 13:34:57', 6311601428254);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 285, 5, '2025-04-25 03:39:24', 1037053753110);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 261, 4, '2025-04-14 21:08:52', 9726585268214);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 280, 5, '2025-05-09 21:02:19', 2304796797183);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 199, 1, '2025-04-13 14:23:35', 9202680409472);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 23, 3, '2025-04-12 21:27:20', 9417696652095);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 202, 1, '2025-04-10 23:22:01', 3195011660348);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 299, 1, '2025-04-06 02:17:35', 4225289733263);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 229, 5, '2025-04-21 10:59:38', 2702632557039);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 11, 4, '2025-04-01 03:17:30', 4419929145382);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 126, 1, '2025-04-02 02:01:00', 2292239572614);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 74, 3, '2025-04-24 18:39:46', 9199069246414);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 166, 4, '2025-03-23 08:41:21', 2531261744634);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 259, 4, '2025-03-30 03:01:04', 5389201405652);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 124, 3, '2025-03-25 06:07:34', 9214555383759);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 123, 1, '2025-05-09 04:42:21', 2010380147368);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 265, 5, '2025-03-12 06:47:12', 9229208689576);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 170, 4, '2025-04-18 19:37:57', 1299657003643);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 221, 2, '2025-04-10 06:55:24', 1390955659627);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 298, 3, '2025-04-26 00:03:20', 3963852479868);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 31, 5, '2025-04-17 20:08:55', 7360283926001);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 94, 5, '2025-04-01 02:31:42', 2730633553992);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 60, 1, '2025-03-29 09:01:04', 4037185818877);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 189, 2, '2025-04-29 01:07:06', 6588840202537);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 136, 2, '2025-03-29 09:34:24', 7568390916946);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 21, 3, '2025-04-22 05:16:13', 9888618858679);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 93, 3, '2025-04-06 20:25:59', 7085238078585);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 139, 3, '2025-04-01 03:14:40', 9116198344460);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 81, 3, '2025-04-22 23:40:06', 7871903265799);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 135, 5, '2025-04-01 07:36:13', 6778192245170);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 234, 4, '2025-04-13 01:35:46', 4119118965855);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 140, 5, '2025-04-27 10:19:04', 8475875311994);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 241, 2, '2025-04-10 11:34:17', 4551431200863);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 206, 5, '2025-04-26 10:30:57', 5670613072991);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 44, 4, '2025-03-19 03:26:43', 4365619535546);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 7, 3, '2025-04-30 01:31:11', 5182211786088);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 225, 4, '2025-04-22 15:55:46', 5914549442960);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 66, 2, '2025-05-09 14:08:10', 1846335304861);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 2, 297, 4, '2025-03-21 10:29:23', 3736772857434);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 296, 1, '2025-03-30 13:22:50', 2641986848346);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (37, 3, 47, 5, '2025-03-13 09:43:39', 3967914449655);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 278, 5, '2025-03-18 10:48:44', 8380595104288);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 95, 3, '2025-03-19 03:37:26', 9024359057400);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 148, 3, '2025-03-26 10:57:41', 6406539635211);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 299, 2, '2025-03-23 21:32:34', 1020019686694);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 3, 263, 3, '2025-03-16 20:54:29', 4596585213113);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 82, 1, '2025-04-10 05:09:12', 9399701739090);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 21, 5, '2025-03-17 06:10:12', 4579021526869);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 192, 5, '2025-05-04 10:46:33', 2661301579551);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 91, 2, '2025-03-21 19:29:28', 8819945642762);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 1, 130, 2, '2025-04-06 18:21:23', 1386228036888);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 180, 5, '2025-04-17 18:21:42', 4871672892750);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 150, 5, '2025-03-12 02:04:27', 8153748711253);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 226, 4, '2025-04-01 18:40:07', 1738145815072);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 191, 2, '2025-04-01 06:42:03', 4679343815714);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 234, 2, '2025-05-05 23:20:01', 4223968494503);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 1, 123, 3, '2025-04-30 02:10:11', 3296034143411);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 215, 3, '2025-03-26 23:16:40', 4060618448711);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 246, 5, '2025-03-26 18:13:38', 9409852045453);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 266, 1, '2025-04-19 17:19:12', 6024546168233);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 3, 266, 3, '2025-03-29 13:09:11', 7559940769274);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 157, 3, '2025-04-26 09:54:53', 7642091812242);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 28, 2, '2025-05-03 06:17:39', 6220062748160);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 150, 2, '2025-04-24 22:57:32', 3873125554535);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 218, 1, '2025-03-27 01:11:57', 3496173124355);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 125, 1, '2025-04-25 14:24:58', 3859564817338);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 278, 3, '2025-03-24 13:55:13', 7517020734557);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 155, 2, '2025-05-04 04:45:06', 8027762360577);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 225, 3, '2025-04-02 10:01:53', 9673751332834);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 194, 2, '2025-05-09 15:00:10', 7815690594984);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 3, 171, 3, '2025-03-24 20:54:03', 1273640941616);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 269, 3, '2025-03-28 14:54:21', 7796440477347);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 8, 1, '2025-04-16 04:59:01', 6566449928572);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 27, 5, '2025-04-08 17:59:04', 9785056407553);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 37, 1, '2025-03-30 07:50:42', 5505136422545);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 273, 3, '2025-03-28 05:51:12', 2462408435122);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 3, 274, 1, '2025-04-24 13:38:29', 1553850405194);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 173, 5, '2025-04-02 22:31:02', 4622995897768);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 299, 2, '2025-04-19 20:31:49', 2177382824393);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 293, 2, '2025-04-04 04:57:05', 2506402703367);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 258, 1, '2025-03-21 16:31:31', 3754999607732);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 107, 5, '2025-04-01 13:15:34', 1827626474081);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 263, 5, '2025-04-03 09:21:02', 1081108237773);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 83, 5, '2025-03-23 07:37:59', 3241713681563);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 299, 1, '2025-04-19 07:14:57', 4933073463973);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 73, 5, '2025-03-11 09:58:03', 4729125542566);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 276, 1, '2025-04-09 15:08:43', 5092013334498);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 219, 3, '2025-04-16 07:59:30', 1284787149433);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 3, 187, 5, '2025-04-06 00:20:50', 5560368339867);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 3, 23, 1, '2025-03-24 19:59:49', 6031871830329);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 1, 163, 1, '2025-03-16 02:06:39', 1588657500657);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 57, 3, '2025-04-02 18:14:56', 9421786108143);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 174, 3, '2025-03-23 08:40:27', 4809126541069);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 46, 3, '2025-03-31 20:18:23', 9003000309011);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 235, 4, '2025-03-31 17:55:48', 5983641576338);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 298, 3, '2025-04-30 09:39:51', 4949383691499);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 1, 60, 4, '2025-03-16 11:53:51', 3379724249071);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 4, 1, '2025-03-13 03:44:24', 5810996793367);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 172, 3, '2025-03-22 10:30:22', 4416593608355);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 208, 3, '2025-05-02 00:25:41', 9124676901718);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 82, 3, '2025-03-30 05:50:44', 2871181128477);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 36, 3, '2025-03-22 12:36:01', 6670570161312);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 205, 1, '2025-04-19 18:33:29', 1229966879004);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 13, 4, '2025-04-12 03:18:42', 1943335259207);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 1, 79, 1, '2025-04-23 14:42:28', 9649818804189);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 3, 281, 1, '2025-03-31 17:48:02', 4765194017619);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 30, 4, '2025-03-31 23:06:46', 5493422596258);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 165, 1, '2025-04-23 06:27:20', 1831118156617);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 62, 3, '2025-03-24 10:24:09', 7073624537608);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 3, 1, 2, '2025-04-04 16:32:24', 3628490961144);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 148, 4, '2025-03-31 03:14:34', 7760659153040);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 21, 4, '2025-04-03 09:06:09', 6734508506839);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 217, 2, '2025-03-30 22:08:00', 8639196286836);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 291, 4, '2025-05-09 13:42:40', 7619653162651);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 237, 4, '2025-05-04 20:27:49', 5805707515162);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 200, 5, '2025-03-16 07:15:06', 7626909655481);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 112, 4, '2025-03-18 13:32:13', 2071639939459);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 3, 233, 3, '2025-03-19 20:15:13', 4210956024003);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 1, 200, 2, '2025-04-16 10:23:34', 2278133329828);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 254, 5, '2025-04-02 12:45:15', 2382719225804);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 223, 3, '2025-03-22 05:09:18', 9938031723973);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 30, 1, '2025-03-26 15:24:08', 8363948256578);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 218, 4, '2025-04-25 18:26:41', 5276090782335);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 143, 1, '2025-04-03 20:57:04', 4442415011998);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 282, 1, '2025-04-03 23:26:44', 9983707385106);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 122, 2, '2025-04-28 04:49:58', 4539986300005);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 288, 3, '2025-03-26 20:20:35', 7767501115321);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 197, 1, '2025-04-22 06:34:02', 4612871334125);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 179, 2, '2025-04-22 18:04:16', 9293445100687);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 36, 2, '2025-04-01 23:31:03', 9024257730881);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 116, 4, '2025-03-17 05:58:58', 7393875182677);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 71, 5, '2025-04-09 23:43:34', 3295721245682);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 192, 2, '2025-03-20 07:33:51', 5998659915513);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 172, 4, '2025-04-27 18:38:32', 3172102911818);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 226, 4, '2025-03-27 00:10:29', 9688452767220);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 193, 4, '2025-04-26 04:57:42', 1771635316970);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 209, 3, '2025-04-14 10:00:15', 8848329614178);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 14, 2, '2025-04-25 19:24:05', 8828421489445);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 3, 167, 5, '2025-04-12 06:58:25', 8362332973208);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 273, 3, '2025-03-29 18:54:57', 5351781756594);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 228, 1, '2025-05-02 01:03:06', 6099306991126);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 271, 1, '2025-04-12 19:50:02', 2513868837730);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 253, 5, '2025-04-03 15:58:00', 4002275818780);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 136, 4, '2025-04-21 03:59:54', 5459865133090);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 79, 4, '2025-03-13 15:22:06', 8689929933883);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 94, 3, '2025-04-16 03:48:20', 4567624221087);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 148, 3, '2025-04-24 09:14:18', 8674758395351);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 1, 278, 3, '2025-03-11 02:49:28', 7926324412899);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 1, 240, 1, '2025-03-16 06:51:57', 4696325062362);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 45, 3, '2025-04-28 12:54:19', 2083318369109);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 3, 189, 2, '2025-04-03 22:37:11', 9805146892909);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 132, 4, '2025-04-09 05:54:09', 5331892325883);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 137, 2, '2025-04-17 05:15:57', 3285362446017);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 2, 232, 3, '2025-04-24 04:44:46', 7091675939320);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 1, 211, 1, '2025-04-19 02:38:23', 5034747770210);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 118, 2, '2025-04-29 15:17:50', 7166421884524);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 11, 5, '2025-03-28 14:41:14', 8623995635527);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 27, 3, '2025-04-15 13:14:34', 7073104015987);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 95, 1, '2025-03-13 14:44:14', 4211026302953);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 1, 105, 4, '2025-03-23 13:17:49', 8843056984389);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 162, 5, '2025-03-11 05:55:07', 1024558515468);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 70, 4, '2025-04-02 20:41:38', 7762448154610);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 271, 1, '2025-03-20 20:46:33', 5905928782850);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 51, 1, '2025-04-22 21:01:10', 8646723260755);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 255, 5, '2025-03-18 18:26:41', 8577542674412);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 1, 97, 3, '2025-05-05 21:21:31', 9136019659188);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 135, 1, '2025-05-01 17:10:41', 5854814428967);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 2, 171, 1, '2025-04-16 18:16:34', 3920559476117);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 1, 146, 5, '2025-05-03 03:32:17', 5134244965906);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 180, 5, '2025-05-09 00:38:37', 8200576910592);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 2, 20, 1, '2025-04-13 16:17:58', 4359792248754);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (36, 3, 38, 1, '2025-03-18 04:29:53', 4135458704737);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 267, 5, '2025-04-21 02:27:47', 5004534956209);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 1, 25, 1, '2025-04-29 12:47:54', 7857399985469);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (39, 3, 43, 3, '2025-04-10 00:07:50', 1516815437380);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 9, 1, '2025-03-11 10:51:56', 8846969059194);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 49, 3, '2025-04-28 17:12:57', 6985570026097);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (40, 3, 85, 1, '2025-04-03 10:57:58', 1704143960447);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (35, 2, 23, 4, '2025-03-18 05:10:42', 9546442726003);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 3, 165, 5, '2025-04-14 17:30:43', 1276380477757);
INSERT INTO ticket (event_id, category_id, visitor_id, payment_method_id, purchase_timestamp, ean_code) VALUES (38, 2, 26, 2, '2025-05-06 03:18:30', 6289580396324);


INSERT INTO rating (ticket_id, performance_id, score_performance, score_audio_visual, score_stage_presence, score_organization, score_overall) VALUES
-- 2023
(81, 53, 4, 5, 4, 4, 2),
(82, 53, 4, 3, 4, 5, 3),
(83, 53, 5, 3, 5, 5, 5),
(84, 53, 4, 2, 2, 5, 4),
(85, 53, 4, 4, 5, 4, 4),
(86, 53, 4, 3, 4, 3, 2),
(87, 53, 5, 5, 3, 3, 5),
(88, 53, 2, 3, 4, 4, 5),
(89, 53, 5, 5, 5, 4, 4),
(90, 53, 3, 3, 4, 2, 3),
(81, 54, 4, 2, 4, 4, 4),
(82, 54, 3, 4, 4, 3, 5),
(83, 54, 4, 5, 2, 3, 3),
(84, 54, 5, 5, 5, 4, 5),
(85, 54, 4, 3, 5, 4, 4),
(86, 54, 3, 4, 5, 4, 5),
(87, 54, 5, 3, 4, 5, 5),
(88, 54, 4, 4, 3, 4, 4),
(89, 54, 2, 3, 5, 5, 3),
(90, 54, 5, 5, 5, 4, 4),

(1, 55, 4, 5, 4, 4, 4),
(2, 55, 5, 5, 5, 3, 4),
(3, 55, 3, 5, 4, 2, 4),
(4, 55, 5, 4, 3, 4, 4),
(5, 55, 5, 4, 2, 3, 4),
(6, 55, 4, 5, 4, 2, 5),
(7, 55, 4, 5, 5, 4, 5),
(8, 55, 5, 5, 4, 4, 3),
(9, 55, 5, 5, 5, 4, 4),
(10, 55, 3, 4, 5, 5, 4),
(11, 55, 4, 3, 4, 4, 3),
(12, 55, 5, 2, 3, 4, 4),
(13, 55, 5, 4, 5, 4, 5),
(14, 55, 1, 4, 4, 5, 4),
(15, 55, 4, 4, 5, 4, 4),
(16, 55, 3, 4, 5, 5, 5),
(17, 55, 5, 1, 3, 3, 4),
(18, 55, 5, 4, 3, 5, 5),
(19, 55, 3, 3, 3, 5, 5),
(20, 55, 4, 3, 5, 5, 4),
(21, 55, 4, 4, 3, 4, 4),
(22, 55, 4, 4, 5, 5, 1),
(23, 55, 4, 4, 5, 5, 4),
(24, 55, 5, 4, 5, 5, 4),
(25, 55, 5, 4, 3, 5, 5),
(26, 55, 4, 4, 4, 4, 5),
(27, 55, 4, 5, 5, 4, 4),
(28, 55, 4, 4, 5, 4, 5),
(29, 55, 5, 4, 1, 5, 5),
(30, 55, 2, 2, 4, 1, 5),
(31, 55, 4, 5, 4, 2, 3),
(32, 55, 5, 4, 4, 3, 5),
(33, 55, 3, 5, 4, 2, 2),
(34, 55, 4, 1, 5, 4, 4),
(35, 55, 4, 4, 5, 1, 4),
(36, 55, 3, 5, 5, 2, 1),
(37, 55, 5, 2, 5, 5, 4),
(38, 55, 4, 4, 3, 4, 1),
(39, 55, 5, 5, 3, 4, 3),
(40, 55, 5, 4, 4, 4, 3),
(41, 55, 4, 5, 2, 5, 2),
(42, 55, 3, 4, 5, 5, 3),
(43, 55, 1, 4, 5, 4, 5),
(44, 55, 4, 3, 3, 1, 1),
(45, 55, 5, 5, 5, 3, 5),
(46, 55, 4, 4, 4, 5, 4),
(47, 55, 3, 4, 4, 3, 3),
(48, 55, 4, 2, 5, 5, 3),
(49, 55, 5, 4, 3, 4, 5),
(50, 55, 4, 4, 4, 2, 4),
(51, 55, 3, 4, 3, 4, 2),
(52, 55, 5, 3, 5, 4, 4),
(53, 55, 5, 4, 4, 3, 3),
(54, 55, 5, 5, 5, 5, 4),
(55, 55, 5, 3, 4, 3, 5),
(56, 55, 1, 4, 5, 3, 5),
(60, 55, 4, 3, 1, 4, 5),
(61, 55, 3, 4, 4, 4, 4),
(62, 55, 5, 4, 5, 5, 4),
(63, 55, 3, 3, 4, 4, 2),
(64, 55, 5, 4, 5, 5, 4),
(65, 55, 3, 4, 4, 3, 2),
(66, 55, 4, 3, 4, 3, 5),
(67, 55, 4, 5, 5, 4, 2),
(68, 55, 3, 2, 5, 5, 5),
(70, 55, 4, 3, 5, 5, 4),
(71, 55, 5, 3, 5, 4, 3),
(72, 55, 4, 5, 3, 3, 3),
(73, 55, 4, 5, 4, 5, 5),
(74, 55, 3, 5, 4, 2, 4),
(75, 55, 5, 4, 5, 3, 4),
(76, 55, 4, 5, 3, 2, 5),
(78, 55, 4, 4, 3, 5, 4),
(79, 55, 4, 4, 5, 5, 4),
(80, 55, 5, 3, 1, 5, 3),
(1, 56, 5, 2, 5, 4, 4),
(2, 56, 2, 4, 5, 4, 5),
(3, 56, 4, 5, 5, 4, 3),
(4, 56, 2, 4, 3, 4, 3),
(5, 56, 5, 3, 3, 5, 4),
(6, 56, 5, 5, 2, 4, 5),
(7, 56, 4, 4, 5, 5, 4),
(8, 56, 2, 5, 5, 3, 3),
(9, 56, 3, 1, 3, 5, 1),
(10, 56, 4, 4, 5, 2, 4),
(11, 56, 5, 2, 4, 5, 4),
(12, 56, 5, 4, 5, 5, 4),
(13, 56, 2, 4, 3, 3, 2),
(14, 56, 4, 4, 4, 5, 5),
(15, 56, 4, 5, 4, 2, 2),
(16, 56, 5, 5, 2, 5, 4),
(17, 56, 4, 1, 5, 3, 4),
(18, 56, 3, 4, 5, 5, 4),
(19, 56, 4, 3, 4, 4, 5),
(20, 56, 4, 3, 3, 5, 2),
(21, 56, 3, 1, 3, 4, 5),
(22, 56, 5, 4, 3, 4, 5),
(23, 56, 3, 5, 4, 4, 5),
(24, 56, 5, 4, 1, 5, 3),
(25, 56, 3, 5, 4, 4, 5),
(26, 56, 5, 3, 5, 1, 4),
(27, 56, 3, 5, 3, 2, 2),
(28, 56, 2, 4, 3, 4, 1),
(29, 56, 3, 3, 1, 3, 3),
(30, 56, 4, 4, 5, 5, 3),
(31, 56, 5, 3, 5, 4, 5),
(32, 56, 4, 4, 4, 3, 2),
(33, 56, 5, 3, 3, 5, 5),
(34, 56, 4, 4, 5, 5, 5),
(35, 56, 5, 2, 4, 4, 2),
(36, 56, 5, 5, 4, 4, 3),
(37, 56, 5, 5, 2, 5, 5),
(38, 56, 2, 4, 4, 5, 4),
(39, 56, 4, 3, 4, 2, 3),
(40, 56, 4, 4, 4, 4, 4),
(41, 56, 4, 4, 5, 4, 4),
(42, 56, 5, 5, 3, 4, 4),
(43, 56, 4, 3, 4, 2, 3),
(44, 56, 3, 3, 4, 4, 4),
(45, 56, 4, 3, 3, 3, 5),
(46, 56, 5, 2, 4, 5, 5),
(47, 56, 5, 4, 5, 4, 4),
(48, 56, 4, 5, 5, 1, 5),
(49, 56, 5, 5, 4, 4, 5),
(50, 56, 4, 4, 4, 5, 4),
(51, 56, 4, 5, 3, 1, 5),
(52, 56, 3, 3, 4, 5, 3),
(53, 56, 5, 5, 5, 5, 4),
(54, 56, 4, 5, 5, 3, 4),
(55, 56, 5, 5, 1, 3, 5),
(56, 56, 5, 3, 5, 5, 4),
(60, 56, 5, 4, 5, 4, 5),
(61, 56, 4, 4, 4, 4, 3),
(62, 56, 4, 5, 5, 4, 5),
(63, 56, 4, 4, 4, 3, 4),
(64, 56, 2, 4, 5, 3, 5),
(65, 56, 1, 3, 5, 4, 4),
(66, 56, 4, 4, 4, 4, 4),
(67, 56, 5, 5, 4, 5, 4),
(68, 56, 3, 4, 4, 5, 4),
(70, 56, 5, 3, 5, 4, 5),
(71, 56, 5, 5, 5, 4, 3),
(72, 56, 5, 3, 5, 5, 2),
(73, 56, 4, 4, 5, 4, 2),
(74, 56, 5, 3, 4, 3, 4),
(75, 56, 3, 4, 3, 1, 2),
(76, 56, 5, 4, 4, 5, 5),
(78, 56, 5, 5, 4, 5, 3),
(79, 56, 3, 5, 4, 4, 5),
(80, 56, 2, 4, 1, 4, 4),

(91, 57, 5, 5, 5, 2, 3),
(92, 57, 3, 3, 4, 5, 4),
(93, 57, 2, 4, 3, 2, 3),
(94, 57, 4, 5, 5, 4, 1),
(95, 57, 4, 4, 4, 5, 3),
(96, 57, 4, 4, 1, 4, 4),
(98, 57, 4, 5, 3, 4, 5),
(99, 57, 5, 5, 4, 5, 4),
(100, 57, 2, 4, 2, 4, 4),
(91, 58, 4, 5, 4, 4, 1),
(92, 58, 3, 5, 3, 5, 4),
(93, 58, 5, 3, 3, 5, 5),
(94, 58, 4, 5, 4, 4, 5),
(95, 58, 3, 4, 5, 5, 4),
(96, 58, 5, 3, 5, 3, 4),
(98, 58, 5, 4, 5, 2, 4),
(99, 58, 5, 4, 5, 5, 5),
(100, 58, 4, 4, 4, 4, 5),

(101, 59, 4, 4, 4, 4, 4),
(102, 59, 4, 4, 5, 4, 5),
(103, 59, 5, 1, 4, 4, 4),
(104, 59, 4, 5, 3, 3, 2),
(105, 59, 4, 4, 5, 3, 3),
(106, 59, 5, 5, 4, 2, 2),
(107, 59, 5, 5, 4, 4, 5),
(108, 59, 4, 3, 5, 4, 3),
(109, 59, 4, 4, 4, 5, 3),
(110, 59, 5, 5, 5, 5, 3);

-- 2024
INSERT INTO rating (ticket_id, performance_id, score_performance, score_audio_visual, score_stage_presence, score_organization, score_overall) VALUES
(113, 60, 4, 3, 4, 4, 4),
(116, 60, 5, 5, 4, 5, 5),
(126, 60, 4, 3, 4, 4, 4),
(128, 60, 4, 4, 3, 2, 3),
(135, 60, 4, 4, 3, 4, 4),
(139, 60, 5, 3, 4, 2, 4),
(143, 60, 4, 5, 2, 2, 5),
(151, 60, 4, 5, 4, 4, 1),
(156, 60, 3, 3, 5, 5, 4),
(157, 60, 5, 4, 4, 3, 4),
(160, 60, 5, 4, 3, 5, 5),
(113, 61, 4, 2, 5, 4, 5),
(116, 61, 3, 4, 5, 5, 3),
(126, 61, 3, 5, 3, 3, 4),
(128, 61, 3, 4, 4, 3, 4),
(135, 61, 4, 3, 4, 3, 5),
(139, 61, 4, 5, 4, 5, 3),
(143, 61, 5, 4, 3, 3, 4),
(151, 61, 3, 4, 4, 5, 5),
(156, 61, 5, 4, 5, 3, 3),
(157, 61, 5, 5, 4, 4, 4),
(160, 61, 4, 4, 4, 4, 4),
(113, 62, 4, 5, 4, 4, 4),
(116, 62, 4, 5, 4, 4, 5),
(126, 62, 4, 4, 3, 3, 3),

(111, 63, 1, 3, 5, 4, 1),
(114, 63, 3, 4, 4, 4, 5),
(115, 63, 3, 5, 2, 5, 3),
(118, 63, 4, 4, 3, 3, 3),
(119, 63, 5, 4, 5, 5, 5),
(121, 63, 4, 2, 4, 4, 4),
(134, 63, 3, 4, 5, 5, 5),
(155, 63, 4, 4, 4, 3, 3),
(159, 63, 3, 5, 4, 4, 5),

(124, 67, 2, 5, 3, 4, 4),
(131, 67, 3, 5, 4, 5, 4),
(149, 67, 4, 2, 3, 5, 4),

(120, 68, 3, 5, 3, 4, 4),
(130, 68, 4, 3, 5, 5, 2),
(133, 68, 4, 4, 3, 4, 4),
(136, 68, 5, 4, 4, 4, 4),
(138, 68, 5, 4, 3, 4, 3),
(142, 68, 5, 2, 5, 4, 3),
(145, 68, 4, 5, 3, 4, 2),
(146, 68, 3, 4, 4, 4, 5),
(147, 68, 3, 4, 5, 4, 5),
(152, 68, 5, 4, 5, 5, 4),
(154, 68, 4, 4, 5, 4, 3),
(120, 69, 4, 2, 5, 4, 5),
(130, 69, 5, 2, 5, 5, 4),
(133, 69, 4, 3, 5, 5, 5),
(136, 69, 5, 4, 1, 4, 3),
(138, 69, 2, 3, 4, 3, 3),
(142, 69, 4, 3, 5, 5, 3),
(145, 69, 5, 4, 5, 4, 5),
(146, 69, 5, 3, 5, 2, 5),
(147, 69, 3, 4, 2, 4, 5),
(152, 69, 5, 3, 4, 2, 5),
(154, 69, 4, 3, 4, 5, 4),

(112, 70, 5, 2, 3, 5, 4),
(117, 70, 4, 5, 3, 1, 5),
(122, 70, 5, 4, 5, 5, 5),
(127, 70, 1, 2, 3, 5, 3),
(132, 70, 4, 5, 4, 4, 4),
(141, 70, 5, 4, 4, 4, 5),
(144, 70, 2, 4, 4, 4, 5),
(150, 70, 3, 1, 4, 4, 4),
(158, 70, 4, 5, 5, 2, 4);

/*  (FORMAT FOR TESTING)
-- =============================== Resale System ================================
-- Offers
-- category_id = 1 (VIP)
INSERT INTO resale_offer (ticket_id, visitor_id, offer_timestamp) VALUES (172, 248, '2025-05-09 12:56:00');
INSERT INTO resale_offer (ticket_id, visitor_id, offer_timestamp) VALUES (173, 301, '2025-05-10 10:40:00');
-- category_id = 2 (General Admission)
INSERT INTO resale_offer (ticket_id, visitor_id, offer_timestamp) VALUES (211, 140, '2025-05-10 21:15:00');
INSERT INTO resale_offer (ticket_id, visitor_id, offer_timestamp) VALUES (218, 297, '2025-05-11 14:30:00');
-- category_id = 3 (Early Bird)
INSERT INTO resale_offer (ticket_id, visitor_id, offer_timestamp) VALUES (217, 66, '2025-05-08 18:45:00');
INSERT INTO resale_offer (ticket_id, visitor_id, offer_timestamp) VALUES (219, 296, '2025-05-11 12:00:00');

-- Requests
INSERT INTO resale_request (visitor_id, offer_id, request_timestamp, payment_method_id) VALUES (301, 1, '2025-05-10 17:30:00', 4);
INSERT INTO resale_request (visitor_id, offer_id, request_timestamp, payment_method_id) VALUES (302, 1, '2025-05-11 09:00:00', 5);
-- =========================== OR ================================
INSERT INTO resale_request (visitor_id, event_id, category_id, request_timestamp, payment_method_id) VALUES (303, 37, 2, '2025-05-09 15:45:00', 3);
INSERT INTO resale_request (visitor_id, event_id, category_id, request_timestamp, payment_method_id) VALUES (304, 37, 2, '2025-05-10 11:30:00', 2);
*/