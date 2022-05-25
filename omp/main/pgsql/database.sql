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
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_doi_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_file_id_foreign;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_source_chapter_id_foreign;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_doi_id_foreign;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_submission_file_id_foreign;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_submission_file_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_submission_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_reviewer_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_review_round_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_review_form_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_doi_id_foreign;
ALTER TABLE ONLY public.publication_formats DROP CONSTRAINT publication_formats_doi_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_publication_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_category_id_foreign;
ALTER TABLE ONLY public.item_views DROP CONSTRAINT item_views_user_id_foreign;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_review_round_id_foreign;
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
DROP INDEX public.review_assignment_reviewer_round;
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
DROP INDEX public.doi_settings_doi_id;
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
    context_id bigint NOT NULL
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


ALTER TABLE public.announcements_announcement_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.authors_author_id_seq OWNER TO "omp-ci";

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
    parent_id bigint,
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
    setting_value text
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


ALTER TABLE public.citations_citation_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.completed_payments_completed_payment_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.controlled_vocabs_controlled_vocab_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.data_object_tombstones_tombstone_id_seq OWNER TO "omp-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.data_object_tombstones_tombstone_id_seq OWNED BY public.data_object_tombstones.tombstone_id;


--
-- Name: doi_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.doi_settings (
    doi_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.doi_settings OWNER TO "omp-ci";

--
-- Name: dois; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.dois (
    doi_id bigint NOT NULL,
    context_id bigint NOT NULL,
    doi character varying(255) NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.dois OWNER TO "omp-ci";

--
-- Name: dois_doi_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.dois_doi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dois_doi_id_seq OWNER TO "omp-ci";

--
-- Name: dois_doi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.dois_doi_id_seq OWNED BY public.dois.doi_id;


--
-- Name: edit_decisions; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.edit_decisions (
    edit_decision_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    review_round_id bigint,
    stage_id bigint,
    round smallint,
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


ALTER TABLE public.edit_decisions_edit_decision_id_seq OWNER TO "omp-ci";

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
-- Name: COLUMN event_log_settings.setting_type; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.event_log_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO "omp-ci";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO "omp-ci";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


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


ALTER TABLE public.files_file_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.genres_genre_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.jobs_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.library_files_file_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.navigation_menu_items_navigation_menu_item_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.notes_note_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.notification_subscription_settings_setting_id_seq OWNER TO "omp-ci";

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
    is_available smallint DEFAULT '0'::smallint NOT NULL,
    doi_id bigint
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
    publication_id bigint NOT NULL,
    date_published date,
    last_modified timestamp(0) without time zone,
    primary_contact_id bigint,
    publication_date_type character varying(32) DEFAULT 'pub'::character varying,
    publication_type character varying(32) DEFAULT 'publication'::character varying,
    seq double precision DEFAULT '0'::double precision NOT NULL,
    series_id bigint,
    series_position character varying(255),
    submission_id bigint NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    url_path character varying(64),
    version bigint,
    doi_id bigint
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


ALTER TABLE public.queued_payments_queued_payment_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.representatives_representative_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.review_rounds_review_round_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.spotlights_spotlight_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.static_pages_static_page_id_seq OWNER TO "omp-ci";

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
    seq double precision DEFAULT '0'::double precision NOT NULL,
    source_chapter_id bigint,
    doi_id bigint
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


ALTER TABLE public.submission_comments_comment_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.submission_file_revisions_revision_id_seq OWNER TO "omp-ci";

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
    assoc_id bigint,
    doi_id bigint
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


ALTER TABLE public.submission_files_submission_file_id_seq OWNER TO "omp-ci";

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


ALTER TABLE public.submissions_submission_id_seq OWNER TO "omp-ci";

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
    setting_value text
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
    date_last_login timestamp(0) without time zone,
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
-- Name: access_key_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('public.access_keys_access_key_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_types ALTER COLUMN type_id SET DEFAULT nextval('public.announcement_types_type_id_seq'::regclass);


--
-- Name: announcement_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcements ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcements_announcement_id_seq'::regclass);


--
-- Name: auth_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN auth_id SET DEFAULT nextval('public.auth_sources_auth_id_seq'::regclass);


--
-- Name: author_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: citation_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations ALTER COLUMN citation_id SET DEFAULT nextval('public.citations_citation_id_seq'::regclass);


--
-- Name: completed_payment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.completed_payments ALTER COLUMN completed_payment_id SET DEFAULT nextval('public.completed_payments_completed_payment_id_seq'::regclass);


--
-- Name: controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('public.controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('public.data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: doi_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.dois ALTER COLUMN doi_id SET DEFAULT nextval('public.dois_doi_id_seq'::regclass);


--
-- Name: edit_decision_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('public.edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log ALTER COLUMN log_id SET DEFAULT nextval('public.email_log_log_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_email_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_default_email_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log ALTER COLUMN log_id SET DEFAULT nextval('public.event_log_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


--
-- Name: filter_group_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('public.filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filter_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filters ALTER COLUMN filter_id SET DEFAULT nextval('public.filters_filter_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: identification_code_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.identification_codes ALTER COLUMN identification_code_id SET DEFAULT nextval('public.identification_codes_identification_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_files ALTER COLUMN file_id SET DEFAULT nextval('public.library_files_file_id_seq'::regclass);


--
-- Name: market_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.markets ALTER COLUMN market_id SET DEFAULT nextval('public.markets_market_id_seq'::regclass);


--
-- Name: metadata_description_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metadata_descriptions ALTER COLUMN metadata_description_id SET DEFAULT nextval('public.metadata_descriptions_metadata_description_id_seq'::regclass);


--
-- Name: navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_item_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_items ALTER COLUMN navigation_menu_item_id SET DEFAULT nextval('public.navigation_menu_items_navigation_menu_item_id_seq'::regclass);


--
-- Name: navigation_menu_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menus ALTER COLUMN navigation_menu_id SET DEFAULT nextval('public.navigation_menus_navigation_menu_id_seq'::regclass);


--
-- Name: note_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Name: notification_mail_list_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list ALTER COLUMN notification_mail_list_id SET DEFAULT nextval('public.notification_mail_list_notification_mail_list_id_seq'::regclass);


--
-- Name: setting_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notification_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: press_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses ALTER COLUMN press_id SET DEFAULT nextval('public.presses_press_id_seq'::regclass);


--
-- Name: publication_date_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_dates ALTER COLUMN publication_date_id SET DEFAULT nextval('public.publication_dates_publication_date_id_seq'::regclass);


--
-- Name: publication_format_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats ALTER COLUMN publication_format_id SET DEFAULT nextval('public.publication_formats_publication_format_id_seq'::regclass);


--
-- Name: publication_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);


--
-- Name: query_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queries ALTER COLUMN query_id SET DEFAULT nextval('public.queries_query_id_seq'::regclass);


--
-- Name: queued_payment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queued_payments ALTER COLUMN queued_payment_id SET DEFAULT nextval('public.queued_payments_queued_payment_id_seq'::regclass);


--
-- Name: representative_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.representatives ALTER COLUMN representative_id SET DEFAULT nextval('public.representatives_representative_id_seq'::regclass);


--
-- Name: review_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments ALTER COLUMN review_id SET DEFAULT nextval('public.review_assignments_review_id_seq'::regclass);


--
-- Name: review_form_element_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('public.review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_form_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('public.review_forms_review_form_id_seq'::regclass);


--
-- Name: review_round_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('public.review_rounds_review_round_id_seq'::regclass);


--
-- Name: sales_rights_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sales_rights ALTER COLUMN sales_rights_id SET DEFAULT nextval('public.sales_rights_sales_rights_id_seq'::regclass);


--
-- Name: series_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series ALTER COLUMN series_id SET DEFAULT nextval('public.series_series_id_seq'::regclass);


--
-- Name: spotlight_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlights ALTER COLUMN spotlight_id SET DEFAULT nextval('public.spotlights_spotlight_id_seq'::regclass);


--
-- Name: stage_assignment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('public.stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: static_page_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_pages ALTER COLUMN static_page_id SET DEFAULT nextval('public.static_pages_static_page_id_seq'::regclass);


--
-- Name: chapter_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters ALTER COLUMN chapter_id SET DEFAULT nextval('public.submission_chapters_chapter_id_seq'::regclass);


--
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.submission_comments_comment_id_seq'::regclass);


--
-- Name: revision_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions ALTER COLUMN revision_id SET DEFAULT nextval('public.submission_file_revisions_revision_id_seq'::regclass);


--
-- Name: submission_file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN submission_file_id SET DEFAULT nextval('public.submission_files_submission_file_id_seq'::regclass);


--
-- Name: keyword_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('public.submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('public.submission_search_objects_object_id_seq'::regclass);


--
-- Name: submission_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submissions ALTER COLUMN submission_id SET DEFAULT nextval('public.submissions_submission_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.temporary_files ALTER COLUMN file_id SET DEFAULT nextval('public.temporary_files_file_id_seq'::regclass);


--
-- Name: user_group_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('public.user_groups_user_group_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.access_keys_access_key_id_seq', 1, false);


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

COPY public.announcement_types (type_id, context_id) FROM stdin;
\.


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.announcement_types_type_id_seq', 1, false);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.announcements_announcement_id_seq', 1, false);


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.auth_sources (auth_id, title, plugin, auth_default, settings) FROM stdin;
\.


--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.auth_sources_auth_id_seq', 1, false);


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
24	fr_CA	affiliation	
24	en_US	affiliation	University of Alberta
24	fr_CA	biography	
24	en_US	biography	
24		country	CA
24	fr_CA	familyName	
24	en_US	familyName	Palmer
24	fr_CA	givenName	
24	en_US	givenName	Stuart
24		orcid	
24	fr_CA	preferredPublicName	
24	en_US	preferredPublicName	
24		url	
25	fr_CA	affiliation	
25	en_US	affiliation	University of Melbourne
25	fr_CA	biography	
25	en_US	biography	
25		country	AU
25	en_US	familyName	Barnes
25	fr_CA	familyName	
25	fr_CA	givenName	
25	en_US	givenName	Daniel
25		orcid	
25		url	
26	en_US	affiliation	University of Sussex
26		country	CA
26	en_US	familyName	Perini
26	en_US	givenName	Fernando
27	fr_CA	affiliation	
27	en_US	affiliation	
27	fr_CA	biography	
27	en_US	biography	
27		country	GB
27	fr_CA	familyName	
27	en_US	familyName	Mansell
27	fr_CA	givenName	
27	en_US	givenName	Robin
27		orcid	
27	fr_CA	preferredPublicName	
27	en_US	preferredPublicName	
27		url	
28	fr_CA	affiliation	
28	en_US	affiliation	
28	fr_CA	biography	
28	en_US	biography	
28		country	AR
28	fr_CA	familyName	
28	en_US	familyName	Galperin
28	fr_CA	givenName	
28	en_US	givenName	Hernan
28		orcid	
28	fr_CA	preferredPublicName	
28	en_US	preferredPublicName	
28		url	
29	fr_CA	affiliation	
29	en_US	affiliation	
29	fr_CA	biography	
29	en_US	biography	
29		country	CL
29	fr_CA	familyName	
29	en_US	familyName	Bello
29	fr_CA	givenName	
29	en_US	givenName	Pablo
29		orcid	
29	fr_CA	preferredPublicName	
29	en_US	preferredPublicName	
29		url	
30	fr_CA	affiliation	
30	en_US	affiliation	
30	fr_CA	biography	
30	en_US	biography	
30		country	AR
30	fr_CA	familyName	
30	en_US	familyName	Rabinovich
30	fr_CA	givenName	
30	en_US	givenName	Eleonora
30		orcid	
30	fr_CA	preferredPublicName	
30	en_US	preferredPublicName	
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
34	fr_CA	affiliation	
34	en_US	affiliation	
34	fr_CA	biography	
34	en_US	biography	
34		country	CA
34	fr_CA	familyName	
34	en_US	familyName	Emdon
34	fr_CA	givenName	
34	en_US	givenName	Heloise
34		orcid	
34	fr_CA	preferredPublicName	
34	en_US	preferredPublicName	
34		url	
35	fr_CA	affiliation	
35	en_US	affiliation	
35	fr_CA	biography	
35	en_US	biography	
35		country	CA
35	fr_CA	familyName	
35	en_US	familyName	Tulus
35	fr_CA	givenName	
35	en_US	givenName	Frank
35		orcid	
35	fr_CA	preferredPublicName	
35	en_US	preferredPublicName	
35		url	
36	fr_CA	affiliation	
36	en_US	affiliation	
36	fr_CA	biography	
36	en_US	biography	
36		country	AR
36	fr_CA	familyName	
36	en_US	familyName	Hyma
36	fr_CA	givenName	
36	en_US	givenName	Raymond
36		orcid	
36	fr_CA	preferredPublicName	
36	en_US	preferredPublicName	
36		url	
37	fr_CA	affiliation	
37	en_US	affiliation	
37	fr_CA	biography	
37	en_US	biography	
37		country	CA
37	fr_CA	familyName	
37	en_US	familyName	Valk
37	fr_CA	givenName	
37	en_US	givenName	John
37		orcid	
37	fr_CA	preferredPublicName	
37	en_US	preferredPublicName	
37		url	
38	en_US	affiliation	
38	fr_CA	biography	
38	en_US	biography	
38		country	CA
38	fr_CA	familyName	
38	en_US	familyName	Fourati
38	en_US	givenName	Khaled
38	fr_CA	affiliation	
38	fr_CA	givenName	
38		orcid	
38	fr_CA	preferredPublicName	
38	en_US	preferredPublicName	
38		url	
39	fr_CA	affiliation	
39	en_US	affiliation	
39	fr_CA	biography	
39	en_US	biography	
39		country	CA
39	fr_CA	familyName	
39	en_US	familyName	de Beer
39	fr_CA	givenName	
39	en_US	givenName	Jeremy
39		orcid	
39	fr_CA	preferredPublicName	
39	en_US	preferredPublicName	
39		url	
40	fr_CA	affiliation	
40	en_US	affiliation	
40	fr_CA	biography	
40	en_US	biography	
40		country	CA
40	fr_CA	familyName	
40	en_US	familyName	Bannerman
40	fr_CA	givenName	
40	en_US	givenName	Sara
40		orcid	
40	fr_CA	preferredPublicName	
40	en_US	preferredPublicName	
40		url	
41	en_US	affiliation	Athabasca University
41		country	CA
41	en_US	familyName	Ally
41	en_US	givenName	Mohamed
42	fr_CA	affiliation	
42	en_US	affiliation	
42	fr_CA	biography	
42	en_US	biography	
42		country	GB
42	fr_CA	familyName	
42	en_US	familyName	Traxler
42	fr_CA	givenName	
42	en_US	givenName	John
42		orcid	
42	fr_CA	preferredPublicName	
42	en_US	preferredPublicName	
42		url	
43	fr_CA	affiliation	
43	en_US	affiliation	
43	fr_CA	biography	
43	en_US	biography	
43		country	CA
43	fr_CA	familyName	
43	en_US	familyName	Koole
43	fr_CA	givenName	
43	en_US	givenName	Marguerite
43		orcid	
43	fr_CA	preferredPublicName	
43	en_US	preferredPublicName	
43		url	
44	fr_CA	affiliation	
44	en_US	affiliation	
44	fr_CA	biography	
44	en_US	biography	
44		country	NO
44	fr_CA	familyName	
44	en_US	familyName	Rekkedal
44	fr_CA	givenName	
44	en_US	givenName	Torstein
44		orcid	
44	fr_CA	preferredPublicName	
44	en_US	preferredPublicName	
44		url	
45	en_US	affiliation	University of Alberta
45		country	CA
45	en_US	familyName	Dawson
45	en_US	givenName	Michael
46	fr_CA	affiliation	
46	en_US	affiliation	Athabasca University
46	fr_CA	biography	
46	en_US	biography	
46		country	CA
46	fr_CA	familyName	
46	en_US	familyName	Dupuis
46	fr_CA	givenName	
46	en_US	givenName	Brian
46		orcid	
46	fr_CA	preferredPublicName	
46	en_US	preferredPublicName	
46		url	
47	fr_CA	affiliation	
47	en_US	affiliation	University of Calgary
47	fr_CA	biography	
47	en_US	biography	
47		country	CA
47	fr_CA	familyName	
47	en_US	familyName	Wilson
47	fr_CA	givenName	
47	en_US	givenName	Michael
47		orcid	
47	fr_CA	preferredPublicName	
47	en_US	preferredPublicName	
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
51	en_US	affiliation	
51	fr_CA	biography	
51	en_US	biography	
51		country	US
51	fr_CA	familyName	
51	en_US	familyName	Benkler
51	fr_CA	givenName	
51	en_US	givenName	Yochai
51		orcid	
51	en_US	preferredPublicName	
51		url	
51	fr_CA	affiliation	
51	fr_CA	preferredPublicName	
52	fr_CA	affiliation	
52	en_US	affiliation	
52	fr_CA	biography	
52	en_US	biography	
52		country	CA
52	fr_CA	familyName	
52	en_US	familyName	Reilly
52	fr_CA	givenName	
52	en_US	givenName	Katherine
52		orcid	
52	fr_CA	preferredPublicName	
52	en_US	preferredPublicName	
52		url	
53	fr_CA	affiliation	
53	en_US	affiliation	
53	fr_CA	biography	
53	en_US	biography	
53		country	US
53	fr_CA	familyName	
53	en_US	familyName	Loudon
53	fr_CA	givenName	
53	en_US	givenName	Melissa
53		orcid	
53	fr_CA	preferredPublicName	
53	en_US	preferredPublicName	
53		url	
54	fr_CA	affiliation	
54	en_US	affiliation	
54	fr_CA	biography	
54	en_US	biography	
54		country	ZA
54	fr_CA	familyName	
54	en_US	familyName	Rivett
54	fr_CA	givenName	
54	en_US	givenName	Ulrike
54		orcid	
54	fr_CA	preferredPublicName	
54	en_US	preferredPublicName	
54		url	
55	fr_CA	affiliation	
55	en_US	affiliation	
55	fr_CA	biography	
55	en_US	biography	
55		country	GB
55	fr_CA	familyName	
55	en_US	familyName	Graham
55	fr_CA	givenName	
55	en_US	givenName	Mark
55		orcid	
55	fr_CA	preferredPublicName	
55	en_US	preferredPublicName	
55		url	
56	fr_CA	affiliation	
56	en_US	affiliation	
56	fr_CA	biography	
56	en_US	biography	
56		country	NO
56	fr_CA	familyName	
56	en_US	familyName	Haarstad
56	fr_CA	givenName	
56	en_US	givenName	Håvard
56		orcid	
56	fr_CA	preferredPublicName	
56	en_US	preferredPublicName	
56		url	
57	fr_CA	affiliation	
57	en_US	affiliation	
57	fr_CA	biography	
57	en_US	biography	
57		country	US
57	fr_CA	familyName	
57	en_US	familyName	Smith
57	fr_CA	givenName	
57	en_US	givenName	Marshall
57		orcid	
57	fr_CA	preferredPublicName	
57	en_US	preferredPublicName	
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
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 57, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.categories (category_id, context_id, parent_id, seq, path, image) FROM stdin;
1	1	\N	2	applied-science	\N
2	1	1	3	comp-sci	\N
3	1	1	4	eng	\N
4	1	\N	5	social-sciences	\N
5	1	4	6	sociology	\N
6	1	4	10000	anthropology	\N
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 6, true);


--
-- Data for Name: category_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.category_settings (category_id, locale, setting_name, setting_value) FROM stdin;
1		sortOption	title-ASC
1	en_US	title	Applied Science
1	fr_CA	title	
1	en_US	description	
1	fr_CA	description	
2		sortOption	title-ASC
2	en_US	title	Computer Science
2	fr_CA	title	
2	en_US	description	
2	fr_CA	description	
3		sortOption	title-ASC
3	en_US	title	Engineering
3	fr_CA	title	
3	en_US	description	
3	fr_CA	description	
4		sortOption	title-ASC
4	en_US	title	Social Sciences
4	fr_CA	title	
4	en_US	description	
4	fr_CA	description	
5		sortOption	title-ASC
5	en_US	title	Sociology
5	fr_CA	title	
5	en_US	description	
5	fr_CA	description	
6		sortOption	title-ASC
6	en_US	title	Anthropology
6	fr_CA	title	
6	en_US	description	
6	fr_CA	description	
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
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.citations_citation_id_seq', 1, false);


--
-- Data for Name: completed_payments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.completed_payments (completed_payment_id, "timestamp", payment_type, context_id, user_id, assoc_id, amount, currency_code_alpha, payment_method_plugin_name) FROM stdin;
\.


--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.completed_payments_completed_payment_id_seq', 1, false);


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
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 26, true);


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
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 86, true);


--
-- Data for Name: data_object_tombstone_oai_set_objects; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.data_object_tombstone_oai_set_objects (object_id, tombstone_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 4, true);


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
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 2, true);


--
-- Data for Name: doi_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.doi_settings (doi_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: dois; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.dois (doi_id, context_id, doi, status) FROM stdin;
\.


--
-- Name: dois_doi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.dois_doi_id_seq', 1, false);


--
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
1	1	\N	1	\N	3	23	2022-05-25 18:44:16
2	1	1	3	1	3	2	2022-05-25 18:44:33
3	2	\N	1	\N	3	23	2022-05-25 18:47:10
4	4	\N	1	\N	3	1	2022-05-25 18:50:23
5	4	3	2	1	3	3	2022-05-25 18:50:44
6	4	4	3	1	3	2	2022-05-25 18:51:07
7	4	\N	4	\N	3	7	2022-05-25 18:51:32
8	5	\N	1	\N	3	1	2022-05-25 18:53:28
9	5	5	2	1	3	3	2022-05-25 18:53:45
10	5	6	3	1	3	2	2022-05-25 18:54:06
11	5	\N	4	\N	3	7	2022-05-25 18:54:27
12	6	\N	1	\N	3	1	2022-05-25 18:56:57
13	6	7	2	1	6	28	2022-05-25 18:57:30
14	7	\N	1	\N	3	23	2022-05-25 19:00:19
15	7	8	3	1	3	2	2022-05-25 19:00:45
16	9	\N	1	\N	3	1	2022-05-25 19:03:35
17	11	\N	1	\N	3	1	2022-05-25 19:05:33
18	11	10	2	1	3	3	2022-05-25 19:05:49
19	11	11	3	1	3	2	2022-05-25 19:07:01
20	12	\N	1	\N	3	1	2022-05-25 19:09:14
21	13	\N	1	\N	3	1	2022-05-25 19:11:40
22	13	13	2	1	3	3	2022-05-25 19:12:01
23	13	14	3	1	3	2	2022-05-25 19:13:38
24	14	\N	1	\N	3	1	2022-05-25 19:15:31
25	14	15	2	1	3	3	2022-05-25 19:15:53
26	14	16	3	1	3	2	2022-05-25 19:16:17
27	14	\N	4	\N	3	7	2022-05-25 19:16:42
28	15	\N	1	\N	3	23	2022-05-25 19:19:30
29	16	\N	1	\N	3	23	2022-05-25 19:20:31
30	17	\N	1	\N	3	1	2022-05-25 19:24:33
\.


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 30, true);


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	3	2022-05-25 18:44:16	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>			Your submission has been sent for review	<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
2	1048585	1	3	2022-05-25 18:44:33	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/1">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
3	1048585	2	3	2022-05-25 18:47:10	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Alvin Finkel" <afinkel@mailinator.com>			Your submission has been sent for review	<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
4	1048585	4	3	2022-05-25 18:50:23	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Your submission has been sent for internal review	<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
5	1048585	4	3	2022-05-25 18:50:44	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Your submission has been sent for review	<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
6	1048585	4	3	2022-05-25 18:51:08	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
7	1048585	4	3	2022-05-25 18:51:32	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Next steps for publishing your submission	<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
8	1048585	5	3	2022-05-25 18:53:28	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Your submission has been sent for internal review	<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
9	1048585	5	3	2022-05-25 18:53:45	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Your submission has been sent for review	<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
10	1048585	5	3	2022-05-25 18:54:06	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
11	1048585	5	3	2022-05-25 18:54:27	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Next steps for publishing your submission	<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
12	1048585	6	3	2022-05-25 18:56:57	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Deborah Bernnard" <dbernnard@mailinator.com>			Your submission has been sent for internal review	<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
13	1048585	7	3	2022-05-25 19:00:19	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>			Your submission has been sent for review	<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
14	1048585	7	3	2022-05-25 19:00:45	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/7">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
15	1048585	9	3	2022-05-25 19:03:35	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Fernando Perini" <fperini@mailinator.com>			Your submission has been sent for internal review	<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
16	1048585	11	3	2022-05-25 19:05:33	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Your submission has been sent for internal review	<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
17	1048585	11	3	2022-05-25 19:05:49	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Your submission has been sent for review	<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
18	1048585	11	10	2022-05-25 19:06:20	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-06-22, if not before.<br />\n<br />\nAdela Gallego
19	1048585	11	12	2022-05-25 19:06:34	1073741829	"Gonzalo Favio" <gfavio@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-06-22, if not before.<br />\n<br />\nGonzalo Favio
20	1048585	11	3	2022-05-25 19:07:01	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
21	1048585	12	3	2022-05-25 19:09:14	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Laurent Elder" <lelder@mailinator.com>			Your submission has been sent for internal review	<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
22	1048585	12	8	2022-05-25 19:10:03	1073741829	"Paul Hudson" <phudson@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-06-22, if not before.<br />\n<br />\nPaul Hudson
23	1048585	13	3	2022-05-25 19:11:40	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Your submission has been sent for internal review	<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
24	1048585	13	3	2022-05-25 19:12:01	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Your submission has been sent for review	<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
25	1048585	13	10	2022-05-25 19:12:48	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-06-22, if not before.<br />\n<br />\nAdela Gallego
26	1048585	13	12	2022-05-25 19:13:05	1073741829	"Gonzalo Favio" <gfavio@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-06-22, if not before.<br />\n<br />\nGonzalo Favio
27	1048585	13	3	2022-05-25 19:13:39	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
28	1048585	14	3	2022-05-25 19:15:31	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Your submission has been sent for internal review	<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
29	1048585	14	3	2022-05-25 19:15:53	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Your submission has been sent for review	<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
30	1048585	14	3	2022-05-25 19:16:17	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
31	1048585	14	3	2022-05-25 19:16:42	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Next steps for publishing your submission	<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
32	1048585	15	3	2022-05-25 19:19:30	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Max Foran" <mforan@mailinator.com>			Your submission has been sent for review	<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
33	1048585	16	3	2022-05-25 19:20:32	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Power" <mpower@mailinator.com>			Your submission has been sent for review	<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer's Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
34	1048585	16	10	2022-05-25 19:21:11	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer's Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-06-22, if not before.<br />\n<br />\nAdela Gallego
35	1048585	17	3	2022-05-25 19:24:33	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Matthew Smith" <msmith@mailinator.com>			Your submission has been sent for internal review	<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
\.


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 35, true);


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
1	19
2	19
3	20
4	22
5	22
6	22
7	22
8	23
9	23
10	23
11	23
12	24
13	25
14	25
15	26
16	28
17	28
18	3
19	3
20	28
21	29
22	3
23	30
24	30
25	3
26	3
27	30
28	31
29	31
30	31
31	31
32	32
33	33
34	3
35	34
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
4	PASSWORD_RESET	0	1	\N	\N	\N
5	USER_REGISTER	0	1	\N	\N	\N
6	USER_VALIDATE_CONTEXT	0	1	\N	\N	\N
7	USER_VALIDATE_SITE	0	1	\N	\N	\N
8	REVIEWER_REGISTER	0	1	\N	\N	\N
9	SUBMISSION_ACK	1	1	\N	65536	1
10	SUBMISSION_ACK_NOT_USER	1	1	\N	65536	1
11	EDITOR_ASSIGN	1	1	16	16	1
12	REVIEW_CANCEL	1	1	16	4096	3
13	REVIEW_REINSTATE	1	1	16	4096	3
14	REVIEW_REQUEST	1	1	16	4096	3
15	REVIEW_RESPONSE_OVERDUE_AUTO	0	1	\N	4096	3
16	REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK	0	1	\N	4096	3
17	REVIEW_CONFIRM	1	1	4096	16	3
18	REVIEW_DECLINE	1	1	4096	16	3
19	REVIEW_ACK	1	1	16	4096	3
20	REVIEW_REMIND	0	1	16	4096	3
21	REVIEW_REMIND_AUTO	0	1	\N	4096	3
22	REVIEW_REMIND_AUTO_ONECLICK	0	1	\N	4096	3
23	EDITOR_DECISION_ACCEPT	0	1	16	65536	3
24	EDITOR_DECISION_SEND_TO_EXTERNAL	0	1	16	65536	1
25	EDITOR_DECISION_SEND_TO_INTERNAL	0	1	16	65536	1
26	EDITOR_DECISION_SEND_TO_PRODUCTION	0	1	16	65536	5
27	EDITOR_DECISION_REVISIONS	0	1	16	65536	3
28	EDITOR_DECISION_RESUBMIT	0	1	16	65536	3
29	EDITOR_DECISION_DECLINE	0	1	16	65536	3
30	EDITOR_DECISION_INITIAL_DECLINE	0	1	16	65536	1
31	EDITOR_RECOMMENDATION	0	1	16	16	3
32	EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	0	1	16	65536	3
33	EDITOR_DECISION_BACK_TO_COPYEDITING	0	1	16	65536	5
34	EDITOR_DECISION_BACK_TO_REVIEW	0	1	16	65536	4
35	EDITOR_DECISION_BACK_TO_SUBMISSION	0	1	16	65536	3
36	EDITOR_DECISION_NEW_ROUND	0	1	16	65536	3
37	EDITOR_DECISION_REVERT_DECLINE	0	1	16	65536	3
38	EDITOR_DECISION_REVERT_INITIAL_DECLINE	0	1	16	65536	1
39	EDITOR_DECISION_SKIP_REVIEW	0	1	16	65536	1
40	COPYEDIT_REQUEST	1	1	16	4097	4
41	LAYOUT_REQUEST	1	1	16	4097	5
42	LAYOUT_COMPLETE	1	1	4097	16	5
43	INDEX_REQUEST	1	1	16	4097	5
44	INDEX_COMPLETE	1	1	4097	16	5
45	EMAIL_LINK	0	1	1048576	\N	\N
46	STATISTICS_REPORT_NOTIFICATION	1	1	16	17	\N
47	ANNOUNCEMENT	0	1	16	1048576	\N
48	MANUAL_PAYMENT_NOTIFICATION	0	1	\N	\N	\N
49	PAYPAL_INVESTIGATE_PAYMENT	0	1	\N	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$pressName}	You have a new notification from {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$signature}<hr />{$unsubscribeLink}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$pressName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
PASSWORD_RESET	en_US	Password Reset	Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$recipientUsername}<br />\nYour new password: {$password}<br />\n<br />\n{$signature}	This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.
USER_REGISTER	en_US	Press Registration	{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE_CONTEXT	en_US	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE_SITE	en_US	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
REVIEWER_REGISTER	en_US	Registration as Reviewer with {$pressName}	In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you'll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}	This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.
SUBMISSION_ACK	en_US	Thank you for your submission to {$pressName}	<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p>{$signature}	This email, when enabled, is automatically sent to an author when they submit to the journal. It provides information about tracking the submission through the editorial process and thanks the author for the submission.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$signature}	This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.
EDITOR_ASSIGN	en_US	Editorial Assignment	{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,	This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.
REVIEW_CANCEL	en_US	Request for Review Cancelled	{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
REVIEW_REINSTATE	en_US	Request for Review Reinstated	{$recipientName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We hope that you will be able to assist with this press's review process.<br />\n<br />\nIf you have any questions, please contact me.	This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
EDITOR_DECISION_NEW_ROUND	en_US	Your submission has been sent for another round of review	<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n	This email notifies the author that a new round of review is beginning for their submission.
REVIEW_REQUEST	en_US	Manuscript Review Request	Dear {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n	This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review.
REVIEW_RESPONSE_OVERDUE_AUTO	en_US	Manuscript Review Request	Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK	en_US	Manuscript Review Request	{$recipientName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_CONFIRM	en_US	Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}	This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.
REVIEW_DECLINE	en_US	Unable to Review	Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}	This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.
EDITOR_DECISION_REVERT_DECLINE	en_US	We have reversed the decision to decline your submission	<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n	This email notifies the author that a previous decision to decline their submission after peer review is being reverted.
REVIEW_ACK	en_US	Thank you for your review	<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers' comments and the editor's decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor's decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>	This email is sent by an Editor to a Reviewer to notify them that a decision has been made regarding a submission that they reviewed.
REVIEW_REMIND	en_US	Submission Review Reminder	{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}	This email is sent by a Series Editor to remind a reviewer that their review is due.
REVIEW_REMIND_AUTO	en_US	Automated Submission Review Reminder	{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REMIND_AUTO_ONECLICK	en_US	Automated Submission Review Reminder	{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
PASSWORD_RESET	fr_CA	Réinitialisation du mot de passe	Votre mot de passe vous permettant d'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d'utilisateur: {$recipientUsername}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$signature}	Ce courriel est envoyé à un utilisateur lorsque son mot de passe a été réinitialisé après avoir suivi les instructions du courriel "PASSWORD_RESET_CONFIRM".
EDITOR_DECISION_ACCEPT	en_US	Your submission has been accepted to {$pressName}	<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}	This email notifies the author that their submission has been accepted for publication.
EDITOR_DECISION_SEND_TO_EXTERNAL	en_US	Your submission has been sent for review	<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>	This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to the peer review stage.
EDITOR_DECISION_SEND_TO_INTERNAL	en_US	Your submission has been sent for internal review	<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>	This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to the internal review stage.
EDITOR_DECISION_SEND_TO_PRODUCTION	en_US	Next steps for publishing your submission	<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}	This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.
EDITOR_DECISION_REVISIONS	en_US	Your submission has been reviewed and we encourage you to submit revisions	<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers' comments are included at the bottom of this email. Please respond to each point in the reviewers' comments and identify what changes you have made. If you find any of the reviewer's comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers' comments at your <a href="{$authorSubmissionUrl}">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}	This email from the editor requests revisions from the author during peer review.
EDITOR_DECISION_SKIP_REVIEW	fr_CA			##mailable.decision.skipReview.notifyAuthor.description##
COPYEDIT_REQUEST	fr_CA	Demande de révision d'une soumission	{$recipientName},<br />\n<br />\nJ'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}	##emails.copyeditRequest.description##
EDITOR_DECISION_RESUBMIT	en_US	Your submission has been reviewed - please revise and resubmit	<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer's comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers' comments <a href="{$authorSubmissionUrl}">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}	This email from the Editor or Section Editor to an Author notifies them of a "revise and resubmit" decision regarding their submission.
EDITOR_DECISION_DECLINE	en_US	Your submission has been declined	<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}	This email notifies the author that their submission has been declined after peer review.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Your submission has been declined	<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}	This email is sent to the author if the editor declines their submission initially, before the review stage, because the submission does not meet the requirements for publication.
EDITOR_RECOMMENDATION	en_US	Editor Recommendation	<p>Dear {$recipientName},</p><p>After considering the reviewers' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is:<br />{$recommendation}.</p><p>Please visit the submission's <a href="{$submissionUrl}">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>	This automated email notifies a senior Editor or Section Editor that an editorial recommendation has been made regarding a submission. This template is used when an editor is only allowed to recommend an editorial decision and requires an authorized editor to record editorial decisions. This option can be selected when assigning participants to a submission.
EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	en_US	An update regarding your submission	<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}	This email is sent to notify authors of a submission who are not assigned as participants that a decision has been made. Usually these are all others except the submitting author.
EDITOR_DECISION_BACK_TO_COPYEDITING	en_US			This email notifies the author that their submission has been sent back to the copyediting stage.
EDITOR_DECISION_BACK_TO_REVIEW	en_US	Your submission has been sent back for review	<p>Dear {$recipientName},</p>\n<p>Your submission, {$submissionTitle}, has been sent back to the review stage. \nIt will undergo further review before it can be accepted for publication.</p>\n<p>Occasionally, a decision to accept a submission will be recorded accidentally \nin our system and we must send it back to review. I apologize for any confusion \nthis has caused. We will work to complete any further review quickly so that you \nhave a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n	This email notifies the author that their submission has been sent back to the review stage.
EDITOR_DECISION_BACK_TO_SUBMISSION	en_US			This email notifies the author that their submission has been sent back to the submission stage.
EDITOR_DECISION_REVERT_INITIAL_DECLINE	en_US	We have reversed the decision to decline your submission	<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n	This email notifies the author that a previous decision to decline their submission without review is being reverted.
EDITOR_DECISION_SKIP_REVIEW	en_US	Your submission has been sent for copyediting	<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n	This email notifies the author that their submission is being sent directly to the copyediting stage and will not be peer reviewed.
COPYEDIT_REQUEST	en_US	Submission {$submissionId} is ready to be copyedited for {$contextAcronym}	<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href"{$submissionUrl}">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>1. Click on the Submission URL below.</li><li>2. Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>3. Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>4. Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}	This email is sent by an Editor to a submission's Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.
LAYOUT_REQUEST	en_US	Submission {$submissionId} is ready for production at {$contextAcronym}	<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href="{$submissionUrl}">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>1. Click on the Submission URL above.</li><li>2. Download the Production Ready files and use them to create the galleys according to the press's standards.</li><li>3. Upload the galleys to the Publication Formats section of the submission.</li><li>4. Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}	This email from an Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.
LAYOUT_COMPLETE	en_US	Galleys Complete	<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>	This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.
INDEX_REQUEST	en_US	Request Index	{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}	This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.
INDEX_COMPLETE	en_US	Index Galleys Complete	{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}	This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.
EMAIL_LINK	en_US	Manuscript of Possible Interest	Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authors} published in Vol {$volume}, No {$number} ({$year}) of {$pressName} at &quot;{$submissionUrl}&quot;.	This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.
STATISTICS_REPORT_NOTIFICATION	en_US	Editorial activity for {$month}, {$year}	\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n\t<li>New submissions this month: {$newSubmissions}</li>\n\t<li>Declined submissions this month: {$declinedSubmissions}</li>\n\t<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n\t<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href="{$editorialStatsLink}">editorial trends</a> and <a href="{$publicationStatsLink}">published book stats</a>. A full copy of this month's editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$signature}	This email is automatically sent monthly to editors and press managers to provide them a system health overview.
ANNOUNCEMENT	en_US	{$announcementTitle}	<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href="{$announcementUrl}">full announcement</a>.	This email is sent when a new announcement is created.
MANUAL_PAYMENT_NOTIFICATION	en_US	Manual Payment Notification	A manual payment needs to be processed for the press {$pressName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.	This email template is used to notify a press manager contact that a manual payment was requested.
PAYPAL_INVESTIGATE_PAYMENT	en_US	Unusual PayPal Activity	Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$pressName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n	This email template is used to notify the press' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.
NOTIFICATION	fr_CA	Nouvelle notification de {$pressName}	Vous avez reçu une nouvelle notification de {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$notificationUrl}<br />\n<br />\n{$signature}	Ce courriel est envoyé aux utilisateurs qui ont demandé qu'on leur envoie ce type de notification par courriel.
NOTIFICATION_CENTER_DEFAULT	fr_CA	Un message à propos de la presse {$pressName}	Veuillez saisir votre message.	Le message (vierge) par défaut utilisé par le centre d'alerte.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de réinitialisation du mot de passe	Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$signature}	Ce courriel est envoyé à un utilisateur lorsqu'il a indiqué avoir oublié son mot de passe ou être incapable d'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.
USER_REGISTER	fr_CA	Inscription à la presse	{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}	Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d'utilisateur et son mot de passe pour ses dossiers.
USER_VALIDATE_CONTEXT	fr_CA			##emails.userValidateContext.description##
USER_VALIDATE_SITE	fr_CA			##emails.userValidateSite.description##
REVIEWER_REGISTER	fr_CA	Inscription à titre d'évaluateur pour la presse {$pressName}	En raison de votre expertise, nous avons ajouté votre nom à notre base de données d'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d'évaluation, vous aurez la possibilité de lire le titre et le résumé de l'article en question. Vous serez toujours libre d'accepter ou de refuser l'invitation. Vous pouvez demander que l'on retire votre nom de notre liste d'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d'intérêt en ce qui concerne l'évaluation des articles.<br />\n<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}	Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d'utilisateur et de son mot de passe.
SUBMISSION_ACK	fr_CA	Accusé de réception de la soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$signature}	##emails.submissionAck.description##
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception d'une soumission	Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$pressName}. <br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir envoyé votre article à cette presse.<br />\n<br />\n{$signature}	Lorsqu'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d'OMP identifiés pendant le processus de soumission.
EDITOR_ASSIGN	fr_CA	Travail éditorial	{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,	Ce courriel indique au rédacteur en chef d'une série qu'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.
REVIEW_CANCEL	fr_CA	Annulation de la requête d'évaluation	{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d'annuler notre requête d'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter.	Ce courriel est envoyé à un évaluateur qui a entamé le processus d'évaluation d'une soumission par le rédacteur en chef d'une série afin d'informer l'évaluateur que la procédure d'évaluation a été annulée.
REVIEW_REINSTATE	fr_CA			##emails.reviewReinstate.description##
REVIEW_REQUEST	fr_CA	Requête d'évaluation d'un manuscrit	Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d'ici le {$responseDueDate} pour indiquer si vous serez en mesure d'évaluer l'article ou non. Ceci vous permettra également d'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL'évaluation doit être terminée d'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n	Ce courriel est envoyé à un évaluateur par le rédacteur en chef d'une série afin de lui demander s'il accepte ou refuse d'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l'article, il indique la date d'échéance pour l'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu'on choisit l'option Processus d'évaluation standard à l'étape 2 de la section Configuration de la presse.
REVIEW_RESPONSE_OVERDUE_AUTO	fr_CA			##emails.reviewResponseOverdueAuto.description##
REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK	fr_CA			##emails.reviewResponseOverdueAutoOneclick.description##
REVIEW_CONFIRM	fr_CA	En mesure d'évaluer	Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d'ici le {$reviewDueDate}.<br />\n<br />\n{$senderName}	Ce courriel est envoyé au rédacteur en chef d'une série pour répondre à la requête d'évaluation. Il a pour but de permettre à l'évaluateur d'indiquer au rédacteur en chef qu'il a accepté d'évaluer l'article et qu'il aura terminé son évaluation dans les délais prescrits.
REVIEW_DECLINE	fr_CA	Ne peux pas évaluer	Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m'avoir invité à évaluer cet article et n'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}	Ce courriel est envoyé par l'évaluateur au rédacteur en chef d'une série série pour indiquer qu'il ne sera pas en mesure d'évaluer l'article en question.
REVIEW_ACK	fr_CA	Accusé de réception de l'évaluation d'une soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.	##mailable.decision.notifyReviewer.description##
REVIEW_REMIND	fr_CA	Rappel d'évaluation	{$recipientName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n'avez plus votre nom d'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d'agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}	Ce courriel est envoyé par le rédacteur en chef d'une série pour rappeler à l'évaluateur qu'il doit envoyer sa soumission dès que possible.
REVIEW_REMIND_AUTO	fr_CA	Rappel automatique d'évaluation d'une soumission	{$recipientName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n'avez plus votre nom d'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}	Ce courriel est envoyé automatiquement lorsqu'une évaluation est en retard (voir les options d'évaluation à l'étape 2 de la section Configuration de la presse) et que l'accès de l'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).
REVIEW_REMIND_AUTO_ONECLICK	fr_CA	Rappel automatique d'évaluation d'une soumission	{$recipientName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}	Ce courriel est envoyé automatiquement lorsqu'une évaluation est en retard (voir les options d'évaluation à l'étape 2 de la section Configuration de la presse) et que l'accès de l'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).
EDITOR_DECISION_ACCEPT	fr_CA	Décision du rédacteur en chef	{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}	Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l'on a pris une décision finale concernant sa soumission.
EDITOR_DECISION_SEND_TO_EXTERNAL	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}	##emails.editorDecisionSendToExternal.description##
EDITOR_DECISION_SEND_TO_INTERNAL	fr_CA			##emails.editorDecisionSendToInternal.description##
EDITOR_DECISION_SEND_TO_PRODUCTION	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nL'édition de votre soumission « {$submissionTitle} » est complétée. Nous l'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}	##emails.editorDecisionSendToProduction.description##
EDITOR_DECISION_REVISIONS	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d'apporter des révisions à votre soumission.	##emails.editorDecisionRevisions.description##
EDITOR_DECISION_RESUBMIT	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d'apporter des révisions à votre soumission et de la soumettre à nouveau.	##emails.editorDecisionResubmit.description##
EDITOR_DECISION_DECLINE	fr_CA	Décision du rédacteur	{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.	Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit de refuser la soumission.
EDITOR_DECISION_INITIAL_DECLINE	fr_CA	Décision du rédacteur	\n\t\t\t{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.	Cet courriel est envoyé à l'auteur-e si la soumission est refusée avant même l'étape d'évaluation
EDITOR_RECOMMENDATION	fr_CA	Recommandation du rédacteur	{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}	##emails.editorRecommendation.description##
EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	fr_CA			##mailable.decision.notifyOtherAuthors.description##
EDITOR_DECISION_BACK_TO_COPYEDITING	fr_CA			##mailable.decision.backToCopyediting.notifyAuthor.description##
EDITOR_DECISION_BACK_TO_REVIEW	fr_CA			##mailable.decision.backToReview.notifyAuthor.description##
EDITOR_DECISION_BACK_TO_SUBMISSION	fr_CA			##mailable.decision.backToSubmission.notifyAuthor.description##
EDITOR_DECISION_NEW_ROUND	fr_CA			##mailable.decision.newReviewRound.notifyAuthor.description##
EDITOR_DECISION_REVERT_DECLINE	fr_CA			##mailable.decision.revertDecline.notifyAuthor.description##
EDITOR_DECISION_REVERT_INITIAL_DECLINE	fr_CA			##mailable.decision.revertInitialDecline.notifyAuthor.description##
LAYOUT_REQUEST	fr_CA	Requête des épreuves en placard	{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir contribué à cette presse.	Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.
LAYOUT_COMPLETE	fr_CA	Épreuves en placard complétées	{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n'hésitez pas à me contacter.<br />\n<br />\n{$senderName}	Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d'une série pour l'informer que la mise en page du manuscrit est terminée.
INDEX_REQUEST	fr_CA	Requête d'indexage	{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir contribué à cette presse.<br />\n<br />\n{$signature}	Ce courriel est envoyé à l'indexateur par le rédacteur en chef d'une série pour lui indiquer qu'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.
INDEX_COMPLETE	fr_CA	Indexage des épreuves en placard complété	{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}	Ce courriel est envoyé par l'indexateur au rédacteur en chef d'une série pour lui indiquer que l'indexage est terminé.
EMAIL_LINK	fr_CA	Manuscrit susceptible d'intéresser	Nous crayons que l'article intitulé &quot;{$submissionTitle}&quot; par {$authors} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$pressName} au &quot;{$submissionUrl}&quot; pourrait vous intéresser.	Ce modèle de courriel permet à un lecteur inscrit d'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.
STATISTICS_REPORT_NOTIFICATION	fr_CA			##emails.statisticsReportNotification.description##
ANNOUNCEMENT	fr_CA			##emails.announcement.description##
\.


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_templates_default_email_id_seq', 49, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_templates_email_id_seq', 1, false);


--
-- Data for Name: email_templates_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_settings (email_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.event_log (log_id, assoc_type, assoc_id, user_id, date_logged, event_type, message, is_translated) FROM stdin;
1	1048585	1	19	2022-05-25 18:43:41	268435458	submission.event.general.metadataUpdated	0
2	515	1	19	2022-05-25 18:43:44	1342177281	submission.event.fileUploaded	0
3	1048585	1	19	2022-05-25 18:43:44	1342177288	submission.event.fileRevised	0
4	515	1	19	2022-05-25 18:43:44	1342177296	submission.event.fileEdited	0
5	1048585	1	19	2022-05-25 18:43:44	1342177296	submission.event.fileEdited	0
6	1048585	1	19	2022-05-25 18:44:01	268435458	submission.event.general.metadataUpdated	0
7	1048585	1	19	2022-05-25 18:44:02	268435457	submission.event.submissionSubmitted	0
8	1048585	1	3	2022-05-25 18:44:16	805306371	editor.submission.decision.sendExternalReview.log	0
9	515	2	3	2022-05-25 18:44:16	1342177281	submission.event.fileUploaded	0
10	1048585	1	3	2022-05-25 18:44:16	1342177288	submission.event.fileRevised	0
11	1048585	1	3	2022-05-25 18:44:28	1073741825	log.review.reviewerAssigned	0
12	1048585	1	3	2022-05-25 18:44:33	805306371	editor.submission.decision.accept.log	0
13	1048585	1	3	2022-05-25 18:44:43	268435459	submission.event.participantAdded	0
14	1048585	2	20	2022-05-25 18:44:54	268435458	submission.event.general.metadataUpdated	0
15	515	3	20	2022-05-25 18:44:57	1342177281	submission.event.fileUploaded	0
16	1048585	2	20	2022-05-25 18:44:57	1342177288	submission.event.fileRevised	0
17	515	3	20	2022-05-25 18:44:57	1342177296	submission.event.fileEdited	0
18	1048585	2	20	2022-05-25 18:44:57	1342177296	submission.event.fileEdited	0
19	515	4	20	2022-05-25 18:44:57	1342177281	submission.event.fileUploaded	0
20	1048585	2	20	2022-05-25 18:44:57	1342177288	submission.event.fileRevised	0
21	515	4	20	2022-05-25 18:44:58	1342177296	submission.event.fileEdited	0
22	1048585	2	20	2022-05-25 18:44:58	1342177296	submission.event.fileEdited	0
23	515	5	20	2022-05-25 18:44:58	1342177281	submission.event.fileUploaded	0
24	1048585	2	20	2022-05-25 18:44:58	1342177288	submission.event.fileRevised	0
25	515	5	20	2022-05-25 18:44:58	1342177296	submission.event.fileEdited	0
26	1048585	2	20	2022-05-25 18:44:58	1342177296	submission.event.fileEdited	0
27	515	6	20	2022-05-25 18:44:58	1342177281	submission.event.fileUploaded	0
28	1048585	2	20	2022-05-25 18:44:58	1342177288	submission.event.fileRevised	0
29	515	6	20	2022-05-25 18:44:59	1342177296	submission.event.fileEdited	0
30	1048585	2	20	2022-05-25 18:44:59	1342177296	submission.event.fileEdited	0
31	1048585	2	20	2022-05-25 18:46:48	268435458	submission.event.general.metadataUpdated	0
32	1048585	2	20	2022-05-25 18:46:51	268435457	submission.event.submissionSubmitted	0
33	1048585	2	3	2022-05-25 18:47:10	805306371	editor.submission.decision.sendExternalReview.log	0
34	515	7	3	2022-05-25 18:47:11	1342177281	submission.event.fileUploaded	0
35	1048585	2	3	2022-05-25 18:47:11	1342177288	submission.event.fileRevised	0
36	515	8	3	2022-05-25 18:47:11	1342177281	submission.event.fileUploaded	0
37	1048585	2	3	2022-05-25 18:47:11	1342177288	submission.event.fileRevised	0
38	515	9	3	2022-05-25 18:47:11	1342177281	submission.event.fileUploaded	0
39	1048585	2	3	2022-05-25 18:47:11	1342177288	submission.event.fileRevised	0
40	515	10	3	2022-05-25 18:47:11	1342177281	submission.event.fileUploaded	0
41	1048585	2	3	2022-05-25 18:47:11	1342177288	submission.event.fileRevised	0
42	1048585	2	3	2022-05-25 18:47:26	1073741825	log.review.reviewerAssigned	0
43	1048585	2	3	2022-05-25 18:47:38	1073741825	log.review.reviewerAssigned	0
44	1048585	3	21	2022-05-25 18:47:49	268435458	submission.event.general.metadataUpdated	0
45	515	11	21	2022-05-25 18:47:52	1342177281	submission.event.fileUploaded	0
46	1048585	3	21	2022-05-25 18:47:52	1342177288	submission.event.fileRevised	0
47	515	11	21	2022-05-25 18:47:52	1342177296	submission.event.fileEdited	0
48	1048585	3	21	2022-05-25 18:47:52	1342177296	submission.event.fileEdited	0
49	1048585	3	21	2022-05-25 18:48:26	268435458	submission.event.general.metadataUpdated	0
50	1048585	3	21	2022-05-25 18:48:28	268435457	submission.event.submissionSubmitted	0
51	1048585	4	22	2022-05-25 18:48:38	268435458	submission.event.general.metadataUpdated	0
52	515	12	22	2022-05-25 18:48:40	1342177281	submission.event.fileUploaded	0
53	1048585	4	22	2022-05-25 18:48:40	1342177288	submission.event.fileRevised	0
54	515	12	22	2022-05-25 18:48:41	1342177296	submission.event.fileEdited	0
55	1048585	4	22	2022-05-25 18:48:41	1342177296	submission.event.fileEdited	0
56	515	13	22	2022-05-25 18:48:41	1342177281	submission.event.fileUploaded	0
57	1048585	4	22	2022-05-25 18:48:41	1342177288	submission.event.fileRevised	0
58	515	13	22	2022-05-25 18:48:41	1342177296	submission.event.fileEdited	0
59	1048585	4	22	2022-05-25 18:48:41	1342177296	submission.event.fileEdited	0
60	515	14	22	2022-05-25 18:48:41	1342177281	submission.event.fileUploaded	0
61	1048585	4	22	2022-05-25 18:48:41	1342177288	submission.event.fileRevised	0
62	515	14	22	2022-05-25 18:48:42	1342177296	submission.event.fileEdited	0
63	1048585	4	22	2022-05-25 18:48:42	1342177296	submission.event.fileEdited	0
64	515	15	22	2022-05-25 18:48:42	1342177281	submission.event.fileUploaded	0
65	1048585	4	22	2022-05-25 18:48:42	1342177288	submission.event.fileRevised	0
66	515	15	22	2022-05-25 18:48:42	1342177296	submission.event.fileEdited	0
67	1048585	4	22	2022-05-25 18:48:42	1342177296	submission.event.fileEdited	0
68	1048585	4	22	2022-05-25 18:50:02	268435458	submission.event.general.metadataUpdated	0
69	1048585	4	22	2022-05-25 18:50:05	268435457	submission.event.submissionSubmitted	0
70	1048585	4	3	2022-05-25 18:50:23	805306371	editor.submission.decision.sendInternalReview.log	0
71	515	16	3	2022-05-25 18:50:23	1342177281	submission.event.fileUploaded	0
72	1048585	4	3	2022-05-25 18:50:23	1342177288	submission.event.fileRevised	0
73	515	17	3	2022-05-25 18:50:23	1342177281	submission.event.fileUploaded	0
74	1048585	4	3	2022-05-25 18:50:23	1342177288	submission.event.fileRevised	0
75	515	18	3	2022-05-25 18:50:23	1342177281	submission.event.fileUploaded	0
76	1048585	4	3	2022-05-25 18:50:23	1342177288	submission.event.fileRevised	0
77	515	19	3	2022-05-25 18:50:23	1342177281	submission.event.fileUploaded	0
78	1048585	4	3	2022-05-25 18:50:23	1342177288	submission.event.fileRevised	0
79	1048585	4	3	2022-05-25 18:50:37	1073741825	log.review.reviewerAssigned	0
80	1048585	4	3	2022-05-25 18:50:44	805306371	editor.submission.decision.sendExternalReview.log	0
81	1048585	4	3	2022-05-25 18:50:59	1073741825	log.review.reviewerAssigned	0
82	1048585	4	3	2022-05-25 18:51:07	805306371	editor.submission.decision.accept.log	0
83	1048585	4	3	2022-05-25 18:51:22	268435459	submission.event.participantAdded	0
84	1048585	4	3	2022-05-25 18:51:32	805306371	editor.submission.decision.sendToProduction.log	0
85	1048585	4	3	2022-05-25 18:51:50	268435459	submission.event.participantAdded	0
86	1048585	4	3	2022-05-25 18:52:21	268435474	submission.event.publicationFormatCreated	0
87	1048585	5	23	2022-05-25 18:52:31	268435458	submission.event.general.metadataUpdated	0
88	515	20	23	2022-05-25 18:52:33	1342177281	submission.event.fileUploaded	0
89	1048585	5	23	2022-05-25 18:52:33	1342177288	submission.event.fileRevised	0
90	515	20	23	2022-05-25 18:52:34	1342177296	submission.event.fileEdited	0
91	1048585	5	23	2022-05-25 18:52:34	1342177296	submission.event.fileEdited	0
92	1048585	5	23	2022-05-25 18:53:11	268435458	submission.event.general.metadataUpdated	0
93	1048585	5	23	2022-05-25 18:53:13	268435457	submission.event.submissionSubmitted	0
94	1048585	5	3	2022-05-25 18:53:28	805306371	editor.submission.decision.sendInternalReview.log	0
95	515	21	3	2022-05-25 18:53:28	1342177281	submission.event.fileUploaded	0
96	1048585	5	3	2022-05-25 18:53:28	1342177288	submission.event.fileRevised	0
97	1048585	5	3	2022-05-25 18:53:39	1073741825	log.review.reviewerAssigned	0
98	1048585	5	3	2022-05-25 18:53:45	805306371	editor.submission.decision.sendExternalReview.log	0
99	1048585	5	3	2022-05-25 18:53:58	1073741825	log.review.reviewerAssigned	0
100	1048585	5	3	2022-05-25 18:54:06	805306371	editor.submission.decision.accept.log	0
101	1048585	5	3	2022-05-25 18:54:19	268435459	submission.event.participantAdded	0
102	1048585	5	3	2022-05-25 18:54:27	805306371	editor.submission.decision.sendToProduction.log	0
103	1048585	5	3	2022-05-25 18:54:41	268435459	submission.event.participantAdded	0
104	1048585	5	3	2022-05-25 18:54:50	268435459	submission.event.participantAdded	0
105	1048585	5	3	2022-05-25 18:54:58	268435474	submission.event.publicationFormatCreated	0
106	515	22	3	2022-05-25 18:55:03	1342177281	submission.event.fileUploaded	0
107	1048585	5	3	2022-05-25 18:55:03	1342177288	submission.event.fileRevised	0
108	1048585	5	3	2022-05-25 18:55:06	268435464	submission.event.publicationFormatPublished	0
109	1048585	5	3	2022-05-25 18:55:08	268435476	submission.event.publicationFormatMadeAvailable	0
110	515	22	3	2022-05-25 18:55:12	1342177296	submission.event.fileEdited	0
111	1048585	5	3	2022-05-25 18:55:12	1342177296	submission.event.fileEdited	0
112	515	22	3	2022-05-25 18:55:12	1342177287	submission.event.signoffSignoff	0
113	515	22	3	2022-05-25 18:55:15	1342177296	submission.event.fileEdited	0
114	1048585	5	3	2022-05-25 18:55:15	1342177296	submission.event.fileEdited	0
115	1048585	5	3	2022-05-25 18:55:18	268435462	publication.event.published	0
116	1048585	6	24	2022-05-25 18:55:30	268435458	submission.event.general.metadataUpdated	0
117	515	23	24	2022-05-25 18:55:32	1342177281	submission.event.fileUploaded	0
118	1048585	6	24	2022-05-25 18:55:32	1342177288	submission.event.fileRevised	0
119	515	23	24	2022-05-25 18:55:32	1342177296	submission.event.fileEdited	0
120	1048585	6	24	2022-05-25 18:55:32	1342177296	submission.event.fileEdited	0
121	515	24	24	2022-05-25 18:55:33	1342177281	submission.event.fileUploaded	0
122	1048585	6	24	2022-05-25 18:55:33	1342177288	submission.event.fileRevised	0
123	515	24	24	2022-05-25 18:55:33	1342177296	submission.event.fileEdited	0
124	1048585	6	24	2022-05-25 18:55:33	1342177296	submission.event.fileEdited	0
125	515	25	24	2022-05-25 18:55:33	1342177281	submission.event.fileUploaded	0
126	1048585	6	24	2022-05-25 18:55:33	1342177288	submission.event.fileRevised	0
127	515	25	24	2022-05-25 18:55:34	1342177296	submission.event.fileEdited	0
128	1048585	6	24	2022-05-25 18:55:34	1342177296	submission.event.fileEdited	0
129	515	26	24	2022-05-25 18:55:34	1342177281	submission.event.fileUploaded	0
130	1048585	6	24	2022-05-25 18:55:34	1342177288	submission.event.fileRevised	0
131	515	26	24	2022-05-25 18:55:34	1342177296	submission.event.fileEdited	0
132	1048585	6	24	2022-05-25 18:55:34	1342177296	submission.event.fileEdited	0
133	1048585	6	24	2022-05-25 18:56:36	268435458	submission.event.general.metadataUpdated	0
134	1048585	6	24	2022-05-25 18:56:38	268435457	submission.event.submissionSubmitted	0
135	1048585	6	3	2022-05-25 18:56:57	805306371	editor.submission.decision.sendInternalReview.log	0
136	515	27	3	2022-05-25 18:56:57	1342177281	submission.event.fileUploaded	0
137	1048585	6	3	2022-05-25 18:56:57	1342177288	submission.event.fileRevised	0
138	515	28	3	2022-05-25 18:56:57	1342177281	submission.event.fileUploaded	0
139	1048585	6	3	2022-05-25 18:56:57	1342177288	submission.event.fileRevised	0
140	515	29	3	2022-05-25 18:56:57	1342177281	submission.event.fileUploaded	0
141	1048585	6	3	2022-05-25 18:56:57	1342177288	submission.event.fileRevised	0
142	515	30	3	2022-05-25 18:56:57	1342177281	submission.event.fileUploaded	0
143	1048585	6	3	2022-05-25 18:56:57	1342177288	submission.event.fileRevised	0
144	1048585	6	3	2022-05-25 18:57:11	268435459	submission.event.participantAdded	0
145	1048585	6	6	2022-05-25 18:57:30	805306372	editor.submission.recommend.accept.log	0
146	1048585	7	25	2022-05-25 18:57:59	268435458	submission.event.general.metadataUpdated	0
147	515	31	25	2022-05-25 18:58:02	1342177281	submission.event.fileUploaded	0
148	1048585	7	25	2022-05-25 18:58:02	1342177288	submission.event.fileRevised	0
149	515	31	25	2022-05-25 18:58:02	1342177296	submission.event.fileEdited	0
150	1048585	7	25	2022-05-25 18:58:02	1342177296	submission.event.fileEdited	0
151	515	32	25	2022-05-25 18:58:02	1342177281	submission.event.fileUploaded	0
152	1048585	7	25	2022-05-25 18:58:02	1342177288	submission.event.fileRevised	0
153	515	32	25	2022-05-25 18:58:02	1342177296	submission.event.fileEdited	0
154	1048585	7	25	2022-05-25 18:58:02	1342177296	submission.event.fileEdited	0
155	515	33	25	2022-05-25 18:58:02	1342177281	submission.event.fileUploaded	0
156	1048585	7	25	2022-05-25 18:58:03	1342177288	submission.event.fileRevised	0
157	515	33	25	2022-05-25 18:58:03	1342177296	submission.event.fileEdited	0
158	1048585	7	25	2022-05-25 18:58:03	1342177296	submission.event.fileEdited	0
159	515	34	25	2022-05-25 18:58:03	1342177281	submission.event.fileUploaded	0
160	1048585	7	25	2022-05-25 18:58:03	1342177288	submission.event.fileRevised	0
161	515	34	25	2022-05-25 18:58:04	1342177296	submission.event.fileEdited	0
162	1048585	7	25	2022-05-25 18:58:04	1342177296	submission.event.fileEdited	0
163	515	35	25	2022-05-25 18:58:04	1342177281	submission.event.fileUploaded	0
164	1048585	7	25	2022-05-25 18:58:04	1342177288	submission.event.fileRevised	0
165	515	35	25	2022-05-25 18:58:04	1342177296	submission.event.fileEdited	0
166	1048585	7	25	2022-05-25 18:58:04	1342177296	submission.event.fileEdited	0
167	1048585	7	25	2022-05-25 18:59:56	268435458	submission.event.general.metadataUpdated	0
168	1048585	7	25	2022-05-25 18:59:59	268435457	submission.event.submissionSubmitted	0
169	1048585	7	3	2022-05-25 19:00:19	805306371	editor.submission.decision.sendExternalReview.log	0
170	515	36	3	2022-05-25 19:00:20	1342177281	submission.event.fileUploaded	0
171	1048585	7	3	2022-05-25 19:00:20	1342177288	submission.event.fileRevised	0
172	515	37	3	2022-05-25 19:00:20	1342177281	submission.event.fileUploaded	0
173	1048585	7	3	2022-05-25 19:00:20	1342177288	submission.event.fileRevised	0
174	515	38	3	2022-05-25 19:00:20	1342177281	submission.event.fileUploaded	0
175	1048585	7	3	2022-05-25 19:00:20	1342177288	submission.event.fileRevised	0
176	515	39	3	2022-05-25 19:00:20	1342177281	submission.event.fileUploaded	0
177	1048585	7	3	2022-05-25 19:00:20	1342177288	submission.event.fileRevised	0
178	515	40	3	2022-05-25 19:00:20	1342177281	submission.event.fileUploaded	0
179	1048585	7	3	2022-05-25 19:00:20	1342177288	submission.event.fileRevised	0
180	1048585	7	3	2022-05-25 19:00:36	1073741825	log.review.reviewerAssigned	0
181	1048585	7	3	2022-05-25 19:00:45	805306371	editor.submission.decision.accept.log	0
182	1048585	7	3	2022-05-25 19:01:01	268435459	submission.event.participantAdded	0
183	1048585	8	3	2022-05-25 19:01:12	268435458	submission.event.general.metadataUpdated	0
184	515	41	3	2022-05-25 19:01:14	1342177281	submission.event.fileUploaded	0
185	1048585	8	3	2022-05-25 19:01:14	1342177288	submission.event.fileRevised	0
186	515	41	3	2022-05-25 19:01:15	1342177296	submission.event.fileEdited	0
187	1048585	8	3	2022-05-25 19:01:15	1342177296	submission.event.fileEdited	0
188	1048585	8	3	2022-05-25 19:01:17	268435458	submission.event.general.metadataUpdated	0
189	1048585	8	3	2022-05-25 19:01:18	268435457	submission.event.submissionSubmitted	0
190	1048585	9	26	2022-05-25 19:01:27	268435458	submission.event.general.metadataUpdated	0
191	515	42	26	2022-05-25 19:01:30	1342177281	submission.event.fileUploaded	0
192	1048585	9	26	2022-05-25 19:01:30	1342177288	submission.event.fileRevised	0
193	515	42	26	2022-05-25 19:01:30	1342177296	submission.event.fileEdited	0
194	1048585	9	26	2022-05-25 19:01:30	1342177296	submission.event.fileEdited	0
195	515	43	26	2022-05-25 19:01:30	1342177281	submission.event.fileUploaded	0
196	1048585	9	26	2022-05-25 19:01:30	1342177288	submission.event.fileRevised	0
197	515	43	26	2022-05-25 19:01:30	1342177296	submission.event.fileEdited	0
198	1048585	9	26	2022-05-25 19:01:30	1342177296	submission.event.fileEdited	0
199	515	44	26	2022-05-25 19:01:30	1342177281	submission.event.fileUploaded	0
200	1048585	9	26	2022-05-25 19:01:30	1342177288	submission.event.fileRevised	0
201	515	44	26	2022-05-25 19:01:31	1342177296	submission.event.fileEdited	0
202	1048585	9	26	2022-05-25 19:01:31	1342177296	submission.event.fileEdited	0
203	515	45	26	2022-05-25 19:01:31	1342177281	submission.event.fileUploaded	0
204	1048585	9	26	2022-05-25 19:01:31	1342177288	submission.event.fileRevised	0
205	515	45	26	2022-05-25 19:01:31	1342177296	submission.event.fileEdited	0
206	1048585	9	26	2022-05-25 19:01:31	1342177296	submission.event.fileEdited	0
207	515	46	26	2022-05-25 19:01:32	1342177281	submission.event.fileUploaded	0
208	1048585	9	26	2022-05-25 19:01:32	1342177288	submission.event.fileRevised	0
209	515	46	26	2022-05-25 19:01:32	1342177296	submission.event.fileEdited	0
210	1048585	9	26	2022-05-25 19:01:32	1342177296	submission.event.fileEdited	0
211	1048585	9	26	2022-05-25 19:03:11	268435458	submission.event.general.metadataUpdated	0
212	1048585	9	26	2022-05-25 19:03:14	268435457	submission.event.submissionSubmitted	0
213	1048585	9	3	2022-05-25 19:03:35	805306371	editor.submission.decision.sendInternalReview.log	0
214	515	47	3	2022-05-25 19:03:35	1342177281	submission.event.fileUploaded	0
215	1048585	9	3	2022-05-25 19:03:35	1342177288	submission.event.fileRevised	0
216	515	48	3	2022-05-25 19:03:35	1342177281	submission.event.fileUploaded	0
217	1048585	9	3	2022-05-25 19:03:35	1342177288	submission.event.fileRevised	0
218	515	49	3	2022-05-25 19:03:35	1342177281	submission.event.fileUploaded	0
219	1048585	9	3	2022-05-25 19:03:35	1342177288	submission.event.fileRevised	0
220	515	50	3	2022-05-25 19:03:35	1342177281	submission.event.fileUploaded	0
221	1048585	9	3	2022-05-25 19:03:35	1342177288	submission.event.fileRevised	0
222	515	51	3	2022-05-25 19:03:35	1342177281	submission.event.fileUploaded	0
223	1048585	9	3	2022-05-25 19:03:35	1342177288	submission.event.fileRevised	0
224	1048585	10	27	2022-05-25 19:03:51	268435458	submission.event.general.metadataUpdated	0
225	515	52	27	2022-05-25 19:03:54	1342177281	submission.event.fileUploaded	0
226	1048585	10	27	2022-05-25 19:03:54	1342177288	submission.event.fileRevised	0
227	515	52	27	2022-05-25 19:03:54	1342177296	submission.event.fileEdited	0
228	1048585	10	27	2022-05-25 19:03:54	1342177296	submission.event.fileEdited	0
229	1048585	10	27	2022-05-25 19:04:53	268435458	submission.event.general.metadataUpdated	0
230	1048585	10	27	2022-05-25 19:04:55	268435457	submission.event.submissionSubmitted	0
231	1048585	11	28	2022-05-25 19:05:05	268435458	submission.event.general.metadataUpdated	0
232	515	53	28	2022-05-25 19:05:08	1342177281	submission.event.fileUploaded	0
233	1048585	11	28	2022-05-25 19:05:08	1342177288	submission.event.fileRevised	0
234	515	53	28	2022-05-25 19:05:08	1342177296	submission.event.fileEdited	0
235	1048585	11	28	2022-05-25 19:05:08	1342177296	submission.event.fileEdited	0
236	1048585	11	28	2022-05-25 19:05:18	268435458	submission.event.general.metadataUpdated	0
237	1048585	11	28	2022-05-25 19:05:19	268435457	submission.event.submissionSubmitted	0
238	1048585	11	3	2022-05-25 19:05:33	805306371	editor.submission.decision.sendInternalReview.log	0
239	515	54	3	2022-05-25 19:05:33	1342177281	submission.event.fileUploaded	0
240	1048585	11	3	2022-05-25 19:05:33	1342177288	submission.event.fileRevised	0
241	1048585	11	3	2022-05-25 19:05:44	1073741825	log.review.reviewerAssigned	0
242	1048585	11	3	2022-05-25 19:05:49	805306371	editor.submission.decision.sendExternalReview.log	0
243	1048585	11	3	2022-05-25 19:06:01	1073741825	log.review.reviewerAssigned	0
244	1048585	11	3	2022-05-25 19:06:10	1073741825	log.review.reviewerAssigned	0
245	1048585	11	10	2022-05-25 19:06:20	1073741830	log.review.reviewAccepted	0
246	1048585	11	10	2022-05-25 19:06:24	1073741848	log.review.reviewReady	0
247	1048585	11	12	2022-05-25 19:06:34	1073741830	log.review.reviewAccepted	0
248	1048585	11	12	2022-05-25 19:06:38	1073741848	log.review.reviewReady	0
249	1048585	11	3	2022-05-25 19:07:01	805306371	editor.submission.decision.accept.log	0
250	1048585	11	3	2022-05-25 19:07:01	1073741856	submission.event.decisionReviewerEmailSent	0
251	1048585	12	29	2022-05-25 19:07:16	268435458	submission.event.general.metadataUpdated	0
252	515	55	29	2022-05-25 19:07:19	1342177281	submission.event.fileUploaded	0
253	1048585	12	29	2022-05-25 19:07:19	1342177288	submission.event.fileRevised	0
254	515	55	29	2022-05-25 19:07:19	1342177296	submission.event.fileEdited	0
255	1048585	12	29	2022-05-25 19:07:19	1342177296	submission.event.fileEdited	0
256	515	56	29	2022-05-25 19:07:19	1342177281	submission.event.fileUploaded	0
257	1048585	12	29	2022-05-25 19:07:19	1342177288	submission.event.fileRevised	0
258	515	56	29	2022-05-25 19:07:20	1342177296	submission.event.fileEdited	0
259	1048585	12	29	2022-05-25 19:07:20	1342177296	submission.event.fileEdited	0
260	515	57	29	2022-05-25 19:07:20	1342177281	submission.event.fileUploaded	0
261	1048585	12	29	2022-05-25 19:07:20	1342177288	submission.event.fileRevised	0
262	515	57	29	2022-05-25 19:07:20	1342177296	submission.event.fileEdited	0
263	1048585	12	29	2022-05-25 19:07:20	1342177296	submission.event.fileEdited	0
264	1048585	12	29	2022-05-25 19:08:50	268435458	submission.event.general.metadataUpdated	0
265	1048585	12	29	2022-05-25 19:08:52	268435457	submission.event.submissionSubmitted	0
266	1048585	12	3	2022-05-25 19:09:14	805306371	editor.submission.decision.sendInternalReview.log	0
267	515	58	3	2022-05-25 19:09:14	1342177281	submission.event.fileUploaded	0
268	1048585	12	3	2022-05-25 19:09:14	1342177288	submission.event.fileRevised	0
269	515	59	3	2022-05-25 19:09:14	1342177281	submission.event.fileUploaded	0
270	1048585	12	3	2022-05-25 19:09:14	1342177288	submission.event.fileRevised	0
271	515	60	3	2022-05-25 19:09:14	1342177281	submission.event.fileUploaded	0
272	1048585	12	3	2022-05-25 19:09:14	1342177288	submission.event.fileRevised	0
273	1048585	12	3	2022-05-25 19:09:29	1073741825	log.review.reviewerAssigned	0
274	1048585	12	3	2022-05-25 19:09:39	1073741825	log.review.reviewerAssigned	0
275	1048585	12	3	2022-05-25 19:09:50	1073741825	log.review.reviewerAssigned	0
276	1048585	12	8	2022-05-25 19:10:03	1073741830	log.review.reviewAccepted	0
277	1048585	12	8	2022-05-25 19:10:08	1073741848	log.review.reviewReady	0
278	1048585	13	30	2022-05-25 19:10:21	268435458	submission.event.general.metadataUpdated	0
279	515	61	30	2022-05-25 19:10:23	1342177281	submission.event.fileUploaded	0
280	1048585	13	30	2022-05-25 19:10:23	1342177288	submission.event.fileRevised	0
281	515	61	30	2022-05-25 19:10:23	1342177296	submission.event.fileEdited	0
282	1048585	13	30	2022-05-25 19:10:23	1342177296	submission.event.fileEdited	0
283	515	62	30	2022-05-25 19:10:23	1342177281	submission.event.fileUploaded	0
284	1048585	13	30	2022-05-25 19:10:24	1342177288	submission.event.fileRevised	0
285	515	62	30	2022-05-25 19:10:24	1342177296	submission.event.fileEdited	0
286	1048585	13	30	2022-05-25 19:10:24	1342177296	submission.event.fileEdited	0
287	515	63	30	2022-05-25 19:10:24	1342177281	submission.event.fileUploaded	0
288	1048585	13	30	2022-05-25 19:10:24	1342177288	submission.event.fileRevised	0
289	515	63	30	2022-05-25 19:10:24	1342177296	submission.event.fileEdited	0
290	1048585	13	30	2022-05-25 19:10:24	1342177296	submission.event.fileEdited	0
291	1048585	13	30	2022-05-25 19:11:20	268435458	submission.event.general.metadataUpdated	0
292	1048585	13	30	2022-05-25 19:11:22	268435457	submission.event.submissionSubmitted	0
293	1048585	13	3	2022-05-25 19:11:40	805306371	editor.submission.decision.sendInternalReview.log	0
294	515	64	3	2022-05-25 19:11:40	1342177281	submission.event.fileUploaded	0
295	1048585	13	3	2022-05-25 19:11:40	1342177288	submission.event.fileRevised	0
296	515	65	3	2022-05-25 19:11:40	1342177281	submission.event.fileUploaded	0
297	1048585	13	3	2022-05-25 19:11:40	1342177288	submission.event.fileRevised	0
298	515	66	3	2022-05-25 19:11:40	1342177281	submission.event.fileUploaded	0
299	1048585	13	3	2022-05-25 19:11:40	1342177288	submission.event.fileRevised	0
300	1048585	13	3	2022-05-25 19:11:54	1073741825	log.review.reviewerAssigned	0
301	1048585	13	3	2022-05-25 19:12:01	805306371	editor.submission.decision.sendExternalReview.log	0
302	1048585	13	3	2022-05-25 19:12:16	1073741825	log.review.reviewerAssigned	0
303	1048585	13	3	2022-05-25 19:12:27	1073741825	log.review.reviewerAssigned	0
304	1048585	13	3	2022-05-25 19:12:37	1073741825	log.review.reviewerAssigned	0
305	1048585	13	10	2022-05-25 19:12:48	1073741830	log.review.reviewAccepted	0
306	1048585	13	10	2022-05-25 19:12:54	1073741848	log.review.reviewReady	0
307	1048585	13	12	2022-05-25 19:13:05	1073741830	log.review.reviewAccepted	0
308	1048585	13	12	2022-05-25 19:13:10	1073741848	log.review.reviewReady	0
309	1048585	13	3	2022-05-25 19:13:38	805306371	editor.submission.decision.accept.log	0
310	1048585	13	3	2022-05-25 19:13:39	1073741856	submission.event.decisionReviewerEmailSent	0
311	1048585	14	31	2022-05-25 19:13:58	268435458	submission.event.general.metadataUpdated	0
312	515	67	31	2022-05-25 19:14:00	1342177281	submission.event.fileUploaded	0
313	1048585	14	31	2022-05-25 19:14:00	1342177288	submission.event.fileRevised	0
314	515	67	31	2022-05-25 19:14:01	1342177296	submission.event.fileEdited	0
315	1048585	14	31	2022-05-25 19:14:01	1342177296	submission.event.fileEdited	0
316	515	68	31	2022-05-25 19:14:01	1342177281	submission.event.fileUploaded	0
317	1048585	14	31	2022-05-25 19:14:01	1342177288	submission.event.fileRevised	0
318	515	68	31	2022-05-25 19:14:01	1342177296	submission.event.fileEdited	0
319	1048585	14	31	2022-05-25 19:14:01	1342177296	submission.event.fileEdited	0
320	515	69	31	2022-05-25 19:14:01	1342177281	submission.event.fileUploaded	0
321	1048585	14	31	2022-05-25 19:14:01	1342177288	submission.event.fileRevised	0
322	515	69	31	2022-05-25 19:14:02	1342177296	submission.event.fileEdited	0
323	1048585	14	31	2022-05-25 19:14:02	1342177296	submission.event.fileEdited	0
324	515	70	31	2022-05-25 19:14:02	1342177281	submission.event.fileUploaded	0
325	1048585	14	31	2022-05-25 19:14:02	1342177288	submission.event.fileRevised	0
326	515	70	31	2022-05-25 19:14:02	1342177296	submission.event.fileEdited	0
327	1048585	14	31	2022-05-25 19:14:02	1342177296	submission.event.fileEdited	0
328	515	71	31	2022-05-25 19:14:03	1342177281	submission.event.fileUploaded	0
329	1048585	14	31	2022-05-25 19:14:03	1342177288	submission.event.fileRevised	0
330	515	71	31	2022-05-25 19:14:03	1342177296	submission.event.fileEdited	0
331	1048585	14	31	2022-05-25 19:14:03	1342177296	submission.event.fileEdited	0
332	515	72	31	2022-05-25 19:14:04	1342177281	submission.event.fileUploaded	0
333	1048585	14	31	2022-05-25 19:14:04	1342177288	submission.event.fileRevised	0
334	515	72	31	2022-05-25 19:14:05	1342177296	submission.event.fileEdited	0
335	1048585	14	31	2022-05-25 19:14:05	1342177296	submission.event.fileEdited	0
336	1048585	14	31	2022-05-25 19:15:09	268435458	submission.event.general.metadataUpdated	0
337	1048585	14	31	2022-05-25 19:15:11	268435457	submission.event.submissionSubmitted	0
338	1048585	14	3	2022-05-25 19:15:31	805306371	editor.submission.decision.sendInternalReview.log	0
339	515	73	3	2022-05-25 19:15:31	1342177281	submission.event.fileUploaded	0
340	1048585	14	3	2022-05-25 19:15:31	1342177288	submission.event.fileRevised	0
341	515	74	3	2022-05-25 19:15:31	1342177281	submission.event.fileUploaded	0
342	1048585	14	3	2022-05-25 19:15:31	1342177288	submission.event.fileRevised	0
343	515	75	3	2022-05-25 19:15:31	1342177281	submission.event.fileUploaded	0
344	1048585	14	3	2022-05-25 19:15:31	1342177288	submission.event.fileRevised	0
345	515	76	3	2022-05-25 19:15:31	1342177281	submission.event.fileUploaded	0
346	1048585	14	3	2022-05-25 19:15:31	1342177288	submission.event.fileRevised	0
347	515	77	3	2022-05-25 19:15:31	1342177281	submission.event.fileUploaded	0
348	1048585	14	3	2022-05-25 19:15:31	1342177288	submission.event.fileRevised	0
349	515	78	3	2022-05-25 19:15:32	1342177281	submission.event.fileUploaded	0
350	1048585	14	3	2022-05-25 19:15:32	1342177288	submission.event.fileRevised	0
351	1048585	14	3	2022-05-25 19:15:45	1073741825	log.review.reviewerAssigned	0
352	1048585	14	3	2022-05-25 19:15:53	805306371	editor.submission.decision.sendExternalReview.log	0
353	1048585	14	3	2022-05-25 19:16:08	1073741825	log.review.reviewerAssigned	0
354	1048585	14	3	2022-05-25 19:16:17	805306371	editor.submission.decision.accept.log	0
355	1048585	14	3	2022-05-25 19:16:32	268435459	submission.event.participantAdded	0
356	1048585	14	3	2022-05-25 19:16:42	805306371	editor.submission.decision.sendToProduction.log	0
357	1048585	14	3	2022-05-25 19:17:00	268435459	submission.event.participantAdded	0
358	1048585	14	3	2022-05-25 19:17:11	268435459	submission.event.participantAdded	0
359	1048585	14	3	2022-05-25 19:17:20	268435474	submission.event.publicationFormatCreated	0
360	515	79	3	2022-05-25 19:17:32	1342177281	submission.event.fileUploaded	0
361	1048585	14	3	2022-05-25 19:17:32	1342177288	submission.event.fileRevised	0
362	515	80	3	2022-05-25 19:17:32	1342177281	submission.event.fileUploaded	0
363	1048585	14	3	2022-05-25 19:17:32	1342177288	submission.event.fileRevised	0
364	515	81	3	2022-05-25 19:17:32	1342177281	submission.event.fileUploaded	0
365	1048585	14	3	2022-05-25 19:17:32	1342177288	submission.event.fileRevised	0
366	515	82	3	2022-05-25 19:17:32	1342177281	submission.event.fileUploaded	0
367	1048585	14	3	2022-05-25 19:17:32	1342177288	submission.event.fileRevised	0
368	515	83	3	2022-05-25 19:17:32	1342177281	submission.event.fileUploaded	0
369	1048585	14	3	2022-05-25 19:17:32	1342177288	submission.event.fileRevised	0
370	515	84	3	2022-05-25 19:17:32	1342177281	submission.event.fileUploaded	0
371	1048585	14	3	2022-05-25 19:17:32	1342177288	submission.event.fileRevised	0
372	1048585	14	3	2022-05-25 19:17:35	268435464	submission.event.publicationFormatPublished	0
373	1048585	14	3	2022-05-25 19:17:39	268435476	submission.event.publicationFormatMadeAvailable	0
374	515	84	3	2022-05-25 19:17:42	1342177296	submission.event.fileEdited	0
375	1048585	14	3	2022-05-25 19:17:42	1342177296	submission.event.fileEdited	0
376	515	84	3	2022-05-25 19:17:42	1342177287	submission.event.signoffSignoff	0
377	515	84	3	2022-05-25 19:17:47	1342177296	submission.event.fileEdited	0
378	1048585	14	3	2022-05-25 19:17:47	1342177296	submission.event.fileEdited	0
379	515	82	3	2022-05-25 19:17:51	1342177296	submission.event.fileEdited	0
380	1048585	14	3	2022-05-25 19:17:51	1342177296	submission.event.fileEdited	0
381	515	82	3	2022-05-25 19:17:51	1342177287	submission.event.signoffSignoff	0
382	515	82	3	2022-05-25 19:17:55	1342177296	submission.event.fileEdited	0
383	1048585	14	3	2022-05-25 19:17:55	1342177296	submission.event.fileEdited	0
384	515	83	3	2022-05-25 19:18:00	1342177296	submission.event.fileEdited	0
385	1048585	14	3	2022-05-25 19:18:00	1342177296	submission.event.fileEdited	0
386	515	83	3	2022-05-25 19:18:00	1342177287	submission.event.signoffSignoff	0
387	515	83	3	2022-05-25 19:18:05	1342177296	submission.event.fileEdited	0
388	1048585	14	3	2022-05-25 19:18:05	1342177296	submission.event.fileEdited	0
389	515	81	3	2022-05-25 19:18:09	1342177296	submission.event.fileEdited	0
390	1048585	14	3	2022-05-25 19:18:09	1342177296	submission.event.fileEdited	0
391	515	81	3	2022-05-25 19:18:09	1342177287	submission.event.signoffSignoff	0
392	515	81	3	2022-05-25 19:18:15	1342177296	submission.event.fileEdited	0
393	1048585	14	3	2022-05-25 19:18:15	1342177296	submission.event.fileEdited	0
394	515	80	3	2022-05-25 19:18:19	1342177296	submission.event.fileEdited	0
395	1048585	14	3	2022-05-25 19:18:19	1342177296	submission.event.fileEdited	0
396	515	80	3	2022-05-25 19:18:19	1342177287	submission.event.signoffSignoff	0
397	515	80	3	2022-05-25 19:18:24	1342177296	submission.event.fileEdited	0
398	1048585	14	3	2022-05-25 19:18:24	1342177296	submission.event.fileEdited	0
399	515	79	3	2022-05-25 19:18:28	1342177296	submission.event.fileEdited	0
400	1048585	14	3	2022-05-25 19:18:28	1342177296	submission.event.fileEdited	0
401	515	79	3	2022-05-25 19:18:28	1342177287	submission.event.signoffSignoff	0
402	515	79	3	2022-05-25 19:18:34	1342177296	submission.event.fileEdited	0
403	1048585	14	3	2022-05-25 19:18:34	1342177296	submission.event.fileEdited	0
404	1048585	14	3	2022-05-25 19:18:38	268435462	publication.event.published	0
405	1048585	15	32	2022-05-25 19:18:51	268435458	submission.event.general.metadataUpdated	0
406	515	85	32	2022-05-25 19:18:53	1342177281	submission.event.fileUploaded	0
407	1048585	15	32	2022-05-25 19:18:53	1342177288	submission.event.fileRevised	0
408	515	85	32	2022-05-25 19:18:54	1342177296	submission.event.fileEdited	0
409	1048585	15	32	2022-05-25 19:18:54	1342177296	submission.event.fileEdited	0
410	1048585	15	32	2022-05-25 19:19:13	268435458	submission.event.general.metadataUpdated	0
411	1048585	15	32	2022-05-25 19:19:14	268435457	submission.event.submissionSubmitted	0
412	1048585	15	3	2022-05-25 19:19:30	805306371	editor.submission.decision.sendExternalReview.log	0
413	515	86	3	2022-05-25 19:19:30	1342177281	submission.event.fileUploaded	0
414	1048585	15	3	2022-05-25 19:19:30	1342177288	submission.event.fileRevised	0
415	1048585	16	33	2022-05-25 19:19:43	268435458	submission.event.general.metadataUpdated	0
416	515	87	33	2022-05-25 19:19:46	1342177281	submission.event.fileUploaded	0
417	1048585	16	33	2022-05-25 19:19:46	1342177288	submission.event.fileRevised	0
418	515	87	33	2022-05-25 19:19:46	1342177296	submission.event.fileEdited	0
419	1048585	16	33	2022-05-25 19:19:46	1342177296	submission.event.fileEdited	0
420	1048585	16	33	2022-05-25 19:20:13	268435458	submission.event.general.metadataUpdated	0
421	1048585	16	33	2022-05-25 19:20:14	268435457	submission.event.submissionSubmitted	0
422	1048585	16	3	2022-05-25 19:20:31	805306371	editor.submission.decision.sendExternalReview.log	0
423	515	88	3	2022-05-25 19:20:32	1342177281	submission.event.fileUploaded	0
424	1048585	16	3	2022-05-25 19:20:32	1342177288	submission.event.fileRevised	0
425	1048585	16	3	2022-05-25 19:20:43	1073741825	log.review.reviewerAssigned	0
426	1048585	16	3	2022-05-25 19:20:51	1073741825	log.review.reviewerAssigned	0
427	1048585	16	3	2022-05-25 19:21:00	1073741825	log.review.reviewerAssigned	0
428	1048585	16	10	2022-05-25 19:21:11	1073741830	log.review.reviewAccepted	0
429	1048585	16	10	2022-05-25 19:21:16	1073741848	log.review.reviewReady	0
430	1048585	17	34	2022-05-25 19:21:27	268435458	submission.event.general.metadataUpdated	0
431	515	89	34	2022-05-25 19:21:30	1342177281	submission.event.fileUploaded	0
432	1048585	17	34	2022-05-25 19:21:30	1342177288	submission.event.fileRevised	0
433	515	89	34	2022-05-25 19:21:30	1342177296	submission.event.fileEdited	0
434	1048585	17	34	2022-05-25 19:21:30	1342177296	submission.event.fileEdited	0
435	515	90	34	2022-05-25 19:21:30	1342177281	submission.event.fileUploaded	0
436	1048585	17	34	2022-05-25 19:21:30	1342177288	submission.event.fileRevised	0
437	515	90	34	2022-05-25 19:21:30	1342177296	submission.event.fileEdited	0
438	1048585	17	34	2022-05-25 19:21:30	1342177296	submission.event.fileEdited	0
439	515	91	34	2022-05-25 19:21:30	1342177281	submission.event.fileUploaded	0
440	1048585	17	34	2022-05-25 19:21:30	1342177288	submission.event.fileRevised	0
441	515	91	34	2022-05-25 19:21:31	1342177296	submission.event.fileEdited	0
442	1048585	17	34	2022-05-25 19:21:31	1342177296	submission.event.fileEdited	0
443	515	92	34	2022-05-25 19:21:31	1342177281	submission.event.fileUploaded	0
444	1048585	17	34	2022-05-25 19:21:31	1342177288	submission.event.fileRevised	0
445	515	92	34	2022-05-25 19:21:31	1342177296	submission.event.fileEdited	0
446	1048585	17	34	2022-05-25 19:21:31	1342177296	submission.event.fileEdited	0
447	515	93	34	2022-05-25 19:21:32	1342177281	submission.event.fileUploaded	0
448	1048585	17	34	2022-05-25 19:21:32	1342177288	submission.event.fileRevised	0
449	515	93	34	2022-05-25 19:21:32	1342177296	submission.event.fileEdited	0
450	1048585	17	34	2022-05-25 19:21:32	1342177296	submission.event.fileEdited	0
451	515	94	34	2022-05-25 19:21:32	1342177281	submission.event.fileUploaded	0
452	1048585	17	34	2022-05-25 19:21:32	1342177288	submission.event.fileRevised	0
453	515	94	34	2022-05-25 19:21:33	1342177296	submission.event.fileEdited	0
454	1048585	17	34	2022-05-25 19:21:33	1342177296	submission.event.fileEdited	0
455	1048585	17	34	2022-05-25 19:24:03	268435458	submission.event.general.metadataUpdated	0
456	1048585	17	34	2022-05-25 19:24:07	268435457	submission.event.submissionSubmitted	0
457	1048585	17	3	2022-05-25 19:24:33	805306371	editor.submission.decision.sendInternalReview.log	0
458	515	95	3	2022-05-25 19:24:33	1342177281	submission.event.fileUploaded	0
459	1048585	17	3	2022-05-25 19:24:33	1342177288	submission.event.fileRevised	0
460	515	96	3	2022-05-25 19:24:33	1342177281	submission.event.fileUploaded	0
461	1048585	17	3	2022-05-25 19:24:33	1342177288	submission.event.fileRevised	0
462	515	97	3	2022-05-25 19:24:33	1342177281	submission.event.fileUploaded	0
463	1048585	17	3	2022-05-25 19:24:33	1342177288	submission.event.fileRevised	0
464	515	98	3	2022-05-25 19:24:33	1342177281	submission.event.fileUploaded	0
465	1048585	17	3	2022-05-25 19:24:33	1342177288	submission.event.fileRevised	0
466	515	99	3	2022-05-25 19:24:33	1342177281	submission.event.fileUploaded	0
467	1048585	17	3	2022-05-25 19:24:33	1342177288	submission.event.fileRevised	0
468	515	100	3	2022-05-25 19:24:33	1342177281	submission.event.fileUploaded	0
469	1048585	17	3	2022-05-25 19:24:33	1342177288	submission.event.fileRevised	0
470	1048585	17	3	2022-05-25 19:24:51	1073741825	log.review.reviewerAssigned	0
471	1048585	17	3	2022-05-25 19:25:04	1073741825	log.review.reviewerAssigned	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 471, true);


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
2	fileStage	2	int
2	sourceSubmissionFileId	\N	string
2	submissionFileId	1	int
2	fileId	1	int
2	submissionId	1	int
2	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
2	username	aclark	string
3	fileStage	2	int
3	submissionFileId	1	int
3	fileId	1	int
3	submissionId	1	int
3	username	aclark	string
3	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
4	fileStage	2	int
4	sourceSubmissionFileId	\N	string
4	submissionFileId	1	int
4	fileId	1	int
4	submissionId	1	int
4	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
4	username	aclark	string
5	fileStage	2	int
5	sourceSubmissionFileId	\N	string
5	submissionFileId	1	int
5	fileId	1	int
5	submissionId	1	int
5	username	aclark	string
5	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
5	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
8	editorId	3	int
8	editorName	Daniel Barnes	string
8	submissionId	1	int
8	decision	23	int
9	fileStage	4	int
9	sourceSubmissionFileId	1	int
9	submissionFileId	2	int
9	fileId	1	int
9	submissionId	1	int
9	originalFileName	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
9	username	dbarnes	string
10	fileStage	4	int
10	submissionFileId	2	int
10	fileId	1	int
10	submissionId	1	int
10	username	dbarnes	string
10	name	The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf	string
11	reviewAssignmentId	1	string
11	reviewerName	Gonzalo Favio	string
11	submissionId	1	int
11	stageId	3	int
11	round	1	int
12	editorId	3	int
12	editorName	Daniel Barnes	string
12	submissionId	1	int
12	decision	2	int
13	name	Sarah Vogt	string
13	username	svogt	string
13	userGroupName	Copyeditor	string
15	fileStage	2	int
15	sourceSubmissionFileId	\N	string
15	submissionFileId	3	int
15	fileId	2	int
15	submissionId	2	int
15	originalFileName	Critical History in Western Canada 1900–.pdf	string
15	username	afinkel	string
16	fileStage	2	int
16	submissionFileId	3	int
16	fileId	2	int
16	submissionId	2	int
16	username	afinkel	string
16	name	Critical History in Western Canada 1900–.pdf	string
17	fileStage	2	int
17	sourceSubmissionFileId	\N	string
17	submissionFileId	3	int
17	fileId	2	int
17	submissionId	2	int
17	originalFileName	Critical History in Western Canada 1900–.pdf	string
17	username	afinkel	string
18	fileStage	2	int
18	sourceSubmissionFileId	\N	string
18	submissionFileId	3	int
18	fileId	2	int
18	submissionId	2	int
18	username	afinkel	string
18	originalFileName	Critical History in Western Canada 1900–.pdf	string
18	name	Critical History in Western Canada 1900–.pdf	string
19	fileStage	2	int
19	sourceSubmissionFileId	\N	string
19	submissionFileId	4	int
19	fileId	3	int
19	submissionId	2	int
19	originalFileName	Vernacular Currents in Western Canadian .pdf	string
19	username	afinkel	string
20	fileStage	2	int
20	submissionFileId	4	int
20	fileId	3	int
20	submissionId	2	int
20	username	afinkel	string
20	name	Vernacular Currents in Western Canadian .pdf	string
21	fileStage	2	int
21	sourceSubmissionFileId	\N	string
21	submissionFileId	4	int
21	fileId	3	int
21	submissionId	2	int
21	originalFileName	Vernacular Currents in Western Canadian .pdf	string
21	username	afinkel	string
22	fileStage	2	int
22	sourceSubmissionFileId	\N	string
22	submissionFileId	4	int
22	fileId	3	int
22	submissionId	2	int
22	username	afinkel	string
22	originalFileName	Vernacular Currents in Western Canadian .pdf	string
22	name	Vernacular Currents in Western Canadian .pdf	string
23	fileStage	2	int
23	sourceSubmissionFileId	\N	string
23	submissionFileId	5	int
23	fileId	4	int
23	submissionId	2	int
23	originalFileName	Cree Intellectual Traditions in History.pdf	string
23	username	afinkel	string
24	fileStage	2	int
24	submissionFileId	5	int
24	fileId	4	int
24	submissionId	2	int
24	username	afinkel	string
24	name	Cree Intellectual Traditions in History.pdf	string
25	fileStage	2	int
25	sourceSubmissionFileId	\N	string
25	submissionFileId	5	int
25	fileId	4	int
25	submissionId	2	int
25	originalFileName	Cree Intellectual Traditions in History.pdf	string
25	username	afinkel	string
26	fileStage	2	int
26	sourceSubmissionFileId	\N	string
26	submissionFileId	5	int
26	fileId	4	int
26	submissionId	2	int
26	username	afinkel	string
26	originalFileName	Cree Intellectual Traditions in History.pdf	string
26	name	Cree Intellectual Traditions in History.pdf	string
27	fileStage	2	int
27	sourceSubmissionFileId	\N	string
27	submissionFileId	6	int
27	fileId	5	int
27	submissionId	2	int
27	originalFileName	Visualizing Space, Race, and History in .pdf	string
27	username	afinkel	string
28	fileStage	2	int
28	submissionFileId	6	int
28	fileId	5	int
28	submissionId	2	int
28	username	afinkel	string
28	name	Visualizing Space, Race, and History in .pdf	string
29	fileStage	2	int
29	sourceSubmissionFileId	\N	string
29	submissionFileId	6	int
29	fileId	5	int
29	submissionId	2	int
29	originalFileName	Visualizing Space, Race, and History in .pdf	string
29	username	afinkel	string
30	fileStage	2	int
30	sourceSubmissionFileId	\N	string
30	submissionFileId	6	int
30	fileId	5	int
30	submissionId	2	int
30	username	afinkel	string
30	originalFileName	Visualizing Space, Race, and History in .pdf	string
30	name	Visualizing Space, Race, and History in .pdf	string
33	editorId	3	int
33	editorName	Daniel Barnes	string
33	submissionId	2	int
33	decision	23	int
34	fileStage	4	int
34	sourceSubmissionFileId	6	int
34	submissionFileId	7	int
34	fileId	5	int
34	submissionId	2	int
34	originalFileName	Visualizing Space, Race, and History in .pdf	string
34	username	dbarnes	string
35	fileStage	4	int
35	submissionFileId	7	int
35	fileId	5	int
35	submissionId	2	int
35	username	dbarnes	string
35	name	Visualizing Space, Race, and History in .pdf	string
36	fileStage	4	int
36	sourceSubmissionFileId	5	int
36	submissionFileId	8	int
36	fileId	4	int
36	submissionId	2	int
36	originalFileName	Cree Intellectual Traditions in History.pdf	string
36	username	dbarnes	string
37	fileStage	4	int
37	submissionFileId	8	int
37	fileId	4	int
37	submissionId	2	int
37	username	dbarnes	string
37	name	Cree Intellectual Traditions in History.pdf	string
38	fileStage	4	int
38	sourceSubmissionFileId	4	int
38	submissionFileId	9	int
38	fileId	3	int
38	submissionId	2	int
38	originalFileName	Vernacular Currents in Western Canadian .pdf	string
38	username	dbarnes	string
39	fileStage	4	int
39	submissionFileId	9	int
39	fileId	3	int
39	submissionId	2	int
39	username	dbarnes	string
39	name	Vernacular Currents in Western Canadian .pdf	string
40	fileStage	4	int
40	sourceSubmissionFileId	3	int
40	submissionFileId	10	int
40	fileId	2	int
40	submissionId	2	int
40	originalFileName	Critical History in Western Canada 1900–.pdf	string
40	username	dbarnes	string
41	fileStage	4	int
41	submissionFileId	10	int
41	fileId	2	int
41	submissionId	2	int
41	username	dbarnes	string
41	name	Critical History in Western Canada 1900–.pdf	string
42	reviewAssignmentId	2	string
42	reviewerName	Al Zacharia	string
42	submissionId	2	int
42	stageId	3	int
42	round	1	int
43	reviewAssignmentId	3	string
43	reviewerName	Gonzalo Favio	string
43	submissionId	2	int
43	stageId	3	int
43	round	1	int
45	fileStage	2	int
45	sourceSubmissionFileId	\N	string
45	submissionFileId	11	int
45	fileId	6	int
45	submissionId	3	int
45	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
45	username	bbarnetson	string
46	fileStage	2	int
46	submissionFileId	11	int
46	fileId	6	int
46	submissionId	3	int
46	username	bbarnetson	string
67	sourceSubmissionFileId	\N	string
46	name	The Political Economy of Workplace Injury in Canada.pdf	string
47	fileStage	2	int
47	sourceSubmissionFileId	\N	string
47	submissionFileId	11	int
47	fileId	6	int
47	submissionId	3	int
47	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
47	username	bbarnetson	string
48	fileStage	2	int
48	sourceSubmissionFileId	\N	string
48	submissionFileId	11	int
48	fileId	6	int
48	submissionId	3	int
48	username	bbarnetson	string
48	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
48	name	The Political Economy of Workplace Injury in Canada.pdf	string
52	fileStage	2	int
52	sourceSubmissionFileId	\N	string
52	submissionFileId	12	int
52	fileId	7	int
52	submissionId	4	int
52	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
52	username	bbeaty	string
53	fileStage	2	int
53	submissionFileId	12	int
53	fileId	7	int
53	submissionId	4	int
53	username	bbeaty	string
53	name	Introduction: Contexts of Popular Cultur.pdf	string
54	fileStage	2	int
54	sourceSubmissionFileId	\N	string
54	submissionFileId	12	int
54	fileId	7	int
54	submissionId	4	int
54	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
54	username	bbeaty	string
55	fileStage	2	int
55	sourceSubmissionFileId	\N	string
55	submissionFileId	12	int
55	fileId	7	int
55	submissionId	4	int
55	username	bbeaty	string
55	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
55	name	Introduction: Contexts of Popular Cultur.pdf	string
56	fileStage	2	int
56	sourceSubmissionFileId	\N	string
56	submissionFileId	13	int
56	fileId	8	int
56	submissionId	4	int
56	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
56	username	bbeaty	string
57	fileStage	2	int
57	submissionFileId	13	int
57	fileId	8	int
57	submissionId	4	int
57	username	bbeaty	string
57	name	Chapter 1. A Future for Media Studies: C.pdf	string
58	fileStage	2	int
58	sourceSubmissionFileId	\N	string
58	submissionFileId	13	int
58	fileId	8	int
58	submissionId	4	int
58	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
58	username	bbeaty	string
59	fileStage	2	int
59	sourceSubmissionFileId	\N	string
59	submissionFileId	13	int
59	fileId	8	int
59	submissionId	4	int
59	username	bbeaty	string
59	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
59	name	Chapter 1. A Future for Media Studies: C.pdf	string
60	fileStage	2	int
60	sourceSubmissionFileId	\N	string
60	submissionFileId	14	int
60	fileId	9	int
60	submissionId	4	int
60	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
60	username	bbeaty	string
61	fileStage	2	int
61	submissionFileId	14	int
61	fileId	9	int
61	submissionId	4	int
61	username	bbeaty	string
61	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
62	fileStage	2	int
62	sourceSubmissionFileId	\N	string
62	submissionFileId	14	int
62	fileId	9	int
62	submissionId	4	int
62	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
62	username	bbeaty	string
63	fileStage	2	int
63	sourceSubmissionFileId	\N	string
63	submissionFileId	14	int
63	fileId	9	int
63	submissionId	4	int
63	username	bbeaty	string
63	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
63	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
64	fileStage	2	int
64	sourceSubmissionFileId	\N	string
64	submissionFileId	15	int
64	fileId	10	int
64	submissionId	4	int
64	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
64	username	bbeaty	string
65	fileStage	2	int
65	submissionFileId	15	int
65	fileId	10	int
65	submissionId	4	int
65	username	bbeaty	string
65	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
66	fileStage	2	int
66	sourceSubmissionFileId	\N	string
66	submissionFileId	15	int
66	fileId	10	int
66	submissionId	4	int
66	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
66	username	bbeaty	string
67	fileStage	2	int
67	submissionFileId	15	int
67	fileId	10	int
67	submissionId	4	int
67	username	bbeaty	string
67	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
67	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
70	editorId	3	int
70	editorName	Daniel Barnes	string
70	submissionId	4	int
70	decision	1	int
71	fileStage	19	int
71	sourceSubmissionFileId	15	int
71	submissionFileId	16	int
71	fileId	10	int
71	submissionId	4	int
71	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
71	username	dbarnes	string
72	fileStage	19	int
72	submissionFileId	16	int
72	fileId	10	int
72	submissionId	4	int
72	username	dbarnes	string
72	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
73	fileStage	19	int
73	sourceSubmissionFileId	14	int
73	submissionFileId	17	int
73	fileId	9	int
73	submissionId	4	int
73	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
73	username	dbarnes	string
74	fileStage	19	int
74	submissionFileId	17	int
74	fileId	9	int
74	submissionId	4	int
74	username	dbarnes	string
74	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
75	fileStage	19	int
75	sourceSubmissionFileId	13	int
75	submissionFileId	18	int
75	fileId	8	int
75	submissionId	4	int
75	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
75	username	dbarnes	string
76	fileStage	19	int
76	submissionFileId	18	int
76	fileId	8	int
76	submissionId	4	int
76	username	dbarnes	string
76	name	Chapter 1. A Future for Media Studies: C.pdf	string
77	fileStage	19	int
77	sourceSubmissionFileId	12	int
77	submissionFileId	19	int
77	fileId	7	int
77	submissionId	4	int
77	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
77	username	dbarnes	string
78	fileStage	19	int
78	submissionFileId	19	int
78	fileId	7	int
78	submissionId	4	int
78	username	dbarnes	string
78	name	Introduction: Contexts of Popular Cultur.pdf	string
79	reviewAssignmentId	4	string
79	reviewerName	Aisla McCrae	string
79	submissionId	4	int
79	stageId	2	int
79	round	1	int
80	editorId	3	int
80	editorName	Daniel Barnes	string
80	submissionId	4	int
80	decision	3	int
81	reviewAssignmentId	5	string
81	reviewerName	Al Zacharia	string
81	submissionId	4	int
81	stageId	3	int
81	round	1	int
82	editorId	3	int
82	editorName	Daniel Barnes	string
82	submissionId	4	int
82	decision	2	int
83	name	Maria Fritz	string
83	username	mfritz	string
83	userGroupName	Copyeditor	string
84	editorId	3	int
84	editorName	Daniel Barnes	string
84	submissionId	4	int
84	decision	7	int
85	name	Graham Cox	string
85	username	gcox	string
85	userGroupName	Layout Editor	string
86	formatName	PDF	string
88	fileStage	2	int
88	sourceSubmissionFileId	\N	string
88	submissionFileId	20	int
88	fileId	11	int
88	submissionId	5	int
88	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
88	username	callan	string
89	fileStage	2	int
89	submissionFileId	20	int
89	fileId	11	int
89	submissionId	5	int
89	username	callan	string
89	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
90	fileStage	2	int
90	sourceSubmissionFileId	\N	string
90	submissionFileId	20	int
90	fileId	11	int
90	submissionId	5	int
90	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
90	username	callan	string
91	fileStage	2	int
91	sourceSubmissionFileId	\N	string
91	submissionFileId	20	int
91	fileId	11	int
91	submissionId	5	int
91	username	callan	string
91	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
91	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
94	editorId	3	int
94	editorName	Daniel Barnes	string
94	submissionId	5	int
94	decision	1	int
95	fileStage	19	int
95	sourceSubmissionFileId	20	int
95	submissionFileId	21	int
95	fileId	11	int
95	submissionId	5	int
95	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
95	username	dbarnes	string
96	fileStage	19	int
96	submissionFileId	21	int
96	fileId	11	int
96	submissionId	5	int
96	username	dbarnes	string
96	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
97	reviewAssignmentId	6	string
97	reviewerName	Paul Hudson	string
97	submissionId	5	int
97	stageId	2	int
97	round	1	int
98	editorId	3	int
98	editorName	Daniel Barnes	string
98	submissionId	5	int
98	decision	3	int
99	reviewAssignmentId	7	string
99	reviewerName	Gonzalo Favio	string
99	submissionId	5	int
99	stageId	3	int
99	round	1	int
100	editorId	3	int
100	editorName	Daniel Barnes	string
100	submissionId	5	int
100	decision	2	int
101	name	Sarah Vogt	string
101	username	svogt	string
101	userGroupName	Copyeditor	string
102	editorId	3	int
102	editorName	Daniel Barnes	string
102	submissionId	5	int
102	decision	7	int
103	name	Stephen Hellier	string
103	username	shellier	string
103	userGroupName	Layout Editor	string
104	name	Catherine Turner	string
104	username	cturner	string
104	userGroupName	Proofreader	string
105	formatName	PDF	string
106	fileStage	10	int
106	sourceSubmissionFileId	20	int
106	submissionFileId	22	int
106	fileId	11	int
106	submissionId	5	int
106	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
106	username	dbarnes	string
107	fileStage	10	int
107	submissionFileId	22	int
107	fileId	11	int
107	submissionId	5	int
107	username	dbarnes	string
107	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
108	publicationFormatName	PDF	string
109	publicationFormatName	PDF	string
110	fileStage	10	int
110	sourceSubmissionFileId	20	int
110	submissionFileId	22	int
110	fileId	11	int
110	submissionId	5	int
110	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
110	username	dbarnes	string
111	fileStage	10	int
111	sourceSubmissionFileId	20	int
111	submissionFileId	22	int
111	fileId	11	int
111	submissionId	5	int
111	username	dbarnes	string
111	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
111	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
112	file	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
112	name	Daniel Barnes	string
112	username	dbarnes	string
113	fileStage	10	int
113	sourceSubmissionFileId	20	int
113	submissionFileId	22	int
113	fileId	11	int
113	submissionId	5	int
113	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
113	username	dbarnes	string
114	fileStage	10	int
114	sourceSubmissionFileId	20	int
114	submissionFileId	22	int
114	fileId	11	int
114	submissionId	5	int
114	username	dbarnes	string
114	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
114	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
117	fileStage	2	int
117	sourceSubmissionFileId	\N	string
117	submissionFileId	23	int
117	fileId	12	int
117	submissionId	6	int
117	originalFileName	Identify: Understanding Your Information.pdf	string
117	username	dbernnard	string
118	fileStage	2	int
118	submissionFileId	23	int
118	fileId	12	int
118	submissionId	6	int
118	username	dbernnard	string
118	name	Identify: Understanding Your Information.pdf	string
119	fileStage	2	int
119	sourceSubmissionFileId	\N	string
119	submissionFileId	23	int
119	fileId	12	int
119	submissionId	6	int
119	originalFileName	Identify: Understanding Your Information.pdf	string
119	username	dbernnard	string
120	fileStage	2	int
120	sourceSubmissionFileId	\N	string
120	submissionFileId	23	int
120	fileId	12	int
120	submissionId	6	int
120	username	dbernnard	string
120	originalFileName	Identify: Understanding Your Information.pdf	string
120	name	Identify: Understanding Your Information.pdf	string
121	fileStage	2	int
121	sourceSubmissionFileId	\N	string
121	submissionFileId	24	int
121	fileId	13	int
121	submissionId	6	int
121	originalFileName	Scope: Knowing What Is Available.pdf	string
121	username	dbernnard	string
122	fileStage	2	int
122	submissionFileId	24	int
122	fileId	13	int
122	submissionId	6	int
122	username	dbernnard	string
122	name	Scope: Knowing What Is Available.pdf	string
123	fileStage	2	int
123	sourceSubmissionFileId	\N	string
123	submissionFileId	24	int
123	fileId	13	int
123	submissionId	6	int
123	originalFileName	Scope: Knowing What Is Available.pdf	string
123	username	dbernnard	string
124	fileStage	2	int
124	sourceSubmissionFileId	\N	string
124	submissionFileId	24	int
124	fileId	13	int
124	submissionId	6	int
124	username	dbernnard	string
124	originalFileName	Scope: Knowing What Is Available.pdf	string
124	name	Scope: Knowing What Is Available.pdf	string
125	fileStage	2	int
125	sourceSubmissionFileId	\N	string
125	submissionFileId	25	int
125	fileId	14	int
125	submissionId	6	int
125	originalFileName	Plan: Developing Research Strategies.pdf	string
125	username	dbernnard	string
126	fileStage	2	int
126	submissionFileId	25	int
126	fileId	14	int
126	submissionId	6	int
126	username	dbernnard	string
126	name	Plan: Developing Research Strategies.pdf	string
127	fileStage	2	int
127	sourceSubmissionFileId	\N	string
127	submissionFileId	25	int
127	fileId	14	int
127	submissionId	6	int
127	originalFileName	Plan: Developing Research Strategies.pdf	string
127	username	dbernnard	string
128	fileStage	2	int
128	sourceSubmissionFileId	\N	string
128	submissionFileId	25	int
128	fileId	14	int
128	submissionId	6	int
128	username	dbernnard	string
128	originalFileName	Plan: Developing Research Strategies.pdf	string
128	name	Plan: Developing Research Strategies.pdf	string
129	fileStage	2	int
129	sourceSubmissionFileId	\N	string
129	submissionFileId	26	int
129	fileId	15	int
129	submissionId	6	int
129	originalFileName	Gather: Finding What You Need.pdf	string
129	username	dbernnard	string
130	fileStage	2	int
130	submissionFileId	26	int
130	fileId	15	int
130	submissionId	6	int
130	username	dbernnard	string
130	name	Gather: Finding What You Need.pdf	string
131	fileStage	2	int
131	sourceSubmissionFileId	\N	string
131	submissionFileId	26	int
131	fileId	15	int
131	submissionId	6	int
131	originalFileName	Gather: Finding What You Need.pdf	string
131	username	dbernnard	string
132	fileStage	2	int
132	sourceSubmissionFileId	\N	string
132	submissionFileId	26	int
132	fileId	15	int
132	submissionId	6	int
132	username	dbernnard	string
132	originalFileName	Gather: Finding What You Need.pdf	string
132	name	Gather: Finding What You Need.pdf	string
135	editorId	3	int
135	editorName	Daniel Barnes	string
135	submissionId	6	int
135	decision	1	int
136	fileStage	19	int
136	sourceSubmissionFileId	26	int
136	submissionFileId	27	int
136	fileId	15	int
136	submissionId	6	int
136	originalFileName	Gather: Finding What You Need.pdf	string
136	username	dbarnes	string
137	fileStage	19	int
137	submissionFileId	27	int
137	fileId	15	int
137	submissionId	6	int
137	username	dbarnes	string
137	name	Gather: Finding What You Need.pdf	string
138	fileStage	19	int
138	sourceSubmissionFileId	25	int
138	submissionFileId	28	int
138	fileId	14	int
138	submissionId	6	int
138	originalFileName	Plan: Developing Research Strategies.pdf	string
138	username	dbarnes	string
139	fileStage	19	int
139	submissionFileId	28	int
139	fileId	14	int
139	submissionId	6	int
139	username	dbarnes	string
139	name	Plan: Developing Research Strategies.pdf	string
140	fileStage	19	int
140	sourceSubmissionFileId	24	int
140	submissionFileId	29	int
140	fileId	13	int
140	submissionId	6	int
140	originalFileName	Scope: Knowing What Is Available.pdf	string
140	username	dbarnes	string
141	fileStage	19	int
141	submissionFileId	29	int
141	fileId	13	int
141	submissionId	6	int
141	username	dbarnes	string
141	name	Scope: Knowing What Is Available.pdf	string
142	fileStage	19	int
142	sourceSubmissionFileId	23	int
142	submissionFileId	30	int
142	fileId	12	int
142	submissionId	6	int
142	originalFileName	Identify: Understanding Your Information.pdf	string
142	username	dbarnes	string
143	fileStage	19	int
143	submissionFileId	30	int
143	fileId	12	int
143	submissionId	6	int
143	username	dbarnes	string
143	name	Identify: Understanding Your Information.pdf	string
144	name	Minoti Inoue	string
144	username	minoue	string
144	userGroupName	Series editor	string
145	editorId	6	int
145	editorName	Minoti Inoue	string
145	submissionId	6	int
145	decision	28	int
147	fileStage	2	int
147	sourceSubmissionFileId	\N	string
147	submissionFileId	31	int
147	fileId	16	int
147	submissionId	7	int
147	originalFileName	Introduction.pdf	string
147	username	dkennepohl	string
148	fileStage	2	int
148	submissionFileId	31	int
148	fileId	16	int
148	submissionId	7	int
148	username	dkennepohl	string
148	name	Introduction.pdf	string
149	fileStage	2	int
149	sourceSubmissionFileId	\N	string
149	submissionFileId	31	int
149	fileId	16	int
149	submissionId	7	int
149	originalFileName	Introduction.pdf	string
149	username	dkennepohl	string
150	fileStage	2	int
150	sourceSubmissionFileId	\N	string
150	submissionFileId	31	int
150	fileId	16	int
150	submissionId	7	int
150	username	dkennepohl	string
150	originalFileName	Introduction.pdf	string
150	name	Introduction.pdf	string
151	fileStage	2	int
151	sourceSubmissionFileId	\N	string
151	submissionFileId	32	int
151	fileId	17	int
151	submissionId	7	int
151	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
151	username	dkennepohl	string
152	fileStage	2	int
152	submissionFileId	32	int
152	fileId	17	int
152	submissionId	7	int
152	username	dkennepohl	string
152	name	Chapter 1: Interactions Affording Distan.pdf	string
153	fileStage	2	int
153	sourceSubmissionFileId	\N	string
153	submissionFileId	32	int
153	fileId	17	int
153	submissionId	7	int
153	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
153	username	dkennepohl	string
154	fileStage	2	int
154	sourceSubmissionFileId	\N	string
154	submissionFileId	32	int
154	fileId	17	int
154	submissionId	7	int
154	username	dkennepohl	string
154	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
154	name	Chapter 1: Interactions Affording Distan.pdf	string
155	fileStage	2	int
155	sourceSubmissionFileId	\N	string
155	submissionFileId	33	int
155	fileId	18	int
155	submissionId	7	int
155	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
155	username	dkennepohl	string
156	fileStage	2	int
156	submissionFileId	33	int
156	fileId	18	int
156	submissionId	7	int
156	username	dkennepohl	string
156	name	Chapter 2: Learning Science at a Distanc.pdf	string
157	fileStage	2	int
157	sourceSubmissionFileId	\N	string
157	submissionFileId	33	int
157	fileId	18	int
157	submissionId	7	int
157	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
157	username	dkennepohl	string
158	fileStage	2	int
158	sourceSubmissionFileId	\N	string
158	submissionFileId	33	int
158	fileId	18	int
158	submissionId	7	int
158	username	dkennepohl	string
158	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
158	name	Chapter 2: Learning Science at a Distanc.pdf	string
159	fileStage	2	int
159	sourceSubmissionFileId	\N	string
159	submissionFileId	34	int
159	fileId	19	int
159	submissionId	7	int
159	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
159	username	dkennepohl	string
160	fileStage	2	int
160	submissionFileId	34	int
160	fileId	19	int
160	submissionId	7	int
160	username	dkennepohl	string
160	name	Chapter 3: Leadership Strategies for Coo.pdf	string
161	fileStage	2	int
161	sourceSubmissionFileId	\N	string
161	submissionFileId	34	int
161	fileId	19	int
161	submissionId	7	int
161	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
161	username	dkennepohl	string
162	fileStage	2	int
162	sourceSubmissionFileId	\N	string
162	submissionFileId	34	int
162	fileId	19	int
162	submissionId	7	int
162	username	dkennepohl	string
162	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
162	name	Chapter 3: Leadership Strategies for Coo.pdf	string
163	fileStage	2	int
163	sourceSubmissionFileId	\N	string
163	submissionFileId	35	int
163	fileId	20	int
163	submissionId	7	int
163	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
163	username	dkennepohl	string
164	fileStage	2	int
164	submissionFileId	35	int
164	fileId	20	int
164	submissionId	7	int
164	username	dkennepohl	string
164	name	Chapter 4: Toward New Models of Flexible.pdf	string
165	fileStage	2	int
165	sourceSubmissionFileId	\N	string
165	submissionFileId	35	int
165	fileId	20	int
165	submissionId	7	int
165	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
165	username	dkennepohl	string
166	fileStage	2	int
166	sourceSubmissionFileId	\N	string
166	submissionFileId	35	int
166	fileId	20	int
166	submissionId	7	int
166	username	dkennepohl	string
166	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
166	name	Chapter 4: Toward New Models of Flexible.pdf	string
169	editorId	3	int
169	editorName	Daniel Barnes	string
169	submissionId	7	int
169	decision	23	int
170	fileStage	4	int
170	sourceSubmissionFileId	35	int
170	submissionFileId	36	int
170	fileId	20	int
170	submissionId	7	int
170	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
170	username	dbarnes	string
171	fileStage	4	int
171	submissionFileId	36	int
171	fileId	20	int
171	submissionId	7	int
171	username	dbarnes	string
171	name	Chapter 4: Toward New Models of Flexible.pdf	string
172	fileStage	4	int
172	sourceSubmissionFileId	34	int
172	submissionFileId	37	int
172	fileId	19	int
172	submissionId	7	int
172	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
172	username	dbarnes	string
173	fileStage	4	int
173	submissionFileId	37	int
173	fileId	19	int
173	submissionId	7	int
173	username	dbarnes	string
173	name	Chapter 3: Leadership Strategies for Coo.pdf	string
174	fileStage	4	int
174	sourceSubmissionFileId	31	int
174	submissionFileId	38	int
174	fileId	16	int
174	submissionId	7	int
174	originalFileName	Introduction.pdf	string
174	username	dbarnes	string
175	fileStage	4	int
175	submissionFileId	38	int
175	fileId	16	int
175	submissionId	7	int
175	username	dbarnes	string
175	name	Introduction.pdf	string
176	fileStage	4	int
176	sourceSubmissionFileId	32	int
176	submissionFileId	39	int
176	fileId	17	int
176	submissionId	7	int
176	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
176	username	dbarnes	string
177	fileStage	4	int
177	submissionFileId	39	int
177	fileId	17	int
177	submissionId	7	int
177	username	dbarnes	string
177	name	Chapter 1: Interactions Affording Distan.pdf	string
178	fileStage	4	int
178	sourceSubmissionFileId	33	int
178	submissionFileId	40	int
178	fileId	18	int
178	submissionId	7	int
178	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
178	username	dbarnes	string
179	fileStage	4	int
179	submissionFileId	40	int
179	fileId	18	int
179	submissionId	7	int
179	username	dbarnes	string
179	name	Chapter 2: Learning Science at a Distanc.pdf	string
180	reviewAssignmentId	8	string
180	reviewerName	Adela Gallego	string
180	submissionId	7	int
180	stageId	3	int
180	round	1	int
181	editorId	3	int
181	editorName	Daniel Barnes	string
181	submissionId	7	int
181	decision	2	int
182	name	Maria Fritz	string
182	username	mfritz	string
182	userGroupName	Copyeditor	string
184	fileStage	2	int
184	sourceSubmissionFileId	\N	string
184	submissionFileId	41	int
184	fileId	21	int
184	submissionId	8	int
184	originalFileName	Editorial.pdf	string
184	username	dbarnes	string
185	fileStage	2	int
185	submissionFileId	41	int
185	fileId	21	int
185	submissionId	8	int
185	username	dbarnes	string
185	name	Editorial.pdf	string
186	fileStage	2	int
186	sourceSubmissionFileId	\N	string
186	submissionFileId	41	int
186	fileId	21	int
186	submissionId	8	int
186	originalFileName	Editorial.pdf	string
186	username	dbarnes	string
187	fileStage	2	int
187	sourceSubmissionFileId	\N	string
187	submissionFileId	41	int
187	fileId	21	int
187	submissionId	8	int
187	username	dbarnes	string
187	originalFileName	Editorial.pdf	string
187	name	Editorial.pdf	string
191	fileStage	2	int
191	sourceSubmissionFileId	\N	string
191	submissionFileId	42	int
191	fileId	22	int
191	submissionId	9	int
191	originalFileName	Internet, openness and the future of the.pdf	string
191	username	fperini	string
192	fileStage	2	int
192	submissionFileId	42	int
192	fileId	22	int
192	submissionId	9	int
192	username	fperini	string
192	name	Internet, openness and the future of the.pdf	string
193	fileStage	2	int
193	sourceSubmissionFileId	\N	string
193	submissionFileId	42	int
193	fileId	22	int
193	submissionId	9	int
193	originalFileName	Internet, openness and the future of the.pdf	string
193	username	fperini	string
194	fileStage	2	int
194	sourceSubmissionFileId	\N	string
194	submissionFileId	42	int
194	fileId	22	int
194	submissionId	9	int
194	username	fperini	string
194	originalFileName	Internet, openness and the future of the.pdf	string
194	name	Internet, openness and the future of the.pdf	string
195	fileStage	2	int
195	sourceSubmissionFileId	\N	string
195	submissionFileId	43	int
195	fileId	23	int
195	submissionId	9	int
195	originalFileName	Imagining the Internet: Open, closed or .pdf	string
195	username	fperini	string
196	fileStage	2	int
196	submissionFileId	43	int
196	fileId	23	int
196	submissionId	9	int
196	username	fperini	string
196	name	Imagining the Internet: Open, closed or .pdf	string
197	fileStage	2	int
197	sourceSubmissionFileId	\N	string
197	submissionFileId	43	int
197	fileId	23	int
197	submissionId	9	int
197	originalFileName	Imagining the Internet: Open, closed or .pdf	string
197	username	fperini	string
198	fileStage	2	int
198	sourceSubmissionFileId	\N	string
198	submissionFileId	43	int
198	fileId	23	int
198	submissionId	9	int
198	username	fperini	string
198	originalFileName	Imagining the Internet: Open, closed or .pdf	string
198	name	Imagining the Internet: Open, closed or .pdf	string
199	fileStage	2	int
199	sourceSubmissionFileId	\N	string
199	submissionFileId	44	int
199	fileId	24	int
199	submissionId	9	int
199	originalFileName	The internet in LAC will remain free, pu.pdf	string
199	username	fperini	string
200	fileStage	2	int
200	submissionFileId	44	int
200	fileId	24	int
200	submissionId	9	int
200	username	fperini	string
200	name	The internet in LAC will remain free, pu.pdf	string
201	fileStage	2	int
201	sourceSubmissionFileId	\N	string
201	submissionFileId	44	int
201	fileId	24	int
201	submissionId	9	int
201	originalFileName	The internet in LAC will remain free, pu.pdf	string
201	username	fperini	string
202	fileStage	2	int
202	sourceSubmissionFileId	\N	string
202	submissionFileId	44	int
202	fileId	24	int
202	submissionId	9	int
202	username	fperini	string
202	originalFileName	The internet in LAC will remain free, pu.pdf	string
202	name	The internet in LAC will remain free, pu.pdf	string
203	fileStage	2	int
203	sourceSubmissionFileId	\N	string
203	submissionFileId	45	int
203	fileId	25	int
203	submissionId	9	int
203	originalFileName	Free Internet?.pdf	string
203	username	fperini	string
204	fileStage	2	int
204	submissionFileId	45	int
204	fileId	25	int
204	submissionId	9	int
204	username	fperini	string
204	name	Free Internet?.pdf	string
205	fileStage	2	int
205	sourceSubmissionFileId	\N	string
205	submissionFileId	45	int
205	fileId	25	int
205	submissionId	9	int
205	originalFileName	Free Internet?.pdf	string
205	username	fperini	string
206	fileStage	2	int
206	sourceSubmissionFileId	\N	string
206	submissionFileId	45	int
206	fileId	25	int
206	submissionId	9	int
206	username	fperini	string
206	originalFileName	Free Internet?.pdf	string
206	name	Free Internet?.pdf	string
207	fileStage	2	int
207	sourceSubmissionFileId	\N	string
207	submissionFileId	46	int
207	fileId	26	int
207	submissionId	9	int
207	originalFileName	Risks and challenges for freedom of expr.pdf	string
207	username	fperini	string
208	fileStage	2	int
208	submissionFileId	46	int
208	fileId	26	int
208	submissionId	9	int
208	username	fperini	string
208	name	Risks and challenges for freedom of expr.pdf	string
209	fileStage	2	int
209	sourceSubmissionFileId	\N	string
209	submissionFileId	46	int
209	fileId	26	int
209	submissionId	9	int
209	originalFileName	Risks and challenges for freedom of expr.pdf	string
209	username	fperini	string
210	fileStage	2	int
210	sourceSubmissionFileId	\N	string
210	submissionFileId	46	int
210	fileId	26	int
210	submissionId	9	int
210	username	fperini	string
210	originalFileName	Risks and challenges for freedom of expr.pdf	string
210	name	Risks and challenges for freedom of expr.pdf	string
213	editorId	3	int
213	editorName	Daniel Barnes	string
213	submissionId	9	int
213	decision	1	int
214	fileStage	19	int
214	sourceSubmissionFileId	46	int
214	submissionFileId	47	int
214	fileId	26	int
214	submissionId	9	int
214	originalFileName	Risks and challenges for freedom of expr.pdf	string
214	username	dbarnes	string
215	fileStage	19	int
215	submissionFileId	47	int
215	fileId	26	int
215	submissionId	9	int
215	username	dbarnes	string
215	name	Risks and challenges for freedom of expr.pdf	string
216	fileStage	19	int
216	sourceSubmissionFileId	45	int
216	submissionFileId	48	int
216	fileId	25	int
216	submissionId	9	int
216	originalFileName	Free Internet?.pdf	string
216	username	dbarnes	string
217	fileStage	19	int
217	submissionFileId	48	int
217	fileId	25	int
217	submissionId	9	int
217	username	dbarnes	string
217	name	Free Internet?.pdf	string
218	fileStage	19	int
218	sourceSubmissionFileId	42	int
218	submissionFileId	49	int
218	fileId	22	int
218	submissionId	9	int
218	originalFileName	Internet, openness and the future of the.pdf	string
218	username	dbarnes	string
219	fileStage	19	int
219	submissionFileId	49	int
219	fileId	22	int
219	submissionId	9	int
219	username	dbarnes	string
219	name	Internet, openness and the future of the.pdf	string
220	fileStage	19	int
220	sourceSubmissionFileId	43	int
220	submissionFileId	50	int
220	fileId	23	int
220	submissionId	9	int
220	originalFileName	Imagining the Internet: Open, closed or .pdf	string
220	username	dbarnes	string
221	fileStage	19	int
221	submissionFileId	50	int
221	fileId	23	int
221	submissionId	9	int
221	username	dbarnes	string
221	name	Imagining the Internet: Open, closed or .pdf	string
222	fileStage	19	int
222	sourceSubmissionFileId	44	int
222	submissionFileId	51	int
222	fileId	24	int
222	submissionId	9	int
222	originalFileName	The internet in LAC will remain free, pu.pdf	string
222	username	dbarnes	string
223	fileStage	19	int
223	submissionFileId	51	int
223	fileId	24	int
223	submissionId	9	int
223	username	dbarnes	string
223	name	The internet in LAC will remain free, pu.pdf	string
225	fileStage	2	int
225	sourceSubmissionFileId	\N	string
225	submissionFileId	52	int
225	fileId	27	int
225	submissionId	10	int
225	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
225	username	jbrower	string
226	fileStage	2	int
226	submissionFileId	52	int
226	fileId	27	int
226	submissionId	10	int
226	username	jbrower	string
226	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
227	fileStage	2	int
227	sourceSubmissionFileId	\N	string
227	submissionFileId	52	int
227	fileId	27	int
227	submissionId	10	int
227	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
227	username	jbrower	string
228	fileStage	2	int
228	sourceSubmissionFileId	\N	string
228	submissionFileId	52	int
228	fileId	27	int
228	submissionId	10	int
228	username	jbrower	string
228	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
228	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
232	fileStage	2	int
232	sourceSubmissionFileId	\N	string
232	submissionFileId	53	int
232	fileId	28	int
232	submissionId	11	int
232	originalFileName	Dreamwork.pdf	string
232	username	jlockehart	string
233	fileStage	2	int
233	submissionFileId	53	int
233	fileId	28	int
233	submissionId	11	int
233	username	jlockehart	string
233	name	Dreamwork.pdf	string
234	fileStage	2	int
234	sourceSubmissionFileId	\N	string
234	submissionFileId	53	int
234	fileId	28	int
234	submissionId	11	int
234	originalFileName	Dreamwork.pdf	string
234	username	jlockehart	string
235	fileStage	2	int
235	sourceSubmissionFileId	\N	string
235	submissionFileId	53	int
235	fileId	28	int
235	submissionId	11	int
235	username	jlockehart	string
235	originalFileName	Dreamwork.pdf	string
235	name	Dreamwork.pdf	string
238	editorId	3	int
238	editorName	Daniel Barnes	string
238	submissionId	11	int
238	decision	1	int
239	fileStage	19	int
239	sourceSubmissionFileId	53	int
239	submissionFileId	54	int
239	fileId	28	int
239	submissionId	11	int
239	originalFileName	Dreamwork.pdf	string
239	username	dbarnes	string
240	fileStage	19	int
240	submissionFileId	54	int
240	fileId	28	int
240	submissionId	11	int
240	username	dbarnes	string
240	name	Dreamwork.pdf	string
241	reviewAssignmentId	9	string
241	reviewerName	Aisla McCrae	string
241	submissionId	11	int
241	stageId	2	int
241	round	1	int
242	editorId	3	int
242	editorName	Daniel Barnes	string
242	submissionId	11	int
242	decision	3	int
243	reviewAssignmentId	10	string
243	reviewerName	Adela Gallego	string
243	submissionId	11	int
243	stageId	3	int
243	round	1	int
244	reviewAssignmentId	11	string
244	reviewerName	Gonzalo Favio	string
244	submissionId	11	int
244	stageId	3	int
244	round	1	int
245	reviewAssignmentId	10	int
245	reviewerName	Adela Gallego	string
245	submissionId	11	int
245	round	1	int
246	reviewAssignmentId	10	int
246	reviewerName	Adela Gallego	string
246	submissionId	11	int
246	round	1	int
247	reviewAssignmentId	11	int
247	reviewerName	Gonzalo Favio	string
247	submissionId	11	int
247	round	1	int
248	reviewAssignmentId	11	int
248	reviewerName	Gonzalo Favio	string
248	submissionId	11	int
248	round	1	int
249	editorId	3	int
249	editorName	Daniel Barnes	string
249	submissionId	11	int
249	decision	2	int
250	recipientCount	2	int
250	subject	Thank you for your review	string
252	fileStage	2	int
252	sourceSubmissionFileId	\N	string
252	submissionFileId	55	int
252	fileId	29	int
252	submissionId	12	int
252	originalFileName	Catalyzing Access through Social and Tec.pdf	string
252	username	lelder	string
253	fileStage	2	int
253	submissionFileId	55	int
253	fileId	29	int
253	submissionId	12	int
253	username	lelder	string
253	name	Catalyzing Access through Social and Tec.pdf	string
254	fileStage	2	int
254	sourceSubmissionFileId	\N	string
254	submissionFileId	55	int
254	fileId	29	int
254	submissionId	12	int
254	originalFileName	Catalyzing Access through Social and Tec.pdf	string
254	username	lelder	string
255	fileStage	2	int
255	sourceSubmissionFileId	\N	string
255	submissionFileId	55	int
255	fileId	29	int
255	submissionId	12	int
255	username	lelder	string
255	originalFileName	Catalyzing Access through Social and Tec.pdf	string
255	name	Catalyzing Access through Social and Tec.pdf	string
256	fileStage	2	int
256	sourceSubmissionFileId	\N	string
256	submissionFileId	56	int
256	fileId	30	int
256	submissionId	12	int
256	originalFileName	Catalyzing Access via Telecommunications.pdf	string
256	username	lelder	string
257	fileStage	2	int
257	submissionFileId	56	int
257	fileId	30	int
257	submissionId	12	int
257	username	lelder	string
257	name	Catalyzing Access via Telecommunications.pdf	string
258	fileStage	2	int
258	sourceSubmissionFileId	\N	string
258	submissionFileId	56	int
258	fileId	30	int
258	submissionId	12	int
258	originalFileName	Catalyzing Access via Telecommunications.pdf	string
258	username	lelder	string
259	fileStage	2	int
259	sourceSubmissionFileId	\N	string
259	submissionFileId	56	int
259	fileId	30	int
259	submissionId	12	int
259	username	lelder	string
259	originalFileName	Catalyzing Access via Telecommunications.pdf	string
259	name	Catalyzing Access via Telecommunications.pdf	string
260	fileStage	2	int
260	sourceSubmissionFileId	\N	string
260	submissionFileId	57	int
260	fileId	31	int
260	submissionId	12	int
260	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
260	username	lelder	string
261	fileStage	2	int
261	submissionFileId	57	int
261	fileId	31	int
261	submissionId	12	int
261	username	lelder	string
261	name	Access to Knowledge as a New Paradigm fo.pdf	string
262	fileStage	2	int
262	sourceSubmissionFileId	\N	string
262	submissionFileId	57	int
262	fileId	31	int
262	submissionId	12	int
262	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
262	username	lelder	string
263	fileStage	2	int
263	sourceSubmissionFileId	\N	string
263	submissionFileId	57	int
263	fileId	31	int
263	submissionId	12	int
263	username	lelder	string
263	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
263	name	Access to Knowledge as a New Paradigm fo.pdf	string
266	editorId	3	int
266	editorName	Daniel Barnes	string
266	submissionId	12	int
266	decision	1	int
267	fileStage	19	int
267	sourceSubmissionFileId	57	int
267	submissionFileId	58	int
267	fileId	31	int
267	submissionId	12	int
267	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
267	username	dbarnes	string
268	fileStage	19	int
268	submissionFileId	58	int
268	fileId	31	int
268	submissionId	12	int
268	username	dbarnes	string
268	name	Access to Knowledge as a New Paradigm fo.pdf	string
269	fileStage	19	int
269	sourceSubmissionFileId	55	int
269	submissionFileId	59	int
269	fileId	29	int
269	submissionId	12	int
269	originalFileName	Catalyzing Access through Social and Tec.pdf	string
269	username	dbarnes	string
270	fileStage	19	int
270	submissionFileId	59	int
270	fileId	29	int
270	submissionId	12	int
270	username	dbarnes	string
270	name	Catalyzing Access through Social and Tec.pdf	string
271	fileStage	19	int
271	sourceSubmissionFileId	56	int
271	submissionFileId	60	int
271	fileId	30	int
271	submissionId	12	int
271	originalFileName	Catalyzing Access via Telecommunications.pdf	string
271	username	dbarnes	string
272	fileStage	19	int
272	submissionFileId	60	int
272	fileId	30	int
272	submissionId	12	int
272	username	dbarnes	string
272	name	Catalyzing Access via Telecommunications.pdf	string
273	reviewAssignmentId	12	string
273	reviewerName	Julie Janssen	string
273	submissionId	12	int
273	stageId	2	int
273	round	1	int
274	reviewAssignmentId	13	string
274	reviewerName	Paul Hudson	string
274	submissionId	12	int
274	stageId	2	int
274	round	1	int
275	reviewAssignmentId	14	string
275	reviewerName	Aisla McCrae	string
275	submissionId	12	int
275	stageId	2	int
275	round	1	int
276	reviewAssignmentId	13	int
276	reviewerName	Paul Hudson	string
276	submissionId	12	int
276	round	1	int
277	reviewAssignmentId	13	int
277	reviewerName	Paul Hudson	string
277	submissionId	12	int
277	round	1	int
279	fileStage	2	int
279	sourceSubmissionFileId	\N	string
279	submissionFileId	61	int
279	fileId	32	int
279	submissionId	13	int
279	originalFileName	Current State of Mobile Learning.pdf	string
279	username	mally	string
280	fileStage	2	int
280	submissionFileId	61	int
280	fileId	32	int
280	submissionId	13	int
280	username	mally	string
280	name	Current State of Mobile Learning.pdf	string
281	fileStage	2	int
281	sourceSubmissionFileId	\N	string
281	submissionFileId	61	int
281	fileId	32	int
281	submissionId	13	int
281	originalFileName	Current State of Mobile Learning.pdf	string
281	username	mally	string
282	fileStage	2	int
282	sourceSubmissionFileId	\N	string
282	submissionFileId	61	int
282	fileId	32	int
282	submissionId	13	int
282	username	mally	string
282	originalFileName	Current State of Mobile Learning.pdf	string
282	name	Current State of Mobile Learning.pdf	string
283	fileStage	2	int
283	sourceSubmissionFileId	\N	string
283	submissionFileId	62	int
283	fileId	33	int
283	submissionId	13	int
283	originalFileName	A Model for Framing Mobile Learning.pdf	string
283	username	mally	string
284	fileStage	2	int
284	submissionFileId	62	int
284	fileId	33	int
284	submissionId	13	int
284	username	mally	string
284	name	A Model for Framing Mobile Learning.pdf	string
285	fileStage	2	int
285	sourceSubmissionFileId	\N	string
285	submissionFileId	62	int
285	fileId	33	int
285	submissionId	13	int
285	originalFileName	A Model for Framing Mobile Learning.pdf	string
285	username	mally	string
286	fileStage	2	int
286	sourceSubmissionFileId	\N	string
286	submissionFileId	62	int
286	fileId	33	int
286	submissionId	13	int
286	username	mally	string
286	originalFileName	A Model for Framing Mobile Learning.pdf	string
286	name	A Model for Framing Mobile Learning.pdf	string
287	fileStage	2	int
287	sourceSubmissionFileId	\N	string
287	submissionFileId	63	int
287	fileId	34	int
287	submissionId	13	int
287	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
287	username	mally	string
288	fileStage	2	int
288	submissionFileId	63	int
288	fileId	34	int
288	submissionId	13	int
288	username	mally	string
288	name	Mobile Distance Learning with PDAs: Deve.pdf	string
289	fileStage	2	int
289	sourceSubmissionFileId	\N	string
289	submissionFileId	63	int
289	fileId	34	int
289	submissionId	13	int
289	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
289	username	mally	string
290	fileStage	2	int
290	sourceSubmissionFileId	\N	string
290	submissionFileId	63	int
290	fileId	34	int
290	submissionId	13	int
290	username	mally	string
290	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
290	name	Mobile Distance Learning with PDAs: Deve.pdf	string
293	editorId	3	int
293	editorName	Daniel Barnes	string
293	submissionId	13	int
293	decision	1	int
294	fileStage	19	int
294	sourceSubmissionFileId	63	int
294	submissionFileId	64	int
294	fileId	34	int
294	submissionId	13	int
294	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
294	username	dbarnes	string
295	fileStage	19	int
295	submissionFileId	64	int
295	fileId	34	int
295	submissionId	13	int
295	username	dbarnes	string
295	name	Mobile Distance Learning with PDAs: Deve.pdf	string
296	fileStage	19	int
296	sourceSubmissionFileId	61	int
296	submissionFileId	65	int
296	fileId	32	int
296	submissionId	13	int
296	originalFileName	Current State of Mobile Learning.pdf	string
296	username	dbarnes	string
297	fileStage	19	int
297	submissionFileId	65	int
297	fileId	32	int
297	submissionId	13	int
297	username	dbarnes	string
297	name	Current State of Mobile Learning.pdf	string
298	fileStage	19	int
298	sourceSubmissionFileId	62	int
298	submissionFileId	66	int
298	fileId	33	int
298	submissionId	13	int
298	originalFileName	A Model for Framing Mobile Learning.pdf	string
298	username	dbarnes	string
299	fileStage	19	int
299	submissionFileId	66	int
299	fileId	33	int
299	submissionId	13	int
299	username	dbarnes	string
299	name	A Model for Framing Mobile Learning.pdf	string
300	reviewAssignmentId	15	string
300	reviewerName	Paul Hudson	string
300	submissionId	13	int
300	stageId	2	int
300	round	1	int
301	editorId	3	int
301	editorName	Daniel Barnes	string
301	submissionId	13	int
301	decision	3	int
302	reviewAssignmentId	16	string
302	reviewerName	Adela Gallego	string
302	submissionId	13	int
302	stageId	3	int
302	round	1	int
303	reviewAssignmentId	17	string
303	reviewerName	Al Zacharia	string
303	submissionId	13	int
303	stageId	3	int
303	round	1	int
304	reviewAssignmentId	18	string
304	reviewerName	Gonzalo Favio	string
304	submissionId	13	int
304	stageId	3	int
304	round	1	int
305	reviewAssignmentId	16	int
305	reviewerName	Adela Gallego	string
305	submissionId	13	int
305	round	1	int
306	reviewAssignmentId	16	int
306	reviewerName	Adela Gallego	string
306	submissionId	13	int
306	round	1	int
307	reviewAssignmentId	18	int
307	reviewerName	Gonzalo Favio	string
307	submissionId	13	int
307	round	1	int
308	reviewAssignmentId	18	int
308	reviewerName	Gonzalo Favio	string
308	submissionId	13	int
308	round	1	int
309	editorId	3	int
309	editorName	Daniel Barnes	string
309	submissionId	13	int
309	decision	2	int
310	recipientCount	2	int
310	subject	Thank you for your review	string
312	fileStage	2	int
312	sourceSubmissionFileId	\N	string
312	submissionFileId	67	int
312	fileId	35	int
312	submissionId	14	int
312	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
312	username	mdawson	string
313	fileStage	2	int
313	submissionFileId	67	int
313	fileId	35	int
313	submissionId	14	int
313	username	mdawson	string
313	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
314	fileStage	2	int
314	sourceSubmissionFileId	\N	string
314	submissionFileId	67	int
314	fileId	35	int
314	submissionId	14	int
314	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
314	username	mdawson	string
315	fileStage	2	int
315	sourceSubmissionFileId	\N	string
315	submissionFileId	67	int
315	fileId	35	int
315	submissionId	14	int
315	username	mdawson	string
315	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
315	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
316	fileStage	2	int
316	sourceSubmissionFileId	\N	string
316	submissionFileId	68	int
316	fileId	36	int
316	submissionId	14	int
316	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
316	username	mdawson	string
317	fileStage	2	int
317	submissionFileId	68	int
317	fileId	36	int
317	submissionId	14	int
317	username	mdawson	string
317	name	Chapter 2: Classical Music and the Class.pdf	string
318	fileStage	2	int
318	sourceSubmissionFileId	\N	string
318	submissionFileId	68	int
318	fileId	36	int
318	submissionId	14	int
318	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
318	username	mdawson	string
319	fileStage	2	int
319	sourceSubmissionFileId	\N	string
319	submissionFileId	68	int
319	fileId	36	int
319	submissionId	14	int
319	username	mdawson	string
319	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
319	name	Chapter 2: Classical Music and the Class.pdf	string
320	fileStage	2	int
320	sourceSubmissionFileId	\N	string
320	submissionFileId	69	int
320	fileId	37	int
320	submissionId	14	int
320	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
320	username	mdawson	string
321	fileStage	2	int
321	submissionFileId	69	int
321	fileId	37	int
321	submissionId	14	int
321	username	mdawson	string
321	name	Chapter 3: Situated Cognition and Bricol.pdf	string
322	fileStage	2	int
322	sourceSubmissionFileId	\N	string
322	submissionFileId	69	int
322	fileId	37	int
322	submissionId	14	int
322	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
322	username	mdawson	string
323	fileStage	2	int
323	sourceSubmissionFileId	\N	string
323	submissionFileId	69	int
323	fileId	37	int
323	submissionId	14	int
323	username	mdawson	string
323	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
323	name	Chapter 3: Situated Cognition and Bricol.pdf	string
324	fileStage	2	int
324	sourceSubmissionFileId	\N	string
324	submissionFileId	70	int
324	fileId	38	int
324	submissionId	14	int
324	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
324	username	mdawson	string
325	fileStage	2	int
325	submissionFileId	70	int
325	fileId	38	int
325	submissionId	14	int
325	username	mdawson	string
325	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
326	fileStage	2	int
326	sourceSubmissionFileId	\N	string
326	submissionFileId	70	int
326	fileId	38	int
326	submissionId	14	int
326	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
326	username	mdawson	string
327	fileStage	2	int
327	sourceSubmissionFileId	\N	string
327	submissionFileId	70	int
327	fileId	38	int
327	submissionId	14	int
327	username	mdawson	string
327	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
327	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
328	fileStage	2	int
328	sourceSubmissionFileId	\N	string
328	submissionFileId	71	int
328	fileId	39	int
328	submissionId	14	int
328	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
328	username	mdawson	string
329	fileStage	2	int
329	submissionFileId	71	int
329	fileId	39	int
329	submissionId	14	int
329	username	mdawson	string
329	name	Segmentation of Vascular Ultrasound Imag.pdf	string
330	fileStage	2	int
330	sourceSubmissionFileId	\N	string
330	submissionFileId	71	int
330	fileId	39	int
330	submissionId	14	int
330	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
330	username	mdawson	string
331	fileStage	2	int
331	sourceSubmissionFileId	\N	string
331	submissionFileId	71	int
331	fileId	39	int
331	submissionId	14	int
331	username	mdawson	string
331	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
331	name	Segmentation of Vascular Ultrasound Imag.pdf	string
332	fileStage	2	int
332	sourceSubmissionFileId	\N	string
332	submissionFileId	72	int
332	fileId	40	int
332	submissionId	14	int
332	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
332	username	mdawson	string
333	fileStage	2	int
333	submissionFileId	72	int
333	fileId	40	int
333	submissionId	14	int
333	username	mdawson	string
333	name	The Canadian Nutrient File: Nutrient Val.pdf	string
334	fileStage	2	int
334	sourceSubmissionFileId	\N	string
334	submissionFileId	72	int
334	fileId	40	int
334	submissionId	14	int
334	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
334	username	mdawson	string
335	fileStage	2	int
335	sourceSubmissionFileId	\N	string
335	submissionFileId	72	int
335	fileId	40	int
335	submissionId	14	int
335	username	mdawson	string
335	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
335	name	The Canadian Nutrient File: Nutrient Val.pdf	string
338	editorId	3	int
338	editorName	Daniel Barnes	string
338	submissionId	14	int
338	decision	1	int
339	fileStage	19	int
339	sourceSubmissionFileId	72	int
339	submissionFileId	73	int
339	fileId	40	int
339	submissionId	14	int
339	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
339	username	dbarnes	string
340	fileStage	19	int
340	submissionFileId	73	int
340	fileId	40	int
340	submissionId	14	int
340	username	dbarnes	string
340	name	The Canadian Nutrient File: Nutrient Val.pdf	string
341	fileStage	19	int
341	sourceSubmissionFileId	71	int
341	submissionFileId	74	int
341	fileId	39	int
341	submissionId	14	int
341	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
341	username	dbarnes	string
342	fileStage	19	int
342	submissionFileId	74	int
342	fileId	39	int
342	submissionId	14	int
342	username	dbarnes	string
342	name	Segmentation of Vascular Ultrasound Imag.pdf	string
343	fileStage	19	int
343	sourceSubmissionFileId	70	int
343	submissionFileId	75	int
343	fileId	38	int
343	submissionId	14	int
343	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
343	username	dbarnes	string
344	fileStage	19	int
344	submissionFileId	75	int
344	fileId	38	int
344	submissionId	14	int
344	username	dbarnes	string
344	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
345	fileStage	19	int
345	sourceSubmissionFileId	68	int
345	submissionFileId	76	int
345	fileId	36	int
345	submissionId	14	int
345	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
345	username	dbarnes	string
346	fileStage	19	int
346	submissionFileId	76	int
346	fileId	36	int
346	submissionId	14	int
346	username	dbarnes	string
346	name	Chapter 2: Classical Music and the Class.pdf	string
347	fileStage	19	int
347	sourceSubmissionFileId	69	int
347	submissionFileId	77	int
347	fileId	37	int
347	submissionId	14	int
347	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
347	username	dbarnes	string
348	fileStage	19	int
348	submissionFileId	77	int
348	fileId	37	int
348	submissionId	14	int
348	username	dbarnes	string
348	name	Chapter 3: Situated Cognition and Bricol.pdf	string
349	fileStage	19	int
349	sourceSubmissionFileId	67	int
349	submissionFileId	78	int
349	fileId	35	int
349	submissionId	14	int
349	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
349	username	dbarnes	string
350	fileStage	19	int
350	submissionFileId	78	int
350	fileId	35	int
350	submissionId	14	int
350	username	dbarnes	string
350	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
351	reviewAssignmentId	19	string
351	reviewerName	Julie Janssen	string
351	submissionId	14	int
351	stageId	2	int
351	round	1	int
352	editorId	3	int
352	editorName	Daniel Barnes	string
352	submissionId	14	int
352	decision	3	int
353	reviewAssignmentId	20	string
353	reviewerName	Al Zacharia	string
353	submissionId	14	int
353	stageId	3	int
353	round	1	int
354	editorId	3	int
354	editorName	Daniel Barnes	string
354	submissionId	14	int
354	decision	2	int
355	name	Maria Fritz	string
355	username	mfritz	string
355	userGroupName	Copyeditor	string
356	editorId	3	int
356	editorName	Daniel Barnes	string
356	submissionId	14	int
356	decision	7	int
357	name	Graham Cox	string
357	username	gcox	string
357	userGroupName	Layout Editor	string
358	name	Sabine Kumar	string
358	username	skumar	string
358	userGroupName	Proofreader	string
359	formatName	PDF	string
360	fileStage	10	int
360	sourceSubmissionFileId	72	int
360	submissionFileId	79	int
360	fileId	40	int
360	submissionId	14	int
360	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
360	username	dbarnes	string
361	fileStage	10	int
361	submissionFileId	79	int
361	fileId	40	int
361	submissionId	14	int
361	username	dbarnes	string
361	name	The Canadian Nutrient File: Nutrient Val.pdf	string
362	fileStage	10	int
362	sourceSubmissionFileId	71	int
362	submissionFileId	80	int
362	fileId	39	int
362	submissionId	14	int
362	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
362	username	dbarnes	string
363	fileStage	10	int
363	submissionFileId	80	int
363	fileId	39	int
363	submissionId	14	int
363	username	dbarnes	string
363	name	Segmentation of Vascular Ultrasound Imag.pdf	string
364	fileStage	10	int
364	sourceSubmissionFileId	70	int
364	submissionFileId	81	int
364	fileId	38	int
364	submissionId	14	int
364	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
364	username	dbarnes	string
365	fileStage	10	int
365	submissionFileId	81	int
365	fileId	38	int
365	submissionId	14	int
365	username	dbarnes	string
365	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
366	fileStage	10	int
366	sourceSubmissionFileId	68	int
366	submissionFileId	82	int
366	fileId	36	int
366	submissionId	14	int
366	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
366	username	dbarnes	string
367	fileStage	10	int
367	submissionFileId	82	int
367	fileId	36	int
367	submissionId	14	int
367	username	dbarnes	string
367	name	Chapter 2: Classical Music and the Class.pdf	string
368	fileStage	10	int
368	sourceSubmissionFileId	69	int
368	submissionFileId	83	int
368	fileId	37	int
368	submissionId	14	int
368	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
368	username	dbarnes	string
369	fileStage	10	int
369	submissionFileId	83	int
369	fileId	37	int
369	submissionId	14	int
369	username	dbarnes	string
369	name	Chapter 3: Situated Cognition and Bricol.pdf	string
370	fileStage	10	int
370	sourceSubmissionFileId	67	int
370	submissionFileId	84	int
370	fileId	35	int
370	submissionId	14	int
370	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
370	username	dbarnes	string
371	fileStage	10	int
371	submissionFileId	84	int
371	fileId	35	int
371	submissionId	14	int
371	username	dbarnes	string
371	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
372	publicationFormatName	PDF	string
373	publicationFormatName	PDF	string
374	fileStage	10	int
374	sourceSubmissionFileId	67	int
374	submissionFileId	84	int
374	fileId	35	int
374	submissionId	14	int
374	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
374	username	dbarnes	string
375	fileStage	10	int
375	sourceSubmissionFileId	67	int
375	submissionFileId	84	int
375	fileId	35	int
375	submissionId	14	int
375	username	dbarnes	string
375	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
375	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
376	file	Chapter 1: Mind Control—Internal or Exte.pdf	string
376	name	Daniel Barnes	string
376	username	dbarnes	string
377	fileStage	10	int
377	sourceSubmissionFileId	67	int
377	submissionFileId	84	int
377	fileId	35	int
377	submissionId	14	int
377	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
377	username	dbarnes	string
378	fileStage	10	int
378	sourceSubmissionFileId	67	int
378	submissionFileId	84	int
378	fileId	35	int
378	submissionId	14	int
378	username	dbarnes	string
378	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
378	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
379	fileStage	10	int
379	sourceSubmissionFileId	68	int
379	submissionFileId	82	int
379	fileId	36	int
379	submissionId	14	int
379	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
379	username	dbarnes	string
380	fileStage	10	int
380	sourceSubmissionFileId	68	int
380	submissionFileId	82	int
380	fileId	36	int
380	submissionId	14	int
380	username	dbarnes	string
380	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
380	name	Chapter 2: Classical Music and the Class.pdf	string
381	file	Chapter 2: Classical Music and the Class.pdf	string
381	name	Daniel Barnes	string
381	username	dbarnes	string
382	fileStage	10	int
382	sourceSubmissionFileId	68	int
382	submissionFileId	82	int
382	fileId	36	int
382	submissionId	14	int
382	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
382	username	dbarnes	string
383	fileStage	10	int
383	sourceSubmissionFileId	68	int
383	submissionFileId	82	int
383	fileId	36	int
383	submissionId	14	int
383	username	dbarnes	string
383	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
383	name	Chapter 2: Classical Music and the Class.pdf	string
384	fileStage	10	int
384	sourceSubmissionFileId	69	int
384	submissionFileId	83	int
384	fileId	37	int
384	submissionId	14	int
384	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
384	username	dbarnes	string
385	fileStage	10	int
385	sourceSubmissionFileId	69	int
385	submissionFileId	83	int
385	fileId	37	int
385	submissionId	14	int
385	username	dbarnes	string
385	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
385	name	Chapter 3: Situated Cognition and Bricol.pdf	string
386	file	Chapter 3: Situated Cognition and Bricol.pdf	string
386	name	Daniel Barnes	string
386	username	dbarnes	string
387	fileStage	10	int
387	sourceSubmissionFileId	69	int
387	submissionFileId	83	int
387	fileId	37	int
387	submissionId	14	int
387	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
387	username	dbarnes	string
388	fileStage	10	int
388	sourceSubmissionFileId	69	int
388	submissionFileId	83	int
388	fileId	37	int
388	submissionId	14	int
388	username	dbarnes	string
388	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
388	name	Chapter 3: Situated Cognition and Bricol.pdf	string
389	fileStage	10	int
389	sourceSubmissionFileId	70	int
389	submissionFileId	81	int
389	fileId	38	int
389	submissionId	14	int
389	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
389	username	dbarnes	string
390	fileStage	10	int
390	sourceSubmissionFileId	70	int
390	submissionFileId	81	int
390	fileId	38	int
390	submissionId	14	int
390	username	dbarnes	string
390	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
390	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
391	file	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
391	name	Daniel Barnes	string
391	username	dbarnes	string
392	fileStage	10	int
392	sourceSubmissionFileId	70	int
392	submissionFileId	81	int
392	fileId	38	int
392	submissionId	14	int
392	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
392	username	dbarnes	string
393	fileStage	10	int
393	sourceSubmissionFileId	70	int
393	submissionFileId	81	int
393	fileId	38	int
393	submissionId	14	int
393	username	dbarnes	string
393	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
393	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
394	fileStage	10	int
394	sourceSubmissionFileId	71	int
394	submissionFileId	80	int
394	fileId	39	int
394	submissionId	14	int
394	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
394	username	dbarnes	string
395	fileStage	10	int
395	sourceSubmissionFileId	71	int
395	submissionFileId	80	int
395	fileId	39	int
395	submissionId	14	int
395	username	dbarnes	string
395	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
395	name	Segmentation of Vascular Ultrasound Imag.pdf	string
396	file	Segmentation of Vascular Ultrasound Imag.pdf	string
396	name	Daniel Barnes	string
396	username	dbarnes	string
397	fileStage	10	int
397	sourceSubmissionFileId	71	int
397	submissionFileId	80	int
397	fileId	39	int
397	submissionId	14	int
397	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
397	username	dbarnes	string
398	fileStage	10	int
398	sourceSubmissionFileId	71	int
398	submissionFileId	80	int
398	fileId	39	int
398	submissionId	14	int
398	username	dbarnes	string
398	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
398	name	Segmentation of Vascular Ultrasound Imag.pdf	string
399	fileStage	10	int
399	sourceSubmissionFileId	72	int
399	submissionFileId	79	int
399	fileId	40	int
399	submissionId	14	int
399	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
399	username	dbarnes	string
400	fileStage	10	int
400	sourceSubmissionFileId	72	int
400	submissionFileId	79	int
400	fileId	40	int
400	submissionId	14	int
400	username	dbarnes	string
400	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
400	name	The Canadian Nutrient File: Nutrient Val.pdf	string
401	file	The Canadian Nutrient File: Nutrient Val.pdf	string
401	name	Daniel Barnes	string
401	username	dbarnes	string
402	fileStage	10	int
402	sourceSubmissionFileId	72	int
402	submissionFileId	79	int
402	fileId	40	int
402	submissionId	14	int
402	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
402	username	dbarnes	string
403	fileStage	10	int
403	sourceSubmissionFileId	72	int
403	submissionFileId	79	int
403	fileId	40	int
403	submissionId	14	int
403	username	dbarnes	string
403	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
403	name	The Canadian Nutrient File: Nutrient Val.pdf	string
406	fileStage	2	int
406	sourceSubmissionFileId	\N	string
406	submissionFileId	85	int
406	fileId	41	int
406	submissionId	15	int
406	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
406	username	mforan	string
407	fileStage	2	int
407	submissionFileId	85	int
407	fileId	41	int
407	submissionId	15	int
407	username	mforan	string
407	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
408	fileStage	2	int
408	sourceSubmissionFileId	\N	string
408	submissionFileId	85	int
408	fileId	41	int
408	submissionId	15	int
408	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
408	username	mforan	string
409	fileStage	2	int
409	sourceSubmissionFileId	\N	string
409	submissionFileId	85	int
409	fileId	41	int
409	submissionId	15	int
409	username	mforan	string
409	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
409	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
412	editorId	3	int
412	editorName	Daniel Barnes	string
412	submissionId	15	int
412	decision	23	int
413	fileStage	4	int
413	sourceSubmissionFileId	85	int
413	submissionFileId	86	int
413	fileId	41	int
413	submissionId	15	int
413	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
413	username	dbarnes	string
414	fileStage	4	int
414	submissionFileId	86	int
414	fileId	41	int
414	submissionId	15	int
414	username	dbarnes	string
414	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
416	fileStage	2	int
416	sourceSubmissionFileId	\N	string
416	submissionFileId	87	int
416	fileId	42	int
416	submissionId	16	int
416	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
416	username	mpower	string
417	fileStage	2	int
417	submissionFileId	87	int
417	fileId	42	int
417	submissionId	16	int
417	username	mpower	string
417	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
418	fileStage	2	int
418	sourceSubmissionFileId	\N	string
418	submissionFileId	87	int
418	fileId	42	int
418	submissionId	16	int
418	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
418	username	mpower	string
419	fileStage	2	int
419	sourceSubmissionFileId	\N	string
419	submissionFileId	87	int
419	fileId	42	int
419	submissionId	16	int
419	username	mpower	string
419	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
419	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
422	editorId	3	int
422	editorName	Daniel Barnes	string
422	submissionId	16	int
422	decision	23	int
423	fileStage	4	int
423	sourceSubmissionFileId	87	int
423	submissionFileId	88	int
423	fileId	42	int
423	submissionId	16	int
423	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
423	username	dbarnes	string
424	fileStage	4	int
424	submissionFileId	88	int
424	fileId	42	int
424	submissionId	16	int
424	username	dbarnes	string
424	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
425	reviewAssignmentId	21	string
425	reviewerName	Adela Gallego	string
425	submissionId	16	int
425	stageId	3	int
425	round	1	int
426	reviewAssignmentId	22	string
426	reviewerName	Al Zacharia	string
426	submissionId	16	int
426	stageId	3	int
426	round	1	int
427	reviewAssignmentId	23	string
427	reviewerName	Gonzalo Favio	string
427	submissionId	16	int
427	stageId	3	int
427	round	1	int
428	reviewAssignmentId	21	int
428	reviewerName	Adela Gallego	string
428	submissionId	16	int
428	round	1	int
429	reviewAssignmentId	21	int
429	reviewerName	Adela Gallego	string
429	submissionId	16	int
429	round	1	int
431	fileStage	2	int
431	sourceSubmissionFileId	\N	string
431	submissionFileId	89	int
431	fileId	43	int
431	submissionId	17	int
431	originalFileName	Preface.pdf	string
431	username	msmith	string
432	fileStage	2	int
432	submissionFileId	89	int
432	fileId	43	int
432	submissionId	17	int
432	username	msmith	string
432	name	Preface.pdf	string
433	fileStage	2	int
433	sourceSubmissionFileId	\N	string
433	submissionFileId	89	int
433	fileId	43	int
433	submissionId	17	int
433	originalFileName	Preface.pdf	string
433	username	msmith	string
434	fileStage	2	int
434	sourceSubmissionFileId	\N	string
434	submissionFileId	89	int
434	fileId	43	int
434	submissionId	17	int
434	username	msmith	string
434	originalFileName	Preface.pdf	string
434	name	Preface.pdf	string
435	fileStage	2	int
435	sourceSubmissionFileId	\N	string
435	submissionFileId	90	int
435	fileId	44	int
435	submissionId	17	int
435	originalFileName	Introduction.pdf	string
435	username	msmith	string
436	fileStage	2	int
436	submissionFileId	90	int
436	fileId	44	int
436	submissionId	17	int
436	username	msmith	string
436	name	Introduction.pdf	string
437	fileStage	2	int
437	sourceSubmissionFileId	\N	string
437	submissionFileId	90	int
437	fileId	44	int
437	submissionId	17	int
437	originalFileName	Introduction.pdf	string
437	username	msmith	string
438	fileStage	2	int
438	sourceSubmissionFileId	\N	string
438	submissionFileId	90	int
438	fileId	44	int
438	submissionId	17	int
438	username	msmith	string
438	originalFileName	Introduction.pdf	string
438	name	Introduction.pdf	string
439	fileStage	2	int
439	sourceSubmissionFileId	\N	string
439	submissionFileId	91	int
439	fileId	45	int
439	submissionId	17	int
439	originalFileName	The Emergence of Open Development in a N.pdf	string
439	username	msmith	string
440	fileStage	2	int
440	submissionFileId	91	int
440	fileId	45	int
440	submissionId	17	int
440	username	msmith	string
440	name	The Emergence of Open Development in a N.pdf	string
441	fileStage	2	int
441	sourceSubmissionFileId	\N	string
441	submissionFileId	91	int
441	fileId	45	int
441	submissionId	17	int
441	originalFileName	The Emergence of Open Development in a N.pdf	string
441	username	msmith	string
442	fileStage	2	int
442	sourceSubmissionFileId	\N	string
442	submissionFileId	91	int
442	fileId	45	int
442	submissionId	17	int
442	username	msmith	string
442	originalFileName	The Emergence of Open Development in a N.pdf	string
442	name	The Emergence of Open Development in a N.pdf	string
443	fileStage	2	int
443	sourceSubmissionFileId	\N	string
443	submissionFileId	92	int
443	fileId	46	int
443	submissionId	17	int
443	originalFileName	Enacting Openness in ICT4D Research.pdf	string
443	username	msmith	string
444	fileStage	2	int
444	submissionFileId	92	int
444	fileId	46	int
444	submissionId	17	int
444	username	msmith	string
444	name	Enacting Openness in ICT4D Research.pdf	string
445	fileStage	2	int
445	sourceSubmissionFileId	\N	string
445	submissionFileId	92	int
445	fileId	46	int
445	submissionId	17	int
445	originalFileName	Enacting Openness in ICT4D Research.pdf	string
445	username	msmith	string
446	fileStage	2	int
446	sourceSubmissionFileId	\N	string
446	submissionFileId	92	int
446	fileId	46	int
446	submissionId	17	int
446	username	msmith	string
446	originalFileName	Enacting Openness in ICT4D Research.pdf	string
446	name	Enacting Openness in ICT4D Research.pdf	string
447	fileStage	2	int
447	sourceSubmissionFileId	\N	string
447	submissionFileId	93	int
447	fileId	47	int
447	submissionId	17	int
447	originalFileName	Transparency and Development: Ethical Co.pdf	string
447	username	msmith	string
448	fileStage	2	int
448	submissionFileId	93	int
448	fileId	47	int
448	submissionId	17	int
448	username	msmith	string
448	name	Transparency and Development: Ethical Co.pdf	string
449	fileStage	2	int
449	sourceSubmissionFileId	\N	string
449	submissionFileId	93	int
449	fileId	47	int
449	submissionId	17	int
449	originalFileName	Transparency and Development: Ethical Co.pdf	string
449	username	msmith	string
450	fileStage	2	int
450	sourceSubmissionFileId	\N	string
450	submissionFileId	93	int
450	fileId	47	int
450	submissionId	17	int
450	username	msmith	string
450	originalFileName	Transparency and Development: Ethical Co.pdf	string
450	name	Transparency and Development: Ethical Co.pdf	string
451	fileStage	2	int
451	sourceSubmissionFileId	\N	string
451	submissionFileId	94	int
451	fileId	48	int
451	submissionId	17	int
451	originalFileName	Open Educational Resources: Opportunitie.pdf	string
451	username	msmith	string
452	fileStage	2	int
452	submissionFileId	94	int
452	fileId	48	int
452	submissionId	17	int
452	username	msmith	string
452	name	Open Educational Resources: Opportunitie.pdf	string
453	fileStage	2	int
453	sourceSubmissionFileId	\N	string
453	submissionFileId	94	int
453	fileId	48	int
453	submissionId	17	int
453	originalFileName	Open Educational Resources: Opportunitie.pdf	string
453	username	msmith	string
454	fileStage	2	int
454	sourceSubmissionFileId	\N	string
454	submissionFileId	94	int
454	fileId	48	int
454	submissionId	17	int
454	username	msmith	string
454	originalFileName	Open Educational Resources: Opportunitie.pdf	string
454	name	Open Educational Resources: Opportunitie.pdf	string
457	editorId	3	int
457	editorName	Daniel Barnes	string
457	submissionId	17	int
457	decision	1	int
458	fileStage	19	int
458	sourceSubmissionFileId	93	int
458	submissionFileId	95	int
458	fileId	47	int
458	submissionId	17	int
458	originalFileName	Transparency and Development: Ethical Co.pdf	string
458	username	dbarnes	string
459	fileStage	19	int
459	submissionFileId	95	int
459	fileId	47	int
459	submissionId	17	int
459	username	dbarnes	string
459	name	Transparency and Development: Ethical Co.pdf	string
460	fileStage	19	int
460	sourceSubmissionFileId	94	int
460	submissionFileId	96	int
460	fileId	48	int
460	submissionId	17	int
460	originalFileName	Open Educational Resources: Opportunitie.pdf	string
460	username	dbarnes	string
461	fileStage	19	int
461	submissionFileId	96	int
461	fileId	48	int
461	submissionId	17	int
461	username	dbarnes	string
461	name	Open Educational Resources: Opportunitie.pdf	string
462	fileStage	19	int
462	sourceSubmissionFileId	92	int
462	submissionFileId	97	int
462	fileId	46	int
462	submissionId	17	int
462	originalFileName	Enacting Openness in ICT4D Research.pdf	string
462	username	dbarnes	string
463	fileStage	19	int
463	submissionFileId	97	int
463	fileId	46	int
463	submissionId	17	int
463	username	dbarnes	string
463	name	Enacting Openness in ICT4D Research.pdf	string
464	fileStage	19	int
464	sourceSubmissionFileId	89	int
464	submissionFileId	98	int
464	fileId	43	int
464	submissionId	17	int
464	originalFileName	Preface.pdf	string
464	username	dbarnes	string
465	fileStage	19	int
465	submissionFileId	98	int
465	fileId	43	int
465	submissionId	17	int
465	username	dbarnes	string
465	name	Preface.pdf	string
466	fileStage	19	int
466	sourceSubmissionFileId	90	int
466	submissionFileId	99	int
466	fileId	44	int
466	submissionId	17	int
466	originalFileName	Introduction.pdf	string
466	username	dbarnes	string
467	fileStage	19	int
467	submissionFileId	99	int
467	fileId	44	int
467	submissionId	17	int
467	username	dbarnes	string
467	name	Introduction.pdf	string
468	fileStage	19	int
468	sourceSubmissionFileId	91	int
468	submissionFileId	100	int
468	fileId	45	int
468	submissionId	17	int
468	originalFileName	The Emergence of Open Development in a N.pdf	string
468	username	dbarnes	string
469	fileStage	19	int
469	submissionFileId	100	int
469	fileId	45	int
469	submissionId	17	int
469	username	dbarnes	string
469	name	The Emergence of Open Development in a N.pdf	string
470	reviewAssignmentId	24	string
470	reviewerName	Julie Janssen	string
470	submissionId	17	int
470	stageId	2	int
470	round	1	int
471	reviewAssignmentId	25	string
471	reviewerName	Paul Hudson	string
471	submissionId	17	int
471	stageId	2	int
471	round	1	int
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.features (submission_id, assoc_type, assoc_id, seq) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	presses/1/monographs/1/628e78e063d9f.pdf	application/pdf
2	presses/1/monographs/2/628e7929396a3.pdf	application/pdf
3	presses/1/monographs/2/628e7929a6f0d.pdf	application/pdf
4	presses/1/monographs/2/628e792a226bb.pdf	application/pdf
5	presses/1/monographs/2/628e792a9464f.pdf	application/pdf
6	presses/1/monographs/3/628e79d82bbbf.pdf	application/pdf
7	presses/1/monographs/4/628e7a08ea23b.pdf	application/pdf
8	presses/1/monographs/4/628e7a0962f19.pdf	application/pdf
9	presses/1/monographs/4/628e7a09d35d6.pdf	application/pdf
10	presses/1/monographs/4/628e7a0a8f552.pdf	application/pdf
11	presses/1/monographs/5/628e7af1b51b9.pdf	application/pdf
12	presses/1/monographs/6/628e7ba4985b1.pdf	application/pdf
13	presses/1/monographs/6/628e7ba517c90.pdf	application/pdf
14	presses/1/monographs/6/628e7ba596420.pdf	application/pdf
15	presses/1/monographs/6/628e7ba63f530.pdf	application/pdf
16	presses/1/monographs/7/628e7c3a11bdb.pdf	application/pdf
17	presses/1/monographs/7/628e7c3a7a5bf.pdf	application/pdf
18	presses/1/monographs/7/628e7c3aedac2.pdf	application/pdf
19	presses/1/monographs/7/628e7c3b9f1cd.pdf	application/pdf
20	presses/1/monographs/7/628e7c3c4bef3.pdf	application/pdf
21	presses/1/monographs/8/628e7cfadb55f.pdf	application/pdf
22	presses/1/monographs/9/628e7d0a00d06.pdf	application/pdf
23	presses/1/monographs/9/628e7d0a78047.pdf	application/pdf
24	presses/1/monographs/9/628e7d0ae7d7f.pdf	application/pdf
25	presses/1/monographs/9/628e7d0b7759c.pdf	application/pdf
26	presses/1/monographs/9/628e7d0c249ee.pdf	application/pdf
27	presses/1/monographs/10/628e7d9a0345a.pdf	application/pdf
28	presses/1/monographs/11/628e7de3f205b.pdf	application/pdf
29	presses/1/monographs/12/628e7e6756b53.pdf	application/pdf
30	presses/1/monographs/12/628e7e67ca2b0.pdf	application/pdf
31	presses/1/monographs/12/628e7e684e049.pdf	application/pdf
32	presses/1/monographs/13/628e7f1f7a409.pdf	application/pdf
33	presses/1/monographs/13/628e7f1fee978.pdf	application/pdf
34	presses/1/monographs/13/628e7f206eecb.pdf	application/pdf
35	presses/1/monographs/14/628e7ff8c46e3.pdf	application/pdf
36	presses/1/monographs/14/628e7ff9467dc.pdf	application/pdf
37	presses/1/monographs/14/628e7ff9e4637.pdf	application/pdf
38	presses/1/monographs/14/628e7ffa7f124.pdf	application/pdf
39	presses/1/monographs/14/628e7ffb10c5b.pdf	application/pdf
40	presses/1/monographs/14/628e7ffc078a6.pdf	application/pdf
41	presses/1/monographs/15/628e811dbc02e.pdf	application/pdf
42	presses/1/monographs/16/628e815266ca1.pdf	application/pdf
43	presses/1/monographs/17/628e81b9f269c.pdf	application/pdf
44	presses/1/monographs/17/628e81ba6da2b.pdf	application/pdf
45	presses/1/monographs/17/628e81badd51f.pdf	application/pdf
46	presses/1/monographs/17/628e81bb68134.pdf	application/pdf
47	presses/1/monographs/17/628e81bc2ddf0.pdf	application/pdf
48	presses/1/monographs/17/628e81bcb35e4.pdf	application/pdf
\.


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 48, true);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	publicationFormat=>dc11	plugins.metadata.dc11.publicationFormatAdapter.displayName	plugins.metadata.dc11.publicationFormatAdapter.description	class::classes.publicationFormat.PublicationFormat	metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)
2	user=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.user.User[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
3	user-xml=>user	plugins.importexport.users.displayName	plugins.importexport.users.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::classes.users.User[]
4	usergroup=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.security.UserGroup[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
5	user-xml=>usergroup	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::lib.pkp.classes.security.UserGroup[]
6	monographs=>onix30-xml	plugins.importexport.onix30.displayName	plugins.importexport.onix30.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)
7	monograph=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
8	native-xml=>monograph	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.submission.Submission[]
9	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.author.Author[]	xml::schema(plugins/importexport/native/native.xsd)
10	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.author.Author[]
11	publication-format=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publicationFormat.PublicationFormat	xml::schema(plugins/importexport/native/native.xsd)
12	native-xml=>PublicationFormat	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publicationFormat.PublicationFormat[]
13	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submissionFile.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
14	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submissionFile.SubmissionFile
15	monograph=>onix30-xml	plugins.importexport.onix30.displayName	plugins.importexport.onix30.description	class::classes.submission.Submission	xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)
16	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
17	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication[]
18	chapter=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.monograph.Chapter[]	xml::schema(plugins/importexport/native/native.xsd)
19	native-xml=>chapter	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Chapter
\.


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 19, true);


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
2	2	0	User XML user export	lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter	0	0	0
3	3	0	User XML user import	lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter	0	0	0
4	4	0	Native XML user group export	lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter	0	0	0
5	5	0	Native XML user group import	lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter	0	0	0
6	6	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
7	7	0	Native XML submission export	plugins.importexport.native.filter.MonographNativeXmlFilter	0	0	0
8	8	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlMonographFilter	0	0	0
9	9	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
10	10	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
11	11	0	Native XML representation export	plugins.importexport.native.filter.PublicationFormatNativeXmlFilter	0	0	0
12	12	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlPublicationFormatFilter	0	0	0
13	14	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlMonographFileFilter	0	0	0
14	13	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
15	15	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
16	16	0	Native XML Publication export	plugins.importexport.native.filter.PublicationNativeXmlFilter	0	0	0
17	17	0	Native XML publication import	plugins.importexport.native.filter.NativeXmlPublicationFilter	0	0	0
18	18	0	Native XML chapter export	plugins.importexport.native.filter.ChapterNativeXmlFilter	0	0	0
19	19	0	Native XML Chapter import	plugins.importexport.native.filter.NativeXmlChapterFilter	0	0	0
\.


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 19, true);


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
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 15, true);


