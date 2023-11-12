--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    total_planets character varying(255) NOT NULL,
    total_stars character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_in_km_mn numeric NOT NULL,
    orbit_period_days numeric,
    explored boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_in_km_mn numeric NOT NULL,
    total_moons integer,
    water_available boolean,
    temperature_in_celsius bigint,
    state_code character varying(32),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_in_km_mn numeric NOT NULL,
    temperature_in_celsius bigint,
    planets_orbiting_it integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.state (
    state_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description character varying(255),
    state_code character varying(255) NOT NULL
);


ALTER TABLE public.state OWNER TO freecodecamp;

--
-- Name: state_state_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.state_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_state_id_seq OWNER TO freecodecamp;

--
-- Name: state_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.state_state_id_seq OWNED BY public.state.state_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: state state_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state ALTER COLUMN state_id SET DEFAULT nextval('public.state_state_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '400,000,000,000', '400,000,000,000', 'The Milky Way is a barred spiral galaxy that contains our Solar System. It is estimated to contain 100-400 billion stars and 100-400 billion planets. The Milky Way is about 100,000 light-years in diameter and has a thickness of about 1,000 light-years. The Solar System is located in the Orion Arm, one of the spiral arms of the Milky Way.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', '1,000,000,000,000', '1,000,000,000,000', 'The Andromeda Galaxy is a spiral galaxy that is the closest major galaxy to the Milky Way. It is estimated to contain 1 trillion stars and 1 trillion planets. The Andromeda Galaxy is about 220,000 light-years in diameter and has a thickness of about 10,000 light-years.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', '10,000,000,000,000', '10,000,000,000,000', 'The Triangulum Galaxy is a spiral galaxy that is the third largest galaxy in the Local Group, a cluster of galaxies that includes the Milky Way and Andromeda. It is estimated to contain 10 billion stars and 10 billion planets. The Triangulum Galaxy is about 60,000 light-years in diameter and has a thickness of about 5,000 light-years.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', '10,000,000,000,000', '10,000,000,000,000', 'The Large Magellanic Cloud is a dwarf irregular galaxy that is a satellite galaxy of the Milky Way. It is estimated to contain 10 billion stars and 10 billion planets. The Large Magellanic Cloud is about 160,000 light-years in diameter and has a thickness of about 5,000 light-years.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', '1,000,000,000', '1,000,000,000', 'The Small Magellanic Cloud is a dwarf irregular galaxy that is a satellite galaxy of the Milky Way. It is estimated to contain 1 billion stars and 1 billion planets. The Small Magellanic Cloud is about 60,000 light-years in diameter and has a thickness of about 3,000 light-years.');
INSERT INTO public.galaxy VALUES (6, 'Messier 81', '60,000,000,000', '60,000,000,000', 'Messier 81 is a spiral galaxy that is the brightest member of the M81 Group, a cluster of galaxies that is located about 12 million light-years from the Milky Way. It is estimated to contain 60 billion stars and 60 billion planets. Messier 81 is about 70,000 light-years in diameter and has a thickness of about 10,000 light-years.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 27.32, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.2, 0.766, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.6, 1.262, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 1.769, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 3.551, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 7.154, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 16.689, false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 186, 0.498, false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 170, 249.76, false, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 86, 259.64, false, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 64, 701.33, false, 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 38, 686.43, false, 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', 36, 631.30, false, 5);
INSERT INTO public.moon VALUES (14, 'Mimas', 396, 0.942, true, 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', 504, 1.370, true, 6);
INSERT INTO public.moon VALUES (16, 'Tethys', 1062, 1.888, false, 6);
INSERT INTO public.moon VALUES (17, 'Dione', 1118, 2.737, false, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', 1527, 4.518, false, 6);
INSERT INTO public.moon VALUES (19, 'Titan', 5150, 15.945, true, 6);
INSERT INTO public.moon VALUES (20, 'Hyperion', 266, 21.276, false, 6);
INSERT INTO public.moon VALUES (21, 'Iapetus', 1436, 79.330, false, 6);
INSERT INTO public.moon VALUES (22, 'Phoebe', 213, 550.42, false, 6);
INSERT INTO public.moon VALUES (23, 'Janus', 178, 0.750, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 0, false, 427, 'SOLID', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0, false, 863, 'SOLID', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 1, true, 58, 'SOLID', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 2, false, 20, 'SOLID', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 80, true, -166, 'GAS', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 82, true, 130, 'GAS', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 27, true, -195, 'GAS', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 14, true, -200, 'GAS', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 11180, 0, false, 14, 'SOLID', 3);
INSERT INTO public.planet VALUES (10, 'Mirach b', 0, 1, false, 0, 'OTHERS', 5);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 10918, 0, true, 80, 'SOLID', 7);
INSERT INTO public.planet VALUES (12, 'Kelper-90', 1989000, 0, false, 6080, 'GAS', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1391400, 5505, 8, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 1989000, 9941, 0, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 139400, 3700, 1, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 1989000, 9941, 0, 2);
INSERT INTO public.star VALUES (5, 'Mirach', 450100, 3000, 1, 2);
INSERT INTO public.star VALUES (6, 'Ruchbah', 1587000, 8911, 0, 2);
INSERT INTO public.star VALUES (7, 'Kepler-186f', 10918, 80, 5, 1);


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.state VALUES (1, 'Solid / Rock state', 'The planet has solid surface', 'SOLID');
INSERT INTO public.state VALUES (2, 'Gaseous state', 'The planet is made up of gases like hydrogen', 'GAS');
INSERT INTO public.state VALUES (3, 'Unknown / not found state', 'The state of planet is unknown or of other matter', 'OTHERS');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: state_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.state_state_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (state_id);


--
-- Name: state state_state_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_state_code_key UNIQUE (state_code);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_state_code_fkey FOREIGN KEY (state_code) REFERENCES public.state(state_code);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

