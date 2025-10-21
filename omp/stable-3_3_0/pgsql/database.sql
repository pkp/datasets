--
-- PostgreSQL database dump
--

\restrict smiOJF8inkqvwb3SCKCsBz5cYMSK95GsWalzO8mUddIUY1bzhpYnvkniL8B0noq

-- Dumped from database version 16.10 (Ubuntu 16.10-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-1.pgdg24.04+1)

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
DROP INDEX public.submission_chapter_settings_chapter_id;
DROP INDEX public.subeditor_submission_group_user_id;
DROP INDEX public.subeditor_submission_group_assoc_id;
DROP INDEX public.static_page_settings_static_page_id;
DROP INDEX public.stage_assignments_user_id;
DROP INDEX public.stage_assignments_user_group_id;
DROP INDEX public.stage_assignments_submission_id;
DROP INDEX public.spotlights_assoc;
DROP INDEX public.spotlight_settings_id;
DROP INDEX public.sessions_user_id;
DROP INDEX public.series_press_id;
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
DROP INDEX public.publications_submission_id;
DROP INDEX public.publications_section_id;
DROP INDEX public.publication_settings_publication_id;
DROP INDEX public.publication_settings_name_value;
DROP INDEX public.publication_format_submission_id;
DROP INDEX public.publication_format_id_key;
DROP INDEX public.press_settings_press_id;
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
DROP INDEX public.identification_codes_key;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.format_sales_rights_pkey;
DROP INDEX public.format_representatives_pkey;
DROP INDEX public.format_publication_dates_pkey;
DROP INDEX public.format_markets_pkey;
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
DROP INDEX public.chapters_publication_id;
DROP INDEX public.chapters_chapter_id;
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
ALTER TABLE ONLY public.submission_settings DROP CONSTRAINT submission_settings_pkey;
ALTER TABLE ONLY public.submission_search_objects DROP CONSTRAINT submission_search_objects_pkey;
ALTER TABLE ONLY public.submission_search_object_keywords DROP CONSTRAINT submission_search_object_keywords_pkey;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_text;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_list_pkey;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_pkey;
ALTER TABLE ONLY public.submission_file_settings DROP CONSTRAINT submission_file_settings_pkey;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_pkey;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_pkey;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_pkey;
ALTER TABLE ONLY public.submission_chapter_settings DROP CONSTRAINT submission_chapter_settings_pkey;
ALTER TABLE ONLY public.static_pages DROP CONSTRAINT static_pages_pkey;
ALTER TABLE ONLY public.static_page_settings DROP CONSTRAINT static_page_settings_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignment;
ALTER TABLE ONLY public.spotlights DROP CONSTRAINT spotlights_pkey;
ALTER TABLE ONLY public.spotlight_settings DROP CONSTRAINT spotlight_settings_pkey;
ALTER TABLE ONLY public.site_settings DROP CONSTRAINT site_settings_pkey;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY public.series_settings DROP CONSTRAINT series_settings_pkey;
ALTER TABLE ONLY public.series DROP CONSTRAINT series_pkey;
ALTER TABLE ONLY public.series DROP CONSTRAINT series_path;
ALTER TABLE ONLY public.series_categories DROP CONSTRAINT series_categories_id;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT section_editors_pkey;
ALTER TABLE ONLY public.scheduled_tasks DROP CONSTRAINT scheduled_tasks_pkey;
ALTER TABLE ONLY public.sales_rights DROP CONSTRAINT sales_rights_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_submission_id_stage_id_round_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_pkey;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_pkey;
ALTER TABLE ONLY public.review_forms DROP CONSTRAINT review_forms_pkey;
ALTER TABLE ONLY public.review_form_settings DROP CONSTRAINT review_form_settings_pkey;
ALTER TABLE ONLY public.review_form_elements DROP CONSTRAINT review_form_elements_pkey;
ALTER TABLE ONLY public.review_form_element_settings DROP CONSTRAINT review_form_element_settings_pkey;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_pkey;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_pkey;
ALTER TABLE ONLY public.representatives DROP CONSTRAINT representatives_pkey;
ALTER TABLE ONLY public.queued_payments DROP CONSTRAINT queued_payments_pkey;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_pkey;
ALTER TABLE ONLY public.queries DROP CONSTRAINT queries_pkey;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
ALTER TABLE ONLY public.publication_settings DROP CONSTRAINT publication_settings_pkey;
ALTER TABLE ONLY public.publication_formats DROP CONSTRAINT publication_formats_pkey;
ALTER TABLE ONLY public.publication_format_settings DROP CONSTRAINT publication_format_settings_pkey;
ALTER TABLE ONLY public.publication_dates DROP CONSTRAINT publication_dates_pkey;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_id;
ALTER TABLE ONLY public.presses DROP CONSTRAINT presses_pkey;
ALTER TABLE ONLY public.press_settings DROP CONSTRAINT press_settings_pkey;
ALTER TABLE ONLY public.presses DROP CONSTRAINT press_path;
ALTER TABLE ONLY public.features DROP CONSTRAINT press_features_pkey;
ALTER TABLE ONLY public.plugin_settings DROP CONSTRAINT plugin_settings_pkey;
ALTER TABLE ONLY public.oai_resumption_tokens DROP CONSTRAINT oai_resumption_tokens_pkey;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_pkey;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_pkey;
ALTER TABLE ONLY public.notification_mail_list DROP CONSTRAINT notification_mail_list_pkey;
ALTER TABLE ONLY public.notification_mail_list DROP CONSTRAINT notification_mail_list_email_context;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
ALTER TABLE ONLY public.new_releases DROP CONSTRAINT new_releases_pkey;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_pkey;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_pkey;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT navigation_menu_item_assignment_settings_pkey;
ALTER TABLE ONLY public.metadata_description_settings DROP CONSTRAINT metadata_descripton_settings_pkey;
ALTER TABLE ONLY public.metadata_descriptions DROP CONSTRAINT metadata_descriptions_pkey;
ALTER TABLE ONLY public.markets DROP CONSTRAINT markets_pkey;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_pkey;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_pkey;
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.item_views DROP CONSTRAINT item_views_pkey;
ALTER TABLE ONLY public.identification_codes DROP CONSTRAINT identification_codes_pkey;
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
ALTER TABLE ONLY public.completed_payments DROP CONSTRAINT completed_payments_pkey;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_publication_seq;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_pkey;
ALTER TABLE ONLY public.citation_settings DROP CONSTRAINT citation_settings_pkey;
ALTER TABLE ONLY public.submission_chapter_authors DROP CONSTRAINT chapter_authors_pkey;
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
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.identification_codes ALTER COLUMN identification_code_id DROP DEFAULT;
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
DROP SEQUENCE public.submission_chapters_chapter_id_seq;
DROP TABLE public.submission_chapters;
DROP TABLE public.submission_chapter_settings;
DROP TABLE public.submission_chapter_authors;
DROP TABLE public.subeditor_submission_group;
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
DROP TABLE public.series_categories;
DROP TABLE public.series;
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
DROP SEQUENCE public.jobs_id_seq;
DROP TABLE public.jobs;
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
DROP SEQUENCE public.files_file_id_seq;
DROP TABLE public.files;
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
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_keys; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.access_keys (
    access_key_id bigint NOT NULL,
    context character varying(40) NOT NULL,
    key_hash character varying(40) NOT NULL,
    user_id bigint NOT NULL,
    assoc_id bigint,
    expiry_date timestamp(0) without time zone NOT NULL
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


ALTER SEQUENCE public.access_keys_access_key_id_seq OWNER TO "omp-ci";

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
    setting_type character varying(6)
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
    type_id bigint NOT NULL,
    assoc_type smallint NOT NULL,
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


ALTER SEQUENCE public.announcement_types_type_id_seq OWNER TO "omp-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.announcement_types_type_id_seq OWNED BY public.announcement_types.type_id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.announcements (
    announcement_id bigint NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL,
    type_id bigint,
    date_expire date,
    date_posted timestamp(0) without time zone NOT NULL
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


ALTER SEQUENCE public.announcements_announcement_id_seq OWNER TO "omp-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.announcements_announcement_id_seq OWNED BY public.announcements.announcement_id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.auth_sources (
    auth_id bigint NOT NULL,
    title character varying(60) NOT NULL,
    plugin character varying(32) NOT NULL,
    auth_default smallint DEFAULT '0'::smallint NOT NULL,
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


ALTER SEQUENCE public.auth_sources_auth_id_seq OWNER TO "omp-ci";

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
    setting_value text
);


ALTER TABLE public.author_settings OWNER TO "omp-ci";