--
-- Data for Name: identification_codes; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.identification_codes (identification_code_id, publication_format_id, code, value) FROM stdin;
1	1	02	951-98548-9-4
2	1	15	978-951-98548-9-2
\.


--
-- Name: identification_codes_identification_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.identification_codes_identification_code_id_seq', 2, true);


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
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 2, true);


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
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.library_files_file_id_seq', 1, false);


--
-- Data for Name: markets; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.markets (market_id, publication_format_id, countries_included, countries_excluded, regions_included, regions_excluded, market_date_role, market_date_format, market_date, price, discount, price_type_code, currency_code, tax_rate_code, tax_type_code, agent_id, supplier_id) FROM stdin;
\.


--
-- Name: markets_market_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.markets_market_id_seq', 1, false);


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
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.metadata_descriptions_metadata_description_id_seq', 1, false);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics (load_id, context_id, pkp_section_id, assoc_object_type, assoc_object_id, submission_id, representation_id, assoc_type, assoc_id, day, month, file_type, country_id, region, city, metric_type, metric) FROM stdin;
\.


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 22, true);


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
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.navigation_menu_items_navigation_menu_item_id_seq', 23, true);


--
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	0	user	User Navigation Menu
2	1	user	User Navigation Menu
3	1	primary	Primary Navigation Menu
\.


