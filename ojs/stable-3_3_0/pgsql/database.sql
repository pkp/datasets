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
DROP INDEX public.subscription_type_settings_type_id;
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
DROP INDEX public.static_page_settings_static_page_id;
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
DROP INDEX public.issues_url_path;
DROP INDEX public.issues_journal_id;
DROP INDEX public.issue_settings_name_value;
DROP INDEX public.issue_settings_issue_id;
DROP INDEX public.issue_galleys_url_path;
DROP INDEX public.issue_galleys_issue_id;
DROP INDEX public.issue_galley_settings_galley_id;
DROP INDEX public.issue_files_issue_id;
DROP INDEX public.institutional_subscriptions_subscription_id;
DROP INDEX public.institutional_subscriptions_domain;
DROP INDEX public.institutional_subscription_ip_subscription_id;
DROP INDEX public.institutional_subscription_ip_start;
DROP INDEX public.institutional_subscription_ip_end;
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
ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
ALTER TABLE ONLY public.subscription_types DROP CONSTRAINT subscription_types_pkey;
ALTER TABLE ONLY public.subscription_type_settings DROP CONSTRAINT subscription_type_settings_pkey;
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
ALTER TABLE ONLY public.static_pages DROP CONSTRAINT static_pages_pkey;
ALTER TABLE ONLY public.static_page_settings DROP CONSTRAINT static_page_settings_pkey;
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
ALTER TABLE ONLY public.queued_payments DROP CONSTRAINT queued_payments_pkey;
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
ALTER TABLE ONLY public.issues DROP CONSTRAINT issues_pkey;
ALTER TABLE ONLY public.issue_settings DROP CONSTRAINT issue_settings_pkey;
ALTER TABLE ONLY public.issue_galleys DROP CONSTRAINT issue_galleys_pkey;
ALTER TABLE ONLY public.issue_galley_settings DROP CONSTRAINT issue_galley_settings_pkey;
ALTER TABLE ONLY public.issue_files DROP CONSTRAINT issue_files_pkey;
ALTER TABLE ONLY public.institutional_subscriptions DROP CONSTRAINT institutional_subscriptions_pkey;
ALTER TABLE ONLY public.institutional_subscription_ip DROP CONSTRAINT institutional_subscription_ip_pkey;
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
ALTER TABLE ONLY public.custom_section_orders DROP CONSTRAINT custom_section_orders_pkey;
ALTER TABLE ONLY public.custom_issue_orders DROP CONSTRAINT custom_issue_orders_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocabs_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocab_symbolic;
ALTER TABLE ONLY public.controlled_vocab_entries DROP CONSTRAINT controlled_vocab_entries_pkey;
ALTER TABLE ONLY public.completed_payments DROP CONSTRAINT completed_payments_pkey;
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
ALTER TABLE public.subscriptions ALTER COLUMN subscription_id DROP DEFAULT;
ALTER TABLE public.subscription_types ALTER COLUMN type_id DROP DEFAULT;
ALTER TABLE public.submissions ALTER COLUMN submission_id DROP DEFAULT;
ALTER TABLE public.submission_tombstones ALTER COLUMN tombstone_id DROP DEFAULT;
ALTER TABLE public.submission_search_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.submission_search_keyword_list ALTER COLUMN keyword_id DROP DEFAULT;
ALTER TABLE public.submission_files ALTER COLUMN submission_file_id DROP DEFAULT;
ALTER TABLE public.submission_file_revisions ALTER COLUMN revision_id DROP DEFAULT;
ALTER TABLE public.submission_comments ALTER COLUMN comment_id DROP DEFAULT;
ALTER TABLE public.static_pages ALTER COLUMN static_page_id DROP DEFAULT;
ALTER TABLE public.stage_assignments ALTER COLUMN stage_assignment_id DROP DEFAULT;
ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
ALTER TABLE public.review_rounds ALTER COLUMN review_round_id DROP DEFAULT;
ALTER TABLE public.review_forms ALTER COLUMN review_form_id DROP DEFAULT;
ALTER TABLE public.review_form_elements ALTER COLUMN review_form_element_id DROP DEFAULT;
ALTER TABLE public.review_assignments ALTER COLUMN review_id DROP DEFAULT;
ALTER TABLE public.queued_payments ALTER COLUMN queued_payment_id DROP DEFAULT;
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
ALTER TABLE public.issues ALTER COLUMN issue_id DROP DEFAULT;
ALTER TABLE public.issue_galleys ALTER COLUMN galley_id DROP DEFAULT;
ALTER TABLE public.issue_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.institutional_subscriptions ALTER COLUMN institutional_subscription_id DROP DEFAULT;
ALTER TABLE public.institutional_subscription_ip ALTER COLUMN institutional_subscription_ip_id DROP DEFAULT;
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
DROP SEQUENCE public.subscriptions_subscription_id_seq;
DROP TABLE public.subscriptions;
DROP SEQUENCE public.subscription_types_type_id_seq;
DROP TABLE public.subscription_types;
DROP TABLE public.subscription_type_settings;
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
DROP SEQUENCE public.static_pages_static_page_id_seq;
DROP TABLE public.static_pages;
DROP TABLE public.static_page_settings;
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
DROP SEQUENCE public.queued_payments_queued_payment_id_seq;
DROP TABLE public.queued_payments;
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
DROP SEQUENCE public.issues_issue_id_seq;
DROP TABLE public.issues;
DROP TABLE public.issue_settings;
DROP SEQUENCE public.issue_galleys_galley_id_seq;
DROP TABLE public.issue_galleys;
DROP TABLE public.issue_galley_settings;
DROP SEQUENCE public.issue_files_file_id_seq;
DROP TABLE public.issue_files;
DROP SEQUENCE public.institutional_subscriptions_institutional_subscription_id_seq;
DROP TABLE public.institutional_subscriptions;
DROP SEQUENCE public.institutional_subscription_ip_institutional_subscription_ip_seq;
DROP TABLE public.institutional_subscription_ip;
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
DROP TABLE public.custom_section_orders;
DROP TABLE public.custom_issue_orders;
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
-- Name: access_keys; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.access_keys (
    access_key_id bigint NOT NULL,
    context character varying(40) NOT NULL,
    key_hash character varying(40) NOT NULL,
    user_id bigint NOT NULL,
    assoc_id bigint,
    expiry_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.access_keys OWNER TO "ojs-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.access_keys_access_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_keys_access_key_id_seq OWNER TO "ojs-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.access_keys_access_key_id_seq OWNED BY public.access_keys.access_key_id;


--
-- Name: announcement_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.announcement_settings (
    announcement_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.announcement_settings OWNER TO "ojs-ci";

--
-- Name: announcement_type_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.announcement_type_settings (
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.announcement_type_settings OWNER TO "ojs-ci";

--
-- Name: announcement_types; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.announcement_types (
    type_id bigint NOT NULL,
    assoc_type smallint NOT NULL,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.announcement_types OWNER TO "ojs-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.announcement_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_types_type_id_seq OWNER TO "ojs-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.announcement_types_type_id_seq OWNED BY public.announcement_types.type_id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.announcements (
    announcement_id bigint NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL,
    type_id bigint,
    date_expire date,
    date_posted timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.announcements OWNER TO "ojs-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.announcements_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcements_announcement_id_seq OWNER TO "ojs-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.announcements_announcement_id_seq OWNED BY public.announcements.announcement_id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.auth_sources (
    auth_id bigint NOT NULL,
    title character varying(60) NOT NULL,
    plugin character varying(32) NOT NULL,
    auth_default smallint DEFAULT '0'::smallint NOT NULL,
    settings text
);


ALTER TABLE public.auth_sources OWNER TO "ojs-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.auth_sources_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_auth_id_seq OWNER TO "ojs-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.auth_sources_auth_id_seq OWNED BY public.auth_sources.auth_id;


--
-- Name: author_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.author_settings (
    author_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.author_settings OWNER TO "ojs-ci";

--
-- Name: authors; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.authors (
    author_id bigint NOT NULL,
    email character varying(90) NOT NULL,
    include_in_browse smallint DEFAULT '1'::smallint NOT NULL,
    publication_id bigint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    user_group_id bigint
);


ALTER TABLE public.authors OWNER TO "ojs-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_author_id_seq OWNER TO "ojs-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.categories (
    category_id bigint NOT NULL,
    context_id bigint NOT NULL,
    parent_id bigint NOT NULL,
    seq bigint,
    path character varying(255) NOT NULL,
    image text
);


ALTER TABLE public.categories OWNER TO "ojs-ci";

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO "ojs-ci";

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: category_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.category_settings (
    category_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.category_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN category_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.category_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: citation_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.citation_settings (
    citation_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.citation_settings OWNER TO "ojs-ci";

--
-- Name: citations; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.citations (
    citation_id bigint NOT NULL,
    publication_id bigint DEFAULT '0'::bigint NOT NULL,
    raw_citation text NOT NULL,
    seq bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.citations OWNER TO "ojs-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.citations_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citations_citation_id_seq OWNER TO "ojs-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.citations_citation_id_seq OWNED BY public.citations.citation_id;


--
-- Name: completed_payments; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.completed_payments (
    completed_payment_id bigint NOT NULL,
    "timestamp" timestamp(0) without time zone NOT NULL,
    payment_type bigint NOT NULL,
    context_id bigint NOT NULL,
    user_id bigint,
    assoc_id bigint,
    amount double precision NOT NULL,
    currency_code_alpha character varying(3),
    payment_method_plugin_name character varying(80)
);


ALTER TABLE public.completed_payments OWNER TO "ojs-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.completed_payments_completed_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.completed_payments_completed_payment_id_seq OWNER TO "ojs-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.completed_payments_completed_payment_id_seq OWNED BY public.completed_payments.completed_payment_id;


--
-- Name: controlled_vocab_entries; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.controlled_vocab_entries (
    controlled_vocab_entry_id bigint NOT NULL,
    controlled_vocab_id bigint NOT NULL,
    seq double precision
);


ALTER TABLE public.controlled_vocab_entries OWNER TO "ojs-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "ojs-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNED BY public.controlled_vocab_entries.controlled_vocab_entry_id;


--
-- Name: controlled_vocab_entry_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.controlled_vocab_entry_settings (
    controlled_vocab_entry_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.controlled_vocab_entry_settings OWNER TO "ojs-ci";

--
-- Name: controlled_vocabs; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.controlled_vocabs (
    controlled_vocab_id bigint NOT NULL,
    symbolic character varying(64) NOT NULL,
    assoc_type bigint DEFAULT '0'::bigint NOT NULL,
    assoc_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.controlled_vocabs OWNER TO "ojs-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlled_vocabs_controlled_vocab_id_seq OWNER TO "ojs-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq OWNED BY public.controlled_vocabs.controlled_vocab_id;


--
-- Name: custom_issue_orders; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.custom_issue_orders (
    issue_id bigint NOT NULL,
    journal_id bigint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.custom_issue_orders OWNER TO "ojs-ci";

--
-- Name: custom_section_orders; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.custom_section_orders (
    issue_id bigint NOT NULL,
    section_id bigint NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.custom_section_orders OWNER TO "ojs-ci";

--
-- Name: data_object_tombstone_oai_set_objects; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.data_object_tombstone_oai_set_objects (
    object_id bigint NOT NULL,
    tombstone_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL
);


ALTER TABLE public.data_object_tombstone_oai_set_objects OWNER TO "ojs-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "ojs-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq OWNED BY public.data_object_tombstone_oai_set_objects.object_id;


--
-- Name: data_object_tombstone_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.data_object_tombstone_settings (
    tombstone_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.data_object_tombstone_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN data_object_tombstone_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.data_object_tombstone_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: data_object_tombstones; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.data_object_tombstones (
    tombstone_id bigint NOT NULL,
    data_object_id bigint NOT NULL,
    date_deleted timestamp(0) without time zone NOT NULL,
    set_spec character varying(255) NOT NULL,
    set_name character varying(255) NOT NULL,
    oai_identifier character varying(255) NOT NULL
);


ALTER TABLE public.data_object_tombstones OWNER TO "ojs-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.data_object_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_object_tombstones_tombstone_id_seq OWNER TO "ojs-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNED BY public.data_object_tombstones.tombstone_id;


--
-- Name: edit_decisions; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.edit_decisions OWNER TO "ojs-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.edit_decisions_edit_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edit_decisions_edit_decision_id_seq OWNER TO "ojs-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.edit_decisions_edit_decision_id_seq OWNED BY public.edit_decisions.edit_decision_id;


--
-- Name: email_log; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.email_log OWNER TO "ojs-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.email_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_log_log_id_seq OWNER TO "ojs-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.email_log_log_id_seq OWNED BY public.email_log.log_id;


--
-- Name: email_log_users; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.email_log_users (
    email_log_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.email_log_users OWNER TO "ojs-ci";

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.email_templates (
    email_id bigint NOT NULL,
    email_key character varying(64) NOT NULL,
    context_id bigint NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.email_templates OWNER TO "ojs-ci";

--
-- Name: COLUMN email_templates.email_key; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.email_templates.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.email_templates_default OWNER TO "ojs-ci";

--
-- Name: COLUMN email_templates_default.email_key; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.email_templates_default.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default_data; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.email_templates_default_data (
    email_key character varying(64) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying NOT NULL,
    subject character varying(120) NOT NULL,
    body text,
    description text
);


ALTER TABLE public.email_templates_default_data OWNER TO "ojs-ci";

--
-- Name: COLUMN email_templates_default_data.email_key; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.email_templates_default_data.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.email_templates_default_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_templates_default_email_id_seq OWNER TO "ojs-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.email_templates_default_email_id_seq OWNED BY public.email_templates_default.email_id;


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.email_templates_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_templates_email_id_seq OWNER TO "ojs-ci";

--
-- Name: email_templates_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.email_templates_email_id_seq OWNED BY public.email_templates.email_id;


--
-- Name: email_templates_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.email_templates_settings (
    email_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.email_templates_settings OWNER TO "ojs-ci";

--
-- Name: event_log; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.event_log OWNER TO "ojs-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.event_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_log_log_id_seq OWNER TO "ojs-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.event_log_log_id_seq OWNED BY public.event_log.log_id;


--
-- Name: event_log_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.event_log_settings (
    log_id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.event_log_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN event_log_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.event_log_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: files; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.files (
    file_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    mimetype character varying(255) NOT NULL
);


ALTER TABLE public.files OWNER TO "ojs-ci";

--
-- Name: files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.files_file_id_seq OWNED BY public.files.file_id;


--
-- Name: filter_groups; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.filter_groups (
    filter_group_id bigint NOT NULL,
    symbolic character varying(255),
    display_name character varying(255),
    description character varying(255),
    input_type character varying(255),
    output_type character varying(255)
);


ALTER TABLE public.filter_groups OWNER TO "ojs-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.filter_groups_filter_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_groups_filter_group_id_seq OWNER TO "ojs-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.filter_groups_filter_group_id_seq OWNED BY public.filter_groups.filter_group_id;


--
-- Name: filter_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.filter_settings (
    filter_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.filter_settings OWNER TO "ojs-ci";

--
-- Name: filters; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.filters OWNER TO "ojs-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.filters_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filters_filter_id_seq OWNER TO "ojs-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.filters_filter_id_seq OWNED BY public.filters.filter_id;


--
-- Name: genre_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.genre_settings (
    genre_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.genre_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN genre_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.genre_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: genres; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.genres OWNER TO "ojs-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_genre_id_seq OWNER TO "ojs-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- Name: institutional_subscription_ip; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.institutional_subscription_ip (
    institutional_subscription_ip_id bigint NOT NULL,
    subscription_id bigint NOT NULL,
    ip_string character varying(40) NOT NULL,
    ip_start bigint NOT NULL,
    ip_end bigint
);


ALTER TABLE public.institutional_subscription_ip OWNER TO "ojs-ci";

--
-- Name: institutional_subscription_ip_institutional_subscription_ip_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.institutional_subscription_ip_institutional_subscription_ip_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institutional_subscription_ip_institutional_subscription_ip_seq OWNER TO "ojs-ci";

--
-- Name: institutional_subscription_ip_institutional_subscription_ip_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.institutional_subscription_ip_institutional_subscription_ip_seq OWNED BY public.institutional_subscription_ip.institutional_subscription_ip_id;


--
-- Name: institutional_subscriptions; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.institutional_subscriptions (
    institutional_subscription_id bigint NOT NULL,
    subscription_id bigint NOT NULL,
    institution_name character varying(255) NOT NULL,
    mailing_address character varying(255),
    domain character varying(255)
);


ALTER TABLE public.institutional_subscriptions OWNER TO "ojs-ci";

--
-- Name: institutional_subscriptions_institutional_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.institutional_subscriptions_institutional_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institutional_subscriptions_institutional_subscription_id_seq OWNER TO "ojs-ci";

--
-- Name: institutional_subscriptions_institutional_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.institutional_subscriptions_institutional_subscription_id_seq OWNED BY public.institutional_subscriptions.institutional_subscription_id;


--
-- Name: issue_files; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.issue_files (
    file_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    file_name character varying(90) NOT NULL,
    file_type character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    content_type bigint NOT NULL,
    original_file_name character varying(127),
    date_uploaded timestamp(0) without time zone NOT NULL,
    date_modified timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.issue_files OWNER TO "ojs-ci";

--
-- Name: issue_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.issue_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: issue_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.issue_files_file_id_seq OWNED BY public.issue_files.file_id;


--
-- Name: issue_galley_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.issue_galley_settings (
    galley_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.issue_galley_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN issue_galley_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.issue_galley_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: issue_galleys; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.issue_galleys (
    galley_id bigint NOT NULL,
    locale character varying(14),
    issue_id bigint NOT NULL,
    file_id bigint NOT NULL,
    label character varying(32),
    seq double precision DEFAULT '0'::double precision NOT NULL,
    url_path character varying(64)
);


ALTER TABLE public.issue_galleys OWNER TO "ojs-ci";

--
-- Name: issue_galleys_galley_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.issue_galleys_galley_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_galleys_galley_id_seq OWNER TO "ojs-ci";

--
-- Name: issue_galleys_galley_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.issue_galleys_galley_id_seq OWNED BY public.issue_galleys.galley_id;


--
-- Name: issue_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.issue_settings (
    issue_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.issue_settings OWNER TO "ojs-ci";

--
-- Name: issues; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.issues (
    issue_id bigint NOT NULL,
    journal_id bigint NOT NULL,
    volume smallint,
    number character varying(40),
    year smallint,
    published smallint DEFAULT '0'::smallint NOT NULL,
    current smallint DEFAULT '0'::smallint NOT NULL,
    date_published timestamp(0) without time zone,
    date_notified timestamp(0) without time zone,
    last_modified timestamp(0) without time zone,
    access_status smallint DEFAULT '1'::smallint NOT NULL,
    open_access_date timestamp(0) without time zone,
    show_volume smallint DEFAULT '0'::smallint NOT NULL,
    show_number smallint DEFAULT '0'::smallint NOT NULL,
    show_year smallint DEFAULT '0'::smallint NOT NULL,
    show_title smallint DEFAULT '0'::smallint NOT NULL,
    style_file_name character varying(90),
    original_style_file_name character varying(255),
    url_path character varying(64)
);


ALTER TABLE public.issues OWNER TO "ojs-ci";

--
-- Name: issues_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.issues_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_issue_id_seq OWNER TO "ojs-ci";

--
-- Name: issues_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.issues_issue_id_seq OWNED BY public.issues.issue_id;


--
-- Name: item_views; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.item_views (
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint,
    date_last_viewed timestamp(0) without time zone
);


ALTER TABLE public.item_views OWNER TO "ojs-ci";

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.jobs OWNER TO "ojs-ci";

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO "ojs-ci";

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: journal_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.journal_settings (
    journal_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6)
);


ALTER TABLE public.journal_settings OWNER TO "ojs-ci";

--
-- Name: journals; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.journals (
    journal_id bigint NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.journals OWNER TO "ojs-ci";

--
-- Name: COLUMN journals.seq; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.journals.seq IS 'Used to order lists of journals';


--
-- Name: COLUMN journals.enabled; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.journals.enabled IS 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)';


--
-- Name: journals_journal_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.journals_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_journal_id_seq OWNER TO "ojs-ci";

--
-- Name: journals_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.journals_journal_id_seq OWNED BY public.journals.journal_id;


--
-- Name: library_file_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.library_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.library_file_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN library_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.library_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: library_files; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.library_files OWNER TO "ojs-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.library_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.library_files_file_id_seq OWNED BY public.library_files.file_id;


--
-- Name: metadata_description_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.metadata_description_settings (
    metadata_description_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.metadata_description_settings OWNER TO "ojs-ci";

--
-- Name: metadata_descriptions; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.metadata_descriptions OWNER TO "ojs-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.metadata_descriptions_metadata_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metadata_descriptions_metadata_description_id_seq OWNER TO "ojs-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.metadata_descriptions_metadata_description_id_seq OWNED BY public.metadata_descriptions.metadata_description_id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.metrics OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_assignments; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.navigation_menu_item_assignments (
    navigation_menu_item_assignment_id bigint NOT NULL,
    navigation_menu_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    parent_id bigint,
    seq bigint DEFAULT '0'::bigint
);


ALTER TABLE public.navigation_menu_item_assignments OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNED BY public.navigation_menu_item_assignments.navigation_menu_item_assignment_id;


--
-- Name: navigation_menu_item_assignment_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.navigation_menu_item_assignment_settings (
    navigation_menu_item_assignment_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_assignment_settings OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.navigation_menu_item_settings (
    navigation_menu_item_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_settings OWNER TO "ojs-ci";

--
-- Name: navigation_menu_items; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.navigation_menu_items (
    navigation_menu_item_id bigint NOT NULL,
    context_id bigint NOT NULL,
    path character varying(255) DEFAULT ''::character varying,
    type character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.navigation_menu_items OWNER TO "ojs-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menu_items_navigation_menu_item_id_seq OWNER TO "ojs-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq OWNED BY public.navigation_menu_items.navigation_menu_item_id;


--
-- Name: navigation_menus; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.navigation_menus (
    navigation_menu_id bigint NOT NULL,
    context_id bigint NOT NULL,
    area_name character varying(255) DEFAULT ''::character varying,
    title character varying(255) NOT NULL
);


ALTER TABLE public.navigation_menus OWNER TO "ojs-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.navigation_menus_navigation_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_menus_navigation_menu_id_seq OWNER TO "ojs-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.navigation_menus_navigation_menu_id_seq OWNED BY public.navigation_menus.navigation_menu_id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.notes OWNER TO "ojs-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.notes_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_note_id_seq OWNER TO "ojs-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;


--
-- Name: notification_mail_list; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.notification_mail_list (
    notification_mail_list_id bigint NOT NULL,
    email character varying(90) NOT NULL,
    confirmed smallint DEFAULT '0'::smallint NOT NULL,
    token character varying(40) NOT NULL,
    context bigint NOT NULL
);


ALTER TABLE public.notification_mail_list OWNER TO "ojs-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.notification_mail_list_notification_mail_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_mail_list_notification_mail_list_id_seq OWNER TO "ojs-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.notification_mail_list_notification_mail_list_id_seq OWNED BY public.notification_mail_list.notification_mail_list_id;


--
-- Name: notification_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.notification_settings (
    notification_id bigint NOT NULL,
    locale character varying(14),
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN notification_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.notification_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.notification_subscription_settings (
    setting_id bigint NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL,
    user_id bigint NOT NULL,
    context bigint NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_subscription_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN notification_subscription_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.notification_subscription_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.notification_subscription_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_subscription_settings_setting_id_seq OWNER TO "ojs-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.notification_subscription_settings_setting_id_seq OWNED BY public.notification_subscription_settings.setting_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.notifications OWNER TO "ojs-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notification_id_seq OWNER TO "ojs-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- Name: oai_resumption_tokens; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.oai_resumption_tokens (
    token character varying(32) NOT NULL,
    expire bigint NOT NULL,
    record_offset integer NOT NULL,
    params text
);


ALTER TABLE public.oai_resumption_tokens OWNER TO "ojs-ci";

--
-- Name: plugin_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.plugin_settings (
    plugin_name character varying(80) NOT NULL,
    context_id bigint NOT NULL,
    setting_name character varying(80) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.plugin_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN plugin_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.plugin_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: publication_categories; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.publication_categories (
    publication_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.publication_categories OWNER TO "ojs-ci";

--
-- Name: publication_galley_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.publication_galley_settings (
    galley_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_galley_settings OWNER TO "ojs-ci";

--
-- Name: publication_galleys; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.publication_galleys OWNER TO "ojs-ci";

--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.publication_galleys_galley_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_galleys_galley_id_seq OWNER TO "ojs-ci";

--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.publication_galleys_galley_id_seq OWNED BY public.publication_galleys.galley_id;


--
-- Name: publication_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.publication_settings (
    publication_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_settings OWNER TO "ojs-ci";

--
-- Name: publications; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.publications (
    publication_id bigint NOT NULL,
    access_status bigint DEFAULT '0'::bigint,
    date_published date,
    last_modified timestamp(0) without time zone,
    locale character varying(14),
    primary_contact_id bigint,
    section_id bigint,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    submission_id bigint NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    url_path character varying(64),
    version bigint
);


ALTER TABLE public.publications OWNER TO "ojs-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.publications_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_publication_id_seq OWNER TO "ojs-ci";

--
-- Name: publications_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.publications_publication_id_seq OWNED BY public.publications.publication_id;


--
-- Name: queries; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.queries OWNER TO "ojs-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.queries_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_query_id_seq OWNER TO "ojs-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.queries_query_id_seq OWNED BY public.queries.query_id;


--
-- Name: query_participants; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.query_participants (
    query_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.query_participants OWNER TO "ojs-ci";

--
-- Name: queued_payments; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.queued_payments (
    queued_payment_id bigint NOT NULL,
    date_created timestamp(0) without time zone NOT NULL,
    date_modified timestamp(0) without time zone NOT NULL,
    expiry_date date,
    payment_data text
);


ALTER TABLE public.queued_payments OWNER TO "ojs-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.queued_payments_queued_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queued_payments_queued_payment_id_seq OWNER TO "ojs-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.queued_payments_queued_payment_id_seq OWNED BY public.queued_payments.queued_payment_id;


--
-- Name: review_assignments; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.review_assignments OWNER TO "ojs-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.review_assignments_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_assignments_review_id_seq OWNER TO "ojs-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.review_assignments_review_id_seq OWNED BY public.review_assignments.review_id;


--
-- Name: review_files; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_files (
    review_id bigint NOT NULL,
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_files OWNER TO "ojs-ci";

--
-- Name: review_form_element_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_form_element_settings (
    review_form_element_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_element_settings OWNER TO "ojs-ci";

--
-- Name: review_form_elements; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_form_elements (
    review_form_element_id bigint NOT NULL,
    review_form_id bigint NOT NULL,
    seq double precision,
    element_type bigint,
    required smallint,
    included smallint
);


ALTER TABLE public.review_form_elements OWNER TO "ojs-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.review_form_elements_review_form_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_form_elements_review_form_element_id_seq OWNER TO "ojs-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.review_form_elements_review_form_element_id_seq OWNED BY public.review_form_elements.review_form_element_id;


--
-- Name: review_form_responses; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_form_responses (
    review_form_element_id bigint NOT NULL,
    review_id bigint NOT NULL,
    response_type character varying(6),
    response_value text
);


ALTER TABLE public.review_form_responses OWNER TO "ojs-ci";

--
-- Name: review_form_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_form_settings (
    review_form_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_settings OWNER TO "ojs-ci";

--
-- Name: review_forms; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_forms (
    review_form_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    seq double precision,
    is_active smallint
);


ALTER TABLE public.review_forms OWNER TO "ojs-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.review_forms_review_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_forms_review_form_id_seq OWNER TO "ojs-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.review_forms_review_form_id_seq OWNED BY public.review_forms.review_form_id;


--
-- Name: review_round_files; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_round_files (
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_round_files OWNER TO "ojs-ci";

--
-- Name: review_rounds; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.review_rounds (
    review_round_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    stage_id bigint,
    round smallint NOT NULL,
    review_revision bigint,
    status bigint
);


ALTER TABLE public.review_rounds OWNER TO "ojs-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.review_rounds_review_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_rounds_review_round_id_seq OWNER TO "ojs-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.review_rounds_review_round_id_seq OWNED BY public.review_rounds.review_round_id;


--
-- Name: scheduled_tasks; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.scheduled_tasks (
    class_name character varying(255) NOT NULL,
    last_run timestamp(0) without time zone
);


ALTER TABLE public.scheduled_tasks OWNER TO "ojs-ci";

--
-- Name: section_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.section_settings (
    section_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.section_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN section_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.section_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: sections; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.sections OWNER TO "ojs-ci";

--
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.sections_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_section_id_seq OWNER TO "ojs-ci";

--
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.sessions OWNER TO "ojs-ci";

--
-- Name: site; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.site (
    redirect bigint DEFAULT '0'::bigint NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT '6'::smallint NOT NULL,
    installed_locales character varying(1024) DEFAULT 'en_US'::character varying NOT NULL,
    supported_locales character varying(1024),
    original_style_file_name character varying(255)
);


ALTER TABLE public.site OWNER TO "ojs-ci";

--
-- Name: COLUMN site.redirect; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.site.redirect IS 'If not 0, redirect to the specified journal/conference/... site.';


--
-- Name: COLUMN site.primary_locale; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.site.primary_locale IS 'Primary locale for the site.';


--
-- Name: COLUMN site.installed_locales; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.site.installed_locales IS 'Locales for which support has been installed.';


--
-- Name: COLUMN site.supported_locales; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.site.supported_locales IS 'Locales supported by the site (for hosted journals/conferences/...).';


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.site_settings (
    setting_name character varying(255) NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_value text
);


ALTER TABLE public.site_settings OWNER TO "ojs-ci";

--
-- Name: stage_assignments; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.stage_assignments OWNER TO "ojs-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.stage_assignments_stage_assignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stage_assignments_stage_assignment_id_seq OWNER TO "ojs-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.stage_assignments_stage_assignment_id_seq OWNED BY public.stage_assignments.stage_assignment_id;


--
-- Name: static_page_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.static_page_settings (
    static_page_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.static_page_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN static_page_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.static_page_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: static_pages; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.static_pages (
    static_page_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    context_id bigint NOT NULL
);


ALTER TABLE public.static_pages OWNER TO "ojs-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.static_pages_static_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.static_pages_static_page_id_seq OWNER TO "ojs-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.static_pages_static_page_id_seq OWNED BY public.static_pages.static_page_id;


--
-- Name: subeditor_submission_group; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.subeditor_submission_group (
    context_id bigint NOT NULL,
    assoc_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.subeditor_submission_group OWNER TO "ojs-ci";

--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.submission_comments OWNER TO "ojs-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submission_comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_comments_comment_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submission_comments_comment_id_seq OWNED BY public.submission_comments.comment_id;


--
-- Name: submission_file_revisions; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.submission_file_revisions (
    revision_id bigint NOT NULL,
    submission_file_id bigint NOT NULL,
    file_id bigint NOT NULL
);


ALTER TABLE public.submission_file_revisions OWNER TO "ojs-ci";

--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submission_file_revisions_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_file_revisions_revision_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submission_file_revisions_revision_id_seq OWNED BY public.submission_file_revisions.revision_id;


--
-- Name: submission_file_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.submission_file_settings (
    submission_file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) DEFAULT 'string'::character varying NOT NULL
);


ALTER TABLE public.submission_file_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN submission_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.submission_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.submission_files OWNER TO "ojs-ci";

--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submission_files_submission_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_files_submission_file_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submission_files_submission_file_id_seq OWNED BY public.submission_files.submission_file_id;


--
-- Name: submission_search_keyword_list; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.submission_search_keyword_list (
    keyword_id bigint NOT NULL,
    keyword_text character varying(60) NOT NULL
);


ALTER TABLE public.submission_search_keyword_list OWNER TO "ojs-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submission_search_keyword_list_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_search_keyword_list_keyword_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submission_search_keyword_list_keyword_id_seq OWNED BY public.submission_search_keyword_list.keyword_id;


--
-- Name: submission_search_object_keywords; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.submission_search_object_keywords (
    object_id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    pos integer NOT NULL
);


ALTER TABLE public.submission_search_object_keywords OWNER TO "ojs-ci";

--
-- Name: COLUMN submission_search_object_keywords.pos; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.submission_search_object_keywords.pos IS 'Word position of the keyword in the object.';


--
-- Name: submission_search_objects; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.submission_search_objects (
    object_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    type integer NOT NULL,
    assoc_id bigint
);


ALTER TABLE public.submission_search_objects OWNER TO "ojs-ci";

--
-- Name: COLUMN submission_search_objects.type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.submission_search_objects.type IS 'Type of item. E.g., abstract, fulltext, etc.';


--
-- Name: COLUMN submission_search_objects.assoc_id; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.submission_search_objects.assoc_id IS 'Optional ID of an associated record (e.g., a file_id)';


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submission_search_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_search_objects_object_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submission_search_objects_object_id_seq OWNED BY public.submission_search_objects.object_id;


--
-- Name: submission_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.submission_settings (
    submission_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.submission_settings OWNER TO "ojs-ci";

--
-- Name: submission_tombstones; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.submission_tombstones OWNER TO "ojs-ci";

--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submission_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_tombstones_tombstone_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submission_tombstones_tombstone_id_seq OWNED BY public.submission_tombstones.tombstone_id;


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.submissions OWNER TO "ojs-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.submissions_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submissions_submission_id_seq OWNER TO "ojs-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.submissions_submission_id_seq OWNED BY public.submissions.submission_id;


--
-- Name: subscription_type_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.subscription_type_settings (
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.subscription_type_settings OWNER TO "ojs-ci";

--
-- Name: subscription_types; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.subscription_types (
    type_id bigint NOT NULL,
    journal_id bigint NOT NULL,
    cost double precision NOT NULL,
    currency_code_alpha character varying(3) NOT NULL,
    duration smallint,
    format smallint NOT NULL,
    institutional smallint DEFAULT '0'::smallint NOT NULL,
    membership smallint DEFAULT '0'::smallint NOT NULL,
    disable_public_display smallint NOT NULL,
    seq double precision NOT NULL
);


ALTER TABLE public.subscription_types OWNER TO "ojs-ci";

--
-- Name: subscription_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.subscription_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_types_type_id_seq OWNER TO "ojs-ci";

--
-- Name: subscription_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.subscription_types_type_id_seq OWNED BY public.subscription_types.type_id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.subscriptions (
    subscription_id bigint NOT NULL,
    journal_id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_id bigint NOT NULL,
    date_start date,
    date_end timestamp(0) without time zone,
    status smallint DEFAULT '1'::smallint NOT NULL,
    membership character varying(40),
    reference_number character varying(40),
    notes text
);


ALTER TABLE public.subscriptions OWNER TO "ojs-ci";

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.subscriptions_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_subscription_id_seq OWNER TO "ojs-ci";

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.subscriptions_subscription_id_seq OWNED BY public.subscriptions.subscription_id;


--
-- Name: temporary_files; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.temporary_files OWNER TO "ojs-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.temporary_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temporary_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.temporary_files_file_id_seq OWNED BY public.temporary_files.file_id;


--
-- Name: usage_stats_temporary_records; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.usage_stats_temporary_records OWNER TO "ojs-ci";

--
-- Name: user_group_settings; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.user_group_settings (
    user_group_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.user_group_settings OWNER TO "ojs-ci";

--
-- Name: COLUMN user_group_settings.setting_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.user_group_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: user_group_stage; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.user_group_stage (
    context_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    stage_id bigint NOT NULL
);


ALTER TABLE public.user_group_stage OWNER TO "ojs-ci";

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.user_groups OWNER TO "ojs-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.user_groups_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_user_group_id_seq OWNER TO "ojs-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.user_groups_user_group_id_seq OWNED BY public.user_groups.user_group_id;


--
-- Name: user_interests; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.user_interests (
    user_id bigint NOT NULL,
    controlled_vocab_entry_id bigint NOT NULL
);


ALTER TABLE public.user_interests OWNER TO "ojs-ci";

--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.user_settings OWNER TO "ojs-ci";

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: ojs-ci
--

CREATE TABLE public.user_user_groups (
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO "ojs-ci";

--
-- Name: users; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.users OWNER TO "ojs-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO "ojs-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: ojs-ci
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


ALTER TABLE public.versions OWNER TO "ojs-ci";

--
-- Name: COLUMN versions.major; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.major IS 'Major component of version number, e.g. the 2 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.minor; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.minor IS 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.revision; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.revision IS 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.build; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.build IS 'Build component of version number, e.g. the 0 in OJS 2.3.8-0';


--
-- Name: COLUMN versions.current; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.current IS '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.';


--
-- Name: COLUMN versions.product_type; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.product_type IS 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf';


--
-- Name: COLUMN versions.product; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.product IS 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.';


--
-- Name: COLUMN versions.product_class_name; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.product_class_name IS 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.';


--
-- Name: COLUMN versions.lazy_load; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.lazy_load IS '1 iff the row describes a lazy-load plugin; 0 otherwise';


--
-- Name: COLUMN versions.sitewide; Type: COMMENT; Schema: public; Owner: ojs-ci
--

COMMENT ON COLUMN public.versions.sitewide IS '1 iff the row describes a site-wide plugin; 0 otherwise';


--
-- Name: access_key_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('public.access_keys_access_key_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.announcement_types ALTER COLUMN type_id SET DEFAULT nextval('public.announcement_types_type_id_seq'::regclass);


--
-- Name: announcement_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.announcements ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcements_announcement_id_seq'::regclass);


--
-- Name: auth_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN auth_id SET DEFAULT nextval('public.auth_sources_auth_id_seq'::regclass);


--
-- Name: author_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: citation_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.citations ALTER COLUMN citation_id SET DEFAULT nextval('public.citations_citation_id_seq'::regclass);


--
-- Name: completed_payment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.completed_payments ALTER COLUMN completed_payment_id SET DEFAULT nextval('public.completed_payments_completed_payment_id_seq'::regclass);


--
-- Name: controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('public.controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('public.data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: edit_decision_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('public.edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_log ALTER COLUMN log_id SET DEFAULT nextval('public.email_log_log_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_email_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates_default ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_default_email_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.event_log ALTER COLUMN log_id SET DEFAULT nextval('public.event_log_log_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


--
-- Name: filter_group_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('public.filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filter_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.filters ALTER COLUMN filter_id SET DEFAULT nextval('public.filters_filter_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: institutional_subscription_ip_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.institutional_subscription_ip ALTER COLUMN institutional_subscription_ip_id SET DEFAULT nextval('public.institutional_subscription_ip_institutional_subscription_ip_seq'::regclass);


--
-- Name: institutional_subscription_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.institutional_subscriptions ALTER COLUMN institutional_subscription_id SET DEFAULT nextval('public.institutional_subscriptions_institutional_subscription_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issue_files ALTER COLUMN file_id SET DEFAULT nextval('public.issue_files_file_id_seq'::regclass);


--
-- Name: galley_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issue_galleys ALTER COLUMN galley_id SET DEFAULT nextval('public.issue_galleys_galley_id_seq'::regclass);


--
-- Name: issue_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issues ALTER COLUMN issue_id SET DEFAULT nextval('public.issues_issue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: journal_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.journals ALTER COLUMN journal_id SET DEFAULT nextval('public.journals_journal_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.library_files ALTER COLUMN file_id SET DEFAULT nextval('public.library_files_file_id_seq'::regclass);


--
-- Name: metadata_description_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.metadata_descriptions ALTER COLUMN metadata_description_id SET DEFAULT nextval('public.metadata_descriptions_metadata_description_id_seq'::regclass);


--
-- Name: navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_item_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menu_items ALTER COLUMN navigation_menu_item_id SET DEFAULT nextval('public.navigation_menu_items_navigation_menu_item_id_seq'::regclass);


--
-- Name: navigation_menu_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menus ALTER COLUMN navigation_menu_id SET DEFAULT nextval('public.navigation_menus_navigation_menu_id_seq'::regclass);


--
-- Name: note_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Name: notification_mail_list_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notification_mail_list ALTER COLUMN notification_mail_list_id SET DEFAULT nextval('public.notification_mail_list_notification_mail_list_id_seq'::regclass);


--
-- Name: setting_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notification_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: galley_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publication_galleys ALTER COLUMN galley_id SET DEFAULT nextval('public.publication_galleys_galley_id_seq'::regclass);


--
-- Name: publication_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);


--
-- Name: query_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.queries ALTER COLUMN query_id SET DEFAULT nextval('public.queries_query_id_seq'::regclass);


--
-- Name: queued_payment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.queued_payments ALTER COLUMN queued_payment_id SET DEFAULT nextval('public.queued_payments_queued_payment_id_seq'::regclass);


--
-- Name: review_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_assignments ALTER COLUMN review_id SET DEFAULT nextval('public.review_assignments_review_id_seq'::regclass);


--
-- Name: review_form_element_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('public.review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_form_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('public.review_forms_review_form_id_seq'::regclass);


--
-- Name: review_round_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('public.review_rounds_review_round_id_seq'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- Name: stage_assignment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('public.stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: static_page_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.static_pages ALTER COLUMN static_page_id SET DEFAULT nextval('public.static_pages_static_page_id_seq'::regclass);


--
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.submission_comments_comment_id_seq'::regclass);


--
-- Name: revision_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_file_revisions ALTER COLUMN revision_id SET DEFAULT nextval('public.submission_file_revisions_revision_id_seq'::regclass);


--
-- Name: submission_file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN submission_file_id SET DEFAULT nextval('public.submission_files_submission_file_id_seq'::regclass);


--
-- Name: keyword_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('public.submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('public.submission_search_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.submission_tombstones_tombstone_id_seq'::regclass);


--
-- Name: submission_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submissions ALTER COLUMN submission_id SET DEFAULT nextval('public.submissions_submission_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.subscription_types ALTER COLUMN type_id SET DEFAULT nextval('public.subscription_types_type_id_seq'::regclass);


--
-- Name: subscription_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN subscription_id SET DEFAULT nextval('public.subscriptions_subscription_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.temporary_files ALTER COLUMN file_id SET DEFAULT nextval('public.temporary_files_file_id_seq'::regclass);


--
-- Name: user_group_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('public.user_groups_user_group_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.access_keys_access_key_id_seq', 1, false);


--
-- Data for Name: announcement_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.announcement_settings (announcement_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_type_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.announcement_type_settings (type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_types; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.announcement_types (type_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.announcement_types_type_id_seq', 1, false);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.announcements_announcement_id_seq', 1, false);


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.auth_sources (auth_id, title, plugin, auth_default, settings) FROM stdin;
\.


--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.auth_sources_auth_id_seq', 1, false);


--
-- Data for Name: author_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.author_settings (author_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	affiliation	University of Cape Town
1		country	ZA
1	en_US	familyName	Mwandenga
1	en_US	givenName	Alan
2	en_US	affiliation	
2	fr_CA	affiliation	
2	en_US	biography	
2	fr_CA	biography	
2		country	ZA
2	en_US	familyName	Ipsum
2	fr_CA	familyName	
2	en_US	givenName	Lorem
2	fr_CA	givenName	
2		orcid	
2	en_US	preferredPublicName	
2	fr_CA	preferredPublicName	
2		url	
4	en_US	affiliation	
4	fr_CA	affiliation	
4	en_US	biography	
4	fr_CA	biography	
4		country	ZA
4	en_US	familyName	Ipsum
4	fr_CA	familyName	
4	en_US	givenName	Lorem
4	fr_CA	givenName	
4		orcid	
4	en_US	preferredPublicName	
4	fr_CA	preferredPublicName	
4		url	
3	en_US	affiliation	University of Cape Town
3	fr_CA	affiliation	
3	en_US	biography	
3	fr_CA	biography	
3		country	ZA
3	en_US	familyName	Mwandenga Version 2
3	fr_CA	familyName	
3	en_US	givenName	Alan
3	fr_CA	givenName	
3		orcid	
3	en_US	preferredPublicName	
3	fr_CA	preferredPublicName	
3		url	
5	en_US	affiliation	University of Bologna
5		country	IT
5	en_US	familyName	Corino
5	en_US	givenName	Carlo
6	en_US	affiliation	University of Windsor
6		country	CA
6	en_US	familyName	Kwantes
6	en_US	givenName	Catherine
7	en_US	affiliation	University of Alberta
7		country	CA
7	en_US	familyName	Montgomerie
7	en_US	givenName	Craig
8	en_US	affiliation	University of Victoria
8	fr_CA	affiliation	
8	en_US	biography	
8	fr_CA	biography	
8		country	CA
8	en_US	familyName	Irvine
8	fr_CA	familyName	
8	en_US	givenName	Mark
8	fr_CA	givenName	
8		orcid	
8	en_US	preferredPublicName	
8	fr_CA	preferredPublicName	
8		url	
9	en_US	affiliation	Alexandria University
9		country	EG
9	en_US	familyName	Diouf
9	en_US	givenName	Diaga
10	en_US	affiliation	University of Toronto
10		country	CA
10	en_US	familyName	Phillips
10	en_US	givenName	Dana
11	en_US	affiliation	University College Cork
11		country	IE
11	en_US	familyName	Sokoloff
11	en_US	givenName	Domatilia
12	en_US	affiliation	Indiana University
12		country	US
12	en_US	familyName	Ostrom
12	en_US	givenName	Elinor
13	en_US	affiliation	Indiana University
13	fr_CA	affiliation	
13	en_US	biography	
13	fr_CA	biography	
13		country	US
13	en_US	familyName	van Laerhoven
13	fr_CA	familyName	
13	en_US	givenName	Frank
13	fr_CA	givenName	
13		orcid	
13	en_US	preferredPublicName	
13	fr_CA	preferredPublicName	
13		url	
14	en_US	affiliation	University of Rome
14		country	IT
14	en_US	familyName	Paglieri
14	en_US	givenName	Fabio
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
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, seq, user_group_id) FROM stdin;
1	amwandenga@mailinator.com	1	1	0	14
2	lorem@mailinator.com	1	1	1	14
4	lorem@mailinator.com	1	2	0	14
3	amwandenga@mailinator.com	1	2	0	14
5	ccorino@mailinator.com	1	3	0	14
6	ckwantes@mailinator.com	1	4	0	14
7	cmontgomerie@mailinator.com	1	5	0	14
8	mirvine@mailinator.com	1	5	1	14
9	ddiouf@mailinator.com	1	6	0	14
10	dphillips@mailinator.com	1	7	0	14
11	dsokoloff@mailinator.com	1	8	0	14
12	eostrom@mailinator.com	1	9	0	14
13	fvanlaerhoven@mailinator.com	1	9	1	14
14	fpaglieri@mailinator.com	1	10	0	14
15	jnovak@mailinator.com	1	11	0	14
16	kalkhafaji@mailinator.com	1	12	0	14
17	mmorse@mailinator.com	1	12	1	14
18	lchristopher@mailinator.com	1	13	0	14
19	lkumiega@mailinator.com	1	14	0	14
20	pdaniel@mailinator.com	1	15	0	14
21	rbaiyewu@mailinator.com	1	16	0	14
22	rrossi@mailinator.com	1	17	0	14
23	vkarbasizaed@mailinator.com	1	18	0	14
24	vwilliamson@mailinator.com	1	19	0	14
25	zwoods@mailinator.com	1	20	0	14
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 25, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.categories (category_id, context_id, parent_id, seq, path, image) FROM stdin;
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Data for Name: category_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.category_settings (category_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: citation_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.citation_settings (citation_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: citations; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.citations (citation_id, publication_id, raw_citation, seq) FROM stdin;
\.


--
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.citations_citation_id_seq', 1, false);


--
-- Data for Name: completed_payments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.completed_payments (completed_payment_id, "timestamp", payment_type, context_id, user_id, assoc_id, amount, currency_code_alpha, payment_method_plugin_name) FROM stdin;
\.


--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.completed_payments_completed_payment_id_seq', 1, false);


--
-- Data for Name: controlled_vocab_entries; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.controlled_vocab_entries (controlled_vocab_entry_id, controlled_vocab_id, seq) FROM stdin;
15	2	1
16	2	2
29	7	1
30	7	2
33	12	1
34	12	2
35	12	3
36	12	4
37	17	1
38	17	2
39	22	1
40	22	2
41	22	3
42	22	4
43	22	5
44	22	6
45	22	7
46	37	1
47	37	2
48	42	1
49	42	2
50	42	3
51	52	1
52	57	1
53	57	2
54	57	3
55	57	4
56	62	1
57	62	2
58	67	1
59	72	1
60	72	2
61	72	3
62	72	4
63	72	5
64	72	6
65	72	7
66	72	8
67	72	9
68	72	10
69	82	1
70	82	2
71	92	1
72	92	2
73	92	3
\.


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 73, true);


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
15	en_US	submissionKeyword	Professional Development	string
16	en_US	submissionKeyword	Social Transformation	string
29	en_US	submissionKeyword	Professional Development	string
30	en_US	submissionKeyword	Social Transformation	string
33	en_US	submissionKeyword	pigs	string
34	en_US	submissionKeyword	food security	string
35	en_US	submissionKeyword	Professional Development	string
36	en_US	submissionKeyword	Social Transformation	string
37	en_US	submissionKeyword	employees	string
38	en_US	submissionKeyword	survey	string
39	en_US	submissionKeyword	Integrating Technology	string
40	en_US	submissionKeyword	Computer Skills	string
41	en_US	submissionKeyword	Survey	string
42	en_US	submissionKeyword	Alberta	string
43	en_US	submissionKeyword	National	string
44	en_US	submissionKeyword	Provincial	string
45	en_US	submissionKeyword	Professional Development	string
46	en_US	submissionKeyword	education	string
47	en_US	submissionKeyword	citizenship	string
48	en_US	submissionKeyword	Common pool resource	string
49	en_US	submissionKeyword	common property	string
50	en_US	submissionKeyword	intellectual developments	string
51	en_US	submissionKeyword	water	string
52	en_US	submissionKeyword	Development	string
53	en_US	submissionKeyword	engineering education	string
54	en_US	submissionKeyword	service learning	string
55	en_US	submissionKeyword	sustainability	string
56	en_US	submissionKeyword	pigs	string
57	en_US	submissionKeyword	food security	string
58	en_US	submissionKeyword	water	string
59	en_US	submissionKeyword	21st Century	string
60	en_US	submissionKeyword	Diversity	string
61	en_US	submissionKeyword	Multilingual	string
62	en_US	submissionKeyword	Multiethnic	string
63	en_US	submissionKeyword	Participatory Pedagogy	string
64	en_US	submissionKeyword	Language	string
65	en_US	submissionKeyword	Culture	string
66	en_US	submissionKeyword	Gender	string
67	en_US	submissionKeyword	Egalitarianism	string
68	en_US	submissionKeyword	Social Transformation	string
69	en_US	submissionKeyword	cattle	string
70	en_US	submissionKeyword	food security	string
71	en_US	submissionKeyword	Self-Organization	string
72	en_US	submissionKeyword	Multi-Level Institutions	string
73	en_US	submissionKeyword	Goverance	string
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: ojs-ci
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
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 101, true);


--
-- Data for Name: custom_issue_orders; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.custom_issue_orders (issue_id, journal_id, seq) FROM stdin;
\.


--
-- Data for Name: custom_section_orders; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.custom_section_orders (issue_id, section_id, seq) FROM stdin;
\.


--
-- Data for Name: data_object_tombstone_oai_set_objects; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.data_object_tombstone_oai_set_objects (object_id, tombstone_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 6, true);


--
-- Data for Name: data_object_tombstone_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.data_object_tombstone_settings (tombstone_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: data_object_tombstones; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.data_object_tombstones (tombstone_id, data_object_id, date_deleted, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 3, true);


--
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
1	1	0	1	0	3	8	2023-02-28 21:55:41
2	1	1	3	1	3	1	2023-02-28 21:55:58
3	1	0	4	0	3	7	2023-02-28 21:56:06
4	2	0	1	0	3	8	2023-02-28 21:58:11
5	2	2	3	1	6	11	2023-02-28 21:58:26
6	3	0	1	0	3	8	2023-02-28 21:58:46
7	3	3	3	1	3	1	2023-02-28 21:59:00
8	5	0	1	0	3	8	2023-02-28 21:59:35
9	5	4	3	1	3	1	2023-02-28 21:59:48
10	5	0	4	0	3	7	2023-02-28 21:59:55
11	6	0	1	0	3	8	2023-02-28 22:00:20
12	6	5	3	1	3	1	2023-02-28 22:00:33
13	6	0	4	0	3	7	2023-02-28 22:00:40
14	7	0	1	0	3	8	2023-02-28 22:01:02
15	9	0	1	0	3	8	2023-02-28 22:01:57
16	9	7	3	1	3	1	2023-02-28 22:02:10
17	9	0	4	0	3	7	2023-02-28 22:02:17
18	10	0	1	0	3	8	2023-02-28 22:02:48
19	12	0	1	0	3	8	2023-02-28 22:03:48
20	13	0	1	0	3	8	2023-02-28 22:04:15
21	13	10	3	1	3	2	2023-02-28 22:05:05
22	15	0	1	0	3	8	2023-02-28 22:05:35
23	15	11	3	1	3	1	2023-02-28 22:05:46
24	15	0	4	0	3	7	2023-02-28 22:05:53
25	17	0	1	0	3	8	2023-02-28 22:06:31
26	17	12	3	1	3	1	2023-02-28 22:06:42
27	17	0	4	0	3	7	2023-02-28 22:06:49
28	18	0	1	0	3	9	2023-02-28 22:08:21
29	19	0	1	0	3	8	2023-02-28 22:08:42
30	19	13	3	1	3	1	2023-02-28 22:08:53
\.


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 30, true);


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
\.


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 1, false);


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.email_templates (email_id, email_key, context_id, enabled) FROM stdin;
\.


--
-- Data for Name: email_templates_default; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.email_templates_default (email_id, email_key, can_disable, can_edit, from_role_id, to_role_id, stage_id) FROM stdin;
1	NOTIFICATION	0	1	\N	\N	\N
2	NOTIFICATION_CENTER_DEFAULT	0	1	\N	\N	\N
3	PASSWORD_RESET_CONFIRM	0	1	\N	\N	\N
4	USER_REGISTER	0	1	\N	\N	\N
5	USER_VALIDATE	0	1	\N	\N	\N
6	REVIEWER_REGISTER	0	1	\N	\N	\N
7	PUBLISH_NOTIFY	0	1	\N	\N	\N
8	LOCKSS_EXISTING_ARCHIVE	0	1	\N	\N	\N
9	LOCKSS_NEW_ARCHIVE	0	1	\N	\N	\N
10	SUBMISSION_ACK	1	1	\N	65536	1
11	SUBMISSION_ACK_NOT_USER	1	1	\N	65536	1
12	EDITOR_ASSIGN	1	1	16	16	1
13	REVIEW_CANCEL	1	1	16	4096	3
14	REVIEW_REINSTATE	1	1	16	4096	3
15	REVIEW_REQUEST	1	1	16	4096	3
16	REVIEW_REQUEST_SUBSEQUENT	1	1	16	4096	3
17	REVIEW_REQUEST_ONECLICK	1	1	16	4096	3
18	REVIEW_REQUEST_ONECLICK_SUBSEQUENT	1	1	16	4096	3
19	REVIEW_REQUEST_ATTACHED	0	1	16	4096	3
20	REVIEW_REQUEST_ATTACHED_SUBSEQUENT	0	1	16	4096	3
21	REVIEW_REQUEST_REMIND_AUTO	0	1	\N	4096	3
22	REVIEW_REQUEST_REMIND_AUTO_ONECLICK	0	1	\N	4096	3
23	REVIEW_CONFIRM	1	1	4096	16	3
24	REVIEW_DECLINE	1	1	4096	16	3
25	REVIEW_ACK	1	1	16	4096	3
26	REVIEW_REMIND	0	1	16	4096	3
27	REVIEW_REMIND_AUTO	0	1	\N	4096	3
28	REVIEW_REMIND_ONECLICK	0	1	16	4096	3
29	REVIEW_REMIND_AUTO_ONECLICK	0	1	\N	4096	3
30	EDITOR_DECISION_ACCEPT	0	1	16	65536	3
31	EDITOR_DECISION_SEND_TO_EXTERNAL	0	1	16	65536	3
32	EDITOR_DECISION_SEND_TO_PRODUCTION	0	1	16	65536	5
33	EDITOR_DECISION_REVISIONS	0	1	16	65536	3
34	EDITOR_DECISION_RESUBMIT	0	1	16	65536	3
35	EDITOR_DECISION_DECLINE	0	1	16	65536	3
36	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536	1
37	EDITOR_RECOMMENDATION	0	1	16	16	3
38	COPYEDIT_REQUEST	1	1	16	4097	4
39	LAYOUT_REQUEST	1	1	16	4097	5
40	LAYOUT_COMPLETE	1	1	4097	16	5
41	EMAIL_LINK	0	1	1048576	\N	\N
42	SUBSCRIPTION_NOTIFY	0	1	\N	1048576	\N
43	OPEN_ACCESS_NOTIFY	0	1	\N	1048576	\N
44	SUBSCRIPTION_BEFORE_EXPIRY	0	1	\N	1048576	\N
45	SUBSCRIPTION_AFTER_EXPIRY	0	1	\N	1048576	\N
46	SUBSCRIPTION_AFTER_EXPIRY_LAST	0	1	\N	1048576	\N
47	SUBSCRIPTION_PURCHASE_INDL	0	1	\N	2097152	\N
48	SUBSCRIPTION_PURCHASE_INSTL	0	1	\N	2097152	\N
49	SUBSCRIPTION_RENEW_INDL	0	1	\N	2097152	\N
50	SUBSCRIPTION_RENEW_INSTL	0	1	\N	2097152	\N
51	CITATION_EDITOR_AUTHOR_QUERY	0	1	\N	\N	4
52	REVISED_VERSION_NOTIFY	0	1	\N	16	3
53	STATISTICS_REPORT_NOTIFICATION	1	1	16	17	\N
54	ANNOUNCEMENT	0	1	16	1048576	\N
55	ORCID_COLLECT_AUTHOR_ID	0	1	\N	\N	\N
56	ORCID_REQUEST_AUTHOR_AUTHORIZATION	0	1	\N	\N	\N
57	MANUAL_PAYMENT_NOTIFICATION	0	1	\N	\N	\N
58	PAYPAL_INVESTIGATE_PAYMENT	0	1	\N	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$contextName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
USER_REGISTER	en_US	Journal Registration	{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal's list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE	en_US	Validate Your Account	{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to validate their email account.
REVIEWER_REGISTER	en_US	Registration as Reviewer with {$contextName}	In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you'll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.
PUBLISH_NOTIFY	en_US	New Issue Published	Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Editor's User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.
LOCKSS_EXISTING_ARCHIVE	en_US	Archiving Request for {$contextName}	Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal's LOCKSS Publisher Manifest.
LOCKSS_NEW_ARCHIVE	en_US	Archiving Request for {$contextName}	Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.
EDITOR_ASSIGN	en_US	Editorial Assignment	{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.	This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.
REVIEW_CANCEL	en_US	Request for Review Cancelled	{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal's review process in the future.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
REVIEW_REINSTATE	en_US	Request for Review Reinstated	{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal's review process.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.
REVIEW_REQUEST	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)
REVIEW_REQUEST_ATTACHED_SUBSEQUENT	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n	This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)
REVIEW_REQUEST_SUBSEQUENT	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)
REVIEW_REQUEST_ONECLICK	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.
REVIEW_CONFIRM	en_US	Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}	This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.
REVIEW_REQUEST_ONECLICK_SUBSEQUENT	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.
REVIEW_REQUEST_ATTACHED	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n	This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)
REVIEW_DECLINE	en_US	Unable to Review	Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}	This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.
REVIEW_REQUEST_REMIND_AUTO	en_US	Article Review Request Reminder	{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REQUEST_REMIND_AUTO_ONECLICK	en_US	Article Review Request	{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_ACK	en_US	Article Review Acknowledgement	{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.	This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.
REVIEW_REMIND	en_US	Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Section Editor to remind a reviewer that their review is due.
REVIEW_REMIND_AUTO	en_US	Automated Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REMIND_ONECLICK	en_US	Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Section Editor to remind a reviewer that their review is due.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Editor Decision	\n\t\t\t{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission	This email is sent to the author if the editor declines their submission initially, before the review stage
REVIEW_REMIND_AUTO_ONECLICK	en_US	Automated Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
EDITOR_DECISION_ACCEPT	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission	This email from the Editor or Section Editor to an Author notifies them of a final "accept submission" decision regarding their submission.
EDITOR_DECISION_SEND_TO_EXTERNAL	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}	This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.
EDITOR_DECISION_SEND_TO_PRODUCTION	en_US	Editor Decision	{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}	This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.
EDITOR_DECISION_REVISIONS	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required	This email from the Editor or Section Editor to an Author notifies them of a final "revisions required" decision regarding their submission.
EDITOR_DECISION_RESUBMIT	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review	This email from the Editor or Section Editor to an Author notifies them of a final "resubmit" decision regarding their submission.
EDITOR_DECISION_DECLINE	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission	This email from the Editor or Section Editor to an Author notifies them of a final "decline" decision regarding their submission.
EDITOR_RECOMMENDATION	en_US	Editor Recommendation	{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}	This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.
COPYEDIT_REQUEST	en_US	Copyediting Request	{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}	This email is sent by a Section Editor to a submission's Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.
LAYOUT_REQUEST	en_US	Request Galleys	{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal's standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.	This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.
LAYOUT_COMPLETE	en_US	Galleys Complete	{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}	This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.
EMAIL_LINK	en_US	Article of Possible Interest	Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.	This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.
REVISED_VERSION_NOTIFY	en_US	Revised Version Uploaded	Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent to the assigned editor when author uploads a revised version of an article.
SUBSCRIPTION_NOTIFY	en_US	Subscription Notification	{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal's URL along with instructions for access.
OPEN_ACCESS_NOTIFY	en_US	Issue Now Open Access	Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.
SUBSCRIPTION_BEFORE_EXPIRY	en_US	Notice of Subscription Expiry	{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a subscriber that their subscription will soon expire. It provides the journal's URL along with instructions for access.
SUBSCRIPTION_AFTER_EXPIRY	en_US	Subscription Expired	{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a subscriber that their subscription has expired. It provides the journal's URL along with instructions for access.
SUBSCRIPTION_AFTER_EXPIRY_LAST	en_US	Subscription Expired - Final Reminder	{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a subscriber that their subscription has expired. It provides the journal's URL along with instructions for access.
SUBSCRIPTION_PURCHASE_INDL	en_US	Subscription Purchase: Individual	An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.
SUBSCRIPTION_PURCHASE_INSTL	en_US	Subscription Purchase: Institutional	An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to 'Active'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.
SUBSCRIPTION_RENEW_INDL	en_US	Subscription Renewal: Individual	An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.
SUBSCRIPTION_RENEW_INSTL	en_US	Subscription Renewal: Institutional	An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.
CITATION_EDITOR_AUTHOR_QUERY	en_US	Citation Editing	{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n	This email allows copyeditors to request additional information about references from authors.
STATISTICS_REPORT_NOTIFICATION	en_US	Editorial activity for {$month}, {$year}	\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n\t<li>New submissions this month: {$newSubmissions}</li>\n\t<li>Declined submissions this month: {$declinedSubmissions}</li>\n\t<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n\t<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href="{$editorialStatsLink}">editorial trends</a> and <a href="{$publicationStatsLink}">published article stats</a>. A full copy of this month's editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}	This email is automatically sent monthly to editors and journal managers to provide them a system health overview.
ANNOUNCEMENT	en_US	{$title}	<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href="{$url}">full announcement</a>.	This email is sent when a new announcement is created.
ORCID_COLLECT_AUTHOR_ID	en_US	Submission ORCID	Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href="{$orcidAboutUrl}">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	This email template is used to collect the ORCID id's from authors.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	en_US	Requesting ORCID record access	Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission "{$submissionTitle}" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href="{$orcidAboutUrl}">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n	This email template is used to request ORCID record access from authors.
MANUAL_PAYMENT_NOTIFICATION	en_US	Manual Payment Notification	A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems' Manual Payment plugin.	This email template is used to notify a journal manager contact that a manual payment was requested.
PAYPAL_INVESTIGATE_PAYMENT	en_US	Unusual PayPal Activity	Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n	This email template is used to notify a journal's primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.
NOTIFICATION	fr_CA	Nouvel avis de {$siteTitle}	Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d'avis.
NOTIFICATION_CENTER_DEFAULT	fr_CA	Un message à propos de la revue {$contextName}	Prière de saisir votre message.	Message blanc par défaut utilisé pour concevoir d'autres messages.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé à l'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.
USER_REGISTER	fr_CA	Inscription à la revue	{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu'utilisateur-trice pour la revue {$contextName}. Votre nom d'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec la revue via son site Web. À n'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices de la revue en nous contactant.<br />\n<br />\nNom d'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue à la revue et l'informer de son nom d'utilisateur-trice et de son mot de passe.
USER_VALIDATE	fr_CA	Valider votre compte	{$userFullName},<br />\n<br />\nVous avez créé un compte pour la revue {$contextName}. Pour pouvoir commencer à l'utiliser il nous faut d'abord valider votre adresse de courriel. Pour ce faire, vous n'avez qu'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.
REVIEWER_REGISTER	fr_CA	Inscription en tant qu'évaluateur-trice pour la revue {$contextName}	Compte tenu de votre expertise, nous avons pris l'initiative d'inscrire votre nom dans la base de données des évaluateurs-trices de la revue {$contextName}. Cela ne vous engage d'aucune façon, mais nous permet simplement de solliciter vos services pour l'évaluation d'une soumission. Si vous êtes invité-e à effectuer une évaluation, vous recevrez le titre et le résumé de l'article en question, et serez toujours libre d'accepter ou de refuser une telle invitation. À tout moment, il vous est également possible de demander à ce que votre nom soit retiré de la liste des évaluateurs-trices.<br />\n<br />\nNous vous acheminons un nom d'utilisateur-trice et un mot de passe, car tous deux sont requis pour tout échange avec la revue via son site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise à jour de votre profil, y compris vos domaines d'intérêt en matière d'évaluation.<br />\n<br />\nNom d'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un,une évaluateur-trice nouvellement inscrit-e, afin de lui souhaiter la bienvenue dans le système et l'informer de son nom d'utilisateur-trice et de son mot de passe.
PUBLISH_NOTIFY	fr_CA	Parution du dernier numéro	Lecteurs-trices,<br />\n<br />\nLe plus récent numéro de la revue {$contextName} vient d'être publié à l'adresse suivante : {$contextUrl}. Nous vous invitons à consulter le sommaire, puis à visiter notre site Web pour y lire les articles qui vous intéressent.<br />\n<br />\nNous vous remercions de l'intérêt que vous portez à notre revue,<br />\n{$editorialContactSignature}	Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices qu'un nouveau numéro est publié et les invite à visiter la revue en cliquant sur l'URL fourni.
COPYEDIT_REQUEST	fr_CA	Demande de révision d'une soumission	{$participantName},<br />\n<br />\nJ'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l'étape de production peut débuter.<br />\n<br />\nURL de la revue {$contextName} : {$contextUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$participantUsername}	Ce courriel du, de la rédacteur-trice de rubrique à un-e réviseur-e lui demande de procéder à la révision. Il fournit les renseignements sur la soumission et comment accéder à celle-ci.
LOCKSS_EXISTING_ARCHIVE	fr_CA	Demande d'archivage pour la revue {$contextName}	Cher,Chère [Bibliothécaire universitaire],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; est une revue pour laquelle un membre de votre faculté, [nom du membre], agit à titre de [titre de la position occupée]. La revue désire mettre en place un système d'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe - Plusieurs exemplaires assurent la sécurité) avec votre bibliothèque ainsi que celles d'autres universités.<br />\n<br />\n[Brève description de la revue]<br />\n<br />\nL'adresse URL pour le LOCKSS Publisher Manifest pour notre revue est : {$contextUrl}/gateway/lockss<br />\n<br />\nNous croyons savoir que vous participez déjà à LOCKSS. Si nous pouvons vous fournir des métadonnées supplémentaires afin d'inscrire notre revue avec votre version de LOCKSS, il nous fera plaisir de vous les fournir.<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel demande à un-e conservateur,trice d'archives LOCKSS d'envisager d'inclure cette revue dans leur archive. Il fournit l'adresse URL du LOCKSS Publisher Manifest de la revue.
LOCKSS_NEW_ARCHIVE	fr_CA	Demande d'archivage pour la revue {$contextName}	Cher,Chère [Bibliothécaire universitaire],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt;, est une revue pour laquelle un membre de votre faculté, [nom du membre], agit à titre de [titre de la fonction occupée]. La revue désire mettre en place un système d'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe) avec votre bibliothèque et celles d'autres universités.<br />\n<br />\n[Brève description de la revue]<br />\n<br />\nLe programme LOCKSS &lt;http://lockss.org/&gt;, une initiative de bibliothécaires et d'éditeurs internationaux, est une belle démonstration d'un dépôt d'archives assurant la préservation des documents. Voir les détails ci-dessous. Le logiciel est gratuit et fonctionne sur tout ordinateur personnel. Il est facile de le mettre en ligne et ne requiert que très peu de maintenance.<br />\n<br />\nPour nous aider dans le processus d'archivage de notre revue, nous vous invitons à devenir membre de la communauté LOCKSS, pour aider à recueillir et préserver des titres produits par votre faculté et par d'autres chercheurs à travers le monde. Pour ce faire, veuillez demander à quelqu'un de votre personnel de visiter le site Internet de LOCKSS pour voir les informations sur le fonctionnement du système. Nous attendons de vos nouvelles sur la faisabilité, pour vous, de fournir un support d'archivage pour cette revue.<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel encourage le ou la destinaire à participer à l'initiative LOCKSS et à inclure cette revue dans leur archives. Il fournit de l'information au sujet de LOCKSS et des façons de s'impliquer dans le projet.
SUBMISSION_ACK	fr_CA	Accusé de réception de la soumission	{$authorName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$contextName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$authorUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}	Ce courriel, lorsqu'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d'un manuscrit à la revue. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l'auteur-e pour sa soumission.
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$contextName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à la revue {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}	Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OJS signalés-es comme effectuant la soumission.
EDITOR_ASSIGN	fr_CA	Assignation d'un-e rédacteur-trice	{$editorialContactName},<br />\n<br />\nLa soumission intitulée « {$submissionTitle} » pour la revue {$contextName} vous a été attribuée. Vous êtes responsable, en tant que rédacteur-trice de rubrique, de la faire cheminer à travers le processus éditorial.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$editorUsername}<br />\n<br />\nMerci.	Ce courriel avise un,une rédacteur-trice de rubrique que le,la rédacteur-trice lui a assigné la tâche de suivre une soumission durant le processus éditorial. Il fournit des renseignements sur la soumission, et comment accéder au site Web de la revue.
REVIEW_CANCEL	fr_CA	Annulation de la demande d'évaluation	{$reviewerName},<br />\n<br />\nNous avons décidé d'annuler notre demande concernant l'évaluation du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName}. Nous sommes désolés des inconvénients que cela pourrait vous causer et espérons que nous pourrons de nouveau faire appel à vous pour contribuer au processus de révision par les pairs de cette revue dans le futur.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous.	Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice qui a une évaluation en cours, pour l'aviser que celle-ci a été annulée.
REVIEW_REINSTATE	fr_CA	Réintégration de la demande d'évaluation	{$reviewerName},<br />\n<br />\nNous souhaitons rétablir notre demande d'évaluation de la soumission, « {$ submissionTitle} » pour  la revue {$ contextName}. Nous espérons que vous pourrez contribuer au processus d'évaluation de cette revue.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec moi.	Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice qui a une évaluation en cours, pour l'aviser que la demande préalablement annulée a été rétablie.
REVIEW_REQUEST_ATTACHED	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} ». Nous espérons que vous envisagerez d'entreprendre cette tâche essentielle à la publication de la revue. Les directives d'évaluation de la revue se trouvent ci-dessous et la soumission est jointe au présent courriel. Votre évaluation de la soumission, ainsi que vos recommandations, devraient nous parvenir par courriel d'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez nous faire savoir par courriel d'ici le {$responseDueDate} si vous acceptez ou non d'effectuer cette évaluation.<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDirectives pour l'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n	Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice pour lui demander s'il ou elle accepte ou refuse la tâche d'évaluation d'une soumission. Il inclut la soumission en pièce jointe. Ce message est utilisé quand le processus de « Demande d'évaluation par pièce-jointe de courriel » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation . (Autrement, voir « Demande d'évaluation ».)
REVIEW_REQUEST	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$contextName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation. Le site Web se trouve à l'adresse suivante : {$contextUrl}<br />\n<br />\nLa date d'échéance de l'évaluation a été fixée au {$reviewDueDate}.<br />\n<br />\nSi vous n'avez pas de nom d'utilisateur-trice et de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}	Ce courriel du,de la rédacteur-trice à un,une évaluateur-trice demande que l'évaluateur-trice accepte ou refuse la tâche d'évaluation d'une soumission. Il fournit de l'information sur la soumission, tel son titre et un résumé, la date d'échéance pour l'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation. (Autrement voir « Demande d'évaluation d'un article (en pièce jointe) ».)
REVIEW_REQUEST_SUBSEQUENT	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\n<br />\nCeci concerne le manuscrit « {$submissionTitle} », qui est présentement évalué par {$contextName}.<br />\n<br />\nSuivant l'évaluation de la dernière version du manuscrit, l'auteur a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$contextUrl}<br />\n<br />\nL'évaluation est due pour le {$reviewDueDate}.<br />\n<br />\nSi vous n'avez pas vos nom d'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} » <br />\n<br />\n{$submissionAbstract}	Ce courriel du,de la rédacteur-trice de rubrique à un,une évaluateur-trice demande que l'évaluateur-trice accepte ou décline la tâche d'évaluation d'une soumission pour un cycle subséquent d'évaluation. Il contient des informations sur la soumission tel que son titre et un résumé, la date d'échéance pour faire l'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation (Autrement voir « Demande d'évaluation d'un article (cycle subséquent) ».)
REVIEW_REQUEST_ONECLICK	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$contextName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation.<br />\n<br />\nDate limite pour l'évaluation {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}.<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}	Ce courriel du,de la rédacteur-trice de rubrique à un,une évaluateur-trice demande que l'évaluateur-trice accepte ou décline la tâche d'évaluation d'une soumission. Il contient des informations sur la soumission tel que son titre et un résumé, la date d'échéance pour faire l'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation et que l'accès de l'évaluateur-trice en un clic a été activé.
REVIEW_REQUEST_ONECLICK_SUBSEQUENT	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\n<br />\nCeci concerne le manuscrit « {$submissionTitle} », qui est présentement évalué par la revue {$contextName}.<br />\n<br />\nSuivant l'évaluation de la dernière version du manuscrit, l'auteur a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations.<br />\n<br />\nL'évaluation est due pour le {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} » <br />\n<br />\n{$submissionAbstract}	Ce courriel du,de la rédacteur-trice de rubrique à un,une évaluateur-trice demande que l'évaluateur-trice accepte ou décline la tâche d'évaluation d'une soumission pour un cycle subséquent d'évaluation. Il contient des informations sur la soumission tel que son titre et un résumé, la date d'échéance pour faire l'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation et que l'accès de l'évaluateur-trice en un clic est activé.
MANUAL_PAYMENT_NOTIFICATION	fr_CA	Avis de paiement manuel	Un paiement manuel doit être traité pour la revue {$contextName} et l'utilisateur {$userFullName} (nom d'utilisateur &quot;{$userName}&quot;).<br />\n<br />\nL'élément facturé est &quot;{$itemName}&quot;.<br />\nLe coût est de {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.	Ce modèle de courriel est utilisé pour aviser un directeur de revue que le paiement manuel a été demandé.
REVIEW_REQUEST_ATTACHED_SUBSEQUENT	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\n<br />\nCeci concerne le manuscrit « {$submissionTitle} », qui est présentement évalué par la revue {$contextName}.<br />\n<br />\nSuivant l'évaluation de la dernière version du manuscrit, l'auteur-e a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nLes directives d'évaluation de la revue se trouvent ci-dessous et la soumission est jointe au présent courriel. Votre évaluation de la soumission, ainsi que vos recommandations, devraient nous parvenir par courriel d'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez nous faire savoir par courriel d'ici le {$responseDueDate} si vous acceptez ou non d'effectuer cette évaluation.<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDirectives pour l'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n	Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice pour lui demander s'il ou elle accepte ou refuse la tâche d'évaluation d'une soumission pour un cycle subséquent d'évaluation. Il inclut la soumission en pièce jointe. Ce message est utilisé quand le processus de « Demande d'évaluation par pièce-jointe de courriel » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation . (Autrement voir « Demande d'évaluation (cycle subséquent)».)
REVIEW_REQUEST_REMIND_AUTO	fr_CA	Rappel de demande d'évaluation d'un article	{$reviewerName},<br />\nCeci est un petit rappel concernant notre demande d'évaluation de « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n'avons pas reçu, comme nous l'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l'échéance du délai.\n<br />\nNous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d'entreprendre cette tâche essentielle à la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$contextUrl}<br />\n<br />\nL'évaluation est dû pour le {$reviewDueDate}.<br />\n<br />\nSi vous n'avez pas vos nom d'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}	Ce courriel est envoyé automatiquement lorsque la date d'échéance de confirmation d'un,une évaluateur-trice est révolue (voir Options d'évaluation sous Paramètres &gt; Flux des travaux &gt; Évaluation) et que l'accès de l'évaluateur-trice en un clic est désactivé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).
REVIEW_REQUEST_REMIND_AUTO_ONECLICK	fr_CA	Demande d'évaluation d'un article	{$reviewerName},<br />\nCeci est un petit rappel concernant notre demande d'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n'avons pas reçu, comme nous l'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l'échéance du délai.\n<br />\nNous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d'entreprendre cette tâche essentielle à la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations.<br />\n<br />\nL'évaluation est dû pour le {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}	Ce courriel est automatiquement envoyé lorsque la date d'échéance de confirmation d'un,une évaluateur-trice est écoulée (voir Options de révision sous Paramètres &gt; Flux des travaux &gt; Révision) et l'accès de l'évaluateur-trice en un clic est activé. Les tâches planifiées doivent être configurées et activées (voir le fichier de configuration du site).
REVIEW_CONFIRM	fr_CA	Acceptation d'évaluation	Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Je vous remercie d'avoir pensé à moi. Je devrais être en mesure de compléter l'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$reviewerName}	Ce courriel est envoyé par l'évaluateur-trice au,à la rédacteur-trice de rubrique en réponse à une demande d'évaluation, pour l'aviser que la demande a été acceptée et que l'évaluation sera complétée au plus tard à la date spécifiée.
REVIEW_DECLINE	fr_CA	Refus d'évaluation	Rédacteurs-trices,<br />\n<br />\nPour le moment, il m'est impossible d'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Je vous remercie d'avoir pensé à moi. N'hésitez pas à communiquer avec moi pour un autre projet.<br />\n<br />\n{$reviewerName}	Ce courriel est envoyé par l'évaluateur-trice au,à la rédacteur-trice de rubrique en réponse à la demande d'évaluation, pour l'aviser qu'il ou elle ne peut effectuer l'évaluation.
REVIEW_ACK	fr_CA	Accusé de réception de l'évaluation d'une soumission	{$reviewerName},<br />\n<br />\nNous vous remercions d'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.	Ce courriel est envoyé par le,la rédacteur-trice de rubrique, pour accuser réception d'une évaluation terminée et remercier l'évaluateur-trice de sa contribution.
REVIEW_REMIND	fr_CA	Rappel d'évaluation d'une soumission	{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.<br />\n<br />\nSi vous n'avez pas vos nom d'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le,la rédacteur-trice de rubrique pour rappeler à un,une évaluateur-trice que son évaluation est due.
REVIEW_REMIND_AUTO	fr_CA	Rappel automatique d'évaluation d'une soumission	{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n'avons pas reçu, comme nous l'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.<br />\n<br />\nSi vous n'avez pas vos nom d'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement lorsque la date d'échéance de remise d'une évaluation est révolue (voir Options d'évaluation sous Paramètres > Flux des travaux > Évaluation) et que l'accès de l'évaluateur-trice en un clic est désactivé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).
REVIEW_REMIND_ONECLICK	fr_CA	Rappel d'évaluation d'une soumission	{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice pour lui rappeler que son évaluation est due.
REVIEW_REMIND_AUTO_ONECLICK	fr_CA	Rappel automatique d'évaluation d'une soumission	{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n'avons pas reçu, comme nous l'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement lorsque la date d'échéance de remise d'une évaluation est révolue (voir Options d'évaluation sous Paramètres > Flux des travaux > Évaluation) et que l'accès de l'évaluateur-trice en un clic est activé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).
EDITOR_DECISION_ACCEPT	fr_CA	Décision du rédacteur	{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est d'accepter votre soumission.	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision finale concernant sa soumission, soit d'accepter sa soumission.
EDITOR_DECISION_SEND_TO_EXTERNAL	fr_CA	Décision du rédacteur	{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est d'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit d'envoyer sa soumission en évaluation externe.
EDITOR_DECISION_SEND_TO_PRODUCTION	fr_CA	Décision du rédacteur	{$authorName},<br />\n<br />\nL'édition de votre soumission « {$submissionTitle} » est complétée. Nous l'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit d'envoyer sa soumission en production.
EDITOR_DECISION_REVISIONS	fr_CA	Décision du rédacteur	{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est de vous demander d'apporter des révisions à votre soumission.	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision finale concernant sa soumission, soit de demander d'y apporter des révisions.
EDITOR_DECISION_RESUBMIT	fr_CA	Décision du rédacteur	{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est de vous demander d'apporter des révisions à votre soumission et de la soumettre à nouveau.	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique un-e auteur-e le,la notifie de la décision finale concernant sa soumission, soit de demander d'y apporter des révisions et la soumettre à nouveau.
EDITOR_DECISION_DECLINE	fr_CA	Décision du rédacteur	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est de refuser votre soumission.	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit de refuser la soumission.
EDITOR_DECISION_INITIAL_DECLINE	fr_CA	Décision du rédacteur	\n\t\t\t{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$contextName}.<br />\n<br />\nNotre décision est de refuser votre soumission.	Cet courriel est envoyé à l'auteur-e si la soumission est refusée avant même l'étape d'évaluation
EDITOR_RECOMMENDATION	fr_CA	Recommandation du rédacteur	{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$contextName} est de : {$recommendation}	Ce courriel envoyé par le,la rédacteur-trice ou le,la rédacteur-trice de rubrique en charge de la recommandation au,à la rédacteur-trice ou au,à la rédacteur-trice de rubrique en charge de la prise de décisions l'informe d'une recommandation finale concernant la soumission.
LAYOUT_REQUEST	fr_CA	Demande de mise en page des épreuves	{$participantName},<br />\n<br />\nJ'aimerais que vous prépariez les épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et utiliser les fichiers disponibles sous Fichiers prêts pour la production pour créer les épreuves en fonction des normes de la revue.<br />\n3. Téléverser les épreuves dans la section Épreuves.<br />\n4. Informer le,la rédacteur-trice, via une discussion sur la production, que les épreuves ont été téléversées et qu'elles sont prêtes.<br />\n<br />\nURL de la revue {$contextName} : {$contextUrl}<br />\nURL du manuscrit : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.	Ce courriel du,de la rédacteur-trice de rubrique au, à la responsable de la mise en page l'avise qu'il ou elle a été assigné-e à la réalisation de la mise en page de la soumission. Il fournit les renseignements sur la soumission et comment accéder à celle-ci.
LAYOUT_COMPLETE	fr_CA	Mise en page des épreuves terminée	{$editorialContactName},<br />\n<br />\nLes épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName} sont maintenant prêtes pour la relecture.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec moi.<br />\n<br />\n{$participantName}	Ce courriel du,de la responsable de la mise en page au,à la rédacteur-trice de rubrique l'avise que l'étape de mise en page est complétée.
EMAIL_LINK	fr_CA	Article potentiellement intéressant	Je pense que l'article suivant pourrait vous intéresser : « {$submissionTitle} » par {$authorName}, publié dans le volume {$volume}, numéro {$number} de ({$year}) de la revue {$contextName}, à l'adresse suivante : {$articleUrl}.	Ce modèle de courriel fournit à un,une lecteur-trice inscrit-e l'occasion d'envoyer de l'information à quelqu'un qui peut être intéressé par un article en particulier. Il est disponible via Outils de lecture et doit être activé par le,la directeur-trice de la revue à la page Gestion des outils de lecture.
SUBSCRIPTION_NOTIFY	fr_CA	Avis d'abonnement	{$subscriberName},<br />\n<br />\nVous êtes maintenant abonné-e à notre système de gestion de revue en ligne pour la revue {$contextName}, avec le type d'abonnement suivant  :<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour accéder au contenu destiné seulement aux abonnés, connectez-vous au système à l'aide de votre nom d'utilisateur-trice : {$username}.<br />\n<br />\nUne fois connecté-e dans le système, vous pouvez, en tout temps, modifier les renseignements de votre profil et votre mot de passe.<br />\n<br />\nVeuillez prendre note que si vous disposez d'un abonnement institutionnel, les utilisateurs-trices n'ont pas à entrer de nom d'utilisateur-trice puisque le système authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un,une lecteur-trice inscrit-e que le,la directeur-trice de la revue lui a créé un abonnement. Il fournit l'adresse URL de la revue ainsi que les instructions pour y accéder.
OPEN_ACCESS_NOTIFY	fr_CA	Le numéro est maintenant en libre accès	Chers lecteurs et lectrices,<br />\n<br />\nLa revue {$contextName} vient de rendre disponible en libre accès le numéro suivant. Nous vous invitons à lire ici le sommaire puis visiter notre site Web ({$contextUrl}) pour lire les articles et autres textes qui pourraient vous intéresser.<br />\n<br />\nMerci de votre intérêt continu pour notre travail.<br />\n{$editorialContactSignature}	Ce courriel est envoyé aux lecteurs-trices inscrits-es qui ont demandé à recevoir un avis par courriel quand un numéro devient disponible en libre accès.
SUBSCRIPTION_BEFORE_EXPIRY	fr_CA	Avis d'expiration de l'abonnement	{$subscriberName},<br />\n<br />\nVotre abonnement à la revue {$contextName} expirera bientôt.<br />\n<br />\n{$subscriptionType}<br />\nDate d'expiration : {$expiryDate}<br />\n<br />\nAfin d'assurer la continuité de votre accès à cette revue, nous vous invitons à aller sur le site Web de la revue et à renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d'utilisateur-trice, soit « {$username} ».<br />\n<br />\nSi vous avez des questions, ne pas hésiter à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un-e abonné-e que son abonnement expirera sous peu. Il fournit l'adresse URL de la revue, ainsi que les instructions pour y accéder.
SUBSCRIPTION_AFTER_EXPIRY	fr_CA	Abonnement expiré	{$subscriberName},<br />\n<br />\nVotre abonnement à la revue {$contextName} est expiré.<br />\n<br />\n{$subscriptionType}<br />\nDate d'expiration : {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d'utilisateur-trice, soit « {$username} ».<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un-e abonné-e que son abonnement est expiré. Il fournit l'adresse URL de la revue, ainsi que les instructions pour y accéder.
SUBSCRIPTION_AFTER_EXPIRY_LAST	fr_CA	Abonnement expiré - Dernier rappel	{$subscriberName},<br />\n<br />\nVotre abonnement à la revue {$contextName} est expiré. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoyé.<br />\n<br />\n{$subscriptionType}<br />\nDate d'expiration : {$expiryDate}<br />\n<br />\nPour renouveller votre abonnement, aveuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d'utilisateur-trice, soit « {$username} ».<br />\n<br />\nSi vous avez des questions, ne hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un-e abonné-e que son abonnement est expiré. Il donne l'adresse URL de la revue ainsi que les instructions pour y accéder.
SUBSCRIPTION_PURCHASE_INDL	fr_CA	Souscription à un abonnement individuel	Une souscription en ligne à un abonnement individuel pour la revue {$contextName} avec les renseignements suivants :<br />\n<br />\nType d'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$userDetails}<br />\n<br />\nInformation d'adhésion (si fournie) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivante.<br />\n<br />\nURL d'abonnement : {$subscriptionUrl}<br/>\n	Ce courriel informe le,la responsable des abonnements qu'un abonnement individuel a été souscrit en ligne. Il fournit des renseignements sommaires sur l'abonnement et le lien pour accéder à l'abonnement souscrit.
SUBSCRIPTION_PURCHASE_INSTL	fr_CA	Souscription à un abonnement institutionnel	Souscription en ligne à un abonnement institutionnel pour la revue {$contextName} avec les renseignements suivants. Pour activer cet abonnement, veuillez utiliser l'URL d'abonnement fourni et fixer le statut de l'abonnement à « actif ».<br />\n<br />\nType d'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$userDetails}<br />\n<br />\nRenseignements d'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivant :<br />\n<br />\nURL de l'abonnement : {$subscriptionUrl}<br />\n	Ce courriel informe le,la responsable des abonnements qu'un abonnement institutionnel a été souscrit en ligne. Il fournit des renseignements sommaires sur l'abonnement et le lien pour accéder à l'abonnement souscrit.
SUBSCRIPTION_RENEW_INDL	fr_CA	Renouvellement d'abonnement individuel	Un abonnement individuel a été renouvelé en ligne pour la revue {$contextName} avec les renseignements suivants.<br />\n<br />\nType d'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$userDetails}<br />\n<br />\nRenseignements d'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivant.<br />\n<br />\nURL de l'abonnement : {$subscriptionUrl}<br />\n	Ce courriel informe le,la responsable des abonnements qu'un abonnement individuel a été renouvelé en ligne. Il fournit des renseignements sommaires sur l'abonnement et le lien pour accéder à l'abonnement renouvelé.
SUBSCRIPTION_RENEW_INSTL	fr_CA	Renouvellement d'abonnement institutionnel	Un abonnement institutionnel a été renouvelé en ligne pour la revue {$contextName} avec les renseignements suivants.<br />\n<br />\nType d'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$userDetails}<br />\n<br />\nRenseignements d'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivant.<br />\n<br />\nURL de l'abonnement : {$subscriptionUrl}<br />\n	Ce courriel informe le,la responsable des abonnements qu'un abonnement institutionnel a été renouvelé en ligne. Il fournit des renseignements sommaires sur l'abonnement et le lien pour accéder à l'abonnement renouvelé.
CITATION_EDITOR_AUTHOR_QUERY	fr_CA	Modification des références bibliographiques	{$authorFirstName},<br />\n<br />\nPourriez-vous vérifier ou nous fournir la référence bibliographique complète pour la référence suivante, provenant de votre article « {$submissionTitle} »  :<br />\n<br />\n{$rawCitation}<br />\n<br />\nMerci!<br />\n<br />\n{$userFirstName}<br />\nRéviseur-e, revue {$contextName}<br />\n	Ce courriel permet aux réviseurs-es de demander des renseignements additionnels à propos des références bibliographiques citées par les auteurs-es.
REVISED_VERSION_NOTIFY	fr_CA	Version révisée téléversée	Rédacteurs-trices,<br />\n<br />\nUne version révisée de « {$submissionTitle} » a été téléversée par l'auteur-e {$authorName}.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement au,à la rédacteur-trice assigné-e quand un-e auteur-e téléverse une version révisée d'un article.
STATISTICS_REPORT_NOTIFICATION	fr_CA	Activité éditoriale pour {$month} {$year}	\n{$name}, <br />\n<br />\nLe rapport d'activité éditoriale de votre revue pour {$month} {$year} est maintenant disponible. Les principales statistiques pour ce mois sont affichées ci-dessous.<br />\n<ul>\n\t<li> Nouvelles soumissions pour ce mois : {$newSubmissions} </li>\n\t<li> Soumissions refusées pour ce mois : {$declinedSubmissions} </li>\n\t<li> Soumissions acceptées pour ce mois : {$acceptedSubmissions} </li>\n\t<li> Nombre total de soumissions dans la plateforme : {$totalSubmissions} </li>\n</ul>\nConnectez-vous au site de la revue pour voir davantage de <a href="{$editorialStatsLink}">tendances dans l'activité éditoriale</a> ainsi que des <a href="{$publicationStatsLink}">statistiques relatives aux articles publiés</a>. Le rapport complet des tendances de l'activité éditoriale de ce mois-ci est joint au présent envoi.<br />\n<br />\nCordialement,<br />\n{$principalContactSignature}	Ce courriel est envoyé automatiquement chaque mois aux rédacteurs et rédactrices en chef et aux directeurs et directrices de revues pour leur fournir un aperçu de l'intégrité du système.
ANNOUNCEMENT	fr_CA	{$title}	<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisiter notre site Web pour consulter <a href="{$url}">l'annonce complète</a>.	Ce courriel est envoyé lorsqu'une nouvelle annonce est créée.
ORCID_COLLECT_AUTHOR_ID	fr_CA	Soumission ORCID	{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d'auteur ou d'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.
ORCID_REQUEST_AUTHOR_AUTHORIZATION	fr_CA	Demande d'accès au dossier ORCID	{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l'accès en suivant les instructions.<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://orcid.org/sites/default/files/images/orcid_16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n	Ce modèle de courriel est utilisé pour demander aux auteurs-es l'accès à leur dossier ORCID.
PAYPAL_INVESTIGATE_PAYMENT	fr_CA	Activité inhabituelle de PayPal	L'Open Journal Systems a remarqué une activité inhabituelle concernant la prise en charge du paiement PayPal pour la revue {$contextName}. Cette activité pourrait nécessiter une attention particulière ou une intervention manuelle.<br />\n                       <br />\nCe courriel a été généré par le plugiciel PayPal du Open Journal Systems.<br />\n<br />\nInformation complète de la demande :<br />\n{$postInfo}<br />\n<br />\nInformation supplémentaire (si fournie) :<br />\n{$additionalInfo}<br />\n<br />\nVariables serveur :<br />\n{$serverVars}<br />\n	Ce modèle de courriel est utilisé pour aviser un contact principal d'une revue qu'une activité inhabituelle ou requérant une intervention manuelle a été remarquée par le plugiciel PayPal.
\.


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 58, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.email_templates_email_id_seq', 1, false);


--
-- Data for Name: email_templates_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.email_templates_settings (email_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.event_log (log_id, assoc_type, assoc_id, user_id, date_logged, event_type, message, is_translated) FROM stdin;
1	1048585	1	17	2023-02-28 21:55:34	268435458	submission.event.general.metadataUpdated	0
2	515	1	17	2023-02-28 21:55:35	1342177281	submission.event.fileUploaded	0
3	1048585	1	17	2023-02-28 21:55:35	1342177288	submission.event.fileRevised	0
4	515	1	17	2023-02-28 21:55:35	1342177296	submission.event.fileEdited	0
5	1048585	1	17	2023-02-28 21:55:35	1342177296	submission.event.fileEdited	0
6	1048585	1	17	2023-02-28 21:55:37	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	17	2023-02-28 21:55:37	268435457	submission.event.submissionSubmitted	0
8	1048585	1	3	2023-02-28 21:55:41	805306371	log.editor.decision	0
9	1048585	1	3	2023-02-28 21:55:46	1073741825	log.review.reviewerAssigned	0
10	1048585	1	3	2023-02-28 21:55:50	1073741825	log.review.reviewerAssigned	0
11	1048585	1	3	2023-02-28 21:55:56	1073741825	log.review.reviewerAssigned	0
12	1048585	1	3	2023-02-28 21:55:58	805306371	log.editor.decision	0
13	1048585	1	3	2023-02-28 21:56:03	268435459	submission.event.participantAdded	0
14	1048585	1	3	2023-02-28 21:56:06	805306371	log.editor.decision	0
15	1048585	1	3	2023-02-28 21:56:10	268435459	submission.event.participantAdded	0
16	1048585	1	3	2023-02-28 21:56:14	268435459	submission.event.participantAdded	0
17	1048585	1	3	2023-02-28 21:56:20	268435458	submission.event.general.metadataUpdated	0
18	1048585	1	3	2023-02-28 21:56:23	268435458	submission.event.general.metadataUpdated	0
19	1048585	1	3	2023-02-28 21:56:24	268435458	submission.event.general.metadataUpdated	0
20	1048585	1	3	2023-02-28 21:56:27	268435458	submission.event.general.metadataUpdated	0
21	515	2	3	2023-02-28 21:56:36	1342177281	submission.event.fileUploaded	0
22	1048585	1	3	2023-02-28 21:56:36	1342177288	submission.event.fileRevised	0
23	515	2	3	2023-02-28 21:56:37	1342177296	submission.event.fileEdited	0
24	1048585	1	3	2023-02-28 21:56:37	1342177296	submission.event.fileEdited	0
25	1048585	1	3	2023-02-28 21:56:45	268435459	submission.event.participantAdded	0
26	1048585	1	17	2023-02-28 21:56:49	268435458	submission.event.general.metadataUpdated	0
27	1048585	1	3	2023-02-28 21:56:54	268435458	submission.event.general.metadataUpdated	0
28	1048585	1	3	2023-02-28 21:56:55	268435462	publication.event.published	0
29	1048585	1	3	2023-02-28 21:57:02	268435463	publication.event.unpublished	0
30	1048585	1	3	2023-02-28 21:57:06	268435462	publication.event.published	0
31	1048585	1	3	2023-02-28 21:57:09	268435458	submission.event.general.metadataUpdated	0
32	1048585	1	3	2023-02-28 21:57:09	268435464	publication.event.versionCreated	0
33	1048585	1	3	2023-02-28 21:57:19	268435458	submission.event.general.metadataUpdated	0
34	1048585	1	3	2023-02-28 21:57:23	268435458	submission.event.general.metadataUpdated	0
35	1048585	1	3	2023-02-28 21:57:30	268435458	submission.event.general.metadataUpdated	0
36	1048585	1	3	2023-02-28 21:57:31	268435462	publication.event.versionPublished	0
37	1048585	1	3	2023-02-28 21:57:39	268435463	publication.event.versionUnpublished	0
38	1048585	1	3	2023-02-28 21:57:44	268435459	submission.event.participantAdded	0
39	1048585	1	3	2023-02-28 21:57:52	268435459	submission.event.participantAdded	0
40	1048585	2	18	2023-02-28 21:58:02	268435458	submission.event.general.metadataUpdated	0
41	515	3	18	2023-02-28 21:58:04	1342177281	submission.event.fileUploaded	0
42	1048585	2	18	2023-02-28 21:58:04	1342177288	submission.event.fileRevised	0
43	515	3	18	2023-02-28 21:58:04	1342177296	submission.event.fileEdited	0
44	1048585	2	18	2023-02-28 21:58:04	1342177296	submission.event.fileEdited	0
45	1048585	2	18	2023-02-28 21:58:06	268435458	submission.event.general.metadataUpdated	0
46	1048585	2	18	2023-02-28 21:58:07	268435457	submission.event.submissionSubmitted	0
47	1048585	2	3	2023-02-28 21:58:11	805306371	log.editor.decision	0
48	515	4	3	2023-02-28 21:58:11	1342177281	submission.event.fileUploaded	0
49	1048585	2	3	2023-02-28 21:58:11	1342177288	submission.event.fileRevised	0
50	1048585	2	3	2023-02-28 21:58:16	268435459	submission.event.participantAdded	0
51	1048585	2	3	2023-02-28 21:58:19	268435458	submission.event.general.metadataUpdated	0
52	1048585	2	6	2023-02-28 21:58:26	805306372	log.editor.recommendation	0
53	1048585	3	19	2023-02-28 21:58:37	268435458	submission.event.general.metadataUpdated	0
54	515	5	19	2023-02-28 21:58:38	1342177281	submission.event.fileUploaded	0
55	1048585	3	19	2023-02-28 21:58:38	1342177288	submission.event.fileRevised	0
56	515	5	19	2023-02-28 21:58:39	1342177296	submission.event.fileEdited	0
57	1048585	3	19	2023-02-28 21:58:39	1342177296	submission.event.fileEdited	0
58	1048585	3	19	2023-02-28 21:58:41	268435458	submission.event.general.metadataUpdated	0
59	1048585	3	19	2023-02-28 21:58:42	268435457	submission.event.submissionSubmitted	0
60	1048585	3	3	2023-02-28 21:58:46	805306371	log.editor.decision	0
61	515	6	3	2023-02-28 21:58:46	1342177281	submission.event.fileUploaded	0
62	1048585	3	3	2023-02-28 21:58:46	1342177288	submission.event.fileRevised	0
63	1048585	3	3	2023-02-28 21:58:52	1073741825	log.review.reviewerAssigned	0
64	1048585	3	3	2023-02-28 21:58:58	1073741825	log.review.reviewerAssigned	0
65	1048585	3	3	2023-02-28 21:59:00	805306371	log.editor.decision	0
66	1048585	3	3	2023-02-28 21:59:04	268435459	submission.event.participantAdded	0
67	1048585	4	20	2023-02-28 21:59:12	268435458	submission.event.general.metadataUpdated	0
68	515	7	20	2023-02-28 21:59:13	1342177281	submission.event.fileUploaded	0
69	1048585	4	20	2023-02-28 21:59:13	1342177288	submission.event.fileRevised	0
70	515	7	20	2023-02-28 21:59:14	1342177296	submission.event.fileEdited	0
71	1048585	4	20	2023-02-28 21:59:14	1342177296	submission.event.fileEdited	0
72	1048585	4	20	2023-02-28 21:59:19	268435458	submission.event.general.metadataUpdated	0
73	1048585	4	20	2023-02-28 21:59:20	268435457	submission.event.submissionSubmitted	0
74	1048585	5	21	2023-02-28 21:59:26	268435458	submission.event.general.metadataUpdated	0
75	515	8	21	2023-02-28 21:59:27	1342177281	submission.event.fileUploaded	0
76	1048585	5	21	2023-02-28 21:59:27	1342177288	submission.event.fileRevised	0
77	515	8	21	2023-02-28 21:59:28	1342177296	submission.event.fileEdited	0
78	1048585	5	21	2023-02-28 21:59:28	1342177296	submission.event.fileEdited	0
79	1048585	5	21	2023-02-28 21:59:29	268435458	submission.event.general.metadataUpdated	0
80	1048585	5	21	2023-02-28 21:59:30	268435457	submission.event.submissionSubmitted	0
81	1048585	5	3	2023-02-28 21:59:35	805306371	log.editor.decision	0
82	1048585	5	3	2023-02-28 21:59:40	1073741825	log.review.reviewerAssigned	0
83	1048585	5	3	2023-02-28 21:59:46	1073741825	log.review.reviewerAssigned	0
84	1048585	5	3	2023-02-28 21:59:48	805306371	log.editor.decision	0
85	1048585	5	3	2023-02-28 21:59:52	268435459	submission.event.participantAdded	0
86	1048585	5	3	2023-02-28 21:59:55	805306371	log.editor.decision	0
87	1048585	5	3	2023-02-28 22:00:00	268435459	submission.event.participantAdded	0
88	1048585	5	3	2023-02-28 22:00:03	268435459	submission.event.participantAdded	0
89	1048585	6	22	2023-02-28 22:00:11	268435458	submission.event.general.metadataUpdated	0
90	515	9	22	2023-02-28 22:00:12	1342177281	submission.event.fileUploaded	0
91	1048585	6	22	2023-02-28 22:00:12	1342177288	submission.event.fileRevised	0
92	515	9	22	2023-02-28 22:00:12	1342177296	submission.event.fileEdited	0
93	1048585	6	22	2023-02-28 22:00:12	1342177296	submission.event.fileEdited	0
94	1048585	6	22	2023-02-28 22:00:15	268435458	submission.event.general.metadataUpdated	0
95	1048585	6	22	2023-02-28 22:00:16	268435457	submission.event.submissionSubmitted	0
96	1048585	6	3	2023-02-28 22:00:20	805306371	log.editor.decision	0
97	515	10	3	2023-02-28 22:00:20	1342177281	submission.event.fileUploaded	0
98	1048585	6	3	2023-02-28 22:00:20	1342177288	submission.event.fileRevised	0
99	1048585	6	3	2023-02-28 22:00:26	1073741825	log.review.reviewerAssigned	0
100	1048585	6	3	2023-02-28 22:00:32	1073741825	log.review.reviewerAssigned	0
101	1048585	6	3	2023-02-28 22:00:33	805306371	log.editor.decision	0
102	1048585	6	3	2023-02-28 22:00:38	268435459	submission.event.participantAdded	0
103	1048585	6	3	2023-02-28 22:00:40	805306371	log.editor.decision	0
104	1048585	6	3	2023-02-28 22:00:45	268435459	submission.event.participantAdded	0
105	1048585	7	23	2023-02-28 22:00:53	268435458	submission.event.general.metadataUpdated	0
106	515	11	23	2023-02-28 22:00:54	1342177281	submission.event.fileUploaded	0
107	1048585	7	23	2023-02-28 22:00:54	1342177288	submission.event.fileRevised	0
108	515	11	23	2023-02-28 22:00:54	1342177296	submission.event.fileEdited	0
109	1048585	7	23	2023-02-28 22:00:54	1342177296	submission.event.fileEdited	0
110	1048585	7	23	2023-02-28 22:00:56	268435458	submission.event.general.metadataUpdated	0
111	1048585	7	23	2023-02-28 22:00:57	268435457	submission.event.submissionSubmitted	0
112	1048585	7	3	2023-02-28 22:01:02	805306371	log.editor.decision	0
113	1048585	7	3	2023-02-28 22:01:07	1073741825	log.review.reviewerAssigned	0
114	1048585	7	3	2023-02-28 22:01:11	1073741825	log.review.reviewerAssigned	0
115	1048585	7	3	2023-02-28 22:01:17	1073741825	log.review.reviewerAssigned	0
116	1048585	7	8	2023-02-28 22:01:21	1073741830	log.review.reviewAccepted	0
117	1048585	7	8	2023-02-28 22:01:24	1073741848	log.review.reviewReady	0
118	1048585	8	24	2023-02-28 22:01:33	268435458	submission.event.general.metadataUpdated	0
119	515	12	24	2023-02-28 22:01:35	1342177281	submission.event.fileUploaded	0
120	1048585	8	24	2023-02-28 22:01:35	1342177288	submission.event.fileRevised	0
121	515	12	24	2023-02-28 22:01:35	1342177296	submission.event.fileEdited	0
122	1048585	8	24	2023-02-28 22:01:35	1342177296	submission.event.fileEdited	0
123	1048585	8	24	2023-02-28 22:01:39	268435458	submission.event.general.metadataUpdated	0
124	1048585	8	24	2023-02-28 22:01:40	268435457	submission.event.submissionSubmitted	0
125	1048585	9	25	2023-02-28 22:01:47	268435458	submission.event.general.metadataUpdated	0
126	515	13	25	2023-02-28 22:01:48	1342177281	submission.event.fileUploaded	0
127	1048585	9	25	2023-02-28 22:01:48	1342177288	submission.event.fileRevised	0
128	515	13	25	2023-02-28 22:01:48	1342177296	submission.event.fileEdited	0
129	1048585	9	25	2023-02-28 22:01:48	1342177296	submission.event.fileEdited	0
130	1048585	9	25	2023-02-28 22:01:50	268435458	submission.event.general.metadataUpdated	0
131	1048585	9	25	2023-02-28 22:01:51	268435457	submission.event.submissionSubmitted	0
132	1048585	9	3	2023-02-28 22:01:57	805306371	log.editor.decision	0
133	1048585	9	3	2023-02-28 22:02:02	1073741825	log.review.reviewerAssigned	0
134	1048585	9	3	2023-02-28 22:02:08	1073741825	log.review.reviewerAssigned	0
135	1048585	9	3	2023-02-28 22:02:10	805306371	log.editor.decision	0
136	1048585	9	3	2023-02-28 22:02:15	268435459	submission.event.participantAdded	0
137	1048585	9	3	2023-02-28 22:02:17	805306371	log.editor.decision	0
138	1048585	9	3	2023-02-28 22:02:22	268435459	submission.event.participantAdded	0
139	1048585	9	3	2023-02-28 22:02:26	268435459	submission.event.participantAdded	0
140	1048585	10	26	2023-02-28 22:02:37	268435458	submission.event.general.metadataUpdated	0
141	515	14	26	2023-02-28 22:02:38	1342177281	submission.event.fileUploaded	0
142	1048585	10	26	2023-02-28 22:02:38	1342177288	submission.event.fileRevised	0
143	515	14	26	2023-02-28 22:02:39	1342177296	submission.event.fileEdited	0
144	1048585	10	26	2023-02-28 22:02:39	1342177296	submission.event.fileEdited	0
145	1048585	10	26	2023-02-28 22:02:41	268435458	submission.event.general.metadataUpdated	0
146	1048585	10	26	2023-02-28 22:02:42	268435457	submission.event.submissionSubmitted	0
147	1048585	10	3	2023-02-28 22:02:48	805306371	log.editor.decision	0
148	515	15	3	2023-02-28 22:02:48	1342177281	submission.event.fileUploaded	0
149	1048585	10	3	2023-02-28 22:02:48	1342177288	submission.event.fileRevised	0
150	1048585	10	3	2023-02-28 22:02:53	1073741825	log.review.reviewerAssigned	0
151	1048585	10	3	2023-02-28 22:02:59	1073741825	log.review.reviewerAssigned	0
152	1048585	10	9	2023-02-28 22:03:03	1073741830	log.review.reviewAccepted	0
153	1048585	10	9	2023-02-28 22:03:07	1073741848	log.review.reviewReady	0
154	1048585	10	10	2023-02-28 22:03:11	1073741830	log.review.reviewAccepted	0
155	1048585	10	10	2023-02-28 22:03:15	1073741848	log.review.reviewReady	0
156	1048585	11	27	2023-02-28 22:03:23	268435458	submission.event.general.metadataUpdated	0
157	515	16	27	2023-02-28 22:03:24	1342177281	submission.event.fileUploaded	0
158	1048585	11	27	2023-02-28 22:03:24	1342177288	submission.event.fileRevised	0
159	515	16	27	2023-02-28 22:03:24	1342177296	submission.event.fileEdited	0
160	1048585	11	27	2023-02-28 22:03:24	1342177296	submission.event.fileEdited	0
161	1048585	11	27	2023-02-28 22:03:29	268435458	submission.event.general.metadataUpdated	0
162	1048585	11	27	2023-02-28 22:03:30	268435457	submission.event.submissionSubmitted	0
163	1048585	12	28	2023-02-28 22:03:37	268435458	submission.event.general.metadataUpdated	0
164	515	17	28	2023-02-28 22:03:38	1342177281	submission.event.fileUploaded	0
165	1048585	12	28	2023-02-28 22:03:38	1342177288	submission.event.fileRevised	0
166	515	17	28	2023-02-28 22:03:38	1342177296	submission.event.fileEdited	0
167	1048585	12	28	2023-02-28 22:03:38	1342177296	submission.event.fileEdited	0
168	1048585	12	28	2023-02-28 22:03:40	268435458	submission.event.general.metadataUpdated	0
169	1048585	12	28	2023-02-28 22:03:41	268435457	submission.event.submissionSubmitted	0
170	1048585	12	3	2023-02-28 22:03:48	805306371	log.editor.decision	0
171	1048585	12	3	2023-02-28 22:03:53	1073741825	log.review.reviewerAssigned	0
172	1048585	12	3	2023-02-28 22:03:57	1073741825	log.review.reviewerAssigned	0
173	1048585	13	29	2023-02-28 22:04:04	268435458	submission.event.general.metadataUpdated	0
174	515	18	29	2023-02-28 22:04:05	1342177281	submission.event.fileUploaded	0
175	1048585	13	29	2023-02-28 22:04:05	1342177288	submission.event.fileRevised	0
176	515	18	29	2023-02-28 22:04:05	1342177296	submission.event.fileEdited	0
177	1048585	13	29	2023-02-28 22:04:05	1342177296	submission.event.fileEdited	0
178	1048585	13	29	2023-02-28 22:04:08	268435458	submission.event.general.metadataUpdated	0
179	1048585	13	29	2023-02-28 22:04:09	268435457	submission.event.submissionSubmitted	0
180	1048585	13	3	2023-02-28 22:04:15	805306371	log.editor.decision	0
181	1048585	13	3	2023-02-28 22:04:21	1073741825	log.review.reviewerAssigned	0
182	1048585	13	3	2023-02-28 22:04:25	1073741825	log.review.reviewerAssigned	0
183	1048585	13	3	2023-02-28 22:04:31	1073741825	log.review.reviewerAssigned	0
184	1048585	13	7	2023-02-28 22:04:34	1073741830	log.review.reviewAccepted	0
185	1048585	13	7	2023-02-28 22:04:38	1073741848	log.review.reviewReady	0
186	1048585	13	9	2023-02-28 22:04:42	1073741830	log.review.reviewAccepted	0
187	1048585	13	9	2023-02-28 22:04:46	1073741848	log.review.reviewReady	0
188	1048585	13	10	2023-02-28 22:04:51	1073741830	log.review.reviewAccepted	0
189	1048585	13	10	2023-02-28 22:04:55	1073741848	log.review.reviewReady	0
190	1048585	13	3	2023-02-28 22:05:05	805306371	log.editor.decision	0
191	1048585	14	30	2023-02-28 22:05:12	268435458	submission.event.general.metadataUpdated	0
192	515	19	30	2023-02-28 22:05:13	1342177281	submission.event.fileUploaded	0
193	1048585	14	30	2023-02-28 22:05:13	1342177288	submission.event.fileRevised	0
194	515	19	30	2023-02-28 22:05:14	1342177296	submission.event.fileEdited	0
195	1048585	14	30	2023-02-28 22:05:14	1342177296	submission.event.fileEdited	0
196	1048585	14	30	2023-02-28 22:05:16	268435458	submission.event.general.metadataUpdated	0
197	1048585	14	30	2023-02-28 22:05:17	268435457	submission.event.submissionSubmitted	0
198	1048585	15	31	2023-02-28 22:05:23	268435458	submission.event.general.metadataUpdated	0
199	515	20	31	2023-02-28 22:05:24	1342177281	submission.event.fileUploaded	0
200	1048585	15	31	2023-02-28 22:05:24	1342177288	submission.event.fileRevised	0
201	515	20	31	2023-02-28 22:05:25	1342177296	submission.event.fileEdited	0
202	1048585	15	31	2023-02-28 22:05:25	1342177296	submission.event.fileEdited	0
203	1048585	15	31	2023-02-28 22:05:26	268435458	submission.event.general.metadataUpdated	0
204	1048585	15	31	2023-02-28 22:05:27	268435457	submission.event.submissionSubmitted	0
205	1048585	15	3	2023-02-28 22:05:35	805306371	log.editor.decision	0
206	1048585	15	3	2023-02-28 22:05:40	1073741825	log.review.reviewerAssigned	0
207	1048585	15	3	2023-02-28 22:05:44	1073741825	log.review.reviewerAssigned	0
208	1048585	15	3	2023-02-28 22:05:46	805306371	log.editor.decision	0
209	1048585	15	3	2023-02-28 22:05:51	268435459	submission.event.participantAdded	0
210	1048585	15	3	2023-02-28 22:05:53	805306371	log.editor.decision	0
211	1048585	15	3	2023-02-28 22:05:58	268435459	submission.event.participantAdded	0
212	1048585	16	32	2023-02-28 22:06:06	268435458	submission.event.general.metadataUpdated	0
213	515	21	32	2023-02-28 22:06:08	1342177281	submission.event.fileUploaded	0
214	1048585	16	32	2023-02-28 22:06:08	1342177288	submission.event.fileRevised	0
215	515	21	32	2023-02-28 22:06:08	1342177296	submission.event.fileEdited	0
216	1048585	16	32	2023-02-28 22:06:08	1342177296	submission.event.fileEdited	0
217	1048585	16	32	2023-02-28 22:06:10	268435458	submission.event.general.metadataUpdated	0
218	1048585	16	32	2023-02-28 22:06:11	268435457	submission.event.submissionSubmitted	0
219	1048585	17	33	2023-02-28 22:06:18	268435458	submission.event.general.metadataUpdated	0
220	515	22	33	2023-02-28 22:06:19	1342177281	submission.event.fileUploaded	0
221	1048585	17	33	2023-02-28 22:06:19	1342177288	submission.event.fileRevised	0
222	515	22	33	2023-02-28 22:06:19	1342177296	submission.event.fileEdited	0
223	1048585	17	33	2023-02-28 22:06:19	1342177296	submission.event.fileEdited	0
224	1048585	17	33	2023-02-28 22:06:22	268435458	submission.event.general.metadataUpdated	0
225	1048585	17	33	2023-02-28 22:06:23	268435457	submission.event.submissionSubmitted	0
226	1048585	17	3	2023-02-28 22:06:31	805306371	log.editor.decision	0
227	1048585	17	3	2023-02-28 22:06:36	1073741825	log.review.reviewerAssigned	0
228	1048585	17	3	2023-02-28 22:06:40	1073741825	log.review.reviewerAssigned	0
229	1048585	17	3	2023-02-28 22:06:42	805306371	log.editor.decision	0
230	1048585	17	3	2023-02-28 22:06:47	268435459	submission.event.participantAdded	0
231	1048585	17	3	2023-02-28 22:06:49	805306371	log.editor.decision	0
232	1048585	17	3	2023-02-28 22:06:54	268435459	submission.event.participantAdded	0
233	1048585	17	3	2023-02-28 22:06:58	268435459	submission.event.participantAdded	0
234	515	23	3	2023-02-28 22:07:04	1342177281	submission.event.fileUploaded	0
235	1048585	17	3	2023-02-28 22:07:04	1342177288	submission.event.fileRevised	0
236	515	23	3	2023-02-28 22:07:04	1342177296	submission.event.fileEdited	0
237	1048585	17	3	2023-02-28 22:07:04	1342177296	submission.event.fileEdited	0
238	1048585	17	3	2023-02-28 22:07:14	268435458	submission.event.general.metadataUpdated	0
239	1048585	17	3	2023-02-28 22:07:15	268435462	publication.event.scheduled	0
240	1048585	17	3	2023-02-28 22:07:18	268435462	publication.event.published	0
241	1048585	17	3	2023-02-28 22:07:27	268435463	publication.event.unpublished	0
242	1048585	17	3	2023-02-28 22:07:27	268435462	publication.event.scheduled	0
243	1048585	17	3	2023-02-28 22:07:34	268435462	publication.event.published	0
244	1048585	17	3	2023-02-28 22:07:43	268435463	publication.event.unpublished	0
245	1048585	17	3	2023-02-28 22:07:43	268435458	submission.event.general.metadataUpdated	0
246	1048585	17	3	2023-02-28 22:07:57	268435458	submission.event.general.metadataUpdated	0
247	1048585	17	3	2023-02-28 22:07:58	268435462	publication.event.published	0
248	1048585	18	34	2023-02-28 22:08:09	268435458	submission.event.general.metadataUpdated	0
249	515	24	34	2023-02-28 22:08:10	1342177281	submission.event.fileUploaded	0
250	1048585	18	34	2023-02-28 22:08:10	1342177288	submission.event.fileRevised	0
251	515	24	34	2023-02-28 22:08:11	1342177296	submission.event.fileEdited	0
252	1048585	18	34	2023-02-28 22:08:11	1342177296	submission.event.fileEdited	0
253	1048585	18	34	2023-02-28 22:08:13	268435458	submission.event.general.metadataUpdated	0
254	1048585	18	34	2023-02-28 22:08:14	268435457	submission.event.submissionSubmitted	0
255	1048585	18	3	2023-02-28 22:08:21	805306371	log.editor.decision	0
256	1048585	19	35	2023-02-28 22:08:30	268435458	submission.event.general.metadataUpdated	0
257	515	25	35	2023-02-28 22:08:31	1342177281	submission.event.fileUploaded	0
258	1048585	19	35	2023-02-28 22:08:31	1342177288	submission.event.fileRevised	0
259	515	25	35	2023-02-28 22:08:31	1342177296	submission.event.fileEdited	0
260	1048585	19	35	2023-02-28 22:08:31	1342177296	submission.event.fileEdited	0
261	1048585	19	35	2023-02-28 22:08:33	268435458	submission.event.general.metadataUpdated	0
262	1048585	19	35	2023-02-28 22:08:34	268435457	submission.event.submissionSubmitted	0
263	1048585	19	3	2023-02-28 22:08:42	805306371	log.editor.decision	0
264	515	26	3	2023-02-28 22:08:42	1342177281	submission.event.fileUploaded	0
265	1048585	19	3	2023-02-28 22:08:42	1342177288	submission.event.fileRevised	0
266	1048585	19	3	2023-02-28 22:08:47	1073741825	log.review.reviewerAssigned	0
267	1048585	19	3	2023-02-28 22:08:51	1073741825	log.review.reviewerAssigned	0
268	1048585	19	3	2023-02-28 22:08:53	805306371	log.editor.decision	0
269	1048585	19	3	2023-02-28 22:08:58	268435459	submission.event.participantAdded	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 269, true);


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
2	fileStage	2	int
2	sourceSubmissionFileId	\N	string
2	submissionFileId	1	int
2	fileId	1	int
2	submissionId	1	int
2	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
2	username	amwandenga	string
3	fileStage	2	int
3	submissionFileId	1	int
3	fileId	1	int
3	submissionId	1	int
3	username	amwandenga	string
3	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
4	fileStage	2	int
4	sourceSubmissionFileId	\N	string
4	submissionFileId	1	int
4	fileId	1	int
4	submissionId	1	int
4	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
4	username	amwandenga	string
5	fileStage	2	int
5	sourceSubmissionFileId	\N	string
5	submissionFileId	1	int
5	fileId	1	int
5	submissionId	1	int
5	username	amwandenga	string
5	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
5	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
8	editorName	Daniel Barnes	string
8	submissionId	1	int
8	decision	Send to Review	string
9	reviewAssignmentId	1	string
9	reviewerName	Julie Janssen	string
9	submissionId	1	int
9	stageId	3	int
9	round	1	int
10	reviewAssignmentId	2	string
10	reviewerName	Aisla McCrae	string
10	submissionId	1	int
10	stageId	3	int
10	round	1	int
11	reviewAssignmentId	3	string
11	reviewerName	Adela Gallego	string
11	submissionId	1	int
11	stageId	3	int
11	round	1	int
12	editorName	Daniel Barnes	string
12	submissionId	1	int
12	decision	Accept Submission	string
13	name	Sarah Vogt	string
13	username	svogt	string
13	userGroupName	Copyeditor	string
14	editorName	Daniel Barnes	string
14	submissionId	1	int
14	decision	Send To Production	string
15	name	Stephen Hellier	string
15	username	shellier	string
15	userGroupName	Layout Editor	string
16	name	Sabine Kumar	string
16	username	skumar	string
16	userGroupName	Proofreader	string
21	fileStage	10	int
21	sourceSubmissionFileId	\N	string
21	submissionFileId	2	int
21	fileId	2	int
21	submissionId	1	int
21	originalFileName	article.pdf	string
21	username	dbarnes	string
22	fileStage	10	int
22	submissionFileId	2	int
22	fileId	2	int
22	submissionId	1	int
22	username	dbarnes	string
22	name	article.pdf	string
23	fileStage	10	int
23	sourceSubmissionFileId	\N	string
23	submissionFileId	2	int
23	fileId	2	int
23	submissionId	1	int
23	originalFileName	article.pdf	string
23	username	dbarnes	string
24	fileStage	10	int
24	sourceSubmissionFileId	\N	string
24	submissionFileId	2	int
24	fileId	2	int
24	submissionId	1	int
24	username	dbarnes	string
24	originalFileName	article.pdf	string
24	name	article.pdf	string
25	name	Alan Mwandenga	string
25	username	amwandenga	string
25	userGroupName	Author	string
38	name	Stephanie Berardo	string
38	username	sberardo	string
38	userGroupName	Section editor	string
39	name	Stephanie Berardo	string
39	username	sberardo	string
39	userGroupName	Section editor	string
41	fileStage	2	int
41	sourceSubmissionFileId	\N	string
41	submissionFileId	3	int
41	fileId	3	int
41	submissionId	2	int
41	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
41	username	ccorino	string
42	fileStage	2	int
42	submissionFileId	3	int
42	fileId	3	int
42	submissionId	2	int
42	username	ccorino	string
42	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
43	fileStage	2	int
43	sourceSubmissionFileId	\N	string
43	submissionFileId	3	int
43	fileId	3	int
43	submissionId	2	int
43	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
43	username	ccorino	string
44	fileStage	2	int
44	sourceSubmissionFileId	\N	string
44	submissionFileId	3	int
44	fileId	3	int
44	submissionId	2	int
44	username	ccorino	string
44	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
44	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
47	editorName	Daniel Barnes	string
47	submissionId	2	int
47	decision	Send to Review	string
48	fileStage	4	int
48	sourceSubmissionFileId	3	int
48	submissionFileId	4	int
48	fileId	3	int
48	submissionId	2	int
48	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
48	username	dbarnes	string
49	fileStage	4	int
49	submissionFileId	4	int
49	fileId	3	int
49	submissionId	2	int
49	username	dbarnes	string
49	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
50	name	Minoti Inoue	string
50	username	minoue	string
50	userGroupName	Section editor	string
52	editorName	Minoti Inoue	string
52	submissionId	2	int
52	decision	Accept Submission	string
54	fileStage	2	int
54	sourceSubmissionFileId	\N	string
54	submissionFileId	5	int
54	fileId	4	int
54	submissionId	3	int
54	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
54	username	ckwantes	string
55	fileStage	2	int
55	submissionFileId	5	int
55	fileId	4	int
55	submissionId	3	int
55	username	ckwantes	string
55	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
56	fileStage	2	int
56	sourceSubmissionFileId	\N	string
56	submissionFileId	5	int
56	fileId	4	int
56	submissionId	3	int
56	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
56	username	ckwantes	string
57	fileStage	2	int
57	sourceSubmissionFileId	\N	string
57	submissionFileId	5	int
57	fileId	4	int
57	submissionId	3	int
57	username	ckwantes	string
57	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
57	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
60	editorName	Daniel Barnes	string
60	submissionId	3	int
60	decision	Send to Review	string
61	fileStage	4	int
61	sourceSubmissionFileId	5	int
61	submissionFileId	6	int
61	fileId	4	int
61	submissionId	3	int
61	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
61	username	dbarnes	string
62	fileStage	4	int
62	submissionFileId	6	int
62	fileId	4	int
62	submissionId	3	int
62	username	dbarnes	string
62	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
63	reviewAssignmentId	4	string
63	reviewerName	Aisla McCrae	string
63	submissionId	3	int
63	stageId	3	int
63	round	1	int
64	reviewAssignmentId	5	string
64	reviewerName	Adela Gallego	string
64	submissionId	3	int
64	stageId	3	int
64	round	1	int
65	editorName	Daniel Barnes	string
65	submissionId	3	int
65	decision	Accept Submission	string
66	name	Maria Fritz	string
66	username	mfritz	string
66	userGroupName	Copyeditor	string
68	fileStage	2	int
68	sourceSubmissionFileId	\N	string
68	submissionFileId	7	int
68	fileId	5	int
68	submissionId	4	int
68	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
68	username	cmontgomerie	string
69	fileStage	2	int
69	submissionFileId	7	int
69	fileId	5	int
69	submissionId	4	int
69	username	cmontgomerie	string
69	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
70	fileStage	2	int
70	sourceSubmissionFileId	\N	string
70	submissionFileId	7	int
70	fileId	5	int
70	submissionId	4	int
70	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
70	username	cmontgomerie	string
71	fileStage	2	int
71	sourceSubmissionFileId	\N	string
71	submissionFileId	7	int
71	fileId	5	int
71	submissionId	4	int
71	username	cmontgomerie	string
133	reviewAssignmentId	13	string
71	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
71	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
75	fileStage	2	int
75	sourceSubmissionFileId	\N	string
75	submissionFileId	8	int
75	fileId	6	int
75	submissionId	5	int
75	originalFileName	Genetic transformation of forest trees.pdf	string
75	username	ddiouf	string
76	fileStage	2	int
76	submissionFileId	8	int
76	fileId	6	int
76	submissionId	5	int
76	username	ddiouf	string
76	name	Genetic transformation of forest trees.pdf	string
77	fileStage	2	int
77	sourceSubmissionFileId	\N	string
77	submissionFileId	8	int
77	fileId	6	int
77	submissionId	5	int
77	originalFileName	Genetic transformation of forest trees.pdf	string
77	username	ddiouf	string
78	fileStage	2	int
78	sourceSubmissionFileId	\N	string
78	submissionFileId	8	int
78	fileId	6	int
78	submissionId	5	int
78	username	ddiouf	string
78	originalFileName	Genetic transformation of forest trees.pdf	string
78	name	Genetic transformation of forest trees.pdf	string
81	editorName	Daniel Barnes	string
81	submissionId	5	int
81	decision	Send to Review	string
82	reviewAssignmentId	6	string
82	reviewerName	Paul Hudson	string
82	submissionId	5	int
82	stageId	3	int
82	round	1	int
83	reviewAssignmentId	7	string
83	reviewerName	Adela Gallego	string
83	submissionId	5	int
83	stageId	3	int
83	round	1	int
84	editorName	Daniel Barnes	string
84	submissionId	5	int
84	decision	Accept Submission	string
85	name	Maria Fritz	string
85	username	mfritz	string
85	userGroupName	Copyeditor	string
86	editorName	Daniel Barnes	string
86	submissionId	5	int
86	decision	Send To Production	string
87	name	Graham Cox	string
87	username	gcox	string
87	userGroupName	Layout Editor	string
88	name	Catherine Turner	string
88	username	cturner	string
88	userGroupName	Proofreader	string
90	fileStage	2	int
90	sourceSubmissionFileId	\N	string
90	submissionFileId	9	int
90	fileId	7	int
90	submissionId	6	int
90	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
90	username	dphillips	string
91	fileStage	2	int
91	submissionFileId	9	int
91	fileId	7	int
91	submissionId	6	int
91	username	dphillips	string
91	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
92	fileStage	2	int
92	sourceSubmissionFileId	\N	string
92	submissionFileId	9	int
92	fileId	7	int
92	submissionId	6	int
92	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
92	username	dphillips	string
93	fileStage	2	int
93	sourceSubmissionFileId	\N	string
93	submissionFileId	9	int
93	fileId	7	int
93	submissionId	6	int
93	username	dphillips	string
93	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
93	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
96	editorName	Daniel Barnes	string
96	submissionId	6	int
96	decision	Send to Review	string
97	fileStage	4	int
97	sourceSubmissionFileId	9	int
97	submissionFileId	10	int
97	fileId	7	int
97	submissionId	6	int
97	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
97	username	dbarnes	string
98	fileStage	4	int
98	submissionFileId	10	int
98	fileId	7	int
98	submissionId	6	int
98	username	dbarnes	string
98	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
99	reviewAssignmentId	8	string
99	reviewerName	Julie Janssen	string
99	submissionId	6	int
99	stageId	3	int
99	round	1	int
100	reviewAssignmentId	9	string
100	reviewerName	Adela Gallego	string
100	submissionId	6	int
100	stageId	3	int
100	round	1	int
101	editorName	Daniel Barnes	string
101	submissionId	6	int
101	decision	Accept Submission	string
102	name	Maria Fritz	string
102	username	mfritz	string
102	userGroupName	Copyeditor	string
103	editorName	Daniel Barnes	string
103	submissionId	6	int
103	decision	Send To Production	string
104	name	Graham Cox	string
104	username	gcox	string
104	userGroupName	Layout Editor	string
106	fileStage	2	int
106	sourceSubmissionFileId	\N	string
106	submissionFileId	11	int
106	fileId	8	int
106	submissionId	7	int
106	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
106	username	dsokoloff	string
107	fileStage	2	int
107	submissionFileId	11	int
107	fileId	8	int
107	submissionId	7	int
107	username	dsokoloff	string
107	name	Developing efficacy beliefs in the classroom.pdf	string
108	fileStage	2	int
108	sourceSubmissionFileId	\N	string
108	submissionFileId	11	int
108	fileId	8	int
108	submissionId	7	int
108	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
108	username	dsokoloff	string
109	fileStage	2	int
109	sourceSubmissionFileId	\N	string
109	submissionFileId	11	int
109	fileId	8	int
109	submissionId	7	int
109	username	dsokoloff	string
109	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
109	name	Developing efficacy beliefs in the classroom.pdf	string
112	editorName	Daniel Barnes	string
112	submissionId	7	int
112	decision	Send to Review	string
113	reviewAssignmentId	10	string
113	reviewerName	Paul Hudson	string
113	submissionId	7	int
113	stageId	3	int
113	round	1	int
114	reviewAssignmentId	11	string
114	reviewerName	Aisla McCrae	string
114	submissionId	7	int
114	stageId	3	int
114	round	1	int
115	reviewAssignmentId	12	string
115	reviewerName	Adela Gallego	string
115	submissionId	7	int
115	stageId	3	int
115	round	1	int
116	reviewAssignmentId	10	int
116	reviewerName	Paul Hudson	string
116	submissionId	7	int
116	round	1	int
117	reviewAssignmentId	10	int
117	reviewerName	Paul Hudson	string
117	submissionId	7	int
117	round	1	int
119	fileStage	2	int
119	sourceSubmissionFileId	\N	string
119	submissionFileId	12	int
119	fileId	9	int
119	submissionId	8	int
119	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
119	username	eostrom	string
120	fileStage	2	int
120	submissionFileId	12	int
120	fileId	9	int
120	submissionId	8	int
120	username	eostrom	string
120	name	Traditions and Trends in the Study of the Commons.pdf	string
121	fileStage	2	int
121	sourceSubmissionFileId	\N	string
121	submissionFileId	12	int
121	fileId	9	int
121	submissionId	8	int
121	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
121	username	eostrom	string
122	fileStage	2	int
122	sourceSubmissionFileId	\N	string
122	submissionFileId	12	int
122	fileId	9	int
122	submissionId	8	int
122	username	eostrom	string
122	originalFileName	Traditions and Trends in the Study of the Commons.pdf	string
122	name	Traditions and Trends in the Study of the Commons.pdf	string
126	fileStage	2	int
126	sourceSubmissionFileId	\N	string
126	submissionFileId	13	int
126	fileId	10	int
126	submissionId	9	int
126	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
126	username	fpaglieri	string
127	fileStage	2	int
127	submissionFileId	13	int
127	fileId	10	int
127	submissionId	9	int
127	username	fpaglieri	string
127	name	Hansen & Pinto: Reason Reclaimed.pdf	string
128	fileStage	2	int
128	sourceSubmissionFileId	\N	string
128	submissionFileId	13	int
128	fileId	10	int
128	submissionId	9	int
128	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
128	username	fpaglieri	string
129	fileStage	2	int
129	sourceSubmissionFileId	\N	string
129	submissionFileId	13	int
129	fileId	10	int
129	submissionId	9	int
129	username	fpaglieri	string
129	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
129	name	Hansen & Pinto: Reason Reclaimed.pdf	string
132	editorName	Daniel Barnes	string
132	submissionId	9	int
132	decision	Send to Review	string
133	reviewerName	Julie Janssen	string
133	submissionId	9	int
133	stageId	3	int
133	round	1	int
134	reviewAssignmentId	14	string
134	reviewerName	Adela Gallego	string
134	submissionId	9	int
134	stageId	3	int
134	round	1	int
135	editorName	Daniel Barnes	string
135	submissionId	9	int
135	decision	Accept Submission	string
136	name	Sarah Vogt	string
136	username	svogt	string
136	userGroupName	Copyeditor	string
137	editorName	Daniel Barnes	string
137	submissionId	9	int
137	decision	Send To Production	string
138	name	Stephen Hellier	string
138	username	shellier	string
138	userGroupName	Layout Editor	string
139	name	Sabine Kumar	string
139	username	skumar	string
139	userGroupName	Proofreader	string
141	fileStage	2	int
141	sourceSubmissionFileId	\N	string
141	submissionFileId	14	int
141	fileId	11	int
141	submissionId	10	int
141	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
141	username	jnovak	string
142	fileStage	2	int
142	submissionFileId	14	int
142	fileId	11	int
142	submissionId	10	int
142	username	jnovak	string
142	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
143	fileStage	2	int
143	sourceSubmissionFileId	\N	string
143	submissionFileId	14	int
143	fileId	11	int
143	submissionId	10	int
143	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
143	username	jnovak	string
144	fileStage	2	int
144	sourceSubmissionFileId	\N	string
144	submissionFileId	14	int
144	fileId	11	int
144	submissionId	10	int
144	username	jnovak	string
144	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
144	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
147	editorName	Daniel Barnes	string
147	submissionId	10	int
147	decision	Send to Review	string
148	fileStage	4	int
148	sourceSubmissionFileId	14	int
148	submissionFileId	15	int
148	fileId	11	int
148	submissionId	10	int
148	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
148	username	dbarnes	string
149	fileStage	4	int
149	submissionFileId	15	int
149	fileId	11	int
149	submissionId	10	int
149	username	dbarnes	string
149	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
150	reviewAssignmentId	15	string
150	reviewerName	Aisla McCrae	string
150	submissionId	10	int
150	stageId	3	int
150	round	1	int
151	reviewAssignmentId	16	string
151	reviewerName	Adela Gallego	string
151	submissionId	10	int
151	stageId	3	int
151	round	1	int
152	reviewAssignmentId	15	int
152	reviewerName	Aisla McCrae	string
152	submissionId	10	int
152	round	1	int
153	reviewAssignmentId	15	int
153	reviewerName	Aisla McCrae	string
153	submissionId	10	int
153	round	1	int
154	reviewAssignmentId	16	int
154	reviewerName	Adela Gallego	string
154	submissionId	10	int
154	round	1	int
155	reviewAssignmentId	16	int
155	reviewerName	Adela Gallego	string
155	submissionId	10	int
155	round	1	int
157	fileStage	2	int
157	sourceSubmissionFileId	\N	string
157	submissionFileId	16	int
157	fileId	12	int
157	submissionId	11	int
157	originalFileName	Learning Sustainable Design through Service.pdf	string
157	username	kalkhafaji	string
158	fileStage	2	int
158	submissionFileId	16	int
158	fileId	12	int
158	submissionId	11	int
158	username	kalkhafaji	string
158	name	Learning Sustainable Design through Service.pdf	string
159	fileStage	2	int
159	sourceSubmissionFileId	\N	string
159	submissionFileId	16	int
159	fileId	12	int
159	submissionId	11	int
159	originalFileName	Learning Sustainable Design through Service.pdf	string
159	username	kalkhafaji	string
160	fileStage	2	int
160	sourceSubmissionFileId	\N	string
160	submissionFileId	16	int
160	fileId	12	int
160	submissionId	11	int
160	username	kalkhafaji	string
189	round	1	int
160	originalFileName	Learning Sustainable Design through Service.pdf	string
160	name	Learning Sustainable Design through Service.pdf	string
164	fileStage	2	int
164	sourceSubmissionFileId	\N	string
164	submissionFileId	17	int
164	fileId	13	int
164	submissionId	12	int
164	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
164	username	lchristopher	string
165	fileStage	2	int
165	submissionFileId	17	int
165	fileId	13	int
165	submissionId	12	int
165	username	lchristopher	string
165	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
166	fileStage	2	int
166	sourceSubmissionFileId	\N	string
166	submissionFileId	17	int
166	fileId	13	int
166	submissionId	12	int
166	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
166	username	lchristopher	string
167	fileStage	2	int
167	sourceSubmissionFileId	\N	string
167	submissionFileId	17	int
167	fileId	13	int
167	submissionId	12	int
167	username	lchristopher	string
167	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
167	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
170	editorName	Daniel Barnes	string
170	submissionId	12	int
170	decision	Send to Review	string
171	reviewAssignmentId	17	string
171	reviewerName	Julie Janssen	string
171	submissionId	12	int
171	stageId	3	int
171	round	1	int
172	reviewAssignmentId	18	string
172	reviewerName	Paul Hudson	string
172	submissionId	12	int
172	stageId	3	int
172	round	1	int
174	fileStage	2	int
174	sourceSubmissionFileId	\N	string
174	submissionFileId	18	int
174	fileId	14	int
174	submissionId	13	int
174	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
174	username	lkumiega	string
175	fileStage	2	int
175	submissionFileId	18	int
175	fileId	14	int
175	submissionId	13	int
175	username	lkumiega	string
175	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
176	fileStage	2	int
176	sourceSubmissionFileId	\N	string
176	submissionFileId	18	int
176	fileId	14	int
176	submissionId	13	int
176	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
176	username	lkumiega	string
177	fileStage	2	int
177	sourceSubmissionFileId	\N	string
177	submissionFileId	18	int
177	fileId	14	int
177	submissionId	13	int
177	username	lkumiega	string
177	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
177	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
180	editorName	Daniel Barnes	string
180	submissionId	13	int
180	decision	Send to Review	string
181	reviewAssignmentId	19	string
181	reviewerName	Julie Janssen	string
181	submissionId	13	int
181	stageId	3	int
181	round	1	int
182	reviewAssignmentId	20	string
182	reviewerName	Aisla McCrae	string
182	submissionId	13	int
182	stageId	3	int
182	round	1	int
183	reviewAssignmentId	21	string
183	reviewerName	Adela Gallego	string
183	submissionId	13	int
183	stageId	3	int
183	round	1	int
184	reviewAssignmentId	19	int
184	reviewerName	Julie Janssen	string
184	submissionId	13	int
184	round	1	int
185	reviewAssignmentId	19	int
185	reviewerName	Julie Janssen	string
185	submissionId	13	int
185	round	1	int
186	reviewAssignmentId	20	int
186	reviewerName	Aisla McCrae	string
186	submissionId	13	int
186	round	1	int
187	reviewAssignmentId	20	int
187	reviewerName	Aisla McCrae	string
187	submissionId	13	int
187	round	1	int
188	reviewAssignmentId	21	int
188	reviewerName	Adela Gallego	string
188	submissionId	13	int
188	round	1	int
189	reviewAssignmentId	21	int
189	reviewerName	Adela Gallego	string
189	submissionId	13	int
190	editorName	Daniel Barnes	string
190	submissionId	13	int
190	decision	Request Revisions	string
192	fileStage	2	int
192	sourceSubmissionFileId	\N	string
192	submissionFileId	19	int
192	fileId	15	int
192	submissionId	14	int
192	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
192	username	pdaniel	string
193	fileStage	2	int
193	submissionFileId	19	int
193	fileId	15	int
193	submissionId	14	int
193	username	pdaniel	string
193	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
194	fileStage	2	int
194	sourceSubmissionFileId	\N	string
194	submissionFileId	19	int
194	fileId	15	int
194	submissionId	14	int
194	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
194	username	pdaniel	string
195	fileStage	2	int
195	sourceSubmissionFileId	\N	string
195	submissionFileId	19	int
195	fileId	15	int
195	submissionId	14	int
195	username	pdaniel	string
195	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
195	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
199	fileStage	2	int
199	sourceSubmissionFileId	\N	string
199	submissionFileId	20	int
199	fileId	16	int
199	submissionId	15	int
199	originalFileName	Yam diseases and its management in Nigeria.pdf	string
199	username	rbaiyewu	string
200	fileStage	2	int
200	submissionFileId	20	int
200	fileId	16	int
200	submissionId	15	int
200	username	rbaiyewu	string
200	name	Yam diseases and its management in Nigeria.pdf	string
201	fileStage	2	int
201	sourceSubmissionFileId	\N	string
201	submissionFileId	20	int
201	fileId	16	int
201	submissionId	15	int
201	originalFileName	Yam diseases and its management in Nigeria.pdf	string
201	username	rbaiyewu	string
202	fileStage	2	int
202	sourceSubmissionFileId	\N	string
202	submissionFileId	20	int
202	fileId	16	int
202	submissionId	15	int
202	username	rbaiyewu	string
202	originalFileName	Yam diseases and its management in Nigeria.pdf	string
202	name	Yam diseases and its management in Nigeria.pdf	string
205	editorName	Daniel Barnes	string
205	submissionId	15	int
205	decision	Send to Review	string
206	reviewAssignmentId	22	string
206	reviewerName	Paul Hudson	string
206	submissionId	15	int
206	stageId	3	int
206	round	1	int
207	reviewAssignmentId	23	string
207	reviewerName	Aisla McCrae	string
207	submissionId	15	int
207	stageId	3	int
207	round	1	int
208	editorName	Daniel Barnes	string
208	submissionId	15	int
208	decision	Accept Submission	string
209	name	Sarah Vogt	string
209	username	svogt	string
209	userGroupName	Copyeditor	string
210	editorName	Daniel Barnes	string
210	submissionId	15	int
210	decision	Send To Production	string
211	name	Stephen Hellier	string
211	username	shellier	string
211	userGroupName	Layout Editor	string
213	fileStage	2	int
213	sourceSubmissionFileId	\N	string
213	submissionFileId	21	int
213	fileId	17	int
213	submissionId	16	int
213	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
213	username	rrossi	string
214	fileStage	2	int
214	submissionFileId	21	int
214	fileId	17	int
214	submissionId	16	int
214	username	rrossi	string
214	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
215	fileStage	2	int
215	sourceSubmissionFileId	\N	string
215	submissionFileId	21	int
215	fileId	17	int
215	submissionId	16	int
215	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
215	username	rrossi	string
216	fileStage	2	int
216	sourceSubmissionFileId	\N	string
216	submissionFileId	21	int
216	fileId	17	int
216	submissionId	16	int
216	username	rrossi	string
216	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
216	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
220	fileStage	2	int
220	sourceSubmissionFileId	\N	string
220	submissionFileId	22	int
220	fileId	18	int
220	submissionId	17	int
220	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
220	username	vkarbasizaed	string
221	fileStage	2	int
221	submissionFileId	22	int
221	fileId	18	int
221	submissionId	17	int
221	username	vkarbasizaed	string
221	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
222	fileStage	2	int
222	sourceSubmissionFileId	\N	string
222	submissionFileId	22	int
222	fileId	18	int
222	submissionId	17	int
222	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
222	username	vkarbasizaed	string
223	fileStage	2	int
223	sourceSubmissionFileId	\N	string
223	submissionFileId	22	int
223	fileId	18	int
223	submissionId	17	int
223	username	vkarbasizaed	string
223	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
223	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
226	editorName	Daniel Barnes	string
226	submissionId	17	int
226	decision	Send to Review	string
227	reviewAssignmentId	24	string
227	reviewerName	Julie Janssen	string
227	submissionId	17	int
227	stageId	3	int
227	round	1	int
228	reviewAssignmentId	25	string
228	reviewerName	Paul Hudson	string
228	submissionId	17	int
228	stageId	3	int
228	round	1	int
229	editorName	Daniel Barnes	string
229	submissionId	17	int
229	decision	Accept Submission	string
230	name	Maria Fritz	string
230	username	mfritz	string
230	userGroupName	Copyeditor	string
231	editorName	Daniel Barnes	string
231	submissionId	17	int
231	decision	Send To Production	string
232	name	Graham Cox	string
232	username	gcox	string
232	userGroupName	Layout Editor	string
233	name	Catherine Turner	string
233	username	cturner	string
233	userGroupName	Proofreader	string
234	fileStage	10	int
234	sourceSubmissionFileId	\N	string
234	submissionFileId	23	int
234	fileId	19	int
234	submissionId	17	int
234	originalFileName	article.pdf	string
234	username	dbarnes	string
235	fileStage	10	int
235	submissionFileId	23	int
235	fileId	19	int
235	submissionId	17	int
235	username	dbarnes	string
235	name	article.pdf	string
236	fileStage	10	int
236	sourceSubmissionFileId	\N	string
236	submissionFileId	23	int
236	fileId	19	int
236	submissionId	17	int
236	originalFileName	article.pdf	string
236	username	dbarnes	string
237	fileStage	10	int
237	sourceSubmissionFileId	\N	string
237	submissionFileId	23	int
237	fileId	19	int
237	submissionId	17	int
237	username	dbarnes	string
237	originalFileName	article.pdf	string
237	name	article.pdf	string
249	fileStage	2	int
249	sourceSubmissionFileId	\N	string
249	submissionFileId	24	int
249	fileId	20	int
249	submissionId	18	int
249	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
249	username	vwilliamson	string
250	fileStage	2	int
250	submissionFileId	24	int
250	fileId	20	int
250	submissionId	18	int
250	username	vwilliamson	string
250	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
251	fileStage	2	int
251	sourceSubmissionFileId	\N	string
251	submissionFileId	24	int
251	fileId	20	int
251	submissionId	18	int
251	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
251	username	vwilliamson	string
252	fileStage	2	int
252	sourceSubmissionFileId	\N	string
252	submissionFileId	24	int
252	fileId	20	int
252	submissionId	18	int
252	username	vwilliamson	string
252	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
252	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
255	editorName	Daniel Barnes	string
255	submissionId	18	int
255	decision	Decline Submission	string
257	fileStage	2	int
257	sourceSubmissionFileId	\N	string
257	submissionFileId	25	int
257	fileId	21	int
257	submissionId	19	int
257	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
257	username	zwoods	string
258	fileStage	2	int
258	submissionFileId	25	int
258	fileId	21	int
258	submissionId	19	int
258	username	zwoods	string
258	name	Finocchiaro: Arguments About Arguments.pdf	string
259	fileStage	2	int
259	sourceSubmissionFileId	\N	string
259	submissionFileId	25	int
259	fileId	21	int
259	submissionId	19	int
259	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
259	username	zwoods	string
260	fileStage	2	int
260	sourceSubmissionFileId	\N	string
260	submissionFileId	25	int
260	fileId	21	int
260	submissionId	19	int
260	username	zwoods	string
260	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
260	name	Finocchiaro: Arguments About Arguments.pdf	string
263	editorName	Daniel Barnes	string
263	submissionId	19	int
263	decision	Send to Review	string
264	fileStage	4	int
264	sourceSubmissionFileId	25	int
264	submissionFileId	26	int
264	fileId	21	int
264	submissionId	19	int
264	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
264	username	dbarnes	string
265	fileStage	4	int
265	submissionFileId	26	int
265	fileId	21	int
265	submissionId	19	int
265	username	dbarnes	string
265	name	Finocchiaro: Arguments About Arguments.pdf	string
266	reviewAssignmentId	26	string
266	reviewerName	Paul Hudson	string
266	submissionId	19	int
266	stageId	3	int
266	round	1	int
267	reviewAssignmentId	27	string
267	reviewerName	Aisla McCrae	string
267	submissionId	19	int
267	stageId	3	int
267	round	1	int
268	editorName	Daniel Barnes	string
268	submissionId	19	int
268	decision	Accept Submission	string
269	name	Sarah Vogt	string
269	username	svogt	string
269	userGroupName	Copyeditor	string
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	journals/1/articles/1/63fe7856f37b1.pdf	application/pdf
2	journals/1/articles/1/63fe78948f052.pdf	application/pdf
3	journals/1/articles/2/63fe78ec01e35.pdf	application/pdf
4	journals/1/articles/3/63fe790ee7c18.pdf	application/pdf
5	journals/1/articles/4/63fe7931d75f3.pdf	application/pdf
6	journals/1/articles/5/63fe793fac06c.pdf	application/pdf
7	journals/1/articles/6/63fe796c97d90.pdf	application/pdf
8	journals/1/articles/7/63fe799672ce6.pdf	application/pdf
9	journals/1/articles/8/63fe79beeee75.pdf	application/pdf
10	journals/1/articles/9/63fe79cc81054.pdf	application/pdf
11	journals/1/articles/10/63fe79fed0301.pdf	application/pdf
12	journals/1/articles/11/63fe7a2c4b375.pdf	application/pdf
13	journals/1/articles/12/63fe7a3a35043.pdf	application/pdf
14	journals/1/articles/13/63fe7a559e836.pdf	application/pdf
15	journals/1/articles/14/63fe7a99ac053.pdf	application/pdf
16	journals/1/articles/15/63fe7aa4b6c92.pdf	application/pdf
17	journals/1/articles/16/63fe7ad0076d9.pdf	application/pdf
18	journals/1/articles/17/63fe7adb3cf13.pdf	application/pdf
19	journals/1/articles/17/63fe7b082cefc.pdf	application/pdf
20	journals/1/articles/18/63fe7b4adcbf2.pdf	application/pdf
21	journals/1/articles/19/63fe7b5f8896d.pdf	application/pdf
\.


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 21, true);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	article=>dc11	plugins.metadata.dc11.articleAdapter.displayName	plugins.metadata.dc11.articleAdapter.description	class::classes.submission.Submission	metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)
2	article=>doaj-xml	plugins.importexport.doaj.displayName	plugins.importexport.doaj.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/doaj/doajArticles.xsd)
3	article=>doaj-json	plugins.importexport.doaj.displayName	plugins.importexport.doaj.description	class::classes.submission.Submission	primitive::string
4	issue=>datacite-xml	plugins.importexport.datacite.displayName	plugins.importexport.datacite.description	class::classes.issue.Issue	xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)
5	article=>datacite-xml	plugins.importexport.datacite.displayName	plugins.importexport.datacite.description	class::classes.submission.Submission	xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)
6	galley=>datacite-xml	plugins.importexport.datacite.displayName	plugins.importexport.datacite.description	class::classes.article.ArticleGalley	xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)
7	user=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.user.User[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
8	user-xml=>user	plugins.importexport.users.displayName	plugins.importexport.users.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::classes.users.User[]
9	usergroup=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.security.UserGroup[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
10	user-xml=>usergroup	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::lib.pkp.classes.security.UserGroup[]
11	issue=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.issue.Issue[]	xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)
12	article=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)
13	article=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
14	native-xml=>article	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.submission.Submission[]
15	issue=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.issue.Issue[]	xml::schema(plugins/importexport/native/native.xsd)
16	native-xml=>issue	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.issue.Issue[]
17	issuegalley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.issue.IssueGalley[]	xml::schema(plugins/importexport/native/native.xsd)
18	native-xml=>issuegalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.issue.IssueGalley[]
19	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.article.Author[]	xml::schema(plugins/importexport/native/native.xsd)
20	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.article.Author[]
21	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
22	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SubmissionFile
23	article-galley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.article.ArticleGalley	xml::schema(plugins/importexport/native/native.xsd)
24	native-xml=>ArticleGalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.article.ArticleGalley[]
25	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
26	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication
27	article=>pubmed-xml	plugins.importexport.pubmed.displayName	plugins.importexport.pubmed.description	class::classes.submission.Submission[]	xml::dtd
\.


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 27, true);


--
-- Data for Name: filter_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.filter_settings (filter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.filters (filter_id, filter_group_id, context_id, display_name, class_name, is_template, parent_filter_id, seq) FROM stdin;
1	1	0	Extract metadata from a(n) Submission	plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter	0	0	0
2	2	0	DOAJ XML export	plugins.importexport.doaj.filter.DOAJXmlFilter	0	0	0
3	3	0	DOAJ JSON export	plugins.importexport.doaj.filter.DOAJJsonFilter	0	0	0
4	4	0	DataCite XML export	plugins.importexport.datacite.filter.DataciteXmlFilter	0	0	0
5	5	0	DataCite XML export	plugins.importexport.datacite.filter.DataciteXmlFilter	0	0	0
6	6	0	DataCite XML export	plugins.importexport.datacite.filter.DataciteXmlFilter	0	0	0
7	7	0	User XML user export	lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter	0	0	0
8	8	0	User XML user import	lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter	0	0	0
9	9	0	Native XML user group export	lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter	0	0	0
10	10	0	Native XML user group import	lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter	0	0	0
11	11	0	Crossref XML issue export	plugins.importexport.crossref.filter.IssueCrossrefXmlFilter	0	0	0
12	12	0	Crossref XML issue export	plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter	0	0	0
13	13	0	Native XML submission export	plugins.importexport.native.filter.ArticleNativeXmlFilter	0	0	0
14	14	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlArticleFilter	0	0	0
15	15	0	Native XML issue export	plugins.importexport.native.filter.IssueNativeXmlFilter	0	0	0
16	16	0	Native XML issue import	plugins.importexport.native.filter.NativeXmlIssueFilter	0	0	0
17	17	0	Native XML issue galley export	plugins.importexport.native.filter.IssueGalleyNativeXmlFilter	0	0	0
18	18	0	Native XML issue galley import	plugins.importexport.native.filter.NativeXmlIssueGalleyFilter	0	0	0
19	19	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
20	20	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
21	22	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlArticleFileFilter	0	0	0
22	21	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
23	23	0	Native XML representation export	plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter	0	0	0
24	24	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlArticleGalleyFilter	0	0	0
25	25	0	Native XML Publication export	plugins.importexport.native.filter.PublicationNativeXmlFilter	0	0	0
26	26	0	Native XML publication import	plugins.importexport.native.filter.NativeXmlPublicationFilter	0	0	0
27	27	0	ArticlePubMedXmlFilter	plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter	0	0	0
\.


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 27, true);


--
-- Data for Name: genre_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.genre_settings (genre_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Article Text	string
1	fr_CA	name	Texte de l'article	string
2	en_US	name	Research Instrument	string
2	fr_CA	name	Instruments de recherche	string
3	en_US	name	Research Materials	string
3	fr_CA	name	Documents de recherche	string
4	en_US	name	Research Results	string
4	fr_CA	name	Résultats de recherche	string
5	en_US	name	Transcripts	string
5	fr_CA	name	Transcriptions	string
6	en_US	name	Data Analysis	string
6	fr_CA	name	Analyse de données	string
7	en_US	name	Data Set	string
7	fr_CA	name	Ensemble de données	string
8	en_US	name	Source Texts	string
8	fr_CA	name	Textes source	string
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
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: ojs-ci
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
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 12, true);


--
-- Data for Name: institutional_subscription_ip; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.institutional_subscription_ip (institutional_subscription_ip_id, subscription_id, ip_string, ip_start, ip_end) FROM stdin;
\.


--
-- Name: institutional_subscription_ip_institutional_subscription_ip_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.institutional_subscription_ip_institutional_subscription_ip_seq', 1, false);


--
-- Data for Name: institutional_subscriptions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.institutional_subscriptions (institutional_subscription_id, subscription_id, institution_name, mailing_address, domain) FROM stdin;
\.


--
-- Name: institutional_subscriptions_institutional_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.institutional_subscriptions_institutional_subscription_id_seq', 1, false);


--
-- Data for Name: issue_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.issue_files (file_id, issue_id, file_name, file_type, file_size, content_type, original_file_name, date_uploaded, date_modified) FROM stdin;
\.


--
-- Name: issue_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.issue_files_file_id_seq', 1, false);


--
-- Data for Name: issue_galley_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.issue_galley_settings (galley_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: issue_galleys; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.issue_galleys (galley_id, locale, issue_id, file_id, label, seq, url_path) FROM stdin;
\.


--
-- Name: issue_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.issue_galleys_galley_id_seq', 1, false);


--
-- Data for Name: issue_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.issue_settings (issue_id, locale, setting_name, setting_value, setting_type) FROM stdin;
2	en_US	title		string
2	fr_CA	title		string
2	en_US	description		string
2	fr_CA	description		string
1	en_US	title		string
1	fr_CA	title		string
1	en_US	description		string
1	fr_CA	description		string
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.issues (issue_id, journal_id, volume, number, year, published, current, date_published, date_notified, last_modified, access_status, open_access_date, show_volume, show_number, show_year, show_title, style_file_name, original_style_file_name, url_path) FROM stdin;
2	1	2	1	2015	0	0	\N	\N	2023-02-28 22:08:01	1	\N	1	1	1	0	\N	\N	
1	1	1	2	2014	1	1	2023-02-28 21:55:15	\N	2023-02-28 22:08:02	1	\N	1	1	1	0	\N	\N	
\.


--
-- Name: issues_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.issues_issue_id_seq', 2, true);


--
-- Data for Name: item_views; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.item_views (assoc_type, assoc_id, user_id, date_last_viewed) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Data for Name: journal_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.journal_settings (journal_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this journal. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal's <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor)."},{"order":2,"content":"The submission file is in OpenOffice, Microsoft Word, or RTF document file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines."}]	\N
1	fr_CA	librarianInformation	Nous incitons les bibliothécaires à lister cette revue dans leur fonds de revues numériques. Aussi, il peut être pertinent de mentionner que ce système de publication en libre accès est conçu pour être hébergé par les bibliothèques de recherche pour que les membres de leurs facultés l'utilisent avec les revues dans lesquelles ils sont impliqués (voir <a href="http://pkp.sfu.ca/ojs">Open Journal Systems</a>).	\N
1	en_US	name	Journal of Public Knowledge	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	en_US	openAccessPolicy	This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	openAccessPolicy	Cette revue fournit le libre accès immédiat à son contenu se basant sur le principe que rendre la recherche disponible au public gratuitement facilite un plus grand échange du savoir, à l'échelle de la planète.	\N
1	fr_CA	privacyStatement	<p>Les noms et courriels saisis dans le site de cette revue seront utilisés exclusivement aux fins indiquées par cette revue et ne serviront à aucune autre fin, ni à toute autre partie.</p>	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"La soumission n'a pas déjà été publiée et n'est pas considérée actuellement par une autre revue. Si ce n'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice »."},{"order":2,"content":"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect."},{"order":3,"content":"Lorsque possible, les URL des références ont été fournies."},{"order":4,"content":"Le texte est à simple interligne, utilise une police de 12 points, emploie l'italique plutôt que le souligné (sauf pour les adresses URL) et place toutes les illustrations, figures et tableaux aux endroits appropriés dans le texte plutôt qu'à la fin."},{"order":5,"content":"Le texte se conforme aux exigences stylistiques et bibliographiques décrites dans les  <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\">Directives aux auteurs<\\/a>, qui se trouvent dans la section « À propos de la revue »."}]	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1	fr_CA	name	Journal de la connaissance du public	\N
1		numPageLinks	10	\N
1	fr_CA	readerInformation	Nous invitons les lecteurs-trices à s'inscrire pour recevoir les avis de publication de cette revue. Utiliser le lien <a href="http://localhost/index.php/publicknowledge/user/register">S'inscrire</a> en haut de la page d'accueil de la revue. Cette inscription permettra au,à la lecteur-trice de recevoir par courriel le sommaire de chaque nouveau numéro de la revue. Cette liste permet aussi à la revue de revendiquer un certain niveau de soutien ou de lectorat. Voir la <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Déclaration de confidentialité</a> de la revue qui certifie aux lecteurs-trices que leur nom et leur courriel ne seront pas utilisés à d'autres fins.	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		defaultReviewMode	2	\N
1		emailSignature	<br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/index.php/publicknowledge">Journal of Public Knowledge</a>	\N
1		disableSubmissions	0	\N
1		itemsPerPage	25	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>	\N
1		keywords	request	\N
1	en_US	librarianInformation	We encourage research librarians to list this journal among their library's electronic journal holdings. As well, it may be worth noting that this journal's open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href="http://pkp.sfu.ca/ojs">Open Journal Systems</a>).	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	searchDescription	The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1		themePluginPath	default	\N
1	en_US	abbreviation	publicknowledgeJ Pub Know	\N
1	en_US	clockssLicense	This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://clockss.org/">More...</a>	\N
1	fr_CA	clockssLicense	Cette revue utilise le système CLOCKSS pour créer un système d'archivage distribué parmi les bibliothèques participantes et permet à ces bibliothèques de créer des archives permanentes de la revue à des fins de conservation et de reconstitution. <a href="http://clockss.org/">En apprendre davantage... </a>	\N
1		copyrightYearBasis	issue	\N
1		enableOai	1	\N
1	en_US	lockssLicense	This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://www.lockss.org/">More...</a>	\N
1	en_US	acronym	JPKJPK	\N
1	fr_CA	authorInformation	Intéressé-e à soumettre à cette revue ? Nous vous recommandons de consulter les politiques de rubrique de la revue à la page <a href="http://localhost/index.php/publicknowledge/about">À propos de la revue</a> ainsi que les <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Directives aux auteurs</a>. Les auteurs-es doivent <a href="http://localhost/index.php/publicknowledge/user/register">s'inscrire</a> auprès de la revue avant de présenter une soumission, ou s'ils et elles sont déjà inscrits-es, simplement <a href="http://localhost/index.php/publicknowledge/login">ouvrir une session</a> et accéder au tableau de bord pour commencer les 5 étapes du processus.	\N
1	en_US	authorInformation	Interested in submitting to this journal? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About the Journal</a> page for the journal's section policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> with the journal prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the five-step process.	\N
1	fr_CA	lockssLicense	Cette revue utilise le système LOCKSS pour créer un système de distribution des archives parmi les bibliothèques participantes et afin de permettre à ces bibliothèques de créer des archives permanentes pour fins de préservation et de restauration. <a href="http://lockss.org/">En apprendre davantage...</a>	\N
1		membershipFee	0	\N
1		onlineIssn	0378-5955	\N
1		printIssn	0378-5955	\N
1		publicationFee	0	\N
1		publisherInstitution	Public Knowledge Project	\N
1		purchaseArticleFee	0	\N
\.


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.journals (journal_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en_US	1
\.


--
-- Name: journals_journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.journals_journal_id_seq', 1, true);


--
-- Data for Name: library_file_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.library_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: library_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.library_files (file_id, context_id, file_name, original_file_name, file_type, file_size, type, date_uploaded, date_modified, submission_id, public_access) FROM stdin;
\.


--
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.library_files_file_id_seq', 1, false);


--
-- Data for Name: metadata_description_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.metadata_description_settings (metadata_description_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: metadata_descriptions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.metadata_descriptions (metadata_description_id, assoc_type, assoc_id, schema_namespace, schema_name, display_name, seq) FROM stdin;
\.


--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.metadata_descriptions_metadata_description_id_seq', 1, false);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.metrics (load_id, context_id, pkp_section_id, assoc_object_type, assoc_object_id, submission_id, representation_id, assoc_type, assoc_id, day, month, file_type, country_id, region, city, metric_type, metric) FROM stdin;
\.


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 23, true);


--
-- Data for Name: navigation_menu_item_assignment_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.navigation_menu_item_assignment_settings (navigation_menu_item_assignment_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: navigation_menu_item_assignments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
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
18	3	18	0	3
19	3	19	18	0
20	3	20	18	1
21	3	21	18	2
22	3	22	18	3
23	3	23	18	4
\.


--
-- Data for Name: navigation_menu_item_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
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
15		titleLocaleKey	navigation.current	string
16		titleLocaleKey	navigation.archives	string
17		titleLocaleKey	manager.announcements	string
18		titleLocaleKey	navigation.about	string
19		titleLocaleKey	about.aboutContext	string
20		titleLocaleKey	about.submissions	string
21		titleLocaleKey	about.editorialTeam	string
22		titleLocaleKey	manager.setup.privacyStatement	string
23		titleLocaleKey	about.contact	string
24		titleLocaleKey	common.search	string
\.


--
-- Data for Name: navigation_menu_items; Type: TABLE DATA; Schema: public; Owner: ojs-ci
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
15	1	\N	NMI_TYPE_CURRENT
16	1	\N	NMI_TYPE_ARCHIVES
17	1	\N	NMI_TYPE_ANNOUNCEMENTS
18	1	\N	NMI_TYPE_ABOUT
19	1	\N	NMI_TYPE_ABOUT
20	1	\N	NMI_TYPE_SUBMISSIONS
21	1	\N	NMI_TYPE_EDITORIAL_TEAM
22	1	\N	NMI_TYPE_PRIVACY
23	1	\N	NMI_TYPE_CONTACT
24	1	\N	NMI_TYPE_SEARCH
\.


--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.navigation_menu_items_navigation_menu_item_id_seq', 24, true);


--
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	0	user	User Navigation Menu
2	1	user	User Navigation Menu
3	1	primary	Primary Navigation Menu
\.


--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.navigation_menus_navigation_menu_id_seq', 3, true);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.notes (note_id, assoc_type, assoc_id, user_id, date_created, date_modified, title, contents) FROM stdin;
1	1048586	1	6	2023-02-28 21:58:26	2023-02-28 21:58:26	Recommendation	<p>Daniel Barnes, David Buskins, Stephanie Berardo:<br><br>The recommendation regarding the submission to Journal of Public Knowledge, "The influence of lactation on the quantity and quality of cashmere production" is: Accept Submission</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/index.php/publicknowledge">Journal of Public Knowledge</a>
\.


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 1, true);


--
-- Data for Name: notification_mail_list; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.notification_mail_list (notification_mail_list_id, email, confirmed, token, context) FROM stdin;
\.


--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.notification_mail_list_notification_mail_list_id_seq', 1, false);


--
-- Data for Name: notification_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.notification_settings (notification_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: notification_subscription_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.notification_subscription_settings (setting_id, setting_name, setting_value, user_id, context, setting_type) FROM stdin;
1	blocked_emailed_notification	8	17	1	int
2	blocked_emailed_notification	268435477	17	1	int
3	blocked_emailed_notification	8	18	1	int
4	blocked_emailed_notification	268435477	18	1	int
5	blocked_emailed_notification	8	19	1	int
6	blocked_emailed_notification	268435477	19	1	int
7	blocked_emailed_notification	8	20	1	int
8	blocked_emailed_notification	268435477	20	1	int
9	blocked_emailed_notification	8	21	1	int
10	blocked_emailed_notification	268435477	21	1	int
11	blocked_emailed_notification	8	22	1	int
12	blocked_emailed_notification	268435477	22	1	int
13	blocked_emailed_notification	8	23	1	int
14	blocked_emailed_notification	268435477	23	1	int
15	blocked_emailed_notification	8	24	1	int
16	blocked_emailed_notification	268435477	24	1	int
17	blocked_emailed_notification	8	25	1	int
18	blocked_emailed_notification	268435477	25	1	int
19	blocked_emailed_notification	8	26	1	int
20	blocked_emailed_notification	268435477	26	1	int
21	blocked_emailed_notification	8	27	1	int
22	blocked_emailed_notification	268435477	27	1	int
23	blocked_emailed_notification	8	28	1	int
24	blocked_emailed_notification	268435477	28	1	int
25	blocked_emailed_notification	8	29	1	int
26	blocked_emailed_notification	268435477	29	1	int
27	blocked_emailed_notification	8	30	1	int
28	blocked_emailed_notification	268435477	30	1	int
29	blocked_emailed_notification	8	31	1	int
30	blocked_emailed_notification	268435477	31	1	int
31	blocked_emailed_notification	8	32	1	int
32	blocked_emailed_notification	268435477	32	1	int
33	blocked_emailed_notification	8	33	1	int
34	blocked_emailed_notification	268435477	33	1	int
35	blocked_emailed_notification	8	34	1	int
36	blocked_emailed_notification	268435477	34	1	int
37	blocked_emailed_notification	8	35	1	int
38	blocked_emailed_notification	268435477	35	1	int
\.


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 38, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.notifications (notification_id, context_id, user_id, level, type, date_created, date_read, assoc_type, assoc_id) FROM stdin;
77	1	3	2	16777217	2023-02-28 21:58:42	\N	1048585	3
413	1	3	2	16777217	2023-02-28 22:08:14	\N	1048585	18
79	1	5	2	16777217	2023-02-28 21:58:42	\N	1048585	3
208	1	3	2	16777217	2023-02-28 22:01:51	\N	1048585	9
81	1	4	2	16777217	2023-02-28 21:58:42	\N	1048585	3
83	1	0	2	16777243	2023-02-28 21:58:42	\N	1048585	3
84	1	0	2	16777245	2023-02-28 21:58:42	\N	1048585	3
137	1	4	2	16777254	2023-02-28 21:59:55	\N	1048585	5
6	1	3	2	16777217	2023-02-28 21:55:37	\N	1048585	1
138	1	5	2	16777254	2023-02-28 21:59:55	\N	1048585	5
8	1	5	2	16777217	2023-02-28 21:55:37	\N	1048585	1
125	1	10	3	16777227	2023-02-28 21:59:46	\N	517	7
10	1	4	2	16777217	2023-02-28 21:55:37	\N	1048585	1
12	1	0	2	16777243	2023-02-28 21:55:37	\N	1048585	1
13	1	0	2	16777245	2023-02-28 21:55:37	\N	1048585	1
86	1	0	2	16777236	2023-02-28 21:58:46	2023-02-28 21:58:48	523	3
88	1	9	3	16777227	2023-02-28 21:58:52	\N	517	4
15	1	0	2	16777236	2023-02-28 21:55:41	2023-02-28 21:55:43	523	1
17	1	7	3	16777227	2023-02-28 21:55:46	\N	517	1
111	1	3	2	16777217	2023-02-28 21:59:30	\N	1048585	5
91	1	10	3	16777227	2023-02-28 21:58:58	\N	517	5
20	1	9	3	16777227	2023-02-28 21:55:50	\N	517	2
113	1	5	2	16777217	2023-02-28 21:59:30	\N	1048585	5
23	1	10	3	16777227	2023-02-28 21:55:56	\N	517	3
95	1	19	2	16777230	2023-02-28 21:59:00	\N	1048585	3
58	1	3	2	16777217	2023-02-28 21:58:07	\N	1048585	2
97	1	4	2	16777251	2023-02-28 21:59:00	\N	1048585	3
98	1	5	2	16777251	2023-02-28 21:59:00	\N	1048585	3
96	1	3	2	16777251	2023-02-28 21:59:00	2023-02-28 21:59:01	1048585	3
115	1	4	2	16777217	2023-02-28 21:59:30	\N	1048585	5
60	1	5	2	16777217	2023-02-28 21:58:07	\N	1048585	2
62	1	4	2	16777217	2023-02-28 21:58:07	\N	1048585	2
101	1	3	2	16777217	2023-02-28 21:59:19	\N	1048585	4
33	1	17	2	16777235	2023-02-28 21:56:06	\N	1048585	1
103	1	5	2	16777217	2023-02-28 21:59:20	\N	1048585	4
105	1	4	2	16777217	2023-02-28 21:59:20	\N	1048585	4
64	1	0	2	16777243	2023-02-28 21:58:07	\N	1048585	2
65	1	0	2	16777245	2023-02-28 21:58:07	\N	1048585	2
107	1	0	2	16777243	2023-02-28 21:59:20	\N	1048585	4
108	1	0	2	16777245	2023-02-28 21:59:20	\N	1048585	4
117	1	0	2	16777243	2023-02-28 21:59:30	\N	1048585	5
118	1	0	2	16777245	2023-02-28 21:59:30	\N	1048585	5
41	1	17	3	16777259	2023-02-28 21:57:09	\N	1048585	1
43	1	16	3	16777259	2023-02-28 21:57:10	\N	1048585	1
152	1	7	3	16777227	2023-02-28 22:00:26	\N	517	8
45	1	14	3	16777259	2023-02-28 21:57:10	\N	1048585	1
136	1	3	2	16777254	2023-02-28 21:59:55	2023-02-28 21:59:57	1048585	5
47	1	12	3	16777259	2023-02-28 21:57:10	\N	1048585	1
49	1	5	3	16777259	2023-02-28 21:57:10	\N	1048585	1
51	1	4	3	16777259	2023-02-28 21:57:10	\N	1048585	1
53	1	3	3	16777259	2023-02-28 21:57:10	\N	1048585	1
120	1	0	2	16777236	2023-02-28 21:59:35	2023-02-28 21:59:37	523	4
122	1	8	3	16777227	2023-02-28 21:59:40	\N	517	6
68	1	18	2	16777231	2023-02-28 21:58:11	\N	1048585	2
67	1	0	2	16777236	2023-02-28 21:58:11	2023-02-28 21:58:13	523	2
71	1	3	3	16777249	2023-02-28 21:58:26	\N	1048586	1
73	1	4	3	16777249	2023-02-28 21:58:26	\N	1048586	1
75	1	5	3	16777249	2023-02-28 21:58:26	\N	1048586	1
135	1	21	2	16777235	2023-02-28 21:59:55	\N	1048585	5
141	1	3	2	16777217	2023-02-28 22:00:15	\N	1048585	6
143	1	5	2	16777217	2023-02-28 22:00:15	\N	1048585	6
145	1	4	2	16777217	2023-02-28 22:00:15	\N	1048585	6
147	1	0	2	16777243	2023-02-28 22:00:16	\N	1048585	6
148	1	0	2	16777245	2023-02-28 22:00:16	\N	1048585	6
150	1	0	2	16777236	2023-02-28 22:00:20	2023-02-28 22:00:22	523	5
155	1	10	3	16777227	2023-02-28 22:00:32	\N	517	9
176	1	0	2	16777243	2023-02-28 22:00:57	\N	1048585	7
165	1	22	2	16777235	2023-02-28 22:00:40	\N	1048585	6
167	1	4	2	16777254	2023-02-28 22:00:41	\N	1048585	6
168	1	5	2	16777254	2023-02-28 22:00:41	\N	1048585	6
166	1	3	2	16777254	2023-02-28 22:00:41	2023-02-28 22:00:42	1048585	6
170	1	3	2	16777217	2023-02-28 22:00:57	\N	1048585	7
172	1	5	2	16777217	2023-02-28 22:00:57	\N	1048585	7
174	1	4	2	16777217	2023-02-28 22:00:57	\N	1048585	7
177	1	0	2	16777245	2023-02-28 22:00:57	\N	1048585	7
180	1	23	2	16777231	2023-02-28 22:01:02	\N	1048585	7
179	1	0	2	16777236	2023-02-28 22:01:02	2023-02-28 22:01:04	523	6
184	1	9	3	16777227	2023-02-28 22:01:11	\N	517	11
198	1	3	2	16777217	2023-02-28 22:01:40	\N	1048585	8
187	1	10	3	16777227	2023-02-28 22:01:17	\N	517	12
200	1	5	2	16777217	2023-02-28 22:01:40	\N	1048585	8
415	1	5	2	16777217	2023-02-28 22:08:14	\N	1048585	18
202	1	4	2	16777217	2023-02-28 22:01:40	\N	1048585	8
342	1	0	2	16777243	2023-02-28 22:05:17	\N	1048585	14
204	1	0	2	16777243	2023-02-28 22:01:40	\N	1048585	8
205	1	0	2	16777245	2023-02-28 22:01:40	\N	1048585	8
191	1	3	2	16777219	2023-02-28 22:01:24	\N	517	10
343	1	0	2	16777245	2023-02-28 22:05:17	\N	1048585	14
193	1	4	2	16777219	2023-02-28 22:01:24	\N	517	10
195	1	5	2	16777219	2023-02-28 22:01:24	\N	517	10
417	1	4	2	16777217	2023-02-28 22:08:14	\N	1048585	18
314	1	3	2	16777219	2023-02-28 22:04:38	\N	517	19
299	1	0	2	16777243	2023-02-28 22:04:09	\N	1048585	13
276	1	3	2	16777217	2023-02-28 22:03:41	\N	1048585	12
210	1	6	2	16777217	2023-02-28 22:01:51	\N	1048585	9
316	1	5	2	16777219	2023-02-28 22:04:38	\N	517	19
212	1	0	2	16777243	2023-02-28 22:01:51	\N	1048585	9
213	1	0	2	16777245	2023-02-28 22:01:51	\N	1048585	9
318	1	4	2	16777219	2023-02-28 22:04:38	\N	517	19
215	1	0	2	16777236	2023-02-28 22:01:57	2023-02-28 22:01:58	523	7
217	1	7	3	16777227	2023-02-28 22:02:02	\N	517	13
328	1	3	2	16777219	2023-02-28 22:04:55	\N	517	21
321	1	3	2	16777219	2023-02-28 22:04:46	\N	517	20
220	1	10	3	16777227	2023-02-28 22:02:08	\N	517	14
323	1	5	2	16777219	2023-02-28 22:04:46	\N	517	20
278	1	5	2	16777217	2023-02-28 22:03:41	\N	1048585	12
325	1	4	2	16777219	2023-02-28 22:04:46	\N	517	20
330	1	5	2	16777219	2023-02-28 22:04:55	\N	517	21
332	1	4	2	16777219	2023-02-28 22:04:55	\N	517	21
252	1	3	2	16777219	2023-02-28 22:03:07	\N	517	15
335	1	29	3	16777232	2023-02-28 22:05:05	\N	1048585	13
351	1	0	2	16777243	2023-02-28 22:05:27	\N	1048585	15
229	1	25	2	16777235	2023-02-28 22:02:17	\N	1048585	9
231	1	6	2	16777254	2023-02-28 22:02:18	\N	1048585	9
254	1	5	2	16777219	2023-02-28 22:03:07	\N	517	15
230	1	3	2	16777254	2023-02-28 22:02:17	2023-02-28 22:02:19	1048585	9
336	1	3	2	16777217	2023-02-28 22:05:16	\N	1048585	14
338	1	5	2	16777217	2023-02-28 22:05:16	\N	1048585	14
256	1	4	2	16777219	2023-02-28 22:03:07	\N	517	15
234	1	3	2	16777217	2023-02-28 22:02:42	\N	1048585	10
236	1	5	2	16777217	2023-02-28 22:02:42	\N	1048585	10
340	1	4	2	16777217	2023-02-28 22:05:17	\N	1048585	14
238	1	4	2	16777217	2023-02-28 22:02:42	\N	1048585	10
240	1	0	2	16777243	2023-02-28 22:02:42	\N	1048585	10
241	1	0	2	16777245	2023-02-28 22:02:42	\N	1048585	10
352	1	0	2	16777245	2023-02-28 22:05:27	\N	1048585	15
280	1	4	2	16777217	2023-02-28 22:03:41	\N	1048585	12
282	1	0	2	16777243	2023-02-28 22:03:41	\N	1048585	12
244	1	26	2	16777231	2023-02-28 22:02:48	\N	1048585	10
243	1	0	2	16777236	2023-02-28 22:02:48	2023-02-28 22:02:49	523	8
345	1	3	2	16777217	2023-02-28 22:05:27	\N	1048585	15
283	1	0	2	16777245	2023-02-28 22:03:41	\N	1048585	12
259	1	3	2	16777219	2023-02-28 22:03:15	\N	517	16
261	1	5	2	16777219	2023-02-28 22:03:15	\N	517	16
347	1	5	2	16777217	2023-02-28 22:05:27	\N	1048585	15
263	1	4	2	16777219	2023-02-28 22:03:15	\N	517	16
349	1	4	2	16777217	2023-02-28 22:05:27	\N	1048585	15
300	1	0	2	16777245	2023-02-28 22:04:09	\N	1048585	13
354	1	0	2	16777236	2023-02-28 22:05:35	2023-02-28 22:05:36	523	11
266	1	3	2	16777217	2023-02-28 22:03:30	\N	1048585	11
356	1	8	3	16777227	2023-02-28 22:05:40	\N	517	22
268	1	5	2	16777217	2023-02-28 22:03:30	\N	1048585	11
270	1	4	2	16777217	2023-02-28 22:03:30	\N	1048585	11
272	1	0	2	16777243	2023-02-28 22:03:30	\N	1048585	11
273	1	0	2	16777245	2023-02-28 22:03:30	\N	1048585	11
359	1	9	3	16777227	2023-02-28 22:05:44	\N	517	23
286	1	28	2	16777231	2023-02-28 22:03:48	\N	1048585	12
285	1	0	2	16777236	2023-02-28 22:03:48	2023-02-28 22:03:50	523	9
287	1	7	3	16777227	2023-02-28 22:03:53	\N	517	17
302	1	0	2	16777236	2023-02-28 22:04:15	2023-02-28 22:04:17	523	10
290	1	8	3	16777227	2023-02-28 22:03:57	\N	517	18
293	1	3	2	16777217	2023-02-28 22:04:08	\N	1048585	13
295	1	5	2	16777217	2023-02-28 22:04:09	\N	1048585	13
297	1	4	2	16777217	2023-02-28 22:04:09	\N	1048585	13
419	1	0	2	16777243	2023-02-28 22:08:14	\N	1048585	18
420	1	0	2	16777245	2023-02-28 22:08:14	\N	1048585	18
369	1	31	2	16777235	2023-02-28 22:05:53	\N	1048585	15
371	1	5	2	16777254	2023-02-28 22:05:54	\N	1048585	15
372	1	4	2	16777254	2023-02-28 22:05:54	\N	1048585	15
370	1	3	2	16777254	2023-02-28 22:05:54	2023-02-28 22:05:55	1048585	15
423	1	34	2	16777234	2023-02-28 22:08:21	\N	1048585	18
374	1	3	2	16777217	2023-02-28 22:06:11	\N	1048585	16
376	1	5	2	16777217	2023-02-28 22:06:11	\N	1048585	16
424	1	3	2	16777217	2023-02-28 22:08:34	\N	1048585	19
378	1	4	2	16777217	2023-02-28 22:06:11	\N	1048585	16
380	1	0	2	16777243	2023-02-28 22:06:11	\N	1048585	16
381	1	0	2	16777245	2023-02-28 22:06:11	\N	1048585	16
426	1	6	2	16777217	2023-02-28 22:08:34	\N	1048585	19
428	1	0	2	16777243	2023-02-28 22:08:34	\N	1048585	19
429	1	0	2	16777245	2023-02-28 22:08:34	\N	1048585	19
383	1	3	2	16777217	2023-02-28 22:06:22	\N	1048585	17
385	1	5	2	16777217	2023-02-28 22:06:23	\N	1048585	17
387	1	4	2	16777217	2023-02-28 22:06:23	\N	1048585	17
389	1	0	2	16777243	2023-02-28 22:06:23	\N	1048585	17
390	1	0	2	16777245	2023-02-28 22:06:23	\N	1048585	17
431	1	0	2	16777236	2023-02-28 22:08:42	2023-02-28 22:08:44	523	13
433	1	8	3	16777227	2023-02-28 22:08:47	\N	517	26
392	1	0	2	16777236	2023-02-28 22:06:31	2023-02-28 22:06:32	523	12
394	1	7	3	16777227	2023-02-28 22:06:36	\N	517	24
436	1	9	3	16777227	2023-02-28 22:08:51	\N	517	27
397	1	8	3	16777227	2023-02-28 22:06:40	\N	517	25
440	1	35	2	16777230	2023-02-28 22:08:53	\N	1048585	19
442	1	6	2	16777251	2023-02-28 22:08:53	\N	1048585	19
441	1	3	2	16777251	2023-02-28 22:08:53	2023-02-28 22:08:55	1048585	19
407	1	33	2	16777235	2023-02-28 22:06:49	\N	1048585	17
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 443, true);


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
defaultthemeplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
acronplugin	0	enabled	1	bool
tinymceplugin	0	enabled	1	bool
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
acronplugin	0	crontab	[{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.importexport.doaj.DOAJInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.datacite.DataciteInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.crossref.CrossrefInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.importexport.doaj.DOAJInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.datacite.DataciteInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.crossref.CrossrefInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.importexport.doaj.DOAJInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.datacite.DataciteInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.crossref.CrossrefInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.importexport.doaj.DOAJInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.datacite.DataciteInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.crossref.CrossrefInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"plugins.importexport.doaj.DOAJInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.datacite.DataciteInfoSender","frequency":{"hour":24},"args":[]},{"className":"plugins.importexport.crossref.CrossrefInfoSender","frequency":{"hour":24},"args":[]},{"className":"lib.pkp.classes.task.ReviewReminder","frequency":{"hour":24},"args":[]},{"className":"lib.pkp.classes.task.StatisticsReport","frequency":{"day":"1"},"args":[]},{"className":"classes.tasks.SubscriptionExpiryReminder","frequency":{"day":"1"},"args":[]}]	object
tinymceplugin	1	enabled	1	bool
defaultthemeplugin	1	enabled	1	bool
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
subscriptionblockplugin	1	enabled	1	bool
subscriptionblockplugin	1	seq	2	int
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
informationblockplugin	1	enabled	1	bool
informationblockplugin	1	seq	7	int
resolverplugin	1	enabled	1	bool
googlescholarplugin	1	enabled	1	bool
dublincoremetaplugin	1	enabled	1	bool
pdfjsviewerplugin	1	enabled	1	bool
lensgalleyplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	displayItems	1	bool
htmlarticlegalleyplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	63fe779a4e273	string
defaultthemeplugin	1	typography	notoSans	string
defaultthemeplugin	1	baseColour	#1E6292	string
defaultthemeplugin	1	showDescriptionInJournalIndex	false	string
defaultthemeplugin	1	useHomepageImageAsHeader	false	string
\.


--
-- Data for Name: publication_categories; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.publication_categories (publication_id, category_id) FROM stdin;
\.


--
-- Data for Name: publication_galley_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.publication_galley_settings (galley_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: publication_galleys; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.publication_galleys (galley_id, locale, publication_id, label, submission_file_id, seq, remote_url, is_approved, url_path) FROM stdin;
1	en_US	1	PDF	2	0		0	
2	en_US	2	PDF Version 2	2	0		0	pdf
3	en_US	18	PDF	23	0		0	
\.


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 3, true);


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
2		categoryIds	[]
2	en_US	copyrightHolder	Journal of Public Knowledge
2	fr_CA	copyrightHolder	Journal de la connaissance du public
2		copyrightYear	2023
2	en_US	prefix	The
2	en_US	subtitle	A Review Of The Literature And Empirical Evidence
2	en_US	title	Signalling Theory Dividends Version 2
2		issueId	1
2		pages	71-98
3	en_US	subtitle	
1	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
1		categoryIds	[]
1	en_US	copyrightHolder	Journal of Public Knowledge
1	fr_CA	copyrightHolder	Journal de la connaissance du public
1		copyrightYear	2023
1	en_US	prefix	The
3	en_US	abstract	<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>
3	fr_CA	abstract	
1	en_US	subtitle	A Review Of The Literature And Empirical Evidence
1	en_US	title	Signalling Theory Dividends
1		issueId	1
1		pages	71-98
3		categoryIds	[]
3	en_US	prefix	
3	fr_CA	prefix	
3	fr_CA	subtitle	
3	en_US	title	The influence of lactation on the quantity and quality of cashmere production
3	fr_CA	title	
4	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
4	fr_CA	abstract	
4		categoryIds	[]
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
4	fr_CA	title	
5	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
5	fr_CA	title	
2	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>
6		categoryIds	[]
12	fr_CA	abstract	
12	en_US	prefix	
6	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>
6	fr_CA	abstract	
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	Genetic transformation of forest trees
6	fr_CA	title	
7	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>
7	fr_CA	abstract	
7		categoryIds	[]
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
7	fr_CA	title	
8	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Developing efficacy beliefs in the classroom
8	fr_CA	title	
9	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>
9	fr_CA	abstract	
9		categoryIds	[]
9	en_US	prefix	
9	fr_CA	prefix	
9	en_US	subtitle	
9	fr_CA	subtitle	
9	en_US	title	Traditions and Trends in the Study of the Commons
9	fr_CA	title	
10	en_US	abstract	<p>None.</p>
10	fr_CA	abstract	
10		categoryIds	[]
10	en_US	prefix	
10	fr_CA	prefix	
10	en_US	subtitle	
10	fr_CA	subtitle	
10	en_US	title	Hansen & Pinto: Reason Reclaimed
10	fr_CA	title	
11	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>
11	fr_CA	abstract	
11		categoryIds	[]
11	en_US	prefix	
11	fr_CA	prefix	
11	en_US	subtitle	
11	fr_CA	subtitle	
11	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
11	fr_CA	title	
12	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>
12		categoryIds	[]
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Learning Sustainable Design through Service
12	fr_CA	title	
13	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>
13	fr_CA	abstract	
13		categoryIds	[]
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
13	fr_CA	title	
14	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>
14	fr_CA	abstract	
14		categoryIds	[]
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
14	fr_CA	title	
15	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>
15	fr_CA	abstract	
15		categoryIds	[]
15	en_US	prefix	
15	fr_CA	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
15	fr_CA	title	
16	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>
16	fr_CA	abstract	
16		categoryIds	[]
16	en_US	prefix	
16	fr_CA	prefix	
16	en_US	subtitle	
16	fr_CA	subtitle	
16	en_US	title	Yam diseases and its management in Nigeria
16	fr_CA	title	
17	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>
17	fr_CA	abstract	
17		categoryIds	[]
17	en_US	prefix	
17	fr_CA	prefix	
17	en_US	subtitle	
17	fr_CA	subtitle	
17	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
17	fr_CA	title	
18	fr_CA	abstract	
18		categoryIds	[]
18	en_US	copyrightHolder	Journal of Public Knowledge
18	fr_CA	copyrightHolder	Journal de la connaissance du public
18		copyrightYear	2023
18	en_US	prefix	
18	fr_CA	prefix	
18	en_US	subtitle	
18	fr_CA	subtitle	
18	fr_CA	title	
18	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
18		issueId	1
18	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>
19	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>
19	fr_CA	abstract	
19		categoryIds	[]
19	en_US	prefix	
19	fr_CA	prefix	
19	en_US	subtitle	
19	fr_CA	subtitle	
19	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments
19	fr_CA	title	
20	en_US	abstract	<p>None.</p>
20	fr_CA	abstract	
20		categoryIds	[]
20	en_US	prefix	
20	fr_CA	prefix	
20	en_US	subtitle	
20	fr_CA	subtitle	
20	en_US	title	Finocchiaro: Arguments About Arguments
20	fr_CA	title	
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, locale, primary_contact_id, section_id, seq, submission_id, status, url_path, version) FROM stdin;
1	0	2023-02-28	2023-02-28 21:57:06	\N	1	1	0	1	3	mwandenga-signalling-theory	1
18	0	2023-02-28	2023-02-28 22:07:58	\N	23	1	0	17	3	\N	1
2	0	2023-02-28	2023-02-28 21:57:39	\N	3	1	0	1	1	mwandenga	2
19	0	\N	2023-02-28 22:08:13	\N	24	1	0	18	1	\N	1
3	0	\N	2023-02-28 21:58:19	\N	5	1	0	2	1	\N	1
4	0	\N	2023-02-28 21:58:41	\N	6	1	0	3	1	\N	1
20	0	\N	2023-02-28 22:08:33	\N	25	2	0	19	1	\N	1
5	0	\N	2023-02-28 21:59:19	\N	7	1	0	4	1	\N	1
6	0	\N	2023-02-28 21:59:29	\N	9	1	0	5	1	\N	1
7	0	\N	2023-02-28 22:00:15	\N	10	1	0	6	1	\N	1
8	0	\N	2023-02-28 22:00:56	\N	11	1	0	7	1	\N	1
9	0	\N	2023-02-28 22:01:39	\N	12	1	0	8	1	\N	1
10	0	\N	2023-02-28 22:01:50	\N	14	2	0	9	1	\N	1
11	0	\N	2023-02-28 22:02:41	\N	15	1	0	10	1	\N	1
12	0	\N	2023-02-28 22:03:29	\N	16	1	0	11	1	\N	1
13	0	\N	2023-02-28 22:03:40	\N	18	1	0	12	1	\N	1
14	0	\N	2023-02-28 22:04:08	\N	19	1	0	13	1	\N	1
15	0	\N	2023-02-28 22:05:16	\N	20	1	0	14	1	\N	1
16	0	\N	2023-02-28 22:05:26	\N	21	1	0	15	1	\N	1
17	0	\N	2023-02-28 22:06:10	\N	22	1	0	16	1	\N	1
\.


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 20, true);


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
1	1048585	2	3	1	\N	\N	0
\.


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.queries_query_id_seq', 1, true);


--
-- Data for Name: query_participants; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.query_participants (query_id, user_id) FROM stdin;
1	3
1	4
1	5
\.


--
-- Data for Name: queued_payments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.queued_payments (queued_payment_id, date_created, date_modified, expiry_date, payment_data) FROM stdin;
\.


--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.queued_payments_queued_payment_id_seq', 1, false);


--
-- Data for Name: review_assignments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, unconsidered) FROM stdin;
1	1	7	\N	\N	2023-02-28 21:55:46	2023-02-28 21:55:46	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:55:46	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0
2	1	9	\N	\N	2023-02-28 21:55:50	2023-02-28 21:55:50	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:55:50	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0
16	10	10	\N	3	2023-02-28 22:02:59	2023-02-28 22:02:59	2023-02-28 22:03:11	2023-02-28 22:03:15	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:03:15	0	0	0	\N	\N	\N	\N	8	3	2	1	4	\N	0
3	1	10	\N	\N	2023-02-28 21:55:56	2023-02-28 21:55:56	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:55:56	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0
4	3	9	\N	\N	2023-02-28 21:58:52	2023-02-28 21:58:52	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:58:52	0	0	0	\N	\N	\N	\N	3	3	2	1	1	\N	0
24	17	7	\N	\N	2023-02-28 22:06:36	2023-02-28 22:06:36	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:06:36	0	0	0	\N	\N	\N	\N	12	3	2	1	1	\N	0
5	3	10	\N	\N	2023-02-28 21:58:58	2023-02-28 21:58:58	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:58:58	0	0	0	\N	\N	\N	\N	3	3	2	1	1	\N	0
17	12	7	\N	\N	2023-02-28 22:03:53	2023-02-28 22:03:53	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:03:53	0	0	0	\N	\N	\N	\N	9	3	2	1	1	\N	0
6	5	8	\N	\N	2023-02-28 21:59:40	2023-02-28 21:59:40	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:59:40	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
7	5	10	\N	\N	2023-02-28 21:59:46	2023-02-28 21:59:46	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 21:59:46	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
8	6	7	\N	\N	2023-02-28 22:00:26	2023-02-28 22:00:26	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:00:26	0	0	0	\N	\N	\N	\N	5	3	2	1	1	\N	0
18	12	8	\N	\N	2023-02-28 22:03:57	2023-02-28 22:03:57	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:03:57	0	0	0	\N	\N	\N	\N	9	3	2	1	1	\N	0
9	6	10	\N	\N	2023-02-28 22:00:32	2023-02-28 22:00:32	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:00:32	0	0	0	\N	\N	\N	\N	5	3	2	1	1	\N	0
25	17	8	\N	\N	2023-02-28 22:06:40	2023-02-28 22:06:40	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:06:40	0	0	0	\N	\N	\N	\N	12	3	2	1	1	\N	0
11	7	9	\N	\N	2023-02-28 22:01:11	2023-02-28 22:01:11	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:01:11	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
12	7	10	\N	\N	2023-02-28 22:01:17	2023-02-28 22:01:17	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:01:17	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
26	19	8	\N	\N	2023-02-28 22:08:47	2023-02-28 22:08:47	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:08:47	0	0	0	\N	\N	\N	\N	13	3	2	1	1	\N	0
10	7	8	\N	5	2023-02-28 22:01:07	2023-02-28 22:01:07	2023-02-28 22:01:21	2023-02-28 22:01:24	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:01:24	0	0	0	\N	\N	\N	\N	6	3	2	1	4	\N	0
13	9	7	\N	\N	2023-02-28 22:02:02	2023-02-28 22:02:02	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:02:02	0	0	0	\N	\N	\N	\N	7	3	2	1	1	\N	0
14	9	10	\N	\N	2023-02-28 22:02:08	2023-02-28 22:02:08	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:02:08	0	0	0	\N	\N	\N	\N	7	3	2	1	1	\N	0
27	19	9	\N	\N	2023-02-28 22:08:51	2023-02-28 22:08:51	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:08:51	0	0	0	\N	\N	\N	\N	13	3	2	1	1	\N	0
19	13	7	\N	2	2023-02-28 22:04:21	2023-02-28 22:04:21	2023-02-28 22:04:34	2023-02-28 22:04:38	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:04:38	0	0	0	\N	\N	\N	\N	10	3	2	1	4	\N	0
15	10	9	\N	2	2023-02-28 22:02:53	2023-02-28 22:02:53	2023-02-28 22:03:03	2023-02-28 22:03:07	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:03:07	0	0	0	\N	\N	\N	\N	8	3	2	1	4	\N	0
20	13	9	\N	2	2023-02-28 22:04:25	2023-02-28 22:04:25	2023-02-28 22:04:42	2023-02-28 22:04:46	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:04:46	0	0	0	\N	\N	\N	\N	10	3	2	1	4	\N	0
21	13	10	\N	3	2023-02-28 22:04:31	2023-02-28 22:04:31	2023-02-28 22:04:51	2023-02-28 22:04:55	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:04:55	0	0	0	\N	\N	\N	\N	10	3	2	1	4	\N	0
22	15	8	\N	\N	2023-02-28 22:05:40	2023-02-28 22:05:40	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:05:40	0	0	0	\N	\N	\N	\N	11	3	2	1	1	\N	0
23	15	9	\N	\N	2023-02-28 22:05:44	2023-02-28 22:05:44	\N	\N	\N	2023-03-28 00:00:00	2023-03-28 00:00:00	2023-02-28 22:05:44	0	0	0	\N	\N	\N	\N	11	3	2	1	1	\N	0
\.


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.review_assignments_review_id_seq', 27, true);


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_files (review_id, submission_file_id) FROM stdin;
4	6
5	6
8	10
9	10
15	15
16	15
26	26
27	26
\.


--
-- Data for Name: review_form_element_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_form_element_settings (review_form_element_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_form_elements; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_form_elements (review_form_element_id, review_form_id, seq, element_type, required, included) FROM stdin;
\.


--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.review_form_elements_review_form_element_id_seq', 1, false);


--
-- Data for Name: review_form_responses; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_form_responses (review_form_element_id, review_id, response_type, response_value) FROM stdin;
\.


--
-- Data for Name: review_form_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_form_settings (review_form_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_forms; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_forms (review_form_id, assoc_type, assoc_id, seq, is_active) FROM stdin;
\.


--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.review_forms_review_form_id_seq', 1, false);


--
-- Data for Name: review_round_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_round_files (submission_id, review_round_id, stage_id, submission_file_id) FROM stdin;
2	2	3	4
3	3	3	6
6	5	3	10
10	8	3	15
19	13	3	26
\.


--
-- Data for Name: review_rounds; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.review_rounds (review_round_id, submission_id, stage_id, round, review_revision, status) FROM stdin;
12	17	3	1	\N	4
1	1	3	1	\N	4
2	2	3	1	\N	6
3	3	3	1	\N	4
13	19	3	1	\N	4
4	5	3	1	\N	4
5	6	3	1	\N	4
6	7	3	1	\N	8
7	9	3	1	\N	4
8	10	3	1	\N	8
9	12	3	1	\N	7
10	13	3	1	\N	1
11	15	3	1	\N	4
\.


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.review_rounds_review_round_id_seq', 13, true);


--
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.scheduled_tasks (class_name, last_run) FROM stdin;
plugins.generic.usageStats.UsageStatsLoader	2023-02-28 21:52:13
plugins.importexport.doaj.DOAJInfoSender	2023-02-28 21:52:13
plugins.importexport.datacite.DataciteInfoSender	2023-02-28 21:52:13
plugins.importexport.crossref.CrossrefInfoSender	2023-02-28 21:52:13
lib.pkp.classes.task.ReviewReminder	2023-02-28 21:52:13
lib.pkp.classes.task.StatisticsReport	2023-02-28 21:52:13
classes.tasks.SubscriptionExpiryReminder	2023-02-28 21:52:13
\.


--
-- Data for Name: section_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.section_settings (section_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Articles	string
1	fr_CA	title		string
1	en_US	policy	<p>Section default policy</p>	string
1	fr_CA	policy		string
1	en_US	abbrev	ART	string
1	fr_CA	abbrev		string
1	en_US	identifyType		string
1	fr_CA	identifyType		string
2	en_US	title	Reviews	string
2	fr_CA	title		string
2	en_US	policy		string
2	fr_CA	policy		string
2	en_US	abbrev	REV	string
2	fr_CA	abbrev		string
2	en_US	identifyType	Review Article	string
2	fr_CA	identifyType		string
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.sections (section_id, journal_id, review_form_id, seq, editor_restricted, meta_indexed, meta_reviewed, abstracts_not_required, hide_title, hide_author, is_inactive, abstract_word_count) FROM stdin;
1	1	0	1	0	1	1	0	0	0	0	500
2	1	0	2	0	1	1	1	0	0	0	0
\.


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 2, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
ql03djo2g8vaf04scjjr7qf1c2	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621131	1677621131	0		localhost
18qlmaorbchfqmr2rkgetnlj83	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621478	1677621511	0	csrf|a:2:{s:9:"timestamp";i:1677621511;s:5:"token";s:32:"67b32d1868801ee6d387eb744aba0b2c";}username|s:7:"dbarnes";userId|i:3;	localhost
dveur5s189o5djigk0oapv9j0f	17	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621397	1677621400	0	userId|i:17;username|s:10:"amwandenga";csrf|a:2:{s:9:"timestamp";i:1677621400;s:5:"token";s:32:"6ddd89d956268dfe5e008dbe915e91fb";}	localhost
qafj5aacmhlm8nmq3111n73t6e	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621310	1677621318	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1677621318;s:5:"token";s:32:"610f83e40a6ae06af6cdec40b958d0ea";}	localhost
fn6388s8iior58bgvit9qs7db3	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621146	1677621160	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1677621160;s:5:"token";s:32:"5ea7d0a85aff2b73bcfc2537bffe680e";}	localhost
f3ai4sdove2mfr4t9h88cus8hd	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621160	1677621167	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1677621167;s:5:"token";s:32:"63116b9cf69683946f4723d555d063c8";}	localhost
nii5qo4kjdksgfarhmak52d9m2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621512	1677621545	0	csrf|a:2:{s:9:"timestamp";i:1677621545;s:5:"token";s:32:"ebfe95833cf05da3ab997eabb19fce90";}username|s:7:"dbarnes";userId|i:3;	localhost
lmgnadc9c0ugb9d4ka967gq3sf	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621133	1677621145	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1677621145;s:5:"token";s:32:"68a31f4d12e99926acb5a7a90b7f333f";}	localhost
fo4hehk1spn62hq06ujj4vq1ur	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621167	1677621173	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1677621173;s:5:"token";s:32:"e79db189969b73c0ac7e2d9f2a4f5171";}	localhost
43k51ur28gt8v5stnn1g051l18	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621319	1677621327	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1677621327;s:5:"token";s:32:"036882bb7d0228adc844884ad46b8360";}	localhost
quhc65tdhqiag5kjstk4lhecrm	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621176	1677621308	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1677621308;s:5:"token";s:32:"704f358b98cb2b28b339a996adbe479c";}	localhost
ruugcugglh6cb3lahhql3hi1na	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621329	1677621375	0	csrf|a:2:{s:9:"timestamp";i:1677621375;s:5:"token";s:32:"734167ca6cdd6bc2ee42487050c5e29e";}username|s:7:"dbarnes";userId|i:3;	localhost
eirlgiuee62u02h6gcesmadgp9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621410	1677621419	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677621419;s:5:"token";s:32:"9e209cf5cd7e874764969be9b938a993";}	localhost
2naa1f5c8efparhvbugv5p2nue	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621376	1677621397	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677621397;s:5:"token";s:32:"55ce12b5448474e63a953582ae7b618b";}	localhost
4e37mvoumhdipvi5k2rkhn4rit	17	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621402	1677621410	0	username|s:10:"amwandenga";csrf|a:2:{s:9:"timestamp";i:1677621410;s:5:"token";s:32:"2c83d0e14709e3aaec9a6ff3fdc4fe2f";}userId|i:17;	localhost
hi7563agjdec1crkuh2fs0o9kp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621420	1677621426	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677621426;s:5:"token";s:32:"a453bfad8452687b5042bdf7b84a4f38";}	localhost
vgs1duurda6jr7soe04qat0adn	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621426	1677621451	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677621451;s:5:"token";s:32:"28d8865c30399cfe2691eb68fdb24f2d";}	localhost
sgupm7tt15147eiuf41969ef7u	5	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621461	1677621468	0	userId|i:5;username|s:8:"sberardo";csrf|a:2:{s:9:"timestamp";i:1677621469;s:5:"token";s:32:"823886b8af137933e34d1e131a5fda08";}signedInAs|i:3;	localhost
sv7p3ihcklsr8mirrb2sk6kbpl	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621456	1677621460	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677621461;s:5:"token";s:32:"b2973bfc51781c7a94e6d66443ff1d3f";}	localhost
kmhn0s3ev1kjdtbdbop1andvo7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621451	1677621456	0		localhost
ktpv29gmtp3o0v949ert735pk7	5	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621469	1677621476	0	userId|i:5;username|s:8:"sberardo";csrf|a:2:{s:9:"timestamp";i:1677621476;s:5:"token";s:32:"8d5a040461ee78467cfb14115dac494f";}signedInAs|i:3;	localhost
h6tq5666t3pbfkl5r3sbeiec6r	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621606	1677621646	0	csrf|a:2:{s:9:"timestamp";i:1677621646;s:5:"token";s:32:"744f5916780172db1cf66985419936c9";}username|s:7:"dbarnes";userId|i:3;	localhost
gjbch8493tjtcrvsqscbl4u6et	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621648	1677621685	0	csrf|a:2:{s:9:"timestamp";i:1677621685;s:5:"token";s:32:"3e425f3d9d6de839c5668ccad3c77e07";}username|s:7:"phudson";	localhost
1tplqjikv2ul1qcsr6pq5cp8aa	20	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621547	1677621560	0	csrf|a:2:{s:9:"timestamp";i:1677621559;s:5:"token";s:32:"f60fa6261ca4ea65cc5349c48ff6b285";}username|s:12:"cmontgomerie";userId|i:20;	localhost
34l4jqtfvh2d8oim69mojt1feq	30	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621907	1677621917	0	csrf|a:2:{s:9:"timestamp";i:1677621916;s:5:"token";s:32:"7490054acc52c2ec6c071d7ac093e024";}username|s:7:"pdaniel";userId|i:30;	localhost
6vs6n06seeimhtf4gbm682u2sq	24	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621688	1677621701	0	csrf|a:2:{s:9:"timestamp";i:1677621700;s:5:"token";s:32:"88051bc022d4a33d583cebde5e77a1f5";}username|s:7:"eostrom";userId|i:24;	localhost
lp9rk5cguvhpipng0kjv9vnv57	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621561	1677621604	0	csrf|a:2:{s:9:"timestamp";i:1677621604;s:5:"token";s:32:"783a2f0e3c87f17fd3e67ef23bb9c73c";}username|s:7:"dbarnes";userId|i:3;	localhost
gcju2b5jokb84o1sne0dgo97gt	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621839	1677621906	0	csrf|a:2:{s:9:"timestamp";i:1677621905;s:5:"token";s:32:"15c288dc2ec47620655f338a99e7b3fe";}username|s:7:"dbarnes";userId|i:3;	localhost
mvlksb5tmieukpf4d6rlfcq2kj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622045	1677622053	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677622053;s:5:"token";s:32:"e0bebe106c47864f60f9f87434e32137";}	localhost
vju50sa2uodjqn4dpamiuirvc3	27	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621797	1677621810	0	csrf|a:2:{s:9:"timestamp";i:1677621810;s:5:"token";s:32:"37a41ce0ec76a7350ccdf2f2966ee526";}username|s:10:"kalkhafaji";userId|i:27;	localhost
7glsdvk0pp8kfctpjetcssgdhu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621918	1677621959	0	csrf|a:2:{s:9:"timestamp";i:1677621960;s:5:"token";s:32:"82e283bfe62f62ce2d2397d9bbc37c56";}username|s:7:"dbarnes";userId|i:3;	localhost
q5tatm7o59pnu6563c9lk4ck4q	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621702	1677621747	0	csrf|a:2:{s:9:"timestamp";i:1677621747;s:5:"token";s:32:"100b8986231a6fc7296f93729cf62a1e";}username|s:7:"dbarnes";userId|i:3;	localhost
9ctohlinlcpq1o7b8fc9oocbml	32	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621961	1677621971	0	csrf|a:2:{s:9:"timestamp";i:1677621971;s:5:"token";s:32:"9fa69c6914dadec6c2c8378fd396761e";}username|s:6:"rrossi";userId|i:32;	localhost
i3lt61ac91n6rsjlfj9bvpdmtq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622053	1677622061	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677622061;s:5:"token";s:32:"aafdc4d166b3b6125149b45807869f53";}	localhost
fg2h2fn043s94su12r37kmaget	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622037	1677622045	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677622045;s:5:"token";s:32:"597ea95b47c458d9d474c16f2a91b1ee";}	localhost
lnl3rkmndbcd2eo4hak17o6e7k	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621752	1677621795	0	csrf|a:2:{s:9:"timestamp";i:1677621795;s:5:"token";s:32:"596b251bf652f1c7b74f3d95b9f3361b";}username|s:8:"agallego";	localhost
cqs9rahc4q9ljv8lkiddih8pod	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621973	1677622025	0	csrf|a:2:{s:9:"timestamp";i:1677622025;s:5:"token";s:32:"51e362a4436e71756c338c360dc259ef";}username|s:7:"dbarnes";userId|i:3;	localhost
1o39622hvqohkgoietng74unjq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622026	1677622037	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677622037;s:5:"token";s:32:"fb65bba86ef22694f77f53aea4d99b71";}	localhost
ovj06uel3ok5o417gt7fs1tr3s	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622061	1677622069	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677622069;s:5:"token";s:32:"4521d9704908215d9ec035232442e7bb";}	localhost
h6p5st1img4gesqnpb786grphi	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677621811	1677621837	0	csrf|a:2:{s:9:"timestamp";i:1677621837;s:5:"token";s:32:"eed89e81be755772e125e7c1601115dc";}username|s:7:"dbarnes";userId|i:3;	localhost
75aibjaoqofcdnn7hohb4mis05	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622069	1677622082	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1677622083;s:5:"token";s:32:"79931497f8979f11346e44fbd23ddaf5";}	localhost
k0k68dkesqmf54udoref0omlji	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622084	1677622104	0	csrf|a:2:{s:9:"timestamp";i:1677622104;s:5:"token";s:32:"c1b34756e6d933548a52733488038eb8";}username|s:7:"dbarnes";userId|i:3;	localhost
736frnkiunlj8su3oonmbq3bs1	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36	1677622105	1677622139	0	csrf|a:2:{s:9:"timestamp";i:1677622139;s:5:"token";s:32:"e0297a6216802ed1ab4ccb16b2e5fb3e";}username|s:7:"dbarnes";userId|i:3;	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.site (redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
0	en_US	6	["en_US","fr_CA"]	["en_US","fr_CA"]	\N
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.site_settings (setting_name, locale, setting_value) FROM stdin;
contactEmail	en_US	pkpadmin@mailinator.com
contactName	en_US	Open Journal Systems
contactName	fr_CA	Open Journal Systems
themePluginPath		default
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
2	1	3	3	2023-02-28 21:55:37	0	1
4	1	5	4	2023-02-28 21:55:37	0	1
5	1	7	12	2023-02-28 21:56:03	0	0
6	1	11	14	2023-02-28 21:56:10	0	0
7	1	13	16	2023-02-28 21:56:14	0	0
1	1	14	17	2023-02-28 21:56:44	0	1
3	1	5	5	2023-02-28 21:57:52	1	0
8	2	14	18	2023-02-28 21:58:02	0	0
9	2	3	3	2023-02-28 21:58:07	0	1
10	2	5	5	2023-02-28 21:58:07	0	1
11	2	5	4	2023-02-28 21:58:07	0	1
12	2	5	6	2023-02-28 21:58:16	1	1
13	3	14	19	2023-02-28 21:58:37	0	0
14	3	3	3	2023-02-28 21:58:42	0	1
15	3	5	5	2023-02-28 21:58:42	0	1
16	3	5	4	2023-02-28 21:58:42	0	1
17	3	7	11	2023-02-28 21:59:04	0	0
18	4	14	20	2023-02-28 21:59:12	0	0
19	4	3	3	2023-02-28 21:59:19	0	1
20	4	5	5	2023-02-28 21:59:19	0	1
21	4	5	4	2023-02-28 21:59:19	0	1
22	5	14	21	2023-02-28 21:59:26	0	0
23	5	3	3	2023-02-28 21:59:30	0	1
24	5	5	5	2023-02-28 21:59:30	0	1
25	5	5	4	2023-02-28 21:59:30	0	1
26	5	7	11	2023-02-28 21:59:52	0	0
27	5	11	13	2023-02-28 22:00:00	0	0
28	5	13	15	2023-02-28 22:00:03	0	0
29	6	14	22	2023-02-28 22:00:11	0	0
30	6	3	3	2023-02-28 22:00:15	0	1
31	6	5	5	2023-02-28 22:00:15	0	1
32	6	5	4	2023-02-28 22:00:15	0	1
33	6	7	11	2023-02-28 22:00:38	0	0
34	6	11	13	2023-02-28 22:00:45	0	0
35	7	14	23	2023-02-28 22:00:53	0	0
36	7	3	3	2023-02-28 22:00:57	0	1
37	7	5	5	2023-02-28 22:00:57	0	1
38	7	5	4	2023-02-28 22:00:57	0	1
39	8	14	24	2023-02-28 22:01:33	0	0
40	8	3	3	2023-02-28 22:01:40	0	1
41	8	5	5	2023-02-28 22:01:40	0	1
42	8	5	4	2023-02-28 22:01:40	0	1
43	9	14	25	2023-02-28 22:01:47	0	0
44	9	3	3	2023-02-28 22:01:51	0	1
45	9	5	6	2023-02-28 22:01:51	0	1
46	9	7	12	2023-02-28 22:02:15	0	0
47	9	11	14	2023-02-28 22:02:22	0	0
48	9	13	16	2023-02-28 22:02:26	0	0
49	10	14	26	2023-02-28 22:02:37	0	0
50	10	3	3	2023-02-28 22:02:42	0	1
51	10	5	5	2023-02-28 22:02:42	0	1
52	10	5	4	2023-02-28 22:02:42	0	1
53	11	14	27	2023-02-28 22:03:23	0	0
54	11	3	3	2023-02-28 22:03:30	0	1
55	11	5	5	2023-02-28 22:03:30	0	1
56	11	5	4	2023-02-28 22:03:30	0	1
57	12	14	28	2023-02-28 22:03:37	0	0
58	12	3	3	2023-02-28 22:03:41	0	1
59	12	5	5	2023-02-28 22:03:41	0	1
60	12	5	4	2023-02-28 22:03:41	0	1
61	13	14	29	2023-02-28 22:04:04	0	0
62	13	3	3	2023-02-28 22:04:08	0	1
63	13	5	5	2023-02-28 22:04:08	0	1
64	13	5	4	2023-02-28 22:04:08	0	1
65	14	14	30	2023-02-28 22:05:12	0	0
66	14	3	3	2023-02-28 22:05:16	0	1
67	14	5	5	2023-02-28 22:05:16	0	1
68	14	5	4	2023-02-28 22:05:16	0	1
69	15	14	31	2023-02-28 22:05:23	0	0
70	15	3	3	2023-02-28 22:05:27	0	1
71	15	5	5	2023-02-28 22:05:27	0	1
72	15	5	4	2023-02-28 22:05:27	0	1
73	15	7	12	2023-02-28 22:05:51	0	0
74	15	11	14	2023-02-28 22:05:58	0	0
75	16	14	32	2023-02-28 22:06:06	0	0
76	16	3	3	2023-02-28 22:06:11	0	1
77	16	5	5	2023-02-28 22:06:11	0	1
78	16	5	4	2023-02-28 22:06:11	0	1
79	17	14	33	2023-02-28 22:06:18	0	0
80	17	3	3	2023-02-28 22:06:22	0	1
81	17	5	5	2023-02-28 22:06:22	0	1
82	17	5	4	2023-02-28 22:06:22	0	1
83	17	7	11	2023-02-28 22:06:47	0	0
84	17	11	13	2023-02-28 22:06:54	0	0
85	17	13	15	2023-02-28 22:06:57	0	0
86	18	14	34	2023-02-28 22:08:09	0	0
87	18	3	3	2023-02-28 22:08:13	0	1
88	18	5	5	2023-02-28 22:08:14	0	1
89	18	5	4	2023-02-28 22:08:14	0	1
90	19	14	35	2023-02-28 22:08:30	0	0
91	19	3	3	2023-02-28 22:08:34	0	1
92	19	5	6	2023-02-28 22:08:34	0	1
93	19	7	12	2023-02-28 22:08:58	0	0
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 93, true);


--
-- Data for Name: static_page_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.static_page_settings (static_page_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.static_pages (static_page_id, path, context_id) FROM stdin;
\.


--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.static_pages_static_page_id_seq', 1, false);


--
-- Data for Name: subeditor_submission_group; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.subeditor_submission_group (context_id, assoc_id, assoc_type, user_id) FROM stdin;
1	1	530	5
1	1	530	4
1	2	530	6
\.


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
1	1	4096	7	10	8		<p>Here are my review comments</p>	2023-02-28 22:01:24	\N	1
2	1	4096	10	15	9		<p>Here are my review comments</p>	2023-02-28 22:03:07	\N	1
3	1	4096	10	16	10		<p>Here are my review comments</p>	2023-02-28 22:03:15	\N	1
4	1	4096	13	19	7		<p>Here are my review comments</p>	2023-02-28 22:04:38	\N	1
5	1	4096	13	20	9		<p>Here are my review comments</p>	2023-02-28 22:04:46	\N	1
6	1	4096	13	21	10		<p>Here are my review comments</p>	2023-02-28 22:04:55	\N	1
\.


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 6, true);


--
-- Data for Name: submission_file_revisions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_file_revisions (revision_id, submission_file_id, file_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	3
5	5	4
6	6	4
7	7	5
8	8	6
9	9	7
10	10	7
11	11	8
12	12	9
13	13	10
14	14	11
15	15	11
16	16	12
17	17	13
18	18	14
19	19	15
20	20	16
21	21	17
22	22	18
23	23	19
24	24	20
25	25	21
26	26	21
\.


--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submission_file_revisions_revision_id_seq', 26, true);


--
-- Data for Name: submission_file_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_file_settings (submission_file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
2	en_US	name	article.pdf	string
2	fr_CA	name		string
3	en_US	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
4	en_US	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
5	en_US	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
6	en_US	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
7	en_US	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
8	en_US	name	Genetic transformation of forest trees.pdf	string
9	en_US	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
10	en_US	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
11	en_US	name	Developing efficacy beliefs in the classroom.pdf	string
12	en_US	name	Traditions and Trends in the Study of the Commons.pdf	string
13	en_US	name	Hansen & Pinto: Reason Reclaimed.pdf	string
14	en_US	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
15	en_US	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
16	en_US	name	Learning Sustainable Design through Service.pdf	string
17	en_US	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
18	en_US	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
19	en_US	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
20	en_US	name	Yam diseases and its management in Nigeria.pdf	string
21	en_US	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
22	en_US	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
23	en_US	name	article.pdf	string
23	fr_CA	name		string
24	en_US	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
25	en_US	name	Finocchiaro: Arguments About Arguments.pdf	string
26	en_US	name	Finocchiaro: Arguments About Arguments.pdf	string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	1	\N	1	2	\N	\N	\N	2023-02-28 21:55:35	2023-02-28 21:55:35	17	\N	\N
2	1	2	\N	1	10	\N	\N	\N	2023-02-28 21:56:36	2023-02-28 21:56:37	3	521	1
3	2	3	\N	1	2	\N	\N	\N	2023-02-28 21:58:04	2023-02-28 21:58:04	18	\N	\N
4	2	3	3	1	4	\N	\N	\N	2023-02-28 21:58:11	2023-02-28 21:58:11	18	\N	\N
5	3	4	\N	1	2	\N	\N	\N	2023-02-28 21:58:38	2023-02-28 21:58:39	19	\N	\N
6	3	4	5	1	4	\N	\N	\N	2023-02-28 21:58:46	2023-02-28 21:58:46	19	\N	\N
7	4	5	\N	1	2	\N	\N	\N	2023-02-28 21:59:13	2023-02-28 21:59:14	20	\N	\N
8	5	6	\N	1	2	\N	\N	\N	2023-02-28 21:59:27	2023-02-28 21:59:28	21	\N	\N
9	6	7	\N	1	2	\N	\N	\N	2023-02-28 22:00:12	2023-02-28 22:00:12	22	\N	\N
10	6	7	9	1	4	\N	\N	\N	2023-02-28 22:00:20	2023-02-28 22:00:20	22	\N	\N
11	7	8	\N	1	2	\N	\N	\N	2023-02-28 22:00:54	2023-02-28 22:00:54	23	\N	\N
12	8	9	\N	1	2	\N	\N	\N	2023-02-28 22:01:34	2023-02-28 22:01:35	24	\N	\N
13	9	10	\N	1	2	\N	\N	\N	2023-02-28 22:01:48	2023-02-28 22:01:48	25	\N	\N
14	10	11	\N	1	2	\N	\N	\N	2023-02-28 22:02:38	2023-02-28 22:02:39	26	\N	\N
15	10	11	14	1	4	\N	\N	\N	2023-02-28 22:02:48	2023-02-28 22:02:48	26	\N	\N
16	11	12	\N	1	2	\N	\N	\N	2023-02-28 22:03:24	2023-02-28 22:03:24	27	\N	\N
17	12	13	\N	1	2	\N	\N	\N	2023-02-28 22:03:38	2023-02-28 22:03:38	28	\N	\N
18	13	14	\N	1	2	\N	\N	\N	2023-02-28 22:04:05	2023-02-28 22:04:05	29	\N	\N
19	14	15	\N	1	2	\N	\N	\N	2023-02-28 22:05:13	2023-02-28 22:05:14	30	\N	\N
20	15	16	\N	1	2	\N	\N	\N	2023-02-28 22:05:24	2023-02-28 22:05:25	31	\N	\N
21	16	17	\N	1	2	\N	\N	\N	2023-02-28 22:06:08	2023-02-28 22:06:08	32	\N	\N
22	17	18	\N	1	2	\N	\N	\N	2023-02-28 22:06:19	2023-02-28 22:06:19	33	\N	\N
23	17	19	\N	1	10	\N	\N	\N	2023-02-28 22:07:04	2023-02-28 22:07:04	3	521	3
24	18	20	\N	1	2	\N	\N	\N	2023-02-28 22:08:10	2023-02-28 22:08:11	34	\N	\N
25	19	21	\N	1	2	\N	\N	\N	2023-02-28 22:08:31	2023-02-28 22:08:31	35	\N	\N
26	19	21	25	1	4	\N	\N	\N	2023-02-28 22:08:42	2023-02-28 22:08:42	35	\N	\N
\.


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 26, true);


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	alan
2	mwandenga
3	university
4	cape
5	town
6	lorem
7	ipsum
8	signalling
9	theory
10	dividends
11	review
12	literature
13	empirical
14	evidence
15	signaling
16	suggests
17	signal
18	future
19	prospects
20	firm
21	recent
22	offer
23	conclusive
24	issue
25	conflicting
26	policy
27	implications
28	financial
29	economists
30	practical
31	dividend
32	guidance
33	management
34	existing
35	potential
36	investors
37	shareholding
38	corporate
39	investment
40	financing
41	distribution
42	decisions
43	continuous
44	function
45	rely
46	intuitive
47	evaluation
48	professional
49	development
50	social
51	transformation
52	version
53	vajiheh
54	karbasizaed
55	tehran
56	antimicrobial
57	heavy
58	metal
59	resistance
60	plasmid
61	profile
62	coliforms
63	isolated
64	nosocomial
65	infections
66	hospital
67	isfahan
68	iran
69	patterns
70	profiles
71	enterobacteriacea
72	healthy
73	human
74	faeces
75	compared
76	fifteen
77	isolates
78	identified
79	escherichia
80	coli
81	remaining
82	kelebsiella
83	pneumoniae
84	seventy
85	percent
86	strains
87	possess
88	multiple
89	antibiotics
90	difference
91	minimal
92	inhibitory
93	concentration
94	mic
95	values
96	clinical
97	cases
98	metals
99	significant
100	tolerant
101	persons
102	consistent
103	relationship
104	group
105	pattern
106	conjugative
107	encoding
108	recovered
109	results
110	multidrug-resistance
111	infection
112	region
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 112, true);


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_search_object_keywords (object_id, keyword_id, pos) FROM stdin;
9	1	0
9	2	1
9	3	2
9	4	3
9	5	4
9	6	5
9	7	6
10	8	0
10	9	1
10	10	2
10	11	3
10	12	4
10	13	5
10	14	6
11	15	0
11	9	1
11	16	2
11	10	3
11	17	4
11	18	5
11	19	6
11	20	7
11	21	8
11	13	9
11	14	10
11	22	11
11	23	12
11	14	13
11	24	14
11	25	15
11	26	16
11	27	17
11	28	18
11	29	19
11	30	20
11	31	21
11	26	22
11	32	23
11	33	24
11	34	25
11	35	26
11	36	27
11	37	28
11	38	29
11	39	30
11	40	31
11	41	32
11	42	33
11	43	34
11	44	35
11	33	36
11	31	37
11	42	38
11	45	39
11	46	40
11	47	41
13	48	0
13	49	1
13	50	2
13	51	3
33	53	0
33	54	1
33	3	2
33	55	3
34	56	0
34	57	1
34	58	2
34	59	3
34	60	4
34	61	5
34	62	6
34	63	7
34	64	8
34	65	9
34	66	10
34	67	11
34	68	12
35	56	0
35	57	1
35	58	2
35	59	3
35	69	4
35	60	5
35	70	6
35	62	7
35	71	8
35	63	9
35	64	10
35	65	11
35	72	12
35	73	13
35	74	14
35	75	15
35	76	16
35	77	17
35	64	18
35	65	19
35	78	20
35	79	21
35	80	22
35	81	23
35	82	24
35	83	25
35	84	26
35	85	27
35	86	28
35	63	29
35	64	30
35	65	31
35	87	32
35	88	33
35	59	34
35	89	35
35	75	36
35	86	37
35	72	38
35	73	39
35	74	40
35	90	41
35	91	42
35	92	43
35	93	44
35	94	45
35	95	46
35	86	47
35	96	48
35	97	49
35	74	50
35	57	51
35	98	52
35	99	53
35	86	54
35	63	55
35	66	56
35	100	57
35	57	58
35	58	59
35	72	60
35	101	61
35	102	62
35	103	63
35	60	64
35	61	65
35	104	66
35	56	67
35	59	68
35	105	69
35	106	70
35	60	71
35	107	72
35	59	73
35	57	74
35	98	75
35	89	76
35	108	77
35	86	78
35	63	79
35	64	80
35	65	81
35	109	82
35	110	83
35	62	84
35	35	85
35	64	86
35	111	87
35	112	88
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
9	1	1	0
10	1	2	0
11	1	4	0
12	1	16	0
13	1	17	0
14	1	8	0
15	1	32	0
16	1	64	0
33	17	1	0
34	17	2	0
35	17	4	0
36	17	16	0
37	17	17	0
38	17	8	0
39	17	32	0
40	17	64	0
\.


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 40, true);


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: submission_tombstones; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submission_tombstones (tombstone_id, submission_id, date_deleted, journal_id, section_id, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submission_tombstones_tombstone_id_seq', 1, false);


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
6	1	7	2023-02-28 22:00:45	2023-02-28 22:00:15	2023-02-28 22:00:15	5	en_US	1	0	0
19	1	20	2023-02-28 22:08:58	2023-02-28 22:08:34	2023-02-28 22:08:34	4	en_US	1	0	0
13	1	14	2023-02-28 22:05:05	2023-02-28 22:04:08	2023-02-28 22:04:08	3	en_US	1	0	0
3	1	4	2023-02-28 21:59:04	2023-02-28 21:58:42	2023-02-28 21:58:42	4	en_US	1	0	0
10	1	11	2023-02-28 22:03:15	2023-02-28 22:02:42	2023-02-28 22:02:42	3	en_US	1	0	0
14	1	15	2023-02-28 22:05:17	2023-02-28 22:05:16	2023-02-28 22:05:16	1	en_US	1	0	0
7	1	8	2023-02-28 22:01:24	2023-02-28 22:00:57	2023-02-28 22:00:57	3	en_US	1	0	0
4	1	5	2023-02-28 21:59:20	2023-02-28 21:59:19	2023-02-28 21:59:19	1	en_US	1	0	0
11	1	12	2023-02-28 22:03:30	2023-02-28 22:03:30	2023-02-28 22:03:30	1	en_US	1	0	0
8	1	9	2023-02-28 22:01:40	2023-02-28 22:01:40	2023-02-28 22:01:40	1	en_US	1	0	0
1	1	1	2023-02-28 21:57:52	2023-02-28 21:55:37	2023-02-28 21:55:37	5	en_US	3	0	0
5	1	6	2023-02-28 22:00:03	2023-02-28 21:59:30	2023-02-28 21:59:30	5	en_US	1	0	0
17	1	18	2023-02-28 22:07:58	2023-02-28 22:06:22	2023-02-28 22:06:22	5	en_US	3	0	0
15	1	16	2023-02-28 22:05:58	2023-02-28 22:05:27	2023-02-28 22:05:27	5	en_US	1	0	0
12	1	13	2023-02-28 22:03:57	2023-02-28 22:03:41	2023-02-28 22:03:41	3	en_US	1	0	0
2	1	3	2023-02-28 21:58:26	2023-02-28 21:58:07	2023-02-28 21:58:07	3	en_US	1	0	0
9	1	10	2023-02-28 22:02:26	2023-02-28 22:01:51	2023-02-28 22:01:51	5	en_US	1	0	0
16	1	17	2023-02-28 22:06:11	2023-02-28 22:06:11	2023-02-28 22:06:11	1	en_US	1	0	0
18	1	19	2023-02-28 22:08:21	2023-02-28 22:08:13	2023-02-28 22:08:13	1	en_US	4	0	0
\.


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.submissions_submission_id_seq', 19, true);


--
-- Data for Name: subscription_type_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.subscription_type_settings (type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: subscription_types; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.subscription_types (type_id, journal_id, cost, currency_code_alpha, duration, format, institutional, membership, disable_public_display, seq) FROM stdin;
\.


--
-- Name: subscription_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.subscription_types_type_id_seq', 1, false);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.subscriptions (subscription_id, journal_id, user_id, type_id, date_start, date_end, status, membership, reference_number, notes) FROM stdin;
\.


--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.subscriptions_subscription_id_seq', 1, false);


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
\.


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.temporary_files_file_id_seq', 1, false);


--
-- Data for Name: usage_stats_temporary_records; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.usage_stats_temporary_records (assoc_id, assoc_type, day, entry_time, metric, country_id, region, city, load_id, file_type) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
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
6		nameLocaleKey	default.groups.name.guestEditor	string
6		abbrevLocaleKey	default.groups.abbrev.guestEditor	string
7		nameLocaleKey	default.groups.name.copyeditor	string
7		abbrevLocaleKey	default.groups.abbrev.copyeditor	string
8		nameLocaleKey	default.groups.name.designer	string
8		abbrevLocaleKey	default.groups.abbrev.designer	string
9		nameLocaleKey	default.groups.name.funding	string
9		abbrevLocaleKey	default.groups.abbrev.funding	string
10		nameLocaleKey	default.groups.name.indexer	string
10		abbrevLocaleKey	default.groups.abbrev.indexer	string
11		nameLocaleKey	default.groups.name.layoutEditor	string
11		abbrevLocaleKey	default.groups.abbrev.layoutEditor	string
12		nameLocaleKey	default.groups.name.marketing	string
12		abbrevLocaleKey	default.groups.abbrev.marketing	string
13		nameLocaleKey	default.groups.name.proofreader	string
13		abbrevLocaleKey	default.groups.abbrev.proofreader	string
14		nameLocaleKey	default.groups.name.author	string
14		abbrevLocaleKey	default.groups.abbrev.author	string
15		nameLocaleKey	default.groups.name.translator	string
15		abbrevLocaleKey	default.groups.abbrev.translator	string
16		nameLocaleKey	default.groups.name.externalReviewer	string
16		abbrevLocaleKey	default.groups.abbrev.externalReviewer	string
17		nameLocaleKey	default.groups.name.reader	string
17		abbrevLocaleKey	default.groups.abbrev.reader	string
18		nameLocaleKey	default.groups.name.subscriptionManager	string
18		abbrevLocaleKey	default.groups.abbrev.subscriptionManager	string
2	en_US	name	Journal manager	string
2	en_US	abbrev	JM	string
3	en_US	name	Journal editor	string
3	en_US	abbrev	JE	string
4	en_US	name	Production editor	string
4	en_US	abbrev	ProdE	string
5	en_US	name	Section editor	string
5	en_US	abbrev	SecE	string
6	en_US	name	Guest editor	string
6	en_US	abbrev	GE	string
7	en_US	name	Copyeditor	string
7	en_US	abbrev	CE	string
8	en_US	name	Designer	string
8	en_US	abbrev	Design	string
9	en_US	name	Funding coordinator	string
9	en_US	abbrev	FC	string
10	en_US	name	Indexer	string
10	en_US	abbrev	IND	string
11	en_US	name	Layout Editor	string
11	en_US	abbrev	LE	string
12	en_US	name	Marketing and sales coordinator	string
12	en_US	abbrev	MS	string
13	en_US	name	Proofreader	string
13	en_US	abbrev	PR	string
14	en_US	name	Author	string
14	en_US	abbrev	AU	string
15	en_US	name	Translator	string
15	en_US	abbrev	Trans	string
16	en_US	name	Reviewer	string
16	en_US	abbrev	R	string
17	en_US	name	Reader	string
17	en_US	abbrev	Read	string
18	en_US	name	Subscription Manager	string
18	en_US	abbrev	SubM	string
2	fr_CA	name	Directeur-trice de la revue	string
2	fr_CA	abbrev	DIR	string
3	fr_CA	name	Rédacteur-trice	string
3	fr_CA	abbrev	RÉD	string
4	fr_CA	name	Directeur-trice de production	string
4	fr_CA	abbrev	DirProd	string
5	fr_CA	name	Rédacteur-trice de rubrique	string
5	fr_CA	abbrev	RÉDRUB	string
6	fr_CA	name	Rédacteur-trice invité-e	string
6	fr_CA	abbrev	RÉDINV	string
7	fr_CA	name	Réviseur-e	string
7	fr_CA	abbrev	RÉV	string
8	fr_CA	name	Designer	string
8	fr_CA	abbrev	Design	string
9	fr_CA	name	Coordonnateur-trice du financement	string
9	fr_CA	abbrev	CF	string
10	fr_CA	name	Indexeur-e	string
10	fr_CA	abbrev	Indx	string
11	fr_CA	name	Responsable de la mise en page	string
11	fr_CA	abbrev	RespMP	string
12	fr_CA	name	Coordonnateur-trice des ventes et du marketing	string
12	fr_CA	abbrev	CVM	string
13	fr_CA	name	Correcteur-trice d'épreuves	string
13	fr_CA	abbrev	CorEp	string
14	fr_CA	name	Auteur-e	string
14	fr_CA	abbrev	AU	string
15	fr_CA	name	Traducteur-trice	string
15	fr_CA	abbrev	Trad	string
16	fr_CA	name	Évaluateur-trice	string
16	fr_CA	abbrev	ÉVAL	string
17	fr_CA	name	Lecteur-trice	string
17	fr_CA	abbrev	Lect	string
18	fr_CA	name	Responsable des abonnements	string
18	fr_CA	abbrev	RespAB	string
\.


--
-- Data for Name: user_group_stage; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.user_group_stage (context_id, user_group_id, stage_id) FROM stdin;
1	3	1
1	3	3
1	3	4
1	3	5
1	4	4
1	4	5
1	5	1
1	5	3
1	5	4
1	5	5
1	6	1
1	6	3
1	6	4
1	6	5
1	7	4
1	8	5
1	9	1
1	9	3
1	10	5
1	11	5
1	12	4
1	13	5
1	14	1
1	14	3
1	14	4
1	14	5
1	15	1
1	15	3
1	15	4
1	15	5
1	16	3
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.user_groups (user_group_id, context_id, role_id, is_default, show_title, permit_self_registration, permit_metadata_edit) FROM stdin;
1	0	1	1	0	0	0
2	1	16	1	0	0	1
3	1	16	1	0	0	1
4	1	16	1	0	0	1
5	1	17	1	0	0	1
6	1	17	1	0	0	0
7	1	4097	1	0	0	0
8	1	4097	1	0	0	0
9	1	4097	1	0	0	0
10	1	4097	1	0	0	0
11	1	4097	1	0	0	0
12	1	4097	1	0	0	0
13	1	4097	1	0	0	0
14	1	65536	1	0	1	0
15	1	65536	1	0	0	0
16	1	4096	1	0	1	0
17	1	1048576	1	0	1	0
18	1	2097152	1	0	0	0
\.


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 18, true);


--
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.user_interests (user_id, controlled_vocab_entry_id) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.user_settings (user_id, locale, setting_name, assoc_type, assoc_id, setting_value, setting_type) FROM stdin;
3	fr_CA	biography	0	0		string
1	en_US	givenName	0	0	admin	string
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
2	fr_CA	signature	0	0		string
2	fr_CA	affiliation	0	0		string
2	en_US	givenName	0	0	Ramiro	string
2	fr_CA	givenName	0	0		string
2	en_US	familyName	0	0	Vaca	string
2	fr_CA	familyName	0	0		string
2	en_US	preferredPublicName	0	0		string
2	fr_CA	preferredPublicName	0	0		string
2		orcid	0	0		string
1	en_US	familyName	0	0	admin	string
2	fr_CA	biography	0	0		string
2	en_US	signature	0	0		string
3	en_US	signature	0	0		string
3	fr_CA	givenName	0	0		string
3	en_US	familyName	0	0	Barnes	string
3	fr_CA	preferredPublicName	0	0		string
3	fr_CA	familyName	0	0		string
3	en_US	preferredPublicName	0	0		string
8	en_US	biography	0	0		string
3	en_US	biography	0	0		string
3	fr_CA	signature	0	0		string
7	en_US	biography	0	0		string
6	en_US	biography	0	0		string
9	fr_CA	biography	0	0		string
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
3	en_US	givenName	0	0	Daniel	string
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
3		orcid	0	0		string
9	en_US	signature	0	0		string
9	fr_CA	signature	0	0		string
3	fr_CA	affiliation	0	0		string
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
11	en_US	biography	0	0		string
11	fr_CA	biography	0	0		string
11	en_US	signature	0	0		string
11	fr_CA	signature	0	0		string
11	en_US	affiliation	0	0	Ghent University	string
11	fr_CA	affiliation	0	0		string
11	en_US	givenName	0	0	Maria	string
11	fr_CA	givenName	0	0		string
11	en_US	familyName	0	0	Fritz	string
11	fr_CA	familyName	0	0		string
11	en_US	preferredPublicName	0	0		string
11	fr_CA	preferredPublicName	0	0		string
11		orcid	0	0		string
12	en_US	biography	0	0		string
12	fr_CA	biography	0	0		string
12	en_US	signature	0	0		string
12	fr_CA	signature	0	0		string
12	en_US	affiliation	0	0	Universidad de Chile	string
12	fr_CA	affiliation	0	0		string
12	en_US	givenName	0	0	Sarah	string
12	fr_CA	givenName	0	0		string
12	en_US	familyName	0	0	Vogt	string
12	fr_CA	familyName	0	0		string
12	en_US	preferredPublicName	0	0		string
12	fr_CA	preferredPublicName	0	0		string
12		orcid	0	0		string
13	en_US	biography	0	0		string
13	fr_CA	biography	0	0		string
13	en_US	signature	0	0		string
13	fr_CA	signature	0	0		string
13	en_US	affiliation	0	0	Duke University	string
13	fr_CA	affiliation	0	0		string
13	en_US	givenName	0	0	Graham	string
13	fr_CA	givenName	0	0		string
13	en_US	familyName	0	0	Cox	string
13	fr_CA	familyName	0	0		string
13	en_US	preferredPublicName	0	0		string
13	fr_CA	preferredPublicName	0	0		string
13		orcid	0	0		string
14	en_US	biography	0	0		string
14	fr_CA	biography	0	0		string
14	en_US	signature	0	0		string
14	fr_CA	signature	0	0		string
14	en_US	affiliation	0	0	University of Cape Town	string
14	fr_CA	affiliation	0	0		string
14	en_US	givenName	0	0	Stephen	string
14	fr_CA	givenName	0	0		string
14	en_US	familyName	0	0	Hellier	string
14	fr_CA	familyName	0	0		string
14	en_US	preferredPublicName	0	0		string
14	fr_CA	preferredPublicName	0	0		string
14		orcid	0	0		string
15	en_US	biography	0	0		string
15	fr_CA	biography	0	0		string
15	en_US	signature	0	0		string
15	fr_CA	signature	0	0		string
15	en_US	affiliation	0	0	Imperial College London	string
15	fr_CA	affiliation	0	0		string
15	en_US	givenName	0	0	Catherine	string
15	fr_CA	givenName	0	0		string
15	en_US	familyName	0	0	Turner	string
15	fr_CA	familyName	0	0		string
15	en_US	preferredPublicName	0	0		string
15	fr_CA	preferredPublicName	0	0		string
15		orcid	0	0		string
16	en_US	biography	0	0		string
16	fr_CA	biography	0	0		string
16	en_US	signature	0	0		string
16	fr_CA	signature	0	0		string
16	en_US	affiliation	0	0	National University of Singapore	string
16	fr_CA	affiliation	0	0		string
16	en_US	givenName	0	0	Sabine	string
16	fr_CA	givenName	0	0		string
16	en_US	familyName	0	0	Kumar	string
16	fr_CA	familyName	0	0		string
9	en_US	givenName	0	0	Aisla	string
9	fr_CA	givenName	0	0		string
9	en_US	familyName	0	0	McCrae	string
9	fr_CA	familyName	0	0		string
9	en_US	preferredPublicName	0	0		string
9	fr_CA	preferredPublicName	0	0		string
9		orcid	0	0		string
10	en_US	biography	0	0		string
10	fr_CA	biography	0	0		string
10	en_US	signature	0	0		string
10	fr_CA	signature	0	0		string
10	fr_CA	affiliation	0	0		string
10	en_US	givenName	0	0	Adela	string
10	fr_CA	givenName	0	0		string
10	en_US	familyName	0	0	Gallego	string
10	fr_CA	familyName	0	0		string
10	en_US	preferredPublicName	0	0		string
10	fr_CA	preferredPublicName	0	0		string
10		orcid	0	0		string
9	fr_CA	affiliation	0	0		string
16	en_US	preferredPublicName	0	0		string
16	fr_CA	preferredPublicName	0	0		string
16		orcid	0	0		string
2	en_US	biography	0	0		string
2	en_US	affiliation	0	0	Universidad Nacional Autónoma de México	string
27	en_US	affiliation	0	0	Stanford University	string
27	en_US	givenName	0	0	Karim	string
27	en_US	familyName	0	0	Al-Khafaji	string
17	en_US	affiliation	0	0	University of Cape Town	string
17	en_US	givenName	0	0	Alan	string
17	en_US	familyName	0	0	Mwandenga	string
18	en_US	affiliation	0	0	University of Bologna	string
18	en_US	givenName	0	0	Carlo	string
18	en_US	familyName	0	0	Corino	string
19	en_US	affiliation	0	0	University of Windsor	string
19	en_US	givenName	0	0	Catherine	string
19	en_US	familyName	0	0	Kwantes	string
20	en_US	affiliation	0	0	University of Alberta	string
20	en_US	givenName	0	0	Craig	string
20	en_US	familyName	0	0	Montgomerie	string
21	en_US	affiliation	0	0	Alexandria University	string
21	en_US	givenName	0	0	Diaga	string
21	en_US	familyName	0	0	Diouf	string
22	en_US	affiliation	0	0	University of Toronto	string
22	en_US	givenName	0	0	Dana	string
22	en_US	familyName	0	0	Phillips	string
23	en_US	affiliation	0	0	University College Cork	string
23	en_US	givenName	0	0	Domatilia	string
23	en_US	familyName	0	0	Sokoloff	string
8	en_US	affiliation	0	0	McGill University	string
24	en_US	affiliation	0	0	Indiana University	string
24	en_US	givenName	0	0	Elinor	string
24	en_US	familyName	0	0	Ostrom	string
25	en_US	affiliation	0	0	University of Rome	string
25	en_US	givenName	0	0	Fabio	string
25	en_US	familyName	0	0	Paglieri	string
26	en_US	affiliation	0	0	Aalborg University	string
26	en_US	givenName	0	0	John	string
26	en_US	familyName	0	0	Novak	string
28	en_US	affiliation	0	0	Australian National University	string
28	en_US	givenName	0	0	Leo	string
28	en_US	familyName	0	0	Christopher	string
29	en_US	affiliation	0	0	University of Cape Town	string
29	en_US	givenName	0	0	Lise	string
29	en_US	familyName	0	0	Kumiega	string
9	en_US	affiliation	0	0	University of Manitoba	string
10	en_US	affiliation	0	0	State University of New York	string
30	en_US	affiliation	0	0	University of Wolverhampton	string
30	en_US	givenName	0	0	Patricia	string
30	en_US	familyName	0	0	Daniel	string
31	en_US	affiliation	0	0	University of Nairobi	string
31	en_US	givenName	0	0	Rana	string
31	en_US	familyName	0	0	Baiyewu	string
34	en_US	affiliation	0	0	University of Windsor	string
32	en_US	affiliation	0	0	Barcelona University	string
32	en_US	givenName	0	0	Rosanna	string
32	en_US	familyName	0	0	Rossi	string
33	en_US	affiliation	0	0	University of Tehran	string
33	en_US	givenName	0	0	Vajiheh	string
33	en_US	familyName	0	0	Karbasizaed	string
34	en_US	givenName	0	0	Valerie	string
34	en_US	familyName	0	0	Williamson	string
35	en_US	affiliation	0	0	CUNY	string
35	en_US	givenName	0	0	Zita	string
35	en_US	familyName	0	0	Woods	string
3	en_US	affiliation	0	0	University of Melbourne	string
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.user_user_groups (user_group_id, user_id) FROM stdin;
1	1
2	1
2	2
3	3
5	4
5	5
5	6
16	7
16	8
16	9
16	10
7	11
7	12
11	13
11	14
13	15
13	16
17	17
14	17
17	18
14	18
17	19
14	19
17	20
14	20
17	21
14	21
17	22
14	22
17	23
14	23
17	24
14	24
17	25
14	25
17	26
14	26
17	27
14	27
17	28
14	28
17	29
14	29
17	30
14	30
17	31
14	31
17	32
14	32
17	33
14	33
17	34
14	34
17	35
14	35
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.users (user_id, username, password, email, url, phone, mailing_address, billing_address, country, locales, gossip, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help) FROM stdin;
6	minoue	$2y$10$i.TtFhiXEQj2VljNE8SoDusmqC/IwhSc34TzzHAo75M./Mfpm6hgm	minoue@mailinator.com				\N	JP		\N	\N	2023-02-28 21:53:27	\N	2023-02-28 21:58:21	0	0	\N	0	\N	1
26	jnovak	$2y$10$TkV.074LCLnht6I1K/jbGebWGfK0BC/PV13TPREZeGEC98iTMXNui	jnovak@mailinator.com	\N	\N	\N	\N	DK		\N	\N	2023-02-28 22:02:35	\N	2023-02-28 22:02:35	0	\N	\N	0	\N	1
19	ckwantes	$2y$10$9t4VzRhSc5CfMx5Q21xZSOsZoAUH2Q9iXv5qv8ukrAjpoj24xFknS	ckwantes@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-02-28 21:58:35	\N	2023-02-28 21:58:35	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$XSFb6MM3MuHMQLwY2QlmjeSIdKof8.pFdVNeUJij12spYqZe6Bhja	dbuskins@mailinator.com				\N	US		\N	\N	2023-02-28 21:53:14	\N	2023-02-28 21:53:14	0	0	\N	0	\N	1
5	sberardo	$2y$10$386iB66vn2I0yQRh4gtKTep7OKWy5gf4UTa2OSPSD9X4vPqge.2RO	sberardo@mailinator.com				\N	CA		\N	\N	2023-02-28 21:53:20	\N	2023-02-28 21:53:20	0	0	\N	0	\N	1
11	mfritz	$2y$10$nCxQ75KYj6fxdwAXEaP9G.quxHxsl84etETOV/C88ceMfx8vdcJQi	mfritz@mailinator.com				\N	BE		\N	\N	2023-02-28 21:54:10	\N	2023-02-28 21:54:10	0	0	\N	0	\N	1
12	svogt	$2y$10$aLMpqT7Q7x0IYVxspDu7eepdyyLXO42jOQHxHBZszyrQwDzj.UE86	svogt@mailinator.com				\N	CL		\N	\N	2023-02-28 21:54:19	\N	2023-02-28 21:54:19	0	0	\N	0	\N	1
13	gcox	$2y$10$Fnx3cvehtEM0.6d87fZHuOKcKi/Q58kzPhpgCnNYvmMi1rvT6b3Yu	gcox@mailinator.com				\N	US		\N	\N	2023-02-28 21:54:28	\N	2023-02-28 21:54:28	0	0	\N	0	\N	1
14	shellier	$2y$10$CPt2Ru0n32eqrzF27BamPOM7qYrmQ1GXpFWddZU77uMv1sWMV69.q	shellier@mailinator.com				\N	ZA		\N	\N	2023-02-28 21:54:38	\N	2023-02-28 21:54:38	0	0	\N	0	\N	1
15	cturner	$2y$10$cnikAUlk/DNYXt/lZUKCQOzPuGsqy4oqeWxndEdyNDNq57hW2wldq	cturner@mailinator.com				\N	GB		\N	\N	2023-02-28 21:54:48	\N	2023-02-28 21:54:48	0	0	\N	0	\N	1
16	skumar	$2y$10$Dv6NE3vbgL3vD1HUdDitbuT254q.ejn7IjOIipPmX0EX69NzYRSuG	skumar@mailinator.com				\N	SG		\N	\N	2023-02-28 21:54:59	\N	2023-02-28 21:54:59	0	0	\N	0	\N	1
2	rvaca	$2y$10$ZSsHx8jm49QEvV7kV8J5oOiaBswctjOowU675rP79wkOD6DUD.CKu	rvaca@mailinator.com				\N	MX		\N	\N	2023-02-28 21:53:03	\N	2023-02-28 21:55:07	0	0	\N	0	\N	1
20	cmontgomerie	$2y$10$JBoK8XMXgv/cli3NiReneuokR9Emu2di9OOHrXZVM0WmQ/RbIb9Re	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-02-28 21:59:10	\N	2023-02-28 21:59:10	0	\N	\N	0	\N	1
1	admin	$2y$10$oBtbHe6M0D04bQXOziezOOxGXUqTBYodNIdBGQopb9KVcbq9atqDm	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	\N	2023-02-28 21:52:10	\N	2023-02-28 21:55:19	0	\N	\N	0	\N	1
21	ddiouf	$2y$10$3AmcJd4eOfOLFT59ZyGq0.jqARQNLLc07fHmjURt4.lEJnhuq8J3e	ddiouf@mailinator.com	\N	\N	\N	\N	EG		\N	\N	2023-02-28 21:59:24	\N	2023-02-28 21:59:24	0	\N	\N	0	\N	1
22	dphillips	$2y$10$6kDOHna06fIFYwZD3tvXKeEWq4Ugf3whjK4NypAcTBaA88F7uQIDy	dphillips@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-02-28 22:00:09	\N	2023-02-28 22:00:09	0	\N	\N	0	\N	1
17	amwandenga	$2y$10$UT9uP2Dk8p1Z.AW6idYL3OzaP.oVCD0f/euU8BdlAayGKE21eFPbm	amwandenga@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2023-02-28 21:55:31	\N	2023-02-28 21:56:48	0	\N	\N	0	\N	1
30	pdaniel	$2y$10$Cd4g2y37Yg2fKiv5931nk.QQWSMaeGYZrnNu..KMHx1o8NqeriH/G	pdaniel@mailinator.com	\N	\N	\N	\N	GB		\N	\N	2023-02-28 22:05:10	\N	2023-02-28 22:05:10	0	\N	\N	0	\N	1
23	dsokoloff	$2y$10$NX4tVzBuBNBCZXay5KA8Zu2/VVI6CPR3u8zxIlRyktlPeK0eWagOa	dsokoloff@mailinator.com	\N	\N	\N	\N	IE		\N	\N	2023-02-28 22:00:50	\N	2023-02-28 22:00:51	0	\N	\N	0	\N	1
8	phudson	$2y$10$B8S.Ljb3KU9Rk9geipg.i.g.cZpBnnHeJcX.7Eqi3ro2Q/h8Jps/.	phudson@mailinator.com				\N	CA		\N	\N	2023-02-28 21:53:43	\N	2023-02-28 22:01:18	0	0	\N	0	\N	1
27	kalkhafaji	$2y$10$QdpyRp5BIEKFzQqQUjXk8u28wBz9/ihFHCxzkdnksOL8DbqGJOErG	kalkhafaji@mailinator.com	\N	\N	\N	\N	US		\N	\N	2023-02-28 22:03:20	\N	2023-02-28 22:03:20	0	\N	\N	0	\N	1
18	ccorino	$2y$10$.OhYn6KOeMgCauFa4h0c0ej7M8l5TdDfjMz23ZnEe9mP9El1xpBaq	ccorino@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2023-02-28 21:58:00	\N	2023-02-28 21:58:00	0	\N	\N	0	\N	1
24	eostrom	$2y$10$V.yoL2xSnDDgZuBPU7Kw0uYHYEaNZriWnPwzLHaDug3lqilcObDSO	eostrom@mailinator.com	\N	\N	\N	\N	US		\N	\N	2023-02-28 22:01:31	\N	2023-02-28 22:01:31	0	\N	\N	0	\N	1
25	fpaglieri	$2y$10$ZDgVvW5/5Wg1aOm5iGFhkuasPfixy2Zsj.h2Veo1/ggTV.8E3nFSO	fpaglieri@mailinator.com	\N	\N	\N	\N	IT		\N	\N	2023-02-28 22:01:45	\N	2023-02-28 22:01:45	0	\N	\N	0	\N	1
28	lchristopher	$2y$10$oAyT5xLLQKF8TzZ4yHiTRenQ.87XtE/pGPnDGKmNlu3xaVdANENWy	lchristopher@mailinator.com	\N	\N	\N	\N	AU		\N	\N	2023-02-28 22:03:34	\N	2023-02-28 22:03:34	0	\N	\N	0	\N	1
31	rbaiyewu	$2y$10$VXPWnebtjOl1rXqDlh4v6.EKzKIcxiFnIcz7L9lt1G3YDkmq.Ct.y	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE		\N	\N	2023-02-28 22:05:21	\N	2023-02-28 22:05:21	0	\N	\N	0	\N	1
29	lkumiega	$2y$10$b8l8w63vrgL6aj1kyqufiOjaIayFlkuTJ5uF5jgNyvFnpZHgONOEa	lkumiega@mailinator.com	\N	\N	\N	\N	ZA		\N	\N	2023-02-28 22:04:02	\N	2023-02-28 22:04:02	0	\N	\N	0	\N	1
35	zwoods	$2y$10$k.mY1b1haN5aA4RNKCFxMudUaOO3Wcq1E/yNPcW3zu31045BrGT7e	zwoods@mailinator.com	\N	\N	\N	\N	US		\N	\N	2023-02-28 22:08:28	\N	2023-02-28 22:08:28	0	\N	\N	0	\N	1
7	jjanssen	$2y$10$VhOpKWc8VZV2n06VGDNecew3vPyC.wqdAFuJ6K7JYAqPPmBpkgNNe	jjanssen@mailinator.com				\N	NL		\N	\N	2023-02-28 21:53:35	\N	2023-02-28 22:04:32	0	0	\N	0	\N	1
9	amccrae	$2y$10$GQIIvcTdJybvEGZbG7ZZkunBsU4dhZT8Kh0ddfJuOcmA0eT3q8a6K	amccrae@mailinator.com				\N	CA		\N	\N	2023-02-28 21:53:54	\N	2023-02-28 22:04:39	0	0	\N	0	\N	1
10	agallego	$2y$10$SPNt5871iK76q8W54P8EDerTl8rhrIhVMOvjRaENhPccZlvQf8C5e	agallego@mailinator.com				\N	US		\N	\N	2023-02-28 21:54:02	\N	2023-02-28 22:04:47	0	0	\N	0	\N	1
3	dbarnes	$2y$10$vUn/W78BuWL9.L2gDBSKQ.9RqGbTzQvan6LIQJbxzL5.NOtw8J3d.	dbarnes@mailinator.com				\N	AU		\N	\N	2023-02-28 21:53:08	\N	2023-02-28 22:08:35	0	0	\N	0	\N	1
32	rrossi	$2y$10$EK00YoS0pblz2yFPMeGq5OYELoawirtQfHz77LXF08BE56sl7Vbbm	rrossi@mailinator.com	\N	\N	\N	\N	ES		\N	\N	2023-02-28 22:06:04	\N	2023-02-28 22:06:04	0	\N	\N	0	\N	1
33	vkarbasizaed	$2y$10$SWs63BkjItapfnBdWk.iiO79V0q7eIWtFlSlfEESjDEO87vBUEjHS	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR		\N	\N	2023-02-28 22:06:16	\N	2023-02-28 22:06:16	0	\N	\N	0	\N	1
34	vwilliamson	$2y$10$u8F7AXoVjs8vJzAHxJH8t.S0DubWWPgZCSrHg6g9tMC2TG2PMoKqC	vwilliamson@mailinator.com	\N	\N	\N	\N	CA		\N	\N	2023-02-28 22:08:07	\N	2023-02-28 22:08:07	0	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2023-02-28 21:52:10	1	plugins.metadata	dc11		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.auth	ldap		0	0
1	0	1	0	2023-02-28 21:52:10	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.blocks	makeSubmission	MakeSubmissionBlockPlugin	1	0
1	1	0	0	2023-02-28 21:52:10	1	plugins.blocks	subscription	SubscriptionBlockPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.blocks	information	InformationBlockPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.gateways	resolver		0	0
1	1	3	4	2023-02-28 21:52:10	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	usageEvent		0	0
1	1	0	0	2023-02-28 21:52:10	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	2	0	0	2023-02-28 21:52:10	1	plugins.generic	acron	AcronPlugin	1	1
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	dublinCoreMeta	DublinCoreMetaPlugin	1	0
1	0	1	0	2023-02-28 21:52:10	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	1	0	2023-02-28 21:52:10	1	plugins.generic	lensGalley	LensGalleyPlugin	1	0
1	2	0	0	2023-02-28 21:52:10	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	recommendByAuthor	RecommendByAuthorPlugin	1	1
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	recommendBySimilarity	RecommendBySimilarityPlugin	1	1
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	driver	DRIVERPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	2	0	0	2023-02-28 21:52:10	1	plugins.generic	staticPages	StaticPagesPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	announcementFeed	AnnouncementFeedPlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
0	1	0	0	2023-02-28 21:52:10	1	plugins.generic	citationStyleLanguage	CitationStyleLanguagePlugin	1	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.generic	htmlArticleGalley	HtmlArticleGalleyPlugin	1	0
1	1	0	0	2023-02-28 21:52:10	1	plugins.importexport	doaj		0	0
2	0	0	0	2023-02-28 21:52:10	1	plugins.importexport	datacite		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.importexport	users		0	0
2	1	0	0	2023-02-28 21:52:10	1	plugins.importexport	crossref		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.importexport	native		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.importexport	pubmed		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.oaiMetadataFormats	rfc1807		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.oaiMetadataFormats	marcxml		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.oaiMetadataFormats	marc		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2023-02-28 21:52:10	1	plugins.paymethod	manual		0	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.paymethod	paypal		0	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.pubIds	urn	URNPubIdPlugin	1	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.reports	articles		0	0
2	0	0	0	2023-02-28 21:52:11	1	plugins.reports	reviewReport		0	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.reports	subscriptions		0	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.reports	views		0	0
1	0	0	0	2023-02-28 21:52:11	1	plugins.themes	default	DefaultThemePlugin	1	0
3	3	0	14	2023-02-28 21:52:10	1	core	ojs2		0	1
1	1	0	0	2023-02-28 21:52:11	1	plugins.reports	counterReport		0	0
\.


--
-- Name: access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_pkey UNIQUE (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_pkey UNIQUE (type_id, locale, setting_name);


--
-- Name: announcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (type_id);


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcement_id);


--
-- Name: auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (auth_id);


--
-- Name: author_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_pkey UNIQUE (author_id, locale, setting_name);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: c_v_e_s_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_pkey UNIQUE (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: category_path; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_path UNIQUE (context_id, path);


--
-- Name: category_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_pkey UNIQUE (category_id, locale, setting_name);


--
-- Name: citation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_pkey UNIQUE (citation_id, locale, setting_name);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: citations_publication_seq; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication_seq UNIQUE (publication_id, seq);


--
-- Name: completed_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.completed_payments
    ADD CONSTRAINT completed_payments_pkey PRIMARY KEY (completed_payment_id);


--
-- Name: controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocab_symbolic; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocab_symbolic UNIQUE (symbolic, assoc_type, assoc_id);


--
-- Name: controlled_vocabs_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocabs_pkey PRIMARY KEY (controlled_vocab_id);


--
-- Name: custom_issue_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.custom_issue_orders
    ADD CONSTRAINT custom_issue_orders_pkey UNIQUE (issue_id);


--
-- Name: custom_section_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.custom_section_orders
    ADD CONSTRAINT custom_section_orders_pkey UNIQUE (issue_id, section_id);


--
-- Name: data_object_tombstone_oai_set_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_pkey PRIMARY KEY (object_id);


--
-- Name: data_object_tombstone_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_pkey UNIQUE (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: edit_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_pkey PRIMARY KEY (edit_decision_id);


--
-- Name: email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_log
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (log_id);


--
-- Name: email_log_user_id; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_user_id UNIQUE (email_log_id, user_id);


--
-- Name: email_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_settings_pkey UNIQUE (email_id, locale, setting_name);


--
-- Name: email_templates_default_data_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_pkey UNIQUE (email_key, locale);


--
-- Name: email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates_email_key; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_email_key UNIQUE (email_key, context_id);


--
-- Name: email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (email_id);


--
-- Name: event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: event_log_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_pkey UNIQUE (log_id, setting_name);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- Name: filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filter_groups_symbolic; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_symbolic UNIQUE (symbolic);


--
-- Name: filter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_pkey UNIQUE (filter_id, locale, setting_name);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genre_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_pkey UNIQUE (genre_id, locale, setting_name);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: institutional_subscription_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.institutional_subscription_ip
    ADD CONSTRAINT institutional_subscription_ip_pkey PRIMARY KEY (institutional_subscription_ip_id);


--
-- Name: institutional_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.institutional_subscriptions
    ADD CONSTRAINT institutional_subscriptions_pkey PRIMARY KEY (institutional_subscription_id);


--
-- Name: issue_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issue_files
    ADD CONSTRAINT issue_files_pkey PRIMARY KEY (file_id);


--
-- Name: issue_galley_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issue_galley_settings
    ADD CONSTRAINT issue_galley_settings_pkey UNIQUE (galley_id, locale, setting_name);


--
-- Name: issue_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issue_galleys
    ADD CONSTRAINT issue_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: issue_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issue_settings
    ADD CONSTRAINT issue_settings_pkey UNIQUE (issue_id, locale, setting_name);


--
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (issue_id);


--
-- Name: item_views_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_pkey UNIQUE (assoc_type, assoc_id, user_id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: journal_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.journal_settings
    ADD CONSTRAINT journal_settings_pkey UNIQUE (journal_id, locale, setting_name);


--
-- Name: journals_path; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_path UNIQUE (path);


--
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (journal_id);


--
-- Name: library_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_pkey UNIQUE (file_id, locale, setting_name);


--
-- Name: library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: metadata_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.metadata_descriptions
    ADD CONSTRAINT metadata_descriptions_pkey PRIMARY KEY (metadata_description_id);


--
-- Name: metadata_descripton_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.metadata_description_settings
    ADD CONSTRAINT metadata_descripton_settings_pkey UNIQUE (metadata_description_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_pkey UNIQUE (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_pkey UNIQUE (navigation_menu_item_id, locale, setting_name);


--
-- Name: navigation_menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_pkey PRIMARY KEY (navigation_menu_item_id);


--
-- Name: navigation_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.navigation_menus
    ADD CONSTRAINT navigation_menus_pkey PRIMARY KEY (navigation_menu_id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list_email_context; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_email_context UNIQUE (email, context);


--
-- Name: notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey UNIQUE (notification_id, locale, setting_name);


--
-- Name: notification_subscription_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_pkey PRIMARY KEY (setting_id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: oai_resumption_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens
    ADD CONSTRAINT oai_resumption_tokens_pkey UNIQUE (token);


--
-- Name: plugin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_pkey UNIQUE (plugin_name, context_id, setting_name);


--
-- Name: publication_categories_id; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_id UNIQUE (publication_id, category_id);


--
-- Name: publication_galley_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publication_galley_settings
    ADD CONSTRAINT publication_galley_settings_pkey UNIQUE (galley_id, locale, setting_name);


--
-- Name: publication_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: publication_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_pkey UNIQUE (publication_id, locale, setting_name);


--
-- Name: publications_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (publication_id);


--
-- Name: queries_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (query_id);


--
-- Name: query_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_pkey UNIQUE (query_id, user_id);


--
-- Name: queued_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.queued_payments
    ADD CONSTRAINT queued_payments_pkey PRIMARY KEY (queued_payment_id);


--
-- Name: review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_pkey UNIQUE (review_id, submission_file_id);


--
-- Name: review_form_element_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_pkey UNIQUE (review_form_element_id, locale, setting_name);


--
-- Name: review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_form_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_pkey UNIQUE (review_form_id, locale, setting_name);


--
-- Name: review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_round_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_pkey UNIQUE (submission_id, review_round_id, submission_file_id);


--
-- Name: review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: review_rounds_submission_id_stage_id_round_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_submission_id_stage_id_round_pkey UNIQUE (submission_id, stage_id, round);


--
-- Name: scheduled_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.scheduled_tasks
    ADD CONSTRAINT scheduled_tasks_pkey UNIQUE (class_name);


--
-- Name: section_editors_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_pkey UNIQUE (context_id, assoc_id, assoc_type, user_id);


--
-- Name: section_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.section_settings
    ADD CONSTRAINT section_settings_pkey UNIQUE (section_id, locale, setting_name);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey UNIQUE (session_id);


--
-- Name: site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey UNIQUE (setting_name, locale);


--
-- Name: stage_assignment; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignment UNIQUE (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: static_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.static_page_settings
    ADD CONSTRAINT static_page_settings_pkey UNIQUE (static_page_id, locale, setting_name);


--
-- Name: static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (static_page_id);


--
-- Name: submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_file_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_pkey PRIMARY KEY (revision_id);


--
-- Name: submission_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_pkey UNIQUE (submission_file_id, locale, setting_name);


--
-- Name: submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (submission_file_id);


--
-- Name: submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_keyword_text; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_text UNIQUE (keyword_text);


--
-- Name: submission_search_object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_pkey UNIQUE (object_id, pos);


--
-- Name: submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_pkey UNIQUE (submission_id, locale, setting_name);


--
-- Name: submission_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_tombstones
    ADD CONSTRAINT submission_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (submission_id);


--
-- Name: subscription_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.subscription_type_settings
    ADD CONSTRAINT subscription_type_settings_pkey UNIQUE (type_id, locale, setting_name);


--
-- Name: subscription_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.subscription_types
    ADD CONSTRAINT subscription_types_pkey PRIMARY KEY (type_id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- Name: temporary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_pkey PRIMARY KEY (file_id);


--
-- Name: u_e_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT u_e_pkey UNIQUE (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_pkey UNIQUE (user_group_id, locale, setting_name);


--
-- Name: user_group_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_pkey UNIQUE (context_id, user_group_id, stage_id);


--
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey UNIQUE (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey UNIQUE (user_group_id, user_id);


--
-- Name: users_email; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_username; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey UNIQUE (product_type, product, major, minor, revision, build);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX access_keys_hash ON public.access_keys USING btree (key_hash, user_id, context);


--
-- Name: announcement_settings_announcement_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX announcement_settings_announcement_id ON public.announcement_settings USING btree (announcement_id);


--
-- Name: announcement_type_settings_type_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX announcement_type_settings_type_id ON public.announcement_type_settings USING btree (type_id);


--
-- Name: announcement_types_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX announcement_types_assoc ON public.announcement_types USING btree (assoc_type, assoc_id);


--
-- Name: announcements_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX announcements_assoc ON public.announcements USING btree (assoc_type, assoc_id);


--
-- Name: assignment_settings_navigation_menu_item_assignment_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX assignment_settings_navigation_menu_item_assignment_id ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id);


--
-- Name: author_settings_author_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX author_settings_author_id ON public.author_settings USING btree (author_id);


--
-- Name: authors_publication_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX authors_publication_id ON public.authors USING btree (publication_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id, parent_id);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX citation_settings_citation_id ON public.citation_settings USING btree (citation_id);


--
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: controlled_vocab_entries_cv_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX controlled_vocab_entries_cv_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id, seq);


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX data_object_tombstone_oai_set_objects_tombstone_id ON public.data_object_tombstone_oai_set_objects USING btree (tombstone_id);


--
-- Name: data_object_tombstone_settings_tombstone_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX data_object_tombstone_settings_tombstone_id ON public.data_object_tombstone_settings USING btree (tombstone_id);


--
-- Name: data_object_tombstones_data_object_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX data_object_tombstones_data_object_id ON public.data_object_tombstones USING btree (data_object_id);


--
-- Name: edit_decisions_editor_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX edit_decisions_editor_id ON public.edit_decisions USING btree (editor_id);


--
-- Name: edit_decisions_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX edit_decisions_submission_id ON public.edit_decisions USING btree (submission_id);


--
-- Name: email_log_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX email_log_assoc ON public.email_log USING btree (assoc_type, assoc_id);


--
-- Name: email_settings_email_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX email_settings_email_id ON public.email_templates_settings USING btree (email_id);


--
-- Name: email_templates_default_email_key; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX email_templates_default_email_key ON public.email_templates_default USING btree (email_key);


--
-- Name: event_log_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX event_log_assoc ON public.event_log USING btree (assoc_type, assoc_id);


--
-- Name: event_log_settings_log_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX event_log_settings_log_id ON public.event_log_settings USING btree (log_id);


--
-- Name: event_log_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX event_log_settings_name_value ON public.event_log_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['fileId'::character varying, 'submissionId'::character varying])::text[]));


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX genre_settings_genre_id ON public.genre_settings USING btree (genre_id);


--
-- Name: institutional_subscription_ip_end; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX institutional_subscription_ip_end ON public.institutional_subscription_ip USING btree (ip_end);


--
-- Name: institutional_subscription_ip_start; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX institutional_subscription_ip_start ON public.institutional_subscription_ip USING btree (ip_start);


--
-- Name: institutional_subscription_ip_subscription_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX institutional_subscription_ip_subscription_id ON public.institutional_subscription_ip USING btree (subscription_id);


--
-- Name: institutional_subscriptions_domain; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX institutional_subscriptions_domain ON public.institutional_subscriptions USING btree (domain);


--
-- Name: institutional_subscriptions_subscription_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX institutional_subscriptions_subscription_id ON public.institutional_subscriptions USING btree (subscription_id);


--
-- Name: issue_files_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issue_files_issue_id ON public.issue_files USING btree (issue_id);


--
-- Name: issue_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issue_galley_settings_galley_id ON public.issue_galley_settings USING btree (galley_id);


--
-- Name: issue_galleys_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issue_galleys_issue_id ON public.issue_galleys USING btree (issue_id);


--
-- Name: issue_galleys_url_path; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issue_galleys_url_path ON public.issue_galleys USING btree (url_path);


--
-- Name: issue_settings_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issue_settings_issue_id ON public.issue_settings USING btree (issue_id);


--
-- Name: issue_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issue_settings_name_value ON public.issue_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying])::text[]));


--
-- Name: issues_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issues_journal_id ON public.issues USING btree (journal_id);


--
-- Name: issues_url_path; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX issues_url_path ON public.issues USING btree (url_path);


--
-- Name: jobs_queue_reserved_at_index; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX jobs_queue_reserved_at_index ON public.jobs USING btree (queue, reserved_at);


--
-- Name: journal_settings_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX journal_settings_journal_id ON public.journal_settings USING btree (journal_id);


--
-- Name: library_file_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX library_file_settings_id ON public.library_file_settings USING btree (file_id);


--
-- Name: library_files_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX library_files_context_id ON public.library_files USING btree (context_id);


--
-- Name: library_files_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX library_files_submission_id ON public.library_files USING btree (submission_id);


--
-- Name: metadata_description_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX metadata_description_settings_id ON public.metadata_description_settings USING btree (metadata_description_id);


--
-- Name: metadata_descriptions_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX metadata_descriptions_assoc ON public.metadata_descriptions USING btree (assoc_type, assoc_id);


--
-- Name: metrics_load_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX metrics_load_id ON public.metrics USING btree (load_id);


--
-- Name: metrics_metric_type_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX metrics_metric_type_context_id ON public.metrics USING btree (metric_type, context_id);


--
-- Name: metrics_metric_type_submission_id_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX metrics_metric_type_submission_id_assoc ON public.metrics USING btree (metric_type, context_id, assoc_type, assoc_id);


--
-- Name: metrics_metric_type_submission_id_assoc_type; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX metrics_metric_type_submission_id_assoc_type ON public.metrics USING btree (metric_type, submission_id, assoc_type);


--
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


--
-- Name: notifications_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX notifications_assoc ON public.notifications USING btree (assoc_type, assoc_id);


--
-- Name: notifications_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX notifications_context_id ON public.notifications USING btree (context_id, level);


--
-- Name: notifications_context_id_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX notifications_context_id_user_id ON public.notifications USING btree (context_id, user_id, level);


--
-- Name: notifications_user_id_level; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX notifications_user_id_level ON public.notifications USING btree (user_id, level);


--
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX plugin_settings_plugin_name ON public.plugin_settings USING btree (plugin_name);


--
-- Name: publication_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publication_galley_settings_galley_id ON public.publication_galley_settings USING btree (galley_id);


--
-- Name: publication_galley_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publication_galley_settings_name_value ON public.publication_galley_settings USING btree (setting_name, setting_value);


--
-- Name: publication_galleys_publication_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publication_galleys_publication_id ON public.publication_galleys USING btree (publication_id);


--
-- Name: publication_galleys_url_path; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publication_galleys_url_path ON public.publication_galleys USING btree (url_path);


--
-- Name: publication_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publication_settings_name_value ON public.publication_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['indexingState'::character varying, 'medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying, 'pub-id::publisher-id'::character varying])::text[]));


--
-- Name: publication_settings_publication_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publication_settings_publication_id ON public.publication_settings USING btree (publication_id);


--
-- Name: publications_section_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publications_section_id ON public.publications USING btree (section_id);


--
-- Name: publications_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publications_submission_id ON public.publications USING btree (submission_id);


--
-- Name: publications_url_path; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX publications_url_path ON public.publications USING btree (url_path);


--
-- Name: queries_assoc_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX queries_assoc_id ON public.queries USING btree (assoc_type, assoc_id);


--
-- Name: review_assignments_form_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_assignments_form_id ON public.review_assignments USING btree (review_form_id);


--
-- Name: review_assignments_reviewer_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_assignments_reviewer_id ON public.review_assignments USING btree (reviewer_id);


--
-- Name: review_assignments_reviewer_review; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_assignments_reviewer_review ON public.review_assignments USING btree (reviewer_id, review_id);


--
-- Name: review_assignments_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_assignments_submission_id ON public.review_assignments USING btree (submission_id);


--
-- Name: review_files_review_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_files_review_id ON public.review_files USING btree (review_id);


--
-- Name: review_form_element_settings_review_form_element_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_form_element_settings_review_form_element_id ON public.review_form_element_settings USING btree (review_form_element_id);


--
-- Name: review_form_elements_review_form_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_form_elements_review_form_id ON public.review_form_elements USING btree (review_form_id);


--
-- Name: review_form_responses_pkey; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_form_responses_pkey ON public.review_form_responses USING btree (review_form_element_id, review_id);


--
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_form_settings_review_form_id ON public.review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: section_editors_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX section_editors_context_id ON public.subeditor_submission_group USING btree (context_id);


--
-- Name: section_settings_section_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX section_settings_section_id ON public.section_settings USING btree (section_id);


--
-- Name: sections_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX sections_journal_id ON public.sections USING btree (journal_id);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX sessions_user_id ON public.sessions USING btree (user_id);


--
-- Name: stage_assignments_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX stage_assignments_submission_id ON public.stage_assignments USING btree (submission_id);


--
-- Name: stage_assignments_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX stage_assignments_user_group_id ON public.stage_assignments USING btree (user_group_id);


--
-- Name: stage_assignments_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX stage_assignments_user_id ON public.stage_assignments USING btree (user_id);


--
-- Name: static_page_settings_static_page_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX static_page_settings_static_page_id ON public.static_page_settings USING btree (static_page_id);


--
-- Name: subeditor_submission_group_assoc_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX subeditor_submission_group_assoc_id ON public.subeditor_submission_group USING btree (assoc_id, assoc_type);


--
-- Name: subeditor_submission_group_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX subeditor_submission_group_user_id ON public.subeditor_submission_group USING btree (user_id);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_comments_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: submission_file_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_file_settings_id ON public.submission_file_settings USING btree (submission_file_id);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_submission; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_search_object_submission ON public.submission_search_objects USING btree (submission_id);


--
-- Name: submission_settings_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_settings_submission_id ON public.submission_settings USING btree (submission_id);


--
-- Name: submission_tombstones_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_tombstones_journal_id ON public.submission_tombstones USING btree (journal_id);


--
-- Name: submission_tombstones_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submission_tombstones_submission_id ON public.submission_tombstones USING btree (submission_id);


--
-- Name: submissions_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submissions_context_id ON public.submissions USING btree (context_id);


--
-- Name: submissions_publication_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX submissions_publication_id ON public.submissions USING btree (current_publication_id);


--
-- Name: subscription_type_settings_type_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX subscription_type_settings_type_id ON public.subscription_type_settings USING btree (type_id);


--
-- Name: temporary_files_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX temporary_files_user_id ON public.temporary_files USING btree (user_id);


--
-- Name: user_group_stage_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_group_stage_context_id ON public.user_group_stage USING btree (context_id);


--
-- Name: user_group_stage_stage_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_group_stage_stage_id ON public.user_group_stage USING btree (stage_id);


--
-- Name: user_group_stage_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_group_stage_user_group_id ON public.user_group_stage USING btree (user_group_id);


--
-- Name: user_groups_context_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_groups_context_id ON public.user_groups USING btree (context_id);


--
-- Name: user_groups_role_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_groups_role_id ON public.user_groups USING btree (role_id);


--
-- Name: user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_groups_user_group_id ON public.user_groups USING btree (user_group_id);


--
-- Name: user_settings_locale_setting_name_index; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_settings_locale_setting_name_index ON public.user_settings USING btree (setting_name, locale);


--
-- Name: user_settings_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_settings_user_id ON public.user_settings USING btree (user_id);


--
-- Name: user_user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_user_groups_user_group_id ON public.user_user_groups USING btree (user_group_id);


--
-- Name: user_user_groups_user_id; Type: INDEX; Schema: public; Owner: ojs-ci
--

CREATE INDEX user_user_groups_user_id ON public.user_user_groups USING btree (user_id);


--
-- Name: publication_galleys_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- Name: submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ojs-ci
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

