--
-- PostgreSQL database dump
--

\restrict m2ixufFXG41sRkx5d2EYFOaOKpQ4yQycRcmBS8ELuFmB2GzPfHBuifpI82lwfAM

-- Dumped from database version 16.11 (Ubuntu 16.11-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-1.pgdg24.04+1)

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
SET default_tablespace = '';

SET default_table_access_method = heap;

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


ALTER SEQUENCE public.access_keys_access_key_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.announcement_types_type_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.announcements_announcement_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.auth_sources_auth_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.authors_author_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.categories_category_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.citations_citation_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.edit_decisions_edit_decision_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.email_log_log_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.email_templates_default_email_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.email_templates_email_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.event_log_log_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.files_file_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.filter_groups_filter_group_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.filters_filter_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.genres_genre_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.jobs_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.journals_journal_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.library_files_file_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.metadata_descriptions_metadata_description_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.navigation_menus_navigation_menu_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.notes_note_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.notification_mail_list_notification_mail_list_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.notification_subscription_settings_setting_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.publication_galleys_galley_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.publications_publication_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.queries_query_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.review_assignments_review_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.review_form_elements_review_form_element_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.review_forms_review_form_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.review_rounds_review_round_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.sections_section_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.stage_assignments_stage_assignment_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submission_comments_comment_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submission_file_revisions_revision_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submission_files_submission_file_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submission_search_keyword_list_keyword_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submission_search_objects_object_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submission_tombstones_tombstone_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.submissions_submission_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.temporary_files_file_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.user_groups_user_group_id_seq OWNER TO "ops-ci";

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


ALTER SEQUENCE public.users_user_id_seq OWNER TO "ops-ci";

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
-- Name: access_keys access_key_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('public.access_keys_access_key_id_seq'::regclass);


--
-- Name: announcement_types type_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types ALTER COLUMN type_id SET DEFAULT nextval('public.announcement_types_type_id_seq'::regclass);


--
-- Name: announcements announcement_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcements_announcement_id_seq'::regclass);


--
-- Name: auth_sources auth_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN auth_id SET DEFAULT nextval('public.auth_sources_auth_id_seq'::regclass);


--
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: citations citation_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations ALTER COLUMN citation_id SET DEFAULT nextval('public.citations_citation_id_seq'::regclass);