--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.navigation_menus_navigation_menu_id_seq', 3, true);


--
-- Data for Name: new_releases; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.new_releases (submission_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notes (note_id, assoc_type, assoc_id, user_id, date_created, date_modified, title, contents) FROM stdin;
1	1048586	1	6	2022-05-25 18:57:30	2022-05-25 18:57:30	Editor Recommendation	<p>Dear Daniel Barnes,</p><p>After considering the reviewers' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is:<br />Accept Submission.</p><p>Please visit the submission's <a href="http://localhost/index.php/publicknowledge/workflow/index/6/2">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>
\.


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 1, true);


--
-- Data for Name: notification_mail_list; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notification_mail_list (notification_mail_list_id, email, confirmed, token, context) FROM stdin;
\.


--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notification_mail_list_notification_mail_list_id_seq', 1, false);


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
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 16, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.notifications (notification_id, context_id, user_id, level, type, date_created, date_read, assoc_type, assoc_id) FROM stdin;
100	1	0	2	16777236	2022-05-25 18:53:28	2022-05-25 18:53:33	523	5
102	1	8	3	16777227	2022-05-25 18:53:39	\N	517	6
37	1	3	2	16777217	2022-05-25 18:46:50	\N	1048585	2
39	1	0	2	16777243	2022-05-25 18:46:50	\N	1048585	2
40	1	0	2	16777245	2022-05-25 18:46:50	\N	1048585	2
104	1	0	2	16777236	2022-05-25 18:53:45	2022-05-25 18:53:51	523	6
106	1	12	3	16777227	2022-05-25 18:53:58	\N	517	7
75	1	0	2	16777236	2022-05-25 18:50:23	2022-05-25 18:50:29	523	3
43	1	0	2	16777236	2022-05-25 18:47:10	2022-05-25 18:47:18	523	2
44	1	11	3	16777227	2022-05-25 18:47:26	\N	517	2
200	1	3	2	16777217	2022-05-25 19:04:54	\N	1048585	10
77	1	9	3	16777227	2022-05-25 18:50:37	\N	517	4
46	1	12	3	16777227	2022-05-25 18:47:38	\N	517	3
11	1	3	2	16777217	2022-05-25 18:44:02	\N	1048585	1
13	1	0	2	16777243	2022-05-25 18:44:02	\N	1048585	1
14	1	0	2	16777245	2022-05-25 18:44:02	\N	1048585	1
127	1	3	2	16777217	2022-05-25 18:56:38	\N	1048585	6
16	1	0	2	16777236	2022-05-25 18:44:16	2022-05-25 18:44:21	523	1
17	1	12	3	16777227	2022-05-25 18:44:28	\N	517	1
19	1	19	2	16777230	2022-05-25 18:44:34	\N	1048585	1
20	1	3	2	16777251	2022-05-25 18:44:34	2022-05-25 18:44:38	1048585	1
111	1	23	2	16777235	2022-05-25 18:54:27	\N	1048585	5
112	1	3	2	16777254	2022-05-25 18:54:27	\N	1048585	5
79	1	0	2	16777236	2022-05-25 18:50:44	2022-05-25 18:50:51	523	4
129	1	0	2	16777243	2022-05-25 18:56:38	\N	1048585	6
81	1	11	3	16777227	2022-05-25 18:50:59	\N	517	5
53	1	3	2	16777217	2022-05-25 18:48:28	\N	1048585	3
55	1	0	2	16777243	2022-05-25 18:48:28	\N	1048585	3
56	1	0	2	16777245	2022-05-25 18:48:28	\N	1048585	3
130	1	0	2	16777245	2022-05-25 18:56:38	\N	1048585	6
202	1	0	2	16777243	2022-05-25 19:04:55	\N	1048585	10
115	1	0	2	16777246	2022-05-25 18:55:18	\N	1048585	5
183	1	3	2	16777217	2022-05-25 19:03:13	\N	1048585	9
185	1	0	2	16777243	2022-05-25 19:03:13	\N	1048585	9
186	1	0	2	16777245	2022-05-25 19:03:13	\N	1048585	9
203	1	0	2	16777245	2022-05-25 19:04:55	\N	1048585	10
86	1	22	2	16777235	2022-05-25 18:51:32	\N	1048585	4
189	1	0	2	16777236	2022-05-25 19:03:35	\N	523	9
87	1	3	2	16777254	2022-05-25 18:51:32	\N	1048585	4
134	1	24	2	16777229	2022-05-25 18:56:57	\N	1048585	6
72	1	0	2	16777245	2022-05-25 18:50:04	2022-05-25 18:51:41	1048585	4
190	1	26	2	16777229	2022-05-25 19:03:35	\N	1048585	9
133	1	0	2	16777236	2022-05-25 18:56:57	2022-05-25 18:57:05	523	7
69	1	3	2	16777217	2022-05-25 18:50:04	\N	1048585	4
71	1	0	2	16777243	2022-05-25 18:50:04	\N	1048585	4
369	1	3	2	16777217	2022-05-25 19:24:06	\N	1048585	17
136	1	3	3	16777249	2022-05-25 18:57:30	\N	1048586	1
212	1	0	2	16777236	2022-05-25 19:05:33	2022-05-25 19:05:37	523	10
152	1	3	2	16777217	2022-05-25 18:59:59	\N	1048585	7
214	1	9	3	16777227	2022-05-25 19:05:44	\N	517	9
207	1	3	2	16777217	2022-05-25 19:05:19	\N	1048585	11
154	1	0	2	16777243	2022-05-25 18:59:59	\N	1048585	7
209	1	0	2	16777243	2022-05-25 19:05:19	\N	1048585	11
155	1	0	2	16777245	2022-05-25 18:59:59	\N	1048585	7
95	1	3	2	16777217	2022-05-25 18:53:12	\N	1048585	5
210	1	0	2	16777245	2022-05-25 19:05:19	\N	1048585	11
226	1	28	2	16777230	2022-05-25 19:07:01	\N	1048585	11
216	1	0	2	16777236	2022-05-25 19:05:49	2022-05-25 19:05:54	523	11
224	1	3	2	16777219	2022-05-25 19:06:38	\N	517	11
222	1	3	2	16777219	2022-05-25 19:06:24	\N	517	10
158	1	0	2	16777236	2022-05-25 19:00:19	2022-05-25 19:00:27	523	8
159	1	10	3	16777227	2022-05-25 19:00:36	\N	517	8
161	1	25	2	16777230	2022-05-25 19:00:45	\N	1048585	7
162	1	3	2	16777251	2022-05-25 19:00:45	2022-05-25 19:00:52	1048585	7
227	1	3	2	16777251	2022-05-25 19:07:01	2022-05-25 19:07:06	1048585	11
164	1	3	2	16777217	2022-05-25 19:01:17	\N	1048585	8
166	1	0	2	16777243	2022-05-25 19:01:17	\N	1048585	8
167	1	0	2	16777245	2022-05-25 19:01:17	\N	1048585	8
241	1	3	2	16777217	2022-05-25 19:08:52	\N	1048585	12
243	1	0	2	16777243	2022-05-25 19:08:52	\N	1048585	12
244	1	0	2	16777245	2022-05-25 19:08:52	\N	1048585	12
248	1	29	2	16777229	2022-05-25 19:09:14	\N	1048585	12
247	1	0	2	16777236	2022-05-25 19:09:14	2022-05-25 19:09:21	523	12
249	1	7	3	16777227	2022-05-25 19:09:29	\N	517	12
253	1	9	3	16777227	2022-05-25 19:09:50	\N	517	14
255	1	3	2	16777219	2022-05-25 19:10:08	\N	517	13
266	1	3	2	16777217	2022-05-25 19:11:22	\N	1048585	13
268	1	0	2	16777243	2022-05-25 19:11:22	\N	1048585	13
269	1	0	2	16777245	2022-05-25 19:11:22	\N	1048585	13
272	1	0	2	16777236	2022-05-25 19:11:40	2022-05-25 19:11:46	523	13
274	1	8	3	16777227	2022-05-25 19:11:54	\N	517	15
318	1	3	2	16777254	2022-05-25 19:16:42	\N	1048585	14
276	1	0	2	16777236	2022-05-25 19:12:01	2022-05-25 19:12:08	523	14
280	1	11	3	16777227	2022-05-25 19:12:27	\N	517	17
284	1	3	2	16777219	2022-05-25 19:12:54	\N	517	16
286	1	3	2	16777219	2022-05-25 19:13:10	\N	517	18
288	1	30	2	16777230	2022-05-25 19:13:39	\N	1048585	13
289	1	3	2	16777251	2022-05-25 19:13:39	2022-05-25 19:13:47	1048585	13
321	1	0	2	16777246	2022-05-25 19:18:38	\N	1048585	14
371	1	0	2	16777243	2022-05-25 19:24:07	\N	1048585	17
372	1	0	2	16777245	2022-05-25 19:24:07	\N	1048585	17
376	1	34	2	16777229	2022-05-25 19:24:33	\N	1048585	17
325	1	3	2	16777217	2022-05-25 19:19:14	\N	1048585	15
375	1	0	2	16777236	2022-05-25 19:24:33	2022-05-25 19:24:41	523	19
377	1	7	3	16777227	2022-05-25 19:24:51	\N	517	24
327	1	0	2	16777243	2022-05-25 19:19:14	\N	1048585	15
300	1	3	2	16777217	2022-05-25 19:15:11	\N	1048585	14
379	1	8	3	16777227	2022-05-25 19:25:04	\N	517	25
328	1	0	2	16777245	2022-05-25 19:19:14	\N	1048585	15
306	1	0	2	16777236	2022-05-25 19:15:31	2022-05-25 19:15:38	523	15
308	1	7	3	16777227	2022-05-25 19:15:45	\N	517	19
310	1	0	2	16777236	2022-05-25 19:15:53	2022-05-25 19:16:00	523	16
312	1	11	3	16777227	2022-05-25 19:16:08	\N	517	20
330	1	0	2	16777236	2022-05-25 19:19:30	\N	523	17
317	1	31	2	16777235	2022-05-25 19:16:42	\N	1048585	14
336	1	3	2	16777217	2022-05-25 19:20:14	\N	1048585	16
338	1	0	2	16777243	2022-05-25 19:20:14	\N	1048585	16
339	1	0	2	16777245	2022-05-25 19:20:14	\N	1048585	16
341	1	0	2	16777236	2022-05-25 19:20:31	2022-05-25 19:20:36	523	18
344	1	11	3	16777227	2022-05-25 19:20:51	\N	517	22
346	1	12	3	16777227	2022-05-25 19:21:00	\N	517	23
348	1	3	2	16777219	2022-05-25 19:21:16	\N	517	21
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 380, true);


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
usageeventplugin	0	enabled	1	bool
tinymceplugin	0	enabled	1	bool
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	["city","region"]	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
acronplugin	0	enabled	1	bool
acronplugin	0	crontab	[{"className":"plugins.generic.usageStats.UsageStatsLoader","frequency":{"hour":24},"args":["autoStage"]},{"className":"lib.pkp.classes.task.ReviewReminder","frequency":{"hour":24},"args":[]},{"className":"lib.pkp.classes.task.PublishSubmissions","frequency":{"hour":24},"args":[]},{"className":"lib.pkp.classes.task.StatisticsReport","frequency":{"day":"1"},"args":[]},{"className":"lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers","frequency":{"day":"1"},"args":[]}]	object
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
developedbyblockplugin	0	context	1	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
languagetoggleblockplugin	0	context	1	int
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
dublincoremetaplugin	1	enabled	1	bool
pdfjsviewerplugin	1	enabled	1	bool
htmlmonographfileplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	displayItems	1	bool
googlescholarplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	628e76fb20daf	string
defaultthemeplugin	1	useHomepageImageAsHeader	false	string
defaultthemeplugin	1	showCatalogSeriesListing	false	string
\.


