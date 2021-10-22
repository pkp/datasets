--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP INDEX public.versions_pkey;
DROP INDEX public.users_username;
DROP INDEX public.users_email;
DROP INDEX public.user_user_groups_user_id;
DROP INDEX public.user_user_groups_user_group_id;
DROP INDEX public.user_user_groups_pkey;
DROP INDEX public.user_settings_user_id;
DROP INDEX public.user_settings_pkey;
DROP INDEX public.user_settings_locale_setting_name_index;
DROP INDEX public.user_groups_user_group_id;
DROP INDEX public.user_groups_role_id;
DROP INDEX public.user_groups_context_id;
DROP INDEX public.user_group_stage_user_group_id;
DROP INDEX public.user_group_stage_stage_id;
DROP INDEX public.user_group_stage_pkey;
DROP INDEX public.user_group_stage_context_id;
DROP INDEX public.user_group_settings_pkey;
DROP INDEX public.u_e_pkey;
DROP INDEX public.temporary_files_user_id;
DROP INDEX public.submissions_publication_id;
DROP INDEX public.submissions_context_id;
DROP INDEX public.submission_tombstones_submission_id;
DROP INDEX public.submission_tombstones_journal_id;
DROP INDEX public.submission_settings_submission_id;
DROP INDEX public.submission_settings_pkey;
DROP INDEX public.submission_search_object_submission;
DROP INDEX public.submission_search_object_keywords_pkey;
DROP INDEX public.submission_search_object_keywords_keyword_id;
DROP INDEX public.submission_search_keyword_text;
DROP INDEX public.submission_files_submission_id;
DROP INDEX public.submission_files_stage_assoc;
DROP INDEX public.submission_file_settings_pkey;
DROP INDEX public.submission_file_settings_id;
DROP INDEX public.submission_comments_submission_id;
DROP INDEX public.subeditor_submission_group_user_id;
DROP INDEX public.subeditor_submission_group_context_id;
DROP INDEX public.subeditor_submission_group_assoc_id;
DROP INDEX public.stage_assignments_user_id;
DROP INDEX public.stage_assignments_user_group_id;
DROP INDEX public.stage_assignments_submission_id;
DROP INDEX public.stage_assignment;
DROP INDEX public.site_settings_pkey;
DROP INDEX public.sessions_user_id;
DROP INDEX public.sessions_pkey;
DROP INDEX public.sections_journal_id;
DROP INDEX public.section_settings_section_id;
DROP INDEX public.section_settings_pkey;
DROP INDEX public.section_editors_pkey;
DROP INDEX public.scheduled_tasks_pkey;
DROP INDEX public.review_rounds_submission_id_stage_id_round_pkey;
DROP INDEX public.review_rounds_submission_id;
DROP INDEX public.review_round_files_submission_id;
DROP INDEX public.review_round_files_pkey;
DROP INDEX public.review_files_review_id;
DROP INDEX public.review_files_pkey;
DROP INDEX public.review_assignments_submission_id;
DROP INDEX public.review_assignments_reviewer_review;
DROP INDEX public.review_assignments_reviewer_id;
DROP INDEX public.review_assignments_form_id;
DROP INDEX public.query_participants_pkey;
DROP INDEX public.queries_assoc_id;
DROP INDEX public.publications_url_path;
DROP INDEX public.publications_submission_id;
DROP INDEX public.publications_section_id;
DROP INDEX public.publication_settings_publication_id;
DROP INDEX public.publication_settings_pkey;
DROP INDEX public.publication_galleys_url_path;
DROP INDEX public.publication_galleys_publication_id;
DROP INDEX public.publication_galley_settings_pkey;
DROP INDEX public.publication_galley_settings_galley_id;
DROP INDEX public.publication_categories_id;
DROP INDEX public.plugin_settings_plugin_name;
DROP INDEX public.plugin_settings_pkey;
DROP INDEX public.oai_resumption_tokens_pkey;
DROP INDEX public.notifications_user_id_level;
DROP INDEX public.notifications_context_id_user_id;
DROP INDEX public.notifications_context_id;
DROP INDEX public.notifications_assoc;
DROP INDEX public.notification_settings_pkey;
DROP INDEX public.notification_mail_list_email_context;
DROP INDEX public.notes_assoc;
DROP INDEX public.navigation_menu_item_settings_pkey;
DROP INDEX public.navigation_menu_item_settings_navigation_menu_id;
DROP INDEX public.navigation_menu_item_assignment_settings_pkey;
DROP INDEX public.metrics_metric_type_submission_id_assoc_type;
DROP INDEX public.metrics_metric_type_submission_id_assoc;
DROP INDEX public.metrics_metric_type_context_id;
DROP INDEX public.metrics_load_id;
DROP INDEX public.metadata_descripton_settings_pkey;
DROP INDEX public.metadata_descriptions_assoc;
DROP INDEX public.metadata_description_settings_id;
DROP INDEX public.library_files_submission_id;
DROP INDEX public.library_files_context_id;
DROP INDEX public.library_file_settings_pkey;
DROP INDEX public.library_file_settings_id;
DROP INDEX public.journals_path;
DROP INDEX public.journal_settings_pkey;
DROP INDEX public.journal_settings_journal_id;
DROP INDEX public.item_views_pkey;
DROP INDEX public.genre_settings_pkey;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.filter_settings_pkey;
DROP INDEX public.filter_settings_id;
DROP INDEX public.filter_groups_symbolic;
DROP INDEX public.event_log_settings_pkey;
DROP INDEX public.event_log_settings_log_id;
DROP INDEX public.event_log_assoc;
DROP INDEX public.email_templates_email_key;
DROP INDEX public.email_templates_default_email_key;
DROP INDEX public.email_templates_default_data_pkey;
DROP INDEX public.email_settings_pkey;
DROP INDEX public.email_settings_email_id;
DROP INDEX public.email_log_user_id;
DROP INDEX public.email_log_assoc;
DROP INDEX public.edit_decisions_submission_id;
DROP INDEX public.edit_decisions_editor_id;
DROP INDEX public.data_object_tombstones_data_object_id;
DROP INDEX public.data_object_tombstone_settings_tombstone_id;
DROP INDEX public.data_object_tombstone_settings_pkey;
DROP INDEX public.data_object_tombstone_oai_set_objects_tombstone_id;
DROP INDEX public.controlled_vocab_symbolic;
DROP INDEX public.controlled_vocab_entries_cv_id;
DROP INDEX public.citations_publication_seq;
DROP INDEX public.citations_publication;
DROP INDEX public.citation_settings_pkey;
DROP INDEX public.citation_settings_citation_id;
DROP INDEX public.category_settings_pkey;
DROP INDEX public.category_path;
DROP INDEX public.category_context_id;
DROP INDEX public.c_v_e_s_pkey;
DROP INDEX public.c_v_e_s_entry_id;
DROP INDEX public.authors_publication_id;
DROP INDEX public.author_settings_pkey;
DROP INDEX public.author_settings_author_id;
DROP INDEX public.assignment_settings_navigation_menu_item_assignment_id;
DROP INDEX public.announcements_assoc;
DROP INDEX public.announcement_types_assoc;
DROP INDEX public.announcement_type_settings_type_id;
DROP INDEX public.announcement_type_settings_pkey;
DROP INDEX public.announcement_settings_pkey;
DROP INDEX public.announcement_settings_announcement_id;
DROP INDEX public.access_keys_hash;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
ALTER TABLE ONLY public.temporary_files DROP CONSTRAINT temporary_files_pkey;
ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_pkey;
ALTER TABLE ONLY public.submission_tombstones DROP CONSTRAINT submission_tombstones_pkey;
ALTER TABLE ONLY public.submission_supplementary_files DROP CONSTRAINT submission_supplementary_files_pkey;
ALTER TABLE ONLY public.submission_search_objects DROP CONSTRAINT submission_search_objects_pkey;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_list_pkey;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_pkey;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_pkey;
ALTER TABLE ONLY public.submission_artwork_files DROP CONSTRAINT submission_artwork_files_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_pkey;
ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_pkey;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_pkey;
ALTER TABLE ONLY public.queries DROP CONSTRAINT queries_pkey;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_pkey;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_pkey;
ALTER TABLE ONLY public.notification_mail_list DROP CONSTRAINT notification_mail_list_pkey;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_pkey;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_pkey;
ALTER TABLE ONLY public.metadata_descriptions DROP CONSTRAINT metadata_descriptions_pkey;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_pkey;
ALTER TABLE ONLY public.journals DROP CONSTRAINT journals_pkey;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_pkey;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_pkey;
ALTER TABLE ONLY public.event_log DROP CONSTRAINT event_log_pkey;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_pkey;
ALTER TABLE ONLY public.email_templates_default DROP CONSTRAINT email_templates_default_pkey;
ALTER TABLE ONLY public.email_log DROP CONSTRAINT email_log_pkey;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_pkey;
ALTER TABLE ONLY public.data_object_tombstones DROP CONSTRAINT data_object_tombstones_pkey;
ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects DROP CONSTRAINT data_object_tombstone_oai_set_objects_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocabs_pkey;
ALTER TABLE ONLY public.controlled_vocab_entries DROP CONSTRAINT controlled_vocab_entries_pkey;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_pkey;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
ALTER TABLE ONLY public.auth_sources DROP CONSTRAINT auth_sources_pkey;
ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_pkey;
ALTER TABLE ONLY public.announcement_types DROP CONSTRAINT announcement_types_pkey;
ALTER TABLE ONLY public.access_keys DROP CONSTRAINT access_keys_pkey;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.user_groups ALTER COLUMN user_group_id DROP DEFAULT;
ALTER TABLE public.temporary_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.submissions ALTER COLUMN submission_id DROP DEFAULT;
ALTER TABLE public.submission_tombstones ALTER COLUMN tombstone_id DROP DEFAULT;
ALTER TABLE public.submission_search_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.submission_search_keyword_list ALTER COLUMN keyword_id DROP DEFAULT;
ALTER TABLE public.submission_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.submission_comments ALTER COLUMN comment_id DROP DEFAULT;
ALTER TABLE public.stage_assignments ALTER COLUMN stage_assignment_id DROP DEFAULT;
ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
ALTER TABLE public.review_rounds ALTER COLUMN review_round_id DROP DEFAULT;
ALTER TABLE public.review_assignments ALTER COLUMN review_id DROP DEFAULT;
ALTER TABLE public.queries ALTER COLUMN query_id DROP DEFAULT;
ALTER TABLE public.publications ALTER COLUMN publication_id DROP DEFAULT;
ALTER TABLE public.publication_galleys ALTER COLUMN galley_id DROP DEFAULT;
ALTER TABLE public.notifications ALTER COLUMN notification_id DROP DEFAULT;
ALTER TABLE public.notification_subscription_settings ALTER COLUMN setting_id DROP DEFAULT;
ALTER TABLE public.notification_mail_list ALTER COLUMN notification_mail_list_id DROP DEFAULT;
ALTER TABLE public.notes ALTER COLUMN note_id DROP DEFAULT;
ALTER TABLE public.navigation_menus ALTER COLUMN navigation_menu_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_items ALTER COLUMN navigation_menu_item_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id DROP DEFAULT;
ALTER TABLE public.metadata_descriptions ALTER COLUMN metadata_description_id DROP DEFAULT;
ALTER TABLE public.library_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.journals ALTER COLUMN journal_id DROP DEFAULT;
ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
ALTER TABLE public.filters ALTER COLUMN filter_id DROP DEFAULT;
ALTER TABLE public.filter_groups ALTER COLUMN filter_group_id DROP DEFAULT;
ALTER TABLE public.event_log ALTER COLUMN log_id DROP DEFAULT;
ALTER TABLE public.email_templates_default ALTER COLUMN email_id DROP DEFAULT;
ALTER TABLE public.email_templates ALTER COLUMN email_id DROP DEFAULT;
ALTER TABLE public.email_log ALTER COLUMN log_id DROP DEFAULT;
ALTER TABLE public.edit_decisions ALTER COLUMN edit_decision_id DROP DEFAULT;
ALTER TABLE public.data_object_tombstones ALTER COLUMN tombstone_id DROP DEFAULT;
ALTER TABLE public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.controlled_vocabs ALTER COLUMN controlled_vocab_id DROP DEFAULT;
ALTER TABLE public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id DROP DEFAULT;
ALTER TABLE public.citations ALTER COLUMN citation_id DROP DEFAULT;
ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
ALTER TABLE public.authors ALTER COLUMN author_id DROP DEFAULT;
ALTER TABLE public.auth_sources ALTER COLUMN auth_id DROP DEFAULT;
ALTER TABLE public.announcements ALTER COLUMN announcement_id DROP DEFAULT;
ALTER TABLE public.announcement_types ALTER COLUMN type_id DROP DEFAULT;
ALTER TABLE public.access_keys ALTER COLUMN access_key_id DROP DEFAULT;
DROP TABLE public.versions;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
DROP TABLE public.user_user_groups;
DROP TABLE public.user_settings;
DROP TABLE public.user_interests;
DROP SEQUENCE public.user_groups_user_group_id_seq;
DROP TABLE public.user_groups;
DROP TABLE public.user_group_stage;
DROP TABLE public.user_group_settings;
DROP TABLE public.usage_stats_temporary_records;
DROP SEQUENCE public.temporary_files_file_id_seq;
DROP TABLE public.temporary_files;
DROP SEQUENCE public.submissions_submission_id_seq;
DROP TABLE public.submissions;
DROP SEQUENCE public.submission_tombstones_tombstone_id_seq;
DROP TABLE public.submission_tombstones;
DROP TABLE public.submission_supplementary_files;
DROP TABLE public.submission_settings;
DROP SEQUENCE public.submission_search_objects_object_id_seq;
DROP TABLE public.submission_search_objects;
DROP TABLE public.submission_search_object_keywords;
DROP SEQUENCE public.submission_search_keyword_list_keyword_id_seq;
DROP TABLE public.submission_search_keyword_list;
DROP SEQUENCE public.submission_files_file_id_seq;
DROP TABLE public.submission_files;
DROP TABLE public.submission_file_settings;
DROP SEQUENCE public.submission_comments_comment_id_seq;
DROP TABLE public.submission_comments;
DROP TABLE public.submission_artwork_files;
DROP TABLE public.subeditor_submission_group;
DROP SEQUENCE public.stage_assignments_stage_assignment_id_seq;
DROP TABLE public.stage_assignments;
DROP TABLE public.site_settings;
DROP TABLE public.site;
DROP TABLE public.sessions;
DROP SEQUENCE public.sections_section_id_seq;
DROP TABLE public.sections;
DROP TABLE public.section_settings;
DROP TABLE public.scheduled_tasks;
DROP SEQUENCE public.review_rounds_review_round_id_seq;
DROP TABLE public.review_rounds;
DROP TABLE public.review_round_files;
DROP TABLE public.review_files;
DROP SEQUENCE public.review_assignments_review_id_seq;
DROP TABLE public.review_assignments;
DROP TABLE public.query_participants;
DROP SEQUENCE public.queries_query_id_seq;
DROP TABLE public.queries;
DROP SEQUENCE public.publications_publication_id_seq;
DROP TABLE public.publications;
DROP TABLE public.publication_settings;
DROP SEQUENCE public.publication_galleys_galley_id_seq;
DROP TABLE public.publication_galleys;
DROP TABLE public.publication_galley_settings;
DROP TABLE public.publication_categories;
DROP TABLE public.plugin_settings;
DROP TABLE public.oai_resumption_tokens;
DROP SEQUENCE public.notifications_notification_id_seq;
DROP TABLE public.notifications;
DROP SEQUENCE public.notification_subscription_settings_setting_id_seq;
DROP TABLE public.notification_subscription_settings;
DROP TABLE public.notification_settings;
DROP SEQUENCE public.notification_mail_list_notification_mail_list_id_seq;
DROP TABLE public.notification_mail_list;
DROP SEQUENCE public.notes_note_id_seq;
DROP TABLE public.notes;
DROP SEQUENCE public.navigation_menus_navigation_menu_id_seq;
DROP TABLE public.navigation_menus;
DROP SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq;
DROP TABLE public.navigation_menu_items;
DROP TABLE public.navigation_menu_item_settings;
DROP TABLE public.navigation_menu_item_assignment_settings;
DROP SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq;
DROP TABLE public.navigation_menu_item_assignments;
DROP TABLE public.metrics;
DROP SEQUENCE public.metadata_descriptions_metadata_description_id_seq;
DROP TABLE public.metadata_descriptions;
DROP TABLE public.metadata_description_settings;
DROP SEQUENCE public.library_files_file_id_seq;
DROP TABLE public.library_files;
DROP TABLE public.library_file_settings;
DROP SEQUENCE public.journals_journal_id_seq;
DROP TABLE public.journals;
DROP TABLE public.journal_settings;
DROP TABLE public.item_views;
DROP SEQUENCE public.genres_genre_id_seq;
DROP TABLE public.genres;
DROP TABLE public.genre_settings;
DROP SEQUENCE public.filters_filter_id_seq;
DROP TABLE public.filters;
DROP TABLE public.filter_settings;
DROP SEQUENCE public.filter_groups_filter_group_id_seq;
DROP TABLE public.filter_groups;
DROP TABLE public.event_log_settings;
DROP SEQUENCE public.event_log_log_id_seq;
DROP TABLE public.event_log;
DROP TABLE public.email_templates_settings;
DROP SEQUENCE public.email_templates_email_id_seq;
DROP SEQUENCE public.email_templates_default_email_id_seq;
DROP TABLE public.email_templates_default_data;
DROP TABLE public.email_templates_default;
DROP TABLE public.email_templates;
DROP TABLE public.email_log_users;
DROP SEQUENCE public.email_log_log_id_seq;
DROP TABLE public.email_log;
DROP SEQUENCE public.edit_decisions_edit_decision_id_seq;
DROP TABLE public.edit_decisions;
DROP SEQUENCE public.data_object_tombstones_tombstone_id_seq;
DROP TABLE public.data_object_tombstones;
DROP TABLE public.data_object_tombstone_settings;
DROP SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq;
DROP TABLE public.data_object_tombstone_oai_set_objects;
DROP SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq;
DROP TABLE public.controlled_vocabs;
DROP TABLE public.controlled_vocab_entry_settings;
DROP SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq;
DROP TABLE public.controlled_vocab_entries;
DROP SEQUENCE public.citations_citation_id_seq;
DROP TABLE public.citations;
DROP TABLE public.citation_settings;
DROP TABLE public.category_settings;
DROP SEQUENCE public.categories_category_id_seq;
DROP TABLE public.categories;
DROP SEQUENCE public.authors_author_id_seq;
DROP TABLE public.authors;
DROP TABLE public.author_settings;
DROP SEQUENCE public.auth_sources_auth_id_seq;
DROP TABLE public.auth_sources;
DROP SEQUENCE public.announcements_announcement_id_seq;
DROP TABLE public.announcements;
DROP SEQUENCE public.announcement_types_type_id_seq;
DROP TABLE public.announcement_types;
DROP TABLE public.announcement_type_settings;
DROP TABLE public.announcement_settings;
DROP SEQUENCE public.access_keys_access_key_id_seq;
DROP TABLE public.access_keys;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- Name: access_keys; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.access_keys (
    access_key_id integer NOT NULL,
    context character varying(40) NOT NULL,
    key_hash character varying(40) NOT NULL,
    user_id bigint NOT NULL,
    assoc_id bigint,
    expiry_date timestamp without time zone NOT NULL
);


ALTER TABLE public.access_keys OWNER TO "ops-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.access_keys_access_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_keys_access_key_id_seq OWNER TO "ops-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.access_keys_access_key_id_seq OWNED BY public.access_keys.access_key_id;


