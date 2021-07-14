--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-07-14 16:15:34 +05

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
-- TOC entry 209 (class 1259 OID 33104)
-- Name: additionals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.additionals (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.additionals OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 33102)
-- Name: additionals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.additionals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additionals_id_seq OWNER TO postgres;

--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 208
-- Name: additionals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.additionals_id_seq OWNED BY public.additionals.id;


--
-- TOC entry 211 (class 1259 OID 33115)
-- Name: pays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pays (
    id integer NOT NULL,
    value character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.pays OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33113)
-- Name: pays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pays_id_seq OWNER TO postgres;

--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 210
-- Name: pays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pays_id_seq OWNED BY public.pays.id;


--
-- TOC entry 205 (class 1259 OID 33075)
-- Name: tariffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tariffs (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    speed character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tariffs OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33073)
-- Name: tariffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tariffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tariffs_id_seq OWNER TO postgres;

--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 204
-- Name: tariffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tariffs_id_seq OWNED BY public.tariffs.id;


--
-- TOC entry 213 (class 1259 OID 33128)
-- Name: user_additionals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_additionals (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "additionalId" integer
);


ALTER TABLE public.user_additionals OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33126)
-- Name: user_additionals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_additionals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_additionals_id_seq OWNER TO postgres;

--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_additionals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_additionals_id_seq OWNED BY public.user_additionals.id;


--
-- TOC entry 207 (class 1259 OID 33086)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255),
    balance character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "tariffId" integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 33084)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3150 (class 2604 OID 33107)
-- Name: additionals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.additionals ALTER COLUMN id SET DEFAULT nextval('public.additionals_id_seq'::regclass);


--
-- TOC entry 3151 (class 2604 OID 33118)
-- Name: pays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pays ALTER COLUMN id SET DEFAULT nextval('public.pays_id_seq'::regclass);


--
-- TOC entry 3148 (class 2604 OID 33078)
-- Name: tariffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariffs ALTER COLUMN id SET DEFAULT nextval('public.tariffs_id_seq'::regclass);


--
-- TOC entry 3152 (class 2604 OID 33131)
-- Name: user_additionals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additionals ALTER COLUMN id SET DEFAULT nextval('public.user_additionals_id_seq'::regclass);


--
-- TOC entry 3149 (class 2604 OID 33089)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3306 (class 0 OID 33104)
-- Dependencies: 209
-- Data for Name: additionals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.additionals (id, title, description, price, "createdAt", "updatedAt") FROM stdin;
1	ТВ	IP телевидение. 200 каналов.	200	2021-07-14 13:31:31.949+05	2021-07-14 13:31:31.949+05
2	Аренда роутера	Аренда WiFi роутера с большой площадью покрытия.	100	2021-07-14 13:31:31.967+05	2021-07-14 13:31:31.967+05
3	Выделенный IP	Выделенный IP адресс для вашей сети.	100	2021-07-14 13:31:31.977+05	2021-07-14 13:31:31.977+05
\.


--
-- TOC entry 3308 (class 0 OID 33115)
-- Dependencies: 211
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pays (id, value, "createdAt", "updatedAt", "userId") FROM stdin;
1	-1000	2021-07-14 13:31:32.025+05	2021-07-14 13:31:32.025+05	1
2	1000	2021-07-14 13:31:32.031+05	2021-07-14 13:31:32.031+05	1
3	-1000	2021-07-14 13:31:32.035+05	2021-07-14 13:31:32.035+05	1
4	800	2021-07-14 13:31:32.038+05	2021-07-14 13:31:32.038+05	1
5	200	2021-07-14 13:31:32.041+05	2021-07-14 13:31:32.041+05	1
6	1200	2021-07-14 13:31:32.044+05	2021-07-14 13:31:32.044+05	1
7	200	2021-07-14 16:12:34.637+05	2021-07-14 16:12:34.637+05	1
\.


--
-- TOC entry 3302 (class 0 OID 33075)
-- Dependencies: 205
-- Data for Name: tariffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tariffs (id, title, speed, price, "createdAt", "updatedAt") FROM stdin;
1	M	50	500	2021-07-14 13:31:31.915+05	2021-07-14 13:31:31.915+05
2	L	100	1000	2021-07-14 13:31:31.933+05	2021-07-14 13:31:31.933+05
3	XL	500	1500	2021-07-14 13:31:31.94+05	2021-07-14 13:31:31.94+05
\.


--
-- TOC entry 3310 (class 0 OID 33128)
-- Dependencies: 213
-- Data for Name: user_additionals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_additionals (id, "createdAt", "updatedAt", "userId", "additionalId") FROM stdin;
2	2021-07-14 16:12:50.52+05	2021-07-14 16:12:50.52+05	1	1
\.


--
-- TOC entry 3304 (class 0 OID 33086)
-- Dependencies: 207
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, name, phone, balance, "createdAt", "updatedAt", "tariffId") FROM stdin;
1	aa@aa.aa	$2b$05$EjKH9/mDP5RojK34aAXrMus6CWU/.FLu92WuO4.Nn489R6Bspvy3S	Админ	+7 (999) 999-99-99	900	2021-07-14 13:31:31.99+05	2021-07-14 16:13:18.986+05	3
\.


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 208
-- Name: additionals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.additionals_id_seq', 3, true);


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 210
-- Name: pays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pays_id_seq', 7, true);


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 204
-- Name: tariffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tariffs_id_seq', 3, true);


--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_additionals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_additionals_id_seq', 2, true);


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 3160 (class 2606 OID 33112)
-- Name: additionals additionals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.additionals
    ADD CONSTRAINT additionals_pkey PRIMARY KEY (id);


--
-- TOC entry 3162 (class 2606 OID 33120)
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id);


--
-- TOC entry 3154 (class 2606 OID 33083)
-- Name: tariffs tariffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariffs
    ADD CONSTRAINT tariffs_pkey PRIMARY KEY (id);


--
-- TOC entry 3164 (class 2606 OID 33133)
-- Name: user_additionals user_additionals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additionals
    ADD CONSTRAINT user_additionals_pkey PRIMARY KEY (id);


--
-- TOC entry 3166 (class 2606 OID 33135)
-- Name: user_additionals user_additionals_userId_additionalId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additionals
    ADD CONSTRAINT "user_additionals_userId_additionalId_key" UNIQUE ("userId", "additionalId");


--
-- TOC entry 3156 (class 2606 OID 33096)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3158 (class 2606 OID 33094)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3168 (class 2606 OID 33121)
-- Name: pays pays_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT "pays_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3170 (class 2606 OID 33141)
-- Name: user_additionals user_additionals_additionalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additionals
    ADD CONSTRAINT "user_additionals_additionalId_fkey" FOREIGN KEY ("additionalId") REFERENCES public.additionals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3169 (class 2606 OID 33136)
-- Name: user_additionals user_additionals_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additionals
    ADD CONSTRAINT "user_additionals_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3167 (class 2606 OID 33097)
-- Name: users users_tariffId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_tariffId_fkey" FOREIGN KEY ("tariffId") REFERENCES public.tariffs(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2021-07-14 16:15:35 +05

--
-- PostgreSQL database dump complete
--