--
-- Data for Name: press_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.press_settings (press_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	acronym	JPK	\N
1		country	IS	\N
1		defaultReviewMode	2	\N
1	en_US	name	Public Knowledge Press	\N
1	fr_CA	name	Press de la connaissance du public	\N
1		notifyAllAuthors	1	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	fr_CA	privacyStatement	<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d'autres fins ou transmis à une tierce partie.</p>	\N
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this press. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	authorInformation	Interested in submitting to this press? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About the Press</a> page for the press' section policies and <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> with the press prior to submitting, or if already registered can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the 5 step process.	\N
1	fr_CA	authorInformation	Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href="http://localhost/index.php/publicknowledge/about">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Lignes directrices à l'intention des auteurs-es</a>. Les auteurs-es doivent <a href="http://localhost/index.php/publicknowledge/user/register">s'inscrire</a> auprès de la presse avant d'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href="http://localhost/index.php/index/login">d'ouvrir une session</a> pour débuter la procédure en 5 étapes.	\N
1		emailSignature	<br/><hr /><br/><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto: {$contactEmail}">{$contactEmail}</a></p>	\N
1		enableDois	1	\N
1		doiSuffixType	default	\N
1		registrationAgency		\N
1		disableSubmissions	0	\N
1		itemsPerPage	25	\N
1		keywords	request	\N
1	en_US	openAccessPolicy	This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	openAccessPolicy	Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l'échelle mondiale.	\N
1	en_US	privacyStatement	<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>	\N
1	fr_CA	readerInformation	Nous encourageons les lecteurs à s'abonner au service d'avis de publication de cette presse. Utilisez le lien <a href="http://localhost/index.php/publicknowledge/user/register">d'inscription</a> situé en haut de la page d'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d'affirmer qu'elle compte un certain nombre de lecteurs. Consultez <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">l'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d'autres fins.	\N
1	en_US	librarianInformation	We encourage research librarians to list this press among their library's electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1	fr_CA	librarianInformation	Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		themePluginPath	default	\N
1		type	enable	\N
1		coverThumbnailsMaxWidth	106	\N
1		coverThumbnailsMaxHeight	100	\N
1		doiCreationTime	copyEditCreationTime	\N
1		paymentPluginName	ManualPayment	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	searchDescription	Public Knowledge Press is a publisher dedicated to the subject of public access to science.	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor)."},{"order":2,"content":"The submission file is in the Microsoft Word, RTF, or OpenDocument file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\" target=\\"_blank\\">Author Guidelines<\\/a>, which is found in About the Press."}]	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"Cette soumission n'a jamais été publiée et n'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef)."},{"order":2,"content":"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument."},{"order":3,"content":"Les adresses URL des références ont été fournies si elles étaient disponibles."},{"order":4,"content":"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu'à la fin."},{"order":5,"content":"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\" target=\\"_blank\\">lignes directrices à l'intention des auteurs<\\/a>, disponibles dans la rubrique À propos de cette presse."}]	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
\.


