DROP TABLE IF EXISTS core_details;
DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS attacks_and_spells;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS proficiencies;
DROP TABLE IF EXISTS features_and_traits;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS characters;

CREATE TABLE characters (
  id SERIAL PRIMARY KEY
);

CREATE TABLE campaigns (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  campaign_id INT REFERENCES campaign(id)
);

CREATE TABLE core_details (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  name VARCHAR(255),
  class VARCHAR(255),
  level INT,
  race VARCHAR(255),
  background TEXT,
  alignment VARCHAR(255),
  xp_points INT
);

CREATE TABLE stats (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  strength INT,
  dexterity INT,
  constitution INT,
  intelligence INT,
  wisdom INT,
  charisma INT
  armour_class INT,
  initiative INT,
  speed INT,
  hp_max INT,
  current_hp INT,
  temp_hp INT,
  total_hit_dice VARCHAR(255),
  current_hit_dice VARCHAR(255),
  death_saves__successes INT,
  death_saves__failures INT
);

CREATE TABLE attacks_and_spells (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  weapons TEXT,
  other TEXT
);

CREATE TABLE equipment (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  cp INT,
  sp INT,
  ep INT,
  gp INT,
  pp INT,
  other TEXT
);

CREATE TABLE proficiencies (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  armour TEXT,
  weapons TEXT,
  tools TEXT,
  saving_throws TEXT,
  skills TEXT,
  languages TEXT
);

CREATE TABLE features_and_traits (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  personality TEXT,
  ideals TEXT,
  bonds TEXT,
  flaws TEXT
);
