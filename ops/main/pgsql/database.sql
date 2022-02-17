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
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_doi_id_foreign;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_submission_file_id_foreign;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_doi_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_publication_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_category_id_foreign;
ALTER TABLE ONLY public.dois DROP CONSTRAINT dois_context_id_foreign;
ALTER TABLE ONLY public.doi_settings DROP CONSTRAINT doi_settings_doi_id_foreign;
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
DROP INDEX public.doi_settings_doi_id;
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
ALTER TABLE ONLY public.dois DROP CONSTRAINT dois_pkey;
ALTER TABLE ONLY public.doi_settings DROP CONSTRAINT doi_settings_pkey;
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
ALTER TABLE public.dois ALTER COLUMN doi_id DROP DEFAULT;
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
DROP SEQUENCE public.dois_doi_id_seq;
DROP TABLE public.dois;
DROP TABLE public.doi_settings;
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
-- Name: doi_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.doi_settings (
    doi_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.doi_settings OWNER TO "ops-ci";

--
-- Name: dois; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.dois (
    doi_id bigint NOT NULL,
    context_id bigint NOT NULL,
    doi character varying(255) NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.dois OWNER TO "ops-ci";

--
-- Name: dois_doi_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.dois_doi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dois_doi_id_seq OWNER TO "ops-ci";

--
-- Name: dois_doi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.dois_doi_id_seq OWNED BY public.dois.doi_id;


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
    url_path character varying(64),
    doi_id bigint
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
    version bigint,
    doi_id bigint
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
-- Name: doi_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.dois ALTER COLUMN doi_id SET DEFAULT nextval('public.dois_doi_id_seq'::regclass);


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
3	en_US	affiliation	Academy of Finland
3	fr_CA	affiliation	\N
3	en_US	biography	\N
3	fr_CA	biography	\N
3		country	FI
3	en_US	familyName	Kekkonen
3	fr_CA	familyName	\N
3	en_US	givenName	Urho
3	fr_CA	givenName	\N
3	en_US	preferredPublicName	\N
3	fr_CA	preferredPublicName	\N
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
3	ukk@mailinator.com	1	2	0	4
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

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 1, true);


--
-- Data for Name: doi_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.doi_settings (doi_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: dois; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.dois (doi_id, context_id, doi, status) FROM stdin;
\.


--
-- Name: dois_doi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.dois_doi_id_seq', 1, false);


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
1	1048585	1	7	2022-02-17 19:13:35	268435458	submission.event.general.metadataUpdated	0
2	515	1	7	2022-02-17 19:13:45	1342177281	submission.event.fileUploaded	0
3	1048585	1	7	2022-02-17 19:13:45	1342177288	submission.event.fileRevised	0
4	515	1	7	2022-02-17 19:13:48	1342177296	submission.event.fileEdited	0
5	1048585	1	7	2022-02-17 19:13:48	1342177296	submission.event.fileEdited	0
6	1048585	1	7	2022-02-17 19:13:52	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	7	2022-02-17 19:13:53	268435457	submission.event.submissionSubmitted	0
8	1048585	2	8	2022-02-17 19:14:01	268435458	submission.event.general.metadataUpdated	0
9	515	2	8	2022-02-17 19:14:11	1342177281	submission.event.fileUploaded	0
10	1048585	2	8	2022-02-17 19:14:11	1342177288	submission.event.fileRevised	0
11	515	2	8	2022-02-17 19:14:13	1342177296	submission.event.fileEdited	0
12	1048585	2	8	2022-02-17 19:14:13	1342177296	submission.event.fileEdited	0
13	1048585	2	8	2022-02-17 19:14:18	268435458	submission.event.general.metadataUpdated	0
14	1048585	2	8	2022-02-17 19:14:19	268435457	submission.event.submissionSubmitted	0
15	1048585	2	8	2022-02-17 19:14:23	268435458	submission.event.general.metadataUpdated	0
16	1048585	2	8	2022-02-17 19:14:36	268435458	submission.event.general.metadataUpdated	0
17	1048585	2	3	2022-02-17 19:14:43	268435462	publication.event.published	0
18	1048585	3	9	2022-02-17 19:14:53	268435458	submission.event.general.metadataUpdated	0
19	515	3	9	2022-02-17 19:15:03	1342177281	submission.event.fileUploaded	0
20	1048585	3	9	2022-02-17 19:15:03	1342177288	submission.event.fileRevised	0
21	515	3	9	2022-02-17 19:15:05	1342177296	submission.event.fileEdited	0
22	1048585	3	9	2022-02-17 19:15:05	1342177296	submission.event.fileEdited	0
23	1048585	3	9	2022-02-17 19:15:13	268435458	submission.event.general.metadataUpdated	0
24	1048585	3	9	2022-02-17 19:15:15	268435457	submission.event.submissionSubmitted	0
25	1048585	3	3	2022-02-17 19:15:23	268435462	publication.event.published	0
26	1048585	3	3	2022-02-17 19:15:31	268435463	publication.event.unpublished	0
27	1048585	3	3	2022-02-17 19:15:34	268435458	submission.event.general.metadataUpdated	0
28	1048585	3	3	2022-02-17 19:15:37	268435462	publication.event.published	0
29	1048585	3	3	2022-02-17 19:15:40	268435458	submission.event.general.metadataUpdated	0
30	1048585	3	3	2022-02-17 19:15:40	268435464	publication.event.versionCreated	0
31	1048585	3	3	2022-02-17 19:15:43	268435458	submission.event.general.metadataUpdated	0
32	1048585	3	3	2022-02-17 19:15:46	268435462	publication.event.versionPublished	0
33	1048585	4	10	2022-02-17 19:15:56	268435458	submission.event.general.metadataUpdated	0
34	515	4	10	2022-02-17 19:16:06	1342177281	submission.event.fileUploaded	0
35	1048585	4	10	2022-02-17 19:16:06	1342177288	submission.event.fileRevised	0
36	515	4	10	2022-02-17 19:16:08	1342177296	submission.event.fileEdited	0
37	1048585	4	10	2022-02-17 19:16:08	1342177296	submission.event.fileEdited	0
38	1048585	4	10	2022-02-17 19:16:11	268435458	submission.event.general.metadataUpdated	0
39	1048585	4	10	2022-02-17 19:16:12	268435457	submission.event.submissionSubmitted	0
40	1048585	4	3	2022-02-17 19:16:20	268435462	publication.event.published	0
41	1048585	5	11	2022-02-17 19:16:30	268435458	submission.event.general.metadataUpdated	0
42	515	5	11	2022-02-17 19:16:40	1342177281	submission.event.fileUploaded	0
43	1048585	5	11	2022-02-17 19:16:40	1342177288	submission.event.fileRevised	0
44	515	5	11	2022-02-17 19:16:42	1342177296	submission.event.fileEdited	0
45	1048585	5	11	2022-02-17 19:16:42	1342177296	submission.event.fileEdited	0
46	1048585	5	11	2022-02-17 19:16:47	268435458	submission.event.general.metadataUpdated	0
47	1048585	5	11	2022-02-17 19:16:48	268435457	submission.event.submissionSubmitted	0
48	1048585	5	3	2022-02-17 19:16:55	268435462	publication.event.published	0
49	1048585	6	12	2022-02-17 19:17:05	268435458	submission.event.general.metadataUpdated	0
50	515	6	12	2022-02-17 19:17:16	1342177281	submission.event.fileUploaded	0
51	1048585	6	12	2022-02-17 19:17:16	1342177288	submission.event.fileRevised	0
52	515	6	12	2022-02-17 19:17:18	1342177296	submission.event.fileEdited	0
53	1048585	6	12	2022-02-17 19:17:18	1342177296	submission.event.fileEdited	0
54	1048585	6	12	2022-02-17 19:17:21	268435458	submission.event.general.metadataUpdated	0
55	1048585	6	12	2022-02-17 19:17:22	268435457	submission.event.submissionSubmitted	0
56	1048585	6	3	2022-02-17 19:17:29	268435462	publication.event.published	0
57	1048585	7	13	2022-02-17 19:17:38	268435458	submission.event.general.metadataUpdated	0
58	515	7	13	2022-02-17 19:17:48	1342177281	submission.event.fileUploaded	0
59	1048585	7	13	2022-02-17 19:17:48	1342177288	submission.event.fileRevised	0
60	515	7	13	2022-02-17 19:17:51	1342177296	submission.event.fileEdited	0
61	1048585	7	13	2022-02-17 19:17:51	1342177296	submission.event.fileEdited	0
62	1048585	7	13	2022-02-17 19:17:58	268435458	submission.event.general.metadataUpdated	0
63	1048585	7	13	2022-02-17 19:17:59	268435457	submission.event.submissionSubmitted	0
64	1048585	7	3	2022-02-17 19:18:07	268435462	publication.event.published	0
65	1048585	8	14	2022-02-17 19:18:16	268435458	submission.event.general.metadataUpdated	0
66	515	8	14	2022-02-17 19:18:26	1342177281	submission.event.fileUploaded	0
67	1048585	8	14	2022-02-17 19:18:26	1342177288	submission.event.fileRevised	0
68	515	8	14	2022-02-17 19:18:29	1342177296	submission.event.fileEdited	0
69	1048585	8	14	2022-02-17 19:18:29	1342177296	submission.event.fileEdited	0
70	1048585	8	14	2022-02-17 19:18:32	268435458	submission.event.general.metadataUpdated	0
71	1048585	8	14	2022-02-17 19:18:34	268435457	submission.event.submissionSubmitted	0
72	1048585	8	3	2022-02-17 19:18:42	268435462	publication.event.published	0
73	1048585	9	15	2022-02-17 19:18:53	268435458	submission.event.general.metadataUpdated	0
74	515	9	15	2022-02-17 19:19:03	1342177281	submission.event.fileUploaded	0
75	1048585	9	15	2022-02-17 19:19:03	1342177288	submission.event.fileRevised	0
76	515	9	15	2022-02-17 19:19:05	1342177296	submission.event.fileEdited	0
77	1048585	9	15	2022-02-17 19:19:05	1342177296	submission.event.fileEdited	0
78	1048585	9	15	2022-02-17 19:19:09	268435458	submission.event.general.metadataUpdated	0
79	1048585	9	15	2022-02-17 19:19:10	268435457	submission.event.submissionSubmitted	0
80	1048585	9	3	2022-02-17 19:19:18	268435462	publication.event.published	0
81	1048585	10	16	2022-02-17 19:19:28	268435458	submission.event.general.metadataUpdated	0
82	515	10	16	2022-02-17 19:19:38	1342177281	submission.event.fileUploaded	0
83	1048585	10	16	2022-02-17 19:19:38	1342177288	submission.event.fileRevised	0
84	515	10	16	2022-02-17 19:19:41	1342177296	submission.event.fileEdited	0
85	1048585	10	16	2022-02-17 19:19:41	1342177296	submission.event.fileEdited	0
86	1048585	10	16	2022-02-17 19:19:45	268435458	submission.event.general.metadataUpdated	0
87	1048585	10	16	2022-02-17 19:19:46	268435457	submission.event.submissionSubmitted	0
88	1048585	10	3	2022-02-17 19:19:54	268435462	publication.event.published	0
89	1048585	11	17	2022-02-17 19:20:05	268435458	submission.event.general.metadataUpdated	0
90	515	11	17	2022-02-17 19:20:15	1342177281	submission.event.fileUploaded	0
91	1048585	11	17	2022-02-17 19:20:15	1342177288	submission.event.fileRevised	0
92	515	11	17	2022-02-17 19:20:17	1342177296	submission.event.fileEdited	0
93	1048585	11	17	2022-02-17 19:20:17	1342177296	submission.event.fileEdited	0
94	1048585	11	17	2022-02-17 19:20:24	268435458	submission.event.general.metadataUpdated	0
95	1048585	11	17	2022-02-17 19:20:26	268435457	submission.event.submissionSubmitted	0
96	1048585	11	3	2022-02-17 19:20:35	268435462	publication.event.published	0
97	1048585	12	18	2022-02-17 19:20:46	268435458	submission.event.general.metadataUpdated	0
98	515	12	18	2022-02-17 19:20:56	1342177281	submission.event.fileUploaded	0
99	1048585	12	18	2022-02-17 19:20:56	1342177288	submission.event.fileRevised	0
100	515	12	18	2022-02-17 19:20:58	1342177296	submission.event.fileEdited	0
101	1048585	12	18	2022-02-17 19:20:58	1342177296	submission.event.fileEdited	0
102	1048585	12	18	2022-02-17 19:21:03	268435458	submission.event.general.metadataUpdated	0
103	1048585	12	18	2022-02-17 19:21:04	268435457	submission.event.submissionSubmitted	0
104	1048585	12	3	2022-02-17 19:21:13	268435462	publication.event.published	0
105	1048585	13	19	2022-02-17 19:21:24	268435458	submission.event.general.metadataUpdated	0
106	515	13	19	2022-02-17 19:21:34	1342177281	submission.event.fileUploaded	0
107	1048585	13	19	2022-02-17 19:21:34	1342177288	submission.event.fileRevised	0
108	515	13	19	2022-02-17 19:21:36	1342177296	submission.event.fileEdited	0
109	1048585	13	19	2022-02-17 19:21:36	1342177296	submission.event.fileEdited	0
110	1048585	13	19	2022-02-17 19:21:42	268435458	submission.event.general.metadataUpdated	0
111	1048585	13	19	2022-02-17 19:21:43	268435457	submission.event.submissionSubmitted	0
112	1048585	13	3	2022-02-17 19:21:51	268435462	publication.event.published	0
113	1048585	14	20	2022-02-17 19:22:01	268435458	submission.event.general.metadataUpdated	0
114	515	14	20	2022-02-17 19:22:11	1342177281	submission.event.fileUploaded	0
115	1048585	14	20	2022-02-17 19:22:11	1342177288	submission.event.fileRevised	0
116	515	14	20	2022-02-17 19:22:13	1342177296	submission.event.fileEdited	0
117	1048585	14	20	2022-02-17 19:22:13	1342177296	submission.event.fileEdited	0
118	1048585	14	20	2022-02-17 19:22:18	268435458	submission.event.general.metadataUpdated	0
119	1048585	14	20	2022-02-17 19:22:19	268435457	submission.event.submissionSubmitted	0
120	1048585	14	3	2022-02-17 19:22:27	268435462	publication.event.published	0
121	1048585	15	21	2022-02-17 19:22:38	268435458	submission.event.general.metadataUpdated	0
122	515	15	21	2022-02-17 19:22:48	1342177281	submission.event.fileUploaded	0
123	1048585	15	21	2022-02-17 19:22:48	1342177288	submission.event.fileRevised	0
124	515	15	21	2022-02-17 19:22:50	1342177296	submission.event.fileEdited	0
125	1048585	15	21	2022-02-17 19:22:50	1342177296	submission.event.fileEdited	0
126	1048585	15	21	2022-02-17 19:22:54	268435458	submission.event.general.metadataUpdated	0
127	1048585	15	21	2022-02-17 19:22:55	268435457	submission.event.submissionSubmitted	0
128	1048585	15	3	2022-02-17 19:23:03	268435462	publication.event.published	0
129	1048585	16	22	2022-02-17 19:23:13	268435458	submission.event.general.metadataUpdated	0
130	515	16	22	2022-02-17 19:23:23	1342177281	submission.event.fileUploaded	0
131	1048585	16	22	2022-02-17 19:23:23	1342177288	submission.event.fileRevised	0
132	515	16	22	2022-02-17 19:23:26	1342177296	submission.event.fileEdited	0
133	1048585	16	22	2022-02-17 19:23:26	1342177296	submission.event.fileEdited	0
134	1048585	16	22	2022-02-17 19:23:31	268435458	submission.event.general.metadataUpdated	0
135	1048585	16	22	2022-02-17 19:23:32	268435457	submission.event.submissionSubmitted	0
136	1048585	16	3	2022-02-17 19:23:40	268435462	publication.event.published	0
137	1048585	17	23	2022-02-17 19:23:52	268435458	submission.event.general.metadataUpdated	0
138	515	17	23	2022-02-17 19:24:01	1342177281	submission.event.fileUploaded	0
139	1048585	17	23	2022-02-17 19:24:02	1342177288	submission.event.fileRevised	0
140	515	17	23	2022-02-17 19:24:04	1342177296	submission.event.fileEdited	0
141	1048585	17	23	2022-02-17 19:24:04	1342177296	submission.event.fileEdited	0
142	1048585	17	23	2022-02-17 19:24:10	268435458	submission.event.general.metadataUpdated	0
143	1048585	17	23	2022-02-17 19:24:11	268435457	submission.event.submissionSubmitted	0
144	1048585	17	3	2022-02-17 19:24:19	268435462	publication.event.published	0
145	1048585	18	24	2022-02-17 19:24:30	268435458	submission.event.general.metadataUpdated	0
146	515	18	24	2022-02-17 19:24:40	1342177281	submission.event.fileUploaded	0
147	1048585	18	24	2022-02-17 19:24:40	1342177288	submission.event.fileRevised	0
148	515	18	24	2022-02-17 19:24:42	1342177296	submission.event.fileEdited	0
149	1048585	18	24	2022-02-17 19:24:42	1342177296	submission.event.fileEdited	0
150	1048585	18	24	2022-02-17 19:24:46	268435458	submission.event.general.metadataUpdated	0
151	1048585	18	24	2022-02-17 19:24:47	268435457	submission.event.submissionSubmitted	0
152	1048585	18	3	2022-02-17 19:24:56	268435462	publication.event.published	0
153	1048585	19	25	2022-02-17 19:25:06	268435458	submission.event.general.metadataUpdated	0
154	515	19	25	2022-02-17 19:25:16	1342177281	submission.event.fileUploaded	0
155	1048585	19	25	2022-02-17 19:25:16	1342177288	submission.event.fileRevised	0
156	515	19	25	2022-02-17 19:25:19	1342177296	submission.event.fileEdited	0
157	1048585	19	25	2022-02-17 19:25:19	1342177296	submission.event.fileEdited	0
158	1048585	19	25	2022-02-17 19:25:22	268435458	submission.event.general.metadataUpdated	0
159	1048585	19	25	2022-02-17 19:25:23	268435457	submission.event.submissionSubmitted	0
160	1048585	19	3	2022-02-17 19:25:31	268435462	publication.event.published	0
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
1	contexts/1/submissions/1/620e9e69bce23.pdf	application/pdf
2	contexts/1/submissions/2/620e9e838ca09.pdf	application/pdf
3	contexts/1/submissions/3/620e9eb78e6da.pdf	application/pdf
4	contexts/1/submissions/4/620e9ef641add.pdf	application/pdf
5	contexts/1/submissions/5/620e9f184ec24.pdf	application/pdf
6	contexts/1/submissions/6/620e9f3c0ab70.pdf	application/pdf
7	contexts/1/submissions/7/620e9f5ce1866.pdf	application/pdf
8	contexts/1/submissions/8/620e9f82e1550.pdf	application/pdf
9	contexts/1/submissions/9/620e9fa712b9b.pdf	application/pdf
10	contexts/1/submissions/10/620e9fcac528c.pdf	application/pdf
11	contexts/1/submissions/11/620e9fef6ba37.pdf	application/pdf
12	contexts/1/submissions/12/620ea01864bd8.pdf	application/pdf
13	contexts/1/submissions/13/620ea03e685e9.pdf	application/pdf
14	contexts/1/submissions/14/620ea06374e0a.pdf	application/pdf
15	contexts/1/submissions/15/620ea08858af7.pdf	application/pdf
16	contexts/1/submissions/16/620ea0abc2523.pdf	application/pdf
17	contexts/1/submissions/17/620ea0d1f12d0.pdf	application/pdf
18	contexts/1/submissions/18/620ea0f828d04.pdf	application/pdf
19	contexts/1/submissions/19/620ea11ccb136.pdf	application/pdf
\.


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 19, true);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	preprint=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)
2	preprint=>dc11	plugins.metadata.dc11.preprintAdapter.displayName	plugins.metadata.dc11.preprintAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.dc11.schema.Dc11Schema(PREPRINT)
3	preprint=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
4	native-xml=>preprint	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.submission.Submission[]
5	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.author.Author[]	xml::schema(plugins/importexport/native/native.xsd)
6	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.author.Author[]
7	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submissionFile.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
8	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submissionFile.SubmissionFile[]
9	preprint-galley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.preprint.PreprintGalley	xml::schema(plugins/importexport/native/native.xsd)
10	native-xml=>PreprintGalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.preprint.PreprintGalley[]
11	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
12	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication[]
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
1	1	0	Crossref XML preprint export	plugins.generic.crossref.filter.PreprintCrossrefXmlFilter	0	0	0
2	2	0	Extract metadata from a(n) Submission	plugins.metadata.dc11.filter.Dc11SchemaPreprintAdapter	0	0	0
3	3	0	Native XML submission export	plugins.importexport.native.filter.PreprintNativeXmlFilter	0	0	0
4	4	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlPreprintFilter	0	0	0
5	5	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
6	6	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
7	8	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlPreprintFileFilter	0	0	0
8	7	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
9	9	0	Native XML representation export	plugins.importexport.native.filter.PreprintGalleyNativeXmlFilter	0	0	0
10	10	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlPreprintGalleyFilter	0	0	0
11	11	0	Native XML Publication export	plugins.importexport.native.filter.PublicationNativeXmlFilter	0	0	0
12	12	0	Native XML publication import	plugins.importexport.native.filter.NativeXmlPublicationFilter	0	0	0
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

