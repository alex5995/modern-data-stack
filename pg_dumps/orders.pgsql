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
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    order_date date,
    status character varying(50)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    order_id integer,
    payment_method character varying(50),
    amount integer
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, order_date, status) FROM stdin;
1	1	2018-01-01	returned
2	3	2018-01-02	completed
3	94	2018-01-04	completed
4	50	2018-01-05	completed
5	64	2018-01-05	completed
6	54	2018-01-07	completed
7	88	2018-01-09	completed
8	2	2018-01-11	returned
9	53	2018-01-12	completed
10	7	2018-01-14	completed
11	99	2018-01-14	completed
12	59	2018-01-15	completed
13	84	2018-01-17	completed
14	40	2018-01-17	returned
15	25	2018-01-17	completed
16	39	2018-01-18	completed
17	71	2018-01-18	completed
18	64	2018-01-20	returned
19	54	2018-01-22	completed
20	20	2018-01-23	completed
21	71	2018-01-23	completed
22	86	2018-01-24	completed
23	22	2018-01-26	return_pending
24	3	2018-01-27	completed
25	51	2018-01-28	completed
26	32	2018-01-28	completed
27	94	2018-01-29	completed
28	8	2018-01-29	completed
29	57	2018-01-31	completed
30	69	2018-02-02	completed
31	16	2018-02-02	completed
32	28	2018-02-04	completed
33	42	2018-02-04	completed
34	38	2018-02-06	completed
35	80	2018-02-08	completed
36	85	2018-02-10	completed
37	1	2018-02-10	completed
38	51	2018-02-10	completed
39	26	2018-02-11	completed
40	33	2018-02-13	completed
41	99	2018-02-14	completed
42	92	2018-02-16	completed
43	31	2018-02-17	completed
44	66	2018-02-17	completed
45	22	2018-02-17	completed
46	6	2018-02-19	completed
47	50	2018-02-20	completed
48	27	2018-02-21	completed
49	35	2018-02-21	completed
50	51	2018-02-23	completed
51	71	2018-02-24	completed
52	54	2018-02-25	return_pending
53	34	2018-02-26	completed
54	54	2018-02-26	completed
55	18	2018-02-27	completed
56	79	2018-02-28	completed
57	93	2018-03-01	completed
58	22	2018-03-01	completed
59	30	2018-03-02	completed
60	12	2018-03-03	completed
61	63	2018-03-03	completed
62	57	2018-03-05	completed
63	70	2018-03-06	completed
64	13	2018-03-07	completed
65	26	2018-03-08	completed
66	36	2018-03-10	completed
67	79	2018-03-11	completed
68	53	2018-03-11	completed
69	3	2018-03-11	completed
70	8	2018-03-12	completed
71	42	2018-03-12	shipped
72	30	2018-03-14	shipped
73	19	2018-03-16	completed
74	9	2018-03-17	shipped
75	69	2018-03-18	completed
76	25	2018-03-20	completed
77	35	2018-03-21	shipped
78	90	2018-03-23	shipped
79	52	2018-03-23	shipped
80	11	2018-03-23	shipped
81	76	2018-03-23	shipped
82	46	2018-03-24	shipped
83	54	2018-03-24	shipped
84	70	2018-03-26	placed
85	47	2018-03-26	shipped
86	68	2018-03-26	placed
87	46	2018-03-27	placed
88	91	2018-03-27	shipped
89	21	2018-03-28	placed
90	66	2018-03-30	shipped
91	47	2018-03-31	placed
92	84	2018-04-02	placed
93	66	2018-04-03	placed
94	63	2018-04-03	placed
95	27	2018-04-04	placed
96	90	2018-04-06	placed
97	89	2018-04-07	placed
98	41	2018-04-07	placed
99	85	2018-04-09	placed
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, order_id, payment_method, amount) FROM stdin;
1	1	credit_card	1000
2	2	credit_card	2000
3	3	coupon	100
4	4	coupon	2500
5	5	bank_transfer	1700
6	6	credit_card	600
7	7	credit_card	1600
8	8	credit_card	2300
9	9	gift_card	2300
10	9	bank_transfer	0
11	10	bank_transfer	2600
12	11	credit_card	2700
13	12	credit_card	100
14	13	credit_card	500
15	13	bank_transfer	1400
16	14	bank_transfer	300
17	15	coupon	2200
18	16	credit_card	1000
19	17	bank_transfer	200
20	18	credit_card	500
21	18	credit_card	800
22	19	gift_card	600
23	20	bank_transfer	1500
24	21	credit_card	1200
25	22	bank_transfer	800
26	23	gift_card	2300
27	24	coupon	2600
28	25	bank_transfer	2000
29	25	credit_card	2200
30	25	coupon	1600
31	26	credit_card	3000
32	27	credit_card	2300
33	28	bank_transfer	1900
34	29	bank_transfer	1200
35	30	credit_card	1300
36	31	credit_card	1200
37	32	credit_card	300
38	33	credit_card	2200
39	34	bank_transfer	1500
40	35	credit_card	2900
41	36	bank_transfer	900
42	37	credit_card	2300
43	38	credit_card	1500
44	39	bank_transfer	800
45	40	credit_card	1400
46	41	credit_card	1700
47	42	coupon	1700
48	43	gift_card	1800
49	44	gift_card	1100
50	45	bank_transfer	500
51	46	bank_transfer	800
52	47	credit_card	2200
53	48	bank_transfer	300
54	49	credit_card	600
55	49	credit_card	900
56	50	credit_card	2600
57	51	credit_card	2900
58	51	credit_card	100
59	52	bank_transfer	1500
60	53	credit_card	300
61	54	credit_card	1800
62	54	bank_transfer	1100
63	55	credit_card	2900
64	56	credit_card	400
65	57	bank_transfer	200
66	58	coupon	1800
67	58	gift_card	600
68	59	gift_card	2800
69	60	credit_card	400
70	61	bank_transfer	1600
71	62	gift_card	1400
72	63	credit_card	2900
73	64	bank_transfer	2600
74	65	credit_card	0
75	66	credit_card	2800
76	67	bank_transfer	400
77	67	credit_card	1900
78	68	credit_card	1600
79	69	credit_card	1900
80	70	credit_card	2600
81	71	credit_card	500
82	72	credit_card	2900
83	73	bank_transfer	300
84	74	credit_card	3000
85	75	credit_card	1900
86	76	coupon	200
87	77	credit_card	0
88	77	bank_transfer	1900
89	78	bank_transfer	2600
90	79	credit_card	1800
91	79	credit_card	900
92	80	gift_card	300
93	81	coupon	200
94	82	credit_card	800
95	83	credit_card	100
96	84	bank_transfer	2500
97	85	bank_transfer	1700
98	86	coupon	2300
99	87	gift_card	3000
100	87	credit_card	2600
101	88	credit_card	2900
102	89	bank_transfer	2200
103	90	bank_transfer	200
104	91	credit_card	1900
105	92	bank_transfer	1500
106	92	coupon	200
107	93	gift_card	2600
108	94	coupon	700
109	95	coupon	2400
110	96	gift_card	1700
111	97	bank_transfer	1400
112	98	bank_transfer	1000
113	99	credit_card	2400
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

