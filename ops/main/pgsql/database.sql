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
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_submission_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_reviewer_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_review_round_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_review_form_id_foreign;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_submission_file_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_publication_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_category_id_foreign;
ALTER TABLE ONLY public.category_settings DROP CONSTRAINT category_settings_category_id_foreign;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_parent_id_foreign;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_context_id_foreign;
ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_type_id_foreign;
ALTER TABLE ONLY public.announcement_types DROP CONSTRAINT announcement_types_context_id_foreign;
ALTER TABLE ONLY public.announcement_type_settings DROP CONSTRAINT announcement_type_settings_type_id_foreign;
ALTER TABLE ONLY public.announcement_settings DROP CONSTRAINT announcement_settings_announcement_id_foreign;
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
DROP INDEX public.server_settings_server_id;
DROP INDEX public.sections_server_id;
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
DROP INDEX public.announcement_types_context_id;
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
ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_pkey;
ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_path;
ALTER TABLE ONLY public.server_settings DROP CONSTRAINT server_settings_pkey;
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
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignment_reviewer_round_unique;
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
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.item_views DROP CONSTRAINT item_views_pkey;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_pkey;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_pkey;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_pkey;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_symbolic;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_pkey;
ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
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
ALTER TABLE public.submission_search_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.submission_search_keyword_list ALTER COLUMN keyword_id DROP DEFAULT;
ALTER TABLE public.submission_files ALTER COLUMN submission_file_id DROP DEFAULT;
ALTER TABLE public.submission_file_revisions ALTER COLUMN revision_id DROP DEFAULT;
ALTER TABLE public.submission_comments ALTER COLUMN comment_id DROP DEFAULT;
ALTER TABLE public.stage_assignments ALTER COLUMN stage_assignment_id DROP DEFAULT;
ALTER TABLE public.servers ALTER COLUMN server_id DROP DEFAULT;
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
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
ALTER TABLE public.filters ALTER COLUMN filter_id DROP DEFAULT;
ALTER TABLE public.filter_groups ALTER COLUMN filter_group_id DROP DEFAULT;
ALTER TABLE public.files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
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
DROP SEQUENCE public.servers_server_id_seq;
DROP TABLE public.servers;
DROP TABLE public.server_settings;
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
DROP SEQUENCE public.failed_jobs_id_seq;
DROP TABLE public.failed_jobs;
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
    context_id bigint NOT NULL
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
    parent_id bigint,
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
    setting_value text
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
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO "ops-ci";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO "ops-ci";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


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
    server_id bigint NOT NULL,
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
-- Name: server_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.server_settings (
    server_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.server_settings OWNER TO "ops-ci";

--
-- Name: servers; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.servers (
    server_id bigint NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.servers OWNER TO "ops-ci";

--
-- Name: COLUMN servers.seq; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.servers.seq IS 'Used to order lists of servers';


--
-- Name: COLUMN servers.enabled; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.servers.enabled IS 'Controls whether or not the server is considered "live" and will appear on the website. (Note that disabled servers may still be accessible, but only if the user knows the URL.)';


--
-- Name: servers_server_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.servers_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servers_server_id_seq OWNER TO "ops-ci";

--
-- Name: servers_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.servers_server_id_seq OWNED BY public.servers.server_id;


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
    representation_id bigint,
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
    setting_value text
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
    date_last_login timestamp(0) without time zone,
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
-- Name: id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


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
-- Name: server_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.servers ALTER COLUMN server_id SET DEFAULT nextval('public.servers_server_id_seq'::regclass);


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

COPY public.announcement_types (type_id, context_id) FROM stdin;
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
2	1	\N	1	biology	\N
1	1	\N	3	history	\N
4	1	\N	4	mathematics	\N
3	1	\N	5	social-sciences	\N
5	1	1	10000	cultural-history	\N
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Data for Name: category_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.category_settings (category_id, locale, setting_name, setting_value) FROM stdin;
1		sortOption	title-ASC
1	en_US	title	History
1	fr_CA	title	
1	en_US	description	
1	fr_CA	description	
2		sortOption	title-ASC
2	en_US	title	Biology
2	fr_CA	title	
2	en_US	description	
2	fr_CA	description	
3		sortOption	title-ASC
3	en_US	title	Social sciences
3	fr_CA	title	
3	en_US	description	
3	fr_CA	description	
4		sortOption	title-ASC
4	en_US	title	Mathematics
4	fr_CA	title	
4	en_US	description	
4	fr_CA	description	
5		sortOption	title-ASC
5	en_US	title	Cultural History
5	fr_CA	title	
5	en_US	description	
5	fr_CA	description	
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
6	USER_VALIDATE_CONTEXT	0	1	\N	\N	\N
7	USER_VALIDATE_SITE	0	1	\N	\N	\N
8	ISSUE_PUBLISH_NOTIFY	0	1	\N	\N	\N
9	SUBMISSION_ACK	1	1	\N	65536	5
10	POSTED_ACK	1	1	\N	65536	5
11	SUBMISSION_ACK_NOT_USER	1	1	\N	65536	5
12	EDITOR_ASSIGN	1	1	16	16	5
13	EDITOR_DECISION_ACCEPT	0	1	16	65536	5
14	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536	5
15	STATISTICS_REPORT_NOTIFICATION	1	1	16	17	\N
16	ANNOUNCEMENT	0	1	16	1048576	\N
17	ORCID_COLLECT_AUTHOR_ID	0	1	\N	\N	\N
18	ORCID_REQUEST_AUTHOR_AUTHORIZATION	0	1	\N	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\n{$signature}<hr />{$unsubscribeLink}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$serverName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
PASSWORD_RESET	en_US	Password Reset	Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\n{$signature}	This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.
USER_REGISTER	en_US	Server Registration	{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server's list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE_CONTEXT	en_US	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a new user signed up on the server to validate their email account.
USER_VALIDATE_SITE	en_US	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a new user signed up on the site to validate their email account.
ISSUE_PUBLISH_NOTIFY	en_US	New Preprint Posted	Readers:<br />\n<br />\n{$serverName} has just posted its latest preprint at {$serverUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$signature}	This email is sent to registered readers via the "Notify Users" link in the Moderator's User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$recipientName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.
POSTED_ACK	en_US	Preprint Posted Acknowledgement	{$authorPrimary}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}	This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}	This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.
EDITOR_ASSIGN	en_US	Moderator Assignment	{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$serverName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you.	This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.
EDITOR_DECISION_ACCEPT	en_US	Moderator Decision	{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission	This email from the Manager or Moderator to an Author notifies them of a final "accept submission" decision regarding their submission.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Moderator Decision	\n\t\t\t{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission	This email is sent to the author if the moderator declines his submission initially.
STATISTICS_REPORT_NOTIFICATION	en_US	Preprint Server activity for {$month}, {$year}	Preprint Server activity for {$month}, {$year}	Preprint Server activity for {$month}, {$year}
ANNOUNCEMENT	en_US	{$announcementTitle}	<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href="{$announcementUrl}">full announcement</a>.	This email is sent when a new announcement is created.
ORCID_COLLECT_AUTHOR_ID	en_US	Submission ORCID	Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href="{$orcidAboutUrl}">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	This email template is used to collect the ORCID id's from authors.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	en_US	Requesting ORCID record access	Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission "{$submissionTitle}" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href="{$orcidAboutUrl}">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n	This email template is used to request ORCID record access from authors.
NOTIFICATION	fr_CA	Nouvel avis de {$siteTitle}	Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$notificationUrl}<br />\n<br />\n{$signature}	Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d'avis.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$signature}	Ce courriel est envoyé à l'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.
PASSWORD_RESET	fr_CA	Réinitialisation du mot de passe	Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\n{$signature}	Ce courriel est envoyé à l'utilisateur-trice inscrit-e lorsqu'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».
USER_REGISTER	fr_CA	Inscription au serveur	{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu'utilisateur-trice pour {$serverName}. Votre nom d'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}	Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l'informer de son nom d'utilisateur-trice et de son mot de passe.
USER_VALIDATE_CONTEXT	fr_CA	Valider votre compte	{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l'utiliser vous devez d'abord valider votre compte de courriel. Pour ce faire, vous n'avez qu'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$signature}	Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.
ISSUE_PUBLISH_NOTIFY	fr_CA	Nouvelle prépublication publiée	Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$serverName} vient d'être publiée à l'adresse suivante : {$serverUrl}.\n<br />\nNous vous remercions de l'intérêt que vous portez à notre travail,<br />\n{$signature}	Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l'URL fourni.
SUBMISSION_ACK	fr_CA	Accusé de réception de la soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$serverName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n	Ce courriel, lorsqu'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l'auteur-e de sa soumission.
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$signature}	Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.
ORCID_COLLECT_AUTHOR_ID	fr_CA	Soumission ORCID	{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d'auteur ou d'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	fr_CA	Demande d'accès au dossier ORCID	{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l'accès en suivant les instructions.<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	Ce modèle de courriel est utilisé pour demander aux auteurs-es l'accès à leur dossier ORCID.
\.


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 18, true);


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
1	1048585	1	7	2022-02-14 21:37:49	268435458	submission.event.general.metadataUpdated	0
2	515	1	7	2022-02-14 21:37:59	1342177281	submission.event.fileUploaded	0
3	1048585	1	7	2022-02-14 21:37:59	1342177288	submission.event.fileRevised	0
4	515	1	7	2022-02-14 21:38:02	1342177296	submission.event.fileEdited	0
5	1048585	1	7	2022-02-14 21:38:02	1342177296	submission.event.fileEdited	0
6	1048585	1	7	2022-02-14 21:38:05	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	7	2022-02-14 21:38:06	268435457	submission.event.submissionSubmitted	0
8	1048585	2	8	2022-02-14 21:38:14	268435458	submission.event.general.metadataUpdated	0
9	515	2	8	2022-02-14 21:38:24	1342177281	submission.event.fileUploaded	0
10	1048585	2	8	2022-02-14 21:38:24	1342177288	submission.event.fileRevised	0
11	515	2	8	2022-02-14 21:38:27	1342177296	submission.event.fileEdited	0
12	1048585	2	8	2022-02-14 21:38:27	1342177296	submission.event.fileEdited	0
13	1048585	2	8	2022-02-14 21:38:30	268435458	submission.event.general.metadataUpdated	0
14	1048585	2	8	2022-02-14 21:38:31	268435457	submission.event.submissionSubmitted	0
15	1048585	2	3	2022-02-14 21:38:38	268435462	publication.event.published	0
16	1048585	3	9	2022-02-14 21:38:46	268435458	submission.event.general.metadataUpdated	0
17	515	3	9	2022-02-14 21:38:56	1342177281	submission.event.fileUploaded	0
18	1048585	3	9	2022-02-14 21:38:56	1342177288	submission.event.fileRevised	0
19	515	3	9	2022-02-14 21:38:59	1342177296	submission.event.fileEdited	0
20	1048585	3	9	2022-02-14 21:38:59	1342177296	submission.event.fileEdited	0
21	1048585	3	9	2022-02-14 21:39:06	268435458	submission.event.general.metadataUpdated	0
22	1048585	3	9	2022-02-14 21:39:07	268435457	submission.event.submissionSubmitted	0
23	1048585	3	3	2022-02-14 21:39:15	268435462	publication.event.published	0
24	1048585	4	10	2022-02-14 21:39:23	268435458	submission.event.general.metadataUpdated	0
25	515	4	10	2022-02-14 21:39:33	1342177281	submission.event.fileUploaded	0
26	1048585	4	10	2022-02-14 21:39:33	1342177288	submission.event.fileRevised	0
27	515	4	10	2022-02-14 21:39:35	1342177296	submission.event.fileEdited	0
28	1048585	4	10	2022-02-14 21:39:35	1342177296	submission.event.fileEdited	0
29	1048585	4	10	2022-02-14 21:39:38	268435458	submission.event.general.metadataUpdated	0
30	1048585	4	10	2022-02-14 21:39:39	268435457	submission.event.submissionSubmitted	0
31	1048585	4	3	2022-02-14 21:39:46	268435462	publication.event.published	0
32	1048585	5	11	2022-02-14 21:39:55	268435458	submission.event.general.metadataUpdated	0
33	515	5	11	2022-02-14 21:40:04	1342177281	submission.event.fileUploaded	0
34	1048585	5	11	2022-02-14 21:40:05	1342177288	submission.event.fileRevised	0
35	515	5	11	2022-02-14 21:40:07	1342177296	submission.event.fileEdited	0
36	1048585	5	11	2022-02-14 21:40:07	1342177296	submission.event.fileEdited	0
37	1048585	5	11	2022-02-14 21:40:11	268435458	submission.event.general.metadataUpdated	0
38	1048585	5	11	2022-02-14 21:40:12	268435457	submission.event.submissionSubmitted	0
39	1048585	5	3	2022-02-14 21:40:19	268435462	publication.event.published	0
40	1048585	6	12	2022-02-14 21:40:28	268435458	submission.event.general.metadataUpdated	0
41	515	6	12	2022-02-14 21:40:38	1342177281	submission.event.fileUploaded	0
42	1048585	6	12	2022-02-14 21:40:38	1342177288	submission.event.fileRevised	0
43	515	6	12	2022-02-14 21:40:40	1342177296	submission.event.fileEdited	0
44	1048585	6	12	2022-02-14 21:40:40	1342177296	submission.event.fileEdited	0
45	1048585	6	12	2022-02-14 21:40:43	268435458	submission.event.general.metadataUpdated	0
46	1048585	6	12	2022-02-14 21:40:44	268435457	submission.event.submissionSubmitted	0
47	1048585	6	3	2022-02-14 21:40:51	268435462	publication.event.published	0
48	1048585	7	13	2022-02-14 21:41:00	268435458	submission.event.general.metadataUpdated	0
49	515	7	13	2022-02-14 21:41:10	1342177281	submission.event.fileUploaded	0
50	1048585	7	13	2022-02-14 21:41:10	1342177288	submission.event.fileRevised	0
51	515	7	13	2022-02-14 21:41:12	1342177296	submission.event.fileEdited	0
52	1048585	7	13	2022-02-14 21:41:12	1342177296	submission.event.fileEdited	0
53	1048585	7	13	2022-02-14 21:41:19	268435458	submission.event.general.metadataUpdated	0
54	1048585	7	13	2022-02-14 21:41:20	268435457	submission.event.submissionSubmitted	0
55	1048585	7	3	2022-02-14 21:41:28	268435462	publication.event.published	0
56	1048585	8	14	2022-02-14 21:41:37	268435458	submission.event.general.metadataUpdated	0
57	515	8	14	2022-02-14 21:41:46	1342177281	submission.event.fileUploaded	0
58	1048585	8	14	2022-02-14 21:41:46	1342177288	submission.event.fileRevised	0
59	515	8	14	2022-02-14 21:41:49	1342177296	submission.event.fileEdited	0
60	1048585	8	14	2022-02-14 21:41:49	1342177296	submission.event.fileEdited	0
61	1048585	8	14	2022-02-14 21:41:51	268435458	submission.event.general.metadataUpdated	0
62	1048585	8	14	2022-02-14 21:41:52	268435457	submission.event.submissionSubmitted	0
63	1048585	8	3	2022-02-14 21:42:00	268435462	publication.event.published	0
64	1048585	9	15	2022-02-14 21:42:09	268435458	submission.event.general.metadataUpdated	0
65	515	9	15	2022-02-14 21:42:19	1342177281	submission.event.fileUploaded	0
66	1048585	9	15	2022-02-14 21:42:19	1342177288	submission.event.fileRevised	0
67	515	9	15	2022-02-14 21:42:21	1342177296	submission.event.fileEdited	0
68	1048585	9	15	2022-02-14 21:42:21	1342177296	submission.event.fileEdited	0
69	1048585	9	15	2022-02-14 21:42:25	268435458	submission.event.general.metadataUpdated	0
70	1048585	9	15	2022-02-14 21:42:26	268435457	submission.event.submissionSubmitted	0
71	1048585	9	3	2022-02-14 21:42:34	268435462	publication.event.published	0
72	1048585	10	16	2022-02-14 21:42:43	268435458	submission.event.general.metadataUpdated	0
73	515	10	16	2022-02-14 21:42:53	1342177281	submission.event.fileUploaded	0
74	1048585	10	16	2022-02-14 21:42:53	1342177288	submission.event.fileRevised	0
75	515	10	16	2022-02-14 21:42:55	1342177296	submission.event.fileEdited	0
76	1048585	10	16	2022-02-14 21:42:55	1342177296	submission.event.fileEdited	0
77	1048585	10	16	2022-02-14 21:42:59	268435458	submission.event.general.metadataUpdated	0
78	1048585	10	16	2022-02-14 21:43:00	268435457	submission.event.submissionSubmitted	0
79	1048585	10	3	2022-02-14 21:43:07	268435462	publication.event.published	0
80	1048585	11	17	2022-02-14 21:43:17	268435458	submission.event.general.metadataUpdated	0
81	515	11	17	2022-02-14 21:43:27	1342177281	submission.event.fileUploaded	0
82	1048585	11	17	2022-02-14 21:43:27	1342177288	submission.event.fileRevised	0
83	515	11	17	2022-02-14 21:43:29	1342177296	submission.event.fileEdited	0
84	1048585	11	17	2022-02-14 21:43:29	1342177296	submission.event.fileEdited	0
85	1048585	11	17	2022-02-14 21:43:36	268435458	submission.event.general.metadataUpdated	0
86	1048585	11	17	2022-02-14 21:43:37	268435457	submission.event.submissionSubmitted	0
87	1048585	11	3	2022-02-14 21:43:45	268435462	publication.event.published	0
88	1048585	12	18	2022-02-14 21:43:55	268435458	submission.event.general.metadataUpdated	0
89	515	12	18	2022-02-14 21:44:05	1342177281	submission.event.fileUploaded	0
90	1048585	12	18	2022-02-14 21:44:05	1342177288	submission.event.fileRevised	0
91	515	12	18	2022-02-14 21:44:07	1342177296	submission.event.fileEdited	0
92	1048585	12	18	2022-02-14 21:44:07	1342177296	submission.event.fileEdited	0
93	1048585	12	18	2022-02-14 21:44:12	268435458	submission.event.general.metadataUpdated	0
94	1048585	12	18	2022-02-14 21:44:13	268435457	submission.event.submissionSubmitted	0
95	1048585	12	3	2022-02-14 21:44:20	268435462	publication.event.published	0
96	1048585	13	19	2022-02-14 21:44:29	268435458	submission.event.general.metadataUpdated	0
97	515	13	19	2022-02-14 21:44:39	1342177281	submission.event.fileUploaded	0
98	1048585	13	19	2022-02-14 21:44:39	1342177288	submission.event.fileRevised	0
99	515	13	19	2022-02-14 21:44:42	1342177296	submission.event.fileEdited	0
100	1048585	13	19	2022-02-14 21:44:42	1342177296	submission.event.fileEdited	0
101	1048585	13	19	2022-02-14 21:44:46	268435458	submission.event.general.metadataUpdated	0
102	1048585	13	19	2022-02-14 21:44:47	268435457	submission.event.submissionSubmitted	0
103	1048585	13	3	2022-02-14 21:44:54	268435462	publication.event.published	0
104	1048585	14	20	2022-02-14 21:45:03	268435458	submission.event.general.metadataUpdated	0
105	515	14	20	2022-02-14 21:45:13	1342177281	submission.event.fileUploaded	0
106	1048585	14	20	2022-02-14 21:45:13	1342177288	submission.event.fileRevised	0
107	515	14	20	2022-02-14 21:45:15	1342177296	submission.event.fileEdited	0
108	1048585	14	20	2022-02-14 21:45:15	1342177296	submission.event.fileEdited	0
109	1048585	14	20	2022-02-14 21:45:19	268435458	submission.event.general.metadataUpdated	0
110	1048585	14	20	2022-02-14 21:45:20	268435457	submission.event.submissionSubmitted	0
111	1048585	14	3	2022-02-14 21:45:28	268435462	publication.event.published	0
112	1048585	15	21	2022-02-14 21:45:37	268435458	submission.event.general.metadataUpdated	0
113	515	15	21	2022-02-14 21:45:47	1342177281	submission.event.fileUploaded	0
114	1048585	15	21	2022-02-14 21:45:47	1342177288	submission.event.fileRevised	0
115	515	15	21	2022-02-14 21:45:50	1342177296	submission.event.fileEdited	0
116	1048585	15	21	2022-02-14 21:45:50	1342177296	submission.event.fileEdited	0
117	1048585	15	21	2022-02-14 21:45:53	268435458	submission.event.general.metadataUpdated	0
118	1048585	15	21	2022-02-14 21:45:54	268435457	submission.event.submissionSubmitted	0
119	1048585	15	3	2022-02-14 21:46:01	268435462	publication.event.published	0
120	1048585	16	22	2022-02-14 21:46:11	268435458	submission.event.general.metadataUpdated	0
121	515	16	22	2022-02-14 21:46:22	1342177281	submission.event.fileUploaded	0
122	1048585	16	22	2022-02-14 21:46:22	1342177288	submission.event.fileRevised	0
123	515	16	22	2022-02-14 21:46:24	1342177296	submission.event.fileEdited	0
124	1048585	16	22	2022-02-14 21:46:24	1342177296	submission.event.fileEdited	0
125	1048585	16	22	2022-02-14 21:46:28	268435458	submission.event.general.metadataUpdated	0
126	1048585	16	22	2022-02-14 21:46:29	268435457	submission.event.submissionSubmitted	0
127	1048585	16	3	2022-02-14 21:46:36	268435462	publication.event.published	0
128	1048585	17	23	2022-02-14 21:46:46	268435458	submission.event.general.metadataUpdated	0
129	515	17	23	2022-02-14 21:46:56	1342177281	submission.event.fileUploaded	0
130	1048585	17	23	2022-02-14 21:46:56	1342177288	submission.event.fileRevised	0
131	515	17	23	2022-02-14 21:46:58	1342177296	submission.event.fileEdited	0
132	1048585	17	23	2022-02-14 21:46:58	1342177296	submission.event.fileEdited	0
133	1048585	17	23	2022-02-14 21:47:03	268435458	submission.event.general.metadataUpdated	0
134	1048585	17	23	2022-02-14 21:47:04	268435457	submission.event.submissionSubmitted	0
135	1048585	17	3	2022-02-14 21:47:12	268435462	publication.event.published	0
136	1048585	18	24	2022-02-14 21:47:22	268435458	submission.event.general.metadataUpdated	0
137	515	18	24	2022-02-14 21:47:32	1342177281	submission.event.fileUploaded	0
138	1048585	18	24	2022-02-14 21:47:32	1342177288	submission.event.fileRevised	0
139	515	18	24	2022-02-14 21:47:34	1342177296	submission.event.fileEdited	0
140	1048585	18	24	2022-02-14 21:47:34	1342177296	submission.event.fileEdited	0
141	1048585	18	24	2022-02-14 21:47:38	268435458	submission.event.general.metadataUpdated	0
142	1048585	18	24	2022-02-14 21:47:39	268435457	submission.event.submissionSubmitted	0
143	1048585	18	3	2022-02-14 21:47:46	268435462	publication.event.published	0
144	1048585	19	25	2022-02-14 21:47:56	268435458	submission.event.general.metadataUpdated	0
145	515	19	25	2022-02-14 21:48:05	1342177281	submission.event.fileUploaded	0
146	1048585	19	25	2022-02-14 21:48:05	1342177288	submission.event.fileRevised	0
147	515	19	25	2022-02-14 21:48:08	1342177296	submission.event.fileEdited	0
148	1048585	19	25	2022-02-14 21:48:08	1342177296	submission.event.fileEdited	0
149	1048585	19	25	2022-02-14 21:48:10	268435458	submission.event.general.metadataUpdated	0
150	1048585	19	25	2022-02-14 21:48:11	268435457	submission.event.submissionSubmitted	0
151	1048585	19	3	2022-02-14 21:48:19	268435462	publication.event.published	0
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
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	contexts/1/submissions/1/620acbb7aeef7.pdf	application/pdf
2	contexts/1/submissions/2/620acbd0cf66a.pdf	application/pdf
3	contexts/1/submissions/3/620acbf0cf251.pdf	application/pdf
4	contexts/1/submissions/4/620acc15a3203.pdf	application/pdf
5	contexts/1/submissions/5/620acc34f1ee2.pdf	application/pdf
6	contexts/1/submissions/6/620acc56844b9.pdf	application/pdf
7	contexts/1/submissions/7/620acc762bfe4.pdf	application/pdf
8	contexts/1/submissions/8/620acc9ada517.pdf	application/pdf
9	contexts/1/submissions/9/620accbb68b12.pdf	application/pdf
10	contexts/1/submissions/10/620accdd2ee83.pdf	application/pdf
11	contexts/1/submissions/11/620accff1de91.pdf	application/pdf
12	contexts/1/submissions/12/620acd255c48d.pdf	application/pdf
13	contexts/1/submissions/13/620acd47a7e8d.pdf	application/pdf
14	contexts/1/submissions/14/620acd6997bd5.pdf	application/pdf
15	contexts/1/submissions/15/620acd8bb5524.pdf	application/pdf
16	contexts/1/submissions/16/620acdae07136.pdf	application/pdf
17	contexts/1/submissions/17/620acdd09719c.pdf	application/pdf
18	contexts/1/submissions/18/620acdf4530ad.pdf	application/pdf
19	contexts/1/submissions/19/620ace15b99c5.pdf	application/pdf
\.


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 19, true);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	preprint=>dc11	plugins.metadata.dc11.preprintAdapter.displayName	plugins.metadata.dc11.preprintAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.dc11.schema.Dc11Schema(PREPRINT)
2	preprint=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
3	native-xml=>preprint	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.submission.Submission[]
4	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.author.Author[]	xml::schema(plugins/importexport/native/native.xsd)
5	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.author.Author[]
6	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submissionFile.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
7	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submissionFile.SubmissionFile[]
8	preprint-galley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.preprint.PreprintGalley	xml::schema(plugins/importexport/native/native.xsd)
9	native-xml=>PreprintGalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.preprint.PreprintGalley[]
10	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
11	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication[]
12	preprint=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)
\.


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 12, true);