--
-- Name: announcement_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcement_settings (
    announcement_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.announcement_settings OWNER TO "ops-ci";

--
-- Name: announcement_type_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcement_type_settings (
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.announcement_type_settings OWNER TO "ops-ci";

--
-- Name: announcement_types; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcement_types (
    type_id integer NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.announcement_types OWNER TO "ops-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.announcement_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_types_type_id_seq OWNER TO "ops-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.announcement_types_type_id_seq OWNED BY public.announcement_types.type_id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcements (
    announcement_id integer NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL,
    type_id bigint,
    date_expire timestamp without time zone,
    date_posted timestamp without time zone NOT NULL
);


ALTER TABLE public.announcements OWNER TO "ops-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.announcements_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcements_announcement_id_seq OWNER TO "ops-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.announcements_announcement_id_seq OWNED BY public.announcements.announcement_id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.auth_sources (
    auth_id integer NOT NULL,
    title character varying(60) NOT NULL,
    plugin character varying(32) NOT NULL,
    auth_default smallint DEFAULT 0 NOT NULL,
    settings text
);


ALTER TABLE public.auth_sources OWNER TO "ops-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.auth_sources_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_auth_id_seq OWNER TO "ops-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.auth_sources_auth_id_seq OWNED BY public.auth_sources.auth_id;


--
-- Name: author_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.author_settings (
    author_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.author_settings OWNER TO "ops-ci";

--
-- Name: authors; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    email character varying(90) NOT NULL,
    include_in_browse smallint DEFAULT 1 NOT NULL,
    publication_id bigint,
    submission_id bigint,
    seq double precision DEFAULT 0 NOT NULL,
    user_group_id bigint
);


ALTER TABLE public.authors OWNER TO "ops-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_author_id_seq OWNER TO "ops-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    context_id bigint NOT NULL,
    parent_id bigint NOT NULL,
    seq bigint,
    path character varying(255) NOT NULL,
    image text
);


ALTER TABLE public.categories OWNER TO "ops-ci";

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO "ops-ci";

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: category_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.category_settings (
    category_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.category_settings OWNER TO "ops-ci";

--
-- Name: citation_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.citation_settings (
    citation_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.citation_settings OWNER TO "ops-ci";

--
-- Name: citations; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.citations (
    citation_id integer NOT NULL,
    publication_id bigint DEFAULT 0 NOT NULL,
    raw_citation text,
    seq bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.citations OWNER TO "ops-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.citations_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citations_citation_id_seq OWNER TO "ops-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.citations_citation_id_seq OWNED BY public.citations.citation_id;


--
-- Name: controlled_vocab_entries; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.controlled_vocab_entries (
    controlled_vocab_entry_id integer NOT NULL,
    controlled_vocab_id bigint NOT NULL,
    seq double precision
);


ALTER TABLE public.controlled_vocab_entries OWNER TO "ops-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "ops-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNED BY public.controlled_vocab_entries.controlled_vocab_entry_id;


--
-- Name: controlled_vocab_entry_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.controlled_vocab_entry_settings (
    controlled_vocab_entry_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.controlled_vocab_entry_settings OWNER TO "ops-ci";

--
-- Name: controlled_vocabs; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.controlled_vocabs (
    controlled_vocab_id integer NOT NULL,
    symbolic character varying(64) NOT NULL,
    assoc_type bigint DEFAULT 0 NOT NULL,
    assoc_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.controlled_vocabs OWNER TO "ops-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlled_vocabs_controlled_vocab_id_seq OWNER TO "ops-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq OWNED BY public.controlled_vocabs.controlled_vocab_id;


--
-- Name: data_object_tombstone_oai_set_objects; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.data_object_tombstone_oai_set_objects (
    object_id integer NOT NULL,
    tombstone_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.data_object_tombstone_oai_set_objects OWNER TO "ops-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "ops-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq OWNED BY public.data_object_tombstone_oai_set_objects.object_id;


--
-- Name: data_object_tombstone_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.data_object_tombstone_settings (
    tombstone_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.data_object_tombstone_settings OWNER TO "ops-ci";

--
-- Name: data_object_tombstones; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.data_object_tombstones (
    tombstone_id integer NOT NULL,
    data_object_id bigint NOT NULL,
    date_deleted timestamp without time zone NOT NULL,
    set_spec character varying(255) NOT NULL,
    set_name character varying(255) NOT NULL,
    oai_identifier character varying(255) NOT NULL
);


ALTER TABLE public.data_object_tombstones OWNER TO "ops-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.data_object_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_object_tombstones_tombstone_id_seq OWNER TO "ops-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNED BY public.data_object_tombstones.tombstone_id;


--
-- Name: edit_decisions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.edit_decisions (
    edit_decision_id integer NOT NULL,
    submission_id bigint NOT NULL,
    review_round_id bigint,
    stage_id bigint,
    round smallint NOT NULL,
    editor_id bigint NOT NULL,
    decision smallint NOT NULL,
    date_decided timestamp without time zone NOT NULL
);


ALTER TABLE public.edit_decisions OWNER TO "ops-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.edit_decisions_edit_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edit_decisions_edit_decision_id_seq OWNER TO "ops-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.edit_decisions_edit_decision_id_seq OWNED BY public.edit_decisions.edit_decision_id;


--
-- Name: email_log; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_log (
    log_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    sender_id bigint NOT NULL,
    date_sent timestamp without time zone NOT NULL,
    event_type bigint,
    from_address character varying(255),
    recipients text,
    cc_recipients text,
    bcc_recipients text,
    subject character varying(255),
    body text
);


ALTER TABLE public.email_log OWNER TO "ops-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.email_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_log_log_id_seq OWNER TO "ops-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.email_log_log_id_seq OWNED BY public.email_log.log_id;


--
-- Name: email_log_users; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_log_users (
    email_log_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.email_log_users OWNER TO "ops-ci";

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates (
    email_id integer NOT NULL,
    email_key character varying(64) NOT NULL,
    context_id bigint DEFAULT 0,
    enabled smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.email_templates OWNER TO "ops-ci";

--
-- Name: email_templates_default; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates_default (
    email_id integer NOT NULL,
    email_key character varying(64) NOT NULL,
    can_disable smallint DEFAULT 1 NOT NULL,
    can_edit smallint DEFAULT 1 NOT NULL,
    from_role_id bigint,
    to_role_id bigint
);


ALTER TABLE public.email_templates_default OWNER TO "ops-ci";

--
-- Name: email_templates_default_data; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates_default_data (
    email_key character varying(64) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying NOT NULL,
    subject character varying(120) NOT NULL,
    body text,
    description text
);


ALTER TABLE public.email_templates_default_data OWNER TO "ops-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.email_templates_default_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_templates_default_email_id_seq OWNER TO "ops-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.email_templates_default_email_id_seq OWNED BY public.email_templates_default.email_id;


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.email_templates_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_templates_email_id_seq OWNER TO "ops-ci";

--
-- Name: email_templates_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.email_templates_email_id_seq OWNED BY public.email_templates.email_id;


--
-- Name: email_templates_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates_settings (
    email_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.email_templates_settings OWNER TO "ops-ci";

--
-- Name: event_log; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.event_log (
    log_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    user_id bigint NOT NULL,
    date_logged timestamp without time zone NOT NULL,
    event_type bigint,
    message text,
    is_translated smallint
);


ALTER TABLE public.event_log OWNER TO "ops-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.event_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_log_log_id_seq OWNER TO "ops-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.event_log_log_id_seq OWNED BY public.event_log.log_id;


--
-- Name: event_log_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.event_log_settings (
    log_id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.event_log_settings OWNER TO "ops-ci";

--
-- Name: filter_groups; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.filter_groups (
    filter_group_id integer NOT NULL,
    symbolic character varying(255),
    display_name character varying(255),
    description character varying(255),
    input_type character varying(255),
    output_type character varying(255)
);


ALTER TABLE public.filter_groups OWNER TO "ops-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.filter_groups_filter_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_groups_filter_group_id_seq OWNER TO "ops-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.filter_groups_filter_group_id_seq OWNED BY public.filter_groups.filter_group_id;


--
-- Name: filter_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.filter_settings (
    filter_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.filter_settings OWNER TO "ops-ci";

--
-- Name: filters; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.filters (
    filter_id integer NOT NULL,
    filter_group_id bigint DEFAULT 0 NOT NULL,
    context_id bigint DEFAULT 0 NOT NULL,
    display_name character varying(255),
    class_name character varying(255),
    is_template smallint DEFAULT 0 NOT NULL,
    parent_filter_id bigint DEFAULT 0 NOT NULL,
    seq bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.filters OWNER TO "ops-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.filters_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filters_filter_id_seq OWNER TO "ops-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.filters_filter_id_seq OWNED BY public.filters.filter_id;


--
-- Name: genre_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.genre_settings (
    genre_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.genre_settings OWNER TO "ops-ci";

--
-- Name: genres; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    context_id bigint NOT NULL,
    seq bigint,
    enabled smallint DEFAULT 1 NOT NULL,
    category bigint DEFAULT 1 NOT NULL,
    dependent smallint DEFAULT 0 NOT NULL,
    supplementary smallint DEFAULT 0,
    entry_key character varying(30)
);


ALTER TABLE public.genres OWNER TO "ops-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_genre_id_seq OWNER TO "ops-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- Name: item_views; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.item_views (
    assoc_type bigint NOT NULL,
    assoc_id character varying(32) NOT NULL,
    user_id bigint,
    date_last_viewed timestamp without time zone
);


ALTER TABLE public.item_views OWNER TO "ops-ci";

--
-- Name: journal_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.journal_settings (
    journal_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.journal_settings OWNER TO "ops-ci";

--
-- Name: journals; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.journals (
    journal_id integer NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.journals OWNER TO "ops-ci";

--
-- Name: journals_journal_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.journals_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_journal_id_seq OWNER TO "ops-ci";

--
-- Name: journals_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.journals_journal_id_seq OWNED BY public.journals.journal_id;


--
-- Name: library_file_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.library_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.library_file_settings OWNER TO "ops-ci";

--
-- Name: library_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.library_files (
    file_id integer NOT NULL,
    context_id bigint NOT NULL,
    file_name character varying(255) NOT NULL,
    original_file_name character varying(255) NOT NULL,
    file_type character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    type smallint NOT NULL,
    date_uploaded timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    submission_id bigint NOT NULL,
    public_access smallint DEFAULT 0
);


ALTER TABLE public.library_files OWNER TO "ops-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.library_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_files_file_id_seq OWNER TO "ops-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.library_files_file_id_seq OWNED BY public.library_files.file_id;


--
-- Name: metadata_description_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metadata_description_settings (
    metadata_description_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.metadata_description_settings OWNER TO "ops-ci";

--
-- Name: metadata_descriptions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metadata_descriptions (
    metadata_description_id integer NOT NULL,
    assoc_type bigint DEFAULT 0 NOT NULL,
    assoc_id bigint DEFAULT 0 NOT NULL,
    schema_namespace character varying(255) NOT NULL,
    schema_name character varying(255) NOT NULL,
    display_name character varying(255),
    seq bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.metadata_descriptions OWNER TO "ops-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metadata_descriptions_metadata_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metadata_descriptions_metadata_description_id_seq OWNER TO "ops-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metadata_descriptions_metadata_description_id_seq OWNED BY public.metadata_descriptions.metadata_description_id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    pkp_section_id bigint,
    assoc_object_type bigint,
    assoc_object_id bigint,
    submission_id bigint,
    representation_id bigint,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    day character varying(8),
    month character varying(6),
    file_type smallint,
    country_id character varying(2),
    region character varying(2),
    city character varying(255),
    metric_type character varying(255) NOT NULL,
    metric integer NOT NULL
);


ALTER TABLE public.metrics OWNER TO "ops-ci";

--
-- Name: navigation_menu_item_assignments; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menu_item_assignments (
    navigation_menu_item_assignment_id integer NOT NULL,
    navigation_menu_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    parent_id bigint,
    seq bigint DEFAULT 0
);


ALTER TABLE public.navigation_menu_item_assignments OWNER TO "ops-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "ops-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNED BY public.navigation_menu_item_assignments.navigation_menu_item_assignment_id;


--
-- Name: navigation_menu_item_assignment_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menu_item_assignment_settings (
    navigation_menu_item_assignment_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_assignment_settings OWNER TO "ops-ci";

--
-- Name: navigation_menu_item_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menu_item_settings (
    navigation_menu_item_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_settings OWNER TO "ops-ci";

--
-- Name: navigation_menu_items; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menu_items (
    navigation_menu_item_id integer NOT NULL,
    context_id bigint NOT NULL,
    url character varying(255) DEFAULT ''::character varying,
    path character varying(255) DEFAULT ''::character varying,
    type character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.navigation_menu_items OWNER TO "ops-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menu_items_navigation_menu_item_id_seq OWNER TO "ops-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq OWNED BY public.navigation_menu_items.navigation_menu_item_id;


--
-- Name: navigation_menus; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menus (
    navigation_menu_id integer NOT NULL,
    context_id bigint NOT NULL,
    area_name character varying(255) DEFAULT ''::character varying,
    title character varying(255) NOT NULL
);


ALTER TABLE public.navigation_menus OWNER TO "ops-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.navigation_menus_navigation_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menus_navigation_menu_id_seq OWNER TO "ops-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.navigation_menus_navigation_menu_id_seq OWNED BY public.navigation_menus.navigation_menu_id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notes (
    note_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    user_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone,
    title character varying(255),
    contents text
);


ALTER TABLE public.notes OWNER TO "ops-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.notes_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_note_id_seq OWNER TO "ops-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;


--
-- Name: notification_mail_list; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notification_mail_list (
    notification_mail_list_id integer NOT NULL,
    email character varying(90) NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL,
    token character varying(40) NOT NULL,
    context bigint NOT NULL
);


ALTER TABLE public.notification_mail_list OWNER TO "ops-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.notification_mail_list_notification_mail_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_mail_list_notification_mail_list_id_seq OWNER TO "ops-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.notification_mail_list_notification_mail_list_id_seq OWNED BY public.notification_mail_list.notification_mail_list_id;


--
-- Name: notification_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notification_settings (
    notification_id bigint NOT NULL,
    locale character varying(14),
    setting_name character varying(64) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_settings OWNER TO "ops-ci";

--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notification_subscription_settings (
    setting_id integer NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text,
    user_id bigint NOT NULL,
    context bigint NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_subscription_settings OWNER TO "ops-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.notification_subscription_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_subscription_settings_setting_id_seq OWNER TO "ops-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.notification_subscription_settings_setting_id_seq OWNED BY public.notification_subscription_settings.setting_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    context_id bigint NOT NULL,
    user_id bigint,
    level bigint NOT NULL,
    type bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_read timestamp without time zone,
    assoc_type bigint,
    assoc_id bigint
);


ALTER TABLE public.notifications OWNER TO "ops-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notification_id_seq OWNER TO "ops-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- Name: oai_resumption_tokens; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.oai_resumption_tokens (
    token character varying(32) NOT NULL,
    expire bigint NOT NULL,
    record_offset integer NOT NULL,
    params text
);


ALTER TABLE public.oai_resumption_tokens OWNER TO "ops-ci";

--
-- Name: plugin_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.plugin_settings (
    plugin_name character varying(80) NOT NULL,
    context_id bigint NOT NULL,
    setting_name character varying(80) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.plugin_settings OWNER TO "ops-ci";

--
-- Name: publication_categories; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publication_categories (
    publication_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.publication_categories OWNER TO "ops-ci";

--
-- Name: publication_galley_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publication_galley_settings (
    galley_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_galley_settings OWNER TO "ops-ci";

--
-- Name: publication_galleys; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publication_galleys (
    galley_id integer NOT NULL,
    locale character varying(14),
    publication_id bigint NOT NULL,
    label character varying(255),
    file_id bigint,
    seq double precision DEFAULT 0 NOT NULL,
    remote_url character varying(2047),
    is_approved smallint DEFAULT 0 NOT NULL,
    url_path character varying(64)
);


ALTER TABLE public.publication_galleys OWNER TO "ops-ci";

--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.publication_galleys_galley_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_galleys_galley_id_seq OWNER TO "ops-ci";

--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.publication_galleys_galley_id_seq OWNED BY public.publication_galleys.galley_id;


--
-- Name: publication_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publication_settings (
    publication_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_settings OWNER TO "ops-ci";

--
-- Name: publications; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publications (
    publication_id integer NOT NULL,
    access_status bigint DEFAULT 0,
    date_published date,
    last_modified timestamp without time zone,
    locale character varying(14),
    primary_contact_id bigint,
    section_id bigint,
    submission_id bigint NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    url_path character varying(64),
    version bigint
);


ALTER TABLE public.publications OWNER TO "ops-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.publications_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_publication_id_seq OWNER TO "ops-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.publications_publication_id_seq OWNED BY public.publications.publication_id;


--
-- Name: queries; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.queries (
    query_id integer NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    stage_id smallint DEFAULT 1 NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    date_posted timestamp without time zone,
    date_modified timestamp without time zone,
    closed smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.queries OWNER TO "ops-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.queries_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_query_id_seq OWNER TO "ops-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.queries_query_id_seq OWNED BY public.queries.query_id;


--
-- Name: query_participants; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.query_participants (
    query_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.query_participants OWNER TO "ops-ci";

--
-- Name: review_assignments; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_assignments (
    review_id integer NOT NULL,
    submission_id bigint NOT NULL,
    reviewer_id bigint NOT NULL,
    competing_interests text,
    recommendation smallint,
    date_assigned timestamp without time zone,
    date_notified timestamp without time zone,
    date_confirmed timestamp without time zone,
    date_completed timestamp without time zone,
    date_acknowledged timestamp without time zone,
    date_due timestamp without time zone,
    date_response_due timestamp without time zone,
    last_modified timestamp without time zone,
    reminder_was_automatic smallint DEFAULT 0 NOT NULL,
    declined smallint DEFAULT 0 NOT NULL,
    cancelled smallint DEFAULT 0 NOT NULL,
    reviewer_file_id bigint,
    date_rated timestamp without time zone,
    date_reminded timestamp without time zone,
    quality smallint,
    review_round_id bigint,
    stage_id smallint DEFAULT 1 NOT NULL,
    review_method smallint DEFAULT 1 NOT NULL,
    round smallint DEFAULT 1 NOT NULL,
    step smallint DEFAULT 1 NOT NULL,
    review_form_id bigint,
    unconsidered smallint
);


ALTER TABLE public.review_assignments OWNER TO "ops-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_assignments_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_assignments_review_id_seq OWNER TO "ops-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_assignments_review_id_seq OWNED BY public.review_assignments.review_id;


--
-- Name: review_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_files (
    review_id bigint NOT NULL,
    file_id bigint NOT NULL
);


ALTER TABLE public.review_files OWNER TO "ops-ci";

--
-- Name: review_round_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_round_files (
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    file_id bigint NOT NULL,
    revision bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.review_round_files OWNER TO "ops-ci";

--
-- Name: review_rounds; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_rounds (
    review_round_id integer NOT NULL,
    submission_id bigint NOT NULL,
    stage_id bigint,
    round smallint NOT NULL,
    review_revision bigint,
    status bigint
);


ALTER TABLE public.review_rounds OWNER TO "ops-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_rounds_review_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_rounds_review_round_id_seq OWNER TO "ops-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_rounds_review_round_id_seq OWNED BY public.review_rounds.review_round_id;


--
-- Name: scheduled_tasks; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.scheduled_tasks (
    class_name character varying(255) NOT NULL,
    last_run timestamp without time zone
);


ALTER TABLE public.scheduled_tasks OWNER TO "ops-ci";

--
-- Name: section_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.section_settings (
    section_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.section_settings OWNER TO "ops-ci";

--
-- Name: sections; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.sections (
    section_id integer NOT NULL,
    journal_id bigint NOT NULL,
    review_form_id bigint,
    seq double precision DEFAULT 0 NOT NULL,
    editor_restricted smallint DEFAULT 0 NOT NULL,
    meta_indexed smallint DEFAULT 0 NOT NULL,
    meta_reviewed smallint DEFAULT 1 NOT NULL,
    abstracts_not_required smallint DEFAULT 0 NOT NULL,
    hide_title smallint DEFAULT 0 NOT NULL,
    hide_author smallint DEFAULT 0 NOT NULL,
    abstract_word_count bigint
);


ALTER TABLE public.sections OWNER TO "ops-ci";

--
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.sections_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_section_id_seq OWNER TO "ops-ci";

--
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.sessions (
    session_id character varying(128) NOT NULL,
    user_id bigint,
    ip_address character varying(39) NOT NULL,
    user_agent character varying(255),
    created bigint DEFAULT 0 NOT NULL,
    last_used bigint DEFAULT 0 NOT NULL,
    remember smallint DEFAULT 0 NOT NULL,
    data text,
    domain character varying(255)
);


ALTER TABLE public.sessions OWNER TO "ops-ci";

--
-- Name: site; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.site (
    redirect bigint DEFAULT 0 NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT 6 NOT NULL,
    installed_locales character varying(1024) DEFAULT 'en_US'::character varying NOT NULL,
    supported_locales character varying(1024),
    original_style_file_name character varying(255)
);


ALTER TABLE public.site OWNER TO "ops-ci";

--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.site_settings (
    setting_name character varying(255) NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_value text
);


ALTER TABLE public.site_settings OWNER TO "ops-ci";

--
-- Name: stage_assignments; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.stage_assignments (
    stage_assignment_id integer NOT NULL,
    submission_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_assigned timestamp without time zone NOT NULL,
    recommend_only smallint DEFAULT 0 NOT NULL,
    can_change_metadata smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.stage_assignments OWNER TO "ops-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.stage_assignments_stage_assignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stage_assignments_stage_assignment_id_seq OWNER TO "ops-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.stage_assignments_stage_assignment_id_seq OWNED BY public.stage_assignments.stage_assignment_id;


--
-- Name: subeditor_submission_group; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.subeditor_submission_group (
    context_id bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint NOT NULL,
    assoc_type bigint NOT NULL
);


ALTER TABLE public.subeditor_submission_group OWNER TO "ops-ci";

--
-- Name: submission_artwork_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_artwork_files (
    file_id bigint NOT NULL,
    revision bigint NOT NULL,
    caption text,
    credit character varying(255),
    copyright_owner character varying(255),
    copyright_owner_contact text,
    permission_terms text,
    permission_file_id bigint,
    chapter_id bigint,
    contact_author bigint
);


ALTER TABLE public.submission_artwork_files OWNER TO "ops-ci";

--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_comments (
    comment_id integer NOT NULL,
    comment_type bigint,
    role_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    assoc_id bigint NOT NULL,
    author_id bigint NOT NULL,
    comment_title text,
    comments text,
    date_posted timestamp without time zone,
    date_modified timestamp without time zone,
    viewable smallint
);


ALTER TABLE public.submission_comments OWNER TO "ops-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_comments_comment_id_seq OWNER TO "ops-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_comments_comment_id_seq OWNED BY public.submission_comments.comment_id;


--
-- Name: submission_file_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.submission_file_settings OWNER TO "ops-ci";

--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_files (
    file_id integer NOT NULL,
    revision bigint NOT NULL,
    source_file_id bigint,
    source_revision bigint,
    submission_id bigint NOT NULL,
    file_type character varying(255) NOT NULL,
    genre_id bigint,
    file_size bigint NOT NULL,
    original_file_name character varying(127),
    file_stage bigint NOT NULL,
    direct_sales_price character varying(255),
    sales_type character varying(255),
    viewable smallint,
    date_uploaded timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    uploader_user_id bigint,
    assoc_type bigint,
    assoc_id bigint
);


ALTER TABLE public.submission_files OWNER TO "ops-ci";

--
-- Name: submission_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_files_file_id_seq OWNER TO "ops-ci";

--
-- Name: submission_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_files_file_id_seq OWNED BY public.submission_files.file_id;


--
-- Name: submission_search_keyword_list; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_search_keyword_list (
    keyword_id integer NOT NULL,
    keyword_text character varying(60) NOT NULL
);


ALTER TABLE public.submission_search_keyword_list OWNER TO "ops-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_search_keyword_list_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_search_keyword_list_keyword_id_seq OWNER TO "ops-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_search_keyword_list_keyword_id_seq OWNED BY public.submission_search_keyword_list.keyword_id;


--
-- Name: submission_search_object_keywords; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_search_object_keywords (
    object_id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    pos integer NOT NULL
);


ALTER TABLE public.submission_search_object_keywords OWNER TO "ops-ci";

--
-- Name: submission_search_objects; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_search_objects (
    object_id integer NOT NULL,
    submission_id bigint NOT NULL,
    type integer NOT NULL,
    assoc_id bigint
);


ALTER TABLE public.submission_search_objects OWNER TO "ops-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_search_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_search_objects_object_id_seq OWNER TO "ops-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_search_objects_object_id_seq OWNED BY public.submission_search_objects.object_id;


--
-- Name: submission_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_settings (
    submission_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.submission_settings OWNER TO "ops-ci";

--
-- Name: submission_supplementary_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_supplementary_files (
    file_id bigint NOT NULL,
    revision bigint NOT NULL
);


ALTER TABLE public.submission_supplementary_files OWNER TO "ops-ci";

--
-- Name: submission_tombstones; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_tombstones (
    tombstone_id integer NOT NULL,
    submission_id bigint NOT NULL,
    date_deleted timestamp without time zone NOT NULL,
    journal_id bigint NOT NULL,
    section_id bigint NOT NULL,
    set_spec character varying(255) NOT NULL,
    set_name character varying(255) NOT NULL,
    oai_identifier character varying(255) NOT NULL
);


ALTER TABLE public.submission_tombstones OWNER TO "ops-ci";

--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_tombstones_tombstone_id_seq OWNER TO "ops-ci";

--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_tombstones_tombstone_id_seq OWNED BY public.submission_tombstones.tombstone_id;


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submissions (
    submission_id integer NOT NULL,
    locale character varying(14),
    context_id bigint NOT NULL,
    section_id bigint,
    current_publication_id bigint,
    date_last_activity timestamp without time zone,
    date_submitted timestamp without time zone,
    last_modified timestamp without time zone,
    stage_id bigint DEFAULT 1 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    submission_progress smallint DEFAULT 1 NOT NULL,
    work_type smallint DEFAULT 0
);


ALTER TABLE public.submissions OWNER TO "ops-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submissions_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submissions_submission_id_seq OWNER TO "ops-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submissions_submission_id_seq OWNED BY public.submissions.submission_id;


--
-- Name: temporary_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.temporary_files (
    file_id integer NOT NULL,
    user_id bigint NOT NULL,
    file_name character varying(90) NOT NULL,
    file_type character varying(255),
    file_size bigint NOT NULL,
    original_file_name character varying(127),
    date_uploaded timestamp without time zone NOT NULL
);


ALTER TABLE public.temporary_files OWNER TO "ops-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.temporary_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temporary_files_file_id_seq OWNER TO "ops-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.temporary_files_file_id_seq OWNED BY public.temporary_files.file_id;


--
-- Name: usage_stats_temporary_records; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.usage_stats_temporary_records (
    assoc_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    day bigint NOT NULL,
    entry_time bigint NOT NULL,
    metric bigint DEFAULT 1 NOT NULL,
    country_id character varying(2),
    region character varying(2),
    city character varying(255),
    load_id character varying(255) NOT NULL,
    file_type smallint
);


ALTER TABLE public.usage_stats_temporary_records OWNER TO "ops-ci";

--
-- Name: user_group_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_group_settings (
    user_group_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.user_group_settings OWNER TO "ops-ci";

--
-- Name: user_group_stage; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_group_stage (
    context_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    stage_id bigint NOT NULL
);


ALTER TABLE public.user_group_stage OWNER TO "ops-ci";

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_groups (
    user_group_id integer NOT NULL,
    context_id bigint NOT NULL,
    role_id bigint NOT NULL,
    is_default smallint DEFAULT 0 NOT NULL,
    show_title smallint DEFAULT 1 NOT NULL,
    permit_self_registration smallint DEFAULT 0 NOT NULL,
    permit_metadata_edit smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_groups OWNER TO "ops-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.user_groups_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_user_group_id_seq OWNER TO "ops-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.user_groups_user_group_id_seq OWNED BY public.user_groups.user_group_id;


--
-- Name: user_interests; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_interests (
    user_id bigint NOT NULL,
    controlled_vocab_entry_id bigint NOT NULL
);


ALTER TABLE public.user_interests OWNER TO "ops-ci";

--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_settings (
    user_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    assoc_type bigint DEFAULT 0,
    assoc_id bigint DEFAULT 0,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.user_settings OWNER TO "ops-ci";

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_user_groups (
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO "ops-ci";

--
-- Name: users; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    url character varying(2047),
    phone character varying(32),
    mailing_address character varying(255),
    billing_address character varying(255),
    country character varying(90),
    locales character varying(255),
    gossip text,
    date_last_email timestamp without time zone,
    date_registered timestamp without time zone NOT NULL,
    date_validated timestamp without time zone,
    date_last_login timestamp without time zone NOT NULL,
    must_change_password smallint,
    auth_id bigint,
    auth_str character varying(255),
    disabled smallint DEFAULT 0 NOT NULL,
    disabled_reason text,
    inline_help smallint
);


ALTER TABLE public.users OWNER TO "ops-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO "ops-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.versions (
    major integer DEFAULT 0 NOT NULL,
    minor integer DEFAULT 0 NOT NULL,
    revision integer DEFAULT 0 NOT NULL,
    build integer DEFAULT 0 NOT NULL,
    date_installed timestamp without time zone NOT NULL,
    current smallint DEFAULT 0 NOT NULL,
    product_type character varying(30),
    product character varying(30),
    product_class_name character varying(80),
    lazy_load smallint DEFAULT 0 NOT NULL,
    sitewide smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.versions OWNER TO "ops-ci";

--
-- Name: access_key_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('public.access_keys_access_key_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types ALTER COLUMN type_id SET DEFAULT nextval('public.announcement_types_type_id_seq'::regclass);


--
-- Name: announcement_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcements_announcement_id_seq'::regclass);


--
-- Name: auth_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN auth_id SET DEFAULT nextval('public.auth_sources_auth_id_seq'::regclass);


--
-- Name: author_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: citation_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations ALTER COLUMN citation_id SET DEFAULT nextval('public.citations_citation_id_seq'::regclass);


--
-- Name: controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('public.controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('public.data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: edit_decision_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('public.edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log ALTER COLUMN log_id SET DEFAULT nextval('public.email_log_log_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_email_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_default_email_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log ALTER COLUMN log_id SET DEFAULT nextval('public.event_log_log_id_seq'::regclass);


--
-- Name: filter_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('public.filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filter_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters ALTER COLUMN filter_id SET DEFAULT nextval('public.filters_filter_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: journal_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals ALTER COLUMN journal_id SET DEFAULT nextval('public.journals_journal_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files ALTER COLUMN file_id SET DEFAULT nextval('public.library_files_file_id_seq'::regclass);


--
-- Name: metadata_description_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metadata_descriptions ALTER COLUMN metadata_description_id SET DEFAULT nextval('public.metadata_descriptions_metadata_description_id_seq'::regclass);


--
-- Name: navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_item_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_items ALTER COLUMN navigation_menu_item_id SET DEFAULT nextval('public.navigation_menu_items_navigation_menu_item_id_seq'::regclass);


--
-- Name: navigation_menu_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menus ALTER COLUMN navigation_menu_id SET DEFAULT nextval('public.navigation_menus_navigation_menu_id_seq'::regclass);


--
-- Name: note_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Name: notification_mail_list_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list ALTER COLUMN notification_mail_list_id SET DEFAULT nextval('public.notification_mail_list_notification_mail_list_id_seq'::regclass);


--
-- Name: setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notification_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: galley_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys ALTER COLUMN galley_id SET DEFAULT nextval('public.publication_galleys_galley_id_seq'::regclass);


--
-- Name: publication_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);


--
-- Name: query_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.queries ALTER COLUMN query_id SET DEFAULT nextval('public.queries_query_id_seq'::regclass);


--
-- Name: review_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments ALTER COLUMN review_id SET DEFAULT nextval('public.review_assignments_review_id_seq'::regclass);


--
-- Name: review_round_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('public.review_rounds_review_round_id_seq'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- Name: stage_assignment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('public.stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.submission_comments_comment_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN file_id SET DEFAULT nextval('public.submission_files_file_id_seq'::regclass);


--
-- Name: keyword_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('public.submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('public.submission_search_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.submission_tombstones_tombstone_id_seq'::regclass);


--
-- Name: submission_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions ALTER COLUMN submission_id SET DEFAULT nextval('public.submissions_submission_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.temporary_files ALTER COLUMN file_id SET DEFAULT nextval('public.temporary_files_file_id_seq'::regclass);


--
-- Name: user_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('public.user_groups_user_group_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.access_keys_access_key_id_seq', 1, false);


--
-- Data for Name: announcement_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcement_settings (announcement_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_type_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcement_type_settings (type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_types; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcement_types (type_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcement_types_type_id_seq', 1, false);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcements_announcement_id_seq', 1, false);


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.auth_sources (auth_id, title, plugin, auth_default, settings) FROM stdin;
\.


--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.auth_sources_auth_id_seq', 1, false);


--
-- Data for Name: author_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.author_settings (author_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	affiliation	University of Bologna	\N
1		country	IT	\N
1	en_US	familyName	Corino	\N
1	en_US	givenName	Carlo	\N
2	en_US	affiliation	University of Windsor	\N
2		country	CA	\N
2	en_US	familyName	Kwantes	\N
2	en_US	givenName	Catherine	\N
3	en_US	affiliation	University of Alberta	\N
3		country	CA	\N
3	en_US	familyName	Montgomerie	\N
3	en_US	givenName	Craig	\N
4	en_US	affiliation	University of Victoria	\N
4	fr_CA	affiliation		\N
4	en_US	biography		\N
4	fr_CA	biography		\N
4		country	CA	\N
4	en_US	familyName	Irvine	\N
4	fr_CA	familyName		\N
4	en_US	givenName	Mark	\N
4	fr_CA	givenName		\N
4		orcid		\N
4	en_US	preferredPublicName		\N
4	fr_CA	preferredPublicName		\N
4		url		\N
5	en_US	affiliation	Alexandria University	\N
5		country	EG	\N
5	en_US	familyName	Diouf	\N
5	en_US	givenName	Diaga	\N
6	en_US	affiliation	University of Toronto	\N
6		country	CA	\N
6	en_US	familyName	Phillips	\N
6	en_US	givenName	Dana	\N
7	en_US	affiliation	University College Cork	\N
7		country	IE	\N
7	en_US	familyName	Sokoloff	\N
7	en_US	givenName	Domatilia	\N
8	en_US	affiliation	Indiana University	\N
8		country	US	\N
8	en_US	familyName	Ostrom	\N
8	en_US	givenName	Elinor	\N
9	en_US	affiliation	Indiana University	\N
9	fr_CA	affiliation		\N
9	en_US	biography		\N
9	fr_CA	biography		\N
9		country	US	\N
9	en_US	familyName	van Laerhoven	\N
9	fr_CA	familyName		\N
9	en_US	givenName	Frank	\N
9	fr_CA	givenName		\N
9		orcid		\N
9	en_US	preferredPublicName		\N
9	fr_CA	preferredPublicName		\N
9		url		\N
10	en_US	affiliation	University of Rome	\N
10		country	IT	\N
10	en_US	familyName	Paglieri	\N
10	en_US	givenName	Fabio	\N
11	en_US	affiliation	University of Cape Town	\N
11		country	ZA	\N
11	en_US	familyName	Mwandenga	\N
11	en_US	givenName	John	\N
12	en_US	affiliation	Aalborg University	\N
12		country	DK	\N
12	en_US	familyName	Novak	\N
12	en_US	givenName	John	\N
13	en_US	affiliation	Stanford University	\N
13		country	US	\N
13	en_US	familyName	Al-Khafaji	\N
13	en_US	givenName	Karim	\N
14	en_US	affiliation	Stanford University	\N
14	fr_CA	affiliation		\N
14	en_US	biography		\N
14	fr_CA	biography		\N
14		country	US	\N
14	en_US	familyName	Morse	\N
14	fr_CA	familyName		\N
14	en_US	givenName	Margaret	\N
14	fr_CA	givenName		\N
14		orcid		\N
14	en_US	preferredPublicName		\N
14	fr_CA	preferredPublicName		\N
14		url		\N
15	en_US	affiliation	Australian National University	\N
15		country	AU	\N
15	en_US	familyName	Christopher	\N
15	en_US	givenName	Leo	\N
16	en_US	affiliation	University of Cape Town	\N
16		country	ZA	\N
16	en_US	familyName	Kumiega	\N
16	en_US	givenName	Lise	\N
17	en_US	affiliation	University of Wolverhampton	\N
17		country	GB	\N
17	en_US	familyName	Daniel	\N
17	en_US	givenName	Patricia	\N
18	en_US	affiliation	University of Nairobi	\N
18		country	KE	\N
18	en_US	familyName	Baiyewu	\N
18	en_US	givenName	Rana	\N
19	en_US	affiliation	Barcelona University	\N
19		country	ES	\N
19	en_US	familyName	Rossi	\N
19	en_US	givenName	Rosanna	\N
20	en_US	affiliation	University of Tehran	\N
20		country	IR	\N
20	en_US	familyName	Karbasizaed	\N
20	en_US	givenName	Vajiheh	\N
21	en_US	affiliation	University of Windsor	\N
21		country	CA	\N
21	en_US	familyName	Williamson	\N
21	en_US	givenName	Valerie	\N
22	en_US	affiliation	CUNY	\N
22		country	US	\N
22	en_US	familyName	Woods	\N
22	en_US	givenName	Zita	\N
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, submission_id, seq, user_group_id) FROM stdin;
1	ccorino@mailinator.com	1	1	\N	0	4
2	ckwantes@mailinator.com	1	2	\N	0	4
3	cmontgomerie@mailinator.com	1	3	\N	0	4
4	mirvine@mailinator.com	1	3	\N	1	4
5	ddiouf@mailinator.com	1	4	\N	0	4
6	dphillips@mailinator.com	1	5	\N	0	4
7	dsokoloff@mailinator.com	1	6	\N	0	4
8	eostrom@mailinator.com	1	7	\N	0	4
9	fvanlaerhoven@mailinator.com	1	7	\N	1	4
10	fpaglieri@mailinator.com	1	8	\N	0	4
11	jmwandenga@mailinator.com	1	9	\N	0	4
12	jnovak@mailinator.com	1	10	\N	0	4
13	kalkhafaji@mailinator.com	1	11	\N	0	4
14	mmorse@mailinator.com	1	11	\N	1	4
15	lchristopher@mailinator.com	1	12	\N	0	4
16	lkumiega@mailinator.com	1	13	\N	0	4
17	pdaniel@mailinator.com	1	14	\N	0	4
18	rbaiyewu@mailinator.com	1	15	\N	0	4
19	rrossi@mailinator.com	1	16	\N	0	4
20	vkarbasizaed@mailinator.com	1	17	\N	0	4
21	vwilliamson@mailinator.com	1	18	\N	0	4
22	zwoods@mailinator.com	1	19	\N	0	4
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 22, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.categories (category_id, context_id, parent_id, seq, path, image) FROM stdin;
1	1	0	0	history	a:0:{}
2	1	0	0	biology	a:0:{}
3	1	0	0	social-sciences	a:0:{}
4	1	0	0	mathematics	a:0:{}
5	1	1	0	cultural-history	a:0:{}
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Data for Name: category_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.category_settings (category_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	History	string
1	fr_CA	title		string
1	en_US	description		string
1	fr_CA	description		string
1		sortOption	title-1	string
2	en_US	title	Biology	string
2	fr_CA	title		string
2	en_US	description		string
2	fr_CA	description		string
2		sortOption	title-1	string
3	en_US	title	Social sciences	string
3	fr_CA	title		string
3	en_US	description		string
3	fr_CA	description		string
3		sortOption	title-1	string
4	en_US	title	Mathematics	string
4	fr_CA	title		string
4	en_US	description		string
4	fr_CA	description		string
4		sortOption	title-1	string
5	en_US	title	Cultural History	string
5	fr_CA	title		string
5	en_US	description		string
5	fr_CA	description		string
5		sortOption	title-1	string
\.


--
-- Data for Name: citation_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.citation_settings (citation_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: citations; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.citations (citation_id, publication_id, raw_citation, seq) FROM stdin;
\.


--
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.citations_citation_id_seq', 1, false);


--
-- Data for Name: controlled_vocab_entries; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entries (controlled_vocab_entry_id, controlled_vocab_id, seq) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	2	4
8	2	5
9	2	6
10	2	7
11	3	1
12	3	2
13	3	3
14	4	1
15	4	2
16	4	3
17	4	4
18	4	5
19	4	6
20	4	7
21	4	8
22	4	9
23	4	10
24	4	11
25	4	12
26	5	1
27	5	2
28	7	1
29	7	2
32	12	1
33	12	2
41	17	1
42	17	2
43	17	3
44	17	4
45	17	5
46	17	6
47	17	7
50	32	1
51	32	2
55	37	1
56	37	2
57	37	3
59	52	1
64	57	1
65	57	2
66	57	3
67	57	4
70	62	1
71	62	2
73	67	1
84	72	1
85	72	2
86	72	3
87	72	4
88	72	5
89	72	6
90	72	7
91	72	8
92	72	9
93	72	10
96	82	1
97	82	2
101	92	1
102	92	2
103	92	3
\.


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 103, true);


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		name	personal	string
2		name	corporate	string
3		name	conference	string
4		name	aut	string
4		description	Author	string
5		name	ctb	string
5		description	Contributor	string
6		name	edt	string
6		description	Editor	string
7		name	ill	string
7		description	Illustrator	string
8		name	pht	string
8		description	Photographer	string
9		name	spn	string
9		description	Sponsor	string
10		name	trl	string
10		description	Translator	string
11		name	multimedia	string
12		name	still image	string
13		name	text	string
14		name	article	string
15		name	book	string
16		name	conference publication	string
17		name	issue	string
18		name	journal	string
19		name	newspaper	string
20		name	picture	string
21		name	review	string
22		name	periodical	string
23		name	series	string
24		name	thesis	string
25		name	web site	string
26		name	electronic	string
27		name	print	string
28	en_US	submissionKeyword	pigs	string
29	en_US	submissionKeyword	food security	string
32	en_US	submissionKeyword	employees	string
33	en_US	submissionKeyword	survey	string
41	en_US	submissionKeyword	Integrating Technology	string
42	en_US	submissionKeyword	Computer Skills	string
43	en_US	submissionKeyword	Survey	string
44	en_US	submissionKeyword	Alberta	string
45	en_US	submissionKeyword	National	string
46	en_US	submissionKeyword	Provincial	string
47	en_US	submissionKeyword	Professional Development	string
50	en_US	submissionKeyword	education	string
51	en_US	submissionKeyword	citizenship	string
55	en_US	submissionKeyword	Common pool resource	string
56	en_US	submissionKeyword	common property	string
57	en_US	submissionKeyword	intellectual developments	string
59	en_US	submissionKeyword	water	string
64	en_US	submissionKeyword	Development	string
65	en_US	submissionKeyword	engineering education	string
66	en_US	submissionKeyword	service learning	string
67	en_US	submissionKeyword	sustainability	string
70	en_US	submissionKeyword	pigs	string
71	en_US	submissionKeyword	food security	string
73	en_US	submissionKeyword	water	string
84	en_US	submissionKeyword	21st Century	string
85	en_US	submissionKeyword	Diversity	string
86	en_US	submissionKeyword	Multilingual	string
87	en_US	submissionKeyword	Multiethnic	string
88	en_US	submissionKeyword	Participatory Pedagogy	string
89	en_US	submissionKeyword	Language	string
90	en_US	submissionKeyword	Culture	string
91	en_US	submissionKeyword	Gender	string
92	en_US	submissionKeyword	Egalitarianism	string
93	en_US	submissionKeyword	Social Transformation	string
96	en_US	submissionKeyword	cattle	string
97	en_US	submissionKeyword	food security	string
101	en_US	submissionKeyword	Self-Organization	string
102	en_US	submissionKeyword	Multi-Level Institutions	string
103	en_US	submissionKeyword	Goverance	string
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocabs (controlled_vocab_id, symbolic, assoc_type, assoc_id) FROM stdin;
1	mods34-name-types	0	0
2	mods34-name-role-roleTerms-marcrelator	0	0
3	mods34-typeOfResource	0	0
4	mods34-genre-marcgt	0	0
5	mods34-physicalDescription-form-marcform	0	0
6	interest	0	0
7	submissionKeyword	1048588	1
8	submissionSubject	1048588	1
9	submissionDiscipline	1048588	1
10	submissionLanguage	1048588	1
11	submissionAgency	1048588	1
12	submissionKeyword	1048588	2
13	submissionSubject	1048588	2
14	submissionDiscipline	1048588	2
15	submissionLanguage	1048588	2
16	submissionAgency	1048588	2
17	submissionKeyword	1048588	3
18	submissionSubject	1048588	3
19	submissionDiscipline	1048588	3
20	submissionLanguage	1048588	3
21	submissionAgency	1048588	3
22	submissionKeyword	1048588	4
23	submissionSubject	1048588	4
24	submissionDiscipline	1048588	4
25	submissionLanguage	1048588	4
26	submissionAgency	1048588	4
27	submissionKeyword	1048588	5
28	submissionSubject	1048588	5
29	submissionDiscipline	1048588	5
30	submissionLanguage	1048588	5
31	submissionAgency	1048588	5
32	submissionKeyword	1048588	6
33	submissionSubject	1048588	6
34	submissionDiscipline	1048588	6
35	submissionLanguage	1048588	6
36	submissionAgency	1048588	6
37	submissionKeyword	1048588	7
38	submissionSubject	1048588	7
39	submissionDiscipline	1048588	7
40	submissionLanguage	1048588	7
41	submissionAgency	1048588	7
42	submissionKeyword	1048588	8
43	submissionSubject	1048588	8
44	submissionDiscipline	1048588	8
45	submissionLanguage	1048588	8
46	submissionAgency	1048588	8
47	submissionKeyword	1048588	9
48	submissionSubject	1048588	9
49	submissionDiscipline	1048588	9
50	submissionLanguage	1048588	9
51	submissionAgency	1048588	9
52	submissionKeyword	1048588	10
53	submissionSubject	1048588	10
54	submissionDiscipline	1048588	10
55	submissionLanguage	1048588	10
56	submissionAgency	1048588	10
57	submissionKeyword	1048588	11
58	submissionSubject	1048588	11
59	submissionDiscipline	1048588	11
60	submissionLanguage	1048588	11
61	submissionAgency	1048588	11
62	submissionKeyword	1048588	12
63	submissionSubject	1048588	12
64	submissionDiscipline	1048588	12
65	submissionLanguage	1048588	12
66	submissionAgency	1048588	12
67	submissionKeyword	1048588	13
68	submissionSubject	1048588	13
69	submissionDiscipline	1048588	13
70	submissionLanguage	1048588	13
71	submissionAgency	1048588	13
72	submissionKeyword	1048588	14
73	submissionSubject	1048588	14
74	submissionDiscipline	1048588	14
75	submissionLanguage	1048588	14
76	submissionAgency	1048588	14
77	submissionKeyword	1048588	15
78	submissionSubject	1048588	15
79	submissionDiscipline	1048588	15
80	submissionLanguage	1048588	15
81	submissionAgency	1048588	15
82	submissionKeyword	1048588	16
83	submissionSubject	1048588	16
84	submissionDiscipline	1048588	16
85	submissionLanguage	1048588	16
86	submissionAgency	1048588	16
87	submissionKeyword	1048588	17
88	submissionSubject	1048588	17
89	submissionDiscipline	1048588	17
90	submissionLanguage	1048588	17
91	submissionAgency	1048588	17
92	submissionKeyword	1048588	18
93	submissionSubject	1048588	18
94	submissionDiscipline	1048588	18
95	submissionLanguage	1048588	18
96	submissionAgency	1048588	18
97	submissionKeyword	1048588	19
98	submissionSubject	1048588	19
99	submissionDiscipline	1048588	19
100	submissionLanguage	1048588	19
101	submissionAgency	1048588	19
\.


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 101, true);


--
-- Data for Name: data_object_tombstone_oai_set_objects; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.data_object_tombstone_oai_set_objects (object_id, tombstone_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 1, false);


--
-- Data for Name: data_object_tombstone_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.data_object_tombstone_settings (tombstone_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: data_object_tombstones; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.data_object_tombstones (tombstone_id, data_object_id, date_deleted, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 1, false);


--
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
\.


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 1, false);


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
\.


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 1, false);


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates (email_id, email_key, context_id, enabled) FROM stdin;
\.


--
-- Data for Name: email_templates_default; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_default (email_id, email_key, can_disable, can_edit, from_role_id, to_role_id) FROM stdin;
1	NOTIFICATION	0	1	\N	\N
2	NOTIFICATION_CENTER_DEFAULT	0	1	\N	\N
3	PASSWORD_RESET_CONFIRM	0	1	\N	\N
4	PASSWORD_RESET	0	1	\N	\N
5	USER_REGISTER	0	1	\N	\N
6	USER_VALIDATE	0	1	\N	\N
7	PUBLISH_NOTIFY	0	1	\N	\N
8	SUBMISSION_ACK	1	1	\N	65536
9	SUBMISSION_ACK_NOT_USER	1	1	\N	65536
10	EDITOR_ASSIGN	1	1	16	16
11	EDITOR_DECISION_ACCEPT	0	1	16	65536
12	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536
13	STATISTICS_REPORT_NOTIFICATION	1	1	16	17
14	ANNOUNCEMENT	0	1	16	1048576
15	ORCID_COLLECT_AUTHOR_ID	0	1	\N	\N
16	ORCID_REQUEST_AUTHOR_AUTHORIZATION	0	1	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$contextName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
PASSWORD_RESET	en_US	Password Reset	Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.
USER_REGISTER	en_US	Server Registration	{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server's list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE	en_US	Validate Your Account	{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to validate their email account.
PUBLISH_NOTIFY	en_US	New Preprint Published	Readers:<br />\n<br />\n{$contextName} has just published its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Moderator's User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\\\n/>\n"\n/>\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}"	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.
EDITOR_ASSIGN	en_US	Moderator Assignment	{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.	This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.
EDITOR_DECISION_ACCEPT	en_US	Moderator Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission	This email from the Manager or Moderator to an Author notifies them of a final "accept submission" decision regarding their submission.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Moderator Decision	\n\t\t\t{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission	This email is sent to the author if the moderator declines his submission initially.
STATISTICS_REPORT_NOTIFICATION	en_US	Preprint Server activity for {$month}, {$year}	Preprint Server activity for {$month}, {$year}	Preprint Server activity for {$month}, {$year}
ANNOUNCEMENT	en_US	{$title}	<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href="{$url}">full announcement</a>.	This email is sent when a new announcement is created.
ORCID_COLLECT_AUTHOR_ID	en_US	Submission ORCID	Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href="{$orcidAboutUrl}">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	This email template is used to collect the ORCID id's from authors.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	en_US	Requesting ORCID record access	Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission "{$submissionTitle}" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href="{$orcidAboutUrl}">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n	This email template is used to request ORCID record access from authors.
NOTIFICATION	fr_CA	Nouvel avis de {$siteTitle}	Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d'avis.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé à l'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.
PASSWORD_RESET	fr_CA	Réinitialisation du mot de passe	Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé à l'utilisateur-trice inscrit-e lorsqu'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».
USER_REGISTER	fr_CA	Inscription au serveur	{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu'utilisateur-trice pour {$contextName}. Votre nom d'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l'informer de son nom d'utilisateur-trice et de son mot de passe.
USER_VALIDATE	fr_CA	Valider votre compte	{$userFullName},<br />\n<br />\nVous avez créé un compte avec {$contextName}. Pour pouvoir commencer à l'utiliser vous devez d'abord valider votre compte de courriel. Pour ce faire, vous n'avez qu'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.
PUBLISH_NOTIFY	fr_CA	Nouvelle prépublication publiée	Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$contextName} vient d'être publiée à l'adresse suivante : {$contextUrl}.\n<br />\nNous vous remercions de l'intérêt que vous portez à notre travail,<br />\n{$editorialContactSignature}	Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l'URL fourni.
SUBMISSION_ACK	fr_CA	Accusé de réception de la soumission	{$authorName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$contextName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n	Ce courriel, lorsqu'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l'auteur-e de sa soumission.
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}	Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.
ORCID_COLLECT_AUTHOR_ID	fr_CA	Soumission ORCID	{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d'auteur ou d'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	fr_CA	Demande d'accès au dossier ORCID	{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l'accès en suivant les instructions.<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	Ce modèle de courriel est utilisé pour demander aux auteurs-es l'accès à leur dossier ORCID.
\.


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 16, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_email_id_seq', 1, false);


--
-- Data for Name: email_templates_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_settings (email_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log (log_id, assoc_type, assoc_id, user_id, date_logged, event_type, message, is_translated) FROM stdin;
1	1048585	1	7	2021-10-22 21:00:36	268435458	submission.event.general.metadataUpdated	0
2	515	1	7	2021-10-22 21:00:43	1342177281	submission.event.fileUploaded	0
3	1048585	1	7	2021-10-22 21:00:46	1342177281	submission.event.fileUploaded	0
4	1048585	1	7	2021-10-22 21:00:49	268435458	submission.event.general.metadataUpdated	0
5	1048585	1	7	2021-10-22 21:00:50	268435457	submission.event.submissionSubmitted	0
6	1048585	2	8	2021-10-22 21:00:57	268435458	submission.event.general.metadataUpdated	0
7	515	2	8	2021-10-22 21:01:04	1342177281	submission.event.fileUploaded	0
8	1048585	2	8	2021-10-22 21:01:07	1342177281	submission.event.fileUploaded	0
9	1048585	2	8	2021-10-22 21:01:10	268435458	submission.event.general.metadataUpdated	0
10	1048585	2	8	2021-10-22 21:01:11	268435457	submission.event.submissionSubmitted	0
11	1048585	2	3	2021-10-22 21:01:17	268435462	publication.event.published	0
12	1048585	3	9	2021-10-22 21:01:24	268435458	submission.event.general.metadataUpdated	0
13	515	3	9	2021-10-22 21:01:31	1342177281	submission.event.fileUploaded	0
14	1048585	3	9	2021-10-22 21:01:34	1342177281	submission.event.fileUploaded	0
15	1048585	3	9	2021-10-22 21:01:40	268435458	submission.event.general.metadataUpdated	0
16	1048585	3	9	2021-10-22 21:01:41	268435457	submission.event.submissionSubmitted	0
17	1048585	3	3	2021-10-22 21:01:47	268435462	publication.event.published	0
18	1048585	4	10	2021-10-22 21:01:53	268435458	submission.event.general.metadataUpdated	0
19	515	4	10	2021-10-22 21:02:01	1342177281	submission.event.fileUploaded	0
20	1048585	4	10	2021-10-22 21:02:03	1342177281	submission.event.fileUploaded	0
21	1048585	4	10	2021-10-22 21:02:06	268435458	submission.event.general.metadataUpdated	0
22	1048585	4	10	2021-10-22 21:02:06	268435457	submission.event.submissionSubmitted	0
23	1048585	4	3	2021-10-22 21:02:12	268435462	publication.event.published	0
24	1048585	5	11	2021-10-22 21:02:19	268435458	submission.event.general.metadataUpdated	0
25	515	5	11	2021-10-22 21:02:27	1342177281	submission.event.fileUploaded	0
26	1048585	5	11	2021-10-22 21:02:29	1342177281	submission.event.fileUploaded	0
27	1048585	5	11	2021-10-22 21:02:32	268435458	submission.event.general.metadataUpdated	0
28	1048585	5	11	2021-10-22 21:02:33	268435457	submission.event.submissionSubmitted	0
29	1048585	5	3	2021-10-22 21:02:39	268435462	publication.event.published	0
30	1048585	6	12	2021-10-22 21:02:45	268435458	submission.event.general.metadataUpdated	0
31	515	6	12	2021-10-22 21:02:53	1342177281	submission.event.fileUploaded	0
32	1048585	6	12	2021-10-22 21:02:55	1342177281	submission.event.fileUploaded	0
33	1048585	6	12	2021-10-22 21:02:58	268435458	submission.event.general.metadataUpdated	0
34	1048585	6	12	2021-10-22 21:02:59	268435457	submission.event.submissionSubmitted	0
35	1048585	6	3	2021-10-22 21:03:04	268435462	publication.event.published	0
36	1048585	7	13	2021-10-22 21:03:11	268435458	submission.event.general.metadataUpdated	0
37	515	7	13	2021-10-22 21:03:19	1342177281	submission.event.fileUploaded	0
38	1048585	7	13	2021-10-22 21:03:21	1342177281	submission.event.fileUploaded	0
39	1048585	7	13	2021-10-22 21:03:27	268435458	submission.event.general.metadataUpdated	0
40	1048585	7	13	2021-10-22 21:03:28	268435457	submission.event.submissionSubmitted	0
41	1048585	7	3	2021-10-22 21:03:34	268435462	publication.event.published	0
42	1048585	8	14	2021-10-22 21:03:41	268435458	submission.event.general.metadataUpdated	0
43	515	8	14	2021-10-22 21:03:49	1342177281	submission.event.fileUploaded	0
44	1048585	8	14	2021-10-22 21:03:51	1342177281	submission.event.fileUploaded	0
45	1048585	8	14	2021-10-22 21:03:53	268435458	submission.event.general.metadataUpdated	0
46	1048585	8	14	2021-10-22 21:03:54	268435457	submission.event.submissionSubmitted	0
47	1048585	8	3	2021-10-22 21:04:00	268435462	publication.event.published	0
48	1048585	9	15	2021-10-22 21:04:07	268435458	submission.event.general.metadataUpdated	0
49	515	9	15	2021-10-22 21:04:15	1342177281	submission.event.fileUploaded	0
50	1048585	9	15	2021-10-22 21:04:17	1342177281	submission.event.fileUploaded	0
51	1048585	9	15	2021-10-22 21:04:20	268435458	submission.event.general.metadataUpdated	0
52	1048585	9	15	2021-10-22 21:04:21	268435457	submission.event.submissionSubmitted	0
53	1048585	9	3	2021-10-22 21:04:27	268435462	publication.event.published	0
54	1048585	10	16	2021-10-22 21:04:34	268435458	submission.event.general.metadataUpdated	0
55	515	10	16	2021-10-22 21:04:41	1342177281	submission.event.fileUploaded	0
56	1048585	10	16	2021-10-22 21:04:44	1342177281	submission.event.fileUploaded	0
57	1048585	10	16	2021-10-22 21:04:47	268435458	submission.event.general.metadataUpdated	0
58	1048585	10	16	2021-10-22 21:04:48	268435457	submission.event.submissionSubmitted	0
59	1048585	10	3	2021-10-22 21:04:53	268435462	publication.event.published	0
60	1048585	11	17	2021-10-22 21:05:00	268435458	submission.event.general.metadataUpdated	0
61	515	11	17	2021-10-22 21:05:08	1342177281	submission.event.fileUploaded	0
62	1048585	11	17	2021-10-22 21:05:10	1342177281	submission.event.fileUploaded	0
63	1048585	11	17	2021-10-22 21:05:16	268435458	submission.event.general.metadataUpdated	0
64	1048585	11	17	2021-10-22 21:05:17	268435457	submission.event.submissionSubmitted	0
65	1048585	11	3	2021-10-22 21:05:23	268435462	publication.event.published	0
66	1048585	12	18	2021-10-22 21:05:30	268435458	submission.event.general.metadataUpdated	0
67	515	12	18	2021-10-22 21:05:38	1342177281	submission.event.fileUploaded	0
68	1048585	12	18	2021-10-22 21:05:40	1342177281	submission.event.fileUploaded	0
69	1048585	12	18	2021-10-22 21:05:44	268435458	submission.event.general.metadataUpdated	0
70	1048585	12	18	2021-10-22 21:05:45	268435457	submission.event.submissionSubmitted	0
71	1048585	12	3	2021-10-22 21:05:50	268435462	publication.event.published	0
72	1048585	13	19	2021-10-22 21:05:58	268435458	submission.event.general.metadataUpdated	0
73	515	13	19	2021-10-22 21:06:06	1342177281	submission.event.fileUploaded	0
74	1048585	13	19	2021-10-22 21:06:08	1342177281	submission.event.fileUploaded	0
75	1048585	13	19	2021-10-22 21:06:11	268435458	submission.event.general.metadataUpdated	0
76	1048585	13	19	2021-10-22 21:06:12	268435457	submission.event.submissionSubmitted	0
77	1048585	13	3	2021-10-22 21:06:19	268435462	publication.event.published	0
78	1048585	14	20	2021-10-22 21:06:27	268435458	submission.event.general.metadataUpdated	0
79	515	14	20	2021-10-22 21:06:34	1342177281	submission.event.fileUploaded	0
80	1048585	14	20	2021-10-22 21:06:37	1342177281	submission.event.fileUploaded	0
81	1048585	14	20	2021-10-22 21:06:40	268435458	submission.event.general.metadataUpdated	0
82	1048585	14	20	2021-10-22 21:06:41	268435457	submission.event.submissionSubmitted	0
83	1048585	14	3	2021-10-22 21:06:47	268435462	publication.event.published	0
84	1048585	15	21	2021-10-22 21:06:54	268435458	submission.event.general.metadataUpdated	0
85	515	15	21	2021-10-22 21:07:02	1342177281	submission.event.fileUploaded	0
86	1048585	15	21	2021-10-22 21:07:04	1342177281	submission.event.fileUploaded	0
87	1048585	15	21	2021-10-22 21:07:07	268435458	submission.event.general.metadataUpdated	0
88	1048585	15	21	2021-10-22 21:07:07	268435457	submission.event.submissionSubmitted	0
89	1048585	15	3	2021-10-22 21:07:14	268435462	publication.event.published	0
90	1048585	16	22	2021-10-22 21:07:20	268435458	submission.event.general.metadataUpdated	0
91	515	16	22	2021-10-22 21:07:28	1342177281	submission.event.fileUploaded	0
92	1048585	16	22	2021-10-22 21:07:30	1342177281	submission.event.fileUploaded	0
93	1048585	16	22	2021-10-22 21:07:34	268435458	submission.event.general.metadataUpdated	0
94	1048585	16	22	2021-10-22 21:07:34	268435457	submission.event.submissionSubmitted	0
95	1048585	16	3	2021-10-22 21:07:41	268435462	publication.event.published	0
96	1048585	17	23	2021-10-22 21:07:48	268435458	submission.event.general.metadataUpdated	0
97	515	17	23	2021-10-22 21:07:55	1342177281	submission.event.fileUploaded	0
98	1048585	17	23	2021-10-22 21:07:58	1342177281	submission.event.fileUploaded	0
99	1048585	17	23	2021-10-22 21:08:01	268435458	submission.event.general.metadataUpdated	0
100	1048585	17	23	2021-10-22 21:08:02	268435457	submission.event.submissionSubmitted	0
101	1048585	17	3	2021-10-22 21:08:08	268435462	publication.event.published	0
102	1048585	18	24	2021-10-22 21:08:15	268435458	submission.event.general.metadataUpdated	0
103	515	18	24	2021-10-22 21:08:22	1342177281	submission.event.fileUploaded	0
104	1048585	18	24	2021-10-22 21:08:25	1342177281	submission.event.fileUploaded	0
105	1048585	18	24	2021-10-22 21:08:28	268435458	submission.event.general.metadataUpdated	0
106	1048585	18	24	2021-10-22 21:08:29	268435457	submission.event.submissionSubmitted	0
107	1048585	18	3	2021-10-22 21:08:35	268435462	publication.event.published	0
108	1048585	19	25	2021-10-22 21:08:41	268435458	submission.event.general.metadataUpdated	0
109	515	19	25	2021-10-22 21:08:49	1342177281	submission.event.fileUploaded	0
110	1048585	19	25	2021-10-22 21:08:51	1342177281	submission.event.fileUploaded	0
111	1048585	19	25	2021-10-22 21:08:54	268435458	submission.event.general.metadataUpdated	0
112	1048585	19	25	2021-10-22 21:08:55	268435457	submission.event.submissionSubmitted	0
113	1048585	19	3	2021-10-22 21:09:01	268435462	publication.event.published	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 113, true);


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
2	fileStage	10	int
2	revisedFileId	\N	string
2	fileId	1	string
2	fileRevision	1	int
2	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
2	submissionId	1	int
2	username	ccorino	string
3	fileStage	10	int
3	fileId	1	int
3	fileRevision	1	int
3	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
3	submissionId	1	int
3	username	ccorino	string
3	name	ccorino, The influence of lactation on the quantity and quality of cashmere production.pdf	string
7	fileStage	10	int
7	revisedFileId	\N	string
7	fileId	2	string
7	fileRevision	1	int
7	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
7	submissionId	2	int
7	username	ckwantes	string
8	fileStage	10	int
8	fileId	2	int
8	fileRevision	1	int
8	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
8	submissionId	2	int
8	username	ckwantes	string
8	name	ckwantes, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
13	fileStage	10	int
13	revisedFileId	\N	string
13	fileId	3	string
13	fileRevision	1	int
13	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
13	submissionId	3	int
13	username	cmontgomerie	string
14	fileStage	10	int
14	fileId	3	int
14	fileRevision	1	int
14	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
14	submissionId	3	int
14	username	cmontgomerie	string
14	name	cmontgomerie, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
19	fileStage	10	int
19	revisedFileId	\N	string
19	fileId	4	string
19	fileRevision	1	int
19	originalFileName	Genetic transformation of forest trees.pdf	string
19	submissionId	4	int
19	username	ddiouf	string
20	fileStage	10	int
20	fileId	4	int
20	fileRevision	1	int
20	originalFileName	Genetic transformation of forest trees.pdf	string
20	submissionId	4	int
20	username	ddiouf	string
20	name	ddiouf, Genetic transformation of forest trees.pdf	string
25	fileStage	10	int
25	revisedFileId	\N	string
25	fileId	5	string
25	fileRevision	1	int
25	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
25	submissionId	5	int
25	username	dphillips	string
26	fileStage	10	int
26	fileId	5	int
26	fileRevision	1	int
26	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
26	submissionId	5	int
26	username	dphillips	string
26	name	dphillips, Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
31	fileStage	10	int
31	revisedFileId	\N	string
31	fileId	6	string
31	fileRevision	1	int
31	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
31	submissionId	6	int
31	username	dsokoloff	string
32	fileStage	10	int
32	fileId	6	int
32	fileRevision	1	int
32	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
32	submissionId	6	int
32	username	dsokoloff	string
32	name	dsokoloff, Developing efficacy beliefs in the classroom.pdf	string
37	fileStage	10	int
37	revisedFileId	\N	string
37	fileId	7	string
37	fileRevision	1	int
37	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
37	submissionId	7	int
37	username	eostrom	string
38	fileStage	10	int
38	fileId	7	int
38	fileRevision	1	int
38	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
38	submissionId	7	int
38	username	eostrom	string
38	name	eostrom, Traditions and Trends in the Study of the Commons.pdf	string
43	fileStage	10	int
43	revisedFileId	\N	string
43	fileId	8	string
43	fileRevision	1	int
43	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
43	submissionId	8	int
43	username	fpaglieri	string
44	fileStage	10	int
44	fileId	8	int
44	fileRevision	1	int
44	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
44	submissionId	8	int
44	username	fpaglieri	string
44	name	fpaglieri, Hansen & Pinto: Reason Reclaimed.pdf	string
49	fileStage	10	int
49	revisedFileId	\N	string
49	fileId	9	string
49	fileRevision	1	int
49	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
49	submissionId	9	int
49	username	jmwandenga	string
50	fileStage	10	int
50	fileId	9	int
50	fileRevision	1	int
50	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
50	submissionId	9	int
50	username	jmwandenga	string
50	name	jmwandenga, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
55	fileStage	10	int
55	revisedFileId	\N	string
55	fileId	10	string
55	fileRevision	1	int
55	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
55	submissionId	10	int
55	username	jnovak	string
56	fileStage	10	int
56	fileId	10	int
56	fileRevision	1	int
56	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
56	submissionId	10	int
56	username	jnovak	string
56	name	jnovak, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
61	fileStage	10	int
61	revisedFileId	\N	string
61	fileId	11	string
61	fileRevision	1	int
61	originalFileName	Learning Sustainable Design through Service.pdf	string
61	submissionId	11	int
61	username	kalkhafaji	string
62	fileStage	10	int
62	fileId	11	int
62	fileRevision	1	int
62	originalFileName	Learning Sustainable Design through Service.pdf	string
62	submissionId	11	int
62	username	kalkhafaji	string
62	name	kalkhafaji, Learning Sustainable Design through Service.pdf	string
67	fileStage	10	int
67	revisedFileId	\N	string
67	fileId	12	string
67	fileRevision	1	int
67	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
67	submissionId	12	int
67	username	lchristopher	string
68	fileStage	10	int
68	fileId	12	int
68	fileRevision	1	int
68	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
68	submissionId	12	int
68	username	lchristopher	string
68	name	lchristopher, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
73	fileStage	10	int
73	revisedFileId	\N	string
73	fileId	13	string
73	fileRevision	1	int
73	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
73	submissionId	13	int
73	username	lkumiega	string
74	fileStage	10	int
74	fileId	13	int
74	fileRevision	1	int
74	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
74	submissionId	13	int
74	username	lkumiega	string
74	name	lkumiega, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
79	fileStage	10	int
79	revisedFileId	\N	string
79	fileId	14	string
79	fileRevision	1	int
79	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
79	submissionId	14	int
79	username	pdaniel	string
80	fileStage	10	int
80	fileId	14	int
80	fileRevision	1	int
80	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
80	submissionId	14	int
80	username	pdaniel	string
80	name	pdaniel, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
85	fileStage	10	int
85	revisedFileId	\N	string
85	fileId	15	string
85	fileRevision	1	int
85	originalFileName	Yam diseases and its management in Nigeria.pdf	string
85	submissionId	15	int
85	username	rbaiyewu	string
86	fileStage	10	int
86	fileId	15	int
86	fileRevision	1	int
86	originalFileName	Yam diseases and its management in Nigeria.pdf	string
86	submissionId	15	int
86	username	rbaiyewu	string
86	name	rbaiyewu, Yam diseases and its management in Nigeria.pdf	string
91	fileStage	10	int
91	revisedFileId	\N	string
91	fileId	16	string
91	fileRevision	1	int
91	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
91	submissionId	16	int
91	username	rrossi	string
92	fileStage	10	int
92	fileId	16	int
92	fileRevision	1	int
92	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
92	submissionId	16	int
92	username	rrossi	string
92	name	rrossi, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
97	fileStage	10	int
97	revisedFileId	\N	string
97	fileId	17	string
97	fileRevision	1	int
97	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf	string
97	submissionId	17	int
97	username	vkarbasizaed	string
98	fileStage	10	int
98	fileId	17	int
98	fileRevision	1	int
98	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf	string
98	submissionId	17	int
98	username	vkarbasizaed	string
98	name	vkarbasizaed, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf	string
103	fileStage	10	int
103	revisedFileId	\N	string
103	fileId	18	string
103	fileRevision	1	int
103	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
103	submissionId	18	int
103	username	vwilliamson	string
104	fileStage	10	int
104	fileId	18	int
104	fileRevision	1	int
104	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
104	submissionId	18	int
104	username	vwilliamson	string
104	name	vwilliamson, Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
109	fileStage	10	int
109	revisedFileId	\N	string
109	fileId	19	string
109	fileRevision	1	int
109	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
109	submissionId	19	int
109	username	zwoods	string
110	fileStage	10	int
110	fileId	19	int
110	fileRevision	1	int
110	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
110	submissionId	19	int
110	username	zwoods	string
110	name	zwoods, Finocchiaro: Arguments About Arguments.pdf	string
\.


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	article=>dc11	plugins.metadata.dc11.articleAdapter.displayName	plugins.metadata.dc11.articleAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)
2	mods34=>mods34-xml	plugins.metadata.mods34.mods34XmlOutput.displayName	plugins.metadata.mods34.mods34XmlOutput.description	metadata::plugins.metadata.mods34.schema.Mods34Schema(*)	xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)
3	article=>mods34	plugins.metadata.mods34.articleAdapter.displayName	plugins.metadata.mods34.articleAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)
4	mods34=>article	plugins.metadata.mods34.articleAdapter.displayName	plugins.metadata.mods34.articleAdapter.description	metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)	class::classes.submission.Submission
5	preprint=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)
\.


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 5, true);


--
-- Data for Name: filter_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_settings (filter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filters (filter_id, filter_group_id, context_id, display_name, class_name, is_template, parent_filter_id, seq) FROM stdin;
1	1	0	Extract metadata from a(n) Submission	plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter	0	0	0
2	2	0	MODS 3.4	lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter	0	0	0
3	3	0	Extract metadata from a(n) Submission	plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter	0	0	0
4	4	0	Inject metadata into a(n) Submission	plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter	0	0	0
5	5	0	Crossref XML preprint export	plugins.importexport.crossref.filter.PreprintCrossrefXmlFilter	0	0	0
\.


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 5, true);


--
-- Data for Name: genre_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.genre_settings (genre_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Preprint Text	string
1	fr_CA	name	Texte de la prépublication	string
2	en_US	name	Research Instrument	string
2	fr_CA	name	##default.genres.researchInstrument##	string
3	en_US	name	Research Materials	string
3	fr_CA	name	##default.genres.researchMaterials##	string
4	en_US	name	Research Results	string
4	fr_CA	name	##default.genres.researchResults##	string
5	en_US	name	Transcripts	string
5	fr_CA	name	##default.genres.transcripts##	string
6	en_US	name	Data Analysis	string
6	fr_CA	name	##default.genres.dataAnalysis##	string
7	en_US	name	Data Set	string
7	fr_CA	name	##default.genres.dataSet##	string
8	en_US	name	Source Texts	string
8	fr_CA	name	##default.genres.sourceTexts##	string
9	en_US	name	Multimedia	string
9	fr_CA	name	Multimédias	string
10	en_US	name	Image	string
10	fr_CA	name	Image	string
11	en_US	name	HTML Stylesheet	string
11	fr_CA	name	Feuille de style HTML	string
12	en_US	name	Other	string
12	fr_CA	name	Autre	string
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.genres (genre_id, context_id, seq, enabled, category, dependent, supplementary, entry_key) FROM stdin;
1	1	0	1	1	0	0	SUBMISSION
2	1	1	1	3	0	1	RESEARCHINSTRUMENT
3	1	2	1	3	0	1	RESEARCHMATERIALS
4	1	3	1	3	0	1	RESEARCHRESULTS
5	1	4	1	3	0	1	TRANSCRIPTS
6	1	5	1	3	0	1	DATAANALYSIS
7	1	6	1	3	0	1	DATASET
8	1	7	1	3	0	1	SOURCETEXTS
9	1	8	1	1	1	1	MULTIMEDIA
10	1	9	1	2	1	0	IMAGE
11	1	10	1	1	1	0	STYLE
12	1	11	1	3	0	1	OTHER
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 12, true);


--
-- Data for Name: item_views; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.item_views (assoc_type, assoc_id, user_id, date_last_viewed) FROM stdin;
\.


--
-- Data for Name: journal_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.journal_settings (journal_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	fr_CA	name	Serveur de prépublication de la connaissance du public	\N
1		supportedFormLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
1		supportedLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
1		supportedSubmissionLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
1		themePluginPath	default	\N
1	en_US	abbreviation	publicknowledgePub Know Pre	\N
1		enableAuthorScreening	0	\N
1		enableOai	1	\N
1	en_US	name	Public Knowledge Preprint Server	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##	\N
1	en_US	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##	\N
1	en_US	acronym	JPKPKP	\N
1	fr_CA	authorInformation	##default.contextSettings.forAuthors##	\N
1	en_US	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.phppublicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.phppublicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.phppublicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>	\N
1	fr_CA	readerInformation	##default.contextSettings.forReaders##	\N
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this server. Use the <a href="http://localhost/index.phppublicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.phppublicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.	\N
1	fr_CA	submissionChecklist	a:5:{i:0;a:2:{s:5:"order";i:1;s:7:"content";s:212:"La soumission n'a pas déjà été publiée et n'est pas considérée actuellement par un autre serveur. Si ce n'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».";}i:1;a:2:{s:5:"order";i:2;s:7:"content";s:121:"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.";}i:2;a:2:{s:5:"order";i:3;s:7:"content";s:62:"Lorsque possible, les URL des références ont été fournies.";}i:3;a:2:{s:5:"order";i:4;s:7:"content";s:58:"##default.contextSettings.checklist.submissionAppearance##";}i:4;a:2:{s:5:"order";i:5;s:7:"content";s:63:"##default.contextSettings.checklist.bibliographicRequirements##";}}	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		defaultReviewMode	2	\N
1		emailSignature	<br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>	\N
1		itemsPerPage	25	\N
1		keywords	request	\N
1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##	\N
1	en_US	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source publishing system is suitable for libraries to host for their faculty members to use (see <a href="http://pkp.sfu.ca">Public Knowledge Project</a>).	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	submissionChecklist	a:5:{i:0;a:2:{s:5:"order";i:1;s:7:"content";s:167:"The submission has not been previously published, nor is it before another server for consideration (or an explanation has been provided in Comments to the Moderator).";}i:1;a:2:{s:5:"order";i:2;s:7:"content";s:82:"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.";}i:2;a:2:{s:5:"order";i:3;s:7:"content";s:60:"Where available, URLs for the references have been provided.";}i:3;a:2:{s:5:"order";i:4;s:7:"content";s:239:"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.";}i:4;a:2:{s:5:"order";i:5;s:7:"content";s:99:"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.";}}	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
\.


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.journals (journal_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en_US	1
\.


--
-- Name: journals_journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.journals_journal_id_seq', 1, true);


--
-- Data for Name: library_file_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.library_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: library_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.library_files (file_id, context_id, file_name, original_file_name, file_type, file_size, type, date_uploaded, date_modified, submission_id, public_access) FROM stdin;
\.


--
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.library_files_file_id_seq', 1, false);


--
-- Data for Name: metadata_description_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metadata_description_settings (metadata_description_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: metadata_descriptions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metadata_descriptions (metadata_description_id, assoc_type, assoc_id, schema_namespace, schema_name, display_name, seq) FROM stdin;
\.


--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metadata_descriptions_metadata_description_id_seq', 1, false);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics (load_id, context_id, pkp_section_id, assoc_object_type, assoc_object_id, submission_id, representation_id, assoc_type, assoc_id, day, month, file_type, country_id, region, city, metric_type, metric) FROM stdin;
\.


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 22, true);


--
-- Data for Name: navigation_menu_item_assignment_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menu_item_assignment_settings (navigation_menu_item_assignment_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: navigation_menu_item_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menu_item_assignments (navigation_menu_item_assignment_id, navigation_menu_id, navigation_menu_item_id, parent_id, seq) FROM stdin;
1	1	1	0	0
2	1	2	0	1
3	1	3	0	2
4	1	4	3	0
5	1	5	3	1
6	1	6	3	2
7	1	7	3	3
8	2	8	0	0
9	2	9	0	1
10	2	10	0	2
11	2	11	10	0
12	2	12	10	1
13	2	13	10	2
14	2	14	10	3
15	3	15	0	0
16	3	16	0	1
17	3	17	0	2
18	3	18	17	0
19	3	19	17	1
20	3	20	17	2
21	3	21	17	3
22	3	22	17	4
\.


--
-- Data for Name: navigation_menu_item_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menu_item_settings (navigation_menu_item_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		titleLocaleKey	navigation.register	string
2		titleLocaleKey	navigation.login	string
3		titleLocaleKey	{$loggedInUsername}	string
4		titleLocaleKey	navigation.dashboard	string
5		titleLocaleKey	common.viewProfile	string
6		titleLocaleKey	navigation.admin	string
7		titleLocaleKey	user.logOut	string
8		titleLocaleKey	navigation.register	string
9		titleLocaleKey	navigation.login	string
10		titleLocaleKey	{$loggedInUsername}	string
11		titleLocaleKey	navigation.dashboard	string
12		titleLocaleKey	common.viewProfile	string
13		titleLocaleKey	navigation.admin	string
14		titleLocaleKey	user.logOut	string
15		titleLocaleKey	manager.announcements	string
16		titleLocaleKey	navigation.archives	string
17		titleLocaleKey	navigation.about	string
18		titleLocaleKey	about.aboutContext	string
19		titleLocaleKey	about.submissions	string
20		titleLocaleKey	about.editorialTeam	string
21		titleLocaleKey	manager.setup.privacyStatement	string
22		titleLocaleKey	about.contact	string
23		titleLocaleKey	common.search	string
\.


--
-- Data for Name: navigation_menu_items; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menu_items (navigation_menu_item_id, context_id, url, path, type) FROM stdin;
1	0	\N	\N	NMI_TYPE_USER_REGISTER
2	0	\N	\N	NMI_TYPE_USER_LOGIN
3	0	\N	\N	NMI_TYPE_USER_DASHBOARD
4	0	\N	\N	NMI_TYPE_USER_DASHBOARD
5	0	\N	\N	NMI_TYPE_USER_PROFILE
6	0	\N	\N	NMI_TYPE_ADMINISTRATION
7	0	\N	\N	NMI_TYPE_USER_LOGOUT
8	1	\N	\N	NMI_TYPE_USER_REGISTER
9	1	\N	\N	NMI_TYPE_USER_LOGIN
10	1	\N	\N	NMI_TYPE_USER_DASHBOARD
11	1	\N	\N	NMI_TYPE_USER_DASHBOARD
12	1	\N	\N	NMI_TYPE_USER_PROFILE
13	1	\N	\N	NMI_TYPE_ADMINISTRATION
14	1	\N	\N	NMI_TYPE_USER_LOGOUT
15	1	\N	\N	NMI_TYPE_ANNOUNCEMENTS
16	1	\N	\N	NMI_TYPE_ARCHIVES
17	1	\N	\N	NMI_TYPE_ABOUT
18	1	\N	\N	NMI_TYPE_ABOUT
19	1	\N	\N	NMI_TYPE_SUBMISSIONS
20	1	\N	\N	NMI_TYPE_EDITORIAL_TEAM
21	1	\N	\N	NMI_TYPE_PRIVACY
22	1	\N	\N	NMI_TYPE_CONTACT
23	1	\N	\N	NMI_TYPE_SEARCH
\.


--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_items_navigation_menu_item_id_seq', 23, true);


--
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	0	user	User Navigation Menu
2	1	user	User Navigation Menu
3	1	primary	Primary Navigation Menu
\.


--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menus_navigation_menu_id_seq', 3, true);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notes (note_id, assoc_type, assoc_id, user_id, date_created, date_modified, title, contents) FROM stdin;
\.


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 1, false);


--
-- Data for Name: notification_mail_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notification_mail_list (notification_mail_list_id, email, confirmed, token, context) FROM stdin;
\.


--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_mail_list_notification_mail_list_id_seq', 1, false);


--
-- Data for Name: notification_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notification_settings (notification_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: notification_subscription_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notification_subscription_settings (setting_id, setting_name, setting_value, user_id, context, setting_type) FROM stdin;
1	blocked_emailed_notification	8	7	1	int
2	blocked_emailed_notification	8	8	1	int
3	blocked_emailed_notification	8	9	1	int
4	blocked_emailed_notification	8	10	1	int
5	blocked_emailed_notification	8	11	1	int
6	blocked_emailed_notification	8	12	1	int
7	blocked_emailed_notification	8	13	1	int
8	blocked_emailed_notification	8	14	1	int
9	blocked_emailed_notification	8	15	1	int
10	blocked_emailed_notification	8	16	1	int
11	blocked_emailed_notification	8	17	1	int
12	blocked_emailed_notification	8	18	1	int
13	blocked_emailed_notification	8	19	1	int
14	blocked_emailed_notification	8	20	1	int
15	blocked_emailed_notification	8	21	1	int
16	blocked_emailed_notification	8	22	1	int
17	blocked_emailed_notification	8	23	1	int
18	blocked_emailed_notification	8	24	1	int
19	blocked_emailed_notification	8	25	1	int
\.


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 19, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notifications (notification_id, context_id, user_id, level, type, date_created, date_read, assoc_type, assoc_id) FROM stdin;
153	1	0	3	16777222	2021-10-22 21:08:02	\N	1048585	17
56	1	0	2	16777243	2021-10-22 21:02:59	\N	1048585	6
154	1	0	3	16777223	2021-10-22 21:08:02	\N	1048585	17
57	1	0	2	16777245	2021-10-22 21:02:59	\N	1048585	6
3	1	0	3	16777222	2021-10-22 21:00:50	\N	1048585	1
4	1	0	3	16777223	2021-10-22 21:00:50	\N	1048585	1
5	1	5	2	16777217	2021-10-22 21:00:50	\N	1048585	1
7	1	4	2	16777217	2021-10-22 21:00:50	\N	1048585	1
9	1	0	2	16777243	2021-10-22 21:00:50	\N	1048585	1
10	1	0	2	16777245	2021-10-22 21:00:50	\N	1048585	1
85	1	0	2	16777243	2021-10-22 21:04:21	\N	1048585	9
86	1	0	2	16777245	2021-10-22 21:04:21	\N	1048585	9
12	1	0	3	16777222	2021-10-22 21:01:11	\N	1048585	2
13	1	0	3	16777223	2021-10-22 21:01:11	\N	1048585	2
14	1	5	2	16777217	2021-10-22 21:01:11	\N	1048585	2
16	1	4	2	16777217	2021-10-22 21:01:11	\N	1048585	2
18	1	0	2	16777243	2021-10-22 21:01:11	\N	1048585	2
19	1	0	2	16777245	2021-10-22 21:01:11	\N	1048585	2
109	1	0	3	16777223	2021-10-22 21:05:44	\N	1048585	12
60	1	0	3	16777222	2021-10-22 21:03:28	\N	1048585	7
22	1	0	3	16777222	2021-10-22 21:01:41	\N	1048585	3
23	1	0	3	16777223	2021-10-22 21:01:41	\N	1048585	3
24	1	5	2	16777217	2021-10-22 21:01:41	\N	1048585	3
26	1	4	2	16777217	2021-10-22 21:01:41	\N	1048585	3
28	1	0	2	16777243	2021-10-22 21:01:41	\N	1048585	3
29	1	0	2	16777245	2021-10-22 21:01:41	\N	1048585	3
61	1	0	3	16777223	2021-10-22 21:03:28	\N	1048585	7
62	1	5	2	16777217	2021-10-22 21:03:28	\N	1048585	7
64	1	4	2	16777217	2021-10-22 21:03:28	\N	1048585	7
32	1	0	3	16777222	2021-10-22 21:02:06	\N	1048585	4
33	1	0	3	16777223	2021-10-22 21:02:06	\N	1048585	4
34	1	5	2	16777217	2021-10-22 21:02:06	\N	1048585	4
36	1	4	2	16777217	2021-10-22 21:02:06	\N	1048585	4
38	1	0	2	16777243	2021-10-22 21:02:06	\N	1048585	4
39	1	0	2	16777245	2021-10-22 21:02:06	\N	1048585	4
66	1	0	2	16777243	2021-10-22 21:03:28	\N	1048585	7
67	1	0	2	16777245	2021-10-22 21:03:28	\N	1048585	7
41	1	0	3	16777222	2021-10-22 21:02:33	\N	1048585	5
42	1	0	3	16777223	2021-10-22 21:02:33	\N	1048585	5
43	1	5	2	16777217	2021-10-22 21:02:33	\N	1048585	5
45	1	4	2	16777217	2021-10-22 21:02:33	\N	1048585	5
47	1	0	2	16777243	2021-10-22 21:02:33	\N	1048585	5
48	1	0	2	16777245	2021-10-22 21:02:33	\N	1048585	5
98	1	0	3	16777222	2021-10-22 21:05:17	\N	1048585	11
50	1	0	3	16777222	2021-10-22 21:02:59	\N	1048585	6
51	1	0	3	16777223	2021-10-22 21:02:59	\N	1048585	6
52	1	5	2	16777217	2021-10-22 21:02:59	\N	1048585	6
54	1	4	2	16777217	2021-10-22 21:02:59	\N	1048585	6
99	1	0	3	16777223	2021-10-22 21:05:17	\N	1048585	11
88	1	0	3	16777222	2021-10-22 21:04:47	\N	1048585	10
89	1	0	3	16777223	2021-10-22 21:04:47	\N	1048585	10
70	1	0	3	16777222	2021-10-22 21:03:54	\N	1048585	8
71	1	0	3	16777223	2021-10-22 21:03:54	\N	1048585	8
72	1	5	2	16777217	2021-10-22 21:03:54	\N	1048585	8
74	1	4	2	16777217	2021-10-22 21:03:54	\N	1048585	8
76	1	0	2	16777243	2021-10-22 21:03:54	\N	1048585	8
77	1	0	2	16777245	2021-10-22 21:03:54	\N	1048585	8
90	1	5	2	16777217	2021-10-22 21:04:47	\N	1048585	10
92	1	4	2	16777217	2021-10-22 21:04:47	\N	1048585	10
79	1	0	3	16777222	2021-10-22 21:04:21	\N	1048585	9
80	1	0	3	16777223	2021-10-22 21:04:21	\N	1048585	9
81	1	5	2	16777217	2021-10-22 21:04:21	\N	1048585	9
83	1	4	2	16777217	2021-10-22 21:04:21	\N	1048585	9
94	1	0	2	16777243	2021-10-22 21:04:47	\N	1048585	10
95	1	0	2	16777245	2021-10-22 21:04:47	\N	1048585	10
100	1	5	2	16777217	2021-10-22 21:05:17	\N	1048585	11
102	1	4	2	16777217	2021-10-22 21:05:17	\N	1048585	11
104	1	0	2	16777243	2021-10-22 21:05:17	\N	1048585	11
105	1	0	2	16777245	2021-10-22 21:05:17	\N	1048585	11
110	1	5	2	16777217	2021-10-22 21:05:44	\N	1048585	12
112	1	4	2	16777217	2021-10-22 21:05:44	\N	1048585	12
108	1	0	3	16777222	2021-10-22 21:05:44	\N	1048585	12
114	1	0	2	16777243	2021-10-22 21:05:44	\N	1048585	12
115	1	0	2	16777245	2021-10-22 21:05:44	\N	1048585	12
117	1	0	3	16777222	2021-10-22 21:06:12	\N	1048585	13
118	1	0	3	16777223	2021-10-22 21:06:12	\N	1048585	13
119	1	5	2	16777217	2021-10-22 21:06:12	\N	1048585	13
121	1	4	2	16777217	2021-10-22 21:06:12	\N	1048585	13
123	1	0	2	16777243	2021-10-22 21:06:12	\N	1048585	13
124	1	0	2	16777245	2021-10-22 21:06:12	\N	1048585	13
155	1	5	2	16777217	2021-10-22 21:08:02	\N	1048585	17
157	1	4	2	16777217	2021-10-22 21:08:02	\N	1048585	17
126	1	0	3	16777222	2021-10-22 21:06:41	\N	1048585	14
127	1	0	3	16777223	2021-10-22 21:06:41	\N	1048585	14
128	1	5	2	16777217	2021-10-22 21:06:41	\N	1048585	14
130	1	4	2	16777217	2021-10-22 21:06:41	\N	1048585	14
159	1	0	2	16777243	2021-10-22 21:08:02	\N	1048585	17
132	1	0	2	16777243	2021-10-22 21:06:41	\N	1048585	14
133	1	0	2	16777245	2021-10-22 21:06:41	\N	1048585	14
160	1	0	2	16777245	2021-10-22 21:08:02	\N	1048585	17
135	1	0	3	16777222	2021-10-22 21:07:07	\N	1048585	15
136	1	0	3	16777223	2021-10-22 21:07:07	\N	1048585	15
137	1	5	2	16777217	2021-10-22 21:07:07	\N	1048585	15
139	1	4	2	16777217	2021-10-22 21:07:07	\N	1048585	15
162	1	0	3	16777222	2021-10-22 21:08:28	\N	1048585	18
141	1	0	2	16777243	2021-10-22 21:07:07	\N	1048585	15
142	1	0	2	16777245	2021-10-22 21:07:07	\N	1048585	15
163	1	0	3	16777223	2021-10-22 21:08:28	\N	1048585	18
164	1	5	2	16777217	2021-10-22 21:08:28	\N	1048585	18
166	1	4	2	16777217	2021-10-22 21:08:28	\N	1048585	18
144	1	0	3	16777222	2021-10-22 21:07:34	\N	1048585	16
145	1	0	3	16777223	2021-10-22 21:07:34	\N	1048585	16
146	1	5	2	16777217	2021-10-22 21:07:34	\N	1048585	16
148	1	4	2	16777217	2021-10-22 21:07:34	\N	1048585	16
168	1	0	2	16777243	2021-10-22 21:08:28	\N	1048585	18
150	1	0	2	16777243	2021-10-22 21:07:34	\N	1048585	16
151	1	0	2	16777245	2021-10-22 21:07:34	\N	1048585	16
169	1	0	2	16777245	2021-10-22 21:08:28	\N	1048585	18
171	1	0	3	16777222	2021-10-22 21:08:55	\N	1048585	19
172	1	0	3	16777223	2021-10-22 21:08:55	\N	1048585	19
173	1	5	2	16777217	2021-10-22 21:08:55	\N	1048585	19
175	1	4	2	16777217	2021-10-22 21:08:55	\N	1048585	19
177	1	0	2	16777243	2021-10-22 21:08:55	\N	1048585	19
178	1	0	2	16777245	2021-10-22 21:08:55	\N	1048585	19
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 179, true);


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
acronplugin	0	enabled	1	bool
tinymceplugin	0	enabled	1	bool
defaultthemeplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	a:2:{i:0;s:4:"city";i:1;s:6:"region";}	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
acronplugin	0	crontab	a:7:{i:0;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:1;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:2;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:3;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:4;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:5;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:6;a:3:{s:9:"className";s:37:"lib.pkp.classes.task.StatisticsReport";s:9:"frequency";a:1:{s:3:"day";s:1:"1";}s:4:"args";a:0:{}}}	object
tinymceplugin	1	enabled	1	bool
defaultthemeplugin	1	enabled	1	bool
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
pdfjsviewerplugin	1	enabled	1	bool
googlescholarplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	61732609e2d84	string
defaultthemeplugin	1	typography	notoSans	string
defaultthemeplugin	1	baseColour	#1E6292	string
defaultthemeplugin	1	showDescriptionInServerIndex	false	string
defaultthemeplugin	1	useHomepageImageAsHeader	false	string
\.


--
-- Data for Name: publication_categories; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_categories (publication_id, category_id) FROM stdin;
\.


--
-- Data for Name: publication_galley_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_galley_settings (galley_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: publication_galleys; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_galleys (galley_id, locale, publication_id, label, file_id, seq, remote_url, is_approved, url_path) FROM stdin;
1	en_US	1	PDF	1	0		0	
2	en_US	2	PDF	2	0		0	
3	en_US	3	PDF	3	0		0	
4	en_US	4	PDF	4	0		0	
5	en_US	5	PDF	5	0		0	
6	en_US	6	PDF	6	0		0	
7	en_US	7	PDF	7	0		0	
8	en_US	8	PDF	8	0		0	
9	en_US	9	PDF	9	0		0	
10	en_US	10	PDF	10	0		0	
11	en_US	11	PDF	11	0		0	
12	en_US	12	PDF	12	0		0	
13	en_US	13	PDF	13	0		0	
14	en_US	14	PDF	14	0		0	
15	en_US	15	PDF	15	0		0	
16	en_US	16	PDF	16	0		0	
17	en_US	17	PDF	17	0		0	
18	en_US	18	PDF	18	0		0	
19	en_US	19	PDF	19	0		0	
\.


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 19, true);


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	abstract	<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>
1	fr_CA	abstract	
1		categoryIds	a:0:{}
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The influence of lactation on the quantity and quality of cashmere production
1	fr_CA	title	
3	fr_CA	abstract	
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
2	fr_CA	abstract	
2		categoryIds	a:0:{}
2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
2	en_US	copyrightHolder	Public Knowledge Preprint Server
2		copyrightYear	2021
2	en_US	prefix	
2	fr_CA	prefix	
2	en_US	subtitle	
2	fr_CA	subtitle	
2	en_US	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
2	fr_CA	title	
9	fr_CA	title	
3		categoryIds	a:0:{}
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
3	fr_CA	title	
8	en_US	title	Hansen & Pinto: Reason Reclaimed
9	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
9	fr_CA	abstract	
9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9	en_US	copyrightHolder	Public Knowledge Preprint Server
9		copyrightYear	2021
9	en_US	prefix	
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
3	en_US	copyrightHolder	Public Knowledge Preprint Server
3		copyrightYear	2021
4	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
4	fr_CA	abstract	
4		categoryIds	a:0:{}
4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
4	en_US	copyrightHolder	Public Knowledge Preprint Server
4		copyrightYear	2021
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	Genetic transformation of forest trees
4	fr_CA	title	
5	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
5	fr_CA	abstract	
5		categoryIds	a:0:{}
5	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
5	en_US	copyrightHolder	Public Knowledge Preprint Server
5		copyrightYear	2021
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
5	fr_CA	title	
6	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
6	fr_CA	abstract	
6		categoryIds	a:0:{}
6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
6	en_US	copyrightHolder	Public Knowledge Preprint Server
6		copyrightYear	2021
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	Developing efficacy beliefs in the classroom
6	fr_CA	title	
7	fr_CA	prefix	
7	fr_CA	abstract	
7	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>
7		categoryIds	a:0:{}
7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
7	en_US	copyrightHolder	Public Knowledge Preprint Server
7		copyrightYear	2021
7	en_US	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Traditions and Trends in the Study of the Commons
7	fr_CA	title	
8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
8	en_US	abstract	<p>None.</p>
8	fr_CA	abstract	
8		categoryIds	a:0:{}
8	en_US	copyrightHolder	Public Knowledge Preprint Server
8		copyrightYear	2021
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	fr_CA	title	
9		categoryIds	a:0:{}
10	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
10	fr_CA	abstract	
10		categoryIds	a:0:{}
10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10	en_US	copyrightHolder	Public Knowledge Preprint Server
10		copyrightYear	2021
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
10	fr_CA	title	
16	fr_CA	title	
11	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
11	fr_CA	abstract	
11		categoryIds	a:0:{}
11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
11	en_US	copyrightHolder	Public Knowledge Preprint Server
11		copyrightYear	2021
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Learning Sustainable Design through Service
11	fr_CA	title	
12		categoryIds	a:0:{}
12	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
12	fr_CA	abstract	
12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12	en_US	copyrightHolder	Public Knowledge Preprint Server
12		copyrightYear	2021
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
12	fr_CA	title	
13	fr_CA	abstract	
13		categoryIds	a:0:{}
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
13	fr_CA	title	
13	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
13	en_US	copyrightHolder	Public Knowledge Preprint Server
13		copyrightYear	2021
14	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
14	fr_CA	abstract	
14		categoryIds	a:0:{}
14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
14	en_US	copyrightHolder	Public Knowledge Preprint Server
14		copyrightYear	2021
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
14	fr_CA	title	
15	en_US	subtitle	
15	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
15	fr_CA	abstract	
15		categoryIds	a:0:{}
15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15	en_US	copyrightHolder	Public Knowledge Preprint Server
15		copyrightYear	2021
15	en_US	prefix	
15	fr_CA	prefix	
15	fr_CA	subtitle	
15	en_US	title	Yam diseases and its management in Nigeria
15	fr_CA	title	
16	fr_CA	abstract	
16		categoryIds	a:0:{}
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
16	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
16	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>
16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16	en_US	copyrightHolder	Public Knowledge Preprint Server
16		copyrightYear	2021
18	fr_CA	abstract	
17	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
17	fr_CA	abstract	
17		categoryIds	a:0:{}
17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
17	en_US	copyrightHolder	Public Knowledge Preprint Server
17		copyrightYear	2021
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
17	fr_CA	title	
18	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
18		categoryIds	a:0:{}
18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
18	en_US	copyrightHolder	Public Knowledge Preprint Server
18		copyrightYear	2021
18	en_US	prefix	
18	fr_CA	prefix	
18	en_US	subtitle	
18	fr_CA	subtitle	
18	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments
18	fr_CA	title	
19	fr_CA	abstract	
19	en_US	abstract	<p>None.</p>
19		categoryIds	a:0:{}
19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
19	en_US	copyrightHolder	Public Knowledge Preprint Server
19		copyrightYear	2021
19	fr_CA	prefix	
19	en_US	prefix	
19	fr_CA	subtitle	
19	en_US	subtitle	
19	fr_CA	title	
19	en_US	title	Finocchiaro: Arguments About Arguments
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, locale, primary_contact_id, section_id, submission_id, status, url_path, version) FROM stdin;
1	0	\N	2021-10-22 21:00:49	en_US	1	1	1	1	\N	1
18	0	2021-10-22	2021-10-22 21:08:35	en_US	21	1	18	3	\N	1
2	0	2021-10-22	2021-10-22 21:01:17	en_US	2	1	2	3	\N	1
3	0	2021-10-22	2021-10-22 21:01:46	en_US	3	1	3	3	\N	1
19	0	2021-10-22	2021-10-22 21:09:01	en_US	22	1	19	3	\N	1
4	0	2021-10-22	2021-10-22 21:02:12	en_US	5	1	4	3	\N	1
5	0	2021-10-22	2021-10-22 21:02:39	en_US	6	1	5	3	\N	1
6	0	2021-10-22	2021-10-22 21:03:04	en_US	7	1	6	3	\N	1
7	0	2021-10-22	2021-10-22 21:03:34	en_US	8	1	7	3	\N	1
8	0	2021-10-22	2021-10-22 21:04:00	en_US	10	1	8	3	\N	1
9	0	2021-10-22	2021-10-22 21:04:27	en_US	11	1	9	3	\N	1
10	0	2021-10-22	2021-10-22 21:04:53	en_US	12	1	10	3	\N	1
11	0	2021-10-22	2021-10-22 21:05:23	en_US	13	1	11	3	\N	1
12	0	2021-10-22	2021-10-22 21:05:50	en_US	15	1	12	3	\N	1
13	0	2021-10-22	2021-10-22 21:06:18	en_US	16	1	13	3	\N	1
14	0	2021-10-22	2021-10-22 21:06:47	en_US	17	1	14	3	\N	1
15	0	2021-10-22	2021-10-22 21:07:13	en_US	18	1	15	3	\N	1
16	0	2021-10-22	2021-10-22 21:07:40	en_US	19	1	16	3	\N	1
17	0	2021-10-22	2021-10-22 21:08:08	en_US	20	1	17	3	\N	1
\.


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 19, true);


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
\.


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.queries_query_id_seq', 1, false);


--
-- Data for Name: query_participants; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.query_participants (query_id, user_id) FROM stdin;
\.


--
-- Data for Name: review_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, unconsidered) FROM stdin;
\.


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_assignments_review_id_seq', 1, false);


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_files (review_id, file_id) FROM stdin;
\.


--
-- Data for Name: review_round_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_round_files (submission_id, review_round_id, stage_id, file_id, revision) FROM stdin;
\.


--
-- Data for Name: review_rounds; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_rounds (review_round_id, submission_id, stage_id, round, review_revision, status) FROM stdin;
\.


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_rounds_review_round_id_seq', 1, false);


--
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.scheduled_tasks (class_name, last_run) FROM stdin;
plugins.generic.usageStats.UsageStatsLoader	2021-10-22 20:58:38
lib.pkp.classes.task.StatisticsReport	2021-10-22 20:58:38
\.


--
-- Data for Name: section_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.section_settings (section_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Preprints	string
1	fr_CA	title		string
1	en_US	policy		string
1	fr_CA	policy		string
1	en_US	abbrev	PRE	string
1	fr_CA	abbrev		string
1	en_US	identifyType		string
1	fr_CA	identifyType		string
1	en_US	description		string
1	fr_CA	description		string
1		path	preprints	string
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sections (section_id, journal_id, review_form_id, seq, editor_restricted, meta_indexed, meta_reviewed, abstracts_not_required, hide_title, hide_author, abstract_word_count) FROM stdin;
1	1	0	0	0	1	1	0	0	0	\N
\.


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 1, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
bm1uul4sk67dtsbo0nl5dndo6o	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936316	1634936316	0		localhost
342kt4ndimcssas8k5n96qabq4	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936318	1634936329	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1634936328;s:5:"token";s:32:"da181e8c274f90c56245eba8cb9bc6dd";}	localhost
3flrtihm1ri41k12pdfeqdrv3c	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936616	1634936640	0	csrf|a:2:{s:9:"timestamp";i:1634936640;s:5:"token";s:32:"c81bc970a3697d44bce207e72c2b2114";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
4cm4r7don42m1jm359b9m5i54s	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936329	1634936343	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1634936343;s:5:"token";s:32:"026f08f2579ef8c126f73ccd6565a0c8";}	localhost
4njl2lo18n2gd0r3eq5srdticj	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936343	1634936351	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1634936351;s:5:"token";s:32:"ad01a7ce5c1cd6f816a23c66f24d0018";}	localhost
bvpdc3ppje18g0qt2f8kja63u1	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936641	1634936667	0	csrf|a:2:{s:9:"timestamp";i:1634936667;s:5:"token";s:32:"7f41dd149d93ae1b53a23003cf031c52";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
t7ndcipg3hot94uehaamu7ru73	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936407	1634936428	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1634936428;s:5:"token";s:32:"e26801e1e602a7d63298f5497d53c4b4";}	localhost
030h1q294km7bpbodq1tm5n6cl	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936351	1634936358	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1634936358;s:5:"token";s:32:"02b723c275f6b94a945730d9d1d50130";}	localhost
11hnqirhhcsajv6q0am9d7i6lt	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936668	1634936693	0	csrf|a:2:{s:9:"timestamp";i:1634936693;s:5:"token";s:32:"bef506f91807c926aea43984a87f42dc";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
d6i4e3f9qqo3afjag44ftb7t1o	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936451	1634936477	0	csrf|a:2:{s:9:"timestamp";i:1634936477;s:5:"token";s:32:"5a5d100e0b1537fc2ad6bdf0ee0fb127";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
48hdf6h2gv2q0tki3hsa46dtqb	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936359	1634936399	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1634936399;s:5:"token";s:32:"7f4ac108246e509cd0279fed0ce27f1a";}	localhost
vllovhj1mv9djad8ct0deflf42	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936430	1634936450	0	csrf|a:2:{s:9:"timestamp";i:1634936450;s:5:"token";s:32:"1506a1e1b4f8f7a3f0e00261060a7ba6";}username|s:7:"ccorino";userId|s:1:"7";	localhost
ss8f3u58hoql0uu3ec5m1ui5u8	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936401	1634936407	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1634936407;s:5:"token";s:32:"40bf58fcb68869c8229ed4357eddbc91";}	localhost
tmd9mgfaahfh2m476uc1oasb3p	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936695	1634936723	0	csrf|a:2:{s:9:"timestamp";i:1634936723;s:5:"token";s:32:"7d48de3d2e9b7c749800b73b14981097";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
mmvo1inrtnhknjqddsfbfb0p4l	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936478	1634936506	0	csrf|a:2:{s:9:"timestamp";i:1634936506;s:5:"token";s:32:"4bd781a5362be8696dcaa7145b170f6c";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
g6tnvjb5l95n1su3fa9udv7ndf	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936725	1634936750	0	csrf|a:2:{s:9:"timestamp";i:1634936750;s:5:"token";s:32:"c9dff32a36e11958f385a79f0a3126f5";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
b73fndu3g7q9vpr15t91li3puu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936752	1634936778	0	csrf|a:2:{s:9:"timestamp";i:1634936778;s:5:"token";s:32:"daf58077544fbbbcca90aa39489564a8";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
89nc2rbbd83c8feptasikqsjo2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936508	1634936532	0	csrf|a:2:{s:9:"timestamp";i:1634936532;s:5:"token";s:32:"2370b88db346e138e6ba7fd3f1bedb17";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
7fudg20c31k5c9b49lop1qicrs	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936534	1634936558	0	csrf|a:2:{s:9:"timestamp";i:1634936558;s:5:"token";s:32:"36d8deb5bbf15a83a4edc87578ceeb9c";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
tvkkd512ha3g7qlff3l2d9km8l	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936560	1634936584	0	csrf|a:2:{s:9:"timestamp";i:1634936584;s:5:"token";s:32:"b3d377f858cb9b105098f234f1208982";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
ofj60jb9d5rlnlfh81flt6gbq8	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936586	1634936614	0	csrf|a:2:{s:9:"timestamp";i:1634936614;s:5:"token";s:32:"23ff65a04c1889033290173751a6388f";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
dofvc0c5g6uaa1rdf6hu47fe54	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936781	1634936807	0	csrf|a:2:{s:9:"timestamp";i:1634936807;s:5:"token";s:32:"3630e8a6c3f4a1946f04e273f9088a73";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
n0m4t4j7f49blld4b3gs5l7i8s	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936835	1634936860	0	csrf|a:2:{s:9:"timestamp";i:1634936860;s:5:"token";s:32:"67cc88e8306714920cca676d30e06593";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
rn9meplt6oc8g1uic01obkqh2e	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936862	1634936888	0	csrf|a:2:{s:9:"timestamp";i:1634936888;s:5:"token";s:32:"99d90b59ec76e4b774e23abaa1e2060e";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
f66mffgjbog9sg751kijea0qvo	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936808	1634936833	0	csrf|a:2:{s:9:"timestamp";i:1634936833;s:5:"token";s:32:"f62479096161eeba76a44f7ad75a278c";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
qfsgu567o4ghvji93aldsij945	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936889	1634936915	0	csrf|a:2:{s:9:"timestamp";i:1634936915;s:5:"token";s:32:"e3b5f149f11c9572abee5bf69039c7ff";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
vrmash3hmmdvsno8ralaov42ot	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.131 Safari/537.36	1634936916	1634936941	0	csrf|a:2:{s:9:"timestamp";i:1634936941;s:5:"token";s:32:"4f47ccc3764de2e1bddd7d924808a399";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.site (redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
0	en_US	6	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.site_settings (setting_name, locale, setting_value) FROM stdin;
contactEmail	en_US	pkpadmin@mailinator.com
contactName	en_US	Open Preprint Systems
contactName	fr_CA	Open Preprint Systems
themePluginPath		default
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
1	1	4	7	2021-10-22 21:00:36	0	1
2	1	3	5	2021-10-22 21:00:50	0	1
3	1	3	4	2021-10-22 21:00:50	0	1
4	2	4	8	2021-10-22 21:00:57	0	1
5	2	3	5	2021-10-22 21:01:11	0	1
6	2	3	4	2021-10-22 21:01:11	0	1
7	3	4	9	2021-10-22 21:01:24	0	1
8	3	3	5	2021-10-22 21:01:41	0	1
9	3	3	4	2021-10-22 21:01:41	0	1
10	4	4	10	2021-10-22 21:01:53	0	1
11	4	3	5	2021-10-22 21:02:06	0	1
12	4	3	4	2021-10-22 21:02:06	0	1
13	5	4	11	2021-10-22 21:02:19	0	1
14	5	3	5	2021-10-22 21:02:33	0	1
15	5	3	4	2021-10-22 21:02:33	0	1
16	6	4	12	2021-10-22 21:02:45	0	1
17	6	3	5	2021-10-22 21:02:59	0	1
18	6	3	4	2021-10-22 21:02:59	0	1
19	7	4	13	2021-10-22 21:03:11	0	1
20	7	3	5	2021-10-22 21:03:28	0	1
21	7	3	4	2021-10-22 21:03:28	0	1
22	8	4	14	2021-10-22 21:03:41	0	1
23	8	3	5	2021-10-22 21:03:54	0	1
24	8	3	4	2021-10-22 21:03:54	0	1
25	9	4	15	2021-10-22 21:04:07	0	1
26	9	3	5	2021-10-22 21:04:21	0	1
27	9	3	4	2021-10-22 21:04:21	0	1
28	10	4	16	2021-10-22 21:04:34	0	1
29	10	3	5	2021-10-22 21:04:47	0	1
30	10	3	4	2021-10-22 21:04:47	0	1
31	11	4	17	2021-10-22 21:05:00	0	1
32	11	3	5	2021-10-22 21:05:17	0	1
33	11	3	4	2021-10-22 21:05:17	0	1
34	12	4	18	2021-10-22 21:05:30	0	1
35	12	3	5	2021-10-22 21:05:44	0	1
36	12	3	4	2021-10-22 21:05:44	0	1
37	13	4	19	2021-10-22 21:05:58	0	1
38	13	3	5	2021-10-22 21:06:12	0	1
39	13	3	4	2021-10-22 21:06:12	0	1
40	14	4	20	2021-10-22 21:06:27	0	1
41	14	3	5	2021-10-22 21:06:41	0	1
42	14	3	4	2021-10-22 21:06:41	0	1
43	15	4	21	2021-10-22 21:06:54	0	1
44	15	3	5	2021-10-22 21:07:07	0	1
45	15	3	4	2021-10-22 21:07:07	0	1
46	16	4	22	2021-10-22 21:07:20	0	1
47	16	3	5	2021-10-22 21:07:34	0	1
48	16	3	4	2021-10-22 21:07:34	0	1
49	17	4	23	2021-10-22 21:07:48	0	1
50	17	3	5	2021-10-22 21:08:02	0	1
51	17	3	4	2021-10-22 21:08:02	0	1
52	18	4	24	2021-10-22 21:08:15	0	1
53	18	3	5	2021-10-22 21:08:28	0	1
54	18	3	4	2021-10-22 21:08:28	0	1
55	19	4	25	2021-10-22 21:08:41	0	1
56	19	3	5	2021-10-22 21:08:55	0	1
57	19	3	4	2021-10-22 21:08:55	0	1
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 57, true);


--
-- Data for Name: subeditor_submission_group; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.subeditor_submission_group (context_id, assoc_id, user_id, assoc_type) FROM stdin;
1	1	5	530
1	1	4	530
\.


--
-- Data for Name: submission_artwork_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_artwork_files (file_id, revision, caption, credit, copyright_owner, copyright_owner_contact, permission_terms, permission_file_id, chapter_id, contact_author) FROM stdin;
\.


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
\.


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 1, false);


--
-- Data for Name: submission_file_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	ccorino, The influence of lactation on the quantity and quality of cashmere production.pdf	string
1	fr_CA	name		string
2	en_US	name	ckwantes, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
2	fr_CA	name		string
3	en_US	name	cmontgomerie, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
3	fr_CA	name		string
4	en_US	name	ddiouf, Genetic transformation of forest trees.pdf	string
4	fr_CA	name		string
5	en_US	name	dphillips, Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
5	fr_CA	name		string
6	en_US	name	dsokoloff, Developing efficacy beliefs in the classroom.pdf	string
6	fr_CA	name		string
7	en_US	name	eostrom, Traditions and Trends in the Study of the Commons.pdf	string
7	fr_CA	name		string
8	en_US	name	fpaglieri, Hansen & Pinto: Reason Reclaimed.pdf	string
8	fr_CA	name		string
9	en_US	name	jmwandenga, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
9	fr_CA	name		string
10	en_US	name	jnovak, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
10	fr_CA	name		string
11	en_US	name	kalkhafaji, Learning Sustainable Design through Service.pdf	string
11	fr_CA	name		string
12	en_US	name	lchristopher, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
12	fr_CA	name		string
13	en_US	name	lkumiega, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
13	fr_CA	name		string
14	en_US	name	pdaniel, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
14	fr_CA	name		string
15	en_US	name	rbaiyewu, Yam diseases and its management in Nigeria.pdf	string
15	fr_CA	name		string
16	en_US	name	rrossi, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
16	fr_CA	name		string
17	en_US	name	vkarbasizaed, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf	string
17	fr_CA	name		string
18	en_US	name	vwilliamson, Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
18	fr_CA	name		string
19	en_US	name	zwoods, Finocchiaro: Arguments About Arguments.pdf	string
19	fr_CA	name		string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_files (file_id, revision, source_file_id, source_revision, submission_id, file_type, genre_id, file_size, original_file_name, file_stage, direct_sales_price, sales_type, viewable, date_uploaded, date_modified, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	\N	\N	1	application/pdf	1	14572	The influence of lactation on the quantity and quality of cashmere production.pdf	10	\N	\N	0	2021-10-22 21:00:43	2021-10-22 21:00:43	7	521	1
2	1	\N	\N	2	application/pdf	1	14572	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	10	\N	\N	0	2021-10-22 21:01:04	2021-10-22 21:01:04	8	521	2
3	1	\N	\N	3	application/pdf	1	14572	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	10	\N	\N	0	2021-10-22 21:01:31	2021-10-22 21:01:31	9	521	3
4	1	\N	\N	4	application/pdf	1	14572	Genetic transformation of forest trees.pdf	10	\N	\N	0	2021-10-22 21:02:01	2021-10-22 21:02:01	10	521	4
5	1	\N	\N	5	application/pdf	1	14572	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	10	\N	\N	0	2021-10-22 21:02:27	2021-10-22 21:02:27	11	521	5
6	1	\N	\N	6	application/pdf	1	14572	Developing efficacy beliefs in the classroom.pdf	10	\N	\N	0	2021-10-22 21:02:53	2021-10-22 21:02:53	12	521	6
7	1	\N	\N	7	application/pdf	1	14572	Traditions and Trends in the Study of the Commons.pdf	10	\N	\N	0	2021-10-22 21:03:19	2021-10-22 21:03:19	13	521	7
8	1	\N	\N	8	application/pdf	1	14572	Hansen & Pinto: Reason Reclaimed.pdf	10	\N	\N	0	2021-10-22 21:03:49	2021-10-22 21:03:49	14	521	8
9	1	\N	\N	9	application/pdf	1	14572	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	10	\N	\N	0	2021-10-22 21:04:15	2021-10-22 21:04:15	15	521	9
10	1	\N	\N	10	application/pdf	1	14572	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	10	\N	\N	0	2021-10-22 21:04:41	2021-10-22 21:04:41	16	521	10
11	1	\N	\N	11	application/pdf	1	14572	Learning Sustainable Design through Service.pdf	10	\N	\N	0	2021-10-22 21:05:08	2021-10-22 21:05:08	17	521	11
12	1	\N	\N	12	application/pdf	1	14572	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	10	\N	\N	0	2021-10-22 21:05:38	2021-10-22 21:05:38	18	521	12
13	1	\N	\N	13	application/pdf	1	14572	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	10	\N	\N	0	2021-10-22 21:06:05	2021-10-22 21:06:05	19	521	13
14	1	\N	\N	14	application/pdf	1	14572	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	10	\N	\N	0	2021-10-22 21:06:34	2021-10-22 21:06:34	20	521	14
15	1	\N	\N	15	application/pdf	1	14572	Yam diseases and its management in Nigeria.pdf	10	\N	\N	0	2021-10-22 21:07:02	2021-10-22 21:07:02	21	521	15
16	1	\N	\N	16	application/pdf	1	14572	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	10	\N	\N	0	2021-10-22 21:07:28	2021-10-22 21:07:28	22	521	16
17	1	\N	\N	17	application/pdf	1	14572	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf	10	\N	\N	0	2021-10-22 21:07:55	2021-10-22 21:07:55	23	521	17
18	1	\N	\N	18	application/pdf	1	14572	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	10	\N	\N	0	2021-10-22 21:08:22	2021-10-22 21:08:22	24	521	18
19	1	\N	\N	19	application/pdf	1	14572	Finocchiaro: Arguments About Arguments.pdf	10	\N	\N	0	2021-10-22 21:08:49	2021-10-22 21:08:49	25	521	19
\.


--
-- Name: submission_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_files_file_id_seq', 19, true);


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	catherine
2	kwantes
3	university
4	windsor
5	facets
6	job
7	satisfaction
8	nine-nation
9	comparative
10	study
11	construct
12	equivalence
13	archival
14	data
15	attitude
16	survey
17	employees
18	single
19	multinational
20	organization
21	examine
22	degree
23	national
24	culture
25	affects
26	nature
27	responses
28	countries
29	compiled
30	create
31	benchmark
32	nations
33	individually
34	compared
35	factor
36	analysis
37	revealed
38	factors
39	organizational
40	communication
41	efficiency
42	effectiveness
43	support
44	personal
45	benefit
46	comparisons
47	structures
48	exhibited
49	satisfied
50	china
51	brazil
52	consistent
53	previous
54	findings
55	individuals
56	collectivistic
57	report
58	higher
59	research
60	suggest
61	cultural
62	context
63	exerts
64	effect
65	craig
66	montgomerie
67	alberta
68	mark
69	irvine
70	victoria
71	computer
72	skill
73	requirements
74	existing
75	teachers
76	implications
77	policy
78	practice
79	integration
80	technology
81	classroom
82	major
83	issue
84	education
85	today
86	provincial
87	initiatives
88	skills
89	students
90	demonstrate
91	grade
92	level
93	government
94	province
95	canada
96	mandated
97	implementation
98	curriculum
99	began
100	september
101	called
102	information
103	infused
104	core
105	courses
106	specifies
107	“expected
108	respect
109	technology”
110	learning
111	required
112	implement
113	school
114	jurisdictions
115	turning
116	professional
117	development
118	strategies
119	hiring
120	standards
121	upgrade
122	teachers’
123	meet
124	goal
125	paper
126	summarizes
127	results
128	telephone
129	administered
130	public
131	response
132	rate
133	examined
134	require
135	newly
136	hired
137	employed
138	diaga
139	diouf
140	alexandria
141	genetic
142	transformation
143	forest
144	trees
145	review
146	recent
147	progress
148	discussed
149	applications
150	engineering
151	improving
152	understanding
153	mechanisms
154	governing
155	genes
156	expression
157	woody
158	plants
159	dana
160	phillips
161	toronto
162	investigating
163	shared
164	background
165	argument
166	critique
167	fogelins
168	thesis
169	deep
170	disagreement
171	robert
172	fogelin
173	claims
174	interlocutors
175	share
176	framework
177	beliefs
178	commitments
179	order
180	fruitfully
181	pursue
182	refute
183	fogelin’s
184	claim
185	productive
186	find
187	consists
188	common
189	topic
190	hand
191	pro-cedural
192	competencies
193	supporters
194	mistakenly
195	view
196	part
197	procedural
198	com-mitments
199	difficult
200	uphold
201	people’s
202	diverge
203	widely
204	domatilia
205	sokoloff
206	college
207	cork
208	developing
209	efficacy
210	equip
211	children
212	knowledge
213	self-belief
214	confident
215	informed
216	citizens
217	continue
218	learners
219	graduation
220	key
221	role
222	nurturing
223	learn
224	participate
225	society
226	conducted
227	social
228	studies
229	presented
230	showing
231	strategy
232	instruction
233	enhance
234	self-efficacy
235	creative
236	problem
237	solving
238	cps
239	taught
240	means
241	motivate
242	shown
243	positive
244	effects
245	valuable
246	involve
247	decision-making
248	leads
249	action
250	enhancing
251	motivation
252	elinor
253	ostrom
254	indiana
255	frank
256	van
257	laerhoven
258	traditions
259	trends
260	commons
261	expe-
262	rienced
263	substantial
264	growth
265	past
266	decades1
267	distinguished
268	scholars
269	disciplines
270	long
271	studied
272	specific
273	resources
274	managed
275	mismanaged
276	times
277	places
278	coward
279	los
280	reyes
281	mackenzie
282	wittfogel
283	researchers
284	mid-1980s
285	contemporary
286	colleagues
287	work
288	sec-
289	tors
290	region
291	interest
292	regions
293	world
294	fabio
295	paglieri
296	rome
297	hansen
298	pinto
299	reason
300	reclaimed
301	john
302	mwandenga
303	cape
304	town
305	signalling
306	theory
307	dividends
308	literature
309	empirical
310	evidence
311	signaling
312	suggests
313	signal
314	future
315	prospects
316	firm
317	offer
318	conclusive
319	conflicting
320	financial
321	economists
322	practical
323	dividend
324	guidance
325	management
326	potential
327	investors
328	shareholding
329	corporate
330	investment
331	financing
332	distribution
333	decisions
334	continuous
335	function
336	rely
337	intuitive
338	evaluation
339	novak
340	aalborg
341	condensing
342	water
343	availability
344	models
345	focus
346	systems
347	texas
348	modeling
349	system
350	routinely
351	applied
352	administration
353	rights
354	permit
355	regional
356	statewide
357	planning
358	expanding
359	variety
360	endeavors
361	river
362	basins
363	state
364	reflects
365	permits
366	reservoirs
367	datasets
368	necessarily
369	large
370	complex
371	provide
372	decision-support
373	capabilities
374	developed
375	features
376	added
377	types
378	growing
379	enhanced
380	simplifying
381	simulation
382	input
383	methodology
384	condensed
385	dataset
386	selected
387	reservoir
388	impacts
389	accompanying
390	removed
391	original
392	complete
393	set
394	streamflows
395	represents
396	flows
397	basin
398	contained
399	model
400	included
401	develop
402	brazos
403	authority
404	based
405	modifying
406	karim
407	al-khafaji
408	stanford
409	margaret
410	morse
411	sustainable
412	design
413	service
414	environmental
415	sustainability
416	principles
417	vital
418	topics
419	largely
420	failed
421	address
422	service-learning
423	integrates
424	academic
425	setting
426	emerging
427	tool
428	leveraged
429	teach
430	engineers
431	present
432	experiences
433	chapter
434	involves
435	identification
436	projects
437	partner
438	organizations
439	student
440	led
441	project-based
442	internships
443	coordinated
444	successful
445	limitations
446	challenges
447	exist
448	directions
449	leo
450	christopher
451	australian
452	sodium
453	butyrate
454	improves
455	performance
456	weaned
457	piglets
458	period
459	weaning
460	aim
461	assess
462	influence
463	long-term
464	fat
465	supplementation
466	fatty
467	acid
468	profile
469	heavy
470	pig
471	adipose
472	tissue
473	fifty-four
474	white
475	barrows
476	averaging
477	randomized
478	matched
479	weights
480	isoenergetic
481	diets
482	supplemented
483	tallow
484	maize
485	oil
486	rapeseed
487	fats
488	supplement-
489	fed
490	slaughtering
491	slaughter
492	backfat
493	samples
494	collected
495	ten
496	animals
497	treatment
498	analyzed
499	composition
500	close-
501	reflected
502	pigs
503	highest
504	saturated
505	content
506	sfa
507	polyunsaturated
508	pufa
509	lowest
510	monounsaturated
511	mufa
512	linolenic
513	c18
514	cis
515	11-
516	ecosenoic
517	c20
518	linoleic
519	levels
520	iodine
521	result-
522	ing
523	accepted
524	parma
525	consortium
526	dry-cured
527	ham
528	unsaturation
529	index
530	layers
531	subcutaneous
532	differed
533	significantly
534	treatments
535	show
536	dietary
537	increases
538	proportion
539	“healthy”
540	acids
541	nutritional
542	quality
543	technological
544	carefully
545	assessed
546	lise
547	kumiega
548	hydrologic
549	connectivity
550	edwards
551	aquifer
552	san
553	marcos
554	springs
555	barton
556	drought
557	conditions
558	serves
559	primary
560	supply
561	south-central
562	source
563	plan
564	protect
565	endangered
566	species
567	immediately
568	downstream
569	questions
570	raised
571	established
572	concept
573	divide
574	antonio
575	segments
576	water-level
577	collection
578	program
579	hydrogeologic
580	groundwater-level
581	groundwater
582	exists
583	vicinity
584	surface
585	drainage
586	onion
587	creek
588	blanco
589	wet
590	normal
591	dissipated
592	longer
593	hydrologically
594	separated
595	result
596	flow
597	droughts
598	bearings
599	assessments
600	simulations
601	numerical
602	cfs
603	flowing
604	appears
605	influenced
606	recharge
607	vulnerable
608	extended
609	periods
610	extensive
611	pumping
612	kyle
613	buda
614	shows
615	low
616	gradient
617	potentiometric
618	variation
619	non-drought
620	slopes
621	north
622	dramatic
623	discontinuity
624	change
625	gradients
626	dynamic
627	unknown
628	structural
629	influences
630	hydraulic
631	properties
632	inherent
633	connection
634	rapid
635	population
636	increased
637	demands
638	areas
639	necessitates
640	continual
641	monitoring
642	trend
643	analyses
644	patricia
645	daniel
646	wolverhampton
647	designing
648	intercultural
649	case
650	atlantic
651	coast
652	nicaragua
653	met
654	21st
655	century
656	genuinely
657	embracing
658	diversity
659	overcome
660	barriers
661	people
662	basis
663	language
664	gender
665	takes
666	multilingual
667	multiethnic
668	examines
669	community
670	uraccan
671	contributing
672	interculturality
673	describes
674	participatory
675	carried
676	staff
677	intention
678	defining
679	delivering
680	discussions
681	wales
682	council
683	emphasises
684	belonging
685	individual
686	communities
687	cultures
688	time
689	supporting
690	include
691	university’s
692	close
693	involvement
694	ethnic
695	ethno-linguistic
696	power
697	relations
698	country
699	militate
700	egalitarianism
701	highlights
702	importance
703	pedagogy
704	promoting
705	achieving
706	lasting
707	rana
708	baiyewu
709	nairobi
710	yam
711	diseases
712	nigeria
713	presents
714	combating
715	menace
716	field
717	storage
718	anthracnose
719	regarded
720	spread
721	mosaic
722	virus
723	disease
724	considered
725	severe
726	losses
727	yams
728	dry
729	rot
730	devastating
731	marked
732	reduction
733	quantity
734	marketable
735	edible
736	portions
737	tubers
738	reductions
739	stored
740	adopted
741	advocated
742	includes
743	crop
744	rotation
745	fallowing
746	planting
747	healthy
748	material
749	destruction
750	infected
751	cultivars
752	resistant
753	tecto
754	thiabendazole
755	locally
756	made
757	gins
758	wood
759	ash
760	found
761	fungal
762	infection
763	finally
764	processing
765	chips
766	cubes
767	shelf
768	live
769	months
770	year
771	rosanna
772	rossi
773	barcelona
774	nutrition
775	general
776	situation
777	cattle
778	slaughtered
779	cameroon
780	representative
781	central
782	african
783	sub-region
784	safety
785	beef
786	abattoir
787	yaoundé
788	largest
789	january
790	march
791	pre-slaughter
792	characteristics
793	carcasses
794	recorded
795	longissimus
796	thoracis
797	represent
798	bulls
799	parameters
800	origin
801	guinea
802	high
803	savannah
804	transhumance
805	production
806	gudali
807	fulani
808	red
809	mbororo
810	breeds
811	predominant
812	carcass
813	weight
814	affected
815	rearing
816	category
817	markedly
818	varied
819	meat
820	similar
821	showed
822	toughest
823	cows
824	pregnant
825	abnormal
826	encountered
827	ectoparasites
828	fatigue
829	lameness
830	fungal-like
831	skin
832	lesions
833	enlarged
834	lymph
835	nodes
836	respiratory
837	distress
838	nodular
839	organs
840	condemned
841	liver
842	flukes
843	completely
844	due
845	tuberculosis
846	lungs
847	aid
848	authorities
849	draw
850	programmes
851	strengthen
852	improve
853	control
854	prevent
855	observed
856	promote
857	trade
858	vajiheh
859	karbasizaed
860	tehran
861	antimicrobial
862	metal
863	resistance
864	plasmid
865	coliforms
866	isolated
867	nosocomial
868	infections
869	hospital
870	isfahan
871	iran
872	patterns
873	profiles
874	enterobacteriacea
875	human
876	faeces
877	fifteen
878	isolates
879	identified
880	escherichia
881	coli
882	remaining
883	kelebsiella
884	pneumoniae
885	seventy
886	percent
887	strains
888	possess
889	multiple
890	antibiotics
891	difference
892	minimal
893	inhibitory
894	concentration
895	mic
896	values
897	clinical
898	cases
899	metals
900	significant
901	tolerant
902	persons
903	relationship
904	group
905	pattern
906	conjugative
907	encoding
908	recovered
909	multidrug-resistance
910	valerie
911	williamson
912	self-organization
913	multi-level
914	institutions
915	networked
916	environments
917	compare
918	actors
919	decide
920	sanction
921	sanctions
922	implemented
923	collectively
924	agree
925	actor
926	sanctioned
927	collective
928	sanctioning
929	problematic
930	difficulty
931	reaching
932	consensus
933	decision
934	perverse
935	punishing
936	contributors
937	ruled
938	zita
939	woods
940	cuny
941	finocchiaro
942	arguments
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 942, true);


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_object_keywords (object_id, keyword_id, pos) FROM stdin;
1	1	0
1	2	1
1	3	2
1	4	3
2	5	0
2	6	1
2	7	2
2	8	3
2	9	4
2	10	5
2	11	6
2	12	7
3	13	0
3	14	1
3	15	2
3	16	3
3	17	4
3	18	5
3	19	6
3	20	7
3	21	8
3	22	9
3	23	10
3	24	11
3	25	12
3	26	13
3	6	14
3	7	15
3	27	16
3	28	17
3	29	18
3	30	19
3	31	20
3	32	21
3	33	22
3	34	23
3	35	24
3	36	25
3	37	26
3	38	27
3	39	28
3	40	29
3	39	30
3	41	31
3	42	32
3	39	33
3	43	34
3	44	35
3	45	36
3	46	37
3	35	38
3	47	39
3	39	40
3	40	41
3	48	42
3	11	43
3	12	44
3	44	45
3	45	46
3	49	47
3	17	48
3	50	49
3	49	50
3	51	51
3	52	52
3	53	53
3	54	54
3	55	55
3	56	56
3	32	57
3	57	58
3	58	59
3	7	60
3	59	61
3	54	62
3	60	63
3	23	64
3	61	65
3	62	66
3	63	67
3	64	68
3	26	69
3	6	70
3	7	71
8	65	0
8	66	1
8	3	2
8	67	3
8	68	4
8	69	5
8	3	6
8	70	7
9	71	0
9	72	1
9	73	2
9	74	3
9	75	4
9	76	5
9	77	6
9	78	7
10	79	0
10	80	1
10	81	2
10	82	3
10	83	4
10	84	5
10	85	6
10	23	7
10	86	8
10	87	9
10	80	10
10	88	11
10	89	12
10	90	13
10	91	14
10	92	15
10	93	16
10	94	17
10	67	18
10	95	19
10	96	20
10	97	21
10	98	22
10	99	23
10	100	24
10	101	25
10	102	26
10	40	27
10	80	28
10	98	29
10	103	30
10	104	31
10	105	32
10	106	33
10	89	34
10	107	35
10	108	36
10	109	37
10	67	38
10	110	39
10	75	40
10	111	41
10	112	42
10	98	43
10	113	44
10	114	45
10	115	46
10	116	47
10	117	48
10	118	49
10	119	50
10	120	51
10	121	52
10	122	53
10	71	54
10	88	55
10	123	56
10	124	57
10	125	58
10	126	59
10	127	60
10	128	61
10	16	62
10	129	63
10	130	64
10	113	65
10	114	66
10	94	67
10	67	68
10	131	69
10	132	70
10	133	71
10	71	72
10	88	73
10	113	74
10	114	75
10	134	76
10	135	77
10	136	78
10	75	79
10	43	80
10	118	81
10	137	82
10	137	83
10	75	84
15	138	0
15	139	1
15	140	2
15	3	3
16	141	0
16	142	1
16	143	2
16	144	3
17	145	0
17	146	1
17	147	2
17	141	3
17	142	4
17	143	5
17	144	6
17	148	7
17	149	8
17	141	9
17	150	10
17	151	11
17	143	12
17	144	13
17	152	14
17	153	15
17	154	16
17	155	17
17	156	18
17	157	19
17	158	20
22	159	0
22	160	1
22	3	2
22	161	3
23	162	0
23	163	1
23	164	2
23	111	3
23	165	4
23	166	5
23	167	6
23	168	7
23	169	8
23	170	9
24	171	0
24	172	1
24	173	2
24	174	3
24	175	4
24	176	5
24	164	6
24	177	7
24	178	8
24	179	9
24	180	10
24	181	11
24	165	12
24	182	13
24	183	14
24	184	15
24	162	16
24	163	17
24	164	18
24	111	19
24	185	20
24	165	21
24	186	22
24	164	23
24	187	24
24	188	25
24	177	26
24	189	27
24	190	28
24	163	29
24	191	30
24	178	31
24	192	32
24	60	33
24	172	34
24	193	35
24	194	36
24	195	37
24	163	38
24	177	39
24	196	40
24	111	41
24	164	42
24	185	43
24	165	44
24	197	45
24	198	46
24	199	47
24	200	48
24	201	49
24	177	50
24	202	51
24	203	52
24	189	53
24	190	54
29	204	0
29	205	1
29	3	2
29	206	3
29	207	4
30	208	0
30	209	1
30	177	2
30	81	3
31	82	0
31	124	1
31	84	2
31	210	3
31	211	4
31	212	5
31	88	6
31	213	7
31	214	8
31	215	9
31	216	10
31	216	11
31	217	12
31	218	13
31	219	14
31	125	15
31	220	16
31	221	17
31	222	18
31	209	19
31	177	20
31	179	21
31	223	22
31	224	23
31	113	24
31	225	25
31	59	26
31	54	27
31	226	28
31	227	29
31	228	30
31	62	31
31	229	32
31	230	33
31	231	34
31	232	35
31	233	36
31	234	37
31	110	38
31	196	39
31	59	40
31	235	41
31	236	42
31	237	43
31	238	44
31	239	45
31	211	46
31	240	47
31	241	48
31	43	49
31	110	50
31	242	51
31	238	52
31	243	53
31	244	54
31	234	55
31	110	56
31	245	57
31	176	58
31	246	59
31	211	60
31	247	61
31	248	62
31	227	63
31	249	64
31	76	65
31	250	66
31	234	67
31	251	68
31	223	69
31	81	70
31	148	71
36	252	0
36	253	1
36	254	2
36	3	3
36	255	4
36	256	5
36	257	6
36	254	7
36	3	8
37	258	0
37	259	1
37	10	2
37	260	3
38	10	0
38	260	1
38	261	2
38	262	3
38	263	4
38	264	5
38	117	6
38	265	7
38	266	8
38	267	9
38	268	10
38	269	11
38	270	12
38	271	13
38	272	14
38	273	15
38	274	16
38	275	17
38	276	18
38	277	19
38	278	20
38	279	21
38	280	22
38	281	23
38	282	24
38	283	25
38	271	26
38	272	27
38	260	28
38	284	29
38	285	30
38	286	31
38	215	32
38	287	33
38	268	34
38	269	35
38	288	36
38	289	37
38	290	38
38	291	39
38	292	40
38	293	41
43	294	0
43	295	1
43	3	2
43	296	3
44	297	0
44	298	1
44	299	2
44	300	3
50	301	0
50	302	1
50	3	2
50	303	3
50	304	4
51	305	0
51	306	1
51	307	2
51	145	3
51	308	4
51	309	5
51	310	6
52	311	0
52	306	1
52	312	2
52	307	3
52	313	4
52	314	5
52	315	6
52	316	7
52	146	8
52	309	9
52	310	10
52	317	11
52	318	12
52	310	13
52	83	14
52	319	15
52	77	16
52	76	17
52	320	18
52	321	19
52	322	20
52	323	21
52	77	22
52	324	23
52	325	24
52	74	25
52	326	26
52	327	27
52	328	28
52	329	29
52	330	30
52	331	31
52	332	32
52	333	33
52	334	34
52	335	35
52	325	36
52	323	37
52	333	38
52	336	39
52	337	40
52	338	41
57	301	0
57	339	1
57	340	2
57	3	3
58	341	0
58	342	1
58	343	2
58	344	3
58	345	4
58	272	5
58	342	6
58	325	7
58	346	8
59	347	0
59	342	1
59	343	2
59	348	3
59	349	4
59	350	5
59	351	6
59	352	7
59	342	8
59	353	9
59	354	10
59	349	11
59	355	12
59	356	13
59	357	14
59	358	15
59	359	16
59	360	17
59	348	18
59	342	19
59	325	20
59	361	21
59	362	22
59	363	23
59	364	24
59	342	25
59	365	26
59	366	27
59	367	28
59	368	29
59	369	30
59	370	31
59	371	32
59	372	33
59	373	34
59	348	35
59	349	36
59	374	37
59	348	38
59	375	39
59	376	40
59	377	41
59	149	42
59	378	43
59	149	44
59	379	45
59	380	46
59	381	47
59	382	48
59	367	49
59	345	50
59	342	51
59	325	52
59	346	53
59	383	54
59	229	55
59	208	56
59	384	57
59	385	58
59	386	59
59	387	60
59	349	61
59	364	62
59	388	63
59	342	64
59	353	65
59	389	66
59	366	67
59	390	68
59	391	69
59	392	70
59	385	71
59	393	72
59	394	73
59	374	74
59	395	75
59	396	76
59	386	77
59	349	78
59	244	79
59	342	80
59	353	81
59	361	82
59	397	83
59	398	84
59	391	85
59	392	86
59	399	87
59	382	88
59	385	89
59	400	90
59	384	91
59	385	92
59	383	93
59	351	94
59	401	95
59	384	96
59	399	97
59	402	98
59	361	99
59	403	100
59	387	101
59	349	102
59	404	103
59	405	104
59	347	105
59	342	106
59	343	107
59	348	108
59	349	109
59	385	110
59	402	111
59	361	112
59	397	113
64	406	0
64	407	1
64	408	2
64	3	3
64	409	4
64	410	5
64	408	6
64	3	7
65	110	0
65	411	1
65	412	2
65	413	3
66	414	0
66	415	1
66	411	2
66	117	3
66	416	4
66	417	5
66	418	6
66	150	7
66	84	8
66	419	9
66	420	10
66	421	11
66	422	12
66	423	13
66	227	14
66	413	15
66	424	16
66	425	17
66	426	18
66	427	19
66	428	20
66	429	21
66	411	22
66	412	23
66	314	24
66	430	25
66	431	26
66	399	27
66	422	28
66	429	29
66	411	30
66	412	31
66	404	32
66	432	33
66	408	34
66	433	35
66	430	36
66	411	37
66	293	38
66	399	39
66	434	40
66	435	41
66	436	42
66	437	43
66	438	44
66	439	45
66	440	46
66	441	47
66	412	48
66	442	49
66	443	50
66	437	51
66	438	52
66	399	53
66	444	54
66	445	55
66	446	56
66	447	57
66	148	58
66	314	59
66	448	60
66	358	61
66	399	62
71	449	0
71	450	1
71	451	2
71	23	3
71	3	4
72	452	0
72	453	1
72	454	2
72	264	3
72	455	4
72	456	5
72	457	6
72	458	7
72	459	8
73	460	0
73	10	1
73	461	2
73	462	3
73	463	4
73	464	5
73	465	6
73	466	7
73	467	8
73	468	9
73	469	10
73	470	11
73	471	12
73	472	13
73	473	14
73	369	15
73	474	16
73	475	17
73	476	18
73	477	19
73	478	20
73	479	21
73	480	22
73	481	23
73	482	24
73	483	25
73	484	26
73	485	27
73	486	28
73	485	29
73	487	30
73	488	31
73	489	32
73	490	33
73	491	34
73	492	35
73	493	36
73	494	37
73	495	38
73	496	39
73	497	40
73	498	41
73	466	42
73	467	43
73	499	44
73	492	45
73	500	46
73	501	47
73	466	48
73	467	49
73	499	50
73	482	51
73	487	52
73	492	53
73	502	54
73	489	55
73	503	56
73	504	57
73	466	58
73	467	59
73	505	60
73	506	61
73	489	62
73	503	63
73	505	64
73	507	65
73	466	66
73	467	67
73	508	68
73	509	69
73	510	70
73	466	71
73	467	72
73	511	73
73	505	74
73	489	75
73	503	76
73	505	77
73	512	78
73	467	79
73	513	80
73	514	81
73	515	82
73	516	83
73	467	84
73	517	85
73	497	86
73	64	87
73	518	88
73	467	89
73	519	90
73	520	91
73	492	92
73	521	93
73	522	94
73	519	95
73	58	96
73	513	97
73	523	98
73	524	99
73	525	100
73	526	101
73	527	102
73	528	103
73	529	104
73	530	105
73	531	106
73	492	107
73	472	108
73	532	109
73	533	110
73	534	111
73	127	112
73	535	113
73	463	114
73	536	115
73	465	116
73	487	117
73	466	118
73	467	119
73	468	120
73	469	121
73	470	122
73	471	123
73	472	124
73	465	125
73	486	126
73	485	127
73	537	128
73	538	129
73	539	130
73	466	131
73	540	132
73	470	133
73	464	134
73	151	135
73	541	136
73	542	137
73	244	138
73	543	139
73	542	140
73	464	141
73	544	142
73	545	143
78	546	0
78	547	1
78	3	2
78	303	3
78	304	4
79	548	0
79	549	1
79	550	2
79	551	3
79	552	4
79	553	5
79	554	6
79	555	7
79	554	8
79	556	9
79	557	10
80	550	0
80	551	1
80	558	2
80	559	3
80	342	4
80	560	5
80	561	6
80	347	7
80	562	8
80	82	9
80	554	10
80	208	11
80	563	12
80	564	13
80	565	14
80	566	15
80	567	16
80	568	17
80	552	18
80	553	19
80	554	20
80	569	21
80	570	22
80	571	23
80	572	24
80	548	25
80	573	26
80	552	27
80	574	28
80	555	29
80	554	30
80	575	31
80	550	32
80	551	33
80	556	34
80	557	35
80	421	36
80	569	37
80	576	38
80	14	39
80	577	40
80	578	41
80	579	42
80	10	43
80	226	44
80	36	45
80	580	46
80	14	47
80	581	48
80	573	49
80	582	50
80	583	51
80	584	52
80	585	53
80	573	54
80	586	55
80	587	56
80	588	57
80	361	58
80	589	59
80	590	60
80	548	61
80	557	62
80	36	63
80	14	64
80	494	65
80	556	66
80	312	67
80	581	68
80	573	69
80	591	70
80	592	71
80	593	72
80	594	73
80	575	74
80	595	75
80	326	76
80	581	77
80	596	78
80	265	79
80	552	80
80	553	81
80	554	82
80	555	83
80	554	84
80	82	85
80	597	86
80	76	87
80	598	88
80	325	89
80	343	90
80	581	91
80	550	92
80	551	93
80	599	94
80	600	95
80	601	96
80	399	97
80	60	98
80	602	99
80	603	100
80	265	101
80	552	102
80	553	103
80	555	104
80	554	105
80	556	106
80	557	107
80	581	108
80	573	109
80	604	110
80	605	111
80	606	112
80	586	113
80	587	114
80	588	115
80	361	116
80	604	117
80	607	118
80	608	119
80	609	120
80	606	121
80	610	122
80	611	123
80	583	124
80	612	125
80	613	126
80	14	127
80	393	128
80	614	129
80	615	130
80	616	131
80	617	132
80	584	133
80	552	134
80	553	135
80	554	136
80	612	137
80	618	138
80	519	139
80	556	140
80	619	141
80	609	142
80	612	143
80	555	144
80	554	145
80	617	146
80	584	147
80	620	148
80	533	149
80	621	150
80	622	151
80	519	152
80	556	153
80	619	154
80	609	155
80	562	156
80	26	157
80	623	158
80	624	159
80	617	160
80	625	161
80	626	162
80	342	163
80	92	164
80	131	165
80	612	166
80	627	167
80	628	168
80	629	169
80	630	170
80	631	171
80	632	172
80	551	173
80	623	174
80	462	175
80	22	176
80	548	177
80	633	178
80	552	179
80	553	180
80	555	181
80	554	182
80	634	183
80	635	184
80	264	185
80	636	186
80	342	187
80	637	188
80	612	189
80	613	190
80	638	191
80	639	192
80	640	193
80	581	194
80	92	195
80	641	196
80	578	197
80	552	198
80	553	199
80	554	200
80	613	201
80	371	202
80	14	203
80	314	204
80	579	205
80	642	206
80	643	207
85	644	0
85	645	1
85	3	2
85	646	3
86	647	0
86	648	1
86	98	2
86	649	3
86	10	4
86	650	5
86	651	6
86	652	7
87	446	0
87	653	1
87	654	2
87	655	3
87	656	4
87	657	5
87	658	6
87	84	7
87	659	8
87	660	9
87	217	10
87	447	11
87	661	12
87	662	13
87	663	14
87	24	15
87	664	16
87	649	17
87	10	18
87	665	19
87	650	20
87	651	21
87	652	22
87	666	23
87	667	24
87	290	25
87	668	26
87	669	27
87	3	28
87	670	29
87	671	30
87	117	31
87	672	32
87	673	33
87	674	34
87	59	35
87	675	36
87	3	37
87	676	38
87	89	39
87	677	40
87	678	41
87	648	42
87	98	43
87	118	44
87	679	45
87	399	46
87	662	47
87	680	48
87	399	49
87	669	50
87	152	51
87	681	52
87	98	53
87	682	54
87	683	55
87	684	56
87	685	57
87	686	58
87	687	59
87	688	60
87	38	61
87	689	62
87	117	63
87	648	64
87	98	65
87	690	66
87	691	67
87	692	68
87	693	69
87	694	70
87	686	71
87	558	72
87	695	73
87	696	74
87	697	75
87	290	76
87	698	77
87	699	78
87	700	79
87	3	80
87	59	81
87	701	82
87	702	83
87	674	84
87	703	85
87	662	86
87	704	87
87	672	88
87	705	89
87	706	90
87	227	91
87	142	92
92	707	0
92	708	1
92	3	2
92	709	3
93	710	0
93	711	1
93	325	2
93	712	3
94	145	0
94	713	1
94	711	2
94	710	3
94	325	4
94	118	5
94	137	6
94	714	7
94	715	8
94	712	9
94	716	10
94	717	11
94	711	12
94	229	13
94	718	14
94	719	15
94	203	16
94	720	17
94	716	18
94	711	19
94	710	20
94	721	21
94	722	22
94	723	23
94	724	24
94	725	25
94	726	26
94	727	27
94	728	28
94	729	29
94	724	30
94	730	31
94	717	32
94	711	33
94	710	34
94	728	35
94	729	36
94	727	37
94	731	38
94	732	39
94	733	40
94	734	41
94	735	42
94	736	43
94	737	44
94	738	45
94	725	46
94	739	47
94	727	48
94	325	49
94	118	50
94	740	51
94	741	52
94	714	53
94	716	54
94	711	55
94	742	56
94	743	57
94	744	58
94	745	59
94	746	60
94	747	61
94	748	62
94	749	63
94	750	64
94	743	65
94	751	66
94	752	67
94	751	68
94	717	69
94	711	70
94	753	71
94	754	72
94	755	73
94	756	74
94	728	75
94	757	76
94	758	77
94	759	78
94	717	79
94	760	80
94	564	81
94	710	82
94	737	83
94	761	84
94	762	85
94	717	86
94	763	87
94	764	88
94	710	89
94	737	90
94	765	91
94	766	92
94	537	93
94	767	94
94	768	95
94	458	96
94	769	97
94	770	98
99	771	0
99	772	1
99	773	2
99	3	3
100	462	0
100	463	1
100	774	2
100	536	3
100	487	4
100	466	5
100	467	6
100	499	7
100	469	8
100	502	9
100	492	10
101	460	0
101	59	1
101	371	2
101	775	3
101	776	4
101	777	5
101	778	6
101	779	7
101	780	8
101	781	9
101	782	10
101	783	11
101	542	12
101	784	13
101	785	14
101	786	15
101	787	16
101	788	17
101	779	18
101	724	19
101	789	20
101	790	21
101	791	22
101	557	23
101	792	24
101	777	25
101	793	26
101	794	27
101	795	28
101	796	29
101	491	30
101	793	31
101	386	32
101	797	33
101	798	34
101	778	35
101	542	36
101	799	37
101	499	38
101	795	39
101	796	40
101	675	41
101	800	42
101	777	43
101	801	44
101	802	45
101	803	46
101	804	47
101	188	48
101	805	49
101	349	50
101	806	51
101	474	52
101	807	53
101	808	54
101	809	55
101	810	56
101	811	57
101	812	58
101	813	59
101	814	60
101	815	61
101	349	62
101	777	63
101	816	64
101	817	65
101	818	66
101	770	67
101	819	68
101	542	69
101	464	70
101	505	71
101	615	72
101	820	73
101	810	74
101	806	75
101	821	76
101	822	77
101	819	78
101	823	79
101	778	80
101	824	81
101	188	82
101	825	83
101	557	84
101	826	85
101	827	86
101	828	87
101	829	88
101	830	89
101	831	90
101	832	91
101	833	92
101	834	93
101	835	94
101	836	95
101	837	96
101	838	97
101	832	98
101	793	99
101	839	100
101	840	101
101	841	102
101	842	103
101	843	104
101	840	105
101	844	106
101	845	107
101	814	108
101	846	109
101	14	110
101	847	111
101	848	112
101	849	113
101	850	114
101	460	115
101	851	116
101	777	117
101	805	118
101	852	119
101	785	120
101	560	121
101	853	122
101	854	123
101	855	124
101	711	125
101	856	126
101	355	127
101	857	128
106	858	0
106	859	1
106	3	2
106	860	3
107	861	0
107	469	1
107	862	2
107	863	3
107	864	4
107	468	5
107	865	6
107	866	7
107	867	8
107	868	9
107	869	10
107	870	11
107	871	12
108	861	0
108	469	1
108	862	2
108	863	3
108	872	4
108	864	5
108	873	6
108	865	7
108	874	8
108	866	9
108	867	10
108	868	11
108	747	12
108	875	13
108	876	14
108	34	15
108	877	16
108	878	17
108	867	18
108	868	19
108	879	20
108	880	21
108	881	22
108	882	23
108	883	24
108	884	25
108	885	26
108	886	27
108	887	28
108	866	29
108	867	30
108	868	31
108	888	32
108	889	33
108	863	34
108	890	35
108	34	36
108	887	37
108	747	38
108	875	39
108	876	40
108	891	41
108	892	42
108	893	43
108	894	44
108	895	45
108	896	46
108	887	47
108	897	48
108	898	49
108	876	50
108	469	51
108	899	52
108	900	53
108	887	54
108	866	55
108	869	56
108	901	57
108	469	58
108	862	59
108	747	60
108	902	61
108	52	62
108	903	63
108	864	64
108	468	65
108	904	66
108	861	67
108	863	68
108	905	69
108	906	70
108	864	71
108	907	72
108	863	73
108	469	74
108	899	75
108	890	76
108	908	77
108	887	78
108	866	79
108	867	80
108	868	81
108	127	82
108	909	83
108	865	84
108	326	85
108	867	86
108	762	87
108	290	88
113	910	0
113	911	1
113	3	2
113	4	3
114	912	0
114	913	1
114	914	2
114	915	3
114	916	4
115	917	0
115	425	1
115	918	2
115	33	3
115	919	4
115	920	5
115	425	6
115	921	7
115	922	8
115	918	9
115	923	10
115	924	11
115	925	12
115	926	13
115	927	14
115	928	15
115	333	16
115	929	17
115	844	18
115	930	19
115	931	20
115	932	21
115	933	22
115	756	23
115	923	24
115	934	25
115	928	26
115	935	27
115	802	28
115	936	29
115	685	30
115	918	31
115	937	32
115	927	33
115	928	34
115	333	35
115	291	36
115	904	37
120	938	0
120	939	1
120	940	2
121	941	0
121	942	1
121	942	2
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
1	2	1	0
2	2	2	0
3	2	4	0
4	2	16	0
5	2	8	0
6	2	32	0
7	2	64	0
8	3	1	0
9	3	2	0
10	3	4	0
11	3	16	0
12	3	8	0
13	3	32	0
14	3	64	0
15	4	1	0
16	4	2	0
17	4	4	0
18	4	16	0
19	4	8	0
20	4	32	0
21	4	64	0
22	5	1	0
23	5	2	0
24	5	4	0
25	5	16	0
26	5	8	0
27	5	32	0
28	5	64	0
29	6	1	0
30	6	2	0
31	6	4	0
32	6	16	0
33	6	8	0
34	6	32	0
35	6	64	0
36	7	1	0
37	7	2	0
38	7	4	0
39	7	16	0
40	7	8	0
41	7	32	0
42	7	64	0
43	8	1	0
44	8	2	0
45	8	4	0
46	8	16	0
47	8	8	0
48	8	32	0
49	8	64	0
50	9	1	0
51	9	2	0
52	9	4	0
53	9	16	0
54	9	8	0
55	9	32	0
56	9	64	0
57	10	1	0
58	10	2	0
59	10	4	0
60	10	16	0
61	10	8	0
62	10	32	0
63	10	64	0
64	11	1	0
65	11	2	0
66	11	4	0
67	11	16	0
68	11	8	0
69	11	32	0
70	11	64	0
71	12	1	0
72	12	2	0
73	12	4	0
74	12	16	0
75	12	8	0
76	12	32	0
77	12	64	0
78	13	1	0
79	13	2	0
80	13	4	0
81	13	16	0
82	13	8	0
83	13	32	0
84	13	64	0
85	14	1	0
86	14	2	0
87	14	4	0
88	14	16	0
89	14	8	0
90	14	32	0
91	14	64	0
92	15	1	0
93	15	2	0
94	15	4	0
95	15	16	0
96	15	8	0
97	15	32	0
98	15	64	0
99	16	1	0
100	16	2	0
101	16	4	0
102	16	16	0
103	16	8	0
104	16	32	0
105	16	64	0
106	17	1	0
107	17	2	0
108	17	4	0
109	17	16	0
110	17	8	0
111	17	32	0
112	17	64	0
113	18	1	0
114	18	2	0
115	18	4	0
116	18	16	0
117	18	8	0
118	18	32	0
119	18	64	0
120	19	1	0
121	19	2	0
122	19	4	0
123	19	16	0
124	19	8	0
125	19	32	0
126	19	64	0
\.


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 126, true);


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: submission_supplementary_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_supplementary_files (file_id, revision) FROM stdin;
\.


--
-- Data for Name: submission_tombstones; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_tombstones (tombstone_id, submission_id, date_deleted, journal_id, section_id, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_tombstones_tombstone_id_seq', 1, false);


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submissions (submission_id, locale, context_id, section_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, status, submission_progress, work_type) FROM stdin;
10	\N	1	\N	10	2021-10-22 21:04:53	2021-10-22 21:04:47	2021-10-22 21:04:47	5	3	0	0
6	\N	1	\N	6	2021-10-22 21:03:04	2021-10-22 21:02:58	2021-10-22 21:02:58	5	3	0	0
1	\N	1	\N	1	2021-10-22 21:00:50	2021-10-22 21:00:49	2021-10-22 21:00:49	5	1	0	0
11	\N	1	\N	11	2021-10-22 21:05:23	2021-10-22 21:05:17	2021-10-22 21:05:17	5	3	0	0
16	\N	1	\N	16	2021-10-22 21:07:41	2021-10-22 21:07:34	2021-10-22 21:07:34	5	3	0	0
2	\N	1	\N	2	2021-10-22 21:01:17	2021-10-22 21:01:11	2021-10-22 21:01:11	5	3	0	0
7	\N	1	\N	7	2021-10-22 21:03:34	2021-10-22 21:03:28	2021-10-22 21:03:28	5	3	0	0
3	\N	1	\N	3	2021-10-22 21:01:47	2021-10-22 21:01:41	2021-10-22 21:01:41	5	3	0	0
12	\N	1	\N	12	2021-10-22 21:05:50	2021-10-22 21:05:44	2021-10-22 21:05:44	5	3	0	0
8	\N	1	\N	8	2021-10-22 21:04:00	2021-10-22 21:03:54	2021-10-22 21:03:54	5	3	0	0
17	\N	1	\N	17	2021-10-22 21:08:08	2021-10-22 21:08:02	2021-10-22 21:08:02	5	3	0	0
4	\N	1	\N	4	2021-10-22 21:02:12	2021-10-22 21:02:06	2021-10-22 21:02:06	5	3	0	0
9	\N	1	\N	9	2021-10-22 21:04:27	2021-10-22 21:04:21	2021-10-22 21:04:21	5	3	0	0
13	\N	1	\N	13	2021-10-22 21:06:19	2021-10-22 21:06:12	2021-10-22 21:06:12	5	3	0	0
5	\N	1	\N	5	2021-10-22 21:02:39	2021-10-22 21:02:33	2021-10-22 21:02:33	5	3	0	0
18	\N	1	\N	18	2021-10-22 21:08:35	2021-10-22 21:08:28	2021-10-22 21:08:28	5	3	0	0
14	\N	1	\N	14	2021-10-22 21:06:47	2021-10-22 21:06:41	2021-10-22 21:06:41	5	3	0	0
19	\N	1	\N	19	2021-10-22 21:09:01	2021-10-22 21:08:55	2021-10-22 21:08:55	5	3	0	0
15	\N	1	\N	15	2021-10-22 21:07:14	2021-10-22 21:07:07	2021-10-22 21:07:07	5	3	0	0
\.


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submissions_submission_id_seq', 19, true);


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
\.


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.temporary_files_file_id_seq', 1, false);


--
-- Data for Name: usage_stats_temporary_records; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.usage_stats_temporary_records (assoc_id, assoc_type, day, entry_time, metric, country_id, region, city, load_id, file_type) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_group_settings (user_group_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Site Admin	string
1	fr_CA	name	##default.groups.name.siteAdmin##	string
2		nameLocaleKey	default.groups.name.manager	string
2		abbrevLocaleKey	default.groups.abbrev.manager	string
3		nameLocaleKey	default.groups.name.sectionEditor	string
3		abbrevLocaleKey	default.groups.abbrev.sectionEditor	string
4		nameLocaleKey	default.groups.name.author	string
4		abbrevLocaleKey	default.groups.abbrev.author	string
5		nameLocaleKey	default.groups.name.reader	string
5		abbrevLocaleKey	default.groups.abbrev.reader	string
2	en_US	name	Preprint Server manager	string
2	en_US	abbrev	PSM	string
3	en_US	name	Moderator	string
3	en_US	abbrev	MOD	string
4	en_US	name	Author	string
4	en_US	abbrev	AU	string
5	en_US	name	Reader	string
5	en_US	abbrev	Read	string
2	fr_CA	name	##default.groups.name.manager##	string
2	fr_CA	abbrev	##default.groups.abbrev.manager##	string
3	fr_CA	name	##default.groups.name.sectionEditor##	string
3	fr_CA	abbrev	##default.groups.abbrev.sectionEditor##	string
4	fr_CA	name	Auteur-e	string
4	fr_CA	abbrev	AU	string
5	fr_CA	name	Lecteur-trice	string
5	fr_CA	abbrev	Lect	string
\.


--
-- Data for Name: user_group_stage; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_group_stage (context_id, user_group_id, stage_id) FROM stdin;
1	2	1
1	2	5
1	3	1
1	3	5
1	4	1
1	4	5
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_groups (user_group_id, context_id, role_id, is_default, show_title, permit_self_registration, permit_metadata_edit) FROM stdin;
1	0	1	1	0	0	0
2	1	16	1	0	0	1
3	1	17	1	0	0	1
4	1	65536	1	0	1	1
5	1	1048576	1	0	1	0
\.


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 5, true);


--
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_interests (user_id, controlled_vocab_entry_id) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_settings (user_id, locale, setting_name, assoc_type, assoc_id, setting_value, setting_type) FROM stdin;
2	fr_CA	affiliation	0	0		string
2	en_US	givenName	0	0	Ramiro	string
2	fr_CA	givenName	0	0		string
2	en_US	familyName	0	0	Vaca	string
2	fr_CA	familyName	0	0		string
2	en_US	preferredPublicName	0	0		string
2	fr_CA	preferredPublicName	0	0		string
2		orcid	0	0		string
4	en_US	biography	0	0		string
4	fr_CA	biography	0	0		string
4	en_US	signature	0	0		string
4	fr_CA	signature	0	0		string
4	en_US	affiliation	0	0	University of Chicago	string
4	fr_CA	affiliation	0	0		string
4	en_US	givenName	0	0	David	string
4	fr_CA	givenName	0	0		string
4	en_US	familyName	0	0	Buskins	string
4	fr_CA	familyName	0	0		string
4	en_US	preferredPublicName	0	0		string
4	fr_CA	preferredPublicName	0	0		string
4		orcid	0	0		string
5	en_US	biography	0	0		string
5	fr_CA	biography	0	0		string
5	en_US	signature	0	0		string
5	fr_CA	signature	0	0		string
5	en_US	affiliation	0	0	University of Toronto	string
5	fr_CA	affiliation	0	0		string
5	en_US	givenName	0	0	Stephanie	string
5	fr_CA	givenName	0	0		string
5	en_US	familyName	0	0	Berardo	string
5	fr_CA	familyName	0	0		string
5	en_US	preferredPublicName	0	0		string
5	fr_CA	preferredPublicName	0	0		string
5		orcid	0	0		string
6	en_US	biography	0	0		string
6	fr_CA	biography	0	0		string
6	en_US	signature	0	0		string
6	fr_CA	signature	0	0		string
6	en_US	affiliation	0	0	Kyoto University	string
6	fr_CA	affiliation	0	0		string
6	en_US	givenName	0	0	Minoti	string
6	fr_CA	givenName	0	0		string
6	en_US	familyName	0	0	Inoue	string
6	fr_CA	familyName	0	0		string
6	en_US	preferredPublicName	0	0		string
6	fr_CA	preferredPublicName	0	0		string
6		orcid	0	0		string
8	en_US	affiliation	0	0	University of Windsor	string
8	en_US	givenName	0	0	Catherine	string
1	en_US	givenName	0	0	admin	string
1	en_US	familyName	0	0	admin	string
7	en_US	affiliation	0	0	University of Bologna	string
7	en_US	givenName	0	0	Carlo	string
7	en_US	familyName	0	0	Corino	string
8	en_US	familyName	0	0	Kwantes	string
3	fr_CA	givenName	0	0		string
3	fr_CA	familyName	0	0		string
3	en_US	preferredPublicName	0	0		string
11	en_US	affiliation	0	0	University of Toronto	string
2	en_US	biography	0	0		string
2	fr_CA	biography	0	0		string
2	en_US	signature	0	0		string
2	fr_CA	signature	0	0		string
2	en_US	affiliation	0	0	Universidad Nacional Autónoma de México	string
10	en_US	affiliation	0	0	Alexandria University	string
10	en_US	givenName	0	0	Diaga	string
10	en_US	familyName	0	0	Diouf	string
3	fr_CA	biography	0	0		string
3	en_US	signature	0	0		string
3	en_US	affiliation	0	0	University of Melbourne	string
9	en_US	affiliation	0	0	University of Alberta	string
9	en_US	givenName	0	0	Craig	string
9	en_US	familyName	0	0	Montgomerie	string
3	en_US	biography	0	0		string
11	en_US	givenName	0	0	Dana	string
3	fr_CA	signature	0	0		string
3	fr_CA	affiliation	0	0		string
11	en_US	familyName	0	0	Phillips	string
3		orcid	0	0		string
12	en_US	affiliation	0	0	University College Cork	string
12	en_US	givenName	0	0	Domatilia	string
12	en_US	familyName	0	0	Sokoloff	string
3	fr_CA	preferredPublicName	0	0		string
13	en_US	affiliation	0	0	Indiana University	string
13	en_US	givenName	0	0	Elinor	string
13	en_US	familyName	0	0	Ostrom	string
3	en_US	familyName	0	0	Barnes	string
14	en_US	givenName	0	0	Fabio	string
14	en_US	familyName	0	0	Paglieri	string
3	en_US	givenName	0	0	Daniel	string
14	en_US	affiliation	0	0	University of Rome	string
15	en_US	affiliation	0	0	University of Cape Town	string
15	en_US	givenName	0	0	John	string
15	en_US	familyName	0	0	Mwandenga	string
16	en_US	affiliation	0	0	Aalborg University	string
16	en_US	givenName	0	0	John	string
16	en_US	familyName	0	0	Novak	string
17	en_US	affiliation	0	0	Stanford University	string
17	en_US	givenName	0	0	Karim	string
17	en_US	familyName	0	0	Al-Khafaji	string
18	en_US	affiliation	0	0	Australian National University	string
18	en_US	givenName	0	0	Leo	string
18	en_US	familyName	0	0	Christopher	string
19	en_US	affiliation	0	0	University of Cape Town	string
19	en_US	givenName	0	0	Lise	string
19	en_US	familyName	0	0	Kumiega	string
20	en_US	affiliation	0	0	University of Wolverhampton	string
20	en_US	givenName	0	0	Patricia	string
20	en_US	familyName	0	0	Daniel	string
21	en_US	affiliation	0	0	University of Nairobi	string
21	en_US	givenName	0	0	Rana	string
21	en_US	familyName	0	0	Baiyewu	string
22	en_US	affiliation	0	0	Barcelona University	string
22	en_US	givenName	0	0	Rosanna	string
22	en_US	familyName	0	0	Rossi	string
23	en_US	affiliation	0	0	University of Tehran	string
23	en_US	givenName	0	0	Vajiheh	string
23	en_US	familyName	0	0	Karbasizaed	string
24	en_US	affiliation	0	0	University of Windsor	string
24	en_US	givenName	0	0	Valerie	string
24	en_US	familyName	0	0	Williamson	string
25	en_US	affiliation	0	0	CUNY	string
25	en_US	givenName	0	0	Zita	string
25	en_US	familyName	0	0	Woods	string
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_user_groups (user_group_id, user_id) FROM stdin;
1	1
2	1
2	2
2	3
3	4
3	5
3	6
5	7
4	7
5	8
4	8
5	9
4	9
5	10
4	10
5	11
4	11
5	12
4	12
5	13
4	13
5	14
4	14
5	15
4	15
5	16
4	16
5	17
4	17
5	18
4	18
5	19
4	19
5	20
4	20
5	21
4	21
5	22
4	22
5	23
4	23
5	24
4	24
5	25
4	25
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.users (user_id, username, password, email, url, phone, mailing_address, billing_address, country, locales, gossip, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help) FROM stdin;
17	kalkhafaji	$2y$10$JGHR7M0KncWiE9cIU2ZOPudJ0VGmkT416100tOLQun..EJU8rOhre	kalkhafaji@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-10-22 21:04:58	\N	2021-10-22 21:04:58	0	\N	\N	0	\N	1
18	lchristopher	$2y$10$FGn2VwIg0sd0jS9rRQ8lTu0zuR4eDOUsiyCe61q6Wgx/nF1If9QV.	lchristopher@mailinator.com	\N	\N	\N	\N	AU		\N	\N	2021-10-22 21:05:28	\N	2021-10-22 21:05:28	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$FC.hu2m9JZQjW2JZBJy4ouPhgdQNKH79UOtog2.KRBhsvxoqihcau	dbuskins@mailinator.com				\N	US		\N	\N	2021-10-22 20:59:39	\N	2021-10-22 20:59:39	0	\N	\N	0	\N	1
5	sberardo	$2y$10$BA38SHZu/zQS3DyKaHDSCuVyxEyAHc8ugcCmKj14vsRDsmssPuaYm	sberardo@mailinator.com				\N	CA		\N	\N	2021-10-22 20:59:45	\N	2021-10-22 20:59:45	0	\N	\N	0	\N	1
6	minoue	$2y$10$RUS7oW5olF8uyWmrhxOa4OjCwSZkyYEq9aI2A7VwVVY6hS24Atfeu	minoue@mailinator.com				\N	JP		\N	\N	2021-10-22 20:59:51	\N	2021-10-22 20:59:51	0	\N	\N	0	\N	1
2	rvaca	$2y$10$C8gwOpT/KrZqlpxFndB1yu2qEquxsNNYtOh7YwqvcddsNvIVHxRUu	rvaca@mailinator.com				\N	MX		\N	\N	2021-10-22 20:59:27	\N	2021-10-22 20:59:58	0	\N	\N	0	\N	1
19	lkumiega	$2y$10$QBctyQV7F62P0.Bq99M5NOjre/G0sxJKezKFv9TABhIoxYprg7GUO	lkumiega@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2021-10-22 21:05:55	\N	2021-10-22 21:05:55	0	\N	\N	0	\N	1
1	admin	$2y$10$Mp8M9jlNDdGRTvaj.fHO3OgFMnTi5BVQ.4gC8bQSOxRqWOJ3xwGNa	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2021-10-22 20:58:36	\N	2021-10-22 21:00:07	0	\N	\N	0	\N	1
7	ccorino	$2y$10$S9b4Qp9OdE4iLoeVUMfAauhRVY1JoaVtNTwwaocnerFxZ38vKMdjm	ccorino@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2021-10-22 21:00:33	\N	2021-10-22 21:00:33	0	\N	\N	0	\N	1
8	ckwantes	$2y$10$0YuZK.0OaWU0tW9CrQdlAOIC1/hgXf6A9q3qXbg3p7Tn3VUsvP5CG	ckwantes@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-10-22 21:00:54	\N	2021-10-22 21:00:54	0	\N	\N	0	\N	1
9	cmontgomerie	$2y$10$sRdNlfXy3j6Api42tOgZ1ehHvYqP8bKwAaorcbnzfXbpbuSLwuaXi	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-10-22 21:01:21	\N	2021-10-22 21:01:21	0	\N	\N	0	\N	1
10	ddiouf	$2y$10$jRbMJsH1IxLCC5CXYL8aeOWiF/g7BkdqOq3vuhcEFKwGT7aj1fF8G	ddiouf@mailinator.com	\N	\N	\N	\N	EG		\N	\N	2021-10-22 21:01:50	\N	2021-10-22 21:01:51	0	\N	\N	0	\N	1
20	pdaniel	$2y$10$dcvuE5cdyWG3MRqmZ1RhL.Qu05lpQktaCMkEZjUjjW7D7F1v.9cOi	pdaniel@mailinator.com	\N	\N	\N	\N	GB		\N	\N	2021-10-22 21:06:24	\N	2021-10-22 21:06:24	0	\N	\N	0	\N	1
11	dphillips	$2y$10$nZ0LcC8POKw9BHdCxv1L0ukdL47IMwN.3hkiYr6gDhwO5SjvYEMrO	dphillips@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-10-22 21:02:16	\N	2021-10-22 21:02:16	0	\N	\N	0	\N	1
12	dsokoloff	$2y$10$OCbApqC/X/.KFOsY0VlgO.X4.wSZiUFDlBoRqyYNrDe0gm0gxCBZW	dsokoloff@mailinator.com	\N	\N	\N	\N	IE		\N	\N	2021-10-22 21:02:43	\N	2021-10-22 21:02:43	0	\N	\N	0	\N	1
13	eostrom	$2y$10$U.LVcnRtO8bZXdJeZVegyuh9SGCuyp9KS2uIIs4GDDUu/1uIzbv06	eostrom@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-10-22 21:03:08	\N	2021-10-22 21:03:08	0	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$ACsSmjKhWWFoBjrUVz9sbuf2EMtMpelNShEr8n/FEH752laTsODq2	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE		\N	\N	2021-10-22 21:06:51	\N	2021-10-22 21:06:51	0	\N	\N	0	\N	1
14	fpaglieri	$2y$10$sf/KTfRf3B7PvPWO6AfpNOYw2fYX6.3dILUR3qVAcTVBw3JkRRJUq	fpaglieri@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2021-10-22 21:03:38	\N	2021-10-22 21:03:38	0	\N	\N	0	\N	1
15	jmwandenga	$2y$10$4Gq4wd/dKwWWsZ4pRipdUuFbA0ug1luvq0RZPGXizoczs4X1QfBrm	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2021-10-22 21:04:04	\N	2021-10-22 21:04:05	0	\N	\N	0	\N	1
16	jnovak	$2y$10$ngXmEdp3QWR2Z1zLyAD75ejv/ulQOK3SkeVEcW7RoPBAlwtrlPuRO	jnovak@mailinator.com	\N	\N	\N	\N	DK		\N	\N	2021-10-22 21:04:31	\N	2021-10-22 21:04:31	0	\N	\N	0	\N	1
22	rrossi	$2y$10$exQ75mRznAx1De8feFD7Gu7g/OUJOoNYJKQaw824L1srxvWESQCgu	rrossi@mailinator.com	\N	\N	\N	\N	ES		\N	\N	2021-10-22 21:07:18	\N	2021-10-22 21:07:18	0	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$OorD/y.Di09RCPJi6UcKvuJh58jP7uzR35IcDgP3OLn.ZASd7.aMa	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR		\N	\N	2021-10-22 21:07:45	\N	2021-10-22 21:07:45	0	\N	\N	0	\N	1
24	vwilliamson	$2y$10$h1tLLySVHrS8Uq42HAk9s.G6sPMaYHsj6ukaO2yiDDGAZrf3x5aVS	vwilliamson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-10-22 21:08:12	\N	2021-10-22 21:08:12	0	\N	\N	0	\N	1
25	zwoods	$2y$10$bnyulffSOMd97iurFufCtOCOp2HPTv/B.jxKZPTbwjaG96.9w15v6	zwoods@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-10-22 21:08:39	\N	2021-10-22 21:08:39	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$E8ak3y33hz6uATHwtf5FNeGQodBNoBFgXlnvJoo3m7y8jXy3k0HL.	dbarnes@mailinator.com				\N	AU		\N	\N	2021-10-22 20:59:33	\N	2021-10-22 21:08:56	0	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2021-10-22 20:58:36	1	plugins.metadata	dc11		0	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.metadata	mods34		0	0
1	0	1	0	2021-10-22 20:58:36	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	2	0	0	2021-10-22 20:58:36	1	plugins.generic	acron	AcronPlugin	1	1
1	0	0	0	2021-10-22 20:58:36	1	plugins.generic	crossrefDeposit	CrossrefDepositPlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.generic	usageEvent		0	0
1	0	1	0	2021-10-22 20:58:36	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	1	2	18	2021-10-22 20:58:36	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	2	0	0	2021-10-22 20:58:36	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	1	0	0	2021-10-22 20:58:36	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
2	2	0	0	2021-10-22 20:58:36	1	plugins.importexport	crossref		0	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
1	0	0	0	2021-10-22 20:58:36	1	plugins.themes	default	DefaultThemePlugin	1	0
3	2	1	4	2021-10-22 20:58:35	1	core	ops		0	1
1	1	0	0	2021-10-22 20:58:36	1	plugins.reports	counterReport		0	0
\.


--
-- Name: access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (type_id);


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcement_id);


--
-- Name: auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (auth_id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocabs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocabs_pkey PRIMARY KEY (controlled_vocab_id);


--
-- Name: data_object_tombstone_oai_set_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_pkey PRIMARY KEY (object_id);


--
-- Name: data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: edit_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_pkey PRIMARY KEY (edit_decision_id);


--
-- Name: email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (log_id);


--
-- Name: email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (email_id);


--
-- Name: event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (journal_id);


--
-- Name: library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: metadata_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metadata_descriptions
    ADD CONSTRAINT metadata_descriptions_pkey PRIMARY KEY (metadata_description_id);


--
-- Name: navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_pkey PRIMARY KEY (navigation_menu_item_id);


--
-- Name: navigation_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menus
    ADD CONSTRAINT navigation_menus_pkey PRIMARY KEY (navigation_menu_id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_subscription_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_pkey PRIMARY KEY (setting_id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: publication_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: publications_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (publication_id);


--
-- Name: queries_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (query_id);


--
-- Name: review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: submission_artwork_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_artwork_files
    ADD CONSTRAINT submission_artwork_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_supplementary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_supplementary_files
    ADD CONSTRAINT submission_supplementary_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_tombstones
    ADD CONSTRAINT submission_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (submission_id);


--
-- Name: temporary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_pkey PRIMARY KEY (file_id);


--
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX access_keys_hash ON public.access_keys USING btree (key_hash, user_id, context);


--
-- Name: announcement_settings_announcement_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcement_settings_announcement_id ON public.announcement_settings USING btree (announcement_id);


--
-- Name: announcement_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX announcement_settings_pkey ON public.announcement_settings USING btree (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX announcement_type_settings_pkey ON public.announcement_type_settings USING btree (type_id, locale, setting_name);


--
-- Name: announcement_type_settings_type_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcement_type_settings_type_id ON public.announcement_type_settings USING btree (type_id);


--
-- Name: announcement_types_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcement_types_assoc ON public.announcement_types USING btree (assoc_type, assoc_id);


--
-- Name: announcements_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcements_assoc ON public.announcements USING btree (assoc_type, assoc_id);


--
-- Name: assignment_settings_navigation_menu_item_assignment_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX assignment_settings_navigation_menu_item_assignment_id ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id);


--
-- Name: author_settings_author_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX author_settings_author_id ON public.author_settings USING btree (author_id);


--
-- Name: author_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX author_settings_pkey ON public.author_settings USING btree (author_id, locale, setting_name);


--
-- Name: authors_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX authors_publication_id ON public.authors USING btree (publication_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: c_v_e_s_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX c_v_e_s_pkey ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id, parent_id);


--
-- Name: category_path; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX category_path ON public.categories USING btree (context_id, path);


--
-- Name: category_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX category_settings_pkey ON public.category_settings USING btree (category_id, locale, setting_name);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX citation_settings_citation_id ON public.citation_settings USING btree (citation_id);


--
-- Name: citation_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX citation_settings_pkey ON public.citation_settings USING btree (citation_id, locale, setting_name);


--
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: citations_publication_seq; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX citations_publication_seq ON public.citations USING btree (publication_id, seq);


--
-- Name: controlled_vocab_entries_cv_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX controlled_vocab_entries_cv_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id, seq);


--
-- Name: controlled_vocab_symbolic; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX controlled_vocab_symbolic ON public.controlled_vocabs USING btree (symbolic, assoc_type, assoc_id);


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX data_object_tombstone_oai_set_objects_tombstone_id ON public.data_object_tombstone_oai_set_objects USING btree (tombstone_id);


--
-- Name: data_object_tombstone_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX data_object_tombstone_settings_pkey ON public.data_object_tombstone_settings USING btree (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstone_settings_tombstone_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX data_object_tombstone_settings_tombstone_id ON public.data_object_tombstone_settings USING btree (tombstone_id);


--
-- Name: data_object_tombstones_data_object_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX data_object_tombstones_data_object_id ON public.data_object_tombstones USING btree (data_object_id);


--
-- Name: edit_decisions_editor_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX edit_decisions_editor_id ON public.edit_decisions USING btree (editor_id);


--
-- Name: edit_decisions_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX edit_decisions_submission_id ON public.edit_decisions USING btree (submission_id);


--
-- Name: email_log_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_log_assoc ON public.email_log USING btree (assoc_type, assoc_id);


--
-- Name: email_log_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX email_log_user_id ON public.email_log_users USING btree (email_log_id, user_id);


--
-- Name: email_settings_email_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_settings_email_id ON public.email_templates_settings USING btree (email_id);


--
-- Name: email_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX email_settings_pkey ON public.email_templates_settings USING btree (email_id, locale, setting_name);


--
-- Name: email_templates_default_data_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX email_templates_default_data_pkey ON public.email_templates_default_data USING btree (email_key, locale);


--
-- Name: email_templates_default_email_key; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_templates_default_email_key ON public.email_templates_default USING btree (email_key);


--
-- Name: email_templates_email_key; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX email_templates_email_key ON public.email_templates USING btree (email_key, context_id);


--
-- Name: event_log_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX event_log_assoc ON public.event_log USING btree (assoc_type, assoc_id);


--
-- Name: event_log_settings_log_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX event_log_settings_log_id ON public.event_log_settings USING btree (log_id);


--
-- Name: event_log_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX event_log_settings_pkey ON public.event_log_settings USING btree (log_id, setting_name);


--
-- Name: filter_groups_symbolic; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX filter_groups_symbolic ON public.filter_groups USING btree (symbolic);


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


--
-- Name: filter_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX filter_settings_pkey ON public.filter_settings USING btree (filter_id, locale, setting_name);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX genre_settings_genre_id ON public.genre_settings USING btree (genre_id);


--
-- Name: genre_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX genre_settings_pkey ON public.genre_settings USING btree (genre_id, locale, setting_name);


--
-- Name: item_views_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX item_views_pkey ON public.item_views USING btree (assoc_type, assoc_id, user_id);


--
-- Name: journal_settings_journal_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX journal_settings_journal_id ON public.journal_settings USING btree (journal_id);


--
-- Name: journal_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX journal_settings_pkey ON public.journal_settings USING btree (journal_id, locale, setting_name);


--
-- Name: journals_path; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX journals_path ON public.journals USING btree (path);


--
-- Name: library_file_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_file_settings_id ON public.library_file_settings USING btree (file_id);


--
-- Name: library_file_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX library_file_settings_pkey ON public.library_file_settings USING btree (file_id, locale, setting_name);


--
-- Name: library_files_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_files_context_id ON public.library_files USING btree (context_id);


--
-- Name: library_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_files_submission_id ON public.library_files USING btree (submission_id);


--
-- Name: metadata_description_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metadata_description_settings_id ON public.metadata_description_settings USING btree (metadata_description_id);


--
-- Name: metadata_descriptions_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metadata_descriptions_assoc ON public.metadata_descriptions USING btree (assoc_type, assoc_id);


--
-- Name: metadata_descripton_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX metadata_descripton_settings_pkey ON public.metadata_description_settings USING btree (metadata_description_id, locale, setting_name);


--
-- Name: metrics_load_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_load_id ON public.metrics USING btree (load_id);


--
-- Name: metrics_metric_type_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_metric_type_context_id ON public.metrics USING btree (metric_type, context_id);


--
-- Name: metrics_metric_type_submission_id_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_metric_type_submission_id_assoc ON public.metrics USING btree (metric_type, context_id, assoc_type, assoc_id);


--
-- Name: metrics_metric_type_submission_id_assoc_type; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_metric_type_submission_id_assoc_type ON public.metrics USING btree (metric_type, submission_id, assoc_type);


--
-- Name: navigation_menu_item_assignment_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX navigation_menu_item_assignment_settings_pkey ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: navigation_menu_item_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX navigation_menu_item_settings_pkey ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id, locale, setting_name);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


--
-- Name: notification_mail_list_email_context; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX notification_mail_list_email_context ON public.notification_mail_list USING btree (email, context);


--
-- Name: notification_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX notification_settings_pkey ON public.notification_settings USING btree (notification_id, locale, setting_name);


--
-- Name: notifications_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_assoc ON public.notifications USING btree (assoc_type, assoc_id);


--
-- Name: notifications_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_context_id ON public.notifications USING btree (context_id, level);


--
-- Name: notifications_context_id_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_context_id_user_id ON public.notifications USING btree (context_id, user_id, level);


--
-- Name: notifications_user_id_level; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_user_id_level ON public.notifications USING btree (user_id, level);


--
-- Name: oai_resumption_tokens_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX oai_resumption_tokens_pkey ON public.oai_resumption_tokens USING btree (token);


--
-- Name: plugin_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX plugin_settings_pkey ON public.plugin_settings USING btree (plugin_name, context_id, setting_name);


--
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX plugin_settings_plugin_name ON public.plugin_settings USING btree (plugin_name);


--
-- Name: publication_categories_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX publication_categories_id ON public.publication_categories USING btree (publication_id, category_id);


--
-- Name: publication_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galley_settings_galley_id ON public.publication_galley_settings USING btree (galley_id);


--
-- Name: publication_galley_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX publication_galley_settings_pkey ON public.publication_galley_settings USING btree (galley_id, locale, setting_name);


--
-- Name: publication_galleys_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_publication_id ON public.publication_galleys USING btree (publication_id);


--
-- Name: publication_galleys_url_path; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_url_path ON public.publication_galleys USING btree (url_path);


--
-- Name: publication_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX publication_settings_pkey ON public.publication_settings USING btree (publication_id, locale, setting_name);


--
-- Name: publication_settings_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_settings_publication_id ON public.publication_settings USING btree (publication_id);


--
-- Name: publications_section_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publications_section_id ON public.publications USING btree (section_id);


--
-- Name: publications_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publications_submission_id ON public.publications USING btree (submission_id);


--
-- Name: publications_url_path; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publications_url_path ON public.publications USING btree (url_path);


--
-- Name: queries_assoc_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX queries_assoc_id ON public.queries USING btree (assoc_type, assoc_id);


--
-- Name: query_participants_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX query_participants_pkey ON public.query_participants USING btree (query_id, user_id);


--
-- Name: review_assignments_form_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_assignments_form_id ON public.review_assignments USING btree (review_form_id);


--
-- Name: review_assignments_reviewer_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_assignments_reviewer_id ON public.review_assignments USING btree (reviewer_id);


--
-- Name: review_assignments_reviewer_review; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_assignments_reviewer_review ON public.review_assignments USING btree (reviewer_id, review_id);


--
-- Name: review_assignments_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_assignments_submission_id ON public.review_assignments USING btree (submission_id);


--
-- Name: review_files_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX review_files_pkey ON public.review_files USING btree (review_id, file_id);


--
-- Name: review_files_review_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_files_review_id ON public.review_files USING btree (review_id);


--
-- Name: review_round_files_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX review_round_files_pkey ON public.review_round_files USING btree (submission_id, review_round_id, file_id, revision);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: review_rounds_submission_id_stage_id_round_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX review_rounds_submission_id_stage_id_round_pkey ON public.review_rounds USING btree (submission_id, stage_id, round);


--
-- Name: scheduled_tasks_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX scheduled_tasks_pkey ON public.scheduled_tasks USING btree (class_name);


--
-- Name: section_editors_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX section_editors_pkey ON public.subeditor_submission_group USING btree (context_id, assoc_id, user_id, assoc_type);


--
-- Name: section_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX section_settings_pkey ON public.section_settings USING btree (section_id, locale, setting_name);


--
-- Name: section_settings_section_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX section_settings_section_id ON public.section_settings USING btree (section_id);


--
-- Name: sections_journal_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sections_journal_id ON public.sections USING btree (journal_id);


--
-- Name: sessions_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX sessions_pkey ON public.sessions USING btree (session_id);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sessions_user_id ON public.sessions USING btree (user_id);


--
-- Name: site_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX site_settings_pkey ON public.site_settings USING btree (setting_name, locale);


--
-- Name: stage_assignment; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX stage_assignment ON public.stage_assignments USING btree (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX stage_assignments_submission_id ON public.stage_assignments USING btree (submission_id);


--
-- Name: stage_assignments_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX stage_assignments_user_group_id ON public.stage_assignments USING btree (user_group_id);


--
-- Name: stage_assignments_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX stage_assignments_user_id ON public.stage_assignments USING btree (user_id);


--
-- Name: subeditor_submission_group_assoc_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX subeditor_submission_group_assoc_id ON public.subeditor_submission_group USING btree (assoc_type, assoc_id);


--
-- Name: subeditor_submission_group_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX subeditor_submission_group_context_id ON public.subeditor_submission_group USING btree (context_id);


--
-- Name: subeditor_submission_group_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX subeditor_submission_group_user_id ON public.subeditor_submission_group USING btree (user_id);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_comments_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: submission_file_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_file_settings_id ON public.submission_file_settings USING btree (file_id);


--
-- Name: submission_file_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX submission_file_settings_pkey ON public.submission_file_settings USING btree (file_id, locale, setting_name);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_search_keyword_text; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX submission_search_keyword_text ON public.submission_search_keyword_list USING btree (keyword_text);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_keywords_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX submission_search_object_keywords_pkey ON public.submission_search_object_keywords USING btree (object_id, pos);


--
-- Name: submission_search_object_submission; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_object_submission ON public.submission_search_objects USING btree (submission_id);


--
-- Name: submission_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX submission_settings_pkey ON public.submission_settings USING btree (submission_id, locale, setting_name);


--
-- Name: submission_settings_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_settings_submission_id ON public.submission_settings USING btree (submission_id);


--
-- Name: submission_tombstones_journal_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_tombstones_journal_id ON public.submission_tombstones USING btree (journal_id);


--
-- Name: submission_tombstones_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_tombstones_submission_id ON public.submission_tombstones USING btree (submission_id);


--
-- Name: submissions_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submissions_context_id ON public.submissions USING btree (context_id);


--
-- Name: submissions_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submissions_publication_id ON public.submissions USING btree (current_publication_id);


--
-- Name: temporary_files_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX temporary_files_user_id ON public.temporary_files USING btree (user_id);


--
-- Name: u_e_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX u_e_pkey ON public.user_interests USING btree (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX user_group_settings_pkey ON public.user_group_settings USING btree (user_group_id, locale, setting_name);


--
-- Name: user_group_stage_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_group_stage_context_id ON public.user_group_stage USING btree (context_id);


--
-- Name: user_group_stage_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX user_group_stage_pkey ON public.user_group_stage USING btree (context_id, user_group_id, stage_id);


--
-- Name: user_group_stage_stage_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_group_stage_stage_id ON public.user_group_stage USING btree (stage_id);


--
-- Name: user_group_stage_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_group_stage_user_group_id ON public.user_group_stage USING btree (user_group_id);


--
-- Name: user_groups_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_groups_context_id ON public.user_groups USING btree (context_id);


--
-- Name: user_groups_role_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_groups_role_id ON public.user_groups USING btree (role_id);


--
-- Name: user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_groups_user_group_id ON public.user_groups USING btree (user_group_id);


--
-- Name: user_settings_locale_setting_name_index; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_settings_locale_setting_name_index ON public.user_settings USING btree (setting_name, locale);


--
-- Name: user_settings_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX user_settings_pkey ON public.user_settings USING btree (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_settings_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_settings_user_id ON public.user_settings USING btree (user_id);


--
-- Name: user_user_groups_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX user_user_groups_pkey ON public.user_user_groups USING btree (user_group_id, user_id);


--
-- Name: user_user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_user_groups_user_group_id ON public.user_user_groups USING btree (user_group_id);


--
-- Name: user_user_groups_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_user_groups_user_id ON public.user_user_groups USING btree (user_id);


--
-- Name: users_email; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX users_email ON public.users USING btree (email);


--
-- Name: users_username; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX users_username ON public.users USING btree (username);


--
-- Name: versions_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX versions_pkey ON public.versions USING btree (product_type, product, major, minor, revision, build);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