--
-- Data for Name: presses; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.presses (press_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en_US	1
\.


--
-- Name: presses_press_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.presses_press_id_seq', 1, true);


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
-- Name: publication_dates_publication_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.publication_dates_publication_date_id_seq', 1, false);


--
-- Data for Name: publication_format_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_format_settings (publication_format_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	PDF	string
1	fr_CA	name		string
2	en_US	name	PDF	string
2	fr_CA	name		string
3	en_US	name	PDF	string
3	fr_CA	name		string
\.


--
-- Data for Name: publication_formats; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_formats (publication_format_id, publication_id, submission_id, physical_format, entry_key, seq, file_size, front_matter, back_matter, height, height_unit_code, width, width_unit_code, thickness, thickness_unit_code, weight, weight_unit_code, product_composition_code, product_form_detail_code, country_manufacture_code, imprint, product_availability_code, technical_protection_code, returnable_indicator_code, remote_url, url_path, is_approved, is_available, doi_id) FROM stdin;
1	4	\N	0	DA	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf		0	0	\N
2	5	\N	0	DA	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			1	1	\N
3	14	\N	0	DA	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			1	1	\N
\.


--
-- Name: publication_formats_publication_format_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.publication_formats_publication_format_id_seq', 3, true);


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.publication_settings (publication_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	abstract	<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>
1	fr_CA	abstract	
1		categoryIds	[]
1	en_US	prefix	
1	fr_CA	prefix	
1	en_US	subtitle	
1	fr_CA	subtitle	
1	en_US	title	The ABCs of Human Survival: A Paradigm for Global Citizenship
1	fr_CA	title	
2	en_US	abstract	<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>
2	fr_CA	abstract	
2		categoryIds	[]
2	en_US	prefix	
2	fr_CA	prefix	
2	en_US	subtitle	
2	fr_CA	subtitle	
2	en_US	title	The West and Beyond: New Perspectives on an Imagined Region
2	fr_CA	title	
3	en_US	abstract	<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>
3	fr_CA	abstract	
3		categoryIds	[]
3	en_US	prefix	
3	fr_CA	prefix	
3	en_US	subtitle	
3	fr_CA	subtitle	
3	en_US	title	The Political Economy of Workplace Injury in Canada
3	fr_CA	title	
4	en_US	abstract	<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>
4	fr_CA	abstract	
4		categoryIds	[]
4	en_US	prefix	
4	fr_CA	prefix	
4	en_US	subtitle	
4	fr_CA	subtitle	
4	en_US	title	How Canadians Communicate: Contexts of Canadian Popular Culture
4	fr_CA	title	
5	en_US	abstract	<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>
5	fr_CA	abstract	
5		categoryIds	[]
5	en_US	copyrightHolder	Public Knowledge Press
5	fr_CA	copyrightHolder	Press de la connaissance du public
5		copyrightYear	2022
5	en_US	prefix	
5	fr_CA	prefix	
5	en_US	subtitle	
5	fr_CA	subtitle	
5	en_US	title	Bomb Canada and Other Unkind Remarks in the American Media
5	fr_CA	title	
6	en_US	abstract	<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>
6	fr_CA	abstract	
6		categoryIds	[]
6	en_US	prefix	
6	fr_CA	prefix	
6	en_US	subtitle	
6	fr_CA	subtitle	
6	en_US	title	The Information Literacy User’s Guide
6	fr_CA	title	
7	en_US	abstract	<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>
7	fr_CA	abstract	
7		categoryIds	[]
7	en_US	prefix	
7	fr_CA	prefix	
7	en_US	subtitle	
7	fr_CA	subtitle	
7	en_US	title	Accessible Elements: Teaching Science Online and at a Distance
7	fr_CA	title	
8	en_US	abstract	<p>A Note From The Publisher</p>
8	fr_CA	abstract	
8		categoryIds	[]
8	en_US	prefix	
8	fr_CA	prefix	
8	en_US	subtitle	
8	fr_CA	subtitle	
8	en_US	title	Editorial
8	fr_CA	title	
9	en_US	abstract	<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>
9	fr_CA	abstract	
9		categoryIds	[]
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
12	en_US	abstract	<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>
12	fr_CA	abstract	
12		categoryIds	[]
12	en_US	prefix	
12	fr_CA	prefix	
12	en_US	subtitle	
12	fr_CA	subtitle	
12	en_US	title	Connecting ICTs to Development
12	fr_CA	title	
13	en_US	abstract	<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>
13	fr_CA	abstract	
13		categoryIds	[]
13	en_US	prefix	
13	fr_CA	prefix	
13	en_US	subtitle	
13	fr_CA	subtitle	
13	en_US	title	Mobile Learning: Transforming the Delivery of Education and Training
13	fr_CA	title	
14	en_US	abstract	<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>
14	fr_CA	abstract	
14		categoryIds	[]
14	en_US	copyrightHolder	Public Knowledge Press
14	fr_CA	copyrightHolder	Press de la connaissance du public
14		copyrightYear	2022
14	en_US	prefix	
14	fr_CA	prefix	
14	en_US	subtitle	
14	fr_CA	subtitle	
14	en_US	title	From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots
14	fr_CA	title	
15	en_US	abstract	<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>
15	fr_CA	abstract	
15		categoryIds	[]
15	en_US	prefix	
15	fr_CA	prefix	
15	en_US	subtitle	
15	fr_CA	subtitle	
15	en_US	title	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978
15	fr_CA	title	
16	en_US	abstract	<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>
16	fr_CA	abstract	
16		categoryIds	[]
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

COPY public.publications (publication_id, date_published, last_modified, primary_contact_id, publication_date_type, publication_type, seq, series_id, series_position, submission_id, status, url_path, version, doi_id) FROM stdin;
1	\N	2022-05-25 18:44:01	1	pub	publication	0	\N	\N	1	1	\N	1	\N
2	\N	2022-05-25 18:46:48	2	pub	publication	0	\N	\N	2	1	\N	1	\N
3	\N	2022-05-25 18:48:26	10	pub	publication	0	\N	\N	3	1	\N	1	\N
4	\N	2022-05-25 18:50:02	11	pub	publication	0	\N	\N	4	1	\N	1	\N
5	2022-05-25	2022-05-25 18:55:18	15	pub	publication	0	\N	\N	5	3	\N	1	\N
6	\N	2022-05-25 18:56:36	16	pub	publication	0	\N	\N	6	1	\N	1	\N
7	\N	2022-05-25 18:59:56	20	pub	publication	0	\N	\N	7	1	\N	1	\N
8	\N	2022-05-25 19:01:16	25	pub	publication	0	\N	\N	8	1	\N	1	\N
9	\N	2022-05-25 19:03:11	26	pub	publication	0	\N	\N	9	1	\N	1	\N
10	\N	2022-05-25 19:04:53	31	pub	publication	0	\N	\N	10	1	\N	1	\N
11	\N	2022-05-25 19:05:18	32	pub	publication	0	\N	\N	11	1	\N	1	\N
12	\N	2022-05-25 19:08:50	33	pub	publication	0	\N	\N	12	1	\N	1	\N
13	\N	2022-05-25 19:11:20	41	pub	publication	0	\N	\N	13	1	\N	1	\N
14	2022-05-25	2022-05-25 19:18:38	45	pub	publication	0	\N	\N	14	3	\N	1	\N
15	\N	2022-05-25 19:19:13	48	pub	publication	0	\N	\N	15	1	\N	1	\N
16	\N	2022-05-25 19:20:13	49	pub	publication	0	\N	\N	16	1	\N	1	\N
17	\N	2022-05-25 19:24:03	50	pub	publication	0	\N	\N	17	1	\N	1	\N
\.


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 17, true);


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
1	1048585	6	2	1	\N	\N	0
\.


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.queries_query_id_seq', 1, true);


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
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.queued_payments_queued_payment_id_seq', 1, false);


--
-- Data for Name: representatives; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.representatives (representative_id, submission_id, role, representative_id_type, representative_id_value, name, phone, email, url, is_supplier) FROM stdin;
\.


--
-- Name: representatives_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.representatives_representative_id_seq', 1, false);


--
-- Data for Name: review_assignments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, unconsidered) FROM stdin;
13	12	8	\N	0	2022-05-25 19:09:39	2022-05-25 19:09:39	2022-05-25 19:10:03	2022-05-25 19:10:08	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:10:08	0	0	0	\N	\N	\N	0	12	2	2	1	4	\N	0
1	1	12	\N	\N	2022-05-25 18:44:28	2022-05-25 18:44:28	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:44:28	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0
2	2	11	\N	\N	2022-05-25 18:47:26	2022-05-25 18:47:26	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:47:26	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
3	2	12	\N	\N	2022-05-25 18:47:38	2022-05-25 18:47:38	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:47:38	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
15	13	8	\N	\N	2022-05-25 19:11:54	2022-05-25 19:11:54	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:11:54	0	0	0	\N	\N	\N	\N	13	2	2	1	1	\N	0
4	4	9	\N	\N	2022-05-25 18:50:37	2022-05-25 18:50:37	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:50:37	0	0	0	\N	\N	\N	\N	3	2	2	1	1	\N	0
5	4	11	\N	\N	2022-05-25 18:50:59	2022-05-25 18:50:59	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:50:59	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
6	5	8	\N	\N	2022-05-25 18:53:39	2022-05-25 18:53:39	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:53:39	0	0	0	\N	\N	\N	\N	5	2	2	1	1	\N	0
21	16	10	\N	0	2022-05-25 19:20:43	2022-05-25 19:20:43	2022-05-25 19:21:11	2022-05-25 19:21:16	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:21:16	0	0	0	\N	\N	\N	0	18	3	2	1	4	\N	0
7	5	12	\N	\N	2022-05-25 18:53:58	2022-05-25 18:53:58	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 18:53:58	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
8	7	10	\N	\N	2022-05-25 19:00:36	2022-05-25 19:00:36	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:00:36	0	0	0	\N	\N	\N	\N	8	3	2	1	1	\N	0
9	11	9	\N	\N	2022-05-25 19:05:44	2022-05-25 19:05:44	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:05:44	0	0	0	\N	\N	\N	\N	10	2	2	1	1	\N	0
17	13	11	\N	\N	2022-05-25 19:12:27	2022-05-25 19:12:27	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:12:27	0	0	0	\N	\N	\N	\N	14	3	2	1	1	\N	0
24	17	7	\N	\N	2022-05-25 19:24:51	2022-05-25 19:24:51	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:24:51	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0
25	17	8	\N	\N	2022-05-25 19:25:04	2022-05-25 19:25:04	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:25:04	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0
10	11	10	\N	0	2022-05-25 19:06:01	2022-05-25 19:06:01	2022-05-25 19:06:20	2022-05-25 19:06:24	2022-05-25 19:07:01	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:07:01	0	0	0	\N	\N	\N	0	11	3	2	1	4	\N	0
11	11	12	\N	0	2022-05-25 19:06:10	2022-05-25 19:06:10	2022-05-25 19:06:34	2022-05-25 19:06:38	2022-05-25 19:07:01	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:07:01	0	0	0	\N	\N	\N	0	11	3	2	1	4	\N	0
16	13	10	\N	0	2022-05-25 19:12:16	2022-05-25 19:12:16	2022-05-25 19:12:48	2022-05-25 19:12:54	2022-05-25 19:13:39	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:13:39	0	0	0	\N	\N	\N	0	14	3	2	1	4	\N	0
12	12	7	\N	\N	2022-05-25 19:09:29	2022-05-25 19:09:29	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:09:29	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0
18	13	12	\N	0	2022-05-25 19:12:37	2022-05-25 19:12:37	2022-05-25 19:13:05	2022-05-25 19:13:10	2022-05-25 19:13:39	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:13:39	0	0	0	\N	\N	\N	0	14	3	2	1	4	\N	0
14	12	9	\N	\N	2022-05-25 19:09:50	2022-05-25 19:09:50	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:09:50	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0
19	14	7	\N	\N	2022-05-25 19:15:45	2022-05-25 19:15:45	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:15:45	0	0	0	\N	\N	\N	\N	15	2	2	1	1	\N	0
20	14	11	\N	\N	2022-05-25 19:16:08	2022-05-25 19:16:08	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:16:08	0	0	0	\N	\N	\N	\N	16	3	2	1	1	\N	0
22	16	11	\N	\N	2022-05-25 19:20:51	2022-05-25 19:20:51	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:20:51	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0
23	16	12	\N	\N	2022-05-25 19:21:00	2022-05-25 19:21:01	\N	\N	\N	2022-06-22 00:00:00	2022-06-22 00:00:00	2022-05-25 19:21:01	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0
\.


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_assignments_review_id_seq', 25, true);


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_files (review_id, submission_file_id) FROM stdin;
1	2
2	10
2	9
2	8
2	7
3	10
3	9
3	8
3	7
4	19
4	18
4	17
4	16
6	21
8	36
8	37
8	38
8	39
8	40
9	54
12	58
12	59
12	60
13	58
13	59
13	60
14	58
14	59
14	60
15	64
15	65
15	66
19	78
19	73
19	74
19	75
19	76
19	77
21	88
22	88
23	88
24	95
24	96
24	97
24	98
24	99
24	100
25	95
25	96
25	97
25	98
25	99
25	100
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
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_form_elements_review_form_element_id_seq', 1, false);


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
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_forms_review_form_id_seq', 1, false);


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
5	5	2	21
6	7	2	27
6	7	2	28
6	7	2	29
6	7	2	30
7	8	3	36
7	8	3	37
7	8	3	38
7	8	3	39
7	8	3	40
9	9	2	47
9	9	2	48
9	9	2	49
9	9	2	50
9	9	2	51
11	10	2	54
12	12	2	58
12	12	2	59
12	12	2	60
13	13	2	64
13	13	2	65
13	13	2	66
14	15	2	73
14	15	2	74
14	15	2	75
14	15	2	76
14	15	2	77
14	15	2	78
15	17	3	86
16	18	3	88
17	19	2	95
17	19	2	96
17	19	2	97
17	19	2	98
17	19	2	99
17	19	2	100
\.


--
-- Data for Name: review_rounds; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.review_rounds (review_round_id, submission_id, stage_id, round, review_revision, status) FROM stdin;
17	15	3	1	\N	6
1	1	3	1	\N	4
2	2	3	1	\N	7
3	4	2	1	\N	4
18	16	3	1	\N	8
4	4	3	1	\N	4
5	5	2	1	\N	4
6	5	3	1	\N	4
7	6	2	1	\N	14
19	17	2	1	\N	7
8	7	3	1	\N	4
9	9	2	1	\N	6
10	11	2	1	\N	4
11	11	3	1	\N	4
12	12	2	1	\N	8
13	13	2	1	\N	4
14	13	3	1	\N	4
15	14	2	1	\N	4
16	14	3	1	\N	4
\.


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.review_rounds_review_round_id_seq', 19, true);


--
-- Data for Name: sales_rights; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.sales_rights (sales_rights_id, publication_format_id, type, row_setting, countries_included, countries_excluded, regions_included, regions_excluded) FROM stdin;
\.


--
-- Name: sales_rights_sales_rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.sales_rights_sales_rights_id_seq', 1, false);


--
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.scheduled_tasks (class_name, last_run) FROM stdin;
plugins.generic.usageStats.UsageStatsLoader	2022-05-25 18:35:23
lib.pkp.classes.task.ReviewReminder	2022-05-25 18:35:23
lib.pkp.classes.task.PublishSubmissions	2022-05-25 18:35:23
lib.pkp.classes.task.StatisticsReport	2022-05-25 18:35:23
lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers	2022-05-25 18:35:23
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
-- Name: series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.series_series_id_seq', 5, true);


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
1		sortOption	title-ASC	string
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
2		sortOption	title-ASC	string
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
3		sortOption	title-ASC	string
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
4		sortOption	title-ASC	string
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
5		sortOption	title-ASC	string
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
lip4rqib95a6jqh9s0q0re86mo	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653503754	1653503760	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653503760;s:5:"token";s:32:"875921934d02166c75b5c24bb1c985ba";}	localhost
6v4j36k0ko1v75nr9q3nbvlkg5	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505814	1653506028	0	csrf|a:2:{s:9:"timestamp";i:1653506028;s:5:"token";s:32:"fd72a777367be3b7ea02e44d7aeac8e4";}username|s:7:"dbarnes";userId|i:3;	localhost
77eai8e5nvt113cr39ar5cnnl4	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653503738	1653503753	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653503753;s:5:"token";s:32:"74431919b13084e4fa31ff359f8ca9b0";}	localhost
3eaa13muv8bi106np7g7roguo1	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653503761	1653503771	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653503771;s:5:"token";s:32:"3057a298fe7bd2a03e33a091329ca9d3";}	localhost
3pf6baipmg4sa6p8prtpb0upih	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505072	1653505263	0	csrf|a:2:{s:9:"timestamp";i:1653505263;s:5:"token";s:32:"524bdc7d0fc7519fb01b218807d9bb99";}username|s:7:"dbarnes";userId|i:3;	localhost
qledjrd4vn21dhnn4j206enk10	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504922	1653505068	0	csrf|a:2:{s:9:"timestamp";i:1653505068;s:5:"token";s:32:"e750aed035db6b0d1b30ff7689d71d54";}username|s:7:"dbarnes";userId|i:3;	localhost
tf2kgd8jsgkq59p3hc1cbsar3h	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653503723	1653503738	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653503738;s:5:"token";s:32:"56d7ca32d74e764ea41b20440f6d3714";}	localhost
vdg0dn95ind0l8j438s6h4dn4q	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653503771	1653503777	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653503777;s:5:"token";s:32:"d65d487cdad478250576c9f23577df8a";}	localhost
vno8pb96kiqfchce2dla7km0d2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505266	1653505278	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1653505277;s:5:"token";s:32:"ac22dacbecf2152464732a42efebf714";}	localhost
m29kpb3t4ai2ko6kd5lc47fk5e	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504214	1653504284	0	csrf|a:2:{s:9:"timestamp";i:1653504284;s:5:"token";s:32:"33bb5a235b977627970022c3196f55c0";}username|s:7:"dbarnes";userId|i:3;	localhost
gpamec3j34jta1qh8l03na1jfm	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505280	1653505422	0	csrf|a:2:{s:9:"timestamp";i:1653505422;s:5:"token";s:32:"cca974590eb33553e9afd36708729d80";}username|s:7:"dbarnes";userId|i:3;	localhost
1grvap4ku4u9s4m8h0fbu5ebr2	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653503779	1653504163	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1653504162;s:5:"token";s:32:"8c1e4f2a9494569582d86e64c51258a0";}	localhost
q69qeu05g56v8mdt46b69ldctu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504743	1653504919	0	csrf|a:2:{s:9:"timestamp";i:1653504919;s:5:"token";s:32:"5e9f8a362000e06f38c6b497e6efa865";}username|s:7:"dbarnes";userId|i:3;	localhost
vo60e27dkh68unudk374aq7i36	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504193	1653504212	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653504212;s:5:"token";s:32:"4dc7a75315ed7dc4eb7e27175f470d48";}	localhost
pce4v8lu875qsgl89ppfgrc6ck	27	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505424	1653505495	0	csrf|a:2:{s:9:"timestamp";i:1653505494;s:5:"token";s:32:"6295fda355918d5bc1e8cb4c50a544d0";}username|s:7:"jbrower";userId|i:27;	localhost
1ubvfitsrjd2de1vnpvb7qennq	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504166	1653504191	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1653504191;s:5:"token";s:32:"73d09b79d4645a1411eeeb91b56a8ff2";}	localhost
ibk67qralaqjcpf1tnntu5s042	21	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504462	1653504508	0	csrf|a:2:{s:9:"timestamp";i:1653504508;s:5:"token";s:32:"7799a5070e323a0b51034345e4901026";}username|s:10:"bbarnetson";userId|i:21;	localhost
l2jqb73rhfcoe07chomsnv9ffm	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504287	1653504459	0	csrf|a:2:{s:9:"timestamp";i:1653504458;s:5:"token";s:32:"1435ee1a86b341b7f37030abf614723b";}username|s:7:"dbarnes";userId|i:3;	localhost
76tesorf6vq53paljtb0qp43hi	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653504511	1653504741	0	csrf|a:2:{s:9:"timestamp";i:1653504741;s:5:"token";s:32:"ef85108ff6033e6bf90eda4bd3ba643c";}username|s:7:"dbarnes";userId|i:3;	localhost
23sbikvusv91b33r7neukgiinl	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505497	1653505627	0	csrf|a:2:{s:9:"timestamp";i:1653505627;s:5:"token";s:32:"783abfe9935568d97cdc64d95a9f740b";}username|s:7:"dbarnes";userId|i:3;	localhost
l52vsmgtd4781q7jft931mmdap	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653505629	1653505809	0	csrf|a:2:{s:9:"timestamp";i:1653505809;s:5:"token";s:32:"20eb5083cdf712a738237ede8cdfb835";}username|s:7:"phudson";	localhost
0711l93jr6dgmncgfvmhlh3fpu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653506030	1653506319	0	csrf|a:2:{s:9:"timestamp";i:1653506319;s:5:"token";s:32:"5e986cab781f5dfb7b3e3b70c1c95ff1";}username|s:7:"dbarnes";userId|i:3;	localhost
ve8gggq7em6o2i5qpei18gbe0k	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653506376	1653506477	0	csrf|a:2:{s:9:"timestamp";i:1653506477;s:5:"token";s:32:"6105b07047dbe5d3c0ce340e8cc00e0e";}username|s:8:"agallego";	localhost
597q3ub3of67dg9vnjdh03feej	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653506324	1653506375	0	csrf|a:2:{s:9:"timestamp";i:1653506375;s:5:"token";s:32:"7c93099af46a521a39b9877ac0279063";}username|s:7:"dbarnes";userId|i:3;	localhost
jp27ee33qn7mpvdpsto417qtub	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36	1653506480	1653506704	0	csrf|a:2:{s:9:"timestamp";i:1653506704;s:5:"token";s:32:"d89e526e46b665ed4a06e615e07cf169";}username|s:7:"dbarnes";userId|i:3;	localhost
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
-- Name: spotlights_spotlight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.spotlights_spotlight_id_seq', 1, false);


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
1	1	13	19	2022-05-25 18:43:41	0	0
2	1	3	3	2022-05-25 18:44:02	0	1
3	1	6	14	2022-05-25 18:44:43	0	0
4	2	14	20	2022-05-25 18:44:54	0	0
5	2	3	3	2022-05-25 18:46:50	0	1
6	3	13	21	2022-05-25 18:47:49	0	0
7	3	3	3	2022-05-25 18:48:28	0	1
8	4	14	22	2022-05-25 18:48:38	0	0
9	4	3	3	2022-05-25 18:50:04	0	1
10	4	6	13	2022-05-25 18:51:22	0	0
11	4	10	15	2022-05-25 18:51:50	0	0
12	5	13	23	2022-05-25 18:52:31	0	0
13	5	3	3	2022-05-25 18:53:12	0	1
14	5	6	14	2022-05-25 18:54:19	0	0
15	5	10	16	2022-05-25 18:54:41	0	0
16	5	12	17	2022-05-25 18:54:50	0	0
17	6	14	24	2022-05-25 18:55:30	0	0
18	6	3	3	2022-05-25 18:56:38	0	1
19	6	5	6	2022-05-25 18:57:11	1	1
20	7	14	25	2022-05-25 18:57:59	0	0
21	7	3	3	2022-05-25 18:59:59	0	1
22	7	6	13	2022-05-25 19:01:01	0	0
23	8	13	3	2022-05-25 19:01:12	0	0
24	8	3	3	2022-05-25 19:01:17	0	1
25	9	14	26	2022-05-25 19:01:27	0	0
26	9	3	3	2022-05-25 19:03:13	0	1
27	10	13	27	2022-05-25 19:03:51	0	0
28	10	3	3	2022-05-25 19:04:54	0	1
29	11	13	28	2022-05-25 19:05:05	0	0
30	11	3	3	2022-05-25 19:05:19	0	1
31	12	14	29	2022-05-25 19:07:16	0	0
32	12	3	3	2022-05-25 19:08:52	0	1
33	13	14	30	2022-05-25 19:10:21	0	0
34	13	3	3	2022-05-25 19:11:22	0	1
35	14	14	31	2022-05-25 19:13:58	0	0
36	14	3	3	2022-05-25 19:15:11	0	1
37	14	6	13	2022-05-25 19:16:32	0	0
38	14	10	15	2022-05-25 19:17:00	0	0
39	14	12	18	2022-05-25 19:17:11	0	0
40	15	13	32	2022-05-25 19:18:51	0	0
41	15	3	3	2022-05-25 19:19:14	0	1
42	16	13	33	2022-05-25 19:19:43	0	0
43	16	3	3	2022-05-25 19:20:14	0	1
44	17	14	34	2022-05-25 19:21:27	0	0
45	17	3	3	2022-05-25 19:24:06	0	1
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 45, true);


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
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.static_pages_static_page_id_seq', 1, false);


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
1		datePublished	\N	string
1		pages		string
1		isPageEnabled	\N	string
2	en_US	title	Axioms	string
2	fr_CA	title		string
2	en_US	subtitle		string
2	fr_CA	subtitle		string
2	en_US	abstract		string
2	fr_CA	abstract		string
2		datePublished	\N	string
2		pages		string
2		isPageEnabled	\N	string
3	en_US	title	Paradigm Shift	string
3	fr_CA	title		string
3	en_US	subtitle		string
3	fr_CA	subtitle		string
3	en_US	abstract		string
3	fr_CA	abstract		string
3		datePublished	\N	string
3		pages		string
3		isPageEnabled	\N	string
4	en_US	title	Critical History in Western Canada 1900–2000	string
4	fr_CA	title		string
4	en_US	subtitle		string
4	fr_CA	subtitle		string
4	en_US	abstract		string
4	fr_CA	abstract		string
4		datePublished	\N	string
4		pages		string
4		isPageEnabled	\N	string
5	en_US	title	Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito	string
5	fr_CA	title		string
5	en_US	subtitle		string
5	fr_CA	subtitle		string
5	en_US	abstract		string
5	fr_CA	abstract		string
5		datePublished	\N	string
5		pages		string
5		isPageEnabled	\N	string
6	en_US	title	Cree Intellectual Traditions in History	string
6	fr_CA	title		string
6	en_US	subtitle		string
6	fr_CA	subtitle		string
6	en_US	abstract		string
6	fr_CA	abstract		string
6		datePublished	\N	string
6		pages		string
6		isPageEnabled	\N	string
7	en_US	title	Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin	string
7	fr_CA	title		string
7	en_US	subtitle		string
7	fr_CA	subtitle		string
7	en_US	abstract		string
7	fr_CA	abstract		string
7		datePublished	\N	string
7		pages		string
7		isPageEnabled	\N	string
8	en_US	title	Introduction	string
8	fr_CA	title		string
8	en_US	subtitle		string
8	fr_CA	subtitle		string
8	en_US	abstract		string
8	fr_CA	abstract		string
8		datePublished	\N	string
8		pages		string
8		isPageEnabled	\N	string
9	en_US	title	Part One. Employment Relationships in Canada	string
9	fr_CA	title		string
9	en_US	subtitle		string
9	fr_CA	subtitle		string
9	en_US	abstract		string
9	fr_CA	abstract		string
9		datePublished	\N	string
9		pages		string
9		isPageEnabled	\N	string
10	en_US	title	Part Two. Preventing Workplace Injury	string
10	fr_CA	title		string
10	en_US	subtitle		string
10	fr_CA	subtitle		string
10	en_US	abstract		string
10	fr_CA	abstract		string
10		datePublished	\N	string
10		pages		string
10		isPageEnabled	\N	string
11	en_US	title	Part Three. Critique of OHS in Canada	string
11	fr_CA	title		string
11	en_US	subtitle		string
11	fr_CA	subtitle		string
11	en_US	abstract		string
11	fr_CA	abstract		string
11		datePublished	\N	string
11		pages		string
11		isPageEnabled	\N	string
12	en_US	title	Part Four. Political Economy of Preventing Workplace Injury	string
12	fr_CA	title		string
12	en_US	subtitle		string
12	fr_CA	subtitle		string
12	en_US	abstract		string
12	fr_CA	abstract		string
12		datePublished	\N	string
12		pages		string
12		isPageEnabled	\N	string
13	en_US	title	Introduction: Contexts of Popular Culture	string
13	fr_CA	title		string
13	en_US	subtitle		string
13	fr_CA	subtitle		string
13	en_US	abstract		string
13	fr_CA	abstract		string
13		datePublished	\N	string
13		pages		string
13		isPageEnabled	\N	string
14	fr_CA	title		string
14	en_US	subtitle		string
14	fr_CA	subtitle		string
14	en_US	abstract		string
14	fr_CA	abstract		string
14	en_US	title	Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics	string
14		datePublished	\N	string
14		pages		string
14		isPageEnabled	\N	string
15	en_US	title	Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use	string
15	fr_CA	title		string
15	en_US	subtitle		string
15	fr_CA	subtitle		string
15	en_US	abstract		string
15	fr_CA	abstract		string
15		datePublished	\N	string
15		pages		string
15		isPageEnabled	\N	string
16	en_US	title	Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada	string
16	fr_CA	title		string
16	en_US	subtitle		string
16	fr_CA	subtitle		string
16	en_US	abstract		string
16	fr_CA	abstract		string
16		datePublished	\N	string
16		pages		string
16		isPageEnabled	\N	string
17	en_US	title	Prologue	string
17	fr_CA	title		string
17	en_US	subtitle		string
17	fr_CA	subtitle		string
17	en_US	abstract		string
17	fr_CA	abstract		string
17		datePublished	\N	string
17		pages		string
17		isPageEnabled	\N	string
18	en_US	title	Chapter 1: The First Five Years: 1867-1872	string
18	fr_CA	title		string
18	en_US	subtitle		string
18	fr_CA	subtitle		string
18	en_US	abstract		string
18	fr_CA	abstract		string
18		datePublished	\N	string
18		pages		string
18		isPageEnabled	\N	string
19	en_US	title	Chapter 2: Free Trade or "Freedom": 1911	string
19	fr_CA	title		string
19	en_US	subtitle		string
19	fr_CA	subtitle		string
19	en_US	abstract		string
19	fr_CA	abstract		string
19		datePublished	\N	string
19		pages		string
19		isPageEnabled	\N	string
20	en_US	title	Chapter 3: Castro, Nukes & the Cold War: 1953-1968	string
20	fr_CA	title		string
20	en_US	subtitle		string
20	fr_CA	subtitle		string
20	en_US	abstract		string
20	fr_CA	abstract		string
20		datePublished	\N	string
20		pages		string
20		isPageEnabled	\N	string
21	en_US	title	Chapter 4: Enter the Intellect: 1968-1984	string
21	fr_CA	title		string
21	en_US	subtitle		string
21	fr_CA	subtitle		string
21	en_US	abstract		string
21	fr_CA	abstract		string
21		datePublished	\N	string
21		pages		string
21		isPageEnabled	\N	string
22	en_US	title	Epilogue	string
22	fr_CA	title		string
22	en_US	subtitle		string
22	fr_CA	subtitle		string
22	en_US	abstract		string
22	fr_CA	abstract		string
22		datePublished	\N	string
22		pages		string
22		isPageEnabled	\N	string
23	en_US	title	Identify: Understanding Your Information Need	string
23	fr_CA	title		string
23	en_US	subtitle		string
23	fr_CA	subtitle		string
23	en_US	abstract		string
23	fr_CA	abstract		string
23		datePublished	\N	string
23		pages		string
23		isPageEnabled	\N	string
24	en_US	title	Scope: Knowing What Is Available	string
24	fr_CA	title		string
24	en_US	subtitle		string
24	fr_CA	subtitle		string
24	en_US	abstract		string
24	fr_CA	abstract		string
24		datePublished	\N	string
24		pages		string
24		isPageEnabled	\N	string
25	en_US	title	Plan: Developing Research Strategies	string
25	fr_CA	title		string
25	en_US	subtitle		string
25	fr_CA	subtitle		string
25	en_US	abstract		string
25	fr_CA	abstract		string
25		datePublished	\N	string
25		pages		string
25		isPageEnabled	\N	string
26	en_US	title	Gather: Finding What You Need	string
26	fr_CA	title		string
26	en_US	subtitle		string
26	fr_CA	subtitle		string
26	en_US	abstract		string
26	fr_CA	abstract		string
26		datePublished	\N	string
26		pages		string
26		isPageEnabled	\N	string
27	en_US	title	Introduction	string
27	fr_CA	title		string
27	en_US	subtitle		string
27	fr_CA	subtitle		string
27	en_US	abstract		string
27	fr_CA	abstract		string
27		datePublished	\N	string
27		pages		string
27		isPageEnabled	\N	string
28	en_US	title	Chapter 1: Interactions Affording Distance Science Education	string
28	fr_CA	title		string
28	en_US	subtitle		string
28	fr_CA	subtitle		string
28	en_US	abstract		string
28	fr_CA	abstract		string
28		datePublished	\N	string
28		pages		string
28		isPageEnabled	\N	string
29	en_US	title	Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources	string
29	fr_CA	title		string
29	en_US	subtitle		string
29	fr_CA	subtitle		string
29	en_US	abstract		string
29	fr_CA	abstract		string
29		datePublished	\N	string
29		pages		string
29		isPageEnabled	\N	string
30	en_US	title	Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams	string
30	fr_CA	title		string
30	en_US	subtitle		string
30	fr_CA	subtitle		string
30	en_US	abstract		string
30	fr_CA	abstract		string
30		datePublished	\N	string
30		pages		string
30		isPageEnabled	\N	string
31	en_US	title	Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education	string
31	fr_CA	title		string
31	en_US	subtitle		string
31	fr_CA	subtitle		string
31	en_US	abstract		string
31	fr_CA	abstract		string
31		datePublished	\N	string
31		pages		string
31		isPageEnabled	\N	string
32	en_US	title	Internet, openness and the future of the information society in LAC	string
32	fr_CA	title		string
32	en_US	subtitle		string
32	fr_CA	subtitle		string
32	en_US	abstract		string
32	fr_CA	abstract		string
32		datePublished	\N	string
32		pages		string
32		isPageEnabled	\N	string
33	en_US	title	Imagining the Internet: Open, closed or in between?	string
33	fr_CA	title		string
33	en_US	subtitle		string
33	fr_CA	subtitle		string
33	en_US	abstract		string
33	fr_CA	abstract		string
33		datePublished	\N	string
33		pages		string
33		isPageEnabled	\N	string
34	en_US	title	The internet in LAC will remain free, public and open over the next 10 years	string
34	fr_CA	title		string
34	en_US	subtitle		string
34	fr_CA	subtitle		string
34	en_US	abstract		string
34	fr_CA	abstract		string
34		datePublished	\N	string
34		pages		string
34		isPageEnabled	\N	string
35	en_US	title	Free Internet?	string
35	fr_CA	title		string
35	en_US	subtitle		string
35	fr_CA	subtitle		string
35	en_US	abstract		string
35	fr_CA	abstract		string
35		datePublished	\N	string
35		pages		string
35		isPageEnabled	\N	string
36	en_US	title	Risks and challenges for freedom of expression on the internet	string
36	fr_CA	title		string
36	en_US	subtitle		string
36	fr_CA	subtitle		string
36	en_US	abstract		string
36	fr_CA	abstract		string
36		datePublished	\N	string
36		pages		string
36		isPageEnabled	\N	string
37	en_US	title	Introduction	string
37	fr_CA	title		string
37	en_US	subtitle		string
37	fr_CA	subtitle		string
37	en_US	abstract		string
37	fr_CA	abstract		string
37		datePublished	\N	string
37		pages		string
37		isPageEnabled	\N	string
38	en_US	title	CHAPTER ONE: Where the Buffalo Roamed	string
38	fr_CA	title		string
38	en_US	subtitle		string
38	fr_CA	subtitle		string
38	en_US	abstract		string
38	fr_CA	abstract		string
38		datePublished	\N	string
38		pages		string
38		isPageEnabled	\N	string
39	en_US	title	CHAPTER TWO: Bison Conservation and Buffalo National Park	string
39	fr_CA	title		string
39	en_US	subtitle		string
39	fr_CA	subtitle		string
39	en_US	abstract		string
39	fr_CA	abstract		string
39		datePublished	\N	string
39		pages		string
39		isPageEnabled	\N	string
40	en_US	title	CHAPTER THREE: A Well-Run Ranch	string
40	fr_CA	title		string
40	en_US	subtitle		string
40	fr_CA	subtitle		string
40	en_US	abstract		string
40	fr_CA	abstract		string
40		datePublished	\N	string
40		pages		string
40		isPageEnabled	\N	string
41	en_US	title	CHAPTER FOUR: Zookeepers and Animal Breeders	string
41	fr_CA	title		string
41	en_US	subtitle		string
41	fr_CA	subtitle		string
41	en_US	abstract		string
41	fr_CA	abstract		string
41		datePublished	\N	string
41		pages		string
41		isPageEnabled	\N	string
42	en_US	title	CHAPTER FIVE: "Evolving the Arctic Cow"	string
42	fr_CA	title		string
42	en_US	subtitle		string
42	fr_CA	subtitle		string
42	en_US	abstract		string
42	fr_CA	abstract		string
42		datePublished	\N	string
42		pages		string
42		isPageEnabled	\N	string
43	en_US	title	CONCLUSION: The Forgotten Park	string
43	fr_CA	title		string
43	en_US	subtitle		string
43	fr_CA	subtitle		string
43	en_US	abstract		string
43	fr_CA	abstract		string
43		datePublished	\N	string
43		pages		string
43		isPageEnabled	\N	string
44	en_US	title	Bibliography	string
44	fr_CA	title		string
44	en_US	subtitle		string
44	fr_CA	subtitle		string
44	en_US	abstract		string
44	fr_CA	abstract		string
44		datePublished	\N	string
44		pages		string
44		isPageEnabled	\N	string
45	en_US	title	Index	string
45	fr_CA	title		string
45	en_US	subtitle		string
45	fr_CA	subtitle		string
45	en_US	abstract		string
45	fr_CA	abstract		string
45		datePublished	\N	string
45		pages		string
45		isPageEnabled	\N	string
46	en_US	title	Introduction	string
46	fr_CA	title		string
46	en_US	subtitle		string
46	fr_CA	subtitle		string
46	en_US	abstract		string
46	fr_CA	abstract		string
46		datePublished	\N	string
46		pages		string
46		isPageEnabled	\N	string
47	en_US	title	Poems	string
47	fr_CA	title		string
47	en_US	subtitle		string
47	fr_CA	subtitle		string
47	en_US	abstract		string
47	fr_CA	abstract		string
47		datePublished	\N	string
47		pages		string
47		isPageEnabled	\N	string
48	en_US	title	Catalyzing Access through Social and Technical Innovation	string
48	fr_CA	title		string
48	en_US	subtitle		string
48	fr_CA	subtitle		string
48	en_US	abstract		string
48	fr_CA	abstract		string
48		datePublished	\N	string
48		pages		string
48		isPageEnabled	\N	string
49	en_US	title	Catalyzing Access via Telecommunications Policy	string
49	fr_CA	title		string
49	en_US	subtitle		string
49	fr_CA	subtitle		string
49	en_US	abstract		string
49	fr_CA	abstract		string
49		datePublished	\N	string
49		pages		string
49		isPageEnabled	\N	string
50	en_US	title	Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property	string
50	fr_CA	title		string
50	en_US	subtitle		string
50	fr_CA	subtitle		string
50	en_US	abstract		string
50	fr_CA	abstract		string
50		datePublished	\N	string
50		pages		string
50		isPageEnabled	\N	string
51	en_US	title	Current State of Mobile Learning	string
51	fr_CA	title		string
51	en_US	subtitle		string
51	fr_CA	subtitle		string
51	en_US	abstract		string
51	fr_CA	abstract		string
51		datePublished	\N	string
51		pages		string
51		isPageEnabled	\N	string
52	en_US	title	A Model for Framing Mobile Learning	string
52	fr_CA	title		string
52	en_US	subtitle		string
52	fr_CA	subtitle		string
52	en_US	abstract		string
52	fr_CA	abstract		string
52		datePublished	\N	string
52		pages		string
52		isPageEnabled	\N	string
53	en_US	title	Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners	string
53	fr_CA	title		string
53	en_US	subtitle		string
53	fr_CA	subtitle		string
53	en_US	abstract		string
53	fr_CA	abstract		string
53		datePublished	\N	string
53		pages		string
53		isPageEnabled	\N	string
54	fr_CA	title		string
54	en_US	subtitle		string
54	fr_CA	subtitle		string
54	en_US	abstract		string
54	fr_CA	abstract		string
54		datePublished	\N	string
54		pages		string
54		isPageEnabled	\N	string
54	en_US	title	Chapter 1: Mind Control—Internal or External?	string
55	en_US	title	Chapter 2: Classical Music and the Classical Mind	string
55	fr_CA	title		string
55	en_US	subtitle		string
55	fr_CA	subtitle		string
55	en_US	abstract		string
55	fr_CA	abstract		string
55		datePublished	\N	string
55		pages		string
55		isPageEnabled	\N	string
56	en_US	title	Chapter 3: Situated Cognition and Bricolage	string
56	fr_CA	title		string
56	en_US	subtitle		string
56	fr_CA	subtitle		string
56	en_US	abstract		string
56	fr_CA	abstract		string
56		datePublished	\N	string
56		pages		string
56		isPageEnabled	\N	string
57	en_US	title	Chapter 4: Braitenberg’s Vehicle 2	string
57	fr_CA	title		string
57	en_US	subtitle		string
57	fr_CA	subtitle		string
57	en_US	abstract		string
57	fr_CA	abstract		string
57		datePublished	\N	string
57		pages		string
57		isPageEnabled	\N	string
58	en_US	title	Setting the Stage	string
58	fr_CA	title		string
58	en_US	subtitle		string
58	fr_CA	subtitle		string
58	en_US	abstract		string
58	fr_CA	abstract		string
58		datePublished	\N	string
58		pages		string
58		isPageEnabled	\N	string
59	en_US	title	Going It Alone, 1945-1954	string
59	fr_CA	title		string
59	en_US	subtitle		string
59	fr_CA	subtitle		string
59	en_US	abstract		string
59	fr_CA	abstract		string
59		datePublished	\N	string
59		pages		string
59		isPageEnabled	\N	string
60	en_US	title	Establishing the Pattern, 1955-1962	string
60	fr_CA	title		string
60	en_US	subtitle		string
60	fr_CA	subtitle		string
60	en_US	abstract		string
60	fr_CA	abstract		string
60		datePublished	\N	string
60		pages		string
60		isPageEnabled	\N	string
61	en_US	title	Foreward	string
61	fr_CA	title		string
61	en_US	subtitle		string
61	fr_CA	subtitle		string
61	en_US	abstract		string
61	fr_CA	abstract		string
61		datePublished	\N	string
61		pages		string
61		isPageEnabled	\N	string
62	en_US	title	Preface	string
62	fr_CA	title		string
62	en_US	subtitle		string
62	fr_CA	subtitle		string
62	en_US	abstract		string
62	fr_CA	abstract		string
62		datePublished	\N	string
62		pages		string
62		isPageEnabled	\N	string
63	en_US	title	The Case Studies	string
63	fr_CA	title		string
63	en_US	subtitle		string
63	fr_CA	subtitle		string
63	en_US	abstract		string
63	fr_CA	abstract		string
63		datePublished	\N	string
63		pages		string
63		isPageEnabled	\N	string
64	en_US	title	Conclusion	string
64	fr_CA	title		string
64	en_US	subtitle		string
64	fr_CA	subtitle		string
64	en_US	abstract		string
64	fr_CA	abstract		string
64		datePublished	\N	string
64		pages		string
64		isPageEnabled	\N	string
65	en_US	title	Bibliography	string
65	fr_CA	title		string
65	en_US	subtitle		string
65	fr_CA	subtitle		string
65	en_US	abstract		string
65	fr_CA	abstract		string
65		datePublished	\N	string
65		pages		string
65		isPageEnabled	\N	string
66	en_US	title	Preface	string
66	fr_CA	title		string
66	en_US	subtitle		string
66	fr_CA	subtitle		string
66	en_US	abstract		string
66	fr_CA	abstract		string
66		datePublished	\N	string
66		pages		string
66		isPageEnabled	\N	string
67	en_US	title	Introduction	string
67	fr_CA	title		string
67	en_US	subtitle		string
67	fr_CA	subtitle		string
67	en_US	abstract		string
67	fr_CA	abstract		string
67		datePublished	\N	string
67		pages		string
67		isPageEnabled	\N	string
68	en_US	title	The Emergence of Open Development in a Network Society	string
68	fr_CA	title		string
68	en_US	subtitle		string
68	fr_CA	subtitle		string
68	en_US	abstract		string
68	fr_CA	abstract		string
68		datePublished	\N	string
68		pages		string
68		isPageEnabled	\N	string
69	en_US	title	Enacting Openness in ICT4D Research	string
69	fr_CA	title		string
69	en_US	subtitle		string
69	fr_CA	subtitle		string
69	en_US	abstract		string
69	fr_CA	abstract		string
69		datePublished	\N	string
69		pages		string
69		isPageEnabled	\N	string
70	en_US	title	Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things	string
70	fr_CA	title		string
70	en_US	subtitle		string
70	fr_CA	subtitle		string
70	en_US	abstract		string
70	fr_CA	abstract		string
70		datePublished	\N	string
70		pages		string
70		isPageEnabled	\N	string
71	en_US	title	Open Educational Resources: Opportunities and Challenges for the Developing World	string
71	fr_CA	title		string
71	en_US	subtitle		string
71	fr_CA	subtitle		string
71	en_US	abstract		string
71	fr_CA	abstract		string
71		datePublished	\N	string
71		pages		string
71		isPageEnabled	\N	string
\.