--
-- Data for Name: filter_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_settings (filter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filters (filter_id, filter_group_id, context_id, display_name, class_name, is_template, parent_filter_id, seq) FROM stdin;
1	1	0	Extract metadata from a(n) Submission	plugins.metadata.dc11.filter.Dc11SchemaPreprintAdapter	0	0	0
2	2	0	Native XML submission export	plugins.importexport.native.filter.PreprintNativeXmlFilter	0	0	0
3	3	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlPreprintFilter	0	0	0
4	4	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
5	5	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
6	7	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlPreprintFileFilter	0	0	0
7	6	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
8	8	0	Native XML representation export	plugins.importexport.native.filter.PreprintGalleyNativeXmlFilter	0	0	0
9	9	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlPreprintGalleyFilter	0	0	0
10	10	0	Native XML Publication export	plugins.importexport.native.filter.PublicationNativeXmlFilter	0	0	0
11	11	0	Native XML publication import	plugins.importexport.native.filter.NativeXmlPublicationFilter	0	0	0
12	12	0	Crossref XML preprint export	plugins.importexport.crossref.filter.PreprintCrossrefXmlFilter	0	0	0
\.


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.jobs_id_seq', 37, true);


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
148	1	0	3	16777222	2022-02-14 21:45:53	\N	1048585	15
149	1	0	3	16777223	2022-02-14 21:45:53	\N	1048585	15
150	1	4	2	16777217	2022-02-14 21:45:53	\N	1048585	15
54	1	0	3	16777222	2022-02-14 21:40:44	\N	1048585	6
3	1	0	3	16777222	2022-02-14 21:38:06	\N	1048585	1
4	1	0	3	16777223	2022-02-14 21:38:06	\N	1048585	1
5	1	4	2	16777217	2022-02-14 21:38:06	\N	1048585	1
7	1	5	2	16777217	2022-02-14 21:38:06	\N	1048585	1
9	1	0	2	16777243	2022-02-14 21:38:06	\N	1048585	1
10	1	0	2	16777245	2022-02-14 21:38:06	\N	1048585	1
55	1	0	3	16777223	2022-02-14 21:40:44	\N	1048585	6
56	1	4	2	16777217	2022-02-14 21:40:44	\N	1048585	6
12	1	0	3	16777222	2022-02-14 21:38:31	\N	1048585	2
13	1	0	3	16777223	2022-02-14 21:38:31	\N	1048585	2
14	1	4	2	16777217	2022-02-14 21:38:31	\N	1048585	2
16	1	5	2	16777217	2022-02-14 21:38:31	\N	1048585	2
18	1	0	2	16777243	2022-02-14 21:38:31	\N	1048585	2
19	1	0	2	16777245	2022-02-14 21:38:31	\N	1048585	2
58	1	5	2	16777217	2022-02-14 21:40:44	\N	1048585	6
60	1	0	2	16777243	2022-02-14 21:40:44	\N	1048585	6
61	1	0	2	16777245	2022-02-14 21:40:44	\N	1048585	6
23	1	0	3	16777222	2022-02-14 21:39:07	\N	1048585	3
24	1	0	3	16777223	2022-02-14 21:39:07	\N	1048585	3
25	1	4	2	16777217	2022-02-14 21:39:07	\N	1048585	3
27	1	5	2	16777217	2022-02-14 21:39:07	\N	1048585	3
29	1	0	2	16777243	2022-02-14 21:39:07	\N	1048585	3
30	1	0	2	16777245	2022-02-14 21:39:07	\N	1048585	3
98	1	4	2	16777217	2022-02-14 21:43:00	\N	1048585	10
100	1	5	2	16777217	2022-02-14 21:43:00	\N	1048585	10
34	1	0	3	16777222	2022-02-14 21:39:39	\N	1048585	4
35	1	0	3	16777223	2022-02-14 21:39:39	\N	1048585	4
36	1	4	2	16777217	2022-02-14 21:39:39	\N	1048585	4
38	1	5	2	16777217	2022-02-14 21:39:39	\N	1048585	4
40	1	0	2	16777243	2022-02-14 21:39:39	\N	1048585	4
41	1	0	2	16777245	2022-02-14 21:39:39	\N	1048585	4
65	1	0	3	16777222	2022-02-14 21:41:20	\N	1048585	7
44	1	0	3	16777222	2022-02-14 21:40:12	\N	1048585	5
45	1	0	3	16777223	2022-02-14 21:40:12	\N	1048585	5
46	1	4	2	16777217	2022-02-14 21:40:12	\N	1048585	5
48	1	5	2	16777217	2022-02-14 21:40:12	\N	1048585	5
50	1	0	2	16777243	2022-02-14 21:40:12	\N	1048585	5
51	1	0	2	16777245	2022-02-14 21:40:12	\N	1048585	5
66	1	0	3	16777223	2022-02-14 21:41:20	\N	1048585	7
67	1	4	2	16777217	2022-02-14 21:41:20	\N	1048585	7
86	1	0	3	16777222	2022-02-14 21:42:26	\N	1048585	9
69	1	5	2	16777217	2022-02-14 21:41:20	\N	1048585	7
71	1	0	2	16777243	2022-02-14 21:41:20	\N	1048585	7
72	1	0	2	16777245	2022-02-14 21:41:20	\N	1048585	7
87	1	0	3	16777223	2022-02-14 21:42:26	\N	1048585	9
88	1	4	2	16777217	2022-02-14 21:42:26	\N	1048585	9
90	1	5	2	16777217	2022-02-14 21:42:26	\N	1048585	9
76	1	0	3	16777222	2022-02-14 21:41:52	\N	1048585	8
77	1	0	3	16777223	2022-02-14 21:41:52	\N	1048585	8
78	1	4	2	16777217	2022-02-14 21:41:52	\N	1048585	8
80	1	5	2	16777217	2022-02-14 21:41:52	\N	1048585	8
82	1	0	2	16777243	2022-02-14 21:41:52	\N	1048585	8
83	1	0	2	16777245	2022-02-14 21:41:52	\N	1048585	8
92	1	0	2	16777243	2022-02-14 21:42:26	\N	1048585	9
93	1	0	2	16777245	2022-02-14 21:42:26	\N	1048585	9
102	1	0	2	16777243	2022-02-14 21:43:00	\N	1048585	10
103	1	0	2	16777245	2022-02-14 21:43:00	\N	1048585	10
108	1	0	3	16777223	2022-02-14 21:43:36	\N	1048585	11
96	1	0	3	16777222	2022-02-14 21:43:00	\N	1048585	10
97	1	0	3	16777223	2022-02-14 21:43:00	\N	1048585	10
109	1	4	2	16777217	2022-02-14 21:43:36	\N	1048585	11
111	1	5	2	16777217	2022-02-14 21:43:36	\N	1048585	11
107	1	0	3	16777222	2022-02-14 21:43:36	\N	1048585	11
113	1	0	2	16777243	2022-02-14 21:43:37	\N	1048585	11
114	1	0	2	16777245	2022-02-14 21:43:37	\N	1048585	11
118	1	0	3	16777222	2022-02-14 21:44:12	\N	1048585	12
119	1	0	3	16777223	2022-02-14 21:44:12	\N	1048585	12
120	1	4	2	16777217	2022-02-14 21:44:12	\N	1048585	12
124	1	0	2	16777243	2022-02-14 21:44:13	\N	1048585	12
122	1	5	2	16777217	2022-02-14 21:44:12	\N	1048585	12
125	1	0	2	16777245	2022-02-14 21:44:13	\N	1048585	12
128	1	0	3	16777222	2022-02-14 21:44:47	\N	1048585	13
129	1	0	3	16777223	2022-02-14 21:44:47	\N	1048585	13
130	1	4	2	16777217	2022-02-14 21:44:47	\N	1048585	13
132	1	5	2	16777217	2022-02-14 21:44:47	\N	1048585	13
134	1	0	2	16777243	2022-02-14 21:44:47	\N	1048585	13
135	1	0	2	16777245	2022-02-14 21:44:47	\N	1048585	13
152	1	5	2	16777217	2022-02-14 21:45:53	\N	1048585	15
154	1	0	2	16777243	2022-02-14 21:45:54	\N	1048585	15
138	1	0	3	16777222	2022-02-14 21:45:20	\N	1048585	14
139	1	0	3	16777223	2022-02-14 21:45:20	\N	1048585	14
140	1	4	2	16777217	2022-02-14 21:45:20	\N	1048585	14
155	1	0	2	16777245	2022-02-14 21:45:54	\N	1048585	15
142	1	5	2	16777217	2022-02-14 21:45:20	\N	1048585	14
144	1	0	2	16777243	2022-02-14 21:45:20	\N	1048585	14
145	1	0	2	16777245	2022-02-14 21:45:20	\N	1048585	14
197	0	3	1	3	2022-02-14 21:48:19	\N	0	0
158	1	0	3	16777222	2022-02-14 21:46:29	\N	1048585	16
159	1	0	3	16777223	2022-02-14 21:46:29	\N	1048585	16
160	1	4	2	16777217	2022-02-14 21:46:29	\N	1048585	16
162	1	5	2	16777217	2022-02-14 21:46:29	\N	1048585	16
164	1	0	2	16777243	2022-02-14 21:46:29	\N	1048585	16
165	1	0	2	16777245	2022-02-14 21:46:29	\N	1048585	16
168	1	0	3	16777222	2022-02-14 21:47:04	\N	1048585	17
169	1	0	3	16777223	2022-02-14 21:47:04	\N	1048585	17
170	1	4	2	16777217	2022-02-14 21:47:04	\N	1048585	17
172	1	5	2	16777217	2022-02-14 21:47:04	\N	1048585	17
174	1	0	2	16777243	2022-02-14 21:47:04	\N	1048585	17
175	1	0	2	16777245	2022-02-14 21:47:04	\N	1048585	17
178	1	0	3	16777222	2022-02-14 21:47:38	\N	1048585	18
179	1	0	3	16777223	2022-02-14 21:47:38	\N	1048585	18
180	1	4	2	16777217	2022-02-14 21:47:38	\N	1048585	18
182	1	5	2	16777217	2022-02-14 21:47:39	\N	1048585	18
184	1	0	2	16777243	2022-02-14 21:47:39	\N	1048585	18
185	1	0	2	16777245	2022-02-14 21:47:39	\N	1048585	18
188	1	0	3	16777222	2022-02-14 21:48:11	\N	1048585	19
189	1	0	3	16777223	2022-02-14 21:48:11	\N	1048585	19
190	1	4	2	16777217	2022-02-14 21:48:11	\N	1048585	19
192	1	5	2	16777217	2022-02-14 21:48:11	\N	1048585	19
194	1	0	2	16777243	2022-02-14 21:48:11	\N	1048585	19
195	1	0	2	16777245	2022-02-14 21:48:11	\N	1048585	19
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
defaultthemeplugin	0	enabled	1	bool
acronplugin	0	enabled	1	bool
acronplugin	0	crontab	[{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"lib.pkp.classes.task.StatisticsReport","frequency":{"day":"1"},"args":[]}]	object
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	["city","region"]	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
tinymceplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
defaultthemeplugin	1	enabled	1	bool
tinymceplugin	1	enabled	1	bool
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
pdfjsviewerplugin	1	enabled	1	bool
googlescholarplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	620acb315b47c	string
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
1	en_US	1	PDF	\N	0		0	
2	en_US	2	PDF	\N	0		0	
3	en_US	3	PDF	\N	0		0	
4	en_US	4	PDF	\N	0		0	
5	en_US	5	PDF	\N	0		0	
6	en_US	6	PDF	\N	0		0	
7	en_US	7	PDF	\N	0		0	
8	en_US	8	PDF	\N	0		0	
9	en_US	9	PDF	\N	0		0	
10	en_US	10	PDF	\N	0		0	
11	en_US	11	PDF	\N	0		0	
12	en_US	12	PDF	\N	0		0	
13	en_US	13	PDF	\N	0		0	
14	en_US	14	PDF	\N	0		0	
15	en_US	15	PDF	\N	0		0	
16	en_US	16	PDF	\N	0		0	
17	en_US	17	PDF	\N	0		0	
18	en_US	18	PDF	\N	0		0	
19	en_US	19	PDF	\N	0		0	
\.


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 19, true);


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
1	en_US	abstract	<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>
1	fr_CA	abstract	
1		categoryIds	[]
1		licenseUrl	
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The influence of lactation on the quantity and quality of cashmere production
1	fr_CA	title	
3	fr_CA	abstract	
3		categoryIds	[]
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
2	fr_CA	abstract	
2		categoryIds	[]
2	en_US	copyrightHolder	Public Knowledge Preprint Server
2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
2		copyrightYear	2022
2	en_US	prefix	
2	fr_CA	prefix	
2	en_US	subtitle	
2	fr_CA	subtitle	
2	en_US	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
2	fr_CA	title	
3	en_US	copyrightHolder	Public Knowledge Preprint Server
4	fr_CA	abstract	
3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
3		copyrightYear	2022
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
3	fr_CA	title	
4		categoryIds	[]
4	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
4	en_US	copyrightHolder	Public Knowledge Preprint Server
4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
4		copyrightYear	2022
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	Genetic transformation of forest trees
4	fr_CA	title	
5		categoryIds	[]
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	abstract	
5	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
5	en_US	copyrightHolder	Public Knowledge Preprint Server
5	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
5		copyrightYear	2022
5	fr_CA	subtitle	
5	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
5	fr_CA	title	
7	en_US	title	Traditions and Trends in the Study of the Commons
7	fr_CA	title	
6	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
6	fr_CA	abstract	
6		categoryIds	[]
6	en_US	copyrightHolder	Public Knowledge Preprint Server
6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
6		copyrightYear	2022
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
7		copyrightYear	2022
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
9	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
9	fr_CA	abstract	
8	en_US	abstract	<p>None.</p>
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	copyrightHolder	Public Knowledge Preprint Server
8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
8		copyrightYear	2022
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Hansen & Pinto: Reason Reclaimed
8	fr_CA	title	
9		categoryIds	[]
9	en_US	copyrightHolder	Public Knowledge Preprint Server
9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9		copyrightYear	2022
9	en_US	prefix	
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	fr_CA	title	
9	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
16	fr_CA	title	
16	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
10	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
10	fr_CA	abstract	
10		categoryIds	[]
10	en_US	copyrightHolder	Public Knowledge Preprint Server
10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10		copyrightYear	2022
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
10	fr_CA	title	
11	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	copyrightHolder	Public Knowledge Preprint Server
11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
11		copyrightYear	2022
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Learning Sustainable Design through Service
11	fr_CA	title	
12	fr_CA	abstract	
12	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
12		categoryIds	[]
12	en_US	copyrightHolder	Public Knowledge Preprint Server
12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12		copyrightYear	2022
12	fr_CA	prefix	
12	en_US	prefix	
12	fr_CA	subtitle	
12	en_US	subtitle	
12	fr_CA	title	
12	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
13		categoryIds	[]
13	fr_CA	abstract	
13	fr_CA	prefix	
13	en_US	prefix	
13	fr_CA	subtitle	
13	en_US	subtitle	
13	fr_CA	title	
13	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
13	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
13	en_US	copyrightHolder	Public Knowledge Preprint Server
13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
13		copyrightYear	2022
14	fr_CA	abstract	
14	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
14		categoryIds	[]
14	en_US	copyrightHolder	Public Knowledge Preprint Server
14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
14		copyrightYear	2022
14	fr_CA	prefix	
14	en_US	prefix	
14	fr_CA	subtitle	
14	en_US	subtitle	
14	fr_CA	title	
14	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
15	fr_CA	prefix	
15	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
15	fr_CA	abstract	
15		categoryIds	[]
15	en_US	copyrightHolder	Public Knowledge Preprint Server
15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15		copyrightYear	2022
15	en_US	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Yam diseases and its management in Nigeria
15	fr_CA	title	
16	fr_CA	abstract	
16		categoryIds	[]
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
16	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>
16	en_US	copyrightHolder	Public Knowledge Preprint Server
16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16		copyrightYear	2022
18		categoryIds	[]
18	en_US	copyrightHolder	Public Knowledge Preprint Server
17	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
17	fr_CA	abstract	
17		categoryIds	[]
17	en_US	copyrightHolder	Public Knowledge Preprint Server
17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
17		copyrightYear	2022
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
17	fr_CA	title	
18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
18	fr_CA	abstract	
18	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
18		copyrightYear	2022
18	fr_CA	prefix	
18	en_US	prefix	
18	fr_CA	subtitle	
18	en_US	subtitle	
18	fr_CA	title	
18	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments
19	fr_CA	abstract	
19	en_US	abstract	<p>None.</p>
19		categoryIds	[]
19	en_US	copyrightHolder	Public Knowledge Preprint Server
19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
19		copyrightYear	2022
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

