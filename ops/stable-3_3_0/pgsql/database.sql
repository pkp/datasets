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
3	en_US	affiliation	University of Alberta
3		country	CA
3	en_US	familyName	Montgomerie
3	en_US	givenName	Craig
4	en_US	affiliation	University of Victoria
4	fr_CA	affiliation	
4	en_US	biography	
4	fr_CA	biography	
4		country	CA
4	en_US	familyName	Irvine
4	fr_CA	familyName	
4	en_US	givenName	Mark
4	fr_CA	givenName	
4		orcid	
4	en_US	preferredPublicName	
4	fr_CA	preferredPublicName	
4		url	
5	en_US	affiliation	Alexandria University
5		country	EG
5	en_US	familyName	Diouf
5	en_US	givenName	Diaga
6	en_US	affiliation	University of Toronto
6		country	CA
6	en_US	familyName	Phillips
6	en_US	givenName	Dana
7	en_US	affiliation	University College Cork
7		country	IE
7	en_US	familyName	Sokoloff
7	en_US	givenName	Domatilia
8	en_US	affiliation	Indiana University
8		country	US
8	en_US	familyName	Ostrom
8	en_US	givenName	Elinor
9	en_US	affiliation	Indiana University
9	fr_CA	affiliation	
9	en_US	biography	
9	fr_CA	biography	
9		country	US
9	en_US	familyName	van Laerhoven
9	fr_CA	familyName	
9	en_US	givenName	Frank
9	fr_CA	givenName	
9		orcid	
9	en_US	preferredPublicName	
9	fr_CA	preferredPublicName	
9		url	
10	en_US	affiliation	University of Rome
10		country	IT
10	en_US	familyName	Paglieri
10	en_US	givenName	Fabio
11	en_US	affiliation	University of Cape Town
11		country	ZA
11	en_US	familyName	Mwandenga
11	en_US	givenName	John
12	en_US	affiliation	Aalborg University
12		country	DK
12	en_US	familyName	Novak
12	en_US	givenName	John
13	en_US	affiliation	Stanford University
13		country	US
13	en_US	familyName	Al-Khafaji
13	en_US	givenName	Karim
14	en_US	affiliation	Stanford University
14	fr_CA	affiliation	
14	en_US	biography	
14	fr_CA	biography	
14		country	US
14	en_US	familyName	Morse
14	fr_CA	familyName	
14	en_US	givenName	Margaret
14	fr_CA	givenName	
14		orcid	
14	en_US	preferredPublicName	
14	fr_CA	preferredPublicName	
14		url	
15	en_US	affiliation	Australian National University
15		country	AU
15	en_US	familyName	Christopher
15	en_US	givenName	Leo
16	en_US	affiliation	University of Cape Town
16		country	ZA
16	en_US	familyName	Kumiega
16	en_US	givenName	Lise
17	en_US	affiliation	University of Wolverhampton
17		country	GB
17	en_US	familyName	Daniel
17	en_US	givenName	Patricia
18	en_US	affiliation	University of Nairobi
18		country	KE
18	en_US	familyName	Baiyewu
18	en_US	givenName	Rana
19	en_US	affiliation	Barcelona University
19		country	ES
19	en_US	familyName	Rossi
19	en_US	givenName	Rosanna
20	en_US	affiliation	University of Tehran
20		country	IR
20	en_US	familyName	Karbasizaed
20	en_US	givenName	Vajiheh
21	en_US	affiliation	University of Windsor
21		country	CA
21	en_US	familyName	Williamson
21	en_US	givenName	Valerie
22	en_US	affiliation	CUNY
22		country	US
22	en_US	familyName	Woods
22	en_US	givenName	Zita
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, seq, user_group_id) FROM stdin;
1	ccorino@mailinator.com	1	1	0	4
2	ckwantes@mailinator.com	1	2	0	4
3	cmontgomerie@mailinator.com	1	3	0	4
4	mirvine@mailinator.com	1	3	1	4
5	ddiouf@mailinator.com	1	4	0	4
6	dphillips@mailinator.com	1	5	0	4
7	dsokoloff@mailinator.com	1	6	0	4
8	eostrom@mailinator.com	1	7	0	4
9	fvanlaerhoven@mailinator.com	1	7	1	4
10	fpaglieri@mailinator.com	1	8	0	4
11	jmwandenga@mailinator.com	1	9	0	4
12	jnovak@mailinator.com	1	10	0	4
13	kalkhafaji@mailinator.com	1	11	0	4
14	mmorse@mailinator.com	1	11	1	4
15	lchristopher@mailinator.com	1	12	0	4
16	lkumiega@mailinator.com	1	13	0	4
17	pdaniel@mailinator.com	1	14	0	4
18	rbaiyewu@mailinator.com	1	15	0	4
19	rrossi@mailinator.com	1	16	0	4
20	vkarbasizaed@mailinator.com	1	17	0	4
21	vwilliamson@mailinator.com	1	18	0	4
22	zwoods@mailinator.com	1	19	0	4
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
1	2	1
2	2	2
5	7	1
6	7	2
14	12	1
15	12	2
16	12	3
17	12	4
18	12	5
19	12	6
20	12	7
23	27	1
24	27	2
28	32	1
29	32	2
30	32	3
32	47	1
37	52	1
38	52	2
39	52	3
40	52	4
43	57	1
44	57	2
46	62	1
57	67	1
58	67	2
59	67	3
60	67	4
61	67	5
62	67	6
63	67	7
64	67	8
65	67	9
66	67	10
69	77	1
70	77	2
74	87	1
75	87	2
76	87	3
\.


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 76, true);


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	submissionKeyword	pigs	string
2	en_US	submissionKeyword	food security	string
5	en_US	submissionKeyword	employees	string
6	en_US	submissionKeyword	survey	string
14	en_US	submissionKeyword	Integrating Technology	string
15	en_US	submissionKeyword	Computer Skills	string
16	en_US	submissionKeyword	Survey	string
17	en_US	submissionKeyword	Alberta	string
18	en_US	submissionKeyword	National	string
19	en_US	submissionKeyword	Provincial	string
20	en_US	submissionKeyword	Professional Development	string
23	en_US	submissionKeyword	education	string
24	en_US	submissionKeyword	citizenship	string
28	en_US	submissionKeyword	Common pool resource	string
29	en_US	submissionKeyword	common property	string
30	en_US	submissionKeyword	intellectual developments	string
32	en_US	submissionKeyword	water	string
37	en_US	submissionKeyword	Development	string
38	en_US	submissionKeyword	engineering education	string
39	en_US	submissionKeyword	service learning	string
40	en_US	submissionKeyword	sustainability	string
43	en_US	submissionKeyword	pigs	string
44	en_US	submissionKeyword	food security	string
46	en_US	submissionKeyword	water	string
57	en_US	submissionKeyword	21st Century	string
58	en_US	submissionKeyword	Diversity	string
59	en_US	submissionKeyword	Multilingual	string
60	en_US	submissionKeyword	Multiethnic	string
61	en_US	submissionKeyword	Participatory Pedagogy	string
62	en_US	submissionKeyword	Language	string
63	en_US	submissionKeyword	Culture	string
64	en_US	submissionKeyword	Gender	string
65	en_US	submissionKeyword	Egalitarianism	string
66	en_US	submissionKeyword	Social Transformation	string
69	en_US	submissionKeyword	cattle	string
70	en_US	submissionKeyword	food security	string
74	en_US	submissionKeyword	Self-Organization	string
75	en_US	submissionKeyword	Multi-Level Institutions	string
76	en_US	submissionKeyword	Goverance	string
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
\.


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 96, true);


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
4	PASSWORD_RESET	0	1	\N	\N	\N
5	USER_REGISTER	0	1	\N	\N	\N
6	USER_VALIDATE	0	1	\N	\N	\N
7	PUBLISH_NOTIFY	0	1	\N	\N	\N
8	SUBMISSION_ACK	1	1	\N	65536	5
9	POSTED_ACK	1	1	\N	65536	5
10	SUBMISSION_ACK_NOT_USER	1	1	\N	65536	5
11	EDITOR_ASSIGN	1	1	16	16	5
12	EDITOR_DECISION_ACCEPT	0	1	16	65536	5
13	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536	5
14	STATISTICS_REPORT_NOTIFICATION	1	1	16	17	\N
15	ANNOUNCEMENT	0	1	16	1048576	\N
16	ORCID_COLLECT_AUTHOR_ID	0	1	\N	\N	\N
17	ORCID_REQUEST_AUTHOR_AUTHORIZATION	0	1	\N	\N	\N
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
PUBLISH_NOTIFY	en_US	New Preprint Posted	Readers:<br />\n<br />\n{$contextName} has just posted its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Moderator's User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}"<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.
NOTIFICATION	fr_CA	Nouvel avis de {$siteTitle}	Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d'avis.
POSTED_ACK	en_US	Preprint Posted Acknowledgement	{$authorName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$contextName}.<br />\n<br />\nPreprint URL: {$publicationUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.
EDITOR_ASSIGN	en_US	Moderator Assignment	{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.	This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.
EDITOR_DECISION_ACCEPT	en_US	Moderator Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission	This email from the Manager or Moderator to an Author notifies them of a final "accept submission" decision regarding their submission.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Moderator Decision	\n\t\t\t{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission	This email is sent to the author if the moderator declines his submission initially.
STATISTICS_REPORT_NOTIFICATION	en_US	Preprint Server activity for {$month}, {$year}	Preprint Server activity for {$month}, {$year}	Preprint Server activity for {$month}, {$year}
ANNOUNCEMENT	en_US	{$title}	<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href="{$url}">full announcement</a>.	This email is sent when a new announcement is created.
ORCID_COLLECT_AUTHOR_ID	en_US	Submission ORCID	Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href="{$orcidAboutUrl}">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	This email template is used to collect the ORCID id's from authors.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	en_US	Requesting ORCID record access	Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission "{$submissionTitle}" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href="{$orcidAboutUrl}">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n	This email template is used to request ORCID record access from authors.
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

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 17, true);


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
1	1048585	1	7	2021-12-10 21:41:02	268435458	submission.event.general.metadataUpdated	0
2	515	1	7	2021-12-10 21:41:12	1342177281	submission.event.fileUploaded	0
3	1048585	1	7	2021-12-10 21:41:12	1342177288	submission.event.fileRevised	0
4	515	1	7	2021-12-10 21:41:14	1342177296	submission.event.fileEdited	0
5	1048585	1	7	2021-12-10 21:41:14	1342177296	submission.event.fileEdited	0
6	1048585	1	7	2021-12-10 21:41:18	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	7	2021-12-10 21:41:19	268435457	submission.event.submissionSubmitted	0
8	1048585	2	8	2021-12-10 21:41:27	268435458	submission.event.general.metadataUpdated	0
9	515	2	8	2021-12-10 21:41:36	1342177281	submission.event.fileUploaded	0
10	1048585	2	8	2021-12-10 21:41:36	1342177288	submission.event.fileRevised	0
11	515	2	8	2021-12-10 21:41:38	1342177296	submission.event.fileEdited	0
12	1048585	2	8	2021-12-10 21:41:38	1342177296	submission.event.fileEdited	0
13	1048585	2	8	2021-12-10 21:41:43	268435458	submission.event.general.metadataUpdated	0
14	1048585	2	8	2021-12-10 21:41:44	268435457	submission.event.submissionSubmitted	0
15	1048585	2	3	2021-12-10 21:41:50	268435462	publication.event.published	0
16	1048585	3	9	2021-12-10 21:41:58	268435458	submission.event.general.metadataUpdated	0
17	515	3	9	2021-12-10 21:42:07	1342177281	submission.event.fileUploaded	0
18	1048585	3	9	2021-12-10 21:42:07	1342177288	submission.event.fileRevised	0
19	515	3	9	2021-12-10 21:42:09	1342177296	submission.event.fileEdited	0
20	1048585	3	9	2021-12-10 21:42:09	1342177296	submission.event.fileEdited	0
21	1048585	3	9	2021-12-10 21:42:19	268435458	submission.event.general.metadataUpdated	0
22	1048585	3	9	2021-12-10 21:42:20	268435457	submission.event.submissionSubmitted	0
23	1048585	3	3	2021-12-10 21:42:28	268435462	publication.event.published	0
24	1048585	4	10	2021-12-10 21:42:35	268435458	submission.event.general.metadataUpdated	0
25	515	4	10	2021-12-10 21:42:45	1342177281	submission.event.fileUploaded	0
26	1048585	4	10	2021-12-10 21:42:45	1342177288	submission.event.fileRevised	0
27	515	4	10	2021-12-10 21:42:47	1342177296	submission.event.fileEdited	0
28	1048585	4	10	2021-12-10 21:42:47	1342177296	submission.event.fileEdited	0
29	1048585	4	10	2021-12-10 21:42:50	268435458	submission.event.general.metadataUpdated	0
30	1048585	4	10	2021-12-10 21:42:51	268435457	submission.event.submissionSubmitted	0
31	1048585	4	3	2021-12-10 21:42:58	268435462	publication.event.published	0
32	1048585	5	11	2021-12-10 21:43:05	268435458	submission.event.general.metadataUpdated	0
33	515	5	11	2021-12-10 21:43:14	1342177281	submission.event.fileUploaded	0
34	1048585	5	11	2021-12-10 21:43:14	1342177288	submission.event.fileRevised	0
35	515	5	11	2021-12-10 21:43:17	1342177296	submission.event.fileEdited	0
36	1048585	5	11	2021-12-10 21:43:17	1342177296	submission.event.fileEdited	0
37	1048585	5	11	2021-12-10 21:43:22	268435458	submission.event.general.metadataUpdated	0
38	1048585	5	11	2021-12-10 21:43:23	268435457	submission.event.submissionSubmitted	0
39	1048585	5	3	2021-12-10 21:43:29	268435462	publication.event.published	0
40	1048585	6	12	2021-12-10 21:43:36	268435458	submission.event.general.metadataUpdated	0
41	515	6	12	2021-12-10 21:43:46	1342177281	submission.event.fileUploaded	0
42	1048585	6	12	2021-12-10 21:43:46	1342177288	submission.event.fileRevised	0
43	515	6	12	2021-12-10 21:43:48	1342177296	submission.event.fileEdited	0
44	1048585	6	12	2021-12-10 21:43:48	1342177296	submission.event.fileEdited	0
45	1048585	6	12	2021-12-10 21:43:51	268435458	submission.event.general.metadataUpdated	0
46	1048585	6	12	2021-12-10 21:43:53	268435457	submission.event.submissionSubmitted	0
47	1048585	6	3	2021-12-10 21:44:00	268435462	publication.event.published	0
48	1048585	7	13	2021-12-10 21:44:07	268435458	submission.event.general.metadataUpdated	0
49	515	7	13	2021-12-10 21:44:16	1342177281	submission.event.fileUploaded	0
50	1048585	7	13	2021-12-10 21:44:16	1342177288	submission.event.fileRevised	0
51	515	7	13	2021-12-10 21:44:19	1342177296	submission.event.fileEdited	0
52	1048585	7	13	2021-12-10 21:44:19	1342177296	submission.event.fileEdited	0
53	1048585	7	13	2021-12-10 21:44:27	268435458	submission.event.general.metadataUpdated	0
54	1048585	7	13	2021-12-10 21:44:28	268435457	submission.event.submissionSubmitted	0
55	1048585	7	3	2021-12-10 21:44:34	268435462	publication.event.published	0
56	1048585	8	14	2021-12-10 21:44:42	268435458	submission.event.general.metadataUpdated	0
57	515	8	14	2021-12-10 21:44:51	1342177281	submission.event.fileUploaded	0
58	1048585	8	14	2021-12-10 21:44:51	1342177288	submission.event.fileRevised	0
59	515	8	14	2021-12-10 21:44:54	1342177296	submission.event.fileEdited	0
60	1048585	8	14	2021-12-10 21:44:54	1342177296	submission.event.fileEdited	0
61	1048585	8	14	2021-12-10 21:44:57	268435458	submission.event.general.metadataUpdated	0
62	1048585	8	14	2021-12-10 21:44:58	268435457	submission.event.submissionSubmitted	0
63	1048585	8	3	2021-12-10 21:45:03	268435462	publication.event.published	0
64	1048585	9	15	2021-12-10 21:45:11	268435458	submission.event.general.metadataUpdated	0
65	515	9	15	2021-12-10 21:45:20	1342177281	submission.event.fileUploaded	0
66	1048585	9	15	2021-12-10 21:45:20	1342177288	submission.event.fileRevised	0
67	515	9	15	2021-12-10 21:45:23	1342177296	submission.event.fileEdited	0
68	1048585	9	15	2021-12-10 21:45:23	1342177296	submission.event.fileEdited	0
69	1048585	9	15	2021-12-10 21:45:27	268435458	submission.event.general.metadataUpdated	0
70	1048585	9	15	2021-12-10 21:45:28	268435457	submission.event.submissionSubmitted	0
71	1048585	9	3	2021-12-10 21:45:34	268435462	publication.event.published	0
72	1048585	10	16	2021-12-10 21:45:42	268435458	submission.event.general.metadataUpdated	0
73	515	10	16	2021-12-10 21:45:51	1342177281	submission.event.fileUploaded	0
74	1048585	10	16	2021-12-10 21:45:51	1342177288	submission.event.fileRevised	0
75	515	10	16	2021-12-10 21:45:54	1342177296	submission.event.fileEdited	0
76	1048585	10	16	2021-12-10 21:45:54	1342177296	submission.event.fileEdited	0
77	1048585	10	16	2021-12-10 21:45:58	268435458	submission.event.general.metadataUpdated	0
78	1048585	10	16	2021-12-10 21:45:59	268435457	submission.event.submissionSubmitted	0
79	1048585	10	3	2021-12-10 21:46:05	268435462	publication.event.published	0
80	1048585	11	17	2021-12-10 21:46:13	268435458	submission.event.general.metadataUpdated	0
81	515	11	17	2021-12-10 21:46:22	1342177281	submission.event.fileUploaded	0
82	1048585	11	17	2021-12-10 21:46:22	1342177288	submission.event.fileRevised	0
83	515	11	17	2021-12-10 21:46:25	1342177296	submission.event.fileEdited	0
84	1048585	11	17	2021-12-10 21:46:25	1342177296	submission.event.fileEdited	0
85	1048585	11	17	2021-12-10 21:46:33	268435458	submission.event.general.metadataUpdated	0
86	1048585	11	17	2021-12-10 21:46:34	268435457	submission.event.submissionSubmitted	0
87	1048585	11	3	2021-12-10 21:46:41	268435462	publication.event.published	0
88	1048585	12	18	2021-12-10 21:46:48	268435458	submission.event.general.metadataUpdated	0
89	515	12	18	2021-12-10 21:46:58	1342177281	submission.event.fileUploaded	0
90	1048585	12	18	2021-12-10 21:46:58	1342177288	submission.event.fileRevised	0
91	515	12	18	2021-12-10 21:47:00	1342177296	submission.event.fileEdited	0
92	1048585	12	18	2021-12-10 21:47:00	1342177296	submission.event.fileEdited	0
93	1048585	12	18	2021-12-10 21:47:05	268435458	submission.event.general.metadataUpdated	0
94	1048585	12	18	2021-12-10 21:47:06	268435457	submission.event.submissionSubmitted	0
95	1048585	12	3	2021-12-10 21:47:12	268435462	publication.event.published	0
96	1048585	13	19	2021-12-10 21:47:19	268435458	submission.event.general.metadataUpdated	0
97	515	13	19	2021-12-10 21:47:29	1342177281	submission.event.fileUploaded	0
98	1048585	13	19	2021-12-10 21:47:29	1342177288	submission.event.fileRevised	0
99	515	13	19	2021-12-10 21:47:31	1342177296	submission.event.fileEdited	0
100	1048585	13	19	2021-12-10 21:47:31	1342177296	submission.event.fileEdited	0
101	1048585	13	19	2021-12-10 21:47:37	268435458	submission.event.general.metadataUpdated	0
102	1048585	13	19	2021-12-10 21:47:38	268435457	submission.event.submissionSubmitted	0
103	1048585	13	3	2021-12-10 21:47:45	268435462	publication.event.published	0
104	1048585	14	20	2021-12-10 21:47:52	268435458	submission.event.general.metadataUpdated	0
105	515	14	20	2021-12-10 21:48:01	1342177281	submission.event.fileUploaded	0
106	1048585	14	20	2021-12-10 21:48:01	1342177288	submission.event.fileRevised	0
107	515	14	20	2021-12-10 21:48:04	1342177296	submission.event.fileEdited	0
108	1048585	14	20	2021-12-10 21:48:04	1342177296	submission.event.fileEdited	0
109	1048585	14	20	2021-12-10 21:48:08	268435458	submission.event.general.metadataUpdated	0
110	1048585	14	20	2021-12-10 21:48:10	268435457	submission.event.submissionSubmitted	0
111	1048585	14	3	2021-12-10 21:48:16	268435462	publication.event.published	0
112	1048585	15	21	2021-12-10 21:48:23	268435458	submission.event.general.metadataUpdated	0
113	515	15	21	2021-12-10 21:48:32	1342177281	submission.event.fileUploaded	0
114	1048585	15	21	2021-12-10 21:48:32	1342177288	submission.event.fileRevised	0
115	515	15	21	2021-12-10 21:48:35	1342177296	submission.event.fileEdited	0
116	1048585	15	21	2021-12-10 21:48:35	1342177296	submission.event.fileEdited	0
117	1048585	15	21	2021-12-10 21:48:39	268435458	submission.event.general.metadataUpdated	0
118	1048585	15	21	2021-12-10 21:48:40	268435457	submission.event.submissionSubmitted	0
119	1048585	15	3	2021-12-10 21:48:47	268435462	publication.event.published	0
120	1048585	16	22	2021-12-10 21:48:54	268435458	submission.event.general.metadataUpdated	0
121	515	16	22	2021-12-10 21:49:03	1342177281	submission.event.fileUploaded	0
122	1048585	16	22	2021-12-10 21:49:03	1342177288	submission.event.fileRevised	0
123	515	16	22	2021-12-10 21:49:06	1342177296	submission.event.fileEdited	0
124	1048585	16	22	2021-12-10 21:49:06	1342177296	submission.event.fileEdited	0
125	1048585	16	22	2021-12-10 21:49:11	268435458	submission.event.general.metadataUpdated	0
126	1048585	16	22	2021-12-10 21:49:13	268435457	submission.event.submissionSubmitted	0
127	1048585	16	3	2021-12-10 21:49:20	268435462	publication.event.published	0
128	1048585	17	23	2021-12-10 21:49:28	268435458	submission.event.general.metadataUpdated	0
129	515	17	23	2021-12-10 21:49:37	1342177281	submission.event.fileUploaded	0
130	1048585	17	23	2021-12-10 21:49:37	1342177288	submission.event.fileRevised	0
131	515	17	23	2021-12-10 21:49:39	1342177296	submission.event.fileEdited	0
132	1048585	17	23	2021-12-10 21:49:39	1342177296	submission.event.fileEdited	0
133	1048585	17	23	2021-12-10 21:49:45	268435458	submission.event.general.metadataUpdated	0
134	1048585	17	23	2021-12-10 21:49:46	268435457	submission.event.submissionSubmitted	0
135	1048585	17	3	2021-12-10 21:49:52	268435462	publication.event.published	0
136	1048585	18	24	2021-12-10 21:50:00	268435458	submission.event.general.metadataUpdated	0
137	515	18	24	2021-12-10 21:50:10	1342177281	submission.event.fileUploaded	0
138	1048585	18	24	2021-12-10 21:50:10	1342177288	submission.event.fileRevised	0
139	515	18	24	2021-12-10 21:50:12	1342177296	submission.event.fileEdited	0
140	1048585	18	24	2021-12-10 21:50:12	1342177296	submission.event.fileEdited	0
141	1048585	18	24	2021-12-10 21:50:16	268435458	submission.event.general.metadataUpdated	0
142	1048585	18	24	2021-12-10 21:50:18	268435457	submission.event.submissionSubmitted	0
143	1048585	18	3	2021-12-10 21:50:24	268435462	publication.event.published	0
144	1048585	19	25	2021-12-10 21:50:31	268435458	submission.event.general.metadataUpdated	0
145	515	19	25	2021-12-10 21:50:41	1342177281	submission.event.fileUploaded	0
146	1048585	19	25	2021-12-10 21:50:41	1342177288	submission.event.fileRevised	0
147	515	19	25	2021-12-10 21:50:43	1342177296	submission.event.fileEdited	0
148	1048585	19	25	2021-12-10 21:50:43	1342177296	submission.event.fileEdited	0
149	1048585	19	25	2021-12-10 21:50:47	268435458	submission.event.general.metadataUpdated	0
150	1048585	19	25	2021-12-10 21:50:48	268435457	submission.event.submissionSubmitted	0
151	1048585	19	3	2021-12-10 21:50:55	268435462	publication.event.published	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 151, true);


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
17	fileStage	10	int
17	sourceSubmissionFileId	\N	string
17	submissionFileId	3	int
17	fileId	3	int
17	submissionId	3	int
17	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
17	username	cmontgomerie	string
18	fileStage	10	int
18	submissionFileId	3	int
18	fileId	3	int
18	submissionId	3	int
18	username	cmontgomerie	string
18	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
19	fileStage	10	int
19	sourceSubmissionFileId	\N	string
19	submissionFileId	3	int
19	fileId	3	int
19	submissionId	3	int
19	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
19	username	cmontgomerie	string
20	fileStage	10	int
20	sourceSubmissionFileId	\N	string
20	submissionFileId	3	int
20	fileId	3	int
20	submissionId	3	int
20	username	cmontgomerie	string
20	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
20	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
25	fileStage	10	int
25	sourceSubmissionFileId	\N	string
25	submissionFileId	4	int
25	fileId	4	int
25	submissionId	4	int
25	originalFileName	Genetic transformation of forest trees.pdf	string
25	username	ddiouf	string
26	fileStage	10	int
26	submissionFileId	4	int
26	fileId	4	int
26	submissionId	4	int
26	username	ddiouf	string
26	name	Genetic transformation of forest trees.pdf	string
27	fileStage	10	int
27	sourceSubmissionFileId	\N	string
27	submissionFileId	4	int
27	fileId	4	int
27	submissionId	4	int
27	originalFileName	Genetic transformation of forest trees.pdf	string
27	username	ddiouf	string
28	fileStage	10	int
28	sourceSubmissionFileId	\N	string
28	submissionFileId	4	int
28	fileId	4	int
28	submissionId	4	int
28	username	ddiouf	string
28	originalFileName	Genetic transformation of forest trees.pdf	string
28	name	Genetic transformation of forest trees.pdf	string
33	fileStage	10	int
33	sourceSubmissionFileId	\N	string
33	submissionFileId	5	int
33	fileId	5	int
33	submissionId	5	int
33	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
33	username	dphillips	string
34	fileStage	10	int
34	submissionFileId	5	int
34	fileId	5	int
34	submissionId	5	int
34	username	dphillips	string
34	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
35	fileStage	10	int
35	sourceSubmissionFileId	\N	string
35	submissionFileId	5	int
35	fileId	5	int
35	submissionId	5	int
35	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
35	username	dphillips	string
36	fileStage	10	int
36	sourceSubmissionFileId	\N	string
36	submissionFileId	5	int
36	fileId	5	int
36	submissionId	5	int
36	username	dphillips	string
36	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
36	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
41	fileStage	10	int
41	sourceSubmissionFileId	\N	string
41	submissionFileId	6	int
41	fileId	6	int
41	submissionId	6	int
41	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
41	username	dsokoloff	string
42	fileStage	10	int
42	submissionFileId	6	int
42	fileId	6	int
42	submissionId	6	int
42	username	dsokoloff	string
42	name	Developing efficacy beliefs in the classroom.pdf	string
43	fileStage	10	int
43	sourceSubmissionFileId	\N	string
43	submissionFileId	6	int
43	fileId	6	int
43	submissionId	6	int
43	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
43	username	dsokoloff	string
44	fileStage	10	int
44	sourceSubmissionFileId	\N	string
44	submissionFileId	6	int
44	fileId	6	int
44	submissionId	6	int
44	username	dsokoloff	string
44	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
44	name	Developing efficacy beliefs in the classroom.pdf	string
49	fileStage	10	int
49	sourceSubmissionFileId	\N	string
49	submissionFileId	7	int
49	fileId	7	int
49	submissionId	7	int
49	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
49	username	eostrom	string
50	fileStage	10	int
50	submissionFileId	7	int
50	fileId	7	int
50	submissionId	7	int
50	username	eostrom	string
50	name	Traditions and Trends in the Study of the Commons.pdf	string
51	fileStage	10	int
51	sourceSubmissionFileId	\N	string
51	submissionFileId	7	int
51	fileId	7	int
51	submissionId	7	int
51	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
51	username	eostrom	string
52	fileStage	10	int
52	sourceSubmissionFileId	\N	string
52	submissionFileId	7	int
52	fileId	7	int
52	submissionId	7	int
52	username	eostrom	string
52	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
52	name	Traditions and Trends in the Study of the Commons.pdf	string
57	fileStage	10	int
57	sourceSubmissionFileId	\N	string
57	submissionFileId	8	int
57	fileId	8	int
57	submissionId	8	int
57	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
57	username	fpaglieri	string
58	fileStage	10	int
58	submissionFileId	8	int
58	fileId	8	int
58	submissionId	8	int
58	username	fpaglieri	string
58	name	Hansen & Pinto: Reason Reclaimed.pdf	string
59	fileStage	10	int
59	sourceSubmissionFileId	\N	string
59	submissionFileId	8	int
59	fileId	8	int
59	submissionId	8	int
59	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
59	username	fpaglieri	string
60	fileStage	10	int
60	sourceSubmissionFileId	\N	string
60	submissionFileId	8	int
60	fileId	8	int
60	submissionId	8	int
60	username	fpaglieri	string
60	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
60	name	Hansen & Pinto: Reason Reclaimed.pdf	string
65	fileStage	10	int
65	sourceSubmissionFileId	\N	string
65	submissionFileId	9	int
65	fileId	9	int
65	submissionId	9	int
65	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
65	username	jmwandenga	string
66	fileStage	10	int
66	submissionFileId	9	int
66	fileId	9	int
66	submissionId	9	int
66	username	jmwandenga	string
66	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
67	fileStage	10	int
67	sourceSubmissionFileId	\N	string
67	submissionFileId	9	int
67	fileId	9	int
67	submissionId	9	int
67	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
67	username	jmwandenga	string
68	fileStage	10	int
68	sourceSubmissionFileId	\N	string
68	submissionFileId	9	int
68	fileId	9	int
68	submissionId	9	int
68	username	jmwandenga	string
68	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
68	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
73	fileStage	10	int
73	sourceSubmissionFileId	\N	string
73	submissionFileId	10	int
73	fileId	10	int
73	submissionId	10	int
73	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
73	username	jnovak	string
74	fileStage	10	int
74	submissionFileId	10	int
74	fileId	10	int
74	submissionId	10	int
74	username	jnovak	string
74	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
75	fileStage	10	int
75	sourceSubmissionFileId	\N	string
75	submissionFileId	10	int
75	fileId	10	int
75	submissionId	10	int
75	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
75	username	jnovak	string
76	fileStage	10	int
76	sourceSubmissionFileId	\N	string
76	submissionFileId	10	int
76	fileId	10	int
76	submissionId	10	int
76	username	jnovak	string
76	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
76	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
81	fileStage	10	int
81	sourceSubmissionFileId	\N	string
81	submissionFileId	11	int
81	fileId	11	int
81	submissionId	11	int
81	originalFileName	Learning Sustainable Design through Service.pdf	string
81	username	kalkhafaji	string
82	fileStage	10	int
82	submissionFileId	11	int
82	fileId	11	int
82	submissionId	11	int
82	username	kalkhafaji	string
82	name	Learning Sustainable Design through Service.pdf	string
83	fileStage	10	int
83	sourceSubmissionFileId	\N	string
83	submissionFileId	11	int
83	fileId	11	int
83	submissionId	11	int
83	originalFileName	Learning Sustainable Design through Service.pdf	string
83	username	kalkhafaji	string
84	fileStage	10	int
84	sourceSubmissionFileId	\N	string
84	submissionFileId	11	int
84	fileId	11	int
84	submissionId	11	int
84	username	kalkhafaji	string
84	originalFileName	Learning Sustainable Design through Service.pdf	string
84	name	Learning Sustainable Design through Service.pdf	string
89	fileStage	10	int
89	sourceSubmissionFileId	\N	string
89	submissionFileId	12	int
89	fileId	12	int
89	submissionId	12	int
89	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
89	username	lchristopher	string
90	fileStage	10	int
90	submissionFileId	12	int
90	fileId	12	int
90	submissionId	12	int
90	username	lchristopher	string
90	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
91	fileStage	10	int
91	sourceSubmissionFileId	\N	string
91	submissionFileId	12	int
91	fileId	12	int
91	submissionId	12	int
91	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
91	username	lchristopher	string
92	fileStage	10	int
92	sourceSubmissionFileId	\N	string
92	submissionFileId	12	int
92	fileId	12	int
92	submissionId	12	int
92	username	lchristopher	string
92	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
92	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
97	fileStage	10	int
97	sourceSubmissionFileId	\N	string
97	submissionFileId	13	int
97	fileId	13	int
97	submissionId	13	int
97	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
97	username	lkumiega	string
98	fileStage	10	int
98	submissionFileId	13	int
98	fileId	13	int
98	submissionId	13	int
98	username	lkumiega	string
98	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
99	fileStage	10	int
99	sourceSubmissionFileId	\N	string
99	submissionFileId	13	int
99	fileId	13	int
99	submissionId	13	int
99	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
99	username	lkumiega	string
100	fileStage	10	int
100	sourceSubmissionFileId	\N	string
100	submissionFileId	13	int
100	fileId	13	int
100	submissionId	13	int
100	username	lkumiega	string
100	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
100	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
105	fileStage	10	int
105	sourceSubmissionFileId	\N	string
105	submissionFileId	14	int
105	fileId	14	int
105	submissionId	14	int
105	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
105	username	pdaniel	string
106	fileStage	10	int
106	submissionFileId	14	int
106	fileId	14	int
106	submissionId	14	int
106	username	pdaniel	string
106	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
107	fileStage	10	int
107	sourceSubmissionFileId	\N	string
107	submissionFileId	14	int
107	fileId	14	int
107	submissionId	14	int
107	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
107	username	pdaniel	string
108	fileStage	10	int
108	sourceSubmissionFileId	\N	string
108	submissionFileId	14	int
108	fileId	14	int
108	submissionId	14	int
108	username	pdaniel	string
108	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
108	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
113	fileStage	10	int
113	sourceSubmissionFileId	\N	string
113	submissionFileId	15	int
113	fileId	15	int
113	submissionId	15	int
113	originalFileName	Yam diseases and its management in Nigeria.pdf	string
113	username	rbaiyewu	string
114	fileStage	10	int
114	submissionFileId	15	int
114	fileId	15	int
114	submissionId	15	int
114	username	rbaiyewu	string
114	name	Yam diseases and its management in Nigeria.pdf	string
115	fileStage	10	int
115	sourceSubmissionFileId	\N	string
115	submissionFileId	15	int
115	fileId	15	int
115	submissionId	15	int
115	originalFileName	Yam diseases and its management in Nigeria.pdf	string
115	username	rbaiyewu	string
116	fileStage	10	int
116	sourceSubmissionFileId	\N	string
116	submissionFileId	15	int
116	fileId	15	int
116	submissionId	15	int
116	username	rbaiyewu	string
116	originalFileName	Yam diseases and its management in Nigeria.pdf	string
116	name	Yam diseases and its management in Nigeria.pdf	string
121	fileStage	10	int
121	sourceSubmissionFileId	\N	string
121	submissionFileId	16	int
121	fileId	16	int
121	submissionId	16	int
121	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
121	username	rrossi	string
122	fileStage	10	int
122	submissionFileId	16	int
122	fileId	16	int
122	submissionId	16	int
122	username	rrossi	string
122	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
123	fileStage	10	int
123	sourceSubmissionFileId	\N	string
123	submissionFileId	16	int
123	fileId	16	int
123	submissionId	16	int
123	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
123	username	rrossi	string
124	fileStage	10	int
124	sourceSubmissionFileId	\N	string
124	submissionFileId	16	int
124	fileId	16	int
124	submissionId	16	int
124	username	rrossi	string
124	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
124	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
129	fileStage	10	int
129	sourceSubmissionFileId	\N	string
129	submissionFileId	17	int
129	fileId	17	int
129	submissionId	17	int
129	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
129	username	vkarbasizaed	string
130	fileStage	10	int
130	submissionFileId	17	int
130	fileId	17	int
130	submissionId	17	int
130	username	vkarbasizaed	string
130	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
131	fileStage	10	int
131	sourceSubmissionFileId	\N	string
131	submissionFileId	17	int
131	fileId	17	int
131	submissionId	17	int
131	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
131	username	vkarbasizaed	string
132	fileStage	10	int
132	sourceSubmissionFileId	\N	string
132	submissionFileId	17	int
132	fileId	17	int
132	submissionId	17	int
132	username	vkarbasizaed	string
132	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
132	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
137	fileStage	10	int
137	sourceSubmissionFileId	\N	string
137	submissionFileId	18	int
137	fileId	18	int
137	submissionId	18	int
137	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
137	username	vwilliamson	string
138	fileStage	10	int
138	submissionFileId	18	int
138	fileId	18	int
138	submissionId	18	int
138	username	vwilliamson	string
138	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
139	fileStage	10	int
139	sourceSubmissionFileId	\N	string
139	submissionFileId	18	int
139	fileId	18	int
139	submissionId	18	int
139	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
139	username	vwilliamson	string
140	fileStage	10	int
140	sourceSubmissionFileId	\N	string
140	submissionFileId	18	int
140	fileId	18	int
140	submissionId	18	int
140	username	vwilliamson	string
140	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
140	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
145	fileStage	10	int
145	sourceSubmissionFileId	\N	string
145	submissionFileId	19	int
145	fileId	19	int
145	submissionId	19	int
145	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
145	username	zwoods	string
146	fileStage	10	int
146	submissionFileId	19	int
146	fileId	19	int
146	submissionId	19	int
146	username	zwoods	string
146	name	Finocchiaro: Arguments About Arguments.pdf	string
147	fileStage	10	int
147	sourceSubmissionFileId	\N	string
147	submissionFileId	19	int
147	fileId	19	int
147	submissionId	19	int
147	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
147	username	zwoods	string
148	fileStage	10	int
148	sourceSubmissionFileId	\N	string
148	submissionFileId	19	int
148	fileId	19	int
148	submissionId	19	int
148	username	zwoods	string
148	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
148	name	Finocchiaro: Arguments About Arguments.pdf	string
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	journals/1/articles/1/61b3c97807515.pdf	application/pdf
2	journals/1/articles/2/61b3c9902a36b.pdf	application/pdf
3	journals/1/articles/3/61b3c9af5fd42.pdf	application/pdf
4	journals/1/articles/4/61b3c9d4ef23e.pdf	application/pdf
5	journals/1/articles/5/61b3c9f2c4cd7.pdf	application/pdf
6	journals/1/articles/6/61b3ca122379b.pdf	application/pdf
7	journals/1/articles/7/61b3ca30ade87.pdf	application/pdf
8	journals/1/articles/8/61b3ca539c8e9.pdf	application/pdf
9	journals/1/articles/9/61b3ca70c6652.pdf	application/pdf
10	journals/1/articles/10/61b3ca8fe32a0.pdf	application/pdf
11	journals/1/articles/11/61b3caaec58c6.pdf	application/pdf
12	journals/1/articles/12/61b3cad21ccdd.pdf	application/pdf
13	journals/1/articles/13/61b3caf106a02.pdf	application/pdf
14	journals/1/articles/14/61b3cb11db130.pdf	application/pdf
15	journals/1/articles/15/61b3cb30e1581.pdf	application/pdf
16	journals/1/articles/16/61b3cb4fcc47a.pdf	application/pdf
17	journals/1/articles/17/61b3cb711dc53.pdf	application/pdf
18	journals/1/articles/18/61b3cb921a043.pdf	application/pdf
19	journals/1/articles/19/61b3cbb120003.pdf	application/pdf
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
197		contents	There was a problem sending an email message. Please try again later, or contact your system administrator.	string
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
54	1	0	3	16777222	2021-12-10 21:43:52	\N	1048585	6
3	1	0	3	16777222	2021-12-10 21:41:19	\N	1048585	1
4	1	0	3	16777223	2021-12-10 21:41:19	\N	1048585	1
5	1	5	2	16777217	2021-12-10 21:41:19	\N	1048585	1
7	1	4	2	16777217	2021-12-10 21:41:19	\N	1048585	1
9	1	0	2	16777243	2021-12-10 21:41:19	\N	1048585	1
10	1	0	2	16777245	2021-12-10 21:41:19	\N	1048585	1
197	0	3	1	3	2021-12-10 21:50:55	\N	0	0
55	1	0	3	16777223	2021-12-10 21:43:52	\N	1048585	6
56	1	5	2	16777217	2021-12-10 21:43:52	\N	1048585	6
12	1	0	3	16777222	2021-12-10 21:41:44	\N	1048585	2
13	1	0	3	16777223	2021-12-10 21:41:44	\N	1048585	2
14	1	5	2	16777217	2021-12-10 21:41:44	\N	1048585	2
16	1	4	2	16777217	2021-12-10 21:41:44	\N	1048585	2
18	1	0	2	16777243	2021-12-10 21:41:44	\N	1048585	2
19	1	0	2	16777245	2021-12-10 21:41:44	\N	1048585	2
58	1	4	2	16777217	2021-12-10 21:43:52	\N	1048585	6
60	1	0	2	16777243	2021-12-10 21:43:53	\N	1048585	6
61	1	0	2	16777245	2021-12-10 21:43:53	\N	1048585	6
23	1	0	3	16777222	2021-12-10 21:42:20	\N	1048585	3
24	1	0	3	16777223	2021-12-10 21:42:20	\N	1048585	3
25	1	5	2	16777217	2021-12-10 21:42:20	\N	1048585	3
27	1	4	2	16777217	2021-12-10 21:42:20	\N	1048585	3
29	1	0	2	16777243	2021-12-10 21:42:20	\N	1048585	3
30	1	0	2	16777245	2021-12-10 21:42:20	\N	1048585	3
98	1	5	2	16777217	2021-12-10 21:45:59	\N	1048585	10
100	1	4	2	16777217	2021-12-10 21:45:59	\N	1048585	10
34	1	0	3	16777222	2021-12-10 21:42:51	\N	1048585	4
35	1	0	3	16777223	2021-12-10 21:42:51	\N	1048585	4
36	1	5	2	16777217	2021-12-10 21:42:51	\N	1048585	4
38	1	4	2	16777217	2021-12-10 21:42:51	\N	1048585	4
40	1	0	2	16777243	2021-12-10 21:42:51	\N	1048585	4
41	1	0	2	16777245	2021-12-10 21:42:51	\N	1048585	4
65	1	0	3	16777222	2021-12-10 21:44:27	\N	1048585	7
44	1	0	3	16777222	2021-12-10 21:43:23	\N	1048585	5
45	1	0	3	16777223	2021-12-10 21:43:23	\N	1048585	5
46	1	5	2	16777217	2021-12-10 21:43:23	\N	1048585	5
48	1	4	2	16777217	2021-12-10 21:43:23	\N	1048585	5
50	1	0	2	16777243	2021-12-10 21:43:23	\N	1048585	5
51	1	0	2	16777245	2021-12-10 21:43:23	\N	1048585	5
66	1	0	3	16777223	2021-12-10 21:44:27	\N	1048585	7
67	1	5	2	16777217	2021-12-10 21:44:27	\N	1048585	7
86	1	0	3	16777222	2021-12-10 21:45:28	\N	1048585	9
69	1	4	2	16777217	2021-12-10 21:44:27	\N	1048585	7
71	1	0	2	16777243	2021-12-10 21:44:28	\N	1048585	7
72	1	0	2	16777245	2021-12-10 21:44:28	\N	1048585	7
87	1	0	3	16777223	2021-12-10 21:45:28	\N	1048585	9
88	1	5	2	16777217	2021-12-10 21:45:28	\N	1048585	9
90	1	4	2	16777217	2021-12-10 21:45:28	\N	1048585	9
76	1	0	3	16777222	2021-12-10 21:44:58	\N	1048585	8
77	1	0	3	16777223	2021-12-10 21:44:58	\N	1048585	8
78	1	5	2	16777217	2021-12-10 21:44:58	\N	1048585	8
80	1	4	2	16777217	2021-12-10 21:44:58	\N	1048585	8
82	1	0	2	16777243	2021-12-10 21:44:58	\N	1048585	8
83	1	0	2	16777245	2021-12-10 21:44:58	\N	1048585	8
92	1	0	2	16777243	2021-12-10 21:45:28	\N	1048585	9
93	1	0	2	16777245	2021-12-10 21:45:28	\N	1048585	9
102	1	0	2	16777243	2021-12-10 21:45:59	\N	1048585	10
103	1	0	2	16777245	2021-12-10 21:45:59	\N	1048585	10
108	1	0	3	16777223	2021-12-10 21:46:34	\N	1048585	11
96	1	0	3	16777222	2021-12-10 21:45:59	\N	1048585	10
97	1	0	3	16777223	2021-12-10 21:45:59	\N	1048585	10
109	1	5	2	16777217	2021-12-10 21:46:34	\N	1048585	11
111	1	4	2	16777217	2021-12-10 21:46:34	\N	1048585	11
107	1	0	3	16777222	2021-12-10 21:46:34	\N	1048585	11
113	1	0	2	16777243	2021-12-10 21:46:34	\N	1048585	11
114	1	0	2	16777245	2021-12-10 21:46:34	\N	1048585	11
118	1	0	3	16777222	2021-12-10 21:47:06	\N	1048585	12
119	1	0	3	16777223	2021-12-10 21:47:06	\N	1048585	12
120	1	5	2	16777217	2021-12-10 21:47:06	\N	1048585	12
124	1	0	2	16777243	2021-12-10 21:47:06	\N	1048585	12
122	1	4	2	16777217	2021-12-10 21:47:06	\N	1048585	12
125	1	0	2	16777245	2021-12-10 21:47:06	\N	1048585	12
128	1	0	3	16777222	2021-12-10 21:47:38	\N	1048585	13
129	1	0	3	16777223	2021-12-10 21:47:38	\N	1048585	13
130	1	5	2	16777217	2021-12-10 21:47:38	\N	1048585	13
132	1	4	2	16777217	2021-12-10 21:47:38	\N	1048585	13
134	1	0	2	16777243	2021-12-10 21:47:38	\N	1048585	13
135	1	0	2	16777245	2021-12-10 21:47:38	\N	1048585	13
148	1	0	3	16777222	2021-12-10 21:48:39	\N	1048585	15
149	1	0	3	16777223	2021-12-10 21:48:39	\N	1048585	15
138	1	0	3	16777222	2021-12-10 21:48:09	\N	1048585	14
139	1	0	3	16777223	2021-12-10 21:48:09	\N	1048585	14
140	1	5	2	16777217	2021-12-10 21:48:09	\N	1048585	14
150	1	5	2	16777217	2021-12-10 21:48:39	\N	1048585	15
142	1	4	2	16777217	2021-12-10 21:48:09	\N	1048585	14
144	1	0	2	16777243	2021-12-10 21:48:09	\N	1048585	14
145	1	0	2	16777245	2021-12-10 21:48:09	\N	1048585	14
152	1	4	2	16777217	2021-12-10 21:48:39	\N	1048585	15
154	1	0	2	16777243	2021-12-10 21:48:40	\N	1048585	15
155	1	0	2	16777245	2021-12-10 21:48:40	\N	1048585	15
158	1	0	3	16777222	2021-12-10 21:49:12	\N	1048585	16
159	1	0	3	16777223	2021-12-10 21:49:12	\N	1048585	16
160	1	5	2	16777217	2021-12-10 21:49:12	\N	1048585	16
162	1	4	2	16777217	2021-12-10 21:49:12	\N	1048585	16
164	1	0	2	16777243	2021-12-10 21:49:13	\N	1048585	16
165	1	0	2	16777245	2021-12-10 21:49:13	\N	1048585	16
168	1	0	3	16777222	2021-12-10 21:49:46	\N	1048585	17
169	1	0	3	16777223	2021-12-10 21:49:46	\N	1048585	17
170	1	5	2	16777217	2021-12-10 21:49:46	\N	1048585	17
172	1	4	2	16777217	2021-12-10 21:49:46	\N	1048585	17
174	1	0	2	16777243	2021-12-10 21:49:46	\N	1048585	17
175	1	0	2	16777245	2021-12-10 21:49:46	\N	1048585	17
178	1	0	3	16777222	2021-12-10 21:50:17	\N	1048585	18
179	1	0	3	16777223	2021-12-10 21:50:17	\N	1048585	18
180	1	5	2	16777217	2021-12-10 21:50:17	\N	1048585	18
182	1	4	2	16777217	2021-12-10 21:50:17	\N	1048585	18
184	1	0	2	16777243	2021-12-10 21:50:17	\N	1048585	18
185	1	0	2	16777245	2021-12-10 21:50:17	\N	1048585	18
188	1	0	3	16777222	2021-12-10 21:50:47	\N	1048585	19
189	1	0	3	16777223	2021-12-10 21:50:47	\N	1048585	19
190	1	5	2	16777217	2021-12-10 21:50:47	\N	1048585	19
192	1	4	2	16777217	2021-12-10 21:50:48	\N	1048585	19
194	1	0	2	16777243	2021-12-10 21:50:48	\N	1048585	19
195	1	0	2	16777245	2021-12-10 21:50:48	\N	1048585	19
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 197, true);


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	["city","region"]	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
defaultthemeplugin	0	enabled	1	bool
acronplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
tinymceplugin	0	enabled	1	bool
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
acronplugin	0	crontab	[{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"lib.pkp.classes.task.StatisticsReport","frequency":{"day":"1"},"args":[]}]	object
defaultthemeplugin	1	enabled	1	bool
tinymceplugin	1	enabled	1	bool
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
googlescholarplugin	1	enabled	1	bool
pdfjsviewerplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	61b3c8f825924	string
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
1		categoryIds	[]
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The influence of lactation on the quantity and quality of cashmere production
1	fr_CA	title	
3	fr_CA	abstract	
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
2	fr_CA	abstract	
2		categoryIds	[]
2	en_US	copyrightHolder	Public Knowledge Preprint Server
2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
2		copyrightYear	2021
2	en_US	prefix	
2	fr_CA	prefix	
2	en_US	subtitle	
2	fr_CA	subtitle	
2	en_US	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
2	fr_CA	title	
9	fr_CA	title	
3		categoryIds	[]
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
3	fr_CA	title	
9	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
9	fr_CA	abstract	
9		categoryIds	[]
9	en_US	copyrightHolder	Public Knowledge Preprint Server
9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9		copyrightYear	2021
9	en_US	prefix	
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
3	en_US	copyrightHolder	Public Knowledge Preprint Server
3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
3		copyrightYear	2021
6	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
4	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
4	fr_CA	abstract	
4		categoryIds	[]
4	en_US	copyrightHolder	Public Knowledge Preprint Server
4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
4		copyrightYear	2021
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	Genetic transformation of forest trees
4	fr_CA	title	
6	fr_CA	abstract	
5	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	copyrightHolder	Public Knowledge Preprint Server
5	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
5		copyrightYear	2021
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
5	fr_CA	title	
7	fr_CA	prefix	
6		categoryIds	[]
6	en_US	copyrightHolder	Public Knowledge Preprint Server
6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
6		copyrightYear	2021
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	Developing efficacy beliefs in the classroom
6	fr_CA	title	
7	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>
7	fr_CA	abstract	
7		categoryIds	[]
7	en_US	copyrightHolder	Public Knowledge Preprint Server
7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
7		copyrightYear	2021
7	en_US	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Traditions and Trends in the Study of the Commons
7	fr_CA	title	
8	en_US	prefix	
8	en_US	abstract	<p>None.</p>
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	copyrightHolder	Public Knowledge Preprint Server
8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
8		copyrightYear	2021
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Hansen & Pinto: Reason Reclaimed
8	fr_CA	title	
10	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
10	fr_CA	abstract	
10		categoryIds	[]
10	en_US	copyrightHolder	Public Knowledge Preprint Server
10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10		copyrightYear	2021
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
10	fr_CA	title	
16	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
11	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	copyrightHolder	Public Knowledge Preprint Server
11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
11		copyrightYear	2021
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Learning Sustainable Design through Service
11	fr_CA	title	
16	fr_CA	title	
12		categoryIds	[]
12	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
12	fr_CA	abstract	
12	en_US	copyrightHolder	Public Knowledge Preprint Server
12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12		copyrightYear	2021
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
12	fr_CA	title	
13	fr_CA	abstract	
13		categoryIds	[]
13	fr_CA	prefix	
13	en_US	prefix	
13	fr_CA	subtitle	
13	en_US	subtitle	
13	fr_CA	title	
13	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
13	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
13	en_US	copyrightHolder	Public Knowledge Preprint Server
13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
13		copyrightYear	2021
15	fr_CA	abstract	
14	fr_CA	abstract	
14	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
14		categoryIds	[]
14	en_US	copyrightHolder	Public Knowledge Preprint Server
14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
14		copyrightYear	2021
14	fr_CA	prefix	
14	en_US	prefix	
14	fr_CA	subtitle	
14	en_US	subtitle	
14	fr_CA	title	
14	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
15	en_US	subtitle	
15	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
15		categoryIds	[]
15	en_US	copyrightHolder	Public Knowledge Preprint Server
15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15		copyrightYear	2021
15	fr_CA	prefix	
15	en_US	prefix	
15	fr_CA	subtitle	
15	fr_CA	title	
15	en_US	title	Yam diseases and its management in Nigeria
16	fr_CA	abstract	
16		categoryIds	[]
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
16	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>
16	en_US	copyrightHolder	Public Knowledge Preprint Server
16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16		copyrightYear	2021
18	fr_CA	abstract	
17	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
17	fr_CA	abstract	
17		categoryIds	[]
17	en_US	copyrightHolder	Public Knowledge Preprint Server
17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
17		copyrightYear	2021
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
17	fr_CA	title	
18	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
18		categoryIds	[]
18	en_US	copyrightHolder	Public Knowledge Preprint Server
18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
18		copyrightYear	2021
18	en_US	prefix	
18	fr_CA	prefix	
18	en_US	subtitle	
18	fr_CA	subtitle	
18	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments
18	fr_CA	title	
19	fr_CA	abstract	
19	en_US	abstract	<p>None.</p>
19		categoryIds	[]
19	en_US	copyrightHolder	Public Knowledge Preprint Server
19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
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
19	0	2021-12-10	2021-12-10 21:50:54	\N	22	1	19	3	\N	1
1	0	\N	2021-12-10 21:41:18	\N	1	1	1	1	\N	1
2	0	2021-12-10	2021-12-10 21:41:50	\N	2	1	2	3	\N	1
3	0	2021-12-10	2021-12-10 21:42:27	\N	3	1	3	3	\N	1
4	0	2021-12-10	2021-12-10 21:42:58	\N	5	1	4	3	\N	1
5	0	2021-12-10	2021-12-10 21:43:29	\N	6	1	5	3	\N	1
6	0	2021-12-10	2021-12-10 21:44:00	\N	7	1	6	3	\N	1
7	0	2021-12-10	2021-12-10 21:44:34	\N	8	1	7	3	\N	1
8	0	2021-12-10	2021-12-10 21:45:03	\N	10	1	8	3	\N	1
9	0	2021-12-10	2021-12-10 21:45:34	\N	11	1	9	3	\N	1
10	0	2021-12-10	2021-12-10 21:46:05	\N	12	1	10	3	\N	1
11	0	2021-12-10	2021-12-10 21:46:40	\N	13	1	11	3	\N	1
12	0	2021-12-10	2021-12-10 21:47:12	\N	15	1	12	3	\N	1
13	0	2021-12-10	2021-12-10 21:47:44	\N	16	1	13	3	\N	1
14	0	2021-12-10	2021-12-10 21:48:16	\N	17	1	14	3	\N	1
15	0	2021-12-10	2021-12-10 21:48:47	\N	18	1	15	3	\N	1
16	0	2021-12-10	2021-12-10 21:49:20	\N	19	1	16	3	\N	1
17	0	2021-12-10	2021-12-10 21:49:52	\N	20	1	17	3	\N	1
18	0	2021-12-10	2021-12-10 21:50:24	\N	21	1	18	3	\N	1
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
plugins.generic.usageStats.UsageStatsLoader	2021-12-10 21:38:52
lib.pkp.classes.task.StatisticsReport	2021-12-10 21:38:52
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
rrau69i6kt77pdbra9kfti1rpc	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172329	1639172329	0		localhost
cdqu8m09mnua6pqmi3q9jtr72v	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172705	1639172735	0	csrf|a:2:{s:9:"timestamp";i:1639172736;s:5:"token";s:32:"b3bbc1045619312449c15b0b14acfb9c";}username|s:7:"dbarnes";userId|i:3;	localhost
525hgi5441psl8ifou8arjcmtr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172610	1639172639	0	csrf|a:2:{s:9:"timestamp";i:1639172640;s:5:"token";s:32:"5de70251a2fd4a87a63427ae896bdb24";}username|s:7:"dbarnes";userId|i:3;	localhost
bvardbr9ne4sbedg91csc9fmpn	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172358	1639172364	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1639172364;s:5:"token";s:32:"288e7ec3d17d89d0e8f289f39c46ca50";}	localhost
59rim5cubu1432nelj4jblrt31	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172343	1639172358	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1639172358;s:5:"token";s:32:"5a69a7956480ae62805da5483b1e4b5e";}	localhost
o4ctp2nmcnmrd31p82scngd9pb	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172364	1639172372	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1639172372;s:5:"token";s:32:"65cd789cb47166d268413df63f78f461";}	localhost
ufgrprfdu1qg6vkar3u8ntvug1	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172331	1639172342	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1639172343;s:5:"token";s:32:"523243f5b64350da043b1e89d21655a6";}	localhost
0urrtgjkdtqiolkpk47fdvs5v6	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172737	1639172766	0	csrf|a:2:{s:9:"timestamp";i:1639172766;s:5:"token";s:32:"6e8ed5896d4e183f61c89e3f051ca3b1";}username|s:7:"dbarnes";userId|i:3;	localhost
fh86b1tj8ujt5jqbj85unnu2up	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172481	1639172510	0	csrf|a:2:{s:9:"timestamp";i:1639172510;s:5:"token";s:32:"da68ad92e487ae4da1dd75ffab91c861";}username|s:7:"dbarnes";userId|i:3;	localhost
4hlo0m732d0itc9glf8e4gh89e	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172427	1639172433	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1639172432;s:5:"token";s:32:"1dac24120335b757ea95b31823037a79";}	localhost
glka2jb806a8koo2vvolvefoj3	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172767	1639172800	0	csrf|a:2:{s:9:"timestamp";i:1639172800;s:5:"token";s:32:"614a14bf2654ff51cd50e80b93df6167";}username|s:7:"dbarnes";userId|i:3;	localhost
2llt6nq20uk4hhuvdmd9v3p9n2	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172374	1639172425	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1639172425;s:5:"token";s:32:"c91be43eb07e43c3ded249f100458850";}	localhost
l2a72jifh4kpk6e4kavt0haiuv	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172802	1639172831	0	csrf|a:2:{s:9:"timestamp";i:1639172832;s:5:"token";s:32:"22902f8336de113a655a989cc5d38575";}username|s:7:"dbarnes";userId|i:3;	localhost
7er1uk6ni2th472rhc4q9hel3q	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172457	1639172479	0	csrf|a:2:{s:9:"timestamp";i:1639172479;s:5:"token";s:32:"e4f455ffedda49b0b8e73cacab3ab2a6";}username|s:7:"ccorino";userId|i:7;	localhost
ampij64v6853odle2se05rr1bn	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172433	1639172455	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1639172455;s:5:"token";s:32:"0095dddabce54e478d7b38c6765aab39";}	localhost
elmtl2uq1qq41r95jsg6nibfk3	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172833	1639172864	0	csrf|a:2:{s:9:"timestamp";i:1639172864;s:5:"token";s:32:"da1a276d0226550088baa2b261aab922";}username|s:7:"dbarnes";userId|i:3;	localhost
lqo1nov4bl6c2ogmn8km0f3avg	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172512	1639172549	0	csrf|a:2:{s:9:"timestamp";i:1639172549;s:5:"token";s:32:"a657a3946e4bc339e4f7ce1cb1cb63ab";}username|s:7:"dbarnes";userId|i:3;	localhost
ofl6glhot5s2ubs51nkeqa1r4s	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172550	1639172578	0	csrf|a:2:{s:9:"timestamp";i:1639172578;s:5:"token";s:32:"89e7000b7f612c647062cf72bf367eb0";}username|s:7:"dbarnes";userId|i:3;	localhost
31sst696apvq7gcndujvthfgo9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172580	1639172609	0	csrf|a:2:{s:9:"timestamp";i:1639172609;s:5:"token";s:32:"7b901128cca377ef4921299c7f569e24";}username|s:7:"dbarnes";userId|i:3;	localhost
jeuq1iij1s9i80cpfd0g09u2nj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172641	1639172674	0	csrf|a:2:{s:9:"timestamp";i:1639172674;s:5:"token";s:32:"0173b046328f4412605b4661acc2884a";}username|s:7:"dbarnes";userId|i:3;	localhost
ia48p0av7nv25fjk14lu6crqdl	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172676	1639172704	0	csrf|a:2:{s:9:"timestamp";i:1639172704;s:5:"token";s:32:"b85c5ba459783109ecc2621baf72051e";}username|s:7:"dbarnes";userId|i:3;	localhost
hhml7b0jpffp8apt6qb6e4595t	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172897	1639172926	0	csrf|a:2:{s:9:"timestamp";i:1639172927;s:5:"token";s:32:"89db325de0ed29a3d93bbab6939585ca";}username|s:7:"dbarnes";userId|i:3;	localhost
cdeqlp14cp1f663n94mi6j1ns2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172928	1639172960	0	csrf|a:2:{s:9:"timestamp";i:1639172960;s:5:"token";s:32:"95003c182bb5e881f996c0858312652c";}username|s:7:"dbarnes";userId|i:3;	localhost
fcbdlniheqhlbcl5l6lokno5l9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172866	1639172895	0	csrf|a:2:{s:9:"timestamp";i:1639172895;s:5:"token";s:32:"97fc9607fddc53d9a121b92065c104a3";}username|s:7:"dbarnes";userId|i:3;	localhost
oeuqceqspecr1sfaigd648nn9m	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172995	1639173024	0	csrf|a:2:{s:9:"timestamp";i:1639173024;s:5:"token";s:32:"59e1c435df28f73b2ea39591ad91269f";}username|s:7:"dbarnes";userId|i:3;	localhost
g78q937mekgtcrct3cq591m6kg	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639173026	1639173054	0	csrf|a:2:{s:9:"timestamp";i:1639173054;s:5:"token";s:32:"e5c8a54ffe906b513053297c77857f24";}username|s:7:"dbarnes";userId|i:3;	localhost
dkpqqlsvh2dbr2bl6v07vavc1u	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36	1639172962	1639172994	0	csrf|a:2:{s:9:"timestamp";i:1639172994;s:5:"token";s:32:"00a8ac35b760f88fd7a0c908d3772287";}username|s:7:"dbarnes";userId|i:3;	localhost
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
1	1	4	7	2021-12-10 21:41:02	0	1
2	1	3	5	2021-12-10 21:41:19	0	1
3	1	3	4	2021-12-10 21:41:19	0	1
4	2	4	8	2021-12-10 21:41:27	0	1
5	2	3	5	2021-12-10 21:41:44	0	1
6	2	3	4	2021-12-10 21:41:44	0	1
7	3	4	9	2021-12-10 21:41:58	0	1
8	3	3	5	2021-12-10 21:42:20	0	1
9	3	3	4	2021-12-10 21:42:20	0	1
10	4	4	10	2021-12-10 21:42:35	0	1
11	4	3	5	2021-12-10 21:42:51	0	1
12	4	3	4	2021-12-10 21:42:51	0	1
13	5	4	11	2021-12-10 21:43:05	0	1
14	5	3	5	2021-12-10 21:43:23	0	1
15	5	3	4	2021-12-10 21:43:23	0	1
16	6	4	12	2021-12-10 21:43:36	0	1
17	6	3	5	2021-12-10 21:43:52	0	1
18	6	3	4	2021-12-10 21:43:52	0	1
19	7	4	13	2021-12-10 21:44:07	0	1
20	7	3	5	2021-12-10 21:44:27	0	1
21	7	3	4	2021-12-10 21:44:27	0	1
22	8	4	14	2021-12-10 21:44:42	0	1
23	8	3	5	2021-12-10 21:44:58	0	1
24	8	3	4	2021-12-10 21:44:58	0	1
25	9	4	15	2021-12-10 21:45:11	0	1
26	9	3	5	2021-12-10 21:45:28	0	1
27	9	3	4	2021-12-10 21:45:28	0	1
28	10	4	16	2021-12-10 21:45:42	0	1
29	10	3	5	2021-12-10 21:45:59	0	1
30	10	3	4	2021-12-10 21:45:59	0	1
31	11	4	17	2021-12-10 21:46:13	0	1
32	11	3	5	2021-12-10 21:46:34	0	1
33	11	3	4	2021-12-10 21:46:34	0	1
34	12	4	18	2021-12-10 21:46:48	0	1
35	12	3	5	2021-12-10 21:47:06	0	1
36	12	3	4	2021-12-10 21:47:06	0	1
37	13	4	19	2021-12-10 21:47:19	0	1
38	13	3	5	2021-12-10 21:47:38	0	1
39	13	3	4	2021-12-10 21:47:38	0	1
40	14	4	20	2021-12-10 21:47:52	0	1
41	14	3	5	2021-12-10 21:48:09	0	1
42	14	3	4	2021-12-10 21:48:09	0	1
43	15	4	21	2021-12-10 21:48:23	0	1
44	15	3	5	2021-12-10 21:48:39	0	1
45	15	3	4	2021-12-10 21:48:39	0	1
46	16	4	22	2021-12-10 21:48:54	0	1
47	16	3	5	2021-12-10 21:49:12	0	1
48	16	3	4	2021-12-10 21:49:12	0	1
49	17	4	23	2021-12-10 21:49:28	0	1
50	17	3	5	2021-12-10 21:49:46	0	1
51	17	3	4	2021-12-10 21:49:46	0	1
52	18	4	24	2021-12-10 21:50:00	0	1
53	18	3	5	2021-12-10 21:50:17	0	1
54	18	3	4	2021-12-10 21:50:17	0	1
55	19	4	25	2021-12-10 21:50:31	0	1
56	19	3	5	2021-12-10 21:50:47	0	1
57	19	3	4	2021-12-10 21:50:47	0	1
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
1	1	1	\N	1	10	\N	\N	\N	2021-12-10 21:41:12	2021-12-10 21:41:14	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2021-12-10 21:41:36	2021-12-10 21:41:38	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2021-12-10 21:42:07	2021-12-10 21:42:09	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2021-12-10 21:42:44	2021-12-10 21:42:47	10	521	4
5	5	5	\N	1	10	\N	\N	\N	2021-12-10 21:43:14	2021-12-10 21:43:17	11	521	5
6	6	6	\N	1	10	\N	\N	\N	2021-12-10 21:43:46	2021-12-10 21:43:48	12	521	6
7	7	7	\N	1	10	\N	\N	\N	2021-12-10 21:44:16	2021-12-10 21:44:19	13	521	7
8	8	8	\N	1	10	\N	\N	\N	2021-12-10 21:44:51	2021-12-10 21:44:54	14	521	8
9	9	9	\N	1	10	\N	\N	\N	2021-12-10 21:45:20	2021-12-10 21:45:23	15	521	9
10	10	10	\N	1	10	\N	\N	\N	2021-12-10 21:45:51	2021-12-10 21:45:54	16	521	10
11	11	11	\N	1	10	\N	\N	\N	2021-12-10 21:46:22	2021-12-10 21:46:25	17	521	11
12	12	12	\N	1	10	\N	\N	\N	2021-12-10 21:46:58	2021-12-10 21:47:00	18	521	12
13	13	13	\N	1	10	\N	\N	\N	2021-12-10 21:47:29	2021-12-10 21:47:31	19	521	13
14	14	14	\N	1	10	\N	\N	\N	2021-12-10 21:48:01	2021-12-10 21:48:04	20	521	14
15	15	15	\N	1	10	\N	\N	\N	2021-12-10 21:48:32	2021-12-10 21:48:35	21	521	15
16	16	16	\N	1	10	\N	\N	\N	2021-12-10 21:49:03	2021-12-10 21:49:06	22	521	16
17	17	17	\N	1	10	\N	\N	\N	2021-12-10 21:49:37	2021-12-10 21:49:39	23	521	17
18	18	18	\N	1	10	\N	\N	\N	2021-12-10 21:50:10	2021-12-10 21:50:12	24	521	18
19	19	19	\N	1	10	\N	\N	\N	2021-12-10 21:50:41	2021-12-10 21:50:43	25	521	19
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
138	integrating
139	diaga
140	diouf
141	alexandria
142	genetic
143	transformation
144	forest
145	trees
146	review
147	recent
148	progress
149	discussed
150	applications
151	engineering
152	improving
153	understanding
154	mechanisms
155	governing
156	genes
157	expression
158	woody
159	plants
160	dana
161	phillips
162	toronto
163	investigating
164	shared
165	background
166	argument
167	critique
168	fogelins
169	thesis
170	deep
171	disagreement
172	robert
173	fogelin
174	claims
175	interlocutors
176	share
177	framework
178	beliefs
179	commitments
180	order
181	fruitfully
182	pursue
183	refute
184	fogelin’s
185	claim
186	productive
187	find
188	consists
189	common
190	topic
191	hand
192	pro-cedural
193	competencies
194	supporters
195	mistakenly
196	view
197	part
198	procedural
199	com-mitments
200	difficult
201	uphold
202	people’s
203	diverge
204	widely
205	domatilia
206	sokoloff
207	college
208	cork
209	developing
210	efficacy
211	equip
212	children
213	knowledge
214	self-belief
215	confident
216	informed
217	citizens
218	continue
219	learners
220	graduation
221	key
222	role
223	nurturing
224	learn
225	participate
226	society
227	conducted
228	social
229	studies
230	presented
231	showing
232	strategy
233	instruction
234	enhance
235	self-efficacy
236	creative
237	problem
238	solving
239	cps
240	taught
241	means
242	motivate
243	shown
244	positive
245	effects
246	valuable
247	involve
248	decision-making
249	leads
250	action
251	enhancing
252	motivation
253	citizenship
254	elinor
255	ostrom
256	indiana
257	frank
258	van
259	laerhoven
260	traditions
261	trends
262	commons
263	expe-
264	rienced
265	substantial
266	growth
267	past
268	decades1
269	distinguished
270	scholars
271	disciplines
272	long
273	studied
274	specific
275	resources
276	managed
277	mismanaged
278	times
279	places
280	coward
281	los
282	reyes
283	mackenzie
284	wittfogel
285	researchers
286	mid-1980s
287	contemporary
288	colleagues
289	work
290	sec-
291	tors
292	region
293	interest
294	regions
295	world
296	pool
297	resource
298	property
299	intellectual
300	developments
301	fabio
302	paglieri
303	rome
304	hansen
305	pinto
306	reason
307	reclaimed
308	john
309	mwandenga
310	cape
311	town
312	signalling
313	theory
314	dividends
315	literature
316	empirical
317	evidence
318	signaling
319	suggests
320	signal
321	future
322	prospects
323	firm
324	offer
325	conclusive
326	conflicting
327	financial
328	economists
329	practical
330	dividend
331	guidance
332	management
333	potential
334	investors
335	shareholding
336	corporate
337	investment
338	financing
339	distribution
340	decisions
341	continuous
342	function
343	rely
344	intuitive
345	evaluation
346	novak
347	aalborg
348	condensing
349	water
350	availability
351	models
352	focus
353	systems
354	texas
355	modeling
356	system
357	routinely
358	applied
359	administration
360	rights
361	permit
362	regional
363	statewide
364	planning
365	expanding
366	variety
367	endeavors
368	river
369	basins
370	state
371	reflects
372	permits
373	reservoirs
374	datasets
375	necessarily
376	large
377	complex
378	provide
379	decision-support
380	capabilities
381	developed
382	features
383	added
384	types
385	growing
386	enhanced
387	simplifying
388	simulation
389	input
390	methodology
391	condensed
392	dataset
393	selected
394	reservoir
395	impacts
396	accompanying
397	removed
398	original
399	complete
400	set
401	streamflows
402	represents
403	flows
404	basin
405	contained
406	model
407	included
408	develop
409	brazos
410	authority
411	based
412	modifying
413	karim
414	al-khafaji
415	stanford
416	margaret
417	morse
418	sustainable
419	design
420	service
421	environmental
422	sustainability
423	principles
424	vital
425	topics
426	largely
427	failed
428	address
429	service-learning
430	integrates
431	academic
432	setting
433	emerging
434	tool
435	leveraged
436	teach
437	engineers
438	present
439	experiences
440	chapter
441	involves
442	identification
443	projects
444	partner
445	organizations
446	student
447	led
448	project-based
449	internships
450	coordinated
451	successful
452	limitations
453	challenges
454	exist
455	directions
456	leo
457	christopher
458	australian
459	sodium
460	butyrate
461	improves
462	performance
463	weaned
464	piglets
465	period
466	weaning
467	aim
468	assess
469	influence
470	long-term
471	fat
472	supplementation
473	fatty
474	acid
475	profile
476	heavy
477	pig
478	adipose
479	tissue
480	fifty-four
481	white
482	barrows
483	averaging
484	randomized
485	matched
486	weights
487	isoenergetic
488	diets
489	supplemented
490	tallow
491	maize
492	oil
493	rapeseed
494	fats
495	supplement-
496	fed
497	slaughtering
498	slaughter
499	backfat
500	samples
501	collected
502	ten
503	animals
504	treatment
505	analyzed
506	composition
507	close-
508	reflected
509	pigs
510	highest
511	saturated
512	content
513	sfa
514	polyunsaturated
515	pufa
516	lowest
517	monounsaturated
518	mufa
519	linolenic
520	c18
521	cis
522	11-
523	ecosenoic
524	c20
525	linoleic
526	levels
527	iodine
528	result-
529	ing
530	accepted
531	parma
532	consortium
533	dry-cured
534	ham
535	unsaturation
536	index
537	layers
538	subcutaneous
539	differed
540	significantly
541	treatments
542	show
543	dietary
544	increases
545	proportion
546	“healthy”
547	acids
548	nutritional
549	quality
550	technological
551	carefully
552	assessed
553	food
554	security
555	lise
556	kumiega
557	hydrologic
558	connectivity
559	edwards
560	aquifer
561	san
562	marcos
563	springs
564	barton
565	drought
566	conditions
567	serves
568	primary
569	supply
570	south-central
571	source
572	plan
573	protect
574	endangered
575	species
576	immediately
577	downstream
578	questions
579	raised
580	established
581	concept
582	divide
583	antonio
584	segments
585	water-level
586	collection
587	program
588	hydrogeologic
589	groundwater-level
590	groundwater
591	exists
592	vicinity
593	surface
594	drainage
595	onion
596	creek
597	blanco
598	wet
599	normal
600	dissipated
601	longer
602	hydrologically
603	separated
604	result
605	flow
606	droughts
607	bearings
608	assessments
609	simulations
610	numerical
611	cfs
612	flowing
613	appears
614	influenced
615	recharge
616	vulnerable
617	extended
618	periods
619	extensive
620	pumping
621	kyle
622	buda
623	shows
624	low
625	gradient
626	potentiometric
627	variation
628	non-drought
629	slopes
630	north
631	dramatic
632	discontinuity
633	change
634	gradients
635	dynamic
636	unknown
637	structural
638	influences
639	hydraulic
640	properties
641	inherent
642	connection
643	rapid
644	population
645	increased
646	demands
647	areas
648	necessitates
649	continual
650	monitoring
651	trend
652	analyses
653	patricia
654	daniel
655	wolverhampton
656	designing
657	intercultural
658	case
659	atlantic
660	coast
661	nicaragua
662	met
663	21st
664	century
665	genuinely
666	embracing
667	diversity
668	overcome
669	barriers
670	people
671	basis
672	language
673	gender
674	takes
675	multilingual
676	multiethnic
677	examines
678	community
679	uraccan
680	contributing
681	interculturality
682	describes
683	participatory
684	carried
685	staff
686	intention
687	defining
688	delivering
689	discussions
690	wales
691	council
692	emphasises
693	belonging
694	individual
695	communities
696	cultures
697	time
698	supporting
699	include
700	university’s
701	close
702	involvement
703	ethnic
704	ethno-linguistic
705	power
706	relations
707	country
708	militate
709	egalitarianism
710	highlights
711	importance
712	pedagogy
713	promoting
714	achieving
715	lasting
716	rana
717	baiyewu
718	nairobi
719	yam
720	diseases
721	nigeria
722	presents
723	combating
724	menace
725	field
726	storage
727	anthracnose
728	regarded
729	spread
730	mosaic
731	virus
732	disease
733	considered
734	severe
735	losses
736	yams
737	dry
738	rot
739	devastating
740	marked
741	reduction
742	quantity
743	marketable
744	edible
745	portions
746	tubers
747	reductions
748	stored
749	adopted
750	advocated
751	includes
752	crop
753	rotation
754	fallowing
755	planting
756	healthy
757	material
758	destruction
759	infected
760	cultivars
761	resistant
762	tecto
763	thiabendazole
764	locally
765	made
766	gins
767	wood
768	ash
769	found
770	fungal
771	infection
772	finally
773	processing
774	chips
775	cubes
776	shelf
777	live
778	months
779	year
780	rosanna
781	rossi
782	barcelona
783	nutrition
784	general
785	situation
786	cattle
787	slaughtered
788	cameroon
789	representative
790	central
791	african
792	sub-region
793	safety
794	beef
795	abattoir
796	yaoundé
797	largest
798	january
799	march
800	pre-slaughter
801	characteristics
802	carcasses
803	recorded
804	longissimus
805	thoracis
806	represent
807	bulls
808	parameters
809	origin
810	guinea
811	high
812	savannah
813	transhumance
814	production
815	gudali
816	fulani
817	red
818	mbororo
819	breeds
820	predominant
821	carcass
822	weight
823	affected
824	rearing
825	category
826	markedly
827	varied
828	meat
829	similar
830	showed
831	toughest
832	cows
833	pregnant
834	abnormal
835	encountered
836	ectoparasites
837	fatigue
838	lameness
839	fungal-like
840	skin
841	lesions
842	enlarged
843	lymph
844	nodes
845	respiratory
846	distress
847	nodular
848	organs
849	condemned
850	liver
851	flukes
852	completely
853	due
854	tuberculosis
855	lungs
856	aid
857	authorities
858	draw
859	programmes
860	strengthen
861	improve
862	control
863	prevent
864	observed
865	promote
866	trade
867	vajiheh
868	karbasizaed
869	tehran
870	antimicrobial
871	metal
872	resistance
873	plasmid
874	coliforms
875	isolated
876	nosocomial
877	infections
878	hospital
879	isfahan
880	iran
881	patterns
882	profiles
883	enterobacteriacea
884	human
885	faeces
886	fifteen
887	isolates
888	identified
889	escherichia
890	coli
891	remaining
892	kelebsiella
893	pneumoniae
894	seventy
895	percent
896	strains
897	possess
898	multiple
899	antibiotics
900	difference
901	minimal
902	inhibitory
903	concentration
904	mic
905	values
906	clinical
907	cases
908	metals
909	significant
910	tolerant
911	persons
912	relationship
913	group
914	pattern
915	conjugative
916	encoding
917	recovered
918	multidrug-resistance
919	valerie
920	williamson
921	self-organization
922	multi-level
923	institutions
924	networked
925	environments
926	compare
927	actors
928	decide
929	sanction
930	sanctions
931	implemented
932	collectively
933	agree
934	actor
935	sanctioned
936	collective
937	sanctioning
938	problematic
939	difficulty
940	reaching
941	consensus
942	decision
943	perverse
944	punishing
945	contributors
946	ruled
947	goverance
948	zita
949	woods
950	cuny
951	finocchiaro
952	arguments
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 952, true);


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
5	17	0
5	16	1
9	65	0
9	66	1
9	3	2
9	67	3
9	68	4
9	69	5
9	3	6
9	70	7
10	71	0
10	72	1
10	73	2
10	74	3
10	75	4
10	76	5
10	77	6
10	78	7
11	79	0
11	80	1
11	81	2
11	82	3
11	83	4
11	84	5
11	85	6
11	23	7
11	86	8
11	87	9
11	80	10
11	88	11
11	89	12
11	90	13
11	91	14
11	92	15
11	93	16
11	94	17
11	67	18
11	95	19
11	96	20
11	97	21
11	98	22
11	99	23
11	100	24
11	101	25
11	102	26
11	40	27
11	80	28
11	98	29
11	103	30
11	104	31
11	105	32
11	106	33
11	89	34
11	107	35
11	108	36
11	109	37
11	67	38
11	110	39
11	75	40
11	111	41
11	112	42
11	98	43
11	113	44
11	114	45
11	115	46
11	116	47
11	117	48
11	118	49
11	119	50
11	120	51
11	121	52
11	122	53
11	71	54
11	88	55
11	123	56
11	124	57
11	125	58
11	126	59
11	127	60
11	128	61
11	16	62
11	129	63
11	130	64
11	113	65
11	114	66
11	94	67
11	67	68
11	131	69
11	132	70
11	133	71
11	71	72
11	88	73
11	113	74
11	114	75
11	134	76
11	135	77
11	136	78
11	75	79
11	43	80
11	118	81
11	137	82
11	137	83
11	75	84
13	138	0
13	80	1
13	71	2
13	88	3
13	16	4
13	67	5
13	23	6
13	86	7
13	116	8
13	117	9
17	139	0
17	140	1
17	141	2
17	3	3
18	142	0
18	143	1
18	144	2
18	145	3
19	146	0
19	147	1
19	148	2
19	142	3
19	143	4
19	144	5
19	145	6
19	149	7
19	150	8
19	142	9
19	151	10
19	152	11
19	144	12
19	145	13
19	153	14
19	154	15
19	155	16
19	156	17
19	157	18
19	158	19
19	159	20
25	160	0
25	161	1
25	3	2
25	162	3
26	163	0
26	164	1
26	165	2
26	111	3
26	166	4
26	167	5
26	168	6
26	169	7
26	170	8
26	171	9
27	172	0
27	173	1
27	174	2
27	175	3
27	176	4
27	177	5
27	165	6
27	178	7
27	179	8
27	180	9
27	181	10
27	182	11
27	166	12
27	183	13
27	184	14
27	185	15
27	163	16
27	164	17
27	165	18
27	111	19
27	186	20
27	166	21
27	187	22
27	165	23
27	188	24
27	189	25
27	178	26
27	190	27
27	191	28
27	164	29
27	192	30
27	179	31
27	193	32
27	60	33
27	173	34
27	194	35
27	195	36
27	196	37
27	164	38
27	178	39
27	197	40
27	111	41
27	165	42
27	186	43
27	166	44
27	198	45
27	199	46
27	200	47
27	201	48
27	202	49
27	178	50
27	203	51
27	204	52
27	190	53
27	191	54
33	205	0
33	206	1
33	3	2
33	207	3
33	208	4
34	209	0
34	210	1
34	178	2
34	81	3
35	82	0
35	124	1
35	84	2
35	211	3
35	212	4
35	213	5
35	88	6
35	214	7
35	215	8
35	216	9
35	217	10
35	217	11
35	218	12
35	219	13
35	220	14
35	125	15
35	221	16
35	222	17
35	223	18
35	210	19
35	178	20
35	180	21
35	224	22
35	225	23
35	113	24
35	226	25
35	59	26
35	54	27
35	227	28
35	228	29
35	229	30
35	62	31
35	230	32
35	231	33
35	232	34
35	233	35
35	234	36
35	235	37
35	110	38
35	197	39
35	59	40
35	236	41
35	237	42
35	238	43
35	239	44
35	240	45
35	212	46
35	241	47
35	242	48
35	43	49
35	110	50
35	243	51
35	239	52
35	244	53
35	245	54
35	235	55
35	110	56
35	246	57
35	177	58
35	247	59
35	212	60
35	248	61
35	249	62
35	228	63
35	250	64
35	76	65
35	251	66
35	235	67
35	252	68
35	224	69
35	81	70
35	149	71
37	84	0
37	253	1
41	254	0
41	255	1
41	256	2
41	3	3
41	257	4
41	258	5
41	259	6
41	256	7
41	3	8
42	260	0
42	261	1
42	10	2
42	262	3
43	10	0
43	262	1
43	263	2
43	264	3
43	265	4
43	266	5
43	117	6
43	267	7
43	268	8
43	269	9
43	270	10
43	271	11
43	272	12
43	273	13
43	274	14
43	275	15
43	276	16
43	277	17
43	278	18
43	279	19
43	280	20
43	281	21
43	282	22
43	283	23
43	284	24
43	285	25
43	273	26
43	274	27
43	262	28
43	286	29
43	287	30
43	288	31
43	216	32
43	289	33
43	270	34
43	271	35
43	290	36
43	291	37
43	292	38
43	293	39
43	294	40
43	295	41
45	189	0
45	296	1
45	297	2
45	189	3
45	298	4
45	299	5
45	300	6
49	301	0
49	302	1
49	3	2
49	303	3
50	304	0
50	305	1
50	306	2
50	307	3
57	308	0
57	309	1
57	3	2
57	310	3
57	311	4
58	312	0
58	313	1
58	314	2
58	146	3
58	315	4
58	316	5
58	317	6
59	318	0
59	313	1
59	319	2
59	314	3
59	320	4
59	321	5
59	322	6
59	323	7
59	147	8
59	316	9
59	317	10
59	324	11
59	325	12
59	317	13
59	83	14
59	326	15
59	77	16
59	76	17
59	327	18
59	328	19
59	329	20
59	330	21
59	77	22
59	331	23
59	332	24
59	74	25
59	333	26
59	334	27
59	335	28
59	336	29
59	337	30
59	338	31
59	339	32
59	340	33
59	341	34
59	342	35
59	332	36
59	330	37
59	340	38
59	343	39
59	344	40
59	345	41
65	308	0
65	346	1
65	347	2
65	3	3
66	348	0
66	349	1
66	350	2
66	351	3
66	352	4
66	274	5
66	349	6
66	332	7
66	353	8
67	354	0
67	349	1
67	350	2
67	355	3
67	356	4
67	357	5
67	358	6
67	359	7
67	349	8
67	360	9
67	361	10
67	356	11
67	362	12
67	363	13
67	364	14
67	365	15
67	366	16
67	367	17
67	355	18
67	349	19
67	332	20
67	368	21
67	369	22
67	370	23
67	371	24
67	349	25
67	372	26
67	373	27
67	374	28
67	375	29
67	376	30
67	377	31
67	378	32
67	379	33
67	380	34
67	355	35
67	356	36
67	381	37
67	355	38
67	382	39
67	383	40
67	384	41
67	150	42
67	385	43
67	150	44
67	386	45
67	387	46
67	388	47
67	389	48
67	374	49
67	352	50
67	349	51
67	332	52
67	353	53
67	390	54
67	230	55
67	209	56
67	391	57
67	392	58
67	393	59
67	394	60
67	356	61
67	371	62
67	395	63
67	349	64
67	360	65
67	396	66
67	373	67
67	397	68
67	398	69
67	399	70
67	392	71
67	400	72
67	401	73
67	381	74
67	402	75
67	403	76
67	393	77
67	356	78
67	245	79
67	349	80
67	360	81
67	368	82
67	404	83
67	405	84
67	398	85
67	399	86
67	406	87
67	389	88
67	392	89
67	407	90
67	391	91
67	392	92
67	390	93
67	358	94
67	408	95
67	391	96
67	406	97
67	409	98
67	368	99
67	410	100
67	394	101
67	356	102
67	411	103
67	412	104
67	354	105
67	349	106
67	350	107
67	355	108
67	356	109
67	392	110
67	409	111
67	368	112
67	404	113
69	349	0
73	413	0
73	414	1
73	415	2
73	3	3
73	416	4
73	417	5
73	415	6
73	3	7
74	110	0
74	418	1
74	419	2
74	420	3
75	421	0
75	422	1
75	418	2
75	117	3
75	423	4
75	424	5
75	425	6
75	151	7
75	84	8
75	426	9
75	427	10
75	428	11
75	429	12
75	430	13
75	228	14
75	420	15
75	431	16
75	432	17
75	433	18
75	434	19
75	435	20
75	436	21
75	418	22
75	419	23
75	321	24
75	437	25
75	438	26
75	406	27
75	429	28
75	436	29
75	418	30
75	419	31
75	411	32
75	439	33
75	415	34
75	440	35
75	437	36
75	418	37
75	295	38
75	406	39
75	441	40
75	442	41
75	443	42
75	444	43
75	445	44
75	446	45
75	447	46
75	448	47
75	419	48
75	449	49
75	450	50
75	444	51
75	445	52
75	406	53
75	451	54
75	452	55
75	453	56
75	454	57
75	149	58
75	321	59
75	455	60
75	365	61
75	406	62
77	117	0
77	151	1
77	84	2
77	420	3
77	110	4
77	422	5
81	456	0
81	457	1
81	458	2
81	23	3
81	3	4
82	459	0
82	460	1
82	461	2
82	266	3
82	462	4
82	463	5
82	464	6
82	465	7
82	466	8
83	467	0
83	10	1
83	468	2
83	469	3
83	470	4
83	471	5
83	472	6
83	473	7
83	474	8
83	475	9
83	476	10
83	477	11
83	478	12
83	479	13
83	480	14
83	376	15
83	481	16
83	482	17
83	483	18
83	484	19
83	485	20
83	486	21
83	487	22
83	488	23
83	489	24
83	490	25
83	491	26
83	492	27
83	493	28
83	492	29
83	494	30
83	495	31
83	496	32
83	497	33
83	498	34
83	499	35
83	500	36
83	501	37
83	502	38
83	503	39
83	504	40
83	505	41
83	473	42
83	474	43
83	506	44
83	499	45
83	507	46
83	508	47
83	473	48
83	474	49
83	506	50
83	489	51
83	494	52
83	499	53
83	509	54
83	496	55
83	510	56
83	511	57
83	473	58
83	474	59
83	512	60
83	513	61
83	496	62
83	510	63
83	512	64
83	514	65
83	473	66
83	474	67
83	515	68
83	516	69
83	517	70
83	473	71
83	474	72
83	518	73
83	512	74
83	496	75
83	510	76
83	512	77
83	519	78
83	474	79
83	520	80
83	521	81
83	522	82
83	523	83
83	474	84
83	524	85
83	504	86
83	64	87
83	525	88
83	474	89
83	526	90
83	527	91
83	499	92
83	528	93
83	529	94
83	526	95
83	58	96
83	520	97
83	530	98
83	531	99
83	532	100
83	533	101
83	534	102
83	535	103
83	536	104
83	537	105
83	538	106
83	499	107
83	479	108
83	539	109
83	540	110
83	541	111
83	127	112
83	542	113
83	470	114
83	543	115
83	472	116
83	494	117
83	473	118
83	474	119
83	475	120
83	476	121
83	477	122
83	478	123
83	479	124
83	472	125
83	493	126
83	492	127
83	544	128
83	545	129
83	546	130
83	473	131
83	547	132
83	477	133
83	471	134
83	152	135
83	548	136
83	549	137
83	245	138
83	550	139
83	549	140
83	471	141
83	551	142
83	552	143
85	509	0
85	553	1
85	554	2
89	555	0
89	556	1
89	3	2
89	310	3
89	311	4
90	557	0
90	558	1
90	559	2
90	560	3
90	561	4
90	562	5
90	563	6
90	564	7
90	563	8
90	565	9
90	566	10
91	559	0
91	560	1
91	567	2
91	568	3
91	349	4
91	569	5
91	570	6
91	354	7
91	571	8
91	82	9
91	563	10
91	209	11
91	572	12
91	573	13
91	574	14
91	575	15
91	576	16
91	577	17
91	561	18
91	562	19
91	563	20
91	578	21
91	579	22
91	580	23
91	581	24
91	557	25
91	582	26
91	561	27
91	583	28
91	564	29
91	563	30
91	584	31
91	559	32
91	560	33
91	565	34
91	566	35
91	428	36
91	578	37
91	585	38
91	14	39
91	586	40
91	587	41
91	588	42
91	10	43
91	227	44
91	36	45
91	589	46
91	14	47
91	590	48
91	582	49
91	591	50
91	592	51
91	593	52
91	594	53
91	582	54
91	595	55
91	596	56
91	597	57
91	368	58
91	598	59
91	599	60
91	557	61
91	566	62
91	36	63
91	14	64
91	501	65
91	565	66
91	319	67
91	590	68
91	582	69
91	600	70
91	601	71
91	602	72
91	603	73
91	584	74
91	604	75
91	333	76
91	590	77
91	605	78
91	267	79
91	561	80
91	562	81
91	563	82
91	564	83
91	563	84
91	82	85
91	606	86
91	76	87
91	607	88
91	332	89
91	350	90
91	590	91
91	559	92
91	560	93
91	608	94
91	609	95
91	610	96
91	406	97
91	60	98
91	611	99
91	612	100
91	267	101
91	561	102
91	562	103
91	564	104
91	563	105
91	565	106
91	566	107
91	590	108
91	582	109
91	613	110
91	614	111
91	615	112
91	595	113
91	596	114
91	597	115
91	368	116
91	613	117
91	616	118
91	617	119
91	618	120
91	615	121
91	619	122
91	620	123
91	592	124
91	621	125
91	622	126
91	14	127
91	400	128
91	623	129
91	624	130
91	625	131
91	626	132
91	593	133
91	561	134
91	562	135
91	563	136
91	621	137
91	627	138
91	526	139
91	565	140
91	628	141
91	618	142
91	621	143
91	564	144
91	563	145
91	626	146
91	593	147
91	629	148
91	540	149
91	630	150
91	631	151
91	526	152
91	565	153
91	628	154
91	618	155
91	571	156
91	26	157
91	632	158
91	633	159
91	626	160
91	634	161
91	635	162
91	349	163
91	92	164
91	131	165
91	621	166
91	636	167
91	637	168
91	638	169
91	639	170
91	640	171
91	641	172
91	560	173
91	632	174
91	469	175
91	22	176
91	557	177
91	642	178
91	561	179
91	562	180
91	564	181
91	563	182
91	643	183
91	644	184
91	266	185
91	645	186
91	349	187
91	646	188
91	621	189
91	622	190
91	647	191
91	648	192
91	649	193
91	590	194
91	92	195
91	650	196
91	587	197
91	561	198
91	562	199
91	563	200
91	622	201
91	378	202
91	14	203
91	321	204
91	588	205
91	651	206
91	652	207
93	349	0
97	653	0
97	654	1
97	3	2
97	655	3
98	656	0
98	657	1
98	98	2
98	658	3
98	10	4
98	659	5
98	660	6
98	661	7
99	453	0
99	662	1
99	663	2
99	664	3
99	665	4
99	666	5
99	667	6
99	84	7
99	668	8
99	669	9
99	218	10
99	454	11
99	670	12
99	671	13
99	672	14
99	24	15
99	673	16
99	658	17
99	10	18
99	674	19
99	659	20
99	660	21
99	661	22
99	675	23
99	676	24
99	292	25
99	677	26
99	678	27
99	3	28
99	679	29
99	680	30
99	117	31
99	681	32
99	682	33
99	683	34
99	59	35
99	684	36
99	3	37
99	685	38
99	89	39
99	686	40
99	687	41
99	657	42
99	98	43
99	118	44
99	688	45
99	406	46
99	671	47
99	689	48
99	406	49
99	678	50
99	153	51
99	690	52
99	98	53
99	691	54
99	692	55
99	693	56
99	694	57
99	695	58
99	696	59
99	697	60
99	38	61
99	698	62
99	117	63
99	657	64
99	98	65
99	699	66
99	700	67
99	701	68
99	702	69
99	703	70
99	695	71
99	567	72
99	704	73
99	705	74
99	706	75
99	292	76
99	707	77
99	708	78
99	709	79
99	3	80
99	59	81
99	710	82
99	711	83
99	683	84
99	712	85
99	671	86
99	713	87
99	681	88
99	714	89
99	715	90
99	228	91
99	143	92
101	663	0
101	664	1
101	667	2
101	675	3
101	676	4
101	683	5
101	712	6
101	672	7
101	24	8
101	673	9
101	709	10
101	228	11
101	143	12
105	716	0
105	717	1
105	3	2
105	718	3
106	719	0
106	720	1
106	332	2
106	721	3
107	146	0
107	722	1
107	720	2
107	719	3
107	332	4
107	118	5
107	137	6
107	723	7
107	724	8
107	721	9
107	725	10
107	726	11
107	720	12
107	230	13
107	727	14
107	728	15
107	204	16
107	729	17
107	725	18
107	720	19
107	719	20
107	730	21
107	731	22
107	732	23
107	733	24
107	734	25
107	735	26
107	736	27
107	737	28
107	738	29
107	733	30
107	739	31
107	726	32
107	720	33
107	719	34
107	737	35
107	738	36
107	736	37
107	740	38
107	741	39
107	742	40
107	743	41
107	744	42
107	745	43
107	746	44
107	747	45
107	734	46
107	748	47
107	736	48
107	332	49
107	118	50
107	749	51
107	750	52
107	723	53
107	725	54
107	720	55
107	751	56
107	752	57
107	753	58
107	754	59
107	755	60
107	756	61
107	757	62
107	758	63
107	759	64
107	752	65
107	760	66
107	761	67
107	760	68
107	726	69
107	720	70
107	762	71
107	763	72
107	764	73
107	765	74
107	737	75
107	766	76
107	767	77
107	768	78
107	726	79
107	769	80
107	573	81
107	719	82
107	746	83
107	770	84
107	771	85
107	726	86
107	772	87
107	773	88
107	719	89
107	746	90
107	774	91
107	775	92
107	544	93
107	776	94
107	777	95
107	465	96
107	778	97
107	779	98
113	780	0
113	781	1
113	782	2
113	3	3
114	469	0
114	470	1
114	783	2
114	543	3
114	494	4
114	473	5
114	474	6
114	506	7
114	476	8
114	509	9
114	499	10
115	467	0
115	59	1
115	378	2
115	784	3
115	785	4
115	786	5
115	787	6
115	788	7
115	789	8
115	790	9
115	791	10
115	792	11
115	549	12
115	793	13
115	794	14
115	795	15
115	796	16
115	797	17
115	788	18
115	733	19
115	798	20
115	799	21
115	800	22
115	566	23
115	801	24
115	786	25
115	802	26
115	803	27
115	804	28
115	805	29
115	498	30
115	802	31
115	393	32
115	806	33
115	807	34
115	787	35
115	549	36
115	808	37
115	506	38
115	804	39
115	805	40
115	684	41
115	809	42
115	786	43
115	810	44
115	811	45
115	812	46
115	813	47
115	189	48
115	814	49
115	356	50
115	815	51
115	481	52
115	816	53
115	817	54
115	818	55
115	819	56
115	820	57
115	821	58
115	822	59
115	823	60
115	824	61
115	356	62
115	786	63
115	825	64
115	826	65
115	827	66
115	779	67
115	828	68
115	549	69
115	471	70
115	512	71
115	624	72
115	829	73
115	819	74
115	815	75
115	830	76
115	831	77
115	828	78
115	832	79
115	787	80
115	833	81
115	189	82
115	834	83
115	566	84
115	835	85
115	836	86
115	837	87
115	838	88
115	839	89
115	840	90
115	841	91
115	842	92
115	843	93
115	844	94
115	845	95
115	846	96
115	847	97
115	841	98
115	802	99
115	848	100
115	849	101
115	850	102
115	851	103
115	852	104
115	849	105
115	853	106
115	854	107
115	823	108
115	855	109
115	14	110
115	856	111
115	857	112
115	858	113
115	859	114
115	467	115
115	860	116
115	786	117
115	814	118
115	861	119
115	794	120
115	569	121
115	862	122
115	863	123
115	864	124
115	720	125
115	865	126
115	362	127
115	866	128
117	786	0
117	553	1
117	554	2
121	867	0
121	868	1
121	3	2
121	869	3
122	870	0
122	476	1
122	871	2
122	872	3
122	873	4
122	475	5
122	874	6
122	875	7
122	876	8
122	877	9
122	878	10
122	879	11
122	880	12
123	870	0
123	476	1
123	871	2
123	872	3
123	881	4
123	873	5
123	882	6
123	874	7
123	883	8
123	875	9
123	876	10
123	877	11
123	756	12
123	884	13
123	885	14
123	34	15
123	886	16
123	887	17
123	876	18
123	877	19
123	888	20
123	889	21
123	890	22
123	891	23
123	892	24
123	893	25
123	894	26
123	895	27
123	896	28
123	875	29
123	876	30
123	877	31
123	897	32
123	898	33
123	872	34
123	899	35
123	34	36
123	896	37
123	756	38
123	884	39
123	885	40
123	900	41
123	901	42
123	902	43
123	903	44
123	904	45
123	905	46
123	896	47
123	906	48
123	907	49
123	885	50
123	476	51
123	908	52
123	909	53
123	896	54
123	875	55
123	878	56
123	910	57
123	476	58
123	871	59
123	756	60
123	911	61
123	52	62
123	912	63
123	873	64
123	475	65
123	913	66
123	870	67
123	872	68
123	914	69
123	915	70
123	873	71
123	916	72
123	872	73
123	476	74
123	908	75
123	899	76
123	917	77
123	896	78
123	875	79
123	876	80
123	877	81
123	127	82
123	918	83
123	874	84
123	333	85
123	876	86
123	771	87
123	292	88
129	919	0
129	920	1
129	3	2
129	4	3
130	921	0
130	922	1
130	923	2
130	924	3
130	925	4
131	926	0
131	432	1
131	927	2
131	33	3
131	928	4
131	929	5
131	432	6
131	930	7
131	931	8
131	927	9
131	932	10
131	933	11
131	934	12
131	935	13
131	936	14
131	937	15
131	340	16
131	938	17
131	853	18
131	939	19
131	940	20
131	941	21
131	942	22
131	765	23
131	932	24
131	943	25
131	937	26
131	944	27
131	811	28
131	945	29
131	694	30
131	927	31
131	946	32
131	936	33
131	937	34
131	340	35
131	293	36
131	913	37
133	921	0
133	922	1
133	923	2
133	947	3
137	948	0
137	949	1
137	950	2
138	951	0
138	952	1
138	952	2
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
9	3	1	0
10	3	2	0
11	3	4	0
12	3	16	0
13	3	17	0
14	3	8	0
15	3	32	0
16	3	64	0
17	4	1	0
18	4	2	0
19	4	4	0
20	4	16	0
21	4	17	0
22	4	8	0
23	4	32	0
24	4	64	0
25	5	1	0
26	5	2	0
27	5	4	0
28	5	16	0
29	5	17	0
30	5	8	0
31	5	32	0
32	5	64	0
33	6	1	0
34	6	2	0
35	6	4	0
36	6	16	0
37	6	17	0
38	6	8	0
39	6	32	0
40	6	64	0
41	7	1	0
42	7	2	0
43	7	4	0
44	7	16	0
45	7	17	0
46	7	8	0
47	7	32	0
48	7	64	0
49	8	1	0
50	8	2	0
51	8	4	0
52	8	16	0
53	8	17	0
54	8	8	0
55	8	32	0
56	8	64	0
57	9	1	0
58	9	2	0
59	9	4	0
60	9	16	0
61	9	17	0
62	9	8	0
63	9	32	0
64	9	64	0
65	10	1	0
66	10	2	0
67	10	4	0
68	10	16	0
69	10	17	0
70	10	8	0
71	10	32	0
72	10	64	0
73	11	1	0
74	11	2	0
75	11	4	0
76	11	16	0
77	11	17	0
78	11	8	0
79	11	32	0
80	11	64	0
81	12	1	0
82	12	2	0
83	12	4	0
84	12	16	0
85	12	17	0
86	12	8	0
87	12	32	0
88	12	64	0
89	13	1	0
90	13	2	0
91	13	4	0
92	13	16	0
93	13	17	0
94	13	8	0
95	13	32	0
96	13	64	0
97	14	1	0
98	14	2	0
99	14	4	0
100	14	16	0
101	14	17	0
102	14	8	0
103	14	32	0
104	14	64	0
105	15	1	0
106	15	2	0
107	15	4	0
108	15	16	0
109	15	17	0
110	15	8	0
111	15	32	0
112	15	64	0
113	16	1	0
114	16	2	0
115	16	4	0
116	16	16	0
117	16	17	0
118	16	8	0
119	16	32	0
120	16	64	0
121	17	1	0
122	17	2	0
123	17	4	0
124	17	16	0
125	17	17	0
126	17	8	0
127	17	32	0
128	17	64	0
129	18	1	0
130	18	2	0
131	18	4	0
132	18	16	0
133	18	17	0
134	18	8	0
135	18	32	0
136	18	64	0
137	19	1	0
138	19	2	0
139	19	4	0
140	19	16	0
141	19	17	0
142	19	8	0
143	19	32	0
144	19	64	0
\.


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 144, true);


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
14	1	14	2021-12-10 21:48:16	2021-12-10 21:48:09	2021-12-10 21:48:09	5	en_US	3	0	0
5	1	5	2021-12-10 21:43:29	2021-12-10 21:43:23	2021-12-10 21:43:23	5	en_US	3	0	0
1	1	1	2021-12-10 21:41:19	2021-12-10 21:41:19	2021-12-10 21:41:19	5	en_US	1	0	0
18	1	18	2021-12-10 21:50:24	2021-12-10 21:50:17	2021-12-10 21:50:17	5	en_US	3	0	0
10	1	10	2021-12-10 21:46:05	2021-12-10 21:45:59	2021-12-10 21:45:59	5	en_US	3	0	0
15	1	15	2021-12-10 21:48:47	2021-12-10 21:48:39	2021-12-10 21:48:39	5	en_US	3	0	0
2	1	2	2021-12-10 21:41:50	2021-12-10 21:41:44	2021-12-10 21:41:44	5	en_US	3	0	0
6	1	6	2021-12-10 21:44:00	2021-12-10 21:43:52	2021-12-10 21:43:52	5	en_US	3	0	0
11	1	11	2021-12-10 21:46:41	2021-12-10 21:46:34	2021-12-10 21:46:34	5	en_US	3	0	0
19	1	19	2021-12-10 21:50:55	2021-12-10 21:50:47	2021-12-10 21:50:47	5	en_US	3	0	0
3	1	3	2021-12-10 21:42:28	2021-12-10 21:42:20	2021-12-10 21:42:20	5	en_US	3	0	0
7	1	7	2021-12-10 21:44:34	2021-12-10 21:44:27	2021-12-10 21:44:27	5	en_US	3	0	0
16	1	16	2021-12-10 21:49:20	2021-12-10 21:49:12	2021-12-10 21:49:12	5	en_US	3	0	0
4	1	4	2021-12-10 21:42:58	2021-12-10 21:42:51	2021-12-10 21:42:51	5	en_US	3	0	0
12	1	12	2021-12-10 21:47:12	2021-12-10 21:47:06	2021-12-10 21:47:06	5	en_US	3	0	0
8	1	8	2021-12-10 21:45:03	2021-12-10 21:44:58	2021-12-10 21:44:58	5	en_US	3	0	0
13	1	13	2021-12-10 21:47:45	2021-12-10 21:47:38	2021-12-10 21:47:38	5	en_US	3	0	0
9	1	9	2021-12-10 21:45:34	2021-12-10 21:45:28	2021-12-10 21:45:28	5	en_US	3	0	0
17	1	17	2021-12-10 21:49:52	2021-12-10 21:49:46	2021-12-10 21:49:46	5	en_US	3	0	0
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
3	en_US	familyName	0	0	Barnes	string
1	en_US	givenName	0	0	admin	string
1	en_US	familyName	0	0	admin	string
7	en_US	affiliation	0	0	University of Bologna	string
7	en_US	givenName	0	0	Carlo	string
7	en_US	familyName	0	0	Corino	string
3	en_US	preferredPublicName	0	0		string
3	en_US	biography	0	0		string
11	en_US	affiliation	0	0	University of Toronto	string
10	en_US	affiliation	0	0	Alexandria University	string
10	en_US	givenName	0	0	Diaga	string
2	en_US	biography	0	0		string
2	fr_CA	biography	0	0		string
2	en_US	signature	0	0		string
2	fr_CA	signature	0	0		string
2	en_US	affiliation	0	0	Universidad Nacional Autónoma de México	string
10	en_US	familyName	0	0	Diouf	string
3		orcid	0	0		string
3	en_US	signature	0	0		string
3	fr_CA	familyName	0	0		string
9	en_US	affiliation	0	0	University of Alberta	string
9	en_US	givenName	0	0	Craig	string
9	en_US	familyName	0	0	Montgomerie	string
3	fr_CA	preferredPublicName	0	0		string
11	en_US	givenName	0	0	Dana	string
3	fr_CA	biography	0	0		string
11	en_US	familyName	0	0	Phillips	string
12	en_US	affiliation	0	0	University College Cork	string
12	en_US	givenName	0	0	Domatilia	string
12	en_US	familyName	0	0	Sokoloff	string
13	en_US	affiliation	0	0	Indiana University	string
13	en_US	givenName	0	0	Elinor	string
13	en_US	familyName	0	0	Ostrom	string
14	en_US	givenName	0	0	Fabio	string
14	en_US	familyName	0	0	Paglieri	string
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
24	en_US	givenName	0	0	Valerie	string
24	en_US	familyName	0	0	Williamson	string
22	en_US	affiliation	0	0	Barcelona University	string
22	en_US	givenName	0	0	Rosanna	string
22	en_US	familyName	0	0	Rossi	string
23	en_US	affiliation	0	0	University of Tehran	string
23	en_US	givenName	0	0	Vajiheh	string
23	en_US	familyName	0	0	Karbasizaed	string
24	en_US	affiliation	0	0	University of Windsor	string
25	en_US	affiliation	0	0	CUNY	string
25	en_US	givenName	0	0	Zita	string
25	en_US	familyName	0	0	Woods	string
3	fr_CA	signature	0	0		string
3	en_US	affiliation	0	0	University of Melbourne	string
3	fr_CA	affiliation	0	0		string
3	fr_CA	givenName	0	0		string
3	en_US	givenName	0	0	Daniel	string
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
16	jnovak	$2y$10$24ciTURtWBf/OpaRl..J5eeV1Q8MZH0mqZJLKQRvAAmn4c6MTYFW2	jnovak@mailinator.com	\N	\N	\N	\N	DK		\N	\N	2021-12-10 21:45:39	\N	2021-12-10 21:45:40	0	\N	\N	0	\N	1
17	kalkhafaji	$2y$10$CGxAjnHbOov3g/e136RFAOduIHsT1w11kCOWWzIcj/6ZzXzZ9/vjC	kalkhafaji@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-12-10 21:46:10	\N	2021-12-10 21:46:10	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$vMAGE41ai8r/tl29DSxKluLcS9pXgXmpjtP8sSIlexaBdEikeQz9S	dbuskins@mailinator.com				\N	US		\N	\N	2021-12-10 21:39:57	\N	2021-12-10 21:39:57	0	0	\N	0	\N	1
5	sberardo	$2y$10$NCe7YW523uto.JB.zWqFl.MIZFkUKYNl1AHbcx/gQjqiqAso4W4PK	sberardo@mailinator.com				\N	CA		\N	\N	2021-12-10 21:40:06	\N	2021-12-10 21:40:06	0	0	\N	0	\N	1
6	minoue	$2y$10$VdQUeIMpyZj0KKfEnrIJpOTParVrxiJX8lE1zKHucmjGm.fI1/TnS	minoue@mailinator.com				\N	JP		\N	\N	2021-12-10 21:40:15	\N	2021-12-10 21:40:15	0	0	\N	0	\N	1
25	zwoods	$2y$10$XsZaXOBBUjMk/BhVD0s3o.kkQqzoxgWhrTw8XYPbJMUeoRf1twWlO	zwoods@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-12-10 21:50:29	\N	2021-12-10 21:50:29	0	\N	\N	0	\N	1
2	rvaca	$2y$10$M/StnIWYB.ze0g/t.tUAaO4/YGQXWV76ZxHJ7bqrj3aivZxR6ygv2	rvaca@mailinator.com				\N	MX		\N	\N	2021-12-10 21:39:42	\N	2021-12-10 21:40:24	0	0	\N	0	\N	1
18	lchristopher	$2y$10$0SB.5nb60Hk6.mCLqGaXzu/PUrhBuQpMI5Hh6sBGeTdeOPD0aIuau	lchristopher@mailinator.com	\N	\N	\N	\N	AU		\N	\N	2021-12-10 21:46:46	\N	2021-12-10 21:46:46	0	\N	\N	0	\N	1
1	admin	$2y$10$QKdsGfCyxCUhgknhPUKCEu.3eG.6MSjUmuX7WKml6KnCBwIlhdraW	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2021-12-10 21:38:48	\N	2021-12-10 21:40:33	0	\N	\N	0	\N	1
7	ccorino	$2y$10$lRyehAKLjzK9hDU3e0XjP.FAR0qEvBoa33KYr14sjWFn4Ic2HGNbu	ccorino@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2021-12-10 21:40:59	\N	2021-12-10 21:40:59	0	\N	\N	0	\N	1
8	ckwantes	$2y$10$WZjkGlcgFd4WVDbWZKXoIeQuzieofuJAxx870Yv6Wt3CGGGUzbmuC	ckwantes@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-12-10 21:41:24	\N	2021-12-10 21:41:24	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$LRiHQmPmPicwCZpUEZl/MOjVzpos/gIUJUKfI0vHBCOJWXtx/m1UW	dbarnes@mailinator.com				\N	AU		\N	\N	2021-12-10 21:39:49	\N	2021-12-10 21:50:49	0	0	\N	0	\N	1
9	cmontgomerie	$2y$10$f6EVnuvbtUBQalnXrqSqo.igE0EjN62ccspUFK3UTu9g4YMcLMdMm	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-12-10 21:41:55	\N	2021-12-10 21:41:55	0	\N	\N	0	\N	1
10	ddiouf	$2y$10$b37B91lcOrmj3c8jsNndAuiWxRUuw/kXbe5o26XEIwvVSRbpesBJ2	ddiouf@mailinator.com	\N	\N	\N	\N	EG		\N	\N	2021-12-10 21:42:32	\N	2021-12-10 21:42:33	0	\N	\N	0	\N	1
19	lkumiega	$2y$10$YmPYIEbqhIevM7yA3uPL/O1S9O049kN7o7oP6obKoxCa.wD3MVB4O	lkumiega@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2021-12-10 21:47:16	\N	2021-12-10 21:47:17	0	\N	\N	0	\N	1
11	dphillips	$2y$10$D5PJGZo6kb8XBPfDktLk0OMKK9PBwJ4sf.lJaRmVDOAbgMiLMdJsq	dphillips@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-12-10 21:43:02	\N	2021-12-10 21:43:03	0	\N	\N	0	\N	1
12	dsokoloff	$2y$10$cAdDJFTRUvq0tWYfOwOETuCUJgrwE/JxfYR99zkUKrF6K7EXtLmPW	dsokoloff@mailinator.com	\N	\N	\N	\N	IE		\N	\N	2021-12-10 21:43:34	\N	2021-12-10 21:43:34	0	\N	\N	0	\N	1
13	eostrom	$2y$10$rfImU8SteD3iJxTPk.ELOu.EVm4obByq1cxwX0ukm3e6KsblF6o3u	eostrom@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-12-10 21:44:04	\N	2021-12-10 21:44:04	0	\N	\N	0	\N	1
20	pdaniel	$2y$10$65PvsHmPtF4uLUoG4x6oGeqXaif1g8KQc3k05to5pgREvV4D6YazK	pdaniel@mailinator.com	\N	\N	\N	\N	GB		\N	\N	2021-12-10 21:47:49	\N	2021-12-10 21:47:50	0	\N	\N	0	\N	1
14	fpaglieri	$2y$10$e1p5MPbOHF3gdPle/QbaIuKXhA2HgnG5l40ZXpeXwhRbf08xoS3Li	fpaglieri@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2021-12-10 21:44:39	\N	2021-12-10 21:44:39	0	\N	\N	0	\N	1
15	jmwandenga	$2y$10$HzFrT2qFgQ4PDthipEY.y.i8NzF8NZojPYzm8h06ibBfsVN.L0eeC	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2021-12-10 21:45:08	\N	2021-12-10 21:45:09	0	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$KJvM6n8grAwOqKDTMBr8xupoyccNmDIhGIkYUuArxY2mdcqVfMIq2	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE		\N	\N	2021-12-10 21:48:20	\N	2021-12-10 21:48:21	0	\N	\N	0	\N	1
22	rrossi	$2y$10$rrC2.d2XNXUh/KG2OG9mie52mvCoiEnDKjwtuAp.urnxR7OU6Nb4i	rrossi@mailinator.com	\N	\N	\N	\N	ES		\N	\N	2021-12-10 21:48:51	\N	2021-12-10 21:48:51	0	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$C0NlHaRRrhv3g8S6GwjMWeD.XvWV2T8qxOzaOgKkugpXR.RBroa7.	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR		\N	\N	2021-12-10 21:49:25	\N	2021-12-10 21:49:25	0	\N	\N	0	\N	1
24	vwilliamson	$2y$10$.qRTss6tMj663N06HCWf9.7KeuMjk/WV8hqUdYnD8CnLTP2yHITuu	vwilliamson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-12-10 21:49:58	\N	2021-12-10 21:49:58	0	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2021-12-10 21:38:49	1	plugins.metadata	dc11		0	0
1	0	1	0	2021-12-10 21:38:49	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	1	2	23	2021-12-10 21:38:49	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	2	0	0	2021-12-10 21:38:49	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.generic	crossrefDeposit	CrossrefDepositPlugin	1	0
1	1	0	0	2021-12-10 21:38:49	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	2	0	0	2021-12-10 21:38:49	1	plugins.generic	acron	AcronPlugin	1	1
1	0	0	0	2021-12-10 21:38:49	1	plugins.generic	usageEvent		0	0
1	0	1	0	2021-12-10 21:38:49	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
2	2	0	0	2021-12-10 21:38:49	1	plugins.importexport	crossref		0	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
1	0	0	0	2021-12-10 21:38:49	1	plugins.themes	default	DefaultThemePlugin	1	0
3	3	0	8	2021-12-10 21:38:48	1	core	ops		0	1
1	1	0	0	2021-12-10 21:38:49	1	plugins.reports	counterReport		0	0
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