--
-- Data for Name: submission_chapters; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_chapters (chapter_id, primary_contact_id, publication_id, seq, source_chapter_id, doi_id) FROM stdin;
26	\N	6	4	26	\N
1	\N	1	1	1	\N
2	\N	1	2	2	\N
3	\N	1	3	3	\N
13	\N	4	1	13	\N
14	\N	4	2	14	\N
15	\N	4	3	15	\N
16	\N	4	4	16	\N
4	\N	2	1	4	\N
5	\N	2	2	5	\N
6	\N	2	3	6	\N
7	\N	2	4	7	\N
8	\N	3	1	8	\N
9	\N	3	2	9	\N
10	\N	3	3	10	\N
11	\N	3	4	11	\N
12	\N	3	5	12	\N
27	\N	7	1	27	\N
28	\N	7	2	28	\N
29	\N	7	3	29	\N
30	\N	7	4	30	\N
17	\N	5	1	17	\N
18	\N	5	2	18	\N
19	\N	5	3	19	\N
20	\N	5	4	20	\N
21	\N	5	5	21	\N
22	\N	5	6	22	\N
31	\N	7	5	31	\N
54	\N	14	1	54	\N
55	\N	14	2	55	\N
56	\N	14	3	56	\N
57	\N	14	4	57	\N
23	\N	6	1	23	\N
24	\N	6	2	24	\N
25	\N	6	3	25	\N
37	\N	10	1	37	\N
38	\N	10	2	38	\N
39	\N	10	3	39	\N
40	\N	10	4	40	\N
41	\N	10	5	41	\N
42	\N	10	6	42	\N
43	\N	10	7	43	\N
44	\N	10	8	44	\N
45	\N	10	9	45	\N
32	\N	9	1	32	\N
33	\N	9	2	33	\N
34	\N	9	3	34	\N
35	\N	9	4	35	\N
36	\N	9	5	36	\N
46	\N	11	1	46	\N
47	\N	11	2	47	\N
58	\N	15	1	58	\N
59	\N	15	2	59	\N
60	\N	15	3	60	\N
66	\N	17	1	66	\N
67	\N	17	2	67	\N
48	\N	12	1	48	\N
49	\N	12	2	49	\N
50	\N	12	3	50	\N
68	\N	17	3	68	\N
69	\N	17	4	69	\N
70	\N	17	5	70	\N
71	\N	17	6	71	\N
51	\N	13	1	51	\N
52	\N	13	2	52	\N
53	\N	13	3	53	\N
61	\N	16	1	61	\N
62	\N	16	2	62	\N
63	\N	16	3	63	\N
64	\N	16	4	64	\N
65	\N	16	5	65	\N
\.