COPY public.publications (publication_id, access_status, date_published, last_modified, primary_contact_id, section_id, submission_id, status, url_path, version) FROM stdin;
19	0	2022-02-14	2022-02-14 21:48:19	22	1	19	3	\N	1
1	0	\N	2022-02-14 21:38:05	1	1	1	1	\N	1
2	0	2022-02-14	2022-02-14 21:38:38	2	1	2	3	\N	1
3	0	2022-02-14	2022-02-14 21:39:15	3	1	3	3	\N	1
4	0	2022-02-14	2022-02-14 21:39:46	5	1	4	3	\N	1
5	0	2022-02-14	2022-02-14 21:40:19	6	1	5	3	\N	1
6	0	2022-02-14	2022-02-14 21:40:51	7	1	6	3	\N	1
7	0	2022-02-14	2022-02-14 21:41:28	8	1	7	3	\N	1
8	0	2022-02-14	2022-02-14 21:42:00	10	1	8	3	\N	1
9	0	2022-02-14	2022-02-14 21:42:34	11	1	9	3	\N	1
10	0	2022-02-14	2022-02-14 21:43:07	12	1	10	3	\N	1
11	0	2022-02-14	2022-02-14 21:43:45	13	1	11	3	\N	1
12	0	2022-02-14	2022-02-14 21:44:20	15	1	12	3	\N	1
13	0	2022-02-14	2022-02-14 21:44:54	16	1	13	3	\N	1
14	0	2022-02-14	2022-02-14 21:45:28	17	1	14	3	\N	1
15	0	2022-02-14	2022-02-14 21:46:01	18	1	15	3	\N	1
16	0	2022-02-14	2022-02-14 21:46:36	19	1	16	3	\N	1
17	0	2022-02-14	2022-02-14 21:47:12	20	1	17	3	\N	1
18	0	2022-02-14	2022-02-14 21:47:46	21	1	18	3	\N	1
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
plugins.generic.usageStats.UsageStatsLoader	2022-02-14 21:35:32
lib.pkp.classes.task.StatisticsReport	2022-02-14 21:35:32
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

