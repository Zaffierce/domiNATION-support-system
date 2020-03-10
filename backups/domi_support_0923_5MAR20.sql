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
    server_name character varying(255)
);


ALTER TABLE public.servers OWNER TO jon;

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
-- Name: ticket_general id; Type: DEFAULT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.ticket_general ALTER COLUMN id SET DEFAULT nextval('public.ticket_general_id_seq'::regclass);


--
-- Data for Name: ban_appeal; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.ban_appeal (id, ign, discord_name, discord_id, server_assistance, status, steam_id, email_address, banned_reason, unban_reason, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	NEW	98735321684	first@last.com	1	becuz not nub	02/29/2020 16:22:49	\N	\N
2	Zaff	Zaff#6073	143840467312836609	1	NEW	98735321684	first@last.com	1	becuz not nub	02/29/2020 16:24:37	\N	\N
3	Zaff	Zaff#6073	143840467312836609	1	NEW	98735321684	first@last.com	1	becuz not nub	02/29/2020 16:28:12	\N	\N
\.


--
-- Data for Name: bug_report; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.bug_report (id, ign, discord_name, discord_id, server_assistance, status, issue, recreate, lost_items, submitted_on, closed_by, closed_on) FROM stdin;
9	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:47:10	\N	\N
1	Zaff	Zaff#6073	143840467312836609	1	CANCEL	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/27/2020 23:00:27	Zaff	02/27/2020 23:02:07
10	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:48:05	\N	\N
2	Zaff	Zaff#6073	143840467312836609	3	COMPLETE	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 10:19:58	Zaff	02/29/2020 10:42:16
3	Zaff	Zaff#6073	143840467312836609	1	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 10:43:33	\N	\N
4	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:39:49	\N	\N
5	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:40:39	\N	\N
6	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:40:46	\N	\N
7	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:41:59	\N	\N
8	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:42:51	\N	\N
11	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:55:02	\N	\N
12	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:59:13	\N	\N
13	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 16:59:40	\N	\N
14	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 17:02:19	\N	\N
15	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 17:12:11	\N	\N
16	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 17:13:09	\N	\N
17	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 17:13:30	\N	\N
18	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 17:15:26	\N	\N
19	Zaff	Zaff#6073	143840467312836609	6	NEW	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	no	gfjkskjfdgjhdsjfgjsgjkhjdshgjdkfsjghldsjghlsdkfjhgdlksfjhgfsdljhgldsf	02/29/2020 17:15:42	\N	\N
\.


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
-- Data for Name: element_event; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.element_event (id, ign, discord_name, discord_id, server_assistance, status, event_name, serverid_dropoff, patreon_status, element_dropoff_location, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Late Night Boss Fight	1	\N	249202 383967 29998 153.38 -10.10 PIN: 1120	02/25/2020 15:22:46	Zaff	02/27/2020 09:28:08
2	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Late Night Boss Fight	1	\N	249202 383967 29998 153.38 -10.10 PIN: 1120	02/25/2020 15:24:12	Zaff	02/27/2020 09:29:48
3	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	Late Night Boss Fight	1	Yes	249202 383967 29998 153.38 -10.10 PIN: 1120	02/25/2020 15:25:24	Zaff	02/27/2020 21:10:55
4	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	Late Night Boss Fight	1	Yes	249202 383967 29998 153.38 -10.10 PIN: 1120	02/25/2020 15:27:17	Zaff	02/27/2020 21:10:59
5	Zaff	Zaff#6073	143840467312836609	11	NEW	Late Night Boss Fight	11	Yes	249202 383967 29998 153.38 -10.10 PIN: 1120	02/29/2020 14:24:23	\N	\N
6	Zaff	Zaff#6073	143840467312836609	1	NEW	Late Night Boss Fight	11	Yes	249202 383967 29998 153.38 -10.10 PIN: 1120	02/29/2020 16:31:27	\N	\N
\.


--
-- Data for Name: element_transfer; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.element_transfer (id, ign, discord_name, discord_id, server_assistance, status, transfer_amount, serverid_pickup, server_pickup_location, serverid_dropoff, server_dropoff_location, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	2	COMPLETE	5000	1	249202 383967 29998 153.38 -10.10 PIN: 1120	2	249202 383967 29998 153.38 -10.10 PIN: 1120	02/25/2020 15:29:37	Zaff	02/27/2020 21:11:03
2	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	9999999	1	249202 383967 29998 153.38 -10.10 PIN: 1120	1	249202 383967 29998 153.38 -10.10 PIN: 1120	02/27/2020 21:28:59	Zaff	02/27/2020 21:49:21
4	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	999	1	249202 383967 29998 153.38 -10.10 PIN: 1120	4	249202 383967 29998 153.38 -10.10 PIN: 1120	02/27/2020 22:02:06	Zaff	02/27/2020 22:22:18
3	Zaff	Zaff#6073	143840467312836609	1	CANCEL	2000	1	249202 383967 29998 153.38 -10.10 PIN: 1120	1	249202 383967 29998 153.38 -10.10 PIN: 1120	02/27/2020 21:57:31	Zaff	02/27/2020 23:01:59
5	Zaff	Zaff#6073	143840467312836609	11	NEW	500	6	249202 383967 29998 153.38 -10.10 PIN: 1120	11	249202 383967 29998 153.38 -10.10 PIN: 1120	02/29/2020 14:25:11	\N	\N
\.


--
-- Data for Name: patreon_dino_insurance; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.patreon_dino_insurance (id, ign, discord_name, discord_id, server_assistance, status, dino_link, email_address, month_claimed, explanation, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	https://ark.spectrumdominus.com/server/9/dino/462062019	first@last.com	June	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	02/25/2020 15:30:29	Zaff	02/27/2020 21:11:16
2	Zaff	Zaff#6073	143840467312836609	1	NEW	https://ark.spectrumdominus.com/server/9/dino/462062019	first@last.com	June	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	02/29/2020 14:31:06	\N	\N
\.


--
-- Data for Name: patreon_dino_request; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.patreon_dino_request (id, ign, discord_name, discord_id, server_assistance, status, serverid_dropoff, dino_name, colored, region0, region1, region2, region3, region4, region5, sex, server_dropoff_location, email_address, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	2	Carbonemys	yes	4	1	1	1	1	1	male	249202 383967 29998 153.38 -10.10 PIN: 1120	first@last.com	02/25/2020 15:30:06	Zaff	02/27/2020 21:11:07
2	Zaff	Zaff#6073	143840467312836609	6	COMPLETE	7	Glowtail	yes	5	2	1	1	1	2	female	249202 383967 29998 153.38 -10.10 PIN: 1120	first@last.com	02/27/2020 21:06:12	Zaff	02/27/2020 21:11:12
3	Zaff	Zaff#6073	143840467312836609	8	NEW	4	Araneo	yes	1	1	1	1	1	1	female	249202 383967 29998 153.38 -10.10 PIN: 1120	first@last.com	02/29/2020 14:29:27	\N	\N
\.


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.servers (server_id, server_name) FROM stdin;
1	DomiNATION #1 - Island
2	DomiNATION #2 - Center
3	DomiNATION #3 - Scorched Earth
4	DomiNATION #4 - Aberration
5	DomiNATION #5 - Ragnarok
6	DomiNATION #6 - Patreon Ragnarok
7	DomiNATION #7 - Extinction
8	DomiNATION #8 - Patreon Extinction
9	DomiNATION #9 - Valguero
10	DomiNATION #10 - Patreon Aberration
11	DomiNATION #11 - Genesis
\.


--
-- Data for Name: ticket_general; Type: TABLE DATA; Schema: public; Owner: jon
--

COPY public.ticket_general (id, ign, discord_name, discord_id, server_assistance, status, tribe_name, coordinates, issue, resolution, submitted_on, closed_by, closed_on) FROM stdin;
1	Zaff	Zaff#6073	143840467312836609	1	CANCELLED	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/21/2020 11:48:05	Zaff	02/27/2020 09:27:34
2	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/27/2020 20:57:03	Zaff	02/27/2020 21:07:42
3	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Tribe of Noobs	123123123123123123123	lkgdjlgkjdfslkgjldsfjkdfsljkljsdgk	kjdkkjgjkfgjksfg	02/27/2020 21:01:03	Zaff	02/27/2020 21:07:47
4	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Tribe of Noobs	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/27/2020 21:13:17	Zaff	02/27/2020 21:27:17
5	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Tribe of Noobs	dgsgdsfgsfdf	sdggg	ggsdfgdsf	02/27/2020 21:28:00	Zaff	02/27/2020 21:56:13
6	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/27/2020 21:56:32	Zaff	02/27/2020 21:56:40
7	Zaff	Zaff#6073	143840467312836609	1	CANCEL	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/27/2020 22:32:57	Zaff	02/27/2020 23:02:03
12	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:21:47	\N	\N
8	Zaff	Zaff#6073	143840467312836609	1	COMPLETE	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 10:19:36	Zaff	02/29/2020 10:42:12
9	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 14:19:02	\N	\N
10	Zaff	Zaff#6073	143840467312836609	1	NEW	Tribe of Noobs	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:01:00	\N	\N
11	Zaff	Zaff#6073	143840467312836609	1	NEW	Tribe of Noobs	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:09:37	\N	\N
13	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:22:03	\N	\N
14	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:22:21	\N	\N
15	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:30:30	\N	\N
16	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:30:30	\N	\N
17	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 16:30:58	\N	\N
18	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 17:19:15	\N	\N
19	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 17:19:52	\N	\N
20	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 17:20:10	\N	\N
21	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 17:20:24	\N	\N
22	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 17:21:12	\N	\N
23	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 18:04:42	\N	\N
24	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 18:05:26	\N	\N
25	Zaff	Zaff#6073	143840467312836609	1	NEW	Micropolis	Why is the CCC location here.....	I was in the tribe of pixel pillagers a long time ago and I just came back to Pat rag to build another base and they have been gone for a while and I didn't realize I was in the tribe so I started building a base and then once I realized I was in a tribe I demolished it and now somehow there's a foundation most likely underneath the train and I can't start rebuilding again so I'm hoping that you can remove those underneath foundations	Looked all over can't get underneath the terain	02/29/2020 18:07:58	\N	\N
\.


--
-- Name: ban_appeal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.ban_appeal_id_seq', 3, true);


--
-- Name: bug_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.bug_report_id_seq', 19, true);


--
-- Name: dinosaurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.dinosaurs_id_seq', 119, true);


--
-- Name: element_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.element_event_id_seq', 6, true);


--
-- Name: element_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.element_transfer_id_seq', 5, true);


--
-- Name: patreon_dino_insurance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.patreon_dino_insurance_id_seq', 2, true);


--
-- Name: patreon_dino_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.patreon_dino_request_id_seq', 3, true);


--
-- Name: ticket_general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jon
--

SELECT pg_catalog.setval('public.ticket_general_id_seq', 25, true);


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
-- Name: ticket_general ticket_general_pkey; Type: CONSTRAINT; Schema: public; Owner: jon
--

ALTER TABLE ONLY public.ticket_general
    ADD CONSTRAINT ticket_general_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