--
-- Name: submission_chapters_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_chapters_chapter_id_seq', 71, true);


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
1	1	4096	11	10	10		<p>I recommend that the author revise this submission.</p>	2022-05-25 19:06:24	\N	1
2	1	4096	11	11	12		<p>I recommend that the author resubmit this submission.</p>	2022-05-25 19:06:38	\N	1
3	1	4096	12	13	8		<p>I recommend declining this submission.</p>	2022-05-25 19:10:08	\N	1
4	1	4096	13	18	12		<p>I recommend resubmitting.</p>	2022-05-25 19:13:10	\N	1
5	1	4096	16	21	10		<p>I recommend that the author revise this submission.</p>	2022-05-25 19:21:16	\N	1
\.


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 5, true);


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
7	7	5
8	8	4
9	9	3
10	10	2
11	11	6
12	12	7
13	13	8
14	14	9
15	15	10
16	16	10
17	17	9
18	18	8
19	19	7
20	20	11
21	21	11
22	22	11
23	23	12
24	24	13
25	25	14
26	26	15
27	27	15
28	28	14
29	29	13
30	30	12
31	31	16
32	32	17
33	33	18
34	34	19
35	35	20
36	36	20
37	37	19
38	38	16
39	39	17
40	40	18
41	41	21
42	42	22
43	43	23
44	44	24
45	45	25
46	46	26
47	47	26
48	48	25
49	49	22
50	50	23
51	51	24
52	52	27
53	53	28
54	54	28
55	55	29
56	56	30
57	57	31
58	58	31
59	59	29
60	60	30
61	61	32
62	62	33
63	63	34
64	64	34
65	65	32
66	66	33
67	67	35
68	68	36
69	69	37
70	70	38
71	71	39
72	72	40
73	73	40
74	74	39
75	75	38
76	76	36
77	77	37
78	78	35
79	79	40
80	80	39
81	81	38
82	82	36
83	83	37
84	84	35
85	85	41
86	86	41
87	87	42
88	88	42
89	89	43
90	90	44
91	91	45
92	92	46
93	93	47
94	94	48
95	95	47
96	96	48
97	97	46
98	98	43
99	99	44
100	100	45
\.