COPY public.sections (section_id, server_id, review_form_id, seq, editor_restricted, meta_indexed, meta_reviewed, abstracts_not_required, hide_title, hide_author, is_inactive, abstract_word_count) FROM stdin;
1	1	0	0	0	1	1	0	0	0	0	\N
\.


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 1, true);


--
-- Data for Name: server_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.server_settings (server_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##	\N
1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##	\N
1	fr_CA	readerInformation	##default.contextSettings.forReaders##	\N
1	en_US	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"La soumission n'a pas déjà été publiée et n'est pas considérée actuellement par un autre serveur. Si ce n'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice »."},{"order":2,"content":"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect."},{"order":3,"content":"Lorsque possible, les URL des références ont été fournies."},{"order":4,"content":"##default.contextSettings.checklist.submissionAppearance##"},{"order":5,"content":"##default.contextSettings.checklist.bibliographicRequirements##"}]	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously posted."},{"order":2,"content":"The submission file is in OpenOffice, Microsoft Word, or RTF document file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines."}]	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		themePluginPath	default	\N
1	en_US	abbreviation	publicknowledgePub Know Pre	\N
1		enableAuthorScreening	0	\N
1		enableOai	1	\N
1		country	IS	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		defaultReviewMode	2	\N
1		copySubmissionAckPrimaryContact	0	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	name	Public Knowledge Preprint Server	\N
1	fr_CA	name	Serveur de prépublication de la connaissance du public	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1	en_US	acronym	JPKPKP	\N
1	fr_CA	authorInformation	##default.contextSettings.forAuthors##	\N
1		copySubmissionAckAddress		\N
1		emailSignature	<br/><hr /><br/><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto: {$contactEmail}">{$contactEmail}</a></p>	\N
1		disableSubmissions	0	\N
1	en_US	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	en_US	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.	\N
1		contactEmail	rvaca@mailinator.com	\N
1		itemsPerPage	25	\N
1		keywords	request	\N
1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>	\N
1		contactName	Ramiro Vaca	\N
1	en_US	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source system is suitable for libraries to host for their faculty members to use (see <a href="http://pkp.sfu.ca">Public Knowledge Project</a>).	\N
\.


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.servers (server_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en_US	1
\.


--
-- Name: servers_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.servers_server_id_seq', 1, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
ftvmjtslo6ho6n3dptafob01j8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874529	1644874529	0		localhost
r0qqoa9rtngb073kaubetj1d5o	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874634	1644874662	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1644874662;s:5:"token";s:32:"3e0626076b6480ad2b02855014733887";}	localhost
mtqhqiqgtatjkcg0ij6ugi5q90	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874559	1644874565	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1644874565;s:5:"token";s:32:"f7d98d27226befe7339ef657f237ddaf";}	localhost
5egtfr146gddm8rnmq77efaa8b	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874545	1644874559	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1644874559;s:5:"token";s:32:"a0e99e4d2b0ca6a0fefd10e115f3ebb5";}	localhost
ef2febpi27c33qk0423tt22o09	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874565	1644874574	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1644874574;s:5:"token";s:32:"85f1a72da2bcbd98bd963d0f327ea2f9";}	localhost
3onqtukbic3a234v2mfk0vhmsb	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874889	1644874920	0	csrf|a:2:{s:9:"timestamp";i:1644874920;s:5:"token";s:32:"10a0ab425a1e65e154a1a4514e8a5650";}username|s:7:"dbarnes";userId|i:3;	localhost
hjn0jpj5n4jb45numsa5f37jqh	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874532	1644874545	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1644874545;s:5:"token";s:32:"079b8724562a2b52f124e596a55cb8bd";}	localhost
f3uueigamio3q6q8jg55i2j69r	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874922	1644874954	0	csrf|a:2:{s:9:"timestamp";i:1644874954;s:5:"token";s:32:"fb226d1951352c437de426e88d8bd9bf";}username|s:7:"dbarnes";userId|i:3;	localhost
m8arh04kis6lgcncrm9fbk4p2r	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874627	1644874634	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1644874634;s:5:"token";s:32:"8f247d5beca307accafb7a4eaa140fb2";}	localhost
hbs006sge1qr28b8e3n3qe1s7i	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874788	1644874820	0	csrf|a:2:{s:9:"timestamp";i:1644874820;s:5:"token";s:32:"56c6029b6ec0fb5a185109d13a4069c0";}username|s:7:"dbarnes";userId|i:3;	localhost
h7lblvemmkmamqihgbjm1hfs9j	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874576	1644874625	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1644874625;s:5:"token";s:32:"cf790843eec1fcd2b9ae0773edef004d";}	localhost
00ptc4scjsok7e5g3i83s0vsge	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874956	1644874988	0	csrf|a:2:{s:9:"timestamp";i:1644874988;s:5:"token";s:32:"18030343e0e23ab62da874a8adf38980";}username|s:7:"dbarnes";userId|i:3;	localhost
m39crbmammvqikvj1jchptbb84	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874688	1644874718	0	csrf|a:2:{s:9:"timestamp";i:1644874718;s:5:"token";s:32:"ea784d01eed1d46f261799016eeb14f0";}username|s:7:"dbarnes";userId|i:3;	localhost
rim7qs2k70o78dh62jmua0gm9k	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874989	1644875026	0	csrf|a:2:{s:9:"timestamp";i:1644875026;s:5:"token";s:32:"7e40ac1b001e9ac2a99395538781d43e";}username|s:7:"dbarnes";userId|i:3;	localhost
5uqs0t4i38f5oci5citv60kebo	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874663	1644874686	0	csrf|a:2:{s:9:"timestamp";i:1644874686;s:5:"token";s:32:"e262f798a730d878424154e83c2832c6";}username|s:7:"ccorino";userId|i:7;	localhost
dklugkvqs8gf172kkrqjlk7jm5	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874720	1644874755	0	csrf|a:2:{s:9:"timestamp";i:1644874755;s:5:"token";s:32:"a934471c56951817545076b5cd0f79bf";}username|s:7:"dbarnes";userId|i:3;	localhost
1imhprfkj2lh50349ei8onmpd9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875027	1644875060	0	csrf|a:2:{s:9:"timestamp";i:1644875060;s:5:"token";s:32:"37a5a791ae8877bc11b79bd3db63b847";}username|s:7:"dbarnes";userId|i:3;	localhost
84muv78u4g1qjs2qkniarqdpbj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875062	1644875094	0	csrf|a:2:{s:9:"timestamp";i:1644875094;s:5:"token";s:32:"32760c920cf6b80bcdc3b87d8ccbe8d9";}username|s:7:"dbarnes";userId|i:3;	localhost
8snr6t2c26eabisgsve9i5hsj3	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874757	1644874786	0	csrf|a:2:{s:9:"timestamp";i:1644874786;s:5:"token";s:32:"37271c5e0128259ef2d418f38d5936c1";}username|s:7:"dbarnes";userId|i:3;	localhost
i72cesd7ka1518gr6jsdmsmkrm	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874821	1644874851	0	csrf|a:2:{s:9:"timestamp";i:1644874851;s:5:"token";s:32:"06088ccf009d52491fe8b031b51ea3f2";}username|s:7:"dbarnes";userId|i:3;	localhost
8uf1f75o6u5ngngan8av8d5blj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644874853	1644874887	0	csrf|a:2:{s:9:"timestamp";i:1644874887;s:5:"token";s:32:"357898c4291099ef9056e3db58d2f37a";}username|s:7:"dbarnes";userId|i:3;	localhost
u8j3d8d6n95290fidvn9dg0db7	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875130	1644875161	0	csrf|a:2:{s:9:"timestamp";i:1644875161;s:5:"token";s:32:"488b05b1517ba67d24f7d2bea4590ab2";}username|s:7:"dbarnes";userId|i:3;	localhost
huircavsid5jkk3h666p0ti927	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875163	1644875197	0	csrf|a:2:{s:9:"timestamp";i:1644875197;s:5:"token";s:32:"0c237569249da47cbc55e722250c9512";}username|s:7:"dbarnes";userId|i:3;	localhost
kqk3m7a59gtpbfr3lhp81204ti	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875096	1644875128	0	csrf|a:2:{s:9:"timestamp";i:1644875128;s:5:"token";s:32:"185bb08055803c935a2f2372aa806275";}username|s:7:"dbarnes";userId|i:3;	localhost
jmg0kbakm093dggvbsaufkujb2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875268	1644875299	0	csrf|a:2:{s:9:"timestamp";i:1644875299;s:5:"token";s:32:"9f7e4b5fc58f5542c695800005f92ab7";}username|s:7:"dbarnes";userId|i:3;	localhost
auus7k99klh33tto25r7j307f5	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875198	1644875232	0	csrf|a:2:{s:9:"timestamp";i:1644875233;s:5:"token";s:32:"5ca35f856eb7c8bcd1baf637f3612d6a";}username|s:7:"dbarnes";userId|i:3;	localhost
4hf6gr6khspt1ovj90p8v3944f	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1644875234	1644875266	0	csrf|a:2:{s:9:"timestamp";i:1644875267;s:5:"token";s:32:"3d21dc931322c3160f4de4e718a89bfb";}username|s:7:"dbarnes";userId|i:3;	localhost
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
1	1	4	7	2022-02-14 21:37:49	0	1
2	1	3	4	2022-02-14 21:38:06	0	1
3	1	3	5	2022-02-14 21:38:06	0	1
4	2	4	8	2022-02-14 21:38:14	0	1
5	2	3	4	2022-02-14 21:38:31	0	1
6	2	3	5	2022-02-14 21:38:31	0	1
7	3	4	9	2022-02-14 21:38:46	0	1
8	3	3	4	2022-02-14 21:39:07	0	1
9	3	3	5	2022-02-14 21:39:07	0	1
10	4	4	10	2022-02-14 21:39:23	0	1
11	4	3	4	2022-02-14 21:39:39	0	1
12	4	3	5	2022-02-14 21:39:39	0	1
13	5	4	11	2022-02-14 21:39:55	0	1
14	5	3	4	2022-02-14 21:40:12	0	1
15	5	3	5	2022-02-14 21:40:12	0	1
16	6	4	12	2022-02-14 21:40:28	0	1
17	6	3	4	2022-02-14 21:40:44	0	1
18	6	3	5	2022-02-14 21:40:44	0	1
19	7	4	13	2022-02-14 21:41:00	0	1
20	7	3	4	2022-02-14 21:41:20	0	1
21	7	3	5	2022-02-14 21:41:20	0	1
22	8	4	14	2022-02-14 21:41:37	0	1
23	8	3	4	2022-02-14 21:41:52	0	1
24	8	3	5	2022-02-14 21:41:52	0	1
25	9	4	15	2022-02-14 21:42:09	0	1
26	9	3	4	2022-02-14 21:42:26	0	1
27	9	3	5	2022-02-14 21:42:26	0	1
28	10	4	16	2022-02-14 21:42:43	0	1
29	10	3	4	2022-02-14 21:43:00	0	1
30	10	3	5	2022-02-14 21:43:00	0	1
31	11	4	17	2022-02-14 21:43:17	0	1
32	11	3	4	2022-02-14 21:43:36	0	1
33	11	3	5	2022-02-14 21:43:36	0	1
34	12	4	18	2022-02-14 21:43:55	0	1
35	12	3	4	2022-02-14 21:44:12	0	1
36	12	3	5	2022-02-14 21:44:12	0	1
37	13	4	19	2022-02-14 21:44:29	0	1
38	13	3	4	2022-02-14 21:44:47	0	1
39	13	3	5	2022-02-14 21:44:47	0	1
40	14	4	20	2022-02-14 21:45:03	0	1
41	14	3	4	2022-02-14 21:45:20	0	1
42	14	3	5	2022-02-14 21:45:20	0	1
43	15	4	21	2022-02-14 21:45:37	0	1
44	15	3	4	2022-02-14 21:45:53	0	1
45	15	3	5	2022-02-14 21:45:53	0	1
46	16	4	22	2022-02-14 21:46:11	0	1
47	16	3	4	2022-02-14 21:46:29	0	1
48	16	3	5	2022-02-14 21:46:29	0	1
49	17	4	23	2022-02-14 21:46:46	0	1
50	17	3	4	2022-02-14 21:47:04	0	1
51	17	3	5	2022-02-14 21:47:04	0	1
52	18	4	24	2022-02-14 21:47:22	0	1
53	18	3	4	2022-02-14 21:47:38	0	1
54	18	3	5	2022-02-14 21:47:38	0	1
55	19	4	25	2022-02-14 21:47:56	0	1
56	19	3	4	2022-02-14 21:48:11	0	1
57	19	3	5	2022-02-14 21:48:11	0	1
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 57, true);


