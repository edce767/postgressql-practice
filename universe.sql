--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type character varying(60),
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric
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
    name character varying(100) NOT NULL,
    planet_id integer,
    radius_km numeric,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean DEFAULT false,
    planet_type character varying(50),
    radius_km numeric
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_type character varying(60),
    mass numeric,
    is_spherical boolean DEFAULT true
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
-- Name: wandering_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.wandering_star (
    wandering_star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    type_star integer NOT NULL,
    has_life integer NOT NULL
);


ALTER TABLE public.wandering_star OWNER TO freecodecamp;

--
-- Name: wandering_star_wandering_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.wandering_star_wandering_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wandering_star_wandering_star_id_seq OWNER TO freecodecamp;

--
-- Name: wandering_star_wandering_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.wandering_star_wandering_star_id_seq OWNED BY public.wandering_star.wandering_star_id;


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
-- Name: wandering_star wandering_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wandering_star ALTER COLUMN wandering_star_id SET DEFAULT nextval('public.wandering_star_wandering_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'via lactea', 'espiral 4 brazos', 150, 3);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'espiral 4 brazos', 200, 1000);
INSERT INTO public.galaxy VALUES (3, 'galaxy01', 'eliptica', 700, 5000);
INSERT INTO public.galaxy VALUES (4, 'galaxy02', 'eliptica', 400, 7000);
INSERT INTO public.galaxy VALUES (5, 'galaxy03', 'espiral 2 brazos', 170, 2000);
INSERT INTO public.galaxy VALUES (6, 'galaxy04', 'espiral 2 brazos', 2000, 4000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3500, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (2, 'Lunera', 3, 3200, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (3, 'martunis1', 4, 2500, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (4, 'martunis2', 4, 1500, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (5, 'europa', 5, 2500, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (6, 'gaminedes', 5, 2000, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (7, 'io', 5, 1500, 'Luna rocosa con agua');
INSERT INTO public.moon VALUES (8, 'europain', 5, 5000, 'Luna rocosa');
INSERT INTO public.moon VALUES (9, 'jupitero1', 5, 500, 'Luna rocosa');
INSERT INTO public.moon VALUES (10, 'jupitero2', 5, 5100, 'Luna rocosa');
INSERT INTO public.moon VALUES (11, 'jupitero3', 5, 570, 'Luna rocosa');
INSERT INTO public.moon VALUES (12, 'jupitero4', 5, 1200, 'Luna rocosa');
INSERT INTO public.moon VALUES (13, 'Saturn1', 6, 1500, 'Luna rocosa');
INSERT INTO public.moon VALUES (14, 'Saturn2', 6, 1500, 'Luna rocosa');
INSERT INTO public.moon VALUES (15, 'Saturn3', 6, 4500, 'Luna rocosa');
INSERT INTO public.moon VALUES (16, 'Saturn4', 6, 500, 'Luna rocosa');
INSERT INTO public.moon VALUES (17, 'Saturn5', 6, 800, 'Luna rocosa');
INSERT INTO public.moon VALUES (18, 'Saturn6', 6, 900, 'Luna rocosa');
INSERT INTO public.moon VALUES (19, 'Uranus1', 7, 1000, 'Luna rocosa');
INSERT INTO public.moon VALUES (20, 'Uranus2', 7, 2000, 'Luna rocosa');
INSERT INTO public.moon VALUES (21, 'Uranus3', 7, 2000, 'Luna rocosa con agua');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercurio', 1, false, 'rocoso', 4000);
INSERT INTO public.planet VALUES (2, 'venus', 1, false, 'rocoso', 13000);
INSERT INTO public.planet VALUES (3, 'tierra', 1, false, 'rocoso', 13000);
INSERT INTO public.planet VALUES (4, 'marte', 1, false, 'rocoso', 6000);
INSERT INTO public.planet VALUES (5, 'jupiter', 1, false, 'gigante gaseoso', 324000);
INSERT INTO public.planet VALUES (6, 'saturno', 1, false, 'gigante gaseoso', 120000);
INSERT INTO public.planet VALUES (7, 'urano', 1, false, 'gaseoso', 70000);
INSERT INTO public.planet VALUES (8, 'neptuno', 1, false, 'gaseoso', 40000);
INSERT INTO public.planet VALUES (9, 'plutosi', 1, false, 'rocoso', 2000);
INSERT INTO public.planet VALUES (10, 'betelrise', 6, false, 'rocoso', 4000);
INSERT INTO public.planet VALUES (11, 'betel', 6, false, 'gigante gaseoso', 40000);
INSERT INTO public.planet VALUES (12, 'santus', 2, false, 'gigante gaseoso', 400000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 1, 'enana amarilla', 1, true);
INSERT INTO public.star VALUES (2, 'solaris', 3, 'enana roja', 5, true);
INSERT INTO public.star VALUES (3, 'pleyade', 2, 'gigante roja', 9, true);
INSERT INTO public.star VALUES (4, 'antares', 6, 'gigante azul', 10, true);
INSERT INTO public.star VALUES (5, 'sirius', 4, 'enana amarilla', 3, true);
INSERT INTO public.star VALUES (6, 'betelguse', 5, 'gigante roja', 8, false);
INSERT INTO public.star VALUES (7, 'cenicienta', 1, 'nova', 2, true);


--
-- Data for Name: wandering_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.wandering_star VALUES (1, 'errante1', 'estrella errante sin planeta', 1, 0);
INSERT INTO public.wandering_star VALUES (2, 'errante2', 'estrella errante sin planeta', 1, 0);
INSERT INTO public.wandering_star VALUES (3, 'errante3', 'estrella errante con planeta', 2, 0);
INSERT INTO public.wandering_star VALUES (4, 'errante4', 'estrella errante con planeta', 2, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: wandering_star_wandering_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.wandering_star_wandering_star_id_seq', 4, true);


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
-- Name: wandering_star wandering_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wandering_star
    ADD CONSTRAINT wandering_star_name_key UNIQUE (name);


--
-- Name: wandering_star wandering_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.wandering_star
    ADD CONSTRAINT wandering_star_pkey PRIMARY KEY (wandering_star_id);


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