--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_file_revisions_revision_id_seq', 100, true);


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
7	en_US	name	Visualizing Space, Race, and History in .pdf	string
7		chapterId	7	string
8	en_US	name	Cree Intellectual Traditions in History.pdf	string
8		chapterId	6	string
9	en_US	name	Vernacular Currents in Western Canadian .pdf	string
9		chapterId	5	string
10	en_US	name	Critical History in Western Canada 1900–.pdf	string
10		chapterId	4	string
11	en_US	name	The Political Economy of Workplace Injury in Canada.pdf	string
12	en_US	name	Introduction: Contexts of Popular Cultur.pdf	string
13	en_US	name	Chapter 1. A Future for Media Studies: C.pdf	string
14	en_US	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
15	en_US	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
12		chapterId	13	string
13		chapterId	14	string
14		chapterId	15	string
15		chapterId	16	string
16	en_US	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
16		chapterId	16	string
17	en_US	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
17		chapterId	15	string
18	en_US	name	Chapter 1. A Future for Media Studies: C.pdf	string
18		chapterId	14	string
19	en_US	name	Introduction: Contexts of Popular Cultur.pdf	string
19		chapterId	13	string
20	en_US	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
21	en_US	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
32		chapterId	28	string
22	en_US	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
23	en_US	name	Identify: Understanding Your Information.pdf	string
24	en_US	name	Scope: Knowing What Is Available.pdf	string
25	en_US	name	Plan: Developing Research Strategies.pdf	string
26	en_US	name	Gather: Finding What You Need.pdf	string
23		chapterId	23	string
24		chapterId	24	string
25		chapterId	25	string
26		chapterId	26	string
27	en_US	name	Gather: Finding What You Need.pdf	string
27		chapterId	26	string
28	en_US	name	Plan: Developing Research Strategies.pdf	string
28		chapterId	25	string
29	en_US	name	Scope: Knowing What Is Available.pdf	string
29		chapterId	24	string
30	en_US	name	Identify: Understanding Your Information.pdf	string
30		chapterId	23	string
31	en_US	name	Introduction.pdf	string
32	en_US	name	Chapter 1: Interactions Affording Distan.pdf	string
33	en_US	name	Chapter 2: Learning Science at a Distanc.pdf	string
34	en_US	name	Chapter 3: Leadership Strategies for Coo.pdf	string
35	en_US	name	Chapter 4: Toward New Models of Flexible.pdf	string
31		chapterId	27	string
33		chapterId	29	string
34		chapterId	30	string
35		chapterId	31	string
36	en_US	name	Chapter 4: Toward New Models of Flexible.pdf	string
36		chapterId	31	string
37	en_US	name	Chapter 3: Leadership Strategies for Coo.pdf	string
37		chapterId	30	string
38	en_US	name	Introduction.pdf	string
38		chapterId	27	string
39	en_US	name	Chapter 1: Interactions Affording Distan.pdf	string
39		chapterId	28	string
40	en_US	name	Chapter 2: Learning Science at a Distanc.pdf	string
40		chapterId	29	string
41	en_US	name	Editorial.pdf	string
42	en_US	name	Internet, openness and the future of the.pdf	string
43	en_US	name	Imagining the Internet: Open, closed or .pdf	string
44	en_US	name	The internet in LAC will remain free, pu.pdf	string
45	en_US	name	Free Internet?.pdf	string
46	en_US	name	Risks and challenges for freedom of expr.pdf	string
42		chapterId	32	string
43		chapterId	33	string
44		chapterId	34	string
45		chapterId	35	string
46		chapterId	36	string
47	en_US	name	Risks and challenges for freedom of expr.pdf	string
47		chapterId	36	string
48	en_US	name	Free Internet?.pdf	string
48		chapterId	35	string
49	en_US	name	Internet, openness and the future of the.pdf	string
49		chapterId	32	string
50	en_US	name	Imagining the Internet: Open, closed or .pdf	string
50		chapterId	33	string
51	en_US	name	The internet in LAC will remain free, pu.pdf	string
51		chapterId	34	string
52	en_US	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
53	en_US	name	Dreamwork.pdf	string
54	en_US	name	Dreamwork.pdf	string
55	en_US	name	Catalyzing Access through Social and Tec.pdf	string
56	en_US	name	Catalyzing Access via Telecommunications.pdf	string
57	en_US	name	Access to Knowledge as a New Paradigm fo.pdf	string
55		chapterId	48	string
56		chapterId	49	string
57		chapterId	50	string
58	en_US	name	Access to Knowledge as a New Paradigm fo.pdf	string
58		chapterId	50	string
59	en_US	name	Catalyzing Access through Social and Tec.pdf	string
59		chapterId	48	string
60	en_US	name	Catalyzing Access via Telecommunications.pdf	string
60		chapterId	49	string
61	en_US	name	Current State of Mobile Learning.pdf	string
62	en_US	name	A Model for Framing Mobile Learning.pdf	string
63	en_US	name	Mobile Distance Learning with PDAs: Deve.pdf	string
61		chapterId	51	string
62		chapterId	52	string
63		chapterId	53	string
64	en_US	name	Mobile Distance Learning with PDAs: Deve.pdf	string
64		chapterId	53	string
65	en_US	name	Current State of Mobile Learning.pdf	string
65		chapterId	51	string
66	en_US	name	A Model for Framing Mobile Learning.pdf	string
66		chapterId	52	string
67	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
68	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
69	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
70	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
71	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
72	en_US	name	The Canadian Nutrient File: Nutrient Val.pdf	string
67		chapterId	54	string
68		chapterId	55	string
69		chapterId	56	string
70		chapterId	57	string
73	en_US	name	The Canadian Nutrient File: Nutrient Val.pdf	string
74	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
75	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
75		chapterId	57	string
76	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
76		chapterId	55	string
77	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
77		chapterId	56	string
78	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
78		chapterId	54	string
85	en_US	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
86	en_US	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
84	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
84		chapterId	54	string
87	en_US	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
82	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
82		chapterId	55	string
88	en_US	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
83	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
83		chapterId	56	string
89	en_US	name	Preface.pdf	string
81	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
81		chapterId	57	string
90	en_US	name	Introduction.pdf	string
80	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
79	en_US	name	The Canadian Nutrient File: Nutrient Val.pdf	string
91	en_US	name	The Emergence of Open Development in a N.pdf	string
92	en_US	name	Enacting Openness in ICT4D Research.pdf	string
93	en_US	name	Transparency and Development: Ethical Co.pdf	string
94	en_US	name	Open Educational Resources: Opportunitie.pdf	string
89		chapterId	66	string
90		chapterId	67	string
91		chapterId	68	string
92		chapterId	69	string
93		chapterId	70	string
94		chapterId	71	string
95	en_US	name	Transparency and Development: Ethical Co.pdf	string
95		chapterId	70	string
96	en_US	name	Open Educational Resources: Opportunitie.pdf	string
96		chapterId	71	string
97	en_US	name	Enacting Openness in ICT4D Research.pdf	string
97		chapterId	69	string
98	en_US	name	Preface.pdf	string
98		chapterId	66	string
99	en_US	name	Introduction.pdf	string
99		chapterId	67	string
100	en_US	name	The Emergence of Open Development in a N.pdf	string
100		chapterId	68	string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id, doi_id) FROM stdin;
1	1	1	\N	3	2	\N	\N	\N	2022-05-25 18:43:44	2022-05-25 18:43:44	19	\N	\N	\N
2	1	1	1	3	4	\N	\N	\N	2022-05-25 18:44:16	2022-05-25 18:44:16	19	523	1	\N
3	2	2	\N	4	2	\N	\N	\N	2022-05-25 18:44:57	2022-05-25 18:44:57	20	\N	\N	\N
4	2	3	\N	4	2	\N	\N	\N	2022-05-25 18:44:57	2022-05-25 18:44:57	20	\N	\N	\N
5	2	4	\N	4	2	\N	\N	\N	2022-05-25 18:44:58	2022-05-25 18:44:58	20	\N	\N	\N
6	2	5	\N	4	2	\N	\N	\N	2022-05-25 18:44:58	2022-05-25 18:44:59	20	\N	\N	\N
7	2	5	6	4	4	\N	\N	\N	2022-05-25 18:47:11	2022-05-25 18:47:11	20	523	2	\N
8	2	4	5	4	4	\N	\N	\N	2022-05-25 18:47:11	2022-05-25 18:47:11	20	523	2	\N
9	2	3	4	4	4	\N	\N	\N	2022-05-25 18:47:11	2022-05-25 18:47:11	20	523	2	\N
10	2	2	3	4	4	\N	\N	\N	2022-05-25 18:47:11	2022-05-25 18:47:11	20	523	2	\N
11	3	6	\N	3	2	\N	\N	\N	2022-05-25 18:47:52	2022-05-25 18:47:52	21	\N	\N	\N
12	4	7	\N	4	2	\N	\N	\N	2022-05-25 18:48:40	2022-05-25 18:48:41	22	\N	\N	\N
13	4	8	\N	4	2	\N	\N	\N	2022-05-25 18:48:41	2022-05-25 18:48:41	22	\N	\N	\N
14	4	9	\N	4	2	\N	\N	\N	2022-05-25 18:48:41	2022-05-25 18:48:42	22	\N	\N	\N
15	4	10	\N	4	2	\N	\N	\N	2022-05-25 18:48:42	2022-05-25 18:48:42	22	\N	\N	\N
16	4	10	15	4	19	\N	\N	\N	2022-05-25 18:50:23	2022-05-25 18:50:23	22	523	3	\N
17	4	9	14	4	19	\N	\N	\N	2022-05-25 18:50:23	2022-05-25 18:50:23	22	523	3	\N
18	4	8	13	4	19	\N	\N	\N	2022-05-25 18:50:23	2022-05-25 18:50:23	22	523	3	\N
19	4	7	12	4	19	\N	\N	\N	2022-05-25 18:50:23	2022-05-25 18:50:23	22	523	3	\N
20	5	11	\N	3	2	\N	\N	\N	2022-05-25 18:52:33	2022-05-25 18:52:34	23	\N	\N	\N
21	5	11	20	3	19	\N	\N	\N	2022-05-25 18:53:28	2022-05-25 18:53:28	23	523	5	\N
22	5	11	20	3	10	0	openAccess	1	2022-05-25 18:55:03	2022-05-25 18:55:15	23	521	2	\N
23	6	12	\N	4	2	\N	\N	\N	2022-05-25 18:55:32	2022-05-25 18:55:32	24	\N	\N	\N
24	6	13	\N	4	2	\N	\N	\N	2022-05-25 18:55:33	2022-05-25 18:55:33	24	\N	\N	\N
25	6	14	\N	4	2	\N	\N	\N	2022-05-25 18:55:33	2022-05-25 18:55:33	24	\N	\N	\N
26	6	15	\N	4	2	\N	\N	\N	2022-05-25 18:55:34	2022-05-25 18:55:34	24	\N	\N	\N
27	6	15	26	4	19	\N	\N	\N	2022-05-25 18:56:57	2022-05-25 18:56:57	24	523	7	\N
28	6	14	25	4	19	\N	\N	\N	2022-05-25 18:56:57	2022-05-25 18:56:57	24	523	7	\N
29	6	13	24	4	19	\N	\N	\N	2022-05-25 18:56:57	2022-05-25 18:56:57	24	523	7	\N
30	6	12	23	4	19	\N	\N	\N	2022-05-25 18:56:57	2022-05-25 18:56:57	24	523	7	\N
31	7	16	\N	4	2	\N	\N	\N	2022-05-25 18:58:02	2022-05-25 18:58:02	25	\N	\N	\N
32	7	17	\N	4	2	\N	\N	\N	2022-05-25 18:58:02	2022-05-25 18:58:02	25	\N	\N	\N
33	7	18	\N	4	2	\N	\N	\N	2022-05-25 18:58:02	2022-05-25 18:58:03	25	\N	\N	\N
34	7	19	\N	4	2	\N	\N	\N	2022-05-25 18:58:03	2022-05-25 18:58:04	25	\N	\N	\N
35	7	20	\N	4	2	\N	\N	\N	2022-05-25 18:58:04	2022-05-25 18:58:04	25	\N	\N	\N
36	7	20	35	4	4	\N	\N	\N	2022-05-25 19:00:20	2022-05-25 19:00:20	25	523	8	\N
37	7	19	34	4	4	\N	\N	\N	2022-05-25 19:00:20	2022-05-25 19:00:20	25	523	8	\N
38	7	16	31	4	4	\N	\N	\N	2022-05-25 19:00:20	2022-05-25 19:00:20	25	523	8	\N
39	7	17	32	4	4	\N	\N	\N	2022-05-25 19:00:20	2022-05-25 19:00:20	25	523	8	\N
40	7	18	33	4	4	\N	\N	\N	2022-05-25 19:00:20	2022-05-25 19:00:20	25	523	8	\N
41	8	21	\N	3	2	\N	\N	\N	2022-05-25 19:01:14	2022-05-25 19:01:15	3	\N	\N	\N
42	9	22	\N	4	2	\N	\N	\N	2022-05-25 19:01:30	2022-05-25 19:01:30	26	\N	\N	\N
43	9	23	\N	4	2	\N	\N	\N	2022-05-25 19:01:30	2022-05-25 19:01:30	26	\N	\N	\N
44	9	24	\N	4	2	\N	\N	\N	2022-05-25 19:01:30	2022-05-25 19:01:31	26	\N	\N	\N
45	9	25	\N	4	2	\N	\N	\N	2022-05-25 19:01:31	2022-05-25 19:01:31	26	\N	\N	\N
46	9	26	\N	4	2	\N	\N	\N	2022-05-25 19:01:32	2022-05-25 19:01:32	26	\N	\N	\N
47	9	26	46	4	19	\N	\N	\N	2022-05-25 19:03:35	2022-05-25 19:03:35	26	523	9	\N
48	9	25	45	4	19	\N	\N	\N	2022-05-25 19:03:35	2022-05-25 19:03:35	26	523	9	\N
49	9	22	42	4	19	\N	\N	\N	2022-05-25 19:03:35	2022-05-25 19:03:35	26	523	9	\N
50	9	23	43	4	19	\N	\N	\N	2022-05-25 19:03:35	2022-05-25 19:03:35	26	523	9	\N
51	9	24	44	4	19	\N	\N	\N	2022-05-25 19:03:35	2022-05-25 19:03:35	26	523	9	\N
52	10	27	\N	3	2	\N	\N	\N	2022-05-25 19:03:54	2022-05-25 19:03:54	27	\N	\N	\N
53	11	28	\N	3	2	\N	\N	\N	2022-05-25 19:05:08	2022-05-25 19:05:08	28	\N	\N	\N
54	11	28	53	3	19	\N	\N	\N	2022-05-25 19:05:33	2022-05-25 19:05:33	28	523	10	\N
55	12	29	\N	4	2	\N	\N	\N	2022-05-25 19:07:19	2022-05-25 19:07:19	29	\N	\N	\N
56	12	30	\N	4	2	\N	\N	\N	2022-05-25 19:07:19	2022-05-25 19:07:20	29	\N	\N	\N
57	12	31	\N	4	2	\N	\N	\N	2022-05-25 19:07:20	2022-05-25 19:07:20	29	\N	\N	\N
58	12	31	57	4	19	\N	\N	\N	2022-05-25 19:09:14	2022-05-25 19:09:14	29	523	12	\N
59	12	29	55	4	19	\N	\N	\N	2022-05-25 19:09:14	2022-05-25 19:09:14	29	523	12	\N
60	12	30	56	4	19	\N	\N	\N	2022-05-25 19:09:14	2022-05-25 19:09:14	29	523	12	\N
61	13	32	\N	4	2	\N	\N	\N	2022-05-25 19:10:23	2022-05-25 19:10:23	30	\N	\N	\N
62	13	33	\N	4	2	\N	\N	\N	2022-05-25 19:10:23	2022-05-25 19:10:24	30	\N	\N	\N
63	13	34	\N	4	2	\N	\N	\N	2022-05-25 19:10:24	2022-05-25 19:10:24	30	\N	\N	\N
64	13	34	63	4	19	\N	\N	\N	2022-05-25 19:11:40	2022-05-25 19:11:40	30	523	13	\N
65	13	32	61	4	19	\N	\N	\N	2022-05-25 19:11:40	2022-05-25 19:11:40	30	523	13	\N
66	13	33	62	4	19	\N	\N	\N	2022-05-25 19:11:40	2022-05-25 19:11:40	30	523	13	\N
67	14	35	\N	4	2	\N	\N	\N	2022-05-25 19:14:00	2022-05-25 19:14:01	31	\N	\N	\N
68	14	36	\N	4	2	\N	\N	\N	2022-05-25 19:14:01	2022-05-25 19:14:01	31	\N	\N	\N
69	14	37	\N	4	2	\N	\N	\N	2022-05-25 19:14:01	2022-05-25 19:14:02	31	\N	\N	\N
70	14	38	\N	4	2	\N	\N	\N	2022-05-25 19:14:02	2022-05-25 19:14:02	31	\N	\N	\N
71	14	39	\N	13	2	\N	\N	\N	2022-05-25 19:14:03	2022-05-25 19:14:03	31	\N	\N	\N
72	14	40	\N	9	2	\N	\N	\N	2022-05-25 19:14:04	2022-05-25 19:14:05	31	\N	\N	\N
73	14	40	72	9	19	\N	\N	\N	2022-05-25 19:15:31	2022-05-25 19:15:31	31	523	15	\N
74	14	39	71	13	19	\N	\N	\N	2022-05-25 19:15:31	2022-05-25 19:15:31	31	523	15	\N
75	14	38	70	4	19	\N	\N	\N	2022-05-25 19:15:31	2022-05-25 19:15:31	31	523	15	\N
76	14	36	68	4	19	\N	\N	\N	2022-05-25 19:15:31	2022-05-25 19:15:31	31	523	15	\N
77	14	37	69	4	19	\N	\N	\N	2022-05-25 19:15:31	2022-05-25 19:15:31	31	523	15	\N
78	14	35	67	4	19	\N	\N	\N	2022-05-25 19:15:32	2022-05-25 19:15:32	31	523	15	\N
84	14	35	67	4	10	0	openAccess	1	2022-05-25 19:17:32	2022-05-25 19:17:47	31	521	3	\N
82	14	36	68	4	10	0	openAccess	1	2022-05-25 19:17:32	2022-05-25 19:17:55	31	521	3	\N
83	14	37	69	4	10	0	openAccess	1	2022-05-25 19:17:32	2022-05-25 19:18:05	31	521	3	\N
81	14	38	70	4	10	0	openAccess	1	2022-05-25 19:17:32	2022-05-25 19:18:15	31	521	3	\N
80	14	39	71	13	10	0	openAccess	1	2022-05-25 19:17:32	2022-05-25 19:18:24	31	521	3	\N
79	14	40	72	9	10	0	openAccess	1	2022-05-25 19:17:32	2022-05-25 19:18:34	31	521	3	\N
85	15	41	\N	3	2	\N	\N	\N	2022-05-25 19:18:53	2022-05-25 19:18:54	32	\N	\N	\N
86	15	41	85	3	4	\N	\N	\N	2022-05-25 19:19:30	2022-05-25 19:19:30	32	523	17	\N
87	16	42	\N	3	2	\N	\N	\N	2022-05-25 19:19:46	2022-05-25 19:19:46	33	\N	\N	\N
88	16	42	87	3	4	\N	\N	\N	2022-05-25 19:20:32	2022-05-25 19:20:32	33	523	18	\N
89	17	43	\N	4	2	\N	\N	\N	2022-05-25 19:21:30	2022-05-25 19:21:30	34	\N	\N	\N
90	17	44	\N	4	2	\N	\N	\N	2022-05-25 19:21:30	2022-05-25 19:21:30	34	\N	\N	\N
91	17	45	\N	4	2	\N	\N	\N	2022-05-25 19:21:30	2022-05-25 19:21:31	34	\N	\N	\N
92	17	46	\N	4	2	\N	\N	\N	2022-05-25 19:21:31	2022-05-25 19:21:31	34	\N	\N	\N
93	17	47	\N	4	2	\N	\N	\N	2022-05-25 19:21:32	2022-05-25 19:21:32	34	\N	\N	\N
94	17	48	\N	4	2	\N	\N	\N	2022-05-25 19:21:32	2022-05-25 19:21:33	34	\N	\N	\N
95	17	47	93	4	19	\N	\N	\N	2022-05-25 19:24:33	2022-05-25 19:24:33	34	523	19	\N
96	17	48	94	4	19	\N	\N	\N	2022-05-25 19:24:33	2022-05-25 19:24:33	34	523	19	\N
97	17	46	92	4	19	\N	\N	\N	2022-05-25 19:24:33	2022-05-25 19:24:33	34	523	19	\N
98	17	43	89	4	19	\N	\N	\N	2022-05-25 19:24:33	2022-05-25 19:24:33	34	523	19	\N
99	17	44	90	4	19	\N	\N	\N	2022-05-25 19:24:33	2022-05-25 19:24:33	34	523	19	\N
100	17	45	91	4	19	\N	\N	\N	2022-05-25 19:24:33	2022-05-25 19:24:33	34	523	19	\N
\.


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 100, true);


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
102	agent’s
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
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 110, true);


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
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 16, true);


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_settings (submission_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
7	1	7	2022-05-25 19:01:01	2022-05-25 18:59:59	2022-05-25 18:59:59	4	en_US	1	0	1
5	1	5	2022-05-25 18:55:18	2022-05-25 18:53:12	2022-05-25 18:53:12	5	en_US	3	0	2
1	1	1	2022-05-25 18:44:43	2022-05-25 18:44:02	2022-05-25 18:44:02	4	en_US	1	0	2
8	1	8	2022-05-25 19:01:18	2022-05-25 19:01:17	2022-05-25 19:01:17	1	en_US	1	0	2
11	1	11	2022-05-25 19:07:01	2022-05-25 19:05:19	2022-05-25 19:06:10	4	en_US	1	0	2
13	1	13	2022-05-25 19:13:39	2022-05-25 19:11:22	2022-05-25 19:12:37	4	en_US	1	0	1
14	1	14	2022-05-25 19:18:38	2022-05-25 19:15:11	2022-05-25 19:15:11	5	en_US	3	0	1
4	1	4	2022-05-25 18:52:21	2022-05-25 18:50:04	2022-05-25 18:50:04	5	en_US	1	0	1
6	1	6	2022-05-25 18:57:30	2022-05-25 18:56:38	2022-05-25 18:56:38	2	en_US	1	0	1
2	1	2	2022-05-25 18:47:38	2022-05-25 18:46:50	2022-05-25 18:46:50	3	en_US	1	0	1
17	1	17	2022-05-25 19:25:04	2022-05-25 19:24:06	2022-05-25 19:24:06	2	en_US	1	0	1
9	1	9	2022-05-25 19:03:35	2022-05-25 19:03:13	2022-05-25 19:03:13	2	en_US	1	0	1
3	1	3	2022-05-25 18:48:28	2022-05-25 18:48:28	2022-05-25 18:48:28	1	en_US	1	0	2
12	1	12	2022-05-25 19:10:08	2022-05-25 19:08:52	2022-05-25 19:09:39	2	en_US	1	0	1
15	1	15	2022-05-25 19:19:30	2022-05-25 19:19:14	2022-05-25 19:19:14	3	en_US	1	0	2
10	1	10	2022-05-25 19:04:55	2022-05-25 19:04:54	2022-05-25 19:04:54	1	en_US	1	0	2
16	1	16	2022-05-25 19:21:16	2022-05-25 19:20:14	2022-05-25 19:20:43	3	en_US	1	0	2
\.


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submissions_submission_id_seq', 17, true);


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
\.


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.temporary_files_file_id_seq', 1, false);


--
-- Data for Name: usage_stats_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_temporary_records (assoc_id, assoc_type, representation_id, day, entry_time, metric, country_id, region, city, load_id, file_type) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_group_settings (user_group_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Site Admin	string
1	fr_CA	name	Administrateur-trice du site	string
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
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 19, true);


--
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_interests (user_id, controlled_vocab_entry_id) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_settings (user_id, locale, setting_name, setting_value) FROM stdin;
11	en_US	affiliation	KNUST
11	fr_CA	affiliation	
11	en_US	biography	
11	fr_CA	biography	
11	en_US	familyName	Zacharia
11	fr_CA	familyName	
11	en_US	givenName	Al
11	fr_CA	givenName	
11		orcid	
11	en_US	preferredPublicName	
3	fr_CA	familyName	
1	en_US	familyName	admin
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
7	en_US	affiliation	Utrecht University
7	fr_CA	affiliation	
7	en_US	biography	
7	fr_CA	biography	
7	en_US	familyName	Janssen
7	fr_CA	familyName	
7	en_US	givenName	Julie
7	fr_CA	givenName	
7		orcid	
7	en_US	preferredPublicName	
7	fr_CA	preferredPublicName	
7	en_US	signature	
7	fr_CA	signature	
9	en_US	affiliation	University of Manitoba
9	fr_CA	affiliation	
9	en_US	biography	
9	fr_CA	biography	
9	en_US	familyName	McCrae
9	fr_CA	familyName	
9	en_US	givenName	Aisla
9	fr_CA	givenName	
9		orcid	
9	en_US	preferredPublicName	
9	fr_CA	preferredPublicName	
9	en_US	signature	
9	fr_CA	signature	
11	fr_CA	preferredPublicName	
11	en_US	signature	
11	fr_CA	signature	
2	fr_CA	biography	
2	en_US	familyName	Vaca
2	fr_CA	familyName	
2	en_US	givenName	Ramiro
2	fr_CA	givenName	
2		orcid	
2	fr_CA	preferredPublicName	
2	en_US	signature	
2	fr_CA	signature	
1	en_US	givenName	admin
2	fr_CA	affiliation	
2	en_US	biography	
3	en_US	givenName	Daniel
3	en_US	preferredPublicName	
3	fr_CA	signature	
3	en_US	signature	
10	fr_CA	affiliation	
3	en_US	biography	
3	en_US	familyName	Barnes
3	fr_CA	givenName	
6	en_US	affiliation	Kyoto University
8	en_US	affiliation	McGill University
10	en_US	affiliation	State University of New York
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
10	en_US	biography	
10	fr_CA	biography	
10	en_US	familyName	Gallego
10	fr_CA	familyName	
10	en_US	givenName	Adela
10	fr_CA	givenName	
10		orcid	
10	fr_CA	preferredPublicName	
10	en_US	signature	
10	fr_CA	signature	
3	fr_CA	affiliation	
3		orcid	
3	fr_CA	preferredPublicName	
8	fr_CA	affiliation	
8	en_US	biography	
8	fr_CA	biography	
8	en_US	familyName	Hudson
8	fr_CA	familyName	
8	en_US	givenName	Paul
8	fr_CA	givenName	
8		orcid	
8	en_US	preferredPublicName	
8	fr_CA	preferredPublicName	
8	en_US	signature	
8	fr_CA	signature	
13	en_US	affiliation	Ghent University
13	fr_CA	affiliation	
13	en_US	biography	
13	fr_CA	biography	
13	en_US	familyName	Fritz
13	fr_CA	familyName	
13	en_US	givenName	Maria
13	fr_CA	givenName	
13		orcid	
13	en_US	preferredPublicName	
13	fr_CA	preferredPublicName	
13	en_US	signature	
13	fr_CA	signature	
14	en_US	affiliation	Universidad de Chile
14	fr_CA	affiliation	
14	en_US	biography	
14	fr_CA	biography	
14	en_US	familyName	Vogt
14	fr_CA	familyName	
14	en_US	givenName	Sarah
14	fr_CA	givenName	
14		orcid	
14	en_US	preferredPublicName	
14	fr_CA	preferredPublicName	
14	en_US	signature	
14	fr_CA	signature	
15	en_US	affiliation	Duke University
15	fr_CA	affiliation	
15	en_US	biography	
15	fr_CA	biography	
15	en_US	familyName	Cox
15	fr_CA	familyName	
15	en_US	givenName	Graham
15	fr_CA	givenName	
15		orcid	
15	en_US	preferredPublicName	
15	fr_CA	preferredPublicName	
15	en_US	signature	
15	fr_CA	signature	
16	en_US	affiliation	University of Cape Town
16	fr_CA	affiliation	
16	en_US	biography	
16	fr_CA	biography	
16	en_US	familyName	Hellier
16	fr_CA	familyName	
16	en_US	givenName	Stephen
16	fr_CA	givenName	
16		orcid	
16	en_US	preferredPublicName	
16	fr_CA	preferredPublicName	
16	en_US	signature	
16	fr_CA	signature	
17	en_US	affiliation	Imperial College London
17	fr_CA	affiliation	
17	en_US	biography	
17	fr_CA	biography	
17	en_US	familyName	Turner
17	fr_CA	familyName	
17	en_US	givenName	Catherine
17	fr_CA	givenName	
17		orcid	
17	en_US	preferredPublicName	
17	fr_CA	preferredPublicName	
17	en_US	signature	
17	fr_CA	signature	
18	en_US	affiliation	National University of Singapore
18	fr_CA	affiliation	
18	en_US	biography	
18	fr_CA	biography	
18	en_US	familyName	Kumar
18	fr_CA	familyName	
18	en_US	givenName	Sabine
18	fr_CA	givenName	
18		orcid	
18	en_US	preferredPublicName	
18	fr_CA	preferredPublicName	
18	en_US	signature	
18	fr_CA	signature	
2	en_US	affiliation	Universidad Nacional Autónoma de México
2	en_US	preferredPublicName	
19	en_US	affiliation	University of Calgary
19	en_US	familyName	Clark
19	en_US	givenName	Arthur
20	en_US	affiliation	Athabasca University
20	en_US	familyName	Finkel
20	en_US	givenName	Alvin
21	en_US	affiliation	Athabasca University
21	en_US	familyName	Barnetson
21	en_US	givenName	Bob
22	en_US	affiliation	University of British Columbia
22	en_US	familyName	Beaty
22	en_US	givenName	Bart
24	en_US	givenName	Deborah
23	en_US	affiliation	University of Southern California
23	en_US	familyName	Allan
23	en_US	givenName	Chantal
24	en_US	affiliation	SUNY
24	en_US	familyName	Bernnard
25	en_US	affiliation	Athabasca University
25	en_US	familyName	Kennepohl
25	en_US	givenName	Dietmar
26	en_US	affiliation	University of Sussex
26	en_US	familyName	Perini
26	en_US	givenName	Fernando
27	en_US	affiliation	Buffalo National Park Foundation
27	en_US	familyName	Brower
27	en_US	givenName	Jennifer
28	en_US	affiliation	University of Alberta
28	en_US	familyName	Locke Hart
28	en_US	givenName	Jonathan
12	en_US	biography	
12	fr_CA	biography	
12	en_US	familyName	Favio
12	fr_CA	familyName	
12	en_US	givenName	Gonzalo
12	fr_CA	givenName	
12		orcid	
12	en_US	preferredPublicName	
12	fr_CA	preferredPublicName	
12	en_US	signature	
12	fr_CA	signature	
10	en_US	preferredPublicName	
12	fr_CA	affiliation	
29	en_US	affiliation	International Development Research Centre
29	en_US	familyName	Elder
29	en_US	givenName	Laurent
30	en_US	affiliation	Athabasca University
30	en_US	familyName	Ally
30	en_US	givenName	Mohamed
12	en_US	affiliation	Madrid
31	en_US	affiliation	University of Alberta
31	en_US	familyName	Dawson
31	en_US	givenName	Michael
32	en_US	affiliation	University of Calgary
32	en_US	familyName	Foran
32	en_US	givenName	Max
33	en_US	affiliation	London School of Economics
33	en_US	familyName	Power
33	en_US	givenName	Michael
34	en_US	affiliation	International Development Research Centre
34	en_US	familyName	Smith
34	en_US	givenName	Matthew
3	en_US	affiliation	University of Melbourne
3	fr_CA	biography	
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
24	dbernnard	$2y$10$V60iabnDCEGA.8fo3TI/hezJHsauonwbrn6.fXwccuIE3BtAU5xtG	dbernnard@mailinator.com	\N	\N	\N	\N	US	\N	\N	\N	2022-05-25 18:55:25	\N	2022-05-25 18:55:25	\N	\N	\N	0	\N	1
6	minoue	$2y$10$5MVu5M3Pxwd15k0QHiRk.eC4BjJfAiI7vWljuP6A0uv6uBjDSCwFS	minoue@mailinator.com				\N	JP	[]	\N	\N	2022-05-25 18:37:18	\N	2022-05-25 18:57:14	0	0	\N	0	\N	1
4	dbuskins	$2y$10$XTzCKDQ9IEPJnPd6tCSrb.EfSK5L58xl7BABa54uV2sddPUkB.1xS	dbuskins@mailinator.com				\N	US	[]	\N	\N	2022-05-25 18:36:49	\N	\N	0	0	\N	0	\N	1
5	sberardo	$2y$10$SNcPwysd8OPcx/MfLacEGu9XbGn7OhPjkdDrFPMvG6bTipAgZnnsS	sberardo@mailinator.com				\N	CA	[]	\N	\N	2022-05-25 18:37:05	\N	\N	0	0	\N	0	\N	1
7	jjanssen	$2y$10$X1r8lkJy.PmQ7dFsZS.DtuqlZBWe1SJHBDQoQOfvnmcVZwxoVaG5S	jjanssen@mailinator.com				\N	NL	[]	\N	\N	2022-05-25 18:37:33	\N	\N	0	0	\N	0	\N	1
9	amccrae	$2y$10$oZ7GgjV1J7qQG8zXwPwwrOt5MfDerxt/iuOfC8xtDidvz3hFxYhrK	amccrae@mailinator.com				\N	CA	[]	\N	\N	2022-05-25 18:38:07	\N	\N	0	0	\N	0	\N	1
11	alzacharia	$2y$10$6twnPc9nREYGDQ9ivf4oCe1NQZrpnO7qdwQR.f0UQAYZQaObPM/fW	alzacharia@mailinator.com				\N	GH	[]	\N	\N	2022-05-25 18:38:50	\N	\N	0	0	\N	0	\N	1
13	mfritz	$2y$10$Zo7fGcGxRCdEyScdBERDpOx1mOftfPVhm5axiGOTU4Sn6/SC.2Ps.	mfritz@mailinator.com				\N	BE	[]	\N	\N	2022-05-25 18:39:36	\N	\N	0	0	\N	0	\N	1
14	svogt	$2y$10$J/ipuSShivxxUtUSipDiHejmVRYiON3Pod4k2mBMDf67vmySwPRrO	svogt@mailinator.com				\N	CL	[]	\N	\N	2022-05-25 18:40:02	\N	\N	0	0	\N	0	\N	1
15	gcox	$2y$10$9Bz/ZyU7OpO8MXaDov/GoOucJc2U8A386z.csrzMu1AObZvn6Si2S	gcox@mailinator.com				\N	US	[]	\N	\N	2022-05-25 18:40:28	\N	\N	0	0	\N	0	\N	1
16	shellier	$2y$10$AolE6RZBxgqQYiVLEL7bPO/4IjiJysysMPeaIgFoRSL9auIBtIPRW	shellier@mailinator.com				\N	ZA	[]	\N	\N	2022-05-25 18:41:03	\N	\N	0	0	\N	0	\N	1
17	cturner	$2y$10$hIQj2A4fQ0tGtMjLLZQEOOaR8NpO1yHr9c7rKiU6YJmOawU1qaWNC	cturner@mailinator.com				\N	GB	[]	\N	\N	2022-05-25 18:41:43	\N	\N	0	0	\N	0	\N	1
18	skumar	$2y$10$bcvFqS4Hsx8YYrPuYxa2be2roc4LUHFZdNTZ5Lk3XH3f5aOgu7XgW	skumar@mailinator.com				\N	SG	[]	\N	\N	2022-05-25 18:42:20	\N	\N	0	0	\N	0	\N	1
25	dkennepohl	$2y$10$C61prsTE2lMXpH145v0PquJSVeAcXQiuvlrISliTYr5nWmR4VpPaG	dkennepohl@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 18:57:55	\N	2022-05-25 18:57:55	\N	\N	\N	0	\N	1
29	lelder	$2y$10$bAsw7o9i2ar3yi0ZHXalWOms6MHjFFKJ2ZO/I.wpPBPcwzNlcZaOu	lelder@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:07:12	\N	2022-05-25 19:07:12	\N	\N	\N	0	\N	1
2	rvaca	$2y$10$QiK0RSXLYgHHB4ZU057MteOvjrEYxGp9M1hFEHIcTawIss7cuM/Ya	rvaca@mailinator.com				\N	MX	[]	\N	\N	2022-05-25 18:36:29	\N	2022-05-25 18:42:39	0	0	\N	0	\N	1
32	mforan	$2y$10$.phMv841elrGS/bqjvVT4.kL2eldf5pod9WoBy.I8XppgK5IqDgp2	mforan@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:18:46	\N	2022-05-25 19:18:46	\N	\N	\N	0	\N	1
1	admin	$2y$10$pck72lXz3MjgmHgXXxE1Xup9ODScpQG9S8r/iB337MAWxrKuFRvZG	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	\N	\N	\N	2022-05-25 18:35:18	\N	2022-05-25 18:43:13	\N	\N	\N	0	\N	1
19	aclark	$2y$10$rw385ksks3ZspXYkMAUAo.h2NYdv98B.I8oI38UE.fWO4K6YOzEYC	aclark@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 18:43:37	\N	2022-05-25 18:43:37	\N	\N	\N	0	\N	1
20	afinkel	$2y$10$TotzqVTttQiRIJOXaUWlvO0Wlc0JrNI/f335vSukBjgBVjh3suIU.	afinkel@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 18:44:50	\N	2022-05-25 18:44:50	\N	\N	\N	0	\N	1
26	fperini	$2y$10$byF9.za1Gb5.tarXPn/UtOtW60Gopj00vEDLo4xJOMi9BLL3ZoW6C	fperini@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:01:23	\N	2022-05-25 19:01:23	\N	\N	\N	0	\N	1
21	bbarnetson	$2y$10$9pW6bcZllOWIbujLPAD9AO.dl5hwcdPbH/K8TPBiik9mxW.y2rkfS	bbarnetson@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 18:47:45	\N	2022-05-25 18:47:45	\N	\N	\N	0	\N	1
22	bbeaty	$2y$10$3/4ZSvjaJvgsA7trnuu99Oe4x5EfF3QNolm/hPLlZAnAJE.y5fxfC	bbeaty@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 18:48:33	\N	2022-05-25 18:48:34	\N	\N	\N	0	\N	1
8	phudson	$2y$10$CLw3ng0PMAD6w1Y71I/Vu.4pA9UX6gUQ0o6giM6di4bHjNzHNkLqq	phudson@mailinator.com				\N	CA	[]	\N	\N	2022-05-25 18:37:48	\N	2022-05-25 19:09:54	0	0	\N	0	\N	1
23	callan	$2y$10$gECTwSdO3ZETzhXTnyoCPuxwAoOyaFEjS/NZLV9Y4x3NOP1WB8L5W	callan@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 18:52:26	\N	2022-05-25 18:52:26	\N	\N	\N	0	\N	1
27	jbrower	$2y$10$rgeo85GDZ3YrC1Gp0DekXOWrwsGCuUHIu.eZ.mer1AnLitqBGBl7.	jbrower@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:03:47	\N	2022-05-25 19:03:47	\N	\N	\N	0	\N	1
28	jlockehart	$2y$10$k7y2FROJfKqwtHux636o8ej6brsMIEiIwj6/YHEEOoI2ooht7wqUS	jlockehart@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:05:00	\N	2022-05-25 19:05:01	\N	\N	\N	0	\N	1
33	mpower	$2y$10$DsiQG/vJ/IA3YoSqZPzysevDJGe0Dq/VO9RjHCjuxedFyaMqO5r5q	mpower@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:19:39	\N	2022-05-25 19:19:39	\N	\N	\N	0	\N	1
30	mally	$2y$10$pOxCGNJb9AniKQqgmrCuYOfylW250KOLXJhFqqpDBg05jC5lppvLi	mally@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:10:16	\N	2022-05-25 19:10:16	\N	\N	\N	0	\N	1
12	gfavio	$2y$10$d1CO9.1oCq7jBVeW2sdJUub7P8HBnn9UlJNWV3MrChqN0qLtrc5YW	gfavio@mailinator.com				\N	ES	[]	\N	\N	2022-05-25 18:39:13	\N	2022-05-25 19:12:56	0	0	\N	0	\N	1
10	agallego	$2y$10$ljaDYDu8kmMJ33ylM3hI1uOvSeqKJgzz84PAWIxl42gQCg/AmgXlO	agallego@mailinator.com				\N	US	[]	\N	\N	2022-05-25 18:38:28	\N	2022-05-25 19:21:03	0	0	\N	0	\N	1
31	mdawson	$2y$10$G3.cL8XQ7DZe8RMkDZHLS.de4B3b4mx6u7UVKaG/CnAezQmxnmnlG	mdawson@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:13:53	\N	2022-05-25 19:13:53	\N	\N	\N	0	\N	1
34	msmith	$2y$10$.tpXhFxs/Kq8Cl.jeCAc4uHxbwSo4qgXkMydalh/sVWh15rHXIGOq	msmith@mailinator.com	\N	\N	\N	\N	CA	\N	\N	\N	2022-05-25 19:21:23	\N	2022-05-25 19:21:23	\N	\N	\N	0	\N	1
3	dbarnes	$2y$10$uRUCLqcn6XL8IWQDiHzaCOvzPrQc0Gr2po2NFhWkApXvCaV3iTLlG	dbarnes@mailinator.com				\N	AU	[]	\N	\N	2022-05-25 18:36:37	\N	2022-05-25 19:24:10	0	0	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 34, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2022-05-25 18:35:19	1	plugins.metadata	dc11		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.pubIds	urn	URNPubIdPlugin	0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.blocks	browse	\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.blocks	information	InformationBlockPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.blocks	makeSubmission	MakeSubmissionBlockPlugin	1	0
1	2	0	0	2022-05-25 18:35:19	1	plugins.generic	staticPages	StaticPagesPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	dublinCoreMeta	DublinCoreMetaPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	usageEvent		0	1
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	2	0	0	2022-05-25 18:35:19	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	htmlMonographFile	HtmlMonographFilePlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	usageStats	UsageStatsPlugin	0	1
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	acron		0	1
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.themes	default	DefaultThemePlugin	1	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.importexport	users		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.importexport	onix30		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.importexport	csv		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.importexport	native		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.paymethod	manual		0	0
1	0	0	0	2022-05-25 18:35:19	1	plugins.paymethod	paypal		0	0
3	4	0	0	2022-05-25 18:35:18	1	core	omp		0	1
\.


--
-- Name: access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_pkey UNIQUE (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_pkey UNIQUE (type_id, locale, setting_name);


--
-- Name: announcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (type_id);


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcement_id);


--
-- Name: auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (auth_id);


--
-- Name: author_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_pkey UNIQUE (author_id, locale, setting_name);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: c_v_e_s_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_pkey UNIQUE (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: category_path; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_path UNIQUE (context_id, path);


--
-- Name: category_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_pkey UNIQUE (category_id, locale, setting_name);


--
-- Name: chapter_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_authors
    ADD CONSTRAINT chapter_authors_pkey UNIQUE (author_id, chapter_id);


--
-- Name: citation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_pkey UNIQUE (citation_id, locale, setting_name);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: citations_publication_seq; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication_seq UNIQUE (publication_id, seq);


--
-- Name: completed_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.completed_payments
    ADD CONSTRAINT completed_payments_pkey PRIMARY KEY (completed_payment_id);


--
-- Name: controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocab_symbolic; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocab_symbolic UNIQUE (symbolic, assoc_type, assoc_id);


--
-- Name: controlled_vocabs_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocabs
    ADD CONSTRAINT controlled_vocabs_pkey PRIMARY KEY (controlled_vocab_id);


--
-- Name: data_object_tombstone_oai_set_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_pkey PRIMARY KEY (object_id);


--
-- Name: data_object_tombstone_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_pkey UNIQUE (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: doi_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_pkey UNIQUE (doi_id, locale, setting_name);


--
-- Name: dois_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_pkey PRIMARY KEY (doi_id);


--
-- Name: edit_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_pkey PRIMARY KEY (edit_decision_id);


--
-- Name: email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (log_id);


--
-- Name: email_log_user_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_user_id UNIQUE (email_log_id, user_id);


--
-- Name: email_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_settings_pkey UNIQUE (email_id, locale, setting_name);


--
-- Name: email_templates_default_data_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_pkey UNIQUE (email_key, locale);


--
-- Name: email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates_email_key; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_email_key UNIQUE (email_key, context_id);


--
-- Name: email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (email_id);


--
-- Name: event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: event_log_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_pkey UNIQUE (log_id, setting_name);


--
-- Name: failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (file_id);


--
-- Name: filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filter_groups_symbolic; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_groups
    ADD CONSTRAINT filter_groups_symbolic UNIQUE (symbolic);


--
-- Name: filter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_pkey UNIQUE (filter_id, locale, setting_name);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genre_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_pkey UNIQUE (genre_id, locale, setting_name);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: identification_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.identification_codes
    ADD CONSTRAINT identification_codes_pkey PRIMARY KEY (identification_code_id);


--
-- Name: item_views_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_pkey UNIQUE (assoc_type, assoc_id, user_id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: library_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_pkey UNIQUE (file_id, locale, setting_name);


--
-- Name: library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: markets_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (market_id);


--
-- Name: metadata_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metadata_descriptions
    ADD CONSTRAINT metadata_descriptions_pkey PRIMARY KEY (metadata_description_id);


--
-- Name: metadata_descripton_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metadata_description_settings
    ADD CONSTRAINT metadata_descripton_settings_pkey UNIQUE (metadata_description_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_pkey UNIQUE (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_pkey UNIQUE (navigation_menu_item_id, locale, setting_name);


--
-- Name: navigation_menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_pkey PRIMARY KEY (navigation_menu_item_id);


--
-- Name: navigation_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menus
    ADD CONSTRAINT navigation_menus_pkey PRIMARY KEY (navigation_menu_id);


--
-- Name: new_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.new_releases
    ADD CONSTRAINT new_releases_pkey UNIQUE (assoc_type, assoc_id, submission_id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list_email_context; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_email_context UNIQUE (email, context);


--
-- Name: notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey UNIQUE (notification_id, locale, setting_name);


--
-- Name: notification_subscription_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_pkey PRIMARY KEY (setting_id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: oai_resumption_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens
    ADD CONSTRAINT oai_resumption_tokens_pkey UNIQUE (token);


--
-- Name: plugin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_pkey UNIQUE (plugin_name, context_id, setting_name);


--
-- Name: press_features_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT press_features_pkey UNIQUE (assoc_type, assoc_id, submission_id);


--
-- Name: press_path; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses
    ADD CONSTRAINT press_path UNIQUE (path);


--
-- Name: press_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.press_settings
    ADD CONSTRAINT press_settings_pkey UNIQUE (press_id, locale, setting_name);


--
-- Name: presses_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.presses
    ADD CONSTRAINT presses_pkey PRIMARY KEY (press_id);


--
-- Name: publication_categories_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_id UNIQUE (publication_id, category_id);


--
-- Name: publication_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_dates
    ADD CONSTRAINT publication_dates_pkey PRIMARY KEY (publication_date_id);


--
-- Name: publication_format_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_format_settings
    ADD CONSTRAINT publication_format_settings_pkey UNIQUE (publication_format_id, locale, setting_name);


--
-- Name: publication_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats
    ADD CONSTRAINT publication_formats_pkey PRIMARY KEY (publication_format_id);


--
-- Name: publication_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_pkey UNIQUE (publication_id, locale, setting_name);


--
-- Name: publications_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (publication_id);


--
-- Name: queries_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (query_id);


--
-- Name: query_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_pkey UNIQUE (query_id, user_id);


--
-- Name: queued_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.queued_payments
    ADD CONSTRAINT queued_payments_pkey PRIMARY KEY (queued_payment_id);


--
-- Name: representatives_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.representatives
    ADD CONSTRAINT representatives_pkey PRIMARY KEY (representative_id);


--
-- Name: review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_pkey UNIQUE (review_id, submission_file_id);


--
-- Name: review_form_element_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_pkey UNIQUE (review_form_element_id, locale, setting_name);


--
-- Name: review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_form_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_pkey UNIQUE (review_form_id, locale, setting_name);


--
-- Name: review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_round_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_pkey UNIQUE (submission_id, review_round_id, submission_file_id);


--
-- Name: review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: review_rounds_submission_id_stage_id_round_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_submission_id_stage_id_round_pkey UNIQUE (submission_id, stage_id, round);


--
-- Name: sales_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sales_rights
    ADD CONSTRAINT sales_rights_pkey PRIMARY KEY (sales_rights_id);


--
-- Name: scheduled_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.scheduled_tasks
    ADD CONSTRAINT scheduled_tasks_pkey UNIQUE (class_name);


--
-- Name: section_editors_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_pkey UNIQUE (context_id, assoc_id, assoc_type, user_id);


--
-- Name: series_categories_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_categories
    ADD CONSTRAINT series_categories_id UNIQUE (series_id, category_id);


--
-- Name: series_path; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_path UNIQUE (press_id, path);


--
-- Name: series_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: series_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_settings
    ADD CONSTRAINT series_settings_pkey UNIQUE (series_id, locale, setting_name);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey UNIQUE (session_id);


--
-- Name: site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey UNIQUE (setting_name, locale);


--
-- Name: spotlight_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlight_settings
    ADD CONSTRAINT spotlight_settings_pkey UNIQUE (spotlight_id, locale, setting_name);


--
-- Name: spotlights_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlights
    ADD CONSTRAINT spotlights_pkey PRIMARY KEY (spotlight_id);


--
-- Name: stage_assignment; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignment UNIQUE (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: static_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_page_settings
    ADD CONSTRAINT static_page_settings_pkey UNIQUE (static_page_id, locale, setting_name);


--
-- Name: static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (static_page_id);


--
-- Name: submission_chapter_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_settings
    ADD CONSTRAINT submission_chapter_settings_pkey UNIQUE (chapter_id, locale, setting_name);


--
-- Name: submission_chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_pkey PRIMARY KEY (chapter_id);


--
-- Name: submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_file_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_pkey PRIMARY KEY (revision_id);


--
-- Name: submission_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_pkey UNIQUE (submission_file_id, locale, setting_name);


--
-- Name: submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (submission_file_id);


--
-- Name: submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_keyword_text; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_text UNIQUE (keyword_text);


--
-- Name: submission_search_object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_pkey UNIQUE (object_id, pos);


--
-- Name: submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_pkey UNIQUE (submission_id, locale, setting_name);


--
-- Name: submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (submission_id);


--
-- Name: temporary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_pkey PRIMARY KEY (file_id);


--
-- Name: u_e_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT u_e_pkey UNIQUE (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_pkey UNIQUE (user_group_id, locale, setting_name);


--
-- Name: user_group_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_pkey UNIQUE (context_id, user_group_id, stage_id);


--
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey UNIQUE (user_id, locale, setting_name);


--
-- Name: user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey UNIQUE (user_group_id, user_id);


--
-- Name: users_email; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_username; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
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
-- Name: announcement_types_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcement_types_context_id ON public.announcement_types USING btree (context_id);


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
-- Name: doi_settings_doi_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX doi_settings_doi_id ON public.doi_settings USING btree (doi_id);


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
-- Name: review_assignment_reviewer_round; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_assignment_reviewer_round ON public.review_assignments USING btree (review_round_id, reviewer_id);


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
-- Name: announcement_settings_announcement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_announcement_id_foreign FOREIGN KEY (announcement_id) REFERENCES public.announcements(announcement_id);


--
-- Name: announcement_type_settings_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id);


--
-- Name: announcement_types_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id);


--
-- Name: announcements_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id);


--
-- Name: categories_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id);


--
-- Name: categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.categories(category_id) ON DELETE SET NULL;


--
-- Name: category_settings_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;


--
-- Name: doi_settings_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE CASCADE;


--
-- Name: dois_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id);


--
-- Name: edit_decisions_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id);


--
-- Name: item_views_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: publication_categories_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;


--
-- Name: publication_categories_publication_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_publication_id_foreign FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: publication_formats_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats
    ADD CONSTRAINT publication_formats_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: publications_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: review_assignments_review_form_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_review_form_id_foreign FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id);


--
-- Name: review_assignments_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id);


--
-- Name: review_assignments_reviewer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_reviewer_id_foreign FOREIGN KEY (reviewer_id) REFERENCES public.users(user_id);


--
-- Name: review_assignments_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id);


--
-- Name: review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_chapters_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: submission_chapters_source_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_source_chapter_id_foreign FOREIGN KEY (source_chapter_id) REFERENCES public.submission_chapters(chapter_id);


--
-- Name: submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id);


--
-- Name: submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id);


--
-- Name: submission_files_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
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

