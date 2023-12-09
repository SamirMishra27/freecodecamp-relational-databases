--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    secret_number integer NOT NULL,
    guess_attempts integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 769, 770);
INSERT INTO public.games VALUES (2, 10, 698, 699);
INSERT INTO public.games VALUES (3, 11, 876, 877);
INSERT INTO public.games VALUES (4, 11, 512, 513);
INSERT INTO public.games VALUES (5, 10, 242, 245);
INSERT INTO public.games VALUES (6, 10, 676, 678);
INSERT INTO public.games VALUES (7, 10, 205, 206);
INSERT INTO public.games VALUES (8, 1, 922, 11);
INSERT INTO public.games VALUES (9, 1, 431, 14);
INSERT INTO public.games VALUES (10, 1, 540, 9);
INSERT INTO public.games VALUES (11, 12, 618, 619);
INSERT INTO public.games VALUES (12, 12, 957, 958);
INSERT INTO public.games VALUES (13, 13, 563, 564);
INSERT INTO public.games VALUES (14, 13, 214, 215);
INSERT INTO public.games VALUES (15, 12, 891, 894);
INSERT INTO public.games VALUES (16, 12, 918, 920);
INSERT INTO public.games VALUES (17, 12, 997, 998);
INSERT INTO public.games VALUES (18, 16, 782, 783);
INSERT INTO public.games VALUES (19, 16, 211, 212);
INSERT INTO public.games VALUES (20, 17, 931, 932);
INSERT INTO public.games VALUES (21, 17, 748, 749);
INSERT INTO public.games VALUES (22, 16, 572, 575);
INSERT INTO public.games VALUES (23, 16, 388, 390);
INSERT INTO public.games VALUES (24, 16, 759, 760);
INSERT INTO public.games VALUES (25, 18, 163, 164);
INSERT INTO public.games VALUES (26, 18, 201, 202);
INSERT INTO public.games VALUES (27, 19, 692, 693);
INSERT INTO public.games VALUES (28, 19, 173, 174);
INSERT INTO public.games VALUES (29, 18, 364, 367);
INSERT INTO public.games VALUES (30, 18, 261, 263);
INSERT INTO public.games VALUES (31, 18, 784, 785);
INSERT INTO public.games VALUES (32, 20, 945, 946);
INSERT INTO public.games VALUES (33, 20, 253, 254);
INSERT INTO public.games VALUES (34, 21, 165, 166);
INSERT INTO public.games VALUES (35, 21, 496, 497);
INSERT INTO public.games VALUES (36, 20, 758, 761);
INSERT INTO public.games VALUES (37, 20, 530, 532);
INSERT INTO public.games VALUES (38, 20, 529, 530);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'samirmishra27');
INSERT INTO public.users VALUES (2, 'user_1702145244253');
INSERT INTO public.users VALUES (3, 'user_1702145244252');
INSERT INTO public.users VALUES (4, 'user_1702145330333');
INSERT INTO public.users VALUES (5, 'user_1702145330332');
INSERT INTO public.users VALUES (6, 'user_1702145502551');
INSERT INTO public.users VALUES (7, 'user_1702145502550');
INSERT INTO public.users VALUES (8, 'user_1702145547611');
INSERT INTO public.users VALUES (9, 'user_1702145547610');
INSERT INTO public.users VALUES (10, 'user_1702145640447');
INSERT INTO public.users VALUES (11, 'user_1702145640446');
INSERT INTO public.users VALUES (12, 'user_1702145929003');
INSERT INTO public.users VALUES (13, 'user_1702145929002');
INSERT INTO public.users VALUES (14, 'user_1702146030820');
INSERT INTO public.users VALUES (15, 'user_1702146030819');
INSERT INTO public.users VALUES (16, 'user_1702146074593');
INSERT INTO public.users VALUES (17, 'user_1702146074592');
INSERT INTO public.users VALUES (18, 'user_1702146145633');
INSERT INTO public.users VALUES (19, 'user_1702146145632');
INSERT INTO public.users VALUES (20, 'user_1702146199916');
INSERT INTO public.users VALUES (21, 'user_1702146199915');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 38, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