SELECT pg_catalog.setval('public.jobs_id_seq', 40, true);


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
204		contents	There was a problem sending an email message. Please try again later, or contact your system administrator.	string
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
155	1	0	3	16777222	2022-02-17 19:22:55	\N	1048585	15
53	1	4	2	16777217	2022-02-17 19:16:48	\N	1048585	5
156	1	0	3	16777223	2022-02-17 19:22:55	\N	1048585	15
157	1	4	2	16777217	2022-02-17 19:22:55	\N	1048585	15
3	1	0	3	16777222	2022-02-17 19:13:53	\N	1048585	1
4	1	0	3	16777223	2022-02-17 19:13:53	\N	1048585	1
5	1	4	2	16777217	2022-02-17 19:13:53	\N	1048585	1
7	1	5	2	16777217	2022-02-17 19:13:53	\N	1048585	1
9	1	0	2	16777243	2022-02-17 19:13:53	\N	1048585	1
10	1	0	2	16777245	2022-02-17 19:13:53	\N	1048585	1
55	1	5	2	16777217	2022-02-17 19:16:48	\N	1048585	5
57	1	0	2	16777243	2022-02-17 19:16:48	\N	1048585	5
12	1	0	3	16777222	2022-02-17 19:14:19	\N	1048585	2
13	1	0	3	16777223	2022-02-17 19:14:19	\N	1048585	2
14	1	4	2	16777217	2022-02-17 19:14:19	\N	1048585	2
16	1	5	2	16777217	2022-02-17 19:14:19	\N	1048585	2
18	1	0	2	16777243	2022-02-17 19:14:19	\N	1048585	2
19	1	0	2	16777245	2022-02-17 19:14:19	\N	1048585	2
58	1	0	2	16777245	2022-02-17 19:16:48	\N	1048585	5
83	1	0	3	16777222	2022-02-17 19:18:33	\N	1048585	8
23	1	0	3	16777222	2022-02-17 19:15:14	\N	1048585	3
24	1	0	3	16777223	2022-02-17 19:15:14	\N	1048585	3
25	1	4	2	16777217	2022-02-17 19:15:14	\N	1048585	3
27	1	5	2	16777217	2022-02-17 19:15:14	\N	1048585	3
29	1	0	2	16777243	2022-02-17 19:15:14	\N	1048585	3
30	1	0	2	16777245	2022-02-17 19:15:14	\N	1048585	3
84	1	0	3	16777223	2022-02-17 19:18:33	\N	1048585	8
85	1	4	2	16777217	2022-02-17 19:18:33	\N	1048585	8
61	1	0	3	16777222	2022-02-17 19:17:22	\N	1048585	6
62	1	0	3	16777223	2022-02-17 19:17:22	\N	1048585	6
63	1	4	2	16777217	2022-02-17 19:17:22	\N	1048585	6
35	1	4	3	16777259	2022-02-17 19:15:40	\N	1048585	3
37	1	5	3	16777259	2022-02-17 19:15:40	\N	1048585	3
39	1	9	3	16777259	2022-02-17 19:15:40	\N	1048585	3
41	1	0	3	16777222	2022-02-17 19:16:12	\N	1048585	4
42	1	0	3	16777223	2022-02-17 19:16:12	\N	1048585	4
43	1	4	2	16777217	2022-02-17 19:16:12	\N	1048585	4
45	1	5	2	16777217	2022-02-17 19:16:12	\N	1048585	4
47	1	0	2	16777243	2022-02-17 19:16:12	\N	1048585	4
48	1	0	2	16777245	2022-02-17 19:16:12	\N	1048585	4
65	1	5	2	16777217	2022-02-17 19:17:22	\N	1048585	6
67	1	0	2	16777243	2022-02-17 19:17:22	\N	1048585	6
68	1	0	2	16777245	2022-02-17 19:17:22	\N	1048585	6
51	1	0	3	16777222	2022-02-17 19:16:48	\N	1048585	5
52	1	0	3	16777223	2022-02-17 19:16:48	\N	1048585	5
87	1	5	2	16777217	2022-02-17 19:18:33	\N	1048585	8
89	1	0	2	16777243	2022-02-17 19:18:33	\N	1048585	8
90	1	0	2	16777245	2022-02-17 19:18:33	\N	1048585	8
72	1	0	3	16777222	2022-02-17 19:17:59	\N	1048585	7
73	1	0	3	16777223	2022-02-17 19:17:59	\N	1048585	7
74	1	4	2	16777217	2022-02-17 19:17:59	\N	1048585	7
76	1	5	2	16777217	2022-02-17 19:17:59	\N	1048585	7
78	1	0	2	16777243	2022-02-17 19:17:59	\N	1048585	7
79	1	0	2	16777245	2022-02-17 19:17:59	\N	1048585	7
103	1	0	3	16777222	2022-02-17 19:19:45	\N	1048585	10
104	1	0	3	16777223	2022-02-17 19:19:46	\N	1048585	10
105	1	4	2	16777217	2022-02-17 19:19:46	\N	1048585	10
93	1	0	3	16777222	2022-02-17 19:19:09	\N	1048585	9
94	1	0	3	16777223	2022-02-17 19:19:09	\N	1048585	9
95	1	4	2	16777217	2022-02-17 19:19:09	\N	1048585	9
97	1	5	2	16777217	2022-02-17 19:19:09	\N	1048585	9
99	1	0	2	16777243	2022-02-17 19:19:10	\N	1048585	9
100	1	0	2	16777245	2022-02-17 19:19:10	\N	1048585	9
120	1	0	2	16777243	2022-02-17 19:20:25	\N	1048585	11
114	1	0	3	16777222	2022-02-17 19:20:25	\N	1048585	11
115	1	0	3	16777223	2022-02-17 19:20:25	\N	1048585	11
107	1	5	2	16777217	2022-02-17 19:19:46	\N	1048585	10
109	1	0	2	16777243	2022-02-17 19:19:46	\N	1048585	10
110	1	0	2	16777245	2022-02-17 19:19:46	\N	1048585	10
116	1	4	2	16777217	2022-02-17 19:20:25	\N	1048585	11
118	1	5	2	16777217	2022-02-17 19:20:25	\N	1048585	11
121	1	0	2	16777245	2022-02-17 19:20:25	\N	1048585	11
126	1	0	3	16777223	2022-02-17 19:21:03	\N	1048585	12
125	1	0	3	16777222	2022-02-17 19:21:03	\N	1048585	12
127	1	4	2	16777217	2022-02-17 19:21:03	\N	1048585	12
129	1	5	2	16777217	2022-02-17 19:21:03	\N	1048585	12
131	1	0	2	16777243	2022-02-17 19:21:04	\N	1048585	12
132	1	0	2	16777245	2022-02-17 19:21:04	\N	1048585	12
159	1	5	2	16777217	2022-02-17 19:22:55	\N	1048585	15
135	1	0	3	16777222	2022-02-17 19:21:43	\N	1048585	13
136	1	0	3	16777223	2022-02-17 19:21:43	\N	1048585	13
137	1	4	2	16777217	2022-02-17 19:21:43	\N	1048585	13
161	1	0	2	16777243	2022-02-17 19:22:55	\N	1048585	15
139	1	5	2	16777217	2022-02-17 19:21:43	\N	1048585	13
162	1	0	2	16777245	2022-02-17 19:22:55	\N	1048585	15
141	1	0	2	16777243	2022-02-17 19:21:43	\N	1048585	13
142	1	0	2	16777245	2022-02-17 19:21:43	\N	1048585	13
145	1	0	3	16777222	2022-02-17 19:22:19	\N	1048585	14
146	1	0	3	16777223	2022-02-17 19:22:19	\N	1048585	14
147	1	4	2	16777217	2022-02-17 19:22:19	\N	1048585	14
165	1	0	3	16777222	2022-02-17 19:23:32	\N	1048585	16
149	1	5	2	16777217	2022-02-17 19:22:19	\N	1048585	14
166	1	0	3	16777223	2022-02-17 19:23:32	\N	1048585	16
151	1	0	2	16777243	2022-02-17 19:22:19	\N	1048585	14
152	1	0	2	16777245	2022-02-17 19:22:19	\N	1048585	14
167	1	4	2	16777217	2022-02-17 19:23:32	\N	1048585	16
169	1	5	2	16777217	2022-02-17 19:23:32	\N	1048585	16
171	1	0	2	16777243	2022-02-17 19:23:32	\N	1048585	16
172	1	0	2	16777245	2022-02-17 19:23:32	\N	1048585	16
204	0	3	1	3	2022-02-17 19:25:31	\N	0	0
175	1	0	3	16777222	2022-02-17 19:24:11	\N	1048585	17
176	1	0	3	16777223	2022-02-17 19:24:11	\N	1048585	17
177	1	4	2	16777217	2022-02-17 19:24:11	\N	1048585	17
179	1	5	2	16777217	2022-02-17 19:24:11	\N	1048585	17
181	1	0	2	16777243	2022-02-17 19:24:11	\N	1048585	17
182	1	0	2	16777245	2022-02-17 19:24:11	\N	1048585	17
185	1	0	3	16777222	2022-02-17 19:24:47	\N	1048585	18
186	1	0	3	16777223	2022-02-17 19:24:47	\N	1048585	18
187	1	4	2	16777217	2022-02-17 19:24:47	\N	1048585	18
189	1	5	2	16777217	2022-02-17 19:24:47	\N	1048585	18
191	1	0	2	16777243	2022-02-17 19:24:47	\N	1048585	18
192	1	0	2	16777245	2022-02-17 19:24:47	\N	1048585	18
195	1	0	3	16777222	2022-02-17 19:25:22	\N	1048585	19
196	1	0	3	16777223	2022-02-17 19:25:22	\N	1048585	19
197	1	4	2	16777217	2022-02-17 19:25:22	\N	1048585	19
199	1	5	2	16777217	2022-02-17 19:25:22	\N	1048585	19
201	1	0	2	16777243	2022-02-17 19:25:23	\N	1048585	19
202	1	0	2	16777245	2022-02-17 19:25:23	\N	1048585	19
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 204, true);


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
usageeventplugin	0	uniqueSiteId	620e9ddb169ed	string
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

