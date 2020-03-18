DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS characters;

CREATE TABLE characters (
  -- ids
  id SERIAL PRIMARY KEY,
  -- core details
  name VARCHAR(255),
  char_class VARCHAR(255),
  level INT,
  race VARCHAR(255),
  background TEXT,
  alignment VARCHAR(255),
  xp_points INT,
  -- core stats
  strength INT,
  dexterity INT,
  constitution INT,
  intelligence INT,
  wisdom INT,
  charisma INT,
  -- other stats
  armour_class INT,
  initiative INT,
  speed INT,
  hp_max INT,
  current_hp INT,
  temp_hp INT,
  total_hit_dice VARCHAR(255),
  current_hit_dice VARCHAR(255),
  death_saves INT,
  -- attacks and spells
  weapons TEXT,
  other_attacks_and_spells TEXT,
  -- equipment
  cp INT,
  sp INT,
  ep INT,
  gp INT,
  pp INT,
  other_equipment TEXT,
  -- skills and proficiencies
  armour_profs TEXT,
  weapon_profs TEXT,
  tool_profs TEXT,
  saving_throw_profs TEXT,
  skill_profs TEXT,
  language_profs TEXT,
  -- features and traits
  personality TEXT,
  ideals TEXT,
  bonds TEXT,
  flaws TEXT,
  features TEXT
);

CREATE TABLE campaigns (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY,
  character_id INT REFERENCES characters(id),
  campaign_id INT REFERENCES campaigns(id)
);
