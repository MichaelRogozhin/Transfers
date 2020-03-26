--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 11.4

-- Started on 2020-03-26 09:34:18

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
-- TOC entry 203 (class 1259 OID 17534)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO transfersuser;

--
-- TOC entry 202 (class 1259 OID 17532)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO transfersuser;

--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 17544)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO transfersuser;

--
-- TOC entry 204 (class 1259 OID 17542)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO transfersuser;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 17526)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO transfersuser;

--
-- TOC entry 200 (class 1259 OID 17524)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO transfersuser;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 17552)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO transfersuser;

--
-- TOC entry 209 (class 1259 OID 17562)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO transfersuser;

--
-- TOC entry 208 (class 1259 OID 17560)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO transfersuser;

--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 17550)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO transfersuser;

--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 17570)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO transfersuser;

--
-- TOC entry 210 (class 1259 OID 17568)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO transfersuser;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 214 (class 1259 OID 17661)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO transfersuser;

--
-- TOC entry 213 (class 1259 OID 17630)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO transfersuser;

--
-- TOC entry 212 (class 1259 OID 17628)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO transfersuser;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 17516)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO transfersuser;

--
-- TOC entry 198 (class 1259 OID 17514)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO transfersuser;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 17505)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO transfersuser;

--
-- TOC entry 196 (class 1259 OID 17503)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO transfersuser;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 221 (class 1259 OID 17738)
-- Name: django_session; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO transfersuser;

--
-- TOC entry 216 (class 1259 OID 17681)
-- Name: main_account; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.main_account (
    id integer NOT NULL,
    amount double precision NOT NULL,
    client_id character varying(200) NOT NULL,
    currency_id character varying(10) NOT NULL
);


ALTER TABLE public.main_account OWNER TO transfersuser;

--
-- TOC entry 215 (class 1259 OID 17679)
-- Name: main_account_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.main_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_account_id_seq OWNER TO transfersuser;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.main_account_id_seq OWNED BY public.main_account.id;


--
-- TOC entry 217 (class 1259 OID 17687)
-- Name: main_client; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.main_client (
    email character varying(200) NOT NULL,
    password character varying(100) NOT NULL,
    token character varying(100) NOT NULL
);


ALTER TABLE public.main_client OWNER TO transfersuser;

--
-- TOC entry 218 (class 1259 OID 17692)
-- Name: main_currency; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.main_currency (
    code character varying(10) NOT NULL,
    rate double precision NOT NULL
);


ALTER TABLE public.main_currency OWNER TO transfersuser;

--
-- TOC entry 220 (class 1259 OID 17699)
-- Name: main_operation; Type: TABLE; Schema: public; Owner: transfersuser
--

CREATE TABLE public.main_operation (
    id integer NOT NULL,
    dt timestamp with time zone NOT NULL,
    amount_source double precision NOT NULL,
    amount_dest double precision NOT NULL,
    account_dest_id integer NOT NULL,
    account_source_id integer NOT NULL
);


ALTER TABLE public.main_operation OWNER TO transfersuser;

--
-- TOC entry 219 (class 1259 OID 17697)
-- Name: main_operation_id_seq; Type: SEQUENCE; Schema: public; Owner: transfersuser
--

CREATE SEQUENCE public.main_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_operation_id_seq OWNER TO transfersuser;

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 219
-- Name: main_operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: transfersuser
--

ALTER SEQUENCE public.main_operation_id_seq OWNED BY public.main_operation.id;


--
-- TOC entry 2753 (class 2604 OID 17537)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 17547)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 17529)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 17555)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 17565)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 17573)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 17633)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 17519)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 17508)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 17684)
-- Name: main_account id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_account ALTER COLUMN id SET DEFAULT nextval('public.main_account_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 17702)
-- Name: main_operation id; Type: DEFAULT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_operation ALTER COLUMN id SET DEFAULT nextval('public.main_operation_id_seq'::regclass);


--
-- TOC entry 2972 (class 0 OID 17534)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 17544)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 17526)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add account	1	add_account
2	Can change account	1	change_account
3	Can delete account	1	delete_account
4	Can view account	1	view_account
5	Can add client	2	add_client
6	Can change client	2	change_client
7	Can delete client	2	delete_client
8	Can view client	2	view_client
9	Can add currency	3	add_currency
10	Can change currency	3	change_currency
11	Can delete currency	3	delete_currency
12	Can view currency	3	view_currency
13	Can add operation	4	add_operation
14	Can change operation	4	change_operation
15	Can delete operation	4	delete_operation
16	Can view operation	4	view_operation
17	Can add Token	5	add_token
18	Can change Token	5	change_token
19	Can delete Token	5	delete_token
20	Can view Token	5	view_token
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add permission	7	add_permission
26	Can change permission	7	change_permission
27	Can delete permission	7	delete_permission
28	Can view permission	7	view_permission
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add user	9	add_user
34	Can change user	9	change_user
35	Can delete user	9	delete_user
36	Can view user	9	view_user
37	Can add content type	10	add_contenttype
38	Can change content type	10	change_contenttype
39	Can delete content type	10	delete_contenttype
40	Can view content type	10	view_contenttype
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
\.


