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

ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_file_id_foreign;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_submission_file_id_foreign;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_submission_file_id_foreign;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_submission_file_id_foreign;
DROP INDEX public.user_user_groups_user_id;
DROP INDEX public.user_user_groups_user_group_id;
DROP INDEX public.user_settings_user_id;
DROP INDEX public.user_settings_locale_setting_name_index;
DROP INDEX public.user_groups_user_group_id;
DROP INDEX public.user_groups_role_id;
DROP INDEX public.user_groups_context_id;
DROP INDEX public.user_group_stage_user_group_id;
DROP INDEX public.user_group_stage_stage_id;
DROP INDEX public.user_group_stage_context_id;
DROP INDEX public.temporary_files_user_id;
DROP INDEX public.submissions_publication_id;
DROP INDEX public.submissions_context_id;
DROP INDEX public.submission_tombstones_submission_id;
DROP INDEX public.submission_tombstones_journal_id;
DROP INDEX public.submission_settings_submission_id;
DROP INDEX public.submission_search_object_submission;
DROP INDEX public.submission_search_object_keywords_keyword_id;
DROP INDEX public.submission_files_submission_id;
DROP INDEX public.submission_files_stage_assoc;
DROP INDEX public.submission_file_settings_id;
DROP INDEX public.submission_comments_submission_id;
DROP INDEX public.subeditor_submission_group_user_id;
DROP INDEX public.subeditor_submission_group_assoc_id;
DROP INDEX public.stage_assignments_user_id;
DROP INDEX public.stage_assignments_user_group_id;
DROP INDEX public.stage_assignments_submission_id;
DROP INDEX public.sessions_user_id;
DROP INDEX public.sections_journal_id;
DROP INDEX public.section_settings_section_id;
DROP INDEX public.section_editors_context_id;
DROP INDEX public.review_rounds_submission_id;
DROP INDEX public.review_round_files_submission_id;
DROP INDEX public.review_form_settings_review_form_id;
DROP INDEX public.review_form_responses_pkey;
DROP INDEX public.review_form_elements_review_form_id;
DROP INDEX public.review_form_element_settings_review_form_element_id;
DROP INDEX public.review_files_review_id;
DROP INDEX public.review_assignments_submission_id;
DROP INDEX public.review_assignments_reviewer_review;
DROP INDEX public.review_assignments_reviewer_id;
DROP INDEX public.review_assignments_form_id;
DROP INDEX public.queries_assoc_id;
DROP INDEX public.publications_url_path;
DROP INDEX public.publications_submission_id;
DROP INDEX public.publications_section_id;
DROP INDEX public.publication_settings_publication_id;
DROP INDEX public.publication_settings_name_value;
DROP INDEX public.publication_galleys_url_path;
DROP INDEX public.publication_galleys_publication_id;
DROP INDEX public.publication_galley_settings_name_value;
DROP INDEX public.publication_galley_settings_galley_id;
DROP INDEX public.plugin_settings_plugin_name;
DROP INDEX public.notifications_user_id_level;
DROP INDEX public.notifications_context_id_user_id;
DROP INDEX public.notifications_context_id;
DROP INDEX public.notifications_assoc;
DROP INDEX public.notes_assoc;
DROP INDEX public.navigation_menu_item_settings_navigation_menu_id;
DROP INDEX public.metrics_metric_type_submission_id_assoc_type;
DROP INDEX public.metrics_metric_type_submission_id_assoc;
DROP INDEX public.metrics_metric_type_context_id;
DROP INDEX public.metrics_load_id;
DROP INDEX public.metadata_descriptions_assoc;
DROP INDEX public.metadata_description_settings_id;
DROP INDEX public.library_files_submission_id;
DROP INDEX public.library_files_context_id;
DROP INDEX public.library_file_settings_id;
DROP INDEX public.journal_settings_journal_id;
DROP INDEX public.jobs_queue_reserved_at_index;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.filter_settings_id;
DROP INDEX public.event_log_settings_name_value;
DROP INDEX public.event_log_settings_log_id;
DROP INDEX public.event_log_assoc;
DROP INDEX public.email_templates_default_email_key;
DROP INDEX public.email_settings_email_id;
DROP INDEX public.email_log_assoc;
DROP INDEX public.edit_decisions_submission_id;
DROP INDEX public.edit_decisions_editor_id;
DROP INDEX public.data_object_tombstones_data_object_id;
DROP INDEX public.data_object_tombstone_settings_tombstone_id;
DROP INDEX public.data_object_tombstone_oai_set_objects_tombstone_id;
DROP INDEX public.controlled_vocab_entries_cv_id;
DROP INDEX public.citations_publication;
DROP INDEX public.citation_settings_citation_id;
DROP INDEX public.category_context_id;
DROP INDEX public.c_v_e_s_entry_id;
DROP INDEX public.authors_publication_id;
DROP INDEX public.author_settings_author_id;
DROP INDEX public.assignment_settings_navigation_menu_item_assignment_id;
DROP INDEX public.announcements_assoc;
DROP INDEX public.announcement_types_assoc;
DROP INDEX public.announcement_type_settings_type_id;
DROP INDEX public.announcement_settings_announcement_id;
DROP INDEX public.access_keys_hash;
ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_username;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_email;
ALTER TABLE ONLY public.user_user_groups DROP CONSTRAINT user_user_groups_pkey;
ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_pkey;
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
ALTER TABLE ONLY public.user_group_stage DROP CONSTRAINT user_group_stage_pkey;
ALTER TABLE ONLY public.user_group_settings DROP CONSTRAINT user_group_settings_pkey;
ALTER TABLE ONLY public.user_interests DROP CONSTRAINT u_e_pkey;
ALTER TABLE ONLY public.temporary_files DROP CONSTRAINT temporary_files_pkey;
ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_pkey;
ALTER TABLE ONLY public.submission_tombstones DROP CONSTRAINT submission_tombstones_pkey;
ALTER TABLE ONLY public.submission_settings DROP CONSTRAINT submission_settings_pkey;
ALTER TABLE ONLY public.submission_search_objects DROP CONSTRAINT submission_search_objects_pkey;
ALTER TABLE ONLY public.submission_search_object_keywords DROP CONSTRAINT submission_search_object_keywords_pkey;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_text;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_list_pkey;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_pkey;
ALTER TABLE ONLY public.submission_file_settings DROP CONSTRAINT submission_file_settings_pkey;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_pkey;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignment;
ALTER TABLE ONLY public.site_settings DROP CONSTRAINT site_settings_pkey;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
ALTER TABLE ONLY public.section_settings DROP CONSTRAINT section_settings_pkey;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT section_editors_pkey;
ALTER TABLE ONLY public.scheduled_tasks DROP CONSTRAINT scheduled_tasks_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_submission_id_stage_id_round_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_pkey;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_pkey;
ALTER TABLE ONLY public.review_forms DROP CONSTRAINT review_forms_pkey;
ALTER TABLE ONLY public.review_form_settings DROP CONSTRAINT review_form_settings_pkey;
ALTER TABLE ONLY public.review_form_elements DROP CONSTRAINT review_form_elements_pkey;
ALTER TABLE ONLY public.review_form_element_settings DROP CONSTRAINT review_form_element_settings_pkey;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_pkey;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_pkey;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_pkey;
ALTER TABLE ONLY public.queries DROP CONSTRAINT queries_pkey;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
ALTER TABLE ONLY public.publication_settings DROP CONSTRAINT publication_settings_pkey;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_pkey;
ALTER TABLE ONLY public.publication_galley_settings DROP CONSTRAINT publication_galley_settings_pkey;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_id;
ALTER TABLE ONLY public.plugin_settings DROP CONSTRAINT plugin_settings_pkey;
ALTER TABLE ONLY public.oai_resumption_tokens DROP CONSTRAINT oai_resumption_tokens_pkey;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_pkey;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_pkey;
ALTER TABLE ONLY public.notification_mail_list DROP CONSTRAINT notification_mail_list_pkey;
ALTER TABLE ONLY public.notification_mail_list DROP CONSTRAINT notification_mail_list_email_context;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_pkey;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_pkey;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT navigation_menu_item_assignment_settings_pkey;
ALTER TABLE ONLY public.metadata_description_settings DROP CONSTRAINT metadata_descripton_settings_pkey;
ALTER TABLE ONLY public.metadata_descriptions DROP CONSTRAINT metadata_descriptions_pkey;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_pkey;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_pkey;
ALTER TABLE ONLY public.journals DROP CONSTRAINT journals_pkey;
ALTER TABLE ONLY public.journals DROP CONSTRAINT journals_path;
ALTER TABLE ONLY public.journal_settings DROP CONSTRAINT journal_settings_pkey;
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.item_views DROP CONSTRAINT item_views_pkey;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_pkey;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_pkey;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_pkey;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_symbolic;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_pkey;
ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
ALTER TABLE ONLY public.event_log_settings DROP CONSTRAINT event_log_settings_pkey;
ALTER TABLE ONLY public.event_log DROP CONSTRAINT event_log_pkey;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_pkey;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_email_key;
ALTER TABLE ONLY public.email_templates_default DROP CONSTRAINT email_templates_default_pkey;
ALTER TABLE ONLY public.email_templates_default_data DROP CONSTRAINT email_templates_default_data_pkey;
ALTER TABLE ONLY public.email_templates_settings DROP CONSTRAINT email_settings_pkey;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_user_id;
ALTER TABLE ONLY public.email_log DROP CONSTRAINT email_log_pkey;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_pkey;
ALTER TABLE ONLY public.data_object_tombstones DROP CONSTRAINT data_object_tombstones_pkey;
ALTER TABLE ONLY public.data_object_tombstone_settings DROP CONSTRAINT data_object_tombstone_settings_pkey;
ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects DROP CONSTRAINT data_object_tombstone_oai_set_objects_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocabs_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocab_symbolic;
ALTER TABLE ONLY public.controlled_vocab_entries DROP CONSTRAINT controlled_vocab_entries_pkey;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_publication_seq;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_pkey;
ALTER TABLE ONLY public.citation_settings DROP CONSTRAINT citation_settings_pkey;
ALTER TABLE ONLY public.category_settings DROP CONSTRAINT category_settings_pkey;
ALTER TABLE ONLY public.categories DROP CONSTRAINT category_path;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
ALTER TABLE ONLY public.controlled_vocab_entry_settings DROP CONSTRAINT c_v_e_s_pkey;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
ALTER TABLE ONLY public.author_settings DROP CONSTRAINT author_settings_pkey;
ALTER TABLE ONLY public.auth_sources DROP CONSTRAINT auth_sources_pkey;
ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_pkey;
ALTER TABLE ONLY public.announcement_types DROP CONSTRAINT announcement_types_pkey;
ALTER TABLE ONLY public.announcement_type_settings DROP CONSTRAINT announcement_type_settings_pkey;
ALTER TABLE ONLY public.announcement_settings DROP CONSTRAINT announcement_settings_pkey;
ALTER TABLE ONLY public.access_keys DROP CONSTRAINT access_keys_pkey;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.user_groups ALTER COLUMN user_group_id DROP DEFAULT;
ALTER TABLE public.temporary_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.submissions ALTER COLUMN submission_id DROP DEFAULT;
ALTER TABLE public.submission_tombstones ALTER COLUMN tombstone_id DROP DEFAULT;
ALTER TABLE public.submission_search_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.submission_search_keyword_list ALTER COLUMN keyword_id DROP DEFAULT;
ALTER TABLE public.submission_files ALTER COLUMN submission_file_id DROP DEFAULT;
ALTER TABLE public.submission_file_revisions ALTER COLUMN revision_id DROP DEFAULT;
ALTER TABLE public.submission_comments ALTER COLUMN comment_id DROP DEFAULT;
ALTER TABLE public.stage_assignments ALTER COLUMN stage_assignment_id DROP DEFAULT;
ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
ALTER TABLE public.review_rounds ALTER COLUMN review_round_id DROP DEFAULT;
ALTER TABLE public.review_forms ALTER COLUMN review_form_id DROP DEFAULT;
ALTER TABLE public.review_form_elements ALTER COLUMN review_form_element_id DROP DEFAULT;
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
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
ALTER TABLE public.filters ALTER COLUMN filter_id DROP DEFAULT;
ALTER TABLE public.filter_groups ALTER COLUMN filter_group_id DROP DEFAULT;
ALTER TABLE public.files ALTER COLUMN file_id DROP DEFAULT;
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
DROP TABLE public.submission_settings;
DROP SEQUENCE public.submission_search_objects_object_id_seq;
DROP TABLE public.submission_search_objects;
DROP TABLE public.submission_search_object_keywords;
DROP SEQUENCE public.submission_search_keyword_list_keyword_id_seq;
DROP TABLE public.submission_search_keyword_list;
DROP SEQUENCE public.submission_files_submission_file_id_seq;
DROP TABLE public.submission_files;
DROP TABLE public.submission_file_settings;
DROP SEQUENCE public.submission_file_revisions_revision_id_seq;
DROP TABLE public.submission_file_revisions;
DROP SEQUENCE public.submission_comments_comment_id_seq;
DROP TABLE public.submission_comments;
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
DROP SEQUENCE public.review_forms_review_form_id_seq;
DROP TABLE public.review_forms;
DROP TABLE public.review_form_settings;
DROP TABLE public.review_form_responses;
DROP SEQUENCE public.review_form_elements_review_form_element_id_seq;
DROP TABLE public.review_form_elements;
DROP TABLE public.review_form_element_settings;
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
DROP SEQUENCE public.jobs_id_seq;
DROP TABLE public.jobs;
DROP TABLE public.item_views;
DROP SEQUENCE public.genres_genre_id_seq;
DROP TABLE public.genres;
DROP TABLE public.genre_settings;
DROP SEQUENCE public.filters_filter_id_seq;
DROP TABLE public.filters;
DROP TABLE public.filter_settings;
DROP SEQUENCE public.filter_groups_filter_group_id_seq;
DROP TABLE public.filter_groups;
DROP SEQUENCE public.files_file_id_seq;
DROP TABLE public.files;
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
    access_key_id bigint NOT NULL,
    context character varying(40) NOT NULL,
    key_hash character varying(40) NOT NULL,
    user_id bigint NOT NULL,
    assoc_id bigint,
    expiry_date timestamp(0) without time zone NOT NULL
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
    setting_type character varying(6)
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
    type_id bigint NOT NULL,
    assoc_type smallint NOT NULL,
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
    announcement_id bigint NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL,
    type_id bigint,
    date_expire date,
    date_posted timestamp(0) without time zone NOT NULL
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
    auth_id bigint NOT NULL,
    title character varying(60) NOT NULL,
    plugin character varying(32) NOT NULL,
    auth_default smallint DEFAULT '0'::smallint NOT NULL,
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
    setting_value text
);


ALTER TABLE public.author_settings OWNER TO "ops-ci";

