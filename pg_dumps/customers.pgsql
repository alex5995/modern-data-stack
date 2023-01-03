--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name) FROM stdin;
1	Michael	P.
2	Shawn	M.
3	Kathleen	P.
4	Jimmy	C.
5	Katherine	R.
6	Sarah	R.
7	Martin	M.
8	Frank	R.
9	Jennifer	F.
10	Henry	W.
11	Fred	S.
12	Amy	D.
13	Kathleen	M.
14	Steve	F.
15	Teresa	H.
16	Amanda	H.
17	Kimberly	R.
18	Johnny	K.
19	Virginia	F.
20	Anna	A.
21	Willie	H.
22	Sean	H.
23	Mildred	A.
24	David	G.
25	Victor	H.
26	Aaron	R.
27	Benjamin	B.
28	Lisa	W.
29	Benjamin	K.
30	Christina	W.
31	Jane	G.
32	Thomas	O.
33	Katherine	M.
34	Jennifer	S.
35	Sara	T.
36	Harold	O.
37	Shirley	J.
38	Dennis	J.
39	Louise	W.
40	Maria	A.
41	Gloria	C.
42	Diana	S.
43	Kelly	N.
44	Jane	R.
45	Scott	B.
46	Norma	C.
47	Marie	P.
48	Lillian	C.
49	Judy	N.
50	Billy	L.
51	Howard	R.
52	Laura	F.
53	Anne	B.
54	Rose	M.
55	Nicholas	R.
56	Joshua	K.
57	Paul	W.
58	Kathryn	K.
59	Adam	A.
60	Norma	W.
61	Timothy	R.
62	Elizabeth	P.
63	Edward	G.
64	David	C.
65	Brenda	W.
66	Adam	W.
67	Michael	H.
68	Jesse	E.
69	Janet	P.
70	Helen	F.
71	Gerald	C.
72	Kathryn	O.
73	Alan	B.
74	Harry	A.
75	Andrea	H.
76	Barbara	W.
77	Anne	W.
78	Harry	H.
79	Jack	R.
80	Phillip	H.
81	Shirley	H.
82	Arthur	D.
83	Virginia	R.
84	Christina	R.
85	Theresa	M.
86	Jason	C.
87	Phillip	B.
88	Adam	T.
89	Margaret	J.
90	Paul	P.
91	Todd	W.
92	Willie	O.
93	Frances	R.
94	Gregory	H.
95	Lisa	P.
96	Jacqueline	A.
97	Shirley	D.
98	Nicole	M.
99	Mary	G.
100	Jean	M.
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

