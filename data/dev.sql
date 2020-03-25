CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE tickets (
    -- standard across every ticket
    id uuid,
    incrementer SERIAL,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance VARCHAR(255),
    status VARCHAR(20),
    time_to_contact VARCHAR(255),
    type_of_ticket VARCHAR(255),
    submitted_on VARCHAR(20),
    accepted_on VARCHAR(20),
    accepted_by VARCHAR(255),
    closed_by VARCHAR(255),
    closed_on VARCHAR(20),
    -- general ticket
    gen_tribe_name VARCHAR(255),
    gen_coordinates VARCHAR(255),
    gen_issue TEXT,
    gen_resolution TEXT,
    -- element from event
    event_name VARCHAR(255),
    event_serverid_dropoff VARCHAR(255),
    event_patreon_status VARCHAR(5),
    event_element_dropoff_location VARCHAR(255),
    -- element transfer
    transfer_amount INT,
    transfer_serverid_pickup VARCHAR(255),
    transfer_server_pickup_location VARCHAR(255),
    transfer_serverid_dropoff VARCHAR(255),
    transfer_server_dropoff_location VARCHAR(255),
    -- patreon dino request
    request_serverid_dropoff VARCHAR(255),
    request_dino_name VARCHAR(255),
    request_colored VARCHAR(5),
    request_region0 VARCHAR(5),
    request_region1 VARCHAR(5),
    request_region2 VARCHAR(5),
    request_region3 VARCHAR(5),
    request_region4 VARCHAR(5),
    request_region5 VARCHAR(5),
    request_sex VARCHAR(7),
    request_server_dropoff_location VARCHAR(255),
    request_email_address VARCHAR(255),
    -- patreon insurance request
    insurance_dino_link VARCHAR(255),
    insurance_email_address VARCHAR(255),
    insurance_month_claimed VARCHAR(255),
    insurance_explanation TEXT,
    -- ban appeal
    ban_steam_id VARCHAR(255),
    ban_email_address VARCHAR(255),
    ban_banned_reason TEXT,
    ban_unban_reason TEXT,
    -- bug report
    bug_issue TEXT,
    bug_recreate TEXT,
    bug_lost_items TEXT,
    -- anonymous
    anonymous_description TEXT
)