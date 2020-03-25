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
-- Data for Name: dinosaurs; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.dinosaurs (id, name) FROM stdin;
2	Allosaurus
3	Ankylosaurus
4	Araneo
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
1	Achatina
\.


--
-- Name: dinosaurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.dinosaurs_id_seq', 120, true);


--
-- Name: dinosaurs dinosaurs_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinosaurs
    ADD CONSTRAINT dinosaurs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