--
-- Name: authors; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.authors (
    author_id bigint NOT NULL,
    email character varying(90) NOT NULL,
    include_in_browse smallint DEFAULT '1'::smallint NOT NULL,
    publication_id bigint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
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
    category_id bigint NOT NULL,
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
-- Name: COLUMN category_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.category_settings.setting_type IS '(bool|int|float|string|object)';


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
    citation_id bigint NOT NULL,
    publication_id bigint DEFAULT '0'::bigint NOT NULL,
    raw_citation text NOT NULL,
    seq bigint DEFAULT '0'::bigint NOT NULL
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
    controlled_vocab_entry_id bigint NOT NULL,
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
    controlled_vocab_id bigint NOT NULL,
    symbolic character varying(64) NOT NULL,
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL
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
    object_id bigint NOT NULL,
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
-- Name: COLUMN data_object_tombstone_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.data_object_tombstone_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: data_object_tombstones; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.data_object_tombstones (
    tombstone_id bigint NOT NULL,
    data_object_id bigint NOT NULL,
    date_deleted timestamp(0) without time zone NOT NULL,
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
    edit_decision_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id bigint,
    round smallint NOT NULL,
    editor_id bigint NOT NULL,
    decision smallint NOT NULL,
    date_decided timestamp(0) without time zone NOT NULL
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
    log_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    sender_id bigint NOT NULL,
    date_sent timestamp(0) without time zone NOT NULL,
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
    email_id bigint NOT NULL,
    email_key character varying(64) NOT NULL,
    context_id bigint NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.email_templates OWNER TO "ops-ci";

--
-- Name: COLUMN email_templates.email_key; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.email_templates.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates_default (
    email_id bigint NOT NULL,
    email_key character varying(64) NOT NULL,
    can_disable smallint DEFAULT '0'::smallint NOT NULL,
    can_edit smallint DEFAULT '0'::smallint NOT NULL,
    from_role_id bigint,
    to_role_id bigint,
    stage_id bigint
);


ALTER TABLE public.email_templates_default OWNER TO "ops-ci";

--
-- Name: COLUMN email_templates_default.email_key; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.email_templates_default.email_key IS 'Unique identifier for this email.';


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
-- Name: COLUMN email_templates_default_data.email_key; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.email_templates_default_data.email_key IS 'Unique identifier for this email.';


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
    log_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_logged timestamp(0) without time zone NOT NULL,
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
-- Name: COLUMN event_log_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.event_log_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.files (
    file_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    mimetype character varying(255) NOT NULL
);


ALTER TABLE public.files OWNER TO "ops-ci";

--
-- Name: files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_file_id_seq OWNER TO "ops-ci";

--
-- Name: files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.files_file_id_seq OWNED BY public.files.file_id;


--
-- Name: filter_groups; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.filter_groups (
    filter_group_id bigint NOT NULL,
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
    filter_id bigint NOT NULL,
    filter_group_id bigint DEFAULT '0'::bigint NOT NULL,
    context_id bigint DEFAULT '0'::bigint NOT NULL,
    display_name character varying(255),
    class_name character varying(255),
    is_template smallint DEFAULT '0'::smallint NOT NULL,
    parent_filter_id bigint DEFAULT '0'::bigint NOT NULL,
    seq bigint DEFAULT '0'::bigint NOT NULL
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
-- Name: COLUMN genre_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.genre_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: genres; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.genres (
    genre_id bigint NOT NULL,
    context_id bigint NOT NULL,
    seq bigint NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL,
    category bigint DEFAULT '1'::bigint NOT NULL,
    dependent smallint DEFAULT '0'::smallint NOT NULL,
    supplementary smallint DEFAULT '0'::smallint NOT NULL,
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
    assoc_id bigint NOT NULL,
    user_id bigint,
    date_last_viewed timestamp(0) without time zone
);


ALTER TABLE public.item_views OWNER TO "ops-ci";

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO "ops-ci";

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO "ops-ci";

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


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
    journal_id bigint NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.journals OWNER TO "ops-ci";

--
-- Name: COLUMN journals.seq; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.journals.seq IS 'Used to order lists of journals';


--
-- Name: COLUMN journals.enabled; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.journals.enabled IS 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)';


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
-- Name: COLUMN library_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.library_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: library_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.library_files (
    file_id bigint NOT NULL,
    context_id bigint NOT NULL,
    file_name character varying(255) NOT NULL,
    original_file_name character varying(255) NOT NULL,
    file_type character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    type smallint NOT NULL,
    date_uploaded timestamp(0) without time zone NOT NULL,
    date_modified timestamp(0) without time zone NOT NULL,
    submission_id bigint NOT NULL,
    public_access smallint DEFAULT '0'::smallint
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
    metadata_description_id bigint NOT NULL,
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL,
    schema_namespace character varying(255) NOT NULL,
    schema_name character varying(255) NOT NULL,
    display_name character varying(255),
    seq bigint DEFAULT '0'::bigint NOT NULL
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
    navigation_menu_item_assignment_id bigint NOT NULL,
    navigation_menu_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    parent_id bigint,
    seq bigint DEFAULT '0'::bigint
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
    navigation_menu_item_id bigint NOT NULL,
    context_id bigint NOT NULL,
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
    navigation_menu_id bigint NOT NULL,
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
    note_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_created timestamp(0) without time zone NOT NULL,
    date_modified timestamp(0) without time zone,
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
    notification_mail_list_id bigint NOT NULL,
    email character varying(90) NOT NULL,
    confirmed smallint DEFAULT '0'::smallint NOT NULL,
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
    setting_value text NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_settings OWNER TO "ops-ci";

--
-- Name: COLUMN notification_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.notification_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notification_subscription_settings (
    setting_id bigint NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL,
    user_id bigint NOT NULL,
    context bigint NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_subscription_settings OWNER TO "ops-ci";

--
-- Name: COLUMN notification_subscription_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.notification_subscription_settings.setting_type IS '(bool|int|float|string|object)';


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
    notification_id bigint NOT NULL,
    context_id bigint NOT NULL,
    user_id bigint,
    level bigint NOT NULL,
    type bigint NOT NULL,
    date_created timestamp(0) without time zone NOT NULL,
    date_read timestamp(0) without time zone,
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
-- Name: COLUMN plugin_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.plugin_settings.setting_type IS '(bool|int|float|string|object)';


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
    galley_id bigint NOT NULL,
    locale character varying(14),
    publication_id bigint NOT NULL,
    label character varying(255),
    submission_file_id bigint,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    remote_url character varying(2047),
    is_approved smallint DEFAULT '0'::smallint NOT NULL,
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
    publication_id bigint NOT NULL,
    access_status bigint DEFAULT '0'::bigint,
    date_published date,
    last_modified timestamp(0) without time zone,
    locale character varying(14),
    primary_contact_id bigint,
    section_id bigint,
    submission_id bigint NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
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
    query_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    date_posted timestamp(0) without time zone,
    date_modified timestamp(0) without time zone,
    closed smallint DEFAULT '0'::smallint NOT NULL
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
    review_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    reviewer_id bigint NOT NULL,
    competing_interests text,
    recommendation smallint,
    date_assigned timestamp(0) without time zone,
    date_notified timestamp(0) without time zone,
    date_confirmed timestamp(0) without time zone,
    date_completed timestamp(0) without time zone,
    date_acknowledged timestamp(0) without time zone,
    date_due timestamp(0) without time zone,
    date_response_due timestamp(0) without time zone,
    last_modified timestamp(0) without time zone,
    reminder_was_automatic smallint DEFAULT '0'::smallint NOT NULL,
    declined smallint DEFAULT '0'::smallint NOT NULL,
    cancelled smallint DEFAULT '0'::smallint NOT NULL,
    reviewer_file_id bigint,
    date_rated timestamp(0) without time zone,
    date_reminded timestamp(0) without time zone,
    quality smallint,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    review_method smallint DEFAULT '1'::smallint NOT NULL,
    round smallint DEFAULT '1'::smallint NOT NULL,
    step smallint DEFAULT '1'::smallint NOT NULL,
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
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_files OWNER TO "ops-ci";

--
-- Name: review_form_element_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_form_element_settings (
    review_form_element_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_element_settings OWNER TO "ops-ci";

--
-- Name: review_form_elements; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_form_elements (
    review_form_element_id bigint NOT NULL,
    review_form_id bigint NOT NULL,
    seq double precision,
    element_type bigint,
    required smallint,
    included smallint
);


ALTER TABLE public.review_form_elements OWNER TO "ops-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_form_elements_review_form_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_form_elements_review_form_element_id_seq OWNER TO "ops-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_form_elements_review_form_element_id_seq OWNED BY public.review_form_elements.review_form_element_id;


--
-- Name: review_form_responses; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_form_responses (
    review_form_element_id bigint NOT NULL,
    review_id bigint NOT NULL,
    response_type character varying(6),
    response_value text
);


ALTER TABLE public.review_form_responses OWNER TO "ops-ci";

--
-- Name: review_form_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_form_settings (
    review_form_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_settings OWNER TO "ops-ci";

--
-- Name: review_forms; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_forms (
    review_form_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    seq double precision,
    is_active smallint
);


ALTER TABLE public.review_forms OWNER TO "ops-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_forms_review_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_forms_review_form_id_seq OWNER TO "ops-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_forms_review_form_id_seq OWNED BY public.review_forms.review_form_id;


--
-- Name: review_round_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_round_files (
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_round_files OWNER TO "ops-ci";

--
-- Name: review_rounds; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_rounds (
    review_round_id bigint NOT NULL,
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
    last_run timestamp(0) without time zone
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
-- Name: COLUMN section_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.section_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: sections; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.sections (
    section_id bigint NOT NULL,
    journal_id bigint NOT NULL,
    review_form_id bigint,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    editor_restricted smallint DEFAULT '0'::smallint NOT NULL,
    meta_indexed smallint DEFAULT '0'::smallint NOT NULL,
    meta_reviewed smallint DEFAULT '1'::smallint NOT NULL,
    abstracts_not_required smallint DEFAULT '0'::smallint NOT NULL,
    hide_title smallint DEFAULT '0'::smallint NOT NULL,
    hide_author smallint DEFAULT '0'::smallint NOT NULL,
    is_inactive smallint DEFAULT '0'::smallint NOT NULL,
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
    created bigint DEFAULT '0'::bigint NOT NULL,
    last_used bigint DEFAULT '0'::bigint NOT NULL,
    remember smallint DEFAULT '0'::smallint NOT NULL,
    data text NOT NULL,
    domain character varying(255)
);


ALTER TABLE public.sessions OWNER TO "ops-ci";

--
-- Name: site; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.site (
    redirect bigint DEFAULT '0'::bigint NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT '6'::smallint NOT NULL,
    installed_locales character varying(1024) DEFAULT 'en_US'::character varying NOT NULL,
    supported_locales character varying(1024),
    original_style_file_name character varying(255)
);


ALTER TABLE public.site OWNER TO "ops-ci";

--
-- Name: COLUMN site.redirect; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.site.redirect IS 'If not 0, redirect to the specified journal/conference/... site.';


--
-- Name: COLUMN site.primary_locale; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.site.primary_locale IS 'Primary locale for the site.';


--
-- Name: COLUMN site.installed_locales; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.site.installed_locales IS 'Locales for which support has been installed.';


--
-- Name: COLUMN site.supported_locales; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.site.supported_locales IS 'Locales supported by the site (for hosted journals/conferences/...).';


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
    stage_assignment_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_assigned timestamp(0) without time zone NOT NULL,
    recommend_only smallint DEFAULT '0'::smallint NOT NULL,
    can_change_metadata smallint DEFAULT '0'::smallint NOT NULL
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
    assoc_type bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.subeditor_submission_group OWNER TO "ops-ci";

--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_comments (
    comment_id bigint NOT NULL,
    comment_type bigint,
    role_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    assoc_id bigint NOT NULL,
    author_id bigint NOT NULL,
    comment_title text NOT NULL,
    comments text,
    date_posted timestamp(0) without time zone,
    date_modified timestamp(0) without time zone,
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
-- Name: submission_file_revisions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_file_revisions (
    revision_id bigint NOT NULL,
    submission_file_id bigint NOT NULL,
    file_id bigint NOT NULL
);


ALTER TABLE public.submission_file_revisions OWNER TO "ops-ci";

--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_file_revisions_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_file_revisions_revision_id_seq OWNER TO "ops-ci";

--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_file_revisions_revision_id_seq OWNED BY public.submission_file_revisions.revision_id;


--
-- Name: submission_file_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_file_settings (
    submission_file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) DEFAULT 'string'::character varying NOT NULL
);


ALTER TABLE public.submission_file_settings OWNER TO "ops-ci";

--
-- Name: COLUMN submission_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.submission_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_files (
    submission_file_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    file_id bigint NOT NULL,
    source_submission_file_id bigint,
    genre_id bigint,
    file_stage bigint NOT NULL,
    direct_sales_price character varying(255),
    sales_type character varying(255),
    viewable smallint,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    uploader_user_id bigint,
    assoc_type bigint,
    assoc_id bigint
);


ALTER TABLE public.submission_files OWNER TO "ops-ci";

--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_files_submission_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_files_submission_file_id_seq OWNER TO "ops-ci";

--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_files_submission_file_id_seq OWNED BY public.submission_files.submission_file_id;


--
-- Name: submission_search_keyword_list; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_search_keyword_list (
    keyword_id bigint NOT NULL,
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
-- Name: COLUMN submission_search_object_keywords.pos; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.submission_search_object_keywords.pos IS 'Word position of the keyword in the object.';


--
-- Name: submission_search_objects; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_search_objects (
    object_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    type integer NOT NULL,
    assoc_id bigint
);


ALTER TABLE public.submission_search_objects OWNER TO "ops-ci";

--
-- Name: COLUMN submission_search_objects.type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.submission_search_objects.type IS 'Type of item. E.g., abstract, fulltext, etc.';


--
-- Name: COLUMN submission_search_objects.assoc_id; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.submission_search_objects.assoc_id IS 'Optional ID of an associated record (e.g., a file_id)';


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
-- Name: submission_tombstones; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.submission_tombstones (
    tombstone_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    date_deleted timestamp(0) without time zone NOT NULL,
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
    submission_id bigint NOT NULL,
    context_id bigint NOT NULL,
    current_publication_id bigint,
    date_last_activity timestamp(0) without time zone,
    date_submitted timestamp(0) without time zone,
    last_modified timestamp(0) without time zone,
    stage_id bigint DEFAULT '1'::bigint NOT NULL,
    locale character varying(14),
    status smallint DEFAULT '1'::smallint NOT NULL,
    submission_progress smallint DEFAULT '1'::smallint NOT NULL,
    work_type smallint DEFAULT '0'::smallint
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
    file_id bigint NOT NULL,
    user_id bigint NOT NULL,
    file_name character varying(90) NOT NULL,
    file_type character varying(255),
    file_size bigint NOT NULL,
    original_file_name character varying(127),
    date_uploaded timestamp(0) without time zone NOT NULL
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
    metric bigint DEFAULT '1'::bigint NOT NULL,
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
-- Name: COLUMN user_group_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.user_group_settings.setting_type IS '(bool|int|float|string|object)';


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
    user_group_id bigint NOT NULL,
    context_id bigint NOT NULL,
    role_id bigint NOT NULL,
    is_default smallint DEFAULT '0'::smallint NOT NULL,
    show_title smallint DEFAULT '1'::smallint NOT NULL,
    permit_self_registration smallint DEFAULT '0'::smallint NOT NULL,
    permit_metadata_edit smallint DEFAULT '0'::smallint NOT NULL
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
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL,
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
    user_id bigint NOT NULL,
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
    date_last_email timestamp(0) without time zone,
    date_registered timestamp(0) without time zone NOT NULL,
    date_validated timestamp(0) without time zone,
    date_last_login timestamp(0) without time zone NOT NULL,
    must_change_password smallint,
    auth_id bigint,
    auth_str character varying(255),
    disabled smallint DEFAULT '0'::smallint NOT NULL,
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
    date_installed timestamp(0) without time zone NOT NULL,
    current smallint DEFAULT '0'::smallint NOT NULL,
    product_type character varying(30),
    product character varying(30),
    product_class_name character varying(80),
    lazy_load smallint DEFAULT '0'::smallint NOT NULL,
    sitewide smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.versions OWNER TO "ops-ci";

--
-- Name: COLUMN versions.major; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.major IS 'Major component of version number, e.g. the 2 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.minor; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.minor IS 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.revision; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.revision IS 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.build; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.build IS 'Build component of version number, e.g. the 0 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.current; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.current IS '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.';


--
-- Name: COLUMN versions.product_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.product_type IS 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf';


--
-- Name: COLUMN versions.product; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.product IS 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.';


--
-- Name: COLUMN versions.product_class_name; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.product_class_name IS 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.';


--
-- Name: COLUMN versions.lazy_load; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.lazy_load IS '1 iff the row describes a lazy-load plugin; 0 otherwise';


--
-- Name: COLUMN versions.sitewide; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.versions.sitewide IS '1 iff the row describes a site-wide plugin; 0 otherwise';


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
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


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
-- Name: id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


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
-- Name: review_form_element_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('public.review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_form_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('public.review_forms_review_form_id_seq'::regclass);


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
-- Name: revision_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions ALTER COLUMN revision_id SET DEFAULT nextval('public.submission_file_revisions_revision_id_seq'::regclass);


--
-- Name: submission_file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN submission_file_id SET DEFAULT nextval('public.submission_files_submission_file_id_seq'::regclass);


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

COPY public.author_settings (author_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	affiliation	University of Bologna
1		country	IT
1	en_US	familyName	Corino
1	en_US	givenName	Carlo
2	en_US	affiliation	University of Windsor
2		country	CA
2	en_US	familyName	Kwantes
2	en_US	givenName	Catherine
3	en_US	affiliation	Academy of Finland
3	fr_CA	affiliation	
3	en_US	biography	
3	fr_CA	biography	
3		country	FI
3	en_US	familyName	Kekkonen
3	fr_CA	familyName	
3	en_US	givenName	Urho
3	fr_CA	givenName	
3		orcid	
3	en_US	preferredPublicName	
3	fr_CA	preferredPublicName	
3		url	
4	en_US	affiliation	University of Alberta
4		country	CA
4	en_US	familyName	Montgomerie
4	en_US	givenName	Craig
5	en_US	affiliation	University of Victoria
5	fr_CA	affiliation	
5	en_US	biography	
5	fr_CA	biography	
5		country	CA
5	en_US	familyName	Irvine
5	fr_CA	familyName	
5	en_US	givenName	Mark
5	fr_CA	givenName	
5		orcid	
5	en_US	preferredPublicName	
5	fr_CA	preferredPublicName	
5		url	
6	en_US	affiliation	University of Alberta
6		country	CA
6	en_US	familyName	Montgomerie
6	en_US	givenName	Craig
7	en_US	affiliation	University of Victoria
7	fr_CA	affiliation	
7	en_US	biography	
7	fr_CA	biography	
7		country	CA
7	en_US	familyName	Irvine
7	fr_CA	familyName	
7	en_US	givenName	Mark
7	fr_CA	givenName	
7		orcid	
7	en_US	preferredPublicName	
7	fr_CA	preferredPublicName	
7		url	
8	en_US	affiliation	Alexandria University
8		country	EG
8	en_US	familyName	Diouf
8	en_US	givenName	Diaga
9	en_US	affiliation	University of Toronto
9		country	CA
9	en_US	familyName	Phillips
9	en_US	givenName	Dana
10	en_US	affiliation	University College Cork
10		country	IE
10	en_US	familyName	Sokoloff
10	en_US	givenName	Domatilia
11	en_US	affiliation	Indiana University
11		country	US
11	en_US	familyName	Ostrom
11	en_US	givenName	Elinor
12	en_US	affiliation	Indiana University
12	fr_CA	affiliation	
12	en_US	biography	
12	fr_CA	biography	
12		country	US
12	en_US	familyName	van Laerhoven
12	fr_CA	familyName	
12	en_US	givenName	Frank
12	fr_CA	givenName	
12		orcid	
12	en_US	preferredPublicName	
12	fr_CA	preferredPublicName	
12		url	
13	en_US	affiliation	University of Rome
13		country	IT
13	en_US	familyName	Paglieri
13	en_US	givenName	Fabio
14	en_US	affiliation	University of Cape Town
14		country	ZA
14	en_US	familyName	Mwandenga
14	en_US	givenName	John
15	en_US	affiliation	Aalborg University
15		country	DK
15	en_US	familyName	Novak
15	en_US	givenName	John
16	en_US	affiliation	Stanford University
16		country	US
16	en_US	familyName	Al-Khafaji
16	en_US	givenName	Karim
17	en_US	affiliation	Stanford University
17	fr_CA	affiliation	
17	en_US	biography	
17	fr_CA	biography	
17		country	US
17	en_US	familyName	Morse
17	fr_CA	familyName	
17	en_US	givenName	Margaret
17	fr_CA	givenName	
17		orcid	
17	en_US	preferredPublicName	
17	fr_CA	preferredPublicName	
17		url	
18	en_US	affiliation	Australian National University
18		country	AU
18	en_US	familyName	Christopher
18	en_US	givenName	Leo
19	en_US	affiliation	University of Cape Town
19		country	ZA
19	en_US	familyName	Kumiega
19	en_US	givenName	Lise
20	en_US	affiliation	University of Wolverhampton
20		country	GB
20	en_US	familyName	Daniel
20	en_US	givenName	Patricia
21	en_US	affiliation	University of Nairobi
21		country	KE
21	en_US	familyName	Baiyewu
21	en_US	givenName	Rana
22	en_US	affiliation	Barcelona University
22		country	ES
22	en_US	familyName	Rossi
22	en_US	givenName	Rosanna
23	en_US	affiliation	University of Tehran
23		country	IR
23	en_US	familyName	Karbasizaed
23	en_US	givenName	Vajiheh
24	en_US	affiliation	University of Windsor
24		country	CA
24	en_US	familyName	Williamson
24	en_US	givenName	Valerie
25	en_US	affiliation	CUNY
25		country	US
25	en_US	familyName	Woods
25	en_US	givenName	Zita
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, seq, user_group_id) FROM stdin;
1	ccorino@mailinator.com	1	1	0	4
2	ckwantes@mailinator.com	1	2	0	4
3	ukk@mailinator.com	1	2	1	4
4	cmontgomerie@mailinator.com	1	3	0	4
5	mirvine@mailinator.com	1	3	1	4
6	cmontgomerie@mailinator.com	1	4	0	4
7	mirvine@mailinator.com	1	4	1	4
8	ddiouf@mailinator.com	1	5	0	4
9	dphillips@mailinator.com	1	6	0	4
10	dsokoloff@mailinator.com	1	7	0	4
11	eostrom@mailinator.com	1	8	0	4
12	fvanlaerhoven@mailinator.com	1	8	1	4
13	fpaglieri@mailinator.com	1	9	0	4
14	jmwandenga@mailinator.com	1	10	0	4
15	jnovak@mailinator.com	1	11	0	4
16	kalkhafaji@mailinator.com	1	12	0	4
17	mmorse@mailinator.com	1	12	1	4
18	lchristopher@mailinator.com	1	13	0	4
19	lkumiega@mailinator.com	1	14	0	4
20	pdaniel@mailinator.com	1	15	0	4
21	rbaiyewu@mailinator.com	1	16	0	4
22	rrossi@mailinator.com	1	17	0	4
23	vkarbasizaed@mailinator.com	1	18	0	4
24	vwilliamson@mailinator.com	1	19	0	4
25	zwoods@mailinator.com	1	20	0	4
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 25, true);


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
1	2	1
2	2	2
85	32	1
86	32	2
90	37	1
11	7	1
12	7	2
13	7	3
91	37	2
92	37	3
94	52	1
99	57	1
100	57	2
101	57	3
102	57	4
105	62	1
106	62	2
108	67	1
119	72	1
43	12	1
44	12	2
45	12	3
46	12	4
47	12	5
48	12	6
49	12	7
50	12	8
120	72	2
121	72	3
122	72	4
123	72	5
124	72	6
125	72	7
126	72	8
127	72	9
128	72	10
131	82	1
132	82	2
136	92	1
137	92	2
138	92	3
75	17	1
76	17	2
77	17	3
78	17	4
79	17	5
80	17	6
81	17	7
82	17	8
\.


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 138, true);


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	submissionKeyword	pigs	string
2	en_US	submissionKeyword	food security	string
85	en_US	submissionKeyword	education	string
86	en_US	submissionKeyword	citizenship	string
90	en_US	submissionKeyword	Common pool resource	string
11	en_US	submissionKeyword	employees	string
12	en_US	submissionKeyword	survey	string
13	en_US	submissionKeyword	multinational	string
91	en_US	submissionKeyword	common property	string
92	en_US	submissionKeyword	intellectual developments	string
94	en_US	submissionKeyword	water	string
99	en_US	submissionKeyword	Development	string
100	en_US	submissionKeyword	engineering education	string
101	en_US	submissionKeyword	service learning	string
102	en_US	submissionKeyword	sustainability	string
105	en_US	submissionKeyword	pigs	string
106	en_US	submissionKeyword	food security	string
108	en_US	submissionKeyword	water	string
119	en_US	submissionKeyword	21st Century	string
43	en_US	submissionKeyword	Integrating Technology	string
44	en_US	submissionKeyword	Computer Skills	string
45	en_US	submissionKeyword	Survey	string
46	en_US	submissionKeyword	Alberta	string
47	en_US	submissionKeyword	National	string
48	en_US	submissionKeyword	Provincial	string
49	en_US	submissionKeyword	Professional Development	string
50	en_US	submissionKeyword	employees	string
120	en_US	submissionKeyword	Diversity	string
121	en_US	submissionKeyword	Multilingual	string
122	en_US	submissionKeyword	Multiethnic	string
123	en_US	submissionKeyword	Participatory Pedagogy	string
124	en_US	submissionKeyword	Language	string
125	en_US	submissionKeyword	Culture	string
126	en_US	submissionKeyword	Gender	string
127	en_US	submissionKeyword	Egalitarianism	string
128	en_US	submissionKeyword	Social Transformation	string
131	en_US	submissionKeyword	cattle	string
132	en_US	submissionKeyword	food security	string
136	en_US	submissionKeyword	Self-Organization	string
137	en_US	submissionKeyword	Multi-Level Institutions	string
138	en_US	submissionKeyword	Goverance	string
75	en_US	submissionKeyword	Integrating Technology	string
76	en_US	submissionKeyword	Computer Skills	string
77	en_US	submissionKeyword	Survey	string
78	en_US	submissionKeyword	Alberta	string
79	en_US	submissionKeyword	National	string
80	en_US	submissionKeyword	Provincial	string
81	en_US	submissionKeyword	Professional Development	string
82	en_US	submissionKeyword	employees	string
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocabs (controlled_vocab_id, symbolic, assoc_type, assoc_id) FROM stdin;
1	interest	0	0
2	submissionKeyword	1048588	1
3	submissionSubject	1048588	1
4	submissionDiscipline	1048588	1
5	submissionLanguage	1048588	1
6	submissionAgency	1048588	1
7	submissionKeyword	1048588	2
8	submissionSubject	1048588	2
9	submissionDiscipline	1048588	2
10	submissionLanguage	1048588	2
11	submissionAgency	1048588	2
12	submissionKeyword	1048588	3
13	submissionSubject	1048588	3
14	submissionDiscipline	1048588	3
15	submissionLanguage	1048588	3
16	submissionAgency	1048588	3
17	submissionKeyword	1048588	4
18	submissionSubject	1048588	4
19	submissionDiscipline	1048588	4
20	submissionLanguage	1048588	4
21	submissionAgency	1048588	4
22	submissionKeyword	1048588	5
23	submissionSubject	1048588	5
24	submissionDiscipline	1048588	5
25	submissionLanguage	1048588	5
26	submissionAgency	1048588	5
27	submissionKeyword	1048588	6
28	submissionSubject	1048588	6
29	submissionDiscipline	1048588	6
30	submissionLanguage	1048588	6
31	submissionAgency	1048588	6
32	submissionKeyword	1048588	7
33	submissionSubject	1048588	7
34	submissionDiscipline	1048588	7
35	submissionLanguage	1048588	7
36	submissionAgency	1048588	7
37	submissionKeyword	1048588	8
38	submissionSubject	1048588	8
39	submissionDiscipline	1048588	8
40	submissionLanguage	1048588	8
41	submissionAgency	1048588	8
42	submissionKeyword	1048588	9
43	submissionSubject	1048588	9
44	submissionDiscipline	1048588	9
45	submissionLanguage	1048588	9
46	submissionAgency	1048588	9
47	submissionKeyword	1048588	10
48	submissionSubject	1048588	10
49	submissionDiscipline	1048588	10
50	submissionLanguage	1048588	10
51	submissionAgency	1048588	10
52	submissionKeyword	1048588	11
53	submissionSubject	1048588	11
54	submissionDiscipline	1048588	11
55	submissionLanguage	1048588	11
56	submissionAgency	1048588	11
57	submissionKeyword	1048588	12
58	submissionSubject	1048588	12
59	submissionDiscipline	1048588	12
60	submissionLanguage	1048588	12
61	submissionAgency	1048588	12
62	submissionKeyword	1048588	13
63	submissionSubject	1048588	13
64	submissionDiscipline	1048588	13
65	submissionLanguage	1048588	13
66	submissionAgency	1048588	13
67	submissionKeyword	1048588	14
68	submissionSubject	1048588	14
69	submissionDiscipline	1048588	14
70	submissionLanguage	1048588	14
71	submissionAgency	1048588	14
72	submissionKeyword	1048588	15
73	submissionSubject	1048588	15
74	submissionDiscipline	1048588	15
75	submissionLanguage	1048588	15
76	submissionAgency	1048588	15
77	submissionKeyword	1048588	16
78	submissionSubject	1048588	16
79	submissionDiscipline	1048588	16
80	submissionLanguage	1048588	16
81	submissionAgency	1048588	16
82	submissionKeyword	1048588	17
83	submissionSubject	1048588	17
84	submissionDiscipline	1048588	17
85	submissionLanguage	1048588	17
86	submissionAgency	1048588	17
87	submissionKeyword	1048588	18
88	submissionSubject	1048588	18
89	submissionDiscipline	1048588	18
90	submissionLanguage	1048588	18
91	submissionAgency	1048588	18
92	submissionKeyword	1048588	19
93	submissionSubject	1048588	19
94	submissionDiscipline	1048588	19
95	submissionLanguage	1048588	19
96	submissionAgency	1048588	19
97	submissionKeyword	1048588	20
98	submissionSubject	1048588	20
99	submissionDiscipline	1048588	20
100	submissionLanguage	1048588	20
101	submissionAgency	1048588	20
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

COPY public.email_templates_default (email_id, email_key, can_disable, can_edit, from_role_id, to_role_id, stage_id) FROM stdin;
1	NOTIFICATION	0	1	\N	\N	\N
2	NOTIFICATION_CENTER_DEFAULT	0	1	\N	\N	\N
3	PASSWORD_RESET_CONFIRM	0	1	\N	\N	\N
4	USER_REGISTER	0	1	\N	\N	\N
5	USER_VALIDATE	0	1	\N	\N	\N
6	PUBLISH_NOTIFY	0	1	\N	\N	\N
7	SUBMISSION_ACK	1	1	\N	65536	5
8	POSTED_ACK	1	1	\N	65536	5
9	SUBMISSION_ACK_NOT_USER	1	1	\N	65536	5
10	EDITOR_ASSIGN	1	1	16	16	5
11	EDITOR_DECISION_ACCEPT	0	1	16	65536	5
12	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536	5
13	STATISTICS_REPORT_NOTIFICATION	1	1	16	17	\N
14	ANNOUNCEMENT	0	1	16	1048576	\N
15	ORCID_COLLECT_AUTHOR_ID	0	1	\N	\N	\N
16	ORCID_REQUEST_AUTHOR_AUTHORIZATION	0	1	\N	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$contextName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
USER_REGISTER	en_US	Server Registration	{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server's list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE	en_US	Validate Your Account	{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to validate their email account.
PUBLISH_NOTIFY	en_US	New Preprint Posted	Readers:<br />\n<br />\n{$contextName} has just posted its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Moderator's User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.
POSTED_ACK	en_US	Preprint Posted Acknowledgement	{$authorName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$contextName}.<br />\n<br />\nPreprint URL: {$publicationUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.
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
1	1048585	1	7	2023-01-20 02:01:59	268435458	submission.event.general.metadataUpdated	0
2	515	1	7	2023-01-20 02:02:08	1342177281	submission.event.fileUploaded	0
3	1048585	1	7	2023-01-20 02:02:08	1342177288	submission.event.fileRevised	0
4	515	1	7	2023-01-20 02:02:10	1342177296	submission.event.fileEdited	0
5	1048585	1	7	2023-01-20 02:02:10	1342177296	submission.event.fileEdited	0
6	1048585	1	7	2023-01-20 02:02:13	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	7	2023-01-20 02:02:15	268435457	submission.event.submissionSubmitted	0
8	1048585	2	8	2023-01-20 02:02:22	268435458	submission.event.general.metadataUpdated	0
9	515	2	8	2023-01-20 02:02:30	1342177281	submission.event.fileUploaded	0
10	1048585	2	8	2023-01-20 02:02:30	1342177288	submission.event.fileRevised	0
11	515	2	8	2023-01-20 02:02:33	1342177296	submission.event.fileEdited	0
12	1048585	2	8	2023-01-20 02:02:33	1342177296	submission.event.fileEdited	0
13	1048585	2	8	2023-01-20 02:02:36	268435458	submission.event.general.metadataUpdated	0
14	1048585	2	8	2023-01-20 02:02:37	268435457	submission.event.submissionSubmitted	0
15	1048585	2	8	2023-01-20 02:02:41	268435458	submission.event.general.metadataUpdated	0
16	1048585	2	8	2023-01-20 02:02:49	268435458	submission.event.general.metadataUpdated	0
17	1048585	2	3	2023-01-20 02:02:55	268435462	publication.event.published	0
18	1048585	3	9	2023-01-20 02:03:02	268435458	submission.event.general.metadataUpdated	0
19	515	3	9	2023-01-20 02:03:11	1342177281	submission.event.fileUploaded	0
20	1048585	3	9	2023-01-20 02:03:11	1342177288	submission.event.fileRevised	0
21	515	3	9	2023-01-20 02:03:13	1342177296	submission.event.fileEdited	0
22	1048585	3	9	2023-01-20 02:03:13	1342177296	submission.event.fileEdited	0
23	1048585	3	9	2023-01-20 02:03:19	268435458	submission.event.general.metadataUpdated	0
24	1048585	3	9	2023-01-20 02:03:21	268435457	submission.event.submissionSubmitted	0
25	1048585	3	3	2023-01-20 02:03:26	268435462	publication.event.published	0
26	1048585	3	3	2023-01-20 02:03:32	268435463	publication.event.unpublished	0
27	1048585	3	3	2023-01-20 02:03:35	268435458	submission.event.general.metadataUpdated	0
28	1048585	3	3	2023-01-20 02:03:39	268435462	publication.event.published	0
29	1048585	3	3	2023-01-20 02:03:41	268435458	submission.event.general.metadataUpdated	0
30	1048585	3	3	2023-01-20 02:03:42	268435464	publication.event.versionCreated	0
31	1048585	3	3	2023-01-20 02:03:46	268435458	submission.event.general.metadataUpdated	0
32	1048585	3	3	2023-01-20 02:03:49	268435462	publication.event.versionPublished	0
33	1048585	4	10	2023-01-20 02:03:56	268435458	submission.event.general.metadataUpdated	0
34	515	4	10	2023-01-20 02:04:05	1342177281	submission.event.fileUploaded	0
35	1048585	4	10	2023-01-20 02:04:05	1342177288	submission.event.fileRevised	0
36	515	4	10	2023-01-20 02:04:07	1342177296	submission.event.fileEdited	0
37	1048585	4	10	2023-01-20 02:04:07	1342177296	submission.event.fileEdited	0
38	1048585	4	10	2023-01-20 02:04:10	268435458	submission.event.general.metadataUpdated	0
39	1048585	4	10	2023-01-20 02:04:11	268435457	submission.event.submissionSubmitted	0
40	1048585	4	3	2023-01-20 02:04:17	268435462	publication.event.published	0
41	1048585	5	11	2023-01-20 02:04:23	268435458	submission.event.general.metadataUpdated	0
42	515	5	11	2023-01-20 02:04:32	1342177281	submission.event.fileUploaded	0
43	1048585	5	11	2023-01-20 02:04:32	1342177288	submission.event.fileRevised	0
44	515	5	11	2023-01-20 02:04:35	1342177296	submission.event.fileEdited	0
45	1048585	5	11	2023-01-20 02:04:35	1342177296	submission.event.fileEdited	0
46	1048585	5	11	2023-01-20 02:04:38	268435458	submission.event.general.metadataUpdated	0
47	1048585	5	11	2023-01-20 02:04:39	268435457	submission.event.submissionSubmitted	0
48	1048585	5	3	2023-01-20 02:04:45	268435462	publication.event.published	0
49	1048585	6	12	2023-01-20 02:04:54	268435458	submission.event.general.metadataUpdated	0
50	515	6	12	2023-01-20 02:05:03	1342177281	submission.event.fileUploaded	0
51	1048585	6	12	2023-01-20 02:05:03	1342177288	submission.event.fileRevised	0
52	515	6	12	2023-01-20 02:05:05	1342177296	submission.event.fileEdited	0
53	1048585	6	12	2023-01-20 02:05:05	1342177296	submission.event.fileEdited	0
54	1048585	6	12	2023-01-20 02:05:08	268435458	submission.event.general.metadataUpdated	0
55	1048585	6	12	2023-01-20 02:05:09	268435457	submission.event.submissionSubmitted	0
56	1048585	6	3	2023-01-20 02:05:15	268435462	publication.event.published	0
57	1048585	7	13	2023-01-20 02:05:21	268435458	submission.event.general.metadataUpdated	0
58	515	7	13	2023-01-20 02:05:31	1342177281	submission.event.fileUploaded	0
59	1048585	7	13	2023-01-20 02:05:31	1342177288	submission.event.fileRevised	0
60	515	7	13	2023-01-20 02:05:33	1342177296	submission.event.fileEdited	0
61	1048585	7	13	2023-01-20 02:05:33	1342177296	submission.event.fileEdited	0
62	1048585	7	13	2023-01-20 02:05:39	268435458	submission.event.general.metadataUpdated	0
63	1048585	7	13	2023-01-20 02:05:40	268435457	submission.event.submissionSubmitted	0
64	1048585	7	3	2023-01-20 02:05:46	268435462	publication.event.published	0
65	1048585	8	14	2023-01-20 02:05:53	268435458	submission.event.general.metadataUpdated	0
66	515	8	14	2023-01-20 02:06:02	1342177281	submission.event.fileUploaded	0
67	1048585	8	14	2023-01-20 02:06:02	1342177288	submission.event.fileRevised	0
68	515	8	14	2023-01-20 02:06:04	1342177296	submission.event.fileEdited	0
69	1048585	8	14	2023-01-20 02:06:04	1342177296	submission.event.fileEdited	0
70	1048585	8	14	2023-01-20 02:06:07	268435458	submission.event.general.metadataUpdated	0
71	1048585	8	14	2023-01-20 02:06:08	268435457	submission.event.submissionSubmitted	0
72	1048585	8	3	2023-01-20 02:06:13	268435462	publication.event.published	0
73	1048585	9	15	2023-01-20 02:06:20	268435458	submission.event.general.metadataUpdated	0
74	515	9	15	2023-01-20 02:06:29	1342177281	submission.event.fileUploaded	0
75	1048585	9	15	2023-01-20 02:06:29	1342177288	submission.event.fileRevised	0
76	515	9	15	2023-01-20 02:06:32	1342177296	submission.event.fileEdited	0
77	1048585	9	15	2023-01-20 02:06:32	1342177296	submission.event.fileEdited	0
78	1048585	9	15	2023-01-20 02:06:35	268435458	submission.event.general.metadataUpdated	0
79	1048585	9	15	2023-01-20 02:06:36	268435457	submission.event.submissionSubmitted	0
80	1048585	9	3	2023-01-20 02:06:41	268435462	publication.event.published	0
81	1048585	10	16	2023-01-20 02:06:48	268435458	submission.event.general.metadataUpdated	0
82	515	10	16	2023-01-20 02:06:57	1342177281	submission.event.fileUploaded	0
83	1048585	10	16	2023-01-20 02:06:57	1342177288	submission.event.fileRevised	0
84	515	10	16	2023-01-20 02:07:00	1342177296	submission.event.fileEdited	0
85	1048585	10	16	2023-01-20 02:07:00	1342177296	submission.event.fileEdited	0
86	1048585	10	16	2023-01-20 02:07:03	268435458	submission.event.general.metadataUpdated	0
87	1048585	10	16	2023-01-20 02:07:04	268435457	submission.event.submissionSubmitted	0
88	1048585	10	3	2023-01-20 02:07:09	268435462	publication.event.published	0
89	1048585	11	17	2023-01-20 02:07:17	268435458	submission.event.general.metadataUpdated	0
90	515	11	17	2023-01-20 02:07:26	1342177281	submission.event.fileUploaded	0
91	1048585	11	17	2023-01-20 02:07:26	1342177288	submission.event.fileRevised	0
92	515	11	17	2023-01-20 02:07:28	1342177296	submission.event.fileEdited	0
93	1048585	11	17	2023-01-20 02:07:28	1342177296	submission.event.fileEdited	0
94	1048585	11	17	2023-01-20 02:07:34	268435458	submission.event.general.metadataUpdated	0
95	1048585	11	17	2023-01-20 02:07:35	268435457	submission.event.submissionSubmitted	0
96	1048585	11	3	2023-01-20 02:07:41	268435462	publication.event.published	0
97	1048585	12	18	2023-01-20 02:07:48	268435458	submission.event.general.metadataUpdated	0
98	515	12	18	2023-01-20 02:07:57	1342177281	submission.event.fileUploaded	0
99	1048585	12	18	2023-01-20 02:07:57	1342177288	submission.event.fileRevised	0
100	515	12	18	2023-01-20 02:08:00	1342177296	submission.event.fileEdited	0
101	1048585	12	18	2023-01-20 02:08:00	1342177296	submission.event.fileEdited	0
102	1048585	12	18	2023-01-20 02:08:03	268435458	submission.event.general.metadataUpdated	0
103	1048585	12	18	2023-01-20 02:08:04	268435457	submission.event.submissionSubmitted	0
104	1048585	12	3	2023-01-20 02:08:10	268435462	publication.event.published	0
105	1048585	13	19	2023-01-20 02:08:17	268435458	submission.event.general.metadataUpdated	0
106	515	13	19	2023-01-20 02:08:26	1342177281	submission.event.fileUploaded	0
107	1048585	13	19	2023-01-20 02:08:26	1342177288	submission.event.fileRevised	0
108	515	13	19	2023-01-20 02:08:28	1342177296	submission.event.fileEdited	0
109	1048585	13	19	2023-01-20 02:08:28	1342177296	submission.event.fileEdited	0
110	1048585	13	19	2023-01-20 02:08:32	268435458	submission.event.general.metadataUpdated	0
111	1048585	13	19	2023-01-20 02:08:33	268435457	submission.event.submissionSubmitted	0
112	1048585	13	3	2023-01-20 02:08:39	268435462	publication.event.published	0
113	1048585	14	20	2023-01-20 02:08:46	268435458	submission.event.general.metadataUpdated	0
114	515	14	20	2023-01-20 02:08:55	1342177281	submission.event.fileUploaded	0
115	1048585	14	20	2023-01-20 02:08:55	1342177288	submission.event.fileRevised	0
116	515	14	20	2023-01-20 02:08:57	1342177296	submission.event.fileEdited	0
117	1048585	14	20	2023-01-20 02:08:57	1342177296	submission.event.fileEdited	0
118	1048585	14	20	2023-01-20 02:09:00	268435458	submission.event.general.metadataUpdated	0
119	1048585	14	20	2023-01-20 02:09:02	268435457	submission.event.submissionSubmitted	0
120	1048585	14	3	2023-01-20 02:09:08	268435462	publication.event.published	0
121	1048585	15	21	2023-01-20 02:09:15	268435458	submission.event.general.metadataUpdated	0
122	515	15	21	2023-01-20 02:09:24	1342177281	submission.event.fileUploaded	0
123	1048585	15	21	2023-01-20 02:09:24	1342177288	submission.event.fileRevised	0
124	515	15	21	2023-01-20 02:09:26	1342177296	submission.event.fileEdited	0
125	1048585	15	21	2023-01-20 02:09:26	1342177296	submission.event.fileEdited	0
126	1048585	15	21	2023-01-20 02:09:29	268435458	submission.event.general.metadataUpdated	0
127	1048585	15	21	2023-01-20 02:09:30	268435457	submission.event.submissionSubmitted	0
128	1048585	15	3	2023-01-20 02:09:36	268435462	publication.event.published	0
129	1048585	16	22	2023-01-20 02:09:43	268435458	submission.event.general.metadataUpdated	0
130	515	16	22	2023-01-20 02:09:52	1342177281	submission.event.fileUploaded	0
131	1048585	16	22	2023-01-20 02:09:52	1342177288	submission.event.fileRevised	0
132	515	16	22	2023-01-20 02:09:55	1342177296	submission.event.fileEdited	0
133	1048585	16	22	2023-01-20 02:09:55	1342177296	submission.event.fileEdited	0
134	1048585	16	22	2023-01-20 02:09:58	268435458	submission.event.general.metadataUpdated	0
135	1048585	16	22	2023-01-20 02:09:59	268435457	submission.event.submissionSubmitted	0
136	1048585	16	3	2023-01-20 02:10:05	268435462	publication.event.published	0
137	1048585	17	23	2023-01-20 02:10:12	268435458	submission.event.general.metadataUpdated	0
138	515	17	23	2023-01-20 02:10:21	1342177281	submission.event.fileUploaded	0
139	1048585	17	23	2023-01-20 02:10:21	1342177288	submission.event.fileRevised	0
140	515	17	23	2023-01-20 02:10:24	1342177296	submission.event.fileEdited	0
141	1048585	17	23	2023-01-20 02:10:24	1342177296	submission.event.fileEdited	0
142	1048585	17	23	2023-01-20 02:10:27	268435458	submission.event.general.metadataUpdated	0
143	1048585	17	23	2023-01-20 02:10:28	268435457	submission.event.submissionSubmitted	0
144	1048585	17	3	2023-01-20 02:10:35	268435462	publication.event.published	0
145	1048585	18	24	2023-01-20 02:10:42	268435458	submission.event.general.metadataUpdated	0
146	515	18	24	2023-01-20 02:10:51	1342177281	submission.event.fileUploaded	0
147	1048585	18	24	2023-01-20 02:10:51	1342177288	submission.event.fileRevised	0
148	515	18	24	2023-01-20 02:10:53	1342177296	submission.event.fileEdited	0
149	1048585	18	24	2023-01-20 02:10:53	1342177296	submission.event.fileEdited	0
150	1048585	18	24	2023-01-20 02:10:56	268435458	submission.event.general.metadataUpdated	0
151	1048585	18	24	2023-01-20 02:10:57	268435457	submission.event.submissionSubmitted	0
152	1048585	18	3	2023-01-20 02:11:04	268435462	publication.event.published	0
153	1048585	19	25	2023-01-20 02:11:10	268435458	submission.event.general.metadataUpdated	0
154	515	19	25	2023-01-20 02:11:19	1342177281	submission.event.fileUploaded	0
155	1048585	19	25	2023-01-20 02:11:19	1342177288	submission.event.fileRevised	0
156	515	19	25	2023-01-20 02:11:22	1342177296	submission.event.fileEdited	0
157	1048585	19	25	2023-01-20 02:11:22	1342177296	submission.event.fileEdited	0
158	1048585	19	25	2023-01-20 02:11:24	268435458	submission.event.general.metadataUpdated	0
159	1048585	19	25	2023-01-20 02:11:25	268435457	submission.event.submissionSubmitted	0
160	1048585	19	3	2023-01-20 02:11:32	268435462	publication.event.published	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 160, true);


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
2	fileStage	10	int
2	sourceSubmissionFileId	\N	string
2	submissionFileId	1	int
2	fileId	1	int
2	submissionId	1	int
2	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
2	username	ccorino	string
3	fileStage	10	int
3	submissionFileId	1	int
3	fileId	1	int
3	submissionId	1	int
3	username	ccorino	string
3	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
4	fileStage	10	int
4	sourceSubmissionFileId	\N	string
4	submissionFileId	1	int
4	fileId	1	int
4	submissionId	1	int
4	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
4	username	ccorino	string
5	fileStage	10	int
5	sourceSubmissionFileId	\N	string
5	submissionFileId	1	int
5	fileId	1	int
5	submissionId	1	int
5	username	ccorino	string
5	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
5	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
9	fileStage	10	int
9	sourceSubmissionFileId	\N	string
9	submissionFileId	2	int
9	fileId	2	int
9	submissionId	2	int
9	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
9	username	ckwantes	string
10	fileStage	10	int
10	submissionFileId	2	int
10	fileId	2	int
10	submissionId	2	int
10	username	ckwantes	string
10	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
11	fileStage	10	int
11	sourceSubmissionFileId	\N	string
11	submissionFileId	2	int
11	fileId	2	int
11	submissionId	2	int
11	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
11	username	ckwantes	string
12	fileStage	10	int
12	sourceSubmissionFileId	\N	string
12	submissionFileId	2	int
12	fileId	2	int
12	submissionId	2	int
12	username	ckwantes	string
12	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
12	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
19	fileStage	10	int
19	sourceSubmissionFileId	\N	string
19	submissionFileId	3	int
19	fileId	3	int
19	submissionId	3	int
19	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
19	username	cmontgomerie	string
20	fileStage	10	int
20	submissionFileId	3	int
20	fileId	3	int
20	submissionId	3	int
20	username	cmontgomerie	string
20	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
21	fileStage	10	int
21	sourceSubmissionFileId	\N	string
21	submissionFileId	3	int
21	fileId	3	int
21	submissionId	3	int
21	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
21	username	cmontgomerie	string
22	fileStage	10	int
22	sourceSubmissionFileId	\N	string
22	submissionFileId	3	int
22	fileId	3	int
22	submissionId	3	int
22	username	cmontgomerie	string
22	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
22	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
34	fileStage	10	int
34	sourceSubmissionFileId	\N	string
34	submissionFileId	4	int
34	fileId	4	int
34	submissionId	4	int
34	originalFileName	Genetic transformation of forest trees.pdf	string
34	username	ddiouf	string
35	fileStage	10	int
35	submissionFileId	4	int
35	fileId	4	int
35	submissionId	4	int
35	username	ddiouf	string
35	name	Genetic transformation of forest trees.pdf	string
36	fileStage	10	int
36	sourceSubmissionFileId	\N	string
36	submissionFileId	4	int
36	fileId	4	int
36	submissionId	4	int
36	originalFileName	Genetic transformation of forest trees.pdf	string
36	username	ddiouf	string
37	fileStage	10	int
37	sourceSubmissionFileId	\N	string
37	submissionFileId	4	int
37	fileId	4	int
37	submissionId	4	int
37	username	ddiouf	string
37	originalFileName	Genetic transformation of forest trees.pdf	string
37	name	Genetic transformation of forest trees.pdf	string
42	fileStage	10	int
42	sourceSubmissionFileId	\N	string
42	submissionFileId	5	int
42	fileId	5	int
42	submissionId	5	int
42	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
42	username	dphillips	string
43	fileStage	10	int
43	submissionFileId	5	int
43	fileId	5	int
43	submissionId	5	int
43	username	dphillips	string
43	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
44	fileStage	10	int
44	sourceSubmissionFileId	\N	string
44	submissionFileId	5	int
44	fileId	5	int
44	submissionId	5	int
44	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
44	username	dphillips	string
45	fileStage	10	int
45	sourceSubmissionFileId	\N	string
45	submissionFileId	5	int
45	fileId	5	int
45	submissionId	5	int
45	username	dphillips	string
45	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
45	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
50	fileStage	10	int
50	sourceSubmissionFileId	\N	string
50	submissionFileId	6	int
50	fileId	6	int
50	submissionId	6	int
50	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
50	username	dsokoloff	string
51	fileStage	10	int
51	submissionFileId	6	int
51	fileId	6	int
51	submissionId	6	int
51	username	dsokoloff	string
51	name	Developing efficacy beliefs in the classroom.pdf	string
52	fileStage	10	int
52	sourceSubmissionFileId	\N	string
52	submissionFileId	6	int
52	fileId	6	int
52	submissionId	6	int
52	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
52	username	dsokoloff	string
53	fileStage	10	int
53	sourceSubmissionFileId	\N	string
53	submissionFileId	6	int
53	fileId	6	int
53	submissionId	6	int
53	username	dsokoloff	string
53	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
53	name	Developing efficacy beliefs in the classroom.pdf	string
58	fileStage	10	int
58	sourceSubmissionFileId	\N	string
58	submissionFileId	7	int
58	fileId	7	int
58	submissionId	7	int
58	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
58	username	eostrom	string
59	fileStage	10	int
59	submissionFileId	7	int
59	fileId	7	int
59	submissionId	7	int
59	username	eostrom	string
59	name	Traditions and Trends in the Study of the Commons.pdf	string
60	fileStage	10	int
60	sourceSubmissionFileId	\N	string
60	submissionFileId	7	int
60	fileId	7	int
60	submissionId	7	int
60	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
60	username	eostrom	string
61	fileStage	10	int
61	sourceSubmissionFileId	\N	string
61	submissionFileId	7	int
61	fileId	7	int
61	submissionId	7	int
61	username	eostrom	string
61	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
61	name	Traditions and Trends in the Study of the Commons.pdf	string
66	fileStage	10	int
66	sourceSubmissionFileId	\N	string
66	submissionFileId	8	int
66	fileId	8	int
66	submissionId	8	int
66	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
66	username	fpaglieri	string
67	fileStage	10	int
67	submissionFileId	8	int
67	fileId	8	int
67	submissionId	8	int
67	username	fpaglieri	string
67	name	Hansen & Pinto: Reason Reclaimed.pdf	string
68	fileStage	10	int
68	sourceSubmissionFileId	\N	string
68	submissionFileId	8	int
68	fileId	8	int
68	submissionId	8	int
68	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
68	username	fpaglieri	string
69	fileStage	10	int
69	sourceSubmissionFileId	\N	string
69	submissionFileId	8	int
69	fileId	8	int
69	submissionId	8	int
69	username	fpaglieri	string
69	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
69	name	Hansen & Pinto: Reason Reclaimed.pdf	string
74	fileStage	10	int
74	sourceSubmissionFileId	\N	string
74	submissionFileId	9	int
74	fileId	9	int
74	submissionId	9	int
74	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
74	username	jmwandenga	string
75	fileStage	10	int
75	submissionFileId	9	int
75	fileId	9	int
75	submissionId	9	int
75	username	jmwandenga	string
75	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
76	fileStage	10	int
76	sourceSubmissionFileId	\N	string
76	submissionFileId	9	int
76	fileId	9	int
76	submissionId	9	int
76	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
76	username	jmwandenga	string
77	fileStage	10	int
77	sourceSubmissionFileId	\N	string
77	submissionFileId	9	int
77	fileId	9	int
77	submissionId	9	int
77	username	jmwandenga	string
77	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
77	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
82	fileStage	10	int
82	sourceSubmissionFileId	\N	string
82	submissionFileId	10	int
82	fileId	10	int
82	submissionId	10	int
82	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
82	username	jnovak	string
83	fileStage	10	int
83	submissionFileId	10	int
83	fileId	10	int
83	submissionId	10	int
83	username	jnovak	string
83	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
84	fileStage	10	int
84	sourceSubmissionFileId	\N	string
84	submissionFileId	10	int
84	fileId	10	int
84	submissionId	10	int
84	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
84	username	jnovak	string
85	fileStage	10	int
85	sourceSubmissionFileId	\N	string
85	submissionFileId	10	int
85	fileId	10	int
85	submissionId	10	int
85	username	jnovak	string
85	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
85	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
90	fileStage	10	int
90	sourceSubmissionFileId	\N	string
90	submissionFileId	11	int
90	fileId	11	int
90	submissionId	11	int
90	originalFileName	Learning Sustainable Design through Service.pdf	string
90	username	kalkhafaji	string
91	fileStage	10	int
91	submissionFileId	11	int
91	fileId	11	int
91	submissionId	11	int
91	username	kalkhafaji	string
91	name	Learning Sustainable Design through Service.pdf	string
92	fileStage	10	int
92	sourceSubmissionFileId	\N	string
92	submissionFileId	11	int
92	fileId	11	int
92	submissionId	11	int
92	originalFileName	Learning Sustainable Design through Service.pdf	string
92	username	kalkhafaji	string
93	fileStage	10	int
93	sourceSubmissionFileId	\N	string
93	submissionFileId	11	int
93	fileId	11	int
93	submissionId	11	int
93	username	kalkhafaji	string
93	originalFileName	Learning Sustainable Design through Service.pdf	string
93	name	Learning Sustainable Design through Service.pdf	string
98	fileStage	10	int
98	sourceSubmissionFileId	\N	string
98	submissionFileId	12	int
98	fileId	12	int
98	submissionId	12	int
98	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
98	username	lchristopher	string
99	fileStage	10	int
99	submissionFileId	12	int
99	fileId	12	int
99	submissionId	12	int
99	username	lchristopher	string
99	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
100	fileStage	10	int
100	sourceSubmissionFileId	\N	string
100	submissionFileId	12	int
100	fileId	12	int
100	submissionId	12	int
100	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
100	username	lchristopher	string
101	fileStage	10	int
101	sourceSubmissionFileId	\N	string
101	submissionFileId	12	int
101	fileId	12	int
101	submissionId	12	int
101	username	lchristopher	string
101	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
101	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
106	fileStage	10	int
106	sourceSubmissionFileId	\N	string
106	submissionFileId	13	int
106	fileId	13	int
106	submissionId	13	int
106	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
106	username	lkumiega	string
107	fileStage	10	int
107	submissionFileId	13	int
107	fileId	13	int
107	submissionId	13	int
107	username	lkumiega	string
107	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
108	fileStage	10	int
108	sourceSubmissionFileId	\N	string
108	submissionFileId	13	int
108	fileId	13	int
108	submissionId	13	int
108	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
108	username	lkumiega	string
109	fileStage	10	int
109	sourceSubmissionFileId	\N	string
109	submissionFileId	13	int
109	fileId	13	int
109	submissionId	13	int
109	username	lkumiega	string
109	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
109	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
114	fileStage	10	int
114	sourceSubmissionFileId	\N	string
114	submissionFileId	14	int
114	fileId	14	int
114	submissionId	14	int
114	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
114	username	pdaniel	string
115	fileStage	10	int
115	submissionFileId	14	int
115	fileId	14	int
115	submissionId	14	int
115	username	pdaniel	string
115	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
116	fileStage	10	int
116	sourceSubmissionFileId	\N	string
116	submissionFileId	14	int
116	fileId	14	int
116	submissionId	14	int
116	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
116	username	pdaniel	string
117	fileStage	10	int
117	sourceSubmissionFileId	\N	string
117	submissionFileId	14	int
117	fileId	14	int
117	submissionId	14	int
117	username	pdaniel	string
117	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
117	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
122	fileStage	10	int
122	sourceSubmissionFileId	\N	string
122	submissionFileId	15	int
122	fileId	15	int
122	submissionId	15	int
122	originalFileName	Yam diseases and its management in Nigeria.pdf	string
122	username	rbaiyewu	string
123	fileStage	10	int
123	submissionFileId	15	int
123	fileId	15	int
123	submissionId	15	int
123	username	rbaiyewu	string
123	name	Yam diseases and its management in Nigeria.pdf	string
124	fileStage	10	int
124	sourceSubmissionFileId	\N	string
124	submissionFileId	15	int
124	fileId	15	int
124	submissionId	15	int
124	originalFileName	Yam diseases and its management in Nigeria.pdf	string
124	username	rbaiyewu	string
125	fileStage	10	int
125	sourceSubmissionFileId	\N	string
125	submissionFileId	15	int
125	fileId	15	int
125	submissionId	15	int
125	username	rbaiyewu	string
125	originalFileName	Yam diseases and its management in Nigeria.pdf	string
125	name	Yam diseases and its management in Nigeria.pdf	string
130	fileStage	10	int
130	sourceSubmissionFileId	\N	string
130	submissionFileId	16	int
130	fileId	16	int
130	submissionId	16	int
130	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
130	username	rrossi	string
131	fileStage	10	int
131	submissionFileId	16	int
131	fileId	16	int
131	submissionId	16	int
131	username	rrossi	string
131	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
132	fileStage	10	int
132	sourceSubmissionFileId	\N	string
132	submissionFileId	16	int
132	fileId	16	int
132	submissionId	16	int
132	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
132	username	rrossi	string
133	fileStage	10	int
133	sourceSubmissionFileId	\N	string
133	submissionFileId	16	int
133	fileId	16	int
133	submissionId	16	int
133	username	rrossi	string
133	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
133	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
138	fileStage	10	int
138	sourceSubmissionFileId	\N	string
138	submissionFileId	17	int
138	fileId	17	int
138	submissionId	17	int
138	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
138	username	vkarbasizaed	string
139	fileStage	10	int
139	submissionFileId	17	int
139	fileId	17	int
139	submissionId	17	int
139	username	vkarbasizaed	string
139	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
140	fileStage	10	int
140	sourceSubmissionFileId	\N	string
140	submissionFileId	17	int
140	fileId	17	int
140	submissionId	17	int
140	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
140	username	vkarbasizaed	string
141	fileStage	10	int
141	sourceSubmissionFileId	\N	string
141	submissionFileId	17	int
141	fileId	17	int
141	submissionId	17	int
141	username	vkarbasizaed	string
141	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
141	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
146	fileStage	10	int
146	sourceSubmissionFileId	\N	string
146	submissionFileId	18	int
146	fileId	18	int
146	submissionId	18	int
146	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
146	username	vwilliamson	string
147	fileStage	10	int
147	submissionFileId	18	int
147	fileId	18	int
147	submissionId	18	int
147	username	vwilliamson	string
147	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
148	fileStage	10	int
148	sourceSubmissionFileId	\N	string
148	submissionFileId	18	int
148	fileId	18	int
148	submissionId	18	int
148	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
148	username	vwilliamson	string
149	fileStage	10	int
149	sourceSubmissionFileId	\N	string
149	submissionFileId	18	int
149	fileId	18	int
149	submissionId	18	int
149	username	vwilliamson	string
149	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
149	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
154	fileStage	10	int
154	sourceSubmissionFileId	\N	string
154	submissionFileId	19	int
154	fileId	19	int
154	submissionId	19	int
154	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
154	username	zwoods	string
155	fileStage	10	int
155	submissionFileId	19	int
155	fileId	19	int
155	submissionId	19	int
155	username	zwoods	string
155	name	Finocchiaro: Arguments About Arguments.pdf	string
156	fileStage	10	int
156	sourceSubmissionFileId	\N	string
156	submissionFileId	19	int
156	fileId	19	int
156	submissionId	19	int
156	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
156	username	zwoods	string
157	fileStage	10	int
157	sourceSubmissionFileId	\N	string
157	submissionFileId	19	int
157	fileId	19	int
157	submissionId	19	int
157	username	zwoods	string
157	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
157	name	Finocchiaro: Arguments About Arguments.pdf	string
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	journals/1/articles/1/63c9f62069efd.pdf	application/pdf
2	journals/1/articles/2/63c9f636dcc7d.pdf	application/pdf
3	journals/1/articles/3/63c9f65f30ca0.pdf	application/pdf
4	journals/1/articles/4/63c9f69519765.pdf	application/pdf
5	journals/1/articles/5/63c9f6b0b95d2.pdf	application/pdf
6	journals/1/articles/6/63c9f6cf870c4.pdf	application/pdf
7	journals/1/articles/7/63c9f6eaf112a.pdf	application/pdf
8	journals/1/articles/8/63c9f70a1b7c6.pdf	application/pdf
9	journals/1/articles/9/63c9f725c4c8d.pdf	application/pdf
10	journals/1/articles/10/63c9f741d6e4c.pdf	application/pdf
11	journals/1/articles/11/63c9f75e149d8.pdf	application/pdf
12	journals/1/articles/12/63c9f77dae81a.pdf	application/pdf
13	journals/1/articles/13/63c9f79a4bf58.pdf	application/pdf
14	journals/1/articles/14/63c9f7b74245f.pdf	application/pdf
15	journals/1/articles/15/63c9f7d44c741.pdf	application/pdf
16	journals/1/articles/16/63c9f7f097d20.pdf	application/pdf
17	journals/1/articles/17/63c9f80da2ad7.pdf	application/pdf
18	journals/1/articles/18/63c9f82b134f2.pdf	application/pdf
19	journals/1/articles/19/63c9f8479ba87.pdf	application/pdf
\.


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 19, true);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	article=>dc11	plugins.metadata.dc11.articleAdapter.displayName	plugins.metadata.dc11.articleAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)
2	preprint=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)
\.


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 2, true);


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
2	2	0	Crossref XML preprint export	plugins.importexport.crossref.filter.PreprintCrossrefXmlFilter	0	0	0
\.


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 2, true);


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
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Data for Name: journal_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.journal_settings (journal_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1	fr_CA	readerInformation	##default.contextSettings.forReaders##	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##	\N
1	en_US	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>	\N
1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##	\N
1	en_US	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously posted."},{"order":2,"content":"The submission file is in OpenOffice, Microsoft Word, or RTF document file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines."}]	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"La soumission n'a pas déjà été publiée et n'est pas considérée actuellement par un autre serveur. Si ce n'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice »."},{"order":2,"content":"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect."},{"order":3,"content":"Lorsque possible, les URL des références ont été fournies."},{"order":4,"content":"##default.contextSettings.checklist.submissionAppearance##"},{"order":5,"content":"##default.contextSettings.checklist.bibliographicRequirements##"}]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1		themePluginPath	default	\N
1	en_US	acronym	JPKPKP	\N
1	fr_CA	authorInformation	##default.contextSettings.forAuthors##	\N
1	en_US	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.	\N
1		defaultReviewMode	2	\N
1		emailSignature	<br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>	\N
1		disableSubmissions	0	\N
1		itemsPerPage	25	\N
1		keywords	request	\N
1	en_US	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source system is suitable for libraries to host for their faculty members to use (see <a href="http://pkp.sfu.ca">Public Knowledge Project</a>).	\N
1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	name	Public Knowledge Preprint Server	\N
1	fr_CA	name	Serveur de prépublication de la connaissance du public	\N
1		numPageLinks	10	\N
1	en_US	abbreviation	publicknowledgePub Know Pre	\N
1		enableAuthorScreening	0	\N
1		enableOai	1	\N
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

COPY public.navigation_menu_items (navigation_menu_item_id, context_id, path, type) FROM stdin;
1	0	\N	NMI_TYPE_USER_REGISTER
2	0	\N	NMI_TYPE_USER_LOGIN
3	0	\N	NMI_TYPE_USER_DASHBOARD
4	0	\N	NMI_TYPE_USER_DASHBOARD
5	0	\N	NMI_TYPE_USER_PROFILE
6	0	\N	NMI_TYPE_ADMINISTRATION
7	0	\N	NMI_TYPE_USER_LOGOUT
8	1	\N	NMI_TYPE_USER_REGISTER
9	1	\N	NMI_TYPE_USER_LOGIN
10	1	\N	NMI_TYPE_USER_DASHBOARD
11	1	\N	NMI_TYPE_USER_DASHBOARD
12	1	\N	NMI_TYPE_USER_PROFILE
13	1	\N	NMI_TYPE_ADMINISTRATION
14	1	\N	NMI_TYPE_USER_LOGOUT
15	1	\N	NMI_TYPE_ANNOUNCEMENTS
16	1	\N	NMI_TYPE_ARCHIVES
17	1	\N	NMI_TYPE_ABOUT
18	1	\N	NMI_TYPE_ABOUT
19	1	\N	NMI_TYPE_SUBMISSIONS
20	1	\N	NMI_TYPE_EDITORIAL_TEAM
21	1	\N	NMI_TYPE_PRIVACY
22	1	\N	NMI_TYPE_CONTACT
23	1	\N	NMI_TYPE_SEARCH
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
205		contents	There was a problem sending an email message. Please try again later, or contact your system administrator.	string
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
156	1	0	3	16777222	2023-01-20 02:09:30	\N	1048585	15
52	1	0	3	16777222	2023-01-20 02:04:39	\N	1048585	5
157	1	0	3	16777223	2023-01-20 02:09:30	\N	1048585	15
53	1	0	3	16777223	2023-01-20 02:04:39	\N	1048585	5
3	1	0	3	16777222	2023-01-20 02:02:14	\N	1048585	1
4	1	0	3	16777223	2023-01-20 02:02:14	\N	1048585	1
5	1	5	2	16777217	2023-01-20 02:02:14	\N	1048585	1
158	1	5	2	16777217	2023-01-20 02:09:30	\N	1048585	15
7	1	4	2	16777217	2023-01-20 02:02:15	\N	1048585	1
9	1	0	2	16777243	2023-01-20 02:02:15	\N	1048585	1
10	1	0	2	16777245	2023-01-20 02:02:15	\N	1048585	1
54	1	5	2	16777217	2023-01-20 02:04:39	\N	1048585	5
56	1	4	2	16777217	2023-01-20 02:04:39	\N	1048585	5
12	1	0	3	16777222	2023-01-20 02:02:37	\N	1048585	2
13	1	0	3	16777223	2023-01-20 02:02:37	\N	1048585	2
14	1	5	2	16777217	2023-01-20 02:02:37	\N	1048585	2
16	1	4	2	16777217	2023-01-20 02:02:37	\N	1048585	2
18	1	0	2	16777243	2023-01-20 02:02:37	\N	1048585	2
19	1	0	2	16777245	2023-01-20 02:02:37	\N	1048585	2
58	1	0	2	16777243	2023-01-20 02:04:39	\N	1048585	5
59	1	0	2	16777245	2023-01-20 02:04:39	\N	1048585	5
24	1	0	3	16777222	2023-01-20 02:03:20	\N	1048585	3
25	1	0	3	16777223	2023-01-20 02:03:20	\N	1048585	3
26	1	5	2	16777217	2023-01-20 02:03:20	\N	1048585	3
28	1	4	2	16777217	2023-01-20 02:03:20	\N	1048585	3
30	1	0	2	16777243	2023-01-20 02:03:21	\N	1048585	3
31	1	0	2	16777245	2023-01-20 02:03:21	\N	1048585	3
84	1	0	3	16777222	2023-01-20 02:06:08	\N	1048585	8
85	1	0	3	16777223	2023-01-20 02:06:08	\N	1048585	8
86	1	5	2	16777217	2023-01-20 02:06:08	\N	1048585	8
62	1	0	3	16777222	2023-01-20 02:05:09	\N	1048585	6
63	1	0	3	16777223	2023-01-20 02:05:09	\N	1048585	6
36	1	9	3	16777259	2023-01-20 02:03:42	\N	1048585	3
38	1	5	3	16777259	2023-01-20 02:03:42	\N	1048585	3
40	1	4	3	16777259	2023-01-20 02:03:42	\N	1048585	3
42	1	0	3	16777222	2023-01-20 02:04:11	\N	1048585	4
43	1	0	3	16777223	2023-01-20 02:04:11	\N	1048585	4
44	1	5	2	16777217	2023-01-20 02:04:11	\N	1048585	4
46	1	4	2	16777217	2023-01-20 02:04:11	\N	1048585	4
48	1	0	2	16777243	2023-01-20 02:04:11	\N	1048585	4
49	1	0	2	16777245	2023-01-20 02:04:11	\N	1048585	4
64	1	5	2	16777217	2023-01-20 02:05:09	\N	1048585	6
66	1	4	2	16777217	2023-01-20 02:05:09	\N	1048585	6
68	1	0	2	16777243	2023-01-20 02:05:09	\N	1048585	6
69	1	0	2	16777245	2023-01-20 02:05:09	\N	1048585	6
88	1	4	2	16777217	2023-01-20 02:06:08	\N	1048585	8
90	1	0	2	16777243	2023-01-20 02:06:08	\N	1048585	8
91	1	0	2	16777245	2023-01-20 02:06:08	\N	1048585	8
73	1	0	3	16777222	2023-01-20 02:05:40	\N	1048585	7
74	1	0	3	16777223	2023-01-20 02:05:40	\N	1048585	7
75	1	5	2	16777217	2023-01-20 02:05:40	\N	1048585	7
77	1	4	2	16777217	2023-01-20 02:05:40	\N	1048585	7
79	1	0	2	16777243	2023-01-20 02:05:40	\N	1048585	7
80	1	0	2	16777245	2023-01-20 02:05:40	\N	1048585	7
104	1	0	3	16777222	2023-01-20 02:07:04	\N	1048585	10
105	1	0	3	16777223	2023-01-20 02:07:04	\N	1048585	10
94	1	0	3	16777222	2023-01-20 02:06:36	\N	1048585	9
95	1	0	3	16777223	2023-01-20 02:06:36	\N	1048585	9
96	1	5	2	16777217	2023-01-20 02:06:36	\N	1048585	9
98	1	4	2	16777217	2023-01-20 02:06:36	\N	1048585	9
100	1	0	2	16777243	2023-01-20 02:06:36	\N	1048585	9
101	1	0	2	16777245	2023-01-20 02:06:36	\N	1048585	9
121	1	0	2	16777243	2023-01-20 02:07:35	\N	1048585	11
115	1	0	3	16777222	2023-01-20 02:07:35	\N	1048585	11
106	1	5	2	16777217	2023-01-20 02:07:04	\N	1048585	10
108	1	4	2	16777217	2023-01-20 02:07:04	\N	1048585	10
110	1	0	2	16777243	2023-01-20 02:07:04	\N	1048585	10
111	1	0	2	16777245	2023-01-20 02:07:04	\N	1048585	10
116	1	0	3	16777223	2023-01-20 02:07:35	\N	1048585	11
117	1	5	2	16777217	2023-01-20 02:07:35	\N	1048585	11
119	1	4	2	16777217	2023-01-20 02:07:35	\N	1048585	11
122	1	0	2	16777245	2023-01-20 02:07:35	\N	1048585	11
127	1	0	3	16777223	2023-01-20 02:08:04	\N	1048585	12
126	1	0	3	16777222	2023-01-20 02:08:04	\N	1048585	12
128	1	5	2	16777217	2023-01-20 02:08:04	\N	1048585	12
130	1	4	2	16777217	2023-01-20 02:08:04	\N	1048585	12
132	1	0	2	16777243	2023-01-20 02:08:04	\N	1048585	12
133	1	0	2	16777245	2023-01-20 02:08:04	\N	1048585	12
160	1	4	2	16777217	2023-01-20 02:09:30	\N	1048585	15
136	1	0	3	16777222	2023-01-20 02:08:33	\N	1048585	13
137	1	0	3	16777223	2023-01-20 02:08:33	\N	1048585	13
138	1	5	2	16777217	2023-01-20 02:08:33	\N	1048585	13
162	1	0	2	16777243	2023-01-20 02:09:30	\N	1048585	15
140	1	4	2	16777217	2023-01-20 02:08:33	\N	1048585	13
163	1	0	2	16777245	2023-01-20 02:09:30	\N	1048585	15
142	1	0	2	16777243	2023-01-20 02:08:33	\N	1048585	13
143	1	0	2	16777245	2023-01-20 02:08:33	\N	1048585	13
146	1	0	3	16777222	2023-01-20 02:09:01	\N	1048585	14
147	1	0	3	16777223	2023-01-20 02:09:01	\N	1048585	14
148	1	5	2	16777217	2023-01-20 02:09:01	\N	1048585	14
166	1	0	3	16777222	2023-01-20 02:09:59	\N	1048585	16
150	1	4	2	16777217	2023-01-20 02:09:01	\N	1048585	14
167	1	0	3	16777223	2023-01-20 02:09:59	\N	1048585	16
152	1	0	2	16777243	2023-01-20 02:09:02	\N	1048585	14
153	1	0	2	16777245	2023-01-20 02:09:02	\N	1048585	14
168	1	5	2	16777217	2023-01-20 02:09:59	\N	1048585	16
170	1	4	2	16777217	2023-01-20 02:09:59	\N	1048585	16
172	1	0	2	16777243	2023-01-20 02:09:59	\N	1048585	16
173	1	0	2	16777245	2023-01-20 02:09:59	\N	1048585	16
205	0	3	1	3	2023-01-20 02:11:32	\N	0	0
176	1	0	3	16777222	2023-01-20 02:10:28	\N	1048585	17
177	1	0	3	16777223	2023-01-20 02:10:28	\N	1048585	17
178	1	5	2	16777217	2023-01-20 02:10:28	\N	1048585	17
180	1	4	2	16777217	2023-01-20 02:10:28	\N	1048585	17
182	1	0	2	16777243	2023-01-20 02:10:28	\N	1048585	17
183	1	0	2	16777245	2023-01-20 02:10:28	\N	1048585	17
186	1	0	3	16777222	2023-01-20 02:10:57	\N	1048585	18
187	1	0	3	16777223	2023-01-20 02:10:57	\N	1048585	18
188	1	5	2	16777217	2023-01-20 02:10:57	\N	1048585	18
190	1	4	2	16777217	2023-01-20 02:10:57	\N	1048585	18
192	1	0	2	16777243	2023-01-20 02:10:57	\N	1048585	18
193	1	0	2	16777245	2023-01-20 02:10:57	\N	1048585	18
196	1	0	3	16777222	2023-01-20 02:11:25	\N	1048585	19
197	1	0	3	16777223	2023-01-20 02:11:25	\N	1048585	19
198	1	5	2	16777217	2023-01-20 02:11:25	\N	1048585	19
200	1	4	2	16777217	2023-01-20 02:11:25	\N	1048585	19
202	1	0	2	16777243	2023-01-20 02:11:25	\N	1048585	19
203	1	0	2	16777245	2023-01-20 02:11:25	\N	1048585	19
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 205, true);


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
tinymceplugin	0	enabled	1	bool
defaultthemeplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
acronplugin	0	enabled	1	bool
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	["city","region"]	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
acronplugin	0	crontab	[{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"lib.pkp.classes.task.StatisticsReport","frequency":{"day":"1"},"args":[]}]	object
tinymceplugin	1	enabled	1	bool
defaultthemeplugin	1	enabled	1	bool
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
pdfjsviewerplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	recentItems	30	int
webfeedplugin	1	includeIdentifiers	0	bool
googlescholarplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	63c9f5ad9acec	string
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

COPY public.publication_galleys (galley_id, locale, publication_id, label, submission_file_id, seq, remote_url, is_approved, url_path) FROM stdin;
1	en_US	1	PDF	1	0		0	
2	en_US	2	PDF	2	0		0	
3	en_US	3	PDF	3	0		0	
4	en_US	4	PDF	3	0		0	
5	en_US	5	PDF	4	0		0	
6	en_US	6	PDF	5	0		0	
7	en_US	7	PDF	6	0		0	
8	en_US	8	PDF	7	0		0	
9	en_US	9	PDF	8	0		0	
10	en_US	10	PDF	9	0		0	
11	en_US	11	PDF	10	0		0	
12	en_US	12	PDF	11	0		0	
13	en_US	13	PDF	12	0		0	
14	en_US	14	PDF	13	0		0	
15	en_US	15	PDF	14	0		0	
16	en_US	16	PDF	15	0		0	
17	en_US	17	PDF	16	0		0	
18	en_US	18	PDF	17	0		0	
19	en_US	19	PDF	18	0		0	
20	en_US	20	PDF	19	0		0	
\.


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 20, true);


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	abstract	<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>
1	fr_CA	abstract	
1		categoryIds	[]
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The influence of lactation on the quantity and quality of cashmere production
1	fr_CA	title	
2		categoryIds	[]
2	en_US	copyrightHolder	Public Knowledge Preprint Server
2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
2		copyrightYear	2023
2	en_US	subtitle	A Nine-Nation Comparative Study Of Construct Equivalence
2	en_US	title	The Facets Of Job Satisfaction
4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
4		copyrightYear	2023
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
3	fr_CA	abstract	
3		categoryIds	[]
3	en_US	copyrightHolder	Public Knowledge Preprint Server
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
3		copyrightYear	2023
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
3	fr_CA	title	
4	fr_CA	abstract	
4		categoryIds	[]
4	en_US	copyrightHolder	Craig Montgomerie
6	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
6	fr_CA	abstract	
6		categoryIds	[]
6	en_US	copyrightHolder	Public Knowledge Preprint Server
6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
6		copyrightYear	2023
6	en_US	prefix	
4	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
4	fr_CA	subtitle	
4	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
4	fr_CA	title	
6	fr_CA	prefix	
5	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	copyrightHolder	Public Knowledge Preprint Server
5	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
5		copyrightYear	2023
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Genetic transformation of forest trees
5	fr_CA	title	
7	fr_CA	abstract	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
6	fr_CA	title	
8	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>
7	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
7		categoryIds	[]
7	en_US	copyrightHolder	Public Knowledge Preprint Server
7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
7		copyrightYear	2023
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Developing efficacy beliefs in the classroom
7	fr_CA	title	
8	fr_CA	prefix	
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	copyrightHolder	Public Knowledge Preprint Server
8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
8		copyrightYear	2023
8	en_US	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Traditions and Trends in the Study of the Commons
8	fr_CA	title	
9	en_US	prefix	
9	en_US	abstract	<p>None.</p>
9	fr_CA	abstract	
9		categoryIds	[]
9	en_US	copyrightHolder	Public Knowledge Preprint Server
9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9		copyrightYear	2023
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	en_US	title	Hansen & Pinto: Reason Reclaimed
9	fr_CA	title	
10	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
10	fr_CA	abstract	
10		categoryIds	[]
10	en_US	copyrightHolder	Public Knowledge Preprint Server
10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10		copyrightYear	2023
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
10	fr_CA	title	
11	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	copyrightHolder	Public Knowledge Preprint Server
11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
11		copyrightYear	2023
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
11	fr_CA	title	
12	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
12	fr_CA	abstract	
12		categoryIds	[]
12	en_US	copyrightHolder	Public Knowledge Preprint Server
12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12		copyrightYear	2023
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Learning Sustainable Design through Service
12	fr_CA	title	
13		categoryIds	[]
17	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
17	fr_CA	title	
13	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
13	fr_CA	abstract	
13	en_US	copyrightHolder	Public Knowledge Preprint Server
13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
13		copyrightYear	2023
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
13	fr_CA	title	
14	fr_CA	abstract	
14		categoryIds	[]
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
14	fr_CA	title	
14	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
14	en_US	copyrightHolder	Public Knowledge Preprint Server
14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
14		copyrightYear	2023
16	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
15	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
15	fr_CA	abstract	
15		categoryIds	[]
15	en_US	copyrightHolder	Public Knowledge Preprint Server
15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15		copyrightYear	2023
15	en_US	prefix	
15	fr_CA	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
15	fr_CA	title	
16	fr_CA	subtitle	
16	fr_CA	abstract	
16		categoryIds	[]
16	en_US	copyrightHolder	Public Knowledge Preprint Server
16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16		copyrightYear	2023
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	en_US	title	Yam diseases and its management in Nigeria
16	fr_CA	title	
17	fr_CA	abstract	
17		categoryIds	[]
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>
17	en_US	copyrightHolder	Public Knowledge Preprint Server
17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
17		copyrightYear	2023
19		categoryIds	[]
18	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
18	fr_CA	abstract	
18		categoryIds	[]
18	en_US	copyrightHolder	Public Knowledge Preprint Server
18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
18		copyrightYear	2023
18	en_US	prefix	
18	fr_CA	prefix	
18	en_US	subtitle	
18	fr_CA	subtitle	
18	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
18	fr_CA	title	
19	fr_CA	abstract	
19	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
19	en_US	copyrightHolder	Public Knowledge Preprint Server
19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
19		copyrightYear	2023
19	fr_CA	prefix	
19	en_US	prefix	
19	fr_CA	subtitle	
19	en_US	subtitle	
19	fr_CA	title	
19	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments
20	fr_CA	abstract	
20	en_US	abstract	<p>None.</p>
20		categoryIds	[]
20	en_US	copyrightHolder	Public Knowledge Preprint Server
20	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
20		copyrightYear	2023
20	fr_CA	prefix	
20	en_US	prefix	
20	fr_CA	subtitle	
20	en_US	subtitle	
20	fr_CA	title	
20	en_US	title	Finocchiaro: Arguments About Arguments
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, locale, primary_contact_id, section_id, submission_id, status, url_path, version) FROM stdin;
1	0	\N	2023-01-20 02:02:13	\N	1	1	1	1	\N	1
18	0	2023-01-20	2023-01-20 02:10:34	\N	23	1	17	3	\N	1
2	0	2023-01-20	2023-01-20 02:02:55	\N	2	1	2	3	\N	1
19	0	2023-01-20	2023-01-20 02:11:03	\N	24	1	18	3	\N	1
20	0	2023-01-20	2023-01-20 02:11:32	\N	25	1	19	3	\N	1
3	0	2023-01-20	2023-01-20 02:03:38	\N	4	1	3	3	\N	1
4	0	2023-01-20	2023-01-20 02:03:49	\N	6	1	3	3	\N	2
5	0	2023-01-20	2023-01-20 02:04:16	\N	8	1	4	3	\N	1
6	0	2023-01-20	2023-01-20 02:04:45	\N	9	1	5	3	\N	1
7	0	2023-01-20	2023-01-20 02:05:15	\N	10	1	6	3	\N	1
8	0	2023-01-20	2023-01-20 02:05:46	\N	11	1	7	3	\N	1
9	0	2023-01-20	2023-01-20 02:06:13	\N	13	1	8	3	\N	1
10	0	2023-01-20	2023-01-20 02:06:41	\N	14	1	9	3	\N	1
11	0	2023-01-20	2023-01-20 02:07:09	\N	15	1	10	3	\N	1
12	0	2023-01-20	2023-01-20 02:07:41	\N	16	1	11	3	\N	1
13	0	2023-01-20	2023-01-20 02:08:10	\N	18	1	12	3	\N	1
14	0	2023-01-20	2023-01-20 02:08:39	\N	19	1	13	3	\N	1
15	0	2023-01-20	2023-01-20 02:09:07	\N	20	1	14	3	\N	1
16	0	2023-01-20	2023-01-20 02:09:36	\N	21	1	15	3	\N	1
17	0	2023-01-20	2023-01-20 02:10:05	\N	22	1	16	3	\N	1
\.


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 20, true);


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

COPY public.review_files (review_id, submission_file_id) FROM stdin;
\.


--
-- Data for Name: review_form_element_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_element_settings (review_form_element_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_form_elements; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_elements (review_form_element_id, review_form_id, seq, element_type, required, included) FROM stdin;
\.


--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_form_elements_review_form_element_id_seq', 1, false);


--
-- Data for Name: review_form_responses; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_responses (review_form_element_id, review_id, response_type, response_value) FROM stdin;
\.


--
-- Data for Name: review_form_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_settings (review_form_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_forms; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_forms (review_form_id, assoc_type, assoc_id, seq, is_active) FROM stdin;
\.


--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_forms_review_form_id_seq', 1, false);


--
-- Data for Name: review_round_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_round_files (submission_id, review_round_id, stage_id, submission_file_id) FROM stdin;
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
plugins.generic.usageStats.UsageStatsLoader	2023-01-20 02:00:02
lib.pkp.classes.task.StatisticsReport	2023-01-20 02:00:02
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

COPY public.sections (section_id, journal_id, review_form_id, seq, editor_restricted, meta_indexed, meta_reviewed, abstracts_not_required, hide_title, hide_author, is_inactive, abstract_word_count) FROM stdin;
1	1	0	0	0	1	1	0	0	0	0	\N
\.


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 1, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
tpc2pr68kgsl6p61s2ak9vun46	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180000	1674180000	0		localhost
3qmjkj8b40k58a0jlh5ugggl2q	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180316	1674180345	0	csrf|a:2:{s:9:"timestamp";i:1674180345;s:5:"token";s:32:"f9695cde1a789b2d9c3d148371e99ab6";}username|s:7:"dbarnes";userId|i:3;	localhost
t31de84f0ma95fh0lff2eu47sf	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180026	1674180031	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1674180031;s:5:"token";s:32:"15dcfaf6207cf778a300e6142f7ada0c";}	localhost
gtunft73156q665f3q7navpghi	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180013	1674180025	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1674180025;s:5:"token";s:32:"6245a737a8393e952c05088fe98eb31e";}	localhost
s5t3fuq88a8tqlado30o6on7hq	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180031	1674180037	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1674180037;s:5:"token";s:32:"79dd9ab8fdf0811e36417868d14ef400";}	localhost
l651ev21686d5tl8fhcsn8jedi	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180002	1674180013	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1674180013;s:5:"token";s:32:"7a411ac0fce8455bdd5183425d8dd25b";}	localhost
a5quuh16tm99mf96kmgig7ol6a	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180347	1674180373	0	csrf|a:2:{s:9:"timestamp";i:1674180373;s:5:"token";s:32:"f2e3029c642de146a23ca5d0f87469bb";}username|s:7:"dbarnes";userId|i:3;	localhost
vtfsr6lipbsrrosissnqhvi9rv	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180082	1674180088	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1674180088;s:5:"token";s:32:"026b2210c457bd6aa65560f8eef9e9b7";}	localhost
q02b2cgu9klem8pkrh1a3qk87n	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180375	1674180401	0	csrf|a:2:{s:9:"timestamp";i:1674180401;s:5:"token";s:32:"0aad4e2a387d1cfccad4759def215519";}username|s:7:"dbarnes";userId|i:3;	localhost
onqqbog5kd7apc8shuh8ktfc0k	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180039	1674180079	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1674180079;s:5:"token";s:32:"067a000d49f45803a62813a5777a8af2";}	localhost
0d9b5qnubsg8frpn08ub4o4931	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180403	1674180429	0	csrf|a:2:{s:9:"timestamp";i:1674180429;s:5:"token";s:32:"999acc1e3a0f9fcf9d2edc5f7ae1eacb";}username|s:7:"dbarnes";userId|i:3;	localhost
2rmfga41rbaajqg6nnhb9diub8	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180114	1674180135	0	csrf|a:2:{s:9:"timestamp";i:1674180134;s:5:"token";s:32:"786dcd64227cac019cc878f0f5c528ab";}username|s:7:"ccorino";userId|i:7;	localhost
adcnabhpj3478jthstier25h1r	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180088	1674180112	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1674180112;s:5:"token";s:32:"99dec23583a4113ddef60fe5288cf877";}	localhost
gr8tqpp4eet61ssh21dibuaj4q	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180258	1674180285	0	csrf|a:2:{s:9:"timestamp";i:1674180285;s:5:"token";s:32:"7618d3a785fb3fb2422b6c42b5eb4c1e";}username|s:7:"dbarnes";userId|i:3;	localhost
mbho2e5ai7snph73v2i51g1fee	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180137	1674180170	0	csrf|a:2:{s:9:"timestamp";i:1674180170;s:5:"token";s:32:"662e6c962dd608f92fae9e9e8874e6ca";}username|s:8:"ckwantes";	localhost
qgo7rbd9ta58flvaqc42cvnlb3	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180431	1674180461	0	csrf|a:2:{s:9:"timestamp";i:1674180461;s:5:"token";s:32:"e851025375b708871f1ae7ef6e56f730";}username|s:7:"dbarnes";userId|i:3;	localhost
g06tsa09bv15c5lep9t7tbk1ka	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180171	1674180175	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1674180175;s:5:"token";s:32:"98c2eef7b211ef43c23484fe359419a9";}	localhost
pdqil80967otrjqbui3h64d2i2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180462	1674180489	0	csrf|a:2:{s:9:"timestamp";i:1674180489;s:5:"token";s:32:"faf5cca2a09c5961e561e83217636e6a";}username|s:7:"dbarnes";userId|i:3;	localhost
5hquhtll3g2l70dorvoecq197r	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180176	1674180228	0	csrf|a:2:{s:9:"timestamp";i:1674180228;s:5:"token";s:32:"0933db1e9ffde81497cc11e6691d0bbc";}username|s:7:"dbarnes";userId|i:3;	localhost
ku4blknan53o1le0vb0ucm548g	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180230	1674180256	0	csrf|a:2:{s:9:"timestamp";i:1674180256;s:5:"token";s:32:"22bbaba6f34fc5d63118aaa470675cb9";}username|s:7:"dbarnes";userId|i:3;	localhost
i06oo7143bi0sqtvmb2bhs1t05	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180289	1674180314	0	csrf|a:2:{s:9:"timestamp";i:1674180314;s:5:"token";s:32:"42c5794fa24c8313562d9c1dffbc6fc6";}username|s:7:"dbarnes";userId|i:3;	localhost
en1ucq2f0o2gcn8dg9l0sebrjr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180520	1674180547	0	csrf|a:2:{s:9:"timestamp";i:1674180547;s:5:"token";s:32:"61e192da4ae7c1aac720b1a37ab57c70";}username|s:7:"dbarnes";userId|i:3;	localhost
n0g05qckbqf0qtrfsk83n6g4kt	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180549	1674180576	0	csrf|a:2:{s:9:"timestamp";i:1674180576;s:5:"token";s:32:"25fdbe8b2c344e54d5bab875a7f09ceb";}username|s:7:"dbarnes";userId|i:3;	localhost
j1dapbb4pob92mq3updrojr365	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180491	1674180518	0	csrf|a:2:{s:9:"timestamp";i:1674180518;s:5:"token";s:32:"774ac8f418c69d3450257a5af2f5588d";}username|s:7:"dbarnes";userId|i:3;	localhost
bfqcpgbjjdff2kjpp3daaa2f6s	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180636	1674180663	0	csrf|a:2:{s:9:"timestamp";i:1674180663;s:5:"token";s:32:"b15faa5979e475ef5d26a864b7e4f7d0";}username|s:7:"dbarnes";userId|i:3;	localhost
6orf1jh2f4imj7qsf368n3150j	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180607	1674180634	0	csrf|a:2:{s:9:"timestamp";i:1674180634;s:5:"token";s:32:"6129f63e220badb02976f585e29de3ca";}username|s:7:"dbarnes";userId|i:3;	localhost
giue26pl9uf4enut0rfntu9iaj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180665	1674180692	0	csrf|a:2:{s:9:"timestamp";i:1674180692;s:5:"token";s:32:"4870b4eb30db34552dfc98e030a73a2c";}username|s:7:"dbarnes";userId|i:3;	localhost
nr5bjcc0v4pgfel4rgq47tfjfg	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1674180578	1674180605	0	csrf|a:2:{s:9:"timestamp";i:1674180605;s:5:"token";s:32:"298eece3347f34e45f13206de91334b2";}username|s:7:"dbarnes";userId|i:3;	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.site (redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
0	en_US	6	["en_US","fr_CA"]	["en_US","fr_CA"]	\N
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
1	1	4	7	2023-01-20 02:01:59	0	1
2	1	3	5	2023-01-20 02:02:14	0	1
3	1	3	4	2023-01-20 02:02:14	0	1
4	2	4	8	2023-01-20 02:02:22	0	1
5	2	3	5	2023-01-20 02:02:37	0	1
6	2	3	4	2023-01-20 02:02:37	0	1
7	3	4	9	2023-01-20 02:03:02	0	1
8	3	3	5	2023-01-20 02:03:20	0	1
9	3	3	4	2023-01-20 02:03:20	0	1
10	4	4	10	2023-01-20 02:03:56	0	1
11	4	3	5	2023-01-20 02:04:11	0	1
12	4	3	4	2023-01-20 02:04:11	0	1
13	5	4	11	2023-01-20 02:04:23	0	1
14	5	3	5	2023-01-20 02:04:39	0	1
15	5	3	4	2023-01-20 02:04:39	0	1
16	6	4	12	2023-01-20 02:04:54	0	1
17	6	3	5	2023-01-20 02:05:09	0	1
18	6	3	4	2023-01-20 02:05:09	0	1
19	7	4	13	2023-01-20 02:05:21	0	1
20	7	3	5	2023-01-20 02:05:40	0	1
21	7	3	4	2023-01-20 02:05:40	0	1
22	8	4	14	2023-01-20 02:05:53	0	1
23	8	3	5	2023-01-20 02:06:08	0	1
24	8	3	4	2023-01-20 02:06:08	0	1
25	9	4	15	2023-01-20 02:06:20	0	1
26	9	3	5	2023-01-20 02:06:36	0	1
27	9	3	4	2023-01-20 02:06:36	0	1
28	10	4	16	2023-01-20 02:06:48	0	1
29	10	3	5	2023-01-20 02:07:04	0	1
30	10	3	4	2023-01-20 02:07:04	0	1
31	11	4	17	2023-01-20 02:07:17	0	1
32	11	3	5	2023-01-20 02:07:35	0	1
33	11	3	4	2023-01-20 02:07:35	0	1
34	12	4	18	2023-01-20 02:07:48	0	1
35	12	3	5	2023-01-20 02:08:04	0	1
36	12	3	4	2023-01-20 02:08:04	0	1
37	13	4	19	2023-01-20 02:08:17	0	1
38	13	3	5	2023-01-20 02:08:33	0	1
39	13	3	4	2023-01-20 02:08:33	0	1
40	14	4	20	2023-01-20 02:08:46	0	1
41	14	3	5	2023-01-20 02:09:01	0	1
42	14	3	4	2023-01-20 02:09:01	0	1
43	15	4	21	2023-01-20 02:09:15	0	1
44	15	3	5	2023-01-20 02:09:30	0	1
45	15	3	4	2023-01-20 02:09:30	0	1
46	16	4	22	2023-01-20 02:09:43	0	1
47	16	3	5	2023-01-20 02:09:59	0	1
48	16	3	4	2023-01-20 02:09:59	0	1
49	17	4	23	2023-01-20 02:10:12	0	1
50	17	3	5	2023-01-20 02:10:28	0	1
51	17	3	4	2023-01-20 02:10:28	0	1
52	18	4	24	2023-01-20 02:10:42	0	1
53	18	3	5	2023-01-20 02:10:57	0	1
54	18	3	4	2023-01-20 02:10:57	0	1
55	19	4	25	2023-01-20 02:11:10	0	1
56	19	3	5	2023-01-20 02:11:25	0	1
57	19	3	4	2023-01-20 02:11:25	0	1
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 57, true);


