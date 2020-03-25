--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-2.pgdg18.04+1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-2.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: servers; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.servers (
    server_id integer,
    server_name character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.servers OWNER TO jon;

--
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servers_id_seq OWNER TO jon;

--
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.servers_id_seq OWNED BY public.servers.id;


--
-- Name: servers id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.servers ALTER COLUMN id SET DEFAULT nextval('public.servers_id_seq'::regclass);


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.servers (server_id, server_name, id) FROM stdin;
2	Center	2
3	Scorched Earth	3
4	Aberration	4
5	Ragnarok	5
6	Patreon Ragnarok	6
7	Extinction	7
8	Patreon Extinction	8
9	Valguero	9
10	Patreon Aberration	10
11	Genesis	11
1	Island	1
\.


--
-- Name: servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.servers_id_seq', 14, true);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: servers_server_name; Type: INDEX; Schema: public; Owner: jon
--

CREATE UNIQUE INDEX servers_server_name ON public.servers USING btree (server_name);


--
-- PostgreSQL database dump complete
--

