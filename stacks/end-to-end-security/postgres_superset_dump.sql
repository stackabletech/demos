--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:o1uKb20JmvZX/K5xBpVVnA==$2J8w5sDbraAIugf89Kochc2Dl+hBsJEl48MTR8go7Gc=:GvE3vUl/cwfe+XqME3njxe1cCENo2uxYa/6TnJGlkvY=';
CREATE ROLE superset;
ALTER ROLE superset WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:PQ2u8jCvwwNX2Cn2GsaCOA==$UI4y2+aSvIoubxGiS4MxxZ49xKYsgayMI/hQEDjKfeQ=:PzbSbLt9LGlIV7cXLxuM2eyYCfnt6xJSNQB01tNiTw4=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- PostgreSQL database dump complete
--

--
-- Database "superset" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: superset; Type: DATABASE; Schema: -; Owner: superset
--

CREATE DATABASE superset WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE superset OWNER TO superset;

\connect superset

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: superset
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO superset;

--
-- Name: emaildeliverytype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.emaildeliverytype AS ENUM (
    'attachment',
    'inline'
);


ALTER TYPE public.emaildeliverytype OWNER TO superset;

--
-- Name: objecttype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.objecttype AS ENUM (
    'query',
    'chart',
    'dashboard',
    'dataset'
);


ALTER TYPE public.objecttype OWNER TO superset;

--
-- Name: sliceemailreportformat; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.sliceemailreportformat AS ENUM (
    'visualization',
    'data'
);


ALTER TYPE public.sliceemailreportformat OWNER TO superset;

--
-- Name: tagtype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.tagtype AS ENUM (
    'custom',
    'type',
    'owner',
    'favorited_by'
);


ALTER TYPE public.tagtype OWNER TO superset;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO superset;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_permission_id_seq OWNER TO superset;

--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO superset;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_permission_view_id_seq OWNER TO superset;

--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO superset;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_permission_view_role_id_seq OWNER TO superset;

--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO superset;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_register_user_id_seq OWNER TO superset;

--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO superset;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_role_id_seq OWNER TO superset;

--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(320) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO superset;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_user_id_seq OWNER TO superset;

--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO superset;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_user_role_id_seq OWNER TO superset;

--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO superset;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_view_menu_id_seq OWNER TO superset;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO superset;

--
-- Name: annotation; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer,
    json_metadata text
);


ALTER TABLE public.annotation OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.annotation_id_seq OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation_layer OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.annotation_layer_id_seq OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- Name: cache_keys; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.cache_keys (
    id integer NOT NULL,
    cache_key character varying(256) NOT NULL,
    cache_timeout integer,
    datasource_uid character varying(64) NOT NULL,
    created_on timestamp without time zone
);


ALTER TABLE public.cache_keys OWNER TO superset;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.cache_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cache_keys_id_seq OWNER TO superset;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.cache_keys_id_seq OWNED BY public.cache_keys.id;


--
-- Name: css_templates; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.css_templates OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.css_templates_id_seq OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- Name: dashboard_roles; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    dashboard_id integer
);


ALTER TABLE public.dashboard_roles OWNER TO superset;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_roles_id_seq OWNER TO superset;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_roles_id_seq OWNED BY public.dashboard_roles.id;


--
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


ALTER TABLE public.dashboard_slices OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_slices_id_seq OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.dashboard_user OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_user_id_seq OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text,
    published boolean,
    uuid uuid,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dashboards OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboards_id_seq OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: dbs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250) NOT NULL,
    sqlalchemy_uri character varying(1024) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_dml boolean,
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_file_upload boolean DEFAULT true NOT NULL,
    encrypted_extra bytea,
    server_cert bytea,
    allow_cvas boolean,
    uuid uuid,
    configuration_method character varying(255) DEFAULT 'sqlalchemy_form'::character varying,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dbs OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dbs_id_seq OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- Name: dynamic_plugin; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dynamic_plugin (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    bundle_url character varying(1000) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.dynamic_plugin OWNER TO superset;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dynamic_plugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dynamic_plugin_id_seq OWNER TO superset;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dynamic_plugin_id_seq OWNED BY public.dynamic_plugin.id;


--
-- Name: embedded_dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.embedded_dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    allow_domain_list text,
    uuid uuid,
    dashboard_id integer NOT NULL,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.embedded_dashboards OWNER TO superset;

--
-- Name: favstar; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone
);


ALTER TABLE public.favstar OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favstar_id_seq OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- Name: filter_sets; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.filter_sets (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    description text,
    json_metadata text NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying(255) NOT NULL,
    dashboard_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.filter_sets OWNER TO superset;

--
-- Name: filter_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.filter_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.filter_sets_id_seq OWNER TO superset;

--
-- Name: filter_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.filter_sets_id_seq OWNED BY public.filter_sets.id;


--
-- Name: key_value; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.key_value (
    id integer NOT NULL,
    resource character varying(32) NOT NULL,
    value bytea NOT NULL,
    uuid uuid,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer,
    expires_on timestamp without time zone
);


ALTER TABLE public.key_value OWNER TO superset;

--
-- Name: key_value_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.key_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.key_value_id_seq OWNER TO superset;

--
-- Name: key_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.key_value_id_seq OWNED BY public.key_value.id;


--
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.keyvalue OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keyvalue_id_seq OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


ALTER TABLE public.logs OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_id_seq OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text,
    extra_json text,
    tmp_schema_name character varying(256),
    ctas_method character varying(16),
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying
);


ALTER TABLE public.query OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.query_id_seq OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: report_execution_log; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_execution_log (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    value double precision,
    value_row_json text,
    state character varying(50) NOT NULL,
    error_message text,
    report_schedule_id integer NOT NULL,
    uuid uuid
);


ALTER TABLE public.report_execution_log OWNER TO superset;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_execution_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_execution_log_id_seq OWNER TO superset;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_execution_log_id_seq OWNED BY public.report_execution_log.id;


--
-- Name: report_recipient; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_recipient (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    recipient_config_json text,
    report_schedule_id integer NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.report_recipient OWNER TO superset;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_recipient_id_seq OWNER TO superset;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_recipient_id_seq OWNED BY public.report_recipient.id;


--
-- Name: report_schedule; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_schedule (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    context_markdown text,
    active boolean,
    crontab character varying(1000) NOT NULL,
    sql text,
    chart_id integer,
    dashboard_id integer,
    database_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(50),
    last_value double precision,
    last_value_row_json text,
    validator_type character varying(100),
    validator_config_json text,
    log_retention integer,
    grace_period integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    working_timeout integer,
    report_format character varying(50) DEFAULT 'PNG'::character varying,
    creation_method character varying(255) DEFAULT 'alerts_reports'::character varying,
    timezone character varying(100) DEFAULT 'UTC'::character varying NOT NULL,
    extra_json text NOT NULL,
    force_screenshot boolean,
    custom_width integer,
    custom_height integer
);


ALTER TABLE public.report_schedule OWNER TO superset;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_schedule_id_seq OWNER TO superset;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_schedule_id_seq OWNED BY public.report_schedule.id;


--
-- Name: report_schedule_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_schedule_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_schedule_id integer NOT NULL
);


ALTER TABLE public.report_schedule_user OWNER TO superset;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_schedule_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_schedule_user_id_seq OWNER TO superset;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_schedule_user_id_seq OWNED BY public.report_schedule_user.id;


--
-- Name: rls_filter_roles; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.rls_filter_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_roles OWNER TO superset;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.rls_filter_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rls_filter_roles_id_seq OWNER TO superset;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.rls_filter_roles_id_seq OWNED BY public.rls_filter_roles.id;


--
-- Name: rls_filter_tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.rls_filter_tables (
    id integer NOT NULL,
    table_id integer,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_tables OWNER TO superset;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.rls_filter_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rls_filter_tables_id_seq OWNER TO superset;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.rls_filter_tables_id_seq OWNED BY public.rls_filter_tables.id;


--
-- Name: row_level_security_filters; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.row_level_security_filters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    clause text NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    filter_type character varying(255),
    group_key character varying(255),
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.row_level_security_filters OWNER TO superset;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.row_level_security_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.row_level_security_filters_id_seq OWNER TO superset;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.row_level_security_filters_id_seq OWNED BY public.row_level_security_filters.id;


--
-- Name: saved_query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer,
    extra_json text,
    last_run timestamp without time zone,
    rows integer,
    uuid uuid,
    template_parameters text
);


ALTER TABLE public.saved_query OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.saved_query_id_seq OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- Name: sl_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_columns (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    is_aggregation boolean NOT NULL,
    is_additive boolean NOT NULL,
    is_dimensional boolean NOT NULL,
    is_filterable boolean NOT NULL,
    is_increase_desired boolean NOT NULL,
    is_managed_externally boolean NOT NULL,
    is_partition boolean NOT NULL,
    is_physical boolean NOT NULL,
    is_temporal boolean NOT NULL,
    is_spatial boolean NOT NULL,
    name text,
    type text,
    unit text,
    expression text,
    description text,
    warning_text text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer,
    advanced_data_type text
);


ALTER TABLE public.sl_columns OWNER TO superset;

--
-- Name: sl_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sl_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sl_columns_id_seq OWNER TO superset;

--
-- Name: sl_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sl_columns_id_seq OWNED BY public.sl_columns.id;


--
-- Name: sl_dataset_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_dataset_columns (
    dataset_id integer NOT NULL,
    column_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_columns OWNER TO superset;

--
-- Name: sl_dataset_tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_dataset_tables (
    dataset_id integer NOT NULL,
    table_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_tables OWNER TO superset;

--
-- Name: sl_dataset_users; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_dataset_users (
    dataset_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_users OWNER TO superset;

--
-- Name: sl_datasets; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_datasets (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_id integer NOT NULL,
    is_physical boolean,
    is_managed_externally boolean NOT NULL,
    name text,
    expression text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.sl_datasets OWNER TO superset;

--
-- Name: sl_datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sl_datasets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sl_datasets_id_seq OWNER TO superset;

--
-- Name: sl_datasets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sl_datasets_id_seq OWNED BY public.sl_datasets.id;


--
-- Name: sl_table_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_table_columns (
    table_id integer NOT NULL,
    column_id integer NOT NULL
);


ALTER TABLE public.sl_table_columns OWNER TO superset;

--
-- Name: sl_tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sl_tables (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_id integer NOT NULL,
    is_managed_externally boolean NOT NULL,
    catalog text,
    schema text,
    name text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.sl_tables OWNER TO superset;

--
-- Name: sl_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sl_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sl_tables_id_seq OWNER TO superset;

--
-- Name: sl_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sl_tables_id_seq OWNED BY public.sl_tables.id;


--
-- Name: slice_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


ALTER TABLE public.slice_user OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slice_user_id_seq OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer,
    schema_perm character varying(1000),
    uuid uuid,
    query_context text,
    last_saved_at timestamp without time zone,
    last_saved_by_fk integer,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    CONSTRAINT ck_chart_datasource CHECK (((datasource_type)::text = 'table'::text))
);


ALTER TABLE public.slices OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slices_id_seq OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text NOT NULL,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    d3format character varying(128),
    warning_text text,
    extra text,
    uuid uuid,
    currency character varying(128)
);


ALTER TABLE public.sql_metrics OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sql_metrics_id_seq OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- Name: sqlatable_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sqlatable_user (
    id integer NOT NULL,
    user_id integer,
    table_id integer
);


ALTER TABLE public.sqlatable_user OWNER TO superset;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sqlatable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sqlatable_user_id_seq OWNER TO superset;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sqlatable_user_id_seq OWNED BY public.sqlatable_user.id;


--
-- Name: ssh_tunnels; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ssh_tunnels (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    extra_json text,
    uuid uuid,
    id integer NOT NULL,
    database_id integer,
    server_address character varying(256),
    server_port integer,
    username bytea,
    password bytea,
    private_key bytea,
    private_key_password bytea
);


ALTER TABLE public.ssh_tunnels OWNER TO superset;

--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ssh_tunnels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ssh_tunnels_id_seq OWNER TO superset;

--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.ssh_tunnels_id_seq OWNED BY public.ssh_tunnels.id;


--
-- Name: tab_state; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tab_state (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    user_id integer,
    label character varying(256),
    active boolean,
    database_id integer,
    schema character varying(256),
    sql text,
    query_limit integer,
    latest_query_id character varying(11),
    autorun boolean NOT NULL,
    template_params text,
    created_by_fk integer,
    changed_by_fk integer,
    hide_left_bar boolean DEFAULT false NOT NULL,
    saved_query_id integer
);


ALTER TABLE public.tab_state OWNER TO superset;

--
-- Name: tab_state_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tab_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_state_id_seq OWNER TO superset;

--
-- Name: tab_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tab_state_id_seq OWNED BY public.tab_state.id;


--
-- Name: table_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255) NOT NULL,
    is_dttm boolean,
    is_active boolean,
    type text,
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    uuid uuid,
    extra text,
    advanced_data_type character varying(255)
);


ALTER TABLE public.table_columns OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.table_columns_id_seq OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- Name: table_schema; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_schema (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    tab_state_id integer,
    database_id integer NOT NULL,
    schema character varying(256),
    "table" character varying(256),
    description text,
    expanded boolean,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.table_schema OWNER TO superset;

--
-- Name: table_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.table_schema_id_seq OWNER TO superset;

--
-- Name: table_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_schema_id_seq OWNED BY public.table_schema.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250) NOT NULL,
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate text,
    is_sqllab_view boolean DEFAULT false,
    template_params text,
    schema_perm character varying(1000),
    extra text,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    normalize_columns boolean DEFAULT false,
    always_filter_main_dttm boolean DEFAULT false
);


ALTER TABLE public.tables OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tables_id_seq OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tag (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    type character varying,
    created_by_fk integer,
    changed_by_fk integer,
    description text
);


