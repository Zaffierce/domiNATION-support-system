--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-1.pgdg18.04+1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dinocolors; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.dinocolors (
    id integer,
    color_name character varying(255),
    color_hex character varying(255)
);


ALTER TABLE public.dinocolors OWNER TO jon;

--
-- Name: dinosaurs; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.dinosaurs (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.dinosaurs OWNER TO jon;

--
-- Name: dinosaurs_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.dinosaurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dinosaurs_id_seq OWNER TO jon;

--
-- Name: dinosaurs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.dinosaurs_id_seq OWNED BY public.dinosaurs.id;


--
-- Name: dinosaurs id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinosaurs ALTER COLUMN id SET DEFAULT nextval('public.dinosaurs_id_seq'::regclass);


--
-- Data for Name: dinocolors; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.dinocolors (id, color_name, color_hex) FROM stdin;
1	Red	ff0000
2	Blue	0000ff
3	Green	00ff00
4	Yellow	ffff00
5	Cyan	00ffff
6	Magenta	ff00ff
7	Light Green	c0ffba
8	Light Grey	c8caca
9	Light Brown	786759
10	Light Orange	ffb46c
12	Light Red	fffa8a
11	Light Yellow	ff756c
13	Dark Grey	7b7b7b
14	Black	3b3b3b
15	Brown	593a2a
16	Dark Green	224900
17	Dark Red	812118
18	White	ffffff
19	Dino Light Red	ffa8a8
20	Dino Dark Red	592b2b
21	Dino Light Orange	ffb694
22	Dino Dark Orange	88532f
23	Dino Light Yellow	cacaa0
24	Dino Dark Yellow	94946c
25	Dino Light Green	e0ffe0
26	Dino Medium Green	799479
27	Dino Dark Green	224122
28	Dino Light Blue	d9e0ff
29	Dino Dark Blue	394263
30	Dino Light Purple	e4d9ff
31	Dino Dark Purple	403459
32	Dino Light Brown	ffe0ba
33	Dino Medium Brown	948575
34	Dino Dark Brown	594e41
35	Dino Darker Grey	595959
36	Dino Albino	ffffff
37	BigFoot0	b79683
38	BigFoot4	eadad5
39	BigFoot5	d0a794
40	WolfFur	c3b39f
41	DarkWolfFur	887666
42	DragonBase0	a0664b
43	DragonBase1	cb7956
44	DragonFire	bc4f00
45	DragonGreen0	79846c
46	DragonGreen1	909c79
47	DragonGreen2	a5a48b
48	DragonGreen3	2D4B56
49	WyvernPurple0	302C4F
50	WyvernPurple1	705E88
51	WyvernBlue0	1F3964
52	WyvernBlue1	101B2D
53	Dino Medium Blue	1D60D2
54	Dino Deep Blue	0E23A9
55	NearWhite	D8D8D8
56	NearBlack	141414
201	Black Dye	020202
202	Blue Dye	ffffff
203	Brown Dye	2D1E0F
204	Cyan Dye	ffffff
205	Forest Dye	002600
206	Green Dye	ffffff
207	Purple Dye	26007F
208	Orange Dye	FF3F00
209	Parchment Dye	FFFF7F
210	Pink Dye	FF33C1
211	Unused Purple Dye	3300BF
212	Red Dye	ffffff
213	Royalty Dye	330066
214	Silver Dye	BFBFBF
215	Sky Blue Dye	7FAAFF
216	Tan Dye	FFD772
217	Tangerine Dye	6C2105
218	White Dye	FCFCFC
219	Yellow Dye	ffffff
220	Magenta Dye	CC02B2
221	Brick Dye	4C0702
222	Cantaloupe Dye	FF5400
223	Mud Dye	0F0A05
224	Navy Dye	070726
225	Olive Dye	7F7F19
226	Steel Gray	ffffff
\.


--
-- Data for Name: dinosaurs; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.dinosaurs (id, name) FROM stdin;
1	Achatina
2	Allosaurus
3	Ankylosaurus
4	Araneo
5	Achaeopteryx
6	Argentavis
7	Arthropluera
8	Baryonyx
9	Basilisk
10	Basilosaurus
11	Beezlebufo
12	Brontosaurus
13	Bulbdog
14	Carbonemys
15	Carnotaurus
16	Castoroides
17	Chalicotherium
18	Compy
19	Daeodon
20	Deinonychus
21	Dilophosaur
22	Dimetrodon
23	Dimorphodon
24	Diplocaulus
25	Diplodocus
26	Direbear
27	Direwolf
28	Dodo
29	Doedicurus
30	Dung Beetle
31	Dunkleosteus
32	Enforcer
33	Equus
34	Featherlight
35	Gacha
36	Gallimimus
37	Gasbag
38	Giganotosaurus
39	Gigantopithecus
40	Glowtail
41	Griffin
42	Hyaenodon
43	Ichthyosaurus
44	Iguanodon
45	Jerboa
46	Kaprosuchus
47	Karkinos
48	Kentrosaurus
49	Lystrosaurus
50	Mammoth
51	Managarmr
52	Mantis
53	Megalania
54	Megaloceros
55	Megalodon
56	Megalosaurus
57	Megapithecus
58	Megatherium
59	Mek
60	Mesopithecus
61	Microraptor
62	Morellatops
63	Mosasaurus
64	Moschops
65	Onyc
66	Otter
67	Oviraptor
68	Ovis
69	Pachycephalosaurus
70	Pachyrhinosaurus
71	Paraceratherium
72	Parasaur
73	Pegomastax
74	Pelagornis
75	Phiomia
76	Phoenix
77	Plesiosaur
78	Procoptodon
79	Pteranodon
80	Pulmonoscorpius
81	Purlovia
82	Quetzacoatlus
83	Raptor
84	Ravager
85	Reaper King
86	Rex
87	Rock Drake
88	Rock Elemental
89	Rollrat
90	Sabertooth
91	Sarcosuchus
92	Scout
93	Shinehorn
94	Snow Owl
95	Spinosaurus
96	Stegosaurus
97	Tapejara
98	Tek Parasaur
99	Tek Quetzal
100	Tek Raptor
101	Tek Rex
102	Tek Stego
103	Terror Bird
104	Therizinosaurus
105	Thorny Dragon
106	Thylacoleo
107	Titanoboa
108	Triceratops
109	Troodon
110	Tusoteuthis
111	Unicorn
112	Velonasaur
113	Vulture
114	Wooly Rhino
115	Wyvern (Fire)
116	Wyvern (Ice)
117	Wyvern (Lightning)
118	Wyvern (Poison)
119	Yutyrannus
\.


--
-- Name: dinosaurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.dinosaurs_id_seq', 119, true);


--
-- Name: dinosaurs dinosaurs_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinosaurs
    ADD CONSTRAINT dinosaurs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