--
-- Name: controlled_vocab_entries controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocabs controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('public.controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: data_object_tombstone_oai_set_objects object_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('public.data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: data_object_tombstones tombstone_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: edit_decisions edit_decision_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('public.edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: email_log log_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log ALTER COLUMN log_id SET DEFAULT nextval('public.email_log_log_id_seq'::regclass);


--
-- Name: email_templates email_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_email_id_seq'::regclass);


--
-- Name: email_templates_default email_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_default_email_id_seq'::regclass);


--
-- Name: event_log log_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log ALTER COLUMN log_id SET DEFAULT nextval('public.event_log_log_id_seq'::regclass);


--
-- Name: files file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


--
-- Name: filter_groups filter_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('public.filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filters filter_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters ALTER COLUMN filter_id SET DEFAULT nextval('public.filters_filter_id_seq'::regclass);


--
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: journals journal_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals ALTER COLUMN journal_id SET DEFAULT nextval('public.journals_journal_id_seq'::regclass);


--
-- Name: library_files file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files ALTER COLUMN file_id SET DEFAULT nextval('public.library_files_file_id_seq'::regclass);


--
-- Name: metadata_descriptions metadata_description_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metadata_descriptions ALTER COLUMN metadata_description_id SET DEFAULT nextval('public.metadata_descriptions_metadata_description_id_seq'::regclass);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_items navigation_menu_item_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_items ALTER COLUMN navigation_menu_item_id SET DEFAULT nextval('public.navigation_menu_items_navigation_menu_item_id_seq'::regclass);


--
-- Name: navigation_menus navigation_menu_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menus ALTER COLUMN navigation_menu_id SET DEFAULT nextval('public.navigation_menus_navigation_menu_id_seq'::regclass);


--
-- Name: notes note_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Name: notification_mail_list notification_mail_list_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list ALTER COLUMN notification_mail_list_id SET DEFAULT nextval('public.notification_mail_list_notification_mail_list_id_seq'::regclass);


--
-- Name: notification_subscription_settings setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: publication_galleys galley_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys ALTER COLUMN galley_id SET DEFAULT nextval('public.publication_galleys_galley_id_seq'::regclass);


--
-- Name: publications publication_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);


--
-- Name: queries query_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.queries ALTER COLUMN query_id SET DEFAULT nextval('public.queries_query_id_seq'::regclass);


--
-- Name: review_assignments review_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments ALTER COLUMN review_id SET DEFAULT nextval('public.review_assignments_review_id_seq'::regclass);


--
-- Name: review_form_elements review_form_element_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('public.review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_forms review_form_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('public.review_forms_review_form_id_seq'::regclass);


--
-- Name: review_rounds review_round_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('public.review_rounds_review_round_id_seq'::regclass);


--
-- Name: sections section_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- Name: stage_assignments stage_assignment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('public.stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: submission_comments comment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.submission_comments_comment_id_seq'::regclass);


--
-- Name: submission_file_revisions revision_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions ALTER COLUMN revision_id SET DEFAULT nextval('public.submission_file_revisions_revision_id_seq'::regclass);


--
-- Name: submission_files submission_file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN submission_file_id SET DEFAULT nextval('public.submission_files_submission_file_id_seq'::regclass);


--
-- Name: submission_search_keyword_list keyword_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('public.submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: submission_search_objects object_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('public.submission_search_objects_object_id_seq'::regclass);


--
-- Name: submission_tombstones tombstone_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.submission_tombstones_tombstone_id_seq'::regclass);


--
-- Name: submissions submission_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions ALTER COLUMN submission_id SET DEFAULT nextval('public.submissions_submission_id_seq'::regclass);


--
-- Name: temporary_files file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.temporary_files ALTER COLUMN file_id SET DEFAULT nextval('public.temporary_files_file_id_seq'::regclass);


--
-- Name: user_groups user_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('public.user_groups_user_group_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


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
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.auth_sources (auth_id, title, plugin, auth_default, settings) FROM stdin;
\.


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
-- Data for Name: controlled_vocab_entries; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entries (controlled_vocab_entry_id, controlled_vocab_id, seq) FROM stdin;
1	2	1
2	2	2
88	32	1
89	32	2
93	37	1
94	37	2
95	37	3
14	7	1
15	7	2
16	7	3
97	52	1
102	57	1
103	57	2
104	57	3
105	57	4
108	62	1
109	62	2
111	67	1
122	72	1
123	72	2
124	72	3
125	72	4
46	12	1
47	12	2
48	12	3
49	12	4
50	12	5
51	12	6
52	12	7
53	12	8
126	72	5
127	72	6
128	72	7
129	72	8
130	72	9
131	72	10
134	82	1
135	82	2
139	92	1
140	92	2
141	92	3
78	17	1
79	17	2
80	17	3
81	17	4
82	17	5
83	17	6
84	17	7
85	17	8
\.


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	submissionKeyword	pigs	string
2	en_US	submissionKeyword	food security	string
88	en_US	submissionKeyword	education	string
89	en_US	submissionKeyword	citizenship	string
93	en_US	submissionKeyword	Common pool resource	string
94	en_US	submissionKeyword	common property	string
95	en_US	submissionKeyword	intellectual developments	string
14	en_US	submissionKeyword	employees	string
15	en_US	submissionKeyword	survey	string
16	en_US	submissionKeyword	multinational	string
97	en_US	submissionKeyword	water	string
102	en_US	submissionKeyword	Development	string
103	en_US	submissionKeyword	engineering education	string
104	en_US	submissionKeyword	service learning	string
105	en_US	submissionKeyword	sustainability	string
108	en_US	submissionKeyword	pigs	string
109	en_US	submissionKeyword	food security	string
111	en_US	submissionKeyword	water	string
122	en_US	submissionKeyword	21st Century	string
123	en_US	submissionKeyword	Diversity	string
124	en_US	submissionKeyword	Multilingual	string
125	en_US	submissionKeyword	Multiethnic	string
46	en_US	submissionKeyword	Integrating Technology	string
47	en_US	submissionKeyword	Computer Skills	string
48	en_US	submissionKeyword	Survey	string
49	en_US	submissionKeyword	Alberta	string
50	en_US	submissionKeyword	National	string
51	en_US	submissionKeyword	Provincial	string
52	en_US	submissionKeyword	Professional Development	string
53	en_US	submissionKeyword	employees	string
126	en_US	submissionKeyword	Participatory Pedagogy	string
127	en_US	submissionKeyword	Language	string
128	en_US	submissionKeyword	Culture	string
129	en_US	submissionKeyword	Gender	string
130	en_US	submissionKeyword	Egalitarianism	string
131	en_US	submissionKeyword	Social Transformation	string
134	en_US	submissionKeyword	cattle	string
135	en_US	submissionKeyword	food security	string
139	en_US	submissionKeyword	Self-Organization	string
140	en_US	submissionKeyword	Multi-Level Institutions	string
141	en_US	submissionKeyword	Goverance	string
78	en_US	submissionKeyword	Integrating Technology	string
79	en_US	submissionKeyword	Computer Skills	string
80	en_US	submissionKeyword	Survey	string
81	en_US	submissionKeyword	Alberta	string
82	en_US	submissionKeyword	National	string
83	en_US	submissionKeyword	Provincial	string
84	en_US	submissionKeyword	Professional Development	string
85	en_US	submissionKeyword	employees	string
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
-- Data for Name: data_object_tombstone_oai_set_objects; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.data_object_tombstone_oai_set_objects (object_id, tombstone_id, assoc_type, assoc_id) FROM stdin;
\.


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
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	7	2026-01-05 05:42:09	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Carlo Corino" <ccorino@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Carlo Corino:<br />\n<br />\nThank you for submitting the manuscript, &quot;The influence of lactation on the quantity and quality of cashmere production&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/1' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a><br />\nUsername: ccorino<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
2	1048585	2	8	2026-01-05 05:42:27	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Catherine Kwantes:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/2' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/2</a><br />\nUsername: ckwantes<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
3	1048585	2	3	2026-01-05 05:42:40	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/2' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/2</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
4	1048585	3	9	2026-01-05 05:43:01	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Craig Montgomerie" <cmontgomerie@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Craig Montgomerie:<br />\n<br />\nThank you for submitting the manuscript, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/3' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/3</a><br />\nUsername: cmontgomerie<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
5	1048585	3	9	2026-01-05 05:43:01	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Irvine" <mirvine@mailinator.com>	\N	\N	[JPKPKP] Submission Acknowledgement	Hello,<br />\n<br />\nCraig Montgomerie has submitted the manuscript, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; to Public Knowledge Preprint Server. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
6	1048585	3	3	2026-01-05 05:43:05	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/3' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/3</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
7	1048585	3	3	2026-01-05 05:43:14	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/3' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/3</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
15	1048585	7	13	2026-01-05 05:44:49	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank van Laerhoven" <fvanlaerhoven@mailinator.com>	\N	\N	[JPKPKP] Submission Acknowledgement	Hello,<br />\n<br />\nElinor Ostrom has submitted the manuscript, &quot;Traditions and Trends in the Study of the Commons&quot; to Public Knowledge Preprint Server. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
8	1048585	4	10	2026-01-05 05:43:40	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Diaga Diouf:<br />\n<br />\nThank you for submitting the manuscript, &quot;Genetic transformation of forest trees&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/4' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a><br />\nUsername: ddiouf<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
9	1048585	4	3	2026-01-05 05:43:44	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Genetic transformation of forest trees&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/4' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/4</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
10	1048585	5	11	2026-01-05 05:44:03	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Dana Phillips:<br />\n<br />\nThank you for submitting the manuscript, &quot;Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/5' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a><br />\nUsername: dphillips<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
11	1048585	5	3	2026-01-05 05:44:06	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/5' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/5</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
12	1048585	6	12	2026-01-05 05:44:25	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Domatilia Sokoloff" <dsokoloff@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Domatilia Sokoloff:<br />\n<br />\nThank you for submitting the manuscript, &quot;Developing efficacy beliefs in the classroom&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/6' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/6</a><br />\nUsername: dsokoloff<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
13	1048585	6	3	2026-01-05 05:44:29	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Developing efficacy beliefs in the classroom&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/6' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/6</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
14	1048585	7	13	2026-01-05 05:44:49	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Elinor Ostrom" <eostrom@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Elinor Ostrom:<br />\n<br />\nThank you for submitting the manuscript, &quot;Traditions and Trends in the Study of the Commons&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/7' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a><br />\nUsername: eostrom<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
16	1048585	7	3	2026-01-05 05:44:53	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Traditions and Trends in the Study of the Commons&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/7' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/7</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
17	1048585	8	14	2026-01-05 05:45:12	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Fabio Paglieri:<br />\n<br />\nThank you for submitting the manuscript, &quot;Hansen &amp; Pinto: Reason Reclaimed&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/8' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/8</a><br />\nUsername: fpaglieri<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
18	1048585	8	3	2026-01-05 05:45:15	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Hansen &amp; Pinto: Reason Reclaimed&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/8' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/8</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
19	1048585	9	15	2026-01-05 05:45:34	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	John Mwandenga:<br />\n<br />\nThank you for submitting the manuscript, &quot;Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/9' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/9</a><br />\nUsername: jmwandenga<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
20	1048585	9	3	2026-01-05 05:45:38	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/9' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/9</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
21	1048585	10	16	2026-01-05 05:45:56	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"John Novak" <jnovak@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	John Novak:<br />\n<br />\nThank you for submitting the manuscript, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/10' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/10</a><br />\nUsername: jnovak<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
22	1048585	10	3	2026-01-05 05:46:00	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/10' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/10</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
23	1048585	11	17	2026-01-05 05:46:21	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Karim Al-Khafaji" <kalkhafaji@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Karim Al-Khafaji:<br />\n<br />\nThank you for submitting the manuscript, &quot;Learning Sustainable Design through Service&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/11' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a><br />\nUsername: kalkhafaji<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
24	1048585	11	17	2026-01-05 05:46:21	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Margaret Morse" <mmorse@mailinator.com>	\N	\N	[JPKPKP] Submission Acknowledgement	Hello,<br />\n<br />\nKarim Al-Khafaji has submitted the manuscript, &quot;Learning Sustainable Design through Service&quot; to Public Knowledge Preprint Server. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
25	1048585	11	3	2026-01-05 05:46:25	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Learning Sustainable Design through Service&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/11' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/11</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
26	1048585	12	18	2026-01-05 05:46:44	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Leo Christopher" <lchristopher@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Leo Christopher:<br />\n<br />\nThank you for submitting the manuscript, &quot;Sodium butyrate improves growth performance of weaned piglets during the first period after weaning&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/12' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/12</a><br />\nUsername: lchristopher<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
27	1048585	12	3	2026-01-05 05:46:48	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Sodium butyrate improves growth performance of weaned piglets during the first period after weaning&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/12' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/12</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
28	1048585	13	19	2026-01-05 05:47:07	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Lise Kumiega:<br />\n<br />\nThank you for submitting the manuscript, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/13' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a><br />\nUsername: lkumiega<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
29	1048585	13	3	2026-01-05 05:47:11	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/13' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/13</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
30	1048585	14	20	2026-01-05 05:47:30	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Patricia Daniel" <pdaniel@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Patricia Daniel:<br />\n<br />\nThank you for submitting the manuscript, &quot;Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/14' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a><br />\nUsername: pdaniel<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
31	1048585	14	3	2026-01-05 05:47:34	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/14' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/14</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
32	1048585	15	21	2026-01-05 05:47:53	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Rana Baiyewu:<br />\n<br />\nThank you for submitting the manuscript, &quot;Yam diseases and its management in Nigeria&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/15' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/15</a><br />\nUsername: rbaiyewu<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
33	1048585	15	3	2026-01-05 05:47:57	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Yam diseases and its management in Nigeria&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/15' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/15</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
34	1048585	16	22	2026-01-05 05:48:16	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Rosanna Rossi" <rrossi@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Rosanna Rossi:<br />\n<br />\nThank you for submitting the manuscript, &quot;Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/16' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/16</a><br />\nUsername: rrossi<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
35	1048585	16	3	2026-01-05 05:48:20	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/16' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/16</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
36	1048585	17	23	2026-01-05 05:48:39	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Vajiheh Karbasizaed:<br />\n<br />\nThank you for submitting the manuscript, &quot;Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/17' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/17</a><br />\nUsername: vkarbasizaed<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
37	1048585	17	3	2026-01-05 05:48:43	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/17' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/17</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
38	1048585	18	24	2026-01-05 05:49:03	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Valerie Williamson:<br />\n<br />\nThank you for submitting the manuscript, &quot;Self-Organization in Multi-Level Institutions in Networked Environments&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/18' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/18</a><br />\nUsername: vwilliamson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
39	1048585	18	3	2026-01-05 05:49:07	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Self-Organization in Multi-Level Institutions in Networked Environments&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/18' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/18</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
40	1048585	19	25	2026-01-05 05:49:26	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[JPKPKP] Submission Acknowledgement	Zita Woods:<br />\n<br />\nThank you for submitting the manuscript, &quot;Finocchiaro: Arguments About Arguments&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you've been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/19' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/19</a><br />\nUsername: zwoods<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
41	1048585	19	3	2026-01-05 05:49:30	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPKPKP] Preprint Posted Acknowledgement	Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Finocchiaro: Arguments About Arguments&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href='http://localhost/index.php/publicknowledge/preprint/view/19' class='publicationUrl-style-class'>http://localhost/index.php/publicknowledge/preprint/view/19</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>
\.


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
1	7
2	8
3	3
4	9
6	3
7	3
8	10
9	3
10	11
11	3
12	12
13	3
14	13
16	3
17	14
18	3
19	15
20	3
21	16
22	3
23	17
25	3
26	18
27	3
28	19
29	3
30	20
31	3
32	21
33	3
34	22
35	3
36	23
37	3
38	24
39	3
40	25
41	3
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
-- Data for Name: email_templates_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_settings (email_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log (log_id, assoc_type, assoc_id, user_id, date_logged, event_type, message, is_translated) FROM stdin;
1	1048585	1	7	2026-01-05 05:41:55	268435458	submission.event.general.metadataUpdated	0
2	515	1	7	2026-01-05 05:42:04	1342177281	submission.event.fileUploaded	0
3	1048585	1	7	2026-01-05 05:42:04	1342177288	submission.event.fileRevised	0
4	515	1	7	2026-01-05 05:42:06	1342177296	submission.event.fileEdited	0
5	1048585	1	7	2026-01-05 05:42:06	1342177296	submission.event.fileEdited	0
6	1048585	1	7	2026-01-05 05:42:08	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	7	2026-01-05 05:42:09	268435457	submission.event.submissionSubmitted	0
8	1048585	2	8	2026-01-05 05:42:14	268435458	submission.event.general.metadataUpdated	0
9	515	2	8	2026-01-05 05:42:22	1342177281	submission.event.fileUploaded	0
10	1048585	2	8	2026-01-05 05:42:22	1342177288	submission.event.fileRevised	0
11	515	2	8	2026-01-05 05:42:24	1342177296	submission.event.fileEdited	0
12	1048585	2	8	2026-01-05 05:42:24	1342177296	submission.event.fileEdited	0
13	1048585	2	8	2026-01-05 05:42:27	268435458	submission.event.general.metadataUpdated	0
14	1048585	2	8	2026-01-05 05:42:27	268435457	submission.event.submissionSubmitted	0
15	1048585	2	8	2026-01-05 05:42:30	268435458	submission.event.general.metadataUpdated	0
16	1048585	2	8	2026-01-05 05:42:33	268435458	submission.event.general.metadataUpdated	0
17	1048585	2	8	2026-01-05 05:42:36	268435458	submission.event.general.metadataUpdated	0
18	1048585	2	3	2026-01-05 05:42:40	268435462	publication.event.published	0
19	1048585	3	9	2026-01-05 05:42:45	268435458	submission.event.general.metadataUpdated	0
20	515	3	9	2026-01-05 05:42:54	1342177281	submission.event.fileUploaded	0
21	1048585	3	9	2026-01-05 05:42:54	1342177288	submission.event.fileRevised	0
22	515	3	9	2026-01-05 05:42:56	1342177296	submission.event.fileEdited	0
23	1048585	3	9	2026-01-05 05:42:56	1342177296	submission.event.fileEdited	0
24	1048585	3	9	2026-01-05 05:43:00	268435458	submission.event.general.metadataUpdated	0
25	1048585	3	9	2026-01-05 05:43:00	268435458	submission.event.general.metadataUpdated	0
26	1048585	3	9	2026-01-05 05:43:01	268435457	submission.event.submissionSubmitted	0
27	1048585	3	3	2026-01-05 05:43:05	268435462	publication.event.published	0
28	1048585	3	3	2026-01-05 05:43:09	268435463	publication.event.unpublished	0
29	1048585	3	3	2026-01-05 05:43:11	268435458	submission.event.general.metadataUpdated	0
30	1048585	3	3	2026-01-05 05:43:14	268435462	publication.event.published	0
31	1048585	3	3	2026-01-05 05:43:16	268435458	submission.event.general.metadataUpdated	0
32	1048585	3	3	2026-01-05 05:43:16	268435464	publication.event.versionCreated	0
33	1048585	3	3	2026-01-05 05:43:19	268435458	submission.event.general.metadataUpdated	0
34	1048585	3	3	2026-01-05 05:43:22	268435462	publication.event.versionPublished	0
35	1048585	4	10	2026-01-05 05:43:27	268435458	submission.event.general.metadataUpdated	0
36	515	4	10	2026-01-05 05:43:35	1342177281	submission.event.fileUploaded	0
37	1048585	4	10	2026-01-05 05:43:35	1342177288	submission.event.fileRevised	0
38	515	4	10	2026-01-05 05:43:37	1342177296	submission.event.fileEdited	0
39	1048585	4	10	2026-01-05 05:43:37	1342177296	submission.event.fileEdited	0
40	1048585	4	10	2026-01-05 05:43:39	268435458	submission.event.general.metadataUpdated	0
41	1048585	4	10	2026-01-05 05:43:40	268435457	submission.event.submissionSubmitted	0
42	1048585	4	3	2026-01-05 05:43:44	268435462	publication.event.published	0
43	1048585	5	11	2026-01-05 05:43:49	268435458	submission.event.general.metadataUpdated	0
44	515	5	11	2026-01-05 05:43:57	1342177281	submission.event.fileUploaded	0
45	1048585	5	11	2026-01-05 05:43:57	1342177288	submission.event.fileRevised	0
46	515	5	11	2026-01-05 05:44:00	1342177296	submission.event.fileEdited	0
47	1048585	5	11	2026-01-05 05:44:00	1342177296	submission.event.fileEdited	0
48	1048585	5	11	2026-01-05 05:44:02	268435458	submission.event.general.metadataUpdated	0
49	1048585	5	11	2026-01-05 05:44:03	268435457	submission.event.submissionSubmitted	0
50	1048585	5	3	2026-01-05 05:44:06	268435462	publication.event.published	0
51	1048585	6	12	2026-01-05 05:44:12	268435458	submission.event.general.metadataUpdated	0
52	515	6	12	2026-01-05 05:44:20	1342177281	submission.event.fileUploaded	0
53	1048585	6	12	2026-01-05 05:44:20	1342177288	submission.event.fileRevised	0
54	515	6	12	2026-01-05 05:44:22	1342177296	submission.event.fileEdited	0
55	1048585	6	12	2026-01-05 05:44:22	1342177296	submission.event.fileEdited	0
56	1048585	6	12	2026-01-05 05:44:24	268435458	submission.event.general.metadataUpdated	0
57	1048585	6	12	2026-01-05 05:44:25	268435457	submission.event.submissionSubmitted	0
58	1048585	6	3	2026-01-05 05:44:29	268435462	publication.event.published	0
59	1048585	7	13	2026-01-05 05:44:34	268435458	submission.event.general.metadataUpdated	0
60	515	7	13	2026-01-05 05:44:42	1342177281	submission.event.fileUploaded	0
61	1048585	7	13	2026-01-05 05:44:42	1342177288	submission.event.fileRevised	0
62	515	7	13	2026-01-05 05:44:44	1342177296	submission.event.fileEdited	0
63	1048585	7	13	2026-01-05 05:44:44	1342177296	submission.event.fileEdited	0
64	1048585	7	13	2026-01-05 05:44:48	268435458	submission.event.general.metadataUpdated	0
65	1048585	7	13	2026-01-05 05:44:49	268435458	submission.event.general.metadataUpdated	0
66	1048585	7	13	2026-01-05 05:44:49	268435457	submission.event.submissionSubmitted	0
67	1048585	7	3	2026-01-05 05:44:53	268435462	publication.event.published	0
68	1048585	8	14	2026-01-05 05:44:58	268435458	submission.event.general.metadataUpdated	0
69	515	8	14	2026-01-05 05:45:07	1342177281	submission.event.fileUploaded	0
70	1048585	8	14	2026-01-05 05:45:07	1342177288	submission.event.fileRevised	0
71	515	8	14	2026-01-05 05:45:09	1342177296	submission.event.fileEdited	0
72	1048585	8	14	2026-01-05 05:45:09	1342177296	submission.event.fileEdited	0
73	1048585	8	14	2026-01-05 05:45:11	268435458	submission.event.general.metadataUpdated	0
74	1048585	8	14	2026-01-05 05:45:12	268435457	submission.event.submissionSubmitted	0
75	1048585	8	3	2026-01-05 05:45:15	268435462	publication.event.published	0
76	1048585	9	15	2026-01-05 05:45:21	268435458	submission.event.general.metadataUpdated	0
77	515	9	15	2026-01-05 05:45:29	1342177281	submission.event.fileUploaded	0
78	1048585	9	15	2026-01-05 05:45:29	1342177288	submission.event.fileRevised	0
79	515	9	15	2026-01-05 05:45:31	1342177296	submission.event.fileEdited	0
80	1048585	9	15	2026-01-05 05:45:31	1342177296	submission.event.fileEdited	0
81	1048585	9	15	2026-01-05 05:45:33	268435458	submission.event.general.metadataUpdated	0
82	1048585	9	15	2026-01-05 05:45:34	268435457	submission.event.submissionSubmitted	0
83	1048585	9	3	2026-01-05 05:45:38	268435462	publication.event.published	0
84	1048585	10	16	2026-01-05 05:45:43	268435458	submission.event.general.metadataUpdated	0
85	515	10	16	2026-01-05 05:45:51	1342177281	submission.event.fileUploaded	0
86	1048585	10	16	2026-01-05 05:45:51	1342177288	submission.event.fileRevised	0
87	515	10	16	2026-01-05 05:45:54	1342177296	submission.event.fileEdited	0
88	1048585	10	16	2026-01-05 05:45:54	1342177296	submission.event.fileEdited	0
89	1048585	10	16	2026-01-05 05:45:56	268435458	submission.event.general.metadataUpdated	0
90	1048585	10	16	2026-01-05 05:45:56	268435457	submission.event.submissionSubmitted	0
91	1048585	10	3	2026-01-05 05:46:00	268435462	publication.event.published	0
92	1048585	11	17	2026-01-05 05:46:05	268435458	submission.event.general.metadataUpdated	0
93	515	11	17	2026-01-05 05:46:14	1342177281	submission.event.fileUploaded	0
94	1048585	11	17	2026-01-05 05:46:14	1342177288	submission.event.fileRevised	0
95	515	11	17	2026-01-05 05:46:16	1342177296	submission.event.fileEdited	0
96	1048585	11	17	2026-01-05 05:46:16	1342177296	submission.event.fileEdited	0
97	1048585	11	17	2026-01-05 05:46:19	268435458	submission.event.general.metadataUpdated	0
98	1048585	11	17	2026-01-05 05:46:20	268435458	submission.event.general.metadataUpdated	0
99	1048585	11	17	2026-01-05 05:46:21	268435457	submission.event.submissionSubmitted	0
100	1048585	11	3	2026-01-05 05:46:25	268435462	publication.event.published	0
101	1048585	12	18	2026-01-05 05:46:30	268435458	submission.event.general.metadataUpdated	0
102	515	12	18	2026-01-05 05:46:39	1342177281	submission.event.fileUploaded	0
103	1048585	12	18	2026-01-05 05:46:39	1342177288	submission.event.fileRevised	0
104	515	12	18	2026-01-05 05:46:41	1342177296	submission.event.fileEdited	0
105	1048585	12	18	2026-01-05 05:46:41	1342177296	submission.event.fileEdited	0
106	1048585	12	18	2026-01-05 05:46:43	268435458	submission.event.general.metadataUpdated	0
107	1048585	12	18	2026-01-05 05:46:44	268435457	submission.event.submissionSubmitted	0
108	1048585	12	3	2026-01-05 05:46:48	268435462	publication.event.published	0
109	1048585	13	19	2026-01-05 05:46:53	268435458	submission.event.general.metadataUpdated	0
110	515	13	19	2026-01-05 05:47:02	1342177281	submission.event.fileUploaded	0
111	1048585	13	19	2026-01-05 05:47:02	1342177288	submission.event.fileRevised	0
112	515	13	19	2026-01-05 05:47:04	1342177296	submission.event.fileEdited	0
113	1048585	13	19	2026-01-05 05:47:04	1342177296	submission.event.fileEdited	0
114	1048585	13	19	2026-01-05 05:47:06	268435458	submission.event.general.metadataUpdated	0
115	1048585	13	19	2026-01-05 05:47:07	268435457	submission.event.submissionSubmitted	0
116	1048585	13	3	2026-01-05 05:47:11	268435462	publication.event.published	0
117	1048585	14	20	2026-01-05 05:47:17	268435458	submission.event.general.metadataUpdated	0
118	515	14	20	2026-01-05 05:47:25	1342177281	submission.event.fileUploaded	0
119	1048585	14	20	2026-01-05 05:47:25	1342177288	submission.event.fileRevised	0
120	515	14	20	2026-01-05 05:47:27	1342177296	submission.event.fileEdited	0
121	1048585	14	20	2026-01-05 05:47:27	1342177296	submission.event.fileEdited	0
122	1048585	14	20	2026-01-05 05:47:29	268435458	submission.event.general.metadataUpdated	0
123	1048585	14	20	2026-01-05 05:47:30	268435457	submission.event.submissionSubmitted	0
124	1048585	14	3	2026-01-05 05:47:34	268435462	publication.event.published	0
125	1048585	15	21	2026-01-05 05:47:40	268435458	submission.event.general.metadataUpdated	0
126	515	15	21	2026-01-05 05:47:48	1342177281	submission.event.fileUploaded	0
127	1048585	15	21	2026-01-05 05:47:48	1342177288	submission.event.fileRevised	0
128	515	15	21	2026-01-05 05:47:50	1342177296	submission.event.fileEdited	0
129	1048585	15	21	2026-01-05 05:47:50	1342177296	submission.event.fileEdited	0
130	1048585	15	21	2026-01-05 05:47:52	268435458	submission.event.general.metadataUpdated	0
131	1048585	15	21	2026-01-05 05:47:53	268435457	submission.event.submissionSubmitted	0
132	1048585	15	3	2026-01-05 05:47:57	268435462	publication.event.published	0
133	1048585	16	22	2026-01-05 05:48:02	268435458	submission.event.general.metadataUpdated	0
134	515	16	22	2026-01-05 05:48:10	1342177281	submission.event.fileUploaded	0
135	1048585	16	22	2026-01-05 05:48:10	1342177288	submission.event.fileRevised	0
136	515	16	22	2026-01-05 05:48:13	1342177296	submission.event.fileEdited	0
137	1048585	16	22	2026-01-05 05:48:13	1342177296	submission.event.fileEdited	0
138	1048585	16	22	2026-01-05 05:48:15	268435458	submission.event.general.metadataUpdated	0
139	1048585	16	22	2026-01-05 05:48:16	268435457	submission.event.submissionSubmitted	0
140	1048585	16	3	2026-01-05 05:48:20	268435462	publication.event.published	0
141	1048585	17	23	2026-01-05 05:48:25	268435458	submission.event.general.metadataUpdated	0
142	515	17	23	2026-01-05 05:48:34	1342177281	submission.event.fileUploaded	0
143	1048585	17	23	2026-01-05 05:48:34	1342177288	submission.event.fileRevised	0
144	515	17	23	2026-01-05 05:48:36	1342177296	submission.event.fileEdited	0
145	1048585	17	23	2026-01-05 05:48:36	1342177296	submission.event.fileEdited	0
146	1048585	17	23	2026-01-05 05:48:38	268435458	submission.event.general.metadataUpdated	0
147	1048585	17	23	2026-01-05 05:48:39	268435457	submission.event.submissionSubmitted	0
148	1048585	17	3	2026-01-05 05:48:43	268435462	publication.event.published	0
149	1048585	18	24	2026-01-05 05:48:49	268435458	submission.event.general.metadataUpdated	0
150	515	18	24	2026-01-05 05:48:58	1342177281	submission.event.fileUploaded	0
151	1048585	18	24	2026-01-05 05:48:58	1342177288	submission.event.fileRevised	0
152	515	18	24	2026-01-05 05:49:00	1342177296	submission.event.fileEdited	0
153	1048585	18	24	2026-01-05 05:49:00	1342177296	submission.event.fileEdited	0
154	1048585	18	24	2026-01-05 05:49:02	268435458	submission.event.general.metadataUpdated	0
155	1048585	18	24	2026-01-05 05:49:03	268435457	submission.event.submissionSubmitted	0
156	1048585	18	3	2026-01-05 05:49:07	268435462	publication.event.published	0
157	1048585	19	25	2026-01-05 05:49:13	268435458	submission.event.general.metadataUpdated	0
158	515	19	25	2026-01-05 05:49:21	1342177281	submission.event.fileUploaded	0
159	1048585	19	25	2026-01-05 05:49:21	1342177288	submission.event.fileRevised	0
160	515	19	25	2026-01-05 05:49:23	1342177296	submission.event.fileEdited	0
161	1048585	19	25	2026-01-05 05:49:23	1342177296	submission.event.fileEdited	0
162	1048585	19	25	2026-01-05 05:49:25	268435458	submission.event.general.metadataUpdated	0
163	1048585	19	25	2026-01-05 05:49:26	268435457	submission.event.submissionSubmitted	0
164	1048585	19	3	2026-01-05 05:49:30	268435462	publication.event.published	0
\.


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
20	fileStage	10	int
20	sourceSubmissionFileId	\N	string
20	submissionFileId	3	int
20	fileId	3	int
20	submissionId	3	int
20	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
20	username	cmontgomerie	string
21	fileStage	10	int
21	submissionFileId	3	int
21	fileId	3	int
21	submissionId	3	int
21	username	cmontgomerie	string
21	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
22	fileStage	10	int
22	sourceSubmissionFileId	\N	string
22	submissionFileId	3	int
22	fileId	3	int
22	submissionId	3	int
22	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
22	username	cmontgomerie	string
23	fileStage	10	int
23	sourceSubmissionFileId	\N	string
23	submissionFileId	3	int
23	fileId	3	int
23	submissionId	3	int
23	username	cmontgomerie	string
23	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
23	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
36	fileStage	10	int
36	sourceSubmissionFileId	\N	string
36	submissionFileId	4	int
36	fileId	4	int
36	submissionId	4	int
36	originalFileName	Genetic transformation of forest trees.pdf	string
36	username	ddiouf	string
37	fileStage	10	int
37	submissionFileId	4	int
37	fileId	4	int
37	submissionId	4	int
37	username	ddiouf	string
37	name	Genetic transformation of forest trees.pdf	string
38	fileStage	10	int
38	sourceSubmissionFileId	\N	string
38	submissionFileId	4	int
38	fileId	4	int
38	submissionId	4	int
38	originalFileName	Genetic transformation of forest trees.pdf	string
38	username	ddiouf	string
39	fileStage	10	int
39	sourceSubmissionFileId	\N	string
39	submissionFileId	4	int
39	fileId	4	int
39	submissionId	4	int
39	username	ddiouf	string
39	originalFileName	Genetic transformation of forest trees.pdf	string
39	name	Genetic transformation of forest trees.pdf	string
44	fileStage	10	int
44	sourceSubmissionFileId	\N	string
44	submissionFileId	5	int
44	fileId	5	int
44	submissionId	5	int
44	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
44	username	dphillips	string
45	fileStage	10	int
45	submissionFileId	5	int
45	fileId	5	int
45	submissionId	5	int
45	username	dphillips	string
45	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
46	fileStage	10	int
46	sourceSubmissionFileId	\N	string
46	submissionFileId	5	int
46	fileId	5	int
46	submissionId	5	int
46	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
46	username	dphillips	string
47	fileStage	10	int
47	sourceSubmissionFileId	\N	string
47	submissionFileId	5	int
47	fileId	5	int
47	submissionId	5	int
47	username	dphillips	string
47	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
47	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
52	fileStage	10	int
52	sourceSubmissionFileId	\N	string
52	submissionFileId	6	int
52	fileId	6	int
52	submissionId	6	int
52	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
52	username	dsokoloff	string
53	fileStage	10	int
53	submissionFileId	6	int
53	fileId	6	int
53	submissionId	6	int
53	username	dsokoloff	string
53	name	Developing efficacy beliefs in the classroom.pdf	string
54	fileStage	10	int
54	sourceSubmissionFileId	\N	string
54	submissionFileId	6	int
54	fileId	6	int
54	submissionId	6	int
54	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
54	username	dsokoloff	string
55	fileStage	10	int
55	sourceSubmissionFileId	\N	string
55	submissionFileId	6	int
55	fileId	6	int
55	submissionId	6	int
55	username	dsokoloff	string
55	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
55	name	Developing efficacy beliefs in the classroom.pdf	string
60	fileStage	10	int
60	sourceSubmissionFileId	\N	string
60	submissionFileId	7	int
60	fileId	7	int
60	submissionId	7	int
60	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
60	username	eostrom	string
61	fileStage	10	int
61	submissionFileId	7	int
61	fileId	7	int
61	submissionId	7	int
61	username	eostrom	string
61	name	Traditions and Trends in the Study of the Commons.pdf	string
62	fileStage	10	int
62	sourceSubmissionFileId	\N	string
62	submissionFileId	7	int
62	fileId	7	int
62	submissionId	7	int
62	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
62	username	eostrom	string
63	fileStage	10	int
63	sourceSubmissionFileId	\N	string
63	submissionFileId	7	int
63	fileId	7	int
63	submissionId	7	int
63	username	eostrom	string
63	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
63	name	Traditions and Trends in the Study of the Commons.pdf	string
69	fileStage	10	int
69	sourceSubmissionFileId	\N	string
69	submissionFileId	8	int
69	fileId	8	int
69	submissionId	8	int
69	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
69	username	fpaglieri	string
70	fileStage	10	int
70	submissionFileId	8	int
70	fileId	8	int
70	submissionId	8	int
70	username	fpaglieri	string
70	name	Hansen & Pinto: Reason Reclaimed.pdf	string
71	fileStage	10	int
71	sourceSubmissionFileId	\N	string
71	submissionFileId	8	int
71	fileId	8	int
71	submissionId	8	int
71	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
71	username	fpaglieri	string
72	fileStage	10	int
72	sourceSubmissionFileId	\N	string
72	submissionFileId	8	int
72	fileId	8	int
72	submissionId	8	int
72	username	fpaglieri	string
72	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
72	name	Hansen & Pinto: Reason Reclaimed.pdf	string
77	fileStage	10	int
77	sourceSubmissionFileId	\N	string
77	submissionFileId	9	int
77	fileId	9	int
77	submissionId	9	int
77	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
77	username	jmwandenga	string
78	fileStage	10	int
78	submissionFileId	9	int
78	fileId	9	int
78	submissionId	9	int
78	username	jmwandenga	string
78	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
79	fileStage	10	int
79	sourceSubmissionFileId	\N	string
79	submissionFileId	9	int
79	fileId	9	int
79	submissionId	9	int
79	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
79	username	jmwandenga	string
80	fileStage	10	int
80	sourceSubmissionFileId	\N	string
80	submissionFileId	9	int
80	fileId	9	int
80	submissionId	9	int
80	username	jmwandenga	string
80	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
80	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
85	fileStage	10	int
85	sourceSubmissionFileId	\N	string
85	submissionFileId	10	int
85	fileId	10	int
85	submissionId	10	int
85	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
85	username	jnovak	string
86	fileStage	10	int
86	submissionFileId	10	int
86	fileId	10	int
86	submissionId	10	int
86	username	jnovak	string
86	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
87	fileStage	10	int
87	sourceSubmissionFileId	\N	string
87	submissionFileId	10	int
87	fileId	10	int
87	submissionId	10	int
87	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
87	username	jnovak	string
88	fileStage	10	int
88	sourceSubmissionFileId	\N	string
88	submissionFileId	10	int
88	fileId	10	int
88	submissionId	10	int
88	username	jnovak	string
88	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
88	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
93	fileStage	10	int
93	sourceSubmissionFileId	\N	string
93	submissionFileId	11	int
93	fileId	11	int
93	submissionId	11	int
93	originalFileName	Learning Sustainable Design through Service.pdf	string
93	username	kalkhafaji	string
94	fileStage	10	int
94	submissionFileId	11	int
94	fileId	11	int
94	submissionId	11	int
94	username	kalkhafaji	string
94	name	Learning Sustainable Design through Service.pdf	string
95	fileStage	10	int
95	sourceSubmissionFileId	\N	string
95	submissionFileId	11	int
95	fileId	11	int
95	submissionId	11	int
95	originalFileName	Learning Sustainable Design through Service.pdf	string
95	username	kalkhafaji	string
96	fileStage	10	int
96	sourceSubmissionFileId	\N	string
96	submissionFileId	11	int
96	fileId	11	int
96	submissionId	11	int
96	username	kalkhafaji	string
96	originalFileName	Learning Sustainable Design through Service.pdf	string
96	name	Learning Sustainable Design through Service.pdf	string
102	fileStage	10	int
102	sourceSubmissionFileId	\N	string
102	submissionFileId	12	int
102	fileId	12	int
102	submissionId	12	int
102	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
102	username	lchristopher	string
103	fileStage	10	int
103	submissionFileId	12	int
103	fileId	12	int
103	submissionId	12	int
103	username	lchristopher	string
103	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
104	fileStage	10	int
104	sourceSubmissionFileId	\N	string
104	submissionFileId	12	int
104	fileId	12	int
104	submissionId	12	int
104	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
104	username	lchristopher	string
105	fileStage	10	int
105	sourceSubmissionFileId	\N	string
105	submissionFileId	12	int
105	fileId	12	int
105	submissionId	12	int
105	username	lchristopher	string
105	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
105	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
110	fileStage	10	int
110	sourceSubmissionFileId	\N	string
110	submissionFileId	13	int
110	fileId	13	int
110	submissionId	13	int
110	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
110	username	lkumiega	string
111	fileStage	10	int
111	submissionFileId	13	int
111	fileId	13	int
111	submissionId	13	int
111	username	lkumiega	string
111	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
112	fileStage	10	int
112	sourceSubmissionFileId	\N	string
112	submissionFileId	13	int
112	fileId	13	int
112	submissionId	13	int
112	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
112	username	lkumiega	string
113	fileStage	10	int
113	sourceSubmissionFileId	\N	string
113	submissionFileId	13	int
113	fileId	13	int
113	submissionId	13	int
113	username	lkumiega	string
113	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
113	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
118	fileStage	10	int
118	sourceSubmissionFileId	\N	string
118	submissionFileId	14	int
118	fileId	14	int
118	submissionId	14	int
118	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
118	username	pdaniel	string
119	fileStage	10	int
119	submissionFileId	14	int
119	fileId	14	int
119	submissionId	14	int
119	username	pdaniel	string
119	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
120	fileStage	10	int
120	sourceSubmissionFileId	\N	string
120	submissionFileId	14	int
120	fileId	14	int
120	submissionId	14	int
120	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
120	username	pdaniel	string
121	fileStage	10	int
121	sourceSubmissionFileId	\N	string
121	submissionFileId	14	int
121	fileId	14	int
121	submissionId	14	int
121	username	pdaniel	string
121	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
121	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
126	fileStage	10	int
126	sourceSubmissionFileId	\N	string
126	submissionFileId	15	int
126	fileId	15	int
126	submissionId	15	int
126	originalFileName	Yam diseases and its management in Nigeria.pdf	string
126	username	rbaiyewu	string
127	fileStage	10	int
127	submissionFileId	15	int
127	fileId	15	int
127	submissionId	15	int
127	username	rbaiyewu	string
127	name	Yam diseases and its management in Nigeria.pdf	string
128	fileStage	10	int
128	sourceSubmissionFileId	\N	string
128	submissionFileId	15	int
128	fileId	15	int
128	submissionId	15	int
128	originalFileName	Yam diseases and its management in Nigeria.pdf	string
128	username	rbaiyewu	string
129	fileStage	10	int
129	sourceSubmissionFileId	\N	string
129	submissionFileId	15	int
129	fileId	15	int
129	submissionId	15	int
129	username	rbaiyewu	string
129	originalFileName	Yam diseases and its management in Nigeria.pdf	string
129	name	Yam diseases and its management in Nigeria.pdf	string
134	fileStage	10	int
134	sourceSubmissionFileId	\N	string
134	submissionFileId	16	int
134	fileId	16	int
134	submissionId	16	int
134	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
134	username	rrossi	string
135	fileStage	10	int
135	submissionFileId	16	int
135	fileId	16	int
135	submissionId	16	int
135	username	rrossi	string
135	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
136	fileStage	10	int
136	sourceSubmissionFileId	\N	string
136	submissionFileId	16	int
136	fileId	16	int
136	submissionId	16	int
136	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
136	username	rrossi	string
137	fileStage	10	int
137	sourceSubmissionFileId	\N	string
137	submissionFileId	16	int
137	fileId	16	int
137	submissionId	16	int
137	username	rrossi	string
137	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
137	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
142	fileStage	10	int
142	sourceSubmissionFileId	\N	string
142	submissionFileId	17	int
142	fileId	17	int
142	submissionId	17	int
142	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
142	username	vkarbasizaed	string
143	fileStage	10	int
143	submissionFileId	17	int
143	fileId	17	int
143	submissionId	17	int
143	username	vkarbasizaed	string
143	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
144	fileStage	10	int
144	sourceSubmissionFileId	\N	string
144	submissionFileId	17	int
144	fileId	17	int
144	submissionId	17	int
144	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
144	username	vkarbasizaed	string
145	fileStage	10	int
145	sourceSubmissionFileId	\N	string
145	submissionFileId	17	int
145	fileId	17	int
145	submissionId	17	int
145	username	vkarbasizaed	string
145	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
145	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
150	fileStage	10	int
150	sourceSubmissionFileId	\N	string
150	submissionFileId	18	int
150	fileId	18	int
150	submissionId	18	int
150	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
150	username	vwilliamson	string
151	fileStage	10	int
151	submissionFileId	18	int
151	fileId	18	int
151	submissionId	18	int
151	username	vwilliamson	string
151	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
152	fileStage	10	int
152	sourceSubmissionFileId	\N	string
152	submissionFileId	18	int
152	fileId	18	int
152	submissionId	18	int
152	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
152	username	vwilliamson	string
153	fileStage	10	int
153	sourceSubmissionFileId	\N	string
153	submissionFileId	18	int
153	fileId	18	int
153	submissionId	18	int
153	username	vwilliamson	string
153	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
153	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
158	fileStage	10	int
158	sourceSubmissionFileId	\N	string
158	submissionFileId	19	int
158	fileId	19	int
158	submissionId	19	int
158	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
158	username	zwoods	string
159	fileStage	10	int
159	submissionFileId	19	int
159	fileId	19	int
159	submissionId	19	int
159	username	zwoods	string
159	name	Finocchiaro: Arguments About Arguments.pdf	string
160	fileStage	10	int
160	sourceSubmissionFileId	\N	string
160	submissionFileId	19	int
160	fileId	19	int
160	submissionId	19	int
160	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
160	username	zwoods	string
161	fileStage	10	int
161	sourceSubmissionFileId	\N	string
161	submissionFileId	19	int
161	fileId	19	int
161	submissionId	19	int
161	username	zwoods	string
161	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
161	name	Finocchiaro: Arguments About Arguments.pdf	string
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	journals/1/articles/1/695b4f2c07e59.pdf	application/pdf
2	journals/1/articles/2/695b4f3eaea28.pdf	application/pdf
3	journals/1/articles/3/695b4f5e1b2ff.pdf	application/pdf
4	journals/1/articles/4/695b4f87941c5.pdf	application/pdf
5	journals/1/articles/5/695b4f9dbb6e1.pdf	application/pdf
6	journals/1/articles/6/695b4fb46a065.pdf	application/pdf
7	journals/1/articles/7/695b4fca87133.pdf	application/pdf
8	journals/1/articles/8/695b4fe340023.pdf	application/pdf
9	journals/1/articles/9/695b4ff963cbd.pdf	application/pdf
10	journals/1/articles/10/695b500fd10bd.pdf	application/pdf
11	journals/1/articles/11/695b5026400b6.pdf	application/pdf
12	journals/1/articles/12/695b503f46ffc.pdf	application/pdf
13	journals/1/articles/13/695b50564c6d5.pdf	application/pdf
14	journals/1/articles/14/695b506d622f6.pdf	application/pdf
15	journals/1/articles/15/695b508454ae2.pdf	application/pdf
16	journals/1/articles/16/695b509adc4f9.pdf	application/pdf
17	journals/1/articles/17/695b50b2333ea.pdf	application/pdf
18	journals/1/articles/18/695b50ca456b3.pdf	application/pdf
19	journals/1/articles/19/695b50e194d56.pdf	application/pdf
\.


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	article=>dc11	plugins.metadata.dc11.articleAdapter.displayName	plugins.metadata.dc11.articleAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)
2	preprint=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)
\.


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
-- Data for Name: journal_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.journal_settings (journal_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	fr_CA	authorInformation	##default.contextSettings.forAuthors##	\N
1		contactEmail	rvaca@mailinator.com	\N
1		numPageLinks	10	\N
1	fr_CA	readerInformation	##default.contextSettings.forReaders##	\N
1	en_US	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		contactName	Ramiro Vaca	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	en_US	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>	\N
1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##	\N
1	en_US	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously posted."},{"order":2,"content":"The submission file is in OpenOffice, Microsoft Word, or RTF document file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines."}]	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"La soumission n'a pas déjà été publiée et n'est pas considérée actuellement par un autre serveur. Si ce n'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice »."},{"order":2,"content":"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect."},{"order":3,"content":"Lorsque possible, les URL des références ont été fournies."},{"order":4,"content":"##default.contextSettings.checklist.submissionAppearance##"},{"order":5,"content":"##default.contextSettings.checklist.bibliographicRequirements##"}]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1	en_US	acronym	JPKPKP	\N
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
1		themePluginPath	default	\N
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
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics (load_id, context_id, pkp_section_id, assoc_object_type, assoc_object_id, submission_id, representation_id, assoc_type, assoc_id, day, month, file_type, country_id, region, city, metric_type, metric) FROM stdin;
\.


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
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	0	user	User Navigation Menu
2	1	user	User Navigation Menu
3	1	primary	Primary Navigation Menu
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notes (note_id, assoc_type, assoc_id, user_id, date_created, date_modified, title, contents) FROM stdin;
\.


--
-- Data for Name: notification_mail_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notification_mail_list (notification_mail_list_id, email, confirmed, token, context) FROM stdin;
\.


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
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notifications (notification_id, context_id, user_id, level, type, date_created, date_read, assoc_type, assoc_id) FROM stdin;
80	1	0	2	16777243	2026-01-05 05:46:44	\N	1048585	12
70	1	0	3	16777222	2026-01-05 05:46:21	\N	1048585	11
3	1	0	3	16777222	2026-01-05 05:42:08	\N	1048585	1
4	1	0	3	16777223	2026-01-05 05:42:08	\N	1048585	1
5	1	5	2	16777217	2026-01-05 05:42:08	\N	1048585	1
6	1	4	2	16777217	2026-01-05 05:42:09	\N	1048585	1
7	1	0	2	16777243	2026-01-05 05:42:09	\N	1048585	1
8	1	0	2	16777245	2026-01-05 05:42:09	\N	1048585	1
9	1	0	3	16777222	2026-01-05 05:42:27	\N	1048585	2
10	1	0	3	16777223	2026-01-05 05:42:27	\N	1048585	2
11	1	5	2	16777217	2026-01-05 05:42:27	\N	1048585	2
12	1	4	2	16777217	2026-01-05 05:42:27	\N	1048585	2
13	1	0	2	16777243	2026-01-05 05:42:27	\N	1048585	2
14	1	0	2	16777245	2026-01-05 05:42:27	\N	1048585	2
71	1	0	3	16777223	2026-01-05 05:46:21	\N	1048585	11
72	1	5	2	16777217	2026-01-05 05:46:21	\N	1048585	11
17	1	0	3	16777222	2026-01-05 05:43:01	\N	1048585	3
18	1	0	3	16777223	2026-01-05 05:43:01	\N	1048585	3
19	1	5	2	16777217	2026-01-05 05:43:01	\N	1048585	3
20	1	4	2	16777217	2026-01-05 05:43:01	\N	1048585	3
21	1	0	2	16777243	2026-01-05 05:43:01	\N	1048585	3
22	1	0	2	16777245	2026-01-05 05:43:01	\N	1048585	3
23	1	9	3	16777259	2026-01-05 05:43:16	\N	1048585	3
24	1	5	3	16777259	2026-01-05 05:43:16	\N	1048585	3
25	1	4	3	16777259	2026-01-05 05:43:17	\N	1048585	3
26	1	0	3	16777222	2026-01-05 05:43:40	\N	1048585	4
27	1	0	3	16777223	2026-01-05 05:43:40	\N	1048585	4
28	1	5	2	16777217	2026-01-05 05:43:40	\N	1048585	4
29	1	4	2	16777217	2026-01-05 05:43:40	\N	1048585	4
30	1	0	2	16777243	2026-01-05 05:43:40	\N	1048585	4
31	1	0	2	16777245	2026-01-05 05:43:40	\N	1048585	4
32	1	0	3	16777222	2026-01-05 05:44:02	\N	1048585	5
33	1	0	3	16777223	2026-01-05 05:44:02	\N	1048585	5
34	1	5	2	16777217	2026-01-05 05:44:02	\N	1048585	5
35	1	4	2	16777217	2026-01-05 05:44:02	\N	1048585	5
36	1	0	2	16777243	2026-01-05 05:44:03	\N	1048585	5
37	1	0	2	16777245	2026-01-05 05:44:03	\N	1048585	5
38	1	0	3	16777222	2026-01-05 05:44:25	\N	1048585	6
39	1	0	3	16777223	2026-01-05 05:44:25	\N	1048585	6
40	1	5	2	16777217	2026-01-05 05:44:25	\N	1048585	6
41	1	4	2	16777217	2026-01-05 05:44:25	\N	1048585	6
42	1	0	2	16777243	2026-01-05 05:44:25	\N	1048585	6
43	1	0	2	16777245	2026-01-05 05:44:25	\N	1048585	6
73	1	4	2	16777217	2026-01-05 05:46:21	\N	1048585	11
45	1	0	3	16777222	2026-01-05 05:44:49	\N	1048585	7
46	1	0	3	16777223	2026-01-05 05:44:49	\N	1048585	7
47	1	5	2	16777217	2026-01-05 05:44:49	\N	1048585	7
48	1	4	2	16777217	2026-01-05 05:44:49	\N	1048585	7
49	1	0	2	16777243	2026-01-05 05:44:49	\N	1048585	7
50	1	0	2	16777245	2026-01-05 05:44:49	\N	1048585	7
51	1	0	3	16777222	2026-01-05 05:45:11	\N	1048585	8
52	1	0	3	16777223	2026-01-05 05:45:11	\N	1048585	8
53	1	5	2	16777217	2026-01-05 05:45:11	\N	1048585	8
54	1	4	2	16777217	2026-01-05 05:45:11	\N	1048585	8
55	1	0	2	16777243	2026-01-05 05:45:11	\N	1048585	8
56	1	0	2	16777245	2026-01-05 05:45:11	\N	1048585	8
57	1	0	3	16777222	2026-01-05 05:45:34	\N	1048585	9
58	1	0	3	16777223	2026-01-05 05:45:34	\N	1048585	9
59	1	5	2	16777217	2026-01-05 05:45:34	\N	1048585	9
60	1	4	2	16777217	2026-01-05 05:45:34	\N	1048585	9
61	1	0	2	16777243	2026-01-05 05:45:34	\N	1048585	9
62	1	0	2	16777245	2026-01-05 05:45:34	\N	1048585	9
63	1	0	3	16777222	2026-01-05 05:45:56	\N	1048585	10
64	1	0	3	16777223	2026-01-05 05:45:56	\N	1048585	10
65	1	5	2	16777217	2026-01-05 05:45:56	\N	1048585	10
66	1	4	2	16777217	2026-01-05 05:45:56	\N	1048585	10
67	1	0	2	16777243	2026-01-05 05:45:56	\N	1048585	10
68	1	0	2	16777245	2026-01-05 05:45:56	\N	1048585	10
74	1	0	2	16777243	2026-01-05 05:46:21	\N	1048585	11
75	1	0	2	16777245	2026-01-05 05:46:21	\N	1048585	11
76	1	0	3	16777222	2026-01-05 05:46:44	\N	1048585	12
77	1	0	3	16777223	2026-01-05 05:46:44	\N	1048585	12
78	1	5	2	16777217	2026-01-05 05:46:44	\N	1048585	12
79	1	4	2	16777217	2026-01-05 05:46:44	\N	1048585	12
81	1	0	2	16777245	2026-01-05 05:46:44	\N	1048585	12
82	1	0	3	16777222	2026-01-05 05:47:07	\N	1048585	13
83	1	0	3	16777223	2026-01-05 05:47:07	\N	1048585	13
84	1	5	2	16777217	2026-01-05 05:47:07	\N	1048585	13
85	1	4	2	16777217	2026-01-05 05:47:07	\N	1048585	13
86	1	0	2	16777243	2026-01-05 05:47:07	\N	1048585	13
87	1	0	2	16777245	2026-01-05 05:47:07	\N	1048585	13
88	1	0	3	16777222	2026-01-05 05:47:30	\N	1048585	14
89	1	0	3	16777223	2026-01-05 05:47:30	\N	1048585	14
90	1	5	2	16777217	2026-01-05 05:47:30	\N	1048585	14
91	1	4	2	16777217	2026-01-05 05:47:30	\N	1048585	14
92	1	0	2	16777243	2026-01-05 05:47:30	\N	1048585	14
93	1	0	2	16777245	2026-01-05 05:47:30	\N	1048585	14
94	1	0	3	16777222	2026-01-05 05:47:52	\N	1048585	15
95	1	0	3	16777223	2026-01-05 05:47:52	\N	1048585	15
96	1	5	2	16777217	2026-01-05 05:47:52	\N	1048585	15
97	1	4	2	16777217	2026-01-05 05:47:53	\N	1048585	15
98	1	0	2	16777243	2026-01-05 05:47:53	\N	1048585	15
99	1	0	2	16777245	2026-01-05 05:47:53	\N	1048585	15
100	1	0	3	16777222	2026-01-05 05:48:15	\N	1048585	16
101	1	0	3	16777223	2026-01-05 05:48:15	\N	1048585	16
102	1	5	2	16777217	2026-01-05 05:48:15	\N	1048585	16
103	1	4	2	16777217	2026-01-05 05:48:16	\N	1048585	16
104	1	0	2	16777243	2026-01-05 05:48:16	\N	1048585	16
105	1	0	2	16777245	2026-01-05 05:48:16	\N	1048585	16
106	1	0	3	16777222	2026-01-05 05:48:39	\N	1048585	17
107	1	0	3	16777223	2026-01-05 05:48:39	\N	1048585	17
108	1	5	2	16777217	2026-01-05 05:48:39	\N	1048585	17
109	1	4	2	16777217	2026-01-05 05:48:39	\N	1048585	17
110	1	0	2	16777243	2026-01-05 05:48:39	\N	1048585	17
111	1	0	2	16777245	2026-01-05 05:48:39	\N	1048585	17
112	1	0	3	16777222	2026-01-05 05:49:03	\N	1048585	18
113	1	0	3	16777223	2026-01-05 05:49:03	\N	1048585	18
114	1	5	2	16777217	2026-01-05 05:49:03	\N	1048585	18
115	1	4	2	16777217	2026-01-05 05:49:03	\N	1048585	18
116	1	0	2	16777243	2026-01-05 05:49:03	\N	1048585	18
117	1	0	2	16777245	2026-01-05 05:49:03	\N	1048585	18
118	1	0	3	16777222	2026-01-05 05:49:26	\N	1048585	19
119	1	0	3	16777223	2026-01-05 05:49:26	\N	1048585	19
120	1	5	2	16777217	2026-01-05 05:49:26	\N	1048585	19
121	1	4	2	16777217	2026-01-05 05:49:26	\N	1048585	19
122	1	0	2	16777243	2026-01-05 05:49:26	\N	1048585	19
123	1	0	2	16777245	2026-01-05 05:49:26	\N	1048585	19
\.


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
tinymceplugin	0	enabled	1	bool
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	["city","region"]	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
usageeventplugin	0	enabled	1	bool
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
usageeventplugin	0	uniqueSiteId	695b4ecd69ab7	string
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
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
2		categoryIds	[]
2	en_US	copyrightHolder	Public Knowledge Preprint Server
2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
2		copyrightYear	2026
2	en_US	subtitle	A Nine-Nation Comparative Study Of Construct Equivalence
2	en_US	title	The Facets Of Job Satisfaction
9	en_US	abstract	<p>None.</p>
9	fr_CA	abstract	
9	en_US	prefix	
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	en_US	title	Hansen & Pinto: Reason Reclaimed
9	fr_CA	title	
10	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
10	fr_CA	abstract	
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
10	fr_CA	title	
11	en_US	copyrightHolder	Public Knowledge Preprint Server
3	fr_CA	abstract	
3		categoryIds	[]
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
3	fr_CA	title	
11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
11		copyrightYear	2026
12	en_US	title	Learning Sustainable Design through Service
12	fr_CA	title	
13	en_US	copyrightHolder	Public Knowledge Preprint Server
13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
13		copyrightYear	2026
15		categoryIds	[]
16	fr_CA	title	
18	en_US	copyrightHolder	Public Knowledge Preprint Server
18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
18		copyrightYear	2026
20		categoryIds	[]
4	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
4		categoryIds	[]
4	en_US	copyrightHolder	Craig Montgomerie
4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
4		copyrightYear	2026
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
3	en_US	copyrightHolder	Public Knowledge Preprint Server
3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
3		copyrightYear	2026
9	en_US	copyrightHolder	Public Knowledge Preprint Server
4	fr_CA	subtitle	
4	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
4	fr_CA	title	
6	fr_CA	title	
6	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
4	fr_CA	abstract	
6	fr_CA	abstract	
5	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	copyrightHolder	Public Knowledge Preprint Server
5	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
5		copyrightYear	2026
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Genetic transformation of forest trees
5	fr_CA	title	
6		categoryIds	[]
6	en_US	copyrightHolder	Public Knowledge Preprint Server
6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
6		copyrightYear	2026
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
7	fr_CA	abstract	
9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9		copyrightYear	2026
7		categoryIds	[]
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Developing efficacy beliefs in the classroom
7	fr_CA	title	
10	en_US	copyrightHolder	Public Knowledge Preprint Server
10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10		copyrightYear	2026
12		categoryIds	[]
12	en_US	copyrightHolder	Public Knowledge Preprint Server
12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12		copyrightYear	2026
14		categoryIds	[]
15	en_US	copyrightHolder	Public Knowledge Preprint Server
15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15		copyrightYear	2026
17		categoryIds	[]
19		categoryIds	[]
20	fr_CA	abstract	
20	en_US	prefix	
20	fr_CA	prefix	
7	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
7	en_US	copyrightHolder	Public Knowledge Preprint Server
7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
7		copyrightYear	2026
12	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
9		categoryIds	[]
8	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	copyrightHolder	Public Knowledge Preprint Server
8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
8		copyrightYear	2026
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Traditions and Trends in the Study of the Commons
8	fr_CA	title	
12	fr_CA	abstract	
12	en_US	prefix	
12	fr_CA	prefix	
10		categoryIds	[]
12	en_US	subtitle	
12	fr_CA	subtitle	
11	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
11	fr_CA	title	
19	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
13		categoryIds	[]
14	en_US	copyrightHolder	Public Knowledge Preprint Server
14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
14		copyrightYear	2026
19	fr_CA	abstract	
16		categoryIds	[]
17	en_US	copyrightHolder	Public Knowledge Preprint Server
17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
17		copyrightYear	2026
19	en_US	prefix	
19	fr_CA	prefix	
19	en_US	subtitle	
19	fr_CA	subtitle	
19	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments
19	fr_CA	title	
20	en_US	subtitle	
20	fr_CA	subtitle	
20	en_US	title	Finocchiaro: Arguments About Arguments
20	fr_CA	title	
13	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
13	fr_CA	abstract	
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
13	fr_CA	title	
14	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
14	fr_CA	abstract	
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
14	fr_CA	title	
15	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
15	fr_CA	abstract	
15	en_US	prefix	
15	fr_CA	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
15	fr_CA	title	
16	fr_CA	abstract	
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
16	en_US	title	Yam diseases and its management in Nigeria
18		categoryIds	[]
19	en_US	copyrightHolder	Public Knowledge Preprint Server
19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
19		copyrightYear	2026
20	en_US	abstract	<p>None.</p>
20	en_US	copyrightHolder	Public Knowledge Preprint Server
20	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
20		copyrightYear	2026
16	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
16	en_US	copyrightHolder	Public Knowledge Preprint Server
16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16		copyrightYear	2026
17	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>
17	fr_CA	abstract	
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
17	fr_CA	title	
18	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
18	fr_CA	abstract	
18	en_US	prefix	
18	fr_CA	prefix	
18	en_US	subtitle	
18	fr_CA	subtitle	
18	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
18	fr_CA	title	
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, locale, primary_contact_id, section_id, submission_id, status, url_path, version) FROM stdin;
1	0	\N	2026-01-05 05:42:08	\N	1	1	1	1	\N	1
17	0	2026-01-05	2026-01-05 05:48:20	\N	22	1	16	3	\N	1
18	0	2026-01-05	2026-01-05 05:48:43	\N	23	1	17	3	\N	1
2	0	2026-01-05	2026-01-05 05:42:40	\N	2	1	2	3	\N	1
19	0	2026-01-05	2026-01-05 05:49:07	\N	24	1	18	3	\N	1
3	0	2026-01-05	2026-01-05 05:43:14	\N	4	1	3	3	\N	1
20	0	2026-01-05	2026-01-05 05:49:30	\N	25	1	19	3	\N	1
4	0	2026-01-05	2026-01-05 05:43:21	\N	6	1	3	3	\N	2
5	0	2026-01-05	2026-01-05 05:43:44	\N	8	1	4	3	\N	1
6	0	2026-01-05	2026-01-05 05:44:06	\N	9	1	5	3	\N	1
7	0	2026-01-05	2026-01-05 05:44:29	\N	10	1	6	3	\N	1
8	0	2026-01-05	2026-01-05 05:44:53	\N	11	1	7	3	\N	1
9	0	2026-01-05	2026-01-05 05:45:15	\N	13	1	8	3	\N	1
10	0	2026-01-05	2026-01-05 05:45:38	\N	14	1	9	3	\N	1
11	0	2026-01-05	2026-01-05 05:46:00	\N	15	1	10	3	\N	1
12	0	2026-01-05	2026-01-05 05:46:25	\N	16	1	11	3	\N	1
13	0	2026-01-05	2026-01-05 05:46:48	\N	18	1	12	3	\N	1
14	0	2026-01-05	2026-01-05 05:47:11	\N	19	1	13	3	\N	1
15	0	2026-01-05	2026-01-05 05:47:34	\N	20	1	14	3	\N	1
16	0	2026-01-05	2026-01-05 05:47:57	\N	21	1	15	3	\N	1
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
\.


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
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.scheduled_tasks (class_name, last_run) FROM stdin;
plugins.generic.usageStats.UsageStatsLoader	2026-01-05 05:40:18
lib.pkp.classes.task.StatisticsReport	2026-01-05 05:40:18
\.


--
-- Data for Name: section_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.section_settings (section_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Preprints	string
1	fr_CA	title		string
1	en_US	policy	<p>##section.default.policy##</p>	string
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
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
7v94pikpese3pqmjv0gncri7r9	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591617	1767591617	0		localhost
10n87bbsdlumd98el2qcm72vkp	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591650	1767591684	0	csrf|a:2:{s:9:"timestamp";i:1767591684;s:5:"token";s:32:"d625c51b168e799747ede70950002e52";}username|s:5:"rvaca";	localhost
okv3mpp3t0pk1h9hn76np04l9t	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591894	1767591916	1	csrf|a:2:{s:9:"timestamp";i:1767591916;s:5:"token";s:32:"4a53fb0b650225356d47a96abe6f5b0d";}username|s:7:"dbarnes";userId|i:3;	localhost
2csnhi0tc9l6pecujgp4h378dl	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591916	1767591938	1	csrf|a:2:{s:9:"timestamp";i:1767591938;s:5:"token";s:32:"5fb3a6df67188ab4abb89f64a54c25d8";}username|s:7:"dbarnes";userId|i:3;	localhost
s7elifqadrtu874330hrpbc12o	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591628	1767591638	1	csrf|a:2:{s:9:"timestamp";i:1767591638;s:5:"token";s:32:"46bcca3dc000cd466ba2bd5dc4a85f8d";}userId|i:1;username|s:5:"admin";	localhost
8ifmmbdblgfuagpmpcciq7vgc3	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591639	1767591644	1	csrf|a:2:{s:9:"timestamp";i:1767591644;s:5:"token";s:32:"ed464d4586c12b01b640586b56a2ecb7";}userId|i:1;username|s:5:"admin";	localhost
9ckos2fsbjhu8locd35memrh8u	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591618	1767591628	1	csrf|a:2:{s:9:"timestamp";i:1767591628;s:5:"token";s:32:"8f399a1596456240d4d65b8acc85d53c";}userId|i:1;username|s:5:"admin";	localhost
sa16gb9nmffn9c0eo0mkuum7kt	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591939	1767591961	1	csrf|a:2:{s:9:"timestamp";i:1767591961;s:5:"token";s:32:"cf45f61f64d80cf3eb016fcde812a2fc";}username|s:7:"dbarnes";userId|i:3;	localhost
ak6d7kgu17edebn55so1jjuelv	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591644	1767591649	1	csrf|a:2:{s:9:"timestamp";i:1767591649;s:5:"token";s:32:"617e36d0c9b401e2d478d0ce926f3b7d";}userId|i:1;username|s:5:"admin";	localhost
9qlt3pni43dv1sgluotf0r9846	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591711	1767591729	0	csrf|a:2:{s:9:"timestamp";i:1767591728;s:5:"token";s:32:"e165c97412c5c12acff88570bf3a0457";}username|s:7:"ccorino";userId|i:7;	localhost
ui4f0c0g3h62qk7o0l1vd21gad	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591961	1767591985	1	csrf|a:2:{s:9:"timestamp";i:1767591985;s:5:"token";s:32:"505563bd3f339a94fdd55d017d3e044b";}username|s:7:"dbarnes";userId|i:3;	localhost
rv665aiuvvu0sb53lm00aqshqi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591685	1767591690	0	csrf|a:2:{s:9:"timestamp";i:1767591690;s:5:"token";s:32:"a0a99f2386b0878fd1c47ad256a74369";}username|s:5:"admin";	localhost
ebu2ldn4p0qqb0f0k0ter1qd4i	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591730	1767591757	0	csrf|a:2:{s:9:"timestamp";i:1767591757;s:5:"token";s:32:"a788e1613254eb0d8f6fb4a522145af7";}username|s:8:"ckwantes";	localhost
djkn4aj6juiuof3t539hpg7ga7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591690	1767591710	0	csrf|a:2:{s:9:"timestamp";i:1767591710;s:5:"token";s:32:"0a381858925e24d9e05c116953ceed1f";}username|s:5:"admin";	localhost
gc6074llponm33gmpo313lrbaq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591757	1767591760	1	csrf|a:2:{s:9:"timestamp";i:1767591761;s:5:"token";s:32:"70d4d422a3e303cd23a8551a18cca8ed";}userId|i:3;username|s:7:"dbarnes";	localhost
ha2jfusuv71f8v0jviv9v3bvlf	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591986	1767592009	1	csrf|a:2:{s:9:"timestamp";i:1767592009;s:5:"token";s:32:"82c53f9d1c4ebf80bcf0285d41cf80ce";}username|s:7:"dbarnes";userId|i:3;	localhost
jahet1qf0e71d7rpu2jk33uacq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592009	1767592032	1	csrf|a:2:{s:9:"timestamp";i:1767592032;s:5:"token";s:32:"76ee818757b3632e2d6638ea5f6b7d42";}username|s:7:"dbarnes";userId|i:3;	localhost
oi4qeso34na8ld6j5mm87mejkg	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591761	1767591801	1	csrf|a:2:{s:9:"timestamp";i:1767591801;s:5:"token";s:32:"42c1fc7bdb521aa3d60ab6a440011992";}username|s:7:"dbarnes";userId|i:3;	localhost
ska1tjcbj5ohvue0k980daemqf	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591803	1767591824	1	csrf|a:2:{s:9:"timestamp";i:1767591824;s:5:"token";s:32:"4ad9e78ef234dab715ec31da9b3a4937";}username|s:7:"dbarnes";userId|i:3;	localhost
95dk7if338k5u9j813j1erjlcc	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591825	1767591847	1	csrf|a:2:{s:9:"timestamp";i:1767591847;s:5:"token";s:32:"c111154eeeb2f98a26edf8a847f29dd5";}username|s:7:"dbarnes";userId|i:3;	localhost
okb1n83bn8puo0flc2l8if06k2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591848	1767591869	1	csrf|a:2:{s:9:"timestamp";i:1767591869;s:5:"token";s:32:"37600473672aee0d2c60756817417872";}username|s:7:"dbarnes";userId|i:3;	localhost
rodugvkeenslo46deea1l2r61u	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767591870	1767591894	1	csrf|a:2:{s:9:"timestamp";i:1767591894;s:5:"token";s:32:"f08743f9b21c863465ee0ad10680aa40";}username|s:7:"dbarnes";userId|i:3;	localhost
n4r28c7okv9taj96mb864sc13o	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592125	1767592148	0	csrf|a:2:{s:9:"timestamp";i:1767592148;s:5:"token";s:32:"374072459aa3a1c301b45a462b348da7";}username|s:7:"dbarnes";	localhost
0kh0sg53s0ge6tk1uqihde1urj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592032	1767592055	1	csrf|a:2:{s:9:"timestamp";i:1767592055;s:5:"token";s:32:"637d2ecff7db4e827459201c218c5e41";}username|s:7:"dbarnes";userId|i:3;	localhost
1nge27mls0g8gd71fur8cefkqa	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592149	1767592170	1	csrf|a:2:{s:9:"timestamp";i:1767592170;s:5:"token";s:32:"a83238a704579d280b2110e37b25cb8f";}username|s:7:"dbarnes";userId|i:3;	localhost
jrqbr0n00l73ha4an1ecqrckme	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592101	1767592124	0	csrf|a:2:{s:9:"timestamp";i:1767592124;s:5:"token";s:32:"261506ec37b399de2979404571d37807";}username|s:7:"dbarnes";	localhost
d5ac45675ov5c9vqh4q3kgc096	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592055	1767592077	1	csrf|a:2:{s:9:"timestamp";i:1767592077;s:5:"token";s:32:"583d40f3034bb350c7149fe4c0b339a2";}username|s:7:"dbarnes";userId|i:3;	localhost
q9bbnd8rdin05rlioielffb3ni	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1767592078	1767592100	1	csrf|a:2:{s:9:"timestamp";i:1767592100;s:5:"token";s:32:"399178c2af18763afe1ce397618f4316";}username|s:7:"dbarnes";userId|i:3;	localhost
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
1	1	4	7	2026-01-05 05:41:55	0	1
2	1	3	5	2026-01-05 05:42:08	0	1
3	1	3	4	2026-01-05 05:42:08	0	1
4	2	4	8	2026-01-05 05:42:14	0	1
5	2	3	5	2026-01-05 05:42:27	0	1
6	2	3	4	2026-01-05 05:42:27	0	1
7	3	4	9	2026-01-05 05:42:45	0	1
8	3	3	5	2026-01-05 05:43:01	0	1
9	3	3	4	2026-01-05 05:43:01	0	1
10	4	4	10	2026-01-05 05:43:27	0	1
11	4	3	5	2026-01-05 05:43:40	0	1
12	4	3	4	2026-01-05 05:43:40	0	1
13	5	4	11	2026-01-05 05:43:49	0	1
14	5	3	5	2026-01-05 05:44:02	0	1
15	5	3	4	2026-01-05 05:44:02	0	1
16	6	4	12	2026-01-05 05:44:12	0	1
17	6	3	5	2026-01-05 05:44:25	0	1
18	6	3	4	2026-01-05 05:44:25	0	1
19	7	4	13	2026-01-05 05:44:34	0	1
20	7	3	5	2026-01-05 05:44:49	0	1
21	7	3	4	2026-01-05 05:44:49	0	1
22	8	4	14	2026-01-05 05:44:58	0	1
23	8	3	5	2026-01-05 05:45:11	0	1
24	8	3	4	2026-01-05 05:45:11	0	1
25	9	4	15	2026-01-05 05:45:21	0	1
26	9	3	5	2026-01-05 05:45:34	0	1
27	9	3	4	2026-01-05 05:45:34	0	1
28	10	4	16	2026-01-05 05:45:43	0	1
29	10	3	5	2026-01-05 05:45:56	0	1
30	10	3	4	2026-01-05 05:45:56	0	1
31	11	4	17	2026-01-05 05:46:05	0	1
32	11	3	5	2026-01-05 05:46:21	0	1
33	11	3	4	2026-01-05 05:46:21	0	1
34	12	4	18	2026-01-05 05:46:30	0	1
35	12	3	5	2026-01-05 05:46:44	0	1
36	12	3	4	2026-01-05 05:46:44	0	1
37	13	4	19	2026-01-05 05:46:53	0	1
38	13	3	5	2026-01-05 05:47:07	0	1
39	13	3	4	2026-01-05 05:47:07	0	1
40	14	4	20	2026-01-05 05:47:17	0	1
41	14	3	5	2026-01-05 05:47:30	0	1
42	14	3	4	2026-01-05 05:47:30	0	1
43	15	4	21	2026-01-05 05:47:40	0	1
44	15	3	5	2026-01-05 05:47:52	0	1
45	15	3	4	2026-01-05 05:47:52	0	1
46	16	4	22	2026-01-05 05:48:02	0	1
47	16	3	5	2026-01-05 05:48:15	0	1
48	16	3	4	2026-01-05 05:48:15	0	1
49	17	4	23	2026-01-05 05:48:25	0	1
50	17	3	5	2026-01-05 05:48:39	0	1
51	17	3	4	2026-01-05 05:48:39	0	1
52	18	4	24	2026-01-05 05:48:49	0	1
53	18	3	5	2026-01-05 05:49:03	0	1
54	18	3	4	2026-01-05 05:49:03	0	1
55	19	4	25	2026-01-05 05:49:13	0	1
56	19	3	5	2026-01-05 05:49:26	0	1
57	19	3	4	2026-01-05 05:49:26	0	1
\.


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
1	1	1	\N	1	10	\N	\N	\N	2026-01-05 05:42:04	2026-01-05 05:42:06	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2026-01-05 05:42:22	2026-01-05 05:42:24	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2026-01-05 05:42:54	2026-01-05 05:42:56	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2026-01-05 05:43:35	2026-01-05 05:43:37	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2026-01-05 05:43:57	2026-01-05 05:44:00	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2026-01-05 05:44:20	2026-01-05 05:44:22	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2026-01-05 05:44:42	2026-01-05 05:44:44	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2026-01-05 05:45:07	2026-01-05 05:45:09	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2026-01-05 05:45:29	2026-01-05 05:45:31	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2026-01-05 05:45:51	2026-01-05 05:45:54	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2026-01-05 05:46:14	2026-01-05 05:46:16	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2026-01-05 05:46:39	2026-01-05 05:46:41	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2026-01-05 05:47:02	2026-01-05 05:47:04	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2026-01-05 05:47:25	2026-01-05 05:47:27	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2026-01-05 05:47:48	2026-01-05 05:47:50	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2026-01-05 05:48:10	2026-01-05 05:48:13	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2026-01-05 05:48:34	2026-01-05 05:48:36	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2026-01-05 05:48:58	2026-01-05 05:49:00	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2026-01-05 05:49:21	2026-01-05 05:49:23	25	521	20
\.


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
12	nation
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
111	expected
112	respect
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
125	meet
126	goal
127	paper
128	summarizes
129	results
130	telephone
131	administered
132	public
133	response
134	rate
135	examined
136	require
137	newly
138	hired
139	employed
140	integrating
141	diaga
142	diouf
143	alexandria
144	genetic
145	transformation
146	forest
147	trees
148	review
149	recent
150	progress
151	discussed
152	applications
153	engineering
154	improving
155	understanding
156	mechanisms
157	governing
158	genes
159	expression
160	woody
161	plants
162	dana
163	phillips
164	toronto
165	investigating
166	shared
167	background
168	argument
169	critique
170	fogelin
171	thesis
172	deep
173	disagreement
174	robert
175	claims
176	interlocutors
177	share
178	framework
179	beliefs
180	commitments
181	order
182	fruitfully
183	pursue
184	refute
185	claim
186	productive
187	find
188	consists
189	common
190	topic
191	hand
192	pro
193	cedural
194	competencies
195	supporters
196	mistakenly
197	view
198	part
199	procedural
200	mitments
201	difficult
202	uphold
203	people
204	diverge
205	widely
206	domatilia
207	sokoloff
208	college
209	cork
210	developing
211	efficacy
212	equip
213	children
214	knowledge
215	belief
216	confident
217	informed
218	citizens
219	continue
220	learners
221	graduation
222	key
223	role
224	nurturing
225	learn
226	participate
227	society
228	conducted
229	social
230	studies
231	presented
232	showing
233	strategy
234	instruction
235	enhance
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
248	decision
249	making
250	leads
251	action
252	enhancing
253	motivation
254	citizenship
255	elinor
256	ostrom
257	indiana
258	frank
259	van
260	laerhoven
261	traditions
262	trends
263	commons
264	expe
265	rienced
266	substantial
267	growth
268	past
269	decades
270	distinguished
271	scholars
272	disciplines
273	long
274	studied
275	specific
276	resources
277	managed
278	mismanaged
279	times
280	places
281	coward
282	los
283	reyes
284	mackenzie
285	wittfogel
286	researchers
287	mid
288	1980s
289	contemporary
290	colleagues
291	work
292	sec
293	tors
294	region
295	interest
296	regions
297	world
298	pool
299	resource
300	property
301	intellectual
302	developments
303	fabio
304	paglieri
305	rome
306	hansen
307	pinto
308	reason
309	reclaimed
310	john
311	mwandenga
312	cape
313	town
314	signalling
315	theory
316	dividends
317	literature
318	empirical
319	evidence
320	signaling
321	suggests
322	signal
323	future
324	prospects
325	firm
326	offer
327	conclusive
328	conflicting
329	financial
330	economists
331	practical
332	dividend
333	guidance
334	management
335	potential
336	investors
337	shareholding
338	corporate
339	investment
340	financing
341	distribution
342	decisions
343	continuous
344	function
345	rely
346	intuitive
347	evaluation
348	novak
349	aalborg
350	condensing
351	water
352	availability
353	models
354	focus
355	systems
356	texas
357	modeling
358	system
359	routinely
360	applied
361	administration
362	rights
363	permit
364	regional
365	statewide
366	planning
367	expanding
368	variety
369	endeavors
370	river
371	basins
372	state
373	reflects
374	permits
375	reservoirs
376	datasets
377	necessarily
378	large
379	complex
380	provide
381	capabilities
382	developed
383	features
384	added
385	types
386	growing
387	enhanced
388	simplifying
389	simulation
390	input
391	methodology
392	condensed
393	dataset
394	selected
395	reservoir
396	impacts
397	accompanying
398	removed
399	original
400	complete
401	set
402	streamflows
403	represents
404	flows
405	basin
406	contained
407	model
408	included
409	develop
410	brazos
411	authority
412	based
413	modifying
414	karim
415	khafaji
416	stanford
417	margaret
418	morse
419	sustainable
420	design
421	service
422	environmental
423	sustainability
424	principles
425	vital
426	topics
427	largely
428	failed
429	address
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
448	project
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
470	term
471	fat
472	supplementation
473	fatty
474	acid
475	profile
476	heavy
477	pig
478	adipose
479	tissue
480	fifty
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
495	supplement
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
507	close
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
522	ecosenoic
523	c20
524	linoleic
525	levels
526	iodine
527	result
528	ing
529	accepted
530	parma
531	consortium
532	dry
533	cured
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
546	healthy
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
570	south
571	central
572	source
573	plan
574	protect
575	endangered
576	species
577	immediately
578	downstream
579	questions
580	raised
581	established
582	concept
583	divide
584	antonio
585	segments
586	collection
587	program
588	hydrogeologic
589	groundwater
590	exists
591	vicinity
592	surface
593	drainage
594	onion
595	creek
596	blanco
597	wet
598	normal
599	dissipated
600	longer
601	hydrologically
602	separated
603	flow
604	droughts
605	bearings
606	assessments
607	simulations
608	numerical
609	cfs
610	flowing
611	appears
612	influenced
613	recharge
614	vulnerable
615	extended
616	periods
617	extensive
618	pumping
619	kyle
620	buda
621	shows
622	low
623	gradient
624	potentiometric
625	variation
626	slopes
627	north
628	dramatic
629	discontinuity
630	change
631	gradients
632	dynamic
633	unknown
634	structural
635	influences
636	hydraulic
637	properties
638	inherent
639	connection
640	rapid
641	population
642	increased
643	demands
644	areas
645	necessitates
646	continual
647	monitoring
648	trend
649	analyses
650	patricia
651	daniel
652	wolverhampton
653	designing
654	intercultural
655	case
656	atlantic
657	coast
658	nicaragua
659	met
660	21st
661	century
662	genuinely
663	embracing
664	diversity
665	overcome
666	barriers
667	basis
668	language
669	gender
670	takes
671	multilingual
672	multiethnic
673	examines
674	community
675	uraccan
676	contributing
677	interculturality
678	describes
679	participatory
680	carried
681	staff
682	intention
683	defining
684	delivering
685	discussions
686	wales
687	council
688	emphasises
689	belonging
690	individual
691	communities
692	cultures
693	time
694	supporting
695	include
696	involvement
697	ethnic
698	ethno
699	linguistic
700	power
701	relations
702	country
703	militate
704	egalitarianism
705	highlights
706	importance
707	pedagogy
708	promoting
709	achieving
710	lasting
711	rana
712	baiyewu
713	nairobi
714	yam
715	diseases
716	nigeria
717	presents
718	combating
719	menace
720	field
721	storage
722	anthracnose
723	regarded
724	spread
725	mosaic
726	virus
727	disease
728	considered
729	severe
730	losses
731	yams
732	rot
733	devastating
734	marked
735	reduction
736	quantity
737	marketable
738	edible
739	portions
740	tubers
741	reductions
742	stored
743	adopted
744	advocated
745	includes
746	crop
747	rotation
748	fallowing
749	planting
750	material
751	destruction
752	infected
753	cultivars
754	resistant
755	tecto
756	thiabendazole
757	locally
758	made
759	gins
760	wood
761	ash
762	found
763	fungal
764	infection
765	finally
766	processing
767	chips
768	cubes
769	shelf
770	live
771	months
772	year
773	rosanna
774	rossi
775	barcelona
776	nutrition
777	general
778	situation
779	cattle
780	slaughtered
781	cameroon
782	representative
783	african
784	safety
785	beef
786	abattoir
787	yaoundé
788	largest
789	january
790	march
791	pre
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
830	skin
831	lesions
832	enlarged
833	lymph
834	nodes
835	respiratory
836	distress
837	nodular
838	organs
839	condemned
840	liver
841	flukes
842	completely
843	due
844	tuberculosis
845	lungs
846	aid
847	authorities
848	draw
849	programmes
850	strengthen
851	improve
852	control
853	prevent
854	observed
855	promote
856	trade
857	vajiheh
858	karbasizaed
859	tehran
860	antimicrobial
861	metal
862	resistance
863	plasmid
864	coliforms
865	isolated
866	nosocomial
867	infections
868	hospital
869	isfahan
870	iran
871	patterns
872	profiles
873	enterobacteriacea
874	human
875	faeces
876	fifteen
877	isolates
878	identified
879	escherichia
880	coli
881	remaining
882	kelebsiella
883	pneumoniae
884	seventy
885	percent
886	strains
887	possess
888	multiple
889	antibiotics
890	difference
891	minimal
892	inhibitory
893	concentration
894	mic
895	values
896	clinical
897	cases
898	metals
899	significant
900	tolerant
901	persons
902	relationship
903	group
904	pattern
905	conjugative
906	encoding
907	recovered
908	multidrug
909	valerie
910	williamson
911	multi
912	institutions
913	networked
914	environments
915	compare
916	actors
917	decide
918	sanction
919	sanctions
920	implemented
921	collectively
922	agree
923	actor
924	sanctioned
925	collective
926	sanctioning
927	problematic
928	difficulty
929	reaching
930	consensus
931	perverse
932	punishing
933	contributors
934	ruled
935	goverance
936	zita
937	woods
938	cuny
939	finocchiaro
940	arguments
\.


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
41	206	0
41	207	1
41	3	2
41	208	3
41	209	4
42	210	0
42	211	1
42	179	2
42	85	3
43	86	0
43	126	1
43	88	2
43	212	3
43	213	4
43	214	5
43	92	6
43	215	7
43	216	8
43	217	9
43	218	10
43	218	11
43	219	12
43	220	13
43	221	14
43	127	15
43	222	16
43	223	17
43	224	18
43	211	19
43	179	20
43	181	21
43	225	22
43	226	23
43	116	24
43	227	25
43	63	26
43	58	27
43	228	28
43	229	29
43	230	30
43	66	31
43	231	32
43	232	33
43	233	34
43	234	35
43	235	36
43	211	37
43	113	38
43	198	39
43	63	40
43	236	41
43	237	42
43	238	43
43	239	44
43	240	45
43	213	46
43	241	47
43	242	48
43	47	49
43	113	50
43	243	51
43	239	52
43	244	53
43	245	54
43	211	55
43	113	56
43	246	57
43	178	58
43	247	59
43	213	60
43	248	61
43	249	62
43	250	63
43	229	64
43	251	65
43	80	66
43	252	67
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
19	84	37
19	71	38
19	113	39
19	79	40
19	114	41
19	115	42
19	102	43
19	116	44
19	117	45
19	118	46
19	119	47
19	120	48
19	121	49
19	122	50
19	123	51
19	124	52
19	79	53
19	75	54
19	92	55
19	125	56
19	126	57
19	127	58
19	128	59
19	129	60
19	130	61
19	20	62
19	131	63
19	132	64
19	116	65
19	117	66
19	98	67
19	71	68
19	133	69
19	134	70
19	135	71
19	75	72
19	92	73
19	116	74
19	117	75
19	136	76
19	137	77
19	138	78
19	79	79
19	47	80
19	121	81
19	139	82
19	139	83
19	79	84
21	140	0
21	84	1
21	75	2
21	92	3
21	20	4
21	71	5
21	27	6
21	90	7
21	119	8
21	120	9
21	21	10
25	141	0
25	142	1
25	143	2
25	3	3
26	144	0
26	145	1
26	146	2
26	147	3
27	148	0
27	149	1
27	150	2
27	144	3
27	145	4
27	146	5
27	147	6
27	151	7
27	152	8
27	144	9
27	153	10
27	154	11
27	146	12
27	147	13
27	155	14
27	156	15
27	157	16
27	158	17
27	159	18
27	160	19
27	161	20
33	162	0
33	163	1
33	3	2
33	164	3
34	165	0
34	166	1
34	167	2
34	114	3
34	168	4
34	169	5
34	170	6
34	171	7
34	172	8
34	173	9
35	174	0
35	170	1
35	175	2
35	176	3
35	177	4
35	178	5
35	167	6
35	179	7
35	180	8
35	181	9
35	182	10
35	183	11
35	168	12
35	184	13
35	170	14
35	185	15
35	165	16
35	166	17
35	167	18
35	114	19
35	186	20
35	168	21
35	187	22
35	167	23
35	188	24
35	189	25
35	179	26
35	190	27
35	191	28
35	166	29
35	192	30
35	193	31
35	180	32
35	194	33
35	64	34
35	170	35
35	195	36
35	196	37
35	197	38
35	166	39
35	179	40
35	198	41
35	114	42
35	167	43
35	186	44
35	168	45
35	199	46
35	200	47
35	201	48
35	202	49
35	203	50
35	179	51
35	204	52
35	205	53
35	190	54
35	191	55
43	211	68
43	253	69
43	225	70
43	85	71
43	151	72
45	88	0
45	254	1
49	255	0
49	256	1
49	257	2
49	3	3
49	258	4
49	259	5
49	260	6
49	257	7
49	3	8
50	261	0
50	262	1
50	14	2
50	263	3
51	14	0
51	263	1
51	264	2
51	265	3
51	266	4
51	267	5
51	120	6
51	268	7
51	269	8
51	270	9
51	271	10
51	272	11
51	273	12
51	274	13
51	275	14
51	276	15
51	277	16
51	278	17
51	279	18
51	280	19
51	281	20
51	282	21
51	283	22
51	284	23
51	285	24
51	286	25
51	274	26
51	275	27
51	263	28
51	287	29
51	288	30
51	289	31
51	290	32
51	217	33
51	291	34
51	271	35
51	272	36
51	292	37
51	293	38
51	294	39
51	295	40
51	296	41
51	297	42
53	189	0
53	298	1
53	299	2
53	189	3
53	300	4
53	301	5
53	302	6
57	303	0
57	304	1
57	3	2
57	305	3
58	306	0
58	307	1
58	308	2
58	309	3
65	310	0
65	311	1
65	3	2
65	312	3
65	313	4
66	314	0
66	315	1
66	316	2
66	148	3
66	317	4
66	318	5
66	319	6
67	320	0
67	315	1
67	321	2
67	316	3
67	322	4
67	323	5
67	324	6
67	325	7
67	149	8
67	318	9
67	319	10
67	326	11
67	327	12
67	319	13
67	87	14
67	328	15
67	81	16
67	80	17
67	329	18
67	330	19
67	331	20
67	332	21
67	81	22
67	333	23
67	334	24
67	78	25
67	335	26
67	336	27
67	337	28
67	338	29
67	339	30
67	340	31
67	341	32
67	342	33
67	343	34
67	344	35
67	334	36
67	332	37
67	342	38
67	345	39
67	346	40
67	347	41
73	310	0
73	348	1
73	349	2
73	3	3
74	350	0
74	351	1
74	352	2
74	353	3
74	354	4
74	275	5
74	351	6
74	334	7
74	355	8
75	356	0
75	351	1
75	352	2
75	357	3
75	358	4
75	359	5
75	360	6
75	361	7
75	351	8
75	362	9
75	363	10
75	358	11
75	364	12
75	365	13
75	366	14
75	367	15
75	368	16
75	369	17
75	357	18
75	351	19
75	334	20
75	370	21
75	371	22
75	372	23
75	373	24
75	351	25
75	374	26
75	375	27
75	376	28
75	377	29
75	378	30
75	379	31
75	380	32
75	248	33
75	47	34
75	381	35
75	357	36
75	358	37
75	382	38
75	357	39
75	383	40
75	384	41
75	385	42
75	152	43
75	386	44
75	152	45
75	387	46
75	388	47
75	389	48
75	390	49
75	376	50
75	354	51
75	351	52
75	334	53
75	355	54
75	391	55
75	231	56
75	210	57
75	392	58
75	393	59
75	394	60
75	395	61
75	358	62
75	373	63
75	396	64
75	351	65
75	362	66
75	397	67
75	375	68
75	398	69
75	399	70
75	400	71
75	393	72
75	401	73
75	402	74
75	382	75
75	403	76
75	404	77
75	394	78
75	358	79
75	245	80
75	351	81
75	362	82
75	370	83
75	405	84
75	406	85
75	399	86
75	400	87
75	407	88
75	390	89
75	393	90
75	408	91
75	392	92
75	393	93
75	391	94
75	360	95
75	409	96
75	392	97
75	407	98
75	410	99
75	370	100
75	411	101
75	395	102
75	358	103
75	412	104
75	413	105
75	356	106
75	351	107
75	352	108
75	357	109
75	358	110
75	393	111
75	410	112
75	370	113
75	405	114
77	351	0
81	414	0
81	415	1
81	416	2
81	3	3
81	417	4
81	418	5
81	416	6
81	3	7
82	113	0
82	419	1
82	420	2
82	421	3
83	422	0
83	423	1
83	419	2
83	120	3
83	424	4
83	425	5
83	426	6
83	153	7
83	88	8
83	427	9
83	428	10
83	429	11
83	421	12
83	113	13
83	430	14
83	229	15
83	421	16
83	431	17
83	432	18
83	433	19
83	434	20
83	435	21
83	436	22
83	419	23
83	420	24
83	323	25
83	437	26
83	438	27
83	407	28
83	421	29
83	113	30
83	436	31
83	419	32
83	420	33
83	412	34
83	439	35
83	416	36
83	440	37
83	437	38
83	419	39
83	297	40
83	407	41
83	441	42
83	442	43
83	443	44
83	444	45
83	445	46
83	446	47
83	447	48
83	448	49
83	412	50
83	420	51
83	449	52
83	450	53
83	444	54
83	445	55
83	407	56
83	451	57
83	452	58
83	453	59
83	454	60
83	151	61
83	323	62
83	455	63
83	367	64
83	407	65
85	120	0
85	153	1
85	88	2
85	421	3
85	113	4
85	423	5
89	456	0
89	457	1
89	458	2
89	27	3
89	3	4
90	459	0
90	460	1
90	461	2
90	267	3
90	462	4
90	463	5
90	464	6
90	465	7
90	466	8
91	467	0
91	14	1
91	468	2
91	469	3
91	273	4
91	470	5
91	471	6
91	472	7
91	473	8
91	474	9
91	475	10
91	476	11
91	477	12
91	478	13
91	479	14
91	480	15
91	378	16
91	481	17
91	482	18
91	483	19
91	484	20
91	485	21
91	486	22
91	487	23
91	488	24
91	489	25
91	490	26
91	491	27
91	492	28
91	493	29
91	492	30
91	494	31
91	495	32
91	496	33
91	497	34
91	498	35
91	499	36
91	500	37
91	501	38
91	502	39
91	503	40
91	504	41
91	505	42
91	473	43
91	474	44
91	506	45
91	499	46
91	507	47
91	508	48
91	473	49
91	474	50
91	506	51
91	489	52
91	494	53
91	499	54
91	509	55
91	496	56
91	510	57
91	511	58
91	473	59
91	474	60
91	512	61
91	513	62
91	496	63
91	510	64
91	512	65
91	514	66
91	473	67
91	474	68
91	515	69
91	516	70
91	517	71
91	473	72
91	474	73
91	518	74
91	512	75
91	496	76
91	510	77
91	512	78
91	519	79
91	474	80
91	520	81
91	521	82
91	522	83
91	474	84
91	523	85
91	504	86
91	68	87
91	524	88
91	474	89
91	525	90
91	526	91
91	499	92
91	527	93
91	528	94
91	525	95
91	62	96
91	520	97
91	529	98
91	530	99
91	531	100
91	532	101
91	533	102
91	534	103
91	535	104
91	536	105
91	537	106
91	538	107
91	499	108
91	479	109
91	539	110
91	540	111
91	541	112
91	129	113
91	542	114
91	273	115
91	470	116
91	543	117
91	472	118
91	494	119
91	473	120
91	474	121
91	475	122
91	476	123
91	477	124
91	478	125
91	479	126
91	472	127
91	493	128
91	492	129
91	544	130
91	545	131
91	546	132
91	473	133
91	547	134
91	477	135
91	471	136
91	154	137
91	548	138
91	549	139
91	245	140
91	550	141
91	549	142
91	471	143
91	551	144
91	552	145
93	509	0
93	553	1
93	554	2
97	555	0
97	556	1
97	3	2
97	312	3
97	313	4
98	557	0
98	558	1
98	559	2
98	560	3
98	561	4
98	562	5
98	563	6
98	564	7
98	563	8
98	565	9
98	566	10
99	559	0
99	560	1
99	567	2
99	568	3
99	351	4
99	569	5
99	570	6
99	571	7
99	356	8
99	572	9
99	86	10
99	563	11
99	210	12
99	573	13
99	574	14
99	575	15
99	576	16
99	577	17
99	578	18
99	561	19
99	562	20
99	563	21
99	579	22
99	580	23
99	581	24
99	582	25
99	557	26
99	583	27
99	561	28
99	584	29
99	564	30
99	563	31
99	585	32
99	559	33
99	560	34
99	565	35
99	566	36
99	429	37
99	579	38
99	351	39
99	96	40
99	18	41
99	586	42
99	587	43
99	588	44
99	14	45
99	228	46
99	40	47
99	589	48
99	96	49
99	18	50
99	589	51
99	583	52
99	590	53
99	591	54
99	592	55
99	593	56
99	583	57
99	594	58
99	595	59
99	596	60
99	370	61
99	597	62
99	598	63
99	557	64
99	566	65
99	40	66
99	18	67
99	501	68
99	565	69
99	321	70
99	589	71
99	583	72
99	599	73
99	600	74
99	601	75
99	602	76
99	585	77
99	527	78
99	335	79
99	589	80
99	603	81
99	268	82
99	561	83
99	562	84
99	563	85
99	564	86
99	563	87
99	86	88
99	604	89
99	80	90
99	605	91
99	334	92
99	352	93
99	589	94
99	559	95
99	560	96
99	606	97
99	607	98
99	608	99
99	407	100
99	64	101
99	609	102
99	610	103
99	268	104
99	561	105
99	562	106
99	564	107
99	563	108
99	565	109
99	566	110
99	589	111
99	583	112
99	611	113
99	612	114
99	613	115
99	594	116
99	595	117
99	596	118
99	370	119
99	611	120
99	614	121
99	615	122
99	616	123
99	613	124
99	617	125
99	618	126
99	591	127
99	619	128
99	620	129
99	18	130
99	401	131
99	621	132
99	622	133
99	623	134
99	624	135
99	592	136
99	561	137
99	562	138
99	563	139
99	619	140
99	625	141
99	525	142
99	565	143
99	565	144
99	616	145
99	619	146
99	564	147
99	563	148
99	624	149
99	592	150
99	626	151
99	540	152
99	627	153
99	628	154
99	525	155
99	565	156
99	565	157
99	616	158
99	572	159
99	30	160
99	629	161
99	630	162
99	624	163
99	631	164
99	632	165
99	351	166
99	96	167
99	133	168
99	619	169
99	633	170
99	634	171
99	635	172
99	636	173
99	637	174
99	638	175
99	560	176
99	629	177
99	469	178
99	26	179
99	557	180
99	639	181
99	561	182
99	562	183
99	564	184
99	563	185
99	640	186
99	641	187
99	267	188
99	642	189
99	351	190
99	643	191
99	619	192
99	620	193
99	644	194
99	645	195
99	646	196
99	589	197
99	96	198
99	647	199
99	587	200
99	561	201
99	562	202
99	563	203
99	620	204
99	380	205
99	18	206
99	323	207
99	588	208
99	648	209
99	649	210
101	351	0
105	650	0
105	651	1
105	3	2
105	652	3
106	653	0
106	654	1
106	102	2
106	655	3
106	14	4
106	656	5
106	657	6
106	658	7
107	453	0
107	659	1
107	660	2
107	661	3
107	662	4
107	663	5
107	664	6
107	88	7
107	665	8
107	666	9
107	219	10
107	454	11
107	203	12
107	667	13
107	668	14
107	28	15
107	669	16
107	655	17
107	14	18
107	670	19
107	656	20
107	657	21
107	658	22
107	671	23
107	672	24
107	294	25
107	673	26
107	674	27
107	3	28
107	675	29
107	676	30
107	120	31
107	677	32
107	678	33
107	679	34
107	63	35
107	680	36
107	3	37
107	681	38
107	93	39
107	682	40
107	683	41
107	654	42
107	102	43
107	121	44
107	684	45
107	407	46
107	667	47
107	685	48
107	407	49
107	674	50
107	155	51
107	686	52
107	102	53
107	687	54
107	688	55
107	689	56
107	690	57
107	691	58
107	692	59
107	693	60
107	42	61
107	694	62
107	120	63
107	654	64
107	102	65
107	695	66
107	3	67
107	507	68
107	696	69
107	697	70
107	691	71
107	567	72
107	698	73
107	699	74
107	700	75
107	701	76
107	294	77
107	702	78
107	703	79
107	704	80
107	3	81
107	63	82
107	705	83
107	706	84
107	679	85
107	707	86
107	667	87
107	708	88
107	677	89
107	709	90
107	710	91
107	229	92
107	145	93
109	660	0
109	661	1
109	664	2
109	671	3
109	672	4
109	679	5
109	707	6
109	668	7
109	28	8
109	669	9
109	704	10
109	229	11
109	145	12
113	711	0
113	712	1
113	3	2
113	713	3
114	714	0
114	715	1
114	334	2
114	716	3
115	148	0
115	717	1
115	715	2
115	714	3
115	334	4
115	121	5
115	139	6
115	718	7
115	719	8
115	716	9
115	720	10
115	721	11
115	715	12
115	231	13
115	722	14
115	723	15
115	205	16
115	724	17
115	720	18
115	715	19
115	714	20
115	725	21
115	726	22
115	727	23
115	728	24
115	729	25
115	730	26
115	731	27
115	532	28
115	732	29
115	728	30
115	733	31
115	721	32
115	715	33
115	714	34
115	532	35
115	732	36
115	731	37
115	734	38
115	735	39
115	736	40
115	737	41
115	738	42
115	739	43
115	740	44
115	741	45
115	729	46
115	742	47
115	731	48
115	334	49
115	121	50
115	743	51
115	744	52
115	718	53
115	720	54
115	715	55
115	745	56
115	746	57
115	747	58
115	748	59
115	749	60
115	546	61
115	750	62
115	751	63
115	752	64
115	746	65
115	753	66
115	754	67
115	753	68
115	721	69
115	715	70
115	755	71
115	756	72
115	757	73
115	758	74
115	532	75
115	759	76
115	760	77
115	761	78
115	721	79
115	762	80
115	574	81
115	714	82
115	740	83
115	763	84
115	764	85
115	721	86
115	765	87
115	766	88
115	714	89
115	740	90
115	767	91
115	768	92
115	544	93
115	769	94
115	770	95
115	465	96
115	771	97
115	772	98
121	773	0
121	774	1
121	775	2
121	3	3
122	469	0
122	273	1
122	470	2
122	776	3
122	543	4
122	494	5
122	473	6
122	474	7
122	506	8
122	476	9
122	509	10
122	499	11
123	467	0
123	63	1
123	380	2
123	777	3
123	778	4
123	779	5
123	780	6
123	781	7
123	782	8
123	571	9
123	783	10
123	294	11
123	549	12
123	784	13
123	785	14
123	786	15
123	787	16
123	788	17
123	781	18
123	728	19
123	789	20
123	790	21
123	791	22
123	498	23
123	566	24
123	792	25
123	779	26
123	793	27
123	794	28
123	795	29
123	796	30
123	498	31
123	793	32
123	394	33
123	797	34
123	798	35
123	780	36
123	549	37
123	799	38
123	506	39
123	795	40
123	796	41
123	680	42
123	800	43
123	779	44
123	801	45
123	802	46
123	803	47
123	804	48
123	189	49
123	805	50
123	358	51
123	806	52
123	481	53
123	807	54
123	808	55
123	809	56
123	810	57
123	811	58
123	812	59
123	813	60
123	814	61
123	815	62
123	358	63
123	779	64
123	816	65
123	817	66
123	818	67
123	772	68
123	819	69
123	549	70
123	471	71
123	512	72
123	622	73
123	820	74
123	810	75
123	806	76
123	821	77
123	822	78
123	819	79
123	823	80
123	780	81
123	824	82
123	189	83
123	825	84
123	566	85
123	826	86
123	827	87
123	828	88
123	829	89
123	763	90
123	830	91
123	831	92
123	832	93
123	833	94
123	834	95
123	835	96
123	836	97
123	837	98
123	831	99
123	793	100
123	838	101
123	839	102
123	840	103
123	841	104
123	842	105
123	839	106
123	843	107
123	844	108
123	814	109
123	845	110
123	18	111
123	846	112
123	847	113
123	848	114
123	849	115
123	467	116
123	850	117
123	779	118
123	805	119
123	851	120
123	785	121
123	569	122
123	852	123
123	853	124
123	854	125
123	715	126
123	855	127
123	364	128
123	856	129
125	779	0
125	553	1
125	554	2
129	857	0
129	858	1
129	3	2
129	859	3
130	860	0
130	476	1
130	861	2
130	862	3
130	863	4
130	475	5
130	864	6
130	865	7
130	866	8
130	867	9
130	868	10
130	869	11
130	870	12
131	860	0
131	476	1
131	861	2
131	862	3
131	871	4
131	863	5
131	872	6
131	864	7
131	873	8
131	865	9
131	866	10
131	867	11
131	546	12
131	874	13
131	875	14
131	38	15
131	876	16
131	877	17
131	866	18
131	867	19
131	878	20
131	879	21
131	880	22
131	881	23
131	882	24
131	883	25
131	884	26
131	885	27
131	886	28
131	865	29
131	866	30
131	867	31
131	887	32
131	888	33
131	862	34
131	889	35
131	38	36
131	886	37
131	546	38
131	874	39
131	875	40
131	890	41
131	891	42
131	892	43
131	893	44
131	894	45
131	895	46
131	886	47
131	896	48
131	897	49
131	875	50
131	476	51
131	898	52
131	899	53
131	886	54
131	865	55
131	868	56
131	900	57
131	476	58
131	861	59
131	546	60
131	901	61
131	56	62
131	902	63
131	863	64
131	475	65
131	903	66
131	860	67
131	862	68
131	904	69
131	905	70
131	863	71
131	906	72
131	862	73
131	476	74
131	898	75
131	889	76
131	907	77
131	886	78
131	865	79
131	866	80
131	867	81
131	129	82
131	908	83
131	862	84
131	864	85
131	335	86
131	866	87
131	764	88
131	294	89
137	909	0
137	910	1
137	3	2
137	4	3
138	24	0
138	911	1
138	96	2
138	912	3
138	913	4
138	914	5
139	915	0
139	432	1
139	916	2
139	37	3
139	917	4
139	918	5
139	432	6
139	919	7
139	920	8
139	916	9
139	921	10
139	922	11
139	923	12
139	924	13
139	925	14
139	926	15
139	342	16
139	927	17
139	843	18
139	928	19
139	929	20
139	930	21
139	248	22
139	758	23
139	921	24
139	931	25
139	926	26
139	932	27
139	802	28
139	933	29
139	690	30
139	916	31
139	934	32
139	925	33
139	926	34
139	342	35
139	295	36
139	903	37
141	24	0
141	911	1
141	96	2
141	912	3
141	935	4
145	936	0
145	937	1
145	938	2
146	939	0
146	940	1
146	940	2
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
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
13	1	14	2026-01-05 05:47:11	2026-01-05 05:47:07	2026-01-05 05:47:07	5	en_US	3	0	0
5	1	6	2026-01-05 05:44:06	2026-01-05 05:44:02	2026-01-05 05:44:02	5	en_US	3	0	0
1	1	1	2026-01-05 05:42:09	2026-01-05 05:42:08	2026-01-05 05:42:08	5	en_US	1	0	0
10	1	11	2026-01-05 05:46:00	2026-01-05 05:45:56	2026-01-05 05:45:56	5	en_US	3	0	0
18	1	19	2026-01-05 05:49:07	2026-01-05 05:49:03	2026-01-05 05:49:03	5	en_US	3	0	0
14	1	15	2026-01-05 05:47:34	2026-01-05 05:47:30	2026-01-05 05:47:30	5	en_US	3	0	0
6	1	7	2026-01-05 05:44:29	2026-01-05 05:44:25	2026-01-05 05:44:25	5	en_US	3	0	0
2	1	2	2026-01-05 05:42:40	2026-01-05 05:42:27	2026-01-05 05:42:27	5	en_US	3	0	0
11	1	12	2026-01-05 05:46:25	2026-01-05 05:46:21	2026-01-05 05:46:21	5	en_US	3	0	0
15	1	16	2026-01-05 05:47:57	2026-01-05 05:47:52	2026-01-05 05:47:52	5	en_US	3	0	0
7	1	8	2026-01-05 05:44:53	2026-01-05 05:44:49	2026-01-05 05:44:49	5	en_US	3	0	0
19	1	20	2026-01-05 05:49:30	2026-01-05 05:49:26	2026-01-05 05:49:26	5	en_US	3	0	0
3	1	4	2026-01-05 05:43:22	2026-01-05 05:43:01	2026-01-05 05:43:01	5	en_US	3	0	0
12	1	13	2026-01-05 05:46:48	2026-01-05 05:46:44	2026-01-05 05:46:44	5	en_US	3	0	0
8	1	9	2026-01-05 05:45:15	2026-01-05 05:45:11	2026-01-05 05:45:11	5	en_US	3	0	0
16	1	17	2026-01-05 05:48:20	2026-01-05 05:48:15	2026-01-05 05:48:15	5	en_US	3	0	0
4	1	5	2026-01-05 05:43:44	2026-01-05 05:43:40	2026-01-05 05:43:40	5	en_US	3	0	0
9	1	10	2026-01-05 05:45:38	2026-01-05 05:45:34	2026-01-05 05:45:34	5	en_US	3	0	0
17	1	18	2026-01-05 05:48:43	2026-01-05 05:48:39	2026-01-05 05:48:39	5	en_US	3	0	0
\.


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
\.


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
16	jnovak	$2y$10$cxtmGswITbqX1nLvsD6zKO9exGnwTy8ZfGNb8uBskGJobw97rf7Rm	jnovak@mailinator.com	\N	\N	\N	\N	DK		\N	\N	2026-01-05 05:45:41	\N	2026-01-05 05:45:41	0	\N	\N	0	\N	1
25	zwoods	$2y$10$cuZ4kNdtC/0xcoG8YjrCseI3.8OTVzpsLrKiCgXvQf8zLn.MT7Gr2	zwoods@mailinator.com	\N	\N	\N	\N	US		\N	\N	2026-01-05 05:49:11	\N	2026-01-05 05:49:11	0	\N	\N	0	\N	1
17	kalkhafaji	$2y$10$Zpu7b9E3Uxq0SrpaDmrNKuoUHTScFnV3yui7nK7MW294Ogt1tvm06	kalkhafaji@mailinator.com	\N	\N	\N	\N	US		\N	\N	2026-01-05 05:46:04	\N	2026-01-05 05:46:04	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$DYZnfyl0bDU3RgrTdfQA3O8eaLW1XTWFGF7gvXmXf99d6Mqo.SJ6q	dbarnes@mailinator.com				\N	AU		\N	\N	2026-01-05 05:41:02	\N	2026-01-05 05:49:27	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$moWz1mkBQLAqqHgQHy.rmejeUScYzv3QLmK85AhzGFECfA3POjekG	dbuskins@mailinator.com				\N	US		\N	\N	2026-01-05 05:41:07	\N	2026-01-05 05:41:07	0	\N	\N	0	\N	1
5	sberardo	$2y$10$cdIRU2ac9xcweF/prLAxW.roUTGIBiOjMkygz83TpIxHV7d5jnpmq	sberardo@mailinator.com				\N	CA		\N	\N	2026-01-05 05:41:13	\N	2026-01-05 05:41:13	0	\N	\N	0	\N	1
6	minoue	$2y$10$Mq5kzjDvDmLTRrz11k6ccuhfVGjH6UAMpweZPgSAdp6nsTaQWb.7K	minoue@mailinator.com				\N	JP		\N	\N	2026-01-05 05:41:18	\N	2026-01-05 05:41:18	0	\N	\N	0	\N	1
18	lchristopher	$2y$10$BaWeDO/.l1j9Gj8OBJyGiOFD4wJjtP5JQXrzqEAdPrycdRo/Ae8zW	lchristopher@mailinator.com	\N	\N	\N	\N	AU		\N	\N	2026-01-05 05:46:29	\N	2026-01-05 05:46:29	0	\N	\N	0	\N	1
2	rvaca	$2y$10$IFG.8wksUQuDdwDYEodr4u2thtWK40/hRbQZigKYcMETLF6dvQzWW	rvaca@mailinator.com				\N	MX		\N	\N	2026-01-05 05:40:56	\N	2026-01-05 05:41:23	0	\N	\N	0	\N	1
1	admin	$2y$10$w.MWYHQK8AJWaEc.4Xe0pe6mPbp22/26XX8Xj9kJU3Svg7bFiRv3G	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2026-01-05 05:40:16	\N	2026-01-05 05:41:31	0	\N	\N	0	\N	1
7	ccorino	$2y$10$O5AwEM/W1SS7UR5eL/ODM.7u.c1HTWWnj2zr1AKWRyQfLmo0I2.KO	ccorino@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2026-01-05 05:41:53	\N	2026-01-05 05:41:53	0	\N	\N	0	\N	1
8	ckwantes	$2y$10$eFhHhdeXbsb9ShPN.gCJDO2jlZ6HXTU1w/TYzMLL1eOqRRydgL4C.	ckwantes@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2026-01-05 05:42:12	\N	2026-01-05 05:42:12	0	\N	\N	0	\N	1
9	cmontgomerie	$2y$10$BpJdiqtkEvTZ2i8I8Fr7veArmY/Ne2GWiivgTI418POVcaO29/LRO	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2026-01-05 05:42:43	\N	2026-01-05 05:42:44	0	\N	\N	0	\N	1
19	lkumiega	$2y$10$HolK/5aEZzeQy/xW7w6xP.Xp.KfFwoMS.SR/Kre2wcK2XWtbJsUKm	lkumiega@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2026-01-05 05:46:52	\N	2026-01-05 05:46:52	0	\N	\N	0	\N	1
10	ddiouf	$2y$10$bnA/g5jbBglAnKXAMct0/O7ES.bep6ZfpZYDV9ZIcC9yRqyGzCvO6	ddiouf@mailinator.com	\N	\N	\N	\N	EG		\N	\N	2026-01-05 05:43:25	\N	2026-01-05 05:43:25	0	\N	\N	0	\N	1
11	dphillips	$2y$10$S2x86z4Rde9PMSLoD0X05OWVzV3l0rpLspWpBPv0/6.gglh.EfhO2	dphillips@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2026-01-05 05:43:47	\N	2026-01-05 05:43:47	0	\N	\N	0	\N	1
20	pdaniel	$2y$10$o6HvoBhPM.E8vcdXDVAw4OELrXhvNeAS2zJKwGPAEbacJ/9LCOXCS	pdaniel@mailinator.com	\N	\N	\N	\N	GB		\N	\N	2026-01-05 05:47:15	\N	2026-01-05 05:47:15	0	\N	\N	0	\N	1
12	dsokoloff	$2y$10$jinsBWfjaSAtuNgBXloIMuGGP1liZhQbLCBktCFJ8bs9RBtV93Jge	dsokoloff@mailinator.com	\N	\N	\N	\N	IE		\N	\N	2026-01-05 05:44:10	\N	2026-01-05 05:44:10	0	\N	\N	0	\N	1
13	eostrom	$2y$10$4B6u.ryHMDmepp5VQDPANOZ5PtMqOPsk23IRv4JPCjMCNWBXWX6ba	eostrom@mailinator.com	\N	\N	\N	\N	US		\N	\N	2026-01-05 05:44:32	\N	2026-01-05 05:44:32	0	\N	\N	0	\N	1
14	fpaglieri	$2y$10$yzsz68YHCqnM0wJeaTGEqO9.Dy8JBR1svJt3jItiaIXrLcBDqpTpm	fpaglieri@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2026-01-05 05:44:57	\N	2026-01-05 05:44:57	0	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$Q/jvgCYrleCxWgbzqnCaeOfNSIy/rF1noPspkdLv.7HalwJsURFH6	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE		\N	\N	2026-01-05 05:47:38	\N	2026-01-05 05:47:38	0	\N	\N	0	\N	1
15	jmwandenga	$2y$10$B4n9qiWJymQdluoj2GBnUeDW1VzJ26X0ginjnKfSE4idDIHfg1rDW	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2026-01-05 05:45:19	\N	2026-01-05 05:45:19	0	\N	\N	0	\N	1
22	rrossi	$2y$10$SFBt9.MNGQ/web5AzKEDd.D3qcRg7lzRJ8xd064OH9mW/uqUnatSC	rrossi@mailinator.com	\N	\N	\N	\N	ES		\N	\N	2026-01-05 05:48:00	\N	2026-01-05 05:48:00	0	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$byc/WcCjBKIj57Z4O.T2jOzBb7zc5hw7Fmbh1HBN.N6krKkTftth2	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR		\N	\N	2026-01-05 05:48:24	\N	2026-01-05 05:48:24	0	\N	\N	0	\N	1
24	vwilliamson	$2y$10$SHhZdJFljj7oCTgfcQt5O.ODjn1ubjIMQhW8O7cEpSknIWKlLdPiq	vwilliamson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2026-01-05 05:48:48	\N	2026-01-05 05:48:48	0	\N	\N	0	\N	1
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2026-01-05 05:40:16	1	plugins.metadata	dc11		0	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	1	0	2026-01-05 05:40:16	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	1	0	2026-01-05 05:40:16	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	2	0	0	2026-01-05 05:40:16	1	plugins.generic	acron	AcronPlugin	1	1
1	0	0	0	2026-01-05 05:40:16	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	1	3	15	2026-01-05 05:40:16	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.generic	crossrefDeposit	CrossrefDepositPlugin	1	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.generic	usageEvent		0	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	1	0	0	2026-01-05 05:40:16	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	2	0	0	2026-01-05 05:40:16	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
2	2	0	0	2026-01-05 05:40:16	1	plugins.importexport	crossref		0	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
1	0	0	0	2026-01-05 05:40:16	1	plugins.themes	default	DefaultThemePlugin	1	0
3	3	0	22	2026-01-05 05:40:16	1	core	ops		0	1
1	1	0	0	2026-01-05 05:40:16	1	plugins.reports	counterReport		0	0
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.access_keys_access_key_id_seq', 1, false);


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcement_types_type_id_seq', 1, false);


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcements_announcement_id_seq', 1, false);


--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.auth_sources_auth_id_seq', 1, false);


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 25, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.citations_citation_id_seq', 1, false);


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 141, true);


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 101, true);


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 1, false);


--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 1, false);


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 1, false);


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 41, true);


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 16, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_email_id_seq', 1, false);


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 164, true);


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 19, true);


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 2, true);


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 2, true);


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 12, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: journals_journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.journals_journal_id_seq', 1, true);


