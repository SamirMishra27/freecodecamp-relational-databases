-- Table creation commands.

CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  total_planets VARCHAR(255) NOT NULL,
  total_stars VARCHAR(255) NOT NULL,
  description TEXT
);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  size_in_km_mn NUMERIC NOT NULL, -- Unconstrained numeric
  temperature_in_celsius BIGINT,
  planets_orbiting_it INT,
  galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  size_in_km_mn NUMERIC NOT NULL, -- Unconstrained numeric
  total_moons INT,
  water_available BOOLEAN,
  temperature_in_celsius BIGINT,
  state_code VARCHAR(32) REFERENCES state(state_code),
  star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  size_in_km_mn NUMERIC NOT NULL, -- Unconstrained numeric
  orbit_period_days NUMERIC,
  explored BOOLEAN,
  planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE state(
  state_id SERIAL PRIMARY KEY,
  state_code VARCHAR(255) UNIQUE NOT NULL
  name VARCHAR(32) NOT NULL
  description TEXT NOT NULL
);

------------
-- Data creating commands.

INSERT INTO state (state_code, name, description) VALUES ('SOLID', 'Solid / Rock state', 'The planet has solid surface'), ('GAS', 'Gaseous state', 'The planet is made up of gases like hydrogen'), ('OTHERS', 'Unknown / not found state', 'The state of planet is unknown or of other matter');

INSERT INTO galaxy (name, total_planets, total_stars, description) VALUES
  ('Milky Way', '400,000,000,000', '400,000,000,000', 'The Milky Way is a barred spiral galaxy that contains our Solar System. It is estimated to contain 100-400 billion stars and 100-400 billion planets. The Milky Way is about 100,000 light-years in diameter and has a thickness of about 1,000 light-years. The Solar System is located in the Orion Arm, one of the spiral arms of the Milky Way.'),
  ('Andromeda Galaxy', '1,000,000,000,000', '1,000,000,000,000', 'The Andromeda Galaxy is a spiral galaxy that is the closest major galaxy to the Milky Way. It is estimated to contain 1 trillion stars and 1 trillion planets. The Andromeda Galaxy is about 220,000 light-years in diameter and has a thickness of about 10,000 light-years.'),
  ('Triangulum Galaxy', '10,000,000,000,000', '10,000,000,000,000', 'The Triangulum Galaxy is a spiral galaxy that is the third largest galaxy in the Local Group, a cluster of galaxies that includes the Milky Way and Andromeda. It is estimated to contain 10 billion stars and 10 billion planets. The Triangulum Galaxy is about 60,000 light-years in diameter and has a thickness of about 5,000 light-years.'),
  ('Large Magellanic Cloud', '10,000,000,000,000', '10,000,000,000,000', 'The Large Magellanic Cloud is a dwarf irregular galaxy that is a satellite galaxy of the Milky Way. It is estimated to contain 10 billion stars and 10 billion planets. The Large Magellanic Cloud is about 160,000 light-years in diameter and has a thickness of about 5,000 light-years.'),
  ('Small Magellanic Cloud', '1,000,000,000', '1,000,000,000', 'The Small Magellanic Cloud is a dwarf irregular galaxy that is a satellite galaxy of the Milky Way. It is estimated to contain 1 billion stars and 1 billion planets. The Small Magellanic Cloud is about 60,000 light-years in diameter and has a thickness of about 3,000 light-years.'),
  ('Messier 81', '60,000,000,000', '60,000,000,000', 'Messier 81 is a spiral galaxy that is the brightest member of the M81 Group, a cluster of galaxies that is located about 12 million light-years from the Milky Way. It is estimated to contain 60 billion stars and 60 billion planets. Messier 81 is about 70,000 light-years in diameter and has a thickness of about 10,000 light-years.');

INSERT INTO star (name, size_in_km_mn, temperature_in_celsius, planets_orbiting_it, galaxy_id) VALUES
  ('Sun', 1391400, 5505, 8, 1),
  ('Sirius', 1989000, 9941, 0, 1),
  ('Proxima Centauri', 139400, 3700, 1, 1),
  ('Alpheratz', 1989000, 9941, 0, 2),
  ('Mirach', 450100, 3000, 1, 2),
  ('Ruchbah', 1587000, 8911, 0, 2),
  ('Kepler-186f', 10918, 80, 5, 1);

INSERT INTO planet (name, size_in_km_mn, total_moons, water_available, temperature_in_celsius, state, star_id) VALUES
  ('Mercury', 4879, 0, False, 427, 'SOLID', 1),
  ('Venus', 12104, 0, False, 863, 'SOLID', 1),
  ('Earth', 12742, 1, True, 58, 'SOLID', 1),
  ('Mars', 6779, 2, False, 20, 'SOLID', 1),
  ('Jupiter', 139820, 80, True, -166, 'GAS', 1),
  ('Saturn', 116460, 82, True, 130, 'GAS', 1),
  ('Uranus', 50724, 27, True, -195, 'GAS', 1),
  ('Neptune', 49528, 14, True, -200, 'GAS', 1),
  ('Proxima b', 11180, 0, False, 14, 'SOLID', 3),
  ('Mirach b', 0, 1, False, 0, 'OTHERS', 5),
  ('Kepler-186f', 10918, 0, True, 80, 'SOLID', 7),
  ('Kelper-90', 1989000, 0, False, 6080, 'GAS', 7);

INSERT INTO moon (name, size_in_km_mn, orbit_period_days, explored, planet_id) VALUES
  -- EARTH
  ('Moon', 3474, 27.32, True, 3),
  -- MARS
  ('Phobos', 22.2, 0.766, False, 4),
  ('Deimos', 12.6, 1.262, False, 4),
  -- JUPITER
  ('Io', 3643, 1.769, True, 5),
  ('Europa', 3122, 3.551, False, 5),
  ('Ganymede', 5268, 7.154, False, 5),
  ('Callisto', 4821, 16.689, False, 5),
  ('Amalthea', 186, 0.498, False, 5),
  ('Himalia', 170, 249.76, False, 5),
  ('Elara', 86, 259.64, False, 5),
  ('Pasiphae', 64, 701.33, False, 5),
  ('Sinope', 38, 686.43, False, 5),
  ('Lysithea', 36, 631.30, False, 5),
  -- SATURN
  ('Mimas', 396, 0.942, True, 6),
  ('Enceladus', 504, 1.370, True, 6),
  ('Tethys', 1062, 1.888, False, 6),
  ('Dione', 1118, 2.737, False, 6),
  ('Rhea', 1527, 4.518, False, 6),
  ('Titan', 5150, 15.945, True, 6),
  ('Hyperion', 266, 21.276, False, 6),
  ('Iapetus', 1436, 79.330, False, 6),
  ('Phoebe', 213, 550.42, False, 6),
  ('Janus', 178, 0.750, False, 6);

