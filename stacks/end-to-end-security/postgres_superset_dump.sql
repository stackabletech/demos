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
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:sGx/aeHPQh2TYqDu/3VtKg==$MDwWvH8UgxEn/Nx2hZXAvw5ENCrSpXi6yRR7ZQ+QEF4=:sO4JMyhpvAYkbLKXUZLIuh6Q++k4IthhhbGarVxMVU8=';
CREATE ROLE superset;
ALTER ROLE superset WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:nf8bNZfxkSrMvCUkD3R/hg==$C1xQNqtwM2riQ6Gck5KLps8qHpeQx1EG8nJ5gYEIBa4=:sz0up3ELagR5pFex7D1elNtU99KbgDKKvoDWQtrHHcg=';

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

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
SET transaction_timeout = 0;
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

--
-- Name: safe_to_jsonb(text); Type: FUNCTION; Schema: public; Owner: superset
--

CREATE FUNCTION public.safe_to_jsonb(input text) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  RETURN input::jsonb;
EXCEPTION WHEN invalid_text_representation THEN
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.safe_to_jsonb(input text) OWNER TO superset;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ab_group; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_group (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    label character varying(150),
    description character varying(512)
);


ALTER TABLE public.ab_group OWNER TO superset;

--
-- Name: ab_group_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_group_id_seq OWNER TO superset;

--
-- Name: ab_group_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_group_role (
    id integer NOT NULL,
    group_id integer,
    role_id integer
);


ALTER TABLE public.ab_group_role OWNER TO superset;