--
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.library_files_file_id_seq', 1, false);


--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metadata_descriptions_metadata_description_id_seq', 1, false);


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 22, true);


--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_items_navigation_menu_item_id_seq', 23, true);


--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menus_navigation_menu_id_seq', 3, true);


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 1, false);


--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_mail_list_notification_mail_list_id_seq', 1, false);


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 19, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 123, true);


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 20, true);


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 20, true);


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.queries_query_id_seq', 1, false);


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_assignments_review_id_seq', 1, false);


--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_form_elements_review_form_element_id_seq', 1, false);


--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_forms_review_form_id_seq', 1, false);


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_rounds_review_round_id_seq', 1, false);


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 1, true);


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 57, true);


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 1, false);


--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_file_revisions_revision_id_seq', 19, true);


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 19, true);


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 940, true);


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 152, true);


--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_tombstones_tombstone_id_seq', 1, false);


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submissions_submission_id_seq', 19, true);


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.temporary_files_file_id_seq', 1, false);


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 5, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Name: access_keys access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_settings announcement_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_pkey UNIQUE (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings announcement_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_pkey UNIQUE (type_id, locale, setting_name);


--
-- Name: announcement_types announcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (type_id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcement_id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (auth_id);


--
-- Name: author_settings author_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_pkey UNIQUE (author_id, locale, setting_name);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: controlled_vocab_entry_settings c_v_e_s_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_pkey UNIQUE (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: categories category_path; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_path UNIQUE (context_id, path);


--
-- Name: category_settings category_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_pkey UNIQUE (category_id, locale, setting_name);


--
-- Name: citation_settings citation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_pkey UNIQUE (citation_id, locale, setting_name);


--
-- Name: citations citations_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: citations citations_publication_seq; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication_seq UNIQUE (publication_id, seq);


--
-- Name: controlled_vocab_entries controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocabs controlled_vocab_symbolic; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocab_symbolic UNIQUE (symbolic, assoc_type, assoc_id);


--
-- Name: controlled_vocabs controlled_vocabs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocabs_pkey PRIMARY KEY (controlled_vocab_id);


--
-- Name: data_object_tombstone_oai_set_objects data_object_tombstone_oai_set_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_pkey PRIMARY KEY (object_id);


--
-- Name: data_object_tombstone_settings data_object_tombstone_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_pkey UNIQUE (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstones data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: edit_decisions edit_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_pkey PRIMARY KEY (edit_decision_id);


--
-- Name: email_log email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (log_id);


--
-- Name: email_log_users email_log_user_id; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_user_id UNIQUE (email_log_id, user_id);


--
-- Name: email_templates_settings email_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_settings_pkey UNIQUE (email_id, locale, setting_name);


--
-- Name: email_templates_default_data email_templates_default_data_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_pkey UNIQUE (email_key, locale);


--
-- Name: email_templates_default email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates email_templates_email_key; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_email_key UNIQUE (email_key, context_id);


--
-- Name: email_templates email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (email_id);


--
-- Name: event_log event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: event_log_settings event_log_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_pkey UNIQUE (log_id, setting_name);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- Name: filter_groups filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filter_groups filter_groups_symbolic; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_symbolic UNIQUE (symbolic);


--
-- Name: filter_settings filter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_pkey UNIQUE (filter_id, locale, setting_name);


--
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genre_settings genre_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_pkey UNIQUE (genre_id, locale, setting_name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: item_views item_views_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_pkey UNIQUE (assoc_type, assoc_id, user_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: journal_settings journal_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journal_settings
    ADD CONSTRAINT journal_settings_pkey UNIQUE (journal_id, locale, setting_name);


--
-- Name: journals journals_path; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_path UNIQUE (path);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (journal_id);


--
-- Name: library_file_settings library_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_pkey UNIQUE (file_id, locale, setting_name);


--
-- Name: library_files library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: metadata_descriptions metadata_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metadata_descriptions
    ADD CONSTRAINT metadata_descriptions_pkey PRIMARY KEY (metadata_description_id);


--
-- Name: metadata_description_settings metadata_descripton_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metadata_description_settings
    ADD CONSTRAINT metadata_descripton_settings_pkey UNIQUE (metadata_description_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignment_settings navigation_menu_item_assignment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_pkey UNIQUE (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_settings navigation_menu_item_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_pkey UNIQUE (navigation_menu_item_id, locale, setting_name);


--
-- Name: navigation_menu_items navigation_menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_pkey PRIMARY KEY (navigation_menu_item_id);


--
-- Name: navigation_menus navigation_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menus
    ADD CONSTRAINT navigation_menus_pkey PRIMARY KEY (navigation_menu_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list notification_mail_list_email_context; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_email_context UNIQUE (email, context);


--
-- Name: notification_mail_list notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_settings notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey UNIQUE (notification_id, locale, setting_name);


--
-- Name: notification_subscription_settings notification_subscription_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_pkey PRIMARY KEY (setting_id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: oai_resumption_tokens oai_resumption_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens
    ADD CONSTRAINT oai_resumption_tokens_pkey UNIQUE (token);


--
-- Name: plugin_settings plugin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_pkey UNIQUE (plugin_name, context_id, setting_name);


--
-- Name: publication_categories publication_categories_id; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_id UNIQUE (publication_id, category_id);


--
-- Name: publication_galley_settings publication_galley_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galley_settings
    ADD CONSTRAINT publication_galley_settings_pkey UNIQUE (galley_id, locale, setting_name);


--
-- Name: publication_galleys publication_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: publication_settings publication_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_pkey UNIQUE (publication_id, locale, setting_name);


--
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (publication_id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (query_id);


--
-- Name: query_participants query_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_pkey UNIQUE (query_id, user_id);


--
-- Name: review_assignments review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_files review_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_pkey UNIQUE (review_id, submission_file_id);


--
-- Name: review_form_element_settings review_form_element_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_pkey UNIQUE (review_form_element_id, locale, setting_name);


--
-- Name: review_form_elements review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_form_settings review_form_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_pkey UNIQUE (review_form_id, locale, setting_name);


--
-- Name: review_forms review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_round_files review_round_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_pkey UNIQUE (submission_id, review_round_id, submission_file_id);


--
-- Name: review_rounds review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: review_rounds review_rounds_submission_id_stage_id_round_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_submission_id_stage_id_round_pkey UNIQUE (submission_id, stage_id, round);


--
-- Name: scheduled_tasks scheduled_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.scheduled_tasks
    ADD CONSTRAINT scheduled_tasks_pkey UNIQUE (class_name);


--
-- Name: subeditor_submission_group section_editors_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_pkey UNIQUE (context_id, assoc_id, assoc_type, user_id);


--
-- Name: section_settings section_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.section_settings
    ADD CONSTRAINT section_settings_pkey UNIQUE (section_id, locale, setting_name);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey UNIQUE (session_id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey UNIQUE (setting_name, locale);


--
-- Name: stage_assignments stage_assignment; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignment UNIQUE (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: submission_comments submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_file_revisions submission_file_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_pkey PRIMARY KEY (revision_id);


--
-- Name: submission_file_settings submission_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_pkey UNIQUE (submission_file_id, locale, setting_name);


--
-- Name: submission_files submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (submission_file_id);


--
-- Name: submission_search_keyword_list submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_keyword_list submission_search_keyword_text; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_text UNIQUE (keyword_text);


--
-- Name: submission_search_object_keywords submission_search_object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_pkey UNIQUE (object_id, pos);


--
-- Name: submission_search_objects submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_settings submission_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_pkey UNIQUE (submission_id, locale, setting_name);


--
-- Name: submission_tombstones submission_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_tombstones
    ADD CONSTRAINT submission_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (submission_id);


--
-- Name: temporary_files temporary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_pkey PRIMARY KEY (file_id);


--
-- Name: user_interests u_e_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT u_e_pkey UNIQUE (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings user_group_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_pkey UNIQUE (user_group_id, locale, setting_name);


--
-- Name: user_group_stage user_group_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_pkey UNIQUE (context_id, user_group_id, stage_id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey UNIQUE (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey UNIQUE (user_group_id, user_id);


--
-- Name: users users_email; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
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
-- Name: publication_galleys publication_galleys_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_files review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_round_files review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_file_revisions submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- Name: submission_file_revisions submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_files submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- PostgreSQL database dump complete
--

\unrestrict m2ixufFXG41sRkx5d2EYFOaOKpQ4yQycRcmBS8ELuFmB2GzPfHBuifpI82lwfAM

