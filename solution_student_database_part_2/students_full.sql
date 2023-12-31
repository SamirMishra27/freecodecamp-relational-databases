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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (2, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (3, 'Web Programming');
INSERT INTO public.courses VALUES (4, 'Database Systems');
INSERT INTO public.courses VALUES (5, 'Computer Networks');
INSERT INTO public.courses VALUES (6, 'SQL');
INSERT INTO public.courses VALUES (7, 'Machine Learning');
INSERT INTO public.courses VALUES (8, 'Computer Systems');
INSERT INTO public.courses VALUES (9, 'Web Applications');
INSERT INTO public.courses VALUES (10, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (11, 'Python');
INSERT INTO public.courses VALUES (12, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (13, 'Calculus');
INSERT INTO public.courses VALUES (14, 'Game Architecture');
INSERT INTO public.courses VALUES (15, 'Algorithms');
INSERT INTO public.courses VALUES (16, 'UNIX');
INSERT INTO public.courses VALUES (17, 'Server Administration');
INSERT INTO public.courses VALUES (18, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (17, 'Database Administration');
INSERT INTO public.majors VALUES (18, 'Web Development');
INSERT INTO public.majors VALUES (19, 'Data Science');
INSERT INTO public.majors VALUES (20, 'Network Engineering');
INSERT INTO public.majors VALUES (21, 'Computer Programming');
INSERT INTO public.majors VALUES (22, 'Game Design');
INSERT INTO public.majors VALUES (23, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (17, 2);
INSERT INTO public.majors_courses VALUES (18, 3);
INSERT INTO public.majors_courses VALUES (17, 4);
INSERT INTO public.majors_courses VALUES (19, 2);
INSERT INTO public.majors_courses VALUES (20, 5);
INSERT INTO public.majors_courses VALUES (17, 6);
INSERT INTO public.majors_courses VALUES (19, 7);
INSERT INTO public.majors_courses VALUES (20, 8);
INSERT INTO public.majors_courses VALUES (21, 5);
INSERT INTO public.majors_courses VALUES (17, 9);
INSERT INTO public.majors_courses VALUES (22, 10);
INSERT INTO public.majors_courses VALUES (19, 11);
INSERT INTO public.majors_courses VALUES (21, 12);
INSERT INTO public.majors_courses VALUES (23, 8);
INSERT INTO public.majors_courses VALUES (22, 13);
INSERT INTO public.majors_courses VALUES (18, 2);
INSERT INTO public.majors_courses VALUES (19, 13);
INSERT INTO public.majors_courses VALUES (18, 12);
INSERT INTO public.majors_courses VALUES (22, 14);
INSERT INTO public.majors_courses VALUES (23, 5);
INSERT INTO public.majors_courses VALUES (22, 15);
INSERT INTO public.majors_courses VALUES (23, 16);
INSERT INTO public.majors_courses VALUES (23, 17);
INSERT INTO public.majors_courses VALUES (21, 8);
INSERT INTO public.majors_courses VALUES (21, 11);
INSERT INTO public.majors_courses VALUES (20, 18);
INSERT INTO public.majors_courses VALUES (18, 9);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (2, 'Rhea', 'Kellems', 17, 2.5);
INSERT INTO public.students VALUES (3, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (4, 'Kimberly', 'Whitley', 18, 3.8);
INSERT INTO public.students VALUES (5, 'Jimmy', 'Felipe', 17, 3.7);
INSERT INTO public.students VALUES (6, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (7, 'Casares', 'Hijo', 22, 4.0);
INSERT INTO public.students VALUES (8, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (9, 'Sterling', 'Boss', 22, 3.9);
INSERT INTO public.students VALUES (10, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (11, 'Kaija', 'Uronen', 22, 3.7);
INSERT INTO public.students VALUES (12, 'Faye', 'Conn', 22, 2.1);
INSERT INTO public.students VALUES (13, 'Efren', 'Reilly', 18, 3.9);
INSERT INTO public.students VALUES (14, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (15, 'Maxine', 'Hagenes', 17, 2.9);
INSERT INTO public.students VALUES (16, 'Larry', 'Saunders', 19, 2.2);
INSERT INTO public.students VALUES (17, 'Karl', 'Kuhar', 18, NULL);
INSERT INTO public.students VALUES (18, 'Lieke', 'Hazenveld', 22, 3.5);
INSERT INTO public.students VALUES (19, 'Obie', 'Hilpert', 18, NULL);
INSERT INTO public.students VALUES (20, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (21, 'Nathan', 'Turner', 17, 3.3);
INSERT INTO public.students VALUES (22, 'Gerald', 'Osiki', 19, 2.2);
INSERT INTO public.students VALUES (23, 'Vanya', 'Hassanah', 22, 4.0);
INSERT INTO public.students VALUES (24, 'Roxelana', 'Florescu', 17, 3.2);
INSERT INTO public.students VALUES (25, 'Helene', 'Parker', 19, 3.4);
INSERT INTO public.students VALUES (26, 'Mariana', 'Russel', 18, 1.8);
INSERT INTO public.students VALUES (27, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (28, 'Mehdi', 'Vandenberghe', 17, 1.9);
INSERT INTO public.students VALUES (29, 'Dejon', 'Howell', 18, 4.0);
INSERT INTO public.students VALUES (30, 'Aliya', 'Gulgowski', 23, 2.6);
INSERT INTO public.students VALUES (31, 'Ana', 'Tupajic', 19, 3.1);
INSERT INTO public.students VALUES (32, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 18, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 23, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 32, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

