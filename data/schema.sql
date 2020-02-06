DROP TABLE IF EXISTS tickets;

CREATE TABLE tickets (
    --General
    username VARCHAR(255),
    discordName VARCHAR(255),
    serverAssistance INT,
    ticketType VARCHAR(255),

    --ElementRequest


    --Ban Appeal
    banAppealSteamID VARCHAR(255),
    banAppealEmailAddress VARCHAR(255),
    banAppealBannecReason TEXT,
    banAppealUnbannedReason TEXT


);