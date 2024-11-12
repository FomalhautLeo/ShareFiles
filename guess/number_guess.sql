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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name character varying(22),
    user_id integer NOT NULL,
    times integer DEFAULT 0,
    best integer
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1731394811161', 22, 5, 46);
INSERT INTO public.users VALUES ('user_1731394792076', 16, 5, 46);
INSERT INTO public.users VALUES ('zzp', 1, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705241', 2, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705241', 3, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705240', 4, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705240', 5, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705241', 6, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705241', 7, 5, 46);
INSERT INTO public.users VALUES ('user_1731394705241', 8, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724723', 9, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724723', 10, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724722', 11, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724722', 12, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724723', 13, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724723', 14, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835410', 35, 5, 46);
INSERT INTO public.users VALUES ('user_1731394724723', 15, 5, 46);
INSERT INTO public.users VALUES ('user_1731394792076', 17, 5, 46);
INSERT INTO public.users VALUES ('user_1731394792075', 18, 5, 46);
INSERT INTO public.users VALUES ('user_1731394792075', 19, 5, 46);
INSERT INTO public.users VALUES ('user_1731394792076', 20, 5, 46);
INSERT INTO public.users VALUES ('user_1731394792076', 21, 5, 46);
INSERT INTO public.users VALUES ('user_1731394811161', 23, 5, 46);
INSERT INTO public.users VALUES ('user_1731394811160', 24, 5, 46);
INSERT INTO public.users VALUES ('user_1731394811160', 25, 5, 46);
INSERT INTO public.users VALUES ('user_1731394811161', 26, 5, 46);
INSERT INTO public.users VALUES ('user_1731394811161', 27, 5, 46);
INSERT INTO public.users VALUES ('user_1731394811161', 28, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835410', 29, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835410', 30, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835409', 31, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835409', 32, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835410', 33, 5, 46);
INSERT INTO public.users VALUES ('user_1731394835410', 34, 5, 46);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

