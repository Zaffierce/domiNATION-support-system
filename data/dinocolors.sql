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
-- Name: dinocolors; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.dinocolors (
    color_id integer,
    color_name character varying(255),
    color_hex character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.dinocolors OWNER TO jon;

--
-- Name: dinocolors_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.dinocolors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dinocolors_id_seq OWNER TO jon;

--
-- Name: dinocolors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.dinocolors_id_seq OWNED BY public.dinocolors.id;


--
-- Name: dinocolors id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinocolors ALTER COLUMN id SET DEFAULT nextval('public.dinocolors_id_seq'::regclass);


--
-- Data for Name: dinocolors; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.dinocolors (color_id, color_name, color_hex, id) FROM stdin;
2	Blue	0000ff	2
3	Green	00ff00	3
4	Yellow	ffff00	4
5	Cyan	00ffff	5
6	Magenta	ff00ff	6
7	Light Green	c0ffba	7
8	Light Grey	c8caca	8
9	Light Brown	786759	9
10	Light Orange	ffb46c	10
12	Light Red	fffa8a	11
11	Light Yellow	ff756c	12
13	Dark Grey	7b7b7b	13
14	Black	3b3b3b	14
15	Brown	593a2a	15
16	Dark Green	224900	16
17	Dark Red	812118	17
18	White	ffffff	18
19	Dino Light Red	ffa8a8	19
20	Dino Dark Red	592b2b	20
21	Dino Light Orange	ffb694	21
22	Dino Dark Orange	88532f	22
23	Dino Light Yellow	cacaa0	23
24	Dino Dark Yellow	94946c	24
25	Dino Light Green	e0ffe0	25
26	Dino Medium Green	799479	26
27	Dino Dark Green	224122	27
28	Dino Light Blue	d9e0ff	28
29	Dino Dark Blue	394263	29
30	Dino Light Purple	e4d9ff	30
31	Dino Dark Purple	403459	31
32	Dino Light Brown	ffe0ba	32
33	Dino Medium Brown	948575	33
34	Dino Dark Brown	594e41	34
35	Dino Darker Grey	595959	35
36	Dino Albino	ffffff	36
37	BigFoot0	b79683	37
38	BigFoot4	eadad5	38
39	BigFoot5	d0a794	39
40	WolfFur	c3b39f	40
41	DarkWolfFur	887666	41
42	DragonBase0	a0664b	42
43	DragonBase1	cb7956	43
44	DragonFire	bc4f00	44
45	DragonGreen0	79846c	45
46	DragonGreen1	909c79	46
47	DragonGreen2	a5a48b	47
48	DragonGreen3	2D4B56	48
49	WyvernPurple0	302C4F	49
50	WyvernPurple1	705E88	50
51	WyvernBlue0	1F3964	51
52	WyvernBlue1	101B2D	52
53	Dino Medium Blue	1D60D2	53
54	Dino Deep Blue	0E23A9	54
55	NearWhite	D8D8D8	55
56	NearBlack	141414	56
201	Black Dye	020202	57
202	Blue Dye	ffffff	58
203	Brown Dye	2D1E0F	59
204	Cyan Dye	ffffff	60
205	Forest Dye	002600	61
206	Green Dye	ffffff	62
207	Purple Dye	26007F	63
208	Orange Dye	FF3F00	64
209	Parchment Dye	FFFF7F	65
210	Pink Dye	FF33C1	66
211	Unused Purple Dye	3300BF	67
212	Red Dye	ffffff	68
213	Royalty Dye	330066	69
214	Silver Dye	BFBFBF	70
215	Sky Blue Dye	7FAAFF	71
216	Tan Dye	FFD772	72
217	Tangerine Dye	6C2105	73
218	White Dye	FCFCFC	74
219	Yellow Dye	ffffff	75
220	Magenta Dye	CC02B2	76
221	Brick Dye	4C0702	77
222	Cantaloupe Dye	FF5400	78
223	Mud Dye	0F0A05	79
224	Navy Dye	070726	80
225	Olive Dye	7F7F19	81
226	Steel Gray	ffffff	82
1	Red	ff0000	1
999	A	030303	83
\.


--
-- Name: dinocolors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.dinocolors_id_seq', 83, true);


--
-- Name: dinocolors dinocolors_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinocolors
    ADD CONSTRAINT dinocolors_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