--
-- Data for Name: subeditor_submission_group; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.subeditor_submission_group (context_id, assoc_id, assoc_type, user_id) FROM stdin;
1	1	530	5
1	1	530	4
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
-- Data for Name: submission_file_revisions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_file_revisions (revision_id, submission_file_id, file_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
\.


--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_file_revisions_revision_id_seq', 19, true);


--
-- Data for Name: submission_file_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_file_settings (submission_file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
1	fr_CA	name		string
2	en_US	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
2	fr_CA	name		string
3	en_US	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
3	fr_CA	name		string
4	en_US	name	Genetic transformation of forest trees.pdf	string
4	fr_CA	name		string
5	en_US	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
5	fr_CA	name		string
6	en_US	name	Developing efficacy beliefs in the classroom.pdf	string
6	fr_CA	name		string
7	en_US	name	Traditions and Trends in the Study of the Commons.pdf	string
7	fr_CA	name		string
8	en_US	name	Hansen & Pinto: Reason Reclaimed.pdf	string
8	fr_CA	name		string
9	en_US	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
9	fr_CA	name		string
10	en_US	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
10	fr_CA	name		string
11	en_US	name	Learning Sustainable Design through Service.pdf	string
11	fr_CA	name		string
12	en_US	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
12	fr_CA	name		string
13	en_US	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
13	fr_CA	name		string
14	en_US	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
14	fr_CA	name		string
15	en_US	name	Yam diseases and its management in Nigeria.pdf	string
15	fr_CA	name		string
16	en_US	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
16	fr_CA	name		string
17	en_US	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
17	fr_CA	name		string
18	en_US	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
18	fr_CA	name		string
19	en_US	name	Finocchiaro: Arguments About Arguments.pdf	string
19	fr_CA	name		string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	1	\N	1	10	\N	\N	\N	2023-01-20 02:02:08	2023-01-20 02:02:10	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2023-01-20 02:02:30	2023-01-20 02:02:33	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2023-01-20 02:03:11	2023-01-20 02:03:13	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2023-01-20 02:04:05	2023-01-20 02:04:07	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2023-01-20 02:04:32	2023-01-20 02:04:35	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2023-01-20 02:05:03	2023-01-20 02:05:05	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2023-01-20 02:05:30	2023-01-20 02:05:33	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2023-01-20 02:06:02	2023-01-20 02:06:04	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2023-01-20 02:06:29	2023-01-20 02:06:32	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2023-01-20 02:06:57	2023-01-20 02:07:00	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2023-01-20 02:07:26	2023-01-20 02:07:28	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2023-01-20 02:07:57	2023-01-20 02:08:00	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2023-01-20 02:08:26	2023-01-20 02:08:28	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2023-01-20 02:08:55	2023-01-20 02:08:57	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2023-01-20 02:09:24	2023-01-20 02:09:26	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2023-01-20 02:09:52	2023-01-20 02:09:55	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2023-01-20 02:10:21	2023-01-20 02:10:24	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2023-01-20 02:10:51	2023-01-20 02:10:53	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2023-01-20 02:11:19	2023-01-20 02:11:22	25	521	20
\.


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 19, true);


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	catherine
2	kwantes
3	university
4	windsor
5	urho
6	kekkonen
7	academy
8	finland
9	facets
10	job
11	satisfaction
12	nine-nation
13	comparative
14	study
15	construct
16	equivalence
17	archival
18	data
19	attitude
20	survey
21	employees
22	single
23	multinational
24	organization
25	examine
26	degree
27	national
28	culture
29	affects
30	nature
31	responses
32	countries
33	compiled
34	create
35	benchmark
36	nations
37	individually
38	compared
39	factor
40	analysis
41	revealed
42	factors
43	organizational
44	communication
45	efficiency
46	effectiveness
47	support
48	personal
49	benefit
50	comparisons
51	structures
52	exhibited
53	satisfied
54	china
55	brazil
56	consistent
57	previous
58	findings
59	individuals
60	collectivistic
61	report
62	higher
63	research
64	suggest
65	cultural
66	context
67	exerts
68	effect
69	craig
70	montgomerie
71	alberta
72	mark
73	irvine
74	victoria
75	computer
76	skill
77	requirements
78	existing
79	teachers
80	implications
81	policy
82	practice
83	integration
84	technology
85	classroom
86	major
87	issue
88	education
89	today
90	provincial
91	initiatives
92	skills
93	students
94	demonstrate
95	grade
96	level
97	government
98	province
99	canada
100	mandated
101	implementation
102	curriculum
103	began
104	september
105	called
106	information
107	infused
108	core
109	courses
110	specifies
111	“expected
112	respect
113	technology”
114	learning
115	required
116	implement
117	school
118	jurisdictions
119	turning
120	professional
121	development
122	strategies
123	hiring
124	standards
125	upgrade
126	teachers’
127	meet
128	goal
129	paper
130	summarizes
131	results
132	telephone
133	administered
134	public
135	response
136	rate
137	examined
138	require
139	newly
140	hired
141	employed
142	integrating
143	diaga
144	diouf
145	alexandria
146	genetic
147	transformation
148	forest
149	trees
150	review
151	recent
152	progress
153	discussed
154	applications
155	engineering
156	improving
157	understanding
158	mechanisms
159	governing
160	genes
161	expression
162	woody
163	plants
164	dana
165	phillips
166	toronto
167	investigating
168	shared
169	background
170	argument
171	critique
172	fogelins
173	thesis
174	deep
175	disagreement
176	robert
177	fogelin
178	claims
179	interlocutors
180	share
181	framework
182	beliefs
183	commitments
184	order
185	fruitfully
186	pursue
187	refute
188	fogelin’s
189	claim
190	productive
191	find
192	consists
193	common
194	topic
195	hand
196	pro-cedural
197	competencies
198	supporters
199	mistakenly
200	view
201	part
202	procedural
203	com-mitments
204	difficult
205	uphold
206	people’s
207	diverge
208	widely
209	domatilia
210	sokoloff
211	college
212	cork
213	developing
214	efficacy
215	equip
216	children
217	knowledge
218	self-belief
219	confident
220	informed
221	citizens
222	continue
223	learners
224	graduation
225	key
226	role
227	nurturing
228	learn
229	participate
230	society
231	conducted
232	social
233	studies
234	presented
235	showing
236	strategy
237	instruction
238	enhance
239	self-efficacy
240	creative
241	problem
242	solving
243	cps
244	taught
245	means
246	motivate
247	shown
248	positive
249	effects
250	valuable
251	involve
252	decision-making
253	leads
254	action
255	enhancing
256	motivation
257	citizenship
258	elinor
259	ostrom
260	indiana
261	frank
262	van
263	laerhoven
264	traditions
265	trends
266	commons
267	expe-
268	rienced
269	substantial
270	growth
271	past
272	decades1
273	distinguished
274	scholars
275	disciplines
276	long
277	studied
278	specific
279	resources
280	managed
281	mismanaged
282	times
283	places
284	coward
285	los
286	reyes
287	mackenzie
288	wittfogel
289	researchers
290	mid-1980s
291	contemporary
292	colleagues
293	work
294	sec-
295	tors
296	region
297	interest
298	regions
299	world
300	pool
301	resource
302	property
303	intellectual
304	developments
305	fabio
306	paglieri
307	rome
308	hansen
309	pinto
310	reason
311	reclaimed
312	john
313	mwandenga
314	cape
315	town
316	signalling
317	theory
318	dividends
319	literature
320	empirical
321	evidence
322	signaling
323	suggests
324	signal
325	future
326	prospects
327	firm
328	offer
329	conclusive
330	conflicting
331	financial
332	economists
333	practical
334	dividend
335	guidance
336	management
337	potential
338	investors
339	shareholding
340	corporate
341	investment
342	financing
343	distribution
344	decisions
345	continuous
346	function
347	rely
348	intuitive
349	evaluation
350	novak
351	aalborg
352	condensing
353	water
354	availability
355	models
356	focus
357	systems
358	texas
359	modeling
360	system
361	routinely
362	applied
363	administration
364	rights
365	permit
366	regional
367	statewide
368	planning
369	expanding
370	variety
371	endeavors
372	river
373	basins
374	state
375	reflects
376	permits
377	reservoirs
378	datasets
379	necessarily
380	large
381	complex
382	provide
383	decision-support
384	capabilities
385	developed
386	features
387	added
388	types
389	growing
390	enhanced
391	simplifying
392	simulation
393	input
394	methodology
395	condensed
396	dataset
397	selected
398	reservoir
399	impacts
400	accompanying
401	removed
402	original
403	complete
404	set
405	streamflows
406	represents
407	flows
408	basin
409	contained
410	model
411	included
412	develop
413	brazos
414	authority
415	based
416	modifying
417	karim
418	al-khafaji
419	stanford
420	margaret
421	morse
422	sustainable
423	design
424	service
425	environmental
426	sustainability
427	principles
428	vital
429	topics
430	largely
431	failed
432	address
433	service-learning
434	integrates
435	academic
436	setting
437	emerging
438	tool
439	leveraged
440	teach
441	engineers
442	present
443	experiences
444	chapter
445	involves
446	identification
447	projects
448	partner
449	organizations
450	student
451	led
452	project-based
453	internships
454	coordinated
455	successful
456	limitations
457	challenges
458	exist
459	directions
460	leo
461	christopher
462	australian
463	sodium
464	butyrate
465	improves
466	performance
467	weaned
468	piglets
469	period
470	weaning
471	aim
472	assess
473	influence
474	long-term
475	fat
476	supplementation
477	fatty
478	acid
479	profile
480	heavy
481	pig
482	adipose
483	tissue
484	fifty-four
485	white
486	barrows
487	averaging
488	randomized
489	matched
490	weights
491	isoenergetic
492	diets
493	supplemented
494	tallow
495	maize
496	oil
497	rapeseed
498	fats
499	supplement-
500	fed
501	slaughtering
502	slaughter
503	backfat
504	samples
505	collected
506	ten
507	animals
508	treatment
509	analyzed
510	composition
511	close-
512	reflected
513	pigs
514	highest
515	saturated
516	content
517	sfa
518	polyunsaturated
519	pufa
520	lowest
521	monounsaturated
522	mufa
523	linolenic
524	c18
525	cis
526	11-
527	ecosenoic
528	c20
529	linoleic
530	levels
531	iodine
532	result-
533	ing
534	accepted
535	parma
536	consortium
537	dry-cured
538	ham
539	unsaturation
540	index
541	layers
542	subcutaneous
543	differed
544	significantly
545	treatments
546	show
547	dietary
548	increases
549	proportion
550	“healthy”
551	acids
552	nutritional
553	quality
554	technological
555	carefully
556	assessed
557	food
558	security
559	lise
560	kumiega
561	hydrologic
562	connectivity
563	edwards
564	aquifer
565	san
566	marcos
567	springs
568	barton
569	drought
570	conditions
571	serves
572	primary
573	supply
574	south-central
575	source
576	plan
577	protect
578	endangered
579	species
580	immediately
581	downstream
582	questions
583	raised
584	established
585	concept
586	divide
587	antonio
588	segments
589	water-level
590	collection
591	program
592	hydrogeologic
593	groundwater-level
594	groundwater
595	exists
596	vicinity
597	surface
598	drainage
599	onion
600	creek
601	blanco
602	wet
603	normal
604	dissipated
605	longer
606	hydrologically
607	separated
608	result
609	flow
610	droughts
611	bearings
612	assessments
613	simulations
614	numerical
615	cfs
616	flowing
617	appears
618	influenced
619	recharge
620	vulnerable
621	extended
622	periods
623	extensive
624	pumping
625	kyle
626	buda
627	shows
628	low
629	gradient
630	potentiometric
631	variation
632	non-drought
633	slopes
634	north
635	dramatic
636	discontinuity
637	change
638	gradients
639	dynamic
640	unknown
641	structural
642	influences
643	hydraulic
644	properties
645	inherent
646	connection
647	rapid
648	population
649	increased
650	demands
651	areas
652	necessitates
653	continual
654	monitoring
655	trend
656	analyses
657	patricia
658	daniel
659	wolverhampton
660	designing
661	intercultural
662	case
663	atlantic
664	coast
665	nicaragua
666	met
667	21st
668	century
669	genuinely
670	embracing
671	diversity
672	overcome
673	barriers
674	people
675	basis
676	language
677	gender
678	takes
679	multilingual
680	multiethnic
681	examines
682	community
683	uraccan
684	contributing
685	interculturality
686	describes
687	participatory
688	carried
689	staff
690	intention
691	defining
692	delivering
693	discussions
694	wales
695	council
696	emphasises
697	belonging
698	individual
699	communities
700	cultures
701	time
702	supporting
703	include
704	university’s
705	close
706	involvement
707	ethnic
708	ethno-linguistic
709	power
710	relations
711	country
712	militate
713	egalitarianism
714	highlights
715	importance
716	pedagogy
717	promoting
718	achieving
719	lasting
720	rana
721	baiyewu
722	nairobi
723	yam
724	diseases
725	nigeria
726	presents
727	combating
728	menace
729	field
730	storage
731	anthracnose
732	regarded
733	spread
734	mosaic
735	virus
736	disease
737	considered
738	severe
739	losses
740	yams
741	dry
742	rot
743	devastating
744	marked
745	reduction
746	quantity
747	marketable
748	edible
749	portions
750	tubers
751	reductions
752	stored
753	adopted
754	advocated
755	includes
756	crop
757	rotation
758	fallowing
759	planting
760	healthy
761	material
762	destruction
763	infected
764	cultivars
765	resistant
766	tecto
767	thiabendazole
768	locally
769	made
770	gins
771	wood
772	ash
773	found
774	fungal
775	infection
776	finally
777	processing
778	chips
779	cubes
780	shelf
781	live
782	months
783	year
784	rosanna
785	rossi
786	barcelona
787	nutrition
788	general
789	situation
790	cattle
791	slaughtered
792	cameroon
793	representative
794	central
795	african
796	sub-region
797	safety
798	beef
799	abattoir
800	yaoundé
801	largest
802	january
803	march
804	pre-slaughter
805	characteristics
806	carcasses
807	recorded
808	longissimus
809	thoracis
810	represent
811	bulls
812	parameters
813	origin
814	guinea
815	high
816	savannah
817	transhumance
818	production
819	gudali
820	fulani
821	red
822	mbororo
823	breeds
824	predominant
825	carcass
826	weight
827	affected
828	rearing
829	category
830	markedly
831	varied
832	meat
833	similar
834	showed
835	toughest
836	cows
837	pregnant
838	abnormal
839	encountered
840	ectoparasites
841	fatigue
842	lameness
843	fungal-like
844	skin
845	lesions
846	enlarged
847	lymph
848	nodes
849	respiratory
850	distress
851	nodular
852	organs
853	condemned
854	liver
855	flukes
856	completely
857	due
858	tuberculosis
859	lungs
860	aid
861	authorities
862	draw
863	programmes
864	strengthen
865	improve
866	control
867	prevent
868	observed
869	promote
870	trade
871	vajiheh
872	karbasizaed
873	tehran
874	antimicrobial
875	metal
876	resistance
877	plasmid
878	coliforms
879	isolated
880	nosocomial
881	infections
882	hospital
883	isfahan
884	iran
885	patterns
886	profiles
887	enterobacteriacea
888	human
889	faeces
890	fifteen
891	isolates
892	identified
893	escherichia
894	coli
895	remaining
896	kelebsiella
897	pneumoniae
898	seventy
899	percent
900	strains
901	possess
902	multiple
903	antibiotics
904	difference
905	minimal
906	inhibitory
907	concentration
908	mic
909	values
910	clinical
911	cases
912	metals
913	significant
914	tolerant
915	persons
916	relationship
917	group
918	pattern
919	conjugative
920	encoding
921	recovered
922	multidrug-resistance
923	valerie
924	williamson
925	self-organization
926	multi-level
927	institutions
928	networked
929	environments
930	compare
931	actors
932	decide
933	sanction
934	sanctions
935	implemented
936	collectively
937	agree
938	actor
939	sanctioned
940	collective
941	sanctioning
942	problematic
943	difficulty
944	reaching
945	consensus
946	decision
947	perverse
948	punishing
949	contributors
950	ruled
951	goverance
952	zita
953	woods
954	cuny
955	finocchiaro
956	arguments
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 956, true);


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_object_keywords (object_id, keyword_id, pos) FROM stdin;
1	1	0
1	2	1
1	3	2
1	4	3
1	5	4
1	6	5
1	7	6
1	8	7
2	9	0
2	10	1
2	11	2
2	12	3
2	13	4
2	14	5
2	15	6
2	16	7
3	17	0
3	18	1
3	19	2
3	20	3
3	21	4
3	22	5
3	23	6
3	24	7
3	25	8
3	26	9
3	27	10
3	28	11
3	29	12
3	30	13
3	10	14
3	11	15
3	31	16
3	32	17
3	33	18
3	34	19
3	35	20
3	36	21
3	37	22
3	38	23
3	39	24
3	40	25
3	41	26
3	42	27
3	43	28
3	44	29
3	43	30
3	45	31
3	46	32
3	43	33
3	47	34
3	48	35
3	49	36
3	50	37
3	39	38
3	51	39
3	43	40
3	44	41
3	52	42
3	15	43
3	16	44
3	48	45
3	49	46
3	53	47
3	21	48
3	54	49
3	53	50
3	55	51
3	56	52
3	57	53
3	58	54
3	59	55
3	60	56
3	36	57
3	61	58
3	62	59
3	11	60
3	63	61
3	58	62
3	64	63
3	27	64
3	65	65
3	66	66
3	67	67
3	68	68
3	30	69
3	10	70
3	11	71
5	21	0
5	20	1
5	23	2
33	164	0
33	165	1
33	3	2
33	166	3
34	167	0
34	168	1
34	169	2
34	115	3
34	170	4
34	171	5
34	172	6
34	173	7
34	174	8
34	175	9
35	176	0
35	177	1
35	178	2
35	179	3
35	180	4
35	181	5
35	169	6
35	182	7
35	183	8
35	184	9
35	185	10
35	186	11
35	170	12
35	187	13
35	188	14
35	189	15
35	167	16
35	168	17
35	169	18
35	115	19
35	190	20
35	170	21
35	191	22
35	169	23
35	192	24
35	193	25
35	182	26
35	194	27
35	195	28
35	168	29
35	196	30
35	183	31
35	197	32
35	64	33
35	177	34
35	198	35
35	199	36
35	200	37
35	168	38
35	182	39
35	201	40
35	115	41
35	169	42
35	190	43
35	170	44
35	202	45
35	203	46
35	204	47
35	205	48
35	206	49
35	182	50
35	207	51
35	208	52
35	194	53
35	195	54
43	246	48
43	47	49
43	114	50
43	247	51
43	243	52
43	248	53
43	249	54
43	239	55
43	114	56
43	250	57
43	181	58
43	251	59
43	216	60
43	252	61
43	253	62
43	232	63
43	254	64
43	80	65
43	255	66
43	239	67
43	256	68
43	228	69
43	85	70
43	153	71
45	88	0
45	257	1
49	258	0
49	259	1
49	260	2
49	3	3
49	261	4
49	262	5
49	263	6
49	260	7
49	3	8
50	264	0
50	265	1
50	14	2
50	266	3
51	14	0
51	266	1
51	267	2
51	268	3
51	269	4
51	270	5
51	121	6
51	271	7
51	272	8
51	273	9
51	274	10
51	275	11
51	276	12
51	277	13
51	278	14
51	279	15
51	280	16
51	281	17
51	282	18
51	283	19
51	284	20
51	285	21
51	286	22
51	287	23
51	288	24
51	289	25
51	277	26
51	278	27
51	266	28
51	290	29
51	291	30
51	292	31
51	220	32
51	293	33
51	274	34
51	275	35
51	294	36
51	295	37
51	296	38
51	297	39
51	298	40
51	299	41
53	193	0
53	300	1
53	301	2
53	193	3
53	302	4
53	303	5
53	304	6
57	305	0
57	306	1
57	3	2
57	307	3
58	308	0
58	309	1
58	310	2
58	311	3
65	312	0
65	313	1
65	3	2
65	314	3
65	315	4
66	316	0
66	317	1
66	318	2
66	150	3
66	319	4
66	320	5
66	321	6
67	322	0
17	69	0
17	70	1
17	3	2
17	71	3
17	72	4
17	73	5
17	3	6
17	74	7
18	75	0
18	76	1
18	77	2
18	78	3
18	79	4
18	80	5
18	81	6
18	82	7
19	83	0
19	84	1
19	85	2
19	86	3
19	87	4
19	88	5
19	89	6
19	27	7
19	90	8
19	91	9
19	84	10
19	92	11
19	93	12
19	94	13
19	95	14
19	96	15
19	97	16
19	98	17
19	71	18
19	99	19
19	100	20
19	101	21
19	102	22
19	103	23
19	104	24
19	105	25
19	106	26
19	44	27
19	84	28
19	102	29
19	107	30
19	108	31
19	109	32
19	110	33
19	93	34
19	111	35
19	112	36
19	113	37
19	71	38
19	114	39
19	79	40
19	115	41
19	116	42
19	102	43
19	117	44
19	118	45
19	119	46
19	120	47
19	121	48
19	122	49
19	123	50
19	124	51
19	125	52
19	126	53
19	75	54
19	92	55
19	127	56
19	128	57
19	129	58
19	130	59
19	131	60
19	132	61
19	20	62
19	133	63
19	134	64
19	117	65
19	118	66
19	98	67
19	71	68
19	135	69
19	136	70
19	137	71
19	75	72
19	92	73
19	117	74
19	118	75
19	138	76
19	139	77
19	140	78
19	79	79
19	47	80
19	122	81
19	141	82
19	141	83
19	79	84
21	142	0
21	84	1
21	75	2
21	92	3
21	20	4
21	71	5
21	27	6
21	90	7
21	120	8
21	121	9
21	21	10
25	143	0
25	144	1
25	145	2
25	3	3
26	146	0
26	147	1
26	148	2
26	149	3
27	150	0
27	151	1
27	152	2
27	146	3
27	147	4
27	148	5
27	149	6
27	153	7
27	154	8
27	146	9
27	155	10
27	156	11
27	148	12
27	149	13
27	157	14
27	158	15
27	159	16
27	160	17
27	161	18
27	162	19
27	163	20
41	209	0
41	210	1
41	3	2
41	211	3
41	212	4
42	213	0
42	214	1
42	182	2
42	85	3
43	86	0
43	128	1
43	88	2
43	215	3
43	216	4
43	217	5
43	92	6
43	218	7
43	219	8
43	220	9
43	221	10
43	221	11
43	222	12
43	223	13
43	224	14
43	129	15
43	225	16
43	226	17
43	227	18
43	214	19
43	182	20
43	184	21
43	228	22
43	229	23
43	117	24
43	230	25
43	63	26
43	58	27
43	231	28
43	232	29
43	233	30
43	66	31
43	234	32
43	235	33
43	236	34
43	237	35
43	238	36
43	239	37
43	114	38
43	201	39
43	63	40
43	240	41
43	241	42
43	242	43
43	243	44
43	244	45
43	216	46
43	245	47
67	317	1
67	323	2
67	318	3
67	324	4
67	325	5
67	326	6
67	327	7
67	151	8
67	320	9
67	321	10
67	328	11
67	329	12
67	321	13
67	87	14
67	330	15
67	81	16
67	80	17
67	331	18
67	332	19
67	333	20
67	334	21
67	81	22
67	335	23
67	336	24
67	78	25
67	337	26
67	338	27
67	339	28
67	340	29
67	341	30
67	342	31
67	343	32
67	344	33
67	345	34
67	346	35
67	336	36
67	334	37
67	344	38
67	347	39
67	348	40
67	349	41
73	312	0
73	350	1
73	351	2
73	3	3
74	352	0
74	353	1
74	354	2
74	355	3
74	356	4
74	278	5
74	353	6
74	336	7
74	357	8
75	358	0
75	353	1
75	354	2
75	359	3
75	360	4
75	361	5
75	362	6
75	363	7
75	353	8
75	364	9
75	365	10
75	360	11
75	366	12
75	367	13
75	368	14
75	369	15
75	370	16
75	371	17
75	359	18
75	353	19
75	336	20
75	372	21
75	373	22
75	374	23
75	375	24
75	353	25
75	376	26
75	377	27
75	378	28
75	379	29
75	380	30
75	381	31
75	382	32
75	383	33
75	384	34
75	359	35
75	360	36
75	385	37
75	359	38
75	386	39
75	387	40
75	388	41
75	154	42
75	389	43
75	154	44
75	390	45
75	391	46
75	392	47
75	393	48
75	378	49
75	356	50
75	353	51
75	336	52
75	357	53
75	394	54
75	234	55
75	213	56
75	395	57
75	396	58
75	397	59
75	398	60
75	360	61
75	375	62
75	399	63
75	353	64
75	364	65
75	400	66
75	377	67
75	401	68
75	402	69
75	403	70
75	396	71
75	404	72
75	405	73
75	385	74
75	406	75
75	407	76
75	397	77
75	360	78
75	249	79
75	353	80
75	364	81
75	372	82
75	408	83
75	409	84
75	402	85
75	403	86
75	410	87
75	393	88
75	396	89
75	411	90
75	395	91
75	396	92
75	394	93
75	362	94
75	412	95
75	395	96
75	410	97
75	413	98
75	372	99
75	414	100
75	398	101
75	360	102
75	415	103
75	416	104
75	358	105
75	353	106
75	354	107
75	359	108
75	360	109
75	396	110
75	413	111
75	372	112
75	408	113
77	353	0
81	417	0
81	418	1
81	419	2
81	3	3
81	420	4
81	421	5
81	419	6
81	3	7
82	114	0
82	422	1
82	423	2
82	424	3
83	425	0
83	426	1
83	422	2
83	121	3
83	427	4
83	428	5
83	429	6
83	155	7
83	88	8
83	430	9
83	431	10
83	432	11
83	433	12
83	434	13
83	232	14
83	424	15
83	435	16
83	436	17
83	437	18
83	438	19
83	439	20
83	440	21
83	422	22
83	423	23
83	325	24
83	441	25
83	442	26
83	410	27
83	433	28
83	440	29
83	422	30
83	423	31
83	415	32
83	443	33
83	419	34
83	444	35
83	441	36
83	422	37
83	299	38
83	410	39
83	445	40
83	446	41
83	447	42
83	448	43
83	449	44
83	450	45
83	451	46
83	452	47
83	423	48
83	453	49
83	454	50
83	448	51
83	449	52
83	410	53
83	455	54
83	456	55
83	457	56
83	458	57
83	153	58
83	325	59
83	459	60
83	369	61
83	410	62
85	121	0
85	155	1
85	88	2
85	424	3
85	114	4
85	426	5
89	460	0
89	461	1
89	462	2
89	27	3
89	3	4
90	463	0
90	464	1
90	465	2
90	270	3
90	466	4
90	467	5
90	468	6
90	469	7
90	470	8
91	471	0
91	14	1
91	472	2
91	473	3
91	474	4
91	475	5
91	476	6
91	477	7
91	478	8
91	479	9
91	480	10
91	481	11
91	482	12
91	483	13
91	484	14
91	380	15
91	485	16
91	486	17
91	487	18
91	488	19
91	489	20
91	490	21
91	491	22
91	492	23
91	493	24
91	494	25
91	495	26
91	496	27
91	497	28
91	496	29
91	498	30
91	499	31
91	500	32
91	501	33
91	502	34
91	503	35
91	504	36
91	505	37
91	506	38
91	507	39
91	508	40
91	509	41
91	477	42
91	478	43
91	510	44
91	503	45
91	511	46
91	512	47
91	477	48
91	478	49
91	510	50
91	493	51
91	498	52
91	503	53
91	513	54
91	500	55
91	514	56
91	515	57
91	477	58
91	478	59
91	516	60
91	517	61
91	500	62
91	514	63
91	516	64
91	518	65
91	477	66
91	478	67
91	519	68
91	520	69
91	521	70
91	477	71
91	478	72
91	522	73
91	516	74
91	500	75
91	514	76
91	516	77
91	523	78
91	478	79
91	524	80
91	525	81
91	526	82
91	527	83
91	478	84
91	528	85
91	508	86
91	68	87
91	529	88
91	478	89
91	530	90
91	531	91
91	503	92
91	532	93
91	533	94
91	530	95
91	62	96
91	524	97
91	534	98
91	535	99
91	536	100
91	537	101
91	538	102
91	539	103
91	540	104
91	541	105
91	542	106
91	503	107
91	483	108
91	543	109
91	544	110
91	545	111
91	131	112
91	546	113
91	474	114
91	547	115
91	476	116
91	498	117
91	477	118
91	478	119
91	479	120
91	480	121
91	481	122
91	482	123
91	483	124
91	476	125
91	497	126
91	496	127
91	548	128
91	549	129
91	550	130
91	477	131
91	551	132
91	481	133
91	475	134
91	156	135
91	552	136
91	553	137
91	249	138
91	554	139
91	553	140
91	475	141
91	555	142
91	556	143
93	513	0
93	557	1
93	558	2
97	559	0
97	560	1
97	3	2
97	314	3
97	315	4
98	561	0
98	562	1
98	563	2
98	564	3
98	565	4
98	566	5
98	567	6
98	568	7
98	567	8
98	569	9
98	570	10
99	563	0
99	564	1
99	571	2
99	572	3
99	353	4
99	573	5
99	574	6
99	358	7
99	575	8
99	86	9
99	567	10
99	213	11
99	576	12
99	577	13
99	578	14
99	579	15
99	580	16
99	581	17
99	565	18
99	566	19
99	567	20
99	582	21
99	583	22
99	584	23
99	585	24
99	561	25
99	586	26
99	565	27
99	587	28
99	568	29
99	567	30
99	588	31
99	563	32
99	564	33
99	569	34
99	570	35
99	432	36
99	582	37
99	589	38
99	18	39
99	590	40
99	591	41
99	592	42
99	14	43
99	231	44
99	40	45
99	593	46
99	18	47
99	594	48
99	586	49
99	595	50
99	596	51
99	597	52
99	598	53
99	586	54
99	599	55
99	600	56
99	601	57
99	372	58
99	602	59
99	603	60
99	561	61
99	570	62
99	40	63
99	18	64
99	505	65
99	569	66
99	323	67
99	594	68
99	586	69
99	604	70
99	605	71
99	606	72
99	607	73
99	588	74
99	608	75
99	337	76
99	594	77
99	609	78
99	271	79
99	565	80
99	566	81
99	567	82
99	568	83
99	567	84
99	86	85
99	610	86
99	80	87
99	611	88
99	336	89
99	354	90
99	594	91
99	563	92
99	564	93
99	612	94
99	613	95
99	614	96
99	410	97
99	64	98
99	615	99
99	616	100
99	271	101
99	565	102
99	566	103
99	568	104
99	567	105
99	569	106
99	570	107
99	594	108
99	586	109
99	617	110
99	618	111
99	619	112
99	599	113
99	600	114
99	601	115
99	372	116
99	617	117
99	620	118
99	621	119
99	622	120
99	619	121
99	623	122
99	624	123
99	596	124
99	625	125
99	626	126
99	18	127
99	404	128
99	627	129
99	628	130
99	629	131
99	630	132
99	597	133
99	565	134
99	566	135
99	567	136
99	625	137
99	631	138
99	530	139
99	569	140
99	632	141
99	622	142
99	625	143
99	568	144
99	567	145
99	630	146
99	597	147
99	633	148
99	544	149
99	634	150
99	635	151
99	530	152
99	569	153
99	632	154
99	622	155
99	575	156
99	30	157
99	636	158
99	637	159
99	630	160
99	638	161
99	639	162
99	353	163
99	96	164
99	135	165
99	625	166
99	640	167
99	641	168
99	642	169
99	643	170
99	644	171
99	645	172
99	564	173
99	636	174
99	473	175
99	26	176
99	561	177
99	646	178
99	565	179
99	566	180
99	568	181
99	567	182
99	647	183
99	648	184
99	270	185
99	649	186
99	353	187
99	650	188
99	625	189
99	626	190
99	651	191
99	652	192
99	653	193
99	594	194
99	96	195
99	654	196
99	591	197
99	565	198
99	566	199
99	567	200
99	626	201
99	382	202
99	18	203
99	325	204
99	592	205
99	655	206
99	656	207
101	353	0
105	657	0
105	658	1
105	3	2
105	659	3
106	660	0
106	661	1
106	102	2
106	662	3
106	14	4
106	663	5
106	664	6
106	665	7
107	457	0
107	666	1
107	667	2
107	668	3
107	669	4
107	670	5
107	671	6
107	88	7
107	672	8
107	673	9
107	222	10
107	458	11
107	674	12
107	675	13
107	676	14
107	28	15
107	677	16
107	662	17
107	14	18
107	678	19
107	663	20
107	664	21
107	665	22
107	679	23
107	680	24
107	296	25
107	681	26
107	682	27
107	3	28
107	683	29
107	684	30
107	121	31
107	685	32
107	686	33
107	687	34
107	63	35
107	688	36
107	3	37
107	689	38
107	93	39
107	690	40
107	691	41
107	661	42
107	102	43
107	122	44
107	692	45
107	410	46
107	675	47
107	693	48
107	410	49
107	682	50
107	157	51
107	694	52
107	102	53
107	695	54
107	696	55
107	697	56
107	698	57
107	699	58
107	700	59
107	701	60
107	42	61
107	702	62
107	121	63
107	661	64
107	102	65
107	703	66
107	704	67
107	705	68
107	706	69
107	707	70
107	699	71
107	571	72
107	708	73
107	709	74
107	710	75
107	296	76
107	711	77
107	712	78
107	713	79
107	3	80
107	63	81
107	714	82
107	715	83
107	687	84
107	716	85
107	675	86
107	717	87
107	685	88
107	718	89
107	719	90
107	232	91
107	147	92
109	667	0
109	668	1
109	671	2
109	679	3
109	680	4
109	687	5
109	716	6
109	676	7
109	28	8
109	677	9
109	713	10
109	232	11
109	147	12
113	720	0
113	721	1
113	3	2
113	722	3
114	723	0
114	724	1
114	336	2
114	725	3
115	150	0
115	726	1
115	724	2
115	723	3
115	336	4
115	122	5
115	141	6
115	727	7
115	728	8
115	725	9
115	729	10
115	730	11
115	724	12
115	234	13
115	731	14
115	732	15
115	208	16
115	733	17
115	729	18
115	724	19
115	723	20
115	734	21
115	735	22
115	736	23
115	737	24
115	738	25
115	739	26
115	740	27
115	741	28
115	742	29
115	737	30
115	743	31
115	730	32
115	724	33
115	723	34
115	741	35
115	742	36
115	740	37
115	744	38
115	745	39
115	746	40
115	747	41
115	748	42
115	749	43
115	750	44
115	751	45
115	738	46
115	752	47
115	740	48
115	336	49
115	122	50
115	753	51
115	754	52
115	727	53
115	729	54
115	724	55
115	755	56
115	756	57
115	757	58
115	758	59
115	759	60
115	760	61
115	761	62
115	762	63
115	763	64
115	756	65
115	764	66
115	765	67
115	764	68
115	730	69
115	724	70
115	766	71
115	767	72
115	768	73
115	769	74
115	741	75
115	770	76
115	771	77
115	772	78
115	730	79
115	773	80
115	577	81
115	723	82
115	750	83
115	774	84
115	775	85
115	730	86
115	776	87
115	777	88
115	723	89
115	750	90
115	778	91
115	779	92
115	548	93
115	780	94
115	781	95
115	469	96
115	782	97
115	783	98
121	784	0
121	785	1
121	786	2
121	3	3
122	473	0
122	474	1
122	787	2
122	547	3
122	498	4
122	477	5
122	478	6
122	510	7
122	480	8
122	513	9
122	503	10
123	471	0
123	63	1
123	382	2
123	788	3
123	789	4
123	790	5
123	791	6
123	792	7
123	793	8
123	794	9
123	795	10
123	796	11
123	553	12
123	797	13
123	798	14
123	799	15
123	800	16
123	801	17
123	792	18
123	737	19
123	802	20
123	803	21
123	804	22
123	570	23
123	805	24
123	790	25
123	806	26
123	807	27
123	808	28
123	809	29
123	502	30
123	806	31
123	397	32
123	810	33
123	811	34
123	791	35
123	553	36
123	812	37
123	510	38
123	808	39
123	809	40
123	688	41
123	813	42
123	790	43
123	814	44
123	815	45
123	816	46
123	817	47
123	193	48
123	818	49
123	360	50
123	819	51
123	485	52
123	820	53
123	821	54
123	822	55
123	823	56
123	824	57
123	825	58
123	826	59
123	827	60
123	828	61
123	360	62
123	790	63
123	829	64
123	830	65
123	831	66
123	783	67
123	832	68
123	553	69
123	475	70
123	516	71
123	628	72
123	833	73
123	823	74
123	819	75
123	834	76
123	835	77
123	832	78
123	836	79
123	791	80
123	837	81
123	193	82
123	838	83
123	570	84
123	839	85
123	840	86
123	841	87
123	842	88
123	843	89
123	844	90
123	845	91
123	846	92
123	847	93
123	848	94
123	849	95
123	850	96
123	851	97
123	845	98
123	806	99
123	852	100
123	853	101
123	854	102
123	855	103
123	856	104
123	853	105
123	857	106
123	858	107
123	827	108
123	859	109
123	18	110
123	860	111
123	861	112
123	862	113
123	863	114
123	471	115
123	864	116
123	790	117
123	818	118
123	865	119
123	798	120
123	573	121
123	866	122
123	867	123
123	868	124
123	724	125
123	869	126
123	366	127
123	870	128
125	790	0
125	557	1
125	558	2
129	871	0
129	872	1
129	3	2
129	873	3
130	874	0
130	480	1
130	875	2
130	876	3
130	877	4
130	479	5
130	878	6
130	879	7
130	880	8
130	881	9
130	882	10
130	883	11
130	884	12
131	874	0
131	480	1
131	875	2
131	876	3
131	885	4
131	877	5
131	886	6
131	878	7
131	887	8
131	879	9
131	880	10
131	881	11
131	760	12
131	888	13
131	889	14
131	38	15
131	890	16
131	891	17
131	880	18
131	881	19
131	892	20
131	893	21
131	894	22
131	895	23
131	896	24
131	897	25
131	898	26
131	899	27
131	900	28
131	879	29
131	880	30
131	881	31
131	901	32
131	902	33
131	876	34
131	903	35
131	38	36
131	900	37
131	760	38
131	888	39
131	889	40
131	904	41
131	905	42
131	906	43
131	907	44
131	908	45
131	909	46
131	900	47
131	910	48
131	911	49
131	889	50
131	480	51
131	912	52
131	913	53
131	900	54
131	879	55
131	882	56
131	914	57
131	480	58
131	875	59
131	760	60
131	915	61
131	56	62
131	916	63
131	877	64
131	479	65
131	917	66
131	874	67
131	876	68
131	918	69
131	919	70
131	877	71
131	920	72
131	876	73
131	480	74
131	912	75
131	903	76
131	921	77
131	900	78
131	879	79
131	880	80
131	881	81
131	131	82
131	922	83
131	878	84
131	337	85
131	880	86
131	775	87
131	296	88
137	923	0
137	924	1
137	3	2
137	4	3
138	925	0
138	926	1
138	927	2
138	928	3
138	929	4
139	930	0
139	436	1
139	931	2
139	37	3
139	932	4
139	933	5
139	436	6
139	934	7
139	935	8
139	931	9
139	936	10
139	937	11
139	938	12
139	939	13
139	940	14
139	941	15
139	344	16
139	942	17
139	857	18
139	943	19
139	944	20
139	945	21
139	946	22
139	769	23
139	936	24
139	947	25
139	941	26
139	948	27
139	815	28
139	949	29
139	698	30
139	931	31
139	950	32
139	940	33
139	941	34
139	344	35
139	297	36
139	917	37
141	925	0
141	926	1
141	927	2
141	951	3
145	952	0
145	953	1
145	954	2
146	955	0
146	956	1
146	956	2
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
1	2	1	0
2	2	2	0
3	2	4	0
4	2	16	0
5	2	17	0
6	2	8	0
7	2	32	0
8	2	64	0
17	3	1	0
18	3	2	0
19	3	4	0
20	3	16	0
21	3	17	0
22	3	8	0
23	3	32	0
24	3	64	0
25	4	1	0
26	4	2	0
27	4	4	0
28	4	16	0
29	4	17	0
30	4	8	0
31	4	32	0
32	4	64	0
33	5	1	0
34	5	2	0
35	5	4	0
36	5	16	0
37	5	17	0
38	5	8	0
39	5	32	0
40	5	64	0
41	6	1	0
42	6	2	0
43	6	4	0
44	6	16	0
45	6	17	0
46	6	8	0
47	6	32	0
48	6	64	0
49	7	1	0
50	7	2	0
51	7	4	0
52	7	16	0
53	7	17	0
54	7	8	0
55	7	32	0
56	7	64	0
57	8	1	0
58	8	2	0
59	8	4	0
60	8	16	0
61	8	17	0
62	8	8	0
63	8	32	0
64	8	64	0
65	9	1	0
66	9	2	0
67	9	4	0
68	9	16	0
69	9	17	0
70	9	8	0
71	9	32	0
72	9	64	0
73	10	1	0
74	10	2	0
75	10	4	0
76	10	16	0
77	10	17	0
78	10	8	0
79	10	32	0
80	10	64	0
81	11	1	0
82	11	2	0
83	11	4	0
84	11	16	0
85	11	17	0
86	11	8	0
87	11	32	0
88	11	64	0
89	12	1	0
90	12	2	0
91	12	4	0
92	12	16	0
93	12	17	0
94	12	8	0
95	12	32	0
96	12	64	0
97	13	1	0
98	13	2	0
99	13	4	0
100	13	16	0
101	13	17	0
102	13	8	0
103	13	32	0
104	13	64	0
105	14	1	0
106	14	2	0
107	14	4	0
108	14	16	0
109	14	17	0
110	14	8	0
111	14	32	0
112	14	64	0
113	15	1	0
114	15	2	0
115	15	4	0
116	15	16	0
117	15	17	0
118	15	8	0
119	15	32	0
120	15	64	0
121	16	1	0
122	16	2	0
123	16	4	0
124	16	16	0
125	16	17	0
126	16	8	0
127	16	32	0
128	16	64	0
129	17	1	0
130	17	2	0
131	17	4	0
132	17	16	0
133	17	17	0
134	17	8	0
135	17	32	0
136	17	64	0
137	18	1	0
138	18	2	0
139	18	4	0
140	18	16	0
141	18	17	0
142	18	8	0
143	18	32	0
144	18	64	0
145	19	1	0
146	19	2	0
147	19	4	0
148	19	16	0
149	19	17	0
150	19	8	0
151	19	32	0
152	19	64	0
\.


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 152, true);


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
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

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
17	1	18	2023-01-20 02:10:35	2023-01-20 02:10:28	2023-01-20 02:10:28	5	en_US	3	0	0
9	1	10	2023-01-20 02:06:41	2023-01-20 02:06:36	2023-01-20 02:06:36	5	en_US	3	0	0
1	1	1	2023-01-20 02:02:15	2023-01-20 02:02:14	2023-01-20 02:02:14	5	en_US	1	0	0
13	1	14	2023-01-20 02:08:39	2023-01-20 02:08:33	2023-01-20 02:08:33	5	en_US	3	0	0
5	1	6	2023-01-20 02:04:45	2023-01-20 02:04:39	2023-01-20 02:04:39	5	en_US	3	0	0
2	1	2	2023-01-20 02:02:55	2023-01-20 02:02:37	2023-01-20 02:02:37	5	en_US	3	0	0
10	1	11	2023-01-20 02:07:09	2023-01-20 02:07:04	2023-01-20 02:07:04	5	en_US	3	0	0
18	1	19	2023-01-20 02:11:04	2023-01-20 02:10:57	2023-01-20 02:10:57	5	en_US	3	0	0
6	1	7	2023-01-20 02:05:15	2023-01-20 02:05:09	2023-01-20 02:05:09	5	en_US	3	0	0
14	1	15	2023-01-20 02:09:08	2023-01-20 02:09:01	2023-01-20 02:09:01	5	en_US	3	0	0
7	1	8	2023-01-20 02:05:46	2023-01-20 02:05:40	2023-01-20 02:05:40	5	en_US	3	0	0
11	1	12	2023-01-20 02:07:41	2023-01-20 02:07:35	2023-01-20 02:07:35	5	en_US	3	0	0
3	1	4	2023-01-20 02:03:49	2023-01-20 02:03:20	2023-01-20 02:03:20	5	en_US	3	0	0
15	1	16	2023-01-20 02:09:36	2023-01-20 02:09:30	2023-01-20 02:09:30	5	en_US	3	0	0
19	1	20	2023-01-20 02:11:32	2023-01-20 02:11:25	2023-01-20 02:11:25	5	en_US	3	0	0
8	1	9	2023-01-20 02:06:13	2023-01-20 02:06:07	2023-01-20 02:06:07	5	en_US	3	0	0
4	1	5	2023-01-20 02:04:17	2023-01-20 02:04:11	2023-01-20 02:04:11	5	en_US	3	0	0
12	1	13	2023-01-20 02:08:10	2023-01-20 02:08:04	2023-01-20 02:08:04	5	en_US	3	0	0
16	1	17	2023-01-20 02:10:05	2023-01-20 02:09:59	2023-01-20 02:09:59	5	en_US	3	0	0
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
8	en_US	affiliation	0	0	University of Windsor	string
8	en_US	givenName	0	0	Catherine	string
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
8	en_US	familyName	0	0	Kwantes	string
12	en_US	affiliation	0	0	University College Cork	string
1	en_US	givenName	0	0	admin	string
1	en_US	familyName	0	0	admin	string
7	en_US	affiliation	0	0	University of Bologna	string
7	en_US	givenName	0	0	Carlo	string
7	en_US	familyName	0	0	Corino	string
10	en_US	affiliation	0	0	Alexandria University	string
3	en_US	affiliation	0	0	University of Melbourne	string
3	en_US	givenName	0	0	Daniel	string
3	en_US	familyName	0	0	Barnes	string
3	en_US	preferredPublicName	0	0		string
2	en_US	biography	0	0		string
2	fr_CA	biography	0	0		string
2	en_US	signature	0	0		string
2	fr_CA	signature	0	0		string
2	en_US	affiliation	0	0	Universidad Nacional Autónoma de México	string
11	en_US	affiliation	0	0	University of Toronto	string
9	en_US	affiliation	0	0	University of Alberta	string
9	en_US	givenName	0	0	Craig	string
9	en_US	familyName	0	0	Montgomerie	string
11	en_US	givenName	0	0	Dana	string
10	en_US	givenName	0	0	Diaga	string
10	en_US	familyName	0	0	Diouf	string
3	fr_CA	signature	0	0		string
3	en_US	biography	0	0		string
3	fr_CA	biography	0	0		string
3	en_US	signature	0	0		string
11	en_US	familyName	0	0	Phillips	string
3	fr_CA	affiliation	0	0		string
3		orcid	0	0		string
12	en_US	givenName	0	0	Domatilia	string
12	en_US	familyName	0	0	Sokoloff	string
3	fr_CA	preferredPublicName	0	0		string
13	en_US	affiliation	0	0	Indiana University	string
13	en_US	givenName	0	0	Elinor	string
13	en_US	familyName	0	0	Ostrom	string
3	fr_CA	familyName	0	0		string
14	en_US	givenName	0	0	Fabio	string
14	en_US	familyName	0	0	Paglieri	string
3	fr_CA	givenName	0	0		string
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
16	jnovak	$2y$10$hR5ZBt3BLVb5PYg4hbA5YOVd1W4S8wcR9zPixHahrsvfsRtxcF2zi	jnovak@mailinator.com	\N	\N	\N	\N	DK		\N	\N	2023-01-20 02:06:46	\N	2023-01-20 02:06:46	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$nJsrHpB5Pb3iqYJ3rSg5/u2HHtjLVJ29uB1Sxnk/R1VC3YZ1c68.6	dbuskins@mailinator.com				\N	US		\N	\N	2023-01-20 02:00:59	\N	2023-01-20 02:00:59	0	0	\N	0	\N	1
5	sberardo	$2y$10$Ez1VmVEVRArkn/V2kVRA1OBZYqvw3Osow71er6MfmxIzo/WOdE1Xq	sberardo@mailinator.com				\N	CA		\N	\N	2023-01-20 02:01:05	\N	2023-01-20 02:01:05	0	0	\N	0	\N	1
6	minoue	$2y$10$27eEC77XAVZgmRskgYipueSZ7IFOoI4rOTGLAGAkLv.eZFJjlE2wK	minoue@mailinator.com				\N	JP		\N	\N	2023-01-20 02:01:12	\N	2023-01-20 02:01:12	0	0	\N	0	\N	1
17	kalkhafaji	$2y$10$YmRQgdwrza51y25E/hEBDONqplS92vJIYTw3ou6KyQaXR0Cn9RWRW	kalkhafaji@mailinator.com	\N	\N	\N	\N	US		\N	\N	2023-01-20 02:07:14	\N	2023-01-20 02:07:14	0	\N	\N	0	\N	1
25	zwoods	$2y$10$9lZFpOtWXBGkx1zE02mEiuHsszoeJ5ObR76LK8GMnvpZrNLnBQ4A6	zwoods@mailinator.com	\N	\N	\N	\N	US		\N	\N	2023-01-20 02:11:08	\N	2023-01-20 02:11:08	0	\N	\N	0	\N	1
2	rvaca	$2y$10$Q4f.nDwdWbfIxZHq4XVEyeq8n0s3Ioyp17eNN7jTqseAFX.eDnyfi	rvaca@mailinator.com				\N	MX		\N	\N	2023-01-20 02:00:47	\N	2023-01-20 02:01:18	0	0	\N	0	\N	1
1	admin	$2y$10$AYUYXP/ECZzoaDMAwu1h/ehKtT66bMvgJIB.3h9yXdEciNTSUbpnm	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2023-01-20 01:59:59	\N	2023-01-20 02:01:28	0	\N	\N	0	\N	1
7	ccorino	$2y$10$k6b6.MuP/qJklVapYpNb3Ov0bSSTCcXdHjocW5FaWPiazaDxdiaYG	ccorino@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2023-01-20 02:01:56	\N	2023-01-20 02:01:56	0	\N	\N	0	\N	1
8	ckwantes	$2y$10$k5fcXYZ7JKQ1X5zFR39egeq4ATeQmlEeF5s8eALbyRp91pFk9Mfju	ckwantes@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-01-20 02:02:19	\N	2023-01-20 02:02:19	0	\N	\N	0	\N	1
18	lchristopher	$2y$10$VsfnMuY6Y4EVo.STTWsZVOqf6GZ122XIEOjCGla9AyVi0C4ezm6wa	lchristopher@mailinator.com	\N	\N	\N	\N	AU		\N	\N	2023-01-20 02:07:46	\N	2023-01-20 02:07:46	0	\N	\N	0	\N	1
9	cmontgomerie	$2y$10$rypeV.fAElY2Wf3IrJLJHurKeyLKg1YF3Z/ENCrzaAZ3Yxm4F3mti	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-01-20 02:02:59	\N	2023-01-20 02:02:59	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$yDL/MkGPY3IOVZjSdyU6u.u//R0m3RXnC0ckIZDBKFmIzGUgUE6xK	dbarnes@mailinator.com				\N	AU		\N	\N	2023-01-20 02:00:52	\N	2023-01-20 02:11:26	0	0	\N	0	\N	1
10	ddiouf	$2y$10$QOAZPFD8BsreGBRV5defq.ouTQ.QPsb7MxFutjcWyNUQxRsjQLbOe	ddiouf@mailinator.com	\N	\N	\N	\N	EG		\N	\N	2023-01-20 02:03:53	\N	2023-01-20 02:03:53	0	\N	\N	0	\N	1
19	lkumiega	$2y$10$N1eUlZNlsg..1cbj9yzCeOH17bY6MIgxh1K1YJEsAQVAzgkwBUlgK	lkumiega@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2023-01-20 02:08:14	\N	2023-01-20 02:08:15	0	\N	\N	0	\N	1
11	dphillips	$2y$10$pAOKbbyAV5lZz7eDBykyauuUqAzel5HtrANr8itUQcsTWnkMTQqR2	dphillips@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-01-20 02:04:21	\N	2023-01-20 02:04:21	0	\N	\N	0	\N	1
12	dsokoloff	$2y$10$ZnWqjQXdP7cBEmWzENOZE.GGHTbgZbTAS.JjxKZ1QEFZjVY6VZPBK	dsokoloff@mailinator.com	\N	\N	\N	\N	IE		\N	\N	2023-01-20 02:04:52	\N	2023-01-20 02:04:52	0	\N	\N	0	\N	1
13	eostrom	$2y$10$lJlNLUplaN/qG4XReRz.4OMs2E1ladEeRbABx1mFPS70lyPBoajdu	eostrom@mailinator.com	\N	\N	\N	\N	US		\N	\N	2023-01-20 02:05:19	\N	2023-01-20 02:05:19	0	\N	\N	0	\N	1
20	pdaniel	$2y$10$Q7Uz5sn0j.tkGSwqaWxvb.bQoyS1itZrITM/56gsdO61Wb18hxJyq	pdaniel@mailinator.com	\N	\N	\N	\N	GB		\N	\N	2023-01-20 02:08:43	\N	2023-01-20 02:08:43	0	\N	\N	0	\N	1
14	fpaglieri	$2y$10$saOlLw4iEGuIBLPgVT8WnO2zHYdbrxfotNZQx1Q9/8hzWH9mQBDeK	fpaglieri@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2023-01-20 02:05:50	\N	2023-01-20 02:05:50	0	\N	\N	0	\N	1
15	jmwandenga	$2y$10$S.8u0/22mTpggrVkiYGybOQmHmQN46gmKNTUwMnedj0tH0vc7WfjK	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2023-01-20 02:06:18	\N	2023-01-20 02:06:18	0	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$XvOpGNSQOA.lUxmTbQ7vVu9UL3uQx9B7BCpTQFm0NUy8XmaPtmEry	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE		\N	\N	2023-01-20 02:09:12	\N	2023-01-20 02:09:12	0	\N	\N	0	\N	1
22	rrossi	$2y$10$P2YAgE4xksKGxv6n0cGyr.NjUwbFQkZM2ueVV9ZIOyJhihudD/.JK	rrossi@mailinator.com	\N	\N	\N	\N	ES		\N	\N	2023-01-20 02:09:41	\N	2023-01-20 02:09:41	0	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$zQ8PEwduxULwaLJlq69V5.wKuJl0szT.l9vZG21p0i9MNM1JIX3pO	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR		\N	\N	2023-01-20 02:10:10	\N	2023-01-20 02:10:10	0	\N	\N	0	\N	1
24	vwilliamson	$2y$10$TL9INJiKRPfa9NyUZp6JJ.snLFxM0JELmGT5m307AagLw9IYZlmN2	vwilliamson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-01-20 02:10:39	\N	2023-01-20 02:10:39	0	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2023-01-20 01:59:59	1	plugins.metadata	dc11		0	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	1	0	2023-01-20 01:59:59	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	1	0	2023-01-20 01:59:59	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.generic	usageEvent		0	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	2	0	0	2023-01-20 01:59:59	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	2	0	0	2023-01-20 01:59:59	1	plugins.generic	acron	AcronPlugin	1	1
1	0	0	0	2023-01-20 01:59:59	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	1	3	4	2023-01-20 01:59:59	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.generic	crossrefDeposit	CrossrefDepositPlugin	1	0
1	1	0	0	2023-01-20 01:59:59	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
2	2	0	0	2023-01-20 01:59:59	1	plugins.importexport	crossref		0	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
1	0	0	0	2023-01-20 01:59:59	1	plugins.themes	default	DefaultThemePlugin	1	0
3	3	0	13	2023-01-20 01:59:59	1	core	ops		0	1
1	1	0	0	2023-01-20 01:59:59	1	plugins.reports	counterReport		0	0
\.


