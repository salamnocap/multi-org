--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 15.5

-- Started on 2024-06-27 02:57:56 +05

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

--
-- TOC entry 3612 (class 1262 OID 19131)
-- Name: org2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE org2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';


ALTER DATABASE org2 OWNER TO postgres;

\connect org2

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 19133)
-- Name: item; Type: TABLE; Schema: public; Owner: salam
--

CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.item OWNER TO salam;

--
-- TOC entry 214 (class 1259 OID 19132)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: salam
--

ALTER TABLE public.item ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3606 (class 0 OID 19133)
-- Dependencies: 215
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: salam
--

INSERT INTO public.item OVERRIDING SYSTEM VALUE VALUES (1, 'gyr');
INSERT INTO public.item OVERRIDING SYSTEM VALUE VALUES (2, 'fyr');
INSERT INTO public.item OVERRIDING SYSTEM VALUE VALUES (3, 'dyr');


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 214
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salam
--

SELECT pg_catalog.setval('public.item_id_seq', 3, true);


--
-- TOC entry 3462 (class 2606 OID 19139)
-- Name: item item_pk; Type: CONSTRAINT; Schema: public; Owner: salam
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pk PRIMARY KEY (id);


-- Completed on 2024-06-27 02:57:56 +05

--
-- PostgreSQL database dump complete
--

