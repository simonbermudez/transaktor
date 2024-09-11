--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE transactions_db;




--
-- Drop roles
--

DROP ROLE "user";


--
-- Roles
--

CREATE ROLE "user";
ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md54d45974e13472b5a0be3533de4666414';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.15 (Debian 13.15-1.pgdg120+1)
-- Dumped by pg_dump version 13.15 (Debian 13.15-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO "user";

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: user
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: user
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.15 (Debian 13.15-1.pgdg120+1)
-- Dumped by pg_dump version 13.15 (Debian 13.15-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO "user";

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "transactions_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.15 (Debian 13.15-1.pgdg120+1)
-- Dumped by pg_dump version 13.15 (Debian 13.15-1.pgdg120+1)

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
-- Name: transactions_db; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE transactions_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE transactions_db OWNER TO "user";

\connect transactions_db

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "user";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "user";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "user";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user
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


ALTER TABLE public.django_admin_log OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "user";

--
-- Name: transactions_association; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transactions_association (
    id bigint NOT NULL,
    keyword character varying(100) NOT NULL,
    category_id character varying(100) NOT NULL
);


ALTER TABLE public.transactions_association OWNER TO "user";

--
-- Name: transactions_association_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

ALTER TABLE public.transactions_association ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.transactions_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: transactions_category; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transactions_category (
    name character varying(100) NOT NULL,
    budget numeric(7,2) NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.transactions_category OWNER TO "user";

--
-- Name: transactions_transaction; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transactions_transaction (
    id character varying(250) NOT NULL,
    date date NOT NULL,
    description text NOT NULL,
    amount numeric(10,2) NOT NULL,
    category_id character varying(100),
    metadata jsonb
);


ALTER TABLE public.transactions_transaction OWNER TO "user";

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add transaction	7	add_transaction
26	Can change transaction	7	change_transaction
27	Can delete transaction	7	delete_transaction
28	Can view transaction	7	view_transaction
29	Can add category	8	add_category
30	Can change category	8	change_category
31	Can delete category	8	delete_category
32	Can view category	8	view_category
33	Can add association	9	add_association
34	Can change association	9	change_association
35	Can delete association	9	delete_association
36	Can view association	9	view_association
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$720000$JtH2r0PYHRCDVUpyjBWG5W$khk7mgS93hlonCU3aYEZXBJXDP6FVt4Pm9E0Zp8bYh8=	2024-09-10 22:58:17.519916+00	t	siber			iam@simonbermudez.com	t	t	2024-06-07 12:40:07.470655+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-06-07 12:40:48.903277+00	Food	Food	1	[{"added": {}}]	8	1
2	2024-06-07 12:40:56.781397+00	Transport	Transport	1	[{"added": {}}]	8	1
3	2024-06-07 12:41:13.046121+00	Life Insurance	Life Insurance	1	[{"added": {}}]	8	1
4	2024-06-07 12:41:23.255752+00	Bill	Bill	1	[{"added": {}}]	8	1
5	2024-06-07 12:41:42.181285+00	Bank Fee	Bank Fee	1	[{"added": {}}]	8	1
6	2024-06-07 12:44:18.23268+00	Misc	Misc	1	[{"added": {}}]	8	1
7	2024-06-07 12:45:33.100971+00	Credit Card Payment	Credit Card Payment	1	[{"added": {}}]	8	1
8	2024-06-07 12:46:02.362736+00	Gift	Gift	1	[{"added": {}}]	8	1
9	2024-06-07 12:47:11.996139+00	Entertainment	Entertainment	1	[{"added": {}}]	8	1
10	2024-06-07 12:48:10.697383+00	Phone	Phone	1	[{"added": {}}]	8	1
11	2024-06-07 12:48:44.070834+00	Education	Education	1	[{"added": {}}]	8	1
12	2024-06-07 12:51:45.379875+00	Clothes	Clothes	1	[{"added": {}}]	8	1
13	2024-06-07 12:52:12.338887+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-MAEMUKI--51.25	2024-06-06 - MAEMUKI - -51.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
14	2024-06-07 12:52:12.340735+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-LE-PAIN-QUOTIDIEN-RETIRO--23.42	2024-06-06 - LE PAIN QUOTIDIEN RETIRO - -23.42	2	[{"changed": {"fields": ["Category"]}}]	7	1
15	2024-06-07 12:52:12.342052+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-FARMATODO-ANDINO--15.95	2024-06-06 - FARMATODO ANDINO - -15.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
16	2024-06-07 12:52:12.343457+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-CENTRAL-CEVICHERIA--40.9	2024-06-06 - CENTRAL CEVICHERIA - -40.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
17	2024-06-07 12:52:12.344787+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-BOGOTA-BEER-COMPANY--38.69	2024-06-06 - BOGOTA BEER COMPANY - -38.69	2	[{"changed": {"fields": ["Category"]}}]	7	1
18	2024-06-07 12:52:12.346168+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-LA-BARBERIA-LOUNGE-Y-S--205.11	2024-06-05 - LA BARBERIA LOUNGE Y S - -205.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
19	2024-06-07 12:52:12.347522+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-FROM---*****06*6621-753.7	2024-06-05 - FROM - *****06*6621 - 753.70	2	[{"changed": {"fields": ["Category"]}}]	7	1
20	2024-06-07 12:52:12.348831+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-CENTRAL-CEVICHERIA--31.46	2024-06-05 - CENTRAL CEVICHERIA - -31.46	2	[{"changed": {"fields": ["Category"]}}]	7	1
21	2024-06-07 12:52:12.350114+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-CARULLA-FRESH-COUNTRY-1100100-BOGOT-AMT-57,330.00--20.86	2024-06-05 - CARULLA FRESH COUNTRY 1100100 BOGOT AMT 57,330.00 - -20.86	2	[{"changed": {"fields": ["Category"]}}]	7	1
22	2024-06-07 12:52:12.35153+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-CAFE-MONSTRUO--38	2024-06-05 - CAFE MONSTRUO - -38.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
23	2024-06-07 12:52:12.352881+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-Vistaprint-Canada-Corp-Toronto-ON--30.04	2024-06-04 - Vistaprint Canada Corp Toronto ON - -30.04	2	[{"changed": {"fields": ["Category"]}}]	7	1
24	2024-06-07 12:52:12.354215+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-SUN-LIFE-CHOICES-A&A-800-669-7921-ON--40.48	2024-06-04 - SUN LIFE CHOICES A&A 800-669-7921 ON - -40.48	2	[{"changed": {"fields": ["Category"]}}]	7	1
25	2024-06-07 12:52:12.355492+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-RAPPI*RAPPI-COLOMBIA-1100100-BOGOT-AMT-141,400.00--51.32	2024-06-04 - RAPPI*RAPPI COLOMBIA 1100100 BOGOT AMT 141,400.00 - -51.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
26	2024-06-07 12:52:12.356763+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-MC-DONALD-S-BOGOTA-AMT-10,500.00--3.81	2024-06-04 - MC DONALD S BOGOTA AMT 10,500.00 - -3.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
27	2024-06-07 12:52:12.358049+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-LA-LUCHA-85-1100100-BOGOT-AMT-16,501.00--5.99	2024-06-04 - LA LUCHA 85 1100100 BOGOT AMT 16,501.00 - -5.99	2	[{"changed": {"fields": ["Category"]}}]	7	1
28	2024-06-07 12:52:12.359454+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-DROGUERIA-CRUZ-VERDE-BOGOTA-AMT-21,270.00--7.74	2024-06-04 - DROGUERIA CRUZ VERDE BOGOTA AMT 21,270.00 - -7.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
29	2024-06-07 12:52:12.360788+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-CINE-COLOMBIA-S-A-1100100-BOGOT-AMT-6,700.00--2.44	2024-06-04 - CINE COLOMBIA S A 1100100 BOGOT AMT 6,700.00 - -2.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
30	2024-06-07 12:52:12.362181+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-CINE-COLOMBIA-S-A-1100100-BOGOT-AMT-48,600.00--17.64	2024-06-04 - CINE COLOMBIA S A 1100100 BOGOT AMT 48,600.00 - -17.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
31	2024-06-07 12:52:12.363619+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-CAFE-MONSTRUO-BOGOTA-AMT-145,861.00-(APPLE-PAY)--52.94	2024-06-04 - CAFE MONSTRUO BOGOTA AMT 145,861.00 (APPLE PAY) - -52.94	2	[{"changed": {"fields": ["Category"]}}]	7	1
32	2024-06-07 12:52:12.364911+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-04-AIRALO-SINGAPORE-AMT-15.00-(APPLE-PAY)--21.02	2024-06-04 - AIRALO SINGAPORE AMT 15.00 (APPLE PAY) - -21.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
33	2024-06-07 12:52:12.366344+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-TELEFERICO-A-MONSERRAT-1100100-BOGOT-AMT-59,000.00--21.37	2024-06-03 - TELEFERICO A MONSERRAT 1100100 BOGOT AMT 59,000.00 - -21.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
34	2024-06-07 12:52:12.367716+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-RAPPI*RAPPI-COLOMBIA-1100100-BOGOT-AMT-60,000.00--21.78	2024-06-03 - RAPPI*RAPPI COLOMBIA 1100100 BOGOT AMT 60,000.00 - -21.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
35	2024-06-07 12:52:12.369008+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-OXXO-EJE-AMBIENTAL-BOGOTA-AMT-5,000.00--1.81	2024-06-03 - OXXO EJE AMBIENTAL BOGOTA AMT 5,000.00 - -1.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
36	2024-06-07 12:52:12.370321+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-LA-ESTRATEGIA-CAFE-BOGOTA-AMT-45,000.00-(APPLE-PAY)--16.34	2024-06-03 - LA ESTRATEGIA CAFE BOGOTA AMT 45,000.00 (APPLE PAY) - -16.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
37	2024-06-07 12:52:12.371693+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-JUAN-VALDEZ-CLL-85-CON-BOGOTA-AMT-50,600.00-(APPLE-PAY)--18.33	2024-06-03 - JUAN VALDEZ CLL 85 CON BOGOTA AMT 50,600.00 (APPLE PAY) - -18.33	2	[{"changed": {"fields": ["Category"]}}]	7	1
38	2024-06-07 12:52:12.373008+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-CARULLA-FRESH-COUNTRY-1100100-BOGOT-AMT-57,480.00--20.83	2024-06-03 - CARULLA FRESH COUNTRY 1100100 BOGOT AMT 57,480.00 - -20.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
39	2024-06-07 12:52:12.374308+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-BOLD-casa-vieja-jime-1100100-BOGOT-AMT-87,626.00--31.74	2024-06-03 - BOLD casa vieja jime 1100100 BOGOT AMT 87,626.00 - -31.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
40	2024-06-07 12:52:12.375682+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-BOLD-Artesanias-Laur-1100100-BOGOT-AMT-70,000.00--25.36	2024-06-03 - BOLD Artesanias Laur 1100100 BOGOT AMT 70,000.00 - -25.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
41	2024-06-07 12:52:12.377154+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-YUMMY-RIDES-HTTPSWWW.YUMMCA-AMT-22.57--31.68	2024-06-02 - YUMMY RIDES HTTPSWWW.YUMMCA AMT 22.57 - -31.68	2	[{"changed": {"fields": ["Category"]}}]	7	1
42	2024-06-07 12:52:12.378507+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-TERIYAKI-85-BOGOTA-(APPLE-PAY)--62.93	2024-06-02 - TERIYAKI 85 BOGOTA (APPLE PAY) - -62.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
43	2024-06-07 12:52:12.379866+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-PAYBRIGHT-877-2762780-ON--70.79	2024-06-02 - PAYBRIGHT 877-2762780 ON - -70.79	2	[{"changed": {"fields": ["Category"]}}]	7	1
44	2024-06-07 12:52:12.381112+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-PAYBRIGHT-877-2762780-ON--10.38	2024-06-02 - PAYBRIGHT 877-2762780 ON - -10.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
45	2024-06-07 12:52:12.382563+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-FARMATODO-CRA-16-BOGOTA-(APPLE-PAY)--37.65	2024-06-02 - FARMATODO CRA 16 BOGOTA (APPLE PAY) - -37.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
46	2024-06-07 12:52:12.383964+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-EL-CONSULADO-PAISA-BOGOTA-(APPLE-PAY)--27.38	2024-06-02 - EL CONSULADO PAISA BOGOTA (APPLE PAY) - -27.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
47	2024-06-07 12:52:12.385372+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-02-AIRALO-SINGAPORE-AMT-8.00-(APPLE-PAY)--11.22	2024-06-02 - AIRALO SINGAPORE AMT 8.00 (APPLE PAY) - -11.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
48	2024-06-07 12:52:12.386718+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-YUMMY-RIDES-HTTPSWWW.YUMMCA-AMT-9.16--12.85	2024-06-01 - YUMMY RIDES HTTPSWWW.YUMMCA AMT 9.16 - -12.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
49	2024-06-07 12:52:12.388122+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-TST*-GRAZIANOS-MARKET-DORDoral-FL-AMT-24.53-(APPLE-PAY)--34.43	2024-06-01 - TST* GRAZIANOS MARKET DORDoral FL AMT 24.53 (APPLE PAY) - -34.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
50	2024-06-07 12:52:12.389472+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-TACOLOGY-MIAMI-FL-AMT-20.00-(APPLE-PAY)--28.07	2024-06-01 - TACOLOGY MIAMI FL AMT 20.00 (APPLE PAY) - -28.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
51	2024-06-07 12:52:12.390825+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-PUBLIX-#1536-SUNNY-ISLES-BFL-AMT-16.21-(APPLE-PAY)--22.76	2024-06-01 - PUBLIX #1536 SUNNY ISLES BFL AMT 16.21 (APPLE PAY) - -22.76	2	[{"changed": {"fields": ["Category"]}}]	7	1
52	2024-06-07 12:52:12.392155+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-PADDLE.NET*-SETAPP-LONDON-AMT-14.11--19.8	2024-06-01 - PADDLE.NET* SETAPP LONDON AMT 14.11 - -19.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
53	2024-06-07 12:52:12.393461+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-BURLINGTON-STORES-1220-DORAL-BRANCH-FL-AMT-76.99-(APPLE-PAY)--108.06	2024-06-01 - BURLINGTON STORES 1220 DORAL BRANCH FL AMT 76.99 (APPLE PAY) - -108.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
54	2024-06-07 12:52:12.394715+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-01-BURLINGTON-STORES-1220-DORAL-BRANCH-FL-AMT-150.00-(APPLE-PAY)--210.52	2024-06-01 - BURLINGTON STORES 1220 DORAL BRANCH FL AMT 150.00 (APPLE PAY) - -210.52	2	[{"changed": {"fields": ["Category"]}}]	7	1
55	2024-06-07 12:52:12.39596+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-31-YUMMY-RIDES-HTTPSWWW.YUMMCA-AMT-23.81--33.53	2024-05-31 - YUMMY RIDES HTTPSWWW.YUMMCA AMT 23.81 - -33.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
56	2024-06-07 12:53:53.859094+00	Air Travel	Air Travel	1	[{"added": {}}]	8	1
57	2024-06-07 12:56:44.733013+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-29-Vistaprint-Canada-Corp-Toronto-ON--24.39	2024-05-29 - Vistaprint Canada Corp Toronto ON - -24.39	2	[{"changed": {"fields": ["Category"]}}]	7	1
58	2024-06-07 12:56:44.734848+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-29-OPENAI-HTTPSOPENAI.CCA-AMT-5.65--7.91	2024-05-29 - OPENAI HTTPSOPENAI.CCA AMT 5.65 - -7.91	2	[{"changed": {"fields": ["Category"]}}]	7	1
59	2024-06-07 12:56:44.736282+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-29-AMZN-Mktp-CA*Q93UQ83D3-WWW.AMAZON.CAON--33.89	2024-05-29 - AMZN Mktp CA*Q93UQ83D3 WWW.AMAZON.CAON - -33.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
60	2024-06-07 12:56:44.737682+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-29-AMZN-Mktp-CA*162402PT3-WWW.AMAZON.CAON--45.19	2024-05-29 - AMZN Mktp CA*162402PT3 WWW.AMAZON.CAON - -45.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
61	2024-06-07 12:56:44.739145+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-28-FROM---*****06*6621-0	2024-05-28 - FROM - *****06*6621 - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
62	2024-06-07 12:56:44.74063+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-28-ALDI-77083-DORAL-FL-AMT-3.39-(APPLE-PAY)--4.75	2024-05-28 - ALDI 77083 DORAL FL AMT 3.39 (APPLE PAY) - -4.75	2	[{"changed": {"fields": ["Category"]}}]	7	1
63	2024-06-07 12:56:44.742013+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-27-PUBLIX-#655-DORAL-FL-AMT-18.71-(APPLE-PAY)--26.35	2024-05-27 - PUBLIX #655 DORAL FL AMT 18.71 (APPLE PAY) - -26.35	2	[{"changed": {"fields": ["Category"]}}]	7	1
64	2024-06-07 12:56:44.743401+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-27-PLAYA-PAPAYA-CAROLINA-AMT-28.13-(APPLE-PAY)--39.63	2024-05-27 - PLAYA PAPAYA CAROLINA AMT 28.13 (APPLE PAY) - -39.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
65	2024-06-07 12:56:44.744813+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-27-COPA-AIR-2302186185575507-2172672-AMT-97.97--138	2024-05-27 - COPA AIR 2302186185575507-2172672 AMT 97.97 - -138.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
66	2024-06-07 12:56:44.746168+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-27-AMAZON*-701-4935114-66-DOWNTOWN-TOROON--69.09	2024-05-27 - AMAZON* 701-4935114-66 DOWNTOWN TOROON - -69.09	2	[{"changed": {"fields": ["Category"]}}]	7	1
67	2024-06-07 12:56:44.747541+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-26-SPIRIT-AIRL-4870394083171MIRAMAR-FL-AMT-45.00--63.39	2024-05-26 - SPIRIT AIRL 4870394083171MIRAMAR FL AMT 45.00 - -63.39	2	[{"changed": {"fields": ["Category"]}}]	7	1
68	2024-06-07 12:56:44.748937+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-26-LA-DULCE-TENTACION-FAJARDO-AMT-4.80-(APPLE-PAY)--6.77	2024-05-26 - LA DULCE TENTACION FAJARDO AMT 4.80 (APPLE PAY) - -6.77	2	[{"changed": {"fields": ["Category"]}}]	7	1
69	2024-06-07 12:56:44.75037+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-26-ISLETA-MARINA-BLUE-FAJARDO-AMT-5.60-(APPLE-PAY)--7.89	2024-05-26 - ISLETA MARINA BLUE FAJARDO AMT 5.60 (APPLE PAY) - -7.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
70	2024-06-07 12:56:44.75179+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-26-FARMACIA-CARIDAD-38-CAROLINA-AMT-4.17-(APPLE-PAY)--5.87	2024-05-26 - FARMACIA CARIDAD 38 CAROLINA AMT 4.17 (APPLE PAY) - -5.87	2	[{"changed": {"fields": ["Category"]}}]	7	1
71	2024-06-07 12:56:44.753198+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-25-SAZON-SAN-JUAN-AMT-33.63-(APPLE-PAY)--47.37	2024-05-25 - SAZON SAN JUAN AMT 33.63 (APPLE PAY) - -47.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
72	2024-06-07 12:56:44.754582+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-25-LE-PETIT-SOUVENIR-GI-SAN-JUAN-AMT-14.46-(APPLE-PAY)--20.37	2024-05-25 - LE PETIT SOUVENIR GI SAN JUAN AMT 14.46 (APPLE PAY) - -20.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
73	2024-06-07 12:56:44.755873+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-25-COPA-AIR-2302186165250507-2172672-AMT-220.24--310.22	2024-05-25 - COPA AIR 2302186165250507-2172672 AMT 220.24 - -310.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
74	2024-06-07 12:56:44.757115+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-25-COPA-AIR-2300034606577507-2172672-AMT-159.63--224.84	2024-05-25 - COPA AIR 2300034606577507-2172672 AMT 159.63 - -224.84	2	[{"changed": {"fields": ["Category"]}}]	7	1
75	2024-06-07 12:56:44.758553+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-25-CAFICULTURA-SAN-JUAN-AMT-30.69-(APPLE-PAY)--43.22	2024-05-25 - CAFICULTURA SAN JUAN AMT 30.69 (APPLE PAY) - -43.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
76	2024-06-07 12:56:44.760136+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-25-AGUADILLA-SERVICE-ST-AGUADILL-AMT-4.74-(APPLE-PAY)--6.67	2024-05-25 - AGUADILLA SERVICE ST AGUADILL AMT 4.74 (APPLE PAY) - -6.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
77	2024-06-07 12:56:44.76148+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-24-FREEDOM-MOBILE-877-946-3184-ON--101.7	2024-05-24 - FREEDOM MOBILE 877-946-3184 ON - -101.70	2	[{"changed": {"fields": ["Category"]}}]	7	1
78	2024-06-07 12:56:44.762774+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-24-CAFETERIA-AREPAS-VENEZOLACAROLINA-AMT-12.84-(APPLE-PAY)--18.08	2024-05-24 - CAFETERIA AREPAS VENEZOLACAROLINA AMT 12.84 (APPLE PAY) - -18.08	2	[{"changed": {"fields": ["Category"]}}]	7	1
79	2024-06-07 12:56:44.764125+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-24-BELL-CANADA-(OB)-MONTREAL-QC--56.44	2024-05-24 - BELL CANADA (OB) MONTREAL QC - -56.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
80	2024-06-07 12:56:44.765514+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-23-WALGREENS-0156-CAROLINA-(APPLE-PAY)--5.07	2024-05-23 - WALGREENS 0156 CAROLINA (APPLE PAY) - -5.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
81	2024-06-07 12:56:44.766938+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-23-STARBUCKS-EVENINGS-SDF-LOUISVILLE-KY-AMT-11.55-(APPLE-PAY)--16.22	2024-05-23 - STARBUCKS EVENINGS SDF LOUISVILLE KY AMT 11.55 (APPLE PAY) - -16.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
82	2024-06-07 12:56:44.768232+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-22-TST*-SIMPLY-THAI---MIDDLELouisville-KY-AMT-22.43--31.5	2024-05-22 - TST* SIMPLY THAI - MIDDLELouisville KY AMT 22.43 - -31.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
83	2024-06-07 12:56:44.769485+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-22-SPIRIT-AIRL-4870393549076MIRAMAR-FL-AMT-112.00--157.02	2024-05-22 - SPIRIT AIRL 4870393549076MIRAMAR FL AMT 112.00 - -157.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
84	2024-06-07 12:56:44.770742+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-22-EL-NOPAL-LOUISVILLE-KY-AMT-20.55-(APPLE-PAY)--28.81	2024-05-22 - EL NOPAL LOUISVILLE KY AMT 20.55 (APPLE PAY) - -28.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
85	2024-06-07 12:56:44.772075+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-21-SQ-*TAZIKIS-MEDITERRANEANLouisville-KY-AMT-18.83-(APPLE-PAY)--26.4	2024-05-21 - SQ *TAZIKIS MEDITERRANEANLouisville KY AMT 18.83 (APPLE PAY) - -26.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
86	2024-06-07 13:03:06.590893+00	Health	Health	1	[{"added": {}}]	8	1
87	2024-06-07 13:06:36.705782+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-21-ROSS-STORES-#1748-LOUISVILLE-KY-AMT-97.46-(APPLE-PAY)--136.64	2024-05-21 - ROSS STORES #1748 LOUISVILLE KY AMT 97.46 (APPLE PAY) - -136.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
88	2024-06-07 13:06:36.707758+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-21-FROM---*****06*6621-0	2024-05-21 - FROM - *****06*6621 - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
89	2024-06-07 13:06:36.709204+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-21-FIVE-BELOW-638-LOUISVILLE-KY-AMT-17.71-(APPLE-PAY)--24.83	2024-05-21 - FIVE BELOW 638 LOUISVILLE KY AMT 17.71 (APPLE PAY) - -24.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
90	2024-06-07 13:06:36.71071+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-21-BENTO-ASIAN-RESTAURANT-LOUISVILLE-KY-AMT-10.06-(APPLE-PAY)--14.06	2024-05-21 - BENTO ASIAN RESTAURANT LOUISVILLE KY AMT 10.06 (APPLE PAY) - -14.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
91	2024-06-07 13:06:36.712143+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-20-TARGET-00027284-MIDDLETOWN-KY-AMT-34.62-(APPLE-PAY)--48.43	2024-05-20 - TARGET 00027284 MIDDLETOWN KY AMT 34.62 (APPLE PAY) - -48.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
92	2024-06-07 13:06:36.713411+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-20-LING-LING-CHINESE-LOUISVILLE-KY-AMT-10.10-(APPLE-PAY)--14.11	2024-05-20 - LING LING CHINESE LOUISVILLE KY AMT 10.10 (APPLE PAY) - -14.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
93	2024-06-07 13:06:36.714793+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-Tommy-Hilfiger-Simpsonville-KY-AMT-49.69-(APPLE-PAY)--69.51	2024-05-19 - Tommy Hilfiger Simpsonville KY AMT 49.69 (APPLE PAY) - -69.51	2	[{"changed": {"fields": ["Category"]}}]	7	1
94	2024-06-07 13:06:36.716223+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-HARAZ-COFFEE-LOUISVILLE-KY-AMT-42.96-(APPLE-PAY)--60.1	2024-05-19 - HARAZ COFFEE LOUISVILLE KY AMT 42.96 (APPLE PAY) - -60.10	2	[{"changed": {"fields": ["Category"]}}]	7	1
95	2024-06-07 13:06:36.717685+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-FIRST-WATCH---602---MIDDLLOUISVILLE-KY-AMT-23.50-(APPLE-PAY)--32.87	2024-05-19 - FIRST WATCH - 602 - MIDDLLOUISVILLE KY AMT 23.50 (APPLE PAY) - -32.87	2	[{"changed": {"fields": ["Category"]}}]	7	1
96	2024-06-07 13:06:36.719126+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-EDDIEBAUER-4224-SIMPSONVILL-KY-AMT-84.80-(APPLE-PAY)--118.62	2024-05-19 - EDDIEBAUER 4224 SIMPSONVILL KY AMT 84.80 (APPLE PAY) - -118.62	2	[{"changed": {"fields": ["Category"]}}]	7	1
97	2024-06-07 13:06:36.720422+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-DRAGON-KINGS-DAUGHTER-502-6322444-KY-AMT-13.66--19.11	2024-05-19 - DRAGON KINGS DAUGHTER 502-6322444 KY AMT 13.66 - -19.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
98	2024-06-07 13:06:36.721719+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-CH-SIMPSONVILLE,-KY-#183-SIMPSONVILLE-KY-AMT-74.19-(APPLE-PAY)--103.78	2024-05-19 - CH-SIMPSONVILLE, KY #183 SIMPSONVILLE KY AMT 74.19 (APPLE PAY) - -103.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
99	2024-06-07 13:06:36.723016+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-Calvin-Klein-Simpsonville-KY-AMT-76.53-(APPLE-PAY)--107.05	2024-05-19 - Calvin Klein Simpsonville KY AMT 76.53 (APPLE PAY) - -107.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
191	2024-06-07 16:36:10.692421+00	test	2024-06-07 - restaurant simon bermudez - 100000	1	[{"added": {}}]	7	1
100	2024-06-07 13:06:36.724333+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-19-BR-FACTORY-US-1238-SIMPSONVILLE-KY-AMT-21.20-(APPLE-PAY)--29.65	2024-05-19 - BR FACTORY US 1238 SIMPSONVILLE KY AMT 21.20 (APPLE PAY) - -29.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
101	2024-06-07 13:06:36.725879+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-18-TST*-VINBUN-VIETNAMESE-BIMiddletown-KY-AMT-7.42--10.38	2024-05-18 - TST* VINBUN VIETNAMESE BIMiddletown KY AMT 7.42 - -10.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
102	2024-06-07 13:06:36.727244+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-18-STARBUCKS-T3-MISSISSAUGA-ON-(APPLE-PAY)--14.07	2024-05-18 - STARBUCKS T3 MISSISSAUGA ON (APPLE PAY) - -14.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
103	2024-06-07 13:06:36.72858+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-18-DTW-PAPA-JOES-MARKET-1128DETROIT-MI-AMT-10.06-(APPLE-PAY)--14.07	2024-05-18 - DTW PAPA JOES MARKET 1128DETROIT MI AMT 10.06 (APPLE PAY) - -14.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
104	2024-06-07 13:06:36.729994+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-18-DELTA-AIR-Baggage-Fee-TORONTO-QC--35	2024-05-18 - DELTA AIR Baggage Fee TORONTO QC - -35.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
105	2024-06-07 13:06:36.731396+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-16-R&D-RESTAURANT-TORONTO-ON-(APPLE-PAY)--245.44	2024-05-16 - R&D RESTAURANT TORONTO ON (APPLE PAY) - -245.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
106	2024-06-07 13:06:36.732747+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-15-PRESTO-FARE/5526C5MZHP-TORONTO-ON-(APPLE-PAY)--3.3	2024-05-15 - PRESTO FARE/5526C5MZHP TORONTO ON (APPLE PAY) - -3.30	2	[{"changed": {"fields": ["Category"]}}]	7	1
107	2024-06-07 13:06:36.734038+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-15-OH-MY-GYRO-TORONTO-ON-(APPLE-PAY)--3.09	2024-05-15 - OH MY GYRO TORONTO ON (APPLE PAY) - -3.09	2	[{"changed": {"fields": ["Category"]}}]	7	1
108	2024-06-07 13:06:36.735431+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-15-OH-MY-GYRO-TORONTO-ON-(APPLE-PAY)--15.48	2024-05-15 - OH MY GYRO TORONTO ON (APPLE PAY) - -15.48	2	[{"changed": {"fields": ["Category"]}}]	7	1
109	2024-06-07 13:06:36.736802+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-15-LYFT-*RIDE-WED-12PM-VANCOUVER-BC-(APPLE-PAY)--8.84	2024-05-15 - LYFT *RIDE WED 12PM VANCOUVER BC (APPLE PAY) - -8.84	2	[{"changed": {"fields": ["Category"]}}]	7	1
110	2024-06-07 13:06:36.738207+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-14-HAY-SUSHI-TORONTO-ON-(APPLE-PAY)--18.16	2024-05-14 - HAY SUSHI TORONTO ON (APPLE PAY) - -18.16	2	[{"changed": {"fields": ["Category"]}}]	7	1
111	2024-06-07 13:06:36.739538+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-12-LS-Comedy-Bar-Danforth-Toronto-ON-(APPLE-PAY)--12.09	2024-05-12 - LS Comedy Bar Danforth Toronto ON (APPLE PAY) - -12.09	2	[{"changed": {"fields": ["Category"]}}]	7	1
112	2024-06-07 13:06:36.740919+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-11-THE-GREEN-DRAGON-PUB-INC.TORONTO-ON-(APPLE-PAY)--9.49	2024-05-11 - THE GREEN DRAGON PUB INC.TORONTO ON (APPLE PAY) - -9.49	2	[{"changed": {"fields": ["Category"]}}]	7	1
113	2024-06-07 13:06:36.742334+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-11-PRESTO-FARE/5597K076MF-TORONTO-ON-(APPLE-PAY)--3.3	2024-05-11 - PRESTO FARE/5597K076MF TORONTO ON (APPLE PAY) - -3.30	2	[{"changed": {"fields": ["Category"]}}]	7	1
114	2024-06-07 13:06:36.743765+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-11-COMEDY-BAR-DANFORTH-TORONTO-ON-(APPLE-PAY)--20.83	2024-05-11 - COMEDY BAR DANFORTH TORONTO ON (APPLE PAY) - -20.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
115	2024-06-07 13:06:36.745194+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-11-COCO-FRESH-TEA-&-JUICE-TORONTO-ON-(APPLE-PAY)--15.9	2024-05-11 - COCO FRESH TEA & JUICE TORONTO ON (APPLE PAY) - -15.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
116	2024-06-07 13:06:36.746533+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-TBJ-CONCESSIONS-TORONTO-ON-(APPLE-PAY)--11.68	2024-05-10 - TBJ CONCESSIONS TORONTO ON (APPLE PAY) - -11.68	2	[{"changed": {"fields": ["Category"]}}]	7	1
117	2024-06-07 13:06:36.74781+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-PRESTO-FARE/559J5FT7T5-TORONTO-ON-(APPLE-PAY)--3.3	2024-05-10 - PRESTO FARE/559J5FT7T5 TORONTO ON (APPLE PAY) - -3.30	2	[{"changed": {"fields": ["Category"]}}]	7	1
118	2024-06-07 13:06:36.749077+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-INTEREST-CHARGES-PURCHASE--170.47	2024-05-10 - INTEREST CHARGES-PURCHASE - -170.47	2	[{"changed": {"fields": ["Category"]}}]	7	1
119	2024-06-07 13:06:36.750457+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-1-OF-3-PAYMENTS--85.8	2024-05-10 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 1 OF 3 PAYMENTS - -85.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
120	2024-06-07 13:06:36.751803+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-1-OF-3-PAYMENTS--184.75	2024-05-10 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 1 OF 3 PAYMENTS - -184.75	2	[{"changed": {"fields": ["Category"]}}]	7	1
121	2024-06-07 13:06:36.753071+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-AIRALO-SINGAPORE-AMT-6.00-(APPLE-PAY)--8.45	2024-05-10 - AIRALO SINGAPORE AMT 6.00 (APPLE PAY) - -8.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
122	2024-06-07 13:06:36.754377+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-09-FLYING-DOGS-Panama-AMT-13.00-(APPLE-PAY)--18.31	2024-05-09 - FLYING DOGS Panama AMT 13.00 (APPLE PAY) - -18.31	2	[{"changed": {"fields": ["Category"]}}]	7	1
123	2024-06-07 13:06:36.755699+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-09-ARANCINI-SNACK-CA-CCS-NOROESTE-AMT-695.00--26.82	2024-05-09 - ARANCINI SNACK CA CCS NOROESTE AMT 695.00 - -26.82	2	[{"changed": {"fields": ["Category"]}}]	7	1
124	2024-06-07 13:06:36.757055+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-09-ARANCINI-SNACK-CA-CCS-NOROESTE-AMT-109.74--4.23	2024-05-09 - ARANCINI SNACK CA CCS NOROESTE AMT 109.74 - -4.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
125	2024-06-07 13:06:36.758355+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-08-WECOOK-844-4932665-QC--99.69	2024-05-08 - WECOOK 844-4932665 QC - -99.69	2	[{"changed": {"fields": ["Category"]}}]	7	1
126	2024-06-07 13:06:36.759592+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-08-OBSESSION-2005-CARACAS-AMT-551.32--21.3	2024-05-08 - OBSESSION 2005 CARACAS AMT 551.32 - -21.30	2	[{"changed": {"fields": ["Category"]}}]	7	1
127	2024-06-07 13:06:36.76083+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-08-INVERSIONES-RG-11-32-CA-CCS-NOROESTE-AMT-3,335.92--128.74	2024-05-08 - INVERSIONES RG 11 32 CA CCS NOROESTE AMT 3,335.92 - -128.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
128	2024-06-07 13:06:36.762144+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-08-FARMACIA-TOPACIO-CARACAS-AMT-483.71--18.69	2024-05-08 - FARMACIA TOPACIO CARACAS AMT 483.71 - -18.69	2	[{"changed": {"fields": ["Category"]}}]	7	1
129	2024-06-07 13:06:36.763392+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-07-PANADERIA-Y-PAST-EUROLATCARACAS-AMT-408.96--15.74	2024-05-07 - PANADERIA Y PAST EUROLATCARACAS AMT 408.96 - -15.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
130	2024-06-07 13:06:36.764632+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-05-INVERS-PINCHO-PAN-EXPRESSCCS-NOROESTE-AMT-772.96--29.75	2024-05-05 - INVERS PINCHO PAN EXPRESSCCS NOROESTE AMT 772.96 - -29.75	2	[{"changed": {"fields": ["Category"]}}]	7	1
131	2024-06-07 13:06:36.765996+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-05-GC-LAS-MERCEDES,C.A-MIRANDA-AMT-1,300.00--50.01	2024-05-05 - GC LAS MERCEDES,C.A MIRANDA AMT 1,300.00 - -50.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
132	2024-06-07 13:06:36.767417+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-04-OLG-1-800-387-0098-NORTH-YORK-ON--5	2024-05-04 - OLG 1 800 387 0098 NORTH YORK ON - -5.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
133	2024-06-07 13:06:36.76881+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-03-PANADERIA-Y-PAST-EUROLATCARACAS-AMT-342.44--13.24	2024-05-03 - PANADERIA Y PAST EUROLATCARACAS AMT 342.44 - -13.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
134	2024-06-07 13:06:36.770272+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-03-LABORATORIO-HELIANTUS-CA-CCS-NOROESTE-AMT-1,168.00--44.93	2024-05-03 - LABORATORIO HELIANTUS CA CCS NOROESTE AMT 1,168.00 - -44.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
135	2024-06-07 13:06:36.771691+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-03-INSIDE-MARKET-CANDELARIA-CARACAS-AMT-399.58--15.46	2024-05-03 - INSIDE MARKET CANDELARIA CARACAS AMT 399.58 - -15.46	2	[{"changed": {"fields": ["Category"]}}]	7	1
136	2024-06-07 13:06:36.773097+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-02-SUN-LIFE-CHOICES-A&A-800-669-7921-ON--40.48	2024-05-02 - SUN LIFE CHOICES A&A 800-669-7921 ON - -40.48	2	[{"changed": {"fields": ["Category"]}}]	7	1
137	2024-06-07 13:06:36.774546+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-02-PAYBRIGHT-877-2762780-ON--70.79	2024-05-02 - PAYBRIGHT 877-2762780 ON - -70.79	2	[{"changed": {"fields": ["Category"]}}]	7	1
138	2024-06-07 13:06:36.77593+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-02-PAYBRIGHT-877-2762780-ON--10.38	2024-05-02 - PAYBRIGHT 877-2762780 ON - -10.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
139	2024-06-07 13:06:36.777212+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-02-MCDONALDS-SAMBIL-LA-CANDEDISTRITO-CAPI-AMT-692.98--26.8	2024-05-02 - MCDONALDS SAMBIL LA CANDEDISTRITO CAPI AMT 692.98 - -26.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
140	2024-06-07 13:06:36.77852+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-01-PADDLE.NET*-SETAPP-LONDON-AMT-2.83--4	2024-05-01 - PADDLE.NET* SETAPP LONDON AMT 2.83 - -4.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
141	2024-06-07 13:06:36.779776+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-01-PADDLE.NET*-SETAPP-LONDON-AMT-11.29--15.95	2024-05-01 - PADDLE.NET* SETAPP LONDON AMT 11.29 - -15.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
142	2024-06-07 13:06:36.781106+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-01-MAKAO-CAF--GELATO-SALAD-CARACAS-AMT-364.26--14.15	2024-05-01 - MAKAO CAF -GELATO-SALAD CARACAS AMT 364.26 - -14.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
143	2024-06-07 13:06:36.782502+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-01-INVERSIONES-FLORENCIA-77-CCS-NOROESTE-AMT-1,529.63--59.17	2024-05-01 - INVERSIONES FLORENCIA 77 CCS NOROESTE AMT 1,529.63 - -59.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
144	2024-06-07 13:06:36.783761+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-01-ESTACIONAMIENTO-C.C-TOLONCARACAS-AMT-144.59--5.62	2024-05-01 - ESTACIONAMIENTO C.C TOLONCARACAS AMT 144.59 - -5.62	2	[{"changed": {"fields": ["Category"]}}]	7	1
145	2024-06-07 13:06:36.784999+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-01-CINEX-TAQUILLA-TOLON-CARACAS-AMT-437.64--16.99	2024-05-01 - CINEX TAQUILLA TOLON CARACAS AMT 437.64 - -16.99	2	[{"changed": {"fields": ["Category"]}}]	7	1
146	2024-06-07 13:06:36.786325+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-30-FROM---*****06*6621-0	2024-04-30 - FROM - *****06*6621 - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
147	2024-06-07 13:06:36.787611+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-29-INSIDE-MARKET-CANDELARIA-CARACAS-AMT-9,394.56--362.98	2024-04-29 - INSIDE MARKET CANDELARIA CARACAS AMT 9,394.56 - -362.98	2	[{"changed": {"fields": ["Category"]}}]	7	1
148	2024-06-07 13:06:36.78885+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-28-PANADERIA-OPERA-DELI-MADADISTRITO-CAPI-AMT-642.19--24.82	2024-04-28 - PANADERIA OPERA DELI MADADISTRITO CAPI AMT 642.19 - -24.82	2	[{"changed": {"fields": ["Category"]}}]	7	1
149	2024-06-07 13:06:36.790135+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-27-INVERSIONES-J-Y-J-2040-CACARACAS-AMT-528.23--20.41	2024-04-27 - INVERSIONES J Y J 2040 CACARACAS AMT 528.23 - -20.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
150	2024-06-07 13:06:36.791527+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-27-FARMATODO-EXPRESO-CARACAS-AMT-108.67--4.2	2024-04-27 - FARMATODO EXPRESO CARACAS AMT 108.67 - -4.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
151	2024-06-07 13:06:36.792916+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-27-FARMATODO-EXPRESO-CARACAS-AMT-1,031.39--39.85	2024-04-27 - FARMATODO EXPRESO CARACAS AMT 1,031.39 - -39.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
152	2024-06-07 13:06:36.794306+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-26-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-418.95--16.18	2024-04-26 - INVERSIONES J J 2040 C CCS NOROESTE AMT 418.95 - -16.18	2	[{"changed": {"fields": ["Category"]}}]	7	1
153	2024-06-07 13:06:36.795621+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-26-DELTA-AIR-0062230994550VANCOUVER-QC--258.51	2024-04-26 - DELTA AIR 0062230994550VANCOUVER QC - -258.51	2	[{"changed": {"fields": ["Category"]}}]	7	1
154	2024-06-07 13:06:36.796883+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-25-SUPERMERCADO-CENTRAL-AVIDISTRITO-CAPI-AMT-724.40--28.06	2024-04-25 - SUPERMERCADO CENTRAL AVIDISTRITO CAPI AMT 724.40 - -28.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
155	2024-06-07 13:06:36.798271+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-25-BELL-CANADA-(OB)-MONTREAL-QC--56.44	2024-04-25 - BELL CANADA (OB) MONTREAL QC - -56.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
156	2024-06-07 13:06:36.799662+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-24-SUPERMERCADO-CENTRAL-AVIDISTRITO-CAPI-AMT-834.20--32.32	2024-04-24 - SUPERMERCADO CENTRAL AVIDISTRITO CAPI AMT 834.20 - -32.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
157	2024-06-07 13:06:36.801059+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-24-SUPERMERCADO-CENTRAL-AVIDISTRITO-CAPI-AMT-347.67--13.47	2024-04-24 - SUPERMERCADO CENTRAL AVIDISTRITO CAPI AMT 347.67 - -13.47	2	[{"changed": {"fields": ["Category"]}}]	7	1
158	2024-06-07 13:06:36.802472+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-24-FREEDOM-MOBILE-877-946-3184-ON--101.7	2024-04-24 - FREEDOM MOBILE 877-946-3184 ON - -101.70	2	[{"changed": {"fields": ["Category"]}}]	7	1
159	2024-06-07 13:06:36.803725+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-23-INVERSIONES-FLORENCIA-77-CCS-NOROESTE-AMT-72.52--2.81	2024-04-23 - INVERSIONES FLORENCIA 77 CCS NOROESTE AMT 72.52 - -2.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
160	2024-06-07 13:06:36.804987+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-23-INVERSIONES-FLORENCIA-77-CCS-NOROESTE-AMT-1,308.01--50.68	2024-04-23 - INVERSIONES FLORENCIA 77 CCS NOROESTE AMT 1,308.01 - -50.68	2	[{"changed": {"fields": ["Category"]}}]	7	1
161	2024-06-07 13:06:36.806389+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-23-FRIGORIFICO-REY-DAVID-CARACAS-AMT-189.02--7.35	2024-04-23 - FRIGORIFICO REY DAVID CARACAS AMT 189.02 - -7.35	2	[{"changed": {"fields": ["Category"]}}]	7	1
162	2024-06-07 13:06:36.807717+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-23-FARMACIA-CAJIGAL-CA-CCS-NOROESTE-AMT-404.40--15.66	2024-04-23 - FARMACIA CAJIGAL CA CCS NOROESTE AMT 404.40 - -15.66	2	[{"changed": {"fields": ["Category"]}}]	7	1
163	2024-06-07 13:06:36.808983+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-23-ESTACIONAMIENTO-C.C-TOLONCARACAS-AMT-144.31--5.59	2024-04-23 - ESTACIONAMIENTO C.C TOLONCARACAS AMT 144.31 - -5.59	2	[{"changed": {"fields": ["Category"]}}]	7	1
164	2024-06-07 13:06:36.810265+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-22-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-ENROLLMENT-548.74	2024-04-22 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT ENROLLMENT - 548.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
165	2024-06-07 13:06:36.811502+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-22-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-ENROLLMENT-254.85	2024-04-22 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT ENROLLMENT - 254.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
166	2024-06-07 13:06:36.812847+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-21-PIQUIN-LA-CANDELARIA-CCS-NOROESTE-AMT-1,108.36--43.27	2024-04-21 - PIQUIN LA CANDELARIA CCS NOROESTE AMT 1,108.36 - -43.27	2	[{"changed": {"fields": ["Category"]}}]	7	1
167	2024-06-07 13:06:36.814146+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-21-PANADERIA-Y-PAST-EUROLATCARACAS-AMT-468.79--18.3	2024-04-21 - PANADERIA Y PAST EUROLATCARACAS AMT 468.79 - -18.30	2	[{"changed": {"fields": ["Category"]}}]	7	1
168	2024-06-07 13:06:36.815532+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-21-FARMATODO-CANDELARIA-II-CARACAS-AMT-423.88--16.54	2024-04-21 - FARMATODO CANDELARIA II CARACAS AMT 423.88 - -16.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
169	2024-06-07 13:06:36.816861+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-20-PANADERIA-Y-PAST-EUROLATCARACAS-AMT-363.42--14.18	2024-04-20 - PANADERIA Y PAST EUROLATCARACAS AMT 363.42 - -14.18	2	[{"changed": {"fields": ["Category"]}}]	7	1
170	2024-06-07 13:06:36.818249+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-20-COPA-AIR-2300033349805507-2172672-AMT-69.70--98.64	2024-04-20 - COPA AIR 2300033349805507-2172672 AMT 69.70 - -98.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
171	2024-06-07 13:06:36.819508+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-19-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-461.52--18.02	2024-04-19 - INVERSIONES J J 2040 C CCS NOROESTE AMT 461.52 - -18.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
172	2024-06-07 13:09:32.608975+00	Furniture	Furniture	1	[{"added": {}}]	8	1
173	2024-06-07 13:10:11.477415+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-19-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-363.01--14.18	2024-04-19 - INVERSIONES J J 2040 C CCS NOROESTE AMT 363.01 - -14.18	2	[{"changed": {"fields": ["Category"]}}]	7	1
174	2024-06-07 13:10:11.479331+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-16-YUMMY-DELIVERY-HTTPSYUMMYSUPCA-AMT-21.90--31.09	2024-04-16 - YUMMY DELIVERY HTTPSYUMMYSUPCA AMT 21.90 - -31.09	2	[{"changed": {"fields": ["Category"]}}]	7	1
175	2024-06-07 13:10:11.480728+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-16-INSIDE-MARKET-CANDELARIA-CARACAS-AMT-13,996.52--548.74	2024-04-16 - INSIDE MARKET CANDELARIA CARACAS AMT 13,996.52 - -548.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
176	2024-06-07 13:10:11.482321+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-15-SUPERMERCADO-CENTRAL-AVILCCS-NOROESTE-AMT-359.27--14.08	2024-04-15 - SUPERMERCADO CENTRAL AVILCCS NOROESTE AMT 359.27 - -14.08	2	[{"changed": {"fields": ["Category"]}}]	7	1
177	2024-06-07 13:10:11.483841+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-15-GOOGLE*DOMAINS-G.CO/HELPPAY#NS--19.21	2024-04-15 - GOOGLE*DOMAINS G.CO/HELPPAY#NS - -19.21	2	[{"changed": {"fields": ["Category"]}}]	7	1
178	2024-06-07 13:10:11.485167+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-14-YENNIFER-LISSET-BARROSO-CCS-NOROESTE-AMT-1,238.71--48.36	2024-04-14 - YENNIFER LISSET BARROSO CCS NOROESTE AMT 1,238.71 - -48.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
179	2024-06-07 13:10:11.486589+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-13-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-778.94--30.41	2024-04-13 - INVERSIONES J J 2040 C CCS NOROESTE AMT 778.94 - -30.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
180	2024-06-07 13:10:11.488014+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-13-FROM---*****06*6621-0	2024-04-13 - FROM - *****06*6621 - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
181	2024-06-07 13:10:11.489407+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-13-FARMACIAS-MAS-SALUD-CA-CCS-NOROESTE-AMT-397.73--15.53	2024-04-13 - FARMACIAS MAS SALUD CA CCS NOROESTE AMT 397.73 - -15.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
182	2024-06-07 13:10:11.49072+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-12-MANGO-BAJITO-CC-SAMBIL-LACARACAS-AMT-2,736.60--106.85	2024-04-12 - MANGO BAJITO CC SAMBIL LACARACAS AMT 2,736.60 - -106.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
183	2024-06-07 13:10:11.492067+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-12-INVERSIONES-ANUT-2022-CA-CCS-NOROESTE-AMT-988.88--38.61	2024-04-12 - INVERSIONES ANUT 2022 CA CCS NOROESTE AMT 988.88 - -38.61	2	[{"changed": {"fields": ["Category"]}}]	7	1
184	2024-06-07 13:10:11.493508+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-12-INSIDE-MARKET-CANDELARIA-CARACAS-AMT-6,527.53--254.85	2024-04-12 - INSIDE MARKET CANDELARIA CARACAS AMT 6,527.53 - -254.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
185	2024-06-07 13:10:11.494928+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-11-MANGO-BAJITO-EL-RCREO-MECARACAS-AMT-1,814.43--70.61	2024-04-11 - MANGO BAJITO EL RCREO MECARACAS AMT 1,814.43 - -70.61	2	[{"changed": {"fields": ["Category"]}}]	7	1
186	2024-06-07 13:10:11.496326+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-11-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-152.18--5.91	2024-04-11 - INVERSIONES J J 2040 C CCS NOROESTE AMT 152.18 - -5.91	2	[{"changed": {"fields": ["Category"]}}]	7	1
187	2024-06-07 13:10:11.497654+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-04-11-FARMACIA-OPALO-CARACAS-AMT-1,654.18--64.38	2024-04-11 - FARMACIA OPALO CARACAS AMT 1,654.18 - -64.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
188	2024-06-07 15:21:43.649845+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CAFE-MONSTRUO--34.37	2024-06-07 - CAFE MONSTRUO - -34.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
189	2024-06-07 15:34:50.174029+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CAFE-MONSTRUO--34.37	2024-06-07 - CAFE MONSTRUO - -34.37	3		7	1
190	2024-06-07 16:35:36.738122+00	1	restaurant -> Food	1	[{"added": {}}]	9	1
192	2024-06-07 16:37:54.337234+00	test	2024-06-07 - restaurant simon bermudez - 100000.00	2	[]	7	1
193	2024-06-07 16:38:03.346457+00	test	2024-06-07 - restaurant s - 100000.00	2	[{"changed": {"fields": ["Description"]}}]	7	1
194	2024-06-07 16:38:39.851807+00	test	2024-06-07 - restaurant s - 100000.00	2	[]	7	1
195	2024-06-07 16:39:01.571053+00	test	2024-06-07 - restaurant s - 100000.00	3		7	1
196	2024-06-07 16:39:18.694586+00	test	2024-06-07 - Restaurant SIMON BERMUDEZ - 1	1	[{"added": {}}]	7	1
197	2024-06-07 16:39:39.265916+00	test	2024-06-07 - Restaurant SIMON BERMUDEZ - 1.00	3		7	1
198	2024-06-07 16:40:02.03828+00	test	2024-06-07 - ReStAuRaNt Simon Bermudez - 1	1	[{"added": {}}]	7	1
199	2024-06-07 16:40:14.942213+00	test	2024-06-07 - ReStAuRaNt Simon Bermudez - 1.00	3		7	1
200	2024-06-07 16:44:21.115356+00	2	farmacia -> Misc	1	[{"added": {}}]	9	1
201	2024-06-07 19:06:53.214443+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CARULLA-FRESH-COUNTRY--19.11	2024-06-07 - CARULLA FRESH COUNTRY - -19.11	3		7	1
202	2024-06-07 19:44:47.198693+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-OCAS-APPLICATION-SERVICESGUELPH-ON--142.65	2024-06-03 - OCAS APPLICATION SERVICESGUELPH ON - -142.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
203	2024-06-07 19:44:47.202048+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-INSIDE-MARKET-CANDELARIA-CARACAS-PLAN-FEE/RATE-1-OF-3-PAYMENTS-0	2024-05-10 - INSIDE MARKET CANDELARIA CARACAS PLAN FEE/RATE 1 OF 3 PAYMENTS - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
204	2024-06-07 19:45:35.371109+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-OCAS-APPLICATION-SERVICESGUELPH-ON--142.65	2024-06-03 - OCAS APPLICATION SERVICESGUELPH ON - -142.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
205	2024-06-07 19:45:45.625182+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-OCAS-APPLICATION-SERVICESGUELPH-ON--142.65	2024-06-03 - OCAS APPLICATION SERVICESGUELPH ON - -142.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
206	2024-06-07 19:47:19.04882+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-03-OCAS-APPLICATION-SERVICESGUELPH-ON--142.65	2024-06-03 - OCAS APPLICATION SERVICESGUELPH ON - -142.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
207	2024-06-07 19:47:19.051681+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-10-INSIDE-MARKET-CANDELARIA-CARACAS-PLAN-FEE/RATE-1-OF-3-PAYMENTS-0	2024-05-10 - INSIDE MARKET CANDELARIA CARACAS PLAN FEE/RATE 1 OF 3 PAYMENTS - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
208	2024-06-07 19:51:28.51357+00	Transport	Transport	2	[{"changed": {"fields": ["Budget"]}}]	8	1
209	2024-06-07 19:52:49.529501+00	Bill	Bill	2	[{"changed": {"fields": ["Budget"]}}]	8	1
210	2024-06-07 19:53:10.947257+00	Bank Fee	Bank Fee	2	[{"changed": {"fields": ["Budget"]}}]	8	1
211	2024-06-07 19:55:32.662154+00	Phone	Phone	2	[{"changed": {"fields": ["Budget"]}}]	8	1
212	2024-06-07 19:55:32.663938+00	Misc	Misc	2	[{"changed": {"fields": ["Budget"]}}]	8	1
213	2024-06-07 19:55:32.665117+00	Life Insurance	Life Insurance	2	[{"changed": {"fields": ["Budget"]}}]	8	1
214	2024-06-07 19:55:32.666417+00	Health	Health	2	[{"changed": {"fields": ["Budget"]}}]	8	1
215	2024-06-07 19:55:32.667689+00	Gift	Gift	2	[{"changed": {"fields": ["Budget"]}}]	8	1
216	2024-06-07 19:55:32.668852+00	Furniture	Furniture	2	[{"changed": {"fields": ["Budget"]}}]	8	1
217	2024-06-07 19:55:32.670016+00	Food	Food	2	[{"changed": {"fields": ["Budget"]}}]	8	1
218	2024-06-07 19:55:32.671309+00	Entertainment	Entertainment	2	[{"changed": {"fields": ["Budget"]}}]	8	1
219	2024-06-07 19:55:32.672462+00	Education	Education	2	[{"changed": {"fields": ["Budget"]}}]	8	1
220	2024-06-07 19:55:32.673641+00	Clothes	Clothes	2	[{"changed": {"fields": ["Budget"]}}]	8	1
221	2024-06-07 19:55:32.674882+00	Air Travel	Air Travel	2	[{"changed": {"fields": ["Budget"]}}]	8	1
222	2024-06-07 19:56:17.20096+00	Credit Card Payment	Credit Card Payment	2	[{"changed": {"fields": ["Budget"]}}]	8	1
223	2024-06-07 20:01:25.695971+00	Air Travel	Air Travel	2	[{"changed": {"fields": ["Budget"]}}]	8	1
224	2024-06-07 20:37:37.195684+00	Bills	Bills	2	[{"changed": {"fields": ["Name"]}}]	8	1
225	2024-06-07 20:38:01.469747+00	Misc	Misc	2	[{"changed": {"fields": ["Budget"]}}]	8	1
226	2024-06-08 10:37:33.99501+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-VECCINA--55.41	2024-06-07 - VECCINA - -55.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
227	2024-06-08 10:37:33.997786+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-JUAN-VALDEZ-CLL-85-CON-15--16.16	2024-06-07 - JUAN VALDEZ CLL 85 CON 15 - -16.16	2	[{"changed": {"fields": ["Category"]}}]	7	1
228	2024-06-08 10:37:34.000161+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-COMCEL-CAV-CENTRO-ANDINO--50.82	2024-06-07 - COMCEL CAV CENTRO ANDINO - -50.82	2	[{"changed": {"fields": ["Category"]}}]	7	1
229	2024-06-08 10:58:48.49583+00	Transfer Between Accounts	Transfer Between Accounts	1	[{"added": {}}]	8	1
230	2024-06-08 11:00:38.857545+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-LA-BARBERIA-LOUNGE-Y-S-1100100-BOGOT-AMT-569,250.00-(APPLE-PAY)--205.11	2024-06-05 - LA BARBERIA LOUNGE Y S 1100100 BOGOT AMT 569,250.00 (APPLE PAY) - -205.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
231	2024-06-08 11:00:38.860346+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-CENTRAL-CEVICHERIA-1100100-BOGOT-AMT-87,290.00-(APPLE-PAY)--31.46	2024-06-05 - CENTRAL CEVICHERIA 1100100 BOGOT AMT 87,290.00 (APPLE PAY) - -31.46	2	[{"changed": {"fields": ["Category"]}}]	7	1
232	2024-06-08 11:00:38.86275+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-CAFE-MONSTRUO-BOGOTA-AMT-104,452.00--38	2024-06-05 - CAFE MONSTRUO BOGOTA AMT 104,452.00 - -38.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
233	2024-06-08 11:00:38.865708+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-06-05-AIRALO-SINGAPORE-AMT-8.00--11.23	2024-06-05 - AIRALO SINGAPORE AMT 8.00 - -11.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
234	2024-06-08 11:00:38.867993+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-06-04-SCOTIABANK-TRANSIT-21212-TORONTO-ON-25.23	2024-06-04 - SCOTIABANK TRANSIT 21212 TORONTO ON - 25.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
235	2024-06-08 11:00:38.870201+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-30-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-376.05--14.52	2024-05-30 - INVERSIONES J J 2040 C CCS NOROESTE AMT 376.05 - -14.52	2	[{"changed": {"fields": ["Category"]}}]	7	1
236	2024-06-08 11:00:38.872532+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-28-INVERSIONES-COVAS-PRAIA-CCARACAS-AMT-730.24--28.24	2024-05-28 - INVERSIONES COVAS PRAIA CCARACAS AMT 730.24 - -28.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
237	2024-06-08 11:00:38.874905+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-21-INVERSIONES-J-Y-J-2040-CACARACAS-AMT-311.10--11.96	2024-05-21 - INVERSIONES J Y J 2040 CACARACAS AMT 311.10 - -11.96	2	[{"changed": {"fields": ["Category"]}}]	7	1
274	2024-06-09 22:34:07.957215+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-JUAN-EL-PANADERO-SAS--24.67	2024-06-08 - JUAN EL PANADERO SAS - -24.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
238	2024-06-08 11:00:38.877244+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-19-MCDONALDS-SAMBIL-LA-CANDEDISTRITO-CAPI-AMT-219.76--8.43	2024-05-19 - MCDONALDS SAMBIL LA CANDEDISTRITO CAPI AMT 219.76 - -8.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
239	2024-06-08 11:00:38.879653+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-15-FARMACIA-TOPACIO-CARACAS-AMT-599.98--23.07	2024-05-15 - FARMACIA TOPACIO CARACAS AMT 599.98 - -23.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
240	2024-06-08 11:00:38.881912+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-12-OPERACIONES-LA-CANDELARIACARACAS-AMT-109.74--4.21	2024-05-12 - OPERACIONES LA CANDELARIACARACAS AMT 109.74 - -4.21	2	[{"changed": {"fields": ["Category"]}}]	7	1
241	2024-06-08 11:00:38.884299+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-12-INVERSIONES-J-J-2040-C-CCS-NOROESTE-AMT-676.91--26.01	2024-05-12 - INVERSIONES J J 2040 C CCS NOROESTE AMT 676.91 - -26.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
242	2024-06-08 11:00:38.88649+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-12-INSIDE-MARKET-CANDELARIA-CARACAS-AMT-601.76--23.12	2024-05-12 - INSIDE MARKET CANDELARIA CARACAS AMT 601.76 - -23.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
243	2024-06-08 11:00:38.888745+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-09-INTEREST-CHARGES-PURCHASE--15.23	2024-05-09 - INTEREST CHARGES-PURCHASE - -15.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
244	2024-06-08 11:00:38.891002+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-06-SCOTIABANK-TRANSIT-21212-TORONTO-ON-22.24	2024-05-06 - SCOTIABANK TRANSIT 21212 TORONTO ON - 22.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
245	2024-06-08 11:00:38.893335+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-04-15-SUPERMERCADO-CENTRAL-AVIDISTRITO-CAPI-AMT-428.60--16.74	2024-04-15 - SUPERMERCADO CENTRAL AVIDISTRITO CAPI AMT 428.60 - -16.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
246	2024-06-08 11:00:38.895589+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-04-14-REAL-DEBRID-LEVALLOIS-PER-AMT-16.00--24.1	2024-04-14 - REAL DEBRID LEVALLOIS-PER AMT 16.00 - -24.10	2	[{"changed": {"fields": ["Category"]}}]	7	1
247	2024-06-08 11:00:38.898+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-04-12-OPERACIONES-LA-CANDELARIACCS-NOROESTE-AMT-108.84--4.25	2024-04-12 - OPERACIONES LA CANDELARIACCS NOROESTE AMT 108.84 - -4.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
248	2024-06-08 11:00:38.900386+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-04-12-IL-PROFUMO-DELL-AMORE,-C.DISTRITO-CAPI-AMT-834.44--32.45	2024-04-12 - IL PROFUMO DELL AMORE, C.DISTRITO CAPI AMT 834.44 - -32.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
249	2024-06-08 11:01:20.565824+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-06-04-SCOTIABANK-TRANSIT-21212-TORONTO-ON-25.23	2024-06-04 - SCOTIABANK TRANSIT 21212 TORONTO ON - 25.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
250	2024-06-08 11:01:20.568975+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-09-INTEREST-CHARGES-PURCHASE--15.23	2024-05-09 - INTEREST CHARGES-PURCHASE - -15.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
251	2024-06-08 11:01:20.571227+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-06-SCOTIABANK-TRANSIT-21212-TORONTO-ON-22.24	2024-05-06 - SCOTIABANK TRANSIT 21212 TORONTO ON - 22.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
252	2024-06-08 11:01:57.122727+00	3	interest -> Bank Fee	1	[{"added": {}}]	9	1
253	2024-06-08 11:02:17.13753+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-09-INTEREST-CHARGES-PURCHASE--15.23	2024-05-09 - INTEREST CHARGES-PURCHASE - -15.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
254	2024-06-08 11:02:43.346086+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-06-04-SCOTIABANK-TRANSIT-21212-TORONTO-ON-25.23	2024-06-04 - SCOTIABANK TRANSIT 21212 TORONTO ON - 25.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
255	2024-06-08 11:02:43.34878+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-06-SCOTIABANK-TRANSIT-21212-TORONTO-ON-22.24	2024-05-06 - SCOTIABANK TRANSIT 21212 TORONTO ON - 22.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
256	2024-06-08 11:03:53.684192+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-06-04-SCOTIABANK-TRANSIT-21212-TORONTO-ON-25.23	2024-06-04 - SCOTIABANK TRANSIT 21212 TORONTO ON - 25.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
257	2024-06-08 11:03:53.687585+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-05-06-SCOTIABANK-TRANSIT-21212-TORONTO-ON-22.24	2024-05-06 - SCOTIABANK TRANSIT 21212 TORONTO ON - 22.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
258	2024-06-08 11:05:28.439979+00	3	interest -> Bank Fee	3		9	1
259	2024-06-08 11:05:48.04734+00	4	interest -> Bank Fee	1	[{"added": {}}]	9	1
260	2024-06-08 11:11:22.593266+00	Insurance	Insurance	1	[{"added": {}}]	8	1
261	2024-06-08 11:12:00.984484+00	ScotiaLine-Line-of-Credit---4537388883602016-2024-06-03-LOLP-AND/OR-HCP-PREMIUM--46.63	2024-06-03 - LOLP AND/OR HCP PREMIUM - -46.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
262	2024-06-08 11:12:00.987273+00	ScotiaLine-Line-of-Credit---4537388883602016-2024-06-03-DIS-AND/OR-JL-PREMIUM(S)--74.23	2024-06-03 - DIS AND/OR JL PREMIUM(S) - -74.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
263	2024-06-08 11:12:00.991229+00	ScotiaLine-for-Students---4538220851237-2024-05-23-INTEREST-CHARGES-CASH--87.73	2024-05-23 - INTEREST CHARGES-CASH - -87.73	2	[{"changed": {"fields": ["Category"]}}]	7	1
264	2024-06-08 11:12:00.995274+00	Scotiabank-Value-VISA---4535097128673029-2024-05-17-INTEREST-CHARGES-CASH--1.07	2024-05-17 - INTEREST CHARGES-CASH - -1.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
265	2024-06-08 11:12:57.928532+00	Insurance	Insurance	2	[{"changed": {"fields": ["Budget"]}}]	8	1
266	2024-06-08 14:42:39.85306+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*-PENDING--4.01	2024-06-08 - UBER * PENDING - -4.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
267	2024-06-09 22:34:07.937632+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-TU-BOLETA--3.59	2024-06-08 - TU BOLETA - -3.59	2	[{"changed": {"fields": ["Category"]}}]	7	1
268	2024-06-09 22:34:07.941066+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-SOTHEN--4.31	2024-06-08 - SOTHEN - -4.31	2	[{"changed": {"fields": ["Category"]}}]	7	1
269	2024-06-09 22:34:07.943673+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-SOTHEN--35.83	2024-06-08 - SOTHEN - -35.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
270	2024-06-09 22:34:07.946395+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-SOTHEN--19.71	2024-06-08 - SOTHEN - -19.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
271	2024-06-09 22:34:07.948803+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-ROKKO-ASIAN-TABLE--47.11	2024-06-08 - ROKKO ASIAN TABLE - -47.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
272	2024-06-09 22:34:07.95158+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-MICAELA-COCINA-ABIERTA--8.24	2024-06-08 - MICAELA COCINA ABIERTA - -8.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
273	2024-06-09 22:34:07.954742+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-MICAELA-COCINA-ABIERTA--4.31	2024-06-08 - MICAELA COCINA ABIERTA - -4.31	2	[{"changed": {"fields": ["Category"]}}]	7	1
275	2024-06-09 22:34:07.959777+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-JARDIN-BOTANICO-DE-BOG--17.92	2024-06-08 - JARDIN BOTANICO DE BOG - -17.92	2	[{"changed": {"fields": ["Category"]}}]	7	1
276	2024-06-09 22:34:07.962341+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-BOLD*A-Manos-Peruana--32.5	2024-06-08 - BOLD*A Manos Peruana - -32.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
277	2024-06-09 22:34:07.964732+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-BNS-SCOTIAONLINE/TELESCOT-529.18	2024-06-08 - BNS SCOTIAONLINE/TELESCOT - 529.18	2	[{"changed": {"fields": ["Category"]}}]	7	1
278	2024-06-10 00:54:40.811505+00	Bills	Bills	3		8	1
279	2024-06-10 00:54:52.246028+00	Bills	Bills	2	[{"changed": {"fields": ["Name"]}}]	8	1
280	2024-06-10 00:55:32.32879+00	Bills	Bills	3		8	1
281	2024-06-11 13:53:08.387994+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-WENDYS-ABASTO--16.65	2024-06-10 - WENDYS ABASTO - -16.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
282	2024-06-11 13:53:08.39103+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-TIENDA-COLON--21.03	2024-06-10 - TIENDA COLON - -21.03	2	[{"changed": {"fields": ["Category"]}}]	7	1
283	2024-06-11 13:53:08.393359+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-PERSONAL-FLOW--9.35	2024-06-10 - PERSONAL FLOW - -9.35	2	[{"changed": {"fields": ["Category"]}}]	7	1
284	2024-06-11 13:53:08.396301+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-PAYU*AR*UBER--4.53	2024-06-10 - PAYU*AR*UBER - -4.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
285	2024-06-11 13:53:08.399013+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-PAYU*AR*UBER--4.44	2024-06-10 - PAYU*AR*UBER - -4.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
286	2024-06-11 13:53:08.401882+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-PAYU*AR*UBER--2.96	2024-06-10 - PAYU*AR*UBER - -2.96	2	[{"changed": {"fields": ["Category"]}}]	7	1
287	2024-06-11 13:53:08.404801+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-MERPAGO*SUPERORO2326--17.71	2024-06-10 - MERPAGO*SUPERORO2326 - -17.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
288	2024-06-11 13:53:08.407161+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-LA-ESTANCIA-ASADOR-CRI--47.44	2024-06-10 - LA ESTANCIA ASADOR CRI - -47.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
289	2024-06-11 13:53:08.40937+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-ENTRADASBA--42.06	2024-06-10 - ENTRADASBA - -42.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
290	2024-06-11 13:53:08.411702+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-8,590.00--3.08	2024-06-09 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 8,590.00 - -3.08	2	[{"changed": {"fields": ["Category"]}}]	7	1
291	2024-06-11 13:53:08.413964+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-8,520.00--3.05	2024-06-09 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 8,520.00 - -3.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
292	2024-06-11 13:53:08.416269+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-44,900.00--16.09	2024-06-09 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 44,900.00 - -16.09	2	[{"changed": {"fields": ["Category"]}}]	7	1
293	2024-06-11 13:53:08.418454+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-R39-CREPESYWAFFLES-AER--38.53	2024-06-09 - R39 CREPESYWAFFLES AER - -38.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
294	2024-06-11 13:53:08.421354+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-MERPAGO*SUPERORO2326--3.51	2024-06-09 - MERPAGO*SUPERORO2326 - -3.51	2	[{"changed": {"fields": ["Category"]}}]	7	1
295	2024-06-11 13:53:08.423802+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-MERPAGO*MAXIKIOSCO--2.34	2024-06-09 - MERPAGO*MAXIKIOSCO - -2.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
296	2024-06-11 13:53:08.426313+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-MERPAGO*AREPERAMISSVENEZU--17.75	2024-06-09 - MERPAGO*AREPERAMISSVENEZU - -17.75	2	[{"changed": {"fields": ["Category"]}}]	7	1
297	2024-06-11 13:53:08.428682+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-DROG-PURA-MUELLE-INTER--31.83	2024-06-09 - DROG PURA MUELLE INTER - -31.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
298	2024-06-11 13:53:08.430982+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-9,970.00--3.58	2024-06-08 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 9,970.00 - -3.58	2	[{"changed": {"fields": ["Category"]}}]	7	1
299	2024-06-11 13:53:08.433227+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-23,540.00--8.44	2024-06-08 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 23,540.00 - -8.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
300	2024-06-11 13:53:08.435631+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-20,090.00--7.2	2024-06-08 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 20,090.00 - -7.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
301	2024-06-11 13:53:08.438006+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-13,260.00--4.76	2024-06-08 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 13,260.00 - -4.76	2	[{"changed": {"fields": ["Category"]}}]	7	1
302	2024-06-11 13:53:08.440418+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-11,500.00--4.12	2024-06-08 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 11,500.00 - -4.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
303	2024-06-11 13:53:08.442855+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-JUAN-EL-PANADERO-SAS-1100100-BOGOT-AMT-68,833.00--24.67	2024-06-08 - JUAN EL PANADERO SAS 1100100 BOGOT AMT 68,833.00 - -24.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
304	2024-06-11 13:53:08.445192+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-BOLD-A-Manos-Peruana-1100100-BOGOT-AMT-90,700.00-(APPLE-PAY)--32.5	2024-06-08 - BOLD A Manos Peruana 1100100 BOGOT AMT 90,700.00 (APPLE PAY) - -32.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
305	2024-06-11 13:53:08.447564+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-VECCINA-1100100-BOGOT-AMT-154,600.00-(APPLE-PAY)--55.41	2024-06-07 - VECCINA 1100100 BOGOT AMT 154,600.00 (APPLE PAY) - -55.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
306	2024-06-11 13:53:08.449993+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-UBER-*TRIP-HELP.UBER.COM-help.uber.com-AMT-21,160.00--7.57	2024-06-07 - UBER *TRIP HELP.UBER.COM help.uber.com AMT 21,160.00 - -7.57	2	[{"changed": {"fields": ["Category"]}}]	7	1
307	2024-06-11 13:53:08.45241+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-JUAN-VALDEZ-CLL-85-CON-BOGOTA-AMT-45,100.00-(APPLE-PAY)--16.16	2024-06-07 - JUAN VALDEZ CLL 85 CON BOGOTA AMT 45,100.00 (APPLE PAY) - -16.16	2	[{"changed": {"fields": ["Category"]}}]	7	1
308	2024-06-11 13:53:08.454782+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-COMCEL-CAV-CENTRO-ANDI-BOGOTA-AMT-141,800.00-(APPLE-PAY)--50.82	2024-06-07 - COMCEL CAV CENTRO ANDI BOGOTA AMT 141,800.00 (APPLE PAY) - -50.82	2	[{"changed": {"fields": ["Category"]}}]	7	1
309	2024-06-11 13:53:08.457025+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CARULLA-FRESH-COUNTRY-1100100-BOGOT-AMT-53,400.00--19.11	2024-06-07 - CARULLA FRESH COUNTRY 1100100 BOGOT AMT 53,400.00 - -19.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
310	2024-06-11 13:53:08.459539+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CAFE-MONSTRUO-BOGOTA-AMT-96,039.00--34.37	2024-06-07 - CAFE MONSTRUO BOGOTA AMT 96,039.00 - -34.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
311	2024-06-11 13:53:33.661612+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-UBER-*-PENDING--3.08	2024-06-09 - UBER * PENDING - -3.08	3		7	1
312	2024-06-11 13:53:33.664568+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*-PENDING--7.2	2024-06-08 - UBER * PENDING - -7.20	3		7	1
313	2024-06-11 13:53:33.665742+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*-PENDING--4.76	2024-06-08 - UBER * PENDING - -4.76	3		7	1
314	2024-06-11 13:53:33.666948+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*-PENDING--4.01	2024-06-08 - UBER * PENDING - -4.01	3		7	1
315	2024-06-11 13:53:33.668181+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-UBER-*-PENDING--3.05	2024-06-08 - UBER * PENDING - -3.05	3		7	1
316	2024-06-11 13:53:33.669302+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-UBER-*-PENDING--4.54	2024-06-06 - UBER * PENDING - -4.54	3		7	1
317	2024-06-11 13:57:56.695064+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-ROKKO-ASIAN-TABLE--47.11	2024-06-08 - ROKKO ASIAN TABLE - -47.11	3		7	1
318	2024-06-11 13:57:56.698739+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-JARDIN-BOTANICO-DE-BOG--17.92	2024-06-08 - JARDIN BOTANICO DE BOG - -17.92	3		7	1
319	2024-06-11 13:57:56.699985+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-VECCINA--55.41	2024-06-07 - VECCINA - -55.41	3		7	1
320	2024-06-11 13:57:56.701194+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-JUAN-VALDEZ-CLL-85-CON-15--16.16	2024-06-07 - JUAN VALDEZ CLL 85 CON 15 - -16.16	3		7	1
321	2024-06-11 13:57:56.702424+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-COMCEL-CAV-CENTRO-ANDINO--50.82	2024-06-07 - COMCEL CAV CENTRO ANDINO - -50.82	3		7	1
322	2024-06-11 13:57:56.703702+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CARULLA-FRESH-COUNTRY--19.11	2024-06-07 - CARULLA FRESH COUNTRY - -19.11	3		7	1
323	2024-06-11 13:57:56.7049+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-07-CAFE-MONSTRUO--34.37	2024-06-07 - CAFE MONSTRUO - -34.37	3		7	1
324	2024-06-11 13:57:56.706343+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-MAEMUKI--51.25	2024-06-06 - MAEMUKI - -51.25	3		7	1
325	2024-06-11 13:57:56.70749+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-LE-PAIN-QUOTIDIEN-RETIRO--23.42	2024-06-06 - LE PAIN QUOTIDIEN RETIRO - -23.42	3		7	1
326	2024-06-11 13:57:56.70859+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-FARMATODO-ANDINO--15.95	2024-06-06 - FARMATODO ANDINO - -15.95	3		7	1
327	2024-06-11 13:57:56.709632+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-CENTRAL-CEVICHERIA--40.9	2024-06-06 - CENTRAL CEVICHERIA - -40.90	3		7	1
328	2024-06-11 13:57:56.71062+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-BOGOTA-BEER-COMPANY--38.69	2024-06-06 - BOGOTA BEER COMPANY - -38.69	3		7	1
329	2024-06-11 13:57:56.711735+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-05-LA-BARBERIA-LOUNGE-Y-S--205.11	2024-06-05 - LA BARBERIA LOUNGE Y S - -205.11	3		7	1
330	2024-06-11 13:59:15.620708+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-TU-BOLETA-BOGOTA-AMT-10,000.00-(APPLE-PAY)--3.59	2024-06-08 - TU BOLETA BOGOTA AMT 10,000.00 (APPLE PAY) - -3.59	2	[{"changed": {"fields": ["Category"]}}]	7	1
331	2024-06-11 13:59:15.623578+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-ROKKO-ASIAN-TABLE-BOGOTA-AMT-131,439.00-(APPLE-PAY)--47.11	2024-06-08 - ROKKO ASIAN TABLE BOGOTA AMT 131,439.00 (APPLE PAY) - -47.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
332	2024-06-11 13:59:15.626032+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-MICAELA-COCINA-ABIERTA-BOGOTA-AMT-23,000.00-(APPLE-PAY)--8.24	2024-06-08 - MICAELA COCINA ABIERTA BOGOTA AMT 23,000.00 (APPLE PAY) - -8.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
333	2024-06-11 13:59:15.628388+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-MICAELA-COCINA-ABIERTA-BOGOTA-AMT-12,000.00--4.31	2024-06-08 - MICAELA COCINA ABIERTA BOGOTA AMT 12,000.00 - -4.31	2	[{"changed": {"fields": ["Category"]}}]	7	1
334	2024-06-11 13:59:15.630575+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-JARDIN-BOTANICO-DE-BOG-1100100-BOGOT-AMT-50,000.00-(APPLE-PAY)--17.92	2024-06-08 - JARDIN BOTANICO DE BOG 1100100 BOGOT AMT 50,000.00 (APPLE PAY) - -17.92	2	[{"changed": {"fields": ["Category"]}}]	7	1
335	2024-06-11 13:59:15.6328+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-MAEMUKI-1100100-BOGOT-AMT-143,229.00-(APPLE-PAY)--51.25	2024-06-06 - MAEMUKI 1100100 BOGOT AMT 143,229.00 (APPLE PAY) - -51.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
336	2024-06-11 13:59:15.635105+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-LE-PAIN-QUOTIDIEN-RETI-BOGOTA-AMT-65,009.00--23.42	2024-06-06 - LE PAIN QUOTIDIEN RETI BOGOTA AMT 65,009.00 - -23.42	2	[{"changed": {"fields": ["Category"]}}]	7	1
337	2024-06-11 13:59:15.637374+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-FARMATODO-ANDINO-BOGOTA-AMT-44,250.00--15.95	2024-06-06 - FARMATODO ANDINO BOGOTA AMT 44,250.00 - -15.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
338	2024-06-11 13:59:15.639802+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-CENTRAL-CEVICHERIA-1100100-BOGOT-AMT-114,280.00-(APPLE-PAY)--40.9	2024-06-06 - CENTRAL CEVICHERIA 1100100 BOGOT AMT 114,280.00 (APPLE PAY) - -40.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
339	2024-06-11 13:59:15.642079+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-06-BOGOTA-BEER-COMPANY-1100100-BOGOT-AMT-108,140.00-(APPLE-PAY)--38.69	2024-06-06 - BOGOTA BEER COMPANY 1100100 BOGOT AMT 108,140.00 (APPLE PAY) - -38.69	2	[{"changed": {"fields": ["Category"]}}]	7	1
340	2024-06-13 22:03:54.886559+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TIENDA-DE-CAFE--8.66	2024-06-13 - TIENDA DE CAFE - -8.66	2	[{"changed": {"fields": ["Category"]}}]	7	1
341	2024-06-13 22:03:54.890038+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-LA-PANERA-ROSA--31.26	2024-06-13 - LA PANERA ROSA - -31.26	2	[{"changed": {"fields": ["Category"]}}]	7	1
342	2024-06-13 23:36:09.808172+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-JUAN-PEREZ--140.53	2024-06-13 - JUAN PEREZ - -140.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
343	2024-06-13 23:36:09.813346+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-BNS-SCOTIAONLINE/TELESCOT-0	2024-06-13 - BNS SCOTIAONLINE/TELESCOT - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
344	2024-06-13 23:36:09.81583+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-WENDYS-ARCOS--25.97	2024-06-12 - WENDYS ARCOS - -25.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
345	2024-06-13 23:36:09.818199+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-MOSTAZA--10.87	2024-06-12 - MOSTAZA - -10.87	2	[{"changed": {"fields": ["Category"]}}]	7	1
346	2024-06-13 23:36:09.820898+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-MERPAGO*FASUTOBUEGERS--42.76	2024-06-12 - MERPAGO*FASUTOBUEGERS - -42.76	2	[{"changed": {"fields": ["Category"]}}]	7	1
347	2024-06-13 23:36:09.823743+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-INSIDE-MARKET-CANDELARIA-CARACAS-PLAN-FEE/RATE-2-OF-3-PAYMENTS--4.54	2024-06-12 - INSIDE MARKET CANDELARIA CARACAS PLAN FEE/RATE 2 OF 3 PAYMENTS - -4.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
348	2024-06-13 23:36:09.826893+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-INSIDE-MARKET-CANDELARIA-CARACAS-PLAN-FEE/RATE-2-OF-3-PAYMENTS--2.11	2024-06-12 - INSIDE MARKET CANDELARIA CARACAS PLAN FEE/RATE 2 OF 3 PAYMENTS - -2.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
349	2024-06-13 23:36:09.829651+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-2-OF-3-PAYMENTS--83.69	2024-06-12 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 2 OF 3 PAYMENTS - -83.69	2	[{"changed": {"fields": ["Category"]}}]	7	1
350	2024-06-13 23:36:09.832981+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-2-OF-3-PAYMENTS--180.21	2024-06-12 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 2 OF 3 PAYMENTS - -180.21	2	[{"changed": {"fields": ["Category"]}}]	7	1
351	2024-06-13 23:36:09.835583+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-FARMACIA-ALFA--21.54	2024-06-12 - FARMACIA ALFA - -21.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
352	2024-06-13 23:36:09.838228+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-ANNUAL-FEE--120	2024-06-12 - ANNUAL FEE - -120.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
353	2024-06-13 23:36:09.84075+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-11-STARBUCKS-LOS-ARCOS--19.63	2024-06-11 - STARBUCKS LOS ARCOS - -19.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
354	2024-06-13 23:36:09.843374+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-11-Kentucky---Godoy-Cruz-CAPITAL-FEDER-AMT-19,400.00-(APPLE-PAY)--23.01	2024-06-11 - Kentucky - Godoy Cruz CAPITAL FEDER AMT 19,400.00 (APPLE PAY) - -23.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
355	2024-06-13 23:37:16.223736+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-AIRBNB-*-HMXKTX235A--68.1	2024-06-12 - AIRBNB * HMXKTX235A - -68.10	2	[{"changed": {"fields": ["Category"]}}]	7	1
356	2024-06-16 17:34:43.51339+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-3SM*AUTOSERV-CHEN--2.43	2024-06-14 - 3SM*AUTOSERV CHEN - -2.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
357	2024-06-16 17:34:43.518415+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-AIRALO-SINGAPORE-AMT-6.00-(APPLE-PAY)--8.47	2024-06-10 - AIRALO SINGAPORE AMT 6.00 (APPLE PAY) - -8.47	2	[{"changed": {"fields": ["Category"]}}]	7	1
358	2024-06-16 17:34:43.521729+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-CHACAITO-CARIBBEAN--26.45	2024-06-14 - CHACAITO CARIBBEAN - -26.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
359	2024-06-16 17:34:43.525834+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-CINEMARK-PALERMO--28.15	2024-06-14 - CINEMARK PALERMO - -28.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
360	2024-06-16 17:34:43.530139+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-CINEMARK-PALERMO--19.9	2024-06-14 - CINEMARK PALERMO - -19.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
361	2024-06-16 17:34:43.533754+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-DROG-PURA-MUELLE-INTER-1100100-BOGOT-AMT-88,800.00--31.83	2024-06-09 - DROG PURA MUELLE INTER 1100100 BOGOT AMT 88,800.00 - -31.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
362	2024-06-16 17:34:43.53711+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-ENTRADASBA-4723CAP.FEDERAL-AMT-36,000.00-(APPLE-PAY)--42.06	2024-06-10 - ENTRADASBA 4723CAP.FEDERAL AMT 36,000.00 (APPLE PAY) - -42.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
363	2024-06-16 17:34:43.541356+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-I-LOVE-GIFTS--4.12	2024-06-13 - I LOVE GIFTS - -4.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
364	2024-06-16 17:34:43.545949+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-I-LOVE-GIFTS--16.01	2024-06-13 - I LOVE GIFTS - -16.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
365	2024-06-16 17:34:43.549047+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-LA-BARBERIA-LOUNGE-Y-S-1100100-BOGOT-INSTALLMENT-ENROLLMENT-205.11	2024-06-14 - LA BARBERIA LOUNGE Y S 1100100 BOGOT INSTALLMENT ENROLLMENT - 205.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
366	2024-06-16 17:34:43.552094+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-LA-ESTANCIA-ASADOR-CRI-CABA-AMT-40,600.00-(APPLE-PAY)--47.44	2024-06-10 - LA ESTANCIA ASADOR CRI CABA AMT 40,600.00 (APPLE PAY) - -47.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
367	2024-06-16 17:34:43.555791+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-16-LE-PAIN-QUOTIDIEN--22.85	2024-06-16 - LE PAIN QUOTIDIEN - -22.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
368	2024-06-16 17:34:43.559335+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-LE-PAIN-QUOTIDIEN--34.28	2024-06-15 - LE PAIN QUOTIDIEN - -34.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
369	2024-06-16 17:34:43.562632+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-MERPAGO*AREPERAMISSVE1942CAP.FEDERAL-AMT-15,200.00-(APPLE-PAY)--17.75	2024-06-09 - MERPAGO*AREPERAMISSVE1942CAP.FEDERAL AMT 15,200.00 (APPLE PAY) - -17.75	2	[{"changed": {"fields": ["Category"]}}]	7	1
370	2024-06-16 17:34:43.565788+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-MERPAGO*BANSANG--28.81	2024-06-13 - MERPAGO*BANSANG - -28.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
371	2024-06-16 17:34:43.569191+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-MERPAGO*FASUTOBUEGERS1942CAP.FEDERAL-AMT-36,550.00-(APPLE-PAY)--42.76	2024-06-12 - MERPAGO*FASUTOBUEGERS1942CAP.FEDERAL AMT 36,550.00 (APPLE PAY) - -42.76	2	[{"changed": {"fields": ["Category"]}}]	7	1
372	2024-06-16 17:34:43.572622+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-MERPAGO*MAXIKIOSCO-1942CAP.FEDERAL-AMT-2,000.00-(APPLE-PAY)--2.34	2024-06-09 - MERPAGO*MAXIKIOSCO 1942CAP.FEDERAL AMT 2,000.00 (APPLE PAY) - -2.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
373	2024-06-16 17:34:43.576018+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-MERPAGO*NICOLO--3.4	2024-06-15 - MERPAGO*NICOLO - -3.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
374	2024-06-16 17:34:43.579326+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-MERPAGO*SUPERORO2326-1942CAP.FEDERAL-AMT-14,930.00-(APPLE-PAY)--17.71	2024-06-10 - MERPAGO*SUPERORO2326 1942CAP.FEDERAL AMT 14,930.00 (APPLE PAY) - -17.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
375	2024-06-16 17:34:43.582906+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-NO-MAMES-WAY--31.15	2024-06-14 - NO MAMES WAY - -31.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
769	2024-09-08 13:18:51.604543+00	4538266865745202409040005	2024-09-03 - MERPAGO*FERRETERIASER1942 - 8.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
376	2024-06-16 17:34:43.586348+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-12-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-2,090.00--2.45	2024-06-12 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 2,090.00 - -2.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
377	2024-06-16 17:34:43.590034+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-2,533.00--2.96	2024-06-10 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 2,533.00 - -2.96	2	[{"changed": {"fields": ["Category"]}}]	7	1
378	2024-06-16 17:34:43.593493+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-3,822.00--4.53	2024-06-10 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 3,822.00 - -4.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
379	2024-06-16 17:34:43.596665+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-R39-CREPESYWAFFLES-AER-BOGOTA-AMT-107,500.00-(APPLE-PAY)--38.53	2024-06-09 - R39 CREPESYWAFFLES AER BOGOTA AMT 107,500.00 (APPLE PAY) - -38.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
380	2024-06-16 17:34:43.599685+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-SANTO-BAR-DE-PIZZAS--18.56	2024-06-14 - SANTO BAR DE PIZZAS - -18.56	2	[{"changed": {"fields": ["Category"]}}]	7	1
381	2024-06-16 17:34:43.602798+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-08-SOTHEN-1100100-BOGOT-AMT-100,000.00--35.83	2024-06-08 - SOTHEN 1100100 BOGOT AMT 100,000.00 - -35.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
382	2024-06-16 17:34:43.606073+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-STARBUCKS-RECOLETA-MALL--17.04	2024-06-15 - STARBUCKS RECOLETA MALL - -17.04	2	[{"changed": {"fields": ["Category"]}}]	7	1
383	2024-06-16 17:34:43.609731+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TEMPLE-BAR--7.4	2024-06-13 - TEMPLE BAR - -7.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
384	2024-06-16 17:34:43.61349+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TEMPLE-BAR--16.86	2024-06-13 - TEMPLE BAR - -16.86	2	[{"changed": {"fields": ["Category"]}}]	7	1
385	2024-06-16 17:34:43.617506+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TEMPLE-BAR--12.13	2024-06-13 - TEMPLE BAR - -12.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
386	2024-06-16 17:34:43.62052+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-TEMPLE-MESAS--10.1	2024-06-15 - TEMPLE MESAS - -10.10	2	[{"changed": {"fields": ["Category"]}}]	7	1
387	2024-06-16 17:34:43.623564+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-TFTS--35.4	2024-06-15 - TFTS - -35.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
388	2024-06-16 17:46:58.103921+00	ScotiaLine-Line-of-Credit---4537388883602016-2024-06-03-DIS-AND/OR-JL-PREMIUM(S)--74.23	2024-06-03 - DIS AND/OR JL PREMIUM(S) - -74.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
389	2024-06-16 18:13:36.746898+00	Food	Food	2	[{"changed": {"fields": ["Budget"]}}]	8	1
390	2024-06-16 22:32:12.039396+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-16-MERPAGO*KATSUASIAN--39.91	2024-06-16 - MERPAGO*KATSUASIAN - -39.91	2	[{"changed": {"fields": ["Category"]}}]	7	1
391	2024-06-21 18:29:57.426739+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-WENDYS-ARCOS--26.41	2024-06-21 - WENDYS ARCOS - -26.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
392	2024-06-21 18:29:57.431967+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-WENDYS-ARCOS--2.36	2024-06-21 - WENDYS ARCOS - -2.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
393	2024-06-21 18:29:57.436296+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-MERPAGO*VORTERIX--7.07	2024-06-21 - MERPAGO*VORTERIX - -7.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
394	2024-06-21 18:29:57.441288+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-CAFE-MARTINEZ--26.95	2024-06-21 - CAFE MARTINEZ - -26.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
395	2024-06-21 18:29:57.446375+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-20-MERPAGO*KATSUASIAN--22.64	2024-06-20 - MERPAGO*KATSUASIAN - -22.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
396	2024-06-21 18:29:57.451099+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-19-MERPAGO*KATSUASIAN-1942CAP.FEDERAL-AMT-22,400.00--27.06	2024-06-19 - MERPAGO*KATSUASIAN 1942CAP.FEDERAL AMT 22,400.00 - -27.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
397	2024-06-21 18:29:57.455668+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-7,086.00--8.61	2024-06-18 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 7,086.00 - -8.61	2	[{"changed": {"fields": ["Category"]}}]	7	1
398	2024-06-21 18:29:57.460603+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-5,116.00--6.22	2024-06-18 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 5,116.00 - -6.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
399	2024-06-21 18:29:57.465155+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-3,639.00--4.43	2024-06-18 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 3,639.00 - -4.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
400	2024-06-21 18:29:57.469688+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-NETFLIX.COM-844-5052993-BC--18.63	2024-06-18 - NETFLIX.COM 844-5052993 BC - -18.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
401	2024-06-21 18:29:57.476086+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-EL-SECRETO-DE-ORO-3213CAPITAL-FEDER-AMT-7,500.00--9.11	2024-06-18 - EL SECRETO DE ORO 3213CAPITAL FEDER AMT 7,500.00 - -9.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
402	2024-06-21 18:29:57.480728+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-CAFE-MARTINEZ-2731CAPITAL-FEDER-AMT-6,500.00-(APPLE-PAY)--7.85	2024-06-18 - CAFE MARTINEZ 2731CAPITAL FEDER AMT 6,500.00 (APPLE PAY) - -7.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
403	2024-06-21 18:29:57.485479+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-18-CAFE-MARTINEZ-2731CAPITAL-FEDER-AMT-15,200.00-(APPLE-PAY)--18.36	2024-06-18 - CAFE MARTINEZ 2731CAPITAL FEDER AMT 15,200.00 (APPLE PAY) - -18.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
404	2024-06-21 18:29:57.490104+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-17-MERPAGO*ELSECRETODEOR1942CAP.FEDERAL-AMT-7,000.00--8.52	2024-06-17 - MERPAGO*ELSECRETODEOR1942CAP.FEDERAL AMT 7,000.00 - -8.52	2	[{"changed": {"fields": ["Category"]}}]	7	1
405	2024-06-21 18:29:57.494934+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-17-EXPRESS-GODOY-CRUZ-288679CAPITAL-FEDER-AMT-9,449.00--11.5	2024-06-17 - EXPRESS GODOY CRUZ 288679CAPITAL FEDER AMT 9,449.00 - -11.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
406	2024-06-21 18:29:57.499902+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-17-EXPRESS-GODOY-CRUZ-288679CAPITAL-FEDER-AMT-2,437.50-(APPLE-PAY)--2.96	2024-06-17 - EXPRESS GODOY CRUZ 288679CAPITAL FEDER AMT 2,437.50 (APPLE PAY) - -2.96	2	[{"changed": {"fields": ["Category"]}}]	7	1
407	2024-06-21 18:29:57.504943+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-17-EL-CLUB-DE-LA-MILANES2913CAPITAL-FEDER-AMT-35,880.00--43.61	2024-06-17 - EL CLUB DE LA MILANES2913CAPITAL FEDER AMT 35,880.00 - -43.61	2	[{"changed": {"fields": ["Category"]}}]	7	1
536	2024-07-13 16:25:31.83417+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-13-AMZN-Mktp-CA--197.85	2024-07-13 - AMZN Mktp CA - -197.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
408	2024-06-21 18:29:57.509738+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-17-CAFE-MARTINEZ-CABA-AMT-14,200.00-(APPLE-PAY)--17.26	2024-06-17 - CAFE MARTINEZ CABA AMT 14,200.00 (APPLE PAY) - -17.26	2	[{"changed": {"fields": ["Category"]}}]	7	1
409	2024-06-21 18:29:57.51677+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-16-MERPAGO*KATSUASIAN-1942CAP.FEDERAL-AMT-32,800.00--39.91	2024-06-16 - MERPAGO*KATSUASIAN 1942CAP.FEDERAL AMT 32,800.00 - -39.91	2	[{"changed": {"fields": ["Category"]}}]	7	1
410	2024-06-21 18:29:57.523336+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-16-LE-PAIN-QUOTIDIEN-CAPITAL-FEDER-AMT-18,780.00--22.85	2024-06-16 - LE PAIN QUOTIDIEN CAPITAL FEDER AMT 18,780.00 - -22.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
411	2024-06-21 18:29:57.527498+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-16-365-KIOSCO-PARAGUAY-49072CAPITAL-FEDER-AMT-4,040.00-(APPLE-PAY)--4.92	2024-06-16 - 365 KIOSCO PARAGUAY 49072CAPITAL FEDER AMT 4,040.00 (APPLE PAY) - -4.92	2	[{"changed": {"fields": ["Category"]}}]	7	1
412	2024-06-21 18:29:57.532933+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-TFTS-0981CAPITAL-FEDER-AMT-29,100.00-(APPLE-PAY)--35.4	2024-06-15 - TFTS 0981CAPITAL FEDER AMT 29,100.00 (APPLE PAY) - -35.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
413	2024-06-21 18:29:57.538067+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-TEMPLE-MESAS-3822CAPITAL-FEDER-AMT-8,300.00--10.1	2024-06-15 - TEMPLE MESAS 3822CAPITAL FEDER AMT 8,300.00 - -10.10	2	[{"changed": {"fields": ["Category"]}}]	7	1
414	2024-06-21 18:29:57.543488+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-STARBUCKS-RECOLETA-MA6538CAP.FEDERAL-AMT-14,000.00-(APPLE-PAY)--17.04	2024-06-15 - STARBUCKS RECOLETA MA6538CAP.FEDERAL AMT 14,000.00 (APPLE PAY) - -17.04	2	[{"changed": {"fields": ["Category"]}}]	7	1
415	2024-06-21 18:29:57.54866+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-3,790.00--4.61	2024-06-15 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 3,790.00 - -4.61	2	[{"changed": {"fields": ["Category"]}}]	7	1
416	2024-06-21 18:29:57.55455+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-3,244.00--3.95	2024-06-15 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 3,244.00 - -3.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
417	2024-06-21 18:29:57.560562+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-MERPAGO*SUPERORO2326-1942CAP.FEDERAL-AMT-11,040.00-(APPLE-PAY)--13.44	2024-06-15 - MERPAGO*SUPERORO2326 1942CAP.FEDERAL AMT 11,040.00 (APPLE PAY) - -13.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
418	2024-06-21 18:29:57.566244+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-MERPAGO*NICOLO-1942CAP.FEDERAL-AMT-2,800.00-(APPLE-PAY)--3.4	2024-06-15 - MERPAGO*NICOLO 1942CAP.FEDERAL AMT 2,800.00 (APPLE PAY) - -3.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
419	2024-06-21 18:29:57.571625+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-LE-PAIN-QUOTIDIEN-CAPITAL-FEDER-AMT-28,170.00-(APPLE-PAY)--34.28	2024-06-15 - LE PAIN QUOTIDIEN CAPITAL FEDER AMT 28,170.00 (APPLE PAY) - -34.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
420	2024-06-21 18:29:57.577706+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-15-ENTRADASBA-1234CAP.FEDERAL-AMT-16,540.00-(APPLE-PAY)--20.12	2024-06-15 - ENTRADASBA 1234CAP.FEDERAL AMT 16,540.00 (APPLE PAY) - -20.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
421	2024-06-21 18:29:57.58321+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-SANTO-BAR-DE-PIZZAS-2258CAPITAL-FEDER-AMT-15,300.00-(APPLE-PAY)--18.56	2024-06-14 - SANTO BAR DE PIZZAS 2258CAPITAL FEDER AMT 15,300.00 (APPLE PAY) - -18.56	2	[{"changed": {"fields": ["Category"]}}]	7	1
422	2024-06-21 18:29:57.587716+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-4,390.00--5.33	2024-06-14 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 4,390.00 - -5.33	2	[{"changed": {"fields": ["Category"]}}]	7	1
423	2024-06-21 18:29:57.593534+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-3,717.00--4.51	2024-06-14 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 3,717.00 - -4.51	2	[{"changed": {"fields": ["Category"]}}]	7	1
424	2024-06-21 18:29:57.599463+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-2,690.00--3.27	2024-06-14 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 2,690.00 - -3.27	2	[{"changed": {"fields": ["Category"]}}]	7	1
425	2024-06-21 18:29:57.604862+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-NO-MAMES-WAY-3719CAPITAL-FEDER-AMT-25,600.00-(APPLE-PAY)--31.15	2024-06-14 - NO MAMES WAY 3719CAPITAL FEDER AMT 25,600.00 (APPLE PAY) - -31.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
426	2024-06-21 18:29:57.610124+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-CINEMARK-PALERMO-3686CAP.FEDERAL-AMT-23,200.00--28.15	2024-06-14 - CINEMARK PALERMO 3686CAP.FEDERAL AMT 23,200.00 - -28.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
427	2024-06-21 18:29:57.61527+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-CINEMARK-PALERMO-3686CAP.FEDERAL-AMT-16,400.00--19.9	2024-06-14 - CINEMARK PALERMO 3686CAP.FEDERAL AMT 16,400.00 - -19.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
428	2024-06-21 18:29:57.620487+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-CHACAITO-CARIBBEAN-4515CAP.FEDERAL-AMT-21,800.00--26.45	2024-06-14 - CHACAITO CARIBBEAN 4515CAP.FEDERAL AMT 21,800.00 - -26.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
429	2024-06-21 18:29:57.626232+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-14-3SM*AUTOSERV-CHEN-CABA-AMT-2,000.00-(APPLE-PAY)--2.43	2024-06-14 - 3SM*AUTOSERV CHEN CABA AMT 2,000.00 (APPLE PAY) - -2.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
430	2024-06-21 18:29:57.631912+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TEMPLE-BAR-6165CAPITAL-FEDER-AMT-6,100.00--7.4	2024-06-13 - TEMPLE BAR 6165CAPITAL FEDER AMT 6,100.00 - -7.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
431	2024-06-21 18:29:57.637828+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TEMPLE-BAR-6165CAPITAL-FEDER-AMT-13,900.00--16.86	2024-06-13 - TEMPLE BAR 6165CAPITAL FEDER AMT 13,900.00 - -16.86	2	[{"changed": {"fields": ["Category"]}}]	7	1
432	2024-06-21 18:29:57.643228+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-TEMPLE-BAR-6165CAPITAL-FEDER-AMT-10,000.00--12.13	2024-06-13 - TEMPLE BAR 6165CAPITAL FEDER AMT 10,000.00 - -12.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
433	2024-06-21 18:29:57.648725+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-4,441.00--5.2	2024-06-13 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 4,441.00 - -5.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
434	2024-06-21 18:29:57.654264+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-3,142.00--3.68	2024-06-13 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 3,142.00 - -3.68	2	[{"changed": {"fields": ["Category"]}}]	7	1
435	2024-06-21 18:29:57.659629+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-2,490.00--3.02	2024-06-13 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 2,490.00 - -3.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
537	2024-07-13 16:25:31.839709+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-12-WANGS-VARIETY--29.64	2024-07-12 - WANGS VARIETY - -29.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
436	2024-06-21 18:29:57.664688+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-PAYU*AR*UBER-9429CAP.FEDERAL-AMT-125.00--0.15	2024-06-13 - PAYU*AR*UBER 9429CAP.FEDERAL AMT 125.00 - -0.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
437	2024-06-21 18:30:32.049511+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-MERPAGO*BANSANG-1942CAP.FEDERAL-AMT-23,750.00-(APPLE-PAY)--28.81	2024-06-13 - MERPAGO*BANSANG 1942CAP.FEDERAL AMT 23,750.00 (APPLE PAY) - -28.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
438	2024-06-21 18:30:32.054857+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-I-LOVE-GIFTS-8063CAPITAL-FEDER-AMT-3,400.00-(APPLE-PAY)--4.12	2024-06-13 - I LOVE GIFTS 8063CAPITAL FEDER AMT 3,400.00 (APPLE PAY) - -4.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
439	2024-06-21 18:30:32.059894+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-13-I-LOVE-GIFTS-8063CAPITAL-FEDER-AMT-13,200.00-(APPLE-PAY)--16.01	2024-06-13 - I LOVE GIFTS 8063CAPITAL FEDER AMT 13,200.00 (APPLE PAY) - -16.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
440	2024-06-24 15:26:55.8281+00	5	cafe -> Food	1	[{"added": {}}]	9	1
441	2024-06-24 15:28:06.563799+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-PERSONAL-FLOW--5.89	2024-06-23 - PERSONAL FLOW - -5.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
442	2024-06-24 15:28:06.568008+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-MESON-DE-LA-PLAZA--72.8	2024-06-23 - MESON DE LA PLAZA - -72.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
443	2024-06-24 15:28:06.571665+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-BUQUEBUS-CATERING--18.28	2024-06-23 - BUQUEBUS CATERING - -18.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
444	2024-06-24 15:28:06.575372+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-22-MERPAGO*MADERO--54.12	2024-06-22 - MERPAGO*MADERO - -54.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
445	2024-06-24 15:28:06.57933+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-MERPAGO*CUMENCUMEN--6.72	2024-06-21 - MERPAGO*CUMENCUMEN - -6.72	2	[{"changed": {"fields": ["Category"]}}]	7	1
446	2024-06-24 15:28:06.58336+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-FREDDO--10.37	2024-06-21 - FREDDO - -10.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
447	2024-06-24 15:33:07.490758+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-REST-CAFE-DEL-PUERTO--5.68	2024-06-23 - REST CAFE DEL PUERTO - -5.68	2	[{"changed": {"fields": ["Category"]}}]	7	1
448	2024-06-24 15:33:07.49543+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-REST-CAFE-DEL-PUERTO--21.28	2024-06-23 - REST CAFE DEL PUERTO - -21.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
449	2024-06-24 15:33:36.326504+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-REST-CAFE-DEL-PUERTO--5.68	2024-06-23 - REST CAFE DEL PUERTO - -5.68	2	[{"changed": {"fields": ["Category"]}}]	7	1
450	2024-06-24 15:33:36.331357+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-REST-CAFE-DEL-PUERTO--21.28	2024-06-23 - REST CAFE DEL PUERTO - -21.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
451	2024-07-02 14:18:11.51957+00	General Care	General Care	1	[{"added": {}}]	8	1
452	2024-07-02 14:21:59.547411+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA--403.32	2024-07-01 - WWW.PISHOP.CA - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
453	2024-07-02 14:21:59.552538+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-SQ-*MASA-DELI--42.04	2024-07-01 - SQ *MASA DELI - -42.04	2	[{"changed": {"fields": ["Category"]}}]	7	1
454	2024-07-02 14:21:59.557097+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-NETFLIX.COM--8.44	2024-07-01 - NETFLIX.COM - -8.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
455	2024-07-02 14:21:59.561389+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-30-PETIT-GOURMET--17.4	2024-06-30 - PETIT GOURMET - -17.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
456	2024-07-02 14:21:59.565315+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-29-BOLD*Fe-con-aroma-a--9.48	2024-06-29 - BOLD*Fe con aroma a - -9.48	2	[{"changed": {"fields": ["Category"]}}]	7	1
457	2024-07-02 14:21:59.569645+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-29-BOLD*A-Manos-Peruana--28.78	2024-06-29 - BOLD*A Manos Peruana - -28.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
458	2024-07-02 14:21:59.573726+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PYU*UBER--5.54	2024-06-28 - PYU*UBER - -5.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
459	2024-07-02 14:21:59.577699+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PYU*UBER--4.37	2024-06-28 - PYU*UBER - -4.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
460	2024-07-02 14:21:59.582168+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PYU*UBER--18.26	2024-06-28 - PYU*UBER - -18.26	2	[{"changed": {"fields": ["Category"]}}]	7	1
461	2024-07-02 14:21:59.586027+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PAYPAL-*DIEGOL25--20.17	2024-06-28 - PAYPAL *DIEGOL25 - -20.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
462	2024-07-02 14:21:59.589877+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-MERPAGO*OPEN25--45.57	2024-06-28 - MERPAGO*OPEN25 - -45.57	2	[{"changed": {"fields": ["Category"]}}]	7	1
463	2024-07-02 14:21:59.594008+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-CAFE-MARTINEZ--5.37	2024-06-28 - CAFE MARTINEZ - -5.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
464	2024-07-02 14:21:59.597772+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-27-MERPAGO*TERCERADOCENA1942CAP.FEDERAL-AMT-4,250.00-(APPLE-PAY)--4.78	2024-06-27 - MERPAGO*TERCERADOCENA1942CAP.FEDERAL AMT 4,250.00 (APPLE PAY) - -4.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
465	2024-07-02 14:21:59.602233+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-27-CHACAITO-CARIBBEAN--45.35	2024-06-27 - CHACAITO CARIBBEAN - -45.35	2	[{"changed": {"fields": ["Category"]}}]	7	1
466	2024-07-02 14:21:59.61209+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-27-365-KIOSCO-CABILDO-1300--5	2024-06-27 - 365 KIOSCO CABILDO 1300 - -5.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
467	2024-07-02 14:21:59.615774+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-26-TOSTADO-9664CAPITAL-FEDER-AMT-89,170.00-(APPLE-PAY)--102.24	2024-06-26 - TOSTADO 9664CAPITAL FEDER AMT 89,170.00 (APPLE PAY) - -102.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
468	2024-07-02 14:21:59.620093+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-25-SANTO-BAR-DE-PIZZAS-8560CAPITAL-FEDER-AMT-24,000.00-(APPLE-PAY)--27.88	2024-06-25 - SANTO BAR DE PIZZAS 8560CAPITAL FEDER AMT 24,000.00 (APPLE PAY) - -27.88	2	[{"changed": {"fields": ["Category"]}}]	7	1
469	2024-07-02 14:21:59.623915+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-25-MERPAGO*FAMIFERNSRL-1942CAP.FEDERAL-AMT-2,000.00-(APPLE-PAY)--2.33	2024-06-25 - MERPAGO*FAMIFERNSRL 1942CAP.FEDERAL AMT 2,000.00 (APPLE PAY) - -2.33	2	[{"changed": {"fields": ["Category"]}}]	7	1
470	2024-07-02 14:21:59.627912+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-25-MERPAGO*CUMENCUMEN-1942CAP.FEDERAL-AMT-59,100.00-(APPLE-PAY)--67.76	2024-06-25 - MERPAGO*CUMENCUMEN 1942CAP.FEDERAL AMT 59,100.00 (APPLE PAY) - -67.76	2	[{"changed": {"fields": ["Category"]}}]	7	1
471	2024-07-02 14:21:59.632125+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-25-MERPAGO*CUMENCUMEN-1942CAP.FEDERAL-AMT-1,200.00-(APPLE-PAY)--1.37	2024-06-25 - MERPAGO*CUMENCUMEN 1942CAP.FEDERAL AMT 1,200.00 (APPLE PAY) - -1.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
472	2024-07-02 14:21:59.636065+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-24-MERPAGO*ONLYBARBERS-1942CAP.FEDERAL-AMT-19,000.00-(APPLE-PAY)--22.41	2024-06-24 - MERPAGO*ONLYBARBERS 1942CAP.FEDERAL AMT 19,000.00 (APPLE PAY) - -22.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
473	2024-07-02 14:21:59.639901+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-24-FARUNO-UNIVERSAL-FASTA-CABA-AMT-15,200.00-(APPLE-PAY)--17.92	2024-06-24 - FARUNO UNIVERSAL FASTA CABA AMT 15,200.00 (APPLE PAY) - -17.92	2	[{"changed": {"fields": ["Category"]}}]	7	1
474	2024-07-02 14:21:59.646149+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-SERRANO-CAFE-COLONIA-DEL-S-AMT-656.79-(APPLE-PAY)--23.3	2024-06-23 - SERRANO CAFE COLONIA DEL S AMT 656.79 (APPLE PAY) - -23.30	2	[{"changed": {"fields": ["Category"]}}]	7	1
475	2024-07-02 14:21:59.651786+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-MESON-DE-LA-PLAZA-COLONIA-AMT-2,052.46-(APPLE-PAY)--72.8	2024-06-23 - MESON DE LA PLAZA COLONIA AMT 2,052.46 (APPLE PAY) - -72.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
476	2024-07-02 14:21:59.655956+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-BUQUEBUS-CATERING-CAPITAL-FEDER-AMT-5,500.00-(APPLE-PAY)--6.49	2024-06-23 - BUQUEBUS-CATERING CAPITAL FEDER AMT 5,500.00 (APPLE PAY) - -6.49	2	[{"changed": {"fields": ["Category"]}}]	7	1
477	2024-07-02 14:21:59.660534+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-23-BUQUEBUS-CATERING-CAPITAL-FEDER-AMT-15,500.00-(APPLE-PAY)--18.28	2024-06-23 - BUQUEBUS-CATERING CAPITAL FEDER AMT 15,500.00 (APPLE PAY) - -18.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
478	2024-07-02 14:21:59.66601+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-22-MERPAGO*MADERO-1942CAP.FEDERAL-AMT-45,900.00-(APPLE-PAY)--54.12	2024-06-22 - MERPAGO*MADERO 1942CAP.FEDERAL AMT 45,900.00 (APPLE PAY) - -54.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
479	2024-07-02 14:21:59.671725+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-MERPAGO*VORTERIX-1942CAP.FEDERAL-AMT-6,000.00--7.07	2024-06-21 - MERPAGO*VORTERIX 1942CAP.FEDERAL AMT 6,000.00 - -7.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
480	2024-07-02 14:21:59.677141+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-MERPAGO*CUMENCUMEN-1942CAP.FEDERAL-AMT-5,700.00-(APPLE-PAY)--6.72	2024-06-21 - MERPAGO*CUMENCUMEN 1942CAP.FEDERAL AMT 5,700.00 (APPLE PAY) - -6.72	2	[{"changed": {"fields": ["Category"]}}]	7	1
481	2024-07-02 14:21:59.682454+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-21-FREDDO-4292CAP.FEDERAL-AMT-8,800.00-(APPLE-PAY)--10.37	2024-06-21 - FREDDO 4292CAP.FEDERAL AMT 8,800.00 (APPLE PAY) - -10.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
482	2024-07-02 14:22:12.277484+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-25-MERPAGO*ESTACIONVILLA1942CAP.FEDERAL-AMT-29,900.00-(APPLE-PAY)--34.29	2024-06-25 - MERPAGO*ESTACIONVILLA1942CAP.FEDERAL AMT 29,900.00 (APPLE PAY) - -34.29	2	[{"changed": {"fields": ["Category"]}}]	7	1
483	2024-07-06 13:17:37.581337+00	Rent	Rent	1	[{"added": {}}]	8	1
484	2024-07-06 13:20:58.405415+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-TIM-HORTONS-#7531--9.87	2024-07-05 - TIM HORTONS #7531 - -9.87	2	[{"changed": {"fields": ["Category"]}}]	7	1
485	2024-07-06 13:20:58.409971+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-Spotify--16.94	2024-07-05 - Spotify - -16.94	2	[{"changed": {"fields": ["Category"]}}]	7	1
486	2024-07-06 13:20:58.414491+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-OLG-1-800-387-0098/OLG--5	2024-07-05 - OLG 1 800 387 0098/OLG - -5.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
487	2024-07-06 13:20:58.418445+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-KLARNA*-AIRBNB-CA--173.8	2024-07-05 - KLARNA* AIRBNB CA - -173.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
488	2024-07-06 13:20:58.422327+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-DAVE-&-BUSTER'S--25.97	2024-07-05 - DAVE & BUSTER'S - -25.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
489	2024-07-06 13:20:58.426531+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-04-THAI-ELEPHANT--21.13	2024-07-04 - THAI ELEPHANT - -21.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
490	2024-07-06 13:20:58.430466+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-04-PHO-LANG-VAN-TORONTO-ON-(APPLE-PAY)--22.59	2024-07-04 - PHO LANG VAN TORONTO ON (APPLE PAY) - -22.59	2	[{"changed": {"fields": ["Category"]}}]	7	1
491	2024-07-06 13:20:58.43451+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-03-QUEEN-SHAWARMA-TORONTO-ON-(APPLE-PAY)--16.02	2024-07-03 - QUEEN SHAWARMA TORONTO ON (APPLE PAY) - -16.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
492	2024-07-06 13:20:58.438574+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-03-METRO-772-TORONTO-ON-(APPLE-PAY)--7.63	2024-07-03 - METRO 772 TORONTO ON (APPLE PAY) - -7.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
493	2024-07-06 13:20:58.442676+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-03-MAISON-T-TORONTO-ON-(APPLE-PAY)--40.67	2024-07-03 - MAISON T TORONTO ON (APPLE PAY) - -40.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
494	2024-07-06 13:20:58.447236+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-02-HANA-SUSHI-TORONTO-ON-(APPLE-PAY)--40.4	2024-07-02 - HANA SUSHI TORONTO ON (APPLE PAY) - -40.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
495	2024-07-06 13:20:58.4532+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA-NEPEAN-ON--403.32	2024-07-01 - WWW.PISHOP.CA NEPEAN ON - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
496	2024-07-06 13:20:58.457562+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA--403.32	2024-07-01 - WWW.PISHOP.CA - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
497	2024-07-06 13:20:58.462667+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-TIM-HORTONS-#5570-TORONTO-ON-(APPLE-PAY)--11.05	2024-07-01 - TIM HORTONS #5570 TORONTO ON (APPLE PAY) - -11.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
498	2024-07-06 13:20:58.467596+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-KITCHEN-MARKET-TORONTO-ON-(APPLE-PAY)--32.71	2024-07-01 - KITCHEN MARKET TORONTO ON (APPLE PAY) - -32.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
499	2024-07-06 13:20:58.473215+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PAYPAL-*DIEGOL25-4029357733-ON--20.17	2024-06-28 - PAYPAL *DIEGOL25 4029357733 ON - -20.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
500	2024-07-06 13:20:58.477533+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PAYPAL-*DIEGOL25--20.17	2024-06-28 - PAYPAL *DIEGOL25 - -20.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
501	2024-07-06 13:20:58.483282+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-MERPAGO*OPEN25--45.57	2024-06-28 - MERPAGO*OPEN25 - -45.57	2	[{"changed": {"fields": ["Category"]}}]	7	1
538	2024-07-13 16:25:31.843643+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-P.A.T.-CENTRAL-MARKET--21.37	2024-07-11 - P.A.T. CENTRAL MARKET - -21.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
502	2024-07-06 13:20:58.489338+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-MERPAGO*OPEN25-1942CAP.FEDERAL-AMT-40,300.00-(APPLE-PAY)--45.57	2024-06-28 - MERPAGO*OPEN25 1942CAP.FEDERAL AMT 40,300.00 (APPLE PAY) - -45.57	2	[{"changed": {"fields": ["Category"]}}]	7	1
503	2024-07-06 13:20:58.495121+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-CAFE-MARTINEZ--5.37	2024-06-28 - CAFE MARTINEZ - -5.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
504	2024-07-06 14:09:55.592717+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA-NEPEAN-ON--403.32	2024-07-01 - WWW.PISHOP.CA NEPEAN ON - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
505	2024-07-06 14:09:55.597388+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-28-PAYPAL-*DIEGOL25-4029357733-ON--20.17	2024-06-28 - PAYPAL *DIEGOL25 4029357733 ON - -20.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
506	2024-07-06 14:09:55.602383+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-10-ENTRADASBA-4723CAP.FEDERAL-AMT-36,000.00-(APPLE-PAY)--42.06	2024-06-10 - ENTRADASBA 4723CAP.FEDERAL AMT 36,000.00 (APPLE PAY) - -42.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
507	2024-07-06 14:09:55.606694+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-R39-CREPESYWAFFLES-AER-BOGOTA-AMT-107,500.00-(APPLE-PAY)--38.53	2024-06-09 - R39 CREPESYWAFFLES AER BOGOTA AMT 107,500.00 (APPLE PAY) - -38.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
508	2024-07-06 14:09:55.610852+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-MERPAGO*MAXIKIOSCO-1942CAP.FEDERAL-AMT-2,000.00-(APPLE-PAY)--2.34	2024-06-09 - MERPAGO*MAXIKIOSCO 1942CAP.FEDERAL AMT 2,000.00 (APPLE PAY) - -2.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
509	2024-07-06 14:09:55.615268+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-06-09-DROG-PURA-MUELLE-INTER-1100100-BOGOT-AMT-88,800.00--31.83	2024-06-09 - DROG PURA MUELLE INTER 1100100 BOGOT AMT 88,800.00 - -31.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
510	2024-07-06 14:09:55.619296+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-18-DTW-PAPA-JOES-MARKET-1128DETROIT-MI-AMT-10.06-(APPLE-PAY)--14.07	2024-05-18 - DTW PAPA JOES MARKET 1128DETROIT MI AMT 10.06 (APPLE PAY) - -14.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
511	2024-07-06 14:10:22.178426+00	6	kitchen -> Food	1	[{"added": {}}]	9	1
512	2024-07-06 14:10:41.554213+00	7	tim hortons -> Food	1	[{"added": {}}]	9	1
513	2024-07-10 17:38:57.972059+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-10-WeCook-Meals--23.19	2024-07-10 - WeCook Meals - -23.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
514	2024-07-10 17:38:57.979581+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-WWW.PISHOP.CA-403.32	2024-07-09 - WWW.PISHOP.CA - 403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
515	2024-07-10 17:38:57.98349+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-TST-Vit-Beo--79.26	2024-07-09 - TST-Vit Beo - -79.26	2	[{"changed": {"fields": ["Category"]}}]	7	1
516	2024-07-10 17:38:57.987266+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-META---PPGF--10	2024-07-09 - META - PPGF - -10.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
517	2024-07-10 17:38:57.991384+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-FARM-BOY-#99--14.11	2024-07-09 - FARM BOY #99 - -14.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
518	2024-07-10 17:38:57.995421+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-08-PIZZAIOLO-770-BAY-ST--8.06	2024-07-08 - PIZZAIOLO 770 BAY ST - -8.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
519	2024-07-10 17:38:57.999718+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-08-NAYAX-CANADA-INC-MASTER--1.45	2024-07-08 - NAYAX CANADA INC MASTER - -1.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
520	2024-07-10 17:38:58.004211+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-08-NAYAX-CANADA-INC-MASTER--1	2024-07-08 - NAYAX CANADA INC MASTER - -1.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
521	2024-07-10 17:38:58.008514+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-08-MCDONALD'S-#40427--10.17	2024-07-08 - MCDONALD'S #40427 - -10.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
522	2024-07-10 17:38:58.012381+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-08-BLOORCOURT-STATIONERY-TORONTO-ON-(APPLE-PAY)--1.5	2024-07-08 - BLOORCOURT STATIONERY TORONTO ON (APPLE PAY) - -1.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
523	2024-07-10 17:38:58.017381+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-07-RUNAWAY-CAFE-TORONTO-ON-(APPLE-PAY)--37.54	2024-07-07 - RUNAWAY CAFE TORONTO ON (APPLE PAY) - -37.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
524	2024-07-10 17:38:58.022094+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-07-RUNAWAY-CAFE-TORONTO-ON-(APPLE-PAY)--10.38	2024-07-07 - RUNAWAY CAFE TORONTO ON (APPLE PAY) - -10.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
525	2024-07-10 17:38:58.026245+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-06-MCDONALD'S-#40427-TORONTO-ON-(APPLE-PAY)--17.16	2024-07-06 - MCDONALD'S #40427 TORONTO ON (APPLE PAY) - -17.16	2	[{"changed": {"fields": ["Category"]}}]	7	1
526	2024-07-10 17:38:58.030679+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-06-MCDONALD'S-#40427-TORONTO-ON-(APPLE-PAY)--10.17	2024-07-06 - MCDONALD'S #40427 TORONTO ON (APPLE PAY) - -10.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
527	2024-07-10 17:38:58.034611+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-06-CITY-OF-TORONTO-FERRY-DOCTORONTO-ON-(APPLE-PAY)--9.11	2024-07-06 - CITY OF TORONTO FERRY DOCTORONTO ON (APPLE PAY) - -9.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
528	2024-07-10 17:38:58.038508+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-SPOTIFY-STOCKHOLM--16.94	2024-07-05 - SPOTIFY STOCKHOLM - -16.94	2	[{"changed": {"fields": ["Category"]}}]	7	1
529	2024-07-10 17:38:58.042326+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-KLARNA*-AIRBNB-CA-VANCOUVER-BC--173.8	2024-07-05 - KLARNA* AIRBNB CA VANCOUVER BC - -173.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
530	2024-07-10 17:38:58.04616+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-DAVE-&-BUSTER'S-VAUGHAN-ON-(APPLE-PAY)--25.97	2024-07-05 - DAVE & BUSTER'S VAUGHAN ON (APPLE PAY) - -25.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
531	2024-07-10 17:42:55.348131+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-SQ-*TORONTO-HARBOUR-WATERToronto-ON-(APPLE-PAY)--15.52	2024-07-01 - SQ *TORONTO HARBOUR WATERToronto ON (APPLE PAY) - -15.52	2	[{"changed": {"fields": ["Category"]}}]	7	1
532	2024-07-10 17:42:55.353474+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-07-SQ-*TORONTO-HARBOUR-WATERToronto-ON-(APPLE-PAY)--13.5	2024-07-07 - SQ *TORONTO HARBOUR WATERToronto ON (APPLE PAY) - -13.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
533	2024-07-10 17:42:55.357975+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-SQ-*TORONTO-HARBOUR-WATERToronto-ON-(APPLE-PAY)--13.5	2024-07-01 - SQ *TORONTO HARBOUR WATERToronto ON (APPLE PAY) - -13.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
534	2024-07-13 16:24:44.418449+00	Tech	Tech	1	[{"added": {}}]	8	1
535	2024-07-13 16:25:31.829588+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-13-GOOGLE-*Google-One--158.19	2024-07-13 - GOOGLE *Google One - -158.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
539	2024-07-13 16:25:31.847533+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-KUNG-FU-TEA-TORONTO-ON-(APPLE-PAY)--7.21	2024-07-11 - KUNG FU TEA TORONTO ON (APPLE PAY) - -7.21	2	[{"changed": {"fields": ["Category"]}}]	7	1
540	2024-07-13 16:25:31.851751+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-10-WANGS-VARIETY-TORONTO-ON-(APPLE-PAY)--14.04	2024-07-10 - WANGS VARIETY TORONTO ON (APPLE PAY) - -14.04	2	[{"changed": {"fields": ["Category"]}}]	7	1
541	2024-07-13 16:25:31.856406+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-10-TST-Vit-Beo-Toronto-ON-(APPLE-PAY)--79.26	2024-07-10 - TST-Vit Beo Toronto ON (APPLE PAY) - -79.26	2	[{"changed": {"fields": ["Category"]}}]	7	1
542	2024-07-13 16:25:44.449853+00	Donation	Donation	1	[{"added": {}}]	8	1
543	2024-07-13 16:26:09.078929+00	Cesar	Cesar	1	[{"added": {}}]	8	1
544	2024-07-13 16:26:12.714824+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-META---PPGF-8882211161-DC--10	2024-07-09 - META - PPGF 8882211161 DC - -10.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
545	2024-07-13 16:26:12.719641+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-GOOGLE-*Google-Storage-g.co/helppay#NS-14.93	2024-07-09 - GOOGLE *Google Storage g.co/helppay#NS - 14.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
546	2024-07-13 16:26:12.724132+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-09-AUTOMERCADO-PLAZA-S-CCS-NOROESTE-AMT-2,264.07--87.03	2024-07-09 - AUTOMERCADO PLAZA S CCS NOROESTE AMT 2,264.07 - -87.03	2	[{"changed": {"fields": ["Category"]}}]	7	1
547	2024-07-13 16:26:12.728607+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-01-AUTOMERCADO-PLAZA-S-CCS-NOROESTE-AMT-3,624.81--140.39	2024-07-01 - AUTOMERCADO PLAZA S CCS NOROESTE AMT 3,624.81 - -140.39	2	[{"changed": {"fields": ["Category"]}}]	7	1
548	2024-07-13 16:28:07.264468+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-13-AMZN-Mktp-CA--197.85	2024-07-13 - AMZN Mktp CA - -197.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
549	2024-07-13 16:28:07.269274+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-WWW.PISHOP.CA-NEPEAN-ON-403.32	2024-07-09 - WWW.PISHOP.CA NEPEAN ON - 403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
550	2024-07-13 16:28:07.273615+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA-NEPEAN-ON--403.32	2024-07-01 - WWW.PISHOP.CA NEPEAN ON - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
551	2024-07-13 16:28:22.547306+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA-NEPEAN-ON--403.32	2024-07-01 - WWW.PISHOP.CA NEPEAN ON - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
552	2024-07-13 16:34:54.087117+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--183.78	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -183.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
553	2024-07-13 16:34:54.092096+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--85.36	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -85.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
554	2024-07-13 16:36:29.713925+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--183.78	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -183.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
555	2024-07-13 16:36:29.718713+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--85.36	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -85.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
556	2024-07-13 16:37:20.465726+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--183.78	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -183.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
557	2024-07-13 16:37:20.470747+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--85.36	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -85.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
558	2024-07-13 16:40:40.270831+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--183.78	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -183.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
559	2024-07-13 16:40:40.272229+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--85.36	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -85.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
560	2024-07-13 16:41:56.585985+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--183.78	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -183.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
561	2024-07-13 16:41:56.588022+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-INSIDE-MARKET-CANDELARIA-CARACAS-INSTALLMENT-3-OF-3-PAYMENTS--85.36	2024-07-11 - INSIDE MARKET CANDELARIA CARACAS INSTALLMENT 3 OF 3 PAYMENTS - -85.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
562	2024-07-13 16:43:35.058936+00	Bank Fee	Bank Fee	2	[{"changed": {"fields": ["Budget"]}}]	8	1
563	2024-07-13 16:44:32.39235+00	Tech	Tech	2	[{"changed": {"fields": ["Budget"]}}]	8	1
564	2024-07-13 16:45:14.453666+00	Donation	Donation	2	[{"changed": {"fields": ["Budget"]}}]	8	1
565	2024-07-13 16:46:27.685856+00	Suscription	Suscription	1	[{"added": {}}]	8	1
566	2024-07-13 16:46:49.417308+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-05-SPOTIFY-STOCKHOLM--16.94	2024-07-05 - SPOTIFY STOCKHOLM - -16.94	2	[{"changed": {"fields": ["Category"]}}]	7	1
567	2024-07-13 17:11:09.825774+00	Suscription	Suscription	2	[{"changed": {"fields": ["Budget"]}}]	8	1
568	2024-07-16 16:56:17.012678+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-DODONER--16.93	2024-07-15 - DODONER - -16.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
569	2024-07-16 16:56:17.014767+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-14-PARLIAMENT-SMOKE-&-GIFT-TORONTO-ON-(APPLE-PAY)--6.7	2024-07-14 - PARLIAMENT SMOKE & GIFT TORONTO ON (APPLE PAY) - -6.70	2	[{"changed": {"fields": ["Category"]}}]	7	1
570	2024-07-16 16:56:17.016246+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-14-BOKU-DISTILLERY-TORONTO-ON-(APPLE-PAY)--19.34	2024-07-14 - BOKU DISTILLERY TORONTO ON (APPLE PAY) - -19.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
571	2024-07-16 16:56:17.017673+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-14-BIKE-SHARE-TORONTO-PARKINTORONTO-ON--32.05	2024-07-14 - BIKE SHARE TORONTO PARKINTORONTO ON - -32.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
572	2024-07-16 16:56:17.019161+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-13-CHURCH'S-CHICKEN-11201-TORONTO-ON-(APPLE-PAY)--9.03	2024-07-13 - CHURCH'S CHICKEN 11201 TORONTO ON (APPLE PAY) - -9.03	2	[{"changed": {"fields": ["Category"]}}]	7	1
573	2024-07-16 16:56:43.021386+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-11-P.A.T.-CENTRAL-MARKET-INCTORONTO-ON-(APPLE-PAY)--21.37	2024-07-11 - P.A.T. CENTRAL MARKET INCTORONTO ON (APPLE PAY) - -21.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
574	2024-07-16 16:56:43.023314+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-08-PIZZAIOLO-770-BAY-ST-TORONTO-ON-(APPLE-PAY)--8.06	2024-07-08 - PIZZAIOLO 770 BAY ST TORONTO ON (APPLE PAY) - -8.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
575	2024-07-16 16:56:43.024703+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-18-DTW-PAPA-JOES-MARKET-1128DETROIT-MI-AMT-10.06-(APPLE-PAY)--14.07	2024-05-18 - DTW PAPA JOES MARKET 1128DETROIT MI AMT 10.06 (APPLE PAY) - -14.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
576	2024-07-22 15:52:37.076434+00	Shopping	Shopping	1	[{"added": {}}]	8	1
577	2024-07-22 15:52:38.885906+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-21-SEOUL-JIMJILBANG-SPA--4	2024-07-21 - SEOUL JIMJILBANG SPA - -4.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
578	2024-07-22 15:52:38.888073+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-21-FRESHII---993---DUFFERIN--25.28	2024-07-21 - FRESHII - 993 - DUFFERIN - -25.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
579	2024-07-22 15:52:38.890313+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-IMMIGRATION-CANADA-0	2024-07-20 - IMMIGRATION CANADA - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
580	2024-07-22 15:52:38.891809+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-CENTREVILLE--6	2024-07-20 - CENTREVILLE - -6.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
581	2024-07-22 15:52:38.893424+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-19-Klarna-airbnb--173.8	2024-07-19 - Klarna airbnb - -173.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
582	2024-07-22 15:52:38.89515+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-19-IMMITRANSLATE-8008800595-MD-AMT-70.00--98.45	2024-07-19 - IMMITRANSLATE 8008800595 MD AMT 70.00 - -98.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
583	2024-07-22 15:52:38.896786+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-18-FACTOR-MEALS-TORONTO-ON--71.95	2024-07-18 - FACTOR MEALS TORONTO ON - -71.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
584	2024-07-22 15:52:38.898262+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-18-AFFIRM-CANADA--21.19	2024-07-18 - AFFIRM CANADA - -21.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
585	2024-07-22 15:52:38.899683+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-DODONER-TORONTO-ON-(APPLE-PAY)--16.93	2024-07-15 - DODONER TORONTO ON (APPLE PAY) - -16.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
586	2024-07-22 15:52:38.901254+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-Amazon.ca*RY6QS5YY2-AMAZON.CA-ON--32.74	2024-07-15 - Amazon.ca*RY6QS5YY2 AMAZON.CA ON - -32.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
587	2024-07-22 15:55:39.989813+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-22-AMZN-Mktp-CA--45.2	2024-07-22 - AMZN Mktp CA - -45.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
588	2024-07-22 15:55:39.991828+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-THE-ISLAND-GREEK-GRILL--24.25	2024-07-20 - THE ISLAND GREEK GRILL - -24.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
589	2024-07-22 15:55:39.993313+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-AMZN-Mktp-CA--28.24	2024-07-20 - AMZN Mktp CA - -28.24	2	[{"changed": {"fields": ["Category"]}}]	7	1
590	2024-07-22 15:55:39.994722+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-Amazon.ca--33.04	2024-07-20 - Amazon.ca - -33.04	2	[{"changed": {"fields": ["Category"]}}]	7	1
591	2024-07-22 15:55:39.996198+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-19-AMZN-Mktp-CA*RS7CO7A80-WWW.AMAZON.CAON-INSTALLMENT-ENROLLMENT-197.85	2024-07-19 - AMZN Mktp CA*RS7CO7A80 WWW.AMAZON.CAON INSTALLMENT ENROLLMENT - 197.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
592	2024-07-22 15:55:39.997644+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-19-Amazon.ca--55.46	2024-07-19 - Amazon.ca - -55.46	2	[{"changed": {"fields": ["Category"]}}]	7	1
593	2024-07-22 15:55:39.999083+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-18-Amazon.ca--99.12	2024-07-18 - Amazon.ca - -99.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
594	2024-07-22 15:55:40.000585+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-18-AFFIRM-CANADA--21.19	2024-07-18 - AFFIRM CANADA - -21.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
595	2024-07-22 15:55:40.002011+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-AMZN-Mktp-CA*RY9005Y52-WWW.AMAZON.CAON--51.97	2024-07-15 - AMZN Mktp CA*RY9005Y52 WWW.AMAZON.CAON - -51.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
596	2024-07-22 15:55:40.003476+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-AMZN-Mktp-CA*RS7CO7A80-WWW.AMAZON.CAON--197.85	2024-07-15 - AMZN Mktp CA*RS7CO7A80 WWW.AMAZON.CAON - -197.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
597	2024-07-22 15:55:40.005014+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-AMZN-Mktp-CA*RS4JK8O02-WWW.AMAZON.CAON--73.44	2024-07-15 - AMZN Mktp CA*RS4JK8O02 WWW.AMAZON.CAON - -73.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
598	2024-07-22 15:55:40.006571+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-14-THE-BEER-HALL-TORONTO-ON-(APPLE-PAY)--18.34	2024-07-14 - THE BEER HALL TORONTO ON (APPLE PAY) - -18.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
599	2024-07-22 15:55:40.008063+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-13-THE-ISLAND-GREEK-GRILL-TORONTO-ON-(APPLE-PAY)--14.41	2024-07-13 - THE ISLAND GREEK GRILL TORONTO ON (APPLE PAY) - -14.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
600	2024-07-22 15:55:40.009556+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-13-AMZN-Mktp-CA--197.85	2024-07-13 - AMZN Mktp CA - -197.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
601	2024-07-22 15:55:40.010973+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-12-AMZN-Mktp-CA--73.44	2024-07-12 - AMZN Mktp CA - -73.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
602	2024-07-22 15:55:40.012493+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-12-AMZN-Mktp-CA--51.97	2024-07-12 - AMZN Mktp CA - -51.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
603	2024-07-22 15:55:40.013989+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-12-Amazon.ca--32.74	2024-07-12 - Amazon.ca - -32.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
604	2024-07-22 15:55:40.015565+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-09-WWW.PISHOP.CA-NEPEAN-ON-403.32	2024-07-09 - WWW.PISHOP.CA NEPEAN ON - 403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
605	2024-07-22 15:55:59.567814+00	Shopping	Shopping	2	[{"changed": {"fields": ["Budget"]}}]	8	1
606	2024-07-26 16:09:17.670927+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-24-PRENUP-PUB--6.67	2024-07-24 - PRENUP PUB - -6.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
607	2024-07-26 16:09:17.673029+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-24-DEAR-SAIGON-TORONTO-ON-(APPLE-PAY)--19.2	2024-07-24 - DEAR SAIGON TORONTO ON (APPLE PAY) - -19.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
608	2024-07-26 16:09:17.674557+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-24-DEAR-SAIGON-TORONTO-ON-(APPLE-PAY)--11.05	2024-07-24 - DEAR SAIGON TORONTO ON (APPLE PAY) - -11.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
609	2024-07-26 16:09:17.677669+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-23-SHOPPERS-DRUG-MART-#09-TORONTO-ON-(APPLE-PAY)--28.95	2024-07-23 - SHOPPERS DRUG MART #09 TORONTO ON (APPLE PAY) - -28.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
610	2024-07-26 16:09:17.679371+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-23-MONOPOL-CAFE-TORONTO-ON-(APPLE-PAY)--44.45	2024-07-23 - MONOPOL CAFE TORONTO ON (APPLE PAY) - -44.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
611	2024-07-26 16:09:17.681109+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-23-CAMH---PHARMACY-TORONTO-ON-(APPLE-PAY)--187.61	2024-07-23 - CAMH - PHARMACY TORONTO ON (APPLE PAY) - -187.61	2	[{"changed": {"fields": ["Category"]}}]	7	1
612	2024-07-26 16:09:17.682596+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-23-CAMH---PHARMACY-TORONTO-ON-(APPLE-PAY)--187.6	2024-07-23 - CAMH - PHARMACY TORONTO ON (APPLE PAY) - -187.60	2	[{"changed": {"fields": ["Category"]}}]	7	1
613	2024-07-26 16:09:17.683981+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-22-ADVANCE-CARGO-SERVICES-ACEAST-YORK-ON-(APPLE-PAY)--4.52	2024-07-22 - ADVANCE CARGO SERVICES ACEAST YORK ON (APPLE PAY) - -4.52	2	[{"changed": {"fields": ["Category"]}}]	7	1
614	2024-07-26 16:09:17.685457+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-21-SEOUL-JIMJILBANG-SPA-TORONTO-ON-(APPLE-PAY)--4	2024-07-21 - SEOUL JIMJILBANG SPA TORONTO ON (APPLE PAY) - -4.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
615	2024-07-26 16:09:17.687263+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-21-FRESHII---DUFFERIN-&-STEETORONTO-ON-(APPLE-PAY)--25.28	2024-07-21 - FRESHII - DUFFERIN & STEETORONTO ON (APPLE PAY) - -25.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
616	2024-07-26 16:09:17.689023+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-21-Amazon.ca*RJ7G51G70-AMAZON.CA-ON--99.12	2024-07-21 - Amazon.ca*RJ7G51G70 AMAZON.CA ON - -99.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
617	2024-07-26 16:09:17.690517+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-CENTREVILLE-ETOBICOKE-ON-(APPLE-PAY)--6	2024-07-20 - CENTREVILLE ETOBICOKE ON (APPLE PAY) - -6.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
618	2024-07-26 16:09:33.209593+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-24-IMMIGRATION-CANADA-OTTAWA-ON-INSTALLMENT-ENROLLMENT-0	2024-07-24 - IMMIGRATION CANADA OTTAWA ON INSTALLMENT ENROLLMENT - 0.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
619	2024-07-26 16:09:33.211474+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-18-AFFIRM-CANADA-VANCOUVER-BC--21.19	2024-07-18 - AFFIRM CANADA VANCOUVER BC - -21.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
620	2024-08-01 12:50:38.850433+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-30-LANGUAGE-EXCHANGE-EVEN--7.7	2024-07-30 - LANGUAGE EXCHANGE EVEN - -7.70	2	[{"changed": {"fields": ["Category"]}}]	7	1
621	2024-08-01 12:50:38.855047+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-30-LANGUAGE-EXCHANGE-EVEN--21.01	2024-07-30 - LANGUAGE EXCHANGE EVEN - -21.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
622	2024-08-01 12:50:38.856502+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-30-FETTA-PANINI-BAR--31.98	2024-07-30 - FETTA PANINI BAR - -31.98	2	[{"changed": {"fields": ["Category"]}}]	7	1
623	2024-08-01 12:50:38.857956+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-29-COINAMATIC-TORONTO-ON--10	2024-07-29 - COINAMATIC TORONTO ON - -10.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
624	2024-08-01 12:50:38.859526+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-28-JONES-VARIETY-TORONTO-ON-(APPLE-PAY)--4.03	2024-07-28 - JONES VARIETY TORONTO ON (APPLE PAY) - -4.03	2	[{"changed": {"fields": ["Category"]}}]	7	1
625	2024-08-01 12:50:38.86103+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-27-JONES-VARIETY-TORONTO-ON-(APPLE-PAY)--25.64	2024-07-27 - JONES VARIETY TORONTO ON (APPLE PAY) - -25.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
626	2024-08-01 12:50:38.862532+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-27-DZO-TORONTO-ON-(APPLE-PAY)--34.67	2024-07-27 - DZO TORONTO ON (APPLE PAY) - -34.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
627	2024-08-01 12:50:38.864067+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-24-PRENUP-PUB-TORONTO-ON-(APPLE-PAY)--6.67	2024-07-24 - PRENUP PUB TORONTO ON (APPLE PAY) - -6.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
628	2024-08-01 12:50:38.865551+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-PHXSS-CA--20.44	2024-07-25 - PHXSS CA - -20.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
629	2024-08-01 12:50:38.866998+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-PARAMO-CAFE-AEROP-INTERNA--3.83	2024-07-25 - PARAMO CAFE AEROP INTERNA - -3.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
630	2024-08-01 12:50:38.868476+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-PARADA-INTELIGENTE-II--11.72	2024-07-25 - PARADA INTELIGENTE II - -11.72	2	[{"changed": {"fields": ["Category"]}}]	7	1
631	2024-08-01 12:50:38.869947+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-NUEVAS-CONCESIONES-T2-(ST--19.66	2024-07-25 - NUEVAS CONCESIONES T2 (ST - -19.66	2	[{"changed": {"fields": ["Category"]}}]	7	1
632	2024-08-01 12:50:38.871363+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-24-WENDI-ZIOMARA-SALAZAR-DELCCS-NOROESTE-AMT-120.00--4.65	2024-07-24 - WENDI ZIOMARA SALAZAR DELCCS NOROESTE AMT 120.00 - -4.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
633	2024-08-01 12:50:38.872833+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-24-HOTEL-CATIMAR-PTO.VIEJO--4.27	2024-07-24 - HOTEL CATIMAR PTO.VIEJO - -4.27	2	[{"changed": {"fields": ["Category"]}}]	7	1
634	2024-08-01 12:50:38.874266+00	ScotiaLine-Line-of-Credit---4537388883602016-2024-07-02-LOLP-AND/OR-HCP-PREMIUM--40.87	2024-07-02 - LOLP AND/OR HCP PREMIUM - -40.87	2	[{"changed": {"fields": ["Category"]}}]	7	1
635	2024-08-01 12:58:40.937441+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-29-CIGARRERIA-COPENAGUEN-1100100-BOGOT-AMT-16,500.00--5.84	2024-07-29 - CIGARRERIA COPENAGUEN 1100100 BOGOT AMT 16,500.00 - -5.84	2	[{"changed": {"fields": ["Category"]}}]	7	1
636	2024-08-01 12:58:40.939546+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-27-CIGARRERIA-COPENAGUEN-1100100-BOGOT-AMT-14,000.00--4.93	2024-07-27 - CIGARRERIA COPENAGUEN 1100100 BOGOT AMT 14,000.00 - -4.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
637	2024-08-01 12:58:40.941155+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-PHXSS-CA-CCS-NOROESTE-AMT-526.32--20.44	2024-07-25 - PHXSS CA CCS NOROESTE AMT 526.32 - -20.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
638	2024-08-01 12:58:40.942729+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-PARAMO-CAFE-AEROP-INTERNALA-GUAIRA-AMT-98.69--3.83	2024-07-25 - PARAMO CAFE AEROP INTERNALA GUAIRA AMT 98.69 - -3.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
639	2024-08-01 12:58:40.94433+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-PARADA-INTELIGENTE-II-MUNICIPIO-VAR-AMT-301.61--11.72	2024-07-25 - PARADA INTELIGENTE II MUNICIPIO VAR AMT 301.61 - -11.72	2	[{"changed": {"fields": ["Category"]}}]	7	1
640	2024-08-01 12:58:40.945799+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-25-NUEVAS-CONCESIONES-T2-(STPanam-AMT-13.85--19.66	2024-07-25 - NUEVAS CONCESIONES T2 (STPanam AMT 13.85 - -19.66	2	[{"changed": {"fields": ["Category"]}}]	7	1
641	2024-08-01 12:58:40.948853+00	Scotia-Momentum-No-Fee-VISA---4537061362908036-2024-07-24-HOTEL-CATIMAR-PTO.VIEJO-MUNICIPIO-VAR-AMT-110.00--4.27	2024-07-24 - HOTEL CATIMAR PTO.VIEJO MUNICIPIO VAR AMT 110.00 - -4.27	2	[{"changed": {"fields": ["Category"]}}]	7	1
642	2024-08-01 12:58:40.950349+00	Scotiabank-Value-VISA---4535097128673029-2024-07-18-ANNUAL-FEE--29	2024-07-18 - ANNUAL FEE - -29.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
643	2024-08-02 17:11:33.461121+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-02-UNONET-S.A--58.67	2024-08-02 - UNONET S.A - -58.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
644	2024-08-02 17:11:33.4634+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-01-ROAMLESS--14.71	2024-08-01 - ROAMLESS - -14.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
645	2024-08-02 17:11:33.466483+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-31-FETTA-PANINI-BAR-416-247-7678-ON-(APPLE-PAY)--31.98	2024-07-31 - FETTA PANINI BAR 416-247-7678 ON (APPLE PAY) - -31.98	2	[{"changed": {"fields": ["Category"]}}]	7	1
646	2024-08-06 13:18:48.73126+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-Spotify--16.94	2024-08-05 - Spotify - -16.94	2	[{"changed": {"fields": ["Category"]}}]	7	1
647	2024-08-06 13:18:48.736255+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-MERPAGO*TARJETASUBE--9.4	2024-08-05 - MERPAGO*TARJETASUBE - -9.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
648	2024-08-06 13:18:48.737807+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-MERPAGO*LOSBRAVOS--0.45	2024-08-05 - MERPAGO*LOSBRAVOS - -0.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
649	2024-08-06 13:18:48.739266+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-FREDDO-DISTRITO-ARCOS--11.15	2024-08-05 - FREDDO DISTRITO ARCOS - -11.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
650	2024-08-06 13:18:48.740827+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-FARMACITY-201-LOS-ARCOS--4.48	2024-08-05 - FARMACITY 201 LOS ARCOS - -4.48	2	[{"changed": {"fields": ["Category"]}}]	7	1
651	2024-08-06 13:18:48.742365+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-04-SUSHIPOP-IZAKAYA-CABA-AMT-31,990.00-(APPLE-PAY)--36.41	2024-08-04 - SUSHIPOP IZAKAYA CABA AMT 31,990.00 (APPLE PAY) - -36.41	2	[{"changed": {"fields": ["Category"]}}]	7	1
652	2024-08-06 13:18:48.743824+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-04-SUSHIPOP-IZAKAYA-CABA-AMT-19,490.00-(APPLE-PAY)--22.18	2024-08-04 - SUSHIPOP IZAKAYA CABA AMT 19,490.00 (APPLE PAY) - -22.18	2	[{"changed": {"fields": ["Category"]}}]	7	1
653	2024-08-06 13:18:48.745408+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-04-MERPAGO*BOYACA-1942CAP.FEDERAL-AMT-21,900.00-(APPLE-PAY)--24.93	2024-08-04 - MERPAGO*BOYACA 1942CAP.FEDERAL AMT 21,900.00 (APPLE PAY) - -24.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
654	2024-08-06 13:18:48.747007+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-03-KKO-KNR-AEROPUERTO-BOGOTA-AMT-62,700.00-(APPLE-PAY)--22.01	2024-08-03 - KKO KNR AEROPUERTO BOGOTA AMT 62,700.00 (APPLE PAY) - -22.01	2	[{"changed": {"fields": ["Category"]}}]	7	1
655	2024-08-06 13:18:48.74858+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-03-CHOLO-CON-CHE-0092CAPITAL-FEDER-AMT-85,470.00-(APPLE-PAY)--97.27	2024-08-03 - CHOLO CON CHE 0092CAPITAL FEDER AMT 85,470.00 (APPLE PAY) - -97.27	2	[{"changed": {"fields": ["Category"]}}]	7	1
656	2024-08-06 13:18:48.750141+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-03-AFFIRM-CANADA-VANCOUVER-BC--21.19	2024-08-03 - AFFIRM CANADA VANCOUVER BC - -21.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
657	2024-08-06 13:18:48.751557+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-03-2006-SA-EZEIZA-AMT-9,500.00-(APPLE-PAY)--10.81	2024-08-03 - 2006 SA EZEIZA AMT 9,500.00 (APPLE PAY) - -10.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
658	2024-08-06 13:18:48.75309+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-02-UNONET-S.A.-PANAMA-AMT-41.20--58.66	2024-08-02 - UNONET S.A. PANAMA AMT 41.20 - -58.66	2	[{"changed": {"fields": ["Category"]}}]	7	1
659	2024-08-06 13:18:48.754677+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-02-KLARNA*-AIRBNB-VANCOUVER-BC--173.8	2024-08-02 - KLARNA* AIRBNB VANCOUVER BC - -173.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
660	2024-08-06 13:18:48.756222+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-01-ROAMLESS-HTTPSWWW.ROAMDE-AMT-10.35-(APPLE-PAY)--14.71	2024-08-01 - ROAMLESS HTTPSWWW.ROAMDE AMT 10.35 (APPLE PAY) - -14.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
661	2024-08-06 13:19:40.561575+00	ScotiaLine-Line-of-Credit---4537388883602016-2024-07-02-LOLP-AND/OR-HCP-PREMIUM--40.87	2024-07-02 - LOLP AND/OR HCP PREMIUM - -40.87	2	[{"changed": {"fields": ["Category"]}}]	7	1
662	2024-08-06 13:20:40.116649+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-01-SUN-LIFE-CHOICES-A&A--40.48	2024-08-01 - SUN LIFE CHOICES A&A - -40.48	3		7	1
663	2024-08-06 13:29:56.876578+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-20-THE-ISLAND-GREEK-GRILL-TORONTO-ON-(APPLE-PAY)--24.25	2024-07-20 - THE ISLAND GREEK GRILL TORONTO ON (APPLE PAY) - -24.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
664	2024-08-06 13:29:56.879613+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-01-WWW.PISHOP.CA-NEPEAN-ON--403.32	2024-07-01 - WWW.PISHOP.CA NEPEAN ON - -403.32	2	[{"changed": {"fields": ["Category"]}}]	7	1
665	2024-08-06 13:29:56.881297+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-29-AMZN-Mktp-CA*Q93UQ83D3-WWW.AMAZON.CAON--33.89	2024-05-29 - AMZN Mktp CA*Q93UQ83D3 WWW.AMAZON.CAON - -33.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
666	2024-08-06 13:29:56.883564+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-29-AMZN-Mktp-CA*162402PT3-WWW.AMAZON.CAON--45.19	2024-05-29 - AMZN Mktp CA*162402PT3 WWW.AMAZON.CAON - -45.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
667	2024-08-06 13:29:56.885451+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-05-27-AMAZON*-701-4935114-66-DOWNTOWN-TOROON--69.09	2024-05-27 - AMAZON* 701-4935114-66 DOWNTOWN TOROON - -69.09	2	[{"changed": {"fields": ["Category"]}}]	7	1
668	2024-08-09 14:09:25.501302+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-07-MERPAGO*CAFEMARTINEZ--13.92	2024-08-07 - MERPAGO*CAFEMARTINEZ - -13.92	2	[{"changed": {"fields": ["Category"]}}]	7	1
669	2024-08-09 14:09:25.50624+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-07-MERPAGO*CAFEMARTINEZ--0.23	2024-08-07 - MERPAGO*CAFEMARTINEZ - -0.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
670	2024-08-09 14:09:25.507689+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-06-XCOOP-ARGENTINA-CABA-AMT-7,000.00-(APPLE-PAY)--7.98	2024-08-06 - XCOOP ARGENTINA CABA AMT 7,000.00 (APPLE PAY) - -7.98	2	[{"changed": {"fields": ["Category"]}}]	7	1
671	2024-08-09 14:09:25.509065+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-06-TAKOYAKI--16.89	2024-08-06 - TAKOYAKI - -16.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
768	2024-09-08 13:18:51.602064+00	4538266865745202409040006	2024-09-03 - MERPAGO*FAROLA       1942 - 32.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
672	2024-08-09 14:09:25.510544+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-MERPAGO*TARJETASUBE-ROSARIO-AMT-8,260.00--9.4	2024-08-05 - MERPAGO*TARJETASUBE ROSARIO AMT 8,260.00 - -9.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
673	2024-08-09 14:09:25.512502+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-MERPAGO*LOSBRAVOS-1942CAP.FEDERAL-AMT-400.00-(APPLE-PAY)--0.45	2024-08-05 - MERPAGO*LOSBRAVOS 1942CAP.FEDERAL AMT 400.00 (APPLE PAY) - -0.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
674	2024-08-09 14:09:25.513895+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-05-FARMACITY-201-LOS-ARC5693CAP.FEDERAL-AMT-3,933.00-(APPLE-PAY)--4.48	2024-08-05 - FARMACITY 201 LOS ARC5693CAP.FEDERAL AMT 3,933.00 (APPLE PAY) - -4.48	2	[{"changed": {"fields": ["Category"]}}]	7	1
675	2024-08-09 14:10:34.325306+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-08-AIRBNB-*-HM3XHW9JQC-0	2024-08-08 - AIRBNB * HM3XHW9JQC - 1100	2	[{"changed": {"fields": ["Amount"]}}]	7	1
676	2024-08-09 14:10:51.024116+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-08-AIRBNB-*-HM3XHW9JQC-0	2024-08-08 - AIRBNB * HM3XHW9JQC - -1150.00	2	[{"changed": {"fields": ["Amount"]}}]	7	1
677	2024-08-12 19:39:12.954151+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-12-MERPAGO*FARMALIV--18.64	2024-08-12 - MERPAGO*FARMALIV - -18.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
678	2024-08-12 19:39:12.959176+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-11-TIENDAS-ELTEN--10.73	2024-08-11 - TIENDAS ELTEN - -10.73	2	[{"changed": {"fields": ["Category"]}}]	7	1
679	2024-08-12 19:39:12.960757+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-11-MERPAGO*ELOCTAVO--11.54	2024-08-11 - MERPAGO*ELOCTAVO - -11.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
680	2024-08-12 19:39:12.962251+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-11-MERPAGO*BODEGONBARCEL--29.9	2024-08-11 - MERPAGO*BODEGONBARCEL - -29.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
681	2024-08-12 19:39:12.964212+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-10-PAYPAL-*PDFAID-COM--1.95	2024-08-10 - PAYPAL *PDFAID COM - -1.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
682	2024-08-12 19:39:12.965716+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-10-MERPAGO*BOYACA--25.63	2024-08-10 - MERPAGO*BOYACA - -25.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
683	2024-08-12 19:39:12.967087+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-09-MERPAGO*CRONICOBAR--7.37	2024-08-09 - MERPAGO*CRONICOBAR - -7.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
684	2024-08-12 19:39:12.968618+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-09-DIGGS--30.36	2024-08-09 - DIGGS - -30.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
685	2024-08-15 21:22:13.21445+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-14-MERPAGO*SILVERCROSSAMERIC--54.13	2024-08-14 - MERPAGO*SILVERCROSSAMERIC - -110	2	[{"changed": {"fields": ["Amount"]}}]	7	1
686	2024-08-15 21:25:43.332278+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-14-MERPAGO*SILVERCROSSAMERIC--54.13	2024-08-14 - MERPAGO*SILVERCROSSAMERIC - -110.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
687	2024-08-15 21:25:43.334271+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-14-MERPAGO*LOSBRAVOS--3.53	2024-08-14 - MERPAGO*LOSBRAVOS - -3.53	2	[{"changed": {"fields": ["Category"]}}]	7	1
688	2024-08-15 21:25:43.335733+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-13-MERPAGO*PANADONNA-1942CAP.FEDERAL-AMT-7,400.00-(APPLE-PAY)--8.66	2024-08-13 - MERPAGO*PANADONNA 1942CAP.FEDERAL AMT 7,400.00 (APPLE PAY) - -8.66	2	[{"changed": {"fields": ["Category"]}}]	7	1
689	2024-08-15 21:25:43.337175+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-13-MERPAGO*ELOCTAVO-SAN-CRISTBAL-AMT-10,000.00--11.71	2024-08-13 - MERPAGO*ELOCTAVO SAN CRISTBAL AMT 10,000.00 - -11.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
690	2024-08-15 21:25:43.338664+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-13-GAVARE-SRL--9.36	2024-08-13 - GAVARE SRL - -9.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
691	2024-08-15 21:25:43.340022+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-12-MERPAGO*FARMALIV-1942CAP.FEDERAL-AMT-16,154.81-(APPLE-PAY)--18.64	2024-08-12 - MERPAGO*FARMALIV 1942CAP.FEDERAL AMT 16,154.81 (APPLE PAY) - -18.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
692	2024-08-15 21:25:43.341568+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-12-Alovata-CABA-AMT-35,000.00-(APPLE-PAY)--40.96	2024-08-12 - Alovata CABA AMT 35,000.00 (APPLE PAY) - -40.96	2	[{"changed": {"fields": ["Category"]}}]	7	1
693	2024-08-15 21:25:43.343003+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-11-TIENDAS-ELTEN-3161CAPITAL-FEDER-AMT-9,300.00-(APPLE-PAY)--10.73	2024-08-11 - TIENDAS ELTEN 3161CAPITAL FEDER AMT 9,300.00 (APPLE PAY) - -10.73	2	[{"changed": {"fields": ["Category"]}}]	7	1
694	2024-08-15 21:25:43.34459+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-11-MERPAGO*ELOCTAVO-1942CAP.FEDERAL-AMT-10,000.00-(APPLE-PAY)--11.54	2024-08-11 - MERPAGO*ELOCTAVO 1942CAP.FEDERAL AMT 10,000.00 (APPLE PAY) - -11.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
695	2024-08-15 21:25:43.346091+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-11-MERPAGO*BODEGONBARCEL1942CAP.FEDERAL-AMT-25,900.00-(APPLE-PAY)--29.9	2024-08-11 - MERPAGO*BODEGONBARCEL1942CAP.FEDERAL AMT 25,900.00 (APPLE PAY) - -29.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
696	2024-08-15 21:25:43.347501+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-09-MERPAGO*CRONICOBAR-1942CAP.FEDERAL-AMT-6,380.00-(APPLE-PAY)--7.37	2024-08-09 - MERPAGO*CRONICOBAR 1942CAP.FEDERAL AMT 6,380.00 (APPLE PAY) - -7.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
697	2024-08-15 21:25:43.348909+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-09-DIGGS-5452CAP.FEDERAL-AMT-26,300.00-(APPLE-PAY)--30.36	2024-08-09 - DIGGS 5452CAP.FEDERAL AMT 26,300.00 (APPLE PAY) - -30.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
698	2024-08-15 21:25:59.420872+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-06-TAKOYAKI-6478CAPITAL-FEDER-AMT-14,800.00-(APPLE-PAY)--16.89	2024-08-06 - TAKOYAKI 6478CAPITAL FEDER AMT 14,800.00 (APPLE PAY) - -16.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
699	2024-08-16 23:56:18.350611+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-16-MERPAGO*PANADONNA--26.89	2024-08-16 - MERPAGO*PANADONNA - -26.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
700	2024-08-16 23:56:18.352674+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-13-GAVARE-SRL-9302CAPITAL-FEDER-AMT-8,000.00-(APPLE-PAY)--9.36	2024-08-13 - GAVARE SRL 9302CAPITAL FEDER AMT 8,000.00 (APPLE PAY) - -9.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
701	2024-08-16 23:57:12.716516+00	2	farmacia -> Health	2	[{"changed": {"fields": ["Category"]}}]	9	1
702	2024-08-18 20:04:50.858852+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-18-MERPAGO*ILVEROARTURITOABA--95.13	2024-08-18 - MERPAGO*ILVEROARTURITOABA - -95.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
703	2024-08-18 20:04:50.863782+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-17-PARRILLA-LA-ESCONDIDA--37.11	2024-08-17 - PARRILLA LA ESCONDIDA - -37.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
819	2024-09-08 13:18:51.704261+00	4538266865745202407150014	2024-07-14 - PARLIAMENT SMOKE & GIFT - 6.70	2	[{"changed": {"fields": ["Category"]}}]	7	1
704	2024-08-18 20:04:50.865245+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-14-MERPAGO*SILVERCROSSAM1942CAP.FEDERAL-AMT-45,940.00-(APPLE-PAY)--54.13	2024-08-14 - MERPAGO*SILVERCROSSAM1942CAP.FEDERAL AMT 45,940.00 (APPLE PAY) - -54.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
705	2024-08-23 20:42:47.695955+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-17-PARRILLA-LA-ESCONDIDA6432CAPITAL-FEDER-AMT-32,100.00-(APPLE-PAY)--37.11	2024-08-17 - PARRILLA LA ESCONDIDA6432CAPITAL FEDER AMT 32,100.00 (APPLE PAY) - -37.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
706	2024-08-23 20:43:40.236542+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-19-Wise-Payments-Canada-Inc.Ottawa-ON-(APPLE-PAY)--10	2024-08-19 - Wise Payments Canada Inc.Ottawa ON (APPLE PAY) - -10.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
707	2024-08-23 20:43:40.239293+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-19-MERPAGO*MARICAFE-1942CAP.FEDERAL-AMT-26,000.00-(APPLE-PAY)--30.05	2024-08-19 - MERPAGO*MARICAFE 1942CAP.FEDERAL AMT 26,000.00 (APPLE PAY) - -30.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
708	2024-08-23 20:43:40.241574+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-19-MERPAGO*KIOSCOMARTIN-1942CAP.FEDERAL-AMT-1,200.00-(APPLE-PAY)--1.38	2024-08-19 - MERPAGO*KIOSCOMARTIN 1942CAP.FEDERAL AMT 1,200.00 (APPLE PAY) - -1.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
709	2024-08-23 20:43:40.243692+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-18-MERPAGO*ILVEROARTURIT1942CAP.FEDERAL-AMT-82,300.00-(APPLE-PAY)--95.13	2024-08-18 - MERPAGO*ILVEROARTURIT1942CAP.FEDERAL AMT 82,300.00 (APPLE PAY) - -95.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
710	2024-08-23 20:43:40.245939+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-18-MERPAGO*FLAVORCAFE-1942CAP.FEDERAL-AMT-16,800.00-(APPLE-PAY)--19.42	2024-08-18 - MERPAGO*FLAVORCAFE 1942CAP.FEDERAL AMT 16,800.00 (APPLE PAY) - -19.42	2	[{"changed": {"fields": ["Category"]}}]	7	1
711	2024-08-25 17:44:48.709608+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-WRANGLER--14.2	2024-08-24 - WRANGLER - -14.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
712	2024-08-25 17:44:48.711769+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-TIMELEFT--11.17	2024-08-24 - TIMELEFT - -11.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
713	2024-08-25 17:44:48.713347+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-MERPAGO*GRUPONIGBO--22.37	2024-08-24 - MERPAGO*GRUPONIGBO - -22.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
714	2024-08-25 17:44:48.714732+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-MERPAGO*BIUTIFULGAL--16.23	2024-08-24 - MERPAGO*BIUTIFULGAL - -16.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
715	2024-08-25 17:44:48.716294+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-CUSPIDE-LIBROS-SA--29.43	2024-08-24 - CUSPIDE LIBROS SA - -29.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
716	2024-08-25 17:44:48.717963+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-CASA-PARADISO--8.46	2024-08-24 - CASA PARADISO - -8.46	2	[{"changed": {"fields": ["Category"]}}]	7	1
717	2024-08-25 17:44:48.719467+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-CASA-PARADISO--17.73	2024-08-24 - CASA PARADISO - -17.73	2	[{"changed": {"fields": ["Category"]}}]	7	1
718	2024-08-25 17:44:48.720911+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-CASA-PARADISO--11.82	2024-08-24 - CASA PARADISO - -11.82	2	[{"changed": {"fields": ["Category"]}}]	7	1
719	2024-08-25 17:44:48.722519+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-Wise-Payments-Canada-Inc.Ottawa-ON-(APPLE-PAY)--5.14	2024-08-23 - Wise Payments Canada Inc.Ottawa ON (APPLE PAY) - -5.14	2	[{"changed": {"fields": ["Category"]}}]	7	1
720	2024-08-25 17:44:48.724324+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-Wise-Payments-Canada-Inc.Ottawa-ON-(APPLE-PAY)--30.81	2024-08-23 - Wise Payments Canada Inc.Ottawa ON (APPLE PAY) - -30.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
721	2024-08-25 17:44:48.725793+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-MERPAGO*FARMALIV--11.1	2024-08-23 - MERPAGO*FARMALIV - -11.10	2	[{"changed": {"fields": ["Category"]}}]	7	1
722	2024-08-25 17:44:48.727308+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-MERPAGO*CMAVCORDOBA3899--6.25	2024-08-23 - MERPAGO*CMAVCORDOBA3899 - -6.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
723	2024-08-25 17:44:48.72912+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-CHS-BURGER--28.97	2024-08-23 - CHS BURGER - -28.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
724	2024-08-26 15:25:24.15885+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-20-LA-MAQUINITA-CO--61.33	2024-08-20 - LA MAQUINITA CO - -61.33	2	[{"changed": {"fields": ["Category"]}}]	7	1
725	2024-09-02 19:57:01.652622+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-01-TOIEM-PERU--94.05	2024-09-01 - TOIEM PERU - -94.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
726	2024-09-02 19:57:01.657525+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-01-MERPAGO*QUECHUAREST--57.86	2024-09-01 - MERPAGO*QUECHUAREST - -57.86	2	[{"changed": {"fields": ["Category"]}}]	7	1
727	2024-09-02 19:57:01.659166+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-31-DNH*GODADDY#3272646732--16.85	2024-08-31 - DNH*GODADDY#3272646732 - -16.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
728	2024-09-02 19:57:01.660758+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-30-MERPAGO*CCKONEX--20.89	2024-08-30 - MERPAGO*CCKONEX - -20.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
729	2024-09-02 19:57:01.662412+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-29-MERPAGO*SALOMONCHIRAZIYJACIUDAD-AUTONO-AMT-20,691.90--23.78	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJACIUDAD AUTONO AMT 20,691.90 - -23.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
730	2024-09-02 19:57:01.66396+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-29-MERPAGO*CCKONEX-BALVANERA-AMT-7,400.00--8.51	2024-08-29 - MERPAGO*CCKONEX BALVANERA AMT 7,400.00 - -8.51	2	[{"changed": {"fields": ["Category"]}}]	7	1
731	2024-09-02 19:57:01.665517+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-29-MERPAGO*CCKONEX-BALVANERA-AMT-11,000.00--12.64	2024-08-29 - MERPAGO*CCKONEX BALVANERA AMT 11,000.00 - -12.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
732	2024-09-02 19:57:01.66712+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-28-CLAUDE.AI-SUBSCRIPTION-HTTPSWWW.ANTHCA--31.64	2024-08-28 - CLAUDE.AI SUBSCRIPTION HTTPSWWW.ANTHCA - -31.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
733	2024-09-02 19:57:01.668719+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-27-RAPANUI-CABA-AMT-8,800.00-(APPLE-PAY)--10.08	2024-08-27 - RAPANUI CABA AMT 8,800.00 (APPLE PAY) - -10.08	2	[{"changed": {"fields": ["Category"]}}]	7	1
734	2024-09-02 19:57:01.670423+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-27-FARMACITY-CORDOBA-Y-B4857CAP.FEDERAL-AMT-6,157.50-(APPLE-PAY)--7.08	2024-08-27 - FARMACITY CORDOBA Y B4857CAP.FEDERAL AMT 6,157.50 (APPLE PAY) - -7.08	2	[{"changed": {"fields": ["Category"]}}]	7	1
735	2024-09-02 19:57:01.672003+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-25-MERPAGO*MARTIN-1942CAP.FEDERAL-AMT-2,900.00-(APPLE-PAY)--3.36	2024-08-25 - MERPAGO*MARTIN 1942CAP.FEDERAL AMT 2,900.00 (APPLE PAY) - -3.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
736	2024-09-02 19:57:01.673648+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-25-FARMACITY-CORDOBA-Y-B4857CAP.FEDERAL-AMT-31,754.59-(APPLE-PAY)--36.8	2024-08-25 - FARMACITY CORDOBA Y B4857CAP.FEDERAL AMT 31,754.59 (APPLE PAY) - -36.80	2	[{"changed": {"fields": ["Category"]}}]	7	1
737	2024-09-02 20:03:50.70725+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-WRANGLER-CABA-AMT-12,250.00-(APPLE-PAY)--14.2	2024-08-24 - WRANGLER CABA AMT 12,250.00 (APPLE PAY) - -14.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
738	2024-09-02 20:03:50.709381+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-TIMELEFT-PARIS-AMT-8.00--11.17	2024-08-24 - TIMELEFT PARIS AMT 8.00 - -11.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
739	2024-09-02 20:03:50.710956+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-MERPAGO*GRUPONIGBO-1942CAP.FEDERAL-AMT-19,300.00-(APPLE-PAY)--22.37	2024-08-24 - MERPAGO*GRUPONIGBO 1942CAP.FEDERAL AMT 19,300.00 (APPLE PAY) - -22.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
740	2024-09-02 20:03:50.712455+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-MERPAGO*BIUTIFULGAL-1942CAP.FEDERAL-AMT-14,000.00-(APPLE-PAY)--16.23	2024-08-24 - MERPAGO*BIUTIFULGAL 1942CAP.FEDERAL AMT 14,000.00 (APPLE PAY) - -16.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
741	2024-09-02 20:03:50.714006+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-FUNDACION-MALBA-CAPITAL-FEDER-AMT-14,000.00-(APPLE-PAY)--16.23	2024-08-24 - FUNDACION MALBA CAPITAL FEDER AMT 14,000.00 (APPLE PAY) - -16.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
742	2024-09-02 20:03:50.71557+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-24-CUSPIDE-LIBROS-SA-6412CAP.FEDERAL-AMT-25,400.00-(APPLE-PAY)--29.43	2024-08-24 - CUSPIDE LIBROS SA 6412CAP.FEDERAL AMT 25,400.00 (APPLE PAY) - -29.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
743	2024-09-02 20:03:50.71726+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-MERPAGO*CMAVCORDOBA381942CAP.FEDERAL-AMT-5,400.00-(APPLE-PAY)--6.25	2024-08-23 - MERPAGO*CMAVCORDOBA381942CAP.FEDERAL AMT 5,400.00 (APPLE PAY) - -6.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
744	2024-09-02 20:03:50.718898+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-CHS-BURGER-8679CAPITAL-FEDER-AMT-25,000.00-(APPLE-PAY)--28.97	2024-08-23 - CHS BURGER 8679CAPITAL FEDER AMT 25,000.00 (APPLE PAY) - -28.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
745	2024-09-02 20:04:41.403333+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-23-FREEDOM-MOBILE--124.38	2024-08-23 - FREEDOM MOBILE - -124.38	3		7	1
746	2024-09-06 00:30:37.159707+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-05-MERPAGO*SOCIALSUSHI--32.02	2024-09-05 - MERPAGO*SOCIALSUSHI - -32.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
747	2024-09-06 00:30:37.161889+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-05-MERPAGO*ELECTROWORLDGROUP--36.54	2024-09-05 - MERPAGO*ELECTROWORLDGROUP - -36.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
748	2024-09-06 00:30:37.163469+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-04-MERPAGO*GRANBARDANZON--51.85	2024-09-04 - MERPAGO*GRANBARDANZON - -51.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
749	2024-09-06 00:30:37.16502+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-04-DLO*UBER*RIDES--5.44	2024-09-04 - DLO*UBER*RIDES - -5.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
750	2024-09-06 00:30:37.166588+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-03-MERPAGO*NEMURI--80.34	2024-09-03 - MERPAGO*NEMURI - -80.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
751	2024-09-06 00:30:37.168159+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-03-MERPAGO*FERRETERIASER1942CAP.FEDERAL-AMT-7,200.00-(APPLE-PAY)--8.25	2024-09-03 - MERPAGO*FERRETERIASER1942CAP.FEDERAL AMT 7,200.00 (APPLE PAY) - -8.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
752	2024-09-06 00:30:37.169689+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-03-MERPAGO*FAROLA-1942CAP.FEDERAL-AMT-28,100.00-(APPLE-PAY)--32.22	2024-09-03 - MERPAGO*FAROLA 1942CAP.FEDERAL AMT 28,100.00 (APPLE PAY) - -32.22	2	[{"changed": {"fields": ["Category"]}}]	7	1
753	2024-09-06 00:30:37.171245+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-02-OLYMPO-3667CAPITAL-FEDER-AMT-72,500.00-(APPLE-PAY)--83.12	2024-09-02 - OLYMPO 3667CAPITAL FEDER AMT 72,500.00 (APPLE PAY) - -83.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
754	2024-09-06 00:30:37.172848+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-02-NOTARIZE.CA-HAMILTON-ON--32.19	2024-09-02 - NOTARIZE.CA HAMILTON ON - -32.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
755	2024-09-06 00:30:37.174428+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-02-MERPAGO*AUTOSERWILLYS1942CAP.FEDERAL-AMT-17,500.00-(APPLE-PAY)--20.06	2024-09-02 - MERPAGO*AUTOSERWILLYS1942CAP.FEDERAL AMT 17,500.00 (APPLE PAY) - -20.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
756	2024-09-06 00:30:37.176007+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-02-DOWNTOWN-NOTARY-TORONTO-ON--5.65	2024-09-02 - DOWNTOWN NOTARY TORONTO ON - -5.65	2	[{"changed": {"fields": ["Category"]}}]	7	1
757	2024-09-06 00:30:37.177579+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-01-TOIEM-PERU-ACASSUSSO-AMT-81,600.00-(APPLE-PAY)--94.05	2024-09-01 - TOIEM PERU ACASSUSSO AMT 81,600.00 (APPLE PAY) - -94.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
758	2024-09-06 00:30:37.179142+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-01-MERPAGO*QUECHUAREST-1942CAP.FEDERAL-AMT-50,200.00-(APPLE-PAY)--57.86	2024-09-01 - MERPAGO*QUECHUAREST 1942CAP.FEDERAL AMT 50,200.00 (APPLE PAY) - -57.86	2	[{"changed": {"fields": ["Category"]}}]	7	1
759	2024-09-06 00:30:37.180674+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-08-31-DNH*GODADDY#3272646732-480-5058855-AZ-AMT-12.17--16.85	2024-08-31 - DNH*GODADDY#3272646732 480-5058855 AZ AMT 12.17 - -16.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
760	2024-09-06 00:35:12.870259+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-02-SUN-LIFE-CHOICES-A&A--40.48	2024-09-02 - SUN LIFE CHOICES A&A - -40.48	3		7	1
761	2024-09-06 00:38:20.174026+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-04-LA-MAQUINITA-CO--63.44	2024-09-04 - LA MAQUINITA CO - -63.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
762	2024-09-06 00:38:20.176068+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-02-UNONET-S.A.-PANAMA-AMT-7.20--9.97	2024-09-02 - UNONET S.A. PANAMA AMT 7.20 - -9.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
763	2024-09-08 13:18:51.584474+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-09-03-MERPAGO*NEMURI-1942CAP.FEDERAL-AMT-69,840.00-(APPLE-PAY)--80.34	2024-09-03 - MERPAGO*NEMURI 1942CAP.FEDERAL AMT 69,840.00 (APPLE PAY) - -80.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
764	2024-09-08 13:18:51.593871+00	464249759631467	2024-09-05 - MERPAGO*SOCIALSUSHI - 32.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
765	2024-09-08 13:18:51.59598+00	4538266865745202409060003	2024-09-05 - MERPAGO*ELECTROWORLDGROUP - 36.54	2	[{"changed": {"fields": ["Category"]}}]	7	1
766	2024-09-08 13:18:51.598062+00	4538266865745202409060001	2024-09-04 - MERPAGO*GRANBARDANZON1942 - 51.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
767	2024-09-08 13:18:51.600226+00	4538266865745202409050001	2024-09-03 - MERPAGO*NEMURI       1942 - 80.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
770	2024-09-08 13:18:51.606772+00	4538266865745202409040004	2024-09-02 - OLYMPO               3667 - 83.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
771	2024-09-08 13:18:51.611021+00	4538266865745202409040003	2024-09-02 - MERPAGO*AUTOSERWILLYS1942 - 20.06	2	[{"changed": {"fields": ["Category"]}}]	7	1
772	2024-09-08 13:18:51.614399+00	4538266865745202409030033	2024-09-02 - NOTARIZE.CA - 32.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
773	2024-09-08 13:18:51.616282+00	4538266865745202409030029	2024-09-01 - TOIEM PERU - 94.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
774	2024-09-08 13:18:51.618006+00	4538266865745202409030028	2024-09-01 - MERPAGO*QUECHUAREST  1942 - 57.86	2	[{"changed": {"fields": ["Category"]}}]	7	1
775	2024-09-08 13:18:51.620106+00	4538266865745202409030017	2024-08-31 - DNH*GODADDY#3272646732 - 16.85	2	[{"changed": {"fields": ["Category"]}}]	7	1
776	2024-09-08 13:18:51.622177+00	4538266865745202408300005	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJA - 23.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
777	2024-09-08 13:18:51.624068+00	4538266865745202408290004	2024-08-28 - CLAUDE.AI SUBSCRIPTION - 31.64	2	[{"changed": {"fields": ["Category"]}}]	7	1
778	2024-09-08 13:18:51.626007+00	4538266865745202408290002	2024-08-27 - RAPANUI - 10.08	2	[{"changed": {"fields": ["Category"]}}]	7	1
779	2024-09-08 13:18:51.628095+00	4538266865745202408270007	2024-08-25 - MERPAGO*MARTIN       1942 - 3.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
780	2024-09-08 13:18:51.629951+00	4538266865745202408260018	2024-08-24 - CUSPIDE LIBROS SA    6412 - 29.43	2	[{"changed": {"fields": ["Category"]}}]	7	1
781	2024-09-08 13:18:51.631749+00	4538266865745202408260017	2024-08-24 - MERPAGO*GRUPONIGBO   1942 - 22.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
782	2024-09-08 13:18:51.633368+00	4538266865745202408260013	2024-08-24 - WRANGLER - 14.20	2	[{"changed": {"fields": ["Category"]}}]	7	1
783	2024-09-08 13:18:51.634872+00	4538266865745202408260011	2024-08-24 - TIMELEFT - 11.17	2	[{"changed": {"fields": ["Category"]}}]	7	1
784	2024-09-08 13:18:51.63642+00	4538266865745202408260008	2024-08-23 - CHS BURGER           8679 - 28.97	2	[{"changed": {"fields": ["Category"]}}]	7	1
785	2024-09-08 13:18:51.638237+00	4538266865745202408260005	2024-08-23 - MERPAGO*CMAVCORDOBA381942 - 6.25	2	[{"changed": {"fields": ["Category"]}}]	7	1
786	2024-09-08 13:18:51.640003+00	4538266865745202408210001	2024-08-19 - MERPAGO*MARICAFE     1942 - 30.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
787	2024-09-08 13:18:51.641449+00	4538266865745202408200006	2024-08-19 - MERPAGO*KIOSCOMARTIN 1942 - 1.38	2	[{"changed": {"fields": ["Category"]}}]	7	1
788	2024-09-08 13:18:51.643183+00	4538266865745202408200005	2024-08-18 - MERPAGO*ILVEROARTURIT1942 - 95.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
789	2024-09-08 13:18:51.644977+00	4538266865745202408200004	2024-08-18 - MERPAGO*FLAVORCAFE   1942 - 19.42	2	[{"changed": {"fields": ["Category"]}}]	7	1
790	2024-09-08 13:18:51.646776+00	4538266865745202408190009	2024-08-17 - PARRILLA LA ESCONDIDA6432 - 37.11	2	[{"changed": {"fields": ["Category"]}}]	7	1
791	2024-09-08 13:18:51.648773+00	4538266865745202408160001	2024-08-14 - MERPAGO*SILVERCROSSAM1942 - 54.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
792	2024-09-08 13:18:51.651014+00	4538266865745202408150001	2024-08-13 - GAVARE SRL           9302 - 9.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
793	2024-09-08 13:18:51.653091+00	4538266865745202408140001	2024-08-12 - Alovata - 40.96	2	[{"changed": {"fields": ["Category"]}}]	7	1
794	2024-09-08 13:18:51.655135+00	4538266865745202408130010	2024-08-11 - MERPAGO*BODEGONBARCEL1942 - 29.90	2	[{"changed": {"fields": ["Category"]}}]	7	1
795	2024-09-08 13:18:51.657213+00	4538266865745202408130009	2024-08-11 - TIENDAS ELTEN        3161 - 10.73	2	[{"changed": {"fields": ["Category"]}}]	7	1
796	2024-09-08 13:18:51.659271+00	4538266865745202408120016	2024-08-09 - DIGGS                5452 - 30.36	2	[{"changed": {"fields": ["Category"]}}]	7	1
797	2024-09-08 13:18:51.661172+00	4538266865745202408120014	2024-08-09 - MERPAGO*CRONICOBAR   1942 - 7.37	2	[{"changed": {"fields": ["Category"]}}]	7	1
798	2024-09-08 13:18:51.662781+00	4538266865745202408120010	2024-08-06 - TAKOYAKI             6478 - 16.89	2	[{"changed": {"fields": ["Category"]}}]	7	1
799	2024-09-08 13:18:51.664396+00	4538266865745202408070006	2024-08-06 - XCOOP ARGENTINA - 7.98	2	[{"changed": {"fields": ["Category"]}}]	7	1
800	2024-09-08 13:18:51.666264+00	4538266865745202408060004	2024-08-05 - MERPAGO*TARJETASUBE - 9.40	2	[{"changed": {"fields": ["Category"]}}]	7	1
801	2024-09-08 13:18:51.668251+00	4538266865745202408050013	2024-08-03 - CHOLO CON CHE        0092 - 97.27	2	[{"changed": {"fields": ["Category"]}}]	7	1
802	2024-09-08 13:18:51.670237+00	4538266865745202408050009	2024-08-03 - 2006 SA - 10.81	2	[{"changed": {"fields": ["Category"]}}]	7	1
803	2024-09-08 13:18:51.672137+00	4538266865745202408020003	2024-08-01 - ROAMLESS - 14.71	2	[{"changed": {"fields": ["Category"]}}]	7	1
804	2024-09-08 13:18:51.674077+00	4538266865745202407310001	2024-07-29 - COINAMATIC - 10.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
805	2024-09-08 13:18:51.676095+00	4538266865745202407290004	2024-07-27 - DZO - 34.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
806	2024-09-08 13:18:51.67808+00	4538266865745202407260002	2024-07-24 - PRENUP PUB - 6.67	2	[{"changed": {"fields": ["Category"]}}]	7	1
807	2024-09-08 13:18:51.680082+00	4538266865745202407240004	2024-07-23 - MONOPOL CAFE - 44.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
808	2024-09-08 13:18:51.682083+00	4538266865745202407240003	2024-07-23 - SHOPPERS DRUG MART #09 - 28.95	2	[{"changed": {"fields": ["Category"]}}]	7	1
809	2024-09-08 13:18:51.684172+00	4538266865745202407230003	2024-07-22 - ADVANCE CARGO SERVICES AC - 4.52	2	[{"changed": {"fields": ["Category"]}}]	7	1
810	2024-09-08 13:18:51.686134+00	4538266865745202407230002	2024-07-21 - FRESHII - DUFFERIN & STEE - 25.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
811	2024-09-08 13:18:51.688081+00	4538266865745202407230001	2024-07-21 - SEOUL JIMJILBANG SPA - 4.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
812	2024-09-08 13:18:51.69008+00	4538266865745202407220015	2024-07-21 - Amazon.ca*RJ7G51G70 - 99.12	2	[{"changed": {"fields": ["Category"]}}]	7	1
813	2024-09-08 13:18:51.692091+00	4538266865745202407220004	2024-07-20 - CENTREVILLE - 6.00	2	[{"changed": {"fields": ["Category"]}}]	7	1
814	2024-09-08 13:18:51.694114+00	4538266865745202407190004	2024-07-19 - IMMITRANSLATE - 98.45	2	[{"changed": {"fields": ["Category"]}}]	7	1
815	2024-09-08 13:18:51.696087+00	4538266865745202407160005	2024-07-15 - Amazon.ca*RY6QS5YY2 - 32.74	2	[{"changed": {"fields": ["Category"]}}]	7	1
816	2024-09-08 13:18:51.698146+00	4538266865745202407160004	2024-07-15 - DODONER - 16.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
817	2024-09-08 13:18:51.700222+00	4538266865745202407150018	2024-07-14 - BIKE SHARE TORONTO PARKIN - 32.05	2	[{"changed": {"fields": ["Category"]}}]	7	1
818	2024-09-08 13:18:51.702262+00	4538266865745202407150017	2024-07-14 - BOKU DISTILLERY - 19.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
820	2024-09-08 13:18:51.70621+00	384250749722809	2024-09-06 - MERPAGO*TAURUSFORMEN - 35.33	2	[{"changed": {"fields": ["Category"]}}]	7	1
821	2024-09-08 13:18:51.70818+00	304248839945523	2024-09-04 - DLO*UBER*RIDES - 5.44	2	[{"changed": {"fields": ["Category"]}}]	7	1
822	2024-09-08 13:19:57.72486+00	4538266865745202407160004	2024-07-15 - DODONER - 16.93	2	[{"changed": {"fields": ["Category"]}}]	7	1
823	2024-09-08 13:20:14.068182+00	Scotia-Momentum-VISA-Infinite---4538266865745012-2024-07-15-DODONER-TORONTO-ON-(APPLE-PAY)--16.93	2024-07-15 - DODONER TORONTO ON (APPLE PAY) - -16.93	3		7	1
824	2024-09-08 13:44:06.406196+00	4538266865745202408090005	2024-08-08 - AIRBNB * HM3XHW9JQC - -1150.63	2	[{"changed": {"fields": ["Category"]}}]	7	1
825	2024-09-09 13:14:22.019225+00	584252789157763	2024-09-08 - EL BODEGON MANUEL BELG - 62.49	2	[{"changed": {"fields": ["Category"]}}]	7	1
826	2024-09-09 13:14:22.021403+00	584252663623287	2024-09-08 - MERPAGO*CAMINITO - 16.82	2	[{"changed": {"fields": ["Category"]}}]	7	1
827	2024-09-09 13:14:22.022994+00	584252517376349	2024-09-08 - MERPAGO*AXEL - 5.77	2	[{"changed": {"fields": ["Category"]}}]	7	1
828	2024-09-09 13:14:22.024435+00	584252502292223	2024-09-08 - MERPAGO*AXEL - 18.50	2	[{"changed": {"fields": ["Category"]}}]	7	1
829	2024-09-09 13:14:22.025951+00	384253054227620	2024-09-08 - XALAPA - 73.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
830	2024-09-09 13:14:22.027443+00	304252706733408	2024-09-08 - ENTRADASBA - 7.21	2	[{"changed": {"fields": ["Category"]}}]	7	1
831	2024-09-09 13:14:46.117952+00	4538266865745202408300004	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJA - 23.78	3		7	1
832	2024-09-09 13:14:46.120871+00	4538266865745202408260015	2024-08-24 - FUNDACION MALBA - 16.23	3		7	1
833	2024-09-09 13:14:46.122162+00	4538266865745202408160002	2024-08-14 - MERPAGO*SILVERCROSSAM1942 - 54.13	3		7	1
834	2024-09-10 23:07:16.429492+00	4538266865745202409090008	2024-09-06 - MERPAGO*TAURUSFORMEN 1942 - -35.33	2	[{"changed": {"fields": ["Category"]}}]	7	1
835	2024-09-10 23:07:16.434422+00	4538266865745202409090004	2024-09-05 - MERPAGO*SOCIALSUSHI  1942 - -32.02	2	[{"changed": {"fields": ["Category"]}}]	7	1
836	2024-09-10 23:07:16.435896+00	4538266865745202409090007	2024-09-06 - MERPAGO*FERRETERIASER1942 - -5.88	2	[{"changed": {"fields": ["Category"]}}]	7	1
837	2024-09-10 23:07:16.437401+00	4535097128673202408190002	2024-08-19 - INTEREST CHARGES-PURCHASE - 0.34	2	[{"changed": {"fields": ["Category"]}}]	7	1
838	2024-09-11 02:37:52.713567+00	4538266865745202408260015	2024-08-24 - FUNDACION MALBA - 16.23	3		7	1
839	2024-09-11 02:37:52.716428+00	4538266865745202408300004	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJA - 23.78	3		7	1
840	2024-09-11 02:37:52.717664+00	4538266865745202408160002	2024-08-14 - MERPAGO*SILVERCROSSAM1942 - 54.13	3		7	1
841	2024-09-11 02:39:53.681246+00	584255086130813	2024-09-10 - MERPAGO*UNI - -74.28	2	[{"changed": {"fields": ["Category"]}}]	7	1
842	2024-09-11 02:39:53.683213+00	4538266865745202408160002	2024-08-14 - MERPAGO*SILVERCROSSAM1942 - -54.13	2	[{"changed": {"fields": ["Category"]}}]	7	1
843	2024-09-11 02:39:53.684545+00	4538266865745202408300004	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJA - -23.78	2	[{"changed": {"fields": ["Category"]}}]	7	1
844	2024-09-11 02:39:53.68587+00	4538266865745202408260015	2024-08-24 - FUNDACION MALBA - -16.23	2	[{"changed": {"fields": ["Category"]}}]	7	1
845	2024-09-11 02:39:53.687265+00	464254850098109	2024-09-10 - DRIVING NORTE - -12.07	2	[{"changed": {"fields": ["Category"]}}]	7	1
846	2024-09-11 02:39:53.688729+00	304254852530965	2024-09-10 - DRIVING NORTE - -4.83	2	[{"changed": {"fields": ["Category"]}}]	7	1
847	2024-09-11 02:43:43.742401+00	Transfer Between Accounts	Transfer Between Accounts	2	[{"changed": {"fields": ["Visible"]}}]	8	1
848	2024-09-11 02:43:53.743427+00	Credit Card Payment	Credit Card Payment	2	[{"changed": {"fields": ["Visible"]}}]	8	1
849	2024-09-11 02:51:35.449268+00	Phone	Phone	2	[{"changed": {"fields": ["Budget"]}}]	8	1
850	2024-09-11 02:52:27.140907+00	464251655574089	2024-09-07 - DON BENITO HOLLYWOOD - -144.15	2	[{"changed": {"fields": ["Category"]}}]	7	1
851	2024-09-11 13:20:19.344025+00	584252517376349	2024-09-08 - MERPAGO*AXEL - 5.77	3		7	1
852	2024-09-11 13:20:19.347482+00	584252663623287	2024-09-08 - MERPAGO*CAMINITO - 16.82	3		7	1
853	2024-09-11 13:20:19.34877+00	584252502292223	2024-09-08 - MERPAGO*AXEL - 18.50	3		7	1
854	2024-09-11 13:20:19.350097+00	4538266865745202407190005	2024-07-18 - WECOOK - 23.19	3		7	1
855	2024-09-11 13:20:19.351836+00	584252789157763	2024-09-08 - EL BODEGON MANUEL BELG - 62.49	3		7	1
856	2024-09-11 13:20:19.35317+00	384253054227620	2024-09-08 - XALAPA - 73.28	3		7	1
857	2024-09-11 13:20:19.354568+00	4538266865745202407170002	2024-07-16 - WECOOK - 99.69	3		7	1
858	2024-09-11 13:23:46.450224+00	4538266865745202407190005	2024-07-18 - WECOOK - 23.19	2	[{"changed": {"fields": ["Category"]}}]	7	1
859	2024-09-11 13:23:46.45235+00	4538266865745202407170002	2024-07-16 - WECOOK - 99.69	2	[{"changed": {"fields": ["Category"]}}]	7	1
860	2024-09-11 13:54:54.249234+00	584252663623287	2024-09-08 - MERPAGO*CAMINITO - -16.82	3		7	1
861	2024-09-11 13:54:54.252762+00	584252517376349	2024-09-08 - MERPAGO*AXEL - -5.77	3		7	1
862	2024-09-11 13:54:54.254109+00	584252502292223	2024-09-08 - MERPAGO*AXEL - -18.50	3		7	1
863	2024-09-11 13:54:54.255322+00	4538266865745202409100011     	2024-09-09 - PAYU*AR*UBER         9429 - -17.87	3		7	1
864	2024-09-11 13:54:54.256607+00	4538266865745202409100010	2024-09-08 - XALAPA               2279 - -73.28	3		7	1
865	2024-09-11 13:54:54.257911+00	4538266865745202409100009	2024-09-08 - EL BODEGON MANUEL BEL9540 - -62.49	3		7	1
866	2024-09-11 13:54:54.259155+00	4538266865745202409100007	2024-09-08 - ENTRADASBA           4723 - -7.21	3		7	1
867	2024-09-11 13:54:54.260324+00	4538266865745202409100005     	2024-09-07 - PAYU*AR*UBER         9429 - -6.46	3		7	1
868	2024-09-11 13:54:54.261507+00	4538266865745202409100004     	2024-09-07 - PAYU*AR*UBER         9429 - -5.70	3		7	1
869	2024-09-11 13:54:54.26265+00	4538266865745202409100003     	2024-09-07 - PAYU*AR*UBER         9429 - -3.12	3		7	1
870	2024-09-11 13:54:54.263849+00	4538266865745202409100002     	2024-09-04 - LA MAQUINITA CO      5304 - -63.44	3		7	1
871	2024-09-11 13:54:54.2655+00	4538266865745202409100001     	2024-09-04 - DLO*UBER*RIDES       2335 - -5.44	3		7	1
872	2024-09-11 13:54:54.2668+00	4538266865745202409100001	2024-09-04 - DLO*UBER*RIDES       2335 - -5.44	3		7	1
873	2024-09-11 13:54:54.26799+00	4538266865745202409090011     	2024-09-09 -           FROM - *****06*6621 - 705.67	3		7	1
874	2024-09-11 13:54:54.269206+00	4538266865745202409090009     	2024-09-07 - DON BENITO HOLLYWOOD - -144.15	3		7	1
875	2024-09-11 13:54:54.270431+00	4538266865745202409090008     	2024-09-06 - MERPAGO*TAURUSFORMEN 1942 - -35.33	3		7	1
876	2024-09-11 13:54:54.271657+00	4538266865745202409090007     	2024-09-06 - MERPAGO*FERRETERIASER1942 - -5.88	3		7	1
877	2024-09-11 13:54:54.272908+00	4538266865745202409090006     	2024-09-06 - PAYU*AR*UBER         9429 - -5.41	3		7	1
878	2024-09-11 13:54:54.274149+00	4538266865745202409090005     	2024-09-06 - PAYU*AR*UBER         9429 - -4.87	3		7	1
879	2024-09-11 13:54:54.275904+00	4538266865745202409090004     	2024-09-05 - MERPAGO*SOCIALSUSHI  1942 - -32.02	3		7	1
880	2024-09-11 13:54:54.277112+00	4538266865745202409090002     	2024-09-05 - PAYU*AR*UBER         9429 - -3.09	3		7	1
881	2024-09-11 13:54:54.278371+00	4538266865745202409090001     	2024-09-04 - PAYU*AR*UBER         9429 - -2.98	3		7	1
882	2024-09-11 13:54:54.279598+00	4538266865745202409030036     	2024-09-03 -           FROM - *****06*6621 - 1322.00	3		7	1
883	2024-09-11 13:54:54.280905+00	4538266865745202408300005     	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJA - -23.78	3		7	1
884	2024-09-11 13:54:54.282117+00	4538266865745202408300004     	2024-08-29 - MERPAGO*SALOMONCHIRAZIYJA - -23.78	3		7	1
885	2024-09-11 13:54:54.283325+00	4538266865745202408260015     	2024-08-24 - FUNDACION MALBA - -16.23	3		7	1
886	2024-09-11 13:54:54.284558+00	4538266865745202408260014     	2024-08-24 - MERPAGO*BIUTIFULGAL  1942 - -16.23	3		7	1
887	2024-09-11 13:54:54.286137+00	4538266865745202408200007     	2024-08-20 -           FROM - *****06*6621 - 835.52	3		7	1
888	2024-09-11 13:54:54.287383+00	4538266865745202408190012     	2024-08-17 -           FROM - *****06*6621 - 448.26	3		7	1
889	2024-09-11 13:54:54.288607+00	4538266865745202408160002     	2024-08-14 - MERPAGO*SILVERCROSSAM1942 - -54.13	3		7	1
890	2024-09-11 13:54:54.289909+00	4538266865745202408160001     	2024-08-14 - MERPAGO*SILVERCROSSAM1942 - -54.13	3		7	1
891	2024-09-11 13:54:54.29115+00	4538266865745202408120009     	2024-08-12 - IMMIGRATION CANADA       OTTAWA       ON PLAN FEE/RATE 1 OF 12 PAYMENTS - 0.00	3		7	1
892	2024-09-11 13:54:54.292364+00	4538266865745202408120007     	2024-08-12 - AMZN Mktp CA*RS7CO7A80   WWW.AMAZON.CAON PLAN FEE/RATE 1 OF 12 PAYMENTS - 0.00	3		7	1
893	2024-09-11 13:54:54.293585+00	4538266865745202408120003     	2024-08-12 - GOOGLE *Google One       g.co/helppay#NS PLAN FEE/RATE 1 OF 6 PAYMENTS - 0.00	3		7	1
894	2024-09-11 13:54:54.2951+00	4538266865745202408080004     	2024-08-08 -           FROM - *****06*6621 - 850.00	3		7	1
895	2024-09-11 13:54:54.29631+00	4538266865745202408060007     	2024-08-06 -           FROM - *****06*6621 - 1076.52	3		7	1
896	2024-09-11 13:54:54.297526+00	4538266865745202408020006     	2024-08-02 -           FROM - *****06*6621 - 1000.00	3		7	1
897	2024-09-11 13:54:54.298756+00	4538266865745202407250005     	2024-07-25 -           FROM - *****06*6621 - 493.81	3		7	1
898	2024-09-11 13:54:54.300014+00	4538266865745202407240001     	2024-07-24 - IMMIGRATION CANADA       OTTAWA       ON INSTALLMENT ENROLLMENT - 1205.00	3		7	1
899	2024-09-11 13:54:54.301248+00	4538266865745202407230005     	2024-07-23 -           FROM - *****06*6621 - 100.00	3		7	1
900	2024-09-11 13:54:54.302497+00	4538266865745202407220017     	2024-07-22 -           FROM - *****06*6621 - 500.00	3		7	1
901	2024-09-11 13:54:54.305828+00	4538266865745202407220016     	2024-07-20 -           FROM - *****06*6621 - 729.52	3		7	1
902	2024-09-11 13:54:54.30759+00	4538266865745202407190002     	2024-07-19 - AMZN Mktp CA*RS7CO7A80   WWW.AMAZON.CAON INSTALLMENT ENROLLMENT - 197.85	3		7	1
903	2024-09-11 13:54:54.308852+00	4538266865745202407190001     	2024-07-19 - GOOGLE *Google One       g.co/helppay#NS INSTALLMENT ENROLLMENT - 158.19	3		7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	transactions	transaction
8	transactions	category
9	transactions	association
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-06-07 12:38:04.044217+00
2	auth	0001_initial	2024-06-07 12:38:04.103147+00
3	admin	0001_initial	2024-06-07 12:38:04.121138+00
4	admin	0002_logentry_remove_auto_add	2024-06-07 12:38:04.128141+00
5	admin	0003_logentry_add_action_flag_choices	2024-06-07 12:38:04.13561+00
6	contenttypes	0002_remove_content_type_name	2024-06-07 12:38:04.151859+00
7	auth	0002_alter_permission_name_max_length	2024-06-07 12:38:04.159402+00
8	auth	0003_alter_user_email_max_length	2024-06-07 12:38:04.166881+00
9	auth	0004_alter_user_username_opts	2024-06-07 12:38:04.173698+00
10	auth	0005_alter_user_last_login_null	2024-06-07 12:38:04.181304+00
11	auth	0006_require_contenttypes_0002	2024-06-07 12:38:04.182576+00
12	auth	0007_alter_validators_add_error_messages	2024-06-07 12:38:04.189696+00
13	auth	0008_alter_user_username_max_length	2024-06-07 12:38:04.2+00
14	auth	0009_alter_user_last_name_max_length	2024-06-07 12:38:04.208387+00
15	auth	0010_alter_group_name_max_length	2024-06-07 12:38:04.222339+00
16	auth	0011_update_proxy_permissions	2024-06-07 12:38:04.231288+00
17	auth	0012_alter_user_first_name_max_length	2024-06-07 12:38:04.239485+00
18	sessions	0001_initial	2024-06-07 12:38:04.249481+00
19	transactions	0001_initial	2024-06-07 12:38:04.257456+00
20	transactions	0002_alter_transaction_id	2024-06-07 12:38:04.260905+00
21	transactions	0003_transaction_category	2024-06-07 12:38:04.263485+00
22	transactions	0004_alter_transaction_date	2024-06-07 12:38:04.270953+00
23	transactions	0005_category_alter_transaction_category	2024-06-07 12:38:04.283922+00
24	transactions	0006_association	2024-06-07 16:07:13.041986+00
25	transactions	0007_category_budget	2024-06-07 19:50:56.437766+00
26	transactions	0008_alter_category_budget	2024-06-08 11:13:49.787432+00
27	transactions	0009_alter_category_options_category_id	2024-07-13 16:56:19.873793+00
28	transactions	0009_alter_category_options_alter_association_id	2024-07-13 17:08:59.351857+00
29	transactions	0010_category_visible	2024-09-11 02:43:07.082731+00
30	transactions	0011_transaction_metadata	2024-09-11 13:43:56.329854+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
vavs9q8r2v8pdsdeadcgiwccymoe5mdh	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sFYtG:2aTb-gWA8h_hWcwis_tDkjkVo3gRAcvQtgyjlPejVvA	2024-06-21 12:40:18.560537+00
cmp7fpsm7dau5ozpfn83tcuw3pwwjm0u	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sFd4R:25n5XrC7tPS1As4NRBxjSdwC50yKaozg5jE5llsj-hA	2024-06-21 17:08:07.759522+00
jko1nk7oh21e4as2ja1xf76mfwe0ig5h	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sFgKx:fuFeHS_KGmT9flAut5-Q4UFpT26tPbazNp_nvXPXYl8	2024-06-21 20:37:23.160967+00
udrd96xlmfqn6357u0bhl63acksfiudp	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sKiuH:R72odOWGAw47Ike4EsObShGK87-heUCaNJWMmSvTDbA	2024-07-05 18:22:41.467621+00
onk7j1smdo5a9a8no22fuzedkrpciqvh	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sKiuI:Tl_8cOvxa9MrssPwgzG3FVVp77c1fvFYe0XxbM1gAPA	2024-07-05 18:22:42.276151+00
x4ly0wsa5npqlmbr9db8ar5kw6162wdd	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sPW7M:GGczblA94mBCTp-qVSCJleN9Mo26RrSZur1YUB97ycE	2024-07-18 23:44:00.814212+00
ablvzf947w51kco5tfqn2hc9yoeew0ij	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sQ5HC:ML2aVfxhpWI5L9H8Py30m27rH48tMngN3OHAckRCE68	2024-07-20 13:16:30.96087+00
445vk085afq3cdq0zkcahtgslwaoex6v	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sSfTy:5CX8YBNk89JDCQGMWg_VhM68eEDIzp8DRvxlEA0tw6Q	2024-07-27 16:20:22.393001+00
ccovb00c3rvz8cjg6kk7iaz0lyo9142f	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sSfTz:A_UysXKFRSKXXKf6yqZ4HrO7kw2i86zBRScZ5Bdb_qA	2024-07-27 16:20:23.02742+00
v4ylj77xc995s92sk5s9zq4ogwhrbw1d	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sZvuS:a3xXxHE2xAvFQ0DgHl2_bPuS2O9vIkcMCH_jM6xqOFE	2024-08-16 17:17:44.929869+00
mw2kz2cpu65wg31vzwsadaa83tzmnr0v	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1scTIi:oDwYcYdW29lE1wWu8pu7yMQeuEJxKw9g_mjHtE_Irj0	2024-08-23 17:21:16.280276+00
74vyozuhjyupqr0lw6eu01iuoawhc1fv	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1sf6mq:tzYKOwPUUUdvHzw3SiSq3kYWg_BUs3dsFSTGkkrO6yc	2024-08-30 23:55:16.505554+00
i6o3a51o6psclayjbwzfk5vjsf1v7ld0	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1shb6J:TIVRnk5vf3sXiOn9d5_lQG-HG7SGxLNRmuq6MTqUEQQ	2024-09-06 20:41:39.252361+00
cbcfb5lhufttkn2kqj9h1n8p20x1zo2v	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1smMnZ:d0PfD4lQM-29AZJ5MblCEZMvdsTxHc11mxtuosxjeWw	2024-09-20 00:26:01.660579+00
5p1oy3n78ypc50dgmthzljx0p1d2rv75	.eJxVjEsOAiEQBe_C2hA-zUBcuvcMpOnuyKiBZD4r492VZBa6fVX1XirjvtW8r7LkmdVZWXX63QrSQ9oAfMd265p625a56KHog6762lmel8P9O6i41lFTAm-FyRUXyBljwUsUzx6YirHsI8oEEwTgEKOLxTJ-XU6QBBnU-wPi9jfm:1so9oP:Q86B6NE0ONgnQjjEeNYQlp0xmku-YTPjr9uh4ynrZvU	2024-09-24 22:58:17.522494+00
\.


--
-- Data for Name: transactions_association; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_association (id, keyword, category_id) FROM stdin;
1	restaurant	Food
4	interest	Bank Fee
5	cafe	Food
6	kitchen	Food
7	tim hortons	Food
2	farmacia	Health
\.


--
-- Data for Name: transactions_category; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_category (name, budget, visible) FROM stdin;
Transport	500.00	t
Bill	500.00	t
Life Insurance	50.00	t
Health	100.00	t
Gift	100.00	t
Furniture	100.00	t
Entertainment	300.00	t
Education	300.00	t
Clothes	300.00	t
Air Travel	500.00	t
Misc	200.00	t
Insurance	100.00	t
Food	2250.00	t
General Care	200.00	t
Rent	1500.00	t
Cesar	400.00	t
Bank Fee	1200.00	t
Tech	300.00	t
Donation	30.00	t
Suscription	50.00	t
Shopping	1000.00	t
Transfer Between Accounts	0.00	f
Credit Card Payment	0.00	f
Phone	150.00	t
\.


--
-- Data for Name: transactions_transaction; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_transaction (id, date, description, amount, category_id, metadata) FROM stdin;
4538266865745202408010005	2024-08-01	Amazon.ca	55.46	Shopping	\N
4538266865745202409050003	2024-09-04	IMMIGRATION CANADA	100.00	Cesar	\N
304252557037403	2024-09-08	Wise Payments Canada Inc.	560.26	Transfer Between Accounts	\N
4538266865745202409090003	2024-09-05	PAYU*AR*UBER         9429	-5.79	Transport	\N
4538266865745202409090010	2024-09-08	Wise Payments Canada Inc.	-560.26	Transfer Between Accounts	\N
464252788067638	2024-09-08	PAYU*AR*UBER	9.35	Transport	\N
4538266865745202409090001	2024-09-04	PAYU*AR*UBER         9429	-2.98	Transport	\N
464252827481778	2024-09-08	PAYU*AR*UBER	0.93	Transport	\N
4538266865745202409090004	2024-09-05	MERPAGO*SOCIALSUSHI  1942	-32.02	Food	\N
4538266865745202409090002	2024-09-05	PAYU*AR*UBER         9429	-3.09	Transport	\N
4538266865745202409090008	2024-09-06	MERPAGO*TAURUSFORMEN 1942	-35.33	Health	\N
4538266865745202409090007	2024-09-06	MERPAGO*FERRETERIASER1942	-5.88	Misc	\N
4538266865745202409090006	2024-09-06	PAYU*AR*UBER         9429	-5.41	Transport	\N
4538266865745202409090005	2024-09-06	PAYU*AR*UBER         9429	-4.87	Transport	\N
4538266865745202409090009	2024-09-07	DON BENITO HOLLYWOOD	-144.15	Food	\N
304252706733408	2024-09-08	ENTRADASBA	7.21	Entertainment	\N
304254565798425	2024-09-10	PAYU*AR*UBER	-6.61	Transport	{"id": "304254565798425", "key": "heaJi3Oq7s3HkN-uDvtcLj2q09NZfN1ho-tPLcqSvYE=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "PAYU*AR*UBER", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "4121", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "PAYU*AR*UBER", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "304254565798425", "originalAmount": {"amount": 6.61, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "heaJi3Oq7s3HkN-uDvtcLj2q09NZfN1ho-tPLcqSvYE=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T11:42:59", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 6.61, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
ScotiaLine-Line-of-Credit---4537388883602016-2024-06-04-FROM---*****06*6621-618.54	2024-06-04	FROM - *****06*6621	-618.54	Credit Card Payment	\N
4538266865745202408120003	2024-08-12	GOOGLE *Google One       g.co/helppay#NS PLAN FEE/RATE 1 OF 6 PAYMENTS	0.00	Tech	\N
ScotiaLine-Line-of-Credit---4537388883602016-2024-05-22-SCOTIABANK-TRANSIT-21212-TORONTO-ON-561.37	2024-05-22	SCOTIABANK TRANSIT 21212 TORONTO ON	-561.37	Credit Card Payment	\N
4538266865745202409030015	2024-08-31	PAYU*AR*UBER         9429	-6.15	Transport	\N
4538266865745202408160002	2024-08-14	MERPAGO*SILVERCROSSAM1942	-54.13	Food	\N
4538266865745202408300004	2024-08-29	MERPAGO*SALOMONCHIRAZIYJA	-23.78	Food	\N
464254850098109	2024-09-10	DRIVING NORTE	-12.07	Entertainment	{"id": "464254850098109", "key": "NNyu1GoFDb9nLav6UaqrekOldJYSNNbgCBY4-4uPd6M=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "DRIVING NORTE", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "7999", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "DRIVING NORTE", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "464254850098109", "originalAmount": {"amount": 12.07, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "NNyu1GoFDb9nLav6UaqrekOldJYSNNbgCBY4-4uPd6M=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T19:36:49", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 12.07, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
4538266865745202407170002	2024-07-16	WECOOK	99.69	Food	\N
4535097128673202408190001	2024-08-19	INTEREST CHARGES-CASH	1.13	Bank Fee	\N
4535097128673202408020001	2024-08-02	FROM - *****06*6621	40.00	Credit Card Payment	\N
4535097128673202408190002	2024-08-19	INTEREST CHARGES-PURCHASE	0.34	Bank Fee	\N
4538266865745202407190005	2024-07-18	WECOOK	23.19	Food	\N
4538266865745202407220011	2024-07-21	WANGS VARIETY	-11.70	Food	\N
4538266865745202408050010	2024-08-03	AFFIRM CANADA	-21.19	Shopping	\N
4538266865745202409100008	2024-09-08	PAYU*AR*UBER         9429	-9.35	Transport	\N
4538266865745202409100006	2024-09-08	PAYU*AR*UBER         9429	-0.93	Transport	\N
4538266865745202409100002	2024-09-04	LA MAQUINITA CO      5304	-63.44	Tech	\N
4538266865745202409100005	2024-09-07	PAYU*AR*UBER         9429	-6.46	Transport	\N
4538266865745202409100004	2024-09-07	PAYU*AR*UBER         9429	-5.70	Transport	\N
4538266865745202409100003	2024-09-07	PAYU*AR*UBER         9429	-3.12	Transport	\N
4538266865745202409100011	2024-09-09	PAYU*AR*UBER         9429	-17.87	Transport	\N
584253547872340	2024-09-09	PAYU*AR*UBER	-15.96	Transport	\N
4538266865745202408020004	2024-08-01	PADDLE.NET* SETAPP	-20.05	Bill	\N
4538266865745202408050016	2024-08-04	SUSHIPOP IZAKAYA	-36.41	Food	\N
4538266865745202408070007	2024-08-06	LA ESTANCIA ASADOR CRI	-36.68	Food	\N
4538266865745202408190009	2024-08-17	PARRILLA LA ESCONDIDA6432	-37.11	Food	\N
ScotiaLine-for-Students---4538220851237-2024-06-17-SCOTIABANK-TRANSIT-21212-TORONTO-ON-164.48	2024-06-17	SCOTIABANK TRANSIT 21212 TORONTO ON	-164.48	Credit Card Payment	\N
4538266865745202407150015	2024-07-14	UBER CANADA/UBERTRIP	-17.27	Transport	\N
ScotiaLine-for-Students---4538220851237-2024-07-19-SCOTIABANK-TRANSIT-21212-TORONTO-ON-164.48	2024-07-19	SCOTIABANK TRANSIT 21212 TORONTO ON	-164.48	Credit Card Payment	\N
4538266865745202408060007	2024-08-06	FROM - *****06*6621	-1076.52	Credit Card Payment	\N
4538266865745202408050012	2024-08-03	UBER *TRIP HELP.UBER.COM	-23.53	Transport	\N
ScotiaLine-for-Students---4538220851237-2024-05-17-SCOTIABANK-TRANSIT-21212-TORONTO-ON-164.48	2024-05-17	SCOTIABANK TRANSIT 21212 TORONTO ON	-164.48	Credit Card Payment	\N
4538266865745202407160002	2024-07-14	THE BEER HALL	-18.34	Entertainment	\N
4538266865745202408190006	2024-08-16	KLARNA* AIRBNB	-143.64	Rent	\N
4538266865745202408260002	2024-08-22	PAYU*AR*UBER         9429	-3.49	Transport	\N
4538266865745202408270004	2024-08-24	PAYU*AR*UBER         9429	-4.97	Transport	\N
4538266865745202408070005	2024-08-06	PAYU*AR*UBER         9429	-3.12	Transport	\N
4538266865745202409030018	2024-08-31	AFFIRM CANADA	-21.18	Shopping	\N
4538266865745202408130007	2024-08-11	PAYU*AR*UBER         9429	-4.56	Transport	\N
4538266865745202408260008	2024-08-23	CHS BURGER           8679	-28.97	Food	\N
4538266865745202408270006	2024-08-25	PAYU*AR*UBER         9429	-2.88	Transport	\N
4538266865745202408150004	2024-08-14	LA GRAN FLAUTA	-5.18	Food	\N
4538266865745202408190008	2024-08-17	SUSHIPOP IZAKAYA	-34.09	Food	\N
4538266865745202408120017	2024-08-10	PAYU*AR*UBER         9429	-4.38	Transport	\N
4538266865745202408120005	2024-08-12	LA BARBERIA LOUNGE Y S   1100100 BOGOT PLAN FEE/RATE 2 OF 12 PAYMENTS	-2.54	Food	\N
4538266865745202408260006	2024-08-23	MERPAGO*FARMALIV     1942	-11.10	Health	\N
4538266865745202407240005	2024-07-23	CAMH - PHARMACY	-187.60	Health	\N
4538266865745202407250003	2024-07-24	DEAR SAIGON	-11.05	Transport	\N
4538266865745202408020001	2024-07-31	INVERSIONES XCALOTTE S	-31.44	Food	\N
4538266865745202408090004	2024-08-08	PAYU*AR*UBER         9429	-5.06	Transport	\N
4538266865745202408120012	2024-08-08	IL VOLO              5915	-4.47	Food	\N
4538266865745202408130004	2024-08-10	PAYU*AR*UBER         9429	-4.26	Transport	\N
4538266865745202408120006	2024-08-12	AMZN Mktp CA*RS7CO7A80   WWW.AMAZON.CAON INSTALLMENT 1 OF 12 PAYMENTS	-17.21	Shopping	\N
4538266865745202408190002	2024-08-16	PAYU*AR*UBER         9429	-5.71	Transport	\N
4538266865745202408260021	2024-08-25	FARMACIA ALFA        7989	-9.62	Misc	\N
4538266865745202409030007	2024-08-30	PAYU*AR*UBER         9429	-5.06	Transport	\N
4538266865745202409030023	2024-09-01	PAYU*AR*UBER         9429	-8.08	Transport	\N
4538266865745202407240004	2024-07-23	MONOPOL CAFE	-44.45	Food	\N
4538266865745202407250002	2024-07-24	TIM HORTONS #5840	-3.77	Food	\N
4538266865745202407160003	2024-07-15	UBER CANADA/UBERTRIP	-12.49	Transport	\N
4538266865745202409030036	2024-09-03	FROM - *****06*6621	-1322.00	Credit Card Payment	\N
4538266865745202407310003	2024-07-31	UBER *TRIP HELP.UBER.COM	-3.54	Transport	\N
4538266865745202408050009	2024-08-03	2006 SA	-10.81	Food	\N
4538266865745202408120015	2024-08-09	SUSHIPOP IZAKAYA	-28.83	Food	\N
4538266865745202407160009	2024-07-16	FROM - *****06*6621	-583.03	Credit Card Payment	\N
4538266865745202408200002	2024-08-17	PAYU*AR*UBER         9429	-4.15	Transport	\N
4538266865745202408210003	2024-08-20	MERPAGO*LOSBRAVOS	-11.80	Misc	\N
4538266865745202408080004	2024-08-08	FROM - *****06*6621	-850.00	Credit Card Payment	\N
4538266865745202408260020	2024-08-24	FREEDOM MOBILE	-124.38	Phone	\N
4538266865745202408270002	2024-08-24	PAYU*AR*UBER         9429	-4.74	Transport	\N
4538266865745202408300003	2024-08-29	MERPAGO*CCKONEX	-12.64	Food	\N
4538266865745202407160005	2024-07-15	Amazon.ca*RY6QS5YY2	-32.74	Shopping	\N
4538266865745202409030005	2024-08-29	PAYU*AR*UBER         9429	-7.16	Transport	\N
4538266865745202409030032	2024-09-02	PAYBRIGHT	-10.38	Bill	\N
4538266865745202408120007	2024-08-12	AMZN Mktp CA*RS7CO7A80   WWW.AMAZON.CAON PLAN FEE/RATE 1 OF 12 PAYMENTS	0.00	Shopping	\N
4538266865745202407150012	2024-07-14	APPLE.COM/BILL	-4.51	Bill	\N
4538266865745202407240007	2024-07-24	FREEDOM MOBILE	-148.31	Phone	\N
4538266865745202407220017	2024-07-22	FROM - *****06*6621	-500.00	Credit Card Payment	\N
4538266865745202408050015	2024-08-04	MERPAGO*BOYACA       1942	-24.93	Food	\N
4538266865745202409030029	2024-09-01	TOIEM PERU	-94.05	Food	\N
ScotiaLine-Line-of-Credit---4537388883602016-2024-08-02-FROM---*****06*6621-547.14	2024-08-02	FROM - *****06*6621	-547.14	Credit Card Payment	\N
4538266865745202407290003	2024-07-27	JONES VARIETY	-25.64	Food	\N
4538266865745202408130005	2024-08-11	PAYU*AR*UBER         9429	-4.03	Transport	\N
4538266865745202408120004	2024-08-12	LA BARBERIA LOUNGE Y S   1100100 BOGOT INSTALLMENT 2 OF 12 PAYMENTS	-15.31	Food	\N
4538266865745202408220001	2024-08-20	PAYU*AR*UBER         9429	-2.72	Transport	\N
4538266865745202408260003	2024-08-22	PAYU*AR*UBER         9429	-4.15	Transport	\N
4538266865745202408260004	2024-08-23	PAYU*AR*UBER         9429	-1.64	Transport	\N
4538266865745202409040004	2024-09-02	OLYMPO               3667	-83.12	Food	\N
ScotiaLine-Line-of-Credit---4537388883602016-2024-07-15-FROM---*****06*6621-532.44	2024-07-15	FROM - *****06*6621	-532.44	Credit Card Payment	\N
4538266865745202407310005	2024-07-31	UBER *TRIP HELP.UBER.COM	-13.48	Transport	\N
4538266865745202407310004	2024-07-31	UBER *TRIP HELP.UBER.COM	-3.68	Transport	\N
4538266865745202408050005	2024-08-02	PAYBRIGHT	-70.79	Bill	\N
4538266865745202408070002	2024-08-05	PAYU*AR*UBER         9429	-4.43	Transport	\N
4538266865745202408120018	2024-08-10	MERPAGO*BOYACA       1942	-25.63	Food	\N
4538266865745202408120019	2024-08-11	MERPAGO*ELOCTAVO     1942	-11.54	Food	\N
4538266865745202408230002	2024-08-21	PAYU*AR*UBER         9429	-2.99	Transport	\N
4538266865745202409040007	2024-09-03	SUN LIFE CHOICES A&A	-40.48	Life Insurance	\N
4538266865745202408190012	2024-08-17	FROM - *****06*6621	-448.26	Credit Card Payment	\N
4538266865745202408120009	2024-08-12	IMMIGRATION CANADA       OTTAWA       ON PLAN FEE/RATE 1 OF 12 PAYMENTS	0.00	Cesar	\N
384249102805198	2024-09-04	PAYU*AR*UBER	-5.79	Transport	\N
4538266865745202407220003	2024-07-19	Klarna airbnb	-173.80	Rent	\N
4538266865745202407260003	2024-07-25	BELL CANADA (OB)	-56.44	Bill	\N
4538266865745202407150013	2024-07-14	YUMMY RIDES	-5.18	Transport	\N
4538266865745202407160006	2024-07-15	AMZN Mktp CA*RY9005Y52	-51.97	Shopping	\N
4538266865745202408050007	2024-08-03	CIGARRERIA DIANA	-3.33	Food	\N
4538266865745202408060005	2024-08-05	APPLE.COM/BILL	-15.24	Bill	\N
4538266865745202408090002	2024-08-07	MERPAGO*CAFEMARTINEZ 1942	-13.92	Food	\N
4538266865745202408120001	2024-08-12	INTEREST CHARGES-PURCHASE	-125.61	Bank Fee	\N
4538266865745202408130011	2024-08-12	MERPAGO*FARMALIV     1942	-18.64	Health	\N
4538266865745202408230004	2024-08-23	Wise Payments Canada Inc.	-30.81	Transfer Between Accounts	\N
4538266865745202407220012	2024-07-21	PRESTO AUTO/55N23DPRGH	-20.00	Transport	\N
4538266865745202408050004	2024-08-02	UNONET S.A.	-58.66	Food	\N
4538266865745202408050008	2024-08-03	PERSONAL FLOW        3442	-5.69	Phone	\N
4538266865745202408130003	2024-08-10	PAYU*AR*UBER         9429	-4.03	Transport	\N
4538266865745202408260019	2024-08-24	MERPAGO*CAFEMARTINEZ 1942	-29.90	Food	\N
4538266865745202408260023	2024-08-25	SUSHIPOP IZAKAYA	-34.17	Food	\N
4538266865745202408270009	2024-08-25	MERPAGO*CAFEMARTINEZ 1942	-14.25	Food	\N
4538266865745202409030004	2024-08-29	PAYU*AR*UBER         9429	-6.11	Transport	\N
4538266865745202409030016	2024-08-31	PAYU*AR*UBER         9429	-7.41	Transport	\N
4538266865745202409030030	2024-09-02	DOWNTOWN NOTARY	-5.65	Misc	\N
4538266865745202409030020	2024-09-01	PAYU*AR*UBER         9429	-2.98	Transport	\N
4538266865745202407190003	2024-07-18	FACTOR MEALS	-71.95	Food	\N
4538266865745202409030031	2024-09-02	UNONET S.A.	-9.97	Food	\N
4538266865745202407220008	2024-07-20	Amazon.ca	-55.46	Shopping	\N
4538266865745202408260014	2024-08-24	MERPAGO*BIUTIFULGAL  1942	-16.23	Food	\N
4538266865745202407150019	2024-07-14	GOOGLE *Google One	-158.19	Tech	\N
4538266865745202407150016	2024-07-14	RUNAWAY CAFE	-19.28	Food	\N
4538266865745202407240001	2024-07-24	IMMIGRATION CANADA       OTTAWA       ON INSTALLMENT ENROLLMENT	-1205.00	Cesar	\N
4538266865745202407220006	2024-07-20	SQ *TORONTO HARBOUR WATER	-15.52	Food	\N
4538266865745202407190002	2024-07-19	AMZN Mktp CA*RS7CO7A80   WWW.AMAZON.CAON INSTALLMENT ENROLLMENT	-197.85	Shopping	\N
4538266865745202407220005	2024-07-20	TIM HORTONS #6591	-8.77	Food	\N
4538266865745202407240006	2024-07-23	CAMH - PHARMACY	-187.61	Health	\N
4538266865745202407310002	2024-07-30	AIRALO	-11.50	Phone	\N
4538266865745202408010003	2024-07-31	FETTA PANINI BAR	-31.98	Food	\N
4538266865745202408020002	2024-08-01	NETFLIX.COM	-8.51	Entertainment	\N
4538266865745202408050006	2024-08-02	KLARNA* AIRBNB	-173.80	Rent	\N
4538266865745202408050003	2024-08-02	SUN LIFE CHOICES A&A	-40.48	Life Insurance	\N
4538266865745202408050011	2024-08-03	KKO KNR AEROPUERTO	-22.01	Food	\N
4538266865745202408060001	2024-08-03	PAYU*AR*UBER         9429	-4.09	Transport	\N
4538266865745202408060003	2024-08-05	MERPAGO*LOSBRAVOS    1942	-0.45	Misc	\N
4538266865745202408080002	2024-08-06	PAYU*AR*UBER         9429	-5.59	Transport	\N
4538266865745202408090001	2024-08-07	MERPAGO*CAFEMARTINEZ 1942	-0.23	Food	\N
4538266865745202408090005	2024-08-08	AIRBNB * HM3XHW9JQC	-1150.63	Rent	\N
4538266865745202408120013	2024-08-09	PAYU*AR*UBER         9429	-3.11	Transport	\N
4538266865745202408130002	2024-08-10	PAYPAL *PDFAID COM	-1.95	Misc	\N
4538266865745202408130006	2024-08-11	PAYU*AR*UBER         9429	-4.14	Transport	\N
4538266865745202408120002	2024-08-12	GOOGLE *Google One       g.co/helppay#NS INSTALLMENT 1 OF 6 PAYMENTS	-26.91	Tech	\N
4538266865745202408190004	2024-08-16	BUQUEBUS-CATERING	-16.33	Transport	\N
4538266865745202408260016	2024-08-24	CASA PARADISO	-17.73	Food	\N
4538266865745202408280002	2024-08-26	PAYU*AR*UBER         9429	-3.58	Transport	\N
4538266865745202408280005	2024-08-27	Wise Payments Canada Inc.	-138.97	Transfer Between Accounts	\N
4538266865745202408280004	2024-08-27	MERPAGO*CAFEMARTINEZ 1942	-42.23	Food	\N
4538266865745202409030003	2024-08-29	PAYU*AR*UBER         9429	-3.43	Transport	\N
4538266865745202409030002	2024-08-29	PAYU*AR*UBER         9429	-3.26	Transport	\N
4538266865745202409030008	2024-08-30	PAYU*AR*UBER         9429	-6.26	Transport	\N
4538266865745202409030011	2024-08-31	PAYU*AR*UBER         9429	-0.74	Transport	\N
4538266865745202409030028	2024-09-01	MERPAGO*QUECHUAREST  1942	-57.86	Food	\N
4538266865745202409030026	2024-09-01	SPOTIFY	-19.20	Suscription	\N
4538266865745202407250001	2024-07-23	PRESTO FARE/55N68LSCWQ	-6.60	Transport	\N
4538266865745202408020006	2024-08-02	FROM - *****06*6621	-1000.00	Credit Card Payment	\N
4538266865745202407160007	2024-07-15	AMZN Mktp CA*RS4JK8O02	-73.44	Shopping	\N
4538266865745202407250004	2024-07-24	DEAR SAIGON	-19.20	Transport	\N
4538266865745202407260001	2024-07-24	PRESTO FARE/55NPCJH7HN	-3.30	Transport	\N
4538266865745202407290005	2024-07-28	JONES VARIETY	-4.03	Food	\N
4538266865745202408010001	2024-07-30	LANGUAGE EXCHANGE EVEN	-7.70	Food	\N
4538266865745202408050002	2024-08-02	PAYBRIGHT	-10.38	Bill	\N
4538266865745202408050014	2024-08-04	SUSHIPOP IZAKAYA	-22.18	Food	\N
4538266865745202408060006	2024-08-05	SPOTIFY	-16.94	Suscription	\N
4538266865745202408070003	2024-08-05	FARMACITY 201 LOS ARC5693	-4.48	Health	\N
4538266865745202408140002	2024-08-13	MERPAGO*PANADONNA    1942	-8.66	Food	\N
4538266865745202408190005	2024-08-16	MERPAGO*PANADONNA    1942	-26.89	Food	\N
4538266865745202408200003	2024-08-17	PAYU*AR*UBER         9429	-4.67	Transport	\N
4538266865745202408190010	2024-08-18	MERPAGO*ELOCTAVO     1942	-12.37	Food	\N
4538266865745202408210002	2024-08-20	PAYU*AR*UBER         9429	-2.64	Transport	\N
4538266865745202408270003	2024-08-24	PAYU*AR*UBER         9429	-4.86	Transport	\N
4538266865745202408260022	2024-08-25	APPLE.COM/BILL	-28.24	Bill	\N
4538266865745202408270008	2024-08-25	FARMACIA ALFA        7989	-8.75	Misc	\N
4538266865745202408300001	2024-08-28	PAYU*AR*UBER         9429	-3.20	Transport	\N
4538266865745202409030006	2024-08-30	PAYU*AR*UBER         9429	-3.00	Transport	\N
4538266865745202409030019	2024-08-31	MC DONALDS CAN Y PARAG	-34.06	Transport	\N
4538266865745202409030010	2024-08-31	PAYU*AR*UBER         9429	-0.48	Transport	\N
4538266865745202409030027	2024-09-01	PADDLE.NET* SETAPP	-19.55	Bill	\N
4538266865745202409030021	2024-09-01	PAYU*AR*UBER         9429	-3.57	Transport	\N
4538266865745202409040001	2024-09-02	PAYU*AR*UBER         9429	-2.86	Transport	\N
4538266865745202409060003	2024-09-05	MERPAGO*ELECTROWORLDGROUP	-36.54	Cesar	\N
4538266865745202409060002	2024-09-05	APPLE.COM/BILL	-15.24	Bill	\N
4538266865745202408090003	2024-08-08	PAYU*AR*UBER         9429	-3.15	Transport	\N
4538266865745202408150003	2024-08-14	APPLE.COM/BILL	-4.51	Bill	\N
4538266865745202409030035	2024-09-02	PAYBRIGHT	-70.79	Bill	\N
4538266865745202407230004	2024-07-22	AMZN Mktp CA*RJ36O0MX2	-45.20	Shopping	\N
4538266865745202408120011	2024-08-08	PAYU*AR*UBER         9429	-2.58	Transport	\N
4538266865745202407170001	2024-07-15	PRESTO FARE/55M505JBXD	-9.90	Transport	\N
4538266865745202409030009	2024-08-30	MERPAGO*CCKONEX      1942	-20.89	Food	\N
4538266865745202409040002	2024-09-02	PAYU*AR*UBER         9429	-3.31	Transport	\N
4538266865745202409030013	2024-08-31	PAYU*AR*UBER         9429	-3.33	Transport	\N
4538266865745202408270010	2024-08-25	FARMACITY CORDOBA Y B4857	-36.80	Health	\N
4538266865745202408150002	2024-08-14	MERPAGO*LOSBRAVOS    1942	-3.53	Misc	\N
4538266865745202408020005	2024-08-01	CARULLA FRESH CALLE 10	-46.98	Food	\N
4538266865745202407240002	2024-07-23	TIM HORTONS #4970	-14.18	Food	\N
4538266865745202408280001	2024-08-26	PAYU*AR*UBER         9429	-2.87	Transport	\N
4538266865745202408130001	2024-08-10	PAYU*AR*UBER         9429	-0.21	Transport	\N
4538266865745202408050001	2024-08-02	INVERSIONES GALAXI COLOMB	-9.74	Food	\N
4538266865745202407150011	2024-07-14	YUMMY RIDES	-2.85	Transport	\N
4538266865745202408260001	2024-08-20	LA MAQUINITA CO      5304	-61.33	Food	\N
4538266865745202408230001	2024-08-21	PAYU*AR*UBER         9429	-2.87	Transport	\N
4538266865745202409040006	2024-09-03	MERPAGO*FAROLA       1942	-32.22	Food	\N
4538266865745202409030012	2024-08-31	PAYU*AR*UBER         9429	-3.10	Transport	\N
4538266865745202407290001	2024-07-26	UBER *TRIP HELP.UBER.COM	-12.98	Transport	\N
4538266865745202409030025	2024-09-01	PAYU*AR*UBER         9429	-10.10	Transport	\N
4538266865745202408290001	2024-08-27	FARMACITY CORDOBA Y B4857	-7.08	Health	\N
4538266865745202408190003	2024-08-16	PAYU*AR*UBER         9429	-6.84	Transport	\N
4538266865745202408280003	2024-08-27	MERPAGO*CAFEMARTINEZ 1942	-4.22	Food	\N
4538266865745202408190001	2024-08-16	PAYU*AR*UBER         9429	-0.34	Transport	\N
4538266865745202408190007	2024-08-17	AFFIRM CANADA	-21.19	Shopping	\N
4538266865745202408130008	2024-08-11	PAYU*AR*UBER         9429	-5.30	Transport	\N
4538266865745202409060001	2024-09-04	MERPAGO*GRANBARDANZON1942	-51.85	Food	\N
4538266865745202408260009	2024-08-23	BELL CANADA (OB)	-56.44	Bill	\N
4538266865745202408290003	2024-08-28	PAYU*AR*UBER         9429	-4.57	Transport	\N
4538266865745202408300002	2024-08-29	MERPAGO*CCKONEX	-8.51	Food	\N
4538266865745202408120008	2024-08-12	IMMIGRATION CANADA       OTTAWA       ON INSTALLMENT 1 OF 12 PAYMENTS	-104.82	Cesar	\N
4538266865745202408230003	2024-08-23	Wise Payments Canada Inc.	-5.14	Transfer Between Accounts	\N
4538266865745202407160001	2024-07-14	PRESTO FARE/55LPN2FTZS	-6.60	Transport	\N
4538266865745202409030001	2024-08-29	PAYU*AR*UBER         9429	-2.89	Transport	\N
4538266865745202408060002	2024-08-03	PAYU*AR*UBER         9429	-4.43	Transport	\N
4538266865745202409030024	2024-09-01	NETFLIX.COM	-8.29	Entertainment	\N
4538266865745202408260010	2024-08-24	CASA PARADISO	-8.46	Food	\N
4538266865745202408070004	2024-08-05	FREDDO DISTRITO ARCOS5989	-11.15	Food	\N
4538266865745202407290002	2024-07-27	OLG 1 800 387 0098	-10.00	Entertainment	\N
4538266865745202408070001	2024-08-05	PAYU*AR*UBER         9429	-3.40	Transport	\N
4538266865745202408080003	2024-08-06	PAYU*AR*UBER         9429	-7.70	Transport	\N
4538266865745202407290006	2024-07-28	UBER CANADA/UBERTRIP	-15.41	Transport	\N
4538266865745202408010002	2024-07-30	LANGUAGE EXCHANGE EVEN	-21.01	Food	\N
4538266865745202409050002	2024-09-04	PAYU*AR*UBER         9429	-2.75	Transport	\N
4538266865745202408270001	2024-08-24	PAYU*AR*UBER         9429	-4.09	Transport	\N
4538266865745202408270011	2024-08-25	MERPAGO*BOYACA       1942	-46.00	Food	\N
4538266865745202408200001	2024-08-17	PAYU*AR*UBER         9429	-3.34	Transport	\N
4538266865745202408140003	2024-08-13	MERPAGO*ELOCTAVO	-11.71	Food	\N
4538266865745202408010004	2024-07-31	CARULLA FRESH CALLE 10	-63.30	Food	\N
4538266865745202409030022	2024-09-01	PAYU*AR*UBER         9429	-6.48	Transport	\N
4538266865745202408190011	2024-08-19	Wise Payments Canada Inc.	-10.00	Transfer Between Accounts	\N
4538266865745202408080001	2024-08-06	PAYU*AR*UBER         9429	-5.33	Transport	\N
4538266865745202407220001	2024-07-18	AFFIRM CANADA	-21.19	Shopping	\N
4538266865745202407220002	2024-07-19	OH MY GYRO	-18.58	Food	\N
4538266865745202407220009	2024-07-20	IMMIGRATION CANADA	-1205.00	Cesar	\N
4538266865745202407220007	2024-07-20	THE ISLAND GREEK GRILL	-24.25	Entertainment	\N
4538266865745202407220014	2024-07-21	RUNAWAY CAFE	-46.57	Food	\N
4538266865745202407220013	2024-07-21	AMZN Mktp CA*RJ4EX0J12	-28.24	Shopping	\N
4538266865745202407220010	2024-07-21	YUMMY RIDES	-5.31	Transport	\N
4538266865745202408260007	2024-08-23	EL OCTAVO            9501	-11.57	Food	\N
4538266865745202408260012	2024-08-24	CASA PARADISO	-11.82	Food	\N
4538266865745202407160008	2024-07-15	AMZN Mktp CA*RS7CO7A80	-197.85	Shopping	\N
4538266865745202408270005	2024-08-25	MERPAGO*CAFEMARTINEZ 1942	-2.32	Food	\N
4538266865745202407190001	2024-07-19	GOOGLE *Google One       g.co/helppay#NS INSTALLMENT ENROLLMENT	-158.19	Tech	\N
4538266865745202409030014	2024-08-31	PAYU*AR*UBER         9429	-4.84	Transport	\N
4538266865745202409030034	2024-09-02	MERPAGO*BOYACA       1942	-52.33	Food	\N
4538266865745202407190004	2024-07-19	IMMITRANSLATE	-98.45	Cesar	\N
4538266865745202408290002	2024-08-27	RAPANUI	-10.08	Food	\N
4538266865745202408290004	2024-08-28	CLAUDE.AI SUBSCRIPTION	-31.64	Misc	\N
4538266865745202409030017	2024-08-31	DNH*GODADDY#3272646732	-16.85	Misc	\N
4538266865745202409030033	2024-09-02	NOTARIZE.CA	-32.19	Misc	\N
4538266865745202409040003	2024-09-02	MERPAGO*AUTOSERWILLYS1942	-20.06	Food	\N
4538266865745202409050001	2024-09-03	MERPAGO*NEMURI       1942	-80.34	Food	\N
4538266865745202409040005	2024-09-03	MERPAGO*FERRETERIASER1942	-8.25	Misc	\N
4538266865745202407220004	2024-07-20	CENTREVILLE	-6.00	Food	\N
4538266865745202407160004	2024-07-15	DODONER	-16.93	Food	\N
4538266865745202407150018	2024-07-14	BIKE SHARE TORONTO PARKIN	-32.05	Transport	\N
4538266865745202407150017	2024-07-14	BOKU DISTILLERY	-19.34	Food	\N
4538266865745202407150014	2024-07-14	PARLIAMENT SMOKE & GIFT	-6.70	Food	\N
304248839945523	2024-09-04	DLO*UBER*RIDES	-5.44	Transport	\N
4538266865745202407220015	2024-07-21	Amazon.ca*RJ7G51G70	-99.12	Shopping	\N
4538266865745202407230002	2024-07-21	FRESHII - DUFFERIN & STEE	-25.28	Food	\N
4538266865745202407230001	2024-07-21	SEOUL JIMJILBANG SPA	-4.00	Entertainment	\N
4538266865745202407230003	2024-07-22	ADVANCE CARGO SERVICES AC	-4.52	Misc	\N
4538266865745202407240003	2024-07-23	SHOPPERS DRUG MART #09	-28.95	Health	\N
4538266865745202407260002	2024-07-24	PRENUP PUB	-6.67	Food	\N
4538266865745202407290004	2024-07-27	DZO	-34.67	Food	\N
4538266865745202407310001	2024-07-29	COINAMATIC	-10.00	Misc	\N
4538266865745202408020003	2024-08-01	ROAMLESS	-14.71	Phone	\N
4538266865745202408050013	2024-08-03	CHOLO CON CHE        0092	-97.27	Food	\N
4538266865745202408060004	2024-08-05	MERPAGO*TARJETASUBE	-9.40	Transport	\N
4538266865745202408120010	2024-08-06	TAKOYAKI             6478	-16.89	Food	\N
4538266865745202408070006	2024-08-06	XCOOP ARGENTINA	-7.98	Food	\N
4538266865745202408120016	2024-08-09	DIGGS                5452	-30.36	Food	\N
4538266865745202408120014	2024-08-09	MERPAGO*CRONICOBAR   1942	-7.37	Food	\N
4538266865745202408130010	2024-08-11	MERPAGO*BODEGONBARCEL1942	-29.90	Food	\N
4538266865745202408130009	2024-08-11	TIENDAS ELTEN        3161	-10.73	Shopping	\N
4538266865745202408140001	2024-08-12	Alovata	-40.96	Food	\N
4538266865745202408150001	2024-08-13	GAVARE SRL           9302	-9.36	Food	\N
4538266865745202408200005	2024-08-18	MERPAGO*ILVEROARTURIT1942	-95.13	Food	\N
4538266865745202408200004	2024-08-18	MERPAGO*FLAVORCAFE   1942	-19.42	Food	\N
4538266865745202408210001	2024-08-19	MERPAGO*MARICAFE     1942	-30.05	Food	\N
4538266865745202408200006	2024-08-19	MERPAGO*KIOSCOMARTIN 1942	-1.38	Misc	\N
4538266865745202408260005	2024-08-23	MERPAGO*CMAVCORDOBA381942	-6.25	Food	\N
4538266865745202408260018	2024-08-24	CUSPIDE LIBROS SA    6412	-29.43	Shopping	\N
4538266865745202408260017	2024-08-24	MERPAGO*GRUPONIGBO   1942	-22.37	Food	\N
4538266865745202408260013	2024-08-24	WRANGLER	-14.20	Shopping	\N
4538266865745202408260011	2024-08-24	TIMELEFT	-11.17	Entertainment	\N
4538266865745202408270007	2024-08-25	MERPAGO*MARTIN       1942	-3.36	Food	\N
584254669176820	2024-09-10	PAYU*AR*UBER	-6.86	Transport	{"id": "584254669176820", "key": "VjTPy992nDTCxREd059Q4P51e7LgnPoC0Ijmcy7bVKY=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "PAYU*AR*UBER", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "4121", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "PAYU*AR*UBER", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "584254669176820", "originalAmount": {"amount": 6.86, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "VjTPy992nDTCxREd059Q4P51e7LgnPoC0Ijmcy7bVKY=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T14:35:17", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 6.86, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
464254794106697	2024-09-10	BARBERIA MALABIA SRL	-29.25	Food	{"id": "464254794106697", "key": "m0ti8N6qy7QqLdx4MNlM_85icq4JLC31ijwSXyT4-1A=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "BARBERIA MALABIA SRL", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "7230", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "BARBERIA MALABIA SRL", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "464254794106697", "originalAmount": {"amount": 29.25, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "m0ti8N6qy7QqLdx4MNlM_85icq4JLC31ijwSXyT4-1A=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T18:03:30", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 29.25, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
464254822857330	2024-09-10	PAYU*AR*UBER	-8.05	Transport	{"id": "464254822857330", "key": "sCl02Dkgd758oFI8MDxvKOUMBxU88_5w0r6NF-DbkkA=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "PAYU*AR*UBER", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "4121", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "PAYU*AR*UBER", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "464254822857330", "originalAmount": {"amount": 8.05, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "sCl02Dkgd758oFI8MDxvKOUMBxU88_5w0r6NF-DbkkA=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T18:51:25", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 8.05, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
304254852530965	2024-09-10	DRIVING NORTE	-4.83	Entertainment	{"id": "304254852530965", "key": "dLVS5QbvvcJL-O0GIJZS3jPmDoMlgWQQo_FVawS1gX8=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "DRIVING NORTE", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "7999", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "DRIVING NORTE", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "304254852530965", "originalAmount": {"amount": 4.83, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "dLVS5QbvvcJL-O0GIJZS3jPmDoMlgWQQo_FVawS1gX8=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T19:40:54", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 4.83, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
464255039981494	2024-09-10	PAYU*AR*UBER	-13.01	Transport	{"id": "464255039981494", "key": "W7G8W3sIrXZ6FHD_m_d9wTY3ZPE3edG88f4NXvzNJX0=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "PAYU*AR*UBER", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "4121", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "PAYU*AR*UBER", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "464255039981494", "originalAmount": {"amount": 13.01, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "W7G8W3sIrXZ6FHD_m_d9wTY3ZPE3edG88f4NXvzNJX0=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T21:06:38", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 13.01, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
584255086130813	2024-09-10	MERPAGO*UNI	-74.28	Food	{"id": "584255086130813", "key": "Kf3xP2XfF0kDBOL1BlsWzyqPz1THS2NS9itHp5hn_sU=", "type": null, "cheque": null, "isTsys": false, "status": "PENDING", "category": null, "enriched": false, "merchant": {"city": null, "name": "MERPAGO*UNI", "state": null, "address": null, "country": "AR", "website": null, "zipCode": null, "category": null, "countryCode": "AR", "categoryCode": "5462", "twitterPageUrl": null, "facebookPageUrl": null, "merchantImageRef": null, "customerServicePageUrl": null}, "tsysCode": null, "toAccount": null, "reasonCode": null, "rewardCard": null, "description": "MERPAGO*UNI", "fromAccount": null, "isDisputable": "NOT_DISPUTABLE", "mnemonicCode": null, "purchaseType": null, "userInputTag": null, "transactionId": "584255086130813", "originalAmount": {"amount": 74.28, "currencyCode": null}, "runningBalance": null, "subDescription": null, "subdescription": null, "transactionKey": "Kf3xP2XfF0kDBOL1BlsWzyqPz1THS2NS9itHp5hn_sU=", "referenceNumber": null, "rewardsCategory": null, "transactionCode": null, "transactionDate": "2024-09-10T22:23:33", "transactionType": "DEBIT", "cleanDescription": null, "descriptionLines": null, "transactionAmount": {"amount": 74.28, "currencyCode": "CAD"}, "statementIndicator": null, "purchaseCountryCode": "AR", "transactionCategory": null, "associatedCardNumber": "4538266865745012", "outOfCountryIndicator": null, "acquirerReferenceNumber": null, "recurringPaymentIndicator": ""}
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 903, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: transactions_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.transactions_association_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: transactions_association transactions_association_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_association
    ADD CONSTRAINT transactions_association_pkey PRIMARY KEY (id);


--
-- Name: transactions_category transactions_category_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_category
    ADD CONSTRAINT transactions_category_pkey PRIMARY KEY (name);


--
-- Name: transactions_transaction transactions_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_transaction
    ADD CONSTRAINT transactions_transaction_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: transactions_association_category_id_6135a09d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX transactions_association_category_id_6135a09d ON public.transactions_association USING btree (category_id);


--
-- Name: transactions_association_category_id_6135a09d_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX transactions_association_category_id_6135a09d_like ON public.transactions_association USING btree (category_id varchar_pattern_ops);


--
-- Name: transactions_category_name_9a3e912e_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX transactions_category_name_9a3e912e_like ON public.transactions_category USING btree (name varchar_pattern_ops);


--
-- Name: transactions_transaction_category_id_c06a92e3; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX transactions_transaction_category_id_c06a92e3 ON public.transactions_transaction USING btree (category_id);


--
-- Name: transactions_transaction_category_id_c06a92e3_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX transactions_transaction_category_id_c06a92e3_like ON public.transactions_transaction USING btree (category_id varchar_pattern_ops);


--
-- Name: transactions_transaction_id_2a7499fd_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX transactions_transaction_id_2a7499fd_like ON public.transactions_transaction USING btree (id varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: transactions_association transactions_associa_category_id_6135a09d_fk_transacti; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_association
    ADD CONSTRAINT transactions_associa_category_id_6135a09d_fk_transacti FOREIGN KEY (category_id) REFERENCES public.transactions_category(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: transactions_transaction transactions_transac_category_id_c06a92e3_fk_transacti; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_transaction
    ADD CONSTRAINT transactions_transac_category_id_c06a92e3_fk_transacti FOREIGN KEY (category_id) REFERENCES public.transactions_category(name) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

