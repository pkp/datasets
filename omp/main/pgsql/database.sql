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

ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records DROP CONSTRAINT ustr_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records DROP CONSTRAINT ustr_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records DROP CONSTRAINT ustr_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records DROP CONSTRAINT ustr_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records DROP CONSTRAINT ustr_chapter_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records DROP CONSTRAINT usti_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records DROP CONSTRAINT usti_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records DROP CONSTRAINT usti_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records DROP CONSTRAINT usti_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records DROP CONSTRAINT usti_chapter_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_series_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_chapter_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_chapter_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_chapter_id_foreign;
ALTER TABLE ONLY public.usage_stats_institution_temporary_records DROP CONSTRAINT usi_institution_id_foreign;
ALTER TABLE ONLY public.user_user_groups DROP CONSTRAINT user_user_groups_user_id;
ALTER TABLE ONLY public.user_user_groups DROP CONSTRAINT user_user_groups_user_group_id_foreign;
ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_user_id_foreign;
ALTER TABLE ONLY public.user_interests DROP CONSTRAINT user_interests_user_id_foreign;
ALTER TABLE ONLY public.user_interests DROP CONSTRAINT user_interests_controlled_vocab_entry_id_foreign;
ALTER TABLE ONLY public.user_group_stage DROP CONSTRAINT user_group_stage_user_group_id;
ALTER TABLE ONLY public.user_group_stage DROP CONSTRAINT user_group_stage_context_id;
ALTER TABLE ONLY public.user_group_settings DROP CONSTRAINT user_group_settings_user_group_id_foreign;
ALTER TABLE ONLY public.temporary_files DROP CONSTRAINT temporary_files_user_id;
ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_publication_id;
ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_context_id;
ALTER TABLE ONLY public.submission_settings DROP CONSTRAINT submission_settings_submission_id_foreign;
ALTER TABLE ONLY public.submission_search_objects DROP CONSTRAINT submission_search_object_submission;
ALTER TABLE ONLY public.submission_search_object_keywords DROP CONSTRAINT submission_search_object_keywords_object_id_foreign;
ALTER TABLE ONLY public.submission_search_object_keywords DROP CONSTRAINT submission_search_object_keywords_keyword_id;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_uploader_user_id_foreign;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_submission_id;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_source_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_genre_id_foreign;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_file_id_foreign;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_doi_id_foreign;
ALTER TABLE ONLY public.submission_file_settings DROP CONSTRAINT submission_file_settings_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_file_id_foreign;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_submission_id;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_author_id_foreign;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_source_chapter_id_foreign;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_publication_id;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_primary_contact_id_foreign;
ALTER TABLE ONLY public.submission_chapters DROP CONSTRAINT submission_chapters_doi_id_foreign;
ALTER TABLE ONLY public.submission_chapter_settings DROP CONSTRAINT submission_chapter_settings_chapter_id_foreign;
ALTER TABLE ONLY public.submission_chapter_authors DROP CONSTRAINT submission_chapter_authors_chapter_id_foreign;
ALTER TABLE ONLY public.submission_chapter_authors DROP CONSTRAINT submission_chapter_authors_author_id_foreign;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT subeditor_submission_group_user_id;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_user_id;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_user_group_id;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_submission_id_foreign;
ALTER TABLE ONLY public.spotlights DROP CONSTRAINT spotlights_press_id_foreign;
ALTER TABLE ONLY public.spotlight_settings DROP CONSTRAINT spotlight_settings_spotlight_id_foreign;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_user_id;
ALTER TABLE ONLY public.series_settings DROP CONSTRAINT series_settings_series_id;
ALTER TABLE ONLY public.series DROP CONSTRAINT series_review_form_id;
ALTER TABLE ONLY public.series DROP CONSTRAINT series_press_id;
ALTER TABLE ONLY public.series_categories DROP CONSTRAINT series_categories_series_id;
ALTER TABLE ONLY public.series_categories DROP CONSTRAINT series_categories_category_id;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT section_editors_context_id;
ALTER TABLE ONLY public.sales_rights DROP CONSTRAINT sales_rights_publication_format_id;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_submission_id_foreign;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_submission_file_id_foreign;
ALTER TABLE ONLY public.review_form_settings DROP CONSTRAINT review_form_settings_review_form_id;
ALTER TABLE ONLY public.review_form_responses DROP CONSTRAINT review_form_responses_review_id_foreign;
ALTER TABLE ONLY public.review_form_responses DROP CONSTRAINT review_form_responses_review_form_element_id_foreign;
ALTER TABLE ONLY public.review_form_elements DROP CONSTRAINT review_form_elements_review_form_id;
ALTER TABLE ONLY public.review_form_element_settings DROP CONSTRAINT review_form_element_settings_review_form_element_id;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_submission_file_id_foreign;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_review_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_submission_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_reviewer_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_review_round_id_foreign;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_review_form_id_foreign;
ALTER TABLE ONLY public.representatives DROP CONSTRAINT representatives_submission_id;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_user_id_foreign;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_query_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_submission_id;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_series_id;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_doi_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_author_id;
ALTER TABLE ONLY public.publication_settings DROP CONSTRAINT publication_settings_publication_id_foreign;
ALTER TABLE ONLY public.publication_formats DROP CONSTRAINT publication_formats_publication_id;
ALTER TABLE ONLY public.publication_formats DROP CONSTRAINT publication_formats_doi_id_foreign;
ALTER TABLE ONLY public.publication_format_settings DROP CONSTRAINT publication_format_settings_publication_format_id;
ALTER TABLE ONLY public.publication_dates DROP CONSTRAINT publication_dates_publication_format_id;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_publication_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_category_id_foreign;
ALTER TABLE ONLY public.press_settings DROP CONSTRAINT press_settings_press_id_foreign;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_user_id_foreign;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_context_foreign;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_notification_id_foreign;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_user_id_foreign;
ALTER TABLE ONLY public.new_releases DROP CONSTRAINT new_releases_submission_id;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_navigation_menu_id;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_navigation_menu_item_id_foreig;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_navigation_menu_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_monthly DROP CONSTRAINT msm_submission_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_monthly DROP CONSTRAINT msm_context_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly DROP CONSTRAINT msim_submission_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly DROP CONSTRAINT msim_institution_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly DROP CONSTRAINT msim_context_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_institution_daily DROP CONSTRAINT msid_submission_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_institution_daily DROP CONSTRAINT msid_institution_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_institution_daily DROP CONSTRAINT msid_context_id_foreign;
ALTER TABLE ONLY public.metrics_submission_geo_monthly DROP CONSTRAINT msgm_submission_id_foreign;
ALTER TABLE ONLY public.metrics_submission_geo_monthly DROP CONSTRAINT msgm_context_id_foreign;
ALTER TABLE ONLY public.metrics_submission_geo_daily DROP CONSTRAINT msgd_submission_id_foreign;
ALTER TABLE ONLY public.metrics_submission_geo_daily DROP CONSTRAINT msgd_context_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_daily DROP CONSTRAINT msd_submission_id_foreign;
ALTER TABLE ONLY public.metrics_counter_submission_daily DROP CONSTRAINT msd_context_id_foreign;
ALTER TABLE ONLY public.metrics_submission DROP CONSTRAINT metrics_submission_submission_id_foreign;
ALTER TABLE ONLY public.metrics_submission DROP CONSTRAINT metrics_submission_submission_file_id_foreign;
ALTER TABLE ONLY public.metrics_submission DROP CONSTRAINT metrics_submission_representation_id_foreign;
ALTER TABLE ONLY public.metrics_submission DROP CONSTRAINT metrics_submission_context_id_foreign;
ALTER TABLE ONLY public.metrics_submission DROP CONSTRAINT metrics_submission_chapter_id_foreign;
ALTER TABLE ONLY public.metrics_series DROP CONSTRAINT metrics_series_series_id_foreign;
ALTER TABLE ONLY public.metrics_series DROP CONSTRAINT metrics_series_context_id_foreign;
ALTER TABLE ONLY public.metrics_context DROP CONSTRAINT metrics_context_context_id_foreign;
ALTER TABLE ONLY public.markets DROP CONSTRAINT markets_publication_format_id;
ALTER TABLE ONLY public.mailable_templates DROP CONSTRAINT mailable_templates_email_id_foreign;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_submission_id_foreign;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_context_id;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_file_id_foreign;
ALTER TABLE ONLY public.item_views DROP CONSTRAINT item_views_user_id_foreign;
ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_context_id_foreign;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_institution_id_foreign;
ALTER TABLE ONLY public.institution_ip DROP CONSTRAINT institution_ip_institution_id_foreign;
ALTER TABLE ONLY public.identification_codes DROP CONSTRAINT identification_codes_publication_format_id;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_context_id_foreign;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_genre_id_foreign;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_filter_group_id_foreign;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_filter_id_foreign;
ALTER TABLE ONLY public.features DROP CONSTRAINT features_submission_id_foreign;
ALTER TABLE ONLY public.event_log DROP CONSTRAINT event_log_user_id_foreign;
ALTER TABLE ONLY public.event_log_settings DROP CONSTRAINT event_log_settings_log_id;
ALTER TABLE ONLY public.email_templates_settings DROP CONSTRAINT email_templates_settings_email_id;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_context_id_foreign;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_users_user_id_foreign;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_users_email_log_id_foreign;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_submission_id;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_review_round_id_foreign;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_editor_id;
ALTER TABLE ONLY public.dois DROP CONSTRAINT dois_context_id_foreign;
ALTER TABLE ONLY public.doi_settings DROP CONSTRAINT doi_settings_doi_id_foreign;
ALTER TABLE ONLY public.data_object_tombstone_settings DROP CONSTRAINT data_object_tombstone_settings_tombstone_id;
ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects DROP CONSTRAINT data_object_tombstone_oai_set_objects_tombstone_id;
ALTER TABLE ONLY public.controlled_vocab_entries DROP CONSTRAINT controlled_vocab_entries_controlled_vocab_id_foreign;
ALTER TABLE ONLY public.completed_payments DROP CONSTRAINT completed_payments_user_id_foreign;
ALTER TABLE ONLY public.completed_payments DROP CONSTRAINT completed_payments_context_id;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_publication;
ALTER TABLE ONLY public.citation_settings DROP CONSTRAINT citation_settings_citation_id;
ALTER TABLE ONLY public.category_settings DROP CONSTRAINT category_settings_category_id_foreign;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_parent_id_foreign;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_context_id_foreign;
ALTER TABLE ONLY public.controlled_vocab_entry_settings DROP CONSTRAINT c_v_e_s_entry_id;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_user_group_id_foreign;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_publication_id_foreign;
ALTER TABLE ONLY public.author_settings DROP CONSTRAINT author_settings_author_id;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT assignment_settings_navigation_menu_item_assignment_id;
ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_type_id_foreign;
ALTER TABLE ONLY public.announcement_types DROP CONSTRAINT announcement_types_context_id_foreign;
ALTER TABLE ONLY public.announcement_type_settings DROP CONSTRAINT announcement_type_settings_type_id_foreign;
ALTER TABLE ONLY public.announcement_settings DROP CONSTRAINT announcement_settings_announcement_id_foreign;
ALTER TABLE ONLY public.access_keys DROP CONSTRAINT access_keys_user_id_foreign;
DROP INDEX public.ustr_submission_id;
DROP INDEX public.ustr_submission_file_id;
DROP INDEX public.ustr_representation_id;
DROP INDEX public.ustr_context_id;
DROP INDEX public.ustr_chapter_id;
DROP INDEX public.usti_submission_id;
DROP INDEX public.usti_submission_file_id;
DROP INDEX public.usti_representation_id;
DROP INDEX public.usti_context_id;
DROP INDEX public.usti_chapter_id;
DROP INDEX public.ust_submission_id;
DROP INDEX public.ust_submission_file_id;
DROP INDEX public.ust_series_id;
DROP INDEX public.ust_representation_id;
DROP INDEX public.ust_context_id;
DROP INDEX public.ust_chapter_id;
DROP INDEX public.usir_submission_id;
DROP INDEX public.usir_submission_file_id;
DROP INDEX public.usir_representation_id;
DROP INDEX public.usir_context_id;
DROP INDEX public.usir_chapter_id;
DROP INDEX public.usii_submission_id;
DROP INDEX public.usii_submission_file_id;
DROP INDEX public.usii_representation_id;
DROP INDEX public.usii_context_id;
DROP INDEX public.usii_chapter_id;
DROP INDEX public.usi_institution_id;
DROP INDEX public.users_username;
DROP INDEX public.users_email;
DROP INDEX public.user_user_groups_user_id;
DROP INDEX public.user_user_groups_user_group_id;
DROP INDEX public.user_settings_user_id;
DROP INDEX public.user_settings_locale_setting_name_index;
DROP INDEX public.user_interests_user_id;
DROP INDEX public.user_interests_controlled_vocab_entry_id;
DROP INDEX public.user_groups_user_group_id;
DROP INDEX public.user_groups_role_id;
DROP INDEX public.user_groups_context_id;
DROP INDEX public.user_group_stage_user_group_id;
DROP INDEX public.user_group_stage_stage_id;
DROP INDEX public.user_group_stage_context_id;
DROP INDEX public.user_group_settings_user_group_id;
DROP INDEX public.temporary_files_user_id;
DROP INDEX public.submissions_context_id;
DROP INDEX public.submission_settings_submission_id;
DROP INDEX public.submission_search_objects_submission_id;
DROP INDEX public.submission_search_object_keywords_object_id;
DROP INDEX public.submission_search_object_keywords_keyword_id;
DROP INDEX public.submission_files_uploader_user_id;
DROP INDEX public.submission_files_submission_id;
DROP INDEX public.submission_files_stage_assoc;
DROP INDEX public.submission_files_source_submission_file_id;
DROP INDEX public.submission_files_genre_id;
DROP INDEX public.submission_files_file_id;
DROP INDEX public.submission_files_doi_id;
DROP INDEX public.submission_file_settings_submission_file_id;
DROP INDEX public.submission_file_revisions_submission_file_id;
DROP INDEX public.submission_file_revisions_file_id;
DROP INDEX public.submission_comments_submission_id;
DROP INDEX public.submission_comments_author_id;
DROP INDEX public.submission_chapters_source_chapter_id;
DROP INDEX public.submission_chapters_publication_id;
DROP INDEX public.submission_chapters_primary_contact_id;
DROP INDEX public.submission_chapter_settings_chapter_id;
DROP INDEX public.submission_chapter_authors_chapter_id;
DROP INDEX public.submission_chapter_authors_author_id;
DROP INDEX public.subeditor_submission_group_user_id;
DROP INDEX public.subeditor_submission_group_context_id;
DROP INDEX public.subeditor_submission_group_assoc_id;
DROP INDEX public.static_page_settings_static_page_id;
DROP INDEX public.stage_assignments_user_id;
DROP INDEX public.stage_assignments_user_group_id;
DROP INDEX public.stage_assignments_submission_id;
DROP INDEX public.spotlights_press_id;
DROP INDEX public.spotlights_assoc;
DROP INDEX public.spotlight_settings_id;
DROP INDEX public.sessions_user_id;
DROP INDEX public.series_settings_series_id;
DROP INDEX public.series_review_form_id;
DROP INDEX public.series_press_id;
DROP INDEX public.series_categories_series_id;
DROP INDEX public.series_categories_category_id;
DROP INDEX public.sales_rights_publication_format_id;
DROP INDEX public.review_rounds_submission_id;
DROP INDEX public.review_round_files_submission_id;
DROP INDEX public.review_round_files_submission_file_id;
DROP INDEX public.review_form_settings_review_form_id;
DROP INDEX public.review_form_responses_review_id;
DROP INDEX public.review_form_responses_review_form_element_id;
DROP INDEX public.review_form_responses_pkey;
DROP INDEX public.review_form_elements_review_form_id;
DROP INDEX public.review_form_element_settings_review_form_element_id;
DROP INDEX public.review_files_submission_file_id;
DROP INDEX public.review_files_review_id;
DROP INDEX public.review_assignments_submission_id;
DROP INDEX public.review_assignments_reviewer_review;
DROP INDEX public.review_assignments_reviewer_id;
DROP INDEX public.review_assignments_form_id;
DROP INDEX public.review_assignment_reviewer_round;
DROP INDEX public.representatives_submission_id;
DROP INDEX public.query_participants_user_id;
DROP INDEX public.query_participants_query_id;
DROP INDEX public.queries_assoc_id;
DROP INDEX public.publications_submission_id;
DROP INDEX public.publications_section_id;
DROP INDEX public.publications_primary_contact_id;
DROP INDEX public.publications_doi_id;
DROP INDEX public.publication_settings_name_value;
DROP INDEX public.publication_formats_publication_id;
DROP INDEX public.publication_formats_doi_id;
DROP INDEX public.publication_format_submission_id;
DROP INDEX public.publication_format_id_key;
DROP INDEX public.publication_dates_publication_format_id;
DROP INDEX public.publication_categories_publication_id;
DROP INDEX public.publication_categories_category_id;
DROP INDEX public.press_settings_press_id;
DROP INDEX public.plugin_settings_plugin_name;
DROP INDEX public.notifications_user_id_level;
DROP INDEX public.notifications_context_id_user_id;
DROP INDEX public.notifications_context_id;
DROP INDEX public.notifications_assoc;
DROP INDEX public.notification_subscription_settings_user_id;
DROP INDEX public.notification_subscription_settings_context;
DROP INDEX public.notification_settings_notification_id;
DROP INDEX public.notes_user_id;
DROP INDEX public.notes_assoc;
DROP INDEX public.new_releases_submission_id;
DROP INDEX public.navigation_menu_item_settings_navigation_menu_item_id;
DROP INDEX public.navigation_menu_item_assignments_navigation_menu_item_id;
DROP INDEX public.navigation_menu_item_assignments_navigation_menu_id;
DROP INDEX public.navigation_menu_item_assignment_settings_n_m_i_a_id;
DROP INDEX public.msm_context_id_submission_id;
DROP INDEX public.msim_submission_id;
DROP INDEX public.msim_institution_id;
DROP INDEX public.msim_context_id_submission_id;
DROP INDEX public.msim_context_id;
DROP INDEX public.msid_submission_id;
DROP INDEX public.msid_load_id;
DROP INDEX public.msid_institution_id;
DROP INDEX public.msid_context_id_submission_id;
DROP INDEX public.msid_context_id;
DROP INDEX public.msgm_context_id_submission_id;
DROP INDEX public.msgd_load_id;
DROP INDEX public.msgd_context_id_submission_id;
DROP INDEX public.msd_load_id;
DROP INDEX public.msd_context_id_submission_id;
DROP INDEX public.ms_load_id;
DROP INDEX public.ms_context_id_submission_id_assoc_type_file_type;
DROP INDEX public.metrics_submission_submission_id;
DROP INDEX public.metrics_submission_submission_file_id;
DROP INDEX public.metrics_submission_representation_id;
DROP INDEX public.metrics_submission_geo_monthly_submission_id;
DROP INDEX public.metrics_submission_geo_monthly_context_id;
DROP INDEX public.metrics_submission_geo_daily_submission_id;
DROP INDEX public.metrics_submission_geo_daily_context_id;
DROP INDEX public.metrics_submission_context_id;
DROP INDEX public.metrics_submission_chapter_id;
DROP INDEX public.metrics_series_series_id;
DROP INDEX public.metrics_series_load_id;
DROP INDEX public.metrics_series_context_id_series_id;
DROP INDEX public.metrics_series_context_id;
DROP INDEX public.metrics_counter_submission_monthly_submission_id;
DROP INDEX public.metrics_counter_submission_monthly_context_id;
DROP INDEX public.metrics_counter_submission_daily_submission_id;
DROP INDEX public.metrics_counter_submission_daily_context_id;
DROP INDEX public.metrics_context_load_id;
DROP INDEX public.metrics_context_context_id;
DROP INDEX public.markets_publication_format_id;
DROP INDEX public.mailable_templates_email_id;
DROP INDEX public.library_files_submission_id;
DROP INDEX public.library_files_context_id;
DROP INDEX public.library_file_settings_file_id;
DROP INDEX public.jobs_queue_reserved_at_index;
DROP INDEX public.item_views_user_id;
DROP INDEX public.institutions_context_id;
DROP INDEX public.institution_settings_institution_id;
DROP INDEX public.institution_ip_start;
DROP INDEX public.institution_ip_institution_id;
DROP INDEX public.institution_ip_end;
DROP INDEX public.identification_codes_publication_format_id;
DROP INDEX public.identification_codes_key;
DROP INDEX public.genres_context_id;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.format_sales_rights_pkey;
DROP INDEX public.format_representatives_pkey;
DROP INDEX public.format_publication_dates_pkey;
DROP INDEX public.format_markets_pkey;
DROP INDEX public.filters_filter_group_id;
DROP INDEX public.filter_settings_id;
DROP INDEX public.features_submission_id;
DROP INDEX public.event_log_user_id;
DROP INDEX public.event_log_settings_name_value;
DROP INDEX public.event_log_settings_log_id;
DROP INDEX public.event_log_assoc;
DROP INDEX public.email_templates_settings_email_id;
DROP INDEX public.email_templates_context_id;
DROP INDEX public.email_log_users_user_id;
DROP INDEX public.email_log_users_email_log_id;
DROP INDEX public.email_log_assoc;
DROP INDEX public.edit_decisions_submission_id;
DROP INDEX public.edit_decisions_review_round_id;
DROP INDEX public.edit_decisions_editor_id;
DROP INDEX public.dois_context_id;
DROP INDEX public.doi_settings_doi_id;
DROP INDEX public.data_object_tombstones_data_object_id;
DROP INDEX public.data_object_tombstone_settings_tombstone_id;
DROP INDEX public.data_object_tombstone_oai_set_objects_tombstone_id;
DROP INDEX public.controlled_vocab_entries_cv_id;
DROP INDEX public.controlled_vocab_entries_controlled_vocab_id;
DROP INDEX public.completed_payments_user_id;
DROP INDEX public.completed_payments_context_id;
DROP INDEX public.citations_publication;
DROP INDEX public.citation_settings_citation_id;
DROP INDEX public.chapters_chapter_id;
DROP INDEX public.category_settings_category_id;
DROP INDEX public.category_parent_id;
DROP INDEX public.category_context_parent_id;
DROP INDEX public.category_context_id;
DROP INDEX public.c_v_e_s_entry_id;
DROP INDEX public.authors_user_group_id;
DROP INDEX public.author_settings_author_id;
DROP INDEX public.announcements_type_id;
DROP INDEX public.announcements_assoc;
DROP INDEX public.announcement_types_context_id;
DROP INDEX public.announcement_type_settings_type_id;
DROP INDEX public.announcement_settings_announcement_id;
DROP INDEX public.access_keys_user_id;
DROP INDEX public.access_keys_hash;
ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_pkey;
ALTER TABLE ONLY public.usage_stats_institution_temporary_records DROP CONSTRAINT usi_load_id_line_number_institution_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
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
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
ALTER TABLE ONLY public.new_releases DROP CONSTRAINT new_releases_pkey;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_pkey;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_pkey;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT navigation_menu_item_assignment_settings_pkey;
ALTER TABLE ONLY public.metrics_counter_submission_monthly DROP CONSTRAINT msm_uc_context_id_submission_id_month;
ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly DROP CONSTRAINT msim_uc_context_id_submission_id_institution_id_month;
ALTER TABLE ONLY public.metrics_counter_submission_institution_daily DROP CONSTRAINT msid_uc_load_id_context_id_submission_id_institution_id_date;
ALTER TABLE ONLY public.metrics_submission_geo_monthly DROP CONSTRAINT msgm_uc_context_submission_c_r_c_month;
ALTER TABLE ONLY public.metrics_submission_geo_daily DROP CONSTRAINT msgd_uc_load_context_submission_c_r_c_date;
ALTER TABLE ONLY public.metrics_counter_submission_daily DROP CONSTRAINT msd_uc_load_id_context_id_submission_id_date;
ALTER TABLE ONLY public.markets DROP CONSTRAINT markets_pkey;
ALTER TABLE ONLY public.mailable_templates DROP CONSTRAINT mailable_templates_pkey;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_pkey;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_pkey;
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
ALTER TABLE ONLY public.item_views DROP CONSTRAINT item_views_pkey;
ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_pkey;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_pkey;
ALTER TABLE ONLY public.institution_ip DROP CONSTRAINT institution_ip_pkey;
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
ALTER TABLE public.notes ALTER COLUMN note_id DROP DEFAULT;
ALTER TABLE public.navigation_menus ALTER COLUMN navigation_menu_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_items ALTER COLUMN navigation_menu_item_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id DROP DEFAULT;
ALTER TABLE public.markets ALTER COLUMN market_id DROP DEFAULT;
ALTER TABLE public.library_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.institutions ALTER COLUMN institution_id DROP DEFAULT;
ALTER TABLE public.institution_ip ALTER COLUMN institution_ip_id DROP DEFAULT;
ALTER TABLE public.identification_codes ALTER COLUMN identification_code_id DROP DEFAULT;
ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
ALTER TABLE public.filters ALTER COLUMN filter_id DROP DEFAULT;
ALTER TABLE public.filter_groups ALTER COLUMN filter_group_id DROP DEFAULT;
ALTER TABLE public.files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.event_log ALTER COLUMN log_id DROP DEFAULT;
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
DROP TABLE public.usage_stats_unique_title_requests_temporary_records;
DROP TABLE public.usage_stats_unique_title_investigations_temporary_records;
DROP TABLE public.usage_stats_unique_item_requests_temporary_records;
DROP TABLE public.usage_stats_unique_item_investigations_temporary_records;
DROP TABLE public.usage_stats_total_temporary_records;
DROP TABLE public.usage_stats_institution_temporary_records;
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
DROP TABLE public.metrics_submission_geo_monthly;
DROP TABLE public.metrics_submission_geo_daily;
DROP TABLE public.metrics_submission;
DROP TABLE public.metrics_series;
DROP TABLE public.metrics_counter_submission_monthly;
DROP TABLE public.metrics_counter_submission_institution_monthly;
DROP TABLE public.metrics_counter_submission_institution_daily;
DROP TABLE public.metrics_counter_submission_daily;
DROP TABLE public.metrics_context;
DROP SEQUENCE public.markets_market_id_seq;
DROP TABLE public.markets;
DROP TABLE public.mailable_templates;
DROP SEQUENCE public.library_files_file_id_seq;
DROP TABLE public.library_files;
DROP TABLE public.library_file_settings;
DROP SEQUENCE public.jobs_id_seq;
DROP TABLE public.jobs;
DROP TABLE public.job_batches;
DROP TABLE public.item_views;
DROP SEQUENCE public.institutions_institution_id_seq;
DROP TABLE public.institutions;
DROP TABLE public.institution_settings;
DROP SEQUENCE public.institution_ip_institution_ip_id_seq;
DROP TABLE public.institution_ip;
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
DROP TABLE public.email_templates_default_data;
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
    publication_id bigint NOT NULL,
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
    email_key character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    enabled smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.email_templates OWNER TO "omp-ci";

--
-- Name: COLUMN email_templates.email_key; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.email_templates.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default_data; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.email_templates_default_data (
    email_key character varying(255) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying NOT NULL,
    subject character varying(255) NOT NULL,
    body text
);


ALTER TABLE public.email_templates_default_data OWNER TO "omp-ci";

--
-- Name: COLUMN email_templates_default_data.email_key; Type: COMMENT; Schema: public; Owner: omp-ci
--

COMMENT ON COLUMN public.email_templates_default_data.email_key IS 'Unique identifier for this email.';


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
-- Name: institution_ip; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.institution_ip (
    institution_ip_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    ip_string character varying(40) NOT NULL,
    ip_start bigint NOT NULL,
    ip_end bigint
);


ALTER TABLE public.institution_ip OWNER TO "omp-ci";

--
-- Name: institution_ip_institution_ip_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.institution_ip_institution_ip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institution_ip_institution_ip_id_seq OWNER TO "omp-ci";

--
-- Name: institution_ip_institution_ip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.institution_ip_institution_ip_id_seq OWNED BY public.institution_ip.institution_ip_id;


--
-- Name: institution_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.institution_settings (
    institution_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.institution_settings OWNER TO "omp-ci";

--
-- Name: institutions; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.institutions (
    institution_id bigint NOT NULL,
    context_id bigint NOT NULL,
    ror character varying(255),
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.institutions OWNER TO "omp-ci";

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: omp-ci
--

CREATE SEQUENCE public.institutions_institution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institutions_institution_id_seq OWNER TO "omp-ci";

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: omp-ci
--

ALTER SEQUENCE public.institutions_institution_id_seq OWNED BY public.institutions.institution_id;


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
-- Name: job_batches; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO "omp-ci";

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
-- Name: mailable_templates; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.mailable_templates (
    email_id bigint NOT NULL,
    mailable_id character varying(255) NOT NULL
);


ALTER TABLE public.mailable_templates OWNER TO "omp-ci";

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
-- Name: metrics_context; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_context (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL
);


ALTER TABLE public.metrics_context OWNER TO "omp-ci";

--
-- Name: metrics_counter_submission_daily; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_counter_submission_daily (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    date date NOT NULL,
    metric_book_investigations integer NOT NULL,
    metric_book_investigations_unique integer NOT NULL,
    metric_book_requests integer NOT NULL,
    metric_book_requests_unique integer NOT NULL,
    metric_chapter_investigations integer NOT NULL,
    metric_chapter_investigations_unique integer NOT NULL,
    metric_chapter_requests integer NOT NULL,
    metric_chapter_requests_unique integer NOT NULL,
    metric_title_investigations_unique integer NOT NULL,
    metric_title_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_daily OWNER TO "omp-ci";

--
-- Name: metrics_counter_submission_institution_daily; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_counter_submission_institution_daily (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    date date NOT NULL,
    metric_book_investigations integer NOT NULL,
    metric_book_investigations_unique integer NOT NULL,
    metric_book_requests integer NOT NULL,
    metric_book_requests_unique integer NOT NULL,
    metric_chapter_investigations integer NOT NULL,
    metric_chapter_investigations_unique integer NOT NULL,
    metric_chapter_requests integer NOT NULL,
    metric_chapter_requests_unique integer NOT NULL,
    metric_title_investigations_unique integer NOT NULL,
    metric_title_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_institution_daily OWNER TO "omp-ci";

--
-- Name: metrics_counter_submission_institution_monthly; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_counter_submission_institution_monthly (
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    month integer NOT NULL,
    metric_book_investigations integer NOT NULL,
    metric_book_investigations_unique integer NOT NULL,
    metric_book_requests integer NOT NULL,
    metric_book_requests_unique integer NOT NULL,
    metric_chapter_investigations integer NOT NULL,
    metric_chapter_investigations_unique integer NOT NULL,
    metric_chapter_requests integer NOT NULL,
    metric_chapter_requests_unique integer NOT NULL,
    metric_title_investigations_unique integer NOT NULL,
    metric_title_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_institution_monthly OWNER TO "omp-ci";

--
-- Name: metrics_counter_submission_monthly; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_counter_submission_monthly (
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    month integer NOT NULL,
    metric_book_investigations integer NOT NULL,
    metric_book_investigations_unique integer NOT NULL,
    metric_book_requests integer NOT NULL,
    metric_book_requests_unique integer NOT NULL,
    metric_chapter_investigations integer NOT NULL,
    metric_chapter_investigations_unique integer NOT NULL,
    metric_chapter_requests integer NOT NULL,
    metric_chapter_requests_unique integer NOT NULL,
    metric_title_investigations_unique integer NOT NULL,
    metric_title_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_monthly OWNER TO "omp-ci";

--
-- Name: metrics_series; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_series (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    series_id bigint NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL
);


ALTER TABLE public.metrics_series OWNER TO "omp-ci";

--
-- Name: metrics_submission; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_submission (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    chapter_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    file_type bigint,
    assoc_type bigint NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL
);


ALTER TABLE public.metrics_submission OWNER TO "omp-ci";

--
-- Name: metrics_submission_geo_daily; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_submission_geo_daily (
    load_id character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL,
    metric_unique integer NOT NULL
);


ALTER TABLE public.metrics_submission_geo_daily OWNER TO "omp-ci";

--
-- Name: metrics_submission_geo_monthly; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.metrics_submission_geo_monthly (
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    month integer NOT NULL,
    metric integer NOT NULL,
    metric_unique integer NOT NULL
);


ALTER TABLE public.metrics_submission_geo_monthly OWNER TO "omp-ci";

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
    unconsidered smallint,
    request_resent smallint DEFAULT '0'::smallint NOT NULL
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
-- Name: usage_stats_institution_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.usage_stats_institution_temporary_records (
    load_id character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    institution_id bigint NOT NULL
);


ALTER TABLE public.usage_stats_institution_temporary_records OWNER TO "omp-ci";

--
-- Name: usage_stats_total_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.usage_stats_total_temporary_records (
    date timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    canonical_url character varying(255) NOT NULL,
    series_id bigint,
    context_id bigint NOT NULL,
    submission_id bigint,
    chapter_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(255) NOT NULL
);


ALTER TABLE public.usage_stats_total_temporary_records OWNER TO "omp-ci";

--
-- Name: usage_stats_unique_item_investigations_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.usage_stats_unique_item_investigations_temporary_records (
    date timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    chapter_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(255) NOT NULL
);


ALTER TABLE public.usage_stats_unique_item_investigations_temporary_records OWNER TO "omp-ci";

--
-- Name: usage_stats_unique_item_requests_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.usage_stats_unique_item_requests_temporary_records (
    date timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    chapter_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(255) NOT NULL
);


ALTER TABLE public.usage_stats_unique_item_requests_temporary_records OWNER TO "omp-ci";

--
-- Name: usage_stats_unique_title_investigations_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.usage_stats_unique_title_investigations_temporary_records (
    date timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    chapter_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(255) NOT NULL
);


ALTER TABLE public.usage_stats_unique_title_investigations_temporary_records OWNER TO "omp-ci";

--
-- Name: usage_stats_unique_title_requests_temporary_records; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.usage_stats_unique_title_requests_temporary_records (
    date timestamp(0) without time zone NOT NULL,
    ip character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    chapter_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(255) NOT NULL
);


ALTER TABLE public.usage_stats_unique_title_requests_temporary_records OWNER TO "omp-ci";

--
-- Name: user_group_settings; Type: TABLE; Schema: public; Owner: omp-ci
--

CREATE TABLE public.user_group_settings (
    user_group_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
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
    locales character varying(255) DEFAULT '[]'::character varying NOT NULL,
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
-- Name: institution_ip_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institution_ip ALTER COLUMN institution_ip_id SET DEFAULT nextval('public.institution_ip_institution_ip_id_seq'::regclass);


--
-- Name: institution_id; Type: DEFAULT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


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
5	gfriesen@mailinator.com	1	2	3	15
6	ldick@mailinator.com	1	2	4	15
7	wwheeler@mailinator.com	1	2	5	15
8	mdyce@mailinator.com	1	2	6	15
9	jopp@mailinator.com	1	2	7	15
10	bbarnetson@mailinator.com	1	3	0	13
11	bbeaty@mailinator.com	1	4	0	14
12	tmiller@mailinator.com	1	4	1	15
13	awagman@mailinator.com	1	4	2	15
14	wstraw@mailinator.com	1	4	3	15
15	callan@mailinator.com	1	5	0	13
16	dbernnard@mailinator.com	1	6	0	14
17	gbobish@mailinator.com	1	6	1	15
18	dbullis@mailinator.com	1	6	2	15
19	jhecker@mailinator.com	1	6	3	15
20	dkennepohl@mailinator.com	1	7	0	14
21	tanderson@mailinator.com	1	7	1	15
22	pgorsky@mailinator.com	1	7	2	15
23	gparchoma@mailinator.com	1	7	3	15
24	spalmer@mailinator.com	1	7	4	15
25	dbarnes@mailinator.com	1	8	0	13
26	fperini@mailinator.com	1	9	0	14
27	rmansell@mailinator.com	1	9	1	15
28	hgalperin@mailinator.com	1	9	2	15
29	pbello@mailinator.com	1	9	3	15
30	erabinovich@mailinator.com	1	9	4	15
31	jbrower@mailinator.com	1	10	0	13
32	jlockehart@mailinator.com	1	11	0	13
33	lelder@mailinator.com	1	12	0	14
34	lelder@mailinator.com	1	12	1	14
35	ftulus@mailinator.com	1	12	2	15
36	rhyma@mailinator.com	1	12	3	15
37	jvalk@mailinator.com	1	12	4	15
38	fkourati@mailinator.com	1	12	5	15
39	jdebeer@mailinator.com	1	12	6	15
40	sbannerman@mailinator.com	1	12	7	15
41	mally@mailinator.com	1	13	0	14
42	jtraxler@mailinator.com	1	13	1	15
43	mkoole@mailinator.com	1	13	2	15
44	trekkedal@mailinator.com	1	13	3	15
45	mdawson@mailinator.com	1	14	0	14
46	bdupuis@mailinator.com	1	14	1	15
47	mwilson@mailinator.com	1	14	2	15
48	mforan@mailinator.com	1	15	0	13
49	mpower@mailinator.com	1	16	0	13
50	msmith@mailinator.com	1	17	0	14
51	ybenkler@mailinator.com	1	17	1	15
52	kreilly@mailinator.com	1	17	2	15
53	mloudon@mailinator.com	1	17	3	15
54	urivett@mailinator.com	1	17	4	15
55	mgraham@mailinator.com	1	17	5	15
56	hhaarstad@mailinator.com	1	17	6	15
57	masmith@mailinator.com	1	17	7	15
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
1	1	\N	1	\N	3	18	2022-10-29 16:05:52
2	1	1	3	1	3	2	2022-10-29 16:06:07
3	2	\N	1	\N	3	18	2022-10-29 16:08:00
4	4	\N	1	\N	3	1	2022-10-29 16:10:26
5	4	3	2	1	3	3	2022-10-29 16:10:45
6	4	4	3	1	3	2	2022-10-29 16:11:04
7	4	\N	4	\N	3	7	2022-10-29 16:11:23
8	5	\N	1	\N	3	1	2022-10-29 16:12:43
9	5	5	2	1	3	3	2022-10-29 16:12:58
10	5	6	3	1	3	2	2022-10-29 16:13:15
11	5	\N	4	\N	3	7	2022-10-29 16:13:32
12	6	\N	1	\N	3	1	2022-10-29 16:15:33
13	6	7	2	1	6	23	2022-10-29 16:16:01
14	7	\N	1	\N	3	18	2022-10-29 16:18:02
15	7	8	3	1	3	2	2022-10-29 16:18:23
16	9	\N	1	\N	3	1	2022-10-29 16:20:34
17	11	\N	1	\N	3	1	2022-10-29 16:22:18
18	11	10	2	1	3	3	2022-10-29 16:22:32
19	11	11	3	1	3	2	2022-10-29 16:23:33
20	12	\N	1	\N	3	1	2022-10-29 16:25:12
21	13	\N	1	\N	3	1	2022-10-29 16:27:11
22	13	13	2	1	3	3	2022-10-29 16:27:28
23	13	14	3	1	3	2	2022-10-29 16:28:48
24	14	\N	1	\N	3	1	2022-10-29 16:30:22
25	14	15	2	1	3	3	2022-10-29 16:30:41
26	14	16	3	1	3	2	2022-10-29 16:31:00
27	14	\N	4	\N	3	7	2022-10-29 16:31:20
28	15	\N	1	\N	3	18	2022-10-29 16:33:30
29	16	\N	1	\N	3	18	2022-10-29 16:34:29
30	17	\N	1	\N	3	1	2022-10-29 16:37:29
\.


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 30, true);


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	0	2022-10-29 16:05:41	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/1">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
2	1048585	1	3	2022-10-29 16:05:52	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>			Your submission has been sent for review	<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
3	1048585	1	3	2022-10-29 16:06:07	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Arthur Clark" <aclark@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/1">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
4	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Alvin Finkel" <afinkel@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/2">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
5	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Sarah Carter" <scarter@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
6	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Peter Fortna" <pfortna@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
7	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Gerald Friesen" <gfriesen@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
8	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Lyle Dick" <ldick@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
9	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Winona Wheeler" <wwheeler@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
10	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Matt Dyce" <mdyce@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
11	1048585	2	0	2022-10-29 16:07:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"James Opp" <jopp@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
12	1048585	2	3	2022-10-29 16:08:00	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Alvin Finkel" <afinkel@mailinator.com>			Your submission has been sent for review	<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
13	1048585	3	0	2022-10-29 16:09:02	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Bob Barnetson" <bbarnetson@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/3">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
14	1048585	4	0	2022-10-29 16:10:11	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
15	1048585	4	0	2022-10-29 16:10:11	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Toby Miller" <tmiller@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
16	1048585	4	0	2022-10-29 16:10:11	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Ira Wagman" <awagman@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
17	1048585	4	0	2022-10-29 16:10:11	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Will Straw" <wstraw@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
18	1048585	4	3	2022-10-29 16:10:26	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Your submission has been sent for internal review	<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
19	1048585	4	3	2022-10-29 16:10:45	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Your submission has been sent for review	<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
20	1048585	4	3	2022-10-29 16:11:04	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
21	1048585	4	3	2022-10-29 16:11:24	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Bart Beaty" <bbeaty@mailinator.com>			Next steps for publishing your submission	<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
22	1048585	5	0	2022-10-29 16:12:29	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
23	1048585	5	3	2022-10-29 16:12:43	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Your submission has been sent for internal review	<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
24	1048585	5	3	2022-10-29 16:12:58	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Your submission has been sent for review	<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
25	1048585	5	3	2022-10-29 16:13:15	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
26	1048585	5	3	2022-10-29 16:13:32	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Chantal Allan" <callan@mailinator.com>			Next steps for publishing your submission	<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
27	1048585	6	0	2022-10-29 16:15:17	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Deborah Bernnard" <dbernnard@mailinator.com>		"David Buskins" <dbuskins@mailinator.com>	Thank you for your submission to {$pressName}	<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/6">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
28	1048585	6	0	2022-10-29 16:15:17	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Greg Bobish" <gbobish@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
29	1048585	6	0	2022-10-29 16:15:17	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Daryl Bullis" <dbullis@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
30	1048585	6	0	2022-10-29 16:15:17	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Jenna Hecker" <jhecker@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
31	1048585	6	3	2022-10-29 16:15:33	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Deborah Bernnard" <dbernnard@mailinator.com>			Your submission has been sent for internal review	<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
32	1048585	7	0	2022-10-29 16:17:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/7">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
33	1048585	7	0	2022-10-29 16:17:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Terry Anderson" <tanderson@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
34	1048585	7	0	2022-10-29 16:17:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Paul Gorsky" <pgorsky@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
35	1048585	7	0	2022-10-29 16:17:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Gale Parchoma" <gparchoma@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
36	1048585	7	0	2022-10-29 16:17:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Stuart Palmer" <spalmer@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
37	1048585	7	3	2022-10-29 16:18:02	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>			Your submission has been sent for review	<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
38	1048585	7	3	2022-10-29 16:18:23	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dietmar Kennepohl" <dkennepohl@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/7">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
39	1048585	8	0	2022-10-29 16:18:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Daniel Barnes,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Editorial, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username dbarnes</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/8">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
40	1048585	9	0	2022-10-29 16:20:16	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Fernando Perini" <fperini@mailinator.com>		"David Buskins" <dbuskins@mailinator.com>	Thank you for your submission to {$pressName}	<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/9">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
41	1048585	9	0	2022-10-29 16:20:16	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Robin Mansell" <rmansell@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
42	1048585	9	0	2022-10-29 16:20:16	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Hernan Galperin" <hgalperin@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
43	1048585	9	0	2022-10-29 16:20:16	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Pablo Bello" <pbello@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
44	1048585	9	0	2022-10-29 16:20:17	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Eleonora Rabinovich" <erabinovich@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
45	1048585	9	3	2022-10-29 16:20:35	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Fernando Perini" <fperini@mailinator.com>			Your submission has been sent for internal review	<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
46	1048585	10	0	2022-10-29 16:21:39	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Jennifer Brower" <jbrower@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/10">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
47	1048585	11	0	2022-10-29 16:22:03	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
48	1048585	11	3	2022-10-29 16:22:18	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Your submission has been sent for internal review	<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
59	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Sara Bannerman" <sbannerman@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
49	1048585	11	3	2022-10-29 16:22:32	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Your submission has been sent for review	<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
50	1048585	11	10	2022-10-29 16:22:58	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-26, if not before.<br />\n<br />\nAdela Gallego
51	1048585	11	12	2022-10-29 16:23:09	1073741829	"Gonzalo Favio" <gfavio@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-26, if not before.<br />\n<br />\nGonzalo Favio
52	1048585	11	3	2022-10-29 16:23:33	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Jonathan Locke Hart" <jlockehart@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
53	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Laurent Elder" <lelder@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/12">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
54	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank Tulus" <ftulus@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
55	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Raymond Hyma" <rhyma@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
56	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Valk" <jvalk@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
57	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Khaled Fourati" <fkourati@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
58	1048585	12	0	2022-10-29 16:24:54	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Jeremy de Beer" <jdebeer@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
60	1048585	12	3	2022-10-29 16:25:13	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Laurent Elder" <lelder@mailinator.com>			Your submission has been sent for internal review	<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
61	1048585	12	8	2022-10-29 16:25:52	1073741829	"Paul Hudson" <phudson@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-26, if not before.<br />\n<br />\nPaul Hudson
62	1048585	13	0	2022-10-29 16:26:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
63	1048585	13	0	2022-10-29 16:26:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Traxler" <jtraxler@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
64	1048585	13	0	2022-10-29 16:26:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Marguerite Koole" <mkoole@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
65	1048585	13	0	2022-10-29 16:26:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Torstein Rekkedal" <trekkedal@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
66	1048585	13	3	2022-10-29 16:27:11	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Your submission has been sent for internal review	<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
67	1048585	13	3	2022-10-29 16:27:28	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Your submission has been sent for review	<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
68	1048585	13	10	2022-10-29 16:28:06	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-26, if not before.<br />\n<br />\nAdela Gallego
69	1048585	13	12	2022-10-29 16:28:19	1073741829	"Gonzalo Favio" <gfavio@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-26, if not before.<br />\n<br />\nGonzalo Favio
70	1048585	13	3	2022-10-29 16:28:48	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Mohamed Ally" <mally@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
71	1048585	14	0	2022-10-29 16:30:03	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
72	1048585	14	0	2022-10-29 16:30:03	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Brian Dupuis" <bdupuis@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
73	1048585	14	0	2022-10-29 16:30:03	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Michael Wilson" <mwilson@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
74	1048585	14	3	2022-10-29 16:30:22	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Your submission has been sent for internal review	<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
75	1048585	14	3	2022-10-29 16:30:41	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Your submission has been sent for review	<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
76	1048585	14	3	2022-10-29 16:31:00	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Your submission has been accepted to Public Knowledge Press	<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
77	1048585	14	3	2022-10-29 16:31:20	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Dawson" <mdawson@mailinator.com>			Next steps for publishing your submission	<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>
78	1048585	15	0	2022-10-29 16:33:14	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Max Foran" <mforan@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/15">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
79	1048585	15	3	2022-10-29 16:33:30	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Max Foran" <mforan@mailinator.com>			Your submission has been sent for review	<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
80	1048585	16	0	2022-10-29 16:34:11	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Michael Power" <mpower@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer's Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/16">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
81	1048585	16	3	2022-10-29 16:34:29	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Michael Power" <mpower@mailinator.com>			Your submission has been sent for review	<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer's Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
82	1048585	16	10	2022-10-29 16:35:02	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>			Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer's Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-26, if not before.<br />\n<br />\nAdela Gallego
83	1048585	17	0	2022-10-29 16:37:04	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Matthew Smith" <msmith@mailinator.com>			Thank you for your submission to {$pressName}	<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/17">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
84	1048585	17	0	2022-10-29 16:37:04	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Yochai Benkler" <ybenkler@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
85	1048585	17	0	2022-10-29 16:37:04	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Katherine Reilly" <kreilly@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
86	1048585	17	0	2022-10-29 16:37:04	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Melissa Loudon" <mloudon@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
87	1048585	17	0	2022-10-29 16:37:04	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Ulrike Rivett" <urivett@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
88	1048585	17	0	2022-10-29 16:37:04	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Graham" <mgraham@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
89	1048585	17	0	2022-10-29 16:37:05	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Håvard Haarstad" <hhaarstad@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
90	1048585	17	0	2022-10-29 16:37:05	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Marshall Smith" <masmith@mailinator.com>			Submission Acknowledgement	Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto:%20%7B$contactEmail%7D">{$contactEmail}</a></p>
91	1048585	17	3	2022-10-29 16:37:29	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Matthew Smith" <msmith@mailinator.com>			Your submission has been sent for internal review	<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>
\.


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 91, true);


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_log_users (email_log_id, user_id) FROM stdin;
1	19
2	19
3	19
4	20
12	20
13	21
14	22
18	22
19	22
20	22
21	22
22	23
23	23
24	23
25	23
26	23
27	24
31	24
32	25
37	25
38	25
39	3
40	26
45	26
46	27
47	28
48	28
49	28
50	3
51	3
52	28
53	29
60	29
61	3
62	30
66	30
67	30
68	3
69	3
70	30
71	31
74	31
75	31
76	31
77	31
78	32
79	32
80	33
81	33
82	3
83	34
91	34
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates (email_id, email_key, context_id, enabled) FROM stdin;
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.email_templates_default_data (email_key, locale, subject, body) FROM stdin;
NOTIFICATION	en_US	New notification from {$pressName}	You have a new notification from {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$pressSignature}<hr />{$unsubscribeLink}
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$pressName}	Please enter your message.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}
PASSWORD_RESET	en_US	Password Reset	Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$recipientUsername}<br />\nYour new password: {$password}<br />\n<br />\n{$siteContactName}
USER_REGISTER	en_US	Press Registration	{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}
USER_VALIDATE_CONTEXT	en_US	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}
USER_VALIDATE_SITE	en_US	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}
REVIEWER_REGISTER	en_US	Registration as Reviewer with {$pressName}	In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you'll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}
SUBMISSION_ACK	en_US	Thank you for your submission to {$pressName}	<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p>{$pressSignature}
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$pressSignature}
EDITOR_ASSIGN	en_US	Editorial Assignment	{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,
REVIEW_CANCEL	en_US	Request for Review Cancelled	{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.
REVIEW_REINSTATE	en_US	Request for Review Reinstated	{$recipientName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We hope that you will be able to assist with this press's review process.<br />\n<br />\nIf you have any questions, please contact me.
REVIEW_RESEND_REQUEST	en_US	Requesting your review again for {$pressName}	<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I'm writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you're able to perform this review, but we understand if that is not possible at this time. Either way, please <a href="{$reviewAssignmentUrl}">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}
REVIEW_REQUEST	en_US	Manuscript Review Request	Dear {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n
REVIEW_REQUEST_SUBSEQUENT	en_US	Request to review a revised submission	<p>Dear {$recipientName},</p><p>Thank you for your review of <a href="{$reviewAssignmentUrl}">{$submissionTitle}</a>. The authors have considered the reviewers' feedback and have now submitted a revised version of their work. I'm writing to ask if you would conduct a second round of peer review for this submission. {$pressName}.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href="{$reviewAssignmentUrl}">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href="{$reviewAssignmentUrl}">{$submissionTitle}</a></p><p>Abstract</p>{$submissionAbstract}<p>Please accept or decline the review by {$responseDueDate}.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}
REVIEW_RESPONSE_OVERDUE_AUTO	en_US	Manuscript Review Request	Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n
REVIEW_CONFIRM	en_US	Able to Review	Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}
REVIEW_DECLINE	en_US	Unable to Review	Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}
REVIEW_ACK	en_US	Thank you for your review	<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers' comments and the editor's decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor's decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>
REVIEW_REMIND	en_US	Submission Review Reminder	{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}
REVIEW_REMIND_AUTO	en_US	Automated Submission Review Reminder	{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}
EDITOR_DECISION_ACCEPT	en_US	Your submission has been accepted to {$pressName}	<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}
EDITOR_DECISION_SEND_TO_EXTERNAL	en_US	Your submission has been sent for review	<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>
DISCUSSION_NOTIFICATION	en_US	{$subject}	{$content}
EDITOR_DECISION_SEND_TO_INTERNAL	en_US	Your submission has been sent for internal review	<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>
EDITOR_DECISION_SEND_TO_PRODUCTION	en_US	Next steps for publishing your submission	<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}
EDITOR_DECISION_REVISIONS	en_US	Your submission has been reviewed and we encourage you to submit revisions	<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers' comments are included at the bottom of this email. Please respond to each point in the reviewers' comments and identify what changes you have made. If you find any of the reviewer's comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers' comments at your <a href="{$authorSubmissionUrl}">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}
EDITOR_DECISION_RESUBMIT	en_US	Your submission has been reviewed - please revise and resubmit	<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer's comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers' comments <a href="{$authorSubmissionUrl}">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}
EDITOR_DECISION_DECLINE	en_US	Your submission has been declined	<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}
EDITOR_DECISION_INITIAL_DECLINE	en_US	Your submission has been declined	<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}
EDITOR_RECOMMENDATION	en_US	Editor Recommendation	<p>Dear {$recipientName},</p><p>After considering the reviewers' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is:<br />{$recommendation}.</p><p>Please visit the submission's <a href="{$submissionUrl}">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>
EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	en_US	An update regarding your submission	<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}
EDITOR_DECISION_NEW_ROUND	en_US	Your submission has been sent for another round of review	<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n
EDITOR_DECISION_REVERT_DECLINE	en_US	We have reversed the decision to decline your submission	<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n
EDITOR_DECISION_REVERT_INITIAL_DECLINE	en_US	We have reversed the decision to decline your submission	<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n
EDITOR_DECISION_SKIP_REVIEW	en_US	Your submission has been sent for copyediting	<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n
EDITOR_DECISION_BACK_FROM_PRODUCTION	en_US	Your submission has been sent back to copyediting	<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>
EDITOR_DECISION_BACK_FROM_COPYEDITING	en_US	Your submission has been sent back to review	<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>
EDITOR_DECISION_CANCEL_REVIEW_ROUND	en_US	A review round for your submission has been cancelled	<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>
COPYEDIT_REQUEST	en_US	Submission {$submissionId} is ready to be copyedited for {$contextAcronym}	<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href"{$submissionUrl}">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>1. Click on the Submission URL below.</li><li>2. Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>3. Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>4. Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}
MANUAL_PAYMENT_NOTIFICATION	en_US	Manual Payment Notification	A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.
LAYOUT_REQUEST	en_US	Submission {$submissionId} is ready for production at {$contextAcronym}	<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href="{$submissionUrl}">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>1. Click on the Submission URL above.</li><li>2. Download the Production Ready files and use them to create the galleys according to the press's standards.</li><li>3. Upload the galleys to the Publication Formats section of the submission.</li><li>4. Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}
LAYOUT_COMPLETE	en_US	Galleys Complete	<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>
INDEX_REQUEST	en_US	Request Index	{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}
INDEX_COMPLETE	en_US	Index Galleys Complete	{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}
EMAIL_LINK	en_US	Manuscript of Possible Interest	Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authors} published in Vol {$volume}, No {$number} ({$year}) of {$pressName} at &quot;{$submissionUrl}&quot;.
STATISTICS_REPORT_NOTIFICATION	en_US	Editorial activity for {$month}, {$year}	\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n\t<li>New submissions this month: {$newSubmissions}</li>\n\t<li>Declined submissions this month: {$declinedSubmissions}</li>\n\t<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n\t<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href="{$editorialStatsLink}">editorial trends</a> and <a href="{$publicationStatsLink}">published book stats</a>. A full copy of this month's editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}
ANNOUNCEMENT	en_US	{$announcementTitle}	<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href="{$announcementUrl}">full announcement</a>.
EDITORIAL_REMINDER	en_US	Outstanding editorial tasks for {$pressName}	<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href="{$pressUrl}">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href="{$submissionsUrl}">submission dashboard</a>.</p><p>This is an automated email from {$pressName}. You are receiving this email because you are an editor. To unsubscribe from these emails, please visit your <a href="{$userProfileUrl}">user profile</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>
PAYPAL_INVESTIGATE_PAYMENT	en_US	Unusual PayPal Activity	Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$pressName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n
NOTIFICATION	fr_CA	Nouvelle notification de {$pressName}	Vous avez reçu une nouvelle notification de {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$notificationUrl}<br />\n<br />\n{$pressSignature}
NOTIFICATION_CENTER_DEFAULT	fr_CA	Un message à propos de la presse {$pressName}	Veuillez saisir votre message.
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de réinitialisation du mot de passe	Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}
PASSWORD_RESET	fr_CA	Réinitialisation du mot de passe	Votre mot de passe vous permettant d'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d'utilisateur: {$recipientUsername}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$siteContactName}
USER_REGISTER	fr_CA	Inscription à la presse	{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}
USER_VALIDATE_CONTEXT	fr_CA		
USER_VALIDATE_SITE	fr_CA		
REVIEWER_REGISTER	fr_CA	Inscription à titre d'évaluateur pour la presse {$pressName}	En raison de votre expertise, nous avons ajouté votre nom à notre base de données d'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d'évaluation, vous aurez la possibilité de lire le titre et le résumé de l'article en question. Vous serez toujours libre d'accepter ou de refuser l'invitation. Vous pouvez demander que l'on retire votre nom de notre liste d'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d'intérêt en ce qui concerne l'évaluation des articles.<br />\n<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}
SUBMISSION_ACK	fr_CA	Accusé de réception de la soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception d'une soumission	Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$pressName}. <br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir envoyé votre article à cette presse.<br />\n<br />\n{$pressSignature}
EDITOR_ASSIGN	fr_CA	Travail éditorial	{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,
REVIEW_CANCEL	fr_CA	Annulation de la requête d'évaluation	{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d'annuler notre requête d'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à me contacter.
REVIEW_REINSTATE	fr_CA		
REVIEW_RESEND_REQUEST	fr_CA		
REVIEW_REQUEST	fr_CA	Requête d'évaluation d'un manuscrit	Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d'ici le {$responseDueDate} pour indiquer si vous serez en mesure d'évaluer l'article ou non. Ceci vous permettra également d'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL'évaluation doit être terminée d'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n
REVIEW_REQUEST_SUBSEQUENT	fr_CA		
REVIEW_RESPONSE_OVERDUE_AUTO	fr_CA		
REVIEW_CONFIRM	fr_CA	En mesure d'évaluer	Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d'ici le {$reviewDueDate}.<br />\n<br />\n{$senderName}
REVIEW_DECLINE	fr_CA	Ne peux pas évaluer	Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m'avoir invité à évaluer cet article et n'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}
REVIEW_ACK	fr_CA	Accusé de réception de l'évaluation d'une soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.
REVIEW_REMIND	fr_CA	Rappel d'évaluation	{$recipientName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n'avez plus votre nom d'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d'agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}
REVIEW_REMIND_AUTO	fr_CA	Rappel automatique d'évaluation d'une soumission	{$recipientName}:<br />\n<br />\nNous vous remercions d'avoir accepté d'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n'avez plus votre nom d'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}
EDITOR_DECISION_ACCEPT	fr_CA	Décision du rédacteur en chef	{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}
EDITOR_DECISION_SEND_TO_EXTERNAL	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}
EDITOR_DECISION_SEND_TO_INTERNAL	fr_CA		
EDITOR_DECISION_SEND_TO_PRODUCTION	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nL'édition de votre soumission « {$submissionTitle} » est complétée. Nous l'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}
EDITOR_DECISION_REVISIONS	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d'apporter des révisions à votre soumission.
EDITOR_DECISION_RESUBMIT	fr_CA	Décision du rédacteur	{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d'apporter des révisions à votre soumission et de la soumettre à nouveau.
EDITOR_DECISION_DECLINE	fr_CA	Décision du rédacteur	{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.
EDITOR_DECISION_INITIAL_DECLINE	fr_CA	Décision du rédacteur	\n\t\t\t{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.
EDITOR_RECOMMENDATION	fr_CA	Recommandation du rédacteur	{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}
EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	fr_CA		
EDITOR_DECISION_NEW_ROUND	fr_CA		
EDITOR_DECISION_REVERT_DECLINE	fr_CA		
EDITOR_DECISION_REVERT_INITIAL_DECLINE	fr_CA		
EDITOR_DECISION_SKIP_REVIEW	fr_CA		
EDITOR_DECISION_BACK_FROM_PRODUCTION	fr_CA		
EDITOR_DECISION_BACK_FROM_COPYEDITING	fr_CA		
EDITOR_DECISION_CANCEL_REVIEW_ROUND	fr_CA		
COPYEDIT_REQUEST	fr_CA	Demande de révision d'une soumission	{$recipientName},<br />\n<br />\nJ'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}
LAYOUT_REQUEST	fr_CA	Requête des épreuves en placard	{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir contribué à cette presse.
LAYOUT_COMPLETE	fr_CA	Épreuves en placard complétées	{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n'hésitez pas à me contacter.<br />\n<br />\n{$senderName}
INDEX_REQUEST	fr_CA	Requête d'indexage	{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n'hésitez pas à me contacter. Merci d'avoir contribué à cette presse.<br />\n<br />\n{$signature}
INDEX_COMPLETE	fr_CA	Indexage des épreuves en placard complété	{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}
EMAIL_LINK	fr_CA	Manuscrit susceptible d'intéresser	Nous crayons que l'article intitulé &quot;{$submissionTitle}&quot; par {$authors} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$pressName} au &quot;{$submissionUrl}&quot; pourrait vous intéresser.
STATISTICS_REPORT_NOTIFICATION	fr_CA		
ANNOUNCEMENT	fr_CA		
EDITORIAL_REMINDER	fr_CA		
DISCUSSION_NOTIFICATION	fr_CA		
\.


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
1	1048585	1	19	2022-10-29 16:05:21	268435458	submission.event.general.metadataUpdated	0
2	1048585	1	19	2022-10-29 16:05:22	268435458	submission.event.general.metadataUpdated	0
3	515	1	19	2022-10-29 16:05:24	1342177281	submission.event.fileUploaded	0
4	1048585	1	19	2022-10-29 16:05:24	1342177288	submission.event.fileRevised	0
5	515	1	19	2022-10-29 16:05:25	1342177296	submission.event.fileEdited	0
6	1048585	1	19	2022-10-29 16:05:25	1342177296	submission.event.fileEdited	0
7	1048585	1	19	2022-10-29 16:05:40	268435458	submission.event.general.metadataUpdated	0
8	1048585	1	19	2022-10-29 16:05:41	268435457	submission.event.submissionSubmitted	0
9	1048585	1	3	2022-10-29 16:05:52	805306371	editor.submission.decision.sendExternalReview.log	0
10	515	2	3	2022-10-29 16:05:53	1342177281	submission.event.fileUploaded	0
11	1048585	1	3	2022-10-29 16:05:53	1342177288	submission.event.fileRevised	0
12	1048585	1	3	2022-10-29 16:06:02	1073741825	log.review.reviewerAssigned	0
13	1048585	1	3	2022-10-29 16:06:07	805306371	editor.submission.decision.accept.log	0
14	1048585	1	3	2022-10-29 16:06:15	268435459	submission.event.participantAdded	0
15	1048585	2	20	2022-10-29 16:06:25	268435458	submission.event.general.metadataUpdated	0
16	1048585	2	20	2022-10-29 16:06:25	268435458	submission.event.general.metadataUpdated	0
17	515	3	20	2022-10-29 16:06:28	1342177281	submission.event.fileUploaded	0
18	1048585	2	20	2022-10-29 16:06:28	1342177288	submission.event.fileRevised	0
19	515	3	20	2022-10-29 16:06:29	1342177296	submission.event.fileEdited	0
20	1048585	2	20	2022-10-29 16:06:29	1342177296	submission.event.fileEdited	0
21	515	4	20	2022-10-29 16:06:29	1342177281	submission.event.fileUploaded	0
22	1048585	2	20	2022-10-29 16:06:29	1342177288	submission.event.fileRevised	0
23	515	4	20	2022-10-29 16:06:31	1342177296	submission.event.fileEdited	0
24	1048585	2	20	2022-10-29 16:06:31	1342177296	submission.event.fileEdited	0
25	515	5	20	2022-10-29 16:06:31	1342177281	submission.event.fileUploaded	0
26	1048585	2	20	2022-10-29 16:06:31	1342177288	submission.event.fileRevised	0
27	515	5	20	2022-10-29 16:06:32	1342177296	submission.event.fileEdited	0
28	1048585	2	20	2022-10-29 16:06:32	1342177296	submission.event.fileEdited	0
29	515	6	20	2022-10-29 16:06:33	1342177281	submission.event.fileUploaded	0
30	1048585	2	20	2022-10-29 16:06:33	1342177288	submission.event.fileRevised	0
31	515	6	20	2022-10-29 16:06:34	1342177296	submission.event.fileEdited	0
32	1048585	2	20	2022-10-29 16:06:34	1342177296	submission.event.fileEdited	0
33	1048585	2	20	2022-10-29 16:07:42	268435458	submission.event.general.metadataUpdated	0
34	1048585	2	20	2022-10-29 16:07:44	268435457	submission.event.submissionSubmitted	0
35	1048585	2	3	2022-10-29 16:08:00	805306371	editor.submission.decision.sendExternalReview.log	0
36	515	7	3	2022-10-29 16:08:00	1342177281	submission.event.fileUploaded	0
37	1048585	2	3	2022-10-29 16:08:00	1342177288	submission.event.fileRevised	0
38	515	8	3	2022-10-29 16:08:01	1342177281	submission.event.fileUploaded	0
39	1048585	2	3	2022-10-29 16:08:01	1342177288	submission.event.fileRevised	0
40	515	9	3	2022-10-29 16:08:01	1342177281	submission.event.fileUploaded	0
41	1048585	2	3	2022-10-29 16:08:01	1342177288	submission.event.fileRevised	0
42	515	10	3	2022-10-29 16:08:01	1342177281	submission.event.fileUploaded	0
43	1048585	2	3	2022-10-29 16:08:01	1342177288	submission.event.fileRevised	0
44	1048585	2	3	2022-10-29 16:08:12	1073741825	log.review.reviewerAssigned	0
45	1048585	2	3	2022-10-29 16:08:21	1073741825	log.review.reviewerAssigned	0
46	1048585	3	21	2022-10-29 16:08:32	268435458	submission.event.general.metadataUpdated	0
47	1048585	3	21	2022-10-29 16:08:32	268435458	submission.event.general.metadataUpdated	0
48	515	11	21	2022-10-29 16:08:34	1342177281	submission.event.fileUploaded	0
49	1048585	3	21	2022-10-29 16:08:34	1342177288	submission.event.fileRevised	0
50	515	11	21	2022-10-29 16:08:35	1342177296	submission.event.fileEdited	0
51	1048585	3	21	2022-10-29 16:08:35	1342177296	submission.event.fileEdited	0
52	1048585	3	21	2022-10-29 16:09:00	268435458	submission.event.general.metadataUpdated	0
53	1048585	3	21	2022-10-29 16:09:02	268435457	submission.event.submissionSubmitted	0
54	1048585	4	22	2022-10-29 16:09:11	268435458	submission.event.general.metadataUpdated	0
55	1048585	4	22	2022-10-29 16:09:11	268435458	submission.event.general.metadataUpdated	0
56	515	12	22	2022-10-29 16:09:13	1342177281	submission.event.fileUploaded	0
57	1048585	4	22	2022-10-29 16:09:13	1342177288	submission.event.fileRevised	0
58	515	12	22	2022-10-29 16:09:15	1342177296	submission.event.fileEdited	0
59	1048585	4	22	2022-10-29 16:09:15	1342177296	submission.event.fileEdited	0
60	515	13	22	2022-10-29 16:09:15	1342177281	submission.event.fileUploaded	0
61	1048585	4	22	2022-10-29 16:09:15	1342177288	submission.event.fileRevised	0
62	515	13	22	2022-10-29 16:09:16	1342177296	submission.event.fileEdited	0
63	1048585	4	22	2022-10-29 16:09:16	1342177296	submission.event.fileEdited	0
64	515	14	22	2022-10-29 16:09:16	1342177281	submission.event.fileUploaded	0
65	1048585	4	22	2022-10-29 16:09:16	1342177288	submission.event.fileRevised	0
66	515	14	22	2022-10-29 16:09:18	1342177296	submission.event.fileEdited	0
67	1048585	4	22	2022-10-29 16:09:18	1342177296	submission.event.fileEdited	0
68	515	15	22	2022-10-29 16:09:18	1342177281	submission.event.fileUploaded	0
69	1048585	4	22	2022-10-29 16:09:18	1342177288	submission.event.fileRevised	0
70	515	15	22	2022-10-29 16:09:20	1342177296	submission.event.fileEdited	0
71	1048585	4	22	2022-10-29 16:09:20	1342177296	submission.event.fileEdited	0
72	1048585	4	22	2022-10-29 16:10:09	268435458	submission.event.general.metadataUpdated	0
73	1048585	4	22	2022-10-29 16:10:11	268435457	submission.event.submissionSubmitted	0
74	1048585	4	3	2022-10-29 16:10:26	805306371	editor.submission.decision.sendInternalReview.log	0
75	515	16	3	2022-10-29 16:10:27	1342177281	submission.event.fileUploaded	0
76	1048585	4	3	2022-10-29 16:10:27	1342177288	submission.event.fileRevised	0
77	515	17	3	2022-10-29 16:10:27	1342177281	submission.event.fileUploaded	0
78	1048585	4	3	2022-10-29 16:10:27	1342177288	submission.event.fileRevised	0
79	515	18	3	2022-10-29 16:10:27	1342177281	submission.event.fileUploaded	0
80	1048585	4	3	2022-10-29 16:10:27	1342177288	submission.event.fileRevised	0
81	515	19	3	2022-10-29 16:10:27	1342177281	submission.event.fileUploaded	0
82	1048585	4	3	2022-10-29 16:10:27	1342177288	submission.event.fileRevised	0
83	1048585	4	3	2022-10-29 16:10:39	1073741825	log.review.reviewerAssigned	0
84	1048585	4	3	2022-10-29 16:10:45	805306371	editor.submission.decision.sendExternalReview.log	0
85	1048585	4	3	2022-10-29 16:10:57	1073741825	log.review.reviewerAssigned	0
86	1048585	4	3	2022-10-29 16:11:04	805306371	editor.submission.decision.accept.log	0
87	1048585	4	3	2022-10-29 16:11:16	268435459	submission.event.participantAdded	0
88	1048585	4	3	2022-10-29 16:11:23	805306371	editor.submission.decision.sendToProduction.log	0
89	1048585	4	3	2022-10-29 16:11:36	268435459	submission.event.participantAdded	0
90	1048585	4	3	2022-10-29 16:11:46	268435474	submission.event.publicationFormatCreated	0
91	1048585	5	23	2022-10-29 16:11:55	268435458	submission.event.general.metadataUpdated	0
92	1048585	5	23	2022-10-29 16:11:55	268435458	submission.event.general.metadataUpdated	0
93	515	20	23	2022-10-29 16:11:58	1342177281	submission.event.fileUploaded	0
94	1048585	5	23	2022-10-29 16:11:58	1342177288	submission.event.fileRevised	0
95	515	20	23	2022-10-29 16:11:59	1342177296	submission.event.fileEdited	0
96	1048585	5	23	2022-10-29 16:11:59	1342177296	submission.event.fileEdited	0
97	1048585	5	23	2022-10-29 16:12:27	268435458	submission.event.general.metadataUpdated	0
98	1048585	5	23	2022-10-29 16:12:29	268435457	submission.event.submissionSubmitted	0
99	1048585	5	3	2022-10-29 16:12:43	805306371	editor.submission.decision.sendInternalReview.log	0
100	515	21	3	2022-10-29 16:12:43	1342177281	submission.event.fileUploaded	0
101	1048585	5	3	2022-10-29 16:12:43	1342177288	submission.event.fileRevised	0
102	1048585	5	3	2022-10-29 16:12:53	1073741825	log.review.reviewerAssigned	0
103	1048585	5	3	2022-10-29 16:12:58	805306371	editor.submission.decision.sendExternalReview.log	0
104	1048585	5	3	2022-10-29 16:13:09	1073741825	log.review.reviewerAssigned	0
105	1048585	5	3	2022-10-29 16:13:15	805306371	editor.submission.decision.accept.log	0
106	1048585	5	3	2022-10-29 16:13:25	268435459	submission.event.participantAdded	0
107	1048585	5	3	2022-10-29 16:13:32	805306371	editor.submission.decision.sendToProduction.log	0
108	1048585	5	3	2022-10-29 16:13:42	268435459	submission.event.participantAdded	0
109	1048585	5	3	2022-10-29 16:13:49	268435459	submission.event.participantAdded	0
110	1048585	5	3	2022-10-29 16:13:54	268435474	submission.event.publicationFormatCreated	0
111	515	22	3	2022-10-29 16:13:58	1342177281	submission.event.fileUploaded	0
112	1048585	5	3	2022-10-29 16:13:58	1342177288	submission.event.fileRevised	0
113	1048585	5	3	2022-10-29 16:14:00	268435464	submission.event.publicationFormatPublished	0
114	1048585	5	3	2022-10-29 16:14:03	268435476	submission.event.publicationFormatMadeAvailable	0
115	515	22	3	2022-10-29 16:14:05	1342177296	submission.event.fileEdited	0
116	1048585	5	3	2022-10-29 16:14:05	1342177296	submission.event.fileEdited	0
117	515	22	3	2022-10-29 16:14:05	1342177287	submission.event.signoffSignoff	0
118	515	22	3	2022-10-29 16:14:08	1342177296	submission.event.fileEdited	0
119	1048585	5	3	2022-10-29 16:14:08	1342177296	submission.event.fileEdited	0
120	1048585	5	3	2022-10-29 16:14:10	268435462	publication.event.published	0
121	1048585	6	24	2022-10-29 16:14:21	268435458	submission.event.general.metadataUpdated	0
122	1048585	6	24	2022-10-29 16:14:21	268435458	submission.event.general.metadataUpdated	0
123	515	23	24	2022-10-29 16:14:23	1342177281	submission.event.fileUploaded	0
124	1048585	6	24	2022-10-29 16:14:23	1342177288	submission.event.fileRevised	0
125	515	23	24	2022-10-29 16:14:25	1342177296	submission.event.fileEdited	0
126	1048585	6	24	2022-10-29 16:14:25	1342177296	submission.event.fileEdited	0
127	515	24	24	2022-10-29 16:14:25	1342177281	submission.event.fileUploaded	0
128	1048585	6	24	2022-10-29 16:14:25	1342177288	submission.event.fileRevised	0
129	515	24	24	2022-10-29 16:14:26	1342177296	submission.event.fileEdited	0
130	1048585	6	24	2022-10-29 16:14:26	1342177296	submission.event.fileEdited	0
131	515	25	24	2022-10-29 16:14:27	1342177281	submission.event.fileUploaded	0
132	1048585	6	24	2022-10-29 16:14:27	1342177288	submission.event.fileRevised	0
133	515	25	24	2022-10-29 16:14:28	1342177296	submission.event.fileEdited	0
134	1048585	6	24	2022-10-29 16:14:28	1342177296	submission.event.fileEdited	0
135	515	26	24	2022-10-29 16:14:28	1342177281	submission.event.fileUploaded	0
136	1048585	6	24	2022-10-29 16:14:28	1342177288	submission.event.fileRevised	0
137	515	26	24	2022-10-29 16:14:30	1342177296	submission.event.fileEdited	0
138	1048585	6	24	2022-10-29 16:14:30	1342177296	submission.event.fileEdited	0
139	1048585	6	24	2022-10-29 16:15:15	268435458	submission.event.general.metadataUpdated	0
140	1048585	6	24	2022-10-29 16:15:17	268435457	submission.event.submissionSubmitted	0
141	1048585	6	3	2022-10-29 16:15:33	805306371	editor.submission.decision.sendInternalReview.log	0
142	515	27	3	2022-10-29 16:15:34	1342177281	submission.event.fileUploaded	0
143	1048585	6	3	2022-10-29 16:15:34	1342177288	submission.event.fileRevised	0
144	515	28	3	2022-10-29 16:15:34	1342177281	submission.event.fileUploaded	0
145	1048585	6	3	2022-10-29 16:15:34	1342177288	submission.event.fileRevised	0
146	515	29	3	2022-10-29 16:15:34	1342177281	submission.event.fileUploaded	0
147	1048585	6	3	2022-10-29 16:15:34	1342177288	submission.event.fileRevised	0
148	515	30	3	2022-10-29 16:15:34	1342177281	submission.event.fileUploaded	0
149	1048585	6	3	2022-10-29 16:15:34	1342177288	submission.event.fileRevised	0
150	1048585	6	3	2022-10-29 16:15:45	268435459	submission.event.participantAdded	0
151	1048585	6	6	2022-10-29 16:16:01	805306372	editor.submission.recommend.accept.log	0
152	1048585	7	25	2022-10-29 16:16:26	268435458	submission.event.general.metadataUpdated	0
153	1048585	7	25	2022-10-29 16:16:26	268435458	submission.event.general.metadataUpdated	0
154	515	31	25	2022-10-29 16:16:29	1342177281	submission.event.fileUploaded	0
155	1048585	7	25	2022-10-29 16:16:29	1342177288	submission.event.fileRevised	0
156	515	31	25	2022-10-29 16:16:30	1342177296	submission.event.fileEdited	0
157	1048585	7	25	2022-10-29 16:16:30	1342177296	submission.event.fileEdited	0
158	515	32	25	2022-10-29 16:16:30	1342177281	submission.event.fileUploaded	0
159	1048585	7	25	2022-10-29 16:16:30	1342177288	submission.event.fileRevised	0
160	515	32	25	2022-10-29 16:16:32	1342177296	submission.event.fileEdited	0
161	1048585	7	25	2022-10-29 16:16:32	1342177296	submission.event.fileEdited	0
162	515	33	25	2022-10-29 16:16:32	1342177281	submission.event.fileUploaded	0
163	1048585	7	25	2022-10-29 16:16:32	1342177288	submission.event.fileRevised	0
164	515	33	25	2022-10-29 16:16:33	1342177296	submission.event.fileEdited	0
165	1048585	7	25	2022-10-29 16:16:33	1342177296	submission.event.fileEdited	0
166	515	34	25	2022-10-29 16:16:34	1342177281	submission.event.fileUploaded	0
167	1048585	7	25	2022-10-29 16:16:34	1342177288	submission.event.fileRevised	0
168	515	34	25	2022-10-29 16:16:35	1342177296	submission.event.fileEdited	0
169	1048585	7	25	2022-10-29 16:16:35	1342177296	submission.event.fileEdited	0
170	515	35	25	2022-10-29 16:16:35	1342177281	submission.event.fileUploaded	0
171	1048585	7	25	2022-10-29 16:16:35	1342177288	submission.event.fileRevised	0
172	515	35	25	2022-10-29 16:16:37	1342177296	submission.event.fileEdited	0
173	1048585	7	25	2022-10-29 16:16:37	1342177296	submission.event.fileEdited	0
174	1048585	7	25	2022-10-29 16:17:42	268435458	submission.event.general.metadataUpdated	0
175	1048585	7	25	2022-10-29 16:17:44	268435457	submission.event.submissionSubmitted	0
176	1048585	7	3	2022-10-29 16:18:02	805306371	editor.submission.decision.sendExternalReview.log	0
177	515	36	3	2022-10-29 16:18:03	1342177281	submission.event.fileUploaded	0
178	1048585	7	3	2022-10-29 16:18:03	1342177288	submission.event.fileRevised	0
179	515	37	3	2022-10-29 16:18:03	1342177281	submission.event.fileUploaded	0
180	1048585	7	3	2022-10-29 16:18:03	1342177288	submission.event.fileRevised	0
181	515	38	3	2022-10-29 16:18:03	1342177281	submission.event.fileUploaded	0
182	1048585	7	3	2022-10-29 16:18:03	1342177288	submission.event.fileRevised	0
183	515	39	3	2022-10-29 16:18:03	1342177281	submission.event.fileUploaded	0
184	1048585	7	3	2022-10-29 16:18:03	1342177288	submission.event.fileRevised	0
185	515	40	3	2022-10-29 16:18:03	1342177281	submission.event.fileUploaded	0
186	1048585	7	3	2022-10-29 16:18:03	1342177288	submission.event.fileRevised	0
187	1048585	7	3	2022-10-29 16:18:16	1073741825	log.review.reviewerAssigned	0
188	1048585	7	3	2022-10-29 16:18:23	805306371	editor.submission.decision.accept.log	0
189	1048585	7	3	2022-10-29 16:18:35	268435459	submission.event.participantAdded	0
190	1048585	8	3	2022-10-29 16:18:47	268435458	submission.event.general.metadataUpdated	0
191	1048585	8	3	2022-10-29 16:18:47	268435458	submission.event.general.metadataUpdated	0
192	515	41	3	2022-10-29 16:18:49	1342177281	submission.event.fileUploaded	0
193	1048585	8	3	2022-10-29 16:18:49	1342177288	submission.event.fileRevised	0
194	515	41	3	2022-10-29 16:18:51	1342177296	submission.event.fileEdited	0
195	1048585	8	3	2022-10-29 16:18:51	1342177296	submission.event.fileEdited	0
196	1048585	8	3	2022-10-29 16:18:53	268435458	submission.event.general.metadataUpdated	0
197	1048585	8	3	2022-10-29 16:18:54	268435457	submission.event.submissionSubmitted	0
198	1048585	9	26	2022-10-29 16:19:02	268435458	submission.event.general.metadataUpdated	0
199	1048585	9	26	2022-10-29 16:19:03	268435458	submission.event.general.metadataUpdated	0
200	515	42	26	2022-10-29 16:19:05	1342177281	submission.event.fileUploaded	0
201	1048585	9	26	2022-10-29 16:19:05	1342177288	submission.event.fileRevised	0
202	515	42	26	2022-10-29 16:19:06	1342177296	submission.event.fileEdited	0
203	1048585	9	26	2022-10-29 16:19:06	1342177296	submission.event.fileEdited	0
204	515	43	26	2022-10-29 16:19:06	1342177281	submission.event.fileUploaded	0
205	1048585	9	26	2022-10-29 16:19:06	1342177288	submission.event.fileRevised	0
206	515	43	26	2022-10-29 16:19:08	1342177296	submission.event.fileEdited	0
207	1048585	9	26	2022-10-29 16:19:08	1342177296	submission.event.fileEdited	0
208	515	44	26	2022-10-29 16:19:08	1342177281	submission.event.fileUploaded	0
209	1048585	9	26	2022-10-29 16:19:08	1342177288	submission.event.fileRevised	0
210	515	44	26	2022-10-29 16:19:09	1342177296	submission.event.fileEdited	0
211	1048585	9	26	2022-10-29 16:19:09	1342177296	submission.event.fileEdited	0
212	515	45	26	2022-10-29 16:19:10	1342177281	submission.event.fileUploaded	0
213	1048585	9	26	2022-10-29 16:19:10	1342177288	submission.event.fileRevised	0
214	515	45	26	2022-10-29 16:19:11	1342177296	submission.event.fileEdited	0
215	1048585	9	26	2022-10-29 16:19:11	1342177296	submission.event.fileEdited	0
216	515	46	26	2022-10-29 16:19:12	1342177281	submission.event.fileUploaded	0
217	1048585	9	26	2022-10-29 16:19:12	1342177288	submission.event.fileRevised	0
218	515	46	26	2022-10-29 16:19:13	1342177296	submission.event.fileEdited	0
219	1048585	9	26	2022-10-29 16:19:13	1342177296	submission.event.fileEdited	0
220	1048585	9	26	2022-10-29 16:20:14	268435458	submission.event.general.metadataUpdated	0
221	1048585	9	26	2022-10-29 16:20:17	268435457	submission.event.submissionSubmitted	0
222	1048585	9	3	2022-10-29 16:20:34	805306371	editor.submission.decision.sendInternalReview.log	0
223	515	47	3	2022-10-29 16:20:35	1342177281	submission.event.fileUploaded	0
224	1048585	9	3	2022-10-29 16:20:35	1342177288	submission.event.fileRevised	0
225	515	48	3	2022-10-29 16:20:35	1342177281	submission.event.fileUploaded	0
226	1048585	9	3	2022-10-29 16:20:35	1342177288	submission.event.fileRevised	0
227	515	49	3	2022-10-29 16:20:36	1342177281	submission.event.fileUploaded	0
228	1048585	9	3	2022-10-29 16:20:36	1342177288	submission.event.fileRevised	0
229	515	50	3	2022-10-29 16:20:36	1342177281	submission.event.fileUploaded	0
230	1048585	9	3	2022-10-29 16:20:36	1342177288	submission.event.fileRevised	0
231	515	51	3	2022-10-29 16:20:36	1342177281	submission.event.fileUploaded	0
232	1048585	9	3	2022-10-29 16:20:36	1342177288	submission.event.fileRevised	0
233	1048585	10	27	2022-10-29 16:20:50	268435458	submission.event.general.metadataUpdated	0
234	1048585	10	27	2022-10-29 16:20:50	268435458	submission.event.general.metadataUpdated	0
235	515	52	27	2022-10-29 16:20:52	1342177281	submission.event.fileUploaded	0
236	1048585	10	27	2022-10-29 16:20:52	1342177288	submission.event.fileRevised	0
237	515	52	27	2022-10-29 16:20:54	1342177296	submission.event.fileEdited	0
238	1048585	10	27	2022-10-29 16:20:54	1342177296	submission.event.fileEdited	0
239	1048585	10	27	2022-10-29 16:21:37	268435458	submission.event.general.metadataUpdated	0
240	1048585	10	27	2022-10-29 16:21:39	268435457	submission.event.submissionSubmitted	0
241	1048585	11	28	2022-10-29 16:21:48	268435458	submission.event.general.metadataUpdated	0
242	1048585	11	28	2022-10-29 16:21:48	268435458	submission.event.general.metadataUpdated	0
243	515	53	28	2022-10-29 16:21:51	1342177281	submission.event.fileUploaded	0
244	1048585	11	28	2022-10-29 16:21:51	1342177288	submission.event.fileRevised	0
245	515	53	28	2022-10-29 16:21:52	1342177296	submission.event.fileEdited	0
246	1048585	11	28	2022-10-29 16:21:52	1342177296	submission.event.fileEdited	0
247	1048585	11	28	2022-10-29 16:22:02	268435458	submission.event.general.metadataUpdated	0
248	1048585	11	28	2022-10-29 16:22:03	268435457	submission.event.submissionSubmitted	0
249	1048585	11	3	2022-10-29 16:22:18	805306371	editor.submission.decision.sendInternalReview.log	0
250	515	54	3	2022-10-29 16:22:18	1342177281	submission.event.fileUploaded	0
251	1048585	11	3	2022-10-29 16:22:18	1342177288	submission.event.fileRevised	0
252	1048585	11	3	2022-10-29 16:22:28	1073741825	log.review.reviewerAssigned	0
253	1048585	11	3	2022-10-29 16:22:32	805306371	editor.submission.decision.sendExternalReview.log	0
254	1048585	11	3	2022-10-29 16:22:43	1073741825	log.review.reviewerAssigned	0
255	1048585	11	3	2022-10-29 16:22:50	1073741825	log.review.reviewerAssigned	0
256	1048585	11	10	2022-10-29 16:22:58	1073741830	log.review.reviewAccepted	0
257	1048585	11	10	2022-10-29 16:23:01	1073741848	log.review.reviewReady	0
258	1048585	11	12	2022-10-29 16:23:09	1073741830	log.review.reviewAccepted	0
259	1048585	11	12	2022-10-29 16:23:13	1073741848	log.review.reviewReady	0
260	1048585	11	3	2022-10-29 16:23:33	805306371	editor.submission.decision.accept.log	0
261	1048585	11	3	2022-10-29 16:23:33	1073741856	submission.event.decisionReviewerEmailSent	0
262	1048585	12	29	2022-10-29 16:23:48	268435458	submission.event.general.metadataUpdated	0
263	1048585	12	29	2022-10-29 16:23:48	268435458	submission.event.general.metadataUpdated	0
264	515	55	29	2022-10-29 16:23:50	1342177281	submission.event.fileUploaded	0
265	1048585	12	29	2022-10-29 16:23:50	1342177288	submission.event.fileRevised	0
266	515	55	29	2022-10-29 16:23:52	1342177296	submission.event.fileEdited	0
267	1048585	12	29	2022-10-29 16:23:52	1342177296	submission.event.fileEdited	0
268	515	56	29	2022-10-29 16:23:52	1342177281	submission.event.fileUploaded	0
269	1048585	12	29	2022-10-29 16:23:52	1342177288	submission.event.fileRevised	0
270	515	56	29	2022-10-29 16:23:53	1342177296	submission.event.fileEdited	0
271	1048585	12	29	2022-10-29 16:23:53	1342177296	submission.event.fileEdited	0
272	515	57	29	2022-10-29 16:23:54	1342177281	submission.event.fileUploaded	0
273	1048585	12	29	2022-10-29 16:23:54	1342177288	submission.event.fileRevised	0
274	515	57	29	2022-10-29 16:23:55	1342177296	submission.event.fileEdited	0
275	1048585	12	29	2022-10-29 16:23:55	1342177296	submission.event.fileEdited	0
276	1048585	12	29	2022-10-29 16:24:52	268435458	submission.event.general.metadataUpdated	0
277	1048585	12	29	2022-10-29 16:24:54	268435457	submission.event.submissionSubmitted	0
278	1048585	12	3	2022-10-29 16:25:12	805306371	editor.submission.decision.sendInternalReview.log	0
279	515	58	3	2022-10-29 16:25:13	1342177281	submission.event.fileUploaded	0
280	1048585	12	3	2022-10-29 16:25:13	1342177288	submission.event.fileRevised	0
281	515	59	3	2022-10-29 16:25:13	1342177281	submission.event.fileUploaded	0
282	1048585	12	3	2022-10-29 16:25:13	1342177288	submission.event.fileRevised	0
283	515	60	3	2022-10-29 16:25:13	1342177281	submission.event.fileUploaded	0
284	1048585	12	3	2022-10-29 16:25:13	1342177288	submission.event.fileRevised	0
285	1048585	12	3	2022-10-29 16:25:25	1073741825	log.review.reviewerAssigned	0
286	1048585	12	3	2022-10-29 16:25:33	1073741825	log.review.reviewerAssigned	0
287	1048585	12	3	2022-10-29 16:25:42	1073741825	log.review.reviewerAssigned	0
288	1048585	12	8	2022-10-29 16:25:52	1073741830	log.review.reviewAccepted	0
289	1048585	12	8	2022-10-29 16:25:57	1073741848	log.review.reviewReady	0
290	1048585	13	30	2022-10-29 16:26:08	268435458	submission.event.general.metadataUpdated	0
291	1048585	13	30	2022-10-29 16:26:08	268435458	submission.event.general.metadataUpdated	0
292	515	61	30	2022-10-29 16:26:10	1342177281	submission.event.fileUploaded	0
293	1048585	13	30	2022-10-29 16:26:10	1342177288	submission.event.fileRevised	0
294	515	61	30	2022-10-29 16:26:11	1342177296	submission.event.fileEdited	0
295	1048585	13	30	2022-10-29 16:26:11	1342177296	submission.event.fileEdited	0
296	515	62	30	2022-10-29 16:26:12	1342177281	submission.event.fileUploaded	0
297	1048585	13	30	2022-10-29 16:26:12	1342177288	submission.event.fileRevised	0
298	515	62	30	2022-10-29 16:26:13	1342177296	submission.event.fileEdited	0
299	1048585	13	30	2022-10-29 16:26:13	1342177296	submission.event.fileEdited	0
300	515	63	30	2022-10-29 16:26:13	1342177281	submission.event.fileUploaded	0
301	1048585	13	30	2022-10-29 16:26:13	1342177288	submission.event.fileRevised	0
302	515	63	30	2022-10-29 16:26:15	1342177296	submission.event.fileEdited	0
303	1048585	13	30	2022-10-29 16:26:15	1342177296	submission.event.fileEdited	0
304	1048585	13	30	2022-10-29 16:26:52	268435458	submission.event.general.metadataUpdated	0
305	1048585	13	30	2022-10-29 16:26:53	268435457	submission.event.submissionSubmitted	0
306	1048585	13	3	2022-10-29 16:27:11	805306371	editor.submission.decision.sendInternalReview.log	0
307	515	64	3	2022-10-29 16:27:11	1342177281	submission.event.fileUploaded	0
308	1048585	13	3	2022-10-29 16:27:11	1342177288	submission.event.fileRevised	0
309	515	65	3	2022-10-29 16:27:11	1342177281	submission.event.fileUploaded	0
310	1048585	13	3	2022-10-29 16:27:11	1342177288	submission.event.fileRevised	0
311	515	66	3	2022-10-29 16:27:11	1342177281	submission.event.fileUploaded	0
312	1048585	13	3	2022-10-29 16:27:11	1342177288	submission.event.fileRevised	0
313	1048585	13	3	2022-10-29 16:27:22	1073741825	log.review.reviewerAssigned	0
314	1048585	13	3	2022-10-29 16:27:28	805306371	editor.submission.decision.sendExternalReview.log	0
315	1048585	13	3	2022-10-29 16:27:39	1073741825	log.review.reviewerAssigned	0
316	1048585	13	3	2022-10-29 16:27:48	1073741825	log.review.reviewerAssigned	0
317	1048585	13	3	2022-10-29 16:27:56	1073741825	log.review.reviewerAssigned	0
318	1048585	13	10	2022-10-29 16:28:06	1073741830	log.review.reviewAccepted	0
319	1048585	13	10	2022-10-29 16:28:11	1073741848	log.review.reviewReady	0
320	1048585	13	12	2022-10-29 16:28:19	1073741830	log.review.reviewAccepted	0
321	1048585	13	12	2022-10-29 16:28:24	1073741848	log.review.reviewReady	0
322	1048585	13	3	2022-10-29 16:28:48	805306371	editor.submission.decision.accept.log	0
323	1048585	13	3	2022-10-29 16:28:48	1073741856	submission.event.decisionReviewerEmailSent	0
324	1048585	14	31	2022-10-29 16:29:03	268435458	submission.event.general.metadataUpdated	0
325	1048585	14	31	2022-10-29 16:29:03	268435458	submission.event.general.metadataUpdated	0
326	515	67	31	2022-10-29 16:29:05	1342177281	submission.event.fileUploaded	0
327	1048585	14	31	2022-10-29 16:29:05	1342177288	submission.event.fileRevised	0
328	515	67	31	2022-10-29 16:29:07	1342177296	submission.event.fileEdited	0
329	1048585	14	31	2022-10-29 16:29:07	1342177296	submission.event.fileEdited	0
330	515	68	31	2022-10-29 16:29:07	1342177281	submission.event.fileUploaded	0
331	1048585	14	31	2022-10-29 16:29:07	1342177288	submission.event.fileRevised	0
332	515	68	31	2022-10-29 16:29:08	1342177296	submission.event.fileEdited	0
333	1048585	14	31	2022-10-29 16:29:08	1342177296	submission.event.fileEdited	0
334	515	69	31	2022-10-29 16:29:09	1342177281	submission.event.fileUploaded	0
335	1048585	14	31	2022-10-29 16:29:09	1342177288	submission.event.fileRevised	0
336	515	69	31	2022-10-29 16:29:10	1342177296	submission.event.fileEdited	0
337	1048585	14	31	2022-10-29 16:29:10	1342177296	submission.event.fileEdited	0
338	515	70	31	2022-10-29 16:29:10	1342177281	submission.event.fileUploaded	0
339	1048585	14	31	2022-10-29 16:29:10	1342177288	submission.event.fileRevised	0
340	515	70	31	2022-10-29 16:29:12	1342177296	submission.event.fileEdited	0
341	1048585	14	31	2022-10-29 16:29:12	1342177296	submission.event.fileEdited	0
342	515	71	31	2022-10-29 16:29:12	1342177281	submission.event.fileUploaded	0
343	1048585	14	31	2022-10-29 16:29:12	1342177288	submission.event.fileRevised	0
344	515	71	31	2022-10-29 16:29:14	1342177296	submission.event.fileEdited	0
345	1048585	14	31	2022-10-29 16:29:14	1342177296	submission.event.fileEdited	0
346	515	72	31	2022-10-29 16:29:14	1342177281	submission.event.fileUploaded	0
347	1048585	14	31	2022-10-29 16:29:14	1342177288	submission.event.fileRevised	0
348	515	72	31	2022-10-29 16:29:16	1342177296	submission.event.fileEdited	0
349	1048585	14	31	2022-10-29 16:29:16	1342177296	submission.event.fileEdited	0
350	1048585	14	31	2022-10-29 16:30:00	268435458	submission.event.general.metadataUpdated	0
351	1048585	14	31	2022-10-29 16:30:03	268435457	submission.event.submissionSubmitted	0
352	1048585	14	3	2022-10-29 16:30:22	805306371	editor.submission.decision.sendInternalReview.log	0
353	515	73	3	2022-10-29 16:30:22	1342177281	submission.event.fileUploaded	0
354	1048585	14	3	2022-10-29 16:30:22	1342177288	submission.event.fileRevised	0
355	515	74	3	2022-10-29 16:30:22	1342177281	submission.event.fileUploaded	0
356	1048585	14	3	2022-10-29 16:30:22	1342177288	submission.event.fileRevised	0
357	515	75	3	2022-10-29 16:30:23	1342177281	submission.event.fileUploaded	0
358	1048585	14	3	2022-10-29 16:30:23	1342177288	submission.event.fileRevised	0
359	515	76	3	2022-10-29 16:30:23	1342177281	submission.event.fileUploaded	0
360	1048585	14	3	2022-10-29 16:30:23	1342177288	submission.event.fileRevised	0
361	515	77	3	2022-10-29 16:30:23	1342177281	submission.event.fileUploaded	0
362	1048585	14	3	2022-10-29 16:30:23	1342177288	submission.event.fileRevised	0
363	515	78	3	2022-10-29 16:30:23	1342177281	submission.event.fileUploaded	0
364	1048585	14	3	2022-10-29 16:30:23	1342177288	submission.event.fileRevised	0
365	1048585	14	3	2022-10-29 16:30:35	1073741825	log.review.reviewerAssigned	0
366	1048585	14	3	2022-10-29 16:30:41	805306371	editor.submission.decision.sendExternalReview.log	0
367	1048585	14	3	2022-10-29 16:30:53	1073741825	log.review.reviewerAssigned	0
368	1048585	14	3	2022-10-29 16:31:00	805306371	editor.submission.decision.accept.log	0
369	1048585	14	3	2022-10-29 16:31:12	268435459	submission.event.participantAdded	0
370	1048585	14	3	2022-10-29 16:31:20	805306371	editor.submission.decision.sendToProduction.log	0
371	1048585	14	3	2022-10-29 16:31:31	268435459	submission.event.participantAdded	0
372	1048585	14	3	2022-10-29 16:31:39	268435459	submission.event.participantAdded	0
373	1048585	14	3	2022-10-29 16:31:45	268435474	submission.event.publicationFormatCreated	0
374	515	79	3	2022-10-29 16:31:55	1342177281	submission.event.fileUploaded	0
375	1048585	14	3	2022-10-29 16:31:55	1342177288	submission.event.fileRevised	0
376	515	80	3	2022-10-29 16:31:55	1342177281	submission.event.fileUploaded	0
377	1048585	14	3	2022-10-29 16:31:55	1342177288	submission.event.fileRevised	0
378	515	81	3	2022-10-29 16:31:55	1342177281	submission.event.fileUploaded	0
379	1048585	14	3	2022-10-29 16:31:55	1342177288	submission.event.fileRevised	0
380	515	82	3	2022-10-29 16:31:55	1342177281	submission.event.fileUploaded	0
381	1048585	14	3	2022-10-29 16:31:55	1342177288	submission.event.fileRevised	0
382	515	83	3	2022-10-29 16:31:55	1342177281	submission.event.fileUploaded	0
383	1048585	14	3	2022-10-29 16:31:55	1342177288	submission.event.fileRevised	0
384	515	84	3	2022-10-29 16:31:55	1342177281	submission.event.fileUploaded	0
385	1048585	14	3	2022-10-29 16:31:55	1342177288	submission.event.fileRevised	0
386	1048585	14	3	2022-10-29 16:31:57	268435464	submission.event.publicationFormatPublished	0
387	1048585	14	3	2022-10-29 16:32:00	268435476	submission.event.publicationFormatMadeAvailable	0
388	515	84	3	2022-10-29 16:32:03	1342177296	submission.event.fileEdited	0
389	1048585	14	3	2022-10-29 16:32:03	1342177296	submission.event.fileEdited	0
390	515	84	3	2022-10-29 16:32:03	1342177287	submission.event.signoffSignoff	0
391	515	84	3	2022-10-29 16:32:07	1342177296	submission.event.fileEdited	0
392	1048585	14	3	2022-10-29 16:32:07	1342177296	submission.event.fileEdited	0
393	515	83	3	2022-10-29 16:32:09	1342177296	submission.event.fileEdited	0
394	1048585	14	3	2022-10-29 16:32:09	1342177296	submission.event.fileEdited	0
395	515	83	3	2022-10-29 16:32:09	1342177287	submission.event.signoffSignoff	0
396	515	83	3	2022-10-29 16:32:13	1342177296	submission.event.fileEdited	0
397	1048585	14	3	2022-10-29 16:32:13	1342177296	submission.event.fileEdited	0
398	515	82	3	2022-10-29 16:32:16	1342177296	submission.event.fileEdited	0
399	1048585	14	3	2022-10-29 16:32:16	1342177296	submission.event.fileEdited	0
400	515	82	3	2022-10-29 16:32:16	1342177287	submission.event.signoffSignoff	0
401	515	82	3	2022-10-29 16:32:19	1342177296	submission.event.fileEdited	0
402	1048585	14	3	2022-10-29 16:32:19	1342177296	submission.event.fileEdited	0
403	515	81	3	2022-10-29 16:32:23	1342177296	submission.event.fileEdited	0
404	1048585	14	3	2022-10-29 16:32:23	1342177296	submission.event.fileEdited	0
405	515	81	3	2022-10-29 16:32:23	1342177287	submission.event.signoffSignoff	0
406	515	81	3	2022-10-29 16:32:26	1342177296	submission.event.fileEdited	0
407	1048585	14	3	2022-10-29 16:32:26	1342177296	submission.event.fileEdited	0
408	515	80	3	2022-10-29 16:32:29	1342177296	submission.event.fileEdited	0
409	1048585	14	3	2022-10-29 16:32:29	1342177296	submission.event.fileEdited	0
410	515	80	3	2022-10-29 16:32:29	1342177287	submission.event.signoffSignoff	0
411	515	80	3	2022-10-29 16:32:33	1342177296	submission.event.fileEdited	0
412	1048585	14	3	2022-10-29 16:32:33	1342177296	submission.event.fileEdited	0
413	515	79	3	2022-10-29 16:32:36	1342177296	submission.event.fileEdited	0
414	1048585	14	3	2022-10-29 16:32:36	1342177296	submission.event.fileEdited	0
415	515	79	3	2022-10-29 16:32:36	1342177287	submission.event.signoffSignoff	0
416	515	79	3	2022-10-29 16:32:40	1342177296	submission.event.fileEdited	0
417	1048585	14	3	2022-10-29 16:32:40	1342177296	submission.event.fileEdited	0
418	1048585	14	3	2022-10-29 16:32:44	268435462	publication.event.published	0
419	1048585	15	32	2022-10-29 16:32:54	268435458	submission.event.general.metadataUpdated	0
420	1048585	15	32	2022-10-29 16:32:55	268435458	submission.event.general.metadataUpdated	0
421	515	85	32	2022-10-29 16:32:57	1342177281	submission.event.fileUploaded	0
422	1048585	15	32	2022-10-29 16:32:57	1342177288	submission.event.fileRevised	0
423	515	85	32	2022-10-29 16:32:58	1342177296	submission.event.fileEdited	0
424	1048585	15	32	2022-10-29 16:32:58	1342177296	submission.event.fileEdited	0
425	1048585	15	32	2022-10-29 16:33:13	268435458	submission.event.general.metadataUpdated	0
426	1048585	15	32	2022-10-29 16:33:14	268435457	submission.event.submissionSubmitted	0
427	1048585	15	3	2022-10-29 16:33:30	805306371	editor.submission.decision.sendExternalReview.log	0
428	515	86	3	2022-10-29 16:33:31	1342177281	submission.event.fileUploaded	0
429	1048585	15	3	2022-10-29 16:33:31	1342177288	submission.event.fileRevised	0
430	1048585	16	33	2022-10-29 16:33:43	268435458	submission.event.general.metadataUpdated	0
431	1048585	16	33	2022-10-29 16:33:43	268435458	submission.event.general.metadataUpdated	0
432	515	87	33	2022-10-29 16:33:46	1342177281	submission.event.fileUploaded	0
433	1048585	16	33	2022-10-29 16:33:46	1342177288	submission.event.fileRevised	0
434	515	87	33	2022-10-29 16:33:47	1342177296	submission.event.fileEdited	0
435	1048585	16	33	2022-10-29 16:33:47	1342177296	submission.event.fileEdited	0
436	1048585	16	33	2022-10-29 16:34:10	268435458	submission.event.general.metadataUpdated	0
437	1048585	16	33	2022-10-29 16:34:12	268435457	submission.event.submissionSubmitted	0
438	1048585	16	3	2022-10-29 16:34:29	805306371	editor.submission.decision.sendExternalReview.log	0
439	515	88	3	2022-10-29 16:34:29	1342177281	submission.event.fileUploaded	0
440	1048585	16	3	2022-10-29 16:34:29	1342177288	submission.event.fileRevised	0
441	1048585	16	3	2022-10-29 16:34:39	1073741825	log.review.reviewerAssigned	0
442	1048585	16	3	2022-10-29 16:34:47	1073741825	log.review.reviewerAssigned	0
443	1048585	16	3	2022-10-29 16:34:54	1073741825	log.review.reviewerAssigned	0
444	1048585	16	10	2022-10-29 16:35:02	1073741830	log.review.reviewAccepted	0
445	1048585	16	10	2022-10-29 16:35:06	1073741848	log.review.reviewReady	0
446	1048585	17	34	2022-10-29 16:35:17	268435458	submission.event.general.metadataUpdated	0
447	1048585	17	34	2022-10-29 16:35:17	268435458	submission.event.general.metadataUpdated	0
448	515	89	34	2022-10-29 16:35:19	1342177281	submission.event.fileUploaded	0
449	1048585	17	34	2022-10-29 16:35:19	1342177288	submission.event.fileRevised	0
450	515	89	34	2022-10-29 16:35:20	1342177296	submission.event.fileEdited	0
451	1048585	17	34	2022-10-29 16:35:20	1342177296	submission.event.fileEdited	0
452	515	90	34	2022-10-29 16:35:21	1342177281	submission.event.fileUploaded	0
453	1048585	17	34	2022-10-29 16:35:21	1342177288	submission.event.fileRevised	0
454	515	90	34	2022-10-29 16:35:22	1342177296	submission.event.fileEdited	0
455	1048585	17	34	2022-10-29 16:35:22	1342177296	submission.event.fileEdited	0
456	515	91	34	2022-10-29 16:35:22	1342177281	submission.event.fileUploaded	0
457	1048585	17	34	2022-10-29 16:35:22	1342177288	submission.event.fileRevised	0
458	515	91	34	2022-10-29 16:35:24	1342177296	submission.event.fileEdited	0
459	1048585	17	34	2022-10-29 16:35:24	1342177296	submission.event.fileEdited	0
460	515	92	34	2022-10-29 16:35:24	1342177281	submission.event.fileUploaded	0
461	1048585	17	34	2022-10-29 16:35:24	1342177288	submission.event.fileRevised	0
462	515	92	34	2022-10-29 16:35:25	1342177296	submission.event.fileEdited	0
463	1048585	17	34	2022-10-29 16:35:25	1342177296	submission.event.fileEdited	0
464	515	93	34	2022-10-29 16:35:26	1342177281	submission.event.fileUploaded	0
465	1048585	17	34	2022-10-29 16:35:26	1342177288	submission.event.fileRevised	0
466	515	93	34	2022-10-29 16:35:27	1342177296	submission.event.fileEdited	0
467	1048585	17	34	2022-10-29 16:35:27	1342177296	submission.event.fileEdited	0
468	515	94	34	2022-10-29 16:35:27	1342177281	submission.event.fileUploaded	0
469	1048585	17	34	2022-10-29 16:35:27	1342177288	submission.event.fileRevised	0
470	515	94	34	2022-10-29 16:35:29	1342177296	submission.event.fileEdited	0
471	1048585	17	34	2022-10-29 16:35:29	1342177296	submission.event.fileEdited	0
472	1048585	17	34	2022-10-29 16:37:02	268435458	submission.event.general.metadataUpdated	0
473	1048585	17	34	2022-10-29 16:37:05	268435457	submission.event.submissionSubmitted	0
474	1048585	17	3	2022-10-29 16:37:29	805306371	editor.submission.decision.sendInternalReview.log	0
475	515	95	3	2022-10-29 16:37:29	1342177281	submission.event.fileUploaded	0
476	1048585	17	3	2022-10-29 16:37:29	1342177288	submission.event.fileRevised	0
477	515	96	3	2022-10-29 16:37:30	1342177281	submission.event.fileUploaded	0
478	1048585	17	3	2022-10-29 16:37:30	1342177288	submission.event.fileRevised	0
479	515	97	3	2022-10-29 16:37:30	1342177281	submission.event.fileUploaded	0
480	1048585	17	3	2022-10-29 16:37:30	1342177288	submission.event.fileRevised	0
481	515	98	3	2022-10-29 16:37:30	1342177281	submission.event.fileUploaded	0
482	1048585	17	3	2022-10-29 16:37:30	1342177288	submission.event.fileRevised	0
483	515	99	3	2022-10-29 16:37:30	1342177281	submission.event.fileUploaded	0
484	1048585	17	3	2022-10-29 16:37:30	1342177288	submission.event.fileRevised	0
485	515	100	3	2022-10-29 16:37:30	1342177281	submission.event.fileUploaded	0
486	1048585	17	3	2022-10-29 16:37:30	1342177288	submission.event.fileRevised	0
487	1048585	17	3	2022-10-29 16:37:43	1073741825	log.review.reviewerAssigned	0
488	1048585	17	3	2022-10-29 16:37:53	1073741825	log.review.reviewerAssigned	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 488, true);


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
9	editorId	3	int
9	editorName	Daniel Barnes	string
9	submissionId	1	int
9	decision	18	int
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
12	reviewAssignmentId	1	int
12	reviewerName	Gonzalo Favio	string
12	submissionId	1	int
12	stageId	3	int
12	round	1	int
13	editorId	3	int
13	editorName	Daniel Barnes	string
13	submissionId	1	int
13	decision	2	int
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
35	editorId	3	int
35	editorName	Daniel Barnes	string
35	submissionId	2	int
35	decision	18	int
36	fileStage	4	int
36	sourceSubmissionFileId	6	int
36	submissionFileId	7	int
36	fileId	5	int
36	submissionId	2	int
36	originalFileName	Visualizing Space, Race, and History in .pdf	string
36	username	dbarnes	string
37	fileStage	4	int
37	submissionFileId	7	int
37	fileId	5	int
37	submissionId	2	int
37	username	dbarnes	string
37	name	Visualizing Space, Race, and History in .pdf	string
38	fileStage	4	int
38	sourceSubmissionFileId	5	int
38	submissionFileId	8	int
38	fileId	4	int
38	submissionId	2	int
38	originalFileName	Cree Intellectual Traditions in History.pdf	string
38	username	dbarnes	string
39	fileStage	4	int
39	submissionFileId	8	int
39	fileId	4	int
39	submissionId	2	int
39	username	dbarnes	string
39	name	Cree Intellectual Traditions in History.pdf	string
40	fileStage	4	int
40	sourceSubmissionFileId	4	int
40	submissionFileId	9	int
40	fileId	3	int
40	submissionId	2	int
40	originalFileName	Vernacular Currents in Western Canadian .pdf	string
40	username	dbarnes	string
41	fileStage	4	int
41	submissionFileId	9	int
41	fileId	3	int
41	submissionId	2	int
41	username	dbarnes	string
41	name	Vernacular Currents in Western Canadian .pdf	string
42	fileStage	4	int
42	sourceSubmissionFileId	3	int
42	submissionFileId	10	int
42	fileId	2	int
42	submissionId	2	int
42	originalFileName	Critical History in Western Canada 1900–.pdf	string
42	username	dbarnes	string
43	fileStage	4	int
43	submissionFileId	10	int
43	fileId	2	int
43	submissionId	2	int
43	username	dbarnes	string
43	name	Critical History in Western Canada 1900–.pdf	string
44	reviewAssignmentId	2	int
44	reviewerName	Al Zacharia	string
44	submissionId	2	int
44	stageId	3	int
44	round	1	int
45	reviewAssignmentId	3	int
45	reviewerName	Gonzalo Favio	string
45	submissionId	2	int
45	stageId	3	int
45	round	1	int
48	fileStage	2	int
48	sourceSubmissionFileId	\N	string
48	submissionFileId	11	int
48	fileId	6	int
48	submissionId	3	int
48	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
48	username	bbarnetson	string
49	fileStage	2	int
49	submissionFileId	11	int
49	fileId	6	int
49	submissionId	3	int
49	username	bbarnetson	string
71	sourceSubmissionFileId	\N	string
49	name	The Political Economy of Workplace Injury in Canada.pdf	string
50	fileStage	2	int
50	sourceSubmissionFileId	\N	string
50	submissionFileId	11	int
50	fileId	6	int
50	submissionId	3	int
50	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
50	username	bbarnetson	string
51	fileStage	2	int
51	sourceSubmissionFileId	\N	string
51	submissionFileId	11	int
51	fileId	6	int
51	submissionId	3	int
51	username	bbarnetson	string
51	originalFileName	The Political Economy of Workplace Injury in Canada.pdf	string
51	name	The Political Economy of Workplace Injury in Canada.pdf	string
56	fileStage	2	int
56	sourceSubmissionFileId	\N	string
56	submissionFileId	12	int
56	fileId	7	int
56	submissionId	4	int
56	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
56	username	bbeaty	string
57	fileStage	2	int
57	submissionFileId	12	int
57	fileId	7	int
57	submissionId	4	int
57	username	bbeaty	string
57	name	Introduction: Contexts of Popular Cultur.pdf	string
58	fileStage	2	int
58	sourceSubmissionFileId	\N	string
58	submissionFileId	12	int
58	fileId	7	int
58	submissionId	4	int
58	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
58	username	bbeaty	string
59	fileStage	2	int
59	sourceSubmissionFileId	\N	string
59	submissionFileId	12	int
59	fileId	7	int
59	submissionId	4	int
59	username	bbeaty	string
59	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
59	name	Introduction: Contexts of Popular Cultur.pdf	string
60	fileStage	2	int
60	sourceSubmissionFileId	\N	string
60	submissionFileId	13	int
60	fileId	8	int
60	submissionId	4	int
60	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
60	username	bbeaty	string
61	fileStage	2	int
61	submissionFileId	13	int
61	fileId	8	int
61	submissionId	4	int
61	username	bbeaty	string
61	name	Chapter 1. A Future for Media Studies: C.pdf	string
62	fileStage	2	int
62	sourceSubmissionFileId	\N	string
62	submissionFileId	13	int
62	fileId	8	int
62	submissionId	4	int
62	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
62	username	bbeaty	string
63	fileStage	2	int
63	sourceSubmissionFileId	\N	string
63	submissionFileId	13	int
63	fileId	8	int
63	submissionId	4	int
63	username	bbeaty	string
63	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
63	name	Chapter 1. A Future for Media Studies: C.pdf	string
64	fileStage	2	int
64	sourceSubmissionFileId	\N	string
64	submissionFileId	14	int
64	fileId	9	int
64	submissionId	4	int
64	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
64	username	bbeaty	string
65	fileStage	2	int
65	submissionFileId	14	int
65	fileId	9	int
65	submissionId	4	int
65	username	bbeaty	string
65	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
66	fileStage	2	int
66	sourceSubmissionFileId	\N	string
66	submissionFileId	14	int
66	fileId	9	int
66	submissionId	4	int
66	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
66	username	bbeaty	string
67	fileStage	2	int
67	sourceSubmissionFileId	\N	string
67	submissionFileId	14	int
67	fileId	9	int
67	submissionId	4	int
67	username	bbeaty	string
67	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
67	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
68	fileStage	2	int
68	sourceSubmissionFileId	\N	string
68	submissionFileId	15	int
68	fileId	10	int
68	submissionId	4	int
68	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
68	username	bbeaty	string
69	fileStage	2	int
69	submissionFileId	15	int
69	fileId	10	int
69	submissionId	4	int
69	username	bbeaty	string
69	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
70	fileStage	2	int
70	sourceSubmissionFileId	\N	string
70	submissionFileId	15	int
70	fileId	10	int
70	submissionId	4	int
70	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
70	username	bbeaty	string
71	fileStage	2	int
71	submissionFileId	15	int
71	fileId	10	int
71	submissionId	4	int
71	username	bbeaty	string
71	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
71	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
74	editorId	3	int
74	editorName	Daniel Barnes	string
74	submissionId	4	int
74	decision	1	int
75	fileStage	19	int
75	sourceSubmissionFileId	15	int
75	submissionFileId	16	int
75	fileId	10	int
75	submissionId	4	int
75	originalFileName	Chapter 3. Hawkers and Public Space: Fre.pdf	string
75	username	dbarnes	string
76	fileStage	19	int
76	submissionFileId	16	int
76	fileId	10	int
76	submissionId	4	int
76	username	dbarnes	string
76	name	Chapter 3. Hawkers and Public Space: Fre.pdf	string
77	fileStage	19	int
77	sourceSubmissionFileId	14	int
77	submissionFileId	17	int
77	fileId	9	int
77	submissionId	4	int
77	originalFileName	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
77	username	dbarnes	string
78	fileStage	19	int
78	submissionFileId	17	int
78	fileId	9	int
78	submissionId	4	int
78	username	dbarnes	string
78	name	Chapter 2. Log On, Goof Off, and Look Up.pdf	string
79	fileStage	19	int
79	sourceSubmissionFileId	13	int
79	submissionFileId	18	int
79	fileId	8	int
79	submissionId	4	int
79	originalFileName	Chapter 1. A Future for Media Studies: C.pdf	string
79	username	dbarnes	string
80	fileStage	19	int
80	submissionFileId	18	int
80	fileId	8	int
80	submissionId	4	int
80	username	dbarnes	string
80	name	Chapter 1. A Future for Media Studies: C.pdf	string
81	fileStage	19	int
81	sourceSubmissionFileId	12	int
81	submissionFileId	19	int
81	fileId	7	int
81	submissionId	4	int
81	originalFileName	Introduction: Contexts of Popular Cultur.pdf	string
81	username	dbarnes	string
82	fileStage	19	int
82	submissionFileId	19	int
82	fileId	7	int
82	submissionId	4	int
82	username	dbarnes	string
82	name	Introduction: Contexts of Popular Cultur.pdf	string
83	reviewAssignmentId	4	int
83	reviewerName	Aisla McCrae	string
83	submissionId	4	int
83	stageId	2	int
83	round	1	int
84	editorId	3	int
84	editorName	Daniel Barnes	string
84	submissionId	4	int
84	decision	3	int
85	reviewAssignmentId	5	int
85	reviewerName	Al Zacharia	string
85	submissionId	4	int
85	stageId	3	int
85	round	1	int
86	editorId	3	int
86	editorName	Daniel Barnes	string
86	submissionId	4	int
86	decision	2	int
87	name	Maria Fritz	string
87	username	mfritz	string
87	userGroupName	Copyeditor	string
88	editorId	3	int
88	editorName	Daniel Barnes	string
88	submissionId	4	int
88	decision	7	int
89	name	Graham Cox	string
89	username	gcox	string
89	userGroupName	Layout Editor	string
90	formatName	PDF	string
93	fileStage	2	int
93	sourceSubmissionFileId	\N	string
93	submissionFileId	20	int
93	fileId	11	int
93	submissionId	5	int
93	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
93	username	callan	string
94	fileStage	2	int
94	submissionFileId	20	int
94	fileId	11	int
94	submissionId	5	int
94	username	callan	string
94	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
95	fileStage	2	int
95	sourceSubmissionFileId	\N	string
95	submissionFileId	20	int
95	fileId	11	int
95	submissionId	5	int
95	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
95	username	callan	string
96	fileStage	2	int
96	sourceSubmissionFileId	\N	string
96	submissionFileId	20	int
96	fileId	11	int
96	submissionId	5	int
96	username	callan	string
96	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
96	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
99	editorId	3	int
99	editorName	Daniel Barnes	string
99	submissionId	5	int
99	decision	1	int
100	fileStage	19	int
100	sourceSubmissionFileId	20	int
100	submissionFileId	21	int
100	fileId	11	int
100	submissionId	5	int
100	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
100	username	dbarnes	string
101	fileStage	19	int
101	submissionFileId	21	int
101	fileId	11	int
101	submissionId	5	int
101	username	dbarnes	string
101	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
102	reviewAssignmentId	6	int
102	reviewerName	Paul Hudson	string
102	submissionId	5	int
102	stageId	2	int
102	round	1	int
103	editorId	3	int
103	editorName	Daniel Barnes	string
103	submissionId	5	int
103	decision	3	int
104	reviewAssignmentId	7	int
104	reviewerName	Gonzalo Favio	string
104	submissionId	5	int
104	stageId	3	int
104	round	1	int
105	editorId	3	int
105	editorName	Daniel Barnes	string
105	submissionId	5	int
105	decision	2	int
106	name	Sarah Vogt	string
106	username	svogt	string
106	userGroupName	Copyeditor	string
107	editorId	3	int
107	editorName	Daniel Barnes	string
107	submissionId	5	int
107	decision	7	int
108	name	Stephen Hellier	string
108	username	shellier	string
108	userGroupName	Layout Editor	string
109	name	Catherine Turner	string
109	username	cturner	string
109	userGroupName	Proofreader	string
110	formatName	PDF	string
111	fileStage	10	int
111	sourceSubmissionFileId	20	int
111	submissionFileId	22	int
111	fileId	11	int
111	submissionId	5	int
111	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
111	username	dbarnes	string
112	fileStage	10	int
112	submissionFileId	22	int
112	fileId	11	int
112	submissionId	5	int
112	username	dbarnes	string
112	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
113	publicationFormatName	PDF	string
114	publicationFormatName	PDF	string
115	fileStage	10	int
115	sourceSubmissionFileId	20	int
115	submissionFileId	22	int
115	fileId	11	int
115	submissionId	5	int
115	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
115	username	dbarnes	string
116	fileStage	10	int
116	sourceSubmissionFileId	20	int
116	submissionFileId	22	int
116	fileId	11	int
116	submissionId	5	int
116	username	dbarnes	string
116	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
116	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
117	file	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
117	name	Daniel Barnes	string
117	username	dbarnes	string
118	fileStage	10	int
118	sourceSubmissionFileId	20	int
118	submissionFileId	22	int
118	fileId	11	int
118	submissionId	5	int
118	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
118	username	dbarnes	string
119	fileStage	10	int
119	sourceSubmissionFileId	20	int
119	submissionFileId	22	int
119	fileId	11	int
119	submissionId	5	int
119	username	dbarnes	string
119	originalFileName	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
119	name	Bomb Canada and Other Unkind Remarks in the American Media.pdf	string
123	fileStage	2	int
123	sourceSubmissionFileId	\N	string
123	submissionFileId	23	int
123	fileId	12	int
123	submissionId	6	int
123	originalFileName	Identify: Understanding Your Information.pdf	string
123	username	dbernnard	string
124	fileStage	2	int
124	submissionFileId	23	int
124	fileId	12	int
124	submissionId	6	int
124	username	dbernnard	string
124	name	Identify: Understanding Your Information.pdf	string
125	fileStage	2	int
125	sourceSubmissionFileId	\N	string
125	submissionFileId	23	int
125	fileId	12	int
125	submissionId	6	int
125	originalFileName	Identify: Understanding Your Information.pdf	string
125	username	dbernnard	string
126	fileStage	2	int
126	sourceSubmissionFileId	\N	string
126	submissionFileId	23	int
126	fileId	12	int
126	submissionId	6	int
126	username	dbernnard	string
126	originalFileName	Identify: Understanding Your Information.pdf	string
126	name	Identify: Understanding Your Information.pdf	string
127	fileStage	2	int
127	sourceSubmissionFileId	\N	string
127	submissionFileId	24	int
127	fileId	13	int
127	submissionId	6	int
127	originalFileName	Scope: Knowing What Is Available.pdf	string
127	username	dbernnard	string
128	fileStage	2	int
128	submissionFileId	24	int
128	fileId	13	int
128	submissionId	6	int
128	username	dbernnard	string
128	name	Scope: Knowing What Is Available.pdf	string
129	fileStage	2	int
129	sourceSubmissionFileId	\N	string
129	submissionFileId	24	int
129	fileId	13	int
129	submissionId	6	int
129	originalFileName	Scope: Knowing What Is Available.pdf	string
129	username	dbernnard	string
130	fileStage	2	int
130	sourceSubmissionFileId	\N	string
130	submissionFileId	24	int
130	fileId	13	int
130	submissionId	6	int
130	username	dbernnard	string
130	originalFileName	Scope: Knowing What Is Available.pdf	string
130	name	Scope: Knowing What Is Available.pdf	string
131	fileStage	2	int
131	sourceSubmissionFileId	\N	string
131	submissionFileId	25	int
131	fileId	14	int
131	submissionId	6	int
131	originalFileName	Plan: Developing Research Strategies.pdf	string
131	username	dbernnard	string
132	fileStage	2	int
132	submissionFileId	25	int
132	fileId	14	int
132	submissionId	6	int
132	username	dbernnard	string
132	name	Plan: Developing Research Strategies.pdf	string
133	fileStage	2	int
133	sourceSubmissionFileId	\N	string
133	submissionFileId	25	int
133	fileId	14	int
133	submissionId	6	int
133	originalFileName	Plan: Developing Research Strategies.pdf	string
133	username	dbernnard	string
134	fileStage	2	int
134	sourceSubmissionFileId	\N	string
134	submissionFileId	25	int
134	fileId	14	int
134	submissionId	6	int
134	username	dbernnard	string
134	originalFileName	Plan: Developing Research Strategies.pdf	string
134	name	Plan: Developing Research Strategies.pdf	string
135	fileStage	2	int
135	sourceSubmissionFileId	\N	string
135	submissionFileId	26	int
135	fileId	15	int
135	submissionId	6	int
135	originalFileName	Gather: Finding What You Need.pdf	string
135	username	dbernnard	string
136	fileStage	2	int
136	submissionFileId	26	int
136	fileId	15	int
136	submissionId	6	int
136	username	dbernnard	string
136	name	Gather: Finding What You Need.pdf	string
137	fileStage	2	int
137	sourceSubmissionFileId	\N	string
137	submissionFileId	26	int
137	fileId	15	int
137	submissionId	6	int
137	originalFileName	Gather: Finding What You Need.pdf	string
137	username	dbernnard	string
138	fileStage	2	int
138	sourceSubmissionFileId	\N	string
138	submissionFileId	26	int
138	fileId	15	int
138	submissionId	6	int
138	username	dbernnard	string
138	originalFileName	Gather: Finding What You Need.pdf	string
138	name	Gather: Finding What You Need.pdf	string
141	editorId	3	int
141	editorName	Daniel Barnes	string
141	submissionId	6	int
141	decision	1	int
142	fileStage	19	int
142	sourceSubmissionFileId	26	int
142	submissionFileId	27	int
142	fileId	15	int
142	submissionId	6	int
142	originalFileName	Gather: Finding What You Need.pdf	string
142	username	dbarnes	string
143	fileStage	19	int
143	submissionFileId	27	int
143	fileId	15	int
143	submissionId	6	int
143	username	dbarnes	string
143	name	Gather: Finding What You Need.pdf	string
144	fileStage	19	int
144	sourceSubmissionFileId	25	int
144	submissionFileId	28	int
144	fileId	14	int
144	submissionId	6	int
144	originalFileName	Plan: Developing Research Strategies.pdf	string
144	username	dbarnes	string
145	fileStage	19	int
145	submissionFileId	28	int
145	fileId	14	int
145	submissionId	6	int
145	username	dbarnes	string
145	name	Plan: Developing Research Strategies.pdf	string
146	fileStage	19	int
146	sourceSubmissionFileId	24	int
146	submissionFileId	29	int
146	fileId	13	int
146	submissionId	6	int
146	originalFileName	Scope: Knowing What Is Available.pdf	string
146	username	dbarnes	string
147	fileStage	19	int
147	submissionFileId	29	int
147	fileId	13	int
147	submissionId	6	int
147	username	dbarnes	string
147	name	Scope: Knowing What Is Available.pdf	string
148	fileStage	19	int
148	sourceSubmissionFileId	23	int
148	submissionFileId	30	int
148	fileId	12	int
148	submissionId	6	int
148	originalFileName	Identify: Understanding Your Information.pdf	string
148	username	dbarnes	string
149	fileStage	19	int
149	submissionFileId	30	int
149	fileId	12	int
149	submissionId	6	int
149	username	dbarnes	string
149	name	Identify: Understanding Your Information.pdf	string
150	name	Minoti Inoue	string
150	username	minoue	string
150	userGroupName	Series editor	string
151	editorId	6	int
151	editorName	Minoti Inoue	string
151	submissionId	6	int
151	decision	23	int
154	fileStage	2	int
154	sourceSubmissionFileId	\N	string
154	submissionFileId	31	int
154	fileId	16	int
154	submissionId	7	int
154	originalFileName	Introduction.pdf	string
154	username	dkennepohl	string
155	fileStage	2	int
155	submissionFileId	31	int
155	fileId	16	int
155	submissionId	7	int
155	username	dkennepohl	string
155	name	Introduction.pdf	string
156	fileStage	2	int
156	sourceSubmissionFileId	\N	string
156	submissionFileId	31	int
156	fileId	16	int
156	submissionId	7	int
156	originalFileName	Introduction.pdf	string
156	username	dkennepohl	string
157	fileStage	2	int
157	sourceSubmissionFileId	\N	string
157	submissionFileId	31	int
157	fileId	16	int
157	submissionId	7	int
157	username	dkennepohl	string
157	originalFileName	Introduction.pdf	string
157	name	Introduction.pdf	string
158	fileStage	2	int
158	sourceSubmissionFileId	\N	string
158	submissionFileId	32	int
158	fileId	17	int
158	submissionId	7	int
158	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
158	username	dkennepohl	string
159	fileStage	2	int
159	submissionFileId	32	int
159	fileId	17	int
159	submissionId	7	int
159	username	dkennepohl	string
159	name	Chapter 1: Interactions Affording Distan.pdf	string
160	fileStage	2	int
160	sourceSubmissionFileId	\N	string
160	submissionFileId	32	int
160	fileId	17	int
160	submissionId	7	int
160	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
160	username	dkennepohl	string
161	fileStage	2	int
161	sourceSubmissionFileId	\N	string
161	submissionFileId	32	int
161	fileId	17	int
161	submissionId	7	int
161	username	dkennepohl	string
161	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
161	name	Chapter 1: Interactions Affording Distan.pdf	string
162	fileStage	2	int
162	sourceSubmissionFileId	\N	string
162	submissionFileId	33	int
162	fileId	18	int
162	submissionId	7	int
162	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
162	username	dkennepohl	string
163	fileStage	2	int
163	submissionFileId	33	int
163	fileId	18	int
163	submissionId	7	int
163	username	dkennepohl	string
163	name	Chapter 2: Learning Science at a Distanc.pdf	string
164	fileStage	2	int
164	sourceSubmissionFileId	\N	string
164	submissionFileId	33	int
164	fileId	18	int
164	submissionId	7	int
164	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
164	username	dkennepohl	string
165	fileStage	2	int
165	sourceSubmissionFileId	\N	string
165	submissionFileId	33	int
165	fileId	18	int
165	submissionId	7	int
165	username	dkennepohl	string
165	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
165	name	Chapter 2: Learning Science at a Distanc.pdf	string
166	fileStage	2	int
166	sourceSubmissionFileId	\N	string
166	submissionFileId	34	int
166	fileId	19	int
166	submissionId	7	int
166	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
166	username	dkennepohl	string
167	fileStage	2	int
167	submissionFileId	34	int
167	fileId	19	int
167	submissionId	7	int
167	username	dkennepohl	string
167	name	Chapter 3: Leadership Strategies for Coo.pdf	string
168	fileStage	2	int
168	sourceSubmissionFileId	\N	string
168	submissionFileId	34	int
168	fileId	19	int
168	submissionId	7	int
168	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
168	username	dkennepohl	string
169	fileStage	2	int
169	sourceSubmissionFileId	\N	string
169	submissionFileId	34	int
169	fileId	19	int
169	submissionId	7	int
169	username	dkennepohl	string
169	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
169	name	Chapter 3: Leadership Strategies for Coo.pdf	string
170	fileStage	2	int
170	sourceSubmissionFileId	\N	string
170	submissionFileId	35	int
170	fileId	20	int
170	submissionId	7	int
170	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
170	username	dkennepohl	string
171	fileStage	2	int
171	submissionFileId	35	int
171	fileId	20	int
171	submissionId	7	int
171	username	dkennepohl	string
171	name	Chapter 4: Toward New Models of Flexible.pdf	string
172	fileStage	2	int
172	sourceSubmissionFileId	\N	string
172	submissionFileId	35	int
172	fileId	20	int
172	submissionId	7	int
172	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
172	username	dkennepohl	string
173	fileStage	2	int
173	sourceSubmissionFileId	\N	string
173	submissionFileId	35	int
173	fileId	20	int
173	submissionId	7	int
173	username	dkennepohl	string
173	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
173	name	Chapter 4: Toward New Models of Flexible.pdf	string
176	editorId	3	int
176	editorName	Daniel Barnes	string
176	submissionId	7	int
176	decision	18	int
177	fileStage	4	int
177	sourceSubmissionFileId	35	int
177	submissionFileId	36	int
177	fileId	20	int
177	submissionId	7	int
177	originalFileName	Chapter 4: Toward New Models of Flexible.pdf	string
177	username	dbarnes	string
178	fileStage	4	int
178	submissionFileId	36	int
178	fileId	20	int
178	submissionId	7	int
178	username	dbarnes	string
178	name	Chapter 4: Toward New Models of Flexible.pdf	string
179	fileStage	4	int
179	sourceSubmissionFileId	34	int
179	submissionFileId	37	int
179	fileId	19	int
179	submissionId	7	int
179	originalFileName	Chapter 3: Leadership Strategies for Coo.pdf	string
179	username	dbarnes	string
180	fileStage	4	int
180	submissionFileId	37	int
180	fileId	19	int
180	submissionId	7	int
180	username	dbarnes	string
180	name	Chapter 3: Leadership Strategies for Coo.pdf	string
181	fileStage	4	int
181	sourceSubmissionFileId	33	int
181	submissionFileId	38	int
181	fileId	18	int
181	submissionId	7	int
181	originalFileName	Chapter 2: Learning Science at a Distanc.pdf	string
181	username	dbarnes	string
182	fileStage	4	int
182	submissionFileId	38	int
182	fileId	18	int
182	submissionId	7	int
182	username	dbarnes	string
182	name	Chapter 2: Learning Science at a Distanc.pdf	string
183	fileStage	4	int
183	sourceSubmissionFileId	32	int
183	submissionFileId	39	int
183	fileId	17	int
183	submissionId	7	int
183	originalFileName	Chapter 1: Interactions Affording Distan.pdf	string
183	username	dbarnes	string
184	fileStage	4	int
184	submissionFileId	39	int
184	fileId	17	int
184	submissionId	7	int
184	username	dbarnes	string
184	name	Chapter 1: Interactions Affording Distan.pdf	string
185	fileStage	4	int
185	sourceSubmissionFileId	31	int
185	submissionFileId	40	int
185	fileId	16	int
185	submissionId	7	int
185	originalFileName	Introduction.pdf	string
185	username	dbarnes	string
186	fileStage	4	int
186	submissionFileId	40	int
186	fileId	16	int
186	submissionId	7	int
186	username	dbarnes	string
186	name	Introduction.pdf	string
187	reviewAssignmentId	8	int
187	reviewerName	Adela Gallego	string
187	submissionId	7	int
187	stageId	3	int
187	round	1	int
188	editorId	3	int
188	editorName	Daniel Barnes	string
188	submissionId	7	int
188	decision	2	int
189	name	Maria Fritz	string
189	username	mfritz	string
189	userGroupName	Copyeditor	string
192	fileStage	2	int
192	sourceSubmissionFileId	\N	string
192	submissionFileId	41	int
192	fileId	21	int
192	submissionId	8	int
192	originalFileName	Editorial.pdf	string
192	username	dbarnes	string
193	fileStage	2	int
193	submissionFileId	41	int
193	fileId	21	int
193	submissionId	8	int
193	username	dbarnes	string
193	name	Editorial.pdf	string
194	fileStage	2	int
194	sourceSubmissionFileId	\N	string
194	submissionFileId	41	int
194	fileId	21	int
194	submissionId	8	int
194	originalFileName	Editorial.pdf	string
194	username	dbarnes	string
195	fileStage	2	int
195	sourceSubmissionFileId	\N	string
195	submissionFileId	41	int
195	fileId	21	int
195	submissionId	8	int
195	username	dbarnes	string
195	originalFileName	Editorial.pdf	string
195	name	Editorial.pdf	string
200	fileStage	2	int
200	sourceSubmissionFileId	\N	string
200	submissionFileId	42	int
200	fileId	22	int
200	submissionId	9	int
200	originalFileName	Internet, openness and the future of the.pdf	string
200	username	fperini	string
201	fileStage	2	int
201	submissionFileId	42	int
201	fileId	22	int
201	submissionId	9	int
201	username	fperini	string
201	name	Internet, openness and the future of the.pdf	string
202	fileStage	2	int
202	sourceSubmissionFileId	\N	string
202	submissionFileId	42	int
202	fileId	22	int
202	submissionId	9	int
202	originalFileName	Internet, openness and the future of the.pdf	string
202	username	fperini	string
203	fileStage	2	int
203	sourceSubmissionFileId	\N	string
203	submissionFileId	42	int
203	fileId	22	int
203	submissionId	9	int
203	username	fperini	string
203	originalFileName	Internet, openness and the future of the.pdf	string
203	name	Internet, openness and the future of the.pdf	string
204	fileStage	2	int
204	sourceSubmissionFileId	\N	string
204	submissionFileId	43	int
204	fileId	23	int
204	submissionId	9	int
204	originalFileName	Imagining the Internet: Open, closed or .pdf	string
204	username	fperini	string
205	fileStage	2	int
205	submissionFileId	43	int
205	fileId	23	int
205	submissionId	9	int
205	username	fperini	string
205	name	Imagining the Internet: Open, closed or .pdf	string
206	fileStage	2	int
206	sourceSubmissionFileId	\N	string
206	submissionFileId	43	int
206	fileId	23	int
206	submissionId	9	int
206	originalFileName	Imagining the Internet: Open, closed or .pdf	string
206	username	fperini	string
207	fileStage	2	int
207	sourceSubmissionFileId	\N	string
207	submissionFileId	43	int
207	fileId	23	int
207	submissionId	9	int
207	username	fperini	string
207	originalFileName	Imagining the Internet: Open, closed or .pdf	string
207	name	Imagining the Internet: Open, closed or .pdf	string
208	fileStage	2	int
208	sourceSubmissionFileId	\N	string
208	submissionFileId	44	int
208	fileId	24	int
208	submissionId	9	int
208	originalFileName	The internet in LAC will remain free, pu.pdf	string
208	username	fperini	string
209	fileStage	2	int
209	submissionFileId	44	int
209	fileId	24	int
209	submissionId	9	int
209	username	fperini	string
209	name	The internet in LAC will remain free, pu.pdf	string
210	fileStage	2	int
210	sourceSubmissionFileId	\N	string
210	submissionFileId	44	int
210	fileId	24	int
210	submissionId	9	int
210	originalFileName	The internet in LAC will remain free, pu.pdf	string
210	username	fperini	string
211	fileStage	2	int
211	sourceSubmissionFileId	\N	string
211	submissionFileId	44	int
211	fileId	24	int
211	submissionId	9	int
211	username	fperini	string
211	originalFileName	The internet in LAC will remain free, pu.pdf	string
211	name	The internet in LAC will remain free, pu.pdf	string
212	fileStage	2	int
212	sourceSubmissionFileId	\N	string
212	submissionFileId	45	int
212	fileId	25	int
212	submissionId	9	int
212	originalFileName	Free Internet?.pdf	string
212	username	fperini	string
213	fileStage	2	int
213	submissionFileId	45	int
213	fileId	25	int
213	submissionId	9	int
213	username	fperini	string
213	name	Free Internet?.pdf	string
214	fileStage	2	int
214	sourceSubmissionFileId	\N	string
214	submissionFileId	45	int
214	fileId	25	int
214	submissionId	9	int
214	originalFileName	Free Internet?.pdf	string
214	username	fperini	string
215	fileStage	2	int
215	sourceSubmissionFileId	\N	string
215	submissionFileId	45	int
215	fileId	25	int
215	submissionId	9	int
215	username	fperini	string
215	originalFileName	Free Internet?.pdf	string
215	name	Free Internet?.pdf	string
216	fileStage	2	int
216	sourceSubmissionFileId	\N	string
216	submissionFileId	46	int
216	fileId	26	int
216	submissionId	9	int
216	originalFileName	Risks and challenges for freedom of expr.pdf	string
216	username	fperini	string
217	fileStage	2	int
217	submissionFileId	46	int
217	fileId	26	int
217	submissionId	9	int
217	username	fperini	string
217	name	Risks and challenges for freedom of expr.pdf	string
218	fileStage	2	int
218	sourceSubmissionFileId	\N	string
218	submissionFileId	46	int
218	fileId	26	int
218	submissionId	9	int
218	originalFileName	Risks and challenges for freedom of expr.pdf	string
218	username	fperini	string
219	fileStage	2	int
219	sourceSubmissionFileId	\N	string
219	submissionFileId	46	int
219	fileId	26	int
219	submissionId	9	int
219	username	fperini	string
219	originalFileName	Risks and challenges for freedom of expr.pdf	string
219	name	Risks and challenges for freedom of expr.pdf	string
222	editorId	3	int
222	editorName	Daniel Barnes	string
222	submissionId	9	int
222	decision	1	int
223	fileStage	19	int
223	sourceSubmissionFileId	46	int
223	submissionFileId	47	int
223	fileId	26	int
223	submissionId	9	int
223	originalFileName	Risks and challenges for freedom of expr.pdf	string
223	username	dbarnes	string
224	fileStage	19	int
224	submissionFileId	47	int
224	fileId	26	int
224	submissionId	9	int
224	username	dbarnes	string
224	name	Risks and challenges for freedom of expr.pdf	string
225	fileStage	19	int
225	sourceSubmissionFileId	44	int
225	submissionFileId	48	int
225	fileId	24	int
225	submissionId	9	int
225	originalFileName	The internet in LAC will remain free, pu.pdf	string
225	username	dbarnes	string
226	fileStage	19	int
226	submissionFileId	48	int
226	fileId	24	int
226	submissionId	9	int
226	username	dbarnes	string
226	name	The internet in LAC will remain free, pu.pdf	string
227	fileStage	19	int
227	sourceSubmissionFileId	45	int
227	submissionFileId	49	int
227	fileId	25	int
227	submissionId	9	int
227	originalFileName	Free Internet?.pdf	string
227	username	dbarnes	string
228	fileStage	19	int
228	submissionFileId	49	int
228	fileId	25	int
228	submissionId	9	int
228	username	dbarnes	string
228	name	Free Internet?.pdf	string
229	fileStage	19	int
229	sourceSubmissionFileId	43	int
229	submissionFileId	50	int
229	fileId	23	int
229	submissionId	9	int
229	originalFileName	Imagining the Internet: Open, closed or .pdf	string
229	username	dbarnes	string
230	fileStage	19	int
230	submissionFileId	50	int
230	fileId	23	int
230	submissionId	9	int
230	username	dbarnes	string
230	name	Imagining the Internet: Open, closed or .pdf	string
231	fileStage	19	int
231	sourceSubmissionFileId	42	int
231	submissionFileId	51	int
231	fileId	22	int
231	submissionId	9	int
231	originalFileName	Internet, openness and the future of the.pdf	string
231	username	dbarnes	string
232	fileStage	19	int
232	submissionFileId	51	int
232	fileId	22	int
232	submissionId	9	int
232	username	dbarnes	string
232	name	Internet, openness and the future of the.pdf	string
235	fileStage	2	int
235	sourceSubmissionFileId	\N	string
235	submissionFileId	52	int
235	fileId	27	int
235	submissionId	10	int
235	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
235	username	jbrower	string
236	fileStage	2	int
236	submissionFileId	52	int
236	fileId	27	int
236	submissionId	10	int
236	username	jbrower	string
236	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
237	fileStage	2	int
237	sourceSubmissionFileId	\N	string
237	submissionFileId	52	int
237	fileId	27	int
237	submissionId	10	int
237	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
237	username	jbrower	string
238	fileStage	2	int
238	sourceSubmissionFileId	\N	string
238	submissionFileId	52	int
238	fileId	27	int
238	submissionId	10	int
238	username	jbrower	string
238	originalFileName	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
238	name	Lost Tracks: Buffalo National Park, 1909-1939.pdf	string
243	fileStage	2	int
243	sourceSubmissionFileId	\N	string
243	submissionFileId	53	int
243	fileId	28	int
243	submissionId	11	int
243	originalFileName	Dreamwork.pdf	string
243	username	jlockehart	string
244	fileStage	2	int
244	submissionFileId	53	int
244	fileId	28	int
244	submissionId	11	int
244	username	jlockehart	string
244	name	Dreamwork.pdf	string
245	fileStage	2	int
245	sourceSubmissionFileId	\N	string
245	submissionFileId	53	int
245	fileId	28	int
245	submissionId	11	int
245	originalFileName	Dreamwork.pdf	string
245	username	jlockehart	string
246	fileStage	2	int
246	sourceSubmissionFileId	\N	string
246	submissionFileId	53	int
246	fileId	28	int
246	submissionId	11	int
246	username	jlockehart	string
246	originalFileName	Dreamwork.pdf	string
246	name	Dreamwork.pdf	string
249	editorId	3	int
249	editorName	Daniel Barnes	string
249	submissionId	11	int
249	decision	1	int
250	fileStage	19	int
250	sourceSubmissionFileId	53	int
250	submissionFileId	54	int
250	fileId	28	int
250	submissionId	11	int
250	originalFileName	Dreamwork.pdf	string
250	username	dbarnes	string
251	fileStage	19	int
251	submissionFileId	54	int
251	fileId	28	int
251	submissionId	11	int
251	username	dbarnes	string
251	name	Dreamwork.pdf	string
252	reviewAssignmentId	9	int
252	reviewerName	Aisla McCrae	string
252	submissionId	11	int
252	stageId	2	int
252	round	1	int
253	editorId	3	int
253	editorName	Daniel Barnes	string
253	submissionId	11	int
253	decision	3	int
254	reviewAssignmentId	10	int
254	reviewerName	Adela Gallego	string
254	submissionId	11	int
254	stageId	3	int
254	round	1	int
255	reviewAssignmentId	11	int
255	reviewerName	Gonzalo Favio	string
255	submissionId	11	int
255	stageId	3	int
255	round	1	int
256	reviewAssignmentId	10	int
256	reviewerName	Adela Gallego	string
256	submissionId	11	int
256	round	1	int
257	reviewAssignmentId	10	int
257	reviewerName	Adela Gallego	string
257	submissionId	11	int
257	round	1	int
258	reviewAssignmentId	11	int
258	reviewerName	Gonzalo Favio	string
258	submissionId	11	int
258	round	1	int
259	reviewAssignmentId	11	int
259	reviewerName	Gonzalo Favio	string
259	submissionId	11	int
259	round	1	int
260	editorId	3	int
260	editorName	Daniel Barnes	string
260	submissionId	11	int
260	decision	2	int
261	recipientCount	2	int
261	subject	Thank you for your review	string
264	fileStage	2	int
264	sourceSubmissionFileId	\N	string
264	submissionFileId	55	int
264	fileId	29	int
264	submissionId	12	int
264	originalFileName	Catalyzing Access through Social and Tec.pdf	string
264	username	lelder	string
265	fileStage	2	int
265	submissionFileId	55	int
265	fileId	29	int
265	submissionId	12	int
265	username	lelder	string
265	name	Catalyzing Access through Social and Tec.pdf	string
266	fileStage	2	int
266	sourceSubmissionFileId	\N	string
266	submissionFileId	55	int
266	fileId	29	int
266	submissionId	12	int
266	originalFileName	Catalyzing Access through Social and Tec.pdf	string
266	username	lelder	string
267	fileStage	2	int
267	sourceSubmissionFileId	\N	string
267	submissionFileId	55	int
267	fileId	29	int
267	submissionId	12	int
267	username	lelder	string
267	originalFileName	Catalyzing Access through Social and Tec.pdf	string
267	name	Catalyzing Access through Social and Tec.pdf	string
268	fileStage	2	int
268	sourceSubmissionFileId	\N	string
268	submissionFileId	56	int
268	fileId	30	int
268	submissionId	12	int
268	originalFileName	Catalyzing Access via Telecommunications.pdf	string
268	username	lelder	string
269	fileStage	2	int
269	submissionFileId	56	int
269	fileId	30	int
269	submissionId	12	int
269	username	lelder	string
269	name	Catalyzing Access via Telecommunications.pdf	string
270	fileStage	2	int
270	sourceSubmissionFileId	\N	string
270	submissionFileId	56	int
270	fileId	30	int
270	submissionId	12	int
270	originalFileName	Catalyzing Access via Telecommunications.pdf	string
270	username	lelder	string
271	fileStage	2	int
271	sourceSubmissionFileId	\N	string
271	submissionFileId	56	int
271	fileId	30	int
271	submissionId	12	int
271	username	lelder	string
271	originalFileName	Catalyzing Access via Telecommunications.pdf	string
271	name	Catalyzing Access via Telecommunications.pdf	string
272	fileStage	2	int
272	sourceSubmissionFileId	\N	string
272	submissionFileId	57	int
272	fileId	31	int
272	submissionId	12	int
272	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
272	username	lelder	string
273	fileStage	2	int
273	submissionFileId	57	int
273	fileId	31	int
273	submissionId	12	int
273	username	lelder	string
273	name	Access to Knowledge as a New Paradigm fo.pdf	string
274	fileStage	2	int
274	sourceSubmissionFileId	\N	string
274	submissionFileId	57	int
274	fileId	31	int
274	submissionId	12	int
274	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
274	username	lelder	string
275	fileStage	2	int
275	sourceSubmissionFileId	\N	string
275	submissionFileId	57	int
275	fileId	31	int
275	submissionId	12	int
275	username	lelder	string
275	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
275	name	Access to Knowledge as a New Paradigm fo.pdf	string
278	editorId	3	int
278	editorName	Daniel Barnes	string
278	submissionId	12	int
278	decision	1	int
279	fileStage	19	int
279	sourceSubmissionFileId	57	int
279	submissionFileId	58	int
279	fileId	31	int
279	submissionId	12	int
279	originalFileName	Access to Knowledge as a New Paradigm fo.pdf	string
279	username	dbarnes	string
280	fileStage	19	int
280	submissionFileId	58	int
280	fileId	31	int
280	submissionId	12	int
280	username	dbarnes	string
280	name	Access to Knowledge as a New Paradigm fo.pdf	string
281	fileStage	19	int
281	sourceSubmissionFileId	56	int
281	submissionFileId	59	int
281	fileId	30	int
281	submissionId	12	int
281	originalFileName	Catalyzing Access via Telecommunications.pdf	string
281	username	dbarnes	string
282	fileStage	19	int
282	submissionFileId	59	int
282	fileId	30	int
282	submissionId	12	int
282	username	dbarnes	string
282	name	Catalyzing Access via Telecommunications.pdf	string
283	fileStage	19	int
283	sourceSubmissionFileId	55	int
283	submissionFileId	60	int
283	fileId	29	int
283	submissionId	12	int
283	originalFileName	Catalyzing Access through Social and Tec.pdf	string
283	username	dbarnes	string
284	fileStage	19	int
284	submissionFileId	60	int
284	fileId	29	int
284	submissionId	12	int
284	username	dbarnes	string
284	name	Catalyzing Access through Social and Tec.pdf	string
285	reviewAssignmentId	12	int
285	reviewerName	Julie Janssen	string
285	submissionId	12	int
285	stageId	2	int
285	round	1	int
286	reviewAssignmentId	13	int
286	reviewerName	Paul Hudson	string
286	submissionId	12	int
286	stageId	2	int
286	round	1	int
287	reviewAssignmentId	14	int
287	reviewerName	Aisla McCrae	string
287	submissionId	12	int
287	stageId	2	int
287	round	1	int
288	reviewAssignmentId	13	int
288	reviewerName	Paul Hudson	string
288	submissionId	12	int
288	round	1	int
289	reviewAssignmentId	13	int
289	reviewerName	Paul Hudson	string
289	submissionId	12	int
289	round	1	int
292	fileStage	2	int
292	sourceSubmissionFileId	\N	string
292	submissionFileId	61	int
292	fileId	32	int
292	submissionId	13	int
292	originalFileName	Current State of Mobile Learning.pdf	string
292	username	mally	string
293	fileStage	2	int
293	submissionFileId	61	int
293	fileId	32	int
293	submissionId	13	int
293	username	mally	string
293	name	Current State of Mobile Learning.pdf	string
294	fileStage	2	int
294	sourceSubmissionFileId	\N	string
294	submissionFileId	61	int
294	fileId	32	int
294	submissionId	13	int
294	originalFileName	Current State of Mobile Learning.pdf	string
294	username	mally	string
295	fileStage	2	int
295	sourceSubmissionFileId	\N	string
295	submissionFileId	61	int
295	fileId	32	int
295	submissionId	13	int
295	username	mally	string
295	originalFileName	Current State of Mobile Learning.pdf	string
295	name	Current State of Mobile Learning.pdf	string
296	fileStage	2	int
296	sourceSubmissionFileId	\N	string
296	submissionFileId	62	int
296	fileId	33	int
296	submissionId	13	int
296	originalFileName	A Model for Framing Mobile Learning.pdf	string
296	username	mally	string
297	fileStage	2	int
297	submissionFileId	62	int
297	fileId	33	int
297	submissionId	13	int
297	username	mally	string
297	name	A Model for Framing Mobile Learning.pdf	string
298	fileStage	2	int
298	sourceSubmissionFileId	\N	string
298	submissionFileId	62	int
298	fileId	33	int
298	submissionId	13	int
298	originalFileName	A Model for Framing Mobile Learning.pdf	string
298	username	mally	string
299	fileStage	2	int
299	sourceSubmissionFileId	\N	string
299	submissionFileId	62	int
299	fileId	33	int
299	submissionId	13	int
299	username	mally	string
299	originalFileName	A Model for Framing Mobile Learning.pdf	string
299	name	A Model for Framing Mobile Learning.pdf	string
300	fileStage	2	int
300	sourceSubmissionFileId	\N	string
300	submissionFileId	63	int
300	fileId	34	int
300	submissionId	13	int
300	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
300	username	mally	string
301	fileStage	2	int
301	submissionFileId	63	int
301	fileId	34	int
301	submissionId	13	int
301	username	mally	string
301	name	Mobile Distance Learning with PDAs: Deve.pdf	string
302	fileStage	2	int
302	sourceSubmissionFileId	\N	string
302	submissionFileId	63	int
302	fileId	34	int
302	submissionId	13	int
302	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
302	username	mally	string
303	fileStage	2	int
303	sourceSubmissionFileId	\N	string
303	submissionFileId	63	int
303	fileId	34	int
303	submissionId	13	int
303	username	mally	string
303	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
303	name	Mobile Distance Learning with PDAs: Deve.pdf	string
306	editorId	3	int
306	editorName	Daniel Barnes	string
306	submissionId	13	int
306	decision	1	int
307	fileStage	19	int
307	sourceSubmissionFileId	63	int
307	submissionFileId	64	int
307	fileId	34	int
307	submissionId	13	int
307	originalFileName	Mobile Distance Learning with PDAs: Deve.pdf	string
307	username	dbarnes	string
308	fileStage	19	int
308	submissionFileId	64	int
308	fileId	34	int
308	submissionId	13	int
308	username	dbarnes	string
308	name	Mobile Distance Learning with PDAs: Deve.pdf	string
309	fileStage	19	int
309	sourceSubmissionFileId	62	int
309	submissionFileId	65	int
309	fileId	33	int
309	submissionId	13	int
309	originalFileName	A Model for Framing Mobile Learning.pdf	string
309	username	dbarnes	string
310	fileStage	19	int
310	submissionFileId	65	int
310	fileId	33	int
310	submissionId	13	int
310	username	dbarnes	string
310	name	A Model for Framing Mobile Learning.pdf	string
311	fileStage	19	int
311	sourceSubmissionFileId	61	int
311	submissionFileId	66	int
311	fileId	32	int
311	submissionId	13	int
311	originalFileName	Current State of Mobile Learning.pdf	string
311	username	dbarnes	string
312	fileStage	19	int
312	submissionFileId	66	int
312	fileId	32	int
312	submissionId	13	int
312	username	dbarnes	string
312	name	Current State of Mobile Learning.pdf	string
313	reviewAssignmentId	15	int
313	reviewerName	Paul Hudson	string
313	submissionId	13	int
313	stageId	2	int
313	round	1	int
314	editorId	3	int
314	editorName	Daniel Barnes	string
314	submissionId	13	int
314	decision	3	int
315	reviewAssignmentId	16	int
315	reviewerName	Adela Gallego	string
315	submissionId	13	int
315	stageId	3	int
315	round	1	int
316	reviewAssignmentId	17	int
316	reviewerName	Al Zacharia	string
316	submissionId	13	int
316	stageId	3	int
316	round	1	int
317	reviewAssignmentId	18	int
317	reviewerName	Gonzalo Favio	string
317	submissionId	13	int
317	stageId	3	int
317	round	1	int
318	reviewAssignmentId	16	int
318	reviewerName	Adela Gallego	string
318	submissionId	13	int
318	round	1	int
319	reviewAssignmentId	16	int
319	reviewerName	Adela Gallego	string
319	submissionId	13	int
319	round	1	int
320	reviewAssignmentId	18	int
320	reviewerName	Gonzalo Favio	string
320	submissionId	13	int
320	round	1	int
321	reviewAssignmentId	18	int
321	reviewerName	Gonzalo Favio	string
321	submissionId	13	int
321	round	1	int
322	editorId	3	int
322	editorName	Daniel Barnes	string
322	submissionId	13	int
322	decision	2	int
323	recipientCount	2	int
323	subject	Thank you for your review	string
326	fileStage	2	int
326	sourceSubmissionFileId	\N	string
326	submissionFileId	67	int
326	fileId	35	int
326	submissionId	14	int
326	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
326	username	mdawson	string
327	fileStage	2	int
327	submissionFileId	67	int
327	fileId	35	int
327	submissionId	14	int
327	username	mdawson	string
327	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
328	fileStage	2	int
328	sourceSubmissionFileId	\N	string
328	submissionFileId	67	int
328	fileId	35	int
328	submissionId	14	int
328	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
328	username	mdawson	string
329	fileStage	2	int
329	sourceSubmissionFileId	\N	string
329	submissionFileId	67	int
329	fileId	35	int
329	submissionId	14	int
329	username	mdawson	string
329	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
329	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
330	fileStage	2	int
330	sourceSubmissionFileId	\N	string
330	submissionFileId	68	int
330	fileId	36	int
330	submissionId	14	int
330	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
330	username	mdawson	string
331	fileStage	2	int
331	submissionFileId	68	int
331	fileId	36	int
331	submissionId	14	int
331	username	mdawson	string
331	name	Chapter 2: Classical Music and the Class.pdf	string
332	fileStage	2	int
332	sourceSubmissionFileId	\N	string
332	submissionFileId	68	int
332	fileId	36	int
332	submissionId	14	int
332	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
332	username	mdawson	string
333	fileStage	2	int
333	sourceSubmissionFileId	\N	string
333	submissionFileId	68	int
333	fileId	36	int
333	submissionId	14	int
333	username	mdawson	string
333	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
333	name	Chapter 2: Classical Music and the Class.pdf	string
334	fileStage	2	int
334	sourceSubmissionFileId	\N	string
334	submissionFileId	69	int
334	fileId	37	int
334	submissionId	14	int
334	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
334	username	mdawson	string
335	fileStage	2	int
335	submissionFileId	69	int
335	fileId	37	int
335	submissionId	14	int
335	username	mdawson	string
335	name	Chapter 3: Situated Cognition and Bricol.pdf	string
336	fileStage	2	int
336	sourceSubmissionFileId	\N	string
336	submissionFileId	69	int
336	fileId	37	int
336	submissionId	14	int
336	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
336	username	mdawson	string
337	fileStage	2	int
337	sourceSubmissionFileId	\N	string
337	submissionFileId	69	int
337	fileId	37	int
337	submissionId	14	int
337	username	mdawson	string
337	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
337	name	Chapter 3: Situated Cognition and Bricol.pdf	string
338	fileStage	2	int
338	sourceSubmissionFileId	\N	string
338	submissionFileId	70	int
338	fileId	38	int
338	submissionId	14	int
338	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
338	username	mdawson	string
339	fileStage	2	int
339	submissionFileId	70	int
339	fileId	38	int
339	submissionId	14	int
339	username	mdawson	string
339	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
340	fileStage	2	int
340	sourceSubmissionFileId	\N	string
340	submissionFileId	70	int
340	fileId	38	int
340	submissionId	14	int
340	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
340	username	mdawson	string
341	fileStage	2	int
341	sourceSubmissionFileId	\N	string
341	submissionFileId	70	int
341	fileId	38	int
341	submissionId	14	int
341	username	mdawson	string
341	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
341	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
342	fileStage	2	int
342	sourceSubmissionFileId	\N	string
342	submissionFileId	71	int
342	fileId	39	int
342	submissionId	14	int
342	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
342	username	mdawson	string
343	fileStage	2	int
343	submissionFileId	71	int
343	fileId	39	int
343	submissionId	14	int
343	username	mdawson	string
343	name	Segmentation of Vascular Ultrasound Imag.pdf	string
344	fileStage	2	int
344	sourceSubmissionFileId	\N	string
344	submissionFileId	71	int
344	fileId	39	int
344	submissionId	14	int
344	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
344	username	mdawson	string
345	fileStage	2	int
345	sourceSubmissionFileId	\N	string
345	submissionFileId	71	int
345	fileId	39	int
345	submissionId	14	int
345	username	mdawson	string
345	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
345	name	Segmentation of Vascular Ultrasound Imag.pdf	string
346	fileStage	2	int
346	sourceSubmissionFileId	\N	string
346	submissionFileId	72	int
346	fileId	40	int
346	submissionId	14	int
346	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
346	username	mdawson	string
347	fileStage	2	int
347	submissionFileId	72	int
347	fileId	40	int
347	submissionId	14	int
347	username	mdawson	string
347	name	The Canadian Nutrient File: Nutrient Val.pdf	string
348	fileStage	2	int
348	sourceSubmissionFileId	\N	string
348	submissionFileId	72	int
348	fileId	40	int
348	submissionId	14	int
348	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
348	username	mdawson	string
349	fileStage	2	int
349	sourceSubmissionFileId	\N	string
349	submissionFileId	72	int
349	fileId	40	int
349	submissionId	14	int
349	username	mdawson	string
349	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
349	name	The Canadian Nutrient File: Nutrient Val.pdf	string
352	editorId	3	int
352	editorName	Daniel Barnes	string
352	submissionId	14	int
352	decision	1	int
353	fileStage	19	int
353	sourceSubmissionFileId	72	int
353	submissionFileId	73	int
353	fileId	40	int
353	submissionId	14	int
353	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
353	username	dbarnes	string
354	fileStage	19	int
354	submissionFileId	73	int
354	fileId	40	int
354	submissionId	14	int
354	username	dbarnes	string
354	name	The Canadian Nutrient File: Nutrient Val.pdf	string
355	fileStage	19	int
355	sourceSubmissionFileId	70	int
355	submissionFileId	74	int
355	fileId	38	int
355	submissionId	14	int
355	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
355	username	dbarnes	string
356	fileStage	19	int
356	submissionFileId	74	int
356	fileId	38	int
356	submissionId	14	int
356	username	dbarnes	string
356	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
357	fileStage	19	int
357	sourceSubmissionFileId	71	int
357	submissionFileId	75	int
357	fileId	39	int
357	submissionId	14	int
357	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
357	username	dbarnes	string
358	fileStage	19	int
358	submissionFileId	75	int
358	fileId	39	int
358	submissionId	14	int
358	username	dbarnes	string
382	sourceSubmissionFileId	68	int
358	name	Segmentation of Vascular Ultrasound Imag.pdf	string
359	fileStage	19	int
359	sourceSubmissionFileId	69	int
359	submissionFileId	76	int
359	fileId	37	int
359	submissionId	14	int
359	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
359	username	dbarnes	string
360	fileStage	19	int
360	submissionFileId	76	int
360	fileId	37	int
360	submissionId	14	int
360	username	dbarnes	string
360	name	Chapter 3: Situated Cognition and Bricol.pdf	string
361	fileStage	19	int
361	sourceSubmissionFileId	68	int
361	submissionFileId	77	int
361	fileId	36	int
361	submissionId	14	int
361	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
361	username	dbarnes	string
362	fileStage	19	int
362	submissionFileId	77	int
362	fileId	36	int
362	submissionId	14	int
362	username	dbarnes	string
362	name	Chapter 2: Classical Music and the Class.pdf	string
363	fileStage	19	int
363	sourceSubmissionFileId	67	int
363	submissionFileId	78	int
363	fileId	35	int
363	submissionId	14	int
363	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
363	username	dbarnes	string
364	fileStage	19	int
364	submissionFileId	78	int
364	fileId	35	int
364	submissionId	14	int
364	username	dbarnes	string
364	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
365	reviewAssignmentId	19	int
365	reviewerName	Julie Janssen	string
365	submissionId	14	int
365	stageId	2	int
365	round	1	int
366	editorId	3	int
366	editorName	Daniel Barnes	string
366	submissionId	14	int
366	decision	3	int
367	reviewAssignmentId	20	int
367	reviewerName	Al Zacharia	string
367	submissionId	14	int
367	stageId	3	int
367	round	1	int
368	editorId	3	int
368	editorName	Daniel Barnes	string
368	submissionId	14	int
368	decision	2	int
369	name	Maria Fritz	string
369	username	mfritz	string
369	userGroupName	Copyeditor	string
370	editorId	3	int
370	editorName	Daniel Barnes	string
370	submissionId	14	int
370	decision	7	int
371	name	Graham Cox	string
371	username	gcox	string
371	userGroupName	Layout Editor	string
372	name	Sabine Kumar	string
372	username	skumar	string
372	userGroupName	Proofreader	string
373	formatName	PDF	string
374	fileStage	10	int
374	sourceSubmissionFileId	72	int
374	submissionFileId	79	int
374	fileId	40	int
374	submissionId	14	int
374	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
374	username	dbarnes	string
375	fileStage	10	int
375	submissionFileId	79	int
375	fileId	40	int
375	submissionId	14	int
375	username	dbarnes	string
375	name	The Canadian Nutrient File: Nutrient Val.pdf	string
376	fileStage	10	int
376	sourceSubmissionFileId	71	int
376	submissionFileId	80	int
376	fileId	39	int
376	submissionId	14	int
376	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
376	username	dbarnes	string
377	fileStage	10	int
377	submissionFileId	80	int
377	fileId	39	int
377	submissionId	14	int
377	username	dbarnes	string
377	name	Segmentation of Vascular Ultrasound Imag.pdf	string
378	fileStage	10	int
378	sourceSubmissionFileId	70	int
378	submissionFileId	81	int
378	fileId	38	int
378	submissionId	14	int
378	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
378	username	dbarnes	string
379	fileStage	10	int
379	submissionFileId	81	int
379	fileId	38	int
379	submissionId	14	int
379	username	dbarnes	string
379	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
380	fileStage	10	int
380	sourceSubmissionFileId	69	int
380	submissionFileId	82	int
380	fileId	37	int
380	submissionId	14	int
380	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
380	username	dbarnes	string
381	fileStage	10	int
381	submissionFileId	82	int
381	fileId	37	int
381	submissionId	14	int
381	username	dbarnes	string
381	name	Chapter 3: Situated Cognition and Bricol.pdf	string
382	fileStage	10	int
382	submissionFileId	83	int
382	fileId	36	int
382	submissionId	14	int
382	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
382	username	dbarnes	string
383	fileStage	10	int
383	submissionFileId	83	int
383	fileId	36	int
383	submissionId	14	int
383	username	dbarnes	string
383	name	Chapter 2: Classical Music and the Class.pdf	string
384	fileStage	10	int
384	sourceSubmissionFileId	67	int
384	submissionFileId	84	int
384	fileId	35	int
384	submissionId	14	int
384	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
384	username	dbarnes	string
385	fileStage	10	int
385	submissionFileId	84	int
385	fileId	35	int
385	submissionId	14	int
385	username	dbarnes	string
385	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
386	publicationFormatName	PDF	string
387	publicationFormatName	PDF	string
388	fileStage	10	int
388	sourceSubmissionFileId	67	int
388	submissionFileId	84	int
388	fileId	35	int
388	submissionId	14	int
388	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
388	username	dbarnes	string
389	fileStage	10	int
389	sourceSubmissionFileId	67	int
389	submissionFileId	84	int
389	fileId	35	int
389	submissionId	14	int
389	username	dbarnes	string
389	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
389	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
390	file	Chapter 1: Mind Control—Internal or Exte.pdf	string
390	name	Daniel Barnes	string
390	username	dbarnes	string
391	fileStage	10	int
391	sourceSubmissionFileId	67	int
391	submissionFileId	84	int
391	fileId	35	int
391	submissionId	14	int
391	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
391	username	dbarnes	string
392	fileStage	10	int
392	sourceSubmissionFileId	67	int
392	submissionFileId	84	int
392	fileId	35	int
392	submissionId	14	int
392	username	dbarnes	string
392	originalFileName	Chapter 1: Mind Control—Internal or Exte.pdf	string
392	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
393	fileStage	10	int
393	sourceSubmissionFileId	68	int
393	submissionFileId	83	int
393	fileId	36	int
393	submissionId	14	int
393	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
393	username	dbarnes	string
394	fileStage	10	int
394	sourceSubmissionFileId	68	int
394	submissionFileId	83	int
394	fileId	36	int
394	submissionId	14	int
394	username	dbarnes	string
394	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
394	name	Chapter 2: Classical Music and the Class.pdf	string
395	file	Chapter 2: Classical Music and the Class.pdf	string
395	name	Daniel Barnes	string
395	username	dbarnes	string
396	fileStage	10	int
396	sourceSubmissionFileId	68	int
396	submissionFileId	83	int
396	fileId	36	int
396	submissionId	14	int
396	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
396	username	dbarnes	string
397	fileStage	10	int
397	sourceSubmissionFileId	68	int
397	submissionFileId	83	int
397	fileId	36	int
397	submissionId	14	int
397	username	dbarnes	string
397	originalFileName	Chapter 2: Classical Music and the Class.pdf	string
397	name	Chapter 2: Classical Music and the Class.pdf	string
398	fileStage	10	int
398	sourceSubmissionFileId	69	int
398	submissionFileId	82	int
398	fileId	37	int
398	submissionId	14	int
398	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
398	username	dbarnes	string
399	fileStage	10	int
399	sourceSubmissionFileId	69	int
399	submissionFileId	82	int
399	fileId	37	int
399	submissionId	14	int
399	username	dbarnes	string
399	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
399	name	Chapter 3: Situated Cognition and Bricol.pdf	string
400	file	Chapter 3: Situated Cognition and Bricol.pdf	string
400	name	Daniel Barnes	string
400	username	dbarnes	string
401	fileStage	10	int
401	sourceSubmissionFileId	69	int
401	submissionFileId	82	int
401	fileId	37	int
401	submissionId	14	int
401	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
401	username	dbarnes	string
402	fileStage	10	int
402	sourceSubmissionFileId	69	int
402	submissionFileId	82	int
402	fileId	37	int
402	submissionId	14	int
402	username	dbarnes	string
402	originalFileName	Chapter 3: Situated Cognition and Bricol.pdf	string
402	name	Chapter 3: Situated Cognition and Bricol.pdf	string
403	fileStage	10	int
403	sourceSubmissionFileId	70	int
403	submissionFileId	81	int
403	fileId	38	int
403	submissionId	14	int
403	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
403	username	dbarnes	string
404	fileStage	10	int
404	sourceSubmissionFileId	70	int
404	submissionFileId	81	int
404	fileId	38	int
404	submissionId	14	int
404	username	dbarnes	string
404	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
404	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
405	file	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
405	name	Daniel Barnes	string
405	username	dbarnes	string
406	fileStage	10	int
406	sourceSubmissionFileId	70	int
406	submissionFileId	81	int
406	fileId	38	int
406	submissionId	14	int
406	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
406	username	dbarnes	string
407	fileStage	10	int
407	sourceSubmissionFileId	70	int
407	submissionFileId	81	int
407	fileId	38	int
407	submissionId	14	int
407	username	dbarnes	string
407	originalFileName	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
407	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
408	fileStage	10	int
408	sourceSubmissionFileId	71	int
408	submissionFileId	80	int
408	fileId	39	int
408	submissionId	14	int
408	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
408	username	dbarnes	string
409	fileStage	10	int
409	sourceSubmissionFileId	71	int
409	submissionFileId	80	int
409	fileId	39	int
409	submissionId	14	int
409	username	dbarnes	string
409	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
409	name	Segmentation of Vascular Ultrasound Imag.pdf	string
410	file	Segmentation of Vascular Ultrasound Imag.pdf	string
410	name	Daniel Barnes	string
410	username	dbarnes	string
411	fileStage	10	int
411	sourceSubmissionFileId	71	int
411	submissionFileId	80	int
411	fileId	39	int
411	submissionId	14	int
411	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
411	username	dbarnes	string
412	fileStage	10	int
412	sourceSubmissionFileId	71	int
412	submissionFileId	80	int
412	fileId	39	int
412	submissionId	14	int
412	username	dbarnes	string
412	originalFileName	Segmentation of Vascular Ultrasound Imag.pdf	string
412	name	Segmentation of Vascular Ultrasound Imag.pdf	string
413	fileStage	10	int
413	sourceSubmissionFileId	72	int
413	submissionFileId	79	int
413	fileId	40	int
413	submissionId	14	int
413	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
413	username	dbarnes	string
414	fileStage	10	int
414	sourceSubmissionFileId	72	int
414	submissionFileId	79	int
414	fileId	40	int
414	submissionId	14	int
414	username	dbarnes	string
414	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
414	name	The Canadian Nutrient File: Nutrient Val.pdf	string
415	file	The Canadian Nutrient File: Nutrient Val.pdf	string
415	name	Daniel Barnes	string
415	username	dbarnes	string
416	fileStage	10	int
416	sourceSubmissionFileId	72	int
416	submissionFileId	79	int
416	fileId	40	int
416	submissionId	14	int
416	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
416	username	dbarnes	string
417	fileStage	10	int
417	sourceSubmissionFileId	72	int
417	submissionFileId	79	int
417	fileId	40	int
417	submissionId	14	int
417	username	dbarnes	string
417	originalFileName	The Canadian Nutrient File: Nutrient Val.pdf	string
417	name	The Canadian Nutrient File: Nutrient Val.pdf	string
421	fileStage	2	int
421	sourceSubmissionFileId	\N	string
421	submissionFileId	85	int
421	fileId	41	int
421	submissionId	15	int
421	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
421	username	mforan	string
422	fileStage	2	int
422	submissionFileId	85	int
422	fileId	41	int
422	submissionId	15	int
422	username	mforan	string
422	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
423	fileStage	2	int
423	sourceSubmissionFileId	\N	string
423	submissionFileId	85	int
423	fileId	41	int
423	submissionId	15	int
423	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
423	username	mforan	string
424	fileStage	2	int
424	sourceSubmissionFileId	\N	string
424	submissionFileId	85	int
424	fileId	41	int
424	submissionId	15	int
424	username	mforan	string
424	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
424	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
427	editorId	3	int
427	editorName	Daniel Barnes	string
427	submissionId	15	int
427	decision	18	int
428	fileStage	4	int
428	sourceSubmissionFileId	85	int
428	submissionFileId	86	int
428	fileId	41	int
428	submissionId	15	int
428	originalFileName	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
428	username	dbarnes	string
429	fileStage	4	int
429	submissionFileId	86	int
429	fileId	41	int
429	submissionId	15	int
429	username	dbarnes	string
429	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
432	fileStage	2	int
432	sourceSubmissionFileId	\N	string
432	submissionFileId	87	int
432	fileId	42	int
432	submissionId	16	int
432	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
432	username	mpower	string
433	fileStage	2	int
433	submissionFileId	87	int
433	fileId	42	int
433	submissionId	16	int
433	username	mpower	string
433	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
434	fileStage	2	int
434	sourceSubmissionFileId	\N	string
434	submissionFileId	87	int
434	fileId	42	int
434	submissionId	16	int
434	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
434	username	mpower	string
435	fileStage	2	int
435	sourceSubmissionFileId	\N	string
435	submissionFileId	87	int
435	fileId	42	int
435	submissionId	16	int
435	username	mpower	string
435	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
435	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
438	editorId	3	int
438	editorName	Daniel Barnes	string
438	submissionId	16	int
438	decision	18	int
439	fileStage	4	int
439	sourceSubmissionFileId	87	int
439	submissionFileId	88	int
439	fileId	42	int
439	submissionId	16	int
439	originalFileName	A Designer's Log: Case Studies in Instructional Design.pdf	string
439	username	dbarnes	string
440	fileStage	4	int
440	submissionFileId	88	int
440	fileId	42	int
440	submissionId	16	int
440	username	dbarnes	string
440	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
441	reviewAssignmentId	21	int
441	reviewerName	Adela Gallego	string
441	submissionId	16	int
441	stageId	3	int
441	round	1	int
442	reviewAssignmentId	22	int
442	reviewerName	Al Zacharia	string
442	submissionId	16	int
442	stageId	3	int
442	round	1	int
443	reviewAssignmentId	23	int
443	reviewerName	Gonzalo Favio	string
443	submissionId	16	int
443	stageId	3	int
443	round	1	int
444	reviewAssignmentId	21	int
444	reviewerName	Adela Gallego	string
444	submissionId	16	int
444	round	1	int
445	reviewAssignmentId	21	int
445	reviewerName	Adela Gallego	string
445	submissionId	16	int
445	round	1	int
448	fileStage	2	int
448	sourceSubmissionFileId	\N	string
448	submissionFileId	89	int
448	fileId	43	int
448	submissionId	17	int
448	originalFileName	Preface.pdf	string
448	username	msmith	string
449	fileStage	2	int
449	submissionFileId	89	int
449	fileId	43	int
449	submissionId	17	int
449	username	msmith	string
449	name	Preface.pdf	string
450	fileStage	2	int
450	sourceSubmissionFileId	\N	string
450	submissionFileId	89	int
450	fileId	43	int
450	submissionId	17	int
450	originalFileName	Preface.pdf	string
450	username	msmith	string
451	fileStage	2	int
451	sourceSubmissionFileId	\N	string
451	submissionFileId	89	int
451	fileId	43	int
451	submissionId	17	int
451	username	msmith	string
451	originalFileName	Preface.pdf	string
451	name	Preface.pdf	string
452	fileStage	2	int
452	sourceSubmissionFileId	\N	string
452	submissionFileId	90	int
452	fileId	44	int
452	submissionId	17	int
452	originalFileName	Introduction.pdf	string
452	username	msmith	string
453	fileStage	2	int
453	submissionFileId	90	int
453	fileId	44	int
453	submissionId	17	int
453	username	msmith	string
453	name	Introduction.pdf	string
454	fileStage	2	int
454	sourceSubmissionFileId	\N	string
454	submissionFileId	90	int
454	fileId	44	int
454	submissionId	17	int
454	originalFileName	Introduction.pdf	string
454	username	msmith	string
455	fileStage	2	int
455	sourceSubmissionFileId	\N	string
455	submissionFileId	90	int
455	fileId	44	int
455	submissionId	17	int
455	username	msmith	string
455	originalFileName	Introduction.pdf	string
455	name	Introduction.pdf	string
456	fileStage	2	int
456	sourceSubmissionFileId	\N	string
456	submissionFileId	91	int
456	fileId	45	int
456	submissionId	17	int
456	originalFileName	The Emergence of Open Development in a N.pdf	string
456	username	msmith	string
457	fileStage	2	int
457	submissionFileId	91	int
457	fileId	45	int
457	submissionId	17	int
457	username	msmith	string
457	name	The Emergence of Open Development in a N.pdf	string
458	fileStage	2	int
458	sourceSubmissionFileId	\N	string
458	submissionFileId	91	int
458	fileId	45	int
458	submissionId	17	int
458	originalFileName	The Emergence of Open Development in a N.pdf	string
458	username	msmith	string
459	fileStage	2	int
459	sourceSubmissionFileId	\N	string
459	submissionFileId	91	int
459	fileId	45	int
459	submissionId	17	int
459	username	msmith	string
459	originalFileName	The Emergence of Open Development in a N.pdf	string
459	name	The Emergence of Open Development in a N.pdf	string
460	fileStage	2	int
460	sourceSubmissionFileId	\N	string
460	submissionFileId	92	int
460	fileId	46	int
460	submissionId	17	int
460	originalFileName	Enacting Openness in ICT4D Research.pdf	string
460	username	msmith	string
461	fileStage	2	int
461	submissionFileId	92	int
461	fileId	46	int
461	submissionId	17	int
461	username	msmith	string
461	name	Enacting Openness in ICT4D Research.pdf	string
462	fileStage	2	int
462	sourceSubmissionFileId	\N	string
462	submissionFileId	92	int
462	fileId	46	int
462	submissionId	17	int
462	originalFileName	Enacting Openness in ICT4D Research.pdf	string
462	username	msmith	string
463	fileStage	2	int
463	sourceSubmissionFileId	\N	string
463	submissionFileId	92	int
463	fileId	46	int
463	submissionId	17	int
463	username	msmith	string
463	originalFileName	Enacting Openness in ICT4D Research.pdf	string
463	name	Enacting Openness in ICT4D Research.pdf	string
464	fileStage	2	int
464	sourceSubmissionFileId	\N	string
464	submissionFileId	93	int
464	fileId	47	int
464	submissionId	17	int
464	originalFileName	Transparency and Development: Ethical Co.pdf	string
464	username	msmith	string
465	fileStage	2	int
465	submissionFileId	93	int
465	fileId	47	int
465	submissionId	17	int
465	username	msmith	string
465	name	Transparency and Development: Ethical Co.pdf	string
466	fileStage	2	int
466	sourceSubmissionFileId	\N	string
466	submissionFileId	93	int
466	fileId	47	int
466	submissionId	17	int
466	originalFileName	Transparency and Development: Ethical Co.pdf	string
466	username	msmith	string
467	fileStage	2	int
467	sourceSubmissionFileId	\N	string
467	submissionFileId	93	int
467	fileId	47	int
467	submissionId	17	int
467	username	msmith	string
467	originalFileName	Transparency and Development: Ethical Co.pdf	string
467	name	Transparency and Development: Ethical Co.pdf	string
468	fileStage	2	int
468	sourceSubmissionFileId	\N	string
468	submissionFileId	94	int
468	fileId	48	int
468	submissionId	17	int
468	originalFileName	Open Educational Resources: Opportunitie.pdf	string
468	username	msmith	string
469	fileStage	2	int
469	submissionFileId	94	int
469	fileId	48	int
469	submissionId	17	int
469	username	msmith	string
469	name	Open Educational Resources: Opportunitie.pdf	string
470	fileStage	2	int
470	sourceSubmissionFileId	\N	string
470	submissionFileId	94	int
470	fileId	48	int
470	submissionId	17	int
470	originalFileName	Open Educational Resources: Opportunitie.pdf	string
470	username	msmith	string
471	fileStage	2	int
471	sourceSubmissionFileId	\N	string
471	submissionFileId	94	int
471	fileId	48	int
471	submissionId	17	int
471	username	msmith	string
471	originalFileName	Open Educational Resources: Opportunitie.pdf	string
471	name	Open Educational Resources: Opportunitie.pdf	string
474	editorId	3	int
474	editorName	Daniel Barnes	string
474	submissionId	17	int
474	decision	1	int
475	fileStage	19	int
475	sourceSubmissionFileId	94	int
475	submissionFileId	95	int
475	fileId	48	int
475	submissionId	17	int
475	originalFileName	Open Educational Resources: Opportunitie.pdf	string
475	username	dbarnes	string
476	fileStage	19	int
476	submissionFileId	95	int
476	fileId	48	int
476	submissionId	17	int
476	username	dbarnes	string
476	name	Open Educational Resources: Opportunitie.pdf	string
477	fileStage	19	int
477	sourceSubmissionFileId	93	int
477	submissionFileId	96	int
477	fileId	47	int
477	submissionId	17	int
477	originalFileName	Transparency and Development: Ethical Co.pdf	string
477	username	dbarnes	string
478	fileStage	19	int
478	submissionFileId	96	int
478	fileId	47	int
478	submissionId	17	int
478	username	dbarnes	string
478	name	Transparency and Development: Ethical Co.pdf	string
479	fileStage	19	int
479	sourceSubmissionFileId	92	int
479	submissionFileId	97	int
479	fileId	46	int
479	submissionId	17	int
479	originalFileName	Enacting Openness in ICT4D Research.pdf	string
479	username	dbarnes	string
480	fileStage	19	int
480	submissionFileId	97	int
480	fileId	46	int
480	submissionId	17	int
480	username	dbarnes	string
480	name	Enacting Openness in ICT4D Research.pdf	string
481	fileStage	19	int
481	sourceSubmissionFileId	91	int
481	submissionFileId	98	int
481	fileId	45	int
481	submissionId	17	int
481	originalFileName	The Emergence of Open Development in a N.pdf	string
481	username	dbarnes	string
482	fileStage	19	int
482	submissionFileId	98	int
482	fileId	45	int
482	submissionId	17	int
482	username	dbarnes	string
482	name	The Emergence of Open Development in a N.pdf	string
483	fileStage	19	int
483	sourceSubmissionFileId	90	int
483	submissionFileId	99	int
483	fileId	44	int
483	submissionId	17	int
483	originalFileName	Introduction.pdf	string
483	username	dbarnes	string
484	fileStage	19	int
484	submissionFileId	99	int
484	fileId	44	int
484	submissionId	17	int
484	username	dbarnes	string
484	name	Introduction.pdf	string
485	fileStage	19	int
485	sourceSubmissionFileId	89	int
485	submissionFileId	100	int
485	fileId	43	int
485	submissionId	17	int
485	originalFileName	Preface.pdf	string
485	username	dbarnes	string
486	fileStage	19	int
486	submissionFileId	100	int
486	fileId	43	int
486	submissionId	17	int
486	username	dbarnes	string
486	name	Preface.pdf	string
487	reviewAssignmentId	24	int
487	reviewerName	Julie Janssen	string
487	submissionId	17	int
487	stageId	2	int
487	round	1	int
488	reviewAssignmentId	25	int
488	reviewerName	Paul Hudson	string
488	submissionId	17	int
488	stageId	2	int
488	round	1	int
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
1	presses/1/monographs/1/635d4f4428890.pdf	application/pdf
2	presses/1/monographs/2/635d4f840e400.pdf	application/pdf
3	presses/1/monographs/2/635d4f85af3db.pdf	application/pdf
4	presses/1/monographs/2/635d4f875c914.pdf	application/pdf
5	presses/1/monographs/2/635d4f8917a7c.pdf	application/pdf
6	presses/1/monographs/3/635d50027cc4e.pdf	application/pdf
7	presses/1/monographs/4/635d502993f9d.pdf	application/pdf
8	presses/1/monographs/4/635d502b42970.pdf	application/pdf
9	presses/1/monographs/4/635d502ce52cf.pdf	application/pdf
10	presses/1/monographs/4/635d502e93a55.pdf	application/pdf
11	presses/1/monographs/5/635d50cde20f2.pdf	application/pdf
12	presses/1/monographs/6/635d515f9ff21.pdf	application/pdf
13	presses/1/monographs/6/635d516151ca3.pdf	application/pdf
14	presses/1/monographs/6/635d5163024f7.pdf	application/pdf
15	presses/1/monographs/6/635d5164ad2b1.pdf	application/pdf
16	presses/1/monographs/7/635d51dd0cc77.pdf	application/pdf
17	presses/1/monographs/7/635d51dea76af.pdf	application/pdf
18	presses/1/monographs/7/635d51e05c101.pdf	application/pdf
19	presses/1/monographs/7/635d51e20879f.pdf	application/pdf
20	presses/1/monographs/7/635d51e3be142.pdf	application/pdf
21	presses/1/monographs/8/635d5269acd8c.pdf	application/pdf
22	presses/1/monographs/9/635d52792b283.pdf	application/pdf
23	presses/1/monographs/9/635d527acea70.pdf	application/pdf
24	presses/1/monographs/9/635d527c82226.pdf	application/pdf
25	presses/1/monographs/9/635d527e312f4.pdf	application/pdf
26	presses/1/monographs/9/635d528019087.pdf	application/pdf
27	presses/1/monographs/10/635d52e4b98d5.pdf	application/pdf
28	presses/1/monographs/11/635d531ee3bc2.pdf	application/pdf
29	presses/1/monographs/12/635d53969e600.pdf	application/pdf
30	presses/1/monographs/12/635d53984f838.pdf	application/pdf
31	presses/1/monographs/12/635d5399ef504.pdf	application/pdf
32	presses/1/monographs/13/635d542269106.pdf	application/pdf
33	presses/1/monographs/13/635d542417a35.pdf	application/pdf
34	presses/1/monographs/13/635d5425bd1e5.pdf	application/pdf
35	presses/1/monographs/14/635d54d1b09c4.pdf	application/pdf
36	presses/1/monographs/14/635d54d35abb0.pdf	application/pdf
37	presses/1/monographs/14/635d54d511629.pdf	application/pdf
38	presses/1/monographs/14/635d54d6b07e1.pdf	application/pdf
39	presses/1/monographs/14/635d54d874173.pdf	application/pdf
40	presses/1/monographs/14/635d54da89cc2.pdf	application/pdf
41	presses/1/monographs/15/635d55b90f045.pdf	application/pdf
42	presses/1/monographs/16/635d55e9ed851.pdf	application/pdf
43	presses/1/monographs/17/635d564753331.pdf	application/pdf
44	presses/1/monographs/17/635d5648ec4ea.pdf	application/pdf
45	presses/1/monographs/17/635d564a97a9b.pdf	application/pdf
46	presses/1/monographs/17/635d564c4def2.pdf	application/pdf
47	presses/1/monographs/17/635d564e35f3c.pdf	application/pdf
48	presses/1/monographs/17/635d564fe747a.pdf	application/pdf
\.


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 48, true);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	publicationFormat=>dc11	plugins.metadata.dc11.publicationFormatAdapter.displayName	plugins.metadata.dc11.publicationFormatAdapter.description	class::classes.publicationFormat.PublicationFormat	metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PUBLICATION_FORMAT)
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
14	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submissionFile.SubmissionFile[]
15	monograph=>onix30-xml	plugins.importexport.onix30.displayName	plugins.importexport.onix30.description	class::classes.submission.Submission	xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)
16	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
17	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication[]
18	chapter=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.monograph.Chapter[]	xml::schema(plugins/importexport/native/native.xsd)
19	native-xml=>chapter	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.monograph.Chapter[]
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
1	1	0	Extract metadata from a(n) PublicationFormat	APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPublicationFormatAdapter	0	0	0
2	2	0	User XML user export	PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter	0	0	0
3	3	0	User XML user import	PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter	0	0	0
4	4	0	Native XML user group export	PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter	0	0	0
5	5	0	Native XML user group import	PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter	0	0	0
6	6	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
7	7	0	Native XML submission export	APP\\plugins\\importexport\\native\\filter\\MonographNativeXmlFilter	0	0	0
8	8	0	Native XML submission import	APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFilter	0	0	0
9	9	0	Native XML author export	APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter	0	0	0
10	10	0	Native XML author import	APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter	0	0	0
11	11	0	Native XML representation export	APP\\plugins\\importexport\\native\\filter\\PublicationFormatNativeXmlFilter	0	0	0
12	12	0	Native XML representation import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFormatFilter	0	0	0
13	14	0	Native XML submission file import	APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFileFilter	0	0	0
14	13	0	Native XML submission file export	PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter	0	0	0
15	15	0	ONIX 3.0 XML monograph export	plugins.importexport.onix30.filter.MonographONIX30XmlFilter	0	0	0
16	16	0	Native XML Publication export	APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter	0	0	0
17	17	0	Native XML publication import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter	0	0	0
18	18	0	Native XML chapter export	APP\\plugins\\importexport\\native\\filter\\ChapterNativeXmlFilter	0	0	0
19	19	0	Native XML Chapter import	APP\\plugins\\importexport\\native\\filter\\NativeXmlChapterFilter	0	0	0
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
-- Data for Name: institution_ip; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.institution_ip (institution_ip_id, institution_id, ip_string, ip_start, ip_end) FROM stdin;
\.


--
-- Name: institution_ip_institution_ip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.institution_ip_institution_ip_id_seq', 1, false);


--
-- Data for Name: institution_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.institution_settings (institution_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.institutions (institution_id, context_id, ror, deleted_at) FROM stdin;
\.


--
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 1, false);


--
-- Data for Name: item_views; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.item_views (assoc_type, assoc_id, user_id, date_last_viewed) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
979e3f3b-cd5f-485f-8d70-2a31e8f0364d		0	0	0	[]	YTowOnt9	\N	1667059215	\N
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
-- Data for Name: mailable_templates; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.mailable_templates (email_id, mailable_id) FROM stdin;
\.


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
-- Data for Name: metrics_context; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_context (load_id, context_id, date, metric) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_daily; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_counter_submission_daily (load_id, context_id, submission_id, date, metric_book_investigations, metric_book_investigations_unique, metric_book_requests, metric_book_requests_unique, metric_chapter_investigations, metric_chapter_investigations_unique, metric_chapter_requests, metric_chapter_requests_unique, metric_title_investigations_unique, metric_title_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_institution_daily; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_counter_submission_institution_daily (load_id, context_id, submission_id, institution_id, date, metric_book_investigations, metric_book_investigations_unique, metric_book_requests, metric_book_requests_unique, metric_chapter_investigations, metric_chapter_investigations_unique, metric_chapter_requests, metric_chapter_requests_unique, metric_title_investigations_unique, metric_title_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_institution_monthly; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_counter_submission_institution_monthly (context_id, submission_id, institution_id, month, metric_book_investigations, metric_book_investigations_unique, metric_book_requests, metric_book_requests_unique, metric_chapter_investigations, metric_chapter_investigations_unique, metric_chapter_requests, metric_chapter_requests_unique, metric_title_investigations_unique, metric_title_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_monthly; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_counter_submission_monthly (context_id, submission_id, month, metric_book_investigations, metric_book_investigations_unique, metric_book_requests, metric_book_requests_unique, metric_chapter_investigations, metric_chapter_investigations_unique, metric_chapter_requests, metric_chapter_requests_unique, metric_title_investigations_unique, metric_title_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_series; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_series (load_id, context_id, series_id, date, metric) FROM stdin;
\.


--
-- Data for Name: metrics_submission; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_submission (load_id, context_id, submission_id, chapter_id, representation_id, submission_file_id, file_type, assoc_type, date, metric) FROM stdin;
\.


--
-- Data for Name: metrics_submission_geo_daily; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_submission_geo_daily (load_id, context_id, submission_id, country, region, city, date, metric, metric_unique) FROM stdin;
\.


--
-- Data for Name: metrics_submission_geo_monthly; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.metrics_submission_geo_monthly (context_id, submission_id, country, region, city, month, metric, metric_unique) FROM stdin;
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
1	1048586	1	6	2022-10-29 16:16:01	2022-10-29 16:16:01	Editor Recommendation	<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is:<br />Accept Submission.</p><p>Please visit the submission's <a href="http://localhost/index.php/publicknowledge/workflow/access/6">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>
\.


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 1, true);


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
100	1	3	2	16777254	2022-10-29 16:13:32	\N	1048585	5
199	1	28	2	16777230	2022-10-29 16:23:33	\N	1048585	11
141	1	0	2	16777236	2022-10-29 16:18:02	2022-10-29 16:18:09	523	8
35	1	3	2	16777217	2022-10-29 16:07:44	\N	1048585	2
36	1	0	2	16777243	2022-10-29 16:07:44	\N	1048585	2
37	1	0	2	16777245	2022-10-29 16:07:44	\N	1048585	2
38	1	0	2	16777236	2022-10-29 16:08:00	2022-10-29 16:08:06	523	2
39	1	11	3	16777227	2022-10-29 16:08:12	\N	517	2
200	1	3	2	16777251	2022-10-29 16:23:33	2022-10-29 16:23:39	1048585	11
41	1	12	3	16777227	2022-10-29 16:08:21	\N	517	3
103	1	0	2	16777246	2022-10-29 16:14:11	\N	1048585	5
76	1	22	2	16777235	2022-10-29 16:11:24	\N	1048585	4
77	1	3	2	16777254	2022-10-29 16:11:24	\N	1048585	4
142	1	10	3	16777227	2022-10-29 16:18:16	\N	517	8
64	1	0	2	16777245	2022-10-29 16:10:11	2022-10-29 16:11:29	1048585	4
11	1	3	2	16777217	2022-10-29 16:05:41	\N	1048585	1
12	1	0	2	16777243	2022-10-29 16:05:41	\N	1048585	1
13	1	0	2	16777245	2022-10-29 16:05:41	\N	1048585	1
14	1	0	2	16777236	2022-10-29 16:05:52	2022-10-29 16:05:56	523	1
15	1	12	3	16777227	2022-10-29 16:06:02	\N	517	1
298	1	0	2	16777236	2022-10-29 16:34:29	2022-10-29 16:34:33	523	18
17	1	19	2	16777230	2022-10-29 16:06:08	\N	1048585	1
18	1	3	2	16777251	2022-10-29 16:06:08	2022-10-29 16:06:11	1048585	1
301	1	11	3	16777227	2022-10-29 16:34:47	\N	517	22
48	1	3	2	16777217	2022-10-29 16:09:01	\N	1048585	3
49	1	0	2	16777243	2022-10-29 16:09:01	\N	1048585	3
50	1	0	2	16777245	2022-10-29 16:09:01	\N	1048585	3
144	1	25	2	16777230	2022-10-29 16:18:24	\N	1048585	7
214	1	3	2	16777217	2022-10-29 16:24:54	\N	1048585	12
215	1	0	2	16777243	2022-10-29 16:24:54	\N	1048585	12
216	1	0	2	16777245	2022-10-29 16:24:54	\N	1048585	12
218	1	29	2	16777229	2022-10-29 16:25:13	\N	1048585	12
217	1	0	2	16777236	2022-10-29 16:25:12	2022-10-29 16:25:19	523	12
145	1	3	2	16777251	2022-10-29 16:18:24	2022-10-29 16:18:29	1048585	7
115	1	3	2	16777217	2022-10-29 16:15:17	\N	1048585	6
116	1	4	2	16777217	2022-10-29 16:15:17	\N	1048585	6
117	1	0	2	16777243	2022-10-29 16:15:17	\N	1048585	6
118	1	0	2	16777245	2022-10-29 16:15:17	\N	1048585	6
120	1	24	2	16777229	2022-10-29 16:15:33	\N	1048585	6
119	1	0	2	16777236	2022-10-29 16:15:33	2022-10-29 16:15:39	523	7
219	1	7	3	16777227	2022-10-29 16:25:25	\N	517	12
62	1	3	2	16777217	2022-10-29 16:10:11	\N	1048585	4
63	1	0	2	16777243	2022-10-29 16:10:11	\N	1048585	4
65	1	0	2	16777236	2022-10-29 16:10:26	2022-10-29 16:10:32	523	3
67	1	9	3	16777227	2022-10-29 16:10:39	\N	517	4
122	1	3	3	16777249	2022-10-29 16:16:01	\N	1048586	1
85	1	3	2	16777217	2022-10-29 16:12:29	\N	1048585	5
123	1	4	3	16777249	2022-10-29 16:16:01	\N	1048586	1
69	1	0	2	16777236	2022-10-29 16:10:45	2022-10-29 16:10:51	523	4
71	1	11	3	16777227	2022-10-29 16:10:57	\N	517	5
88	1	0	2	16777236	2022-10-29 16:12:43	2022-10-29 16:12:48	523	5
90	1	8	3	16777227	2022-10-29 16:12:53	\N	517	6
147	1	3	2	16777217	2022-10-29 16:18:53	\N	1048585	8
148	1	0	2	16777243	2022-10-29 16:18:54	\N	1048585	8
92	1	0	2	16777236	2022-10-29 16:12:58	2022-10-29 16:13:03	523	6
94	1	12	3	16777227	2022-10-29 16:13:09	\N	517	7
149	1	0	2	16777245	2022-10-29 16:18:54	\N	1048585	8
138	1	3	2	16777217	2022-10-29 16:17:44	\N	1048585	7
99	1	23	2	16777235	2022-10-29 16:13:32	\N	1048585	5
139	1	0	2	16777243	2022-10-29 16:17:44	\N	1048585	7
140	1	0	2	16777245	2022-10-29 16:17:44	\N	1048585	7
164	1	3	2	16777217	2022-10-29 16:20:16	\N	1048585	9
165	1	4	2	16777217	2022-10-29 16:20:16	\N	1048585	9
166	1	0	2	16777243	2022-10-29 16:20:16	\N	1048585	9
167	1	0	2	16777245	2022-10-29 16:20:16	\N	1048585	9
169	1	26	2	16777229	2022-10-29 16:20:35	\N	1048585	9
168	1	0	2	16777236	2022-10-29 16:20:34	2022-10-29 16:20:41	523	9
179	1	3	2	16777217	2022-10-29 16:21:39	\N	1048585	10
180	1	0	2	16777243	2022-10-29 16:21:39	\N	1048585	10
181	1	0	2	16777245	2022-10-29 16:21:39	\N	1048585	10
187	1	0	2	16777236	2022-10-29 16:22:18	2022-10-29 16:22:22	523	10
189	1	9	3	16777227	2022-10-29 16:22:28	\N	517	9
184	1	3	2	16777217	2022-10-29 16:22:03	\N	1048585	11
185	1	0	2	16777243	2022-10-29 16:22:03	\N	1048585	11
186	1	0	2	16777245	2022-10-29 16:22:03	\N	1048585	11
191	1	0	2	16777236	2022-10-29 16:22:32	2022-10-29 16:22:37	523	11
198	1	3	2	16777219	2022-10-29 16:23:13	\N	517	11
197	1	3	2	16777219	2022-10-29 16:23:01	\N	517	10
289	1	0	2	16777236	2022-10-29 16:33:30	2022-10-29 16:33:34	523	17
223	1	9	3	16777227	2022-10-29 16:25:42	\N	517	14
267	1	0	2	16777236	2022-10-29 16:30:22	2022-10-29 16:30:28	523	15
225	1	3	2	16777219	2022-10-29 16:25:57	\N	517	13
269	1	7	3	16777227	2022-10-29 16:30:35	\N	517	19
295	1	3	2	16777217	2022-10-29 16:34:11	\N	1048585	16
296	1	0	2	16777243	2022-10-29 16:34:11	\N	1048585	16
297	1	0	2	16777245	2022-10-29 16:34:11	\N	1048585	16
271	1	0	2	16777236	2022-10-29 16:30:41	2022-10-29 16:30:46	523	16
273	1	11	3	16777227	2022-10-29 16:30:53	\N	517	20
303	1	12	3	16777227	2022-10-29 16:34:54	\N	517	23
235	1	3	2	16777217	2022-10-29 16:26:53	\N	1048585	13
236	1	0	2	16777243	2022-10-29 16:26:53	\N	1048585	13
237	1	0	2	16777245	2022-10-29 16:26:53	\N	1048585	13
305	1	3	2	16777219	2022-10-29 16:35:06	\N	517	21
238	1	0	2	16777236	2022-10-29 16:27:11	2022-10-29 16:27:16	523	13
240	1	8	3	16777227	2022-10-29 16:27:22	\N	517	15
242	1	0	2	16777236	2022-10-29 16:27:28	2022-10-29 16:27:33	523	14
325	1	3	2	16777217	2022-10-29 16:37:04	\N	1048585	17
326	1	0	2	16777243	2022-10-29 16:37:04	\N	1048585	17
246	1	11	3	16777227	2022-10-29 16:27:48	\N	517	17
327	1	0	2	16777245	2022-10-29 16:37:04	\N	1048585	17
250	1	3	2	16777219	2022-10-29 16:28:11	\N	517	16
251	1	3	2	16777219	2022-10-29 16:28:24	\N	517	18
252	1	30	2	16777230	2022-10-29 16:28:48	\N	1048585	13
253	1	3	2	16777251	2022-10-29 16:28:48	2022-10-29 16:28:53	1048585	13
329	1	34	2	16777229	2022-10-29 16:37:29	\N	1048585	17
328	1	0	2	16777236	2022-10-29 16:37:29	2022-10-29 16:37:37	523	19
278	1	31	2	16777235	2022-10-29 16:31:20	\N	1048585	14
279	1	3	2	16777254	2022-10-29 16:31:20	\N	1048585	14
330	1	7	3	16777227	2022-10-29 16:37:43	\N	517	24
332	1	8	3	16777227	2022-10-29 16:37:53	\N	517	25
282	1	0	2	16777246	2022-10-29 16:32:44	\N	1048585	14
264	1	3	2	16777217	2022-10-29 16:30:02	\N	1048585	14
286	1	3	2	16777217	2022-10-29 16:33:14	\N	1048585	15
287	1	0	2	16777243	2022-10-29 16:33:14	\N	1048585	15
288	1	0	2	16777245	2022-10-29 16:33:14	\N	1048585	15
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 333, true);


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
tinymceplugin	0	enabled	1	bool
defaultthemeplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
usageeventplugin	0	uniqueSiteId		string
acronplugin	0	enabled	1	bool
acronplugin	0	crontab	[{"className":"PKP\\\\task\\\\ReviewReminder","frequency":{"hour":24},"args":[]},{"className":"PKP\\\\task\\\\PublishSubmissions","frequency":{"hour":24},"args":[]},{"className":"PKP\\\\task\\\\StatisticsReport","frequency":{"day":"1"},"args":[]},{"className":"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers","frequency":{"day":"1"},"args":[]},{"className":"PKP\\\\task\\\\UpdateIPGeoDB","frequency":{"day":"10"},"args":[]},{"className":"APP\\\\tasks\\\\UsageStatsLoader","frequency":{"hour":24},"args":[]},{"className":"PKP\\\\task\\\\EditorialReminders","frequency":{"day":"1"},"args":[]},{"className":"PKP\\\\task\\\\ProcessQueueJobs","frequency":{"hour":24},"args":[]}]	object
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
developedbyblockplugin	0	context	1	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
languagetoggleblockplugin	0	context	1	int
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
dublincoremetaplugin	1	enabled	1	bool
pdfjsviewerplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	displayItems	1	bool
htmlmonographfileplugin	1	enabled	1	bool
googlescholarplugin	1	enabled	1	bool
defaultthemeplugin	1	typography	notoSans	string
defaultthemeplugin	1	useHomepageImageAsHeader	false	string
defaultthemeplugin	1	baseColour	#1E6292	string
defaultthemeplugin	1	showCatalogSeriesListing	false	string
defaultthemeplugin	1	displayStats	none	string
\.


--
-- Data for Name: press_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.press_settings (press_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	privacyStatement	<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>	\N
1	en_US	submissionChecklist	[{"order":1,"content":"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor)."},{"order":2,"content":"The submission file is in the Microsoft Word, RTF, or OpenDocument file format."},{"order":3,"content":"Where available, URLs for the references have been provided."},{"order":4,"content":"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end."},{"order":5,"content":"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\" target=\\"_blank\\">Author Guidelines<\\/a>, which is found in About the Press."}]	\N
1	en_US	acronym	JPK	\N
1	fr_CA	authorInformation	Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href="http://localhost/index.php/publicknowledge/about">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Lignes directrices à l'intention des auteurs-es</a>. Les auteurs-es doivent <a href="http://localhost/index.php/publicknowledge/user/register">s'inscrire</a> auprès de la presse avant d'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href="http://localhost/index.php/index/login">d'ouvrir une session</a> pour débuter la procédure en 5 étapes.	\N
1	en_US	authorInformation	Interested in submitting to this press? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About the Press</a> page for the press' section policies and <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> with the press prior to submitting, or if already registered can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the 5 step process.	\N
1		contactEmail	rvaca@mailinator.com	\N
1		contactName	Ramiro Vaca	\N
1		country	IS	\N
1		defaultReviewMode	2	\N
1		keywords	request	\N
1	en_US	librarianInformation	We encourage research librarians to list this press among their library's electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href="https://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1	fr_CA	librarianInformation	Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href="http://pkp.sfu.ca/omp">Open Monograph Press</a>).	\N
1	en_US	name	Public Knowledge Press	\N
1	fr_CA	name	Press de la connaissance du public	\N
1		notifyAllAuthors	1	\N
1	fr_CA	privacyStatement	<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d'autres fins ou transmis à une tierce partie.</p>	\N
1	fr_CA	readerInformation	Nous encourageons les lecteurs à s'abonner au service d'avis de publication de cette presse. Utilisez le lien <a href="http://localhost/index.php/publicknowledge/user/register">d'inscription</a> situé en haut de la page d'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d'affirmer qu'elle compte un certain nombre de lecteurs. Consultez <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">l'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d'autres fins.	\N
1		emailSignature	<br/><hr /><br/><p><a href="http://localhost/index.php/publicknowledge">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href="mailto: {$contactEmail}">{$contactEmail}</a></p>	\N
1		enableDois	1	\N
1		doiSuffixType	default	\N
1		registrationAgency		\N
1		disableSubmissions	0	\N
1		numPageLinks	10	\N
1		numWeeksPerResponse	4	\N
1		numWeeksPerReview	4	\N
1	en_US	openAccessPolicy	This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
1	fr_CA	openAccessPolicy	Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l'échelle mondiale.	\N
1		itemsPerPage	25	\N
1	en_US	customHeaders	<meta name="pkp" content="Test metatag.">	\N
1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this press. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.	\N
1	en_US	searchDescription	Public Knowledge Press is a publisher dedicated to the subject of public access to science.	\N
1	fr_CA	submissionChecklist	[{"order":1,"content":"Cette soumission n'a jamais été publiée et n'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef)."},{"order":2,"content":"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument."},{"order":3,"content":"Les adresses URL des références ont été fournies si elles étaient disponibles."},{"order":4,"content":"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu'à la fin."},{"order":5,"content":"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\" target=\\"_blank\\">lignes directrices à l'intention des auteurs<\\/a>, disponibles dans la rubrique À propos de cette presse."}]	\N
1		supportedFormLocales	["en_US","fr_CA"]	\N
1		supportedLocales	["en_US","fr_CA"]	\N
1		supportedSubmissionLocales	["en_US","fr_CA"]	\N
1		supportEmail	rvaca@mailinator.com	\N
1		supportName	Ramiro Vaca	\N
1		themePluginPath	default	\N
1		type	enable	\N
1		enableGeoUsageStats		\N
1		enableInstitutionUsageStats	0	\N
1		isSushiApiPublic	1	\N
1		coverThumbnailsMaxWidth	106	\N
1		coverThumbnailsMaxHeight	100	\N
1		doiCreationTime	copyEditCreationTime	\N
1		paymentPluginName	ManualPayment	\N
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
6		categoryIds	[]
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

COPY public.publications (publication_id, date_published, last_modified, primary_contact_id, publication_date_type, publication_type, seq, series_id, series_position, submission_id, status, url_path, version, doi_id) FROM stdin;
1	\N	2022-10-29 16:05:40	\N	pub	publication	0	\N	\N	1	1	\N	1	\N
2	\N	2022-10-29 16:07:42	\N	pub	publication	0	\N	\N	2	1	\N	1	\N
3	\N	2022-10-29 16:09:00	\N	pub	publication	0	\N	\N	3	1	\N	1	\N
4	\N	2022-10-29 16:10:09	\N	pub	publication	0	3	\N	4	1	\N	1	\N
5	2022-10-29	2022-10-29 16:14:10	\N	pub	publication	0	\N	\N	5	3	\N	1	\N
6	\N	2022-10-29 16:15:15	\N	pub	publication	0	1	\N	6	1	\N	1	\N
7	\N	2022-10-29 16:17:42	\N	pub	publication	0	4	\N	7	1	\N	1	\N
8	\N	2022-10-29 16:18:53	\N	pub	publication	0	\N	\N	8	1	\N	1	\N
9	\N	2022-10-29 16:20:14	\N	pub	publication	0	1	\N	9	1	\N	1	\N
10	\N	2022-10-29 16:21:37	\N	pub	publication	0	\N	\N	10	1	\N	1	\N
11	\N	2022-10-29 16:22:02	\N	pub	publication	0	\N	\N	11	1	\N	1	\N
12	\N	2022-10-29 16:24:52	\N	pub	publication	0	\N	\N	12	1	\N	1	\N
13	\N	2022-10-29 16:26:52	\N	pub	publication	0	\N	\N	13	1	\N	1	\N
14	2022-10-29	2022-10-29 16:32:44	\N	pub	publication	0	5	\N	14	3	\N	1	\N
15	\N	2022-10-29 16:33:13	\N	pub	publication	0	\N	\N	15	1	\N	1	\N
16	\N	2022-10-29 16:34:10	\N	pub	publication	0	\N	\N	16	1	\N	1	\N
17	\N	2022-10-29 16:37:01	\N	pub	publication	0	\N	\N	17	1	\N	1	\N
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
1	4
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

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, unconsidered, request_resent) FROM stdin;
13	12	8	\N	0	2022-10-29 16:25:33	2022-10-29 16:25:33	2022-10-29 16:25:52	2022-10-29 16:25:57	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:25:57	0	0	0	\N	\N	\N	0	12	2	2	1	4	\N	0	0
1	1	12	\N	\N	2022-10-29 16:06:02	2022-10-29 16:06:02	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:06:02	0	0	0	\N	\N	\N	\N	1	3	2	1	1	\N	0	0
2	2	11	\N	\N	2022-10-29 16:08:12	2022-10-29 16:08:12	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:08:12	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0	0
3	2	12	\N	\N	2022-10-29 16:08:21	2022-10-29 16:08:22	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:08:22	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0	0
15	13	8	\N	\N	2022-10-29 16:27:22	2022-10-29 16:27:22	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:27:22	0	0	0	\N	\N	\N	\N	13	2	2	1	1	\N	0	0
4	4	9	\N	\N	2022-10-29 16:10:39	2022-10-29 16:10:39	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:10:39	0	0	0	\N	\N	\N	\N	3	2	2	1	1	\N	0	0
5	4	11	\N	\N	2022-10-29 16:10:57	2022-10-29 16:10:57	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:10:57	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0	0
6	5	8	\N	\N	2022-10-29 16:12:53	2022-10-29 16:12:53	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:12:53	0	0	0	\N	\N	\N	\N	5	2	2	1	1	\N	0	0
21	16	10	\N	0	2022-10-29 16:34:39	2022-10-29 16:34:39	2022-10-29 16:35:02	2022-10-29 16:35:06	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:35:06	0	0	0	\N	\N	\N	0	18	3	2	1	4	\N	0	0
7	5	12	\N	\N	2022-10-29 16:13:08	2022-10-29 16:13:09	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:13:09	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0	0
8	7	10	\N	\N	2022-10-29 16:18:16	2022-10-29 16:18:16	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:18:16	0	0	0	\N	\N	\N	\N	8	3	2	1	1	\N	0	0
9	11	9	\N	\N	2022-10-29 16:22:28	2022-10-29 16:22:28	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:22:28	0	0	0	\N	\N	\N	\N	10	2	2	1	1	\N	0	0
17	13	11	\N	\N	2022-10-29 16:27:48	2022-10-29 16:27:48	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:27:48	0	0	0	\N	\N	\N	\N	14	3	2	1	1	\N	0	0
24	17	7	\N	\N	2022-10-29 16:37:43	2022-10-29 16:37:43	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:37:43	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0	0
25	17	8	\N	\N	2022-10-29 16:37:53	2022-10-29 16:37:53	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:37:53	0	0	0	\N	\N	\N	\N	19	2	2	1	1	\N	0	0
10	11	10	\N	0	2022-10-29 16:22:43	2022-10-29 16:22:43	2022-10-29 16:22:58	2022-10-29 16:23:01	2022-10-29 16:23:33	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:23:33	0	0	0	\N	\N	\N	0	11	3	2	1	4	\N	0	0
11	11	12	\N	0	2022-10-29 16:22:50	2022-10-29 16:22:50	2022-10-29 16:23:09	2022-10-29 16:23:13	2022-10-29 16:23:33	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:23:33	0	0	0	\N	\N	\N	0	11	3	2	1	4	\N	0	0
16	13	10	\N	0	2022-10-29 16:27:39	2022-10-29 16:27:39	2022-10-29 16:28:06	2022-10-29 16:28:11	2022-10-29 16:28:48	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:28:48	0	0	0	\N	\N	\N	0	14	3	2	1	4	\N	0	0
12	12	7	\N	\N	2022-10-29 16:25:25	2022-10-29 16:25:25	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:25:25	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0	0
18	13	12	\N	0	2022-10-29 16:27:56	2022-10-29 16:27:57	2022-10-29 16:28:19	2022-10-29 16:28:24	2022-10-29 16:28:48	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:28:48	0	0	0	\N	\N	\N	0	14	3	2	1	4	\N	0	0
14	12	9	\N	\N	2022-10-29 16:25:42	2022-10-29 16:25:42	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:25:42	0	0	0	\N	\N	\N	\N	12	2	2	1	1	\N	0	0
19	14	7	\N	\N	2022-10-29 16:30:35	2022-10-29 16:30:35	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:30:35	0	0	0	\N	\N	\N	\N	15	2	2	1	1	\N	0	0
20	14	11	\N	\N	2022-10-29 16:30:53	2022-10-29 16:30:53	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:30:53	0	0	0	\N	\N	\N	\N	16	3	2	1	1	\N	0	0
22	16	11	\N	\N	2022-10-29 16:34:47	2022-10-29 16:34:47	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:34:47	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0	0
23	16	12	\N	\N	2022-10-29 16:34:54	2022-10-29 16:34:54	\N	\N	\N	2022-11-26 00:00:00	2022-11-26 00:00:00	2022-10-29 16:34:54	0	0	0	\N	\N	\N	\N	18	3	2	1	1	\N	0	0
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
19	75
19	76
19	77
19	78
19	73
19	74
21	88
22	88
23	88
24	96
24	97
24	98
24	99
24	100
24	95
25	96
25	97
25	98
25	99
25	100
25	95
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
PKP\\task\\ReviewReminder	2022-10-29 16:00:15
PKP\\task\\PublishSubmissions	2022-10-29 16:00:15
PKP\\task\\StatisticsReport	2022-10-29 16:00:15
PKP\\task\\RemoveUnvalidatedExpiredUsers	2022-10-29 16:00:15
PKP\\task\\UpdateIPGeoDB	2022-10-29 16:00:15
APP\\tasks\\UsageStatsLoader	2022-10-29 16:00:16
PKP\\task\\EditorialReminders	2022-10-29 16:00:16
PKP\\task\\ProcessQueueJobs	2022-10-29 16:00:16
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
a3eu94emeof0uteua72f2isp6d	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059240	1667059255	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059255;s:5:"token";s:32:"fe6e8030ed80055580b3d71f32218aea";}	localhost
eja8igt93ee78507c49i65ive0	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059273	1667059282	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059282;s:5:"token";s:32:"440882ded85ba0716ee88d07340a05da";}	localhost
i10cpn2v0jl8jap5cu5hne267u	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059214	1667059240	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059240;s:5:"token";s:32:"15948e6913cf13b2b1c6ba7b554d24aa";}	localhost
u0av69tq0eo280hqv7vcqi9afp	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059257	1667059264	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059264;s:5:"token";s:32:"d4d751fc5c1853206f15a54686f7fea4";}	localhost
rjt709nqq4t52ulrm13kbkcdfs	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059265	1667059272	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059272;s:5:"token";s:32:"2a41743bc2625ca1a6e022289684caab";}	localhost
qfsq2ib33io889r88q9sclnue2	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059472	1667059493	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059493;s:5:"token";s:32:"afcba7f49c590374bbf14b0ebf712191";}	localhost
20ruv7ep0r260ege92657ocpk8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059285	1667059460	0	username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059459;s:5:"token";s:32:"3872a0bd4379f7fa1c9b6cf4317a6f48";}	localhost
9eovs4c6ebme8b05ujc1aj2309	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059495	1667059513	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1667059513;s:5:"token";s:32:"d6182ca7454bf4ac9050e621ff68008c";}	localhost
chf9cfhv5gout3r5c68f331806	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059461	1667059469	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1667059469;s:5:"token";s:32:"4b2818c6c2e307370f8e858ae32432e1";}	localhost
sgbug21skdnrlt922bqiq984c9	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059542	1667059576	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667059576;s:5:"token";s:32:"3bdf75ad097b00f50ed0a4d0a1e9a0d1";}	localhost
fscijqo9gnigpcggupc2t3l9p2	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059515	1667059542	0	csrf|a:2:{s:9:"timestamp";i:1667059542;s:5:"token";s:32:"f70e1feab33f6b0aa8f1775716a584e1";}username|s:6:"aclark";	localhost
s9evsmn4vrd9jk15p8rlv1l9j2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059666	1667059702	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667059701;s:5:"token";s:32:"39980e7e6fb40c65e14c6471456cd878";}	localhost
dfthf9ti93k6r0bnjtqikkjr8g	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059579	1667059665	0	csrf|a:2:{s:9:"timestamp";i:1667059665;s:5:"token";s:32:"3c08499c70c569398928cd48424d9c25";}username|s:7:"afinkel";	localhost
cid97r92b3o6hgp46dal5cnv32	21	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059705	1667059742	0	csrf|a:2:{s:9:"timestamp";i:1667059741;s:5:"token";s:32:"a5bc3bf553ef7802ddf78709c497f7d8";}username|s:10:"bbarnetson";userId|i:21;	localhost
u1asm3lqh8ro2ih1cj6o1ub9uj	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059744	1667059812	0	csrf|a:2:{s:9:"timestamp";i:1667059812;s:5:"token";s:32:"131d70a2f35951a49be018ea42d3843a";}username|s:6:"bbeaty";	localhost
f7keugu15pdk1rko2gmrof8m4a	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059812	1667059906	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667059906;s:5:"token";s:32:"2f483906ffbb4b6aa72bb2d56dfc4c3a";}	localhost
c01cctltapq23nd783vdd7hdd8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059909	1667059950	0	csrf|a:2:{s:9:"timestamp";i:1667059950;s:5:"token";s:32:"3938b830a9ea67c70dd53aa9298ae33e";}username|s:6:"callan";	localhost
u6p2a8p6hnldfmaj3p42qjd54f	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667059950	1667060052	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060052;s:5:"token";s:32:"08bcff62651c356aec30acf6545eda28";}	localhost
6ikor59coqbkhca1hnnei4cban	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060054	1667060118	0	csrf|a:2:{s:9:"timestamp";i:1667060118;s:5:"token";s:32:"087451b8960347115bfb60ac2d4f5bbe";}username|s:9:"dbernnard";	localhost
fr6sca4qv33d2149v6bj7tb7bv	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060119	1667060147	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060147;s:5:"token";s:32:"4d1f3b2e87cd808d50b8f59bcf611295";}	localhost
benaj12o8ln9d3cnejj5keg8sk	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060148	1667060166	0	username|s:6:"minoue";csrf|a:2:{s:9:"timestamp";i:1667060165;s:5:"token";s:32:"c41a59e6c963c8677c7fa15b745f3b5d";}	localhost
m72rnoirnelmjntadt685r84h7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060336	1667060418	0	csrf|a:2:{s:9:"timestamp";i:1667060417;s:5:"token";s:32:"6c560facc09226332c731ab6ebfb8d20";}username|s:7:"fperini";	localhost
j7oeertjumrttcpdnl5p9bs4ue	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060320	1667060334	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060333;s:5:"token";s:32:"f3c82640d77cd4cc2766410cf86a3b61";}	localhost
q6maldrpdqgtfjs6ftvbq849bb	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060815	1667060878	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060878;s:5:"token";s:32:"3cd49a2440bbdc8d4fc95a6ad64bcb46";}	localhost
g9hjrvmveo77a385l540nn4qss	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060180	1667060266	0	csrf|a:2:{s:9:"timestamp";i:1667060265;s:5:"token";s:32:"f44e74d0c8d668486c6146104d991c57";}username|s:10:"dkennepohl";	localhost
42gkkmpeq1t28s261qht2tqce1	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060266	1667060316	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060316;s:5:"token";s:32:"9cf0479ef2442cc3ed878b70d67ff198";}	localhost
0d32qen4v681ug7q72b90hnrgc	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060524	1667060571	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060571;s:5:"token";s:32:"ac1d00edd33be8cadb72e1bde80b823b";}	localhost
2tkski95kbvgo1n7pumf691fqc	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060502	1667060524	0	csrf|a:2:{s:9:"timestamp";i:1667060524;s:5:"token";s:32:"17e4f56cf6b8ad95c6ea9f2c91f9cd36";}username|s:10:"jlockehart";	localhost
nrjaolcdmksevm71vdru0ivblr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060167	1667060177	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060177;s:5:"token";s:32:"881429946dd707a753dd24d2175dd74e";}	localhost
8ncuou9vc48p9jhaq3qkc92a5c	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060893	1667060904	0	username|s:6:"gfavio";csrf|a:2:{s:9:"timestamp";i:1667060905;s:5:"token";s:32:"3ea4b6d11f5cc92d7c326281cfe2702e";}	localhost
q7ncq4p43e2ibms3gp8d4a6lie	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060879	1667060892	0	username|s:8:"agallego";csrf|a:2:{s:9:"timestamp";i:1667060892;s:5:"token";s:32:"382ce1abb1df9dbaf9c1e4610b337f61";}	localhost
bu68tmtg7nomj1482n8h6cekn0	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060418	1667060443	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060443;s:5:"token";s:32:"63b3864559747531fce6db5fbc474bc2";}	localhost
d1ip9go5p30860r21p3o3mktkl	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060745	1667060758	0	username|s:7:"phudson";csrf|a:2:{s:9:"timestamp";i:1667060758;s:5:"token";s:32:"336775d94fb7fcf94e91177052ab3156";}	localhost
3bnao0al49jd5ehkuobgfr7ud7	27	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060444	1667060499	0	csrf|a:2:{s:9:"timestamp";i:1667060499;s:5:"token";s:32:"1f0356476c2c28dc45c718d26549f24f";}username|s:7:"jbrower";userId|i:27;	localhost
volcviof9utj4cg1s5j5kvm4r7	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060905	1667060934	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060934;s:5:"token";s:32:"569bd7ed2b5a8cf78d8ea694601ca02c";}	localhost
9pc4hgn58l6co3bo6u8punntic	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060572	1667060582	0	username|s:8:"agallego";csrf|a:2:{s:9:"timestamp";i:1667060582;s:5:"token";s:32:"413b8e8dd7d0171d7364832dff77262b";}	localhost
4encue9noc40k586053dh2d5j0	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060696	1667060744	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060744;s:5:"token";s:32:"6450ccd6fbf93fd01b463b566ce22b84";}	localhost
3fpod0amasvdf8m747pvbkibed	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060583	1667060594	0	username|s:6:"gfavio";csrf|a:2:{s:9:"timestamp";i:1667060594;s:5:"token";s:32:"f4832b521ea8a458ae56e0aa76ce28fd";}	localhost
6kervulvudjennebckq26nema1	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060595	1667060620	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667060620;s:5:"token";s:32:"33949537c595c74a0e40c93b08e5d0e4";}	localhost
96rc3v6ua6m7b992dpvdsrkeqa	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060936	1667061004	0	csrf|a:2:{s:9:"timestamp";i:1667061003;s:5:"token";s:32:"8bbd5b4154afd022b3215898fc143092";}username|s:7:"mdawson";	localhost
fmvi9hvgesp39gqte67voifsb6	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061004	1667061166	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667061166;s:5:"token";s:32:"d2275a202b5e4a7b882303ad05075dd1";}	localhost
ui84fb0h5h80tt57itdc08qigj	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060621	1667060695	0	csrf|a:2:{s:9:"timestamp";i:1667060695;s:5:"token";s:32:"1b11c35a3672b0b966928057a6f832d7";}username|s:6:"lelder";	localhost
s1italrke8ilqab7ehn9pvl7rn	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667060762	1667060814	0	csrf|a:2:{s:9:"timestamp";i:1667060814;s:5:"token";s:32:"8d30bb108a4f3a53c773198795b1a93a";}username|s:5:"mally";	localhost
kttir7e14bkk0be1erubhr1l2j	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061310	1667061426	0	csrf|a:2:{s:9:"timestamp";i:1667061426;s:5:"token";s:32:"12f8fa4b08da8a459e5493a2a2d85d15";}username|s:6:"msmith";	localhost
mktcj8of6k10fkrm1r810p3eg0	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061253	1667061295	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667061295;s:5:"token";s:32:"4c53c9d9aa2009f781253d4113e18dab";}	localhost
nc5dkjd9gje4kkgcqcka25cjk2	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061195	1667061215	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667061216;s:5:"token";s:32:"2ecffb2474ddf41f93aa131bd94335d6";}	localhost
7rmm8s4mkf77cqgc8284rsevk9	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061168	1667061195	0	csrf|a:2:{s:9:"timestamp";i:1667061195;s:5:"token";s:32:"bfdd76e3c093d6ee70a995e8fe8ca7bf";}username|s:6:"mforan";	localhost
gh8ne111hmtc06a7qkfrja3ae5	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061217	1667061252	0	csrf|a:2:{s:9:"timestamp";i:1667061252;s:5:"token";s:32:"34edae1f1db46ca198e2cc641389a4cf";}username|s:6:"mpower";	localhost
8ee429apu9g65flnrmiaedqatu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061426	1667061474	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1667061473;s:5:"token";s:32:"5a1cbe3e2c52f6b45fae286c4eedd15e";}	localhost
g5v289tbmaepk3r8ohp8l7p4kj	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36	1667061296	1667061307	0	username|s:8:"agallego";csrf|a:2:{s:9:"timestamp";i:1667061307;s:5:"token";s:32:"1668fbf588e46739645a6a694c183600";}	localhost
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
compressStatsLogs		0
enableGeoUsageStats		disabled
enableInstitutionUsageStats		0
keepDailyUsageStats		0
isSiteSushiPlatform		0
isSushiApiPublic		1
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
1	1	13	19	2022-10-29 16:05:22	0	0
2	1	3	3	2022-10-29 16:05:41	0	1
3	1	6	14	2022-10-29 16:06:15	0	0
4	2	14	20	2022-10-29 16:06:25	0	0
5	2	3	3	2022-10-29 16:07:43	0	1
6	3	13	21	2022-10-29 16:08:32	0	0
7	3	3	3	2022-10-29 16:09:01	0	1
8	4	14	22	2022-10-29 16:09:11	0	0
9	4	3	3	2022-10-29 16:10:11	0	1
10	4	6	13	2022-10-29 16:11:16	0	0
11	4	10	15	2022-10-29 16:11:36	0	0
12	5	13	23	2022-10-29 16:11:55	0	0
13	5	3	3	2022-10-29 16:12:29	0	1
14	5	6	14	2022-10-29 16:13:25	0	0
15	5	10	16	2022-10-29 16:13:42	0	0
16	5	12	17	2022-10-29 16:13:49	0	0
17	6	14	24	2022-10-29 16:14:21	0	0
18	6	3	3	2022-10-29 16:15:17	0	1
19	6	5	4	2022-10-29 16:15:17	0	1
20	6	5	6	2022-10-29 16:15:45	1	0
21	7	14	25	2022-10-29 16:16:26	0	0
22	7	3	3	2022-10-29 16:17:44	0	1
23	7	6	13	2022-10-29 16:18:35	0	0
24	8	13	3	2022-10-29 16:18:47	0	0
25	8	3	3	2022-10-29 16:18:53	0	1
26	9	14	26	2022-10-29 16:19:02	0	0
27	9	3	3	2022-10-29 16:20:16	0	1
28	9	5	4	2022-10-29 16:20:16	0	1
29	10	13	27	2022-10-29 16:20:50	0	0
30	10	3	3	2022-10-29 16:21:39	0	1
31	11	13	28	2022-10-29 16:21:48	0	0
32	11	3	3	2022-10-29 16:22:03	0	1
33	12	14	29	2022-10-29 16:23:48	0	0
34	12	3	3	2022-10-29 16:24:54	0	1
35	13	14	30	2022-10-29 16:26:08	0	0
36	13	3	3	2022-10-29 16:26:53	0	1
37	14	14	31	2022-10-29 16:29:03	0	0
38	14	3	3	2022-10-29 16:30:02	0	1
39	14	6	13	2022-10-29 16:31:12	0	0
40	14	10	15	2022-10-29 16:31:31	0	0
41	14	12	18	2022-10-29 16:31:39	0	0
42	15	13	32	2022-10-29 16:32:55	0	0
43	15	3	3	2022-10-29 16:33:14	0	1
44	16	13	33	2022-10-29 16:33:43	0	0
45	16	3	3	2022-10-29 16:34:11	0	1
46	17	14	34	2022-10-29 16:35:17	0	0
47	17	3	3	2022-10-29 16:37:04	0	1
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 47, true);


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
1		licenseUrl	\N	string
2	en_US	title	Axioms	string
2	fr_CA	title		string
2	en_US	subtitle		string
2	fr_CA	subtitle		string
2	en_US	abstract		string
2	fr_CA	abstract		string
2		datePublished	\N	string
2		pages		string
2		isPageEnabled	\N	string
2		licenseUrl	\N	string
3	en_US	title	Paradigm Shift	string
3	fr_CA	title		string
3	en_US	subtitle		string
3	fr_CA	subtitle		string
3	en_US	abstract		string
3	fr_CA	abstract		string
3		datePublished	\N	string
3		pages		string
3		isPageEnabled	\N	string
3		licenseUrl	\N	string
4	en_US	title	Critical History in Western Canada 1900–2000	string
4	fr_CA	title		string
4	en_US	subtitle		string
4	fr_CA	subtitle		string
4	en_US	abstract		string
4	fr_CA	abstract		string
4		datePublished	\N	string
4		pages		string
4		isPageEnabled	\N	string
4		licenseUrl		string
5	en_US	title	Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito	string
5	fr_CA	title		string
5	en_US	subtitle		string
5	fr_CA	subtitle		string
5	en_US	abstract		string
5	fr_CA	abstract		string
5		datePublished	\N	string
5		pages		string
5		isPageEnabled	\N	string
5		licenseUrl		string
6	en_US	title	Cree Intellectual Traditions in History	string
6	fr_CA	title		string
6	en_US	subtitle		string
6	fr_CA	subtitle		string
6	en_US	abstract		string
6	fr_CA	abstract		string
6		datePublished	\N	string
6		pages		string
6		isPageEnabled	\N	string
6		licenseUrl		string
7	en_US	title	Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin	string
7	fr_CA	title		string
7	en_US	subtitle		string
7	fr_CA	subtitle		string
7	en_US	abstract		string
7	fr_CA	abstract		string
7		datePublished	\N	string
7		pages		string
7		isPageEnabled	\N	string
7		licenseUrl		string
8	en_US	title	Introduction	string
8	fr_CA	title		string
8	en_US	subtitle		string
8	fr_CA	subtitle		string
8	en_US	abstract		string
8	fr_CA	abstract		string
8		datePublished	\N	string
8		pages		string
8		isPageEnabled	\N	string
8		licenseUrl	\N	string
9	en_US	title	Part One. Employment Relationships in Canada	string
9	fr_CA	title		string
9	en_US	subtitle		string
9	fr_CA	subtitle		string
9	en_US	abstract		string
9	fr_CA	abstract		string
9		datePublished	\N	string
9		pages		string
9		isPageEnabled	\N	string
9		licenseUrl	\N	string
10	en_US	title	Part Two. Preventing Workplace Injury	string
10	fr_CA	title		string
10	en_US	subtitle		string
10	fr_CA	subtitle		string
10	en_US	abstract		string
10	fr_CA	abstract		string
10		datePublished	\N	string
10		pages		string
10		isPageEnabled	\N	string
10		licenseUrl	\N	string
11	en_US	title	Part Three. Critique of OHS in Canada	string
11	fr_CA	title		string
11	en_US	subtitle		string
11	fr_CA	subtitle		string
11	en_US	abstract		string
11	fr_CA	abstract		string
11		datePublished	\N	string
11		pages		string
11		isPageEnabled	\N	string
11		licenseUrl	\N	string
12	en_US	title	Part Four. Political Economy of Preventing Workplace Injury	string
12	fr_CA	title		string
12	en_US	subtitle		string
12	fr_CA	subtitle		string
12	en_US	abstract		string
12	fr_CA	abstract		string
12		datePublished	\N	string
12		pages		string
12		isPageEnabled	\N	string
12		licenseUrl	\N	string
13	fr_CA	title		string
13	en_US	subtitle		string
13	fr_CA	subtitle		string
13	en_US	abstract		string
13	en_US	title	Introduction: Contexts of Popular Culture	string
13	fr_CA	abstract		string
13		datePublished	\N	string
13		pages		string
13		isPageEnabled	\N	string
13		licenseUrl		string
14	en_US	title	Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics	string
14	fr_CA	title		string
14	en_US	subtitle		string
14	fr_CA	subtitle		string
14	en_US	abstract		string
14	fr_CA	abstract		string
14		datePublished	\N	string
14		pages		string
14		isPageEnabled	\N	string
14		licenseUrl		string
15	en_US	title	Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use	string
15	fr_CA	title		string
15	en_US	subtitle		string
15	fr_CA	subtitle		string
15	en_US	abstract		string
15	fr_CA	abstract		string
15		datePublished	\N	string
15		pages		string
15		isPageEnabled	\N	string
15		licenseUrl		string
16	en_US	title	Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada	string
16	fr_CA	title		string
16	en_US	subtitle		string
16	fr_CA	subtitle		string
16	en_US	abstract		string
16	fr_CA	abstract		string
16		datePublished	\N	string
16		pages		string
16		isPageEnabled	\N	string
16		licenseUrl		string
17	en_US	title	Prologue	string
17	fr_CA	title		string
17	en_US	subtitle		string
17	fr_CA	subtitle		string
17	en_US	abstract		string
17	fr_CA	abstract		string
17		datePublished	\N	string
17		pages		string
17		isPageEnabled	\N	string
17		licenseUrl	\N	string
18	en_US	title	Chapter 1: The First Five Years: 1867-1872	string
18	fr_CA	title		string
18	en_US	subtitle		string
18	fr_CA	subtitle		string
18	en_US	abstract		string
18	fr_CA	abstract		string
18		datePublished	\N	string
18		pages		string
18		isPageEnabled	\N	string
18		licenseUrl	\N	string
19	en_US	title	Chapter 2: Free Trade or "Freedom": 1911	string
19	fr_CA	title		string
19	en_US	subtitle		string
19	fr_CA	subtitle		string
19	en_US	abstract		string
19	fr_CA	abstract		string
19		datePublished	\N	string
19		pages		string
19		isPageEnabled	\N	string
19		licenseUrl	\N	string
20	en_US	title	Chapter 3: Castro, Nukes & the Cold War: 1953-1968	string
20	fr_CA	title		string
20	en_US	subtitle		string
20	fr_CA	subtitle		string
20	en_US	abstract		string
20	fr_CA	abstract		string
20		datePublished	\N	string
20		pages		string
20		isPageEnabled	\N	string
20		licenseUrl	\N	string
21	en_US	title	Chapter 4: Enter the Intellect: 1968-1984	string
21	fr_CA	title		string
21	en_US	subtitle		string
21	fr_CA	subtitle		string
21	en_US	abstract		string
21	fr_CA	abstract		string
21		datePublished	\N	string
21		pages		string
21		isPageEnabled	\N	string
21		licenseUrl	\N	string
22	en_US	title	Epilogue	string
22	fr_CA	title		string
22	en_US	subtitle		string
22	fr_CA	subtitle		string
22	en_US	abstract		string
22	fr_CA	abstract		string
22		datePublished	\N	string
22		pages		string
22		isPageEnabled	\N	string
22		licenseUrl	\N	string
23	en_US	title	Identify: Understanding Your Information Need	string
23	fr_CA	title		string
23	en_US	subtitle		string
23	fr_CA	subtitle		string
23	en_US	abstract		string
23	fr_CA	abstract		string
23		datePublished	\N	string
23		pages		string
23		isPageEnabled	\N	string
23		licenseUrl		string
24	en_US	title	Scope: Knowing What Is Available	string
24	fr_CA	title		string
24	en_US	subtitle		string
24	fr_CA	subtitle		string
24	en_US	abstract		string
24	fr_CA	abstract		string
24		datePublished	\N	string
24		pages		string
24		isPageEnabled	\N	string
24		licenseUrl		string
25	fr_CA	title		string
25	en_US	subtitle		string
25	fr_CA	subtitle		string
25	en_US	abstract		string
25	fr_CA	abstract		string
25		datePublished	\N	string
25		pages		string
25	en_US	title	Plan: Developing Research Strategies	string
25		isPageEnabled	\N	string
25		licenseUrl		string
26	en_US	title	Gather: Finding What You Need	string
26	fr_CA	title		string
26	en_US	subtitle		string
26	fr_CA	subtitle		string
26	en_US	abstract		string
26	fr_CA	abstract		string
26		datePublished	\N	string
26		pages		string
26		isPageEnabled	\N	string
26		licenseUrl		string
27	en_US	title	Introduction	string
27	fr_CA	title		string
27	en_US	subtitle		string
27	fr_CA	subtitle		string
27	en_US	abstract		string
27	fr_CA	abstract		string
27		datePublished	\N	string
27		pages		string
27		isPageEnabled	\N	string
27		licenseUrl		string
28	en_US	title	Chapter 1: Interactions Affording Distance Science Education	string
28	fr_CA	title		string
28	en_US	subtitle		string
28	fr_CA	subtitle		string
28	en_US	abstract		string
28	fr_CA	abstract		string
28		datePublished	\N	string
28		pages		string
28		isPageEnabled	\N	string
28		licenseUrl		string
29	en_US	title	Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources	string
29	fr_CA	title		string
29	en_US	subtitle		string
29	fr_CA	subtitle		string
29	en_US	abstract		string
29	fr_CA	abstract		string
29		datePublished	\N	string
29		pages		string
29		isPageEnabled	\N	string
29		licenseUrl		string
30	en_US	title	Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams	string
30	fr_CA	title		string
30	en_US	subtitle		string
30	fr_CA	subtitle		string
30	en_US	abstract		string
30	fr_CA	abstract		string
30		datePublished	\N	string
30		pages		string
30		isPageEnabled	\N	string
30		licenseUrl		string
31	en_US	title	Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education	string
31	fr_CA	title		string
31	en_US	subtitle		string
31	fr_CA	subtitle		string
31	en_US	abstract		string
31	fr_CA	abstract		string
31		datePublished	\N	string
31		pages		string
31		isPageEnabled	\N	string
31		licenseUrl		string
32	en_US	title	Internet, openness and the future of the information society in LAC	string
32	fr_CA	title		string
32	en_US	subtitle		string
32	fr_CA	subtitle		string
32	en_US	abstract		string
32	fr_CA	abstract		string
32		datePublished	\N	string
32		pages		string
32		isPageEnabled	\N	string
32		licenseUrl		string
33	en_US	title	Imagining the Internet: Open, closed or in between?	string
33	fr_CA	title		string
33	en_US	subtitle		string
33	fr_CA	subtitle		string
33	en_US	abstract		string
33	fr_CA	abstract		string
33		datePublished	\N	string
33		pages		string
33		isPageEnabled	\N	string
33		licenseUrl		string
34	en_US	title	The internet in LAC will remain free, public and open over the next 10 years	string
34	fr_CA	title		string
34	en_US	subtitle		string
34	fr_CA	subtitle		string
34	en_US	abstract		string
34	fr_CA	abstract		string
34		datePublished	\N	string
34		pages		string
34		isPageEnabled	\N	string
34		licenseUrl		string
35	en_US	title	Free Internet?	string
35	fr_CA	title		string
35	en_US	subtitle		string
35	fr_CA	subtitle		string
35	en_US	abstract		string
35	fr_CA	abstract		string
35		datePublished	\N	string
35		pages		string
35		isPageEnabled	\N	string
35		licenseUrl		string
36	en_US	title	Risks and challenges for freedom of expression on the internet	string
36	fr_CA	title		string
36	en_US	subtitle		string
36	fr_CA	subtitle		string
36	en_US	abstract		string
36	fr_CA	abstract		string
36		datePublished	\N	string
36		pages		string
36		isPageEnabled	\N	string
36		licenseUrl		string
37	en_US	title	Introduction	string
37	fr_CA	title		string
37	en_US	subtitle		string
37	fr_CA	subtitle		string
37	en_US	abstract		string
37	fr_CA	abstract		string
37		datePublished	\N	string
37		pages		string
37		isPageEnabled	\N	string
37		licenseUrl	\N	string
38	en_US	title	CHAPTER ONE: Where the Buffalo Roamed	string
38	fr_CA	title		string
38	en_US	subtitle		string
38	fr_CA	subtitle		string
38	en_US	abstract		string
38	fr_CA	abstract		string
38		datePublished	\N	string
38		pages		string
38		isPageEnabled	\N	string
38		licenseUrl	\N	string
39	en_US	title	CHAPTER TWO: Bison Conservation and Buffalo National Park	string
39	fr_CA	title		string
39	en_US	subtitle		string
39	fr_CA	subtitle		string
39	en_US	abstract		string
39	fr_CA	abstract		string
39		datePublished	\N	string
39		pages		string
39		isPageEnabled	\N	string
39		licenseUrl	\N	string
40	en_US	title	CHAPTER THREE: A Well-Run Ranch	string
40	fr_CA	title		string
40	en_US	subtitle		string
40	fr_CA	subtitle		string
40	en_US	abstract		string
40	fr_CA	abstract		string
40		datePublished	\N	string
40		pages		string
40		isPageEnabled	\N	string
40		licenseUrl	\N	string
41	en_US	title	CHAPTER FOUR: Zookeepers and Animal Breeders	string
41	fr_CA	title		string
41	en_US	subtitle		string
41	fr_CA	subtitle		string
41	en_US	abstract		string
41	fr_CA	abstract		string
41		datePublished	\N	string
41		pages		string
41		isPageEnabled	\N	string
41		licenseUrl	\N	string
42	en_US	title	CHAPTER FIVE: "Evolving the Arctic Cow"	string
42	fr_CA	title		string
42	en_US	subtitle		string
42	fr_CA	subtitle		string
42	en_US	abstract		string
42	fr_CA	abstract		string
42		datePublished	\N	string
42		pages		string
42		isPageEnabled	\N	string
42		licenseUrl	\N	string
43	en_US	title	CONCLUSION: The Forgotten Park	string
43	fr_CA	title		string
43	en_US	subtitle		string
43	fr_CA	subtitle		string
43	en_US	abstract		string
43	fr_CA	abstract		string
43		datePublished	\N	string
43		pages		string
43		isPageEnabled	\N	string
43		licenseUrl	\N	string
44	en_US	title	Bibliography	string
44	fr_CA	title		string
44	en_US	subtitle		string
44	fr_CA	subtitle		string
44	en_US	abstract		string
44	fr_CA	abstract		string
44		datePublished	\N	string
44		pages		string
44		isPageEnabled	\N	string
44		licenseUrl	\N	string
45	en_US	title	Index	string
45	fr_CA	title		string
45	en_US	subtitle		string
45	fr_CA	subtitle		string
45	en_US	abstract		string
45	fr_CA	abstract		string
45		datePublished	\N	string
45		pages		string
45		isPageEnabled	\N	string
45		licenseUrl	\N	string
46	en_US	title	Introduction	string
46	fr_CA	title		string
46	en_US	subtitle		string
46	fr_CA	subtitle		string
46	en_US	abstract		string
46	fr_CA	abstract		string
46		datePublished	\N	string
46		pages		string
46		isPageEnabled	\N	string
46		licenseUrl	\N	string
47	en_US	title	Poems	string
47	fr_CA	title		string
47	en_US	subtitle		string
47	fr_CA	subtitle		string
47	en_US	abstract		string
47	fr_CA	abstract		string
47		datePublished	\N	string
47		pages		string
47		isPageEnabled	\N	string
47		licenseUrl	\N	string
48	en_US	title	Catalyzing Access through Social and Technical Innovation	string
48	fr_CA	title		string
48	en_US	subtitle		string
48	fr_CA	subtitle		string
48	en_US	abstract		string
48	fr_CA	abstract		string
48		datePublished	\N	string
48		pages		string
48		isPageEnabled	\N	string
48		licenseUrl		string
49	en_US	title	Catalyzing Access via Telecommunications Policy	string
49	fr_CA	title		string
49	en_US	subtitle		string
49	fr_CA	subtitle		string
49	en_US	abstract		string
49	fr_CA	abstract		string
49		datePublished	\N	string
49		pages		string
49		isPageEnabled	\N	string
49		licenseUrl		string
50	fr_CA	title		string
50	en_US	subtitle		string
50	en_US	title	Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property	string
50	fr_CA	subtitle		string
50	en_US	abstract		string
50	fr_CA	abstract		string
50		datePublished	\N	string
50		pages		string
50		isPageEnabled	\N	string
50		licenseUrl		string
51	en_US	title	Current State of Mobile Learning	string
51	fr_CA	title		string
51	en_US	subtitle		string
51	fr_CA	subtitle		string
51	en_US	abstract		string
51	fr_CA	abstract		string
51		datePublished	\N	string
51		pages		string
51		isPageEnabled	\N	string
51		licenseUrl		string
52	en_US	title	A Model for Framing Mobile Learning	string
52	fr_CA	title		string
52	en_US	subtitle		string
52	fr_CA	subtitle		string
52	en_US	abstract		string
52	fr_CA	abstract		string
52		datePublished	\N	string
52		pages		string
52		isPageEnabled	\N	string
52		licenseUrl		string
53	en_US	title	Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners	string
53	fr_CA	title		string
53	en_US	subtitle		string
53	fr_CA	subtitle		string
53	en_US	abstract		string
53	fr_CA	abstract		string
53		datePublished	\N	string
53		pages		string
53		isPageEnabled	\N	string
53		licenseUrl		string
55	en_US	title	Chapter 2: Classical Music and the Classical Mind	string
55	fr_CA	subtitle		string
55	en_US	subtitle		string
55	fr_CA	abstract		string
55	en_US	abstract		string
55		datePublished	\N	string
55		pages		string
55		isPageEnabled	\N	string
55		licenseUrl	\N	string
56	fr_CA	title		string
58	fr_CA	subtitle		string
56	en_US	title	Chapter 3: Situated Cognition and Bricolage	string
58	en_US	abstract		string
58	fr_CA	abstract		string
58		datePublished	\N	string
58		pages		string
58		isPageEnabled	\N	string
58		licenseUrl	\N	string
59	en_US	title	Going It Alone, 1945-1954	string
59	fr_CA	title		string
59	en_US	subtitle		string
59	fr_CA	subtitle		string
59	en_US	abstract		string
59	fr_CA	abstract		string
59		datePublished	\N	string
59		pages		string
59		isPageEnabled	\N	string
59		licenseUrl	\N	string
60	en_US	title	Establishing the Pattern, 1955-1962	string
60	fr_CA	title		string
60	en_US	subtitle		string
60	fr_CA	subtitle		string
60	en_US	abstract		string
60	fr_CA	abstract		string
60		datePublished	\N	string
60		pages		string
60		isPageEnabled	\N	string
60		licenseUrl	\N	string
61	en_US	title	Foreward	string
61	fr_CA	title		string
54	fr_CA	title		string
54	en_US	title	Chapter 1: Mind Control—Internal or External?	string
54	fr_CA	subtitle		string
54	en_US	subtitle		string
54	fr_CA	abstract		string
54	en_US	abstract		string
54		datePublished	\N	string
54		pages		string
54		isPageEnabled	\N	string
54		licenseUrl	\N	string
55	fr_CA	title		string
56	fr_CA	subtitle		string
56	en_US	subtitle		string
56	fr_CA	abstract		string
56	en_US	abstract		string
56		datePublished	\N	string
56		pages		string
56		isPageEnabled	\N	string
56		licenseUrl	\N	string
57	fr_CA	title		string
57	en_US	title	Chapter 4: Braitenberg’s Vehicle 2	string
57	fr_CA	subtitle		string
57	en_US	subtitle		string
57	fr_CA	abstract		string
57	en_US	abstract		string
57		datePublished	\N	string
57		pages		string
57		isPageEnabled	\N	string
57		licenseUrl	\N	string
58	en_US	title	Setting the Stage	string
58	fr_CA	title		string
58	en_US	subtitle		string
61	en_US	subtitle		string
61	fr_CA	subtitle		string
61	en_US	abstract		string
61	fr_CA	abstract		string
61		datePublished	\N	string
61		pages		string
61		isPageEnabled	\N	string
61		licenseUrl	\N	string
62	en_US	title	Preface	string
62	fr_CA	title		string
62	en_US	subtitle		string
62	fr_CA	subtitle		string
62	en_US	abstract		string
62	fr_CA	abstract		string
62		datePublished	\N	string
62		pages		string
62		isPageEnabled	\N	string
62		licenseUrl	\N	string
63	en_US	title	The Case Studies	string
63	fr_CA	title		string
63	en_US	subtitle		string
63	fr_CA	subtitle		string
63	en_US	abstract		string
63	fr_CA	abstract		string
63		datePublished	\N	string
63		pages		string
63		isPageEnabled	\N	string
63		licenseUrl	\N	string
64	en_US	title	Conclusion	string
64	fr_CA	title		string
64	en_US	subtitle		string
64	fr_CA	subtitle		string
64	en_US	abstract		string
64	fr_CA	abstract		string
64		datePublished	\N	string
64		pages		string
64		isPageEnabled	\N	string
64		licenseUrl	\N	string
65	en_US	title	Bibliography	string
65	fr_CA	title		string
65	en_US	subtitle		string
65	fr_CA	subtitle		string
65	en_US	abstract		string
65	fr_CA	abstract		string
65		datePublished	\N	string
65		pages		string
65		isPageEnabled	\N	string
65		licenseUrl	\N	string
66	en_US	title	Preface	string
66	fr_CA	title		string
66	en_US	subtitle		string
66	fr_CA	subtitle		string
66	en_US	abstract		string
66	fr_CA	abstract		string
66		datePublished	\N	string
66		pages		string
66		isPageEnabled	\N	string
66		licenseUrl		string
67	en_US	title	Introduction	string
67	fr_CA	title		string
67	en_US	subtitle		string
67	fr_CA	subtitle		string
67	en_US	abstract		string
67	fr_CA	abstract		string
67		datePublished	\N	string
67		pages		string
67		isPageEnabled	\N	string
67		licenseUrl		string
68	en_US	title	The Emergence of Open Development in a Network Society	string
68	fr_CA	title		string
68	en_US	subtitle		string
68	fr_CA	subtitle		string
68	en_US	abstract		string
68	fr_CA	abstract		string
68		datePublished	\N	string
68		pages		string
68		isPageEnabled	\N	string
68		licenseUrl		string
69	en_US	title	Enacting Openness in ICT4D Research	string
69	fr_CA	title		string
69	en_US	subtitle		string
69	fr_CA	subtitle		string
69	en_US	abstract		string
69	fr_CA	abstract		string
69		datePublished	\N	string
69		pages		string
69		isPageEnabled	\N	string
69		licenseUrl		string
70	en_US	title	Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things	string
70	fr_CA	title		string
70	en_US	subtitle		string
70	fr_CA	subtitle		string
70	en_US	abstract		string
70	fr_CA	abstract		string
70		datePublished	\N	string
70		pages		string
70		isPageEnabled	\N	string
70		licenseUrl		string
71	en_US	title	Open Educational Resources: Opportunities and Challenges for the Developing World	string
71	fr_CA	title		string
71	en_US	subtitle		string
71	fr_CA	subtitle		string
71	en_US	abstract		string
71	fr_CA	abstract		string
71		datePublished	\N	string
71		pages		string
71		isPageEnabled	\N	string
71		licenseUrl		string
\.


--
-- Data for Name: submission_chapters; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_chapters (chapter_id, primary_contact_id, publication_id, seq, source_chapter_id, doi_id) FROM stdin;
27	\N	7	1	27	\N
28	\N	7	2	28	\N
1	\N	1	1	1	\N
2	\N	1	2	2	\N
3	\N	1	3	3	\N
29	\N	7	3	29	\N
30	\N	7	4	30	\N
31	\N	7	5	31	\N
37	\N	10	1	37	\N
38	\N	10	2	38	\N
39	\N	10	3	39	\N
40	\N	10	4	40	\N
41	\N	10	5	41	\N
4	\N	2	1	4	\N
5	\N	2	2	5	\N
6	\N	2	3	6	\N
7	\N	2	4	7	\N
42	\N	10	6	42	\N
43	\N	10	7	43	\N
44	\N	10	8	44	\N
45	\N	10	9	45	\N
17	\N	5	1	17	\N
18	\N	5	2	18	\N
19	\N	5	3	19	\N
20	\N	5	4	20	\N
21	\N	5	5	21	\N
22	\N	5	6	22	\N
8	\N	3	1	8	\N
9	\N	3	2	9	\N
10	\N	3	3	10	\N
11	\N	3	4	11	\N
12	\N	3	5	12	\N
46	\N	11	1	46	\N
47	\N	11	2	47	\N
58	\N	15	1	58	\N
32	\N	9	1	32	\N
13	\N	4	1	13	\N
14	\N	4	2	14	\N
15	\N	4	3	15	\N
33	\N	9	2	33	\N
16	\N	4	4	16	\N
23	\N	6	1	23	\N
24	\N	6	2	24	\N
25	\N	6	3	25	\N
34	\N	9	3	34	\N
26	\N	6	4	26	\N
35	\N	9	4	35	\N
59	\N	15	2	59	\N
36	\N	9	5	36	\N
60	\N	15	3	60	\N
48	\N	12	1	48	\N
49	\N	12	2	49	\N
50	\N	12	3	50	\N
66	\N	17	1	66	\N
51	\N	13	1	51	\N
52	\N	13	2	52	\N
53	\N	13	3	53	\N
67	\N	17	2	67	\N
68	\N	17	3	68	\N
69	\N	17	4	69	\N
70	\N	17	5	70	\N
71	\N	17	6	71	\N
61	\N	16	1	61	\N
62	\N	16	2	62	\N
63	\N	16	3	63	\N
64	\N	16	4	64	\N
65	\N	16	5	65	\N
54	\N	14	1	54	\N
55	\N	14	2	55	\N
56	\N	14	3	56	\N
57	\N	14	4	57	\N
\.


--
-- Name: submission_chapters_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_chapters_chapter_id_seq', 71, true);


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
1	1	4096	11	10	10		<p>I recommend that the author revise this submission.</p>	2022-10-29 16:23:01	\N	1
2	1	4096	11	11	12		<p>I recommend that the author resubmit this submission.</p>	2022-10-29 16:23:13	\N	1
3	1	4096	12	13	8		<p>I recommend declining this submission.</p>	2022-10-29 16:25:56	\N	1
4	1	4096	13	16	10		<p>I recommend requiring revisions.</p>	2022-10-29 16:28:11	\N	1
5	1	4096	13	18	12		<p>I recommend resubmitting.</p>	2022-10-29 16:28:24	\N	1
6	1	4096	16	21	10		<p>I recommend that the author revise this submission.</p>	2022-10-29 16:35:06	\N	1
\.


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 6, true);


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
38	38	18
39	39	17
40	40	16
41	41	21
42	42	22
43	43	23
44	44	24
45	45	25
46	46	26
47	47	26
48	48	24
49	49	25
50	50	23
51	51	22
52	52	27
53	53	28
54	54	28
55	55	29
56	56	30
57	57	31
58	58	31
59	59	30
60	60	29
61	61	32
62	62	33
63	63	34
64	64	34
65	65	33
66	66	32
67	67	35
68	68	36
69	69	37
70	70	38
71	71	39
72	72	40
73	73	40
74	74	38
75	75	39
76	76	37
77	77	36
78	78	35
79	79	40
80	80	39
81	81	38
82	82	37
83	83	36
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
95	95	48
96	96	47
97	97	46
98	98	45
99	99	44
100	100	43
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
38	en_US	name	Chapter 2: Learning Science at a Distanc.pdf	string
38		chapterId	29	string
39	en_US	name	Chapter 1: Interactions Affording Distan.pdf	string
39		chapterId	28	string
40	en_US	name	Introduction.pdf	string
40		chapterId	27	string
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
48	en_US	name	The internet in LAC will remain free, pu.pdf	string
48		chapterId	34	string
49	en_US	name	Free Internet?.pdf	string
49		chapterId	35	string
50	en_US	name	Imagining the Internet: Open, closed or .pdf	string
50		chapterId	33	string
51	en_US	name	Internet, openness and the future of the.pdf	string
51		chapterId	32	string
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
59	en_US	name	Catalyzing Access via Telecommunications.pdf	string
59		chapterId	49	string
60	en_US	name	Catalyzing Access through Social and Tec.pdf	string
60		chapterId	48	string
61	en_US	name	Current State of Mobile Learning.pdf	string
62	en_US	name	A Model for Framing Mobile Learning.pdf	string
63	en_US	name	Mobile Distance Learning with PDAs: Deve.pdf	string
61		chapterId	51	string
62		chapterId	52	string
63		chapterId	53	string
64	en_US	name	Mobile Distance Learning with PDAs: Deve.pdf	string
64		chapterId	53	string
65	en_US	name	A Model for Framing Mobile Learning.pdf	string
65		chapterId	52	string
66	en_US	name	Current State of Mobile Learning.pdf	string
66		chapterId	51	string
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
74	en_US	name	Chapter 4: Braitenberg’s Vehicle 2.pdf	string
74		chapterId	57	string
75	en_US	name	Segmentation of Vascular Ultrasound Imag.pdf	string
76	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
76		chapterId	56	string
77	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
77		chapterId	55	string
78	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
78		chapterId	54	string
85	en_US	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
86	en_US	name	Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf	string
84	en_US	name	Chapter 1: Mind Control—Internal or Exte.pdf	string
84		chapterId	54	string
87	en_US	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
83	en_US	name	Chapter 2: Classical Music and the Class.pdf	string
83		chapterId	55	string
88	en_US	name	A Designer's Log: Case Studies in Instructional Design.pdf	string
82	en_US	name	Chapter 3: Situated Cognition and Bricol.pdf	string
82		chapterId	56	string
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
95	en_US	name	Open Educational Resources: Opportunitie.pdf	string
95		chapterId	71	string
96	en_US	name	Transparency and Development: Ethical Co.pdf	string
96		chapterId	70	string
97	en_US	name	Enacting Openness in ICT4D Research.pdf	string
97		chapterId	69	string
98	en_US	name	The Emergence of Open Development in a N.pdf	string
98		chapterId	68	string
99	en_US	name	Introduction.pdf	string
99		chapterId	67	string
100	en_US	name	Preface.pdf	string
100		chapterId	66	string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id, doi_id) FROM stdin;
1	1	1	\N	3	2	\N	\N	\N	2022-10-29 16:05:24	2022-10-29 16:05:25	19	\N	\N	\N
2	1	1	1	3	4	\N	\N	\N	2022-10-29 16:05:53	2022-10-29 16:05:53	19	523	1	\N
3	2	2	\N	4	2	\N	\N	\N	2022-10-29 16:06:28	2022-10-29 16:06:29	20	\N	\N	\N
4	2	3	\N	4	2	\N	\N	\N	2022-10-29 16:06:29	2022-10-29 16:06:31	20	\N	\N	\N
5	2	4	\N	4	2	\N	\N	\N	2022-10-29 16:06:31	2022-10-29 16:06:32	20	\N	\N	\N
6	2	5	\N	4	2	\N	\N	\N	2022-10-29 16:06:33	2022-10-29 16:06:34	20	\N	\N	\N
7	2	5	6	4	4	\N	\N	\N	2022-10-29 16:08:00	2022-10-29 16:08:00	20	523	2	\N
8	2	4	5	4	4	\N	\N	\N	2022-10-29 16:08:01	2022-10-29 16:08:01	20	523	2	\N
9	2	3	4	4	4	\N	\N	\N	2022-10-29 16:08:01	2022-10-29 16:08:01	20	523	2	\N
10	2	2	3	4	4	\N	\N	\N	2022-10-29 16:08:01	2022-10-29 16:08:01	20	523	2	\N
11	3	6	\N	3	2	\N	\N	\N	2022-10-29 16:08:34	2022-10-29 16:08:35	21	\N	\N	\N
12	4	7	\N	4	2	\N	\N	\N	2022-10-29 16:09:13	2022-10-29 16:09:15	22	\N	\N	\N
13	4	8	\N	4	2	\N	\N	\N	2022-10-29 16:09:15	2022-10-29 16:09:16	22	\N	\N	\N
14	4	9	\N	4	2	\N	\N	\N	2022-10-29 16:09:16	2022-10-29 16:09:18	22	\N	\N	\N
15	4	10	\N	4	2	\N	\N	\N	2022-10-29 16:09:18	2022-10-29 16:09:20	22	\N	\N	\N
16	4	10	15	4	19	\N	\N	\N	2022-10-29 16:10:27	2022-10-29 16:10:27	22	523	3	\N
17	4	9	14	4	19	\N	\N	\N	2022-10-29 16:10:27	2022-10-29 16:10:27	22	523	3	\N
18	4	8	13	4	19	\N	\N	\N	2022-10-29 16:10:27	2022-10-29 16:10:27	22	523	3	\N
19	4	7	12	4	19	\N	\N	\N	2022-10-29 16:10:27	2022-10-29 16:10:27	22	523	3	\N
20	5	11	\N	3	2	\N	\N	\N	2022-10-29 16:11:57	2022-10-29 16:11:59	23	\N	\N	\N
21	5	11	20	3	19	\N	\N	\N	2022-10-29 16:12:43	2022-10-29 16:12:43	23	523	5	\N
22	5	11	20	3	10	0	openAccess	1	2022-10-29 16:13:58	2022-10-29 16:14:08	23	521	2	\N
23	6	12	\N	4	2	\N	\N	\N	2022-10-29 16:14:23	2022-10-29 16:14:25	24	\N	\N	\N
24	6	13	\N	4	2	\N	\N	\N	2022-10-29 16:14:25	2022-10-29 16:14:26	24	\N	\N	\N
25	6	14	\N	4	2	\N	\N	\N	2022-10-29 16:14:27	2022-10-29 16:14:28	24	\N	\N	\N
26	6	15	\N	4	2	\N	\N	\N	2022-10-29 16:14:28	2022-10-29 16:14:30	24	\N	\N	\N
27	6	15	26	4	19	\N	\N	\N	2022-10-29 16:15:34	2022-10-29 16:15:34	24	523	7	\N
28	6	14	25	4	19	\N	\N	\N	2022-10-29 16:15:34	2022-10-29 16:15:34	24	523	7	\N
29	6	13	24	4	19	\N	\N	\N	2022-10-29 16:15:34	2022-10-29 16:15:34	24	523	7	\N
30	6	12	23	4	19	\N	\N	\N	2022-10-29 16:15:34	2022-10-29 16:15:34	24	523	7	\N
31	7	16	\N	4	2	\N	\N	\N	2022-10-29 16:16:29	2022-10-29 16:16:30	25	\N	\N	\N
32	7	17	\N	4	2	\N	\N	\N	2022-10-29 16:16:30	2022-10-29 16:16:32	25	\N	\N	\N
33	7	18	\N	4	2	\N	\N	\N	2022-10-29 16:16:32	2022-10-29 16:16:33	25	\N	\N	\N
34	7	19	\N	4	2	\N	\N	\N	2022-10-29 16:16:34	2022-10-29 16:16:35	25	\N	\N	\N
35	7	20	\N	4	2	\N	\N	\N	2022-10-29 16:16:35	2022-10-29 16:16:37	25	\N	\N	\N
36	7	20	35	4	4	\N	\N	\N	2022-10-29 16:18:03	2022-10-29 16:18:03	25	523	8	\N
37	7	19	34	4	4	\N	\N	\N	2022-10-29 16:18:03	2022-10-29 16:18:03	25	523	8	\N
38	7	18	33	4	4	\N	\N	\N	2022-10-29 16:18:03	2022-10-29 16:18:03	25	523	8	\N
39	7	17	32	4	4	\N	\N	\N	2022-10-29 16:18:03	2022-10-29 16:18:03	25	523	8	\N
40	7	16	31	4	4	\N	\N	\N	2022-10-29 16:18:03	2022-10-29 16:18:03	25	523	8	\N
41	8	21	\N	3	2	\N	\N	\N	2022-10-29 16:18:49	2022-10-29 16:18:51	3	\N	\N	\N
42	9	22	\N	4	2	\N	\N	\N	2022-10-29 16:19:05	2022-10-29 16:19:06	26	\N	\N	\N
43	9	23	\N	4	2	\N	\N	\N	2022-10-29 16:19:06	2022-10-29 16:19:08	26	\N	\N	\N
44	9	24	\N	4	2	\N	\N	\N	2022-10-29 16:19:08	2022-10-29 16:19:09	26	\N	\N	\N
45	9	25	\N	4	2	\N	\N	\N	2022-10-29 16:19:10	2022-10-29 16:19:11	26	\N	\N	\N
46	9	26	\N	4	2	\N	\N	\N	2022-10-29 16:19:12	2022-10-29 16:19:13	26	\N	\N	\N
47	9	26	46	4	19	\N	\N	\N	2022-10-29 16:20:35	2022-10-29 16:20:35	26	523	9	\N
48	9	24	44	4	19	\N	\N	\N	2022-10-29 16:20:35	2022-10-29 16:20:35	26	523	9	\N
49	9	25	45	4	19	\N	\N	\N	2022-10-29 16:20:35	2022-10-29 16:20:35	26	523	9	\N
50	9	23	43	4	19	\N	\N	\N	2022-10-29 16:20:36	2022-10-29 16:20:36	26	523	9	\N
51	9	22	42	4	19	\N	\N	\N	2022-10-29 16:20:36	2022-10-29 16:20:36	26	523	9	\N
52	10	27	\N	3	2	\N	\N	\N	2022-10-29 16:20:52	2022-10-29 16:20:54	27	\N	\N	\N
53	11	28	\N	3	2	\N	\N	\N	2022-10-29 16:21:50	2022-10-29 16:21:52	28	\N	\N	\N
54	11	28	53	3	19	\N	\N	\N	2022-10-29 16:22:18	2022-10-29 16:22:18	28	523	10	\N
55	12	29	\N	4	2	\N	\N	\N	2022-10-29 16:23:50	2022-10-29 16:23:52	29	\N	\N	\N
56	12	30	\N	4	2	\N	\N	\N	2022-10-29 16:23:52	2022-10-29 16:23:53	29	\N	\N	\N
57	12	31	\N	4	2	\N	\N	\N	2022-10-29 16:23:54	2022-10-29 16:23:55	29	\N	\N	\N
58	12	31	57	4	19	\N	\N	\N	2022-10-29 16:25:13	2022-10-29 16:25:13	29	523	12	\N
59	12	30	56	4	19	\N	\N	\N	2022-10-29 16:25:13	2022-10-29 16:25:13	29	523	12	\N
60	12	29	55	4	19	\N	\N	\N	2022-10-29 16:25:13	2022-10-29 16:25:13	29	523	12	\N
61	13	32	\N	4	2	\N	\N	\N	2022-10-29 16:26:10	2022-10-29 16:26:11	30	\N	\N	\N
62	13	33	\N	4	2	\N	\N	\N	2022-10-29 16:26:12	2022-10-29 16:26:13	30	\N	\N	\N
63	13	34	\N	4	2	\N	\N	\N	2022-10-29 16:26:13	2022-10-29 16:26:15	30	\N	\N	\N
64	13	34	63	4	19	\N	\N	\N	2022-10-29 16:27:11	2022-10-29 16:27:11	30	523	13	\N
65	13	33	62	4	19	\N	\N	\N	2022-10-29 16:27:11	2022-10-29 16:27:11	30	523	13	\N
66	13	32	61	4	19	\N	\N	\N	2022-10-29 16:27:11	2022-10-29 16:27:11	30	523	13	\N
67	14	35	\N	4	2	\N	\N	\N	2022-10-29 16:29:05	2022-10-29 16:29:07	31	\N	\N	\N
68	14	36	\N	4	2	\N	\N	\N	2022-10-29 16:29:07	2022-10-29 16:29:08	31	\N	\N	\N
69	14	37	\N	4	2	\N	\N	\N	2022-10-29 16:29:09	2022-10-29 16:29:10	31	\N	\N	\N
70	14	38	\N	4	2	\N	\N	\N	2022-10-29 16:29:10	2022-10-29 16:29:12	31	\N	\N	\N
71	14	39	\N	13	2	\N	\N	\N	2022-10-29 16:29:12	2022-10-29 16:29:14	31	\N	\N	\N
72	14	40	\N	9	2	\N	\N	\N	2022-10-29 16:29:14	2022-10-29 16:29:16	31	\N	\N	\N
73	14	40	72	9	19	\N	\N	\N	2022-10-29 16:30:22	2022-10-29 16:30:22	31	523	15	\N
74	14	38	70	4	19	\N	\N	\N	2022-10-29 16:30:22	2022-10-29 16:30:22	31	523	15	\N
75	14	39	71	13	19	\N	\N	\N	2022-10-29 16:30:23	2022-10-29 16:30:23	31	523	15	\N
76	14	37	69	4	19	\N	\N	\N	2022-10-29 16:30:23	2022-10-29 16:30:23	31	523	15	\N
77	14	36	68	4	19	\N	\N	\N	2022-10-29 16:30:23	2022-10-29 16:30:23	31	523	15	\N
78	14	35	67	4	19	\N	\N	\N	2022-10-29 16:30:23	2022-10-29 16:30:23	31	523	15	\N
84	14	35	67	4	10	0	openAccess	1	2022-10-29 16:31:55	2022-10-29 16:32:07	31	521	3	\N
83	14	36	68	4	10	0	openAccess	1	2022-10-29 16:31:55	2022-10-29 16:32:13	31	521	3	\N
82	14	37	69	4	10	0	openAccess	1	2022-10-29 16:31:55	2022-10-29 16:32:19	31	521	3	\N
81	14	38	70	4	10	0	openAccess	1	2022-10-29 16:31:55	2022-10-29 16:32:26	31	521	3	\N
80	14	39	71	13	10	0	openAccess	1	2022-10-29 16:31:55	2022-10-29 16:32:33	31	521	3	\N
79	14	40	72	9	10	0	openAccess	1	2022-10-29 16:31:55	2022-10-29 16:32:40	31	521	3	\N
85	15	41	\N	3	2	\N	\N	\N	2022-10-29 16:32:57	2022-10-29 16:32:58	32	\N	\N	\N
86	15	41	85	3	4	\N	\N	\N	2022-10-29 16:33:31	2022-10-29 16:33:31	32	523	17	\N
87	16	42	\N	3	2	\N	\N	\N	2022-10-29 16:33:46	2022-10-29 16:33:47	33	\N	\N	\N
88	16	42	87	3	4	\N	\N	\N	2022-10-29 16:34:29	2022-10-29 16:34:29	33	523	18	\N
89	17	43	\N	4	2	\N	\N	\N	2022-10-29 16:35:19	2022-10-29 16:35:20	34	\N	\N	\N
90	17	44	\N	4	2	\N	\N	\N	2022-10-29 16:35:20	2022-10-29 16:35:22	34	\N	\N	\N
91	17	45	\N	4	2	\N	\N	\N	2022-10-29 16:35:22	2022-10-29 16:35:24	34	\N	\N	\N
92	17	46	\N	4	2	\N	\N	\N	2022-10-29 16:35:24	2022-10-29 16:35:25	34	\N	\N	\N
93	17	47	\N	4	2	\N	\N	\N	2022-10-29 16:35:26	2022-10-29 16:35:27	34	\N	\N	\N
94	17	48	\N	4	2	\N	\N	\N	2022-10-29 16:35:27	2022-10-29 16:35:29	34	\N	\N	\N
95	17	48	94	4	19	\N	\N	\N	2022-10-29 16:37:29	2022-10-29 16:37:29	34	523	19	\N
96	17	47	93	4	19	\N	\N	\N	2022-10-29 16:37:30	2022-10-29 16:37:30	34	523	19	\N
97	17	46	92	4	19	\N	\N	\N	2022-10-29 16:37:30	2022-10-29 16:37:30	34	523	19	\N
98	17	45	91	4	19	\N	\N	\N	2022-10-29 16:37:30	2022-10-29 16:37:30	34	523	19	\N
99	17	44	90	4	19	\N	\N	\N	2022-10-29 16:37:30	2022-10-29 16:37:30	34	523	19	\N
100	17	43	89	4	19	\N	\N	\N	2022-10-29 16:37:30	2022-10-29 16:37:30	34	523	19	\N
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
17	1	17	2022-10-29 16:37:53	2022-10-29 16:37:04	2022-10-29 16:37:04	2	en_US	1	0	1
15	1	15	2022-10-29 16:33:31	2022-10-29 16:33:14	2022-10-29 16:33:14	3	en_US	1	0	2
6	1	6	2022-10-29 16:16:01	2022-10-29 16:15:17	2022-10-29 16:15:17	2	en_US	1	0	1
9	1	9	2022-10-29 16:20:36	2022-10-29 16:20:16	2022-10-29 16:20:16	2	en_US	1	0	1
1	1	1	2022-10-29 16:06:15	2022-10-29 16:05:41	2022-10-29 16:05:41	4	en_US	1	0	2
12	1	12	2022-10-29 16:25:57	2022-10-29 16:24:54	2022-10-29 16:25:33	2	en_US	1	0	1
4	1	4	2022-10-29 16:11:46	2022-10-29 16:10:11	2022-10-29 16:10:11	5	en_US	1	0	1
10	1	10	2022-10-29 16:21:39	2022-10-29 16:21:39	2022-10-29 16:21:39	1	en_US	1	0	2
16	1	16	2022-10-29 16:35:06	2022-10-29 16:34:11	2022-10-29 16:34:39	3	en_US	1	0	2
2	1	2	2022-10-29 16:08:21	2022-10-29 16:07:43	2022-10-29 16:07:43	3	en_US	1	0	1
7	1	7	2022-10-29 16:18:35	2022-10-29 16:17:44	2022-10-29 16:17:44	4	en_US	1	0	1
3	1	3	2022-10-29 16:09:02	2022-10-29 16:09:01	2022-10-29 16:09:01	1	en_US	1	0	2
5	1	5	2022-10-29 16:14:10	2022-10-29 16:12:29	2022-10-29 16:12:29	5	en_US	3	0	2
8	1	8	2022-10-29 16:18:54	2022-10-29 16:18:53	2022-10-29 16:18:53	1	en_US	1	0	2
13	1	13	2022-10-29 16:28:48	2022-10-29 16:26:53	2022-10-29 16:27:57	4	en_US	1	0	1
11	1	11	2022-10-29 16:23:33	2022-10-29 16:22:03	2022-10-29 16:22:50	4	en_US	1	0	2
14	1	14	2022-10-29 16:32:44	2022-10-29 16:30:02	2022-10-29 16:30:02	5	en_US	3	0	1
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
-- Data for Name: usage_stats_institution_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_institution_temporary_records (load_id, line_number, institution_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_total_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_total_temporary_records (date, ip, user_agent, line_number, canonical_url, series_id, context_id, submission_id, chapter_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_unique_item_investigations_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_unique_item_investigations_temporary_records (date, ip, user_agent, line_number, context_id, submission_id, chapter_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_unique_item_requests_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_unique_item_requests_temporary_records (date, ip, user_agent, line_number, context_id, submission_id, chapter_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_unique_title_investigations_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_unique_title_investigations_temporary_records (date, ip, user_agent, line_number, context_id, submission_id, chapter_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_unique_title_requests_temporary_records; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.usage_stats_unique_title_requests_temporary_records (date, ip, user_agent, line_number, context_id, submission_id, chapter_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.user_group_settings (user_group_id, locale, setting_name, setting_value) FROM stdin;
1	en_US	name	Site Admin
1	fr_CA	name	Administrateur-trice du site
2	fr_CA	abbrev	MP
4	fr_CA	name	Directeur-trice de production
2	fr_CA	name	Gestionnaire de la presse
11	fr_CA	abbrev	CVM
15	en_US	name	Chapter Author
16	en_US	abbrev	Trans
16	en_US	name	Translator
16		abbrevLocaleKey	default.groups.abbrev.translator
14	en_US	name	Volume editor
9	fr_CA	abbrev	Indx
9	en_US	name	Indexer
2		nameLocaleKey	default.groups.name.manager
9		abbrevLocaleKey	default.groups.abbrev.indexer
3	fr_CA	abbrev	RP
3	fr_CA	name	Rédacteur/Rédactrice en chef de la presse
3	en_US	name	Press editor
3		abbrevLocaleKey	default.groups.abbrev.editor
4	fr_CA	abbrev	DirProd
4	en_US	name	Production editor
10	en_US	abbrev	LE
5	fr_CA	abbrev	RS
10	en_US	name	Layout Editor
10		nameLocaleKey	default.groups.name.layoutEditor
10		abbrevLocaleKey	default.groups.abbrev.layoutEditor
11	fr_CA	name	Coordonnateur-trice des ventes et du marketing
11	en_US	name	Marketing and sales coordinator
11		abbrevLocaleKey	default.groups.abbrev.marketing
15	en_US	abbrev	CA
12	fr_CA	abbrev	CorEp
5	en_US	name	Series editor
6	en_US	abbrev	CE
6	en_US	name	Copyeditor
6	fr_CA	name	Réviseur-e
13	fr_CA	abbrev	AU
13	fr_CA	name	Auteur-e
7	en_US	abbrev	Design
7	en_US	name	Designer
8	en_US	abbrev	FC
16	fr_CA	name	Traducteur-trice
16		nameLocaleKey	default.groups.name.translator
12	fr_CA	name	Correcteur-trice d'épreuves
6		nameLocaleKey	default.groups.name.copyeditor
6		abbrevLocaleKey	default.groups.abbrev.copyeditor
7		nameLocaleKey	default.groups.name.designer
3		nameLocaleKey	default.groups.name.editor
12	en_US	name	Proofreader
7		abbrevLocaleKey	default.groups.abbrev.designer
8	fr_CA	abbrev	CF
8	en_US	name	Funding coordinator
8		abbrevLocaleKey	default.groups.abbrev.funding
17	fr_CA	abbrev	EvalInt
12		nameLocaleKey	default.groups.name.proofreader
15	fr_CA	name	Auteur du chapitre
15		nameLocaleKey	default.groups.name.chapterAuthor
15		abbrevLocaleKey	default.groups.abbrev.chapterAuthor
13	en_US	abbrev	AU
17	en_US	abbrev	IR
17	fr_CA	name	Évaluateur-trice interne
9		nameLocaleKey	default.groups.name.indexer
10	fr_CA	abbrev	RespMP
10	fr_CA	name	Responsable de la mise en page
13		nameLocaleKey	default.groups.name.author
13		abbrevLocaleKey	default.groups.abbrev.author
11	en_US	abbrev	MS
11		nameLocaleKey	default.groups.name.marketing
16	fr_CA	abbrev	Trad
7	fr_CA	abbrev	Design
8	fr_CA	name	Coordonnateur-trice du financement
17	en_US	name	Internal Reviewer
2	en_US	abbrev	PM
8		nameLocaleKey	default.groups.name.funding
15	fr_CA	abbrev	AC
2	en_US	name	Press manager
2		abbrevLocaleKey	default.groups.abbrev.manager
4		nameLocaleKey	default.groups.name.productionEditor
12		abbrevLocaleKey	default.groups.abbrev.proofreader
5	en_US	abbrev	AcqE
17		nameLocaleKey	default.groups.name.internalReviewer
3	en_US	abbrev	PE
18	fr_CA	abbrev	EvEx
14	fr_CA	abbrev	RV
4		abbrevLocaleKey	default.groups.abbrev.productionEditor
5	fr_CA	name	Rédacteur/Rédactrice en chef de la série
5		nameLocaleKey	default.groups.name.sectionEditor
5		abbrevLocaleKey	default.groups.abbrev.sectionEditor
7	fr_CA	name	Designer
4	en_US	abbrev	ProdE
12	en_US	abbrev	PR
6	fr_CA	abbrev	RÉV
13	en_US	name	Author
9	en_US	abbrev	IND
9	fr_CA	name	Indexeur-e
18	en_US	abbrev	ER
17		abbrevLocaleKey	default.groups.abbrev.internalReviewer
18	fr_CA	name	Évaluateur-trice externe
19	en_US	abbrev	Read
14		abbrevLocaleKey	default.groups.abbrev.volumeEditor
18	en_US	name	External Reviewer
14	en_US	abbrev	VE
14	fr_CA	name	Rédacteur/Rédactrice en chef du volume
14		nameLocaleKey	default.groups.name.volumeEditor
18		nameLocaleKey	default.groups.name.externalReviewer
18		abbrevLocaleKey	default.groups.abbrev.externalReviewer
19	en_US	name	Reader
19		abbrevLocaleKey	default.groups.abbrev.reader
19	fr_CA	abbrev	Lect
19	fr_CA	name	Lecteur-trice
19		nameLocaleKey	default.groups.name.reader
14		recommendOnly	0
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
1	0	1	1	1	0	0
19	1	1048576	1	1	1	0
9	1	4097	1	1	0	0
10	1	4097	1	1	0	0
11	1	4097	1	1	0	0
15	1	65536	1	1	1	0
16	1	65536	1	1	0	0
2	1	16	1	1	0	1
3	1	16	1	1	0	1
4	1	16	1	1	0	1
12	1	4097	1	1	0	0
5	1	17	1	1	0	1
6	1	4097	1	1	0	0
13	1	65536	1	1	1	0
7	1	4097	1	1	0	0
8	1	4097	1	1	0	0
17	1	4096	1	1	0	0
18	1	4096	1	1	1	0
14	1	65536	1	1	1	0
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
3	fr_CA	preferredPublicName	
3	fr_CA	signature	
8	en_US	affiliation	McGill University
3	en_US	signature	
10	fr_CA	affiliation	
3	en_US	biography	
3	en_US	familyName	Barnes
6	en_US	affiliation	Kyoto University
3	fr_CA	givenName	
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
3	en_US	preferredPublicName	
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
33	mpower	$2y$10$2X10nC1LB1aaZ2aTkeoxTub2Z9ONRbjiqU9eoQqMm7OCOxl.7tRzO	mpower@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:33:39	\N	2022-10-29 16:33:40	\N	\N	\N	0	\N	1
6	minoue	$2y$10$jgjn7pANyhASBolTv2kqZeYwhOEPJD8mGPuceKhKYkhWnG9ME/CS6	minoue@mailinator.com				\N	JP	[]	\N	\N	2022-10-29 16:02:06	\N	2022-10-29 16:15:48	0	\N	\N	0	\N	1
8	phudson	$2y$10$Q6OJ6sj.lftOwf51axL1s.WWRm/HIxbXgK1z1gQMgbDdZVnlu8DOy	phudson@mailinator.com				\N	CA	[]	\N	\N	2022-10-29 16:02:23	\N	2022-10-29 16:25:45	0	\N	\N	0	\N	1
25	dkennepohl	$2y$10$mYHUOR3lqTx64ZJTn6/.fecnNKbbM.t32qmqCgPKIJBP015Id.FBC	dkennepohl@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:16:22	\N	2022-10-29 16:16:23	\N	\N	\N	0	\N	1
4	dbuskins	$2y$10$TZLj5P3YcNES4wAd/kxrPemMXr0PNvlX8KaeN9rJ9X6oW0lnoDAOm	dbuskins@mailinator.com				\N	US	[]	\N	\N	2022-10-29 16:01:52	\N	\N	0	\N	\N	0	\N	1
5	sberardo	$2y$10$b4vd3P1Gaew8UpQGYMet.uxs0uBl9FE5z7xvt0V9gRMic3gzQkM02	sberardo@mailinator.com				\N	CA	[]	\N	\N	2022-10-29 16:01:59	\N	\N	0	\N	\N	0	\N	1
7	jjanssen	$2y$10$rnZN4scLMBiUrvpdWSSAXeksxC2lbXjzO/7h/f.qffeE6lb/kzl8G	jjanssen@mailinator.com				\N	NL	[]	\N	\N	2022-10-29 16:02:15	\N	\N	0	\N	\N	0	\N	1
9	amccrae	$2y$10$7nR2YslwEiWDoXeAcDUfguN7e0M0d59h/xqRgY4i8hjbMhhCISjTK	amccrae@mailinator.com				\N	CA	[]	\N	\N	2022-10-29 16:02:32	\N	\N	0	\N	\N	0	\N	1
11	alzacharia	$2y$10$DBi7u5CTwWivdJPCiY175erbD6mre5Uew1/dLjIBg5kGuVWJbqM56	alzacharia@mailinator.com				\N	GH	[]	\N	\N	2022-10-29 16:02:51	\N	\N	0	\N	\N	0	\N	1
13	mfritz	$2y$10$J2UylpTIp7mva2USlSABo.m/pGBooL86ZmGg442SUzy1tEOVtnDr2	mfritz@mailinator.com				\N	BE	[]	\N	\N	2022-10-29 16:03:13	\N	\N	0	\N	\N	0	\N	1
14	svogt	$2y$10$DEEevo3ktbdYVYGlnMHabe3zRLTrdyOCTbxWiSSFIfuHJIfcqsGYO	svogt@mailinator.com				\N	CL	[]	\N	\N	2022-10-29 16:03:24	\N	\N	0	\N	\N	0	\N	1
15	gcox	$2y$10$hzkRSwSIu7W5WWaY981BcOaSzOys2JCvfrsC44HZyWmRNYyB5VM8y	gcox@mailinator.com				\N	US	[]	\N	\N	2022-10-29 16:03:35	\N	\N	0	\N	\N	0	\N	1
16	shellier	$2y$10$.IfCHVl9radsd5APNY7QcuLPzmmWJ1Yi4rkiRoSWbN6.iUY0B2POC	shellier@mailinator.com				\N	ZA	[]	\N	\N	2022-10-29 16:03:48	\N	\N	0	\N	\N	0	\N	1
17	cturner	$2y$10$4lyQ6Bbqkr.5figJ0Eqoq.EO1bvBRzzDPmJXaORAboDvTFlPyd8.u	cturner@mailinator.com				\N	GB	[]	\N	\N	2022-10-29 16:04:02	\N	\N	0	\N	\N	0	\N	1
18	skumar	$2y$10$STcFwUJUZnb9qEaz93NtnuhBZNsucW/6OpIWVaW0mXxdwsyyMhf7W	skumar@mailinator.com				\N	SG	[]	\N	\N	2022-10-29 16:04:15	\N	\N	0	\N	\N	0	\N	1
30	mally	$2y$10$ZEO9EjVqeO4d/1dCSeo4FeuBt5c9cxMYfpeuIR4IK3jbD8vQ0BiRG	mally@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:26:04	\N	2022-10-29 16:26:04	\N	\N	\N	0	\N	1
2	rvaca	$2y$10$lu2NfW5quD3M3ZNvwIx.Nuvr2jwbpPHo7jfvV8YOhqT4HtlNdrBbS	rvaca@mailinator.com				\N	MX	[]	\N	\N	2022-10-29 16:01:39	\N	2022-10-29 16:04:26	0	\N	\N	0	\N	1
26	fperini	$2y$10$xB2o548jyA37GQOQqtE6v.E1u6OWxokjaYgAItih1PkLxlqUbTETq	fperini@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:18:59	\N	2022-10-29 16:18:59	\N	\N	\N	0	\N	1
1	admin	$2y$10$vkdlyFhgj5Ahn2lMNDzgZuuTcPR6r08WwW9b6MkSlT2r/oHsl81kS	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	[]	\N	\N	2022-10-29 16:00:09	\N	2022-10-29 16:04:55	\N	\N	\N	0	\N	1
19	aclark	$2y$10$HXW5O13c6vNuf2tXji8PU.lJlTq08kqc9bAEH3CriMXK2pL8dIIfq	aclark@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:05:17	\N	2022-10-29 16:05:18	\N	\N	\N	0	\N	1
20	afinkel	$2y$10$N59ioEJTygMWo9aRWnfsd.IY05ewXDxK2On92OwTX595/opzGHK3S	afinkel@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:06:22	\N	2022-10-29 16:06:22	\N	\N	\N	0	\N	1
21	bbarnetson	$2y$10$ZjgFokGySYLZ8Yp5GcPDjOp9PfR8spbZzQmz9yGS2aNbo9V455PPa	bbarnetson@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:08:28	\N	2022-10-29 16:08:28	\N	\N	\N	0	\N	1
22	bbeaty	$2y$10$.yf1I11YZ2aIu/tZ/zzyuegnUkTpvB5/RQlNsThDIkfvK5EoMX7QO	bbeaty@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:09:07	\N	2022-10-29 16:09:07	\N	\N	\N	0	\N	1
27	jbrower	$2y$10$z0T64URp8e5D1zezMCtFH.KyhYJd9VcQZdFAYqu.4LYlFzxsr97wu	jbrower@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:20:46	\N	2022-10-29 16:20:46	\N	\N	\N	0	\N	1
23	callan	$2y$10$GF2MWsd.TrrTJ4F6Ak0Bhe4n4Lp828EPCyD5SXtr1PszCAHeSpxnG	callan@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:11:51	\N	2022-10-29 16:11:51	\N	\N	\N	0	\N	1
24	dbernnard	$2y$10$vWhh6LW/vZ9HrkJULev37.K3.KyFGO4v1HL3hlyfssOigXUd0cGMa	dbernnard@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2022-10-29 16:14:17	\N	2022-10-29 16:14:17	\N	\N	\N	0	\N	1
28	jlockehart	$2y$10$RlLRRBJIINF42gzVu9T5pOzfjb1Jlrh3l/6BnuiFu.vwTxh061q16	jlockehart@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:21:44	\N	2022-10-29 16:21:45	\N	\N	\N	0	\N	1
12	gfavio	$2y$10$NqTG/vBQbUcKUJKJkKnUpu8H8Lt.r3VDobi.SuIqaZ3OX2PjlEYUC	gfavio@mailinator.com				\N	ES	[]	\N	\N	2022-10-29 16:03:02	\N	2022-10-29 16:28:13	0	\N	\N	0	\N	1
10	agallego	$2y$10$23r5VeM8MOavl6RHr6/x0upUb0tgF9j/GUDhp41iN/MDc14Zju0a.	agallego@mailinator.com				\N	US	[]	\N	\N	2022-10-29 16:02:41	\N	2022-10-29 16:34:56	0	\N	\N	0	\N	1
34	msmith	$2y$10$QBr8M9/Abk1Gt8CtD66Sle67pcLhYoqphsDXznhK71gWsipnyEQM6	msmith@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:35:13	\N	2022-10-29 16:35:13	\N	\N	\N	0	\N	1
29	lelder	$2y$10$tN0QI2e6xlzEoFqGuNU3F.SBrGFmNYI8cZGLl7gGbpceuAWRUI56m	lelder@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:23:44	\N	2022-10-29 16:23:44	\N	\N	\N	0	\N	1
3	dbarnes	$2y$10$fVmmrXy/mbFAd5OhXGndk.phBSblWc8e2349cr57uNm0wRYoLzhZO	dbarnes@mailinator.com				\N	AU	[]	\N	\N	2022-10-29 16:01:45	\N	2022-10-29 16:37:07	0	\N	\N	0	\N	1
31	mdawson	$2y$10$HaVoD0mhpdUO2xWUBViXVOcwUxNdDhLWWLZSEV6EtIxNHCsvrvwh6	mdawson@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:28:59	\N	2022-10-29 16:28:59	\N	\N	\N	0	\N	1
32	mforan	$2y$10$uKlkrPEZ4L0w4udCJ3Wif.sB6oX8hq2JfpI8B3NAbJxfUivwvMrAu	mforan@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2022-10-29 16:32:51	\N	2022-10-29 16:32:51	\N	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: omp-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 34, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: omp-ci
--

COPY public.versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2022-10-29 16:00:09	1	plugins.metadata	dc11		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.pubIds	urn	\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin	0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.blocks	information	InformationBlockPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.blocks	browse	\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.blocks	makeSubmission	MakeSubmissionBlockPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	dublinCoreMeta	DublinCoreMetaPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	usageEvent		0	1
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	2	0	0	2022-10-29 16:00:09	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	htmlMonographFile	HtmlMonographFilePlugin	1	0
1	3	0	0	2022-10-29 16:00:09	1	plugins.generic	acron	AcronPlugin	1	1
1	2	0	0	2022-10-29 16:00:09	1	plugins.generic	staticPages	StaticPagesPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.themes	default	DefaultThemePlugin	1	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.importexport	users		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.importexport	csv		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.importexport	onix30		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.importexport	native		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.paymethod	manual		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.paymethod	paypal		0	0
1	0	0	0	2022-10-29 16:00:09	1	plugins.reports	monographReport		0	0
2	0	0	0	2022-10-29 16:00:09	1	plugins.reports	reviewReport		0	0
3	4	0	0	2022-10-29 16:00:08	1	core	omp		0	1
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
-- Name: institution_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institution_ip
    ADD CONSTRAINT institution_ip_pkey PRIMARY KEY (institution_ip_id);


--
-- Name: institution_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institution_settings
    ADD CONSTRAINT institution_settings_pkey UNIQUE (institution_id, locale, setting_name);


--
-- Name: institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (institution_id);


--
-- Name: item_views_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_pkey UNIQUE (assoc_type, assoc_id, user_id);


--
-- Name: job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


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
-- Name: mailable_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.mailable_templates
    ADD CONSTRAINT mailable_templates_pkey PRIMARY KEY (email_id, mailable_id);


--
-- Name: markets_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (market_id);


--
-- Name: msd_uc_load_id_context_id_submission_id_date; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT msd_uc_load_id_context_id_submission_id_date UNIQUE (load_id, context_id, submission_id, date);


--
-- Name: msgd_uc_load_context_submission_c_r_c_date; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT msgd_uc_load_context_submission_c_r_c_date UNIQUE (load_id, context_id, submission_id, country, region, city, date);


--
-- Name: msgm_uc_context_submission_c_r_c_month; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT msgm_uc_context_submission_c_r_c_month UNIQUE (context_id, submission_id, country, region, city, month);


--
-- Name: msid_uc_load_id_context_id_submission_id_institution_id_date; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_uc_load_id_context_id_submission_id_institution_id_date UNIQUE (load_id, context_id, submission_id, institution_id, date);


--
-- Name: msim_uc_context_id_submission_id_institution_id_month; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_uc_context_id_submission_id_institution_id_month UNIQUE (context_id, submission_id, institution_id, month);


--
-- Name: msm_uc_context_id_submission_id_month; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT msm_uc_context_id_submission_id_month UNIQUE (context_id, submission_id, month);


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
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: usi_load_id_line_number_institution_id; Type: CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_institution_temporary_records
    ADD CONSTRAINT usi_load_id_line_number_institution_id UNIQUE (load_id, line_number, institution_id);


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
-- Name: access_keys_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX access_keys_user_id ON public.access_keys USING btree (user_id);


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
-- Name: announcements_type_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX announcements_type_id ON public.announcements USING btree (type_id);


--
-- Name: author_settings_author_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX author_settings_author_id ON public.author_settings USING btree (author_id);


--
-- Name: authors_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX authors_user_group_id ON public.authors USING btree (user_group_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id);


--
-- Name: category_context_parent_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX category_context_parent_id ON public.categories USING btree (context_id, parent_id);


--
-- Name: category_parent_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX category_parent_id ON public.categories USING btree (parent_id);


--
-- Name: category_settings_category_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX category_settings_category_id ON public.category_settings USING btree (category_id);


--
-- Name: chapters_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX chapters_chapter_id ON public.submission_chapters USING btree (chapter_id);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX citation_settings_citation_id ON public.citation_settings USING btree (citation_id);


--
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: completed_payments_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX completed_payments_context_id ON public.completed_payments USING btree (context_id);


--
-- Name: completed_payments_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX completed_payments_user_id ON public.completed_payments USING btree (user_id);


--
-- Name: controlled_vocab_entries_controlled_vocab_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX controlled_vocab_entries_controlled_vocab_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id);


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
-- Name: dois_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX dois_context_id ON public.dois USING btree (context_id);


--
-- Name: edit_decisions_editor_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX edit_decisions_editor_id ON public.edit_decisions USING btree (editor_id);


--
-- Name: edit_decisions_review_round_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX edit_decisions_review_round_id ON public.edit_decisions USING btree (review_round_id);


--
-- Name: edit_decisions_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX edit_decisions_submission_id ON public.edit_decisions USING btree (submission_id);


--
-- Name: email_log_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_log_assoc ON public.email_log USING btree (assoc_type, assoc_id);


--
-- Name: email_log_users_email_log_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_log_users_email_log_id ON public.email_log_users USING btree (email_log_id);


--
-- Name: email_log_users_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_log_users_user_id ON public.email_log_users USING btree (user_id);


--
-- Name: email_templates_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_templates_context_id ON public.email_templates USING btree (context_id);


--
-- Name: email_templates_settings_email_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX email_templates_settings_email_id ON public.email_templates_settings USING btree (email_id);


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
-- Name: event_log_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX event_log_user_id ON public.event_log USING btree (user_id);


--
-- Name: features_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX features_submission_id ON public.features USING btree (submission_id);


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


--
-- Name: filters_filter_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX filters_filter_group_id ON public.filters USING btree (filter_group_id);


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
-- Name: genres_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX genres_context_id ON public.genres USING btree (context_id);


--
-- Name: identification_codes_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX identification_codes_key ON public.identification_codes USING btree (identification_code_id, publication_format_id, code);


--
-- Name: identification_codes_publication_format_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX identification_codes_publication_format_id ON public.identification_codes USING btree (publication_format_id);


--
-- Name: institution_ip_end; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX institution_ip_end ON public.institution_ip USING btree (ip_end);


--
-- Name: institution_ip_institution_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX institution_ip_institution_id ON public.institution_ip USING btree (institution_id);


--
-- Name: institution_ip_start; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX institution_ip_start ON public.institution_ip USING btree (ip_start);


--
-- Name: institution_settings_institution_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX institution_settings_institution_id ON public.institution_settings USING btree (institution_id);


--
-- Name: institutions_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX institutions_context_id ON public.institutions USING btree (context_id);


--
-- Name: item_views_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX item_views_user_id ON public.item_views USING btree (user_id);


--
-- Name: jobs_queue_reserved_at_index; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX jobs_queue_reserved_at_index ON public.jobs USING btree (queue, reserved_at);


--
-- Name: library_file_settings_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_file_settings_file_id ON public.library_file_settings USING btree (file_id);


--
-- Name: library_files_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_files_context_id ON public.library_files USING btree (context_id);


--
-- Name: library_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX library_files_submission_id ON public.library_files USING btree (submission_id);


--
-- Name: mailable_templates_email_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX mailable_templates_email_id ON public.mailable_templates USING btree (email_id);


--
-- Name: markets_publication_format_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX markets_publication_format_id ON public.markets USING btree (publication_format_id);


--
-- Name: metrics_context_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_context_context_id ON public.metrics_context USING btree (context_id);


--
-- Name: metrics_context_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_context_load_id ON public.metrics_context USING btree (load_id);


--
-- Name: metrics_counter_submission_daily_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_counter_submission_daily_context_id ON public.metrics_counter_submission_daily USING btree (context_id);


--
-- Name: metrics_counter_submission_daily_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_counter_submission_daily_submission_id ON public.metrics_counter_submission_daily USING btree (submission_id);


--
-- Name: metrics_counter_submission_monthly_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_counter_submission_monthly_context_id ON public.metrics_counter_submission_monthly USING btree (context_id);


--
-- Name: metrics_counter_submission_monthly_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_counter_submission_monthly_submission_id ON public.metrics_counter_submission_monthly USING btree (submission_id);


--
-- Name: metrics_series_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_series_context_id ON public.metrics_series USING btree (context_id);


--
-- Name: metrics_series_context_id_series_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_series_context_id_series_id ON public.metrics_series USING btree (context_id, series_id);


--
-- Name: metrics_series_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_series_load_id ON public.metrics_series USING btree (load_id);


--
-- Name: metrics_series_series_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_series_series_id ON public.metrics_series USING btree (series_id);


--
-- Name: metrics_submission_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_chapter_id ON public.metrics_submission USING btree (chapter_id);


--
-- Name: metrics_submission_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_context_id ON public.metrics_submission USING btree (context_id);


--
-- Name: metrics_submission_geo_daily_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_geo_daily_context_id ON public.metrics_submission_geo_daily USING btree (context_id);


--
-- Name: metrics_submission_geo_daily_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_geo_daily_submission_id ON public.metrics_submission_geo_daily USING btree (submission_id);


--
-- Name: metrics_submission_geo_monthly_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_geo_monthly_context_id ON public.metrics_submission_geo_monthly USING btree (context_id);


--
-- Name: metrics_submission_geo_monthly_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_geo_monthly_submission_id ON public.metrics_submission_geo_monthly USING btree (submission_id);


--
-- Name: metrics_submission_representation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_representation_id ON public.metrics_submission USING btree (representation_id);


--
-- Name: metrics_submission_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_submission_file_id ON public.metrics_submission USING btree (submission_file_id);


--
-- Name: metrics_submission_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX metrics_submission_submission_id ON public.metrics_submission USING btree (submission_id);


--
-- Name: ms_context_id_submission_id_assoc_type_file_type; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ms_context_id_submission_id_assoc_type_file_type ON public.metrics_submission USING btree (context_id, submission_id, assoc_type, file_type);


--
-- Name: ms_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ms_load_id ON public.metrics_submission USING btree (load_id);


--
-- Name: msd_context_id_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msd_context_id_submission_id ON public.metrics_counter_submission_daily USING btree (context_id, submission_id);


--
-- Name: msd_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msd_load_id ON public.metrics_counter_submission_daily USING btree (load_id);


--
-- Name: msgd_context_id_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msgd_context_id_submission_id ON public.metrics_submission_geo_daily USING btree (context_id, submission_id);


--
-- Name: msgd_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msgd_load_id ON public.metrics_submission_geo_daily USING btree (load_id);


--
-- Name: msgm_context_id_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msgm_context_id_submission_id ON public.metrics_submission_geo_monthly USING btree (context_id, submission_id);


--
-- Name: msid_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msid_context_id ON public.metrics_counter_submission_institution_daily USING btree (context_id);


--
-- Name: msid_context_id_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msid_context_id_submission_id ON public.metrics_counter_submission_institution_daily USING btree (context_id, submission_id);


--
-- Name: msid_institution_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msid_institution_id ON public.metrics_counter_submission_institution_daily USING btree (institution_id);


--
-- Name: msid_load_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msid_load_id ON public.metrics_counter_submission_institution_daily USING btree (load_id);


--
-- Name: msid_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msid_submission_id ON public.metrics_counter_submission_institution_daily USING btree (submission_id);


--
-- Name: msim_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msim_context_id ON public.metrics_counter_submission_institution_monthly USING btree (context_id);


--
-- Name: msim_context_id_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msim_context_id_submission_id ON public.metrics_counter_submission_institution_monthly USING btree (context_id, submission_id);


--
-- Name: msim_institution_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msim_institution_id ON public.metrics_counter_submission_institution_monthly USING btree (institution_id);


--
-- Name: msim_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msim_submission_id ON public.metrics_counter_submission_institution_monthly USING btree (submission_id);


--
-- Name: msm_context_id_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX msm_context_id_submission_id ON public.metrics_counter_submission_monthly USING btree (context_id, submission_id);


--
-- Name: navigation_menu_item_assignment_settings_n_m_i_a_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX navigation_menu_item_assignment_settings_n_m_i_a_id ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_assignments_navigation_menu_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX navigation_menu_item_assignments_navigation_menu_id ON public.navigation_menu_item_assignments USING btree (navigation_menu_id);


--
-- Name: navigation_menu_item_assignments_navigation_menu_item_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX navigation_menu_item_assignments_navigation_menu_item_id ON public.navigation_menu_item_assignments USING btree (navigation_menu_item_id);


--
-- Name: navigation_menu_item_settings_navigation_menu_item_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_item_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: new_releases_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX new_releases_submission_id ON public.new_releases USING btree (submission_id);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


--
-- Name: notes_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notes_user_id ON public.notes USING btree (user_id);


--
-- Name: notification_settings_notification_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notification_settings_notification_id ON public.notification_settings USING btree (notification_id);


--
-- Name: notification_subscription_settings_context; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notification_subscription_settings_context ON public.notification_subscription_settings USING btree (context);


--
-- Name: notification_subscription_settings_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX notification_subscription_settings_user_id ON public.notification_subscription_settings USING btree (user_id);


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
-- Name: publication_categories_category_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_categories_category_id ON public.publication_categories USING btree (category_id);


--
-- Name: publication_categories_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_categories_publication_id ON public.publication_categories USING btree (publication_id);


--
-- Name: publication_dates_publication_format_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_dates_publication_format_id ON public.publication_dates USING btree (publication_format_id);


--
-- Name: publication_format_id_key; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_format_id_key ON public.publication_format_settings USING btree (publication_format_id);


--
-- Name: publication_format_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_format_submission_id ON public.publication_formats USING btree (submission_id);


--
-- Name: publication_formats_doi_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_formats_doi_id ON public.publication_formats USING btree (doi_id);


--
-- Name: publication_formats_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_formats_publication_id ON public.publication_formats USING btree (publication_id);


--
-- Name: publication_settings_name_value; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publication_settings_name_value ON public.publication_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['indexingState'::character varying, 'medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying, 'pub-id::publisher-id'::character varying])::text[]));


--
-- Name: publications_doi_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publications_doi_id ON public.publications USING btree (doi_id);


--
-- Name: publications_primary_contact_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX publications_primary_contact_id ON public.publications USING btree (primary_contact_id);


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
-- Name: query_participants_query_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX query_participants_query_id ON public.query_participants USING btree (query_id);


--
-- Name: query_participants_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX query_participants_user_id ON public.query_participants USING btree (user_id);


--
-- Name: representatives_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX representatives_submission_id ON public.representatives USING btree (submission_id);


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
-- Name: review_files_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_files_submission_file_id ON public.review_files USING btree (submission_file_id);


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
-- Name: review_form_responses_review_form_element_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_responses_review_form_element_id ON public.review_form_responses USING btree (review_form_element_id);


--
-- Name: review_form_responses_review_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_responses_review_id ON public.review_form_responses USING btree (review_id);


--
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_form_settings_review_form_id ON public.review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_round_files_submission_file_id ON public.review_round_files USING btree (submission_file_id);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: sales_rights_publication_format_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX sales_rights_publication_format_id ON public.sales_rights USING btree (publication_format_id);


--
-- Name: series_categories_category_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_categories_category_id ON public.series_categories USING btree (category_id);


--
-- Name: series_categories_series_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_categories_series_id ON public.series_categories USING btree (series_id);


--
-- Name: series_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_press_id ON public.series USING btree (press_id);


--
-- Name: series_review_form_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_review_form_id ON public.series USING btree (review_form_id);


--
-- Name: series_settings_series_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX series_settings_series_id ON public.series_settings USING btree (series_id);


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
-- Name: spotlights_press_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX spotlights_press_id ON public.spotlights USING btree (press_id);


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
-- Name: subeditor_submission_group_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX subeditor_submission_group_context_id ON public.subeditor_submission_group USING btree (context_id);


--
-- Name: subeditor_submission_group_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX subeditor_submission_group_user_id ON public.subeditor_submission_group USING btree (user_id);


--
-- Name: submission_chapter_authors_author_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapter_authors_author_id ON public.submission_chapter_authors USING btree (author_id);


--
-- Name: submission_chapter_authors_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapter_authors_chapter_id ON public.submission_chapter_authors USING btree (chapter_id);


--
-- Name: submission_chapter_settings_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapter_settings_chapter_id ON public.submission_chapter_settings USING btree (chapter_id);


--
-- Name: submission_chapters_primary_contact_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapters_primary_contact_id ON public.submission_chapters USING btree (primary_contact_id);


--
-- Name: submission_chapters_publication_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapters_publication_id ON public.submission_chapters USING btree (publication_id);


--
-- Name: submission_chapters_source_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_chapters_source_chapter_id ON public.submission_chapters USING btree (source_chapter_id);


--
-- Name: submission_comments_author_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_comments_author_id ON public.submission_comments USING btree (author_id);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_comments_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: submission_file_revisions_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_file_revisions_file_id ON public.submission_file_revisions USING btree (file_id);


--
-- Name: submission_file_revisions_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_file_revisions_submission_file_id ON public.submission_file_revisions USING btree (submission_file_id);


--
-- Name: submission_file_settings_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_file_settings_submission_file_id ON public.submission_file_settings USING btree (submission_file_id);


--
-- Name: submission_files_doi_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_doi_id ON public.submission_files USING btree (doi_id);


--
-- Name: submission_files_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_file_id ON public.submission_files USING btree (file_id);


--
-- Name: submission_files_genre_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_genre_id ON public.submission_files USING btree (genre_id);


--
-- Name: submission_files_source_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_source_submission_file_id ON public.submission_files USING btree (source_submission_file_id);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_files_uploader_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_files_uploader_user_id ON public.submission_files USING btree (uploader_user_id);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_keywords_object_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_search_object_keywords_object_id ON public.submission_search_object_keywords USING btree (object_id);


--
-- Name: submission_search_objects_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX submission_search_objects_submission_id ON public.submission_search_objects USING btree (submission_id);


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
-- Name: user_group_settings_user_group_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_group_settings_user_group_id ON public.user_group_settings USING btree (user_group_id);


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
-- Name: user_interests_controlled_vocab_entry_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_interests_controlled_vocab_entry_id ON public.user_interests USING btree (controlled_vocab_entry_id);


--
-- Name: user_interests_user_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX user_interests_user_id ON public.user_interests USING btree (user_id);


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
-- Name: users_email; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX users_email ON public.users USING btree (lower((email)::text));


--
-- Name: users_username; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE UNIQUE INDEX users_username ON public.users USING btree (lower((username)::text));


--
-- Name: usi_institution_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usi_institution_id ON public.usage_stats_institution_temporary_records USING btree (institution_id);


--
-- Name: usii_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usii_chapter_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (chapter_id);


--
-- Name: usii_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usii_context_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (context_id);


--
-- Name: usii_representation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usii_representation_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (representation_id);


--
-- Name: usii_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usii_submission_file_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (submission_file_id);


--
-- Name: usii_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usii_submission_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (submission_id);


--
-- Name: usir_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usir_chapter_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (chapter_id);


--
-- Name: usir_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usir_context_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (context_id);


--
-- Name: usir_representation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usir_representation_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (representation_id);


--
-- Name: usir_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usir_submission_file_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (submission_file_id);


--
-- Name: usir_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usir_submission_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (submission_id);


--
-- Name: ust_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ust_chapter_id ON public.usage_stats_total_temporary_records USING btree (chapter_id);


--
-- Name: ust_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ust_context_id ON public.usage_stats_total_temporary_records USING btree (context_id);


--
-- Name: ust_representation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ust_representation_id ON public.usage_stats_total_temporary_records USING btree (representation_id);


--
-- Name: ust_series_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ust_series_id ON public.usage_stats_total_temporary_records USING btree (series_id);


--
-- Name: ust_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ust_submission_file_id ON public.usage_stats_total_temporary_records USING btree (submission_file_id);


--
-- Name: ust_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ust_submission_id ON public.usage_stats_total_temporary_records USING btree (submission_id);


--
-- Name: usti_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usti_chapter_id ON public.usage_stats_unique_title_investigations_temporary_records USING btree (chapter_id);


--
-- Name: usti_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usti_context_id ON public.usage_stats_unique_title_investigations_temporary_records USING btree (context_id);


--
-- Name: usti_representation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usti_representation_id ON public.usage_stats_unique_title_investigations_temporary_records USING btree (representation_id);


--
-- Name: usti_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usti_submission_file_id ON public.usage_stats_unique_title_investigations_temporary_records USING btree (submission_file_id);


--
-- Name: usti_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX usti_submission_id ON public.usage_stats_unique_title_investigations_temporary_records USING btree (submission_id);


--
-- Name: ustr_chapter_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ustr_chapter_id ON public.usage_stats_unique_title_requests_temporary_records USING btree (chapter_id);


--
-- Name: ustr_context_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ustr_context_id ON public.usage_stats_unique_title_requests_temporary_records USING btree (context_id);


--
-- Name: ustr_representation_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ustr_representation_id ON public.usage_stats_unique_title_requests_temporary_records USING btree (representation_id);


--
-- Name: ustr_submission_file_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ustr_submission_file_id ON public.usage_stats_unique_title_requests_temporary_records USING btree (submission_file_id);


--
-- Name: ustr_submission_id; Type: INDEX; Schema: public; Owner: omp-ci
--

CREATE INDEX ustr_submission_id ON public.usage_stats_unique_title_requests_temporary_records USING btree (submission_id);


--
-- Name: access_keys_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: announcement_settings_announcement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_announcement_id_foreign FOREIGN KEY (announcement_id) REFERENCES public.announcements(announcement_id) ON DELETE CASCADE;


--
-- Name: announcement_type_settings_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id) ON DELETE CASCADE;


--
-- Name: announcement_types_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: announcements_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id) ON DELETE SET NULL;


--
-- Name: assignment_settings_navigation_menu_item_assignment_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT assignment_settings_navigation_menu_item_assignment_id FOREIGN KEY (navigation_menu_item_assignment_id) REFERENCES public.navigation_menu_item_assignments(navigation_menu_item_assignment_id) ON DELETE CASCADE;


--
-- Name: author_settings_author_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id) ON DELETE CASCADE;


--
-- Name: authors_publication_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_publication_id_foreign FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: authors_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: c_v_e_s_entry_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_entry_id FOREIGN KEY (controlled_vocab_entry_id) REFERENCES public.controlled_vocab_entries(controlled_vocab_entry_id) ON DELETE CASCADE;


--
-- Name: categories_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


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
-- Name: citation_settings_citation_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_citation_id FOREIGN KEY (citation_id) REFERENCES public.citations(citation_id) ON DELETE CASCADE;


--
-- Name: citations_publication; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: completed_payments_context_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.completed_payments
    ADD CONSTRAINT completed_payments_context_id FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: completed_payments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.completed_payments
    ADD CONSTRAINT completed_payments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- Name: controlled_vocab_entries_controlled_vocab_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_controlled_vocab_id_foreign FOREIGN KEY (controlled_vocab_id) REFERENCES public.controlled_vocabs(controlled_vocab_id) ON DELETE CASCADE;


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_tombstone_id FOREIGN KEY (tombstone_id) REFERENCES public.data_object_tombstones(tombstone_id) ON DELETE CASCADE;


--
-- Name: data_object_tombstone_settings_tombstone_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_tombstone_id FOREIGN KEY (tombstone_id) REFERENCES public.data_object_tombstones(tombstone_id) ON DELETE CASCADE;


--
-- Name: doi_settings_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE CASCADE;


--
-- Name: dois_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: edit_decisions_editor_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_editor_id FOREIGN KEY (editor_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: edit_decisions_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id) ON DELETE CASCADE;


--
-- Name: edit_decisions_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: email_log_users_email_log_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_users_email_log_id_foreign FOREIGN KEY (email_log_id) REFERENCES public.email_log(log_id) ON DELETE CASCADE;


--
-- Name: email_log_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: email_templates_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: email_templates_settings_email_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_templates_settings_email_id FOREIGN KEY (email_id) REFERENCES public.email_templates(email_id) ON DELETE CASCADE;


--
-- Name: event_log_settings_log_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_log_id FOREIGN KEY (log_id) REFERENCES public.event_log(log_id) ON DELETE CASCADE;


--
-- Name: event_log_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: features_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: filter_settings_filter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_filter_id_foreign FOREIGN KEY (filter_id) REFERENCES public.filters(filter_id) ON DELETE CASCADE;


--
-- Name: filters_filter_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_filter_group_id_foreign FOREIGN KEY (filter_group_id) REFERENCES public.filter_groups(filter_group_id) ON DELETE CASCADE;


--
-- Name: genre_settings_genre_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_genre_id_foreign FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id) ON DELETE CASCADE;


--
-- Name: genres_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: identification_codes_publication_format_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.identification_codes
    ADD CONSTRAINT identification_codes_publication_format_id FOREIGN KEY (publication_format_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: institution_ip_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institution_ip
    ADD CONSTRAINT institution_ip_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: institution_settings_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institution_settings
    ADD CONSTRAINT institution_settings_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: institutions_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: item_views_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.item_views
    ADD CONSTRAINT item_views_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: library_file_settings_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.library_files(file_id) ON DELETE CASCADE;


--
-- Name: library_files_context_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_context_id FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: library_files_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: mailable_templates_email_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.mailable_templates
    ADD CONSTRAINT mailable_templates_email_id_foreign FOREIGN KEY (email_id) REFERENCES public.email_templates(email_id) ON DELETE CASCADE;


--
-- Name: markets_publication_format_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_publication_format_id FOREIGN KEY (publication_format_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: metrics_context_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_context
    ADD CONSTRAINT metrics_context_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: metrics_series_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_series
    ADD CONSTRAINT metrics_series_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: metrics_series_series_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_series
    ADD CONSTRAINT metrics_series_series_id_foreign FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: msd_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT msd_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: msd_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT msd_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: msgd_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT msgd_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: msgd_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT msgd_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: msgm_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT msgm_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: msgm_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT msgm_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: msid_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: msid_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: msid_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: msim_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: msim_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: msim_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: msm_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT msm_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: msm_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT msm_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_assignments_navigation_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_navigation_menu_id_foreign FOREIGN KEY (navigation_menu_id) REFERENCES public.navigation_menus(navigation_menu_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_assignments_navigation_menu_item_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_navigation_menu_item_id_foreig FOREIGN KEY (navigation_menu_item_id) REFERENCES public.navigation_menu_items(navigation_menu_item_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_navigation_menu_id FOREIGN KEY (navigation_menu_item_id) REFERENCES public.navigation_menu_items(navigation_menu_item_id) ON DELETE CASCADE;


--
-- Name: new_releases_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.new_releases
    ADD CONSTRAINT new_releases_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: notes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: notification_settings_notification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_notification_id_foreign FOREIGN KEY (notification_id) REFERENCES public.notifications(notification_id) ON DELETE CASCADE;


--
-- Name: notification_subscription_settings_context_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_context_foreign FOREIGN KEY (context) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: notification_subscription_settings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: press_settings_press_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.press_settings
    ADD CONSTRAINT press_settings_press_id_foreign FOREIGN KEY (press_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


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
-- Name: publication_dates_publication_format_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_dates
    ADD CONSTRAINT publication_dates_publication_format_id FOREIGN KEY (publication_format_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: publication_format_settings_publication_format_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_format_settings
    ADD CONSTRAINT publication_format_settings_publication_format_id FOREIGN KEY (publication_format_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: publication_formats_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats
    ADD CONSTRAINT publication_formats_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: publication_formats_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_formats
    ADD CONSTRAINT publication_formats_publication_id FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: publication_settings_publication_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_publication_id_foreign FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: publications_author_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_author_id FOREIGN KEY (primary_contact_id) REFERENCES public.authors(author_id) ON DELETE SET NULL;


--
-- Name: publications_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: publications_series_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_series_id FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: publications_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: query_participants_query_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_query_id_foreign FOREIGN KEY (query_id) REFERENCES public.queries(query_id) ON DELETE CASCADE;


--
-- Name: query_participants_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: representatives_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.representatives
    ADD CONSTRAINT representatives_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


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
-- Name: review_files_review_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_review_id_foreign FOREIGN KEY (review_id) REFERENCES public.review_assignments(review_id) ON DELETE CASCADE;


--
-- Name: review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: review_form_element_settings_review_form_element_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_review_form_element_id FOREIGN KEY (review_form_element_id) REFERENCES public.review_form_elements(review_form_element_id) ON DELETE CASCADE;


--
-- Name: review_form_elements_review_form_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_review_form_id FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id) ON DELETE CASCADE;


--
-- Name: review_form_responses_review_form_element_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_responses
    ADD CONSTRAINT review_form_responses_review_form_element_id_foreign FOREIGN KEY (review_form_element_id) REFERENCES public.review_form_elements(review_form_element_id) ON DELETE CASCADE;


--
-- Name: review_form_responses_review_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_responses
    ADD CONSTRAINT review_form_responses_review_id_foreign FOREIGN KEY (review_id) REFERENCES public.review_assignments(review_id) ON DELETE CASCADE;


--
-- Name: review_form_settings_review_form_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_review_form_id FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id) ON DELETE CASCADE;


--
-- Name: review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: review_round_files_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: sales_rights_publication_format_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sales_rights
    ADD CONSTRAINT sales_rights_publication_format_id FOREIGN KEY (publication_format_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: section_editors_context_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_context_id FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: series_categories_category_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_categories
    ADD CONSTRAINT series_categories_category_id FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;


--
-- Name: series_categories_series_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_categories
    ADD CONSTRAINT series_categories_series_id FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: series_press_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_press_id FOREIGN KEY (press_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: series_review_form_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_review_form_id FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id) ON DELETE SET NULL;


--
-- Name: series_settings_series_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.series_settings
    ADD CONSTRAINT series_settings_series_id FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: sessions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: spotlight_settings_spotlight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlight_settings
    ADD CONSTRAINT spotlight_settings_spotlight_id_foreign FOREIGN KEY (spotlight_id) REFERENCES public.spotlights(spotlight_id);


--
-- Name: spotlights_press_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.spotlights
    ADD CONSTRAINT spotlights_press_id_foreign FOREIGN KEY (press_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: stage_assignments_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: stage_assignments_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_user_group_id FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: stage_assignments_user_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: subeditor_submission_group_user_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT subeditor_submission_group_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: submission_chapter_authors_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_authors
    ADD CONSTRAINT submission_chapter_authors_author_id_foreign FOREIGN KEY (author_id) REFERENCES public.authors(author_id) ON DELETE CASCADE;


--
-- Name: submission_chapter_authors_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_authors
    ADD CONSTRAINT submission_chapter_authors_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: submission_chapter_settings_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapter_settings
    ADD CONSTRAINT submission_chapter_settings_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: submission_chapters_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: submission_chapters_primary_contact_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_primary_contact_id_foreign FOREIGN KEY (primary_contact_id) REFERENCES public.authors(author_id) ON DELETE SET NULL;


--
-- Name: submission_chapters_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_publication_id FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: submission_chapters_source_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_chapters
    ADD CONSTRAINT submission_chapters_source_chapter_id_foreign FOREIGN KEY (source_chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE SET NULL;


--
-- Name: submission_comments_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_author_id_foreign FOREIGN KEY (author_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: submission_comments_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON DELETE CASCADE;


--
-- Name: submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: submission_file_settings_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: submission_files_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON DELETE CASCADE;


--
-- Name: submission_files_genre_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_genre_id_foreign FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id) ON DELETE SET NULL;


--
-- Name: submission_files_source_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_source_submission_file_id_foreign FOREIGN KEY (source_submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: submission_files_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submission_files_uploader_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_uploader_user_id_foreign FOREIGN KEY (uploader_user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- Name: submission_search_object_keywords_keyword_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_keyword_id FOREIGN KEY (keyword_id) REFERENCES public.submission_search_keyword_list(keyword_id) ON DELETE CASCADE;


--
-- Name: submission_search_object_keywords_object_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_object_id_foreign FOREIGN KEY (object_id) REFERENCES public.submission_search_objects(object_id) ON DELETE CASCADE;


--
-- Name: submission_search_object_submission; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_object_submission FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submission_settings_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submissions_context_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_context_id FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: submissions_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_publication_id FOREIGN KEY (current_publication_id) REFERENCES public.publications(publication_id) ON DELETE SET NULL;


--
-- Name: temporary_files_user_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_group_settings_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: user_group_stage_context_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_context_id FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: user_group_stage_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_user_group_id FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: user_interests_controlled_vocab_entry_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT user_interests_controlled_vocab_entry_id_foreign FOREIGN KEY (controlled_vocab_entry_id) REFERENCES public.controlled_vocab_entries(controlled_vocab_entry_id) ON DELETE CASCADE;


--
-- Name: user_interests_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT user_interests_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_settings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_user_groups_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: user_user_groups_user_id; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: usi_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_institution_temporary_records
    ADD CONSTRAINT usi_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: usii_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: usii_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: usii_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: usii_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: usii_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: usir_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: usir_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: usir_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: usir_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: usir_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: ust_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: ust_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: ust_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: ust_series_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_series_id_foreign FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: ust_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: ust_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: usti_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records
    ADD CONSTRAINT usti_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: usti_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records
    ADD CONSTRAINT usti_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: usti_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records
    ADD CONSTRAINT usti_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: usti_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records
    ADD CONSTRAINT usti_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: usti_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_investigations_temporary_records
    ADD CONSTRAINT usti_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: ustr_chapter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records
    ADD CONSTRAINT ustr_chapter_id_foreign FOREIGN KEY (chapter_id) REFERENCES public.submission_chapters(chapter_id) ON DELETE CASCADE;


--
-- Name: ustr_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records
    ADD CONSTRAINT ustr_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.presses(press_id) ON DELETE CASCADE;


--
-- Name: ustr_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records
    ADD CONSTRAINT ustr_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_formats(publication_format_id) ON DELETE CASCADE;


--
-- Name: ustr_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records
    ADD CONSTRAINT ustr_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: ustr_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: omp-ci
--

ALTER TABLE ONLY public.usage_stats_unique_title_requests_temporary_records
    ADD CONSTRAINT ustr_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


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