--
-- TOC entry 2976 (class 0 OID 17552)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 17562)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 17570)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 17661)
-- Dependencies: 214
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 17630)
-- Dependencies: 213
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17516)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	main	account
2	main	client
3	main	currency
4	main	operation
5	authtoken	token
6	admin	logentry
7	auth	permission
8	auth	group
9	auth	user
10	contenttypes	contenttype
11	sessions	session
\.


--
-- TOC entry 2966 (class 0 OID 17505)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-26 09:29:39.645976+03
2	auth	0001_initial	2020-03-26 09:29:39.708887+03
3	admin	0001_initial	2020-03-26 09:29:39.799046+03
4	admin	0002_logentry_remove_auto_add	2020-03-26 09:29:39.819461+03
5	admin	0003_logentry_add_action_flag_choices	2020-03-26 09:29:39.829127+03
6	contenttypes	0002_remove_content_type_name	2020-03-26 09:29:39.846146+03
7	auth	0002_alter_permission_name_max_length	2020-03-26 09:29:39.851133+03
8	auth	0003_alter_user_email_max_length	2020-03-26 09:29:39.861114+03
9	auth	0004_alter_user_username_opts	2020-03-26 09:29:39.870083+03
10	auth	0005_alter_user_last_login_null	2020-03-26 09:29:39.883076+03
11	auth	0006_require_contenttypes_0002	2020-03-26 09:29:39.885074+03
12	auth	0007_alter_validators_add_error_messages	2020-03-26 09:29:39.895023+03
13	auth	0008_alter_user_username_max_length	2020-03-26 09:29:39.908988+03
14	auth	0009_alter_user_last_name_max_length	2020-03-26 09:29:39.918952+03
15	auth	0010_alter_group_name_max_length	2020-03-26 09:29:39.928932+03
16	auth	0011_update_proxy_permissions	2020-03-26 09:29:39.936901+03
17	authtoken	0001_initial	2020-03-26 09:29:39.954814+03
18	authtoken	0002_auto_20160226_1747	2020-03-26 09:29:39.999108+03
19	main	0001_initial	2020-03-26 09:29:40.036046+03
20	main	0002_auto_20200325_1935	2020-03-26 09:29:40.089901+03
21	sessions	0001_initial	2020-03-26 09:29:40.103192+03
\.


--
-- TOC entry 2990 (class 0 OID 17738)
-- Dependencies: 221
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 17681)
-- Dependencies: 216
-- Data for Name: main_account; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.main_account (id, amount, client_id, currency_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 17687)
-- Dependencies: 217
-- Data for Name: main_client; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.main_client (email, password, token) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 17692)
-- Dependencies: 218
-- Data for Name: main_currency; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.main_currency (code, rate) FROM stdin;
EUR	1
USD	1.1000000000000001
GBP	0.90000000000000002
RUB	85
BTC	0.01
\.


--
-- TOC entry 2989 (class 0 OID 17699)
-- Dependencies: 220
-- Data for Name: main_operation; Type: TABLE DATA; Schema: public; Owner: transfersuser
--

COPY public.main_operation (id, dt, amount_source, amount_dest, account_dest_id, account_source_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.main_account_id_seq', 1, false);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 219
-- Name: main_operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: transfersuser
--

SELECT pg_catalog.setval('public.main_operation_id_seq', 1, false);


--
-- TOC entry 2775 (class 2606 OID 17659)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2780 (class 2606 OID 17596)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2783 (class 2606 OID 17549)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 17539)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 17582)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2772 (class 2606 OID 17531)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 17567)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 17611)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2785 (class 2606 OID 17557)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 17575)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 17625)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2788 (class 2606 OID 17653)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2807 (class 2606 OID 17665)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2809 (class 2606 OID 17667)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2803 (class 2606 OID 17639)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 17523)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2767 (class 2606 OID 17521)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 17513)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 17745)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2815 (class 2606 OID 17686)
-- Name: main_account main_account_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_account
    ADD CONSTRAINT main_account_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 17691)