--
-- Data for Name: subeditor_submission_group; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.subeditor_submission_group (context_id, assoc_id, assoc_type, user_id) FROM stdin;
1	1	530	4
1	1	530	5
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
1	1	1	\N	1	10	\N	\N	\N	2022-02-14 21:37:59	2022-02-14 21:38:02	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2022-02-14 21:38:24	2022-02-14 21:38:27	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2022-02-14 21:38:56	2022-02-14 21:38:59	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2022-02-14 21:39:33	2022-02-14 21:39:35	10	521	4
5	5	5	\N	1	10	\N	\N	\N	2022-02-14 21:40:04	2022-02-14 21:40:07	11	521	5
6	6	6	\N	1	10	\N	\N	\N	2022-02-14 21:40:38	2022-02-14 21:40:40	12	521	6
7	7	7	\N	1	10	\N	\N	\N	2022-02-14 21:41:10	2022-02-14 21:41:12	13	521	7
8	8	8	\N	1	10	\N	\N	\N	2022-02-14 21:41:46	2022-02-14 21:41:49	14	521	8
9	9	9	\N	1	10	\N	\N	\N	2022-02-14 21:42:19	2022-02-14 21:42:21	15	521	9
10	10	10	\N	1	10	\N	\N	\N	2022-02-14 21:42:53	2022-02-14 21:42:55	16	521	10
11	11	11	\N	1	10	\N	\N	\N	2022-02-14 21:43:27	2022-02-14 21:43:29	17	521	11
12	12	12	\N	1	10	\N	\N	\N	2022-02-14 21:44:05	2022-02-14 21:44:07	18	521	12
13	13	13	\N	1	10	\N	\N	\N	2022-02-14 21:44:39	2022-02-14 21:44:42	19	521	13
14	14	14	\N	1	10	\N	\N	\N	2022-02-14 21:45:13	2022-02-14 21:45:15	20	521	14
15	15	15	\N	1	10	\N	\N	\N	2022-02-14 21:45:47	2022-02-14 21:45:50	21	521	15
16	16	16	\N	1	10	\N	\N	\N	2022-02-14 21:46:22	2022-02-14 21:46:24	22	521	16
17	17	17	\N	1	10	\N	\N	\N	2022-02-14 21:46:56	2022-02-14 21:46:58	23	521	17
18	18	18	\N	1	10	\N	\N	\N	2022-02-14 21:47:32	2022-02-14 21:47:34	24	521	18
19	19	19	\N	1	10	\N	\N	\N	2022-02-14 21:48:05	2022-02-14 21:48:08	25	521	19
\.


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 19, true);


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	carlo
2	corino
3	university
4	bologna
5	catherine
6	kwantes
7	windsor
8	facets
9	job
10	satisfaction
11	nine-nation
12	comparative
13	study
14	construct
15	equivalence
16	archival
17	data
18	attitude
19	survey
20	employees
21	single
22	multinational
23	organization
24	examine
25	degree
26	national
27	culture
28	affects
29	nature
30	responses
31	countries
32	compiled
33	create
34	benchmark
35	nations
36	individually
37	compared
38	factor
39	analysis
40	revealed
41	factors
42	organizational
43	communication
44	efficiency
45	effectiveness
46	support
47	personal
48	benefit
49	comparisons
50	structures
51	exhibited
52	satisfied
53	china
54	brazil
55	consistent
56	previous
57	findings
58	individuals
59	collectivistic
60	report
61	higher
62	research
63	suggest
64	cultural
65	context
66	exerts
67	effect
68	craig
69	montgomerie
70	alberta
71	mark
72	irvine
73	victoria
74	computer
75	skill
76	requirements
77	existing
78	teachers
79	implications
80	policy
81	practice
82	integration
83	technology
84	classroom
85	major
86	issue
87	education
88	today
89	provincial
90	initiatives
91	skills
92	students
93	demonstrate
94	grade
95	level
96	government
97	province
98	canada
99	mandated
100	implementation
101	curriculum
102	began
103	september
104	called
105	information
106	infused
107	core
108	courses
109	specifies
110	“expected
111	respect
112	technology”
113	learning
114	required
115	implement
116	school
117	jurisdictions
118	turning
119	professional
120	development
121	strategies
122	hiring
123	standards
124	upgrade
125	teachers’
126	meet
127	goal
128	paper
129	summarizes
130	results
131	telephone
132	administered
133	public
134	response
135	rate
136	examined
137	require
138	newly
139	hired
140	employed
141	integrating
142	diaga
143	diouf
144	alexandria
145	genetic
146	transformation
147	forest
148	trees
149	review
150	recent
151	progress
152	discussed
153	applications
154	engineering
155	improving
156	understanding
157	mechanisms
158	governing
159	genes
160	expression
161	woody
162	plants
163	dana
164	phillips
165	toronto
166	investigating
167	shared
168	background
169	argument
170	critique
171	fogelins
172	thesis
173	deep
174	disagreement
175	robert
176	fogelin
177	claims
178	interlocutors
179	share
180	framework
181	beliefs
182	commitments
183	order
184	fruitfully
185	pursue
186	refute
187	fogelin’s
188	claim
189	productive
190	find
191	consists
192	common
193	topic
194	hand
195	pro-cedural
196	competencies
197	supporters
198	mistakenly
199	view
200	part
201	procedural
202	com-mitments
203	difficult
204	uphold
205	people’s
206	diverge
207	widely
208	domatilia
209	sokoloff
210	college
211	cork
212	developing
213	efficacy
214	equip
215	children
216	knowledge
217	self-belief
218	confident
219	informed
220	citizens
221	continue
222	learners
223	graduation
224	key
225	role
226	nurturing
227	learn
228	participate
229	society
230	conducted
231	social
232	studies
233	presented
234	showing
235	strategy
236	instruction
237	enhance
238	self-efficacy
239	creative
240	problem
241	solving
242	cps
243	taught
244	means
245	motivate
246	shown
247	positive
248	effects
249	valuable
250	involve
251	decision-making
252	leads
253	action
254	enhancing
255	motivation
256	citizenship
257	elinor
258	ostrom
259	indiana
260	frank
261	van
262	laerhoven
263	traditions
264	trends
265	commons
266	expe-
267	rienced
268	substantial
269	growth
270	past
271	decades1
272	distinguished
273	scholars
274	disciplines
275	long
276	studied
277	specific
278	resources
279	managed
280	mismanaged
281	times
282	places
283	coward
284	los
285	reyes
286	mackenzie
287	wittfogel
288	researchers
289	mid-1980s
290	contemporary
291	colleagues
292	work
293	sec-
294	tors
295	region
296	interest
297	regions
298	world
299	pool
300	resource
301	property
302	intellectual
303	developments
304	fabio
305	paglieri
306	rome
307	hansen
308	pinto
309	reason
310	reclaimed
311	john
312	mwandenga
313	cape
314	town
315	signalling
316	theory
317	dividends
318	literature
319	empirical
320	evidence
321	signaling
322	suggests
323	signal
324	future
325	prospects
326	firm
327	offer
328	conclusive
329	conflicting
330	financial
331	economists
332	practical
333	dividend
334	guidance
335	management
336	potential
337	investors
338	shareholding
339	corporate
340	investment
341	financing
342	distribution
343	decisions
344	continuous
345	function
346	rely
347	intuitive
348	evaluation
349	novak
350	aalborg
351	condensing
352	water
353	availability
354	models
355	focus
356	systems
357	texas
358	modeling
359	system
360	routinely
361	applied
362	administration
363	rights
364	permit
365	regional
366	statewide
367	planning
368	expanding
369	variety
370	endeavors
371	river
372	basins
373	state
374	reflects
375	permits
376	reservoirs
377	datasets
378	necessarily
379	large
380	complex
381	provide
382	decision-support
383	capabilities
384	developed
385	features
386	added
387	types
388	growing
389	enhanced
390	simplifying
391	simulation
392	input
393	methodology
394	condensed
395	dataset
396	selected
397	reservoir
398	impacts
399	accompanying
400	removed
401	original
402	complete
403	set
404	streamflows
405	represents
406	flows
407	basin
408	contained
409	model
410	included
411	develop
412	brazos
413	authority
414	based
415	modifying
416	karim
417	al-khafaji
418	stanford
419	margaret
420	morse
421	sustainable
422	design
423	service
424	environmental
425	sustainability
426	principles
427	vital
428	topics
429	largely
430	failed
431	address
432	service-learning
433	integrates
434	academic
435	setting
436	emerging
437	tool
438	leveraged
439	teach
440	engineers
441	present
442	experiences
443	chapter
444	involves
445	identification
446	projects
447	partner
448	organizations
449	student
450	led
451	project-based
452	internships
453	coordinated
454	successful
455	limitations
456	challenges
457	exist
458	directions
459	leo
460	christopher
461	australian
462	sodium
463	butyrate
464	improves
465	performance
466	weaned
467	piglets
468	period
469	weaning
470	aim
471	assess
472	influence
473	long-term
474	fat
475	supplementation
476	fatty
477	acid
478	profile
479	heavy
480	pig
481	adipose
482	tissue
483	fifty-four
484	white
485	barrows
486	averaging
487	randomized
488	matched
489	weights
490	isoenergetic
491	diets
492	supplemented
493	tallow
494	maize
495	oil
496	rapeseed
497	fats
498	supplement-
499	fed
500	slaughtering
501	slaughter
502	backfat
503	samples
504	collected
505	ten
506	animals
507	treatment
508	analyzed
509	composition
510	close-
511	reflected
512	pigs
513	highest
514	saturated
515	content
516	sfa
517	polyunsaturated
518	pufa
519	lowest
520	monounsaturated
521	mufa
522	linolenic
523	c18
524	cis
525	11-
526	ecosenoic
527	c20
528	linoleic
529	levels
530	iodine
531	result-
532	ing
533	accepted
534	parma
535	consortium
536	dry-cured
537	ham
538	unsaturation
539	index
540	layers
541	subcutaneous
542	differed
543	significantly
544	treatments
545	show
546	dietary
547	increases
548	proportion
549	“healthy”
550	acids
551	nutritional
552	quality
553	technological
554	carefully
555	assessed
556	food
557	security
558	lise
559	kumiega
560	hydrologic
561	connectivity
562	edwards
563	aquifer
564	san
565	marcos
566	springs
567	barton
568	drought
569	conditions
570	serves
571	primary
572	supply
573	south-central
574	source
575	plan
576	protect
577	endangered
578	species
579	immediately
580	downstream
581	questions
582	raised
583	established
584	concept
585	divide
586	antonio
587	segments
588	water-level
589	collection
590	program
591	hydrogeologic
592	groundwater-level
593	groundwater
594	exists
595	vicinity
596	surface
597	drainage
598	onion
599	creek
600	blanco
601	wet
602	normal
603	dissipated
604	longer
605	hydrologically
606	separated
607	result
608	flow
609	droughts
610	bearings
611	assessments
612	simulations
613	numerical
614	cfs
615	flowing
616	appears
617	influenced
618	recharge
619	vulnerable
620	extended
621	periods
622	extensive
623	pumping
624	kyle
625	buda
626	shows
627	low
628	gradient
629	potentiometric
630	variation
631	non-drought
632	slopes
633	north
634	dramatic
635	discontinuity
636	change
637	gradients
638	dynamic
639	unknown
640	structural
641	influences
642	hydraulic
643	properties
644	inherent
645	connection
646	rapid
647	population
648	increased
649	demands
650	areas
651	necessitates
652	continual
653	monitoring
654	trend
655	analyses
656	patricia
657	daniel
658	wolverhampton
659	designing
660	intercultural
661	case
662	atlantic
663	coast
664	nicaragua
665	met
666	21st
667	century
668	genuinely
669	embracing
670	diversity
671	overcome
672	barriers
673	people
674	basis
675	language
676	gender
677	takes
678	multilingual
679	multiethnic
680	examines
681	community
682	uraccan
683	contributing
684	interculturality
685	describes
686	participatory
687	carried
688	staff
689	intention
690	defining
691	delivering
692	discussions
693	wales
694	council
695	emphasises
696	belonging
697	individual
698	communities
699	cultures
700	time
701	supporting
702	include
703	university’s
704	close
705	involvement
706	ethnic
707	ethno-linguistic
708	power
709	relations
710	country
711	militate
712	egalitarianism
713	highlights
714	importance
715	pedagogy
716	promoting
717	achieving
718	lasting
719	rana
720	baiyewu
721	nairobi
722	yam
723	diseases
724	nigeria
725	presents
726	combating
727	menace
728	field
729	storage
730	anthracnose
731	regarded
732	spread
733	mosaic
734	virus
735	disease
736	considered
737	severe
738	losses
739	yams
740	dry
741	rot
742	devastating
743	marked
744	reduction
745	quantity
746	marketable
747	edible
748	portions
749	tubers
750	reductions
751	stored
752	adopted
753	advocated
754	includes
755	crop
756	rotation
757	fallowing
758	planting
759	healthy
760	material
761	destruction
762	infected
763	cultivars
764	resistant
765	tecto
766	thiabendazole
767	locally
768	made
769	gins
770	wood
771	ash
772	found
773	fungal
774	infection
775	finally
776	processing
777	chips
778	cubes
779	shelf
780	live
781	months
782	year
783	rosanna
784	rossi
785	barcelona
786	nutrition
787	general
788	situation
789	cattle
790	slaughtered
791	cameroon
792	representative
793	central
794	african
795	sub-region
796	safety
797	beef
798	abattoir
799	yaoundé
800	largest
801	january
802	march
803	pre-slaughter
804	characteristics
805	carcasses
806	recorded
807	longissimus
808	thoracis
809	represent
810	bulls
811	parameters
812	origin
813	guinea
814	high
815	savannah
816	transhumance
817	production
818	gudali
819	fulani
820	red
821	mbororo
822	breeds
823	predominant
824	carcass
825	weight
826	affected
827	rearing
828	category
829	markedly
830	varied
831	meat
832	similar
833	showed
834	toughest
835	cows
836	pregnant
837	abnormal
838	encountered
839	ectoparasites
840	fatigue
841	lameness
842	fungal-like
843	skin
844	lesions
845	enlarged
846	lymph
847	nodes
848	respiratory
849	distress
850	nodular
851	organs
852	condemned
853	liver
854	flukes
855	completely
856	due
857	tuberculosis
858	lungs
859	aid
860	authorities
861	draw
862	programmes
863	strengthen
864	improve
865	control
866	prevent
867	observed
868	promote
869	trade
870	vajiheh
871	karbasizaed
872	tehran
873	antimicrobial
874	metal
875	resistance
876	plasmid
877	coliforms
878	isolated
879	nosocomial
880	infections
881	hospital
882	isfahan
883	iran
884	patterns
885	profiles
886	enterobacteriacea
887	human
888	faeces
889	fifteen
890	isolates
891	identified
892	escherichia
893	coli
894	remaining
895	kelebsiella
896	pneumoniae
897	seventy
898	percent
899	strains
900	possess
901	multiple
902	antibiotics
903	difference
904	minimal
905	inhibitory
906	concentration
907	mic
908	values
909	clinical
910	cases
911	metals
912	significant
913	tolerant
914	persons
915	relationship
916	group
917	pattern
918	conjugative
919	encoding
920	recovered
921	multidrug-resistance
922	valerie
923	williamson
924	self-organization
925	multi-level
926	institutions
927	networked
928	environments
929	compare
930	actors
931	decide
932	sanction
933	sanctions
934	implemented
935	collectively
936	agree
937	actor
938	sanctioned
939	collective
940	sanctioning
941	problematic
942	difficulty
943	reaching
944	consensus
945	decision
946	perverse
947	punishing
948	contributors
949	ruled
950	goverance
951	zita
952	woods
953	cuny
954	finocchiaro
955	arguments
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 955, true);


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_object_keywords (object_id, keyword_id, pos) FROM stdin;
1	1	0
1	2	1
1	3	2
1	4	3
9	5	0
9	6	1
9	3	2
9	7	3
10	8	0
10	9	1
10	10	2
10	11	3
10	12	4
10	13	5
10	14	6
10	15	7
11	16	0
11	17	1
11	18	2
11	19	3
11	20	4
11	21	5
11	22	6
11	23	7
11	24	8
11	25	9
11	26	10
11	27	11
11	28	12
11	29	13
11	9	14
11	10	15
11	30	16
11	31	17
11	32	18
11	33	19
11	34	20
11	35	21
11	36	22
11	37	23
11	38	24
11	39	25
11	40	26
11	41	27
11	42	28
11	43	29
11	42	30
11	44	31
11	45	32
11	42	33
11	46	34
11	47	35
11	48	36
11	49	37
11	38	38
11	50	39
11	42	40
11	43	41
11	51	42
11	14	43
11	15	44
11	47	45
11	48	46
11	52	47
11	20	48
11	53	49
11	52	50
11	54	51
11	55	52
11	56	53
11	57	54
11	58	55
11	59	56
11	35	57
11	60	58
11	61	59
11	10	60
11	62	61
11	57	62
11	63	63
11	26	64
11	64	65
11	65	66
11	66	67
11	67	68
11	29	69
11	9	70
11	10	71
13	20	0
13	19	1
17	68	0
17	69	1
17	3	2
17	70	3
17	71	4
17	72	5
17	3	6
17	73	7
18	74	0
18	75	1
18	76	2
18	77	3
18	78	4
18	79	5
18	80	6
18	81	7
19	82	0
19	83	1
19	84	2
19	85	3
19	86	4
19	87	5
19	88	6
19	26	7
19	89	8
19	90	9
19	83	10
19	91	11
19	92	12
19	93	13
19	94	14
19	95	15
19	96	16
19	97	17
19	70	18
19	98	19
19	99	20
19	100	21
19	101	22
19	102	23
19	103	24
19	104	25
19	105	26
19	43	27
19	83	28
19	101	29
19	106	30
19	107	31
19	108	32
19	109	33
19	92	34
19	110	35
19	111	36
19	112	37
19	70	38
19	113	39
19	78	40
19	114	41
19	115	42
19	101	43
19	116	44
19	117	45
19	118	46
19	119	47
19	120	48
19	121	49
19	122	50
19	123	51
19	124	52
19	125	53
19	74	54
19	91	55
19	126	56
19	127	57
19	128	58
19	129	59
19	130	60
19	131	61
19	19	62
19	132	63
19	133	64
19	116	65
19	117	66
19	97	67
19	70	68
19	134	69
19	135	70
19	136	71
19	74	72
19	91	73
19	116	74
19	117	75
19	137	76
19	138	77
19	139	78
19	78	79
19	46	80
19	121	81
19	140	82
19	140	83
19	78	84
21	141	0
21	83	1
21	74	2
21	91	3
21	19	4
21	70	5
21	26	6
21	89	7
21	119	8
21	120	9
25	142	0
25	143	1
25	144	2
25	3	3
26	145	0
26	146	1
26	147	2
26	148	3
27	149	0
27	150	1
27	151	2
27	145	3
27	146	4
27	147	5
27	148	6
27	152	7
27	153	8
27	145	9
27	154	10
27	155	11
27	147	12
27	148	13
27	156	14
27	157	15
27	158	16
27	159	17
27	160	18
27	161	19
27	162	20
33	163	0
33	164	1
33	3	2
33	165	3
34	166	0
34	167	1
34	168	2
34	114	3
34	169	4
34	170	5
34	171	6
34	172	7
34	173	8
34	174	9
35	175	0
35	176	1
35	177	2
35	178	3
35	179	4
35	180	5
35	168	6
35	181	7
35	182	8
35	183	9
35	184	10
35	185	11
35	169	12
35	186	13
35	187	14
35	188	15
35	166	16
35	167	17
35	168	18
35	114	19
35	189	20
35	169	21
35	190	22
35	168	23
35	191	24
35	192	25
35	181	26
35	193	27
35	194	28
35	167	29
35	195	30
35	182	31
35	196	32
35	63	33
35	176	34
35	197	35
35	198	36
35	199	37
35	167	38
35	181	39
35	200	40
35	114	41
35	168	42
35	189	43
35	169	44
35	201	45
35	202	46
35	203	47
35	204	48
35	205	49
35	181	50
35	206	51
35	207	52
35	193	53
35	194	54
41	208	0
41	209	1
41	3	2
41	210	3
41	211	4
42	212	0
42	213	1
42	181	2
42	84	3
43	85	0
43	127	1
43	87	2
43	214	3
43	215	4
43	216	5
43	91	6
43	217	7
43	218	8
43	219	9
43	220	10
43	220	11
43	221	12
43	222	13
43	223	14
43	128	15
43	224	16
43	225	17
43	226	18
43	213	19
43	181	20
43	183	21
43	227	22
43	228	23
43	116	24
43	229	25
43	62	26
43	57	27
43	230	28
43	231	29
43	232	30
43	65	31
43	233	32
43	234	33
43	235	34
43	236	35
43	237	36
43	238	37
43	113	38
43	200	39
43	62	40
43	239	41
43	240	42
43	241	43
43	242	44
43	243	45
43	215	46
43	244	47
43	245	48
43	46	49
43	113	50
43	246	51
43	242	52
43	247	53
43	248	54
43	238	55
43	113	56
43	249	57
43	180	58
43	250	59
43	215	60
43	251	61
43	252	62
43	231	63
43	253	64
43	79	65
43	254	66
43	238	67
43	255	68
43	227	69
43	84	70
43	152	71
45	87	0
45	256	1
49	257	0
49	258	1
49	259	2
49	3	3
49	260	4
49	261	5
49	262	6
49	259	7
49	3	8
50	263	0
50	264	1
50	13	2
50	265	3
51	13	0
51	265	1
51	266	2
51	267	3
51	268	4
51	269	5
51	120	6
51	270	7
51	271	8
51	272	9
51	273	10
51	274	11
51	275	12
51	276	13
51	277	14
51	278	15
51	279	16
51	280	17
51	281	18
51	282	19
51	283	20
51	284	21
51	285	22
51	286	23
51	287	24
51	288	25
51	276	26
51	277	27
51	265	28
51	289	29
51	290	30
51	291	31
51	219	32
51	292	33
51	273	34
51	274	35
51	293	36
51	294	37
51	295	38
51	296	39
51	297	40
51	298	41
53	192	0
53	299	1
53	300	2
53	192	3
53	301	4
53	302	5
53	303	6
57	304	0
57	305	1
57	3	2
57	306	3
58	307	0
58	308	1
58	309	2
58	310	3
65	311	0
65	312	1
65	3	2
65	313	3
65	314	4
66	315	0
66	316	1
66	317	2
66	149	3
66	318	4
66	319	5
66	320	6
67	321	0
67	316	1
67	322	2
67	317	3
67	323	4
67	324	5
67	325	6
67	326	7
67	150	8
67	319	9
67	320	10
67	327	11
67	328	12
67	320	13
67	86	14
67	329	15
67	80	16
67	79	17
67	330	18
67	331	19
67	332	20
67	333	21
67	80	22
67	334	23
67	335	24
67	77	25
67	336	26
67	337	27
67	338	28
67	339	29
67	340	30
67	341	31
67	342	32
67	343	33
67	344	34
67	345	35
67	335	36
67	333	37
67	343	38
67	346	39
67	347	40
67	348	41
73	311	0
73	349	1
73	350	2
73	3	3
74	351	0
74	352	1
74	353	2
74	354	3
74	355	4
74	277	5
74	352	6
74	335	7
74	356	8
75	357	0
75	352	1
75	353	2
75	358	3
75	359	4
75	360	5
75	361	6
75	362	7
75	352	8
75	363	9
75	364	10
75	359	11
75	365	12
75	366	13
75	367	14
75	368	15
75	369	16
75	370	17
75	358	18
75	352	19
75	335	20
75	371	21
75	372	22
75	373	23
75	374	24
75	352	25
75	375	26
75	376	27
75	377	28
75	378	29
75	379	30
75	380	31
75	381	32
75	382	33
75	383	34
75	358	35
75	359	36
75	384	37
75	358	38
75	385	39
75	386	40
75	387	41
75	153	42
75	388	43
75	153	44
75	389	45
75	390	46
75	391	47
75	392	48
75	377	49
75	355	50
75	352	51
75	335	52
75	356	53
75	393	54
75	233	55
75	212	56
75	394	57
75	395	58
75	396	59
75	397	60
75	359	61
75	374	62
75	398	63
75	352	64
75	363	65
75	399	66
75	376	67
75	400	68
75	401	69
75	402	70
75	395	71
75	403	72
75	404	73
75	384	74
75	405	75
75	406	76
75	396	77
75	359	78
75	248	79
75	352	80
75	363	81
75	371	82
75	407	83
75	408	84
75	401	85
75	402	86
75	409	87
75	392	88
75	395	89
75	410	90
75	394	91
75	395	92
75	393	93
75	361	94
75	411	95
75	394	96
75	409	97
75	412	98
75	371	99
75	413	100
75	397	101
75	359	102
75	414	103
75	415	104
75	357	105
75	352	106
75	353	107
75	358	108
75	359	109
75	395	110
75	412	111
75	371	112
75	407	113
77	352	0
81	416	0
81	417	1
81	418	2
81	3	3
81	419	4
81	420	5
81	418	6
81	3	7
82	113	0
82	421	1
82	422	2
82	423	3
83	424	0
83	425	1
83	421	2
83	120	3
83	426	4
83	427	5
83	428	6
83	154	7
83	87	8
83	429	9
83	430	10
83	431	11
83	432	12
83	433	13
83	231	14
83	423	15
83	434	16
83	435	17
83	436	18
83	437	19
83	438	20
83	439	21
83	421	22
83	422	23
83	324	24
83	440	25
83	441	26
83	409	27
83	432	28
83	439	29
83	421	30
83	422	31
83	414	32
83	442	33
83	418	34
83	443	35
83	440	36
83	421	37
83	298	38
83	409	39
83	444	40
83	445	41
83	446	42
83	447	43
83	448	44
83	449	45
83	450	46
83	451	47
83	422	48
83	452	49
83	453	50
83	447	51
83	448	52
83	409	53
83	454	54
83	455	55
83	456	56
83	457	57
83	152	58
83	324	59
83	458	60
83	368	61
83	409	62
85	120	0
85	154	1
85	87	2
85	423	3
85	113	4
85	425	5
89	459	0
89	460	1
89	461	2
89	26	3
89	3	4
90	462	0
90	463	1
90	464	2
90	269	3
90	465	4
90	466	5
90	467	6
90	468	7
90	469	8
91	470	0
91	13	1
91	471	2
91	472	3
91	473	4
91	474	5
91	475	6
91	476	7
91	477	8
91	478	9
91	479	10
91	480	11
91	481	12
91	482	13
91	483	14
91	379	15
91	484	16
91	485	17
91	486	18
91	487	19
91	488	20
91	489	21
91	490	22
91	491	23
91	492	24
91	493	25
91	494	26
91	495	27
91	496	28
91	495	29
91	497	30
91	498	31
91	499	32
91	500	33
91	501	34
91	502	35
91	503	36
91	504	37
91	505	38
91	506	39
91	507	40
91	508	41
91	476	42
91	477	43
91	509	44
91	502	45
91	510	46
91	511	47
91	476	48
91	477	49
91	509	50
91	492	51
91	497	52
91	502	53
91	512	54
91	499	55
91	513	56
91	514	57
91	476	58
91	477	59
91	515	60
91	516	61
91	499	62
91	513	63
91	515	64
91	517	65
91	476	66
91	477	67
91	518	68
91	519	69
91	520	70
91	476	71
91	477	72
91	521	73
91	515	74
91	499	75
91	513	76
91	515	77
91	522	78
91	477	79
91	523	80
91	524	81
91	525	82
91	526	83
91	477	84
91	527	85
91	507	86
91	67	87
91	528	88
91	477	89
91	529	90
91	530	91
91	502	92
91	531	93
91	532	94
91	529	95
91	61	96
91	523	97
91	533	98
91	534	99
91	535	100
91	536	101
91	537	102
91	538	103
91	539	104
91	540	105
91	541	106
91	502	107
91	482	108
91	542	109
91	543	110
91	544	111
91	130	112
91	545	113
91	473	114
91	546	115
91	475	116
91	497	117
91	476	118
91	477	119
91	478	120
91	479	121
91	480	122
91	481	123
91	482	124
91	475	125
91	496	126
91	495	127
91	547	128
91	548	129
91	549	130
91	476	131
91	550	132
91	480	133
91	474	134
91	155	135
91	551	136
91	552	137
91	248	138
91	553	139
91	552	140
91	474	141
91	554	142
91	555	143
93	512	0
93	556	1
93	557	2
97	558	0
97	559	1
97	3	2
97	313	3
97	314	4
98	560	0
98	561	1
98	562	2
98	563	3
98	564	4
98	565	5
98	566	6
98	567	7
98	566	8
98	568	9
98	569	10
99	562	0
99	563	1
99	570	2
99	571	3
99	352	4
99	572	5
99	573	6
99	357	7
99	574	8
99	85	9
99	566	10
99	212	11
99	575	12
99	576	13
99	577	14
99	578	15
99	579	16
99	580	17
99	564	18
99	565	19
99	566	20
99	581	21
99	582	22
99	583	23
99	584	24
99	560	25
99	585	26
99	564	27
99	586	28
99	567	29
99	566	30
99	587	31
99	562	32
99	563	33
99	568	34
99	569	35
99	431	36
99	581	37
99	588	38
99	17	39
99	589	40
99	590	41
99	591	42
99	13	43
99	230	44
99	39	45
99	592	46
99	17	47
99	593	48
99	585	49
99	594	50
99	595	51
99	596	52
99	597	53
99	585	54
99	598	55
99	599	56
99	600	57
99	371	58
99	601	59
99	602	60
99	560	61
99	569	62
99	39	63
99	17	64
99	504	65
99	568	66
99	322	67
99	593	68
99	585	69
99	603	70
99	604	71
99	605	72
99	606	73
99	587	74
99	607	75
99	336	76
99	593	77
99	608	78
99	270	79
99	564	80
99	565	81
99	566	82
99	567	83
99	566	84
99	85	85
99	609	86
99	79	87
99	610	88
99	335	89
99	353	90
99	593	91
99	562	92
99	563	93
99	611	94
99	612	95
99	613	96
99	409	97
99	63	98
99	614	99
99	615	100
99	270	101
99	564	102
99	565	103
99	567	104
99	566	105
99	568	106
99	569	107
99	593	108
99	585	109
99	616	110
99	617	111
99	618	112
99	598	113
99	599	114
99	600	115
99	371	116
99	616	117
99	619	118
99	620	119
99	621	120
99	618	121
99	622	122
99	623	123
99	595	124
99	624	125
99	625	126
99	17	127
99	403	128
99	626	129
99	627	130
99	628	131
99	629	132
99	596	133
99	564	134
99	565	135
99	566	136
99	624	137
99	630	138
99	529	139
99	568	140
99	631	141
99	621	142
99	624	143
99	567	144
99	566	145
99	629	146
99	596	147
99	632	148
99	543	149
99	633	150
99	634	151
99	529	152
99	568	153
99	631	154
99	621	155
99	574	156
99	29	157
99	635	158
99	636	159
99	629	160
99	637	161
99	638	162
99	352	163
99	95	164
99	134	165
99	624	166
99	639	167
99	640	168
99	641	169
99	642	170
99	643	171
99	644	172
99	563	173
99	635	174
99	472	175
99	25	176
99	560	177
99	645	178
99	564	179
99	565	180
99	567	181
99	566	182
99	646	183
99	647	184
99	269	185
99	648	186
99	352	187
99	649	188
99	624	189
99	625	190
99	650	191
99	651	192
99	652	193
99	593	194
99	95	195
99	653	196
99	590	197
99	564	198
99	565	199
99	566	200
99	625	201
99	381	202
99	17	203
99	324	204
99	591	205
99	654	206
99	655	207
101	352	0
105	656	0
105	657	1
105	3	2
105	658	3
106	659	0
106	660	1
106	101	2
106	661	3
106	13	4
106	662	5
106	663	6
106	664	7
107	456	0
107	665	1
107	666	2
107	667	3
107	668	4
107	669	5
107	670	6
107	87	7
107	671	8
107	672	9
107	221	10
107	457	11
107	673	12
107	674	13
107	675	14
107	27	15
107	676	16
107	661	17
107	13	18
107	677	19
107	662	20
107	663	21
107	664	22
107	678	23
107	679	24
107	295	25
107	680	26
107	681	27
107	3	28
107	682	29
107	683	30
107	120	31
107	684	32
107	685	33
107	686	34
107	62	35
107	687	36
107	3	37
107	688	38
107	92	39
107	689	40
107	690	41
107	660	42
107	101	43
107	121	44
107	691	45
107	409	46
107	674	47
107	692	48
107	409	49
107	681	50
107	156	51
107	693	52
107	101	53
107	694	54
107	695	55
107	696	56
107	697	57
107	698	58
107	699	59
107	700	60
107	41	61
107	701	62
107	120	63
107	660	64
107	101	65
107	702	66
107	703	67
107	704	68
107	705	69
107	706	70
107	698	71
107	570	72
107	707	73
107	708	74
107	709	75
107	295	76
107	710	77
107	711	78
107	712	79
107	3	80
107	62	81
107	713	82
107	714	83
107	686	84
107	715	85
107	674	86
107	716	87
107	684	88
107	717	89
107	718	90
107	231	91
107	146	92
109	666	0
109	667	1
109	670	2
109	678	3
109	679	4
109	686	5
109	715	6
109	675	7
109	27	8
109	676	9
109	712	10
109	231	11
109	146	12
113	719	0
113	720	1
113	3	2
113	721	3
114	722	0
114	723	1
114	335	2
114	724	3
115	149	0
115	725	1
115	723	2
115	722	3
115	335	4
115	121	5
115	140	6
115	726	7
115	727	8
115	724	9
115	728	10
115	729	11
115	723	12
115	233	13
115	730	14
115	731	15
115	207	16
115	732	17
115	728	18
115	723	19
115	722	20
115	733	21
115	734	22
115	735	23
115	736	24
115	737	25
115	738	26
115	739	27
115	740	28
115	741	29
115	736	30
115	742	31
115	729	32
115	723	33
115	722	34
115	740	35
115	741	36
115	739	37
115	743	38
115	744	39
115	745	40
115	746	41
115	747	42
115	748	43
115	749	44
115	750	45
115	737	46
115	751	47
115	739	48
115	335	49
115	121	50
115	752	51
115	753	52
115	726	53
115	728	54
115	723	55
115	754	56
115	755	57
115	756	58
115	757	59
115	758	60
115	759	61
115	760	62
115	761	63
115	762	64
115	755	65
115	763	66
115	764	67
115	763	68
115	729	69
115	723	70
115	765	71
115	766	72
115	767	73
115	768	74
115	740	75
115	769	76
115	770	77
115	771	78
115	729	79
115	772	80
115	576	81
115	722	82
115	749	83
115	773	84
115	774	85
115	729	86
115	775	87
115	776	88
115	722	89
115	749	90
115	777	91
115	778	92
115	547	93
115	779	94
115	780	95
115	468	96
115	781	97
115	782	98
121	783	0
121	784	1
121	785	2
121	3	3
122	472	0
122	473	1
122	786	2
122	546	3
122	497	4
122	476	5
122	477	6
122	509	7
122	479	8
122	512	9
122	502	10
123	470	0
123	62	1
123	381	2
123	787	3
123	788	4
123	789	5
123	790	6
123	791	7
123	792	8
123	793	9
123	794	10
123	795	11
123	552	12
123	796	13
123	797	14
123	798	15
123	799	16
123	800	17
123	791	18
123	736	19
123	801	20
123	802	21
123	803	22
123	569	23
123	804	24
123	789	25
123	805	26
123	806	27
123	807	28
123	808	29
123	501	30
123	805	31
123	396	32
123	809	33
123	810	34
123	790	35
123	552	36
123	811	37
123	509	38
123	807	39
123	808	40
123	687	41
123	812	42
123	789	43
123	813	44
123	814	45
123	815	46
123	816	47
123	192	48
123	817	49
123	359	50
123	818	51
123	484	52
123	819	53
123	820	54
123	821	55
123	822	56
123	823	57
123	824	58
123	825	59
123	826	60
123	827	61
123	359	62
123	789	63
123	828	64
123	829	65
123	830	66
123	782	67
123	831	68
123	552	69
123	474	70
123	515	71
123	627	72
123	832	73
123	822	74
123	818	75
123	833	76
123	834	77
123	831	78
123	835	79
123	790	80
123	836	81
123	192	82
123	837	83
123	569	84
123	838	85
123	839	86
123	840	87
123	841	88
123	842	89
123	843	90
123	844	91
123	845	92
123	846	93
123	847	94
123	848	95
123	849	96
123	850	97
123	844	98
123	805	99
123	851	100
123	852	101
123	853	102
123	854	103
123	855	104
123	852	105
123	856	106
123	857	107
123	826	108
123	858	109
123	17	110
123	859	111
123	860	112
123	861	113
123	862	114
123	470	115
123	863	116
123	789	117
123	817	118
123	864	119
123	797	120
123	572	121
123	865	122
123	866	123
123	867	124
123	723	125
123	868	126
123	365	127
123	869	128
125	789	0
125	556	1
125	557	2
129	870	0
129	871	1
129	3	2
129	872	3
130	873	0
130	479	1
130	874	2
130	875	3
130	876	4
130	478	5
130	877	6
130	878	7
130	879	8
130	880	9
130	881	10
130	882	11
130	883	12
131	873	0
131	479	1
131	874	2
131	875	3
131	884	4
131	876	5
131	885	6
131	877	7
131	886	8
131	878	9
131	879	10
131	880	11
131	759	12
131	887	13
131	888	14
131	37	15
131	889	16
131	890	17
131	879	18
131	880	19
131	891	20
131	892	21
131	893	22
131	894	23
131	895	24
131	896	25
131	897	26
131	898	27
131	899	28
131	878	29
131	879	30
131	880	31
131	900	32
131	901	33
131	875	34
131	902	35
131	37	36
131	899	37
131	759	38
131	887	39
131	888	40
131	903	41
131	904	42
131	905	43
131	906	44
131	907	45
131	908	46
131	899	47
131	909	48
131	910	49
131	888	50
131	479	51
131	911	52
131	912	53
131	899	54
131	878	55
131	881	56
131	913	57
131	479	58
131	874	59
131	759	60
131	914	61
131	55	62
131	915	63
131	876	64
131	478	65
131	916	66
131	873	67
131	875	68
131	917	69
131	918	70
131	876	71
131	919	72
131	875	73
131	479	74
131	911	75
131	902	76
131	920	77
131	899	78
131	878	79
131	879	80
131	880	81
131	130	82
131	921	83
131	877	84
131	336	85
131	879	86
131	774	87
131	295	88
137	922	0
137	923	1
137	3	2
137	7	3
138	924	0
138	925	1
138	926	2
138	927	3
138	928	4
139	929	0
139	435	1
139	930	2
139	36	3
139	931	4
139	932	5
139	435	6
139	933	7
139	934	8
139	930	9
139	935	10
139	936	11
139	937	12
139	938	13
139	939	14
139	940	15
139	343	16
139	941	17
139	856	18
139	942	19
139	943	20
139	944	21
139	945	22
139	768	23
139	935	24
139	946	25
139	940	26
139	947	27
139	814	28
139	948	29
139	697	30
139	930	31
139	949	32
139	939	33
139	940	34
139	343	35
139	296	36
139	916	37
141	924	0
141	925	1
141	926	2
141	950	3
145	951	0
145	952	1
145	953	2
146	954	0
146	955	1
146	955	2
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
1	1	1	0
2	1	2	0
3	1	4	0
4	1	16	0
5	1	17	0
6	1	8	0
7	1	32	0
8	1	64	0
9	2	1	0
10	2	2	0
11	2	4	0
12	2	16	0
13	2	17	0
14	2	8	0
15	2	32	0
16	2	64	0
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
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
14	1	14	2022-02-14 21:45:28	2022-02-14 21:45:20	2022-02-14 21:45:28	5	en_US	3	0	0
6	1	6	2022-02-14 21:40:51	2022-02-14 21:40:44	2022-02-14 21:40:51	5	en_US	3	0	0
10	1	10	2022-02-14 21:43:07	2022-02-14 21:42:59	2022-02-14 21:43:07	5	en_US	3	0	0
1	1	1	2022-02-14 21:38:06	2022-02-14 21:38:06	2022-02-14 21:38:06	5	en_US	1	0	0
15	1	15	2022-02-14 21:46:01	2022-02-14 21:45:53	2022-02-14 21:46:01	5	en_US	3	0	0
19	1	19	2022-02-14 21:48:19	2022-02-14 21:48:11	2022-02-14 21:48:19	5	en_US	3	0	0
2	1	2	2022-02-14 21:38:38	2022-02-14 21:38:31	2022-02-14 21:38:38	5	en_US	3	0	0
7	1	7	2022-02-14 21:41:28	2022-02-14 21:41:20	2022-02-14 21:41:28	5	en_US	3	0	0
11	1	11	2022-02-14 21:43:45	2022-02-14 21:43:36	2022-02-14 21:43:45	5	en_US	3	0	0
3	1	3	2022-02-14 21:39:15	2022-02-14 21:39:07	2022-02-14 21:39:15	5	en_US	3	0	0
16	1	16	2022-02-14 21:46:36	2022-02-14 21:46:29	2022-02-14 21:46:36	5	en_US	3	0	0
8	1	8	2022-02-14 21:42:00	2022-02-14 21:41:52	2022-02-14 21:42:00	5	en_US	3	0	0
12	1	12	2022-02-14 21:44:20	2022-02-14 21:44:12	2022-02-14 21:44:20	5	en_US	3	0	0
4	1	4	2022-02-14 21:39:46	2022-02-14 21:39:39	2022-02-14 21:39:46	5	en_US	3	0	0
9	1	9	2022-02-14 21:42:34	2022-02-14 21:42:26	2022-02-14 21:42:34	5	en_US	3	0	0
5	1	5	2022-02-14 21:40:19	2022-02-14 21:40:12	2022-02-14 21:40:19	5	en_US	3	0	0
13	1	13	2022-02-14 21:44:54	2022-02-14 21:44:47	2022-02-14 21:44:54	5	en_US	3	0	0
17	1	17	2022-02-14 21:47:12	2022-02-14 21:47:04	2022-02-14 21:47:12	5	en_US	3	0	0
18	1	18	2022-02-14 21:47:46	2022-02-14 21:47:38	2022-02-14 21:47:46	5	en_US	3	0	0
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