--
-- Name: authors; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.authors (
    author_id bigint NOT NULL,
    email character varying(90) NOT NULL,
    include_in_browse smallint DEFAULT '1'::smallint NOT NULL,
    publication_id bigint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
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


ALTER SEQUENCE public.authors_author_id_seq OWNER TO "omp-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.categories (
    category_id bigint NOT NULL,
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


ALTER SEQUENCE public.categories_category_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN category_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.category_settings.setting_type IS '(bool|int|float|string|object)';


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
    citation_id bigint NOT NULL,
    publication_id bigint DEFAULT '0'::bigint NOT NULL,
    raw_citation text NOT NULL,
    seq bigint DEFAULT '0'::bigint NOT NULL
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


ALTER SEQUENCE public.citations_citation_id_seq OWNER TO "omp-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.citations_citation_id_seq OWNED BY public.citations.citation_id;


--
-- Name: completed_payments; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.completed_payments (
    completed_payment_id bigint NOT NULL,
    "timestamp" timestamp(0) without time zone NOT NULL,
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


ALTER SEQUENCE public.completed_payments_completed_payment_id_seq OWNER TO "omp-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.completed_payments_completed_payment_id_seq OWNED BY public.completed_payments.completed_payment_id;


--
-- Name: controlled_vocab_entries; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.controlled_vocab_entries (
    controlled_vocab_entry_id bigint NOT NULL,
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


ALTER SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "omp-ci";

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
    controlled_vocab_id bigint NOT NULL,
    symbolic character varying(64) NOT NULL,
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL
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


ALTER SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq OWNER TO "omp-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq OWNED BY public.controlled_vocabs.controlled_vocab_id;


--
-- Name: data_object_tombstone_oai_set_objects; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.data_object_tombstone_oai_set_objects (
    object_id bigint NOT NULL,
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


ALTER SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN data_object_tombstone_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.data_object_tombstone_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: data_object_tombstones; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.data_object_tombstones (
    tombstone_id bigint NOT NULL,
    data_object_id bigint NOT NULL,
    date_deleted timestamp(0) without time zone NOT NULL,
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


ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNER TO "omp-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNED BY public.data_object_tombstones.tombstone_id;


--
-- Name: edit_decisions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.edit_decisions_edit_decision_id_seq OWNER TO "omp-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.edit_decisions_edit_decision_id_seq OWNED BY public.edit_decisions.edit_decision_id;


--
-- Name: email_log; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.email_log_log_id_seq OWNER TO "omp-ci";

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
    email_id bigint NOT NULL,
    email_key character varying(64) NOT NULL,
    context_id bigint NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.email_templates OWNER TO "omp-ci";

--
-- Name: COLUMN email_templates.email_key; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.email_templates.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.email_templates_default OWNER TO "omp-ci";

--
-- Name: COLUMN email_templates_default.email_key; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.email_templates_default.email_key IS 'Unique identifier for this email.';


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
-- Name: COLUMN email_templates_default_data.email_key; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.email_templates_default_data.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.email_templates_default_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_templates_default_email_id_seq OWNER TO "omp-ci";

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


ALTER SEQUENCE public.email_templates_email_id_seq OWNER TO "omp-ci";

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
    log_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_logged timestamp(0) without time zone NOT NULL,
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


ALTER SEQUENCE public.event_log_log_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN event_log_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.event_log_settings.setting_type IS '(bool|int|float|string|object)';


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
-- Name: files; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.files (
    file_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    mimetype character varying(255) NOT NULL
);


ALTER TABLE public.files OWNER TO "omp-ci";

--
-- Name: files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_file_id_seq OWNER TO "omp-ci";

--
-- Name: files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.files_file_id_seq OWNED BY public.files.file_id;


--
-- Name: filter_groups; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.filter_groups (
    filter_group_id bigint NOT NULL,
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


ALTER SEQUENCE public.filter_groups_filter_group_id_seq OWNER TO "omp-ci";

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
    filter_id bigint NOT NULL,
    filter_group_id bigint DEFAULT '0'::bigint NOT NULL,
    context_id bigint DEFAULT '0'::bigint NOT NULL,
    display_name character varying(255),
    class_name character varying(255),
    is_template smallint DEFAULT '0'::smallint NOT NULL,
    parent_filter_id bigint DEFAULT '0'::bigint NOT NULL,
    seq bigint DEFAULT '0'::bigint NOT NULL
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


ALTER SEQUENCE public.filters_filter_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN genre_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.genre_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: genres; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.genres_genre_id_seq OWNER TO "omp-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- Name: identification_codes; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.identification_codes (
    identification_code_id bigint NOT NULL,
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


ALTER SEQUENCE public.identification_codes_identification_code_id_seq OWNER TO "omp-ci";

--
-- Name: identification_codes_identification_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.identification_codes_identification_code_id_seq OWNED BY public.identification_codes.identification_code_id;


--
-- Name: item_views; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.item_views (
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint,
    date_last_viewed timestamp(0) without time zone
);


ALTER TABLE public.item_views OWNER TO "omp-ci";

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.jobs OWNER TO "omp-ci";

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO "omp-ci";

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


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
-- Name: COLUMN library_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.library_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: library_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.library_files_file_id_seq OWNER TO "omp-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.library_files_file_id_seq OWNED BY public.library_files.file_id;


--
-- Name: markets; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.markets (
    market_id bigint NOT NULL,
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


ALTER SEQUENCE public.markets_market_id_seq OWNER TO "omp-ci";

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
    metadata_description_id bigint NOT NULL,
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL,
    schema_namespace character varying(255) NOT NULL,
    schema_name character varying(255) NOT NULL,
    display_name character varying(255),
    seq bigint DEFAULT '0'::bigint NOT NULL
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


ALTER SEQUENCE public.metadata_descriptions_metadata_description_id_seq OWNER TO "omp-ci";

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
    navigation_menu_item_assignment_id bigint NOT NULL,
    navigation_menu_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    parent_id bigint,
    seq bigint DEFAULT '0'::bigint
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


ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "omp-ci";

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
    navigation_menu_item_id bigint NOT NULL,
    context_id bigint NOT NULL,
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


ALTER SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq OWNER TO "omp-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq OWNED BY public.navigation_menu_items.navigation_menu_item_id;


--
-- Name: navigation_menus; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.navigation_menus (
    navigation_menu_id bigint NOT NULL,
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


ALTER SEQUENCE public.navigation_menus_navigation_menu_id_seq OWNER TO "omp-ci";

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
    note_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_created timestamp(0) without time zone NOT NULL,
    date_modified timestamp(0) without time zone,
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


ALTER SEQUENCE public.notes_note_id_seq OWNER TO "omp-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;


--
-- Name: notification_mail_list; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.notification_mail_list (
    notification_mail_list_id bigint NOT NULL,
    email character varying(90) NOT NULL,
    confirmed smallint DEFAULT '0'::smallint NOT NULL,
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


ALTER SEQUENCE public.notification_mail_list_notification_mail_list_id_seq OWNER TO "omp-ci";

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
    setting_value text NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_settings OWNER TO "omp-ci";

--
-- Name: COLUMN notification_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.notification_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.notification_subscription_settings (
    setting_id bigint NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL,
    user_id bigint NOT NULL,
    context bigint NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_subscription_settings OWNER TO "omp-ci";

--
-- Name: COLUMN notification_subscription_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.notification_subscription_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.notification_subscription_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_subscription_settings_setting_id_seq OWNER TO "omp-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.notification_subscription_settings_setting_id_seq OWNED BY public.notification_subscription_settings.setting_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN plugin_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.plugin_settings.setting_type IS '(bool|int|float|string|object)';


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
    press_id bigint NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
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


ALTER SEQUENCE public.presses_press_id_seq OWNER TO "omp-ci";

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
    publication_date_id bigint NOT NULL,
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


ALTER SEQUENCE public.publication_dates_publication_date_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN publication_format_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.publication_format_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: publication_formats; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.publication_formats (
    publication_format_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    submission_id bigint,
    physical_format smallint DEFAULT '1'::smallint,
    entry_key character varying(64),
    seq double precision DEFAULT '0'::double precision NOT NULL,
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
    is_approved smallint DEFAULT '0'::smallint NOT NULL,
    is_available smallint DEFAULT '0'::smallint NOT NULL
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


ALTER SEQUENCE public.publication_formats_publication_format_id_seq OWNER TO "omp-ci";

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
    publication_id bigint NOT NULL,
    date_published date,
    last_modified timestamp(0) without time zone,
    locale character varying(14),
    primary_contact_id bigint,
    publication_date_type character varying(32) DEFAULT 'pub'::character varying,
    publication_type character varying(32) DEFAULT 'publication'::character varying,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    series_id bigint,
    series_position character varying(255),
    submission_id bigint NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
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


ALTER SEQUENCE public.publications_publication_id_seq OWNER TO "omp-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.publications_publication_id_seq OWNED BY public.publications.publication_id;


--
-- Name: queries; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.queries_query_id_seq OWNER TO "omp-ci";

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
    queued_payment_id bigint NOT NULL,
    date_created timestamp(0) without time zone NOT NULL,
    date_modified timestamp(0) without time zone NOT NULL,
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


ALTER SEQUENCE public.queued_payments_queued_payment_id_seq OWNER TO "omp-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.queued_payments_queued_payment_id_seq OWNED BY public.queued_payments.queued_payment_id;


--
-- Name: representatives; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.representatives (
    representative_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    role character varying(40) NOT NULL,
    representative_id_type character varying(255),
    representative_id_value character varying(255),
    name character varying(255),
    phone character varying(255),
    email character varying(255),
    url character varying(2047),
    is_supplier smallint DEFAULT '1'::smallint NOT NULL
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


ALTER SEQUENCE public.representatives_representative_id_seq OWNER TO "omp-ci";

--
-- Name: representatives_representative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.representatives_representative_id_seq OWNED BY public.representatives.representative_id;


--
-- Name: review_assignments; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.review_assignments_review_id_seq OWNER TO "omp-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.review_assignments_review_id_seq OWNED BY public.review_assignments.review_id;


--
-- Name: review_files; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_files (
    review_id bigint NOT NULL,
    submission_file_id bigint NOT NULL
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
    review_form_element_id bigint NOT NULL,
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


ALTER SEQUENCE public.review_form_elements_review_form_element_id_seq OWNER TO "omp-ci";

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
    review_form_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
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


ALTER SEQUENCE public.review_forms_review_form_id_seq OWNER TO "omp-ci";

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
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_round_files OWNER TO "omp-ci";

--
-- Name: review_rounds; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.review_rounds (
    review_round_id bigint NOT NULL,
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


ALTER SEQUENCE public.review_rounds_review_round_id_seq OWNER TO "omp-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.review_rounds_review_round_id_seq OWNED BY public.review_rounds.review_round_id;


--
-- Name: sales_rights; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.sales_rights (
    sales_rights_id bigint NOT NULL,
    publication_format_id bigint NOT NULL,
    type character varying(40) NOT NULL,
    row_setting smallint DEFAULT '0'::smallint NOT NULL,
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


ALTER SEQUENCE public.sales_rights_sales_rights_id_seq OWNER TO "omp-ci";

--
-- Name: sales_rights_sales_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.sales_rights_sales_rights_id_seq OWNED BY public.sales_rights.sales_rights_id;


--
-- Name: scheduled_tasks; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.scheduled_tasks (
    class_name character varying(255) NOT NULL,
    last_run timestamp(0) without time zone
);


ALTER TABLE public.scheduled_tasks OWNER TO "omp-ci";

--
-- Name: series; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.series (
    series_id bigint NOT NULL,
    press_id bigint NOT NULL,
    review_form_id bigint,
    seq double precision DEFAULT '0'::double precision,
    featured smallint DEFAULT '0'::smallint NOT NULL,
    editor_restricted smallint DEFAULT '0'::smallint NOT NULL,
    path character varying(255) NOT NULL,
    image text,
    is_inactive smallint DEFAULT '0'::smallint NOT NULL
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
-- Name: series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.series_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.series_series_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN series_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.series_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.sessions OWNER TO "omp-ci";

--
-- Name: site; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.site (
    redirect bigint DEFAULT '0'::bigint NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT '6'::smallint NOT NULL,
    installed_locales character varying(1024) DEFAULT 'en_US'::character varying NOT NULL,
    supported_locales character varying(1024),
    original_style_file_name character varying(255)
);


ALTER TABLE public.site OWNER TO "omp-ci";

--
-- Name: COLUMN site.redirect; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.site.redirect IS 'If not 0, redirect to the specified journal/conference/... site.';


--
-- Name: COLUMN site.primary_locale; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.site.primary_locale IS 'Primary locale for the site.';


--
-- Name: COLUMN site.installed_locales; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.site.installed_locales IS 'Locales for which support has been installed.';


--
-- Name: COLUMN site.supported_locales; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.site.supported_locales IS 'Locales supported by the site (for hosted journals/conferences/...).';


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
-- Name: COLUMN spotlight_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.spotlight_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: spotlights; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.spotlights (
    spotlight_id bigint NOT NULL,
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


ALTER SEQUENCE public.spotlights_spotlight_id_seq OWNER TO "omp-ci";

--
-- Name: spotlights_spotlight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.spotlights_spotlight_id_seq OWNED BY public.spotlights.spotlight_id;


--
-- Name: stage_assignments; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.stage_assignments_stage_assignment_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN static_page_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.static_page_settings.setting_type IS '(bool|int|float|string|object)';


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


ALTER SEQUENCE public.static_pages_static_page_id_seq OWNER TO "omp-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.static_pages_static_page_id_seq OWNED BY public.static_pages.static_page_id;


--
-- Name: subeditor_submission_group; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.subeditor_submission_group (
    context_id bigint NOT NULL,
    assoc_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.subeditor_submission_group OWNER TO "omp-ci";

--
-- Name: submission_chapter_authors; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_chapter_authors (
    author_id bigint NOT NULL,
    chapter_id bigint NOT NULL,
    primary_contact smallint DEFAULT '0'::smallint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: COLUMN submission_chapter_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.submission_chapter_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: submission_chapters; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_chapters (
    chapter_id bigint NOT NULL,
    primary_contact_id bigint,
    publication_id bigint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL
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


ALTER SEQUENCE public.submission_chapters_chapter_id_seq OWNER TO "omp-ci";

--
-- Name: submission_chapters_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_chapters_chapter_id_seq OWNED BY public.submission_chapters.chapter_id;


--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.submission_comments_comment_id_seq OWNER TO "omp-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_comments_comment_id_seq OWNED BY public.submission_comments.comment_id;


--
-- Name: submission_file_revisions; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_file_revisions (
    revision_id bigint NOT NULL,
    submission_file_id bigint NOT NULL,
    file_id bigint NOT NULL
);


ALTER TABLE public.submission_file_revisions OWNER TO "omp-ci";

--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_file_revisions_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submission_file_revisions_revision_id_seq OWNER TO "omp-ci";

--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_file_revisions_revision_id_seq OWNED BY public.submission_file_revisions.revision_id;


--
-- Name: submission_file_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_file_settings (
    submission_file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) DEFAULT 'string'::character varying NOT NULL
);


ALTER TABLE public.submission_file_settings OWNER TO "omp-ci";

--
-- Name: COLUMN submission_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.submission_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER TABLE public.submission_files OWNER TO "omp-ci";

--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_files_submission_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submission_files_submission_file_id_seq OWNER TO "omp-ci";

--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submission_files_submission_file_id_seq OWNED BY public.submission_files.submission_file_id;


--
-- Name: submission_search_keyword_list; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_search_keyword_list (
    keyword_id bigint NOT NULL,
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


ALTER SEQUENCE public.submission_search_keyword_list_keyword_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN submission_search_object_keywords.pos; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.submission_search_object_keywords.pos IS 'Word position of the keyword in the object.';


--
-- Name: submission_search_objects; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.submission_search_objects (
    object_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    type integer NOT NULL,
    assoc_id bigint
);


ALTER TABLE public.submission_search_objects OWNER TO "omp-ci";

--
-- Name: COLUMN submission_search_objects.type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.submission_search_objects.type IS 'Type of item. E.g., abstract, fulltext, etc.';


--
-- Name: COLUMN submission_search_objects.assoc_id; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.submission_search_objects.assoc_id IS 'Optional ID of an associated record (e.g., a file_id)';


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.submission_search_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submission_search_objects_object_id_seq OWNER TO "omp-ci";

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
-- Name: submissions; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.submissions_submission_id_seq OWNER TO "omp-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.submissions_submission_id_seq OWNED BY public.submissions.submission_id;


--
-- Name: temporary_files; Type: TABLE; Schema: public; Owner: omp-ci
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


ALTER SEQUENCE public.temporary_files_file_id_seq OWNER TO "omp-ci";

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
    metric bigint DEFAULT '1'::bigint NOT NULL,
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
-- Name: COLUMN user_group_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.user_group_settings.setting_type IS '(bool|int|float|string|object)';


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
    user_group_id bigint NOT NULL,
    context_id bigint NOT NULL,
    role_id bigint NOT NULL,
    is_default smallint DEFAULT '0'::smallint NOT NULL,
    show_title smallint DEFAULT '1'::smallint NOT NULL,
    permit_self_registration smallint DEFAULT '0'::smallint NOT NULL,
    permit_metadata_edit smallint DEFAULT '0'::smallint NOT NULL
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


ALTER SEQUENCE public.user_groups_user_group_id_seq OWNER TO "omp-ci";

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
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL,
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


ALTER SEQUENCE public.users_user_id_seq OWNER TO "omp-ci";

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
    date_installed timestamp(0) without time zone NOT NULL,
    current smallint DEFAULT '0'::smallint NOT NULL,
    product_type character varying(30),
    product character varying(30),
    product_class_name character varying(80),
    lazy_load smallint DEFAULT '0'::smallint NOT NULL,
    sitewide smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.versions OWNER TO "omp-ci";

--
-- Name: COLUMN versions.major; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.major IS 'Major component of version number, e.g. the 2 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.minor; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.minor IS 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.revision; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.revision IS 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.build; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.build IS 'Build component of version number, e.g. the 0 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.current; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.current IS '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.';


--
-- Name: COLUMN versions.product_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.product_type IS 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf';


--
-- Name: COLUMN versions.product; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.product IS 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.';


--
-- Name: COLUMN versions.product_class_name; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.product_class_name IS 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.';


--
-- Name: COLUMN versions.lazy_load; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.lazy_load IS '1 iff the row describes a lazy-load plugin; 0 otherwise';


--
-- Name: COLUMN versions.sitewide; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.versions.sitewide IS '1 iff the row describes a site-wide plugin; 0 otherwise';


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
-- Name: files file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


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
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


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
-- Name: submission_file_revisions revision_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions ALTER COLUMN revision_id SET DEFAULT nextval('public.submission_file_revisions_revision_id_seq'::regclass);


--
-- Name: submission_files submission_file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN submission_file_id SET DEFAULT nextval('public.submission_files_submission_file_id_seq'::regclass);


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

COPY public.author_settings (author_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	affiliation	University of Calgary
1		country	CA
1	en_US	familyName	Clark
1	en_US	givenName	Arthur
2	en_US	affiliation	Athabasca University
2		country	CA
2	en_US	familyName	Finkel
2	en_US	givenName	Alvin
3	en_US	affiliation	
3	fr_CA	affiliation	
3	en_US	biography	
3	fr_CA	biography	
3		country	CA
3	en_US	familyName	Carter
3	fr_CA	familyName	
3	en_US	givenName	Sarah
3	fr_CA	givenName	
3		orcid	
3	en_US	preferredPublicName	
3	fr_CA	preferredPublicName	
3		url	
4	en_US	affiliation	
4	fr_CA	affiliation	
4	en_US	biography	
4	fr_CA	biography	
4		country	CA
4	en_US	familyName	Fortna
4	fr_CA	familyName	
4	en_US	givenName	Peter
4	fr_CA	givenName	
4		orcid	
4	en_US	preferredPublicName	
4	fr_CA	preferredPublicName	
4		url	
5	en_US	affiliation	
5	fr_CA	affiliation	
5	en_US	biography	
5	fr_CA	biography	
5		country	CA
5	en_US	familyName	Friesen
5	fr_CA	familyName	
5	en_US	givenName	Gerald
5	fr_CA	givenName	
5		orcid	
5	en_US	preferredPublicName	
5	fr_CA	preferredPublicName	
5		url	
6	en_US	affiliation	
6	fr_CA	affiliation	
6	en_US	biography	
6	fr_CA	biography	
6		country	CA
6	en_US	familyName	Dick
6	fr_CA	familyName	
6	en_US	givenName	Lyle
6	fr_CA	givenName	
6		orcid	
6	en_US	preferredPublicName	
6	fr_CA	preferredPublicName	
6		url	
7	en_US	affiliation	
7	fr_CA	affiliation	
7	en_US	biography	
7	fr_CA	biography	
7		country	CA
7	en_US	familyName	Wheeler
7	fr_CA	familyName	
7	en_US	givenName	Winona
7	fr_CA	givenName	
7		orcid	
7	en_US	preferredPublicName	
7	fr_CA	preferredPublicName	
7		url	
8	en_US	affiliation	
8	fr_CA	affiliation	
8	en_US	biography	
8	fr_CA	biography	
8		country	CA
8	en_US	familyName	Dyce
8	fr_CA	familyName	
8	en_US	givenName	Matt
8	fr_CA	givenName	
8		orcid	
8	en_US	preferredPublicName	
8	fr_CA	preferredPublicName	
8		url	
9	en_US	affiliation	
9	fr_CA	affiliation	
9	en_US	biography	
9	fr_CA	biography	
9		country	CA
9	en_US	familyName	Opp
9	fr_CA	familyName	
9	en_US	givenName	James
9	fr_CA	givenName	
9		orcid	
9	en_US	preferredPublicName	
9	fr_CA	preferredPublicName	
9		url	
10	en_US	affiliation	Athabasca University
10		country	CA
10	en_US	familyName	Barnetson
10	en_US	givenName	Bob
11	en_US	affiliation	University of British Columbia
11		country	CA
11	en_US	familyName	Beaty
11	en_US	givenName	Bart
12	en_US	affiliation	University of Alberta
12	fr_CA	affiliation	
12	en_US	biography	
12	fr_CA	biography	
12		country	CA
12	en_US	familyName	Miller
12	fr_CA	familyName	
12	en_US	givenName	Toby
12	fr_CA	givenName	
12		orcid	
12	en_US	preferredPublicName	
12	fr_CA	preferredPublicName	
12		url	
13	fr_CA	affiliation	
13	en_US	biography	
13	fr_CA	biography	
13		country	CA
13	en_US	familyName	Wagman
13	fr_CA	familyName	
13	en_US	givenName	Ira
13	fr_CA	givenName	
13		orcid	
13	en_US	affiliation	Athabasca University
13	en_US	preferredPublicName	
13	fr_CA	preferredPublicName	
13		url	
14	en_US	affiliation	University of Calgary
14	fr_CA	affiliation	
14	en_US	biography	
14	fr_CA	biography	
14		country	CA
14	en_US	familyName	Straw
14	fr_CA	familyName	
14	en_US	givenName	Will
14	fr_CA	givenName	
14		orcid	
14	en_US	preferredPublicName	
14	fr_CA	preferredPublicName	
14		url	
15	en_US	affiliation	University of Southern California
15		country	CA
15	en_US	familyName	Allan
15	en_US	givenName	Chantal
16	en_US	affiliation	SUNY
16		country	US
16	en_US	familyName	Bernnard
16	en_US	givenName	Deborah
17	en_US	affiliation	SUNY
17	fr_CA	affiliation	
17	en_US	biography	
17	fr_CA	biography	
17		country	US
17	en_US	familyName	Bobish
17	fr_CA	familyName	
17	en_US	givenName	Greg
17	fr_CA	givenName	
17		orcid	
17	en_US	preferredPublicName	
17	fr_CA	preferredPublicName	
17		url	
18	en_US	affiliation	SUNY
18	fr_CA	affiliation	
18	en_US	biography	
18	fr_CA	biography	
18		country	US
18	en_US	familyName	Bullis
18	fr_CA	familyName	
18	en_US	givenName	Daryl
18	fr_CA	givenName	
18		orcid	
18	en_US	preferredPublicName	
18	fr_CA	preferredPublicName	
18		url	
19	en_US	affiliation	SUNY
19	fr_CA	affiliation	
19	en_US	biography	
19	fr_CA	biography	
19		country	US
19	en_US	familyName	Hecker
19	fr_CA	familyName	
19	en_US	givenName	Jenna
19	fr_CA	givenName	
19		orcid	
19	en_US	preferredPublicName	
19	fr_CA	preferredPublicName	
19		url	
20	en_US	affiliation	Athabasca University
20		country	CA
20	en_US	familyName	Kennepohl
20	en_US	givenName	Dietmar
21	en_US	affiliation	University of Calgary
21	fr_CA	affiliation	
21	en_US	biography	
21	fr_CA	biography	
21		country	CA
21	en_US	familyName	Anderson
21	fr_CA	familyName	
21	en_US	givenName	Terry
21	fr_CA	givenName	
21		orcid	
21	en_US	preferredPublicName	
21	fr_CA	preferredPublicName	
21		url	
22	en_US	affiliation	University of Alberta
22	fr_CA	affiliation	
22	en_US	biography	
22	fr_CA	biography	
22		country	CA
22	en_US	familyName	Gorsky
22	fr_CA	familyName	
22	en_US	givenName	Paul
22	fr_CA	givenName	
22		orcid	
22	en_US	preferredPublicName	
22	fr_CA	preferredPublicName	
22		url	
23	en_US	affiliation	Athabasca University
23	fr_CA	affiliation	
23	en_US	biography	
23	fr_CA	biography	
23		country	CA
23	en_US	familyName	Parchoma
23	fr_CA	familyName	
23	en_US	givenName	Gale
23	fr_CA	givenName	
23		orcid	
23	en_US	preferredPublicName	
23	fr_CA	preferredPublicName	
23		url	
24	en_US	affiliation	University of Alberta
24	fr_CA	affiliation	
24	en_US	biography	
24	fr_CA	biography	
24		country	CA
24	en_US	familyName	Palmer
24	fr_CA	familyName	
24	en_US	givenName	Stuart
24	fr_CA	givenName	
24		orcid	
24	en_US	preferredPublicName	
24	fr_CA	preferredPublicName	
24		url	
25	fr_CA	affiliation	
25	en_US	affiliation	University of Melbourne
25	fr_CA	biography	
25	en_US	biography	
25		country	AU
25	fr_CA	familyName	
25	en_US	familyName	Barnes
25	en_US	givenName	Daniel
25	fr_CA	givenName	
25		orcid	
25		url	
26	en_US	affiliation	University of Sussex
26		country	CA
26	en_US	familyName	Perini
26	en_US	givenName	Fernando
27	en_US	affiliation	
27	fr_CA	affiliation	
27	en_US	biography	
27	fr_CA	biography	
27		country	GB
27	en_US	familyName	Mansell
27	fr_CA	familyName	
27	en_US	givenName	Robin
27	fr_CA	givenName	
27		orcid	
27	en_US	preferredPublicName	
27	fr_CA	preferredPublicName	
27		url	
28	en_US	affiliation	
28	fr_CA	affiliation	
28	en_US	biography	
28	fr_CA	biography	
28		country	AR
28	en_US	familyName	Galperin
28	fr_CA	familyName	
28	en_US	givenName	Hernan
28	fr_CA	givenName	
28		orcid	
28	en_US	preferredPublicName	
28	fr_CA	preferredPublicName	
28		url	
29	en_US	affiliation	
29	fr_CA	affiliation	
29	en_US	biography	
29	fr_CA	biography	
29		country	CL
29	en_US	familyName	Bello
29	fr_CA	familyName	
29	en_US	givenName	Pablo
29	fr_CA	givenName	
29		orcid	
29	en_US	preferredPublicName	
29	fr_CA	preferredPublicName	
29		url	
30	en_US	affiliation	
30	fr_CA	affiliation	
30	en_US	biography	
30	fr_CA	biography	
30		country	AR
30	en_US	familyName	Rabinovich
30	fr_CA	familyName	
30	en_US	givenName	Eleonora
30	fr_CA	givenName	
30		orcid	
30	en_US	preferredPublicName	
30	fr_CA	preferredPublicName	
30		url	
31	en_US	affiliation	Buffalo National Park Foundation
31		country	CA
31	en_US	familyName	Brower
31	en_US	givenName	Jennifer
32	en_US	affiliation	University of Alberta
32		country	CA
32	en_US	familyName	Locke Hart
32	en_US	givenName	Jonathan
33	en_US	affiliation	International Development Research Centre
33		country	CA
33	en_US	familyName	Elder
33	en_US	givenName	Laurent
34	en_US	affiliation	
34	fr_CA	affiliation	
34	en_US	biography	
34	fr_CA	biography	
34		country	CA
34	en_US	familyName	Emdon
34	fr_CA	familyName	
34	en_US	givenName	Heloise
34	fr_CA	givenName	
34		orcid	
34	en_US	preferredPublicName	
34	fr_CA	preferredPublicName	
34		url	
35	en_US	affiliation	
35	fr_CA	affiliation	
35	en_US	biography	
35	fr_CA	biography	
35		country	CA
35	en_US	familyName	Tulus
35	fr_CA	familyName	
35	en_US	givenName	Frank
35	fr_CA	givenName	
35		orcid	
35	en_US	preferredPublicName	
35	fr_CA	preferredPublicName	
35		url	
36	en_US	affiliation	
36	fr_CA	affiliation	
36	en_US	biography	
36	fr_CA	biography	
36		country	AR
36	en_US	familyName	Hyma
36	fr_CA	familyName	
36	en_US	givenName	Raymond
36	fr_CA	givenName	
36		orcid	
36	en_US	preferredPublicName	
36	fr_CA	preferredPublicName	
36		url	
37	en_US	affiliation	
37	fr_CA	affiliation	
37	en_US	biography	
37	fr_CA	biography	
37		country	CA
37	en_US	familyName	Valk
37	fr_CA	familyName	
37	en_US	givenName	John
37	fr_CA	givenName	
37		orcid	
37	en_US	preferredPublicName	
37	fr_CA	preferredPublicName	
37		url	
38	fr_CA	affiliation	
38	en_US	biography	
38	fr_CA	biography	
38		country	CA
38	en_US	familyName	Fourati
38	fr_CA	familyName	
38	en_US	givenName	Khaled
38	en_US	affiliation	
38	fr_CA	givenName	
38		orcid	
38	en_US	preferredPublicName	
38	fr_CA	preferredPublicName	
38		url	
39	en_US	affiliation	
39	fr_CA	affiliation	
39	en_US	biography	
39	fr_CA	biography	
39		country	CA
39	en_US	familyName	de Beer
39	fr_CA	familyName	
39	en_US	givenName	Jeremy
39	fr_CA	givenName	
39		orcid	
39	en_US	preferredPublicName	
39	fr_CA	preferredPublicName	
39		url	
40	en_US	affiliation	
40	fr_CA	affiliation	
40	en_US	biography	
40	fr_CA	biography	
40		country	CA
40	en_US	familyName	Bannerman
40	fr_CA	familyName	
40	en_US	givenName	Sara
40	fr_CA	givenName	
40		orcid	
40	en_US	preferredPublicName	
40	fr_CA	preferredPublicName	
40		url	
41	en_US	affiliation	Athabasca University
41		country	CA
41	en_US	familyName	Ally
41	en_US	givenName	Mohamed
42	en_US	affiliation	
42	fr_CA	affiliation	
42	en_US	biography	
42	fr_CA	biography	
42		country	GB
42	en_US	familyName	Traxler
42	fr_CA	familyName	
42	en_US	givenName	John
42	fr_CA	givenName	
42		orcid	
42	en_US	preferredPublicName	
42	fr_CA	preferredPublicName	
42		url	
43	en_US	affiliation	
43	fr_CA	affiliation	
43	en_US	biography	
43	fr_CA	biography	
43		country	CA
43	en_US	familyName	Koole
43	fr_CA	familyName	
43	en_US	givenName	Marguerite
43	fr_CA	givenName	
43		orcid	
43	en_US	preferredPublicName	
43	fr_CA	preferredPublicName	
43		url	
44	en_US	affiliation	
44	fr_CA	affiliation	
44	en_US	biography	
44	fr_CA	biography	
44		country	NO
44	en_US	familyName	Rekkedal
44	fr_CA	familyName	
44	en_US	givenName	Torstein
44	fr_CA	givenName	
44		orcid	
44	en_US	preferredPublicName	
44	fr_CA	preferredPublicName	
44		url	
45	en_US	affiliation	University of Alberta
45		country	CA
45	en_US	familyName	Dawson
45	en_US	givenName	Michael
46	en_US	affiliation	Athabasca University
46	fr_CA	affiliation	
46	en_US	biography	
46	fr_CA	biography	
46		country	CA
46	en_US	familyName	Dupuis
46	fr_CA	familyName	
46	en_US	givenName	Brian
46	fr_CA	givenName	
46		orcid	
46	en_US	preferredPublicName	
46	fr_CA	preferredPublicName	
46		url	
47	en_US	affiliation	University of Calgary
47	fr_CA	affiliation	
47	en_US	biography	
47	fr_CA	biography	
47		country	CA
47	en_US	familyName	Wilson
47	fr_CA	familyName	
47	en_US	givenName	Michael
47	fr_CA	givenName	
47		orcid	
47	en_US	preferredPublicName	
47	fr_CA	preferredPublicName	
47		url	
48	en_US	affiliation	University of Calgary
48		country	CA
48	en_US	familyName	Foran
48	en_US	givenName	Max
49	en_US	affiliation	London School of Economics
49		country	CA
49	en_US	familyName	Power
49	en_US	givenName	Michael
50	en_US	affiliation	International Development Research Centre
50		country	CA
50	en_US	familyName	Smith
50	en_US	givenName	Matthew
51	fr_CA	affiliation	
51	en_US	biography	
51	fr_CA	biography	
51		country	US
51	en_US	familyName	Benkler
51	fr_CA	familyName	
51	en_US	givenName	Yochai
51	fr_CA	givenName	
51		orcid	
51	fr_CA	preferredPublicName	
51		url	
51	en_US	affiliation	
51	en_US	preferredPublicName	
52	en_US	affiliation	
52	fr_CA	affiliation	
52	en_US	biography	
52	fr_CA	biography	
52		country	CA
52	en_US	familyName	Reilly
52	fr_CA	familyName	
52	en_US	givenName	Katherine
52	fr_CA	givenName	
52		orcid	
52	en_US	preferredPublicName	
52	fr_CA	preferredPublicName	
52		url	
53	en_US	affiliation	
53	fr_CA	affiliation	
53	en_US	biography	
53	fr_CA	biography	
53		country	US
53	en_US	familyName	Loudon
53	fr_CA	familyName	
53	en_US	givenName	Melissa
53	fr_CA	givenName	
53		orcid	
53	en_US	preferredPublicName	
53	fr_CA	preferredPublicName	
53		url	
54	en_US	affiliation	
54	fr_CA	affiliation	
54	en_US	biography	
54	fr_CA	biography	
54		country	ZA
54	en_US	familyName	Rivett
54	fr_CA	familyName	
54	en_US	givenName	Ulrike
54	fr_CA	givenName	
54		orcid	
54	en_US	preferredPublicName	
54	fr_CA	preferredPublicName	
54		url	
55	en_US	affiliation	
55	fr_CA	affiliation	
55	en_US	biography	
55	fr_CA	biography	
55		country	GB
55	en_US	familyName	Graham
55	fr_CA	familyName	
55	en_US	givenName	Mark
55	fr_CA	givenName	
55		orcid	
55	en_US	preferredPublicName	
55	fr_CA	preferredPublicName	
55		url	
56	en_US	affiliation	
56	fr_CA	affiliation	
56	en_US	biography	
56	fr_CA	biography	
56		country	NO
56	en_US	familyName	Haarstad
56	fr_CA	familyName	
56	en_US	givenName	Håvard
56	fr_CA	givenName	
56		orcid	
56	en_US	preferredPublicName	
56	fr_CA	preferredPublicName	
56		url	
57	en_US	affiliation	
57	fr_CA	affiliation	
57	en_US	biography	
57	fr_CA	biography	
57		country	US
57	en_US	familyName	Smith
57	fr_CA	familyName	
57	en_US	givenName	Marshall
57	fr_CA	givenName	
57		orcid	
57	en_US	preferredPublicName	
57	fr_CA	preferredPublicName	
57		url	
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, seq, user_group_id) FROM stdin;
1	aclark@mailinator.com	1	1	0	13
2	afinkel@mailinator.com	1	2	0	14
3	scarter@mailinator.com	1	2	1	14
4	pfortna@mailinator.com	1	2	2	14
5	gfriesen@mailinator.com	1	2	3	13
6	ldick@mailinator.com	1	2	4	13
7	wwheeler@mailinator.com	1	2	5	13
8	mdyce@mailinator.com	1	2	6	13
9	jopp@mailinator.com	1	2	7	13
10	bbarnetson@mailinator.com	1	3	0	13
11	bbeaty@mailinator.com	1	4	0	14
12	tmiller@mailinator.com	1	4	1	13
13	awagman@mailinator.com	1	4	2	13
14	wstraw@mailinator.com	1	4	3	13
15	callan@mailinator.com	1	5	0	13
16	dbernnard@mailinator.com	1	6	0	14
17	gbobish@mailinator.com	1	6	1	13
18	dbullis@mailinator.com	1	6	2	13
19	jhecker@mailinator.com	1	6	3	13
20	dkennepohl@mailinator.com	1	7	0	14
21	tanderson@mailinator.com	1	7	1	13
22	pgorsky@mailinator.com	1	7	2	13
23	gparchoma@mailinator.com	1	7	3	13
24	spalmer@mailinator.com	1	7	4	13
25	dbarnes@mailinator.com	1	8	0	13
26	fperini@mailinator.com	1	9	0	14
27	rmansell@mailinator.com	1	9	1	13
28	hgalperin@mailinator.com	1	9	2	13
29	pbello@mailinator.com	1	9	3	13
30	erabinovich@mailinator.com	1	9	4	13
31	jbrower@mailinator.com	1	10	0	13
32	jlockehart@mailinator.com	1	11	0	13
33	lelder@mailinator.com	1	12	0	14
34	lelder@mailinator.com	1	12	1	14
35	ftulus@mailinator.com	1	12	2	13
36	rhyma@mailinator.com	1	12	3	13
37	jvalk@mailinator.com	1	12	4	13
38	fkourati@mailinator.com	1	12	5	13
39	jdebeer@mailinator.com	1	12	6	13
40	sbannerman@mailinator.com	1	12	7	13
41	mally@mailinator.com	1	13	0	14
42	jtraxler@mailinator.com	1	13	1	13
43	mkoole@mailinator.com	1	13	2	13
44	trekkedal@mailinator.com	1	13	3	13
45	mdawson@mailinator.com	1	14	0	14
46	bdupuis@mailinator.com	1	14	1	13
47	mwilson@mailinator.com	1	14	2	13
48	mforan@mailinator.com	1	15	0	13
49	mpower@mailinator.com	1	16	0	13
50	msmith@mailinator.com	1	17	0	14
51	ybenkler@mailinator.com	1	17	1	13
52	kreilly@mailinator.com	1	17	2	13
53	mloudon@mailinator.com	1	17	3	13
54	urivett@mailinator.com	1	17	4	13
55	mgraham@mailinator.com	1	17	5	13
56	hhaarstad@mailinator.com	1	17	6	13
57	masmith@mailinator.com	1	17	7	13
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
1	12	1
2	12	2
3	17	1
4	17	2
8	22	1
9	22	2
10	22	3
11	27	1
12	27	2
13	32	1
14	42	1
15	42	2
16	42	3
17	47	1
18	47	2
19	47	3
20	57	1
21	57	2
22	62	1
24	67	1
25	82	1
26	82	2
\.


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	submissionKeyword	Business & Economics	string
2	en_US	submissionKeyword	Political & International Studies	string
3	en_US	submissionKeyword	Canadian Studies	string
4	en_US	submissionKeyword	Communication & Cultural Studies	string
8	en_US	submissionKeyword	Canadian Studies	string
9	en_US	submissionKeyword	Communication & Cultural Studies	string
10	en_US	submissionKeyword	Political & International Studies	string
11	en_US	submissionKeyword	information literacy	string
12	en_US	submissionKeyword	academic libraries	string
13	en_US	submissionKeyword	Education	string
14	en_US	submissionKeyword	Information	string
15	en_US	submissionKeyword	society	string
16	en_US	submissionKeyword	ICT	string
17	en_US	submissionKeyword	Biography & Memoir	string
18	en_US	submissionKeyword	Environmental Studies	string
19	en_US	submissionKeyword	Political & International Studies	string
20	en_US	submissionKeyword	International Development	string
21	en_US	submissionKeyword	ICT	string
22	en_US	submissionKeyword	Educational Technology	string
24	en_US	submissionKeyword	Psychology	string
25	en_US	submissionKeyword	International Development	string
26	en_US	submissionKeyword	ICT	string
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: omp-ci
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
1	1	0	1	0	3	3	2025-10-21 05:15:46
2	1	1	3	1	3	2	2025-10-21 05:15:52
3	2	0	1	0	3	3	2025-10-21 05:16:52
4	4	0	1	0	3	1	2025-10-21 05:18:15
5	4	3	2	1	3	3	2025-10-21 05:18:23
6	4	4	3	1	3	2	2025-10-21 05:18:30
7	4	0	4	0	3	7	2025-10-21 05:18:37
8	5	0	1	0	3	1	2025-10-21 05:19:17
9	5	5	2	1	3	3	2025-10-21 05:19:23
10	5	6	3	1	3	2	2025-10-21 05:19:30
11	5	0	4	0	3	7	2025-10-21 05:19:37
12	6	0	1	0	3	1	2025-10-21 05:20:40
13	6	7	2	1	6	15	2025-10-21 05:20:50
14	7	0	1	0	3	3	2025-10-21 05:21:50
15	7	8	3	1	3	2	2025-10-21 05:21:58
16	9	0	1	0	3	1	2025-10-21 05:23:05
17	11	0	1	0	3	1	2025-10-21 05:24:07
18	11	10	2	1	3	3	2025-10-21 05:24:13
19	11	11	3	1	3	2	2025-10-21 05:24:39
20	12	0	1	0	3	1	2025-10-21 05:25:30
21	13	0	1	0	3	1	2025-10-21 05:26:29
22	13	13	2	1	3	3	2025-10-21 05:26:36
23	13	14	3	1	3	2	2025-10-21 05:27:11
24	14	0	1	0	3	1	2025-10-21 05:27:58
25	14	15	2	1	3	3	2025-10-21 05:28:06
26	14	16	3	1	3	2	2025-10-21 05:28:13
27	14	0	4	0	3	7	2025-10-21 05:28:21
28	15	0	1	0	3	3	2025-10-21 05:29:28
29	16	0	1	0	3	3	2025-10-21 05:30:00
30	17	0	1	0	3	1	2025-10-21 05:31:33
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	19	2025-10-21 05:15:42	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Arthur Clark:<br />\n<br />\nThank you for submitting the manuscript, &quot;The ABCs of Human Survival: A Paradigm for Global Citizenship&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/1' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a><br />\nUsername: aclark<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
2	1048585	1	3	2025-10-21 05:15:50	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Gonzalo Favio" <gfavio@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
3	1048585	1	3	2025-10-21 05:15:52	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Arthur Clark:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "The ABCs of Human Survival: A Paradigm for Global Citizenship".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/1">http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
4	1048585	2	20	2025-10-21 05:16:47	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Alvin Finkel" <afinkel@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Alvin Finkel:<br />\n<br />\nThank you for submitting the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/2' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/2</a><br />\nUsername: afinkel<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
5	1048585	2	20	2025-10-21 05:16:47	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Sarah Carter" <scarter@mailinator.com>, "Peter Fortna" <pfortna@mailinator.com>, "Gerald Friesen" <gfriesen@mailinator.com>, "Lyle Dick" <ldick@mailinator.com>, "Winona Wheeler" <wwheeler@mailinator.com>, "Matt Dyce" <mdyce@mailinator.com>, "James Opp" <jopp@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
6	1048585	2	3	2025-10-21 05:16:58	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Al Zacharia" <alzacharia@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
7	1048585	2	3	2025-10-21 05:17:02	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Gonzalo Favio" <gfavio@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
8	1048585	3	21	2025-10-21 05:17:29	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Bob Barnetson" <bbarnetson@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Bob Barnetson:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Political Economy of Workplace Injury in Canada&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/3' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/3</a><br />\nUsername: bbarnetson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
9	1048585	4	22	2025-10-21 05:18:11	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Bart Beaty:<br />\n<br />\nThank you for submitting the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/4' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a><br />\nUsername: bbeaty<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
10	1048585	4	22	2025-10-21 05:18:11	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Toby Miller" <tmiller@mailinator.com>, "Ira Wagman" <awagman@mailinator.com>, "Will Straw" <wstraw@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
11	1048585	4	3	2025-10-21 05:18:21	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
12	1048585	4	3	2025-10-21 05:18:23	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>, "Toby Miller" <tmiller@mailinator.com>, "Ira Wagman" <awagman@mailinator.com>, "Will Straw" <wstraw@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "How Canadians Communicate: Contexts of Canadian Popular Culture".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
13	1048585	4	3	2025-10-21 05:18:28	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Al Zacharia" <alzacharia@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
14	1048585	4	3	2025-10-21 05:18:30	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>, "Toby Miller" <tmiller@mailinator.com>, "Ira Wagman" <awagman@mailinator.com>, "Will Straw" <wstraw@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "How Canadians Communicate: Contexts of Canadian Popular Culture".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
23	1048585	6	24	2025-10-21 05:20:35	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Greg Bobish" <gbobish@mailinator.com>, "Daryl Bullis" <dbullis@mailinator.com>, "Jenna Hecker" <jhecker@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
15	1048585	4	3	2025-10-21 05:18:37	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>, "Toby Miller" <tmiller@mailinator.com>, "Ira Wagman" <awagman@mailinator.com>, "Will Straw" <wstraw@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>The editing of your manuscript, "How Canadians Communicate: Contexts of Canadian Popular Culture," is complete. We are now sending it to production.<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
16	1048585	5	23	2025-10-21 05:19:13	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Chantal Allan" <callan@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Chantal Allan:<br />\n<br />\nThank you for submitting the manuscript, &quot;Bomb Canada and Other Unkind Remarks in the American Media&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/5' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a><br />\nUsername: callan<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
17	1048585	5	3	2025-10-21 05:19:22	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
18	1048585	5	3	2025-10-21 05:19:23	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Chantal Allan:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Bomb Canada and Other Unkind Remarks in the American Media".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
19	1048585	5	3	2025-10-21 05:19:29	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Gonzalo Favio" <gfavio@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
20	1048585	5	3	2025-10-21 05:19:30	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Chantal Allan:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Bomb Canada and Other Unkind Remarks in the American Media".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
21	1048585	5	3	2025-10-21 05:19:37	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Chantal Allan:<br><br>The editing of your manuscript, "Bomb Canada and Other Unkind Remarks in the American Media," is complete. We are now sending it to production.<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
22	1048585	6	24	2025-10-21 05:20:35	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Deborah Bernnard" <dbernnard@mailinator.com>	\N	dbuskins@mailinator.com	[JPK] Submission Acknowledgement	Deborah Bernnard:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/6' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/6</a><br />\nUsername: dbernnard<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
24	1048585	6	6	2025-10-21 05:20:50	805306372	"Minoti Inoue" <minoue@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>	\N	\N	[JPK] Editor Recommendation	<p>Daniel Barnes, David Buskins:<br><br>The recommendation regarding the submission to Public Knowledge Press, "The Information Literacy User’s Guide" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
25	1048585	7	25	2025-10-21 05:21:45	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Dietmar Kennepohl:<br />\n<br />\nThank you for submitting the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/7' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a><br />\nUsername: dkennepohl<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
26	1048585	7	25	2025-10-21 05:21:45	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Terry Anderson" <tanderson@mailinator.com>, "Paul Gorsky" <pgorsky@mailinator.com>, "Gale Parchoma" <gparchoma@mailinator.com>, "Stuart Palmer" <spalmer@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
27	1048585	7	3	2025-10-21 05:21:56	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
28	1048585	7	3	2025-10-21 05:21:58	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>, "Terry Anderson" <tanderson@mailinator.com>, "Paul Gorsky" <pgorsky@mailinator.com>, "Gale Parchoma" <gparchoma@mailinator.com>, "Stuart Palmer" <spalmer@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Dietmar Kennepohl; Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Accessible Elements: Teaching Science Online and at a Distance".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/7">http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
29	1048585	8	3	2025-10-21 05:22:11	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Daniel Barnes:<br />\n<br />\nThank you for submitting the manuscript, &quot;Editorial&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/8' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/8</a><br />\nUsername: dbarnes<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
30	1048585	9	26	2025-10-21 05:23:00	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Fernando Perini" <fperini@mailinator.com>	\N	dbuskins@mailinator.com	[JPK] Submission Acknowledgement	Fernando Perini:<br />\n<br />\nThank you for submitting the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/9' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/9</a><br />\nUsername: fperini<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
31	1048585	9	26	2025-10-21 05:23:00	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Robin Mansell" <rmansell@mailinator.com>, "Hernan Galperin" <hgalperin@mailinator.com>, "Pablo Bello" <pbello@mailinator.com>, "Eleonora Rabinovich" <erabinovich@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
32	1048585	10	27	2025-10-21 05:23:48	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Jennifer Brower" <jbrower@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Jennifer Brower:<br />\n<br />\nThank you for submitting the manuscript, &quot;Lost Tracks: Buffalo National Park, 1909-1939&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/10' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/10</a><br />\nUsername: jbrower<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
33	1048585	11	28	2025-10-21 05:24:03	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Jonathan Locke Hart:<br />\n<br />\nThank you for submitting the manuscript, &quot;Dreamwork&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/11' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a><br />\nUsername: jlockehart<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
34	1048585	11	3	2025-10-21 05:24:12	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
35	1048585	11	3	2025-10-21 05:24:13	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Jonathan Locke Hart:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Dreamwork".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
36	1048585	11	3	2025-10-21 05:24:18	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
37	1048585	11	3	2025-10-21 05:24:21	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Gonzalo Favio" <gfavio@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
38	1048585	11	10	2025-10-21 05:24:24	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-11-18, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
39	1048585	11	12	2025-10-21 05:24:30	1073741829	"Gonzalo Favio" <gfavio@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-11-18, if not before.<br />\n<br />\nGonzalo Favio<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
40	1048585	11	3	2025-10-21 05:24:39	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Jonathan Locke Hart:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Dreamwork".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
41	1048585	12	29	2025-10-21 05:25:24	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Laurent Elder" <lelder@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Laurent Elder:<br />\n<br />\nThank you for submitting the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/12' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/12</a><br />\nUsername: lelder<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
42	1048585	12	29	2025-10-21 05:25:24	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank Tulus" <ftulus@mailinator.com>, "Raymond Hyma" <rhyma@mailinator.com>, "John Valk" <jvalk@mailinator.com>, "Khaled Fourati" <fkourati@mailinator.com>, "Jeremy de Beer" <jdebeer@mailinator.com>, "Sara Bannerman" <sbannerman@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
43	1048585	12	3	2025-10-21 05:25:35	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
44	1048585	12	3	2025-10-21 05:25:39	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
45	1048585	12	3	2025-10-21 05:25:44	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
46	1048585	12	8	2025-10-21 05:25:47	1073741829	"Paul Hudson" <phudson@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-11-18, if not before.<br />\n<br />\nPaul Hudson<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
47	1048585	13	30	2025-10-21 05:26:24	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Mohamed Ally:<br />\n<br />\nThank you for submitting the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/13' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a><br />\nUsername: mally<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
48	1048585	13	30	2025-10-21 05:26:24	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"John Traxler" <jtraxler@mailinator.com>, "Marguerite Koole" <mkoole@mailinator.com>, "Torstein Rekkedal" <trekkedal@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
49	1048585	13	3	2025-10-21 05:26:34	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
50	1048585	13	3	2025-10-21 05:26:36	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>, "John Traxler" <jtraxler@mailinator.com>, "Marguerite Koole" <mkoole@mailinator.com>, "Torstein Rekkedal" <trekkedal@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Mohamed Ally; John Traxler, Marguerite Koole, Torstein Rekkedal:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Mobile Learning: Transforming the Delivery of Education and Training".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
51	1048585	13	3	2025-10-21 05:26:41	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
52	1048585	13	3	2025-10-21 05:26:46	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Al Zacharia" <alzacharia@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
53	1048585	13	3	2025-10-21 05:26:50	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Gonzalo Favio" <gfavio@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
54	1048585	13	10	2025-10-21 05:26:53	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-11-18, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
55	1048585	13	12	2025-10-21 05:27:00	1073741829	"Gonzalo Favio" <gfavio@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-11-18, if not before.<br />\n<br />\nGonzalo Favio<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
56	1048585	13	3	2025-10-21 05:27:11	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>, "John Traxler" <jtraxler@mailinator.com>, "Marguerite Koole" <mkoole@mailinator.com>, "Torstein Rekkedal" <trekkedal@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Mohamed Ally; John Traxler, Marguerite Koole, Torstein Rekkedal:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "Mobile Learning: Transforming the Delivery of Education and Training".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
57	1048585	14	31	2025-10-21 05:27:52	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Michael Dawson:<br />\n<br />\nThank you for submitting the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/14' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a><br />\nUsername: mdawson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
58	1048585	14	31	2025-10-21 05:27:52	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Brian Dupuis" <bdupuis@mailinator.com>, "Michael Wilson" <mwilson@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
59	1048585	14	3	2025-10-21 05:28:04	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
60	1048585	14	3	2025-10-21 05:28:06	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>, "Brian Dupuis" <bdupuis@mailinator.com>, "Michael Wilson" <mwilson@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
61	1048585	14	3	2025-10-21 05:28:12	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Al Zacharia" <alzacharia@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
62	1048585	14	3	2025-10-21 05:28:14	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>, "Brian Dupuis" <bdupuis@mailinator.com>, "Michael Wilson" <mwilson@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, "From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots".<br><br>Our decision is to:<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
63	1048585	14	3	2025-10-21 05:28:21	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>, "Brian Dupuis" <bdupuis@mailinator.com>, "Michael Wilson" <mwilson@mailinator.com>	\N	\N	[JPK] Editor Decision	<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>The editing of your manuscript, "From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots," is complete. We are now sending it to production.<br><br>Manuscript URL: <a class="submissionUrl-style-class" href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
64	1048585	15	32	2025-10-21 05:29:23	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Max Foran" <mforan@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Max Foran:<br />\n<br />\nThank you for submitting the manuscript, &quot;Expansive Discourses: Urban Sprawl in Calgary, 1945-1978&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/15' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/15</a><br />\nUsername: mforan<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
65	1048585	16	33	2025-10-21 05:29:55	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Michael Power" <mpower@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Michael Power:<br />\n<br />\nThank you for submitting the manuscript, &quot;A Designer's Log: Case Studies in Instructional Design&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/16' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/16</a><br />\nUsername: mpower<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
66	1048585	16	3	2025-10-21 05:30:05	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
67	1048585	16	3	2025-10-21 05:30:09	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Al Zacharia" <alzacharia@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
68	1048585	16	3	2025-10-21 05:30:13	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Gonzalo Favio" <gfavio@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
69	1048585	16	10	2025-10-21 05:30:16	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>	\N	\N	[JPK] Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer's Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-11-18, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
70	1048585	17	34	2025-10-21 05:31:25	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Matthew Smith" <msmith@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Matthew Smith:<br />\n<br />\nThank you for submitting the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href='http://localhost/index.php/publicknowledge/authorDashboard/submission/17' class='submissionUrl-style-class'>http://localhost/index.php/publicknowledge/authorDashboard/submission/17</a><br />\nUsername: msmith<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
71	1048585	17	34	2025-10-21 05:31:25	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Yochai Benkler" <ybenkler@mailinator.com>, "Katherine Reilly" <kreilly@mailinator.com>, "Melissa Loudon" <mloudon@mailinator.com>, "Ulrike Rivett" <urivett@mailinator.com>, "Mark Graham" <mgraham@mailinator.com>, "Håvard Haarstad" <hhaarstad@mailinator.com>, "Marshall Smith" <masmith@mailinator.com>	\N	\N	[JPK] Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
72	1048585	17	3	2025-10-21 05:31:39	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
73	1048585	17	3	2025-10-21 05:31:44	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[JPK] Manuscript Review Request	<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-11-18 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-11-18.<br><br>Submission URL: <a href='http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17' class='submissionReviewUrl-style-class'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
\.


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
1	19
2	12
3	19
4	20
6	11
7	12
8	21
9	22
11	9
12	22
13	11
14	22
15	22
16	23
17	8
18	23
19	12
20	23
21	23
22	24
24	3
24	4
25	25
27	10
28	25
29	3
30	26
32	27
33	28
34	9
35	28
36	10
37	12
38	3
39	3
40	28
41	29
43	7
44	8
45	9
46	3
47	30
49	8
50	30
51	10
52	11
53	12
54	3
55	3
56	30
57	31
59	7
60	31
61	11
62	31
63	31
64	32
65	33
66	10
67	11
68	12
69	3
70	34
72	7
73	8
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates (email_id, email_key, context_id, enabled) FROM stdin;
\.


--
-- Data for Name: email_templates_default; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_default (email_id, email_key, can_disable, can_edit, from_role_id, to_role_id, stage_id) FROM stdin;
1	NOTIFICATION	0	1	\N	\N	\N
2	NOTIFICATION_CENTER_DEFAULT	0	1	\N	\N	\N
3	PASSWORD_RESET_CONFIRM	0	1	\N	\N	\N
4	USER_REGISTER	0	1	\N	\N	\N
5	USER_VALIDATE	0	1	\N	\N	\N
6	REVIEWER_REGISTER	0	1	\N	\N	\N
7	PUBLISH_NOTIFY	0	1	\N	\N	\N
8	SUBMISSION_ACK	1	1	\N	65536	1
9	SUBMISSION_ACK_NOT_USER	1	1	\N	65536	1
10	EDITOR_ASSIGN	1	1	16	16	1
11	REVIEW_CANCEL	1	1	16	4096	3
12	REVIEW_REINSTATE	1	1	16	4096	3
13	REVIEW_REQUEST	1	1	16	4096	3
14	REVIEW_REQUEST_ONECLICK	1	1	16	4096	3
15	REVIEW_REQUEST_REMIND_AUTO	0	1	\N	4096	3
16	REVIEW_REQUEST_REMIND_AUTO_ONECLICK	0	1	\N	4096	3
17	REVIEW_REQUEST_ATTACHED	0	1	16	4096	3
18	REVIEW_CONFIRM	1	1	4096	16	3
19	REVIEW_DECLINE	1	1	4096	16	3
20	REVIEW_ACK	1	1	16	4096	3
21	REVIEW_REMIND	0	1	16	4096	3
22	REVIEW_REMIND_AUTO	0	1	\N	4096	3
23	REVIEW_REMIND_ONECLICK	0	1	16	4096	3
24	REVIEW_REMIND_AUTO_ONECLICK	0	1	\N	4096	3
25	EDITOR_DECISION_ACCEPT	0	1	16	65536	3
26	EDITOR_DECISION_SEND_TO_EXTERNAL	0	1	16	65536	3
27	EDITOR_DECISION_SEND_TO_PRODUCTION	0	1	16	65536	5
28	EDITOR_DECISION_REVISIONS	0	1	16	65536	3
29	EDITOR_DECISION_RESUBMIT	0	1	16	65536	3
30	EDITOR_DECISION_DECLINE	0	1	16	65536	3
31	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536	1
32	EDITOR_RECOMMENDATION	0	1	16	16	3
33	COPYEDIT_REQUEST	1	1	16	4097	4
34	LAYOUT_REQUEST	1	1	16	4097	5
35	LAYOUT_COMPLETE	1	1	4097	16	5
36	INDEX_REQUEST	1	1	16	4097	5
37	INDEX_COMPLETE	1	1	4097	16	5
38	EMAIL_LINK	0	1	1048576	\N	\N
39	STATISTICS_REPORT_NOTIFICATION	1	1	16	17	\N
40	ANNOUNCEMENT	0	1	16	1048576	\N
41	MANUAL_PAYMENT_NOTIFICATION	0	1	\N	\N	\N
42	PAYPAL_INVESTIGATE_PAYMENT	0	1	\N	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$principalContactSignature}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$contextName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
USER_REGISTER	en_US	Press Registration	{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE	en_US	Validate Your Account	{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
REVIEWER_REGISTER	en_US	Registration as Reviewer with {$contextName}	In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you'll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.
PUBLISH_NOTIFY	en_US	New Book Published	Readers:<br />\n<br />\n{$contextName} has just published its latest book at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Editor's User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.
EDITOR_ASSIGN	en_US	Editorial Assignment	{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,	This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.
REVIEW_CANCEL	en_US	Request for Review Cancelled	{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
REVIEW_REINSTATE	en_US	Request for Review Reinstated	{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal's review process.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
REVIEW_REQUEST	en_US	Manuscript Review Request	Dear {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n	This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)
NOTIFICATION_CENTER_DEFAULT	fr_CA	Un message à propos de la presse {$contextName}	Veuillez saisir votre message.	Le message (vierge) par défaut utilisé par le centre d'alerte.
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
ANNOUNCEMENT	en_US	{$title}	<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href="{$url}">full announcement</a>.	This email is sent when a new announcement is created.
MANUAL_PAYMENT_NOTIFICATION	en_US	Manual Payment Notification	A manual payment needs to be processed for the press {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.	This email template is used to notify a press manager contact that a manual payment was requested.
PAYPAL_INVESTIGATE_PAYMENT	en_US	Unusual PayPal Activity	Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n	This email template is used to notify the press' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.
NOTIFICATION	fr_CA	Nouvelle notification de {$siteTitle}	Vous avez reçu une nouvelle notification de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs qui ont demandé qu'on leur envoie ce type de notification par courriel.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de réinitialisation du mot de passe	Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé à un utilisateur lorsqu'il a indiqué avoir oublié son mot de passe ou être incapable d'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.
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
1	1048585	1	19	2025-10-21 05:15:29	268435458	submission.event.general.metadataUpdated	0
2	1048585	1	19	2025-10-21 05:15:29	268435458	submission.event.general.metadataUpdated	0
3	515	1	19	2025-10-21 05:15:29	1342177281	submission.event.fileUploaded	0
4	1048585	1	19	2025-10-21 05:15:29	1342177288	submission.event.fileRevised	0
5	515	1	19	2025-10-21 05:15:30	1342177296	submission.event.fileEdited	0
6	1048585	1	19	2025-10-21 05:15:30	1342177296	submission.event.fileEdited	0
7	1048585	1	19	2025-10-21 05:15:41	268435458	submission.event.general.metadataUpdated	0
8	1048585	1	19	2025-10-21 05:15:42	268435457	submission.event.submissionSubmitted	0
9	1048585	1	3	2025-10-21 05:15:46	805306371	log.editor.decision	0
10	515	2	3	2025-10-21 05:15:46	1342177281	submission.event.fileUploaded	0
11	1048585	1	3	2025-10-21 05:15:46	1342177288	submission.event.fileRevised	0
12	1048585	1	3	2025-10-21 05:15:50	1073741825	log.review.reviewerAssigned	0
13	1048585	1	3	2025-10-21 05:15:52	805306371	log.editor.decision	0
14	1048585	1	3	2025-10-21 05:15:55	268435459	submission.event.participantAdded	0
15	1048585	2	20	2025-10-21 05:16:02	268435458	submission.event.general.metadataUpdated	0
16	1048585	2	20	2025-10-21 05:16:02	268435458	submission.event.general.metadataUpdated	0
17	515	3	20	2025-10-21 05:16:02	1342177281	submission.event.fileUploaded	0
18	1048585	2	20	2025-10-21 05:16:02	1342177288	submission.event.fileRevised	0
19	515	3	20	2025-10-21 05:16:03	1342177296	submission.event.fileEdited	0
20	1048585	2	20	2025-10-21 05:16:03	1342177296	submission.event.fileEdited	0
21	515	4	20	2025-10-21 05:16:03	1342177281	submission.event.fileUploaded	0
22	1048585	2	20	2025-10-21 05:16:03	1342177288	submission.event.fileRevised	0
23	515	4	20	2025-10-21 05:16:03	1342177296	submission.event.fileEdited	0
24	1048585	2	20	2025-10-21 05:16:03	1342177296	submission.event.fileEdited	0
25	515	5	20	2025-10-21 05:16:03	1342177281	submission.event.fileUploaded	0
26	1048585	2	20	2025-10-21 05:16:03	1342177288	submission.event.fileRevised	0
27	515	5	20	2025-10-21 05:16:03	1342177296	submission.event.fileEdited	0
28	1048585	2	20	2025-10-21 05:16:03	1342177296	submission.event.fileEdited	0
29	515	6	20	2025-10-21 05:16:03	1342177281	submission.event.fileUploaded	0
30	1048585	2	20	2025-10-21 05:16:03	1342177288	submission.event.fileRevised	0
31	515	6	20	2025-10-21 05:16:04	1342177296	submission.event.fileEdited	0
32	1048585	2	20	2025-10-21 05:16:04	1342177296	submission.event.fileEdited	0
33	1048585	2	20	2025-10-21 05:16:06	268435458	submission.event.general.metadataUpdated	0
34	1048585	2	20	2025-10-21 05:16:09	268435458	submission.event.general.metadataUpdated	0
35	1048585	2	20	2025-10-21 05:16:11	268435458	submission.event.general.metadataUpdated	0
36	1048585	2	20	2025-10-21 05:16:13	268435458	submission.event.general.metadataUpdated	0
37	1048585	2	20	2025-10-21 05:16:16	268435458	submission.event.general.metadataUpdated	0
38	1048585	2	20	2025-10-21 05:16:18	268435458	submission.event.general.metadataUpdated	0
39	1048585	2	20	2025-10-21 05:16:21	268435458	submission.event.general.metadataUpdated	0
40	1048585	2	20	2025-10-21 05:16:46	268435458	submission.event.general.metadataUpdated	0
41	1048585	2	20	2025-10-21 05:16:47	268435457	submission.event.submissionSubmitted	0
42	1048585	2	3	2025-10-21 05:16:52	805306371	log.editor.decision	0
43	515	7	3	2025-10-21 05:16:52	1342177281	submission.event.fileUploaded	0
44	1048585	2	3	2025-10-21 05:16:52	1342177288	submission.event.fileRevised	0
45	515	8	3	2025-10-21 05:16:52	1342177281	submission.event.fileUploaded	0
46	1048585	2	3	2025-10-21 05:16:52	1342177288	submission.event.fileRevised	0
47	515	9	3	2025-10-21 05:16:52	1342177281	submission.event.fileUploaded	0
48	1048585	2	3	2025-10-21 05:16:52	1342177288	submission.event.fileRevised	0
49	515	10	3	2025-10-21 05:16:52	1342177281	submission.event.fileUploaded	0
50	1048585	2	3	2025-10-21 05:16:52	1342177288	submission.event.fileRevised	0
51	1048585	2	3	2025-10-21 05:16:58	1073741825	log.review.reviewerAssigned	0
52	1048585	2	3	2025-10-21 05:17:02	1073741825	log.review.reviewerAssigned	0
53	1048585	3	21	2025-10-21 05:17:09	268435458	submission.event.general.metadataUpdated	0
54	1048585	3	21	2025-10-21 05:17:09	268435458	submission.event.general.metadataUpdated	0
55	515	11	21	2025-10-21 05:17:09	1342177281	submission.event.fileUploaded	0
56	1048585	3	21	2025-10-21 05:17:09	1342177288	submission.event.fileRevised	0
57	515	11	21	2025-10-21 05:17:09	1342177296	submission.event.fileEdited	0
58	1048585	3	21	2025-10-21 05:17:10	1342177296	submission.event.fileEdited	0
59	1048585	3	21	2025-10-21 05:17:29	268435458	submission.event.general.metadataUpdated	0
60	1048585	3	21	2025-10-21 05:17:29	268435457	submission.event.submissionSubmitted	0
61	1048585	4	22	2025-10-21 05:17:35	268435458	submission.event.general.metadataUpdated	0
62	1048585	4	22	2025-10-21 05:17:35	268435458	submission.event.general.metadataUpdated	0
63	515	12	22	2025-10-21 05:17:36	1342177281	submission.event.fileUploaded	0
64	1048585	4	22	2025-10-21 05:17:36	1342177288	submission.event.fileRevised	0
65	515	12	22	2025-10-21 05:17:36	1342177296	submission.event.fileEdited	0
66	1048585	4	22	2025-10-21 05:17:36	1342177296	submission.event.fileEdited	0
67	515	13	22	2025-10-21 05:17:36	1342177281	submission.event.fileUploaded	0
68	1048585	4	22	2025-10-21 05:17:36	1342177288	submission.event.fileRevised	0
69	515	13	22	2025-10-21 05:17:36	1342177296	submission.event.fileEdited	0
70	1048585	4	22	2025-10-21 05:17:37	1342177296	submission.event.fileEdited	0
71	515	14	22	2025-10-21 05:17:37	1342177281	submission.event.fileUploaded	0
72	1048585	4	22	2025-10-21 05:17:37	1342177288	submission.event.fileRevised	0
73	515	14	22	2025-10-21 05:17:37	1342177296	submission.event.fileEdited	0
74	1048585	4	22	2025-10-21 05:17:37	1342177296	submission.event.fileEdited	0
75	515	15	22	2025-10-21 05:17:37	1342177281	submission.event.fileUploaded	0
76	1048585	4	22	2025-10-21 05:17:37	1342177288	submission.event.fileRevised	0
77	515	15	22	2025-10-21 05:17:37	1342177296	submission.event.fileEdited	0
78	1048585	4	22	2025-10-21 05:17:37	1342177296	submission.event.fileEdited	0
79	1048585	4	22	2025-10-21 05:17:40	268435458	submission.event.general.metadataUpdated	0
80	1048585	4	22	2025-10-21 05:17:43	268435458	submission.event.general.metadataUpdated	0
81	1048585	4	22	2025-10-21 05:17:46	268435458	submission.event.general.metadataUpdated	0
82	1048585	4	22	2025-10-21 05:18:10	268435458	submission.event.general.metadataUpdated	0
83	1048585	4	22	2025-10-21 05:18:11	268435457	submission.event.submissionSubmitted	0
84	1048585	4	3	2025-10-21 05:18:15	805306371	log.editor.decision	0
85	515	16	3	2025-10-21 05:18:15	1342177281	submission.event.fileUploaded	0
86	1048585	4	3	2025-10-21 05:18:15	1342177288	submission.event.fileRevised	0
87	515	17	3	2025-10-21 05:18:15	1342177281	submission.event.fileUploaded	0
88	1048585	4	3	2025-10-21 05:18:15	1342177288	submission.event.fileRevised	0
89	515	18	3	2025-10-21 05:18:15	1342177281	submission.event.fileUploaded	0
90	1048585	4	3	2025-10-21 05:18:15	1342177288	submission.event.fileRevised	0
91	515	19	3	2025-10-21 05:18:15	1342177281	submission.event.fileUploaded	0
92	1048585	4	3	2025-10-21 05:18:15	1342177288	submission.event.fileRevised	0
93	1048585	4	3	2025-10-21 05:18:21	1073741825	log.review.reviewerAssigned	0
94	1048585	4	3	2025-10-21 05:18:23	805306371	log.editor.decision	0
95	1048585	4	3	2025-10-21 05:18:28	1073741825	log.review.reviewerAssigned	0
96	1048585	4	3	2025-10-21 05:18:30	805306371	log.editor.decision	0
97	1048585	4	3	2025-10-21 05:18:35	268435459	submission.event.participantAdded	0
98	1048585	4	3	2025-10-21 05:18:37	805306371	log.editor.decision	0
99	1048585	4	3	2025-10-21 05:18:42	268435459	submission.event.participantAdded	0
100	1048585	5	23	2025-10-21 05:18:48	268435458	submission.event.general.metadataUpdated	0
101	1048585	5	23	2025-10-21 05:18:48	268435458	submission.event.general.metadataUpdated	0
102	515	20	23	2025-10-21 05:18:49	1342177281	submission.event.fileUploaded	0
103	1048585	5	23	2025-10-21 05:18:49	1342177288	submission.event.fileRevised	0
104	515	20	23	2025-10-21 05:18:49	1342177296	submission.event.fileEdited	0
105	1048585	5	23	2025-10-21 05:18:49	1342177296	submission.event.fileEdited	0
106	1048585	5	23	2025-10-21 05:19:12	268435458	submission.event.general.metadataUpdated	0
107	1048585	5	23	2025-10-21 05:19:13	268435457	submission.event.submissionSubmitted	0
108	1048585	5	3	2025-10-21 05:19:17	805306371	log.editor.decision	0
109	1048585	5	3	2025-10-21 05:19:22	1073741825	log.review.reviewerAssigned	0
110	1048585	5	3	2025-10-21 05:19:23	805306371	log.editor.decision	0
111	1048585	5	3	2025-10-21 05:19:29	1073741825	log.review.reviewerAssigned	0
112	1048585	5	3	2025-10-21 05:19:30	805306371	log.editor.decision	0
113	1048585	5	3	2025-10-21 05:19:34	268435459	submission.event.participantAdded	0
114	1048585	5	3	2025-10-21 05:19:37	805306371	log.editor.decision	0
115	1048585	5	3	2025-10-21 05:19:41	268435459	submission.event.participantAdded	0
116	1048585	5	3	2025-10-21 05:19:44	268435459	submission.event.participantAdded	0
117	1048585	5	3	2025-10-21 05:19:47	268435474	submission.event.publicationFormatCreated	0
118	515	21	3	2025-10-21 05:19:49	1342177281	submission.event.fileUploaded	0
119	1048585	5	3	2025-10-21 05:19:49	1342177288	submission.event.fileRevised	0
120	1048585	5	3	2025-10-21 05:19:51	268435464	submission.event.publicationFormatPublished	0
121	1048585	5	3	2025-10-21 05:19:52	268435476	submission.event.publicationFormatMadeAvailable	0
122	515	21	3	2025-10-21 05:19:53	1342177296	submission.event.fileEdited	0
123	1048585	5	3	2025-10-21 05:19:53	1342177296	submission.event.fileEdited	0
124	515	21	3	2025-10-21 05:19:53	1342177287	submission.event.signoffSignoff	0
125	1048585	5	3	2025-10-21 05:19:57	268435462	publication.event.published	0
126	1048585	6	24	2025-10-21 05:20:02	268435458	submission.event.general.metadataUpdated	0
127	1048585	6	24	2025-10-21 05:20:02	268435458	submission.event.general.metadataUpdated	0
128	515	22	24	2025-10-21 05:20:03	1342177281	submission.event.fileUploaded	0
129	1048585	6	24	2025-10-21 05:20:03	1342177288	submission.event.fileRevised	0
130	515	22	24	2025-10-21 05:20:03	1342177296	submission.event.fileEdited	0
131	1048585	6	24	2025-10-21 05:20:03	1342177296	submission.event.fileEdited	0
132	515	23	24	2025-10-21 05:20:03	1342177281	submission.event.fileUploaded	0
133	1048585	6	24	2025-10-21 05:20:03	1342177288	submission.event.fileRevised	0
134	515	23	24	2025-10-21 05:20:04	1342177296	submission.event.fileEdited	0
135	1048585	6	24	2025-10-21 05:20:04	1342177296	submission.event.fileEdited	0
136	515	24	24	2025-10-21 05:20:04	1342177281	submission.event.fileUploaded	0
137	1048585	6	24	2025-10-21 05:20:04	1342177288	submission.event.fileRevised	0
138	515	24	24	2025-10-21 05:20:04	1342177296	submission.event.fileEdited	0
139	1048585	6	24	2025-10-21 05:20:04	1342177296	submission.event.fileEdited	0
140	515	25	24	2025-10-21 05:20:04	1342177281	submission.event.fileUploaded	0
141	1048585	6	24	2025-10-21 05:20:04	1342177288	submission.event.fileRevised	0
142	515	25	24	2025-10-21 05:20:04	1342177296	submission.event.fileEdited	0
143	1048585	6	24	2025-10-21 05:20:04	1342177296	submission.event.fileEdited	0
144	1048585	6	24	2025-10-21 05:20:07	268435458	submission.event.general.metadataUpdated	0
145	1048585	6	24	2025-10-21 05:20:10	268435458	submission.event.general.metadataUpdated	0
146	1048585	6	24	2025-10-21 05:20:12	268435458	submission.event.general.metadataUpdated	0
147	1048585	6	24	2025-10-21 05:20:34	268435458	submission.event.general.metadataUpdated	0
148	1048585	6	24	2025-10-21 05:20:35	268435457	submission.event.submissionSubmitted	0
149	1048585	6	3	2025-10-21 05:20:40	805306371	log.editor.decision	0
150	515	26	3	2025-10-21 05:20:40	1342177281	submission.event.fileUploaded	0
151	1048585	6	3	2025-10-21 05:20:40	1342177288	submission.event.fileRevised	0
152	515	27	3	2025-10-21 05:20:40	1342177281	submission.event.fileUploaded	0
153	1048585	6	3	2025-10-21 05:20:40	1342177288	submission.event.fileRevised	0
154	515	28	3	2025-10-21 05:20:40	1342177281	submission.event.fileUploaded	0
155	1048585	6	3	2025-10-21 05:20:40	1342177288	submission.event.fileRevised	0
156	515	29	3	2025-10-21 05:20:40	1342177281	submission.event.fileUploaded	0
157	1048585	6	3	2025-10-21 05:20:40	1342177288	submission.event.fileRevised	0
158	1048585	6	3	2025-10-21 05:20:44	268435459	submission.event.participantAdded	0
159	1048585	6	6	2025-10-21 05:20:50	805306372	log.editor.recommendation	0
160	1048585	7	25	2025-10-21 05:21:00	268435458	submission.event.general.metadataUpdated	0
161	1048585	7	25	2025-10-21 05:21:00	268435458	submission.event.general.metadataUpdated	0
162	515	30	25	2025-10-21 05:21:01	1342177281	submission.event.fileUploaded	0
163	1048585	7	25	2025-10-21 05:21:01	1342177288	submission.event.fileRevised	0
164	515	30	25	2025-10-21 05:21:01	1342177296	submission.event.fileEdited	0
165	1048585	7	25	2025-10-21 05:21:01	1342177296	submission.event.fileEdited	0
166	515	31	25	2025-10-21 05:21:01	1342177281	submission.event.fileUploaded	0
167	1048585	7	25	2025-10-21 05:21:01	1342177288	submission.event.fileRevised	0
168	515	31	25	2025-10-21 05:21:02	1342177296	submission.event.fileEdited	0
169	1048585	7	25	2025-10-21 05:21:02	1342177296	submission.event.fileEdited	0
170	515	32	25	2025-10-21 05:21:02	1342177281	submission.event.fileUploaded	0
171	1048585	7	25	2025-10-21 05:21:02	1342177288	submission.event.fileRevised	0
172	515	32	25	2025-10-21 05:21:02	1342177296	submission.event.fileEdited	0
173	1048585	7	25	2025-10-21 05:21:02	1342177296	submission.event.fileEdited	0
174	515	33	25	2025-10-21 05:21:02	1342177281	submission.event.fileUploaded	0
175	1048585	7	25	2025-10-21 05:21:02	1342177288	submission.event.fileRevised	0
176	515	33	25	2025-10-21 05:21:02	1342177296	submission.event.fileEdited	0
177	1048585	7	25	2025-10-21 05:21:02	1342177296	submission.event.fileEdited	0
178	515	34	25	2025-10-21 05:21:02	1342177281	submission.event.fileUploaded	0
179	1048585	7	25	2025-10-21 05:21:02	1342177288	submission.event.fileRevised	0
180	515	34	25	2025-10-21 05:21:03	1342177296	submission.event.fileEdited	0
181	1048585	7	25	2025-10-21 05:21:03	1342177296	submission.event.fileEdited	0
182	1048585	7	25	2025-10-21 05:21:06	268435458	submission.event.general.metadataUpdated	0
183	1048585	7	25	2025-10-21 05:21:08	268435458	submission.event.general.metadataUpdated	0
184	1048585	7	25	2025-10-21 05:21:11	268435458	submission.event.general.metadataUpdated	0
185	1048585	7	25	2025-10-21 05:21:13	268435458	submission.event.general.metadataUpdated	0
186	1048585	7	25	2025-10-21 05:21:44	268435458	submission.event.general.metadataUpdated	0
187	1048585	7	25	2025-10-21 05:21:45	268435457	submission.event.submissionSubmitted	0
188	1048585	7	3	2025-10-21 05:21:50	805306371	log.editor.decision	0
189	515	35	3	2025-10-21 05:21:50	1342177281	submission.event.fileUploaded	0
190	1048585	7	3	2025-10-21 05:21:50	1342177288	submission.event.fileRevised	0
191	515	36	3	2025-10-21 05:21:50	1342177281	submission.event.fileUploaded	0
192	1048585	7	3	2025-10-21 05:21:50	1342177288	submission.event.fileRevised	0
193	515	37	3	2025-10-21 05:21:50	1342177281	submission.event.fileUploaded	0
194	1048585	7	3	2025-10-21 05:21:50	1342177288	submission.event.fileRevised	0
195	515	38	3	2025-10-21 05:21:50	1342177281	submission.event.fileUploaded	0
196	1048585	7	3	2025-10-21 05:21:50	1342177288	submission.event.fileRevised	0
197	515	39	3	2025-10-21 05:21:50	1342177281	submission.event.fileUploaded	0
198	1048585	7	3	2025-10-21 05:21:50	1342177288	submission.event.fileRevised	0
199	1048585	7	3	2025-10-21 05:21:56	1073741825	log.review.reviewerAssigned	0
200	1048585	7	3	2025-10-21 05:21:58	805306371	log.editor.decision	0
201	1048585	7	3	2025-10-21 05:22:03	268435459	submission.event.participantAdded	0
202	1048585	8	3	2025-10-21 05:22:08	268435458	submission.event.general.metadataUpdated	0
203	1048585	8	3	2025-10-21 05:22:08	268435458	submission.event.general.metadataUpdated	0
204	515	40	3	2025-10-21 05:22:09	1342177281	submission.event.fileUploaded	0
205	1048585	8	3	2025-10-21 05:22:09	1342177288	submission.event.fileRevised	0
206	515	40	3	2025-10-21 05:22:09	1342177296	submission.event.fileEdited	0
207	1048585	8	3	2025-10-21 05:22:09	1342177296	submission.event.fileEdited	0
208	1048585	8	3	2025-10-21 05:22:10	268435458	submission.event.general.metadataUpdated	0
209	1048585	8	3	2025-10-21 05:22:11	268435457	submission.event.submissionSubmitted	0
210	1048585	9	26	2025-10-21 05:22:16	268435458	submission.event.general.metadataUpdated	0
211	1048585	9	26	2025-10-21 05:22:16	268435458	submission.event.general.metadataUpdated	0
212	515	41	26	2025-10-21 05:22:17	1342177281	submission.event.fileUploaded	0
213	1048585	9	26	2025-10-21 05:22:17	1342177288	submission.event.fileRevised	0
214	515	41	26	2025-10-21 05:22:17	1342177296	submission.event.fileEdited	0
215	1048585	9	26	2025-10-21 05:22:17	1342177296	submission.event.fileEdited	0
216	515	42	26	2025-10-21 05:22:17	1342177281	submission.event.fileUploaded	0
217	1048585	9	26	2025-10-21 05:22:17	1342177288	submission.event.fileRevised	0
218	515	42	26	2025-10-21 05:22:17	1342177296	submission.event.fileEdited	0
219	1048585	9	26	2025-10-21 05:22:18	1342177296	submission.event.fileEdited	0
220	515	43	26	2025-10-21 05:22:18	1342177281	submission.event.fileUploaded	0
221	1048585	9	26	2025-10-21 05:22:18	1342177288	submission.event.fileRevised	0
222	515	43	26	2025-10-21 05:22:18	1342177296	submission.event.fileEdited	0
223	1048585	9	26	2025-10-21 05:22:18	1342177296	submission.event.fileEdited	0
224	515	44	26	2025-10-21 05:22:18	1342177281	submission.event.fileUploaded	0
225	1048585	9	26	2025-10-21 05:22:18	1342177288	submission.event.fileRevised	0
226	515	44	26	2025-10-21 05:22:18	1342177296	submission.event.fileEdited	0
227	1048585	9	26	2025-10-21 05:22:18	1342177296	submission.event.fileEdited	0
228	515	45	26	2025-10-21 05:22:18	1342177281	submission.event.fileUploaded	0
229	1048585	9	26	2025-10-21 05:22:18	1342177288	submission.event.fileRevised	0
230	515	45	26	2025-10-21 05:22:19	1342177296	submission.event.fileEdited	0
231	1048585	9	26	2025-10-21 05:22:19	1342177296	submission.event.fileEdited	0
232	1048585	9	26	2025-10-21 05:22:22	268435458	submission.event.general.metadataUpdated	0
233	1048585	9	26	2025-10-21 05:22:24	268435458	submission.event.general.metadataUpdated	0
234	1048585	9	26	2025-10-21 05:22:26	268435458	submission.event.general.metadataUpdated	0
235	1048585	9	26	2025-10-21 05:22:29	268435458	submission.event.general.metadataUpdated	0
236	1048585	9	26	2025-10-21 05:22:58	268435458	submission.event.general.metadataUpdated	0
237	1048585	9	26	2025-10-21 05:23:00	268435457	submission.event.submissionSubmitted	0
238	1048585	9	3	2025-10-21 05:23:05	805306371	log.editor.decision	0
239	515	46	3	2025-10-21 05:23:05	1342177281	submission.event.fileUploaded	0
240	1048585	9	3	2025-10-21 05:23:05	1342177288	submission.event.fileRevised	0
241	515	47	3	2025-10-21 05:23:05	1342177281	submission.event.fileUploaded	0
242	1048585	9	3	2025-10-21 05:23:05	1342177288	submission.event.fileRevised	0
243	515	48	3	2025-10-21 05:23:05	1342177281	submission.event.fileUploaded	0
244	1048585	9	3	2025-10-21 05:23:05	1342177288	submission.event.fileRevised	0
245	515	49	3	2025-10-21 05:23:05	1342177281	submission.event.fileUploaded	0
246	1048585	9	3	2025-10-21 05:23:05	1342177288	submission.event.fileRevised	0
247	515	50	3	2025-10-21 05:23:05	1342177281	submission.event.fileUploaded	0
248	1048585	9	3	2025-10-21 05:23:05	1342177288	submission.event.fileRevised	0
249	1048585	10	27	2025-10-21 05:23:13	268435458	submission.event.general.metadataUpdated	0
250	1048585	10	27	2025-10-21 05:23:13	268435458	submission.event.general.metadataUpdated	0
251	515	51	27	2025-10-21 05:23:13	1342177281	submission.event.fileUploaded	0
252	1048585	10	27	2025-10-21 05:23:13	1342177288	submission.event.fileRevised	0
253	515	51	27	2025-10-21 05:23:14	1342177296	submission.event.fileEdited	0
254	1048585	10	27	2025-10-21 05:23:14	1342177296	submission.event.fileEdited	0
255	1048585	10	27	2025-10-21 05:23:47	268435458	submission.event.general.metadataUpdated	0
256	1048585	10	27	2025-10-21 05:23:48	268435457	submission.event.submissionSubmitted	0
257	1048585	11	28	2025-10-21 05:23:54	268435458	submission.event.general.metadataUpdated	0
258	1048585	11	28	2025-10-21 05:23:54	268435458	submission.event.general.metadataUpdated	0
259	515	52	28	2025-10-21 05:23:54	1342177281	submission.event.fileUploaded	0
260	1048585	11	28	2025-10-21 05:23:54	1342177288	submission.event.fileRevised	0
261	515	52	28	2025-10-21 05:23:55	1342177296	submission.event.fileEdited	0
262	1048585	11	28	2025-10-21 05:23:55	1342177296	submission.event.fileEdited	0
263	1048585	11	28	2025-10-21 05:24:02	268435458	submission.event.general.metadataUpdated	0
264	1048585	11	28	2025-10-21 05:24:03	268435457	submission.event.submissionSubmitted	0
265	1048585	11	3	2025-10-21 05:24:07	805306371	log.editor.decision	0
266	515	53	3	2025-10-21 05:24:07	1342177281	submission.event.fileUploaded	0
267	1048585	11	3	2025-10-21 05:24:07	1342177288	submission.event.fileRevised	0
268	1048585	11	3	2025-10-21 05:24:12	1073741825	log.review.reviewerAssigned	0
269	1048585	11	3	2025-10-21 05:24:13	805306371	log.editor.decision	0
270	1048585	11	3	2025-10-21 05:24:17	1073741825	log.review.reviewerAssigned	0
271	1048585	11	3	2025-10-21 05:24:21	1073741825	log.review.reviewerAssigned	0
272	1048585	11	10	2025-10-21 05:24:24	1073741830	log.review.reviewAccepted	0
273	1048585	11	10	2025-10-21 05:24:27	1073741848	log.review.reviewReady	0
274	1048585	11	12	2025-10-21 05:24:30	1073741830	log.review.reviewAccepted	0
275	1048585	11	12	2025-10-21 05:24:33	1073741848	log.review.reviewReady	0
276	1048585	11	3	2025-10-21 05:24:39	805306371	log.editor.decision	0
277	1048585	12	29	2025-10-21 05:24:46	268435458	submission.event.general.metadataUpdated	0
278	1048585	12	29	2025-10-21 05:24:46	268435458	submission.event.general.metadataUpdated	0
279	515	54	29	2025-10-21 05:24:47	1342177281	submission.event.fileUploaded	0
280	1048585	12	29	2025-10-21 05:24:47	1342177288	submission.event.fileRevised	0
281	515	54	29	2025-10-21 05:24:47	1342177296	submission.event.fileEdited	0
282	1048585	12	29	2025-10-21 05:24:47	1342177296	submission.event.fileEdited	0
283	515	55	29	2025-10-21 05:24:47	1342177281	submission.event.fileUploaded	0
284	1048585	12	29	2025-10-21 05:24:47	1342177288	submission.event.fileRevised	0
285	515	55	29	2025-10-21 05:24:47	1342177296	submission.event.fileEdited	0
286	1048585	12	29	2025-10-21 05:24:47	1342177296	submission.event.fileEdited	0
287	515	56	29	2025-10-21 05:24:47	1342177281	submission.event.fileUploaded	0
288	1048585	12	29	2025-10-21 05:24:47	1342177288	submission.event.fileRevised	0
289	515	56	29	2025-10-21 05:24:48	1342177296	submission.event.fileEdited	0
290	1048585	12	29	2025-10-21 05:24:48	1342177296	submission.event.fileEdited	0
291	1048585	12	29	2025-10-21 05:24:50	268435458	submission.event.general.metadataUpdated	0
292	1048585	12	29	2025-10-21 05:24:52	268435458	submission.event.general.metadataUpdated	0
293	1048585	12	29	2025-10-21 05:24:55	268435458	submission.event.general.metadataUpdated	0
294	1048585	12	29	2025-10-21 05:24:57	268435458	submission.event.general.metadataUpdated	0
295	1048585	12	29	2025-10-21 05:24:59	268435458	submission.event.general.metadataUpdated	0
296	1048585	12	29	2025-10-21 05:25:02	268435458	submission.event.general.metadataUpdated	0
297	1048585	12	29	2025-10-21 05:25:04	268435458	submission.event.general.metadataUpdated	0
298	1048585	12	29	2025-10-21 05:25:23	268435458	submission.event.general.metadataUpdated	0
299	1048585	12	29	2025-10-21 05:25:24	268435457	submission.event.submissionSubmitted	0
300	1048585	12	3	2025-10-21 05:25:30	805306371	log.editor.decision	0
301	1048585	12	3	2025-10-21 05:25:35	1073741825	log.review.reviewerAssigned	0
302	1048585	12	3	2025-10-21 05:25:39	1073741825	log.review.reviewerAssigned	0
303	1048585	12	3	2025-10-21 05:25:44	1073741825	log.review.reviewerAssigned	0
304	1048585	12	8	2025-10-21 05:25:47	1073741830	log.review.reviewAccepted	0
305	1048585	12	8	2025-10-21 05:25:50	1073741848	log.review.reviewReady	0
306	1048585	13	30	2025-10-21 05:25:56	268435458	submission.event.general.metadataUpdated	0
307	1048585	13	30	2025-10-21 05:25:56	268435458	submission.event.general.metadataUpdated	0
308	515	57	30	2025-10-21 05:25:57	1342177281	submission.event.fileUploaded	0
309	1048585	13	30	2025-10-21 05:25:57	1342177288	submission.event.fileRevised	0
310	515	57	30	2025-10-21 05:25:57	1342177296	submission.event.fileEdited	0
311	1048585	13	30	2025-10-21 05:25:57	1342177296	submission.event.fileEdited	0
312	515	58	30	2025-10-21 05:25:57	1342177281	submission.event.fileUploaded	0
313	1048585	13	30	2025-10-21 05:25:57	1342177288	submission.event.fileRevised	0
314	515	58	30	2025-10-21 05:25:58	1342177296	submission.event.fileEdited	0
315	1048585	13	30	2025-10-21 05:25:58	1342177296	submission.event.fileEdited	0
316	515	59	30	2025-10-21 05:25:58	1342177281	submission.event.fileUploaded	0
317	1048585	13	30	2025-10-21 05:25:58	1342177288	submission.event.fileRevised	0
318	515	59	30	2025-10-21 05:25:58	1342177296	submission.event.fileEdited	0
319	1048585	13	30	2025-10-21 05:25:58	1342177296	submission.event.fileEdited	0
320	1048585	13	30	2025-10-21 05:26:01	268435458	submission.event.general.metadataUpdated	0
321	1048585	13	30	2025-10-21 05:26:03	268435458	submission.event.general.metadataUpdated	0
322	1048585	13	30	2025-10-21 05:26:05	268435458	submission.event.general.metadataUpdated	0
323	1048585	13	30	2025-10-21 05:26:23	268435458	submission.event.general.metadataUpdated	0
324	1048585	13	30	2025-10-21 05:26:24	268435457	submission.event.submissionSubmitted	0
325	1048585	13	3	2025-10-21 05:26:29	805306371	log.editor.decision	0
326	1048585	13	3	2025-10-21 05:26:34	1073741825	log.review.reviewerAssigned	0
327	1048585	13	3	2025-10-21 05:26:36	805306371	log.editor.decision	0
328	1048585	13	3	2025-10-21 05:26:41	1073741825	log.review.reviewerAssigned	0
329	1048585	13	3	2025-10-21 05:26:46	1073741825	log.review.reviewerAssigned	0
330	1048585	13	3	2025-10-21 05:26:50	1073741825	log.review.reviewerAssigned	0
331	1048585	13	10	2025-10-21 05:26:53	1073741830	log.review.reviewAccepted	0
332	1048585	13	10	2025-10-21 05:26:56	1073741848	log.review.reviewReady	0
333	1048585	13	12	2025-10-21 05:27:00	1073741830	log.review.reviewAccepted	0
334	1048585	13	12	2025-10-21 05:27:03	1073741848	log.review.reviewReady	0
335	1048585	13	3	2025-10-21 05:27:11	805306371	log.editor.decision	0
336	1048585	14	31	2025-10-21 05:27:19	268435458	submission.event.general.metadataUpdated	0
337	1048585	14	31	2025-10-21 05:27:19	268435458	submission.event.general.metadataUpdated	0
338	515	60	31	2025-10-21 05:27:20	1342177281	submission.event.fileUploaded	0
339	1048585	14	31	2025-10-21 05:27:20	1342177288	submission.event.fileRevised	0
340	515	60	31	2025-10-21 05:27:20	1342177296	submission.event.fileEdited	0
341	1048585	14	31	2025-10-21 05:27:20	1342177296	submission.event.fileEdited	0
342	515	61	31	2025-10-21 05:27:21	1342177281	submission.event.fileUploaded	0
343	1048585	14	31	2025-10-21 05:27:21	1342177288	submission.event.fileRevised	0
344	515	61	31	2025-10-21 05:27:21	1342177296	submission.event.fileEdited	0
345	1048585	14	31	2025-10-21 05:27:21	1342177296	submission.event.fileEdited	0
346	515	62	31	2025-10-21 05:27:21	1342177281	submission.event.fileUploaded	0
347	1048585	14	31	2025-10-21 05:27:21	1342177288	submission.event.fileRevised	0
348	515	62	31	2025-10-21 05:27:21	1342177296	submission.event.fileEdited	0
349	1048585	14	31	2025-10-21 05:27:21	1342177296	submission.event.fileEdited	0
350	515	63	31	2025-10-21 05:27:21	1342177281	submission.event.fileUploaded	0
351	1048585	14	31	2025-10-21 05:27:21	1342177288	submission.event.fileRevised	0
352	515	63	31	2025-10-21 05:27:21	1342177296	submission.event.fileEdited	0
353	1048585	14	31	2025-10-21 05:27:21	1342177296	submission.event.fileEdited	0
354	515	64	31	2025-10-21 05:27:22	1342177281	submission.event.fileUploaded	0
355	1048585	14	31	2025-10-21 05:27:22	1342177288	submission.event.fileRevised	0
356	515	64	31	2025-10-21 05:27:22	1342177296	submission.event.fileEdited	0
357	1048585	14	31	2025-10-21 05:27:22	1342177296	submission.event.fileEdited	0
358	515	65	31	2025-10-21 05:27:22	1342177281	submission.event.fileUploaded	0
359	1048585	14	31	2025-10-21 05:27:22	1342177288	submission.event.fileRevised	0
360	515	65	31	2025-10-21 05:27:23	1342177296	submission.event.fileEdited	0
361	1048585	14	31	2025-10-21 05:27:23	1342177296	submission.event.fileEdited	0
362	1048585	14	31	2025-10-21 05:27:26	268435458	submission.event.general.metadataUpdated	0
363	1048585	14	31	2025-10-21 05:27:29	268435458	submission.event.general.metadataUpdated	0
364	1048585	14	31	2025-10-21 05:27:51	268435458	submission.event.general.metadataUpdated	0
365	1048585	14	31	2025-10-21 05:27:52	268435457	submission.event.submissionSubmitted	0
366	1048585	14	3	2025-10-21 05:27:58	805306371	log.editor.decision	0
367	515	66	3	2025-10-21 05:27:58	1342177281	submission.event.fileUploaded	0
368	1048585	14	3	2025-10-21 05:27:58	1342177288	submission.event.fileRevised	0
369	515	67	3	2025-10-21 05:27:59	1342177281	submission.event.fileUploaded	0
370	1048585	14	3	2025-10-21 05:27:59	1342177288	submission.event.fileRevised	0
371	515	68	3	2025-10-21 05:27:59	1342177281	submission.event.fileUploaded	0
372	1048585	14	3	2025-10-21 05:27:59	1342177288	submission.event.fileRevised	0
373	515	69	3	2025-10-21 05:27:59	1342177281	submission.event.fileUploaded	0
374	1048585	14	3	2025-10-21 05:27:59	1342177288	submission.event.fileRevised	0
375	515	70	3	2025-10-21 05:27:59	1342177281	submission.event.fileUploaded	0
376	1048585	14	3	2025-10-21 05:27:59	1342177288	submission.event.fileRevised	0
377	515	71	3	2025-10-21 05:27:59	1342177281	submission.event.fileUploaded	0
378	1048585	14	3	2025-10-21 05:27:59	1342177288	submission.event.fileRevised	0
379	1048585	14	3	2025-10-21 05:28:04	1073741825	log.review.reviewerAssigned	0
380	1048585	14	3	2025-10-21 05:28:06	805306371	log.editor.decision	0
381	1048585	14	3	2025-10-21 05:28:12	1073741825	log.review.reviewerAssigned	0
382	1048585	14	3	2025-10-21 05:28:13	805306371	log.editor.decision	0
383	1048585	14	3	2025-10-21 05:28:18	268435459	submission.event.participantAdded	0
384	1048585	14	3	2025-10-21 05:28:21	805306371	log.editor.decision	0
385	1048585	14	3	2025-10-21 05:28:25	268435459	submission.event.participantAdded	0
386	1048585	14	3	2025-10-21 05:28:29	268435459	submission.event.participantAdded	0
387	1048585	14	3	2025-10-21 05:28:33	268435474	submission.event.publicationFormatCreated	0
388	515	72	3	2025-10-21 05:28:37	1342177281	submission.event.fileUploaded	0
389	1048585	14	3	2025-10-21 05:28:37	1342177288	submission.event.fileRevised	0
390	515	73	3	2025-10-21 05:28:38	1342177281	submission.event.fileUploaded	0
391	1048585	14	3	2025-10-21 05:28:38	1342177288	submission.event.fileRevised	0
392	515	74	3	2025-10-21 05:28:38	1342177281	submission.event.fileUploaded	0
393	1048585	14	3	2025-10-21 05:28:38	1342177288	submission.event.fileRevised	0
394	515	75	3	2025-10-21 05:28:38	1342177281	submission.event.fileUploaded	0
395	1048585	14	3	2025-10-21 05:28:38	1342177288	submission.event.fileRevised	0
396	515	76	3	2025-10-21 05:28:38	1342177281	submission.event.fileUploaded	0
397	1048585	14	3	2025-10-21 05:28:38	1342177288	submission.event.fileRevised	0
398	515	77	3	2025-10-21 05:28:38	1342177281	submission.event.fileUploaded	0
399	1048585	14	3	2025-10-21 05:28:38	1342177288	submission.event.fileRevised	0
400	1048585	14	3	2025-10-21 05:28:39	268435464	submission.event.publicationFormatPublished	0
401	1048585	14	3	2025-10-21 05:28:41	268435476	submission.event.publicationFormatMadeAvailable	0
402	515	72	3	2025-10-21 05:28:42	1342177296	submission.event.fileEdited	0
403	1048585	14	3	2025-10-21 05:28:42	1342177296	submission.event.fileEdited	0
404	515	72	3	2025-10-21 05:28:42	1342177287	submission.event.signoffSignoff	0
405	515	73	3	2025-10-21 05:28:46	1342177296	submission.event.fileEdited	0
406	1048585	14	3	2025-10-21 05:28:46	1342177296	submission.event.fileEdited	0
407	515	73	3	2025-10-21 05:28:46	1342177287	submission.event.signoffSignoff	0
408	515	74	3	2025-10-21 05:28:49	1342177296	submission.event.fileEdited	0
409	1048585	14	3	2025-10-21 05:28:49	1342177296	submission.event.fileEdited	0
410	515	74	3	2025-10-21 05:28:49	1342177287	submission.event.signoffSignoff	0
411	515	75	3	2025-10-21 05:28:53	1342177296	submission.event.fileEdited	0
412	1048585	14	3	2025-10-21 05:28:53	1342177296	submission.event.fileEdited	0
413	515	75	3	2025-10-21 05:28:53	1342177287	submission.event.signoffSignoff	0
414	515	76	3	2025-10-21 05:28:57	1342177296	submission.event.fileEdited	0
415	1048585	14	3	2025-10-21 05:28:57	1342177296	submission.event.fileEdited	0
416	515	76	3	2025-10-21 05:28:57	1342177287	submission.event.signoffSignoff	0
417	515	77	3	2025-10-21 05:29:01	1342177296	submission.event.fileEdited	0
418	1048585	14	3	2025-10-21 05:29:01	1342177296	submission.event.fileEdited	0
419	515	77	3	2025-10-21 05:29:01	1342177287	submission.event.signoffSignoff	0
420	1048585	14	3	2025-10-21 05:29:04	268435462	publication.event.published	0
421	1048585	15	32	2025-10-21 05:29:09	268435458	submission.event.general.metadataUpdated	0
422	1048585	15	32	2025-10-21 05:29:09	268435458	submission.event.general.metadataUpdated	0
423	515	78	32	2025-10-21 05:29:10	1342177281	submission.event.fileUploaded	0
424	1048585	15	32	2025-10-21 05:29:10	1342177288	submission.event.fileRevised	0
425	515	78	32	2025-10-21 05:29:10	1342177296	submission.event.fileEdited	0
426	1048585	15	32	2025-10-21 05:29:10	1342177296	submission.event.fileEdited	0
427	1048585	15	32	2025-10-21 05:29:22	268435458	submission.event.general.metadataUpdated	0
428	1048585	15	32	2025-10-21 05:29:23	268435457	submission.event.submissionSubmitted	0
429	1048585	15	3	2025-10-21 05:29:28	805306371	log.editor.decision	0
430	1048585	16	33	2025-10-21 05:29:35	268435458	submission.event.general.metadataUpdated	0
431	1048585	16	33	2025-10-21 05:29:35	268435458	submission.event.general.metadataUpdated	0
432	515	79	33	2025-10-21 05:29:36	1342177281	submission.event.fileUploaded	0
433	1048585	16	33	2025-10-21 05:29:36	1342177288	submission.event.fileRevised	0
434	515	79	33	2025-10-21 05:29:36	1342177296	submission.event.fileEdited	0
435	1048585	16	33	2025-10-21 05:29:36	1342177296	submission.event.fileEdited	0
436	1048585	16	33	2025-10-21 05:29:54	268435458	submission.event.general.metadataUpdated	0
437	1048585	16	33	2025-10-21 05:29:55	268435457	submission.event.submissionSubmitted	0
438	1048585	16	3	2025-10-21 05:30:00	805306371	log.editor.decision	0
439	1048585	16	3	2025-10-21 05:30:05	1073741825	log.review.reviewerAssigned	0
440	1048585	16	3	2025-10-21 05:30:09	1073741825	log.review.reviewerAssigned	0
441	1048585	16	3	2025-10-21 05:30:13	1073741825	log.review.reviewerAssigned	0
442	1048585	16	10	2025-10-21 05:30:16	1073741830	log.review.reviewAccepted	0
443	1048585	16	10	2025-10-21 05:30:19	1073741848	log.review.reviewReady	0
444	1048585	17	34	2025-10-21 05:30:24	268435458	submission.event.general.metadataUpdated	0
445	1048585	17	34	2025-10-21 05:30:25	268435458	submission.event.general.metadataUpdated	0
446	515	80	34	2025-10-21 05:30:25	1342177281	submission.event.fileUploaded	0
447	1048585	17	34	2025-10-21 05:30:25	1342177288	submission.event.fileRevised	0
448	515	80	34	2025-10-21 05:30:25	1342177296	submission.event.fileEdited	0
449	1048585	17	34	2025-10-21 05:30:25	1342177296	submission.event.fileEdited	0
450	515	81	34	2025-10-21 05:30:26	1342177281	submission.event.fileUploaded	0
451	1048585	17	34	2025-10-21 05:30:26	1342177288	submission.event.fileRevised	0
452	515	81	34	2025-10-21 05:30:26	1342177296	submission.event.fileEdited	0
453	1048585	17	34	2025-10-21 05:30:26	1342177296	submission.event.fileEdited	0
454	515	82	34	2025-10-21 05:30:26	1342177281	submission.event.fileUploaded	0
455	1048585	17	34	2025-10-21 05:30:26	1342177288	submission.event.fileRevised	0
456	515	82	34	2025-10-21 05:30:26	1342177296	submission.event.fileEdited	0
457	1048585	17	34	2025-10-21 05:30:26	1342177296	submission.event.fileEdited	0
458	515	83	34	2025-10-21 05:30:26	1342177281	submission.event.fileUploaded	0
459	1048585	17	34	2025-10-21 05:30:26	1342177288	submission.event.fileRevised	0
460	515	83	34	2025-10-21 05:30:26	1342177296	submission.event.fileEdited	0
461	1048585	17	34	2025-10-21 05:30:27	1342177296	submission.event.fileEdited	0
462	515	84	34	2025-10-21 05:30:27	1342177281	submission.event.fileUploaded	0
463	1048585	17	34	2025-10-21 05:30:27	1342177288	submission.event.fileRevised	0
464	515	84	34	2025-10-21 05:30:27	1342177296	submission.event.fileEdited	0
465	1048585	17	34	2025-10-21 05:30:27	1342177296	submission.event.fileEdited	0
466	515	85	34	2025-10-21 05:30:27	1342177281	submission.event.fileUploaded	0
467	1048585	17	34	2025-10-21 05:30:27	1342177288	submission.event.fileRevised	0
468	515	85	34	2025-10-21 05:30:27	1342177296	submission.event.fileEdited	0
469	1048585	17	34	2025-10-21 05:30:27	1342177296	submission.event.fileEdited	0
470	1048585	17	34	2025-10-21 05:30:30	268435458	submission.event.general.metadataUpdated	0
471	1048585	17	34	2025-10-21 05:30:33	268435458	submission.event.general.metadataUpdated	0
472	1048585	17	34	2025-10-21 05:30:35	268435458	submission.event.general.metadataUpdated	0
473	1048585	17	34	2025-10-21 05:30:37	268435458	submission.event.general.metadataUpdated	0
474	1048585	17	34	2025-10-21 05:30:40	268435458	submission.event.general.metadataUpdated	0
475	1048585	17	34	2025-10-21 05:30:42	268435458	submission.event.general.metadataUpdated	0
476	1048585	17	34	2025-10-21 05:30:45	268435458	submission.event.general.metadataUpdated	0
477	1048585	17	34	2025-10-21 05:31:24	268435458	submission.event.general.metadataUpdated	0
478	1048585	17	34	2025-10-21 05:31:25	268435457	submission.event.submissionSubmitted	0
479	1048585	17	3	2025-10-21 05:31:33	805306371	log.editor.decision	0
480	1048585	17	3	2025-10-21 05:31:39	1073741825	log.review.reviewerAssigned	0
481	1048585	17	3	2025-10-21 05:31:44	1073741825	log.review.reviewerAssigned	0
\.


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
3	fileStage	2	int
3	sourceSubmissionFileId	\N	string
3	submissionFileId	1	int
3	fileId	1	int
3	submissionId	1	int
3	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
3	username	aclark	string
4	fileStage	2	int
4	submissionFileId	1	int
4	fileId	1	int
4	submissionId	1	int
4	username	aclark	string
4	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
5	fileStage	2	int
5	sourceSubmissionFileId	\N	string
5	submissionFileId	1	int
5	fileId	1	int
5	submissionId	1	int
5	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
5	username	aclark	string
6	fileStage	2	int
6	sourceSubmissionFileId	\N	string
6	submissionFileId	1	int
6	fileId	1	int
6	submissionId	1	int
6	username	aclark	string
6	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
6	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
9	editorName	Daniel Barnes	string
9	submissionId	1	int
9	decision	Send to External Review	string
10	fileStage	4	int
10	sourceSubmissionFileId	1	int
10	submissionFileId	2	int
10	fileId	1	int
10	submissionId	1	int
10	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
10	username	dbarnes	string
11	fileStage	4	int
11	submissionFileId	2	int
11	fileId	1	int
11	submissionId	1	int
11	username	dbarnes	string
11	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
12	reviewAssignmentId	1	string
12	reviewerName	Gonzalo Favio	string
12	submissionId	1	int
12	stageId	3	int
12	round	1	int
13	editorName	Daniel Barnes	string
13	submissionId	1	int
13	decision	Accept Submission	string
14	name	Sarah Vogt	string
14	username	svogt	string
14	userGroupName	Copyeditor	string
17	fileStage	2	int
17	sourceSubmissionFileId	\N	string
17	submissionFileId	3	int
17	fileId	2	int
17	submissionId	2	int
17	originalFileName	Critical History in Western Canada 1900–.pdf	string
17	username	afinkel	string
18	fileStage	2	int
18	submissionFileId	3	int
18	fileId	2	int
18	submissionId	2	int
18	username	afinkel	string
18	name	Critical History in Western Canada 1900–.pdf	string
19	fileStage	2	int
19	sourceSubmissionFileId	\N	string
19	submissionFileId	3	int
19	fileId	2	int
19	submissionId	2	int
19	originalFileName	Critical History in Western Canada 1900–.pdf	string
19	username	afinkel	string
20	fileStage	2	int
20	sourceSubmissionFileId	\N	string
20	submissionFileId	3	int
20	fileId	2	int
20	submissionId	2	int
20	username	afinkel	string
20	originalFileName	Critical History in Western Canada 1900–.pdf	string
20	name	Critical History in Western Canada 1900–.pdf	string
21	fileStage	2	int
21	sourceSubmissionFileId	\N	string
21	submissionFileId	4	int
21	fileId	3	int
21	submissionId	2	int
21	originalFileName	Vernacular Currents in Western Canadian .pdf	string
21	username	afinkel	string
22	fileStage	2	int
22	submissionFileId	4	int
22	fileId	3	int
22	submissionId	2	int
22	username	afinkel	string
22	name	Vernacular Currents in Western Canadian .pdf	string
23	fileStage	2	int
23	sourceSubmissionFileId	\N	string
23	submissionFileId	4	int
23	fileId	3	int
23	submissionId	2	int
23	originalFileName	Vernacular Currents in Western Canadian .pdf	string
23	username	afinkel	string
24	fileStage	2	int
24	sourceSubmissionFileId	\N	string
24	submissionFileId	4	int
24	fileId	3	int
24	submissionId	2	int
24	username	afinkel	string
24	originalFileName	Vernacular Currents in Western Canadian .pdf	string
24	name	Vernacular Currents in Western Canadian .pdf	string
25	fileStage	2	int
25	sourceSubmissionFileId	\N	string
25	submissionFileId	5	int
25	fileId	4	int
25	submissionId	2	int
25	originalFileName	Cree Intellectual Traditions in History.pdf	string
25	username	afinkel	string
26	fileStage	2	int
26	submissionFileId	5	int
26	fileId	4	int
26	submissionId	2	int
26	username	afinkel	string
26	name	Cree Intellectual Traditions in History.pdf	string
27	fileStage	2	int
27	sourceSubmissionFileId	\N	string
27	submissionFileId	5	int
27	fileId	4	int
27	submissionId	2	int
27	originalFileName	Cree Intellectual Traditions in History.pdf	string
27	username	afinkel	string
28	fileStage	2	int
28	sourceSubmissionFileId	\N	string
28	submissionFileId	5	int
28	fileId	4	int
28	submissionId	2	int
28	username	afinkel	string
28	originalFileName	Cree Intellectual Traditions in History.pdf	string
28	name	Cree Intellectual Traditions in History.pdf	string
29	fileStage	2	int
29	sourceSubmissionFileId	\N	string
29	submissionFileId	6	int
29	fileId	5	int
29	submissionId	2	int
29	originalFileName	Visualizing Space, Race, and History in .pdf	string
29	username	afinkel	string
30	fileStage	2	int
30	submissionFileId	6	int
30	fileId	5	int
30	submissionId	2	int
30	username	afinkel	string
30	name	Visualizing Space, Race, and History in .pdf	string
31	fileStage	2	int
31	sourceSubmissionFileId	\N	string
31	submissionFileId	6	int
31	fileId	5	int
31	submissionId	2	int
31	originalFileName	Visualizing Space, Race, and History in .pdf	string
31	username	afinkel	string
32	fileStage	2	int
32	sourceSubmissionFileId	\N	string
32	submissionFileId	6	int
32	fileId	5	int
32	submissionId	2	int
32	username	afinkel	string
32	originalFileName	Visualizing Space, Race, and History in .pdf	string
32	name	Visualizing Space, Race, and History in .pdf	string
42	editorName	Daniel Barnes	string
42	submissionId	2	int
42	decision	Send to External Review	string
43	fileStage	4	int
43	sourceSubmissionFileId	3	int
43	submissionFileId	7	int
43	fileId	2	int
43	submissionId	2	int
43	originalFileName	Critical History in Western Canada 1900–.pdf	string
43	username	dbarnes	string
44	fileStage	4	int
44	submissionFileId	7	int
44	fileId	2	int
44	submissionId	2	int
44	username	dbarnes	string
44	name	Critical History in Western Canada 1900–.pdf	string
45	fileStage	4	int
45	sourceSubmissionFileId	4	int
45	submissionFileId	8	int
45	fileId	3	int
45	submissionId	2	int
45	originalFileName	Vernacular Currents in Western Canadian .pdf	string
45	username	dbarnes	string
46	fileStage	4	int
46	submissionFileId	8	int
46	fileId	3	int
46	submissionId	2	int
46	username	dbarnes	string
46	name	Vernacular Currents in Western Canadian .pdf	string
47	fileStage	4	int
47	sourceSubmissionFileId	5	int
47	submissionFileId	9	int
47	fileId	4	int
47	submissionId	2	int
47	originalFileName	Cree Intellectual Traditions in History.pdf	string
47	username	dbarnes	string
48	fileStage	4	int
48	submissionFileId	9	int
48	fileId	4	int
48	submissionId	2	int
48	username	dbarnes	string
48	name	Cree Intellectual Traditions in History.pdf	string
49	fileStage	4	int
49	sourceSubmissionFileId	6	int
49	submissionFileId	10	int
49	fileId	5	int
49	submissionId	2	int
49	originalFileName	Visualizing Space, Race, and History in .pdf	string
49	username	dbarnes	string
50	fileStage	4	int
50	submissionFileId	10	int
50	fileId	5	int
50	submissionId	2	int
50	username	dbarnes	string
50	name	Visualizing Space, Race, and History in .pdf	string
51	reviewAssignmentId	2	string
51	reviewerName	Al Zacharia	string
51	submissionId	2	int
51	stageId	3	int
51	round	1	int
52	reviewAssignmentId	3	string
52	reviewerName	Gonzalo Favio	string
52	submissionId	2	int
52	stageId	3	int
52	round	1	int
55	fileStage	2	int
55	sourceSubmissionFileId	\N	string
55	submissionFileId	11	int
55	fileId	6	int
55	submissionId	3	int
55	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
55	username	bbarnetson	string
56	fileStage	2	int
56	submissionFileId	11	int
56	fileId	6	int
56	submissionId	3	int
56	username	bbarnetson	string
56	name	The Political Economy of Workplace Injury in Canada.pdf	string
57	fileStage	2	int
57	sourceSubmissionFileId	\N	string
57	submissionFileId	11	int
57	fileId	6	int
57	submissionId	3	int
57	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
57	username	bbarnetson	string
58	fileStage	2	int
58	sourceSubmissionFileId	\N	string
58	submissionFileId	11	int
58	fileId	6	int
58	submissionId	3	int
58	username	bbarnetson	string
58	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
58	name	The Political Economy of Workplace Injury in Canada.pdf	string
63	fileStage	2	int
63	sourceSubmissionFileId	\N	string
63	submissionFileId	12	int
63	fileId	7	int
63	submissionId	4	int
63	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
63	username	bbeaty	string
64	fileStage	2	int
64	submissionFileId	12	int
64	fileId	7	int
64	submissionId	4	int
64	username	bbeaty	string
64	name	Introduction: Contexts of Popular Cultur.pdf	string
65	fileStage	2	int
65	sourceSubmissionFileId	\N	string
65	submissionFileId	12	int
65	fileId	7	int
65	submissionId	4	int
65	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
65	username	bbeaty	string
66	fileStage	2	int
66	sourceSubmissionFileId	\N	string
66	submissionFileId	12	int
66	fileId	7	int
66	submissionId	4	int
66	username	bbeaty	string
66	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
66	name	Introduction: Contexts of Popular Cultur.pdf	string
67	fileStage	2	int
67	sourceSubmissionFileId	\N	string
67	submissionFileId	13	int
67	fileId	8	int
67	submissionId	4	int
67	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
67	username	bbeaty	string
68	fileStage	2	int
68	submissionFileId	13	int
68	fileId	8	int
68	submissionId	4	int
68	username	bbeaty	string
68	name	Chapter 1. A Future for Media Studies: C.pdf	string
69	fileStage	2	int
69	sourceSubmissionFileId	\N	string
69	submissionFileId	13	int
69	fileId	8	int
69	submissionId	4	int
69	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
69	username	bbeaty	string
70	fileStage	2	int
70	sourceSubmissionFileId	\N	string
70	submissionFileId	13	int
70	fileId	8	int
70	submissionId	4	int
70	username	bbeaty	string
70	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
70	name	Chapter 1. A Future for Media Studies: C.pdf	string
71	fileStage	2	int
71	sourceSubmissionFileId	\N	string
71	submissionFileId	14	int
71	fileId	9	int
71	submissionId	4	int
71	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
71	username	bbeaty	string
72	fileStage	2	int
72	submissionFileId	14	int
72	fileId	9	int
72	submissionId	4	int
72	username	bbeaty	string
72	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
73	fileStage	2	int
73	sourceSubmissionFileId	\N	string
73	submissionFileId	14	int
73	fileId	9	int
73	submissionId	4	int
73	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
73	username	bbeaty	string
74	fileStage	2	int
74	sourceSubmissionFileId	\N	string
74	submissionFileId	14	int
74	fileId	9	int
74	submissionId	4	int
74	username	bbeaty	string
74	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
74	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
75	fileStage	2	int
75	sourceSubmissionFileId	\N	string
75	submissionFileId	15	int
75	fileId	10	int
75	submissionId	4	int
75	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
75	username	bbeaty	string
76	fileStage	2	int
76	submissionFileId	15	int
76	fileId	10	int
76	submissionId	4	int
76	username	bbeaty	string
76	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
77	fileStage	2	int
77	sourceSubmissionFileId	\N	string
77	submissionFileId	15	int
77	fileId	10	int
77	submissionId	4	int
77	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
77	username	bbeaty	string
78	fileStage	2	int
78	sourceSubmissionFileId	\N	string
78	submissionFileId	15	int
78	fileId	10	int
78	submissionId	4	int
78	username	bbeaty	string
78	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
78	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
84	editorName	Daniel Barnes	string
84	submissionId	4	int
84	decision	Send to Internal Review	string
85	fileStage	19	int
85	sourceSubmissionFileId	12	int
85	submissionFileId	16	int
85	fileId	7	int
85	submissionId	4	int
85	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
85	username	dbarnes	string
86	fileStage	19	int
86	submissionFileId	16	int
86	fileId	7	int
86	submissionId	4	int
86	username	dbarnes	string
86	name	Introduction: Contexts of Popular Cultur.pdf	string
87	fileStage	19	int
87	sourceSubmissionFileId	13	int
87	submissionFileId	17	int
87	fileId	8	int
87	submissionId	4	int
87	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
87	username	dbarnes	string
88	fileStage	19	int
88	submissionFileId	17	int
88	fileId	8	int
88	submissionId	4	int
88	username	dbarnes	string
88	name	Chapter 1. A Future for Media Studies: C.pdf	string
89	fileStage	19	int
89	sourceSubmissionFileId	14	int
89	submissionFileId	18	int
89	fileId	9	int
89	submissionId	4	int
89	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
89	username	dbarnes	string
90	fileStage	19	int
90	submissionFileId	18	int
90	fileId	9	int
90	submissionId	4	int
90	username	dbarnes	string
90	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
91	fileStage	19	int
91	sourceSubmissionFileId	15	int
91	submissionFileId	19	int
91	fileId	10	int
91	submissionId	4	int
91	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
91	username	dbarnes	string
92	fileStage	19	int
92	submissionFileId	19	int
92	fileId	10	int
92	submissionId	4	int
92	username	dbarnes	string
92	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
93	reviewAssignmentId	4	string
93	reviewerName	Aisla McCrae	string
93	submissionId	4	int
93	stageId	2	int
93	round	1	int
94	editorName	Daniel Barnes	string
94	submissionId	4	int
94	decision	Send to External Review	string
95	reviewAssignmentId	5	string
95	reviewerName	Al Zacharia	string
95	submissionId	4	int
95	stageId	3	int
95	round	1	int
96	editorName	Daniel Barnes	string
96	submissionId	4	int
96	decision	Accept Submission	string
97	name	Maria Fritz	string
97	username	mfritz	string
97	userGroupName	Copyeditor	string
98	editorName	Daniel Barnes	string
98	submissionId	4	int
98	decision	Send To Production	string
99	name	Graham Cox	string
99	username	gcox	string
99	userGroupName	Layout Editor	string
102	fileStage	2	int
102	sourceSubmissionFileId	\N	string
102	submissionFileId	20	int
102	fileId	11	int
102	submissionId	5	int
102	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
102	username	callan	string
103	fileStage	2	int
103	submissionFileId	20	int
103	fileId	11	int
103	submissionId	5	int
103	username	callan	string
103	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
104	fileStage	2	int
104	sourceSubmissionFileId	\N	string
104	submissionFileId	20	int
104	fileId	11	int
104	submissionId	5	int
104	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
104	username	callan	string
105	fileStage	2	int
105	sourceSubmissionFileId	\N	string
105	submissionFileId	20	int
105	fileId	11	int
105	submissionId	5	int
105	username	callan	string
105	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
105	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
108	editorName	Daniel Barnes	string
108	submissionId	5	int
108	decision	Send to Internal Review	string
109	reviewAssignmentId	6	string
109	reviewerName	Paul Hudson	string
109	submissionId	5	int
109	stageId	2	int
109	round	1	int
110	editorName	Daniel Barnes	string
110	submissionId	5	int
110	decision	Send to External Review	string
111	reviewAssignmentId	7	string
111	reviewerName	Gonzalo Favio	string
111	submissionId	5	int
111	stageId	3	int
111	round	1	int
112	editorName	Daniel Barnes	string
112	submissionId	5	int
112	decision	Accept Submission	string
113	name	Sarah Vogt	string
113	username	svogt	string
113	userGroupName	Copyeditor	string
114	editorName	Daniel Barnes	string
114	submissionId	5	int
114	decision	Send To Production	string
115	name	Stephen Hellier	string
115	username	shellier	string
115	userGroupName	Layout Editor	string
116	name	Catherine Turner	string
116	username	cturner	string
116	userGroupName	Proofreader	string
117	formatName	PDF	string
118	fileStage	10	int
118	sourceSubmissionFileId	20	int
118	submissionFileId	21	int
118	fileId	11	int
118	submissionId	5	int
118	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
118	username	dbarnes	string
119	fileStage	10	int
119	submissionFileId	21	int
119	fileId	11	int
119	submissionId	5	int
119	username	dbarnes	string
119	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
120	publicationFormatName	PDF	string
121	publicationFormatName	PDF	string
122	fileStage	10	int
122	sourceSubmissionFileId	20	int
122	submissionFileId	21	int
122	fileId	11	int
122	submissionId	5	int
122	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
122	username	dbarnes	string
123	fileStage	10	int
123	sourceSubmissionFileId	20	int
123	submissionFileId	21	int
123	fileId	11	int
123	submissionId	5	int
123	username	dbarnes	string
123	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
123	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
124	file	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
124	name	Daniel Barnes	string
124	username	dbarnes	string
128	fileStage	2	int
128	sourceSubmissionFileId	\N	string
128	submissionFileId	22	int
128	fileId	12	int
128	submissionId	6	int
128	originalFileName	Identify: Understanding Your Information.pdf	string
128	username	dbernnard	string
129	fileStage	2	int
129	submissionFileId	22	int
129	fileId	12	int
129	submissionId	6	int
129	username	dbernnard	string
129	name	Identify: Understanding Your Information.pdf	string
130	fileStage	2	int
130	sourceSubmissionFileId	\N	string
130	submissionFileId	22	int
130	fileId	12	int
130	submissionId	6	int
130	originalFileName	Identify: Understanding Your Information.pdf	string
130	username	dbernnard	string
131	fileStage	2	int
131	sourceSubmissionFileId	\N	string
131	submissionFileId	22	int
131	fileId	12	int
131	submissionId	6	int
131	username	dbernnard	string
131	originalFileName	Identify: Understanding Your Information.pdf	string
131	name	Identify: Understanding Your Information.pdf	string
132	fileStage	2	int
132	sourceSubmissionFileId	\N	string
132	submissionFileId	23	int
132	fileId	13	int
132	submissionId	6	int
132	originalFileName	Scope: Knowing What Is Available.pdf	string
132	username	dbernnard	string
133	fileStage	2	int
133	submissionFileId	23	int
133	fileId	13	int
133	submissionId	6	int
133	username	dbernnard	string
133	name	Scope: Knowing What Is Available.pdf	string
134	fileStage	2	int
134	sourceSubmissionFileId	\N	string
134	submissionFileId	23	int
134	fileId	13	int
134	submissionId	6	int
134	originalFileName	Scope: Knowing What Is Available.pdf	string
134	username	dbernnard	string
135	fileStage	2	int
135	sourceSubmissionFileId	\N	string
135	submissionFileId	23	int
135	fileId	13	int
135	submissionId	6	int
135	username	dbernnard	string
135	originalFileName	Scope: Knowing What Is Available.pdf	string
135	name	Scope: Knowing What Is Available.pdf	string
136	fileStage	2	int
136	sourceSubmissionFileId	\N	string
136	submissionFileId	24	int
136	fileId	14	int
136	submissionId	6	int
136	originalFileName	Plan: Developing Research Strategies.pdf	string
136	username	dbernnard	string
137	fileStage	2	int
137	submissionFileId	24	int
137	fileId	14	int
137	submissionId	6	int
137	username	dbernnard	string
137	name	Plan: Developing Research Strategies.pdf	string
138	fileStage	2	int
138	sourceSubmissionFileId	\N	string
138	submissionFileId	24	int
138	fileId	14	int
138	submissionId	6	int
138	originalFileName	Plan: Developing Research Strategies.pdf	string
138	username	dbernnard	string
139	fileStage	2	int
139	sourceSubmissionFileId	\N	string
139	submissionFileId	24	int
139	fileId	14	int
139	submissionId	6	int
139	username	dbernnard	string
139	originalFileName	Plan: Developing Research Strategies.pdf	string
139	name	Plan: Developing Research Strategies.pdf	string
140	fileStage	2	int
140	sourceSubmissionFileId	\N	string
140	submissionFileId	25	int
140	fileId	15	int
140	submissionId	6	int
140	originalFileName	Gather: Finding What You Need.pdf	string
140	username	dbernnard	string
141	fileStage	2	int
141	submissionFileId	25	int
141	fileId	15	int
141	submissionId	6	int
141	username	dbernnard	string
141	name	Gather: Finding What You Need.pdf	string
142	fileStage	2	int
142	sourceSubmissionFileId	\N	string
142	submissionFileId	25	int
142	fileId	15	int
142	submissionId	6	int
142	originalFileName	Gather: Finding What You Need.pdf	string
142	username	dbernnard	string
143	fileStage	2	int
143	sourceSubmissionFileId	\N	string
143	submissionFileId	25	int
143	fileId	15	int
143	submissionId	6	int
143	username	dbernnard	string
143	originalFileName	Gather: Finding What You Need.pdf	string
143	name	Gather: Finding What You Need.pdf	string
149	editorName	Daniel Barnes	string
149	submissionId	6	int
149	decision	Send to Internal Review	string
150	fileStage	19	int
150	sourceSubmissionFileId	22	int
150	submissionFileId	26	int
150	fileId	12	int
150	submissionId	6	int
150	originalFileName	Identify: Understanding Your Information.pdf	string
150	username	dbarnes	string
151	fileStage	19	int
151	submissionFileId	26	int
151	fileId	12	int
151	submissionId	6	int
151	username	dbarnes	string
151	name	Identify: Understanding Your Information.pdf	string
152	fileStage	19	int
152	sourceSubmissionFileId	23	int
152	submissionFileId	27	int
152	fileId	13	int
152	submissionId	6	int
152	originalFileName	Scope: Knowing What Is Available.pdf	string
152	username	dbarnes	string
153	fileStage	19	int
153	submissionFileId	27	int
153	fileId	13	int
153	submissionId	6	int
153	username	dbarnes	string
153	name	Scope: Knowing What Is Available.pdf	string
154	fileStage	19	int
154	sourceSubmissionFileId	24	int
154	submissionFileId	28	int
154	fileId	14	int
154	submissionId	6	int
154	originalFileName	Plan: Developing Research Strategies.pdf	string
154	username	dbarnes	string
155	fileStage	19	int
155	submissionFileId	28	int
155	fileId	14	int
155	submissionId	6	int
155	username	dbarnes	string
155	name	Plan: Developing Research Strategies.pdf	string
156	fileStage	19	int
156	sourceSubmissionFileId	25	int
156	submissionFileId	29	int
156	fileId	15	int
156	submissionId	6	int
156	originalFileName	Gather: Finding What You Need.pdf	string
156	username	dbarnes	string
157	fileStage	19	int
157	submissionFileId	29	int
157	fileId	15	int
157	submissionId	6	int
157	username	dbarnes	string
157	name	Gather: Finding What You Need.pdf	string
158	name	Minoti Inoue	string
158	username	minoue	string
158	userGroupName	Series editor	string
159	editorName	Minoti Inoue	string
159	submissionId	6	int
159	decision	Send to External Review	string
162	fileStage	2	int
162	sourceSubmissionFileId	\N	string
162	submissionFileId	30	int
162	fileId	16	int
162	submissionId	7	int
162	originalFileName	Introduction.pdf	string
162	username	dkennepohl	string
163	fileStage	2	int
163	submissionFileId	30	int
163	fileId	16	int
163	submissionId	7	int
163	username	dkennepohl	string
163	name	Introduction.pdf	string
164	fileStage	2	int
164	sourceSubmissionFileId	\N	string
164	submissionFileId	30	int
164	fileId	16	int
164	submissionId	7	int
164	originalFileName	Introduction.pdf	string
164	username	dkennepohl	string
165	fileStage	2	int
165	sourceSubmissionFileId	\N	string
165	submissionFileId	30	int
165	fileId	16	int
165	submissionId	7	int
165	username	dkennepohl	string
165	originalFileName	Introduction.pdf	string
165	name	Introduction.pdf	string
166	fileStage	2	int
166	sourceSubmissionFileId	\N	string
166	submissionFileId	31	int
166	fileId	17	int
166	submissionId	7	int
166	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
166	username	dkennepohl	string
167	fileStage	2	int
167	submissionFileId	31	int
167	fileId	17	int
167	submissionId	7	int
167	username	dkennepohl	string
167	name	Chapter 1: Interactions Affording Distan.pdf	string
168	fileStage	2	int
168	sourceSubmissionFileId	\N	string
168	submissionFileId	31	int
168	fileId	17	int
168	submissionId	7	int
168	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
168	username	dkennepohl	string
169	fileStage	2	int
169	sourceSubmissionFileId	\N	string
169	submissionFileId	31	int
169	fileId	17	int
169	submissionId	7	int
169	username	dkennepohl	string
169	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
169	name	Chapter 1: Interactions Affording Distan.pdf	string
170	fileStage	2	int
170	sourceSubmissionFileId	\N	string
170	submissionFileId	32	int
170	fileId	18	int
170	submissionId	7	int
170	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
170	username	dkennepohl	string
171	fileStage	2	int
171	submissionFileId	32	int
171	fileId	18	int
171	submissionId	7	int
171	username	dkennepohl	string
171	name	Chapter 2: Learning Science at a Distanc.pdf	string
172	fileStage	2	int
172	sourceSubmissionFileId	\N	string
172	submissionFileId	32	int
172	fileId	18	int
172	submissionId	7	int
172	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
172	username	dkennepohl	string
173	fileStage	2	int
173	sourceSubmissionFileId	\N	string
173	submissionFileId	32	int
173	fileId	18	int
173	submissionId	7	int
173	username	dkennepohl	string
173	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
173	name	Chapter 2: Learning Science at a Distanc.pdf	string
174	fileStage	2	int
174	sourceSubmissionFileId	\N	string
174	submissionFileId	33	int
174	fileId	19	int
174	submissionId	7	int
174	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
174	username	dkennepohl	string
175	fileStage	2	int
175	submissionFileId	33	int
175	fileId	19	int
175	submissionId	7	int
175	username	dkennepohl	string
175	name	Chapter 3: Leadership Strategies for Coo.pdf	string
176	fileStage	2	int
176	sourceSubmissionFileId	\N	string
176	submissionFileId	33	int
176	fileId	19	int
176	submissionId	7	int
176	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
176	username	dkennepohl	string
177	fileStage	2	int
177	sourceSubmissionFileId	\N	string
177	submissionFileId	33	int
177	fileId	19	int
177	submissionId	7	int
177	username	dkennepohl	string
177	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
177	name	Chapter 3: Leadership Strategies for Coo.pdf	string
178	fileStage	2	int
178	sourceSubmissionFileId	\N	string
178	submissionFileId	34	int
178	fileId	20	int
178	submissionId	7	int
178	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
178	username	dkennepohl	string
179	fileStage	2	int
179	submissionFileId	34	int
179	fileId	20	int
179	submissionId	7	int
179	username	dkennepohl	string
179	name	Chapter 4: Toward New Models of Flexible.pdf	string
180	fileStage	2	int
180	sourceSubmissionFileId	\N	string
180	submissionFileId	34	int
180	fileId	20	int
180	submissionId	7	int
180	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
180	username	dkennepohl	string
181	fileStage	2	int
181	sourceSubmissionFileId	\N	string
181	submissionFileId	34	int
181	fileId	20	int
181	submissionId	7	int
181	username	dkennepohl	string
181	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
181	name	Chapter 4: Toward New Models of Flexible.pdf	string
188	editorName	Daniel Barnes	string
188	submissionId	7	int
188	decision	Send to External Review	string
189	fileStage	4	int
189	sourceSubmissionFileId	30	int
189	submissionFileId	35	int
189	fileId	16	int
189	submissionId	7	int
189	originalFileName	Introduction.pdf	string
189	username	dbarnes	string
190	fileStage	4	int
190	submissionFileId	35	int
190	fileId	16	int
190	submissionId	7	int
190	username	dbarnes	string
190	name	Introduction.pdf	string
191	fileStage	4	int
191	sourceSubmissionFileId	31	int
191	submissionFileId	36	int
191	fileId	17	int
191	submissionId	7	int
191	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
191	username	dbarnes	string
192	fileStage	4	int
192	submissionFileId	36	int
192	fileId	17	int
192	submissionId	7	int
192	username	dbarnes	string
192	name	Chapter 1: Interactions Affording Distan.pdf	string
193	fileStage	4	int
193	sourceSubmissionFileId	32	int
193	submissionFileId	37	int
193	fileId	18	int
193	submissionId	7	int
193	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
193	username	dbarnes	string
194	fileStage	4	int
194	submissionFileId	37	int
194	fileId	18	int
194	submissionId	7	int
194	username	dbarnes	string
194	name	Chapter 2: Learning Science at a Distanc.pdf	string
195	fileStage	4	int
195	sourceSubmissionFileId	33	int
195	submissionFileId	38	int
195	fileId	19	int
195	submissionId	7	int
195	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
195	username	dbarnes	string
196	fileStage	4	int
196	submissionFileId	38	int
196	fileId	19	int
196	submissionId	7	int
196	username	dbarnes	string
196	name	Chapter 3: Leadership Strategies for Coo.pdf	string
197	fileStage	4	int
197	sourceSubmissionFileId	34	int
197	submissionFileId	39	int
197	fileId	20	int
197	submissionId	7	int
197	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
197	username	dbarnes	string
198	fileStage	4	int
198	submissionFileId	39	int
198	fileId	20	int
198	submissionId	7	int
198	username	dbarnes	string
198	name	Chapter 4: Toward New Models of Flexible.pdf	string
199	reviewAssignmentId	8	string
199	reviewerName	Adela Gallego	string
199	submissionId	7	int
199	stageId	3	int
199	round	1	int
200	editorName	Daniel Barnes	string
200	submissionId	7	int
200	decision	Accept Submission	string
201	name	Maria Fritz	string
201	username	mfritz	string
201	userGroupName	Copyeditor	string
204	fileStage	2	int
204	sourceSubmissionFileId	\N	string
204	submissionFileId	40	int
204	fileId	21	int
204	submissionId	8	int
204	originalFileName	Editorial.pdf	string
204	username	dbarnes	string
205	fileStage	2	int
205	submissionFileId	40	int
205	fileId	21	int
205	submissionId	8	int
205	username	dbarnes	string
205	name	Editorial.pdf	string
206	fileStage	2	int
206	sourceSubmissionFileId	\N	string
206	submissionFileId	40	int
206	fileId	21	int
206	submissionId	8	int
206	originalFileName	Editorial.pdf	string
206	username	dbarnes	string
207	fileStage	2	int
207	sourceSubmissionFileId	\N	string
207	submissionFileId	40	int
207	fileId	21	int
207	submissionId	8	int
207	username	dbarnes	string
207	originalFileName	Editorial.pdf	string
207	name	Editorial.pdf	string
212	fileStage	2	int
212	sourceSubmissionFileId	\N	string
212	submissionFileId	41	int
212	fileId	22	int
212	submissionId	9	int
212	originalFileName	Internet, openness and the future of the.pdf	string
212	username	fperini	string
213	fileStage	2	int
213	submissionFileId	41	int
213	fileId	22	int
213	submissionId	9	int
213	username	fperini	string
213	name	Internet, openness and the future of the.pdf	string
214	fileStage	2	int
214	sourceSubmissionFileId	\N	string
214	submissionFileId	41	int
214	fileId	22	int
214	submissionId	9	int
214	originalFileName	Internet, openness and the future of the.pdf	string
214	username	fperini	string
215	fileStage	2	int
215	sourceSubmissionFileId	\N	string
215	submissionFileId	41	int
215	fileId	22	int
215	submissionId	9	int
215	username	fperini	string
215	originalFileName	Internet, openness and the future of the.pdf	string
215	name	Internet, openness and the future of the.pdf	string
216	fileStage	2	int
216	sourceSubmissionFileId	\N	string
216	submissionFileId	42	int
216	fileId	23	int
216	submissionId	9	int
216	originalFileName	Imagining the Internet: Open, closed or .pdf	string
216	username	fperini	string
217	fileStage	2	int
217	submissionFileId	42	int
217	fileId	23	int
217	submissionId	9	int
217	username	fperini	string
217	name	Imagining the Internet: Open, closed or .pdf	string
218	fileStage	2	int
218	sourceSubmissionFileId	\N	string
218	submissionFileId	42	int
218	fileId	23	int
218	submissionId	9	int
218	originalFileName	Imagining the Internet: Open, closed or .pdf	string
218	username	fperini	string
219	fileStage	2	int
219	sourceSubmissionFileId	\N	string
219	submissionFileId	42	int
219	fileId	23	int
219	submissionId	9	int
219	username	fperini	string
219	originalFileName	Imagining the Internet: Open, closed or .pdf	string
219	name	Imagining the Internet: Open, closed or .pdf	string
220	fileStage	2	int
220	sourceSubmissionFileId	\N	string
220	submissionFileId	43	int
220	fileId	24	int
220	submissionId	9	int
220	originalFileName	The internet in LAC will remain free, pu.pdf	string
220	username	fperini	string
221	fileStage	2	int
221	submissionFileId	43	int
221	fileId	24	int
221	submissionId	9	int
221	username	fperini	string
221	name	The internet in LAC will remain free, pu.pdf	string
222	fileStage	2	int
222	sourceSubmissionFileId	\N	string
222	submissionFileId	43	int
222	fileId	24	int
222	submissionId	9	int
222	originalFileName	The internet in LAC will remain free, pu.pdf	string
222	username	fperini	string
223	fileStage	2	int
223	sourceSubmissionFileId	\N	string
223	submissionFileId	43	int
223	fileId	24	int
223	submissionId	9	int
223	username	fperini	string
223	originalFileName	The internet in LAC will remain free, pu.pdf	string
223	name	The internet in LAC will remain free, pu.pdf	string
224	fileStage	2	int
224	sourceSubmissionFileId	\N	string
224	submissionFileId	44	int
224	fileId	25	int
224	submissionId	9	int
224	originalFileName	Free Internet?.pdf	string
224	username	fperini	string
225	fileStage	2	int
225	submissionFileId	44	int
225	fileId	25	int
225	submissionId	9	int
225	username	fperini	string
225	name	Free Internet?.pdf	string
226	fileStage	2	int
226	sourceSubmissionFileId	\N	string
226	submissionFileId	44	int
226	fileId	25	int
226	submissionId	9	int
226	originalFileName	Free Internet?.pdf	string
226	username	fperini	string
227	fileStage	2	int
227	sourceSubmissionFileId	\N	string
227	submissionFileId	44	int
227	fileId	25	int
227	submissionId	9	int
227	username	fperini	string
227	originalFileName	Free Internet?.pdf	string
227	name	Free Internet?.pdf	string
228	fileStage	2	int
228	sourceSubmissionFileId	\N	string
228	submissionFileId	45	int
228	fileId	26	int
228	submissionId	9	int
228	originalFileName	Risks and challenges for freedom of expr.pdf	string
228	username	fperini	string
229	fileStage	2	int
229	submissionFileId	45	int
229	fileId	26	int
229	submissionId	9	int
229	username	fperini	string
229	name	Risks and challenges for freedom of expr.pdf	string
230	fileStage	2	int
230	sourceSubmissionFileId	\N	string
230	submissionFileId	45	int
230	fileId	26	int
230	submissionId	9	int
230	originalFileName	Risks and challenges for freedom of expr.pdf	string
230	username	fperini	string
231	fileStage	2	int
231	sourceSubmissionFileId	\N	string
231	submissionFileId	45	int
231	fileId	26	int
231	submissionId	9	int
231	username	fperini	string
231	originalFileName	Risks and challenges for freedom of expr.pdf	string
231	name	Risks and challenges for freedom of expr.pdf	string
238	editorName	Daniel Barnes	string
238	submissionId	9	int
238	decision	Send to Internal Review	string
239	fileStage	19	int
239	sourceSubmissionFileId	41	int
239	submissionFileId	46	int
239	fileId	22	int
239	submissionId	9	int
239	originalFileName	Internet, openness and the future of the.pdf	string
239	username	dbarnes	string
240	fileStage	19	int
240	submissionFileId	46	int
240	fileId	22	int
240	submissionId	9	int
240	username	dbarnes	string
240	name	Internet, openness and the future of the.pdf	string
241	fileStage	19	int
241	sourceSubmissionFileId	42	int
241	submissionFileId	47	int
241	fileId	23	int
241	submissionId	9	int
241	originalFileName	Imagining the Internet: Open, closed or .pdf	string
241	username	dbarnes	string
242	fileStage	19	int
242	submissionFileId	47	int
242	fileId	23	int
242	submissionId	9	int
242	username	dbarnes	string
242	name	Imagining the Internet: Open, closed or .pdf	string
243	fileStage	19	int
243	sourceSubmissionFileId	43	int
243	submissionFileId	48	int
243	fileId	24	int
243	submissionId	9	int
243	originalFileName	The internet in LAC will remain free, pu.pdf	string
243	username	dbarnes	string
244	fileStage	19	int
244	submissionFileId	48	int
244	fileId	24	int
244	submissionId	9	int
244	username	dbarnes	string
244	name	The internet in LAC will remain free, pu.pdf	string
245	fileStage	19	int
245	sourceSubmissionFileId	44	int
245	submissionFileId	49	int
245	fileId	25	int
245	submissionId	9	int
245	originalFileName	Free Internet?.pdf	string
245	username	dbarnes	string
246	fileStage	19	int
246	submissionFileId	49	int
246	fileId	25	int
246	submissionId	9	int
246	username	dbarnes	string
246	name	Free Internet?.pdf	string
247	fileStage	19	int
247	sourceSubmissionFileId	45	int
247	submissionFileId	50	int
247	fileId	26	int
247	submissionId	9	int
247	originalFileName	Risks and challenges for freedom of expr.pdf	string
247	username	dbarnes	string
248	fileStage	19	int
248	submissionFileId	50	int
248	fileId	26	int
248	submissionId	9	int
248	username	dbarnes	string
248	name	Risks and challenges for freedom of expr.pdf	string
251	fileStage	2	int
251	sourceSubmissionFileId	\N	string
251	submissionFileId	51	int
251	fileId	27	int
251	submissionId	10	int
251	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
251	username	jbrower	string
252	fileStage	2	int
252	submissionFileId	51	int
252	fileId	27	int
252	submissionId	10	int
252	username	jbrower	string
252	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
253	fileStage	2	int
253	sourceSubmissionFileId	\N	string
253	submissionFileId	51	int
253	fileId	27	int
253	submissionId	10	int
253	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
253	username	jbrower	string
254	fileStage	2	int
254	sourceSubmissionFileId	\N	string
254	submissionFileId	51	int
254	fileId	27	int
254	submissionId	10	int
254	username	jbrower	string
254	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
254	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
259	fileStage	2	int
259	sourceSubmissionFileId	\N	string
259	submissionFileId	52	int
259	fileId	28	int
259	submissionId	11	int
259	originalFileName	Dreamwork.pdf	string
259	username	jlockehart	string
260	fileStage	2	int
260	submissionFileId	52	int
260	fileId	28	int
260	submissionId	11	int
260	username	jlockehart	string
260	name	Dreamwork.pdf	string
261	fileStage	2	int
261	sourceSubmissionFileId	\N	string
261	submissionFileId	52	int
261	fileId	28	int
261	submissionId	11	int
261	originalFileName	Dreamwork.pdf	string
261	username	jlockehart	string
262	fileStage	2	int
262	sourceSubmissionFileId	\N	string
262	submissionFileId	52	int
262	fileId	28	int
262	submissionId	11	int
262	username	jlockehart	string
262	originalFileName	Dreamwork.pdf	string
262	name	Dreamwork.pdf	string
265	editorName	Daniel Barnes	string
265	submissionId	11	int
265	decision	Send to Internal Review	string
266	fileStage	19	int
266	sourceSubmissionFileId	52	int
266	submissionFileId	53	int
266	fileId	28	int
266	submissionId	11	int
266	originalFileName	Dreamwork.pdf	string
266	username	dbarnes	string
267	fileStage	19	int
267	submissionFileId	53	int
267	fileId	28	int
267	submissionId	11	int
267	username	dbarnes	string
267	name	Dreamwork.pdf	string
268	reviewAssignmentId	9	string
268	reviewerName	Aisla McCrae	string
268	submissionId	11	int
268	stageId	2	int
268	round	1	int
269	editorName	Daniel Barnes	string
269	submissionId	11	int
269	decision	Send to External Review	string
270	reviewAssignmentId	10	string
270	reviewerName	Adela Gallego	string
270	submissionId	11	int
270	stageId	3	int
270	round	1	int
271	reviewAssignmentId	11	string
271	reviewerName	Gonzalo Favio	string
271	submissionId	11	int
271	stageId	3	int
271	round	1	int
272	reviewAssignmentId	10	int
272	reviewerName	Adela Gallego	string
272	submissionId	11	int
272	round	1	int
273	reviewAssignmentId	10	int
273	reviewerName	Adela Gallego	string
273	submissionId	11	int
273	round	1	int
274	reviewAssignmentId	11	int
274	reviewerName	Gonzalo Favio	string
274	submissionId	11	int
274	round	1	int
275	reviewAssignmentId	11	int
275	reviewerName	Gonzalo Favio	string
275	submissionId	11	int
275	round	1	int
276	editorName	Daniel Barnes	string
276	submissionId	11	int
276	decision	Accept Submission	string
279	fileStage	2	int
279	sourceSubmissionFileId	\N	string
279	submissionFileId	54	int
279	fileId	29	int
279	submissionId	12	int
279	originalFileName	Catalyzing Access through Social and Tec.pdf	string
279	username	lelder	string
280	fileStage	2	int
280	submissionFileId	54	int
280	fileId	29	int
280	submissionId	12	int
280	username	lelder	string
280	name	Catalyzing Access through Social and Tec.pdf	string
281	fileStage	2	int
281	sourceSubmissionFileId	\N	string
281	submissionFileId	54	int
281	fileId	29	int
281	submissionId	12	int
281	originalFileName	Catalyzing Access through Social and Tec.pdf	string
281	username	lelder	string
282	fileStage	2	int
282	sourceSubmissionFileId	\N	string
282	submissionFileId	54	int
282	fileId	29	int
282	submissionId	12	int
282	username	lelder	string
282	originalFileName	Catalyzing Access through Social and Tec.pdf	string
282	name	Catalyzing Access through Social and Tec.pdf	string
283	fileStage	2	int
283	sourceSubmissionFileId	\N	string
283	submissionFileId	55	int
283	fileId	30	int
283	submissionId	12	int
283	originalFileName	Catalyzing Access via Telecommunications.pdf	string
283	username	lelder	string
284	fileStage	2	int
284	submissionFileId	55	int
284	fileId	30	int
284	submissionId	12	int
284	username	lelder	string
284	name	Catalyzing Access via Telecommunications.pdf	string
285	fileStage	2	int
285	sourceSubmissionFileId	\N	string
285	submissionFileId	55	int
285	fileId	30	int
285	submissionId	12	int
285	originalFileName	Catalyzing Access via Telecommunications.pdf	string
285	username	lelder	string
286	fileStage	2	int
286	sourceSubmissionFileId	\N	string
286	submissionFileId	55	int
286	fileId	30	int
286	submissionId	12	int
286	username	lelder	string
286	originalFileName	Catalyzing Access via Telecommunications.pdf	string
286	name	Catalyzing Access via Telecommunications.pdf	string
287	fileStage	2	int
287	sourceSubmissionFileId	\N	string
287	submissionFileId	56	int
287	fileId	31	int
287	submissionId	12	int
287	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
287	username	lelder	string
288	fileStage	2	int
288	submissionFileId	56	int
288	fileId	31	int
288	submissionId	12	int
288	username	lelder	string
288	name	Access to Knowledge as a New Paradigm fo.pdf	string
289	fileStage	2	int
289	sourceSubmissionFileId	\N	string
289	submissionFileId	56	int
289	fileId	31	int
289	submissionId	12	int
326	reviewerName	Paul Hudson	string
289	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
289	username	lelder	string
290	fileStage	2	int
290	sourceSubmissionFileId	\N	string
290	submissionFileId	56	int
290	fileId	31	int
290	submissionId	12	int
290	username	lelder	string
290	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
290	name	Access to Knowledge as a New Paradigm fo.pdf	string
300	editorName	Daniel Barnes	string
300	submissionId	12	int
300	decision	Send to Internal Review	string
301	reviewAssignmentId	12	string
301	reviewerName	Julie Janssen	string
301	submissionId	12	int
301	stageId	2	int
301	round	1	int
302	reviewAssignmentId	13	string
302	reviewerName	Paul Hudson	string
302	submissionId	12	int
302	stageId	2	int
302	round	1	int
303	reviewAssignmentId	14	string
303	reviewerName	Aisla McCrae	string
303	submissionId	12	int
303	stageId	2	int
303	round	1	int
304	reviewAssignmentId	13	int
304	reviewerName	Paul Hudson	string
304	submissionId	12	int
304	round	1	int
305	reviewAssignmentId	13	int
305	reviewerName	Paul Hudson	string
305	submissionId	12	int
305	round	1	int
308	fileStage	2	int
308	sourceSubmissionFileId	\N	string
308	submissionFileId	57	int
308	fileId	32	int
308	submissionId	13	int
308	originalFileName	Current State of Mobile Learning.pdf	string
308	username	mally	string
309	fileStage	2	int
309	submissionFileId	57	int
309	fileId	32	int
309	submissionId	13	int
309	username	mally	string
309	name	Current State of Mobile Learning.pdf	string
310	fileStage	2	int
310	sourceSubmissionFileId	\N	string
310	submissionFileId	57	int
310	fileId	32	int
310	submissionId	13	int
310	originalFileName	Current State of Mobile Learning.pdf	string
310	username	mally	string
311	fileStage	2	int
311	sourceSubmissionFileId	\N	string
311	submissionFileId	57	int
311	fileId	32	int
311	submissionId	13	int
311	username	mally	string
311	originalFileName	Current State of Mobile Learning.pdf	string
311	name	Current State of Mobile Learning.pdf	string
312	fileStage	2	int
312	sourceSubmissionFileId	\N	string
312	submissionFileId	58	int
312	fileId	33	int
312	submissionId	13	int
312	originalFileName	A Model for Framing Mobile Learning.pdf	string
312	username	mally	string
313	fileStage	2	int
313	submissionFileId	58	int
313	fileId	33	int
313	submissionId	13	int
313	username	mally	string
313	name	A Model for Framing Mobile Learning.pdf	string
314	fileStage	2	int
314	sourceSubmissionFileId	\N	string
314	submissionFileId	58	int
314	fileId	33	int
314	submissionId	13	int
314	originalFileName	A Model for Framing Mobile Learning.pdf	string
314	username	mally	string
315	fileStage	2	int
315	sourceSubmissionFileId	\N	string
315	submissionFileId	58	int
315	fileId	33	int
315	submissionId	13	int
315	username	mally	string
315	originalFileName	A Model for Framing Mobile Learning.pdf	string
315	name	A Model for Framing Mobile Learning.pdf	string
316	fileStage	2	int
316	sourceSubmissionFileId	\N	string
316	submissionFileId	59	int
316	fileId	34	int
316	submissionId	13	int
316	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
316	username	mally	string
317	fileStage	2	int
317	submissionFileId	59	int
317	fileId	34	int
317	submissionId	13	int
317	username	mally	string
317	name	Mobile Distance Learning with PDAs: Deve.pdf	string
318	fileStage	2	int
318	sourceSubmissionFileId	\N	string
318	submissionFileId	59	int
318	fileId	34	int
318	submissionId	13	int
318	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
318	username	mally	string
319	fileStage	2	int
319	sourceSubmissionFileId	\N	string
319	submissionFileId	59	int
319	fileId	34	int
319	submissionId	13	int
319	username	mally	string
319	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
319	name	Mobile Distance Learning with PDAs: Deve.pdf	string
325	editorName	Daniel Barnes	string
325	submissionId	13	int
325	decision	Send to Internal Review	string
326	reviewAssignmentId	15	string
326	submissionId	13	int
326	stageId	2	int
326	round	1	int
327	editorName	Daniel Barnes	string
327	submissionId	13	int
327	decision	Send to External Review	string
328	reviewAssignmentId	16	string
328	reviewerName	Adela Gallego	string
328	submissionId	13	int
328	stageId	3	int
328	round	1	int
329	reviewAssignmentId	17	string
329	reviewerName	Al Zacharia	string
329	submissionId	13	int
329	stageId	3	int
329	round	1	int
330	reviewAssignmentId	18	string
330	reviewerName	Gonzalo Favio	string
330	submissionId	13	int
330	stageId	3	int
330	round	1	int
331	reviewAssignmentId	16	int
331	reviewerName	Adela Gallego	string
331	submissionId	13	int
331	round	1	int
332	reviewAssignmentId	16	int
332	reviewerName	Adela Gallego	string
332	submissionId	13	int
332	round	1	int
333	reviewAssignmentId	18	int
333	reviewerName	Gonzalo Favio	string
333	submissionId	13	int
333	round	1	int
334	reviewAssignmentId	18	int
334	reviewerName	Gonzalo Favio	string
334	submissionId	13	int
334	round	1	int
335	editorName	Daniel Barnes	string
335	submissionId	13	int
335	decision	Accept Submission	string
338	fileStage	2	int
338	sourceSubmissionFileId	\N	string
338	submissionFileId	60	int
338	fileId	35	int
338	submissionId	14	int
338	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
338	username	mdawson	string
339	fileStage	2	int
339	submissionFileId	60	int
339	fileId	35	int
339	submissionId	14	int
339	username	mdawson	string
339	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
340	fileStage	2	int
340	sourceSubmissionFileId	\N	string
340	submissionFileId	60	int
340	fileId	35	int
340	submissionId	14	int
340	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
340	username	mdawson	string
341	fileStage	2	int
341	sourceSubmissionFileId	\N	string
341	submissionFileId	60	int
341	fileId	35	int
341	submissionId	14	int
341	username	mdawson	string
341	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
341	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
342	fileStage	2	int
342	sourceSubmissionFileId	\N	string
342	submissionFileId	61	int
342	fileId	36	int
342	submissionId	14	int
342	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
342	username	mdawson	string
343	fileStage	2	int
343	submissionFileId	61	int
343	fileId	36	int
343	submissionId	14	int
343	username	mdawson	string
343	name	Chapter 2: Classical Music and the Class.pdf	string
344	fileStage	2	int
344	sourceSubmissionFileId	\N	string
344	submissionFileId	61	int
344	fileId	36	int
344	submissionId	14	int
344	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
344	username	mdawson	string
345	fileStage	2	int
345	sourceSubmissionFileId	\N	string
345	submissionFileId	61	int
345	fileId	36	int
345	submissionId	14	int
345	username	mdawson	string
345	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
345	name	Chapter 2: Classical Music and the Class.pdf	string
346	fileStage	2	int
346	sourceSubmissionFileId	\N	string
346	submissionFileId	62	int
346	fileId	37	int
346	submissionId	14	int
346	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
346	username	mdawson	string
347	fileStage	2	int
347	submissionFileId	62	int
347	fileId	37	int
347	submissionId	14	int
347	username	mdawson	string
347	name	Chapter 3: Situated Cognition and Bricol.pdf	string
348	fileStage	2	int
348	sourceSubmissionFileId	\N	string
348	submissionFileId	62	int
348	fileId	37	int
348	submissionId	14	int
348	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
348	username	mdawson	string
349	fileStage	2	int
349	sourceSubmissionFileId	\N	string
349	submissionFileId	62	int
349	fileId	37	int
349	submissionId	14	int
349	username	mdawson	string
349	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
349	name	Chapter 3: Situated Cognition and Bricol.pdf	string
350	fileStage	2	int
350	sourceSubmissionFileId	\N	string
350	submissionFileId	63	int
350	fileId	38	int
350	submissionId	14	int
350	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
350	username	mdawson	string
351	fileStage	2	int
351	submissionFileId	63	int
351	fileId	38	int
351	submissionId	14	int
351	username	mdawson	string
351	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
352	fileStage	2	int
352	sourceSubmissionFileId	\N	string
352	submissionFileId	63	int
352	fileId	38	int
352	submissionId	14	int
352	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
352	username	mdawson	string
353	fileStage	2	int
353	sourceSubmissionFileId	\N	string
353	submissionFileId	63	int
353	fileId	38	int
353	submissionId	14	int
353	username	mdawson	string
353	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
353	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
354	fileStage	2	int
354	sourceSubmissionFileId	\N	string
354	submissionFileId	64	int
354	fileId	39	int
354	submissionId	14	int
354	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
354	username	mdawson	string
355	fileStage	2	int
355	submissionFileId	64	int
355	fileId	39	int
355	submissionId	14	int
355	username	mdawson	string
355	name	Segmentation of Vascular Ultrasound Imag.pdf	string
356	fileStage	2	int
356	sourceSubmissionFileId	\N	string
356	submissionFileId	64	int
356	fileId	39	int
356	submissionId	14	int
356	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
356	username	mdawson	string
357	fileStage	2	int
357	sourceSubmissionFileId	\N	string
357	submissionFileId	64	int
357	fileId	39	int
357	submissionId	14	int
357	username	mdawson	string
357	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
357	name	Segmentation of Vascular Ultrasound Imag.pdf	string
358	fileStage	2	int
358	sourceSubmissionFileId	\N	string
358	submissionFileId	65	int
358	fileId	40	int
358	submissionId	14	int
358	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
358	username	mdawson	string
359	fileStage	2	int
359	submissionFileId	65	int
359	fileId	40	int
359	submissionId	14	int
359	username	mdawson	string
359	name	The Canadian Nutrient File: Nutrient Val.pdf	string
360	fileStage	2	int
360	sourceSubmissionFileId	\N	string
360	submissionFileId	65	int
360	fileId	40	int
360	submissionId	14	int
360	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
360	username	mdawson	string
361	fileStage	2	int
361	sourceSubmissionFileId	\N	string
361	submissionFileId	65	int
361	fileId	40	int
361	submissionId	14	int
361	username	mdawson	string
361	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
361	name	The Canadian Nutrient File: Nutrient Val.pdf	string
366	editorName	Daniel Barnes	string
366	submissionId	14	int
366	decision	Send to Internal Review	string
367	fileStage	19	int
367	sourceSubmissionFileId	60	int
367	submissionFileId	66	int
367	fileId	35	int
367	submissionId	14	int
367	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
367	username	dbarnes	string
368	fileStage	19	int
368	submissionFileId	66	int
368	fileId	35	int
368	submissionId	14	int
368	username	dbarnes	string
368	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
369	fileStage	19	int
369	sourceSubmissionFileId	61	int
369	submissionFileId	67	int
369	fileId	36	int
369	submissionId	14	int
369	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
369	username	dbarnes	string
370	fileStage	19	int
370	submissionFileId	67	int
370	fileId	36	int
370	submissionId	14	int
370	username	dbarnes	string
370	name	Chapter 2: Classical Music and the Class.pdf	string
371	fileStage	19	int
371	sourceSubmissionFileId	62	int
371	submissionFileId	68	int
371	fileId	37	int
371	submissionId	14	int
371	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
371	username	dbarnes	string
372	fileStage	19	int
372	submissionFileId	68	int
372	fileId	37	int
372	submissionId	14	int
372	username	dbarnes	string
372	name	Chapter 3: Situated Cognition and Bricol.pdf	string
373	fileStage	19	int
373	sourceSubmissionFileId	63	int
373	submissionFileId	69	int
373	fileId	38	int
373	submissionId	14	int
373	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
373	username	dbarnes	string
374	fileStage	19	int
374	submissionFileId	69	int
374	fileId	38	int
374	submissionId	14	int
374	username	dbarnes	string
374	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
375	fileStage	19	int
375	sourceSubmissionFileId	64	int
375	submissionFileId	70	int
375	fileId	39	int
375	submissionId	14	int
375	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
375	username	dbarnes	string
376	fileStage	19	int
376	submissionFileId	70	int
376	fileId	39	int
376	submissionId	14	int
376	username	dbarnes	string
376	name	Segmentation of Vascular Ultrasound Imag.pdf	string
377	fileStage	19	int
377	sourceSubmissionFileId	65	int
377	submissionFileId	71	int
377	fileId	40	int
377	submissionId	14	int
377	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
377	username	dbarnes	string
378	fileStage	19	int
378	submissionFileId	71	int
378	fileId	40	int
378	submissionId	14	int
378	username	dbarnes	string
378	name	The Canadian Nutrient File: Nutrient Val.pdf	string
379	reviewAssignmentId	19	string
379	reviewerName	Julie Janssen	string
379	submissionId	14	int
379	stageId	2	int
379	round	1	int
380	editorName	Daniel Barnes	string
380	submissionId	14	int
380	decision	Send to External Review	string
381	reviewAssignmentId	20	string
381	reviewerName	Al Zacharia	string
381	submissionId	14	int
381	stageId	3	int
381	round	1	int
382	editorName	Daniel Barnes	string
382	submissionId	14	int
382	decision	Accept Submission	string
383	name	Maria Fritz	string
383	username	mfritz	string
383	userGroupName	Copyeditor	string
384	editorName	Daniel Barnes	string
384	submissionId	14	int
384	decision	Send To Production	string
385	name	Graham Cox	string
385	username	gcox	string
385	userGroupName	Layout Editor	string
386	name	Sabine Kumar	string
386	username	skumar	string
386	userGroupName	Proofreader	string
387	formatName	PDF	string
388	fileStage	10	int
388	sourceSubmissionFileId	60	int
388	submissionFileId	72	int
388	fileId	35	int
388	submissionId	14	int
388	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
388	username	dbarnes	string
389	fileStage	10	int
389	submissionFileId	72	int
389	fileId	35	int
389	submissionId	14	int
389	username	dbarnes	string
389	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
390	fileStage	10	int
390	sourceSubmissionFileId	61	int
390	submissionFileId	73	int
390	fileId	36	int
390	submissionId	14	int
390	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
390	username	dbarnes	string
391	fileStage	10	int
391	submissionFileId	73	int
391	fileId	36	int
391	submissionId	14	int
391	username	dbarnes	string
391	name	Chapter 2: Classical Music and the Class.pdf	string
392	fileStage	10	int
392	sourceSubmissionFileId	62	int
392	submissionFileId	74	int
392	fileId	37	int
392	submissionId	14	int
392	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
392	username	dbarnes	string
393	fileStage	10	int
393	submissionFileId	74	int
393	fileId	37	int
393	submissionId	14	int
393	username	dbarnes	string
393	name	Chapter 3: Situated Cognition and Bricol.pdf	string
394	fileStage	10	int
394	sourceSubmissionFileId	63	int
394	submissionFileId	75	int
394	fileId	38	int
394	submissionId	14	int
394	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
394	username	dbarnes	string
395	fileStage	10	int
395	submissionFileId	75	int
395	fileId	38	int
395	submissionId	14	int
395	username	dbarnes	string
395	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
396	fileStage	10	int
396	sourceSubmissionFileId	64	int
396	submissionFileId	76	int
396	fileId	39	int
396	submissionId	14	int
396	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
396	username	dbarnes	string
397	fileStage	10	int
397	submissionFileId	76	int
397	fileId	39	int
397	submissionId	14	int
397	username	dbarnes	string
397	name	Segmentation of Vascular Ultrasound Imag.pdf	string
398	fileStage	10	int
398	sourceSubmissionFileId	65	int
398	submissionFileId	77	int
398	fileId	40	int
398	submissionId	14	int
398	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
398	username	dbarnes	string
399	fileStage	10	int
399	submissionFileId	77	int
399	fileId	40	int
399	submissionId	14	int
399	username	dbarnes	string
399	name	The Canadian Nutrient File: Nutrient Val.pdf	string
400	publicationFormatName	PDF	string
401	publicationFormatName	PDF	string
402	fileStage	10	int
402	sourceSubmissionFileId	60	int
402	submissionFileId	72	int
402	fileId	35	int
402	submissionId	14	int
402	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
402	username	dbarnes	string
403	fileStage	10	int
403	sourceSubmissionFileId	60	int
403	submissionFileId	72	int
403	fileId	35	int
403	submissionId	14	int
403	username	dbarnes	string
403	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
403	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
404	file	Chapter 1: Mind Control—Internal or Exte.pdf	string
404	name	Daniel Barnes	string
404	username	dbarnes	string
405	fileStage	10	int
405	sourceSubmissionFileId	61	int
405	submissionFileId	73	int
405	fileId	36	int
405	submissionId	14	int
405	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
405	username	dbarnes	string
406	fileStage	10	int
406	sourceSubmissionFileId	61	int
406	submissionFileId	73	int
406	fileId	36	int
406	submissionId	14	int
406	username	dbarnes	string
406	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
406	name	Chapter 2: Classical Music and the Class.pdf	string
407	file	Chapter 2: Classical Music and the Class.pdf	string
407	name	Daniel Barnes	string
407	username	dbarnes	string
408	fileStage	10	int
408	sourceSubmissionFileId	62	int
408	submissionFileId	74	int
408	fileId	37	int
408	submissionId	14	int
408	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
408	username	dbarnes	string
409	fileStage	10	int
409	sourceSubmissionFileId	62	int
409	submissionFileId	74	int
409	fileId	37	int
409	submissionId	14	int
409	username	dbarnes	string
409	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
409	name	Chapter 3: Situated Cognition and Bricol.pdf	string
410	file	Chapter 3: Situated Cognition and Bricol.pdf	string
410	name	Daniel Barnes	string
410	username	dbarnes	string
411	fileStage	10	int
411	sourceSubmissionFileId	63	int
411	submissionFileId	75	int
411	fileId	38	int
411	submissionId	14	int
411	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
411	username	dbarnes	string
412	fileStage	10	int
412	sourceSubmissionFileId	63	int
412	submissionFileId	75	int
412	fileId	38	int
412	submissionId	14	int
412	username	dbarnes	string
412	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
412	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
413	file	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
413	name	Daniel Barnes	string
413	username	dbarnes	string
414	fileStage	10	int
414	sourceSubmissionFileId	64	int
414	submissionFileId	76	int
414	fileId	39	int
414	submissionId	14	int
414	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
414	username	dbarnes	string
415	fileStage	10	int
415	sourceSubmissionFileId	64	int
415	submissionFileId	76	int
415	fileId	39	int
415	submissionId	14	int
415	username	dbarnes	string
415	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
415	name	Segmentation of Vascular Ultrasound Imag.pdf	string
416	file	Segmentation of Vascular Ultrasound Imag.pdf	string
416	name	Daniel Barnes	string
416	username	dbarnes	string
417	fileStage	10	int
417	sourceSubmissionFileId	65	int
417	submissionFileId	77	int
417	fileId	40	int
417	submissionId	14	int
417	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
417	username	dbarnes	string
418	fileStage	10	int
418	sourceSubmissionFileId	65	int
418	submissionFileId	77	int
418	fileId	40	int
418	submissionId	14	int
418	username	dbarnes	string
418	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
418	name	The Canadian Nutrient File: Nutrient Val.pdf	string
419	file	The Canadian Nutrient File: Nutrient Val.pdf	string
419	name	Daniel Barnes	string
419	username	dbarnes	string
423	fileStage	2	int
423	sourceSubmissionFileId	\N	string
423	submissionFileId	78	int
423	fileId	41	int
423	submissionId	15	int
423	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
423	username	mforan	string
424	fileStage	2	int
424	submissionFileId	78	int
424	fileId	41	int
424	submissionId	15	int
424	username	mforan	string
424	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
425	fileStage	2	int
425	sourceSubmissionFileId	\N	string
425	submissionFileId	78	int
425	fileId	41	int
425	submissionId	15	int
425	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
425	username	mforan	string
426	fileStage	2	int
426	sourceSubmissionFileId	\N	string
426	submissionFileId	78	int
426	fileId	41	int
426	submissionId	15	int
426	username	mforan	string
426	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
426	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
429	editorName	Daniel Barnes	string
429	submissionId	15	int
429	decision	Send to External Review	string
432	fileStage	2	int
432	sourceSubmissionFileId	\N	string
432	submissionFileId	79	int
432	fileId	42	int
432	submissionId	16	int
432	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
432	username	mpower	string
433	fileStage	2	int
433	submissionFileId	79	int
433	fileId	42	int
433	submissionId	16	int
433	username	mpower	string
433	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
434	fileStage	2	int
434	sourceSubmissionFileId	\N	string
434	submissionFileId	79	int
434	fileId	42	int
434	submissionId	16	int
434	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
434	username	mpower	string
435	fileStage	2	int
435	sourceSubmissionFileId	\N	string
435	submissionFileId	79	int
435	fileId	42	int
435	submissionId	16	int
435	username	mpower	string
435	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
435	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
438	editorName	Daniel Barnes	string
438	submissionId	16	int
438	decision	Send to External Review	string
439	reviewAssignmentId	21	string
439	reviewerName	Adela Gallego	string
439	submissionId	16	int
439	stageId	3	int
439	round	1	int
440	reviewAssignmentId	22	string
440	reviewerName	Al Zacharia	string
440	submissionId	16	int
440	stageId	3	int
440	round	1	int
441	reviewAssignmentId	23	string
441	reviewerName	Gonzalo Favio	string
441	submissionId	16	int
441	stageId	3	int
441	round	1	int
442	reviewAssignmentId	21	int
442	reviewerName	Adela Gallego	string
442	submissionId	16	int
442	round	1	int
443	reviewAssignmentId	21	int
443	reviewerName	Adela Gallego	string
443	submissionId	16	int
443	round	1	int
446	fileStage	2	int
446	sourceSubmissionFileId	\N	string
446	submissionFileId	80	int
446	fileId	43	int
446	submissionId	17	int
446	originalFileName	Preface.pdf	string
446	username	msmith	string
447	fileStage	2	int
447	submissionFileId	80	int
447	fileId	43	int
447	submissionId	17	int
447	username	msmith	string
447	name	Preface.pdf	string
448	fileStage	2	int
448	sourceSubmissionFileId	\N	string
448	submissionFileId	80	int
448	fileId	43	int
448	submissionId	17	int
448	originalFileName	Preface.pdf	string
448	username	msmith	string
449	fileStage	2	int
449	sourceSubmissionFileId	\N	string
449	submissionFileId	80	int
449	fileId	43	int
449	submissionId	17	int
449	username	msmith	string
449	originalFileName	Preface.pdf	string
449	name	Preface.pdf	string
450	fileStage	2	int
450	sourceSubmissionFileId	\N	string
450	submissionFileId	81	int
450	fileId	44	int
450	submissionId	17	int
450	originalFileName	Introduction.pdf	string
450	username	msmith	string
451	fileStage	2	int
451	submissionFileId	81	int
451	fileId	44	int
451	submissionId	17	int
451	username	msmith	string
451	name	Introduction.pdf	string
452	fileStage	2	int
452	sourceSubmissionFileId	\N	string
452	submissionFileId	81	int
452	fileId	44	int
452	submissionId	17	int
452	originalFileName	Introduction.pdf	string
452	username	msmith	string
453	fileStage	2	int
453	sourceSubmissionFileId	\N	string
453	submissionFileId	81	int
453	fileId	44	int
453	submissionId	17	int
453	username	msmith	string
453	originalFileName	Introduction.pdf	string
453	name	Introduction.pdf	string
454	fileStage	2	int
454	sourceSubmissionFileId	\N	string
454	submissionFileId	82	int
454	fileId	45	int
454	submissionId	17	int
454	originalFileName	The Emergence of Open Development in a N.pdf	string
454	username	msmith	string
455	fileStage	2	int
455	submissionFileId	82	int
455	fileId	45	int
455	submissionId	17	int
455	username	msmith	string
455	name	The Emergence of Open Development in a N.pdf	string
456	fileStage	2	int
456	sourceSubmissionFileId	\N	string
456	submissionFileId	82	int
456	fileId	45	int
456	submissionId	17	int
456	originalFileName	The Emergence of Open Development in a N.pdf	string
456	username	msmith	string
457	fileStage	2	int
457	sourceSubmissionFileId	\N	string
457	submissionFileId	82	int
457	fileId	45	int
457	submissionId	17	int
457	username	msmith	string
457	originalFileName	The Emergence of Open Development in a N.pdf	string
457	name	The Emergence of Open Development in a N.pdf	string
458	fileStage	2	int
458	sourceSubmissionFileId	\N	string
458	submissionFileId	83	int
458	fileId	46	int
458	submissionId	17	int
458	originalFileName	Enacting Openness in ICT4D Research.pdf	string
458	username	msmith	string
459	fileStage	2	int
459	submissionFileId	83	int
459	fileId	46	int
459	submissionId	17	int
459	username	msmith	string
459	name	Enacting Openness in ICT4D Research.pdf	string
460	fileStage	2	int
460	sourceSubmissionFileId	\N	string
460	submissionFileId	83	int
460	fileId	46	int
460	submissionId	17	int
460	originalFileName	Enacting Openness in ICT4D Research.pdf	string
460	username	msmith	string
461	fileStage	2	int
461	sourceSubmissionFileId	\N	string
461	submissionFileId	83	int
461	fileId	46	int
461	submissionId	17	int
461	username	msmith	string
461	originalFileName	Enacting Openness in ICT4D Research.pdf	string
461	name	Enacting Openness in ICT4D Research.pdf	string
462	fileStage	2	int
462	sourceSubmissionFileId	\N	string
462	submissionFileId	84	int
462	fileId	47	int
462	submissionId	17	int
462	originalFileName	Transparency and Development: Ethical Co.pdf	string
462	username	msmith	string
463	fileStage	2	int
463	submissionFileId	84	int
463	fileId	47	int
463	submissionId	17	int
463	username	msmith	string
463	name	Transparency and Development: Ethical Co.pdf	string
464	fileStage	2	int
464	sourceSubmissionFileId	\N	string
464	submissionFileId	84	int
464	fileId	47	int
464	submissionId	17	int
464	originalFileName	Transparency and Development: Ethical Co.pdf	string
464	username	msmith	string
465	fileStage	2	int
465	sourceSubmissionFileId	\N	string
465	submissionFileId	84	int
465	fileId	47	int
465	submissionId	17	int
465	username	msmith	string
465	originalFileName	Transparency and Development: Ethical Co.pdf	string
465	name	Transparency and Development: Ethical Co.pdf	string
466	fileStage	2	int
466	sourceSubmissionFileId	\N	string
466	submissionFileId	85	int
466	fileId	48	int
466	submissionId	17	int
466	originalFileName	Open Educational Resources: Opportunitie.pdf	string
466	username	msmith	string
467	fileStage	2	int
467	submissionFileId	85	int
467	fileId	48	int
467	submissionId	17	int
467	username	msmith	string
467	name	Open Educational Resources: Opportunitie.pdf	string
468	fileStage	2	int
468	sourceSubmissionFileId	\N	string
468	submissionFileId	85	int
468	fileId	48	int
468	submissionId	17	int
468	originalFileName	Open Educational Resources: Opportunitie.pdf	string
468	username	msmith	string
469	fileStage	2	int
469	sourceSubmissionFileId	\N	string
469	submissionFileId	85	int
469	fileId	48	int
469	submissionId	17	int
469	username	msmith	string
469	originalFileName	Open Educational Resources: Opportunitie.pdf	string
469	name	Open Educational Resources: Opportunitie.pdf	string
479	editorName	Daniel Barnes	string
479	submissionId	17	int
479	decision	Send to Internal Review	string
480	reviewAssignmentId	24	string
480	reviewerName	Julie Janssen	string
480	submissionId	17	int
480	stageId	2	int
480	round	1	int
481	reviewAssignmentId	25	string
481	reviewerName	Paul Hudson	string
481	submissionId	17	int
481	stageId	2	int
481	round	1	int
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.features (submission_id, assoc_type, assoc_id, seq) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	presses/1/monographs/1/68f716f1c8362.pdf	application/pdf
2	presses/1/monographs/2/68f71712e2a54.pdf	application/pdf
3	presses/1/monographs/2/68f7171337c79.pdf	application/pdf
4	presses/1/monographs/2/68f717138cfc9.pdf	application/pdf
5	presses/1/monographs/2/68f71713dcfab.pdf	application/pdf
6	presses/1/monographs/3/68f71755bc78d.pdf	application/pdf
7	presses/1/monographs/4/68f717705e35f.pdf	application/pdf
8	presses/1/monographs/4/68f71770ad284.pdf	application/pdf
9	presses/1/monographs/4/68f7177112d10.pdf	application/pdf
10	presses/1/monographs/4/68f717716652f.pdf	application/pdf
11	presses/1/monographs/5/68f717b9a6ae2.pdf	application/pdf
12	presses/1/monographs/6/68f718038568f.pdf	application/pdf
13	presses/1/monographs/6/68f71803d1c56.pdf	application/pdf
14	presses/1/monographs/6/68f7180430199.pdf	application/pdf
15	presses/1/monographs/6/68f71804810cc.pdf	application/pdf
16	presses/1/monographs/7/68f7183d793ce.pdf	application/pdf
17	presses/1/monographs/7/68f7183dc64e6.pdf	application/pdf
18	presses/1/monographs/7/68f7183e222ea.pdf	application/pdf
19	presses/1/monographs/7/68f7183e7129a.pdf	application/pdf
20	presses/1/monographs/7/68f7183ed423a.pdf	application/pdf
21	presses/1/monographs/8/68f718815f2ab.pdf	application/pdf
22	presses/1/monographs/9/68f718896e24c.pdf	application/pdf
23	presses/1/monographs/9/68f71889bab6b.pdf	application/pdf
24	presses/1/monographs/9/68f7188a19692.pdf	application/pdf
25	presses/1/monographs/9/68f7188a78ea0.pdf	application/pdf
26	presses/1/monographs/9/68f7188ac967b.pdf	application/pdf
27	presses/1/monographs/10/68f718c1d420a.pdf	application/pdf
28	presses/1/monographs/11/68f718ead2f5e.pdf	application/pdf
29	presses/1/monographs/12/68f7191f2632d.pdf	application/pdf
30	presses/1/monographs/12/68f7191f70a16.pdf	application/pdf
31	presses/1/monographs/12/68f7191fc296a.pdf	application/pdf
32	presses/1/monographs/13/68f719659779f.pdf	application/pdf
33	presses/1/monographs/13/68f71965e41ad.pdf	application/pdf
34	presses/1/monographs/13/68f719664275d.pdf	application/pdf
35	presses/1/monographs/14/68f719b89fd82.pdf	application/pdf
36	presses/1/monographs/14/68f719b8ef08a.pdf	application/pdf
37	presses/1/monographs/14/68f719b94ae8d.pdf	application/pdf
38	presses/1/monographs/14/68f719b99be93.pdf	application/pdf
39	presses/1/monographs/14/68f719ba16ac8.pdf	application/pdf
40	presses/1/monographs/14/68f719baa8b80.pdf	application/pdf
41	presses/1/monographs/15/68f71a269154b.pdf	application/pdf
42	presses/1/monographs/16/68f71a402a154.pdf	application/pdf
43	presses/1/monographs/17/68f71a71b0062.pdf	application/pdf
44	presses/1/monographs/17/68f71a72110dc.pdf	application/pdf
45	presses/1/monographs/17/68f71a725be1b.pdf	application/pdf
46	presses/1/monographs/17/68f71a72acf3e.pdf	application/pdf
47	presses/1/monographs/17/68f71a7322882.pdf	application/pdf
48	presses/1/monographs/17/68f71a7382f4f.pdf	application/pdf
\.


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	publicationFormat=>dc11	plugins.metadata.dc11.publicationFormatAdapter.displayName	plugins.metadata.dc11.publicationFormatAdapter.description	class::classes.publicationFormat.PublicationFormat	metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)
2	monographs=>onix30-xml	plugins.importexport.onix30.displayName	plugins.importexport.onix30.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)
3	monograph=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
4	native-xml=>monograph	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.submission.Submission[]
5	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.monograph.Author[]	xml::schema(plugins/importexport/native/native.xsd)
6	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Author[]
7	publication-format=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publicationFormat.PublicationFormat	xml::schema(plugins/importexport/native/native.xsd)
8	native-xml=>PublicationFormat	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publicationFormat.PublicationFormat[]
9	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
10	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SubmissionFile
11	monograph=>onix30-xml	plugins.importexport.onix30.displayName	plugins.importexport.onix30.description	class::classes.submission.Submission	xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)
12	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
13	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication
14	chapter=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.monograph.Chapter[]	xml::schema(plugins/importexport/native/native.xsd)
15	native-xml=>chapter	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Chapter
16	user=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.user.User[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
17	user-xml=>user	plugins.importexport.users.displayName	plugins.importexport.users.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::classes.users.User[]
18	usergroup=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.security.UserGroup[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
19	user-xml=>usergroup	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::lib.pkp.classes.security.UserGroup[]
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
2	2	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
3	3	0	Native XML submission export	plugins.importexport.native.filter.MonographNativeXmlFilter	0	0	0
4	4	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlMonographFilter	0	0	0
5	5	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
6	6	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
7	7	0	Native XML representation export	plugins.importexport.native.filter.PublicationFormatNativeXmlFilter	0	0	0
8	8	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlPublicationFormatFilter	0	0	0
9	10	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlMonographFileFilter	0	0	0
10	9	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
11	11	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
12	12	0	Native XML Publication export	plugins.importexport.native.filter.PublicationNativeXmlFilter	0	0	0
13	13	0	Native XML publication import	plugins.importexport.native.filter.NativeXmlPublicationFilter	0	0	0
14	14	0	Native XML chapter export	plugins.importexport.native.filter.ChapterNativeXmlFilter	0	0	0
15	15	0	Native XML Chapter import	plugins.importexport.native.filter.NativeXmlChapterFilter	0	0	0
16	16	0	User XML user export	lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter	0	0	0
17	17	0	User XML user import	lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter	0	0	0
18	18	0	Native XML user group export	lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter	0	0	0
19	19	0	Native XML user group import	lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter	0	0	0
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
11	fr_CA	name	Photographie	string
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
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
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
15	1	\N	NMI_TYPE_CATALOG
16	1	\N	NMI_TYPE_ANNOUNCEMENTS
17	1	\N	NMI_TYPE_ABOUT
18	1	\N	NMI_TYPE_ABOUT
19	1	\N	NMI_TYPE_SUBMISSIONS
20	1	\N	NMI_TYPE_EDITORIAL_TEAM
21	1	\N	NMI_TYPE_PRIVACY
22	1	\N	NMI_TYPE_CONTACT
23	1	\N	NMI_TYPE_SEARCH
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
1	1048586	1	6	2025-10-21 05:20:50	2025-10-21 05:20:50	Recommendation	<p>Daniel Barnes, David Buskins:<br><br>The recommendation regarding the submission to Public Knowledge Press, "The Information Literacy User’s Guide" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>
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
64	1	3	2	16777217	2025-10-21 05:18:10	\N	1048585	4
65	1	0	2	16777243	2025-10-21 05:18:11	\N	1048585	4
150	1	3	2	16777217	2025-10-21 05:22:11	\N	1048585	8
67	1	0	2	16777236	2025-10-21 05:18:15	2025-10-21 05:18:17	523	3
69	1	9	3	16777227	2025-10-21 05:18:21	\N	517	4
151	1	0	2	16777243	2025-10-21 05:22:11	\N	1048585	8
122	1	24	2	16777229	2025-10-21 05:20:40	\N	1048585	6
152	1	0	2	16777245	2025-10-21 05:22:11	\N	1048585	8
71	1	0	2	16777236	2025-10-21 05:18:23	2025-10-21 05:18:24	523	4
7	0	1	1	1	2025-10-21 05:15:23	\N	0	0
73	1	11	3	16777227	2025-10-21 05:18:28	\N	517	5
255	1	30	2	16777230	2025-10-21 05:27:11	\N	1048585	13
101	1	23	2	16777235	2025-10-21 05:19:37	\N	1048585	5
102	1	3	2	16777254	2025-10-21 05:19:37	\N	1048585	5
11	1	3	2	16777217	2025-10-21 05:15:42	\N	1048585	1
12	1	0	2	16777243	2025-10-21 05:15:42	\N	1048585	1
13	1	0	2	16777245	2025-10-21 05:15:42	\N	1048585	1
14	1	0	2	16777236	2025-10-21 05:15:46	2025-10-21 05:15:47	523	1
16	1	12	3	16777227	2025-10-21 05:15:50	\N	517	1
121	1	0	2	16777236	2025-10-21 05:20:40	2025-10-21 05:20:41	523	7
78	1	22	2	16777235	2025-10-21 05:18:37	\N	1048585	4
18	1	19	2	16777230	2025-10-21 05:15:52	\N	1048585	1
19	1	3	2	16777251	2025-10-21 05:15:52	2025-10-21 05:15:53	1048585	1
79	1	3	2	16777254	2025-10-21 05:18:37	\N	1048585	4
66	1	0	2	16777245	2025-10-21 05:18:11	2025-10-21 05:18:39	1048585	4
50	1	3	2	16777217	2025-10-21 05:17:29	\N	1048585	3
51	1	0	2	16777243	2025-10-21 05:17:29	\N	1048585	3
52	1	0	2	16777245	2025-10-21 05:17:29	\N	1048585	3
105	1	0	2	16777246	2025-10-21 05:19:57	\N	1048585	5
188	1	0	2	16777243	2025-10-21 05:24:03	\N	1048585	11
124	1	3	3	16777249	2025-10-21 05:20:50	\N	1048586	1
87	1	3	2	16777217	2025-10-21 05:19:13	\N	1048585	5
90	1	0	2	16777236	2025-10-21 05:19:17	2025-10-21 05:19:18	523	5
92	1	8	3	16777227	2025-10-21 05:19:22	\N	517	6
167	1	3	2	16777217	2025-10-21 05:22:59	\N	1048585	9
168	1	4	2	16777217	2025-10-21 05:22:59	\N	1048585	9
169	1	0	2	16777243	2025-10-21 05:22:59	\N	1048585	9
94	1	0	2	16777236	2025-10-21 05:19:23	2025-10-21 05:19:25	523	6
96	1	12	3	16777227	2025-10-21 05:19:29	\N	517	7
36	1	3	2	16777217	2025-10-21 05:16:47	\N	1048585	2
37	1	0	2	16777243	2025-10-21 05:16:47	\N	1048585	2
38	1	0	2	16777245	2025-10-21 05:16:47	\N	1048585	2
40	1	20	2	16777231	2025-10-21 05:16:52	\N	1048585	2
39	1	0	2	16777236	2025-10-21 05:16:52	2025-10-21 05:16:54	523	2
41	1	11	3	16777227	2025-10-21 05:16:58	\N	517	2
170	1	0	2	16777245	2025-10-21 05:23:00	\N	1048585	9
125	1	4	3	16777249	2025-10-21 05:20:50	\N	1048586	1
43	1	12	3	16777227	2025-10-21 05:17:02	\N	517	3
172	1	26	2	16777229	2025-10-21 05:23:05	\N	1048585	9
171	1	0	2	16777236	2025-10-21 05:23:05	2025-10-21 05:23:07	523	9
189	1	0	2	16777245	2025-10-21 05:24:03	\N	1048585	11
182	1	3	2	16777217	2025-10-21 05:23:48	\N	1048585	10
140	1	3	2	16777217	2025-10-21 05:21:45	\N	1048585	7
183	1	0	2	16777243	2025-10-21 05:23:48	\N	1048585	10
141	1	0	2	16777243	2025-10-21 05:21:45	\N	1048585	7
184	1	0	2	16777245	2025-10-21 05:23:48	\N	1048585	10
142	1	0	2	16777245	2025-10-21 05:21:45	\N	1048585	7
190	1	0	2	16777236	2025-10-21 05:24:07	2025-10-21 05:24:09	523	10
187	1	3	2	16777217	2025-10-21 05:24:03	\N	1048585	11
117	1	3	2	16777217	2025-10-21 05:20:35	\N	1048585	6
118	1	4	2	16777217	2025-10-21 05:20:35	\N	1048585	6
119	1	0	2	16777243	2025-10-21 05:20:35	\N	1048585	6
120	1	0	2	16777245	2025-10-21 05:20:35	\N	1048585	6
192	1	9	3	16777227	2025-10-21 05:24:12	\N	517	9
143	1	0	2	16777236	2025-10-21 05:21:50	2025-10-21 05:21:52	523	8
145	1	10	3	16777227	2025-10-21 05:21:56	\N	517	8
194	1	0	2	16777236	2025-10-21 05:24:13	2025-10-21 05:24:15	523	11
200	1	3	2	16777219	2025-10-21 05:24:27	\N	517	10
147	1	25	2	16777230	2025-10-21 05:21:58	\N	1048585	7
201	1	3	2	16777219	2025-10-21 05:24:33	\N	517	11
202	1	28	2	16777230	2025-10-21 05:24:39	\N	1048585	11
148	1	3	2	16777251	2025-10-21 05:21:58	2025-10-21 05:22:00	1048585	7
203	1	3	2	16777251	2025-10-21 05:24:39	2025-10-21 05:24:40	1048585	11
217	1	3	2	16777217	2025-10-21 05:25:24	\N	1048585	12
218	1	0	2	16777243	2025-10-21 05:25:24	\N	1048585	12
219	1	0	2	16777245	2025-10-21 05:25:24	\N	1048585	12
221	1	29	2	16777229	2025-10-21 05:25:30	\N	1048585	12
220	1	0	2	16777236	2025-10-21 05:25:30	2025-10-21 05:25:31	523	12
222	1	7	3	16777227	2025-10-21 05:25:35	\N	517	12
256	1	3	2	16777251	2025-10-21 05:27:11	2025-10-21 05:27:13	1048585	13
226	1	9	3	16777227	2025-10-21 05:25:44	\N	517	14
228	1	3	2	16777219	2025-10-21 05:25:50	\N	517	13
267	1	3	2	16777217	2025-10-21 05:27:52	\N	1048585	14
238	1	3	2	16777217	2025-10-21 05:26:24	\N	1048585	13
239	1	0	2	16777243	2025-10-21 05:26:24	\N	1048585	13
240	1	0	2	16777245	2025-10-21 05:26:24	\N	1048585	13
241	1	0	2	16777236	2025-10-21 05:26:29	2025-10-21 05:26:31	523	13
243	1	8	3	16777227	2025-10-21 05:26:34	\N	517	15
245	1	0	2	16777236	2025-10-21 05:26:36	2025-10-21 05:26:38	523	14
270	1	0	2	16777236	2025-10-21 05:27:58	2025-10-21 05:28:00	523	15
272	1	7	3	16777227	2025-10-21 05:28:04	\N	517	19
249	1	11	3	16777227	2025-10-21 05:26:46	\N	517	17
299	1	3	2	16777217	2025-10-21 05:29:54	\N	1048585	16
274	1	0	2	16777236	2025-10-21 05:28:06	2025-10-21 05:28:08	523	16
276	1	11	3	16777227	2025-10-21 05:28:12	\N	517	20
253	1	3	2	16777219	2025-10-21 05:26:56	\N	517	16
254	1	3	2	16777219	2025-10-21 05:27:03	\N	517	18
300	1	0	2	16777243	2025-10-21 05:29:55	\N	1048585	16
301	1	0	2	16777245	2025-10-21 05:29:55	\N	1048585	16
281	1	31	2	16777235	2025-10-21 05:28:21	\N	1048585	14
282	1	3	2	16777254	2025-10-21 05:28:21	\N	1048585	14
303	1	33	2	16777231	2025-10-21 05:30:00	\N	1048585	16
302	1	0	2	16777236	2025-10-21 05:30:00	2025-10-21 05:30:02	523	18
285	1	0	2	16777246	2025-10-21 05:29:04	\N	1048585	14
306	1	11	3	16777227	2025-10-21 05:30:09	\N	517	22
289	1	3	2	16777217	2025-10-21 05:29:23	\N	1048585	15
290	1	0	2	16777243	2025-10-21 05:29:23	\N	1048585	15
291	1	0	2	16777245	2025-10-21 05:29:23	\N	1048585	15
293	1	32	2	16777231	2025-10-21 05:29:28	\N	1048585	15
292	1	0	2	16777236	2025-10-21 05:29:28	2025-10-21 05:29:29	523	17
308	1	12	3	16777227	2025-10-21 05:30:13	\N	517	23
310	1	3	2	16777219	2025-10-21 05:30:19	\N	517	21
330	1	3	2	16777217	2025-10-21 05:31:25	\N	1048585	17
331	1	0	2	16777243	2025-10-21 05:31:25	\N	1048585	17
332	1	0	2	16777245	2025-10-21 05:31:25	\N	1048585	17
334	1	34	2	16777229	2025-10-21 05:31:33	\N	1048585	17
333	1	0	2	16777236	2025-10-21 05:31:33	2025-10-21 05:31:35	523	19
335	1	7	3	16777227	2025-10-21 05:31:39	\N	517	24
337	1	8	3	16777227	2025-10-21 05:31:44	\N	517	25
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
developedbyblockplugin	0	context	1	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
languagetoggleblockplugin	0	context	1	int
acronplugin	0	crontab	[{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"lib.pkp.classes.task.ReviewReminder","frequency":{"hour":24},"args":[]},{"className":"lib.pkp.classes.task.PublishSubmissions","frequency":{"hour":24},"args":[]},{"className":"lib.pkp.classes.task.StatisticsReport","frequency":{"day":"1"},"args":[]}]	object
tinymceplugin	1	enabled	1	bool
defaultthemeplugin	1	enabled	1	bool
informationblockplugin	1	enabled	1	bool
informationblockplugin	1	seq	7	int
informationblockplugin	1	context	1	int
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
developedbyblockplugin	1	context	1	int
browseblockplugin	1	enabled	1	bool
browseblockplugin	1	seq	1	int
browseblockplugin	1	context	1	int
browseblockplugin	1	browseNewReleases	1	bool
browseblockplugin	1	browseCategories	1	bool
browseblockplugin	1	browseSeries	1	bool
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
languagetoggleblockplugin	1	context	1	int
pdfjsviewerplugin	1	enabled	1	bool
htmlmonographfileplugin	1	enabled	1	bool
dublincoremetaplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	displayItems	1	bool
googlescholarplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	68f71647c3589	string
defaultthemeplugin	1	typography	notoSans	string
defaultthemeplugin	1	useHomepageImageAsHeader	false	string
defaultthemeplugin	1	baseColour	#1E6292	string
\.


--
-- Data for Name: press_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.press_settings (press_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	fr_CA	submissionChecklist	[{"order":1,"content":"Cette soumission n'a jamais été publiée et n'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef)."},{"order":2,"content":"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument."},{"order":3,"content":"Les adresses URL des références ont été fournies si elles étaient disponibles."},{"order":4,"content":"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu'à la fin."},{"order":5,"content":"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\" target=\\"_blank\\">lignes directrices à l'intention des auteurs<\\/a>, disponibles dans la rubrique À propos de cette presse."}]	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1	fr_CA	librarianInformation	Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1	en_US	name	Public Knowledge Press	\N
1		numWeeksPerReview	4	\N
1	en_US	openAccessPolicy	This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	openAccessPolicy	Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l'échelle mondiale.	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>	\N
1	fr_CA	privacyStatement	<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d'autres fins ou transmis à une tierce partie.</p>	\N
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this press. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.	\N
1	fr_CA	readerInformation	Nous encourageons les lecteurs à s'abonner au service d'avis de publication de cette presse. Utilisez le lien <a href="http://localhost/index.php/publicknowledge/user/register">d'inscription</a> situé en haut de la page d'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d'affirmer qu'elle compte un certain nombre de lecteurs. Consultez <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">l'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d'autres fins.	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor)."},{"order":2,"content":"The submission file is in the Microsoft Word, RTF, or OpenDocument file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\" target=\\"_blank\\">Author Guidelines<\\/a>, which is found in About the Press."}]	\N
1		defaultReviewMode	2	\N
1		emailSignature	<br/>\n________________________________________________________________________<br/>\n<a href="{$ldelim}$contextUrl{$rdelim}">{$ldelim}$contextName{$rdelim}</a>	\N
1		disableSubmissions	0	\N
1		itemsPerPage	25	\N
1	fr_CA	name	Press de la connaissance du public	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		keywords	request	\N
1	en_US	librarianInformation	We encourage research librarians to list this press among their library's electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1	fr_CA	authorInformation	Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href="http://localhost/index.php/publicknowledge/about">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Lignes directrices à l'intention des auteurs-es</a>. Les auteurs-es doivent <a href="http://localhost/index.php/publicknowledge/user/register">s'inscrire</a> auprès de la presse avant d'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href="http://localhost/index.php/index/login">d'ouvrir une session</a> pour débuter la procédure en 5 étapes.	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	searchDescription	Public Knowledge Press is a publisher dedicated to the subject of public access to science.	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1		themePluginPath	default	\N
1		type	enable	\N
1		coverThumbnailsMaxWidth	106	\N
1		coverThumbnailsMaxHeight	100	\N
1		paymentPluginName	ManualPayment	\N
1	en_US	acronym	JPK	\N
1	en_US	authorInformation	Interested in submitting to this press? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About the Press</a> page for the press' section policies and <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> with the press prior to submitting, or if already registered can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the 5 step process.	\N
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
5	en_US	prefix	
5	fr_CA	prefix	
1	en_US	abstract	<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>
1	fr_CA	abstract	
1		categoryIds	[]
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The ABCs of Human Survival: A Paradigm for Global Citizenship
1	fr_CA	title	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Bomb Canada and Other Unkind Remarks in the American Media
5	fr_CA	title	
8	en_US	abstract	<p>A Note From The Publisher</p>
7	en_US	abstract	<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>
7	fr_CA	abstract	
2	en_US	abstract	<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>
2	fr_CA	abstract	
2		categoryIds	[]
2	en_US	prefix	
2	fr_CA	prefix	
2	en_US	subtitle	
2	fr_CA	subtitle	
2	en_US	title	The West and Beyond: New Perspectives on an Imagined Region
2	fr_CA	title	
7		categoryIds	[]
6	en_US	abstract	<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>
3	en_US	abstract	<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>
3	fr_CA	abstract	
3		categoryIds	[]
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	The Political Economy of Workplace Injury in Canada
3	fr_CA	title	
6	fr_CA	abstract	
6		categoryIds	[]
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
4	en_US	abstract	<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>
4	fr_CA	abstract	
4		categoryIds	[]
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	How Canadians Communicate: Contexts of Canadian Popular Culture
4	fr_CA	title	
6	fr_CA	subtitle	
6	en_US	title	The Information Literacy User’s Guide
6	fr_CA	title	
5	en_US	abstract	<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	copyrightHolder	Public Knowledge Press
5	fr_CA	copyrightHolder	Press de la connaissance du public
5		copyrightYear	2025
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Accessible Elements: Teaching Science Online and at a Distance
7	fr_CA	title	
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Editorial
8	fr_CA	title	
9		categoryIds	[]
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
10		categoryIds	[]
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Lost Tracks: Buffalo National Park, 1909-1939
10	fr_CA	title	
11	en_US	abstract	<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Dreamwork
11	fr_CA	title	
14	en_US	abstract	<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>
14	fr_CA	abstract	
14		categoryIds	[]
14	en_US	copyrightHolder	Public Knowledge Press
14	fr_CA	copyrightHolder	Press de la connaissance du public
14		copyrightYear	2025
12	en_US	abstract	<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>
12	fr_CA	abstract	
12		categoryIds	[]
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Connecting ICTs to Development
12	fr_CA	title	
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots
13	en_US	abstract	<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>
13	fr_CA	abstract	
13		categoryIds	[]
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Mobile Learning: Transforming the Delivery of Education and Training
13	fr_CA	title	
14	fr_CA	title	
15		categoryIds	[]
15	en_US	abstract	<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>
15	fr_CA	abstract	
15	en_US	prefix	
15	fr_CA	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978
15	fr_CA	title	
16		categoryIds	[]
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
17		categoryIds	[]
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
1	\N	2025-10-21 05:15:41	\N	1	pub	publication	0	\N	\N	1	1	\N	1
12	\N	2025-10-21 05:25:23	\N	33	pub	publication	0	\N	\N	12	1	\N	1
2	\N	2025-10-21 05:16:46	\N	2	pub	publication	0	\N	\N	2	1	\N	1
3	\N	2025-10-21 05:17:29	\N	10	pub	publication	0	\N	\N	3	1	\N	1
13	\N	2025-10-21 05:26:23	\N	41	pub	publication	0	\N	\N	13	1	\N	1
4	\N	2025-10-21 05:18:09	\N	11	pub	publication	0	3	\N	4	1	\N	1
5	2025-10-21	2025-10-21 05:19:56	\N	15	pub	publication	0	\N	\N	5	3	\N	1
14	2025-10-21	2025-10-21 05:29:04	\N	45	pub	publication	0	5	\N	14	3	\N	1
6	\N	2025-10-21 05:20:34	\N	16	pub	publication	0	1	\N	6	1	\N	1
15	\N	2025-10-21 05:29:22	\N	48	pub	publication	0	\N	\N	15	1	\N	1
7	\N	2025-10-21 05:21:44	\N	20	pub	publication	0	4	\N	7	1	\N	1
16	\N	2025-10-21 05:29:54	\N	49	pub	publication	0	\N	\N	16	1	\N	1
8	\N	2025-10-21 05:22:10	\N	25	pub	publication	0	\N	\N	8	1	\N	1
9	\N	2025-10-21 05:22:58	\N	26	pub	publication	0	1	\N	9	1	\N	1
10	\N	2025-10-21 05:23:47	\N	31	pub	publication	0	\N	\N	10	1	\N	1
17	\N	2025-10-21 05:31:24	\N	50	pub	publication	0	\N	\N	17	1	\N	1
11	\N	2025-10-21 05:24:02	\N	32	pub	publication	0	\N	\N	11	1	\N	1
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
1	4
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
15	13	8	\N	\N	2025-10-21 05:26:34	2025-10-21 05:26:34	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:26:34	0	0	0	\N	\N	\N	\N	13	2	2	1	1	\N	0
1	1	12	\N	\N	2025-10-21 05:15:50	2025-10-21 05:15:50	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:15:50	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0
2	2	11	\N	\N	2025-10-21 05:16:58	2025-10-21 05:16:58	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:16:58	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
3	2	12	\N	\N	2025-10-21 05:17:02	2025-10-21 05:17:02	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:17:02	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
24	17	7	\N	\N	2025-10-21 05:31:39	2025-10-21 05:31:39	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:31:39	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0
4	4	9	\N	\N	2025-10-21 05:18:21	2025-10-21 05:18:21	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:18:21	0	0	0	\N	\N	\N	\N	3	2	2	1	1	\N	0
5	4	11	\N	\N	2025-10-21 05:18:28	2025-10-21 05:18:28	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:18:28	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
6	5	8	\N	\N	2025-10-21 05:19:22	2025-10-21 05:19:22	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:19:22	0	0	0	\N	\N	\N	\N	5	2	2	1	1	\N	0
17	13	11	\N	\N	2025-10-21 05:26:46	2025-10-21 05:26:46	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:26:46	0	0	0	\N	\N	\N	\N	14	3	2	1	1	\N	0
7	5	12	\N	\N	2025-10-21 05:19:29	2025-10-21 05:19:29	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:19:29	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
8	7	10	\N	\N	2025-10-21 05:21:56	2025-10-21 05:21:56	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:21:56	0	0	0	\N	\N	\N	\N	8	3	2	1	1	\N	0
9	11	9	\N	\N	2025-10-21 05:24:12	2025-10-21 05:24:12	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:24:12	0	0	0	\N	\N	\N	\N	10	2	2	1	1	\N	0
25	17	8	\N	\N	2025-10-21 05:31:44	2025-10-21 05:31:44	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:31:44	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0
16	13	10	\N	0	2025-10-21 05:26:41	2025-10-21 05:26:41	2025-10-21 05:26:53	2025-10-21 05:26:56	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:26:56	0	0	0	\N	\N	\N	0	14	3	2	1	4	\N	0
10	11	10	\N	0	2025-10-21 05:24:17	2025-10-21 05:24:18	2025-10-21 05:24:24	2025-10-21 05:24:27	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:24:27	0	0	0	\N	\N	\N	0	11	3	2	1	4	\N	0
18	13	12	\N	0	2025-10-21 05:26:50	2025-10-21 05:26:50	2025-10-21 05:27:00	2025-10-21 05:27:03	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:27:03	0	0	0	\N	\N	\N	0	14	3	2	1	4	\N	0
11	11	12	\N	0	2025-10-21 05:24:21	2025-10-21 05:24:21	2025-10-21 05:24:30	2025-10-21 05:24:33	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:24:33	0	0	0	\N	\N	\N	0	11	3	2	1	4	\N	0
12	12	7	\N	\N	2025-10-21 05:25:35	2025-10-21 05:25:35	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:25:35	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0
19	14	7	\N	\N	2025-10-21 05:28:04	2025-10-21 05:28:04	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:28:04	0	0	0	\N	\N	\N	\N	15	2	2	1	1	\N	0
14	12	9	\N	\N	2025-10-21 05:25:44	2025-10-21 05:25:44	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:25:44	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0
20	14	11	\N	\N	2025-10-21 05:28:12	2025-10-21 05:28:12	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:28:12	0	0	0	\N	\N	\N	\N	16	3	2	1	1	\N	0
13	12	8	\N	0	2025-10-21 05:25:39	2025-10-21 05:25:39	2025-10-21 05:25:47	2025-10-21 05:25:50	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:25:50	0	0	0	\N	\N	\N	0	12	2	2	1	4	\N	0
22	16	11	\N	\N	2025-10-21 05:30:09	2025-10-21 05:30:09	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:30:09	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0
23	16	12	\N	\N	2025-10-21 05:30:12	2025-10-21 05:30:13	\N	\N	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:30:13	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0
21	16	10	\N	0	2025-10-21 05:30:05	2025-10-21 05:30:05	2025-10-21 05:30:16	2025-10-21 05:30:19	\N	2025-11-18 00:00:00	2025-11-18 00:00:00	2025-10-21 05:30:19	0	0	0	\N	\N	\N	0	18	3	2	1	4	\N	0
\.


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_files (review_id, submission_file_id) FROM stdin;
1	2
2	7
2	8
2	9
2	10
3	7
3	8
3	9
3	10
4	16
4	17
4	18
4	19
8	35
8	36
8	37
8	38
8	39
9	53
19	66
19	67
19	68
19	69
19	70
19	71
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

COPY public.review_round_files (submission_id, review_round_id, stage_id, submission_file_id) FROM stdin;
1	1	3	2
2	2	3	7
2	2	3	8
2	2	3	9
2	2	3	10
4	3	2	16
4	3	2	17
4	3	2	18
4	3	2	19
6	7	2	26
6	7	2	27
6	7	2	28
6	7	2	29
7	8	3	35
7	8	3	36
7	8	3	37
7	8	3	38
7	8	3	39
9	9	2	46
9	9	2	47
9	9	2	48
9	9	2	49
9	9	2	50
11	10	2	53
14	15	2	66
14	15	2	67
14	15	2	68
14	15	2	69
14	15	2	70
14	15	2	71
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
plugins.generic.usageStats.UsageStatsLoader	2025-10-21 05:12:28
lib.pkp.classes.task.ReviewReminder	2025-10-21 05:12:28
lib.pkp.classes.task.PublishSubmissions	2025-10-21 05:12:28
lib.pkp.classes.task.StatisticsReport	2025-10-21 05:12:28
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.series (series_id, press_id, review_form_id, seq, featured, editor_restricted, path, image, is_inactive) FROM stdin;
1	1	\N	0	0	0	lis	a:0:{}	0
2	1	\N	0	0	0	pe	a:0:{}	0
3	1	\N	0	0	0	his	a:0:{}	0
4	1	\N	0	0	0	ed	a:0:{}	0
5	1	\N	0	0	0	psy	a:0:{}	0
\.


--
-- Data for Name: series_categories; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.series_categories (series_id, category_id) FROM stdin;
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
0o961vr3u169qbcknffiroq540	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023547	1761023547	0		localhost
1um6okomfcgnn3v10u6imb0v7b	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024125	1761024131	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1761024131;s:5:"token";s:32:"7995821c9a1260eebfa6a7b3b55d6866";}	localhost
qu4t3h5rl1erjnrcb68ciuhbhr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024056	1761024124	0	csrf|a:2:{s:9:"timestamp";i:1761024124;s:5:"token";s:32:"66be870673a2a4331d428faff4dad1dc";}username|s:7:"dbarnes";userId|i:3;	localhost
hd597tdqakcetp910ompvbvsev	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023559	1761023569	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1761023569;s:5:"token";s:32:"bbcb27cc76d34a7690c89a28f3fa5297";}	localhost
vqc5q8rfhaf71r7n1pfimc52hj	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023580	1761023583	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1761023582;s:5:"token";s:32:"712bfb40fa5494f246b3ee7ae852a0c1";}	localhost
q018hpbrv88u4n49vi33010207	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024545	1761024570	0	csrf|a:2:{s:9:"timestamp";i:1761024570;s:5:"token";s:32:"26ba791a0bbfffd907afb54f9a54e29f";}username|s:7:"dbarnes";userId|i:3;	localhost
l8c2387iim2sk9ntbueuj8duib	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023548	1761023559	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1761023559;s:5:"token";s:32:"26095dbcc034ad705b830327dd52f0ae";}	localhost
98t6h9tt5omc2kel4preh40tgq	27	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024188	1761024228	0	csrf|a:2:{s:9:"timestamp";i:1761024228;s:5:"token";s:32:"9ab4cd2a6b64725f73fe1ec6de3f4492";}username|s:7:"jbrower";userId|i:27;	localhost
m7etacjg2475ppp3p6ndqhh6rq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024132	1761024187	0	csrf|a:2:{s:9:"timestamp";i:1761024188;s:5:"token";s:32:"6e0b1b74406f3edbd23773e428786ca3";}username|s:7:"dbarnes";userId|i:3;	localhost
mq67lst6m0rspfkbpjj9226iqf	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023569	1761023573	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1761023573;s:5:"token";s:32:"359ce2594f2f0d224b5825141ead4a1a";}	localhost
25s8u05fu0i4ojumdc9o31893e	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023573	1761023580	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1761023580;s:5:"token";s:32:"2f369ffaf484bae2ed0011378c8776b2";}	localhost
lghs14fav8rvgm3rps9lmgjpt4	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023584	1761023709	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1761023709;s:5:"token";s:32:"e5dd37188e5bea0a658da2a27dff0f9c";}	localhost
8afi5kbju4a43fscsolecdeqm9	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023711	1761023723	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1761023723;s:5:"token";s:32:"55bee5ed742c7621e4766b89a77caa60";}	localhost
el4c15qp2fe12lgvuupo2skgk9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023724	1761023756	0	csrf|a:2:{s:9:"timestamp";i:1761023756;s:5:"token";s:32:"e60f9a278a279a4fb43cba50b1e62e8d";}username|s:7:"dbarnes";userId|i:3;	localhost
ko56qjg6otbgh67rdtat2bek23	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023757	1761023823	0	csrf|a:2:{s:9:"timestamp";i:1761023822;s:5:"token";s:32:"72f8469a27b18f8d2fb339b9ccc42327";}username|s:7:"dbarnes";userId|i:3;	localhost
aebovupbb39jvp43f80qnrsm7t	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024229	1761024281	0	csrf|a:2:{s:9:"timestamp";i:1761024281;s:5:"token";s:32:"9026c6eaff86961bbbe544a069fae4f7";}username|s:7:"dbarnes";userId|i:3;	localhost
tvhd9hifg79bjgeqev90nij834	21	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023824	1761023849	0	csrf|a:2:{s:9:"timestamp";i:1761023849;s:5:"token";s:32:"3b9eb494527470e1ab6af65d951ace0b";}username|s:10:"bbarnetson";userId|i:21;	localhost
9nbgpckh4c8jmvbdsj3hcjgfpj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023851	1761023923	0	csrf|a:2:{s:9:"timestamp";i:1761023923;s:5:"token";s:32:"700d6946e17d6a4b2ec7c76cec9ea886";}username|s:7:"dbarnes";userId|i:3;	localhost
vbkntmbhhpe8qoddnfioupgvlp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023924	1761023996	0	csrf|a:2:{s:9:"timestamp";i:1761023996;s:5:"token";s:32:"a3cc8e99b7d6679a2c7586f7087f492e";}username|s:7:"dbarnes";userId|i:3;	localhost
7t1t3ucif6dn0cvla3isdsl4vf	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024282	1761024351	0	csrf|a:2:{s:9:"timestamp";i:1761024351;s:5:"token";s:32:"f4ebe1344422140d074ba2dbe7173ed2";}username|s:7:"phudson";	localhost
1456ps1j5gkklc3u0frm875k7b	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761023998	1761024055	0	csrf|a:2:{s:9:"timestamp";i:1761024055;s:5:"token";s:32:"3218379d99ea018904821537617e7bb2";}username|s:7:"dbarnes";userId|i:3;	localhost
i3e77b82c1th48iflufqd6tjbu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024352	1761024433	0	csrf|a:2:{s:9:"timestamp";i:1761024434;s:5:"token";s:32:"3908f9f2303dd5cd8bf2b841d236f610";}username|s:7:"dbarnes";userId|i:3;	localhost
dv4g08heftq19ldig43gium0h3	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024571	1761024619	0	csrf|a:2:{s:9:"timestamp";i:1761024619;s:5:"token";s:32:"4f888718033863bd1b1c7b6457f4005c";}username|s:8:"agallego";	localhost
is5p52hcn1mqvpd2vn6sfb8oug	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024435	1761024544	0	csrf|a:2:{s:9:"timestamp";i:1761024544;s:5:"token";s:32:"85840f9d712ca8dba3343333dc48795f";}username|s:7:"dbarnes";userId|i:3;	localhost
drglh5c5bf4nqd38gms25n23ao	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/140.0.0.0 Safari/537.36	1761024620	1761024704	0	csrf|a:2:{s:9:"timestamp";i:1761024704;s:5:"token";s:32:"a7070ebbffbb18e6946a3cebdd147a78";}username|s:7:"dbarnes";userId|i:3;	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.site (redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
0	en_US	6	["en_US","fr_CA"]	["en_US","fr_CA"]	\N
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
1	1	13	19	2025-10-21 05:15:29	0	0
2	1	3	3	2025-10-21 05:15:42	0	1
3	1	6	14	2025-10-21 05:15:55	0	0
4	2	14	20	2025-10-21 05:16:02	0	0
5	2	3	3	2025-10-21 05:16:47	0	1
6	3	13	21	2025-10-21 05:17:09	0	0
7	3	3	3	2025-10-21 05:17:29	0	1
8	4	14	22	2025-10-21 05:17:35	0	0
9	4	3	3	2025-10-21 05:18:10	0	1
10	4	6	13	2025-10-21 05:18:35	0	0
11	4	10	15	2025-10-21 05:18:42	0	0
12	5	13	23	2025-10-21 05:18:48	0	0
13	5	3	3	2025-10-21 05:19:13	0	1
14	5	6	14	2025-10-21 05:19:34	0	0
15	5	10	16	2025-10-21 05:19:41	0	0
16	5	12	17	2025-10-21 05:19:44	0	0
17	6	14	24	2025-10-21 05:20:02	0	0
18	6	3	3	2025-10-21 05:20:35	0	1
19	6	5	4	2025-10-21 05:20:35	0	1
20	6	5	6	2025-10-21 05:20:44	1	1
21	7	14	25	2025-10-21 05:21:00	0	0
22	7	3	3	2025-10-21 05:21:45	0	1
23	7	6	13	2025-10-21 05:22:03	0	0
24	8	13	3	2025-10-21 05:22:08	0	0
25	8	3	3	2025-10-21 05:22:11	0	1
26	9	14	26	2025-10-21 05:22:16	0	0
27	9	3	3	2025-10-21 05:22:59	0	1
28	9	5	4	2025-10-21 05:22:59	0	1
29	10	13	27	2025-10-21 05:23:13	0	0
30	10	3	3	2025-10-21 05:23:48	0	1
31	11	13	28	2025-10-21 05:23:54	0	0
32	11	3	3	2025-10-21 05:24:03	0	1
33	12	14	29	2025-10-21 05:24:46	0	0
34	12	3	3	2025-10-21 05:25:24	0	1
35	13	14	30	2025-10-21 05:25:56	0	0
36	13	3	3	2025-10-21 05:26:24	0	1
37	14	14	31	2025-10-21 05:27:19	0	0
38	14	3	3	2025-10-21 05:27:52	0	1
39	14	6	13	2025-10-21 05:28:18	0	0
40	14	10	15	2025-10-21 05:28:25	0	0
41	14	12	18	2025-10-21 05:28:29	0	0
42	15	13	32	2025-10-21 05:29:09	0	0
43	15	3	3	2025-10-21 05:29:23	0	1
44	16	13	33	2025-10-21 05:29:35	0	0
45	16	3	3	2025-10-21 05:29:54	0	1
46	17	14	34	2025-10-21 05:30:24	0	0
47	17	3	3	2025-10-21 05:31:25	0	1
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
-- Data for Name: subeditor_submission_group; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.subeditor_submission_group (context_id, assoc_id, assoc_type, user_id) FROM stdin;
1	1	530	4
1	2	530	5
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
17	\N	5	1
18	\N	5	2
1	\N	1	1
2	\N	1	2
3	\N	1	3
19	\N	5	3
20	\N	5	4
21	\N	5	5
22	\N	5	6
4	\N	2	1
5	\N	2	2
6	\N	2	3
7	\N	2	4
23	\N	6	1
24	\N	6	2
25	\N	6	3
8	\N	3	1
9	\N	3	2
10	\N	3	3
11	\N	3	4
12	\N	3	5
26	\N	6	4
13	\N	4	1
14	\N	4	2
15	\N	4	3
16	\N	4	4
54	\N	14	1
55	\N	14	2
56	\N	14	3
57	\N	14	4
27	\N	7	1
28	\N	7	2
29	\N	7	3
30	\N	7	4
31	\N	7	5
58	\N	15	1
59	\N	15	2
60	\N	15	3
32	\N	9	1
33	\N	9	2
34	\N	9	3
35	\N	9	4
36	\N	9	5
37	\N	10	1
38	\N	10	2
39	\N	10	3
40	\N	10	4
41	\N	10	5
42	\N	10	6
43	\N	10	7
44	\N	10	8
45	\N	10	9
46	\N	11	1
47	\N	11	2
48	\N	12	1
49	\N	12	2
61	\N	16	1
50	\N	12	3
62	\N	16	2
63	\N	16	3
64	\N	16	4
65	\N	16	5
51	\N	13	1
52	\N	13	2
53	\N	13	3
66	\N	17	1
67	\N	17	2
68	\N	17	3
69	\N	17	4
70	\N	17	5
71	\N	17	6
\.


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
1	1	4096	11	10	10		<p>I recommend that the author revise this submission.</p>	2025-10-21 05:24:27	\N	1
2	1	4096	11	11	12		<p>I recommend that the author resubmit this submission.</p>	2025-10-21 05:24:33	\N	1
3	1	4096	12	13	8		<p>I recommend declining this submission.</p>	2025-10-21 05:25:50	\N	1
4	1	4096	13	16	10		<p>I recommend requiring revisions.</p>	2025-10-21 05:26:56	\N	1
5	1	4096	13	18	12		<p>I recommend resubmitting.</p>	2025-10-21 05:27:03	\N	1
6	1	4096	16	21	10		<p>I recommend that the author revise this submission.</p>	2025-10-21 05:30:19	\N	1
\.


--
-- Data for Name: submission_file_revisions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_file_revisions (revision_id, submission_file_id, file_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	3
5	5	4
6	6	5
7	7	2
8	8	3
9	9	4
10	10	5
11	11	6
12	12	7
13	13	8
14	14	9
15	15	10
16	16	7
17	17	8
18	18	9
19	19	10
20	20	11
21	21	11
22	22	12
23	23	13
24	24	14
25	25	15
26	26	12
27	27	13
28	28	14
29	29	15
30	30	16
31	31	17
32	32	18
33	33	19
34	34	20
35	35	16
36	36	17
37	37	18
38	38	19
39	39	20
40	40	21
41	41	22
42	42	23
43	43	24
44	44	25
45	45	26
46	46	22
47	47	23
48	48	24
49	49	25
50	50	26
51	51	27
52	52	28
53	53	28
54	54	29
55	55	30
56	56	31
57	57	32
58	58	33
59	59	34
60	60	35
61	61	36
62	62	37
63	63	38
64	64	39
65	65	40
66	66	35
67	67	36
68	68	37
69	69	38
70	70	39
71	71	40
72	72	35
73	73	36
74	74	37
75	75	38
76	76	39
77	77	40
78	78	41
79	79	42
80	80	43
81	81	44
82	82	45
83	83	46
84	84	47
85	85	48
\.


--
-- Data for Name: submission_file_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_file_settings (submission_file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
2	en_US	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
3	en_US	name	Critical History in Western Canada 1900–.pdf	string
4	en_US	name	Vernacular Currents in Western Canadian .pdf	string
5	en_US	name	Cree Intellectual Traditions in History.pdf	string
6	en_US	name	Visualizing Space, Race, and History in .pdf	string
3		chapterId	4	string
4		chapterId	5	string
5		chapterId	6	string
6		chapterId	7	string
7	en_US	name	Critical History in Western Canada 1900–.pdf	string
7		chapterId	4	string
8	en_US	name	Vernacular Currents in Western Canadian .pdf	string
8		chapterId	5	string
9	en_US	name	Cree Intellectual Traditions in History.pdf	string
9		chapterId	6	string
10	en_US	name	Visualizing Space, Race, and History in .pdf	string
10		chapterId	7	string
11	en_US	name	The Political Economy of Workplace Injury in Canada.pdf	string
12	en_US	name	Introduction: Contexts of Popular Cultur.pdf	string
13	en_US	name	Chapter 1. A Future for Media Studies: C.pdf	string
14	en_US	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
15	en_US	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
12		chapterId	13	string
13		chapterId	14	string
14		chapterId	15	string
15		chapterId	16	string
16	en_US	name	Introduction: Contexts of Popular Cultur.pdf	string
16		chapterId	13	string
17	en_US	name	Chapter 1. A Future for Media Studies: C.pdf	string
17		chapterId	14	string
18	en_US	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
18		chapterId	15	string
19	en_US	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
19		chapterId	16	string
20	en_US	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
33		chapterId	30	string
21	en_US	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
22	en_US	name	Identify: Understanding Your Information.pdf	string
23	en_US	name	Scope: Knowing What Is Available.pdf	string
24	en_US	name	Plan: Developing Research Strategies.pdf	string
25	en_US	name	Gather: Finding What You Need.pdf	string
22		chapterId	23	string
23		chapterId	24	string
24		chapterId	25	string
25		chapterId	26	string
26	en_US	name	Identify: Understanding Your Information.pdf	string
26		chapterId	23	string
27	en_US	name	Scope: Knowing What Is Available.pdf	string
27		chapterId	24	string
28	en_US	name	Plan: Developing Research Strategies.pdf	string
28		chapterId	25	string
29	en_US	name	Gather: Finding What You Need.pdf	string
29		chapterId	26	string
30	en_US	name	Introduction.pdf	string
31	en_US	name	Chapter 1: Interactions Affording Distan.pdf	string
32	en_US	name	Chapter 2: Learning Science at a Distanc.pdf	string
33	en_US	name	Chapter 3: Leadership Strategies for Coo.pdf	string
34	en_US	name	Chapter 4: Toward New Models of Flexible.pdf	string
30		chapterId	27	string
31		chapterId	28	string
32		chapterId	29	string
34		chapterId	31	string
35	en_US	name	Introduction.pdf	string
35		chapterId	27	string
36	en_US	name	Chapter 1: Interactions Affording Distan.pdf	string
36		chapterId	28	string
37	en_US	name	Chapter 2: Learning Science at a Distanc.pdf	string
37		chapterId	29	string
38	en_US	name	Chapter 3: Leadership Strategies for Coo.pdf	string
38		chapterId	30	string
39	en_US	name	Chapter 4: Toward New Models of Flexible.pdf	string
39		chapterId	31	string
40	en_US	name	Editorial.pdf	string
41	en_US	name	Internet, openness and the future of the.pdf	string
42	en_US	name	Imagining the Internet: Open, closed or .pdf	string
43	en_US	name	The internet in LAC will remain free, pu.pdf	string
44	en_US	name	Free Internet?.pdf	string
45	en_US	name	Risks and challenges for freedom of expr.pdf	string
41		chapterId	32	string
42		chapterId	33	string
43		chapterId	34	string
44		chapterId	35	string
45		chapterId	36	string
46	en_US	name	Internet, openness and the future of the.pdf	string
46		chapterId	32	string
47	en_US	name	Imagining the Internet: Open, closed or .pdf	string
47		chapterId	33	string
48	en_US	name	The internet in LAC will remain free, pu.pdf	string
48		chapterId	34	string
49	en_US	name	Free Internet?.pdf	string
49		chapterId	35	string
50	en_US	name	Risks and challenges for freedom of expr.pdf	string
50		chapterId	36	string
51	en_US	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
52	en_US	name	Dreamwork.pdf	string
53	en_US	name	Dreamwork.pdf	string
54	en_US	name	Catalyzing Access through Social and Tec.pdf	string
55	en_US	name	Catalyzing Access via Telecommunications.pdf	string
56	en_US	name	Access to Knowledge as a New Paradigm fo.pdf	string
54		chapterId	48	string
55		chapterId	49	string
56		chapterId	50	string
57	en_US	name	Current State of Mobile Learning.pdf	string
58	en_US	name	A Model for Framing Mobile Learning.pdf	string
59	en_US	name	Mobile Distance Learning with PDAs: Deve.pdf	string
57		chapterId	51	string
58		chapterId	52	string
59		chapterId	53	string
60	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
61	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
62	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
63	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
64	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
65	en_US	name	The Canadian Nutrient File: Nutrient Val.pdf	string
60		chapterId	54	string
61		chapterId	55	string
62		chapterId	56	string
63		chapterId	57	string
66	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
66		chapterId	54	string
67	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
67		chapterId	55	string
68	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
68		chapterId	56	string
69	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
69		chapterId	57	string
70	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
71	en_US	name	The Canadian Nutrient File: Nutrient Val.pdf	string
84	en_US	name	Transparency and Development: Ethical Co.pdf	string
72	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
72		chapterId	54	string
85	en_US	name	Open Educational Resources: Opportunitie.pdf	string
80		chapterId	66	string
73	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
73		chapterId	55	string
81		chapterId	67	string
82		chapterId	68	string
74	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
74		chapterId	56	string
83		chapterId	69	string
84		chapterId	70	string
75	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
75		chapterId	57	string
85		chapterId	71	string
76	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
77	en_US	name	The Canadian Nutrient File: Nutrient Val.pdf	string
78	en_US	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
79	en_US	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
80	en_US	name	Preface.pdf	string
81	en_US	name	Introduction.pdf	string
82	en_US	name	The Emergence of Open Development in a N.pdf	string
83	en_US	name	Enacting Openness in ICT4D Research.pdf	string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	1	\N	3	2	\N	\N	\N	2025-10-21 05:15:29	2025-10-21 05:15:30	19	\N	\N
2	1	1	1	3	4	\N	\N	\N	2025-10-21 05:15:46	2025-10-21 05:15:46	19	\N	\N
3	2	2	\N	4	2	\N	\N	\N	2025-10-21 05:16:02	2025-10-21 05:16:03	20	\N	\N
4	2	3	\N	4	2	\N	\N	\N	2025-10-21 05:16:03	2025-10-21 05:16:03	20	\N	\N
5	2	4	\N	4	2	\N	\N	\N	2025-10-21 05:16:03	2025-10-21 05:16:03	20	\N	\N
6	2	5	\N	4	2	\N	\N	\N	2025-10-21 05:16:03	2025-10-21 05:16:04	20	\N	\N
7	2	2	3	4	4	\N	\N	\N	2025-10-21 05:16:52	2025-10-21 05:16:52	20	\N	\N
8	2	3	4	4	4	\N	\N	\N	2025-10-21 05:16:52	2025-10-21 05:16:52	20	\N	\N
9	2	4	5	4	4	\N	\N	\N	2025-10-21 05:16:52	2025-10-21 05:16:52	20	\N	\N
10	2	5	6	4	4	\N	\N	\N	2025-10-21 05:16:52	2025-10-21 05:16:52	20	\N	\N
11	3	6	\N	3	2	\N	\N	\N	2025-10-21 05:17:09	2025-10-21 05:17:09	21	\N	\N
12	4	7	\N	4	2	\N	\N	\N	2025-10-21 05:17:36	2025-10-21 05:17:36	22	\N	\N
13	4	8	\N	4	2	\N	\N	\N	2025-10-21 05:17:36	2025-10-21 05:17:36	22	\N	\N
14	4	9	\N	4	2	\N	\N	\N	2025-10-21 05:17:37	2025-10-21 05:17:37	22	\N	\N
15	4	10	\N	4	2	\N	\N	\N	2025-10-21 05:17:37	2025-10-21 05:17:37	22	\N	\N
16	4	7	12	4	19	\N	\N	\N	2025-10-21 05:18:15	2025-10-21 05:18:15	22	\N	\N
17	4	8	13	4	19	\N	\N	\N	2025-10-21 05:18:15	2025-10-21 05:18:15	22	\N	\N
18	4	9	14	4	19	\N	\N	\N	2025-10-21 05:18:15	2025-10-21 05:18:15	22	\N	\N
19	4	10	15	4	19	\N	\N	\N	2025-10-21 05:18:15	2025-10-21 05:18:15	22	\N	\N
20	5	11	\N	3	2	\N	\N	\N	2025-10-21 05:18:49	2025-10-21 05:18:49	23	\N	\N
47	9	23	42	4	19	\N	\N	\N	2025-10-21 05:23:05	2025-10-21 05:23:05	26	\N	\N
21	5	11	20	3	10	0	openAccess	1	2025-10-21 05:19:49	2025-10-21 05:19:53	23	521	1
22	6	12	\N	4	2	\N	\N	\N	2025-10-21 05:20:03	2025-10-21 05:20:03	24	\N	\N
23	6	13	\N	4	2	\N	\N	\N	2025-10-21 05:20:03	2025-10-21 05:20:04	24	\N	\N
24	6	14	\N	4	2	\N	\N	\N	2025-10-21 05:20:04	2025-10-21 05:20:04	24	\N	\N
25	6	15	\N	4	2	\N	\N	\N	2025-10-21 05:20:04	2025-10-21 05:20:04	24	\N	\N
26	6	12	22	4	19	\N	\N	\N	2025-10-21 05:20:40	2025-10-21 05:20:40	24	\N	\N
27	6	13	23	4	19	\N	\N	\N	2025-10-21 05:20:40	2025-10-21 05:20:40	24	\N	\N
28	6	14	24	4	19	\N	\N	\N	2025-10-21 05:20:40	2025-10-21 05:20:40	24	\N	\N
29	6	15	25	4	19	\N	\N	\N	2025-10-21 05:20:40	2025-10-21 05:20:40	24	\N	\N
30	7	16	\N	4	2	\N	\N	\N	2025-10-21 05:21:01	2025-10-21 05:21:01	25	\N	\N
31	7	17	\N	4	2	\N	\N	\N	2025-10-21 05:21:01	2025-10-21 05:21:02	25	\N	\N
32	7	18	\N	4	2	\N	\N	\N	2025-10-21 05:21:02	2025-10-21 05:21:02	25	\N	\N
33	7	19	\N	4	2	\N	\N	\N	2025-10-21 05:21:02	2025-10-21 05:21:02	25	\N	\N
34	7	20	\N	4	2	\N	\N	\N	2025-10-21 05:21:02	2025-10-21 05:21:03	25	\N	\N
35	7	16	30	4	4	\N	\N	\N	2025-10-21 05:21:50	2025-10-21 05:21:50	25	\N	\N
36	7	17	31	4	4	\N	\N	\N	2025-10-21 05:21:50	2025-10-21 05:21:50	25	\N	\N
37	7	18	32	4	4	\N	\N	\N	2025-10-21 05:21:50	2025-10-21 05:21:50	25	\N	\N
38	7	19	33	4	4	\N	\N	\N	2025-10-21 05:21:50	2025-10-21 05:21:50	25	\N	\N
39	7	20	34	4	4	\N	\N	\N	2025-10-21 05:21:50	2025-10-21 05:21:50	25	\N	\N
40	8	21	\N	3	2	\N	\N	\N	2025-10-21 05:22:09	2025-10-21 05:22:09	3	\N	\N
41	9	22	\N	4	2	\N	\N	\N	2025-10-21 05:22:17	2025-10-21 05:22:17	26	\N	\N
42	9	23	\N	4	2	\N	\N	\N	2025-10-21 05:22:17	2025-10-21 05:22:17	26	\N	\N
43	9	24	\N	4	2	\N	\N	\N	2025-10-21 05:22:18	2025-10-21 05:22:18	26	\N	\N
44	9	25	\N	4	2	\N	\N	\N	2025-10-21 05:22:18	2025-10-21 05:22:18	26	\N	\N
45	9	26	\N	4	2	\N	\N	\N	2025-10-21 05:22:18	2025-10-21 05:22:19	26	\N	\N
46	9	22	41	4	19	\N	\N	\N	2025-10-21 05:23:05	2025-10-21 05:23:05	26	\N	\N
48	9	24	43	4	19	\N	\N	\N	2025-10-21 05:23:05	2025-10-21 05:23:05	26	\N	\N
49	9	25	44	4	19	\N	\N	\N	2025-10-21 05:23:05	2025-10-21 05:23:05	26	\N	\N
50	9	26	45	4	19	\N	\N	\N	2025-10-21 05:23:05	2025-10-21 05:23:05	26	\N	\N
51	10	27	\N	3	2	\N	\N	\N	2025-10-21 05:23:13	2025-10-21 05:23:14	27	\N	\N
52	11	28	\N	3	2	\N	\N	\N	2025-10-21 05:23:54	2025-10-21 05:23:55	28	\N	\N
53	11	28	52	3	19	\N	\N	\N	2025-10-21 05:24:07	2025-10-21 05:24:07	28	\N	\N
54	12	29	\N	4	2	\N	\N	\N	2025-10-21 05:24:47	2025-10-21 05:24:47	29	\N	\N
55	12	30	\N	4	2	\N	\N	\N	2025-10-21 05:24:47	2025-10-21 05:24:47	29	\N	\N
56	12	31	\N	4	2	\N	\N	\N	2025-10-21 05:24:47	2025-10-21 05:24:48	29	\N	\N
57	13	32	\N	4	2	\N	\N	\N	2025-10-21 05:25:57	2025-10-21 05:25:57	30	\N	\N
58	13	33	\N	4	2	\N	\N	\N	2025-10-21 05:25:57	2025-10-21 05:25:58	30	\N	\N
59	13	34	\N	4	2	\N	\N	\N	2025-10-21 05:25:58	2025-10-21 05:25:58	30	\N	\N
60	14	35	\N	4	2	\N	\N	\N	2025-10-21 05:27:20	2025-10-21 05:27:20	31	\N	\N
61	14	36	\N	4	2	\N	\N	\N	2025-10-21 05:27:20	2025-10-21 05:27:21	31	\N	\N
62	14	37	\N	4	2	\N	\N	\N	2025-10-21 05:27:21	2025-10-21 05:27:21	31	\N	\N
63	14	38	\N	4	2	\N	\N	\N	2025-10-21 05:27:21	2025-10-21 05:27:21	31	\N	\N
64	14	39	\N	13	2	\N	\N	\N	2025-10-21 05:27:22	2025-10-21 05:27:22	31	\N	\N
65	14	40	\N	9	2	\N	\N	\N	2025-10-21 05:27:22	2025-10-21 05:27:23	31	\N	\N
66	14	35	60	4	19	\N	\N	\N	2025-10-21 05:27:58	2025-10-21 05:27:58	31	\N	\N
67	14	36	61	4	19	\N	\N	\N	2025-10-21 05:27:59	2025-10-21 05:27:59	31	\N	\N
68	14	37	62	4	19	\N	\N	\N	2025-10-21 05:27:59	2025-10-21 05:27:59	31	\N	\N
69	14	38	63	4	19	\N	\N	\N	2025-10-21 05:27:59	2025-10-21 05:27:59	31	\N	\N
70	14	39	64	13	19	\N	\N	\N	2025-10-21 05:27:59	2025-10-21 05:27:59	31	\N	\N
71	14	40	65	9	19	\N	\N	\N	2025-10-21 05:27:59	2025-10-21 05:27:59	31	\N	\N
73	14	36	61	4	10	0	openAccess	1	2025-10-21 05:28:37	2025-10-21 05:28:46	31	521	2
74	14	37	62	4	10	0	openAccess	1	2025-10-21 05:28:38	2025-10-21 05:28:49	31	521	2
75	14	38	63	4	10	0	openAccess	1	2025-10-21 05:28:38	2025-10-21 05:28:53	31	521	2
72	14	35	60	4	10	0	openAccess	1	2025-10-21 05:28:37	2025-10-21 05:28:42	31	521	2
76	14	39	64	13	10	0	openAccess	1	2025-10-21 05:28:38	2025-10-21 05:28:57	31	521	2
77	14	40	65	9	10	0	openAccess	1	2025-10-21 05:28:38	2025-10-21 05:29:01	31	521	2
78	15	41	\N	3	2	\N	\N	\N	2025-10-21 05:29:10	2025-10-21 05:29:10	32	\N	\N
79	16	42	\N	3	2	\N	\N	\N	2025-10-21 05:29:36	2025-10-21 05:29:36	33	\N	\N
80	17	43	\N	4	2	\N	\N	\N	2025-10-21 05:30:25	2025-10-21 05:30:25	34	\N	\N
81	17	44	\N	4	2	\N	\N	\N	2025-10-21 05:30:26	2025-10-21 05:30:26	34	\N	\N
82	17	45	\N	4	2	\N	\N	\N	2025-10-21 05:30:26	2025-10-21 05:30:26	34	\N	\N
83	17	46	\N	4	2	\N	\N	\N	2025-10-21 05:30:26	2025-10-21 05:30:26	34	\N	\N
84	17	47	\N	4	2	\N	\N	\N	2025-10-21 05:30:27	2025-10-21 05:30:27	34	\N	\N
85	17	48	\N	4	2	\N	\N	\N	2025-10-21 05:30:27	2025-10-21 05:30:27	34	\N	\N
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
17	anti
18	sentiment
19	documented
20	americans
21	northern
22	neighbour
23	examines
24	portrayed
25	confederation
26	obama
27	election
28	examining
29	major
30	events
31	tested
32	bilateral
33	relations
34	tracks
35	history
36	canadianism
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
47	canadian
48	studies
49	communication
50	cultural
51	political
52	international
53	michael
54	dawson
55	alberta
56	brian
57	dupuis
58	athabasca
59	wilson
60	calgary
61	bricks
62	brains
63	embodied
64	cognitive
65	science
66	lego
67	robots
68	introduces
69	illustrates
70	foundational
71	ideas
72	construction
73	observation
74	mindstorms
75	discussing
76	characteristics
77	distinguish
78	classical
79	places
80	renewed
81	emphasis
82	sensing
83	acting
84	importance
85	embodiment
86	exploration
87	distributed
88	notions
89	control
90	development
91	theories
92	synthesizing
93	simple
94	systems
95	exploring
96	behaviour
97	numerous
98	examples
99	illustrate
100	key
101	theme
102	agent
103	environment
104	agents
105	capable
106	exhibiting
107	sense
108	affect
109	world
110	psychology
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
3	10	7
3	18	8
3	7	9
3	19	10
3	20	11
3	21	12
3	22	13
3	2	14
3	23	15
3	10	16
3	11	17
3	24	18
3	7	19
3	25	20
3	26	21
3	27	22
3	28	23
3	29	24
3	30	25
3	31	26
3	32	27
3	33	28
3	6	29
3	7	30
3	34	31
3	35	32
3	17	33
3	36	34
3	37	35
3	38	36
3	39	37
3	40	38
3	41	39
3	42	40
3	43	41
3	44	42
3	45	43
3	46	44
3	7	45
3	12	46
3	13	47
5	47	0
5	48	1
5	49	2
5	50	3
5	48	4
5	51	5
5	52	6
5	48	7
9	53	0
9	54	1
9	3	2
9	55	3
9	56	4
9	57	5
9	58	6
9	3	7
9	53	8
9	59	9
9	3	10
9	60	11
10	61	0
10	62	1
10	63	2
10	64	3
10	65	4
10	66	5
10	67	6
11	61	0
11	62	1
11	68	2
11	63	3
11	64	4
11	65	5
11	69	6
11	70	7
11	71	8
11	72	9
11	73	10
11	66	11
11	74	12
11	67	13
11	75	14
11	76	15
11	77	16
11	63	17
11	64	18
11	65	19
11	78	20
11	64	21
11	65	22
11	61	23
11	62	24
11	79	25
11	80	26
11	81	27
11	82	28
11	83	29
11	84	30
11	85	31
11	86	32
11	87	33
11	88	34
11	89	35
11	90	36
11	91	37
11	92	38
11	93	39
11	94	40
11	95	41
11	96	42
11	97	43
11	98	44
11	99	45
11	100	46
11	101	47
11	84	48
11	102	49
11	103	50
11	93	51
11	104	52
11	66	53
11	67	54
11	105	55
11	106	56
11	45	57
11	96	58
11	107	59
11	108	60
11	109	61
13	110	0
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
1	5	1	0
2	5	2	0
3	5	4	0
4	5	16	0
5	5	17	0
6	5	8	0
7	5	32	0
8	5	64	0
9	14	1	0
10	14	2	0
11	14	4	0
12	14	16	0
13	14	17	0
14	14	8	0
15	14	32	0
16	14	64	0
\.


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
5	1	5	2025-10-21 05:19:57	2025-10-21 05:19:13	2025-10-21 05:19:13	5	en_US	3	0	2
3	1	3	2025-10-21 05:17:29	2025-10-21 05:17:29	2025-10-21 05:17:29	1	en_US	1	0	2
8	1	8	2025-10-21 05:22:11	2025-10-21 05:22:11	2025-10-21 05:22:11	1	en_US	1	0	2
1	1	1	2025-10-21 05:15:55	2025-10-21 05:15:42	2025-10-21 05:15:42	4	en_US	1	0	2
11	1	11	2025-10-21 05:24:39	2025-10-21 05:24:03	2025-10-21 05:24:03	4	en_US	1	0	2
14	1	14	2025-10-21 05:29:04	2025-10-21 05:27:52	2025-10-21 05:27:52	5	en_US	3	0	1
13	1	13	2025-10-21 05:27:11	2025-10-21 05:26:24	2025-10-21 05:26:24	4	en_US	1	0	1
6	1	6	2025-10-21 05:20:50	2025-10-21 05:20:35	2025-10-21 05:20:35	2	en_US	1	0	1
17	1	17	2025-10-21 05:31:44	2025-10-21 05:31:25	2025-10-21 05:31:25	2	en_US	1	0	1
4	1	4	2025-10-21 05:18:42	2025-10-21 05:18:10	2025-10-21 05:18:10	5	en_US	1	0	1
15	1	15	2025-10-21 05:29:28	2025-10-21 05:29:23	2025-10-21 05:29:23	3	en_US	1	0	2
2	1	2	2025-10-21 05:17:02	2025-10-21 05:16:47	2025-10-21 05:16:47	3	en_US	1	0	1
9	1	9	2025-10-21 05:23:05	2025-10-21 05:22:59	2025-10-21 05:22:59	2	en_US	1	0	1
12	1	12	2025-10-21 05:25:50	2025-10-21 05:25:24	2025-10-21 05:25:24	2	en_US	1	0	1
10	1	10	2025-10-21 05:23:48	2025-10-21 05:23:48	2025-10-21 05:23:48	1	en_US	1	0	2
16	1	16	2025-10-21 05:30:19	2025-10-21 05:29:54	2025-10-21 05:29:54	3	en_US	1	0	2
7	1	7	2025-10-21 05:22:03	2025-10-21 05:21:45	2025-10-21 05:21:45	4	en_US	1	0	1
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
1	fr_CA	name	##default.groups.name.siteAdmin##	string
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
18	fr_CA	name	Évaluateur-trice externe	string
18	fr_CA	abbrev	EvEx	string
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
7	fr_CA	familyName	0	0		string
7	en_US	preferredPublicName	0	0		string
7	fr_CA	preferredPublicName	0	0		string
7		orcid	0	0		string
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
33	mpower	$2y$10$SUWypl2SzLL3nxEBlSMY6uShPXbnnh09jT.ww8V4BNsDC1rgVt1Ty	mpower@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:29:33	\N	2025-10-21 05:29:33	0	\N	\N	0	\N	1
6	minoue	$2y$10$iw3Ze.w.LiiiuqRnL9rWl.yx1oV0nuu2.i6E2AtX70AE4ujT5/FZm	minoue@mailinator.com				\N	JP		\N	\N	2025-10-21 05:13:31	\N	2025-10-21 05:20:46	0	\N	\N	0	\N	1
8	phudson	$2y$10$UpcEfgR0Qhq4LrVjfBCNe.ASXWotZidxYETE7qdPsvYVtleNX9kV2	phudson@mailinator.com				\N	CA		\N	\N	2025-10-21 05:13:44	\N	2025-10-21 05:25:45	0	\N	\N	0	\N	1
25	dkennepohl	$2y$10$5isfAKmGlI27XqeWRljOgen0CXtxf374wp.bkGkt1b7/bgybqo/gq	dkennepohl@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:20:58	\N	2025-10-21 05:20:58	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$7nSUktIwDXMZMZ/8jWMAauSE.0pSeNdPquvJQxFK1NFp9Ftq8jJpu	dbuskins@mailinator.com				\N	US		\N	\N	2025-10-21 05:13:20	\N	2025-10-21 05:13:20	0	\N	\N	0	\N	1
5	sberardo	$2y$10$KWo9YCEKrH9OF/tjm0tIpeLAEuKP088FO8M3dqLs55wRnT2cK1s/G	sberardo@mailinator.com				\N	CA		\N	\N	2025-10-21 05:13:26	\N	2025-10-21 05:13:26	0	\N	\N	0	\N	1
7	jjanssen	$2y$10$FyYgaBG5KSC7bwi.HcRkq.jwxhj4drTieXIP0dQ7ozWFWvpTDM36W	jjanssen@mailinator.com				\N	NL		\N	\N	2025-10-21 05:13:38	\N	2025-10-21 05:13:38	0	\N	\N	0	\N	1
9	amccrae	$2y$10$3VcgHiKueL6Vq9IO3p0R5OCZJx.yoKSEqZzDYcL5dWcHgF9xTB5u6	amccrae@mailinator.com				\N	CA		\N	\N	2025-10-21 05:13:50	\N	2025-10-21 05:13:50	0	\N	\N	0	\N	1
11	alzacharia	$2y$10$8OBeYftUmxjhIlY9jbTQV.9PnZ3z18vFDT9VyRp8JkhmHFFJ8xy3a	alzacharia@mailinator.com				\N	GH		\N	\N	2025-10-21 05:14:05	\N	2025-10-21 05:14:05	0	\N	\N	0	\N	1
13	mfritz	$2y$10$zaTTKpT55nWxiXdaukWGV.TVy0KdmOGcEnO9WkRkP9dWStwTbaBnq	mfritz@mailinator.com				\N	BE		\N	\N	2025-10-21 05:14:20	\N	2025-10-21 05:14:20	0	\N	\N	0	\N	1
14	svogt	$2y$10$Pg13szsf8Q3fWgVuP981XufeLK4cVrUYPDyaXv0ehz2s76jd/XybW	svogt@mailinator.com				\N	CL		\N	\N	2025-10-21 05:14:27	\N	2025-10-21 05:14:27	0	\N	\N	0	\N	1
15	gcox	$2y$10$fgHoUnGgKePTXFkUN1Q9veBIvcy/r7sTXb0DrFzVCKF9y35KNLux2	gcox@mailinator.com				\N	US		\N	\N	2025-10-21 05:14:35	\N	2025-10-21 05:14:35	0	\N	\N	0	\N	1
16	shellier	$2y$10$5hNVbTv8DZVjw/9aBa5g2O93HnBdLVxqcY/XN4PtHQuLE5ubcH2ZG	shellier@mailinator.com				\N	ZA		\N	\N	2025-10-21 05:14:44	\N	2025-10-21 05:14:44	0	\N	\N	0	\N	1
17	cturner	$2y$10$Ws2F5rNtNBhmQ90BxspaGu6htAyPCq98CzRafKbykUvtrjrCY8DeK	cturner@mailinator.com				\N	GB		\N	\N	2025-10-21 05:14:53	\N	2025-10-21 05:14:53	0	\N	\N	0	\N	1
18	skumar	$2y$10$HUdGhr3Mxtm/stmjHVBFg.TjYb7Z6Is89X1Twt.I0uxyz7XUAEQ0u	skumar@mailinator.com				\N	SG		\N	\N	2025-10-21 05:15:03	\N	2025-10-21 05:15:03	0	\N	\N	0	\N	1
30	mally	$2y$10$BJMNdkNZz2vYLodDL5qZqO4TPsHoOacYLoYtYbBUbBIJv3dBvjRai	mally@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:25:54	\N	2025-10-21 05:25:54	0	\N	\N	0	\N	1
2	rvaca	$2y$10$TnBXpbIdgJ7OXZJxcZIs.OOaOhHw4UnsudCdbhbocmCT2gd/Uj73y	rvaca@mailinator.com				\N	MX		\N	\N	2025-10-21 05:13:10	\N	2025-10-21 05:15:09	0	\N	\N	0	\N	1
1	admin	$2y$10$ztinP/Qltl3jjRyE0EpaU.Vkb4o1em/NJJB3olctnu3xWRrLQYxjq	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2025-10-21 05:12:26	\N	2025-10-21 05:15:11	0	\N	\N	0	\N	1
19	aclark	$2y$10$9xLV5TE7z6nVRhy8odkXv.GwOuecaT1WJ.ch553gLZE5CQi8DyMoe	aclark@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:15:26	\N	2025-10-21 05:15:27	0	\N	\N	0	\N	1
26	fperini	$2y$10$UYa0BWGP16AFOoBjVSrScewW2jinkmqMTg3GlcEmOVafrFMGbClgy	fperini@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:22:14	\N	2025-10-21 05:22:14	0	\N	\N	0	\N	1
20	afinkel	$2y$10$i0sSYZdpyqjYXPEUjfsvteKxKzJIddW8BlJbKaBJQz5jGJ9fKLQuK	afinkel@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:16:00	\N	2025-10-21 05:16:00	0	\N	\N	0	\N	1
21	bbarnetson	$2y$10$p1S08irINLosFORC0ZYtPekgN89M2PRtP4da/lYdN.X2Kn8RfNmfi	bbarnetson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:17:07	\N	2025-10-21 05:17:07	0	\N	\N	0	\N	1
22	bbeaty	$2y$10$Iz6OAPAPfOmvosoCJU3BgufvndzEaFBS0JsJPn7R1ozNavsBLpHt6	bbeaty@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:17:33	\N	2025-10-21 05:17:33	0	\N	\N	0	\N	1
23	callan	$2y$10$VmxHcriM05voLrcrR4Nxf.UFKXWlZLdWbcIZl92zALtsWLvRTSLym	callan@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:18:47	\N	2025-10-21 05:18:47	0	\N	\N	0	\N	1
24	dbernnard	$2y$10$qkhfwTCoIq.zMh6Wi0bxgOhxo6hE9Vl1sHaY2ILIzNBO283DWhp1W	dbernnard@mailinator.com	\N	\N	\N	\N	US		\N	\N	2025-10-21 05:20:00	\N	2025-10-21 05:20:00	0	\N	\N	0	\N	1
27	jbrower	$2y$10$u8YEs0aX2qNemnLpRkmHXOynR0LcHQsuQaLv9Trzm.z9uZc6/YRWK	jbrower@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:23:11	\N	2025-10-21 05:23:11	0	\N	\N	0	\N	1
28	jlockehart	$2y$10$VwwWV6dHLjNV3dDZFES/h.6fSLso.Kvmo/OAJLD.xiriACMHECuNe	jlockehart@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:23:52	\N	2025-10-21 05:23:52	0	\N	\N	0	\N	1
12	gfavio	$2y$10$rjDM7iRJU1bUsswX9ia8aO6PEV4TfXWYbeIlRjYxEL/hMshsNL61i	gfavio@mailinator.com				\N	ES		\N	\N	2025-10-21 05:14:12	\N	2025-10-21 05:26:57	0	\N	\N	0	\N	1
10	agallego	$2y$10$mFYk52wwmZhs/uQesnmITuqXnCseUbEWIe8V9V9n26MB530NSXY2W	agallego@mailinator.com				\N	US		\N	\N	2025-10-21 05:13:57	\N	2025-10-21 05:30:13	0	\N	\N	0	\N	1
34	msmith	$2y$10$SR16O67LwrEGt45DOXq8WewLHIeF8El9NvzU5lrcCRJMTZzoa7fea	msmith@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:30:23	\N	2025-10-21 05:30:23	0	\N	\N	0	\N	1
29	lelder	$2y$10$5Lj.Os419JSKHnTQfh3g.eSZ7wSw7VRFDQh0HKqQR1gIVue/xbQYq	lelder@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:24:44	\N	2025-10-21 05:24:44	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$d.IZG15lUdedHwAev33fQe55BoFiPGP676mt2tnW73NgmCEIUlneC	dbarnes@mailinator.com				\N	AU		\N	\N	2025-10-21 05:13:15	\N	2025-10-21 05:31:26	0	\N	\N	0	\N	1
31	mdawson	$2y$10$89TSo//2VseHzS0pMgLrg.NjXcodKstFhMqrc8eMd2GZj7EW1gfvO	mdawson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:27:17	\N	2025-10-21 05:27:17	0	\N	\N	0	\N	1
32	mforan	$2y$10$dzo9sWk2rfm3vKXlgkkE7eGpv9G88mBTrtMSE6tZEtpWxL2nYnhyG	mforan@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2025-10-21 05:29:07	\N	2025-10-21 05:29:08	0	\N	\N	0	\N	1
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2025-10-21 05:12:26	1	plugins.metadata	dc11		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.pubIds	urn	URNPubIdPlugin	0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.pubIds	doi	DOIPubIdPlugin	0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.blocks	makeSubmission	MakeSubmissionBlockPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.blocks	information	InformationBlockPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	htmlMonographFile	HtmlMonographFilePlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	dublinCoreMeta	DublinCoreMetaPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	acron		0	1
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	2	0	0	2025-10-21 05:12:26	1	plugins.generic	staticPages	StaticPagesPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	usageEvent		0	1
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	2	0	0	2025-10-21 05:12:26	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.themes	default	DefaultThemePlugin	1	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.importexport	onix30		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.importexport	csv		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.importexport	native		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.importexport	users		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.paymethod	manual		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.paymethod	paypal		0	0
2	0	0	0	2025-10-21 05:12:26	1	plugins.reports	reviewReport		0	0
1	0	0	0	2025-10-21 05:12:26	1	plugins.reports	monographReport		0	0
3	3	0	21	2025-10-21 05:12:25	1	core	omp		0	1
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

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 26, true);


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 86, true);


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

SELECT pg_catalog.setval('public.email_log_log_id_seq', 73, true);


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

SELECT pg_catalog.setval('public.event_log_log_id_seq', 481, true);


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 48, true);


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 19, true);


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 19, true);


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 15, true);


--
-- Name: identification_codes_identification_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.identification_codes_identification_code_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 338, true);


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

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 47, true);


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

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 6, true);


--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_file_revisions_revision_id_seq', 85, true);


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 85, true);


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 110, true);


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 16, true);


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
-- Name: announcement_settings announcement_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_pkey UNIQUE (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings announcement_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_pkey UNIQUE (type_id, locale, setting_name);


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
-- Name: author_settings author_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_pkey UNIQUE (author_id, locale, setting_name);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: controlled_vocab_entry_settings c_v_e_s_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_pkey UNIQUE (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: categories category_path; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_path UNIQUE (context_id, path);


--
-- Name: category_settings category_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_pkey UNIQUE (category_id, locale, setting_name);


--
-- Name: submission_chapter_authors chapter_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_authors
    ADD CONSTRAINT chapter_authors_pkey UNIQUE (author_id, chapter_id);


--
-- Name: citation_settings citation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_pkey UNIQUE (citation_id, locale, setting_name);


--
-- Name: citations citations_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: citations citations_publication_seq; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication_seq UNIQUE (publication_id, seq);


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
-- Name: controlled_vocabs controlled_vocab_symbolic; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocab_symbolic UNIQUE (symbolic, assoc_type, assoc_id);


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
-- Name: data_object_tombstone_settings data_object_tombstone_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_pkey UNIQUE (tombstone_id, locale, setting_name);


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
-- Name: email_log_users email_log_user_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_user_id UNIQUE (email_log_id, user_id);


--
-- Name: email_templates_settings email_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_settings_pkey UNIQUE (email_id, locale, setting_name);


--
-- Name: email_templates_default_data email_templates_default_data_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_pkey UNIQUE (email_key, locale);


--
-- Name: email_templates_default email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates email_templates_email_key; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_email_key UNIQUE (email_key, context_id);


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
-- Name: event_log_settings event_log_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_pkey UNIQUE (log_id, setting_name);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- Name: filter_groups filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filter_groups filter_groups_symbolic; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_symbolic UNIQUE (symbolic);


--
-- Name: filter_settings filter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_pkey UNIQUE (filter_id, locale, setting_name);


--
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genre_settings genre_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_pkey UNIQUE (genre_id, locale, setting_name);


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
-- Name: item_views item_views_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_pkey UNIQUE (assoc_type, assoc_id, user_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: library_file_settings library_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_pkey UNIQUE (file_id, locale, setting_name);


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
-- Name: metadata_description_settings metadata_descripton_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metadata_description_settings
    ADD CONSTRAINT metadata_descripton_settings_pkey UNIQUE (metadata_description_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignment_settings navigation_menu_item_assignment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_pkey UNIQUE (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_settings navigation_menu_item_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_pkey UNIQUE (navigation_menu_item_id, locale, setting_name);


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
-- Name: new_releases new_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.new_releases
    ADD CONSTRAINT new_releases_pkey UNIQUE (assoc_type, assoc_id, submission_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list notification_mail_list_email_context; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_email_context UNIQUE (email, context);


--
-- Name: notification_mail_list notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_settings notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey UNIQUE (notification_id, locale, setting_name);


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
-- Name: oai_resumption_tokens oai_resumption_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens
    ADD CONSTRAINT oai_resumption_tokens_pkey UNIQUE (token);


--
-- Name: plugin_settings plugin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_pkey UNIQUE (plugin_name, context_id, setting_name);


--
-- Name: features press_features_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT press_features_pkey UNIQUE (assoc_type, assoc_id, submission_id);


--
-- Name: presses press_path; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses
    ADD CONSTRAINT press_path UNIQUE (path);


--
-- Name: press_settings press_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.press_settings
    ADD CONSTRAINT press_settings_pkey UNIQUE (press_id, locale, setting_name);


--
-- Name: presses presses_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses
    ADD CONSTRAINT presses_pkey PRIMARY KEY (press_id);


--
-- Name: publication_categories publication_categories_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_id UNIQUE (publication_id, category_id);


--
-- Name: publication_dates publication_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_dates
    ADD CONSTRAINT publication_dates_pkey PRIMARY KEY (publication_date_id);


--
-- Name: publication_format_settings publication_format_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_format_settings
    ADD CONSTRAINT publication_format_settings_pkey UNIQUE (publication_format_id, locale, setting_name);


--
-- Name: publication_formats publication_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats
    ADD CONSTRAINT publication_formats_pkey PRIMARY KEY (publication_format_id);


--
-- Name: publication_settings publication_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_pkey UNIQUE (publication_id, locale, setting_name);


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
-- Name: query_participants query_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_pkey UNIQUE (query_id, user_id);


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
-- Name: review_files review_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_pkey UNIQUE (review_id, submission_file_id);


--
-- Name: review_form_element_settings review_form_element_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_pkey UNIQUE (review_form_element_id, locale, setting_name);


--
-- Name: review_form_elements review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_form_settings review_form_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_pkey UNIQUE (review_form_id, locale, setting_name);


--
-- Name: review_forms review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_round_files review_round_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_pkey UNIQUE (submission_id, review_round_id, submission_file_id);


--
-- Name: review_rounds review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: review_rounds review_rounds_submission_id_stage_id_round_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_submission_id_stage_id_round_pkey UNIQUE (submission_id, stage_id, round);


--
-- Name: sales_rights sales_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sales_rights
    ADD CONSTRAINT sales_rights_pkey PRIMARY KEY (sales_rights_id);


--
-- Name: scheduled_tasks scheduled_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.scheduled_tasks
    ADD CONSTRAINT scheduled_tasks_pkey UNIQUE (class_name);


--
-- Name: subeditor_submission_group section_editors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_pkey UNIQUE (context_id, assoc_id, assoc_type, user_id);


--
-- Name: series_categories series_categories_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_categories
    ADD CONSTRAINT series_categories_id UNIQUE (series_id, category_id);


--
-- Name: series series_path; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_path UNIQUE (press_id, path);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: series_settings series_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_settings
    ADD CONSTRAINT series_settings_pkey UNIQUE (series_id, locale, setting_name);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey UNIQUE (session_id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey UNIQUE (setting_name, locale);


--
-- Name: spotlight_settings spotlight_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlight_settings
    ADD CONSTRAINT spotlight_settings_pkey UNIQUE (spotlight_id, locale, setting_name);


--
-- Name: spotlights spotlights_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlights
    ADD CONSTRAINT spotlights_pkey PRIMARY KEY (spotlight_id);


--
-- Name: stage_assignments stage_assignment; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignment UNIQUE (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: static_page_settings static_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_page_settings
    ADD CONSTRAINT static_page_settings_pkey UNIQUE (static_page_id, locale, setting_name);


--
-- Name: static_pages static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (static_page_id);


--
-- Name: submission_chapter_settings submission_chapter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_settings
    ADD CONSTRAINT submission_chapter_settings_pkey UNIQUE (chapter_id, locale, setting_name);


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
-- Name: submission_file_revisions submission_file_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_pkey PRIMARY KEY (revision_id);


--
-- Name: submission_file_settings submission_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_pkey UNIQUE (submission_file_id, locale, setting_name);


--
-- Name: submission_files submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (submission_file_id);


--
-- Name: submission_search_keyword_list submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_keyword_list submission_search_keyword_text; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_text UNIQUE (keyword_text);


--
-- Name: submission_search_object_keywords submission_search_object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_pkey UNIQUE (object_id, pos);


--
-- Name: submission_search_objects submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_settings submission_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_pkey UNIQUE (submission_id, locale, setting_name);


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
-- Name: user_interests u_e_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT u_e_pkey UNIQUE (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings user_group_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_pkey UNIQUE (user_group_id, locale, setting_name);


--
-- Name: user_group_stage user_group_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_pkey UNIQUE (context_id, user_group_id, stage_id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey UNIQUE (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey UNIQUE (user_group_id, user_id);


--
-- Name: users users_email; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey UNIQUE (product_type, product, major, minor, revision, build);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX access_keys_hash ON public.access_keys USING btree (key_hash, user_id, context);


--
-- Name: announcement_settings_announcement_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcement_settings_announcement_id ON public.announcement_settings USING btree (announcement_id);


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
-- Name: authors_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX authors_publication_id ON public.authors USING btree (publication_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id, parent_id);


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
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: controlled_vocab_entries_cv_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX controlled_vocab_entries_cv_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id, seq);


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX data_object_tombstone_oai_set_objects_tombstone_id ON public.data_object_tombstone_oai_set_objects USING btree (tombstone_id);


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
-- Name: email_settings_email_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_settings_email_id ON public.email_templates_settings USING btree (email_id);


--
-- Name: email_templates_default_email_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_templates_default_email_key ON public.email_templates_default USING btree (email_key);


--
-- Name: event_log_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX event_log_assoc ON public.event_log USING btree (assoc_type, assoc_id);


--
-- Name: event_log_settings_log_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX event_log_settings_log_id ON public.event_log_settings USING btree (log_id);


--
-- Name: event_log_settings_name_value; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX event_log_settings_name_value ON public.event_log_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['fileId'::character varying, 'submissionId'::character varying])::text[]));


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


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
-- Name: identification_codes_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX identification_codes_key ON public.identification_codes USING btree (identification_code_id, publication_format_id, code);


--
-- Name: jobs_queue_reserved_at_index; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX jobs_queue_reserved_at_index ON public.jobs USING btree (queue, reserved_at);


--
-- Name: library_file_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_file_settings_id ON public.library_file_settings USING btree (file_id);


--
-- Name: library_files_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_files_context_id ON public.library_files USING btree (context_id);


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
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


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
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX plugin_settings_plugin_name ON public.plugin_settings USING btree (plugin_name);


--
-- Name: press_settings_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX press_settings_press_id ON public.press_settings USING btree (press_id);


--
-- Name: publication_format_id_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_format_id_key ON public.publication_format_settings USING btree (publication_format_id);


--
-- Name: publication_format_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_format_submission_id ON public.publication_formats USING btree (submission_id);


--
-- Name: publication_settings_name_value; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_settings_name_value ON public.publication_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['indexingState'::character varying, 'medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying, 'pub-id::publisher-id'::character varying])::text[]));


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
-- Name: review_files_review_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_files_review_id ON public.review_files USING btree (review_id);


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
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_settings_review_form_id ON public.review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: section_editors_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX section_editors_context_id ON public.subeditor_submission_group USING btree (context_id);


--
-- Name: series_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_press_id ON public.series USING btree (press_id);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX sessions_user_id ON public.sessions USING btree (user_id);


--
-- Name: spotlight_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX spotlight_settings_id ON public.spotlight_settings USING btree (spotlight_id);


--
-- Name: spotlights_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX spotlights_assoc ON public.spotlights USING btree (assoc_type, assoc_id);


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
-- Name: static_page_settings_static_page_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX static_page_settings_static_page_id ON public.static_page_settings USING btree (static_page_id);


--
-- Name: subeditor_submission_group_assoc_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX subeditor_submission_group_assoc_id ON public.subeditor_submission_group USING btree (assoc_id, assoc_type);


--
-- Name: subeditor_submission_group_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX subeditor_submission_group_user_id ON public.subeditor_submission_group USING btree (user_id);


--
-- Name: submission_chapter_settings_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapter_settings_chapter_id ON public.submission_chapter_settings USING btree (chapter_id);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_comments_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: submission_file_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_file_settings_id ON public.submission_file_settings USING btree (submission_file_id);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_submission; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_search_object_submission ON public.submission_search_objects USING btree (submission_id);


--
-- Name: submission_settings_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_settings_submission_id ON public.submission_settings USING btree (submission_id);


--
-- Name: submissions_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submissions_context_id ON public.submissions USING btree (context_id);


--
-- Name: submissions_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submissions_publication_id ON public.submissions USING btree (current_publication_id);


--
-- Name: temporary_files_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX temporary_files_user_id ON public.temporary_files USING btree (user_id);


--
-- Name: user_group_stage_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_group_stage_context_id ON public.user_group_stage USING btree (context_id);


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
-- Name: user_settings_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_settings_user_id ON public.user_settings USING btree (user_id);


--
-- Name: user_user_groups_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_user_groups_user_group_id ON public.user_user_groups USING btree (user_group_id);


--
-- Name: user_user_groups_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_user_groups_user_id ON public.user_user_groups USING btree (user_id);


--
-- Name: review_files review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_round_files review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_file_revisions submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- Name: submission_file_revisions submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_files submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- PostgreSQL database dump complete
--

\unrestrict smiOJF8inkqvwb3SCKCsBz5cYMSK95GsWalzO8mUddIUY1bzhpYnvkniL8B0noq

