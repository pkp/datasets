--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.18
-- Dumped by pg_dump version 10.13 (Ubuntu 10.13-1.pgdg16.04+1)

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
DROP INDEX public.submissions_context_id;
DROP INDEX public.submission_settings_submission_id;
DROP INDEX public.submission_settings_pkey;
DROP INDEX public.submission_search_object_keywords_pkey;
DROP INDEX public.submission_search_object_keywords_keyword_id;
DROP INDEX public.submission_search_keyword_text;
DROP INDEX public.submission_files_submission_id;
DROP INDEX public.submission_files_stage_assoc;
DROP INDEX public.submission_file_settings_pkey;
DROP INDEX public.submission_file_settings_id;
DROP INDEX public.submission_comments_submission_id;
DROP INDEX public.submission_chapter_settings_pkey;
DROP INDEX public.submission_chapter_settings_chapter_id;
DROP INDEX public.static_page_settings_static_page_id;
DROP INDEX public.static_page_settings_pkey;
DROP INDEX public.stage_assignments_user_id;
DROP INDEX public.stage_assignments_user_group_id;
DROP INDEX public.stage_assignments_submission_id;
DROP INDEX public.stage_assignment;
DROP INDEX public.spotlights_assoc;
DROP INDEX public.spotlight_settings_pkey;
DROP INDEX public.spotlight_settings_id;
DROP INDEX public.site_settings_pkey;
DROP INDEX public.sessions_user_id;
DROP INDEX public.sessions_pkey;
DROP INDEX public.series_settings_pkey;
DROP INDEX public.series_press_id;
DROP INDEX public.series_path;
DROP INDEX public.series_editors_user_id;
DROP INDEX public.series_editors_series_id;
DROP INDEX public.series_editors_press_id;
DROP INDEX public.series_editors_pkey;
DROP INDEX public.series_categories_id;
DROP INDEX public.section_editors_user_id;
DROP INDEX public.section_editors_section_id;
DROP INDEX public.section_editors_pkey;
DROP INDEX public.section_editors_context_id;
DROP INDEX public.scheduled_tasks_pkey;
DROP INDEX public.review_rounds_submission_id_stage_id_round_pkey;
DROP INDEX public.review_rounds_submission_id;
DROP INDEX public.review_round_files_submission_id;
DROP INDEX public.review_round_files_pkey;
DROP INDEX public.review_form_settings_review_form_id;
DROP INDEX public.review_form_settings_pkey;
DROP INDEX public.review_form_responses_pkey;
DROP INDEX public.review_form_elements_review_form_id;
DROP INDEX public.review_form_element_settings_review_form_element_id;
DROP INDEX public.review_form_element_settings_pkey;
DROP INDEX public.review_files_review_id;
DROP INDEX public.review_files_pkey;
DROP INDEX public.review_assignments_submission_id;
DROP INDEX public.review_assignments_reviewer_review;
DROP INDEX public.review_assignments_reviewer_id;
DROP INDEX public.review_assignments_form_id;
DROP INDEX public.query_participants_pkey;
DROP INDEX public.queries_assoc_id;
DROP INDEX public.publications_submission_id;
DROP INDEX public.publications_section_id;
DROP INDEX public.publication_settings_publication_id;
DROP INDEX public.publication_settings_pkey;
DROP INDEX public.publication_format_submission_id;
DROP INDEX public.publication_format_settings_pkey;
DROP INDEX public.publication_format_id_key;
DROP INDEX public.publication_categories_id;
DROP INDEX public.press_settings_press_id;
DROP INDEX public.press_settings_pkey;
DROP INDEX public.press_path;
DROP INDEX public.press_features_pkey;
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
DROP INDEX public.new_releases_pkey;
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
DROP INDEX public.library_file_settings_pkey;
DROP INDEX public.library_file_settings_id;
DROP INDEX public.item_views_pkey;
DROP INDEX public.identification_codes_key;
DROP INDEX public.genre_settings_pkey;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.format_sales_rights_pkey;
DROP INDEX public.format_representatives_pkey;
DROP INDEX public.format_publication_dates_pkey;
DROP INDEX public.format_markets_pkey;
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
DROP INDEX public.chapters_publication_id;
DROP INDEX public.chapters_chapter_id;
DROP INDEX public.chapter_authors_pkey;
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
ALTER TABLE ONLY public.submission_supplementary_files DROP CONSTRAINT submission_supplementary_files_pkey;
ALTER TABLE ONLY public.submission_search_objects DROP CONSTRAINT submission_search_objects_pkey;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_list_pkey;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_pkey;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_pkey;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_pkey;
ALTER TABLE ONLY public.submission_artwork_files DROP CONSTRAINT submission_artwork_files_pkey;
ALTER TABLE ONLY public.static_pages DROP CONSTRAINT static_pages_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_pkey;
ALTER TABLE ONLY public.spotlights DROP CONSTRAINT spotlights_pkey;
ALTER TABLE ONLY public.series DROP CONSTRAINT series_pkey;
ALTER TABLE ONLY public.sales_rights DROP CONSTRAINT sales_rights_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_pkey;
ALTER TABLE ONLY public.review_forms DROP CONSTRAINT review_forms_pkey;
ALTER TABLE ONLY public.review_form_elements DROP CONSTRAINT review_form_elements_pkey;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_pkey;
ALTER TABLE ONLY public.representatives DROP CONSTRAINT representatives_pkey;
ALTER TABLE ONLY public.queued_payments DROP CONSTRAINT queued_payments_pkey;
ALTER TABLE ONLY public.queries DROP CONSTRAINT queries_pkey;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
ALTER TABLE ONLY public.publication_formats DROP CONSTRAINT publication_formats_pkey;
ALTER TABLE ONLY public.publication_dates DROP CONSTRAINT publication_dates_pkey;
ALTER TABLE ONLY public.presses DROP CONSTRAINT presses_pkey;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_pkey;
ALTER TABLE ONLY public.notification_mail_list DROP CONSTRAINT notification_mail_list_pkey;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_pkey;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_pkey;
ALTER TABLE ONLY public.metadata_descriptions DROP CONSTRAINT metadata_descriptions_pkey;
ALTER TABLE ONLY public.markets DROP CONSTRAINT markets_pkey;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_pkey;
ALTER TABLE ONLY public.identification_codes DROP CONSTRAINT identification_codes_pkey;
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
ALTER TABLE ONLY public.completed_payments DROP CONSTRAINT completed_payments_pkey;
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
ALTER TABLE public.submission_search_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.submission_search_keyword_list ALTER COLUMN keyword_id DROP DEFAULT;
ALTER TABLE public.submission_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.submission_comments ALTER COLUMN comment_id DROP DEFAULT;
ALTER TABLE public.submission_chapters ALTER COLUMN chapter_id DROP DEFAULT;
ALTER TABLE public.static_pages ALTER COLUMN static_page_id DROP DEFAULT;
ALTER TABLE public.stage_assignments ALTER COLUMN stage_assignment_id DROP DEFAULT;
ALTER TABLE public.spotlights ALTER COLUMN spotlight_id DROP DEFAULT;
ALTER TABLE public.series ALTER COLUMN series_id DROP DEFAULT;
ALTER TABLE public.sales_rights ALTER COLUMN sales_rights_id DROP DEFAULT;
ALTER TABLE public.review_rounds ALTER COLUMN review_round_id DROP DEFAULT;
ALTER TABLE public.review_forms ALTER COLUMN review_form_id DROP DEFAULT;
ALTER TABLE public.review_form_elements ALTER COLUMN review_form_element_id DROP DEFAULT;
ALTER TABLE public.review_assignments ALTER COLUMN review_id DROP DEFAULT;
ALTER TABLE public.representatives ALTER COLUMN representative_id DROP DEFAULT;
ALTER TABLE public.queued_payments ALTER COLUMN queued_payment_id DROP DEFAULT;
ALTER TABLE public.queries ALTER COLUMN query_id DROP DEFAULT;
ALTER TABLE public.publications ALTER COLUMN publication_id DROP DEFAULT;
ALTER TABLE public.publication_formats ALTER COLUMN publication_format_id DROP DEFAULT;
ALTER TABLE public.publication_dates ALTER COLUMN publication_date_id DROP DEFAULT;
ALTER TABLE public.presses ALTER COLUMN press_id DROP DEFAULT;
ALTER TABLE public.notifications ALTER COLUMN notification_id DROP DEFAULT;
ALTER TABLE public.notification_subscription_settings ALTER COLUMN setting_id DROP DEFAULT;
ALTER TABLE public.notification_mail_list ALTER COLUMN notification_mail_list_id DROP DEFAULT;
ALTER TABLE public.notes ALTER COLUMN note_id DROP DEFAULT;
ALTER TABLE public.navigation_menus ALTER COLUMN navigation_menu_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_items ALTER COLUMN navigation_menu_item_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id DROP DEFAULT;
ALTER TABLE public.metadata_descriptions ALTER COLUMN metadata_description_id DROP DEFAULT;
ALTER TABLE public.markets ALTER COLUMN market_id DROP DEFAULT;
ALTER TABLE public.library_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.identification_codes ALTER COLUMN identification_code_id DROP DEFAULT;
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
ALTER TABLE public.completed_payments ALTER COLUMN completed_payment_id DROP DEFAULT;
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
DROP SEQUENCE public.submission_chapters_chapter_id_seq;
DROP TABLE public.submission_chapters;
DROP TABLE public.submission_chapter_settings;
DROP TABLE public.submission_chapter_authors;
DROP TABLE public.submission_artwork_files;
DROP SEQUENCE public.static_pages_static_page_id_seq;
DROP TABLE public.static_pages;
DROP TABLE public.static_page_settings;
DROP SEQUENCE public.stage_assignments_stage_assignment_id_seq;
DROP TABLE public.stage_assignments;
DROP SEQUENCE public.spotlights_spotlight_id_seq;
DROP TABLE public.spotlights;
DROP TABLE public.spotlight_settings;
DROP TABLE public.site_settings;
DROP TABLE public.site;
DROP TABLE public.sessions;
DROP TABLE public.series_settings;
DROP SEQUENCE public.series_series_id_seq;
DROP TABLE public.series_editors;
DROP TABLE public.series_categories;
DROP TABLE public.series;
DROP TABLE public.section_editors;
DROP TABLE public.scheduled_tasks;
DROP SEQUENCE public.sales_rights_sales_rights_id_seq;
DROP TABLE public.sales_rights;
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
DROP SEQUENCE public.representatives_representative_id_seq;
DROP TABLE public.representatives;
DROP SEQUENCE public.queued_payments_queued_payment_id_seq;
DROP TABLE public.queued_payments;
DROP TABLE public.query_participants;
DROP SEQUENCE public.queries_query_id_seq;
DROP TABLE public.queries;
DROP SEQUENCE public.publications_publication_id_seq;
DROP TABLE public.publications;
DROP TABLE public.publication_settings;
DROP SEQUENCE public.publication_formats_publication_format_id_seq;
DROP TABLE public.publication_formats;
DROP TABLE public.publication_format_settings;
DROP SEQUENCE public.publication_dates_publication_date_id_seq;
DROP TABLE public.publication_dates;
DROP TABLE public.publication_categories;
DROP SEQUENCE public.presses_press_id_seq;
DROP TABLE public.presses;
DROP TABLE public.press_settings;
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
DROP TABLE public.new_releases;
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
DROP SEQUENCE public.markets_market_id_seq;
DROP TABLE public.markets;
DROP SEQUENCE public.library_files_file_id_seq;
DROP TABLE public.library_files;
DROP TABLE public.library_file_settings;
DROP TABLE public.item_views;
DROP SEQUENCE public.identification_codes_identification_code_id_seq;
DROP TABLE public.identification_codes;
DROP SEQUENCE public.genres_genre_id_seq;
DROP TABLE public.genres;
DROP TABLE public.genre_settings;
DROP SEQUENCE public.filters_filter_id_seq;
DROP TABLE public.filters;
DROP TABLE public.filter_settings;
DROP SEQUENCE public.filter_groups_filter_group_id_seq;
DROP TABLE public.filter_groups;
DROP TABLE public.features;
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
DROP SEQUENCE public.completed_payments_completed_payment_id_seq;
DROP TABLE public.completed_payments;
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
-- Name: access_keys; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.access_keys (
    access_key_id integer NOT NULL,
    context character varying(40) NOT NULL,
    key_hash character varying(40) NOT NULL,
    user_id bigint NOT NULL,
    assoc_id bigint,
    expiry_date timestamp without time zone NOT NULL
);


ALTER TABLE public.access_keys OWNER TO "omp-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.access_keys_access_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_keys_access_key_id_seq OWNER TO "omp-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.access_keys_access_key_id_seq OWNED BY public.access_keys.access_key_id;


--
-- Name: announcement_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.announcement_settings (
    announcement_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.announcement_settings OWNER TO "omp-ci";

--
-- Name: announcement_type_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.announcement_type_settings (
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.announcement_type_settings OWNER TO "omp-ci";

--
-- Name: announcement_types; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.announcement_types (
    type_id integer NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.announcement_types OWNER TO "omp-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.announcement_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_types_type_id_seq OWNER TO "omp-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.announcement_types_type_id_seq OWNED BY public.announcement_types.type_id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.announcements (
    announcement_id integer NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL,
    type_id bigint,
    date_expire timestamp without time zone,
    date_posted timestamp without time zone NOT NULL
);


ALTER TABLE public.announcements OWNER TO "omp-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.announcements_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcements_announcement_id_seq OWNER TO "omp-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.announcements_announcement_id_seq OWNED BY public.announcements.announcement_id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.auth_sources (
    auth_id integer NOT NULL,
    title character varying(60) NOT NULL,
    plugin character varying(32) NOT NULL,
    auth_default smallint DEFAULT 0 NOT NULL,
    settings text
);


ALTER TABLE public.auth_sources OWNER TO "omp-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.auth_sources_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_auth_id_seq OWNER TO "omp-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.auth_sources_auth_id_seq OWNED BY public.auth_sources.auth_id;


--
-- Name: author_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.author_settings (
    author_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.author_settings OWNER TO "omp-ci";

--
-- Name: authors; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.authors OWNER TO "omp-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_author_id_seq OWNER TO "omp-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    context_id bigint NOT NULL,
    parent_id bigint NOT NULL,
    seq bigint,
    path character varying(255) NOT NULL,
    image text
);


ALTER TABLE public.categories OWNER TO "omp-ci";

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO "omp-ci";

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: category_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.category_settings (
    category_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.category_settings OWNER TO "omp-ci";

--
-- Name: citation_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.citation_settings (
    citation_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.citation_settings OWNER TO "omp-ci";

--
-- Name: citations; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.citations (
    citation_id integer NOT NULL,
    publication_id bigint DEFAULT 0 NOT NULL,
    raw_citation text,
    seq bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.citations OWNER TO "omp-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.citations_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citations_citation_id_seq OWNER TO "omp-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.citations_citation_id_seq OWNED BY public.citations.citation_id;


--
-- Name: completed_payments; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.completed_payments (
    completed_payment_id integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    payment_type bigint NOT NULL,
    context_id bigint NOT NULL,
    user_id bigint,
    assoc_id character varying(16),
    amount double precision NOT NULL,
    currency_code_alpha character varying(3),
    payment_method_plugin_name character varying(80)
);


ALTER TABLE public.completed_payments OWNER TO "omp-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.completed_payments_completed_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.completed_payments_completed_payment_id_seq OWNER TO "omp-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.completed_payments_completed_payment_id_seq OWNED BY public.completed_payments.completed_payment_id;


--
-- Name: controlled_vocab_entries; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.controlled_vocab_entries (
    controlled_vocab_entry_id integer NOT NULL,
    controlled_vocab_id bigint NOT NULL,
    seq double precision
);


ALTER TABLE public.controlled_vocab_entries OWNER TO "omp-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "omp-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNED BY public.controlled_vocab_entries.controlled_vocab_entry_id;


--
-- Name: controlled_vocab_entry_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.controlled_vocab_entry_settings (
    controlled_vocab_entry_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.controlled_vocab_entry_settings OWNER TO "omp-ci";

--
-- Name: controlled_vocabs; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.controlled_vocabs (
    controlled_vocab_id integer NOT NULL,
    symbolic character varying(64) NOT NULL,
    assoc_type bigint DEFAULT 0 NOT NULL,
    assoc_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.controlled_vocabs OWNER TO "omp-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlled_vocabs_controlled_vocab_id_seq OWNER TO "omp-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq OWNED BY public.controlled_vocabs.controlled_vocab_id;


--
-- Name: data_object_tombstone_oai_set_objects; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.data_object_tombstone_oai_set_objects (
    object_id integer NOT NULL,
    tombstone_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.data_object_tombstone_oai_set_objects OWNER TO "omp-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "omp-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq OWNED BY public.data_object_tombstone_oai_set_objects.object_id;


--
-- Name: data_object_tombstone_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.data_object_tombstone_settings (
    tombstone_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.data_object_tombstone_settings OWNER TO "omp-ci";

--
-- Name: data_object_tombstones; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.data_object_tombstones (
    tombstone_id integer NOT NULL,
    data_object_id bigint NOT NULL,
    date_deleted timestamp without time zone NOT NULL,
    set_spec character varying(255) NOT NULL,
    set_name character varying(255) NOT NULL,
    oai_identifier character varying(255) NOT NULL
);


ALTER TABLE public.data_object_tombstones OWNER TO "omp-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.data_object_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_object_tombstones_tombstone_id_seq OWNER TO "omp-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNED BY public.data_object_tombstones.tombstone_id;


--
-- Name: edit_decisions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.edit_decisions OWNER TO "omp-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.edit_decisions_edit_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edit_decisions_edit_decision_id_seq OWNER TO "omp-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.edit_decisions_edit_decision_id_seq OWNED BY public.edit_decisions.edit_decision_id;


--
-- Name: email_log; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.email_log OWNER TO "omp-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.email_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_log_log_id_seq OWNER TO "omp-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.email_log_log_id_seq OWNED BY public.email_log.log_id;


--
-- Name: email_log_users; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.email_log_users (
    email_log_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.email_log_users OWNER TO "omp-ci";

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.email_templates (
    email_id integer NOT NULL,
    email_key character varying(64) NOT NULL,
    context_id bigint DEFAULT 0,
    enabled smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.email_templates OWNER TO "omp-ci";

--
-- Name: email_templates_default; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.email_templates_default (
    email_id integer NOT NULL,
    email_key character varying(64) NOT NULL,
    can_disable smallint DEFAULT 1 NOT NULL,
    can_edit smallint DEFAULT 1 NOT NULL,
    from_role_id bigint,
    to_role_id bigint
);


ALTER TABLE public.email_templates_default OWNER TO "omp-ci";

--
-- Name: email_templates_default_data; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.email_templates_default_data (
    email_key character varying(64) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying NOT NULL,
    subject character varying(120) NOT NULL,
    body text,
    description text
);


ALTER TABLE public.email_templates_default_data OWNER TO "omp-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.email_templates_default_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_templates_default_email_id_seq OWNER TO "omp-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.email_templates_default_email_id_seq OWNED BY public.email_templates_default.email_id;


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.email_templates_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_templates_email_id_seq OWNER TO "omp-ci";

--
-- Name: email_templates_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.email_templates_email_id_seq OWNED BY public.email_templates.email_id;


--
-- Name: email_templates_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.email_templates_settings (
    email_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.email_templates_settings OWNER TO "omp-ci";

--
-- Name: event_log; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.event_log OWNER TO "omp-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.event_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_log_log_id_seq OWNER TO "omp-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.event_log_log_id_seq OWNED BY public.event_log.log_id;


--
-- Name: event_log_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.event_log_settings (
    log_id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.event_log_settings OWNER TO "omp-ci";

--
-- Name: features; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.features (
    submission_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    seq bigint NOT NULL
);


ALTER TABLE public.features OWNER TO "omp-ci";

--
-- Name: filter_groups; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.filter_groups (
    filter_group_id integer NOT NULL,
    symbolic character varying(255),
    display_name character varying(255),
    description character varying(255),
    input_type character varying(255),
    output_type character varying(255)
);


ALTER TABLE public.filter_groups OWNER TO "omp-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.filter_groups_filter_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_groups_filter_group_id_seq OWNER TO "omp-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.filter_groups_filter_group_id_seq OWNED BY public.filter_groups.filter_group_id;


--
-- Name: filter_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.filter_settings (
    filter_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.filter_settings OWNER TO "omp-ci";

--
-- Name: filters; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.filters OWNER TO "omp-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.filters_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filters_filter_id_seq OWNER TO "omp-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.filters_filter_id_seq OWNED BY public.filters.filter_id;


--
-- Name: genre_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.genre_settings (
    genre_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.genre_settings OWNER TO "omp-ci";

--
-- Name: genres; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.genres OWNER TO "omp-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_genre_id_seq OWNER TO "omp-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- Name: identification_codes; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.identification_codes (
    identification_code_id integer NOT NULL,
    publication_format_id bigint NOT NULL,
    code character varying(40) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.identification_codes OWNER TO "omp-ci";

--
-- Name: identification_codes_identification_code_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.identification_codes_identification_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identification_codes_identification_code_id_seq OWNER TO "omp-ci";

--
-- Name: identification_codes_identification_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.identification_codes_identification_code_id_seq OWNED BY public.identification_codes.identification_code_id;


--
-- Name: item_views; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.item_views (
    assoc_type bigint NOT NULL,
    assoc_id character varying(32) NOT NULL,
    user_id bigint,
    date_last_viewed timestamp without time zone
);


ALTER TABLE public.item_views OWNER TO "omp-ci";

--
-- Name: library_file_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.library_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.library_file_settings OWNER TO "omp-ci";

--
-- Name: library_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.library_files OWNER TO "omp-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.library_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_files_file_id_seq OWNER TO "omp-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.library_files_file_id_seq OWNED BY public.library_files.file_id;


--
-- Name: markets; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.markets (
    market_id integer NOT NULL,
    publication_format_id bigint NOT NULL,
    countries_included text,
    countries_excluded text,
    regions_included text,
    regions_excluded text,
    market_date_role character varying(40) NOT NULL,
    market_date_format character varying(40) NOT NULL,
    market_date character varying(255) NOT NULL,
    price character varying(255),
    discount character varying(255),
    price_type_code character varying(255),
    currency_code character varying(255),
    tax_rate_code character varying(255),
    tax_type_code character varying(255),
    agent_id bigint,
    supplier_id bigint
);


ALTER TABLE public.markets OWNER TO "omp-ci";

--
-- Name: markets_market_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.markets_market_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markets_market_id_seq OWNER TO "omp-ci";

--
-- Name: markets_market_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.markets_market_id_seq OWNED BY public.markets.market_id;


--
-- Name: metadata_description_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metadata_description_settings (
    metadata_description_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.metadata_description_settings OWNER TO "omp-ci";

--
-- Name: metadata_descriptions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.metadata_descriptions OWNER TO "omp-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.metadata_descriptions_metadata_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metadata_descriptions_metadata_description_id_seq OWNER TO "omp-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.metadata_descriptions_metadata_description_id_seq OWNED BY public.metadata_descriptions.metadata_description_id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.metrics OWNER TO "omp-ci";

--
-- Name: navigation_menu_item_assignments; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.navigation_menu_item_assignments (
    navigation_menu_item_assignment_id integer NOT NULL,
    navigation_menu_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    parent_id bigint,
    seq bigint DEFAULT 0
);


ALTER TABLE public.navigation_menu_item_assignments OWNER TO "omp-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "omp-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNED BY public.navigation_menu_item_assignments.navigation_menu_item_assignment_id;


--
-- Name: navigation_menu_item_assignment_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.navigation_menu_item_assignment_settings (
    navigation_menu_item_assignment_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_assignment_settings OWNER TO "omp-ci";

--
-- Name: navigation_menu_item_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.navigation_menu_item_settings (
    navigation_menu_item_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_settings OWNER TO "omp-ci";

--
-- Name: navigation_menu_items; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.navigation_menu_items (
    navigation_menu_item_id integer NOT NULL,
    context_id bigint NOT NULL,
    url character varying(255) DEFAULT ''::character varying,
    path character varying(255) DEFAULT ''::character varying,
    type character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.navigation_menu_items OWNER TO "omp-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menu_items_navigation_menu_item_id_seq OWNER TO "omp-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq OWNED BY public.navigation_menu_items.navigation_menu_item_id;


--
-- Name: navigation_menus; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.navigation_menus (
    navigation_menu_id integer NOT NULL,
    context_id bigint NOT NULL,
    area_name character varying(255) DEFAULT ''::character varying,
    title character varying(255) NOT NULL
);


ALTER TABLE public.navigation_menus OWNER TO "omp-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.navigation_menus_navigation_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menus_navigation_menu_id_seq OWNER TO "omp-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.navigation_menus_navigation_menu_id_seq OWNED BY public.navigation_menus.navigation_menu_id;


--
-- Name: new_releases; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.new_releases (
    submission_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.new_releases OWNER TO "omp-ci";

--
-- Name: notes; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.notes OWNER TO "omp-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.notes_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_note_id_seq OWNER TO "omp-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;


--
-- Name: notification_mail_list; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.notification_mail_list (
    notification_mail_list_id integer NOT NULL,
    email character varying(90) NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL,
    token character varying(40) NOT NULL,
    context bigint NOT NULL
);


ALTER TABLE public.notification_mail_list OWNER TO "omp-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.notification_mail_list_notification_mail_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_mail_list_notification_mail_list_id_seq OWNER TO "omp-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.notification_mail_list_notification_mail_list_id_seq OWNED BY public.notification_mail_list.notification_mail_list_id;


--
-- Name: notification_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.notification_settings (
    notification_id bigint NOT NULL,
    locale character varying(14),
    setting_name character varying(64) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_settings OWNER TO "omp-ci";

--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.notification_subscription_settings (
    setting_id integer NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text,
    user_id bigint NOT NULL,
    context bigint NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_subscription_settings OWNER TO "omp-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.notification_subscription_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_subscription_settings_setting_id_seq OWNER TO "omp-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.notification_subscription_settings_setting_id_seq OWNED BY public.notification_subscription_settings.setting_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.notifications OWNER TO "omp-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notification_id_seq OWNER TO "omp-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- Name: oai_resumption_tokens; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.oai_resumption_tokens (
    token character varying(32) NOT NULL,
    expire bigint NOT NULL,
    record_offset integer NOT NULL,
    params text
);


ALTER TABLE public.oai_resumption_tokens OWNER TO "omp-ci";

--
-- Name: plugin_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.plugin_settings (
    plugin_name character varying(80) NOT NULL,
    context_id bigint NOT NULL,
    setting_name character varying(80) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.plugin_settings OWNER TO "omp-ci";

--
-- Name: press_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.press_settings (
    press_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.press_settings OWNER TO "omp-ci";

--
-- Name: presses; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.presses (
    press_id integer NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.presses OWNER TO "omp-ci";

--
-- Name: presses_press_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.presses_press_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presses_press_id_seq OWNER TO "omp-ci";

--
-- Name: presses_press_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.presses_press_id_seq OWNED BY public.presses.press_id;


--
-- Name: publication_categories; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publication_categories (
    publication_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.publication_categories OWNER TO "omp-ci";

--
-- Name: publication_dates; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publication_dates (
    publication_date_id integer NOT NULL,
    publication_format_id bigint NOT NULL,
    role character varying(40) NOT NULL,
    date_format character varying(40) NOT NULL,
    date character varying(255) NOT NULL
);


ALTER TABLE public.publication_dates OWNER TO "omp-ci";

--
-- Name: publication_dates_publication_date_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.publication_dates_publication_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_dates_publication_date_id_seq OWNER TO "omp-ci";

--
-- Name: publication_dates_publication_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.publication_dates_publication_date_id_seq OWNED BY public.publication_dates.publication_date_id;


--
-- Name: publication_format_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publication_format_settings (
    publication_format_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.publication_format_settings OWNER TO "omp-ci";

--
-- Name: publication_formats; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publication_formats (
    publication_format_id integer NOT NULL,
    publication_id bigint NOT NULL,
    submission_id bigint,
    physical_format smallint DEFAULT 1,
    entry_key character varying(64),
    seq double precision DEFAULT 0 NOT NULL,
    file_size character varying(255),
    front_matter character varying(255),
    back_matter character varying(255),
    height character varying(255),
    height_unit_code character varying(255),
    width character varying(255),
    width_unit_code character varying(255),
    thickness character varying(255),
    thickness_unit_code character varying(255),
    weight character varying(255),
    weight_unit_code character varying(255),
    product_composition_code character varying(255),
    product_form_detail_code character varying(255),
    country_manufacture_code character varying(255),
    imprint character varying(255),
    product_availability_code character varying(255),
    technical_protection_code character varying(255),
    returnable_indicator_code character varying(255),
    remote_url character varying(2047),
    url_path character varying(64),
    is_approved smallint DEFAULT 0 NOT NULL,
    is_available smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.publication_formats OWNER TO "omp-ci";

--
-- Name: publication_formats_publication_format_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.publication_formats_publication_format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_formats_publication_format_id_seq OWNER TO "omp-ci";

--
-- Name: publication_formats_publication_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.publication_formats_publication_format_id_seq OWNED BY public.publication_formats.publication_format_id;


--
-- Name: publication_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publication_settings (
    publication_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_settings OWNER TO "omp-ci";

--
-- Name: publications; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publications (
    publication_id integer NOT NULL,
    date_published date,
    last_modified timestamp without time zone,
    locale character varying(14),
    primary_contact_id bigint,
    publication_date_type character varying(32) DEFAULT 'pub'::character varying,
    publication_type character varying(32) DEFAULT 'publication'::character varying,
    seq double precision DEFAULT 0 NOT NULL,
    series_id bigint,
    series_position character varying(255),
    submission_id bigint NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    url_path character varying(64),
    version bigint
);


ALTER TABLE public.publications OWNER TO "omp-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.publications_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_publication_id_seq OWNER TO "omp-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.publications_publication_id_seq OWNED BY public.publications.publication_id;


--
-- Name: queries; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.queries OWNER TO "omp-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.queries_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_query_id_seq OWNER TO "omp-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.queries_query_id_seq OWNED BY public.queries.query_id;


--
-- Name: query_participants; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.query_participants (
    query_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.query_participants OWNER TO "omp-ci";

--
-- Name: queued_payments; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.queued_payments (
    queued_payment_id integer NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    expiry_date date,
    payment_data text
);


ALTER TABLE public.queued_payments OWNER TO "omp-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.queued_payments_queued_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queued_payments_queued_payment_id_seq OWNER TO "omp-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.queued_payments_queued_payment_id_seq OWNED BY public.queued_payments.queued_payment_id;


--
-- Name: representatives; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.representatives (
    representative_id integer NOT NULL,
    submission_id bigint NOT NULL,
    role character varying(40) NOT NULL,
    representative_id_type character varying(255),
    representative_id_value character varying(255),
    name character varying(255),
    phone character varying(255),
    email character varying(255),
    url character varying(2047),
    is_supplier smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.representatives OWNER TO "omp-ci";

--
-- Name: representatives_representative_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.representatives_representative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.representatives_representative_id_seq OWNER TO "omp-ci";

--
-- Name: representatives_representative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.representatives_representative_id_seq OWNED BY public.representatives.representative_id;


--
-- Name: review_assignments; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.review_assignments OWNER TO "omp-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.review_assignments_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_assignments_review_id_seq OWNER TO "omp-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.review_assignments_review_id_seq OWNED BY public.review_assignments.review_id;


--
-- Name: review_files; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_files (
    review_id bigint NOT NULL,
    file_id bigint NOT NULL
);


ALTER TABLE public.review_files OWNER TO "omp-ci";

--
-- Name: review_form_element_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_form_element_settings (
    review_form_element_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_element_settings OWNER TO "omp-ci";

--
-- Name: review_form_elements; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_form_elements (
    review_form_element_id integer NOT NULL,
    review_form_id bigint NOT NULL,
    seq double precision,
    element_type bigint,
    required smallint,
    included smallint
);


ALTER TABLE public.review_form_elements OWNER TO "omp-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.review_form_elements_review_form_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_form_elements_review_form_element_id_seq OWNER TO "omp-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.review_form_elements_review_form_element_id_seq OWNED BY public.review_form_elements.review_form_element_id;


--
-- Name: review_form_responses; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_form_responses (
    review_form_element_id bigint NOT NULL,
    review_id bigint NOT NULL,
    response_type character varying(6),
    response_value text
);


ALTER TABLE public.review_form_responses OWNER TO "omp-ci";

--
-- Name: review_form_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_form_settings (
    review_form_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_settings OWNER TO "omp-ci";

--
-- Name: review_forms; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_forms (
    review_form_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    seq double precision,
    is_active smallint
);


ALTER TABLE public.review_forms OWNER TO "omp-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.review_forms_review_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_forms_review_form_id_seq OWNER TO "omp-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.review_forms_review_form_id_seq OWNED BY public.review_forms.review_form_id;


--
-- Name: review_round_files; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_round_files (
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    file_id bigint NOT NULL,
    revision bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.review_round_files OWNER TO "omp-ci";

--
-- Name: review_rounds; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_rounds (
    review_round_id integer NOT NULL,
    submission_id bigint NOT NULL,
    stage_id bigint,
    round smallint NOT NULL,
    review_revision bigint,
    status bigint
);


ALTER TABLE public.review_rounds OWNER TO "omp-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.review_rounds_review_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_rounds_review_round_id_seq OWNER TO "omp-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.review_rounds_review_round_id_seq OWNED BY public.review_rounds.review_round_id;


--
-- Name: sales_rights; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.sales_rights (
    sales_rights_id integer NOT NULL,
    publication_format_id bigint NOT NULL,
    type character varying(40) NOT NULL,
    row_setting smallint DEFAULT 0 NOT NULL,
    countries_included text,
    countries_excluded text,
    regions_included text,
    regions_excluded text
);


ALTER TABLE public.sales_rights OWNER TO "omp-ci";

--
-- Name: sales_rights_sales_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.sales_rights_sales_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_rights_sales_rights_id_seq OWNER TO "omp-ci";

--
-- Name: sales_rights_sales_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.sales_rights_sales_rights_id_seq OWNED BY public.sales_rights.sales_rights_id;


--
-- Name: scheduled_tasks; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.scheduled_tasks (
    class_name character varying(255) NOT NULL,
    last_run timestamp without time zone
);


ALTER TABLE public.scheduled_tasks OWNER TO "omp-ci";

--
-- Name: section_editors; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.section_editors (
    context_id bigint NOT NULL,
    section_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.section_editors OWNER TO "omp-ci";

--
-- Name: series; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.series (
    series_id integer NOT NULL,
    press_id bigint NOT NULL,
    review_form_id bigint,
    seq double precision DEFAULT 0,
    featured smallint DEFAULT 0 NOT NULL,
    editor_restricted smallint DEFAULT 0 NOT NULL,
    path character varying(255) NOT NULL,
    image text
);


ALTER TABLE public.series OWNER TO "omp-ci";

--
-- Name: series_categories; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.series_categories (
    series_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.series_categories OWNER TO "omp-ci";

--
-- Name: series_editors; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.series_editors (
    press_id bigint NOT NULL,
    series_id bigint NOT NULL,
    user_id bigint NOT NULL,
    can_edit smallint DEFAULT 1 NOT NULL,
    can_review smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.series_editors OWNER TO "omp-ci";

--
-- Name: series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.series_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_series_id_seq OWNER TO "omp-ci";

--
-- Name: series_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.series_series_id_seq OWNED BY public.series.series_id;


--
-- Name: series_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.series_settings (
    series_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.series_settings OWNER TO "omp-ci";

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.sessions OWNER TO "omp-ci";

--
-- Name: site; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.site (
    redirect bigint DEFAULT 0 NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT 6 NOT NULL,
    installed_locales character varying(1024) DEFAULT 'en_US'::character varying NOT NULL,
    supported_locales character varying(1024),
    original_style_file_name character varying(255)
);


ALTER TABLE public.site OWNER TO "omp-ci";

--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.site_settings (
    setting_name character varying(255) NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_value text
);


ALTER TABLE public.site_settings OWNER TO "omp-ci";

--
-- Name: spotlight_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.spotlight_settings (
    spotlight_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.spotlight_settings OWNER TO "omp-ci";

--
-- Name: spotlights; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.spotlights (
    spotlight_id integer NOT NULL,
    assoc_type smallint NOT NULL,
    assoc_id smallint NOT NULL,
    press_id bigint NOT NULL
);


ALTER TABLE public.spotlights OWNER TO "omp-ci";

--
-- Name: spotlights_spotlight_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.spotlights_spotlight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spotlights_spotlight_id_seq OWNER TO "omp-ci";

--
-- Name: spotlights_spotlight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.spotlights_spotlight_id_seq OWNED BY public.spotlights.spotlight_id;


--
-- Name: stage_assignments; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.stage_assignments OWNER TO "omp-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.stage_assignments_stage_assignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stage_assignments_stage_assignment_id_seq OWNER TO "omp-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.stage_assignments_stage_assignment_id_seq OWNED BY public.stage_assignments.stage_assignment_id;


--
-- Name: static_page_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.static_page_settings (
    static_page_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.static_page_settings OWNER TO "omp-ci";

--
-- Name: static_pages; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.static_pages (
    static_page_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    context_id bigint NOT NULL
);


ALTER TABLE public.static_pages OWNER TO "omp-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.static_pages_static_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.static_pages_static_page_id_seq OWNER TO "omp-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.static_pages_static_page_id_seq OWNED BY public.static_pages.static_page_id;


--
-- Name: submission_artwork_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.submission_artwork_files OWNER TO "omp-ci";

--
-- Name: submission_chapter_authors; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_chapter_authors (
    author_id bigint NOT NULL,
    chapter_id bigint NOT NULL,
    primary_contact smallint DEFAULT 0 NOT NULL,
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.submission_chapter_authors OWNER TO "omp-ci";

--
-- Name: submission_chapter_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_chapter_settings (
    chapter_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.submission_chapter_settings OWNER TO "omp-ci";

--
-- Name: submission_chapters; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_chapters (
    chapter_id integer NOT NULL,
    primary_contact_id bigint,
    publication_id bigint NOT NULL,
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.submission_chapters OWNER TO "omp-ci";

--
-- Name: submission_chapters_chapter_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_chapters_chapter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_chapters_chapter_id_seq OWNER TO "omp-ci";

--
-- Name: submission_chapters_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_chapters_chapter_id_seq OWNED BY public.submission_chapters.chapter_id;


--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.submission_comments OWNER TO "omp-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_comments_comment_id_seq OWNER TO "omp-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_comments_comment_id_seq OWNED BY public.submission_comments.comment_id;


--
-- Name: submission_file_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.submission_file_settings OWNER TO "omp-ci";

--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.submission_files OWNER TO "omp-ci";

--
-- Name: submission_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_files_file_id_seq OWNER TO "omp-ci";

--
-- Name: submission_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_files_file_id_seq OWNED BY public.submission_files.file_id;


--
-- Name: submission_search_keyword_list; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_search_keyword_list (
    keyword_id integer NOT NULL,
    keyword_text character varying(60) NOT NULL
);


ALTER TABLE public.submission_search_keyword_list OWNER TO "omp-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_search_keyword_list_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_search_keyword_list_keyword_id_seq OWNER TO "omp-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_search_keyword_list_keyword_id_seq OWNED BY public.submission_search_keyword_list.keyword_id;


--
-- Name: submission_search_object_keywords; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_search_object_keywords (
    object_id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    pos integer NOT NULL
);


ALTER TABLE public.submission_search_object_keywords OWNER TO "omp-ci";

--
-- Name: submission_search_objects; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_search_objects (
    object_id integer NOT NULL,
    submission_id bigint NOT NULL,
    type integer NOT NULL,
    assoc_id bigint
);


ALTER TABLE public.submission_search_objects OWNER TO "omp-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_search_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_search_objects_object_id_seq OWNER TO "omp-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_search_objects_object_id_seq OWNED BY public.submission_search_objects.object_id;


--
-- Name: submission_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_settings (
    submission_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.submission_settings OWNER TO "omp-ci";

--
-- Name: submission_supplementary_files; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_supplementary_files (
    file_id bigint NOT NULL,
    revision bigint NOT NULL
);


ALTER TABLE public.submission_supplementary_files OWNER TO "omp-ci";

--
-- Name: submissions; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submissions (
    submission_id integer NOT NULL,
    context_id bigint NOT NULL,
    locale character varying(14),
    current_publication_id bigint,
    date_last_activity timestamp without time zone,
    date_submitted timestamp without time zone,
    last_modified timestamp without time zone,
    stage_id bigint DEFAULT 1 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    submission_progress smallint DEFAULT 1 NOT NULL,
    work_type smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.submissions OWNER TO "omp-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submissions_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submissions_submission_id_seq OWNER TO "omp-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submissions_submission_id_seq OWNED BY public.submissions.submission_id;


--
-- Name: temporary_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.temporary_files OWNER TO "omp-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.temporary_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temporary_files_file_id_seq OWNER TO "omp-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.temporary_files_file_id_seq OWNED BY public.temporary_files.file_id;


--
-- Name: usage_stats_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.usage_stats_temporary_records OWNER TO "omp-ci";

--
-- Name: user_group_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.user_group_settings (
    user_group_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.user_group_settings OWNER TO "omp-ci";

--
-- Name: user_group_stage; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.user_group_stage (
    context_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    stage_id bigint NOT NULL
);


ALTER TABLE public.user_group_stage OWNER TO "omp-ci";

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.user_groups OWNER TO "omp-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.user_groups_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_user_group_id_seq OWNER TO "omp-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.user_groups_user_group_id_seq OWNED BY public.user_groups.user_group_id;


--
-- Name: user_interests; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.user_interests (
    user_id bigint NOT NULL,
    controlled_vocab_entry_id bigint NOT NULL
);


ALTER TABLE public.user_interests OWNER TO "omp-ci";

--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.user_settings OWNER TO "omp-ci";

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.user_user_groups (
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO "omp-ci";

--
-- Name: users; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.users OWNER TO "omp-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO "omp-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.versions OWNER TO "omp-ci";

--
-- Name: access_keys access_key_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('public.access_keys_access_key_id_seq'::regclass);


--
-- Name: announcement_types type_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_types ALTER COLUMN type_id SET DEFAULT nextval('public.announcement_types_type_id_seq'::regclass);


--
-- Name: announcements announcement_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcements ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcements_announcement_id_seq'::regclass);


--
-- Name: auth_sources auth_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN auth_id SET DEFAULT nextval('public.auth_sources_auth_id_seq'::regclass);


--
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: citations citation_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations ALTER COLUMN citation_id SET DEFAULT nextval('public.citations_citation_id_seq'::regclass);


--
-- Name: completed_payments completed_payment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.completed_payments ALTER COLUMN completed_payment_id SET DEFAULT nextval('public.completed_payments_completed_payment_id_seq'::regclass);


--
-- Name: controlled_vocab_entries controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocabs controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('public.controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: data_object_tombstone_oai_set_objects object_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('public.data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: data_object_tombstones tombstone_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: edit_decisions edit_decision_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('public.edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: email_log log_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log ALTER COLUMN log_id SET DEFAULT nextval('public.email_log_log_id_seq'::regclass);


--
-- Name: email_templates email_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_email_id_seq'::regclass);


--
-- Name: email_templates_default email_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_default_email_id_seq'::regclass);


--
-- Name: event_log log_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log ALTER COLUMN log_id SET DEFAULT nextval('public.event_log_log_id_seq'::regclass);


--
-- Name: filter_groups filter_group_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('public.filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filters filter_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filters ALTER COLUMN filter_id SET DEFAULT nextval('public.filters_filter_id_seq'::regclass);


--
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: identification_codes identification_code_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.identification_codes ALTER COLUMN identification_code_id SET DEFAULT nextval('public.identification_codes_identification_code_id_seq'::regclass);


--
-- Name: library_files file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_files ALTER COLUMN file_id SET DEFAULT nextval('public.library_files_file_id_seq'::regclass);


--
-- Name: markets market_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.markets ALTER COLUMN market_id SET DEFAULT nextval('public.markets_market_id_seq'::regclass);


--
-- Name: metadata_descriptions metadata_description_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metadata_descriptions ALTER COLUMN metadata_description_id SET DEFAULT nextval('public.metadata_descriptions_metadata_description_id_seq'::regclass);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_items navigation_menu_item_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_items ALTER COLUMN navigation_menu_item_id SET DEFAULT nextval('public.navigation_menu_items_navigation_menu_item_id_seq'::regclass);


--
-- Name: navigation_menus navigation_menu_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menus ALTER COLUMN navigation_menu_id SET DEFAULT nextval('public.navigation_menus_navigation_menu_id_seq'::regclass);


--
-- Name: notes note_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Name: notification_mail_list notification_mail_list_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list ALTER COLUMN notification_mail_list_id SET DEFAULT nextval('public.notification_mail_list_notification_mail_list_id_seq'::regclass);


--
-- Name: notification_subscription_settings setting_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: presses press_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses ALTER COLUMN press_id SET DEFAULT nextval('public.presses_press_id_seq'::regclass);


--
-- Name: publication_dates publication_date_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_dates ALTER COLUMN publication_date_id SET DEFAULT nextval('public.publication_dates_publication_date_id_seq'::regclass);


--
-- Name: publication_formats publication_format_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats ALTER COLUMN publication_format_id SET DEFAULT nextval('public.publication_formats_publication_format_id_seq'::regclass);


--
-- Name: publications publication_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);


--
-- Name: queries query_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queries ALTER COLUMN query_id SET DEFAULT nextval('public.queries_query_id_seq'::regclass);


--
-- Name: queued_payments queued_payment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queued_payments ALTER COLUMN queued_payment_id SET DEFAULT nextval('public.queued_payments_queued_payment_id_seq'::regclass);


--
-- Name: representatives representative_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.representatives ALTER COLUMN representative_id SET DEFAULT nextval('public.representatives_representative_id_seq'::regclass);


--
-- Name: review_assignments review_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments ALTER COLUMN review_id SET DEFAULT nextval('public.review_assignments_review_id_seq'::regclass);


--
-- Name: review_form_elements review_form_element_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('public.review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_forms review_form_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('public.review_forms_review_form_id_seq'::regclass);


--
-- Name: review_rounds review_round_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('public.review_rounds_review_round_id_seq'::regclass);


--
-- Name: sales_rights sales_rights_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sales_rights ALTER COLUMN sales_rights_id SET DEFAULT nextval('public.sales_rights_sales_rights_id_seq'::regclass);


--
-- Name: series series_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series ALTER COLUMN series_id SET DEFAULT nextval('public.series_series_id_seq'::regclass);


--
-- Name: spotlights spotlight_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlights ALTER COLUMN spotlight_id SET DEFAULT nextval('public.spotlights_spotlight_id_seq'::regclass);


--
-- Name: stage_assignments stage_assignment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('public.stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: static_pages static_page_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_pages ALTER COLUMN static_page_id SET DEFAULT nextval('public.static_pages_static_page_id_seq'::regclass);


--
-- Name: submission_chapters chapter_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters ALTER COLUMN chapter_id SET DEFAULT nextval('public.submission_chapters_chapter_id_seq'::regclass);


--
-- Name: submission_comments comment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.submission_comments_comment_id_seq'::regclass);


--
-- Name: submission_files file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN file_id SET DEFAULT nextval('public.submission_files_file_id_seq'::regclass);


--
-- Name: submission_search_keyword_list keyword_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('public.submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: submission_search_objects object_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('public.submission_search_objects_object_id_seq'::regclass);


--
-- Name: submissions submission_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submissions ALTER COLUMN submission_id SET DEFAULT nextval('public.submissions_submission_id_seq'::regclass);


--
-- Name: temporary_files file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.temporary_files ALTER COLUMN file_id SET DEFAULT nextval('public.temporary_files_file_id_seq'::regclass);


--
-- Name: user_groups user_group_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('public.user_groups_user_group_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


--
-- Data for Name: announcement_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.announcement_settings (announcement_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_type_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.announcement_type_settings (type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_types; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.announcement_types (type_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.auth_sources (auth_id, title, plugin, auth_default, settings) FROM stdin;
\.


--
-- Data for Name: author_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.author_settings (author_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	affiliation	University of Calgary	\N
1		country	CA	\N
1	en_US	familyName	Clark	\N
1	en_US	givenName	Arthur	\N
2	en_US	affiliation	Athabasca University	\N
2		country	CA	\N
2	en_US	familyName	Finkel	\N
2	en_US	givenName	Alvin	\N
3	en_US	affiliation		\N
3	fr_CA	affiliation		\N
3	en_US	biography		\N
3	fr_CA	biography		\N
3		country	CA	\N
3	en_US	familyName	Carter	\N
3	fr_CA	familyName		\N
3	en_US	givenName	Sarah	\N
3	fr_CA	givenName		\N
3		orcid		\N
3	en_US	preferredPublicName		\N
3	fr_CA	preferredPublicName		\N
3		url		\N
4	en_US	affiliation		\N
4	fr_CA	affiliation		\N
4	en_US	biography		\N
4	fr_CA	biography		\N
4		country	CA	\N
4	en_US	familyName	Fortna	\N
4	fr_CA	familyName		\N
4	en_US	givenName	Peter	\N
4	fr_CA	givenName		\N
4		orcid		\N
4	en_US	preferredPublicName		\N
4	fr_CA	preferredPublicName		\N
4		url		\N
5	en_US	affiliation		\N
5	fr_CA	affiliation		\N
5	en_US	biography		\N
5	fr_CA	biography		\N
5		country	CA	\N
5	en_US	familyName	Friesen	\N
5	fr_CA	familyName		\N
5	en_US	givenName	Gerald	\N
5	fr_CA	givenName		\N
5		orcid		\N
5	en_US	preferredPublicName		\N
5	fr_CA	preferredPublicName		\N
5		url		\N
6	en_US	affiliation		\N
6	fr_CA	affiliation		\N
6	en_US	biography		\N
6	fr_CA	biography		\N
6		country	CA	\N
6	en_US	familyName	Dick	\N
6	fr_CA	familyName		\N
6	en_US	givenName	Lyle	\N
6	fr_CA	givenName		\N
6		orcid		\N
6	en_US	preferredPublicName		\N
6	fr_CA	preferredPublicName		\N
6		url		\N
7	en_US	affiliation		\N
7	fr_CA	affiliation		\N
7	en_US	biography		\N
7	fr_CA	biography		\N
7		country	CA	\N
7	en_US	familyName	Wheeler	\N
7	fr_CA	familyName		\N
7	en_US	givenName	Winona	\N
7	fr_CA	givenName		\N
7		orcid		\N
7	en_US	preferredPublicName		\N
7	fr_CA	preferredPublicName		\N
7		url		\N
8	en_US	affiliation		\N
8	fr_CA	affiliation		\N
8	en_US	biography		\N
8	fr_CA	biography		\N
8		country	CA	\N
8	en_US	familyName	Dyce	\N
8	fr_CA	familyName		\N
8	en_US	givenName	Matt	\N
8	fr_CA	givenName		\N
8		orcid		\N
8	en_US	preferredPublicName		\N
8	fr_CA	preferredPublicName		\N
8		url		\N
9	en_US	affiliation		\N
9	fr_CA	affiliation		\N
9	en_US	biography		\N
9	fr_CA	biography		\N
9		country	CA	\N
9	en_US	familyName	Opp	\N
9	fr_CA	familyName		\N
9	en_US	givenName	James	\N
9	fr_CA	givenName		\N
9		orcid		\N
9	en_US	preferredPublicName		\N
9	fr_CA	preferredPublicName		\N
9		url		\N
10	en_US	affiliation	Athabasca University	\N
10		country	CA	\N
10	en_US	familyName	Barnetson	\N
10	en_US	givenName	Bob	\N
11	en_US	affiliation	University of British Columbia	\N
11		country	CA	\N
11	en_US	familyName	Beaty	\N
11	en_US	givenName	Bart	\N
12	en_US	affiliation	University of Alberta	\N
12	fr_CA	affiliation		\N
12	en_US	biography		\N
12	fr_CA	biography		\N
12		country	CA	\N
12	en_US	familyName	Miller	\N
12	fr_CA	familyName		\N
12	en_US	givenName	Toby	\N
12	fr_CA	givenName		\N
12		orcid		\N
12	en_US	preferredPublicName		\N
12	fr_CA	preferredPublicName		\N
12		url		\N
13	fr_CA	affiliation		\N
13	en_US	biography		\N
13	fr_CA	biography		\N
13		country	CA	\N
13	en_US	familyName	Wagman	\N
13	fr_CA	familyName		\N
13	en_US	givenName	Ira	\N
13	fr_CA	givenName		\N
13		orcid		\N
13	en_US	affiliation	Athabasca University	\N
13	en_US	preferredPublicName		\N
13	fr_CA	preferredPublicName		\N
13		url		\N
14	en_US	affiliation	University of Calgary	\N
14	fr_CA	affiliation		\N
14	en_US	biography		\N
14	fr_CA	biography		\N
14		country	CA	\N
14	en_US	familyName	Straw	\N
14	fr_CA	familyName		\N
14	en_US	givenName	Will	\N
14	fr_CA	givenName		\N
14		orcid		\N
14	en_US	preferredPublicName		\N
14	fr_CA	preferredPublicName		\N
14		url		\N
15	en_US	affiliation	University of Southern California	\N
15		country	CA	\N
15	en_US	familyName	Allan	\N
15	en_US	givenName	Chantal	\N
16	en_US	affiliation	SUNY	\N
16		country	US	\N
16	en_US	familyName	Bernnard	\N
16	en_US	givenName	Deborah	\N
17	en_US	affiliation	SUNY	\N
17	fr_CA	affiliation		\N
17	en_US	biography		\N
17	fr_CA	biography		\N
17		country	US	\N
17	en_US	familyName	Bobish	\N
17	fr_CA	familyName		\N
17	en_US	givenName	Greg	\N
17	fr_CA	givenName		\N
17		orcid		\N
17	en_US	preferredPublicName		\N
17	fr_CA	preferredPublicName		\N
17		url		\N
18	en_US	affiliation	SUNY	\N
18	fr_CA	affiliation		\N
18	en_US	biography		\N
18	fr_CA	biography		\N
18		country	US	\N
18	en_US	familyName	Bullis	\N
18	fr_CA	familyName		\N
18	en_US	givenName	Daryl	\N
18	fr_CA	givenName		\N
18		orcid		\N
18	en_US	preferredPublicName		\N
18	fr_CA	preferredPublicName		\N
18		url		\N
19	en_US	affiliation	SUNY	\N
19	fr_CA	affiliation		\N
19	en_US	biography		\N
19	fr_CA	biography		\N
19		country	US	\N
19	en_US	familyName	Hecker	\N
19	fr_CA	familyName		\N
19	en_US	givenName	Jenna	\N
19	fr_CA	givenName		\N
19		orcid		\N
19	en_US	preferredPublicName		\N
19	fr_CA	preferredPublicName		\N
19		url		\N
20	en_US	affiliation	Athabasca University	\N
20		country	CA	\N
20	en_US	familyName	Kennepohl	\N
20	en_US	givenName	Dietmar	\N
21	en_US	affiliation	University of Calgary	\N
21	fr_CA	affiliation		\N
21	en_US	biography		\N
21	fr_CA	biography		\N
21		country	CA	\N
21	en_US	familyName	Anderson	\N
21	fr_CA	familyName		\N
21	en_US	givenName	Terry	\N
21	fr_CA	givenName		\N
21		orcid		\N
21	en_US	preferredPublicName		\N
21	fr_CA	preferredPublicName		\N
21		url		\N
22	en_US	affiliation	University of Alberta	\N
22	fr_CA	affiliation		\N
22	en_US	biography		\N
22	fr_CA	biography		\N
22		country	CA	\N
22	en_US	familyName	Gorsky	\N
22	fr_CA	familyName		\N
22	en_US	givenName	Paul	\N
22	fr_CA	givenName		\N
22		orcid		\N
22	en_US	preferredPublicName		\N
22	fr_CA	preferredPublicName		\N
22		url		\N
23	en_US	affiliation	Athabasca University	\N
23	fr_CA	affiliation		\N
23	en_US	biography		\N
23	fr_CA	biography		\N
23		country	CA	\N
23	en_US	familyName	Parchoma	\N
23	fr_CA	familyName		\N
23	en_US	givenName	Gale	\N
23	fr_CA	givenName		\N
23		orcid		\N
23	en_US	preferredPublicName		\N
23	fr_CA	preferredPublicName		\N
23		url		\N
24	en_US	affiliation	University of Alberta	\N
24	fr_CA	affiliation		\N
24	en_US	biography		\N
24	fr_CA	biography		\N
24		country	CA	\N
24	en_US	familyName	Palmer	\N
24	fr_CA	familyName		\N
24	en_US	givenName	Stuart	\N
24	fr_CA	givenName		\N
24		orcid		\N
24	en_US	preferredPublicName		\N
24	fr_CA	preferredPublicName		\N
24		url		\N
25	fr_CA	affiliation		\N
25	en_US	affiliation	University of Melbourne	\N
25	fr_CA	biography		\N
25	en_US	biography		\N
25		country	AU	\N
25	fr_CA	familyName		\N
25	en_US	familyName	Barnes	\N
25	en_US	givenName	Daniel	\N
25	fr_CA	givenName		\N
25		orcid		\N
25		url		\N
26	en_US	affiliation	University of Sussex	\N
26		country	CA	\N
26	en_US	familyName	Perini	\N
26	en_US	givenName	Fernando	\N
27	fr_CA	affiliation		\N
27	en_US	affiliation		\N
27	fr_CA	biography		\N
27	en_US	biography		\N
27		country	GB	\N
27	fr_CA	familyName		\N
27	en_US	familyName	Mansell	\N
27	fr_CA	givenName		\N
27	en_US	givenName	Robin	\N
27		orcid		\N
27	fr_CA	preferredPublicName		\N
27	en_US	preferredPublicName		\N
27		url		\N
28	fr_CA	affiliation		\N
28	en_US	affiliation		\N
28	fr_CA	biography		\N
28	en_US	biography		\N
28		country	AR	\N
28	fr_CA	familyName		\N
28	en_US	familyName	Galperin	\N
28	fr_CA	givenName		\N
28	en_US	givenName	Hernan	\N
28		orcid		\N
28	fr_CA	preferredPublicName		\N
28	en_US	preferredPublicName		\N
28		url		\N
29	fr_CA	affiliation		\N
29	en_US	affiliation		\N
29	fr_CA	biography		\N
29	en_US	biography		\N
29		country	CL	\N
29	fr_CA	familyName		\N
29	en_US	familyName	Bello	\N
29	fr_CA	givenName		\N
29	en_US	givenName	Pablo	\N
29		orcid		\N
29	fr_CA	preferredPublicName		\N
29	en_US	preferredPublicName		\N
29		url		\N
30	fr_CA	affiliation		\N
30	en_US	affiliation		\N
30	fr_CA	biography		\N
30	en_US	biography		\N
30		country	AR	\N
30	fr_CA	familyName		\N
30	en_US	familyName	Rabinovich	\N
30	fr_CA	givenName		\N
30	en_US	givenName	Eleonora	\N
30		orcid		\N
30	fr_CA	preferredPublicName		\N
30	en_US	preferredPublicName		\N
30		url		\N
31	en_US	affiliation	Buffalo National Park Foundation	\N
31		country	CA	\N
31	en_US	familyName	Brower	\N
31	en_US	givenName	Jennifer	\N
32	en_US	affiliation	University of Alberta	\N
32		country	CA	\N
32	en_US	familyName	Locke Hart	\N
32	en_US	givenName	Jonathan	\N
33	en_US	affiliation	International Development Research Centre	\N
33		country	CA	\N
33	en_US	familyName	Elder	\N
33	en_US	givenName	Laurent	\N
34	fr_CA	affiliation		\N
34	en_US	affiliation		\N
34	fr_CA	biography		\N
34	en_US	biography		\N
34		country	CA	\N
34	fr_CA	familyName		\N
34	en_US	familyName	Emdon	\N
34	fr_CA	givenName		\N
34	en_US	givenName	Heloise	\N
34		orcid		\N
34	fr_CA	preferredPublicName		\N
34	en_US	preferredPublicName		\N
34		url		\N
35	fr_CA	affiliation		\N
35	en_US	affiliation		\N
35	fr_CA	biography		\N
35	en_US	biography		\N
35		country	CA	\N
35	fr_CA	familyName		\N
35	en_US	familyName	Tulus	\N
35	fr_CA	givenName		\N
35	en_US	givenName	Frank	\N
35		orcid		\N
35	fr_CA	preferredPublicName		\N
35	en_US	preferredPublicName		\N
35		url		\N
36	fr_CA	affiliation		\N
36	en_US	affiliation		\N
36	fr_CA	biography		\N
36	en_US	biography		\N
36		country	AR	\N
36	fr_CA	familyName		\N
36	en_US	familyName	Hyma	\N
36	fr_CA	givenName		\N
36	en_US	givenName	Raymond	\N
36		orcid		\N
36	fr_CA	preferredPublicName		\N
36	en_US	preferredPublicName		\N
36		url		\N
37	fr_CA	affiliation		\N
37	en_US	affiliation		\N
37	fr_CA	biography		\N
37	en_US	biography		\N
37		country	CA	\N
37	fr_CA	familyName		\N
37	en_US	familyName	Valk	\N
37	fr_CA	givenName		\N
37	en_US	givenName	John	\N
37		orcid		\N
37	fr_CA	preferredPublicName		\N
37	en_US	preferredPublicName		\N
37		url		\N
38	en_US	affiliation		\N
38	fr_CA	biography		\N
38	en_US	biography		\N
38		country	CA	\N
38	fr_CA	familyName		\N
38	en_US	familyName	Fourati	\N
38	en_US	givenName	Khaled	\N
38	fr_CA	affiliation		\N
38	fr_CA	givenName		\N
38		orcid		\N
38	fr_CA	preferredPublicName		\N
38	en_US	preferredPublicName		\N
38		url		\N
39	fr_CA	affiliation		\N
39	en_US	affiliation		\N
39	fr_CA	biography		\N
39	en_US	biography		\N
39		country	CA	\N
39	fr_CA	familyName		\N
39	en_US	familyName	de Beer	\N
39	fr_CA	givenName		\N
39	en_US	givenName	Jeremy	\N
39		orcid		\N
39	fr_CA	preferredPublicName		\N
39	en_US	preferredPublicName		\N
39		url		\N
40	fr_CA	affiliation		\N
40	en_US	affiliation		\N
40	fr_CA	biography		\N
40	en_US	biography		\N
40		country	CA	\N
40	fr_CA	familyName		\N
40	en_US	familyName	Bannerman	\N
40	fr_CA	givenName		\N
40	en_US	givenName	Sara	\N
40		orcid		\N
40	fr_CA	preferredPublicName		\N
40	en_US	preferredPublicName		\N
40		url		\N
41	en_US	affiliation	Athabasca University	\N
41		country	CA	\N
41	en_US	familyName	Ally	\N
41	en_US	givenName	Mohamed	\N
42	fr_CA	affiliation		\N
42	en_US	affiliation		\N
42	fr_CA	biography		\N
42	en_US	biography		\N
42		country	GB	\N
42	fr_CA	familyName		\N
42	en_US	familyName	Traxler	\N
42	fr_CA	givenName		\N
42	en_US	givenName	John	\N
42		orcid		\N
42	fr_CA	preferredPublicName		\N
42	en_US	preferredPublicName		\N
42		url		\N
43	fr_CA	affiliation		\N
43	en_US	affiliation		\N
43	fr_CA	biography		\N
43	en_US	biography		\N
43		country	CA	\N
43	fr_CA	familyName		\N
43	en_US	familyName	Koole	\N
43	fr_CA	givenName		\N
43	en_US	givenName	Marguerite	\N
43		orcid		\N
43	fr_CA	preferredPublicName		\N
43	en_US	preferredPublicName		\N
43		url		\N
44	fr_CA	affiliation		\N
44	en_US	affiliation		\N
44	fr_CA	biography		\N
44	en_US	biography		\N
44		country	NO	\N
44	fr_CA	familyName		\N
44	en_US	familyName	Rekkedal	\N
44	fr_CA	givenName		\N
44	en_US	givenName	Torstein	\N
44		orcid		\N
44	fr_CA	preferredPublicName		\N
44	en_US	preferredPublicName		\N
44		url		\N
45	en_US	affiliation	University of Alberta	\N
45		country	CA	\N
45	en_US	familyName	Dawson	\N
45	en_US	givenName	Michael	\N
46	fr_CA	affiliation		\N
46	en_US	affiliation	Athabasca University	\N
46	fr_CA	biography		\N
46	en_US	biography		\N
46		country	CA	\N
46	fr_CA	familyName		\N
46	en_US	familyName	Dupuis	\N
46	fr_CA	givenName		\N
46	en_US	givenName	Brian	\N
46		orcid		\N
46	fr_CA	preferredPublicName		\N
46	en_US	preferredPublicName		\N
46		url		\N
47	en_US	affiliation	University of Calgary	\N
47	fr_CA	affiliation		\N
47	en_US	biography		\N
47	fr_CA	biography		\N
47		country	CA	\N
47	en_US	familyName	Wilson	\N
47	fr_CA	familyName		\N
47	en_US	givenName	Michael	\N
47	fr_CA	givenName		\N
47		orcid		\N
47	en_US	preferredPublicName		\N
47	fr_CA	preferredPublicName		\N
47		url		\N
48	en_US	affiliation	University of Calgary	\N
48		country	CA	\N
48	en_US	familyName	Foran	\N
48	en_US	givenName	Max	\N
49	en_US	affiliation	London School of Economics	\N
49		country	CA	\N
49	en_US	familyName	Power	\N
49	en_US	givenName	Michael	\N
50	en_US	affiliation	International Development Research Centre	\N
50		country	CA	\N
50	en_US	familyName	Smith	\N
50	en_US	givenName	Matthew	\N
51	fr_CA	affiliation		\N
51	en_US	biography		\N
51	fr_CA	biography		\N
51		country	US	\N
51	en_US	familyName	Benkler	\N
51	fr_CA	familyName		\N
51	en_US	givenName	Yochai	\N
51	fr_CA	givenName		\N
51		orcid		\N
51	fr_CA	preferredPublicName		\N
51		url		\N
51	en_US	affiliation		\N
51	en_US	preferredPublicName		\N
52	en_US	affiliation		\N
52	fr_CA	affiliation		\N
52	en_US	biography		\N
52	fr_CA	biography		\N
52		country	CA	\N
52	en_US	familyName	Reilly	\N
52	fr_CA	familyName		\N
52	en_US	givenName	Katherine	\N
52	fr_CA	givenName		\N
52		orcid		\N
52	en_US	preferredPublicName		\N
52	fr_CA	preferredPublicName		\N
52		url		\N
53	en_US	affiliation		\N
53	fr_CA	affiliation		\N
53	en_US	biography		\N
53	fr_CA	biography		\N
53		country	US	\N
53	en_US	familyName	Loudon	\N
53	fr_CA	familyName		\N
53	en_US	givenName	Melissa	\N
53	fr_CA	givenName		\N
53		orcid		\N
53	en_US	preferredPublicName		\N
53	fr_CA	preferredPublicName		\N
53		url		\N
54	en_US	affiliation		\N
54	fr_CA	affiliation		\N
54	en_US	biography		\N
54	fr_CA	biography		\N
54		country	ZA	\N
54	en_US	familyName	Rivett	\N
54	fr_CA	familyName		\N
54	en_US	givenName	Ulrike	\N
54	fr_CA	givenName		\N
54		orcid		\N
54	en_US	preferredPublicName		\N
54	fr_CA	preferredPublicName		\N
54		url		\N
55	en_US	affiliation		\N
55	fr_CA	affiliation		\N
55	en_US	biography		\N
55	fr_CA	biography		\N
55		country	GB	\N
55	en_US	familyName	Graham	\N
55	fr_CA	familyName		\N
55	en_US	givenName	Mark	\N
55	fr_CA	givenName		\N
55		orcid		\N
55	en_US	preferredPublicName		\N
55	fr_CA	preferredPublicName		\N
55		url		\N
56	en_US	affiliation		\N
56	fr_CA	affiliation		\N
56	en_US	biography		\N
56	fr_CA	biography		\N
56		country	NO	\N
56	en_US	familyName	Haarstad	\N
56	fr_CA	familyName		\N
56	en_US	givenName	Håvard	\N
56	fr_CA	givenName		\N
56		orcid		\N
56	en_US	preferredPublicName		\N
56	fr_CA	preferredPublicName		\N
56		url		\N
57	en_US	affiliation		\N
57	fr_CA	affiliation		\N
57	en_US	biography		\N
57	fr_CA	biography		\N
57		country	US	\N
57	en_US	familyName	Smith	\N
57	fr_CA	familyName		\N
57	en_US	givenName	Marshall	\N
57	fr_CA	givenName		\N
57		orcid		\N
57	en_US	preferredPublicName		\N
57	fr_CA	preferredPublicName		\N
57		url		\N
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, submission_id, seq, user_group_id) FROM stdin;
1	aclark@mailinator.com	1	1	\N	0	13
2	afinkel@mailinator.com	1	2	\N	0	14
3	scarter@mailinator.com	1	2	\N	1	14
4	pfortna@mailinator.com	1	2	\N	2	14
5	gfriesen@mailinator.com	1	2	\N	3	13
6	ldick@mailinator.com	1	2	\N	4	13
7	wwheeler@mailinator.com	1	2	\N	5	13
8	mdyce@mailinator.com	1	2	\N	6	13
9	jopp@mailinator.com	1	2	\N	7	13
10	bbarnetson@mailinator.com	1	3	\N	0	13
11	bbeaty@mailinator.com	1	4	\N	0	14
12	tmiller@mailinator.com	1	4	\N	1	13
13	awagman@mailinator.com	1	4	\N	2	13
14	wstraw@mailinator.com	1	4	\N	3	13
15	callan@mailinator.com	1	5	\N	0	13
16	dbernnard@mailinator.com	1	6	\N	0	14
17	gbobish@mailinator.com	1	6	\N	1	13
18	dbullis@mailinator.com	1	6	\N	2	13
19	jhecker@mailinator.com	1	6	\N	3	13
20	dkennepohl@mailinator.com	1	7	\N	0	14
21	tanderson@mailinator.com	1	7	\N	1	13
22	pgorsky@mailinator.com	1	7	\N	2	13
23	gparchoma@mailinator.com	1	7	\N	3	13
24	spalmer@mailinator.com	1	7	\N	4	13
25	dbarnes@mailinator.com	1	8	\N	0	13
26	fperini@mailinator.com	1	9	\N	0	14
27	rmansell@mailinator.com	1	9	\N	1	13
28	hgalperin@mailinator.com	1	9	\N	2	13
29	pbello@mailinator.com	1	9	\N	3	13
30	erabinovich@mailinator.com	1	9	\N	4	13
31	jbrower@mailinator.com	1	10	\N	0	13
32	jlockehart@mailinator.com	1	11	\N	0	13
33	lelder@mailinator.com	1	12	\N	0	14
34	lelder@mailinator.com	1	12	\N	1	14
35	ftulus@mailinator.com	1	12	\N	2	13
36	rhyma@mailinator.com	1	12	\N	3	13
37	jvalk@mailinator.com	1	12	\N	4	13
38	fkourati@mailinator.com	1	12	\N	5	13
39	jdebeer@mailinator.com	1	12	\N	6	13
40	sbannerman@mailinator.com	1	12	\N	7	13
41	mally@mailinator.com	1	13	\N	0	14
42	jtraxler@mailinator.com	1	13	\N	1	13
43	mkoole@mailinator.com	1	13	\N	2	13
44	trekkedal@mailinator.com	1	13	\N	3	13
45	mdawson@mailinator.com	1	14	\N	0	14
46	bdupuis@mailinator.com	1	14	\N	1	13
47	mwilson@mailinator.com	1	14	\N	2	13
48	mforan@mailinator.com	1	15	\N	0	13
49	mpower@mailinator.com	1	16	\N	0	13
50	msmith@mailinator.com	1	17	\N	0	14
51	ybenkler@mailinator.com	1	17	\N	1	13
52	kreilly@mailinator.com	1	17	\N	2	13
53	mloudon@mailinator.com	1	17	\N	3	13
54	urivett@mailinator.com	1	17	\N	4	13
55	mgraham@mailinator.com	1	17	\N	5	13
56	hhaarstad@mailinator.com	1	17	\N	6	13
57	masmith@mailinator.com	1	17	\N	7	13
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.categories (category_id, context_id, parent_id, seq, path, image) FROM stdin;
\.


--
-- Data for Name: category_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.category_settings (category_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: citation_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.citation_settings (citation_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: citations; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.citations (citation_id, publication_id, raw_citation, seq) FROM stdin;
\.


--
-- Data for Name: completed_payments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.completed_payments (completed_payment_id, "timestamp", payment_type, context_id, user_id, assoc_id, amount, currency_code_alpha, payment_method_plugin_name) FROM stdin;
\.


--
-- Data for Name: controlled_vocab_entries; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.controlled_vocab_entries (controlled_vocab_entry_id, controlled_vocab_id, seq) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	2	1
9	2	2
10	2	3
11	2	4
12	2	5
13	2	6
14	2	7
15	3	1
16	3	2
17	3	3
18	4	1
19	4	2
20	4	3
21	4	4
22	4	5
23	4	6
24	4	7
25	5	1
26	5	2
27	5	3
28	6	1
29	6	2
30	6	3
31	6	4
32	6	5
33	6	6
34	6	7
35	6	8
36	6	9
37	6	10
38	6	11
39	6	12
40	7	1
41	7	2
42	2495	1
43	2495	2
44	2911	1
45	2911	2
49	4935	1
50	4935	2
51	4935	3
52	6939	1
53	6939	2
54	8825	1
55	11240	1
56	11240	2
57	11240	3
58	13091	1
59	13091	2
60	13091	3
61	15775	1
62	15775	2
63	17608	1
65	20700	1
66	27198	1
67	27198	2
\.


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		name	journal	string
2		name	issue	string
3		name	article	string
4		name	proceeding	string
5		name	conference	string
6		name	preprint	string
7		name	unknown	string
8		name	book	string
9		name	bookitem	string
10		name	proceeding	string
11		name	conference	string
12		name	report	string
13		name	document	string
14		name	unknown	string
15		name	personal	string
16		name	corporate	string
17		name	conference	string
18		name	aut	string
18		description	Author	string
19		name	ctb	string
19		description	Contributor	string
20		name	edt	string
20		description	Editor	string
21		name	ill	string
21		description	Illustrator	string
22		name	pht	string
22		description	Photographer	string
23		name	spn	string
23		description	Sponsor	string
24		name	trl	string
24		description	Translator	string
25		name	multimedia	string
26		name	still image	string
27		name	text	string
28		name	article	string
29		name	book	string
30		name	conference publication	string
31		name	issue	string
32		name	journal	string
33		name	newspaper	string
34		name	picture	string
35		name	review	string
36		name	periodical	string
37		name	series	string
38		name	thesis	string
39		name	web site	string
40		name	electronic	string
41		name	print	string
42	en_US	submissionKeyword	Business & Economics	string
43	en_US	submissionKeyword	Political & International Studies	string
44	en_US	submissionKeyword	Canadian Studies	string
45	en_US	submissionKeyword	Communication & Cultural Studies	string
49	en_US	submissionKeyword	Canadian Studies	string
50	en_US	submissionKeyword	Communication & Cultural Studies	string
51	en_US	submissionKeyword	Political & International Studies	string
52	en_US	submissionKeyword	information literacy	string
53	en_US	submissionKeyword	academic libraries	string
54	en_US	submissionKeyword	Education	string
55	en_US	submissionKeyword	Information	string
56	en_US	submissionKeyword	society	string
57	en_US	submissionKeyword	ICT	string
58	en_US	submissionKeyword	Biography & Memoir	string
59	en_US	submissionKeyword	Environmental Studies	string
60	en_US	submissionKeyword	Political & International Studies	string
61	en_US	submissionKeyword	International Development	string
62	en_US	submissionKeyword	ICT	string
63	en_US	submissionKeyword	Educational Technology	string
65	en_US	submissionKeyword	Psychology	string
66	en_US	submissionKeyword	International Development	string
67	en_US	submissionKeyword	ICT	string
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.controlled_vocabs (controlled_vocab_id, symbolic, assoc_type, assoc_id) FROM stdin;
1	openurl10-journal-genres	0	0
2	openurl10-book-genres	0	0
3	mods34-name-types	0	0
4	mods34-name-role-roleTerms-marcrelator	0	0
5	mods34-typeOfResource	0	0
6	mods34-genre-marcgt	0	0
7	mods34-physicalDescription-form-marcform	0	0
8	interest	0	0
24744	submissionKeyword	1048588	15
24745	submissionSubject	1048588	15
24746	submissionDiscipline	1048588	15
24747	submissionLanguage	1048588	15
24748	submissionAgency	1048588	15
11240	submissionKeyword	1048588	9
11241	submissionSubject	1048588	9
11242	submissionDiscipline	1048588	9
11243	submissionLanguage	1048588	9
11244	submissionAgency	1048588	9
26	submissionKeyword	1048588	1
27	submissionSubject	1048588	1
28	submissionDiscipline	1048588	1
29	submissionLanguage	1048588	1
30	submissionAgency	1048588	1
2495	submissionKeyword	1048588	3
2496	submissionSubject	1048588	3
2497	submissionDiscipline	1048588	3
2498	submissionLanguage	1048588	3
2499	submissionAgency	1048588	3
6939	submissionKeyword	1048588	6
6940	submissionSubject	1048588	6
6941	submissionDiscipline	1048588	6
6942	submissionLanguage	1048588	6
6943	submissionAgency	1048588	6
13667	submissionKeyword	1048588	11
13668	submissionSubject	1048588	11
13669	submissionDiscipline	1048588	11
13670	submissionLanguage	1048588	11
13671	submissionAgency	1048588	11
826	submissionKeyword	1048588	2
827	submissionSubject	1048588	2
828	submissionDiscipline	1048588	2
829	submissionLanguage	1048588	2
830	submissionAgency	1048588	2
4935	submissionKeyword	1048588	5
4936	submissionSubject	1048588	5
4937	submissionDiscipline	1048588	5
4938	submissionLanguage	1048588	5
4939	submissionAgency	1048588	5
13091	submissionKeyword	1048588	10
13092	submissionSubject	1048588	10
13093	submissionDiscipline	1048588	10
13094	submissionLanguage	1048588	10
13095	submissionAgency	1048588	10
17608	submissionKeyword	1048588	13
17609	submissionSubject	1048588	13
17610	submissionDiscipline	1048588	13
17611	submissionLanguage	1048588	13
17612	submissionAgency	1048588	13
2911	submissionKeyword	1048588	4
2912	submissionSubject	1048588	4
2913	submissionDiscipline	1048588	4
2914	submissionLanguage	1048588	4
2915	submissionAgency	1048588	4
8825	submissionKeyword	1048588	7
8826	submissionSubject	1048588	7
8827	submissionDiscipline	1048588	7
8828	submissionLanguage	1048588	7
8829	submissionAgency	1048588	7
11004	submissionKeyword	1048588	8
11005	submissionSubject	1048588	8
11006	submissionDiscipline	1048588	8
11007	submissionLanguage	1048588	8
11008	submissionAgency	1048588	8
27198	submissionKeyword	1048588	17
27199	submissionSubject	1048588	17
27200	submissionDiscipline	1048588	17
27201	submissionLanguage	1048588	17
27202	submissionAgency	1048588	17
25740	submissionKeyword	1048588	16
25741	submissionSubject	1048588	16
25742	submissionDiscipline	1048588	16
25743	submissionLanguage	1048588	16
25744	submissionAgency	1048588	16
15775	submissionKeyword	1048588	12
15776	submissionSubject	1048588	12
15777	submissionDiscipline	1048588	12
15778	submissionLanguage	1048588	12
15779	submissionAgency	1048588	12
20700	submissionKeyword	1048588	14
20701	submissionSubject	1048588	14
20702	submissionDiscipline	1048588	14
20703	submissionLanguage	1048588	14
20704	submissionAgency	1048588	14
\.


--
-- Data for Name: data_object_tombstone_oai_set_objects; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.data_object_tombstone_oai_set_objects (object_id, tombstone_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Data for Name: data_object_tombstone_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.data_object_tombstone_settings (tombstone_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: data_object_tombstones; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.data_object_tombstones (tombstone_id, data_object_id, date_deleted, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
1	1	0	1	0	3	3	2021-11-14 22:18:46
2	1	1	3	1	3	2	2021-11-14 22:18:58
3	2	0	1	0	3	3	2021-11-14 22:21:28
4	4	0	1	0	3	1	2021-11-14 22:24:32
5	4	3	2	1	3	3	2021-11-14 22:24:49
6	4	4	3	1	3	2	2021-11-14 22:25:07
7	4	0	4	0	3	7	2021-11-14 22:25:24
8	5	0	1	0	3	1	2021-11-14 22:26:38
9	5	5	2	1	3	3	2021-11-14 22:26:51
10	5	6	3	1	3	2	2021-11-14 22:27:06
11	5	0	4	0	3	7	2021-11-14 22:27:20
12	6	0	1	0	3	1	2021-11-14 22:29:57
13	6	7	2	1	6	15	2021-11-14 22:30:23
14	7	0	1	0	3	3	2021-11-14 22:33:05
15	7	8	3	1	3	2	2021-11-14 22:33:24
16	9	0	1	0	3	1	2021-11-14 22:36:26
17	11	0	1	0	3	1	2021-11-14 22:38:19
18	11	10	2	1	3	3	2021-11-14 22:38:31
19	11	11	3	1	3	2	2021-11-14 22:39:26
20	12	0	1	0	3	1	2021-11-14 22:41:30
21	13	0	1	0	3	1	2021-11-14 22:43:49
22	13	13	2	1	3	3	2021-11-14 22:44:04
23	13	14	3	1	3	2	2021-11-14 22:45:25
24	14	0	1	0	3	1	2021-11-14 22:48:01
25	14	15	2	1	3	3	2021-11-14 22:48:20
26	14	16	3	1	3	2	2021-11-14 22:48:40
27	14	0	4	0	3	7	2021-11-14 22:48:58
28	15	0	1	0	3	3	2021-11-14 22:51:36
29	16	0	1	0	3	3	2021-11-14 22:52:34
30	17	0	1	0	3	1	2021-11-14 22:56:38
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
\.


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates (email_id, email_key, context_id, enabled) FROM stdin;
\.


--
-- Data for Name: email_templates_default; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_default (email_id, email_key, can_disable, can_edit, from_role_id, to_role_id) FROM stdin;
1	NOTIFICATION	0	1	\N	\N
2	NOTIFICATION_CENTER_DEFAULT	0	1	\N	\N
3	PASSWORD_RESET_CONFIRM	0	1	\N	\N
4	PASSWORD_RESET	0	1	\N	\N
5	USER_REGISTER	0	1	\N	\N
6	USER_VALIDATE	0	1	\N	\N
7	REVIEWER_REGISTER	0	1	\N	\N
8	PUBLISH_NOTIFY	0	1	\N	\N
9	SUBMISSION_ACK	1	1	\N	65536
10	SUBMISSION_ACK_NOT_USER	1	1	\N	65536
11	EDITOR_ASSIGN	1	1	16	16
12	REVIEW_CANCEL	1	1	16	4096
13	REVIEW_REINSTATE	1	1	16	4096
14	REVIEW_REQUEST	1	1	16	4096
15	REVIEW_REQUEST_ONECLICK	1	1	16	4096
16	REVIEW_REQUEST_REMIND_AUTO	0	1	\N	4096
17	REVIEW_REQUEST_REMIND_AUTO_ONECLICK	0	1	\N	4096
18	REVIEW_REQUEST_ATTACHED	0	1	16	4096
19	REVIEW_CONFIRM	1	1	4096	16
20	REVIEW_DECLINE	1	1	4096	16
21	REVIEW_ACK	1	1	16	4096
22	REVIEW_REMIND	0	1	16	4096
23	REVIEW_REMIND_AUTO	0	1	\N	4096
24	REVIEW_REMIND_ONECLICK	0	1	16	4096
25	REVIEW_REMIND_AUTO_ONECLICK	0	1	\N	4096
26	EDITOR_DECISION_ACCEPT	0	1	16	65536
27	EDITOR_DECISION_SEND_TO_EXTERNAL	0	1	16	65536
28	EDITOR_DECISION_SEND_TO_PRODUCTION	0	1	16	65536
29	EDITOR_DECISION_REVISIONS	0	1	16	65536
30	EDITOR_DECISION_RESUBMIT	0	1	16	65536
31	EDITOR_DECISION_DECLINE	0	1	16	65536
32	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536
33	EDITOR_RECOMMENDATION	0	1	16	16
34	COPYEDIT_REQUEST	1	1	16	4097
35	LAYOUT_REQUEST	1	1	16	4097
36	LAYOUT_COMPLETE	1	1	4097	16
37	INDEX_REQUEST	1	1	16	4097
38	INDEX_COMPLETE	1	1	4097	16
39	EMAIL_LINK	0	1	1048576	\N
40	STATISTICS_REPORT_NOTIFICATION	0	1	16	17
41	PAYPAL_INVESTIGATE_PAYMENT	0	1	\N	\N
42	MANUAL_PAYMENT_NOTIFICATION	0	1	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$principalContactSignature}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$contextName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
PASSWORD_RESET	en_US	Password Reset	Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$username}<br />\nYour new password: {$password}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.
USER_REGISTER	en_US	Press Registration	{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE	en_US	Validate Your Account	{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
REVIEWER_REGISTER	en_US	Registration as Reviewer with {$contextName}	In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you'll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.
REVIEW_REINSTATE	en_US	Request for Review Reinstated	{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal's review process.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
PUBLISH_NOTIFY	en_US	New Book Published	Readers:<br />\n<br />\n{$contextName} has just published its latest book at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Editor's User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.
EDITOR_ASSIGN	en_US	Editorial Assignment	{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,	This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.
REVIEW_CANCEL	en_US	Request for Review Cancelled	{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
REVIEW_REQUEST	en_US	Manuscript Review Request	Dear {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n	This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)
REVIEW_REQUEST_ONECLICK	en_US	Manuscript Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}	This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.
REVIEW_REQUEST_REMIND_AUTO	en_US	Manuscript Review Request	Dear {$reviewerName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REQUEST_REMIND_AUTO_ONECLICK	en_US	Manuscript Review Request	{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REQUEST_ATTACHED	en_US	Manuscript Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this press are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n	This email is sent by the Series Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)
REVIEW_CONFIRM	en_US	Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}	This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.
REVIEW_DECLINE	en_US	Unable to Review	Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}	This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.
REVIEW_ACK	en_US	Manuscript Review Acknowledgement	{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.	This email is sent by a Series Editor to confirm receipt of a completed review and thank the reviewer for their contributions.
REVIEW_REMIND	en_US	Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Series Editor to remind a reviewer that their review is due.
REVIEW_REMIND_AUTO	en_US	Automated Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REMIND_ONECLICK	en_US	Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Series Editor to remind a reviewer that their review is due.
REVIEW_REMIND_AUTO_ONECLICK	en_US	Automated Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
EDITOR_DECISION_ACCEPT	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}	This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.
EDITOR_DECISION_SEND_TO_EXTERNAL	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}	This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to an external review.
EDITOR_DECISION_SEND_TO_PRODUCTION	en_US	Editor Decision	{$authorName}:<br />\n<br />\nThe editing of your manuscript, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nManuscript URL: {$submissionUrl}	This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to production.
EDITOR_DECISION_REVISIONS	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}	This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.
EDITOR_DECISION_RESUBMIT	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}	This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.
EDITOR_DECISION_DECLINE	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}	This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Editor Decision	\n\t\t\t{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\nManuscript URL: {$submissionUrl}\n\t\t	This email is send to the author if the editor declines his submission initially, before the review stage
EDITOR_RECOMMENDATION	en_US	Editor Recommendation	{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}	This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.
COPYEDIT_REQUEST	en_US	Copyediting Request	{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and click on the File that appears in Step 1.<br />\n3. Consult Copyediting Instructions posted on webpage.<br />\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.<br />\n5. Save copyedited file, and upload to Step 1 of Copyediting.<br />\n6. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}	This email is sent by a Series Editor to a submission's Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.
LAYOUT_REQUEST	en_US	Request Galleys	{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Layout Version file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.	This email from the Series Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.
LAYOUT_COMPLETE	en_US	Layout Galleys Complete	{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}	This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.
INDEX_REQUEST	en_US	Request Index	{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$editorialContactSignature}	This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.
INDEX_COMPLETE	en_US	Index Galleys Complete	{$editorialContactName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}	This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.
EMAIL_LINK	en_US	Manuscript of Possible Interest	Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$monographUrl}&quot;.	This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.
STATISTICS_REPORT_NOTIFICATION	en_US	Editorial activity for {$month}, {$year}	\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n\t<li>New submissions this month: {$newSubmissions}</li>\n\t<li>Declined submissions this month: {$declinedSubmissions}</li>\n\t<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n\t<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href="{$editorialStatsLink}">editorial trends</a> and <a href="{$publicationStatsLink}">published article stats</a>. A full copy of this month's editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}	This email is automatically sent monthly to editors and journal managers to provide them a system health overview.
PAYPAL_INVESTIGATE_PAYMENT	en_US	Unusual PayPal Activity	Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n	This email template is used to notify the press' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.
MANUAL_PAYMENT_NOTIFICATION	en_US	Manual Payment Notification	A manual payment needs to be processed for the press {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.	This email template is used to notify a press manager contact that a manual payment was requested.
NOTIFICATION	fr_CA	Nouvelle notification de {$siteTitle}	Vous avez reçu une nouvelle notification de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs qui ont demandé qu'on leur envoie ce type de notification par courriel.
NOTIFICATION_CENTER_DEFAULT	fr_CA	Un message à propos de la presse {$contextName}	Veuillez saisir votre message.	Le message (vierge) par défaut utilisé par le centre d'alerte.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de réinitialisation du mot de passe	Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé à un utilisateur lorsqu'il a indiqué avoir oublié son mot de passe ou être incapable d'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.
PASSWORD_RESET	fr_CA	Réinitialisation du mot de passe	Votre mot de passe vous permettant d'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d'utilisateur: {$username}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé à un utilisateur lorsque son mot de passe a été réinitialisé après avoir suivi les instructions du courriel "PASSWORD_RESET_CONFIRM".
USER_REGISTER	fr_CA	Inscription à la presse	{$userFullName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$contextName}. Ce courriel contient votre nom d'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d'utilisateur et son mot de passe pour ses dossiers.
USER_VALIDATE	fr_CA	Valider votre compte	{$userFullName}<br />\n<br />\nVous avez ouvert un compte chez {$contextName}. Mais avant de pouvoir l'utiliser, vous devez confirmer votre adresse courriel. Il suffit de cliquer sur le lien ci-dessous.<br />\n<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un nouvel utilisateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d'utilisateur et de son mot de passe.
REVIEWER_REGISTER	fr_CA	Inscription à titre d'évaluateur pour la presse {$contextName}	En raison de votre expertise, nous avons ajouté votre nom à notre base de données d'évaluateurs pour la presse {$contextName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d'évaluation, vous aurez la possibilité de lire le titre et le résumé de l'article en question. Vous serez toujours libre d'accepter ou de refuser l'invitation. Vous pouvez demander que l'on retire votre nom de notre liste d'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d'intérêt en ce qui concerne l'évaluation des articles.<br />\n<br />\n<br />\nNom d'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d'utilisateur et de son mot de passe.
PUBLISH_NOTIFY	fr_CA	Nouveau livre publié	Chers lecteurs,<br />\n<br />\n{$contextName} a récemment publié son dernier livre au {$contextUrl}. Nous vous invitons à consulter la table des matières ici et à consulter notre site Web afin de lire les monographies et les articles qui vous intéressent.<br />\n<br />\nMerci de l'intérêt que vous portez à nos publications.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé aux lecteurs par le lien d'avis aux utilisateurs qui se trouve sur la page du rédacteur en chef. Il indique aux lecteurs que l'on a récemment publié un nouveau livre et les invite à cliquer sur le lien URL de la presse.
SUBMISSION_ACK	fr_CA	Accusé de réception d'une soumission	{$authorName}:<br />\n<br />\nMerci d'avoir envoyé votre manuscrit &quot;{$submissionTitle}&quot; à la presse {$contextName}. Le système de gestion virtuel de la presse que nous utilisons vous permet de suivre les progrès de votre article tout au long du processus de publication. Il suffit d'ouvrir une session sur le site Web:<br />\n<br />\nURL du manuscrit: {$submissionUrl}<br />\nNom d'utilisateur: {$authorUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}	Lorsqu'il est activé, ce courriel est envoyé automatiquement à l'auteur lorsqu'il soumet son manuscrit à la presse. Il fournit des renseignements sur le suivi de la soumission tout au long du processus de publication et remercie l'auteur d'avoir envoyé une soumission.
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception d'une soumission	Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$contextName}. <br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}	Lorsqu'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d'OMP identifiés pendant le processus de soumission.
EDITOR_ASSIGN	fr_CA	Travail éditorial	{$editorialContactName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$contextName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$editorUsername}<br />\n<br />\nMerci,	Ce courriel indique au rédacteur en chef d'une série qu'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.
REVIEW_CANCEL	fr_CA	Annulation de la requête d'évaluation	{$reviewerName}:<br />\n<br />\n<br />\nNous avons décidé d'annuler notre requête d'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$contextName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter.	Ce courriel est envoyé à un évaluateur qui a entamé le processus d'évaluation d'une soumission par le rédacteur en chef d'une série afin d'informer l'évaluateur que la procédure d'évaluation a été annulée.
REVIEW_REQUEST	fr_CA	Requête d'évaluation d'un manuscrit	Bonjour {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d'ici le {$responseDueDate} pour indiquer si vous serez en mesure d'évaluer l'article ou non. Ceci vous permettra également d'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL'évaluation doit être terminée d'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d'utilisateur: {$reviewerUserName}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$editorialContactSignature}<br />\n	Ce courriel est envoyé à un évaluateur par le rédacteur en chef d'une série afin de lui demander s'il accepte ou refuse d'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l'article, il indique la date d'échéance pour l'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu'on choisit l'option Processus d'évaluation standard à l'étape 2 de la section Configuration de la presse. (Sinon, voir REVIEW_REQUEST_ATTACHED.)
REVIEW_REQUEST_ONECLICK	fr_CA	Requête d'évaluation d'un manuscrit	{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; soumis à la presse {$contextName}. Vous trouverez ci-dessous le résumé de l'article. J'espère que vous accepterez cette tâche importante du processus de publication.<br />\n<br />\nVeuillez ouvrir une session sur le site Web d'ici le {$weekLaterDate} pour indiquer si vous acceptez ou refusez d'évaluer l'article. Ceci vous permettra également d'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\nL'évaluation doit être terminée d'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}	Ce courriel est envoyé à un évaluateur par le rédacteur en chef d'une série afin de lui demander s'il accepte ou refuse d'évaluer une soumission. Il fournit des informations sur la soumission comme le titre et le résumé de l'article, il indique la date d'échéance pour l'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu'on choisit l'option Processus d'évaluation standard à l'étape 2 de la section Configuration de la presse, et que l'on a activé l'option permettant à l'évaluateur d'avoir accès à la soumission en un seul clic.
REVIEW_REQUEST_ATTACHED	fr_CA	Requête d'évaluation d'un manuscrit	{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; et nous vous serions reconnaissants si vous acceptiez cette tâche importante. Vous trouverez ci-dessous les lignes directrices de cette presse concernant l'évaluation. Vous trouverez également la soumission en pièce jointe. Votre évaluation de la soumission et vos recommandations devraient nous parvenir par courriel d'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez répondre à ce courriel d'ici le {$weekLaterDate} pour confirmer si vous acceptez d'évaluer cet article.<br />\n<br />\n<br />\nNous vous remercions à l'avance et espérons que vous accepterez cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nLignes directrices concernant l'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n	Ce courriel est envoyé par le rédacteur en chef d'une série à un évaluateur afin de lui demander s'il accepte ou refuse d'évaluer une soumission. Il contient la soumission en pièce jointe. Ce message est utilisé lorsque vous sélectionnez l'option Processus d'évaluation par courriel avec pièce jointe à l'étape 2 de la Configuration de la presse. (Sinon, voir REVIEW_REQUEST.)
REVIEW_CONFIRM	fr_CA	En mesure d'évaluer	Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d'ici le {$reviewDueDate}.<br />\n<br />\n{$reviewerName}	Ce courriel est envoyé au rédacteur en chef d'une série pour répondre à la requête d'évaluation. Il a pour but de permettre à l'évaluateur d'indiquer au rédacteur en chef qu'il a accepté d'évaluer l'article et qu'il aura terminé son évaluation dans les délais prescrits.
REVIEW_DECLINE	fr_CA	Ne peux pas évaluer	Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m'avoir invité à évaluer cet article et n'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$reviewerName}	Ce courriel est envoyé par l'évaluateur au rédacteur en chef d'une série série pour indiquer qu'il ne sera pas en mesure d'évaluer l'article en question.
REVIEW_ACK	fr_CA	Accusé de réception pour l'évaluation d'un manuscrit	{$reviewerName}:<br />\n<br />\n<br />\nMerci d'avoir terminé l'évaluation de l'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Grâce à vous, nous sommes en mesure de publier des articles de qualité.	Ce courriel est envoyé par le rédacteur en chef d'une série pour confirmer qu'il a reçu l'évaluation finale de l'article et pour le remercier de sa contribution.
REVIEW_REMIND	fr_CA	Rappel d'évaluation	{$reviewerName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n'avez plus votre nom d'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d'utilisateur: {$reviewerUserName}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d'agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le rédacteur en chef d'une série pour rappeler à l'évaluateur qu'il doit envoyer sa soumission dès que possible.
REVIEW_REMIND_AUTO	fr_CA	Rappel automatique d'évaluation d'une soumission	{$reviewerName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n'avez plus votre nom d'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement lorsqu'une évaluation est en retard (voir les options d'évaluation à l'étape 2 de la section Configuration de la presse) et que l'accès de l'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).
REVIEW_REMIND_ONECLICK	fr_CA	Rappel d'évaluation	{$reviewerName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d'agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le rédacteur en chef d'une série pour rappeler à l'évaluateur qu'il doit envoyer sa soumission dès que possible.
REVIEW_REMIND_AUTO_ONECLICK	fr_CA	Rappel automatique d'évaluation d'une soumission	{$reviewerName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement lorsqu'une évaluation est en retard (voir les options d'évaluation à l'étape 2 de la section Configuration de la presse) et que l'accès de l'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).
EDITOR_DECISION_ACCEPT	fr_CA	Décision du rédacteur en chef	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l'on a pris une décision finale concernant sa soumission.
EDITOR_DECISION_SEND_TO_EXTERNAL	fr_CA	Décision du rédacteur en chef	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour l'informer que sa soumission sera envoyée à un évaluateur externe.
EDITOR_DECISION_SEND_TO_PRODUCTION	fr_CA	Décision du rédacteur en chef	{$authorName}:<br />\n<br />\nLa révision de votre manuscrit &quot;{$submissionTitle}&quot; est terminée. Nous l'envoyons maintenant en production.<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour l'informer que sa soumission passera à l'étape de production.
EDITOR_DECISION_REVISIONS	fr_CA	Décision du rédacteur en chef	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l'on a pris une décision finale concernant sa soumission.
EDITOR_DECISION_RESUBMIT	fr_CA	Décision du rédacteur en chef	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l'on a pris une décision finale concernant sa soumission.
EDITOR_DECISION_DECLINE	fr_CA	Décision du rédacteur en chef	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l'on a pris une décision finale concernant sa soumission.
COPYEDIT_REQUEST	fr_CA	Requête de révision	{$participantName}:<br />\n<br />\nJ'aimerais que vous entamiez le processus de révision de l'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez suivre les étapes suivantes.<br />\n<br />\n1. Cliquez sure le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et cliquez sur le fichier qui apparait à l'étape 1.<br />\n3. Lisez les instructions de révision publiées sur la page Web.<br />\n4. Ouvrez le fichier téléchargé et débutez le processus de révision, tout en ajoutant des questions pour les auteurs, au besoin.<br />\n5. Sauvegardez le fichier révisé et téléchargez-le à l'étape 1 de Révision.<br />\n6. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$participantUsername}	Ce courriel est envoyé par le rédacteur en chef d'une série au réviseur de la soumission afin qu'il entame de processus de révision, lorsque l'évaluation par les pairs est terminée. Il explique comment accéder à la soumission.
LAYOUT_REQUEST	fr_CA	Requête des épreuves en placard	{$participantName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir contribué à cette presse.	Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.
LAYOUT_COMPLETE	fr_CA	Épreuves en placard complétées	{$editorialContactName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}	Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d'une série pour l'informer que la mise en page du manuscrit est terminée.
INDEX_REQUEST	fr_CA	Requête d'indexage	{$participantName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$contextName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir contribué à cette presse.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé à l'indexateur par le rédacteur en chef d'une série pour lui indiquer qu'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.
INDEX_COMPLETE	fr_CA	Indexage des épreuves en placard complété	{$editorialContactName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}	Ce courriel est envoyé par l'indexateur au rédacteur en chef d'une série pour lui indiquer que l'indexage est terminé.
EMAIL_LINK	fr_CA	Manuscrit susceptible d'intéresser	Nous crayons que l'article intitulé &quot;{$submissionTitle}&quot; par {$authorName} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$contextName} au &quot;{$monographUrl}&quot; pourrait vous intéresser.	Ce modèle de courriel permet à un lecteur inscrit d'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.
\.


--
-- Data for Name: email_templates_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_settings (email_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.event_log (log_id, assoc_type, assoc_id, user_id, date_logged, event_type, message, is_translated) FROM stdin;
1	1048585	1	19	2021-11-14 22:18:10	268435458	submission.event.general.metadataUpdated	0
2	515	1	19	2021-11-14 22:18:16	1342177281	submission.event.fileUploaded	0
3	1048585	1	19	2021-11-14 22:18:18	1342177281	submission.event.fileUploaded	0
4	1048585	1	19	2021-11-14 22:18:35	268435458	submission.event.general.metadataUpdated	0
5	1048585	1	19	2021-11-14 22:18:37	268435457	submission.event.submissionSubmitted	0
6	1048585	1	3	2021-11-14 22:18:46	805306371	log.editor.decision	0
7	1048585	1	3	2021-11-14 22:18:55	1073741825	log.review.reviewerAssigned	0
8	1048585	1	3	2021-11-14 22:18:58	805306371	log.editor.decision	0
9	1048585	1	3	2021-11-14 22:19:05	268435459	submission.event.participantAdded	0
10	1048585	2	20	2021-11-14 22:19:14	268435458	submission.event.general.metadataUpdated	0
11	515	2	20	2021-11-14 22:19:20	1342177281	submission.event.fileUploaded	0
12	1048585	2	20	2021-11-14 22:19:22	1342177281	submission.event.fileUploaded	0
13	515	3	20	2021-11-14 22:19:29	1342177281	submission.event.fileUploaded	0
14	1048585	2	20	2021-11-14 22:19:31	1342177281	submission.event.fileUploaded	0
15	515	4	20	2021-11-14 22:19:38	1342177281	submission.event.fileUploaded	0
16	1048585	2	20	2021-11-14 22:19:41	1342177281	submission.event.fileUploaded	0
17	515	5	20	2021-11-14 22:19:48	1342177281	submission.event.fileUploaded	0
18	1048585	2	20	2021-11-14 22:19:50	1342177281	submission.event.fileUploaded	0
19	1048585	2	20	2021-11-14 22:21:12	268435458	submission.event.general.metadataUpdated	0
20	1048585	2	20	2021-11-14 22:21:15	268435457	submission.event.submissionSubmitted	0
21	1048585	2	3	2021-11-14 22:21:28	805306371	log.editor.decision	0
22	1048585	2	3	2021-11-14 22:21:42	1073741825	log.review.reviewerAssigned	0
23	1048585	2	3	2021-11-14 22:21:51	1073741825	log.review.reviewerAssigned	0
24	1048585	3	21	2021-11-14 22:22:00	268435458	submission.event.general.metadataUpdated	0
25	515	10	21	2021-11-14 22:22:06	1342177281	submission.event.fileUploaded	0
26	1048585	3	21	2021-11-14 22:22:08	1342177281	submission.event.fileUploaded	0
27	1048585	3	21	2021-11-14 22:22:36	268435458	submission.event.general.metadataUpdated	0
28	1048585	3	21	2021-11-14 22:22:37	268435457	submission.event.submissionSubmitted	0
29	1048585	4	22	2021-11-14 22:22:45	268435458	submission.event.general.metadataUpdated	0
30	515	11	22	2021-11-14 22:22:50	1342177281	submission.event.fileUploaded	0
31	1048585	4	22	2021-11-14 22:22:53	1342177281	submission.event.fileUploaded	0
32	515	12	22	2021-11-14 22:22:59	1342177281	submission.event.fileUploaded	0
33	1048585	4	22	2021-11-14 22:23:02	1342177281	submission.event.fileUploaded	0
34	515	13	22	2021-11-14 22:23:09	1342177281	submission.event.fileUploaded	0
35	1048585	4	22	2021-11-14 22:23:11	1342177281	submission.event.fileUploaded	0
36	515	14	22	2021-11-14 22:23:18	1342177281	submission.event.fileUploaded	0
37	1048585	4	22	2021-11-14 22:23:21	1342177281	submission.event.fileUploaded	0
38	1048585	4	22	2021-11-14 22:24:18	268435458	submission.event.general.metadataUpdated	0
39	1048585	4	22	2021-11-14 22:24:20	268435457	submission.event.submissionSubmitted	0
40	1048585	4	3	2021-11-14 22:24:32	805306371	log.editor.decision	0
41	1048585	4	3	2021-11-14 22:24:45	1073741825	log.review.reviewerAssigned	0
42	1048585	4	3	2021-11-14 22:24:49	805306371	log.editor.decision	0
43	1048585	4	3	2021-11-14 22:25:03	1073741825	log.review.reviewerAssigned	0
44	1048585	4	3	2021-11-14 22:25:07	805306371	log.editor.decision	0
45	1048585	4	3	2021-11-14 22:25:18	268435459	submission.event.participantAdded	0
46	1048585	4	3	2021-11-14 22:25:24	805306371	log.editor.decision	0
47	1048585	4	3	2021-11-14 22:25:36	268435459	submission.event.participantAdded	0
48	1048585	5	23	2021-11-14 22:25:46	268435458	submission.event.general.metadataUpdated	0
49	515	19	23	2021-11-14 22:25:52	1342177281	submission.event.fileUploaded	0
50	1048585	5	23	2021-11-14 22:25:54	1342177281	submission.event.fileUploaded	0
51	1048585	5	23	2021-11-14 22:26:26	268435458	submission.event.general.metadataUpdated	0
52	1048585	5	23	2021-11-14 22:26:28	268435457	submission.event.submissionSubmitted	0
53	1048585	5	3	2021-11-14 22:26:38	805306371	log.editor.decision	0
54	1048585	5	3	2021-11-14 22:26:48	1073741825	log.review.reviewerAssigned	0
55	1048585	5	3	2021-11-14 22:26:51	805306371	log.editor.decision	0
56	1048585	5	3	2021-11-14 22:27:02	1073741825	log.review.reviewerAssigned	0
57	1048585	5	3	2021-11-14 22:27:06	805306371	log.editor.decision	0
58	1048585	5	3	2021-11-14 22:27:15	268435459	submission.event.participantAdded	0
59	1048585	5	3	2021-11-14 22:27:20	805306371	log.editor.decision	0
60	1048585	5	3	2021-11-14 22:27:29	268435459	submission.event.participantAdded	0
61	1048585	5	3	2021-11-14 22:27:37	268435459	submission.event.participantAdded	0
62	1048585	5	3	2021-11-14 22:27:43	268435474	submission.event.publicationFormatCreated	0
63	1048585	5	3	2021-11-14 22:27:50	268435464	submission.event.publicationFormatPublished	0
64	1048585	5	3	2021-11-14 22:27:53	268435476	submission.event.publicationFormatMadeAvailable	0
65	515	20	3	2021-11-14 22:27:56	1342177287	submission.event.signoffSignoff	0
66	1048585	5	3	2021-11-14 22:28:03	268435462	publication.event.published	0
67	1048585	6	24	2021-11-14 22:28:12	268435458	submission.event.general.metadataUpdated	0
68	515	21	24	2021-11-14 22:28:17	1342177281	submission.event.fileUploaded	0
69	1048585	6	24	2021-11-14 22:28:20	1342177281	submission.event.fileUploaded	0
70	515	22	24	2021-11-14 22:28:26	1342177281	submission.event.fileUploaded	0
71	1048585	6	24	2021-11-14 22:28:29	1342177281	submission.event.fileUploaded	0
72	515	23	24	2021-11-14 22:28:36	1342177281	submission.event.fileUploaded	0
73	1048585	6	24	2021-11-14 22:28:38	1342177281	submission.event.fileUploaded	0
74	515	24	24	2021-11-14 22:28:45	1342177281	submission.event.fileUploaded	0
75	1048585	6	24	2021-11-14 22:28:48	1342177281	submission.event.fileUploaded	0
76	1048585	6	24	2021-11-14 22:29:42	268435458	submission.event.general.metadataUpdated	0
77	1048585	6	24	2021-11-14 22:29:45	268435457	submission.event.submissionSubmitted	0
78	1048585	6	3	2021-11-14 22:29:57	805306371	log.editor.decision	0
79	1048585	6	3	2021-11-14 22:30:09	268435459	submission.event.participantAdded	0
80	1048585	6	6	2021-11-14 22:30:23	805306372	log.editor.recommendation	0
81	1048585	7	25	2021-11-14 22:30:45	268435458	submission.event.general.metadataUpdated	0
82	515	29	25	2021-11-14 22:30:50	1342177281	submission.event.fileUploaded	0
83	1048585	7	25	2021-11-14 22:30:52	1342177281	submission.event.fileUploaded	0
84	515	30	25	2021-11-14 22:30:59	1342177281	submission.event.fileUploaded	0
85	1048585	7	25	2021-11-14 22:31:01	1342177281	submission.event.fileUploaded	0
86	515	31	25	2021-11-14 22:31:08	1342177281	submission.event.fileUploaded	0
87	1048585	7	25	2021-11-14 22:31:11	1342177281	submission.event.fileUploaded	0
88	515	32	25	2021-11-14 22:31:18	1342177281	submission.event.fileUploaded	0
89	1048585	7	25	2021-11-14 22:31:20	1342177281	submission.event.fileUploaded	0
90	515	33	25	2021-11-14 22:31:27	1342177281	submission.event.fileUploaded	0
91	1048585	7	25	2021-11-14 22:31:30	1342177281	submission.event.fileUploaded	0
92	1048585	7	25	2021-11-14 22:32:49	268435458	submission.event.general.metadataUpdated	0
93	1048585	7	25	2021-11-14 22:32:52	268435457	submission.event.submissionSubmitted	0
94	1048585	7	3	2021-11-14 22:33:05	805306371	log.editor.decision	0
95	1048585	7	3	2021-11-14 22:33:19	1073741825	log.review.reviewerAssigned	0
96	1048585	7	3	2021-11-14 22:33:24	805306371	log.editor.decision	0
97	1048585	7	3	2021-11-14 22:33:36	268435459	submission.event.participantAdded	0
98	1048585	8	3	2021-11-14 22:33:47	268435458	submission.event.general.metadataUpdated	0
99	515	39	3	2021-11-14 22:33:52	1342177281	submission.event.fileUploaded	0
100	1048585	8	3	2021-11-14 22:33:55	1342177281	submission.event.fileUploaded	0
101	1048585	8	3	2021-11-14 22:33:57	268435458	submission.event.general.metadataUpdated	0
102	1048585	8	3	2021-11-14 22:33:58	268435457	submission.event.submissionSubmitted	0
103	1048585	9	26	2021-11-14 22:34:06	268435458	submission.event.general.metadataUpdated	0
104	515	40	26	2021-11-14 22:34:11	1342177281	submission.event.fileUploaded	0
105	1048585	9	26	2021-11-14 22:34:14	1342177281	submission.event.fileUploaded	0
106	515	41	26	2021-11-14 22:34:20	1342177281	submission.event.fileUploaded	0
107	1048585	9	26	2021-11-14 22:34:23	1342177281	submission.event.fileUploaded	0
108	515	42	26	2021-11-14 22:34:30	1342177281	submission.event.fileUploaded	0
109	1048585	9	26	2021-11-14 22:34:32	1342177281	submission.event.fileUploaded	0
110	515	43	26	2021-11-14 22:34:39	1342177281	submission.event.fileUploaded	0
111	1048585	9	26	2021-11-14 22:34:42	1342177281	submission.event.fileUploaded	0
112	515	44	26	2021-11-14 22:34:49	1342177281	submission.event.fileUploaded	0
113	1048585	9	26	2021-11-14 22:34:52	1342177281	submission.event.fileUploaded	0
114	1048585	9	26	2021-11-14 22:36:09	268435458	submission.event.general.metadataUpdated	0
115	1048585	9	26	2021-11-14 22:36:12	268435457	submission.event.submissionSubmitted	0
116	1048585	9	3	2021-11-14 22:36:26	805306371	log.editor.decision	0
117	1048585	10	27	2021-11-14 22:36:41	268435458	submission.event.general.metadataUpdated	0
118	515	50	27	2021-11-14 22:36:46	1342177281	submission.event.fileUploaded	0
119	1048585	10	27	2021-11-14 22:36:49	1342177281	submission.event.fileUploaded	0
120	1048585	10	27	2021-11-14 22:37:40	268435458	submission.event.general.metadataUpdated	0
121	1048585	10	27	2021-11-14 22:37:42	268435457	submission.event.submissionSubmitted	0
122	1048585	11	28	2021-11-14 22:37:50	268435458	submission.event.general.metadataUpdated	0
123	515	51	28	2021-11-14 22:37:55	1342177281	submission.event.fileUploaded	0
124	1048585	11	28	2021-11-14 22:37:57	1342177281	submission.event.fileUploaded	0
125	1048585	11	28	2021-11-14 22:38:09	268435458	submission.event.general.metadataUpdated	0
126	1048585	11	28	2021-11-14 22:38:10	268435457	submission.event.submissionSubmitted	0
127	1048585	11	3	2021-11-14 22:38:19	805306371	log.editor.decision	0
128	1048585	11	3	2021-11-14 22:38:28	1073741825	log.review.reviewerAssigned	0
129	1048585	11	3	2021-11-14 22:38:31	805306371	log.editor.decision	0
130	1048585	11	3	2021-11-14 22:38:40	1073741825	log.review.reviewerAssigned	0
131	1048585	11	3	2021-11-14 22:38:47	1073741825	log.review.reviewerAssigned	0
132	1048585	11	10	2021-11-14 22:38:55	1073741830	log.review.reviewAccepted	0
133	1048585	11	10	2021-11-14 22:38:59	1073741848	log.review.reviewReady	0
134	1048585	11	12	2021-11-14 22:39:07	1073741830	log.review.reviewAccepted	0
135	1048585	11	12	2021-11-14 22:39:11	1073741848	log.review.reviewReady	0
136	1048585	11	3	2021-11-14 22:39:26	805306371	log.editor.decision	0
137	1048585	12	29	2021-11-14 22:39:39	268435458	submission.event.general.metadataUpdated	0
138	515	53	29	2021-11-14 22:39:45	1342177281	submission.event.fileUploaded	0
139	1048585	12	29	2021-11-14 22:39:47	1342177281	submission.event.fileUploaded	0
140	515	54	29	2021-11-14 22:39:54	1342177281	submission.event.fileUploaded	0
141	1048585	12	29	2021-11-14 22:39:56	1342177281	submission.event.fileUploaded	0
142	515	55	29	2021-11-14 22:40:03	1342177281	submission.event.fileUploaded	0
143	1048585	12	29	2021-11-14 22:40:06	1342177281	submission.event.fileUploaded	0
144	1048585	12	29	2021-11-14 22:41:13	268435458	submission.event.general.metadataUpdated	0
145	1048585	12	29	2021-11-14 22:41:16	268435457	submission.event.submissionSubmitted	0
146	1048585	12	3	2021-11-14 22:41:30	805306371	log.editor.decision	0
147	1048585	12	3	2021-11-14 22:41:43	1073741825	log.review.reviewerAssigned	0
148	1048585	12	3	2021-11-14 22:41:52	1073741825	log.review.reviewerAssigned	0
149	1048585	12	3	2021-11-14 22:42:00	1073741825	log.review.reviewerAssigned	0
150	1048585	12	8	2021-11-14 22:42:10	1073741830	log.review.reviewAccepted	0
151	1048585	12	8	2021-11-14 22:42:15	1073741848	log.review.reviewReady	0
152	1048585	13	30	2021-11-14 22:42:24	268435458	submission.event.general.metadataUpdated	0
153	515	56	30	2021-11-14 22:42:30	1342177281	submission.event.fileUploaded	0
154	1048585	13	30	2021-11-14 22:42:32	1342177281	submission.event.fileUploaded	0
155	515	57	30	2021-11-14 22:42:39	1342177281	submission.event.fileUploaded	0
156	1048585	13	30	2021-11-14 22:42:41	1342177281	submission.event.fileUploaded	0
157	515	58	30	2021-11-14 22:42:48	1342177281	submission.event.fileUploaded	0
158	1048585	13	30	2021-11-14 22:42:50	1342177281	submission.event.fileUploaded	0
159	1048585	13	30	2021-11-14 22:43:33	268435458	submission.event.general.metadataUpdated	0
160	1048585	13	30	2021-11-14 22:43:35	268435457	submission.event.submissionSubmitted	0
161	1048585	13	3	2021-11-14 22:43:49	805306371	log.editor.decision	0
162	1048585	13	3	2021-11-14 22:44:00	1073741825	log.review.reviewerAssigned	0
163	1048585	13	3	2021-11-14 22:44:04	805306371	log.editor.decision	0
164	1048585	13	3	2021-11-14 22:44:17	1073741825	log.review.reviewerAssigned	0
165	1048585	13	3	2021-11-14 22:44:26	1073741825	log.review.reviewerAssigned	0
166	1048585	13	3	2021-11-14 22:44:34	1073741825	log.review.reviewerAssigned	0
167	1048585	13	10	2021-11-14 22:44:44	1073741830	log.review.reviewAccepted	0
168	1048585	13	10	2021-11-14 22:44:49	1073741848	log.review.reviewReady	0
169	1048585	13	12	2021-11-14 22:45:00	1073741830	log.review.reviewAccepted	0
170	1048585	13	12	2021-11-14 22:45:05	1073741848	log.review.reviewReady	0
171	1048585	13	3	2021-11-14 22:45:25	805306371	log.editor.decision	0
172	1048585	14	31	2021-11-14 22:45:40	268435458	submission.event.general.metadataUpdated	0
173	515	62	31	2021-11-14 22:45:46	1342177281	submission.event.fileUploaded	0
174	1048585	14	31	2021-11-14 22:45:48	1342177281	submission.event.fileUploaded	0
175	515	63	31	2021-11-14 22:45:55	1342177281	submission.event.fileUploaded	0
176	1048585	14	31	2021-11-14 22:45:57	1342177281	submission.event.fileUploaded	0
177	515	64	31	2021-11-14 22:46:04	1342177281	submission.event.fileUploaded	0
178	1048585	14	31	2021-11-14 22:46:07	1342177281	submission.event.fileUploaded	0
179	515	65	31	2021-11-14 22:46:13	1342177281	submission.event.fileUploaded	0
180	1048585	14	31	2021-11-14 22:46:16	1342177281	submission.event.fileUploaded	0
181	515	66	31	2021-11-14 22:46:23	1342177281	submission.event.fileUploaded	0
182	1048585	14	31	2021-11-14 22:46:28	1342177281	submission.event.fileUploaded	0
183	515	67	31	2021-11-14 22:46:35	1342177281	submission.event.fileUploaded	0
184	1048585	14	31	2021-11-14 22:46:46	1342177281	submission.event.fileUploaded	0
185	1048585	14	31	2021-11-14 22:47:43	268435458	submission.event.general.metadataUpdated	0
186	1048585	14	31	2021-11-14 22:47:46	268435457	submission.event.submissionSubmitted	0
187	1048585	14	3	2021-11-14 22:48:01	805306371	log.editor.decision	0
188	1048585	14	3	2021-11-14 22:48:15	1073741825	log.review.reviewerAssigned	0
189	1048585	14	3	2021-11-14 22:48:20	805306371	log.editor.decision	0
190	1048585	14	3	2021-11-14 22:48:35	1073741825	log.review.reviewerAssigned	0
191	1048585	14	3	2021-11-14 22:48:40	805306371	log.editor.decision	0
192	1048585	14	3	2021-11-14 22:48:52	268435459	submission.event.participantAdded	0
193	1048585	14	3	2021-11-14 22:48:58	805306371	log.editor.decision	0
194	1048585	14	3	2021-11-14 22:49:11	268435459	submission.event.participantAdded	0
195	1048585	14	3	2021-11-14 22:49:20	268435459	submission.event.participantAdded	0
196	1048585	14	3	2021-11-14 22:49:29	268435474	submission.event.publicationFormatCreated	0
197	1048585	14	3	2021-11-14 22:49:44	268435464	submission.event.publicationFormatPublished	0
198	1048585	14	3	2021-11-14 22:49:48	268435476	submission.event.publicationFormatMadeAvailable	0
199	515	74	3	2021-11-14 22:49:53	1342177287	submission.event.signoffSignoff	0
200	515	75	3	2021-11-14 22:50:01	1342177287	submission.event.signoffSignoff	0
201	515	76	3	2021-11-14 22:50:11	1342177287	submission.event.signoffSignoff	0
202	515	77	3	2021-11-14 22:50:20	1342177287	submission.event.signoffSignoff	0
203	515	78	3	2021-11-14 22:50:30	1342177287	submission.event.signoffSignoff	0
204	515	79	3	2021-11-14 22:50:40	1342177287	submission.event.signoffSignoff	0
205	1048585	14	3	2021-11-14 22:50:50	268435462	publication.event.published	0
206	1048585	15	32	2021-11-14 22:50:59	268435458	submission.event.general.metadataUpdated	0
207	515	80	32	2021-11-14 22:51:05	1342177281	submission.event.fileUploaded	0
208	1048585	15	32	2021-11-14 22:51:07	1342177281	submission.event.fileUploaded	0
209	1048585	15	32	2021-11-14 22:51:24	268435458	submission.event.general.metadataUpdated	0
210	1048585	15	32	2021-11-14 22:51:25	268435457	submission.event.submissionSubmitted	0
211	1048585	15	3	2021-11-14 22:51:36	805306371	log.editor.decision	0
212	1048585	16	33	2021-11-14 22:51:47	268435458	submission.event.general.metadataUpdated	0
213	515	82	33	2021-11-14 22:51:52	1342177281	submission.event.fileUploaded	0
214	1048585	16	33	2021-11-14 22:51:55	1342177281	submission.event.fileUploaded	0
215	1048585	16	33	2021-11-14 22:52:21	268435458	submission.event.general.metadataUpdated	0
216	1048585	16	33	2021-11-14 22:52:22	268435457	submission.event.submissionSubmitted	0
217	1048585	16	3	2021-11-14 22:52:34	805306371	log.editor.decision	0
218	1048585	16	3	2021-11-14 22:52:44	1073741825	log.review.reviewerAssigned	0
219	1048585	16	3	2021-11-14 22:52:50	1073741825	log.review.reviewerAssigned	0
220	1048585	16	3	2021-11-14 22:52:56	1073741825	log.review.reviewerAssigned	0
221	1048585	16	10	2021-11-14 22:53:04	1073741830	log.review.reviewAccepted	0
222	1048585	16	10	2021-11-14 22:53:09	1073741848	log.review.reviewReady	0
223	1048585	17	34	2021-11-14 22:53:18	268435458	submission.event.general.metadataUpdated	0
224	515	83	34	2021-11-14 22:53:23	1342177281	submission.event.fileUploaded	0
225	1048585	17	34	2021-11-14 22:53:26	1342177281	submission.event.fileUploaded	0
226	515	84	34	2021-11-14 22:53:33	1342177281	submission.event.fileUploaded	0
227	1048585	17	34	2021-11-14 22:53:35	1342177281	submission.event.fileUploaded	0
228	515	85	34	2021-11-14 22:53:42	1342177281	submission.event.fileUploaded	0
229	1048585	17	34	2021-11-14 22:53:44	1342177281	submission.event.fileUploaded	0
230	515	86	34	2021-11-14 22:53:51	1342177281	submission.event.fileUploaded	0
231	1048585	17	34	2021-11-14 22:53:54	1342177281	submission.event.fileUploaded	0
232	515	87	34	2021-11-14 22:54:01	1342177281	submission.event.fileUploaded	0
233	1048585	17	34	2021-11-14 22:54:04	1342177281	submission.event.fileUploaded	0
234	515	88	34	2021-11-14 22:54:11	1342177281	submission.event.fileUploaded	0
235	1048585	17	34	2021-11-14 22:54:14	1342177281	submission.event.fileUploaded	0
236	1048585	17	34	2021-11-14 22:56:15	268435458	submission.event.general.metadataUpdated	0
237	1048585	17	34	2021-11-14 22:56:18	268435457	submission.event.submissionSubmitted	0
238	1048585	17	3	2021-11-14 22:56:38	805306371	log.editor.decision	0
239	1048585	17	3	2021-11-14 22:56:54	1073741825	log.review.reviewerAssigned	0
240	1048585	17	3	2021-11-14 22:57:04	1073741825	log.review.reviewerAssigned	0
\.


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
2	fileStage	2	int
2	revisedFileId	\N	string
2	fileId	1	string
2	fileRevision	1	int
2	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
2	submissionId	1	int
2	username	aclark	string
3	fileStage	2	int
3	fileId	1	int
3	fileRevision	1	int
3	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
3	submissionId	1	int
3	username	aclark	string
3	name	aclark, The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
6	editorName	Daniel Barnes	string
6	submissionId	1	int
6	decision	Send to External Review	string
7	reviewAssignmentId	1	string
7	reviewerName	Gonzalo Favio	string
7	submissionId	1	int
7	stageId	3	int
7	round	1	int
8	editorName	Daniel Barnes	string
8	submissionId	1	int
8	decision	Accept Submission	string
9	name	Sarah Vogt	string
9	username	svogt	string
9	userGroupName	Copyeditor	string
11	fileStage	2	int
11	revisedFileId	\N	string
11	fileId	2	string
11	fileRevision	1	int
11	originalFileName	Critical History in Western Canada 1900–.pdf	string
11	submissionId	2	int
11	username	afinkel	string
12	fileStage	2	int
12	fileId	2	int
12	fileRevision	1	int
12	originalFileName	Critical History in Western Canada 1900–.pdf	string
12	submissionId	2	int
12	username	afinkel	string
12	name	afinkel, Critical History in Western Canada 1900–.pdf	string
13	fileStage	2	int
13	revisedFileId	\N	string
13	fileId	3	string
13	fileRevision	1	int
13	originalFileName	Vernacular Currents in Western Canadian .pdf	string
13	submissionId	2	int
13	username	afinkel	string
14	fileStage	2	int
14	fileId	3	int
14	fileRevision	1	int
14	originalFileName	Vernacular Currents in Western Canadian .pdf	string
14	submissionId	2	int
14	username	afinkel	string
14	name	afinkel, Vernacular Currents in Western Canadian .pdf	string
15	fileStage	2	int
15	revisedFileId	\N	string
15	fileId	4	string
15	fileRevision	1	int
15	originalFileName	Cree Intellectual Traditions in History.pdf	string
15	submissionId	2	int
15	username	afinkel	string
16	fileStage	2	int
16	fileId	4	int
16	fileRevision	1	int
16	originalFileName	Cree Intellectual Traditions in History.pdf	string
16	submissionId	2	int
16	username	afinkel	string
16	name	afinkel, Cree Intellectual Traditions in History.pdf	string
17	fileStage	2	int
17	revisedFileId	\N	string
17	fileId	5	string
17	fileRevision	1	int
17	originalFileName	Visualizing Space, Race, and History in .pdf	string
17	submissionId	2	int
17	username	afinkel	string
18	fileStage	2	int
18	fileId	5	int
18	fileRevision	1	int
18	originalFileName	Visualizing Space, Race, and History in .pdf	string
18	submissionId	2	int
18	username	afinkel	string
18	name	afinkel, Visualizing Space, Race, and History in .pdf	string
21	editorName	Daniel Barnes	string
21	submissionId	2	int
21	decision	Send to External Review	string
22	reviewAssignmentId	2	string
22	reviewerName	Al Zacharia	string
22	submissionId	2	int
22	stageId	3	int
22	round	1	int
23	reviewAssignmentId	3	string
23	reviewerName	Gonzalo Favio	string
23	submissionId	2	int
23	stageId	3	int
23	round	1	int
25	fileStage	2	int
25	revisedFileId	\N	string
25	fileId	10	string
25	fileRevision	1	int
25	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
25	submissionId	3	int
25	username	bbarnetson	string
26	fileStage	2	int
26	fileId	10	int
26	fileRevision	1	int
26	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
26	submissionId	3	int
26	username	bbarnetson	string
26	name	bbarnetson, The Political Economy of Workplace Injury in Canada.pdf	string
30	fileStage	2	int
30	revisedFileId	\N	string
30	fileId	11	string
30	fileRevision	1	int
30	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
30	submissionId	4	int
30	username	bbeaty	string
31	fileStage	2	int
31	fileId	11	int
31	fileRevision	1	int
31	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
31	submissionId	4	int
31	username	bbeaty	string
31	name	bbeaty, Introduction: Contexts of Popular Cultur.pdf	string
32	fileStage	2	int
32	revisedFileId	\N	string
32	fileId	12	string
32	fileRevision	1	int
32	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
32	submissionId	4	int
32	username	bbeaty	string
33	fileStage	2	int
33	fileId	12	int
33	fileRevision	1	int
33	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
33	submissionId	4	int
33	username	bbeaty	string
33	name	bbeaty, Chapter 1. A Future for Media Studies: C.pdf	string
34	fileStage	2	int
34	revisedFileId	\N	string
34	fileId	13	string
34	fileRevision	1	int
34	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
34	submissionId	4	int
34	username	bbeaty	string
35	fileStage	2	int
35	fileId	13	int
35	fileRevision	1	int
35	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
35	submissionId	4	int
35	username	bbeaty	string
35	name	bbeaty, Chapter 2. Log On, Goof Off, and Look Up.pdf	string
36	fileStage	2	int
36	revisedFileId	\N	string
36	fileId	14	string
36	fileRevision	1	int
36	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
36	submissionId	4	int
36	username	bbeaty	string
37	fileStage	2	int
37	fileId	14	int
37	fileRevision	1	int
37	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
37	submissionId	4	int
37	username	bbeaty	string
37	name	bbeaty, Chapter 3. Hawkers and Public Space: Fre.pdf	string
40	editorName	Daniel Barnes	string
40	submissionId	4	int
40	decision	Send to Internal Review	string
41	reviewAssignmentId	4	string
41	reviewerName	Aisla McCrae	string
41	submissionId	4	int
41	stageId	2	int
41	round	1	int
42	editorName	Daniel Barnes	string
42	submissionId	4	int
42	decision	Send to External Review	string
43	reviewAssignmentId	5	string
43	reviewerName	Al Zacharia	string
43	submissionId	4	int
43	stageId	3	int
43	round	1	int
44	editorName	Daniel Barnes	string
44	submissionId	4	int
44	decision	Accept Submission	string
45	name	Maria Fritz	string
45	username	mfritz	string
45	userGroupName	Copyeditor	string
46	editorName	Daniel Barnes	string
46	submissionId	4	int
46	decision	Send To Production	string
47	name	Graham Cox	string
47	username	gcox	string
47	userGroupName	Layout Editor	string
49	fileStage	2	int
49	revisedFileId	\N	string
49	fileId	19	string
49	fileRevision	1	int
49	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
49	submissionId	5	int
49	username	callan	string
50	fileStage	2	int
50	fileId	19	int
50	fileRevision	1	int
50	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
50	submissionId	5	int
50	username	callan	string
50	name	callan, Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
53	editorName	Daniel Barnes	string
53	submissionId	5	int
53	decision	Send to Internal Review	string
54	reviewAssignmentId	6	string
54	reviewerName	Paul Hudson	string
54	submissionId	5	int
54	stageId	2	int
54	round	1	int
55	editorName	Daniel Barnes	string
55	submissionId	5	int
55	decision	Send to External Review	string
56	reviewAssignmentId	7	string
56	reviewerName	Gonzalo Favio	string
56	submissionId	5	int
56	stageId	3	int
56	round	1	int
57	editorName	Daniel Barnes	string
57	submissionId	5	int
57	decision	Accept Submission	string
58	name	Sarah Vogt	string
58	username	svogt	string
58	userGroupName	Copyeditor	string
59	editorName	Daniel Barnes	string
59	submissionId	5	int
59	decision	Send To Production	string
60	name	Stephen Hellier	string
60	username	shellier	string
60	userGroupName	Layout Editor	string
61	name	Catherine Turner	string
61	username	cturner	string
61	userGroupName	Proofreader	string
62	formatName	PDF	string
63	publicationFormatName	PDF	string
64	publicationFormatName	PDF	string
65	file	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
65	name	Daniel Barnes	string
65	username	dbarnes	string
68	fileStage	2	int
68	revisedFileId	\N	string
68	fileId	21	string
68	fileRevision	1	int
68	originalFileName	Identify: Understanding Your Information.pdf	string
68	submissionId	6	int
68	username	dbernnard	string
69	fileStage	2	int
69	fileId	21	int
69	fileRevision	1	int
69	originalFileName	Identify: Understanding Your Information.pdf	string
69	submissionId	6	int
69	username	dbernnard	string
69	name	dbernnard, Identify: Understanding Your Information.pdf	string
70	fileStage	2	int
70	revisedFileId	\N	string
70	fileId	22	string
70	fileRevision	1	int
70	originalFileName	Scope: Knowing What Is Available.pdf	string
70	submissionId	6	int
70	username	dbernnard	string
71	fileStage	2	int
71	fileId	22	int
71	fileRevision	1	int
71	originalFileName	Scope: Knowing What Is Available.pdf	string
71	submissionId	6	int
71	username	dbernnard	string
71	name	dbernnard, Scope: Knowing What Is Available.pdf	string
72	fileStage	2	int
72	revisedFileId	\N	string
72	fileId	23	string
72	fileRevision	1	int
72	originalFileName	Plan: Developing Research Strategies.pdf	string
72	submissionId	6	int
72	username	dbernnard	string
73	fileStage	2	int
73	fileId	23	int
73	fileRevision	1	int
73	originalFileName	Plan: Developing Research Strategies.pdf	string
73	submissionId	6	int
73	username	dbernnard	string
73	name	dbernnard, Plan: Developing Research Strategies.pdf	string
74	fileStage	2	int
74	revisedFileId	\N	string
74	fileId	24	string
74	fileRevision	1	int
74	originalFileName	Gather: Finding What You Need.pdf	string
74	submissionId	6	int
74	username	dbernnard	string
75	fileStage	2	int
75	fileId	24	int
75	fileRevision	1	int
75	originalFileName	Gather: Finding What You Need.pdf	string
75	submissionId	6	int
75	username	dbernnard	string
75	name	dbernnard, Gather: Finding What You Need.pdf	string
78	editorName	Daniel Barnes	string
78	submissionId	6	int
78	decision	Send to Internal Review	string
79	name	Minoti Inoue	string
79	username	minoue	string
79	userGroupName	Series editor	string
80	editorName	Minoti Inoue	string
80	submissionId	6	int
80	decision	Send to External Review	string
82	fileStage	2	int
82	revisedFileId	\N	string
82	fileId	29	string
82	fileRevision	1	int
82	originalFileName	Introduction.pdf	string
82	submissionId	7	int
82	username	dkennepohl	string
83	fileStage	2	int
83	fileId	29	int
83	fileRevision	1	int
83	originalFileName	Introduction.pdf	string
83	submissionId	7	int
83	username	dkennepohl	string
83	name	dkennepohl, Introduction.pdf	string
84	fileStage	2	int
84	revisedFileId	\N	string
84	fileId	30	string
84	fileRevision	1	int
84	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
84	submissionId	7	int
84	username	dkennepohl	string
85	fileStage	2	int
85	fileId	30	int
85	fileRevision	1	int
85	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
85	submissionId	7	int
85	username	dkennepohl	string
85	name	dkennepohl, Chapter 1: Interactions Affording Distan.pdf	string
86	fileStage	2	int
86	revisedFileId	\N	string
86	fileId	31	string
86	fileRevision	1	int
86	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
86	submissionId	7	int
86	username	dkennepohl	string
87	fileStage	2	int
87	fileId	31	int
87	fileRevision	1	int
87	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
87	submissionId	7	int
87	username	dkennepohl	string
87	name	dkennepohl, Chapter 2: Learning Science at a Distanc.pdf	string
88	fileStage	2	int
88	revisedFileId	\N	string
88	fileId	32	string
88	fileRevision	1	int
88	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
88	submissionId	7	int
88	username	dkennepohl	string
89	fileStage	2	int
89	fileId	32	int
89	fileRevision	1	int
89	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
89	submissionId	7	int
89	username	dkennepohl	string
89	name	dkennepohl, Chapter 3: Leadership Strategies for Coo.pdf	string
90	fileStage	2	int
90	revisedFileId	\N	string
90	fileId	33	string
90	fileRevision	1	int
90	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
90	submissionId	7	int
90	username	dkennepohl	string
91	fileStage	2	int
91	fileId	33	int
91	fileRevision	1	int
91	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
91	submissionId	7	int
91	username	dkennepohl	string
91	name	dkennepohl, Chapter 4: Toward New Models of Flexible.pdf	string
94	editorName	Daniel Barnes	string
94	submissionId	7	int
94	decision	Send to External Review	string
95	reviewAssignmentId	8	string
95	reviewerName	Adela Gallego	string
95	submissionId	7	int
95	stageId	3	int
95	round	1	int
96	editorName	Daniel Barnes	string
96	submissionId	7	int
96	decision	Accept Submission	string
97	name	Maria Fritz	string
97	username	mfritz	string
97	userGroupName	Copyeditor	string
99	fileStage	2	int
99	revisedFileId	\N	string
99	fileId	39	string
99	fileRevision	1	int
99	originalFileName	Editorial.pdf	string
99	submissionId	8	int
99	username	dbarnes	string
100	fileStage	2	int
100	fileId	39	int
100	fileRevision	1	int
100	originalFileName	Editorial.pdf	string
100	submissionId	8	int
100	username	dbarnes	string
100	name	dbarnes, Editorial.pdf	string
104	fileStage	2	int
104	revisedFileId	\N	string
104	fileId	40	string
104	fileRevision	1	int
104	originalFileName	Internet, openness and the future of the.pdf	string
104	submissionId	9	int
104	username	fperini	string
105	fileStage	2	int
105	fileId	40	int
105	fileRevision	1	int
105	originalFileName	Internet, openness and the future of the.pdf	string
105	submissionId	9	int
105	username	fperini	string
105	name	fperini, Internet, openness and the future of the.pdf	string
106	fileStage	2	int
106	revisedFileId	\N	string
106	fileId	41	string
106	fileRevision	1	int
106	originalFileName	Imagining the Internet: Open, closed or .pdf	string
106	submissionId	9	int
106	username	fperini	string
107	fileStage	2	int
107	fileId	41	int
107	fileRevision	1	int
107	originalFileName	Imagining the Internet: Open, closed or .pdf	string
107	submissionId	9	int
107	username	fperini	string
107	name	fperini, Imagining the Internet: Open, closed or .pdf	string
108	fileStage	2	int
108	revisedFileId	\N	string
108	fileId	42	string
108	fileRevision	1	int
108	originalFileName	The internet in LAC will remain free, pu.pdf	string
108	submissionId	9	int
108	username	fperini	string
109	fileStage	2	int
109	fileId	42	int
109	fileRevision	1	int
109	originalFileName	The internet in LAC will remain free, pu.pdf	string
109	submissionId	9	int
109	username	fperini	string
109	name	fperini, The internet in LAC will remain free, pu.pdf	string
110	fileStage	2	int
110	revisedFileId	\N	string
110	fileId	43	string
110	fileRevision	1	int
110	originalFileName	Free Internet?.pdf	string
110	submissionId	9	int
110	username	fperini	string
111	fileStage	2	int
111	fileId	43	int
111	fileRevision	1	int
111	originalFileName	Free Internet?.pdf	string
111	submissionId	9	int
111	username	fperini	string
111	name	fperini, Free Internet?.pdf	string
112	fileStage	2	int
112	revisedFileId	\N	string
112	fileId	44	string
112	fileRevision	1	int
112	originalFileName	Risks and challenges for freedom of expr.pdf	string
112	submissionId	9	int
112	username	fperini	string
113	fileStage	2	int
113	fileId	44	int
113	fileRevision	1	int
113	originalFileName	Risks and challenges for freedom of expr.pdf	string
113	submissionId	9	int
113	username	fperini	string
113	name	fperini, Risks and challenges for freedom of expr.pdf	string
116	editorName	Daniel Barnes	string
116	submissionId	9	int
116	decision	Send to Internal Review	string
118	fileStage	2	int
118	revisedFileId	\N	string
118	fileId	50	string
118	fileRevision	1	int
118	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
118	submissionId	10	int
118	username	jbrower	string
119	fileStage	2	int
119	fileId	50	int
119	fileRevision	1	int
119	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
119	submissionId	10	int
119	username	jbrower	string
119	name	jbrower, Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
123	fileStage	2	int
123	revisedFileId	\N	string
123	fileId	51	string
123	fileRevision	1	int
123	originalFileName	Dreamwork.pdf	string
123	submissionId	11	int
123	username	jlockehart	string
124	fileStage	2	int
124	fileId	51	int
124	fileRevision	1	int
124	originalFileName	Dreamwork.pdf	string
124	submissionId	11	int
124	username	jlockehart	string
124	name	jlockehart, Dreamwork.pdf	string
127	editorName	Daniel Barnes	string
127	submissionId	11	int
127	decision	Send to Internal Review	string
128	reviewAssignmentId	9	string
128	reviewerName	Aisla McCrae	string
128	submissionId	11	int
128	stageId	2	int
128	round	1	int
129	editorName	Daniel Barnes	string
129	submissionId	11	int
129	decision	Send to External Review	string
130	reviewAssignmentId	10	string
130	reviewerName	Adela Gallego	string
130	submissionId	11	int
130	stageId	3	int
130	round	1	int
131	reviewAssignmentId	11	string
131	reviewerName	Gonzalo Favio	string
131	submissionId	11	int
131	stageId	3	int
131	round	1	int
132	reviewAssignmentId	10	int
132	reviewerName	Adela Gallego	string
132	submissionId	11	int
132	round	1	int
133	reviewAssignmentId	10	int
133	reviewerName	Adela Gallego	string
133	submissionId	11	int
133	round	1	int
134	reviewAssignmentId	11	int
134	reviewerName	Gonzalo Favio	string
134	submissionId	11	int
134	round	1	int
135	reviewAssignmentId	11	int
135	reviewerName	Gonzalo Favio	string
135	submissionId	11	int
135	round	1	int
136	editorName	Daniel Barnes	string
136	submissionId	11	int
136	decision	Accept Submission	string
138	fileStage	2	int
138	revisedFileId	\N	string
138	fileId	53	string
138	fileRevision	1	int
138	originalFileName	Catalyzing Access through Social and Tec.pdf	string
138	submissionId	12	int
138	username	lelder	string
139	fileStage	2	int
139	fileId	53	int
139	fileRevision	1	int
139	originalFileName	Catalyzing Access through Social and Tec.pdf	string
139	submissionId	12	int
139	username	lelder	string
139	name	lelder, Catalyzing Access through Social and Tec.pdf	string
140	fileStage	2	int
140	revisedFileId	\N	string
140	fileId	54	string
140	fileRevision	1	int
140	originalFileName	Catalyzing Access via Telecommunications.pdf	string
140	submissionId	12	int
140	username	lelder	string
141	fileStage	2	int
141	fileId	54	int
141	fileRevision	1	int
141	originalFileName	Catalyzing Access via Telecommunications.pdf	string
141	submissionId	12	int
141	username	lelder	string
141	name	lelder, Catalyzing Access via Telecommunications.pdf	string
142	fileStage	2	int
142	revisedFileId	\N	string
142	fileId	55	string
142	fileRevision	1	int
142	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
142	submissionId	12	int
142	username	lelder	string
143	fileStage	2	int
143	fileId	55	int
143	fileRevision	1	int
143	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
143	submissionId	12	int
143	username	lelder	string
143	name	lelder, Access to Knowledge as a New Paradigm fo.pdf	string
146	editorName	Daniel Barnes	string
146	submissionId	12	int
146	decision	Send to Internal Review	string
147	reviewAssignmentId	12	string
147	reviewerName	Julie Janssen	string
147	submissionId	12	int
147	stageId	2	int
147	round	1	int
148	reviewAssignmentId	13	string
148	reviewerName	Paul Hudson	string
148	submissionId	12	int
148	stageId	2	int
148	round	1	int
149	reviewAssignmentId	14	string
149	reviewerName	Aisla McCrae	string
149	submissionId	12	int
149	stageId	2	int
149	round	1	int
150	reviewAssignmentId	13	int
150	reviewerName	Paul Hudson	string
150	submissionId	12	int
150	round	1	int
151	reviewAssignmentId	13	int
151	reviewerName	Paul Hudson	string
151	submissionId	12	int
151	round	1	int
153	fileStage	2	int
153	revisedFileId	\N	string
153	fileId	56	string
153	fileRevision	1	int
153	originalFileName	Current State of Mobile Learning.pdf	string
153	submissionId	13	int
153	username	mally	string
154	fileStage	2	int
154	fileId	56	int
154	fileRevision	1	int
154	originalFileName	Current State of Mobile Learning.pdf	string
154	submissionId	13	int
154	username	mally	string
154	name	mally, Current State of Mobile Learning.pdf	string
155	fileStage	2	int
155	revisedFileId	\N	string
155	fileId	57	string
155	fileRevision	1	int
155	originalFileName	A Model for Framing Mobile Learning.pdf	string
155	submissionId	13	int
155	username	mally	string
156	fileStage	2	int
156	fileId	57	int
156	fileRevision	1	int
156	originalFileName	A Model for Framing Mobile Learning.pdf	string
156	submissionId	13	int
156	username	mally	string
156	name	mally, A Model for Framing Mobile Learning.pdf	string
157	fileStage	2	int
157	revisedFileId	\N	string
157	fileId	58	string
157	fileRevision	1	int
157	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
157	submissionId	13	int
157	username	mally	string
158	fileStage	2	int
158	fileId	58	int
158	fileRevision	1	int
158	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
158	submissionId	13	int
158	username	mally	string
158	name	mally, Mobile Distance Learning with PDAs: Deve.pdf	string
161	editorName	Daniel Barnes	string
161	submissionId	13	int
161	decision	Send to Internal Review	string
162	reviewAssignmentId	15	string
162	reviewerName	Paul Hudson	string
162	submissionId	13	int
162	stageId	2	int
162	round	1	int
163	editorName	Daniel Barnes	string
163	submissionId	13	int
163	decision	Send to External Review	string
164	reviewAssignmentId	16	string
164	reviewerName	Adela Gallego	string
164	submissionId	13	int
164	stageId	3	int
164	round	1	int
165	reviewAssignmentId	17	string
165	reviewerName	Al Zacharia	string
165	submissionId	13	int
165	stageId	3	int
165	round	1	int
166	reviewAssignmentId	18	string
166	reviewerName	Gonzalo Favio	string
166	submissionId	13	int
166	stageId	3	int
166	round	1	int
167	reviewAssignmentId	16	int
167	reviewerName	Adela Gallego	string
167	submissionId	13	int
167	round	1	int
168	reviewAssignmentId	16	int
168	reviewerName	Adela Gallego	string
168	submissionId	13	int
168	round	1	int
169	reviewAssignmentId	18	int
169	reviewerName	Gonzalo Favio	string
169	submissionId	13	int
169	round	1	int
170	reviewAssignmentId	18	int
170	reviewerName	Gonzalo Favio	string
170	submissionId	13	int
170	round	1	int
171	editorName	Daniel Barnes	string
171	submissionId	13	int
171	decision	Accept Submission	string
173	fileStage	2	int
173	revisedFileId	\N	string
173	fileId	62	string
173	fileRevision	1	int
173	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
173	submissionId	14	int
173	username	mdawson	string
174	fileStage	2	int
174	fileId	62	int
174	fileRevision	1	int
174	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
174	submissionId	14	int
174	username	mdawson	string
174	name	mdawson, Chapter 1: Mind Control—Internal or Exte.pdf	string
175	fileStage	2	int
175	revisedFileId	\N	string
175	fileId	63	string
175	fileRevision	1	int
175	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
175	submissionId	14	int
175	username	mdawson	string
176	fileStage	2	int
176	fileId	63	int
176	fileRevision	1	int
176	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
176	submissionId	14	int
176	username	mdawson	string
176	name	mdawson, Chapter 2: Classical Music and the Class.pdf	string
177	fileStage	2	int
177	revisedFileId	\N	string
177	fileId	64	string
177	fileRevision	1	int
177	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
177	submissionId	14	int
177	username	mdawson	string
178	fileStage	2	int
178	fileId	64	int
178	fileRevision	1	int
178	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
178	submissionId	14	int
178	username	mdawson	string
178	name	mdawson, Chapter 3: Situated Cognition and Bricol.pdf	string
179	fileStage	2	int
179	revisedFileId	\N	string
179	fileId	65	string
179	fileRevision	1	int
179	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
179	submissionId	14	int
179	username	mdawson	string
180	fileStage	2	int
180	fileId	65	int
180	fileRevision	1	int
180	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
180	submissionId	14	int
180	username	mdawson	string
180	name	mdawson, Chapter 4: Braitenberg’s Vehicle 2.pdf	string
181	fileStage	2	int
181	revisedFileId	\N	string
181	fileId	66	string
181	fileRevision	1	int
181	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
181	submissionId	14	int
181	username	mdawson	string
182	fileStage	2	int
182	fileId	66	int
182	fileRevision	1	int
182	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
182	submissionId	14	int
182	username	mdawson	string
182	name	mdawson, Segmentation of Vascular Ultrasound Imag.pdf	string
183	fileStage	2	int
183	revisedFileId	\N	string
183	fileId	67	string
183	fileRevision	1	int
183	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
183	submissionId	14	int
183	username	mdawson	string
184	fileStage	2	int
184	fileId	67	int
184	fileRevision	1	int
184	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
184	submissionId	14	int
184	username	mdawson	string
184	name	mdawson, The Canadian Nutrient File: Nutrient Val.pdf	string
187	editorName	Daniel Barnes	string
187	submissionId	14	int
187	decision	Send to Internal Review	string
188	reviewAssignmentId	19	string
188	reviewerName	Julie Janssen	string
188	submissionId	14	int
188	stageId	2	int
188	round	1	int
189	editorName	Daniel Barnes	string
189	submissionId	14	int
189	decision	Send to External Review	string
190	reviewAssignmentId	20	string
190	reviewerName	Al Zacharia	string
190	submissionId	14	int
190	stageId	3	int
190	round	1	int
191	editorName	Daniel Barnes	string
191	submissionId	14	int
191	decision	Accept Submission	string
192	name	Maria Fritz	string
192	username	mfritz	string
192	userGroupName	Copyeditor	string
193	editorName	Daniel Barnes	string
193	submissionId	14	int
193	decision	Send To Production	string
194	name	Graham Cox	string
194	username	gcox	string
194	userGroupName	Layout Editor	string
195	name	Sabine Kumar	string
195	username	skumar	string
195	userGroupName	Proofreader	string
196	formatName	PDF	string
197	publicationFormatName	PDF	string
198	publicationFormatName	PDF	string
199	file	Chapter 1: Mind Control—Internal or Exte.pdf	string
199	name	Daniel Barnes	string
199	username	dbarnes	string
200	file	Chapter 2: Classical Music and the Class.pdf	string
200	name	Daniel Barnes	string
200	username	dbarnes	string
201	file	Chapter 3: Situated Cognition and Bricol.pdf	string
201	name	Daniel Barnes	string
201	username	dbarnes	string
202	file	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
202	name	Daniel Barnes	string
202	username	dbarnes	string
203	file	Segmentation of Vascular Ultrasound Imag.pdf	string
203	name	Daniel Barnes	string
203	username	dbarnes	string
204	file	The Canadian Nutrient File: Nutrient Val.pdf	string
204	name	Daniel Barnes	string
204	username	dbarnes	string
207	fileStage	2	int
207	revisedFileId	\N	string
207	fileId	80	string
207	fileRevision	1	int
207	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
207	submissionId	15	int
207	username	mforan	string
208	fileStage	2	int
208	fileId	80	int
208	fileRevision	1	int
208	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
208	submissionId	15	int
208	username	mforan	string
208	name	mforan, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
211	editorName	Daniel Barnes	string
211	submissionId	15	int
211	decision	Send to External Review	string
213	fileStage	2	int
213	revisedFileId	\N	string
213	fileId	82	string
213	fileRevision	1	int
213	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
213	submissionId	16	int
213	username	mpower	string
214	fileStage	2	int
214	fileId	82	int
214	fileRevision	1	int
214	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
214	submissionId	16	int
214	username	mpower	string
214	name	mpower, A Designer's Log: Case Studies in Instructional Design.pdf	string
217	editorName	Daniel Barnes	string
217	submissionId	16	int
217	decision	Send to External Review	string
218	reviewAssignmentId	21	string
218	reviewerName	Adela Gallego	string
218	submissionId	16	int
218	stageId	3	int
218	round	1	int
219	reviewAssignmentId	22	string
219	reviewerName	Al Zacharia	string
219	submissionId	16	int
219	stageId	3	int
219	round	1	int
220	reviewAssignmentId	23	string
220	reviewerName	Gonzalo Favio	string
220	submissionId	16	int
220	stageId	3	int
220	round	1	int
221	reviewAssignmentId	21	int
221	reviewerName	Adela Gallego	string
221	submissionId	16	int
221	round	1	int
222	reviewAssignmentId	21	int
222	reviewerName	Adela Gallego	string
222	submissionId	16	int
222	round	1	int
224	fileStage	2	int
224	revisedFileId	\N	string
224	fileId	83	string
224	fileRevision	1	int
224	originalFileName	Preface.pdf	string
224	submissionId	17	int
224	username	msmith	string
225	fileStage	2	int
225	fileId	83	int
225	fileRevision	1	int
225	originalFileName	Preface.pdf	string
225	submissionId	17	int
225	username	msmith	string
225	name	msmith, Preface.pdf	string
226	fileStage	2	int
226	revisedFileId	\N	string
226	fileId	84	string
226	fileRevision	1	int
226	originalFileName	Introduction.pdf	string
226	submissionId	17	int
226	username	msmith	string
227	fileStage	2	int
227	fileId	84	int
227	fileRevision	1	int
227	originalFileName	Introduction.pdf	string
227	submissionId	17	int
227	username	msmith	string
227	name	msmith, Introduction.pdf	string
228	fileStage	2	int
228	revisedFileId	\N	string
228	fileId	85	string
228	fileRevision	1	int
228	originalFileName	The Emergence of Open Development in a N.pdf	string
228	submissionId	17	int
228	username	msmith	string
229	fileStage	2	int
229	fileId	85	int
229	fileRevision	1	int
229	originalFileName	The Emergence of Open Development in a N.pdf	string
229	submissionId	17	int
229	username	msmith	string
229	name	msmith, The Emergence of Open Development in a N.pdf	string
230	fileStage	2	int
230	revisedFileId	\N	string
230	fileId	86	string
230	fileRevision	1	int
230	originalFileName	Enacting Openness in ICT4D Research.pdf	string
230	submissionId	17	int
230	username	msmith	string
231	fileStage	2	int
231	fileId	86	int
231	fileRevision	1	int
231	originalFileName	Enacting Openness in ICT4D Research.pdf	string
231	submissionId	17	int
231	username	msmith	string
231	name	msmith, Enacting Openness in ICT4D Research.pdf	string
232	fileStage	2	int
232	revisedFileId	\N	string
232	fileId	87	string
232	fileRevision	1	int
232	originalFileName	Transparency and Development: Ethical Co.pdf	string
232	submissionId	17	int
232	username	msmith	string
233	fileStage	2	int
233	fileId	87	int
233	fileRevision	1	int
233	originalFileName	Transparency and Development: Ethical Co.pdf	string
233	submissionId	17	int
233	username	msmith	string
233	name	msmith, Transparency and Development: Ethical Co.pdf	string
234	fileStage	2	int
234	revisedFileId	\N	string
234	fileId	88	string
234	fileRevision	1	int
234	originalFileName	Open Educational Resources: Opportunitie.pdf	string
234	submissionId	17	int
234	username	msmith	string
235	fileStage	2	int
235	fileId	88	int
235	fileRevision	1	int
235	originalFileName	Open Educational Resources: Opportunitie.pdf	string
235	submissionId	17	int
235	username	msmith	string
235	name	msmith, Open Educational Resources: Opportunitie.pdf	string
238	editorName	Daniel Barnes	string
238	submissionId	17	int
238	decision	Send to Internal Review	string
239	reviewAssignmentId	24	string
239	reviewerName	Julie Janssen	string
239	submissionId	17	int
239	stageId	2	int
239	round	1	int
240	reviewAssignmentId	25	string
240	reviewerName	Paul Hudson	string
240	submissionId	17	int
240	stageId	2	int
240	round	1	int
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.features (submission_id, assoc_type, assoc_id, seq) FROM stdin;
\.


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	publicationFormat=>dc11	plugins.metadata.dc11.publicationFormatAdapter.displayName	plugins.metadata.dc11.publicationFormatAdapter.description	class::classes.publicationFormat.PublicationFormat	metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)
2	mods34=>mods34-xml	plugins.metadata.mods34.mods34XmlOutput.displayName	plugins.metadata.mods34.mods34XmlOutput.description	metadata::plugins.metadata.mods34.schema.Mods34Schema(*)	xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)
3	monograph=>mods34	plugins.metadata.mods34.monographAdapter.displayName	plugins.metadata.mods34.monographAdapter.description	class::classes.monograph.Monograph	metadata::plugins.metadata.mods34.schema.Mods34Schema(MONOGRAPH)
4	mods34=>monograph	plugins.metadata.mods34.monographAdapter.displayName	plugins.metadata.mods34.monographAdapter.description	metadata::plugins.metadata.mods34.schema.Mods34Schema(MONOGRAPH)	class::classes.monograph.Monograph
5	monograph=>onix30-xml	plugins.importexport.onix30.displayName	plugins.importexport.onix30.description	class::classes.monograph.Monograph	xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)
6	user=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.user.User[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
7	user-xml=>user	plugins.importexport.users.displayName	plugins.importexport.users.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::classes.users.User[]
8	usergroup=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.security.UserGroup[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
9	user-xml=>usergroup	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::lib.pkp.classes.security.UserGroup[]
10	monograph=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
11	native-xml=>monograph	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Monograph[]
12	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.monograph.Author[]	xml::schema(plugins/importexport/native/native.xsd)
13	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Author[]
14	publication-format=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publicationFormat.PublicationFormat	xml::schema(plugins/importexport/native/native.xsd)
15	native-xml=>PublicationFormat	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publicationFormat.PublicationFormat[]
16	SubmissionArtworkFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SubmissionArtworkFile	xml::schema(plugins/importexport/native/native.xsd)
17	SupplementaryFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SupplementaryFile	xml::schema(plugins/importexport/native/native.xsd)
18	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
19	native-xml=>SubmissionArtworkFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SubmissionArtworkFile
20	native-xml=>SupplementaryFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SupplementaryFile
21	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SubmissionFile
22	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
23	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication
24	chapter=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.monograph.Chapter[]	xml::schema(plugins/importexport/native/native.xsd)
25	native-xml=>chapter	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Chapter
\.


--
-- Data for Name: filter_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.filter_settings (filter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.filters (filter_id, filter_group_id, context_id, display_name, class_name, is_template, parent_filter_id, seq) FROM stdin;
1	1	0	Extract metadata from a(n) PublicationFormat	plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter	0	0	0
2	2	0	MODS 3.4	lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter	0	0	0
3	3	0	Extract metadata from a(n) Monograph	plugins.metadata.mods34.filter.Mods34SchemaMonographAdapter	0	0	0
4	4	0	Inject metadata into a(n) Monograph	plugins.metadata.mods34.filter.Mods34SchemaMonographAdapter	0	0	0
5	5	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
6	6	0	User XML user export	lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter	0	0	0
7	7	0	User XML user import	lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter	0	0	0
8	8	0	Native XML user group export	lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter	0	0	0
9	9	0	Native XML user group import	lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter	0	0	0
10	10	0	Native XML submission export	plugins.importexport.native.filter.MonographNativeXmlFilter	0	0	0
11	11	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlMonographFilter	0	0	0
12	12	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
13	13	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
14	14	0	Native XML representation export	plugins.importexport.native.filter.PublicationFormatNativeXmlFilter	0	0	0
15	15	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlPublicationFormatFilter	0	0	0
16	21	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlMonographFileFilter	0	0	0
17	19	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlArtworkFileFilter	0	0	0
18	20	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter	0	0	0
19	18	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
20	16	0	Native XML submission file export	plugins.importexport.native.filter.ArtworkFileNativeXmlFilter	0	0	0
21	17	0	Native XML submission file export	plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter	0	0	0
22	22	0	Native XML Publication export	plugins.importexport.native.filter.PublicationNativeXmlFilter	0	0	0
23	23	0	Native XML publication import	plugins.importexport.native.filter.NativeXmlPublicationFilter	0	0	0
24	24	0	Native XML chapter export	plugins.importexport.native.filter.ChapterNativeXmlFilter	0	0	0
25	25	0	Native XML Chapter import	plugins.importexport.native.filter.NativeXmlChapterFilter	0	0	0
\.


--
-- Data for Name: genre_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.genre_settings (genre_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Appendix	string
1	fr_CA	name	Annexe	string
2	en_US	name	Bibliography	string
2	fr_CA	name	Bibliographie	string
3	en_US	name	Book Manuscript	string
3	fr_CA	name	Manuscrit de livre	string
4	en_US	name	Chapter Manuscript	string
4	fr_CA	name	Manuscrit de chapitre	string
5	en_US	name	Glossary	string
5	fr_CA	name	Glossaire	string
6	en_US	name	Index	string
6	fr_CA	name	Index	string
7	en_US	name	Preface	string
7	fr_CA	name	Préface	string
8	en_US	name	Prospectus	string
8	fr_CA	name	Prospectus	string
9	en_US	name	Table	string
9	fr_CA	name	Tableau	string
10	en_US	name	Figure	string
10	fr_CA	name	Figure	string
11	en_US	name	Photo	string
11	fr_CA	name	Photo	string
12	en_US	name	Illustration	string
12	fr_CA	name	Illustration	string
14	en_US	name	Image	string
14	fr_CA	name	Image	string
15	en_US	name	HTML Stylesheet	string
15	fr_CA	name	Feuille de style HTML	string
13	en_US	name	Other	string
13	fr_CA	name	Autre	string
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.genres (genre_id, context_id, seq, enabled, category, dependent, supplementary, entry_key) FROM stdin;
1	1	0	1	1	0	1	APPENDIX
2	1	1	1	1	0	1	BIBLIOGRAPHY
3	1	2	1	1	0	0	MANUSCRIPT
4	1	3	1	1	0	0	CHAPTER
5	1	4	1	1	0	1	GLOSSARY
6	1	5	1	1	0	1	INDEX
7	1	6	1	1	0	1	PREFACE
8	1	7	1	3	0	1	PROSPECTUS
9	1	8	1	2	0	1	TABLE
10	1	9	1	2	0	1	FIGURE
11	1	10	1	2	0	1	PHOTO
12	1	11	1	2	0	1	ILLUSTRATION
14	1	13	1	2	1	0	IMAGE
15	1	14	1	1	1	0	STYLE
13	1	15	1	3	0	1	OTHER
\.


--
-- Data for Name: identification_codes; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.identification_codes (identification_code_id, publication_format_id, code, value) FROM stdin;
\.


--
-- Data for Name: item_views; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.item_views (assoc_type, assoc_id, user_id, date_last_viewed) FROM stdin;
\.


--
-- Data for Name: library_file_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.library_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: library_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.library_files (file_id, context_id, file_name, original_file_name, file_type, file_size, type, date_uploaded, date_modified, submission_id, public_access) FROM stdin;
\.


--
-- Data for Name: markets; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.markets (market_id, publication_format_id, countries_included, countries_excluded, regions_included, regions_excluded, market_date_role, market_date_format, market_date, price, discount, price_type_code, currency_code, tax_rate_code, tax_type_code, agent_id, supplier_id) FROM stdin;
\.


--
-- Data for Name: metadata_description_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metadata_description_settings (metadata_description_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: metadata_descriptions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metadata_descriptions (metadata_description_id, assoc_type, assoc_id, schema_namespace, schema_name, display_name, seq) FROM stdin;
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics (load_id, context_id, pkp_section_id, assoc_object_type, assoc_object_id, submission_id, representation_id, assoc_type, assoc_id, day, month, file_type, country_id, region, city, metric_type, metric) FROM stdin;
\.


--
-- Data for Name: navigation_menu_item_assignment_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.navigation_menu_item_assignment_settings (navigation_menu_item_assignment_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: navigation_menu_item_assignments; Type: TABLE DATA; Schema: public; Owner: omp-ci
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
-- Data for Name: navigation_menu_item_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
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
15		titleLocaleKey	navigation.catalog	string
16		titleLocaleKey	manager.announcements	string
17		titleLocaleKey	navigation.about	string
18		titleLocaleKey	about.aboutContext	string
19		titleLocaleKey	about.submissions	string
20		titleLocaleKey	about.editorialTeam	string
21		titleLocaleKey	manager.setup.privacyStatement	string
22		titleLocaleKey	about.contact	string
23		titleLocaleKey	common.search	string
\.


--
-- Data for Name: navigation_menu_items; Type: TABLE DATA; Schema: public; Owner: omp-ci
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
15	1	\N	\N	NMI_TYPE_CATALOG
16	1	\N	\N	NMI_TYPE_ANNOUNCEMENTS
17	1	\N	\N	NMI_TYPE_ABOUT
18	1	\N	\N	NMI_TYPE_ABOUT
19	1	\N	\N	NMI_TYPE_SUBMISSIONS
20	1	\N	\N	NMI_TYPE_EDITORIAL_TEAM
21	1	\N	\N	NMI_TYPE_PRIVACY
22	1	\N	\N	NMI_TYPE_CONTACT
23	1	\N	\N	NMI_TYPE_SEARCH
\.


--
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	0	user	User Navigation Menu
2	1	user	User Navigation Menu
3	1	primary	Primary Navigation Menu
\.


--
-- Data for Name: new_releases; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.new_releases (submission_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notes (note_id, assoc_type, assoc_id, user_id, date_created, date_modified, title, contents) FROM stdin;
1	1048586	1	6	2021-11-14 22:30:23	2021-11-14 22:30:23	Recommendation	<p>Daniel Barnes:<br><br>The recommendation regarding the submission to Public Knowledge Press, "The Information Literacy User’s Guide" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
\.


--
-- Data for Name: notification_mail_list; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notification_mail_list (notification_mail_list_id, email, confirmed, token, context) FROM stdin;
\.


--
-- Data for Name: notification_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notification_settings (notification_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: notification_subscription_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notification_subscription_settings (setting_id, setting_name, setting_value, user_id, context, setting_type) FROM stdin;
1	blocked_emailed_notification	8	19	1	int
2	blocked_emailed_notification	8	20	1	int
3	blocked_emailed_notification	8	21	1	int
4	blocked_emailed_notification	8	22	1	int
5	blocked_emailed_notification	8	23	1	int
6	blocked_emailed_notification	8	24	1	int
7	blocked_emailed_notification	8	25	1	int
8	blocked_emailed_notification	8	26	1	int
9	blocked_emailed_notification	8	27	1	int
10	blocked_emailed_notification	8	28	1	int
11	blocked_emailed_notification	8	29	1	int
12	blocked_emailed_notification	8	30	1	int
13	blocked_emailed_notification	8	31	1	int
14	blocked_emailed_notification	8	32	1	int
15	blocked_emailed_notification	8	33	1	int
16	blocked_emailed_notification	8	34	1	int
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notifications (notification_id, context_id, user_id, level, type, date_created, date_read, assoc_type, assoc_id) FROM stdin;
75	1	3	2	16777217	2021-11-14 22:24:20	\N	1048585	4
175	1	0	2	16777236	2021-11-14 22:33:05	2021-11-14 22:33:11	523	8
77	1	0	2	16777243	2021-11-14 22:24:20	\N	1048585	4
40	1	3	2	16777217	2021-11-14 22:21:15	\N	1048585	2
42	1	0	2	16777243	2021-11-14 22:21:15	\N	1048585	2
43	1	0	2	16777245	2021-11-14 22:21:15	\N	1048585	2
177	1	10	3	16777227	2021-11-14 22:33:19	\N	517	8
270	1	0	2	16777243	2021-11-14 22:41:16	\N	1048585	12
150	1	24	2	16777229	2021-11-14 22:29:57	\N	1048585	6
47	1	20	2	16777231	2021-11-14 22:21:28	\N	1048585	2
46	1	0	2	16777236	2021-11-14 22:21:28	2021-11-14 22:21:34	523	2
48	1	11	3	16777227	2021-11-14 22:21:42	\N	517	2
203	1	3	2	16777217	2021-11-14 22:36:11	\N	1048585	9
327	1	30	2	16777230	2021-11-14 22:45:25	\N	1048585	13
11	1	3	2	16777217	2021-11-14 22:18:37	\N	1048585	1
268	1	3	2	16777217	2021-11-14 22:41:15	\N	1048585	12
13	1	0	2	16777243	2021-11-14 22:18:37	\N	1048585	1
14	1	0	2	16777245	2021-11-14 22:18:37	\N	1048585	1
149	1	0	2	16777236	2021-11-14 22:29:57	2021-11-14 22:30:02	523	7
51	1	12	3	16777227	2021-11-14 22:21:51	\N	517	3
106	1	3	2	16777217	2021-11-14 22:26:28	\N	1048585	5
181	1	25	2	16777230	2021-11-14 22:33:24	\N	1048585	7
16	1	0	2	16777236	2021-11-14 22:18:46	2021-11-14 22:18:49	523	1
18	1	12	3	16777227	2021-11-14 22:18:55	\N	517	1
182	1	3	2	16777251	2021-11-14 22:33:24	2021-11-14 22:33:29	1048585	7
131	1	0	2	16777246	2021-11-14 22:28:03	\N	1048585	5
22	1	19	2	16777230	2021-11-14 22:18:58	\N	1048585	1
81	1	0	2	16777236	2021-11-14 22:24:32	2021-11-14 22:24:37	523	3
23	1	3	2	16777251	2021-11-14 22:18:58	2021-11-14 22:19:01	1048585	1
271	1	0	2	16777245	2021-11-14 22:41:16	\N	1048585	12
83	1	9	3	16777227	2021-11-14 22:24:45	\N	517	4
328	1	3	2	16777251	2021-11-14 22:45:25	2021-11-14 22:45:30	1048585	13
111	1	0	2	16777236	2021-11-14 22:26:38	2021-11-14 22:26:41	523	5
113	1	8	3	16777227	2021-11-14 22:26:48	\N	517	6
59	1	3	2	16777217	2021-11-14 22:22:37	\N	1048585	3
184	1	3	2	16777217	2021-11-14 22:33:58	\N	1048585	8
61	1	0	2	16777243	2021-11-14 22:22:37	\N	1048585	3
62	1	0	2	16777245	2021-11-14 22:22:37	\N	1048585	3
186	1	0	2	16777243	2021-11-14 22:33:58	\N	1048585	8
187	1	0	2	16777245	2021-11-14 22:33:58	\N	1048585	8
205	1	0	2	16777243	2021-11-14 22:36:12	\N	1048585	9
275	1	29	2	16777229	2021-11-14 22:41:30	\N	1048585	12
116	1	0	2	16777236	2021-11-14 22:26:51	2021-11-14 22:26:55	523	6
119	1	12	3	16777227	2021-11-14 22:27:02	\N	517	7
274	1	0	2	16777236	2021-11-14 22:41:30	2021-11-14 22:41:35	523	12
206	1	0	2	16777245	2021-11-14 22:36:12	\N	1048585	9
86	1	0	2	16777236	2021-11-14 22:24:49	2021-11-14 22:24:54	523	4
276	1	7	3	16777227	2021-11-14 22:41:43	\N	517	12
89	1	11	3	16777227	2021-11-14 22:25:03	\N	517	5
153	1	3	3	16777249	2021-11-14 22:30:23	\N	1048586	1
282	1	9	3	16777227	2021-11-14 22:42:00	\N	517	14
127	1	23	2	16777235	2021-11-14 22:27:20	\N	1048585	5
128	1	3	2	16777254	2021-11-14 22:27:20	\N	1048585	5
339	1	3	2	16777217	2021-11-14 22:47:45	\N	1048585	14
97	1	22	2	16777235	2021-11-14 22:25:24	\N	1048585	4
98	1	3	2	16777254	2021-11-14 22:25:24	\N	1048585	4
210	1	26	2	16777229	2021-11-14 22:36:27	\N	1048585	9
78	1	0	2	16777245	2021-11-14 22:24:20	2021-11-14 22:25:29	1048585	4
209	1	0	2	16777236	2021-11-14 22:36:26	2021-11-14 22:36:32	523	9
143	1	3	2	16777217	2021-11-14 22:29:45	\N	1048585	6
145	1	0	2	16777243	2021-11-14 22:29:45	\N	1048585	6
146	1	0	2	16777245	2021-11-14 22:29:45	\N	1048585	6
232	1	0	2	16777236	2021-11-14 22:38:19	2021-11-14 22:38:22	523	10
169	1	3	2	16777217	2021-11-14 22:32:52	\N	1048585	7
227	1	3	2	16777217	2021-11-14 22:38:10	\N	1048585	11
171	1	0	2	16777243	2021-11-14 22:32:52	\N	1048585	7
220	1	3	2	16777217	2021-11-14 22:37:41	\N	1048585	10
172	1	0	2	16777245	2021-11-14 22:32:52	\N	1048585	7
222	1	0	2	16777243	2021-11-14 22:37:41	\N	1048585	10
223	1	0	2	16777245	2021-11-14 22:37:41	\N	1048585	10
234	1	9	3	16777227	2021-11-14 22:38:28	\N	517	9
229	1	0	2	16777243	2021-11-14 22:38:10	\N	1048585	11
230	1	0	2	16777245	2021-11-14 22:38:10	\N	1048585	11
237	1	0	2	16777236	2021-11-14 22:38:31	2021-11-14 22:38:35	523	11
247	1	3	2	16777219	2021-11-14 22:38:59	\N	517	10
253	1	28	2	16777230	2021-11-14 22:39:26	\N	1048585	11
250	1	3	2	16777219	2021-11-14 22:39:11	\N	517	11
254	1	3	2	16777251	2021-11-14 22:39:26	2021-11-14 22:39:30	1048585	11
324	1	3	2	16777219	2021-11-14 22:45:05	\N	517	18
369	1	3	2	16777217	2021-11-14 22:51:25	\N	1048585	15
286	1	3	2	16777219	2021-11-14 22:42:15	\N	517	13
398	1	3	2	16777219	2021-11-14 22:53:09	\N	517	21
419	1	3	2	16777217	2021-11-14 22:56:18	\N	1048585	17
421	1	0	2	16777243	2021-11-14 22:56:18	\N	1048585	17
422	1	0	2	16777245	2021-11-14 22:56:18	\N	1048585	17
371	1	0	2	16777243	2021-11-14 22:51:25	\N	1048585	15
372	1	0	2	16777245	2021-11-14 22:51:25	\N	1048585	15
297	1	3	2	16777217	2021-11-14 22:43:35	\N	1048585	13
299	1	0	2	16777243	2021-11-14 22:43:35	\N	1048585	13
300	1	0	2	16777245	2021-11-14 22:43:35	\N	1048585	13
345	1	0	2	16777236	2021-11-14 22:48:01	2021-11-14 22:48:07	523	15
347	1	7	3	16777227	2021-11-14 22:48:15	\N	517	19
303	1	0	2	16777236	2021-11-14 22:43:49	2021-11-14 22:43:53	523	13
305	1	8	3	16777227	2021-11-14 22:44:00	\N	517	15
350	1	0	2	16777236	2021-11-14 22:48:20	2021-11-14 22:48:26	523	16
353	1	11	3	16777227	2021-11-14 22:48:35	\N	517	20
308	1	0	2	16777236	2021-11-14 22:44:04	2021-11-14 22:44:09	523	14
426	1	34	2	16777229	2021-11-14 22:56:38	\N	1048585	17
375	1	32	2	16777231	2021-11-14 22:51:36	\N	1048585	15
314	1	11	3	16777227	2021-11-14 22:44:26	\N	517	17
425	1	0	2	16777236	2021-11-14 22:56:38	2021-11-14 22:56:44	523	19
374	1	0	2	16777236	2021-11-14 22:51:36	2021-11-14 22:51:39	523	17
427	1	7	3	16777227	2021-11-14 22:56:54	\N	517	24
361	1	31	2	16777235	2021-11-14 22:48:58	\N	1048585	14
362	1	3	2	16777254	2021-11-14 22:48:58	\N	1048585	14
321	1	3	2	16777219	2021-11-14 22:44:49	\N	517	16
430	1	8	3	16777227	2021-11-14 22:57:04	\N	517	25
365	1	0	2	16777246	2021-11-14 22:50:50	\N	1048585	14
381	1	3	2	16777217	2021-11-14 22:52:22	\N	1048585	16
383	1	0	2	16777243	2021-11-14 22:52:22	\N	1048585	16
384	1	0	2	16777245	2021-11-14 22:52:22	\N	1048585	16
387	1	33	2	16777231	2021-11-14 22:52:34	\N	1048585	16
386	1	0	2	16777236	2021-11-14 22:52:34	2021-11-14 22:52:38	523	18
391	1	11	3	16777227	2021-11-14 22:52:50	\N	517	22
394	1	12	3	16777227	2021-11-14 22:52:56	\N	517	23
\.


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
defaultthemeplugin	0	enabled	1	bool
tinymceplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
acronplugin	0	enabled	1	bool
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	a:2:{i:0;s:4:"city";i:1;s:6:"region";}	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
developedbyblockplugin	0	context	1	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
languagetoggleblockplugin	0	context	1	int
acronplugin	0	crontab	a:9:{i:0;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:1;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:2;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:3;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:4;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:5;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:6;a:3:{s:9:"className";s:35:"lib.pkp.classes.task.ReviewReminder";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:7;a:3:{s:9:"className";s:39:"lib.pkp.classes.task.PublishSubmissions";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:8;a:3:{s:9:"className";s:37:"lib.pkp.classes.task.StatisticsReport";s:9:"frequency";a:1:{s:3:"day";s:1:"1";}s:4:"args";a:0:{}}}	object
tinymceplugin	1	enabled	1	bool
defaultthemeplugin	1	enabled	1	bool
browseblockplugin	1	enabled	1	bool
browseblockplugin	1	seq	1	int
browseblockplugin	1	context	1	int
browseblockplugin	1	browseNewReleases	1	bool
browseblockplugin	1	browseCategories	1	bool
browseblockplugin	1	browseSeries	1	bool
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
developedbyblockplugin	1	context	1	int
informationblockplugin	1	enabled	1	bool
informationblockplugin	1	seq	7	int
informationblockplugin	1	context	1	int
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
languagetoggleblockplugin	1	context	1	int
htmlmonographfileplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	displayItems	1	bool
dublincoremetaplugin	1	enabled	1	bool
pdfjsviewerplugin	1	enabled	1	bool
googlescholarplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	61918a27e18db	string
defaultthemeplugin	1	typography	notoSans	string
defaultthemeplugin	1	useHomepageImageAsHeader	false	string
defaultthemeplugin	1	baseColour	#1E6292	string
\.


--
-- Data for Name: press_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.press_settings (press_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	fr_CA	privacyStatement	<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d'autres fins ou transmis à une tierce partie.</p>	\N
1	fr_CA	readerInformation	Nous encourageons les lecteurs à s'abonner au service d'avis de publication de cette presse. Utilisez le lien <a href="http://localhost/index.php/publicknowledge/user/register">d'inscription</a> situé en haut de la page d'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d'affirmer qu'elle compte un certain nombre de lecteurs. Consultez <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">l'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d'autres fins.	\N
1	en_US	submissionChecklist	a:5:{i:0;a:2:{s:5:"order";i:1;s:7:"content";s:163:"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).";}i:1;a:2:{s:5:"order";i:2;s:7:"content";s:79:"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.";}i:2;a:2:{s:5:"order";i:3;s:7:"content";s:60:"Where available, URLs for the references have been provided.";}i:3;a:2:{s:5:"order";i:4;s:7:"content";s:239:"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.";}i:4;a:2:{s:5:"order";i:5;s:7:"content";s:242:"The text adheres to the stylistic and bibliographic requirements outlined in the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines" target="_blank">Author Guidelines</a>, which is found in About the Press.";}}	\N
1	en_US	acronym	JPK	\N
1	en_US	authorInformation	Interested in submitting to this press? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About the Press</a> page for the press' section policies and <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> with the press prior to submitting, or if already registered can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the 5 step process.	\N
1	fr_CA	authorInformation	Vous souhaitez soumettre une contribution à cette presse? Nous vous recommandons de lire la page\n <a href="http://localhost/index.php/publicknowledge/about">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Lignes directrices à l'intention des auteurs</a>. Les auteurs doivent <a href="http://localhost/index.php/publicknowledge/user/register">s'inscrire</a> auprès de la presse avant d'envoyer une soumission. Si vous êtes déjà inscrit(e), il suffit simplement <a href="http://localhost/index.php/index/login">d'ouvrir une session</a> pour débuter la procédure en 5 étapes.	\N
1		defaultReviewMode	2	\N
1		emailSignature	<br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>	\N
1	fr_CA	librarianInformation	Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1	en_US	name	Public Knowledge Press	\N
1	fr_CA	name	Press de la connaissance du public	\N
1	fr_CA	openAccessPolicy	Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l'échelle mondiale.	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>	\N
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this press. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.	\N
1		itemsPerPage	25	\N
1		keywords	request	\N
1	en_US	librarianInformation	We encourage research librarians to list this press among their library's electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	en_US	openAccessPolicy	This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	searchDescription	Public Knowledge Press is a publisher dedicated to the subject of public access to science.	\N
1	fr_CA	submissionChecklist	a:5:{i:0;a:2:{s:5:"order";i:1;s:7:"content";s:175:"Cette soumission n'a jamais été publiée et n'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef).";}i:1;a:2:{s:5:"order";i:2;s:7:"content";s:68:"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument.";}i:2;a:2:{s:5:"order";i:3;s:7:"content";s:83:"Les adresses URL des références ont été fournies si elles étaient disponibles.";}i:3;a:2:{s:5:"order";i:4;s:7:"content";s:302:"Le texte est publié à simple interligne; utilisez une police de caractères en 12 points; utilisez des caractères italiques au lieu de souligner (sauf pour les adresses URL); et toutes les illustrations, figures et tableaux sont insérés dans le texte aux endroits appropriés plutôt qu'à la fin.";}i:4;a:2:{s:5:"order";i:5;s:7:"content";s:293:"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines" target="_blank">lignes directrices à l'intention des auteurs</a>, disponibles dans la rubrique À propos de cette presse.";}}	\N
1		supportedFormLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
1		supportedLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
1		supportedSubmissionLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1		themePluginPath	default	\N
1		type	enable	\N
1		coverThumbnailsMaxWidth	106	\N
1		coverThumbnailsMaxHeight	100	\N
1		paymentPluginName	ManualPayment	\N
\.


--
-- Data for Name: presses; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.presses (press_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en_US	1
\.


--
-- Data for Name: publication_categories; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_categories (publication_id, category_id) FROM stdin;
\.


--
-- Data for Name: publication_dates; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_dates (publication_date_id, publication_format_id, role, date_format, date) FROM stdin;
\.


--
-- Data for Name: publication_format_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_format_settings (publication_format_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	PDF	string
1	fr_CA	name		string
2	en_US	name	PDF	string
2	fr_CA	name		string
\.


--
-- Data for Name: publication_formats; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_formats (publication_format_id, publication_id, submission_id, physical_format, entry_key, seq, file_size, front_matter, back_matter, height, height_unit_code, width, width_unit_code, thickness, thickness_unit_code, weight, weight_unit_code, product_composition_code, product_form_detail_code, country_manufacture_code, imprint, product_availability_code, technical_protection_code, returnable_indicator_code, remote_url, url_path, is_approved, is_available) FROM stdin;
1	5	\N	0	DA	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			1	1
2	14	\N	0	DA	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			1	1
\.


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	abstract	<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>
1	fr_CA	abstract	
1		categoryIds	a:0:{}
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The ABCs of Human Survival: A Paradigm for Global Citizenship
1	fr_CA	title	
2	en_US	abstract	<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>
2	fr_CA	abstract	
2		categoryIds	a:0:{}
2	en_US	prefix	
2	fr_CA	prefix	
2	en_US	subtitle	
2	fr_CA	subtitle	
2	en_US	title	The West and Beyond: New Perspectives on an Imagined Region
2	fr_CA	title	
3	en_US	abstract	<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>
3	fr_CA	abstract	
3		categoryIds	a:0:{}
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	The Political Economy of Workplace Injury in Canada
3	fr_CA	title	
4	en_US	abstract	<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>
4	fr_CA	abstract	
4		categoryIds	a:0:{}
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	How Canadians Communicate: Contexts of Canadian Popular Culture
4	fr_CA	title	
6	fr_CA	abstract	
5	en_US	abstract	<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>
5	fr_CA	abstract	
5		categoryIds	a:0:{}
5	en_US	copyrightHolder	Public Knowledge Press
5	fr_CA	copyrightHolder	Press de la connaissance du public
5		copyrightYear	2021
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Bomb Canada and Other Unkind Remarks in the American Media
5	fr_CA	title	
6	en_US	abstract	<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>
6		categoryIds	a:0:{}
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	The Information Literacy User’s Guide
6	fr_CA	title	
7	en_US	abstract	<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>
7	fr_CA	abstract	
7		categoryIds	a:0:{}
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Accessible Elements: Teaching Science Online and at a Distance
7	fr_CA	title	
8	en_US	abstract	<p>A Note From The Publisher</p>
8	fr_CA	abstract	
8		categoryIds	a:0:{}
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Editorial
8	fr_CA	title	
9		categoryIds	a:0:{}
9	en_US	abstract	<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>
9	fr_CA	abstract	
9	en_US	prefix	
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	en_US	title	Enabling Openness: The future of the information society in Latin America and the Caribbean
9	fr_CA	title	
10	en_US	abstract	<p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.</p>
10	fr_CA	abstract	
10		categoryIds	a:0:{}
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Lost Tracks: Buffalo National Park, 1909-1939
10	fr_CA	title	
11	en_US	abstract	<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>
11	fr_CA	abstract	
11		categoryIds	a:0:{}
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Dreamwork
11	fr_CA	title	
12	en_US	abstract	<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>
12	fr_CA	abstract	
12		categoryIds	a:0:{}
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Connecting ICTs to Development
12	fr_CA	title	
13	en_US	abstract	<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>
13	fr_CA	abstract	
13		categoryIds	a:0:{}
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Mobile Learning: Transforming the Delivery of Education and Training
13	fr_CA	title	
14	fr_CA	title	
14	en_US	abstract	<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>
14	fr_CA	abstract	
14		categoryIds	a:0:{}
14	en_US	copyrightHolder	Public Knowledge Press
14	fr_CA	copyrightHolder	Press de la connaissance du public
14		copyrightYear	2021
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots
15	en_US	abstract	<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>
15	fr_CA	abstract	
15		categoryIds	a:0:{}
15	en_US	prefix	
15	fr_CA	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978
15	fr_CA	title	
16		categoryIds	a:0:{}
16	en_US	abstract	<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>
16	fr_CA	abstract	
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
16	en_US	title	A Designer's Log: Case Studies in Instructional Design
16	fr_CA	title	
17	en_US	abstract	<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>
17	fr_CA	abstract	
17		categoryIds	a:0:{}
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	title	Open Development: Networked Innovations in International Development
17	fr_CA	title	
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publications (publication_id, date_published, last_modified, locale, primary_contact_id, publication_date_type, publication_type, seq, series_id, series_position, submission_id, status, url_path, version) FROM stdin;
1	\N	2021-11-14 22:18:35	en_US	1	pub	publication	0	\N	\N	1	1	\N	1
2	\N	2021-11-14 22:21:12	en_US	2	pub	publication	0	\N	\N	2	1	\N	1
3	\N	2021-11-14 22:22:36	en_US	10	pub	publication	0	\N	\N	3	1	\N	1
4	\N	2021-11-14 22:24:18	en_US	11	pub	publication	0	\N	\N	4	1	\N	1
5	2021-11-14	2021-11-14 22:28:03	en_US	15	pub	publication	0	\N	\N	5	3	\N	1
6	\N	2021-11-14 22:29:42	en_US	16	pub	publication	0	\N	\N	6	1	\N	1
7	\N	2021-11-14 22:32:49	en_US	20	pub	publication	0	\N	\N	7	1	\N	1
8	\N	2021-11-14 22:33:57	en_US	25	pub	publication	0	\N	\N	8	1	\N	1
9	\N	2021-11-14 22:36:09	en_US	26	pub	publication	0	\N	\N	9	1	\N	1
10	\N	2021-11-14 22:37:40	en_US	31	pub	publication	0	\N	\N	10	1	\N	1
11	\N	2021-11-14 22:38:09	en_US	32	pub	publication	0	\N	\N	11	1	\N	1
12	\N	2021-11-14 22:41:13	en_US	33	pub	publication	0	\N	\N	12	1	\N	1
13	\N	2021-11-14 22:43:33	en_US	41	pub	publication	0	\N	\N	13	1	\N	1
14	2021-11-14	2021-11-14 22:50:50	en_US	45	pub	publication	0	\N	\N	14	3	\N	1
15	\N	2021-11-14 22:51:24	en_US	48	pub	publication	0	\N	\N	15	1	\N	1
16	\N	2021-11-14 22:52:21	en_US	49	pub	publication	0	\N	\N	16	1	\N	1
17	\N	2021-11-14 22:56:15	en_US	50	pub	publication	0	\N	\N	17	1	\N	1
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
1	1048585	6	2	1	\N	\N	0
\.


--
-- Data for Name: query_participants; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.query_participants (query_id, user_id) FROM stdin;
1	3
\.


--
-- Data for Name: queued_payments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.queued_payments (queued_payment_id, date_created, date_modified, expiry_date, payment_data) FROM stdin;
\.


--
-- Data for Name: representatives; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.representatives (representative_id, submission_id, role, representative_id_type, representative_id_value, name, phone, email, url, is_supplier) FROM stdin;
\.


--
-- Data for Name: review_assignments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, unconsidered) FROM stdin;
21	16	10	\N	0	2021-11-14 22:52:44	2021-11-14 22:52:44	2021-11-14 22:53:04	2021-11-14 22:53:09	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:53:09	0	0	0	\N	\N	\N	0	18	3	2	1	4	0	0
1	1	12	\N	\N	2021-11-14 22:18:55	2021-11-14 22:18:55	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:18:55	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0
15	13	8	\N	\N	2021-11-14 22:44:00	2021-11-14 22:44:00	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:44:00	0	0	0	\N	\N	\N	\N	13	2	2	1	1	\N	0
2	2	11	\N	\N	2021-11-14 22:21:42	2021-11-14 22:21:42	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:21:42	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
3	2	12	\N	\N	2021-11-14 22:21:51	2021-11-14 22:21:51	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:21:51	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
4	4	9	\N	\N	2021-11-14 22:24:45	2021-11-14 22:24:45	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:24:45	0	0	0	\N	\N	\N	\N	3	2	2	1	1	\N	0
5	4	11	\N	\N	2021-11-14 22:25:03	2021-11-14 22:25:03	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:25:03	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
6	5	8	\N	\N	2021-11-14 22:26:48	2021-11-14 22:26:48	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:26:48	0	0	0	\N	\N	\N	\N	5	2	2	1	1	\N	0
24	17	7	\N	\N	2021-11-14 22:56:54	2021-11-14 22:56:54	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:56:54	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0
7	5	12	\N	\N	2021-11-14 22:27:02	2021-11-14 22:27:02	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:27:02	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
17	13	11	\N	\N	2021-11-14 22:44:26	2021-11-14 22:44:26	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:44:26	0	0	0	\N	\N	\N	\N	14	3	2	1	1	\N	0
8	7	10	\N	\N	2021-11-14 22:33:19	2021-11-14 22:33:19	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:33:19	0	0	0	\N	\N	\N	\N	8	3	2	1	1	\N	0
9	11	9	\N	\N	2021-11-14 22:38:28	2021-11-14 22:38:28	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:38:28	0	0	0	\N	\N	\N	\N	10	2	2	1	1	\N	0
25	17	8	\N	\N	2021-11-14 22:57:04	2021-11-14 22:57:04	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:57:04	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0
16	13	10	\N	0	2021-11-14 22:44:17	2021-11-14 22:44:17	2021-11-14 22:44:44	2021-11-14 22:44:49	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:44:49	0	0	0	\N	\N	\N	0	14	3	2	1	4	0	0
10	11	10	\N	0	2021-11-14 22:38:40	2021-11-14 22:38:40	2021-11-14 22:38:54	2021-11-14 22:38:59	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:38:59	0	0	0	\N	\N	\N	0	11	3	2	1	4	0	0
11	11	12	\N	0	2021-11-14 22:38:47	2021-11-14 22:38:47	2021-11-14 22:39:07	2021-11-14 22:39:11	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:39:11	0	0	0	\N	\N	\N	0	11	3	2	1	4	0	0
12	12	7	\N	\N	2021-11-14 22:41:43	2021-11-14 22:41:43	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:41:43	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0
18	13	12	\N	0	2021-11-14 22:44:34	2021-11-14 22:44:34	2021-11-14 22:44:59	2021-11-14 22:45:05	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:45:05	0	0	0	\N	\N	\N	0	14	3	2	1	4	0	0
14	12	9	\N	\N	2021-11-14 22:42:00	2021-11-14 22:42:00	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:42:00	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0
19	14	7	\N	\N	2021-11-14 22:48:15	2021-11-14 22:48:15	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:48:15	0	0	0	\N	\N	\N	\N	15	2	2	1	1	\N	0
13	12	8	\N	0	2021-11-14 22:41:52	2021-11-14 22:41:52	2021-11-14 22:42:10	2021-11-14 22:42:15	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:42:15	0	0	0	\N	\N	\N	0	12	2	2	1	4	0	0
20	14	11	\N	\N	2021-11-14 22:48:35	2021-11-14 22:48:35	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:48:35	0	0	0	\N	\N	\N	\N	16	3	2	1	1	\N	0
22	16	11	\N	\N	2021-11-14 22:52:50	2021-11-14 22:52:50	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:52:50	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0
23	16	12	\N	\N	2021-11-14 22:52:56	2021-11-14 22:52:56	\N	\N	\N	2021-12-12 00:00:00	2021-12-12 00:00:00	2021-11-14 22:52:56	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0
\.


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_files (review_id, file_id) FROM stdin;
2	6
2	7
2	8
2	9
3	6
3	7
3	8
3	9
4	15
4	16
4	17
4	18
8	34
8	35
8	36
8	37
8	38
9	52
15	59
15	60
15	61
19	68
19	69
19	70
19	71
19	72
19	73
24	89
24	90
24	91
24	92
24	93
24	94
25	89
25	90
25	91
25	92
25	93
25	94
\.


--
-- Data for Name: review_form_element_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_form_element_settings (review_form_element_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_form_elements; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_form_elements (review_form_element_id, review_form_id, seq, element_type, required, included) FROM stdin;
\.


--
-- Data for Name: review_form_responses; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_form_responses (review_form_element_id, review_id, response_type, response_value) FROM stdin;
\.


--
-- Data for Name: review_form_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_form_settings (review_form_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_forms; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_forms (review_form_id, assoc_type, assoc_id, seq, is_active) FROM stdin;
\.


--
-- Data for Name: review_round_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_round_files (submission_id, review_round_id, stage_id, file_id, revision) FROM stdin;
2	2	3	6	1
2	2	3	7	1
2	2	3	8	1
2	2	3	9	1
4	3	2	15	1
4	3	2	16	1
4	3	2	17	1
4	3	2	18	1
6	7	2	25	1
6	7	2	26	1
6	7	2	27	1
6	7	2	28	1
7	8	3	34	1
7	8	3	35	1
7	8	3	36	1
7	8	3	37	1
7	8	3	38	1
9	9	2	45	1
9	9	2	46	1
9	9	2	47	1
9	9	2	48	1
9	9	2	49	1
11	10	2	52	1
13	13	2	59	1
13	13	2	60	1
13	13	2	61	1
14	15	2	68	1
14	15	2	69	1
14	15	2	70	1
14	15	2	71	1
14	15	2	72	1
14	15	2	73	1
15	17	3	81	1
17	19	2	89	1
17	19	2	90	1
17	19	2	91	1
17	19	2	92	1
17	19	2	93	1
17	19	2	94	1
\.


--
-- Data for Name: review_rounds; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_rounds (review_round_id, submission_id, stage_id, round, review_revision, status) FROM stdin;
17	15	3	1	\N	6
1	1	3	1	\N	4
2	2	3	1	\N	7
3	4	2	1	\N	3
18	16	3	1	\N	8
4	4	3	1	\N	4
5	5	2	1	\N	3
6	5	3	1	\N	4
7	6	2	1	\N	6
19	17	2	1	\N	7
8	7	3	1	\N	4
9	9	2	1	\N	6
10	11	2	1	\N	3
11	11	3	1	\N	4
12	12	2	1	\N	8
13	13	2	1	\N	3
14	13	3	1	\N	4
15	14	2	1	\N	3
16	14	3	1	\N	4
\.


--
-- Data for Name: sales_rights; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.sales_rights (sales_rights_id, publication_format_id, type, row_setting, countries_included, countries_excluded, regions_included, regions_excluded) FROM stdin;
\.


--
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.scheduled_tasks (class_name, last_run) FROM stdin;
plugins.generic.usageStats.UsageStatsLoader	2021-11-14 22:13:48
lib.pkp.classes.task.ReviewReminder	2021-11-14 22:13:48
lib.pkp.classes.task.PublishSubmissions	2021-11-14 22:13:48
lib.pkp.classes.task.StatisticsReport	2021-11-14 22:13:48
\.


--
-- Data for Name: section_editors; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.section_editors (context_id, section_id, user_id) FROM stdin;
1	1	4
1	2	5
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.series (series_id, press_id, review_form_id, seq, featured, editor_restricted, path, image) FROM stdin;
1	1	\N	0	0	0	lis	a:0:{}
2	1	\N	0	0	0	pe	a:0:{}
3	1	\N	0	0	0	his	a:0:{}
4	1	\N	0	0	0	ed	a:0:{}
5	1	\N	0	0	0	psy	a:0:{}
\.


--
-- Data for Name: series_categories; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.series_categories (series_id, category_id) FROM stdin;
\.


--
-- Data for Name: series_editors; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.series_editors (press_id, series_id, user_id, can_edit, can_review) FROM stdin;
\.


--
-- Data for Name: series_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.series_settings (series_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Library & Information Studies	string
1	fr_CA	title		string
1	en_US	description		string
1	fr_CA	description		string
1	en_US	prefix		string
1	fr_CA	prefix		string
1	en_US	subtitle		string
1	fr_CA	subtitle		string
1		onlineIssn		string
1		printIssn		string
1		sortOption	title-1	string
2	en_US	title	Political Economy	string
2	fr_CA	title		string
2	en_US	description		string
2	fr_CA	description		string
2	en_US	prefix		string
2	fr_CA	prefix		string
2	en_US	subtitle		string
2	fr_CA	subtitle		string
2		onlineIssn		string
2		printIssn		string
2		sortOption	title-1	string
3	en_US	title	History	string
3	fr_CA	title		string
3	en_US	description		string
3	fr_CA	description		string
3	en_US	prefix		string
3	fr_CA	prefix		string
3	en_US	subtitle		string
3	fr_CA	subtitle		string
3		onlineIssn		string
3		printIssn		string
3		sortOption	title-1	string
4	en_US	title	Education	string
4	fr_CA	title		string
4	en_US	description		string
4	fr_CA	description		string
4	en_US	prefix		string
4	fr_CA	prefix		string
4	en_US	subtitle		string
4	fr_CA	subtitle		string
4		onlineIssn		string
4		printIssn		string
4		sortOption	title-1	string
5	en_US	title	Psychology	string
5	fr_CA	title		string
5	en_US	description		string
5	fr_CA	description		string
5	en_US	prefix		string
5	fr_CA	prefix		string
5	en_US	subtitle		string
5	fr_CA	subtitle		string
5		onlineIssn		string
5		printIssn		string
5		sortOption	title-1	string
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
ugjssphikk50nn5b93di1clbi2	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928026	1636928026	0		localhost
8porfjna47jbabnbkcceti6jck	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928028	1636928039	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1636928039;s:5:"token";s:32:"9cd833f49f1a2b901edb4ebdf7ce3f3f";}	localhost
m2jcma3s5d3nb66026rirh6rlu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929039	1636929218	0	csrf|a:2:{s:9:"timestamp";i:1636929219;s:5:"token";s:32:"f0bf2013f113c2c6d959739d8948f52a";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
f5figtm9gkbvg19oml3j9elpdv	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928039	1636928053	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1636928053;s:5:"token";s:32:"4f961a3cfe969683804a93cd2272cc72";}	localhost
u2dasnpvo1a10k5bo4kfgm6cmh	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929221	1636929239	0	userId|s:1:"3";username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1636929239;s:5:"token";s:32:"40389ed7c96de61374bd9205c88ffae2";}	localhost
0oegt4osccu98ncttt3hmf408q	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928053	1636928061	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1636928061;s:5:"token";s:32:"717c092cd2e3a1d2e8fb4b23ede34368";}	localhost
bmggn1aevtmuuug4av3an9iubu	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928069	1636928074	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1636928074;s:5:"token";s:32:"57ae5db05608d1d123eb731085c9df84";}	localhost
0dggcu6g0u59rbahfi1a0rfe7l	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929240	1636929393	0	csrf|a:2:{s:9:"timestamp";i:1636929393;s:5:"token";s:32:"1203da022a3c7f1881766bc049ad9e16";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
snpjc4pr85p032vvbenokh8hgv	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928061	1636928069	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1636928069;s:5:"token";s:32:"9ac833ea0d42dba4aa11e7ce21f85346";}	localhost
o2ia81m1palsdn24u9vafsromf	27	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929395	1636929462	0	csrf|a:2:{s:9:"timestamp";i:1636929462;s:5:"token";s:32:"b0a3b482a5ae789606b762f3d41aeb87";}username|s:7:"jbrower";userId|s:2:"27";	localhost
9sgr49tl9f5adgqu8t4csg2u23	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928076	1636928258	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1636928257;s:5:"token";s:32:"daf4b3d4e0f513192afd080252bea3dc";}	localhost
tlnnfmqfeibf9ao99587c20mdk	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928260	1636928283	0	userId|s:1:"1";username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1636928283;s:5:"token";s:32:"e7eab0d754800408f5a69beddeab40ec";}	localhost
gnn91j662ogvun17dtqp2fonh3	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928349	1636928512	0	csrf|a:2:{s:9:"timestamp";i:1636928512;s:5:"token";s:32:"2544befde6d001e2547e2748a178e8f8";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
7komr3lgc4mqks0e7cqc3crtbb	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928284	1636928347	0	csrf|a:2:{s:9:"timestamp";i:1636928347;s:5:"token";s:32:"a43856f8ad0dd5737e1e2f251cbe012e";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
89bfr19ti3v7nip9bob52f0228	21	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928514	1636928557	0	csrf|a:2:{s:9:"timestamp";i:1636928557;s:5:"token";s:32:"e478ec367d2fbe8af23cb52d5c5cb41d";}username|s:10:"bbarnetson";userId|s:2:"21";	localhost
vbk11c99op8tl0le7mb3hlmc4i	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929464	1636929571	0	csrf|a:2:{s:9:"timestamp";i:1636929571;s:5:"token";s:32:"e5df9061129a8cf3f7e9ccc782f78e4f";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
v441id73rrki27cd0eqfcsbtta	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928741	1636928884	0	csrf|a:2:{s:9:"timestamp";i:1636928883;s:5:"token";s:32:"69c84a8361c85c7528c12321122d8578";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
88868i8frea0khro98ht3upvg6	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928559	1636928738	0	csrf|a:2:{s:9:"timestamp";i:1636928739;s:5:"token";s:32:"cbebd8580f4c5dba6e0a25116a3bbd16";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
0sl2m01nkagp6c5etmee2fkepl	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929573	1636929736	0	csrf|a:2:{s:9:"timestamp";i:1636929736;s:5:"token";s:32:"005eeeb8f4f5140c7b40986ae84bcd4f";}username|s:7:"phudson";	localhost
df6dtc30mofiqr0v7hrvocpba6	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636928886	1636929035	0	csrf|a:2:{s:9:"timestamp";i:1636929036;s:5:"token";s:32:"629d7b08d2eb0394be09d6d2b78305ca";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
v7mcdjri93hq8oflt8dsglcjog	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929739	1636929931	0	csrf|a:2:{s:9:"timestamp";i:1636929932;s:5:"token";s:32:"c8eea1daa7be9f6740815759f3ad13a3";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
r1hqjq0hp82mas5go39buhcrc9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636929934	1636930252	0	csrf|a:2:{s:9:"timestamp";i:1636930250;s:5:"token";s:32:"63f74bcbf38b8b168a5c93a4220b9091";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
r8n3rg4nun8vbnbp8srj1no6am	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636930392	1636930625	0	csrf|a:2:{s:9:"timestamp";i:1636930625;s:5:"token";s:32:"05aa8745dcdc4150f2461898aa7d9ebb";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
telv0lhidpn49sd3svnntgffb7	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636930254	1636930300	0	csrf|a:2:{s:9:"timestamp";i:1636930300;s:5:"token";s:32:"717c836ed45df555f5f8ec87159bf870";}username|s:7:"dbarnes";userId|s:1:"3";	localhost
stsefnn74356gihg89cj08ra4q	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/83.0.4103.116 Safari/537.36	1636930301	1636930390	0	csrf|a:2:{s:9:"timestamp";i:1636930390;s:5:"token";s:32:"6d2e8034d056b4df1c0cf992c628f6dc";}username|s:8:"agallego";	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.site (redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
0	en_US	6	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	\N
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.site_settings (setting_name, locale, setting_value) FROM stdin;
contactEmail	en_US	pkpadmin@mailinator.com
contactName	en_US	Open Monograph Press
contactName	fr_CA	Open Monograph Press
themePluginPath		default
\.


--
-- Data for Name: spotlight_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.spotlight_settings (spotlight_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: spotlights; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.spotlights (spotlight_id, assoc_type, assoc_id, press_id) FROM stdin;
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
1	1	13	19	2021-11-14 22:18:10	0	0
2	1	3	3	2021-11-14 22:18:37	0	1
3	1	6	14	2021-11-14 22:19:05	0	0
4	2	14	20	2021-11-14 22:19:14	0	0
5	2	3	3	2021-11-14 22:21:15	0	1
6	3	13	21	2021-11-14 22:22:00	0	0
7	3	3	3	2021-11-14 22:22:37	0	1
8	4	14	22	2021-11-14 22:22:45	0	0
9	4	3	3	2021-11-14 22:24:20	0	1
10	4	6	13	2021-11-14 22:25:18	0	0
11	4	10	15	2021-11-14 22:25:36	0	0
12	5	13	23	2021-11-14 22:25:46	0	0
13	5	3	3	2021-11-14 22:26:28	0	1
14	5	6	14	2021-11-14 22:27:15	0	0
15	5	10	16	2021-11-14 22:27:29	0	0
16	5	12	17	2021-11-14 22:27:37	0	0
17	6	14	24	2021-11-14 22:28:12	0	0
18	6	3	3	2021-11-14 22:29:45	0	1
19	6	5	6	2021-11-14 22:30:09	1	1
20	7	14	25	2021-11-14 22:30:45	0	0
21	7	3	3	2021-11-14 22:32:52	0	1
22	7	6	13	2021-11-14 22:33:36	0	0
23	8	13	3	2021-11-14 22:33:47	0	0
24	8	3	3	2021-11-14 22:33:58	0	1
25	9	14	26	2021-11-14 22:34:06	0	0
26	9	3	3	2021-11-14 22:36:11	0	1
27	10	13	27	2021-11-14 22:36:41	0	0
28	10	3	3	2021-11-14 22:37:41	0	1
29	11	13	28	2021-11-14 22:37:50	0	0
30	11	3	3	2021-11-14 22:38:10	0	1
31	12	14	29	2021-11-14 22:39:39	0	0
32	12	3	3	2021-11-14 22:41:15	0	1
33	13	14	30	2021-11-14 22:42:24	0	0
34	13	3	3	2021-11-14 22:43:35	0	1
35	14	14	31	2021-11-14 22:45:40	0	0
36	14	3	3	2021-11-14 22:47:45	0	1
37	14	6	13	2021-11-14 22:48:52	0	0
38	14	10	15	2021-11-14 22:49:11	0	0
39	14	12	18	2021-11-14 22:49:20	0	0
40	15	13	32	2021-11-14 22:50:59	0	0
41	15	3	3	2021-11-14 22:51:25	0	1
42	16	13	33	2021-11-14 22:51:47	0	0
43	16	3	3	2021-11-14 22:52:22	0	1
44	17	14	34	2021-11-14 22:53:18	0	0
45	17	3	3	2021-11-14 22:56:18	0	1
\.


--
-- Data for Name: static_page_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.static_page_settings (static_page_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.static_pages (static_page_id, path, context_id) FROM stdin;
\.


--
-- Data for Name: submission_artwork_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_artwork_files (file_id, revision, caption, credit, copyright_owner, copyright_owner_contact, permission_terms, permission_file_id, chapter_id, contact_author) FROM stdin;
\.


--
-- Data for Name: submission_chapter_authors; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_chapter_authors (author_id, chapter_id, primary_contact, seq) FROM stdin;
1	1	0	0
1	2	0	0
1	3	0	0
5	4	0	0
6	5	0	0
7	6	0	0
8	7	0	0
9	7	0	1
10	8	0	0
10	9	0	0
10	10	0	0
10	11	0	0
10	12	0	0
11	13	0	0
12	14	0	0
13	15	0	0
14	16	0	0
15	17	0	0
15	18	0	0
15	19	0	0
15	20	0	0
15	21	0	0
15	22	0	0
16	23	0	0
17	24	0	0
18	25	0	0
19	26	0	0
20	27	0	0
21	28	0	0
22	29	0	0
23	30	0	0
24	31	0	0
26	32	0	0
27	33	0	0
28	34	0	0
29	35	0	0
30	36	0	0
31	37	0	0
31	38	0	0
31	39	0	0
31	40	0	0
31	41	0	0
31	42	0	0
31	43	0	0
31	44	0	0
31	45	0	0
32	46	0	0
32	47	0	0
35	48	0	0
36	48	0	1
37	49	0	0
38	49	0	1
39	50	0	0
40	50	0	1
42	51	0	0
43	52	0	0
44	53	0	0
45	54	0	0
46	55	0	0
47	56	0	0
45	57	0	0
48	58	0	0
48	59	0	0
48	60	0	0
49	61	0	0
49	62	0	0
49	63	0	0
49	64	0	0
49	65	0	0
51	66	0	0
50	67	0	0
52	67	0	1
50	68	0	0
52	68	0	1
53	69	0	0
54	69	0	1
55	70	0	0
56	70	0	1
57	71	0	0
\.


--
-- Data for Name: submission_chapter_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_chapter_settings (chapter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Choosing the Future	string
1	fr_CA	title		string
1	en_US	subtitle		string
1	fr_CA	subtitle		string
1	en_US	abstract		string
1	fr_CA	abstract		string
1		pages		string
2	en_US	title	Axioms	string
2	fr_CA	title		string
2	en_US	subtitle		string
2	fr_CA	subtitle		string
2	en_US	abstract		string
2	fr_CA	abstract		string
2		pages		string
3	en_US	title	Paradigm Shift	string
3	fr_CA	title		string
3	en_US	subtitle		string
3	fr_CA	subtitle		string
3	en_US	abstract		string
3	fr_CA	abstract		string
3		pages		string
4	en_US	title	Critical History in Western Canada 1900–2000	string
4	fr_CA	title		string
4	en_US	subtitle		string
4	fr_CA	subtitle		string
4	en_US	abstract		string
4	fr_CA	abstract		string
4		pages		string
5	en_US	title	Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito	string
5	fr_CA	title		string
5	en_US	subtitle		string
5	fr_CA	subtitle		string
5	en_US	abstract		string
5	fr_CA	abstract		string
5		pages		string
6	en_US	title	Cree Intellectual Traditions in History	string
6	fr_CA	title		string
6	en_US	subtitle		string
6	fr_CA	subtitle		string
6	en_US	abstract		string
6	fr_CA	abstract		string
6		pages		string
7	en_US	title	Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin	string
7	fr_CA	title		string
7	en_US	subtitle		string
7	fr_CA	subtitle		string
7	en_US	abstract		string
7	fr_CA	abstract		string
7		pages		string
8	en_US	title	Introduction	string
8	fr_CA	title		string
8	en_US	subtitle		string
8	fr_CA	subtitle		string
8	en_US	abstract		string
8	fr_CA	abstract		string
8		pages		string
9	en_US	title	Part One. Employment Relationships in Canada	string
9	fr_CA	title		string
9	en_US	subtitle		string
9	fr_CA	subtitle		string
9	en_US	abstract		string
9	fr_CA	abstract		string
9		pages		string
10	en_US	title	Part Two. Preventing Workplace Injury	string
10	fr_CA	title		string
10	en_US	subtitle		string
10	fr_CA	subtitle		string
10	en_US	abstract		string
10	fr_CA	abstract		string
10		pages		string
11	en_US	title	Part Three. Critique of OHS in Canada	string
11	fr_CA	title		string
11	en_US	subtitle		string
11	fr_CA	subtitle		string
11	en_US	abstract		string
11	fr_CA	abstract		string
11		pages		string
12	en_US	title	Part Four. Political Economy of Preventing Workplace Injury	string
12	fr_CA	title		string
12	en_US	subtitle		string
12	fr_CA	subtitle		string
12	en_US	abstract		string
12	fr_CA	abstract		string
12		pages		string
13	en_US	title	Introduction: Contexts of Popular Culture	string
13	fr_CA	title		string
13	en_US	subtitle		string
13	fr_CA	subtitle		string
13	en_US	abstract		string
13	fr_CA	abstract		string
13		pages		string
14	en_US	title	Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics	string
14	fr_CA	title		string
14	en_US	subtitle		string
14	fr_CA	subtitle		string
14	en_US	abstract		string
14	fr_CA	abstract		string
14		pages		string
15	en_US	title	Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use	string
15	fr_CA	title		string
15	en_US	subtitle		string
15	fr_CA	subtitle		string
15	en_US	abstract		string
15	fr_CA	abstract		string
15		pages		string
16	en_US	title	Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada	string
16	fr_CA	title		string
16	en_US	subtitle		string
16	fr_CA	subtitle		string
16	en_US	abstract		string
16	fr_CA	abstract		string
16		pages		string
17	en_US	title	Prologue	string
17	fr_CA	title		string
17	en_US	subtitle		string
17	fr_CA	subtitle		string
17	en_US	abstract		string
17	fr_CA	abstract		string
17		pages		string
18	en_US	title	Chapter 1: The First Five Years: 1867-1872	string
18	fr_CA	title		string
18	en_US	subtitle		string
18	fr_CA	subtitle		string
18	en_US	abstract		string
18	fr_CA	abstract		string
18		pages		string
19	en_US	title	Chapter 2: Free Trade or "Freedom": 1911	string
19	fr_CA	title		string
19	en_US	subtitle		string
19	fr_CA	subtitle		string
19	en_US	abstract		string
19	fr_CA	abstract		string
19		pages		string
20	en_US	title	Chapter 3: Castro, Nukes & the Cold War: 1953-1968	string
20	fr_CA	title		string
20	en_US	subtitle		string
20	fr_CA	subtitle		string
20	en_US	abstract		string
20	fr_CA	abstract		string
20		pages		string
21	en_US	title	Chapter 4: Enter the Intellect: 1968-1984	string
21	fr_CA	title		string
21	en_US	subtitle		string
21	fr_CA	subtitle		string
21	en_US	abstract		string
21	fr_CA	abstract		string
21		pages		string
22	en_US	title	Epilogue	string
22	fr_CA	title		string
22	en_US	subtitle		string
22	fr_CA	subtitle		string
22	en_US	abstract		string
22	fr_CA	abstract		string
22		pages		string
23	en_US	title	Identify: Understanding Your Information Need	string
23	fr_CA	title		string
23	en_US	subtitle		string
23	fr_CA	subtitle		string
23	en_US	abstract		string
23	fr_CA	abstract		string
23		pages		string
24	en_US	title	Scope: Knowing What Is Available	string
24	fr_CA	title		string
24	en_US	subtitle		string
24	fr_CA	subtitle		string
24	en_US	abstract		string
24	fr_CA	abstract		string
24		pages		string
25	en_US	title	Plan: Developing Research Strategies	string
25	fr_CA	title		string
25	en_US	subtitle		string
25	fr_CA	subtitle		string
25	en_US	abstract		string
25	fr_CA	abstract		string
25		pages		string
26	en_US	title	Gather: Finding What You Need	string
26	fr_CA	title		string
26	en_US	subtitle		string
26	fr_CA	subtitle		string
26	en_US	abstract		string
26	fr_CA	abstract		string
26		pages		string
27	en_US	title	Introduction	string
27	fr_CA	title		string
27	en_US	subtitle		string
27	fr_CA	subtitle		string
27	en_US	abstract		string
27	fr_CA	abstract		string
27		pages		string
28	en_US	title	Chapter 1: Interactions Affording Distance Science Education	string
28	fr_CA	title		string
28	en_US	subtitle		string
28	fr_CA	subtitle		string
28	en_US	abstract		string
28	fr_CA	abstract		string
28		pages		string
29	en_US	title	Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources	string
29	fr_CA	title		string
29	en_US	subtitle		string
29	fr_CA	subtitle		string
29	en_US	abstract		string
29	fr_CA	abstract		string
29		pages		string
30	en_US	title	Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams	string
30	fr_CA	title		string
30	en_US	subtitle		string
30	fr_CA	subtitle		string
30	en_US	abstract		string
30	fr_CA	abstract		string
30		pages		string
31	en_US	title	Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education	string
31	fr_CA	title		string
31	en_US	subtitle		string
31	fr_CA	subtitle		string
31	en_US	abstract		string
31	fr_CA	abstract		string
31		pages		string
32	en_US	title	Internet, openness and the future of the information society in LAC	string
32	fr_CA	title		string
32	en_US	subtitle		string
32	fr_CA	subtitle		string
32	en_US	abstract		string
32	fr_CA	abstract		string
32		pages		string
33	en_US	title	Imagining the Internet: Open, closed or in between?	string
33	fr_CA	title		string
33	en_US	subtitle		string
33	fr_CA	subtitle		string
33	en_US	abstract		string
33	fr_CA	abstract		string
33		pages		string
34	fr_CA	title		string
34	en_US	subtitle		string
34	fr_CA	subtitle		string
34	en_US	abstract		string
34	fr_CA	abstract		string
34		pages		string
34	en_US	title	The internet in LAC will remain free, public and open over the next 10 years	string
35	en_US	title	Free Internet?	string
35	fr_CA	title		string
35	en_US	subtitle		string
35	fr_CA	subtitle		string
35	en_US	abstract		string
35	fr_CA	abstract		string
35		pages		string
36	en_US	title	Risks and challenges for freedom of expression on the internet	string
36	fr_CA	title		string
36	en_US	subtitle		string
36	fr_CA	subtitle		string
36	en_US	abstract		string
36	fr_CA	abstract		string
36		pages		string
37	en_US	title	Introduction	string
37	fr_CA	title		string
37	en_US	subtitle		string
37	fr_CA	subtitle		string
37	en_US	abstract		string
37	fr_CA	abstract		string
37		pages		string
38	en_US	title	CHAPTER ONE: Where the Buffalo Roamed	string
38	fr_CA	title		string
38	en_US	subtitle		string
38	fr_CA	subtitle		string
38	en_US	abstract		string
38	fr_CA	abstract		string
38		pages		string
39	en_US	title	CHAPTER TWO: Bison Conservation and Buffalo National Park	string
39	fr_CA	title		string
39	en_US	subtitle		string
39	fr_CA	subtitle		string
39	en_US	abstract		string
39	fr_CA	abstract		string
39		pages		string
40	en_US	title	CHAPTER THREE: A Well-Run Ranch	string
40	fr_CA	title		string
40	en_US	subtitle		string
40	fr_CA	subtitle		string
40	en_US	abstract		string
40	fr_CA	abstract		string
40		pages		string
41	en_US	title	CHAPTER FOUR: Zookeepers and Animal Breeders	string
41	fr_CA	title		string
41	en_US	subtitle		string
41	fr_CA	subtitle		string
41	en_US	abstract		string
41	fr_CA	abstract		string
41		pages		string
42	en_US	title	CHAPTER FIVE: "Evolving the Arctic Cow"	string
42	fr_CA	title		string
42	en_US	subtitle		string
42	fr_CA	subtitle		string
42	en_US	abstract		string
42	fr_CA	abstract		string
42		pages		string
43	en_US	title	CONCLUSION: The Forgotten Park	string
43	fr_CA	title		string
43	en_US	subtitle		string
43	fr_CA	subtitle		string
43	en_US	abstract		string
43	fr_CA	abstract		string
43		pages		string
44	en_US	title	Bibliography	string
44	fr_CA	title		string
44	en_US	subtitle		string
44	fr_CA	subtitle		string
44	en_US	abstract		string
44	fr_CA	abstract		string
44		pages		string
45	en_US	title	Index	string
45	fr_CA	title		string
45	en_US	subtitle		string
45	fr_CA	subtitle		string
45	en_US	abstract		string
45	fr_CA	abstract		string
45		pages		string
46	en_US	title	Introduction	string
46	fr_CA	title		string
46	en_US	subtitle		string
46	fr_CA	subtitle		string
46	en_US	abstract		string
46	fr_CA	abstract		string
46		pages		string
47	en_US	title	Poems	string
47	fr_CA	title		string
47	en_US	subtitle		string
47	fr_CA	subtitle		string
47	en_US	abstract		string
47	fr_CA	abstract		string
47		pages		string
48	en_US	title	Catalyzing Access through Social and Technical Innovation	string
48	fr_CA	title		string
48	en_US	subtitle		string
48	fr_CA	subtitle		string
48	en_US	abstract		string
48	fr_CA	abstract		string
48		pages		string
49	en_US	title	Catalyzing Access via Telecommunications Policy	string
49	fr_CA	title		string
49	en_US	subtitle		string
49	fr_CA	subtitle		string
49	en_US	abstract		string
49	fr_CA	abstract		string
49		pages		string
50	en_US	title	Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property	string
50	fr_CA	title		string
50	en_US	subtitle		string
50	fr_CA	subtitle		string
50	en_US	abstract		string
50	fr_CA	abstract		string
50		pages		string
51	en_US	title	Current State of Mobile Learning	string
51	fr_CA	title		string
51	en_US	subtitle		string
51	fr_CA	subtitle		string
51	en_US	abstract		string
51	fr_CA	abstract		string
51		pages		string
52	fr_CA	title		string
52	en_US	subtitle		string
52	fr_CA	subtitle		string
52	en_US	title	A Model for Framing Mobile Learning	string
52	en_US	abstract		string
52	fr_CA	abstract		string
52		pages		string
53	en_US	title	Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners	string
53	fr_CA	title		string
53	en_US	subtitle		string
53	fr_CA	subtitle		string
53	en_US	abstract		string
53	fr_CA	abstract		string
53		pages		string
54	en_US	title	Chapter 1: Mind Control—Internal or External?	string
54	fr_CA	title		string
54	en_US	subtitle		string
54	fr_CA	subtitle		string
54	en_US	abstract		string
54	fr_CA	abstract		string
54		pages		string
55	en_US	title	Chapter 2: Classical Music and the Classical Mind	string
55	fr_CA	title		string
55	en_US	subtitle		string
55	fr_CA	subtitle		string
55	en_US	abstract		string
55	fr_CA	abstract		string
55		pages		string
56	en_US	title	Chapter 3: Situated Cognition and Bricolage	string
56	fr_CA	title		string
56	en_US	subtitle		string
56	fr_CA	subtitle		string
56	en_US	abstract		string
56	fr_CA	abstract		string
56		pages		string
57	en_US	title	Chapter 4: Braitenberg’s Vehicle 2	string
57	fr_CA	title		string
57	en_US	subtitle		string
57	fr_CA	subtitle		string
57	en_US	abstract		string
57	fr_CA	abstract		string
57		pages		string
58	en_US	title	Setting the Stage	string
58	fr_CA	title		string
58	en_US	subtitle		string
58	fr_CA	subtitle		string
58	en_US	abstract		string
58	fr_CA	abstract		string
58		pages		string
59	en_US	title	Going It Alone, 1945-1954	string
59	fr_CA	title		string
59	en_US	subtitle		string
59	fr_CA	subtitle		string
59	en_US	abstract		string
59	fr_CA	abstract		string
59		pages		string
60	en_US	title	Establishing the Pattern, 1955-1962	string
60	fr_CA	title		string
60	en_US	subtitle		string
60	fr_CA	subtitle		string
60	en_US	abstract		string
60	fr_CA	abstract		string
60		pages		string
61	en_US	title	Foreward	string
61	fr_CA	title		string
61	en_US	subtitle		string
61	fr_CA	subtitle		string
61	en_US	abstract		string
61	fr_CA	abstract		string
61		pages		string
62	en_US	title	Preface	string
62	fr_CA	title		string
62	en_US	subtitle		string
62	fr_CA	subtitle		string
62	en_US	abstract		string
62	fr_CA	abstract		string
62		pages		string
63	en_US	title	The Case Studies	string
63	fr_CA	title		string
63	en_US	subtitle		string
63	fr_CA	subtitle		string
63	en_US	abstract		string
63	fr_CA	abstract		string
63		pages		string
64	en_US	title	Conclusion	string
64	fr_CA	title		string
64	en_US	subtitle		string
64	fr_CA	subtitle		string
64	en_US	abstract		string
64	fr_CA	abstract		string
64		pages		string
65	en_US	title	Bibliography	string
65	fr_CA	title		string
65	en_US	subtitle		string
65	fr_CA	subtitle		string
65	en_US	abstract		string
65	fr_CA	abstract		string
65		pages		string
66	en_US	title	Preface	string
66	fr_CA	title		string
66	en_US	subtitle		string
66	fr_CA	subtitle		string
66	en_US	abstract		string
66	fr_CA	abstract		string
66		pages		string
67	en_US	title	Introduction	string
67	fr_CA	title		string
67	en_US	subtitle		string
67	fr_CA	subtitle		string
67	en_US	abstract		string
67	fr_CA	abstract		string
67		pages		string
68	en_US	title	The Emergence of Open Development in a Network Society	string
68	fr_CA	title		string
68	en_US	subtitle		string
68	fr_CA	subtitle		string
68	en_US	abstract		string
68	fr_CA	abstract		string
68		pages		string
69	en_US	title	Enacting Openness in ICT4D Research	string
69	fr_CA	title		string
69	en_US	subtitle		string
69	fr_CA	subtitle		string
69	en_US	abstract		string
69	fr_CA	abstract		string
69		pages		string
70	en_US	title	Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things	string
70	fr_CA	title		string
70	en_US	subtitle		string
70	fr_CA	subtitle		string
70	en_US	abstract		string
70	fr_CA	abstract		string
70		pages		string
71	en_US	title	Open Educational Resources: Opportunities and Challenges for the Developing World	string
71	fr_CA	title		string
71	en_US	subtitle		string
71	fr_CA	subtitle		string
71	en_US	abstract		string
71	fr_CA	abstract		string
71		pages		string
\.


--
-- Data for Name: submission_chapters; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_chapters (chapter_id, primary_contact_id, publication_id, seq) FROM stdin;
42	\N	10	6
43	\N	10	7
1	\N	1	1
2	\N	1	2
3	\N	1	3
44	\N	10	8
45	\N	10	9
46	\N	11	1
47	\N	11	2
4	\N	2	1
5	\N	2	2
6	\N	2	3
7	\N	2	4
23	\N	6	1
24	\N	6	2
25	\N	6	3
26	\N	6	4
8	\N	3	1
9	\N	3	2
10	\N	3	3
11	\N	3	4
12	\N	3	5
48	\N	12	1
49	\N	12	2
13	\N	4	1
14	\N	4	2
15	\N	4	3
50	\N	12	3
16	\N	4	4
27	\N	7	1
28	\N	7	2
29	\N	7	3
30	\N	7	4
31	\N	7	5
17	\N	5	1
18	\N	5	2
19	\N	5	3
20	\N	5	4
21	\N	5	5
22	\N	5	6
51	\N	13	1
52	\N	13	2
53	\N	13	3
66	\N	17	1
67	\N	17	2
68	\N	17	3
69	\N	17	4
32	\N	9	1
33	\N	9	2
34	\N	9	3
35	\N	9	4
70	\N	17	5
36	\N	9	5
71	\N	17	6
54	\N	14	1
55	\N	14	2
56	\N	14	3
57	\N	14	4
58	\N	15	1
59	\N	15	2
60	\N	15	3
37	\N	10	1
38	\N	10	2
39	\N	10	3
40	\N	10	4
41	\N	10	5
61	\N	16	1
62	\N	16	2
63	\N	16	3
64	\N	16	4
65	\N	16	5
\.


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
1	1	4096	11	10	10		<p>I recommend that the author revise this submission.</p>	2021-11-14 22:38:59	\N	1
2	1	4096	11	11	12		<p>I recommend that the author resubmit this submission.</p>	2021-11-14 22:39:11	\N	1
3	1	4096	16	21	10		<p>I recommend that the author revise this submission.</p>	2021-11-14 22:53:09	\N	1
\.


--
-- Data for Name: submission_file_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	aclark, The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
1	fr_CA	name		string
19	fr_CA	name		string
23		chapterId	25	int
24	en_US	name	dbernnard, Gather: Finding What You Need.pdf	string
24	fr_CA	name		string
20	fr_CA	name		string
20	en_US	name	callan, Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
24		chapterId	26	int
25	en_US	name	Chapter Manuscript, Identify: Understanding Your Information.pdf	string
25	fr_CA	name		string
25		chapterId	23	int
26	fr_CA	name		string
26	en_US	name	Chapter Manuscript, Scope: Knowing What Is Available.pdf	string
26		chapterId	24	int
11	en_US	name	bbeaty, Introduction: Contexts of Popular Cultur.pdf	string
11	fr_CA	name		string
11		chapterId	13	int
12	en_US	name	bbeaty, Chapter 1. A Future for Media Studies: C.pdf	string
2	en_US	name	afinkel, Critical History in Western Canada 1900–.pdf	string
2	fr_CA	name		string
2		chapterId	4	int
3	en_US	name	afinkel, Vernacular Currents in Western Canadian .pdf	string
3	fr_CA	name		string
3		chapterId	5	int
4	en_US	name	afinkel, Cree Intellectual Traditions in History.pdf	string
4	fr_CA	name		string
4		chapterId	6	int
5	en_US	name	afinkel, Visualizing Space, Race, and History in .pdf	string
5	fr_CA	name		string
5		chapterId	7	int
6	en_US	name	Chapter Manuscript, Critical History in Western Canada 1900–.pdf	string
6	fr_CA	name		string
6		chapterId	4	int
7	en_US	name	Chapter Manuscript, Vernacular Currents in Western Canadian .pdf	string
7	fr_CA	name		string
7		chapterId	5	int
8	en_US	name	Chapter Manuscript, Cree Intellectual Traditions in History.pdf	string
8	fr_CA	name		string
8		chapterId	6	int
9	en_US	name	Chapter Manuscript, Visualizing Space, Race, and History in .pdf	string
9	fr_CA	name		string
9		chapterId	7	int
10	en_US	name	bbarnetson, The Political Economy of Workplace Injury in Canada.pdf	string
10	fr_CA	name		string
12	fr_CA	name		string
27	en_US	name	Chapter Manuscript, Plan: Developing Research Strategies.pdf	string
27	fr_CA	name		string
27		chapterId	25	int
28	en_US	name	Chapter Manuscript, Gather: Finding What You Need.pdf	string
28	fr_CA	name		string
12		chapterId	14	int
13	en_US	name	bbeaty, Chapter 2. Log On, Goof Off, and Look Up.pdf	string
13	fr_CA	name		string
13		chapterId	15	int
14	en_US	name	bbeaty, Chapter 3. Hawkers and Public Space: Fre.pdf	string
14	fr_CA	name		string
14		chapterId	16	int
15	en_US	name	Chapter Manuscript, Introduction: Contexts of Popular Cultur.pdf	string
15	fr_CA	name		string
15		chapterId	13	int
16	en_US	name	Chapter Manuscript, Chapter 1. A Future for Media Studies: C.pdf	string
16	fr_CA	name		string
16		chapterId	14	int
17	en_US	name	Chapter Manuscript, Chapter 2. Log On, Goof Off, and Look Up.pdf	string
17	fr_CA	name		string
17		chapterId	15	int
18	en_US	name	Chapter Manuscript, Chapter 3. Hawkers and Public Space: Fre.pdf	string
18	fr_CA	name		string
18		chapterId	16	int
19	en_US	name	callan, Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
28		chapterId	26	int
29	fr_CA	name		string
30	fr_CA	name		string
31	fr_CA	name		string
21	en_US	name	dbernnard, Identify: Understanding Your Information.pdf	string
21	fr_CA	name		string
21		chapterId	23	int
22	fr_CA	name		string
22	en_US	name	dbernnard, Scope: Knowing What Is Available.pdf	string
22		chapterId	24	int
23	en_US	name	dbernnard, Plan: Developing Research Strategies.pdf	string
23	fr_CA	name		string
32	fr_CA	name		string
33	fr_CA	name		string
31	en_US	name	dkennepohl, Chapter 2: Learning Science at a Distanc.pdf	string
29	en_US	name	dkennepohl, Introduction.pdf	string
29		chapterId	27	int
30	en_US	name	dkennepohl, Chapter 1: Interactions Affording Distan.pdf	string
30		chapterId	28	int
31		chapterId	29	int
32	en_US	name	dkennepohl, Chapter 3: Leadership Strategies for Coo.pdf	string
32		chapterId	30	int
33		chapterId	31	int
33	en_US	name	dkennepohl, Chapter 4: Toward New Models of Flexible.pdf	string
34	fr_CA	name		string
34	en_US	name	Chapter Manuscript, Introduction.pdf	string
34		chapterId	27	int
35	fr_CA	name		string
35	en_US	name	Chapter Manuscript, Chapter 1: Interactions Affording Distan.pdf	string
35		chapterId	28	int
36	fr_CA	name		string
36	en_US	name	Chapter Manuscript, Chapter 2: Learning Science at a Distanc.pdf	string
36		chapterId	29	int
37	fr_CA	name		string
37	en_US	name	Chapter Manuscript, Chapter 3: Leadership Strategies for Coo.pdf	string
37		chapterId	30	int
38	fr_CA	name		string
38	en_US	name	Chapter Manuscript, Chapter 4: Toward New Models of Flexible.pdf	string
38		chapterId	31	int
39	en_US	name	dbarnes, Editorial.pdf	string
39	fr_CA	name		string
45	fr_CA	name		string
45		chapterId	32	int
46	en_US	name	Chapter Manuscript, Imagining the Internet: Open, closed or .pdf	string
46	fr_CA	name		string
46		chapterId	33	int
47	en_US	name	Chapter Manuscript, The internet in LAC will remain free, pu.pdf	string
47	fr_CA	name		string
47		chapterId	34	int
48	en_US	name	Chapter Manuscript, Free Internet?.pdf	string
48	fr_CA	name		string
48		chapterId	35	int
49	en_US	name	Chapter Manuscript, Risks and challenges for freedom of expr.pdf	string
49	fr_CA	name		string
49		chapterId	36	int
50	en_US	name	jbrower, Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
50	fr_CA	name		string
51	en_US	name	jlockehart, Dreamwork.pdf	string
51	fr_CA	name		string
52	en_US	name	Book Manuscript, Dreamwork.pdf	string
52	fr_CA	name		string
61	en_US	name	Chapter Manuscript, Mobile Distance Learning with PDAs: Deve.pdf	string
61		chapterId	53	int
63	fr_CA	name		string
64	fr_CA	name		string
65	fr_CA	name		string
65	en_US	name	mdawson, Chapter 4: Braitenberg’s Vehicle 2.pdf	string
53	en_US	name	lelder, Catalyzing Access through Social and Tec.pdf	string
53	fr_CA	name		string
53		chapterId	48	int
54	en_US	name	lelder, Catalyzing Access via Telecommunications.pdf	string
54	fr_CA	name		string
40	en_US	name	fperini, Internet, openness and the future of the.pdf	string
40	fr_CA	name		string
40		chapterId	32	int
41	en_US	name	fperini, Imagining the Internet: Open, closed or .pdf	string
41	fr_CA	name		string
41		chapterId	33	int
42	en_US	name	fperini, The internet in LAC will remain free, pu.pdf	string
42	fr_CA	name		string
42		chapterId	34	int
43	en_US	name	fperini, Free Internet?.pdf	string
43	fr_CA	name		string
43		chapterId	35	int
44	en_US	name	fperini, Risks and challenges for freedom of expr.pdf	string
44	fr_CA	name		string
44		chapterId	36	int
45	en_US	name	Chapter Manuscript, Internet, openness and the future of the.pdf	string
54		chapterId	49	int
55	en_US	name	lelder, Access to Knowledge as a New Paradigm fo.pdf	string
55	fr_CA	name		string
55		chapterId	50	int
66	en_US	name	mdawson, Segmentation of Vascular Ultrasound Imag.pdf	string
56	en_US	name	mally, Current State of Mobile Learning.pdf	string
56	fr_CA	name		string
56		chapterId	51	int
57	en_US	name	mally, A Model for Framing Mobile Learning.pdf	string
57	fr_CA	name		string
57		chapterId	52	int
58	fr_CA	name		string
58	en_US	name	mally, Mobile Distance Learning with PDAs: Deve.pdf	string
58		chapterId	53	int
59	en_US	name	Chapter Manuscript, Current State of Mobile Learning.pdf	string
59	fr_CA	name		string
59		chapterId	51	int
60	en_US	name	Chapter Manuscript, A Model for Framing Mobile Learning.pdf	string
60	fr_CA	name		string
60		chapterId	52	int
61	fr_CA	name		string
67	en_US	name	mdawson, The Canadian Nutrient File: Nutrient Val.pdf	string
66	fr_CA	name		string
66	en_US	creator	Baris Kanber	string
66	fr_CA	creator		string
66	en_US	subject		string
66	fr_CA	subject		string
66	fr_CA	description		string
66	en_US	publisher		string
66	fr_CA	publisher		string
66	en_US	sponsor		string
66	fr_CA	sponsor		string
66	en_US	source		string
66	fr_CA	source		string
66		dateCreated		string
66		language	en	string
67	fr_CA	name		string
67	en_US	creator	Health Canada	string
67	fr_CA	creator		string
67	en_US	subject	Health and Safety	string
62	fr_CA	name		string
63	en_US	name	mdawson, Chapter 2: Classical Music and the Class.pdf	string
64	en_US	name	mdawson, Chapter 3: Situated Cognition and Bricol.pdf	string
67	en_US	source	http://open.canada.ca/data/en/dataset/a289fd54-060c-4a96-9fcf-b1c6e706426f	string
67	fr_CA	source		string
67		dateCreated	2013-05-23	string
67		language	en	string
68	fr_CA	name		string
68	en_US	name	Chapter Manuscript, Chapter 1: Mind Control—Internal or Exte.pdf	string
68		chapterId	54	int
69	fr_CA	name		string
69	en_US	name	Chapter Manuscript, Chapter 2: Classical Music and the Class.pdf	string
69		chapterId	55	int
70	fr_CA	name		string
70	en_US	name	Chapter Manuscript, Chapter 3: Situated Cognition and Bricol.pdf	string
70		chapterId	56	int
71	fr_CA	name		string
71	en_US	name	Chapter Manuscript, Chapter 4: Braitenberg’s Vehicle 2.pdf	string
71		chapterId	57	int
72	en_US	name	Other, Segmentation of Vascular Ultrasound Imag.pdf	string
72	fr_CA	name		string
72	en_US	creator	Baris Kanber	string
72	fr_CA	creator		string
72	en_US	subject		string
72	fr_CA	subject		string
72	fr_CA	description		string
72	en_US	description	A presentation entitled "Segmentation of Vascular Ultrasound Image Sequences".	string
72	en_US	publisher		string
72	fr_CA	publisher		string
72	en_US	sponsor		string
72	fr_CA	sponsor		string
72	en_US	source		string
72	fr_CA	source		string
72		dateCreated		string
72		language	en	string
73	en_US	name	Other, The Canadian Nutrient File: Nutrient Val.pdf	string
73	fr_CA	name		string
73	en_US	creator	Health Canada	string
73	fr_CA	creator		string
77	fr_CA	name		string
78	fr_CA	name		string
77	en_US	name	mdawson, Chapter 4: Braitenberg’s Vehicle 2.pdf	string
62	en_US	name	mdawson, Chapter 1: Mind Control—Internal or Exte.pdf	string
62		chapterId	54	int
63		chapterId	55	int
64		chapterId	56	int
65		chapterId	57	int
66	en_US	description	A presentation entitled "Segmentation of Vascular Ultrasound Image Sequences".	string
67	fr_CA	subject		string
67	en_US	description	Published by Health Canada, the Nutrient Value of Some Common Foods (NVSCF) provides Canadians with a resource that lists 19 nutrients for 1000 of the most commonly consumed foods in Canada. Use this quick and easy reference to help make informed food choices through an understanding of the nutrient content of the foods you eat. For further information, a booklet is available on this site in a downloadable or printable pdf format.	string
67	fr_CA	description		string
67	en_US	publisher	Health Canada	string
67	fr_CA	publisher		string
67	en_US	sponsor		string
67	fr_CA	sponsor		string
73	en_US	subject	Health and Safety	string
73	fr_CA	subject		string
73	en_US	description	Published by Health Canada, the Nutrient Value of Some Common Foods (NVSCF) provides Canadians with a resource that lists 19 nutrients for 1000 of the most commonly consumed foods in Canada. Use this quick and easy reference to help make informed food choices through an understanding of the nutrient content of the foods you eat. For further information, a booklet is available on this site in a downloadable or printable pdf format.	string
73	fr_CA	description		string
73	en_US	publisher	Health Canada	string
73	fr_CA	publisher		string
73	en_US	sponsor		string
73	fr_CA	sponsor		string
73	en_US	source	http://open.canada.ca/data/en/dataset/a289fd54-060c-4a96-9fcf-b1c6e706426f	string
73	fr_CA	source		string
73		dateCreated	2013-05-23	string
73		language	en	string
75	en_US	name	mdawson, Chapter 2: Classical Music and the Class.pdf	string
74	fr_CA	name		string
74		chapterId	54	int
75		chapterId	55	int
76	en_US	name	mdawson, Chapter 3: Situated Cognition and Bricol.pdf	string
75	fr_CA	name		string
76		chapterId	56	int
77		chapterId	57	int
76	fr_CA	name		string
78	en_US	creator	Baris Kanber	string
78	fr_CA	creator		string
78	en_US	subject		string
78	fr_CA	subject		string
78	fr_CA	description		string
78	en_US	description	A presentation entitled "Segmentation of Vascular Ultrasound Image Sequences".	string
78	en_US	publisher		string
78	fr_CA	publisher		string
78	en_US	sponsor		string
78	fr_CA	sponsor		string
78	en_US	source		string
78	fr_CA	source		string
78		dateCreated		string
78		language	en	string
79	fr_CA	name		string
78	en_US	name	mdawson, Segmentation of Vascular Ultrasound Imag.pdf	string
79	en_US	creator	Health Canada	string
79	fr_CA	creator		string
79	en_US	subject	Health and Safety	string
79	fr_CA	subject		string
79	en_US	name	mdawson, The Canadian Nutrient File: Nutrient Val.pdf	string
74	en_US	name	mdawson, Chapter 1: Mind Control—Internal or Exte.pdf	string
83	en_US	name	msmith, Preface.pdf	string
83	fr_CA	name		string
83		chapterId	66	int
84	fr_CA	name		string
84	en_US	name	msmith, Introduction.pdf	string
84		chapterId	67	int
79	en_US	description	Published by Health Canada, the Nutrient Value of Some Common Foods (NVSCF) provides Canadians with a resource that lists 19 nutrients for 1000 of the most commonly consumed foods in Canada. Use this quick and easy reference to help make informed food choices through an understanding of the nutrient content of the foods you eat. For further information, a booklet is available on this site in a downloadable or printable pdf format.	string
79	fr_CA	description		string
79	en_US	publisher	Health Canada	string
79	fr_CA	publisher		string
79	en_US	sponsor		string
79	fr_CA	sponsor		string
79	en_US	source	http://open.canada.ca/data/en/dataset/a289fd54-060c-4a96-9fcf-b1c6e706426f	string
79	fr_CA	source		string
79		dateCreated	2013-05-23	string
79		language	en	string
80	en_US	name	mforan, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
80	fr_CA	name		string
81	en_US	name	Book Manuscript, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
81	fr_CA	name		string
82	en_US	name	mpower, A Designer's Log: Case Studies in Instructional Design.pdf	string
82	fr_CA	name		string
85	en_US	name	msmith, The Emergence of Open Development in a N.pdf	string
85	fr_CA	name		string
85		chapterId	68	int
86	en_US	name	msmith, Enacting Openness in ICT4D Research.pdf	string
86	fr_CA	name		string
86		chapterId	69	int
87	en_US	name	msmith, Transparency and Development: Ethical Co.pdf	string
87	fr_CA	name		string
87		chapterId	70	int
88	en_US	name	msmith, Open Educational Resources: Opportunitie.pdf	string
88	fr_CA	name		string
88		chapterId	71	int
89	en_US	name	Chapter Manuscript, Preface.pdf	string
89	fr_CA	name		string
89		chapterId	66	int
90	fr_CA	name		string
90	en_US	name	Chapter Manuscript, Introduction.pdf	string
90		chapterId	67	int
91	en_US	name	Chapter Manuscript, The Emergence of Open Development in a N.pdf	string
91	fr_CA	name		string
91		chapterId	68	int
92	en_US	name	Chapter Manuscript, Enacting Openness in ICT4D Research.pdf	string
92	fr_CA	name		string
92		chapterId	69	int
93	en_US	name	Chapter Manuscript, Transparency and Development: Ethical Co.pdf	string
93	fr_CA	name		string
93		chapterId	70	int
94	en_US	name	Chapter Manuscript, Open Educational Resources: Opportunitie.pdf	string
94	fr_CA	name		string
94		chapterId	71	int
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_files (file_id, revision, source_file_id, source_revision, submission_id, file_type, genre_id, file_size, original_file_name, file_stage, direct_sales_price, sales_type, viewable, date_uploaded, date_modified, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	\N	\N	1	application/pdf	3	14572	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	2	\N	\N	1	2021-11-14 22:18:16	2021-11-14 22:18:16	19	\N	\N
21	1	\N	\N	6	application/pdf	4	14572	Identify: Understanding Your Information.pdf	2	\N	\N	1	2021-11-14 22:28:17	2021-11-14 22:28:17	24	\N	\N
22	1	\N	\N	6	application/pdf	4	14572	Scope: Knowing What Is Available.pdf	2	\N	\N	1	2021-11-14 22:28:26	2021-11-14 22:28:26	24	\N	\N
23	1	\N	\N	6	application/pdf	4	14572	Plan: Developing Research Strategies.pdf	2	\N	\N	1	2021-11-14 22:28:36	2021-11-14 22:28:36	24	\N	\N
24	1	\N	\N	6	application/pdf	4	14572	Gather: Finding What You Need.pdf	2	\N	\N	1	2021-11-14 22:28:45	2021-11-14 22:28:45	24	\N	\N
25	1	21	1	6	application/pdf	4	14572	Identify: Understanding Your Information.pdf	4	\N	\N	1	2021-11-14 22:28:17	2021-11-14 22:29:57	24	\N	\N
26	1	22	1	6	application/pdf	4	14572	Scope: Knowing What Is Available.pdf	4	\N	\N	1	2021-11-14 22:28:26	2021-11-14 22:29:57	24	\N	\N
27	1	23	1	6	application/pdf	4	14572	Plan: Developing Research Strategies.pdf	4	\N	\N	1	2021-11-14 22:28:36	2021-11-14 22:29:57	24	\N	\N
11	1	\N	\N	4	application/pdf	4	14572	Introduction: Contexts of Popular Cultur.pdf	2	\N	\N	1	2021-11-14 22:22:50	2021-11-14 22:22:50	22	\N	\N
12	1	\N	\N	4	application/pdf	4	14572	Chapter 1. A Future for Media Studies: C.pdf	2	\N	\N	1	2021-11-14 22:22:59	2021-11-14 22:22:59	22	\N	\N
13	1	\N	\N	4	application/pdf	4	14572	Chapter 2. Log On, Goof Off, and Look Up.pdf	2	\N	\N	1	2021-11-14 22:23:09	2021-11-14 22:23:09	22	\N	\N
14	1	\N	\N	4	application/pdf	4	14572	Chapter 3. Hawkers and Public Space: Fre.pdf	2	\N	\N	1	2021-11-14 22:23:18	2021-11-14 22:23:18	22	\N	\N
15	1	11	1	4	application/pdf	4	14572	Introduction: Contexts of Popular Cultur.pdf	4	\N	\N	1	2021-11-14 22:22:50	2021-11-14 22:24:32	22	\N	\N
2	1	\N	\N	2	application/pdf	4	14572	Critical History in Western Canada 1900–.pdf	2	\N	\N	1	2021-11-14 22:19:20	2021-11-14 22:19:20	20	\N	\N
3	1	\N	\N	2	application/pdf	4	14572	Vernacular Currents in Western Canadian .pdf	2	\N	\N	1	2021-11-14 22:19:29	2021-11-14 22:19:29	20	\N	\N
4	1	\N	\N	2	application/pdf	4	14572	Cree Intellectual Traditions in History.pdf	2	\N	\N	1	2021-11-14 22:19:38	2021-11-14 22:19:38	20	\N	\N
5	1	\N	\N	2	application/pdf	4	14572	Visualizing Space, Race, and History in .pdf	2	\N	\N	1	2021-11-14 22:19:48	2021-11-14 22:19:48	20	\N	\N
6	1	2	1	2	application/pdf	4	14572	Critical History in Western Canada 1900–.pdf	4	\N	\N	1	2021-11-14 22:19:20	2021-11-14 22:21:28	20	\N	\N
7	1	3	1	2	application/pdf	4	14572	Vernacular Currents in Western Canadian .pdf	4	\N	\N	1	2021-11-14 22:19:29	2021-11-14 22:21:28	20	\N	\N
8	1	4	1	2	application/pdf	4	14572	Cree Intellectual Traditions in History.pdf	4	\N	\N	1	2021-11-14 22:19:38	2021-11-14 22:21:28	20	\N	\N
9	1	5	1	2	application/pdf	4	14572	Visualizing Space, Race, and History in .pdf	4	\N	\N	1	2021-11-14 22:19:48	2021-11-14 22:21:28	20	\N	\N
10	1	\N	\N	3	application/pdf	3	14572	The Political Economy of Workplace Injury in Canada.pdf	2	\N	\N	1	2021-11-14 22:22:06	2021-11-14 22:22:06	21	\N	\N
16	1	12	1	4	application/pdf	4	14572	Chapter 1. A Future for Media Studies: C.pdf	4	\N	\N	1	2021-11-14 22:22:59	2021-11-14 22:24:32	22	\N	\N
28	1	24	1	6	application/pdf	4	14572	Gather: Finding What You Need.pdf	4	\N	\N	1	2021-11-14 22:28:45	2021-11-14 22:29:57	24	\N	\N
29	1	\N	\N	7	application/pdf	4	14572	Introduction.pdf	2	\N	\N	1	2021-11-14 22:30:50	2021-11-14 22:30:50	25	\N	\N
17	1	13	1	4	application/pdf	4	14572	Chapter 2. Log On, Goof Off, and Look Up.pdf	4	\N	\N	1	2021-11-14 22:23:09	2021-11-14 22:24:32	22	\N	\N
18	1	14	1	4	application/pdf	4	14572	Chapter 3. Hawkers and Public Space: Fre.pdf	4	\N	\N	1	2021-11-14 22:23:18	2021-11-14 22:24:32	22	\N	\N
19	1	\N	\N	5	application/pdf	3	14572	Bomb Canada and Other Unkind Remarks in the American Media.pdf	2	\N	\N	1	2021-11-14 22:25:52	2021-11-14 22:25:52	23	\N	\N
30	1	\N	\N	7	application/pdf	4	14572	Chapter 1: Interactions Affording Distan.pdf	2	\N	\N	1	2021-11-14 22:30:59	2021-11-14 22:30:59	25	\N	\N
20	1	19	1	5	application/pdf	3	14572	Bomb Canada and Other Unkind Remarks in the American Media.pdf	10	0	openAccess	1	2021-11-14 22:25:52	2021-11-14 22:27:47	23	521	1
31	1	\N	\N	7	application/pdf	4	14572	Chapter 2: Learning Science at a Distanc.pdf	2	\N	\N	1	2021-11-14 22:31:08	2021-11-14 22:31:08	25	\N	\N
32	1	\N	\N	7	application/pdf	4	14572	Chapter 3: Leadership Strategies for Coo.pdf	2	\N	\N	1	2021-11-14 22:31:18	2021-11-14 22:31:18	25	\N	\N
36	1	31	1	7	application/pdf	4	14572	Chapter 2: Learning Science at a Distanc.pdf	4	\N	\N	1	2021-11-14 22:31:08	2021-11-14 22:33:05	25	\N	\N
33	1	\N	\N	7	application/pdf	4	14572	Chapter 4: Toward New Models of Flexible.pdf	2	\N	\N	1	2021-11-14 22:31:27	2021-11-14 22:31:27	25	\N	\N
34	1	29	1	7	application/pdf	4	14572	Introduction.pdf	4	\N	\N	1	2021-11-14 22:30:50	2021-11-14 22:33:05	25	\N	\N
37	1	32	1	7	application/pdf	4	14572	Chapter 3: Leadership Strategies for Coo.pdf	4	\N	\N	1	2021-11-14 22:31:18	2021-11-14 22:33:06	25	\N	\N
38	1	33	1	7	application/pdf	4	14572	Chapter 4: Toward New Models of Flexible.pdf	4	\N	\N	1	2021-11-14 22:31:27	2021-11-14 22:33:06	25	\N	\N
39	1	\N	\N	8	application/pdf	3	14572	Editorial.pdf	2	\N	\N	1	2021-11-14 22:33:52	2021-11-14 22:33:52	3	\N	\N
35	1	30	1	7	application/pdf	4	14572	Chapter 1: Interactions Affording Distan.pdf	4	\N	\N	1	2021-11-14 22:30:59	2021-11-14 22:33:05	25	\N	\N
41	1	\N	\N	9	application/pdf	4	14572	Imagining the Internet: Open, closed or .pdf	2	\N	\N	1	2021-11-14 22:34:20	2021-11-14 22:34:20	26	\N	\N
42	1	\N	\N	9	application/pdf	4	14572	The internet in LAC will remain free, pu.pdf	2	\N	\N	1	2021-11-14 22:34:30	2021-11-14 22:34:30	26	\N	\N
40	1	\N	\N	9	application/pdf	4	14572	Internet, openness and the future of the.pdf	2	\N	\N	1	2021-11-14 22:34:11	2021-11-14 22:34:11	26	\N	\N
62	1	\N	\N	14	application/pdf	4	14572	Chapter 1: Mind Control—Internal or Exte.pdf	2	\N	\N	1	2021-11-14 22:45:46	2021-11-14 22:45:46	31	\N	\N
63	1	\N	\N	14	application/pdf	4	14572	Chapter 2: Classical Music and the Class.pdf	2	\N	\N	1	2021-11-14 22:45:55	2021-11-14 22:45:55	31	\N	\N
64	1	\N	\N	14	application/pdf	4	14572	Chapter 3: Situated Cognition and Bricol.pdf	2	\N	\N	1	2021-11-14 22:46:04	2021-11-14 22:46:04	31	\N	\N
65	1	\N	\N	14	application/pdf	4	14572	Chapter 4: Braitenberg’s Vehicle 2.pdf	2	\N	\N	1	2021-11-14 22:46:13	2021-11-14 22:46:13	31	\N	\N
66	1	\N	\N	14	application/pdf	13	14572	Segmentation of Vascular Ultrasound Imag.pdf	2	\N	\N	1	2021-11-14 22:46:23	2021-11-14 22:46:23	31	\N	\N
56	1	\N	\N	13	application/pdf	4	14572	Current State of Mobile Learning.pdf	2	\N	\N	1	2021-11-14 22:42:30	2021-11-14 22:42:30	30	\N	\N
43	1	\N	\N	9	application/pdf	4	14572	Free Internet?.pdf	2	\N	\N	1	2021-11-14 22:34:39	2021-11-14 22:34:39	26	\N	\N
44	1	\N	\N	9	application/pdf	4	14572	Risks and challenges for freedom of expr.pdf	2	\N	\N	1	2021-11-14 22:34:49	2021-11-14 22:34:49	26	\N	\N
45	1	40	1	9	application/pdf	4	14572	Internet, openness and the future of the.pdf	4	\N	\N	1	2021-11-14 22:34:11	2021-11-14 22:36:26	26	\N	\N
46	1	41	1	9	application/pdf	4	14572	Imagining the Internet: Open, closed or .pdf	4	\N	\N	1	2021-11-14 22:34:20	2021-11-14 22:36:26	26	\N	\N
47	1	42	1	9	application/pdf	4	14572	The internet in LAC will remain free, pu.pdf	4	\N	\N	1	2021-11-14 22:34:30	2021-11-14 22:36:26	26	\N	\N
48	1	43	1	9	application/pdf	4	14572	Free Internet?.pdf	4	\N	\N	1	2021-11-14 22:34:39	2021-11-14 22:36:26	26	\N	\N
49	1	44	1	9	application/pdf	4	14572	Risks and challenges for freedom of expr.pdf	4	\N	\N	1	2021-11-14 22:34:49	2021-11-14 22:36:26	26	\N	\N
50	1	\N	\N	10	application/pdf	3	14572	Lost Tracks: Buffalo National Park, 1909-1939.pdf	2	\N	\N	1	2021-11-14 22:36:46	2021-11-14 22:36:46	27	\N	\N
51	1	\N	\N	11	application/pdf	3	14572	Dreamwork.pdf	2	\N	\N	1	2021-11-14 22:37:55	2021-11-14 22:37:55	28	\N	\N
52	1	51	1	11	application/pdf	3	14572	Dreamwork.pdf	4	\N	\N	1	2021-11-14 22:37:55	2021-11-14 22:38:19	28	\N	\N
57	1	\N	\N	13	application/pdf	4	14572	A Model for Framing Mobile Learning.pdf	2	\N	\N	1	2021-11-14 22:42:39	2021-11-14 22:42:39	30	\N	\N
58	1	\N	\N	13	application/pdf	4	14572	Mobile Distance Learning with PDAs: Deve.pdf	2	\N	\N	1	2021-11-14 22:42:48	2021-11-14 22:42:48	30	\N	\N
59	1	56	1	13	application/pdf	4	14572	Current State of Mobile Learning.pdf	4	\N	\N	1	2021-11-14 22:42:30	2021-11-14 22:43:49	30	\N	\N
60	1	57	1	13	application/pdf	4	14572	A Model for Framing Mobile Learning.pdf	4	\N	\N	1	2021-11-14 22:42:39	2021-11-14 22:43:49	30	\N	\N
61	1	58	1	13	application/pdf	4	14572	Mobile Distance Learning with PDAs: Deve.pdf	4	\N	\N	1	2021-11-14 22:42:48	2021-11-14 22:43:49	30	\N	\N
67	1	\N	\N	14	application/pdf	13	14572	The Canadian Nutrient File: Nutrient Val.pdf	2	\N	\N	1	2021-11-14 22:46:35	2021-11-14 22:46:35	31	\N	\N
68	1	62	1	14	application/pdf	4	14572	Chapter 1: Mind Control—Internal or Exte.pdf	4	\N	\N	1	2021-11-14 22:45:46	2021-11-14 22:48:01	31	\N	\N
53	1	\N	\N	12	application/pdf	4	14572	Catalyzing Access through Social and Tec.pdf	2	\N	\N	1	2021-11-14 22:39:45	2021-11-14 22:39:45	29	\N	\N
54	1	\N	\N	12	application/pdf	4	14572	Catalyzing Access via Telecommunications.pdf	2	\N	\N	1	2021-11-14 22:39:54	2021-11-14 22:39:54	29	\N	\N
55	1	\N	\N	12	application/pdf	4	14572	Access to Knowledge as a New Paradigm fo.pdf	2	\N	\N	1	2021-11-14 22:40:03	2021-11-14 22:40:03	29	\N	\N
69	1	63	1	14	application/pdf	4	14572	Chapter 2: Classical Music and the Class.pdf	4	\N	\N	1	2021-11-14 22:45:55	2021-11-14 22:48:02	31	\N	\N
70	1	64	1	14	application/pdf	4	14572	Chapter 3: Situated Cognition and Bricol.pdf	4	\N	\N	1	2021-11-14 22:46:04	2021-11-14 22:48:02	31	\N	\N
71	1	65	1	14	application/pdf	4	14572	Chapter 4: Braitenberg’s Vehicle 2.pdf	4	\N	\N	1	2021-11-14 22:46:13	2021-11-14 22:48:02	31	\N	\N
72	1	66	1	14	application/pdf	13	14572	Segmentation of Vascular Ultrasound Imag.pdf	4	\N	\N	1	2021-11-14 22:46:23	2021-11-14 22:48:02	31	\N	\N
73	1	67	1	14	application/pdf	13	14572	The Canadian Nutrient File: Nutrient Val.pdf	4	\N	\N	1	2021-11-14 22:46:35	2021-11-14 22:48:02	31	\N	\N
74	1	62	1	14	application/pdf	4	14572	Chapter 1: Mind Control—Internal or Exte.pdf	10	0	openAccess	1	2021-11-14 22:45:46	2021-11-14 22:49:40	31	521	2
75	1	63	1	14	application/pdf	4	14572	Chapter 2: Classical Music and the Class.pdf	10	0	openAccess	1	2021-11-14 22:45:55	2021-11-14 22:49:40	31	521	2
76	1	64	1	14	application/pdf	4	14572	Chapter 3: Situated Cognition and Bricol.pdf	10	0	openAccess	1	2021-11-14 22:46:04	2021-11-14 22:49:40	31	521	2
77	1	65	1	14	application/pdf	4	14572	Chapter 4: Braitenberg’s Vehicle 2.pdf	10	0	openAccess	1	2021-11-14 22:46:13	2021-11-14 22:49:40	31	521	2
78	1	66	1	14	application/pdf	13	14572	Segmentation of Vascular Ultrasound Imag.pdf	10	0	openAccess	1	2021-11-14 22:46:23	2021-11-14 22:49:40	31	521	2
79	1	67	1	14	application/pdf	13	14572	The Canadian Nutrient File: Nutrient Val.pdf	10	0	openAccess	1	2021-11-14 22:46:35	2021-11-14 22:49:41	31	521	2
80	1	\N	\N	15	application/pdf	3	14572	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	2	\N	\N	1	2021-11-14 22:51:05	2021-11-14 22:51:05	32	\N	\N
81	1	80	1	15	application/pdf	3	14572	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	4	\N	\N	1	2021-11-14 22:51:05	2021-11-14 22:51:36	32	\N	\N
82	1	\N	\N	16	application/pdf	3	14572	A Designer's Log: Case Studies in Instructional Design.pdf	2	\N	\N	1	2021-11-14 22:51:52	2021-11-14 22:51:52	33	\N	\N
83	1	\N	\N	17	application/pdf	4	14572	Preface.pdf	2	\N	\N	1	2021-11-14 22:53:23	2021-11-14 22:53:23	34	\N	\N
84	1	\N	\N	17	application/pdf	4	14572	Introduction.pdf	2	\N	\N	1	2021-11-14 22:53:33	2021-11-14 22:53:33	34	\N	\N
85	1	\N	\N	17	application/pdf	4	14572	The Emergence of Open Development in a N.pdf	2	\N	\N	1	2021-11-14 22:53:42	2021-11-14 22:53:42	34	\N	\N
86	1	\N	\N	17	application/pdf	4	14572	Enacting Openness in ICT4D Research.pdf	2	\N	\N	1	2021-11-14 22:53:51	2021-11-14 22:53:51	34	\N	\N
87	1	\N	\N	17	application/pdf	4	14572	Transparency and Development: Ethical Co.pdf	2	\N	\N	1	2021-11-14 22:54:01	2021-11-14 22:54:01	34	\N	\N
88	1	\N	\N	17	application/pdf	4	14572	Open Educational Resources: Opportunitie.pdf	2	\N	\N	1	2021-11-14 22:54:11	2021-11-14 22:54:11	34	\N	\N
89	1	83	1	17	application/pdf	4	14572	Preface.pdf	4	\N	\N	1	2021-11-14 22:53:23	2021-11-14 22:56:38	34	\N	\N
90	1	84	1	17	application/pdf	4	14572	Introduction.pdf	4	\N	\N	1	2021-11-14 22:53:33	2021-11-14 22:56:38	34	\N	\N
91	1	85	1	17	application/pdf	4	14572	The Emergence of Open Development in a N.pdf	4	\N	\N	1	2021-11-14 22:53:42	2021-11-14 22:56:38	34	\N	\N
92	1	86	1	17	application/pdf	4	14572	Enacting Openness in ICT4D Research.pdf	4	\N	\N	1	2021-11-14 22:53:51	2021-11-14 22:56:38	34	\N	\N
93	1	87	1	17	application/pdf	4	14572	Transparency and Development: Ethical Co.pdf	4	\N	\N	1	2021-11-14 22:54:01	2021-11-14 22:56:38	34	\N	\N
94	1	88	1	17	application/pdf	4	14572	Open Educational Resources: Opportunitie.pdf	4	\N	\N	1	2021-11-14 22:54:11	2021-11-14 22:56:38	34	\N	\N
\.


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	chantal
2	allan
3	university
4	southern
5	california
6	bomb
7	canada
8	unkind
9	remarks
10	american
11	media
12	united
13	states
14	nations
15	border
16	continent
17	anti-american
18	sentiment
19	documented
20	americans
21	northern
22	neighbour
23	examines
24	portrayed
25	confederation
26	obama’s
27	election
28	examining
29	major
30	events
31	tested
32	bilateral
33	relations
34	tracks
35	history
36	anti-canadianism
37	informative
38	thought
39	provoking
40	times
41	hilarious
42	book
43	reveals
44	layer
45	complex
46	relationship
47	michael
48	dawson
49	alberta
50	brian
51	dupuis
52	athabasca
53	wilson
54	calgary
55	bricks
56	brains
57	embodied
58	cognitive
59	science
60	lego
61	robots
62	introduces
63	illustrates
64	foundational
65	ideas
66	construction
67	observation
68	mindstorms
69	discussing
70	characteristics
71	distinguish
72	classical
73	places
74	renewed
75	emphasis
76	sensing
77	acting
78	importance
79	embodiment
80	exploration
81	distributed
82	notions
83	control
84	development
85	theories
86	synthesizing
87	simple
88	systems
89	exploring
90	behaviour
91	numerous
92	examples
93	illustrate
94	key
95	theme
96	agent’s
97	environment
98	agents
99	capable
100	exhibiting
101	sense
102	affect
103	world
\.


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_search_object_keywords (object_id, keyword_id, pos) FROM stdin;
1	1	0
1	2	1
1	3	2
1	4	3
1	5	4
2	6	0
2	7	1
2	8	2
2	9	3
2	10	4
2	11	5
3	7	0
3	12	1
3	13	2
3	14	3
3	15	4
3	16	5
3	17	6
3	18	7
3	7	8
3	19	9
3	20	10
3	21	11
3	22	12
3	2	13
3	23	14
3	10	15
3	11	16
3	24	17
3	7	18
3	25	19
3	26	20
3	27	21
3	28	22
3	29	23
3	30	24
3	31	25
3	32	26
3	33	27
3	6	28
3	7	29
3	34	30
3	35	31
3	36	32
3	37	33
3	38	34
3	39	35
3	40	36
3	41	37
3	42	38
3	43	39
3	44	40
3	45	41
3	46	42
3	7	43
3	12	44
3	13	45
7	47	0
7	48	1
7	3	2
7	49	3
7	50	4
7	51	5
7	52	6
7	3	7
7	47	8
7	53	9
7	3	10
7	54	11
8	55	0
8	56	1
8	57	2
8	58	3
8	59	4
8	60	5
8	61	6
9	55	0
9	56	1
9	62	2
9	57	3
9	58	4
9	59	5
9	63	6
9	64	7
9	65	8
9	66	9
9	67	10
9	60	11
9	68	12
9	61	13
9	69	14
9	70	15
9	71	16
9	57	17
9	58	18
9	59	19
9	72	20
9	58	21
9	59	22
9	55	23
9	56	24
9	73	25
9	74	26
9	75	27
9	76	28
9	77	29
9	78	30
9	79	31
9	80	32
9	81	33
9	82	34
9	83	35
9	84	36
9	85	37
9	86	38
9	87	39
9	88	40
9	89	41
9	90	42
9	91	43
9	92	44
9	93	45
9	94	46
9	95	47
9	78	48
9	96	49
9	97	50
9	87	51
9	98	52
9	60	53
9	61	54
9	99	55
9	100	56
9	45	57
9	90	58
9	101	59
9	102	60
9	103	61
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
1	5	1	0
2	5	2	0
3	5	4	0
4	5	8	0
5	5	32	0
6	5	64	0
7	14	1	0
8	14	2	0
9	14	4	0
10	14	8	0
11	14	32	0
12	14	64	0
\.


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
11		workType	2
4		workType	1
1		workType	2
17		workType	1
7		workType	1
8		workType	2
2		workType	1
12		workType	1
14		workType	1
5		workType	2
3		workType	2
9		workType	1
15		workType	2
6		workType	1
10		workType	2
13		workType	1
16		workType	2
\.


--
-- Data for Name: submission_supplementary_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_supplementary_files (file_id, revision) FROM stdin;
66	1
67	1
72	1
73	1
78	1
79	1
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submissions (submission_id, context_id, locale, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, status, submission_progress, work_type) FROM stdin;
11	1	\N	11	2021-11-14 22:39:26	2021-11-14 22:38:10	2021-11-14 22:38:47	4	1	0	0
4	1	\N	4	2021-11-14 22:25:36	2021-11-14 22:24:20	2021-11-14 22:24:20	5	1	0	0
1	1	\N	1	2021-11-14 22:19:05	2021-11-14 22:18:37	2021-11-14 22:18:37	4	1	0	0
17	1	\N	17	2021-11-14 22:57:04	2021-11-14 22:56:18	2021-11-14 22:56:18	2	1	0	0
7	1	\N	7	2021-11-14 22:33:36	2021-11-14 22:32:52	2021-11-14 22:32:52	4	1	0	0
8	1	\N	8	2021-11-14 22:33:58	2021-11-14 22:33:58	2021-11-14 22:33:58	1	1	0	0
2	1	\N	2	2021-11-14 22:21:51	2021-11-14 22:21:15	2021-11-14 22:21:15	3	1	0	0
12	1	\N	12	2021-11-14 22:42:15	2021-11-14 22:41:15	2021-11-14 22:41:52	2	1	0	0
14	1	\N	14	2021-11-14 22:50:50	2021-11-14 22:47:45	2021-11-14 22:47:45	5	3	0	0
5	1	\N	5	2021-11-14 22:28:03	2021-11-14 22:26:28	2021-11-14 22:26:28	5	3	0	0
3	1	\N	3	2021-11-14 22:22:37	2021-11-14 22:22:37	2021-11-14 22:22:37	1	1	0	0
9	1	\N	9	2021-11-14 22:36:26	2021-11-14 22:36:11	2021-11-14 22:36:11	2	1	0	0
15	1	\N	15	2021-11-14 22:51:36	2021-11-14 22:51:25	2021-11-14 22:51:25	3	1	0	0
6	1	\N	6	2021-11-14 22:30:23	2021-11-14 22:29:44	2021-11-14 22:29:44	2	1	0	0
10	1	\N	10	2021-11-14 22:37:42	2021-11-14 22:37:41	2021-11-14 22:37:41	1	1	0	0
13	1	\N	13	2021-11-14 22:45:25	2021-11-14 22:43:35	2021-11-14 22:44:34	4	1	0	0
16	1	\N	16	2021-11-14 22:53:09	2021-11-14 22:52:22	2021-11-14 22:52:44	3	1	0	0
\.


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
\.


--
-- Data for Name: usage_stats_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_temporary_records (assoc_id, assoc_type, day, entry_time, metric, country_id, region, city, load_id, file_type) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_group_settings (user_group_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Site Admin	string
2		nameLocaleKey	default.groups.name.manager	string
2		abbrevLocaleKey	default.groups.abbrev.manager	string
3		nameLocaleKey	default.groups.name.editor	string
3		abbrevLocaleKey	default.groups.abbrev.editor	string
4		nameLocaleKey	default.groups.name.productionEditor	string
4		abbrevLocaleKey	default.groups.abbrev.productionEditor	string
5		nameLocaleKey	default.groups.name.sectionEditor	string
5		abbrevLocaleKey	default.groups.abbrev.sectionEditor	string
6		nameLocaleKey	default.groups.name.copyeditor	string
6		abbrevLocaleKey	default.groups.abbrev.copyeditor	string
7		nameLocaleKey	default.groups.name.designer	string
7		abbrevLocaleKey	default.groups.abbrev.designer	string
8		nameLocaleKey	default.groups.name.funding	string
8		abbrevLocaleKey	default.groups.abbrev.funding	string
9		nameLocaleKey	default.groups.name.indexer	string
9		abbrevLocaleKey	default.groups.abbrev.indexer	string
10		nameLocaleKey	default.groups.name.layoutEditor	string
10		abbrevLocaleKey	default.groups.abbrev.layoutEditor	string
11		nameLocaleKey	default.groups.name.marketing	string
11		abbrevLocaleKey	default.groups.abbrev.marketing	string
12		nameLocaleKey	default.groups.name.proofreader	string
12		abbrevLocaleKey	default.groups.abbrev.proofreader	string
13		nameLocaleKey	default.groups.name.author	string
13		abbrevLocaleKey	default.groups.abbrev.author	string
14		nameLocaleKey	default.groups.name.volumeEditor	string
14		abbrevLocaleKey	default.groups.abbrev.volumeEditor	string
15		nameLocaleKey	default.groups.name.chapterAuthor	string
15		abbrevLocaleKey	default.groups.abbrev.chapterAuthor	string
16		nameLocaleKey	default.groups.name.translator	string
16		abbrevLocaleKey	default.groups.abbrev.translator	string
17		nameLocaleKey	default.groups.name.internalReviewer	string
17		abbrevLocaleKey	default.groups.abbrev.internalReviewer	string
18		nameLocaleKey	default.groups.name.externalReviewer	string
18		abbrevLocaleKey	default.groups.abbrev.externalReviewer	string
19		nameLocaleKey	default.groups.name.reader	string
19		abbrevLocaleKey	default.groups.abbrev.reader	string
2	en_US	name	Press manager	string
2	en_US	abbrev	PM	string
3	en_US	name	Press editor	string
3	en_US	abbrev	PE	string
4	en_US	name	Production editor	string
4	en_US	abbrev	ProdE	string
5	en_US	name	Series editor	string
5	en_US	abbrev	AcqE	string
6	en_US	name	Copyeditor	string
6	en_US	abbrev	CE	string
7	en_US	name	Designer	string
7	en_US	abbrev	Design	string
8	en_US	name	Funding coordinator	string
8	en_US	abbrev	FC	string
9	en_US	name	Indexer	string
9	en_US	abbrev	IND	string
10	en_US	name	Layout Editor	string
10	en_US	abbrev	LE	string
11	en_US	name	Marketing and sales coordinator	string
11	en_US	abbrev	MS	string
12	en_US	name	Proofreader	string
12	en_US	abbrev	PR	string
13	en_US	name	Author	string
13	en_US	abbrev	AU	string
15	en_US	name	Chapter Author	string
15	en_US	abbrev	CA	string
16	en_US	name	Translator	string
16	en_US	abbrev	Trans	string
17	en_US	name	Internal Reviewer	string
17	en_US	abbrev	IR	string
18	en_US	name	External Reviewer	string
18	en_US	abbrev	ER	string
19	en_US	name	Reader	string
19	en_US	abbrev	Read	string
2	fr_CA	name	Gestionnaire de la presse	string
2	fr_CA	abbrev	MP	string
3	fr_CA	name	Rédacteur/Rédactrice en chef de la presse	string
3	fr_CA	abbrev	RP	string
4	fr_CA	name	Directeur-trice de production	string
4	fr_CA	abbrev	DirProd	string
5	fr_CA	name	Rédacteur/Rédactrice en chef de la série	string
5	fr_CA	abbrev	RS	string
6	fr_CA	name	Réviseur-e	string
6	fr_CA	abbrev	RÉV	string
7	fr_CA	name	Designer	string
7	fr_CA	abbrev	Design	string
8	fr_CA	name	Coordonnateur-trice du financement	string
8	fr_CA	abbrev	CF	string
9	fr_CA	name	Indexeur-e	string
9	fr_CA	abbrev	Indx	string
10	fr_CA	name	Responsable de la mise en page	string
10	fr_CA	abbrev	RespMP	string
11	fr_CA	name	Coordonnateur-trice des ventes et du marketing	string
11	fr_CA	abbrev	CVM	string
12	fr_CA	name	Correcteur-trice d'épreuves	string
12	fr_CA	abbrev	CorEp	string
13	fr_CA	name	Auteur-e	string
13	fr_CA	abbrev	AU	string
15	fr_CA	name	Auteur du chapitre	string
15	fr_CA	abbrev	AC	string
16	fr_CA	name	Traducteur-trice	string
16	fr_CA	abbrev	Trad	string
17	fr_CA	name	Évaluateur-trice interne	string
17	fr_CA	abbrev	EvalInt	string
18	fr_CA	name	##default.groups.name.externalReviewer##	string
18	fr_CA	abbrev	##default.groups.abbrev.externalReviewer##	string
19	fr_CA	name	Lecteur-trice	string
19	fr_CA	abbrev	Lect	string
14	en_US	name	Volume editor	string
14	fr_CA	name	Rédacteur/Rédactrice en chef du volume	string
14	en_US	abbrev	VE	string
14	fr_CA	abbrev	RV	string
14		recommendOnly	0	bool
\.


--
-- Data for Name: user_group_stage; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_group_stage (context_id, user_group_id, stage_id) FROM stdin;
1	3	1
1	3	2
1	3	3
1	3	4
1	3	5
1	4	4
1	4	5
1	5	1
1	5	2
1	5	3
1	5	4
1	5	5
1	6	4
1	7	5
1	8	1
1	8	2
1	8	3
1	9	5
1	10	5
1	11	4
1	12	5
1	13	1
1	13	2
1	13	3
1	13	4
1	13	5
1	15	4
1	15	5
1	16	1
1	16	2
1	16	3
1	16	4
1	16	5
1	17	2
1	18	3
1	14	1
1	14	2
1	14	3
1	14	4
1	14	5
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_groups (user_group_id, context_id, role_id, is_default, show_title, permit_self_registration, permit_metadata_edit) FROM stdin;
1	0	1	1	0	0	0
2	1	16	1	0	0	1
3	1	16	1	0	0	1
4	1	16	1	0	0	1
5	1	17	1	0	0	1
6	1	4097	1	0	0	0
7	1	4097	1	0	0	0
8	1	4097	1	0	0	0
9	1	4097	1	0	0	0
10	1	4097	1	0	0	0
11	1	4097	1	0	0	0
12	1	4097	1	0	0	0
13	1	65536	1	0	1	0
15	1	65536	1	0	1	0
16	1	65536	1	0	0	0
17	1	4096	1	0	0	0
18	1	4096	1	0	1	0
19	1	1048576	1	0	1	0
14	1	65536	1	0	1	0
\.


--
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_interests (user_id, controlled_vocab_entry_id) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_settings (user_id, locale, setting_name, assoc_type, assoc_id, setting_value, setting_type) FROM stdin;
7	fr_CA	familyName	0	0		string
7	en_US	preferredPublicName	0	0		string
7	fr_CA	preferredPublicName	0	0		string
7		orcid	0	0		string
1	en_US	familyName	0	0	admin	string
3	fr_CA	biography	0	0		string
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
7	en_US	biography	0	0		string
7	fr_CA	biography	0	0		string
7	en_US	signature	0	0		string
7	fr_CA	signature	0	0		string
7	en_US	affiliation	0	0	Utrecht University	string
7	fr_CA	affiliation	0	0		string
7	en_US	givenName	0	0	Julie	string
7	fr_CA	givenName	0	0		string
7	en_US	familyName	0	0	Janssen	string
9	en_US	biography	0	0		string
9	fr_CA	biography	0	0		string
9	en_US	signature	0	0		string
9	fr_CA	signature	0	0		string
2	fr_CA	signature	0	0		string
2	fr_CA	affiliation	0	0		string
2	en_US	givenName	0	0	Ramiro	string
2	fr_CA	givenName	0	0		string
2	en_US	familyName	0	0	Vaca	string
2	fr_CA	familyName	0	0		string
2	en_US	preferredPublicName	0	0		string
2	fr_CA	preferredPublicName	0	0		string
2		orcid	0	0		string
1	en_US	givenName	0	0	admin	string
2	fr_CA	biography	0	0		string
2	en_US	signature	0	0		string
3	en_US	signature	0	0		string
3	fr_CA	affiliation	0	0		string
3	en_US	givenName	0	0	Daniel	string
3	fr_CA	familyName	0	0		string
3	en_US	preferredPublicName	0	0		string
3	fr_CA	signature	0	0		string
3	en_US	affiliation	0	0	University of Melbourne	string
3	fr_CA	givenName	0	0		string
6	en_US	biography	0	0		string
8	en_US	biography	0	0		string
3		orcid	0	0		string
3	en_US	biography	0	0		string
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
3	en_US	familyName	0	0	Barnes	string
8	fr_CA	biography	0	0		string
8	en_US	signature	0	0		string
8	fr_CA	signature	0	0		string
8	fr_CA	affiliation	0	0		string
8	en_US	givenName	0	0	Paul	string
8	fr_CA	givenName	0	0		string
8	en_US	familyName	0	0	Hudson	string
8	fr_CA	familyName	0	0		string
8	en_US	preferredPublicName	0	0		string
8	fr_CA	preferredPublicName	0	0		string
8		orcid	0	0		string
3	fr_CA	preferredPublicName	0	0		string
9	en_US	affiliation	0	0	University of Manitoba	string
9	fr_CA	affiliation	0	0		string
9	en_US	givenName	0	0	Aisla	string
9	fr_CA	givenName	0	0		string
9	en_US	familyName	0	0	McCrae	string
9	fr_CA	familyName	0	0		string
9	en_US	preferredPublicName	0	0		string
9	fr_CA	preferredPublicName	0	0		string
9		orcid	0	0		string
11	en_US	biography	0	0		string
11	fr_CA	biography	0	0		string
11	en_US	signature	0	0		string
11	fr_CA	signature	0	0		string
11	en_US	affiliation	0	0	KNUST	string
11	fr_CA	affiliation	0	0		string
11	en_US	givenName	0	0	Al	string
11	fr_CA	givenName	0	0		string
11	en_US	familyName	0	0	Zacharia	string
11	fr_CA	familyName	0	0		string
11	en_US	preferredPublicName	0	0		string
11	fr_CA	preferredPublicName	0	0		string
11		orcid	0	0		string
13	en_US	biography	0	0		string
13	fr_CA	biography	0	0		string
13	en_US	signature	0	0		string
13	fr_CA	signature	0	0		string
13	en_US	affiliation	0	0	Ghent University	string
13	fr_CA	affiliation	0	0		string
13	en_US	givenName	0	0	Maria	string
13	fr_CA	givenName	0	0		string
13	en_US	familyName	0	0	Fritz	string
13	fr_CA	familyName	0	0		string
13	en_US	preferredPublicName	0	0		string
13	fr_CA	preferredPublicName	0	0		string
13		orcid	0	0		string
14	en_US	biography	0	0		string
14	fr_CA	biography	0	0		string
14	en_US	signature	0	0		string
14	fr_CA	signature	0	0		string
14	en_US	affiliation	0	0	Universidad de Chile	string
14	fr_CA	affiliation	0	0		string
14	en_US	givenName	0	0	Sarah	string
14	fr_CA	givenName	0	0		string
14	en_US	familyName	0	0	Vogt	string
14	fr_CA	familyName	0	0		string
14	en_US	preferredPublicName	0	0		string
14	fr_CA	preferredPublicName	0	0		string
14		orcid	0	0		string
15	en_US	biography	0	0		string
15	fr_CA	biography	0	0		string
15	en_US	signature	0	0		string
15	fr_CA	signature	0	0		string
15	en_US	affiliation	0	0	Duke University	string
15	fr_CA	affiliation	0	0		string
15	en_US	givenName	0	0	Graham	string
15	fr_CA	givenName	0	0		string
15	en_US	familyName	0	0	Cox	string
15	fr_CA	familyName	0	0		string
15	en_US	preferredPublicName	0	0		string
15	fr_CA	preferredPublicName	0	0		string
15		orcid	0	0		string
16	en_US	biography	0	0		string
16	fr_CA	biography	0	0		string
16	en_US	signature	0	0		string
16	fr_CA	signature	0	0		string
16	en_US	affiliation	0	0	University of Cape Town	string
16	fr_CA	affiliation	0	0		string
16	en_US	givenName	0	0	Stephen	string
16	fr_CA	givenName	0	0		string
16	en_US	familyName	0	0	Hellier	string
16	fr_CA	familyName	0	0		string
16	en_US	preferredPublicName	0	0		string
10	en_US	signature	0	0		string
10	fr_CA	affiliation	0	0		string
10	en_US	givenName	0	0	Adela	string
10	fr_CA	givenName	0	0		string
10	en_US	familyName	0	0	Gallego	string
10	fr_CA	familyName	0	0		string
10	en_US	preferredPublicName	0	0		string
10	fr_CA	preferredPublicName	0	0		string
10		orcid	0	0		string
12	en_US	biography	0	0		string
12	fr_CA	biography	0	0		string
12	en_US	signature	0	0		string
12	fr_CA	signature	0	0		string
12	fr_CA	affiliation	0	0		string
12	en_US	givenName	0	0	Gonzalo	string
12	fr_CA	givenName	0	0		string
12	en_US	familyName	0	0	Favio	string
12	fr_CA	familyName	0	0		string
12	en_US	preferredPublicName	0	0		string
12	fr_CA	preferredPublicName	0	0		string
12		orcid	0	0		string
10	fr_CA	signature	0	0		string
10	en_US	affiliation	0	0	State University of New York	string
16	fr_CA	preferredPublicName	0	0		string
16		orcid	0	0		string
17	en_US	biography	0	0		string
17	fr_CA	biography	0	0		string
17	en_US	signature	0	0		string
17	fr_CA	signature	0	0		string
17	en_US	affiliation	0	0	Imperial College London	string
17	fr_CA	affiliation	0	0		string
17	en_US	givenName	0	0	Catherine	string
17	fr_CA	givenName	0	0		string
17	en_US	familyName	0	0	Turner	string
17	fr_CA	familyName	0	0		string
17	en_US	preferredPublicName	0	0		string
17	fr_CA	preferredPublicName	0	0		string
17		orcid	0	0		string
18	en_US	biography	0	0		string
18	fr_CA	biography	0	0		string
18	en_US	signature	0	0		string
18	fr_CA	signature	0	0		string
18	en_US	affiliation	0	0	National University of Singapore	string
18	fr_CA	affiliation	0	0		string
18	en_US	givenName	0	0	Sabine	string
18	fr_CA	givenName	0	0		string
18	en_US	familyName	0	0	Kumar	string
18	fr_CA	familyName	0	0		string
18	en_US	preferredPublicName	0	0		string
18	fr_CA	preferredPublicName	0	0		string
18		orcid	0	0		string
26	en_US	givenName	0	0	Fernando	string
26	en_US	familyName	0	0	Perini	string
2	en_US	biography	0	0		string
2	en_US	affiliation	0	0	Universidad Nacional Autónoma de México	string
19	en_US	affiliation	0	0	University of Calgary	string
19	en_US	givenName	0	0	Arthur	string
19	en_US	familyName	0	0	Clark	string
20	en_US	affiliation	0	0	Athabasca University	string
20	en_US	givenName	0	0	Alvin	string
20	en_US	familyName	0	0	Finkel	string
21	en_US	affiliation	0	0	Athabasca University	string
21	en_US	givenName	0	0	Bob	string
21	en_US	familyName	0	0	Barnetson	string
22	en_US	affiliation	0	0	University of British Columbia	string
22	en_US	givenName	0	0	Bart	string
22	en_US	familyName	0	0	Beaty	string
23	en_US	affiliation	0	0	University of Southern California	string
23	en_US	givenName	0	0	Chantal	string
23	en_US	familyName	0	0	Allan	string
24	en_US	affiliation	0	0	SUNY	string
24	en_US	givenName	0	0	Deborah	string
24	en_US	familyName	0	0	Bernnard	string
25	en_US	affiliation	0	0	Athabasca University	string
25	en_US	givenName	0	0	Dietmar	string
25	en_US	familyName	0	0	Kennepohl	string
26	en_US	affiliation	0	0	University of Sussex	string
27	en_US	affiliation	0	0	Buffalo National Park Foundation	string
27	en_US	givenName	0	0	Jennifer	string
27	en_US	familyName	0	0	Brower	string
28	en_US	affiliation	0	0	University of Alberta	string
28	en_US	givenName	0	0	Jonathan	string
28	en_US	familyName	0	0	Locke Hart	string
29	en_US	affiliation	0	0	International Development Research Centre	string
29	en_US	givenName	0	0	Laurent	string
29	en_US	familyName	0	0	Elder	string
8	en_US	affiliation	0	0	McGill University	string
30	en_US	affiliation	0	0	Athabasca University	string
30	en_US	givenName	0	0	Mohamed	string
30	en_US	familyName	0	0	Ally	string
10	fr_CA	biography	0	0		string
12	en_US	affiliation	0	0	Madrid	string
31	en_US	affiliation	0	0	University of Alberta	string
31	en_US	givenName	0	0	Michael	string
31	en_US	familyName	0	0	Dawson	string
32	en_US	affiliation	0	0	University of Calgary	string
32	en_US	givenName	0	0	Max	string
32	en_US	familyName	0	0	Foran	string
33	en_US	affiliation	0	0	London School of Economics	string
33	en_US	givenName	0	0	Michael	string
33	en_US	familyName	0	0	Power	string
10	en_US	biography	0	0		string
34	en_US	affiliation	0	0	International Development Research Centre	string
34	en_US	givenName	0	0	Matthew	string
34	en_US	familyName	0	0	Smith	string
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_user_groups (user_group_id, user_id) FROM stdin;
1	1
2	1
2	2
3	3
5	4
5	5
5	6
17	7
17	8
17	9
18	10
18	11
18	12
6	13
6	14
10	15
10	16
12	17
12	18
19	19
13	19
19	20
14	20
19	21
13	21
19	22
14	22
19	23
13	23
19	24
14	24
19	25
14	25
13	3
19	26
14	26
19	27
13	27
19	28
13	28
19	29
14	29
19	30
14	30
19	31
14	31
19	32
13	32
19	33
13	33
19	34
14	34
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.users (user_id, username, password, email, url, phone, mailing_address, billing_address, country, locales, gossip, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help) FROM stdin;
6	minoue	$2y$10$xKz4qpOnYnziDdoS.BD2FeW3HmALKRnCZG4C/WcXPPe5fn/vJx/M6	minoue@mailinator.com				\N	JP		\N	\N	2021-11-14 22:15:11	\N	2021-11-14 22:30:12	0	\N	\N	0	\N	1
25	dkennepohl	$2y$10$YDHvvHmb4b1MpfSiDNlQbeAEalJefULP65/wHpbzOeeRcoSNVGxG6	dkennepohl@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:30:41	\N	2021-11-14 22:30:41	0	\N	\N	0	\N	1
30	mally	$2y$10$.neeFcl1hoU5JJe6C5tgr.yNYp78Kgx1LEo7AJ2AOGAzdyGqBw3H6	mally@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:42:21	\N	2021-11-14 22:42:22	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$ShWPiDqus4Ij6UPN4sas.O4/cnRZ.iNU2GWg7GqrmGI3S3Sz95pve	dbuskins@mailinator.com				\N	US		\N	\N	2021-11-14 22:14:56	\N	2021-11-14 22:14:56	0	\N	\N	0	\N	1
5	sberardo	$2y$10$MxYpGABT1rurv.qS5JSoP.YfFjHwDOr.d16/pH/Ryv.TnK6Z1usQO	sberardo@mailinator.com				\N	CA		\N	\N	2021-11-14 22:15:03	\N	2021-11-14 22:15:03	0	\N	\N	0	\N	1
7	jjanssen	$2y$10$SEJV8U2K5UPoRw56YyIDieMJRuj88dYGgJY308nk/ti60VQig88/y	jjanssen@mailinator.com				\N	NL		\N	\N	2021-11-14 22:15:19	\N	2021-11-14 22:15:19	0	\N	\N	0	\N	1
9	amccrae	$2y$10$DY/ZIWMrr9NyxQx19utqcu5UWxbmaOuXGSWomdn/8puQv6akc3.GO	amccrae@mailinator.com				\N	CA		\N	\N	2021-11-14 22:15:36	\N	2021-11-14 22:15:36	0	\N	\N	0	\N	1
11	alzacharia	$2y$10$6FaeT72IuuEsr5tuob745eS/IVOPCciobk3J6/s3Wx4ehAv.RWYn.	alzacharia@mailinator.com				\N	GH		\N	\N	2021-11-14 22:15:56	\N	2021-11-14 22:15:56	0	\N	\N	0	\N	1
13	mfritz	$2y$10$SoUVuxxwcatq75aTuAh8ZepYcG/und4oboX2/J84MB5wFsQ/gw9w6	mfritz@mailinator.com				\N	BE		\N	\N	2021-11-14 22:16:17	\N	2021-11-14 22:16:17	0	\N	\N	0	\N	1
14	svogt	$2y$10$GrlgvCZDcM6qk6JoGks8Fu3KjzZjXJuaoPDC/ngL0/6pejqueTRrW	svogt@mailinator.com				\N	CL		\N	\N	2021-11-14 22:16:29	\N	2021-11-14 22:16:29	0	\N	\N	0	\N	1
15	gcox	$2y$10$DgV8Ymrz5kxhcYJee9qUeuTi1gJ2IcexeDL9jpEot88OPuSMgGRPi	gcox@mailinator.com				\N	US		\N	\N	2021-11-14 22:16:41	\N	2021-11-14 22:16:41	0	\N	\N	0	\N	1
16	shellier	$2y$10$JWHVoJ8Ta9kV2u3tQIlj3.UMtqPDwhZdBAE8HX2z7aWiq4nzns9JC	shellier@mailinator.com				\N	ZA		\N	\N	2021-11-14 22:16:54	\N	2021-11-14 22:16:54	0	\N	\N	0	\N	1
17	cturner	$2y$10$gTHDlsD8WlJHdyHrZUn4r.cz/lC/pXB3uVAt.WdVl.V8PPJABixWO	cturner@mailinator.com				\N	GB		\N	\N	2021-11-14 22:17:08	\N	2021-11-14 22:17:08	0	\N	\N	0	\N	1
18	skumar	$2y$10$oRsQnNWE3W5E22iGHqmbDe18KuvCvxMxZNmuvYN612ocZBbICve3K	skumar@mailinator.com				\N	SG		\N	\N	2021-11-14 22:17:22	\N	2021-11-14 22:17:22	0	\N	\N	0	\N	1
26	fperini	$2y$10$YrWpb3MhGhkVEvwWEBnmW.ZgPF48CPRTeN0/938FbTCmd7hhFXAma	fperini@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:34:03	\N	2021-11-14 22:34:03	0	\N	\N	0	\N	1
2	rvaca	$2y$10$m9Yds/r9jzedDeDyFVOFj.nTj8A9mzken3Uxjy2r/pLi4aBm1e/2m	rvaca@mailinator.com				\N	MX		\N	\N	2021-11-14 22:14:43	\N	2021-11-14 22:17:35	0	\N	\N	0	\N	1
1	admin	$2y$10$c1Hx2jVFgTa2MRpbM0QBDeh0qQWMs6JayWaCwQnKvZB5SSD8fn7KW	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2021-11-14 22:13:45	\N	2021-11-14 22:17:40	0	\N	\N	0	\N	1
19	aclark	$2y$10$45ZQ5w95l5GViHVQA605geV.lHwG6HwImw2e716h4iQTQBNJTlmhq	aclark@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:18:07	\N	2021-11-14 22:18:07	0	\N	\N	0	\N	1
34	msmith	$2y$10$Zo/e8GRMreaKMc/EaOqGLeNlIgsoI2CIrsr0jY434nSDjU.dYOIr.	msmith@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:53:15	\N	2021-11-14 22:53:15	0	\N	\N	0	\N	1
20	afinkel	$2y$10$/zIe82I4p/lwDu37Tnw3B.vLI9J6a/.DYdPF7RHG/DITGOU3u3AZG	afinkel@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:19:12	\N	2021-11-14 22:19:12	0	\N	\N	0	\N	1
21	bbarnetson	$2y$10$VBjTu7WxXOXh6VFM5Tf2Nea.uWpSAZSJxV0QB2YoSoybE8t4HwO6O	bbarnetson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:21:57	\N	2021-11-14 22:21:57	0	\N	\N	0	\N	1
22	bbeaty	$2y$10$zLsbR5EA0IbSQCS316O6xOLdzQeKl3z3brI/ogH0LvNjBx.yzScY6	bbeaty@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:22:42	\N	2021-11-14 22:22:42	0	\N	\N	0	\N	1
27	jbrower	$2y$10$f5zbS2JuAvlOh0ssWC8r2OZjsgoCt/AMKkZCDdn/9oHgEakQZqVg2	jbrower@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:36:38	\N	2021-11-14 22:36:38	0	\N	\N	0	\N	1
23	callan	$2y$10$HeeoUoKgKAaqBg1kn/vEcOsiAE/n6YM2u2NYu02HrcV6/wjRwINBK	callan@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:25:44	\N	2021-11-14 22:25:44	0	\N	\N	0	\N	1
24	dbernnard	$2y$10$AvDhvpUEHQr2xOo0Ncw.6O/.sOwFRhCVwIhvoy/nOjlUbNrUUgZT2	dbernnard@mailinator.com	\N	\N	\N	\N	US		\N	\N	2021-11-14 22:28:09	\N	2021-11-14 22:28:09	0	\N	\N	0	\N	1
12	gfavio	$2y$10$sDyVcETaifNHKBc71tnoh.m2K71l1bhzAp2RfOu2v0oJCwZ6tYo86	gfavio@mailinator.com				\N	ES		\N	\N	2021-11-14 22:16:06	\N	2021-11-14 22:44:52	0	\N	\N	0	\N	1
28	jlockehart	$2y$10$OY32bhPHB0aSiU5YhJsfSOMw6P7W9nX5gT1AaepWcfGKeBHupJs/y	jlockehart@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:37:47	\N	2021-11-14 22:37:47	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$MJPf1QYkdG8zLVboJDmkbeizlITxhvbITNirYR7z4hvcwXFe0cPa2	dbarnes@mailinator.com				\N	AU		\N	\N	2021-11-14 22:14:49	\N	2021-11-14 22:56:20	0	\N	\N	0	\N	1
29	lelder	$2y$10$2AT7XGuqw3UbCHP7I/RNCeHeARoOBwp6y3/0rELrL6loVCRS9Dvtq	lelder@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:39:36	\N	2021-11-14 22:39:36	0	\N	\N	0	\N	1
8	phudson	$2y$10$OQpuhdxOkAbHDnS4WRjx9eKb1QanTxNDFt76eTS8EnY0BMa42m1t2	phudson@mailinator.com				\N	CA		\N	\N	2021-11-14 22:15:27	\N	2021-11-14 22:42:03	0	\N	\N	0	\N	1
31	mdawson	$2y$10$EmBxRFBJ6Lz3cpdaMEV1/e30KTM4YXx7YfNmYk5avGsCU1qduCXSO	mdawson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:45:37	\N	2021-11-14 22:45:37	0	\N	\N	0	\N	1
32	mforan	$2y$10$R/eqTZ1a/zQHEs2pbHUUA.fL8mY2xWTugp.3/ihHyjfXu6qcpcTQG	mforan@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:50:56	\N	2021-11-14 22:50:56	0	\N	\N	0	\N	1
33	mpower	$2y$10$khMvAtU6BqtX3SWnDaAZy.BsWXvkd2TcFoLu4u96C2nhnxpqqRvG.	mpower@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2021-11-14 22:51:44	\N	2021-11-14 22:51:44	0	\N	\N	0	\N	1
10	agallego	$2y$10$RXZgSPZ2Z77W7cyDLGkAAe4dMprRH.ZNRLCsGNKr/ebQi1neWTxv2	agallego@mailinator.com				\N	US		\N	\N	2021-11-14 22:15:46	\N	2021-11-14 22:52:58	0	\N	\N	0	\N	1
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2021-11-14 22:13:45	1	plugins.metadata	openurl10		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.metadata	dc11		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.metadata	mods34		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.pubIds	urn	URNPubIdPlugin	0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.pubIds	doi	DOIPubIdPlugin	0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.blocks	makeSubmission	MakeSubmissionBlockPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.blocks	information	InformationBlockPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	htmlMonographFile	HtmlMonographFilePlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	usageEvent		0	1
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	dublinCoreMeta	DublinCoreMetaPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	acron		0	1
1	2	0	0	2021-11-14 22:13:45	1	plugins.generic	staticPages	StaticPagesPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	2	0	0	2021-11-14 22:13:45	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	0	0	0	2021-11-14 22:13:45	1	plugins.themes	default	DefaultThemePlugin	1	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.importexport	onix30		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.importexport	users		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.importexport	csv		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.importexport	native		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.paymethod	paypal		0	0
1	0	0	0	2021-11-14 22:13:45	1	plugins.paymethod	manual		0	0
3	2	0	3	2021-11-14 22:13:44	1	core	omp		0	1
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.access_keys_access_key_id_seq', 1, false);


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.announcement_types_type_id_seq', 1, false);


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.announcements_announcement_id_seq', 1, false);


--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.auth_sources_auth_id_seq', 1, false);


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 57, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.citations_citation_id_seq', 1, false);


--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.completed_payments_completed_payment_id_seq', 1, false);


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 67, true);


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 29915, true);


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 4, true);


--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 2, true);


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 30, true);


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 1, false);


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 42, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_templates_email_id_seq', 1, false);


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 240, true);


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 25, true);


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 25, true);


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 15, true);


--
-- Name: identification_codes_identification_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.identification_codes_identification_code_id_seq', 1, false);


--
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.library_files_file_id_seq', 1, false);


--
-- Name: markets_market_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.markets_market_id_seq', 1, false);


--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.metadata_descriptions_metadata_description_id_seq', 1, false);


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 22, true);


--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.navigation_menu_items_navigation_menu_item_id_seq', 23, true);


--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.navigation_menus_navigation_menu_id_seq', 3, true);


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 1, true);


--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notification_mail_list_notification_mail_list_id_seq', 1, false);


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 16, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 432, true);


--
-- Name: presses_press_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.presses_press_id_seq', 1, true);


--
-- Name: publication_dates_publication_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.publication_dates_publication_date_id_seq', 1, false);


--
-- Name: publication_formats_publication_format_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.publication_formats_publication_format_id_seq', 2, true);


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 17, true);


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.queries_query_id_seq', 1, true);


--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.queued_payments_queued_payment_id_seq', 1, false);


--
-- Name: representatives_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.representatives_representative_id_seq', 1, false);


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_assignments_review_id_seq', 25, true);


--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_form_elements_review_form_element_id_seq', 1, false);


--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_forms_review_form_id_seq', 1, false);


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_rounds_review_round_id_seq', 19, true);


--
-- Name: sales_rights_sales_rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.sales_rights_sales_rights_id_seq', 1, false);


--
-- Name: series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.series_series_id_seq', 5, true);


--
-- Name: spotlights_spotlight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.spotlights_spotlight_id_seq', 1, false);


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 45, true);


--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.static_pages_static_page_id_seq', 1, false);


--
-- Name: submission_chapters_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_chapters_chapter_id_seq', 71, true);


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 3, true);


--
-- Name: submission_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_files_file_id_seq', 94, true);


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 103, true);


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 12, true);


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submissions_submission_id_seq', 17, true);


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.temporary_files_file_id_seq', 1, false);


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 19, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 34, true);


--
-- Name: access_keys access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_types announcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (type_id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcement_id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (auth_id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: citations citations_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: completed_payments completed_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.completed_payments
    ADD CONSTRAINT completed_payments_pkey PRIMARY KEY (completed_payment_id);


--
-- Name: controlled_vocab_entries controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocabs controlled_vocabs_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocabs_pkey PRIMARY KEY (controlled_vocab_id);


--
-- Name: data_object_tombstone_oai_set_objects data_object_tombstone_oai_set_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_pkey PRIMARY KEY (object_id);


--
-- Name: data_object_tombstones data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: edit_decisions edit_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_pkey PRIMARY KEY (edit_decision_id);


--
-- Name: email_log email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (log_id);


--
-- Name: email_templates_default email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (email_id);


--
-- Name: event_log event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: filter_groups filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: identification_codes identification_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.identification_codes
    ADD CONSTRAINT identification_codes_pkey PRIMARY KEY (identification_code_id);


--
-- Name: library_files library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: markets markets_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (market_id);


--
-- Name: metadata_descriptions metadata_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metadata_descriptions
    ADD CONSTRAINT metadata_descriptions_pkey PRIMARY KEY (metadata_description_id);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_items navigation_menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_pkey PRIMARY KEY (navigation_menu_item_id);


--
-- Name: navigation_menus navigation_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menus
    ADD CONSTRAINT navigation_menus_pkey PRIMARY KEY (navigation_menu_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_subscription_settings notification_subscription_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_pkey PRIMARY KEY (setting_id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: presses presses_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses
    ADD CONSTRAINT presses_pkey PRIMARY KEY (press_id);


--
-- Name: publication_dates publication_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_dates
    ADD CONSTRAINT publication_dates_pkey PRIMARY KEY (publication_date_id);


--
-- Name: publication_formats publication_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats
    ADD CONSTRAINT publication_formats_pkey PRIMARY KEY (publication_format_id);


--
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (publication_id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (query_id);


--
-- Name: queued_payments queued_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queued_payments
    ADD CONSTRAINT queued_payments_pkey PRIMARY KEY (queued_payment_id);


--
-- Name: representatives representatives_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.representatives
    ADD CONSTRAINT representatives_pkey PRIMARY KEY (representative_id);


--
-- Name: review_assignments review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_form_elements review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_forms review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_rounds review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: sales_rights sales_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sales_rights
    ADD CONSTRAINT sales_rights_pkey PRIMARY KEY (sales_rights_id);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: spotlights spotlights_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlights
    ADD CONSTRAINT spotlights_pkey PRIMARY KEY (spotlight_id);


--
-- Name: stage_assignments stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: static_pages static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (static_page_id);


--
-- Name: submission_artwork_files submission_artwork_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_artwork_files
    ADD CONSTRAINT submission_artwork_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_chapters submission_chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_pkey PRIMARY KEY (chapter_id);


--
-- Name: submission_comments submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_files submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_search_keyword_list submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_objects submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_supplementary_files submission_supplementary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_supplementary_files
    ADD CONSTRAINT submission_supplementary_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (submission_id);


--
-- Name: temporary_files temporary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_pkey PRIMARY KEY (file_id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX access_keys_hash ON public.access_keys USING btree (key_hash, user_id, context);


--
-- Name: announcement_settings_announcement_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcement_settings_announcement_id ON public.announcement_settings USING btree (announcement_id);


--
-- Name: announcement_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX announcement_settings_pkey ON public.announcement_settings USING btree (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX announcement_type_settings_pkey ON public.announcement_type_settings USING btree (type_id, locale, setting_name);


--
-- Name: announcement_type_settings_type_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcement_type_settings_type_id ON public.announcement_type_settings USING btree (type_id);


--
-- Name: announcement_types_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcement_types_assoc ON public.announcement_types USING btree (assoc_type, assoc_id);


--
-- Name: announcements_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcements_assoc ON public.announcements USING btree (assoc_type, assoc_id);


--
-- Name: assignment_settings_navigation_menu_item_assignment_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX assignment_settings_navigation_menu_item_assignment_id ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id);


--
-- Name: author_settings_author_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX author_settings_author_id ON public.author_settings USING btree (author_id);


--
-- Name: author_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX author_settings_pkey ON public.author_settings USING btree (author_id, locale, setting_name);


--
-- Name: authors_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX authors_publication_id ON public.authors USING btree (publication_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: c_v_e_s_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX c_v_e_s_pkey ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id, parent_id);


--
-- Name: category_path; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX category_path ON public.categories USING btree (context_id, path);


--
-- Name: category_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX category_settings_pkey ON public.category_settings USING btree (category_id, locale, setting_name);


--
-- Name: chapter_authors_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX chapter_authors_pkey ON public.submission_chapter_authors USING btree (author_id, chapter_id);


--
-- Name: chapters_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX chapters_chapter_id ON public.submission_chapters USING btree (chapter_id);


--
-- Name: chapters_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX chapters_publication_id ON public.submission_chapters USING btree (publication_id);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX citation_settings_citation_id ON public.citation_settings USING btree (citation_id);


--
-- Name: citation_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX citation_settings_pkey ON public.citation_settings USING btree (citation_id, locale, setting_name);


--
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: citations_publication_seq; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX citations_publication_seq ON public.citations USING btree (publication_id, seq);


--
-- Name: controlled_vocab_entries_cv_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX controlled_vocab_entries_cv_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id, seq);


--
-- Name: controlled_vocab_symbolic; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX controlled_vocab_symbolic ON public.controlled_vocabs USING btree (symbolic, assoc_type, assoc_id);


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX data_object_tombstone_oai_set_objects_tombstone_id ON public.data_object_tombstone_oai_set_objects USING btree (tombstone_id);


--
-- Name: data_object_tombstone_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX data_object_tombstone_settings_pkey ON public.data_object_tombstone_settings USING btree (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstone_settings_tombstone_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX data_object_tombstone_settings_tombstone_id ON public.data_object_tombstone_settings USING btree (tombstone_id);


--
-- Name: data_object_tombstones_data_object_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX data_object_tombstones_data_object_id ON public.data_object_tombstones USING btree (data_object_id);


--
-- Name: edit_decisions_editor_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX edit_decisions_editor_id ON public.edit_decisions USING btree (editor_id);


--
-- Name: edit_decisions_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX edit_decisions_submission_id ON public.edit_decisions USING btree (submission_id);


--
-- Name: email_log_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_log_assoc ON public.email_log USING btree (assoc_type, assoc_id);


--
-- Name: email_log_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX email_log_user_id ON public.email_log_users USING btree (email_log_id, user_id);


--
-- Name: email_settings_email_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_settings_email_id ON public.email_templates_settings USING btree (email_id);


--
-- Name: email_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX email_settings_pkey ON public.email_templates_settings USING btree (email_id, locale, setting_name);


--
-- Name: email_templates_default_data_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX email_templates_default_data_pkey ON public.email_templates_default_data USING btree (email_key, locale);


--
-- Name: email_templates_default_email_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_templates_default_email_key ON public.email_templates_default USING btree (email_key);


--
-- Name: email_templates_email_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX email_templates_email_key ON public.email_templates USING btree (email_key, context_id);


--
-- Name: event_log_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX event_log_assoc ON public.event_log USING btree (assoc_type, assoc_id);


--
-- Name: event_log_settings_log_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX event_log_settings_log_id ON public.event_log_settings USING btree (log_id);


--
-- Name: event_log_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX event_log_settings_pkey ON public.event_log_settings USING btree (log_id, setting_name);


--
-- Name: filter_groups_symbolic; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX filter_groups_symbolic ON public.filter_groups USING btree (symbolic);


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


--
-- Name: filter_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX filter_settings_pkey ON public.filter_settings USING btree (filter_id, locale, setting_name);


--
-- Name: format_markets_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX format_markets_pkey ON public.markets USING btree (market_id, publication_format_id);


--
-- Name: format_publication_dates_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX format_publication_dates_pkey ON public.publication_dates USING btree (publication_date_id, publication_format_id, role);


--
-- Name: format_representatives_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX format_representatives_pkey ON public.representatives USING btree (representative_id, submission_id);


--
-- Name: format_sales_rights_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX format_sales_rights_pkey ON public.sales_rights USING btree (sales_rights_id, publication_format_id);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX genre_settings_genre_id ON public.genre_settings USING btree (genre_id);


--
-- Name: genre_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX genre_settings_pkey ON public.genre_settings USING btree (genre_id, locale, setting_name);


--
-- Name: identification_codes_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX identification_codes_key ON public.identification_codes USING btree (identification_code_id, publication_format_id, code);


--
-- Name: item_views_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX item_views_pkey ON public.item_views USING btree (assoc_type, assoc_id, user_id);


--
-- Name: library_file_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_file_settings_id ON public.library_file_settings USING btree (file_id);


--
-- Name: library_file_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX library_file_settings_pkey ON public.library_file_settings USING btree (file_id, locale, setting_name);


--
-- Name: library_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_files_submission_id ON public.library_files USING btree (submission_id);


--
-- Name: metadata_description_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metadata_description_settings_id ON public.metadata_description_settings USING btree (metadata_description_id);


--
-- Name: metadata_descriptions_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metadata_descriptions_assoc ON public.metadata_descriptions USING btree (assoc_type, assoc_id);


--
-- Name: metadata_descripton_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX metadata_descripton_settings_pkey ON public.metadata_description_settings USING btree (metadata_description_id, locale, setting_name);


--
-- Name: metrics_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_load_id ON public.metrics USING btree (load_id);


--
-- Name: metrics_metric_type_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_metric_type_context_id ON public.metrics USING btree (metric_type, context_id);


--
-- Name: metrics_metric_type_submission_id_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_metric_type_submission_id_assoc ON public.metrics USING btree (metric_type, context_id, assoc_type, assoc_id);


--
-- Name: metrics_metric_type_submission_id_assoc_type; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_metric_type_submission_id_assoc_type ON public.metrics USING btree (metric_type, submission_id, assoc_type);


--
-- Name: navigation_menu_item_assignment_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX navigation_menu_item_assignment_settings_pkey ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: navigation_menu_item_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX navigation_menu_item_settings_pkey ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id, locale, setting_name);


--
-- Name: new_releases_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX new_releases_pkey ON public.new_releases USING btree (assoc_type, assoc_id, submission_id);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


--
-- Name: notification_mail_list_email_context; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX notification_mail_list_email_context ON public.notification_mail_list USING btree (email, context);


--
-- Name: notification_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX notification_settings_pkey ON public.notification_settings USING btree (notification_id, locale, setting_name);


--
-- Name: notifications_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notifications_assoc ON public.notifications USING btree (assoc_type, assoc_id);


--
-- Name: notifications_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notifications_context_id ON public.notifications USING btree (context_id, level);


--
-- Name: notifications_context_id_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notifications_context_id_user_id ON public.notifications USING btree (context_id, user_id, level);


--
-- Name: notifications_user_id_level; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notifications_user_id_level ON public.notifications USING btree (user_id, level);


--
-- Name: oai_resumption_tokens_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX oai_resumption_tokens_pkey ON public.oai_resumption_tokens USING btree (token);


--
-- Name: plugin_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX plugin_settings_pkey ON public.plugin_settings USING btree (plugin_name, context_id, setting_name);


--
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX plugin_settings_plugin_name ON public.plugin_settings USING btree (plugin_name);


--
-- Name: press_features_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX press_features_pkey ON public.features USING btree (assoc_type, assoc_id, submission_id);


--
-- Name: press_path; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX press_path ON public.presses USING btree (path);


--
-- Name: press_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX press_settings_pkey ON public.press_settings USING btree (press_id, locale, setting_name);


--
-- Name: press_settings_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX press_settings_press_id ON public.press_settings USING btree (press_id);


--
-- Name: publication_categories_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX publication_categories_id ON public.publication_categories USING btree (publication_id, category_id);


--
-- Name: publication_format_id_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_format_id_key ON public.publication_format_settings USING btree (publication_format_id);


--
-- Name: publication_format_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX publication_format_settings_pkey ON public.publication_format_settings USING btree (publication_format_id, locale, setting_name);


--
-- Name: publication_format_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_format_submission_id ON public.publication_formats USING btree (submission_id);


--
-- Name: publication_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX publication_settings_pkey ON public.publication_settings USING btree (publication_id, locale, setting_name);


--
-- Name: publication_settings_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_settings_publication_id ON public.publication_settings USING btree (publication_id);


--
-- Name: publications_section_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publications_section_id ON public.publications USING btree (series_id);


--
-- Name: publications_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publications_submission_id ON public.publications USING btree (submission_id);


--
-- Name: queries_assoc_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX queries_assoc_id ON public.queries USING btree (assoc_type, assoc_id);


--
-- Name: query_participants_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX query_participants_pkey ON public.query_participants USING btree (query_id, user_id);


--
-- Name: review_assignments_form_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_assignments_form_id ON public.review_assignments USING btree (review_form_id);


--
-- Name: review_assignments_reviewer_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_assignments_reviewer_id ON public.review_assignments USING btree (reviewer_id);


--
-- Name: review_assignments_reviewer_review; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_assignments_reviewer_review ON public.review_assignments USING btree (reviewer_id, review_id);


--
-- Name: review_assignments_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_assignments_submission_id ON public.review_assignments USING btree (submission_id);


--
-- Name: review_files_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX review_files_pkey ON public.review_files USING btree (review_id, file_id);


--
-- Name: review_files_review_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_files_review_id ON public.review_files USING btree (review_id);


--
-- Name: review_form_element_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX review_form_element_settings_pkey ON public.review_form_element_settings USING btree (review_form_element_id, locale, setting_name);


--
-- Name: review_form_element_settings_review_form_element_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_element_settings_review_form_element_id ON public.review_form_element_settings USING btree (review_form_element_id);


--
-- Name: review_form_elements_review_form_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_elements_review_form_id ON public.review_form_elements USING btree (review_form_id);


--
-- Name: review_form_responses_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_responses_pkey ON public.review_form_responses USING btree (review_form_element_id, review_id);


--
-- Name: review_form_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX review_form_settings_pkey ON public.review_form_settings USING btree (review_form_id, locale, setting_name);


--
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_settings_review_form_id ON public.review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX review_round_files_pkey ON public.review_round_files USING btree (submission_id, review_round_id, file_id, revision);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: review_rounds_submission_id_stage_id_round_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX review_rounds_submission_id_stage_id_round_pkey ON public.review_rounds USING btree (submission_id, stage_id, round);


--
-- Name: scheduled_tasks_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX scheduled_tasks_pkey ON public.scheduled_tasks USING btree (class_name);


--
-- Name: section_editors_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX section_editors_context_id ON public.section_editors USING btree (context_id);


--
-- Name: section_editors_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX section_editors_pkey ON public.section_editors USING btree (context_id, section_id, user_id);


--
-- Name: section_editors_section_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX section_editors_section_id ON public.section_editors USING btree (section_id);


--
-- Name: section_editors_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX section_editors_user_id ON public.section_editors USING btree (user_id);


--
-- Name: series_categories_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX series_categories_id ON public.series_categories USING btree (series_id, category_id);


--
-- Name: series_editors_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX series_editors_pkey ON public.series_editors USING btree (press_id, series_id, user_id);


--
-- Name: series_editors_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_editors_press_id ON public.series_editors USING btree (press_id);


--
-- Name: series_editors_series_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_editors_series_id ON public.series_editors USING btree (series_id);


--
-- Name: series_editors_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_editors_user_id ON public.series_editors USING btree (user_id);


--
-- Name: series_path; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX series_path ON public.series USING btree (press_id, path);


--
-- Name: series_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_press_id ON public.series USING btree (press_id);


--
-- Name: series_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX series_settings_pkey ON public.series_settings USING btree (series_id, locale, setting_name);


--
-- Name: sessions_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX sessions_pkey ON public.sessions USING btree (session_id);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX sessions_user_id ON public.sessions USING btree (user_id);


--
-- Name: site_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX site_settings_pkey ON public.site_settings USING btree (setting_name, locale);


--
-- Name: spotlight_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX spotlight_settings_id ON public.spotlight_settings USING btree (spotlight_id);


--
-- Name: spotlight_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX spotlight_settings_pkey ON public.spotlight_settings USING btree (spotlight_id, locale, setting_name);


--
-- Name: spotlights_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX spotlights_assoc ON public.spotlights USING btree (assoc_type, assoc_id);


--
-- Name: stage_assignment; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX stage_assignment ON public.stage_assignments USING btree (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX stage_assignments_submission_id ON public.stage_assignments USING btree (submission_id);


--
-- Name: stage_assignments_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX stage_assignments_user_group_id ON public.stage_assignments USING btree (user_group_id);


--
-- Name: stage_assignments_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX stage_assignments_user_id ON public.stage_assignments USING btree (user_id);


--
-- Name: static_page_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX static_page_settings_pkey ON public.static_page_settings USING btree (static_page_id, locale, setting_name);


--
-- Name: static_page_settings_static_page_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX static_page_settings_static_page_id ON public.static_page_settings USING btree (static_page_id);


--
-- Name: submission_chapter_settings_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapter_settings_chapter_id ON public.submission_chapter_settings USING btree (chapter_id);


--
-- Name: submission_chapter_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX submission_chapter_settings_pkey ON public.submission_chapter_settings USING btree (chapter_id, locale, setting_name);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_comments_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: submission_file_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_file_settings_id ON public.submission_file_settings USING btree (file_id);


--
-- Name: submission_file_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX submission_file_settings_pkey ON public.submission_file_settings USING btree (file_id, locale, setting_name);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_search_keyword_text; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX submission_search_keyword_text ON public.submission_search_keyword_list USING btree (keyword_text);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_keywords_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX submission_search_object_keywords_pkey ON public.submission_search_object_keywords USING btree (object_id, pos);


--
-- Name: submission_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX submission_settings_pkey ON public.submission_settings USING btree (submission_id, locale, setting_name);


--
-- Name: submission_settings_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_settings_submission_id ON public.submission_settings USING btree (submission_id);


--
-- Name: submissions_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submissions_context_id ON public.submissions USING btree (context_id);


--
-- Name: temporary_files_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX temporary_files_user_id ON public.temporary_files USING btree (user_id);


--
-- Name: u_e_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX u_e_pkey ON public.user_interests USING btree (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX user_group_settings_pkey ON public.user_group_settings USING btree (user_group_id, locale, setting_name);


--
-- Name: user_group_stage_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_group_stage_context_id ON public.user_group_stage USING btree (context_id);


--
-- Name: user_group_stage_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX user_group_stage_pkey ON public.user_group_stage USING btree (context_id, user_group_id, stage_id);


--
-- Name: user_group_stage_stage_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_group_stage_stage_id ON public.user_group_stage USING btree (stage_id);


--
-- Name: user_group_stage_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_group_stage_user_group_id ON public.user_group_stage USING btree (user_group_id);


--
-- Name: user_groups_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_groups_context_id ON public.user_groups USING btree (context_id);


--
-- Name: user_groups_role_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_groups_role_id ON public.user_groups USING btree (role_id);


--
-- Name: user_groups_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_groups_user_group_id ON public.user_groups USING btree (user_group_id);


--
-- Name: user_settings_locale_setting_name_index; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_settings_locale_setting_name_index ON public.user_settings USING btree (setting_name, locale);


--
-- Name: user_settings_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX user_settings_pkey ON public.user_settings USING btree (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_settings_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_settings_user_id ON public.user_settings USING btree (user_id);


--
-- Name: user_user_groups_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX user_user_groups_pkey ON public.user_user_groups USING btree (user_group_id, user_id);


--
-- Name: user_user_groups_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_user_groups_user_group_id ON public.user_user_groups USING btree (user_group_id);


--
-- Name: user_user_groups_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_user_groups_user_id ON public.user_user_groups USING btree (user_id);


--
-- Name: users_email; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX users_email ON public.users USING btree (email);


--
-- Name: users_username; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX users_username ON public.users USING btree (username);


--
-- Name: versions_pkey; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX versions_pkey ON public.versions USING btree (product_type, product, major, minor, revision, build);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