COPY public.publication_galleys (galley_id, locale, publication_id, label, submission_file_id, seq, remote_url, is_approved, url_path, doi_id) FROM stdin;
1	en_US	1	PDF	\N	0		0		\N
2	en_US	2	PDF	\N	0		0		\N
3	en_US	3	PDF	\N	0		0		\N
4	en_US	4	PDF	\N	0		0		\N
5	en_US	5	PDF	\N	0		0		\N
6	en_US	6	PDF	\N	0		0		\N
7	en_US	7	PDF	\N	0		0		\N
8	en_US	8	PDF	\N	0		0		\N
9	en_US	9	PDF	\N	0		0		\N
10	en_US	10	PDF	\N	0		0		\N
11	en_US	11	PDF	\N	0		0		\N
12	en_US	12	PDF	\N	0		0		\N
13	en_US	13	PDF	\N	0		0		\N
14	en_US	14	PDF	\N	0		0		\N
15	en_US	15	PDF	\N	0		0		\N
16	en_US	16	PDF	\N	0		0		\N
17	en_US	17	PDF	\N	0		0		\N
18	en_US	18	PDF	\N	0		0		\N
19	en_US	19	PDF	\N	0		0		\N
20	en_US	20	PDF	\N	0		0		\N
\.


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 20, true);


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
2		categoryIds	[]
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
2	en_US	copyrightHolder	Public Knowledge Preprint Server
2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
2		copyrightYear	2022
2	en_US	subtitle	A Nine-Nation Comparative Study Of Construct Equivalence
2	en_US	title	The Facets Of Job Satisfaction
3		categoryIds	[]
3	en_US	copyrightHolder	Public Knowledge Preprint Server
4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
4		copyrightYear	2022
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
3		copyrightYear	2022
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
3	fr_CA	title	
3	fr_CA	abstract	
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
4	fr_CA	abstract	
4		categoryIds	[]
4	en_US	copyrightHolder	Craig Montgomerie
7	fr_CA	abstract	
4	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
4	fr_CA	subtitle	
4	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
4	fr_CA	title	
5	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	copyrightHolder	Public Knowledge Preprint Server
5	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
5		copyrightYear	2022
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Genetic transformation of forest trees
5	fr_CA	title	
7		categoryIds	[]
6	fr_CA	abstract	
6	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
6		categoryIds	[]
6	en_US	copyrightHolder	Public Knowledge Preprint Server
6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
6		copyrightYear	2022
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
6	fr_CA	title	
7	en_US	copyrightHolder	Public Knowledge Preprint Server
7	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
7		copyrightYear	2022
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Developing efficacy beliefs in the classroom
7	fr_CA	title	
8	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	copyrightHolder	Public Knowledge Preprint Server
8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
8		copyrightYear	2022
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Traditions and Trends in the Study of the Commons
8	fr_CA	title	
9	en_US	abstract	<p>None.</p>
9	fr_CA	abstract	
9		categoryIds	[]
9	en_US	copyrightHolder	Public Knowledge Preprint Server
9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9		copyrightYear	2022
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	fr_CA	title	
9	en_US	prefix	
9	en_US	title	Hansen & Pinto: Reason Reclaimed
10	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
10	fr_CA	abstract	
10		categoryIds	[]
10	en_US	copyrightHolder	Public Knowledge Preprint Server
10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10		copyrightYear	2022
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
10	fr_CA	title	
17	fr_CA	title	
11	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	copyrightHolder	Public Knowledge Preprint Server
11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
11		copyrightYear	2022
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
11	fr_CA	title	
12	fr_CA	abstract	
12	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
12		categoryIds	[]
12	en_US	copyrightHolder	Public Knowledge Preprint Server
12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12		copyrightYear	2022
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Learning Sustainable Design through Service
12	fr_CA	title	
17	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
13	fr_CA	abstract	
13	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
13		categoryIds	[]
13	en_US	copyrightHolder	Public Knowledge Preprint Server
13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
13		copyrightYear	2022
13	fr_CA	prefix	
13	en_US	prefix	
13	fr_CA	subtitle	
13	en_US	subtitle	
13	fr_CA	title	
13	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
14		categoryIds	[]
14	fr_CA	abstract	
14	fr_CA	prefix	
14	en_US	prefix	
14	fr_CA	subtitle	
14	en_US	subtitle	
14	fr_CA	title	
14	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
14	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
14	en_US	copyrightHolder	Public Knowledge Preprint Server
14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
14		copyrightYear	2022
15	fr_CA	abstract	
15	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
15		categoryIds	[]
15	en_US	copyrightHolder	Public Knowledge Preprint Server
15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15		copyrightYear	2022
15	fr_CA	prefix	
15	en_US	prefix	
15	fr_CA	subtitle	
15	en_US	subtitle	
15	fr_CA	title	
15	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
16	fr_CA	prefix	
16	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
16	fr_CA	abstract	
16		categoryIds	[]
16	en_US	copyrightHolder	Public Knowledge Preprint Server
16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16		copyrightYear	2022
16	en_US	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
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
17		copyrightYear	2022
19		categoryIds	[]
19	en_US	copyrightHolder	Public Knowledge Preprint Server
18	fr_CA	abstract	
18	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
18		categoryIds	[]
18	en_US	copyrightHolder	Public Knowledge Preprint Server
18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
18		copyrightYear	2022
18	fr_CA	prefix	
18	en_US	prefix	
18	fr_CA	subtitle	
18	en_US	subtitle	
18	fr_CA	title	
18	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
19	fr_CA	abstract	
19	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
19		copyrightYear	2022
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
20		copyrightYear	2022
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