--
-- Name: ab_group_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_group_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_group_role_id_seq OWNER TO superset;

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
    username character varying(128) NOT NULL,
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
-- Name: ab_user_group; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user_group (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.ab_user_group OWNER TO superset;

--
-- Name: ab_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_user_group_id_seq OWNER TO superset;

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
    created_by_fk integer,
    uuid uuid
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
    external_url text,
    theme_id integer
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
-- Name: database_user_oauth2_tokens; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.database_user_oauth2_tokens (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer NOT NULL,
    database_id integer NOT NULL,
    access_token bytea,
    access_token_expiration timestamp without time zone,
    refresh_token bytea,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.database_user_oauth2_tokens OWNER TO superset;

--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.database_user_oauth2_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.database_user_oauth2_tokens_id_seq OWNER TO superset;

--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.database_user_oauth2_tokens_id_seq OWNED BY public.database_user_oauth2_tokens.id;


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
    dttm timestamp without time zone,
    uuid uuid
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
    "json" text,
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
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying,
    catalog character varying(256)
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
    custom_height integer,
    email_subject character varying(255)
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
    template_parameters text,
    catalog character varying(256)
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
    catalog_perm character varying(1000),
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
    currency jsonb
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
    saved_query_id integer,
    catalog character varying(256)
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
    advanced_data_type character varying(255),
    datetime_format character varying(100)
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
    changed_by_fk integer,
    catalog character varying(256)
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
    always_filter_main_dttm boolean DEFAULT false,
    catalog character varying(256),
    catalog_perm character varying(1000),
    folders json,
    currency_code_column character varying(250)
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
-- Name: task_subscribers; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.task_subscribers (
    id integer NOT NULL,
    task_id integer NOT NULL,
    user_id integer NOT NULL,
    subscribed_at timestamp without time zone NOT NULL,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer
);


ALTER TABLE public.task_subscribers OWNER TO superset;

--
-- Name: task_subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.task_subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_subscribers_id_seq OWNER TO superset;

--
-- Name: task_subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.task_subscribers_id_seq OWNED BY public.task_subscribers.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    task_key character varying(256) NOT NULL,
    task_type character varying(100) NOT NULL,
    task_name character varying(256),
    scope character varying(20) DEFAULT 'private'::character varying NOT NULL,
    status character varying(50) NOT NULL,
    dedup_key character varying(64) NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    user_id integer,
    payload text,
    properties text
);


ALTER TABLE public.tasks OWNER TO superset;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO superset;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.themes (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    theme_name character varying(250),
    json_data text,
    is_system boolean NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    is_system_default boolean NOT NULL,
    is_system_dark boolean NOT NULL
);


ALTER TABLE public.themes OWNER TO superset;

--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.themes_id_seq OWNER TO superset;

--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


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
    changed_by_fk integer,
    avatar_url character varying(100)
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
-- Name: database_user_oauth2_tokens id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens ALTER COLUMN id SET DEFAULT nextval('public.database_user_oauth2_tokens_id_seq'::regclass);


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
-- Name: task_subscribers id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers ALTER COLUMN id SET DEFAULT nextval('public.task_subscribers_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_group; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_group (id, name, label, description) FROM stdin;
\.


--
-- Data for Name: ab_group_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_group_role (id, group_id, role_id) FROM stdin;
\.


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
76	catalog_access
77	can_cache_dashboard_screenshot
78	can_view_query
79	can_view_chart_as_table
80	can_drill
81	can_tag
82	can_upload
83	can_info
84	can_update_role_users
85	can_list_role_permissions
86	can_update_role_groups
87	can_add_role_permissions
88	can_export_as_example
89	can_put_chart_customizations
90	can_get_drill_info
91	can_validate_expression
92	can_export_streaming_csv
93	can_language_pack
94	can_file_handler
95	can_list_roles
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
196	76	99
197	77	8
198	5	1
199	10	1
200	6	1
201	9	1
202	78	8
203	79	8
204	80	8
205	81	4
206	81	8
207	76	101
208	69	102
209	69	103
210	69	104
211	69	105
212	82	9
213	30	20
214	30	21
215	30	108
216	6	108
217	9	108
218	10	108
219	7	108
220	5	108
221	83	109
222	13	109
223	84	110
224	85	110
225	86	110
226	52	110
227	87	110
228	10	110
229	55	110
230	83	110
231	13	110
232	52	111
233	10	111
234	55	111
235	83	111
236	13	111
237	52	112
238	10	112
239	55	112
240	83	112
241	13	112
242	52	113
243	10	113
244	55	113
245	83	113
246	13	113
247	52	114
248	10	114
249	55	114
250	83	114
251	13	114
252	2	115
253	1	115
254	16	115
255	2	30
256	1	30
257	88	8
258	89	8
259	90	6
260	91	33
261	92	42
262	2	116
263	1	116
264	1	117
265	1	118
266	1	119
267	93	53
268	94	53
269	95	121
270	1	122
271	6	123
272	9	123
273	10	123
274	7	123
275	5	123
276	61	124
277	61	125
278	61	118
279	61	126
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
229	91	3
230	92	3
231	96	3
232	97	3
233	98	3
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
500	182	9
502	180	8
509	197	1
510	198	1
511	199	1
512	200	1
513	201	1
514	202	1
515	203	1
516	204	1
517	205	1
518	206	1
519	114	3
520	197	3
521	198	3
522	199	3
523	200	3
524	201	3
525	202	3
526	203	3
527	204	3
528	205	3
529	206	3
530	114	4
531	197	4
532	198	4
533	199	4
534	200	4
535	201	4
536	202	4
537	203	4
538	204	4
539	205	4
540	206	4
541	212	1
542	212	3
543	213	1
544	214	1
545	215	1
546	216	1
547	217	1
548	218	1
549	219	1
550	220	1
551	221	1
552	222	1
553	223	1
554	224	1
555	225	1
556	226	1
557	227	1
558	228	1
559	229	1
560	230	1
561	231	1
562	232	1
563	233	1
564	234	1
565	235	1
566	236	1
567	237	1
568	238	1
569	239	1
570	240	1
571	241	1
572	242	1
573	243	1
574	244	1
575	245	1
576	246	1
577	247	1
578	248	1
579	249	1
580	250	1
581	251	1
582	252	1
583	253	1
584	254	1
585	255	1
586	256	1
587	257	1
588	258	1
589	259	1
590	260	1
591	261	1
592	262	1
593	263	1
594	264	1
595	265	1
596	266	1
597	267	1
598	268	1
599	269	1
600	270	1
601	271	1
602	272	1
603	273	1
604	274	1
605	275	1
606	276	1
607	277	1
608	278	1
609	279	1
610	152	3
611	252	3
612	253	3
613	254	3
614	255	3
615	256	3
616	257	3
617	258	3
618	259	3
619	260	3
620	261	3
621	264	3
622	266	3
623	267	3
624	268	3
625	270	3
626	271	3
627	272	3
628	273	3
629	274	3
630	275	3
631	277	3
632	279	3
633	3	4
634	152	4
635	252	4
636	253	4
637	254	4
638	255	4
639	256	4
640	257	4
641	258	4
642	259	4
643	261	4
644	264	4
645	266	4
646	267	4
647	268	4
648	270	4
649	271	4
650	272	4
651	273	4
652	274	4
653	275	4
654	277	4
655	279	4
656	83	5
657	86	5
658	127	5
659	128	5
660	129	5
661	262	5
662	263	5
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
7	Marketing
8	Compliance and Regulation Analytics
9	Customer Service Analytics
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
4	Justin	Martin	justin.martin	pbkdf2:sha256:600000$2Ws6i8DFijoebva3$414384ff49e564884c4f8273e7037bedd64a931f300a229de408b2fd9b6b2885	t	justin.martin@knab.com	2024-03-28 07:01:21.548788	4	0	2024-03-27 12:25:15.310823	2024-03-27 12:25:15.310834	\N	\N
7	Sophia	Clarke	sophia.clarke	pbkdf2:sha256:600000$Eh3aHfvVnAfLm1MH$778628976ff23ac23b1875d5511d3ccff6eb603d2fa189db8d2b33eedcb258e6	t	sophia.clarke@knab.com	2024-03-28 07:03:15.090283	4	0	2024-03-27 12:26:23.415568	2024-03-27 12:26:23.415577	\N	\N
3	Isla	Williams	isla.williams	pbkdf2:sha256:600000$Shnct223WRMOpRBl$9e771548d71089f326f8edf712f8d90eab34864ef833081d0889284e95a13524	t	isla.williams@knab.com	2024-03-27 12:24:58.537556	1	0	2024-03-27 12:24:58.52987	2024-03-27 12:24:58.52988	\N	\N
5	Mark	Ketting	mark.ketting	pbkdf2:sha256:600000$9PjSpVaXmmI2rpyi$9ccaf75fe3f36ab9ccf05004efe1b74e2d76d9bcf4dc4f5b28773d3d4454ed90	t	mark.ketting@knab.com	2024-03-27 12:25:50.846849	1	0	2024-03-27 12:25:50.840258	2024-03-27 12:25:50.840267	\N	\N
2	Daniel	King	daniel.king	pbkdf2:sha256:600000$XobvWsPoxpUBXba2$d55ffd2384a0ef4a547f9b1a28f129be7c953e319616cd3ebfc32c843f6e7f89	t	daniel.king@knab.com	2025-07-28 13:06:05.987585	5	0	2024-03-27 11:22:57.458016	2024-03-27 11:22:57.458026	\N	\N
1	Admin	Admin	admin	pbkdf2:sha256:600000$VtEwC0rP1mLkLXCr$7f88b3bf4078f2a7f141faa6fc3adb740a012813caf0e4186a5f8686b98f6e7b	t	admin@example.com	2026-07-06 08:52:42.652933	20	0	2024-03-27 09:00:58.213426	2024-03-27 09:00:58.213437	\N	\N
8	William	Lewis	william.lewis	pbkdf2:sha256:600000$tNYDu1gAgzC4Zw38$dc4c35bdf39728d6154a66cc32f1058e7105aafa048bb27e177b7a903f14d298	t	william.lewis@knab.com	2026-07-06 08:55:04.087295	2	0	2024-03-27 12:26:38.250925	2024-03-27 12:26:38.250934	\N	\N
6	Pamela	Scott	pamela.scott	pbkdf2:sha256:600000$8fxRZw3aVI4bfwi7$ea9f35223de6eac05aa9545514e9435043897aaf76ceb2c24f0d63f1844c34ee	t	pamela.scott@knab.com	2026-07-06 09:30:54.011095	4	0	2024-03-27 12:26:07.70948	2024-03-27 12:26:07.709489	\N	\N
\.


--
-- Data for Name: ab_user_group; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user_group (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
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
89	[Trino lakehouse].[customer](id:2)
91	[Trino lakehouse].[customer_address](id:3)
92	[Trino lakehouse].[customer_demographics](id:4)
93	[Trino lakehouse].[customer_enriched](id:5)
94	[Trino lakehouse].[household_demographics](id:6)
95	[Trino lakehouse].[income_band](id:7)
96	[Trino lakehouse].[customer_demographics_enriched](id:8)
97	[Trino lakehouse].[household_demographics_enriched](id:9)
98	[Trino lakehouse].[customer_enriched](id:10)
88	[Trino lakehouse].[lakehouse].[compliance_analytics]
90	[Trino lakehouse].[lakehouse].[customer_analytics]
86	[Trino lakehouse].[lakehouse].[information_schema]
99	[Trino lakehouse].[lakehouse]
100	UserRestApi
101	[Trino lakehouse].[system]
102	[Trino lakehouse].[system].[information_schema]
103	[Trino lakehouse].[system].[jdbc]
104	[Trino lakehouse].[system].[metadata]
105	[Trino lakehouse].[lakehouse].[employees]
106	SupersetAuthView
107	SupersetRegisterUserView
108	UserGroupModelView
109	Permission
110	Role
111	User
112	ViewMenu
113	PermissionViewMenu
114	Group
115	Theme
116	SqlLabPermalinkRestApi
117	security
118	Extensions
119	Task
120	RedirectView
121	RoleRestAPI
122	user
123	UserRegistrationsRestAPI
124	List Groups
125	Themes
126	Tasks
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alembic_version (version_num) FROM stdin;
4b2a8c9d3e1f
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

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk, uuid) FROM stdin;
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

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata, published, uuid, certified_by, certification_details, is_managed_externally, external_url, theme_id) FROM stdin;
2024-03-27 13:19:04.095758	2024-03-27 13:28:21.264343	2	Customer compliance	{"CHART-_-vtEcReJp": {"children": [], "id": "CHART-_-vtEcReJp", "meta": {"chartId": 2, "height": 52, "sliceName": "Customers per gender and martial status", "uuid": "6293babd-b3bc-4d05-a70d-5b58e7717458", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "ROW-i-iK_9GOj"], "type": "CHART"}, "CHART-explore-1-1": {"children": [], "id": "CHART-explore-1-1", "meta": {"chartId": 1, "height": 43, "sliceName": "Customer age", "uuid": "5faaa605-6dbd-47d4-a8c8-64839fb8ff12", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "ROW-Z7X4HOaDSO"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["ROW-Z7X4HOaDSO", "ROW-i-iK_9GOj"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Customer compliance"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-Z7X4HOaDSO": {"children": ["CHART-explore-1-1"], "id": "ROW-Z7X4HOaDSO", "meta": {"0": "ROOT_ID", "background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID"], "type": "ROW"}, "ROW-i-iK_9GOj": {"children": ["CHART-_-vtEcReJp"], "id": "ROW-i-iK_9GOj", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID"], "type": "ROW"}}	2	2		\N	\N	{"chart_configuration": {"1": {"id": 1, "crossFilters": {"scope": "global", "chartsInScope": [2]}}, "2": {"id": 2, "crossFilters": {"scope": "global", "chartsInScope": [1]}}}, "global_chart_configuration": {"scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "chartsInScope": [1, 2]}, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {"count": "#1FA8C9"}, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "cross_filters_enabled": true, "native_filter_configuration": []}	t	c33d4006-d49f-473a-b3b4-93c39e3c8310			f	\N	\N
2024-03-27 13:33:13.947737	2024-03-27 14:21:33.680941	3	Customer analytics	{"CHART-TxbrYIozYw": {"children": [], "id": "CHART-TxbrYIozYw", "meta": {"chartId": 4, "height": 33, "sliceName": "Customers per state", "uuid": "fa8b274f-8a69-4449-819e-521b4a6600a2", "width": 10}, "parents": ["ROOT_ID", "GRID_ID", "ROW-crD1lbf1oU"], "type": "CHART"}, "CHART-i53yFbHq6z": {"children": [], "id": "CHART-i53yFbHq6z", "meta": {"chartId": 3, "height": 33, "sliceName": "Number of customers", "uuid": "bb2aacd7-a074-4289-a795-71ecca300f04", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "ROW-crD1lbf1oU"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["ROW-crD1lbf1oU"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Customer analytics"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-crD1lbf1oU": {"children": ["CHART-i53yFbHq6z", "CHART-TxbrYIozYw"], "id": "ROW-crD1lbf1oU", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID"], "type": "ROW"}}	4	1		\N	\N	{"chart_configuration": {"4": {"id": 4, "crossFilters": {"scope": "global", "chartsInScope": [3]}}}, "global_chart_configuration": {"scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "chartsInScope": [3, 4]}, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": [], "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "cross_filters_enabled": true, "native_filter_configuration": [], "map_label_colors": {}}	t	c39aadfb-9037-4424-b9cc-98762297b25a			f	\N	\N
\.


--
-- Data for Name: database_user_oauth2_tokens; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.database_user_oauth2_tokens (created_on, changed_on, id, user_id, database_id, access_token, access_token_expiration, refresh_token, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_dml, verbose_name, impersonate_user, allow_file_upload, encrypted_extra, server_cert, allow_cvas, uuid, configuration_method, is_managed_externally, external_url) FROM stdin;
2024-03-27 09:06:31.329851	2025-07-28 13:04:46.664444	1	Trino lakehouse	trino://superset:XXXXXXXXXX@trino-coordinator:8443/lakehouse	1	1	\\x426f35784c53464f667134714b39515a74532f70366e794b48423565514e30716e5a59507053483348756f3d	\N	{"allows_virtual_table_explore":true,"engine_params":{"connect_args":{"verify":false,"http_scheme":"https"}}}	f	t	t	\N	f	t	\N	t	f	\\x7553472f724455376b6d78545a396e476e6338794a413d3d	\N	t	f8d085f0-211e-4ab7-97b1-dcd9b96ee28d	sqlalchemy_form	f	\N
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

COPY public.favstar (id, user_id, class_name, obj_id, dttm, uuid) FROM stdin;
\.


--
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.key_value (id, resource, value, uuid, created_on, created_by_fk, changed_on, changed_by_fk, expires_on) FROM stdin;
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.logs (id, action, user_id, "json", dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url, extra_json, tmp_schema_name, ctas_method, limiting_factor, catalog) FROM stdin;
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

COPY public.report_schedule (id, type, name, description, context_markdown, active, crontab, sql, chart_id, dashboard_id, database_id, last_eval_dttm, last_state, last_value, last_value_row_json, validator_type, validator_config_json, log_retention, grace_period, created_on, changed_on, created_by_fk, changed_by_fk, working_timeout, report_format, creation_method, timezone, extra_json, force_screenshot, custom_width, custom_height, email_subject) FROM stdin;
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

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk, extra_json, last_run, rows, uuid, template_parameters, catalog) FROM stdin;
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

COPY public.slices (created_on, changed_on, id, slice_name, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id, schema_perm, uuid, query_context, last_saved_at, last_saved_by_fk, certified_by, certification_details, is_managed_externally, external_url, catalog_perm) FROM stdin;
2024-03-27 13:07:15.570466	2024-03-27 13:19:04.302024	1	Customer age	table	compliance_analytics.customer_enriched	echarts_timeseries_bar	{"datasource":"10__table","viz_type":"echarts_timeseries_bar","slice_id":1,"x_axis":"birth_year","xAxisForceCategorical":true,"x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":["count"],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":"100000","truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastEnabled":false,"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","truncateXAxis":true,"y_axis_bounds":[null,null],"rich_tooltip":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[2]}	2	2	\N	\N	[Trino lakehouse].[customer_enriched](id:10)	10	[Trino lakehouse].[lakehouse].[compliance_analytics]	5faaa605-6dbd-47d4-a8c8-64839fb8ff12	{"datasource":{"id":10,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":[{"columnType":"BASE_AXIS","sqlExpression":"birth_year","label":"birth_year","expressionType":"SQL"}],"metrics":["count"],"orderby":[["count",false]],"annotation_layers":[],"row_limit":100000,"series_columns":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"time_offsets":[],"post_processing":[{"operation":"pivot","options":{"index":["birth_year"],"columns":[],"aggregates":{"count":{"operator":"mean"}},"drop_missing_columns":false}},{"operation":"flatten"}]}],"form_data":{"datasource":"10__table","viz_type":"echarts_timeseries_bar","slice_id":1,"x_axis":"birth_year","xAxisForceCategorical":true,"x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":["count"],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":"100000","truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastEnabled":false,"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","truncateXAxis":true,"y_axis_bounds":[null,null],"rich_tooltip":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[2],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:19:04.294946	2	\N	\N	f	\N	[Trino lakehouse].[lakehouse]
2024-03-27 13:10:33.36777	2024-03-27 13:28:09.660392	2	Customers per gender and martial status	table	compliance_analytics.customer_enriched	pivot_table_v2	{"datasource":"10__table","viz_type":"pivot_table_v2","slice_id":2,"groupbyColumns":["gender"],"groupbyRows":["marital_status"],"time_grain_sqla":"P1D","temporal_columns_lookup":{},"metrics":["count"],"metricsLayout":"ROWS","adhoc_filters":[{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_oi2u5m0p2o_h6xcp4zrqia","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"gender"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":true,"colTotals":true,"colSubTotals":false,"transposePivot":false,"combineMetric":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[2]}	2	2	\N	\N	[Trino lakehouse].[customer_enriched](id:10)	10	[Trino lakehouse].[lakehouse].[compliance_analytics]	6293babd-b3bc-4d05-a70d-5b58e7717458	{"datasource":{"id":10,"type":"table"},"force":false,"queries":[{"filters":[{"col":"gender","op":"IS NOT NULL"}],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":["gender","marital_status"],"metrics":["count"],"orderby":[["count",false]],"annotation_layers":[],"row_limit":10000,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"10__table","viz_type":"pivot_table_v2","slice_id":2,"groupbyColumns":["gender"],"groupbyRows":["marital_status"],"time_grain_sqla":"P1D","temporal_columns_lookup":{},"metrics":["count"],"metricsLayout":"ROWS","adhoc_filters":[{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_oi2u5m0p2o_h6xcp4zrqia","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"gender"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":true,"colTotals":true,"colSubTotals":false,"transposePivot":false,"combineMetric":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[2],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:28:09.65244	2	\N	\N	f	\N	[Trino lakehouse].[lakehouse]
2024-03-27 13:24:00.34103	2024-03-27 13:24:00.341036	3	Number of customers	table	customer_analytics.customer	big_number_total	{"datasource":"2__table","viz_type":"big_number_total","metric":"count","adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"dashboards":[]}	4	4	\N	\N	[Trino lakehouse].[customer](id:2)	2	[Trino lakehouse].[lakehouse].[customer_analytics]	bb2aacd7-a074-4289-a795-71ecca300f04	{"datasource":{"id":2,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":[],"metrics":["count"],"annotation_layers":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"2__table","viz_type":"big_number_total","metric":"count","adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"dashboards":[],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:24:00.33899	4	\N	\N	f	\N	[Trino lakehouse].[lakehouse]
2024-03-27 13:33:00.298876	2024-03-27 13:33:14.12662	4	Customers per state	table	customer_analytics.customer_enriched	pivot_table_v2	{"datasource":"5__table","viz_type":"pivot_table_v2","slice_id":4,"groupbyColumns":["state"],"groupbyRows":["preferred_customer"],"time_grain_sqla":"P1D","temporal_columns_lookup":{"birth_date":true},"metrics":["count"],"metricsLayout":"COLUMNS","adhoc_filters":[{"clause":"WHERE","comparator":"No filter","datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_5mb0q3yizik_0otv2gotnpi","isExtra":false,"isNew":false,"operator":"TEMPORAL_RANGE","sqlExpression":null,"subject":"birth_date"},{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_04997e44dahr_1j3hb5sursk","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"state"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":false,"colTotals":true,"transposePivot":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[3]}	4	4	\N	\N	[Trino lakehouse].[customer_enriched](id:5)	5	[Trino lakehouse].[lakehouse].[customer_analytics]	fa8b274f-8a69-4449-819e-521b4a6600a2	{"datasource":{"id":5,"type":"table"},"force":false,"queries":[{"filters":[{"col":"birth_date","op":"TEMPORAL_RANGE","val":"No filter"},{"col":"state","op":"IS NOT NULL"}],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":["state","preferred_customer"],"metrics":["count"],"orderby":[["count",false]],"annotation_layers":[],"row_limit":10000,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"5__table","viz_type":"pivot_table_v2","slice_id":4,"groupbyColumns":["state"],"groupbyRows":["preferred_customer"],"time_grain_sqla":"P1D","temporal_columns_lookup":{"birth_date":true},"metrics":["count"],"metricsLayout":"COLUMNS","adhoc_filters":[{"clause":"WHERE","comparator":"No filter","datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_5mb0q3yizik_0otv2gotnpi","isExtra":false,"isNew":false,"operator":"TEMPORAL_RANGE","sqlExpression":null,"subject":"birth_date"},{"clause":"WHERE","comparator":null,"datasourceWarning":false,"expressionType":"SIMPLE","filterOptionName":"filter_04997e44dahr_1j3hb5sursk","isExtra":false,"isNew":false,"operator":"IS NOT NULL","operatorId":"IS_NOT_NULL","sqlExpression":null,"subject":"state"}],"row_limit":10000,"order_desc":true,"aggregateFunction":"Sum","rowTotals":true,"rowSubTotals":false,"colTotals":true,"transposePivot":false,"valueFormat":"SMART_NUMBER","date_format":"smart_date","rowOrder":"key_a_to_z","colOrder":"key_a_to_z","extra_form_data":{},"dashboards":[3],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2024-03-27 13:33:14.120392	4	\N	\N	f	\N	[Trino lakehouse].[lakehouse]
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

COPY public.tab_state (created_on, changed_on, extra_json, id, user_id, label, active, database_id, schema, sql, query_limit, latest_query_id, autorun, template_params, created_by_fk, changed_by_fk, hide_left_bar, saved_query_id, catalog) FROM stdin;
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, uuid, extra, advanced_data_type, datetime_format) FROM stdin;
2024-03-27 12:59:46.354543	2024-03-27 12:59:46.35455	13	2	c_customer_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	e3499005-7ad7-4d19-aa3d-29b6d18a682c	\N	\N	\N
2024-03-27 12:59:46.354598	2024-03-27 12:59:46.3546	14	2	c_customer_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	bbac8121-51b5-48df-815d-4ef05d71b4cf	\N	\N	\N
2024-03-27 12:59:46.354626	2024-03-27 12:59:46.354628	15	2	c_current_cdemo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	70ed5cb7-2b1f-4f85-a02d-2e7ce2f6d98d	\N	\N	\N
2024-03-27 12:59:46.354652	2024-03-27 12:59:46.354655	16	2	c_current_hdemo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	cb7c1ed4-5440-4241-b9d2-9c105727c02c	\N	\N	\N
2024-03-27 12:59:46.354679	2024-03-27 12:59:46.354681	17	2	c_current_addr_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	26b7de17-bdb0-411b-aba9-7b8abb309289	\N	\N	\N
2024-03-27 12:59:46.354706	2024-03-27 12:59:46.354708	18	2	c_first_shipto_date_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	172e3154-7e85-4e0e-ac23-a36e3a5ac9af	\N	\N	\N
2024-03-27 12:59:46.354732	2024-03-27 12:59:46.354734	19	2	c_first_sales_date_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	d492fd0b-39b2-467a-aeba-9457d329778c	\N	\N	\N
2024-03-27 12:59:46.354758	2024-03-27 12:59:46.35476	20	2	c_salutation	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	36992ee7-fff0-4e54-a242-70b1148e3e80	\N	\N	\N
2024-03-27 12:59:46.354784	2024-03-27 12:59:46.354786	21	2	c_first_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	0c617826-5ee2-4b7c-af3a-867a18d01637	\N	\N	\N
2024-03-27 12:59:46.35481	2024-03-27 12:59:46.354812	22	2	c_last_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	c0742f18-1b0d-41fc-9d71-b14ab94e0140	\N	\N	\N
2024-03-27 12:59:46.354836	2024-03-27 12:59:46.354838	23	2	c_preferred_cust_flag	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	717b53bb-1752-4a9f-bab3-6b2d6f7953d5	\N	\N	\N
2024-03-27 12:59:46.354862	2024-03-27 12:59:46.354864	24	2	c_birth_day	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	fb66a618-30f6-4ab3-aa08-1f66cea42ac8	\N	\N	\N
2024-03-27 12:59:46.354888	2024-03-27 12:59:46.35489	25	2	c_birth_month	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	f7bcdf06-cb0c-413b-8a5b-372f7d49a5d2	\N	\N	\N
2024-03-27 12:59:46.354913	2024-03-27 12:59:46.354915	26	2	c_birth_year	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	bdc07ec0-18f8-4c4d-8c83-c8a867eaddf2	\N	\N	\N
2024-03-27 12:59:46.354939	2024-03-27 12:59:46.354941	27	2	c_birth_country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	449b7c4d-49fd-455e-b659-3d95b4f65ff1	\N	\N	\N
2024-03-27 12:59:46.354966	2024-03-27 12:59:46.354968	28	2	c_login	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f1f00aff-8181-4d1d-942f-e40e3fa3b2a9	\N	\N	\N
2024-03-27 12:59:46.354992	2024-03-27 12:59:46.354994	29	2	c_email_address	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	cd3f598d-0cbb-46c4-9fd1-f02fbbb550ee	\N	\N	\N
2024-03-27 12:59:46.355017	2024-03-27 12:59:46.355019	30	2	c_last_review_date_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	7bf3e5e0-86a7-45e5-adb7-4da040f4d3b1	\N	\N	\N
2024-03-27 13:00:05.462603	2024-03-27 13:00:05.462609	31	3	ca_address_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	f556ed9d-5926-4d1d-a9b0-a71134b3c447	\N	\N	\N
2024-03-27 13:00:05.462654	2024-03-27 13:00:05.462656	32	3	ca_address_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f6260587-2a8d-48c4-aaef-4615a97b119b	\N	\N	\N
2024-03-27 13:00:05.46268	2024-03-27 13:00:05.462682	33	3	ca_street_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	0616553d-26c7-48a6-8c3f-461f4d695ef9	\N	\N	\N
2024-03-27 13:00:05.462705	2024-03-27 13:00:05.462707	34	3	ca_street_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f6de2c3c-d864-44f9-a22e-4ea9508f749c	\N	\N	\N
2024-03-27 13:00:05.462729	2024-03-27 13:00:05.462731	35	3	ca_street_type	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	2be1be94-2424-496a-ba46-33bcd0769e1f	\N	\N	\N
2024-03-27 13:00:05.462753	2024-03-27 13:00:05.462755	36	3	ca_suite_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	17d83f87-0975-4419-9e55-ad26584547ee	\N	\N	\N
2024-03-27 13:00:05.462778	2024-03-27 13:00:05.46278	37	3	ca_city	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	69b064f0-4819-4924-bb5b-3e016c83c81d	\N	\N	\N
2024-03-27 13:00:05.462803	2024-03-27 13:00:05.462804	38	3	ca_county	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f89b7a24-846f-4c83-bbae-aa054255523d	\N	\N	\N
2024-03-27 13:00:05.462827	2024-03-27 13:00:05.462829	39	3	ca_state	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	124661f7-f468-4575-9e23-745e96acfa5a	\N	\N	\N
2024-03-27 13:00:05.462851	2024-03-27 13:00:05.462853	40	3	ca_zip	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	48f8c699-a2b0-4f56-a962-4470ce63007b	\N	\N	\N
2024-03-27 13:00:05.462876	2024-03-27 13:00:05.462878	41	3	ca_country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	15bb84a0-fd66-4972-be1f-5f69717fdf18	\N	\N	\N
2024-03-27 13:00:05.462901	2024-03-27 13:00:05.462903	42	3	ca_gmt_offset	f	t	DECIMAL(5, 2)	t	t	\N	1	1	\N	\N	\N	52fd9fce-575f-43b7-a7a6-6e443c7d88cd	\N	\N	\N
2024-03-27 13:00:05.462925	2024-03-27 13:00:05.462927	43	3	ca_location_type	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	262d0cc4-dcb3-4cae-b9e0-76dd822d2740	\N	\N	\N
2024-03-27 13:00:17.862815	2024-03-27 13:00:17.862821	44	4	cd_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	6a14a7fb-8f74-4eee-902e-b064b82e3757	\N	\N	\N
2024-03-27 13:00:17.862868	2024-03-27 13:00:17.86287	45	4	cd_gender	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	c7f744ae-f2e2-47b3-939f-0c53124427a5	\N	\N	\N
2024-03-27 13:00:17.862896	2024-03-27 13:00:17.862898	46	4	cd_marital_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	d8287033-505b-46a6-b7ef-68b6cacd052b	\N	\N	\N
2024-03-27 13:00:17.862922	2024-03-27 13:00:17.862924	47	4	cd_education_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	15d7335d-95a1-4a84-b0ff-f3835eef5c74	\N	\N	\N
2024-03-27 13:00:17.862949	2024-03-27 13:00:17.862951	48	4	cd_purchase_estimate	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	9eeea402-7859-4f20-bda5-6c5db74d3631	\N	\N	\N
2024-03-27 13:00:17.862975	2024-03-27 13:00:17.862977	49	4	cd_credit_rating	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	744c636d-750e-40bb-a57c-544e2373adc5	\N	\N	\N
2024-03-27 13:00:17.863001	2024-03-27 13:00:17.863003	50	4	cd_dep_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	c5bf9a47-ad9e-4180-a68d-2ae4cfc849e5	\N	\N	\N
2024-03-27 13:00:17.863028	2024-03-27 13:00:17.86303	51	4	cd_dep_employed_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	b7f29457-6b0b-43de-a86f-a571efeb5968	\N	\N	\N
2024-03-27 13:00:17.863054	2024-03-27 13:00:17.863056	52	4	cd_dep_college_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	2c6df96a-5bc5-436f-920c-65ab6c338223	\N	\N	\N
2024-03-27 13:00:46.873084	2024-03-27 13:00:46.873091	53	5	customer_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	ac1670bb-8a7e-40b7-9fb9-6f726ed39cee	\N	\N	\N
2024-03-27 13:00:46.873139	2024-03-27 13:00:46.873141	54	5	customer_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	0025a3d4-7ec5-4b11-a602-8da3afab5a57	\N	\N	\N
2024-03-27 13:00:46.873168	2024-03-27 13:00:46.87317	55	5	household_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	ceb41a4d-0b87-4ee9-8ac3-878df5ccf388	\N	\N	\N
2024-03-27 13:00:46.873195	2024-03-27 13:00:46.873197	56	5	salutation	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	db718e65-a2b0-4711-9d2b-28e2c2503ae2	\N	\N	\N
2024-03-27 13:00:46.873222	2024-03-27 13:00:46.873224	57	5	given_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	972db207-3691-4f29-847e-6402112db487	\N	\N	\N
2024-03-27 13:00:46.87325	2024-03-27 13:00:46.873252	58	5	family_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	c49aa618-b459-4d2c-9453-8eb5e98771bb	\N	\N	\N
2024-03-27 13:00:46.873277	2024-03-27 13:00:46.873279	59	5	preferred_customer	f	t	BOOLEAN	t	t	\N	1	1	\N	\N	\N	f0749f81-7ae7-4e74-98df-39cd84ef17cd	\N	\N	\N
2024-03-27 13:00:46.873304	2024-03-27 13:00:46.873306	60	5	birth_date	t	t	DATE	t	t	\N	1	1	\N	\N	\N	39049540-100f-41f4-b3c0-695429ebd192	\N	\N	\N
2024-03-27 13:00:46.873346	2024-03-27 13:00:46.873348	61	5	email_address	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	601ac9c7-ffcb-4e8a-a3f4-482482bd6774	\N	\N	\N
2024-03-27 13:00:46.873374	2024-03-27 13:00:46.873376	62	5	country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	069f9f60-67c1-4faa-b0cc-76b121f718fc	\N	\N	\N
2024-03-27 13:00:46.873401	2024-03-27 13:00:46.873404	63	5	state	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	1651342d-f3d7-412c-8db9-7a635454243c	\N	\N	\N
2024-03-27 13:00:46.873429	2024-03-27 13:00:46.873431	64	5	zip	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	e0d3a8bc-4984-4507-b018-743b51c2a03b	\N	\N	\N
2024-03-27 13:00:46.873455	2024-03-27 13:00:46.873457	65	5	city	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	2b9300c7-7872-451c-8dcd-04d5f3c25673	\N	\N	\N
2024-03-27 13:00:46.873482	2024-03-27 13:00:46.873484	66	5	county	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f727b0c9-a9f4-4a04-89a4-bf28de9d4124	\N	\N	\N
2024-03-27 13:00:46.873508	2024-03-27 13:00:46.87351	67	5	ca_street_name	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	54dc0748-6f30-43d2-83f7-9bc9aab7ed96	\N	\N	\N
2024-03-27 13:00:46.873534	2024-03-27 13:00:46.873536	68	5	ca_street_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	77982f1d-c1bc-4081-9041-895d634277fe	\N	\N	\N
2024-03-27 13:00:46.87356	2024-03-27 13:00:46.873562	69	5	suite_number	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	7f03675c-6260-42a5-8f12-ae43d69f7ed5	\N	\N	\N
2024-03-27 13:00:46.873586	2024-03-27 13:00:46.873588	70	5	location_type	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	a6376e83-1dc1-494a-9164-c37584988cf7	\N	\N	\N
2024-03-27 13:00:46.873612	2024-03-27 13:00:46.873614	71	5	gmt_offset	f	t	DECIMAL(5, 2)	t	t	\N	1	1	\N	\N	\N	ecd13540-69aa-4083-934c-a200be1f012f	\N	\N	\N
2024-03-27 13:01:08.868162	2024-03-27 13:01:08.868169	72	6	hd_demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	a15757fe-015b-4d80-a500-9c366c094d4e	\N	\N	\N
2024-03-27 13:01:08.868216	2024-03-27 13:01:08.868218	73	6	hd_income_band_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	6fc84094-9702-42fa-bc1d-9545fc448501	\N	\N	\N
2024-03-27 13:01:08.868244	2024-03-27 13:01:08.868246	74	6	hd_buy_potential	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	51de1b81-27d2-4b67-8fce-09b46a30d387	\N	\N	\N
2024-03-27 13:01:08.86827	2024-03-27 13:01:08.868272	75	6	hd_dep_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	8488beb4-da08-4a53-9708-d02c0152dfa4	\N	\N	\N
2024-03-27 13:01:08.868297	2024-03-27 13:01:08.868299	76	6	hd_vehicle_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	3da56b50-a19e-4d8d-a3d0-4d69c1fc064d	\N	\N	\N
2024-03-27 13:01:23.986986	2024-03-27 13:01:23.986992	77	7	ib_income_band_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	6fe0f1e9-b1ea-4f6a-a566-7732d13deee7	\N	\N	\N
2024-03-27 13:01:23.98704	2024-03-27 13:01:23.987042	78	7	ib_lower_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	13f6cbfb-84e3-4733-b655-2cabcd0f36f7	\N	\N	\N
2024-03-27 13:01:23.987068	2024-03-27 13:01:23.98707	79	7	ib_upper_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	5721e23c-5b25-4331-b323-aaade5030dbf	\N	\N	\N
2024-03-27 13:01:42.883601	2024-03-27 13:01:42.883607	80	8	demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	2c6600c0-4766-41c1-90b5-238c828b807b	\N	\N	\N
2024-03-27 13:01:42.883654	2024-03-27 13:01:42.883657	81	8	gender	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	96d420f0-9f25-40be-931f-d57a22d830c9	\N	\N	\N
2024-03-27 13:01:42.883682	2024-03-27 13:01:42.883684	82	8	marital_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	7e4938f8-6861-4ea3-be57-ddff8ec35fea	\N	\N	\N
2024-03-27 13:01:42.883707	2024-03-27 13:01:42.883709	83	8	education_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	8299464d-acf4-4099-81b1-10185b686b6b	\N	\N	\N
2024-03-27 13:01:53.677207	2024-03-27 13:01:53.677213	84	9	demo_sk	f	t	BIGINT	t	t	\N	1	1	\N	\N	\N	69dc5a4c-7e05-4dc2-ab87-847683314e4e	\N	\N	\N
2024-03-27 13:01:53.677259	2024-03-27 13:01:53.677262	85	9	income_lower_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	9f7f482f-bcb5-431a-9550-9acb9496890f	\N	\N	\N
2024-03-27 13:01:53.677287	2024-03-27 13:01:53.677289	86	9	income_upper_bound	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	68621d63-cac1-401f-a29a-a5fa6b897900	\N	\N	\N
2024-03-27 13:01:53.677314	2024-03-27 13:01:53.677316	87	9	buy_potential	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	a79acabc-4c34-4d1a-b6af-2821a554ec72	\N	\N	\N
2024-03-27 13:01:53.67734	2024-03-27 13:01:53.677342	88	9	dependant_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	8b127fe5-fbbc-4ae2-bab2-0bf19676f068	\N	\N	\N
2024-03-27 13:01:53.677367	2024-03-27 13:01:53.677369	89	9	vehicle_count	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	292b908d-ed6e-4e13-bf38-f9fa6e935b73	\N	\N	\N
2024-03-27 13:02:07.494091	2024-03-27 13:02:07.494097	90	10	customer_id	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	4593c119-c3d9-4a57-a419-91fff24f0075	\N	\N	\N
2024-03-27 13:02:07.494141	2024-03-27 13:02:07.494143	91	10	salutation	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	f3d88299-d0d4-47a4-93a0-60d57a640189	\N	\N	\N
2024-03-27 13:02:07.494168	2024-03-27 13:02:07.49417	92	10	preferred_customer	f	t	BOOLEAN	t	t	\N	1	1	\N	\N	\N	8f7006d5-f9d7-4409-9be4-d2fe6490fcc7	\N	\N	\N
2024-03-27 13:02:07.494193	2024-03-27 13:02:07.494195	93	10	birth_year	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	6528bad2-e375-47c8-86ad-b2d6bb727a83	\N	\N	\N
2024-03-27 13:02:07.494218	2024-03-27 13:02:07.49422	94	10	email_address	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	af27eb8d-084e-4a58-8d3d-a91f781d7ba5	\N	\N	\N
2024-03-27 13:02:07.494244	2024-03-27 13:02:07.494246	95	10	country	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	da709c32-4bc1-4994-a0e9-4a86cdfc9432	\N	\N	\N
2024-03-27 13:02:07.494269	2024-03-27 13:02:07.494271	96	10	state	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	1e0ae268-0c25-4dce-a0a0-7c49ec4465af	\N	\N	\N
2024-03-27 13:02:07.494293	2024-03-27 13:02:07.494295	97	10	zip	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	b27ed42a-d482-46f8-9498-97ae60707810	\N	\N	\N
2024-03-27 13:02:07.494318	2024-03-27 13:02:07.49432	98	10	city	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	6ac815b2-30af-4d66-8ba9-f11c2b44539d	\N	\N	\N
2024-03-27 13:02:07.494343	2024-03-27 13:02:07.494345	99	10	gmt_offset	f	t	DECIMAL(5, 2)	t	t	\N	1	1	\N	\N	\N	e26a4a6e-1d32-49ff-b7ea-46dc67eb143f	\N	\N	\N
2024-03-27 13:02:07.494368	2024-03-27 13:02:07.49437	100	10	gender	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	5cde944c-ca98-4ef9-9c7a-1cc21d5c3e11	\N	\N	\N
2024-03-27 13:02:07.494392	2024-03-27 13:02:07.494394	101	10	marital_status	f	t	VARCHAR	t	t	\N	1	1	\N	\N	\N	45725cbe-ef1f-4e3f-832d-4a36be604905	\N	\N	\N
\.


--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_schema (created_on, changed_on, extra_json, id, tab_state_id, database_id, schema, "table", description, expanded, created_by_fk, changed_by_fk, catalog) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params, schema_perm, extra, uuid, is_managed_externally, external_url, normalize_columns, always_filter_main_dttm, catalog, catalog_perm, folders, currency_code_column) FROM stdin;
2024-03-27 12:59:45.846675	2024-03-27 12:59:46.363021	2	customer	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer](id:2)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	03100221-8213-4d85-8896-e13fa95fbbd0	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:00:04.955623	2024-03-27 13:00:05.469258	3	customer_address	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_address](id:3)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	985d0de6-bb7c-42b6-986f-101643e80a7a	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:00:17.385615	2024-03-27 13:00:17.869299	4	customer_demographics	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_demographics](id:4)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	9556a5ee-9557-4ee8-a255-73e8243f95d4	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:00:46.52258	2024-03-27 13:00:46.879753	5	customer_enriched	birth_date	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_enriched](id:5)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	77bdb731-deaa-4de4-b7a4-e1b214b6a2e9	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:01:08.401535	2024-03-27 13:01:08.872462	6	household_demographics	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[household_demographics](id:6)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	f726c004-9f9a-452a-985f-2c98dce639f0	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:01:23.528732	2024-03-27 13:01:23.990913	7	income_band	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[income_band](id:7)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	92ee35d2-dd94-4a96-91bf-987d62b18065	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:01:42.574294	2024-03-27 13:01:42.888335	8	customer_demographics_enriched	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[customer_demographics_enriched](id:8)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	24a1f592-e336-433c-83dc-de561e308e8f	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:01:53.376185	2024-03-27 13:01:53.683648	9	household_demographics_enriched	\N	\N	1	1	1	0	\N	f	\N	customer_analytics	\N	\N	[Trino lakehouse].[household_demographics_enriched](id:9)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[customer_analytics]	\N	341b20f3-39de-468f-9d30-b0bcce22a87c	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
2024-03-27 13:02:07.16599	2024-03-27 13:02:07.49932	10	customer_enriched	\N	\N	1	1	1	0	\N	f	\N	compliance_analytics	\N	\N	[Trino lakehouse].[customer_enriched](id:10)	t	\N	f	\N	[Trino lakehouse].[lakehouse].[compliance_analytics]	\N	a310a9fe-e582-4cd3-8941-3625afcd54ff	f	\N	f	f	lakehouse	[Trino lakehouse].[lakehouse]	\N	\N
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
-- Data for Name: task_subscribers; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.task_subscribers (id, task_id, user_id, subscribed_at, created_on, created_by_fk, changed_on, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tasks (id, uuid, task_key, task_type, task_name, scope, status, dedup_key, created_on, changed_on, created_by_fk, changed_by_fk, started_at, ended_at, user_id, payload, properties) FROM stdin;
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.themes (uuid, created_on, changed_on, id, theme_name, json_data, is_system, created_by_fk, changed_by_fk, is_system_default, is_system_dark) FROM stdin;
c386c824-9838-40e2-982b-d3fa57203812	2026-07-06 08:21:11.9833	2026-07-06 08:21:11.983307	1	THEME_DEFAULT	{"token": {"brandAppName": "Superset", "brandLogoAlt": "Apache Superset", "brandLogoUrl": "/static/assets/images/superset-logo-horiz.png", "brandLogoMargin": "18px 0", "brandLogoHref": "/", "brandLogoHeight": "24px", "brandSpinnerUrl": null, "brandSpinnerSvg": null, "colorPrimary": "#2893B3", "colorLink": "#2893B3", "colorError": "#e04355", "colorWarning": "#fcc700", "colorSuccess": "#5ac189", "colorInfo": "#66bcfe", "fontUrls": [], "fontFamily": "Inter, Helvetica, Arial, sans-serif", "fontFamilyCode": "'IBM Plex Mono', 'Courier New', monospace", "transitionTiming": 0.3, "brandIconMaxWidth": 37, "fontSizeXS": "8", "fontSizeXXL": "28", "fontWeightNormal": "400", "fontWeightLight": "300", "fontWeightStrong": "500", "fontWeightBold": "700", "colorEditorSelection": "#fff5cf"}, "algorithm": "default"}	t	\N	\N	f	f
efd0c84b-da48-44fe-b8ce-71fef5ce3320	2026-07-06 08:21:11.986615	2026-07-06 08:21:11.986619	2	THEME_DARK	{"token": {"brandAppName": "Superset", "brandLogoAlt": "Apache Superset", "brandLogoUrl": "/static/assets/images/superset-logo-horiz.png", "brandLogoMargin": "18px 0", "brandLogoHref": "/", "brandLogoHeight": "24px", "brandSpinnerUrl": null, "brandSpinnerSvg": null, "colorPrimary": "#2893B3", "colorLink": "#2893B3", "colorError": "#e04355", "colorWarning": "#fcc700", "colorSuccess": "#5ac189", "colorInfo": "#66bcfe", "fontUrls": [], "fontFamily": "Inter, Helvetica, Arial, sans-serif", "fontFamilyCode": "'IBM Plex Mono', 'Courier New', monospace", "transitionTiming": 0.3, "brandIconMaxWidth": 37, "fontSizeXS": "8", "fontSizeXXL": "28", "fontWeightNormal": "400", "fontWeightLight": "300", "fontWeightStrong": "500", "fontWeightBold": "700", "colorEditorSelection": "#5c4d1a"}, "algorithm": "dark"}	t	\N	\N	f	f
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk, avatar_url) FROM stdin;
\.


--
-- Data for Name: user_favorite_tag; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_favorite_tag (user_id, tag_id) FROM stdin;
\.


--
-- Name: ab_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_group_id_seq', 1, false);


--
-- Name: ab_group_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_group_role_id_seq', 1, false);


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 95, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 279, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 662, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 9, true);


--
-- Name: ab_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_group_id_seq', 1, false);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 8, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 23, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 126, true);


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
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.database_user_oauth2_tokens_id_seq', 1, false);


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
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.key_value_id_seq', 1, false);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.query_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.tab_state_id_seq', 1, false);


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
-- Name: task_subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.task_subscribers_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.themes_id_seq', 2, true);


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
-- Name: ab_group ab_group_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_group
    ADD CONSTRAINT ab_group_name_key UNIQUE (name);


--
-- Name: ab_group ab_group_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_group
    ADD CONSTRAINT ab_group_pkey PRIMARY KEY (id);


--
-- Name: ab_group_role ab_group_role_group_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_group_id_role_id_key UNIQUE (group_id, role_id);


--
-- Name: ab_group_role ab_group_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_pkey PRIMARY KEY (id);


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
-- Name: ab_user_group ab_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_pkey PRIMARY KEY (id);


--
-- Name: ab_user_group ab_user_group_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_user_id_group_id_key UNIQUE (user_id, group_id);


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
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_pkey PRIMARY KEY (id);


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
-- Name: task_subscribers task_subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers
    ADD CONSTRAINT task_subscribers_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_uuid_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_uuid_key UNIQUE (uuid);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: themes themes_uuid_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_uuid_key UNIQUE (uuid);


--
-- Name: tagged_object uix_tagged_object; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT uix_tagged_object UNIQUE (tag_id, object_id, object_type);


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
-- Name: task_subscribers uq_task_subscribers_task_user; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers
    ADD CONSTRAINT uq_task_subscribers_task_user UNIQUE (task_id, user_id);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: idx_group_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_group_id ON public.ab_group_role USING btree (group_id);


--
-- Name: idx_group_role_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_group_role_id ON public.ab_group_role USING btree (role_id);


--
-- Name: idx_task_subscribers_user_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_task_subscribers_user_id ON public.task_subscribers USING btree (user_id);


--
-- Name: idx_tasks_created_by; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_created_by ON public.tasks USING btree (created_by_fk);


--
-- Name: idx_tasks_created_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_created_on ON public.tasks USING btree (created_on);


--
-- Name: idx_tasks_dedup_key; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX idx_tasks_dedup_key ON public.tasks USING btree (dedup_key);


--
-- Name: idx_tasks_ended_at; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_ended_at ON public.tasks USING btree (ended_at);


--
-- Name: idx_tasks_scope; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_scope ON public.tasks USING btree (scope);


--
-- Name: idx_tasks_status; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_status ON public.tasks USING btree (status);


--
-- Name: idx_tasks_task_key; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_task_key ON public.tasks USING btree (task_key);


--
-- Name: idx_tasks_task_type; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_tasks_task_type ON public.tasks USING btree (task_type);


--
-- Name: idx_tasks_uuid; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX idx_tasks_uuid ON public.tasks USING btree (uuid);


--
-- Name: idx_theme_is_system_dark; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_theme_is_system_dark ON public.themes USING btree (is_system_dark);


--
-- Name: idx_theme_is_system_default; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_theme_is_system_default ON public.themes USING btree (is_system_default);


--
-- Name: idx_user_group_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_user_group_id ON public.ab_user_group USING btree (group_id);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_user_id ON public.ab_user_group USING btree (user_id);


--
-- Name: idx_user_id_database_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_user_id_database_id ON public.database_user_oauth2_tokens USING btree (user_id, database_id);


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
-- Name: ix_report_execution_log_report_schedule_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_execution_log_report_schedule_id ON public.report_execution_log USING btree (report_schedule_id);


--
-- Name: ix_report_execution_log_start_dttm; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_execution_log_start_dttm ON public.report_execution_log USING btree (start_dttm);


--
-- Name: ix_report_recipient_report_schedule_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_recipient_report_schedule_id ON public.report_recipient USING btree (report_schedule_id);


--
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- Name: ix_sql_editor_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_sql_editor_id ON public.query USING btree (sql_editor_id);


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
-- Name: ab_group_role ab_group_role_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.ab_group(id) ON DELETE CASCADE;


--
-- Name: ab_group_role ab_group_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id) ON DELETE CASCADE;


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


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
-- Name: ab_user_group ab_user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.ab_group(id) ON DELETE CASCADE;


--
-- Name: ab_user_group ab_user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


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
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


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
-- Name: dashboards fk_dashboards_theme_id_themes; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT fk_dashboards_theme_id_themes FOREIGN KEY (theme_id) REFERENCES public.themes(id);


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
-- Name: task_subscribers fk_task_subscribers_changed_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers
    ADD CONSTRAINT fk_task_subscribers_changed_by_fk_ab_user FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id) ON DELETE SET NULL;


--
-- Name: task_subscribers fk_task_subscribers_created_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers
    ADD CONSTRAINT fk_task_subscribers_created_by_fk_ab_user FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id) ON DELETE SET NULL;


--
-- Name: task_subscribers fk_task_subscribers_task_id_tasks; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers
    ADD CONSTRAINT fk_task_subscribers_task_id_tasks FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: task_subscribers fk_task_subscribers_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.task_subscribers
    ADD CONSTRAINT fk_task_subscribers_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: tasks fk_tasks_changed_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_tasks_changed_by_fk_ab_user FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id) ON DELETE SET NULL;


--
-- Name: tasks fk_tasks_created_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_tasks_created_by_fk_ab_user FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id) ON DELETE SET NULL;


--
-- Name: tasks fk_tasks_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_tasks_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE SET NULL;


--
-- Name: themes fk_themes_changed_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_themes_changed_by_fk_ab_user FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: themes fk_themes_created_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_themes_created_by_fk_ab_user FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


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