-- Name: main_client main_client_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_client
    ADD CONSTRAINT main_client_pkey PRIMARY KEY (email);


--
-- TOC entry 2821 (class 2606 OID 17696)
-- Name: main_currency main_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_currency
    ADD CONSTRAINT main_currency_pkey PRIMARY KEY (code);


--
-- TOC entry 2825 (class 2606 OID 17704)
-- Name: main_operation main_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_operation
    ADD CONSTRAINT main_operation_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 1259 OID 17660)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2778 (class 1259 OID 17597)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2781 (class 1259 OID 17598)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2768 (class 1259 OID 17583)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2789 (class 1259 OID 17613)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2792 (class 1259 OID 17612)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2795 (class 1259 OID 17627)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2798 (class 1259 OID 17626)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2786 (class 1259 OID 17654)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2805 (class 1259 OID 17673)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2801 (class 1259 OID 17650)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2804 (class 1259 OID 17651)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2826 (class 1259 OID 17747)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2829 (class 1259 OID 17746)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2810 (class 1259 OID 17719)
-- Name: main_account_client_id_e07b8e51; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_account_client_id_e07b8e51 ON public.main_account USING btree (client_id);


--
-- TOC entry 2811 (class 1259 OID 17720)
-- Name: main_account_client_id_e07b8e51_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_account_client_id_e07b8e51_like ON public.main_account USING btree (client_id varchar_pattern_ops);


--
-- TOC entry 2812 (class 1259 OID 17726)
-- Name: main_account_currency_id_508f7c8d; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_account_currency_id_508f7c8d ON public.main_account USING btree (currency_id);


--
-- TOC entry 2813 (class 1259 OID 17727)
-- Name: main_account_currency_id_508f7c8d_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_account_currency_id_508f7c8d_like ON public.main_account USING btree (currency_id varchar_pattern_ops);


--
-- TOC entry 2816 (class 1259 OID 17705)
-- Name: main_client_email_f79d9ae2_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_client_email_f79d9ae2_like ON public.main_client USING btree (email varchar_pattern_ops);


--
-- TOC entry 2819 (class 1259 OID 17706)
-- Name: main_currency_code_117eea76_like; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_currency_code_117eea76_like ON public.main_currency USING btree (code varchar_pattern_ops);


--
-- TOC entry 2822 (class 1259 OID 17717)
-- Name: main_operation_account_dest_id_ca5ecba9; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_operation_account_dest_id_ca5ecba9 ON public.main_operation USING btree (account_dest_id);


--
-- TOC entry 2823 (class 1259 OID 17718)
-- Name: main_operation_account_source_id_9ba4051a; Type: INDEX; Schema: public; Owner: transfersuser
--

CREATE INDEX main_operation_account_source_id_9ba4051a ON public.main_operation USING btree (account_source_id);


--
-- TOC entry 2832 (class 2606 OID 17590)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2831 (class 2606 OID 17585)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2830 (class 2606 OID 17576)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2834 (class 2606 OID 17605)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2833 (class 2606 OID 17600)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2836 (class 2606 OID 17619)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2835 (class 2606 OID 17614)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2839 (class 2606 OID 17674)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2837 (class 2606 OID 17640)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2838 (class 2606 OID 17645)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2841 (class 2606 OID 17733)
-- Name: main_account main_account_client_id_e07b8e51_fk_main_client_email; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_account
    ADD CONSTRAINT main_account_client_id_e07b8e51_fk_main_client_email FOREIGN KEY (client_id) REFERENCES public.main_client(email) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2840 (class 2606 OID 17728)
-- Name: main_account main_account_currency_id_508f7c8d_fk_main_currency_code; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_account
    ADD CONSTRAINT main_account_currency_id_508f7c8d_fk_main_currency_code FOREIGN KEY (currency_id) REFERENCES public.main_currency(code) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2842 (class 2606 OID 17707)
-- Name: main_operation main_operation_account_dest_id_ca5ecba9_fk_main_account_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_operation
    ADD CONSTRAINT main_operation_account_dest_id_ca5ecba9_fk_main_account_id FOREIGN KEY (account_dest_id) REFERENCES public.main_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2843 (class 2606 OID 17712)
-- Name: main_operation main_operation_account_source_id_9ba4051a_fk_main_account_id; Type: FK CONSTRAINT; Schema: public; Owner: transfersuser
--

ALTER TABLE ONLY public.main_operation
    ADD CONSTRAINT main_operation_account_source_id_9ba4051a_fk_main_account_id FOREIGN KEY (account_source_id) REFERENCES public.main_account(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-03-26 09:34:18

--
-- PostgreSQL database dump complete
--