--
-- Name: access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_pkey UNIQUE (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_pkey UNIQUE (type_id, locale, setting_name);


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
-- Name: author_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_pkey UNIQUE (author_id, locale, setting_name);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: c_v_e_s_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_pkey UNIQUE (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: category_path; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_path UNIQUE (context_id, path);


--
-- Name: category_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_pkey UNIQUE (category_id, locale, setting_name);


--
-- Name: citation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_pkey UNIQUE (citation_id, locale, setting_name);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: citations_publication_seq; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication_seq UNIQUE (publication_id, seq);


--
-- Name: controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocab_symbolic; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocab_symbolic UNIQUE (symbolic, assoc_type, assoc_id);


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
-- Name: data_object_tombstone_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_pkey UNIQUE (tombstone_id, locale, setting_name);


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
-- Name: email_log_user_id; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_user_id UNIQUE (email_log_id, user_id);


--
-- Name: email_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_settings_pkey UNIQUE (email_id, locale, setting_name);


--
-- Name: email_templates_default_data_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_pkey UNIQUE (email_key, locale);


--
-- Name: email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates_email_key; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_email_key UNIQUE (email_key, context_id);


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
-- Name: event_log_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_pkey UNIQUE (log_id, setting_name);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- Name: filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filter_groups_symbolic; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_symbolic UNIQUE (symbolic);


--
-- Name: filter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_pkey UNIQUE (filter_id, locale, setting_name);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genre_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_pkey UNIQUE (genre_id, locale, setting_name);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: item_views_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_pkey UNIQUE (assoc_type, assoc_id, user_id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: journal_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journal_settings
    ADD CONSTRAINT journal_settings_pkey UNIQUE (journal_id, locale, setting_name);


--
-- Name: journals_path; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_path UNIQUE (path);


--
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (journal_id);


--
-- Name: library_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_pkey UNIQUE (file_id, locale, setting_name);


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
-- Name: metadata_descripton_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metadata_description_settings
    ADD CONSTRAINT metadata_descripton_settings_pkey UNIQUE (metadata_description_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_pkey UNIQUE (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_pkey UNIQUE (navigation_menu_item_id, locale, setting_name);


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
-- Name: notification_mail_list_email_context; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_email_context UNIQUE (email, context);


--
-- Name: notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey UNIQUE (notification_id, locale, setting_name);


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
-- Name: oai_resumption_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens
    ADD CONSTRAINT oai_resumption_tokens_pkey UNIQUE (token);


--
-- Name: plugin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_pkey UNIQUE (plugin_name, context_id, setting_name);


--
-- Name: publication_categories_id; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_id UNIQUE (publication_id, category_id);


--
-- Name: publication_galley_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galley_settings
    ADD CONSTRAINT publication_galley_settings_pkey UNIQUE (galley_id, locale, setting_name);


--
-- Name: publication_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: publication_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_pkey UNIQUE (publication_id, locale, setting_name);


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
-- Name: query_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_pkey UNIQUE (query_id, user_id);


--
-- Name: review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_pkey UNIQUE (review_id, submission_file_id);


--
-- Name: review_form_element_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_pkey UNIQUE (review_form_element_id, locale, setting_name);


--
-- Name: review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_form_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_pkey UNIQUE (review_form_id, locale, setting_name);


--
-- Name: review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_round_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_pkey UNIQUE (submission_id, review_round_id, submission_file_id);


--
-- Name: review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: review_rounds_submission_id_stage_id_round_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_submission_id_stage_id_round_pkey UNIQUE (submission_id, stage_id, round);


--
-- Name: scheduled_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.scheduled_tasks
    ADD CONSTRAINT scheduled_tasks_pkey UNIQUE (class_name);


--
-- Name: section_editors_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_pkey UNIQUE (context_id, assoc_id, assoc_type, user_id);


--
-- Name: section_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.section_settings
    ADD CONSTRAINT section_settings_pkey UNIQUE (section_id, locale, setting_name);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey UNIQUE (session_id);


--
-- Name: site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey UNIQUE (setting_name, locale);


--
-- Name: stage_assignment; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignment UNIQUE (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_file_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_pkey PRIMARY KEY (revision_id);


--
-- Name: submission_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_pkey UNIQUE (submission_file_id, locale, setting_name);


--
-- Name: submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (submission_file_id);


--
-- Name: submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_keyword_text; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_text UNIQUE (keyword_text);


--
-- Name: submission_search_object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_pkey UNIQUE (object_id, pos);


--
-- Name: submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_pkey UNIQUE (submission_id, locale, setting_name);


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
-- Name: u_e_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT u_e_pkey UNIQUE (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_pkey UNIQUE (user_group_id, locale, setting_name);


--
-- Name: user_group_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_pkey UNIQUE (context_id, user_group_id, stage_id);


--
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey UNIQUE (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey UNIQUE (user_group_id, user_id);


--
-- Name: users_email; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_username; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey UNIQUE (product_type, product, major, minor, revision, build);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX access_keys_hash ON public.access_keys USING btree (key_hash, user_id, context);


--
-- Name: announcement_settings_announcement_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcement_settings_announcement_id ON public.announcement_settings USING btree (announcement_id);


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
-- Name: authors_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX authors_publication_id ON public.authors USING btree (publication_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id, parent_id);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX citation_settings_citation_id ON public.citation_settings USING btree (citation_id);


--
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: controlled_vocab_entries_cv_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX controlled_vocab_entries_cv_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id, seq);


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX data_object_tombstone_oai_set_objects_tombstone_id ON public.data_object_tombstone_oai_set_objects USING btree (tombstone_id);


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
-- Name: email_settings_email_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_settings_email_id ON public.email_templates_settings USING btree (email_id);


--
-- Name: email_templates_default_email_key; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_templates_default_email_key ON public.email_templates_default USING btree (email_key);


--
-- Name: event_log_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX event_log_assoc ON public.event_log USING btree (assoc_type, assoc_id);


--
-- Name: event_log_settings_log_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX event_log_settings_log_id ON public.event_log_settings USING btree (log_id);


--
-- Name: event_log_settings_name_value; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX event_log_settings_name_value ON public.event_log_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['fileId'::character varying, 'submissionId'::character varying])::text[]));


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX genre_settings_genre_id ON public.genre_settings USING btree (genre_id);


--
-- Name: jobs_queue_reserved_at_index; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX jobs_queue_reserved_at_index ON public.jobs USING btree (queue, reserved_at);


--
-- Name: journal_settings_journal_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX journal_settings_journal_id ON public.journal_settings USING btree (journal_id);


--
-- Name: library_file_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_file_settings_id ON public.library_file_settings USING btree (file_id);


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
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


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
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX plugin_settings_plugin_name ON public.plugin_settings USING btree (plugin_name);


--
-- Name: publication_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galley_settings_galley_id ON public.publication_galley_settings USING btree (galley_id);


--
-- Name: publication_galley_settings_name_value; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galley_settings_name_value ON public.publication_galley_settings USING btree (setting_name, setting_value);


--
-- Name: publication_galleys_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_publication_id ON public.publication_galleys USING btree (publication_id);


--
-- Name: publication_galleys_url_path; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_url_path ON public.publication_galleys USING btree (url_path);


--
-- Name: publication_settings_name_value; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_settings_name_value ON public.publication_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['indexingState'::character varying, 'medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying, 'pub-id::publisher-id'::character varying])::text[]));


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
-- Name: review_files_review_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_files_review_id ON public.review_files USING btree (review_id);


--
-- Name: review_form_element_settings_review_form_element_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_element_settings_review_form_element_id ON public.review_form_element_settings USING btree (review_form_element_id);


--
-- Name: review_form_elements_review_form_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_elements_review_form_id ON public.review_form_elements USING btree (review_form_id);


--
-- Name: review_form_responses_pkey; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_responses_pkey ON public.review_form_responses USING btree (review_form_element_id, review_id);


--
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_settings_review_form_id ON public.review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: section_editors_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX section_editors_context_id ON public.subeditor_submission_group USING btree (context_id);


--
-- Name: section_settings_section_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX section_settings_section_id ON public.section_settings USING btree (section_id);


--
-- Name: sections_journal_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sections_journal_id ON public.sections USING btree (journal_id);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sessions_user_id ON public.sessions USING btree (user_id);


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

CREATE INDEX subeditor_submission_group_assoc_id ON public.subeditor_submission_group USING btree (assoc_id, assoc_type);


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

CREATE INDEX submission_file_settings_id ON public.submission_file_settings USING btree (submission_file_id);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_submission; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_object_submission ON public.submission_search_objects USING btree (submission_id);


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
-- Name: user_group_stage_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_group_stage_context_id ON public.user_group_stage USING btree (context_id);


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
-- Name: user_settings_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_settings_user_id ON public.user_settings USING btree (user_id);


--
-- Name: user_user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_user_groups_user_group_id ON public.user_user_groups USING btree (user_group_id);


--
-- Name: user_user_groups_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_user_groups_user_id ON public.user_user_groups USING btree (user_id);


--
-- Name: publication_galleys_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- Name: submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


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