COPY public.publications (publication_id, access_status, date_published, last_modified, primary_contact_id, section_id, submission_id, status, url_path, version, doi_id) FROM stdin;
1	0	\N	2022-02-17 19:13:52	1	1	1	1	\N	1	\N
17	0	2022-02-17	2022-02-17 19:23:40	22	1	16	3	\N	1	\N
2	0	2022-02-17	2022-02-17 19:14:42	2	1	2	3	\N	1	\N
18	0	2022-02-17	2022-02-17 19:24:19	23	1	17	3	\N	1	\N
19	0	2022-02-17	2022-02-17 19:24:56	24	1	18	3	\N	1	\N
3	0	2022-02-17	2022-02-17 19:15:37	4	1	3	3	\N	1	\N
4	0	2022-02-17	2022-02-17 19:15:46	6	1	3	3	\N	2	\N
20	0	2022-02-17	2022-02-17 19:25:31	25	1	19	3	\N	1	\N
5	0	2022-02-17	2022-02-17 19:16:20	8	1	4	3	\N	1	\N
6	0	2022-02-17	2022-02-17 19:16:55	9	1	5	3	\N	1	\N
7	0	2022-02-17	2022-02-17 19:17:29	10	1	6	3	\N	1	\N
8	0	2022-02-17	2022-02-17 19:18:07	11	1	7	3	\N	1	\N
9	0	2022-02-17	2022-02-17 19:18:42	13	1	8	3	\N	1	\N
10	0	2022-02-17	2022-02-17 19:19:18	14	1	9	3	\N	1	\N
11	0	2022-02-17	2022-02-17 19:19:54	15	1	10	3	\N	1	\N
12	0	2022-02-17	2022-02-17 19:20:35	16	1	11	3	\N	1	\N
13	0	2022-02-17	2022-02-17 19:21:13	18	1	12	3	\N	1	\N
14	0	2022-02-17	2022-02-17 19:21:51	19	1	13	3	\N	1	\N
15	0	2022-02-17	2022-02-17 19:22:27	20	1	14	3	\N	1	\N
16	0	2022-02-17	2022-02-17 19:23:03	21	1	15	3	\N	1	\N
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
plugins.generic.usageStats.UsageStatsLoader	2022-02-17 19:11:06
lib.pkp.classes.task.StatisticsReport	2022-02-17 19:11:06
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
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously posted."},{"order":2,"content":"The submission file is in OpenOffice, Microsoft Word, or RTF document file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines."}]	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1	en_US	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source system is suitable for libraries to host for their faculty members to use (see <a href="http://pkp.sfu.ca">Public Knowledge Project</a>).	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	name	Public Knowledge Preprint Server	\N
1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>	\N
1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1		country	IS	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		defaultReviewMode	2	\N
1		copySubmissionAckPrimaryContact	0	\N
1	fr_CA	name	Serveur de prépublication de la connaissance du public	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	en_US	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	readerInformation	##default.contextSettings.forReaders##	\N
1	en_US	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"La soumission n'a pas déjà été publiée et n'est pas considérée actuellement par un autre serveur. Si ce n'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice »."},{"order":2,"content":"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect."},{"order":3,"content":"Lorsque possible, les URL des références ont été fournies."},{"order":4,"content":"##default.contextSettings.checklist.submissionAppearance##"},{"order":5,"content":"##default.contextSettings.checklist.bibliographicRequirements##"}]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		themePluginPath	default	\N
1	en_US	abbreviation	publicknowledgePub Know Pre	\N
1		enableAuthorScreening	0	\N
1	en_US	acronym	JPKPKP	\N
1	fr_CA	authorInformation	##default.contextSettings.forAuthors##	\N
1		copySubmissionAckAddress		\N
1		emailSignature	<br/><hr /><br/><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto: {$contactEmail}">{$contactEmail}</a></p>	\N
1		enableDois	0	\N
1		enableOai	1	\N
1	en_US	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.	\N
1		registrationAgency	none	\N
1		disableSubmissions	0	\N
1		itemsPerPage	25	\N
1		keywords	request	\N
1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##	\N
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
dm2mqnnkmhqaq1a23ngm1jch8a	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125062	1645125062	0		localhost
6mjtsmo6djtdbkesp7bcv55f68	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125182	1645125207	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1645125207;s:5:"token";s:32:"0be392afa1fa59f63606ef551e605c42";}	localhost
j0rkv3q1pjn9nurn6or6o132mk	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125417	1645125450	0	csrf|a:2:{s:9:"timestamp";i:1645125450;s:5:"token";s:32:"28168f38bf1c8fcb00284cf04faedf13";}username|s:7:"dbarnes";userId|i:3;	localhost
3c88p2dmck3nqrvf95eeoscu4m	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125101	1645125109	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1645125109;s:5:"token";s:32:"f76ea97905d3540ee654b6da8bc19836";}	localhost
oj9p1h60soerokjc6483tmejls	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125082	1645125101	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1645125101;s:5:"token";s:32:"edca2eb1480e9d0894e3882203352545";}	localhost
q8afae5bi9hsa4ktskodcikamf	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125109	1645125117	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1645125117;s:5:"token";s:32:"7c3d00f4f15d8d3a6df8d091d526c0ec";}	localhost
0unvk3jtj43s1khsdnv3tv8o87	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125066	1645125082	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1645125082;s:5:"token";s:32:"cb057dfe7d8334b817a24644d516c820";}	localhost
qm3hj47td9ka43s0ljb7dp94ue	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125451	1645125488	0	csrf|a:2:{s:9:"timestamp";i:1645125488;s:5:"token";s:32:"8980bb04050f7dfc32f7f8c889049f62";}username|s:7:"dbarnes";userId|i:3;	localhost
9pks6g1ll48lgpd7uudhadtl4o	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125175	1645125182	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1645125182;s:5:"token";s:32:"d0d561aaba19e7d79d8f156e8a02a0b3";}	localhost
00m8gq2n0hb45bg1iqk5bn6v95	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125349	1645125381	0	csrf|a:2:{s:9:"timestamp";i:1645125381;s:5:"token";s:32:"86d96fca755afff61d3293605564e955";}username|s:7:"dbarnes";userId|i:3;	localhost
2a5uhprp7lum9lpahcavohsclr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125489	1645125522	0	csrf|a:2:{s:9:"timestamp";i:1645125522;s:5:"token";s:32:"c0c3e74516ccfac0015f0cd48b6076c8";}username|s:7:"dbarnes";userId|i:3;	localhost
s7v2du85tr3ak4c49d8kuepj15	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125119	1645125173	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1645125173;s:5:"token";s:32:"e9a85830d3d69c6fd33ab3018e03a025";}	localhost
i1k60sq1apkbmk283o1ngd64pp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125524	1645125559	0	csrf|a:2:{s:9:"timestamp";i:1645125559;s:5:"token";s:32:"54c266f56008638179e233d5d3bb95ed";}username|s:7:"dbarnes";userId|i:3;	localhost
i79vjquho2rtctv26qeb0esie7	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125209	1645125233	0	csrf|a:2:{s:9:"timestamp";i:1645125233;s:5:"token";s:32:"ae70ee6b4fe866ad73c65f1a4c53baa6";}username|s:7:"ccorino";userId|i:7;	localhost
u22v4rfu3ut1h4gjq1jrsju8f9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125560	1645125595	0	csrf|a:2:{s:9:"timestamp";i:1645125595;s:5:"token";s:32:"b7d65123d5a602177a74bbff51c92b41";}username|s:7:"dbarnes";userId|i:3;	localhost
o92797l7tdja9rthjk7isig7qh	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125235	1645125277	0	csrf|a:2:{s:9:"timestamp";i:1645125277;s:5:"token";s:32:"fd833c28248bbd524b91effe0164c4e2";}username|s:8:"ckwantes";	localhost
7olasfv5t269nqsfrqp6i7t623	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125278	1645125283	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1645125283;s:5:"token";s:32:"bc8ae996cb0ed4ccd0db84b501b36b5d";}	localhost
6uuf45j5i1maqv0iak1b1rp2dn	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125596	1645125635	0	csrf|a:2:{s:9:"timestamp";i:1645125635;s:5:"token";s:32:"7d857a8a11316460e17ea457c8eb2d64";}username|s:7:"dbarnes";userId|i:3;	localhost
e8r6vdtgrg2esmf92gg8e0oppm	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125286	1645125347	0	csrf|a:2:{s:9:"timestamp";i:1645125347;s:5:"token";s:32:"6711997d9ed4c160e89539701f2c3ab7";}username|s:7:"dbarnes";userId|i:3;	localhost
h093d63ng30sch2qi22mab9nas	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125383	1645125415	0	csrf|a:2:{s:9:"timestamp";i:1645125415;s:5:"token";s:32:"640a500e2d4c71186606650b224a0662";}username|s:7:"dbarnes";userId|i:3;	localhost
1r1m36gta7nhba35h46mkqpeak	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125637	1645125673	0	csrf|a:2:{s:9:"timestamp";i:1645125673;s:5:"token";s:32:"f2d7280dac3b3df834f16be8bf2bad97";}username|s:7:"dbarnes";userId|i:3;	localhost
rn142nvsokchtls3r3kgkjteh1	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125898	1645125931	0	csrf|a:2:{s:9:"timestamp";i:1645125931;s:5:"token";s:32:"fc995de6f8cfa9269cb4d932701a1cab";}username|s:7:"dbarnes";userId|i:3;	localhost
vu4bng26ro03fgr6fdrjsbchaq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125823	1645125859	0	csrf|a:2:{s:9:"timestamp";i:1645125859;s:5:"token";s:32:"693bb8074af528b752e8846c866fe206";}username|s:7:"dbarnes";userId|i:3;	localhost
2iokuisdui52spl331bl3h619e	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125713	1645125747	0	csrf|a:2:{s:9:"timestamp";i:1645125748;s:5:"token";s:32:"6ffbad792514db889e7b0db5c2c810d5";}username|s:7:"dbarnes";userId|i:3;	localhost
k5nbdvcqsftokjrde13gduda2h	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125675	1645125711	0	csrf|a:2:{s:9:"timestamp";i:1645125711;s:5:"token";s:32:"0e1e6180b20b99dca77c993058c80854";}username|s:7:"dbarnes";userId|i:3;	localhost
8epp008eh3n7g5mkdj73j6vfi2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125749	1645125784	0	csrf|a:2:{s:9:"timestamp";i:1645125784;s:5:"token";s:32:"88d0e7c89c3e791a357fbf54ed121599";}username|s:7:"dbarnes";userId|i:3;	localhost
1ve8o4gfe8a9156nbqblng7hr7	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125785	1645125821	0	csrf|a:2:{s:9:"timestamp";i:1645125821;s:5:"token";s:32:"9b2b970b7396cf5c02f6dcf2214b2eb8";}username|s:7:"dbarnes";userId|i:3;	localhost
85n9ct9qjrhg0svmpmgf5lbu99	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36	1645125861	1645125896	0	csrf|a:2:{s:9:"timestamp";i:1645125896;s:5:"token";s:32:"857763f4c6d4e0cf67ee8c74dbe6177c";}username|s:7:"dbarnes";userId|i:3;	localhost
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
1	1	4	7	2022-02-17 19:13:35	0	1
2	1	3	4	2022-02-17 19:13:53	0	1
3	1	3	5	2022-02-17 19:13:53	0	1
4	2	4	8	2022-02-17 19:14:01	0	1
5	2	3	4	2022-02-17 19:14:19	0	1
6	2	3	5	2022-02-17 19:14:19	0	1
7	3	4	9	2022-02-17 19:14:53	0	1
8	3	3	4	2022-02-17 19:15:14	0	1
9	3	3	5	2022-02-17 19:15:14	0	1
10	4	4	10	2022-02-17 19:15:56	0	1
11	4	3	4	2022-02-17 19:16:12	0	1
12	4	3	5	2022-02-17 19:16:12	0	1
13	5	4	11	2022-02-17 19:16:30	0	1
14	5	3	4	2022-02-17 19:16:48	0	1
15	5	3	5	2022-02-17 19:16:48	0	1
16	6	4	12	2022-02-17 19:17:05	0	1
17	6	3	4	2022-02-17 19:17:22	0	1
18	6	3	5	2022-02-17 19:17:22	0	1
19	7	4	13	2022-02-17 19:17:38	0	1
20	7	3	4	2022-02-17 19:17:59	0	1
21	7	3	5	2022-02-17 19:17:59	0	1
22	8	4	14	2022-02-17 19:18:16	0	1
23	8	3	4	2022-02-17 19:18:33	0	1
24	8	3	5	2022-02-17 19:18:33	0	1
25	9	4	15	2022-02-17 19:18:53	0	1
26	9	3	4	2022-02-17 19:19:09	0	1
27	9	3	5	2022-02-17 19:19:09	0	1
28	10	4	16	2022-02-17 19:19:28	0	1
29	10	3	4	2022-02-17 19:19:45	0	1
30	10	3	5	2022-02-17 19:19:45	0	1
31	11	4	17	2022-02-17 19:20:05	0	1
32	11	3	4	2022-02-17 19:20:25	0	1
33	11	3	5	2022-02-17 19:20:25	0	1
34	12	4	18	2022-02-17 19:20:46	0	1
35	12	3	4	2022-02-17 19:21:03	0	1
36	12	3	5	2022-02-17 19:21:03	0	1
37	13	4	19	2022-02-17 19:21:24	0	1
38	13	3	4	2022-02-17 19:21:43	0	1
39	13	3	5	2022-02-17 19:21:43	0	1
40	14	4	20	2022-02-17 19:22:01	0	1
41	14	3	4	2022-02-17 19:22:19	0	1
42	14	3	5	2022-02-17 19:22:19	0	1
43	15	4	21	2022-02-17 19:22:38	0	1
44	15	3	4	2022-02-17 19:22:55	0	1
45	15	3	5	2022-02-17 19:22:55	0	1
46	16	4	22	2022-02-17 19:23:13	0	1
47	16	3	4	2022-02-17 19:23:32	0	1
48	16	3	5	2022-02-17 19:23:32	0	1
49	17	4	23	2022-02-17 19:23:52	0	1
50	17	3	4	2022-02-17 19:24:11	0	1
51	17	3	5	2022-02-17 19:24:11	0	1
52	18	4	24	2022-02-17 19:24:30	0	1
53	18	3	4	2022-02-17 19:24:47	0	1
54	18	3	5	2022-02-17 19:24:47	0	1
55	19	4	25	2022-02-17 19:25:06	0	1
56	19	3	4	2022-02-17 19:25:22	0	1
57	19	3	5	2022-02-17 19:25:22	0	1
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
1	1	1	\N	1	10	\N	\N	\N	2022-02-17 19:13:45	2022-02-17 19:13:48	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2022-02-17 19:14:11	2022-02-17 19:14:13	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2022-02-17 19:15:03	2022-02-17 19:15:05	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2022-02-17 19:16:06	2022-02-17 19:16:08	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2022-02-17 19:16:40	2022-02-17 19:16:42	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2022-02-17 19:17:16	2022-02-17 19:17:18	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2022-02-17 19:17:48	2022-02-17 19:17:51	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2022-02-17 19:18:26	2022-02-17 19:18:29	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2022-02-17 19:19:03	2022-02-17 19:19:05	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2022-02-17 19:19:38	2022-02-17 19:19:41	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2022-02-17 19:20:15	2022-02-17 19:20:17	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2022-02-17 19:20:56	2022-02-17 19:20:58	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2022-02-17 19:21:34	2022-02-17 19:21:36	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2022-02-17 19:22:11	2022-02-17 19:22:13	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2022-02-17 19:22:48	2022-02-17 19:22:50	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2022-02-17 19:23:23	2022-02-17 19:23:26	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2022-02-17 19:24:01	2022-02-17 19:24:04	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2022-02-17 19:24:40	2022-02-17 19:24:42	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2022-02-17 19:25:16	2022-02-17 19:25:19	25	521	20
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
8	urho
9	kekkonen
10	academy
11	finland
12	facets
13	job
14	satisfaction
15	nine-nation
16	comparative
17	study
18	construct
19	equivalence
20	archival
21	data
22	attitude
23	survey
24	employees
25	single
26	multinational
27	organization
28	examine
29	degree
30	national
31	culture
32	affects
33	nature
34	responses
35	countries
36	compiled
37	create
38	benchmark
39	nations
40	individually
41	compared
42	factor
43	analysis
44	revealed
45	factors
46	organizational
47	communication
48	efficiency
49	effectiveness
50	support
51	personal
52	benefit
53	comparisons
54	structures
55	exhibited
56	satisfied
57	china
58	brazil
59	consistent
60	previous
61	findings
62	individuals
63	collectivistic
64	report
65	higher
66	research
67	suggest
68	cultural
69	context
70	exerts
71	effect
72	craig
73	montgomerie
74	alberta
75	mark
76	irvine
77	victoria
78	computer
79	skill
80	requirements
81	existing
82	teachers
83	implications
84	policy
85	practice
86	integration
87	technology
88	classroom
89	major
90	issue
91	education
92	today
93	provincial
94	initiatives
95	skills
96	students
97	demonstrate
98	grade
99	level
100	government
101	province
102	canada
103	mandated
104	implementation
105	curriculum
106	began
107	september
108	called
109	information
110	infused
111	core
112	courses
113	specifies
114	“expected
115	respect
116	technology”
117	learning
118	required
119	implement
120	school
121	jurisdictions
122	turning
123	professional
124	development
125	strategies
126	hiring
127	standards
128	upgrade
129	teachers’
130	meet
131	goal
132	paper
133	summarizes
134	results
135	telephone
136	administered
137	public
138	response
139	rate
140	examined
141	require
142	newly
143	hired
144	employed
145	integrating
146	diaga
147	diouf
148	alexandria
149	genetic
150	transformation
151	forest
152	trees
153	review
154	recent
155	progress
156	discussed
157	applications
158	engineering
159	improving
160	understanding
161	mechanisms
162	governing
163	genes
164	expression
165	woody
166	plants
167	dana
168	phillips
169	toronto
170	investigating
171	shared
172	background
173	argument
174	critique
175	fogelins
176	thesis
177	deep
178	disagreement
179	robert
180	fogelin
181	claims
182	interlocutors
183	share
184	framework
185	beliefs
186	commitments
187	order
188	fruitfully
189	pursue
190	refute
191	fogelin’s
192	claim
193	productive
194	find
195	consists
196	common
197	topic
198	hand
199	pro-cedural
200	competencies
201	supporters
202	mistakenly
203	view
204	part
205	procedural
206	com-mitments
207	difficult
208	uphold
209	people’s
210	diverge
211	widely
212	domatilia
213	sokoloff
214	college
215	cork
216	developing
217	efficacy
218	equip
219	children
220	knowledge
221	self-belief
222	confident
223	informed
224	citizens
225	continue
226	learners
227	graduation
228	key
229	role
230	nurturing
231	learn
232	participate
233	society
234	conducted
235	social
236	studies
237	presented
238	showing
239	strategy
240	instruction
241	enhance
242	self-efficacy
243	creative
244	problem
245	solving
246	cps
247	taught
248	means
249	motivate
250	shown
251	positive
252	effects
253	valuable
254	involve
255	decision-making
256	leads
257	action
258	enhancing
259	motivation
260	citizenship
261	elinor
262	ostrom
263	indiana
264	frank
265	van
266	laerhoven
267	traditions
268	trends
269	commons
270	expe-
271	rienced
272	substantial
273	growth
274	past
275	decades1
276	distinguished
277	scholars
278	disciplines
279	long
280	studied
281	specific
282	resources
283	managed
284	mismanaged
285	times
286	places
287	coward
288	los
289	reyes
290	mackenzie
291	wittfogel
292	researchers
293	mid-1980s
294	contemporary
295	colleagues
296	work
297	sec-
298	tors
299	region
300	interest
301	regions
302	world
303	pool
304	resource
305	property
306	intellectual
307	developments
308	fabio
309	paglieri
310	rome
311	hansen
312	pinto
313	reason
314	reclaimed
315	john
316	mwandenga
317	cape
318	town
319	signalling
320	theory
321	dividends
322	literature
323	empirical
324	evidence
325	signaling
326	suggests
327	signal
328	future
329	prospects
330	firm
331	offer
332	conclusive
333	conflicting
334	financial
335	economists
336	practical
337	dividend
338	guidance
339	management
340	potential
341	investors
342	shareholding
343	corporate
344	investment
345	financing
346	distribution
347	decisions
348	continuous
349	function
350	rely
351	intuitive
352	evaluation
353	novak
354	aalborg
355	condensing
356	water
357	availability
358	models
359	focus
360	systems
361	texas
362	modeling
363	system
364	routinely
365	applied
366	administration
367	rights
368	permit
369	regional
370	statewide
371	planning
372	expanding
373	variety
374	endeavors
375	river
376	basins
377	state
378	reflects
379	permits
380	reservoirs
381	datasets
382	necessarily
383	large
384	complex
385	provide
386	decision-support
387	capabilities
388	developed
389	features
390	added
391	types
392	growing
393	enhanced
394	simplifying
395	simulation
396	input
397	methodology
398	condensed
399	dataset
400	selected
401	reservoir
402	impacts
403	accompanying
404	removed
405	original
406	complete
407	set
408	streamflows
409	represents
410	flows
411	basin
412	contained
413	model
414	included
415	develop
416	brazos
417	authority
418	based
419	modifying
420	karim
421	al-khafaji
422	stanford
423	margaret
424	morse
425	sustainable
426	design
427	service
428	environmental
429	sustainability
430	principles
431	vital
432	topics
433	largely
434	failed
435	address
436	service-learning
437	integrates
438	academic
439	setting
440	emerging
441	tool
442	leveraged
443	teach
444	engineers
445	present
446	experiences
447	chapter
448	involves
449	identification
450	projects
451	partner
452	organizations
453	student
454	led
455	project-based
456	internships
457	coordinated
458	successful
459	limitations
460	challenges
461	exist
462	directions
463	leo
464	christopher
465	australian
466	sodium
467	butyrate
468	improves
469	performance
470	weaned
471	piglets
472	period
473	weaning
474	aim
475	assess
476	influence
477	long-term
478	fat
479	supplementation
480	fatty
481	acid
482	profile
483	heavy
484	pig
485	adipose
486	tissue
487	fifty-four
488	white
489	barrows
490	averaging
491	randomized
492	matched
493	weights
494	isoenergetic
495	diets
496	supplemented
497	tallow
498	maize
499	oil
500	rapeseed
501	fats
502	supplement-
503	fed
504	slaughtering
505	slaughter
506	backfat
507	samples
508	collected
509	ten
510	animals
511	treatment
512	analyzed
513	composition
514	close-
515	reflected
516	pigs
517	highest
518	saturated
519	content
520	sfa
521	polyunsaturated
522	pufa
523	lowest
524	monounsaturated
525	mufa
526	linolenic
527	c18
528	cis
529	11-
530	ecosenoic
531	c20
532	linoleic
533	levels
534	iodine
535	result-
536	ing
537	accepted
538	parma
539	consortium
540	dry-cured
541	ham
542	unsaturation
543	index
544	layers
545	subcutaneous
546	differed
547	significantly
548	treatments
549	show
550	dietary
551	increases
552	proportion
553	“healthy”
554	acids
555	nutritional
556	quality
557	technological
558	carefully
559	assessed
560	food
561	security
562	lise
563	kumiega
564	hydrologic
565	connectivity
566	edwards
567	aquifer
568	san
569	marcos
570	springs
571	barton
572	drought
573	conditions
574	serves
575	primary
576	supply
577	south-central
578	source
579	plan
580	protect
581	endangered
582	species
583	immediately
584	downstream
585	questions
586	raised
587	established
588	concept
589	divide
590	antonio
591	segments
592	water-level
593	collection
594	program
595	hydrogeologic
596	groundwater-level
597	groundwater
598	exists
599	vicinity
600	surface
601	drainage
602	onion
603	creek
604	blanco
605	wet
606	normal
607	dissipated
608	longer
609	hydrologically
610	separated
611	result
612	flow
613	droughts
614	bearings
615	assessments
616	simulations
617	numerical
618	cfs
619	flowing
620	appears
621	influenced
622	recharge
623	vulnerable
624	extended
625	periods
626	extensive
627	pumping
628	kyle
629	buda
630	shows
631	low
632	gradient
633	potentiometric
634	variation
635	non-drought
636	slopes
637	north
638	dramatic
639	discontinuity
640	change
641	gradients
642	dynamic
643	unknown
644	structural
645	influences
646	hydraulic
647	properties
648	inherent
649	connection
650	rapid
651	population
652	increased
653	demands
654	areas
655	necessitates
656	continual
657	monitoring
658	trend
659	analyses
660	patricia
661	daniel
662	wolverhampton
663	designing
664	intercultural
665	case
666	atlantic
667	coast
668	nicaragua
669	met
670	21st
671	century
672	genuinely
673	embracing
674	diversity
675	overcome
676	barriers
677	people
678	basis
679	language
680	gender
681	takes
682	multilingual
683	multiethnic
684	examines
685	community
686	uraccan
687	contributing
688	interculturality
689	describes
690	participatory
691	carried
692	staff
693	intention
694	defining
695	delivering
696	discussions
697	wales
698	council
699	emphasises
700	belonging
701	individual
702	communities
703	cultures
704	time
705	supporting
706	include
707	university’s
708	close
709	involvement
710	ethnic
711	ethno-linguistic
712	power
713	relations
714	country
715	militate
716	egalitarianism
717	highlights
718	importance
719	pedagogy
720	promoting
721	achieving
722	lasting
723	rana
724	baiyewu
725	nairobi
726	yam
727	diseases
728	nigeria
729	presents
730	combating
731	menace
732	field
733	storage
734	anthracnose
735	regarded
736	spread
737	mosaic
738	virus
739	disease
740	considered
741	severe
742	losses
743	yams
744	dry
745	rot
746	devastating
747	marked
748	reduction
749	quantity
750	marketable
751	edible
752	portions
753	tubers
754	reductions
755	stored
756	adopted
757	advocated
758	includes
759	crop
760	rotation
761	fallowing
762	planting
763	healthy
764	material
765	destruction
766	infected
767	cultivars
768	resistant
769	tecto
770	thiabendazole
771	locally
772	made
773	gins
774	wood
775	ash
776	found
777	fungal
778	infection
779	finally
780	processing
781	chips
782	cubes
783	shelf
784	live
785	months
786	year
787	rosanna
788	rossi
789	barcelona
790	nutrition
791	general
792	situation
793	cattle
794	slaughtered
795	cameroon
796	representative
797	central
798	african
799	sub-region
800	safety
801	beef
802	abattoir
803	yaoundé
804	largest
805	january
806	march
807	pre-slaughter
808	characteristics
809	carcasses
810	recorded
811	longissimus
812	thoracis
813	represent
814	bulls
815	parameters
816	origin
817	guinea
818	high
819	savannah
820	transhumance
821	production
822	gudali
823	fulani
824	red
825	mbororo
826	breeds
827	predominant
828	carcass
829	weight
830	affected
831	rearing
832	category
833	markedly
834	varied
835	meat
836	similar
837	showed
838	toughest
839	cows
840	pregnant
841	abnormal
842	encountered
843	ectoparasites
844	fatigue
845	lameness
846	fungal-like
847	skin
848	lesions
849	enlarged
850	lymph
851	nodes
852	respiratory
853	distress
854	nodular
855	organs
856	condemned
857	liver
858	flukes
859	completely
860	due
861	tuberculosis
862	lungs
863	aid
864	authorities
865	draw
866	programmes
867	strengthen
868	improve
869	control
870	prevent
871	observed
872	promote
873	trade
874	vajiheh
875	karbasizaed
876	tehran
877	antimicrobial
878	metal
879	resistance
880	plasmid
881	coliforms
882	isolated
883	nosocomial
884	infections
885	hospital
886	isfahan
887	iran
888	patterns
889	profiles
890	enterobacteriacea
891	human
892	faeces
893	fifteen
894	isolates
895	identified
896	escherichia
897	coli
898	remaining
899	kelebsiella
900	pneumoniae
901	seventy
902	percent
903	strains
904	possess
905	multiple
906	antibiotics
907	difference
908	minimal
909	inhibitory
910	concentration
911	mic
912	values
913	clinical
914	cases
915	metals
916	significant
917	tolerant
918	persons
919	relationship
920	group
921	pattern
922	conjugative
923	encoding
924	recovered
925	multidrug-resistance
926	valerie
927	williamson
928	self-organization
929	multi-level
930	institutions
931	networked
932	environments
933	compare
934	actors
935	decide
936	sanction
937	sanctions
938	implemented
939	collectively
940	agree
941	actor
942	sanctioned
943	collective
944	sanctioning
945	problematic
946	difficulty
947	reaching
948	consensus
949	decision
950	perverse
951	punishing
952	contributors
953	ruled
954	goverance
955	zita
956	woods
957	cuny
958	finocchiaro
959	arguments
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 959, true);


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
9	8	4
9	9	5
9	10	6
9	11	7
10	12	0
10	13	1
10	14	2
10	15	3
10	16	4
10	17	5
10	18	6
10	19	7
11	20	0
11	21	1
11	22	2
11	23	3
11	24	4
11	25	5
11	26	6
11	27	7
11	28	8
11	29	9
11	30	10
11	31	11
11	32	12
11	33	13
11	13	14
11	14	15
11	34	16
11	35	17
11	36	18
11	37	19
11	38	20
11	39	21
11	40	22
11	41	23
11	42	24
11	43	25
11	44	26
11	45	27
11	46	28
11	47	29
11	46	30
11	48	31
11	49	32
11	46	33
11	50	34
11	51	35
11	52	36
11	53	37
11	42	38
11	54	39
11	46	40
11	47	41
11	55	42
11	18	43
11	19	44
11	51	45
11	52	46
11	56	47
11	24	48
11	57	49
11	56	50
11	58	51
11	59	52
11	60	53
11	61	54
11	62	55
11	63	56
11	39	57
11	64	58
11	65	59
11	14	60
11	66	61
11	61	62
11	67	63
11	30	64
11	68	65
11	69	66
11	70	67
11	71	68
11	33	69
11	13	70
11	14	71
13	24	0
13	23	1
13	26	2
51	243	41
51	244	42
51	245	43
51	246	44
51	247	45
51	219	46
51	248	47
51	249	48
51	50	49
51	117	50
51	250	51
51	246	52
51	251	53
51	252	54
51	242	55
51	117	56
51	253	57
51	184	58
51	254	59
51	219	60
51	255	61
51	256	62
51	235	63
51	257	64
51	83	65
51	258	66
51	242	67
51	259	68
51	231	69
51	88	70
51	156	71
53	91	0
53	260	1
73	315	0
73	316	1
73	3	2
73	317	3
73	318	4
74	319	0
74	320	1
74	321	2
74	153	3
74	322	4
74	323	5
74	324	6
75	325	0
75	320	1
75	326	2
75	321	3
75	327	4
75	328	5
75	329	6
75	330	7
75	154	8
41	167	0
41	168	1
41	3	2
41	169	3
42	170	0
42	171	1
42	172	2
42	118	3
42	173	4
42	174	5
42	175	6
42	176	7
42	177	8
42	178	9
43	179	0
43	180	1
43	181	2
43	182	3
43	183	4
43	184	5
43	172	6
43	185	7
43	186	8
43	187	9
43	188	10
43	189	11
43	173	12
43	190	13
43	191	14
43	192	15
43	170	16
43	171	17
43	172	18
43	118	19
43	193	20
43	173	21
43	194	22
43	172	23
43	195	24
43	196	25
43	185	26
43	197	27
43	198	28
43	171	29
43	199	30
43	186	31
43	200	32
43	67	33
43	180	34
43	201	35
43	202	36
43	203	37
43	171	38
43	185	39
43	204	40
43	118	41
43	172	42
43	193	43
43	173	44
43	205	45
43	206	46
43	207	47
43	208	48
43	209	49
43	185	50
43	210	51
43	211	52
43	197	53
43	198	54
65	308	0
65	309	1
65	3	2
65	310	3
66	311	0
66	312	1
66	313	2
66	314	3
75	323	9
75	324	10
75	331	11
75	332	12
75	324	13
75	90	14
75	333	15
75	84	16
75	83	17
75	334	18
75	335	19
75	336	20
75	337	21
75	84	22
75	338	23
75	339	24
75	81	25
75	340	26
75	341	27
75	342	28
75	343	29
75	344	30
75	345	31
75	346	32
75	347	33
75	348	34
75	349	35
75	339	36
75	337	37
75	347	38
75	350	39
75	351	40
75	352	41
81	315	0
81	353	1
81	354	2
81	3	3
82	355	0
82	356	1
82	357	2
82	358	3
82	359	4
82	281	5
82	356	6
82	339	7
82	360	8
83	361	0
83	356	1
83	357	2
83	362	3
83	363	4
83	364	5
83	365	6
83	366	7
83	356	8
83	367	9
83	368	10
83	363	11
83	369	12
83	370	13
83	371	14
83	372	15
83	373	16
83	374	17
83	362	18
83	356	19
83	339	20
83	375	21
83	376	22
83	377	23
83	378	24
83	356	25
83	379	26
83	380	27
83	381	28
83	382	29
57	261	0
57	262	1
57	263	2
57	3	3
57	264	4
57	265	5
57	266	6
57	263	7
57	3	8
58	267	0
58	268	1
58	17	2
58	269	3
59	17	0
59	269	1
59	270	2
59	271	3
59	272	4
59	273	5
59	124	6
59	274	7
59	275	8
59	276	9
59	277	10
59	278	11
59	279	12
59	280	13
59	281	14
59	282	15
59	283	16
59	284	17
59	285	18
59	286	19
59	287	20
59	288	21
59	289	22
59	290	23
59	291	24
59	292	25
59	280	26
59	281	27
59	269	28
59	293	29
59	294	30
59	295	31
59	223	32
59	296	33
59	277	34
59	278	35
59	297	36
59	298	37
59	299	38
59	300	39
59	301	40
59	302	41
61	196	0
61	303	1
61	304	2
61	196	3
61	305	4
61	306	5
61	307	6
83	383	30
83	384	31
83	385	32
83	386	33
83	387	34
83	362	35
83	363	36
83	388	37
83	362	38
83	389	39
83	390	40
83	391	41
83	157	42
83	392	43
83	157	44
83	393	45
83	394	46
83	395	47
83	396	48
83	381	49
83	359	50
83	356	51
83	339	52
83	360	53
83	397	54
83	237	55
83	216	56
83	398	57
83	399	58
83	400	59
83	401	60
83	363	61
83	378	62
83	402	63
83	356	64
83	367	65
83	403	66
83	380	67
83	404	68
83	405	69
83	406	70
83	399	71
83	407	72
83	408	73
83	388	74
83	409	75
83	410	76
25	72	0
25	73	1
25	3	2
25	74	3
25	75	4
25	76	5
25	3	6
25	77	7
26	78	0
26	79	1
26	80	2
26	81	3
26	82	4
26	83	5
26	84	6
26	85	7
27	86	0
27	87	1
27	88	2
27	89	3
27	90	4
27	91	5
27	92	6
27	30	7
27	93	8
27	94	9
27	87	10
27	95	11
27	96	12
27	97	13
27	98	14
27	99	15
27	100	16
27	101	17
27	74	18
27	102	19
27	103	20
27	104	21
27	105	22
27	106	23
27	107	24
27	108	25
27	109	26
27	47	27
27	87	28
27	105	29
27	110	30
27	111	31
27	112	32
27	113	33
27	96	34
27	114	35
27	115	36
27	116	37
27	74	38
27	117	39
27	82	40
27	118	41
27	119	42
27	105	43
27	120	44
27	121	45
27	122	46
27	123	47
27	124	48
27	125	49
27	126	50
27	127	51
27	128	52
27	129	53
27	78	54
27	95	55
27	130	56
27	131	57
27	132	58
27	133	59
27	134	60
27	135	61
27	23	62
27	136	63
27	137	64
27	120	65
27	121	66
27	101	67
27	74	68
27	138	69
27	139	70
27	140	71
27	78	72
27	95	73
27	120	74
27	121	75
27	141	76
27	142	77
27	143	78
27	82	79
27	50	80
27	125	81
27	144	82
27	144	83
27	82	84
29	145	0
29	87	1
29	78	2
29	95	3
29	23	4
29	74	5
29	30	6
29	93	7
29	123	8
29	124	9
29	24	10
49	212	0
49	213	1
49	3	2
49	214	3
33	146	0
33	147	1
33	148	2
33	3	3
34	149	0
34	150	1
34	151	2
34	152	3
35	153	0
35	154	1
35	155	2
35	149	3
35	150	4
35	151	5
35	152	6
35	156	7
35	157	8
35	149	9
35	158	10
35	159	11
35	151	12
35	152	13
35	160	14
35	161	15
35	162	16
35	163	17
35	164	18
35	165	19
35	166	20
49	215	4
50	216	0
50	217	1
50	185	2
50	88	3
51	89	0
51	131	1
51	91	2
51	218	3
51	219	4
51	220	5
51	95	6
51	221	7
51	222	8
51	223	9
51	224	10
51	224	11
51	225	12
51	226	13
51	227	14
51	132	15
51	228	16
51	229	17
51	230	18
51	217	19
51	185	20
51	187	21
51	231	22
51	232	23
51	120	24
51	233	25
51	66	26
51	61	27
51	234	28
51	235	29
51	236	30
51	69	31
51	237	32
51	238	33
51	239	34
51	240	35
51	241	36
51	242	37
51	117	38
51	204	39
51	66	40
83	400	77
83	363	78
83	252	79
83	356	80
83	367	81
83	375	82
83	411	83
83	412	84
83	405	85
83	406	86
83	413	87
83	396	88
83	399	89
83	414	90
83	398	91
83	399	92
83	397	93
83	365	94
83	415	95
83	398	96
83	413	97
83	416	98
83	375	99
83	417	100
83	401	101
83	363	102
83	418	103
83	419	104
83	361	105
83	356	106
83	357	107
83	362	108
83	363	109
83	399	110
83	416	111
83	375	112
83	411	113
85	356	0
89	420	0
89	421	1
89	422	2
89	3	3
89	423	4
89	424	5
89	422	6
89	3	7
90	117	0
90	425	1
90	426	2
90	427	3
91	428	0
91	429	1
91	425	2
91	124	3
91	430	4
91	431	5
91	432	6
91	158	7
91	91	8
91	433	9
91	434	10
91	435	11
91	436	12
91	437	13
91	235	14
91	427	15
91	438	16
91	439	17
91	440	18
91	441	19
91	442	20
91	443	21
91	425	22
91	426	23
91	328	24
91	444	25
91	445	26
91	413	27
91	436	28
91	443	29
91	425	30
91	426	31
91	418	32
91	446	33
91	422	34
91	447	35
91	444	36
91	425	37
91	302	38
91	413	39
91	448	40
91	449	41
91	450	42
91	451	43
91	452	44
91	453	45
91	454	46
91	455	47
91	426	48
91	456	49
91	457	50
91	451	51
91	452	52
91	413	53
91	458	54
91	459	55
91	460	56
91	461	57
91	156	58
91	328	59
91	462	60
91	372	61
91	413	62
93	124	0
93	158	1
93	91	2
93	427	3
93	117	4
93	429	5
97	463	0
97	464	1
97	465	2
97	30	3
97	3	4
98	466	0
98	467	1
98	468	2
98	273	3
98	469	4
98	470	5
98	471	6
98	472	7
98	473	8
99	474	0
99	17	1
99	475	2
99	476	3
99	477	4
99	478	5
99	479	6
99	480	7
99	481	8
99	482	9
99	483	10
99	484	11
99	485	12
99	486	13
99	487	14
99	383	15
99	488	16
99	489	17
99	490	18
99	491	19
99	492	20
99	493	21
99	494	22
99	495	23
99	496	24
99	497	25
99	498	26
99	499	27
99	500	28
99	499	29
99	501	30
99	502	31
99	503	32
99	504	33
99	505	34
99	506	35
99	507	36
99	508	37
99	509	38
99	510	39
99	511	40
99	512	41
99	480	42
99	481	43
99	513	44
99	506	45
99	514	46
99	515	47
99	480	48
99	481	49
99	513	50
99	496	51
99	501	52
99	506	53
99	516	54
99	503	55
99	517	56
99	518	57
99	480	58
99	481	59
99	519	60
99	520	61
99	503	62
99	517	63
99	519	64
99	521	65
99	480	66
99	481	67
99	522	68
99	523	69
99	524	70
99	480	71
99	481	72
99	525	73
99	519	74
99	503	75
99	517	76
99	519	77
99	526	78
99	481	79
99	527	80
99	528	81
99	529	82
99	530	83
99	481	84
99	531	85
99	511	86
99	71	87
99	532	88
99	481	89
99	533	90
99	534	91
99	506	92
99	535	93
99	536	94
99	533	95
99	65	96
99	527	97
99	537	98
99	538	99
99	539	100
99	540	101
99	541	102
99	542	103
99	543	104
99	544	105
99	545	106
99	506	107
99	486	108
99	546	109
99	547	110
99	548	111
99	134	112
99	549	113
99	477	114
99	550	115
99	479	116
99	501	117
99	480	118
99	481	119
99	482	120
99	483	121
99	484	122
99	485	123
99	486	124
99	479	125
99	500	126
99	499	127
99	551	128
99	552	129
99	553	130
99	480	131
99	554	132
99	484	133
99	478	134
99	159	135
99	555	136
99	556	137
99	252	138
99	557	139
99	556	140
99	478	141
99	558	142
99	559	143
101	516	0
101	560	1
101	561	2
105	562	0
105	563	1
105	3	2
105	317	3
105	318	4
106	564	0
106	565	1
106	566	2
106	567	3
106	568	4
106	569	5
106	570	6
106	571	7
106	570	8
106	572	9
106	573	10
107	566	0
107	567	1
107	574	2
107	575	3
107	356	4
107	576	5
107	577	6
107	361	7
107	578	8
107	89	9
107	570	10
107	216	11
107	579	12
107	580	13
107	581	14
107	582	15
107	583	16
107	584	17
107	568	18
107	569	19
107	570	20
107	585	21
107	586	22
107	587	23
107	588	24
107	564	25
107	589	26
107	568	27
107	590	28
107	571	29
107	570	30
107	591	31
107	566	32
107	567	33
107	572	34
107	573	35
107	435	36
107	585	37
107	592	38
107	21	39
107	593	40
107	594	41
107	595	42
107	17	43
107	234	44
107	43	45
107	596	46
107	21	47
107	597	48
107	589	49
107	598	50
107	599	51
107	600	52
107	601	53
107	589	54
107	602	55
107	603	56
107	604	57
107	375	58
107	605	59
107	606	60
107	564	61
107	573	62
107	43	63
107	21	64
107	508	65
107	572	66
107	326	67
107	597	68
107	589	69
107	607	70
107	608	71
107	609	72
107	610	73
107	591	74
107	611	75
107	340	76
107	597	77
107	612	78
107	274	79
107	568	80
107	569	81
107	570	82
107	571	83
107	570	84
107	89	85
107	613	86
107	83	87
107	614	88
107	339	89
107	357	90
107	597	91
107	566	92
107	567	93
107	615	94
107	616	95
107	617	96
107	413	97
107	67	98
107	618	99
107	619	100
107	274	101
107	568	102
107	569	103
107	571	104
107	570	105
107	572	106
107	573	107
107	597	108
107	589	109
107	620	110
107	621	111
107	622	112
107	602	113
107	603	114
107	604	115
107	375	116
107	620	117
107	623	118
107	624	119
107	625	120
107	622	121
107	626	122
107	627	123
107	599	124
107	628	125
107	629	126
107	21	127
107	407	128
107	630	129
107	631	130
107	632	131
107	633	132
107	600	133
107	568	134
107	569	135
107	570	136
107	628	137
107	634	138
107	533	139
107	572	140
107	635	141
107	625	142
107	628	143
107	571	144
107	570	145
107	633	146
107	600	147
107	636	148
107	547	149
107	637	150
107	638	151
107	533	152
107	572	153
107	635	154
107	625	155
107	578	156
107	33	157
107	639	158
107	640	159
107	633	160
107	641	161
107	642	162
107	356	163
107	99	164
107	138	165
107	628	166
107	643	167
107	644	168
107	645	169
107	646	170
107	647	171
107	648	172
107	567	173
107	639	174
107	476	175
107	29	176
107	564	177
107	649	178
107	568	179
107	569	180
107	571	181
107	570	182
107	650	183
107	651	184
107	273	185
107	652	186
107	356	187
107	653	188
107	628	189
107	629	190
107	654	191
107	655	192
107	656	193
107	597	194
107	99	195
107	657	196
107	594	197
107	568	198
107	569	199
107	570	200
107	629	201
107	385	202
107	21	203
107	328	204
107	595	205
107	658	206
107	659	207
109	356	0
113	660	0
113	661	1
113	3	2
113	662	3
114	663	0
114	664	1
114	105	2
114	665	3
114	17	4
114	666	5
114	667	6
114	668	7
115	460	0
115	669	1
115	670	2
115	671	3
115	672	4
115	673	5
115	674	6
115	91	7
115	675	8
115	676	9
115	225	10
115	461	11
115	677	12
115	678	13
115	679	14
115	31	15
115	680	16
115	665	17
115	17	18
115	681	19
115	666	20
115	667	21
115	668	22
115	682	23
115	683	24
115	299	25
115	684	26
115	685	27
115	3	28
115	686	29
115	687	30
115	124	31
115	688	32
115	689	33
115	690	34
115	66	35
115	691	36
115	3	37
115	692	38
115	96	39
115	693	40
115	694	41
115	664	42
115	105	43
115	125	44
115	695	45
115	413	46
115	678	47
115	696	48
115	413	49
115	685	50
115	160	51
115	697	52
115	105	53
115	698	54
115	699	55
115	700	56
115	701	57
115	702	58
115	703	59
115	704	60
115	45	61
115	705	62
115	124	63
115	664	64
115	105	65
115	706	66
115	707	67
115	708	68
115	709	69
115	710	70
115	702	71
115	574	72
115	711	73
115	712	74
115	713	75
115	299	76
115	714	77
115	715	78
115	716	79
115	3	80
115	66	81
115	717	82
115	718	83
115	690	84
115	719	85
115	678	86
115	720	87
115	688	88
115	721	89
115	722	90
115	235	91
115	150	92
117	670	0
117	671	1
117	674	2
117	682	3
117	683	4
117	690	5
117	719	6
117	679	7
117	31	8
117	680	9
117	716	10
117	235	11
117	150	12
121	723	0
121	724	1
121	3	2
121	725	3
122	726	0
122	727	1
122	339	2
122	728	3
123	153	0
123	729	1
123	727	2
123	726	3
123	339	4
123	125	5
123	144	6
123	730	7
123	731	8
123	728	9
123	732	10
123	733	11
123	727	12
123	237	13
123	734	14
123	735	15
123	211	16
123	736	17
123	732	18
123	727	19
123	726	20
123	737	21
123	738	22
123	739	23
123	740	24
123	741	25
123	742	26
123	743	27
123	744	28
123	745	29
123	740	30
123	746	31
123	733	32
123	727	33
123	726	34
123	744	35
123	745	36
123	743	37
123	747	38
123	748	39
123	749	40
123	750	41
123	751	42
123	752	43
123	753	44
123	754	45
123	741	46
123	755	47
123	743	48
123	339	49
123	125	50
123	756	51
123	757	52
123	730	53
123	732	54
123	727	55
123	758	56
123	759	57
123	760	58
123	761	59
123	762	60
123	763	61
123	764	62
123	765	63
123	766	64
123	759	65
123	767	66
123	768	67
123	767	68
123	733	69
123	727	70
123	769	71
123	770	72
123	771	73
123	772	74
123	744	75
123	773	76
123	774	77
123	775	78
123	733	79
123	776	80
123	580	81
123	726	82
123	753	83
123	777	84
123	778	85
123	733	86
123	779	87
123	780	88
123	726	89
123	753	90
123	781	91
123	782	92
123	551	93
123	783	94
123	784	95
123	472	96
123	785	97
123	786	98
129	787	0
129	788	1
129	789	2
129	3	3
130	476	0
130	477	1
130	790	2
130	550	3
130	501	4
130	480	5
130	481	6
130	513	7
130	483	8
130	516	9
130	506	10
131	474	0
131	66	1
131	385	2
131	791	3
131	792	4
131	793	5
131	794	6
131	795	7
131	796	8
131	797	9
131	798	10
131	799	11
131	556	12
131	800	13
131	801	14
131	802	15
131	803	16
131	804	17
131	795	18
131	740	19
131	805	20
131	806	21
131	807	22
131	573	23
131	808	24
131	793	25
131	809	26
131	810	27
131	811	28
131	812	29
131	505	30
131	809	31
131	400	32
131	813	33
131	814	34
131	794	35
131	556	36
131	815	37
131	513	38
131	811	39
131	812	40
131	691	41
131	816	42
131	793	43
131	817	44
131	818	45
131	819	46
131	820	47
131	196	48
131	821	49
131	363	50
131	822	51
131	488	52
131	823	53
131	824	54
131	825	55
131	826	56
131	827	57
131	828	58
131	829	59
131	830	60
131	831	61
131	363	62
131	793	63
131	832	64
131	833	65
131	834	66
131	786	67
131	835	68
131	556	69
131	478	70
131	519	71
131	631	72
131	836	73
131	826	74
131	822	75
131	837	76
131	838	77
131	835	78
131	839	79
131	794	80
131	840	81
131	196	82
131	841	83
131	573	84
131	842	85
131	843	86
131	844	87
131	845	88
131	846	89
131	847	90
131	848	91
131	849	92
131	850	93
131	851	94
131	852	95
131	853	96
131	854	97
131	848	98
131	809	99
131	855	100
131	856	101
131	857	102
131	858	103
131	859	104
131	856	105
131	860	106
131	861	107
131	830	108
131	862	109
131	21	110
131	863	111
131	864	112
131	865	113
131	866	114
131	474	115
131	867	116
131	793	117
131	821	118
131	868	119
131	801	120
131	576	121
131	869	122
131	870	123
131	871	124
131	727	125
131	872	126
131	369	127
131	873	128
133	793	0
133	560	1
133	561	2
137	874	0
137	875	1
137	3	2
137	876	3
138	877	0
138	483	1
138	878	2
138	879	3
138	880	4
138	482	5
138	881	6
138	882	7
138	883	8
138	884	9
138	885	10
138	886	11
138	887	12
139	877	0
139	483	1
139	878	2
139	879	3
139	888	4
139	880	5
139	889	6
139	881	7
139	890	8
139	882	9
139	883	10
139	884	11
139	763	12
139	891	13
139	892	14
139	41	15
139	893	16
139	894	17
139	883	18
139	884	19
139	895	20
139	896	21
139	897	22
139	898	23
139	899	24
139	900	25
139	901	26
139	902	27
139	903	28
139	882	29
139	883	30
139	884	31
139	904	32
139	905	33
139	879	34
139	906	35
139	41	36
139	903	37
139	763	38
139	891	39
139	892	40
139	907	41
139	908	42
139	909	43
139	910	44
139	911	45
139	912	46
139	903	47
139	913	48
139	914	49
139	892	50
139	483	51
139	915	52
139	916	53
139	903	54
139	882	55
139	885	56
139	917	57
139	483	58
139	878	59
139	763	60
139	918	61
139	59	62
139	919	63
139	880	64
139	482	65
139	920	66
139	877	67
139	879	68
139	921	69
139	922	70
139	880	71
139	923	72
139	879	73
139	483	74
139	915	75
139	906	76
139	924	77
139	903	78
139	882	79
139	883	80
139	884	81
139	134	82
139	925	83
139	881	84
139	340	85
139	883	86
139	778	87
139	299	88
145	926	0
145	927	1
145	3	2
145	7	3
146	928	0
146	929	1
146	930	2
146	931	3
146	932	4
147	933	0
147	439	1
147	934	2
147	40	3
147	935	4
147	936	5
147	439	6
147	937	7
147	938	8
147	934	9
147	939	10
147	940	11
147	941	12
147	942	13
147	943	14
147	944	15
147	347	16
147	945	17
147	860	18
147	946	19
147	947	20
147	948	21
147	949	22
147	772	23
147	939	24
147	950	25
147	944	26
147	951	27
147	818	28
147	952	29
147	701	30
147	934	31
147	953	32
147	943	33
147	944	34
147	347	35
147	300	36
147	920	37
149	928	0
149	929	1
149	930	2
149	954	3
153	955	0
153	956	1
153	957	2
154	958	0
154	959	1
154	959	2
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
25	3	1	0
26	3	2	0
27	3	4	0
28	3	16	0
29	3	17	0
30	3	8	0
31	3	32	0
32	3	64	0
33	4	1	0
34	4	2	0
35	4	4	0
36	4	16	0
37	4	17	0
38	4	8	0
39	4	32	0
40	4	64	0
41	5	1	0
42	5	2	0
43	5	4	0
44	5	16	0
45	5	17	0
46	5	8	0
47	5	32	0
48	5	64	0
49	6	1	0
50	6	2	0
51	6	4	0
52	6	16	0
53	6	17	0
54	6	8	0
55	6	32	0
56	6	64	0
57	7	1	0
58	7	2	0
59	7	4	0
60	7	16	0
61	7	17	0
62	7	8	0
63	7	32	0
64	7	64	0
65	8	1	0
66	8	2	0
67	8	4	0
68	8	16	0
69	8	17	0
70	8	8	0
71	8	32	0
72	8	64	0
73	9	1	0
74	9	2	0
75	9	4	0
76	9	16	0
77	9	17	0
78	9	8	0
79	9	32	0
80	9	64	0
81	10	1	0
82	10	2	0
83	10	4	0
84	10	16	0
85	10	17	0
86	10	8	0
87	10	32	0
88	10	64	0
89	11	1	0
90	11	2	0
91	11	4	0
92	11	16	0
93	11	17	0
94	11	8	0
95	11	32	0
96	11	64	0
97	12	1	0
98	12	2	0
99	12	4	0
100	12	16	0
101	12	17	0
102	12	8	0
103	12	32	0
104	12	64	0
105	13	1	0
106	13	2	0
107	13	4	0
108	13	16	0
109	13	17	0
110	13	8	0
111	13	32	0
112	13	64	0
113	14	1	0
114	14	2	0
115	14	4	0
116	14	16	0
117	14	17	0
118	14	8	0
119	14	32	0
120	14	64	0
121	15	1	0
122	15	2	0
123	15	4	0
124	15	16	0
125	15	17	0
126	15	8	0
127	15	32	0
128	15	64	0
129	16	1	0
130	16	2	0
131	16	4	0
132	16	16	0
133	16	17	0
134	16	8	0
135	16	32	0
136	16	64	0
137	17	1	0
138	17	2	0
139	17	4	0
140	17	16	0
141	17	17	0
142	17	8	0
143	17	32	0
144	17	64	0
145	18	1	0
146	18	2	0
147	18	4	0
148	18	16	0
149	18	17	0
150	18	8	0
151	18	32	0
152	18	64	0
153	19	1	0
154	19	2	0
155	19	4	0
156	19	16	0
157	19	17	0
158	19	8	0
159	19	32	0
160	19	64	0
\.


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 160, true);


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
14	1	15	2022-02-17 19:22:27	2022-02-17 19:22:19	2022-02-17 19:22:27	5	en_US	3	0	0
1	1	1	2022-02-17 19:13:53	2022-02-17 19:13:53	2022-02-17 19:13:53	5	en_US	1	0	0
5	1	6	2022-02-17 19:16:55	2022-02-17 19:16:48	2022-02-17 19:16:55	5	en_US	3	0	0
10	1	11	2022-02-17 19:19:54	2022-02-17 19:19:45	2022-02-17 19:19:54	5	en_US	3	0	0
18	1	19	2022-02-17 19:24:56	2022-02-17 19:24:47	2022-02-17 19:24:56	5	en_US	3	0	0
2	1	2	2022-02-17 19:14:43	2022-02-17 19:14:19	2022-02-17 19:14:43	5	en_US	3	0	0
6	1	7	2022-02-17 19:17:29	2022-02-17 19:17:22	2022-02-17 19:17:29	5	en_US	3	0	0
15	1	16	2022-02-17 19:23:03	2022-02-17 19:22:55	2022-02-17 19:23:03	5	en_US	3	0	0
11	1	12	2022-02-17 19:20:35	2022-02-17 19:20:25	2022-02-17 19:20:35	5	en_US	3	0	0
7	1	8	2022-02-17 19:18:07	2022-02-17 19:17:59	2022-02-17 19:18:07	5	en_US	3	0	0
19	1	20	2022-02-17 19:25:31	2022-02-17 19:25:22	2022-02-17 19:25:31	5	en_US	3	0	0
3	1	4	2022-02-17 19:15:46	2022-02-17 19:15:14	2022-02-17 19:15:46	5	en_US	3	0	0
16	1	17	2022-02-17 19:23:40	2022-02-17 19:23:32	2022-02-17 19:23:40	5	en_US	3	0	0
12	1	13	2022-02-17 19:21:13	2022-02-17 19:21:03	2022-02-17 19:21:13	5	en_US	3	0	0
8	1	9	2022-02-17 19:18:42	2022-02-17 19:18:33	2022-02-17 19:18:42	5	en_US	3	0	0
4	1	5	2022-02-17 19:16:20	2022-02-17 19:16:12	2022-02-17 19:16:20	5	en_US	3	0	0
9	1	10	2022-02-17 19:19:18	2022-02-17 19:19:09	2022-02-17 19:19:18	5	en_US	3	0	0
13	1	14	2022-02-17 19:21:51	2022-02-17 19:21:43	2022-02-17 19:21:51	5	en_US	3	0	0
17	1	18	2022-02-17 19:24:19	2022-02-17 19:24:10	2022-02-17 19:24:19	5	en_US	3	0	0
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
13	en_US	givenName	Elinor
3	en_US	preferredPublicName	
18	en_US	affiliation	Australian National University
18	en_US	familyName	Christopher
10	en_US	affiliation	Alexandria University
9	en_US	affiliation	University of Alberta
9	en_US	familyName	Montgomerie
9	en_US	givenName	Craig
10	en_US	familyName	Diouf
10	en_US	givenName	Diaga
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
12	en_US	affiliation	University College Cork
12	en_US	familyName	Sokoloff
1	en_US	familyName	admin
12	en_US	givenName	Domatilia
18	en_US	givenName	Leo
3	en_US	familyName	Barnes
3	en_US	givenName	Daniel
15	en_US	affiliation	University of Cape Town
15	en_US	familyName	Mwandenga
15	en_US	givenName	John
3	en_US	signature	
16	en_US	affiliation	Aalborg University
16	en_US	familyName	Novak
16	en_US	givenName	John
11	en_US	affiliation	University of Toronto
11	en_US	familyName	Phillips
11	en_US	givenName	Dana
14	en_US	affiliation	University of Rome
14	en_US	familyName	Paglieri
14	en_US	givenName	Fabio
19	en_US	affiliation	University of Cape Town
13	en_US	affiliation	Indiana University
13	en_US	familyName	Ostrom
19	en_US	familyName	Kumiega
19	en_US	givenName	Lise
3	fr_CA	affiliation	
17	en_US	affiliation	Stanford University
17	en_US	familyName	Al-Khafaji
17	en_US	givenName	Karim
3	fr_CA	biography	
20	en_US	affiliation	University of Wolverhampton
3	en_US	biography	
20	en_US	familyName	Daniel
3	fr_CA	signature	
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
3	fr_CA	familyName	
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
16	jnovak	$2y$10$GvRkdhJ90mVSEEF1mCfhmuyOAtClDB4Oyfq5Sixpz2jszSduKKgjm	jnovak@mailinator.com	\N	\N	\N	\N	DK	\N	\N	\N	2022-02-17 19:19:24	\N	2022-02-17 19:19:25	\N	\N	\N	0	\N	1
17	kalkhafaji	$2y$10$zHsba9gpxLo1FKIzs4hCEOThXO7Tx1rhBlRS23Z.RR7avv1Ke13Mq	kalkhafaji@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-02-17 19:20:01	\N	2022-02-17 19:20:01	\N	\N	\N	0	\N	1
4	dbuskins	$2y$10$X7obcDfvYdybUvQlnnACC.AJysXdySzE/qhH4dnLe2rqDqrywGtKe	dbuskins@mailinator.com				\N	US	[]	\N	\N	2022-02-17 19:12:24	\N	\N	0	0	\N	0	\N	1
5	sberardo	$2y$10$4RdvFOz65LLsmZgGimbUiuNwn9/dMoBtUM9i2wNcPtkQDi97lPiyq	sberardo@mailinator.com				\N	CA	[]	\N	\N	2022-02-17 19:12:33	\N	\N	0	0	\N	0	\N	1
6	minoue	$2y$10$IULeH7LrlkbrV72YRSDqBOtVe6h2EHwzluIgsrPP4fzG2kYHqrplW	minoue@mailinator.com				\N	JP	[]	\N	\N	2022-02-17 19:12:43	\N	\N	0	0	\N	0	\N	1
25	zwoods	$2y$10$4iCzUbIFcvncUdM2CdDHJejhaGoZ5nNigUd1cFb9hOG6TdIMbq9aG	zwoods@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-02-17 19:25:03	\N	2022-02-17 19:25:03	\N	\N	\N	0	\N	1
2	rvaca	$2y$10$BqfZ2VfZoG6Y41PAA8wuduEbyf2sL5MRwy3pyiZ15BIyNOOlN6Ggq	rvaca@mailinator.com				\N	MX	[]	\N	\N	2022-02-17 19:12:09	\N	2022-02-17 19:12:51	0	0	\N	0	\N	1
18	lchristopher	$2y$10$QZSz43ipM/z.vPiqnDMz9.LbgMcmCH3a2/UH4maF5twevtFUCXJhC	lchristopher@mailinator.com	\N	\N	\N	\N	AU	\N	\N	\N	2022-02-17 19:20:42	\N	2022-02-17 19:20:42	\N	\N	\N	0	\N	1
1	admin	$2y$10$0Rma25lSyqTgs3d2bJbefODYYYZJrR8GGJ1OYTi9cioGrxLkcWSzi	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	\N	\N	\N	2022-02-17 19:11:02	\N	2022-02-17 19:13:02	\N	\N	\N	0	\N	1
7	ccorino	$2y$10$gTDCcM1JM7pYwLU663nche7M05HFz2l2VKghiNO52L6ePccEJqo6a	ccorino@mailinator.com	\N	\N	\N	\N	IT	\N	\N	\N	2022-02-17 19:13:31	\N	2022-02-17 19:13:32	\N	\N	\N	0	\N	1
8	ckwantes	$2y$10$VyO/heLL1U7lioqqqdwfdOWbP29lLf8uqXndE0W2a8rtvok1u6SAS	ckwantes@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-17 19:13:57	\N	2022-02-17 19:13:57	\N	\N	\N	0	\N	1
3	dbarnes	$2y$10$D6s56LBUTuBqrqPFaVFK9Of4j0oM4cr7RufaKKfQQyGXOH3czB68m	dbarnes@mailinator.com				\N	AU	[]	\N	\N	2022-02-17 19:12:16	\N	2022-02-17 19:25:24	0	0	\N	0	\N	1
9	cmontgomerie	$2y$10$mGO.Thqd1vthu3ixxjYKl.WUn1Ltu/2Z/9oofYaWiKbQNw3K8I7ey	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-17 19:14:49	\N	2022-02-17 19:14:49	\N	\N	\N	0	\N	1
19	lkumiega	$2y$10$hSjCVVKT46KT.bYUyP4MFe/ERLxiQIN2j2scRET0Rxrs20ChYAmfi	lkumiega@mailinator.com	\N	\N	\N	\N	ZA	\N	\N	\N	2022-02-17 19:21:20	\N	2022-02-17 19:21:20	\N	\N	\N	0	\N	1
10	ddiouf	$2y$10$uqbs/NFD/wv0nGAfEWqJQe9MhfKKpnNtxm/IRZPvBMyVE1ZcZYqtS	ddiouf@mailinator.com	\N	\N	\N	\N	EG	\N	\N	\N	2022-02-17 19:15:52	\N	2022-02-17 19:15:52	\N	\N	\N	0	\N	1
11	dphillips	$2y$10$KOAv6Otz7xLdb/TWJvO33e8o3TThtevsnir04ZaSHe5lu0TikK4Oi	dphillips@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-17 19:16:26	\N	2022-02-17 19:16:26	\N	\N	\N	0	\N	1
12	dsokoloff	$2y$10$oIdM2GS4uILG7tUKioKVm.oxCwMGFtq1oqFnZfg1Se3T09CSU0YDK	dsokoloff@mailinator.com	\N	\N	\N	\N	IE	\N	\N	\N	2022-02-17 19:17:01	\N	2022-02-17 19:17:01	\N	\N	\N	0	\N	1
20	pdaniel	$2y$10$cc6PQ42Hnmqamof.TU1ZQeqgougxKnEHsJQ2lcgWhpABJ4XSZTAMm	pdaniel@mailinator.com	\N	\N	\N	\N	GB	\N	\N	\N	2022-02-17 19:21:57	\N	2022-02-17 19:21:57	\N	\N	\N	0	\N	1
13	eostrom	$2y$10$5UdCX7txssoKKryR2E7h6u3zW0pJCBb70jYQYrAUBnHxmyjpJOLem	eostrom@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-02-17 19:17:35	\N	2022-02-17 19:17:35	\N	\N	\N	0	\N	1
14	fpaglieri	$2y$10$9Jiur3E/tRgDKk033IWsbeMX.Cabd.qDFKwm4kRYsO06wj4cqOq3e	fpaglieri@mailinator.com	\N	\N	\N	\N	IT	\N	\N	\N	2022-02-17 19:18:13	\N	2022-02-17 19:18:13	\N	\N	\N	0	\N	1
15	jmwandenga	$2y$10$jhou9xBI4ATbODfgPqfE5uSFtmTbI1uSfgz.bzDO0n2qB.zCdLfVu	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA	\N	\N	\N	2022-02-17 19:18:48	\N	2022-02-17 19:18:49	\N	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$3JiIJdic.EniTG7oQmPdiuwgtaPdwXS0qGL5mufxfrjERSHbvxCS.	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE	\N	\N	\N	2022-02-17 19:22:34	\N	2022-02-17 19:22:34	\N	\N	\N	0	\N	1
22	rrossi	$2y$10$26lNhTmwfxI/qkqEkhERr.s/S2KS9eSVKwrWlZSfxCdMeus7IUaoi	rrossi@mailinator.com	\N	\N	\N	\N	ES	\N	\N	\N	2022-02-17 19:23:10	\N	2022-02-17 19:23:10	\N	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$MprYcN/0jIyPInBQ3ZQNBugAotANc3UuU96QlIVdTabRD7B.9C3Ey	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR	\N	\N	\N	2022-02-17 19:23:48	\N	2022-02-17 19:23:48	\N	\N	\N	0	\N	1
24	vwilliamson	$2y$10$W.7it2GauFK0rIWXiyHjSeIavHuiYwPoiHcF1dkMKlF.vGoBKF2ZS	vwilliamson@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-02-17 19:24:26	\N	2022-02-17 19:24:26	\N	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2022-02-17 19:11:02	1	plugins.metadata	dc11		0	0
1	0	1	0	2022-02-17 19:11:02	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	2	0	0	2022-02-17 19:11:02	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	2	0	0	2022-02-17 19:11:02	1	plugins.generic	acron	AcronPlugin	1	1
1	0	1	0	2022-02-17 19:11:02	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	1	3	0	2022-02-17 19:11:02	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
2	2	0	0	2022-02-17 19:11:02	1	plugins.generic	crossref		0	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	1	0	0	2022-02-17 19:11:02	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.generic	usageEvent		0	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.importexport	native		0	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2022-02-17 19:11:02	1	plugins.themes	default	DefaultThemePlugin	1	0
3	4	0	0	2022-02-17 19:11:01	1	core	ops		0	1
1	1	0	0	2022-02-17 19:11:02	1	plugins.reports	counterReport		0	0
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
-- Name: doi_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_pkey UNIQUE (doi_id, locale, setting_name);


--
-- Name: dois_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_pkey PRIMARY KEY (doi_id);


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
-- Name: doi_settings_doi_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX doi_settings_doi_id ON public.doi_settings USING btree (doi_id);


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
-- Name: doi_settings_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id);


--
-- Name: dois_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id);


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
-- Name: publication_galleys_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: publication_galleys_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: publications_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


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

