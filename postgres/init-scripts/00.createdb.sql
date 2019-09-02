--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

-- Started on 2019-08-31 11:27:33

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
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;


-- Role: dev_user
-- DROP ROLE dev_user;

CREATE ROLE dev_user WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  NOCREATEROLE
  NOREPLICATION;

--
-- TOC entry 186 (class 1259 OID 16405)
-- Name: M_org; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."M_org" (
    org_id integer NOT NULL,
    org_name text NOT NULL,
    location text NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone NOT NULL
);


ALTER TABLE public."M_org" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16467)
-- Name: tbl_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_comments (
    comment_id integer NOT NULL,
    org_id integer NOT NULL,
    comments text NOT NULL,
    is_available boolean DEFAULT true NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    modified_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tbl_comments OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16465)
-- Name: tbl_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_comments_comment_id_seq OWNER TO postgres;

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 191
-- Name: tbl_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_comments_comment_id_seq OWNED BY public.tbl_comments.comment_id;


--
-- TOC entry 190 (class 1259 OID 16457)
-- Name: tbl_followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_followers (
    id integer NOT NULL,
    follower_id integer NOT NULL,
    followers_id integer NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    modified_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tbl_followers OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16455)
-- Name: tbl_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_followers_id_seq OWNER TO postgres;

--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 189
-- Name: tbl_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_followers_id_seq OWNED BY public.tbl_followers.id;


--
-- TOC entry 188 (class 1259 OID 16444)
-- Name: tbl_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_members (
    member_id integer NOT NULL,
    org_id integer NOT NULL,
    member_name text NOT NULL,
    login text NOT NULL,
    avatar_url text NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    modified_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tbl_members OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16442)
-- Name: tbl_members_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_members_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_members_member_id_seq OWNER TO postgres;

--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 187
-- Name: tbl_members_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_members_member_id_seq OWNED BY public.tbl_members.member_id;


--
-- TOC entry 185 (class 1259 OID 16403)
-- Name: test_org_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_org_id_seq OWNER TO postgres;

--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 185
-- Name: test_org_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_org_id_seq OWNED BY public."M_org".org_id;


--
-- TOC entry 2022 (class 2604 OID 16408)
-- Name: M_org org_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."M_org" ALTER COLUMN org_id SET DEFAULT nextval('public.test_org_id_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 16470)
-- Name: tbl_comments comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.tbl_comments_comment_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 16460)
-- Name: tbl_followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_followers ALTER COLUMN id SET DEFAULT nextval('public.tbl_followers_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 16447)
-- Name: tbl_members member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_members ALTER COLUMN member_id SET DEFAULT nextval('public.tbl_members_member_id_seq'::regclass);


--
-- TOC entry 2159 (class 0 OID 16405)
-- Dependencies: 186
-- Data for Name: M_org; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."M_org" (org_id, org_name, location, created_date, modified_date) FROM stdin;
1	Xendit	Indonesia	2019-08-27 21:01:14.343207	2019-08-27 21:01:14.343207
2	HKIA	HongKong	2019-08-27 21:01:32.082207	2019-08-27 21:01:32.082207
\.


--
-- TOC entry 2165 (class 0 OID 16467)
-- Dependencies: 192
-- Data for Name: tbl_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_comments (comment_id, org_id, comments, is_available, created_date, modified_date) FROM stdin;
\.


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 191
-- Name: tbl_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_comments_comment_id_seq', 1, false);


--
-- TOC entry 2163 (class 0 OID 16457)
-- Dependencies: 190
-- Data for Name: tbl_followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_followers (id, follower_id, followers_id, created_date, modified_date) FROM stdin;
1	2	1	2019-08-28 17:40:31.182476	2019-08-28 17:40:31.182476
2	3	1	2019-08-28 17:51:44.586476	2019-08-28 17:51:44.586476
3	4	1	2019-08-28 17:51:44.586476	2019-08-28 17:51:44.586476
4	1	4	2019-08-28 17:51:44.586476	2019-08-28 17:51:44.586476
5	4	2	2019-08-28 17:51:44.586476	2019-08-28 17:51:44.586476
9	1	2	2019-08-28 17:53:35.645476	2019-08-28 17:53:35.645476
11	2	4	2019-08-28 19:47:24.593	2019-08-28 19:47:24.593
\.


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 189
-- Name: tbl_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_followers_id_seq', 11, true);


--
-- TOC entry 2161 (class 0 OID 16444)
-- Dependencies: 188
-- Data for Name: tbl_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_members (member_id, org_id, member_name, login, avatar_url, created_date, modified_date) FROM stdin;
1	1	Tony Stark	t.stark	https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjW5-iylKXkAhUBk3AKHSV9BmsQjRx6BAgBEAQ&url=%2Furl%3Fsa%3Di%26source%3Dimages%26cd%3D%26ved%3D%26url%3Dhttps%253A%252F%252Fsiliconangle.com%252F2013%252F10%252F14%252Fus-army-building-talos-real-life-ironman-armor-to-give-troops-superhuman-strength%252F%26psig%3DAOvVaw2O-VE2y7QGXruA5A5T-k_5%26ust%3D1567067534322811&psig=AOvVaw2O-VE2y7QGXruA5A5T-k_5&ust=1567067534322811	2019-08-28 16:44:33.815476	2019-08-28 16:44:33.815476
2	1	Steve Rogers	s.rogers	https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiG37v1l6XkAhVFvY8KHaBrADoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F187110559502515882%2F&psig=AOvVaw2LmMf2Jmh6A-beoQ92RvUW&ust=1567068668846631	2019-08-28 16:51:53.196476	2019-08-28 16:51:53.196476
3	1	Clinton Barton	c.barton	https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiG37v1l6XkAhVFvY8KHaBrADoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F187110559502515882%2F&psig=AOvVaw2LmMf2Jmh6A-beoQ92RvUW&ust=1567068668846631	2019-08-28 17:43:55.713476	2019-08-28 17:43:55.713476
4	1	Bruce Banner	b.banner	https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiG37v1l6XkAhVFvY8KHaBrADoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F187110559502515882%2F&psig=AOvVaw2LmMf2Jmh6A-beoQ92RvUW&ust=1567068668846631	2019-08-28 17:46:08.832476	2019-08-28 17:46:08.832476
5	1	Star Lord	s.lord	https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiG37v1l6XkAhVFvY8KHaBrADoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F187110559502515882%2F&psig=AOvVaw2LmMf2Jmh6A-beoQ92RvUW&ust=1567068668846631	2019-08-28 17:46:08.832476	2019-08-28 17:46:08.832476
\.


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 187
-- Name: tbl_members_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_members_member_id_seq', 5, true);


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 185
-- Name: test_org_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_org_id_seq', 2, true);


--
-- TOC entry 2040 (class 2606 OID 16476)
-- Name: tbl_comments tbl_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_comments
    ADD CONSTRAINT tbl_comments_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 2038 (class 2606 OID 16464)
-- Name: tbl_followers tbl_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_followers
    ADD CONSTRAINT tbl_followers_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 16454)
-- Name: tbl_members tbl_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_members
    ADD CONSTRAINT tbl_members_pkey PRIMARY KEY (member_id);


--
-- TOC entry 2034 (class 2606 OID 16413)
-- Name: M_org test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."M_org"
    ADD CONSTRAINT test_pkey PRIMARY KEY (org_id);


-- Completed on 2019-08-31 11:27:34

--
-- PostgreSQL database dump complete
--