COPY public.usage_stats_temporary_records (assoc_id, assoc_type, representation_id, day, entry_time, metric, country_id, region, city, load_id, file_type) FROM stdin;
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

COPY public.user_settings (user_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	givenName	admin
7	en_US	affiliation	University of Bologna
7	en_US	familyName	Corino
7	en_US	givenName	Carlo
4	en_US	affiliation	University of Chicago
4	fr_CA	affiliation	
4	en_US	biography	
4	fr_CA	biography	
4	en_US	familyName	Buskins
4	fr_CA	familyName	
4	en_US	givenName	David
4	fr_CA	givenName	
4		orcid	
4	en_US	preferredPublicName	
4	fr_CA	preferredPublicName	
4	en_US	signature	
4	fr_CA	signature	
5	en_US	affiliation	University of Toronto
5	fr_CA	affiliation	
5	en_US	biography	
5	fr_CA	biography	
5	en_US	familyName	Berardo
5	fr_CA	familyName	
5	en_US	givenName	Stephanie
5	fr_CA	givenName	
5		orcid	
5	en_US	preferredPublicName	
5	fr_CA	preferredPublicName	
5	en_US	signature	
5	fr_CA	signature	
6	en_US	affiliation	Kyoto University
6	fr_CA	affiliation	
6	en_US	biography	
6	fr_CA	biography	
6	en_US	familyName	Inoue
6	fr_CA	familyName	
6	en_US	givenName	Minoti
6	fr_CA	givenName	
6		orcid	
6	en_US	preferredPublicName	
6	fr_CA	preferredPublicName	
6	en_US	signature	
6	fr_CA	signature	
8	en_US	affiliation	University of Windsor
8	en_US	familyName	Kwantes
8	en_US	givenName	Catherine
10	en_US	familyName	Diouf
10	en_US	givenName	Diaga
12	en_US	affiliation	University College Cork
12	en_US	familyName	Sokoloff
12	en_US	givenName	Domatilia
16	en_US	affiliation	Aalborg University
15	en_US	affiliation	University of Cape Town
15	en_US	familyName	Mwandenga
15	en_US	givenName	John
3	en_US	biography	
9	en_US	affiliation	University of Alberta
9	en_US	familyName	Montgomerie
9	en_US	givenName	Craig
17	en_US	affiliation	Stanford University
2	en_US	affiliation	Universidad Nacional Autónoma de México
2	fr_CA	affiliation	
2	en_US	biography	
2	fr_CA	biography	
2	en_US	familyName	Vaca
2	fr_CA	familyName	
2	en_US	givenName	Ramiro
2	fr_CA	givenName	
2		orcid	
2	en_US	preferredPublicName	
2	fr_CA	preferredPublicName	
2	en_US	signature	
2	fr_CA	signature	
17	en_US	familyName	Al-Khafaji
1	en_US	familyName	admin
13	en_US	affiliation	Indiana University
13	en_US	familyName	Ostrom
13	en_US	givenName	Elinor
17	en_US	givenName	Karim
3	en_US	signature	
10	en_US	affiliation	Alexandria University
11	en_US	affiliation	University of Toronto
11	en_US	familyName	Phillips
11	en_US	givenName	Dana
16	en_US	familyName	Novak
14	en_US	affiliation	University of Rome
14	en_US	familyName	Paglieri
14	en_US	givenName	Fabio
16	en_US	givenName	John
19	en_US	affiliation	University of Cape Town
19	en_US	familyName	Kumiega
19	en_US	givenName	Lise
3	fr_CA	familyName	
3	en_US	familyName	Barnes
20	en_US	affiliation	University of Wolverhampton
20	en_US	familyName	Daniel
3	en_US	givenName	Daniel
3	en_US	preferredPublicName	
18	en_US	affiliation	Australian National University
18	en_US	familyName	Christopher
18	en_US	givenName	Leo
3	fr_CA	signature	
3	fr_CA	affiliation	
20	en_US	givenName	Patricia
3	fr_CA	preferredPublicName	
21	en_US	affiliation	University of Nairobi
21	en_US	familyName	Baiyewu
21	en_US	givenName	Rana
3		orcid	
22	en_US	affiliation	Barcelona University
22	en_US	familyName	Rossi
22	en_US	givenName	Rosanna
3	fr_CA	givenName	
23	en_US	affiliation	University of Tehran
23	en_US	familyName	Karbasizaed
23	en_US	givenName	Vajiheh
3	fr_CA	biography	
24	en_US	familyName	Williamson
24	en_US	givenName	Valerie
24	en_US	affiliation	University of Windsor
25	en_US	affiliation	CUNY
25	en_US	familyName	Woods
25	en_US	givenName	Zita
3	en_US	affiliation	University of Melbourne
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
16	jnovak	$2y$10$2vnicwSZ79bgPLGns.lPQe1qneONsCrGoTqmTwBsQbsQJy58nM3zy	jnovak@mailinator.com	\N	\N	\N	\N	DK	\N	\N	\N	2022-02-14 21:42:39	\N	2022-02-14 21:42:40	\N	\N	\N	0	\N	1
17	kalkhafaji	$2y$10$lQ.cntUCmnrBxgN2SIK34OXLwRE7v8oifeLAb/SiByv7tp1zN7J7m	kalkhafaji@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-02-14 21:43:13	\N	2022-02-14 21:43:13	\N	\N	\N	0	\N	1
25	zwoods	$2y$10$h1jJADwjYkSRqroZaUEAzeDCWanlDhL9uWNUwFooyEQSrHbJuWYVS	zwoods@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-02-14 21:47:52	\N	2022-02-14 21:47:52	\N	\N	\N	0	\N	1
4	dbuskins	$2y$10$WGkhC00T7VvQHvCicgmgpOd209Kz725CtwoMu0Xh3XuK.A/JYMGmW	dbuskins@mailinator.com				\N	US	[]	\N	\N	2022-02-14 21:36:38	\N	\N	0	0	\N	0	\N	1
5	sberardo	$2y$10$xQ36uTgI5xjnqjFinUPdOOcbW753m7juXoj.wQo2wgdXLsvTw1xkq	sberardo@mailinator.com				\N	CA	[]	\N	\N	2022-02-14 21:36:47	\N	\N	0	0	\N	0	\N	1
6	minoue	$2y$10$nO.odNwgx/1z8d3mW8IvKuY9ZidBsv181eBgC.2I8mduqPpvSNpza	minoue@mailinator.com				\N	JP	[]	\N	\N	2022-02-14 21:36:55	\N	\N	0	0	\N	0	\N	1
18	lchristopher	$2y$10$sRLBcgQrRhGTO5UHhuPCTunRcQeIrPoZqsLHQe3phu3BiTZsJP4my	lchristopher@mailinator.com	\N	\N	\N	\N	AU	\N	\N	\N	2022-02-14 21:43:52	\N	2022-02-14 21:43:52	\N	\N	\N	0	\N	1
2	rvaca	$2y$10$DBTgIavYcnFqnpXcdWpF5OCwgrC4LS2i.Hy3qhBd6TJ5Q8vmCJ8ba	rvaca@mailinator.com				\N	MX	[]	\N	\N	2022-02-14 21:36:24	\N	2022-02-14 21:37:03	0	0	\N	0	\N	1
3	dbarnes	$2y$10$CAKLKK2OQMZ8LJBLRUpFqua5ELQKdCl4NqvT8xntH3k/qAqFDqf6O	dbarnes@mailinator.com				\N	AU	[]	\N	\N	2022-02-14 21:36:31	\N	2022-02-14 21:48:12	0	0	\N	0	\N	1
1	admin	$2y$10$DxRpsu6vOmxKtWACnGnXMuPzgNgx4YGCR8dCTBOeJHkmBUmaODiIq	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	\N	\N	\N	2022-02-14 21:35:28	\N	2022-02-14 21:37:14	\N	\N	\N	0	\N	1
7	ccorino	$2y$10$6pMT.GJW595s3oPsFPbva.WfBAzKnrAwAdwwuAcKMtY4cqEpMIKa2	ccorino@mailinator.com	\N	\N	\N	\N	IT	\N	\N	\N	2022-02-14 21:37:46	\N	2022-02-14 21:37:46	\N	\N	\N	0	\N	1
8	ckwantes	$2y$10$./Rp/zd5iEqdxGv4JsYS2uNa1PIz8solon6w1EktDPbdzfuxHzi/q	ckwantes@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-14 21:38:10	\N	2022-02-14 21:38:11	\N	\N	\N	0	\N	1
9	cmontgomerie	$2y$10$Vx.jCX8xotCkR5vk5Sizk.Wn2aSxlLjo18cxXxKhriC0UUX2V9wXq	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-14 21:38:43	\N	2022-02-14 21:38:43	\N	\N	\N	0	\N	1
19	lkumiega	$2y$10$K8Er8lCDQG5gSOxyL6WcWug4icwpYHaRYNdI4JsADYX3CiSDR3POa	lkumiega@mailinator.com	\N	\N	\N	\N	ZA	\N	\N	\N	2022-02-14 21:44:26	\N	2022-02-14 21:44:26	\N	\N	\N	0	\N	1
10	ddiouf	$2y$10$7zUFnY3zhENM9kB7ckDR9u/lSf/zQmGMME1b7hlNZZmYs2QWybHVe	ddiouf@mailinator.com	\N	\N	\N	\N	EG	\N	\N	\N	2022-02-14 21:39:20	\N	2022-02-14 21:39:20	\N	\N	\N	0	\N	1
11	dphillips	$2y$10$7GnMVJUV.QldIjQZX7VFleHB1uW06rScgy5Z.HBlHaCkZkBpnk1xq	dphillips@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-14 21:39:51	\N	2022-02-14 21:39:51	\N	\N	\N	0	\N	1
12	dsokoloff	$2y$10$GL3jLZ0WqGzMYgxCsOg15.1KhzOiBvGu1jpLgoS4vMWHpL6ZgJ7Be	dsokoloff@mailinator.com	\N	\N	\N	\N	IE	\N	\N	\N	2022-02-14 21:40:25	\N	2022-02-14 21:40:25	\N	\N	\N	0	\N	1
20	pdaniel	$2y$10$arq6dhlnUBaHQdpSZFskwO/9iEJkBca3vRhaS1DvZKyeBFqhh6wNC	pdaniel@mailinator.com	\N	\N	\N	\N	GB	\N	\N	\N	2022-02-14 21:45:00	\N	2022-02-14 21:45:00	\N	\N	\N	0	\N	1
13	eostrom	$2y$10$QoNbmWxxS4D.BxeGFQN9Mu.xgFjuxhqr4UZ.gPMPW15TZ2utYzxMy	eostrom@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-02-14 21:40:56	\N	2022-02-14 21:40:57	\N	\N	\N	0	\N	1
14	fpaglieri	$2y$10$xUHqhHahamMjudK5bS6e1eatde0bFDQTc3pJ/XeUXn88A.kADxRI2	fpaglieri@mailinator.com	\N	\N	\N	\N	IT	\N	\N	\N	2022-02-14 21:41:33	\N	2022-02-14 21:41:33	\N	\N	\N	0	\N	1
15	jmwandenga	$2y$10$SqdZbvMZzR9GTJHFyovDRO//YWwgFUTUu5gSnVF1iDsyqraJZ1vvW	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA	\N	\N	\N	2022-02-14 21:42:05	\N	2022-02-14 21:42:06	\N	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$bjfF4D7ems8dVEgJ8NW5G.aspyCtsaqQuTjCBVybPQ2fKxA2/EOSW	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE	\N	\N	\N	2022-02-14 21:45:34	\N	2022-02-14 21:45:34	\N	\N	\N	0	\N	1
22	rrossi	$2y$10$6SD0oRvzqvNRB.pQHIsPeekfPiOLHCpd9oVelPInUDD9q.VlCTdYK	rrossi@mailinator.com	\N	\N	\N	\N	ES	\N	\N	\N	2022-02-14 21:46:08	\N	2022-02-14 21:46:08	\N	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$auxrt6VeQz908MP4JgjQu.wNH32E30Uqb9RELgnmRMNI7jGiH/Nre	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR	\N	\N	\N	2022-02-14 21:46:43	\N	2022-02-14 21:46:43	\N	\N	\N	0	\N	1
24	vwilliamson	$2y$10$M.E2vHmuas3QoUNAeOHyqOGBczKn9IcXy8qsBLuTp7/3b/bjvUoKO	vwilliamson@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-14 21:47:18	\N	2022-02-14 21:47:19	\N	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2022-02-14 21:35:28	1	plugins.metadata	dc11		0	0
1	0	1	0	2022-02-14 21:35:28	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	2	0	0	2022-02-14 21:35:28	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.generic	crossrefDeposit	CrossrefDepositPlugin	1	0
1	2	0	0	2022-02-14 21:35:28	1	plugins.generic	acron	AcronPlugin	1	1
1	0	1	0	2022-02-14 21:35:28	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	1	3	0	2022-02-14 21:35:28	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	0	0	0	2022-02-14 21:35:28	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	1	0	0	2022-02-14 21:35:28	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.generic	usageEvent		0	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.importexport	native		0	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
1	0	0	0	2022-02-14 21:35:28	1	plugins.themes	default	DefaultThemePlugin	1	0
3	4	0	0	2022-02-14 21:35:28	1	core	ops		0	1
2	2	0	0	2022-02-14 21:35:43	1	plugins.importexport	crossref		0	0
1	1	0	0	2022-02-14 21:35:28	1	plugins.reports	counterReport		0	0
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
-- Name: failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


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
-- Name: review_assignment_reviewer_round_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignment_reviewer_round_unique UNIQUE (review_round_id, reviewer_id);


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
-- Name: server_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.server_settings
    ADD CONSTRAINT server_settings_pkey UNIQUE (server_id, locale, setting_name);


--
-- Name: servers_path; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_path UNIQUE (path);


--
-- Name: servers_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (server_id);


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
    ADD CONSTRAINT user_settings_pkey UNIQUE (user_id, locale, setting_name);


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
-- Name: announcement_types_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcement_types_context_id ON public.announcement_types USING btree (context_id);


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
-- Name: sections_server_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sections_server_id ON public.sections USING btree (server_id);


--
-- Name: server_settings_server_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX server_settings_server_id ON public.server_settings USING btree (server_id);


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
-- Name: announcement_settings_announcement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_announcement_id_foreign FOREIGN KEY (announcement_id) REFERENCES public.announcements(announcement_id);


--
-- Name: announcement_type_settings_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id);


--
-- Name: announcement_types_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id);


--
-- Name: announcements_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id);


--
-- Name: categories_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id);


--
-- Name: categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.categories(category_id);


--
-- Name: category_settings_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: publication_categories_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: publication_categories_publication_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_publication_id_foreign FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id);


--
-- Name: publication_galleys_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_assignments_review_form_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_review_form_id_foreign FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id);


--
-- Name: review_assignments_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id);


--
-- Name: review_assignments_reviewer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_reviewer_id_foreign FOREIGN KEY (reviewer_id) REFERENCES public.users(user_id);


--
-- Name: review_assignments_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id);


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