ALTER TABLE public.tag OWNER TO superset;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_seq OWNER TO superset;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tagged_object; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tagged_object (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    tag_id integer,
    object_id integer,
    object_type character varying,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tagged_object OWNER TO superset;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tagged_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tagged_object_id_seq OWNER TO superset;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tagged_object_id_seq OWNED BY public.tagged_object.id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.url (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    url text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.url OWNER TO superset;

--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.url_id_seq OWNER TO superset;

--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.user_attribute OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_attribute_id_seq OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- Name: user_favorite_tag; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.user_favorite_tag (
    user_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.user_favorite_tag OWNER TO superset;

--
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- Name: cache_keys id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.cache_keys ALTER COLUMN id SET DEFAULT nextval('public.cache_keys_id_seq'::regclass);


--
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- Name: dashboard_roles id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles ALTER COLUMN id SET DEFAULT nextval('public.dashboard_roles_id_seq'::regclass);


--
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- Name: dynamic_plugin id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin ALTER COLUMN id SET DEFAULT nextval('public.dynamic_plugin_id_seq'::regclass);


--
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- Name: filter_sets id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets ALTER COLUMN id SET DEFAULT nextval('public.filter_sets_id_seq'::regclass);


--
-- Name: key_value id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value ALTER COLUMN id SET DEFAULT nextval('public.key_value_id_seq'::regclass);


--
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: report_execution_log id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log ALTER COLUMN id SET DEFAULT nextval('public.report_execution_log_id_seq'::regclass);


--
-- Name: report_recipient id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient ALTER COLUMN id SET DEFAULT nextval('public.report_recipient_id_seq'::regclass);


--
-- Name: report_schedule id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_id_seq'::regclass);


--
-- Name: report_schedule_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_user_id_seq'::regclass);


--
-- Name: rls_filter_roles id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_roles_id_seq'::regclass);


--
-- Name: rls_filter_tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_tables_id_seq'::regclass);


--
-- Name: row_level_security_filters id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters ALTER COLUMN id SET DEFAULT nextval('public.row_level_security_filters_id_seq'::regclass);


--
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- Name: sl_columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_columns ALTER COLUMN id SET DEFAULT nextval('public.sl_columns_id_seq'::regclass);


--
-- Name: sl_datasets id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_datasets ALTER COLUMN id SET DEFAULT nextval('public.sl_datasets_id_seq'::regclass);


--
-- Name: sl_tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_tables ALTER COLUMN id SET DEFAULT nextval('public.sl_tables_id_seq'::regclass);


--
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- Name: sqlatable_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user ALTER COLUMN id SET DEFAULT nextval('public.sqlatable_user_id_seq'::regclass);


--
-- Name: ssh_tunnels id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ssh_tunnels ALTER COLUMN id SET DEFAULT nextval('public.ssh_tunnels_id_seq'::regclass);


--
-- Name: tab_state id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state ALTER COLUMN id SET DEFAULT nextval('public.tab_state_id_seq'::regclass);


--
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- Name: table_schema id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema ALTER COLUMN id SET DEFAULT nextval('public.table_schema_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tagged_object id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object ALTER COLUMN id SET DEFAULT nextval('public.tagged_object_id_seq'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_write
3	can_this_form_get
4	can_this_form_post
5	can_edit
6	can_add
7	can_list
8	can_userinfo
9	can_show
10	can_delete
11	userinfoedit
12	copyrole
13	can_get
14	can_invalidate
15	can_warm_up_cache
16	can_export
17	can_get_embedded
18	can_set_embedded
19	can_delete_embedded
20	can_get_or_create_dataset
21	can_duplicate
22	can_get_column_values
23	can_import_
24	can_bulk_create
25	can_estimate_query_cost
26	can_get_results
27	can_export_csv
28	can_format_sql
29	can_execute_sql_query
30	can_download
31	can_time_range
32	can_query_form_data
33	can_query
34	can_external_metadata
35	can_external_metadata_by_name
36	can_samples
37	can_save
38	can_store
39	can_get_value
40	can_my_queries
41	can_import_dashboards
42	can_sqllab
43	can_explore
44	can_sqllab_history
45	can_log
46	can_dashboard_permalink
47	can_profile
48	can_slice
49	can_fetch_datasource_metadata
50	can_explore_json
51	can_dashboard
52	can_post
53	can_expanded
54	can_activate
55	can_put
56	can_delete_query
57	can_migrate_query
58	can_tags
59	can_recent_activity
60	can_grant_guest_token
61	menu_access
62	all_datasource_access
63	all_database_access
64	all_query_access
65	can_csv
66	can_share_dashboard
67	can_share_chart
68	database_access
69	schema_access
70	datasource_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	2	2
5	1	3
6	2	3
7	1	4
8	2	4
9	1	5
10	2	5
11	1	6
12	2	6
13	1	7
14	2	7
15	1	8
16	2	8
17	1	9
18	2	9
19	1	10
20	3	16
21	4	16
22	3	17
23	4	17
24	3	18
25	4	18
26	5	20
27	6	20
28	7	20
29	8	20
30	9	20
31	10	20
32	11	20
33	5	21
34	6	21
35	7	21
36	9	21
37	10	21
38	12	21
39	7	22
40	9	22
41	10	22
42	13	23
43	9	24
44	13	25
45	7	26
46	1	27
47	1	28
48	14	29
49	15	4
50	16	4
51	1	31
52	2	31
53	1	32
54	2	32
55	17	8
56	18	8
57	16	8
58	19	8
59	16	9
60	15	6
61	20	6
62	16	6
63	21	6
64	22	33
65	1	34
66	1	35
67	1	36
68	2	36
69	1	37
70	2	37
71	10	38
72	5	38
73	6	38
74	7	38
75	16	39
76	23	39
77	1	40
78	2	40
79	16	1
80	1	41
81	24	41
82	2	41
83	25	42
84	26	42
85	27	42
86	28	42
87	29	42
88	1	42
89	5	43
90	6	43
91	7	43
92	9	43
93	10	43
94	30	43
95	2	43
96	31	44
97	32	44
98	33	44
99	3	45
100	4	45
101	3	46
102	4	46
103	3	47
104	4	47
105	34	33
106	35	33
107	36	33
108	13	33
109	37	33
110	38	49
111	39	49
112	1	51
113	7	1
114	40	52
115	15	53
116	41	53
117	42	53
118	43	53
119	44	53
120	45	53
121	46	53
122	47	53
123	48	53
124	49	53
125	50	53
126	51	53
127	10	54
128	52	54
129	53	54
130	54	55
131	55	55
132	13	55
133	56	55
134	57	55
135	10	55
136	52	55
137	5	57
138	6	57
139	7	57
140	9	57
141	10	57
142	30	57
143	58	58
144	59	7
145	60	59
146	1	59
147	1	60
148	61	61
149	61	62
150	61	63
151	61	64
152	61	65
153	61	40
154	61	66
155	61	67
156	61	68
157	61	69
158	61	70
159	61	71
160	61	72
161	61	73
162	61	74
163	61	75
164	61	57
165	61	76
166	61	77
167	61	78
168	61	79
169	61	80
170	61	81
171	62	82
172	63	83
173	64	84
174	65	53
175	66	53
176	67	53
177	68	85
178	69	86
180	69	88
181	70	89
182	69	90
183	70	91
184	70	92
185	70	93
186	70	94
187	70	95
188	70	96
189	70	97
190	70	98
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	20	1
2	21	1
3	22	1
4	23	1
5	24	1
6	25	1
7	26	1
8	27	1
9	28	1
10	29	1
11	30	1
12	31	1
13	32	1
14	33	1
15	34	1
16	35	1
17	36	1
18	37	1
19	38	1
20	39	1
21	40	1
22	41	1
23	42	1
24	43	1
25	44	1
26	9	1
27	10	1
28	45	1
29	46	1
30	47	1
31	48	1
32	49	1
33	50	1
34	7	1
35	8	1
36	3	1
37	4	1
38	51	1
39	52	1
40	53	1
41	54	1
42	55	1
43	56	1
44	57	1
45	58	1
46	15	1
47	16	1
48	59	1
49	17	1
50	18	1
51	60	1
52	61	1
53	62	1
54	63	1
55	11	1
56	12	1
57	64	1
58	65	1
59	66	1
60	67	1
61	68	1
62	69	1
63	70	1
64	71	1
65	72	1
66	73	1
67	74	1
68	75	1
69	76	1
70	19	1
71	5	1
72	6	1
73	77	1
74	78	1
75	79	1
76	1	1
77	2	1
78	80	1
79	81	1
80	82	1
81	83	1
82	84	1
83	85	1
84	86	1
85	87	1
86	88	1
87	89	1
88	90	1
89	91	1
90	92	1
91	93	1
92	94	1
93	95	1
94	96	1
95	97	1
96	98	1
97	99	1
98	100	1
99	101	1
100	102	1
101	103	1
102	104	1
103	105	1
104	106	1
105	107	1
106	108	1
107	109	1
108	110	1
109	111	1
110	112	1
111	113	1
112	114	1
113	115	1
114	116	1
115	117	1
116	118	1
117	119	1
118	120	1
119	121	1
120	122	1
121	123	1
122	124	1
123	125	1
124	126	1
125	127	1
126	128	1
127	129	1
128	130	1
129	131	1
130	132	1
131	133	1
132	134	1
133	135	1
134	136	1
135	137	1
136	138	1
137	139	1
138	140	1
139	141	1
140	142	1
141	143	1
142	144	1
143	13	1
144	14	1
145	145	1
146	146	1
147	147	1
148	148	1
149	149	1
150	150	1
151	151	1
152	152	1
153	153	1
154	154	1
155	155	1
156	156	1
157	157	1
158	158	1
159	159	1
160	160	1
161	161	1
162	162	1
163	163	1
164	164	1
165	165	1
166	166	1
167	167	1
168	168	1
169	169	1
170	170	1
171	171	1
172	172	1
173	173	1
174	174	1
175	175	1
176	176	1
177	3	3
178	4	3
179	5	3
180	6	3
181	7	3
182	8	3
183	9	3
184	10	3
185	11	3
186	12	3
187	15	3
188	16	3
189	17	3
190	22	3
191	23	3
192	29	3
193	42	3
194	43	3
195	44	3
196	45	3
197	46	3
198	47	3
199	48	3
200	50	3
201	51	3
202	52	3
203	53	3
204	54	3
205	55	3
206	57	3
207	58	3
208	61	3
209	62	3
210	63	3
211	64	3
212	65	3
213	66	3
214	67	3
215	68	3
216	69	3
217	70	3
218	71	3
219	72	3
220	73	3
221	74	3
222	75	3
223	76	3
224	80	3
225	81	3
226	82	3
227	83	3
228	86	3
229	91	3
230	92	3
231	96	3
232	97	3
233	98	3
234	99	3
235	100	3
236	101	3
237	102	3
238	103	3
239	104	3
240	105	3
241	106	3
242	107	3
243	108	3
244	109	3
245	110	3
246	111	3
247	112	3
248	113	3
249	116	3
250	118	3
251	120	3
252	121	3
253	122	3
254	123	3
255	124	3
256	125	3
257	126	3
258	127	3
259	128	3
260	129	3
261	137	3
262	138	3
263	139	3
264	140	3
265	141	3
266	142	3
267	143	3
268	144	3
269	146	3
270	147	3
271	154	3
272	155	3
273	156	3
274	157	3
275	158	3
276	159	3
277	160	3
278	161	3
279	162	3
280	163	3
281	164	3
282	165	3
283	166	3
284	171	3
285	172	3
286	174	3
287	175	3
288	176	3
289	7	4
290	8	4
291	11	4
292	15	4
293	16	4
294	17	4
295	22	4
296	23	4
297	29	4
298	42	4
299	43	4
300	44	4
301	45	4
302	46	4
303	47	4
304	48	4
305	50	4
306	51	4
307	52	4
308	53	4
309	54	4
310	55	4
311	57	4
312	58	4
313	65	4
314	66	4
315	67	4
316	68	4
317	69	4
318	70	4
319	71	4
320	72	4
321	73	4
322	74	4
323	80	4
324	81	4
325	82	4
326	83	4
327	86	4
328	91	4
329	92	4
330	96	4
331	97	4
332	98	4
333	105	4
334	106	4
335	108	4
336	110	4
337	111	4
338	112	4
339	113	4
340	116	4
341	118	4
342	120	4
343	121	4
344	122	4
345	123	4
346	124	4
347	125	4
348	126	4
349	137	4
350	138	4
351	139	4
352	140	4
353	141	4
354	142	4
355	143	4
356	144	4
357	146	4
358	147	4
359	154	4
360	155	4
361	156	4
362	157	4
363	158	4
364	159	4
365	161	4
366	163	4
367	164	4
368	174	4
369	175	4
370	176	4
371	1	5
372	2	5
373	17	5
374	19	5
375	79	5
376	84	5
377	85	5
378	87	5
379	88	5
380	114	5
381	117	5
382	119	5
383	130	5
384	131	5
385	132	5
386	133	5
387	134	5
388	135	5
389	136	5
390	167	5
391	168	5
392	169	5
393	170	5
394	174	5
395	7	6
396	8	6
397	11	6
398	15	6
399	16	6
400	17	6
401	22	6
402	23	6
403	29	6
404	42	6
405	43	6
406	44	6
407	45	6
408	46	6
409	47	6
410	48	6
411	50	6
412	51	6
413	52	6
414	53	6
415	54	6
416	55	6
417	57	6
418	58	6
419	65	6
420	66	6
421	67	6
422	68	6
423	69	6
424	70	6
425	71	6
426	72	6
427	73	6
428	74	6
429	80	6
430	81	6
431	82	6
432	83	6
433	86	6
434	91	6
435	92	6
436	96	6
437	97	6
438	98	6
439	105	6
440	106	6
441	108	6
442	110	6
443	111	6
444	112	6
445	113	6
446	116	6
447	118	6
448	120	6
449	121	6
450	122	6
451	123	6
452	124	6
453	125	6
454	126	6
455	137	6
456	138	6
457	139	6
458	140	6
459	141	6
460	142	6
461	143	6
462	144	6
463	146	6
464	147	6
465	154	6
466	155	6
467	156	6
468	157	6
469	158	6
470	159	6
471	161	6
472	163	6
473	164	6
474	174	6
475	175	6
476	176	6
477	1	6
478	2	6
479	19	6
480	79	6
481	84	6
482	85	6
483	87	6
484	88	6
485	114	6
486	117	6
487	119	6
488	130	6
489	131	6
490	132	6
491	133	6
492	134	6
493	135	6
494	136	6
495	167	6
496	168	6
497	169	6
498	170	6
500	182	9
502	180	8
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Alpha
4	Gamma
5	sql_lab
6	Gamma_extended
7	Marketing
8	Compliance and Regulation Analytics
9	Customer Service Analytics
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	Superset	Admin	admin	pbkdf2:sha256:600000$VtEwC0rP1mLkLXCr$7f88b3bf4078f2a7f141faa6fc3adb740a012813caf0e4186a5f8686b98f6e7b	t	admin@superset.com	2024-03-27 12:28:03.034176	17	0	2024-03-27 09:00:58.213426	2024-03-27 09:00:58.213437	\N	\N
2	Daniel	King	daniel.king	pbkdf2:sha256:600000$XobvWsPoxpUBXba2$d55ffd2384a0ef4a547f9b1a28f129be7c953e319616cd3ebfc32c843f6e7f89	t	daniel.king@knab.com	2024-03-27 13:03:21.659711	4	0	2024-03-27 11:22:57.458016	2024-03-27 11:22:57.458026	\N	\N
6	Pamela	Scott	pamela.scott	pbkdf2:sha256:600000$8fxRZw3aVI4bfwi7$ea9f35223de6eac05aa9545514e9435043897aaf76ceb2c24f0d63f1844c34ee	t	pamela.scott@knab.com	2024-03-28 07:00:26.144853	2	0	2024-03-27 12:26:07.70948	2024-03-27 12:26:07.709489	\N	\N
4	Justin	Martin	justin.martin	pbkdf2:sha256:600000$2Ws6i8DFijoebva3$414384ff49e564884c4f8273e7037bedd64a931f300a229de408b2fd9b6b2885	t	justin.martin@knab.com	2024-03-28 07:01:21.548788	4	0	2024-03-27 12:25:15.310823	2024-03-27 12:25:15.310834	\N	\N
7	Sophia	Clarke	sophia.clarke	pbkdf2:sha256:600000$Eh3aHfvVnAfLm1MH$778628976ff23ac23b1875d5511d3ccff6eb603d2fa189db8d2b33eedcb258e6	t	sophia.clarke@knab.com	2024-03-28 07:03:15.090283	4	0	2024-03-27 12:26:23.415568	2024-03-27 12:26:23.415577	\N	\N
3	Isla	Williams	isla.williams	pbkdf2:sha256:600000$Shnct223WRMOpRBl$9e771548d71089f326f8edf712f8d90eab34864ef833081d0889284e95a13524	t	isla.williams@knab.com	2024-03-27 12:24:58.537556	1	0	2024-03-27 12:24:58.52987	2024-03-27 12:24:58.52988	\N	\N
5	Mark	Ketting	mark.ketting	pbkdf2:sha256:600000$9PjSpVaXmmI2rpyi$9ccaf75fe3f36ab9ccf05004efe1b74e2d76d9bcf4dc4f5b28773d3d4454ed90	t	mark.ketting@knab.com	2024-03-27 12:25:50.846849	1	0	2024-03-27 12:25:50.840258	2024-03-27 12:25:50.840267	\N	\N
8	William	Lewis	william.lewis	pbkdf2:sha256:600000$tNYDu1gAgzC4Zw38$dc4c35bdf39728d6154a66cc32f1058e7105aafa048bb27e177b7a903f14d298	t	william.lewis@knab.com	2024-03-27 12:26:38.256448	1	0	2024-03-27 12:26:38.250925	2024-03-27 12:26:38.250934	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
2	2	6
3	3	6
4	4	6
5	5	6
6	6	6
7	7	6
8	8	6
9	5	7
10	2	8
11	3	9
12	4	9
13	6	9
14	7	8
15	8	8
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	SavedQuery
2	CssTemplate
3	ReportSchedule
4	Chart
5	Annotation
6	Dataset
7	Log
8	Dashboard
9	Database
10	Query
11	SupersetIndexView
12	UtilView
13	LocaleView
14	SecurityApi
15	RegisterUserOAuthView
16	ResetPasswordView
17	ResetMyPasswordView
18	UserInfoEditView
19	AuthOAuthView
20	UserOAuthModelView
21	RoleModelView
22	RegisterUserModelView
23	OpenApi
24	SwaggerView
25	MenuApi
26	AsyncEventsRestApi
27	AdvancedDataType
28	AvailableDomains
29	CacheRestApi
30	CurrentUserRestApi
31	DashboardFilterStateRestApi
32	DashboardPermalinkRestApi
33	Datasource
34	EmbeddedDashboard
35	Explore
36	ExploreFormDataRestApi
37	ExplorePermalinkRestApi
38	FilterSets
39	ImportExportRestApi
40	Row Level Security
41	Tag
42	SQLLab
43	DynamicPlugin
44	Api
45	CsvToDatabaseView
46	ExcelToDatabaseView
47	ColumnarToDatabaseView
48	EmbeddedView
49	KV
50	R
51	Profile
52	SqlLab
53	Superset
54	TableSchemaView
55	TabStateView
56	TaggedObjectView
57	Tags
58	TagView
59	SecurityRestApi
60	RowLevelSecurity
61	Security
62	List Users
63	List Roles
64	User Registrations
65	Action Log
66	Home
67	Data
68	Databases
69	Dashboards
70	Charts
71	Datasets
72	Manage
73	Plugins
74	CSS Templates
75	Import Dashboards
76	Alerts & Report
77	Annotation Layers
78	SQL Lab
79	SQL Editor
80	Saved Queries
81	Query Search
82	all_datasource_access
83	all_database_access
84	all_query_access
85	[Trino lakehouse].(id:1)
86	[Trino lakehouse].[information_schema]
88	[Trino lakehouse].[compliance_analytics]
89	[Trino lakehouse].[customer](id:2)
90	[Trino lakehouse].[customer_analytics]
91	[Trino lakehouse].[customer_address](id:3)
92	[Trino lakehouse].[customer_demographics](id:4)
93	[Trino lakehouse].[customer_enriched](id:5)
94	[Trino lakehouse].[household_demographics](id:6)
95	[Trino lakehouse].[income_band](id:7)
96	[Trino lakehouse].[customer_demographics_enriched](id:8)
97	[Trino lakehouse].[household_demographics_enriched](id:9)
98	[Trino lakehouse].[customer_enriched](id:10)
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alembic_version (version_num) FROM stdin;
b7851ee5522f
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation (created_on, changed_on, id, start_dttm, end_dttm, layer_id, short_descr, long_descr, changed_by_fk, created_by_fk, json_metadata) FROM stdin;
\.


--
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation_layer (created_on, changed_on, id, name, descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: cache_keys; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.cache_keys (id, cache_key, cache_timeout, datasource_uid, created_on) FROM stdin;
\.


--
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: dashboard_roles; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_roles (id, role_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_slices (id, dashboard_id, slice_id) FROM stdin;
1	2	1
2	2	2
3	3	4
4	3	3
\.


--
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_user (id, user_id, dashboard_id) FROM stdin;
2	2	2
3	4	3
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata, published, uuid, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2024-03-27 13:33:13.947737	2024-03-27 14:21:33.680941	3	Customer analytics	{"CHART-TxbrYIozYw":{"children":[],"id":"CHART-TxbrYIozYw","meta":{"chartId":4,"height":33,"sliceName":"Customers per state","uuid":"fa8b274f-8a69-4449-819e-521b4a6600a2","width":10},"parents":["ROOT_ID","GRID_ID","ROW-crD1lbf1oU"],"type":"CHART"},"CHART-i53yFbHq6z":{"children":[],"id":"CHART-i53yFbHq6z","meta":{"chartId":3,"height":33,"sliceName":"Number of customers","uuid":"bb2aacd7-a074-4289-a795-71ecca300f04","width":2},"parents":["ROOT_ID","GRID_ID","ROW-crD1lbf1oU"],"type":"CHART"},"DASHBOARD_VERSION_KEY":"v2","GRID_ID":{"children":["ROW-crD1lbf1oU"],"id":"GRID_ID","parents":["ROOT_ID"],"type":"GRID"},"HEADER_ID":{"id":"HEADER_ID","meta":{"text":"Customer analytics"},"type":"HEADER"},"ROOT_ID":{"children":["GRID_ID"],"id":"ROOT_ID","type":"ROOT"},"ROW-crD1lbf1oU":{"children":["CHART-i53yFbHq6z","CHART-TxbrYIozYw"],"id":"ROW-crD1lbf1oU","meta":{"background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"}}	4	4		\N	\N	{"chart_configuration": {"4": {"id": 4, "crossFilters": {"scope": "global", "chartsInScope": [3]}}}, "global_chart_configuration": {"scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "chartsInScope": [3, 4]}, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {}, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "cross_filters_enabled": true, "default_filters": "{}"}	t	c39aadfb-9037-4424-b9cc-98762297b25a			f	\N
2024-03-27 13:19:04.095758	2024-03-27 13:28:21.264343	2	Customer compliance	{"CHART-_-vtEcReJp":{"children":[],"id":"CHART-_-vtEcReJp","meta":{"chartId":2,"height":52,"sliceName":"Customers per gender and martial status","uuid":"6293babd-b3bc-4d05-a70d-5b58e7717458","width":12},"parents":["ROOT_ID","GRID_ID","ROW-i-iK_9GOj"],"type":"CHART"},"CHART-explore-1-1":{"children":[],"id":"CHART-explore-1-1","meta":{"chartId":1,"height":43,"sliceName":"Customer age","uuid":"5faaa605-6dbd-47d4-a8c8-64839fb8ff12","width":12},"parents":["ROOT_ID","GRID_ID","ROW-Z7X4HOaDSO"],"type":"CHART"},"DASHBOARD_VERSION_KEY":"v2","GRID_ID":{"children":["ROW-Z7X4HOaDSO","ROW-i-iK_9GOj"],"id":"GRID_ID","parents":["ROOT_ID"],"type":"GRID"},"HEADER_ID":{"id":"HEADER_ID","meta":{"text":"Customer compliance"},"type":"HEADER"},"ROOT_ID":{"children":["GRID_ID"],"id":"ROOT_ID","type":"ROOT"},"ROW-Z7X4HOaDSO":{"children":["CHART-explore-1-1"],"id":"ROW-Z7X4HOaDSO","meta":{"0":"ROOT_ID","background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"},"ROW-i-iK_9GOj":{"children":["CHART-_-vtEcReJp"],"id":"ROW-i-iK_9GOj","meta":{"background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"}}	2	2		\N	\N	{"chart_configuration": {"1": {"id": 1, "crossFilters": {"scope": "global", "chartsInScope": [2]}}, "2": {"id": 2, "crossFilters": {"scope": "global", "chartsInScope": [1]}}}, "global_chart_configuration": {"scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "chartsInScope": [1, 2]}, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {"count": "#1FA8C9"}, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "cross_filters_enabled": true, "default_filters": "{}"}	t	c33d4006-d49f-473a-b3b4-93c39e3c8310			f	\N
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_dml, verbose_name, impersonate_user, allow_file_upload, encrypted_extra, server_cert, allow_cvas, uuid, configuration_method, is_managed_externally, external_url) FROM stdin;
2024-03-27 09:06:31.329851	2024-03-27 12:30:03.632211	1	Trino lakehouse	trino://superset:XXXXXXXXXX@trino-coordinator:8443/lakehouse?verify=false	1	1	\\x426f35784c53464f667134714b39515a74532f70366e794b48423565514e30716e5a59507053483348756f3d	\N	{"allows_virtual_table_explore": true}	f	t	t	\N	f	t	\N	t	f	\\x7553472f724455376b6d78545a396e476e6338794a413d3d	\N	t	f8d085f0-211e-4ab7-97b1-dcd9b96ee28d	sqlalchemy_form	f	\N
\.


--
-- Data for Name: dynamic_plugin; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dynamic_plugin (created_on, changed_on, id, name, key, bundle_url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: embedded_dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.embedded_dashboards (created_on, changed_on, allow_domain_list, uuid, dashboard_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.favstar (id, user_id, class_name, obj_id, dttm) FROM stdin;
\.


--
-- Data for Name: filter_sets; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.filter_sets (created_on, changed_on, id, name, description, json_metadata, owner_id, owner_type, dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.key_value (id, resource, value, uuid, created_on, created_by_fk, changed_on, changed_by_fk, expires_on) FROM stdin;
6	superset_metastore_cache	\\x22626e4f545151364d3753784b35745565636f715f6852574468463475536f7462786b4d365f666331636a6f6d454b4a484c52506a38396177767538376b59794b22	89547a6c-fd0c-319c-a48c-dd2b5a6b1d45	2024-03-27 13:07:16.955267	2	2024-03-27 13:19:05.636118	2	2024-04-03 13:19:05.635058
3	superset_metastore_cache	\\x7b226f776e6572223a20322c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22325f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c226167677265676174655c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c22616c6c5f636f6c756d6e735c223a5b5d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	f18286e2-4451-3ca3-9909-c79df775fce4	2024-03-27 13:03:43.662543	2	\N	\N	2024-04-03 13:03:43.661056
4	superset_metastore_cache	\\x226b635f4f33424e46774c4237564b336449397a4e7550562d78507830316f4c355679356444764c5674496f57347249536c6a44476268725744754767624d697722	1ecc75fd-5a6a-322f-92cb-40ca67b6061d	2024-03-27 13:03:43.669047	2	\N	\N	2024-04-03 13:03:43.668074
20	superset_metastore_cache	\\x22434765626255386955534a38426b6d584f4f59705744356c717a3149646e4c4d686e6e424d764a45326e734e71564b4a625f4336704744322d73476b6b38643522	807c6335-67c5-347e-a848-c7996d8ab615	2024-03-27 13:28:28.136684	7	2024-03-27 14:34:05.42186	7	2024-06-25 14:34:05.420418
25	superset_metastore_cache	\\x7b226f776e6572223a20362c202276616c7565223a20227b7d227d	d00c1a04-6e90-3756-8a26-1ae6b0f041ca	2024-03-28 07:00:30.663119	6	\N	\N	2024-06-26 07:00:30.662142
11	superset_metastore_cache	\\x7b226f776e6572223a20372c202276616c7565223a20227b7d227d	1e7df8e2-9275-37a2-b3b5-103e4f0f50e7	2024-03-27 13:19:23.817464	2	2024-03-28 07:01:52.969329	7	2024-06-26 07:01:52.968223
1	superset_metastore_cache	\\x7b226f776e6572223a20322c202264617461736f757263655f6964223a2031302c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c2231305f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c226167677265676174655c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c22616c6c5f636f6c756d6e735c223a5b5d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	ca5515f2-904e-3449-88db-e8a2f8e3905d	2024-03-27 13:03:30.438384	2	2024-03-27 13:20:38.970756	2	2024-04-03 13:20:38.969577
2	superset_metastore_cache	\\x2257524a656f594776686e554d3663325a63647a71363168304c6f435f4362374768667133656a627646546e507778512d326a6b785f5a5f6e5930634278572d3522	c7f62645-ee33-3a2f-a2bf-0e8b8cc81198	2024-03-27 13:03:30.448479	2	2024-03-27 13:20:38.976266	2	2024-04-03 13:20:38.975212
15	superset_metastore_cache	\\x7b226f776e6572223a20342c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20332c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22325f5f7461626c655c222c5c2276697a5f747970655c223a5c226269675f6e756d6265725f746f74616c5c222c5c22736c6963655f69645c223a332c5c226d65747269635c223a5c22636f756e745c222c5c226164686f635f66696c746572735c223a5b5d2c5c226865616465725f666f6e745f73697a655c223a302e342c5c227375626865616465725f666f6e745f73697a655c223a302e31352c5c22795f617869735f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c2274696d655f666f726d61745c223a5c22736d6172745f646174655c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	4ec5b72f-d091-378f-99ed-7fbfdb6fc3b1	2024-03-27 13:24:01.600473	4	\N	\N	2024-04-03 13:24:01.599435
13	superset_metastore_cache	\\x7b226f776e6572223a20342c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22325f5f7461626c655c222c5c2276697a5f747970655c223a5c227069766f745f7461626c655f76325c222c5c2267726f75706279436f6c756d6e735c223a5b5d2c5c2267726f75706279526f77735c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963734c61796f75745c223a5c22434f4c554d4e535c222c5c226164686f635f66696c746572735c223a5b5d2c5c22726f775f6c696d69745c223a31303030302c5c226f726465725f646573635c223a747275652c5c2261676772656761746546756e6374696f6e5c223a5c2253756d5c222c5c2276616c7565466f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22646174655f666f726d61745c223a5c22736d6172745f646174655c222c5c22726f774f726465725c223a5c226b65795f615f746f5f7a5c222c5c22636f6c4f726465725c223a5c226b65795f615f746f5f7a5c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	8d496b8f-0f3b-33fd-b99c-da6015966758	2024-03-27 13:23:41.577587	4	2024-03-27 13:24:47.555288	4	2024-04-03 13:24:47.553795
7	superset_metastore_cache	\\x7b226f776e6572223a20322c202264617461736f757263655f6964223a2031302c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20322c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c2231305f5f7461626c655c222c5c2276697a5f747970655c223a5c227069766f745f7461626c655f76325c222c5c22736c6963655f69645c223a322c5c2267726f75706279436f6c756d6e735c223a5b5c2267656e6465725c225d2c5c2267726f75706279526f77735c223a5b5c226d61726974616c5f7374617475735c225d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5c22636f756e745c225d2c5c226d6574726963734c61796f75745c223a5c22524f57535c222c5c226164686f635f66696c746572735c223a5b7b5c22636c617573655c223a5c2257484552455c222c5c22636f6d70617261746f725c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c2266696c7465724f7074696f6e4e616d655c223a5c2266696c7465725f6f693275356d3070326f5f6836786370347a727169615c222c5c22697345787472615c223a66616c73652c5c2269734e65775c223a66616c73652c5c226f70657261746f725c223a5c224953204e4f54204e554c4c5c222c5c226f70657261746f7249645c223a5c2249535f4e4f545f4e554c4c5c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c227375626a6563745c223a5c2267656e6465725c227d5d2c5c22726f775f6c696d69745c223a31303030302c5c226f726465725f646573635c223a747275652c5c2261676772656761746546756e6374696f6e5c223a5c2253756d5c222c5c22726f77546f74616c735c223a747275652c5c22726f77537562546f74616c735c223a747275652c5c22636f6c546f74616c735c223a747275652c5c22636f6c537562546f74616c735c223a66616c73652c5c227472616e73706f73655069766f745c223a66616c73652c5c22636f6d62696e654d65747269635c223a66616c73652c5c2276616c7565466f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22646174655f666f726d61745c223a5c22736d6172745f646174655c222c5c22726f774f726465725c223a5c226b65795f615f746f5f7a5c222c5c22636f6c4f726465725c223a5c226b65795f615f746f5f7a5c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	0fb5be05-42d9-3738-a2b5-6ad55b85880a	2024-03-27 13:10:34.670678	2	2024-03-27 13:28:11.000719	2	2024-04-03 13:28:10.999299
8	superset_metastore_cache	\\x2273466346376d483073556c553164713930585a4639505a476d756977626c4372755544413935674c6d4f667663795a52424451754145457754334a62486c394e22	fce98f99-3a0e-33ce-b1c7-cbba112f087c	2024-03-27 13:10:34.676516	2	2024-03-27 13:28:11.005941	2	2024-04-03 13:28:11.004896
21	superset_metastore_cache	\\x7b226f776e6572223a20342c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20342c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22355f5f7461626c655c222c5c2276697a5f747970655c223a5c227069766f745f7461626c655f76325c222c5c22736c6963655f69645c223a342c5c2267726f75706279436f6c756d6e735c223a5b5c2273746174655c225d2c5c2267726f75706279526f77735c223a5b5c227072656665727265645f637573746f6d65725c225d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b5c2262697274685f646174655c223a747275657d2c5c226d6574726963735c223a5b5c22636f756e745c225d2c5c226d6574726963734c61796f75745c223a5c22434f4c554d4e535c222c5c226164686f635f66696c746572735c223a5b7b5c22636c617573655c223a5c2257484552455c222c5c22636f6d70617261746f725c223a5c224e6f2066696c7465725c222c5c2264617461736f757263655761726e696e675c223a66616c73652c5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c2266696c7465724f7074696f6e4e616d655c223a5c2266696c7465725f356d6230713379697a696b5f306f747632676f746e70695c222c5c22697345787472615c223a66616c73652c5c2269734e65775c223a66616c73652c5c226f70657261746f725c223a5c2254454d504f52414c5f52414e47455c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c227375626a6563745c223a5c2262697274685f646174655c227d2c7b5c22636c617573655c223a5c2257484552455c222c5c22636f6d70617261746f725c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c2266696c7465724f7074696f6e4e616d655c223a5c2266696c7465725f3034393937653434646168725f316a33686235737572736b5c222c5c22697345787472615c223a66616c73652c5c2269734e65775c223a66616c73652c5c226f70657261746f725c223a5c224953204e4f54204e554c4c5c222c5c226f70657261746f7249645c223a5c2249535f4e4f545f4e554c4c5c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c227375626a6563745c223a5c2273746174655c227d5d2c5c22726f775f6c696d69745c223a31303030302c5c226f726465725f646573635c223a747275652c5c2261676772656761746546756e6374696f6e5c223a5c2253756d5c222c5c22726f77546f74616c735c223a747275652c5c22726f77537562546f74616c735c223a66616c73652c5c22636f6c546f74616c735c223a747275652c5c227472616e73706f73655069766f745c223a66616c73652c5c2276616c7565466f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22646174655f666f726d61745c223a5c22736d6172745f646174655c222c5c22726f774f726465725c223a5c226b65795f615f746f5f7a5c222c5c22636f6c4f726465725c223a5c226b65795f615f746f5f7a5c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	b0135836-a97d-321f-afb6-268a2bf9e946	2024-03-27 13:33:01.585677	4	2024-03-27 13:33:15.421729	4	2024-04-03 13:33:15.420537
5	superset_metastore_cache	\\x7b226f776e6572223a20322c202264617461736f757263655f6964223a2031302c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20312c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c2231305f5f7461626c655c222c5c2276697a5f747970655c223a5c22656368617274735f74696d657365726965735f6261725c222c5c22736c6963655f69645c223a312c5c22785f617869735c223a5c2262697274685f796561725c222c5c227841786973466f72636543617465676f726963616c5c223a747275652c5c22785f617869735f736f72745f6173635c223a747275652c5c22785f617869735f736f72745f7365726965735c223a5c226e616d655c222c5c22785f617869735f736f72745f7365726965735f617363656e64696e675c223a747275652c5c226d6574726963735c223a5b5c22636f756e745c225d2c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f646573635c223a747275652c5c22726f775f6c696d69745c223a5c223130303030305c222c5c227472756e636174655f6d65747269635c223a747275652c5c2273686f775f656d7074795f636f6c756d6e735c223a747275652c5c22636f6d70617269736f6e5f747970655c223a5c2276616c7565735c222c5c22616e6e6f746174696f6e5f6c61796572735c223a5b5d2c5c22666f726563617374456e61626c65645c223a66616c73652c5c22666f726563617374506572696f64735c223a31302c5c22666f726563617374496e74657276616c5c223a302e382c5c226f7269656e746174696f6e5c223a5c22766572746963616c5c222c5c22785f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f706f736974696f6e5c223a5c224c6566745c222c5c22736f72745f7365726965735f747970655c223a5c2273756d5c222c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226f6e6c795f746f74616c5c223a747275652c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e64547970655c223a5c227363726f6c6c5c222c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c22785f617869735f74696d655f666f726d61745c223a5c22736d6172745f646174655c222c5c22795f617869735f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c227472756e6361746558417869735c223a747275652c5c22795f617869735f626f756e64735c223a5b6e756c6c2c6e756c6c5d2c5c22726963685f746f6f6c7469705c223a747275652c5c22746f6f6c74697054696d65466f726d61745c223a5c22736d6172745f646174655c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	33873af6-bc5f-37b0-b21c-521db687afff	2024-03-27 13:07:16.948437	2	2024-03-27 13:19:05.63001	2	2024-04-03 13:19:05.628877
9	superset_metastore_cache	\\x7b226f776e6572223a20372c202264617461736f757263655f6964223a2031302c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20312c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c2231305f5f7461626c655c222c5c2276697a5f747970655c223a5c22686973746f6772616d5c222c5c22736c6963655f69645c223a312c5c22616c6c5f636f6c756d6e735f785c223a5b5c2262697274685f796561725c225d2c5c226164686f635f66696c746572735c223a5b5d2c5c22726f775f6c696d69745c223a31303030302c5c2267726f757062795c223a5b5d2c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226c696e6b5f6c656e6774685c223a5c2232355c222c5c2273686f775f6c6567656e645c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	f151dd9a-e782-3a59-a5f1-df327eb7e4d3	2024-03-27 13:13:52.808142	7	\N	\N	2024-04-03 13:13:52.8072
10	superset_metastore_cache	\\x225055624c674936386876624d6f437a3845387436366d656757716d6e617554664965694f7178646a467a632d37527944544537524c735a6b4269544c4567594f22	e826f435-5e51-3488-a8ef-c7343d241572	2024-03-27 13:13:52.813363	7	\N	\N	2024-04-03 13:13:52.812429
18	superset_metastore_cache	\\x7b226f776e6572223a20342c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22355f5f7461626c655c222c5c2276697a5f747970655c223a5c227069655c222c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b7b5c22636c617573655c223a5c2257484552455c222c5c227375626a6563745c223a5c2262697274685f646174655c222c5c226f70657261746f725c223a5c2254454d504f52414c5f52414e47455c222c5c22636f6d70617261746f725c223a5c224e6f2066696c7465725c222c5c2265787072657373696f6e547970655c223a5c2253494d504c455c227d5d2c5c22726f775f6c696d69745c223a3130302c5c22736f72745f62795f6d65747269635c223a747275652c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c2273686f775f6c6162656c735f7468726573686f6c645c223a352c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e64547970655c223a5c227363726f6c6c5c222c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c226c6162656c5f747970655c223a5c226b65795c222c5c226e756d6265725f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22646174655f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f6c6162656c735c223a747275652c5c226c6162656c735f6f7574736964655c223a747275652c5c226f757465725261646975735c223a37302c5c22696e6e65725261646975735c223a33302c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	59f8f44f-c1c4-3248-a57c-ef5dbc6556fc	2024-03-27 13:25:31.451592	4	2024-03-27 14:33:17.267516	4	2024-04-03 14:33:17.265617
17	superset_metastore_cache	\\x2257726a713652306e597a6d4c3962357268794537346f347939486d3058614a6342496f7a317264347932766b625374756d326e6d53486966794f6d6374514d7022	55f4a04f-f55f-3135-a4ac-7b33b2306a19	2024-03-27 13:25:31.446303	4	2024-03-27 14:33:17.274269	4	2024-04-03 14:33:17.272573
23	superset_metastore_cache	\\x7b226f776e6572223a20342c202276616c7565223a20227b7d227d	cc99d466-6e53-332f-bd9d-f6af38c9f35b	2024-03-27 13:33:17.528934	4	2024-03-27 14:33:43.525186	4	2024-06-25 14:33:43.524192
24	superset_metastore_cache	\\x223459556b35636c687433544e736558425f696731374c2d6164362d61533642423569315361764f39724146584b3550584e695566393154456d764435504c347422	33f9d792-d11e-3a0c-a0c0-dc88127ef67f	2024-03-27 13:33:17.534818	4	2024-03-27 14:33:43.530275	4	2024-06-25 14:33:43.529212
19	superset_metastore_cache	\\x7b226f776e6572223a20372c202276616c7565223a20227b7d227d	d71499e4-3321-3f6c-ab94-fc1f628060c0	2024-03-27 13:28:28.128632	7	2024-03-27 14:34:05.415139	7	2024-06-25 14:34:05.413587
16	superset_metastore_cache	\\x2278757773592d6e476b736c6b69456c795f357743552d5f57574d694d7348664c345f6c7a70544f4651726a66757941507641306e7367304d4934366c3976645122	22215eba-305b-398e-b91f-514fea96e4f5	2024-03-27 13:24:01.608294	4	\N	\N	2024-04-03 13:24:01.607253
14	superset_metastore_cache	\\x226e656b505a524f616c756f75306b31617872646a7a48755a5333482d5767323458436c4558393568527943616e6555776e61374f566b484d3035416b5354584622	ec5a750b-61f8-313d-ba87-0d6916849b77	2024-03-27 13:23:41.584559	4	2024-03-27 13:24:47.559773	4	2024-04-03 13:24:47.558768
26	superset_metastore_cache	\\x224243387a59686d6b47696f594c5045713570566d57476663555a4c4a677738313258367543764a77424f59746a2d7156744c704971386f50347349764472516e22	53280b98-2e2f-35d6-961c-959be027554c	2024-03-28 07:00:30.671388	6	\N	\N	2024-06-26 07:00:30.669884
12	superset_metastore_cache	\\x22495a6b6f38396c7a49417245537452787335645245694f62356266386359614263524f4c4672746d5461584a31436836457269424d5371315339554766556c6a22	d684ff69-dd1c-304b-9431-64dc6259fe20	2024-03-27 13:19:23.823635	2	2024-03-28 07:01:52.974933	7	2024-06-26 07:01:52.973887
22	superset_metastore_cache	\\x226e6d70674973416a4b5a5a7452385279483978696a57586235305177382d44533132436b37453677376446456e327a367476303846795a3959306b4a3065326122	8a21cb87-ed55-34ae-8c92-82a0a89d91cd	2024-03-27 13:33:01.591216	4	2024-03-27 13:33:15.427709	4	2024-04-03 13:33:15.426279
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.logs (id, action, user_id, json, dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
1	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:06:31.284398	\N	0	20	\N
2	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:06:31.347266	\N	0	37	\N
3	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:06:31.400711	\N	0	27	\N
4	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:06:31.499281	\N	0	82	\N
5	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:06:32.038771	\N	0	513	\N
6	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:11:34.252099	\N	0	12	\N
7	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:11:34.294308	\N	0	18	\N
8	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:11:34.340779	\N	0	19	\N
9	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:11:34.367676	\N	0	7	\N
10	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:11:34.814428	\N	0	425	\N
11	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:16:39.232784	\N	0	12	\N
12	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:16:39.2736	\N	0	18	\N
13	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:16:39.318895	\N	0	17	\N
14	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:16:39.345783	\N	0	8	\N
15	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:16:39.823728	\N	0	456	\N
16	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:21:44.25787	\N	0	9	\N
17	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:21:44.297971	\N	0	18	\N
18	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:21:44.338446	\N	0	16	\N
19	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:21:44.361557	\N	0	8	\N
20	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:21:44.799759	\N	0	416	\N
21	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:22:32.687201	\N	0	13	\N
22	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:22:32.732004	\N	0	23	\N
23	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:22:32.778209	\N	0	16	\N
24	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:22:32.805634	\N	0	9	\N
25	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:22:33.233464	\N	0	403	\N
26	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:22:34.338925	\N	0	12	\N
27	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:22:34.382069	\N	0	19	\N
28	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:22:34.42729	\N	0	15	\N
29	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:22:34.450766	\N	0	7	\N
30	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:22:34.545747	\N	0	74	\N
31	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:22:51.091733	\N	0	14	\N
32	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:22:51.135622	\N	0	19	\N
65	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:38:44.795437	\N	0	419	\N
1564	root	7	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-28 07:06:07.673654	\N	0	281	\N
33	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:22:51.182379	\N	0	18	\N
34	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:22:51.209216	\N	0	9	\N
35	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:22:51.643803	\N	0	412	\N
36	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:23:20.127162	\N	0	13	\N
37	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:23:20.171187	\N	0	19	\N
38	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:23:20.216782	\N	0	19	\N
39	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:23:20.244117	\N	0	10	\N
40	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:23:20.67894	\N	0	413	\N
41	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:24:13.093549	\N	0	12	\N
42	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:24:13.134675	\N	0	18	\N
43	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:24:13.17542	\N	0	16	\N
44	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:24:13.199641	\N	0	8	\N
45	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:24:13.621452	\N	0	402	\N
46	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:25:38.109886	\N	0	13	\N
47	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:25:38.155515	\N	0	20	\N
48	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:25:38.197619	\N	0	16	\N
49	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:25:38.220827	\N	0	7	\N
50	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:25:38.650148	\N	0	408	\N
51	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:28:21.254719	\N	0	9	\N
52	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:28:21.298895	\N	0	18	\N
53	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:28:21.341527	\N	0	16	\N
54	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:28:21.367981	\N	0	7	\N
55	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:28:21.8094	\N	0	421	\N
56	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:33:28.27637	\N	0	14	\N
57	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:33:28.317544	\N	0	16	\N
58	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:33:28.360311	\N	0	16	\N
59	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:33:28.386554	\N	0	8	\N
60	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:33:28.84369	\N	0	433	\N
61	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:38:44.234012	\N	0	13	\N
62	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:38:44.273996	\N	0	18	\N
63	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:38:44.321378	\N	0	17	\N
64	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:38:44.347548	\N	0	7	\N
66	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:43:52.250364	\N	0	13	\N
67	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:43:52.299888	\N	0	22	\N
68	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:43:52.34224	\N	0	18	\N
69	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:43:52.368255	\N	0	10	\N
70	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:43:52.815013	\N	0	425	\N
71	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:48:59.238647	\N	0	12	\N
72	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:48:59.281943	\N	0	19	\N
73	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:48:59.325	\N	0	17	\N
74	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:48:59.348462	\N	0	8	\N
75	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:48:59.792515	\N	0	423	\N
76	csrf_token	1	{"path": "/api/v1/security/csrf_token/", "object_ref": "SecurityRestApi.csrf_token"}	2024-03-27 09:54:02.236042	\N	0	13	\N
77	ImportExportRestApi.import_	1	{"path": "/api/v1/assets/import/", "passwords": "{\\"databases/Trino_TPCDS.yaml\\": \\"supersetsuperset\\"}", "object_ref": "ImportExportRestApi.import_"}	2024-03-27 09:54:02.278647	\N	0	20	\N
78	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "{\\"columns\\": [\\"id\\", \\"database_name\\", \\"impersonate_user\\"], \\"filters\\": [{\\"col\\": \\"database_name\\", \\"opr\\": \\"eq\\", \\"value\\": \\"Trino TPCDS\\"}], \\"keys\\": [\\"none\\"]}", "rison": {"columns": ["id", "database_name", "impersonate_user"], "filters": [{"col": "database_name", "opr": "eq", "value": "Trino TPCDS"}], "keys": ["none"]}}	2024-03-27 09:54:02.320437	\N	0	17	\N
79	DatabaseRestApi.get	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>"}	2024-03-27 09:54:02.34854	\N	0	9	\N
80	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 09:54:02.784148	\N	0	413	\N
81	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 11:22:54.143022	\N	0	0	\N
82	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 11:22:57.702454	\N	0	150	\N
83	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 11:22:58.481273	\N	0	7	http://5.250.180.35:30980/superset/welcome/
84	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:22:58.671631	\N	0	166	http://5.250.180.35:30980/superset/welcome/
85	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:22:58.819136	\N	0	313	http://5.250.180.35:30980/superset/welcome/
86	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:22:58.843386	\N	0	336	http://5.250.180.35:30980/superset/welcome/
87	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:22:58.868565	\N	0	184	http://5.250.180.35:30980/superset/welcome/
88	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:22:58.873635	\N	0	190	http://5.250.180.35:30980/superset/welcome/
89	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 11:22:58.981497	\N	0	15	http://5.250.180.35:30980/superset/welcome/
90	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 11:22:58.984932	\N	0	8	http://5.250.180.35:30980/superset/welcome/
91	log	2	{"source": "sqlLab", "ts": 1711538578429, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "FdjZM_W4lM", "visibility": "visible"}	2024-03-27 11:22:59.449014	\N	0	0	http://5.250.180.35:30980/superset/welcome/
92	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(columns:!(created_on_delta_humanized,dashboard_title,url),filters:!((col:id,opr:dashboard_is_favorite,value:!t)),keys:!(none),order_column:changed_on,order_direction:desc,page:0,page_size:100)", "rison": {"columns": ["created_on_delta_humanized", "dashboard_title", "url"], "filters": [{"col": "id", "opr": "dashboard_is_favorite", "value": true}], "keys": ["none"], "order_column": "changed_on", "order_direction": "desc", "page": 0, "page_size": 100}}	2024-03-27 11:23:02.063343	\N	0	111	http://5.250.180.35:30980/profile/
94	log	2	{"source": "sqlLab", "ts": 1711538581832, "event_name": "spa_navigation", "path": "/profile/", "event_type": "user", "event_id": "fw34XYTNv", "visibility": "visible"}	2024-03-27 11:23:02.883152	\N	0	0	http://5.250.180.35:30980/profile/
93	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:id,opr:chart_is_favorite,value:!t)),order_column:slice_name,order_direction:asc,page:0,page_size:25)", "rison": {"filters": [{"col": "id", "opr": "chart_is_favorite", "value": true}], "order_column": "slice_name", "order_direction": "asc", "page": 0, "page_size": 25}}	2024-03-27 11:23:02.073812	\N	0	117	http://5.250.180.35:30980/profile/
98	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:23:17.898109	\N	0	56	http://5.250.180.35:30980/superset/welcome/
103	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 11:23:18.200876	\N	0	13	http://5.250.180.35:30980/superset/welcome/
107	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:24:26.96923	\N	0	84	\N
113	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:27.853624	\N	0	56	http://5.250.180.35:30980/superset/welcome/
1251	log	4	{"source": "sqlLab", "ts": 1711546125654, "event_name": "change_explore_controls", "event_type": "user", "event_id": "2MHYC0mcH", "visibility": "visible"}	2024-03-27 13:28:46.722322	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1255	log	4	{"source": "sqlLab", "ts": 1711546141591, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}], "is_cached": null, "force_refresh": false, "row_count": 52, "datasource": "5__table", "start_offset": 253923, "duration": 1407, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "ktpiXwzq4"}	2024-03-27 13:29:02.638468	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1256	log	4	{"source": "sqlLab", "ts": 1711546141609, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 255342, "duration": 7, "event_type": "timing", "trigger_event": "ktpiXwzq4"}	2024-03-27 13:29:02.638471	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1260	log	4	{"source": "sqlLab", "ts": 1711546172617, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}], "is_cached": null, "force_refresh": false, "row_count": 104, "datasource": "5__table", "start_offset": 284755, "duration": 1602, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "sSVw7UN-m"}	2024-03-27 13:29:33.671293	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1261	log	4	{"source": "sqlLab", "ts": 1711546172638, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 286373, "duration": 4, "event_type": "timing", "trigger_event": "sSVw7UN-m"}	2024-03-27 13:29:33.671297	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1266	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:30:14.806884	\N	0	21	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1274	ChartRestApi.favorite_status	4	{"path": "/api/v1/chart/favorite_status/", "q": "!(4)", "object_ref": "ChartRestApi.favorite_status", "rison": [4]}	2024-03-27 13:33:00.606724	\N	0	16	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1282	ChartRestApi.get	4	{"path": "/api/v1/chart/4", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:33:13.89491	\N	0	19	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1285	ChartRestApi.put	4	{"path": "/api/v1/chart/4", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "4"}	2024-03-27 13:33:14.134953	\N	0	34	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1288	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546394325, "event_name": "change_explore_controls", "event_type": "user", "event_id": "zyaKKt5IHk", "visibility": "visible"}	2024-03-27 13:33:15.353346	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=overwrite&slice_id=4
1291	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:33:15.727491	\N	0	44	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1295	DashboardRestApi.get	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2024-03-27 13:33:16.861754	3	0	11	http://5.250.180.35:30980/superset/dashboard/3/
1565	SqlLabRestApi.get	7	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-28 07:06:08.36753	\N	0	31	http://5.250.180.35:30980/sqllab/
95	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 11:23:15.33764	\N	0	0	http://5.250.180.35:30980/profile/
97	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 11:23:17.791725	\N	0	3	http://5.250.180.35:30980/superset/welcome/
102	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:23:18.099091	\N	0	58	http://5.250.180.35:30980/superset/welcome/
108	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:24:27.708657	\N	0	7	http://5.250.180.35:30980/superset/welcome/
112	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:27.850192	\N	0	47	http://5.250.180.35:30980/superset/welcome/
1252	log	4	{"source": "sqlLab", "ts": 1711546138570, "event_name": "change_explore_controls", "event_type": "user", "event_id": "ktpiXwzq4", "visibility": "visible"}	2024-03-27 13:28:59.637762	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1257	log	4	{"source": "sqlLab", "ts": 1711546169458, "event_name": "change_explore_controls", "event_type": "user", "event_id": "sSVw7UN-m", "visibility": "visible"}	2024-03-27 13:29:30.528104	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1264	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:29:47.159152	\N	0	19	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1268	log	4	{"source": "sqlLab", "ts": 1711546215331, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 327506, "duration": 1564, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "rsk7oTPyt"}	2024-03-27 13:30:16.380879	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1269	log	4	{"source": "sqlLab", "ts": 1711546215351, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 329087, "duration": 3, "event_type": "timing", "trigger_event": "rsk7oTPyt"}	2024-03-27 13:30:16.380883	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1275	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:33:01.437186	\N	0	788	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1277	ExploreFormDataRestApi.post	4	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:33:01.597239	\N	0	32	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1290	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:33:15.700871	\N	0	18	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1296	DashboardRestApi.get_datasets	4	{"path": "/api/v1/dashboard/3/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "3"}	2024-03-27 13:33:16.889014	\N	0	61	http://5.250.180.35:30980/superset/dashboard/3/
1298	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 13:33:17.540701	\N	0	27	http://5.250.180.35:30980/superset/dashboard/3/
1307	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546401071, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "m0tF2uByj", "visibility": "visible"}	2024-03-27 13:33:22.098415	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1309	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 13:33:28.102795	\N	0	29	http://5.250.180.35:30980/superset/dashboard/3/
1312	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:33:31.941586	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1317	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 13:33:33.514715	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1566	DatabaseRestApi.get_list	7	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-28 07:06:08.658804	\N	0	94	http://5.250.180.35:30980/sqllab/
96	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 11:23:17.16391	\N	0	74	\N
101	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:23:18.095228	\N	0	196	http://5.250.180.35:30980/superset/welcome/
111	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:27.785635	\N	0	75	http://5.250.180.35:30980/superset/welcome/
1253	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:29:01.273279	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1262	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:29:38.571061	\N	0	24	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1267	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:30:15.305687	\N	0	1455	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1271	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:32:49.353024	\N	0	25	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1278	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "5", "datasource_type": "table", "save_action": "saveas", "slice_id": "4", "viz_type": "pivot_table_v2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:33:02.28818	\N	4	1657	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1283	DashboardRestApi.post	4	{"path": "/api/v1/dashboard/", "object_ref": "DashboardRestApi.post"}	2024-03-27 13:33:13.955985	\N	0	8	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1286	ExploreRestApi.get	4	{"path": "/api/v1/explore/", "form_data_key": "nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a", "viz_type": "pivot_table_v2", "datasource_id": "5", "datasource_type": "table", "save_action": "overwrite", "slice_id": "4", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:33:14.298773	\N	4	54	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=overwrite&slice_id=4
1292	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 13:33:15.808557	\N	0	11	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1297	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 13:33:17.062967	\N	0	17	http://5.250.180.35:30980/superset/dashboard/3/
1299	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546395632, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "dCKCwKdCl", "visibility": "visible"}	2024-03-27 13:33:17.926555	\N	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1300	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546396006, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 508111, "duration": -507737, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "dCKCwKdCl"}	2024-03-27 13:33:17.926558	\N	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1301	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546396745, "event_name": "spa_navigation", "path": "/superset/dashboard/3/", "event_type": "user", "event_id": "7si0DvEtJ", "visibility": "visible"}	2024-03-27 13:33:17.92656	\N	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1302	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546396900, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 155, "is_empty": false, "is_published": false, "event_type": "user", "event_id": "iJMjMOzIRO", "visibility": "visible"}	2024-03-27 13:33:17.926561	\N	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1313	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:33:32.051021	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
99	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:23:18.056556	\N	0	225	http://5.250.180.35:30980/superset/welcome/
104	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 11:23:18.207391	\N	0	11	http://5.250.180.35:30980/superset/welcome/
106	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:23:54.845244	\N	0	0	\N
110	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:27.783467	\N	0	91	http://5.250.180.35:30980/superset/welcome/
115	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:24:27.960159	\N	0	11	http://5.250.180.35:30980/superset/welcome/
1254	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:29:01.566581	\N	0	1347	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1258	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:29:32.093112	\N	0	23	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1265	log	4	{"source": "sqlLab", "ts": 1711546212846, "event_name": "change_explore_controls", "event_type": "user", "event_id": "rsk7oTPyt", "visibility": "visible"}	2024-03-27 13:30:13.909452	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1272	ChartRestApi.post	4	{"path": "/api/v1/chart/", "object_ref": "ChartRestApi.post"}	2024-03-27 13:33:00.312444	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1276	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546380501, "event_name": "change_explore_controls", "event_type": "user", "event_id": "HpmK0mf5h0", "visibility": "visible"}	2024-03-27 13:33:01.525799	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1279	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546382314, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 494288, "duration": 1765, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "HpmK0mf5h0"}	2024-03-27 13:33:03.355081	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1280	log	4	{"source": "explore", "source_id": 4, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546382333, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 496068, "duration": 4, "event_type": "timing", "trigger_event": "HpmK0mf5h0"}	2024-03-27 13:33:03.355084	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1284	DashboardRestApi.get	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2024-03-27 13:33:14.032959	3	0	5	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1293	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "5", "datasource_type": "table", "form_data_key": "nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a", "save_action": "overwrite", "slice_id": "4", "viz_type": "pivot_table_v2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:33:15.981928	\N	4	1572	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=overwrite&slice_id=4
1303	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:33:18.185854	3	4	1129	http://5.250.180.35:30980/superset/dashboard/3/
1308	DashboardRestApi.put	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "3"}	2024-03-27 13:33:27.498157	\N	0	72	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1310	DashboardRestApi.put	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "3"}	2024-03-27 13:33:29.15473	\N	0	23	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
100	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 11:23:18.069956	\N	0	212	http://5.250.180.35:30980/superset/welcome/
105	log	2	{"source": "sqlLab", "ts": 1711538597751, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "gR5sbCsCxB", "visibility": "visible"}	2024-03-27 11:23:18.84664	\N	0	0	http://5.250.180.35:30980/superset/welcome/
109	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:27.739449	\N	0	41	http://5.250.180.35:30980/superset/welcome/
114	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:24:27.95534	\N	0	11	http://5.250.180.35:30980/superset/welcome/
116	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:24:43.718955	\N	0	0	\N
117	welcome	3	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:24:58.699192	\N	0	76	\N
118	LogRestApi.recent_activity	3	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:24:59.493235	\N	0	10	http://5.250.180.35:30980/superset/welcome/
119	SavedQueryRestApi.get_list	3	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'3')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "3"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:59.548296	\N	0	42	http://5.250.180.35:30980/superset/welcome/
120	ChartRestApi.get_list	3	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'3')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "3"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:59.591609	\N	0	98	http://5.250.180.35:30980/superset/welcome/
121	DashboardRestApi.get_list	3	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'3')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "3"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:59.592136	\N	0	92	http://5.250.180.35:30980/superset/welcome/
122	ChartRestApi.get_list	3	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:59.64092	\N	0	62	http://5.250.180.35:30980/superset/welcome/
123	DashboardRestApi.get_list	3	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:24:59.642184	\N	0	51	http://5.250.180.35:30980/superset/welcome/
124	ChartRestApi.info	3	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:24:59.731456	\N	0	11	http://5.250.180.35:30980/superset/welcome/
125	DashboardRestApi.info	3	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:24:59.73668	\N	0	11	http://5.250.180.35:30980/superset/welcome/
126	log	3	{"source": "sqlLab", "ts": 1711542299426, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "YC7rbeB0hj", "visibility": "visible"}	2024-03-27 12:25:00.456717	\N	0	0	http://5.250.180.35:30980/superset/welcome/
127	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:09.720299	\N	0	0	\N
128	welcome	4	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:15.479525	\N	0	80	\N
129	LogRestApi.recent_activity	4	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:25:16.309294	\N	0	4	http://5.250.180.35:30980/superset/welcome/
130	SavedQueryRestApi.get_list	4	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:16.362654	\N	0	30	http://5.250.180.35:30980/superset/welcome/
131	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:16.418298	\N	0	87	http://5.250.180.35:30980/superset/welcome/
132	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:16.42556	\N	0	95	http://5.250.180.35:30980/superset/welcome/
133	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:16.469164	\N	0	68	http://5.250.180.35:30980/superset/welcome/
134	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:16.471243	\N	0	46	http://5.250.180.35:30980/superset/welcome/
135	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:25:16.578971	\N	0	9	http://5.250.180.35:30980/superset/welcome/
136	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:25:16.5822	\N	0	16	http://5.250.180.35:30980/superset/welcome/
142	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:24.573487	\N	0	95	http://5.250.180.35:30980/superset/welcome/
147	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:25:24.727379	\N	0	12	http://5.250.180.35:30980/superset/welcome/
154	DashboardRestApi.get_list	5	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'5')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "5"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:51.867462	\N	0	88	http://5.250.180.35:30980/superset/welcome/
159	log	5	{"source": "sqlLab", "ts": 1711542351710, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "jOR-xiJB5i", "visibility": "visible"}	2024-03-27 12:25:52.803792	\N	0	0	http://5.250.180.35:30980/superset/welcome/
165	DashboardRestApi.get_list	6	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'6')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "6"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:08.729099	\N	0	84	http://5.250.180.35:30980/superset/welcome/
168	ChartRestApi.info	6	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:26:08.87912	\N	0	7	http://5.250.180.35:30980/superset/welcome/
176	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:24.500234	\N	0	102	http://5.250.180.35:30980/superset/welcome/
181	log	7	{"source": "sqlLab", "ts": 1711542384327, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "60S3cLNaIs", "visibility": "visible"}	2024-03-27 12:26:25.362897	\N	0	0	http://5.250.180.35:30980/superset/welcome/
185	SavedQueryRestApi.get_list	8	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'8')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "8"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:39.237527	\N	0	31	http://5.250.180.35:30980/superset/welcome/
191	DashboardRestApi.info	8	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:26:39.569854	\N	0	15	http://5.250.180.35:30980/superset/welcome/
1259	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:29:32.593776	\N	0	1538	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1263	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:29:44.745452	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1270	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:32:42.191589	\N	0	24	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1273	ExploreRestApi.get	4	{"path": "/api/v1/explore/", "viz_type": "pivot_table_v2", "datasource_id": "5", "datasource_type": "table", "save_action": "saveas", "slice_id": "4", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:33:00.471404	\N	4	32	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1281	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(columns:!(id,dashboard_title),filters:!((col:dashboard_title,opr:ct,value:''),(col:owners,opr:rel_m_m,value:4)),order_column:dashboard_title,page:0,page_size:100)", "rison": {"columns": ["id", "dashboard_title"], "filters": [{"col": "dashboard_title", "opr": "ct", "value": ""}, {"col": "owners", "opr": "rel_m_m", "value": 4}], "order_column": "dashboard_title", "page": 0, "page_size": 100}}	2024-03-27 13:33:08.089853	\N	0	43	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=saveas&slice_id=4
1287	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:33:15.273678	\N	0	799	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=overwrite&slice_id=4
1289	ExploreFormDataRestApi.post	4	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:33:15.436182	\N	0	33	http://5.250.180.35:30980/explore/?form_data_key=nmpgIsAjKZZtR8RyH9xijWXb50Qw8-DS12Ck7E6w7dFEn2z6tv08FyZ9Y0kJ0e2a&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table&save_action=overwrite&slice_id=4
1294	DashboardRestApi.get_charts	4	{"path": "/api/v1/dashboard/3/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "3"}	2024-03-27 13:33:16.844435	\N	0	21	http://5.250.180.35:30980/superset/dashboard/3/
137	log	4	{"source": "sqlLab", "ts": 1711542316248, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "aT5oM4j3hp", "visibility": "visible"}	2024-03-27 12:25:17.278397	\N	0	0	http://5.250.180.35:30980/superset/welcome/
141	SavedQueryRestApi.get_list	4	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:24.518153	\N	0	32	http://5.250.180.35:30980/superset/welcome/
146	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:25:24.718023	\N	0	13	http://5.250.180.35:30980/superset/welcome/
153	ChartRestApi.get_list	5	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'5')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "5"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:51.865528	\N	0	84	http://5.250.180.35:30980/superset/welcome/
157	ChartRestApi.info	5	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:25:52.05152	\N	0	8	http://5.250.180.35:30980/superset/welcome/
164	ChartRestApi.get_list	6	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'6')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "6"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:08.728737	\N	0	95	http://5.250.180.35:30980/superset/welcome/
170	log	6	{"source": "sqlLab", "ts": 1711542368566, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "GUHASg_svm", "visibility": "visible"}	2024-03-27 12:26:09.598414	\N	0	0	http://5.250.180.35:30980/superset/welcome/
174	SavedQueryRestApi.get_list	7	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:24.436839	\N	0	31	http://5.250.180.35:30980/superset/welcome/
179	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:26:24.635273	\N	0	11	http://5.250.180.35:30980/superset/welcome/
187	ChartRestApi.get_list	8	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'8')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "8"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:39.288706	\N	0	109	http://5.250.180.35:30980/superset/welcome/
192	log	8	{"source": "sqlLab", "ts": 1711542399114, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "HOUNElPN3w", "visibility": "visible"}	2024-03-27 12:26:40.146678	\N	0	0	http://5.250.180.35:30980/superset/welcome/
1304	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546398211, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 268, "duration": 1199, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "iJMjMOzIRO"}	2024-03-27 13:33:19.253983	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1305	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546398228, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 1479, "duration": 4, "event_type": "timing", "trigger_event": "iJMjMOzIRO"}	2024-03-27 13:33:19.253986	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1315	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:33:33.414871	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1567	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-28 07:06:09.136036	\N	0	522	http://5.250.180.35:30980/sqllab/
1568	log	7	{"source": "sqlLab", "ts": 1711609568234, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "hnkyOvnjHs", "visibility": "visible"}	2024-03-28 07:06:09.270137	\N	0	0	http://5.250.180.35:30980/sqllab/
1571	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:06:12.806791	\N	0	112	http://5.250.180.35:30980/sqllab/
1573	log	7	{"source": "sqlLab", "source_id": "5", "db_id": 1, "schema": null, "ts": 1711609579912, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.36, "query_count": 0, "event_type": "user", "event_id": "CYMWhDolT", "visibility": "visible"}	2024-03-28 07:06:20.946742	\N	0	0	http://5.250.180.35:30980/sqllab/
138	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:21.051385	\N	0	0	http://5.250.180.35:30980/superset/welcome/
140	LogRestApi.recent_activity	4	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:25:24.42656	\N	0	2	http://5.250.180.35:30980/superset/welcome/
145	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:24.630128	\N	0	40	http://5.250.180.35:30980/superset/welcome/
149	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:43.052249	\N	0	0	\N
150	welcome	5	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:51.01393	\N	0	89	\N
155	DashboardRestApi.get_list	5	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:51.940736	\N	0	54	http://5.250.180.35:30980/superset/welcome/
160	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:59.775076	\N	0	0	\N
161	welcome	6	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:07.873929	\N	0	74	\N
166	DashboardRestApi.get_list	6	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:08.777422	\N	0	50	http://5.250.180.35:30980/superset/welcome/
171	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:15.952453	\N	0	0	\N
172	welcome	7	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:23.585951	\N	0	84	\N
177	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:24.540082	\N	0	57	http://5.250.180.35:30980/superset/welcome/
182	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:31.449905	\N	0	0	\N
183	welcome	8	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:38.419359	\N	0	83	\N
188	DashboardRestApi.get_list	8	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:39.453961	\N	0	193	http://5.250.180.35:30980/superset/welcome/
1306	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:4)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 4}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:33:21.214878	\N	0	54	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1311	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:33:31.912419	\N	0	23	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1316	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:33:33.426642	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1569	DatabaseRestApi.tables	7	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-28 07:06:09.581068	\N	0	368	http://5.250.180.35:30980/sqllab/
1574	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:06:24.567031	\N	0	427	http://5.250.180.35:30980/sqllab/
139	welcome	4	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:25:23.802245	\N	0	82	\N
144	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:24.615976	\N	0	68	http://5.250.180.35:30980/superset/welcome/
152	SavedQueryRestApi.get_list	5	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'5')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "5"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:51.824972	\N	0	26	http://5.250.180.35:30980/superset/welcome/
158	DashboardRestApi.info	5	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:25:52.055237	\N	0	16	http://5.250.180.35:30980/superset/welcome/
163	SavedQueryRestApi.get_list	6	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'6')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "6"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:08.675942	\N	0	37	http://5.250.180.35:30980/superset/welcome/
169	DashboardRestApi.info	6	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:26:08.882896	\N	0	15	http://5.250.180.35:30980/superset/welcome/
175	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:24.4811	\N	0	82	http://5.250.180.35:30980/superset/welcome/
180	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:26:24.640314	\N	0	12	http://5.250.180.35:30980/superset/welcome/
186	DashboardRestApi.get_list	8	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'8')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "8"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:39.275701	\N	0	90	http://5.250.180.35:30980/superset/welcome/
190	ChartRestApi.info	8	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:26:39.569174	\N	0	7	http://5.250.180.35:30980/superset/welcome/
1314	log	7	{"source": "sqlLab", "ts": 1711546411807, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "_2zpTiQk3L", "visibility": "visible"}	2024-03-27 13:33:32.838761	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1570	DatabaseRestApi.function_names	7	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-28 07:06:09.729726	\N	0	1103	http://5.250.180.35:30980/sqllab/
1572	DatabaseRestApi.get_list	7	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-28 07:06:20.114601	\N	0	38	http://5.250.180.35:30980/sqllab/
143	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:24.573826	\N	0	89	http://5.250.180.35:30980/superset/welcome/
148	log	4	{"source": "sqlLab", "ts": 1711542324375, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "xla9caw-vG", "visibility": "visible"}	2024-03-27 12:25:25.408632	\N	0	0	http://5.250.180.35:30980/superset/welcome/
151	LogRestApi.recent_activity	5	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:25:51.796863	\N	0	13	http://5.250.180.35:30980/superset/welcome/
156	ChartRestApi.get_list	5	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:25:51.941124	\N	0	60	http://5.250.180.35:30980/superset/welcome/
162	LogRestApi.recent_activity	6	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:26:08.624357	\N	0	3	http://5.250.180.35:30980/superset/welcome/
167	ChartRestApi.get_list	6	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:08.781659	\N	0	53	http://5.250.180.35:30980/superset/welcome/
173	LogRestApi.recent_activity	7	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:26:24.3825	\N	0	4	http://5.250.180.35:30980/superset/welcome/
178	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:24.544038	\N	0	56	http://5.250.180.35:30980/superset/welcome/
184	LogRestApi.recent_activity	8	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:26:39.170267	\N	0	3	http://5.250.180.35:30980/superset/welcome/
189	ChartRestApi.get_list	8	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:26:39.458315	\N	0	182	http://5.250.180.35:30980/superset/welcome/
193	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:41.49519	\N	0	0	http://5.250.180.35:30980/superset/welcome/
194	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:26:50.20852	\N	0	0	\N
195	DatabaseRestApi.info	2	{"path": "/api/v1/database/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:27:18.115627	\N	0	14	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
196	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:27:18.12465	\N	0	65	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
197	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:27:18.144278	\N	0	66	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
198	log	2	{"source": "sqlLab", "ts": 1711542437878, "event_name": "spa_navigation", "path": "/databaseview/list/", "event_type": "user", "event_id": "dKWYEWd0A", "visibility": "visible"}	2024-03-27 12:27:18.96604	\N	0	0	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
199	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:27:20.161509	\N	0	11	http://5.250.180.35:30980/superset/welcome/
200	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:27:20.200359	\N	0	35	http://5.250.180.35:30980/superset/welcome/
201	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:27:20.23281	\N	0	69	http://5.250.180.35:30980/superset/welcome/
202	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:27:20.282255	\N	0	77	http://5.250.180.35:30980/superset/welcome/
203	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:27:20.30424	\N	0	61	http://5.250.180.35:30980/superset/welcome/
204	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:27:20.32477	\N	0	41	http://5.250.180.35:30980/superset/welcome/
205	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:27:20.444773	\N	0	6	http://5.250.180.35:30980/superset/welcome/
208	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:27:58.193707	\N	0	0	\N
206	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:27:20.447432	\N	0	13	http://5.250.180.35:30980/superset/welcome/
213	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:28:04.218966	\N	0	164	http://5.250.180.35:30980/superset/welcome/
218	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:28:04.433325	\N	0	7	http://5.250.180.35:30980/superset/welcome/
225	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:28:31.46509	\N	0	34	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
230	DatabaseRestApi.available	1	{"path": "/api/v1/database/available/", "object_ref": "DatabaseRestApi.available"}	2024-03-27 12:29:10.207932	\N	0	50	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
237	DatabaseRestApi.available	1	{"path": "/api/v1/database/available/", "object_ref": "DatabaseRestApi.available"}	2024-03-27 12:30:04.363123	\N	0	45	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
242	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:30:10.298558	\N	0	13	http://5.250.180.35:30980/sqllab/
244	root	2	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-27 12:33:19.096362	\N	0	70	\N
250	DatabaseRestApi.schemas	2	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 12:33:41.161974	\N	0	516	http://5.250.180.35:30980/sqllab/
255	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 12:33:45.4477	\N	0	467	http://5.250.180.35:30980/sqllab/
258	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-27 12:33:54.415791	\N	0	284	http://5.250.180.35:30980/sqllab/
265	DatabaseRestApi.function_names	2	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-27 12:34:03.007234	\N	0	1073	http://5.250.180.35:30980/sqllab/
267	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:34:09.065983	\N	0	507	http://5.250.180.35:30980/sqllab/
1318	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711546413315, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "WkfYWq9Zu", "visibility": "visible"}	2024-03-27 13:33:34.337603	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
207	log	2	{"source": "sqlLab", "ts": 1711542440092, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "fge2OO_1x", "visibility": "visible"}	2024-03-27 12:27:21.129602	\N	0	0	http://5.250.180.35:30980/superset/welcome/
209	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:28:03.289825	\N	0	169	\N
215	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 12:28:04.238663	\N	0	131	http://5.250.180.35:30980/superset/welcome/
223	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:28:31.371603	\N	0	35	http://5.250.180.35:30980/databaseview/list/
228	log	1	{"source": "sqlLab", "ts": 1711542511268, "event_name": "spa_navigation", "path": "/databaseview/list/", "event_type": "user", "event_id": "7MrZpRopq3", "visibility": "visible"}	2024-03-27 12:28:32.303309	\N	0	0	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
231	test_connection_attempt	1	{"path": "/api/v1/database/test_connection/", "engine": "TrinoEngineSpec"}	2024-03-27 12:29:28.200161	\N	0	\N	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
238	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:30:05.326764	\N	0	21	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
245	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:33:19.669809	\N	0	14	http://5.250.180.35:30980/sqllab/
251	log	2	{"source": "sqlLab", "ts": 1711542820194, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "FdweRREzJP", "visibility": "visible"}	2024-03-27 12:33:41.630548	\N	0	0	http://5.250.180.35:30980/sqllab/
252	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": null, "ts": 1711542820458, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.36, "query_count": 0, "event_type": "user", "event_id": "9cladjpWji", "visibility": "visible"}	2024-03-27 12:33:41.630552	\N	0	0	http://5.250.180.35:30980/sqllab/
259	root	2	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-27 12:34:01.238726	\N	0	86	\N
264	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-27 12:34:02.807514	\N	0	340	http://5.250.180.35:30980/sqllab/
268	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:34:13.328837	\N	0	205	http://5.250.180.35:30980/sqllab/
1319	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:20:04.452145	\N	0	44	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1323	DashboardRestApi.get_charts	4	{"path": "/api/v1/dashboard/3/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "3"}	2024-03-27 14:20:20.112807	\N	0	22	http://5.250.180.35:30980/superset/dashboard/3/
1331	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549222025, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 254, "duration": 1776, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "Gcnv71xr6l"}	2024-03-27 14:20:23.100835	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1332	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549222057, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 2047, "duration": 15, "event_type": "timing", "trigger_event": "Gcnv71xr6l"}	2024-03-27 14:20:23.100839	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1338	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:20:30.72543	\N	0	52	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1343	DashboardRestApi.get_datasets	4	{"path": "/api/v1/dashboard/3/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "3"}	2024-03-27 14:20:31.762243	\N	0	56	http://5.250.180.35:30980/superset/dashboard/3/
1345	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 14:20:32.306077	\N	0	28	http://5.250.180.35:30980/superset/dashboard/3/
1352	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549234442, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "nG6F8sNyi", "visibility": "visible"}	2024-03-27 14:20:35.472078	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1360	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 14:21:25.911532	\N	0	31	http://5.250.180.35:30980/superset/dashboard/3/
1369	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:21:35.838987	\N	0	59	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
210	LogRestApi.recent_activity	1	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:28:04.042467	\N	0	11	http://5.250.180.35:30980/superset/welcome/
216	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:28:04.293371	\N	0	72	http://5.250.180.35:30980/superset/welcome/
221	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:28:27.01409	\N	0	24	http://5.250.180.35:30980/sqllab/
224	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 12:28:31.378698	\N	0	18	http://5.250.180.35:30980/databaseview/list/
232	test_connection_success	1	{"path": "/api/v1/database/test_connection/", "engine": "TrinoEngineSpec"}	2024-03-27 12:29:28.616415	\N	0	\N	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
234	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2024-03-27 12:30:04.09708	\N	0	480	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
239	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:30:05.331911	\N	0	23	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
243	log	2	{"source": "sqlLab", "ts": 1711542610125, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "B6dJjBE8DJ", "visibility": "visible"}	2024-03-27 12:30:11.2446	\N	0	0	http://5.250.180.35:30980/sqllab/
254	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-27 12:33:43.344588	\N	0	293	http://5.250.180.35:30980/sqllab/
257	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": null, "ts": 1711542830087, "event_name": "sqllab_fetch_failed_query", "has_err": true, "start_offset": 1711542829469, "error_type": "GENERIC_DB_ENGINE_ERROR", "error_details": "Issue 1002 - The database returned an unexpected error.", "event_type": "timing", "trigger_event": "9cladjpWji"}	2024-03-27 12:33:51.139627	\N	0	0	http://5.250.180.35:30980/sqllab/
261	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:34:01.940686	\N	0	40	http://5.250.180.35:30980/sqllab/
266	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711542844774, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.52, "query_count": 0, "event_type": "user", "event_id": "Ku-baM0Cx", "visibility": "visible"}	2024-03-27 12:34:05.873798	\N	0	0	http://5.250.180.35:30980/sqllab/
1320	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:20:04.458797	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1325	DashboardRestApi.get_datasets	4	{"path": "/api/v1/dashboard/3/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "3"}	2024-03-27 14:20:20.159311	\N	0	61	http://5.250.180.35:30980/superset/dashboard/3/
1327	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 14:20:20.767222	\N	0	27	http://5.250.180.35:30980/superset/dashboard/3/
1333	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:20:24.492146	\N	0	11	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1337	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:20:30.70219	\N	0	19	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1341	DashboardRestApi.get_charts	4	{"path": "/api/v1/dashboard/3/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "3"}	2024-03-27 14:20:31.689794	\N	0	20	http://5.250.180.35:30980/superset/dashboard/3/
1349	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549233307, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 203, "duration": 1494, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "TDFRrxVtrA"}	2024-03-27 14:20:34.352034	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1350	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549233324, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 1705, "duration": 8, "event_type": "timing", "trigger_event": "TDFRrxVtrA"}	2024-03-27 14:20:34.352037	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1354	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549262878, "event_name": "load_chart", "slice_id": 3, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "2__table", "start_offset": 30436, "duration": 832, "has_extra_filters": false, "viz_type": "big_number_total", "data_age": null, "event_type": "timing", "trigger_event": "nG6F8sNyi"}	2024-03-27 14:21:03.991115	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
211	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:28:04.128193	\N	0	72	http://5.250.180.35:30980/superset/welcome/
217	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:28:04.332814	\N	0	31	http://5.250.180.35:30980/superset/welcome/
1321	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 14:20:04.867404	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1326	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 14:20:20.263314	\N	0	13	http://5.250.180.35:30980/superset/dashboard/3/
1328	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549219996, "event_name": "spa_navigation", "path": "/superset/dashboard/3/", "event_type": "user", "event_id": "yLct9Fo7j1", "visibility": "visible"}	2024-03-27 14:20:21.230098	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1329	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549220193, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 197, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "Gcnv71xr6l", "visibility": "visible"}	2024-03-27 14:20:21.230102	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1335	ChartRestApi.favorite_status	4	{"path": "/api/v1/chart/favorite_status/", "q": "!(4,3)", "object_ref": "ChartRestApi.favorite_status", "rison": [4, 3]}	2024-03-27 14:20:24.726593	\N	0	18	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1340	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549230552, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "xmgVVpk7q", "visibility": "visible"}	2024-03-27 14:20:31.583655	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1348	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:20:33.281265	3	4	1416	http://5.250.180.35:30980/superset/dashboard/3/
1356	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:21:04.288475	3	4	1071	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1364	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:4)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 4}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 14:21:29.048316	\N	0	54	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1371	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549295694, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "UgZgzAoB7", "visibility": "visible"}	2024-03-27 14:21:36.720503	3	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1376	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549995857, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "co0IyGIPT", "visibility": "visible"}	2024-03-27 14:33:17.199674	3	0	0	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=5__table
1377	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549996172, "event_name": "mount_explorer", "event_type": "user", "event_id": "44U1j9Z5NT", "visibility": "visible"}	2024-03-27 14:33:17.199678	3	0	0	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=5__table
1380	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:33:41.849516	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1385	DashboardRestApi.get_datasets	4	{"path": "/api/v1/dashboard/3/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "3"}	2024-03-27 14:33:43.007403	\N	0	84	http://5.250.180.35:30980/superset/dashboard/3/
1390	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:33:45.483364	\N	0	17	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
212	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:28:04.201619	\N	0	160	http://5.250.180.35:30980/superset/welcome/
214	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:28:04.228072	\N	0	103	http://5.250.180.35:30980/superset/welcome/
219	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:28:04.437068	\N	0	15	http://5.250.180.35:30980/superset/welcome/
220	log	1	{"source": "sqlLab", "ts": 1711542483970, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "5qNAI21G8u", "visibility": "visible"}	2024-03-27 12:28:05.005649	\N	0	0	http://5.250.180.35:30980/superset/welcome/
222	log	2	{"source": "sqlLab", "ts": 1711542506697, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "-E_5pvk8r", "visibility": "visible"}	2024-03-27 12:28:27.750521	\N	0	0	http://5.250.180.35:30980/sqllab/
226	DatabaseRestApi.info	1	{"path": "/api/v1/database/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:28:31.477625	\N	0	15	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
227	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:28:31.494097	\N	0	23	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
229	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:29:10.191349	\N	0	23	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
233	DatabaseRestApi.test_connection	1	{"path": "/api/v1/database/test_connection/", "object_ref": "DatabaseRestApi.test_connection"}	2024-03-27 12:29:28.620691	\N	0	434	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
235	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:30:04.324706	\N	0	24	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
236	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:30:04.346124	\N	0	27	http://5.250.180.35:30980/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
240	log	1	{"source": "sqlLab", "ts": 1711542605189, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "1_ZIYVzU0", "visibility": "visible"}	2024-03-27 12:30:06.225184	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
241	root	2	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-27 12:30:09.670482	\N	0	74	\N
246	log	2	{"source": "sqlLab", "ts": 1711542799511, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "kMvqtYX7w2", "visibility": "visible"}	2024-03-27 12:33:20.549699	\N	0	0	http://5.250.180.35:30980/sqllab/
247	root	2	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-27 12:33:39.735679	\N	0	75	\N
248	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:33:40.329571	\N	0	16	http://5.250.180.35:30980/sqllab/
249	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:33:40.705045	\N	0	60	http://5.250.180.35:30980/sqllab/
253	DatabaseRestApi.function_names	2	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-27 12:33:41.912145	\N	0	1264	http://5.250.180.35:30980/sqllab/
256	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:33:45.748855	\N	0	804	http://5.250.180.35:30980/sqllab/
260	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:34:01.73542	\N	0	20	http://5.250.180.35:30980/sqllab/
262	DatabaseRestApi.schemas	2	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 12:34:02.39365	\N	0	456	http://5.250.180.35:30980/sqllab/
263	log	2	{"source": "sqlLab", "ts": 1711542841637, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "63yYCTF8yW", "visibility": "visible"}	2024-03-27 12:34:02.672041	\N	0	0	http://5.250.180.35:30980/sqllab/
269	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-27 12:34:54.858721	\N	0	907	http://5.250.180.35:30980/sqllab/
270	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!t,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": true, "schema_name": "compliance_analytics"}}	2024-03-27 12:34:57.054523	\N	0	233	http://5.250.180.35:30980/sqllab/
271	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 12:35:00.709252	\N	0	870	http://5.250.180.35:30980/sqllab/
272	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:35:01.01325	\N	0	1210	http://5.250.180.35:30980/sqllab/
274	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542914991)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542914991}}	2024-03-27 12:35:22.341606	\N	0	2	http://5.250.180.35:30980/sqllab/
276	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542914991)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542914991}}	2024-03-27 12:35:28.389715	\N	0	4	http://5.250.180.35:30980/sqllab/
278	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542922250)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542922250}}	2024-03-27 12:35:40.408307	\N	0	4	http://5.250.180.35:30980/sqllab/
284	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:36:04.179233	\N	0	1176	http://5.250.180.35:30980/sqllab/
285	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542947490)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542947490}}	2024-03-27 12:36:13.300123	\N	0	3	http://5.250.180.35:30980/sqllab/
288	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711542992474, "event_name": "sqllab_fetch_failed_query", "has_err": true, "start_offset": 1711542991677, "error_type": "GENERIC_DB_ENGINE_ERROR", "error_details": "Issue 1002 - The database returned an unexpected error.", "event_type": "timing", "trigger_event": "Ku-baM0Cx"}	2024-03-27 12:36:33.511205	\N	0	0	http://5.250.180.35:30980/sqllab/
297	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711543047966, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "pm9IJK5Dg", "visibility": "visible"}	2024-03-27 12:37:29.003383	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
300	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:37:39.477619	\N	0	35	http://5.250.180.35:30980/sqllab/
302	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711543061680, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.79, "query_count": 0, "event_type": "user", "event_id": "8c6501Bvnd", "visibility": "visible"}	2024-03-27 12:37:42.749594	\N	0	0	http://5.250.180.35:30980/sqllab/
308	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:37:57.411733	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
314	DatabaseRestApi.tables	1	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:information_schema)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "information_schema"}}	2024-03-27 12:38:01.682412	\N	0	213	http://5.250.180.35:30980/dataset/add/
318	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:41:28.923637	\N	0	21	http://5.250.180.35:30980/sqllab/
323	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-27 12:41:29.953454	\N	0	282	http://5.250.180.35:30980/sqllab/
328	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:41:34.852171	\N	0	19	http://5.250.180.35:30980/dataset/add/
333	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 12:42:05.369244	\N	0	27	http://5.250.180.35:30980/dataset/add/
338	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:42:36.62194	\N	0	1009	http://5.250.180.35:30980/dataset/add/
342	DatasetRestApi.post	2	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:44:14.770156	\N	0	1206	http://5.250.180.35:30980/dataset/add/
347	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711543459764, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "Evk5I9SKz", "visibility": "visible"}	2024-03-27 12:44:20.801174	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1322	log	2	{"source": "sqlLab", "ts": 1711549203992, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "MmpacbliW8", "visibility": "visible"}	2024-03-27 14:20:05.038388	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1330	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:20:21.998527	3	4	1694	http://5.250.180.35:30980/superset/dashboard/3/
273	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542836755)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542836755}}	2024-03-27 12:35:20.387135	\N	0	4	http://5.250.180.35:30980/sqllab/
279	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:35:41.958365	\N	0	2534	http://5.250.180.35:30980/sqllab/
281	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:35:54.902187	\N	0	3044	http://5.250.180.35:30980/sqllab/
292	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:36:56.194146	\N	0	1090	http://5.250.180.35:30980/sqllab/
294	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:37:06.951747	\N	0	2755	http://5.250.180.35:30980/sqllab/
299	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:'')),order_column:table_name,order_direction:asc,page:0,page_size:100)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": ""}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:37:36.377221	\N	0	56	http://5.250.180.35:30980/chart/add
304	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:37:44.537075	\N	0	2782	http://5.250.180.35:30980/sqllab/
306	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 12:37:57.340498	\N	0	20	http://5.250.180.35:30980/tablemodelview/list/
311	log	1	{"source": "sqlLab", "ts": 1711543078791, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "UtO2DVOJJ", "visibility": "visible"}	2024-03-27 12:37:59.825591	\N	0	0	http://5.250.180.35:30980/dataset/add/
324	DatabaseRestApi.function_names	2	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-27 12:41:30.150002	\N	0	1039	http://5.250.180.35:30980/sqllab/
329	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711543294681, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "OK1VWbogp", "visibility": "visible"}	2024-03-27 12:41:35.777331	\N	0	0	http://5.250.180.35:30980/dataset/add/
334	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-27 12:42:05.944545	\N	0	604	http://5.250.180.35:30980/dataset/add/
339	DatasetRestApi.post	2	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:42:38.52594	\N	0	445	http://5.250.180.35:30980/dataset/add/
343	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer_enriched)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer_enriched"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 12:44:15.011049	\N	0	42	http://5.250.180.35:30980/chart/add/?dataset=customer_enriched
348	DatasetRestApi.get	2	{"path": "/api/v1/dataset/1", "url_rule": "/api/v1/dataset/<int:pk>", "rison": {}}	2024-03-27 12:44:22.225265	\N	0	94	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1324	DashboardRestApi.get	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2024-03-27 14:20:20.114309	3	0	9	http://5.250.180.35:30980/superset/dashboard/3/
1334	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:20:24.492523	\N	0	58	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1339	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 14:20:30.907331	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1344	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 14:20:31.803358	\N	0	12	http://5.250.180.35:30980/superset/dashboard/3/
1346	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549231611, "event_name": "spa_navigation", "path": "/superset/dashboard/3/", "event_type": "user", "event_id": "5lLlIT8abr", "visibility": "visible"}	2024-03-27 14:20:32.772503	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1347	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549231742, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 132, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "TDFRrxVtrA", "visibility": "visible"}	2024-03-27 14:20:32.772507	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1353	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [], "metrics": ["count"], "annotation_layers": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 3}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:21:02.849289	3	3	685	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1359	DashboardRestApi.put	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "3"}	2024-03-27 14:21:25.201546	\N	0	35	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
275	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:35:22.831551	\N	0	3473	http://5.250.180.35:30980/sqllab/
277	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 12:35:29.481751	\N	0	2874	http://5.250.180.35:30980/sqllab/
282	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-27 12:36:00.685009	\N	0	598	http://5.250.180.35:30980/sqllab/
286	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711542973495, "event_name": "sqllab_fetch_failed_query", "has_err": true, "start_offset": 1711542972538, "error_type": "GENERIC_DB_ENGINE_ERROR", "error_details": "Issue 1002 - The database returned an unexpected error.", "event_type": "timing", "trigger_event": "Ku-baM0Cx"}	2024-03-27 12:36:14.534377	\N	0	0	http://5.250.180.35:30980/sqllab/
287	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711542980877, "event_name": "sqllab_fetch_failed_query", "has_err": true, "start_offset": 1711542979761, "error_type": "GENERIC_DB_ENGINE_ERROR", "error_details": "Issue 1002 - The database returned an unexpected error.", "event_type": "timing", "trigger_event": "Ku-baM0Cx"}	2024-03-27 12:36:21.971035	\N	0	0	http://5.250.180.35:30980/sqllab/
289	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542968235)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542968235}}	2024-03-27 12:36:37.313164	\N	0	3	http://5.250.180.35:30980/sqllab/
290	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711542997665, "event_name": "sqllab_fetch_failed_query", "has_err": true, "start_offset": 1711542996884, "error_type": "GENERIC_DB_ENGINE_ERROR", "error_details": "Issue 1002 - The database returned an unexpected error.", "event_type": "timing", "trigger_event": "Ku-baM0Cx"}	2024-03-27 12:36:38.739879	\N	0	0	http://5.250.180.35:30980/sqllab/
293	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711543010169)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711543010169}}	2024-03-27 12:37:05.459527	\N	0	3	http://5.250.180.35:30980/sqllab/
296	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:37:28.191822	\N	0	27	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
298	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711543055328, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "xO2VeC-36", "visibility": "visible"}	2024-03-27 12:37:36.369976	\N	0	0	http://5.250.180.35:30980/chart/add
301	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "customer_analytics", "ts": 1711543059289, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "dYOYic_SWn", "visibility": "visible"}	2024-03-27 12:37:40.328778	\N	0	0	http://5.250.180.35:30980/sqllab/
303	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711543019677)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711543019677}}	2024-03-27 12:37:43.484117	\N	0	4	http://5.250.180.35:30980/sqllab/
305	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:37:57.325675	\N	0	30	http://5.250.180.35:30980/tablemodelview/list/
309	log	1	{"source": "sqlLab", "ts": 1711543077232, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "RlIerMMhea", "visibility": "visible"}	2024-03-27 12:37:58.266419	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
310	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:37:59.015131	\N	0	29	http://5.250.180.35:30980/dataset/add/
313	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:information_schema),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "information_schema"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 12:38:01.588098	\N	0	48	http://5.250.180.35:30980/dataset/add/
315	DatabaseRestApi.schemas	1	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-27 12:38:03.446782	\N	0	93	http://5.250.180.35:30980/dataset/add/
317	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 12:41:28.884247	\N	0	18	http://5.250.180.35:30980/sqllab/
319	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:41:28.944821	\N	0	12	http://5.250.180.35:30980/sqllab/
320	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:41:29.16204	\N	0	41	http://5.250.180.35:30980/sqllab/
322	log	2	{"source": "sqlLab", "ts": 1711543288815, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "sFvTfl2Wiz", "visibility": "visible"}	2024-03-27 12:41:29.849791	\N	0	0	http://5.250.180.35:30980/sqllab/
325	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:41:32.707609	\N	0	14	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
449	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:00:56.612798	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
280	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542935055)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542935055}}	2024-03-27 12:35:53.255497	\N	0	3	http://5.250.180.35:30980/sqllab/
283	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 12:36:03.538641	\N	0	538	http://5.250.180.35:30980/sqllab/
291	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711542992068)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711542992068}}	2024-03-27 12:36:55.453065	\N	0	3	http://5.250.180.35:30980/sqllab/
295	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:37:28.185255	\N	0	64	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
307	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:37:57.391422	\N	0	41	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
312	DatabaseRestApi.schemas	1	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 12:38:01.380342	\N	0	437	http://5.250.180.35:30980/dataset/add/
316	root	2	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-27 12:41:28.374678	\N	0	337	\N
321	DatabaseRestApi.schemas	2	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 12:41:29.602639	\N	0	489	http://5.250.180.35:30980/sqllab/
326	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:41:32.781174	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
331	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:41:43.245206	\N	0	997	http://5.250.180.35:30980/dataset/add/
336	DatasetRestApi.post	2	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:42:09.473803	\N	0	702	http://5.250.180.35:30980/dataset/add/
341	DatasetRestApi.post	2	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:44:01.329842	\N	0	832	http://5.250.180.35:30980/dataset/add/
345	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:44:19.891069	\N	0	24	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1336	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549224338, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "9vPi5CO8O", "visibility": "visible"}	2024-03-27 14:20:25.368303	3	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1342	DashboardRestApi.get	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2024-03-27 14:20:31.691759	3	0	9	http://5.250.180.35:30980/superset/dashboard/3/
1351	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:4)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 4}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 14:20:34.586074	\N	0	56	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1357	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549264316, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 31522, "duration": 1184, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "nG6F8sNyi"}	2024-03-27 14:21:05.367604	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1358	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549264340, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 32720, "duration": 10, "event_type": "timing", "trigger_event": "nG6F8sNyi"}	2024-03-27 14:21:05.367608	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1365	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549288878, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "6QE_ziLVL", "visibility": "visible"}	2024-03-27 14:21:29.910016	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1367	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 14:21:34.354001	\N	0	33	http://5.250.180.35:30980/superset/dashboard/3/
327	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711543292594, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "t5l0UlLhM", "visibility": "visible"}	2024-03-27 12:41:33.628938	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
332	DatasetRestApi.post	2	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:41:54.942954	\N	0	791	http://5.250.180.35:30980/dataset/add/
337	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:compliance_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "compliance_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 12:42:34.228139	\N	0	23	http://5.250.180.35:30980/dataset/add/
346	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:44:19.894737	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1355	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549262927, "event_name": "render_chart", "slice_id": 3, "viz_type": "big_number_total", "start_offset": 31282, "duration": 35, "event_type": "timing", "trigger_event": "nG6F8sNyi"}	2024-03-27 14:21:03.991118	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1361	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [], "metrics": ["count"], "annotation_layers": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 3}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:21:26.103736	3	3	664	http://5.250.180.35:30980/superset/dashboard/3/
1366	DashboardRestApi.put	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "3"}	2024-03-27 14:21:33.690214	\N	0	34	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1368	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:21:35.837465	\N	0	10	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1373	DatasetRestApi.get_list	4	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:'')),order_column:table_name,order_direction:asc,page:0,page_size:100)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": ""}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 14:33:05.468739	\N	0	38	http://5.250.180.35:30980/chart/add
1382	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550021709, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "b8SHgDNFX", "visibility": "visible"}	2024-03-27 14:33:42.736745	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1388	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [], "metrics": ["count"], "annotation_layers": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 3}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:33:43.878864	3	3	791	http://5.250.180.35:30980/superset/dashboard/3/
1393	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550022822, "event_name": "spa_navigation", "path": "/superset/dashboard/3/", "event_type": "user", "event_id": "H2-H2LT69c", "visibility": "visible"}	2024-03-27 14:33:46.403673	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1394	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550022970, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 148, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "sQx7iEGR23", "visibility": "visible"}	2024-03-27 14:33:46.403676	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1395	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550023907, "event_name": "load_chart", "slice_id": 3, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "2__table", "start_offset": 206, "duration": 880, "has_extra_filters": false, "viz_type": "big_number_total", "data_age": null, "event_type": "timing", "trigger_event": "sQx7iEGR23"}	2024-03-27 14:33:46.403677	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1396	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550023934, "event_name": "render_chart", "slice_id": 3, "viz_type": "big_number_total", "start_offset": 1099, "duration": 13, "event_type": "timing", "trigger_event": "sQx7iEGR23"}	2024-03-27 14:33:46.403679	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1397	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550024607, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 214, "duration": 1571, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "sQx7iEGR23"}	2024-03-27 14:33:46.40368	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1398	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550024641, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 1802, "duration": 18, "event_type": "timing", "trigger_event": "sQx7iEGR23"}	2024-03-27 14:33:46.403681	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
330	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:compliance_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "compliance_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 12:41:40.411265	\N	0	22	http://5.250.180.35:30980/dataset/add/
335	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:42:07.858821	\N	0	1003	http://5.250.180.35:30980/dataset/add/
340	DatasetRestApi.post	2	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:42:45.046896	\N	0	832	http://5.250.180.35:30980/dataset/add/
344	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711543454824, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "1s_iKHXCN", "visibility": "visible"}	2024-03-27 12:44:15.86711	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=customer_enriched
349	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:44:22.429649	\N	0	20	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
350	DatasetRestApi.get	2	{"path": "/api/v1/dataset/1", "url_rule": "/api/v1/dataset/<int:pk>", "rison": {}}	2024-03-27 12:44:48.734188	\N	0	73	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
351	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:44:48.86647	\N	0	20	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
352	DatasetRestApi.related_objects	2	{"path": "/api/v1/dataset/1/related_objects", "url_rule": "/api/v1/dataset/<pk>/related_objects", "object_ref": "DatasetRestApi.related_objects", "pk": "1"}	2024-03-27 12:58:29.621206	\N	0	10	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
353	DatasetRestApi.delete	2	{"path": "/api/v1/dataset/1", "url_rule": "/api/v1/dataset/<pk>", "object_ref": "DatasetRestApi.delete", "pk": "1"}	2024-03-27 12:58:33.214546	\N	0	25	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
354	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:58:33.318373	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
355	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:58:44.502167	\N	0	88	http://5.250.180.35:30980/users/edit/2
356	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:58:44.970665	\N	0	2	http://5.250.180.35:30980/superset/welcome/
357	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:45.051214	\N	0	34	http://5.250.180.35:30980/superset/welcome/
358	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:45.140146	\N	0	121	http://5.250.180.35:30980/superset/welcome/
359	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:45.140523	\N	0	102	http://5.250.180.35:30980/superset/welcome/
360	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:45.143905	\N	0	80	http://5.250.180.35:30980/superset/welcome/
361	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:45.165249	\N	0	71	http://5.250.180.35:30980/superset/welcome/
362	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:58:45.271027	\N	0	11	http://5.250.180.35:30980/superset/welcome/
363	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:58:45.277301	\N	0	13	http://5.250.180.35:30980/superset/welcome/
364	log	2	{"source": "sqlLab", "ts": 1711544324910, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "UrezXhGvm2", "visibility": "visible"}	2024-03-27 12:58:45.94756	\N	0	0	http://5.250.180.35:30980/superset/welcome/
365	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 12:58:46.185855	\N	0	83	http://5.250.180.35:30980/users/edit/2
366	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 12:58:46.69493	\N	0	7	http://5.250.180.35:30980/superset/welcome/
452	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544457757, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "EpNacGNz-", "visibility": "visible"}	2024-03-27 13:00:58.794952	\N	0	0	http://5.250.180.35:30980/dataset/add/
367	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:46.736999	\N	0	54	http://5.250.180.35:30980/superset/welcome/
372	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:58:46.932552	\N	0	9	http://5.250.180.35:30980/superset/welcome/
376	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 12:58:51.808899	\N	0	20	http://5.250.180.35:30980/dashboard/list/
381	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:59:26.788226	\N	0	30	http://5.250.180.35:30980/sqllab/
387	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:59:31.906126	\N	0	23	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
391	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 12:59:38.153139	\N	0	27	http://5.250.180.35:30980/dataset/add/
395	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 12:59:46.727887	\N	0	21	http://5.250.180.35:30980/chart/add/?dataset=customer
400	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:59:53.984169	\N	0	19	http://5.250.180.35:30980/dataset/add/
404	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:00:05.499818	\N	0	1330	http://5.250.180.35:30980/dataset/add/
410	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:00:07.635933	\N	0	17	http://5.250.180.35:30980/dataset/add/
414	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:00:17.895998	\N	0	1269	http://5.250.180.35:30980/dataset/add/
418	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 13:00:21.471938	\N	0	26	http://5.250.180.35:30980/sqllab/
421	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:00:21.717897	\N	0	36	http://5.250.180.35:30980/sqllab/
426	DatabaseRestApi.tables	1	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-27 13:00:28.178867	\N	0	555	http://5.250.180.35:30980/sqllab/
434	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:00:37.525324	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1362	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549286131, "event_name": "load_chart", "slice_id": 3, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "2__table", "start_offset": 53730, "duration": 790, "has_extra_filters": false, "viz_type": "big_number_total", "data_age": null, "event_type": "timing", "trigger_event": "nG6F8sNyi"}	2024-03-27 14:21:27.193236	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1363	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549286166, "event_name": "render_chart", "slice_id": 3, "viz_type": "big_number_total", "start_offset": 54544, "duration": 11, "event_type": "timing", "trigger_event": "nG6F8sNyi"}	2024-03-27 14:21:27.19324	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=4YUk5clht3TNseXB_ig17L-ad6-aS6BB5i1SavO9rAFXK5PXNiUf91TEmvD5PL4t
1370	ChartRestApi.favorite_status	4	{"path": "/api/v1/chart/favorite_status/", "q": "!(4,3)", "object_ref": "ChartRestApi.favorite_status", "rison": [4, 3]}	2024-03-27 14:21:36.049199	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1375	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 14:33:17.01214	\N	0	756	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=5__table
368	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:46.75907	\N	0	75	http://5.250.180.35:30980/superset/welcome/
373	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:58:46.950274	\N	0	13	http://5.250.180.35:30980/superset/welcome/
377	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:58:51.851873	\N	0	22	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
383	log	1	{"source": "sqlLab", "ts": 1711544366172, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "YzTPpxe6O", "visibility": "visible"}	2024-03-27 12:59:27.600909	\N	0	0	http://5.250.180.35:30980/sqllab/
384	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544366568, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.36, "query_count": 0, "event_type": "user", "event_id": "J4LEDQ1Kj", "visibility": "visible"}	2024-03-27 12:59:27.600912	\N	0	0	http://5.250.180.35:30980/sqllab/
389	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 12:59:33.424744	\N	0	18	http://5.250.180.35:30980/dataset/add/
398	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:59:48.719555	\N	0	21	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
403	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/customer_address/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:00:03.513609	\N	0	1738	http://5.250.180.35:30980/dataset/add/
407	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:00:06.56929	\N	0	15	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
413	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/customer_demographics/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:00:16.0718	\N	0	1722	http://5.250.180.35:30980/dataset/add/
417	root	1	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-27 13:00:20.816338	\N	0	164	http://5.250.180.35:30980/chart/add/?dataset=customer_demographics
422	DatabaseRestApi.schemas	1	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 13:00:22.116442	\N	0	447	http://5.250.180.35:30980/sqllab/
427	DatabaseRestApi.tables	1	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-27 13:00:29.223266	\N	0	238	http://5.250.180.35:30980/sqllab/
430	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544434007, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "rnWgJd7JF", "visibility": "visible"}	2024-03-27 13:00:35.042349	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
435	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544437421, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "D8kGq0_9F", "visibility": "visible"}	2024-03-27 13:00:38.457037	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1372	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711549296865, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "jTA4OvBuz", "visibility": "visible"}	2024-03-27 14:21:37.892885	3	0	0	http://5.250.180.35:30980/chart/add
1381	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 14:33:41.988041	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1386	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 14:33:43.036126	\N	0	13	http://5.250.180.35:30980/superset/dashboard/3/
1387	DashboardFilterStateRestApi.post	4	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-27 14:33:43.536524	\N	0	24	http://5.250.180.35:30980/superset/dashboard/3/
1392	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-27 14:33:45.662722	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1400	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:34:01.906129	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1404	DashboardRestApi.get	7	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 14:34:04.622956	2	0	3	http://5.250.180.35:30980/superset/dashboard/2/
1416	ChartDataRestApi.data	7	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:34:08.882532	2	2	3935	http://5.250.180.35:30980/superset/dashboard/2/
369	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:46.764726	\N	0	79	http://5.250.180.35:30980/superset/welcome/
374	log	2	{"source": "sqlLab", "ts": 1711544326609, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "tWmaN1HA7I", "visibility": "visible"}	2024-03-27 12:58:47.643101	\N	0	0	http://5.250.180.35:30980/superset/welcome/
378	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 12:58:51.857864	\N	0	19	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
386	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:59:31.903262	\N	0	23	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
392	DatabaseRestApi.tables	1	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-27 12:59:38.710069	\N	0	594	http://5.250.180.35:30980/dataset/add/
396	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544386434, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "n1BIte_Hi", "visibility": "visible"}	2024-03-27 12:59:47.489644	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=customer
401	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544393875, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "UEd7JgfQL", "visibility": "visible"}	2024-03-27 12:59:54.911381	\N	0	0	http://5.250.180.35:30980/dataset/add/
405	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer_address)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer_address"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:00:05.630507	\N	0	21	http://5.250.180.35:30980/chart/add/?dataset=customer_address
411	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544407574, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "WJebsjW96", "visibility": "visible"}	2024-03-27 13:00:08.608929	\N	0	0	http://5.250.180.35:30980/dataset/add/
415	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer_demographics)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer_demographics"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:00:18.033597	\N	0	20	http://5.250.180.35:30980/chart/add/?dataset=customer_demographics
420	SqlLabRestApi.get	1	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 13:00:21.512011	\N	0	10	http://5.250.180.35:30980/sqllab/
424	log	1	{"source": "sqlLab", "ts": 1711544421392, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "8c2Npp8Uo_", "visibility": "visible"}	2024-03-27 13:00:23.189729	\N	0	0	http://5.250.180.35:30980/sqllab/
425	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544422155, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.55, "query_count": 0, "event_type": "user", "event_id": "OSVNkKQBFL", "visibility": "visible"}	2024-03-27 13:00:23.189732	\N	0	0	http://5.250.180.35:30980/sqllab/
428	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:00:34.087004	\N	0	18	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
432	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544435410, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "uilYvQ4ty", "visibility": "visible"}	2024-03-27 13:00:36.462497	\N	0	0	http://5.250.180.35:30980/dataset/add/
437	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544438573, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "HLDFEPF6C", "visibility": "visible"}	2024-03-27 13:00:39.605009	\N	0	0	http://5.250.180.35:30980/dataset/add/
1374	ExploreRestApi.get	4	{"path": "/api/v1/explore/", "viz_type": "pie", "datasource_id": "5", "datasource_type": "table", "object_ref": "ExploreRestApi.get"}	2024-03-27 14:33:15.969824	\N	0	23	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=5__table
1378	ExploreFormDataRestApi.post	4	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 14:33:17.28258	\N	0	31	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=5__table
1383	DashboardRestApi.get	4	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2024-03-27 14:33:42.904265	3	0	9	http://5.250.180.35:30980/superset/dashboard/3/
1389	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:33:44.575522	3	4	1481	http://5.250.180.35:30980/superset/dashboard/3/
1403	log	7	{"source": "sqlLab", "ts": 1711550041753, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "jLGmhbPFNU", "visibility": "visible"}	2024-03-27 14:34:02.782485	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
370	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:46.832276	\N	0	55	http://5.250.180.35:30980/superset/welcome/
379	log	1	{"source": "sqlLab", "ts": 1711544331698, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "Yd70Ex4QCT", "visibility": "visible"}	2024-03-27 12:58:52.74834	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
385	DatabaseRestApi.function_names	1	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-27 12:59:27.657509	\N	0	921	http://5.250.180.35:30980/sqllab/
390	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544373339, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "Rc2xCvawO", "visibility": "visible"}	2024-03-27 12:59:34.378187	\N	0	0	http://5.250.180.35:30980/dataset/add/
394	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 12:59:46.393804	\N	0	1689	http://5.250.180.35:30980/dataset/add/
399	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544388632, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "cq4ODUbGD", "visibility": "visible"}	2024-03-27 12:59:49.662144	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
408	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544405552, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "QJsXqipTCo", "visibility": "visible"}	2024-03-27 13:00:07.546071	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
409	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544406462, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "9FwQryXboa", "visibility": "visible"}	2024-03-27 13:00:07.546075	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
419	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 13:00:21.472307	\N	0	32	http://5.250.180.35:30980/sqllab/
423	DatabaseRestApi.function_names	1	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-27 13:00:22.700768	\N	0	1022	http://5.250.180.35:30980/sqllab/
431	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:00:35.482163	\N	0	21	http://5.250.180.35:30980/dataset/add/
436	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:00:38.637816	\N	0	18	http://5.250.180.35:30980/dataset/add/
1379	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:33:41.846849	\N	0	52	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1384	DashboardRestApi.get_charts	4	{"path": "/api/v1/dashboard/3/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "3"}	2024-03-27 14:33:42.904893	\N	0	24	http://5.250.180.35:30980/superset/dashboard/3/
1391	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:33:45.508801	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1401	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:34:01.933221	\N	0	47	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1406	DashboardRestApi.get_datasets	7	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 14:34:04.715116	\N	0	88	http://5.250.180.35:30980/superset/dashboard/2/
1411	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 14:34:06.76214	\N	0	51	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
371	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 12:58:46.835575	\N	0	52	http://5.250.180.35:30980/superset/welcome/
375	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 12:58:51.77384	\N	0	24	http://5.250.180.35:30980/dashboard/list/
380	SqlLabRestApi.get	1	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 12:59:26.466658	\N	0	7	http://5.250.180.35:30980/sqllab/
382	DatabaseRestApi.schemas	1	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 12:59:27.232762	\N	0	487	http://5.250.180.35:30980/sqllab/
388	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544371761, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "aMmWoPJ4s", "visibility": "visible"}	2024-03-27 12:59:32.790763	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
393	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 12:59:42.987757	\N	0	1501	http://5.250.180.35:30980/dataset/add/
397	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 12:59:48.719194	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
402	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 12:59:57.789789	\N	0	22	http://5.250.180.35:30980/dataset/add/
406	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:00:06.535708	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
412	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:00:12.813464	\N	0	23	http://5.250.180.35:30980/dataset/add/
416	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544417957, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "ZigNY14QwW", "visibility": "visible"}	2024-03-27 13:00:19.071916	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=customer_demographics
429	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:00:34.116167	\N	0	11	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
433	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:00:37.495499	\N	0	18	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
438	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:00:41.446638	\N	0	25	http://5.250.180.35:30980/dataset/add/
439	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/customer_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:00:44.738042	\N	0	1089	http://5.250.180.35:30980/dataset/add/
440	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:00:46.907626	\N	0	889	http://5.250.180.35:30980/dataset/add/
441	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer_enriched)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer_enriched"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:00:47.063081	\N	0	20	http://5.250.180.35:30980/chart/add/?dataset=customer_enriched
442	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544446979, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "NXEhgzoGpk", "visibility": "visible"}	2024-03-27 13:00:48.06358	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=customer_enriched
443	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:00:49.487204	\N	0	21	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
444	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:00:49.51709	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
447	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544453065, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "L6w9izFJ0", "visibility": "visible"}	2024-03-27 13:00:54.096868	\N	0	0	http://5.250.180.35:30980/dataset/add/
445	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544449406, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "EFd66XryQ", "visibility": "visible"}	2024-03-27 13:00:50.468387	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
450	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544456500, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "jWmr3C0ET", "visibility": "visible"}	2024-03-27 13:00:57.533683	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
459	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:01:10.480406	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
464	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/income_band/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:01:22.291018	\N	0	1829	http://5.250.180.35:30980/dataset/add/
468	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:01:28.252514	\N	0	25	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
473	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:01:34.264669	\N	0	24	http://5.250.180.35:30980/dataset/add/
477	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544502994, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "rCsmuwiBOj", "visibility": "visible"}	2024-03-27 13:01:44.040364	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=customer_demographics_enriched
482	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544505743, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "2xuFl16Vz", "visibility": "visible"}	2024-03-27 13:01:46.781505	\N	0	0	http://5.250.180.35:30980/dataset/add/
486	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:household_demographics_enriched)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "household_demographics_enriched"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:01:53.852334	\N	0	23	http://5.250.180.35:30980/chart/add/?dataset=household_demographics_enriched
491	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:01:56.415094	\N	0	17	http://5.250.180.35:30980/dataset/add/
496	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:02:06.096387	\N	0	684	http://5.250.180.35:30980/dataset/add/
500	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:02:09.922837	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
505	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:04.226316	\N	0	45	http://5.250.180.35:30980/superset/welcome/
510	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:03:04.414458	\N	0	9	http://5.250.180.35:30980/superset/welcome/
515	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 13:03:14.248705	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
517	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 13:03:22.380495	\N	0	3	http://5.250.180.35:30980/superset/welcome/
522	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:22.567024	\N	0	57	http://5.250.180.35:30980/superset/welcome/
527	log	2	{"source": "sqlLab", "ts": 1711544604361, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "kR1ERk0fA", "visibility": "visible"}	2024-03-27 13:03:25.398421	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
535	DatabaseRestApi.schemas	2	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-27 13:03:33.060483	\N	0	141	http://5.250.180.35:30980/sqllab/
539	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:03:37.276335	\N	0	16	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1399	log	4	{"source": "dashboard", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711550025376, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "zdiHcCsWl", "visibility": "visible"}	2024-03-27 14:33:46.403682	3	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
446	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:00:53.137389	\N	0	18	http://5.250.180.35:30980/dataset/add/
451	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:00:57.828341	\N	0	22	http://5.250.180.35:30980/dataset/add/
455	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:01:08.895198	\N	0	1301	http://5.250.180.35:30980/dataset/add/
460	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544470368, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "n84D41K1b", "visibility": "visible"}	2024-03-27 13:01:11.404694	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
469	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:01:28.257425	\N	0	20	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
474	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/customer_demographics_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:01:41.170467	\N	0	1011	http://5.250.180.35:30980/dataset/add/
478	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:01:44.607879	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
483	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:01:49.082126	\N	0	23	http://5.250.180.35:30980/dataset/add/
487	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544513771, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "2uUfgrsn2p", "visibility": "visible"}	2024-03-27 13:01:54.813911	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=household_demographics_enriched
492	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544516355, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "ZgyjtL17T", "visibility": "visible"}	2024-03-27 13:01:57.386931	\N	0	0	http://5.250.180.35:30980/dataset/add/
501	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:02:09.956105	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
507	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:04.302757	\N	0	123	http://5.250.180.35:30980/superset/welcome/
511	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:03:04.896825	\N	0	18	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
519	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:22.525326	\N	0	97	http://5.250.180.35:30980/superset/welcome/
524	log	2	{"source": "sqlLab", "ts": 1711544602325, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "sjXojwGii2", "visibility": "visible"}	2024-03-27 13:03:23.358113	\N	0	0	http://5.250.180.35:30980/superset/welcome/
529	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:03:30.198382	\N	0	747	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
533	SqlLabRestApi.get	2	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-27 13:03:32.695754	\N	0	22	http://5.250.180.35:30980/sqllab/
536	log	2	{"source": "sqlLab", "ts": 1711544612587, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "TzdnkUAVf", "visibility": "visible"}	2024-03-27 13:03:33.622822	\N	0	0	http://5.250.180.35:30980/sqllab/
541	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544617154, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "DE8XXK52r", "visibility": "visible"}	2024-03-27 13:03:38.221831	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1402	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 14:34:02.062047	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1407	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 14:34:04.896294	\N	0	14	http://5.250.180.35:30980/superset/dashboard/2/
1408	DashboardFilterStateRestApi.post	7	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 14:34:05.429742	\N	0	48	http://5.250.180.35:30980/superset/dashboard/2/
448	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:00:56.57825	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
453	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:01:01.398841	\N	0	23	http://5.250.180.35:30980/dataset/add/
457	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544468971, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "c_wvr0CXH_", "visibility": "visible"}	2024-03-27 13:01:10.00276	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=household_demographics
462	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544473612, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "Jx-ITWB7c", "visibility": "visible"}	2024-03-27 13:01:14.646242	\N	0	0	http://5.250.180.35:30980/dataset/add/
466	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:income_band)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "income_band"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:01:24.159899	\N	0	21	http://5.250.180.35:30980/chart/add/?dataset=income_band
471	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:01:29.677669	\N	0	20	http://5.250.180.35:30980/dataset/add/
475	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:01:42.931963	\N	0	947	http://5.250.180.35:30980/dataset/add/
480	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544504531, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "aw_PD6P8O", "visibility": "visible"}	2024-03-27 13:01:45.5655	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
489	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:01:55.428494	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
495	DatabaseRestApi.tables	1	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-27 13:02:04.128482	\N	0	599	http://5.250.180.35:30980/dataset/add/
499	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544527578, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "f83bmenBfU", "visibility": "visible"}	2024-03-27 13:02:08.654471	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=customer_enriched
506	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:04.276149	\N	0	97	http://5.250.180.35:30980/superset/welcome/
512	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:03:04.919138	\N	0	39	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
520	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:22.551149	\N	0	116	http://5.250.180.35:30980/superset/welcome/
525	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:03:24.498521	\N	0	22	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
530	log	2	{"source": "sqlLab", "ts": 1711544608909, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "2yMCXUNJI", "visibility": "visible"}	2024-03-27 13:03:30.40555	\N	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
531	log	2	{"source": "sqlLab", "ts": 1711544609365, "event_name": "mount_explorer", "event_type": "user", "event_id": "3Vm8vlO2fL", "visibility": "visible"}	2024-03-27 13:03:30.405554	\N	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
538	DatabaseRestApi.function_names	2	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-27 13:03:33.767164	\N	0	858	http://5.250.180.35:30980/sqllab/
1405	DashboardRestApi.get_charts	7	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 14:34:04.625319	\N	0	41	http://5.250.180.35:30980/superset/dashboard/2/
1409	log	7	{"source": "sqlLab", "ts": 1711550044497, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "4cbfxyUOc", "visibility": "visible"}	2024-03-27 14:34:05.694336	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
454	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/household_demographics/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:01:07.052166	\N	0	1854	http://5.250.180.35:30980/dataset/add/
458	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:01:10.451981	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
463	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:01:17.287064	\N	0	23	http://5.250.180.35:30980/dataset/add/
467	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544484074, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "LARRnrCNv-", "visibility": "visible"}	2024-03-27 13:01:25.113312	\N	0	0	http://5.250.180.35:30980/chart/add/?dataset=income_band
472	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544489607, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "yzlx4W24v", "visibility": "visible"}	2024-03-27 13:01:30.640334	\N	0	0	http://5.250.180.35:30980/dataset/add/
476	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer_demographics_enriched)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer_demographics_enriched"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:01:43.077265	\N	0	20	http://5.250.180.35:30980/chart/add/?dataset=customer_demographics_enriched
481	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:01:45.818472	\N	0	18	http://5.250.180.35:30980/dataset/add/
485	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:01:53.706897	\N	0	788	http://5.250.180.35:30980/dataset/add/
490	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544515326, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "MkcbG_iYK", "visibility": "visible"}	2024-03-27 13:01:56.357767	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
494	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:compliance_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "compliance_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:02:03.564343	\N	0	27	http://5.250.180.35:30980/dataset/add/
498	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:customer_enriched)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "customer_enriched"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:02:07.659245	\N	0	18	http://5.250.180.35:30980/chart/add/?dataset=customer_enriched
504	LogRestApi.recent_activity	2	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 13:03:04.127725	\N	0	3	http://5.250.180.35:30980/superset/welcome/
509	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:04.323769	\N	0	54	http://5.250.180.35:30980/superset/welcome/
516	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 13:03:21.828664	\N	0	81	\N
521	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:22.559944	\N	0	75	http://5.250.180.35:30980/superset/welcome/
526	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:03:24.520881	\N	0	37	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
534	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:03:32.967023	\N	0	49	http://5.250.180.35:30980/sqllab/
540	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:03:37.287813	\N	0	38	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1410	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "S-8JPV-HY", "version": "v2", "ts": 1711550044668, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 171, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "-0wBN-5JA", "visibility": "visible"}	2024-03-27 14:34:05.69434	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
456	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:household_demographics)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "household_demographics"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2024-03-27 13:01:09.052723	\N	0	21	http://5.250.180.35:30980/chart/add/?dataset=household_demographics
461	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:01:13.684093	\N	0	20	http://5.250.180.35:30980/dataset/add/
465	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:01:24.014159	\N	0	1194	http://5.250.180.35:30980/dataset/add/
470	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544488130, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "tm0KEpw2j", "visibility": "visible"}	2024-03-27 13:01:29.164153	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
479	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:01:44.637857	\N	0	12	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
484	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table/household_demographics_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:01:52.356913	\N	0	1013	http://5.250.180.35:30980/dataset/add/
488	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:01:55.399687	\N	0	19	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
493	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:customer_analytics),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "customer_analytics"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2024-03-27 13:01:59.734249	\N	0	25	http://5.250.180.35:30980/dataset/add/
497	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "object_ref": "DatasetRestApi.post"}	2024-03-27 13:02:07.524878	\N	0	837	http://5.250.180.35:30980/dataset/add/
502	log	1	{"source": "sqlLab", "source_id": "2", "db_id": 1, "schema": null, "ts": 1711544529835, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "RoemxlrhG", "visibility": "visible"}	2024-03-27 13:02:10.868518	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
503	welcome	2	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 13:03:03.629606	\N	0	88	http://5.250.180.35:30980/users/edit/2
508	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:04.308636	\N	0	86	http://5.250.180.35:30980/superset/welcome/
513	log	2	{"source": "sqlLab", "ts": 1711544584072, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "DvDVD8Nx6s", "visibility": "visible"}	2024-03-27 13:03:05.807139	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
514	log	2	{"source": "sqlLab", "ts": 1711544584772, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "6cOvEGexL", "visibility": "visible"}	2024-03-27 13:03:05.807143	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
518	SavedQueryRestApi.get_list	2	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:03:22.470439	\N	0	35	http://5.250.180.35:30980/superset/welcome/
523	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:03:22.65225	\N	0	10	http://5.250.180.35:30980/superset/welcome/
528	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "datasource_type": "table", "datasource_id": "10", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:03:29.222818	\N	0	22	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
532	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:03:30.456312	\N	0	32	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
537	DatabaseRestApi.tables	2	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-27 13:03:33.649005	\N	0	519	http://5.250.180.35:30980/sqllab/
542	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "datasource_type": "table", "datasource_id": "2", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:03:42.413128	\N	0	23	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=2
543	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:03:43.438366	\N	0	790	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=2
544	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544622308, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "OxrFF7nHG", "visibility": "visible"}	2024-03-27 13:03:43.597475	\N	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=2
545	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544622565, "event_name": "mount_explorer", "event_type": "user", "event_id": "nOiWJR1Pf", "visibility": "visible"}	2024-03-27 13:03:43.597479	\N	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=2
546	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:03:43.67532	\N	0	27	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=2
547	DatabaseRestApi.get_list	2	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:03:56.470881	\N	0	40	http://5.250.180.35:30980/sqllab/
548	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544636317, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "JIiYroMZt8", "visibility": "visible"}	2024-03-27 13:03:57.361572	\N	0	0	http://5.250.180.35:30980/sqllab/
551	DatabaseRestApi.table_metadata	2	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-27 13:04:00.94939	\N	0	1085	http://5.250.180.35:30980/sqllab/
552	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711544607726)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711544607726}}	2024-03-27 13:04:10.570233	\N	0	3	http://5.250.180.35:30980/sqllab/
553	SqlLabRestApi.get_results	2	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-27 13:04:12.335353	\N	0	2777	http://5.250.180.35:30980/sqllab/
556	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:04:21.502423	\N	0	46	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
558	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:04:23.248004	\N	0	17	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
559	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:04:23.269291	\N	0	42	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
562	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:04:42.940098	\N	0	15	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
564	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:04:44.923601	\N	0	22	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
566	log	2	{"source": "sqlLab", "ts": 1711544684791, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "AYV9F7bmTu", "visibility": "visible"}	2024-03-27 13:04:45.862814	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
568	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:05:16.725889	\N	0	12	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
570	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:05:21.273719	\N	0	34	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
572	log	2	{"source": "sqlLab", "ts": 1711544721126, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "wu_vV7y_DM", "visibility": "visible"}	2024-03-27 13:05:22.271423	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
574	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:05:34.932725	\N	0	46	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
575	log	2	{"source": "sqlLab", "ts": 1711544734730, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "ivNDR-K-B", "visibility": "visible"}	2024-03-27 13:05:35.764789	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
577	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:05:41.381835	\N	0	36	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
579	log	2	{"source": "sqlLab", "ts": 1711544741294, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "x6XGq8SJi", "visibility": "visible"}	2024-03-27 13:05:42.420707	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
580	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:05:43.691681	\N	0	42	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
582	log	2	{"source": "sqlLab", "ts": 1711544743577, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "d2XpYiezt", "visibility": "visible"}	2024-03-27 13:05:44.609533	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
549	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544639151, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.79, "query_count": 0, "event_type": "user", "event_id": "VNyjygjXa", "visibility": "visible"}	2024-03-27 13:04:00.222607	\N	0	0	http://5.250.180.35:30980/sqllab/
550	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:04:00.61179	\N	0	782	http://5.250.180.35:30980/sqllab/
554	QueryRestApi.get_updated_since	2	{"path": "/api/v1/query/updated_since", "q": "(last_updated_ms:1711544645055)", "object_ref": "QueryRestApi.get_updated_since", "rison": {"last_updated_ms": 1711544645055}}	2024-03-27 13:04:12.383889	\N	0	3	http://5.250.180.35:30980/sqllab/
555	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:04:21.47501	\N	0	9	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
557	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544661320, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "qApsp9ysH", "visibility": "visible"}	2024-03-27 13:04:22.442635	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
560	log	2	{"source": "sqlLab", "source_id": "1", "db_id": 1, "schema": "compliance_analytics", "ts": 1711544663168, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "lqlBJ3uDU", "visibility": "visible"}	2024-03-27 13:04:24.204385	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
561	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:04:42.929194	\N	0	43	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
563	log	2	{"source": "sqlLab", "ts": 1711544682776, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "_8DOFY8cwZ", "visibility": "visible"}	2024-03-27 13:04:43.813299	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
565	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:04:44.943429	\N	0	35	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
567	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:05:16.714015	\N	0	41	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
569	log	2	{"source": "sqlLab", "ts": 1711544716556, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "_tHpJIWJOE", "visibility": "visible"}	2024-03-27 13:05:17.674641	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
571	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:05:21.291117	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
573	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:05:34.909196	\N	0	11	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
576	log	2	{"source": "sqlLab", "ts": 1711544738542, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "3zvvkm7CA", "visibility": "visible"}	2024-03-27 13:05:39.617688	\N	0	0	http://5.250.180.35:30980/chart/add
578	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:05:41.406313	\N	0	18	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
581	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:05:43.730732	\N	0	9	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
583	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:'')),order_column:table_name,order_direction:asc,page:0,page_size:100)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": ""}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:05:45.746737	\N	0	35	http://5.250.180.35:30980/chart/add
586	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:05:56.032227	\N	0	739	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table
590	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:06:03.614964	\N	0	712	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
592	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:06:17.963375	\N	0	699	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
656	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:08:59.144455	\N	0	2183	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
584	log	2	{"source": "sqlLab", "ts": 1711544744832, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "tnhiMaEPA", "visibility": "visible"}	2024-03-27 13:05:45.875411	\N	0	0	http://5.250.180.35:30980/chart/add
593	log	2	{"source": "sqlLab", "ts": 1711544777166, "event_name": "change_explore_controls", "event_type": "user", "event_id": "lb7wwyfCQ", "visibility": "visible"}	2024-03-27 13:06:18.201096	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
599	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "url_params": {"datasource_id": "10", "datasource_type": "table", "viz_type": "pie"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": 5, "show_legend": true, "extra_form_data": {}}, "results": "true", "object_ref": "Superset.explore_json"}	2024-03-27 13:06:30.27892	\N	0	1996	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
603	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "url_params": {"datasource_id": "10", "datasource_type": "table", "viz_type": "pie"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:06:42.852892	\N	0	2278	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
608	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:07:15.992213	\N	0	20	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
609	log	2	{"source": "explore", "source_id": 1, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711544835847, "event_name": "change_explore_controls", "event_type": "user", "event_id": "U49jcog8yc", "visibility": "visible"}	2024-03-27 13:07:16.880793	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
610	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:07:16.961752	\N	0	33	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
613	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:07:17.449898	\N	0	51	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
615	log	2	{"source": "explore", "source_id": 1, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711544837334, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "rSj1rb1VT", "visibility": "visible"}	2024-03-27 13:07:18.370021	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
624	ChartRestApi.favorite_status	1	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:07:25.216799	\N	0	11	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
631	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:07:53.768216	\N	0	101	http://5.250.180.35:30980/superset/welcome/
637	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:07:54.477665	\N	0	43	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
643	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:'')),order_column:table_name,order_direction:asc,page:0,page_size:100)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": ""}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:08:12.800731	\N	0	35	http://5.250.180.35:30980/chart/add
1412	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 14:34:06.76822	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1414	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "S-8JPV-HY", "version": "v2", "ts": 1711550046658, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "e6OB0t_kG", "visibility": "visible"}	2024-03-27 14:34:08.000534	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
585	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "viz_type": "pie", "datasource_id": "10", "datasource_type": "table", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:05:55.075659	\N	0	18	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table
589	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:05:56.341274	\N	0	36	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table
594	log	2	{"source": "sqlLab", "ts": 1711544782341, "event_name": "change_explore_controls", "event_type": "user", "event_id": "4aKLJjzNl", "visibility": "visible"}	2024-03-27 13:06:23.480169	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
597	log	2	{"source": "sqlLab", "ts": 1711544788129, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 30789, "duration": 2430, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "4aKLJjzNl"}	2024-03-27 13:06:29.261556	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
598	log	2	{"source": "sqlLab", "ts": 1711544788226, "event_name": "render_chart", "slice_id": 0, "viz_type": "histogram", "start_offset": 33230, "duration": 86, "event_type": "timing", "trigger_event": "4aKLJjzNl"}	2024-03-27 13:06:29.26156	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
601	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:06:38.599318	\N	0	45	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
616	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "pie"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:07:20.720258	\N	1	4704	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
620	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 13:07:24.997392	\N	0	30	http://5.250.180.35:30980/chart/list/
625	log	1	{"source": "sqlLab", "ts": 1711544844900, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "FYx2afmQ7O", "visibility": "visible"}	2024-03-27 13:07:25.941195	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
627	welcome	4	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 13:07:52.665051	\N	0	86	\N
632	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:07:53.785627	\N	0	64	http://5.250.180.35:30980/superset/welcome/
636	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:07:54.464922	\N	0	12	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
642	log	4	{"source": "sqlLab", "ts": 1711544876103, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "7rohcQJQ_", "visibility": "visible"}	2024-03-27 13:07:57.137583	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
647	log	2	{"source": "explore", "source_id": 1, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711544898287, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "vzqF6gJNn", "visibility": "visible"}	2024-03-27 13:08:19.520567	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table
648	log	2	{"source": "sqlLab", "ts": 1711544898482, "event_name": "mount_explorer", "event_type": "user", "event_id": "W79xEhwbPQ", "visibility": "visible"}	2024-03-27 13:08:19.52057	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table
1413	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 14:34:06.869521	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1417	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "S-8JPV-HY", "version": "v2", "ts": 1711550048713, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 396, "duration": 1659, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "e6OB0t_kG"}	2024-03-27 14:34:10.322321	2	0	0	http://5.250.180.35:30980/dashboard/list/
1418	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "S-8JPV-HY", "version": "v2", "ts": 1711550048910, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 404, "duration": 1848, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "e6OB0t_kG"}	2024-03-27 14:34:10.322325	2	0	0	http://5.250.180.35:30980/dashboard/list/
587	log	2	{"source": "sqlLab", "ts": 1711544754909, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "fVnPSkMAS", "visibility": "visible"}	2024-03-27 13:05:56.254278	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table
588	log	2	{"source": "sqlLab", "ts": 1711544755221, "event_name": "mount_explorer", "event_type": "user", "event_id": "YRe4di4IRu", "visibility": "visible"}	2024-03-27 13:05:56.254282	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table
591	log	2	{"source": "sqlLab", "ts": 1711544762785, "event_name": "change_explore_controls", "event_type": "user", "event_id": "nYQp7kuYH", "visibility": "visible"}	2024-03-27 13:06:03.820103	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
606	ChartRestApi.post	2	{"path": "/api/v1/chart/", "object_ref": "ChartRestApi.post"}	2024-03-27 13:07:15.582293	\N	0	32	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
619	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "pie"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true}, "results": "true", "object_ref": "Superset.explore_json"}	2024-03-27 13:07:21.948061	\N	1	5921	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
623	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:07:25.069604	\N	0	7	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
630	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:07:53.739176	\N	0	91	http://5.250.180.35:30980/superset/welcome/
635	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:07:53.88383	\N	0	17	http://5.250.180.35:30980/superset/welcome/
640	DatasetRestApi.info	4	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:07:56.220244	\N	0	14	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
645	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "viz_type": "table", "datasource_id": "10", "datasource_type": "table", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:08:18.347141	\N	0	20	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table
649	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:08:19.600376	\N	0	31	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table
1415	ChartDataRestApi.data	7	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 14:34:08.684414	2	1	3739	http://5.250.180.35:30980/superset/dashboard/2/
595	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:06:26.783416	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
600	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:06:35.851606	\N	0	25	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
602	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:06:41.589723	\N	0	24	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
607	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "viz_type": "pie", "datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:07:15.819454	\N	1	31	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
618	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "pie"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "results": "true", "object_ref": "Superset.explore_json"}	2024-03-27 13:07:21.928175	\N	1	5894	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
622	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:07:25.057889	\N	0	29	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
629	SavedQueryRestApi.get_list	4	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:07:53.680672	\N	0	40	http://5.250.180.35:30980/superset/welcome/
634	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:07:53.88056	\N	0	10	http://5.250.180.35:30980/superset/welcome/
641	DatasetRestApi.get_list	4	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:07:56.235047	\N	0	38	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
646	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:08:19.27548	\N	0	721	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table
650	log	2	{"source": "sqlLab", "ts": 1711544914639, "event_name": "change_explore_controls", "event_type": "user", "event_id": "bklGpKTZl", "visibility": "visible"}	2024-03-27 13:08:35.722385	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
1419	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 06:59:58.392198	\N	0	0	\N
1420	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:00:11.671426	\N	0	0	\N
1421	welcome	6	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:00:26.383122	\N	0	157	\N
1422	LogRestApi.recent_activity	6	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-28 07:00:27.237331	\N	0	11	http://5.250.180.35:30980/superset/welcome/
1427	ChartRestApi.get_list	6	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:00:27.637762	\N	0	269	http://5.250.180.35:30980/superset/welcome/
1431	ChartRestApi.favorite_status	6	{"path": "/api/v1/chart/favorite_status/", "q": "!(4,3)", "object_ref": "ChartRestApi.favorite_status", "rison": [4, 3]}	2024-03-28 07:00:27.788712	\N	0	29	http://5.250.180.35:30980/superset/welcome/
1435	log	6	{"source": "sqlLab", "ts": 1711609227149, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "pit5Lh0c0-", "visibility": "visible"}	2024-03-28 07:00:29.141432	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1436	log	6	{"source": "sqlLab", "ts": 1711609228111, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "0ftjntJ65", "visibility": "visible"}	2024-03-28 07:00:29.141436	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1440	DashboardRestApi.favorite_status	6	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-28 07:00:30.141794	\N	0	13	http://5.250.180.35:30980/superset/dashboard/3/
1442	log	6	{"source": "sqlLab", "ts": 1711609229654, "event_name": "spa_navigation", "path": "/superset/dashboard/3/", "event_type": "user", "event_id": "-AfkAT8Tu", "visibility": "visible"}	2024-03-28 07:00:30.925764	\N	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=BC8zYhmkGioYLPEq5pVmWGfcUZLJgw812X6uCvJwBOYtj-qVtLpIq8oP4sIvDrQn
596	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "url_params": {"datasource_id": "10", "datasource_type": "table", "viz_type": "pie"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": 5, "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:06:28.072542	\N	0	2330	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
604	log	2	{"source": "sqlLab", "ts": 1711544802919, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 45602, "duration": 2408, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "4aKLJjzNl"}	2024-03-27 13:06:44.019688	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
605	log	2	{"source": "sqlLab", "ts": 1711544802986, "event_name": "render_chart", "slice_id": 0, "viz_type": "histogram", "start_offset": 48036, "duration": 40, "event_type": "timing", "trigger_event": "4aKLJjzNl"}	2024-03-27 13:06:44.019692	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table
611	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:07:17.051226	\N	0	1025	http://5.250.180.35:30980/explore/?viz_type=pie&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=1
612	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:07:17.41204	\N	0	15	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
614	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:07:17.565982	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
617	log	2	{"source": "explore", "source_id": 1, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711544840791, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 81015, "duration": -77559, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "rSj1rb1VT"}	2024-03-27 13:07:21.905587	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
621	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 13:07:25.010762	\N	0	19	http://5.250.180.35:30980/chart/list/
626	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-27 13:07:34.319587	\N	0	0	\N
628	LogRestApi.recent_activity	4	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-27 13:07:53.629867	\N	0	2	http://5.250.180.35:30980/superset/welcome/
633	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-27 13:07:53.787333	\N	0	59	http://5.250.180.35:30980/superset/welcome/
638	log	4	{"source": "sqlLab", "ts": 1711544873577, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "XLiReTEm2I", "visibility": "visible"}	2024-03-27 13:07:55.337816	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
639	log	4	{"source": "sqlLab", "ts": 1711544874297, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "ztwp-9r7ly", "visibility": "visible"}	2024-03-27 13:07:55.33782	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
644	log	2	{"source": "explore", "source_id": 1, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711544891962, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "AKUGDfuWu", "visibility": "visible"}	2024-03-27 13:08:12.99861	\N	0	0	http://5.250.180.35:30980/chart/add
651	log	2	{"source": "sqlLab", "ts": 1711544925617, "event_name": "change_explore_controls", "event_type": "user", "event_id": "A_lrKSQN0", "visibility": "visible"}	2024-03-27 13:08:46.687778	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
652	log	2	{"source": "sqlLab", "ts": 1711544930622, "event_name": "change_explore_controls", "event_type": "user", "event_id": "7fD0YFLPS", "visibility": "visible"}	2024-03-27 13:08:51.728352	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
653	log	2	{"source": "sqlLab", "ts": 1711544931676, "event_name": "change_explore_controls", "event_type": "user", "event_id": "nmnp7lhHH", "visibility": "visible"}	2024-03-27 13:08:52.710958	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
654	log	2	{"source": "sqlLab", "ts": 1711544936208, "event_name": "change_explore_controls", "event_type": "user", "event_id": "gy9XYvEre", "visibility": "visible"}	2024-03-27 13:08:57.245227	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
655	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:08:57.963597	\N	0	24	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
657	log	2	{"source": "sqlLab", "ts": 1711544939166, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 11, "datasource": "10__table", "start_offset": 38629, "duration": 2248, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "gy9XYvEre"}	2024-03-27 13:09:00.256451	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
658	log	2	{"source": "sqlLab", "ts": 1711544939220, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 40885, "duration": 48, "event_type": "timing", "trigger_event": "gy9XYvEre"}	2024-03-27 13:09:00.256457	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
667	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:16.68766	\N	0	2227	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
682	log	2	{"source": "sqlLab", "ts": 1711544994302, "event_name": "change_explore_controls", "event_type": "user", "event_id": "_MvT_g843", "visibility": "visible"}	2024-03-27 13:09:55.401467	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
686	log	2	{"source": "sqlLab", "ts": 1711544999375, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 97441, "duration": 3647, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "_MvT_g843"}	2024-03-27 13:10:00.439467	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
687	log	2	{"source": "sqlLab", "ts": 1711544999404, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 101109, "duration": 7, "event_type": "timing", "trigger_event": "_MvT_g843"}	2024-03-27 13:10:00.439471	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
693	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(2)", "object_ref": "ChartRestApi.favorite_status", "rison": [2]}	2024-03-27 13:10:33.694102	\N	0	17	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
694	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545033560, "event_name": "change_explore_controls", "event_type": "user", "event_id": "-oEvlAVtq", "visibility": "visible"}	2024-03-27 13:10:34.59291	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
695	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:10:34.682246	\N	0	37	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
701	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:10:40.012347	\N	0	52	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
708	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:10:45.290604	\N	0	700	http://5.250.180.35:30980/explore/?slice_id=2
711	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:10:45.634121	\N	0	35	http://5.250.180.35:30980/explore/?slice_id=2
715	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 13:10:48.649159	\N	0	24	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
720	ChartRestApi.favorite_status	1	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-27 13:10:48.868818	\N	0	8	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
727	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:34.146658	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
732	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:44.792081	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
735	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "form_data_key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "slice_id": "2", "save_action": "overwrite", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:11:48.508023	\N	2	63	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
753	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:04.274334	\N	0	38	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
757	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/1", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 1}	2024-03-27 13:12:06.423705	1	0	11	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
659	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:01.179363	\N	0	1901	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
661	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:08.098985	\N	0	21	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
673	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:25.370595	\N	0	3898	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
677	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:34.757911	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
683	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:56.808893	\N	0	21	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
688	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:10:06.39972	\N	0	23	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
697	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "2", "viz_type": "table"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:10:39.112432	\N	2	5386	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
702	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-27 13:10:40.132764	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
712	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:10:46.817827	\N	2	1982	http://5.250.180.35:30980/explore/?slice_id=2
716	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 13:10:48.679416	\N	0	18	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
721	log	1	{"source": "sqlLab", "ts": 1711545048577, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "GVoHO3FIEw", "visibility": "visible"}	2024-03-27 13:10:49.613808	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
725	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:17.793546	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
730	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:42.352506	\N	0	44	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
733	ChartRestApi.get	2	{"path": "/api/v1/chart/2", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:11:47.948936	\N	0	31	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
736	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:11:49.384376	\N	0	738	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
738	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:11:49.64698	\N	0	30	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
743	ChartRestApi.put	2	{"path": "/api/v1/chart/2", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "2"}	2024-03-27 13:12:00.331422	\N	0	37	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
660	log	2	{"source": "sqlLab", "ts": 1711544945375, "event_name": "change_explore_controls", "event_type": "user", "event_id": "D3QC-n56U", "visibility": "visible"}	2024-03-27 13:09:06.468935	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
664	log	2	{"source": "sqlLab", "ts": 1711544950507, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 11, "datasource": "10__table", "start_offset": 48729, "duration": 3490, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "D3QC-n56U"}	2024-03-27 13:09:11.558993	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
665	log	2	{"source": "sqlLab", "ts": 1711544950525, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 52234, "duration": 4, "event_type": "timing", "trigger_event": "D3QC-n56U"}	2024-03-27 13:09:11.558997	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
670	log	2	{"source": "sqlLab", "ts": 1711544959852, "event_name": "change_explore_controls", "event_type": "user", "event_id": "hakl_88Bn", "visibility": "visible"}	2024-03-27 13:09:20.925292	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
674	log	2	{"source": "sqlLab", "ts": 1711544965389, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 11, "datasource": "10__table", "start_offset": 63134, "duration": 3967, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "hakl_88Bn"}	2024-03-27 13:09:26.454213	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
675	log	2	{"source": "sqlLab", "ts": 1711544965412, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 67118, "duration": 7, "event_type": "timing", "trigger_event": "hakl_88Bn"}	2024-03-27 13:09:26.45423	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
679	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:37.29163	\N	0	2265	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
684	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:59.315984	\N	0	3473	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
691	ChartRestApi.post	2	{"path": "/api/v1/chart/", "object_ref": "ChartRestApi.post"}	2024-03-27 13:10:33.376493	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
696	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:10:34.798473	\N	0	1048	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
700	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:10:39.974593	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
707	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(2)", "object_ref": "ChartRestApi.favorite_status", "rison": [2]}	2024-03-27 13:10:44.550009	\N	0	17	http://5.250.180.35:30980/explore/?slice_id=2
713	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545046838, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 579, "duration": 2041, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "MvWKo7buDt"}	2024-03-27 13:10:47.919782	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
714	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545046849, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 2627, "duration": 5, "event_type": "timing", "trigger_event": "MvWKo7buDt"}	2024-03-27 13:10:47.919785	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
717	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:10:48.741937	\N	0	40	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
723	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:10:59.944313	\N	0	46	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
726	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:31.914325	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
731	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:43.531761	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
662	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:10.485734	\N	0	3411	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
666	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:15.516948	\N	0	21	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
672	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:25.057785	\N	0	3539	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
680	log	2	{"source": "sqlLab", "ts": 1711544977326, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 11, "datasource": "10__table", "start_offset": 76691, "duration": 2347, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "hakl_88Bn"}	2024-03-27 13:09:38.419407	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
681	log	2	{"source": "sqlLab", "ts": 1711544977375, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 79074, "duration": 13, "event_type": "timing", "trigger_event": "hakl_88Bn"}	2024-03-27 13:09:38.41941	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
690	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:10:09.387017	\N	0	25	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
698	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "2", "viz_type": "table"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:10:39.114133	\N	2	5390	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
706	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "slice_id": "2", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:10:44.317173	\N	2	27	http://5.250.180.35:30980/explore/?slice_id=2
719	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:10:48.750712	\N	0	11	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
724	log	4	{"source": "sqlLab", "ts": 1711545059803, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "uXzx9U07z", "visibility": "visible"}	2024-03-27 13:11:00.834112	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
729	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:40.748757	\N	0	31	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
742	ChartRestApi.get	2	{"path": "/api/v1/chart/2", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:12:00.220157	\N	0	20	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
745	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:12:01.34212	\N	0	698	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
747	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:01.807371	\N	0	57	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
752	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:04.248324	\N	0	22	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
756	dashboard	2	{"path": "/superset/dashboard/1/", "edit": "true", "url_rule": "/superset/dashboard/<dashboard_id_or_slug>/", "object_ref": "Superset.dashboard", "dashboard_id_or_slug": "1", "dashboard_id": 1, "dashboard_version": "v2", "dash_edit_perm": true, "edit_mode": true}	2024-03-27 13:12:05.805736	1	0	82	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
760	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2024-03-27 13:12:06.768231	\N	0	24	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
766	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-27 13:12:09.297431	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
663	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:10.616958	\N	0	3488	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
668	log	2	{"source": "sqlLab", "ts": 1711544956710, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 11, "datasource": "10__table", "start_offset": 56118, "duration": 2304, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "D3QC-n56U"}	2024-03-27 13:09:17.764165	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
669	log	2	{"source": "sqlLab", "ts": 1711544956730, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 58438, "duration": 4, "event_type": "timing", "trigger_event": "D3QC-n56U"}	2024-03-27 13:09:17.764168	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
671	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:22.504322	\N	0	21	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
676	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:28.247972	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
678	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:09:36.066319	\N	0	24	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
685	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:09:59.326181	\N	0	3542	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
689	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5"}	2024-03-27 13:10:08.256567	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=WRJeoYGvhnUM6c2Zcdzq61h0LoC_Cb7Ghfq3ejbvFTnPwxQ-2jkx_Z_nY0cBxW-5&viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table
692	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "viz_type": "table", "datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "2", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:10:33.536206	\N	2	26	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
699	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "10", "datasource_type": "table", "save_action": "saveas", "slice_id": "2", "viz_type": "table"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:10:39.123074	\N	2	5387	http://5.250.180.35:30980/explore/?viz_type=table&datasource=10__table&datasource_id=10&datasource_type=table&save_action=saveas&slice_id=2
703	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545039186, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 135339, "duration": 5559, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "-oEvlAVtq"}	2024-03-27 13:10:40.923083	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
704	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545039197, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 140906, "duration": 4, "event_type": "timing", "trigger_event": "-oEvlAVtq"}	2024-03-27 13:10:40.923087	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
705	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545039887, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "NhWpmDrii", "visibility": "visible"}	2024-03-27 13:10:40.923088	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
709	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545044218, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "dZvCFRJxP", "visibility": "visible"}	2024-03-27 13:10:45.481754	\N	0	0	http://5.250.180.35:30980/explore/?slice_id=2
710	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545044449, "event_name": "mount_explorer", "event_type": "user", "event_id": "MvWKo7buDt", "visibility": "visible"}	2024-03-27 13:10:45.481757	\N	0	0	http://5.250.180.35:30980/explore/?slice_id=2
734	ChartRestApi.put	2	{"path": "/api/v1/chart/2", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "2"}	2024-03-27 13:11:48.060026	\N	0	43	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
748	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:01.807949	\N	0	10	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
718	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:10:48.746653	\N	2	1851	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
722	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:10:59.917105	\N	0	9	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
728	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:11:37.542911	\N	0	29	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
739	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"form_data_key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "save_action": "overwrite", "slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:11:50.988429	\N	2	2313	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
749	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-27 13:12:01.932587	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
754	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545123011, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 76364, "duration": -75046, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "LKnIDMXqd"}	2024-03-27 13:12:05.002153	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
755	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545123969, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "HxllJaH0t", "visibility": "visible"}	2024-03-27 13:12:05.002156	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
758	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/1/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "1"}	2024-03-27 13:12:06.447547	\N	0	16	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
765	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:09.146209	\N	0	55	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
770	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:12:13.439038	\N	0	740	http://5.250.180.35:30980/explore/?slice_id=1
773	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:12:13.707472	\N	0	31	http://5.250.180.35:30980/explore/?slice_id=1
778	ChartRestApi.put	2	{"path": "/api/v1/chart/1", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "1"}	2024-03-27 13:12:22.03595	\N	0	34	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
781	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545142290, "event_name": "change_explore_controls", "event_type": "user", "event_id": "Hf8bK5xHlV", "visibility": "visible"}	2024-03-27 13:12:23.35548	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
784	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545144835, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 9970, "duration": 2500, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "Hf8bK5xHlV"}	2024-03-27 13:12:25.879837	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
785	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545144846, "event_name": "render_chart", "slice_id": 1, "viz_type": "histogram", "start_offset": 12478, "duration": 4, "event_type": "timing", "trigger_event": "Hf8bK5xHlV"}	2024-03-27 13:12:25.879841	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
790	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545149578, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "-ZCfA7Uwd", "visibility": "visible"}	2024-03-27 13:12:30.614306	1	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
794	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:37.980144	\N	0	56	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
737	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545108535, "event_name": "change_explore_controls", "event_type": "user", "event_id": "V88Qly1Au", "visibility": "visible"}	2024-03-27 13:11:49.568002	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
740	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545111008, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 64371, "duration": 2419, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "V88Qly1Au"}	2024-03-27 13:11:52.064637	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
741	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545111025, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 66797, "duration": 10, "event_type": "timing", "trigger_event": "V88Qly1Au"}	2024-03-27 13:11:52.06464	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
744	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "form_data_key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "slice_id": "2", "save_action": "overwrite", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:12:00.506593	\N	2	56	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
746	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:12:01.633647	\N	0	33	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
750	log	2	{"source": "explore", "source_id": 2, "impression_id": "qXcYZwS_-", "version": "v2", "ts": 1711545121694, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "LKnIDMXqd", "visibility": "visible"}	2024-03-27 13:12:02.733595	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
759	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/1/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "1"}	2024-03-27 13:12:06.451038	\N	0	14	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
764	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:09.1421	\N	0	13	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
769	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:12:12.657684	\N	0	14	http://5.250.180.35:30980/explore/?slice_id=1
783	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"form_data_key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "save_action": "overwrite", "slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:12:24.76614	\N	1	2353	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
789	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2024-03-27 13:12:29.872356	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
802	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:43.009065	\N	0	45	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1423	SavedQueryRestApi.get_list	6	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'6')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "6"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:00:27.302919	\N	0	72	http://5.250.180.35:30980/superset/welcome/
1426	DashboardRestApi.get_list	6	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:00:27.618063	\N	0	130	http://5.250.180.35:30980/superset/welcome/
1430	DashboardRestApi.favorite_status	6	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-28 07:00:27.78037	\N	0	30	http://5.250.180.35:30980/superset/welcome/
1434	DashboardRestApi.favorite_status	6	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-28 07:00:28.410319	\N	0	11	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1439	DashboardRestApi.get_datasets	6	{"path": "/api/v1/dashboard/3/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "3"}	2024-03-28 07:00:29.965648	\N	0	126	http://5.250.180.35:30980/superset/dashboard/3/
1441	DashboardFilterStateRestApi.post	6	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2024-03-28 07:00:30.677851	\N	0	48	http://5.250.180.35:30980/superset/dashboard/3/
1445	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609235279, "event_name": "load_chart", "slice_id": 3, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "2__table", "start_offset": 465, "duration": 5161, "has_extra_filters": false, "viz_type": "big_number_total", "data_age": null, "event_type": "timing", "trigger_event": "XEhshV9UR4"}	2024-03-28 07:00:36.406396	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=BC8zYhmkGioYLPEq5pVmWGfcUZLJgw812X6uCvJwBOYtj-qVtLpIq8oP4sIvDrQn
751	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"form_data_key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "save_action": "overwrite", "slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:12:02.992033	\N	2	2323	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
761	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:2)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:12:06.811027	\N	0	96	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
767	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545128986, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "eZtYtH2w2", "visibility": "visible"}	2024-03-27 13:12:10.031205	1	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
771	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545132364, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "p7uXHzrRB", "visibility": "visible"}	2024-03-27 13:12:13.626717	1	0	0	http://5.250.180.35:30980/explore/?slice_id=1
772	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545132589, "event_name": "mount_explorer", "event_type": "user", "event_id": "4ZG9Dwi4r", "visibility": "visible"}	2024-03-27 13:12:13.626721	1	0	0	http://5.250.180.35:30980/explore/?slice_id=1
775	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545135110, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 556, "duration": 2190, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "4ZG9Dwi4r"}	2024-03-27 13:12:16.176844	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
776	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545135143, "event_name": "render_chart", "slice_id": 1, "viz_type": "histogram", "start_offset": 2754, "duration": 24, "event_type": "timing", "trigger_event": "4ZG9Dwi4r"}	2024-03-27 13:12:16.176847	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
779	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "form_data_key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "slice_id": "1", "save_action": "overwrite", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:12:22.196447	\N	1	55	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
788	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:29.75782	\N	0	49	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
792	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:35.53972	\N	0	38	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
796	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545157863, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "YEDf47PqI", "visibility": "visible"}	2024-03-27 13:12:38.89537	1	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
800	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:42.112761	\N	0	39	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1424	DashboardRestApi.get_list	6	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'6')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "6"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:00:27.501192	\N	0	262	http://5.250.180.35:30980/superset/welcome/
1429	DashboardRestApi.info	6	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:00:27.778031	\N	0	31	http://5.250.180.35:30980/superset/welcome/
1432	DashboardRestApi.info	6	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:00:28.278307	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1438	DashboardRestApi.get	6	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2024-03-28 07:00:29.860253	3	0	6	http://5.250.180.35:30980/superset/dashboard/3/
762	log	2	{"source": "sqlLab", "ts": 1711545126279, "event_name": "spa_navigation", "path": "/superset/dashboard/1/", "event_type": "user", "event_id": "h27jucp7Ao", "visibility": "visible"}	2024-03-27 13:12:07.515891	\N	0	0	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
763	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545126485, "event_name": "mount_dashboard", "is_soft_navigation": false, "is_edit_mode": true, "mount_duration": 899, "is_empty": true, "is_published": false, "event_type": "user", "event_id": "unMbp_yzgg", "visibility": "visible"}	2024-03-27 13:12:07.515895	\N	0	0	http://5.250.180.35:30980/superset/dashboard/1/?edit=true
768	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "slice_id": "1", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:12:12.436795	\N	1	27	http://5.250.180.35:30980/explore/?slice_id=1
777	ChartRestApi.get	2	{"path": "/api/v1/chart/1", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:12:21.934586	\N	0	18	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
780	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:12:23.101974	\N	0	718	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
782	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:12:23.429441	\N	0	30	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
787	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:29.730141	\N	0	17	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
791	DashboardRestApi.delete	2	{"path": "/api/v1/dashboard/1", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.delete", "pk": "1"}	2024-03-27 13:12:35.417465	\N	0	41	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
795	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:12:38.149548	\N	0	19	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
799	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:42.086539	\N	0	21	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1425	ChartRestApi.get_list	6	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'6')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "6"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:00:27.511354	\N	0	292	http://5.250.180.35:30980/superset/welcome/
1428	ChartRestApi.info	6	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:00:27.776202	\N	0	20	http://5.250.180.35:30980/superset/welcome/
1433	DashboardRestApi.get_list	6	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:00:28.298777	\N	0	45	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1437	DashboardRestApi.get_charts	6	{"path": "/api/v1/dashboard/3/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "3"}	2024-03-28 07:00:29.858663	\N	0	44	http://5.250.180.35:30980/superset/dashboard/3/
1444	ChartDataRestApi.data	6	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [], "metrics": ["count"], "annotation_layers": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 3}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-28 07:00:35.258717	3	3	5080	http://5.250.180.35:30980/superset/dashboard/3/
1451	ChartRestApi.get_list	6	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:00:39.940737	\N	0	53	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1455	DatasetRestApi.get_list	6	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:00:41.525684	\N	0	55	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1459	DatabaseRestApi.schemas	6	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-28 07:00:46.75525	\N	0	794	http://5.250.180.35:30980/sqllab/
1465	DatabaseRestApi.table_metadata	6	{"path": "/api/v1/database/1/table/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-28 07:00:53.334891	\N	0	2487	http://5.250.180.35:30980/sqllab/
1468	LogRestApi.recent_activity	4	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-28 07:01:22.516761	\N	0	15	http://5.250.180.35:30980/superset/welcome/
1473	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:22.688626	\N	0	64	http://5.250.180.35:30980/superset/welcome/
1474	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:01:22.816343	\N	0	21	http://5.250.180.35:30980/superset/welcome/
774	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:12:15.045728	\N	1	2089	http://5.250.180.35:30980/explore/?slice_id=1
786	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(columns:!(id,dashboard_title),filters:!((col:dashboard_title,opr:ct,value:''),(col:owners,opr:rel_m_m,value:2)),order_column:dashboard_title,page:0,page_size:100)", "rison": {"columns": ["id", "dashboard_title"], "filters": [{"col": "dashboard_title", "opr": "ct", "value": ""}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "dashboard_title", "page": 0, "page_size": 100}}	2024-03-27 13:12:26.780991	\N	0	70	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
793	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:37.978035	\N	0	13	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
797	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:41.531533	\N	0	46	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
801	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:42.978869	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1443	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609229893, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 239, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "XEhshV9UR4", "visibility": "visible"}	2024-03-28 07:00:30.925768	\N	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=BC8zYhmkGioYLPEq5pVmWGfcUZLJgw812X6uCvJwBOYtj-qVtLpIq8oP4sIvDrQn
1448	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609237488, "event_name": "load_chart", "slice_id": 4, "applied_filters": [{"column": "birth_date"}, {"column": "state"}], "is_cached": null, "force_refresh": false, "row_count": 102, "datasource": "5__table", "start_offset": 472, "duration": 7363, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "XEhshV9UR4"}	2024-03-28 07:00:38.61611	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=BC8zYhmkGioYLPEq5pVmWGfcUZLJgw812X6uCvJwBOYtj-qVtLpIq8oP4sIvDrQn
1449	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609237569, "event_name": "render_chart", "slice_id": 4, "viz_type": "pivot_table_v2", "start_offset": 7849, "duration": 66, "event_type": "timing", "trigger_event": "XEhshV9UR4"}	2024-03-28 07:00:38.616114	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=BC8zYhmkGioYLPEq5pVmWGfcUZLJgw812X6uCvJwBOYtj-qVtLpIq8oP4sIvDrQn
1453	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609239773, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "g9v0oo71F", "visibility": "visible"}	2024-03-28 07:00:40.804533	3	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1457	SqlLabRestApi.get	6	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-28 07:00:45.691895	\N	0	22	http://5.250.180.35:30980/sqllab/
1458	DatabaseRestApi.get_list	6	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-28 07:00:46.012075	\N	0	64	http://5.250.180.35:30980/sqllab/
1460	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609245389, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "aI6mM8U8K", "visibility": "visible"}	2024-03-28 07:00:46.840455	3	0	0	http://5.250.180.35:30980/sqllab/
1461	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609245789, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.36, "query_count": 0, "event_type": "user", "event_id": "O-z7Hp7er", "visibility": "visible"}	2024-03-28 07:00:46.840458	3	0	0	http://5.250.180.35:30980/sqllab/
1464	DatabaseRestApi.table_extra_metadata	6	{"path": "/api/v1/database/1/table_extra/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-28 07:00:52.630996	\N	0	1771	http://5.250.180.35:30980/sqllab/
1471	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:22.613212	\N	0	102	http://5.250.180.35:30980/superset/welcome/
1475	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:01:22.819262	\N	0	20	http://5.250.180.35:30980/superset/welcome/
1478	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:01:23.309785	\N	0	24	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1483	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:01:32.372082	\N	0	0	\N
1484	welcome	7	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:01:49.588869	\N	0	87	\N
1488	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:50.458559	\N	0	82	http://5.250.180.35:30980/superset/welcome/
798	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:41.5412	\N	0	11	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
803	log	4	{"source": "sqlLab", "ts": 1711545161376, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "ivYC13VGo4", "visibility": "visible"}	2024-03-27 13:12:43.941367	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
804	log	4	{"source": "sqlLab", "ts": 1711545161967, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "FWvarGlnR", "visibility": "visible"}	2024-03-27 13:12:43.941371	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
805	log	4	{"source": "sqlLab", "ts": 1711545162907, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "Nf_kuFG8l", "visibility": "visible"}	2024-03-27 13:12:43.941372	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
806	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2024-03-27 13:12:53.790628	\N	0	21	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
807	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2024-03-27 13:12:53.833961	\N	0	19	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
808	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:12:53.88268	\N	0	35	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
809	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:12:53.883383	\N	0	9	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
810	ChartRestApi.favorite_status	1	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:12:54.022888	\N	0	6	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
811	log	1	{"source": "sqlLab", "ts": 1711545173725, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "yBnJLqwnNK", "visibility": "visible"}	2024-03-27 13:12:54.758075	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
812	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:13:45.482442	\N	0	15	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
813	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:13:45.516114	\N	0	52	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
814	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:13:45.628157	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
815	log	7	{"source": "sqlLab", "ts": 1711545225321, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "jJx6nD7_Z2", "visibility": "visible"}	2024-03-27 13:13:46.353506	\N	0	0	http://5.250.180.35:30980/chart/list/
816	ExploreRestApi.get	7	{"path": "/api/v1/explore/", "slice_id": "1", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:13:51.632886	\N	1	29	http://5.250.180.35:30980/explore/?slice_id=1
817	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:13:51.830432	\N	0	16	http://5.250.180.35:30980/explore/?slice_id=1
818	DatabaseRestApi.table_extra_metadata	7	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:13:52.682286	\N	0	850	http://5.250.180.35:30980/explore/?slice_id=1
819	log	7	{"source": "sqlLab", "ts": 1711545231262, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "9JSdGsBaB", "visibility": "visible"}	2024-03-27 13:13:52.773554	\N	0	0	http://5.250.180.35:30980/explore/?slice_id=1
820	log	7	{"source": "explore", "source_id": 1, "impression_id": "tTqhg7CbD", "version": "v2", "ts": 1711545231743, "event_name": "mount_explorer", "event_type": "user", "event_id": "y9UJqKbmH", "visibility": "visible"}	2024-03-27 13:13:52.773558	\N	0	0	http://5.250.180.35:30980/explore/?slice_id=1
821	ExploreFormDataRestApi.post	7	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:13:52.818823	\N	0	30	http://5.250.180.35:30980/explore/?slice_id=1
822	explore_json	7	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:13:54.308282	\N	1	2195	http://5.250.180.35:30980/explore/?slice_id=1
823	log	7	{"source": "explore", "source_id": 1, "impression_id": "tTqhg7CbD", "version": "v2", "ts": 1711545234374, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 808, "duration": 2304, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "y9UJqKbmH"}	2024-03-27 13:13:55.497979	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=PUbLgI68hvbMoCz8E8t66megWqmnauTfIeiOqxdjFzc-7RyDTE7RLsZkBiTLEgYO&slice_id=1
825	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:14:17.513884	\N	0	19	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
824	log	7	{"source": "explore", "source_id": 1, "impression_id": "tTqhg7CbD", "version": "v2", "ts": 1711545234465, "event_name": "render_chart", "slice_id": 1, "viz_type": "histogram", "start_offset": 3120, "duration": 83, "event_type": "timing", "trigger_event": "y9UJqKbmH"}	2024-03-27 13:13:55.497983	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=PUbLgI68hvbMoCz8E8t66megWqmnauTfIeiOqxdjFzc-7RyDTE7RLsZkBiTLEgYO&slice_id=1
830	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!((col:id,opr:chart_is_favorite,value:!t)),order_column:slice_name,order_direction:asc,page:0,page_size:25)", "rison": {"filters": [{"col": "id", "opr": "chart_is_favorite", "value": true}], "order_column": "slice_name", "order_direction": "asc", "page": 0, "page_size": 25}}	2024-03-27 13:14:19.345659	\N	0	61	http://5.250.180.35:30980/profile/
838	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:14:37.954161	\N	1	2088	http://5.250.180.35:30980/explore/?slice_id=1
848	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545333878, "event_name": "change_explore_controls", "event_type": "user", "event_id": "2f6nq_V9X", "visibility": "visible"}	2024-03-27 13:15:34.949916	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
856	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545457204, "event_name": "change_explore_controls", "event_type": "user", "event_id": "6MMqDpBVd", "visibility": "visible"}	2024-03-27 13:17:38.292304	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
863	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:17:57.978975	\N	0	31	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
869	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:18:32.052551	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
874	ChartRestApi.put	2	{"path": "/api/v1/chart/1", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "1"}	2024-03-27 13:18:37.621785	\N	0	32	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
877	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545517836, "event_name": "change_explore_controls", "event_type": "user", "event_id": "FmZG2koseJ", "visibility": "visible"}	2024-03-27 13:18:38.869059	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
880	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:18:41.064357	\N	0	43	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
886	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:18:43.047197	\N	0	39	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
891	log	2	{"source": "sqlLab", "ts": 1711545524191, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "wsHs-5x5u", "visibility": "visible"}	2024-03-27 13:18:45.259534	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
895	log	2	{"source": "sqlLab", "ts": 1711545525515, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "4wI0urVBm", "visibility": "visible"}	2024-03-27 13:18:46.90341	\N	0	0	http://5.250.180.35:30980/explore/?slice_id=1
896	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545525874, "event_name": "mount_explorer", "event_type": "user", "event_id": "IuXLZWAhV", "visibility": "visible"}	2024-03-27 13:18:46.903415	\N	0	0	http://5.250.180.35:30980/explore/?slice_id=1
899	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545528228, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 706, "duration": 2008, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "IuXLZWAhV"}	2024-03-27 13:18:49.303264	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
900	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545528266, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 2732, "duration": 19, "event_type": "timing", "trigger_event": "IuXLZWAhV"}	2024-03-27 13:18:49.303267	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
904	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:19:04.191063	2	0	4	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
907	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:19:05.345133	\N	0	708	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
826	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:14:17.55303	\N	0	51	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
831	log	7	{"source": "explore", "source_id": 1, "impression_id": "tTqhg7CbD", "version": "v2", "ts": 1711545259194, "event_name": "spa_navigation", "path": "/profile/", "event_type": "user", "event_id": "qSgj3svRP", "visibility": "visible"}	2024-03-27 13:14:20.228579	\N	0	0	http://5.250.180.35:30980/profile/
835	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545275237, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "P3oawNQIl", "visibility": "visible"}	2024-03-27 13:14:36.510962	1	0	0	http://5.250.180.35:30980/explore/?slice_id=1
836	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545275480, "event_name": "mount_explorer", "event_type": "user", "event_id": "WipOIQRpq5", "visibility": "visible"}	2024-03-27 13:14:36.510966	1	0	0	http://5.250.180.35:30980/explore/?slice_id=1
839	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545278014, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 10000, "datasource": "10__table", "start_offset": 586, "duration": 2190, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "WipOIQRpq5"}	2024-03-27 13:14:39.082945	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
840	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545278029, "event_name": "render_chart", "slice_id": 1, "viz_type": "histogram", "start_offset": 2786, "duration": 4, "event_type": "timing", "trigger_event": "WipOIQRpq5"}	2024-03-27 13:14:39.082949	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
843	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:15:12.392346	\N	0	25	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
850	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": "100000", "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:15:42.67616	\N	1	2691	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
854	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545448780, "event_name": "change_explore_controls", "event_type": "user", "event_id": "lQH98c59w", "visibility": "visible"}	2024-03-27 13:17:29.808564	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
857	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:17:39.476777	\N	0	24	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
866	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:18:25.399671	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
876	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:18:38.713284	\N	0	693	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
878	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:18:38.956066	\N	0	34	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
889	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:18:44.338941	\N	0	51	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
894	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:18:46.680753	\N	0	726	http://5.250.180.35:30980/explore/?slice_id=1
897	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:18:46.981548	\N	0	29	http://5.250.180.35:30980/explore/?slice_id=1
914	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:19:08.351539	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
918	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(columns:!(created_on_delta_humanized,dashboard_title,url),filters:!((col:id,opr:dashboard_is_favorite,value:!t)),keys:!(none),order_column:changed_on,order_direction:desc,page:0,page_size:100)", "rison": {"columns": ["created_on_delta_humanized", "dashboard_title", "url"], "filters": [{"col": "id", "opr": "dashboard_is_favorite", "value": true}], "keys": ["none"], "order_column": "changed_on", "order_direction": "desc", "page": 0, "page_size": 100}}	2024-03-27 13:19:10.6936	\N	0	51	http://5.250.180.35:30980/profile/
827	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:14:17.665085	\N	0	18	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
832	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "slice_id": "1", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:14:35.33604	\N	1	25	http://5.250.180.35:30980/explore/?slice_id=1
841	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": 10000, "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "query": "true", "object_ref": "Superset.explore_json"}	2024-03-27 13:14:55.142287	\N	1	30	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
845	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545314230, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 100000, "datasource": "10__table", "start_offset": 36074, "duration": 2918, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "GutYZbIWE"}	2024-03-27 13:15:15.310857	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
846	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545314272, "event_name": "render_chart", "slice_id": 1, "viz_type": "histogram", "start_offset": 39011, "duration": 23, "event_type": "timing", "trigger_event": "GutYZbIWE"}	2024-03-27 13:15:15.31086	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
849	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:15:41.026581	\N	0	55	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
853	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:17:29.654688	\N	0	719	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
861	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:17:50.701033	\N	0	54	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
870	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "1"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:18:33.481888	\N	1	2419	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
881	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:18:41.071736	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
887	log	2	{"source": "sqlLab", "ts": 1711545522899, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "oYpSBZkyrs", "visibility": "visible"}	2024-03-27 13:18:43.930679	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
892	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "slice_id": "1", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:18:45.719941	\N	1	28	http://5.250.180.35:30980/explore/?slice_id=1
901	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(columns:!(id,dashboard_title),filters:!((col:dashboard_title,opr:ct,value:''),(col:owners,opr:rel_m_m,value:2)),order_column:dashboard_title,page:0,page_size:100)", "rison": {"columns": ["id", "dashboard_title"], "filters": [{"col": "dashboard_title", "opr": "ct", "value": ""}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "dashboard_title", "page": 0, "page_size": 100}}	2024-03-27 13:18:50.301089	\N	0	40	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
910	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"form_data_key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "save_action": "overwrite", "slice_id": "1"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:19:06.983009	\N	1	2312	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
916	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545548247, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "Et-oG9XMb", "visibility": "visible"}	2024-03-27 13:19:09.455466	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
959	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:20:13.172837	\N	0	30	http://5.250.180.35:30980/superset/dashboard/2/
828	log	7	{"source": "explore", "source_id": 1, "impression_id": "tTqhg7CbD", "version": "v2", "ts": 1711545257382, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "hO0rkIC9M", "visibility": "visible"}	2024-03-27 13:14:18.416717	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
833	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:14:35.566825	\N	0	18	http://5.250.180.35:30980/explore/?slice_id=1
842	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545309594, "event_name": "change_explore_controls", "event_type": "user", "event_id": "GutYZbIWE", "visibility": "visible"}	2024-03-27 13:15:10.808703	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
847	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545322731, "event_name": "change_explore_controls", "event_type": "user", "event_id": "J608mS4Y4", "visibility": "visible"}	2024-03-27 13:15:23.801393	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
851	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545342906, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": false, "force_refresh": false, "row_count": 100000, "datasource": "10__table", "start_offset": 64674, "duration": 2993, "viz_type": "histogram", "data_age": null, "event_type": "timing", "trigger_event": "2f6nq_V9X"}	2024-03-27 13:15:43.978819	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
852	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545342945, "event_name": "render_chart", "slice_id": 1, "viz_type": "histogram", "start_offset": 67686, "duration": 20, "event_type": "timing", "trigger_event": "2f6nq_V9X"}	2024-03-27 13:15:43.978822	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
855	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545453704, "event_name": "change_explore_controls", "event_type": "user", "event_id": "Phl-6qFUO", "visibility": "visible"}	2024-03-27 13:17:34.773637	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
859	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545460847, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 183163, "duration": 2446, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "6MMqDpBVd"}	2024-03-27 13:17:41.969702	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
860	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545460899, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 185620, "duration": 40, "event_type": "timing", "trigger_event": "6MMqDpBVd"}	2024-03-27 13:17:41.969705	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
865	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545502632, "event_name": "change_explore_controls", "event_type": "user", "event_id": "un-Yjch5z", "visibility": "visible"}	2024-03-27 13:18:23.704093	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
868	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545506732, "event_name": "load_chart", "slice_id": 1, "has_err": true, "error_details": "prophet() missing 1 required positional argument: 'time_grain'", "datasource": "10__table", "start_offset": 229085, "duration": 2409, "event_type": "timing", "trigger_event": "un-Yjch5z"}	2024-03-27 13:18:27.768571	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
873	ChartRestApi.get	2	{"path": "/api/v1/chart/1", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:18:37.512545	\N	0	19	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
879	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"form_data_key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "save_action": "overwrite", "slice_id": "1"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:18:40.313667	\N	1	2364	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
885	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:18:43.020833	\N	0	21	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
890	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:18:44.476524	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
905	ChartRestApi.put	2	{"path": "/api/v1/chart/1", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "1"}	2024-03-27 13:19:04.310982	\N	0	36	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
908	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545544528, "event_name": "change_explore_controls", "event_type": "user", "event_id": "QQwEXTuia", "visibility": "visible"}	2024-03-27 13:19:05.558727	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
829	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(columns:!(created_on_delta_humanized,dashboard_title,url),filters:!((col:id,opr:dashboard_is_favorite,value:!t)),keys:!(none),order_column:changed_on,order_direction:desc,page:0,page_size:100)", "rison": {"columns": ["created_on_delta_humanized", "dashboard_title", "url"], "filters": [{"col": "id", "opr": "dashboard_is_favorite", "value": true}], "keys": ["none"], "order_column": "changed_on", "order_direction": "desc", "page": 0, "page_size": 100}}	2024-03-27 13:14:19.340946	\N	0	50	http://5.250.180.35:30980/profile/
834	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:14:36.320289	\N	0	722	http://5.250.180.35:30980/explore/?slice_id=1
837	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:14:36.596554	\N	0	34	http://5.250.180.35:30980/explore/?slice_id=1
844	explore_json	2	{"path": "/superset/explore_json/", "form_data": {"datasource": "10__table", "viz_type": "histogram", "slice_id": 1, "url_params": {"slice_id": "1"}, "all_columns_x": ["birth_year"], "adhoc_filters": [], "row_limit": "100000", "groupby": [], "color_scheme": "supersetColors", "link_length": "25", "show_legend": true, "extra_form_data": {}}, "object_ref": "Superset.explore_json"}	2024-03-27 13:15:14.023868	\N	1	2674	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
858	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "1"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:17:40.825972	\N	1	2381	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
862	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:17:54.399968	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
864	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK"}	2024-03-27 13:18:12.763155	\N	0	32	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
867	ChartRestApi.get	2	{"path": "/api/v1/chart/1", "url_rule": "/api/v1/chart/<int:pk>", "rison": {}}	2024-03-27 13:18:26.824491	\N	0	25	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
871	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545513504, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 235735, "duration": 2531, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "un-Yjch5z"}	2024-03-27 13:18:34.556387	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
872	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545513521, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 238278, "duration": 4, "event_type": "timing", "trigger_event": "un-Yjch5z"}	2024-03-27 13:18:34.556391	1	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
875	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "form_data_key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "slice_id": "1", "save_action": "overwrite", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:18:37.807562	\N	1	59	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
882	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545520346, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 242666, "duration": 2441, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "FmZG2koseJ"}	2024-03-27 13:18:41.987632	1	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
883	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545520364, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 245117, "duration": 9, "event_type": "timing", "trigger_event": "FmZG2koseJ"}	2024-03-27 13:18:41.987636	1	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
884	log	2	{"source": "dashboard", "source_id": 1, "impression_id": "r5nI9hqkr", "version": "v2", "ts": 1711545520955, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "RyjYziwlN", "visibility": "visible"}	2024-03-27 13:18:41.987638	1	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
888	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:18:44.294832	\N	0	19	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
893	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2024-03-27 13:18:45.956454	\N	0	17	http://5.250.180.35:30980/explore/?slice_id=1
902	ChartRestApi.get	2	{"path": "/api/v1/chart/1", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:19:04.037179	\N	0	19	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
898	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "1"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:18:48.205253	\N	1	1940	http://5.250.180.35:30980/explore/?slice_id=1
903	DashboardRestApi.post	2	{"path": "/api/v1/dashboard/", "object_ref": "DashboardRestApi.post"}	2024-03-27 13:19:04.104083	\N	0	7	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1
906	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "form_data_key": "bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK", "slice_id": "1", "save_action": "overwrite", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:19:04.4983	\N	1	61	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
913	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:19:08.330464	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
919	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!((col:id,opr:chart_is_favorite,value:!t)),order_column:slice_name,order_direction:asc,page:0,page_size:25)", "rison": {"filters": [{"col": "id", "opr": "chart_is_favorite", "value": true}], "order_column": "slice_name", "order_direction": "asc", "page": 0, "page_size": 25}}	2024-03-27 13:19:10.699291	\N	0	62	http://5.250.180.35:30980/profile/
927	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:19:18.028142	\N	0	48	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
932	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:19:23.064946	\N	0	25	http://5.250.180.35:30980/superset/dashboard/2/
940	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545565635, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 366, "duration": 2347, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "QdqUr2EMJF"}	2024-03-27 13:19:27.470969	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
941	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545565675, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 2733, "duration": 21, "event_type": "timing", "trigger_event": "QdqUr2EMJF"}	2024-03-27 13:19:27.470972	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
942	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545566401, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "6rBSLGaUl", "visibility": "visible"}	2024-03-27 13:19:27.470973	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1446	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609235372, "event_name": "render_chart", "slice_id": 3, "viz_type": "big_number_total", "start_offset": 5655, "duration": 63, "event_type": "timing", "trigger_event": "XEhshV9UR4"}	2024-03-28 07:00:36.4064	3	0	0	http://5.250.180.35:30980/superset/dashboard/3/?native_filters_key=BC8zYhmkGioYLPEq5pVmWGfcUZLJgw812X6uCvJwBOYtj-qVtLpIq8oP4sIvDrQn
1450	ChartRestApi.info	6	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:00:39.939724	\N	0	11	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1454	DatasetRestApi.info	6	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:00:41.480869	\N	0	18	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1463	DatabaseRestApi.function_names	6	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-28 07:00:48.669403	\N	0	2714	http://5.250.180.35:30980/sqllab/
1470	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:22.604962	\N	0	80	http://5.250.180.35:30980/superset/welcome/
1477	ChartRestApi.favorite_status	4	{"path": "/api/v1/chart/favorite_status/", "q": "!(4,3)", "object_ref": "ChartRestApi.favorite_status", "rison": [4, 3]}	2024-03-28 07:01:22.822315	\N	0	31	http://5.250.180.35:30980/superset/welcome/
1481	log	4	{"source": "sqlLab", "ts": 1711609282444, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "TC4mi124wP", "visibility": "visible"}	2024-03-28 07:01:24.172491	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1482	log	4	{"source": "sqlLab", "ts": 1711609283142, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "FLxT8nSsw", "visibility": "visible"}	2024-03-28 07:01:24.172494	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1486	SavedQueryRestApi.get_list	7	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:50.410089	\N	0	32	http://5.250.180.35:30980/superset/welcome/
909	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:19:05.644393	\N	0	34	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
915	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:19:08.470058	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
920	log	7	{"source": "sqlLab", "ts": 1711545550550, "event_name": "spa_navigation", "path": "/profile/", "event_type": "user", "event_id": "RyKzfeLsn", "visibility": "visible"}	2024-03-27 13:19:11.58378	\N	0	0	http://5.250.180.35:30980/profile/
925	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:19:14.974962	\N	0	42	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
929	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:19:18.213606	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
934	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:19:23.349692	\N	0	17	http://5.250.180.35:30980/superset/dashboard/2/
936	log	2	{"source": "sqlLab", "ts": 1711545562923, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "UB2O8fF3A", "visibility": "visible"}	2024-03-27 13:19:24.13417	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
937	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545563106, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 184, "is_empty": false, "is_published": false, "event_type": "user", "event_id": "QdqUr2EMJF", "visibility": "visible"}	2024-03-27 13:19:24.134174	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
944	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545571541, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 6369, "duration": 2250, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "6rBSLGaUl"}	2024-03-27 13:19:32.706822	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
945	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545571558, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 8625, "duration": 11, "event_type": "timing", "trigger_event": "6rBSLGaUl"}	2024-03-27 13:19:32.706825	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1447	ChartDataRestApi.data	6	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "birth_date", "op": "TEMPORAL_RANGE", "val": "No filter"}, {"col": "state", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["state", "preferred_customer"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 4}, "dashboard_id": "3", "object_ref": "ChartDataRestApi.data"}	2024-03-28 07:00:37.463866	3	4	7283	http://5.250.180.35:30980/superset/dashboard/3/
1452	ChartRestApi.favorite_status	6	{"path": "/api/v1/chart/favorite_status/", "q": "!(4,3)", "object_ref": "ChartRestApi.favorite_status", "rison": [4, 3]}	2024-03-28 07:00:40.102382	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1456	log	6	{"source": "dashboard", "source_id": 3, "impression_id": "I8TCtZW-N", "version": "v2", "ts": 1711609241364, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "uLww0cPP6", "visibility": "visible"}	2024-03-28 07:00:42.395874	3	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1462	DatabaseRestApi.tables	6	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:customer_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "customer_analytics"}}	2024-03-28 07:00:47.681178	\N	0	847	http://5.250.180.35:30980/sqllab/
1466	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:01:13.447641	\N	0	0	\N
1467	welcome	4	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:01:21.709465	\N	0	80	\N
1469	SavedQueryRestApi.get_list	4	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'4')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "4"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:22.560207	\N	0	36	http://5.250.180.35:30980/superset/welcome/
1472	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:22.683811	\N	0	58	http://5.250.180.35:30980/superset/welcome/
1476	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-28 07:01:22.819731	\N	0	18	http://5.250.180.35:30980/superset/welcome/
1480	DashboardRestApi.favorite_status	4	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3]}	2024-03-28 07:01:23.44944	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1485	LogRestApi.recent_activity	7	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-28 07:01:50.369205	\N	0	6	http://5.250.180.35:30980/superset/welcome/
911	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545547005, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 19072, "duration": 2418, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "QQwEXTuia"}	2024-03-27 13:19:08.052564	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
912	log	2	{"source": "explore", "source_id": 1, "impression_id": "0_2Vq7bXl", "version": "v2", "ts": 1711545547019, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 21499, "duration": 5, "event_type": "timing", "trigger_event": "QQwEXTuia"}	2024-03-27 13:19:08.052567	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=bnOTQQ6M7SxK5tUecoq_hRWDhF4uSotbxkM6_fc1cjomEKJHLRPj89awvu87kYyK&slice_id=1&save_action=overwrite
917	root	7	{"path": "/profile/", "object_ref": "ProfileView.root"}	2024-03-27 13:19:10.014236	\N	0	79	\N
921	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:19:13.407381	\N	0	18	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
924	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:19:14.950942	\N	0	20	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
928	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:19:18.03497	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
933	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:19:23.104321	\N	0	59	http://5.250.180.35:30980/superset/dashboard/2/
935	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:19:23.83218	\N	0	30	http://5.250.180.35:30980/superset/dashboard/2/
943	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:19:31.519609	2	2	2124	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1479	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:01:23.331481	\N	0	49	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1487	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:50.458119	\N	0	87	http://5.250.180.35:30980/superset/welcome/
1491	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:01:50.651752	\N	0	23	http://5.250.180.35:30980/superset/welcome/
1496	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:01:51.064261	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1500	DashboardRestApi.get_charts	7	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-28 07:01:52.158111	\N	0	43	http://5.250.180.35:30980/superset/dashboard/2/
1507	ChartDataRestApi.data	7	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-28 07:01:57.851379	2	1	5368	http://5.250.180.35:30980/superset/dashboard/2/
1514	DatasetRestApi.info	7	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:02:02.249167	\N	0	16	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1518	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-28 07:02:03.851352	\N	0	20	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1522	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-28 07:02:06.86566	\N	0	467	http://5.250.180.35:30980/sqllab/
1527	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:02:09.090539	\N	0	127	http://5.250.180.35:30980/sqllab/
922	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:19:13.416098	\N	0	42	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
926	log	7	{"source": "sqlLab", "ts": 1711545554847, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "uloa7QKGk_", "visibility": "visible"}	2024-03-27 13:19:15.877451	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
930	log	2	{"source": "sqlLab", "ts": 1711545557867, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "PbyLHqB3R2", "visibility": "visible"}	2024-03-27 13:19:18.902863	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
938	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:19:25.614832	2	1	2271	http://5.250.180.35:30980/superset/dashboard/2/
1489	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:50.524138	\N	0	59	http://5.250.180.35:30980/superset/welcome/
1493	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:01:50.657492	\N	0	15	http://5.250.180.35:30980/superset/welcome/
1497	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-28 07:01:51.193203	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1502	DashboardRestApi.get_datasets	7	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-28 07:01:52.225541	\N	0	94	http://5.250.180.35:30980/superset/dashboard/2/
1504	DashboardFilterStateRestApi.post	7	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-28 07:01:52.981661	\N	0	43	http://5.250.180.35:30980/superset/dashboard/2/
1509	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609317870, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 463, "duration": 5452, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "2D1Jb_sNJP"}	2024-03-28 07:01:59.389504	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1510	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609317950, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 5944, "duration": 51, "event_type": "timing", "trigger_event": "2D1Jb_sNJP"}	2024-03-28 07:01:59.389507	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1511	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609318281, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 471, "duration": 5855, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "2D1Jb_sNJP"}	2024-03-28 07:01:59.389509	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1512	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609318356, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 6343, "duration": 58, "event_type": "timing", "trigger_event": "2D1Jb_sNJP"}	2024-03-28 07:01:59.38951	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1517	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:02:03.730218	\N	0	51	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1526	DatabaseRestApi.function_names	7	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-28 07:02:07.600159	\N	0	1199	http://5.250.180.35:30980/sqllab/
1530	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:02:17.61306	\N	0	423	http://5.250.180.35:30980/sqllab/
923	log	7	{"source": "sqlLab", "ts": 1711545553228, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "5A_sJWauu", "visibility": "visible"}	2024-03-27 13:19:14.259959	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
931	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:19:23.062321	2	0	9	http://5.250.180.35:30980/superset/dashboard/2/
939	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:2)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:19:26.558104	\N	0	54	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
946	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:19:44.132939	\N	0	83	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
947	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:19:49.441875	\N	0	39	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
948	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:19:50.141113	\N	0	28	http://5.250.180.35:30980/superset/dashboard/2/
949	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:19:51.8845	2	2	2301	http://5.250.180.35:30980/superset/dashboard/2/
950	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545591909, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 26598, "duration": 2389, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "6rBSLGaUl"}	2024-03-27 13:19:52.979344	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
951	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545591933, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 29008, "duration": 2, "event_type": "timing", "trigger_event": "6rBSLGaUl"}	2024-03-27 13:19:52.979347	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
952	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:2)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:19:57.200882	\N	0	52	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
953	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545597038, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "ssCkyjvAY", "visibility": "visible"}	2024-03-27 13:19:58.078782	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
954	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:20:01.783365	\N	0	28	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
955	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:20:02.404289	\N	0	29	http://5.250.180.35:30980/superset/dashboard/2/
957	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545606050, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "8G-TkEzna", "visibility": "visible"}	2024-03-27 13:20:07.083764	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
956	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:2)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:20:06.208811	\N	0	51	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
962	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:20:22.95143	\N	0	30	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
965	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:20:26.321992	2	0	9	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
969	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:20:26.674497	\N	0	15	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
970	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:20:27.18326	\N	0	26	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
980	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:35.60954	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
985	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "datasource_type": "table", "datasource_id": "10", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:20:37.721798	\N	0	19	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
990	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:20:38.98536	\N	0	29	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
995	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:42.9608	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1000	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:20:45.719092	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1005	log	7	{"source": "sqlLab", "ts": 1711545656242, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "EFwIUjnwZ", "visibility": "visible"}	2024-03-27 13:20:57.272582	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1010	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:21:01.179924	2	0	7	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1012	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:22:03.672998	2	0	7	http://5.250.180.35:30980/superset/dashboard/2/
1020	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:22:07.7221	2	2	3894	http://5.250.180.35:30980/superset/dashboard/2/
1026	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:09.67553	\N	0	18	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1030	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:12.409648	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1034	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:13.767952	\N	0	42	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1038	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:22:17.306626	\N	0	21	http://5.250.180.35:30980/superset/dashboard/2/
1042	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545737176, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "oSMt8Y__E0", "visibility": "visible"}	2024-03-27 13:22:18.397491	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1070	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:48.453536	\N	0	12	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
958	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:20:12.543424	\N	0	27	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
961	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "zunV5Sm7V", "version": "v2", "ts": 1711545615452, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "ILRxq5VJm", "visibility": "visible"}	2024-03-27 13:20:16.490906	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
963	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:20:23.578247	\N	0	26	http://5.250.180.35:30980/superset/dashboard/2/
971	log	2	{"source": "sqlLab", "ts": 1711545626218, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "GFmuGAhHTA", "visibility": "visible"}	2024-03-27 13:20:27.56192	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
972	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545626482, "event_name": "mount_dashboard", "is_soft_navigation": false, "is_edit_mode": false, "mount_duration": 818, "is_empty": false, "is_published": false, "event_type": "user", "event_id": "AKBy_6FYHv", "visibility": "visible"}	2024-03-27 13:20:27.561924	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
979	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:35.590055	\N	0	17	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
984	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:36.897261	\N	0	34	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
994	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:42.938988	\N	0	43	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
999	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:45.602446	\N	0	48	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1004	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:20:56.529861	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1009	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545658624, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "V-gcjYhd7", "visibility": "visible"}	2024-03-27 13:20:59.655312	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1011	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:21:54.116182	2	0	6	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1019	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:22:07.301966	2	1	3485	http://5.250.180.35:30980/superset/dashboard/2/
1027	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:09.694924	\N	0	46	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1032	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:12.527874	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1036	log	7	{"source": "sqlLab", "ts": 1711545733631, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "LPL17pAk_O", "visibility": "visible"}	2024-03-27 13:22:14.662474	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1045	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:22:20.895894	2	1	3426	http://5.250.180.35:30980/superset/dashboard/2/
1074	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:01.617851	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
960	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:2)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:20:15.576198	\N	0	50	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
966	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:20:26.361719	\N	0	18	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
973	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"native_filters_key": "IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:20:30.18904	2	1	3477	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
981	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:20:35.740066	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
986	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:20:38.669379	\N	0	723	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
991	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:39.876254	\N	0	41	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
996	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:20:43.04952	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1001	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545645391, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "J4p4Ifqtg", "visibility": "visible"}	2024-03-27 13:20:46.423645	2	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1006	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:58.740439	\N	0	22	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1013	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:22:03.677408	\N	0	22	http://5.250.180.35:30980/superset/dashboard/2/
1017	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545723558, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "0qsmXE0r0V", "visibility": "visible"}	2024-03-27 13:22:04.758319	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1018	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545723730, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 172, "is_empty": false, "is_published": false, "event_type": "user", "event_id": "CxyFOZwgNF", "visibility": "visible"}	2024-03-27 13:22:04.758323	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1022	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545727326, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 211, "duration": 3557, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "CxyFOZwgNF"}	2024-03-27 13:22:08.804714	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1023	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545727341, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 3779, "duration": 4, "event_type": "timing", "trigger_event": "CxyFOZwgNF"}	2024-03-27 13:22:08.804718	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1024	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545727748, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 218, "duration": 3971, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "CxyFOZwgNF"}	2024-03-27 13:22:08.804719	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
964	dashboard	2	{"path": "/superset/dashboard/2/", "native_filters_key": "IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj", "url_rule": "/superset/dashboard/<dashboard_id_or_slug>/", "object_ref": "Superset.dashboard", "dashboard_id_or_slug": "2", "dashboard_id": 2, "dashboard_version": "v2", "dash_edit_perm": true, "edit_mode": false}	2024-03-27 13:20:25.797001	2	0	88	\N
968	DashboardFilterStateRestApi.get	2	{"path": "/api/v1/dashboard/2/filter_state/IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state/<string:key>", "object_ref": "DashboardFilterStateRestApi.get", "pk": 2, "key": "IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj"}	2024-03-27 13:20:26.443619	\N	0	23	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
975	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545630211, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 987, "duration": 3560, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "AKBy_6FYHv"}	2024-03-27 13:20:31.623833	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
976	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545630259, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 4581, "duration": 15, "event_type": "timing", "trigger_event": "AKBy_6FYHv"}	2024-03-27 13:20:31.623836	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
977	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545630561, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 996, "duration": 3902, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "AKBy_6FYHv"}	2024-03-27 13:20:31.623837	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
978	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545630588, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 4909, "duration": 17, "event_type": "timing", "trigger_event": "AKBy_6FYHv"}	2024-03-27 13:20:31.623838	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
983	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:36.87698	\N	0	20	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
993	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545639774, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "6F3mG2C8d", "visibility": "visible"}	2024-03-27 13:20:40.867446	2	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
998	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:45.565836	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1002	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:56.37831	\N	0	13	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1007	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:58.767744	\N	0	42	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1014	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:22:03.733914	\N	0	73	http://5.250.180.35:30980/superset/dashboard/2/
1028	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:09.814848	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1037	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:22:17.299839	2	0	7	http://5.250.180.35:30980/superset/dashboard/2/
1046	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:22:21.21848	2	2	3742	http://5.250.180.35:30980/superset/dashboard/2/
1053	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:23.384979	\N	0	17	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1057	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:25.493097	\N	0	47	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1061	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:30.57178	\N	0	8	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1078	DatasetRestApi.info	4	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:03.559542	\N	0	16	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
967	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:20:26.407934	\N	0	67	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
974	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"native_filters_key": "IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:20:30.535496	2	2	3816	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
982	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545635426, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "37JgtjHqf", "visibility": "visible"}	2024-03-27 13:20:36.465669	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
987	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545636774, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "1t4tMd_MA", "visibility": "visible"}	2024-03-27 13:20:38.902198	2	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
988	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545637658, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "UEzvo7z-W", "visibility": "visible"}	2024-03-27 13:20:38.902201	2	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
989	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545637871, "event_name": "mount_explorer", "event_type": "user", "event_id": "Q8LIzvM5U3", "visibility": "visible"}	2024-03-27 13:20:38.902203	2	0	0	http://5.250.180.35:30980/explore/?datasource_type=table&datasource_id=10
992	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:20:39.888605	\N	0	13	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
997	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545642837, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "fHBMsM9cM", "visibility": "visible"}	2024-03-27 13:20:43.872658	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1003	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:20:56.38333	\N	0	55	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1008	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:20:58.881459	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1015	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:03.796529	\N	0	14	http://5.250.180.35:30980/superset/dashboard/2/
1016	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:22:04.333905	\N	0	29	http://5.250.180.35:30980/superset/dashboard/2/
1021	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:22:07.997317	\N	0	21	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1029	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545729590, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "oxO39Nh6b", "visibility": "visible"}	2024-03-27 13:22:10.626642	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1033	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:13.738011	\N	0	22	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1039	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:22:17.358154	\N	0	76	http://5.250.180.35:30980/superset/dashboard/2/
1047	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:22:22.14226	\N	0	19	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1055	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545743261, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "oSXZrL6LO", "visibility": "visible"}	2024-03-27 13:22:24.303264	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1059	log	7	{"source": "sqlLab", "ts": 1711545745357, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "jLS1CSEYbp", "visibility": "visible"}	2024-03-27 13:22:26.38874	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1062	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:31.519842	\N	0	22	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1066	DashboardRestApi.info	4	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:32.849178	\N	0	16	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1025	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545727766, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 4202, "duration": 6, "event_type": "timing", "trigger_event": "CxyFOZwgNF"}	2024-03-27 13:22:08.80472	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1031	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:12.429731	\N	0	48	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1035	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:13.865067	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1040	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:17.436257	\N	0	16	http://5.250.180.35:30980/superset/dashboard/2/
1041	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:22:17.94128	\N	0	26	http://5.250.180.35:30980/superset/dashboard/2/
1044	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:22:19.692063	\N	0	21	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1048	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545740918, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 225, "duration": 3519, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "9jCeC0Tf5X"}	2024-03-27 13:22:22.286479	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1049	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545740941, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 3761, "duration": 4, "event_type": "timing", "trigger_event": "9jCeC0Tf5X"}	2024-03-27 13:22:22.286482	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1050	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545741240, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 233, "duration": 3832, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "9jCeC0Tf5X"}	2024-03-27 13:22:22.286484	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1051	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545741252, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 4073, "duration": 4, "event_type": "timing", "trigger_event": "9jCeC0Tf5X"}	2024-03-27 13:22:22.286485	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1076	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:02.758529	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1083	DatasetRestApi.get_list	2	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:05.631215	\N	0	37	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1088	log	2	{"source": "sqlLab", "ts": 1711545787602, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "B72EdbgBM", "visibility": "visible"}	2024-03-27 13:23:08.639373	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1096	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:23:12.383197	2	1	3312	http://5.250.180.35:30980/superset/dashboard/2/
1101	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711545792406, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 299, "duration": 3403, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "50DeJS2vHb"}	2024-03-27 13:23:14.746776	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1102	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711545792432, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 3716, "duration": 12, "event_type": "timing", "trigger_event": "50DeJS2vHb"}	2024-03-27 13:23:14.74678	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1131	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:24:02.720142	\N	0	50	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1043	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "9unYGs9AS", "version": "v2", "ts": 1711545737368, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 193, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "9jCeC0Tf5X", "visibility": "visible"}	2024-03-27 13:22:18.397495	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1054	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:23.477962	\N	0	14	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1058	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:25.593774	\N	0	12	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1063	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:31.544365	\N	0	41	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1068	log	4	{"source": "sqlLab", "ts": 1711545752739, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "doVCm3Rf0Y", "visibility": "visible"}	2024-03-27 13:22:33.772607	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1072	log	2	{"source": "sqlLab", "ts": 1711545768281, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "NhqBT7SNBp", "visibility": "visible"}	2024-03-27 13:22:49.314621	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1077	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:02.77734	\N	0	46	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1082	DatasetRestApi.info	2	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:05.618715	\N	0	15	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1087	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:23:07.820364	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1092	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:23:09.022596	\N	0	13	http://5.250.180.35:30980/superset/dashboard/2/
1093	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:23:09.540667	\N	0	28	http://5.250.180.35:30980/superset/dashboard/2/
1098	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:13.796554	\N	0	17	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1107	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:30.957923	\N	0	44	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1115	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:23:41.649148	\N	0	1047	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table
1490	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:01:50.525156	\N	0	75	http://5.250.180.35:30980/superset/welcome/
1494	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-28 07:01:50.661312	\N	0	17	http://5.250.180.35:30980/superset/welcome/
1498	log	7	{"source": "sqlLab", "ts": 1711609310296, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "qdvuC3mzK3", "visibility": "visible"}	2024-03-28 07:01:51.914731	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1499	log	7	{"source": "sqlLab", "ts": 1711609310874, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "W6hYvnrZW", "visibility": "visible"}	2024-03-28 07:01:51.914735	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1503	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-28 07:01:52.45581	\N	0	14	http://5.250.180.35:30980/superset/dashboard/2/
1505	log	7	{"source": "sqlLab", "ts": 1711609311955, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "sJWTfRMdh", "visibility": "visible"}	2024-03-28 07:01:53.23911	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1506	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609312202, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 248, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "2D1Jb_sNJP", "visibility": "visible"}	2024-03-28 07:01:53.239114	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1052	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:23.374822	\N	0	48	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1056	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:22:25.462863	\N	0	23	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1060	ChartRestApi.get_list	4	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:30.565846	\N	0	42	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1064	log	4	{"source": "sqlLab", "ts": 1711545750421, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "hbOjKHPpit", "visibility": "visible"}	2024-03-27 13:22:32.455363	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1065	log	4	{"source": "sqlLab", "ts": 1711545751419, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "fUPUcxar7", "visibility": "visible"}	2024-03-27 13:22:32.455366	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1069	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:48.436907	\N	0	42	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1073	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:01.598991	\N	0	38	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1079	DatasetRestApi.get_list	4	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:03.58015	\N	0	40	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1085	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:07.677905	\N	0	23	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1089	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:23:08.796422	\N	0	19	http://5.250.180.35:30980/superset/dashboard/2/
1097	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:23:12.808355	2	2	3735	http://5.250.180.35:30980/superset/dashboard/2/
1106	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:23:30.925606	\N	0	19	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1111	ExploreRestApi.get	4	{"path": "/api/v1/explore/", "viz_type": "big_number_total", "datasource_id": "2", "datasource_type": "table", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:23:40.420211	\N	0	21	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table
1114	ExploreFormDataRestApi.post	4	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:23:41.591728	\N	0	29	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table
1492	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-28 07:01:50.656293	\N	0	25	http://5.250.180.35:30980/superset/welcome/
1495	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:01:51.048601	\N	0	17	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1501	DashboardRestApi.get	7	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-28 07:01:52.161781	2	0	3	http://5.250.180.35:30980/superset/dashboard/2/
1508	ChartDataRestApi.data	7	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-28 07:01:58.258695	2	2	5774	http://5.250.180.35:30980/superset/dashboard/2/
1515	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609322094, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "-nsJt3sW3", "visibility": "visible"}	2024-03-28 07:02:03.131099	2	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1519	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609323567, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "NbJSGBdK3", "visibility": "visible"}	2024-03-28 07:02:04.603886	2	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1067	DashboardRestApi.get_list	4	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:22:32.873708	\N	0	45	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1071	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:22:48.557426	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1075	log	4	{"source": "sqlLab", "ts": 1711545781460, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "lhjXWx8MTf", "visibility": "visible"}	2024-03-27 13:23:02.491746	\N	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1080	log	4	{"source": "sqlLab", "ts": 1711545782646, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "KEnkoPlQw", "visibility": "visible"}	2024-03-27 13:23:04.502306	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1081	log	4	{"source": "sqlLab", "ts": 1711545783475, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "YPCcFJtuWe", "visibility": "visible"}	2024-03-27 13:23:04.502309	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1086	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:07.703932	\N	0	42	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1091	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:23:08.897305	\N	0	79	http://5.250.180.35:30980/superset/dashboard/2/
1099	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:23:13.818342	\N	0	49	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1108	log	4	{"source": "sqlLab", "ts": 1711545810809, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "KU9Kn2G1x", "visibility": "visible"}	2024-03-27 13:23:31.845699	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1112	log	4	{"source": "sqlLab", "ts": 1711545820028, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "uOdYVp_lE", "visibility": "visible"}	2024-03-27 13:23:41.5543	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table
1113	log	4	{"source": "sqlLab", "ts": 1711545820519, "event_name": "mount_explorer", "event_type": "user", "event_id": "d7910LBAI", "visibility": "visible"}	2024-03-27 13:23:41.554303	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table
1513	DatasetRestApi.get_list	7	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-28 07:02:02.239547	\N	0	40	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1516	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:02:03.693906	\N	0	16	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1520	SqlLabRestApi.get	7	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-28 07:02:06.137135	\N	0	15	http://5.250.180.35:30980/sqllab/
1521	DatabaseRestApi.get_list	7	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-28 07:02:06.423992	\N	0	43	http://5.250.180.35:30980/sqllab/
1523	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609325842, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "lamluJiQw", "visibility": "visible"}	2024-03-28 07:02:07.265289	2	0	0	http://5.250.180.35:30980/sqllab/
1524	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "T_j89WtDP", "version": "v2", "ts": 1711609326230, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.36, "query_count": 0, "event_type": "user", "event_id": "7lbe2DLPED", "visibility": "visible"}	2024-03-28 07:02:07.265293	2	0	0	http://5.250.180.35:30980/sqllab/
1529	DatabaseRestApi.table_metadata	7	{"path": "/api/v1/database/1/table/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_metadata"}	2024-03-28 07:02:13.261684	\N	0	1343	http://5.250.180.35:30980/sqllab/
1084	log	2	{"source": "sqlLab", "ts": 1711545785461, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "xPT_vuFP9", "visibility": "visible"}	2024-03-27 13:23:06.498388	\N	0	0	http://5.250.180.35:30980/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
1090	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:23:08.799024	2	0	10	http://5.250.180.35:30980/superset/dashboard/2/
1094	log	2	{"source": "sqlLab", "ts": 1711545788704, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "vyBKNbgYF", "visibility": "visible"}	2024-03-27 13:23:09.872089	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1095	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711545788839, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 135, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "50DeJS2vHb", "visibility": "visible"}	2024-03-27 13:23:09.872093	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1100	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:23:13.929597	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1109	log	4	{"source": "sqlLab", "ts": 1711545812544, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "_252f3nKK", "visibility": "visible"}	2024-03-27 13:23:33.575703	\N	0	0	http://5.250.180.35:30980/chart/add
1525	DatabaseRestApi.tables	7	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-28 07:02:07.358268	\N	0	412	http://5.250.180.35:30980/sqllab/
1528	DatabaseRestApi.table_extra_metadata	7	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-28 07:02:12.871191	\N	0	914	http://5.250.180.35:30980/sqllab/
1103	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711545792835, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 309, "duration": 3822, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "50DeJS2vHb"}	2024-03-27 13:23:14.746781	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1104	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711545792853, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 4137, "duration": 12, "event_type": "timing", "trigger_event": "50DeJS2vHb"}	2024-03-27 13:23:14.746782	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1105	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711545793709, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "4cVWYdZBD", "visibility": "visible"}	2024-03-27 13:23:14.746783	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1110	DatasetRestApi.get_list	4	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:'')),order_column:table_name,order_direction:asc,page:0,page_size:100)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": ""}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:23:36.575443	\N	0	40	http://5.250.180.35:30980/chart/add
1116	log	4	{"source": "sqlLab", "ts": 1711545824251, "event_name": "change_explore_controls", "event_type": "user", "event_id": "7bxt9ujEv", "visibility": "visible"}	2024-03-27 13:23:45.283619	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table
1117	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:23:47.353081	\N	0	673	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table
1118	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:23:47.690024	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table
1119	log	4	{"source": "sqlLab", "ts": 1711545827375, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "2__table", "start_offset": 6611, "duration": 736, "viz_type": "big_number_total", "data_age": null, "event_type": "timing", "trigger_event": "7bxt9ujEv"}	2024-03-27 13:23:48.461432	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table
1120	log	4	{"source": "sqlLab", "ts": 1711545827432, "event_name": "render_chart", "slice_id": 0, "viz_type": "big_number_total", "start_offset": 7351, "duration": 52, "event_type": "timing", "trigger_event": "7bxt9ujEv"}	2024-03-27 13:23:48.461435	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table
1121	ChartRestApi.post	4	{"path": "/api/v1/chart/", "object_ref": "ChartRestApi.post"}	2024-03-27 13:24:00.349806	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table
1122	ExploreRestApi.get	4	{"path": "/api/v1/explore/", "viz_type": "big_number_total", "datasource_id": "2", "datasource_type": "table", "save_action": "saveas", "slice_id": "3", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:24:00.499412	\N	3	35	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1123	ChartRestApi.favorite_status	4	{"path": "/api/v1/chart/favorite_status/", "q": "!(3)", "object_ref": "ChartRestApi.favorite_status", "rison": [3]}	2024-03-27 13:24:00.616012	\N	0	17	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1124	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [], "metrics": ["count"], "annotation_layers": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "2", "datasource_type": "table", "save_action": "saveas", "slice_id": "3", "viz_type": "big_number_total"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 3}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:24:01.347769	\N	3	728	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1125	ExploreFormDataRestApi.post	4	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:24:01.624706	\N	0	39	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1126	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:24:01.724228	\N	0	1075	http://5.250.180.35:30980/explore/?viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1127	log	4	{"source": "explore", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711545840525, "event_name": "change_explore_controls", "event_type": "user", "event_id": "lES9tdKz_", "visibility": "visible"}	2024-03-27 13:24:02.411429	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=xuwsY-nGkslkiEly_5wCU-_WWMiMsHfL4_lzpTOFQrjfuyAPvA0nsg0MI46l9vdQ&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1130	ChartRestApi.info	4	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:24:02.688889	\N	0	15	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1128	log	4	{"source": "explore", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711545841369, "event_name": "load_chart", "slice_id": 3, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "2__table", "start_offset": 20532, "duration": 809, "viz_type": "big_number_total", "data_age": null, "event_type": "timing", "trigger_event": "lES9tdKz_"}	2024-03-27 13:24:02.411433	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=xuwsY-nGkslkiEly_5wCU-_WWMiMsHfL4_lzpTOFQrjfuyAPvA0nsg0MI46l9vdQ&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1129	log	4	{"source": "explore", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711545841379, "event_name": "render_chart", "slice_id": 3, "viz_type": "big_number_total", "start_offset": 21345, "duration": 5, "event_type": "timing", "trigger_event": "lES9tdKz_"}	2024-03-27 13:24:02.411434	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=xuwsY-nGkslkiEly_5wCU-_WWMiMsHfL4_lzpTOFQrjfuyAPvA0nsg0MI46l9vdQ&viz_type=big_number_total&datasource=2__table&datasource_id=2&datasource_type=table&save_action=saveas&slice_id=3
1134	log	4	{"source": "explore", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711545844061, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "CVfmmHvdw", "visibility": "visible"}	2024-03-27 13:24:05.091426	\N	0	0	http://5.250.180.35:30980/chart/add
1138	log	4	{"source": "explore", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711545886261, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "jeC4OfzVl", "visibility": "visible"}	2024-03-27 13:24:47.544244	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table
1139	log	4	{"source": "sqlLab", "ts": 1711545886464, "event_name": "mount_explorer", "event_type": "user", "event_id": "FSPUNYXFPv", "visibility": "visible"}	2024-03-27 13:24:47.544248	\N	0	0	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table
1142	DatasetRestApi.get_list	4	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:25:06.684988	\N	0	248	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1149	log	4	{"source": "sqlLab", "ts": 1711545928960, "event_name": "change_explore_controls", "event_type": "user", "event_id": "85R3EiHqm", "visibility": "visible"}	2024-03-27 13:25:29.991974	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1152	log	4	{"source": "sqlLab", "ts": 1711545931777, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}], "is_cached": null, "force_refresh": false, "row_count": 1, "datasource": "5__table", "start_offset": 44115, "duration": 1402, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "85R3EiHqm"}	2024-03-27 13:25:32.857695	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1153	log	4	{"source": "sqlLab", "ts": 1711545931828, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 45525, "duration": 42, "event_type": "timing", "trigger_event": "85R3EiHqm"}	2024-03-27 13:25:32.857698	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1157	log	4	{"source": "sqlLab", "ts": 1711545944605, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}], "is_cached": null, "force_refresh": false, "row_count": 1847, "datasource": "5__table", "start_offset": 56863, "duration": 1481, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "fo-XbLSJF"}	2024-03-27 13:25:45.682972	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1158	log	4	{"source": "sqlLab", "ts": 1711545944652, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 58353, "duration": 39, "event_type": "timing", "trigger_event": "fo-XbLSJF"}	2024-03-27 13:25:45.682975	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1163	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:26:05.602803	\N	0	1372	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1167	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:26:19.665814	\N	0	60	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1173	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:26:41.146991	\N	0	50	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1178	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:27:31.333961	\N	0	806	http://5.250.180.35:30980/explore/?slice_id=2
1181	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:27:31.52564	\N	0	31	http://5.250.180.35:30980/explore/?slice_id=2
1186	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546060073, "event_name": "change_explore_controls", "event_type": "user", "event_id": "gSiymXnGt", "visibility": "visible"}	2024-03-27 13:27:41.140414	2	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1531	root	7	{"path": "/sqllab/", "object_ref": "SqllabView.root"}	2024-03-28 07:02:54.926249	\N	0	79	\N
1132	ChartRestApi.favorite_status	4	{"path": "/api/v1/chart/favorite_status/", "q": "!(3)", "object_ref": "ChartRestApi.favorite_status", "rison": [3]}	2024-03-27 13:24:02.840247	\N	0	19	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1137	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:24:47.542493	\N	0	1019	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table
1141	DatasetRestApi.info	4	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:25:05.984272	\N	0	13	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1148	log	4	{"source": "sqlLab", "ts": 1711545917233, "event_name": "change_explore_controls", "event_type": "user", "event_id": "Qy4yDGg54", "visibility": "visible"}	2024-03-27 13:25:18.302851	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1150	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:25:31.457849	\N	0	28	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1159	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:25:50.474241	\N	0	26	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1162	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:26:05.266374	\N	0	23	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1172	ChartRestApi.info	2	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:26:41.108922	\N	0	18	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1177	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(2)", "object_ref": "ChartRestApi.favorite_status", "rison": [2]}	2024-03-27 13:27:30.497978	\N	0	19	http://5.250.180.35:30980/explore/?slice_id=2
1188	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:27:43.105757	\N	2	2118	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1192	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:27:59.396906	\N	0	31	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1196	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:28:09.556535	2	0	7	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1199	DatabaseRestApi.table_extra_metadata	2	{"path": "/api/v1/database/1/table_extra/customer_enriched/compliance_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:28:10.701898	\N	0	686	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
1204	DashboardRestApi.get_charts	2	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:28:11.79848	\N	0	20	http://5.250.180.35:30980/superset/dashboard/2/
1216	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:28:14.893326	2	1	2954	http://5.250.180.35:30980/superset/dashboard/2/
1224	DashboardRestApi.put	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "2"}	2024-03-27 13:28:21.272194	\N	0	34	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1227	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:28:24.468227	\N	0	48	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1532	SqlLabRestApi.get	7	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-28 07:02:55.632933	\N	0	19	http://5.250.180.35:30980/sqllab/
1133	log	4	{"source": "explore", "source_id": 3, "impression_id": "kkWMKvUsP", "version": "v2", "ts": 1711545842614, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "7jVpQouzA", "visibility": "visible"}	2024-03-27 13:24:03.646397	\N	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1143	DatasetRestApi.get	4	{"path": "/api/v1/dataset/5", "url_rule": "/api/v1/dataset/<int:pk>", "rison": {}}	2024-03-27 13:25:13.262574	\N	0	117	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1151	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:25:31.751193	\N	0	1336	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1155	ExploreFormDataRestApi.put	4	{"path": "/api/v1/explore/form_data/nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF"}	2024-03-27 13:25:44.163534	\N	0	20	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1160	log	4	{"source": "sqlLab", "ts": 1711545952027, "event_name": "change_explore_controls", "event_type": "user", "event_id": "K5L-Oqow9", "visibility": "visible"}	2024-03-27 13:25:53.065997	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1164	log	4	{"source": "sqlLab", "ts": 1711545965631, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}], "is_cached": null, "force_refresh": false, "row_count": 665, "datasource": "5__table", "start_offset": 77927, "duration": 1443, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "jpridphPj"}	2024-03-27 13:26:06.693663	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1165	log	4	{"source": "sqlLab", "ts": 1711545965666, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 79382, "duration": 23, "event_type": "timing", "trigger_event": "jpridphPj"}	2024-03-27 13:26:06.693666	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1169	log	4	{"source": "sqlLab", "ts": 1711545980013, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "birth_date"}], "is_cached": null, "force_refresh": false, "row_count": 665, "datasource": "5__table", "start_offset": 92328, "duration": 1424, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "A-XwDgFi3"}	2024-03-27 13:26:21.06397	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1170	log	4	{"source": "sqlLab", "ts": 1711545980037, "event_name": "render_chart", "slice_id": 0, "viz_type": "pivot_table_v2", "start_offset": 93766, "duration": 10, "event_type": "timing", "trigger_event": "A-XwDgFi3"}	2024-03-27 13:26:21.063973	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1175	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546000947, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "TbSb6nf2H", "visibility": "visible"}	2024-03-27 13:26:41.981085	2	0	0	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1179	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546050134, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "b40uQBKoA", "visibility": "visible"}	2024-03-27 13:27:31.433923	2	0	0	http://5.250.180.35:30980/explore/?slice_id=2
1180	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546050407, "event_name": "mount_explorer", "event_type": "user", "event_id": "62Ph8znz2o", "visibility": "visible"}	2024-03-27 13:27:31.433927	2	0	0	http://5.250.180.35:30980/explore/?slice_id=2
1183	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546052852, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 618, "duration": 2098, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "62Ph8znz2o"}	2024-03-27 13:27:33.957738	2	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1184	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546052870, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 2730, "duration": 5, "event_type": "timing", "trigger_event": "62Ph8znz2o"}	2024-03-27 13:27:33.957742	2	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1187	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:27:41.948317	\N	0	25	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1195	ChartRestApi.get	2	{"path": "/api/v1/chart/2", "q": "(columns:!(dashboards.id))", "url_rule": "/api/v1/chart/<int:pk>", "rison": {"columns": ["dashboards.id"]}}	2024-03-27 13:28:09.457302	\N	0	22	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1198	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "form_data_key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "slice_id": "2", "save_action": "overwrite", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:28:09.871261	\N	2	60	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
1135	DatasetRestApi.get_list	4	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:'')),order_column:table_name,order_direction:asc,page:0,page_size:100)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": ""}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-27 13:24:28.836367	\N	0	37	http://5.250.180.35:30980/chart/add
1144	DatabaseRestApi.table_extra_metadata	4	{"path": "/api/v1/database/1/table_extra/customer_enriched/customer_analytics/", "url_rule": "/api/v1/database/<int:pk>/table_extra/<path:table_name>/<schema_name>/", "object_ref": "DatabaseRestApi.table_extra_metadata"}	2024-03-27 13:25:14.102944	\N	0	697	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1156	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:25:44.534518	\N	0	1332	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1161	log	4	{"source": "sqlLab", "ts": 1711545962991, "event_name": "change_explore_controls", "event_type": "user", "event_id": "jpridphPj", "visibility": "visible"}	2024-03-27 13:26:04.058105	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1168	ChartDataRestApi.data	4	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:26:19.984891	\N	0	1319	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1174	ChartRestApi.favorite_status	2	{"path": "/api/v1/chart/favorite_status/", "q": "!(1,2)", "object_ref": "ChartRestApi.favorite_status", "rison": [1, 2]}	2024-03-27 13:26:41.276337	\N	0	17	http://5.250.180.35:30980/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1182	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:27:32.824862	\N	2	2026	http://5.250.180.35:30980/explore/?slice_id=2
1191	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:27:50.616797	\N	0	27	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1194	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:28:08.100506	2	0	6	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1201	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:28:10.939852	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1202	ExploreFormDataRestApi.post	2	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:28:11.014282	\N	0	33	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1206	DashboardRestApi.get_datasets	2	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:28:11.887703	\N	0	68	http://5.250.180.35:30980/superset/dashboard/2/
1210	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546089904, "event_name": "change_explore_controls", "event_type": "user", "event_id": "ksonnmWWX5", "visibility": "visible"}	2024-03-27 13:28:13.286104	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1211	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546090825, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "x50p_u7u8", "visibility": "visible"}	2024-03-27 13:28:13.286108	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1212	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546091723, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "8S5pFoAn9P", "visibility": "visible"}	2024-03-27 13:28:13.28611	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1213	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546091853, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 130, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "xQXOrKEaNh", "visibility": "visible"}	2024-03-27 13:28:13.286111	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1214	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546092240, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 39822, "duration": -39306, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "xQXOrKEaNh"}	2024-03-27 13:28:13.286113	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1215	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546092250, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 523, "duration": 3, "event_type": "timing", "trigger_event": "xQXOrKEaNh"}	2024-03-27 13:28:13.286114	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1136	ExploreRestApi.get	4	{"path": "/api/v1/explore/", "viz_type": "pivot_table_v2", "datasource_id": "2", "datasource_type": "table", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:24:46.357258	\N	0	20	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table
1140	ExploreFormDataRestApi.post	4	{"path": "/api/v1/explore/form_data", "tab_id": "1", "object_ref": "ExploreFormDataRestApi.post"}	2024-03-27 13:24:47.569633	\N	0	29	http://5.250.180.35:30980/explore/?viz_type=pivot_table_v2&datasource=2__table
1145	log	4	{"source": "sqlLab", "ts": 1711545913303, "event_name": "change_explore_controls", "event_type": "user", "event_id": "GgOUVfhMEs", "visibility": "visible"}	2024-03-27 13:25:14.390951	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1146	log	4	{"source": "sqlLab", "ts": 1711545913321, "event_name": "change_explore_controls", "event_type": "user", "event_id": "L7pUlDHshE", "visibility": "visible"}	2024-03-27 13:25:14.390954	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1147	log	4	{"source": "sqlLab", "ts": 1711545913362, "event_name": "change_explore_controls", "event_type": "user", "event_id": "Qh-_3AgbSI", "visibility": "visible"}	2024-03-27 13:25:14.390956	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=2&datasource_type=table
1154	log	4	{"source": "sqlLab", "ts": 1711545942194, "event_name": "change_explore_controls", "event_type": "user", "event_id": "fo-XbLSJF", "visibility": "visible"}	2024-03-27 13:25:43.263961	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1166	log	4	{"source": "sqlLab", "ts": 1711545977728, "event_name": "change_explore_controls", "event_type": "user", "event_id": "A-XwDgFi3", "visibility": "visible"}	2024-03-27 13:26:18.796782	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1171	log	4	{"source": "sqlLab", "ts": 1711545983331, "event_name": "change_explore_controls", "event_type": "user", "event_id": "sPrVhqdV-", "visibility": "visible"}	2024-03-27 13:26:24.401237	\N	0	0	http://5.250.180.35:30980/explore/?form_data_key=nekPZROaluou0k1axrdjzHuZS3H-Wg24XClEX95hRyCaneUwna7OVkHM05AkSTXF&viz_type=pivot_table_v2&datasource=2__table&datasource_id=5&datasource_type=table
1176	ExploreRestApi.get	2	{"path": "/api/v1/explore/", "slice_id": "2", "object_ref": "ExploreRestApi.get"}	2024-03-27 13:27:30.239403	\N	2	26	http://5.250.180.35:30980/explore/?slice_id=2
1185	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546054547, "event_name": "change_explore_controls", "event_type": "user", "event_id": "6II6SCVVd", "visibility": "visible"}	2024-03-27 13:27:35.579353	2	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1189	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546063132, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 10772, "duration": 2226, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "gSiymXnGt"}	2024-03-27 13:27:44.182376	2	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1190	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546063149, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 13011, "duration": 3, "event_type": "timing", "trigger_event": "gSiymXnGt"}	2024-03-27 13:27:44.18238	2	0	0	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1208	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {"form_data_key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "save_action": "overwrite", "slice_id": "2"}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:28:12.216798	\N	2	2179	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2&save_action=overwrite
1209	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:28:12.423374	\N	0	25	http://5.250.180.35:30980/superset/dashboard/2/
1219	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546094917, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 159, "duration": 3034, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "xQXOrKEaNh"}	2024-03-27 13:28:16.612705	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1220	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546094935, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 3209, "duration": 3, "event_type": "timing", "trigger_event": "xQXOrKEaNh"}	2024-03-27 13:28:16.612709	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1221	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546095361, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 167, "duration": 3470, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "xQXOrKEaNh"}	2024-03-27 13:28:16.61271	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1193	ExploreFormDataRestApi.put	2	{"path": "/api/v1/explore/form_data/sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N", "tab_id": "1", "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N"}	2024-03-27 13:28:05.71874	\N	0	32	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1197	ChartRestApi.put	2	{"path": "/api/v1/chart/2", "url_rule": "/api/v1/chart/<pk>", "object_ref": "ChartRestApi.put", "pk": "2"}	2024-03-27 13:28:09.670426	\N	0	37	http://5.250.180.35:30980/explore/?form_data_key=sFcF7mH0sUlU1dq90XZF9PZGmuiwblCruUDA95gLmOfvcyZRBDQuAEEwT3JbHl9N&slice_id=2
1200	DashboardRestApi.get_list	2	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:28:10.9286	\N	0	48	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1203	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:28:11.03505	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1207	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:28:11.91381	\N	0	14	http://5.250.180.35:30980/superset/dashboard/2/
1218	ChartRestApi.get_list	2	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:viz_type,opr:neq,value:filter_box),(col:owners,opr:rel_m_m,value:2)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "viz_type", "opr": "neq", "value": "filter_box"}, {"col": "owners", "opr": "rel_m_m", "value": 2}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2024-03-27 13:28:15.719358	\N	0	56	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1229	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546104304, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "Hm6MbJ7tU", "visibility": "visible"}	2024-03-27 13:28:25.341792	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1233	DashboardRestApi.get_charts	7	{"path": "/api/v1/dashboard/2/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "2"}	2024-03-27 13:28:27.33113	\N	0	40	http://5.250.180.35:30980/superset/dashboard/2/
1241	ChartDataRestApi.data	7	{"path": "/api/v1/chart/data", "form_data": {"filters": [], "extras": {"having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"columnType": "BASE_AXIS", "sqlExpression": "birth_year", "label": "birth_year", "expressionType": "SQL"}], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 100000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["birth_year"], "columns": [], "aggregates": {"count": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:28:30.996208	2	1	3353	http://5.250.180.35:30980/superset/dashboard/2/
1249	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:28:32.982184	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1533	DatabaseRestApi.get_list	7	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-28 07:02:55.831468	\N	0	41	http://5.250.180.35:30980/sqllab/
1535	log	7	{"source": "sqlLab", "ts": 1711609375514, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "2TjlLo-_ED", "visibility": "visible"}	2024-03-28 07:02:56.544867	\N	0	0	http://5.250.180.35:30980/sqllab/
1539	log	7	{"source": "sqlLab", "source_id": "4", "db_id": 1, "schema": "compliance_analytics", "ts": 1711609382415, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.56, "query_count": 0, "event_type": "user", "event_id": "oq8x_oT41", "visibility": "visible"}	2024-03-28 07:03:03.486975	\N	0	0	http://5.250.180.35:30980/sqllab/
1541	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:03:14.254796	\N	0	0	http://5.250.180.35:30980/sqllab/
1542	welcome	7	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2024-03-28 07:03:15.247779	\N	0	79	\N
1544	SavedQueryRestApi.get_list	7	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:03:15.943503	\N	0	33	http://5.250.180.35:30980/superset/welcome/
1548	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:03:16.059905	\N	0	50	http://5.250.180.35:30980/superset/welcome/
1552	ChartRestApi.favorite_status	7	{"path": "/api/v1/chart/favorite_status/", "q": "!(2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [2, 1]}	2024-03-28 07:03:16.198192	\N	0	21	http://5.250.180.35:30980/superset/welcome/
1556	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-28 07:03:18.074661	\N	0	454	http://5.250.180.35:30980/sqllab/
1205	DashboardRestApi.get	2	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:28:11.799834	2	0	9	http://5.250.180.35:30980/superset/dashboard/2/
1217	ChartDataRestApi.data	2	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:28:15.335513	2	2	3395	http://5.250.180.35:30980/superset/dashboard/2/
1228	DashboardRestApi.favorite_status	2	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:28:24.576777	\N	0	13	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1232	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:28:26.488015	\N	0	15	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1242	ChartDataRestApi.data	7	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "gender", "op": "IS NOT NULL"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["gender", "marital_status"], "metrics": ["count"], "orderby": [["count", false]], "annotation_layers": [], "row_limit": 10000, "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "slice_id": 2}, "dashboard_id": "2", "object_ref": "ChartDataRestApi.data"}	2024-03-27 13:28:31.404962	2	2	3764	http://5.250.180.35:30980/superset/dashboard/2/
1250	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "YSYl3C_eP", "version": "v2", "ts": 1711546112793, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "oaakaUO9w", "visibility": "visible"}	2024-03-27 13:28:33.819871	2	0	0	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1534	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2024-03-28 07:02:56.288716	\N	0	455	http://5.250.180.35:30980/sqllab/
1538	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:02:58.801643	\N	0	118	http://5.250.180.35:30980/sqllab/
1545	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:03:15.997393	\N	0	94	http://5.250.180.35:30980/superset/welcome/
1549	ChartRestApi.info	7	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:03:16.185542	\N	0	21	http://5.250.180.35:30980/superset/welcome/
1553	log	7	{"source": "sqlLab", "ts": 1711609395802, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "bPtCeYt_gn", "visibility": "visible"}	2024-03-28 07:03:16.839794	\N	0	0	http://5.250.180.35:30980/superset/welcome/
1555	DatabaseRestApi.get_list	7	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2024-03-28 07:03:17.675212	\N	0	46	http://5.250.180.35:30980/sqllab/
1557	log	7	{"source": "sqlLab", "ts": 1711609397332, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "uywayYQnt", "visibility": "visible"}	2024-03-28 07:03:18.363408	\N	0	0	http://5.250.180.35:30980/sqllab/
1222	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546095377, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 3650, "duration": 3, "event_type": "timing", "trigger_event": "xQXOrKEaNh"}	2024-03-27 13:28:16.612711	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1223	log	2	{"source": "dashboard", "source_id": 2, "impression_id": "IwI7U9enA", "version": "v2", "ts": 1711546095578, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "aAr6_EvO-", "visibility": "visible"}	2024-03-27 13:28:16.612712	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=IZko89lzIArEStRxs5dREiOb5bf8cYaBcROLFrtmTaXJ1Ch6EriBMSq1S9UGfUlj
1225	DashboardFilterStateRestApi.post	2	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:28:21.897465	\N	0	30	http://5.250.180.35:30980/superset/dashboard/2/
1234	DashboardRestApi.get	7	{"path": "/api/v1/dashboard/2", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 2}	2024-03-27 13:28:27.333979	2	0	4	http://5.250.180.35:30980/superset/dashboard/2/
1238	log	7	{"source": "sqlLab", "ts": 1711546106251, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "AGDiy5Gpje", "visibility": "visible"}	2024-03-27 13:28:28.402152	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1239	log	7	{"source": "sqlLab", "ts": 1711546107184, "event_name": "spa_navigation", "path": "/superset/dashboard/2/", "event_type": "user", "event_id": "W0SCY8UA2", "visibility": "visible"}	2024-03-27 13:28:28.402156	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1240	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "YSYl3C_eP", "version": "v2", "ts": 1711546107376, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 192, "is_empty": false, "is_published": true, "event_type": "user", "event_id": "2mTt5D_JdQ", "visibility": "visible"}	2024-03-27 13:28:28.402158	\N	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1247	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:28:32.864158	\N	0	18	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1536	DatabaseRestApi.tables	7	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-28 07:02:56.736957	\N	0	373	http://5.250.180.35:30980/sqllab/
1540	SqlLabRestApi.get_results	7	{"path": "/api/v1/sqllab/execute/", "object_ref": "SqlLabRestApi.execute_sql_query"}	2024-03-28 07:03:09.611068	\N	0	525	http://5.250.180.35:30980/sqllab/
1543	LogRestApi.recent_activity	7	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2024-03-28 07:03:15.859324	\N	0	3	http://5.250.180.35:30980/superset/welcome/
1547	ChartRestApi.get_list	7	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:03:16.044346	\N	0	72	http://5.250.180.35:30980/superset/welcome/
1551	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-28 07:03:16.192509	\N	0	20	http://5.250.180.35:30980/superset/welcome/
1559	DatabaseRestApi.function_names	7	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-28 07:03:18.682361	\N	0	1065	http://5.250.180.35:30980/sqllab/
1226	DashboardRestApi.info	2	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:28:24.40859	\N	0	12	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1231	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:28:26.386313	\N	0	50	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1236	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-27 13:28:27.612345	\N	0	14	http://5.250.180.35:30980/superset/dashboard/2/
1237	DashboardFilterStateRestApi.post	7	{"path": "/api/v1/dashboard/2/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 2}	2024-03-27 13:28:28.142952	\N	0	45	http://5.250.180.35:30980/superset/dashboard/2/
1248	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2024-03-27 13:28:32.890806	\N	0	43	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1537	DatabaseRestApi.function_names	7	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2024-03-28 07:02:56.9819	\N	0	1151	http://5.250.180.35:30980/sqllab/
1546	DashboardRestApi.get_list	7	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'7')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "7"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2024-03-28 07:03:15.997751	\N	0	96	http://5.250.180.35:30980/superset/welcome/
1550	DashboardRestApi.favorite_status	7	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2]}	2024-03-28 07:03:16.191057	\N	0	24	http://5.250.180.35:30980/superset/welcome/
1554	SqlLabRestApi.get	7	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2024-03-28 07:03:17.462717	\N	0	19	http://5.250.180.35:30980/sqllab/
1558	DatabaseRestApi.tables	7	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:compliance_analytics)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "compliance_analytics"}}	2024-03-28 07:03:18.487424	\N	0	339	http://5.250.180.35:30980/sqllab/
1561	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:03:39.83751	\N	0	433	http://5.250.180.35:30980/sqllab/
1563	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:04:40.116853	\N	0	112	http://5.250.180.35:30980/sqllab/
1230	DashboardRestApi.info	7	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2024-03-27 13:28:26.359769	\N	0	20	http://5.250.180.35:30980/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
1235	DashboardRestApi.get_datasets	7	{"path": "/api/v1/dashboard/2/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "2"}	2024-03-27 13:28:27.421768	\N	0	85	http://5.250.180.35:30980/superset/dashboard/2/
1243	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "YSYl3C_eP", "version": "v2", "ts": 1711546111019, "event_name": "load_chart", "slice_id": 1, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 69, "datasource": "10__table", "start_offset": 405, "duration": 3430, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "2mTt5D_JdQ"}	2024-03-27 13:28:32.5294	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1244	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "YSYl3C_eP", "version": "v2", "ts": 1711546111069, "event_name": "render_chart", "slice_id": 1, "viz_type": "echarts_timeseries_bar", "start_offset": 3841, "duration": 44, "event_type": "timing", "trigger_event": "2mTt5D_JdQ"}	2024-03-27 13:28:32.529403	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1245	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "YSYl3C_eP", "version": "v2", "ts": 1711546111431, "event_name": "load_chart", "slice_id": 2, "applied_filters": [{"column": "gender"}], "is_cached": null, "force_refresh": false, "row_count": 10, "datasource": "10__table", "start_offset": 414, "duration": 3833, "has_extra_filters": false, "viz_type": "pivot_table_v2", "data_age": null, "event_type": "timing", "trigger_event": "2mTt5D_JdQ"}	2024-03-27 13:28:32.529404	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1246	log	7	{"source": "dashboard", "source_id": 2, "impression_id": "YSYl3C_eP", "version": "v2", "ts": 1711546111495, "event_name": "render_chart", "slice_id": 2, "viz_type": "pivot_table_v2", "start_offset": 4261, "duration": 50, "event_type": "timing", "trigger_event": "2mTt5D_JdQ"}	2024-03-27 13:28:32.529406	2	0	0	http://5.250.180.35:30980/superset/dashboard/2/?native_filters_key=CGebbU8iUSJ8BkmXOOYpWD5lqz1IdnLMhnnBMvJE2nsNqVKJb_C6pGD2-sGkk8d5
1560	log	7	{"source": "sqlLab", "source_id": "4", "db_id": 1, "schema": "compliance_analytics", "ts": 1711609405515, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.61, "query_count": 0, "event_type": "user", "event_id": "GoTJoKFec", "visibility": "visible"}	2024-03-28 07:03:26.587994	\N	0	0	http://5.250.180.35:30980/sqllab/
1562	DatabaseRestApi.schemas	7	{"path": "/api/v1/database/1/schemas/", "q": "(force:!t)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": true}}	2024-03-28 07:04:09.412029	\N	0	421	http://5.250.180.35:30980/sqllab/
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url, extra_json, tmp_schema_name, ctas_method, limiting_factor) FROM stdin;
12	Jrk98FN2w	1	\N	Untitled Query 1	1	2	success	customer_analytics	--show schemas in lakehouse;\n--select * from customer_enriched limit 10;\nselect c_email_address from customer limit 10;	\N	select c_email_address from customer limit 11	10	f	f	100	10	\N	1711543015117.561000	2024-03-27 12:36:56.182014	1711543016181.262000	\N	1711543015150.273200	\N	https://trino-coordinator:8443/ui/query.html?20240327_123655_00328_ju8t6	{"progress": null, "cancel_query": "20240327_123655_00328_ju8t6", "columns": [{"column_name": "c_email_address", "name": "c_email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	QUERY
1	Mw4uBVfKu_	1	\N	Untitled Query 1	1	2	failed	compliance_analytics	SELECT ...	\N	SELECT ...	1000	f	f	0	\N	trino error: line 1:8: mismatched input '.'. Expecting: '*', 'ALL', 'DISTINCT', <expression>	1711542829589.144000	2024-03-27 12:33:50.057334	1711542830054.184800	\N	1711542829624.156000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123349_00275_ju8t6	{"progress": "Running statement 1 out of 1", "cancel_query": "20240327_123349_00275_ju8t6", "errors": [{"message": "trino error: line 1:8: mismatched input '.'. Expecting: '*', 'ALL', 'DISTINCT', <expression>", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": "Trino", "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
2	QS4LZrTz6	1	\N	Untitled Query 1	1	2	success	\N	show catalogs;	\N	show catalogs	1000	f	f	100	2	\N	1711542848571.085000	2024-03-27 12:34:09.053908	1711542849052.810000	\N	1711542848604.193800	\N	https://trino-coordinator:8443/ui/query.html?20240327_123408_00282_ju8t6	{"progress": null, "cancel_query": "20240327_123408_00282_ju8t6", "columns": [{"column_name": "Catalog", "name": "Catalog", "type": "VARCHAR(9)", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	NOT_LIMITED
3	4mbK6KXOk	1	\N	Untitled Query 1	1	2	success	\N	show schemas in lakehouse;	\N	show schemas in lakehouse	1000	f	f	100	3	\N	1711542853137.856000	2024-03-27 12:34:13.317387	1711542853316.668000	\N	1711542853171.211000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123413_00283_ju8t6	{"progress": null, "cancel_query": "20240327_123413_00283_ju8t6", "columns": [{"column_name": "Schema", "name": "Schema", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	NOT_LIMITED
4	vk2GJA5K9	1	\N	Untitled Query 1	1	2	success	compliance_analytics	show schemas in lakehouse;\nselect * from customer_enriched;	\N	select * from customer_enriched\nLIMIT 1001	1000	f	f	100	1000	\N	1711542919372.418000	2024-03-27 12:35:22.807514	1711542922806.228000	\N	1711542919409.512000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123519_00303_ju8t6	{"progress": null, "cancel_query": "20240327_123519_00303_ju8t6", "columns": [{"column_name": "customer_id", "name": "customer_id", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "salutation", "name": "salutation", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "preferred_customer", "name": "preferred_customer", "type": "BOOLEAN", "type_generic": 3, "is_dttm": false}, {"column_name": "birth_year", "name": "birth_year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "email_address", "name": "email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "country", "name": "country", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "state", "name": "state", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "zip", "name": "zip", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "city", "name": "city", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "gmt_offset", "name": "gmt_offset", "type": "DECIMAL(5, 2)", "type_generic": 0, "is_dttm": false}, {"column_name": "gender", "name": "gender", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "marital_status", "name": "marital_status", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	DROPDOWN
5	PM3mRsNy9	1	\N	Untitled Query 1	1	2	success	compliance_analytics	show schemas in lakehouse;\nselect * from customer_enriched;	\N	select * from customer_enriched\nLIMIT 1001	1000	f	f	100	1000	\N	1711542926621.373800	2024-03-27 12:35:29.459486	1711542929458.469000	\N	1711542926658.553000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123527_00305_ju8t6	{"progress": null, "cancel_query": "20240327_123527_00305_ju8t6", "columns": [{"column_name": "customer_id", "name": "customer_id", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "salutation", "name": "salutation", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "preferred_customer", "name": "preferred_customer", "type": "BOOLEAN", "type_generic": 3, "is_dttm": false}, {"column_name": "birth_year", "name": "birth_year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "email_address", "name": "email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "country", "name": "country", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "state", "name": "state", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "zip", "name": "zip", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "city", "name": "city", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "gmt_offset", "name": "gmt_offset", "type": "DECIMAL(5, 2)", "type_generic": 0, "is_dttm": false}, {"column_name": "gender", "name": "gender", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "marital_status", "name": "marital_status", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	DROPDOWN
6	0MdMJL60h	1	\N	Untitled Query 1	1	2	success	compliance_analytics	show schemas in lakehouse;\nselect count(*) from customer_enriched;	\N	select count(*) from customer_enriched\nLIMIT 1001	1000	f	f	100	1	\N	1711542939438.598000	2024-03-27 12:35:41.945619	1711542941944.849900	\N	1711542939477.136000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123539_00307_ju8t6	{"progress": null, "cancel_query": "20240327_123539_00307_ju8t6", "columns": [{"column_name": "_col0", "name": "_col0", "type": "BIGINT", "type_generic": 0, "is_dttm": false}]}	\N	TABLE	NOT_LIMITED
7	EDJ0I0tSu	1	\N	Untitled Query 1	1	2	success	compliance_analytics	show schemas in lakehouse;\nselect * from customer_enriched limit 10;	\N	select * from customer_enriched limit 11	10	f	f	100	10	\N	1711542951873.389000	2024-03-27 12:35:54.888638	1711542954887.568800	\N	1711542951910.428000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123552_00309_ju8t6	{"progress": null, "cancel_query": "20240327_123552_00309_ju8t6", "columns": [{"column_name": "customer_id", "name": "customer_id", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "salutation", "name": "salutation", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "preferred_customer", "name": "preferred_customer", "type": "BOOLEAN", "type_generic": 3, "is_dttm": false}, {"column_name": "birth_year", "name": "birth_year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "email_address", "name": "email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "country", "name": "country", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "state", "name": "state", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "zip", "name": "zip", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "city", "name": "city", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "gmt_offset", "name": "gmt_offset", "type": "DECIMAL(5, 2)", "type_generic": 0, "is_dttm": false}, {"column_name": "gender", "name": "gender", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "marital_status", "name": "marital_status", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	QUERY
13	2N_nz05vF	1	\N	Untitled Query 1	1	2	success	compliance_analytics	--show schemas in lakehouse;\nselect * from customer_enriched limit 10;\n--select c_email_address from customer limit 10;	\N	select * from customer_enriched limit 11	10	f	f	100	10	\N	1711543024213.791000	2024-03-27 12:37:06.936934	1711543026935.951000	\N	1711543024248.967800	\N	https://trino-coordinator:8443/ui/query.html?20240327_123704_00329_ju8t6	{"progress": null, "cancel_query": "20240327_123704_00329_ju8t6", "columns": [{"column_name": "customer_id", "name": "customer_id", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "salutation", "name": "salutation", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "preferred_customer", "name": "preferred_customer", "type": "BOOLEAN", "type_generic": 3, "is_dttm": false}, {"column_name": "birth_year", "name": "birth_year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "email_address", "name": "email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "country", "name": "country", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "state", "name": "state", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "zip", "name": "zip", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "city", "name": "city", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "gmt_offset", "name": "gmt_offset", "type": "DECIMAL(5, 2)", "type_generic": 0, "is_dttm": false}, {"column_name": "gender", "name": "gender", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "marital_status", "name": "marital_status", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	QUERY
15	NIM-VIdKK	1	\N	Untitled Query 1	1	2	success	compliance_analytics	--show schemas in lakehouse;\nselect * from customer_enriched limit 10;\n--select c_email_address from customer limit 10;	\N	select * from customer_enriched limit 11	10	f	f	100	10	\N	1711544649572.436000	2024-03-27 13:04:12.320069	1711544652319.072000	\N	1711544649624.490000	\N	https://trino-coordinator:8443/ui/query.html?20240327_130409_00569_ju8t6	{"progress": null, "cancel_query": "20240327_130409_00569_ju8t6", "columns": [{"column_name": "customer_id", "name": "customer_id", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "salutation", "name": "salutation", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "preferred_customer", "name": "preferred_customer", "type": "BOOLEAN", "type_generic": 3, "is_dttm": false}, {"column_name": "birth_year", "name": "birth_year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "email_address", "name": "email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "country", "name": "country", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "state", "name": "state", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "zip", "name": "zip", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "city", "name": "city", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "gmt_offset", "name": "gmt_offset", "type": "DECIMAL(5, 2)", "type_generic": 0, "is_dttm": false}, {"column_name": "gender", "name": "gender", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "marital_status", "name": "marital_status", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	QUERY
9	VdtjAyUkY	1	\N	Untitled Query 1	1	2	failed	customer_analytics	show schemas in lakehouse;\nselect * from customer_enriched limit 10;\nselect zip from customer limit 10;	\N	select * from customer_enriched limit 11	10	f	f	0	\N	Statement 2 out of 3 trino error: Access Denied: Cannot select from columns [household_demo_sk, zip, country, suite_number, customer_demo_sk, city, ca_street_name, birth_date, county, preferred_customer, given_name, location_type, ca_street_number, email_address, salutation, state, gmt_offset, customer_id, family_name] in table or view lakehouse.customer_analytics.customer_enriched	1711542979884.444000	2024-03-27 12:36:20.846258	1711542980842.223900	\N	1711542979924.067100	\N	https://trino-coordinator:8443/ui/query.html?20240327_123620_00325_ju8t6	{"progress": "Running statement 2 out of 3", "cancel_query": "20240327_123620_00325_ju8t6", "errors": [{"message": "trino error: Access Denied: Cannot select from columns [household_demo_sk, zip, country, suite_number, customer_demo_sk, city, ca_street_name, birth_date, county, preferred_customer, given_name, location_type, ca_street_number, email_address, salutation, state, gmt_offset, customer_id, family_name] in table or view lakehouse.customer_analytics.customer_enriched", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": "Trino", "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	QUERY
10	LnRtE3oBP	1	\N	Untitled Query 1	1	2	failed	customer_analytics	--show schemas in lakehouse;\n--select * from customer_enriched limit 10;\nselect zip from customer limit 10;	\N	select zip from customer limit 11	10	f	f	0	\N	trino error: line 1:8: Column 'zip' cannot be resolved	1711542991819.304000	2024-03-27 12:36:32.437532	1711542992432.836000	\N	1711542991858.577000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123632_00326_ju8t6	{"progress": "Running statement 1 out of 1", "cancel_query": "20240327_123632_00326_ju8t6", "errors": [{"message": "trino error: line 1:8: Column 'zip' cannot be resolved", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": "Trino", "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	QUERY
8	FuvAXEcGF	1	\N	Untitled Query 1	1	2	failed	customer_analytics	show schemas in lakehouse;\nselect * from customer_enriched limit 10;\nselect * from customer limit 10;	\N	select * from customer_enriched limit 11	10	f	f	0	\N	Statement 2 out of 3 trino error: Access Denied: Cannot select from columns [household_demo_sk, zip, country, suite_number, customer_demo_sk, city, ca_street_name, birth_date, county, preferred_customer, given_name, location_type, ca_street_number, email_address, salutation, state, gmt_offset, customer_id, family_name] in table or view lakehouse.customer_analytics.customer_enriched	1711542972627.379000	2024-03-27 12:36:13.464293	1711542973460.482000	\N	1711542972666.273200	\N	https://trino-coordinator:8443/ui/query.html?20240327_123613_00323_ju8t6	{"progress": "Running statement 2 out of 3", "cancel_query": "20240327_123613_00323_ju8t6", "errors": [{"message": "trino error: Access Denied: Cannot select from columns [household_demo_sk, zip, country, suite_number, customer_demo_sk, city, ca_street_name, birth_date, county, preferred_customer, given_name, location_type, ca_street_number, email_address, salutation, state, gmt_offset, customer_id, family_name] in table or view lakehouse.customer_analytics.customer_enriched", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": "Trino", "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	QUERY
14	UsJrDW2-9	1	\N	Untitled Query 1	1	2	success	compliance_analytics	--show schemas in lakehouse;\nselect * from customer_enriched limit 10;\n--select c_email_address from customer limit 10;	\N	select * from customer_enriched limit 11	10	f	f	100	10	\N	1711543061767.401900	2024-03-27 12:37:44.519117	1711543064518.110000	\N	1711543061801.399000	\N	https://trino-coordinator:8443/ui/query.html?20240327_123742_00330_ju8t6	{"progress": null, "cancel_query": "20240327_123742_00330_ju8t6", "columns": [{"column_name": "customer_id", "name": "customer_id", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "salutation", "name": "salutation", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "preferred_customer", "name": "preferred_customer", "type": "BOOLEAN", "type_generic": 3, "is_dttm": false}, {"column_name": "birth_year", "name": "birth_year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "email_address", "name": "email_address", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "country", "name": "country", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "state", "name": "state", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "zip", "name": "zip", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "city", "name": "city", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "gmt_offset", "name": "gmt_offset", "type": "DECIMAL(5, 2)", "type_generic": 0, "is_dttm": false}, {"column_name": "gender", "name": "gender", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}, {"column_name": "marital_status", "name": "marital_status", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	QUERY
11	Nt2wnnDs0	1	\N	Untitled Query 1	1	2	failed	customer_analytics	--show schemas in lakehouse;\n--select * from customer_enriched limit 10;\nselect * from customer limit 10;	\N	select * from customer limit 11	10	f	f	0	\N	trino error: Access Denied: Cannot select from columns [c_salutation, c_preferred_cust_flag, c_first_sales_date_sk, c_customer_sk, c_login, c_current_cdemo_sk, c_first_name, c_current_hdemo_sk, c_current_addr_sk, c_last_name, c_customer_id, c_last_review_date_sk, c_birth_month, c_birth_country, c_birth_year, c_birth_day, c_email_address, c_first_shipto_date_sk] in table or view lakehouse.customer_analytics.customer	1711542997011.704800	2024-03-27 12:36:37.636022	1711542997632.158000	\N	1711542997045.679200	\N	https://trino-coordinator:8443/ui/query.html?20240327_123637_00327_ju8t6	{"progress": "Running statement 1 out of 1", "cancel_query": "20240327_123637_00327_ju8t6", "errors": [{"message": "trino error: Access Denied: Cannot select from columns [c_salutation, c_preferred_cust_flag, c_first_sales_date_sk, c_customer_sk, c_login, c_current_cdemo_sk, c_first_name, c_current_hdemo_sk, c_current_addr_sk, c_last_name, c_customer_id, c_last_review_date_sk, c_birth_month, c_birth_country, c_birth_year, c_birth_day, c_email_address, c_first_shipto_date_sk] in table or view lakehouse.customer_analytics.customer", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": "Trino", "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	QUERY
16	2LhbZULUJ	1	\N	Untitled Query 1	4	7	success	compliance_analytics	show schemas in lakehouse;	\N	show schemas in lakehouse	1000	f	f	100	3	\N	1711609389099.847200	2024-03-28 07:03:09.59736	1711609389596.254200	\N	1711609389136.403000	\N	https://trino-coordinator:8443/ui/query.html?20240328_070309_00045_4rgfx	{"progress": null, "cancel_query": "20240328_070309_00045_4rgfx", "columns": [{"column_name": "Schema", "name": "Schema", "type": "VARCHAR", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	NOT_LIMITED
\.


--
-- Data for Name: report_execution_log; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_execution_log (id, scheduled_dttm, start_dttm, end_dttm, value, value_row_json, state, error_message, report_schedule_id, uuid) FROM stdin;
\.


--
-- Data for Name: report_recipient; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_recipient (id, type, recipient_config_json, report_schedule_id, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: report_schedule; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_schedule (id, type, name, description, context_markdown, active, crontab, sql, chart_id, dashboard_id, database_id, last_eval_dttm, last_state, last_value, last_value_row_json, validator_type, validator_config_json, log_retention, grace_period, created_on, changed_on, created_by_fk, changed_by_fk, working_timeout, report_format, creation_method, timezone, extra_json, force_screenshot, custom_width, custom_height) FROM stdin;
\.


--
-- Data for Name: report_schedule_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_schedule_user (id, user_id, report_schedule_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_roles; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.rls_filter_roles (id, role_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.rls_filter_tables (id, table_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: row_level_security_filters; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.row_level_security_filters (created_on, changed_on, id, clause, created_by_fk, changed_by_fk, filter_type, group_key, name, description) FROM stdin;
\.


--
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk, extra_json, last_run, rows, uuid, template_parameters) FROM stdin;
\.


--
-- Data for Name: sl_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_columns (uuid, created_on, changed_on, id, is_aggregation, is_additive, is_dimensional, is_filterable, is_increase_desired, is_managed_externally, is_partition, is_physical, is_temporal, is_spatial, name, type, unit, expression, description, warning_text, external_url, extra_json, created_by_fk, changed_by_fk, advanced_data_type) FROM stdin;
\.


--
-- Data for Name: sl_dataset_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_dataset_columns (dataset_id, column_id) FROM stdin;
\.


--
-- Data for Name: sl_dataset_tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_dataset_tables (dataset_id, table_id) FROM stdin;
\.


--
-- Data for Name: sl_dataset_users; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_dataset_users (dataset_id, user_id) FROM stdin;
\.


--
-- Data for Name: sl_datasets; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_datasets (uuid, created_on, changed_on, id, database_id, is_physical, is_managed_externally, name, expression, external_url, extra_json, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: sl_table_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_table_columns (table_id, column_id) FROM stdin;
\.


--
-- Data for Name: sl_tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sl_tables (uuid, created_on, changed_on, id, database_id, is_managed_externally, catalog, schema, name, external_url, extra_json, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slice_user (id, user_id, slice_id) FROM stdin;
1	2	1
2	2	2
3	4	3
4	4	4
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slices (created_on, changed_on, id, slice_name, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id, schema_perm, uuid, query_context, last_saved_at, last_saved_by_fk, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2024-03-27 13:10:33.36777	2024-03-27 13:28:09.660392	2	Customers per gender and martial status	table	compliance_analytics.customer_enriched	pivot_table_v2	{"datasource":"10__table","viz_type":"pivot_table_v2","slice_id":2,"groupbyColumns":["gender"],"groupbyRows":["marital_status"],"time_grain_sqla":"P1D","temporal_columns_lookup":{},"metrics":["count"],"metricsLayout":"ROWS","adhoc_filters":[{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_oi2u5m0p2o_h6xcp4zrqia","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"gender"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":true,"colTotals":true,"colSubTotals":false,"transposePivot":false,"combineMetric":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[2]}	2	2	\N	\N	[Trino lakehouse].[customer_enriched](id:10)	10	[Trino lakehouse].[compliance_analytics]	6293babd-b3bc-4d05-a70d-5b58e7717458	{"datasource":{"id":10,"type":"table"},"force":false,"queries":[{"filters":[{"col":"gender","op":"IS NOT NULL"}],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":["gender","marital_status"],"metrics":["count"],"orderby":[["count",false]],"annotation_layers":[],"row_limit":10000,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"10__table","viz_type":"pivot_table_v2","slice_id":2,"groupbyColumns":["gender"],"groupbyRows":["marital_status"],"time_grain_sqla":"P1D","temporal_columns_lookup":{},"metrics":["count"],"metricsLayout":"ROWS","adhoc_filters":[{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_oi2u5m0p2o_h6xcp4zrqia","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"gender"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":true,"colTotals":true,"colSubTotals":false,"transposePivot":false,"combineMetric":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[2],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:28:09.65244	2	\N	\N	f	\N
2024-03-27 13:07:15.570466	2024-03-27 13:19:04.302024	1	Customer age	table	compliance_analytics.customer_enriched	echarts_timeseries_bar	{"datasource":"10__table","viz_type":"echarts_timeseries_bar","slice_id":1,"x_axis":"birth_year","xAxisForceCategorical":true,"x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":["count"],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":"100000","truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastEnabled":false,"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","truncateXAxis":true,"y_axis_bounds":[null,null],"rich_tooltip":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[2]}	2	2	\N	\N	[Trino lakehouse].[customer_enriched](id:10)	10	[Trino lakehouse].[compliance_analytics]	5faaa605-6dbd-47d4-a8c8-64839fb8ff12	{"datasource":{"id":10,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":[{"columnType":"BASE_AXIS","sqlExpression":"birth_year","label":"birth_year","expressionType":"SQL"}],"metrics":["count"],"orderby":[["count",false]],"annotation_layers":[],"row_limit":100000,"series_columns":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"time_offsets":[],"post_processing":[{"operation":"pivot","options":{"index":["birth_year"],"columns":[],"aggregates":{"count":{"operator":"mean"}},"drop_missing_columns":false}},{"operation":"flatten"}]}],"form_data":{"datasource":"10__table","viz_type":"echarts_timeseries_bar","slice_id":1,"x_axis":"birth_year","xAxisForceCategorical":true,"x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":["count"],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":"100000","truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastEnabled":false,"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","truncateXAxis":true,"y_axis_bounds":[null,null],"rich_tooltip":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[2],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:19:04.294946	2	\N	\N	f	\N
2024-03-27 13:24:00.34103	2024-03-27 13:24:00.341036	3	Number of customers	table	customer_analytics.customer	big_number_total	{"datasource":"2__table","viz_type":"big_number_total","metric":"count","adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"dashboards":[]}	4	4	\N	\N	[Trino lakehouse].[customer](id:2)	2	[Trino lakehouse].[customer_analytics]	bb2aacd7-a074-4289-a795-71ecca300f04	{"datasource":{"id":2,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":[],"metrics":["count"],"annotation_layers":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"2__table","viz_type":"big_number_total","metric":"count","adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"dashboards":[],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:24:00.33899	4	\N	\N	f	\N
2024-03-27 13:33:00.298876	2024-03-27 13:33:14.12662	4	Customers per state	table	customer_analytics.customer_enriched	pivot_table_v2	{"datasource":"5__table","viz_type":"pivot_table_v2","slice_id":4,"groupbyColumns":["state"],"groupbyRows":["preferred_customer"],"time_grain_sqla":"P1D","temporal_columns_lookup":{"birth_date":true},"metrics":["count"],"metricsLayout":"COLUMNS","adhoc_filters":[{"clause":"WHERE","comparator":"No filter","datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_5mb0q3yizik_0otv2gotnpi","isExtra":false,"isNew":false,"operator":"TEMPORAL_RANGE","sqlExpression":null,"subject":"birth_date"},{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_04997e44dahr_1j3hb5sursk","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"state"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":false,"colTotals":true,"transposePivot":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[3]}	4	4	\N	\N	[Trino lakehouse].[customer_enriched](id:5)	5	[Trino lakehouse].[customer_analytics]	fa8b274f-8a69-4449-819e-521b4a6600a2	{"datasource":{"id":5,"type":"table"},"force":false,"queries":[{"filters":[{"col":"birth_date","op":"TEMPORAL_RANGE","val":"No filter"},{"col":"state","op":"IS NOT NULL"}],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":["state","preferred_customer"],"metrics":["count"],"orderby":[["count",false]],"annotation_layers":[],"row_limit":10000,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"5__table","viz_type":"pivot_table_v2","slice_id":4,"groupbyColumns":["state"],"groupbyRows":["preferred_customer"],"time_grain_sqla":"P1D","temporal_columns_lookup":{"birth_date":true},"metrics":["count"],"metricsLayout":"COLUMNS","adhoc_filters":[{"clause":"WHERE","comparator":"No filter","datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_5mb0q3yizik_0otv2gotnpi","isExtra":false,"isNew":false,"operator":"TEMPORAL_RANGE","sqlExpression":null,"subject":"birth_date"},{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_04997e44dahr_1j3hb5sursk","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"state"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":false,"colTotals":true,"transposePivot":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[3],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:33:14.120392	4	\N	\N	f	\N
\.


--
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sql_metrics (created_on, changed_on, id, metric_name, verbose_name, metric_type, table_id, expression, description, created_by_fk, changed_by_fk, d3format, warning_text, extra, uuid, currency) FROM stdin;
2024-03-27 12:59:46.367996	2024-03-27 12:59:46.368002	2	count	COUNT(*)	count	2	COUNT(*)	\N	1	1	\N	\N	\N	f5ca6756-22d7-49bc-91bb-9b04810c65e8	\N
2024-03-27 13:00:05.474809	2024-03-27 13:00:05.474815	3	count	COUNT(*)	count	3	COUNT(*)	\N	1	1	\N	\N	\N	ca92af00-c9a9-44e4-8673-6948efe3150e	\N
2024-03-27 13:00:17.873356	2024-03-27 13:00:17.873363	4	count	COUNT(*)	count	4	COUNT(*)	\N	1	1	\N	\N	\N	fac4d4ee-731e-4718-ad43-0a0f4a144bcb	\N
2024-03-27 13:00:46.88322	2024-03-27 13:00:46.883226	5	count	COUNT(*)	count	5	COUNT(*)	\N	1	1	\N	\N	\N	164ba5ab-be38-4030-b762-aac5a2d1a0b3	\N
2024-03-27 13:01:08.875595	2024-03-27 13:01:08.875601	6	count	COUNT(*)	count	6	COUNT(*)	\N	1	1	\N	\N	\N	ad298e4d-5498-4d98-9fd2-41e7c8b92675	\N
2024-03-27 13:01:23.995334	2024-03-27 13:01:23.99534	7	count	COUNT(*)	count	7	COUNT(*)	\N	1	1	\N	\N	\N	1bb8c88f-4f24-4979-8066-db54cf9338e3	\N
2024-03-27 13:01:42.892981	2024-03-27 13:01:42.892987	8	count	COUNT(*)	count	8	COUNT(*)	\N	1	1	\N	\N	\N	553b82ac-44d9-4c1c-8d02-ca0e48f06254	\N
2024-03-27 13:01:53.687209	2024-03-27 13:01:53.687216	9	count	COUNT(*)	count	9	COUNT(*)	\N	1	1	\N	\N	\N	da4cd09e-cbc3-4660-88c4-4f33ab02c3be	\N
2024-03-27 13:02:07.50465	2024-03-27 13:02:07.504657	10	count	COUNT(*)	count	10	COUNT(*)	\N	1	1	\N	\N	\N	fcb91025-a94a-4f2c-bfae-c720af9910ce	\N
\.


--
-- Data for Name: sqlatable_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sqlatable_user (id, user_id, table_id) FROM stdin;
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
\.


--
-- Data for Name: ssh_tunnels; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ssh_tunnels (created_on, changed_on, created_by_fk, changed_by_fk, extra_json, uuid, id, database_id, server_address, server_port, username, password, private_key, private_key_password) FROM stdin;
\.


--
-- Data for Name: tab_state; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tab_state (created_on, changed_on, extra_json, id, user_id, label, active, database_id, schema, sql, query_limit, latest_query_id, autorun, template_params, created_by_fk, changed_by_fk, hide_left_bar, saved_query_id) FROM stdin;
2024-03-27 12:59:26.539305	2024-03-27 13:00:34.819923	{"updatedAt":1711544428919,"version":1}	2	1	Untitled Query 1	t	1	customer_analytics	SELECT ...	1000	\N	f	\N	1	1	f	\N
2024-03-27 12:33:40.432511	2024-03-27 13:04:14.771012	{"updatedAt":1711544649456,"version":1}	1	2	Untitled Query 1	t	1	compliance_analytics	--show schemas in lakehouse;\nselect * from customer_enriched limit 10;\n--select c_email_address from customer limit 10;	1000	NIM-VIdKK	f	\N	2	2	f	\N
2024-03-28 07:00:45.761485	2024-03-28 07:00:51.869129	{"updatedAt":1711609246787,"version":1}	3	6	Untitled Query 1	t	1	customer_analytics	SELECT ...	1000	\N	f	\N	6	6	f	\N
2024-03-28 07:06:19.891235	2024-03-28 07:06:29.696062	{"updatedAt":1711609584612,"version":1}	5	7	Untitled Query 1	t	1	compliance_analytics	SELECT ...	1000	\N	f	\N	7	7	f	\N
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, uuid, extra, advanced_data_type) FROM stdin;
2024-03-27 12:59:46.354543	2024-03-27 12:59:46.35455	13	2	c_customer_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	e3499005-7ad7-4d19-aa3d-29b6d18a682c	\N	\N
2024-03-27 12:59:46.354598	2024-03-27 12:59:46.3546	14	2	c_customer_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	bbac8121-51b5-48df-815d-4ef05d71b4cf	\N	\N
2024-03-27 12:59:46.354626	2024-03-27 12:59:46.354628	15	2	c_current_cdemo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	70ed5cb7-2b1f-4f85-a02d-2e7ce2f6d98d	\N	\N
2024-03-27 12:59:46.354652	2024-03-27 12:59:46.354655	16	2	c_current_hdemo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	cb7c1ed4-5440-4241-b9d2-9c105727c02c	\N	\N
2024-03-27 12:59:46.354679	2024-03-27 12:59:46.354681	17	2	c_current_addr_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	26b7de17-bdb0-411b-aba9-7b8abb309289	\N	\N
2024-03-27 12:59:46.354706	2024-03-27 12:59:46.354708	18	2	c_first_shipto_date_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	172e3154-7e85-4e0e-ac23-a36e3a5ac9af	\N	\N
2024-03-27 12:59:46.354732	2024-03-27 12:59:46.354734	19	2	c_first_sales_date_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	d492fd0b-39b2-467a-aeba-9457d329778c	\N	\N
2024-03-27 12:59:46.354758	2024-03-27 12:59:46.35476	20	2	c_salutation	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	36992ee7-fff0-4e54-a242-70b1148e3e80	\N	\N
2024-03-27 12:59:46.354784	2024-03-27 12:59:46.354786	21	2	c_first_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	0c617826-5ee2-4b7c-af3a-867a18d01637	\N	\N
2024-03-27 12:59:46.35481	2024-03-27 12:59:46.354812	22	2	c_last_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	c0742f18-1b0d-41fc-9d71-b14ab94e0140	\N	\N
2024-03-27 12:59:46.354836	2024-03-27 12:59:46.354838	23	2	c_preferred_cust_flag	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	717b53bb-1752-4a9f-bab3-6b2d6f7953d5	\N	\N
2024-03-27 12:59:46.354862	2024-03-27 12:59:46.354864	24	2	c_birth_day	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	fb66a618-30f6-4ab3-aa08-1f66cea42ac8	\N	\N
2024-03-27 12:59:46.354888	2024-03-27 12:59:46.35489	25	2	c_birth_month	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	f7bcdf06-cb0c-413b-8a5b-372f7d49a5d2	\N	\N
2024-03-27 12:59:46.354913	2024-03-27 12:59:46.354915	26	2	c_birth_year	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	bdc07ec0-18f8-4c4d-8c83-c8a867eaddf2	\N	\N
2024-03-27 12:59:46.354939	2024-03-27 12:59:46.354941	27	2	c_birth_country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	449b7c4d-49fd-455e-b659-3d95b4f65ff1	\N	\N
2024-03-27 12:59:46.354966	2024-03-27 12:59:46.354968	28	2	c_login	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f1f00aff-8181-4d1d-942f-e40e3fa3b2a9	\N	\N
2024-03-27 12:59:46.354992	2024-03-27 12:59:46.354994	29	2	c_email_address	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	cd3f598d-0cbb-46c4-9fd1-f02fbbb550ee	\N	\N
2024-03-27 12:59:46.355017	2024-03-27 12:59:46.355019	30	2	c_last_review_date_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	7bf3e5e0-86a7-45e5-adb7-4da040f4d3b1	\N	\N
2024-03-27 13:00:05.462603	2024-03-27 13:00:05.462609	31	3	ca_address_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	f556ed9d-5926-4d1d-a9b0-a71134b3c447	\N	\N
2024-03-27 13:00:05.462654	2024-03-27 13:00:05.462656	32	3	ca_address_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f6260587-2a8d-48c4-aaef-4615a97b119b	\N	\N
2024-03-27 13:00:05.46268	2024-03-27 13:00:05.462682	33	3	ca_street_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	0616553d-26c7-48a6-8c3f-461f4d695ef9	\N	\N
2024-03-27 13:00:05.462705	2024-03-27 13:00:05.462707	34	3	ca_street_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f6de2c3c-d864-44f9-a22e-4ea9508f749c	\N	\N
2024-03-27 13:00:05.462729	2024-03-27 13:00:05.462731	35	3	ca_street_type	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	2be1be94-2424-496a-ba46-33bcd0769e1f	\N	\N
2024-03-27 13:00:05.462753	2024-03-27 13:00:05.462755	36	3	ca_suite_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	17d83f87-0975-4419-9e55-ad26584547ee	\N	\N
2024-03-27 13:00:05.462778	2024-03-27 13:00:05.46278	37	3	ca_city	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	69b064f0-4819-4924-bb5b-3e016c83c81d	\N	\N
2024-03-27 13:00:05.462803	2024-03-27 13:00:05.462804	38	3	ca_county	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f89b7a24-846f-4c83-bbae-aa054255523d	\N	\N
2024-03-27 13:00:05.462827	2024-03-27 13:00:05.462829	39	3	ca_state	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	124661f7-f468-4575-9e23-745e96acfa5a	\N	\N
2024-03-27 13:00:05.462851	2024-03-27 13:00:05.462853	40	3	ca_zip	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	48f8c699-a2b0-4f56-a962-4470ce63007b	\N	\N
2024-03-27 13:00:05.462876	2024-03-27 13:00:05.462878	41	3	ca_country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	15bb84a0-fd66-4972-be1f-5f69717fdf18	\N	\N
2024-03-27 13:00:05.462901	2024-03-27 13:00:05.462903	42	3	ca_gmt_offset	f	t	DECIMAL(5, 2)	t	t	\N	1	1	\N	\N	\N	52fd9fce-575f-43b7-a7a6-6e443c7d88cd	\N	\N
2024-03-27 13:00:05.462925	2024-03-27 13:00:05.462927	43	3	ca_location_type	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	262d0cc4-dcb3-4cae-b9e0-76dd822d2740	\N	\N
2024-03-27 13:00:17.862815	2024-03-27 13:00:17.862821	44	4	cd_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	6a14a7fb-8f74-4eee-902e-b064b82e3757	\N	\N
2024-03-27 13:00:17.862868	2024-03-27 13:00:17.86287	45	4	cd_gender	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	c7f744ae-f2e2-47b3-939f-0c53124427a5	\N	\N
2024-03-27 13:00:17.862896	2024-03-27 13:00:17.862898	46	4	cd_marital_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	d8287033-505b-46a6-b7ef-68b6cacd052b	\N	\N
2024-03-27 13:00:17.862922	2024-03-27 13:00:17.862924	47	4	cd_education_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	15d7335d-95a1-4a84-b0ff-f3835eef5c74	\N	\N
2024-03-27 13:00:17.862949	2024-03-27 13:00:17.862951	48	4	cd_purchase_estimate	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	9eeea402-7859-4f20-bda5-6c5db74d3631	\N	\N
2024-03-27 13:00:17.862975	2024-03-27 13:00:17.862977	49	4	cd_credit_rating	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	744c636d-750e-40bb-a57c-544e2373adc5	\N	\N
2024-03-27 13:00:17.863001	2024-03-27 13:00:17.863003	50	4	cd_dep_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	c5bf9a47-ad9e-4180-a68d-2ae4cfc849e5	\N	\N
2024-03-27 13:00:17.863028	2024-03-27 13:00:17.86303	51	4	cd_dep_employed_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	b7f29457-6b0b-43de-a86f-a571efeb5968	\N	\N
2024-03-27 13:00:17.863054	2024-03-27 13:00:17.863056	52	4	cd_dep_college_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	2c6df96a-5bc5-436f-920c-65ab6c338223	\N	\N
2024-03-27 13:00:46.873084	2024-03-27 13:00:46.873091	53	5	customer_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	ac1670bb-8a7e-40b7-9fb9-6f726ed39cee	\N	\N
2024-03-27 13:00:46.873139	2024-03-27 13:00:46.873141	54	5	customer_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	0025a3d4-7ec5-4b11-a602-8da3afab5a57	\N	\N
2024-03-27 13:00:46.873168	2024-03-27 13:00:46.87317	55	5	household_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	ceb41a4d-0b87-4ee9-8ac3-878df5ccf388	\N	\N
2024-03-27 13:00:46.873195	2024-03-27 13:00:46.873197	56	5	salutation	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	db718e65-a2b0-4711-9d2b-28e2c2503ae2	\N	\N
2024-03-27 13:00:46.873222	2024-03-27 13:00:46.873224	57	5	given_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	972db207-3691-4f29-847e-6402112db487	\N	\N
2024-03-27 13:00:46.87325	2024-03-27 13:00:46.873252	58	5	family_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	c49aa618-b459-4d2c-9453-8eb5e98771bb	\N	\N
2024-03-27 13:00:46.873277	2024-03-27 13:00:46.873279	59	5	preferred_customer	f	t	BOOLEAN	t	t	\N	1	1	\N	\N	\N	f0749f81-7ae7-4e74-98df-39cd84ef17cd	\N	\N
2024-03-27 13:00:46.873304	2024-03-27 13:00:46.873306	60	5	birth_date	t	t	DATE	t	t	\N	1	1	\N	\N	\N	39049540-100f-41f4-b3c0-695429ebd192	\N	\N
2024-03-27 13:00:46.873346	2024-03-27 13:00:46.873348	61	5	email_address	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	601ac9c7-ffcb-4e8a-a3f4-482482bd6774	\N	\N
2024-03-27 13:00:46.873374	2024-03-27 13:00:46.873376	62	5	country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	069f9f60-67c1-4faa-b0cc-76b121f718fc	\N	\N
2024-03-27 13:00:46.873401	2024-03-27 13:00:46.873404	63	5	state	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	1651342d-f3d7-412c-8db9-7a635454243c	\N	\N
2024-03-27 13:00:46.873429	2024-03-27 13:00:46.873431	64	5	zip	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	e0d3a8bc-4984-4507-b018-743b51c2a03b	\N	\N
2024-03-27 13:00:46.873455	2024-03-27 13:00:46.873457	65	5	city	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	2b9300c7-7872-451c-8dcd-04d5f3c25673	\N	\N
2024-03-27 13:00:46.873482	2024-03-27 13:00:46.873484	66	5	county	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f727b0c9-a9f4-4a04-89a4-bf28de9d4124	\N	\N
2024-03-27 13:00:46.873508	2024-03-27 13:00:46.87351	67	5	ca_street_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	54dc0748-6f30-43d2-83f7-9bc9aab7ed96	\N	\N
2024-03-27 13:00:46.873534	2024-03-27 13:00:46.873536	68	5	ca_street_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	77982f1d-c1bc-4081-9041-895d634277fe	\N	\N
2024-03-27 13:00:46.87356	2024-03-27 13:00:46.873562	69	5	suite_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	7f03675c-6260-42a5-8f12-ae43d69f7ed5	\N	\N
2024-03-27 13:00:46.873586	2024-03-27 13:00:46.873588	70	5	location_type	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	a6376e83-1dc1-494a-9164-c37584988cf7	\N	\N
2024-03-27 13:00:46.873612	2024-03-27 13:00:46.873614	71	5	gmt_offset	f	t	DECIMAL(5, 2)	t	t	\N	1	1	\N	\N	\N	ecd13540-69aa-4083-934c-a200be1f012f	\N	\N
2024-03-27 13:01:08.868162	2024-03-27 13:01:08.868169	72	6	hd_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	a15757fe-015b-4d80-a500-9c366c094d4e	\N	\N
2024-03-27 13:01:08.868216	2024-03-27 13:01:08.868218	73	6	hd_income_band_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	6fc84094-9702-42fa-bc1d-9545fc448501	\N	\N
2024-03-27 13:01:08.868244	2024-03-27 13:01:08.868246	74	6	hd_buy_potential	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	51de1b81-27d2-4b67-8fce-09b46a30d387	\N	\N
2024-03-27 13:01:08.86827	2024-03-27 13:01:08.868272	75	6	hd_dep_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	8488beb4-da08-4a53-9708-d02c0152dfa4	\N	\N
2024-03-27 13:01:08.868297	2024-03-27 13:01:08.868299	76	6	hd_vehicle_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	3da56b50-a19e-4d8d-a3d0-4d69c1fc064d	\N	\N
2024-03-27 13:01:23.986986	2024-03-27 13:01:23.986992	77	7	ib_income_band_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	6fe0f1e9-b1ea-4f6a-a566-7732d13deee7	\N	\N
2024-03-27 13:01:23.98704	2024-03-27 13:01:23.987042	78	7	ib_lower_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	13f6cbfb-84e3-4733-b655-2cabcd0f36f7	\N	\N
2024-03-27 13:01:23.987068	2024-03-27 13:01:23.98707	79	7	ib_upper_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	5721e23c-5b25-4331-b323-aaade5030dbf	\N	\N
2024-03-27 13:01:42.883601	2024-03-27 13:01:42.883607	80	8	demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	2c6600c0-4766-41c1-90b5-238c828b807b	\N	\N
2024-03-27 13:01:42.883654	2024-03-27 13:01:42.883657	81	8	gender	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	96d420f0-9f25-40be-931f-d57a22d830c9	\N	\N
2024-03-27 13:01:42.883682	2024-03-27 13:01:42.883684	82	8	marital_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	7e4938f8-6861-4ea3-be57-ddff8ec35fea	\N	\N
2024-03-27 13:01:42.883707	2024-03-27 13:01:42.883709	83	8	education_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	8299464d-acf4-4099-81b1-10185b686b6b	\N	\N
2024-03-27 13:01:53.677207	2024-03-27 13:01:53.677213	84	9	demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	69dc5a4c-7e05-4dc2-ab87-847683314e4e	\N	\N
2024-03-27 13:01:53.677259	2024-03-27 13:01:53.677262	85	9	income_lower_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	9f7f482f-bcb5-431a-9550-9acb9496890f	\N	\N
2024-03-27 13:01:53.677287	2024-03-27 13:01:53.677289	86	9	income_upper_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	68621d63-cac1-401f-a29a-a5fa6b897900	\N	\N
2024-03-27 13:01:53.677314	2024-03-27 13:01:53.677316	87	9	buy_potential	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	a79acabc-4c34-4d1a-b6af-2821a554ec72	\N	\N
2024-03-27 13:01:53.67734	2024-03-27 13:01:53.677342	88	9	dependant_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	8b127fe5-fbbc-4ae2-bab2-0bf19676f068	\N	\N
2024-03-27 13:01:53.677367	2024-03-27 13:01:53.677369	89	9	vehicle_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	292b908d-ed6e-4e13-bf38-f9fa6e935b73	\N	\N
2024-03-27 13:02:07.494091	2024-03-27 13:02:07.494097	90	10	customer_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	4593c119-c3d9-4a57-a419-91fff24f0075	\N	\N
2024-03-27 13:02:07.494141	2024-03-27 13:02:07.494143	91	10	salutation	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f3d88299-d0d4-47a4-93a0-60d57a640189	\N	\N
2024-03-27 13:02:07.494168	2024-03-27 13:02:07.49417	92	10	preferred_customer	f	t	BOOLEAN	t	t	\N	1	1	\N	\N	\N	8f7006d5-f9d7-4409-9be4-d2fe6490fcc7	\N	\N
2024-03-27 13:02:07.494193	2024-03-27 13:02:07.494195	93	10	birth_year	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	6528bad2-e375-47c8-86ad-b2d6bb727a83	\N	\N
2024-03-27 13:02:07.494218	2024-03-27 13:02:07.49422	94	10	email_address	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	af27eb8d-084e-4a58-8d3d-a91f781d7ba5	\N	\N
2024-03-27 13:02:07.494244	2024-03-27 13:02:07.494246	95	10	country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	da709c32-4bc1-4994-a0e9-4a86cdfc9432	\N	\N
2024-03-27 13:02:07.494269	2024-03-27 13:02:07.494271	96	10	state	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	1e0ae268-0c25-4dce-a0a0-7c49ec4465af	\N	\N
2024-03-27 13:02:07.494293	2024-03-27 13:02:07.494295	97	10	zip	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	b27ed42a-d482-46f8-9498-97ae60707810	\N	\N
2024-03-27 13:02:07.494318	2024-03-27 13:02:07.49432	98	10	city	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	6ac815b2-30af-4d66-8ba9-f11c2b44539d	\N	\N
2024-03-27 13:02:07.494343	2024-03-27 13:02:07.494345	99	10	gmt_offset	f	t	DECIMAL(5, 2)	t	t	\N	1	1	\N	\N	\N	e26a4a6e-1d32-49ff-b7ea-46dc67eb143f	\N	\N
2024-03-27 13:02:07.494368	2024-03-27 13:02:07.49437	100	10	gender	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	5cde944c-ca98-4ef9-9c7a-1cc21d5c3e11	\N	\N
2024-03-27 13:02:07.494392	2024-03-27 13:02:07.494394	101	10	marital_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	45725cbe-ef1f-4e3f-832d-4a36be604905	\N	\N
\.


--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_schema (created_on, changed_on, extra_json, id, tab_state_id, database_id, schema, "table", description, expanded, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params, schema_perm, extra, uuid, is_managed_externally, external_url, normalize_columns, always_filter_main_dttm) FROM stdin;
2024-03-27 13:02:07.16599	2024-03-27 13:02:07.49932	10	customer_enriched	\N	\N	1	1	1	0	\N	f	\N	compliance_analytics	\N	\N	[Trino lakehouse].[customer_enriched](id:10)	t	\N	f	\N	[Trino lakehouse].[compliance_analytics]	\N	a310a9fe-e582-4cd3-8941-3625afcd54ff	f	\N	f	f
2024-03-27 12:59:45.846675	2024-03-27 12:59:46.363021	2	customer	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer](id:2)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	03100221-8213-4d85-8896-e13fa95fbbd0	f	\N	f	f
2024-03-27 13:00:04.955623	2024-03-27 13:00:05.469258	3	customer_address	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_address](id:3)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	985d0de6-bb7c-42b6-986f-101643e80a7a	f	\N	f	f
2024-03-27 13:00:17.385615	2024-03-27 13:00:17.869299	4	customer_demographics	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_demographics](id:4)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	9556a5ee-9557-4ee8-a255-73e8243f95d4	f	\N	f	f
2024-03-27 13:00:46.52258	2024-03-27 13:00:46.879753	5	customer_enriched	birth_date	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_enriched](id:5)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	77bdb731-deaa-4de4-b7a4-e1b214b6a2e9	f	\N	f	f
2024-03-27 13:01:08.401535	2024-03-27 13:01:08.872462	6	household_demographics	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[household_demographics](id:6)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	f726c004-9f9a-452a-985f-2c98dce639f0	f	\N	f	f
2024-03-27 13:01:23.528732	2024-03-27 13:01:23.990913	7	income_band	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[income_band](id:7)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	92ee35d2-dd94-4a96-91bf-987d62b18065	f	\N	f	f
2024-03-27 13:01:42.574294	2024-03-27 13:01:42.888335	8	customer_demographics_enriched	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_demographics_enriched](id:8)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	24a1f592-e336-433c-83dc-de561e308e8f	f	\N	f	f
2024-03-27 13:01:53.376185	2024-03-27 13:01:53.683648	9	household_demographics_enriched	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[household_demographics_enriched](id:9)	t	\N	f	\N	[Trino lakehouse].[customer_analytics]	\N	341b20f3-39de-468f-9d30-b0bcce22a87c	f	\N	f	f
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tag (created_on, changed_on, id, name, type, created_by_fk, changed_by_fk, description) FROM stdin;
\.


--
-- Data for Name: tagged_object; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tagged_object (created_on, changed_on, id, tag_id, object_id, object_type, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.url (created_on, changed_on, id, url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: user_favorite_tag; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_favorite_tag (user_id, tag_id) FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 70, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 190, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 502, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 9, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 8, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 16, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 98, true);


--
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- Name: cache_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.cache_keys_id_seq', 1, false);


--
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_roles_id_seq', 1, false);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 4, true);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 3, true);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 3, true);


--
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dbs_id_seq', 1, true);


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dynamic_plugin_id_seq', 1, false);


--
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, false);


--
-- Name: filter_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.filter_sets_id_seq', 1, false);


--
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.key_value_id_seq', 26, true);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.logs_id_seq', 1574, true);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.query_id_seq', 16, true);


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_execution_log_id_seq', 1, false);


--
-- Name: report_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_recipient_id_seq', 1, false);


--
-- Name: report_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_schedule_id_seq', 1, false);


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_schedule_user_id_seq', 1, false);


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.rls_filter_roles_id_seq', 1, false);


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.rls_filter_tables_id_seq', 1, false);


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.row_level_security_filters_id_seq', 1, false);


--
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 1, false);


--
-- Name: sl_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sl_columns_id_seq', 1, false);


--
-- Name: sl_datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sl_datasets_id_seq', 1, false);


--
-- Name: sl_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sl_tables_id_seq', 1, false);


--
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 4, true);


--
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slices_id_seq', 4, true);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 10, true);


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sqlatable_user_id_seq', 10, true);


--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ssh_tunnels_id_seq', 1, false);


--
-- Name: tab_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tab_state_id_seq', 5, true);


--
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 101, true);


--
-- Name: table_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_schema_id_seq', 1, false);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tables_id_seq', 10, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tagged_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tagged_object_id_seq', 1, false);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.url_id_seq', 1, false);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: cache_keys cache_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.cache_keys
    ADD CONSTRAINT cache_keys_pkey PRIMARY KEY (id);


--
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- Name: dashboard_roles dashboard_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- Name: dynamic_plugin dynamic_plugin_key_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_key_key UNIQUE (key);


--
-- Name: dynamic_plugin dynamic_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_name_key UNIQUE (name);


--
-- Name: dynamic_plugin dynamic_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_pkey PRIMARY KEY (id);


--
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- Name: filter_sets filter_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_pkey PRIMARY KEY (id);


--
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- Name: key_value key_value_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_pkey PRIMARY KEY (id);


--
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: report_execution_log report_execution_log_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_pkey PRIMARY KEY (id);


--
-- Name: report_recipient report_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_pkey PRIMARY KEY (id);


--
-- Name: report_schedule report_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_pkey PRIMARY KEY (id);


--
-- Name: report_schedule_user report_schedule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_roles rls_filter_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_tables rls_filter_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_pkey PRIMARY KEY (id);


--
-- Name: row_level_security_filters row_level_security_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_pkey PRIMARY KEY (id);


--
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- Name: sl_columns sl_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_pkey PRIMARY KEY (id);


--
-- Name: sl_columns sl_columns_uuid_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_uuid_key UNIQUE (uuid);


--
-- Name: sl_dataset_columns sl_dataset_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_pkey PRIMARY KEY (dataset_id, column_id);


--
-- Name: sl_dataset_tables sl_dataset_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_pkey PRIMARY KEY (dataset_id, table_id);


--
-- Name: sl_dataset_users sl_dataset_users_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_pkey PRIMARY KEY (dataset_id, user_id);


--
-- Name: sl_datasets sl_datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_pkey PRIMARY KEY (id);


--
-- Name: sl_datasets sl_datasets_uuid_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_uuid_key UNIQUE (uuid);


--
-- Name: sl_table_columns sl_table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_pkey PRIMARY KEY (table_id, column_id);


--
-- Name: sl_tables sl_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_pkey PRIMARY KEY (id);


--
-- Name: sl_tables sl_tables_uuid_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_uuid_key UNIQUE (uuid);


--
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- Name: sqlatable_user sqlatable_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_pkey PRIMARY KEY (id);


--
-- Name: ssh_tunnels ssh_tunnels_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_pkey PRIMARY KEY (id);


--
-- Name: tab_state tab_state_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_pkey PRIMARY KEY (id);


--
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tagged_object tagged_object_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices uq_dashboard_slice; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT uq_dashboard_slice UNIQUE (dashboard_id, slice_id);


--
-- Name: dashboards uq_dashboards_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT uq_dashboards_uuid UNIQUE (uuid);


--
-- Name: dbs uq_dbs_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT uq_dbs_uuid UNIQUE (uuid);


--
-- Name: report_schedule uq_report_schedule_name_type; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT uq_report_schedule_name_type UNIQUE (name, type);


--
-- Name: row_level_security_filters uq_rls_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT uq_rls_name UNIQUE (name);


--
-- Name: saved_query uq_saved_query_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT uq_saved_query_uuid UNIQUE (uuid);


--
-- Name: slices uq_slices_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT uq_slices_uuid UNIQUE (uuid);


--
-- Name: sql_metrics uq_sql_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_metric_name UNIQUE (metric_name, table_id);


--
-- Name: sql_metrics uq_sql_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_uuid UNIQUE (uuid);


--
-- Name: table_columns uq_table_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_column_name UNIQUE (column_name, table_id);


--
-- Name: table_columns uq_table_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_uuid UNIQUE (uuid);


--
-- Name: tables uq_tables_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_uuid UNIQUE (uuid);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: ix_cache_keys_datasource_uid; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_cache_keys_datasource_uid ON public.cache_keys USING btree (datasource_uid);


--
-- Name: ix_creation_method; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_creation_method ON public.report_schedule USING btree (creation_method);


--
-- Name: ix_key_value_expires_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_key_value_expires_on ON public.key_value USING btree (expires_on);


--
-- Name: ix_key_value_uuid; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_key_value_uuid ON public.key_value USING btree (uuid);


--
-- Name: ix_logs_user_id_dttm; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_logs_user_id_dttm ON public.logs USING btree (user_id, dttm);


--
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- Name: ix_ssh_tunnels_database_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_ssh_tunnels_database_id ON public.ssh_tunnels USING btree (database_id);


--
-- Name: ix_ssh_tunnels_uuid; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_ssh_tunnels_uuid ON public.ssh_tunnels USING btree (uuid);


--
-- Name: ix_tab_state_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_tab_state_id ON public.tab_state USING btree (id);


--
-- Name: ix_table_schema_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_table_schema_id ON public.table_schema USING btree (id);


--
-- Name: ix_tagged_object_object_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_tagged_object_object_id ON public.tagged_object USING btree (object_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_roles fk_dashboard_roles_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_roles fk_dashboard_roles_role_id_ab_role; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_role_id_ab_role FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: dashboard_slices fk_dashboard_slices_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_slices fk_dashboard_slices_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- Name: dashboard_user fk_dashboard_user_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_user fk_dashboard_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: embedded_dashboards fk_embedded_dashboards_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.embedded_dashboards
    ADD CONSTRAINT fk_embedded_dashboards_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: report_schedule_user fk_report_schedule_user_report_schedule_id_report_schedule; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_report_schedule_id_report_schedule FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id) ON DELETE CASCADE;


--
-- Name: report_schedule_user fk_report_schedule_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: slice_user fk_slice_user_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- Name: slice_user fk_slice_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: sql_metrics fk_sql_metrics_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT fk_sql_metrics_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: sqlatable_user fk_sqlatable_user_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: sqlatable_user fk_sqlatable_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: table_columns fk_table_columns_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT fk_table_columns_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: key_value key_value_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: key_value key_value_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: report_execution_log report_execution_log_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_recipient report_recipient_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule report_schedule_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_chart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_chart_id_fkey FOREIGN KEY (chart_id) REFERENCES public.slices(id);


--
-- Name: report_schedule report_schedule_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: report_schedule report_schedule_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: rls_filter_roles rls_filter_roles_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_roles rls_filter_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: rls_filter_tables rls_filter_tables_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_tables rls_filter_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: row_level_security_filters row_level_security_filters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: row_level_security_filters row_level_security_filters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- Name: tab_state saved_query_id; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT saved_query_id FOREIGN KEY (saved_query_id) REFERENCES public.saved_query(id) ON DELETE SET NULL;


--
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: sl_columns sl_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_columns sl_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_dataset_columns sl_dataset_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.sl_columns(id);


--
-- Name: sl_dataset_columns sl_dataset_columns_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- Name: sl_dataset_tables sl_dataset_tables_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- Name: sl_dataset_tables sl_dataset_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.sl_tables(id);


--
-- Name: sl_dataset_users sl_dataset_users_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- Name: sl_dataset_users sl_dataset_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: sl_datasets sl_datasets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_datasets sl_datasets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_datasets sl_datasets_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: sl_table_columns sl_table_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.sl_columns(id);


--
-- Name: sl_table_columns sl_table_columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.sl_tables(id);


--
-- Name: sl_tables sl_tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_tables sl_tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_tables sl_tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_last_saved_by_fk; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_last_saved_by_fk FOREIGN KEY (last_saved_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ssh_tunnels ssh_tunnels_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tab_state tab_state_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: tab_state tab_state_latest_query_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_latest_query_id_fkey FOREIGN KEY (latest_query_id) REFERENCES public.query(client_id) ON DELETE SET NULL;


--
-- Name: tab_state tab_state_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: table_schema table_schema_tab_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_tab_state_id_fkey FOREIGN KEY (tab_state_id) REFERENCES public.tab_state(id) ON DELETE CASCADE;


--
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tag tag_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tag tag_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: url url_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: url url_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: user_favorite_tag user_favorite_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_favorite_tag
    ADD CONSTRAINT user_favorite_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: user_favorite_tag user_favorite_tag_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_favorite_tag
    ADD CONSTRAINT user_favorite_tag_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

