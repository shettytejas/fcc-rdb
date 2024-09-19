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
    name character varying(100) NOT NULL,
    type character varying(50),
    diameter_light_years numeric(10,2),
    distance_from_earth_light_years numeric(12,2),
    estimated_star_count_in_thousands integer,
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
    planet_id integer,
    name character varying(100) NOT NULL,
    diameter_km numeric(8,2),
    orbital_period_days numeric(10,2),
    distance_from_planet_km integer,
    is_synchronous_rotation boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    nebula_type character varying(50),
    diameter_light_years numeric(10,2),
    dominant_element character varying(20),
    is_star_forming boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(100) NOT NULL,
    planet_type character varying(50),
    life_exists boolean DEFAULT false NOT NULL,
    mass_earth_masses numeric(10,2),
    orbital_period_days numeric(10,2),
    distance_from_star_au numeric(10,2)
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
    galaxy_id integer,
    name character varying(100) NOT NULL,
    spectral_type character(1),
    mass_solar_masses numeric(8,2),
    temperature_kelvin integer,
    age_billion_years numeric(5,2)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000.00, 0.00, 250000000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000.00, 2537000.00, 1000000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000.00, 3000000.00, 40000000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 60000.00, 13000000.00, 100000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 60000.00, 23000000.00, 100000000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 50000.00, 29000000.00, 100000000, NULL);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'Spiral', 170000.00, 21000000.00, 1000000000, NULL);
