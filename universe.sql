--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    galaxy_types integer,
    has_life integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_info (
    moon_id integer NOT NULL,
    color character varying(20) NOT NULL,
    moon_info_id character varying(20) NOT NULL,
    name character varying(20)
);


ALTER TABLE public.moon_info OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(50,6),
    distance_from_earth integer,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'GA', 'This is GA', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'GB', 'This is GB', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'GC', 'This is GC', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'GD', 'This is GD', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'GE', 'This is GE', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'GF', 'This is GF', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'MA', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'MB', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'MC', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'MD', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'ME', 3, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'MF', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'MG', 4, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'MH', 4, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'MI', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'MJ', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'MK', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'ML', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'MM', 2, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'MN', 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'MO', 3, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'MP', 3, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'MQ', 4, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'MR', 4, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'MS', 5, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'MT', 5, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'MU', 6, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'MV', 6, NULL, NULL);


--
-- Data for Name: moon_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_info VALUES (1, 'red', '1', NULL);
INSERT INTO public.moon_info VALUES (2, 'black', '2', NULL);
INSERT INTO public.moon_info VALUES (3, 'green', '3', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PA', NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'PB', NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'PC', NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'PD', NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'PE', NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'PF', NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, 'PG', NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, 'PH', NULL, NULL, 4);
INSERT INTO public.planet VALUES (10, 'PI', NULL, NULL, 5);
INSERT INTO public.planet VALUES (11, 'PJ', NULL, NULL, 6);
INSERT INTO public.planet VALUES (12, 'PK', NULL, NULL, 6);
INSERT INTO public.planet VALUES (9, 'PL', NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SA', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'SB', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'SC', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'SD', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'SE', NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (6, 'SF', NULL, NULL, NULL, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_info moon_info_color_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_color_key UNIQUE (color);


--
-- Name: moon_info moon_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_pkey PRIMARY KEY (moon_info_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

