--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dinocolors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dinocolors (
    color_id integer,
    color_name character varying(255),
    color_hex character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.dinocolors OWNER TO root;

--
-- Name: dinocolors_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dinocolors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dinocolors_id_seq OWNER TO root;

--
-- Name: dinocolors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.dinocolors_id_seq OWNED BY public.dinocolors.id;


--
-- Name: dinosaurs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dinosaurs (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.dinosaurs OWNER TO root;

--
-- Name: dinosaurs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dinosaurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dinosaurs_id_seq OWNER TO root;

--
-- Name: dinosaurs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.dinosaurs_id_seq OWNED BY public.dinosaurs.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.notes (
    note_id uuid,
    ticket_id character varying(255),
    description text,
    date character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    edited boolean
);


ALTER TABLE public.notes OWNER TO root;

--
-- Name: servers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.servers (
    server_id integer,
    server_name character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.servers OWNER TO root;

--
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servers_id_seq OWNER TO root;

--
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.servers_id_seq OWNED BY public.servers.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tickets (
    id uuid,
    incrementer integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance character varying(255),
    status character varying(20),
    time_to_contact character varying(255),
    type_of_ticket character varying(255),
    submitted_on character varying(20),
    accepted_on character varying(20),
    accepted_by character varying(255),
    closed_by character varying(255),
    closed_on character varying(20),
    gen_tribe_name character varying(255),
    gen_coordinates character varying(255),
    gen_issue text,
    gen_resolution text,
    event_name character varying(255),
    event_serverid_dropoff character varying(255),
    event_patreon_status character varying(5),
    event_element_dropoff_location character varying(255),
    transfer_amount integer,
    transfer_serverid_pickup character varying(255),
    transfer_server_pickup_location character varying(255),
    transfer_serverid_dropoff character varying(255),
    transfer_server_dropoff_location character varying(255),
    request_serverid_dropoff character varying(255),
    request_dino_name character varying(255),
    request_colored character varying(5),
    request_region0 character varying(5),
    request_region1 character varying(5),
    request_region2 character varying(5),
    request_region3 character varying(5),
    request_region4 character varying(5),
    request_region5 character varying(5),
    request_sex character varying(20),
    request_server_dropoff_location character varying(255),
    request_email_address character varying(255),
    insurance_dino_link character varying(255),
    insurance_email_address character varying(255),
    insurance_month_claimed character varying(255),
    insurance_explanation text,
    ban_steam_id character varying(255),
    ban_email_address character varying(255),
    ban_banned_reason text,
    ban_unban_reason text,
    bug_issue text,
    bug_recreate text,
    bug_lost_items text,
    anonymous_description text,
    cancelled_description text
);


ALTER TABLE public.tickets OWNER TO root;

--
-- Name: tickets_incrementer_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tickets_incrementer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_incrementer_seq OWNER TO root;

--
-- Name: tickets_incrementer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tickets_incrementer_seq OWNED BY public.tickets.incrementer;


--
-- Name: dinocolors id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dinocolors ALTER COLUMN id SET DEFAULT nextval('public.dinocolors_id_seq'::regclass);


--
-- Name: dinosaurs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dinosaurs ALTER COLUMN id SET DEFAULT nextval('public.dinosaurs_id_seq'::regclass);


--
-- Name: servers id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.servers ALTER COLUMN id SET DEFAULT nextval('public.servers_id_seq'::regclass);


--
-- Name: tickets incrementer; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tickets ALTER COLUMN incrementer SET DEFAULT nextval('public.tickets_incrementer_seq'::regclass);


--
-- Data for Name: dinocolors; Type: TABLE DATA; Schema: public; Owner: root
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
1	Red	ff0000	1
57	Dark Turquoise	184546	83
58	Medium Turquoise	007060	84
59	Turquoise	00c5ab	85
60	Green Slate	40594c	86
61	Sage	3e4f40	87
62	Dark Warm Grey	3b3938	88
63	Medium Warm Grey	585553	89
64	Light Warm Grey	9b9290	90
65	Dark Cement	525b56	91
66	Light Cement	8aa196	92
67	Light Pink	e8b0ff	93
68	Deep Pink	ff119a	94
69	Dark Violet	730046	95
70	Dark Magenta	b70042	96
72	Medium Autumn	a93000	98
71	Burn Sienna	7e331e	97
73	Vermillion	ef3100	99
74	Coral	ff5834	100
75	Orange	ff7f00	101
76	Peach	ffa73b	102
77	Light Autumn	ae7000	103
78	Mustard	949428	104
79	Actual Black	000000	105
80	Midnight Blue	190a36	106
81	Dark Blue	152b39	107
82	Black Sands	302531	108
83	Lemon Lime	a8ff43	109
84	Mint	38e985	110
85	Jade	008840	111
86	Pine Green	0f552e	112
87	Spruce Green	005b45	113
88	Leaf Green	5b9724	114
89	Dark Lavender	5e275f	115
90	Medium Lavender	853587	116
91	Lavender	bd77be	117
92	Dark Teal	0e404a	118
93	Medium Teal	105563	119
94	Teal	14849c	120
95	Powder Blue	82a7ff	121
96	Glacial	aceaff	122
97	Cammo	505118	123
98	Dry Moss	766e3f	124
99	Custard	c0bd5e	125
100	Cream	f4ffc0	126
201	Black Dye	1f1f1f	127
202	Blue Dye	0000ff	128
203	Brown Dye	756147	129
204	Cyan Dye	00ffff	130
205	Forest Dye	006c00	131
206	Green Dye	00ff00	132
207	Purple Dye	6c00ba	133
208	Orange Dye	ff8800	134
209	Parchment Dye	ffffba	135
210	Pink Dye	ff7be1	136
211	Unused Purple Dye	7b00e0	137
212	Red Dye	ff0000	138
213	Royalty Dye	7b00a8	139
214	Silver Dye	e0e0e0	140
215	Sky Dye	bad4ff	141
216	Tan Dye	ffed82	142
217	Tangerine Dye	ad652c	143
218	White Dye	fefefe	144
219	Yellow Dye	ffff00	145
220	Magenta Dye	e71fd9	146
221	Brick Dye	94341f	147
222	Cantaloupe Dye	ff9a00	148
223	Mud Dye	473b2b	149
224	Navy Dye	34346c	150
225	Olive Dye	baba59	151
226	Slate Dye	595959	152
\.


--
-- Data for Name: dinosaurs; Type: TABLE DATA; Schema: public; Owner: root
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
120	Achatina (Aberrant)
121	Ankylosaurus (Aberrant)
122	Araneo (Aberrant)
123	Arthropluera (Aberrant)
124	Baryonyx (Aberrant)
126	Carbonemys (Aberrant)
127	Carnotaurus (Aberrant)
128	Dimetrodon (Aberrant)
129	Dimorphodon (Aberrant)
130	Diplocaulus (Aberrant)
131	Diplodocus (Aberrant)
132	Dire Bear (Aberrant)
133	Dodo (Aberrant)
134	Doedicurus (Aberrant)
135	Dung Beetle (Aberrant)
136	Equus (Aberrant)
137	Gigantopithecus (Aberrant)
138	Iguanodon (Aberrant)
139	Lystrosaurus (Aberrant)
140	Megalania (Aberrant)
141	Megalosaurus (Aberrant)
142	Moschops (Aberrant)
143	Otter (Aberrant)
144	Ovis (Aberrant)
145	Paraceratherium (Aberrant)
146	Parasaur (Aberrant)
147	Pulmonoscorpius (Aberrant)
148	Purlovia (Aberrant)
149	Raptor (Aberrant)
151	Spinosaurus (Aberrant)
152	Stegosaurus (Aberrant)
153	Titanoboa (Aberrant)
154	Triceratops (Aberrant)
125	Beezlebufo (Aberrant)
150	Sarcosuchus (Aberrant)
155	Astrocetus
156	Megachelon
157	Magmasaur
158	Bloodstalker
159	X-Paraceratherium
160	X-Raptor
161	X-Spinosaurus
162	X-Tapejara
163	X-Basilosaurus
164	X-Ichthyosaurus
165	X-Dunkleosteus
166	X-Megalodon
167	X-Argentavis
168	X-Otter
169	X-Wooly Rhino
170	X-Sabertooth
171	X-Yutyrannus
172	X-Ankylosaurus
173	X-Rock Elemental
174	X-Rex
175	X-Triceratops
176	Ferox
178	X-Mosasaurus
179	X-Allosaurus
180	X-Parasaur
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.notes (note_id, ticket_id, description, date, discord_name, discord_id, edited) FROM stdin;
cb822a19-3a9f-476c-9aa2-f72e9883e828	20dc9d33-2ccb-40f5-b4ed-e7108b27fe8a	Ticket submitted - undefined	04/04/2020 17:58	SYSTEM	\N	\N
ee08ac97-9ee3-4474-a445-8e1a78fe605b	2d676183-8541-444a-985b-8d90ecfb0389	7 days to correct from 4/4/2020. 	04/04/2020 18:08	BeOurGuest	88994789860610048	\N
8f8c4c18-62ee-4908-bd07-b4720d271eaa	b58d726a-9ea1-44e9-88d6-424bcdad418e	Ticket submitted - Baxlelo	04/04/2020 20:49	SYSTEM	\N	\N
4a26be5d-8fb0-4d47-9fd0-5140e7c74882	f2ad8d44-e255-4dfd-878f-263fb7c2ee8b	Ticket submitted - AceoMac	04/04/2020 21:07	SYSTEM	\N	\N
331f4b8d-3bdb-43a3-8cce-d5d5260d2f53	a16efaee-2ed8-4b91-9fe3-c8d3ca52fce3	Ticket submitted - XMAN-Unum	04/04/2020 22:38	SYSTEM	\N	\N
be97b1a6-bff2-4017-a0dd-0bc4120b7604	312a041a-4987-4764-a31a-8a8ba361207c	Ticket submitted - leGit510	04/05/2020 06:59	SYSTEM	\N	\N
02d579d7-ba04-4774-9854-ad81fce5428d	5978023c-4bf1-401c-9bcf-52327a135479	Ticket submitted - JBizzle	04/05/2020 07:27	SYSTEM	\N	\N
aaf28973-0a06-43dd-bac7-6e4a198cc6eb	ee1b7155-e367-4f3c-8ef3-0328f598ab48	Ticket submitted - ItsYaBoiLawdy	04/05/2020 07:44	SYSTEM	\N	\N
f19dc4d6-1a6f-4085-9717-9d0ccfdb63f6	4cb8127c-da2a-43a3-9e76-855c5b031d18	Ticket cancelled for reason:  Sid: @Frank Yes? And on the ticket I put the wrong amount of element needed to be transfered, so sorry about that. - Frank	04/05/2020 07:55	SYSTEM	\N	\N
e8a3652b-96a5-47d9-8689-e0b4b2997681	1a82d527-8f50-490d-98a5-80783576d5c5	Ticket submitted - Ledyin	04/05/2020 07:56	SYSTEM	\N	\N
6c4bc751-a955-4caa-a81d-39b739d8775b	b6a863c0-0391-4bbe-8369-e3df6b707678	Ticket approved - Frank	04/05/2020 07:58	SYSTEM	\N	\N
feaf424a-02a3-461d-ac22-76d8321a86fe	b6a863c0-0391-4bbe-8369-e3df6b707678	Ticket completed - Frank	04/05/2020 07:58	SYSTEM	\N	\N
ba5b80f1-0852-4b5f-b2c8-a27ff73be372	b58d726a-9ea1-44e9-88d6-424bcdad418e	Ticket approved - Frank	04/05/2020 08:10	SYSTEM	\N	\N
1ec1de72-ea7d-42ba-b879-ab33d4bc04db	b1cef55a-6233-4554-a6ea-16fb639dc0dc	Ticket submitted - Emma	04/05/2020 08:15	SYSTEM	\N	\N
3cf28440-8f37-4215-a77a-23c1ca06f82e	20dc9d33-2ccb-40f5-b4ed-e7108b27fe8a	Ticket approved - Frank	04/05/2020 08:21	SYSTEM	\N	\N
5e67c232-9bde-4f4b-ab74-882a5e2b3fd8	b1cef55a-6233-4554-a6ea-16fb639dc0dc	Ticket approved - Cowdog	04/05/2020 08:24	SYSTEM	\N	\N
1f96255a-82b1-4229-965f-c903221a3319	20dc9d33-2ccb-40f5-b4ed-e7108b27fe8a	cannot find xplaydeadx or XPlayDeadX#2204 in the patreon list. Looked back to June 2019 which is the first time XPlayDeadX#2204 was seen on our cluster. contacted on discord for precision.	04/05/2020 08:30	Frank	138791132430729217	t
4a355b65-384f-482f-b313-7a58787abd0c	b58d726a-9ea1-44e9-88d6-424bcdad418e	no storage, no pin, ccc positions outside his base with no storage in sight\r\ndmed :you element request ticket is incomplete. Dm me with the ccc for a storage with a pin code. thx !	04/05/2020 08:31	Frank	138791132430729217	\N
6e682101-5a09-47cb-86e9-5f1cdda2e899	b7d3f861-6f16-4fa0-a1c4-e24e1ee612ef	Ticket approved - Frank	04/05/2020 08:36	SYSTEM	\N	\N
2c129e03-3373-4dac-99a8-578158137ec3	86a4a479-546a-46e8-b3c8-b7676efe792f	Ticket submitted - Jez	04/05/2020 08:38	SYSTEM	\N	\N
e1fffcd5-c023-4167-8620-070a05ece595	b7d3f861-6f16-4fa0-a1c4-e24e1ee612ef	Ticket cancelled for reason:   - Borealis	04/05/2020 08:39	SYSTEM	\N	\N
6058d811-8de2-4dfa-b1c1-f1e83bba64ec	312a041a-4987-4764-a31a-8a8ba361207c	Ticket approved - Frank	04/05/2020 08:40	SYSTEM	\N	\N
faa9764d-2ac8-469b-9ede-a9b47c695044	312a041a-4987-4764-a31a-8a8ba361207c	Ticket completed - Frank	04/05/2020 08:49	SYSTEM	\N	\N
cc95568a-7756-4723-aebf-ab6a8a9a42dd	5978023c-4bf1-401c-9bcf-52327a135479	Ticket approved - Frank	04/05/2020 08:57	SYSTEM	\N	\N
da7bfdba-b6bf-48ae-847b-d467d8e461b9	5978023c-4bf1-401c-9bcf-52327a135479	Ticket completed - Frank	04/05/2020 08:57	SYSTEM	\N	\N
78f00ad5-e387-4698-b978-d48ac257adf5	5ab40a7c-7069-4eb4-8553-ff298bb33cf8	Ticket submitted - bobbbawatts	04/05/2020 09:01	SYSTEM	\N	\N
8a486900-9a3d-45e9-8dbd-df2ecb0bbf0a	4334821f-eac4-486d-a55d-6602ad0d5c24	Ticket submitted - bobbbawatts	04/05/2020 09:02	SYSTEM	\N	\N
1c84f7ae-657b-4cb5-898a-595d40766ba7	ee1b7155-e367-4f3c-8ef3-0328f598ab48	Ticket approved - Frank	04/05/2020 09:04	SYSTEM	\N	\N
4fd8326d-820b-401b-9e8a-380cada8e191	ee1b7155-e367-4f3c-8ef3-0328f598ab48	patreon and element request on #13 genesis will be completed starting tuesday when the server goes public.	04/05/2020 09:05	Frank	138791132430729217	\N
d504c4de-0b23-4c00-852a-68ac53558b44	86a4a479-546a-46e8-b3c8-b7676efe792f	Ticket approved - Frank	04/05/2020 09:13	SYSTEM	\N	\N
43c8f66e-f0d5-4151-95e1-7d0edd85e908	a16efaee-2ed8-4b91-9fe3-c8d3ca52fce3	Ticket approved - ShiftyG	04/05/2020 09:14	SYSTEM	\N	\N
3bb1ec87-4652-40d6-80c6-1703a3e50683	b1cef55a-6233-4554-a6ea-16fb639dc0dc	Ticket completed - Cowdog	04/05/2020 09:21	SYSTEM	\N	\N
00611f12-5be7-4d00-8527-96ef7f48a15a	a16efaee-2ed8-4b91-9fe3-c8d3ca52fce3	Ticket completed - ShiftyG	04/05/2020 09:22	SYSTEM	\N	\N
22db11c3-d02f-4262-bba9-68bb98638a14	1a82d527-8f50-490d-98a5-80783576d5c5	Ticket approved - ShiftyG	04/05/2020 09:23	SYSTEM	\N	\N
63c8acf2-d203-4cc1-828e-567b200a6df8	86a4a479-546a-46e8-b3c8-b7676efe792f	Ticket completed - Frank	04/05/2020 09:25	SYSTEM	\N	\N
5e831882-29e4-4ec8-b5dd-f999c3112a95	1a82d527-8f50-490d-98a5-80783576d5c5	F Quetz | 11842288266587944	04/05/2020 09:42	ShiftyG	421143819518476299	\N
bb28d1bc-0f1b-4ab3-b156-ee496e885f57	1a82d527-8f50-490d-98a5-80783576d5c5	Ticket completed - ShiftyG	04/05/2020 09:43	SYSTEM	\N	\N
78a2d43f-1265-49bc-9fa7-7dff315b6877	d78d0de2-1032-42a7-9428-5ad575bf5104	Ticket submitted - Griz	04/05/2020 09:52	SYSTEM	\N	\N
e4422b12-4ebf-43ea-bca5-a637790a1826	ee1b7155-e367-4f3c-8ef3-0328f598ab48	sounds good, thanks	04/05/2020 10:13	ItsYaBoiLawdy	386226755075047425	\N
bfd3f168-1d45-42eb-8258-4e8b7c24c65a	f2ad8d44-e255-4dfd-878f-263fb7c2ee8b	Ticket approved - BeOurGuest	04/05/2020 10:36	SYSTEM	\N	\N
1975b1ec-033a-45a5-ba9f-c230be32470e	6cde407a-b7d4-4aeb-9009-73d2efe447e1	Ticket submitted - Milkman1546	04/05/2020 10:42	SYSTEM	\N	\N
000fd71f-2fd8-4daf-8a01-f5bae7511e04	f2ad8d44-e255-4dfd-878f-263fb7c2ee8b	Ticket cancelled for reason:   - BeOurGuest	04/05/2020 10:47	SYSTEM	\N	\N
4ca81a8f-50b9-4c39-8701-ee69d7a94908	030f775c-a527-4ebd-8b5c-4783c85ac420	Ticket submitted - undefined	04/05/2020 11:53	SYSTEM	\N	\N
bb56256e-66dd-4a72-9a7f-1d736d733b86	030f775c-a527-4ebd-8b5c-4783c85ac420	Ticket cancelled for reason:  Not enough needed info. Switch to a pat dino request ticket and resubmit to get all the info to us. - BeOurGuest	04/05/2020 12:11	SYSTEM	\N	\N
dd18b8fa-2c2c-4612-acc8-dd845e65f1c4	272510b7-ef2d-493c-8798-b71cc4dc6196	Ticket submitted - Kolobok	04/05/2020 12:32	SYSTEM	\N	\N
86e15892-7123-401d-8eb6-f453e9a433e8	7b29c327-8fbe-4fbb-8332-325e734a835a	Ticket submitted - Bass & Gizmo	04/05/2020 13:40	SYSTEM	\N	\N
06abb405-414f-4c01-bfa6-42bef6c173ed	20dc9d33-2ccb-40f5-b4ed-e7108b27fe8a	Ticket completed - Frank	04/05/2020 14:02	SYSTEM	\N	\N
6d3a8ffb-f4f9-4dca-8d29-95839eb4e0fb	5c4d7fe5-3e5b-4534-99cf-193bb56bf5ad	Ticket submitted - -Ami-	04/05/2020 14:11	SYSTEM	\N	\N
7baf09d2-e8a1-44e3-ab89-5c0564ec8d40	0d26d816-7456-480c-9a97-7aa26acca965	Ticket submitted - Bass & Gizmo	04/05/2020 14:41	SYSTEM	\N	\N
8a2d020d-c85c-4624-a24d-7ec0b9672619	7174325e-2f49-435e-b8b1-8fcddde6f06e	Ticket submitted - Baxlelo	04/05/2020 15:23	SYSTEM	\N	\N
5c08da0b-2c89-4a03-986e-f197ce018097	f204e520-b7ab-44fe-b1f2-46c71b7a292d	Ticket submitted - teamwolfe19	04/05/2020 15:25	SYSTEM	\N	\N
5a8ffa9e-2e47-4d75-8845-0a2a9447ee19	9ab9665b-7fd5-4224-bc85-bd2489fc7e6f	Ticket submitted - ItsmeSatan	04/05/2020 18:19	SYSTEM	\N	\N
a39092e3-0150-4a4b-b898-b7dd0bd289e5	7174325e-2f49-435e-b8b1-8fcddde6f06e	Ticket approved - Zylana	04/06/2020 02:30	SYSTEM	\N	\N
8a12878d-4448-4710-900d-235122472476	7174325e-2f49-435e-b8b1-8fcddde6f06e	Ticket cancelled for reason:  No pin and locked box at ccc. Asking him to redo. - Zylana	04/06/2020 02:38	SYSTEM	\N	\N
76a22a8c-38f7-442e-9d8e-d601b23396bf	7b29c327-8fbe-4fbb-8332-325e734a835a	Ticket approved - Zylana	04/06/2020 02:40	SYSTEM	\N	\N
5f51cc51-1a37-4b21-9fb4-e1324d77e666	9ab9665b-7fd5-4224-bc85-bd2489fc7e6f	Ticket approved - Zylana	04/06/2020 02:41	SYSTEM	\N	\N
7ee7b07f-bfe7-4224-8ac0-dc35cb7ac08e	9ab9665b-7fd5-4224-bc85-bd2489fc7e6f	Ticket completed - Zylana	04/06/2020 02:52	SYSTEM	\N	\N
78c1ea09-8d80-4700-88bb-09097e257bed	4334821f-eac4-486d-a55d-6602ad0d5c24	Ticket cancelled for reason:  need to redo ticket to add pin code - bobbbawatts	04/06/2020 07:12	SYSTEM	\N	\N
26fb0a9b-c583-426c-a2f5-4148c0d43361	0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	Ticket submitted - bobbbawatts	04/06/2020 07:15	SYSTEM	\N	\N
7e0f9f8f-d154-4491-9728-304456176208	5ab40a7c-7069-4eb4-8553-ff298bb33cf8	Ticket cancelled for reason:  redoing ticket to add pin code\r\n - bobbbawatts	04/06/2020 07:16	SYSTEM	\N	\N
83902e2e-e708-43d7-bae7-dc2b3500143d	0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	pat dino for march 2019	04/06/2020 07:17	bobbbawatts	450008032416366594	\N
8a27415b-0494-4042-bc97-694eae101ab3	dcaf5b2c-46b9-40da-a1c3-b56b510c87e3	Ticket submitted - ShiftyG	04/06/2020 07:20	SYSTEM	\N	\N
26f31943-03a4-4e61-8259-ece31617f218	a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	Ticket submitted - bobbbawatts	04/06/2020 07:20	SYSTEM	\N	\N
e76d2d76-e3c8-4c37-ae19-884a340e50ea	a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	pat dino for april 2019	04/06/2020 07:21	bobbbawatts	450008032416366594	\N
49cb698f-2e98-4d05-9d0d-f3c1136d4ac6	b86d836c-7b3f-4535-8d20-df82c0082692	Ticket submitted - bobbbawatts	04/06/2020 07:22	SYSTEM	\N	\N
3bfe318b-7cc7-4dc3-a007-2e26b2438691	dcaf5b2c-46b9-40da-a1c3-b56b510c87e3	Sorry about that. I forgot to include my cc when submitting the ticket. here is my cc: 1111111111111111111	04/06/2020 07:22	ShiftyG	421143819518476299	\N
532fec1e-1f3f-43c6-82e4-7f58005567cf	b86d836c-7b3f-4535-8d20-df82c0082692	pat dino for march 2020	04/06/2020 07:23	bobbbawatts	450008032416366594	\N
a4c38507-be24-422d-8309-b57a854bb6f1	86a7820a-6024-49d9-bed6-5b4380141114	Ticket submitted - bobbbawatts	04/06/2020 07:25	SYSTEM	\N	\N
ad4eff7e-d72e-48c4-864e-da13115c71df	86a7820a-6024-49d9-bed6-5b4380141114	pat dino for april 2020	04/06/2020 07:25	bobbbawatts	450008032416366594	\N
999d6e75-d4a4-4def-bd59-ac662b47ec19	dcaf5b2c-46b9-40da-a1c3-b56b510c87e3	Ticket approved - ShiftyG	04/06/2020 07:25	SYSTEM	\N	\N
10754d64-0b0a-4080-b204-f223697ae66b	dcaf5b2c-46b9-40da-a1c3-b56b510c87e3	Ticket cancelled for reason:  Shifty is a n00b - ShiftyG	04/06/2020 07:28	SYSTEM	\N	\N
8002fbf9-d98c-436b-b171-0a693522accb	a9d54754-9f43-43bc-b0a4-5d40019a5ae0	Ticket submitted - bobbbawatts	04/06/2020 07:29	SYSTEM	\N	\N
7dd4868a-38d9-434b-b02b-84ed105f99c0	b86d836c-7b3f-4535-8d20-df82c0082692	Ticket cancelled for reason:  dont have the saddle engram unlocked yet - bobbbawatts	04/06/2020 07:41	SYSTEM	\N	\N
39fe83ef-4cfb-46fd-8564-f735d29a7226	5c4d7fe5-3e5b-4534-99cf-193bb56bf5ad	Ticket approved - ShiftyG	04/06/2020 07:43	SYSTEM	\N	\N
4f0f0b2b-92d0-42f5-bf27-ea005ea8438a	5c4d7fe5-3e5b-4534-99cf-193bb56bf5ad	Could not complete drop off. No pin coded storage provided to put dino in. https://i.gyazo.com/f8e146f673350526a2324c81642efaee.jpg	04/06/2020 07:56	ShiftyG	421143819518476299	\N
36f5edbe-2a86-4bea-bdf7-5e241d068b97	5c4d7fe5-3e5b-4534-99cf-193bb56bf5ad	Ticket completed - ShiftyG	04/06/2020 08:10	SYSTEM	\N	\N
0ac38b8e-58f7-4fa9-8c03-00fd93fe0963	d78d0de2-1032-42a7-9428-5ad575bf5104	Ticket approved - ShiftyG	04/06/2020 08:11	SYSTEM	\N	\N
7ee5ea92-d3ef-459b-b597-3ad8ff9f27ee	d78d0de2-1032-42a7-9428-5ad575bf5104	Ticket completed - ShiftyG	04/06/2020 08:29	SYSTEM	\N	\N
62d5e71f-0ba1-41ab-b7c7-5ebfe0a27775	6cde407a-b7d4-4aeb-9009-73d2efe447e1	Ticket approved - ShiftyG	04/06/2020 08:29	SYSTEM	\N	\N
4c64db36-c5d5-4b10-adda-2366fae2430a	6cde407a-b7d4-4aeb-9009-73d2efe447e1	Ticket completed - ShiftyG	04/06/2020 08:58	SYSTEM	\N	\N
3eeb07be-1888-47e5-bb89-0327e7906f88	272510b7-ef2d-493c-8798-b71cc4dc6196	Ticket approved - ShiftyG	04/06/2020 08:59	SYSTEM	\N	\N
26acc2e0-daae-42e1-8a75-cef3d0be0095	5634d45e-9261-4213-8a5f-070c5dc7454b	Ticket submitted - Exstila	04/06/2020 10:06	SYSTEM	\N	\N
dcf79479-2744-4fc8-86b8-49f6adb9671f	94385874-6666-4d90-b4f7-4f6caedd1abb	Ticket submitted - Rock	04/06/2020 11:46	SYSTEM	\N	\N
c8ba5424-f668-4702-a01a-5d1e49a8dd4c	5634d45e-9261-4213-8a5f-070c5dc7454b	Ticket cancelled for reason:   - Staurophobic	04/06/2020 15:09	SYSTEM	\N	\N
ff2ed74c-f017-4098-b044-4a16dd205083	94385874-6666-4d90-b4f7-4f6caedd1abb	Ticket approved - Staurophobic	04/06/2020 15:11	SYSTEM	\N	\N
1bce694a-5f5c-4a65-b52e-4b9f0e1abaf2	4b89f88c-4b67-4cd9-97d4-c861644fdedc	Ticket submitted - Exstila	04/06/2020 15:29	SYSTEM	\N	\N
cc7ab97d-e089-4710-86ab-40d5b6a8db08	66938900-27c3-432b-8b9e-8b672822345c	Ticket submitted - XxFrostbitexX	04/06/2020 16:54	SYSTEM	\N	\N
a20052ea-bfdb-488b-9e7c-6b442eaeebd4	444e8f88-f015-4c66-9a72-cc86e70e55b1	Ticket submitted - XxFrostbitexX	04/06/2020 16:55	SYSTEM	\N	\N
777cb9cf-7652-49e0-9f57-83a3d57423af	af41c3b0-3f64-4b97-8105-6cacd61ec17b	Ticket submitted - XxFrostbitexX	04/06/2020 16:56	SYSTEM	\N	\N
a1448265-e4a5-4f68-9758-28dd25e0afe8	7d7e7593-4ed9-4617-8654-e5af39bb5e4a	Ticket submitted - XxFrostbitexX	04/06/2020 16:56	SYSTEM	\N	\N
25c283e2-5d67-4761-af0e-5176751452c5	7d7e7593-4ed9-4617-8654-e5af39bb5e4a	Ticket approved - Zylana	04/06/2020 16:57	SYSTEM	\N	\N
62330061-b292-4fe1-a43b-80a7efc2e26a	444e8f88-f015-4c66-9a72-cc86e70e55b1	Ticket approved - Zylana	04/06/2020 16:57	SYSTEM	\N	\N
7914116e-b75c-4bf3-9d91-1a484597885b	66938900-27c3-432b-8b9e-8b672822345c	Ticket approved - Zylana	04/06/2020 17:03	SYSTEM	\N	\N
0017745e-3c48-4c1b-b134-26a4bb10a18e	af41c3b0-3f64-4b97-8105-6cacd61ec17b	Ticket approved - Zylana	04/06/2020 17:04	SYSTEM	\N	\N
8d6f094a-7879-48a1-bd02-d72be47b0d99	f204e520-b7ab-44fe-b1f2-46c71b7a292d	Ticket approved - Frank	04/06/2020 17:06	SYSTEM	\N	\N
6cd0338d-6fe3-408d-847d-9941d0bfca5a	af41c3b0-3f64-4b97-8105-6cacd61ec17b	Ticket completed - Zylana	04/06/2020 17:15	SYSTEM	\N	\N
cfcc3afc-cf24-444c-ac86-3edbb5428d6e	7d7e7593-4ed9-4617-8654-e5af39bb5e4a	Ticket completed - Zylana	04/06/2020 17:15	SYSTEM	\N	\N
f9c41bdf-04f8-472e-b521-af9e7332ca7e	444e8f88-f015-4c66-9a72-cc86e70e55b1	Ticket completed - Zylana	04/06/2020 17:15	SYSTEM	\N	\N
0b8a3d89-85a0-48d9-9809-727f8993e6bb	66938900-27c3-432b-8b9e-8b672822345c	Ticket completed - Zylana	04/06/2020 17:15	SYSTEM	\N	\N
4d92a2a1-846e-487c-95ae-2aa7fcb308df	4b89f88c-4b67-4cd9-97d4-c861644fdedc	Ticket approved - Zylana	04/06/2020 17:18	SYSTEM	\N	\N
7dbaf8b9-35c1-4f13-8d6b-f3aa0632e3f6	f204e520-b7ab-44fe-b1f2-46c71b7a292d	Ticket completed - Frank	04/06/2020 17:18	SYSTEM	\N	\N
6a8851f0-191a-476d-af9b-3c84c4d4f99a	0d26d816-7456-480c-9a97-7aa26acca965	Ticket approved - Frank	04/06/2020 17:18	SYSTEM	\N	\N
67991a86-736c-4e5c-88c1-d103c62c5910	a9d54754-9f43-43bc-b0a4-5d40019a5ae0	Ticket approved - Cowdog	04/06/2020 17:23	SYSTEM	\N	\N
ea98b79d-0620-472d-8bef-1f624d2f5060	a9d54754-9f43-43bc-b0a4-5d40019a5ae0	holding as pat dinos & ele are not allowed until Tues 7th at 8 am EST.	04/06/2020 17:23	Cowdog	296021653391933440	\N
3a1f6957-9368-490f-9f10-6fcad108b96f	0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	holding as pat dinos & ele are not allowed until Tues 7th at 8 am EST.	04/06/2020 17:23	Cowdog	296021653391933440	\N
f51c448e-150c-4348-aa62-8c6d378b22e3	0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	Ticket approved - Cowdog	04/06/2020 17:23	SYSTEM	\N	\N
6eed21ae-5821-4f51-9551-283007024bdf	a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	Ticket approved - Cowdog	04/06/2020 17:24	SYSTEM	\N	\N
9bd34494-45df-4342-bd0c-f74901ae9df2	a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	holding as pat dinos & ele are not allowed until Tues 7th at 8 am EST.	04/06/2020 17:24	Cowdog	296021653391933440	\N
4e0fbede-21df-4dc1-b51d-1556601b3eb1	86a7820a-6024-49d9-bed6-5b4380141114	Ticket approved - Cowdog	04/06/2020 17:24	SYSTEM	\N	\N
d8aa8686-5504-4d00-a659-39c9864227d8	86a7820a-6024-49d9-bed6-5b4380141114	holding as pat dinos & ele are not allowed until Tues 7th at 8 am EST.	04/06/2020 17:24	Cowdog	296021653391933440	\N
093644e3-78f9-4876-9fac-4a1a8a290d84	0d26d816-7456-480c-9a97-7aa26acca965	Ticket completed - Frank	04/06/2020 17:27	SYSTEM	\N	\N
8667442d-d8fa-4b5f-b7ad-fe45891ded21	4b89f88c-4b67-4cd9-97d4-c861644fdedc	Ticket completed - Zylana	04/06/2020 17:37	SYSTEM	\N	\N
00c055be-fe17-4b75-8e67-65ecc6577e57	a888855e-fc0c-44a5-add2-45a6d8cc1591	Ticket submitted - Undeadtank	04/06/2020 17:44	SYSTEM	\N	\N
a56aa040-e4d4-4633-b5c4-bea85ac3213f	a888855e-fc0c-44a5-add2-45a6d8cc1591	Ticket approved - Frank	04/06/2020 17:46	SYSTEM	\N	\N
8024b237-9452-489e-9e5b-5996b1135064	a888855e-fc0c-44a5-add2-45a6d8cc1591	Ticket cancelled for reason:  Nothing on the website, nothing in the logs. Nothing we can do. - Frank	04/06/2020 17:49	SYSTEM	\N	\N
8cf1283f-65b1-4713-a110-7b0d4eb8ee8e	a888855e-fc0c-44a5-add2-45a6d8cc1591	Tribe Tribe of UndeadTank, ID 1228508210: Day 12032, 03:36:54: Tek Parasaur - Lvl 212 (Tek Parasaur) starved to death!)	04/06/2020 17:53	Frank	138791132430729217	\N
de233f27-e43e-4b5d-8e5e-cb6a65ca2f84	9ee40cf8-d944-4e9f-90fe-c2e265b6733a	Ticket submitted - undefined	04/06/2020 18:06	SYSTEM	\N	\N
d6dd60ab-6246-4d24-9ec7-fb731a89d24b	9ee40cf8-d944-4e9f-90fe-c2e265b6733a	Ticket approved - Zylana	04/06/2020 18:08	SYSTEM	\N	\N
32d1cbb4-b9b7-4c45-ba48-31b443a07c26	9ee40cf8-d944-4e9f-90fe-c2e265b6733a	Ticket cancelled for reason:  Tribe leader hasn't been offline for too long. Need written permission to be able to provide this service. \r\n - Zylana	04/06/2020 18:08	SYSTEM	\N	\N
41d64054-8a50-4527-8318-93cde2ca1c06	924a385a-d1fb-4017-9c3d-a1428f26f5a4	Ticket submitted - Tharan	04/06/2020 18:41	SYSTEM	\N	\N
f9cf135e-3609-4aa2-ac8a-415f13c4534c	761313b4-1ce5-4694-8e79-f5a0a6363438	Ticket submitted - leGit510	04/06/2020 19:03	SYSTEM	\N	\N
188a9bea-c61f-4538-88e6-5ed5ba1bf92b	0d26d816-7456-480c-9a97-7aa26acca965	2nd Storage on the roof, in the thatch shack, storage is named Struggler, pin code 2427	04/06/2020 19:04	Bass & Gizmo	277855875861970945	\N
543b8545-e4f4-4ba6-b3c6-f051ef988c2c	272510b7-ef2d-493c-8798-b71cc4dc6196	Ticket completed - ShiftyG	04/07/2020 02:00	SYSTEM	\N	\N
19a4f886-e9f6-4ce4-bc20-eded5a89bdd4	761313b4-1ce5-4694-8e79-f5a0a6363438	Ticket approved - ShiftyG	04/07/2020 02:07	SYSTEM	\N	\N
e4c0e17b-e196-4a3c-92d2-99d51ba6bb19	761313b4-1ce5-4694-8e79-f5a0a6363438	Ticket completed - ShiftyG	04/07/2020 03:01	SYSTEM	\N	\N
64ba8f27-45d3-4779-9cb0-3e46c6df9230	ee1b7155-e367-4f3c-8ef3-0328f598ab48	Ticket completed - Frank	04/07/2020 05:13	SYSTEM	\N	\N
d91b2fd2-f600-43d3-a517-08dc5e9d9b2e	86a7820a-6024-49d9-bed6-5b4380141114	Ticket completed - Frank	04/07/2020 05:28	SYSTEM	\N	\N
e8ddf942-343a-43a8-9578-1c4550d13901	a9d54754-9f43-43bc-b0a4-5d40019a5ae0	Ticket completed - Frank	04/07/2020 05:30	SYSTEM	\N	\N
5d0e9e3c-aa5f-4d03-9b92-a5e0bc320a66	0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	8:30 AM] Frank: You requested two magmasaur with custom colors for your pat dinos\r\n[8:31 AM] Frank: unfortunately, at the moment you cannot neuter or spay magmasaurs. I don't know if it's a bug or a desired mechanics\r\n[8:31 AM] Frank: and by the admin rules, I cannot deliver a patreon dino with custom colors unless it is clipped\r\n[8:32 AM] bobbbawatts: Oh I didn't know they could even breed but normal colors are fine	04/07/2020 05:32	Frank	138791132430729217	\N
89fdb672-de83-4969-9ef2-f451f4863fa3	a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	8:30 AM] Frank: You requested two magmasaur with custom colors for your pat dinos\r\n[8:31 AM] Frank: unfortunately, at the moment you cannot neuter or spay magmasaurs. I don't know if it's a bug or a desired mechanics\r\n[8:31 AM] Frank: and by the admin rules, I cannot deliver a patreon dino with custom colors unless it is clipped\r\n[8:32 AM] bobbbawatts: Oh I didn't know they could even breed but normal colors are fine	04/07/2020 05:33	Frank	138791132430729217	\N
7495476d-c710-423c-9302-ab4966a2ab9c	0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	Ticket completed - Frank	04/07/2020 05:38	SYSTEM	\N	\N
d69d9f53-b379-45e9-b9b6-a96ff9b47b6a	a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	Ticket completed - Frank	04/07/2020 05:38	SYSTEM	\N	\N
43c1d23e-66ae-465e-ae89-0bad7fed244c	924a385a-d1fb-4017-9c3d-a1428f26f5a4	Ticket approved - Frank	04/07/2020 05:46	SYSTEM	\N	\N
20f39289-34e4-44e9-a888-76006cade936	924a385a-d1fb-4017-9c3d-a1428f26f5a4	Hey Tharan, I'm sure we can find a window between two server restarts for you to get your stuff off our patreon servers. Dm an admin when you're available and we will a way to make it work	04/07/2020 06:11	Frank	138791132430729217	\N
39d77f9f-f48f-4cd5-ba82-4d800eca1658	5cdd06c4-0a16-45ca-9755-8d01b058a066	Ticket submitted - Micro	04/07/2020 09:09	SYSTEM	\N	\N
d1841765-fd48-46e5-a91f-bb8be61dfdcf	9e12d4d5-c36d-4def-925e-a90ef1c71ec7	Ticket submitted - Kdmman2	04/07/2020 10:35	SYSTEM	\N	\N
0f72685f-8f89-4e74-bf44-938cd2051703	102ed8d0-3fec-467b-b2a6-c9eb549f8e9f	Ticket submitted - undefined	04/07/2020 11:09	SYSTEM	\N	\N
65d82be6-e027-40f7-a937-c53fd1e4e5e0	c85ee9ee-e85b-4968-9ca2-1ca30786147a	Ticket submitted - ♛Queenie♛	04/07/2020 11:58	SYSTEM	\N	\N
4f8dd3ed-4bcc-44da-9c41-02250c1ebe73	9c22d016-6d40-477e-8d11-bbd5d209fc67	Ticket submitted - Makadina	04/07/2020 16:15	SYSTEM	\N	\N
8dfbf0f0-6fad-4ad2-bd78-e329394aa9a4	326253a8-3838-48c3-8a4d-cd5808db9750	Ticket submitted - Makadina	04/07/2020 16:56	SYSTEM	\N	\N
2741e0de-7e59-458b-be2f-2c748a24d83b	3f10a732-4901-4cd6-a5ec-18a961e12a26	Ticket submitted - Makadina	04/07/2020 16:57	SYSTEM	\N	\N
797a724f-29d6-4375-8248-6be7c9efeff7	ac4aefd2-9f48-43a8-a066-0197f21168e0	Ticket submitted - Makadina	04/07/2020 17:01	SYSTEM	\N	\N
bcafec11-db3b-4978-8458-202fe700c081	113c5580-db6b-43b3-babf-f92bdbcf47e3	Ticket submitted - Makadina	04/07/2020 17:02	SYSTEM	\N	\N
05d26a8e-2fa4-41f0-a8c0-6f77c63393f6	b58d726a-9ea1-44e9-88d6-424bcdad418e	6:21 PM] Baxlelo: -335530 -448784 -12274 -87.98 -4.14                            pin @ storage 1791	04/07/2020 18:12	Frank	138791132430729217	\N
c993e65b-9313-4162-b2df-b4855cd3ab7e	924a385a-d1fb-4017-9c3d-a1428f26f5a4	Ticket completed - Frank	04/07/2020 18:16	SYSTEM	\N	\N
3b15fbd7-8cb4-44ec-a98f-047f8733eee8	5cdd06c4-0a16-45ca-9755-8d01b058a066	Ticket approved - Ford	04/08/2020 04:54	SYSTEM	\N	\N
4a61507f-881e-4f76-b7e2-575cbf58146a	5cdd06c4-0a16-45ca-9755-8d01b058a066	Ticket completed - Ford	04/08/2020 05:13	SYSTEM	\N	\N
da2dc233-856d-4a76-8894-c001fbddc625	1b738a5c-3973-424f-82ea-f4a4911666b7	Ticket submitted - SquoxQueen	04/08/2020 12:19	SYSTEM	\N	\N
1456ae5d-517b-43ff-97c0-97dd5bac1528	11c21efb-0b26-4ab4-bd5f-bac5b3a60589	Ticket submitted - CubanDruglord	04/08/2020 12:35	SYSTEM	\N	\N
24bc7c6f-616b-4bc0-bb2c-fbc99043f65e	524eb0de-6756-4562-aba3-1234ea90a5d3	Ticket submitted - undefined	04/08/2020 15:15	SYSTEM	\N	\N
aac935f4-07d9-4cd4-9871-3bdff16e14ce	524eb0de-6756-4562-aba3-1234ea90a5d3	Ticket approved - Zylana	04/08/2020 15:18	SYSTEM	\N	\N
1447d885-4f5d-4255-af8f-192b14270296	524eb0de-6756-4562-aba3-1234ea90a5d3	Ticket completed - BeOurGuest	04/08/2020 15:23	SYSTEM	\N	\N
46f9306b-b46e-48e9-b471-27ecbc972608	f463670a-c769-4da8-84ef-9656e12c9d30	Ticket submitted - Mayhem	04/08/2020 17:25	SYSTEM	\N	\N
f976b20c-48b5-4a02-9870-5cbcf8cf0b60	f463670a-c769-4da8-84ef-9656e12c9d30	Tek Replicator     pin 1337	04/08/2020 17:26	Mayhem	182312057306218496	\N
32a4ef7b-2127-4f63-bee9-410c496a031b	67b8d824-e5fb-4646-b615-70a9f5482d9b	Ticket submitted - ♛Queenie♛	04/08/2020 17:35	SYSTEM	\N	\N
fa90e987-25e3-415d-a69a-eeae5042f0ae	102ed8d0-3fec-467b-b2a6-c9eb549f8e9f	Ticket approved - BeOurGuest	04/08/2020 17:48	SYSTEM	\N	\N
8318b2a8-cf09-4495-8cc3-becf0f501ea9	102ed8d0-3fec-467b-b2a6-c9eb549f8e9f	Ticket completed - BeOurGuest	04/08/2020 17:57	SYSTEM	\N	\N
0a912d98-cc50-4641-8ea0-c6fcaea40f5c	1b738a5c-3973-424f-82ea-f4a4911666b7	Ticket cancelled for reason:  Bases refreshing is a pat perk, we can't provide it to other players. We suggest making a tek panic room inside your base somewhere with your important dinos cryo'd and your important items stored. Tek would only need to be refreshed every couple weeks and would be easier for you to keep up. - BeOurGuest	04/08/2020 18:18	SYSTEM	\N	\N
ac52f956-7e08-497f-a68a-cce216219dd4	972c40ad-56b1-4a9a-8da2-77bfc183a7c0	Ticket submitted - cursedcat	04/08/2020 19:38	SYSTEM	\N	\N
fba34425-1743-4df9-bd97-1bbf3416e2a3	6b548f57-0c8d-4a91-88c5-4f4d1e3dd96b	Ticket submitted - cursedcat	04/08/2020 19:43	SYSTEM	\N	\N
df84bb31-8a03-4ed2-86cb-9d1b380cc109	67b8d824-e5fb-4646-b615-70a9f5482d9b	Ticket approved - Ford	04/09/2020 02:59	SYSTEM	\N	\N
e103a109-41e9-41f0-9210-4fa35737ea02	67b8d824-e5fb-4646-b615-70a9f5482d9b	Ticket completed - Ford	04/09/2020 03:24	SYSTEM	\N	\N
a6a4991f-1174-4171-ab05-704883036525	f463670a-c769-4da8-84ef-9656e12c9d30	Ticket approved - Ford	04/09/2020 03:27	SYSTEM	\N	\N
a509eb16-0784-4995-a2a4-fc245b68ab21	f463670a-c769-4da8-84ef-9656e12c9d30	Ticket completed - Ford	04/09/2020 03:34	SYSTEM	\N	\N
bc0ef90a-10f9-4b86-a39e-4ecbc1e3d661	11c21efb-0b26-4ab4-bd5f-bac5b3a60589	Ticket approved - Ford	04/09/2020 03:53	SYSTEM	\N	\N
9e8fdc79-bb69-4fae-b3cc-476648fa3a6d	11c21efb-0b26-4ab4-bd5f-bac5b3a60589	Ticket completed - Ford	04/09/2020 04:47	SYSTEM	\N	\N
d9b080d9-8c69-4c56-b959-627ef6ca6ba9	967e23cb-f7b9-4e69-85ca-16df907220be	Ticket submitted - Slams	04/09/2020 05:27	SYSTEM	\N	\N
901cf001-2e8d-40fe-9154-966b2401616b	d84490ff-5d8b-4be1-96cf-6b89550eb902	Ticket submitted - kit	04/09/2020 09:25	SYSTEM	\N	\N
acaafb1d-5ac7-4689-bfec-920082ff2e5e	c85ee9ee-e85b-4968-9ca2-1ca30786147a	CCC Changed: 58318 -356425 221 -159.33 -21.09	04/09/2020 09:35	♛Queenie♛	360603244956745729	\N
b243f5f2-f4a5-4803-a880-7b7c92caa490	d84490ff-5d8b-4be1-96cf-6b89550eb902	Ticket approved - ShiftyG	04/09/2020 14:19	SYSTEM	\N	\N
5b016104-90ca-4a0d-af7a-1ba534a2dd3b	abb170ea-1843-49af-80eb-f9bbaeab58b8	Ticket submitted - undefined	04/09/2020 14:34	SYSTEM	\N	\N
18a4b183-37e3-4593-ad9c-6f71991eb1f1	5456d281-6a74-4571-b14d-628bb861e5f1	Ticket submitted - undefined	04/09/2020 14:40	SYSTEM	\N	\N
e42f6f7f-c1ce-49c3-a977-705e146c858a	5456d281-6a74-4571-b14d-628bb861e5f1	Ticket cancelled for reason:  Double post - ShiftyG	04/09/2020 14:44	SYSTEM	\N	\N
2560e260-7711-4f3e-b980-43b92398b48c	c85ee9ee-e85b-4968-9ca2-1ca30786147a	Ticket cancelled for reason:   - ♛Queenie♛	04/09/2020 14:52	SYSTEM	\N	\N
eaba9f5d-fcc3-46a6-8487-8d9ff7193668	d84490ff-5d8b-4be1-96cf-6b89550eb902	Ticket completed - ShiftyG	04/09/2020 16:35	SYSTEM	\N	\N
b9752938-812d-4a57-bac2-140f02edacff	2ae05b10-2fde-4cdd-a1c2-e8941a9c6018	Ticket submitted - JCBBlueDevil	04/09/2020 16:38	SYSTEM	\N	\N
52daf1d8-c7d1-4a06-ab23-96986beff9aa	2ae05b10-2fde-4cdd-a1c2-e8941a9c6018	Ticket approved - Zylana	04/09/2020 17:13	SYSTEM	\N	\N
838556a2-8389-4e7a-b4e6-a95d898b569c	2ae05b10-2fde-4cdd-a1c2-e8941a9c6018	Ticket completed - Zylana	04/09/2020 17:14	SYSTEM	\N	\N
d350cb52-cf3f-405f-85fe-a69cd90b0a98	abb170ea-1843-49af-80eb-f9bbaeab58b8	Ticket approved - Zylana	04/09/2020 17:14	SYSTEM	\N	\N
f31f500e-533c-4843-a4c7-9d35952dd95f	abb170ea-1843-49af-80eb-f9bbaeab58b8	Ticket completed - Zylana	04/09/2020 18:37	SYSTEM	\N	\N
e79d7c81-44b3-4f9e-83cb-f62516a81af1	ab521026-d8bd-4596-a6bd-c151d9610fe4	Ticket submitted - shid	04/09/2020 21:56	SYSTEM	\N	\N
63583bf9-a8ae-47c9-b7a2-d7423191a03d	ab521026-d8bd-4596-a6bd-c151d9610fe4	Ticket approved - BeOurGuest	04/09/2020 22:35	SYSTEM	\N	\N
063698be-1765-49b2-8e02-e07eac4cfe6d	ab521026-d8bd-4596-a6bd-c151d9610fe4	Ticket completed - BeOurGuest	04/09/2020 22:58	SYSTEM	\N	\N
2ce627fa-7cec-44a4-93f8-d165a09b50fb	b68521cc-4853-4c82-af10-146e6182adac	Ticket submitted - prowaterbuffalo	04/10/2020 01:55	SYSTEM	\N	\N
331afc0c-593f-4d42-950d-5911d122360e	b5ec5a03-8d0a-4cce-a85e-5a32f3f3d74f	Ticket submitted - Ashalyn	04/10/2020 10:02	SYSTEM	\N	\N
2144738a-baaa-42dc-b4a9-8c05b853d33c	c2f8e851-5049-4558-9981-cb0f9699d002	Ticket submitted - WZK	04/10/2020 10:34	SYSTEM	\N	\N
0e7c4410-3f6f-488b-8ac9-f12bee03b6d8	c2f8e851-5049-4558-9981-cb0f9699d002	Ticket approved - Cowdog	04/10/2020 10:38	SYSTEM	\N	\N
9e50fb7c-b654-42e5-a4f2-a5e9cfee6276	c2f8e851-5049-4558-9981-cb0f9699d002	Sent DM to WZK for email verification, the email provided is not on our Patreon list.	04/10/2020 11:04	Cowdog	296021653391933440	\N
6f867edc-1648-4414-949d-d337640da409	9c22d016-6d40-477e-8d11-bbd5d209fc67	Ticket approved - Cowdog	04/10/2020 11:37	SYSTEM	\N	\N
34669fb1-838d-4d6e-8172-7ea5ae6c19cf	326253a8-3838-48c3-8a4d-cd5808db9750	Ticket approved - Cowdog	04/10/2020 11:45	SYSTEM	\N	\N
a82ebb52-5795-4615-8860-ee28927a766d	3f10a732-4901-4cd6-a5ec-18a961e12a26	Ticket approved - Cowdog	04/10/2020 11:49	SYSTEM	\N	\N
9dd5431c-0cbc-4c11-981f-12365aec7ca8	ac4aefd2-9f48-43a8-a066-0197f21168e0	Ticket approved - Cowdog	04/10/2020 11:56	SYSTEM	\N	\N
66fda092-ee59-4f05-8dd4-ee955c1b8481	113c5580-db6b-43b3-babf-f92bdbcf47e3	Ticket approved - Cowdog	04/10/2020 12:10	SYSTEM	\N	\N
aa704d2d-b1d8-40bf-aeb6-c3e6ef554fb1	66019a45-853a-4974-8408-ec1102936dc5	Ticket submitted - Ledyin	04/10/2020 12:11	SYSTEM	\N	\N
2b3b2a5a-33dc-41e2-8dbf-76485007463a	113c5580-db6b-43b3-babf-f92bdbcf47e3	Ticket cancelled for reason:  Cancelling ticket as Maka only had 4 Pat Dino request to fill and I've done 4.  I have dm'd her to advise me on what dinos she wants for her 4 requests. - Cowdog	04/10/2020 12:11	SYSTEM	\N	\N
63599a9b-5278-4ba0-ac5a-284ce363b957	ac4aefd2-9f48-43a8-a066-0197f21168e0	Filled ticket - waiting on confirmation from Maka to make sure this is what she wanted.  She only had 4 pat dinos available and she requested 5.	04/10/2020 12:14	Cowdog	296021653391933440	\N
6d73332e-009c-4221-ba5c-4faa45c27188	3f10a732-4901-4cd6-a5ec-18a961e12a26	Filled ticket - waiting on confirmation from Maka to make sure this is what she wanted.  She only had 4 pat dinos available and she requested 5.	04/10/2020 12:14	Cowdog	296021653391933440	\N
25cf3ac2-27c4-42d4-9f18-391b1fafa7f5	326253a8-3838-48c3-8a4d-cd5808db9750	Filled ticket - waiting on confirmation from Maka to make sure this is what she wanted.  She only had 4 pat dinos available and she requested 5.	04/10/2020 12:14	Cowdog	296021653391933440	\N
6567938b-99f1-43cd-9adc-0ddbb786a998	9c22d016-6d40-477e-8d11-bbd5d209fc67	Filled ticket - waiting on confirmation from Maka to make sure this is what she wanted.  She only had 4 pat dinos available and she requested 5.	04/10/2020 12:15	Cowdog	296021653391933440	\N
e7a5c31f-8fac-47bb-8f66-49592117b80e	9e12d4d5-c36d-4def-925e-a90ef1c71ec7	Ticket approved - Cowdog	04/10/2020 12:16	SYSTEM	\N	\N
9f274b70-18cf-4858-99ba-c854abba72bd	66019a45-853a-4974-8408-ec1102936dc5	Ticket cancelled for reason:  Fixed the issue myself ....now to replace a wall - Ledyin	04/10/2020 12:29	SYSTEM	\N	\N
1447e881-46a1-4c2b-a5c1-a7c86589309a	9e12d4d5-c36d-4def-925e-a90ef1c71ec7	Ticket completed - Cowdog	04/10/2020 12:45	SYSTEM	\N	\N
16220f86-e151-4933-980d-78e7ea569eb7	972c40ad-56b1-4a9a-8da2-77bfc183a7c0	Ticket approved - Cowdog	04/10/2020 12:51	SYSTEM	\N	\N
c1803f5e-b88c-4513-9510-1a90a87a8cab	6b548f57-0c8d-4a91-88c5-4f4d1e3dd96b	Ticket approved - Cowdog	04/10/2020 12:52	SYSTEM	\N	\N
aca550d4-e84c-465f-9d73-835ee6aacdad	6b548f57-0c8d-4a91-88c5-4f4d1e3dd96b	Ticket completed - Cowdog	04/10/2020 13:04	SYSTEM	\N	\N
30b2c72c-4038-4434-b488-581ed43aa930	972c40ad-56b1-4a9a-8da2-77bfc183a7c0	Ticket completed - Cowdog	04/10/2020 13:07	SYSTEM	\N	\N
71e1f1f0-ea17-48f4-84b7-cc41755fbac6	b68521cc-4853-4c82-af10-146e6182adac	Ticket approved - Cowdog	04/10/2020 13:12	SYSTEM	\N	\N
99455abc-9288-4e64-80fd-dc1939cda9f9	b68521cc-4853-4c82-af10-146e6182adac	Ticket completed - Cowdog	04/10/2020 13:36	SYSTEM	\N	\N
698ead2b-bd29-478f-b928-33113809e6bc	c2f8e851-5049-4558-9981-cb0f9699d002	WZK Just became a Patreon this morning - he/she will not be eligible until after May 1st for a Pat dino.	04/10/2020 13:44	Cowdog	296021653391933440	\N
9d548d2b-8eca-4c3f-ad22-6c5de3675757	c2f8e851-5049-4558-9981-cb0f9699d002	Ticket completed - Cowdog	04/10/2020 13:44	SYSTEM	\N	\N
83ab5ca2-5f7b-4b11-bbdb-f859a0d7b600	12e1817c-b0a0-4e24-94b3-2163a6bf3477	Ticket submitted - Tessa	04/10/2020 13:54	SYSTEM	\N	\N
d7d58b66-7b0a-4063-a7b6-acee1b9e24cc	497a5496-1390-4cda-9c65-77c279bd5a2f	Ticket submitted - bobbbawatts	04/10/2020 17:17	SYSTEM	\N	\N
b945ab30-0624-44a6-8e83-f57c58dc7e6a	ac4aefd2-9f48-43a8-a066-0197f21168e0	Ticket completed - Cowdog	04/10/2020 17:25	SYSTEM	\N	\N
dc193129-aa61-438a-a710-6a78aabbb566	3f10a732-4901-4cd6-a5ec-18a961e12a26	Ticket completed - Cowdog	04/10/2020 17:25	SYSTEM	\N	\N
1d683c24-2561-42ae-a6f4-3402d9d4603f	326253a8-3838-48c3-8a4d-cd5808db9750	Ticket completed - Cowdog	04/10/2020 17:25	SYSTEM	\N	\N
97c2f53d-a1e3-4e81-9201-bb4a839fb29f	9c22d016-6d40-477e-8d11-bbd5d209fc67	Ticket completed - Cowdog	04/10/2020 17:25	SYSTEM	\N	\N
e961d0a4-41e6-4ce0-b254-4ef2bdfef6f5	999c973b-65f1-4e84-898d-dde69a9429ad	Ticket submitted - bobbbawatts	04/10/2020 17:27	SYSTEM	\N	\N
a3685546-1e79-4658-9443-66f5fb6b43bc	4a3b58aa-bc69-4e35-a5c3-f184e775595c	Ticket submitted - Kitten	04/10/2020 18:15	SYSTEM	\N	\N
b690c760-3ab4-4f6c-9161-af71ed38e03c	4a3b58aa-bc69-4e35-a5c3-f184e775595c	Ticket approved - Frank	04/10/2020 18:18	SYSTEM	\N	\N
ba8aa4ab-b140-4330-aab0-513e516606ef	4a3b58aa-bc69-4e35-a5c3-f184e775595c	replaced :\r\n-rock drake base lv 45 100% imprint to  "Reaper843" 386305263\r\n-bulbdog base lv 142 wild	04/10/2020 18:19	Frank	138791132430729217	\N
c9eacd8d-8e53-4866-9694-b6cf149de022	4a3b58aa-bc69-4e35-a5c3-f184e775595c	Ticket completed - Frank	04/10/2020 18:19	SYSTEM	\N	\N
fab2a083-6669-4577-8825-475dbb4ff8fb	0d1093e4-1460-4546-9ecf-f785e4841eb7	Ticket submitted - WZK	04/10/2020 21:44	SYSTEM	\N	\N
80276c0a-73c7-462d-97ad-8560f2273111	c9a029aa-d396-467d-b412-eed505d7e863	Ticket submitted - Lobsterman	04/10/2020 22:06	SYSTEM	\N	\N
c63045c0-36a6-43b2-8865-00e1d072c78b	c9a029aa-d396-467d-b412-eed505d7e863	Ticket approved - BeOurGuest	04/10/2020 22:10	SYSTEM	\N	\N
2126e0f0-b4d7-465a-adc9-2a0ca6640207	c9a029aa-d396-467d-b412-eed505d7e863	Ticket completed - BeOurGuest	04/10/2020 22:16	SYSTEM	\N	\N
ee9f3128-b102-4086-92a8-b7c030c61c19	967e23cb-f7b9-4e69-85ca-16df907220be	Ticket approved - Frank	04/11/2020 03:09	SYSTEM	\N	\N
a43067c8-115b-4374-a033-b9ea81c51f66	967e23cb-f7b9-4e69-85ca-16df907220be	Ticket completed - Frank	04/11/2020 03:11	SYSTEM	\N	\N
a0239797-5606-4eb3-8d81-fe36889bd612	b5ec5a03-8d0a-4cce-a85e-5a32f3f3d74f	Ticket approved - Frank	04/11/2020 03:12	SYSTEM	\N	\N
cb90a5a5-d269-4f38-8443-b2ca5a180624	b5ec5a03-8d0a-4cce-a85e-5a32f3f3d74f	Ticket completed - Frank	04/11/2020 03:17	SYSTEM	\N	\N
0f472f91-4618-4775-9381-10bd130cf337	12e1817c-b0a0-4e24-94b3-2163a6bf3477	Ticket approved - Frank	04/11/2020 03:18	SYSTEM	\N	\N
1d4731eb-255a-4350-a2d3-ec57e15f3af8	12e1817c-b0a0-4e24-94b3-2163a6bf3477	Ticket completed - Frank	04/11/2020 03:27	SYSTEM	\N	\N
8763e792-ec83-466b-99c4-fb1c23b08dc9	b58d726a-9ea1-44e9-88d6-424bcdad418e	Ticket completed - Frank	04/11/2020 03:33	SYSTEM	\N	\N
2b4dbc8b-0b0c-47c7-875b-a783046ad0c0	999c973b-65f1-4e84-898d-dde69a9429ad	Ticket approved - Frank	04/11/2020 03:34	SYSTEM	\N	\N
f6594ce7-7f98-4ebe-8a7d-bdc8c7bbe8df	497a5496-1390-4cda-9c65-77c279bd5a2f	Ticket approved - Frank	04/11/2020 03:35	SYSTEM	\N	\N
2243e0ee-17a7-4c17-bfa3-88114ecdb8fb	0d1093e4-1460-4546-9ecf-f785e4841eb7	Ticket approved - Frank	04/11/2020 03:37	SYSTEM	\N	\N
e604bc4c-b3c5-4f34-93ca-0f550c70ed05	999c973b-65f1-4e84-898d-dde69a9429ad	Ticket completed - Frank	04/11/2020 05:02	SYSTEM	\N	\N
b97fb86b-ded3-470b-8299-25cf1df970ad	497a5496-1390-4cda-9c65-77c279bd5a2f	Ticket completed - Frank	04/11/2020 05:02	SYSTEM	\N	\N
1e3c3f9f-f49a-4ea1-b868-8d695ec6dc67	a74fa0a3-ea31-4c4a-8d9a-adc856894f2a	Ticket submitted - Fatman101	04/11/2020 05:09	SYSTEM	\N	\N
b3c2a0ed-3591-415a-8e3e-943359972a83	095c8871-0631-4f59-a48f-4569a5ed8091	Ticket submitted - Frank	04/11/2020 05:54	SYSTEM	\N	\N
31f226ab-d970-4a74-a631-2676afd90a2d	095c8871-0631-4f59-a48f-4569a5ed8091	you can communicate with us with the note tab	04/11/2020 05:54	Frank	138791132430729217	\N
4fcf3162-5e67-4ec9-b917-67187b782fdd	095c8871-0631-4f59-a48f-4569a5ed8091	Ticket approved - Frank	04/11/2020 05:54	SYSTEM	\N	\N
f681ca40-3a21-4251-bb89-762fd8139f99	095c8871-0631-4f59-a48f-4569a5ed8091	Ticket cancelled for reason:  test - Frank	04/11/2020 05:54	SYSTEM	\N	\N
159bff9d-4144-4b4a-8829-cb07898f4141	0d1093e4-1460-4546-9ecf-f785e4841eb7	Just wanted to tell us what happened. Didn't expect any replacement.	04/11/2020 06:03	Frank	138791132430729217	\N
006f8fc4-3179-4edc-b2eb-49704b0473b3	0d1093e4-1460-4546-9ecf-f785e4841eb7	Ticket completed - Frank	04/11/2020 06:03	SYSTEM	\N	\N
76a475eb-dcbb-4e9d-a65d-24daa054fe58	b9142433-83ec-4d60-8cb7-dee50d8dca7d	Ticket submitted - Baxlelo	04/11/2020 08:03	SYSTEM	\N	\N
7931492d-2c85-4c6d-9a47-692e988c343f	b9142433-83ec-4d60-8cb7-dee50d8dca7d	Ticket approved - BeOurGuest	04/11/2020 09:12	SYSTEM	\N	\N
d9358b3d-c462-48c8-9671-523b02277e7d	4ba764eb-165a-4741-a671-028f291e9dc3	Ticket submitted - Jazz	04/11/2020 09:21	SYSTEM	\N	\N
5752706a-0d94-479f-867e-e66accb7d553	c7de0ac8-ef02-4d41-8bf5-a49cb358427b	Ticket submitted - The Poopsmith	04/11/2020 09:29	SYSTEM	\N	\N
b9774977-809c-4c9c-be10-54d06a1f3456	4ba764eb-165a-4741-a671-028f291e9dc3	Ticket cancelled for reason:   - BeOurGuest	04/11/2020 09:49	SYSTEM	\N	\N
f8c2d524-5284-4255-bc43-0f4f834c8e43	b9142433-83ec-4d60-8cb7-dee50d8dca7d	Ticket completed - BeOurGuest	04/11/2020 09:59	SYSTEM	\N	\N
d75594d8-3a22-4952-b91c-7e020097488c	2d676183-8541-444a-985b-8d90ecfb0389	Ticket completed - BeOurGuest	04/11/2020 10:04	SYSTEM	\N	\N
8822955b-5111-4207-a34f-b81c901789aa	965e4b24-8ebe-4131-9f57-2db48bfe9365	Ticket submitted - Jaeger	04/11/2020 12:15	SYSTEM	\N	\N
0f2fd618-79ba-4a1b-8036-deabf7c96533	2f9e5d99-95bc-44d0-bef1-1b48eb6fc6ec	Ticket submitted - undefined	04/11/2020 13:14	SYSTEM	\N	\N
6c196a4f-6982-41c1-9a1a-a0b3a435bc90	2f9e5d99-95bc-44d0-bef1-1b48eb6fc6ec	Ticket approved - Zylana	04/11/2020 17:56	SYSTEM	\N	\N
d01fe409-f3b5-45b0-bb56-8e5d15229ae2	c9a49ef8-1b84-4d19-ae23-b0088d43b838	Ticket submitted - Zhai	04/11/2020 17:58	SYSTEM	\N	\N
8e2193f6-8070-4108-8c22-7c71e088279c	2f9e5d99-95bc-44d0-bef1-1b48eb6fc6ec	Ticket completed - Zylana	04/11/2020 17:59	SYSTEM	\N	\N
33fa04e4-fb9f-455d-bb51-a9bab55e9289	965e4b24-8ebe-4131-9f57-2db48bfe9365	What would be the Admin proposed solution?	04/11/2020 19:50	Jaeger	296834414376124417	\N
c2ad5cb9-2358-4aa2-b95c-5a451a07e78e	c7de0ac8-ef02-4d41-8bf5-a49cb358427b	Ticket approved - Zylana	04/12/2020 00:36	SYSTEM	\N	\N
c562a03a-f5e4-4ff3-9919-145fd4619d1b	c7de0ac8-ef02-4d41-8bf5-a49cb358427b	Ticket completed - Zylana	04/12/2020 00:36	SYSTEM	\N	\N
ccf5452c-8b5d-4d20-80f2-13ed64cfb9a0	c7de0ac8-ef02-4d41-8bf5-a49cb358427b	Attempted to remove map exclusive animals via cryo. Nothing we can do. \r\n	04/12/2020 00:37	Zylana	200464667506638848	\N
104bd06d-3a00-4615-bdec-e7c717edaf39	965e4b24-8ebe-4131-9f57-2db48bfe9365	The animals we were taking from Rag to Aberration were Qty 2 Aber Spinos and Qty 1 Aber Equus in crypods, in inventory, via Transmitter at HCC.	04/12/2020 02:28	Jaeger	296834414376124417	\N
63211b72-9f27-4dae-8dc7-347f17fe089f	ecbc9db2-c212-4afc-92c2-6ae3e58ca10c	Ticket submitted - Zynatoes	04/12/2020 05:39	SYSTEM	\N	\N
1c990229-178e-44ac-9003-4c7e3db4d808	313c41e0-7cee-4ffd-b128-09a5112a8d70	Ticket submitted - Undeadtank	04/12/2020 05:48	SYSTEM	\N	\N
aaa8bcd3-5ad7-4868-a334-8373874ecdcf	49d01d76-95e1-4461-8836-25717a454c45	Ticket submitted - ChokeOnMyRocks	04/12/2020 06:29	SYSTEM	\N	\N
47097fcc-1ef8-445a-b679-ab2764ebb63d	2d0747e7-1870-4b3e-b7e4-624134f2adca	Ticket submitted - Ivan	04/12/2020 06:37	SYSTEM	\N	\N
52d2d8bf-a5c5-4250-b136-ff916dc430a1	ecbc9db2-c212-4afc-92c2-6ae3e58ca10c	Ticket cancelled for reason:   - Zynatoes	04/12/2020 06:41	SYSTEM	\N	\N
21a19ef5-b7ea-4ab4-9c21-c5e81d0c9c86	313c41e0-7cee-4ffd-b128-09a5112a8d70	Ticket approved - SnowballInHell	04/12/2020 06:58	SYSTEM	\N	\N
95597d0b-81b1-4d40-a2a4-d409955ee98b	313c41e0-7cee-4ffd-b128-09a5112a8d70	Ticket completed - SnowballInHell	04/12/2020 06:58	SYSTEM	\N	\N
06a58772-e4e4-4889-923f-dc2c5e342e7b	313c41e0-7cee-4ffd-b128-09a5112a8d70	He didn't give a PIN# (tried to DM him immediately but didn't get a response), so I put it in a pin locked cryo fridge at my tp labeled "UndeadTank", PIN code 4646 and DM'd him that it was there for him with a picture of it's location.	04/12/2020 06:59	SnowballInHell	265334813421076481	\N
d6bbd5af-571b-41ab-9681-e6e40fda24af	a5f09488-f9e6-4b77-863f-0aeed003e406	Ticket submitted - bobbbawatts	04/12/2020 07:46	SYSTEM	\N	\N
402c1439-81e7-4ec2-ba7a-59d797d26272	4f0cdf1b-e82d-465a-8a48-704c103ff474	Ticket submitted - The Struggler	04/12/2020 07:50	SYSTEM	\N	\N
e1d8d17f-5cbc-4d88-ae1a-780f4bbf9099	3170a5cb-2107-40aa-995a-2d6cae505a00	Ticket submitted - Chiatsu	04/12/2020 08:32	SYSTEM	\N	\N
08faa7e8-baca-4e6f-a174-f09092646efb	7293bb69-94f2-48f2-9854-1d27657a6f1b	Ticket submitted - Chiatsu	04/12/2020 08:45	SYSTEM	\N	\N
6617643e-716a-4d09-a3c6-0c1b73c7927b	2d70a725-6956-4a94-85e9-5bc663229952	Ticket submitted - JBizzle	04/12/2020 09:07	SYSTEM	\N	\N
7891bdc4-0f08-4b63-b47c-aee6ff15d36a	67d92aef-aa44-45cd-a3a5-754e98fc5074	Ticket submitted - Redtigerfang74	04/12/2020 11:17	SYSTEM	\N	\N
62f15c66-350a-4c83-a1ed-aca7b195ef17	67d92aef-aa44-45cd-a3a5-754e98fc5074	Ticket cancelled for reason:  We are accepting Ferox Exchange tickets starting tomorrow. - BeOurGuest	04/12/2020 11:19	SYSTEM	\N	\N
465de035-aeb9-4c18-b6a2-a3cd09c0be2a	2d0747e7-1870-4b3e-b7e4-624134f2adca	Talked to Ivan (he mainly uses Google Translate, btw) and here is the PIN# if someone gets to this ticket before I do. PIN#1312	04/12/2020 11:28	SnowballInHell	265334813421076481	\N
562ce6fb-a7c7-4e9b-9f3e-8cf81ae39054	67d92aef-aa44-45cd-a3a5-754e98fc5074	When submitting the new ticket, please use a general ticket with a CCC line so we know where to go :)	04/12/2020 11:57	BeOurGuest	88994789860610048	\N
14a6c159-e643-4311-8ea0-4bf498a7ce79	3daca9a7-e63e-4532-a078-820073af88fc	Ticket submitted - teamwolfe19	04/12/2020 13:30	SYSTEM	\N	\N
37095a1d-a6da-4941-a7b9-0fc1ad3efc7c	8e41c9a8-c5d2-4479-af5b-6590381be6cc	Ticket submitted - Jaeger	04/12/2020 15:04	SYSTEM	\N	\N
17547534-fe53-4535-97cc-c0954f04b4c3	c372273d-0633-44c0-8f2d-60ee12b62db3	Ticket submitted - Kdmman2	04/12/2020 15:32	SYSTEM	\N	\N
e28d0ab3-22ca-4c4c-99cc-d572bc8e0d37	978894eb-8c35-4640-83bd-6ca2773d85f9	Ticket submitted - uhternal	04/12/2020 18:24	SYSTEM	\N	\N
0902c1b9-48d6-45c6-b7ba-09e01f1df6dd	a555519f-fdd2-4949-811c-6871bac75e2c	Ticket submitted - thranduin2217	04/12/2020 19:32	SYSTEM	\N	\N
246e02c7-40a5-4f5e-95d4-e33cfd915829	a31554a9-d7a6-487e-a1f1-b7afc6c02863	Ticket submitted - undefined	04/12/2020 20:19	SYSTEM	\N	\N
a574b2f4-3e2c-4b72-a139-519a6ffd3c0e	a555519f-fdd2-4949-811c-6871bac75e2c	Ticket approved - BeOurGuest	04/12/2020 21:13	SYSTEM	\N	\N
db002859-a883-4388-9967-21c76ebd29ef	60ff7e8c-d1e4-4757-907c-fb2b03bdbc3c	Ticket submitted - CasualTadpole	04/12/2020 21:19	SYSTEM	\N	\N
28f95065-3f35-48e6-a75b-0c195d672b60	dbfc6cf5-88bc-4576-b4a9-d5bd97b81bb6	Ticket submitted - SpankMeJosh	04/12/2020 21:19	SYSTEM	\N	\N
d9125c8a-8fbe-42bf-b96f-1cb0d12291ab	a555519f-fdd2-4949-811c-6871bac75e2c	Ticket completed - BeOurGuest	04/12/2020 21:20	SYSTEM	\N	\N
e03d4c4f-1dd2-4a36-b374-d7b3f403d62d	dbfc6cf5-88bc-4576-b4a9-d5bd97b81bb6	Ticket cancelled for reason:  You’re issue is skirting the rules.  - Zylana	04/12/2020 21:21	SYSTEM	\N	\N
6633dd11-950a-4d83-a21e-cbb44fe47dd6	a31554a9-d7a6-487e-a1f1-b7afc6c02863	Ticket cancelled for reason:  Threeshot said this has been resolved - BeOurGuest	04/12/2020 21:22	SYSTEM	\N	\N
95eafd3d-3dcd-4b04-a1b7-a3587041e452	02d7d5b3-598a-409f-a826-7293b4faff35	Ticket submitted - VeLoCiTy_Ru5h	04/12/2020 21:25	SYSTEM	\N	\N
161fbe24-5750-4520-b558-10c70a1772d6	dbfc6cf5-88bc-4576-b4a9-d5bd97b81bb6	What is skirting 	04/12/2020 21:28	SpankMeJosh	600998084809588756	\N
041e0efb-c5f3-495f-86ce-2145742f2ba6	02d7d5b3-598a-409f-a826-7293b4faff35	Ticket approved - BeOurGuest	04/12/2020 21:44	SYSTEM	\N	\N
5e306a3b-01a6-4172-a2ed-a204ce0afc9a	02d7d5b3-598a-409f-a826-7293b4faff35	Ticket completed - BeOurGuest	04/12/2020 21:44	SYSTEM	\N	\N
f0889540-ed6e-4036-89a5-bc979ef47632	978894eb-8c35-4640-83bd-6ca2773d85f9	Ticket approved - BeOurGuest	04/12/2020 21:53	SYSTEM	\N	\N
1110e578-7ea6-4f2d-8d54-c1cbc5c70d06	978894eb-8c35-4640-83bd-6ca2773d85f9	Ticket completed - BeOurGuest	04/12/2020 22:19	SYSTEM	\N	\N
7206739b-5bb6-4f78-865f-6ab3d3becd7c	8e41c9a8-c5d2-4479-af5b-6590381be6cc	Ticket approved - BeOurGuest	04/12/2020 22:21	SYSTEM	\N	\N
1f788119-5f95-4d79-aff5-5b1b9954e6d5	8e41c9a8-c5d2-4479-af5b-6590381be6cc	Ticket completed - BeOurGuest	04/12/2020 22:26	SYSTEM	\N	\N
afd5867d-c155-40c9-963b-2e778bf05492	8e41c9a8-c5d2-4479-af5b-6590381be6cc	Next time please do CCC next to a pin coded box for us to deliver to. The element is in the first vault, the one with all the easter candy	04/12/2020 22:27	BeOurGuest	88994789860610048	\N
f78d052f-8d8b-448c-af28-1180dfcd1bfa	3daca9a7-e63e-4532-a078-820073af88fc	Ticket approved - BeOurGuest	04/12/2020 22:29	SYSTEM	\N	\N
f90dd9b1-2859-4ef8-92b9-08685829307f	3daca9a7-e63e-4532-a078-820073af88fc	Ticket completed - BeOurGuest	04/12/2020 22:36	SYSTEM	\N	\N
76dfd5e4-5dfb-4ad9-9283-36212b98d5bb	2d70a725-6956-4a94-85e9-5bc663229952	Ticket approved - BeOurGuest	04/12/2020 22:40	SYSTEM	\N	\N
af9d2396-4b8f-410a-a1dd-b2d2989e3f14	2d70a725-6956-4a94-85e9-5bc663229952	Ticket completed - BeOurGuest	04/12/2020 22:40	SYSTEM	\N	\N
0b5205d2-6d63-43e2-b071-1fd7b550b57b	4f0cdf1b-e82d-465a-8a48-704c103ff474	Ticket approved - BeOurGuest	04/12/2020 22:41	SYSTEM	\N	\N
e1f2bb49-aff8-4701-beaa-d5f7e34b95d5	4f0cdf1b-e82d-465a-8a48-704c103ff474	Ticket cancelled for reason:  The Dino Yard Sale is not an admin hosted event and as such does not have an element reward. It is a player run activity.  - BeOurGuest	04/12/2020 22:50	SYSTEM	\N	\N
202482d1-0c3d-413a-ac55-b18948984dec	2d0747e7-1870-4b3e-b7e4-624134f2adca	Ticket approved - BeOurGuest	04/12/2020 22:52	SYSTEM	\N	\N
3ab255e9-3869-41f5-8c94-8d1b96537ef3	2d0747e7-1870-4b3e-b7e4-624134f2adca	Ticket completed - BeOurGuest	04/12/2020 23:01	SYSTEM	\N	\N
6b6cb016-24bc-4b86-a147-4db0a860318a	49d01d76-95e1-4461-8836-25717a454c45	Ticket approved - BeOurGuest	04/12/2020 23:09	SYSTEM	\N	\N
6cfeef93-e2c7-4d38-b4be-053b0a439deb	49d01d76-95e1-4461-8836-25717a454c45	Ticket completed - BeOurGuest	04/12/2020 23:15	SYSTEM	\N	\N
c5326ed4-54d5-4021-8402-55001c00798f	c372273d-0633-44c0-8f2d-60ee12b62db3	Do you want the replacement Ferox to be clipped and colored, and do you care about the gender of the replacement Ferox?	04/12/2020 23:23	BeOurGuest	88994789860610048	\N
37c54d1a-8485-404c-aab3-8c5be46fc48a	965e4b24-8ebe-4131-9f57-2db48bfe9365	Ticket approved - BeOurGuest	04/12/2020 23:46	SYSTEM	\N	\N
3d3b4973-5965-46c2-9ea3-8e8bbee95e14	965e4b24-8ebe-4131-9f57-2db48bfe9365	Will ask around the admins to see if anyone can think of a way to track down what happened to the cryos, if no one can think of anything we will consider them arked. Have offered an abberant or nonabberant horse as a player.	04/12/2020 23:47	BeOurGuest	88994789860610048	\N
317dc0c0-2245-431b-b092-1fc8a4701ff4	289ff42c-6bc3-4b19-a524-12ae7ed87fa2	Ticket submitted - Dr_SZ	04/12/2020 23:51	SYSTEM	\N	\N
a41fa437-87ce-4da8-bf9f-fec2c4e0bac4	289ff42c-6bc3-4b19-a524-12ae7ed87fa2	Ticket approved - BeOurGuest	04/12/2020 23:51	SYSTEM	\N	\N
ceb4198f-52e1-4ac3-a7c3-28bc310c2881	289ff42c-6bc3-4b19-a524-12ae7ed87fa2	Ticket completed - BeOurGuest	04/12/2020 23:57	SYSTEM	\N	\N
772956e0-175c-4658-8ce2-90080e86a4a9	4f0cdf1b-e82d-465a-8a48-704c103ff474	Ahh okay okay ty	04/13/2020 09:43	The Struggler	277855875861970945	\N
35200d34-0f37-421d-8fcc-66e17d92c1c1	cda18840-0bf8-40bb-bb20-0ef19388a662	Ticket submitted - Frankher	04/13/2020 12:07	SYSTEM	\N	\N
b2522f9c-18f0-40ca-8c47-59e3cb14c349	a74fa0a3-ea31-4c4a-8d9a-adc856894f2a	Ticket approved - ShiftyG	04/13/2020 12:38	SYSTEM	\N	\N
95d10aff-c943-4d45-9f2b-9a872b353475	a74fa0a3-ea31-4c4a-8d9a-adc856894f2a	Ticket completed - ShiftyG	04/13/2020 13:05	SYSTEM	\N	\N
9c610500-37b3-40c2-99d4-e53174633320	94385874-6666-4d90-b4f7-4f6caedd1abb	Ticket completed - Staurophobic	04/13/2020 18:18	SYSTEM	\N	\N
7be8172b-74e7-4902-96c1-160fb41eb3e8	d1ed1aa7-0200-4728-bd85-72278548dda1	Ticket submitted - Negan	04/13/2020 19:45	SYSTEM	\N	\N
df224954-4474-4f84-ad8d-5c2ad0b41e53	d1ed1aa7-0200-4728-bd85-72278548dda1	Negan, \r\n\r\nI'm showing no record or indication of you being banned. Neither your name or Steam ID number appear on the ban list. Are you sure you're connecting to the correct server, or that you aren't getting some sort of other error? 	04/13/2020 20:59	Nast	203048516468211712	t
b49353ba-d57b-405c-9a7c-55415d8c5552	d1ed1aa7-0200-4728-bd85-72278548dda1	Ticket cancelled for reason:   - BeOurGuest	04/13/2020 21:23	SYSTEM	\N	\N
885c43aa-3917-4fb1-bd9a-77be06c11ff2	cda18840-0bf8-40bb-bb20-0ef19388a662	Ticket approved - Zylana	04/13/2020 22:09	SYSTEM	\N	\N
1235c11a-47d1-4afa-a53e-7b5e7629b145	cda18840-0bf8-40bb-bb20-0ef19388a662	Ticket completed - Zylana	04/13/2020 22:09	SYSTEM	\N	\N
35273ced-389a-4d9a-8a78-5223c121489b	c9a49ef8-1b84-4d19-ae23-b0088d43b838	Ticket approved - Frank	04/14/2020 16:02	SYSTEM	\N	\N
073d0eba-96da-49e9-9782-9956c65023e4	c9a49ef8-1b84-4d19-ae23-b0088d43b838	Hello Zhalia, after a thorough search at the logs and your online activity on Ragnarok #5 I've concluded that either you're victim of a rare Ark bug where some(or all) structure decay automatically or an admin passed by when your timer were at zero and removed everything. If your schedule is on and off, you can always build a metal or tek base and that gives you 20+ days to log in. Thanks for your patience.	04/14/2020 17:19	Frank	138791132430729217	\N
c6c11c1d-300a-4023-9aef-e42bb076f327	c9a49ef8-1b84-4d19-ae23-b0088d43b838	Ticket completed - Frank	04/14/2020 17:20	SYSTEM	\N	\N
44e03bea-d5ec-47c7-874d-a4bc57282553	a5f09488-f9e6-4b77-863f-0aeed003e406	Ticket approved - Frank	04/14/2020 17:22	SYSTEM	\N	\N
63f3ef1c-344b-406b-8c87-49d88a5bdf65	9282fac4-c09b-4b72-a490-d2c76ad3229b	Ticket submitted - The Poopsmith	04/14/2020 17:29	SYSTEM	\N	\N
5711d5e3-1db6-48b2-9384-84b50f7aa71e	c9a49ef8-1b84-4d19-ae23-b0088d43b838	Thank you Frank. My timers would not have been at zero yet by the time I logged back in, as everything (minus a thatch roof that was logged as auto-decay destroyed and was totally expected) was made of stone or metal. :/ But I suppose this is the best answer I'm going to get, I appreciate you checking into it. :)	04/14/2020 17:38	Zhai	300645373687365633	\N
9fdc5eb4-465c-4f75-a291-e292278457a9	9282fac4-c09b-4b72-a490-d2c76ad3229b	Ticket approved - Zylana	04/14/2020 17:41	SYSTEM	\N	\N
6aabcc73-a584-4680-9d2b-04c9ecb368ab	805bd158-2872-4716-bc0e-8878dc9f7065	Ticket submitted - Devin	04/14/2020 17:44	SYSTEM	\N	\N
560391a8-6f35-4c5b-94f4-eeaabb1930bf	a5f09488-f9e6-4b77-863f-0aeed003e406	Ticket completed - Frank	04/14/2020 18:00	SYSTEM	\N	\N
e2189b43-21de-422c-aea2-d1526ece474d	3170a5cb-2107-40aa-995a-2d6cae505a00	Ticket approved - Frank	04/14/2020 18:01	SYSTEM	\N	\N
6b993ce4-b2ea-430f-944c-b086f60c00bb	9282fac4-c09b-4b72-a490-d2c76ad3229b	Ticket completed - Zylana	04/14/2020 18:04	SYSTEM	\N	\N
33d40435-9210-4dc6-8da6-8df2e0cc40d4	7293bb69-94f2-48f2-9854-1d27657a6f1b	Ticket approved - Frank	04/14/2020 18:04	SYSTEM	\N	\N
dc1f6cdf-a612-4cc6-bfbe-379d5b37c766	c372273d-0633-44c0-8f2d-60ee12b62db3	Ticket approved - Frank	04/14/2020 18:09	SYSTEM	\N	\N
0f6c02d3-b458-4bd4-9081-b3926f3e3ab4	c372273d-0633-44c0-8f2d-60ee12b62db3	Ticket completed - Frank	04/14/2020 18:09	SYSTEM	\N	\N
fa73dfc4-d5cd-48e4-b270-78358f7edbba	7293bb69-94f2-48f2-9854-1d27657a6f1b	Ticket completed - Frank	04/14/2020 18:36	SYSTEM	\N	\N
c83af6a5-3d31-405f-abbe-76d2456ccf2a	3170a5cb-2107-40aa-995a-2d6cae505a00	https://ark.domination-gaming.com/server/8/dino/370051809\r\nhttps://ark.domination-gaming.com/server/5/dino/164573882\r\nhttps://ark.domination-gaming.com/server/6/dino/384030791\r\nhttps://ark.domination-gaming.com/server/8/dino/435469122	04/14/2020 18:41	Frank	138791132430729217	\N
e696424c-4645-41e6-bc7b-834f2a172303	805bd158-2872-4716-bc0e-8878dc9f7065	Ticket approved - Frank	04/14/2020 18:58	SYSTEM	\N	\N
dc443c6d-c9d5-4423-9be1-06b0ddfc576f	805bd158-2872-4716-bc0e-8878dc9f7065	Ticket completed - Frank	04/14/2020 18:58	SYSTEM	\N	\N
4a297fb9-4870-4e54-a451-ab4322b2afd1	3170a5cb-2107-40aa-995a-2d6cae505a00	130867 -252107 -13280 154.19 -1.36 pin 4591 Fridge named "Frank this one lol"\r\nsame colors as previous	04/14/2020 19:26	Frank	138791132430729217	\N
425a2149-4195-4e44-be61-f59285afa8c6	3170a5cb-2107-40aa-995a-2d6cae505a00	Ticket completed - Frank	04/15/2020 06:19	SYSTEM	\N	\N
59075898-ba54-43b7-8382-03580a491438	b763c0e8-e6ad-4409-b531-d463282165d0	Ticket submitted - BAMF	04/15/2020 15:19	SYSTEM	\N	\N
bb89bf17-238c-4cab-830f-6e2a766cd6cf	a555519f-fdd2-4949-811c-6871bac75e2c	where was element given i was not aware i was given my element\r\n	04/15/2020 15:54	thranduin2217	250460048738877440	\N
31131716-b8e9-431c-825e-97efcf13fa47	60ff7e8c-d1e4-4757-907c-fb2b03bdbc3c	Ticket approved - Cowdog	04/15/2020 16:22	SYSTEM	\N	\N
01418496-6855-4216-a6d3-acf88d9b6afd	60ff7e8c-d1e4-4757-907c-fb2b03bdbc3c	No players in Tribe josh but best IGN: CasualPlayer.  No one in tribe online atm to do a name change for whomever needs the name change.  Requested CasualTadpole#5153 to contact me in DM.	04/15/2020 16:29	Cowdog	296021653391933440	\N
065a6a3f-1fb5-4988-b795-a046b63258f9	b763c0e8-e6ad-4409-b531-d463282165d0	Ticket approved - Cowdog	04/15/2020 16:45	SYSTEM	\N	\N
96383629-472d-4375-a561-cb99d4e39a33	60ff7e8c-d1e4-4757-907c-fb2b03bdbc3c	Player said already taken care of.	04/15/2020 16:45	Cowdog	296021653391933440	\N
7bfe37c8-bc33-497a-a3c3-abcca8a1dfb0	60ff7e8c-d1e4-4757-907c-fb2b03bdbc3c	Ticket completed - Cowdog	04/15/2020 16:45	SYSTEM	\N	\N
1ed39787-9221-4533-bb27-69542e2563e5	b763c0e8-e6ad-4409-b531-d463282165d0	UNABLE TO RETRIEVE GIGA - THE COORDINATES IN THE WEBSITE SHOWS 212416 -25274.6 -52000.9 THIS IS A VERY SCARY PLACE AND TURNS INTO WATER UNDER THE MESH, SO GHOSTING AROUND WAS NOT AN OPTION.  WEBSITE STILL SHOWS GIG ALIVE, BUT I COULD NOT FIND IT TO RETRIEVE IT.  CLOSING TICKET, LET BAMF KNOW THAT THEIR BASE IS ON A THIN LAYER OF GROUND AND ABOVE WATER IN THE VOLCANIC AREA ON #13.	04/15/2020 17:07	Cowdog	296021653391933440	\N
8402c3c8-6de7-4ba6-95b2-fc3b250e0c37	b763c0e8-e6ad-4409-b531-d463282165d0	Ticket completed - Cowdog	04/15/2020 17:07	SYSTEM	\N	\N
42919a8b-d0fc-4895-a27e-b2d6ac697886	c54d24fd-9eb9-4307-b402-c1fe02a8d6a2	Ticket submitted - yoyohunt	04/15/2020 20:33	SYSTEM	\N	\N
a78bd0f4-cb60-41d1-8cb5-39d6991d1646	8ddde763-62c8-4b7e-9140-72ad87ad8084	Ticket submitted - Borealis	04/15/2020 22:30	SYSTEM	\N	\N
f645cb02-9fc7-4d3f-a39d-d8a1fc5eec22	c54d24fd-9eb9-4307-b402-c1fe02a8d6a2	Ticket approved - Frank	04/16/2020 03:46	SYSTEM	\N	\N
600edacf-9eda-4377-b811-2f0334314be7	8ddde763-62c8-4b7e-9140-72ad87ad8084	Ticket approved - Frank	04/16/2020 03:46	SYSTEM	\N	\N
f5ea02f1-0d26-4b34-aa87-88bda8ed2aa1	8ddde763-62c8-4b7e-9140-72ad87ad8084	Ticket completed - Frank	04/16/2020 04:01	SYSTEM	\N	\N
55a85125-a436-4b00-94d6-b476fc52f3d1	c54d24fd-9eb9-4307-b402-c1fe02a8d6a2	-228417 -46800 27801 31.99 -16.09\r\nPin 1017	04/16/2020 04:17	Frank	138791132430729217	\N
fac8eebf-9dcb-4f0e-a035-5d352755b5a7	c54d24fd-9eb9-4307-b402-c1fe02a8d6a2	Ticket completed - Frank	04/16/2020 04:40	SYSTEM	\N	\N
16d20e1c-96ca-4e09-9a91-f1cfe299d33e	2398ca08-43f3-40e1-8c83-2dbfcd39ffe3	Ticket submitted - ♛Queenie♛	04/16/2020 07:30	SYSTEM	\N	\N
115c0f9f-a9c8-444e-92f6-00df37dbdb82	2398ca08-43f3-40e1-8c83-2dbfcd39ffe3	Ticket approved - ShiftyG	04/16/2020 07:45	SYSTEM	\N	\N
b290d403-abe7-49d0-86b8-2898a3be1920	2398ca08-43f3-40e1-8c83-2dbfcd39ffe3	Ticket completed - ShiftyG	04/16/2020 08:12	SYSTEM	\N	\N
5acca349-162a-4e1a-a7ed-24cce15905b4	965e4b24-8ebe-4131-9f57-2db48bfe9365	We're considering the dinos to have been arked. Replacement dinos not provided at player's request	04/16/2020 13:02	BeOurGuest	88994789860610048	\N
c25b1b9c-5044-42ca-9ef0-47e3bf0c2e02	965e4b24-8ebe-4131-9f57-2db48bfe9365	Ticket completed - BeOurGuest	04/16/2020 13:02	SYSTEM	\N	\N
b37676a2-b2d8-44c5-b518-e288edc58179	bdf86e79-0ad5-48a6-9d35-e3ba23f13369	Ticket submitted - undefined	04/16/2020 17:06	SYSTEM	\N	\N
b88765a2-5e69-4a62-9f46-fc8ee47ff634	bdf86e79-0ad5-48a6-9d35-e3ba23f13369	bissettjon@gmail.com	04/16/2020 19:13	BeOurGuest	88994789860610048	\N
55023ae6-b460-4e2f-9488-37e8cd93b39a	eaae4faf-9a1f-4106-9353-26623d8b0f61	Ticket submitted - BAMF	04/17/2020 12:50	SYSTEM	\N	\N
5569993d-2dcd-4ba1-a3ed-3d3960441be3	1536d8dd-d637-4bfe-baf9-2ce4e1e61315	Ticket submitted - Eurgiga	04/17/2020 14:22	SYSTEM	\N	\N
d6b9a584-b7a2-451e-a378-9e3231111552	1536d8dd-d637-4bfe-baf9-2ce4e1e61315	Continued to check all levels of the map, reaper does not appear in the death log nor is it near enough to the transmitter next to the containment box to show up in its dino list.	04/17/2020 14:50	Eurgiga	392390188044779531	\N
5a3e2b36-eff9-4440-a438-69d70b5458bc	1536d8dd-d637-4bfe-baf9-2ce4e1e61315	Anyone? Please? Dino is: https://ark.domination-gaming.com/server/4/dino/228056986	04/17/2020 15:09	Eurgiga	392390188044779531	\N
344a9ece-4243-4d1b-ad1e-e2c24326ceb9	1536d8dd-d637-4bfe-baf9-2ce4e1e61315	Ticket approved - ShiftyG	04/17/2020 15:21	SYSTEM	\N	\N
3489fd21-cd8f-4f51-92a8-e18b8558c9f4	1536d8dd-d637-4bfe-baf9-2ce4e1e61315	Ticket completed - ShiftyG	04/17/2020 15:56	SYSTEM	\N	\N
dc59100d-60b8-4b27-8477-a587eb8dcee0	e22dd42c-359d-4048-89ab-a607978a1eb6	Ticket submitted - beefcake	04/17/2020 16:40	SYSTEM	\N	\N
def850c1-a346-4b98-8347-2b67b6741bff	ebca856f-4f23-45ba-98b4-cf6e1d2527e2	Ticket submitted - thranduin2217	04/17/2020 17:44	SYSTEM	\N	\N
7a8afd32-6890-4ba9-9a39-0084dbc5e522	ebca856f-4f23-45ba-98b4-cf6e1d2527e2	Ticket approved - Zylana	04/17/2020 17:46	SYSTEM	\N	\N
24b1c0fa-5ad8-4824-832b-47cab4a3366d	ebca856f-4f23-45ba-98b4-cf6e1d2527e2	Ticket completed - Zylana	04/17/2020 17:46	SYSTEM	\N	\N
c9594bac-072e-4155-9c55-48c9cc04899e	8ce92440-d348-461a-ab73-45e66db48bf2	Ticket submitted - Ella	04/17/2020 18:09	SYSTEM	\N	\N
d8cac6cb-f60c-4943-a88a-b82d36005d3f	3738a9ff-6969-4206-8435-1cc19c524508	Ticket submitted - Chaotic	04/17/2020 21:20	SYSTEM	\N	\N
ed6a165e-ad38-4fcc-ae34-5122ee564545	201d9930-3433-4c74-b798-9e2bfdfad3ab	Ticket submitted - undefined	04/17/2020 21:30	SYSTEM	\N	\N
f2b093b7-01ef-45c4-81e3-dc15311c79ca	8cb0bd2a-af50-4b36-9e10-ed651b091ac9	Ticket submitted - uhternal	04/18/2020 00:30	SYSTEM	\N	\N
8702d089-0475-4387-b8e6-8fd05e4cf08d	8771dad9-b0e1-4bb6-b42e-aa9b2b9a4171	Ticket submitted - Eurgiga	04/18/2020 05:28	SYSTEM	\N	\N
d203b4c2-1ff1-464b-aca7-ed2838eb9c94	3738a9ff-6969-4206-8435-1cc19c524508	note; lost dinos chords are 293046 241989 -14745 -1.19 -12.07\r\nand my base chords are 162761 143250 -13501 -173.72 -8.71\r\n\r\nif i could get him tped back to me or just out of that persons base that would be wonderful	04/18/2020 11:52	Chaotic	397663219663110145	\N
4b8c3746-8ccd-4099-ae15-8a0dd134199e	13b297a3-1921-4505-80fa-6e235fa3046b	Ticket submitted - Sodule	04/18/2020 14:53	SYSTEM	\N	\N
f2f660c1-bca9-4b05-be2e-9c998f30dc91	39c714bb-4d1d-496c-a1d7-ce5dcf7475a4	Ticket submitted - ekuhar	04/18/2020 14:53	SYSTEM	\N	\N
76000b48-adcb-4c45-a6dd-6608b9e5bfad	4686f541-dff7-4c6b-b5c5-8482880263be	Ticket submitted - Jazz	04/18/2020 18:17	SYSTEM	\N	\N
36a4e14f-a383-4037-bc58-7eecd229eac7	a60a2252-e73c-488f-a1c1-d4b53a832906	Ticket submitted - The Struggler	04/18/2020 18:19	SYSTEM	\N	\N
235063d4-0016-48a4-ab16-29fae3e96b22	733f88e7-5349-468f-bd16-d0e9deb43cbe	Ticket submitted - TheOddMe	04/18/2020 18:25	SYSTEM	\N	\N
2ac6705c-df4f-438f-b9b0-043d038221fd	a60a2252-e73c-488f-a1c1-d4b53a832906	324756 216790 -62 -80.18 -34.39 pin 1111	04/18/2020 18:29	The Struggler	277855875861970945	\N
4a5aa0f5-dd11-4ad7-b150-669c9000d569	a60a2252-e73c-488f-a1c1-d4b53a832906	I’m only owed 420 element 	04/18/2020 18:32	The Struggler	277855875861970945	\N
2efa5675-64f1-4cb1-b725-26ac7964d702	4686f541-dff7-4c6b-b5c5-8482880263be	Ticket approved - Zylana	04/18/2020 20:42	SYSTEM	\N	\N
d049c628-71f9-43cc-8c43-e2fe97ea2925	eaae4faf-9a1f-4106-9353-26623d8b0f61	Ticket approved - BeOurGuest	04/18/2020 22:37	SYSTEM	\N	\N
d4a6cb4a-8683-4b74-989b-a406942c7a9c	eaae4faf-9a1f-4106-9353-26623d8b0f61	Teleported to the dino's position, it was falling. Tried chasing it and hit a kill zone. Can try again if the dino is still alive when the website updates.	04/18/2020 22:47	BeOurGuest	88994789860610048	\N
7723944f-d383-4503-bdbc-dc1946b0ce07	8ce92440-d348-461a-ab73-45e66db48bf2	Ticket approved - BeOurGuest	04/18/2020 22:47	SYSTEM	\N	\N
cc6fc713-bd8c-425d-8ee5-7bf87ff408bd	8ce92440-d348-461a-ab73-45e66db48bf2	Ticket completed - BeOurGuest	04/18/2020 23:03	SYSTEM	\N	\N
5ae3a094-8827-4e5c-beeb-512453bcf296	3738a9ff-6969-4206-8435-1cc19c524508	Dino is sitting next to Oh	04/18/2020 23:10	BeOurGuest	88994789860610048	\N
b7a4ea1b-f344-468a-b052-a052dc5bea09	3738a9ff-6969-4206-8435-1cc19c524508	Ticket approved - BeOurGuest	04/18/2020 23:10	SYSTEM	\N	\N
8b50bddc-635d-4c3a-b1bb-61772aeee9ea	3738a9ff-6969-4206-8435-1cc19c524508	Ticket completed - BeOurGuest	04/18/2020 23:10	SYSTEM	\N	\N
17e4a363-49a2-4b01-9ee9-e86ff5edd273	8cb0bd2a-af50-4b36-9e10-ed651b091ac9	Ticket approved - BeOurGuest	04/18/2020 23:10	SYSTEM	\N	\N
01a8185e-00f3-4587-9c3d-83d6a96c7bbf	8cb0bd2a-af50-4b36-9e10-ed651b091ac9	Demo'd 4 undermesh foundations. Put in a ticket it I missed some and I will come take care of it.	04/18/2020 23:13	BeOurGuest	88994789860610048	\N
042fe2f2-d20c-4378-acbd-6ca0e7b0254b	8cb0bd2a-af50-4b36-9e10-ed651b091ac9	Ticket completed - BeOurGuest	04/18/2020 23:13	SYSTEM	\N	\N
5f118011-c2b0-4d53-9b7a-f36eff5c8992	39c714bb-4d1d-496c-a1d7-ce5dcf7475a4	Ticket approved - BeOurGuest	04/18/2020 23:18	SYSTEM	\N	\N
e0b383db-99b0-4279-98af-2d61be301769	39c714bb-4d1d-496c-a1d7-ce5dcf7475a4	Did you get this solved? If not, did you try using a different obb? If you tried that and it didn't work, what is the best time to contact you?	04/18/2020 23:19	BeOurGuest	88994789860610048	\N
d97acd4b-26de-486f-87b6-a089e6af8b5e	e22dd42c-359d-4048-89ab-a607978a1eb6	If you get on during 4/19/2020, @Beourguest on discord in the admin support channel and I will come wake these up for you.	04/18/2020 23:21	BeOurGuest	88994789860610048	\N
f4356422-c9a0-4df2-b33b-4afe6cf1ae00	e22dd42c-359d-4048-89ab-a607978a1eb6	Ticket approved - BeOurGuest	04/18/2020 23:21	SYSTEM	\N	\N
06f5e409-738a-4865-9986-987f8961773d	eaae4faf-9a1f-4106-9353-26623d8b0f61	Ticket completed - BeOurGuest	04/18/2020 23:41	SYSTEM	\N	\N
6c866b91-9d55-420e-b33c-655da53d7c69	a60a2252-e73c-488f-a1c1-d4b53a832906	Cowdog gave him 80 element on rag 5 last night.	04/19/2020 06:01	Frank	138791132430729217	\N
c1ff0042-170f-45b3-9acc-aa9431e5d1f4	bf91f4c2-3fa3-47a2-9810-4106177805f3	Ticket submitted - Fox	04/19/2020 06:26	SYSTEM	\N	\N
87b27f5a-acf9-4010-b433-7a318a5fbd62	c31c5fb6-22ea-4cd7-af0b-e645ccbe76c0	Ticket submitted - Fox	04/19/2020 06:27	SYSTEM	\N	\N
73634ee8-1bb5-42f6-a50b-e8a487083cb0	24c952e2-e201-4162-9d42-3da81cd2f9b9	Ticket submitted - miseratii (Rasetsu)	04/19/2020 06:45	SYSTEM	\N	\N
759f58fe-5574-4595-8e92-06404c8dc6bb	24c952e2-e201-4162-9d42-3da81cd2f9b9	Ticket approved - Cowdog	04/19/2020 07:33	SYSTEM	\N	\N
2364f402-1570-4abb-b542-c73b9abecba1	24c952e2-e201-4162-9d42-3da81cd2f9b9	I will reset base on Wednesday 04/22/20 - This is a one time exception and Resetsu has been explained this.  They are having internet problems with getting the latest WC update/patch downloaded in order to get into game.	04/19/2020 07:34	Cowdog	296021653391933440	\N
da6478e8-0d31-43a6-ac1e-241095c50498	85cd4158-6b7d-44be-8a7a-834392142989	Ticket submitted - Ledyin	04/19/2020 08:56	SYSTEM	\N	\N
75edd900-2d0d-4885-be5d-85eedc6b246f	85cd4158-6b7d-44be-8a7a-834392142989	Ticket approved - Cowdog	04/19/2020 09:08	SYSTEM	\N	\N
7258c66c-4212-4729-826a-a464ff4a4bc8	a7b30474-91b8-40f4-96a1-c6c3a4739b44	Ticket submitted - Borealis	04/19/2020 09:33	SYSTEM	\N	\N
11a630f4-22df-46e0-b8f3-c162f4922168	85cd4158-6b7d-44be-8a7a-834392142989	Cryoed trike and left screaming para telling Toast to "Contact Admin"	04/19/2020 09:42	Cowdog	296021653391933440	\N
0ddf527e-308a-470d-a6d1-c854693c6989	85cd4158-6b7d-44be-8a7a-834392142989	Ticket completed - Cowdog	04/19/2020 09:42	SYSTEM	\N	\N
43d768d7-fccb-4c8d-aafc-489646cdc84f	8508ab31-866a-479b-b58b-74ddfaa696f5	Ticket submitted - pressurejuice	04/19/2020 10:27	SYSTEM	\N	\N
90f20797-af3c-4fcf-8ca7-3b2337a844c9	85f06c11-4a91-43dd-8a0f-5a2647b0b8c0	Ticket submitted - Birb	04/19/2020 10:47	SYSTEM	\N	\N
6cfae78b-9b15-4422-a238-09edf5f70b47	01f74812-603a-4ffc-871a-6b392a521c62	Ticket submitted - Jima (Eren)	04/19/2020 10:53	SYSTEM	\N	\N
6b81b0b3-1c7d-422a-b8c9-a293fe063024	f7159fc9-b1f0-470b-85c7-9a6734c62610	Ticket submitted - John Cena	04/19/2020 11:09	SYSTEM	\N	\N
49568a3a-36b8-4a9d-9540-a7c8bec2db1c	27c48f7e-80bb-4ce2-a589-e9fe5d06f386	Ticket submitted - demonette	04/19/2020 11:46	SYSTEM	\N	\N
06f80862-0ea4-4e11-aba0-1647c666a791	45e4bb3d-7b0a-4262-86f3-c49729d0fd45	Ticket submitted - Sunlight_Blades	04/19/2020 13:01	SYSTEM	\N	\N
5729b556-9d86-4262-979c-63ff600024ab	01f74812-603a-4ffc-871a-6b392a521c62	Ticket cancelled for reason:  Forgot to include pin code - Jima (Eren)	04/19/2020 13:54	SYSTEM	\N	\N
5a1669ad-6229-4137-837b-72370c835b6e	d7366f7b-3d4d-4caf-8165-730b9ec3cc3e	Ticket submitted - Jima (Eren)	04/19/2020 13:56	SYSTEM	\N	\N
87c1cdb3-612b-461a-941a-4d0fa6f39e4a	3b0e1d56-ce0a-402b-b29e-52ea0388ce98	Ticket submitted - undefined	04/19/2020 16:00	SYSTEM	\N	\N
0720accf-2c41-4129-b640-c8fc12e53d5e	27c48f7e-80bb-4ce2-a589-e9fe5d06f386	Ticket cancelled for reason:   - demonette	04/19/2020 16:40	SYSTEM	\N	\N
08e3efe3-19a1-4576-9f32-efc8f53e9adb	bd496cd7-b2a3-4b75-b115-5e1fa2afcaf8	Ticket submitted - demonette	04/19/2020 16:41	SYSTEM	\N	\N
1b613c73-8392-4732-9fdb-eb64c4942d5b	33405cff-8715-4b5c-8daf-63845c61fd6a	Ticket submitted - undefined	04/19/2020 16:42	SYSTEM	\N	\N
55760faa-cf29-408f-a027-21a222dc5ff7	d41bce94-9cac-4ed5-87d4-facf3c6d0bc5	Ticket submitted - undefined	04/19/2020 17:14	SYSTEM	\N	\N
7f8bd186-40bb-4208-8a96-1d1a158655ec	bdf86e79-0ad5-48a6-9d35-e3ba23f13369	Ticket approved - Frank	04/19/2020 17:40	SYSTEM	\N	\N
f056f718-a866-4231-854e-6b75edb74e44	bdf86e79-0ad5-48a6-9d35-e3ba23f13369	Ticket completed - Frank	04/19/2020 17:56	SYSTEM	\N	\N
700a2d73-88c1-48c2-8426-5782407fbbe9	201d9930-3433-4c74-b798-9e2bfdfad3ab	Ticket approved - Frank	04/19/2020 17:57	SYSTEM	\N	\N
114791ba-7f18-467d-9abd-900ebd898f1b	8771dad9-b0e1-4bb6-b42e-aa9b2b9a4171	Ticket approved - Frank	04/19/2020 17:58	SYSTEM	\N	\N
8941760e-05ed-405c-9412-61e25aec35c5	201d9930-3433-4c74-b798-9e2bfdfad3ab	Ticket completed - Frank	04/19/2020 18:07	SYSTEM	\N	\N
86710603-3efa-4537-adec-fb3abf0e0526	c3dbd3bd-939b-45a4-8b96-dcae24cd815f	Ticket submitted - undefined	04/19/2020 18:08	SYSTEM	\N	\N
1004e1d2-ee85-4a01-bb0b-5a02155f3b3e	7a9b0307-2281-4362-8ffb-45ea9596467f	Ticket submitted - undefined	04/19/2020 18:09	SYSTEM	\N	\N
dff668a9-58b5-4b7f-ab5a-84da4579a800	a981c67d-6427-43b6-8b0a-0fc7f562fa1c	Ticket submitted - WZK	04/19/2020 18:09	SYSTEM	\N	\N
73d41e75-c2ee-4d5f-ac9e-8b8fa4e3666e	8771dad9-b0e1-4bb6-b42e-aa9b2b9a4171	Ticket completed - Frank	04/19/2020 18:18	SYSTEM	\N	\N
abadccdd-c83b-442c-9d90-670828edab13	a60a2252-e73c-488f-a1c1-d4b53a832906	Ticket approved - Frank	04/19/2020 18:23	SYSTEM	\N	\N
76c295a6-5377-4586-8f81-26e7681e9290	a60a2252-e73c-488f-a1c1-d4b53a832906	Ticket completed - Frank	04/19/2020 18:23	SYSTEM	\N	\N
fd9fb048-9cbd-4470-bcbe-58581f52b711	733f88e7-5349-468f-bd16-d0e9deb43cbe	Ticket approved - Frank	04/19/2020 18:24	SYSTEM	\N	\N
ed1c08c7-9e91-4ab7-97d8-b3c1d6ce5536	733f88e7-5349-468f-bd16-d0e9deb43cbe	Ticket completed - Frank	04/19/2020 18:26	SYSTEM	\N	\N
69f6c808-093d-465b-a18e-41b87fadf215	4c793a24-3bcd-4a4e-8c39-91cb7d5556d3	Ticket submitted - Lobsterman	04/19/2020 18:32	SYSTEM	\N	\N
906e977b-5814-43fa-8772-c9bf2cb58d3c	bf91f4c2-3fa3-47a2-9810-4106177805f3	Ticket approved - Frank	04/19/2020 18:34	SYSTEM	\N	\N
b40d867a-1a46-4985-8a65-24c363693ba4	bf91f4c2-3fa3-47a2-9810-4106177805f3	Ticket completed - Frank	04/19/2020 18:34	SYSTEM	\N	\N
1fc15e67-1360-4383-b178-b0c873d164b7	c31c5fb6-22ea-4cd7-af0b-e645ccbe76c0	Ticket approved - Frank	04/19/2020 18:34	SYSTEM	\N	\N
6204cd81-c012-4f25-819e-89b1a6ec4ca8	c31c5fb6-22ea-4cd7-af0b-e645ccbe76c0	Ticket completed - Frank	04/19/2020 18:34	SYSTEM	\N	\N
e2f6e613-afa5-4cc7-ac5e-0abc30d10e59	a7b30474-91b8-40f4-96a1-c6c3a4739b44	Ticket approved - Frank	04/19/2020 18:35	SYSTEM	\N	\N
e18bef22-4de2-45f7-a62c-5ecd100f2826	a7b30474-91b8-40f4-96a1-c6c3a4739b44	Ticket completed - Frank	04/19/2020 18:39	SYSTEM	\N	\N
c6970259-e700-4640-844c-1cf82ba8222f	8508ab31-866a-479b-b58b-74ddfaa696f5	Ticket approved - BeOurGuest	04/19/2020 18:40	SYSTEM	\N	\N
97751506-1921-43f3-9571-1dd62fa5cc81	85f06c11-4a91-43dd-8a0f-5a2647b0b8c0	Ticket approved - Frank	04/19/2020 18:45	SYSTEM	\N	\N
052b0935-2b16-43c5-99b1-5fcba6590574	8508ab31-866a-479b-b58b-74ddfaa696f5	My ccc teleport was putting me under the map, so ghosted into your base and put the element in the raw materials vault	04/19/2020 18:48	BeOurGuest	88994789860610048	\N
32b7c855-ab08-4ff6-9dea-1fc23abaebf3	85f06c11-4a91-43dd-8a0f-5a2647b0b8c0	Ticket completed - Frank	04/19/2020 18:49	SYSTEM	\N	\N
31faa0bb-ecfb-4a55-8bd1-5136db86825c	3b0e1d56-ce0a-402b-b29e-52ea0388ce98	Ticket approved - BeOurGuest	04/19/2020 18:49	SYSTEM	\N	\N
8fb6a07f-28de-4e1a-90db-f93f5be97d52	45e4bb3d-7b0a-4262-86f3-c49729d0fd45	Ticket approved - Frank	04/19/2020 18:50	SYSTEM	\N	\N
1bf9b05e-7646-4b6f-b98f-873f878a5896	3b0e1d56-ce0a-402b-b29e-52ea0388ce98	No track able dinos (me in the following refers to fira), crafted gear journeyman chitin leggings crafted by me\r\nand an apprentice flak chest plate crafted by me\r\ni also had a journey sword with an abberant sword skin crafted by me\r\njourneyman*\r\nlevel 3 pheonix chibi named apollo	04/19/2020 18:51	BeOurGuest	88994789860610048	t
5c10ce28-a095-4277-a636-0e9c0f72e32d	4c793a24-3bcd-4a4e-8c39-91cb7d5556d3	Ticket approved - BeOurGuest	04/19/2020 18:51	SYSTEM	\N	\N
7f6961c1-90a3-40f2-9e9d-7c45947c8911	45e4bb3d-7b0a-4262-86f3-c49729d0fd45	Ticket completed - Frank	04/19/2020 18:53	SYSTEM	\N	\N
3616b9bb-8761-4194-87bf-a26fd6291352	4c793a24-3bcd-4a4e-8c39-91cb7d5556d3	Ticket completed - BeOurGuest	04/19/2020 18:53	SYSTEM	\N	\N
1f978e59-245f-43e7-8ff1-acfbf467e313	d7366f7b-3d4d-4caf-8165-730b9ec3cc3e	Ticket approved - BeOurGuest	04/19/2020 18:53	SYSTEM	\N	\N
b53d7a63-80f5-4504-97a3-71d38a0b8af5	d7366f7b-3d4d-4caf-8165-730b9ec3cc3e	In the future, please put a ccc instead of gps coords. 	04/19/2020 18:58	BeOurGuest	88994789860610048	\N
38edc6e5-d506-494f-93fe-6764272bd8ee	d7366f7b-3d4d-4caf-8165-730b9ec3cc3e	Ticket completed - BeOurGuest	04/19/2020 18:58	SYSTEM	\N	\N
e44b86b2-71cf-47f5-838e-39b7f43de0fb	c3dbd3bd-939b-45a4-8b96-dcae24cd815f	Ticket approved - Frank	04/19/2020 18:59	SYSTEM	\N	\N
e1997033-65c6-434d-bb62-40d849112589	c3dbd3bd-939b-45a4-8b96-dcae24cd815f	Ticket completed - Frank	04/19/2020 18:59	SYSTEM	\N	\N
84826d00-a914-4211-9379-4a693cb404c5	7a9b0307-2281-4362-8ffb-45ea9596467f	Ticket cancelled for reason:  duplicate of previous ticket\r\n - Frank	04/19/2020 19:00	SYSTEM	\N	\N
39a495ef-b95f-4a44-b5b8-2f955b9cbe8b	a981c67d-6427-43b6-8b0a-0fc7f562fa1c	Ticket cancelled for reason:  duplicate of previous ticket - Frank	04/19/2020 19:00	SYSTEM	\N	\N
bd075c48-6038-45e4-a250-89d74eabdec8	d41bce94-9cac-4ed5-87d4-facf3c6d0bc5	Ticket approved - BeOurGuest	04/19/2020 19:00	SYSTEM	\N	\N
906ffc15-5e9c-42e7-8c18-29586b6fa835	13b297a3-1921-4505-80fa-6e235fa3046b	Ticket approved - Frank	04/19/2020 19:04	SYSTEM	\N	\N
68d82510-95b5-4f36-80b5-ce4e2a7490e4	d41bce94-9cac-4ed5-87d4-facf3c6d0bc5	checked cave in single player, doesn't appear to be blocking any resources except rocks, and there weren't any notes or anything in there as well.	04/19/2020 19:06	BeOurGuest	88994789860610048	\N
2eac7a93-9743-40b9-b044-b432bfa254d3	d41bce94-9cac-4ed5-87d4-facf3c6d0bc5	Ticket completed - BeOurGuest	04/19/2020 19:06	SYSTEM	\N	\N
21eccd11-ba31-42c7-b8f5-056ab22e418f	bd496cd7-b2a3-4b75-b115-5e1fa2afcaf8	Ticket approved - BeOurGuest	04/19/2020 19:07	SYSTEM	\N	\N
386eba08-2007-47ac-97a0-8281c410e405	33405cff-8715-4b5c-8daf-63845c61fd6a	Ticket approved - BeOurGuest	04/19/2020 19:23	SYSTEM	\N	\N
5d3ac523-8c3e-4f8c-b232-472c11fa4a60	33405cff-8715-4b5c-8daf-63845c61fd6a	Looked around, nothing stuck out and didn't see anything not in your tribe. Can you be more specific. Are you getting an error message or is it showing up green but nothing is placing, or did you see something from another tribe in your base?	04/19/2020 19:35	BeOurGuest	88994789860610048	\N
b4891f5b-4bfb-4f70-9634-3530bfacf5c9	13b297a3-1921-4505-80fa-6e235fa3046b	replacement for Drake (Juna 2019) and Mek (May 2019)\r\n-142046 39749 13427 75.71 -1.34\r\nPIN 4591\r\nPat Rag #6	04/19/2020 19:32	Frank	138791132430729217	t
964d8dd2-1adc-400b-a579-172e51818986	13b297a3-1921-4505-80fa-6e235fa3046b	Ticket completed - Frank	04/19/2020 19:43	SYSTEM	\N	\N
d6e08319-8acd-4a38-a8ce-0aa81bb5de50	13b297a3-1921-4505-80fa-6e235fa3046b	Ticket completed - Frank	04/19/2020 19:44	SYSTEM	\N	\N
696ff361-2956-422b-8ed6-578e7b69b35e	f9389b27-fc63-4c8b-8eb1-054a4cc54eaf	Ticket submitted - XMAN-Unum	04/19/2020 20:05	SYSTEM	\N	\N
15934ebf-e57f-4273-8db3-008dca071a65	f9389b27-fc63-4c8b-8eb1-054a4cc54eaf	Ticket approved - BeOurGuest	04/19/2020 21:31	SYSTEM	\N	\N
be4f05b6-077d-40c3-83c2-d7cad8d47e6a	f9389b27-fc63-4c8b-8eb1-054a4cc54eaf	Ticket completed - BeOurGuest	04/19/2020 21:44	SYSTEM	\N	\N
0ac7ec6e-4c3a-45de-9cb7-7b5cd379dd2e	33405cff-8715-4b5c-8daf-63845c61fd6a	Ticket completed - Zylana	04/19/2020 21:57	SYSTEM	\N	\N
b60ae5e5-3d26-4b81-9a70-37930eba5184	004003f0-096f-4892-8df1-94f9bce53ab9	Ticket submitted - N1ckdoe	04/20/2020 00:49	SYSTEM	\N	\N
f127a158-147d-434a-927b-96a1208649f8	3b0e1d56-ce0a-402b-b29e-52ea0388ce98	Ticket completed - Zylana	04/20/2020 05:12	SYSTEM	\N	\N
6dbe9948-c8ae-4a49-81a5-519943c46f09	004003f0-096f-4892-8df1-94f9bce53ab9	Ticket approved - Zylana	04/20/2020 05:20	SYSTEM	\N	\N
727930c3-f150-4bbf-ac88-70dc8d84d6ff	004003f0-096f-4892-8df1-94f9bce53ab9	Ticket completed - Zylana	04/20/2020 05:23	SYSTEM	\N	\N
c42b26ca-7f02-4c7b-a874-b84539d24e65	bd496cd7-b2a3-4b75-b115-5e1fa2afcaf8	Ticket completed - Zylana	04/20/2020 05:25	SYSTEM	\N	\N
aa502e53-a6de-456c-9a47-e947654817df	d5227907-5671-4e70-92d2-a8fe117e15d2	Ticket submitted - vldkain	04/20/2020 09:26	SYSTEM	\N	\N
96c1554b-c5c0-41f7-9c4f-54d2c96a5fb3	9578e85a-7cf4-4703-a891-baef65602e68	Ticket submitted - Kolobok	04/20/2020 11:21	SYSTEM	\N	\N
148ceb05-6634-49f5-bb71-ffbb2bee8275	8a752d36-81f0-403e-a58f-8f6c5441ecca	Ticket submitted - ThatGuyFly	04/20/2020 11:34	SYSTEM	\N	\N
3c6a183d-2b2e-48bc-b8c6-181bed412081	2aa3ab7a-32f4-4725-a182-b88592a0d714	Ticket submitted - ThreeShot	04/20/2020 11:55	SYSTEM	\N	\N
6020434a-4aff-4612-bf05-531de5d09214	a81be8da-3433-4708-a917-4af2075cb1f0	Ticket submitted - demonette	04/20/2020 12:30	SYSTEM	\N	\N
b0a9673a-48f5-459a-bb25-c0ef62418f22	a81be8da-3433-4708-a917-4af2075cb1f0	Ticket cancelled for reason:   - demonette	04/20/2020 13:05	SYSTEM	\N	\N
c26677dd-9e08-46cd-b615-fa6b1b06f7ea	f9389b27-fc63-4c8b-8eb1-054a4cc54eaf	In ded storage box at the base with the drake named  {Cinder}Embrace the New	04/20/2020 13:15	BeOurGuest	88994789860610048	t
29ce1883-078d-4fd2-b6ac-097c8f6540b9	755da29a-1eb5-4fcb-8d4c-14e3678eebd5	Ticket submitted - XxFrostbitexX	04/20/2020 14:50	SYSTEM	\N	\N
6916fdb7-2223-4134-a311-a73a5457614a	d5227907-5671-4e70-92d2-a8fe117e15d2	Ticket approved - ShiftyG	04/20/2020 15:13	SYSTEM	\N	\N
11102372-892c-4eb5-a51f-0f3f3d42aade	2467754f-5145-4dd8-a1b2-e2998b0c396e	Ticket submitted - Borealis	04/20/2020 15:26	SYSTEM	\N	\N
d307b93f-70cf-4c44-9992-316358cf308c	d5227907-5671-4e70-92d2-a8fe117e15d2	Ticket completed - ShiftyG	04/20/2020 15:54	SYSTEM	\N	\N
d0ed2fc1-4ffd-4a87-898c-f366f5c14cc7	755da29a-1eb5-4fcb-8d4c-14e3678eebd5	Ticket approved - ShiftyG	04/20/2020 15:54	SYSTEM	\N	\N
f4acc498-cc65-4777-89c6-13215777b97c	755da29a-1eb5-4fcb-8d4c-14e3678eebd5	Ticket completed - ShiftyG	04/20/2020 16:13	SYSTEM	\N	\N
13723032-0f95-4668-8ac0-9ec68fed3c1e	de6f532a-8406-4321-bac2-bb7bda70d44e	Ticket submitted - Devin	04/20/2020 16:58	SYSTEM	\N	\N
40f75667-48e8-4b9b-8866-c9228607bd33	cc9bb5e0-5442-49fe-92ea-48c2b27c612d	Ticket submitted - undefined	04/20/2020 17:16	SYSTEM	\N	\N
40876c18-2179-420a-9372-b0ade5bb4b5e	64f30d93-a16d-4b69-839f-03a8c0abb396	Ticket submitted - teamwolfe19	04/20/2020 17:25	SYSTEM	\N	\N
8a3d7913-c3ef-40e5-b239-375b3a05ae31	349b2c7b-ed5f-4e0b-8dc6-77b4eb26ba4f	Ticket submitted - Azar	04/20/2020 17:37	SYSTEM	\N	\N
edde3db7-e425-4999-b31c-bf212868fc48	b33c5e24-2596-4101-ad91-54819a107cad	Ticket submitted - LordHuron	04/20/2020 17:43	SYSTEM	\N	\N
817383c8-5649-4ff4-af91-9f04d5606d0b	349b2c7b-ed5f-4e0b-8dc6-77b4eb26ba4f	Ticket approved - Zylana	04/20/2020 17:54	SYSTEM	\N	\N
6d969aec-0640-42b8-bf45-d13cc46a4fc3	b33c5e24-2596-4101-ad91-54819a107cad	Ticket approved - Zylana	04/20/2020 17:54	SYSTEM	\N	\N
96537539-f6bc-43f7-880d-321e60b4a7f8	64f30d93-a16d-4b69-839f-03a8c0abb396	Ticket approved - Zylana	04/20/2020 17:55	SYSTEM	\N	\N
a21431c0-6b84-4fe0-b352-d7ecac337788	cc9bb5e0-5442-49fe-92ea-48c2b27c612d	Ticket approved - Zylana	04/20/2020 17:55	SYSTEM	\N	\N
914aa90f-19ab-4355-a2db-69b2fe73c67a	349b2c7b-ed5f-4e0b-8dc6-77b4eb26ba4f	Ticket cancelled for reason:   - Azar	04/20/2020 17:55	SYSTEM	\N	\N
904e4415-6849-4e34-b702-ac4686557e30	b33c5e24-2596-4101-ad91-54819a107cad	Ticket cancelled for reason:  They got out\r\n - Zylana	04/20/2020 17:56	SYSTEM	\N	\N
e42755b3-9953-4ce8-a693-8badcd5c2909	cc9bb5e0-5442-49fe-92ea-48c2b27c612d	Ticket completed - Zylana	04/20/2020 18:00	SYSTEM	\N	\N
e448748d-c321-4444-876d-ecd429c22c05	cc9bb5e0-5442-49fe-92ea-48c2b27c612d	Removed a zipline anchor but nothing else seen at that location. 	04/20/2020 18:01	Zylana	200464667506638848	\N
5dc4276b-b051-438f-8cdb-31a37e94c865	64f30d93-a16d-4b69-839f-03a8c0abb396	Ticket completed - Zylana	04/20/2020 18:06	SYSTEM	\N	\N
2777b47d-504f-424f-b00d-db4b74453a50	2467754f-5145-4dd8-a1b2-e2998b0c396e	Ticket approved - Zylana	04/20/2020 18:06	SYSTEM	\N	\N
58097415-2337-49b9-b73e-9bf14952e4f0	2467754f-5145-4dd8-a1b2-e2998b0c396e	Ticket completed - Zylana	04/20/2020 18:17	SYSTEM	\N	\N
3b1add99-1201-411c-9bc1-87beeaa2cb3f	cd4428ed-1278-488f-a8cf-d1b838176ce1	Ticket submitted - XxFrostbitexX	04/20/2020 18:18	SYSTEM	\N	\N
32f25792-d92e-44f3-8b13-e53a6f3a395c	cd4428ed-1278-488f-a8cf-d1b838176ce1	Ticket approved - Zylana	04/20/2020 18:26	SYSTEM	\N	\N
9f097f0c-e3ca-42a1-97a9-efe9cfd8332b	cd4428ed-1278-488f-a8cf-d1b838176ce1	Ticket completed - Zylana	04/20/2020 18:26	SYSTEM	\N	\N
6895c591-498f-416a-a9d2-608170fd90ef	c7a59ad8-cc96-40b0-8cef-4516b48a2506	Ticket submitted - uhternal	04/20/2020 18:31	SYSTEM	\N	\N
3e163b7a-bf78-469b-bcc6-030017ec0d1e	2aa3ab7a-32f4-4725-a182-b88592a0d714	CCC goes to Threeshot's base, and not the location of the metal nodes in question. 	04/20/2020 18:32	Zylana	200464667506638848	\N
23ca70a5-4c6c-4b22-a760-6cedea9398a5	c7a59ad8-cc96-40b0-8cef-4516b48a2506	Wrong ticket submitted. 	04/20/2020 18:34	Zylana	200464667506638848	\N
c5ace5ba-602c-459e-b14d-e654be774be9	c7a59ad8-cc96-40b0-8cef-4516b48a2506	Ticket cancelled for reason:   - Zylana	04/20/2020 18:34	SYSTEM	\N	\N
088578f8-85d3-4076-889c-b3ed3a980b1c	a2b97efe-e513-4e51-bc3c-bad09a1919f3	Ticket submitted - uhternal	04/20/2020 19:04	SYSTEM	\N	\N
0fc20f55-5584-4743-a2c9-f8419bb1fffa	6f387a8b-6333-4a69-8a62-682cd68a7137	Ticket submitted - Primal	04/20/2020 22:04	SYSTEM	\N	\N
4766d985-2140-420f-9998-5f24a5372c70	9578e85a-7cf4-4703-a891-baef65602e68	Ticket approved - Frank	04/21/2020 08:04	SYSTEM	\N	\N
7a5f8e00-e795-4ec3-810d-7448db13107b	8a752d36-81f0-403e-a58f-8f6c5441ecca	Ticket approved - Frank	04/21/2020 08:16	SYSTEM	\N	\N
92875f70-180f-4682-be9f-c5f221707735	8a752d36-81f0-403e-a58f-8f6c5441ecca	Ticket completed - Frank	04/21/2020 08:17	SYSTEM	\N	\N
e5600a91-a4b4-4b11-b9f8-86f9a134e94f	de6f532a-8406-4321-bac2-bb7bda70d44e	Ticket approved - Frank	04/21/2020 08:17	SYSTEM	\N	\N
56c86547-a8f4-4390-83d3-ccc00323b359	de6f532a-8406-4321-bac2-bb7bda70d44e	metadevian@gmail.com	04/21/2020 08:39	Frank	138791132430729217	\N
f07fe687-b09c-47cd-be39-3b46a441eb39	de6f532a-8406-4321-bac2-bb7bda70d44e	Ticket completed - Frank	04/21/2020 08:39	SYSTEM	\N	\N
68ffb6eb-3e9b-4b3e-b803-6677aad141f7	a2b97efe-e513-4e51-bc3c-bad09a1919f3	Ticket approved - Frank	04/21/2020 08:53	SYSTEM	\N	\N
e7ef22b8-059e-4288-b617-0d8a534f1481	a2b97efe-e513-4e51-bc3c-bad09a1919f3	Ticket completed - Frank	04/21/2020 08:53	SYSTEM	\N	\N
b0a1d217-55e5-41c4-b594-5a06de31867a	6f387a8b-6333-4a69-8a62-682cd68a7137	Ticket approved - Frank	04/21/2020 08:56	SYSTEM	\N	\N
c334928d-9b14-43a7-ac40-d00016f6691d	9578e85a-7cf4-4703-a891-baef65602e68	Pin 4321	04/21/2020 08:56	Frank	138791132430729217	\N
03d6b244-6ac2-411b-89cb-f2dde6a5c765	9578e85a-7cf4-4703-a891-baef65602e68	Ticket completed - Frank	04/21/2020 09:01	SYSTEM	\N	\N
2cd6ee86-cbdc-43bb-a454-2375303e7d86	ac72c232-8fca-48e3-b332-7d1fd5d20926	Ticket submitted - Birb	04/21/2020 11:46	SYSTEM	\N	\N
4178a7bc-5208-4437-91d6-760ea8ba56e4	ad07e4f7-d614-4d41-ae6e-07ebeb7b36a8	Ticket submitted - Borealis	04/21/2020 12:51	SYSTEM	\N	\N
48b8db11-f0e7-4b16-9bbb-8335f14796c9	7fe15efb-2c84-4439-a299-f73fe112cd29	Ticket submitted - Tsukiyami	04/21/2020 13:50	SYSTEM	\N	\N
c093e81b-238d-4b6b-b7e2-3269c1fcb16f	0534ed33-4320-4434-9ef9-d3bf8928ea68	Ticket submitted - Tsukiyami	04/21/2020 13:51	SYSTEM	\N	\N
1ff60309-a527-4e2a-a630-240302b4e470	7d417f3b-7706-47cd-91df-a4e3dca0bb0e	Ticket submitted - undefined	04/21/2020 14:25	SYSTEM	\N	\N
8b21a18a-9b59-4981-a554-851f51800b44	e22dd42c-359d-4048-89ab-a607978a1eb6	sorry had something to do can i get help today\r\n	04/21/2020 14:34	beefcake	119275583367675904	\N
fa05b532-922c-4178-a0be-f03a8f827474	7d417f3b-7706-47cd-91df-a4e3dca0bb0e	Ticket approved - Cowdog	04/21/2020 15:18	SYSTEM	\N	\N
6dc3e261-9c63-4ffb-8b8a-18ec1cb2185f	e9a846d5-feaf-4424-b77a-28984290c340	Ticket submitted - undefined	04/21/2020 15:26	SYSTEM	\N	\N
b21108d5-3b28-4211-b590-9b20ebaf27c3	e20ad471-5ef1-454b-a99e-3889ab212054	Ticket submitted - undefined	04/21/2020 15:26	SYSTEM	\N	\N
76a6d8c0-1782-4f24-b3fb-e606efb212b4	63faa002-6c9e-4b8a-b1a3-d8ff75689e73	Ticket submitted - undefined	04/21/2020 15:26	SYSTEM	\N	\N
b16fae78-e7ff-4fa8-9074-a7e31a8b1d1e	b495be43-56c0-44f1-a899-efa3a2d8ebf9	Ticket submitted - undefined	04/21/2020 15:26	SYSTEM	\N	\N
6c34f267-94f1-4f1b-a3e3-9c726ebfcc0f	e9a846d5-feaf-4424-b77a-28984290c340	Ticket approved - Cowdog	04/21/2020 15:27	SYSTEM	\N	\N
07a1bb04-a623-4333-9d17-5c171415ac77	e20ad471-5ef1-454b-a99e-3889ab212054	Ticket approved - Cowdog	04/21/2020 15:27	SYSTEM	\N	\N
8aadf224-1668-4124-a445-c4eec5130620	63faa002-6c9e-4b8a-b1a3-d8ff75689e73	Duplicate ticket	04/21/2020 15:27	Cowdog	296021653391933440	\N
a5052b38-09b4-4cd5-a263-8ac82f7abb39	63faa002-6c9e-4b8a-b1a3-d8ff75689e73	Ticket approved - Cowdog	04/21/2020 15:27	SYSTEM	\N	\N
a445947f-2fb9-4734-ba3c-a46187ea3cb2	63faa002-6c9e-4b8a-b1a3-d8ff75689e73	Ticket completed - Cowdog	04/21/2020 15:27	SYSTEM	\N	\N
dd4781c3-26fb-4f94-a1a1-8102f7312c63	e9a846d5-feaf-4424-b77a-28984290c340	Duplicate ticket	04/21/2020 15:27	Cowdog	296021653391933440	\N
56d3b8ed-c470-49f5-8415-bf1f0e6b199a	e9a846d5-feaf-4424-b77a-28984290c340	Ticket cancelled for reason:  Duplicate ticket - Cowdog	04/21/2020 15:28	SYSTEM	\N	\N
990448ec-ff07-4965-aa2f-2cedf98f6ab1	b495be43-56c0-44f1-a899-efa3a2d8ebf9	Ticket cancelled for reason:  Duplicate ticket - Cowdog	04/21/2020 15:28	SYSTEM	\N	\N
17eef1fa-7523-45f5-818c-addfd8b066c9	e20ad471-5ef1-454b-a99e-3889ab212054	Retrieved body from lava - only had skins, prim crossbow, and a grapple.  Brett didn't want any of that stuff said it was the 2nd body he lost trying to recover the 1st body.	04/21/2020 15:50	Cowdog	296021653391933440	\N
d8717deb-627e-4828-a31d-5af710dec932	e20ad471-5ef1-454b-a99e-3889ab212054	Ticket completed - Cowdog	04/21/2020 15:50	SYSTEM	\N	\N
082bdba9-c744-4205-9373-ad81f4d23e19	7fe15efb-2c84-4439-a299-f73fe112cd29	Ticket approved - Nast	04/21/2020 16:04	SYSTEM	\N	\N
1ca3d9a8-a7f5-4d8d-bcbe-63bb632a847f	0534ed33-4320-4434-9ef9-d3bf8928ea68	Ticket approved - Nast	04/21/2020 16:05	SYSTEM	\N	\N
7f4e67ae-efa5-4311-a65c-c4db4611fdf9	7fe15efb-2c84-4439-a299-f73fe112cd29	Done. Dino ID number is 21966362368821222. Left on Island at base.	04/21/2020 16:10	Nast	203048516468211712	\N
cc565b2a-1d1a-4c74-afc8-cac0ac3354a8	7fe15efb-2c84-4439-a299-f73fe112cd29	Ticket completed - Nast	04/21/2020 16:10	SYSTEM	\N	\N
9bfb95f1-8d3b-4f61-90ec-907fcd0ae580	0534ed33-4320-4434-9ef9-d3bf8928ea68	Done. Dino ID is 27412199682683828. Left on base on Island.	04/21/2020 16:12	Nast	203048516468211712	\N
dc409069-afbc-415d-a90e-0ee8fa341eb4	0534ed33-4320-4434-9ef9-d3bf8928ea68	Ticket completed - Nast	04/21/2020 16:12	SYSTEM	\N	\N
382779cd-8555-40a5-9623-68b987a800b0	ad07e4f7-d614-4d41-ae6e-07ebeb7b36a8	Ticket approved - Nast	04/21/2020 16:14	SYSTEM	\N	\N
b11cc059-5e65-44ce-b21c-7bfbfdc18daa	ad07e4f7-d614-4d41-ae6e-07ebeb7b36a8	Foundations demolished. Thank you for reporting them.	04/21/2020 16:15	Nast	203048516468211712	\N
567a9f9c-29e8-498f-a506-af88a63320d7	ad07e4f7-d614-4d41-ae6e-07ebeb7b36a8	Ticket completed - Nast	04/21/2020 16:15	SYSTEM	\N	\N
91537e78-df05-4eb1-9634-eb606400d09e	f7159fc9-b1f0-470b-85c7-9a6734c62610	Ticket approved - Nast	04/21/2020 16:20	SYSTEM	\N	\N
da99f93a-18f2-4e28-936c-59088ef0886c	f7159fc9-b1f0-470b-85c7-9a6734c62610	We don't replace items or gear that are lost, as we have no way of verifying what was actually lost. Screenshots could easily be of things spawned in Single Player. I'm sorry, we can't help with this. 	04/21/2020 16:21	Nast	203048516468211712	\N
ba4acc13-e887-455e-987c-7d88ce790dab	f7159fc9-b1f0-470b-85c7-9a6734c62610	Ticket completed - Nast	04/21/2020 16:21	SYSTEM	\N	\N
65333af3-cc0d-412a-b7f1-4a5b0683bd78	2aa3ab7a-32f4-4725-a182-b88592a0d714	Ticket approved - Nast	04/21/2020 16:25	SYSTEM	\N	\N
f56137f1-bec0-48e2-8a7a-a52dffb87592	2aa3ab7a-32f4-4725-a182-b88592a0d714	Correct CCC was -33898 211399 -4191 123.12 -8.73. Small 2x4 stone base near metal spawns. No players or tames at base. Removed base.	04/21/2020 16:26	Nast	203048516468211712	\N
e4a2e3b2-0c5b-43dd-adbc-c1689898d2c2	2aa3ab7a-32f4-4725-a182-b88592a0d714	Ticket completed - Nast	04/21/2020 16:26	SYSTEM	\N	\N
2c762d4e-5c05-4704-95e1-53e43315c07a	e22dd42c-359d-4048-89ab-a607978a1eb6	Ticket completed - BeOurGuest	04/21/2020 16:49	SYSTEM	\N	\N
8546c1d3-e31a-4286-abc5-ed0828e09a47	c82cc1f9-1464-40ff-a985-1288a7eee50f	Ticket submitted - ♛Queenie♛	04/22/2020 08:07	SYSTEM	\N	\N
812b6909-ef1c-48ae-83bd-acf1ba9be24d	cf88a7f7-48a5-41a0-9a99-5e4214795ff4	Ticket submitted - ♛Queenie♛	04/22/2020 08:08	SYSTEM	\N	\N
fd32aec8-bba1-419a-8eef-6fc9b2b52aea	7b21030e-87f8-4be4-a1a0-104a05e6af01	Ticket submitted - Azar	04/22/2020 12:13	SYSTEM	\N	\N
e65b9017-5c4a-4d59-be3c-75e5c68b269b	95cbb2e9-3c9c-4102-8d42-7e78a717f721	Ticket submitted - Birb	04/22/2020 15:32	SYSTEM	\N	\N
bf57735b-9e5e-4c51-a38d-c267ead1edf1	95cbb2e9-3c9c-4102-8d42-7e78a717f721	Ticket approved - Zylana	04/22/2020 15:43	SYSTEM	\N	\N
055bc735-2773-4f40-b54f-4f91731c0ab1	95cbb2e9-3c9c-4102-8d42-7e78a717f721	Ticket completed - Zylana	04/22/2020 15:51	SYSTEM	\N	\N
ae3415f4-c705-4ce1-9ce3-ae0cfa9c1e54	7b21030e-87f8-4be4-a1a0-104a05e6af01	Ticket cancelled for reason:  This is not an admin issue, this is an Ark glitch when you hit the sky box.  - Zylana	04/22/2020 16:11	SYSTEM	\N	\N
10246883-8d92-42bc-9b87-c164a3ac1822	6772a2c8-1b24-49bf-9944-5d13094f6340	Ticket submitted - Zeek	04/22/2020 17:23	SYSTEM	\N	\N
6f093e2c-7cc5-4c66-bd04-555778d7a1cb	6f387a8b-6333-4a69-8a62-682cd68a7137	Tagged twice in admin-support on Discord	04/23/2020 03:53	Frank	138791132430729217	\N
491db7c6-911a-4786-b452-faa1d48963a9	ac72c232-8fca-48e3-b332-7d1fd5d20926	Ticket approved - Frank	04/23/2020 03:58	SYSTEM	\N	\N
ae7fcf27-382b-4fc9-b0ca-e68b78a86be3	ac72c232-8fca-48e3-b332-7d1fd5d20926	Ticket completed - Frank	04/23/2020 04:01	SYSTEM	\N	\N
0fe8b5b8-dc52-4fbe-b19e-d7a30a32063f	6772a2c8-1b24-49bf-9944-5d13094f6340	Ticket approved - Frank	04/23/2020 04:03	SYSTEM	\N	\N
18202837-8c62-43bb-88cf-d02f9ab2313d	6772a2c8-1b24-49bf-9944-5d13094f6340	Ticket completed - Frank	04/23/2020 04:10	SYSTEM	\N	\N
08f85a4a-5583-4e6b-bebb-3483420c2f04	c82cc1f9-1464-40ff-a985-1288a7eee50f	Ticket approved - Frank	04/23/2020 04:10	SYSTEM	\N	\N
3948dc44-42dd-40bc-a745-a159392743bc	cf88a7f7-48a5-41a0-9a99-5e4214795ff4	Ticket approved - Frank	04/23/2020 04:17	SYSTEM	\N	\N
873ccb8f-b13a-427b-81bf-25cce6d95494	cf88a7f7-48a5-41a0-9a99-5e4214795ff4	Ticket completed - Frank	04/23/2020 04:17	SYSTEM	\N	\N
e21178a6-c06b-4457-9365-70f997ad3fb7	c82cc1f9-1464-40ff-a985-1288a7eee50f	Ticket completed - Frank	04/23/2020 04:17	SYSTEM	\N	\N
e9433149-ed4b-45a6-8f5a-9c6e60b1c2a0	88b8e6cf-3d38-4710-a89f-e926fb0d39a1	Ticket submitted - Harbinger	04/23/2020 10:27	SYSTEM	\N	\N
812a768b-5d36-43b8-a447-073f9c9a411e	a0f9b7a9-9ca1-4194-aa55-d1fa66fa5500	Ticket submitted - JCBBlueDevil	04/23/2020 14:11	SYSTEM	\N	\N
6c7bea44-5d4f-4ed7-b38c-f54a13625459	24c952e2-e201-4162-9d42-3da81cd2f9b9	Reset base as a one time exception.	04/23/2020 15:56	Cowdog	296021653391933440	\N
45eb2dfd-771a-4b8e-bada-12e635126975	24c952e2-e201-4162-9d42-3da81cd2f9b9	Ticket completed - Cowdog	04/23/2020 15:56	SYSTEM	\N	\N
231fcc4a-4c63-4d2a-9c7f-717f31d3a2a3	88b8e6cf-3d38-4710-a89f-e926fb0d39a1	Ticket approved - ShiftyG	04/23/2020 18:32	SYSTEM	\N	\N
5f2d37ee-5dfa-44da-937b-dde82cfc4426	88b8e6cf-3d38-4710-a89f-e926fb0d39a1	No need for admin support. As long as the base can be demolished and is on a public map, it is free game. Please note that this only applies to our public servers. Demoable bases on our Patreon servers are off-limits.	04/23/2020 18:46	ShiftyG	421143819518476299	\N
4a998610-769d-413a-bf6e-ca9de4d937f8	88b8e6cf-3d38-4710-a89f-e926fb0d39a1	Ticket completed - ShiftyG	04/23/2020 18:46	SYSTEM	\N	\N
fbaef0eb-186a-430c-ba8b-2488f7439a03	1e019ca7-159e-4665-8c39-8cde52f9a717	Ticket submitted - undefined	04/23/2020 20:37	SYSTEM	\N	\N
980160f3-6ffe-4156-b43f-a98355cb7cf8	1e019ca7-159e-4665-8c39-8cde52f9a717	Ticket cancelled for reason:   - undefined	04/23/2020 20:56	SYSTEM	\N	\N
eefa10ec-d4e5-4c9e-9eea-3b16fd0cdab2	d9534343-2787-4f64-8422-07d4c123f0d8	Ticket submitted - ManaFull	04/23/2020 21:02	SYSTEM	\N	\N
ea4baa3c-84d2-42a0-b982-eeae262a1187	d9534343-2787-4f64-8422-07d4c123f0d8	Ticket approved - BeOurGuest	04/23/2020 21:33	SYSTEM	\N	\N
53863bce-a170-4ae4-9f89-6f98eae44040	d9534343-2787-4f64-8422-07d4c123f0d8	Ticket completed - BeOurGuest	04/24/2020 08:17	SYSTEM	\N	\N
eb713fd4-0749-40a5-90bb-163af31d4318	f5b7a1fd-b821-4d75-9dc6-12098455c0f3	Ticket submitted - Elegant_Pink	04/24/2020 10:17	SYSTEM	\N	\N
794b06c3-e643-4501-b65e-5b2cfc03fb01	bb8ce16b-377e-4a01-8353-294eaba76970	Ticket submitted - yaotonatiuh	04/24/2020 12:03	SYSTEM	\N	\N
1434b3b2-c7b2-46c4-9d73-4d65ea9b18c3	36008163-74ea-4e22-8b14-940f7257d4b7	Ticket submitted - PikaChunti	04/24/2020 12:04	SYSTEM	\N	\N
7a22d5cb-b1e1-4a43-a8bd-d3d697246d1d	4b4d418f-67c0-4091-b340-9aa232d3cde3	Ticket submitted - Mr.Normis	04/24/2020 13:47	SYSTEM	\N	\N
b5f935af-5ff6-4983-a9bd-a17047bb29cb	f5b7a1fd-b821-4d75-9dc6-12098455c0f3	Ticket approved - Frank	04/24/2020 14:07	SYSTEM	\N	\N
51917754-8e59-4ba6-a6d9-859f727b78b5	f5b7a1fd-b821-4d75-9dc6-12098455c0f3	Ticket completed - Frank	04/24/2020 14:11	SYSTEM	\N	\N
5171c329-e8c8-4cc7-bb3b-ed939908295a	6cc7d9d1-6932-4696-8342-d7fa3d7ce3f4	Ticket submitted - thranduin2217	04/24/2020 18:52	SYSTEM	\N	\N
699eb4d1-2470-492b-804c-c069564fa997	71016b8e-185f-4ebc-8ecc-e0532cc2ce38	Ticket submitted - Ezio	04/24/2020 19:07	SYSTEM	\N	\N
75fef97c-2996-4f68-83f7-057b007ef179	e627dcb3-ac9c-4a69-a76f-ecde0ab31d81	Ticket submitted - Water	04/24/2020 21:26	SYSTEM	\N	\N
a0d557b6-1fcb-4de1-80a6-0ad89dbb2c59	e627dcb3-ac9c-4a69-a76f-ecde0ab31d81	Ticket approved - Zylana	04/24/2020 21:32	SYSTEM	\N	\N
5f399c5f-af6a-4ee3-b784-ee1a3f58f1c2	e627dcb3-ac9c-4a69-a76f-ecde0ab31d81	Ticket completed - Zylana	04/24/2020 21:32	SYSTEM	\N	\N
98944a50-ea7d-4487-a585-4ce06f7fbe79	a0f9b7a9-9ca1-4194-aa55-d1fa66fa5500	Ticket cancelled for reason:   - JCBBlueDevil	04/24/2020 22:27	SYSTEM	\N	\N
587f6d30-12c2-4175-b995-adadf132132c	bb8ce16b-377e-4a01-8353-294eaba76970	Ticket approved - Zylana	04/25/2020 09:42	SYSTEM	\N	\N
adcc5a90-dac2-4807-b0d1-935fd0888322	bb8ce16b-377e-4a01-8353-294eaba76970	Ticket completed - Zylana	04/25/2020 09:48	SYSTEM	\N	\N
1adebada-8965-43fd-b3ed-3b6c4aaf3f33	36008163-74ea-4e22-8b14-940f7257d4b7	Ticket cancelled for reason:   - BeOurGuest	04/25/2020 09:50	SYSTEM	\N	\N
6e5a09c9-3423-4dab-94dd-1bdf2a37dee1	71016b8e-185f-4ebc-8ecc-e0532cc2ce38	Ticket cancelled for reason:  This is not an admin issue. We do not replace items due to game play.  - Zylana	04/25/2020 09:51	SYSTEM	\N	\N
2f12ef0b-d1fc-4bd3-a1fb-46d38379a85c	4b4d418f-67c0-4091-b340-9aa232d3cde3	Ticket approved - BeOurGuest	04/25/2020 09:51	SYSTEM	\N	\N
1da2a1b5-8e36-424a-a980-240356a81b26	4b4d418f-67c0-4091-b340-9aa232d3cde3	Ticket completed - BeOurGuest	04/25/2020 10:01	SYSTEM	\N	\N
1b1354a4-fd97-4760-be29-2792965d0300	6cc7d9d1-6932-4696-8342-d7fa3d7ce3f4	Ticket approved - BeOurGuest	04/25/2020 10:16	SYSTEM	\N	\N
681784e2-c4b0-4c56-a0c0-0dfe949b39d1	6cc7d9d1-6932-4696-8342-d7fa3d7ce3f4	Ticket completed - BeOurGuest	04/25/2020 10:18	SYSTEM	\N	\N
ed1ee961-1c80-4089-a2a5-f098021b6fdc	64db3d4d-0ae5-4c47-8989-7fe4c0b6e118	Ticket submitted - Little Finger	04/25/2020 13:34	SYSTEM	\N	\N
be1be254-bdc7-4928-b808-a6badbef7283	64db3d4d-0ae5-4c47-8989-7fe4c0b6e118	I found a typo - "there should -NOT- be any reprimands to the claimer" - they followed the rules just fine" I'm not upset about them claiming the dinos at all, just wish to have them back.	04/25/2020 13:40	Little Finger	280438900948860930	\N
b79ba56f-8670-4177-98d3-efb7c115260b	9ecf8cad-f894-4396-bf21-3f3b67cc0139	Ticket submitted - SteelTalon-Nella	04/25/2020 15:23	SYSTEM	\N	\N
478a507c-adb4-4c18-a946-1833f85ea3d0	759f6b75-303a-47de-ba4e-d717d7cbc26d	Ticket approved - Frank	04/28/2020 04:42	SYSTEM	\N	\N
fc93e32c-2d30-46b5-b39b-7a473f332096	9ecf8cad-f894-4396-bf21-3f3b67cc0139	Ticket approved - BeOurGuest	04/25/2020 15:31	SYSTEM	\N	\N
e2743c58-8beb-4197-9763-63872985b908	9ecf8cad-f894-4396-bf21-3f3b67cc0139	Ticket completed - BeOurGuest	04/25/2020 15:31	SYSTEM	\N	\N
9e015706-4349-409f-a770-234cbbd12320	64db3d4d-0ae5-4c47-8989-7fe4c0b6e118	Ticket cancelled for reason:  THIS HAS BEEN RESOLVED - THANK YOU ADMINS - Little Finger	04/25/2020 17:57	SYSTEM	\N	\N
80fe07cb-d6ed-419a-aa9e-1a0b4a0fab3f	1f464cc2-05b2-400f-9f0d-37777ee1a648	Ticket submitted - Zeek	04/25/2020 18:37	SYSTEM	\N	\N
6e2483fe-925f-4202-8183-b9b93bdba63d	d8d45a6b-d4ae-459c-a2e2-99ee3e0ef8d7	Ticket submitted - Vivi	04/25/2020 18:40	SYSTEM	\N	\N
eb7074cb-b1c9-4695-b883-0d38e17f1c7d	eb6c1cb2-292f-49c2-8cdb-a5e262f2b4ad	Ticket submitted - Devin	04/25/2020 18:41	SYSTEM	\N	\N
f086438b-7d07-4d10-9ae1-a0f243d25590	c75a38e8-1c7a-4388-84bc-2f1b823d4f2a	Ticket submitted - Emma	04/25/2020 18:43	SYSTEM	\N	\N
61b78636-a804-4cd4-ae29-c40762215a69	6a34ab9d-d031-48ad-b282-57048bafddb3	Ticket submitted - Totoinoz	04/25/2020 19:44	SYSTEM	\N	\N
9114db5b-c3c0-4b8f-89d6-9e9dcc6d1118	15371603-a5b6-4939-8864-ae517f01b384	Ticket submitted - PhoenixFira	04/25/2020 22:08	SYSTEM	\N	\N
fdb6ca6e-dac1-4ff9-8f7c-99dd7bc581ec	15371603-a5b6-4939-8864-ae517f01b384	Ticket approved - Chief Rodney	04/25/2020 22:51	SYSTEM	\N	\N
7a022da5-90a0-428d-9b83-39b045067173	15371603-a5b6-4939-8864-ae517f01b384	Ticket completed - Chief Rodney	04/25/2020 22:52	SYSTEM	\N	\N
35d111ec-b4b1-4ab7-ac31-820e8565ebaa	39c714bb-4d1d-496c-a1d7-ce5dcf7475a4	Ticket cancelled for reason:  I just keep refreshing and it shows. No worries. - ekuhar	04/26/2020 07:55	SYSTEM	\N	\N
6af47169-a4a7-4265-a551-1297fa88a8c5	6a34ab9d-d031-48ad-b282-57048bafddb3	Ticket cancelled for reason:  Changing it because pickup location changed and amount of element changed - Totoinoz	04/26/2020 10:26	SYSTEM	\N	\N
65de3740-5325-4f3a-98a2-2e1239b310e5	b65092fc-4c03-4757-bf7c-dd7252c0bfb1	Ticket submitted - terrificfight	04/26/2020 11:07	SYSTEM	\N	\N
dcbfc839-79a8-47fc-b0b6-15d23a062f91	f7e932dc-152e-4e24-bcfa-1a2a56c660c6	Ticket submitted - Brie	04/26/2020 11:08	SYSTEM	\N	\N
8ce97700-4ea3-4d2b-9f34-b5e25c5b59a9	69111612-f3aa-4770-a48f-e43555a01d2b	Ticket submitted - Totoinoz	04/26/2020 11:39	SYSTEM	\N	\N
03ff24eb-d3f8-463b-9c5d-377d83f15243	4d05405d-e16a-48d2-a563-c5494af5bedc	Ticket submitted - Luna- lunathea8	04/26/2020 15:12	SYSTEM	\N	\N
0fe1daf1-b827-47d4-9580-f2a3eb8f0353	943da927-0b4a-4434-9ca6-6176225d1247	Ticket submitted - WZK	04/26/2020 19:34	SYSTEM	\N	\N
474e0122-f40d-4aae-a2cd-3359fdf3c5b2	943da927-0b4a-4434-9ca6-6176225d1247	Will be in contact----Was asked by Nast to place this ticket just an FYI-----	04/26/2020 19:36	WZK	688223029905588386	\N
3b195961-0bfe-40d8-b921-9cb5f2235faa	1f464cc2-05b2-400f-9f0d-37777ee1a648	Ticket approved - ShiftyG	04/27/2020 15:17	SYSTEM	\N	\N
e255f7e5-eb4f-4598-a822-15726ac69bc8	1f464cc2-05b2-400f-9f0d-37777ee1a648	Ticket completed - ShiftyG	04/27/2020 15:21	SYSTEM	\N	\N
a87fb715-483a-4517-bf7f-a03fe7c0c3e1	716d9460-cebd-404e-8271-a9a344869abf	Ticket submitted - undefined	04/27/2020 15:34	SYSTEM	\N	\N
152b940d-a540-449a-9572-946752cf5c86	d447036a-1881-4b2e-8ab4-73439064a199	Ticket submitted - Ski_skas4	04/27/2020 17:25	SYSTEM	\N	\N
bfd6e736-ffe9-43b3-8812-8642cca00fdf	ced14e12-e308-4441-8671-23f01e6f197c	Ticket submitted - pressurejuice	04/27/2020 17:28	SYSTEM	\N	\N
8dbcd597-7423-4c14-8bc3-4f909c7ef93d	69111612-f3aa-4770-a48f-e43555a01d2b	Ticket cancelled for reason:  Changing location - Totoinoz	04/27/2020 19:07	SYSTEM	\N	\N
765601e2-4d0b-40e7-9dfd-21ed1a09d1f6	5a1a0b2c-4578-4da2-852c-3ef934e8450f	Ticket submitted - Totoinoz	04/27/2020 19:09	SYSTEM	\N	\N
6fc18cb6-71f5-4510-a222-a4a5df14515b	930fd1dc-28c6-4a55-9f28-f74fc2cda72a	Ticket submitted - cruyd	04/27/2020 19:53	SYSTEM	\N	\N
dbcf05da-5124-4b31-a5a2-b5cfce4a0745	916033eb-1e64-4106-b6a5-e844e88be974	Ticket submitted - thranduin2217	04/28/2020 01:03	SYSTEM	\N	\N
bc09cf3b-dc8e-4283-9fcb-77f7fa12b556	d49c60cf-39fa-4ca9-9e2c-ea51d457c0ce	Ticket submitted - teo505	04/28/2020 02:10	SYSTEM	\N	\N
a75b5dd3-cd4a-4e50-ba5b-dec588413367	c6cbef43-ca6f-427a-96c5-3ace712d0e11	Ticket submitted - teo505	04/28/2020 02:11	SYSTEM	\N	\N
1f3f5e11-204e-4b00-b0c5-6809183de675	6e93d4c4-6762-4d42-b6b7-d5155215aa08	Ticket submitted - teo505	04/28/2020 02:20	SYSTEM	\N	\N
209bec51-1741-4e2a-9600-4bf923a99402	759f6b75-303a-47de-ba4e-d717d7cbc26d	Ticket submitted - teo505	04/28/2020 02:33	SYSTEM	\N	\N
a99affb4-8578-4822-bec2-043c74ce0328	481fc6ea-0144-4c72-936a-6233e5f12210	Ticket submitted - teo505	04/28/2020 02:46	SYSTEM	\N	\N
db1ae9ff-6ecc-472e-9e59-f67fe7dc76e6	9bd91feb-c5e6-4186-9196-0aeb5e2f67ac	Ticket submitted - teo505	04/28/2020 02:53	SYSTEM	\N	\N
c331c44a-f0f3-4829-8bde-03c3b8972742	c75a38e8-1c7a-4388-84bc-2f1b823d4f2a	Ticket approved - Frank	04/28/2020 03:57	SYSTEM	\N	\N
f4cda038-1be1-4c63-840f-81d9f0391089	31d1e7b3-d11f-465b-aff6-92104acd4d4e	Ticket submitted - Too	04/28/2020 03:58	SYSTEM	\N	\N
bbcc5c72-0d8f-4bd5-a4dc-34bd91c03901	c75a38e8-1c7a-4388-84bc-2f1b823d4f2a	Ticket completed - Frank	04/28/2020 04:00	SYSTEM	\N	\N
db6505a0-213e-4ef5-ab8f-28f653c2b7b4	b65092fc-4c03-4757-bf7c-dd7252c0bfb1	Ticket approved - Frank	04/28/2020 04:00	SYSTEM	\N	\N
51eee5b3-29d7-417a-b9d5-6e65269cb41a	b65092fc-4c03-4757-bf7c-dd7252c0bfb1	Ticket completed - Frank	04/28/2020 04:02	SYSTEM	\N	\N
8f671c87-787d-49ec-8a03-a22864c6f853	f7e932dc-152e-4e24-bcfa-1a2a56c660c6	Ticket approved - Frank	04/28/2020 04:04	SYSTEM	\N	\N
c6c6efaa-f3ec-48c9-9402-e2183beb1973	f7e932dc-152e-4e24-bcfa-1a2a56c660c6	Ticket completed - Frank	04/28/2020 04:04	SYSTEM	\N	\N
232fc5bf-6201-498d-b8d0-12261c7189c0	d447036a-1881-4b2e-8ab4-73439064a199	Ticket approved - Frank	04/28/2020 04:05	SYSTEM	\N	\N
c81522fc-38d6-4f2c-9f6b-3aa80f704aeb	d447036a-1881-4b2e-8ab4-73439064a199	Ticket completed - Frank	04/28/2020 04:07	SYSTEM	\N	\N
9f23f5fa-5d81-473e-b372-7be07fd64d71	ced14e12-e308-4441-8671-23f01e6f197c	Ticket approved - Frank	04/28/2020 04:07	SYSTEM	\N	\N
0c0ce636-0413-413c-8931-cfe22862b409	ced14e12-e308-4441-8671-23f01e6f197c	Ticket completed - Frank	04/28/2020 04:07	SYSTEM	\N	\N
0e723b07-3bed-47ea-9677-1e0c2bf62b86	31d1e7b3-d11f-465b-aff6-92104acd4d4e	Ticket approved - Frank	04/28/2020 04:08	SYSTEM	\N	\N
7e371571-5f20-4c18-bb32-aac1c4499daa	31d1e7b3-d11f-465b-aff6-92104acd4d4e	Ticket completed - Frank	04/28/2020 04:10	SYSTEM	\N	\N
1bd047da-199d-4ea8-8afd-bfa5cd9b3f53	716d9460-cebd-404e-8271-a9a344869abf	Ticket approved - Frank	04/28/2020 04:11	SYSTEM	\N	\N
7be50fdc-9fd3-4500-8fb5-8d30fd045817	5a1a0b2c-4578-4da2-852c-3ef934e8450f	Ticket approved - Frank	04/28/2020 04:14	SYSTEM	\N	\N
8b642da9-6548-4c59-bda3-86972f21ce57	5a1a0b2c-4578-4da2-852c-3ef934e8450f	Ticket completed - Frank	04/28/2020 04:20	SYSTEM	\N	\N
92471d1e-68b4-4cd3-a54d-fc592361013d	d49c60cf-39fa-4ca9-9e2c-ea51d457c0ce	Ticket approved - Frank	04/28/2020 04:28	SYSTEM	\N	\N
46713077-8903-49fc-91a8-1e2c1fa8d8b7	c6cbef43-ca6f-427a-96c5-3ace712d0e11	Ticket approved - Frank	04/28/2020 04:30	SYSTEM	\N	\N
636f931a-fdc9-454f-a3f9-4fc189bf74dc	6e93d4c4-6762-4d42-b6b7-d5155215aa08	Ticket approved - Frank	04/28/2020 04:32	SYSTEM	\N	\N
f4098516-0c54-4d65-9a8e-56462df56038	481fc6ea-0144-4c72-936a-6233e5f12210	Ticket approved - Frank	04/28/2020 04:33	SYSTEM	\N	\N
1fc76184-f171-41d8-b7f8-03bdfdf10e7a	9bd91feb-c5e6-4186-9196-0aeb5e2f67ac	Ticket approved - Frank	04/28/2020 04:42	SYSTEM	\N	\N
d2e5c920-4dcb-4c2e-a265-ea8bd365b6cd	9bd91feb-c5e6-4186-9196-0aeb5e2f67ac	Ticket completed - Frank	04/28/2020 04:42	SYSTEM	\N	\N
2206de24-3a55-4508-a1f8-aa76ef954714	481fc6ea-0144-4c72-936a-6233e5f12210	Ticket completed - Frank	04/28/2020 04:42	SYSTEM	\N	\N
5f956626-d084-4ea9-b2ac-bdc4e6ea78c4	759f6b75-303a-47de-ba4e-d717d7cbc26d	Ticket completed - Frank	04/28/2020 04:42	SYSTEM	\N	\N
2eceeadd-689b-4bd6-a00c-0cd0419b0778	6e93d4c4-6762-4d42-b6b7-d5155215aa08	Ticket completed - Frank	04/28/2020 04:42	SYSTEM	\N	\N
af776967-d2e6-4971-a2d0-47405a608598	c6cbef43-ca6f-427a-96c5-3ace712d0e11	Ticket completed - Frank	04/28/2020 04:42	SYSTEM	\N	\N
ab0a5c69-e992-4a96-8930-2e3b5a8a2cfc	d49c60cf-39fa-4ca9-9e2c-ea51d457c0ce	Ticket completed - Frank	04/28/2020 04:42	SYSTEM	\N	\N
5b3bb37b-6f8c-4215-830c-8a78e538f701	d8d45a6b-d4ae-459c-a2e2-99ee3e0ef8d7	Ticket approved - Frank	04/28/2020 04:55	SYSTEM	\N	\N
dee8eb6b-a71a-4fc4-bca7-d179f54ce216	eb6c1cb2-292f-49c2-8cdb-a5e262f2b4ad	Ticket approved - Frank	04/28/2020 04:56	SYSTEM	\N	\N
47ed4d38-abd7-4598-a6a9-01e3ecf49318	6f387a8b-6333-4a69-8a62-682cd68a7137	Pm to provide ccc with pin	04/28/2020 05:10	Frank	138791132430729217	\N
11e7cb81-9f37-418d-bb1f-d63b8d909d34	6840ed99-7712-4fe9-8f8b-356a38454d77	Ticket submitted - undefined	04/28/2020 08:54	SYSTEM	\N	\N
1c65d382-6e0e-427b-b814-249c568c0468	930fd1dc-28c6-4a55-9f28-f74fc2cda72a	Ticket approved - BeOurGuest	04/28/2020 09:47	SYSTEM	\N	\N
61968275-8be4-46a2-8f5b-1cfb11d2b990	930fd1dc-28c6-4a55-9f28-f74fc2cda72a	Ticket cancelled for reason:  They have already been warned and asked to move, their week of time to move is not done yet. - BeOurGuest	04/28/2020 09:47	SYSTEM	\N	\N
7c49626e-e2bb-4981-b0d7-441c2a735c39	7b29c327-8fbe-4fbb-8332-325e734a835a	Ticket cancelled for reason:  8:02 AM] Frank: Hello Struggler,\r\nyou opened a ticket a while back about two dinos that died in cryopods. Did anyone contact you about this ?\r\n[12:13 PM] The Struggler: A long time ago but it was never solved\r\n[12:59 PM] Frank: ok do you want to drop the ticket or want me to investigate ? I'm pretty sure I already know what I'm gonna tell you in a couple of minutes but you know...\r\n[1:52 PM] The Struggler: Drop it lol they’re useless to what I’ve have now\r\n[1:52 PM] Frank: alright then. I'll cancel your ticket - Frank	04/28/2020 10:53	SYSTEM	\N	\N
145a242b-7f5a-4ae0-982c-76a1ae9f889b	6f387a8b-6333-4a69-8a62-682cd68a7137	7825 -164018 18736 11.22 -80.29\r\nPin code: 1499	04/28/2020 13:03	Frank	138791132430729217	\N
1eee9dae-958c-446d-b7a9-916e7efafb94	716d9460-cebd-404e-8271-a9a344869abf	No CCC, No discord ID in ticket.\r\n-228133 -86683 23815 72.78 -9.05\r\nDr_SZ#3334	04/28/2020 04:12	Frank	138791132430729217	t
36de9822-52db-4e75-a3cf-f862999a3a0a	eb6c1cb2-292f-49c2-8cdb-a5e262f2b4ad	Ticket cancelled for reason:   - Devin	04/28/2020 14:38	SYSTEM	\N	\N
593ecfca-5f23-4af5-9a49-9f37c495534d	27bd79af-0b5b-4a92-8a2b-4ff7244843f5	Ticket submitted - SkyLord	04/28/2020 15:33	SYSTEM	\N	\N
80320c0b-798d-4743-b9f2-bc6e11464904	4686f541-dff7-4c6b-b5c5-8482880263be	Ticket completed - Frank	04/28/2020 18:00	SYSTEM	\N	\N
52b1549d-73ce-403c-b0dc-ef6fb303989b	716d9460-cebd-404e-8271-a9a344869abf	DR_SZ - SAID HE READ RULES ON NOT LEAVING DINOS ON MATING - AWOKE ALL FLYERS AND TOOK DOWN SIGNS AND KILLED SCREAMING PARA.	04/28/2020 18:11	Cowdog	296021653391933440	\N
8df2ad0f-443f-4146-bebb-4360a38fb1c7	716d9460-cebd-404e-8271-a9a344869abf	Ticket completed - Cowdog	04/28/2020 18:11	SYSTEM	\N	\N
0263338b-b8a1-4ca5-899c-515d86321966	6840ed99-7712-4fe9-8f8b-356a38454d77	Ticket approved - Cowdog	04/28/2020 18:18	SYSTEM	\N	\N
49ef55bb-d695-4e89-b3fd-c4b4467768c3	6840ed99-7712-4fe9-8f8b-356a38454d77	Flew around wyvern scar as well as at the CCC that Eurgiga provided in his ticket.  I was not able to find the floating egg, it may have despawned.  I did DM Ledyin directly and explained we cannot leave wyvern eggs laying about in or around the scar as it messes with the wyvern spawns.  I advised to either eat the egg or use it to make kibble.  No warning or points given since there was no proof that it had happened.	04/28/2020 18:38	Cowdog	296021653391933440	\N
8fc74745-2093-4adf-858e-9ef35087ceab	6840ed99-7712-4fe9-8f8b-356a38454d77	Ticket completed - Cowdog	04/28/2020 18:39	SYSTEM	\N	\N
fa8b18ba-de96-4ef4-a531-d8bfb455d776	79360549-8075-4ff9-a9c5-44d3dc3f3664	Ticket submitted - Borealis	04/28/2020 19:35	SYSTEM	\N	\N
484fa5d4-6251-49aa-b519-2372ef3ac1a3	d8d45a6b-d4ae-459c-a2e2-99ee3e0ef8d7	name already crossed in event log book. Pm Vivi to contact me about it. 	04/28/2020 19:39	Frank	138791132430729217	\N
72432952-7560-4d45-9257-7a5fd5dd10bc	2344fd6e-8bef-4413-aa9d-c328e075f0d3	Ticket submitted - undefined	04/29/2020 10:19	SYSTEM	\N	\N
75ae00e5-0f4f-491c-8854-6885cabd946d	2cb08ef5-c36f-4db1-b6fc-eb295c461419	Ticket submitted - Mr.Normis	04/29/2020 13:52	SYSTEM	\N	\N
311ba79a-50fb-481a-98e5-d6499a9940ee	22e29b2d-35b4-46d0-9262-7a6ef9015aeb	Ticket submitted - undefined	04/29/2020 14:34	SYSTEM	\N	\N
307a444e-ba20-42fa-88e0-d5087ed033d7	2344fd6e-8bef-4413-aa9d-c328e075f0d3	Incorrect support form, user meant to use The PACKs form.	04/29/2020 14:35	Zaff	143840467312836609	\N
446f4d9c-ce90-4f50-a026-491cb96ae087	2344fd6e-8bef-4413-aa9d-c328e075f0d3	Ticket cancelled for reason:  Directed user to correct form - Zaff	04/29/2020 14:35	SYSTEM	\N	\N
0e16856e-058e-4d70-9167-3bfd11945947	22e29b2d-35b4-46d0-9262-7a6ef9015aeb	Ticket cancelled for reason:  Incorrect ticket type.  User is not signed into the website, so they do not see the patreon only options. - Zaff	04/29/2020 14:37	SYSTEM	\N	\N
c08b8246-a415-4767-a837-12a12058408f	c85a62d1-2f7b-47a2-8b6a-69b1155bc52d	Ticket submitted - Sodule	04/29/2020 14:39	SYSTEM	\N	\N
4e356935-9a08-4e1d-9782-886aa5167bfd	2ac5587e-9a94-4c9a-9c06-570660788758	Ticket submitted - Sodule	04/29/2020 14:44	SYSTEM	\N	\N
e5c72db4-9ab7-4fbc-b539-0c63ef884e9c	e7e0fb8b-53d8-4af1-b254-ffa2efd4c6a5	Ticket submitted - Sodule	04/29/2020 14:45	SYSTEM	\N	\N
0351fbfd-ddac-4cf4-aa1e-00884babd48d	aa56e91f-46d9-4958-a344-ff6ba20036bb	Ticket submitted - Sodule	04/29/2020 14:46	SYSTEM	\N	\N
f48d4a9c-aa79-4076-84ea-dbf71162c98c	e794470d-5287-4268-8f93-ff436323f547	Ticket submitted - Sodule	04/29/2020 14:48	SYSTEM	\N	\N
c5e087f0-8676-440e-9ca5-6abb3782eba0	354455d8-5eb0-4ef3-8d65-271495bde55a	Ticket submitted - Sodule	04/29/2020 14:49	SYSTEM	\N	\N
7085fe2f-ebed-479c-96c9-8046117d3c83	c85a62d1-2f7b-47a2-8b6a-69b1155bc52d	Ticket approved - Cowdog	04/29/2020 15:20	SYSTEM	\N	\N
5c9170fc-7271-4e6e-8479-afb171534ba5	2ac5587e-9a94-4c9a-9c06-570660788758	Ticket approved - Cowdog	04/29/2020 15:21	SYSTEM	\N	\N
29c7b1f0-15be-4505-99cf-8b877abac6b0	e7e0fb8b-53d8-4af1-b254-ffa2efd4c6a5	Ticket approved - Cowdog	04/29/2020 15:21	SYSTEM	\N	\N
63258141-b206-4c03-9de8-b50ba4c052ef	aa56e91f-46d9-4958-a344-ff6ba20036bb	Ticket approved - Cowdog	04/29/2020 15:21	SYSTEM	\N	\N
b705def5-50ab-4973-b06e-a7bd96b47d04	e794470d-5287-4268-8f93-ff436323f547	Ticket approved - Cowdog	04/29/2020 15:21	SYSTEM	\N	\N
56e47087-b6ca-4262-9bf6-28c249d704ad	354455d8-5eb0-4ef3-8d65-271495bde55a	Ticket approved - Cowdog	04/29/2020 15:21	SYSTEM	\N	\N
e86e41fd-9e7d-44cc-88db-44996a705795	e794470d-5287-4268-8f93-ff436323f547	Ferox\t257376120485652054	04/29/2020 15:55	Cowdog	296021653391933440	\N
1bf01032-aea0-4169-aa36-04db5c6001ab	e794470d-5287-4268-8f93-ff436323f547	Ticket completed - Cowdog	04/29/2020 15:56	SYSTEM	\N	\N
86d5252a-6add-4a0e-8cfd-35052218eb95	2ac5587e-9a94-4c9a-9c06-570660788758	Tusso (F)\t188306266231099872	04/29/2020 16:25	Cowdog	296021653391933440	\N
b3ada791-3305-4f82-9391-bd1e561bd3bd	2ac5587e-9a94-4c9a-9c06-570660788758	Ticket completed - Cowdog	04/29/2020 16:25	SYSTEM	\N	\N
6bc9c78e-804b-428d-86ce-83efa1d40e4e	e7e0fb8b-53d8-4af1-b254-ffa2efd4c6a5	Tek Rex (M)\t42672209415152048	04/29/2020 16:27	Cowdog	296021653391933440	\N
1ae24456-c9fe-473c-a533-a73eab09bd10	e7e0fb8b-53d8-4af1-b254-ffa2efd4c6a5	Ticket completed - Cowdog	04/29/2020 16:27	SYSTEM	\N	\N
2080af2a-9134-4e8d-bdca-993dbe943c77	aa56e91f-46d9-4958-a344-ff6ba20036bb	Tek Rex (F)\t256361891491134684	04/29/2020 16:28	Cowdog	296021653391933440	\N
8391a5e4-2dba-47ee-8367-692c83395ac9	aa56e91f-46d9-4958-a344-ff6ba20036bb	Ticket completed - Cowdog	04/29/2020 16:28	SYSTEM	\N	\N
91cba378-5917-4f4e-aab3-01bca1762741	354455d8-5eb0-4ef3-8d65-271495bde55a	Mosa\t181502123431149122	04/29/2020 16:28	Cowdog	296021653391933440	\N
ba7ac600-6836-4faa-80d2-87b7c95f7559	354455d8-5eb0-4ef3-8d65-271495bde55a	Ticket completed - Cowdog	04/29/2020 16:28	SYSTEM	\N	\N
cffcbd29-62a4-45f5-b2d9-15734670585f	c85a62d1-2f7b-47a2-8b6a-69b1155bc52d	Ticket completed - Cowdog	04/29/2020 16:43	SYSTEM	\N	\N
2588b03d-8d69-4605-bd7a-4b5d587d7834	04a31cf7-5eee-438e-937f-83cea06b7c59	Ticket submitted - Nyrram	04/29/2020 17:07	SYSTEM	\N	\N
ec7f1403-cca9-40c9-8f39-43b960e721cb	04a31cf7-5eee-438e-937f-83cea06b7c59	Ticket approved - Frank	04/29/2020 17:09	SYSTEM	\N	\N
f9f706e9-2c92-4efb-a7c0-f141981b5a01	04a31cf7-5eee-438e-937f-83cea06b7c59	Ticket cancelled for reason:  Player was on an alternate steam account. - Frank	04/29/2020 17:18	SYSTEM	\N	\N
54110782-b541-4ec5-9396-a1b8e1ad3c76	2f1d0d8b-eced-4ab1-bbba-814bbdde7ed2	Ticket submitted - XxFrostbitexX	04/29/2020 19:09	SYSTEM	\N	\N
3c44298b-c714-421f-aba8-6a5210f4633b	2f1d0d8b-eced-4ab1-bbba-814bbdde7ed2	Ticket approved - ShiftyG	04/29/2020 19:32	SYSTEM	\N	\N
718ddb05-7bd6-41b7-8d56-0c7b734b9aee	2f1d0d8b-eced-4ab1-bbba-814bbdde7ed2	Ticket completed - ShiftyG	04/29/2020 19:40	SYSTEM	\N	\N
34d2f183-8bd5-447d-a980-3771ae1cbe12	b6f80726-41ad-4b25-8b77-cf226a7323f3	Ticket submitted - TrapezeMe	04/29/2020 20:05	SYSTEM	\N	\N
58e789a1-ec56-4aab-b90c-86b59be499b3	27bd79af-0b5b-4a92-8a2b-4ff7244843f5	Ticket cancelled for reason:   - SkyLord	04/30/2020 04:51	SYSTEM	\N	\N
583d3ea0-2cda-465f-935d-0e8b8df7d91b	bf802ec4-9591-40ef-b6d5-aab9bd612b8d	Ticket submitted - SkyLord	04/30/2020 04:56	SYSTEM	\N	\N
432173de-af89-427b-8fd1-68e4c0dea73b	cb9e25f5-31a8-4d21-a9c3-39c7b509af64	Ticket submitted - ThreeShot	04/30/2020 09:32	SYSTEM	\N	\N
f7b2efd3-a685-4350-8b79-598df73f9ae1	bf802ec4-9591-40ef-b6d5-aab9bd612b8d	hey so there is no option for it but i need some element moved over from rag to the event map  with the CC.? Want 200 elements over on eventmap	04/30/2020 12:02	SkyLord	297906070251372546	t
29a306cf-eb16-4548-b292-8e2cb2476688	cb9e25f5-31a8-4d21-a9c3-39c7b509af64	Ticket approved - Zylana	04/30/2020 13:10	SYSTEM	\N	\N
8dc7e009-c996-4fef-a8e3-64c99c88df9f	bf802ec4-9591-40ef-b6d5-aab9bd612b8d	Ticket approved - Zylana	04/30/2020 13:11	SYSTEM	\N	\N
7c2b7c5d-039a-42d4-85b4-d66c392e42a5	916033eb-1e64-4106-b6a5-e844e88be974	Ticket approved - Zylana	04/30/2020 13:12	SYSTEM	\N	\N
9a939403-ad94-4350-96f3-baae4a3a0fdc	cb9e25f5-31a8-4d21-a9c3-39c7b509af64	Ticket completed - Zylana	04/30/2020 13:24	SYSTEM	\N	\N
ad4bd20b-42fc-47b8-9d41-577a3b666745	bf802ec4-9591-40ef-b6d5-aab9bd612b8d	Ticket completed - Zylana	04/30/2020 13:32	SYSTEM	\N	\N
982fdc90-e796-422d-bab5-88a98699e5fd	916033eb-1e64-4106-b6a5-e844e88be974	Ticket completed - Zylana	04/30/2020 13:55	SYSTEM	\N	\N
c9b7c0ae-c6c2-4acf-b039-9275e0426f90	7d417f3b-7706-47cd-91df-a4e3dca0bb0e	Ticket completed - Zylana	04/30/2020 13:59	SYSTEM	\N	\N
34a989da-257e-4111-89b1-07631f52be7f	439522e3-3112-49f2-a21a-b62351233a1e	Ticket submitted - Baxlelo	04/30/2020 15:24	SYSTEM	\N	\N
77b653aa-bcd6-41d6-805b-f272f0e05678	2cb08ef5-c36f-4db1-b6fc-eb295c461419	Ticket approved - undefined	04/30/2020 17:44	SYSTEM	\N	\N
6bc49b34-0fd4-4400-98db-3c33c24f5c28	2cb08ef5-c36f-4db1-b6fc-eb295c461419	The Ext ccc puts me in the wastelands with no base around me.	04/30/2020 17:59	BeOurGuest	88994789860610048	\N
c39c066e-c71c-4018-af15-2571b85e47f6	79360549-8075-4ff9-a9c5-44d3dc3f3664	Ticket approved - BeOurGuest	04/30/2020 18:04	SYSTEM	\N	\N
2ee4bdfb-2331-4add-89ab-fb284c46b574	79360549-8075-4ff9-a9c5-44d3dc3f3664	Ticket completed - BeOurGuest	04/30/2020 18:08	SYSTEM	\N	\N
05fedde7-aa89-44f5-b840-98c1fe528ed8	2cb08ef5-c36f-4db1-b6fc-eb295c461419	Ticket cancelled for reason:   - BeOurGuest	04/30/2020 20:14	SYSTEM	\N	\N
b547fe69-080e-4b58-8b51-0950fb2ff848	439522e3-3112-49f2-a21a-b62351233a1e	Ticket approved - ShiftyG	05/01/2020 11:35	SYSTEM	\N	\N
5c5208a9-a47c-4772-97e0-bb22aa3a1b80	439522e3-3112-49f2-a21a-b62351233a1e	Ticket completed - ShiftyG	05/01/2020 11:53	SYSTEM	\N	\N
b37bd1bc-82a3-4dbb-bf6d-8b1e174b61af	4d05405d-e16a-48d2-a563-c5494af5bedc	Ticket approved - ShiftyG	05/01/2020 14:47	SYSTEM	\N	\N
6c90e49c-1918-477d-96c3-cbacd6394163	4d05405d-e16a-48d2-a563-c5494af5bedc	Spoke personally with luna on discord. We will continue to monitor these guys for some time to be sore they don't continue this behavior. 	05/01/2020 15:12	ShiftyG	421143819518476299	\N
65abc293-c5e1-4b9c-a1f3-3726debc2c9e	4d05405d-e16a-48d2-a563-c5494af5bedc	Ticket completed - ShiftyG	05/01/2020 15:17	SYSTEM	\N	\N
5cbe4da6-3149-4a22-8431-d347e5ba754c	7584079d-46d0-45b1-9992-d3dba80b39e6	Ticket submitted - Ragefast	05/01/2020 15:54	SYSTEM	\N	\N
b73a7d00-ec88-45f9-85aa-dc5f584ee3ed	4bc58a7a-a165-4dfa-9a56-a212894b244d	Ticket submitted - Ragefast	05/01/2020 16:11	SYSTEM	\N	\N
7c0c78bb-d441-4efb-a211-9abaddfbf4d3	4bc58a7a-a165-4dfa-9a56-a212894b244d	Ticket approved - Zylana	05/01/2020 18:11	SYSTEM	\N	\N
36289cb2-bf84-484a-a052-4230ef08cdc4	4bc58a7a-a165-4dfa-9a56-a212894b244d	Ticket completed - Zylana	05/01/2020 18:34	SYSTEM	\N	\N
d2323d4b-58d1-4a45-b830-95c3c25b7f7f	b6f80726-41ad-4b25-8b77-cf226a7323f3	I would actually like to request all 4 of the pat dinos I have from Nov 2018-Feb2019. all 4 bloodstalkers, 1 male and 3 female, breedable.	05/01/2020 21:40	TrapezeMe	164888495742124032	\N
0c0cd562-0a04-40c9-adbb-3410b769a49b	3a74a181-0cfb-48bb-97a7-01286d87a11b	Ticket submitted - Baxlelo	05/01/2020 22:12	SYSTEM	\N	\N
8c7f46c5-9397-45ca-a575-3582805ad4f0	3a74a181-0cfb-48bb-97a7-01286d87a11b	Ticket cancelled for reason:  Do not put in a ticket until Sunday  - Zylana	05/01/2020 22:22	SYSTEM	\N	\N
58207eed-552f-414f-93e2-806dc58c236c	b6f80726-41ad-4b25-8b77-cf226a7323f3	Ticket approved - Zylana	05/02/2020 06:51	SYSTEM	\N	\N
c85388db-18d5-4664-a7b9-08cc9289ac33	7584079d-46d0-45b1-9992-d3dba80b39e6	Ticket cancelled for reason:  This is for May, and the list is not out as of 5/2/2020.  - Zylana	05/02/2020 06:54	SYSTEM	\N	\N
dd30edf4-11cf-43c1-8e09-3e76c6e18b60	b6f80726-41ad-4b25-8b77-cf226a7323f3	Four Bog spiders (ewww...) Coming right up. \r\nEnjoy your breeding!	05/02/2020 07:09	Zylana	200464667506638848	\N
f0bf008a-d0b6-4a52-81e4-c5394292835e	b6f80726-41ad-4b25-8b77-cf226a7323f3	Ticket completed - Zylana	05/02/2020 07:09	SYSTEM	\N	\N
8b1f35cd-f68f-45b8-8a2e-2d30dc2f6851	943da927-0b4a-4434-9ca6-6176225d1247	Ticket approved - Zylana	05/02/2020 07:09	SYSTEM	\N	\N
9f12cc17-fbdc-46e5-a870-f39de16a2e53	943da927-0b4a-4434-9ca6-6176225d1247	Thank you for the help! I hope it doesn't Ark you again. 	05/02/2020 07:09	Zylana	200464667506638848	\N
44ae2dbe-b0c1-4315-98d6-a598c303e19e	943da927-0b4a-4434-9ca6-6176225d1247	Ticket completed - Zylana	05/02/2020 07:09	SYSTEM	\N	\N
a9df5fd4-be90-4519-af02-2ac8d405a2a3	0a007a72-4b02-4ef1-865d-bc5174ba4ba9	Ticket submitted - Kolobok	05/02/2020 10:07	SYSTEM	\N	\N
d46fb5b0-b0ab-4d9f-8464-8c83b5c4a283	d2a8ecae-1988-46a0-9887-a9f525ac46bc	Ticket submitted - Cgamer	05/02/2020 12:51	SYSTEM	\N	\N
b55378d2-f52b-40ad-9e92-ad82e106aeef	d2a8ecae-1988-46a0-9887-a9f525ac46bc	Ticket approved - BeOurGuest	05/02/2020 12:54	SYSTEM	\N	\N
934c3dd9-ec42-46a2-a129-7beed12074f5	d2a8ecae-1988-46a0-9887-a9f525ac46bc	Ticket completed - BeOurGuest	05/02/2020 12:54	SYSTEM	\N	\N
699e394b-ca85-48eb-b6fe-0cf214335464	f3094207-cd75-404b-8d7e-022c57480f03	Ticket submitted - FForgotten	05/02/2020 17:52	SYSTEM	\N	\N
d932d470-f97b-4141-92fe-9e2465cfadd9	083109b3-691d-4577-8c90-a43dd6867162	Ticket submitted - Jima (Eren)	05/02/2020 19:17	SYSTEM	\N	\N
f69d84a0-02cd-40e2-9487-24a892bfbc57	083109b3-691d-4577-8c90-a43dd6867162	Ticket cancelled for reason:   - Jima (Eren)	05/02/2020 19:18	SYSTEM	\N	\N
a4f7a461-f0fc-4fea-b6c8-280a7a35c552	2c73a5cb-b7d3-4072-bbcb-95bea8d49c92	Ticket submitted - Jima (Eren)	05/02/2020 19:19	SYSTEM	\N	\N
b9784a35-d477-49c7-81c6-a95f9a3576ae	b5c20a72-799e-4947-abc6-a9729c94c29e	Ticket submitted - Wolf Fang	05/03/2020 06:54	SYSTEM	\N	\N
f0063764-1083-4d1c-be41-2ce5c645f21b	b5c20a72-799e-4947-abc6-a9729c94c29e	Ticket approved - Frank	05/03/2020 08:02	SYSTEM	\N	\N
6860d952-3959-463e-8c6a-9e47dcc38a0a	b5c20a72-799e-4947-abc6-a9729c94c29e	does not block node spawn but nodes are very close to building and could cause potential problems. Will ask to move the base. Asked Wolf Fang to pm me. Will explain and give a timeline for the move.	05/03/2020 08:12	Frank	138791132430729217	\N
73f07241-65cc-4573-b6a9-7d053a52c806	b5c20a72-799e-4947-abc6-a9729c94c29e	Ticket completed - Frank	05/03/2020 08:12	SYSTEM	\N	\N
7575a2ab-cfd0-4eb3-b638-db06882064ae	186038fa-62f7-41fd-9c30-f68025363702	Ticket submitted - Ledyin	05/03/2020 09:06	SYSTEM	\N	\N
7c3675d8-e4e8-4364-acd7-666393203028	186038fa-62f7-41fd-9c30-f68025363702	Ticket approved - Zylana	05/03/2020 10:23	SYSTEM	\N	\N
be76110b-b5c3-48e5-b50c-1339fe0ef9ee	186038fa-62f7-41fd-9c30-f68025363702	Ticket completed - Zylana	05/03/2020 10:47	SYSTEM	\N	\N
73dae099-530c-4f32-a35d-b68a46c454a3	f3094207-cd75-404b-8d7e-022c57480f03	Ticket approved - Zylana	05/03/2020 11:05	SYSTEM	\N	\N
509d6b26-8e06-4ae0-9420-7e36d33553c2	140d6bd1-6a06-4f90-9e27-39ef831ee9f2	Ticket submitted - Talaure	05/03/2020 11:38	SYSTEM	\N	\N
7f9c43a5-f309-4a7d-a797-e3852ea5e151	e4fb7349-e06f-49a2-9a89-092262b1fb1c	Ticket submitted - Reapxrs	05/03/2020 11:39	SYSTEM	\N	\N
9e834142-aaec-44b0-9b67-f93f0aff2066	140d6bd1-6a06-4f90-9e27-39ef831ee9f2	Ticket cancelled for reason:  forgot info. - Talaure	05/03/2020 11:39	SYSTEM	\N	\N
92804681-c527-4351-9fda-9a5aac826874	e4a66225-f51d-44b3-a328-0a00fce9b725	Ticket submitted - Talaure	05/03/2020 11:41	SYSTEM	\N	\N
38ad785b-447c-4389-91a7-34df3d691434	2c73a5cb-b7d3-4072-bbcb-95bea8d49c92	Ticket approved - Zylana	05/03/2020 11:46	SYSTEM	\N	\N
89e67cf5-b576-4445-a343-9b0cbebb9e82	e4a66225-f51d-44b3-a328-0a00fce9b725	Ticket approved - Zylana	05/03/2020 11:46	SYSTEM	\N	\N
399f9200-503e-4e82-81b3-4baa9e28da1a	e4fb7349-e06f-49a2-9a89-092262b1fb1c	Ticket approved - Zylana	05/03/2020 11:46	SYSTEM	\N	\N
4f9e6236-201a-49b3-a05e-e1c5fc11a2cd	0a007a72-4b02-4ef1-865d-bc5174ba4ba9	Ticket approved - Zylana	05/03/2020 11:46	SYSTEM	\N	\N
3ffe7dea-3975-4cb6-92b0-5a0833ac8c41	0a007a72-4b02-4ef1-865d-bc5174ba4ba9	Ticket completed - Zylana	05/03/2020 11:59	SYSTEM	\N	\N
7bbb42e5-7293-4aa9-a12c-2adca643471f	e4fb7349-e06f-49a2-9a89-092262b1fb1c	Ticket completed - Zylana	05/03/2020 11:59	SYSTEM	\N	\N
7f1f5e81-f05f-4b98-be78-02147bf7f857	2c73a5cb-b7d3-4072-bbcb-95bea8d49c92	Ticket completed - Zylana	05/03/2020 12:05	SYSTEM	\N	\N
12c87592-d7c7-4765-8cf4-bb8566fb4ede	e4a66225-f51d-44b3-a328-0a00fce9b725	Ticket completed - Zylana	05/03/2020 12:10	SYSTEM	\N	\N
820e420b-d5a6-41f2-aa0e-461672ab37f0	7c581783-73dc-498f-b8ad-a56043135a84	Ticket submitted - Kirrub	05/03/2020 12:14	SYSTEM	\N	\N
6621ff7e-c866-4046-8850-95b5c073b0dc	7c581783-73dc-498f-b8ad-a56043135a84	Ticket approved - Zylana	05/03/2020 13:52	SYSTEM	\N	\N
e4c9ff12-15a5-46db-82fb-0814d106a253	7c581783-73dc-498f-b8ad-a56043135a84	Ticket completed - Zylana	05/03/2020 13:59	SYSTEM	\N	\N
6cb1fdb5-4aa7-4cdd-81e3-cb8620ed4b31	6f387a8b-6333-4a69-8a62-682cd68a7137	Ticket completed - Zylana	05/03/2020 14:02	SYSTEM	\N	\N
d9b0866d-ce01-43d0-aab0-90efd6d60c77	b5b92e4d-8978-45e3-a649-154dff974209	Ticket submitted - DreEl	05/03/2020 14:10	SYSTEM	\N	\N
b76f056c-d282-4ead-9260-a2ae9db5f059	b5b92e4d-8978-45e3-a649-154dff974209	Ticket approved - Zylana	05/03/2020 14:20	SYSTEM	\N	\N
c50928eb-ff66-4d46-aa4f-71811af48130	b5b92e4d-8978-45e3-a649-154dff974209	Ticket completed - Zylana	05/03/2020 14:24	SYSTEM	\N	\N
4f501046-72a2-4565-9216-16ef3286784f	84bc9a15-d61d-4a73-b95a-70a87ddc1a77	Ticket submitted - terrificfight	05/03/2020 15:59	SYSTEM	\N	\N
27ef1ee4-bbf7-4d2e-b5d9-3e097c4cfaa2	84bc9a15-d61d-4a73-b95a-70a87ddc1a77	I tried hopping to the event map but its still not there. 	05/03/2020 16:03	terrificfight	596710360891785219	\N
ac49c8c7-5d0d-4b70-aaea-3992edaed082	a08421f1-476a-410e-a1e2-78ea5affd2bb	Ticket submitted - FForgotten	05/03/2020 16:08	SYSTEM	\N	\N
f4052f07-ad73-4fee-900c-70dcdacfa8f0	e65d2e8a-c10d-4f68-b660-2890a0644f70	Ticket submitted - terrificfight	05/03/2020 16:39	SYSTEM	\N	\N
581a2362-1de5-4e4e-82b8-eb5ee7e9fb4b	99aa7fc5-ed26-43a3-bbec-d9b4e2a6b749	Ticket submitted - Jaeger	05/03/2020 19:44	SYSTEM	\N	\N
b695549c-46c2-488c-ac60-835fd910d485	4f7b68ea-cc93-4f87-888f-7c892e82acf9	Ticket submitted - mannizzle	05/03/2020 19:45	SYSTEM	\N	\N
b78f81cf-66c6-40a0-b253-a546b7d8c277	42b6496d-e388-4747-820c-33b12c9e30d9	Ticket submitted - cruyd	05/03/2020 20:09	SYSTEM	\N	\N
f9e0a244-839c-47d4-a566-ba79dc9cc93b	7ba123d8-9a5c-4d38-8e55-8fa2319f9cc9	Ticket submitted - Jazz	05/04/2020 06:23	SYSTEM	\N	\N
fb61a909-5389-4008-8a22-6c96fc9e7e46	8a580f44-4572-4360-804e-7b8c67d001b5	Ticket submitted - Ski_skas4	05/04/2020 08:17	SYSTEM	\N	\N
1285c779-abbf-484b-b00e-3de0da780b9b	206b9430-1d51-412a-9767-3a25a2cd3874	Ticket submitted - pressurejuice	05/04/2020 08:24	SYSTEM	\N	\N
14fffacf-f560-4cb9-aed9-dd7787c1c58d	410fec78-f8ca-4181-a3f5-b601055f9718	Ticket submitted - Haldirin	05/04/2020 10:20	SYSTEM	\N	\N
294be861-9dd1-40a2-88b5-f38df73aa982	58af5528-116e-48d8-8541-ccc36687e60e	Ticket submitted - Haldirin	05/04/2020 10:21	SYSTEM	\N	\N
6546d4c9-265b-4cd8-882e-881a6cd1d626	2e05cd36-7be4-4a8e-9da5-652dde50cc29	Ticket submitted - Sid	05/04/2020 13:05	SYSTEM	\N	\N
56319411-1459-408c-baeb-3d7e291bb843	a5a1b90a-000f-4537-a006-16ba92517140	Ticket submitted - Jazz	05/04/2020 13:42	SYSTEM	\N	\N
c77e291c-bfec-4dc1-a942-bacf609ed706	a5a1b90a-000f-4537-a006-16ba92517140	Ticket cancelled for reason:  Let myself die solved\r\n - Jazz	05/04/2020 14:21	SYSTEM	\N	\N
f2d37513-aae6-4c75-b87d-56c284969408	22e968d9-8809-44a6-ae67-74632218032c	Ticket submitted - undefined	05/04/2020 14:24	SYSTEM	\N	\N
1020859f-87e9-4741-8a44-19a62d64dfd4	9c4b8a35-e7bb-4508-a475-f575d33defba	Ticket submitted - leGit510	05/04/2020 14:27	SYSTEM	\N	\N
74c2402f-317f-4198-a3e9-ac5b7a9b0b03	9c4b8a35-e7bb-4508-a475-f575d33defba	Ticket cancelled for reason:  Person is coming to unclaim it - leGit510	05/04/2020 14:28	SYSTEM	\N	\N
be2d5f4a-7701-4e18-bf82-2cfd0ec666d2	5d72a3e2-9763-4c17-a4c7-c6f06f044503	Ticket submitted - Borealis	05/04/2020 19:56	SYSTEM	\N	\N
4bdcba4d-d914-49c5-8a0a-3e2f0916d665	cf25b8c2-c463-41bf-93d9-68eabf738ce6	Ticket submitted - Nasuli	05/04/2020 20:38	SYSTEM	\N	\N
77cdf330-8758-4dda-b31c-6e2b028899dd	cf25b8c2-c463-41bf-93d9-68eabf738ce6	Ticket approved - BeOurGuest	05/04/2020 20:40	SYSTEM	\N	\N
4888cf54-6842-48a7-b69e-11a9dcfb97f4	cf25b8c2-c463-41bf-93d9-68eabf738ce6	Ticket completed - BeOurGuest	05/04/2020 20:40	SYSTEM	\N	\N
f8b79d0d-1c37-4794-b49e-86aaf5abb2ae	8a61c6c0-8201-4f21-a489-3bf0261cb3f5	Ticket submitted - Nasuli	05/04/2020 20:54	SYSTEM	\N	\N
29322e5e-a733-4f84-bbf7-66e8f6ef5437	7a94189d-9374-45e6-be5c-758ef8e19248	Ticket submitted - Ragefast	05/04/2020 21:00	SYSTEM	\N	\N
38a19720-6ff8-427d-9fa9-987a41ebb7ad	7a94189d-9374-45e6-be5c-758ef8e19248	Ticket cancelled for reason:   - Ragefast	05/04/2020 21:04	SYSTEM	\N	\N
26581d7a-cd90-4e0f-8368-10ec3f7b395f	690c6455-ecd2-4145-80b0-4431d0167629	Ticket submitted - Reapxrs	05/04/2020 21:14	SYSTEM	\N	\N
df7b68aa-cfe8-4ebd-92c0-70f11ca086a9	a08421f1-476a-410e-a1e2-78ea5affd2bb	Ticket approved - BeOurGuest	05/04/2020 21:42	SYSTEM	\N	\N
ffe3cf9f-409e-4ddf-a3a3-42709e834245	a08421f1-476a-410e-a1e2-78ea5affd2bb	Ticket completed - BeOurGuest	05/04/2020 21:42	SYSTEM	\N	\N
782149f3-71b5-4d3d-b08d-6e7b88811886	7315a887-c914-4020-bc8f-8a6d44ce8021	Ticket submitted - undefined	05/04/2020 22:03	SYSTEM	\N	\N
8370a6d0-012a-48c8-a511-a8eff22fc18c	8a61c6c0-8201-4f21-a489-3bf0261cb3f5	Ticket cancelled for reason:   - Nasuli	05/04/2020 22:27	SYSTEM	\N	\N
6ea9560f-be7b-42ed-94eb-9e1bf10e6081	97ee0fd1-b9dd-413c-8577-e7d86ba3fbd8	Ticket submitted - Kirrub	05/04/2020 23:27	SYSTEM	\N	\N
570ffb7b-492e-438e-baa3-261a11458969	bb235815-d999-4d33-8495-6cdefc44bab6	Ticket submitted - Nasuli	05/05/2020 00:03	SYSTEM	\N	\N
a9cdb0c5-03a1-43cc-924e-43d4d6e34e8b	84bc9a15-d61d-4a73-b95a-70a87ddc1a77	Ticket approved - Frank	05/05/2020 04:18	SYSTEM	\N	\N
f95d6728-8670-4a66-ac37-cd2bd0a2647a	84bc9a15-d61d-4a73-b95a-70a87ddc1a77	sent pm. Will see what we can do.	05/05/2020 04:19	Frank	138791132430729217	\N
a40afaf2-c7bf-4811-bb9c-c07e77403aa1	22e968d9-8809-44a6-ae67-74632218032c	Ticket approved - Frank	05/05/2020 04:24	SYSTEM	\N	\N
6ba10c46-f82c-4e53-a191-6947bffcf184	22e968d9-8809-44a6-ae67-74632218032c	2020.05.04-21.27.20:089][317]2020.05.04_21.27.20: leGit (leGit): yo spicy, come back and unclaim this owl\r\n[2020.05.04-21.28.27:885][728]2020.05.04_21.28.27: SpicyTuna37 (SpicyTuna37): On my way\r\n[2020.05.04-21.30.06:479][794]2020.05.04_21.30.06: SpicyTuna37 (SpicyTuna37): Please let me explain\r\n[2020.05.04-21.30.13:750][952]2020.05.04_21.30.13: Tribe Xclusive, ID 1811608082: Day 7448, 13:18:17: <RichColor Color="1, 1, 0, 1">SpicyTuna37 unclaimed 'Snow Owl - Lvl 289 (Snow Owl)'!</>)\r\n[2020.05.04-21.30.15:234][983]2020.05.04_21.30.15: leGit (leGit): i scrolled up and saw it\r\n[2020.05.04-21.30.18:815][ 63]2020.05.04_21.30.18: leGit (leGit): np\r\n[2020.05.04-21.30.26:365][232]2020.05.04_21.30.26: leGit (leGit): just unclaim it next time\r\n[2020.05.04-21.30.33:344][406]2020.05.04_21.30.33: Tribe Velocity, ID 1527943133: Day 7448, 13:25:27: <RichColor Color="1, 0, 1, 1">leGit claimed 'Snow Owl - Lvl 289 (Snow Owl)'!</>)\r\nOwl died under Velocity, leGit's tribe on #9	05/05/2020 04:34	Frank	138791132430729217	\N
aff68001-4aa7-47c3-aa7a-b797b7ab3b01	22e968d9-8809-44a6-ae67-74632218032c	Ticket completed - Frank	05/05/2020 04:34	SYSTEM	\N	\N
4992c06e-6c00-4665-8574-21e4524c89bd	84bc9a15-d61d-4a73-b95a-70a87ddc1a77	verifying game file see if it fixes it. 	05/05/2020 04:39	Frank	138791132430729217	\N
af907f49-bac1-4297-a091-1595cdac5b71	97ee0fd1-b9dd-413c-8577-e7d86ba3fbd8	Ticket approved - Frank	05/05/2020 04:42	SYSTEM	\N	\N
99866b17-dbc7-4e3f-8c4b-6eb3e371d885	42b6496d-e388-4747-820c-33b12c9e30d9	Ticket approved - Frank	05/05/2020 04:51	SYSTEM	\N	\N
5a7e1866-66ac-4a02-9450-05279b9036d7	42b6496d-e388-4747-820c-33b12c9e30d9	Ticket completed - Frank	05/05/2020 04:51	SYSTEM	\N	\N
cc12b713-807e-4810-9291-33b4ba2c2c3a	97ee0fd1-b9dd-413c-8577-e7d86ba3fbd8	Ticket completed - Frank	05/05/2020 04:54	SYSTEM	\N	\N
7fa09967-367b-44a0-ba07-e5a37e8dd135	7315a887-c914-4020-bc8f-8a6d44ce8021	Kitten#3336 	05/05/2020 04:55	Frank	138791132430729217	\N
a023cb07-9e79-4fff-89ae-f28d3d8f6d59	7315a887-c914-4020-bc8f-8a6d44ce8021	Ticket approved - Frank	05/05/2020 04:56	SYSTEM	\N	\N
51c7f591-720e-4fc7-8e97-a925b07b9aa5	7315a887-c914-4020-bc8f-8a6d44ce8021	Hello, \r\nin regards to your ticket, sometimes players don't get engrams from bosses. It can have a couple of reasons, like the player being to far when the boss dies or just ark doing bad things. \r\n\r\nYou can look for pop up events, wait for the next round of bosses in June or defeat it on the island.\r\nthank you,	05/05/2020 04:59	Frank	138791132430729217	\N
06dd65c6-ede9-434e-8f3b-24605c695e2d	7315a887-c914-4020-bc8f-8a6d44ce8021	Ticket completed - Frank	05/05/2020 04:59	SYSTEM	\N	\N
e81c33fe-e872-45da-9ac4-f3176df42022	e65d2e8a-c10d-4f68-b660-2890a0644f70	Ticket approved - Frank	05/05/2020 05:02	SYSTEM	\N	\N
1630079b-c53b-4b24-9387-1b8fffe68bc4	e65d2e8a-c10d-4f68-b660-2890a0644f70	Ticket completed - Frank	05/05/2020 05:09	SYSTEM	\N	\N
691c3c02-4cd8-41d7-8b01-bc20b57e22fb	99aa7fc5-ed26-43a3-bbec-d9b4e2a6b749	Ticket approved - Frank	05/05/2020 05:11	SYSTEM	\N	\N
b4f289d0-02cb-4896-b263-ec763d28e0bd	99aa7fc5-ed26-43a3-bbec-d9b4e2a6b749	Ticket completed - Frank	05/05/2020 05:13	SYSTEM	\N	\N
fb673121-3427-4de8-88bf-4c3a01e80597	4f7b68ea-cc93-4f87-888f-7c892e82acf9	Ticket approved - Frank	05/05/2020 05:14	SYSTEM	\N	\N
d190b3c8-07f1-461f-9c93-d818481c0bdf	4f7b68ea-cc93-4f87-888f-7c892e82acf9	Ticket completed - Frank	05/05/2020 05:14	SYSTEM	\N	\N
e5f344b7-6d51-42aa-9585-aa5ec0c945e4	8a580f44-4572-4360-804e-7b8c67d001b5	Ticket approved - Frank	05/05/2020 05:16	SYSTEM	\N	\N
e7526a28-5582-41e9-a34c-1af6ddec25b9	8a580f44-4572-4360-804e-7b8c67d001b5	Ticket completed - Frank	05/05/2020 05:17	SYSTEM	\N	\N
3bed7b26-ad93-4847-9dc1-66374fd4857b	206b9430-1d51-412a-9767-3a25a2cd3874	Ticket approved - Frank	05/05/2020 05:18	SYSTEM	\N	\N
6839704e-46ec-41f7-b199-0117314ff9ae	206b9430-1d51-412a-9767-3a25a2cd3874	Ticket completed - Frank	05/05/2020 05:18	SYSTEM	\N	\N
4502b3b8-bd3e-4aca-8f41-b0d74ca97f7e	2e05cd36-7be4-4a8e-9da5-652dde50cc29	Ticket approved - Frank	05/05/2020 05:20	SYSTEM	\N	\N
83cec962-1263-453f-a158-3a7489f0b511	2e05cd36-7be4-4a8e-9da5-652dde50cc29	Ticket completed - Frank	05/05/2020 05:24	SYSTEM	\N	\N
789d3c8b-4741-4e55-9f01-b4ea95e633c5	5d72a3e2-9763-4c17-a4c7-c6f06f044503	Ticket approved - Frank	05/05/2020 05:27	SYSTEM	\N	\N
0bf55b0f-09f6-4041-b59c-3a61d98bebf7	5d72a3e2-9763-4c17-a4c7-c6f06f044503	Ticket completed - Frank	05/05/2020 05:29	SYSTEM	\N	\N
0e718d34-524b-41d4-996e-edceb51b391d	690c6455-ecd2-4145-80b0-4431d0167629	Ticket approved - Frank	05/05/2020 05:29	SYSTEM	\N	\N
726ca412-769c-492a-974e-8420ff81c40d	7ed7d26e-1fbd-480c-b15c-4aa074e86c7c	Ticket submitted - Jazz	05/05/2020 05:37	SYSTEM	\N	\N
2191053e-eaa9-445c-9c28-1d18f8e56dce	7ed7d26e-1fbd-480c-b15c-4aa074e86c7c	Ticket approved - Frank	05/05/2020 05:58	SYSTEM	\N	\N
24003c24-624b-416b-9335-a39fcb187c66	7ed7d26e-1fbd-480c-b15c-4aa074e86c7c	[2020.05.05-12.32.33:632][679]2020.05.05_12.32.33: Tribe Hogans Hero's, ID 1697215130: Day 15662, 01:37:26: <RichColor Color="1, 1, 0, 1">Jazz was removed from the Tribe!</>)	05/05/2020 06:07	Frank	138791132430729217	\N
e5c59d8a-76bf-4003-99b6-c334a7317f49	7ed7d26e-1fbd-480c-b15c-4aa074e86c7c	Ticket completed - Frank	05/05/2020 06:16	SYSTEM	\N	\N
4c026e6c-5c4b-421b-b8c7-08a0498ea96c	bb235815-d999-4d33-8495-6cdefc44bab6	Ticket approved - Frank	05/05/2020 06:16	SYSTEM	\N	\N
90ac83b0-0a02-4cf2-affd-a52c483a4526	bb235815-d999-4d33-8495-6cdefc44bab6	no pin. Asked for a pm with pin code	05/05/2020 06:16	Frank	138791132430729217	\N
467b1dfb-5657-44a6-b8f2-71395b5e3e33	bb235815-d999-4d33-8495-6cdefc44bab6	7544 is the pin	05/05/2020 06:42	Frank	138791132430729217	\N
81c3d5d1-048d-4c24-ac82-e5d661afc6e1	bb235815-d999-4d33-8495-6cdefc44bab6	Ticket completed - Frank	05/05/2020 07:11	SYSTEM	\N	\N
736021be-f9b3-4787-9029-ed309ebdf059	3b37f58c-b75a-47af-97e1-15036c235a44	Ticket submitted - Fatman101	05/05/2020 07:34	SYSTEM	\N	\N
509d7909-09db-49d6-9c96-2b285c6d5676	3b37f58c-b75a-47af-97e1-15036c235a44	Ticket cancelled for reason:   - Fatman101	05/05/2020 07:34	SYSTEM	\N	\N
dae432ef-e5b6-4d4d-b01f-558658fd50f9	9e5d316e-2149-4cb1-83d7-954c66369d1a	Ticket submitted - Water	05/05/2020 08:01	SYSTEM	\N	\N
af441086-a65e-4fd2-bd72-5aa06bd8ad91	690c6455-ecd2-4145-80b0-4431d0167629	Ticket completed - Frank	05/05/2020 12:58	SYSTEM	\N	\N
cfe73034-a4a9-4562-ad08-71654ee5e0a5	f2d48a1e-afeb-41ca-8e0a-c20bac6733d9	Ticket submitted - lathrop76	05/05/2020 13:58	SYSTEM	\N	\N
2557d27a-805b-4990-90ac-d791428b1084	58af5528-116e-48d8-8541-ccc36687e60e	Can deliver any time i pin coded a storage cabinet in my personal room next to a fireplace the code is 2302	05/05/2020 14:31	Haldirin	322193044570898434	\N
2156ed5b-76cc-483f-aa28-bcabc17d0df8	410fec78-f8ca-4181-a3f5-b601055f9718	Can deliver any time i pin coded a storage cabinet in my personal room next to a fireplace the code is 2302	05/05/2020 14:32	Haldirin	322193044570898434	\N
cee95cc3-a08b-4198-8969-ab3e626cf7b3	df31a840-8913-46de-a838-68bac96fe3e5	Ticket approved - Frank	05/06/2020 14:20	SYSTEM	\N	\N
efbd712a-c0ae-4910-935c-e34d56ca6007	410fec78-f8ca-4181-a3f5-b601055f9718	Can you also restore my previously owned dinos i think its a reaper and tek mech	05/05/2020 14:36	Haldirin	322193044570898434	\N
ec5538ae-d842-4f7d-ac0b-7e49c8f39c4b	58af5528-116e-48d8-8541-ccc36687e60e	Can you also restore my previously owned dinos i think its a reaper and tek mech	05/05/2020 14:36	Haldirin	322193044570898434	\N
a8e0d952-5fb4-4df1-a45c-de7cda925566	df31a840-8913-46de-a838-68bac96fe3e5	Ticket submitted - Haldirin	05/05/2020 14:40	SYSTEM	\N	\N
d6de103d-fb7e-4e81-abdf-0f0eb6a0a973	df31a840-8913-46de-a838-68bac96fe3e5	Can you also restore my previously owned dinos i think its a reaper and tek mech	05/05/2020 14:41	Haldirin	322193044570898434	\N
485424cd-c8dc-4ae1-bae6-1ab144b5c4ea	b6e16290-5ba9-415d-a544-e0558041f200	Ticket submitted - Haldirin	05/05/2020 14:45	SYSTEM	\N	\N
31bb52cf-d98a-48b9-ae3b-43cc9b0c20c4	40fc4f22-93f7-4d71-adaf-c94fdf87946c	Ticket submitted - undefined	05/05/2020 14:54	SYSTEM	\N	\N
e35b318f-977e-4790-b5ab-e5b2bf46f951	40fc4f22-93f7-4d71-adaf-c94fdf87946c	Ticket approved - BeOurGuest	05/05/2020 14:55	SYSTEM	\N	\N
8457b796-b09c-4ee2-90c1-f2be4c2af6be	6f0739cf-ca5c-4920-9729-694f8bd58168	Ticket submitted - Fatman101	05/05/2020 15:51	SYSTEM	\N	\N
1bcf542c-7314-4c2c-9a7d-21b8ce3da0bf	102081bb-55bc-4044-a3cb-2175b209e8af	Ticket submitted - Fatman101	05/05/2020 15:51	SYSTEM	\N	\N
bf885428-36a2-43fa-9f4d-20bded80c08f	40fc4f22-93f7-4d71-adaf-c94fdf87946c	Ticket completed - BeOurGuest	05/05/2020 16:54	SYSTEM	\N	\N
2ff6256b-4edb-4020-8ea9-89bd689594d0	d3974214-7fff-4adc-9796-1ea1b441a4b8	Ticket submitted - Boon1000	05/05/2020 18:21	SYSTEM	\N	\N
38496568-1c18-4db4-93ba-43282f400ef7	f771f4ce-7499-4e54-a20d-30c673b39db2	Ticket submitted - Boon1000	05/05/2020 18:24	SYSTEM	\N	\N
b270d0fb-03af-434e-98c9-e2bb92b6ff3c	d3974214-7fff-4adc-9796-1ea1b441a4b8	Ticket cancelled for reason:  Incorrectly filled out patreon request, no idea who this person is.  - Silver Strange	05/05/2020 18:25	SYSTEM	\N	\N
0cd5ed2f-2e38-4c16-8aa3-426ba07b587b	f771f4ce-7499-4e54-a20d-30c673b39db2	Ticket approved - Chief Rodney	05/05/2020 19:23	SYSTEM	\N	\N
841b98b9-61ad-48fa-afe3-59098d969940	f771f4ce-7499-4e54-a20d-30c673b39db2	Ticket completed - Chief Rodney	05/05/2020 20:43	SYSTEM	\N	\N
1c9abc4a-f488-47bb-915c-cfc344de57ed	7ba123d8-9a5c-4d38-8e55-8fa2319f9cc9	Request still wanted for May	05/05/2020 20:57	Jazz	495341153890205696	\N
98c94af9-db92-44d8-9ec1-6430fcbdfcae	016ab1e4-a613-4a33-b8e1-de7cde1dcc3b	Ticket submitted - Riet	05/05/2020 20:57	SYSTEM	\N	\N
b2c6870b-b97a-483b-aa3e-fdd2f1e7aae8	3e3767c7-486c-495a-a3ee-cd1c444f614a	Ticket submitted - Kolobok	05/05/2020 21:59	SYSTEM	\N	\N
a708af5d-9f40-47ba-99dd-5f55816c8b95	dde86869-e98b-420a-8baa-509aadff558f	Ticket submitted - Borealis	05/06/2020 06:19	SYSTEM	\N	\N
192c4820-e2c5-46c5-8eb5-85f28108d17a	c7a42525-208a-4e68-9642-69eade70c3e8	Ticket submitted - TheOddMe	05/06/2020 06:33	SYSTEM	\N	\N
6e014c38-9528-4d31-96ec-1d2d35258d6c	dde86869-e98b-420a-8baa-509aadff558f	Was requesting help last night with no support. Been waiting now since 6 pm yesterday to get back into the game/grind.	05/06/2020 07:10	Borealis	617077099219648512	\N
6b2c998f-ca90-4166-bb89-2e42ea8388c8	dde86869-e98b-420a-8baa-509aadff558f	I would like someone do Direct message me, or even better would be a call.\r\n	05/06/2020 07:13	Borealis	617077099219648512	\N
49442874-5289-411e-b537-b51aa5f7aeea	3d56d644-c6e3-4c34-b678-256e823da3c2	Ticket submitted - Wutang	05/06/2020 07:18	SYSTEM	\N	\N
0e25a979-942d-4ba2-afc6-6d52bd769833	c7a42525-208a-4e68-9642-69eade70c3e8	Ticket cancelled for reason:   - TheOddMe	05/06/2020 08:24	SYSTEM	\N	\N
8d62cc52-7018-41fe-8b3c-7ffae9160334	05222f6b-a648-475e-a39a-e52b8ab4d7ea	Ticket submitted - banditblood	05/06/2020 08:44	SYSTEM	\N	\N
0143fc91-5b27-4b2c-be7f-5929ea2f0e6b	d3af5289-f364-4983-8e5d-d0961c175048	Ticket submitted - Zeek	05/06/2020 09:36	SYSTEM	\N	\N
daf90f0c-4d12-40b8-84e7-7f4d6c1f217d	7abbfd20-7754-494a-a254-b4de4cf6dea8	Ticket submitted - Water	05/06/2020 10:14	SYSTEM	\N	\N
0d846ddf-8c05-4cbf-a969-635b820ad14a	a7cbdf2e-ac52-4aac-aca7-8f927ec4da5b	Ticket submitted - Ledyin	05/06/2020 10:26	SYSTEM	\N	\N
19266da2-30ab-423d-81f5-e4639f7b1dfb	27a2eed4-1778-491e-b2a7-052d24d722d8	Ticket submitted - xRevolveR	05/06/2020 10:56	SYSTEM	\N	\N
d0dd622e-8999-496c-ba29-b9c2f9ca2c0f	27a2eed4-1778-491e-b2a7-052d24d722d8	Ticket cancelled for reason:   - xRevolveR	05/06/2020 11:01	SYSTEM	\N	\N
cd795eb9-6528-496b-a22d-f0dc31318716	6767a8d2-216a-4a9b-826a-8dbf3e0822b3	Ticket submitted - xRevolveR	05/06/2020 11:02	SYSTEM	\N	\N
69e08bb7-52fb-4a39-98ef-19bd266a6a7a	c9c29750-6854-4c00-bd79-dfc9b6131b9b	Ticket submitted - Tessa	05/06/2020 11:17	SYSTEM	\N	\N
448f3fda-e910-43d9-b4d4-cebca02c6bc2	ff274522-0ab2-4277-b6f3-7537e7661cde	Ticket submitted - TheOddMe	05/06/2020 11:22	SYSTEM	\N	\N
fddc0e3c-5262-4e44-99bf-aec46d0f1285	dde86869-e98b-420a-8baa-509aadff558f	Ticket approved - Zylana	05/06/2020 13:06	SYSTEM	\N	\N
d8630035-77fb-4a0e-8bb7-213c6c9eeb6f	9e5d316e-2149-4cb1-83d7-954c66369d1a	Ticket approved - Frank	05/06/2020 13:46	SYSTEM	\N	\N
bb7d16f3-4187-49dc-ba4d-f37bcecc2292	9e5d316e-2149-4cb1-83d7-954c66369d1a	4:45 PM] Frank: Jimmy\r\n[4:46 PM] Frank: For your ticket about the water pen not being able to put flags on, plant a foundation pillar in a visible place. It will be fine.	05/06/2020 13:47	Frank	138791132430729217	\N
e30a028e-c16d-4729-8bc8-9e521ad33933	9e5d316e-2149-4cb1-83d7-954c66369d1a	Ticket completed - Frank	05/06/2020 13:47	SYSTEM	\N	\N
cf0733c5-10bf-4a60-bc98-0e2d8e754125	7abbfd20-7754-494a-a254-b4de4cf6dea8	Ticket cancelled for reason:  he pmed me on discord and I answered directly. - Frank	05/06/2020 13:48	SYSTEM	\N	\N
f35e718a-0c5f-468b-b09a-ecf36413ebd8	f2d48a1e-afeb-41ca-8e0a-c20bac6733d9	Ticket approved - Frank	05/06/2020 13:49	SYSTEM	\N	\N
0dbc077f-9f35-4a8b-bda7-4193f91ab234	f2d48a1e-afeb-41ca-8e0a-c20bac6733d9	initiate conversation on discord.	05/06/2020 13:50	Frank	138791132430729217	\N
18f59d8a-0b06-4648-906c-1eb880f13d57	05222f6b-a648-475e-a39a-e52b8ab4d7ea	Ticket approved - Frank	05/06/2020 13:51	SYSTEM	\N	\N
719f0605-c142-43f5-9746-5a4fb5830ae9	05222f6b-a648-475e-a39a-e52b8ab4d7ea	Hello, \r\nfor your ticket, let us know when you are online, we can whitelist you manually between two server resets to get your survivor, dinos or anything else out of the server.	05/06/2020 13:52	Frank	138791132430729217	\N
a82692ae-7734-4ecc-ad34-470c0b14d911	dde86869-e98b-420a-8baa-509aadff558f	Ticket completed - Zylana	05/06/2020 13:55	SYSTEM	\N	\N
9a3ccbd3-f9a6-4a00-b5cb-ecf18d91569e	f2d48a1e-afeb-41ca-8e0a-c20bac6733d9	Ticket completed - Zylana	05/06/2020 13:58	SYSTEM	\N	\N
ece0daf0-b255-48e4-b6f5-28dc8b8e05da	ff274522-0ab2-4277-b6f3-7537e7661cde	Ticket approved - Zylana	05/06/2020 14:02	SYSTEM	\N	\N
ad6b54d5-b080-41ad-8f4b-570d16506479	7ba123d8-9a5c-4d38-8e55-8fa2319f9cc9	Ticket approved - Frank	05/06/2020 14:07	SYSTEM	\N	\N
c501576d-883f-4932-af0c-8a6f34a42681	ff274522-0ab2-4277-b6f3-7537e7661cde	Ticket completed - Zylana	05/06/2020 14:10	SYSTEM	\N	\N
dbf08b45-b48e-4cdb-aba2-ce37893423a1	7ba123d8-9a5c-4d38-8e55-8fa2319f9cc9	judyth.gulden@okstate.edu	05/06/2020 14:11	Frank	138791132430729217	\N
ac3227ab-883c-4e76-9da6-d8597ae89244	c9c29750-6854-4c00-bd79-dfc9b6131b9b	Ticket approved - Zylana	05/06/2020 14:12	SYSTEM	\N	\N
88413a55-5457-400c-ae87-515ad5f7f49a	7ba123d8-9a5c-4d38-8e55-8fa2319f9cc9	Ticket completed - Frank	05/06/2020 14:19	SYSTEM	\N	\N
4341ee15-a742-443f-8113-26ac429d7be5	410fec78-f8ca-4181-a3f5-b601055f9718	Ticket approved - Frank	05/06/2020 14:20	SYSTEM	\N	\N
67c81207-e893-4861-8459-1555ae677b9e	58af5528-116e-48d8-8541-ccc36687e60e	Ticket approved - Frank	05/06/2020 14:20	SYSTEM	\N	\N
6fc37863-7091-49bb-b6ba-92460e1609ec	b6e16290-5ba9-415d-a544-e0558041f200	Ticket approved - Frank	05/06/2020 14:20	SYSTEM	\N	\N
24a99621-e4d5-4862-b950-7bca663743e7	c9c29750-6854-4c00-bd79-dfc9b6131b9b	Ticket completed - Zylana	05/06/2020 14:20	SYSTEM	\N	\N
0ac00cd0-bf13-445d-8efe-0c3ea52fd148	6767a8d2-216a-4a9b-826a-8dbf3e0822b3	I forgot to put a color but if possible black and forest green :)	05/06/2020 14:23	xRevolveR	228323212876840961	\N
7619128d-ce1f-4972-859a-b9fb8ddb0719	a7cbdf2e-ac52-4aac-aca7-8f927ec4da5b	Ticket approved - Zylana	05/06/2020 14:24	SYSTEM	\N	\N
30601891-8727-4802-967d-ca14c6814b08	a7cbdf2e-ac52-4aac-aca7-8f927ec4da5b	Ticket completed - Zylana	05/06/2020 14:32	SYSTEM	\N	\N
be87c586-bb32-4f83-a4bf-8c1f99057c64	d3af5289-f364-4983-8e5d-d0961c175048	Ticket approved - Zylana	05/06/2020 14:32	SYSTEM	\N	\N
372b06d1-26ed-41e6-ad50-04648dbeae3b	d3af5289-f364-4983-8e5d-d0961c175048	Ticket completed - Zylana	05/06/2020 14:37	SYSTEM	\N	\N
128d8ca6-0620-48e8-9a0b-975b4a49079c	3d56d644-c6e3-4c34-b678-256e823da3c2	Ticket approved - Zylana	05/06/2020 14:38	SYSTEM	\N	\N
f47ae8c3-52c5-48fb-904b-c575c286f0fc	410fec78-f8ca-4181-a3f5-b601055f9718	Ticket completed - Frank	05/06/2020 14:40	SYSTEM	\N	\N
8daaf9df-db20-479d-ba2d-75c67162f249	58af5528-116e-48d8-8541-ccc36687e60e	Ticket completed - Frank	05/06/2020 14:41	SYSTEM	\N	\N
96d37157-0b0b-47bf-b3e5-dccffcde0f62	df31a840-8913-46de-a838-68bac96fe3e5	Ticket completed - Frank	05/06/2020 14:41	SYSTEM	\N	\N
5ae76f17-a644-44f8-b8a2-275d63a509e3	3d56d644-c6e3-4c34-b678-256e823da3c2	Ticket completed - Zylana	05/06/2020 14:43	SYSTEM	\N	\N
46837b27-313a-44d0-a883-f128f0c7ec69	6767a8d2-216a-4a9b-826a-8dbf3e0822b3	Ticket approved - Zylana	05/06/2020 14:46	SYSTEM	\N	\N
bddfe48b-b545-41fd-a0c2-2965007bd783	6767a8d2-216a-4a9b-826a-8dbf3e0822b3	Ticket completed - Zylana	05/06/2020 14:52	SYSTEM	\N	\N
d90086e5-0356-464f-baa1-75603f6f40ee	3e3767c7-486c-495a-a3ee-cd1c444f614a	Ticket approved - Zylana	05/06/2020 15:07	SYSTEM	\N	\N
73d9a8ef-aae6-4a8b-a7fb-ca0557098039	3e3767c7-486c-495a-a3ee-cd1c444f614a	Ticket completed - Zylana	05/06/2020 15:11	SYSTEM	\N	\N
7ce32ae7-5789-4f4f-8d0c-9d870542381d	016ab1e4-a613-4a33-b8e1-de7cde1dcc3b	Ticket approved - Zylana	05/06/2020 15:15	SYSTEM	\N	\N
eda1c9b8-acd0-458e-bc14-e3455c0d9aea	05222f6b-a648-475e-a39a-e52b8ab4d7ea	Ticket completed - Frank	05/06/2020 15:22	SYSTEM	\N	\N
fae2a4d7-3b7e-4348-8545-344d85c5a7b3	016ab1e4-a613-4a33-b8e1-de7cde1dcc3b	Ticket completed - Zylana	05/06/2020 15:23	SYSTEM	\N	\N
06475cca-105a-4bc2-a832-ce7d73b4ba6b	8f80caef-75f5-4fbb-961b-5cd2f45ddf07	Ticket submitted - Jima (Eren)	05/06/2020 15:30	SYSTEM	\N	\N
91725579-81e9-4010-b98f-7a91920deea2	8f80caef-75f5-4fbb-961b-5cd2f45ddf07	Ticket approved - Zylana	05/06/2020 15:31	SYSTEM	\N	\N
30b5ce8c-bcbc-4bfd-9084-f7383f78d92c	102081bb-55bc-4044-a3cb-2175b209e8af	Ticket approved - Frank	05/06/2020 15:36	SYSTEM	\N	\N
04142927-a045-48df-9095-0a767ae2b7eb	8f80caef-75f5-4fbb-961b-5cd2f45ddf07	Ticket completed - Zylana	05/06/2020 15:36	SYSTEM	\N	\N
88179266-3043-4fb3-9c8b-92ef78f10517	6f0739cf-ca5c-4920-9729-694f8bd58168	Ticket cancelled for reason:  duplicate - Frank	05/06/2020 15:36	SYSTEM	\N	\N
d7d0d509-9a4e-41ea-be72-27bea81063b1	bc5ad6c0-52fe-4664-b425-9894cc0cf1d6	Ticket submitted - The Struggler	05/06/2020 15:49	SYSTEM	\N	\N
9739d5e3-8c40-4c5b-b90e-90ac769e7488	102081bb-55bc-4044-a3cb-2175b209e8af	Ticket completed - Frank	05/06/2020 15:52	SYSTEM	\N	\N
4320d686-2279-478e-95b6-fcdc795dd8c3	bc5ad6c0-52fe-4664-b425-9894cc0cf1d6	Ticket approved - Zylana	05/06/2020 15:52	SYSTEM	\N	\N
2125f665-7193-4408-8caf-84a0a24150b1	bc5ad6c0-52fe-4664-b425-9894cc0cf1d6	Ticket completed - Zylana	05/06/2020 15:58	SYSTEM	\N	\N
01ce5411-e599-4dc6-bfe1-26a6a4ba156d	d8d45a6b-d4ae-459c-a2e2-99ee3e0ef8d7	contact again via pm	05/06/2020 16:00	Frank	138791132430729217	\N
d9f1395a-5274-494c-8ebb-f2739d77ec1c	b6e16290-5ba9-415d-a544-e0558041f200	pm him to provide valid ccc for the element pick up. 	05/06/2020 16:00	Frank	138791132430729217	\N
0e12ea97-efc8-4be9-a96c-e827932e6afd	d8d45a6b-d4ae-459c-a2e2-99ee3e0ef8d7	Ticket cancelled for reason:  player received the element prior to ticket and forgot to cancel - Frank	05/06/2020 16:01	SYSTEM	\N	\N
9d605e12-003d-41a8-98c3-5c7a52277d73	fad59a2d-0bb5-434a-9ed3-4a358a1db8a6	Ticket submitted - Borealis	05/06/2020 16:08	SYSTEM	\N	\N
5a3076e9-53d7-4280-9bb4-e313005e6b97	71e1786c-d54b-45ea-9bc7-eebfcd40f7f7	Ticket submitted - JBizzle	05/06/2020 16:29	SYSTEM	\N	\N
06c58d52-175d-4c95-a870-6c3e43a4998b	48912856-f8c6-43d2-bab2-3aa8331b18fd	Ticket submitted - WZK	05/06/2020 16:54	SYSTEM	\N	\N
cdf10a79-9902-4858-aad7-387593cb563d	b9e43f85-1e2e-4650-9d76-44a7a2cb3036	Ticket submitted - WZK WIFE	05/06/2020 17:01	SYSTEM	\N	\N
4df1a98f-c5a5-4078-86a0-423dab29c555	6e84a6fe-d065-400c-81ca-ef6d1bc610cb	Ticket submitted - Kojo	05/06/2020 17:21	SYSTEM	\N	\N
82f582ff-86af-4890-8f3e-ac494a2f8be4	7de03d29-29bf-4d4f-b07d-a7469a5df546	Ticket submitted - Paddius	05/06/2020 18:13	SYSTEM	\N	\N
653889f5-67d4-49cf-830b-9424f00ba58d	96179d4a-b816-4366-b2ce-1de99e87d44e	Ticket submitted - -Ami-	05/06/2020 18:42	SYSTEM	\N	\N
360c103b-d2c3-48f2-866b-9bfed3abb0aa	b85e03bd-8ebb-417d-a4a0-bd090769e4d8	Ticket submitted - Torgames	05/06/2020 20:26	SYSTEM	\N	\N
7c958e5b-74de-42a1-b0b1-0407c167c6a4	cf8b5a4b-9717-4126-8fbc-81e6abb0b55c	Ticket submitted - Ragefast	05/06/2020 22:50	SYSTEM	\N	\N
d2ed5b4b-2317-4ee4-bde7-43c3d94e639e	0cfe325c-953c-4baf-a543-1a93a66f9d7a	Ticket submitted - FForgotten	05/06/2020 22:59	SYSTEM	\N	\N
2f6b33a9-4f8b-46cc-bbdd-34939148b9c0	b6e16290-5ba9-415d-a544-e0558041f200	-305087 317912 -19919 -38.23 1.24         This is pick-up coords	05/07/2020 03:17	Haldirin	322193044570898434	\N
d7b2e697-5dc9-4cce-bbcf-4afd6b6cbe95	e4d2ec25-a448-4691-afd1-c47530a0f45b	Ticket submitted - Haldirin	05/07/2020 03:42	SYSTEM	\N	\N
9459e6d9-0ecf-4735-82ed-eff30ce4e6c7	84e6381e-a4e7-4a57-bceb-4bfa4ed23b85	Ticket submitted - Haldirin	05/07/2020 03:50	SYSTEM	\N	\N
9bcff2d0-9508-4a04-85c1-a5f7a60c3a33	b6e16290-5ba9-415d-a544-e0558041f200	Ticket cancelled for reason:  bad coordinates - Haldirin	05/07/2020 03:58	SYSTEM	\N	\N
6fc94a2f-fdfa-4722-b00b-e266743ea0fc	240ecb78-0d96-4274-8610-062c1a452be5	Ticket submitted - Haldirin	05/07/2020 04:01	SYSTEM	\N	\N
387ee7e6-ff9d-4eb5-8e5b-775f98f40fb7	4faf3172-8960-4c2a-8058-6f4bcc18e7a2	Ticket submitted - undefined	05/07/2020 10:21	SYSTEM	\N	\N
f499ebca-861b-454b-887d-546bcb2c1e1a	8999cb87-a882-4c9d-a279-3e321c96b9bc	Ticket submitted - Emma	05/07/2020 10:32	SYSTEM	\N	\N
b935ddf8-32cd-4e88-84ff-c85f531f33f5	b85e03bd-8ebb-417d-a4a0-bd090769e4d8	today i am available pretty much all day (1pm atm - 2am CST) i had a work schedule change	05/07/2020 11:07	Torgames	268994711455399936	\N
0467148f-b869-4c72-baac-e2c1437dc3b4	b4b95bfb-8d7e-40c5-88ee-d33c28fc5527	Ticket submitted - SpicyTuna37	05/07/2020 11:34	SYSTEM	\N	\N
0314c2a7-8a9e-49eb-9605-7caba2982d54	f0cc9012-446e-43d6-a3cb-c70ef834efd9	Ticket submitted - Fatman101	05/07/2020 13:37	SYSTEM	\N	\N
1a0613f7-c0dd-48cb-8532-c222e71f01e4	6e84a6fe-d065-400c-81ca-ef6d1bc610cb	Ticket approved - ShiftyG	05/07/2020 13:51	SYSTEM	\N	\N
93826b9d-f9a1-4c62-a1b2-1b9cc54faa8c	6e84a6fe-d065-400c-81ca-ef6d1bc610cb	Ticket completed - ShiftyG	05/07/2020 13:51	SYSTEM	\N	\N
192b3bc7-38c2-406c-bc94-0e5e731ba2dd	48912856-f8c6-43d2-bab2-3aa8331b18fd	Ticket approved - ShiftyG	05/07/2020 13:59	SYSTEM	\N	\N
03daa90f-8633-47f1-831b-88bba0401bf6	b9e43f85-1e2e-4650-9d76-44a7a2cb3036	Ticket approved - ShiftyG	05/07/2020 14:03	SYSTEM	\N	\N
7a85f8d5-bc34-43af-8198-2ef7175b69ea	b9e43f85-1e2e-4650-9d76-44a7a2cb3036	Ticket completed - ShiftyG	05/07/2020 14:14	SYSTEM	\N	\N
3174f5f7-748a-4fe0-8bd6-5b9860f264eb	48912856-f8c6-43d2-bab2-3aa8331b18fd	Ticket completed - ShiftyG	05/07/2020 14:14	SYSTEM	\N	\N
827b6d99-b63d-4bee-86d1-63372ce37ed8	96179d4a-b816-4366-b2ce-1de99e87d44e	Ticket approved - ShiftyG	05/07/2020 14:15	SYSTEM	\N	\N
e28f10e3-0c16-4db9-bbd5-78f00eddc57c	96179d4a-b816-4366-b2ce-1de99e87d44e	Ticket completed - ShiftyG	05/07/2020 14:29	SYSTEM	\N	\N
0d095a6f-ca24-4984-a016-45549ebe157d	4faf3172-8960-4c2a-8058-6f4bcc18e7a2	Ticket approved - ShiftyG	05/07/2020 14:38	SYSTEM	\N	\N
d725ddf8-6dee-4219-a8a9-e06dcc381cad	b85e03bd-8ebb-417d-a4a0-bd090769e4d8	pin is 1031 on a small box next to the ind forge	05/07/2020 14:56	Torgames	268994711455399936	\N
44da66ec-7464-47cd-966a-ed7e3f9c5f0b	4faf3172-8960-4c2a-8058-6f4bcc18e7a2	Ticket cancelled for reason:  Player was able to collect his own dino without admin assistance. - ShiftyG	05/07/2020 15:03	SYSTEM	\N	\N
e004f13a-dc8c-4b90-93b6-71d2f0e3d3f2	b4b95bfb-8d7e-40c5-88ee-d33c28fc5527	Ticket cancelled for reason:   - SpicyTuna37	05/07/2020 15:25	SYSTEM	\N	\N
83e77210-d4b0-497d-8fe1-fd7a3bb5ea4d	f23dccd8-2e67-44fa-a1b8-f44f4995775f	Ticket submitted - Barbequeque	05/07/2020 15:25	SYSTEM	\N	\N
023239df-a4e0-4a6d-b335-5fda54e6473e	f23dccd8-2e67-44fa-a1b8-f44f4995775f	-164229 -88902 56787 103.16 -16.28\r\nTribe of Barbequeque	05/07/2020 15:34	Barbequeque	114238908467904518	\N
74273a89-e559-4326-a638-2741efbc8fe3	f23dccd8-2e67-44fa-a1b8-f44f4995775f	Ticket approved - Zylana	05/07/2020 15:36	SYSTEM	\N	\N
bf5f589f-eadc-4cbd-a658-cd5ba36cb939	f23dccd8-2e67-44fa-a1b8-f44f4995775f	Ticket completed - Zylana	05/07/2020 15:46	SYSTEM	\N	\N
70ce2615-940f-4452-9ab4-af395884c6a8	f0cc9012-446e-43d6-a3cb-c70ef834efd9	Ticket approved - Cowdog	05/07/2020 16:45	SYSTEM	\N	\N
4960f7c2-cee9-405f-b73f-f7f5a6d120f8	71e1786c-d54b-45ea-9bc7-eebfcd40f7f7	Ticket approved - Cowdog	05/07/2020 16:52	SYSTEM	\N	\N
da25e79c-0c71-4449-a9cc-e967af3ee63e	b85e03bd-8ebb-417d-a4a0-bd090769e4d8	Ticket approved - Cowdog	05/07/2020 16:52	SYSTEM	\N	\N
4e5201f5-2d21-400d-89c6-25858ef960a9	0cfe325c-953c-4baf-a543-1a93a66f9d7a	Ticket approved - Cowdog	05/07/2020 16:54	SYSTEM	\N	\N
9e41df5e-e0c9-499e-9063-910060cb11d2	0cfe325c-953c-4baf-a543-1a93a66f9d7a	Ticket completed - Cowdog	05/07/2020 16:55	SYSTEM	\N	\N
d4e5fdd8-299e-448a-afcf-02d3cf9aeb23	cf8b5a4b-9717-4126-8fbc-81e6abb0b55c	Ticket approved - Cowdog	05/07/2020 17:00	SYSTEM	\N	\N
d1755e1c-9dd9-4075-9422-5ee8ce96ce08	cf8b5a4b-9717-4126-8fbc-81e6abb0b55c	Ticket completed - Cowdog	05/07/2020 17:45	SYSTEM	\N	\N
be44d7d1-6626-4e04-9b8f-7ce500dd4cdd	f0cc9012-446e-43d6-a3cb-c70ef834efd9	Ticket completed - Cowdog	05/07/2020 17:59	SYSTEM	\N	\N
390ac28a-0951-4de1-b298-e14410b3f07d	b85e03bd-8ebb-417d-a4a0-bd090769e4d8	Ticket completed - Cowdog	05/07/2020 18:29	SYSTEM	\N	\N
e42cac6a-85da-4fa0-ad80-edca463414a5	71e1786c-d54b-45ea-9bc7-eebfcd40f7f7	Ticket completed - Cowdog	05/07/2020 18:29	SYSTEM	\N	\N
89d785c3-4be4-4b74-8deb-534b558e996b	6e25c354-5015-4641-aac2-e063d1935d22	Ticket submitted - Birb	05/07/2020 21:42	SYSTEM	\N	\N
1edd062e-8701-4355-9f8a-fd1492969db5	b839c561-c9fd-42dc-ad2a-9c6df3374603	Ticket submitted - Torgames	05/08/2020 10:12	SYSTEM	\N	\N
28724033-6622-4f3f-99a2-d8725d7d9cad	6ca48c4b-a118-4773-be10-3d63f17ee37c	Ticket submitted - JBizzle	05/08/2020 13:01	SYSTEM	\N	\N
b34d332c-5cd4-4580-826b-6b11766a1027	fad59a2d-0bb5-434a-9ed3-4a358a1db8a6	Ping me in discord if possible after completion	05/08/2020 13:07	Borealis	617077099219648512	\N
726c6c4a-fc87-490e-8bcc-efbd68292ab2	34f09e7f-f385-4930-ad04-40e0aaf243eb	Ticket submitted - Haldirin	05/08/2020 13:11	SYSTEM	\N	\N
0f93866e-8350-4ff1-a646-6e89ea6011fc	a37acc37-857b-458e-bad8-11e57ce7af0a	Ticket submitted - Reaper843	05/08/2020 19:28	SYSTEM	\N	\N
563ca605-89b9-4c08-b8bd-9d9cd9cea029	bf5b0340-5a39-4442-a007-8b5b49fdadc3	Ticket submitted - Chiatsu	05/08/2020 20:16	SYSTEM	\N	\N
72990352-920e-429f-bc22-cf7075bdbe7f	f7420e83-bb62-4d2d-aaba-366bfa7509c5	Ticket submitted - Reaper843	05/08/2020 21:20	SYSTEM	\N	\N
28b2fe42-2570-45ff-bdfb-92835508b56b	93a5ce11-3d80-4e0d-afc5-391741ac7a31	Ticket submitted - Torgames	05/08/2020 22:07	SYSTEM	\N	\N
f8eb5eaf-7b36-48bb-8460-03f67629da00	34f09e7f-f385-4930-ad04-40e0aaf243eb	\t-293112 254696 -51355.4 (x y z)\r\n74.3 LAT, 22.1 LON    I found the dino on the website these are the exact coords he is under map	05/08/2020 22:10	Haldirin	322193044570898434	\N
12d51be1-3267-4ecc-8cc1-1bb7aa369357	367930d1-803c-4ce9-93ff-42a5c60e9d60	Ticket submitted - Zane	05/08/2020 23:53	SYSTEM	\N	\N
d2eaaa06-923a-40d3-941f-9ca8e5ffea26	b9f27e50-e3e5-43f4-b5b8-d423233bdd59	Ticket submitted - punz	05/09/2020 00:00	SYSTEM	\N	\N
f9f483c9-97b5-4e95-a245-74c985d1afe5	367930d1-803c-4ce9-93ff-42a5c60e9d60	Player is on #13. 	05/09/2020 00:08	Zylana	200464667506638848	\N
0463ebde-8a93-4197-9353-64a6a25151be	367930d1-803c-4ce9-93ff-42a5c60e9d60	Ticket approved - Zylana	05/09/2020 00:22	SYSTEM	\N	\N
4a135b67-199f-4daa-93ec-59ca27bdfe21	367930d1-803c-4ce9-93ff-42a5c60e9d60	He was kicked off 13, and logged onto 11 by accident. 	05/09/2020 00:23	Zylana	200464667506638848	\N
72677082-e250-4003-9be9-7f3040466a3f	367930d1-803c-4ce9-93ff-42a5c60e9d60	Ticket completed - Zylana	05/09/2020 00:23	SYSTEM	\N	\N
d8a31893-2dd8-4d1f-a0cf-6a5b5a2948b9	84bc9a15-d61d-4a73-b95a-70a87ddc1a77	Ticket completed - Frank	05/09/2020 06:01	SYSTEM	\N	\N
885f4e96-4eea-4b5a-9fac-f6dcc790d406	fad59a2d-0bb5-434a-9ed3-4a358a1db8a6	Ticket approved - Frank	05/09/2020 06:20	SYSTEM	\N	\N
7522496e-536a-419d-b483-fdc0a23271ad	7de03d29-29bf-4d4f-b07d-a7469a5df546	Ticket approved - Frank	05/09/2020 06:33	SYSTEM	\N	\N
d83c6878-b6ff-4a56-838c-a270bbab8683	7de03d29-29bf-4d4f-b07d-a7469a5df546	Ticket completed - Frank	05/09/2020 06:41	SYSTEM	\N	\N
2ad5fe8e-ce70-4931-a769-db87b966b293	fad59a2d-0bb5-434a-9ed3-4a358a1db8a6	Ticket completed - Frank	05/09/2020 06:54	SYSTEM	\N	\N
52b53593-9862-49f3-839d-0da9ea51e15f	84e6381e-a4e7-4a57-bceb-4bfa4ed23b85	Ticket approved - Frank	05/09/2020 06:57	SYSTEM	\N	\N
bd8731ee-1dd9-40cb-b3a9-3741039ebdd6	240ecb78-0d96-4274-8610-062c1a452be5	Ticket approved - Frank	05/09/2020 06:57	SYSTEM	\N	\N
360c6fdb-e0e5-4b73-8644-f2cefc6b9035	e4d2ec25-a448-4691-afd1-c47530a0f45b	Ticket approved - Frank	05/09/2020 06:57	SYSTEM	\N	\N
7f4b941b-a13d-4bd5-925d-119297deb253	240ecb78-0d96-4274-8610-062c1a452be5	Ticket completed - Frank	05/09/2020 07:09	SYSTEM	\N	\N
9fd8dc54-cc2f-4b1c-ab6b-af87138afd70	8999cb87-a882-4c9d-a279-3e321c96b9bc	Ticket approved - Frank	05/09/2020 07:15	SYSTEM	\N	\N
c7c2272d-19a9-45f1-a1ee-0e7f24a1d28e	8999cb87-a882-4c9d-a279-3e321c96b9bc	Ticket completed - Frank	05/09/2020 07:15	SYSTEM	\N	\N
71220ff4-3dbc-4269-ad75-478bb5384c08	6e25c354-5015-4641-aac2-e063d1935d22	Ticket approved - Frank	05/09/2020 07:18	SYSTEM	\N	\N
9b365464-6c38-4bdd-92fe-74cff005ddec	6e25c354-5015-4641-aac2-e063d1935d22	Ticket completed - Frank	05/09/2020 07:22	SYSTEM	\N	\N
fc2e6bdb-c239-4867-9529-dc2ea6bcdeaf	6ca48c4b-a118-4773-be10-3d63f17ee37c	Ticket approved - Frank	05/09/2020 07:25	SYSTEM	\N	\N
54f48417-1032-47af-84d4-5ca33f8cbb45	a37acc37-857b-458e-bad8-11e57ce7af0a	Ticket approved - Frank	05/09/2020 07:28	SYSTEM	\N	\N
9451367c-56e5-420e-a521-c70044012bb6	a37acc37-857b-458e-bad8-11e57ce7af0a	Ticket completed - Frank	05/09/2020 07:31	SYSTEM	\N	\N
d97a579a-eb5f-4893-97c9-47943488fc1c	bf5b0340-5a39-4442-a007-8b5b49fdadc3	Ticket approved - Frank	05/09/2020 07:33	SYSTEM	\N	\N
3a4c63aa-b8ce-45f0-b23a-519c0c4d9427	93a5ce11-3d80-4e0d-afc5-391741ac7a31	Ticket approved - Cowdog	05/09/2020 07:42	SYSTEM	\N	\N
0d11ddb6-fe0f-4c5d-9138-e7864a8829e4	bf5b0340-5a39-4442-a007-8b5b49fdadc3	Ticket completed - Frank	05/09/2020 07:54	SYSTEM	\N	\N
04b3aa8d-b301-4955-a911-276087b24224	b9f27e50-e3e5-43f4-b5b8-d423233bdd59	Ticket approved - Frank	05/09/2020 08:02	SYSTEM	\N	\N
15e88ecf-6f3a-4cb6-bc0d-b07a4e827b8d	93a5ce11-3d80-4e0d-afc5-391741ac7a31	Ticket completed - Cowdog	05/09/2020 08:14	SYSTEM	\N	\N
7625dccf-2db3-441d-b603-67df75732d5a	f7420e83-bb62-4d2d-aaba-366bfa7509c5	Ticket approved - Cowdog	05/09/2020 08:18	SYSTEM	\N	\N
db69b47c-5e07-40ff-bfbe-5e47324db00e	b9f27e50-e3e5-43f4-b5b8-d423233bdd59	thank you for letting us know, tribe in question has been notified.	05/09/2020 08:19	Frank	138791132430729217	\N
056010ac-f1d0-4455-aa29-7681ffe381cc	b9f27e50-e3e5-43f4-b5b8-d423233bdd59	Ticket completed - Frank	05/09/2020 08:20	SYSTEM	\N	\N
339fe8e7-0e73-44bc-9ba5-28556d19a2ad	b839c561-c9fd-42dc-ad2a-9c6df3374603	Ticket approved - Cowdog	05/09/2020 08:24	SYSTEM	\N	\N
2a087d44-a98f-4b5d-b048-614ec806ca32	4d692a98-8eca-42f9-8df7-accadac82a5f	Ticket submitted - DreEl	05/10/2020 13:25	SYSTEM	\N	\N
e7337da9-2e1c-47ff-aa0f-8583da8bf506	e4d2ec25-a448-4691-afd1-c47530a0f45b	No mek in pat dino history. tagged in discord	05/09/2020 08:36	Frank	138791132430729217	t
d95b3d8a-c16d-47b0-b6cd-4d7848a4eaab	84e6381e-a4e7-4a57-bceb-4bfa4ed23b85	No reaper in pat dino history. tagged in discord	05/09/2020 08:36	Frank	138791132430729217	t
16169169-d3cd-411a-a189-58340e1afe37	c4f33f4d-4742-4f52-8d61-ac4c324052f8	Ticket submitted - Borealis	05/09/2020 08:46	SYSTEM	\N	\N
b1496d22-fca5-4dcc-b6e6-2373ebbdfd67	f7420e83-bb62-4d2d-aaba-366bfa7509c5	CowdogToday at 10:18 AM\r\nHiya Reap - Question about your ticket.  You did get the 100% imprint bonus on your bloodstalker correct?\r\nI cannot answer why a WC update would boost your imprint to 100%.  It doesn't sound like you lost anything, but you gained one less imprint and still got 100%.\r\nReaper843Today at 10:52 AM\r\ni did not get the 100%, the reason why its at 67% on #9 Val is because i was raising it on #11 genesis and brought it over with 8 mins left till imprint, when the servers rebooted it was at roughly 82%-85% mature with 2 mins till i could imprint, when i came back no more then 5 mins later it was full grown. I dont expect any kind of reimbursment cause i cannot prove any of it so its no big deal! i just went and bread another one! I just wanted to let you guys know that it DID happen to me incase someone else throws a tantrum about it later\r\nreimbursement**	05/09/2020 08:54	Cowdog	296021653391933440	\N
411990a3-6e37-4c0b-afff-aaf40caf5cbd	f7420e83-bb62-4d2d-aaba-366bfa7509c5	Ticket completed - Cowdog	05/09/2020 08:54	SYSTEM	\N	\N
f512b15f-f0dc-4a1f-a4ec-b3e114b40465	eb689c53-4dd6-4642-85ab-a715158fff9b	Ticket submitted - Lee.polito	05/09/2020 09:02	SYSTEM	\N	\N
dc95c91b-89cd-42fd-8bbe-390ec2a33f39	c819667d-ccd8-4aea-a61b-57b6e62b40fe	Ticket submitted - liz	05/09/2020 09:07	SYSTEM	\N	\N
9723e4b4-338b-40dc-9780-1eaab10ed14c	a0c4d403-15df-4e03-bb9f-26278a721b6a	Ticket submitted - liz	05/09/2020 09:09	SYSTEM	\N	\N
53f5fa93-4da7-4e1c-b91e-6cbe26388f77	d5acbac8-fb85-487d-b54f-7a45324df03a	Ticket submitted - Brie	05/09/2020 09:23	SYSTEM	\N	\N
e1a1d7e0-ab4a-4f2d-b6fa-3a66d2087209	b839c561-c9fd-42dc-ad2a-9c6df3374603	Took care of fence foundations at the beaver spawn area, also advised Taco Tuesday to not build there.	05/09/2020 09:44	Cowdog	296021653391933440	\N
54b6a1d8-059d-415b-b8c6-278dcdad3d28	b839c561-c9fd-42dc-ad2a-9c6df3374603	Ticket completed - Cowdog	05/09/2020 09:44	SYSTEM	\N	\N
373e32e9-139a-4a06-bf29-c90130fb0277	84e6381e-a4e7-4a57-bceb-4bfa4ed23b85	under different pat info, looked for last name Caffey Oct 2018\r\nunique ID cannot be found on website, I assume an error on our side. 	05/09/2020 09:53	Frank	138791132430729217	\N
465a0565-0c00-4358-ac78-1e34b001e587	e4d2ec25-a448-4691-afd1-c47530a0f45b	under different pat info, looked for last name Caffey Nov 2018 unique ID cannot be found on website, I assume an error on our side. 	05/09/2020 09:54	Frank	138791132430729217	\N
dd401d7b-d9fd-40b8-b94f-a11701f42925	34f09e7f-f385-4930-ad04-40e0aaf243eb	Ticket approved - Frank	05/09/2020 10:15	SYSTEM	\N	\N
5aab3ecd-de3e-4002-b78b-11c7ecb97db4	34f09e7f-f385-4930-ad04-40e0aaf243eb	Unable to reach it. In a falling animation bellow the point where I get reset to the skybox or despawn completely.	05/09/2020 10:16	Frank	138791132430729217	\N
cb4fc713-64a2-4e3c-9698-67f3cb33fd99	34f09e7f-f385-4930-ad04-40e0aaf243eb	Ticket cancelled for reason:  Unable to reach it. In a falling animation bellow the point where I get reset to the skybox or despawn completely.  - Frank	05/09/2020 10:16	SYSTEM	\N	\N
03ed3360-78fb-4cb6-afb5-f18e3934d923	e4d2ec25-a448-4691-afd1-c47530a0f45b	Ticket completed - Frank	05/09/2020 10:16	SYSTEM	\N	\N
c79a9c71-7516-4389-b69f-0e1dc0a55926	84e6381e-a4e7-4a57-bceb-4bfa4ed23b85	Ticket completed - Frank	05/09/2020 10:16	SYSTEM	\N	\N
67235a63-c3ad-4f58-9cf1-ffdbbcc856b3	b8b89567-dafd-4ab7-8348-405a345111aa	Ticket submitted - punz	05/09/2020 12:02	SYSTEM	\N	\N
f3eff10d-3609-41b1-87f9-35c2ecc4d8e4	514fa1bd-d7db-4fac-bf06-042eb7da284b	Ticket submitted - Barbequeque	05/09/2020 15:53	SYSTEM	\N	\N
ef59383b-37d1-40a3-80b9-207eec6ce725	514fa1bd-d7db-4fac-bf06-042eb7da284b	magma egg was dropped when bird was cryo'd. I believe it was put away for safe keeping by shift somewhere at the yardsale cc.	05/09/2020 19:09	BeOurGuest	88994789860610048	\N
80102286-ae82-4373-8075-4d721e05d4b7	0682fba2-6f88-40e3-ba81-ab5d4e1e385d	Ticket submitted - blrp	05/09/2020 21:00	SYSTEM	\N	\N
c428b81c-08b7-43ee-8f72-894f210cc3be	585c57b2-0fd1-411d-a862-f56dce0ec7d5	Ticket submitted - vldkain	05/09/2020 21:45	SYSTEM	\N	\N
aa72696c-2c3f-45dd-bf35-42ad737ef139	4d325df8-780d-420b-8927-ee37eba7ae47	Ticket submitted - Ace0mac	05/09/2020 23:46	SYSTEM	\N	\N
d6c4d90d-99cd-40ba-a220-b46dcf1a4b68	4d325df8-780d-420b-8927-ee37eba7ae47	Ticket cancelled for reason:  I was able to find it. I used the S+ transfer tool to find it where I cryoed it I must have dropped it with all the meat I dumped out. Sorry for the bother. - Ace0mac	05/09/2020 23:55	SYSTEM	\N	\N
426d03a9-cff9-4d5d-a313-06d0c553cecd	8b3b7b9f-9184-467c-9aec-5b91a2edc1aa	Ticket submitted - Jima (Eren)	05/10/2020 05:44	SYSTEM	\N	\N
b52ab4be-100f-466b-a8ff-6d707b1c4bc9	d695ba87-69b5-4cbb-971e-c666d627c662	Ticket submitted - Jaeger	05/10/2020 07:12	SYSTEM	\N	\N
d2b86a79-9286-45db-803f-0762b2fc2b82	eb689c53-4dd6-4642-85ab-a715158fff9b	Ticket cancelled for reason:   - Lee.polito	05/10/2020 08:48	SYSTEM	\N	\N
cd25ba51-e1da-4937-a7a5-df69c85e97f4	8c00732a-59c0-451c-a2be-a6f0c9d77814	Ticket submitted - Ezio	05/10/2020 09:55	SYSTEM	\N	\N
c35c7202-08ae-40cb-b43a-2167dd1164f9	b8f84fbc-91f4-4479-aaf0-20dd51070473	Ticket submitted - Shrimptaco	05/10/2020 10:47	SYSTEM	\N	\N
27079f8b-5582-40ca-94ac-90ba8e0b67d3	ea4e8c6b-3fe9-4635-860c-4c7545a65c3e	Ticket submitted - teamwolfe19	05/10/2020 13:20	SYSTEM	\N	\N
9fa64ce7-6c06-4a35-9790-6de872387af9	2b780386-1bd1-4321-8a6c-7cb07040bd98	Ticket submitted - Talaure	05/10/2020 14:07	SYSTEM	\N	\N
c029717e-d094-4b13-ad0e-ec2cf7711a43	e37a49d6-f1c9-4363-a2b5-1e9183e3d4d0	Ticket submitted - Birb	05/10/2020 14:11	SYSTEM	\N	\N
81df0c1f-d475-4e6e-9225-61cc8a55dbce	4d692a98-8eca-42f9-8df7-accadac82a5f	Event was the 8th	05/10/2020 14:56	BeOurGuest	88994789860610048	\N
0f3cc394-da27-4e7c-931f-0f04b5b3e66f	ffc7bd64-f8fa-4be7-a69f-9aab44fe0a80	Ticket submitted - darthmosher	05/10/2020 15:55	SYSTEM	\N	\N
213c57c1-8b23-4ed3-898f-14602503591c	5ae2f63c-40b3-4c43-afa6-e43d4d78c0f7	Ticket submitted - Andi	05/10/2020 19:18	SYSTEM	\N	\N
7797a953-e105-4bb0-b517-210f2a0172a8	02dbb21c-92c4-40c3-918d-f69d0cc85cad	Ticket submitted - Brett A	05/10/2020 20:26	SYSTEM	\N	\N
8017ef13-c8f5-415d-b4cb-5fa034468e34	fe47825f-432f-4622-b723-129571171439	Ticket submitted - JCBBlueDevil	05/10/2020 21:41	SYSTEM	\N	\N
871d8c42-5818-41c9-9f47-c0115ff30ac7	d27f44b5-d3e6-473a-a876-849899fdb42f	Ticket submitted - Nasuli	05/11/2020 02:49	SYSTEM	\N	\N
5f7468a3-ec8f-482f-ab56-7efbed7d1a16	19abb1b1-cd45-404f-b812-e51f5230bb4e	Ticket submitted - Adrianna	05/11/2020 03:01	SYSTEM	\N	\N
1ab74c38-c363-4385-9e5b-bf37b2490fae	4826ad1c-4f74-4f48-a100-8697ae42beac	Ticket submitted - Adrianna	05/11/2020 03:02	SYSTEM	\N	\N
4e02c478-cc6f-4e70-909b-d7283df76035	d27f44b5-d3e6-473a-a876-849899fdb42f	Ticket approved - Zylana	05/11/2020 05:13	SYSTEM	\N	\N
868da656-693b-472e-a9a5-25a4c8b5632b	d27f44b5-d3e6-473a-a876-849899fdb42f	There is no record of him at events during this time. He signed up, but was marked 'did not attend.'	05/11/2020 05:15	Zylana	200464667506638848	\N
0bcc83f7-c8eb-450a-b85c-439263aef1dd	02dbb21c-92c4-40c3-918d-f69d0cc85cad	Ticket approved - Zylana	05/11/2020 05:15	SYSTEM	\N	\N
9a3401e4-4f67-4810-8abc-3ea693373894	02dbb21c-92c4-40c3-918d-f69d0cc85cad	Ticket completed - Zylana	05/11/2020 05:19	SYSTEM	\N	\N
44badd22-32d6-428f-968a-b4b7cc2946f4	ffc7bd64-f8fa-4be7-a69f-9aab44fe0a80	Ticket approved - Zylana	05/11/2020 05:20	SYSTEM	\N	\N
36c87487-2da3-43bd-86d8-31d2b2cc1db5	ffc7bd64-f8fa-4be7-a69f-9aab44fe0a80	Ticket completed - Zylana	05/11/2020 05:20	SYSTEM	\N	\N
1a647a4b-4825-45f0-a429-8f5fe13fd2fd	0682fba2-6f88-40e3-ba81-ab5d4e1e385d	Ticket approved - Zylana	05/11/2020 05:21	SYSTEM	\N	\N
81615100-786a-45a0-bc7a-9f8ee3434e4b	0682fba2-6f88-40e3-ba81-ab5d4e1e385d	Unfortunately this is something Ark does and we cannot do much about it. I'm sorry. \r\n	05/11/2020 05:21	Zylana	200464667506638848	\N
bc60d597-e423-4186-be3c-87da8d5d35bd	0682fba2-6f88-40e3-ba81-ab5d4e1e385d	Ticket completed - Zylana	05/11/2020 05:21	SYSTEM	\N	\N
f5e061c1-bdfc-42e5-b744-211b8c670e8a	514fa1bd-d7db-4fac-bf06-042eb7da284b	Ticket approved - Zylana	05/11/2020 05:22	SYSTEM	\N	\N
37f506df-2617-4250-8b7b-baed53bc352c	514fa1bd-d7db-4fac-bf06-042eb7da284b	Shifty saved the egg, but the wyverns cannot have anything done for them. \r\n	05/11/2020 05:22	Zylana	200464667506638848	\N
0cfe2a47-957c-41e9-8ed1-7caa58b05715	514fa1bd-d7db-4fac-bf06-042eb7da284b	Ticket completed - Zylana	05/11/2020 05:22	SYSTEM	\N	\N
f280c300-0dbf-45ba-ae2c-19a497e7950d	2b780386-1bd1-4321-8a6c-7cb07040bd98	Ticket approved - Zylana	05/11/2020 05:28	SYSTEM	\N	\N
3c9c3f89-4c68-440a-a96c-8793be2e13f4	2b780386-1bd1-4321-8a6c-7cb07040bd98	2 events worth delivered	05/11/2020 05:28	Zylana	200464667506638848	\N
11b4b27f-ac96-4cb6-bef5-ab268afd7ab6	2b780386-1bd1-4321-8a6c-7cb07040bd98	Ticket completed - Zylana	05/11/2020 05:28	SYSTEM	\N	\N
42da81af-c447-4d6b-87d8-97933c7392d4	4d692a98-8eca-42f9-8df7-accadac82a5f	Ticket approved - Zylana	05/11/2020 05:30	SYSTEM	\N	\N
ad36dfd4-f811-4921-82dd-8b58e6584fd2	4d692a98-8eca-42f9-8df7-accadac82a5f	Ticket completed - Zylana	05/11/2020 05:30	SYSTEM	\N	\N
42855151-62df-48b5-8c04-a036b84d022e	8b3b7b9f-9184-467c-9aec-5b91a2edc1aa	Ticket approved - Zylana	05/11/2020 05:32	SYSTEM	\N	\N
377c106a-0753-4b9b-b7ae-20ea1622a109	8b3b7b9f-9184-467c-9aec-5b91a2edc1aa	Ticket completed - Zylana	05/11/2020 05:32	SYSTEM	\N	\N
3d08929d-f2a9-446c-9d80-60b615b314ce	d695ba87-69b5-4cbb-971e-c666d627c662	Ticket approved - Zylana	05/11/2020 05:35	SYSTEM	\N	\N
92da72c6-a7f1-4ad0-9a66-a608604b6520	d695ba87-69b5-4cbb-971e-c666d627c662	Ticket completed - Zylana	05/11/2020 05:39	SYSTEM	\N	\N
632b7858-1685-4c49-90f4-3f9fec89072d	b8b89567-dafd-4ab7-8348-405a345111aa	Ticket approved - Zylana	05/11/2020 05:40	SYSTEM	\N	\N
c0748d0f-af82-4468-97a5-3fe447de618d	b8b89567-dafd-4ab7-8348-405a345111aa	Ticket completed - Zylana	05/11/2020 05:40	SYSTEM	\N	\N
7a44804f-79c7-48f0-9b32-d5198342f0a0	5ae2f63c-40b3-4c43-afa6-e43d4d78c0f7	Ticket approved - Zylana	05/11/2020 05:41	SYSTEM	\N	\N
f9242312-42fd-41e1-a864-243c98d123c4	5ae2f63c-40b3-4c43-afa6-e43d4d78c0f7	Ticket completed - Zylana	05/11/2020 05:44	SYSTEM	\N	\N
e7c32c8f-442a-49bc-90f6-55287266f7b2	8c00732a-59c0-451c-a2be-a6f0c9d77814	Ticket approved - Zylana	05/11/2020 05:46	SYSTEM	\N	\N
ab4255b7-f0b7-4e0f-894d-2239111d1437	b8f84fbc-91f4-4479-aaf0-20dd51070473	Ticket approved - Zylana	05/11/2020 05:50	SYSTEM	\N	\N
63f6323f-c650-4266-9b15-e82a110f4b00	b8f84fbc-91f4-4479-aaf0-20dd51070473	Removed screaming para and signs, woke up 3 male birds so they could move base. Still have to be within rules by time given.	05/11/2020 05:51	Zylana	200464667506638848	\N
ce44c9ac-ad3c-4595-8eea-e32255b6a517	b8f84fbc-91f4-4479-aaf0-20dd51070473	Ticket completed - Zylana	05/11/2020 05:51	SYSTEM	\N	\N
231d6282-f432-45db-aee5-4489e017fe2d	e37a49d6-f1c9-4363-a2b5-1e9183e3d4d0	Ticket approved - Zylana	05/11/2020 05:53	SYSTEM	\N	\N
334c8b2c-bc05-4c8f-a80b-9b2de67119e2	e37a49d6-f1c9-4363-a2b5-1e9183e3d4d0	Ticket completed - Zylana	05/11/2020 06:00	SYSTEM	\N	\N
65a00cec-8a25-4de9-a696-ec30f1e4b9fb	8c00732a-59c0-451c-a2be-a6f0c9d77814	Ticket completed - Zylana	05/11/2020 06:05	SYSTEM	\N	\N
cf780fae-05e0-4c5f-97ab-0a4158f9ed0a	3761c01b-62d6-4ca9-a24d-cdae81367f72	Ticket submitted - Titan	05/11/2020 07:00	SYSTEM	\N	\N
455cea71-4100-4da3-82e8-cd9e077d6113	3761c01b-62d6-4ca9-a24d-cdae81367f72	Ticket approved - Zylana	05/11/2020 07:03	SYSTEM	\N	\N
cfb2367f-002b-4680-831f-b2bad5f74236	3761c01b-62d6-4ca9-a24d-cdae81367f72	Ticket completed - Zylana	05/11/2020 07:12	SYSTEM	\N	\N
c62cf54a-4490-4cab-a13d-123637b55e37	c819667d-ccd8-4aea-a61b-57b6e62b40fe	Ticket approved - ShiftyG	05/11/2020 08:18	SYSTEM	\N	\N
041189fa-d12d-4959-b5f2-405a9a3f3298	c819667d-ccd8-4aea-a61b-57b6e62b40fe	Ticket completed - ShiftyG	05/11/2020 08:59	SYSTEM	\N	\N
21bd8cb8-9a34-49fd-b2c6-9cb7cc635f69	a0c4d403-15df-4e03-bb9f-26278a721b6a	Bad CCC\r\n	05/11/2020 09:10	ShiftyG	421143819518476299	\N
f122b987-9634-42bb-b9c7-8ad13f8e0066	a0c4d403-15df-4e03-bb9f-26278a721b6a	Ticket cancelled for reason:  Incorrect CCC puts me falling below the mesh. Resubmit your ticket with a good CCC. - ShiftyG	05/11/2020 09:11	SYSTEM	\N	\N
3a67342b-fa20-40ae-a889-478c62b06d52	585c57b2-0fd1-411d-a862-f56dce0ec7d5	Ticket approved - Ford	05/11/2020 09:21	SYSTEM	\N	\N
1582f350-0989-4480-aebd-59fe86b16edb	585c57b2-0fd1-411d-a862-f56dce0ec7d5	Ticket completed - Ford	05/11/2020 09:30	SYSTEM	\N	\N
13c88e89-04ba-46cd-83f3-63be3b0700ce	66d685e3-bdf8-45cd-8dd3-53c1c521ab1a	Ticket submitted - Sid	05/11/2020 09:43	SYSTEM	\N	\N
7392ece5-a2d6-49cb-a070-844cf7227b12	db9cf7ca-b0d0-48f0-b2c6-18a903a12827	Ticket submitted - Water	05/11/2020 10:17	SYSTEM	\N	\N
66cae3af-1384-4e0f-8329-504d3fc94e51	db9cf7ca-b0d0-48f0-b2c6-18a903a12827	acutally supporters my bad\r\n	05/11/2020 10:24	Water	157665396919500800	\N
3c7698e2-27d8-412b-8432-d009ae315da0	db9cf7ca-b0d0-48f0-b2c6-18a903a12827	Ticket cancelled for reason:   - Water	05/11/2020 10:43	SYSTEM	\N	\N
7d618197-4761-4871-92d4-d69c25be5859	e595cad0-dec5-4e19-8880-68016324d3dd	Ticket submitted - PikaChunti	05/11/2020 11:26	SYSTEM	\N	\N
72a5ef73-dcd6-4b49-89bd-ce6bef58dc04	e595cad0-dec5-4e19-8880-68016324d3dd	A friend made me some of the stuff because he is nice.. but theres still one thing i really would like to get back. It was an ascendant pitchfork.. 	05/11/2020 11:29	PikaChunti	340278608851501057	\N
6cb6a9bf-b944-407b-8d27-d9cf01dc3af6	ed84f027-8286-43cb-8c84-50bcbfd70171	Ticket submitted - WZK	05/11/2020 11:29	SYSTEM	\N	\N
f735ee4a-b78f-4515-b2ba-e3457b17b8f5	ed84f027-8286-43cb-8c84-50bcbfd70171	PIN IS 3374	05/11/2020 11:30	WZK	688223029905588386	\N
489717ef-0a7e-466e-80d5-21ff1d6142ba	774cb714-af93-4fce-9dee-9ed3884185af	Ticket submitted - Shrimptaco	05/11/2020 11:53	SYSTEM	\N	\N
a281e6e7-1000-4708-85a4-1e46f4f70adb	d5acbac8-fb85-487d-b54f-7a45324df03a	Ticket approved - ShiftyG	05/11/2020 12:48	SYSTEM	\N	\N
14d73766-74b3-4f0f-8f13-d43218c7c62c	ed84f027-8286-43cb-8c84-50bcbfd70171	Ticket approved - ShiftyG	05/11/2020 12:51	SYSTEM	\N	\N
8f434684-3e8b-4875-b47d-55fcedd4c9ea	d5acbac8-fb85-487d-b54f-7a45324df03a	Ticket completed - ShiftyG	05/11/2020 13:03	SYSTEM	\N	\N
db68dd77-096e-475d-89d6-9a408f32c9c2	66d685e3-bdf8-45cd-8dd3-53c1c521ab1a	Ticket approved - Ford	05/11/2020 13:05	SYSTEM	\N	\N
4f0be46e-42ed-48a0-9641-4c7665bc0cf8	ed84f027-8286-43cb-8c84-50bcbfd70171	Ticket completed - ShiftyG	05/11/2020 13:10	SYSTEM	\N	\N
47e259b9-bfe0-4837-ba53-d019f6cfa4a1	e595cad0-dec5-4e19-8880-68016324d3dd	Ticket approved - ShiftyG	05/11/2020 13:14	SYSTEM	\N	\N
b2ee9bd7-ccc3-483a-8562-479ced0c157d	e595cad0-dec5-4e19-8880-68016324d3dd	Ticket completed - ShiftyG	05/11/2020 13:34	SYSTEM	\N	\N
bc22efd5-b0f3-4683-8b0f-965451d286b2	ea4e8c6b-3fe9-4635-860c-4c7545a65c3e	Ticket approved - ShiftyG	05/11/2020 13:42	SYSTEM	\N	\N
2303b55c-fb3a-4a64-8349-bb398003378a	66d685e3-bdf8-45cd-8dd3-53c1c521ab1a	Ticket completed - Ford	05/11/2020 13:54	SYSTEM	\N	\N
d409914e-1311-412b-bafc-102db2369d2c	ea4e8c6b-3fe9-4635-860c-4c7545a65c3e	Ticket completed - ShiftyG	05/11/2020 13:55	SYSTEM	\N	\N
25f93da4-9860-4483-967f-ce4610104efc	b9d9b4e5-031e-486a-98b2-c0e44ccd6e90	Ticket submitted - Ski_skas4	05/11/2020 15:22	SYSTEM	\N	\N
2e4564d5-4413-4316-8c41-a3e9798914d7	7f2dac44-cf2e-4100-b9f5-e92a7b54e40f	Ticket submitted - pressurejuice	05/11/2020 15:24	SYSTEM	\N	\N
1de986d9-2ee5-4286-91b1-98effd835009	53ef5d9e-4c94-49bd-9dc2-df6203d7e676	Ticket submitted - liz	05/11/2020 15:28	SYSTEM	\N	\N
5f96b3ea-3363-47c1-a1db-5b362f850103	8556d53b-36f8-4bb0-a583-3484519f635b	Ticket submitted - Ledyin	05/11/2020 18:08	SYSTEM	\N	\N
644738c5-7e42-441d-8817-d7f8f982092f	345c98eb-1da0-41bd-b402-817bb7ad105d	Ticket submitted - TheOddMe	05/11/2020 19:36	SYSTEM	\N	\N
a993a48e-3594-4f57-8bcb-ad5dfdb14a11	345c98eb-1da0-41bd-b402-817bb7ad105d	to be clear this was a tribemate who experienced the bug ...but the megatherium is mine. i took a screenshot of the website.. his name is THERRI and as of right now he is still alive in a cryo	05/11/2020 19:48	TheOddMe	219811551186649089	\N
19068296-b28e-4e19-afea-8a3e9cad2866	adb9a143-f608-4058-b8ae-e1de56d82d4e	Ticket submitted - Mr.Normis	05/11/2020 21:00	SYSTEM	\N	\N
2f528e8e-d56d-40b2-a421-2bb4d85d238b	345c98eb-1da0-41bd-b402-817bb7ad105d	Ticket cancelled for reason:   - TheOddMe	05/11/2020 21:21	SYSTEM	\N	\N
960d746d-9bf6-4916-a122-91b772e39aa1	030c7778-5c98-4262-805f-39672809be6b	Ticket submitted - SkyLord	05/12/2020 06:13	SYSTEM	\N	\N
a72fb98d-ea60-45f1-8f32-f47ef0eaace3	65dd6ff3-090d-40fa-8e23-40b051c3d84d	Ticket submitted - antBEAST_yt	05/12/2020 07:55	SYSTEM	\N	\N
621668e1-3662-417e-9d9e-f1ab58ddb157	65dd6ff3-090d-40fa-8e23-40b051c3d84d	Ticket approved - Frank	05/12/2020 08:04	SYSTEM	\N	\N
c97e034e-1a02-4a1b-8999-4423b88d516b	65dd6ff3-090d-40fa-8e23-40b051c3d84d	Ticket completed - Frank	05/12/2020 08:04	SYSTEM	\N	\N
4083eb57-2ae5-46fb-a04b-e6b668918f87	030c7778-5c98-4262-805f-39672809be6b	i didnt find it my body\r\n	05/12/2020 09:47	SkyLord	297906070251372546	\N
e1f3c6c7-c227-4fe1-b1ec-6db609859f1b	eb0a1049-d2a0-4a05-8f8b-12178912a161	Ticket submitted - Sodule	05/12/2020 10:31	SYSTEM	\N	\N
6c7ad5a4-bebd-469c-8a49-0bec7e718c65	aa31ed18-8bc4-4bfc-a59a-a7983f131a35	Ticket submitted - Shrimptaco	05/12/2020 11:05	SYSTEM	\N	\N
5f41a1a0-ac61-4e98-9f49-6f23621268d0	01e6c2de-a68f-42ee-99b6-53be5d766e1d	Ticket submitted - xRevolveR	05/12/2020 13:09	SYSTEM	\N	\N
37bde7b6-be60-49cf-9d3d-a741f4f3c8f8	5e499707-55bc-474c-bd73-baed0eecba0c	Ticket submitted - MagicHat9	05/12/2020 13:23	SYSTEM	\N	\N
bf2b0777-242d-438b-866f-aa933a98822e	19abb1b1-cd45-404f-b812-e51f5230bb4e	Ticket approved - ShiftyG	05/12/2020 13:23	SYSTEM	\N	\N
acca8034-ae4c-4a82-bacf-2afd89a3891b	4826ad1c-4f74-4f48-a100-8697ae42beac	Ticket approved - ShiftyG	05/12/2020 13:32	SYSTEM	\N	\N
89ae9209-50cc-47c9-af57-438610084f47	4826ad1c-4f74-4f48-a100-8697ae42beac	Ticket completed - ShiftyG	05/12/2020 13:48	SYSTEM	\N	\N
33db132e-35a2-4533-abbe-f583e60af34f	19abb1b1-cd45-404f-b812-e51f5230bb4e	Ticket completed - ShiftyG	05/12/2020 13:48	SYSTEM	\N	\N
d5b93f33-93a2-4bbc-bef8-47d2a287c8eb	fe47825f-432f-4622-b723-129571171439	Ticket approved - ShiftyG	05/12/2020 13:56	SYSTEM	\N	\N
bf5cf40c-aa42-4e58-9f61-c9b55d60b4fe	fe47825f-432f-4622-b723-129571171439	Ticket completed - ShiftyG	05/12/2020 14:17	SYSTEM	\N	\N
c6e90ff7-9fc9-4253-bf48-87dd8c83defe	b9d9b4e5-031e-486a-98b2-c0e44ccd6e90	Ticket approved - ShiftyG	05/12/2020 14:18	SYSTEM	\N	\N
1ce53c9b-115e-439e-93e4-af4d8a787a6e	b9d9b4e5-031e-486a-98b2-c0e44ccd6e90	Ticket completed - ShiftyG	05/12/2020 14:22	SYSTEM	\N	\N
10cb5d9e-ff23-495b-801f-feb64fa02857	53ef5d9e-4c94-49bd-9dc2-df6203d7e676	Ticket approved - ShiftyG	05/12/2020 14:23	SYSTEM	\N	\N
935f69b3-5026-4ed1-95bd-bbc949e65529	53ef5d9e-4c94-49bd-9dc2-df6203d7e676	Ticket completed - ShiftyG	05/12/2020 14:29	SYSTEM	\N	\N
c44a75ca-9202-457c-8cc5-71643540e3d9	00700064-a091-423c-ab3c-c12d843899fa	Ticket submitted - lathrop76	05/12/2020 14:31	SYSTEM	\N	\N
2c539a28-6ea8-46ac-8b99-b29d6c714d52	7f2dac44-cf2e-4100-b9f5-e92a7b54e40f	Ticket approved - ShiftyG	05/12/2020 14:36	SYSTEM	\N	\N
df2d6b17-2ad2-4fe0-a2fa-46ae6e1eda9e	7f2dac44-cf2e-4100-b9f5-e92a7b54e40f	Ticket completed - ShiftyG	05/12/2020 14:41	SYSTEM	\N	\N
fc910386-026c-4301-8974-b083cc296a74	8556d53b-36f8-4bb0-a583-3484519f635b	Ticket approved - ShiftyG	05/12/2020 14:47	SYSTEM	\N	\N
11755c15-eac5-4e57-879b-ea7d4fd9e423	8556d53b-36f8-4bb0-a583-3484519f635b	Ticket completed - ShiftyG	05/12/2020 15:40	SYSTEM	\N	\N
2baac85a-34e6-4581-8235-95681511a4ba	5fa94ed7-0ca7-4d7b-bd06-e9e8da39ad48	Ticket submitted - SpicyTuna37	05/12/2020 18:04	SYSTEM	\N	\N
cc301880-43a5-4258-96fc-3e6e47209ed6	c4f33f4d-4742-4f52-8d61-ac4c324052f8	Ticket approved - Cowdog	05/12/2020 18:29	SYSTEM	\N	\N
7381c452-4191-4d02-b444-f1eb2c03502b	c4f33f4d-4742-4f52-8d61-ac4c324052f8	DM'd Tarnak  to get more info on his missing dino:\r\nCowdogToday at 8:32 PM\r\nHi Tanak, I'm working your ticket you put in.  Can you please explain to me what happened and what dinos/names are missing.  From what I can see if you transferred a dino from Island to Pat Extinction #8.  Was said dino in cryo or did you upload it into ARK dino transfer?	05/12/2020 18:33	Cowdog	296021653391933440	\N
7cae74b2-855a-4b88-af8e-4e09afc17f14	774cb714-af93-4fce-9dee-9ed3884185af	DM's Shrimptaco in regards to his base:\r\nCowdogToday at 8:35 PM\r\nHi Shrimptaco - I'm working your ticket you submitted in regards to what you needed to know about your builds.  I was the one who put the screamer in your base for many reasons.\r\nYour main base needs to be smaller, it is too big.  Please see Rule #8 on a public server you are allowed 100x100 foundations wide and 25 walls tall.  With your current setup, you are above 25 walls tall (this includes the beginning of your stairway leading up to  the roof of your base.  Also, you have a seperate wooden build by the lake, this is making your base too wide.  If you need to speak to me let me know a good time to talk and I will be happy to help you.  Thank you\r\n	05/12/2020 18:43	Cowdog	296021653391933440	\N
d67cb351-9d9e-49d9-93b5-900c0d056ff9	774cb714-af93-4fce-9dee-9ed3884185af	Ticket approved - Cowdog	05/12/2020 18:43	SYSTEM	\N	\N
fae5fe8c-ed68-4721-9d8a-d7e9e522afb8	d27f44b5-d3e6-473a-a876-849899fdb42f	there are records of nasuli joining the server and a sabertooth lv 7547 with her name being killed at the end. It was on the old server log.https://arktest.domination-gaming.com/rest/server/3/log/281d73f3012b2c4d2365d09bb36df875	05/13/2020 06:37	Frank	138791132430729217	\N
bd141315-55bc-4a42-badb-707d1965df6b	6ca48c4b-a118-4773-be10-3d63f17ee37c	Ticket completed - Frank	05/13/2020 06:46	SYSTEM	\N	\N
e6850aed-4bbe-4167-9046-89d19771a8cf	d27f44b5-d3e6-473a-a876-849899fdb42f	Ticket completed - Frank	05/13/2020 06:49	SYSTEM	\N	\N
c18285b1-1274-4b31-8477-6a5156435cba	774cb714-af93-4fce-9dee-9ed3884185af	woke up his rock drake to allow him to transfer stuff out of his ab base. Will destroy ab base and keep the wooden marina as his second base. Will also clean up the stone ramp going down the cliff side. Will let us know when it's all done to complete the ticket.	05/13/2020 07:33	Frank	138791132430729217	\N
91e9a6dd-64cf-4a87-bb82-7d2e08935d4e	adb9a143-f608-4058-b8ae-e1de56d82d4e	Ticket approved - Ford	05/13/2020 08:34	SYSTEM	\N	\N
5425fb98-a520-461a-abe2-f218ca8617fd	00700064-a091-423c-ab3c-c12d843899fa	Ticket approved - Ford	05/13/2020 08:39	SYSTEM	\N	\N
8752cecd-32cf-4bc2-a948-023324e8694a	00700064-a091-423c-ab3c-c12d843899fa	Ticket completed - Ford	05/13/2020 08:45	SYSTEM	\N	\N
7f02abb7-af32-49ce-96ac-5c38f601b94c	01e6c2de-a68f-42ee-99b6-53be5d766e1d	Ticket approved - Ford	05/13/2020 08:46	SYSTEM	\N	\N
15e5092f-53e7-4483-9449-a308ddefb4cb	5fa94ed7-0ca7-4d7b-bd06-e9e8da39ad48	Ticket approved - Ford	05/13/2020 08:46	SYSTEM	\N	\N
af37ea2a-ede7-4314-902e-51166d0d31e3	01e6c2de-a68f-42ee-99b6-53be5d766e1d	Ticket completed - Ford	05/13/2020 08:58	SYSTEM	\N	\N
d63302e4-0410-41ab-959a-2df552132895	5fa94ed7-0ca7-4d7b-bd06-e9e8da39ad48	Ticket completed - Ford	05/13/2020 09:05	SYSTEM	\N	\N
5a404feb-7da9-41c1-ac0c-5f511662303f	28fddc6b-85a5-4eaf-9269-5c7adccf9fdd	Ticket submitted - SpicyTuna37	05/13/2020 12:38	SYSTEM	\N	\N
e4e3ccb2-77be-42a3-b1c2-942e87a34940	c4f33f4d-4742-4f52-8d61-ac4c324052f8	dinos said to be lost all have the same ccc \r\n282289 171954 -9712.44	05/13/2020 13:29	Frank	138791132430729217	\N
c9bf6302-1c07-4b5d-abe2-76765509c7d3	c4f33f4d-4742-4f52-8d61-ac4c324052f8	Ticket cancelled for reason:   - Borealis	05/13/2020 15:58	SYSTEM	\N	\N
1fcd2b77-afeb-4ac2-a9ba-cc06a346ad9c	28fddc6b-85a5-4eaf-9269-5c7adccf9fdd	Ticket approved - Cowdog	05/13/2020 16:39	SYSTEM	\N	\N
09e8ebd3-1ac2-4fdf-8cf0-24e3ac9711d7	5f2c1008-7561-4ba3-afbb-efa2216a521b	Ticket submitted - THENOOBSUPER	05/13/2020 20:47	SYSTEM	\N	\N
728af86c-ec87-426f-b928-aa9ab6754902	5f2c1008-7561-4ba3-afbb-efa2216a521b	Ticket approved - BeOurGuest	05/13/2020 20:54	SYSTEM	\N	\N
023be5dd-cf74-4e29-ab51-1e56d05ba780	28fddc6b-85a5-4eaf-9269-5c7adccf9fdd	Unable to complete request - #5 CCC brings me to a storage box (not in a base) and I have no PIN code	05/14/2020 05:20	Cowdog	296021653391933440	\N
50863e76-ec08-49a5-873d-9672a597fa95	28fddc6b-85a5-4eaf-9269-5c7adccf9fdd	Sent SpicyTuna a DM advising he needs to include a PIN with his request for element transfers.  Also advised his location for his storage box is not in a base location and that the servers are cleaned regularly by admin and his box could be destroyed (either by admin or by wild dinos).	05/14/2020 05:30	Cowdog	296021653391933440	\N
4e71d26f-a5f4-4e90-9a8a-0915c3899e53	28fddc6b-85a5-4eaf-9269-5c7adccf9fdd	Ticket cancelled for reason:  Canceling ticket as it is incomplete - no PIN given to open said box containing element. - Cowdog	05/14/2020 05:31	SYSTEM	\N	\N
1294c646-bc28-4ec2-9cf7-8a73c275a3af	570d0953-6a06-4a06-a89f-f69aa8b72ce5	Ticket submitted - Haldirin	05/14/2020 06:32	SYSTEM	\N	\N
b08adba0-4086-4201-8b77-b33fd73d9d50	570d0953-6a06-4a06-a89f-f69aa8b72ce5	Ticket approved - ShiftyG	05/14/2020 06:52	SYSTEM	\N	\N
f48f1b0c-23ec-4ea9-a58f-7522d046ed90	570d0953-6a06-4a06-a89f-f69aa8b72ce5	Ticket completed - ShiftyG	05/14/2020 07:17	SYSTEM	\N	\N
48953be0-b2ef-49e6-a0d1-9d4ac9fc2333	aa31ed18-8bc4-4bfc-a59a-a7983f131a35	Ticket cancelled for reason:  I was able to fix the problem. - Shrimptaco	05/14/2020 10:42	SYSTEM	\N	\N
52c866f3-22c9-40fb-b75a-f4ff27da9cef	e5c6b62b-a115-4819-8721-89579c18662e	Ticket submitted - Sid	05/14/2020 11:29	SYSTEM	\N	\N
8bdca67e-0794-4518-b8ad-167e7b97def3	41c7e999-006e-4cb6-a2e2-669e9604d18b	Ticket submitted - Borealis	05/14/2020 11:31	SYSTEM	\N	\N
bca33b46-9ce7-47ca-ac0f-75a5fefbec97	ea81d25c-7228-42bd-8826-68023b07267f	Ticket submitted - JohnnyTheHomicidalManiac	05/14/2020 13:06	SYSTEM	\N	\N
ae22642b-9d30-4a32-856f-397801f8f19e	e5c6b62b-a115-4819-8721-89579c18662e	Ticket approved - BeOurGuest	05/14/2020 13:37	SYSTEM	\N	\N
bf5cc3c5-856f-413a-a915-c9a1a18d1c02	41c7e999-006e-4cb6-a2e2-669e9604d18b	Ticket approved - BeOurGuest	05/14/2020 13:37	SYSTEM	\N	\N
4208082c-3393-4098-bf38-e7b927d5c4a9	66250f97-6b8b-46ec-b3b9-efca0be82b55	Ticket submitted - Cyanide	05/14/2020 13:43	SYSTEM	\N	\N
4b99fcc7-5b70-4101-98de-2a6191ca415b	bf171795-bb83-4c60-a02c-8ab57dc5fd1b	Ticket submitted - punz	05/14/2020 14:09	SYSTEM	\N	\N
9dd4bd1f-5e2c-4b79-be2d-1d577a3e4f6b	bf171795-bb83-4c60-a02c-8ab57dc5fd1b	Ticket approved - BeOurGuest	05/14/2020 14:10	SYSTEM	\N	\N
31c47e5d-3c41-4e7b-988a-363fbe0c6fb4	bf171795-bb83-4c60-a02c-8ab57dc5fd1b	Ticket cancelled for reason:  Got educated with cyropods. Will fix the problem later. Thank you! - punz	05/14/2020 14:13	SYSTEM	\N	\N
1893c9aa-719a-4fee-8cb8-ea82ca9d631b	e5c6b62b-a115-4819-8721-89579c18662e	Ticket completed - BeOurGuest	05/14/2020 14:14	SYSTEM	\N	\N
147e6dbe-877b-44a4-80d5-98bcb43038be	a94ef31e-e73a-4b42-8c4e-c314f2ffb9f1	Ticket submitted - Chronic Storm	05/14/2020 14:18	SYSTEM	\N	\N
4c1e1623-deb2-4bf3-9466-d27296614289	bf171795-bb83-4c60-a02c-8ab57dc5fd1b	dinos are in your character's inventory	05/14/2020 14:19	BeOurGuest	88994789860610048	\N
23b16983-2ffe-4b05-bf15-0a48481d1dec	41c7e999-006e-4cb6-a2e2-669e9604d18b	Ticket completed - BeOurGuest	05/14/2020 14:27	SYSTEM	\N	\N
f05d4f9e-8027-49ae-9370-5ee04b621854	dbfebb2b-0f80-4b17-8b1d-08d118ab588d	Ticket submitted - Yug	05/14/2020 15:15	SYSTEM	\N	\N
80c79e80-60dd-4e35-9e0f-eb187f845502	17b12747-ce53-4642-a030-03b99153ad60	Ticket submitted - Yug	05/14/2020 15:15	SYSTEM	\N	\N
f2999019-a6ad-4f85-a2b0-06f6de495a8b	dbfebb2b-0f80-4b17-8b1d-08d118ab588d	Ticket approved - Nast	05/14/2020 15:25	SYSTEM	\N	\N
e196e55b-3e80-44d6-ad53-15680ebddfae	17b12747-ce53-4642-a030-03b99153ad60	Ticket approved - Zylana	05/14/2020 15:26	SYSTEM	\N	\N
fd096ba6-5298-4f3f-a551-af5211b548c7	17b12747-ce53-4642-a030-03b99153ad60	Ticket completed - Zylana	05/14/2020 15:26	SYSTEM	\N	\N
da3d2f25-5218-48ac-8026-44c698956c32	dbfebb2b-0f80-4b17-8b1d-08d118ab588d	Ticket completed - Nast	05/14/2020 15:27	SYSTEM	\N	\N
7eb8d6b4-4c5d-4a1a-9806-4dca217ee9bb	dbfebb2b-0f80-4b17-8b1d-08d118ab588d	You were given a three day ban. You may return to normal play on May 17th, 2020. All appeals before that date will be disregarded. Thank you for using our ticket system, this ticket is now closed.	05/14/2020 15:26	Nast	203048516468211712	t
7c1d9650-ddfc-4092-8dea-7e723627ee93	ea81d25c-7228-42bd-8826-68023b07267f	Ticket approved - Cowdog	05/14/2020 15:30	SYSTEM	\N	\N
1d5cd514-e07b-4841-b413-bc6e642fae14	030c7778-5c98-4262-805f-39672809be6b	Ticket approved - Nast	05/14/2020 15:35	SYSTEM	\N	\N
f15276a0-c825-4e4f-a97f-8a38de80c26d	a94ef31e-e73a-4b42-8c4e-c314f2ffb9f1	Ticket approved - ShiftyG	05/14/2020 15:35	SYSTEM	\N	\N
4f4079ec-fddd-44f9-878c-54757020b716	030c7778-5c98-4262-805f-39672809be6b	Per rule 11 of our ARK servers, we do not replace any lost items, builds, or materials for any reason, as we cannot verify what was in your inventory. This ticket is now closed. Thank you for using our ticket system.	05/14/2020 15:36	Nast	203048516468211712	\N
1cf59eac-cb7d-48b2-b04f-872933139de2	030c7778-5c98-4262-805f-39672809be6b	Ticket completed - Nast	05/14/2020 15:36	SYSTEM	\N	\N
43102ecd-d5fd-49bd-80ef-89eea9b268b0	66250f97-6b8b-46ec-b3b9-efca0be82b55	Ticket approved - Nast	05/14/2020 15:37	SYSTEM	\N	\N
3e872565-8d11-4e0f-b7a2-3b66054f1320	66250f97-6b8b-46ec-b3b9-efca0be82b55	I've had this happen before. I would try relogging and/or transferring your character to a different server and then back to your original server, and see if that helps. Please add to the note section if it does. 	05/14/2020 15:38	Nast	203048516468211712	\N
6da377ed-ed91-4d31-82e4-b05095edfed3	5e499707-55bc-474c-bd73-baed0eecba0c	If we were going to assist you in this way, we would need to know exactly who you wanted added to your tribe. Can you provide that information?	05/14/2020 15:40	Nast	203048516468211712	\N
798633c9-aa96-4eb5-899f-7fd9529ad80c	f3094207-cd75-404b-8d7e-022c57480f03	Ticket cancelled for reason:  Demo allowed on their base, did not get back to admin team about their animals.  - Zylana	05/14/2020 15:40	SYSTEM	\N	\N
ed1b6625-a44f-47cf-9360-4b2d6f812946	eb0a1049-d2a0-4a05-8f8b-12178912a161	Ticket approved - Nast	05/14/2020 15:56	SYSTEM	\N	\N
a4b3b6b6-df6c-4e15-a3c5-db91be0013d7	ea81d25c-7228-42bd-8826-68023b07267f	Ticket completed - Cowdog	05/14/2020 15:57	SYSTEM	\N	\N
20c5a344-6d05-4d8a-9fa3-60acab7abb66	eb0a1049-d2a0-4a05-8f8b-12178912a161	Mosa left in cryofridge at CCC. No pin was provided in ticket, so I force joined the tribe long enough to put the Mosa in the fridge. The ticket is now completed. Thank you for using our ticket system, and for supporting the DomiNATION cluster! 	05/14/2020 15:57	Nast	203048516468211712	\N
fa375ac4-6779-44fd-b12d-1b7b886762f8	eb0a1049-d2a0-4a05-8f8b-12178912a161	Ticket completed - Nast	05/14/2020 15:57	SYSTEM	\N	\N
559214e7-52b5-4215-a14a-23c27581eda9	5f2c1008-7561-4ba3-afbb-efa2216a521b	You said your metal floor had a forge built on it, but did it have any other structure pieces connected to it, such as another foundation or walls? If it was just a single foundation with nothing else attached to it, it would have automatically decayed after 12 hours, as that is a setting WildCard has put in place to combat foundation/pillar spam. 	05/14/2020 16:00	Nast	203048516468211712	\N
d806bbc6-3f41-4a0c-9e4a-682c34c7fa69	5f2c1008-7561-4ba3-afbb-efa2216a521b	Ticket completed - BeOurGuest	05/14/2020 16:38	SYSTEM	\N	\N
018fd51a-8b8c-414c-9f34-a3b7f57582e6	6755fd8c-722d-4929-8fc7-de498c69321c	Ticket submitted - JCBBlueDevil	05/14/2020 17:06	SYSTEM	\N	\N
55531b7b-1ac8-4c86-8869-7b48ffc892ab	6755fd8c-722d-4929-8fc7-de498c69321c	Ticket approved - Nast	05/14/2020 18:31	SYSTEM	\N	\N
4137a22a-084b-47b7-b3f2-8d6712d4d07a	6755fd8c-722d-4929-8fc7-de498c69321c	Ticket completed - Nast	05/14/2020 18:31	SYSTEM	\N	\N
f1e6dc0b-a9c4-4a82-becb-ed27b8416a44	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	Ticket submitted - Jazz	05/14/2020 18:51	SYSTEM	\N	\N
23a53946-4a00-428b-a7bc-1e9622112fae	6476c4a0-1ba1-4b7e-980d-c13ff90cd0d4	Ticket submitted - ♛Queenie♛	05/14/2020 19:15	SYSTEM	\N	\N
935be360-74a6-4900-b8de-7f2a318de7db	36cd4bcc-db21-42ce-99b1-93e3c59684d6	Ticket submitted - XxFrostbitexX	05/15/2020 11:08	SYSTEM	\N	\N
b106a06a-e0a0-4844-b601-01d960ba7b3b	a94ef31e-e73a-4b42-8c4e-c314f2ffb9f1	Took over tribe, removed mouse, accepted merge request from Frost, left tribe.	05/15/2020 13:44	ShiftyG	421143819518476299	\N
6d6c17ad-3053-4dea-b8f8-63236c3a894b	a94ef31e-e73a-4b42-8c4e-c314f2ffb9f1	Ticket completed - ShiftyG	05/15/2020 13:44	SYSTEM	\N	\N
9cec9425-8f07-47a5-8bab-5347fd8f9dc4	20762625-4623-45a7-a407-ecd421d54a22	Ticket submitted - 南瓜ya	05/15/2020 15:57	SYSTEM	\N	\N
b51490d6-f5a7-428e-944a-b872867614d9	c5e00c10-55f5-4d11-8f06-abba9e500623	Ticket submitted - Tower	05/15/2020 16:39	SYSTEM	\N	\N
fe02ce86-67f5-4a13-a207-e3e52c66e3fe	6ad6dc06-ef0c-409c-947f-7bf1cdbb29d6	Ticket submitted - Fatman101	05/15/2020 16:54	SYSTEM	\N	\N
72ad3881-d01c-4edb-bbd1-0b9840d07c15	6ad6dc06-ef0c-409c-947f-7bf1cdbb29d6	ccc is 218213 -442410 -11932 44.48 -36.13\r\nthe pin is: 2275	05/15/2020 16:54	Fatman101	439974141072769058	\N
26589f46-e64a-4f57-8b68-adc50c55bf9e	34a69651-3cc3-4a0b-8b9c-a63d12d1c5d2	Ticket submitted - Enmity	05/15/2020 17:11	SYSTEM	\N	\N
95c53cd8-afae-4a00-91b5-eff3fab3df8d	34a69651-3cc3-4a0b-8b9c-a63d12d1c5d2	Ticket approved - Cowdog	05/15/2020 17:11	SYSTEM	\N	\N
c295cd70-f115-479c-bec4-8de43b6a72b9	6476c4a0-1ba1-4b7e-980d-c13ff90cd0d4	Amount increased to 7441	05/15/2020 17:13	♛Queenie♛	360603244956745729	\N
b6f13336-d044-478d-82df-9ca991eedb26	34a69651-3cc3-4a0b-8b9c-a63d12d1c5d2	Was able to assist and rescue two ankys.  Suggested in the area of the build to put breeders on foundation to help prevent them under meshing.	05/15/2020 17:33	Cowdog	296021653391933440	\N
a8837fd3-5d1e-4334-976d-90e62786f352	34a69651-3cc3-4a0b-8b9c-a63d12d1c5d2	Ticket completed - Cowdog	05/15/2020 17:33	SYSTEM	\N	\N
4d388075-3399-488f-b6b8-70157d291e95	66250f97-6b8b-46ec-b3b9-efca0be82b55	Please DM me in regards to your ticket.  Thank you	05/15/2020 17:37	Cowdog	296021653391933440	\N
39fa8d3b-0686-4732-b3e3-c03c8788d516	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	Ticket approved - Cowdog	05/15/2020 17:39	SYSTEM	\N	\N
c05acb4b-2b43-4582-9447-62ddacfb48f3	6476c4a0-1ba1-4b7e-980d-c13ff90cd0d4	Ticket approved - Ford	05/15/2020 18:50	SYSTEM	\N	\N
8cfc427d-1f7e-4479-8abe-e0462f421b46	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	Left message in Admin-Support - no pin code given to use vault.	05/15/2020 19:22	Cowdog	296021653391933440	\N
a086ab67-5d07-4a4b-b729-0bf3421afb96	6476c4a0-1ba1-4b7e-980d-c13ff90cd0d4	Ticket completed - Ford	05/15/2020 19:35	SYSTEM	\N	\N
498ee567-3b65-4a35-9334-16a6a23a2994	bc884148-7684-46ad-8f97-dd52aa267305	Ticket submitted - FForgotten	05/15/2020 20:58	SYSTEM	\N	\N
a915b9ea-ab9f-4f70-a6fd-3bb8211f4edc	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	PIN Code given 1241	05/15/2020 21:20	Cowdog	296021653391933440	\N
841f1f20-4da4-4094-8140-53522fb76f78	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	CowdogToday at 11:25 PM\r\nHey I'm in your base on 8 - your CCC brought me to a purple vault that was locked (not pin coded).  It does not contain element.	05/15/2020 21:25	Cowdog	296021653391933440	\N
9ebab3ac-6f55-4c73-bb74-7f5c161f264a	cc66e30b-bb24-46b5-9cee-58c216623c76	Ticket submitted - Guics	05/15/2020 21:59	SYSTEM	\N	\N
fb9f0342-62fd-475a-9200-f2739f6e65d6	21544566-743c-4ca6-8799-678795a3504c	Ticket submitted - prowaterbuffalo	05/15/2020 22:17	SYSTEM	\N	\N
a4452624-dd3e-41ce-b28e-71974021a373	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	Found out which vault to use.  Also, asked that they do their CCC in front of the storage they wish items to be picked up from or placed into.  	05/15/2020 22:20	Cowdog	296021653391933440	\N
e3f7c731-13fb-4b7d-94e6-b054b19aaa3e	53bc42fa-ecba-4da9-b0c7-22b8c58c319f	Ticket completed - Cowdog	05/15/2020 22:20	SYSTEM	\N	\N
93f05307-51f8-4ec9-8265-0dec177f00e9	125c9a81-4fc1-4181-a4a4-5c9dc52b2b92	Ticket submitted - Zeek	05/16/2020 06:20	SYSTEM	\N	\N
c574a9b2-9d22-49bf-b436-0c9748141fc5	9f1a704a-a732-4001-9102-7e9c108c7835	Ticket submitted - Haldirin	05/16/2020 07:51	SYSTEM	\N	\N
b384d358-c00b-409d-b724-96a72330ceda	d29d2999-00ae-4aed-adca-432dff993b58	Ticket submitted - Haldirin	05/16/2020 07:52	SYSTEM	\N	\N
b6e9f8fc-6db0-4dbb-a8f4-1da1294abb27	489aeaa6-8686-4b6c-9df9-73aa80c4dac9	Ticket submitted - Ace0mac	05/16/2020 08:24	SYSTEM	\N	\N
6b876a4d-a150-4f7d-906d-b4d5424fe6d7	7765ad72-47f3-4d90-bc79-cdb18f4da41d	Ticket submitted - darthmosher	05/16/2020 11:55	SYSTEM	\N	\N
7711effc-fb75-4d05-bf1e-5cbed2cfac1a	7765ad72-47f3-4d90-bc79-cdb18f4da41d	Ticket approved - Zylana	05/16/2020 11:57	SYSTEM	\N	\N
18c0de37-2354-44eb-971a-3a9d402fb36e	7765ad72-47f3-4d90-bc79-cdb18f4da41d	Ticket completed - Zylana	05/16/2020 12:04	SYSTEM	\N	\N
eb1bd4b6-2f3d-4214-bad5-78f46f7540dc	2f2c813c-425a-4213-949e-421298357f93	Ticket submitted - Shrimptaco	05/16/2020 13:37	SYSTEM	\N	\N
8f9ea2b1-3f05-4330-98bc-8c52da74769f	e95f5cb7-f04c-4794-9d7d-528471087400	Ticket submitted - Borealis	05/16/2020 13:54	SYSTEM	\N	\N
0f21f942-edeb-4622-a23c-b6c10606eb08	af10bbfe-0e0d-4e1b-9f4a-7447b6722882	Ticket submitted - AceSpades	05/16/2020 13:56	SYSTEM	\N	\N
50308dce-992a-4730-b3c6-3d9a07e5f4f6	1db151cb-e27f-4ea3-b8f1-f00093a6bb3d	Ticket submitted - Laki x2	05/16/2020 15:31	SYSTEM	\N	\N
e4f19a0f-5178-4958-8cf0-aa7ab7784533	af10bbfe-0e0d-4e1b-9f4a-7447b6722882	Ticket approved - Ford	05/16/2020 16:09	SYSTEM	\N	\N
6e84565f-8b30-42d1-b18f-7f3767581a4f	1db151cb-e27f-4ea3-b8f1-f00093a6bb3d	Ticket approved - Ford	05/16/2020 16:09	SYSTEM	\N	\N
c87ceeff-6308-4bf0-aa05-3af19faf2a83	1db151cb-e27f-4ea3-b8f1-f00093a6bb3d	Ticket completed - Ford	05/16/2020 17:44	SYSTEM	\N	\N
8999ac81-09aa-4688-a35c-2c39bd44ae56	8cccaf47-acf9-4a97-8d00-916b69726811	Ticket submitted - AceSpades	05/16/2020 18:13	SYSTEM	\N	\N
6c0a4e85-34c9-4afa-a3af-ea7c0ff127b4	81ec1250-0ff7-4713-8016-114ab4ceb4c7	Ticket submitted - Barbequeque	05/16/2020 22:10	SYSTEM	\N	\N
146486ef-d3c7-40f2-949d-9023426e2168	2f2c813c-425a-4213-949e-421298357f93	Ticket approved - Frank	05/17/2020 02:07	SYSTEM	\N	\N
60db00db-5b66-4f92-bac2-3a0c343841f7	774cb714-af93-4fce-9dee-9ed3884185af	Ticket completed - Frank	05/17/2020 02:20	SYSTEM	\N	\N
cfdd979e-dd4c-4e8d-9d3b-4a435bd6d896	2f2c813c-425a-4213-949e-421298357f93	Ticket completed - Frank	05/17/2020 02:20	SYSTEM	\N	\N
c271d7f5-643e-49ee-9b62-2cc8b39c793c	adb9a143-f608-4058-b8ae-e1de56d82d4e	Ticket completed - Frank	05/17/2020 02:30	SYSTEM	\N	\N
4fc82cf1-ccaf-4bc3-b7df-333fa6b4fea1	36cd4bcc-db21-42ce-99b1-93e3c59684d6	Ticket approved - Frank	05/17/2020 02:32	SYSTEM	\N	\N
f0028803-92f3-4fc9-a8bd-c5d60c8f5ad6	36cd4bcc-db21-42ce-99b1-93e3c59684d6	Ticket completed - Frank	05/17/2020 02:42	SYSTEM	\N	\N
8358b849-fb9d-4710-aa6f-8abddad0e5b2	20762625-4623-45a7-a407-ecd421d54a22	Ticket approved - Frank	05/17/2020 02:42	SYSTEM	\N	\N
d55ec8a6-d913-4bbe-bef2-dd458c290858	20762625-4623-45a7-a407-ecd421d54a22	Ticket completed - Frank	05/17/2020 03:15	SYSTEM	\N	\N
4c09a985-40af-4a92-8cdc-76119348a996	c5e00c10-55f5-4d11-8f06-abba9e500623	Ticket approved - Frank	05/17/2020 03:17	SYSTEM	\N	\N
c990e1eb-08cf-475f-9a6d-a09ebcf63c5f	c5e00c10-55f5-4d11-8f06-abba9e500623	pinged in discord. Not on pat list, lv 71 played 0h0mins on valguero according to website...	05/17/2020 03:19	Frank	138791132430729217	\N
6f42c412-08e1-4678-a366-0b087cc07e15	6ad6dc06-ef0c-409c-947f-7bf1cdbb29d6	Ticket approved - Frank	05/17/2020 03:28	SYSTEM	\N	\N
80dbc723-1b5c-4c01-a368-9bc1696d9b45	6ad6dc06-ef0c-409c-947f-7bf1cdbb29d6	Ticket completed - Frank	05/17/2020 03:29	SYSTEM	\N	\N
15f8c3c2-6d5a-468c-ba01-98e244d2094f	bc884148-7684-46ad-8f97-dd52aa267305	Ticket approved - Frank	05/17/2020 03:30	SYSTEM	\N	\N
e84caa7e-92f3-41dd-8e44-fdc2b87d14e2	21544566-743c-4ca6-8799-678795a3504c	Ticket approved - Frank	05/17/2020 03:31	SYSTEM	\N	\N
96426094-7eb9-4aca-8150-e6894cfb1c3c	21544566-743c-4ca6-8799-678795a3504c	Ticket completed - Frank	05/17/2020 03:38	SYSTEM	\N	\N
8f900ae3-cefc-40a2-a765-87f5b1ca62a0	125c9a81-4fc1-4181-a4a4-5c9dc52b2b92	Ticket approved - Frank	05/17/2020 03:39	SYSTEM	\N	\N
4a5b7ace-a2d1-41c2-bd04-9b5c1f45f95e	125c9a81-4fc1-4181-a4a4-5c9dc52b2b92	Ticket completed - Frank	05/17/2020 03:40	SYSTEM	\N	\N
f0bc530c-5db0-4568-99e6-c1c763ada496	9f1a704a-a732-4001-9102-7e9c108c7835	Ticket approved - Frank	05/17/2020 03:40	SYSTEM	\N	\N
eb9cbb2b-cd4f-4d27-9a82-c84457cd7661	d29d2999-00ae-4aed-adca-432dff993b58	Ticket approved - Frank	05/17/2020 03:41	SYSTEM	\N	\N
af131a4a-7e48-420b-b587-c8c3aeb48753	9f1a704a-a732-4001-9102-7e9c108c7835	Ticket completed - Frank	05/17/2020 03:48	SYSTEM	\N	\N
8263d1a8-796d-4bae-ae14-a325e7956aaf	d29d2999-00ae-4aed-adca-432dff993b58	Ticket completed - Frank	05/17/2020 03:48	SYSTEM	\N	\N
3986a860-8dc6-49c2-b037-d8d34e225da8	8cccaf47-acf9-4a97-8d00-916b69726811	Ticket approved - Frank	05/17/2020 03:50	SYSTEM	\N	\N
db3c71e8-3b88-4406-9500-2c4ed5ad68cb	af10bbfe-0e0d-4e1b-9f4a-7447b6722882	Ticket completed - Frank	05/17/2020 04:00	SYSTEM	\N	\N
b83a6016-fde6-4324-9a63-dc68630d318f	81ec1250-0ff7-4713-8016-114ab4ceb4c7	Ticket approved - Frank	05/17/2020 04:04	SYSTEM	\N	\N
f5170fca-bb89-4d2b-8cbf-12fe4fa3b6a8	bc884148-7684-46ad-8f97-dd52aa267305	tagged in admin supprot	05/17/2020 04:24	Frank	138791132430729217	\N
9b21d5ed-6fd8-469e-8b2a-278611cbf064	dbae3c98-a113-420c-ab97-72b85869cda5	Ticket submitted - Torgames	05/17/2020 08:35	SYSTEM	\N	\N
d18e25ef-3150-4d9e-8a24-aebba798ffe5	306ff385-ead8-42e0-91ec-734e99ef95c4	Ticket submitted - xRevolveR	05/17/2020 08:53	SYSTEM	\N	\N
1f20fa4e-132b-4ce1-a197-cc30b2ac7acb	259e5392-fbd4-40b6-90e9-cc2c5f0ebf0b	Ticket submitted - TheOddMe	05/17/2020 08:53	SYSTEM	\N	\N
31633bb6-a7ba-4ed7-9501-2a7d15818d40	259e5392-fbd4-40b6-90e9-cc2c5f0ebf0b	Ticket approved - Cowdog	05/17/2020 09:45	SYSTEM	\N	\N
12c370af-185a-4efb-8818-491e7c3e4fb5	dbae3c98-a113-420c-ab97-72b85869cda5	Ticket approved - Cowdog	05/17/2020 09:46	SYSTEM	\N	\N
54e65f40-428d-4f53-aaaf-f2c2babdd7a8	306ff385-ead8-42e0-91ec-734e99ef95c4	Ticket approved - Cowdog	05/17/2020 09:46	SYSTEM	\N	\N
a3bb2bcf-c972-439a-981e-ea82b162b1cc	ba040802-bf2a-4c8c-a467-4c6d01c3313d	Ticket submitted - Wutang	05/17/2020 09:54	SYSTEM	\N	\N
29b52653-a82c-4f37-b95b-e0572c601f77	ba040802-bf2a-4c8c-a467-4c6d01c3313d	Ticket approved - Cowdog	05/17/2020 09:55	SYSTEM	\N	\N
c46c7c69-04cc-4e16-a1c7-62fd989ddbe6	306ff385-ead8-42e0-91ec-734e99ef95c4	Ticket completed - Cowdog	05/17/2020 09:55	SYSTEM	\N	\N
eb777041-dfaf-46fc-a8d1-7edd485a3d25	259e5392-fbd4-40b6-90e9-cc2c5f0ebf0b	Ticket completed - Cowdog	05/17/2020 09:55	SYSTEM	\N	\N
841cc95a-52c6-4e93-a32d-de7318858c27	3db4ef78-d160-442b-b829-493bb650581b	Ticket submitted - The Struggler	05/17/2020 09:56	SYSTEM	\N	\N
89c59bb1-d3b7-4bdf-bc8c-be3a3c4794af	ba040802-bf2a-4c8c-a467-4c6d01c3313d	Ticket completed - Cowdog	05/17/2020 09:58	SYSTEM	\N	\N
41c787b0-3f37-4009-927e-9651e1d40831	3db4ef78-d160-442b-b829-493bb650581b	Ticket approved - Cowdog	05/17/2020 09:58	SYSTEM	\N	\N
cdd6ee94-f38b-4b62-9b03-adbc6262e4e3	3db4ef78-d160-442b-b829-493bb650581b	Ticket completed - Cowdog	05/17/2020 10:06	SYSTEM	\N	\N
ebea1201-d2a4-4ce0-99a5-bab4f1931802	e95f5cb7-f04c-4794-9d7d-528471087400	Ticket approved - Cowdog	05/17/2020 10:16	SYSTEM	\N	\N
c7cc78e4-13d8-48e6-bcce-a178b5a01d79	2122df3a-b113-41f5-985b-0ed91f7e542b	Ticket submitted - kraft	05/17/2020 10:16	SYSTEM	\N	\N
cdc2b3ec-0736-475b-803b-3a5de2cc59f4	e95f5cb7-f04c-4794-9d7d-528471087400	Picked up tek forge and dropped it back down.  I tested it and it appears to be working.	05/17/2020 10:21	Cowdog	296021653391933440	\N
cba14dcb-643b-4e26-9631-1b0e54fe2544	e95f5cb7-f04c-4794-9d7d-528471087400	Ticket completed - Cowdog	05/17/2020 10:22	SYSTEM	\N	\N
3eea335b-caba-4023-9ba9-028171c69f07	dbae3c98-a113-420c-ab97-72b85869cda5	Ticket completed - Cowdog	05/17/2020 10:37	SYSTEM	\N	\N
6ed3162e-645e-4a71-9f82-c85d3ce0926b	c2ae8423-0dea-486b-b579-91dc383d874a	Ticket submitted - liz	05/17/2020 10:54	SYSTEM	\N	\N
3fb55368-0b93-4c4f-ac1e-b3380bb00b51	4ef1e57a-83b7-440f-a2ac-e9681073e508	Ticket submitted - somebeach	05/17/2020 11:24	SYSTEM	\N	\N
9dc2097e-1513-4155-bb97-3cf628968b16	4ef1e57a-83b7-440f-a2ac-e9681073e508	Ticket approved - Zylana	05/17/2020 11:29	SYSTEM	\N	\N
fa47fd46-91bf-4c68-abd2-2b682f02a68c	4ef1e57a-83b7-440f-a2ac-e9681073e508	Ticket completed - Zylana	05/17/2020 11:29	SYSTEM	\N	\N
12740e2c-7eca-45f7-a1f6-18c51231bd42	c2ae8423-0dea-486b-b579-91dc383d874a	Ticket approved - Zylana	05/17/2020 11:30	SYSTEM	\N	\N
23058aae-d171-40a5-bbac-f1a12eb975af	2122df3a-b113-41f5-985b-0ed91f7e542b	Ticket approved - Zylana	05/17/2020 11:32	SYSTEM	\N	\N
40359d83-9bab-4f1a-a012-80c7fdb2c91c	23d738b6-98b2-4dac-9547-a19ebca44031	Ticket submitted - Baxlelo	05/17/2020 11:39	SYSTEM	\N	\N
237efa7b-9c1a-4ae4-bb20-4fd0c4cd49f0	c2ae8423-0dea-486b-b579-91dc383d874a	Ticket completed - Zylana	05/17/2020 11:39	SYSTEM	\N	\N
6947312c-cab7-438c-a1de-6091de1d089d	e1866de1-6888-49ce-95c3-08070d877493	Ticket submitted - lxXxROBERTxXxl	05/17/2020 11:44	SYSTEM	\N	\N
0768bf56-9a12-4c41-b0ff-46e8c67ef8be	2122df3a-b113-41f5-985b-0ed91f7e542b	Ticket completed - Zylana	05/17/2020 11:46	SYSTEM	\N	\N
fc931f3a-da8c-4b2d-a8b1-298191a51617	80bedfe4-a571-4b09-bde2-6ed823bf9694	Ticket submitted - thranduin2217	05/17/2020 11:46	SYSTEM	\N	\N
c29bcf34-81f3-4cf6-be9f-9093ae373b1f	9a552faf-ec5c-4f75-899c-49f7d3606770	Ticket submitted - Jaeger	05/17/2020 11:47	SYSTEM	\N	\N
f151fb03-b32d-40ce-ab68-b28288a41d3a	23d738b6-98b2-4dac-9547-a19ebca44031	Ticket approved - Zylana	05/17/2020 11:47	SYSTEM	\N	\N
71caf963-26d6-4427-9ee4-d0d0e5e36f89	23d738b6-98b2-4dac-9547-a19ebca44031	Ticket completed - Zylana	05/17/2020 11:47	SYSTEM	\N	\N
3f72ba63-a1ee-415b-9422-1eed2ad6ba3d	8cccaf47-acf9-4a97-8d00-916b69726811	Ticket cancelled for reason:   - AceSpades	05/17/2020 11:50	SYSTEM	\N	\N
3f719de9-6d93-4255-ba12-9912a4f1966d	81ec1250-0ff7-4713-8016-114ab4ceb4c7	Base in question has no 'walls' so it's hard to see where the base is. \r\n	05/17/2020 11:51	Zylana	200464667506638848	\N
ea1a59b5-63ce-49a3-9dd7-290901331005	cc66e30b-bb24-46b5-9cee-58c216623c76	Wall in area is a world barrier. \r\n	05/17/2020 11:51	Zylana	200464667506638848	\N
385e9d9a-ed66-4cbb-a2b8-413a362fd731	705d13ae-2c56-478c-96ab-9438623ab41c	Ticket submitted - SkyLord	05/17/2020 11:56	SYSTEM	\N	\N
51cb891c-68a4-40ed-8b2f-b44d017d581d	e1be3852-011b-4096-9707-03cf3c9c157e	Ticket submitted - AceSpades	05/17/2020 12:00	SYSTEM	\N	\N
625e0186-fc5b-4b62-9dfa-8e9f8de5441c	5e499707-55bc-474c-bd73-baed0eecba0c	Ticket approved - Cowdog	05/17/2020 12:00	SYSTEM	\N	\N
3b70c1d6-c8e8-4cdc-b56d-ad508b73936d	489aeaa6-8686-4b6c-9df9-73aa80c4dac9	Ticket approved - Zylana	05/17/2020 12:01	SYSTEM	\N	\N
d7f76aa7-f962-4fa9-a1f9-a6a2c375d55e	489aeaa6-8686-4b6c-9df9-73aa80c4dac9	Spider is dead, cannot find giga or other ice jumper. Trying again and can't even see them with tek helment.	05/17/2020 12:02	Zylana	200464667506638848	\N
4ba75490-b471-4e6e-8a96-7ce4ea5d1f85	5e499707-55bc-474c-bd73-baed0eecba0c	DM'd ShrimpTaco, this is his tribemate the knows on a personal level and he is the player that needed to be added to the tribe.  Shrimp said this was taken care of and asked that the ticket be canceled.	05/17/2020 12:02	Cowdog	296021653391933440	\N
d2c4c7d0-e09b-4d6f-8c73-2d45becaa550	5e499707-55bc-474c-bd73-baed0eecba0c	Ticket cancelled for reason:  This has been taken care of. - Cowdog	05/17/2020 12:02	SYSTEM	\N	\N
33de34c8-e48d-4763-bf7b-b47acee5e95d	468f39ed-6654-4d6f-a910-df96dec879df	Ticket submitted - Jima (Eren)	05/17/2020 12:23	SYSTEM	\N	\N
e0f97eb2-4fe0-496d-b71b-9c464cbf864f	3aa6e6d0-bc47-43f9-97a6-c70e6ac8740f	Ticket submitted - DreEl	05/17/2020 12:41	SYSTEM	\N	\N
f2c68d3f-17e3-4d72-b128-cad44bc0f10a	3819a8d7-85dd-4f9e-8cdf-942e6aca4a5b	Ticket submitted - WZK	05/17/2020 14:17	SYSTEM	\N	\N
258d18e6-f65d-47fd-aa6e-b6bf79bbaa4b	e240129f-1401-417c-b48b-722a4c1ab9fa	Ticket submitted - Talaure	05/17/2020 14:30	SYSTEM	\N	\N
3c31793b-6835-49e7-a2e4-2fb739ed24c4	8055bd3b-8014-451d-8b77-78384230c69e	Ticket submitted - Jazz	05/17/2020 15:11	SYSTEM	\N	\N
8ef3b818-a42d-487e-ad1a-59dcf0e8b8b1	f1b73e0b-0f8f-4324-b1f8-362886df45e0	Ticket submitted - Mr T	05/17/2020 15:54	SYSTEM	\N	\N
016859ed-bc6c-44f4-a4a5-0491d0783b16	3b4977f9-6a9d-4784-9da0-8fdd0121a9db	Ticket submitted - darthmosher	05/17/2020 16:28	SYSTEM	\N	\N
cf1aeec0-6a64-4edb-b472-e8ad099af65e	e64b3873-b26f-4a17-835a-8f4ea9101bb1	Ticket submitted - i_am_blondii	05/17/2020 16:28	SYSTEM	\N	\N
01fd2456-2479-41d4-8867-e0cf6e556de6	5058cb93-8a0f-43f8-94b2-a0ce3678f2f3	Ticket submitted - darthmosher	05/17/2020 16:30	SYSTEM	\N	\N
18510001-052b-4038-81cc-60e13da9bba8	d121cd58-5293-4f3a-bde1-61add1a0a302	Ticket submitted - filiwegeian	05/17/2020 18:30	SYSTEM	\N	\N
ab2910f3-d5c4-4028-98fb-e402014686d7	b3ed1e01-4a9f-4d73-9d4b-6753a9171897	Ticket submitted - Reapxrs	05/17/2020 19:25	SYSTEM	\N	\N
8f84bf6c-4e82-434a-8029-0a5fdfaf60a6	7b10bae3-0af8-4a54-9276-91492fc2bb2b	Ticket submitted - antBEAST_yt	05/17/2020 19:26	SYSTEM	\N	\N
8548d76d-ec79-488c-8128-b012f2f90145	e1866de1-6888-49ce-95c3-08070d877493	i have a wood box there named (element) for it.  the pin code is 8577. in case i miss yall moving my base there so im back and forth.	05/17/2020 12:08	lxXxROBERTxXxl	479811562010574858	t
14ff8413-4247-4898-9695-88d9c339334d	172d240e-efaf-4fbc-9e2e-f08688822e31	Ticket submitted - C'Note	05/17/2020 19:53	SYSTEM	\N	\N
952613a0-5541-4c3c-a8b0-1003701fefb4	d121cd58-5293-4f3a-bde1-61add1a0a302	C-note and I are both using the same storage bin and code.	05/17/2020 20:10	filiwegeian	235655638317924352	\N
f495f98b-6354-4ff5-90f0-c7f44f091f0c	b46cf33a-8418-4902-b656-89f7504bba75	Ticket submitted - ThreeShot	05/17/2020 20:17	SYSTEM	\N	\N
217fb264-2944-4dda-8917-5459f9fe0271	99517d0c-ffc3-447c-967a-656876c73b5b	Ticket submitted - Borealis	05/17/2020 21:00	SYSTEM	\N	\N
fa9f786a-c346-40e5-a10a-70474aae65f8	143beb3c-7406-4791-b21e-18c54ac56f4a	Ticket submitted - WZK WIFE	05/17/2020 21:03	SYSTEM	\N	\N
14c7a232-c8f1-4359-b4ba-b240af8f844d	143beb3c-7406-4791-b21e-18c54ac56f4a	Ticket approved - BeOurGuest	05/17/2020 22:06	SYSTEM	\N	\N
a0da6938-1265-4095-8bed-85611f2b249e	143beb3c-7406-4791-b21e-18c54ac56f4a	Ticket completed - BeOurGuest	05/17/2020 22:09	SYSTEM	\N	\N
937d2d80-3e1a-4c9f-9cc9-98b25e53712f	99517d0c-ffc3-447c-967a-656876c73b5b	Ticket approved - BeOurGuest	05/17/2020 22:10	SYSTEM	\N	\N
ebce1508-60d9-41f4-ada1-52d02dc8a93a	99517d0c-ffc3-447c-967a-656876c73b5b	Ticket completed - BeOurGuest	05/17/2020 22:11	SYSTEM	\N	\N
fd5ef72b-ae12-47a6-9abd-fba2f80901bf	172d240e-efaf-4fbc-9e2e-f08688822e31	Ticket approved - BeOurGuest	05/17/2020 22:21	SYSTEM	\N	\N
74d3be59-baf6-43c7-bd31-e8608e8bada5	172d240e-efaf-4fbc-9e2e-f08688822e31	Ticket completed - BeOurGuest	05/17/2020 22:21	SYSTEM	\N	\N
0ec6be21-fea3-4b04-8427-b2c7b143e184	7b10bae3-0af8-4a54-9276-91492fc2bb2b	Ticket approved - BeOurGuest	05/17/2020 22:21	SYSTEM	\N	\N
09ad9f07-0a97-4a61-b096-417323ab7c2a	7b10bae3-0af8-4a54-9276-91492fc2bb2b	Ticket completed - BeOurGuest	05/17/2020 22:26	SYSTEM	\N	\N
07b73e26-aeac-4800-870c-e140c0f331e6	b3ed1e01-4a9f-4d73-9d4b-6753a9171897	Ticket approved - BeOurGuest	05/17/2020 22:26	SYSTEM	\N	\N
e004065d-938f-4e5e-aa5f-af8f5b3d6a27	b3ed1e01-4a9f-4d73-9d4b-6753a9171897	Ticket completed - BeOurGuest	05/17/2020 22:29	SYSTEM	\N	\N
3fae5454-b296-4822-89b5-7fe104f0a58c	d121cd58-5293-4f3a-bde1-61add1a0a302	Ticket approved - BeOurGuest	05/17/2020 22:29	SYSTEM	\N	\N
446a2871-d63c-461f-b940-d17cc91e1def	d121cd58-5293-4f3a-bde1-61add1a0a302	Ticket completed - BeOurGuest	05/17/2020 22:31	SYSTEM	\N	\N
5a4618f2-c0db-4ba5-9251-a1c4163fdf4a	e1be3852-011b-4096-9707-03cf3c9c157e	Ticket cancelled for reason:   - SkyLord	05/17/2020 22:32	SYSTEM	\N	\N
792fb8cb-0f9d-479e-ad8c-81cb98b7b92a	d121cd58-5293-4f3a-bde1-61add1a0a302	Thank you for the note letting me know you were using the same box, saved me some confusion :)	05/17/2020 22:32	BeOurGuest	88994789860610048	\N
a6924784-d3ba-43f3-bbb3-65b045606fd8	5058cb93-8a0f-43f8-94b2-a0ce3678f2f3	Ticket approved - BeOurGuest	05/17/2020 22:32	SYSTEM	\N	\N
355416d3-ab47-4fc9-b280-074a4d32421f	7b10bae3-0af8-4a54-9276-91492fc2bb2b	Where is the element?	05/17/2020 22:32	antBEAST_yt	278326974450106368	\N
ff69fc9d-8f31-4336-a923-3a094f1a1e2e	5058cb93-8a0f-43f8-94b2-a0ce3678f2f3	Ticket completed - BeOurGuest	05/17/2020 22:33	SYSTEM	\N	\N
4edbfb5f-890e-4519-9dbf-8b02a10a7f2e	3b4977f9-6a9d-4784-9da0-8fdd0121a9db	Ticket approved - BeOurGuest	05/17/2020 22:34	SYSTEM	\N	\N
51c80246-1866-4820-b852-4ef2c17113c0	3b4977f9-6a9d-4784-9da0-8fdd0121a9db	Ticket completed - BeOurGuest	05/17/2020 22:34	SYSTEM	\N	\N
c23c94b1-28de-44a6-877a-0875eba4575b	e64b3873-b26f-4a17-835a-8f4ea9101bb1	Ticket approved - BeOurGuest	05/17/2020 22:36	SYSTEM	\N	\N
e7df9a89-bcaf-48ef-92c1-4c389ffb0279	e64b3873-b26f-4a17-835a-8f4ea9101bb1	Ticket completed - BeOurGuest	05/17/2020 22:41	SYSTEM	\N	\N
67c024a4-c2d7-4f2f-a437-9d4de751b98f	f1b73e0b-0f8f-4324-b1f8-362886df45e0	Ticket approved - BeOurGuest	05/17/2020 22:41	SYSTEM	\N	\N
c4c444b4-9932-4176-b114-1bf934db57ea	f1b73e0b-0f8f-4324-b1f8-362886df45e0	Ticket completed - BeOurGuest	05/17/2020 22:43	SYSTEM	\N	\N
919ac434-95ab-42a9-b5a5-2005fc48e4bb	8055bd3b-8014-451d-8b77-78384230c69e	Ticket approved - BeOurGuest	05/17/2020 22:44	SYSTEM	\N	\N
036ab3f4-09a9-4152-bb30-e4b981e5a554	8055bd3b-8014-451d-8b77-78384230c69e	Box wasn't pin coded. Element dropped off. Let me know when you've collected it and I'll come remove the box. Pin is the pin you put in the ticket.	05/17/2020 22:50	BeOurGuest	88994789860610048	\N
fa908011-92bd-4988-9fe1-da1cea0447e1	8055bd3b-8014-451d-8b77-78384230c69e	Ticket completed - BeOurGuest	05/17/2020 22:51	SYSTEM	\N	\N
84ae2cf7-e764-4547-8e93-cbd3986b53eb	e240129f-1401-417c-b48b-722a4c1ab9fa	Ticket approved - BeOurGuest	05/17/2020 22:51	SYSTEM	\N	\N
8a077a78-d6cd-452e-bf5c-a8403b74375c	e240129f-1401-417c-b48b-722a4c1ab9fa	Ticket completed - BeOurGuest	05/17/2020 22:53	SYSTEM	\N	\N
610d3874-cf34-496a-8b29-5700038dfc8b	3aa6e6d0-bc47-43f9-97a6-c70e6ac8740f	Ticket approved - BeOurGuest	05/17/2020 22:54	SYSTEM	\N	\N
09ae4b4c-369c-4d36-b954-b9ac2420da6a	3aa6e6d0-bc47-43f9-97a6-c70e6ac8740f	Ticket completed - BeOurGuest	05/17/2020 22:55	SYSTEM	\N	\N
dbed7a59-2506-4959-8295-01d0d06c885e	468f39ed-6654-4d6f-a910-df96dec879df	Ticket approved - BeOurGuest	05/17/2020 22:57	SYSTEM	\N	\N
56a830e7-e881-48e2-bb7c-eec0473319b5	468f39ed-6654-4d6f-a910-df96dec879df	Ticket completed - BeOurGuest	05/17/2020 22:57	SYSTEM	\N	\N
fbb37008-0d7b-482f-a770-d0dbdbaec156	9a552faf-ec5c-4f75-899c-49f7d3606770	Ticket approved - BeOurGuest	05/17/2020 22:59	SYSTEM	\N	\N
b8d8374e-737a-4e06-b46c-921183d31ae8	9a552faf-ec5c-4f75-899c-49f7d3606770	Ticket completed - BeOurGuest	05/17/2020 23:03	SYSTEM	\N	\N
e1186384-3e88-4647-885a-4633b6332a1f	80bedfe4-a571-4b09-bde2-6ed823bf9694	Ticket approved - BeOurGuest	05/17/2020 23:04	SYSTEM	\N	\N
4baef2a4-5c1f-4242-9153-206b5163bef3	80bedfe4-a571-4b09-bde2-6ed823bf9694	You didn't leave a pin code. The pin code on the box is 9824. Let me know when you've collected the element and I can remove the box.	05/17/2020 23:06	BeOurGuest	88994789860610048	\N
a06704ac-4edd-492d-b127-5d32c1a8602d	80bedfe4-a571-4b09-bde2-6ed823bf9694	Ticket completed - BeOurGuest	05/17/2020 23:07	SYSTEM	\N	\N
a0a663b2-527b-46c7-bc58-16940b0dbd2a	e1866de1-6888-49ce-95c3-08070d877493	Ticket approved - BeOurGuest	05/17/2020 23:11	SYSTEM	\N	\N
04f5af4b-1d0a-45af-b775-35e56d47146c	e1866de1-6888-49ce-95c3-08070d877493	Ticket completed - BeOurGuest	05/17/2020 23:11	SYSTEM	\N	\N
b908735e-34a5-4326-a7eb-a86cd0285282	e1866de1-6888-49ce-95c3-08070d877493	Thank you for adding the pin code to the notes	05/17/2020 23:11	BeOurGuest	88994789860610048	\N
57eb7cb7-b6e9-4e15-8dc4-fe23cb0e0843	81ec1250-0ff7-4713-8016-114ab4ceb4c7	talked to him yesterday. explained to him how we proceed in such cases. If it happens again, told him to @ us in admin if he sees the player in action.	05/18/2020 02:35	Frank	138791132430729217	\N
9ab994c2-3687-4ce7-b56b-396436f1ae67	81ec1250-0ff7-4713-8016-114ab4ceb4c7	Ticket completed - Frank	05/18/2020 02:35	SYSTEM	\N	\N
9ed905d3-300e-4e0a-bd3f-7e039220c4dc	c5e00c10-55f5-4d11-8f06-abba9e500623	Ticket cancelled for reason:   - Tower	05/18/2020 05:57	SYSTEM	\N	\N
679de40c-9b49-4d83-81bf-eab6efed4aa5	6761c16a-835b-4470-9e2b-58f78a035e4d	Ticket submitted - shadowknight	05/18/2020 08:50	SYSTEM	\N	\N
9e96940d-df1e-4c69-8cd1-36f2e8653e7e	5a8d9205-ea06-48c1-a45a-9bb65cfddbc9	Ticket submitted - Cepan117	05/18/2020 09:59	SYSTEM	\N	\N
4ef897fb-228f-409d-a32a-c44a0c89b23a	05e74520-5cf6-48a6-afe2-c5a892b71cd6	Ticket submitted - mannizzle	05/18/2020 10:12	SYSTEM	\N	\N
74870f66-5d90-4f74-b559-0d14c52e7806	fefd0cec-2865-4e3c-9ed6-5d0feaf9aa27	Ticket submitted - Birb	05/18/2020 12:36	SYSTEM	\N	\N
b3e5dca2-cdaf-4852-993b-f823b33e5753	80bedfe4-a571-4b09-bde2-6ed823bf9694	taken care of.. next time ill pin code my element storage\r\n	05/18/2020 12:56	thranduin2217	250460048738877440	\N
0a1810e9-ebe2-4273-a979-3ee5698083c0	18789d4b-ccf4-4373-bb50-52fb43be91fb	Ticket submitted - Ski_skas4	05/18/2020 14:01	SYSTEM	\N	\N
4ce31fcc-47be-45d6-8e17-72abbb72d71c	5a2dc794-f6eb-46c6-8791-5dc33b3c580a	Ticket submitted - pressurejuice	05/18/2020 14:26	SYSTEM	\N	\N
c59d02d8-b136-4bd6-b999-1e9b09cce65a	481acd23-8d49-425b-9365-7abb63372a7f	Ticket submitted - Enmity	05/18/2020 20:51	SYSTEM	\N	\N
4648627d-643d-4b2b-9066-7445b1db6c47	705d13ae-2c56-478c-96ab-9438623ab41c	Ticket approved - ShiftyG	05/19/2020 08:52	SYSTEM	\N	\N
06bdbca0-bc61-46b1-9ad0-38542745e5bd	705d13ae-2c56-478c-96ab-9438623ab41c	Ticket completed - ShiftyG	05/19/2020 09:05	SYSTEM	\N	\N
93a7b5c6-3eaa-4a9e-84aa-d98641e7fc98	ecc33ae6-738b-4b43-a15c-99978b5af3fd	Ticket submitted - Baxlelo	05/19/2020 15:23	SYSTEM	\N	\N
a9444ce7-5b5b-45d6-89d5-b4048b3a21e5	6761c16a-835b-4470-9e2b-58f78a035e4d	Ticket approved - BeOurGuest	05/19/2020 17:43	SYSTEM	\N	\N
5921c45b-8ac8-46cc-ab7a-b96a24e0bd80	6761c16a-835b-4470-9e2b-58f78a035e4d	Ticket completed - BeOurGuest	05/19/2020 17:54	SYSTEM	\N	\N
dd390b74-583b-48ae-89aa-5390a1461d0f	5a8d9205-ea06-48c1-a45a-9bb65cfddbc9	Please get a ccc location for your ticket.	05/19/2020 17:55	BeOurGuest	88994789860610048	\N
08f9dca5-6323-4bed-9d99-7bf6cc0e9f63	fefd0cec-2865-4e3c-9ed6-5d0feaf9aa27	Ticket approved - BeOurGuest	05/19/2020 17:59	SYSTEM	\N	\N
52733efa-23dd-419e-9e30-eacc2454eb17	fefd0cec-2865-4e3c-9ed6-5d0feaf9aa27	Ticket completed - BeOurGuest	05/19/2020 18:06	SYSTEM	\N	\N
7ad11675-d04d-425f-9351-1987c02f8f77	3a33486b-0bb1-4e00-9aa7-1080c055576f	Ticket submitted - XMAN-Unum	05/19/2020 20:20	SYSTEM	\N	\N
6a9ae3bc-8b4e-4fe7-9e9f-4c3a47d6c6f4	28bad8a4-3deb-44b3-abae-170172961112	Ticket submitted - filiwegeian	05/19/2020 20:24	SYSTEM	\N	\N
40fde1be-10c4-4628-9b19-2cdf6a7fe9ed	28bad8a4-3deb-44b3-abae-170172961112	Ticket approved - BeOurGuest	05/19/2020 20:34	SYSTEM	\N	\N
1ca63193-d90b-4bfd-a9e8-8f29977bf797	28bad8a4-3deb-44b3-abae-170172961112	Ticket completed - BeOurGuest	05/19/2020 20:41	SYSTEM	\N	\N
f20815e9-f74c-40a7-a542-4613afa91d64	0ab6a321-d7b1-4fb6-9d48-569a2378c4c2	Ticket submitted - filiwegeian	05/20/2020 11:20	SYSTEM	\N	\N
\.


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.servers (server_id, server_name, id) FROM stdin;
1	Island	1
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
13	Genesis	13
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tickets (id, incrementer, ign, discord_name, discord_id, server_assistance, status, time_to_contact, type_of_ticket, submitted_on, accepted_on, accepted_by, closed_by, closed_on, gen_tribe_name, gen_coordinates, gen_issue, gen_resolution, event_name, event_serverid_dropoff, event_patreon_status, event_element_dropoff_location, transfer_amount, transfer_serverid_pickup, transfer_server_pickup_location, transfer_serverid_dropoff, transfer_server_dropoff_location, request_serverid_dropoff, request_dino_name, request_colored, request_region0, request_region1, request_region2, request_region3, request_region4, request_region5, request_sex, request_server_dropoff_location, request_email_address, insurance_dino_link, insurance_email_address, insurance_month_claimed, insurance_explanation, ban_steam_id, ban_email_address, ban_banned_reason, ban_unban_reason, bug_issue, bug_recreate, bug_lost_items, anonymous_description, cancelled_description) FROM stdin;
85a1f476-e432-44cc-aa49-ea39ccb24802	5	Ella 2.0	#	\N	DomiNATION #11 - Genesis	COMPLETE	Anytime on Discord: Ella#9526	General Support Ticket	03/25/2020 21:09	03/26/2020 08:19	Frank	Frank	03/26/2020 10:02	Vogel, Inc.	n/a	My crafting character was reset during the WC push. I leveled it up and now I can't take a mindwipe. There is no cooldown or any countdown I can see. https://i.imgur.com/56NgBgE.png	I've travel to other maps. I've tried making a new mindwipe in other maps. I can't take it in any of the maps. I've waited 48 hours and trieed again on multiple maps and was not able to take it.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11061707-31b5-49ca-ae60-d30ef8ebe9b1	1	Eliza	Mr_Galaxy.#8004	198204630092480512	DomiNATION #10 - Patreon Aberration	COMPLETE		Bug Report	03/24/2020 18:08	03/31/2020 10:57	Frank	Frank	04/03/2020 13:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I transfer my character (Eliza 201667585) to the event map, this was so I could move my crafter on when done, I log in to the event map to get said character and it is not in the download list nor am I able to play. I log off and long on to all the other server to see if it was there, then I log in to the event map with another charter and see my character sleeping on the floor.	My Character Eliza	https://cdn.discordapp.com/attachments/308190054679969792/691145350706102302/unknown.png	\N	\N
f252be92-2ed2-49a7-ba12-ddfc2957cdcc	6	Jelica	Jelico#9791	615005729220329472	DomiNATION #11 - Genesis	COMPLETE	4pm-1am EST	General Support Ticket	03/26/2020 14:04	03/26/2020 14:21	Zylana	Zylana	03/26/2020 14:33	Tribe of Jelica	This does not work for me, I don't need anyone to come to me	I want to report TTV_ItaYota for griefing. He trained agro mobs on me while I was doing the ice fishing mission on frozen lake. He claims it was an accident but the lake is huge with good visibility, it would take a very high level of stupidity to 'accidently' train mobs right through my fishing hole. I have no interest in playing on the server if I can't get anything done without someone harassing me. Missions are very hard solo, other players know it does not take much to ruin them for others	I informed him I would report him	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b18dfdd9-5e7d-470d-abcc-dd6c210c9ca9	4	DP	DarkPenquin#3065	160553898459791360	DomiNATION #1 - Island	CANCELLED	9pm-12pm	Element from Event	03/24/2020 18:53	03/25/2020 02:46	ShiftyG	ShiftyG	03/25/2020 03:02	\N	\N	\N	\N	March 20 tenticle battle thing	DomiNATION #1 - Island	No	-198292 309616 -10686 -162.81 -16.13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
044ba16b-5718-47cf-ba44-3f7098b0ff06	3	Skiffy	baby klixy#1723	346064246561439746	DomiNATION #1 - Island	CANCELLED		General Support Ticket	03/24/2020 18:29	03/25/2020 03:14	ShiftyG	ShiftyG	03/25/2020 03:15	Triple D's	Ark	Im moving bases and leaving the tribe i was in i was preparing for the new base at the location and i placed foundations there a few minutes erlier to mark i was building there , and when i left the tribe i forgot to demolish them and no one from the tribe is on so i just need to see if an admin can destroy them for me or give me a way possible for me to destroy them	. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b8369274-bfcd-4fcf-9275-01e902163e9f	12	Heak	Heak#5924	185913145632489472	DomiNATION #11 - Genesis	CANCELLED	Any	General Support Ticket	03/27/2020 23:09	\N	\N	Chief Rodney	03/27/2020 23:33	Mad Fuzzy Panda's	89078 275650 449 -24.16 -10.56	i was on my skiff and it suddenly just got destroyed. i was in the volanco biome but there was nothing around me just went poof	i got all my stuff back but i cant make skiff i got shifty to make them for me. Can i get a replacement?	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Duplicate ticket
5fdb1c7d-a034-4591-a7c2-531802d58d85	2	Brainiac	nowlin_jace#7087	173238480091086856	DomiNATION #5 - Ragnarok	COMPLETE		Element from Event	03/24/2020 18:13	03/25/2020 03:15	ShiftyG	ShiftyG	03/25/2020 03:38	\N	\N	\N	\N	March 13th, 2020 1030PM CST Name: Late Night Overseer Event	DomiNATION #5 - Ragnarok	No	297689 -469489 -14242 -91.75 -43.31 / 6969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d5467278-5f02-43e0-aeac-d60e35afa9f3	11	Anderson43	#	\N	DomiNATION #11 - Genesis	COMPLETE	MST	General Support Ticket	03/27/2020 23:03	03/27/2020 23:13	Chief Rodney	Chief Rodney	03/27/2020 23:13	Tribe of anderson34	couldnt figure this out i apologize	There was a yuti chasing a players magma and i tried to kill the yuti with my stalker and another yuti agroed his magma and it died he got in the chat and started going off calling me trash and i got his magma killed saying"stay the fuck away from me your trash" and calling me a liar that i agroed another yuti onto him	I told him i was to get an admin to explain this is not how shit goes on in these servers	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f2851924-48d1-481e-b1b5-acbc464791af	7	blue	Ark_Blue#3583	231790447045902347	DomiNATION #6 - Patreon Ragnarok	COMPLETE		Transfer Element	03/26/2020 18:19	03/26/2020 18:22	Cowdog	Cowdog	03/26/2020 19:06	\N	\N	\N	\N	\N	\N	\N	\N	1351	DomiNATION #6 - Patreon Ragnarok	 -285581 -343304 1196 -103.33 -14.03 pin 1391	DomiNATION #5 - Ragnarok	99615 349513 -10842 -177.23 -21.03 pin 1391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ae730e62-de31-4f73-adbf-07d477926176	9	AeroKnight	AeroKnightLP#8497	231842747525365761	DomiNATION #9 - Valguero	COMPLETE	7PM-2AM Central	General Support Ticket	03/27/2020 17:10	03/27/2020 18:38	Cowdog	Cowdog	03/27/2020 22:29	League of Nerds	-208277 -18623 -6198 -115.29 -31.09	dinos on aggressive?	write a support ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	This was already addressed by Zy on 03/19/20, pls see Notes in Discord.
6c9cb52f-5326-4a0a-9544-191e4671d1f5	10	Heak	#	\N	DomiNATION #11 - Genesis	CANCELLED	Any	General Support Ticket	03/27/2020 20:52	03/28/2020 04:31	ShiftyG	ShiftyG	03/28/2020 04:32	Mad Fuzzy Panda's	89078 275650 449 -24.16 -10.56	i was on my skiff and it suddenly just got destroyed. i was in the volanco biome but there was nothing around me just went poof	i got all my stuff back but i cant make skiff i got shifty to make them for me. Can i get a replacement?	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lost items outside of a server crash aren't replaced.
3ec27915-0616-4bff-af3e-80d95f98109d	13	Heak	Heak#5924	185913145632489472	DomiNATION #11 - Genesis	COMPLETE	Any	General Support Ticket	03/28/2020 06:24	03/28/2020 06:26	Frank	Frank	03/28/2020 06:53	Mad Fuzzy Panda's	cant get to it atm but i can get it if required i already copied another link	died in volcano went back no body bag.	can i get a replacement for the legs mastercraft drill (damage 120) blue hatchet (cant remember damage) 77 element armor 311.0 tek helmet rest i can easily recoup.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	forgot link for inventory\r\n
5072cce2-84b7-4bd7-8815-1dd4eb3b68aa	8	Zeek	Zeek#3211	344560288412205057	DomiNATION #9 - Valguero	COMPLETE	5PM-8PM EST	Bug Report	03/27/2020 05:40	03/29/2020 17:33	ShiftyG	ShiftyG	03/29/2020 18:18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	The Aberration area in valguero causes a severe FPS drop(5 fps down from 70 fps). I've tested single player and a different valguero server and there is no FPS drop on them.	Yes, enter the aberration area on valguero, and head toward the swamp area.	No	\N	\N
af5d2928-428e-4e92-bc24-5107a2572b6e	15	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #3 - Scorched Earth	COMPLETE	anytime is fine	Transfer Element	03/28/2020 10:36	03/28/2020 10:39	BeOurGuest	BeOurGuest	03/28/2020 10:46	\N	\N	\N	\N	\N	\N	\N	\N	500	DomiNATION #6 - Patreon Ragnarok	-183225 94560 11588 134.66 -5.22 pin code is 6970	DomiNATION #3 - Scorched Earth	191121 9983 -11341 83.12 -27.99    pin code is 6970 and it'll be the far right large storage box	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2ec50b1a-7651-4dfb-a1f4-952fbbef6304	20	Dre	athenges#7363	290221223059652608	DomiNATION #3 - Scorched Earth	COMPLETE	4pm-10pm cst	Transfer Element	03/28/2020 13:41	03/28/2020 18:58	Chief Rodney	Chief Rodney	03/28/2020 18:58	\N	\N	\N	\N	\N	\N	\N	\N	7000	DomiNATION #8 - Patreon Extinction	132300 -230250 11139 -156.93 -41.61 Pin: 8642	DomiNATION #3 - Scorched Earth	-288343 -160146 -29490 -2.60 -42.62 Pin: 8642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18e840bf-0d3b-4744-aa64-f9a3b59792e6	16	Mouse	Chaos#5947	266373461918613506	DomiNATION #6 - Patreon Ragnarok	COMPLETE	4pm-10pm cst	General Support Ticket	03/28/2020 11:13	03/28/2020 11:37	Frank	Frank	03/28/2020 12:01	Pandemic	can't log in to get it	cannot log into pat servers	fill out ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cc4957d6-4dfd-4da6-a719-2ab26ae1462c	14	Heak	Heak#5924	185913145632489472	DomiNATION #11 - Genesis	CANCELLED	Any	General Support Ticket	03/28/2020 06:25	03/28/2020 12:04	Frank	Frank	03/28/2020 12:06	Mad Fuzzy Panda's	cant get to it atm but i can get it if required i already copied another link	died in volcano went back no body bag.	can i get a replacement for the legs mastercraft drill (damage 120) blue hatchet (cant remember damage) 77 element armor 311.0 tek helmet rest i can easily recoup.    https://gyazo.com/c35ce413efeaca55802712a8ad6dba44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3:05 PM] Frank: Hello, did you submit a second ticket regarding your back from this morning or did the website derped ??\r\n[3:05 PM] Heak: my back?\r\n[3:05 PM] Frank: bag**\r\n[3:06 PM] Heak: i did because i forgot the link for the inventory\r\n[3:06 PM] Heak: you can canel any outstanding tickets for me i dont have any issues\r\n[3:06 PM] Frank: alright thank you
41066479-a118-43be-a9df-dbda6a0dfa2f	17	Slogra	Slogra#5520	477617857136689153	DomiNATION #8 - Patreon Extinction	COMPLETE	1pm to 10 pm est	Element from Event	03/28/2020 12:18	03/28/2020 16:05	Cowdog	Cowdog	03/28/2020 16:17	\N	\N	\N	\N	i think it was Date: March 7th, 2020 7PM CST Name: Primetime Boss Battle	DomiNATION #8 - Patreon Extinction	Yes	-36199 83442 -34117 47.58 -11.67  pin is 9119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5a96289c-dee4-472d-ba1c-5dda104616b3	19	Skiffy	baby klixy#1723	346064246561439746	DomiNATION #1 - Island	COMPLETE	East Coast	General Support Ticket	03/28/2020 13:18	03/28/2020 17:05	Zylana	Zylana	03/28/2020 17:05	Triple D's	Ark	I won't be able to play on the server for it might be more over a week , i dont want my stuff and base to get demod and have to start over. The reason is someone deleted ark off my laptop and its not letting me reinstall and im getting a external hard drive and when that ships in i can redownload ark 	.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9576e9bb-901d-4966-9e14-8823c69ca5d1	22	blue	Ark_Blue#3583	231790447045902347	DomiNATION #8 - Patreon Extinction	CANCELLED	5pm - 8pm cst	Transfer Element	03/28/2020 16:44	\N	\N	Ark_Blue	03/28/2020 18:37	\N	\N	\N	\N	\N	\N	\N	\N	500	DomiNATION #6 - Patreon Ragnarok	-285646 -343348 1196 -97.96 -18.20 pin 1391	DomiNATION #8 - Patreon Extinction	-58331 -336235 25092 89.60 -19.00 pin 1391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
9872d219-ec37-4837-9120-b417581cb9a2	24	Slogra2	Slogra#5520	477617857136689153	DomiNATION #8 - Patreon Extinction	COMPLETE	2pm to 4pm est 	General Support Ticket	03/29/2020 10:57	03/29/2020 12:48	BeOurGuest	BeOurGuest	03/29/2020 12:59	Tribe of Slogra	-38040 86859 -34229 153.10 -2.24	want to join my main char tribe with my alt	i contacted cowdog	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8ffaa37b-ee30-4f52-9ae1-17bb14bd2960	21	The Stalking Mammoth	#	\N	DomiNATION #9 - Valguero	COMPLETE	5pm-10pm cst	Transfer Element	03/28/2020 15:38	03/29/2020 08:50	Cowdog	Cowdog	03/29/2020 09:02	\N	\N	\N	\N	\N	\N	\N	\N	1000	DomiNATION #9 - Valguero	203051 -25197 -9034 157.51 -13.53 Vault PIN:1596	DomiNATION #2 - Center	286197 269175 -136327 19.22 -19.76 TekGen PIN:1596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4e704d22-1ddc-454b-a64d-95ff53ea0662	18	Heak	Heak#5924	185913145632489472	DomiNATION #5 - Ragnarok	COMPLETE	Any	Patreon Insurance Request	03/28/2020 12:32	03/29/2020 04:43	SnowballInHell	Cowdog	03/29/2020 10:03	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.spectrumdominus.com/server/6/dino/358833041	Heak@hotmail.ca OR Fireal_6969@hotmail.com	March	my son lvled my male breeder accidently got killed. i dont remember if it was under my patreon or my sons account	\N	\N	\N	\N	\N	\N	\N	\N	\N
23257390-4040-43a7-b2c4-d50562948f57	23	JBizzle	JBizzle#9229	288110391492345858	DomiNATION #4 - Aberration	COMPLETE	530pm -10pm est mon-fri sat & sun 8am - 10pm	Transfer Element	03/29/2020 09:52	03/29/2020 10:01	Cowdog	Cowdog	03/29/2020 10:43	\N	\N	\N	\N	\N	\N	\N	\N	600	DomiNATION #4 - Aberration	transmitter pin#1870 116791 -65863 47471 -167.44 -4.29	DomiNATION #9 - Valguero	vault by teleporter pin#1870 -393742 -269199 37803 58.15 -14.59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b9563f17-3e5b-4545-88df-c08b16c43e2d	25	Pan	PankweBiceps#7803	105013951057674240	DomiNATION #5 - Ragnarok	CANCELLED	2:30 PM- 4:30 PM UTC -6/Central Standard Time	Bug Report	03/29/2020 15:44	\N	\N	PankweBiceps	03/30/2020 23:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Can't find my ferox. Doesnt appear in the tribe log as dead but neither in the webpage. This happened in the restart. Before the restart the webpage showed his position but I couldnt find it either. Its a male ferox level about 227 clipped because someone donated it to me.	I dont think so	Yes. I dont have a screenshot but I could ask to the guy that gave me the ferox to screenshot when he unclaimed. I merged tribes so the claim isnt in my tribelog anymore	\N	It randomly appeared back in my base and the website again. Someone told me that the exact same thing happened to him so must be a common bug
f992cb04-7ac0-4590-98a3-4c8daa2ca45d	26	DP	DarkPenquin#3065	160553898459791360	DomiNATION #1 - Island	COMPLETE	9pm-12pm	Element from Event	03/29/2020 16:44	03/29/2020 16:58	ShiftyG	ShiftyG	03/29/2020 17:11	\N	\N	\N	\N	March 20 late night rockwell	DomiNATION #1 - Island	No	-200099 310963 -10636 160.66 -59.16        Pin is 5555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
576d5456-1425-4adb-b227-7ded9d0b0a14	27	Mshake	Mlaw#3250	100076789413474304	DomiNATION #1 - Island	COMPLETE	2 AM - 7 AM EST 	General Support Ticket	03/30/2020 00:54	03/30/2020 20:52	BeOurGuest	BeOurGuest	03/30/2020 21:07	N/A / Solo	173141 -114982 -14010 45.45 -12.81	I misplaced my Forge and can't access it also my stego is stuck inside of it.	I've tried demolishing the walls around it but I can't reach all of them and I don't want to demo the forge because it took so long 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3550014e-be14-47f4-9183-029c0ec37e18	31	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	CANCELLED	anytime	Patreon Monthly Dino	03/31/2020 12:21	\N	\N	XxFrostbitexX	03/31/2020 12:34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Female	-182433 100088 11682 49.06 -20.59	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Just want to make sure about the Genesis map before i request these. that's all.
220b61b3-03b3-4d91-b88d-2e873caf9c11	30	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	CANCELLED	anytime	Patreon Monthly Dino	03/31/2020 12:20	\N	\N	XxFrostbitexX	03/31/2020 12:34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Female	-182433 100088 11682 49.06 -20.59	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
ee082e38-c8ce-4cfc-a085-02dc0c0717e2	29	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	CANCELLED	anytime is fine. 	Patreon Monthly Dino	03/31/2020 12:19	\N	\N	XxFrostbitexX	03/31/2020 12:34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Male	-182433 100088 11682 49.06 -20.59	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
77f5da60-c388-46c2-a120-62383c9bd327	32	Sutter	SutterKain#0498	104820363355037696	DomiNATION #5 - Ragnarok	COMPLETE	EST	General Support Ticket	03/31/2020 14:38	03/31/2020 15:20	Frank	Frank	03/31/2020 15:33	The Call Of Cthulhu	-245185 -389765 -12979 107.13 -14.75	I'm an idiot	I was breeding Argys and had them in my base. Apparently they clipped through the walls (Again) and were loose. I logged in to a message asking to contact an admin.  I know, I know... That was my bad. =\\	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4c3f07b8-6dd3-4253-ab47-757ddd57bdff	33	Josh Is Happy	Robert Downy Syndrome#6361	240244827692728322	DomiNATION #5 - Ragnarok	CANCELLED	9PM - 12AM MTN	General Support Ticket	03/31/2020 15:40	03/31/2020 15:44	Frank	Robert Downy Syndrome	03/31/2020 15:51	josh but best	373554 -3645 -5520 -61.98 2.16	im handcuffed in the middle of the labyrinth by an admin	talked to an admin in chat who told me to submit a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
704fbddf-e7cb-4ba6-9658-b63ed415aea8	35	Rabbit	Captain#8451	467711315151028224	DomiNATION #1 - Island	COMPLETE	10Am - Eastern Standard	General Support Ticket	03/31/2020 20:45	03/31/2020 20:46	BeOurGuest	Frank	03/31/2020 20:48	Sailors	-131685 244980 -14245 72.08 -18.46	My tribemate told me about admins asking us to contact admins	Im putting in this ticket 👍	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
db240d82-bbd5-4562-9a17-dfad5886b2d9	28	kit	kit#1703	346146672599891978	DomiNATION #11 - Genesis	COMPLETE	every day, all day while in this quarantine	General Support Ticket	03/31/2020 12:19	03/31/2020 15:33	Cowdog	Cowdog	03/31/2020 16:01	The Fallen	-340337 379709 -24808 89.69 -8.61	I plan to remain on the nontransfer server, but do have a couple questions.  Was wondering if you had considered if patreons could request Genesis only dinos on the nontransfer Genesis map?  Second similarly, does this still prevent the drop off of event element on the nontransfer server?  I ask because those are things available to everyone.  Anyone can go to the events to earn the element and limiting the pat dino to dinos tamable on Genesis only doesn't give anything op, it's still limited to it's max wild level.  I understand when the map came out but now, what is the difference if I've paid a random player ingame currency for a potetially higher than wild lvl vs. my $10 irl currency buying my patreon dino?  	ask you :)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7d1cc351-f0b3-425d-975f-469005b2f220	34	Josh Is Happy	Robert Downy Syndrome#6361	240244827692728322	DomiNATION #5 - Ragnarok	COMPLETE	9PM - 12AM MTN	General Support Ticket	03/31/2020 15:55	03/31/2020 15:56	Frank	Frank	03/31/2020 16:02	josh but best	373554 -3645 -5520 -61.98 2.16	gigas had inappropriate names	i changed their names	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
08a38ff9-60a5-477e-a5ff-9cf716240efe	36	Jaeger	Jaeger#1312	296834414376124417	DomiNATION #4 - Aberration	CANCELLED	10pm West Coast	General Support Ticket	04/01/2020 01:48	\N	\N	Zylana	04/01/2020 02:07	The New Guys	-162086 -45238 43304 -143.90 -9.24	Received a Message in Game outside my base " Contact an Admin Please" Tek Parasaur Lvl 1440 Detected you	Went on Discord to the Admin-Support channel and stated the above	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Not for his tribe, meant for Ladyjuice. 
a543ed3b-cea1-47df-929a-ecf8712ccc10	37	shrapnell	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	12pm-330pm eastern	General Support Ticket	04/01/2020 11:56	04/01/2020 12:36	Frank	Frank	04/01/2020 12:44	CarbonSnow	394310 -390855 1241 -82.76 -0.69	sighn and parasour removal request	made a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e9f2d50d-1ba6-44d5-a968-f8b593cf0131	38	shrapnell	#	\N	DomiNATION #5 - Ragnarok	CANCELLED	12pm-330pm eastern	General Support Ticket	04/01/2020 12:16	\N	\N	Frank	04/01/2020 12:44	CarbonSnow	394310 -390855 1241 -82.76 -0.69	sighn and parasour removal request	made a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	duplicate from the first one shrapnell submitted\r\n
340f1656-50ab-46c5-9267-ea16cee4d8cd	42	lodbubble	demonette#5553	297906070251372546	DomiNATION #5 - Ragnarok	COMPLETE		Ban Appeal	04/01/2020 15:59	04/01/2020 16:02	Zylana	Zylana	04/01/2020 16:24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	76561198191790451	bigonetankxl@gmail.com	\N	i wort do evenly kill people or be mad at admins\r\n 	\N	\N	\N	\N	\N
90fbb7d9-4cec-43a7-b1f1-acc9c514c32e	41	Brett	Brett A#7734	523334717127524362	DomiNATION #5 - Ragnarok	COMPLETE	6pm-12pm east coast	Bug Report	04/01/2020 15:34	04/01/2020 15:37	Staurophobic	Staurophobic	04/01/2020 15:53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	My body fell through the floor when I died, and I cant get my stuff	I don't know.	Well yes I lost stuff and I may have a few pics\r\n	\N	\N
d52a67d3-482e-4f4b-bd81-c4c2bdb8d47e	40	Baz	filiwegeian#3521	235655638317924352	DomiNATION #4 - Aberration	COMPLETE	12-5pm PST	General Support Ticket	04/01/2020 15:08	04/01/2020 15:37	Zylana	Staurophobic	04/01/2020 16:00	Tribe of Ladyjuice	-152659 -32572 44941 -22.30 -2.61	Please remove your parasaur	reduced base height	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e7ad3c26-dfdc-4735-a2c1-9b0a2747e80f	39	Rabbit	Captain#8451	467711315151028224	DomiNATION #1 - Island	COMPLETE	1:00PM - 4:00PM EST	General Support Ticket	04/01/2020 13:11	04/01/2020 15:38	Zylana	Staurophobic	04/01/2020 16:15	Sailors	-119677 229842 -14317 -32.63 -3.76	Im submitting this ticket to verify my completetion of fixing my base size which broke the limited space/ 	I destroyed many of my buildings that stretched out too far	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214f600b-f08e-454f-a55a-ace82db8d390	44	Valkyrie	#	\N	DomiNATION #11 - Genesis	COMPLETE	EST	General Support Ticket	04/02/2020 05:12	04/02/2020 05:15	Frank	Frank	04/02/2020 05:25	Tegridy	40919 -366274 221 124.96 32.81	Slept dinos due to accidentally leaving one male on. Can you come unsleep everything so I can cryo them all. I am done with them anyway.	Nothing...	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b7d3f861-6f16-4fa0-a1c4-e24e1ee612ef	54	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	CANCELLED	Anytime EST	Patreon Monthly Dino	04/04/2020 17:03	04/05/2020 08:36	Frank	Borealis	04/05/2020 08:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Astrocetus	Yes	1	14	4	1	17	4	Doesn't matter	283750 166565 -9598 0.10 -12.46 | PIN - 0001	paperdemonvg@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20dc9d33-2ccb-40f5-b4ed-e7108b27fe8a	55	xplaydeadx	#	\N	DomiNATION #5 - Ragnarok	COMPLETE		General Support Ticket	04/04/2020 17:58	04/05/2020 08:21	Frank	Frank	04/05/2020 14:02	tribe of ???	169058 473906 -10576 132.33 -27.73	pat dino insurance	on the rock drake	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
447e152c-44a1-414e-9810-8ca84be6abd8	45	Griz	Griz#3192	155808850472206337	DomiNATION #1 - Island	COMPLETE	6pm - 3am UTC	Transfer Element	04/03/2020 11:39	04/03/2020 15:40	Cowdog	Cowdog	04/03/2020 16:10	\N	\N	\N	\N	\N	\N	\N	\N	201	DomiNATION #1 - Island	162953 -95618 -14188 -11.18 -27.95 / pin 2013	DomiNATION #6 - Patreon Ragnarok	263037 -401719 7039 24.54 -29.44 / pin 2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f264e16e-4fe3-4b42-8270-d04b68e042d1	50	Tiggler	TerribleProblem#7441	148575382130393089	DomiNATION #1 - Island	CANCELLED	12pm to 12am central	General Support Ticket	04/03/2020 21:08	\N	\N	TerribleProblem	04/03/2020 21:14	CaveRunner	cant load into game	cant get my charecter	i need an obelisk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
c08d6bff-5f16-402a-86b9-3a226517a88f	51	Jade	teamwolfe19#0074	561367603684179981	DomiNATION #5 - Ragnarok	CANCELLED	12PM EST - 6PM EST	General Support Ticket	04/03/2020 21:48	\N	\N	teamwolfe19	04/04/2020 02:18	Fuzzy Distance	469520 -355324 -14243 95.23 -14.30	I have gone to three of the admin hosted events so far, and have claimed my element until tonight (4-3-20). I went to an ele drop on #5 rag and recieved 1500 element. I returned 750 because I want to get it on the open transfer gen server that is coming soon. I didn't tell the admin there i was a supporter on patreon so I just want to check I'm still marked down as having 2 rounds of element available to claim later, as I think the admin there might have marked me down as claiming multiple events worth of element since I did not say I was a patron. ty.	I asked for assistance in Admin Support on discord and was directed to make a ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
bfb7f664-0a14-4342-9a80-06c8d9f645e4	43	Mayh3m.EXE	Mayhem#7406	182312057306218496	DomiNATION #11 - Genesis	COMPLETE	2PM EST	Bug Report	04/01/2020 22:03	04/04/2020 05:10	Frank	Frank	04/04/2020 05:12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I was Teleporting to the ocean biome SE with my astrocetus in a cryopod and when i arrived i threw my astrocetus into the air to let it out and when it released it died and so did my player than every time i attempted to teleport back into Ocean SE it sent me to a random location in the ocean	No	Astrocetus , astrocetus saddle . i had fullys help taming the astrocetus and i have a screenshot of the death message , and Blueozzie and Birb 2's help  gathering the resources and crafting the saddle	\N	\N
7d346a2e-ce9c-4cf1-949d-f481be8e1b07	52	mejestic	AceSpades#8119	612659894155345955	DomiNATION #5 - Ragnarok	CANCELLED		General Support Ticket	04/04/2020 05:43	\N	\N	AceSpades	04/04/2020 06:41	CarbonSnow	396834 -386088 2202 -3.66 -17.30	my body a glitch under the ground	i has not 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	
c1f101cc-a49e-4c04-9bd6-14e55f1a9ab3	47	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #1 - Island	CANCELLED	1:00pm to whenever EST	Bug Report	04/03/2020 15:20	04/04/2020 05:23	Frank	Frank	04/04/2020 05:43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	i was at event map ...went back to my base on island ....server disconnected now all my gear and other items are gone …. 	I dunno 	everything 	\N	[8:22 AM] Frank: Morning, I'd like to discuss the ticket you submitted yesterday\r\n[8:23 AM] Frank: you submitted it as a bug report and while it's true that it's ark misbehaving, I'm not quite sure what you expect from us.\r\n[8:42 AM] Ledyin: i told the other lady to just close it\r\n[8:42 AM] Frank: aa ok thank you for the precision
d2c76c7a-4b36-45c1-9ee8-d912a419171b	48	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	CANCELLED	Anytime EST	Transfer Element	04/03/2020 17:41	04/04/2020 05:14	Frank	Borealis	04/04/2020 09:18	\N	\N	\N	\N	\N	\N	\N	\N	263	DomiNATION #7 - Extinction	CCC > -31455 5123 -21202 -1.73 -17.87 | Pin > 0001	DomiNATION #1 - Island	CCC > 283767 166581 -9598 3.63 -21.10 | Pin > 0001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Missinformation.
4cb8127c-da2a-43a3-9e76-855c5b031d18	49	Sid	SidTheKid#1297	189543984090054656	DomiNATION #1 - Island	CANCELLED	11AM - 11PM CST 	Transfer Element	04/03/2020 17:48	04/04/2020 05:17	Frank	Frank	04/05/2020 07:55	\N	\N	\N	\N	\N	\N	\N	\N	263	DomiNATION #7 - Extinction	-31485 5413 -21202 -4.24 -13.51   PIN code: 8523	DomiNATION #1 - Island	24861 168130 -12210 -8.67 -19.93  PIN code: 1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2d676183-8541-444a-985b-8d90ecfb0389	46	Blooper-chan	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	arizona mountain time 10am-4pm	General Support Ticket	04/03/2020 12:46	04/04/2020 13:39	BeOurGuest	BeOurGuest	04/11/2020 10:04	Cult of dionysus	-51103 -319769 7795 -44.03 38.23	There is an admin parasaur telling me to contact an admin	reached out on discord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b6a863c0-0391-4bbe-8369-e3df6b707678	53	Con	Con_71#1128	305800269860569089	DomiNATION #9 - Valguero	COMPLETE	8AM - 11PM CST	Element from Event	04/04/2020 07:04	04/05/2020 07:58	Frank	Frank	04/05/2020 07:58	\N	\N	\N	\N	Late Night Boss Battle	DomiNATION #9 - Valguero	Yes	-36760 -156738 10639 62.07 -21.70  PIN 7173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a16efaee-2ed8-4b91-9fe3-c8d3ca52fce3	58	Krafty	XMAN-Unum#6590	254482409335160833	DomiNATION #5 - Ragnarok	COMPLETE	6 PM - 11 PM PST East Cost 	General Support Ticket	04/04/2020 22:38	04/05/2020 09:14	ShiftyG	ShiftyG	04/05/2020 09:22	Infinity	302412 -392916 -783 153.86 -21.24	Can not build because of foundations under the mesh	Can not access the foundations under the mesh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b58d726a-9ea1-44e9-88d6-424bcdad418e	56	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #5 - Ragnarok	COMPLETE	5pm-10pm central	Element from Event	04/04/2020 20:49	04/05/2020 08:10	Frank	Frank	04/11/2020 03:33	\N	\N	\N	\N	April 4th Event	DomiNATION #5 - Ragnarok	No	-332665 -442982 -10870 155.79 -20.63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
312a041a-4987-4764-a31a-8a8ba361207c	59	leGit	leGit510#6864	219683841143603200	DomiNATION #9 - Valguero	COMPLETE	Now-12Am	Patreon Monthly Dino	04/05/2020 06:59	04/05/2020 08:40	Frank	Frank	04/05/2020 08:49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Magmasaur	No	na	na	na	na	na	na	Female	248852 386536 30378 -150.31 -18.77 PIN:6969	JMSAquino@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5978023c-4bf1-401c-9bcf-52327a135479	60	JBizzle	JBizzle#9229	288110391492345858	DomiNATION #9 - Valguero	COMPLETE	530pm -10pm est mon-fri sat & sun 8am - 10pm	Patreon Monthly Dino	04/05/2020 07:27	04/05/2020 08:57	Frank	Frank	04/05/2020 08:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Mosasaurus	No	na	na	na	na	na	na	Doesn't matter	cryofridge by TP pin#1870 -393616 -269309 37803 55.70 -8.02	james_brown4848@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ee1b7155-e367-4f3c-8ef3-0328f598ab48	61	Lawdy	ItsYaBoiLawdy#2305	386226755075047425	DomiNATION #13 - Genesis	COMPLETE	5:30PM-12AM CST	Patreon Monthly Dino	04/05/2020 07:44	04/05/2020 09:04	Frank	Frank	04/07/2020 05:13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Magmasaur	No	na	na	na	na	na	na	Female	190292 -202001 619 87.96 -15.92 Pin 1111	austinlauderman@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b1cef55a-6233-4554-a6ea-16fb639dc0dc	63	Emma	Emma#0569	342987464744632321	DomiNATION #9 - Valguero	COMPLETE	3PM-5PM Est	Patreon Monthly Dino	04/05/2020 08:15	04/05/2020 08:24	Cowdog	Cowdog	04/05/2020 09:21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Tek Rex	No	na	na	na	na	na	na	Female	183708 -163441 -5164 57.70 -8.34 & PIN 9489	jenducate@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1a82d527-8f50-490d-98a5-80783576d5c5	62	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #1 - Island	COMPLETE	est varies	Patreon Monthly Dino	04/05/2020 07:56	04/05/2020 09:23	ShiftyG	ShiftyG	04/05/2020 09:43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Quetzacoatlus	No	na	na	na	na	na	na	Female	247611 193849 -14017 175.72 -20.62 pin 1206	gmckee1964@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86a4a479-546a-46e8-b3c8-b7676efe792f	64	Jezera	Jez#0435	384931524614553611	DomiNATION #8 - Patreon Extinction	COMPLETE	NA	Patreon Monthly Dino	04/05/2020 08:38	04/05/2020 09:13	Frank	Frank	04/05/2020 09:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Karkinos	Yes	208	na	na	na	6	5	Doesn't matter	-284574 -241589 -94051 -40.28 -23.66  7856  tek box has tek light on top, on roof of building	stardragon81@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f2ad8d44-e255-4dfd-878f-263fb7c2ee8b	57	Ace	AceoMac#8931	292843159518576640	DomiNATION #5 - Ragnarok	CANCELLED	12pm-12am West Coast	General Support Ticket	04/04/2020 21:07	04/05/2020 10:36	BeOurGuest	BeOurGuest	04/05/2020 10:47	Infinity	304446 -383320 221 -7.02 -23.86	I build by base and now it wont let me put a Tek Generator down anywher inside it. Can someone help me place it or recover my Tek materials so I can move my base to another location.	Contacted support?	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
030f775c-a527-4ebd-8b5c-4783c85ac420	69	Kolobok	#	\N	DomiNATION #1 - Island	CANCELLED	around 1900-0800 PST	General Support Ticket	04/05/2020 11:53	\N	\N	BeOurGuest	04/05/2020 12:11	Tribe of Kolobok	112241 273343 -13459 -164.73 -40.54	patreon dino request: Bloodstalker from Genesis. Thank you!	became a supporter! :)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9ab9665b-7fd5-4224-bc85-bd2489fc7e6f	76	SATAN	ItsmeSatan#2734	337036321048756234	DomiNATION #4 - Aberration	COMPLETE	4pm 10pm pst	Transfer Element	04/05/2020 18:19	04/06/2020 02:41	Zylana	Zylana	04/06/2020 02:52	\N	\N	\N	\N	\N	\N	\N	\N	580	DomiNATION #4 - Aberration	245916 -58203 33928 -94.61 -28.47       tek generator pin 1420	DomiNATION #6 - Patreon Ragnarok	-598161 -138623 -56934 -119.05 -34.96  box pin 1420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7174325e-2f49-435e-b8b1-8fcddde6f06e	74	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #1 - Island	CANCELLED	5pm-10pm central weekdays 7am-6pm weekends	Transfer Element	04/05/2020 15:23	04/06/2020 02:30	Zylana	Zylana	04/06/2020 02:38	\N	\N	\N	\N	\N	\N	\N	\N	130	DomiNATION #1 - Island	-283398 227956 -12842 -28.63 -22.02	DomiNATION #5 - Ragnarok	-337329 -448813 -12274 174.50 -6.08	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4334821f-eac4-486d-a55d-6602ad0d5c24	66	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	CANCELLED	6pm to 4am est	Patreon Monthly Dino	04/05/2020 09:02	\N	\N	bobbbawatts	04/06/2020 07:12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Megachelon	No	na	na	na	na	na	na	Doesn't matter	93783 197392 804 72.30 -21.90	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5ab40a7c-7069-4eb4-8553-ff298bb33cf8	65	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	CANCELLED	6pm to 4am est	Patreon Monthly Dino	04/05/2020 09:01	\N	\N	bobbbawatts	04/06/2020 07:16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	93783 197392 804 72.30 -21.90	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dcaf5b2c-46b9-40da-a1c3-b56b510c87e3	78	Lt. Shifty	ShiftyG#9609	421143819518476299	DomiNATION #1 - Island	CANCELLED	Anytime	Patreon Monthly Dino	04/06/2020 07:20	04/06/2020 07:25	ShiftyG	ShiftyG	04/06/2020 07:28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Basilisk	No	na	na	na	na	na	na	Doesn't matter	over here - this is just a test. DO NOT fill this request.	shiftygamingofficial@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b86d836c-7b3f-4535-8d20-df82c0082692	80	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	CANCELLED	6pm to 4am est	Patreon Monthly Dino	04/06/2020 07:22	\N	\N	bobbbawatts	04/06/2020 07:41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Astrocetus	No	na	na	na	na	na	na	Doesn't matter	94462 197258 736 -8.39 -14.13 pin; 2254 box named stone	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86a7820a-6024-49d9-bed6-5b4380141114	81	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Patreon Monthly Dino	04/06/2020 07:25	04/06/2020 17:24	Cowdog	Frank	04/07/2020 05:28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Megachelon	No	na	na	na	na	na	na	Doesn't matter	94462 197258 736 -8.39 -14.13 pin; 2254 box named stone	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5c4d7fe5-3e5b-4534-99cf-193bb56bf5ad	72	Ami Wolvez	-Ami-#4637	239810011159724042	DomiNATION #1 - Island	COMPLETE	Florida... 5pm to 11pm	Patreon Monthly Dino	04/05/2020 14:11	04/06/2020 07:43	ShiftyG	ShiftyG	04/06/2020 08:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Thylacoleo	Yes	14	18	18	18	17	14	Male	-256186 275644 -14281 120.27 -9.23	elsabmarte00@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d78d0de2-1032-42a7-9428-5ad575bf5104	67	Griz	Griz#3192	155808850472206337	DomiNATION #6 - Patreon Ragnarok	COMPLETE	6pm - 3am UTC	Patreon Monthly Dino	04/05/2020 09:52	04/06/2020 08:11	ShiftyG	ShiftyG	04/06/2020 08:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Bloodstalker	No	na	na	na	na	na	na	Doesn't matter	262754 -401331 7039 106.97 -5.69 /pin 2013	iron.force@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6cde407a-b7d4-4aeb-9009-73d2efe447e1	68	Jace	Milkman1546#8784	282397073184391168	DomiNATION #1 - Island	COMPLETE		Patreon Monthly Dino	04/05/2020 10:42	04/06/2020 08:29	ShiftyG	ShiftyG	04/06/2020 08:58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Thylacoleo	No	na	na	na	na	na	na	Male	-272721 -178851 -9584 110.01 -8.24	dcampos1319@live.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5634d45e-9261-4213-8a5f-070c5dc7454b	83	Exstila	Exstila#8062	483786951271645184	DomiNATION #1 - Island	CANCELLED	EST	General Support Ticket	04/06/2020 10:06	\N	\N	Staurophobic	04/06/2020 15:09	Alpha	-	Need help transferring element	Ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a9d54754-9f43-43bc-b0a4-5d40019a5ae0	82	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Element from Event	04/06/2020 07:29	04/06/2020 17:23	Cowdog	Frank	04/07/2020 05:30	\N	\N	\N	\N	late night rockwell in January	DomiNATION #11 - Genesis	Yes	94462 197258 736 -19.13 -11.78 storage box named stone pin; 2254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f204e520-b7ab-44fe-b1f2-46c71b7a292d	75	Jade	teamwolfe19#0074	561367603684179981	DomiNATION #5 - Ragnarok	COMPLETE	12PM EST - 6PM EST	Patreon Monthly Dino	04/05/2020 15:25	04/06/2020 17:06	Frank	Frank	04/06/2020 17:18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Wyvern (Ice)	Yes	14	204	204	204	204	204	Female	469818 -352413 -14299 57.01 -22.80      Pin : 2846	teamwolfe19@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0e65fe01-bdf3-40b5-98b5-8ed8cc532d6d	77	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Patreon Monthly Dino	04/06/2020 07:15	04/06/2020 17:23	Cowdog	Frank	04/07/2020 05:38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Magmasaur	Yes	5	na	31	na	na	14	Doesn't matter	94462 197258 736 -8.39 -14.13 pin; 2254 box named stone	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a76d7ad7-9e6b-4811-b257-b4eee8d6ec58	79	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Patreon Monthly Dino	04/06/2020 07:20	04/06/2020 17:24	Cowdog	Frank	04/07/2020 05:38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Magmasaur	Yes	18	na	225	na	na	49	Doesn't matter	94462 197258 736 -8.39 -14.13 pin; 2254 box named stone	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113c5580-db6b-43b3-babf-f92bdbcf47e3	102	Maka	Makadina#8877	499371582893064193	DomiNATION #1 - Island	CANCELLED	6PM-10PM EST	Patreon Monthly Dino	04/07/2020 17:02	04/10/2020 12:10	Cowdog	Cowdog	04/10/2020 12:11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Bloodstalker	No	na	na	na	na	na	na	Doesn't matter	-278602 -141561 -6593 59.22 -3.36; 9499 (special)	makadina@sbcglobal.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0d26d816-7456-480c-9a97-7aa26acca965	73	Struggler	Bass & Gizmo#1387	277855875861970945	DomiNATION #11 - Genesis	COMPLETE	1pm -10pm East coast 	Patreon Monthly Dino	04/05/2020 14:41	04/06/2020 17:18	Frank	Frank	04/06/2020 17:27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	X-Mosasaurus	No	na	na	na	na	na	na	Female	70.2 80.8	Datboiimas3@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c85ee9ee-e85b-4968-9ca2-1ca30786147a	97	Froppy	♛Queenie♛#4663	360603244956745729	DomiNATION #13 - Genesis	CANCELLED	9am-9pm CST	Patreon Monthly Dino	04/07/2020 11:58	\N	\N	♛Queenie♛	04/09/2020 14:52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	166385 -381668 -19472 -160.09 -16.75  Pin Code: 1133	kdoty.1996@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a888855e-fc0c-44a5-add2-45a6d8cc1591	90	UndeadTank	Undeadtank#8033	215560083566755841	DomiNATION #8 - Patreon Extinction	CANCELLED	8 -10pm est	General Support Ticket	04/06/2020 17:44	04/06/2020 17:46	Frank	Frank	04/06/2020 17:49	UndeadTank	-218817 -171356 -133847 -45.40 -43.96	i noticed i am missing a tek para she is normally at then end of the base next to the vaults not in death log or cryopoded missing on website as well	looked all over base dont see her or in death log 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
af41c3b0-3f64-4b97-8105-6cacd61ec17b	88	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	COMPLETE	anytime	Patreon Monthly Dino	04/06/2020 16:56	04/06/2020 17:04	Zylana	Zylana	04/06/2020 17:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Female	-352361 -452878 -34339 -77.47 -20.88   6970	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7d7e7593-4ed9-4617-8654-e5af39bb5e4a	89	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	COMPLETE	anytime	Patreon Monthly Dino	04/06/2020 16:56	04/06/2020 16:57	Zylana	Zylana	04/06/2020 17:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Female	-352361 -452878 -34339 -77.47 -20.88   6970	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
444e8f88-f015-4c66-9a72-cc86e70e55b1	87	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	COMPLETE	anytime	Patreon Monthly Dino	04/06/2020 16:55	04/06/2020 16:57	Zylana	Zylana	04/06/2020 17:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Female	-352361 -452878 -34339 -77.47 -20.88  6970	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66938900-27c3-432b-8b9e-8b672822345c	86	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	COMPLETE	anytime	Patreon Monthly Dino	04/06/2020 16:54	04/06/2020 17:03	Zylana	Zylana	04/06/2020 17:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Mosasaurus	No	na	na	na	na	na	na	Male	-352361 -452878 -34339 -77.47 -20.88 6970	jessepcvfd6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9ee40cf8-d944-4e9f-90fe-c2e265b6733a	91	shrapnell	#	\N	DomiNATION #5 - Ragnarok	CANCELLED	12pm-5pmEastern	General Support Ticket	04/06/2020 18:06	04/06/2020 18:08	Zylana	Zylana	04/06/2020 18:08	CarbonSnow	394310 -390855 1241 -82.76 -0.69	I need to be owner of the tribe so i can do what i want with it cause my owner doesnt play anymore and im the onlyone left in the tribe	I have asked him to make me tribe leader but he says i dont play anymore i deleted it.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4b89f88c-4b67-4cd9-97d4-c861644fdedc	85	Exstila	Exstila#8062	483786951271645184	DomiNATION #1 - Island	COMPLETE	EST	Transfer Element	04/06/2020 15:29	04/06/2020 17:18	Zylana	Zylana	04/06/2020 17:37	\N	\N	\N	\N	\N	\N	\N	\N	200	DomiNATION #7 - Extinction	nast base with teleporter and the two transfer terminals.	DomiNATION #1 - Island	10825 -83840 -2673 50.07 0.53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
272510b7-ef2d-493c-8798-b71cc4dc6196	70	Kolobok	Kolobok#2615	677933875590201394	DomiNATION #1 - Island	COMPLETE	around 1900-0800 PST	Patreon Monthly Dino	04/05/2020 12:32	04/06/2020 08:59	ShiftyG	ShiftyG	04/07/2020 02:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Bloodstalker	No	na	na	na	na	na	na	Male	112229 273358 -13459 -148.69 -35.12	mfbsatx@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
761313b4-1ce5-4694-8e79-f5a0a6363438	93	leGit	leGit510#6864	219683841143603200	DomiNATION #7 - Extinction	COMPLETE	Now-12Am	Transfer Element	04/06/2020 19:03	04/07/2020 02:07	ShiftyG	ShiftyG	04/07/2020 03:01	\N	\N	\N	\N	\N	\N	\N	\N	4500	DomiNATION #7 - Extinction	190229 -271755 17370 -46.62 -18.99 PIN:6969	DomiNATION #9 - Valguero	249202 383943 29997 144.19 -13.39 PIN:1120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5cdd06c4-0a16-45ca-9755-8d01b058a066	94	Micro	Micro#7503	331790241566425099	DomiNATION #13 - Genesis	COMPLETE	CST	Transfer Element	04/07/2020 09:09	04/08/2020 04:54	Ford	Ford	04/08/2020 05:13	\N	\N	\N	\N	\N	\N	\N	\N	4000	DomiNATION #1 - Island	-94019 -166106 1455 -107.18 -15.56 pin1445	DomiNATION #13 - Genesis	286344 -75943 -13051 -57.54 -21.23 PIN 1445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102ed8d0-3fec-467b-b2a6-c9eb549f8e9f	96	Birb 2	#	\N	DomiNATION #4 - Aberration	COMPLETE	MST	Transfer Element	04/07/2020 11:09	04/08/2020 17:48	BeOurGuest	BeOurGuest	04/08/2020 17:57	\N	\N	\N	\N	\N	\N	\N	\N	500	DomiNATION #4 - Aberration	-158833 -87790 56822 -33.81 -21.95 Large Storage box unlocked	DomiNATION #11 - Genesis	107552 -246031 -34073 -99.67 -21.55 A large Storage box, Unlocked next to an Otter	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9c22d016-6d40-477e-8d11-bbd5d209fc67	98	Maka	Makadina#8877	499371582893064193	DomiNATION #1 - Island	COMPLETE	6PM-10PM EST	Patreon Monthly Dino	04/07/2020 16:15	04/10/2020 11:37	Cowdog	Cowdog	04/10/2020 17:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Megachelon	No	na	na	na	na	na	na	Doesn't matter	-277178 -142277 -6934 99.23 -16.40; 9499	makadina@sbcglobal.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
326253a8-3838-48c3-8a4d-cd5808db9750	99	Maka	Makadina#8877	499371582893064193	DomiNATION #1 - Island	COMPLETE	6PM-10PM EST	Patreon Monthly Dino	04/07/2020 16:56	04/10/2020 11:45	Cowdog	Cowdog	04/10/2020 17:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Giganotosaurus	No	na	na	na	na	na	na	Doesn't matter	-278602 -141561 -6593 59.22 -3.36; 9499 (special)	makadina@sbcglobal.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3f10a732-4901-4cd6-a5ec-18a961e12a26	100	Maka	Makadina#8877	499371582893064193	DomiNATION #1 - Island	COMPLETE	6PM-10PM EST	Patreon Monthly Dino	04/07/2020 16:57	04/10/2020 11:49	Cowdog	Cowdog	04/10/2020 17:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Rex	No	na	na	na	na	na	na	Doesn't matter	-278602 -141561 -6593 59.22 -3.36, 9499	makadina@sbcglobal.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ac4aefd2-9f48-43a8-a066-0197f21168e0	101	Maka	Makadina#8877	499371582893064193	DomiNATION #1 - Island	COMPLETE	6PM-10PM EST	Patreon Monthly Dino	04/07/2020 17:01	04/10/2020 11:56	Cowdog	Cowdog	04/10/2020 17:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	-278602 -141561 -6593 59.22 -3.36; 9499 (special)	makadina@sbcglobal.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9e12d4d5-c36d-4def-925e-a90ef1c71ec7	95	Kdmman2	Kdmman2#9586	273530002543345664	DomiNATION #11 - Genesis	COMPLETE	My schedule is kinda day to day right now, but I can be on almost anytime (especially after 5pm)	Patreon Monthly Dino	04/07/2020 10:35	04/10/2020 12:16	Cowdog	Cowdog	04/10/2020 12:45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	X-Rock Elemental	Yes	na	5	na	na	na	na	Doesn't matter	CCC: -52230 -98955 405 12.06 -25.00 PIN: 1239	kdmman2@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
924a385a-d1fb-4017-9c3d-a1428f26f5a4	92	Tharan	Tharan#8349	225057436514385930	DomiNATION #6 - Patreon Ragnarok	COMPLETE	at the moment not sure as my schedule has been really busy but feel free to DM me 	General Support Ticket	04/06/2020 18:41	04/07/2020 05:46	Frank	Frank	04/07/2020 18:16	N/A	N/A	I have all ready payed for the month of April as a supporter yesterday i canceled my support but still Figured i would have the month left to get my Stuff together so i was wondering if there was a way to White list me till the end of the month ? 	Submit support	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
524eb0de-6756-4562-aba3-1234ea90a5d3	105	Moose II	#	\N	DomiNATION #13 - Genesis	COMPLETE		General Support Ticket	04/08/2020 15:15	04/08/2020 15:18	Zylana	BeOurGuest	04/08/2020 15:23	Mooseknuckles	363972 42725 346 35.09 -28.67	Logged off at dodo basketball for restart. Character died for no known reason and feel through the floor. Lost some TEK armor, an acendent pike, a mastercraft hatchet and pick axe, and ascendent pump shot gun, 200 shotgun shells, a journeyman chainsay, and i think thats it. Kinda figure you guys cant do anything but if the body is still here maybe you can.	Tried to check for body	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1b738a5c-3973-424f-82ea-f4a4911666b7	103	Logic	SquoxQueen#5627	187343899461681152	DomiNATION #5 - Ragnarok	CANCELLED	11am-8pm central time	General Support Ticket	04/08/2020 12:19	\N	\N	BeOurGuest	04/08/2020 18:18	The Breeders of Nothing	I can't get on to do that	I don't have the time to play like I used to, so it's rare for me to get on now a days. I'd like to request a babysitter for the base on Rag 5, I'd greatly appreciate it.	Have tried getting on many times to take care of the base, but keeps getting pulled away to do farm work.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67b8d824-e5fb-4646-b615-70a9f5482d9b	107	Froppy	♛Queenie♛#4663	360603244956745729	DomiNATION #13 - Genesis	COMPLETE	9am-9pm CST	Element from Event	04/08/2020 17:35	04/09/2020 02:59	Ford	Ford	04/09/2020 03:24	\N	\N	\N	\N	Tek Cave on the 14th I think?	DomiNATION #13 - Genesis	Yes	56153 -357357 221 23.22 -19.33 Pin Code: 1133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f463670a-c769-4da8-84ef-9656e12c9d30	106	Mayh3m.EXE	Mayhem#7406	182312057306218496	DomiNATION #11 - Genesis	COMPLETE	2PM EST	Element from Event	04/08/2020 17:25	04/09/2020 03:27	Ford	Ford	04/09/2020 03:34	\N	\N	\N	\N	Late night boss battle April 3rd	DomiNATION #11 - Genesis	No	-324339 188808 -25421 -114.65 14.13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5456d281-6a74-4571-b14d-628bb861e5f1	113	Sutter	#	\N	DomiNATION #5 - Ragnarok	CANCELLED	EST	General Support Ticket	04/09/2020 14:40	\N	\N	ShiftyG	04/09/2020 14:44	The Call Of Cthulhu	-246159 -389545 -13715 -97.52 -26.96	Someone somehow claimed my tame	Long story short-ish, Aldo198 somehow got into my base and claimed 2 of my tames. I was in a few days ago to feed the tames, and the claim timer wouldn't have been up yet. I gave him the option. Initially I asked him what he wanted for the spino. He was unhelpful.  Along the way I asked him when he claimed them. He admitted to going into my base but those were somehow the only 2 up for claim. I told him that going into someone's base is against the rules, at which point he said "well apparently there will be no deal". I have screen shots of the whole convo. But he admitted going into my base and somehow being able to claim those 2 dinos.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11c21efb-0b26-4ab4-bd5f-bac5b3a60589	104	Spinn	CubanDruglord#6304	427218248149499905	DomiNATION #11 - Genesis	COMPLETE	1-11pm CST	Transfer Element	04/08/2020 12:35	04/09/2020 03:53	Ford	Ford	04/09/2020 04:47	\N	\N	\N	\N	\N	\N	\N	\N	725	DomiNATION #11 - Genesis	90075 274878 535 122.19 -8.49      pin: 1111	DomiNATION #13 - Genesis	105921 307889 253 172.71 -18.80        pin: 1111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d84490ff-5d8b-4be1-96cf-6b89550eb902	111	kit	kit#1703	346146672599891978	DomiNATION #11 - Genesis	COMPLETE	every day, all day while in this quarantine	Element from Event	04/09/2020 09:25	04/09/2020 14:19	ShiftyG	ShiftyG	04/09/2020 16:35	\N	\N	\N	\N	several past events	DomiNATION #11 - Genesis	Yes	-340511 379744 -24810 67.64 -11.26   pin 8881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
abb170ea-1843-49af-80eb-f9bbaeab58b8	112	Sutter	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	EST	General Support Ticket	04/09/2020 14:34	04/09/2020 17:14	Zylana	Zylana	04/09/2020 18:37	The Call Of Cthulhu	-245776 -389494 -13715 -17.06 -13.19	Someone somehow claimed my tame	Long story short-ish, Aldo198 somehow got into my base and claimed 2 of my tames. I was in a few days ago to feed the tames, and the claim timer wouldn't have been up yet. I gave him the option. Initially I asked him what he wanted for the spino. He was unhelpful.  Along the way I asked him when he claimed them. He admitted to going into my base but those were somehow the only 2 up for claim. I told him that going into someone's base is against the rules, at which point he said "well apparently there will be no deal". I have screen shots of the whole convo. But he admitted going into my base and somehow being able to claim those 2 dinos.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2ae05b10-2fde-4cdd-a1c2-e8941a9c6018	114	JCBBlueDevil	JCBBlueDevil#4290	275127176276213760	DomiNATION #5 - Ragnarok	COMPLETE	1600-2200 PDT	General Support Ticket	04/09/2020 16:38	04/09/2020 17:13	Zylana	Zylana	04/09/2020 17:14	Dodo Nation	approximately 12 lat 22 lon. CCC command not working for me :/	Spawned into a "tribo full" base, stuck in their foundation.	tried relogging to get out of foundation, but i believe the building is enclosed anyways	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ab521026-d8bd-4596-a6bd-c151d9610fe4	115	Exo	shid#2793	211267897224331264	DomiNATION #5 - Ragnarok	COMPLETE	8pm - 4am	General Support Ticket	04/09/2020 21:56	04/09/2020 22:35	BeOurGuest	BeOurGuest	04/09/2020 22:58	wat	24.8 27.9 (CCC isnt working)	I left my Allos on mating and now my dinos are all knocked.	Did what the magic signs and parasaur requested	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c2f8e851-5049-4558-9981-cb0f9699d002	118	WZK	WZK#7430	688223029905588386	DomiNATION #1 - Island	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Patreon Monthly Dino	04/10/2020 10:34	04/10/2020 10:38	Cowdog	Cowdog	04/10/2020 13:44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Magmasaur	No	na	na	na	na	na	na	Female	167 243414 -9908 65.75 -9.01	spg8642@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6b548f57-0c8d-4a91-88c5-4f4d1e3dd96b	109	Kai	cursedcat#0504	328379962950287360	DomiNATION #11 - Genesis	COMPLETE	4-10pm Arizona Time	Patreon Monthly Dino	04/08/2020 19:43	04/10/2020 12:52	Cowdog	Cowdog	04/10/2020 13:04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Tusoteuthis	No	na	na	na	na	na	na	Female	341900 334530 180 -161.33 -15.24 pincode: 0805	skadejs@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b68521cc-4853-4c82-af10-146e6182adac	116	gary busey	prowaterbuffalo#6885	169610605571997696	DomiNATION #6 - Patreon Ragnarok	COMPLETE	cst	Patreon Monthly Dino	04/10/2020 01:55	04/10/2020 13:12	Cowdog	Cowdog	04/10/2020 13:36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Yutyrannus	No	na	na	na	na	na	na	Male	-287643 -444219 -14227 -71.21 -22.94            Leftmost cryofridge PIN: 3233 -- ty!	jackricexc@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
967e23cb-f7b9-4e69-85ca-16df907220be	110	Hurk	Slams#1912	451162006729261067	DomiNATION #13 - Genesis	COMPLETE	5PM - 10PM East Coast	Element from Event	04/09/2020 05:27	04/11/2020 03:09	Frank	Frank	04/11/2020 03:11	\N	\N	\N	\N	April 4th, 2020 7PM CST  Primetime Boss Battle	DomiNATION #13 - Genesis	Yes	-328309 170937 -24097 173.54 -29.81 PIN: 3367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b5ec5a03-8d0a-4cce-a85e-5a32f3f3d74f	117	Ashalyn	Ashalyn#8713	247494456926928896	DomiNATION #13 - Genesis	COMPLETE	12pm-8pm Central	Patreon Monthly Dino	04/10/2020 10:02	04/11/2020 03:12	Frank	Frank	04/11/2020 03:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Managarmr	Yes	14	211	91	207	14	91	Doesn't matter	57330 -359969 221 76.51 1.76   6666	ashleykelley_sch@icloud.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66019a45-853a-4974-8408-ec1102936dc5	119	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #1 - Island	CANCELLED	Varies East Coast USA	Bug Report	04/10/2020 12:11	\N	\N	Ledyin	04/10/2020 12:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am stuck inside a wall at my base\r\nCCC Code is:\r\n252131 177885 -14060 -141.51 -13.93	yes	not yet	\N	\N
972c40ad-56b1-4a9a-8da2-77bfc183a7c0	108	Kai	cursedcat#0504	328379962950287360	DomiNATION #11 - Genesis	COMPLETE	4-10pm Arizona Time	Patreon Monthly Dino	04/08/2020 19:38	04/10/2020 12:51	Cowdog	Cowdog	04/10/2020 13:07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Tusoteuthis	No	na	na	na	na	na	na	Male	341900 334530 180 -161.33 -15.24 pincode: 0805	skadejs@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
497a5496-1390-4cda-9c65-77c279bd5a2f	121	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Patreon Insurance Request	04/10/2020 17:17	04/11/2020 03:35	Frank	Frank	04/11/2020 05:02	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/11/dino/360977188	bobbba.watts@gmail.com	april	got stuck between rocks and attacked by a group of basilisk while i was trying to tele to safety	\N	\N	\N	\N	\N	\N	\N	\N	\N
4a3b58aa-bc69-4e35-a5c3-f184e775595c	123	Kitten	Kitten#3336	270601710819475467	DomiNATION #4 - Aberration	COMPLETE	Central	General Support Ticket	04/10/2020 18:15	04/10/2020 18:18	Frank	Frank	04/10/2020 18:19	Meow	-181101 -56946 43485 21.41 -50.49	Dino loss due to server crash	Cant do anything.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c9a029aa-d396-467d-b412-eed505d7e863	125	Lobsterman	Lobsterman#8257	371801201798545420	DomiNATION #3 - Scorched Earth	COMPLETE	8PM - 1AM CST	General Support Ticket	04/10/2020 22:06	04/10/2020 22:10	BeOurGuest	BeOurGuest	04/10/2020 22:16	Rip and Tear	-42468 -191956 -9699 66.90 10.42	I joined SE and through out my mana and I realized I was in my old tribe so I left that tribe to make my new tribe and now my mana is stuck in the old tribe.	Not much I can do. Everyone who plays in the old tribe is long gone.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12e1817c-b0a0-4e24-94b3-2163a6bf3477	120	Tessa	Tessa#0647	271142868008042497	DomiNATION #10 - Patreon Aberration	COMPLETE	4pm -12am cst	Transfer Element	04/10/2020 13:54	04/11/2020 03:18	Frank	Frank	04/11/2020 03:27	\N	\N	\N	\N	\N	\N	\N	\N	559	DomiNATION #10 - Patreon Aberration	-165589 -177404 42352 -26.55 -13.83  code 0088	DomiNATION #8 - Patreon Extinction	-187417 -287220 -132660 -86.29 -12.43  code 6523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4ba764eb-165a-4741-a671-028f291e9dc3	129	Anddiee	Jazz#1909	495341153890205696	DomiNATION #1 - Island	CANCELLED	central	General Support Ticket	04/11/2020 09:21	\N	\N	BeOurGuest	04/11/2020 09:49	Ledyin	cannot get in	crashed out of server and can not get in this is second day in a row	relogged checked on discord to see if others have same problem	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b9142433-83ec-4d60-8cb7-dee50d8dca7d	128	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #1 - Island	COMPLETE	3pm-11pm central weekdays 7am-10pm weekends	Transfer Element	04/11/2020 08:03	04/11/2020 09:12	BeOurGuest	BeOurGuest	04/11/2020 09:59	\N	\N	\N	\N	\N	\N	\N	\N	130	DomiNATION #1 - Island	-283407 227942 -12842 -31.51 -16.98        pin # 1791	DomiNATION #5 - Ragnarok	-335520 -448780 -12274 -87.73 -10.91       pin # 1791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
999c973b-65f1-4e84-898d-dde69a9429ad	122	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Patreon Monthly Dino	04/10/2020 17:27	04/11/2020 03:34	Frank	Frank	04/11/2020 05:02	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #11 - Genesis	Astrocetus	Yes	56	214	5	na	214	53	Doesn't matter	94462 197258 736 -8.39 -14.13 pin; 2254 box named stone	bobbba.watts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
095c8871-0631-4f59-a48f-4569a5ed8091	127	Frozeefrank	Frank#6764	138791132430729217	DomiNATION #1 - Island	CANCELLED	21:00 to 23:00 EST week days	Patreon Monthly Dino	04/11/2020 05:54	04/11/2020 05:54	Frank	Frank	04/11/2020 05:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Allosaurus	Yes	9	na	na	na	15	17	Doesn't matter	213292 87759 -6050 -26.86 -41.32 Pin : 1234 storage Patreon Dino Delivery	ftrepanier85@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0d1093e4-1460-4546-9ecf-f785e4841eb7	124	WZK	WZK#7430	688223029905588386	DomiNATION #1 - Island	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Bug Report	04/10/2020 21:44	04/11/2020 03:37	Frank	Frank	04/11/2020 06:03	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Was cloning my Black pearl gacha for ThreeShot and went to the Overseer event tonight. Halfway through the cloning must have stopped because it cost 160 element to clone and I have only 80 element worth of shards left inside clone machine, NO clone came out. Please help me! :(	Not that I know of?	I didn't have screenshots because I was at the Overseer event when I was cloning :(	\N	\N
2f9e5d99-95bc-44d0-bef1-1b48eb6fc6ec	132	slim	#	\N	DomiNATION #4 - Aberration	COMPLETE	4pm central	General Support Ticket	04/11/2020 13:14	04/11/2020 17:56	Zylana	Zylana	04/11/2020 17:59	tribe of slim	-16243 -127161 40365 96.43 -43.82	reaper is inside the ground after update.	tried to find him by destroying thefloors but did not work	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c7de0ac8-ef02-4d41-8bf5-a49cb358427b	130	Reaper843	The Poopsmith#6905	139199646915362817	DomiNATION #9 - Valguero	COMPLETE	10am-3am CST	General Support Ticket	04/11/2020 09:29	04/12/2020 00:36	Zylana	Zylana	04/12/2020 00:36	Dodo Nation	78270 -51897 -14048 53.41 -34.47	I cryo'd a bear, icon changed itself to a raptor and now wont come out of the cryo pod	tried reloading, taking it to different servers and putting it in the cryo fridge and relog	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49d01d76-95e1-4461-8836-25717a454c45	136	ChokeOnMyRocks	ChokeOnMyRocks#1938	312995438368260097	DomiNATION #1 - Island	COMPLETE	4pm - 10pm  eastern standard	Element from Event	04/12/2020 06:29	04/12/2020 23:09	BeOurGuest	BeOurGuest	04/12/2020 23:15	\N	\N	\N	\N	March 28  i think or the march 21 	DomiNATION #1 - Island	Yes	227664 97615 -5612 1.24 -10.04   pin# 0361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
965e4b24-8ebe-4131-9f57-2db48bfe9365	131	Jaeger	Jaeger#1312	296834414376124417	DomiNATION #4 - Aberration	COMPLETE	West Coast	General Support Ticket	04/11/2020 12:15	04/12/2020 23:46	BeOurGuest	BeOurGuest	04/16/2020 13:02	The New Guys	-162086 -45238 43304 -143.90 -9.24	Manizzle Bought some Dinos at Rag#5 CC, had them in pods, came back to Ab#4 and they weren't there anymore. They show up as Dead on Rag...I have screen shot	Search on ground at Transmitter at HCC and checked all storage local on AberrationRequested Admin help	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a74fa0a3-ea31-4c4a-8d9a-adc856894f2a	126	Fatman101	Fatman101#3792	439974141072769058	DomiNATION #5 - Ragnarok	COMPLETE	9:30PM-10:45EST 	Patreon Monthly Dino	04/11/2020 05:09	04/13/2020 12:38	ShiftyG	ShiftyG	04/13/2020 13:05	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Wyvern (Ice)	Yes	85	na	na	na	83	86	Doesn't matter	218213 -442410 -11932 44.48 -36.13 PIN:2275	anthony@nouturn.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ecbc9db2-c212-4afc-92c2-6ae3e58ca10c	134	T-rex	Zynatoes#0157	274681522077040643	DomiNATION #5 - Ragnarok	CANCELLED	basically whenever eastern 	General Support Ticket	04/12/2020 05:39	\N	\N	Zynatoes	04/12/2020 06:41	cvs	-59326 -238499 7582 103.57 -25.74	i logged in to dying and all my stuff is under the map 	submit this ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
313c41e0-7cee-4ffd-b128-09a5112a8d70	135	UndeadTank	Undeadtank#8033	215560083566755841	DomiNATION #8 - Patreon Extinction	COMPLETE	-219952 -169202 -134216 119.71 -9.02	Patreon Monthly Dino	04/12/2020 05:48	04/12/2020 06:58	SnowballInHell	SnowballInHell	04/12/2020 06:58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Magmasaur	No	na	na	na	na	na	na	Female	-219952 -169202 -134216 119.71 -9.02	Pinkops@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67d92aef-aa44-45cd-a3a5-754e98fc5074	143	Lugwig the lost	Redtigerfang74#2778	242437477703352321	DomiNATION #5 - Ragnarok	CANCELLED	3pm - 5pm central time zone	Bug Report	04/12/2020 11:17	\N	\N	BeOurGuest	04/12/2020 11:19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	i have a ferox with the movement speed bug and i can't make the 5-7 time line because its during easter dinner	no 	no	\N	\N
dbfc6cf5-88bc-4576-b4a9-d5bd97b81bb6	151	RandomPlayer	SpankMeJosh#5511	600998084809588756	DomiNATION #5 - Ragnarok	CANCELLED	8am-4pm Mountain time zone	General Support Ticket	04/12/2020 21:19	\N	\N	Zylana	04/12/2020 21:21	Josh but Best	28 lat 31 long	Admin didn't ask to change my name to something else	Try to contact admins in discord server	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a555519f-fdd2-4949-811c-6871bac75e2c	148	atris	thranduin2217#8525	250460048738877440	DomiNATION #1 - Island	COMPLETE	9:31 pm CDT	Element from Event	04/12/2020 19:32	04/12/2020 21:13	BeOurGuest	BeOurGuest	04/12/2020 21:20	\N	\N	\N	\N	overseer event	DomiNATION #1 - Island	No	216983 228404 -13725 -175.16 4.74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a31554a9-d7a6-487e-a1f1-b7afc6c02863	149	ThreeShot	#	\N	DomiNATION #1 - Island	CANCELLED	I couldn't put my discord tag its ThreeShot#8711 12:00-10:00 PM EST	General Support Ticket	04/12/2020 20:19	\N	\N	BeOurGuest	04/12/2020 21:22	Tribe Of ThreeShot	-107615 192783 -9160 -10.37 -0.27	I just transfered from Ragnorok with my Wyn and my mantis's in a cryopod and when I got to the island the cryopods weren't in my inventory and I got dc'd for Buffer overload	I have relogged but I don't know what else to do 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
978894eb-8c35-4640-83bd-6ca2773d85f9	147	Phantom	uhternal#8666	324243286514728961	DomiNATION #5 - Ragnarok	COMPLETE	1PM-3AM EST	General Support Ticket	04/12/2020 18:24	04/12/2020 21:53	BeOurGuest	BeOurGuest	04/12/2020 22:19	Seal Team Sic	-16860 -288544 -6067 53.09 2.72	I transferred to Rag and brought a Argy and claimed an abandoned wyvern. i found my base location and was going to create my tribe on this server before i started building. When i created my tribe, i lost access to my dinos.	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
02d7d5b3-598a-409f-a826-7293b4faff35	152	Tyler	VeLoCiTy_Ru5h#0511	629076438544416768	DomiNATION #9 - Valguero	COMPLETE	eastern 1 pm to 2 am	General Support Ticket	04/12/2020 21:25	04/12/2020 21:44	BeOurGuest	BeOurGuest	04/12/2020 21:44	yotaboiz	234470 152527 -14180 153.18 9.11	Got stuck under a base while spawning in	filled out this ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8e41c9a8-c5d2-4479-af5b-6590381be6cc	145	Jaeger	Jaeger#1312	296834414376124417	DomiNATION #4 - Aberration	COMPLETE	West Coast	Element from Event	04/12/2020 15:04	04/12/2020 22:21	BeOurGuest	BeOurGuest	04/12/2020 22:26	\N	\N	\N	\N	Late Night Overseer Friday 10 April 2020	DomiNATION #4 - Aberration	No	-162162 -46656 43223 -174.41 -2.88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3daca9a7-e63e-4532-a078-820073af88fc	144	Jade	teamwolfe19#0074	561367603684179981	DomiNATION #5 - Ragnarok	COMPLETE	12PM EST - 6PM EST	Element from Event	04/12/2020 13:30	04/12/2020 22:29	BeOurGuest	BeOurGuest	04/12/2020 22:36	\N	\N	\N	\N	April 10th Island Alpha Ascension 	DomiNATION #5 - Ragnarok	Yes	465737 -353794 -14299 84.98 -15.86 pin : 2846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2d70a725-6956-4a94-85e9-5bc663229952	142	JBizzle	JBizzle#9229	288110391492345858	DomiNATION #9 - Valguero	COMPLETE	530pm -10pm est mon-fri sat & sun 8am - 10pm	Element from Event	04/12/2020 09:07	04/12/2020 22:40	BeOurGuest	BeOurGuest	04/12/2020 22:40	\N	\N	\N	\N	April 10th late night overseer	DomiNATION #9 - Valguero	Yes	vault by TP pin#1870 -393754 -269245 37824 58.48 -22.06	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4f0cdf1b-e82d-465a-8a48-704c103ff474	139	Struggler 	The Struggler#1387	277855875861970945	DomiNATION #13 - Genesis	CANCELLED	1pm - 9pm	Element from Event	04/12/2020 07:50	04/12/2020 22:41	BeOurGuest	BeOurGuest	04/12/2020 22:50	\N	\N	\N	\N	The Dino Yard Sale	DomiNATION #13 - Genesis	Yes	70.1 80.9 pin code is 2121, the vault is in the metal room On the roof. A snow owl should be next to the vault 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2d0747e7-1870-4b3e-b7e4-624134f2adca	137	IvanSeven	Ivan#2839	416695444421214228	DomiNATION #5 - Ragnarok	COMPLETE	16:00 - 22:00 UTC +3:00	Element from Event	04/12/2020 06:37	04/12/2020 22:52	BeOurGuest	BeOurGuest	04/12/2020 23:01	\N	\N	\N	\N	Late Night Boss Battle	DomiNATION #5 - Ragnarok	No	-164151 61092 13172 37.17 -13.74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a5f09488-f9e6-4b77-863f-0aeed003e406	138	bobbbawatts	bobbbawatts#5161	450008032416366594	DomiNATION #11 - Genesis	COMPLETE	6pm to 4am est	Patreon Insurance Request	04/12/2020 07:46	04/14/2020 17:22	Frank	Frank	04/14/2020 18:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/11/dino/166870374	bobbba.watts@gmail.com	april	im not entirely sure i got on and it said that it had died to a theri	\N	\N	\N	\N	\N	\N	\N	\N	\N
3170a5cb-2107-40aa-995a-2d6cae505a00	140	Chia	Chiatsu#7429	394490703549431809	DomiNATION #1 - Island	COMPLETE	4pm - 10 pm CMT	Patreon Insurance Request	04/12/2020 08:32	04/14/2020 18:01	Frank	Frank	04/15/2020 06:19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	unknown	Chiapetara@hotmail.com		I left game for a while and all my dinos were in cryo, I came back to nothing being left base dino's ect. I don't know if this qualifies for the insurance or not but I was wanting to know if I could get my Tuso back. I cant find anything using the search link provided for when they died and assume its due to them being in cryo	\N	\N	\N	\N	\N	\N	\N	\N	\N
7293bb69-94f2-48f2-9854-1d27657a6f1b	141	Chia	Chiatsu#7429	394490703549431809	DomiNATION #1 - Island	COMPLETE	4pm - 10 pm CMT	Patreon Monthly Dino	04/12/2020 08:45	04/14/2020 18:04	Frank	Frank	04/14/2020 18:36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Bloodstalker	No	na	na	na	na	na	na	Female	130867 -252107 -13280 154.19 -1.36	Chiapetara@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c372273d-0633-44c0-8f2d-60ee12b62db3	146	Kdmman2	Kdmman2#9586	273530002543345664	DomiNATION #11 - Genesis	COMPLETE	My schedule is kinda day to day rn, but I can be on almost anytime (especially after 5pm)	General Support Ticket	04/12/2020 15:32	04/14/2020 18:09	Frank	Frank	04/14/2020 18:09	Lone Wolf	-52150 -99071 405 60.31 -27.60 PIN: 1259	Was not able to attend the Ferox Exchange event, so here is my Ferox with 0 MS	It's cryoed in the box (PIN: 1259)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60ff7e8c-d1e4-4757-907c-fb2b03bdbc3c	150	CasualPlayer	CasualTadpole#5153	565668780991053844	DomiNATION #5 - Ragnarok	COMPLETE	10PM-3AM Mountain Time	General Support Ticket	04/12/2020 21:19	04/15/2020 16:22	Cowdog	Cowdog	04/15/2020 16:45	josh but best	28 31	Need a name change	Contacted an admin on discord and said i could change it back with a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ebca856f-4f23-45ba-98b4-cf6e1d2527e2	166	atris	thranduin2217#8525	250460048738877440	DomiNATION #1 - Island	COMPLETE	6-9pm cdt 	General Support Ticket	04/17/2020 17:44	04/17/2020 17:46	Zylana	Zylana	04/17/2020 17:46	jedi order	15834 199750 -14062 -55.35 -16.51	tribe of bangladesh has walled off a river just letting people know	reporting it to you now	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
289ff42c-6bc3-4b19-a524-12ae7ed87fa2	153	Dr_SZ	Dr_SZ#3334	292122093724762112	DomiNATION #5 - Ragnarok	COMPLETE	8PM - 12AM MST	General Support Ticket	04/12/2020 23:51	04/12/2020 23:51	BeOurGuest	BeOurGuest	04/12/2020 23:57	Tribe of Dr_SZ	-276096 -425047 -12760 134.84 -61.30	I just got a glider suit and took my managarmr (name: Speeeeeeed, Lvl 300) to the top of a nearby hill to test it out.  I whistled the mana on follow and glided down the hill.  When I got to the bottom I didn't see my mana.  Couldn't find it so I checked its location on the website. Went to its coords and now I see its name under the ground.	Tried to cryo but it is too far down and out of reach.  When whistled on follow it doesn't move.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94385874-6666-4d90-b4f7-4f6caedd1abb	84	Rocksteady	Rock#4231	292996545635418114	DomiNATION #5 - Ragnarok	COMPLETE	10AM-6PM EST	General Support Ticket	04/06/2020 11:46	04/06/2020 15:11	Staurophobic	Staurophobic	04/13/2020 18:18	TMNT	431999 426388 -12237 -143.48 -38.84	Griefer - Stolen Element Dust	majestic stole ~184000 element dust I had been saving out of my locked (but not pin-coded) tek storage. majestic was caught and demolished the storage boxes he set up next to my base. He took all of the argents he had there to carry it all and ran away. Heyitsalex lives on the island next to me and will back me up that majestic set up a temp base with a bunch of storage boxes and argents right next to my building. When majestic hastily demolished all of his storage boxes he left behind all of the element and i got most of it back...but he still deserve points for attempted grand theft dust. I have a screenshot of him laughing when I confronted him instead of apologizing.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d1ed1aa7-0200-4728-bd85-72278548dda1	155	Negan	Negan#8980	452775895996956672	DomiNATION #1 - Island	CANCELLED	8pm - 6am Eastern time 	Ban Appeal	04/13/2020 19:45	\N	\N	BeOurGuest	04/13/2020 21:23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	smedley73	Rodney_Smedley@yahoo.com	I do not know !!	Well someone was hacking my account (changing my password / e-mail) and after I got logged back on my account came up banned. ...Global Ban #6fc579	\N	\N	\N	\N	\N
9282fac4-c09b-4b72-a490-d2c76ad3229b	156	Reaper843	The Poopsmith#6905	139199646915362817	DomiNATION #9 - Valguero	COMPLETE	10am-3am	General Support Ticket	04/14/2020 17:29	04/14/2020 17:41	Zylana	Zylana	04/14/2020 18:04	DoDo Nation	79660 -57081 -14195 -139.51 -8.77	i was in the cave for the devourer artifact then randomly took 1k dmg and died instantly	died few times trying to retrieve my body	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cda18840-0bf8-40bb-bb20-0ef19388a662	154	Megan	Frankher#4343	636438685214048257	DomiNATION #5 - Ragnarok	COMPLETE	2pm	General Support Ticket	04/13/2020 12:07	04/13/2020 22:09	Zylana	Zylana	04/13/2020 22:09	Tribe of Gegan	?	admin dejo en mi casa un parasaur con el mensaje "contacta con el administrador"	intentar contacto con algún administrador 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c9a49ef8-1b84-4d19-ae23-b0088d43b838	133	Zhalia	Zhai#4330	300645373687365633	DomiNATION #5 - Ragnarok	COMPLETE	3 pm-12 am MST	General Support Ticket	04/11/2020 17:58	04/14/2020 16:02	Frank	Frank	04/14/2020 17:20	Super Happy Dodo Funtime	-387313 99617 -11949 32.21 6.46	I'd like to know what happened to my base. I logged in on I believe it was the 28th after 7 days off and my base had completely disappeared. All my stone structures, including things that should not have poofed like vaults were all gone. I am starting to rebuild but the question is still on my mind. Is it possible that someone had tried to get rid of one of my structures (like my old base across the water from where I am building now), but accidentally poofed all my structures? Because it seems unlikely that a glitch would have taken the entirety of my base but left every other stone base unaffected.	I've started building again, but the question about what happened is still on my mind.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2398ca08-43f3-40e1-8c83-2dbfcd39ffe3	161	Froppy	♛Queenie♛#4663	360603244956745729	DomiNATION #6 - Patreon Ragnarok	COMPLETE	9am-9pmCST	Patreon Monthly Dino	04/16/2020 07:30	04/16/2020 07:45	ShiftyG	ShiftyG	04/16/2020 08:12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	-241837 276935 -11277 29.90 -19.33 Pin Code: 1133	kdoty.1996@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
805bd158-2872-4716-bc0e-8878dc9f7065	157	Devin	Devin#8889	254254660653809664	DomiNATION #6 - Patreon Ragnarok	COMPLETE	6PM-10PM East Coast	General Support Ticket	04/14/2020 17:44	04/14/2020 18:58	Frank	Frank	04/14/2020 18:58	Peta Police	-415599 -52195 -11864 -1.01 -3.07	I made Regular dedicated storages without thinking about s+, Is there anyway to get these exchanged by chance? or should I grind them and make s+?	Made a ticket just out of curiosity if this is fine.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8ddde763-62c8-4b7e-9140-72ad87ad8084	160	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	COMPLETE	Anytime EST	Transfer Element	04/15/2020 22:30	04/16/2020 03:46	Frank	Frank	04/16/2020 04:01	\N	\N	\N	\N	\N	\N	\N	\N	800	DomiNATION #7 - Extinction	<CCC> -31492 6430 -21202 -1.84 -7.78 |  <PIN> 1463	DomiNATION #1 - Island	<CCC> 283610 165516 -9598 -1.47 -12.15 | <PIN> 1463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b763c0e8-e6ad-4409-b531-d463282165d0	158	BAMF	BAMF#2626	145514602866671617	DomiNATION #13 - Genesis	COMPLETE	5pm 11pm Central 	General Support Ticket	04/15/2020 15:19	04/15/2020 16:45	Cowdog	Cowdog	04/15/2020 17:07	Ying & Yang	214350 -20094 -25255 -177.70 -13.34	My level 327 is Giga stuck in the mesh	tried teleporting it with hnla, to far down	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c54d24fd-9eb9-4307-b402-c1fe02a8d6a2	159	hunter	yoyohunt#5004	327165524616151052	DomiNATION #6 - Patreon Ragnarok	COMPLETE	any msg me on discord	General Support Ticket	04/15/2020 20:33	04/16/2020 03:46	Frank	Frank	04/16/2020 04:40	clan before time	-228154 -47241 27801 59.91 -18.25	i have three ferox that i need to exchange i missed the exchange day and have been busy	ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1536d8dd-d637-4bfe-baf9-2ce4e1e61315	164	Eurgiga	Eurgiga#7217	392390188044779531	DomiNATION #4 - Aberration	COMPLETE	Nowish	General Support Ticket	04/17/2020 14:22	04/17/2020 15:21	ShiftyG	ShiftyG	04/17/2020 15:56	The Flat Goat Society	-38386 10530 55795 -152.29 -14.19	Juvenile reaper has vanished out of its containment box and does not appear anywhere near where the map claims it to be.	Checked all levels of the map around the website coordinates, reloaded the base to see if it's clipped into something.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e22dd42c-359d-4048-89ab-a607978a1eb6	165	Beefstew420	beefcake#6230	119275583367675904	DomiNATION #9 - Valguero	COMPLETE	east coast 	General Support Ticket	04/17/2020 16:40	04/18/2020 23:21	BeOurGuest	BeOurGuest	04/21/2020 16:49	twisted vaper	123807 -100957 -4238 21.77 -21.95	my raptor where left on breeding and where put to sleep	i will just put all my dinos in cryopods	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eaae4faf-9a1f-4106-9353-26623d8b0f61	163	BAMF	BAMF#2626	145514602866671617	DomiNATION #11 - Genesis	COMPLETE	3pm 11pm Central 	General Support Ticket	04/17/2020 12:50	04/18/2020 22:37	BeOurGuest	BeOurGuest	04/18/2020 23:41	Ying & Yang	304810 -328095 32000 -51.90 -1.81	Magma stuck in mesh	tried teleporting it with hnla, to far down. J whistle but its overweight	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8ce92440-d348-461a-ab73-45e66db48bf2	167	Ella	Ella#9526	110220977585008640	DomiNATION #9 - Valguero	COMPLETE	Anytime on Discord: Ella#9526	General Support Ticket	04/17/2020 18:09	04/18/2020 22:47	BeOurGuest	BeOurGuest	04/18/2020 23:03	Tribe of Khira - not my tribe	71109 119789 -14241 -60.09 -22.24	This person has a base with large gates on the beach in Valguero blocking the path, none of the gates are open. There are a few noob bases around and those people can't get around her base without a flyer.	This :)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4686f541-dff7-4c6b-b5c5-8482880263be	174	Jazz	Jazz#1909	495341153890205696	DomiNATION #1 - Island	COMPLETE	10am CDT	General Support Ticket	04/18/2020 18:17	04/18/2020 20:42	Zylana	Frank	04/28/2020 18:00	Ledyin	250686 194728 -14350 57.19 -17.16	Went to green oblisk to got to rag pat server and bird was sent but I was rejected. I am a new pat and would like to get on and I need my bird back name is Brix	put in ticket nothing I can do	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3738a9ff-6969-4206-8435-1cc19c524508	168	Chaotic	Chaotic#8655	397663219663110145	DomiNATION #2 - Center	COMPLETE	3PM - 10PM MST	General Support Ticket	04/17/2020 21:20	04/18/2020 23:10	BeOurGuest	BeOurGuest	04/18/2020 23:10	Yes (literally, yes)	293046 241989 -14745 -1.19 -12.07	Embarrassing story, i was traveling via raft with my dinos on it and while trying to turn a sharp corner, the raft clipped inside someones base and my theri got stuck inside.	Tried swimming him out through different pillars but he cant seem to get through. Tried jumping out aswell	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8cb0bd2a-af50-4b36-9e10-ed651b091ac9	170	Phantom	uhternal#8666	324243286514728961	DomiNATION #1 - Island	COMPLETE	1PM-3AM EST	General Support Ticket	04/18/2020 00:30	04/18/2020 23:10	BeOurGuest	BeOurGuest	04/18/2020 23:13	Seal Team Six	-277161 251190 -14307 49.21 -13.12	I am looking to build a water pen in this specific location at Red ob. I noticed it was recently cleared of the expired base that was in this spot, however there are foundations under the map. These are preventing me from placing any of my structures in this location.	I've tried to crouch and access the demo option but seem to have no luck. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39c714bb-4d1d-496c-a1d7-ce5dcf7475a4	173	Liz	ekuhar#8423	596710360891785219	DomiNATION #5 - Ragnarok	CANCELLED	EST	General Support Ticket	04/18/2020 14:53	04/18/2020 23:18	BeOurGuest	ekuhar	04/26/2020 07:55	Tres Leechy	RED OBY	Unable to transfer from Rag to the Island	Restarted the game, refreshed 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85cd4158-6b7d-44be-8a7a-834392142989	180	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #1 - Island	COMPLETE	est varies	General Support Ticket	04/19/2020 08:56	04/19/2020 09:08	Cowdog	Cowdog	04/19/2020 09:42	Ledyin	28299 245011 -13772 -88.10 -16.28	Stuctures built inside cave opening with pet blocking entry	reported to Admins	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27c48f7e-80bb-4ce2-a589-e9fe5d06f386	186	lodbubble	demonette#5553	297906070251372546	DomiNATION #9 - Valguero	CANCELLED		General Support Ticket	04/19/2020 11:46	\N	\N	demonette	04/19/2020 16:40	Aquatic Dodos	-333984 -138158 -3107 -143.47 1.96	he is block metal spawn 	not	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13b297a3-1921-4505-80fa-6e235fa3046b	172	Sodule 	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2pm-4am CST	Patreon Insurance Request	04/18/2020 14:53	04/19/2020 19:04	Frank	Frank	04/19/2020 19:44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	does not show	veiwerofsoul@hotmail.com	N/A	Took a break from game due to rl issues	\N	\N	\N	\N	\N	\N	\N	\N	\N
8771dad9-b0e1-4bb6-b42e-aa9b2b9a4171	171	Genny No-Pants	Eurgiga#7217	392390188044779531	DomiNATION #11 - Genesis	COMPLETE	Until 10am central time today I guess?	General Support Ticket	04/18/2020 05:28	04/19/2020 17:58	Frank	Frank	04/19/2020 18:18	Mother of Dragons	-166208 143949 -9542 97.50 -7.01	Have six ferox needing swapped out. I am leaving town today and won't be back before the Monday deadline.	I was dumb and forgot about these, sorry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a60a2252-e73c-488f-a1c1-d4b53a832906	175	Struggler 	The Struggler#1387	277855875861970945	DomiNATION #13 - Genesis	COMPLETE	1pm 11pm East coast	Element from Event	04/18/2020 18:19	04/19/2020 18:23	Frank	Frank	04/19/2020 18:23	\N	\N	\N	\N	Late night Rockwell boss 	DomiNATION #13 - Genesis	Yes	70.1 80.9 metal room on the stone roof pin 2427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
733f88e7-5349-468f-bd16-d0e9deb43cbe	176	Oddin	TheOddMe#7614	219811551186649089	DomiNATION #13 - Genesis	COMPLETE	12pm-3pm EST	Element from Event	04/18/2020 18:25	04/19/2020 18:24	Frank	Frank	04/19/2020 18:26	\N	\N	\N	\N	late night rockwell event fridat april 17th 2020	DomiNATION #13 - Genesis	Yes	324673 216940 -67 -90.78 -28.03  small storage box outside home -- pin 1111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bf91f4c2-3fa3-47a2-9810-4106177805f3	177	Fox/Unavailable	Fox#4585	264210854617022467	DomiNATION #6 - Patreon Ragnarok	COMPLETE	6am-6pm Cst	Element from Event	04/19/2020 06:26	04/19/2020 18:34	Frank	Frank	04/19/2020 18:34	\N	\N	\N	\N	Mega boss battle on Event server	DomiNATION #6 - Patreon Ragnarok	Yes	235807 -450541 -14206 81.53 -17.97   #1692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c31c5fb6-22ea-4cd7-af0b-e645ccbe76c0	178	Unavailable	Fox#4585	264210854617022467	DomiNATION #6 - Patreon Ragnarok	COMPLETE	6am-6pm Cst	Element from Event	04/19/2020 06:27	04/19/2020 18:34	Frank	Frank	04/19/2020 18:34	\N	\N	\N	\N	Primetime Rockwell	DomiNATION #6 - Patreon Ragnarok	Yes	235807 -450541 -14206 81.53 -17.97 #1692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a7b30474-91b8-40f4-96a1-c6c3a4739b44	181	Tarnak	Borealis#2584	617077099219648512	DomiNATION #7 - Extinction	COMPLETE	7AM ~ 11PM East Coast.	Transfer Element	04/19/2020 09:33	04/19/2020 18:35	Frank	Frank	04/19/2020 18:39	\N	\N	\N	\N	\N	\N	\N	\N	300	DomiNATION #7 - Extinction	CCC : -31519 6436 -21202 4.44 -2.05 | PIN : 1452	DomiNATION #8 - Patreon Extinction	CCC : 71406 54736 -35877 151.67 -7.05 | PIN : 1452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8508ab31-866a-479b-b58b-74ddfaa696f5	182	LADYJUICE	pressurejuice#1167	237767834988445696	DomiNATION #9 - Valguero	COMPLETE	3PM - 5PM CENTRAL TIME	Element from Event	04/19/2020 10:27	04/19/2020 18:40	BeOurGuest	Frank	04/19/2020 18:44	\N	\N	\N	\N	LATE-NIGHT ROCKWELL EVENT APRIL 17TH	DomiNATION #4 - Aberration	No	-192006 257513 -1109 -139.03 -17.86 PIN 1144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85f06c11-4a91-43dd-8a0f-5a2647b0b8c0	183	Birb 	Birb#9040	534832819579650048	DomiNATION #5 - Ragnarok	COMPLETE	MST	Element from Event	04/19/2020 10:47	04/19/2020 18:45	Frank	Frank	04/19/2020 18:49	\N	\N	\N	\N	April 17th, Late Night Rockwell Event 2020 10:30 PM CST	DomiNATION #5 - Ragnarok	No	-406338 153276 -8813 55.76 -40.56 A large Storage Box, it is unlocked and has no PIN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24c952e2-e201-4162-9d42-3da81cd2f9b9	179	Rasetsu	miseratii (Rasetsu)#3904	334510975799656458	DomiNATION #5 - Ragnarok	COMPLETE	7am - 10pm	General Support Ticket	04/19/2020 06:45	04/19/2020 07:33	Cowdog	Cowdog	04/23/2020 15:56	Catch-A-Ride	75 lat 34-35 lon or the Catch-A-Ride teleport (cannot log in for ccc)	i need a base refresh	failed to contact tribe mates and asked for admin assistance	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f7159fc9-b1f0-470b-85c7-9a6734c62610	185	Dark Thor	John Cena#1014	408668851375570944	DomiNATION #11 - Genesis	COMPLETE		Bug Report	04/19/2020 11:09	04/21/2020 16:20	Nast	Nast	04/21/2020 16:21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	the game glitched, I was riding my basilisk and I went under the mesh, I lose my basilisk and my tek gears, I took screens shots		my  full tek armor.	\N	\N
01f74812-603a-4ffc-871a-6b392a521c62	184	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	CANCELLED	1pm - 10pm East Coast. Also Online on discord 24/7 to reply quickly.	Element from Event	04/19/2020 10:53	\N	\N	Jima (Eren)	04/19/2020 13:54	\N	\N	\N	\N	I attended the Friday, April 17th late night Rockwell event 	DomiNATION #1 - Island	No	48.6 - 26.9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bdf86e79-0ad5-48a6-9d35-e3ba23f13369	162	Hurk	#	\N	DomiNATION #13 - Genesis	COMPLETE	5PM - 11PM East Coast	General Support Ticket	04/16/2020 17:06	04/19/2020 17:40	Frank	Frank	04/19/2020 17:56	Stoneage Engineering	-328322 170921 -24097 177.96 -8.69	Patreon Dino request. I'd like to request a Space whale with a saddle if possible. I'd also like my patreon mek restored if it isn't too much trouble. The CCC is at a pin locked box, pin is 1475	There is no option to choose patreon dino request in the ticket and I'm required to put something here...	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
201d9930-3433-4c74-b798-9e2bfdfad3ab	169	Kitten	#	\N	DomiNATION #4 - Aberration	COMPLETE	Mountain Time	Bug Report	04/17/2020 21:30	04/19/2020 17:57	Frank	Frank	04/19/2020 18:07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I put a lot of effort and time into getting 3 event colored reaper kings earlier today only to find out after it was too late to do anything that it is impossible to get 100% imprint on Aberration with a reaper king due to server settings.  There was no warning in any of the server info or anywhere that ive ever seen letting me know this.  Aberration is the only place you can get a reaper king i assumed that i would be able to fully imprint my babies here.  I was wondering if there was any way possible to get their Imprint lvls set to 100% as the reason i was unable to do so myself is not a gameplay failure on my part but incorrect server settings. Also now that i know this i will not make this mistake again. I only ask because these are rare and this is truly frustrating.	yes. just try to get 100% imprint on a reaper king on the server they come from.	no	\N	\N
a981c67d-6427-43b6-8b0a-0fc7f562fa1c	195	WZK	WZK#7430	688223029905588386	DomiNATION #1 - Island	CANCELLED	8AM-8PM Central on Thursday/Friday/Saturdays	Element from Event	04/19/2020 18:09	\N	\N	Frank	04/19/2020 19:00	\N	\N	\N	\N	Date: April 17th, 2020 1030PM CST Name: Late Night Rockwell Event	DomiNATION #1 - Island	Yes	120 239262 -9563 -60.17 -44.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45e4bb3d-7b0a-4262-86f3-c49729d0fd45	187	WinterTHICC	Sunlight_Blades#3056	187394120711405578	DomiNATION #1 - Island	COMPLETE	1 PM - 11 PM CST	Element from Event	04/19/2020 13:01	04/19/2020 18:50	Frank	Frank	04/19/2020 18:53	\N	\N	\N	\N	Late Night Rockwell event on the 17th	DomiNATION #1 - Island	No	164694 -255411 -13090 152.59 -45.47  PIN - 3849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4c793a24-3bcd-4a4e-8c39-91cb7d5556d3	196	Lobsterman	Lobsterman#8257	371801201798545420	DomiNATION #2 - Center	COMPLETE	9PM - 12AM CST	Element from Event	04/19/2020 18:32	04/19/2020 18:51	BeOurGuest	BeOurGuest	04/19/2020 18:53	\N	\N	\N	\N	Late Night Rockwell on 4/17	DomiNATION #2 - Center	No	-90913 208120 -10141 -35.32 -31.23 PIN: 4485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d41bce94-9cac-4ed5-87d4-facf3c6d0bc5	192	Reaper843	#	\N	DomiNATION #9 - Valguero	COMPLETE	10am-3am	General Support Ticket	04/19/2020 17:14	04/19/2020 19:00	BeOurGuest	BeOurGuest	04/19/2020 19:06	Dodo Nation	209398 -18709 -8669 -75.95 -17.93	Cave blocked off by Tek Gate	putting in this ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d7366f7b-3d4d-4caf-8165-730b9ec3cc3e	188	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	COMPLETE	1pm - 10pm EST	Element from Event	04/19/2020 13:56	04/19/2020 18:53	BeOurGuest	BeOurGuest	04/19/2020 18:58	\N	\N	\N	\N	I attended the Friday, April 17th late night Rockwell event 	DomiNATION #1 - Island	Yes	48.6 - 26.9 and PIN code is 2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
de6f532a-8406-4321-bac2-bb7bda70d44e	206	Devin	Devin#8889	254254660653809664	DomiNATION #6 - Patreon Ragnarok	COMPLETE	6PM-10PM East Coast	Patreon Monthly Dino	04/20/2020 16:58	04/21/2020 08:17	Frank	Frank	04/21/2020 08:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Phoenix	Yes	2	18	na	na	18	18	Doesn't matter	-411161 -50401 -14174 75.72 -11.01	Devi1920@Hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c3dbd3bd-939b-45a4-8b96-dcae24cd815f	193	WZK	#	\N	DomiNATION #1 - Island	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Element from Event	04/19/2020 18:08	04/19/2020 18:59	Frank	Frank	04/19/2020 18:59	\N	\N	\N	\N	Date: April 17th, 2020 1030PM CST Name: Late Night Rockwell Event	DomiNATION #1 - Island	No	120 239262 -9563 -60.17 -44.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7a9b0307-2281-4362-8ffb-45ea9596467f	194	WZK	#	\N	DomiNATION #1 - Island	CANCELLED	8AM-8PM Central on Thursday/Friday/Saturdays	Element from Event	04/19/2020 18:09	\N	\N	Frank	04/19/2020 19:00	\N	\N	\N	\N	Date: April 17th, 2020 1030PM CST Name: Late Night Rockwell Event	DomiNATION #1 - Island	No	120 239262 -9563 -60.17 -44.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9578e85a-7cf4-4703-a891-baef65602e68	200	Kolobok	Kolobok#2615	677933875590201394	DomiNATION #3 - Scorched Earth	COMPLETE	around 1900-0800 PST	Transfer Element	04/20/2020 11:21	04/21/2020 08:04	Frank	Frank	04/21/2020 09:01	\N	\N	\N	\N	\N	\N	\N	\N	6700	DomiNATION #3 - Scorched Earth	213505 26685 -2740 22.31 -32.94	DomiNATION #1 - Island	118071 272667 -11445 34.96 -22.17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33405cff-8715-4b5c-8daf-63845c61fd6a	191	Brett	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	6pm-12pm east coast	General Support Ticket	04/19/2020 16:42	04/19/2020 19:23	BeOurGuest	Zylana	04/19/2020 21:57	Try Guys	398933 -360120 7372 -98.50 3.39	Someone placed something in my base and it is prohibiting me from building	I cant really do anything.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bd496cd7-b2a3-4b75-b115-5e1fa2afcaf8	190	lodbubble	demonette#5553	297906070251372546	DomiNATION #9 - Valguero	COMPLETE		General Support Ticket	04/19/2020 16:41	04/19/2020 19:07	BeOurGuest	Zylana	04/20/2020 05:25	Aquatic Dodos	333984 -138158 -3107 -143.47 1.96	he is block metal spawn 	i has not 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0534ed33-4320-4434-9ef9-d3bf8928ea68	218	Tsukiyami/Fiora	Tsukiyami#4323	266733887592333332	DomiNATION #1 - Island	COMPLETE	12pm-6pm CST	Patreon Monthly Dino	04/21/2020 13:51	04/21/2020 16:05	Nast	Nast	04/21/2020 16:12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	X-Allosaurus	No	na	na	na	na	na	na	Female	-169393 220316 -12051 -37.43 -10.31	tsukithebat@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7fe15efb-2c84-4439-a299-f73fe112cd29	217	Tsukiyami/Fiora	Tsukiyami#4323	266733887592333332	DomiNATION #1 - Island	COMPLETE	12pm-6pm CST	Patreon Monthly Dino	04/21/2020 13:50	04/21/2020 16:04	Nast	Nast	04/21/2020 16:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	X-Allosaurus	No	na	na	na	na	na	na	Male	-169393 220316 -12051 -37.43 -10.31	tsukithebat@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ad07e4f7-d614-4d41-ae6e-07ebeb7b36a8	216	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	COMPLETE	Anytime 7 am - 11 pm EST	General Support Ticket	04/21/2020 12:51	04/21/2020 16:14	Nast	Nast	04/21/2020 16:15	WIP	269962 87027 -13870 -40.17 -4.34	Anderson had his base here that was demo-able, I went ahead and demod majority of it but at this spot he placed foundations below the terrain. I left walls to show u where they are.	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ac72c232-8fca-48e3-b332-7d1fd5d20926	215	Birb 2	Birb#9040	534832819579650048	DomiNATION #11 - Genesis	COMPLETE	MST	Transfer Element	04/21/2020 11:46	04/23/2020 03:58	Frank	Frank	04/23/2020 04:01	\N	\N	\N	\N	\N	\N	\N	\N	300	DomiNATION #5 - Ragnarok	-406330 153298 -8813 52.26 -40.89 A large storage box, unlocked no PIN	DomiNATION #11 - Genesis	 108217 -245383 -34072 -17.15 -58.19 A large storage box, unlocked no PIN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f9389b27-fc63-4c8b-8eb1-054a4cc54eaf	197	Krafty	XMAN-Unum#6590	254482409335160833	DomiNATION #6 - Patreon Ragnarok	COMPLETE	4 PM - 10 PM WEST COST PST.	Element from Event	04/19/2020 20:05	04/19/2020 21:31	BeOurGuest	BeOurGuest	04/19/2020 21:44	\N	\N	\N	\N	Rockwell Boss	DomiNATION #4 - Aberration	Yes	237030 -119262 29546 -64.97 -32.63 - Pin# 4155 (Element Dedicated Storage)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3b0e1d56-ce0a-402b-b29e-52ea0388ce98	189	Fira	#	\N	DomiNATION #1 - Island	COMPLETE	Pacific	General Support Ticket	04/19/2020 16:00	04/19/2020 18:49	BeOurGuest	Zylana	04/20/2020 05:12	Bloodmoon	74.9, 35	So earlier today I was at my base, game crashes, regular thing; I think well thats no biggie im already at home nothings going to kill me up here. I turn maybe 2 hrs later. I somehow died, at my base, and as I look over the side of my fortress I see my body bag *in a river* and go up to it and it's my naked body with all my things looted except my spyglass, gps, and meat.  I was in no way in danger of drowning when i crashed which was two hours ago, and seeing as my bag is still active I would have to have drowned like 20 min ago.  I basically think someone somehow dragged me off my base and drowned me, and took all of my things, including my chibi.	submitted this ticket, went up to the bag and was able to recover the gps and spyglass; i was wondering if my things could be restored or if theres a way to find the person who drowned me; the msg i got was just "You died!" not indicated who drowned me	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d5227907-5671-4e70-92d2-a8fe117e15d2	199	NoonE	vldkain#7061	139572289271365633	DomiNATION #9 - Valguero	COMPLETE	12am to 12 pm central	Element from Event	04/20/2020 09:26	04/20/2020 15:13	ShiftyG	ShiftyG	04/20/2020 15:54	\N	\N	\N	\N	rockwell friday 4/17/20	DomiNATION #9 - Valguero	No	96213 140112 -6210 179.17 -41.22 pin 0511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
004003f0-096f-4892-8df1-94f9bce53ab9	198	Nick	N1ckdoe#6354	365353482846208000	DomiNATION #9 - Valguero	COMPLETE	PST	Bug Report	04/20/2020 00:49	04/20/2020 05:20	Zylana	Zylana	04/20/2020 05:23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I used a cryopod and my Mana disappeared in front of me. It says the dino is in game on https://ark.spectrumdominus.com/server/9/dinos/type/IceJumper_Character_BP_C but it is no where to be found	no	Mana level 191 being shown on website https://ark.spectrumdominus.com/server/9/dinos/type/IceJumper_Character_BP_C	\N	\N
a81be8da-3433-4708-a917-4af2075cb1f0	203	lodbubble	demonette#5553	297906070251372546	DomiNATION #9 - Valguero	CANCELLED		General Support Ticket	04/20/2020 12:30	\N	\N	demonette	04/20/2020 13:05	Aquatic Dodos	-333945 -138434 -3107 -138.37 6.43	he is block metal spawn 	not	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
755da29a-1eb5-4fcb-8d4c-14e3678eebd5	204	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #1 - Island	COMPLETE	anytime	General Support Ticket	04/20/2020 14:50	04/20/2020 15:54	ShiftyG	ShiftyG	04/20/2020 16:13	Frozen Bawls	187874 -27054 -10607 -179.32 1.32	I just wanted to make ya'll aware of a altercation with the player threeshots on island server. Today they threatened me.  I have a screen shot of this, but it happened in general chat. He had said something to me and the others joined in and I was joking with the other people and he replied with ill bend your neck before I bow.  Ya'll can do whatever you want to with this information, but I take a threat towards anyone serious. I'm just going to avoid the person, but they did initiate the conversation with me today. 	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64f30d93-a16d-4b69-839f-03a8c0abb396	208	Jade	teamwolfe19#0074	561367603684179981	DomiNATION #5 - Ragnarok	COMPLETE	12PM EST - 6PM EST	Element from Event	04/20/2020 17:25	04/20/2020 17:55	Zylana	Zylana	04/20/2020 18:06	\N	\N	\N	\N	April 17th Abberation Rockwell	DomiNATION #5 - Ragnarok	Yes	465819 -353779 -14299 116.61 -16.98 pin: 2846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2467754f-5145-4dd8-a1b2-e2998b0c396e	205	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	COMPLETE	Anytime 7 AM - 11:00 PM EST	General Support Ticket	04/20/2020 15:26	04/20/2020 18:06	Zylana	Zylana	04/20/2020 18:17	WIP	254744 186424 -14140 -10.50 -24.83	There is a red rex from tribe fruity pebble on aggressive hopping yard to yard and currently swimming with the fish.	I have tried to call his name and I have submitted this ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
349b2c7b-ed5f-4e0b-8dc6-77b4eb26ba4f	209	shrapnell	Azar#1237	419228586382196736	DomiNATION #5 - Ragnarok	CANCELLED	3pm-9pm	General Support Ticket	04/20/2020 17:37	04/20/2020 17:54	Zylana	Azar	04/20/2020 17:55	ScrapKings	400178 -426965 -6770 9.52 -10.20	stuck under cc hatchery	tried to get out	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b33c5e24-2596-4101-ad91-54819a107cad	210	LordHuron	LordHuron#8332	420051842521759754	DomiNATION #5 - Ragnarok	CANCELLED	Any time 	General Support Ticket	04/20/2020 17:43	04/20/2020 17:54	Zylana	Zylana	04/20/2020 17:56	DunderMifflin 	CC	Meshed thru the ceilings at hatchery while trying to hatch my wyvern eggs	Can’t get out from under 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cc9bb5e0-5442-49fe-92ea-48c2b27c612d	207	Brett	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	398852 -363174 7083 -9.77 -75.00	General Support Ticket	04/20/2020 17:16	04/20/2020 17:55	Zylana	Zylana	04/20/2020 18:00	Try Guys	398852 -363174 7083 -9.77 -75.00	Someone placed something in my base and it is prohibiting me from building	I cant really do anything.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cd4428ed-1278-488f-a8cf-d1b838176ce1	211	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #1 - Island	COMPLETE	ANYTIME	Element from Event	04/20/2020 18:18	04/20/2020 18:26	Zylana	Zylana	04/20/2020 18:26	\N	\N	\N	\N	Rockwell event	DomiNATION #1 - Island	Yes	184186 -27723 -10605 103.48 -16.97 6970 is the pin code.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c7a59ad8-cc96-40b0-8cef-4516b48a2506	212	Phantom	uhternal#8666	324243286514728961	DomiNATION #1 - Island	CANCELLED	1PM-4AM East Coast	General Support Ticket	04/20/2020 18:31	\N	\N	Zylana	04/20/2020 18:34	Seal Team Six	-280516 177137 -10840 -161.79 -0.97	I need to transfer element that I have acquired on this server to Ragnarok #5. I am no where close to Tek on Island but have Tek on Rag #5 and am quickly running out of what I had there.	Nothing	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8a752d36-81f0-403e-a58f-8f6c5441ecca	201	cookie	ThatGuyFly#6429	529779309968228372	DomiNATION #4 - Aberration	COMPLETE	12AM - 5PM West Coast	Element from Event	04/20/2020 11:34	04/21/2020 08:16	Frank	Frank	04/21/2020 08:17	\N	\N	\N	\N	Prime Rockwell event on 4/18	DomiNATION #4 - Aberration	No	-158718 -88046 56822 47.37 -36.19; 4200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a2b97efe-e513-4e51-bc3c-bad09a1919f3	213	Phantom	uhternal#8666	324243286514728961	DomiNATION #1 - Island	COMPLETE	1PM-3AM EST	Transfer Element	04/20/2020 19:04	04/21/2020 08:53	Frank	Frank	04/21/2020 08:53	\N	\N	\N	\N	\N	\N	\N	\N	1291	DomiNATION #1 - Island	-281319 177119 -10950 -60.41 -25.06               pin= 8054	DomiNATION #5 - Ragnarok	169399 291387 -1197 -151.08 -5.89                pin= 8054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6f387a8b-6333-4a69-8a62-682cd68a7137	214	_Prime_	Primal#7299	388065003208572938	DomiNATION #5 - Ragnarok	COMPLETE	2PM-11PM East Coast	Element from Event	04/20/2020 22:04	04/21/2020 08:56	Frank	Zylana	05/03/2020 14:02	\N	\N	\N	\N	Maze event, April 4, and April 18	DomiNATION #5 - Ragnarok	No	Lat 37.4 Lon 50.6 and 1499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2aa3ab7a-32f4-4725-a182-b88592a0d714	202	ThreeShot	ThreeShot#8711	557744032621658123	DomiNATION #1 - Island	COMPLETE	12:00PM-11:00PM EST 	General Support Ticket	04/20/2020 11:55	04/21/2020 16:25	Nast	Nast	04/21/2020 16:26	That messy base	-107615 192783 -9160 -10.37 -0.27	Someone built next to metal nodes at 76.4 45.7	I've told them that they need to move they didn't care at all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d9534343-2787-4f64-8422-07d4c123f0d8	232	Carole Baskins	ManaFull#3123	321867883770675201	DomiNATION #9 - Valguero	COMPLETE	all	General Support Ticket	04/23/2020 21:02	04/23/2020 21:33	BeOurGuest	BeOurGuest	04/24/2020 08:17	tiger kings	262810 -207934 -1440 86.24 -13.57	Someone went into my base and attempted to steal eggs i had out and i had him trapped until he dropped the eggs.	Send this ticket in, trapped him in took screenshot of his name and like i stated above	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf88a7f7-48a5-41a0-9a99-5e4214795ff4	225	Froppy	♛Queenie♛#4663	360603244956745729	DomiNATION #6 - Patreon Ragnarok	COMPLETE	9am-9pmCST	Patreon Monthly Dino	04/22/2020 08:08	04/23/2020 04:17	Frank	Frank	04/23/2020 04:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Velonasaur	No	na	na	na	na	na	na	Female	-241884 276934 -11277 16.96 -10.05 Pin Code: 1133	kdoty.1996@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63faa002-6c9e-4b8a-b1a3-d8ff75689e73	222	Brett	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	anytime	General Support Ticket	04/21/2020 15:26	04/21/2020 15:27	Cowdog	Cowdog	04/21/2020 15:27	Try Guys	265618 -324574 3942 -150.76 -29.32	bag stuck in lava	tried to grapple but didnt work	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e9a846d5-feaf-4424-b77a-28984290c340	220	Brett	#	\N	DomiNATION #5 - Ragnarok	CANCELLED	anytime	General Support Ticket	04/21/2020 15:26	04/21/2020 15:27	Cowdog	Cowdog	04/21/2020 15:28	Try Guys	265618 -324574 3942 -150.76 -29.32	bag stuck in lava	tried to grapple but didnt work	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b495be43-56c0-44f1-a899-efa3a2d8ebf9	223	Brett	#	\N	DomiNATION #5 - Ragnarok	CANCELLED	anytime	General Support Ticket	04/21/2020 15:26	\N	\N	Cowdog	04/21/2020 15:28	Try Guys	265618 -324574 3942 -150.76 -29.32	bag stuck in lava	tried to grapple but didnt work	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e20ad471-5ef1-454b-a99e-3889ab212054	221	Brett	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	anytime	General Support Ticket	04/21/2020 15:26	04/21/2020 15:27	Cowdog	Cowdog	04/21/2020 15:50	Try Guys	265618 -324574 3942 -150.76 -29.32	bag stuck in lava	tried to grapple but didnt work	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c82cc1f9-1464-40ff-a985-1288a7eee50f	224	Froppy	♛Queenie♛#4663	360603244956745729	DomiNATION #6 - Patreon Ragnarok	COMPLETE	9am-9pmCST	Patreon Monthly Dino	04/22/2020 08:07	04/23/2020 04:10	Frank	Frank	04/23/2020 04:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Velonasaur	No	na	na	na	na	na	na	Male	-241884 276934 -11277 16.96 -10.05 Pin Code: 1133	kdoty.1996@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95cbb2e9-3c9c-4102-8d42-7e78a717f721	227	Birb 2	Birb#9040	534832819579650048	DomiNATION #4 - Aberration	COMPLETE	MST	General Support Ticket	04/22/2020 15:32	04/22/2020 15:43	Zylana	Zylana	04/22/2020 15:51	Tribe of Birb 2	45204 37324 -116972 112.92 -17.84	I leant my tribemate, shrapnell my rock drake [BrightFuture] and my bulbdog, so we could get drake eggs. They joined my tribe, but the drake and bulbdog did not, making them still belong to shrapnell's previous tribe. They are in the Drake Trench.	We have tried to get Shrapnell's old tribemate on, but he can't get on and unclaim the drake and dog.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7b21030e-87f8-4be4-a1a0-104a05e6af01	226	shrapnell	Azar#1237	419228586382196736	DomiNATION #5 - Ragnarok	CANCELLED	3pm-5pm	General Support Ticket	04/22/2020 12:13	\N	\N	Zylana	04/22/2020 16:11	ScrapKings	392301 -440840 -10167 -66.97 -19.08	i was glithed into the sky while tping and i died and i cant find my bodt	tried to find my body	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6772a2c8-1b24-49bf-9944-5d13094f6340	228	Zeek	Zeek#3211	344560288412205057	DomiNATION #9 - Valguero	COMPLETE	5PM-8PM EST	Transfer Element	04/22/2020 17:23	04/23/2020 04:03	Frank	Frank	04/23/2020 04:10	\N	\N	\N	\N	\N	\N	\N	\N	500	DomiNATION #9 - Valguero	184939 -160531 -5117 127.31 -5.13 Pin code is 5544	DomiNATION #6 - Patreon Ragnarok	391535 -424575 -5366 22.75 -16.86 Pin code is 5544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88b8e6cf-3d38-4710-a89f-e926fb0d39a1	229	Harbinger	Harbinger#7956	189843409437982720	DomiNATION #1 - Island	COMPLETE	1pm EST -10pm EST 	General Support Ticket	04/23/2020 10:27	04/23/2020 18:32	ShiftyG	ShiftyG	04/23/2020 18:46	Empire	-165362 24635 -12369 -128.26 -7.09	There is a Demolish allowed base and walls here I was told to put in a ticket	Submit a ticket. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1e019ca7-159e-4665-8c39-8cde52f9a717	231	Brett	#	\N	DomiNATION #5 - Ragnarok	CANCELLED	Any time	General Support Ticket	04/23/2020 20:37	\N	\N	\N	04/23/2020 20:56	Try Guys	idk	I crashed and died, and I cant find my dead body or mana	I tried looking, but cant find it	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f5b7a1fd-b821-4d75-9dc6-12098455c0f3	233	Vista	Elegant_Pink#5223	349350628377755658	DomiNATION #3 - Scorched Earth	COMPLETE	I do not have a general time, I am on and off throughout the day	General Support Ticket	04/24/2020 10:17	04/24/2020 14:07	Frank	Frank	04/24/2020 14:11	Bastion Empire	7701 -14665 -14835 -156.42 27.00	Recently found a sign that said to contact admins	I am currently contacting the staff	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71016b8e-185f-4ebc-8ecc-e0532cc2ce38	238	Bebela	Ezio#2358	553227283519897611	DomiNATION #1 - Island	CANCELLED	UTC-6.00	Bug Report	04/24/2020 19:07	\N	\N	Zylana	04/25/2020 09:51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Good Day, I die in the gas cave, and my bag things is inside a stone and i can't recover my things 	No	Yes my things, a cry whith beelzebufo, 	\N	\N
bb8ce16b-377e-4a01-8353-294eaba76970	234	humana	yaotonatiuh#1026	703312235161976974	DomiNATION #2 - Center	COMPLETE		General Support Ticket	04/24/2020 12:03	04/25/2020 09:42	Zylana	Zylana	04/25/2020 09:48	Losa vengers	163568 27919 -12819 141.81 -16.68	I left some kaikurus on mating	I was asked to contact an admin through discord	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6cc7d9d1-6932-4696-8342-d7fa3d7ce3f4	237	atris	thranduin2217#8525	250460048738877440	DomiNATION #1 - Island	COMPLETE	4pm cdt 10pm cdt	Transfer Element	04/24/2020 18:52	04/25/2020 10:16	BeOurGuest	BeOurGuest	04/25/2020 10:18	\N	\N	\N	\N	\N	\N	\N	\N	200	DomiNATION #1 - Island	217037 229252 -13955 157.73 -26.05  (pin 2217	DomiNATION #5 - Ragnarok	417737 -431358 -11292 22.37 -12.55 (2216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4b4d418f-67c0-4091-b340-9aa232d3cde3	236	MrNormis	Mr.Normis#3244	290648402683887620	DomiNATION #7 - Extinction	COMPLETE	MST	Transfer Element	04/24/2020 13:47	04/25/2020 09:51	BeOurGuest	BeOurGuest	04/25/2020 10:01	\N	\N	\N	\N	\N	\N	\N	\N	357	DomiNATION #7 - Extinction	26286 -97367 -17682 137.93 -30.45 Pin= 1339	DomiNATION #1 - Island	246325 150467 -13385 -152.65 -23.28 Pin=1339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7d417f3b-7706-47cd-91df-a4e3dca0bb0e	219	atris	#	\N	DomiNATION #1 - Island	COMPLETE	4pm cdt 9pm cdt	General Support Ticket	04/21/2020 14:25	04/21/2020 15:18	Cowdog	Zylana	04/30/2020 13:59	jedi order	222534 230257 -13781 -10.83 -16.42	i have had a metal floor auto decay out twice noe within  a week inside my base making me lose about 1000 gasoline and a couple generators. also i beleive i lost a black pearl gacha to greifing as it was killed bye a 120 carno but non of my other tames were killed in that particular spot.	iv replaced the floor once before as well as generator and gas but the electrical wire is still here and the outlet attached.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e627dcb3-ac9c-4a69-a76f-ecde0ab31d81	239	Jimmy	Water#2468	157665396919500800	DomiNATION #6 - Patreon Ragnarok	COMPLETE	11am-1am est	General Support Ticket	04/24/2020 21:26	04/24/2020 21:32	Zylana	Zylana	04/24/2020 21:32	NorthPole	cant go in game to get a cc location	cant join the server	i cant really it says to make sure the server u are joining have their mods up to date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a0f9b7a9-9ca1-4194-aa55-d1fa66fa5500	230	JCBBlueDevil	JCBBlueDevil#4290	275127176276213760	DomiNATION #9 - Valguero	CANCELLED	1300-2200 PDT	Transfer Element	04/23/2020 14:11	\N	\N	JCBBlueDevil	04/24/2020 22:27	\N	\N	\N	\N	\N	\N	\N	\N	200	DomiNATION #9 - Valguero	79760 -50356 -14313 -28.91 -11.06 PIN:1212	DomiNATION #10 - Patreon Aberration	-21755 -20634 40410 -161.23 -18.09 PIN:1212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36008163-74ea-4e22-8b14-940f7257d4b7	235	Cat	PikaChunti#7275	340278608851501057	DomiNATION #9 - Valguero	CANCELLED	4pm-1am W. US	General Support Ticket	04/24/2020 12:04	\N	\N	BeOurGuest	04/25/2020 09:50	Tribe of FatalHollow	I wont be on for a little bit but i can give you the coords later in discord :)	Hey admins, Can anyone help me with an issue. I joined the ark server maybe a week ago with a friend and he started the tribe then raged and uninstalled. is there a way to give me ownership of the tribe or something like that. i think i changed the tribe settings too late and leaving the tribe would cause everything i did on my own to be worthless.. 	I tried to change the settings on the tribe but i think it was done too late after i started the new tree platform base.. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9ecf8cad-f894-4396-bf21-3f3b67cc0139	241	Nella	SteelTalon-Nella#4566	321802434018148352	DomiNATION #5 - Ragnarok	COMPLETE	8am - 12AM CDT	General Support Ticket	04/25/2020 15:23	04/25/2020 15:31	BeOurGuest	BeOurGuest	04/25/2020 15:31	Trader Nella	-37516 -334002 15041 -128.51 -17.66	I left the server for the 12 hr reset to come back to a dead toon. All my stuff and my wyvern are in cryo on my corpse	broke a foundation to try to get to my stuff	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64db3d4d-0ae5-4c47-8989-7fe4c0b6e118	240	Little Finger	Little Finger#4826	280438900948860930	DomiNATION #9 - Valguero	CANCELLED	5PM-1AM CST	General Support Ticket	04/25/2020 13:34	\N	\N	Little Finger	04/25/2020 17:57	AMZPROS	Please reach out - no tele needed	Greetings, You all probably remember me from the old days! We recently missed our Ark login for tame resets by a day (possibly less). While understanding that we should have reached out to Admins to have our timers extended, we did not, and will own that mistake. I've played for 3+ Years on the Domi Server and have been a supporter for the entire duration even when not playing. I have had Admins holding dinos for several months until we recently joined back up. Due to being late on the timers I recently lost 2 of my Thylas that I've had for 3 years. I am not requested any reprimands for the player that claimed them, as there should be, they followed the rules just fine. I am requesting a situational exception to get these 2 creatures back out of all that were claimed. They hold a lot of value to me personally. Again, I'm not requesting anything more than my 2 creatures be returned (they've already been bred and the claimer can have the offspring, as well as the other claims) I would just like to have my 2 Thyla's back. Again I've been a patreon supporter for next to 3 years and would like this if at all possible to be taken into consideration for a amicable solution.  	I have made attempts to contact "Nick" steam name "nbchat" to find a solution for both of us, but all attempts have been dodged, sadly. I would like a reasonable solution to be found, and was hoping I could do so without an admin case. I am very much not trying to be whinging - these 2 creatures just mean a lot to me and have a lot of nostalgic and personal value. Please reach out to me via discord "Little Finger" and let me know the results of the case :) Thanks Admin team!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15371603-a5b6-4939-8864-ae517f01b384	247	Fira	PhoenixFira#5976	330899993244467221	DomiNATION #1 - Island	COMPLETE	Pacific	General Support Ticket	04/25/2020 22:08	04/25/2020 22:51	Chief Rodney	Chief Rodney	04/25/2020 22:52	Bloodmoon	74.9, 35	Issue with mating	Hey just wanted to say I'm returning to turn off the hesperonis I accidentally left on mating; I thought I had already done this previously but I must have forgotten	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6a34ab9d-d031-48ad-b282-57048bafddb3	246	Slayer	Totoinoz#1803	297559378180177921	DomiNATION #3 - Scorched Earth	CANCELLED	3pm-12pm central time	Transfer Element	04/25/2020 19:44	\N	\N	Totoinoz	04/26/2020 10:26	\N	\N	\N	\N	\N	\N	\N	\N	1000	DomiNATION #1 - Island	-207981 -3986 -8362 -53.51 -6.85 1287	DomiNATION #3 - Scorched Earth	165531 62836 -15243 12.79 -4.64 9812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69111612-f3aa-4770-a48f-e43555a01d2b	250	Slayer	Totoinoz#1803	297559378180177921	DomiNATION #1 - Island	CANCELLED	3pm-12am central time	Transfer Element	04/26/2020 11:39	\N	\N	Totoinoz	04/27/2020 19:07	\N	\N	\N	\N	\N	\N	\N	\N	2344	DomiNATION #1 - Island	-181266 193070 -14208 109.46 -4.63 3699	DomiNATION #3 - Scorched Earth	165531 62836 -15243 12.79 -4.64 9812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c75a38e8-1c7a-4388-84bc-2f1b823d4f2a	245	Emma	Emma#0569	342987464744632321	DomiNATION #9 - Valguero	COMPLETE	Eastern Anytime between 7:00 a.m. & 8:00 p.m.	Element from Event	04/25/2020 18:43	04/28/2020 03:57	Frank	Frank	04/28/2020 04:00	\N	\N	\N	\N	Apr. 25 Supporter Basil Event	DomiNATION #9 - Valguero	Yes	185316 -162039 -5195 -78.99 -22.64 PIN 5544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b65092fc-4c03-4757-bf7c-dd7252c0bfb1	248	Liz	ekuhar#8423	596710360891785219	DomiNATION #1 - Island	COMPLETE	EST	Element from Event	04/26/2020 11:07	04/28/2020 04:00	Frank	Frank	04/28/2020 04:02	\N	\N	\N	\N	Patreon Boss Battle 042520	DomiNATION #1 - Island	Yes	287478 -151754 -9271 -78.05 -16.97 PIN 0302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f7e932dc-152e-4e24-bcfa-1a2a56c660c6	249	Pluto	Brie#8193	178206183734116352	DomiNATION #1 - Island	COMPLETE	287557 -151798 -9271 -109.47 -37.93	Element from Event	04/26/2020 11:08	04/28/2020 04:04	Frank	Frank	04/28/2020 04:04	\N	\N	\N	\N	April 25th water boss event 	DomiNATION #1 - Island	Yes	287557 -151798 -9271 -109.47 -37.93 pin 0302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d8d45a6b-d4ae-459c-a2e2-99ee3e0ef8d7	243	Vivi	Vivi#4428	599093868373213224	DomiNATION #6 - Patreon Ragnarok	CANCELLED	4pm - 10pm East Coast	Element from Event	04/25/2020 18:40	04/28/2020 04:55	Frank	Frank	05/06/2020 16:01	\N	\N	\N	\N	April 25 Supporters Event	DomiNATION #6 - Patreon Ragnarok	Yes	-411116 -50302 -14174 72.89 -25.36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1f464cc2-05b2-400f-9f0d-37777ee1a648	242	Zeek	Zeek#3211	344560288412205057	DomiNATION #9 - Valguero	COMPLETE	5PM-9PM EST	Element from Event	04/25/2020 18:37	04/27/2020 15:17	ShiftyG	ShiftyG	04/27/2020 15:21	\N	\N	\N	\N	Patreon April 25th event	DomiNATION #9 - Valguero	Yes	185316 -162039 -5195 -78.99 -22.64 PIN 5544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31d1e7b3-d11f-465b-aff6-92104acd4d4e	265	too	Too#4517	338438588779986954	DomiNATION #1 - Island	COMPLETE	10pm - 6am MST	Element from Event	04/28/2020 03:58	04/28/2020 04:08	Frank	Frank	04/28/2020 04:10	\N	\N	\N	\N	april 17th late night rockwell	DomiNATION #1 - Island	No	-270691 -8322 -14184 -72.54 -21.43 vault name: trade pincode: 1229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d447036a-1881-4b2e-8ab4-73439064a199	254	Dragon_Bash	Ski_skas4#9029	687024156721807401	DomiNATION #9 - Valguero	COMPLETE	1200 to 1500 central 	Element from Event	04/27/2020 17:25	04/28/2020 04:05	Frank	Frank	04/28/2020 04:07	\N	\N	\N	\N	patreon event	DomiNATION #9 - Valguero	Yes	-204896 269750 -3437 -127.30 -24.42 pin code 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27bd79af-0b5b-4a92-8a2b-4ff7244843f5	267	lord	SkyLord#5553	297906070251372546	DomiNATION #9 - Valguero	CANCELLED	5pm-10pm cst	General Support Ticket	04/28/2020 15:33	\N	\N	SkyLord	04/30/2020 04:51	Aquatic Dodos	-336974 -168511 -4086 -162.12 -12.98	tribe named brownie bombers is still blocking over 5 metal and crystal nodes	i put in a ticket that was completed over a week ago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ced14e12-e308-4441-8671-23f01e6f197c	255	ladyjuice	pressurejuice#1167	237767834988445696	DomiNATION #9 - Valguero	COMPLETE	1000 to 1500 central time	Element from Event	04/27/2020 17:28	04/28/2020 04:07	Frank	Frank	04/28/2020 04:07	\N	\N	\N	\N	pateron event 	DomiNATION #9 - Valguero	Yes	-204993 269780 -3437 -80.02 -14.19 pin code 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eb6c1cb2-292f-49c2-8cdb-a5e262f2b4ad	244	Devin	Devin#8889	254254660653809664	DomiNATION #6 - Patreon Ragnarok	CANCELLED	6PM-10PM East Coast	Element from Event	04/25/2020 18:41	04/28/2020 04:56	Frank	Devin	04/28/2020 14:38	\N	\N	\N	\N	april 25th supporters event	DomiNATION #6 - Patreon Ragnarok	Yes	-411145 -50379 -14174 53.21 -3.24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5a1a0b2c-4578-4da2-852c-3ef934e8450f	256	Slayer	Totoinoz#1803	297559378180177921	DomiNATION #3 - Scorched Earth	COMPLETE	3pm-11am central time	Transfer Element	04/27/2020 19:09	04/28/2020 04:14	Frank	Frank	04/28/2020 04:20	\N	\N	\N	\N	\N	\N	\N	\N	2344	DomiNATION #1 - Island	-181266 193070 -14208 109.46 -4.63 3699	DomiNATION #3 - Scorched Earth	165531 62836 -15243 12.79 -4.64 9812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
930fd1dc-28c6-4a55-9f28-f74fc2cda72a	257	Phantom	cruyd#8666	324243286514728961	DomiNATION #9 - Valguero	CANCELLED	1PM-3AM EST	General Support Ticket	04/27/2020 19:53	04/28/2020 09:47	BeOurGuest	BeOurGuest	04/28/2020 09:47	Desert Storm	-333182 -165205 -3816 -98.27 -19.40	There is a base with, blocking tons of metal/crystal spawns in the cave.	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6e93d4c4-6762-4d42-b6b7-d5155215aa08	261	Teo	teo505#2415	105337993841090560	DomiNATION #8 - Patreon Extinction	COMPLETE	1600-2100 CET	Patreon Monthly Dino	04/28/2020 02:20	04/28/2020 04:32	Frank	Frank	04/28/2020 04:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Bloodstalker	No	na	na	na	na	na	na	Female	Coords: 317121 -88757 43876 -93.94 -35.36 Red metal storage box Pin:1111 Also if you would wake my dinos up please. They've been tranqed for a couple of months and are starting to starve. The issue was resolved on 19/2 with Stauro	teosin12@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c6cbef43-ca6f-427a-96c5-3ace712d0e11	260	Teo	teo505#2415	105337993841090560	DomiNATION #8 - Patreon Extinction	COMPLETE	1600-2100 CET	Patreon Monthly Dino	04/28/2020 02:11	04/28/2020 04:30	Frank	Frank	04/28/2020 04:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Bloodstalker	No	na	na	na	na	na	na	Female	582 15	teosin12@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9bd91feb-c5e6-4186-9196-0aeb5e2f67ac	264	Teo	teo505#2415	105337993841090560	DomiNATION #8 - Patreon Extinction	COMPLETE	1600-2100 CET	Patreon Monthly Dino	04/28/2020 02:53	04/28/2020 04:42	Frank	Frank	04/28/2020 04:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Astrocetus	Yes	85	87	3	na	18	36	Doesn't matter	Coords: 317121 -88757 43876 -93.94 -35.36 Red metal storage box Pin:1111	teosin12@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481fc6ea-0144-4c72-936a-6233e5f12210	263	teo	teo505#2415	105337993841090560	DomiNATION #8 - Patreon Extinction	COMPLETE	1600-2100 CET	Patreon Monthly Dino	04/28/2020 02:46	04/28/2020 04:33	Frank	Frank	04/28/2020 04:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Bloodstalker	No	na	na	na	na	na	na	Female	Coords: 317121 -88757 43876 -93.94 -35.36 Red metal storage box Pin:1111	teosin12@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d49c60cf-39fa-4ca9-9e2c-ea51d457c0ce	259	Teo	teo505#2415	105337993841090560	DomiNATION #8 - Patreon Extinction	COMPLETE	1600-2100 CET	Patreon Monthly Dino	04/28/2020 02:10	04/28/2020 04:28	Frank	Frank	04/28/2020 04:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Bloodstalker	No	na	na	na	na	na	na	Male	Coords: 317121 -88757 43876 -93.94 -35.36 Red metal storage box Pin:1111	teosin12@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
759f6b75-303a-47de-ba4e-d717d7cbc26d	262	Teo	teo505#2415	105337993841090560	DomiNATION #8 - Patreon Extinction	COMPLETE	1600-2100 CET	Patreon Monthly Dino	04/28/2020 02:33	04/28/2020 04:42	Frank	Frank	04/28/2020 04:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Bloodstalker	No	na	na	na	na	na	na	Female	582 15	teosin12@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7b29c327-8fbe-4fbb-8332-325e734a835a	71	Struggler 	Bass & Gizmo#1387	277855875861970945	DomiNATION #11 - Genesis	CANCELLED	1pm - 10pm east coast 	Bug Report	04/05/2020 13:40	04/06/2020 02:40	Zylana	Frank	04/28/2020 10:53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I left a 267 featherlight in a cryopod and a 200 megatherium in a cryopod with 25 days left on it. The two Dino died and they weeent in the pods more that 20 mins. 	No	I lost the both dinos places in the pods 	\N	\N
6840ed99-7712-4fe9-8f8b-356a38454d77	266	Eurgiga	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	Unimportant for this request	General Support Ticket	04/28/2020 08:54	04/28/2020 18:18	Cowdog	Cowdog	04/28/2020 18:39	The Flat Ark Society	272789 -363384 14561 121.75 -17.80	Orphaned dropped wyvern egg by Ledyin	Sent in a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
916033eb-1e64-4106-b6a5-e844e88be974	258	atris	thranduin2217#8525	250460048738877440	DomiNATION #1 - Island	COMPLETE	4pm cdt 10pm cdt 	Bug Report	04/28/2020 01:03	04/30/2020 13:12	Zylana	Zylana	04/30/2020 13:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ok my stuff is auto decaying and i log in every day.	yea i replace the stuff down and it will auto decay	i lost two generators and 1000 gasoline. i have screen shots of my latest one i lost some pillars filling a gap in my fence.\r\n	\N	\N
42b6496d-e388-4747-820c-33b12c9e30d9	304	Phantom	cruyd#8666	324243286514728961	DomiNATION #5 - Ragnarok	COMPLETE	1PM-3AM EST	Element from Event	05/03/2020 20:09	05/05/2020 04:51	Frank	Frank	05/05/2020 04:51	\N	\N	\N	\N	May 1st Boss Battle	DomiNATION #5 - Ragnarok	No	169466 291432 -1197 -150.16 -8.00                     8054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99aa7fc5-ed26-43a3-bbec-d9b4e2a6b749	302	Jaeger	Jaeger#1312	296834414376124417	DomiNATION #4 - Aberration	COMPLETE	West Coast	Element from Event	05/03/2020 19:44	05/05/2020 05:11	Frank	Frank	05/05/2020 05:13	\N	\N	\N	\N	Late Night Boss Fight 1 May 2020	DomiNATION #4 - Aberration	No	-162160 -44590 44045 116.73 -3.91   3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4f7b68ea-cc93-4f87-888f-7c892e82acf9	303	Mannizzle	mannizzle#6781	129845754922532864	DomiNATION #4 - Aberration	COMPLETE	7-10pm CST	Element from Event	05/03/2020 19:45	05/05/2020 05:14	Frank	Frank	05/05/2020 05:14	\N	\N	\N	\N	Late Night Boss Event 5/1 	DomiNATION #4 - Aberration	No	-162160 -44590 44045 116.73 -3.91  PIN:3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
716d9460-cebd-404e-8271-a9a344869abf	253	Dr_SZ	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	8PM - 12AM MST	General Support Ticket	04/27/2020 15:34	04/28/2020 04:11	Frank	Cowdog	04/28/2020 18:11	Tribe of Dr_SZ	CCC	Left snow owls on enable breeding, am supposed to contact admins to get them back.  Sorry about that, I know the rules I could'of sworn I had turned mating off.  I'll be more careful about that.	Filled out a ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2344fd6e-8bef-4413-aa9d-c328e075f0d3	269	kris	#	\N	DomiNATION #6 - Patreon Ragnarok	CANCELLED	any	General Support Ticket	04/29/2020 10:19	\N	\N	Zaff	04/29/2020 14:35	Sgtdeitz	F4		Conan thrall request 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22e29b2d-35b4-46d0-9262-7a6ef9015aeb	271	Sodule	#	\N	DomiNATION #6 - Patreon Ragnarok	CANCELLED	2PM-6AM CST	General Support Ticket	04/29/2020 14:34	\N	\N	Zaff	04/29/2020 14:37	TORN	191556 -51030 32316 128.48 -0.52	Pat dino request	I sat patiently	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
354455d8-5eb0-4ef3-8d65-271495bde55a	277	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2PM-6AM CST	Patreon Monthly Dino	04/29/2020 14:49	04/29/2020 15:21	Cowdog	Cowdog	04/29/2020 16:28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Mosasaurus	No	na	na	na	na	na	na	Doesn't matter	191556 -51030 32316 128.48 -0.52 & 4591	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c85a62d1-2f7b-47a2-8b6a-69b1155bc52d	272	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2PM-6AM CST	Patreon Monthly Dino	04/29/2020 14:39	04/29/2020 15:20	Cowdog	Cowdog	04/29/2020 16:43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Tusoteuthis	No	na	na	na	na	na	na	Doesn't matter	191556 -51030 32316 128.48 -0.52 & 4591	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e794470d-5287-4268-8f93-ff436323f547	276	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2PM-6AM CST	Patreon Monthly Dino	04/29/2020 14:48	04/29/2020 15:21	Cowdog	Cowdog	04/29/2020 15:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Ferox	No	na	na	na	na	na	na	Doesn't matter	191556 -51030 32316 128.48 -0.52 & 4591	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2ac5587e-9a94-4c9a-9c06-570660788758	273	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2PM-6AM CST	Patreon Monthly Dino	04/29/2020 14:44	04/29/2020 15:21	Cowdog	Cowdog	04/29/2020 16:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Tusoteuthis	No	na	na	na	na	na	na	Doesn't matter	191556 -51030 32316 128.48 -0.52 & 4591	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e7e0fb8b-53d8-4af1-b254-ffa2efd4c6a5	274	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2PM-6AM CST	Patreon Monthly Dino	04/29/2020 14:45	04/29/2020 15:21	Cowdog	Cowdog	04/29/2020 16:27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Tek Rex	No	na	na	na	na	na	na	Male	191556 -51030 32316 128.48 -0.52 & 4591	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
aa56e91f-46d9-4958-a344-ff6ba20036bb	275	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2PM-6AM CST	Patreon Monthly Dino	04/29/2020 14:46	04/29/2020 15:21	Cowdog	Cowdog	04/29/2020 16:28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Tek Rex	No	na	na	na	na	na	na	Female	191556 -51030 32316 128.48 -0.52 & 4591	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
04a31cf7-5eee-438e-937f-83cea06b7c59	278	Marryn	Nyrram#5942	203853420531154944	DomiNATION #7 - Extinction	CANCELLED	I have several characters on the cluster, all named Marryn, they seem to have vanished somehow.  My main was lvl 135.  If they can't be retrieved, I would like to at least get a new level 1 into my tribe on #7 to recover my stuff :)	General Support Ticket	04/29/2020 17:07	04/29/2020 17:09	Frank	Frank	04/29/2020 17:18	Marryn's Lodge	unknown, but is at the "colluseum" in the eastern part of sanctuary on #7	Missing characters	Nothing, they just aren't in the list, unfortunately.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2f1d0d8b-eced-4ab1-bbba-814bbdde7ed2	279	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	COMPLETE	anytime	Transfer Element	04/29/2020 19:09	04/29/2020 19:32	ShiftyG	ShiftyG	04/29/2020 19:40	\N	\N	\N	\N	\N	\N	\N	\N	200	DomiNATION #6 - Patreon Ragnarok	124617 421276 -10066 -123.09 -5.57 pin code is 6970	DomiNATION #6 - Patreon Ragnarok	i just put down rag, but this is going to the event map for crafting the pin code will be 6970  60300 17314 -12982 -4.30 -18.92   also this will be a vault owned by  the CC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
439522e3-3112-49f2-a21a-b62351233a1e	283	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #5 - Ragnarok	COMPLETE	4pm-10pm central weekdays 7am-6pm weekends	General Support Ticket	04/30/2020 15:24	05/01/2020 11:35	ShiftyG	ShiftyG	05/01/2020 11:53	Woodbutcherz	-338205 -449904 -12275 -61.61 19.04	I have read the rules and would like sign and parasaur removed. TY 	I have read the rules and understand them.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cb9e25f5-31a8-4d21-a9c3-39c7b509af64	282	ThreeShot	ThreeShot#8711	557744032621658123	DomiNATION #1 - Island	COMPLETE	12:00PM-11:00PM EST 	General Support Ticket	04/30/2020 09:32	04/30/2020 13:10	Zylana	Zylana	04/30/2020 13:24	TMB	5468 -92835 -1539 153.11 -8.95	Fruity Pebbles claimed all the dinos to a base but just left the dinos at the base and didn't take any of them back to base	Try to contact him about it	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bf802ec4-9591-40ef-b6d5-aab9bd612b8d	281	lodbubble	SkyLord#5553	297906070251372546	DomiNATION #9 - Valguero	COMPLETE	5pm-10pm cst	General Support Ticket	04/30/2020 04:56	04/30/2020 13:11	Zylana	Zylana	04/30/2020 13:32	Aquatic Dodos	-336974 -168511 -4086 -162.12 -12.98	tribe named brownie bombers is still blocking over 5 metal and crystal nodes	i put in a ticket that was completed over a week ago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2cb08ef5-c36f-4db1-b6fc-eb295c461419	270	MrNormis	Mr.Normis#3244	290648402683887620	DomiNATION #7 - Extinction	CANCELLED	MST	Transfer Element	04/29/2020 13:52	04/30/2020 17:44	\N	BeOurGuest	04/30/2020 20:14	\N	\N	\N	\N	\N	\N	\N	\N	1007	DomiNATION #7 - Extinction	26303 -97435 -17682 140.44 -14.33 Pin=1339	DomiNATION #1 - Island	246325 150467 -13385 -152.65 -23.28 Pin=1339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79360549-8075-4ff9-a9c5-44d3dc3f3664	268	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	COMPLETE	7 am - 12 am est	Transfer Element	04/28/2020 19:35	04/30/2020 18:04	BeOurGuest	BeOurGuest	04/30/2020 18:08	\N	\N	\N	\N	\N	\N	\N	\N	300	DomiNATION #1 - Island	283683 165595 -9598 13.31 -25.83 | PIN: 1462	DomiNATION #13 - Genesis	89092 -223626 210 17.85 -23.10 | PIN: 1462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b6f80726-41ad-4b25-8b77-cf226a7323f3	280	Trapeasy	TrapezeMe#6952	164888495742124032	DomiNATION #1 - Island	COMPLETE	CST	General Support Ticket	04/29/2020 20:05	05/02/2020 06:51	Zylana	Zylana	05/02/2020 07:09	It's a Trap!	290412 -25663 -13703 -39.61 -27.31	looking to claim 2 patreon dinos	filled out this ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
206b9430-1d51-412a-9767-3a25a2cd3874	307	ladyjuice	pressurejuice#1167	237767834988445696	DomiNATION #9 - Valguero	COMPLETE	1000 to 1500 central time	Element from Event	05/04/2020 08:24	05/05/2020 05:18	Frank	Frank	05/05/2020 05:18	\N	\N	\N	\N	May 2nd, 2020 7PM CST Name: Primetime Boss Battle	DomiNATION #9 - Valguero	Yes	-204899 269797 -3437 123.79 -13.91 PINCODE 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7ba123d8-9a5c-4d38-8e55-8fa2319f9cc9	305	Jazz	Jazz#1909	495341153890205696	DomiNATION #6 - Patreon Ragnarok	COMPLETE	CST	Patreon Monthly Dino	05/04/2020 06:23	05/06/2020 14:07	Frank	Frank	05/06/2020 14:19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Quetzacoatlus	No	na	na	na	na	na	na	Female	-349091 -427322 -11777 -83.58 -48.25 pin code 1214	gulden@nsuok.edu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4d05405d-e16a-48d2-a563-c5494af5bedc	251	Luna	Luna- lunathea8#2114	209496546490843137	DomiNATION #9 - Valguero	COMPLETE	Can contact me Pacific Time.  Pretty much whenever. 	General Support Ticket	04/26/2020 15:12	05/01/2020 14:47	ShiftyG	ShiftyG	05/01/2020 15:17	Love Puppies	18  78	I had requests on game for argy and thyla.  I have been generous and give freely, never charging.  I have never had issue with anyone before. Three people in base:  Ilta Fluff, Cat Fluff and Omar?  I think tribe Dominitze or something close? I had a 185 fire egg, believed event and when I turned to give the free egg he requested..stole the egg. AFTER this I was told he has stolen before from others.  I want him kicked, and if any way to go back and see exactly who did take egg..all think it's Omar.  They think he ate it when caught immediately by me.  Any way we can recoup that egg?  took me forever :(  	locked doors, all knocked out to show what was on body..kept engrams.  Omar said nothing, took off quickly when doors unlocked.  Hunter and Lupe also from Damazia were outside.  Was right before daily shut down!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d2a8ecae-1988-46a0-9887-a9f525ac46bc	288	Cgamer	Cgamer#3790	315588246253862913	DomiNATION #1 - Island	COMPLETE	? 	General Support Ticket	05/02/2020 12:51	05/02/2020 12:54	BeOurGuest	BeOurGuest	05/02/2020 12:54	Dino Tamers 	i'm at the market right now 	i joined Hiar cut saterday ta the market and now all my things or not mine if an admin could get me back into my tribe i would be really happy 	there is nothing i can do to fix it 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4bc58a7a-a165-4dfa-9a56-a212894b244d	285	Ragefast	Ragefast#3548	107341492749680640	DomiNATION #13 - Genesis	COMPLETE	5PM - 11PM Central	General Support Ticket	05/01/2020 16:11	05/01/2020 18:11	Zylana	Zylana	05/01/2020 18:34	Tribe of Ragefast1	324093 267395 768 119.63 -3.25	need to have old base destroyed	Attempted to contact admins in game.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3a74a181-0cfb-48bb-97a7-01286d87a11b	286	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #5 - Ragnarok	CANCELLED	3pm-11pm central weekdays 7am-10pm weekends	Element from Event	05/01/2020 22:12	\N	\N	Zylana	05/01/2020 22:22	\N	\N	\N	\N	May 1st	DomiNATION #5 - Ragnarok	No	-335523 -448783 -12274 -91.20 -10.06       pin# 1791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7584079d-46d0-45b1-9992-d3dba80b39e6	284	Ragefast	Ragefast#3548	107341492749680640	DomiNATION #13 - Genesis	CANCELLED	5PM - 11PM Central	Patreon Monthly Dino	05/01/2020 15:54	\N	\N	Zylana	05/02/2020 06:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	324895 266494 852 47.38 4.80	rages.boost@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
943da927-0b4a-4434-9ca6-6176225d1247	252	WZK	WZK#7430	688223029905588386	DomiNATION #1 - Island	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Bug Report	04/26/2020 19:34	05/02/2020 07:09	Zylana	Zylana	05/02/2020 07:09	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Rollback/Restart on Island Server. All items, including cryoed Magmasaur got deleted from character upon relogging after crash. Happened 3 days ago on April 23rd for me. Happened today April 26th to Totoinoz and MrUknownFA on SE. NOT laying on a bedroll right before a crash (because it's impossible to know) may be the culprit.	Happened to Totoinoz and MrUknownFA on the SE server also. Same exact scenario.	Magmasaur lvl 158 "Updating Ark,BRB" was the name of it. Website showed it died in my base where I was standing during the crash. Ascedant Ghillie Suit on but not even worried about that stuff just wanted to let yall know this is happening to some people.	\N	\N
083109b3-691d-4577-8c90-a43dd6867162	290	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	CANCELLED	1pm - 10pm EST	Element from Event	05/02/2020 19:17	\N	\N	Jima (Eren)	05/02/2020 19:18	\N	\N	\N	\N	I attended the Friday, May 1st late night event 	DomiNATION #1 - Island	Yes	48.6 - 26.9 and PIN code is 2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140d6bd1-6a06-4f90-9e27-39ef831ee9f2	294	Talaure	Talaure#8560	692186228346454036	DomiNATION #1 - Island	CANCELLED	1600-2200 Eastern time	Element from Event	05/03/2020 11:38	\N	\N	Talaure	05/03/2020 11:39	\N	\N	\N	\N	Friday 5/1/20 23:30 Eastern time	DomiNATION #1 - Island	No	292612 266914 -12753 -98.96 -11.17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b5c20a72-799e-4947-abc6-a9729c94c29e	292	Wolf Fang	Wolf Fang#8210	107989787767504896	DomiNATION #9 - Valguero	COMPLETE	9AM-12PM, 2PM-8PM Central	General Support Ticket	05/03/2020 06:54	05/03/2020 08:02	Frank	Frank	05/03/2020 08:12	Rip and Tear	21529 183121 -14268 -64.41 -9.16	Last week, a base on val was given to our tribe and after visiting it today to grab some items, Several metal nodes were found next to the main building.. Was hoping for an admin to check for a rule violation before our tribe was penalized for it. Base will be quickly demolished if rules are being violated.	Base has been emptied of important items in case demo is necessary	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
186038fa-62f7-41fd-9c30-f68025363702	293	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #1 - Island	COMPLETE	EST USA Varies	Transfer Element	05/03/2020 09:06	05/03/2020 10:23	Zylana	Zylana	05/03/2020 10:47	\N	\N	\N	\N	\N	\N	\N	\N	800	DomiNATION #1 - Island	252523 189483 -14246 -178.81 -17.87 PIN:1206	DomiNATION #6 - Patreon Ragnarok	299103 -403659 3414 15.57 -16.13 PIN:1206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e4a66225-f51d-44b3-a328-0a00fce9b725	296	Talaure	Talaure#8560	692186228346454036	DomiNATION #1 - Island	COMPLETE	1600-2200 Eastern time	Element from Event	05/03/2020 11:41	05/03/2020 11:46	Zylana	Zylana	05/03/2020 12:10	\N	\N	\N	\N	Friday 5/1/20 23:30 Eastern time	DomiNATION #1 - Island	No	292612 266914 -12753 -98.96 -11.17 Pin 1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e4fb7349-e06f-49a2-9a89-092262b1fb1c	295	Reapxrs	Reapxrs#4141	419291415365943306	DomiNATION #9 - Valguero	COMPLETE	2pm - 2am East Coast	Transfer Element	05/03/2020 11:39	05/03/2020 11:46	Zylana	Zylana	05/03/2020 11:59	\N	\N	\N	\N	\N	\N	\N	\N	200	DomiNATION #9 - Valguero	-66400 114932 -1570 -83.28 -22.29 0909	DomiNATION #1 - Island	25068 169589 -12210 -8.06 -24.70 2525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0a007a72-4b02-4ef1-865d-bc5174ba4ba9	287	Kolobok	Kolobok#2615	677933875590201394	DomiNATION #1 - Island	COMPLETE	around 1900-0800 PST	Transfer Element	05/02/2020 10:07	05/03/2020 11:46	Zylana	Zylana	05/03/2020 11:59	\N	\N	\N	\N	\N	\N	\N	\N	3200	DomiNATION #9 - Valguero	215054 -29596 -6496 170.21 -38.32	DomiNATION #1 - Island	118111 272673 -11445 29.63 -24.56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2c73a5cb-b7d3-4072-bbcb-95bea8d49c92	291	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	COMPLETE	1pm - 10pm EST	Element from Event	05/02/2020 19:19	05/03/2020 11:46	Zylana	Zylana	05/03/2020 12:05	\N	\N	\N	\N	I attended the Friday, May 1st late night event 	DomiNATION #1 - Island	Yes	-184358 -10877 -3340 172.16 -23.12 and 2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7c581783-73dc-498f-b8ad-a56043135a84	297	He	Kirrub#4219	131204221587554305	DomiNATION #5 - Ragnarok	COMPLETE	12PM-12AM Midwest	Element from Event	05/03/2020 12:14	05/03/2020 13:52	Zylana	Zylana	05/03/2020 13:59	\N	\N	\N	\N	Late night boss battle	DomiNATION #5 - Ragnarok	No	-371376 -354573 6600 125.45 -6.33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b5b92e4d-8978-45e3-a649-154dff974209	298	Poni	DreEl#5238	330546780758343680	DomiNATION #1 - Island	COMPLETE	 4pm to 2am eastern	Element from Event	05/03/2020 14:10	05/03/2020 14:20	Zylana	Zylana	05/03/2020 14:24	\N	\N	\N	\N	May 1st late night boss battle	DomiNATION #1 - Island	Yes	256882 246599 -14018 -111.24 -43.60  pin 4321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f3094207-cd75-404b-8d7e-022c57480f03	289	Vinar	FForgotten#0867	267400631612997643	DomiNATION #5 - Ragnarok	CANCELLED	6PM CST. 	General Support Ticket	05/02/2020 17:52	05/03/2020 11:05	Zylana	Zylana	05/14/2020 15:40	WeAreTribe 	-279301 -300662 12483 -168.76 -15.51	I was told to Discuss with Admin due to Wandering penguins.	Read the Rules. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a5a1b90a-000f-4537-a006-16ba92517140	311	Jazz	Jazz#1909	495341153890205696	DomiNATION #6 - Patreon Ragnarok	CANCELLED	CST	General Support Ticket	05/04/2020 13:42	\N	\N	Jazz	05/04/2020 14:21	Ledyin	117168 422484 -13638 24.85 -17.29	I glitched into a locked base and cannot get out	tried to find a way out, logged and relogged	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9c4b8a35-e7bb-4508-a475-f575d33defba	313	leGit	leGit510#6864	219683841143603200	DomiNATION #9 - Valguero	CANCELLED	Now-12Am	General Support Ticket	05/04/2020 14:27	\N	\N	leGit510	05/04/2020 14:28	Velocity	263903 386507 30191 -43.30 -18.72	Person from Tribe Exclusive, went to my base and imprinted one of my baby owl.  Said it was an accident in chat history and left it still claimed in my hatchery.	owl is stuck in my hatchery.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7315a887-c914-4020-bc8f-8a6d44ce8021	319	Kittie	#	\N	DomiNATION #11 - Genesis	COMPLETE	Mountain Time	General Support Ticket	05/04/2020 22:03	05/05/2020 04:56	Frank	Frank	05/05/2020 04:59	Meow3	108611 -272043 406 108.87 -12.98	I participated in the event last firday night. We killed the dragon in that event yet for some reason it did not unlock the Tek dedicated storage engram for me. Is there any way this could be unlocked for my toon? any help with this issue would be greatly appreciated.	Cant do anything.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf25b8c2-c463-41bf-93d9-68eabf738ce6	315	Nasuli	Nasuli#1271	160230702758100992	DomiNATION #13 - Genesis	COMPLETE	10am - 2am akst	General Support Ticket	05/04/2020 20:38	05/04/2020 20:40	BeOurGuest	BeOurGuest	05/04/2020 20:40	The Collectorate	-57978 -66862 24084 136.68 -26.97	Stuck in crack	jumped, called tame, asked another player for assistance	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7a94189d-9374-45e6-be5c-758ef8e19248	317	Ragefast	Ragefast#3548	107341492749680640	DomiNATION #13 - Genesis	CANCELLED	5PM - 1am Central	General Support Ticket	05/04/2020 21:00	\N	\N	Ragefast	05/04/2020 21:04	Tribe of Ragefast1	-26300 -236463 145 -24.83 -4.14	mana is bugged and cannot be retrieved	tried cryoing, whistling and riding. Currently stuck in water.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a08421f1-476a-410e-a1e2-78ea5affd2bb	300	Vinar	FForgotten#0867	267400631612997643	DomiNATION #13 - Genesis	COMPLETE	6PM CST. 	General Support Ticket	05/03/2020 16:08	05/04/2020 21:42	BeOurGuest	BeOurGuest	05/04/2020 21:42	Tribe of Ragefast	318779 267669 991 -120.95 -15.70	Unable to access and destroy old base items. Patreon stuff.	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8a61c6c0-8201-4f21-a489-3bf0261cb3f5	316	Nasuli	Nasuli#1271	160230702758100992	DomiNATION #13 - Genesis	CANCELLED	10am - 2am akst	General Support Ticket	05/04/2020 20:54	\N	\N	Nasuli	05/04/2020 22:27	The Collectorate	-57978 -66862 24084 136.68 -26.97	Stuck in crack	CRIED	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22e968d9-8809-44a6-ae67-74632218032c	312	leGit	#	\N	DomiNATION #9 - Valguero	COMPLETE	Now-12Am	General Support Ticket	05/04/2020 14:24	05/05/2020 04:24	Frank	Frank	05/05/2020 04:34	Velocity	263903 386507 30191 -43.30 -18.72	Person from Tribe Exclusive, went to my base and imprinted one of my baby owls	owl is stuck in my hatchery.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97ee0fd1-b9dd-413c-8577-e7d86ba3fbd8	320	He	Kirrub#4219	131204221587554305	DomiNATION #5 - Ragnarok	COMPLETE	12PM-12AM Midwest	General Support Ticket	05/04/2020 23:27	05/05/2020 04:42	Frank	Frank	05/05/2020 04:54	A-team	-371459 -354583 6685 6.56 -15.17	When I recieved my element I was not at my base and the admin put it in a box in my base, the box is making it so I cant edit my base. Could someone come remove it possibly? Thanks!	N/a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e65d2e8a-c10d-4f68-b660-2890a0644f70	301	Liz	terrificfight#8423	596710360891785219	DomiNATION #1 - Island	COMPLETE	4:30-8:00 p EST	Transfer Element	05/03/2020 16:39	05/05/2020 05:02	Frank	Frank	05/05/2020 05:09	\N	\N	\N	\N	\N	\N	\N	\N	1528	DomiNATION #1 - Island	287514 -151823 -9271 -118.52 -22.76 PIN 0302	DomiNATION #6 - Patreon Ragnarok	-279465 398855 -14260 97.40 -11.60 PIN 0302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8a580f44-4572-4360-804e-7b8c67d001b5	306	Dragon_Bash	Ski_skas4#9029	687024156721807401	DomiNATION #9 - Valguero	COMPLETE	1200 to 1500 central 	Element from Event	05/04/2020 08:17	05/05/2020 05:16	Frank	Frank	05/05/2020 05:17	\N	\N	\N	\N	 May 2nd, 2020 7PM CST Name: Primetime Boss Battle	DomiNATION #9 - Valguero	Yes	-204928 269827 -3437 -102.15 -16.61 pincode 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2e05cd36-7be4-4a8e-9da5-652dde50cc29	310	Sid	Sid#1297	189543984090054656	DomiNATION #1 - Island	COMPLETE	11AM - 11PM CST	Transfer Element	05/04/2020 13:05	05/05/2020 05:20	Frank	Frank	05/05/2020 05:24	\N	\N	\N	\N	\N	\N	\N	\N	646	DomiNATION #7 - Extinction	-31499 5902 -21202 -1.38 -22.25	DomiNATION #1 - Island	25176 170422 -12210 -9.23 -24.65 & 1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5d72a3e2-9763-4c17-a4c7-c6f06f044503	314	Tarnak	Borealis#2584	617077099219648512	DomiNATION #7 - Extinction	COMPLETE	7 am - 12 am est	Transfer Element	05/04/2020 19:56	05/05/2020 05:27	Frank	Frank	05/05/2020 05:29	\N	\N	\N	\N	\N	\N	\N	\N	800	DomiNATION #7 - Extinction	-31561 6471 -21202 -12.60 13.04 - - PIN 1470	DomiNATION #8 - Patreon Extinction	73900 56349 -35877 161.59 -11.12 - - PIN 1470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bb235815-d999-4d33-8495-6cdefc44bab6	321	Nasuli	Nasuli#1271	160230702758100992	DomiNATION #13 - Genesis	COMPLETE	10am - 2am akst	Element from Event	05/05/2020 00:03	05/05/2020 06:16	Frank	Frank	05/05/2020 07:11	\N	\N	\N	\N	5/1 Late Night Boss Battle	DomiNATION #13 - Genesis	No	-43851 -58219 25271 -45.92 -50.75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7ed7d26e-1fbd-480c-b15c-4aa074e86c7c	322	Jazz	Jazz#1909	495341153890205696	DomiNATION #6 - Patreon Ragnarok	COMPLETE	cst	General Support Ticket	05/05/2020 05:37	05/05/2020 05:58	Frank	Frank	05/05/2020 06:16	Hogan's Heros	server	After the server crashed last night it removed me from my tribe and I cannot get into anything on the server	Put in this ticket 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3b37f58c-b75a-47af-97e1-15036c235a44	323	Fatman101	Fatman101#3792	439974141072769058	DomiNATION #5 - Ragnarok	CANCELLED	9:30PM-10:45EST 	Patreon Insurance Request	05/05/2020 07:34	\N	\N	Fatman101	05/05/2020 07:34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/9/dino/181447431	anthony@nouturn.com	April	It was claimed by Cat from the Fluff tribe on #5 and given away to a person who hasn't played in days. 	\N	\N	\N	\N	\N	\N	\N	\N	\N
690c6455-ecd2-4145-80b0-4431d0167629	318	Reapxrs	Reapxrs#4141	419291415365943306	DomiNATION #9 - Valguero	COMPLETE	2pm - 2am East Coast	Transfer Element	05/04/2020 21:14	05/05/2020 05:29	Frank	Frank	05/05/2020 12:58	\N	\N	\N	\N	\N	\N	\N	\N	1000	DomiNATION #9 - Valguero	102782 131310 -14213 68.07 -44.86 0909	DomiNATION #7 - Extinction	-19862 -4855 -17291 78.16 -40.01 0909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f2d48a1e-afeb-41ca-8e0a-c20bac6733d9	325	Joe Exotic	lathrop76#4777	562363727349809152	DomiNATION #13 - Genesis	COMPLETE	CST	General Support Ticket	05/05/2020 13:58	05/06/2020 13:49	Frank	Zylana	05/06/2020 13:58	Joe Exotic	118001 51746 215 -164.24 -10.82	Died in Lunar and quetz plus body/bag are gone. No quetz death showing in tribe log	Flown around whole map for a couple hours and cannot find anything	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58af5528-116e-48d8-8541-ccc36687e60e	309	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	11:30am-2pm CST	Patreon Monthly Dino	05/04/2020 10:21	05/06/2020 14:20	Frank	Frank	05/06/2020 14:41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Giganotosaurus	No	na	na	na	na	na	na	Female	-305087 317912 -19919 -38.23 1.24      2302	Coolquill38@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27a2eed4-1778-491e-b2a7-052d24d722d8	342	xRevolveR	xRevolveR#2176	228323212876840961	DomiNATION #13 - Genesis	CANCELLED	1PM - 12AM East Coast	Patreon Monthly Dino	05/06/2020 10:56	\N	\N	xRevolveR	05/06/2020 11:01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	X-Rock Elemental	No	na	na	na	na	na	na	Doesn't matter	325539 218360 -38 16.37 -25.06       PIN:1598	SEBA.685@HOTMAIL.COM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40fc4f22-93f7-4d71-adaf-c94fdf87946c	328	Rocksteady	#	\N	DomiNATION #5 - Ragnarok	COMPLETE	10AM-6PM EST	General Support Ticket	05/05/2020 14:54	05/05/2020 14:55	BeOurGuest	BeOurGuest	05/05/2020 16:54	TMNT	428698 424839 -12722 -6.86 -4.31	Slept mana's	Talked to Zy, who is currently unavailable and told me to make this ticket. I left some dinos on mating on accident and she slept them.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d3974214-7fff-4adc-9796-1ea1b441a4b8	331	\N	\N	\N	\N	CANCELLED	\N	Anonymous	05/05/2020 18:21	\N	\N	Silver Strange	05/05/2020 18:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Looking to get the monthly dino I paid for.  Please assist.\r\n	\N
f771f4ce-7499-4e54-a20d-30c673b39db2	332	Bob	Boon1000#6879	598178464385728516	DomiNATION #5 - Ragnarok	COMPLETE	Where is my monthly dino?	Patreon Monthly Dino	05/05/2020 18:24	05/05/2020 19:23	Chief Rodney	Chief Rodney	05/05/2020 20:43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Wyvern (Ice)	No	na	na	na	na	na	na	Doesn't matter	-21760 -234520 24325 -156.80 -8.11	boon1000@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c7a42525-208a-4e68-9642-69eade70c3e8	336	Oddin	TheOddMe#7614	219811551186649089	DomiNATION #13 - Genesis	CANCELLED	10am-3pm EST	Patreon Monthly Dino	05/06/2020 06:33	\N	\N	TheOddMe	05/06/2020 08:24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Tek Quetzal	No	na	na	na	na	na	na	Female	325460 218371 -19 8.17 -15.49	BillZztp200@aol.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b6e16290-5ba9-415d-a544-e0558041f200	327	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	CANCELLED	Any time  CST	Transfer Element	05/05/2020 14:45	05/06/2020 14:20	Frank	Haldirin	05/07/2020 03:58	\N	\N	\N	\N	\N	\N	\N	\N	800	DomiNATION #11 - Genesis	-305087 317912 -19919 -38.23 1.24	DomiNATION #13 - Genesis	 -305087 317912 -19919 -38.23 1.24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9e5d316e-2149-4cb1-83d7-954c66369d1a	324	Jimmy	Water#2468	157665396919500800	DomiNATION #6 - Patreon Ragnarok	COMPLETE	10am-12pm	General Support Ticket	05/05/2020 08:01	05/06/2020 13:46	Frank	Frank	05/06/2020 13:47	NorthPole	487768 71183 -13156 141.77 -3.97	So i cant put the purge signs on my water pin for my squids but i do have it on my main base next to it thats attached 	the flags dont allow me to place them on the gates 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7abbfd20-7754-494a-a254-b4de4cf6dea8	340	Jimmy	Water#2468	157665396919500800	DomiNATION #6 - Patreon Ragnarok	CANCELLED	12am-12pm	General Support Ticket	05/06/2020 10:14	\N	\N	Frank	05/06/2020 13:48	NorthPole	not in game	idk how many times i didnt request my pat dino but idk if u keep track but i would like to request all my dinos 	can u dm me or message me how many i have>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
016ab1e4-a613-4a33-b8e1-de7cde1dcc3b	333	Homer	Riet#7295	277550398624104449	DomiNATION #6 - Patreon Ragnarok	COMPLETE	CST 2pm-12pm	Patreon Monthly Dino	05/05/2020 20:57	05/06/2020 15:15	Zylana	Zylana	05/06/2020 15:23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Argentavis	Yes	14	na	3	3	3	3	Doesn't matter	236347 156529 -11601 93.93 -32.94            code=1789	fcvanriet@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dde86869-e98b-420a-8baa-509aadff558f	335	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	COMPLETE	7 am - 12 am est	General Support Ticket	05/06/2020 06:19	05/06/2020 13:06	Zylana	Zylana	05/06/2020 13:55	WIP	N/A	Lost some dinos due to the crash last night	Reached out for help.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ff274522-0ab2-4277-b6f3-7537e7661cde	345	Oddin	TheOddMe#7614	219811551186649089	DomiNATION #13 - Genesis	COMPLETE	10am-3pm EST	Patreon Monthly Dino	05/06/2020 11:22	05/06/2020 14:02	Zylana	Zylana	05/06/2020 14:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Karkinos	No	na	na	na	na	na	na	Male	325460 218371 -19 8.17 -15.49  --- Pin 1598	BillZztp200@aol.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3d56d644-c6e3-4c34-b678-256e823da3c2	337	OlDirtyBastard	Wutang#2150	120000216270241796	DomiNATION #13 - Genesis	COMPLETE	12pm - 5pm East Coast	Patreon Monthly Dino	05/06/2020 07:18	05/06/2020 14:38	Zylana	Zylana	05/06/2020 14:43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Griffin	Yes	14	na	na	na	215	18	Male	329954 214105 -74 -166.22 1.57	anthony-alba@live.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c9c29750-6854-4c00-bd79-dfc9b6131b9b	344	Tessa	Tessa#0647	271142868008042497	DomiNATION #8 - Patreon Extinction	COMPLETE	1pm - 12 am cst	Patreon Monthly Dino	05/06/2020 11:17	05/06/2020 14:12	Zylana	Zylana	05/06/2020 14:20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Basilisk	Yes	79	5	56	na	5	5	Female	-187452 -287115 -132660 -77.40 -7.49   code-8921	josh_cartwright@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a7cbdf2e-ac52-4aac-aca7-8f927ec4da5b	341	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #6 - Patreon Ragnarok	COMPLETE	varies EST	Patreon Monthly Dino	05/06/2020 10:26	05/06/2020 14:24	Zylana	Zylana	05/06/2020 14:32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Magmasaur	No	na	na	na	na	na	na	Female	299254 -403698 3369 86.10 -9.95 PIN:1206	gmckee1964@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d3af5289-f364-4983-8e5d-d0961c175048	339	Zeek	Zeek#3211	344560288412205057	DomiNATION #9 - Valguero	COMPLETE	5PM-9PM EST	Patreon Monthly Dino	05/06/2020 09:36	05/06/2020 14:32	Zylana	Zylana	05/06/2020 14:37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	185325 -162075 -5195 -77.71 -2.23 PIN Code 5544	knightzac@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
410fec78-f8ca-4181-a3f5-b601055f9718	308	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	11:30am-2pm CST	Patreon Monthly Dino	05/04/2020 10:20	05/06/2020 14:20	Frank	Frank	05/06/2020 14:40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Giganotosaurus	No	na	na	na	na	na	na	Male	-305087 317912 -19919 -38.23 1.24      2302	Coolquill38@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6767a8d2-216a-4a9b-826a-8dbf3e0822b3	343	xRevolveR	xRevolveR#2176	228323212876840961	DomiNATION #13 - Genesis	COMPLETE	1PM - 12AM East Coast	Patreon Monthly Dino	05/06/2020 11:02	05/06/2020 14:46	Zylana	Zylana	05/06/2020 14:52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Mek	No	na	na	na	na	na	na	Doesn't matter	325539 218360 -38 16.37 -25.06 PIN:1598	SEBA.685@HOTMAIL.COM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3e3767c7-486c-495a-a3ee-cd1c444f614a	334	Kolobok	Kolobok#2615	677933875590201394	DomiNATION #1 - Island	COMPLETE	around 1900-0800 PST	Patreon Monthly Dino	05/05/2020 21:59	05/06/2020 15:07	Zylana	Zylana	05/06/2020 15:11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Bloodstalker	No	na	na	na	na	na	na	Female	118117 272681 -11445 29.21 -22.62	mfbsatx@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6f0739cf-ca5c-4920-9729-694f8bd58168	329	Fatman101	Fatman101#3792	439974141072769058	DomiNATION #5 - Ragnarok	CANCELLED	9:30PM-10:45EST 	Patreon Insurance Request	05/05/2020 15:51	\N	\N	Frank	05/06/2020 15:36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/9/dino/181447431	anthony@nouturn.com	April	It was claimed by Cat from the Fluff tribe on #5 and given away to a person who hasn't played in days.	\N	\N	\N	\N	\N	\N	\N	\N	\N
102081bb-55bc-4044-a3cb-2175b209e8af	330	Fatman101	Fatman101#3792	439974141072769058	DomiNATION #5 - Ragnarok	COMPLETE	9:30PM-10:45EST 	Patreon Insurance Request	05/05/2020 15:51	05/06/2020 15:36	Frank	Frank	05/06/2020 15:52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/9/dino/181447431	anthony@nouturn.com	April	It was claimed by Cat from the Fluff tribe on #5 and given away to a person who hasn't played in days.	\N	\N	\N	\N	\N	\N	\N	\N	\N
df31a840-8913-46de-a838-68bac96fe3e5	326	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Patreon Monthly Dino	05/05/2020 14:40	05/06/2020 14:20	Frank	Frank	05/06/2020 14:41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Magmasaur	No	na	na	na	na	na	na	Doesn't matter	 -305087 317912 -19919 -38.23 1.24	Coolquill38@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
05222f6b-a648-475e-a39a-e52b8ab4d7ea	338	banditblood	banditblood#5034	331586419846021122	DomiNATION #8 - Patreon Extinction	COMPLETE	now- 11pm eastern	General Support Ticket	05/06/2020 08:44	05/06/2020 13:51	Frank	Frank	05/06/2020 15:22	mother of dragons	not sure, if on 8, lower right hand corner of map, on an island.	i believe i last went to sleep on 8 and im no longer paying for patreon, need to be transfered to another server, such as 5.	tried to login to all the servers i have/had bases on to see if character was there	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8f80caef-75f5-4fbb-961b-5cd2f45ddf07	346	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	COMPLETE	1pm - 10pm EST	Patreon Monthly Dino	05/06/2020 15:30	05/06/2020 15:31	Zylana	Zylana	05/06/2020 15:36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Phoenix	No	28	10	11	44	4	18	Female	-183437 -8795 -2974 -88.00 -12.62	tkoptur1@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bc5ad6c0-52fe-4664-b425-9894cc0cf1d6	347	Struggler	The Struggler#1387	277855875861970945	DomiNATION #13 - Genesis	COMPLETE	1pm-11pm	Patreon Monthly Dino	05/06/2020 15:49	05/06/2020 15:52	Zylana	Zylana	05/06/2020 15:58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Phoenix	Yes	36	10	na	na	19	28	Doesn't matter	325539 218360 -38 16.37 -25.06 pin: 1598	datboiimas3@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b4b95bfb-8d7e-40c5-88ee-d33c28fc5527	363	SpicyTuna37	SpicyTuna37#7233	490205001587752981	DomiNATION #9 - Valguero	CANCELLED	12PM - 9PM MST	Transfer Element	05/07/2020 11:34	\N	\N	SpicyTuna37	05/07/2020 15:25	\N	\N	\N	\N	\N	\N	\N	\N	490	DomiNATION #9 - Valguero	-154610 -79694 -14009 129.28 -35.26	DomiNATION #5 - Ragnarok	-230985 460525 -14419 -93.08 -31.87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6e84a6fe-d065-400c-81ca-ef6d1bc610cb	352	Chubbs	Kojo#1169	267784727438557184	DomiNATION #6 - Patreon Ragnarok	COMPLETE	7PM - 11PM Central 	Patreon Monthly Dino	05/06/2020 17:21	05/07/2020 13:51	ShiftyG	ShiftyG	05/07/2020 13:51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Tek Quetzal	No	na	na	na	na	na	na	Doesn't matter	-295938 -383941 5849 150.08 -22.77 Pin Code: 8383	sean.deberry10@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48912856-f8c6-43d2-bab2-3aa8331b18fd	350	WZK	WZK#7430	688223029905588386	DomiNATION #1 - Island	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Patreon Monthly Dino	05/06/2020 16:54	05/07/2020 13:59	ShiftyG	ShiftyG	05/07/2020 14:14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Unicorn	No	na	na	na	na	na	na	Female	-309 243912 -9921 -63.47 -15.78	spg8642@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b9e43f85-1e2e-4650-9d76-44a7a2cb3036	351	WZK's WIFE	WZK WIFE#8505	701918031257010257	DomiNATION #1 - Island	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Patreon Monthly Dino	05/06/2020 17:01	05/07/2020 14:03	ShiftyG	ShiftyG	05/07/2020 14:14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Unicorn	No	na	na	na	na	na	na	Male	-309 243912 -9921 -63.47 -15.78	cora.a.abshire@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96179d4a-b816-4366-b2ce-1de99e87d44e	354	Ami Wolvez	-Ami-#4637	239810011159724042	DomiNATION #1 - Island	COMPLETE	Eastern Daylight Time UTC-4 (5pm-11pm)	Patreon Monthly Dino	05/06/2020 18:42	05/07/2020 14:15	ShiftyG	ShiftyG	05/07/2020 14:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Wyvern (Ice)	Yes	14	18	5	18	5	17	Doesn't matter	-252303 273564 -14332 33.49 -14.20	elsabmarte00@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4faf3172-8960-4c2a-8058-6f4bcc18e7a2	361	Eurgiga	#	\N	DomiNATION #13 - Genesis	CANCELLED	Nowish	General Support Ticket	05/07/2020 10:21	05/07/2020 14:38	ShiftyG	ShiftyG	05/07/2020 15:03	The Flat Ark Society	-35283 -148607 219 -40.97 -24.94	Can't reach my mount because of super bugged ocean area, have tried and get teleported away magically and died to nothing in the middle of the water.	Submitted a ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b85e03bd-8ebb-417d-a4a0-bd090769e4d8	355	Dune	Torgames#9123	268994711455399936	DomiNATION #9 - Valguero	COMPLETE	9PM - 2AM CST	Patreon Monthly Dino	05/06/2020 20:26	05/07/2020 16:52	Cowdog	Cowdog	05/07/2020 18:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Rock Drake	Yes	17	18	na	14	14	12	Female	152242 108144 -14220 89.38 -9.21	torganrose@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fad59a2d-0bb5-434a-9ed3-4a358a1db8a6	348	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	COMPLETE	7 am - 12 am est	Patreon Monthly Dino	05/06/2020 16:08	05/09/2020 06:20	Frank	Frank	05/09/2020 06:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #1 - Island	Astrocetus	Yes	1	14	4	14	14	4	Doesn't matter	283615 165540 -9598 4.47 -11.45 - PIN 1470	paperdemonvg@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f0cc9012-446e-43d6-a3cb-c70ef834efd9	364	Fatman101	Fatman101#3792	439974141072769058	DomiNATION #5 - Ragnarok	COMPLETE	9:30PM-10:45EST 	Patreon Monthly Dino	05/07/2020 13:37	05/07/2020 16:45	Cowdog	Cowdog	05/07/2020 17:59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Mek	Yes	222	na	224	217	na	217	Doesn't matter	218359 -442304 -11964 -24.78 -26.06 PIN IS:2275	anthony@nouturn.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0cfe325c-953c-4baf-a543-1a93a66f9d7a	357	Vinar	FForgotten#0867	267400631612997643	DomiNATION #13 - Genesis	COMPLETE	8PM MST	Patreon Monthly Dino	05/06/2020 22:59	05/07/2020 16:54	Cowdog	Cowdog	05/07/2020 16:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Karkinos	No	na	na	na	na	na	na	Doesn't matter	321083 267731 1032 30.46 -14.08	JustinFarmer6121@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cf8b5a4b-9717-4126-8fbc-81e6abb0b55c	356	Ragefast	Ragefast#3548	107341492749680640	DomiNATION #13 - Genesis	COMPLETE	5PM - 1am Central	Patreon Monthly Dino	05/06/2020 22:50	05/07/2020 17:00	Cowdog	Cowdog	05/07/2020 17:45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Tek Raptor	No	na	na	na	na	na	na	Doesn't matter	325142 266521 852 160.60 -3.33	rages.boost@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7de03d29-29bf-4d4f-b07d-a7469a5df546	353	Paddius	Paddius#1630	567514843104542730	DomiNATION #5 - Ragnarok	COMPLETE	5pm-8pm Central Time	Patreon Monthly Dino	05/06/2020 18:13	05/09/2020 06:33	Frank	Frank	05/09/2020 06:41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Astrocetus	No	na	na	na	na	na	na	Doesn't matter	-230405 -397317 -11701 -3.79 -16.12   PIN: 3451 Right next to (Paddius) Teleport	paddy_kc@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e4d2ec25-a448-4691-afd1-c47530a0f45b	358	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Patreon Insurance Request	05/07/2020 03:42	05/09/2020 06:57	Frank	Frank	05/09/2020 10:16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mek	Coolquill38@gmail.com		my base on extinction suporters decayed it was in cryo i believe.\r\nIt was a tek mek no name just mek if i remember.	\N	\N	\N	\N	\N	\N	\N	\N	\N
84e6381e-a4e7-4a57-bceb-4bfa4ed23b85	359	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Patreon Insurance Request	05/07/2020 03:50	05/09/2020 06:57	Frank	Frank	05/09/2020 10:16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Reaper King	Coolquill38@gmail.com		It died in either cryo or decay i honestly dont remember	\N	\N	\N	\N	\N	\N	\N	\N	\N
240ecb78-0d96-4274-8610-062c1a452be5	360	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Transfer Element	05/07/2020 04:01	05/09/2020 06:57	Frank	Frank	05/09/2020 07:09	\N	\N	\N	\N	\N	\N	\N	\N	1000	DomiNATION #11 - Genesis	118285 296394 708 74.46 4.24   Pin Code is 2302 in replicator	DomiNATION #13 - Genesis	-305087 317912 -19919 -38.23 1.24      2302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8999cb87-a882-4c9d-a279-3e321c96b9bc	362	Emma	Emma#0569	342987464744632321	DomiNATION #9 - Valguero	COMPLETE	7AM - 8 PM East Coast	Patreon Monthly Dino	05/07/2020 10:32	05/09/2020 07:15	Frank	Frank	05/09/2020 07:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Astrocetus	Yes	207	5	207	na	5	30	Female	185351 -162098 -5197 -83.30 -5.98 PIN 5544	jenducate@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f23dccd8-2e67-44fa-a1b8-f44f4995775f	365	Barbequeque	Barbequeque#1570	114238908467904518	DomiNATION #4 - Aberration	COMPLETE	UTC-700	General Support Ticket	05/07/2020 15:25	05/07/2020 15:36	Zylana	Zylana	05/07/2020 15:46	N/a	38.9 29.5	Had a solo tribe, disbanded to join another, and my rock drake is no longer my own	Tried remaking tribe, no luck	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71e1786c-d54b-45ea-9bc7-eebfcd40f7f7	349	JBizzle	JBizzle#9229	288110391492345858	DomiNATION #9 - Valguero	COMPLETE	530pm -10pm est mon-fri sat & sun 8am - 10pm	Patreon Monthly Dino	05/06/2020 16:29	05/07/2020 16:52	Cowdog	Cowdog	05/07/2020 18:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Bloodstalker	No	na	na	na	na	na	na	Doesn't matter	cryofridge by tp pin#1870 -393622 -269303 37803 45.23 -15.52	james_brown4848@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a37acc37-857b-458e-bad8-11e57ce7af0a	370	Reaper843	Reaper843#6905	139199646915362817	DomiNATION #9 - Valguero	COMPLETE	10am-3am Central	Patreon Monthly Dino	05/08/2020 19:28	05/09/2020 07:28	Frank	Frank	05/09/2020 07:31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Phoenix	Yes	14	14	na	na	2	2	Doesn't matter	76563 -51128 -14308 -88.02 -9.66 / 8675	Bobbyg843@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
367930d1-803c-4ce9-93ff-42a5c60e9d60	374	Zane	Zane#3038	214235950694400001	DomiNATION #11 - Genesis	COMPLETE	12pm-3pm 	Bug Report	05/08/2020 23:53	05/09/2020 00:22	Zylana	Zylana	05/09/2020 00:23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I was collecting mangmasaur eggs. While I was leaving volcano my connection timed out and when I came back in I was a lv and lost everthing. 	I have base in valguro and I have chest on this map. 	I was on my even just lost an egg	\N	\N
84bc9a15-d61d-4a73-b95a-70a87ddc1a77	299	Liz	terrificfight#8423	596710360891785219	DomiNATION #6 - Patreon Ragnarok	COMPLETE	4:30-8:00 p EST	General Support Ticket	05/03/2020 15:59	05/05/2020 04:18	Frank	Frank	05/09/2020 06:01	Tres Leechy	-155969 91784 11625 -58.76 -32.75	Unable to transfer to the Island	Restarted, refreshed,  tried consistently (I usually have to refresh for 20+ min before I can find the island). 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b9f27e50-e3e5-43f4-b5b8-d423233bdd59	375	punz	punz#2980	236887526441222144	DomiNATION #1 - Island	COMPLETE	12pm-6pm Central Time	General Support Ticket	05/09/2020 00:00	05/09/2020 08:02	Frank	Frank	05/09/2020 08:20	Octopus	-268602 -186463 -8894 -107.97 -20.98	The explorer note at 26.6,16.4 is inaccessible due to a building on top of the note.	The owner was not online, placed a ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6e25c354-5015-4641-aac2-e063d1935d22	366	Birb 	Birb#9040	534832819579650048	DomiNATION #5 - Ragnarok	COMPLETE	MST	Transfer Element	05/07/2020 21:42	05/09/2020 07:18	Frank	Frank	05/09/2020 07:22	\N	\N	\N	\N	\N	\N	\N	\N	651	DomiNATION #7 - Extinction	 -72926 -70926 -9438 62.50 -11.33  A large storage box, unlocked, No PIN	DomiNATION #5 - Ragnarok	-406219 154224 -8904 -31.40 -13.84 A Vault next to the greenhouse glass, Unlocked, No PIN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bf5b0340-5a39-4442-a007-8b5b49fdadc3	371	Chia	Chiatsu#7429	394490703549431809	DomiNATION #6 - Patreon Ragnarok	COMPLETE	4pm-10pm Cmt	Patreon Monthly Dino	05/08/2020 20:16	05/09/2020 07:33	Frank	Frank	05/09/2020 07:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Megachelon	No	na	na	na	na	na	na	Male	190817 -51250 32316 115.34 -15.83 4591	chiapetara@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93a5ce11-3d80-4e0d-afc5-391741ac7a31	373	Dune	Torgames#9123	268994711455399936	DomiNATION #9 - Valguero	COMPLETE	11am - 2am CST	Element from Event	05/08/2020 22:07	05/09/2020 07:42	Cowdog	Cowdog	05/09/2020 08:14	\N	\N	\N	\N	Late Night Boss Event - Friday May 1st 10:30pm-11pm	DomiNATION #9 - Valguero	Yes	151548 105982 -14322 106.83 -21.76    pin 1031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f7420e83-bb62-4d2d-aaba-366bfa7509c5	372	Reaper843	Reaper843#6905	139199646915362817	DomiNATION #9 - Valguero	COMPLETE	10am-3am CST	Bug Report	05/08/2020 21:20	05/09/2020 08:18	Cowdog	Cowdog	05/09/2020 08:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I was raising a blood stalker. There was a server update and it was at 82% and i needed 1 more imprint for the 100% imprint bonus, server went down and came back up. I wasnt gone for more then 5 mins and the blood stalker was at 100% when i came back in.	no idea, maybe if there is another server update?	not sure if i can prove the imprinting loss aside from it only being at 67%	\N	\N
b839c561-c9fd-42dc-ad2a-9c6df3374603	367	Dune	Torgames#9123	268994711455399936	DomiNATION #9 - Valguero	COMPLETE	CST	General Support Ticket	05/08/2020 10:12	05/09/2020 08:24	Cowdog	Cowdog	05/09/2020 09:44	Scorpio	194805 26722 -6273 55.44 -28.20	foundation spam - blocking beaver dam spawns on Beaver Island	demo'd majority of demo able things, still fence foundations remain with long timers.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34f09e7f-f385-4930-ad04-40e0aaf243eb	369	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	CANCELLED	Any time  CST	General Support Ticket	05/08/2020 13:11	05/09/2020 10:15	Frank	Frank	05/09/2020 10:16	Solo	-278715 266797 -25528 -128.44 -7.43	Use the artic NE teleport from helena and my giga spawned underground.	Tried to cryo it but wasnt in range	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a0c4d403-15df-4e03-bb9f-26278a721b6a	379	Liz	liz#3801	596710360891785219	DomiNATION #8 - Patreon Extinction	CANCELLED	4:30-8:00 p EST	Transfer Element	05/09/2020 09:09	\N	\N	ShiftyG	05/11/2020 09:11	\N	\N	\N	\N	\N	\N	\N	\N	1528	DomiNATION #6 - Patreon Ragnarok	-279465 398855 -14260 97.40 -11.60 PIN 0302	DomiNATION #8 - Patreon Extinction	-155495 -238141 -120717 130.25 -20.12 PIN 0302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b8b89567-dafd-4ab7-8348-405a345111aa	381	punz	punz#2980	236887526441222144	DomiNATION #1 - Island	COMPLETE	12pm-6pm Central Time	General Support Ticket	05/09/2020 12:02	05/11/2020 05:40	Zylana	Zylana	05/11/2020 05:40	Octopus	-268733 -186532 -8809 -74.10 -0.17	Explorer Note is still covered by a metal tower at 26.6,16.4. Sorry for a repeat ticket, still can't access it. 	The owner was not online, placed a ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c819667d-ccd8-4aea-a61b-57b6e62b40fe	378	Liz	liz#3801	596710360891785219	DomiNATION #8 - Patreon Extinction	COMPLETE	4:30-8:00 p EST	Patreon Monthly Dino	05/09/2020 09:07	05/11/2020 08:18	ShiftyG	ShiftyG	05/11/2020 08:59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Yutyrannus	No	na	na	na	na	na	na	Male	-155495 -238141 -120717 130.25 -20.12 PIN 0302	ekuhar7@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6ca48c4b-a118-4773-be10-3d63f17ee37c	368	JBizzle	JBizzle#9229	288110391492345858	DomiNATION #11 - Genesis	COMPLETE	530pm -10pm est mon-fri sat & sun 8am - 10pm	Transfer Element	05/08/2020 13:01	05/09/2020 07:25	Frank	Frank	05/13/2020 06:46	\N	\N	\N	\N	\N	\N	\N	\N	255	DomiNATION #11 - Genesis	LARGE STORAGE BOX pin#1870 -191421 346960 -15187 -156.65 -21.40	DomiNATION #9 - Valguero	vault by teleporter pin#1870 -393742 -269199 37803 58.15 -14.59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d5acbac8-fb85-487d-b54f-7a45324df03a	380	Pluto	Brie#8193	178206183734116352	DomiNATION #8 - Patreon Extinction	COMPLETE	Eastern	Patreon Monthly Dino	05/09/2020 09:23	05/11/2020 12:48	ShiftyG	ShiftyG	05/11/2020 13:03	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #8 - Patreon Extinction	Yutyrannus	No	na	na	na	na	na	na	Female	-155495 -238141 -120717 130.25 -20.12 PIN 0302	briestauffer@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4d325df8-780d-420b-8927-ee37eba7ae47	385	Ace	Ace0mac#8931	292843159518576640	DomiNATION #8 - Patreon Extinction	CANCELLED	9am - 8pm west cost	General Support Ticket	05/09/2020 23:46	\N	\N	Ace0mac	05/09/2020 23:55	N/A - I haven't made one yet	-47643 -189233 -17570 -168.80 -18.09	My Giga (Ms Quick) vanished when I cryoed it! Ms Quick and It looked like I cryoed up but the cryo but it never went in and just vanished.	Looked everywhere tought maybe i misplaced the cube or some how dropped it, but it can find it anywhere.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eb689c53-4dd6-4642-85ab-a715158fff9b	377	Lee	Lee.polito#5259	566463858672271360	DomiNATION #6 - Patreon Ragnarok	CANCELLED	4PM-10PM Central	Transfer Element	05/09/2020 09:02	\N	\N	Lee.polito	05/10/2020 08:48	\N	\N	\N	\N	\N	\N	\N	\N	2247	DomiNATION #6 - Patreon Ragnarok	-337867 362437 -13297 92.53 -35.69 & Pin Code : 8675	DomiNATION #8 - Patreon Extinction	12473 42969 -23030 -58.52 12.08 & Pin Code : 8675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
02dbb21c-92c4-40c3-918d-f69d0cc85cad	396	Brett	Brett A#7734	523334717127524362	DomiNATION #5 - Ragnarok	COMPLETE	10 - 2pm	Element from Event	05/10/2020 20:26	05/11/2020 05:15	Zylana	Zylana	05/11/2020 05:19	\N	\N	\N	\N	The late night overseer boss event May 8th	DomiNATION #5 - Ragnarok	No	394106 -359129 7673 -160.52 -37.12     The pin code is 1230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ffc7bd64-f8fa-4be7-a69f-9aab44fe0a80	394	MoshPit	darthmosher#9054	289936248339169280	DomiNATION #5 - Ragnarok	COMPLETE	4pm-8pm Central	Element from Event	05/10/2020 15:55	05/11/2020 05:20	Zylana	Zylana	05/11/2020 05:20	\N	\N	\N	\N	Late Night Overseer event last friday night May 8th	DomiNATION #5 - Ragnarok	No	-10952 -372025 23699 -161.12 -25.40    PIN:  0550   Thank you!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0682fba2-6f88-40e3-ba81-ab5d4e1e385d	383	BLURP	blrp#1576	210907842033614849	DomiNATION #9 - Valguero	COMPLETE	1PM-3PM, 6PM-9PM EST	General Support Ticket	05/09/2020 21:00	05/11/2020 05:21	Zylana	Zylana	05/11/2020 05:21	Necropolis	348983 188207 16401 -133.74 -17.57	Cryod my newly tamed 145 Rock Golem, brought it to server 1 and didnt realize that its not a transferable dino. It is now stuck in cryo on #9, says "cannot deploy" when attempting. Has the picture of raptor on cryo but states its my Rock golem. Stats are lower then what it tamed at too idk if that has anything to do w it.	Relogged, threw it in cryofridge on #1, brought dino back to server it was tamed on, no luck	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
514fa1bd-d7db-4fac-bf06-042eb7da284b	382	Barbequeque	Barbequeque#1570	114238908467904518	DomiNATION #5 - Ragnarok	COMPLETE	UTC-700	General Support Ticket	05/09/2020 15:53	05/11/2020 05:22	Zylana	Zylana	05/11/2020 05:22	HasuNyan	-199022 -399516 -12601 -46.43 -0.76	Was raising two dragons before update, new patch screwed the imprint timers. Also, I bought a magmasaur egg during event today, and its poofed as well.	Checked every inventory in my tribe to locate it, no luck	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2b780386-1bd1-4321-8a6c-7cb07040bd98	392	Talaure	Talaure#8560	692186228346454036	DomiNATION #1 - Island	COMPLETE	16:00-22:00	Element from Event	05/10/2020 14:07	05/11/2020 05:28	Zylana	Zylana	05/11/2020 05:28	\N	\N	\N	\N	Friday 5/8/20 Late night event	DomiNATION #1 - Island	Yes	292658 266760 -12753 134.57 -22.97  Pin 1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4d692a98-8eca-42f9-8df7-accadac82a5f	391	Poni	DreEl#5238	330546780758343680	DomiNATION #1 - Island	COMPLETE	 4pm to 2am eastern	Element from Event	05/10/2020 13:25	05/11/2020 05:30	Zylana	Zylana	05/11/2020 05:30	\N	\N	\N	\N	May 9th Volcano run late night	DomiNATION #1 - Island	Yes	256888 246624 -14018 -116.65 -33.19    pin 4321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8b3b7b9f-9184-467c-9aec-5b91a2edc1aa	386	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	COMPLETE	1pm - 10p. EST	Element from Event	05/10/2020 05:44	05/11/2020 05:32	Zylana	Zylana	05/11/2020 05:32	\N	\N	\N	\N	Friday, May 8th event in island map	DomiNATION #1 - Island	Yes	-184358 -10877 -3340 172.16 -23.12 and 2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d695ba87-69b5-4cbb-971e-c666d627c662	387	Jaeger	Jaeger#1312	296834414376124417	DomiNATION #4 - Aberration	COMPLETE	West Coast	Element from Event	05/10/2020 07:12	05/11/2020 05:35	Zylana	Zylana	05/11/2020 05:39	\N	\N	\N	\N	Late Night Overseer Friday 8 May 2020	DomiNATION #4 - Aberration	No	-162160 -44590 44045 116.73 -3.91 Pin#3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5ae2f63c-40b3-4c43-afa6-e43d4d78c0f7	395	Sherman	Andi#3628	685662072318722061	DomiNATION #1 - Island	COMPLETE	Hiii i removed the tower blocking explorer note	General Support Ticket	05/10/2020 19:18	05/11/2020 05:41	Zylana	Zylana	05/11/2020 05:44	Tribe of jace	-268019 -178028 -9584 16.70 -0.31		I removed tower	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8c00732a-59c0-451c-a2be-a6f0c9d77814	388	Bebela	Ezio#2358	553227283519897611	DomiNATION #2 - Center	COMPLETE	UTC-6.00	General Support Ticket	05/10/2020 09:55	05/11/2020 05:46	Zylana	Zylana	05/11/2020 06:05	Dark Spear	276594 -12769 -14028 -82.98 7.70	An Admin put a Parasaur on my base to contact them	ask in discord and open a ticket 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b8f84fbc-91f4-4479-aaf0-20dd51070473	389	shrimptaco	Shrimptaco#9696	314645165471956992	DomiNATION #9 - Valguero	COMPLETE	8am-8pm  central daylight time	General Support Ticket	05/10/2020 10:47	05/11/2020 05:50	Zylana	Zylana	05/11/2020 05:51	Taco Tuesday	108639 62578 -6261 -89.33 -2.18	Birds are knocked out	Looks like we are in violation.  Attempting to transfer supplies from third build but birds are asleep.  	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e37a49d6-f1c9-4363-a2b5-1e9183e3d4d0	393	Birb 2	Birb#9040	534832819579650048	DomiNATION #13 - Genesis	COMPLETE	MST	Element from Event	05/10/2020 14:11	05/11/2020 05:53	Zylana	Zylana	05/11/2020 06:00	\N	\N	\N	\N	Friday, May 8 Late Night Overseer Event	DomiNATION #13 - Genesis	No	101032 -249574 -34355 -89.85 -14.05 A large Storage box next to a Bloodstalker. No PIN and is Unlocked.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d27f44b5-d3e6-473a-a876-849899fdb42f	398	Nasuli	Nasuli#1271	160230702758100992	DomiNATION #13 - Genesis	COMPLETE	10am - 2am akst	Element from Event	05/11/2020 02:49	05/11/2020 05:13	Zylana	Frank	05/13/2020 06:49	\N	\N	\N	\N	5/8 Late Night Overseer Event	DomiNATION #13 - Genesis	No	-43853 -58221 25271 -45.32 -10.28 7544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
585c57b2-0fd1-411d-a862-f56dce0ec7d5	384	NoonE	vldkain#7061	139572289271365633	DomiNATION #7 - Extinction	COMPLETE	12am to 12 pm central	Transfer Element	05/09/2020 21:45	05/11/2020 09:21	Ford	Ford	05/11/2020 09:30	\N	\N	\N	\N	\N	\N	\N	\N	2000	DomiNATION #7 - Extinction	-2524 -20644 -11421 -151.37 0.15 pin 0511	DomiNATION #9 - Valguero	96208 140166 -6210 -166.77 -39.38 pin 0511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ea4e8c6b-3fe9-4635-860c-4c7545a65c3e	390	Jade	teamwolfe19#0074	561367603684179981	DomiNATION #5 - Ragnarok	COMPLETE		Patreon Monthly Dino	05/10/2020 13:20	05/11/2020 13:42	ShiftyG	ShiftyG	05/11/2020 13:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Griffin	Yes	2	55	55	55	55	55	Doesn't matter	461249 -356030 -14055 -171.65 -22.91 pin 1239	teamwolfe19@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19abb1b1-cd45-404f-b812-e51f5230bb4e	399	Adrianna	Adrianna#2685	140527389108076544	DomiNATION #6 - Patreon Ragnarok	COMPLETE	EST	Patreon Monthly Dino	05/11/2020 03:01	05/12/2020 13:23	ShiftyG	ShiftyG	05/12/2020 13:48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Unicorn	No	na	na	na	na	na	na	Male	-286887 67098 -13712 -155.90 -35.82  pin 5482	krexanna@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fe47825f-432f-4622-b723-129571171439	397	JCBBlueDevil	JCBBlueDevil#4290	275127176276213760	DomiNATION #9 - Valguero	COMPLETE	1000-2200 PDT	Patreon Monthly Dino	05/10/2020 21:41	05/12/2020 13:56	ShiftyG	ShiftyG	05/12/2020 14:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	Wyvern (Fire)	Yes	2	2	14	14	14	14	Doesn't matter	79762 -50376 -14313 -29.17 -18.83 PIN:1212	jcbbluedevil@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3761c01b-62d6-4ca9-a24d-cdae81367f72	401	Dawi	Titan#9129	199674259134480384	DomiNATION #2 - Center	COMPLETE	Central and various times	General Support Ticket	05/11/2020 07:00	05/11/2020 07:03	Zylana	Zylana	05/11/2020 07:12	ShadowForge	283724 251893 -14197 67.91 -10.38	Another tribe has claimed dinos in my pen and has not removed them. 	Contact admin/tribe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
db9cf7ca-b0d0-48f0-b2c6-18a903a12827	403	Jimmy	Water#2468	157665396919500800	DomiNATION #4 - Aberration	CANCELLED	12am-12pm	General Support Ticket	05/11/2020 10:17	\N	\N	Water	05/11/2020 10:43	Tribe of jimmy	-230446 -43754 56170 -62.31 -44.69	so when i left my tribe i forgot to cryo my tame 	i mean i cant really do anything stuck in abbb rn looking at my fav rock drake 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ed84f027-8286-43cb-8c84-50bcbfd70171	405	WZK	WZK#7430	688223029905588386	DomiNATION #8 - Patreon Extinction	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Element from Event	05/11/2020 11:29	05/11/2020 12:51	ShiftyG	ShiftyG	05/11/2020 13:10	\N	\N	\N	\N	Date: May 8th, 2020 1030PM CST Name: Late Night Overseer Event	DomiNATION #8 - Patreon Extinction	Yes	73795 52989 -35877 160.24 -5.86	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
345c98eb-1da0-41bd-b402-817bb7ad105d	411	Oddin	TheOddMe#7614	219811551186649089	DomiNATION #13 - Genesis	CANCELLED	10am-3pm EST	General Support Ticket	05/11/2020 19:36	\N	\N	TheOddMe	05/11/2020 21:21	Swam People	328534 213762 169 7.75 -30.46	in the middle of along came pollen i cryod my megatherium but my cryo pod is showing empty with no megatherium. 	i checked the site to take him.. says he is alive and in a cryopod	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e595cad0-dec5-4e19-8880-68016324d3dd	404	Cat	PikaChunti#7275	340278608851501057	DomiNATION #2 - Center	COMPLETE	11am-1am	General Support Ticket	05/11/2020 11:26	05/11/2020 13:14	ShiftyG	ShiftyG	05/11/2020 13:34	Fluff	25.3, 47.9	I dont know if you guys are going to help since its a death inventory issue.. but my friend said i should just try to put in a ticket... when i logged on this morning, it said i "killed myself" and because of this i lost everything on my body. So i lost all my tek gear and some other things that actually mattered to me.. some things are easily replaceable but others i cannot really get back or craft.. 	Im putting in this ticket hoping you can help me since this wasnt a death to normal gameplay. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66d685e3-bdf8-45cd-8dd3-53c1c521ab1a	402	Sid	Sid#1297	189543984090054656	DomiNATION #1 - Island	COMPLETE	11AM - 11PM CST	Element from Event	05/11/2020 09:43	05/11/2020 13:05	Ford	Ford	05/11/2020 13:54	\N	\N	\N	\N	May 8th, 2020: Late Night Overseer Event Map: DomiNATION Island (Beginners) Server	DomiNATION #1 - Island	No	25191 170436 -12210 -13.08 -20.05 & 1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65dd6ff3-090d-40fa-8e23-40b051c3d84d	414	antBEAST3	antBEAST_yt#9142	278326974450106368	DomiNATION #4 - Aberration	COMPLETE	CST	General Support Ticket	05/12/2020 07:55	05/12/2020 08:04	Frank	Frank	05/12/2020 08:04	Scorpio	68755 -80620 26871 -74.30 -5.60	Died, friends came to save me, joined their tribe to ride backseat of rock drake, can't get back on mine because I'm not in that tribe anymore.	Asked friends for help.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4826ad1c-4f74-4f48-a100-8697ae42beac	400	Adrianna	Adrianna#2685	140527389108076544	DomiNATION #6 - Patreon Ragnarok	COMPLETE	EST	Patreon Monthly Dino	05/11/2020 03:02	05/12/2020 13:32	ShiftyG	ShiftyG	05/12/2020 13:48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Unicorn	No	na	na	na	na	na	na	Female	-286887 67098 -13712 -155.90 -35.82  pin 5482	krexanna@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b9d9b4e5-031e-486a-98b2-c0e44ccd6e90	407	Dragon_Bash	Ski_skas4#9029	687024156721807401	DomiNATION #9 - Valguero	COMPLETE	1200 to 1500 central 	Element from Event	05/11/2020 15:22	05/12/2020 14:18	ShiftyG	ShiftyG	05/12/2020 14:22	\N	\N	\N	\N	May 9th, 2020 7PM CST Name: Primetime Overseer Event	DomiNATION #9 - Valguero	Yes	-204846 269731 -3437 -139.11 -15.90 pincode 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53ef5d9e-4c94-49bd-9dc2-df6203d7e676	409	Liz	liz#3801	596710360891785219	DomiNATION #8 - Patreon Extinction	COMPLETE	4:30-8:00 p EST	General Support Ticket	05/11/2020 15:28	05/12/2020 14:23	ShiftyG	ShiftyG	05/12/2020 14:29	Tres Leechy	-157121 -242904 -120864 -147.36 -2.28	Contact Admins Parasaur	Put in a ticket, turned mating off	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
adb9a143-f608-4058-b8ae-e1de56d82d4e	412	MrNormis	Mr.Normis#3244	290648402683887620	DomiNATION #1 - Island	COMPLETE	MST	Element from Event	05/11/2020 21:00	05/13/2020 08:34	Ford	Frank	05/17/2020 02:30	\N	\N	\N	\N	Late Night Boss Battle	DomiNATION #1 - Island	No	246325 150478 -13385 -150.48 -14.44 Pin= 1339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8556d53b-36f8-4bb0-a583-3484519f635b	410	Ledyin	Ledyin#0854	125300565692383232	DomiNATION #1 - Island	COMPLETE	EST Varied	Transfer Element	05/11/2020 18:08	05/12/2020 14:47	ShiftyG	ShiftyG	05/12/2020 15:40	\N	\N	\N	\N	\N	\N	\N	\N	710	DomiNATION #1 - Island	252519 189455 -14246 171.57 -26.85 PIN:1206	DomiNATION #6 - Patreon Ragnarok	299227 -403704 3375 93.99 -34.97 PIN:1206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
774cb714-af93-4fce-9dee-9ed3884185af	406	shrimptaco	Shrimptaco#9696	314645165471956992	DomiNATION #9 - Valguero	COMPLETE	8am-8pm  central daylight time	General Support Ticket	05/11/2020 11:53	05/12/2020 18:43	Cowdog	Frank	05/17/2020 02:20	Taco Tuesday	108639 62578 -6261 -89.33 -2.18	Birds knocked out due to violation.	I destroyed the extra boat that we had.  I also had a question about our builds on the server. I want to make sure we don't get another scary parasaur in our base  Can message me anytime in discord or meet on server.  thank you! :) 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00700064-a091-423c-ab3c-c12d843899fa	419	Joe Exotic	lathrop76#4777	562363727349809152	DomiNATION #9 - Valguero	COMPLETE	CST	General Support Ticket	05/12/2020 14:31	05/13/2020 08:39	Ford	Ford	05/13/2020 08:45	Tiger Kingz	263518 -201306 -1579 75.53 -11.88	Admin Para removal	Submitted this ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
01e6c2de-a68f-42ee-99b6-53be5d766e1d	417	xRevolveR	xRevolveR#2176	228323212876840961	DomiNATION #13 - Genesis	COMPLETE	1PM - 12AM East Coast	Transfer Element	05/12/2020 13:09	05/13/2020 08:46	Ford	Ford	05/13/2020 08:58	\N	\N	\N	\N	\N	\N	\N	\N	500	DomiNATION #13 - Genesis	322940 215932 3295 -20.05 -15.53	DomiNATION #7 - Extinction	231658 268038 -45282 129.46 7.43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
030c7778-5c98-4262-805f-39672809be6b	413	mejestic	SkyLord#5553	297906070251372546	DomiNATION #4 - Aberration	COMPLETE	5pm-10pm ect	General Support Ticket	05/12/2020 06:13	05/14/2020 15:35	Nast	Nast	05/14/2020 15:36	skylord	-27178 -191157 51651 110.52 -42.71	lost my suff went to My base to logout then log back in it say die with back to my green light at my base	not	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
eb0a1049-d2a0-4a05-8f8b-12178912a161	415	Sodule	Sodule#1304	286636276658995200	DomiNATION #6 - Patreon Ragnarok	COMPLETE	12PM-6AM CST	Patreon Monthly Dino	05/12/2020 10:31	05/14/2020 15:56	Nast	Nast	05/14/2020 15:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	Mosasaurus	No	na	na	na	na	na	na	Female	190750 -51243 32316 103.45 -16.51	veiwerofsoul@hotmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5e499707-55bc-474c-bd73-baed0eecba0c	418	Solenya 	MagicHat9#4896	284446617174671362	DomiNATION #5 - Ragnarok	CANCELLED	Central	General Support Ticket	05/12/2020 13:23	05/17/2020 12:00	Cowdog	Cowdog	05/17/2020 12:02	Taco Tuesday	Na	Need to add tribe mate to tribe	I’m out of state and need someone to reset my tribe counter so it doesn’t become demolishable, when I made transferee to rag from valguero it didn’t transfer the tribe. 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7f2dac44-cf2e-4100-b9f5-e92a7b54e40f	408	ladyjuice	pressurejuice#1167	237767834988445696	DomiNATION #9 - Valguero	COMPLETE	1000 to 1500 central time	Element from Event	05/11/2020 15:24	05/12/2020 14:36	ShiftyG	ShiftyG	05/12/2020 14:41	\N	\N	\N	\N	May 9th, 2020 7PM CST Name: Primetime Overseer Event	DomiNATION #4 - Aberration	Yes	-152026 -31985 44931 77.88 -28.30 pincode 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5fa94ed7-0ca7-4d7b-bd06-e9e8da39ad48	420	SpicyTuna37	SpicyTuna37#7233	490205001587752981	DomiNATION #7 - Extinction	COMPLETE	12PM - 9PM MST	Transfer Element	05/12/2020 18:04	05/13/2020 08:46	Ford	Ford	05/13/2020 09:05	\N	\N	\N	\N	\N	\N	\N	\N	300	DomiNATION #7 - Extinction	-8700 -28103 -13044 13.08 -30.00	DomiNATION #9 - Valguero	-175253 -121924 -1105 130.92 -35.28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c4f33f4d-4742-4f52-8d61-ac4c324052f8	376	Tarnak	Borealis#2584	617077099219648512	DomiNATION #1 - Island	CANCELLED	7 am - 12 am est	General Support Ticket	05/09/2020 08:46	05/12/2020 18:29	Cowdog	Borealis	05/13/2020 15:58	WIP	None available	Ill provide a link to the dino I lost, I am assuming something with the island transfering affected the dino. But I have no idea how its saying it died on extinction. I have no logs anywhere for the dead dino starving, being killed, ect. Here is a link and I will gladly be here to help provide more info if I can! https://ark.spectrumdominus.com/server/8/dino/442903296	I have looked on the website and checked the tribe logs to look for its whereabouts or cause of death.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41c7e999-006e-4cb6-a2e2-669e9604d18b	425	Tarnak	Borealis#2584	617077099219648512	DomiNATION #7 - Extinction	COMPLETE	7 am - 12 am est	Transfer Element	05/14/2020 11:31	05/14/2020 13:37	BeOurGuest	BeOurGuest	05/14/2020 14:27	\N	\N	\N	\N	\N	\N	\N	\N	3000	DomiNATION #7 - Extinction	-31561 6471 -21202 -12.60 13.04 - - PIN 1470	DomiNATION #8 - Patreon Extinction	73964 56117 -35877 68.46 -14.14 - - PIN 1470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28fddc6b-85a5-4eaf-9269-5c7adccf9fdd	421	SpicyTuna37	SpicyTuna37#7233	490205001587752981	DomiNATION #5 - Ragnarok	CANCELLED	12PM - 9PM MST	Transfer Element	05/13/2020 12:38	05/13/2020 16:39	Cowdog	Cowdog	05/14/2020 05:31	\N	\N	\N	\N	\N	\N	\N	\N	636	DomiNATION #5 - Ragnarok	-420189 -409251 -14352 121.10 -33.30	DomiNATION #9 - Valguero	-175239 -121927 -1105 133.61 -40.36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17b12747-ce53-4642-a030-03b99153ad60	431	Bumble Bitch	Yug#6759	421814680034738187	DomiNATION #9 - Valguero	COMPLETE	3Pm - 2 AM West Coast	Ban Appeal	05/14/2020 15:15	05/14/2020 15:26	Zylana	Zylana	05/14/2020 15:26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	76561198829422600	none	Non-tolerated dino names	Im sorry, didnt think i would get banned that fast, just memeing, wasnt anything serious.	\N	\N	\N	\N	\N
570d0953-6a06-4a06-a89f-f69aa8b72ce5	423	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Patreon Monthly Dino	05/14/2020 06:32	05/14/2020 06:52	ShiftyG	ShiftyG	05/14/2020 07:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Rock Elemental	Yes	22	22	22	22	22	22	Doesn't matter	 -305087 317912 -19919 -38.23 1.24    Pin Code 2302	Coolquill38@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
aa31ed18-8bc4-4bfc-a59a-a7983f131a35	416	shrimptaco	Shrimptaco#9696	314645165471956992	DomiNATION #5 - Ragnarok	CANCELLED	8am-8pm  central daylight time	General Support Ticket	05/12/2020 11:05	\N	\N	Shrimptaco	05/14/2020 10:42	Taco Tuesday	-210551 289647 -14293 102.58 -11.76	My tribemate left for vacation.  I'm trying to reset timer on his base.  I'm not in the tribe for some reason.  First time coming to his base.  Clustered tribe.	Put in a ticket.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bf171795-bb83-4c60-a02c-8ab57dc5fd1b	428	punz	punz#2980	236887526441222144	DomiNATION #1 - Island	CANCELLED	12pm-6pm	General Support Ticket	05/14/2020 14:09	05/14/2020 14:10	BeOurGuest	punz	05/14/2020 14:13	Octopus	-280001 -240019 -13631 140.74 -8.09	I have 2 Carnos and 2 Yutys stuck in a crevice. I was hoping to get a tp back to my bass location at: -265002 -51377 -14172 65.17 -6.86	Tried to have the dinos follow and climb out myself. Just very stuck, sorry for the inconvience.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e5c6b62b-a115-4819-8721-89579c18662e	424	Sid	Sid#1297	189543984090054656	DomiNATION #1 - Island	COMPLETE	11AM - 11PM CST	Transfer Element	05/14/2020 11:29	05/14/2020 13:37	BeOurGuest	BeOurGuest	05/14/2020 14:14	\N	\N	\N	\N	\N	\N	\N	\N	2269	DomiNATION #7 - Extinction	-31477 5872 -21203 0.64 -20.65 & 1472	DomiNATION #1 - Island	25182 170432 -12210 -9.35 -14.76 & 1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66250f97-6b8b-46ec-b3b9-efca0be82b55	427	Raven	Cyanide#3346	232882703127543808	DomiNATION #9 - Valguero	OPEN	after 1pm Central	General Support Ticket	05/14/2020 13:43	05/14/2020 15:37	Nast	\N	\N	Mana Addicts	219504 201440 -4903 -41.00 0.41	I was on the Center when it relocated and lost all of my points towards engrams not on the center. I was at -850 points.	I mindwiped and relevled. It did not help i now have all of the Island engrams with only 72 left over	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dbfebb2b-0f80-4b17-8b1d-08d118ab588d	430	Bumble Bitch	Yug#6759	421814680034738187	DomiNATION #9 - Valguero	COMPLETE	3Pm - 2 AM West Coast	Ban Appeal	05/14/2020 15:15	05/14/2020 15:25	Nast	Zylana	05/14/2020 15:27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	76561198829422600	none	Non-tolerated dino names	Im sorry, didnt think i would get banned that fast, just memeing, wasnt anything serious.	\N	\N	\N	\N	\N
ea81d25c-7228-42bd-8826-68023b07267f	426	Johnnythemaniac	JohnnyTheHomicidalManiac#7852	194450073759907840	DomiNATION #6 - Patreon Ragnarok	COMPLETE	2pm est -5pm est	Transfer Element	05/14/2020 13:06	05/14/2020 15:30	Cowdog	Cowdog	05/14/2020 15:57	\N	\N	\N	\N	\N	\N	\N	\N	1500	DomiNATION #6 - Patreon Ragnarok	-438588 89129 -14337 -21.46 -21.91 (element&pat request drop off)(pin 4311)	DomiNATION #1 - Island	224642 -4415 -8294 92.99 -21.67( tek gen)(pin 4311)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5f2c1008-7561-4ba3-afbb-efa2216a521b	422	THENOOBSUPER	THENOOBSUPER#1842	109425971169386496	DomiNATION #4 - Aberration	COMPLETE	7-10pm Central	Bug Report	05/13/2020 20:47	05/13/2020 20:54	BeOurGuest	BeOurGuest	05/14/2020 16:38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	For some reason the metal Floor I built a forge on auto-decayed  with about 15k metal mostly worried about the forge as we have been active every day and passed by it every day as we need metal for one thing or another	Wouldn't want to recreate this honestly...	only proof I have of the Forge is the one auto decayed metal floor unfortunately	\N	\N
6755fd8c-722d-4929-8fc7-de498c69321c	432	JCBBlueDevil	JCBBlueDevil#4290	275127176276213760	DomiNATION #9 - Valguero	COMPLETE	1000-2200 PDT	General Support Ticket	05/14/2020 17:06	05/14/2020 18:31	Nast	Nast	05/14/2020 18:31	Dodo Nation	185572 -297485 -53864 51.71 -18.23	I was breeding magmasaurs yesterday in the fire wyvern cavern on Valguero and one of the eggs ended up clipping through the map. i checked out of curiosity and the egg is still there today.	tried using a whip to retrieve it, threw down multple ptera eggs to try and "pick up all". i figured it would get despawned after time or server wipe but its still there.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53bc42fa-ecba-4da9-b0c7-22b8c58c319f	433	Jazz	Jazz#1909	495341153890205696	DomiNATION #6 - Patreon Ragnarok	COMPLETE	cst	Transfer Element	05/14/2020 18:51	05/15/2020 17:39	Cowdog	Cowdog	05/15/2020 22:20	\N	\N	\N	\N	\N	\N	\N	\N	830	DomiNATION #8 - Patreon Extinction	73107 56507 -35877 72.10 -30.30	DomiNATION #6 - Patreon Ragnarok	-349237 -427451 -11776 -6.24 -39.04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6476c4a0-1ba1-4b7e-980d-c13ff90cd0d4	434	Froppy	♛Queenie♛#4663	360603244956745729	DomiNATION #8 - Patreon Extinction	COMPLETE	9am-9pmCST	Transfer Element	05/14/2020 19:15	05/15/2020 18:50	Ford	Ford	05/15/2020 19:35	\N	\N	\N	\N	\N	\N	\N	\N	3306	DomiNATION #8 - Patreon Extinction	44167 -1348 -5310 169.15 -14.76 Pin-Code: 1133	DomiNATION #6 - Patreon Ragnarok	-245381 274575 -13847 174.99 -13.87 Pin-Code: 1133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
a94ef31e-e73a-4b42-8c4e-c314f2ffb9f1	429	Mouse	Chronic Storm#5947	266373461918613506	DomiNATION #6 - Patreon Ragnarok	COMPLETE	4pm-10pm cst	General Support Ticket	05/14/2020 14:18	05/14/2020 15:35	ShiftyG	ShiftyG	05/15/2020 13:44	Pandemic	unknown	Frosbite can have whatever he wants out of my bases	open a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34a69651-3cc3-4a0b-8b9c-a63d12d1c5d2	439	Enmity	Enmity#8275	267127640098340864	DomiNATION #3 - Scorched Earth	COMPLETE	EST 1800-0000	General Support Ticket	05/15/2020 17:11	05/15/2020 17:11	Cowdog	Cowdog	05/15/2020 17:33	The Dune Crawlers	7844 -238290 -20881 -93.80 -0.81	Dinos lost underground...	Tried punching, cryo, etc. Cant raise them above ground.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
cc66e30b-bb24-46b5-9cee-58c216623c76	441	Guics	Guics#2756	459852910373896193	DomiNATION #5 - Ragnarok	NEW	6 PM - 10 CST	Bug Report	05/15/2020 21:59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I keep dying after leaving Ice queen cave waterfalls exit, I already lost 2 owls and 2 thylas		Yes, lost all the cave drops and 4 dinos, [Guics] ( Owl), Cave Runner (thyla) and ascendant fur	\N	\N
7765ad72-47f3-4d90-bc79-cdb18f4da41d	447	MoshPit	darthmosher#9054	289936248339169280	DomiNATION #4 - Aberration	COMPLETE	1pm-8pm Central	General Support Ticket	05/16/2020 11:55	05/16/2020 11:57	Zylana	Zylana	05/16/2020 12:04	Jurassic Flux	-209276 -43269 54681 62.69 -9.63	Please TP me and my tribemate back to Ragnarok #5.  We will pay anything.  We came here for the first time to check it out for the boss battle tonight so that we can learn tek engrams for teleport.  not realizing we are basically stuck here.	Tried to find a drop, no luck.  died several times and lost our mounts.  we just want back to Rag #5 thank you.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1db151cb-e27f-4ea3-b8f1-f00093a6bb3d	451	Laki	Laki x2#3739	177643013068029952	DomiNATION #5 - Ragnarok	COMPLETE	12-6 PM CST	Element from Event	05/16/2020 15:31	05/16/2020 16:09	Ford	Ford	05/16/2020 17:44	\N	\N	\N	\N	May 8 2020 Late Night Boss Event	DomiNATION #5 - Ragnarok	No	-76886 126043 21502 12.98 -9.86 Pin:3473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28bad8a4-3deb-44b3-abae-170172961112	493	Baz	filiwegeian#3521	235655638317924352	DomiNATION #5 - Ragnarok	COMPLETE	ASAP	General Support Ticket	05/19/2020 20:24	05/19/2020 20:34	BeOurGuest	BeOurGuest	05/19/2020 20:41	Tribe of Ladyjuice	-130458 -210795 9946 18.86 29.33	We are trapped by a hole in the map in the ice cave.	Everything	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2f2c813c-425a-4213-949e-421298357f93	448	shrimptaco	Shrimptaco#9696	314645165471956992	DomiNATION #9 - Valguero	COMPLETE	8am-8pm  central daylight time	General Support Ticket	05/16/2020 13:37	05/17/2020 02:07	Frank	Frank	05/17/2020 02:20	Taco Tuesday	108639 62578 -6261 -89.33 -2.18	My fliers are all asleep from violations.  	destroyed AB base and stairs leading to wooden marina.  Should be up to code now!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36cd4bcc-db21-42ce-99b1-93e3c59684d6	435	Frostbite	XxFrostbitexX#8513	122078258983469058	DomiNATION #6 - Patreon Ragnarok	COMPLETE	anytime	Patreon Insurance Request	05/15/2020 11:08	05/17/2020 02:32	Frank	Frank	05/17/2020 02:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/6/dino/400251343	jessepcvfd6@gmail.com	Not sure but within the past month or 2	I used the euth gun on it not realizing which one it was. Thought it was one of the others that I didn't need anymore. 	\N	\N	\N	\N	\N	\N	\N	\N	\N
20762625-4623-45a7-a407-ecd421d54a22	436	DNA	南瓜ya#2058	250069696198606848	DomiNATION #1 - Island	COMPLETE	7PM-9PM EST	General Support Ticket	05/15/2020 15:57	05/17/2020 02:42	Frank	Frank	05/17/2020 03:15	Tribe of DNA	291480 -60884 -14018 74.44 -15.65	Admins left a sign for me to contact admins	Contact	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bc884148-7684-46ad-8f97-dd52aa267305	440	Vinar	FForgotten#0867	267400631612997643	DomiNATION #5 - Ragnarok	OPEN	8PM CST	General Support Ticket	05/15/2020 20:58	05/17/2020 03:30	Frank	\N	\N	Tribe of Vinar	-145865 -364968 9520 68.72 -27.95	I forgot to unclaim my owl before leaving tribe.	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6ad6dc06-ef0c-409c-947f-7bf1cdbb29d6	438	Fatman101	Fatman101#3792	439974141072769058	DomiNATION #5 - Ragnarok	COMPLETE	9:30PM-10:45EST 	Patreon Insurance Request	05/15/2020 16:54	05/17/2020 03:28	Frank	Frank	05/17/2020 03:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://ark.domination-gaming.com/server/1/dino/291641775	anthony@nouturn.com		I left it in a cryopod for too long cus I'm an idiot. 	\N	\N	\N	\N	\N	\N	\N	\N	\N
d29d2999-00ae-4aed-adca-432dff993b58	445	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Patreon Monthly Dino	05/16/2020 07:52	05/17/2020 03:41	Frank	Frank	05/17/2020 03:48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Velonasaur	No	na	na	na	na	na	na	Female	-305087 317912 -19919 -38.23 1.24 Pin Code 2302	Coolquill38@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
125c9a81-4fc1-4181-a4a4-5c9dc52b2b92	443	Zeek	Zeek#3211	344560288412205057	DomiNATION #8 - Patreon Extinction	COMPLETE	5PM-9PM EST	Transfer Element	05/16/2020 06:20	05/17/2020 03:39	Frank	Frank	05/17/2020 03:40	\N	\N	\N	\N	\N	\N	\N	\N	500	DomiNATION #6 - Patreon Ragnarok	391837 -425587 -5367 -73.24 -18.64 PIN: 5544	DomiNATION #8 - Patreon Extinction	-116490 -54821 -20851 -25.18 -10.25 PIN: 5544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81ec1250-0ff7-4713-8016-114ab4ceb4c7	453	Barbequeque	Barbequeque#1570	114238908467904518	DomiNATION #5 - Ragnarok	COMPLETE	UTC-700	General Support Ticket	05/16/2020 22:10	05/17/2020 04:04	Frank	Frank	05/18/2020 02:35	HasuNyan	-197233 -399967 -12601 -15.81 -4.22	Player named MUZI is at my base and won't leave me alone. Also suspect he drug my unconscious tribemates body out and drowned it.	Asked him to leave, asked about it in #admin_support	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9f1a704a-a732-4001-9102-7e9c108c7835	444	Han	Haldirin#2224	322193044570898434	DomiNATION #13 - Genesis	COMPLETE	Any time  CST	Patreon Monthly Dino	05/16/2020 07:51	05/17/2020 03:40	Frank	Frank	05/17/2020 03:48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #13 - Genesis	Velonasaur	No	na	na	na	na	na	na	Male	-305087 317912 -19919 -38.23 1.24 Pin Code 2302	Coolquill38@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
af10bbfe-0e0d-4e1b-9f4a-7447b6722882	450	mejestic	AceSpades#8119	612659894155345955	DomiNATION #5 - Ragnarok	COMPLETE	5pm-10pm ect	Element from Event	05/16/2020 13:56	05/16/2020 16:09	Ford	Frank	05/17/2020 04:00	\N	\N	\N	\N	Late Night Rockwell Event 	DomiNATION #5 - Ragnarok	No	422552 -328679 -14179 177.32 -54.19 PIN code 4208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8cccaf47-acf9-4a97-8d00-916b69726811	452	mejestic	AceSpades#8119	612659894155345955	DomiNATION #1 - Island	CANCELLED	5pm-10pm ect	Transfer Element	05/16/2020 18:13	05/17/2020 03:50	Frank	AceSpades	05/17/2020 11:50	\N	\N	\N	\N	\N	\N	\N	\N	1072	DomiNATION #1 - Island	-50740 -7864 58449 87.24 -12.10  PIN 4208 Is a storage box small	DomiNATION #5 - Ragnarok	421614 -328550 -14179 -93.08 -44.45 pin code 4208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c5e00c10-55f5-4d11-8f06-abba9e500623	437	Draco	Tower#4173	494648577138753566	DomiNATION #9 - Valguero	CANCELLED	CST	Patreon Monthly Dino	05/15/2020 16:39	05/17/2020 03:17	Frank	Tower	05/18/2020 05:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #9 - Valguero	X-Tapejara	No	na	na	na	na	na	na	Female	151652 104236 -14320 -72.17 -14.58    pin 0603	torganrose82@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ab6a321-d7b1-4fb6-9d48-569a2378c4c2	494	Baz	filiwegeian#3521	235655638317924352	DomiNATION #9 - Valguero	NEW	N/A	Bug Report	05/20/2020 11:20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Pumps placed on the oil vein in the back right corner of the oil cave on Valguero are inaccessible. Even when you are the one to place them. The location of the vein is: -268300 -6278 -4897 -19.86 -40.41	I've attempted to place a pump there and not been able to access the inventory. I have also been unable to access the inventory of unlocked pumps placed by other tribes.	No	\N	\N
21544566-743c-4ca6-8799-678795a3504c	442	gary busey	prowaterbuffalo#6885	169610605571997696	DomiNATION #6 - Patreon Ragnarok	COMPLETE	cst	Patreon Monthly Dino	05/15/2020 22:17	05/17/2020 03:31	Frank	Frank	05/17/2020 03:38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #6 - Patreon Ragnarok	X-Yutyrannus	No	na	na	na	na	na	na	Male	-287597 -444292 -14227 -72.03 -29.68        PIN: 3233 - thank ya much	jackricexc@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
c2ae8423-0dea-486b-b579-91dc383d874a	460	Liz	liz#3801	596710360891785219	DomiNATION #5 - Ragnarok	COMPLETE	4:30-8:00 p EST	Transfer Element	05/17/2020 10:54	05/17/2020 11:30	Zylana	Zylana	05/17/2020 11:39	\N	\N	\N	\N	\N	\N	\N	\N	1182	DomiNATION #5 - Ragnarok	-400970 -419874 -14183 -156.79 -6.23 PIN 0302	DomiNATION #8 - Patreon Extinction	-155495 -238141 -120717 130.25 -20.12 PIN 0302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306ff385-ead8-42e0-91ec-734e99ef95c4	455	xRevolveR	xRevolveR#2176	228323212876840961	DomiNATION #7 - Extinction	COMPLETE	1PM - 12AM East Coast	Element from Event	05/17/2020 08:53	05/17/2020 09:46	Cowdog	Cowdog	05/17/2020 09:55	\N	\N	\N	\N	Latenight Rockwell Event	DomiNATION #7 - Extinction	Yes	234565 269893 -43065 41.76 -9.24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
259e5392-fbd4-40b6-90e9-cc2c5f0ebf0b	456	Oddin	TheOddMe#7614	219811551186649089	DomiNATION #7 - Extinction	COMPLETE	always on	Element from Event	05/17/2020 08:53	05/17/2020 09:45	Cowdog	Cowdog	05/17/2020 09:55	\N	\N	\N	\N	late night rockwell event friday	DomiNATION #7 - Extinction	Yes	234565 269893 -43065 41.76 -9.24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ba040802-bf2a-4c8c-a467-4c6d01c3313d	457	OlDirtyBastard	Wutang#2150	120000216270241796	DomiNATION #7 - Extinction	COMPLETE	1pm East Coast	Element from Event	05/17/2020 09:54	05/17/2020 09:55	Cowdog	Cowdog	05/17/2020 09:58	\N	\N	\N	\N	 Latenight Rockwell 5/15	DomiNATION #7 - Extinction	Yes	234565 269893 -43065 41.76 -9.24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2122df3a-b113-41f5-985b-0ed91f7e542b	459	Kraft	kraft#9271	247281589912862720	DomiNATION #4 - Aberration	COMPLETE		Transfer Element	05/17/2020 10:16	05/17/2020 11:32	Zylana	Zylana	05/17/2020 11:46	\N	\N	\N	\N	\N	\N	\N	\N	1427	DomiNATION #4 - Aberration	79307 -178294 43752 -140.68 -15.98    pin:1522	DomiNATION #5 - Ragnarok	-65260 189615 12720 -58.12 10.39       pin:1522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3db4ef78-d160-442b-b829-493bb650581b	458	Struggler	The Struggler#1387	277855875861970945	DomiNATION #13 - Genesis	COMPLETE	11am -10pm east cost	Element from Event	05/17/2020 09:56	05/17/2020 09:58	Cowdog	Cowdog	05/17/2020 10:06	\N	\N	\N	\N	late night rockwell	DomiNATION #13 - Genesis	Yes	324784 215754 966 93.41 -8.55 1255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e95f5cb7-f04c-4794-9d7d-528471087400	449	Tarnak	Borealis#2584	617077099219648512	DomiNATION #8 - Patreon Extinction	COMPLETE	7 am - 12 am est	General Support Ticket	05/16/2020 13:54	05/17/2020 10:16	Cowdog	Cowdog	05/17/2020 10:22	WIP	-51868 18755 72214 176.83 -12.61	Something is bugged with the first (left side) public tek forge and wont allow a que to be placed.	N/A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
dbae3c98-a113-420c-ab97-72b85869cda5	454	Dune	Torgames#9123	268994711455399936	DomiNATION #9 - Valguero	COMPLETE	11am - 2am CST	Element from Event	05/17/2020 08:35	05/17/2020 09:46	Cowdog	Cowdog	05/17/2020 10:37	\N	\N	\N	\N	Friday, May 15 10:30pm   Late Night Rockwell Event	DomiNATION #9 - Valguero	Yes	151530 105988 -14322 102.78 -15.70   pin 1031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4ef1e57a-83b7-440f-a2ac-e9681073e508	461	Chad	somebeach#4980	337303041080557571	DomiNATION #5 - Ragnarok	COMPLETE	East coast	Element from Event	05/17/2020 11:24	05/17/2020 11:29	Zylana	Zylana	05/17/2020 11:29	\N	\N	\N	\N	The late night event from friday	DomiNATION #5 - Ragnarok	No	49382 258387 32253 91.92 -8.94	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3819a8d7-85dd-4f9e-8cdf-942e6aca4a5b	470	WZK	WZK#7430	688223029905588386	DomiNATION #8 - Patreon Extinction	NEW	8AM-8PM Central on Thursday/Friday/Saturdays	General Support Ticket	05/17/2020 14:17	\N	\N	\N	\N	The Royals	-207688 -248976 -120863 -63.31 -9.05	Admin TP/Generator Demo-able (asking for it to possibly be re-located)	NOT DEMO THE ADMIN STUFF lol :) and make a ticket	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23d738b6-98b2-4dac-9547-a19ebca44031	462	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #5 - Ragnarok	COMPLETE	3pm-11pm central weekdays 7am-10pm weekends	Element from Event	05/17/2020 11:39	05/17/2020 11:47	Zylana	Zylana	05/17/2020 11:47	\N	\N	\N	\N	May 16th Rockwell	DomiNATION #5 - Ragnarok	Yes	-335534 -448775 -12274 -84.13 -14.44           Pin# 0000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
489aeaa6-8686-4b6c-9df9-73aa80c4dac9	446	Ace	Ace0mac#8931	292843159518576640	DomiNATION #13 - Genesis	OPEN	9am - 8pm west cost	General Support Ticket	05/16/2020 08:24	05/17/2020 12:01	Zylana	\N	\N	Infinity	-271303 -379015 -26488 157.17 -3.35	My Giga is stuck in the Lunar Biome falling and teleportation over and over but its not going the the teleport location the the players are going to. In spending hours trying to retrieve it I now have a Managarmr and a Spider stuck there also. The fall and teleport in place but they don't go to the ledge. they just keep falling and I can seem to get to them.. Dino names is and Unnamed 360 GIga Male, and Aceagarmr 	I spent hours trying to get the dinos back but. I see them and i can get close, but it teleports me before i can get close enough to mount them.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
f1b73e0b-0f8f-4324-b1f8-362886df45e0	473	Mr T	Mr T#9320	572959776967884802	DomiNATION #1 - Island	COMPLETE	4pm-10:30pm pst	Element from Event	05/17/2020 15:54	05/17/2020 22:41	BeOurGuest	BeOurGuest	05/17/2020 22:43	\N	\N	\N	\N	Friday night rockwell	DomiNATION #1 - Island	No	-79544 179847 -11287 113.94 -30.67      Pin#1111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e240129f-1401-417c-b48b-722a4c1ab9fa	471	Talaure	Talaure#8560	692186228346454036	DomiNATION #1 - Island	COMPLETE	16:00-22:00	Element from Event	05/17/2020 14:30	05/17/2020 22:51	BeOurGuest	BeOurGuest	05/17/2020 22:53	\N	\N	\N	\N	Fridaw 5/15/20	DomiNATION #1 - Island	Yes	292612 266914 -12753 -98.96 -11.17 Pin 1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3aa6e6d0-bc47-43f9-97a6-c70e6ac8740f	469	Poni	DreEl#5238	330546780758343680	DomiNATION #1 - Island	COMPLETE	 4pm to 2am eastern	Element from Event	05/17/2020 12:41	05/17/2020 22:54	BeOurGuest	BeOurGuest	05/17/2020 22:55	\N	\N	\N	\N	May 15th Late night Rockwell	DomiNATION #1 - Island	Yes	256882 246599 -14018 -111.24 -43.60  pin 4321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
468f39ed-6654-4d6f-a910-df96dec879df	468	Jima	Jima (Eren)#4141	279750700089475075	DomiNATION #1 - Island	COMPLETE	1pm - 10pm EST	Element from Event	05/17/2020 12:23	05/17/2020 22:57	BeOurGuest	BeOurGuest	05/17/2020 22:57	\N	\N	\N	\N	I attended the Friday, May 15th late night event 	DomiNATION #1 - Island	Yes	-184358 -10877 -3340 172.16 -23.12 and 2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9a552faf-ec5c-4f75-899c-49f7d3606770	465	Jaeger	Jaeger#1312	296834414376124417	DomiNATION #4 - Aberration	COMPLETE	West Coast	Element from Event	05/17/2020 11:47	05/17/2020 22:59	BeOurGuest	BeOurGuest	05/17/2020 23:03	\N	\N	\N	\N	Late Night Rockwell Friday 15 May 2020	DomiNATION #4 - Aberration	No	-162160 -44590 44045 116.73 -3.91 Pin#3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e1866de1-6888-49ce-95c3-08070d877493	463	Robert	lxXxROBERTxXxl#2359	479811562010574858	DomiNATION #8 - Patreon Extinction	COMPLETE	east coast	Element from Event	05/17/2020 11:44	05/17/2020 23:11	BeOurGuest	BeOurGuest	05/17/2020 23:11	\N	\N	\N	\N	8:00pm   Prime Time Rockwell Event When Sat, May 16, 8:00pm – 8:30pm Where ＃4 DomiNATION Aberration SERVER	DomiNATION #8 - Patreon Extinction	Yes	-28370 -42984 16557 69.51 -18.64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
705d13ae-2c56-478c-96ab-9438623ab41c	466	mejestic	SkyLord#5553	297906070251372546	DomiNATION #1 - Island	COMPLETE	5pm-10pm ect	Transfer Element	05/17/2020 11:56	05/19/2020 08:52	ShiftyG	ShiftyG	05/19/2020 09:05	\N	\N	\N	\N	\N	\N	\N	\N	1072	DomiNATION #1 - Island	-267698 249878 -11668 19.83 -35.04 pin code 4208	DomiNATION #5 - Ragnarok	421624 -328515 -14179 -107.53 -33.89 PIN code 4208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b46cf33a-8418-4902-b656-89f7504bba75	481	ThreeShot	ThreeShot#8711	557744032621658123	DomiNATION #4 - Aberration	NEW	12:00PM-11:00PM EST 	General Support Ticket	05/17/2020 20:17	\N	\N	\N	\N	Tribe Of ThreeShot	-178110 -30494 43211 136.87 -0.97	Person Built over Rare Resources	Given them hard proof about it and they are saying "They need to be taught a lesson like a naughty boy" and doesn't care if they get wiped or not	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5058cb93-8a0f-43f8-94b2-a0ce3678f2f3	476	Stefin047   (daughter of MoshPit)	darthmosher#9054	289936248339169280	DomiNATION #5 - Ragnarok	COMPLETE	4pm-8pm Central	Element from Event	05/17/2020 16:30	05/17/2020 22:32	BeOurGuest	BeOurGuest	05/17/2020 22:33	\N	\N	\N	\N	Saturday May 16 prime time Rockwell event 7pm	DomiNATION #5 - Ragnarok	No	-10876 -372027 23692 -171.74 -19.58 PIN: 0550   (This is MoshPit, my 11 y/o daughter is Stefin047, she doesnt have discord)  Thank you!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143beb3c-7406-4791-b21e-18c54ac56f4a	483	WZK's WIFE	WZK WIFE#8505	701918031257010257	DomiNATION #8 - Patreon Extinction	COMPLETE	8AM-8PM Central on Thursday/Friday/Saturdays	Element from Event	05/17/2020 21:03	05/17/2020 22:06	BeOurGuest	BeOurGuest	05/17/2020 22:09	\N	\N	\N	\N	Date: May 15th, 2020 1030PM CST Name: Late Night Rockwell Event	DomiNATION #8 - Patreon Extinction	Yes	73964 56117 -35877 68.46 -14.14   PIN: 1470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99517d0c-ffc3-447c-967a-656876c73b5b	482	Tarnak	Borealis#2584	617077099219648512	DomiNATION #8 - Patreon Extinction	COMPLETE	7 am - 12 am est	Element from Event	05/17/2020 21:00	05/17/2020 22:10	BeOurGuest	BeOurGuest	05/17/2020 22:11	\N	\N	\N	\N	Date: May 15th, 2020 1030PM CST Name: Late Night Rockwell Event	DomiNATION #8 - Patreon Extinction	Yes	73964 56117 -35877 68.46 -14.14 - - PIN : 1470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3b4977f9-6a9d-4784-9da0-8fdd0121a9db	474	MoshPit	darthmosher#9054	289936248339169280	DomiNATION #5 - Ragnarok	COMPLETE	4pm-8pm Central	Element from Event	05/17/2020 16:28	05/17/2020 22:34	BeOurGuest	BeOurGuest	05/17/2020 22:34	\N	\N	\N	\N	Saturday May 16 prime time Rockwell event 7pm	DomiNATION #5 - Ragnarok	No	-10876 -372027 23692 -171.74 -19.58 PIN: 0550 Thank you!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172d240e-efaf-4fbc-9e2e-f08688822e31	480	C'Note	C'Note#8503	239219041749696524	DomiNATION #5 - Ragnarok	COMPLETE	9am-8pm	Element from Event	05/17/2020 19:53	05/17/2020 22:21	BeOurGuest	BeOurGuest	05/17/2020 22:21	\N	\N	\N	\N	Prime Time Rockwell Event	DomiNATION #5 - Ragnarok	No	-452373 254664 -14256 32.53 -15.64 , 6384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7b10bae3-0af8-4a54-9276-91492fc2bb2b	479	antBEAST3	antBEAST_yt#9142	278326974450106368	DomiNATION #7 - Extinction	COMPLETE	CST	Element from Event	05/17/2020 19:26	05/17/2020 22:21	BeOurGuest	BeOurGuest	05/17/2020 22:26	\N	\N	\N	\N	Friday Rockwell 5/15/2020	DomiNATION #7 - Extinction	No	-6578 585 -23786 -51.85 -36.99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e64b3873-b26f-4a17-835a-8f4ea9101bb1	475	Blondii	i_am_blondii#2085	203945057185693696	DomiNATION #7 - Extinction	COMPLETE	4pm-11pm EST	Transfer Element	05/17/2020 16:28	05/17/2020 22:36	BeOurGuest	BeOurGuest	05/17/2020 22:41	\N	\N	\N	\N	\N	\N	\N	\N	4000	DomiNATION #7 - Extinction	84432 -35339 -24516 100.15 -19.29 PIN:8844	DomiNATION #4 - Aberration	92378 -203696 49418 72.09 -25.71 PIN:8844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b3ed1e01-4a9f-4d73-9d4b-6753a9171897	478	Reapxrs	Reapxrs#4141	419291415365943306	DomiNATION #7 - Extinction	COMPLETE	4pm-2am east coast 	Transfer Element	05/17/2020 19:25	05/17/2020 22:26	BeOurGuest	BeOurGuest	05/17/2020 22:29	\N	\N	\N	\N	\N	\N	\N	\N	1000	DomiNATION #7 - Extinction	-19934 -4844 -17291 58.61 -30.50 0909	DomiNATION #2 - Center	-68259 -49151 -13783 -158.83 -10.53 0909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d121cd58-5293-4f3a-bde1-61add1a0a302	477	Baz	filiwegeian#3521	235655638317924352	DomiNATION #5 - Ragnarok	COMPLETE	8a-8p PST	Element from Event	05/17/2020 18:30	05/17/2020 22:29	BeOurGuest	BeOurGuest	05/17/2020 22:31	\N	\N	\N	\N	5/16/20 Rockwell	DomiNATION #5 - Ragnarok	No	-452323 254585 -14256 1.12 -5.51    PIN: 6384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e1be3852-011b-4096-9707-03cf3c9c157e	467	mejestic	AceSpades#8119	612659894155345955	DomiNATION #5 - Ragnarok	CANCELLED	5pm-10pm ect	Element from Event	05/17/2020 12:00	\N	\N	SkyLord	05/17/2020 22:32	\N	\N	\N	\N	Primetime Rockwell Event	DomiNATION #5 - Ragnarok	No	422521 -328554 -14179 -102.19 -35.90 pin code 4208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18789d4b-ccf4-4373-bb50-52fb43be91fb	488	Dragon_Bash	Ski_skas4#9029	687024156721807401	DomiNATION #9 - Valguero	NEW	1200 to 1500 central 	Element from Event	05/18/2020 14:01	\N	\N	\N	\N	\N	\N	\N	\N	May 16th, 2020 7PM CST Name: Primetime Rockwell Event	DomiNATION #9 - Valguero	Yes	-204896 269750 -3437 -127.30 -24.42 pin code 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8055bd3b-8014-451d-8b77-78384230c69e	472	Jazz	Jazz#1909	495341153890205696	DomiNATION #6 - Patreon Ragnarok	COMPLETE	CST	Element from Event	05/17/2020 15:11	05/17/2020 22:44	BeOurGuest	BeOurGuest	05/17/2020 22:51	\N	\N	\N	\N	Friday May 15th late night event Rockwell	DomiNATION #6 - Patreon Ragnarok	Yes	-349281 -427614 -11772 6.51 -38.95 Pin 1214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80bedfe4-a571-4b09-bde2-6ed823bf9694	464	atris	thranduin2217#8525	250460048738877440	DomiNATION #1 - Island	COMPLETE	1pm cst to 10pm cst	Element from Event	05/17/2020 11:46	05/17/2020 23:04	BeOurGuest	BeOurGuest	05/17/2020 23:07	\N	\N	\N	\N	prime time last night	DomiNATION #1 - Island	No	216996 228621 -13727 161.72 -4.11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5a8d9205-ea06-48c1-a45a-9bb65cfddbc9	485	Skyler	Cepan117#9515	335283012965105665	DomiNATION #4 - Aberration	NEW	4PM-12PM Central 	Element from Event	05/18/2020 09:59	\N	\N	\N	\N	\N	\N	\N	\N	Rockwell May 16th	DomiNATION #4 - Aberration	No	37.1lat 57lon pin 2244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
05e74520-5cf6-48a6-afe2-c5a892b71cd6	486	Mannizzle	mannizzle#6781	129845754922532864	DomiNATION #4 - Aberration	NEW	12pm - 6pm central	Element from Event	05/18/2020 10:12	\N	\N	\N	\N	\N	\N	\N	\N	Late Night Boss Event 5/15 	DomiNATION #4 - Aberration	No	-162160 -44590 44045 116.73 -3.91  PIN:3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5a2dc794-f6eb-46c6-8791-5dc33b3c580a	489	ladyjuice	pressurejuice#1167	237767834988445696	DomiNATION #3 - Scorched Earth	NEW	1000 to 1500 central time	Element from Event	05/18/2020 14:26	\N	\N	\N	\N	\N	\N	\N	\N	May 16th, 2020 7PM CST Name: Primetime Rockwell Event	DomiNATION #3 - Scorched Earth	Yes	-101976 173747 -13604 -103.89 -6.29 pincode 1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481acd23-8d49-425b-9365-7abb63372a7f	490	Enmity	Enmity#8275	267127640098340864	DomiNATION #3 - Scorched Earth	NEW	EST 1800-0000	Element from Event	05/18/2020 20:51	\N	\N	\N	\N	\N	\N	\N	\N	5/15 Rockwell	DomiNATION #3 - Scorched Earth	Yes	703 -239441 -20715 169.07 -11.21           6890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ecc33ae6-738b-4b43-a15c-99978b5af3fd	491	Baxlelo	Baxlelo#7642	525801799999946752	DomiNATION #5 - Ragnarok	NEW	3pm-11pm central weekdays 7am-10pm weekends	Patreon Monthly Dino	05/19/2020 15:23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DomiNATION #5 - Ragnarok	Tusoteuthis	No	75	17	5	3	100	73	Female	-335504 -448782 -12274 -91.95 -6.41             pin # 0000	cwrj71@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3a33486b-0bb1-4e00-9aa7-1080c055576f	492	Anilla	XMAN-Unum#6590	254482409335160833	DomiNATION #1 - Island	NEW	4PM 11PM West Cost PST	Element from Event	05/19/2020 20:20	\N	\N	\N	\N	\N	\N	\N	\N	Rockwell Boss	DomiNATION #4 - Aberration	Yes	-254882 278118 -13846 42.73 -5.31 - Yellow/Red VAULT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6761c16a-835b-4470-9e2b-58f78a035e4d	484	Shadow Knight	shadowknight#0932	268135508343783424	DomiNATION #10 - Patreon Aberration	COMPLETE	4PM - 12A.M Central	Element from Event	05/18/2020 08:50	05/19/2020 17:43	BeOurGuest	BeOurGuest	05/19/2020 17:54	\N	\N	\N	\N	Late Night Alpha Rockwell on the 15th	DomiNATION #10 - Patreon Aberration	Yes	-113390 -33680 73190 -83.07 -6.34 PIN Code for Vault: 0990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fefd0cec-2865-4e3c-9ed6-5d0feaf9aa27	487	Birb	Birb#9040	534832819579650048	DomiNATION #5 - Ragnarok	COMPLETE	MST	Element from Event	05/18/2020 12:36	05/19/2020 17:59	BeOurGuest	BeOurGuest	05/19/2020 18:06	\N	\N	\N	\N	May 16th, 7 PM CST Prime Time Rockwell Event	DomiNATION #5 - Ragnarok	No	-406315 154045 -8903 -36.16 -27.21 An Unlocked vault closest to the Replicator	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: dinocolors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dinocolors_id_seq', 152, true);


--
-- Name: dinosaurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dinosaurs_id_seq', 180, true);


--
-- Name: servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.servers_id_seq', 13, true);


--
-- Name: tickets_incrementer_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tickets_incrementer_seq', 494, true);


--
-- Name: dinocolors dinocolors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dinocolors
    ADD CONSTRAINT dinocolors_pkey PRIMARY KEY (id);


--
-- Name: dinosaurs dinosaurs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dinosaurs
    ADD CONSTRAINT dinosaurs_pkey PRIMARY KEY (id);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

