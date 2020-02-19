DROP TABLE IF EXISTS ticket_general;

CREATE TABLE ticket_general (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    tribe_name VARCHAR(255),
    coordinates VARCHAR(255),
    issue VARCHAR(255),
    resolution VARCHAR(255)
);

DROP TABLE IF EXISTS element_event;

CREATE TABLE element_event (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    event_name VARCHAR(255),
    serverid_dropoff INT,
    patreon_status VARCHAR(5),
    element_dropoff_location VARCHAR(255)

);

DROP TABLE IF EXISTS element_transfer;

CREATE TABLE element_transfer (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    transfer_amount INT,
    serverid_pickup INT,
    server_pickup_location VARCHAR(255),
    serverid_dropoff INT,
    server_dropoff_location VARCHAR(255)

);

DROP TABLE IF EXISTS patreon_dino_request;

CREATE TABLE patreon_dino_request (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    serverid_dropoff INT,
    dino_name VARCHAR(255),
    colored VARCHAR(5),
    region0 VARCHAR(5),
    region1 VARCHAR(5),
    region2 VARCHAR(5),
    region3 VARCHAR(5),
    region4 VARCHAR(5),
    region5 VARCHAR(5),
    sex VARCHAR(7),
    server_dropoff_location VARCHAR(255),
    email_address VARCHAR(255)
);

DROP TABLE IF EXISTS patreon_dino_insurance;

CREATE TABLE patreon_dino_insurance (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    dino_link VARCHAR(255),
    email_address VARCHAR(255),
    month_claimed VARCHAR(255),
    explanation TEXT
);

DROP TABLE IF EXISTS ban_appeal;

CREATE TABLE ban_appeal (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    steam_id VARCHAR(255),
    email_address VARCHAR(255),
    banned_reason TEXT,
    unban_reason TEXT
);

DROP TABLE IF EXISTS bug_report;

CREATE TABLE bug_report (
    id SERIAL PRIMARY KEY,
    ign VARCHAR(255),
    discord_name VARCHAR(255),
    discord_id VARCHAR(255),
    server_assistance INT,
    status VARCHAR(7),
    issue TEXT,
    recreate TEXT,
    lost_items TEXT
);