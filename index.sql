-- Sample tournament database contisting of four tables.. teams player coach amd parent
-- create data
CREATE DATABASE tournament;

USE tournament;

-- create the first table

CREATE TABLE TEAM(
    team_id INT NOT NULL,
    team_area VARCHAR(75),
    team_found_year DATE,
    team_trophy INT,
    trophy_year DATE,
    PRIMARY KEY (team_id)
);

-- create the second table and add a foreign key

CREATE TABLE Coach(
    coach_id CHAR(4) NOT NULL,
    coach_fname VARCHAR(75),
    coach_lname VARCHAR(75),
    coach_role  VARCHAR(15),
    coach_trophy_win INT,
    coach_address VARCHAR(50),
    PRIMARY KEY(coach_id),
    team_id INT,
    FOREIGN key(team_id) REFERENCES team(team_id) ON DELETE SET NULL
);

-- create third table and add a foreign key

CREATE TABLE Player(
    player_id CHAR(4) NOT NULL,
    player_fname VARCHAR(75),
    palyer_lname VARCHAR(75),
    player_age INT,
    PRIMARY KEY(player_id),
    team_id INT,
    parent_id INT,
    FOREIGN key(team_id) REFERENCES team(team_id) ON DELETE SET NULL
);



-- ADD Parent_id as a FOREIGN KYE to the Player Table
-- Parent table wasn't created yet so i have ALTER it

ALTER TABLE PLAYER 
ADD FOREIGN KEY(parent_id)
REFERENCES parent(parent_id)
ON DELETE SET NULL;

-- create the final table and add a foreign key

CREATE TABLE Parent(
    parent_id INT NOT NULL,
    parent_fname VARCHAR(75),
    parent_lname VARCHAR(75),
    phone_number CHAR(12),
    PRIMARY KEY(parent_id),
    child_id CHAR(4),
    FOREIGN KEY(child_id) REFERENCES player(player_id) ON DELETE SET NULL
);



-- insert data into tables


-- Team
INSERT INTO Team
VALUES(
		1,
    'West Ham',
    '1997-08-15',
    3,
    '2013-09-15'
);

INSERT INTO Team
VALUES(
		2,
    'Gloden F.C',
    '1993-10-25',
    7,
    '2017-02-12'
);


-- Coach

INSERT INTO coach
VALUES(
  'eb'  ,
  'Ebrima',
  'Bah',
  'Heade coach',
  3,
  'Jam City',
  1
);

INSERT INTO coach
VALUES(
  'es'  ,
  'Eddy',
  'Samba',
  'Heade coach',
  7,
  'Jam City',
  2
);

INSERT INTO coach
VALUES(
  'lj'  ,
  'Lamin',
  'Jarju',
  'Assistant coach',
  3,
  'Jam City',
  1
);


-- Player

INSERT INTO player
VALUES(
    'ej',
    'Ebrima',
    'Jafuneh',
    14,
    1,
    NULL    
);

-- update the foreign key parent_id to the player table

UPDATE player
SET parent_id = 10
WHERE player_id = 'ej';

INSERT INTO player
VALUES(
    'lt',
    'Lamin',
    'Touray',
    18,
    2,
    NULL    
);

-- parent

INSERT INTO Parent
VALUES(
    10,
    'Mariama',
    'Cessay',
    '2345880',
    NULL
);

-- update the foreign key child_id to the coach table

UPDATE parent
SET child_id = 'ej'
WHERE parent_id = 10;