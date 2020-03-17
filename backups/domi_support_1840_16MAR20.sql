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
-- Name: ban_appeal; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.ban_appeal (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    steam_id character varying(255),
    email_address character varying(255),
    banned_reason text,
    unban_reason text,
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.ban_appeal OWNER TO jon;

--
-- Name: ban_appeal_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.ban_appeal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ban_appeal_id_seq OWNER TO jon;

--
-- Name: ban_appeal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.ban_appeal_id_seq OWNED BY public.ban_appeal.id;


--
-- Name: bug_report; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.bug_report (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    issue text,
    recreate text,
    lost_items text,
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.bug_report OWNER TO jon;

--
-- Name: bug_report_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.bug_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bug_report_id_seq OWNER TO jon;

--
-- Name: bug_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.bug_report_id_seq OWNED BY public.bug_report.id;


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
-- Name: element_event; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.element_event (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    event_name character varying(255),
    serverid_dropoff integer,
    patreon_status character varying(5),
    element_dropoff_location character varying(255),
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.element_event OWNER TO jon;

--
-- Name: element_event_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.element_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_event_id_seq OWNER TO jon;

--
-- Name: element_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.element_event_id_seq OWNED BY public.element_event.id;


--
-- Name: element_transfer; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.element_transfer (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    transfer_amount integer,
    serverid_pickup integer,
    server_pickup_location character varying(255),
    serverid_dropoff integer,
    server_dropoff_location character varying(255),
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.element_transfer OWNER TO jon;

--
-- Name: element_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.element_transfer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_transfer_id_seq OWNER TO jon;

--
-- Name: element_transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.element_transfer_id_seq OWNED BY public.element_transfer.id;


--
-- Name: patreon_dino_insurance; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.patreon_dino_insurance (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    dino_link character varying(255),
    email_address character varying(255),
    month_claimed character varying(255),
    explanation text,
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.patreon_dino_insurance OWNER TO jon;

--
-- Name: patreon_dino_insurance_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.patreon_dino_insurance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patreon_dino_insurance_id_seq OWNER TO jon;

--
-- Name: patreon_dino_insurance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.patreon_dino_insurance_id_seq OWNED BY public.patreon_dino_insurance.id;


--
-- Name: patreon_dino_request; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.patreon_dino_request (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    serverid_dropoff integer,
    dino_name character varying(255),
    colored character varying(5),
    region0 character varying(5),
    region1 character varying(5),
    region2 character varying(5),
    region3 character varying(5),
    region4 character varying(5),
    region5 character varying(5),
    sex character varying(7),
    server_dropoff_location character varying(255),
    email_address character varying(255),
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.patreon_dino_request OWNER TO jon;

--
-- Name: patreon_dino_request_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.patreon_dino_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patreon_dino_request_id_seq OWNER TO jon;

--
-- Name: patreon_dino_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.patreon_dino_request_id_seq OWNED BY public.patreon_dino_request.id;


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
-- Name: ticket_general; Type: TABLE; Schema: public; Owner: jon
--

CREATE TABLE public.ticket_general (
    id integer NOT NULL,
    ign character varying(255),
    discord_name character varying(255),
    discord_id character varying(255),
    server_assistance integer,
    status character varying(20),
    tribe_name character varying(255),
    coordinates character varying(255),
    issue text,
    resolution text,
    submitted_on character varying(20),
    closed_by character varying(255),
    closed_on character varying(20)
);


ALTER TABLE public.ticket_general OWNER TO jon;

--
-- Name: ticket_general_id_seq; Type: SEQUENCE; Schema: public; Owner: jon
--

CREATE SEQUENCE public.ticket_general_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_general_id_seq OWNER TO jon;

--
-- Name: ticket_general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jon
--

ALTER SEQUENCE public.ticket_general_id_seq OWNED BY public.ticket_general.id;


--
-- Name: ban_appeal id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.ban_appeal ALTER COLUMN id SET DEFAULT nextval('public.ban_appeal_id_seq'::regclass);


--
-- Name: bug_report id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.bug_report ALTER COLUMN id SET DEFAULT nextval('public.bug_report_id_seq'::regclass);


--
-- Name: dinocolors id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinocolors ALTER COLUMN id SET DEFAULT nextval('public.dinocolors_id_seq'::regclass);


--
-- Name: dinosaurs id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinosaurs ALTER COLUMN id SET DEFAULT nextval('public.dinosaurs_id_seq'::regclass);


--
-- Name: element_event id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.element_event ALTER COLUMN id SET DEFAULT nextval('public.element_event_id_seq'::regclass);


--
-- Name: element_transfer id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.element_transfer ALTER COLUMN id SET DEFAULT nextval('public.element_transfer_id_seq'::regclass);


--
-- Name: patreon_dino_insurance id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.patreon_dino_insurance ALTER COLUMN id SET DEFAULT nextval('public.patreon_dino_insurance_id_seq'::regclass);


--
-- Name: patreon_dino_request id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.patreon_dino_request ALTER COLUMN id SET DEFAULT nextval('public.patreon_dino_request_id_seq'::regclass);


--
-- Name: servers id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.servers ALTER COLUMN id SET DEFAULT nextval('public.servers_id_seq'::regclass);


--
-- Name: ticket_general id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.ticket_general ALTER COLUMN id SET DEFAULT nextval('public.ticket_general_id_seq'::regclass);


--
-- Data for Name: ban_appeal; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.ban_appeal (id, ign, discord_name, discord_id, server_assistance, status, steam_id, email_address, banned_reason, unban_reason, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCEL	987432798423asdf	first@last.com	1234567890 becuase I am noob	987654321 becuase I am no noob now	02/22/2020 13:35:32	Zaff	03/16/2020 14:12:01
\.


--
-- Data for Name: bug_report; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.bug_report (id, ign, discord_name, discord_id, server_assistance, status, issue, recreate, lost_items, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCEL	While building a base on #1, I saw some abandoned dinos treading water along the beach.  They were up for claim, so after looking at the admin list for server #1 and not seeing the tribe name on it, I claimed them.   I began breeding the rex from this group and even have gotten a nice melee mutation/coloration from it.  I've not really bred dinos much before (though I seem to have caught the bug now, lol).  Later, I figured out you can look up the lineage of dinos on the website, so dug around and saw that it was a dino bred by an admin tribe on #9 (Twits).   This got me a bit worried, so I took another long look at the full admin list for all servers, and the tribe that the dinos were in (dodo) is an admin on #9, just not listed on #1.  I was going to talk to Snow about it after the event tonight but she was busy, so am submitting a ticket.  I just need to know what you guys want me to do.	fdsafsdfdsafdsafdsafdas	fdfadsfdassfdsafdsfsda	02/22/2020 13:40:06	Zaff	03/16/2020 14:12:05
\.


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
-- Data for Name: element_event; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.element_event (id, ign, discord_name, discord_id, server_assistance, status, event_name, serverid_dropoff, patreon_status, element_dropoff_location, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	Feb 14th Late Night Rockwell Event	9	Yes	-36737 -156716 10638 61.45 4.11 Box Pin 6971	2/20/2020 22:59:16	Zaff	02/26/2020 21:45:11
\.


--
-- Data for Name: element_transfer; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.element_transfer (id, ign, discord_name, discord_id, server_assistance, status, transfer_amount, serverid_pickup, server_pickup_location, serverid_dropoff, server_dropoff_location, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	8	COMPLETE	6000	8	-378601 -169257 -113812 -167.66 -41.13 S+ Storage Bin Named Stuff Pin 7598	6	124636 421263 -10062 -131.58 -33.42 S+ Storage Bin Named Stuff Pin 7598	2/20/2020 23:0:0	Zaff	02/26/2020 21:25:10
2	Zaff	Zaff#6073	143840467312836609	12	NEW	500	5	-378601 -169257 -113812 -167.66 -41.13 S+ Storage Bin Named Stuff Pin 7598	12	-317393 -273081 8131 -14.09 -14.08  pass 1234	03/16/2020 15:55:51	\N	\N
\.


--
-- Data for Name: patreon_dino_insurance; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.patreon_dino_insurance (id, ign, discord_name, discord_id, server_assistance, status, dino_link, email_address, month_claimed, explanation, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCEL	www.google.com/	first@last.com	June	becsu it ded	02/20/2020 23:09:06	Zaff	03/16/2020 14:11:58
\.


--
-- Data for Name: patreon_dino_request; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.patreon_dino_request (id, ign, discord_name, discord_id, server_assistance, status, serverid_dropoff, dino_name, colored, region0, region1, region2, region3, region4, region5, sex, server_dropoff_location, email_address, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	6	Mantis	no	na	na	na	na	na	na	na	-317393 -273081 8131 -14.09 -14.08  pass 1234	idcombest@yahoo.com	2/20/2020 23:2:11	Zaff	02/26/2020 21:45:16
2	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	5	Wyvern (Fire)	yes	34	10	5	53	6	6	female	-223158 185930 2429 21.21 -13.11	bjk095020@gmail.com	2/20/2020 23:4:21	Zaff	02/26/2020 21:27:41
3	Zaff	Zaff#6073	143840467312836609	1	CANCEL	1	Achatina	no	na	na	na	na	na	na	na	6543584768462321231	first@last.com	03/01/2020 22:37:03	Zaff	03/16/2020 14:11:47
4	Zaff	Zaff#6073	143840467312836609	1	CANCEL	11	Ichthyosaurus	yes	na	na	na	na	na	na	na	124636 421263 -10062 -131.58 -33.42 S+ Storage Bin Named Stuff Pin 7598	first@last.com	03/09/2020 23:48:55	Zaff	03/16/2020 14:11:51
5	Zaff	Zaff#6073	143840467312836609	1	CANCEL	11	Wyvern (Fire)	yes	1	2	3	4	5	6	male	-317393 -273081 8131 -14.09 -14.08  pass 1234	first@last.com	03/10/2020 17:54:17	Zaff	03/16/2020 14:11:54
\.


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
-- Data for Name: ticket_general; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.ticket_general (id, ign, discord_name, discord_id, server_assistance, status, tribe_name, coordinates, issue, resolution, submitted_on, closed_by, closed_on) FROM stdin;
2	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	fdsafdsafdsafdas	6543219687321	fdsfsaddfasfdsafdsfsaddfasfdsafdsfsaddfasfdsafdsfsaddfasfdsafdsfsaddfasfdsafdsfsaddfasfdsa	fdsfdsfadsfdsafdsza	02/26/2020 19:40:08	\N	02/26/2020 19:42:08
1	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	Tribe of Noobs	6543219687321	While building a base on #1, I saw some abandoned dinos treading water along the beach.  They were up for claim, so after looking at the admin list for server #1 and not seeing the tribe name on it, I claimed them.   I began breeding the rex from this group and even have gotten a nice melee mutation/coloration from it.  I've not really bred dinos much before (though I seem to have caught the bug now, lol).  Later, I figured out you can look up the lineage of dinos on the website, so dug around and saw that it was a dino bred by an admin tribe on #9 (Twits).   This got me a bit worried, so I took another long look at the full admin list for all servers, and the tribe that the dinos were in (dodo) is an admin on #9, just not listed on #1.  I was going to talk to Snow about it after the event tonight but she was busy, so am submitting a ticket.  I just need to know what you guys want me to do.	 I have sequestered the 4 I remember being in the group (A theri, a mammoth, a female rex named BF 4 (renamed to Blue Betty) and a clipped male rex), as well as the resulting dinos from my breeding efforts into my breeding pen.  Everything in that pen is being kept separate and not being used until this is resolved.  This was not an intentional admin jawa, I just didn't see dodo in the list for #1 and thought they were acceptable claims.  dodo may like the new coloration variation.. I called it 'Cotton Candy Death Machine'	2/20/2020 22:39:22	Zaff	02/26/2020 21:16:32
3	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	Tribe of Noobs	6543219687321	While building a base on #1, I saw some abandoned dinos treading water along the beach.  They were up for claim, so after looking at the admin list for server #1 and not seeing the tribe name on it, I claimed them.   I began breeding the rex from this group and even have gotten a nice melee mutation/coloration from it.  I've not really bred dinos much before (though I seem to have caught the bug now, lol).  Later, I figured out you can look up the lineage of dinos on the website, so dug around and saw that it was a dino bred by an admin tribe on #9 (Twits).   This got me a bit worried, so I took another long look at the full admin list for all servers, and the tribe that the dinos were in (dodo) is an admin on #9, just not listed on #1.  I was going to talk to Snow about it after the event tonight but she was busy, so am submitting a ticket.  I just need to know what you guys want me to do.	fdsfdsfadsfdsafdsza	02/26/2020 21:19:05	Zaff	02/26/2020 21:19:21
\.


--
-- Name: ban_appeal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.ban_appeal_id_seq', 1, true);


--
-- Name: bug_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.bug_report_id_seq', 1, true);


--
-- Name: dinocolors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.dinocolors_id_seq', 83, true);


--
-- Name: dinosaurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.dinosaurs_id_seq', 120, true);


--
-- Name: element_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.element_event_id_seq', 1, true);


--
-- Name: element_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.element_transfer_id_seq', 2, true);


--
-- Name: patreon_dino_insurance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.patreon_dino_insurance_id_seq', 1, true);


--
-- Name: patreon_dino_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.patreon_dino_request_id_seq', 5, true);


--
-- Name: servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.servers_id_seq', 14, true);


--
-- Name: ticket_general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.ticket_general_id_seq', 3, true);


--
-- Name: ban_appeal ban_appeal_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.ban_appeal
    ADD CONSTRAINT ban_appeal_pkey PRIMARY KEY (id);


--
-- Name: bug_report bug_report_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.bug_report
    ADD CONSTRAINT bug_report_pkey PRIMARY KEY (id);


--
-- Name: dinocolors dinocolors_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinocolors
    ADD CONSTRAINT dinocolors_pkey PRIMARY KEY (id);


--
-- Name: dinosaurs dinosaurs_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.dinosaurs
    ADD CONSTRAINT dinosaurs_pkey PRIMARY KEY (id);


--
-- Name: element_event element_event_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.element_event
    ADD CONSTRAINT element_event_pkey PRIMARY KEY (id);


--
-- Name: element_transfer element_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.element_transfer
    ADD CONSTRAINT element_transfer_pkey PRIMARY KEY (id);


--
-- Name: patreon_dino_insurance patreon_dino_insurance_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.patreon_dino_insurance
    ADD CONSTRAINT patreon_dino_insurance_pkey PRIMARY KEY (id);


--
-- Name: patreon_dino_request patreon_dino_request_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.patreon_dino_request
    ADD CONSTRAINT patreon_dino_request_pkey PRIMARY KEY (id);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: ticket_general ticket_general_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.ticket_general
    ADD CONSTRAINT ticket_general_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