INSERT INTO public.galaxy VALUES (8, 'Cigar', 'Irregular', 37000.00, 11000000.00, 30000000, NULL);
INSERT INTO public.galaxy VALUES (9, 'Bode''s', 'Spiral', 90000.00, 12000000.00, 250000000, NULL);
INSERT INTO public.galaxy VALUES (10, 'Cartwheel', 'Lenticular', 130000.00, 500000000.00, 100000000, NULL);
INSERT INTO public.galaxy VALUES (11, 'Black Eye', 'Spiral', 53800.00, 17000000.00, 100000000, NULL);
INSERT INTO public.galaxy VALUES (12, 'Tadpole', 'Spiral', 280000.00, 420000000.00, 100000000, NULL);
INSERT INTO public.galaxy VALUES (13, 'Hoag''s Object', 'Ring', 100000.00, 600000000.00, 8000000, NULL);
INSERT INTO public.galaxy VALUES (14, 'Sculptor', 'Dwarf', 5000.00, 290000.00, 100, NULL);
INSERT INTO public.galaxy VALUES (15, 'Large Magellanic Cloud', 'Irregular', 14000.00, 158200.00, 30000000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 16, 'Luna', 3474.80, 27.32, 384400, true);
INSERT INTO public.moon VALUES (2, 18, 'Io', 3643.20, 1.77, 421700, true);
INSERT INTO public.moon VALUES (3, 18, 'Europa', 3121.60, 3.55, 671100, true);
INSERT INTO public.moon VALUES (4, 18, 'Ganymede', 5268.20, 7.15, 1070400, true);
INSERT INTO public.moon VALUES (5, 18, 'Callisto', 4820.60, 16.69, 1882700, true);
INSERT INTO public.moon VALUES (6, 20, 'Titan', 5149.50, 15.95, 1221870, true);
INSERT INTO public.moon VALUES (7, 20, 'Enceladus', 504.20, 1.37, 238040, true);
INSERT INTO public.moon VALUES (8, 20, 'Mimas', 396.40, 0.94, 185540, true);
INSERT INTO public.moon VALUES (9, 21, 'Sirius b Moon 1', 1000.00, 2.50, 50000, true);
INSERT INTO public.moon VALUES (10, 22, 'Proxima b Moon 1', 500.00, 1.20, 30000, true);
INSERT INTO public.moon VALUES (11, 24, 'Vega b Moon 1', 2000.00, 5.00, 100000, false);
INSERT INTO public.moon VALUES (12, 25, 'Alpheratz b Moon 1', 1500.00, 3.00, 80000, true);
INSERT INTO public.moon VALUES (13, 27, 'Beta Trianguli b Moon 1', 2500.00, 6.00, 120000, false);
INSERT INTO public.moon VALUES (14, 29, 'Whirlpool Moon 1', 3000.00, 10.00, 200000, true);
INSERT INTO public.moon VALUES (15, 30, 'Sombrero Moon 1', 1800.00, 4.50, 90000, false);
INSERT INTO public.moon VALUES (16, 16, 'Luna 2', 3474.80, 27.32, 384400, true);
INSERT INTO public.moon VALUES (17, 18, 'Io 2', 3643.20, 1.77, 421700, true);
INSERT INTO public.moon VALUES (18, 18, 'Europa 2', 3121.60, 3.55, 671100, true);
INSERT INTO public.moon VALUES (19, 18, 'Ganymede 2', 5268.20, 7.15, 1070400, true);
INSERT INTO public.moon VALUES (20, 18, 'Callisto 2', 4820.60, 16.69, 1882700, true);
INSERT INTO public.moon VALUES (21, 20, 'Titan 2', 5149.50, 15.95, 1221870, true);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 1, 'Orion Nebula', 'Emission', 24.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (2, 1, 'Crab Nebula', 'Supernova Remnant', 11.00, 'Oxygen', false);
INSERT INTO public.nebula VALUES (3, 1, 'Eagle Nebula', 'Emission', 70.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (4, 1, 'Horsehead Nebula', 'Dark', 3.50, 'Dust', false);
INSERT INTO public.nebula VALUES (5, 2, 'Andromeda Nebula 1', 'Planetary', 2.00, 'Oxygen', false);
INSERT INTO public.nebula VALUES (6, 2, 'Andromeda Star Nursery', 'Emission', 100.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (7, 3, 'Triangulum Emission Nebula', 'Emission', 30.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (8, 4, 'Centaurus A Starburst Region', 'Starburst', 5000.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (9, 5, 'Whirlpool Nebula', 'Emission', 40.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (10, 6, 'Sombrero Dust Lane', 'Dark', 25000.00, 'Dust', false);
INSERT INTO public.nebula VALUES (11, 7, 'Pinwheel Nebula Complex', 'Emission', 150.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (12, 8, 'Cigar Starburst', 'Starburst', 500.00, 'Hydrogen', true);
INSERT INTO public.nebula VALUES (13, 9, 'Bode''s Nebula', 'Reflection', 20.00, 'Dust', false);
INSERT INTO public.nebula VALUES (14, 11, 'Black Eye Dust Lane', 'Dark', 5000.00, 'Dust', false);
INSERT INTO public.nebula VALUES (15, 13, 'Hoag''s Object Ring', 'Planetary', 100000.00, 'Hydrogen', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 31, 'Earth', 'Terrestrial', true, 1.00, 365.26, 1.00);
INSERT INTO public.planet VALUES (17, 31, 'Mars', 'Terrestrial', false, 0.11, 687.00, 1.52);
INSERT INTO public.planet VALUES (18, 31, 'Jupiter', 'Gas Giant', false, 317.80, 4333.00, 5.20);
INSERT INTO public.planet VALUES (19, 31, 'Venus', 'Terrestrial', false, 0.82, 224.70, 0.72);
INSERT INTO public.planet VALUES (20, 31, 'Saturn', 'Gas Giant', false, 95.20, 10759.00, 9.54);
INSERT INTO public.planet VALUES (21, 32, 'Sirius b', 'White Dwarf', false, 2.00, 50.00, 0.10);
INSERT INTO public.planet VALUES (22, 33, 'Proxima Centauri b', 'Super Earth', false, 1.27, 11.20, 0.05);
INSERT INTO public.planet VALUES (23, 33, 'Alpha Centauri Bb', 'Terrestrial', false, 1.10, 3.24, 0.04);
INSERT INTO public.planet VALUES (24, 35, 'Vega b', 'Gas Giant', false, 500.00, 900.00, 2.50);
INSERT INTO public.planet VALUES (25, 36, 'Alpheratz b', 'Hot Jupiter', false, 800.00, 4.62, 0.06);
INSERT INTO public.planet VALUES (26, 37, 'Mirach b', 'Super Earth', false, 2.50, 30.00, 0.20);
INSERT INTO public.planet VALUES (27, 39, 'Beta Trianguli b', 'Gas Giant', false, 600.00, 800.00, 2.00);
INSERT INTO public.planet VALUES (28, 40, 'Alpha Centauri Planet', 'Terrestrial', false, 1.30, 400.00, 1.20);
INSERT INTO public.planet VALUES (29, 41, 'Whirlpool Planet', 'Gas Giant', false, 1000.00, 1500.00, 3.00);
INSERT INTO public.planet VALUES (30, 42, 'Sombrero Planet', 'Ice Giant', false, 50.00, 3000.00, 5.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (31, 1, 'Sun', 'G', 1.00, 5778, 4.60);
INSERT INTO public.star VALUES (32, 1, 'Sirius', 'A', 2.02, 9940, 0.23);
INSERT INTO public.star VALUES (33, 1, 'Alpha Centauri A', 'G', 1.10, 5790, 5.30);
INSERT INTO public.star VALUES (34, 1, 'Betelgeuse', 'M', 11.60, 3500, 0.01);
INSERT INTO public.star VALUES (35, 1, 'Vega', 'A', 2.10, 9602, 0.45);
INSERT INTO public.star VALUES (36, 2, 'Alpheratz', 'B', 3.80, 13800, 0.06);
INSERT INTO public.star VALUES (37, 2, 'Mirach', 'M', 2.49, 3800, 6.70);
INSERT INTO public.star VALUES (38, 2, 'Almach', 'K', 80.00, 4250, 0.01);
INSERT INTO public.star VALUES (39, 3, 'Beta Trianguli', 'A', 3.50, 9400, 0.10);
INSERT INTO public.star VALUES (40, 4, 'Alpha Centauri B', 'G', 1.10, 5790, 5.30);
INSERT INTO public.star VALUES (41, 5, 'Whirlpool Star 1', 'O', 20.00, 35000, 0.01);
INSERT INTO public.star VALUES (42, 6, 'Sombrero Star 1', 'F', 1.40, 6700, 3.00);
INSERT INTO public.star VALUES (43, 7, 'Pinwheel Star 1', 'B', 5.00, 18000, 0.05);
INSERT INTO public.star VALUES (44, 8, 'Cigar Star 1', 'M', 0.30, 3400, 10.00);
INSERT INTO public.star VALUES (45, 9, 'Bode Star 1', 'K', 0.80, 4900, 8.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 15, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 45, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

