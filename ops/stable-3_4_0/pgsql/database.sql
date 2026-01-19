--
-- PostgreSQL database dump
--

\restrict psTP9uhR6VWIwc96dIm1yh9ai2mWuoVEJUf1rRx4a2wpKPS9bb2lIIGkqcESwEu

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

ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT ust_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usir_context_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_submission_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_submission_file_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_representation_id_foreign;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usii_context_id_foreign;
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
ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_current_publication_id;
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
ALTER TABLE ONLY public.submission_file_settings DROP CONSTRAINT submission_file_settings_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_submission_file_id_foreign;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_file_id_foreign;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_submission_id;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_author_id_foreign;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT subeditor_submission_group_user_id;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT subeditor_submission_group_user_group_id_foreign;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_user_id;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_user_group_id;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_submission_id_foreign;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_user_id;
ALTER TABLE ONLY public.server_settings DROP CONSTRAINT server_settings_server_id;
ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_server_id_foreign;
ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_review_form_id_foreign;
ALTER TABLE ONLY public.section_settings DROP CONSTRAINT section_settings_section_id_foreign;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT section_editors_context_id;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_submission_id_foreign;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_submission_id_foreign;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_submission_file_id_foreign;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_review_round_id_foreign;
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
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_user_id_foreign;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_query_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_submission_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_section_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_doi_id_foreign;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_author_id;
ALTER TABLE ONLY public.publication_settings DROP CONSTRAINT publication_settings_publication_id;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_submission_file_id_foreign;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_publication_id;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_doi_id_foreign;
ALTER TABLE ONLY public.publication_galley_settings DROP CONSTRAINT publication_galley_settings_galley_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_publication_id_foreign;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_category_id_foreign;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_user_id_foreign;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_context_id_foreign;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_user_id_foreign;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_context_foreign;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_notification_id_foreign;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_user_id_foreign;
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
ALTER TABLE ONLY public.metrics_context DROP CONSTRAINT metrics_context_context_id_foreign;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_submission_id_foreign;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_context_id;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_file_id_foreign;
ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_context_id_foreign;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_institution_id_foreign;
ALTER TABLE ONLY public.institution_ip DROP CONSTRAINT institution_ip_institution_id_foreign;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_context_id_foreign;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_genre_id_foreign;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_filter_group_id_foreign;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_filter_id_foreign;
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
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_publication;
ALTER TABLE ONLY public.citation_settings DROP CONSTRAINT citation_settings_citation_id;
ALTER TABLE ONLY public.category_settings DROP CONSTRAINT category_settings_category_id_foreign;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_parent_id_foreign;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_context_id_foreign;
ALTER TABLE ONLY public.controlled_vocab_entry_settings DROP CONSTRAINT c_v_e_s_entry_id;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_user_group_id_foreign;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_publication_id;
ALTER TABLE ONLY public.author_settings DROP CONSTRAINT author_settings_author_id;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT assignment_settings_navigation_menu_item_assignment_id;
ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_type_id_foreign;
ALTER TABLE ONLY public.announcement_types DROP CONSTRAINT announcement_types_context_id_foreign;
ALTER TABLE ONLY public.announcement_type_settings DROP CONSTRAINT announcement_type_settings_type_id_foreign;
ALTER TABLE ONLY public.announcement_settings DROP CONSTRAINT announcement_settings_announcement_id_foreign;
ALTER TABLE ONLY public.access_keys DROP CONSTRAINT access_keys_user_id_foreign;
DROP INDEX public.ust_submission_id;
DROP INDEX public.ust_submission_file_id;
DROP INDEX public.ust_representation_id;
DROP INDEX public.ust_load_id_context_id_ip_ua_url;
DROP INDEX public.ust_context_id;
DROP INDEX public.usir_submission_id;
DROP INDEX public.usir_submission_file_id;
DROP INDEX public.usir_representation_id;
DROP INDEX public.usir_load_id_context_id_ip_ua;
DROP INDEX public.usir_context_id;
DROP INDEX public.usii_submission_id;
DROP INDEX public.usii_submission_file_id;
DROP INDEX public.usii_representation_id;
DROP INDEX public.usii_load_id_context_id_ip_ua;
DROP INDEX public.usii_context_id;
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
DROP INDEX public.submission_file_settings_submission_file_id;
DROP INDEX public.submission_file_revisions_submission_file_id;
DROP INDEX public.submission_file_revisions_file_id;
DROP INDEX public.submission_comments_submission_id;
DROP INDEX public.submission_comments_author_id;
DROP INDEX public.subeditor_submission_group_user_id;
DROP INDEX public.subeditor_submission_group_user_group_id;
DROP INDEX public.subeditor_submission_group_context_id;
DROP INDEX public.subeditor_submission_group_assoc_id;
DROP INDEX public.stage_assignments_user_id;
DROP INDEX public.stage_assignments_user_group_id;
DROP INDEX public.stage_assignments_submission_id;
DROP INDEX public.sessions_user_id;
DROP INDEX public.server_settings_server_id;
DROP INDEX public.sections_server_id;
DROP INDEX public.sections_review_form_id;
DROP INDEX public.section_settings_section_id;
DROP INDEX public.review_rounds_submission_id;
DROP INDEX public.review_round_files_submission_id;
DROP INDEX public.review_round_files_submission_file_id;
DROP INDEX public.review_round_files_review_round_id;
DROP INDEX public.review_form_settings_review_form_id;
DROP INDEX public.review_form_responses_unique;
DROP INDEX public.review_form_responses_review_id;
DROP INDEX public.review_form_responses_review_form_element_id;
DROP INDEX public.review_form_elements_review_form_id;
DROP INDEX public.review_form_element_settings_review_form_element_id;
DROP INDEX public.review_files_submission_file_id;
DROP INDEX public.review_files_review_id;
DROP INDEX public.review_assignments_submission_id;
DROP INDEX public.review_assignments_reviewer_review;
DROP INDEX public.review_assignments_reviewer_id;
DROP INDEX public.review_assignments_form_id;
DROP INDEX public.review_assignment_reviewer_round;
DROP INDEX public.query_participants_user_id;
DROP INDEX public.query_participants_query_id;
DROP INDEX public.queries_assoc_id;
DROP INDEX public.publications_url_path;
DROP INDEX public.publications_submission_id;
DROP INDEX public.publications_section_id;
DROP INDEX public.publications_doi_id;
DROP INDEX public.publications_author_id;
DROP INDEX public.publication_settings_name_value;
DROP INDEX public.publication_galleys_url_path;
DROP INDEX public.publication_galleys_submission_file_id;
DROP INDEX public.publication_galleys_publication_id;
DROP INDEX public.publication_galleys_doi_id;
DROP INDEX public.publication_galley_settings_name_value;
DROP INDEX public.publication_galley_settings_galley_id;
DROP INDEX public.publication_categories_publication_id;
DROP INDEX public.publication_categories_category_id;
DROP INDEX public.plugin_settings_plugin_name;
DROP INDEX public.notifications_user_id_level;
DROP INDEX public.notifications_user_id;
DROP INDEX public.notifications_context_id_user_id;
DROP INDEX public.notifications_context_id_level;
DROP INDEX public.notifications_context_id;
DROP INDEX public.notifications_assoc;
DROP INDEX public.notification_subscription_settings_user_id;
DROP INDEX public.notification_subscription_settings_context;
DROP INDEX public.notification_settings_notification_id;
DROP INDEX public.notes_user_id;
DROP INDEX public.notes_assoc;
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
DROP INDEX public.msgm_submission_id;
DROP INDEX public.msgm_context_id_submission_id;
DROP INDEX public.msgm_context_id;
DROP INDEX public.msgd_submission_id;
DROP INDEX public.msgd_load_id;
DROP INDEX public.msgd_context_id_submission_id;
DROP INDEX public.msgd_context_id;
DROP INDEX public.msd_load_id;
DROP INDEX public.msd_context_id_submission_id;
DROP INDEX public.ms_load_id;
DROP INDEX public.ms_context_id_submission_id_assoc_type_file_type;
DROP INDEX public.metrics_submission_submission_id;
DROP INDEX public.metrics_submission_submission_file_id;
DROP INDEX public.metrics_submission_representation_id;
DROP INDEX public.metrics_submission_context_id;
DROP INDEX public.metrics_counter_submission_monthly_submission_id;
DROP INDEX public.metrics_counter_submission_monthly_context_id;
DROP INDEX public.metrics_counter_submission_daily_submission_id;
DROP INDEX public.metrics_counter_submission_daily_context_id;
DROP INDEX public.metrics_context_load_id;
DROP INDEX public.metrics_context_context_id;
DROP INDEX public.library_files_submission_id;
DROP INDEX public.library_files_context_id;
DROP INDEX public.library_file_settings_file_id;
DROP INDEX public.jobs_queue_reserved_at_index;
DROP INDEX public.institutions_context_id;
DROP INDEX public.institution_settings_institution_id;
DROP INDEX public.institution_ip_start;
DROP INDEX public.institution_ip_institution_id;
DROP INDEX public.institution_ip_end;
DROP INDEX public.genres_context_id;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.filters_filter_group_id;
DROP INDEX public.filter_settings_id;
DROP INDEX public.event_log_user_id;
DROP INDEX public.event_log_settings_name_value;
DROP INDEX public.event_log_settings_log_id;
DROP INDEX public.event_log_assoc;
DROP INDEX public.email_templates_settings_email_id;
DROP INDEX public.email_templates_context_id;
DROP INDEX public.email_templates_alternate_to;
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
DROP INDEX public.citations_publication;
DROP INDEX public.citation_settings_citation_id;
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
ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_unique;
ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_pkey;
ALTER TABLE ONLY public.usage_stats_institution_temporary_records DROP CONSTRAINT usitr_load_id_line_number_institution_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.user_user_groups DROP CONSTRAINT user_user_groups_unique;
ALTER TABLE ONLY public.user_user_groups DROP CONSTRAINT user_user_groups_pkey;
ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_unique;
ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_pkey;
ALTER TABLE ONLY public.user_interests DROP CONSTRAINT user_interests_pkey;
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
ALTER TABLE ONLY public.user_group_stage DROP CONSTRAINT user_group_stage_unique;
ALTER TABLE ONLY public.user_group_stage DROP CONSTRAINT user_group_stage_pkey;
ALTER TABLE ONLY public.user_group_settings DROP CONSTRAINT user_group_settings_unique;
ALTER TABLE ONLY public.user_group_settings DROP CONSTRAINT user_group_settings_pkey;
ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records DROP CONSTRAINT usage_stats_unique_item_requests_temporary_records_pkey;
ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records DROP CONSTRAINT usage_stats_unique_item_investigations_temporary_records_pkey;
ALTER TABLE ONLY public.usage_stats_total_temporary_records DROP CONSTRAINT usage_stats_total_temporary_records_pkey;
ALTER TABLE ONLY public.usage_stats_institution_temporary_records DROP CONSTRAINT usage_stats_institution_temporary_records_pkey;
ALTER TABLE ONLY public.user_interests DROP CONSTRAINT u_e_pkey;
ALTER TABLE ONLY public.temporary_files DROP CONSTRAINT temporary_files_pkey;
ALTER TABLE ONLY public.submissions DROP CONSTRAINT submissions_pkey;
ALTER TABLE ONLY public.submission_settings DROP CONSTRAINT submission_settings_unique;
ALTER TABLE ONLY public.submission_settings DROP CONSTRAINT submission_settings_pkey;
ALTER TABLE ONLY public.submission_search_objects DROP CONSTRAINT submission_search_objects_pkey;
ALTER TABLE ONLY public.submission_search_object_keywords DROP CONSTRAINT submission_search_object_keywords_unique;
ALTER TABLE ONLY public.submission_search_object_keywords DROP CONSTRAINT submission_search_object_keywords_pkey;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_text;
ALTER TABLE ONLY public.submission_search_keyword_list DROP CONSTRAINT submission_search_keyword_list_pkey;
ALTER TABLE ONLY public.submission_files DROP CONSTRAINT submission_files_pkey;
ALTER TABLE ONLY public.submission_file_settings DROP CONSTRAINT submission_file_settings_unique;
ALTER TABLE ONLY public.submission_file_settings DROP CONSTRAINT submission_file_settings_pkey;
ALTER TABLE ONLY public.submission_file_revisions DROP CONSTRAINT submission_file_revisions_pkey;
ALTER TABLE ONLY public.submission_comments DROP CONSTRAINT submission_comments_pkey;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT subeditor_submission_group_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignments_pkey;
ALTER TABLE ONLY public.stage_assignments DROP CONSTRAINT stage_assignment;
ALTER TABLE ONLY public.site_settings DROP CONSTRAINT site_settings_unique;
ALTER TABLE ONLY public.site_settings DROP CONSTRAINT site_settings_pkey;
ALTER TABLE ONLY public.site DROP CONSTRAINT site_pkey;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_pkey;
ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_path;
ALTER TABLE ONLY public.server_settings DROP CONSTRAINT server_settings_unique;
ALTER TABLE ONLY public.server_settings DROP CONSTRAINT server_settings_pkey;
ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
ALTER TABLE ONLY public.section_settings DROP CONSTRAINT section_settings_unique;
ALTER TABLE ONLY public.section_settings DROP CONSTRAINT section_settings_pkey;
ALTER TABLE ONLY public.subeditor_submission_group DROP CONSTRAINT section_editors_unique;
ALTER TABLE ONLY public.scheduled_tasks DROP CONSTRAINT scheduled_tasks_unique;
ALTER TABLE ONLY public.scheduled_tasks DROP CONSTRAINT scheduled_tasks_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_submission_id_stage_id_round_pkey;
ALTER TABLE ONLY public.review_rounds DROP CONSTRAINT review_rounds_pkey;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_unique;
ALTER TABLE ONLY public.review_round_files DROP CONSTRAINT review_round_files_pkey;
ALTER TABLE ONLY public.review_forms DROP CONSTRAINT review_forms_pkey;
ALTER TABLE ONLY public.review_form_settings DROP CONSTRAINT review_form_settings_unique;
ALTER TABLE ONLY public.review_form_settings DROP CONSTRAINT review_form_settings_pkey;
ALTER TABLE ONLY public.review_form_responses DROP CONSTRAINT review_form_responses_pkey;
ALTER TABLE ONLY public.review_form_elements DROP CONSTRAINT review_form_elements_pkey;
ALTER TABLE ONLY public.review_form_element_settings DROP CONSTRAINT review_form_element_settings_unique;
ALTER TABLE ONLY public.review_form_element_settings DROP CONSTRAINT review_form_element_settings_pkey;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_unique;
ALTER TABLE ONLY public.review_files DROP CONSTRAINT review_files_pkey;
ALTER TABLE ONLY public.review_assignments DROP CONSTRAINT review_assignments_pkey;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_unique;
ALTER TABLE ONLY public.query_participants DROP CONSTRAINT query_participants_pkey;
ALTER TABLE ONLY public.queries DROP CONSTRAINT queries_pkey;
ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
ALTER TABLE ONLY public.publication_settings DROP CONSTRAINT publication_settings_unique;
ALTER TABLE ONLY public.publication_settings DROP CONSTRAINT publication_settings_pkey;
ALTER TABLE ONLY public.publication_galleys DROP CONSTRAINT publication_galleys_pkey;
ALTER TABLE ONLY public.publication_galley_settings DROP CONSTRAINT publication_galley_settings_unique;
ALTER TABLE ONLY public.publication_galley_settings DROP CONSTRAINT publication_galley_settings_pkey;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_pkey;
ALTER TABLE ONLY public.publication_categories DROP CONSTRAINT publication_categories_id;
ALTER TABLE ONLY public.plugin_settings DROP CONSTRAINT plugin_settings_unique;
ALTER TABLE ONLY public.plugin_settings DROP CONSTRAINT plugin_settings_pkey;
ALTER TABLE ONLY public.oai_resumption_tokens DROP CONSTRAINT oai_resumption_tokens_unique;
ALTER TABLE ONLY public.oai_resumption_tokens DROP CONSTRAINT oai_resumption_tokens_pkey;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_pkey;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_unique;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_pkey;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_pkey;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_pkey;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_unique;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_pkey;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT navigation_menu_item_assignment_settings_unique;
ALTER TABLE ONLY public.navigation_menu_item_assignment_settings DROP CONSTRAINT navigation_menu_item_assignment_settings_pkey;
ALTER TABLE ONLY public.metrics_counter_submission_monthly DROP CONSTRAINT msm_uc_context_id_submission_id_month;
ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly DROP CONSTRAINT msim_uc_context_id_submission_id_institution_id_month;
ALTER TABLE ONLY public.metrics_counter_submission_institution_daily DROP CONSTRAINT msid_uc_load_id_context_id_submission_id_institution_id_date;
ALTER TABLE ONLY public.metrics_submission_geo_monthly DROP CONSTRAINT msgm_uc_context_submission_c_r_c_month;
ALTER TABLE ONLY public.metrics_submission_geo_daily DROP CONSTRAINT msgd_uc_load_context_submission_c_r_c_date;
ALTER TABLE ONLY public.metrics_counter_submission_daily DROP CONSTRAINT msd_uc_load_id_context_id_submission_id_date;
ALTER TABLE ONLY public.metrics_submission DROP CONSTRAINT metrics_submission_pkey;
ALTER TABLE ONLY public.metrics_submission_geo_monthly DROP CONSTRAINT metrics_submission_geo_monthly_pkey;
ALTER TABLE ONLY public.metrics_submission_geo_daily DROP CONSTRAINT metrics_submission_geo_daily_pkey;
ALTER TABLE ONLY public.metrics_counter_submission_monthly DROP CONSTRAINT metrics_counter_submission_monthly_pkey;
ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly DROP CONSTRAINT metrics_counter_submission_institution_monthly_pkey;
ALTER TABLE ONLY public.metrics_counter_submission_institution_daily DROP CONSTRAINT metrics_counter_submission_institution_daily_pkey;
ALTER TABLE ONLY public.metrics_counter_submission_daily DROP CONSTRAINT metrics_counter_submission_daily_pkey;
ALTER TABLE ONLY public.metrics_context DROP CONSTRAINT metrics_context_pkey;
ALTER TABLE ONLY public.library_files DROP CONSTRAINT library_files_pkey;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_unique;
ALTER TABLE ONLY public.library_file_settings DROP CONSTRAINT library_file_settings_pkey;
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_pkey;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_unique;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_pkey;
ALTER TABLE ONLY public.institution_ip DROP CONSTRAINT institution_ip_pkey;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_unique;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_pkey;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_pkey;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_unique;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_pkey;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_symbolic;
ALTER TABLE ONLY public.filter_groups DROP CONSTRAINT filter_groups_pkey;
ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
ALTER TABLE ONLY public.event_log_settings DROP CONSTRAINT event_log_settings_unique;
ALTER TABLE ONLY public.event_log_settings DROP CONSTRAINT event_log_settings_pkey;
ALTER TABLE ONLY public.event_log DROP CONSTRAINT event_log_pkey;
ALTER TABLE ONLY public.email_templates_settings DROP CONSTRAINT email_templates_settings_unique;
ALTER TABLE ONLY public.email_templates_settings DROP CONSTRAINT email_templates_settings_pkey;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_pkey;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_email_key;
ALTER TABLE ONLY public.email_templates_default_data DROP CONSTRAINT email_templates_default_data_unique;
ALTER TABLE ONLY public.email_templates_default_data DROP CONSTRAINT email_templates_default_data_pkey;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_users_pkey;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_user_id;
ALTER TABLE ONLY public.email_log DROP CONSTRAINT email_log_pkey;
ALTER TABLE ONLY public.edit_decisions DROP CONSTRAINT edit_decisions_pkey;
ALTER TABLE ONLY public.dois DROP CONSTRAINT dois_pkey;
ALTER TABLE ONLY public.doi_settings DROP CONSTRAINT doi_settings_unique;
ALTER TABLE ONLY public.doi_settings DROP CONSTRAINT doi_settings_pkey;
ALTER TABLE ONLY public.data_object_tombstones DROP CONSTRAINT data_object_tombstones_pkey;
ALTER TABLE ONLY public.data_object_tombstone_settings DROP CONSTRAINT data_object_tombstone_settings_unique;
ALTER TABLE ONLY public.data_object_tombstone_settings DROP CONSTRAINT data_object_tombstone_settings_pkey;
ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects DROP CONSTRAINT data_object_tombstone_oai_set_objects_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocabs_pkey;
ALTER TABLE ONLY public.controlled_vocabs DROP CONSTRAINT controlled_vocab_symbolic;
ALTER TABLE ONLY public.controlled_vocab_entry_settings DROP CONSTRAINT controlled_vocab_entry_settings_pkey;
ALTER TABLE ONLY public.controlled_vocab_entries DROP CONSTRAINT controlled_vocab_entries_pkey;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_publication_seq;
ALTER TABLE ONLY public.citations DROP CONSTRAINT citations_pkey;
ALTER TABLE ONLY public.citation_settings DROP CONSTRAINT citation_settings_unique;
ALTER TABLE ONLY public.citation_settings DROP CONSTRAINT citation_settings_pkey;
ALTER TABLE ONLY public.category_settings DROP CONSTRAINT category_settings_unique;
ALTER TABLE ONLY public.category_settings DROP CONSTRAINT category_settings_pkey;
ALTER TABLE ONLY public.categories DROP CONSTRAINT category_path;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
ALTER TABLE ONLY public.controlled_vocab_entry_settings DROP CONSTRAINT c_v_e_s_pkey;
ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
ALTER TABLE ONLY public.author_settings DROP CONSTRAINT author_settings_unique;
ALTER TABLE ONLY public.author_settings DROP CONSTRAINT author_settings_pkey;
ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_pkey;
ALTER TABLE ONLY public.announcement_types DROP CONSTRAINT announcement_types_pkey;
ALTER TABLE ONLY public.announcement_type_settings DROP CONSTRAINT announcement_type_settings_unique;
ALTER TABLE ONLY public.announcement_type_settings DROP CONSTRAINT announcement_type_settings_pkey;
ALTER TABLE ONLY public.announcement_settings DROP CONSTRAINT announcement_settings_unique;
ALTER TABLE ONLY public.announcement_settings DROP CONSTRAINT announcement_settings_pkey;
ALTER TABLE ONLY public.access_keys DROP CONSTRAINT access_keys_pkey;
ALTER TABLE public.versions ALTER COLUMN version_id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.user_user_groups ALTER COLUMN user_user_group_id DROP DEFAULT;
ALTER TABLE public.user_settings ALTER COLUMN user_setting_id DROP DEFAULT;
ALTER TABLE public.user_interests ALTER COLUMN user_interest_id DROP DEFAULT;
ALTER TABLE public.user_groups ALTER COLUMN user_group_id DROP DEFAULT;
ALTER TABLE public.user_group_stage ALTER COLUMN user_group_stage_id DROP DEFAULT;
ALTER TABLE public.user_group_settings ALTER COLUMN user_group_setting_id DROP DEFAULT;
ALTER TABLE public.usage_stats_unique_item_requests_temporary_records ALTER COLUMN usage_stats_temp_item_id DROP DEFAULT;
ALTER TABLE public.usage_stats_unique_item_investigations_temporary_records ALTER COLUMN usage_stats_temp_unique_item_id DROP DEFAULT;
ALTER TABLE public.usage_stats_total_temporary_records ALTER COLUMN usage_stats_temp_total_id DROP DEFAULT;
ALTER TABLE public.usage_stats_institution_temporary_records ALTER COLUMN usage_stats_temp_institution_id DROP DEFAULT;
ALTER TABLE public.temporary_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.submissions ALTER COLUMN submission_id DROP DEFAULT;
ALTER TABLE public.submission_settings ALTER COLUMN submission_setting_id DROP DEFAULT;
ALTER TABLE public.submission_search_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.submission_search_object_keywords ALTER COLUMN submission_search_object_keyword_id DROP DEFAULT;
ALTER TABLE public.submission_search_keyword_list ALTER COLUMN keyword_id DROP DEFAULT;
ALTER TABLE public.submission_files ALTER COLUMN submission_file_id DROP DEFAULT;
ALTER TABLE public.submission_file_settings ALTER COLUMN submission_file_setting_id DROP DEFAULT;
ALTER TABLE public.submission_file_revisions ALTER COLUMN revision_id DROP DEFAULT;
ALTER TABLE public.submission_comments ALTER COLUMN comment_id DROP DEFAULT;
ALTER TABLE public.subeditor_submission_group ALTER COLUMN subeditor_submission_group_id DROP DEFAULT;
ALTER TABLE public.stage_assignments ALTER COLUMN stage_assignment_id DROP DEFAULT;
ALTER TABLE public.site_settings ALTER COLUMN site_setting_id DROP DEFAULT;
ALTER TABLE public.site ALTER COLUMN site_id DROP DEFAULT;
ALTER TABLE public.servers ALTER COLUMN server_id DROP DEFAULT;
ALTER TABLE public.server_settings ALTER COLUMN server_setting_id DROP DEFAULT;
ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
ALTER TABLE public.section_settings ALTER COLUMN section_setting_id DROP DEFAULT;
ALTER TABLE public.scheduled_tasks ALTER COLUMN scheduled_task_id DROP DEFAULT;
ALTER TABLE public.review_rounds ALTER COLUMN review_round_id DROP DEFAULT;
ALTER TABLE public.review_round_files ALTER COLUMN review_round_file_id DROP DEFAULT;
ALTER TABLE public.review_forms ALTER COLUMN review_form_id DROP DEFAULT;
ALTER TABLE public.review_form_settings ALTER COLUMN review_form_setting_id DROP DEFAULT;
ALTER TABLE public.review_form_responses ALTER COLUMN review_form_response_id DROP DEFAULT;
ALTER TABLE public.review_form_elements ALTER COLUMN review_form_element_id DROP DEFAULT;
ALTER TABLE public.review_form_element_settings ALTER COLUMN review_form_element_setting_id DROP DEFAULT;
ALTER TABLE public.review_files ALTER COLUMN review_file_id DROP DEFAULT;
ALTER TABLE public.review_assignments ALTER COLUMN review_id DROP DEFAULT;
ALTER TABLE public.query_participants ALTER COLUMN query_participant_id DROP DEFAULT;
ALTER TABLE public.queries ALTER COLUMN query_id DROP DEFAULT;
ALTER TABLE public.publications ALTER COLUMN publication_id DROP DEFAULT;
ALTER TABLE public.publication_settings ALTER COLUMN publication_setting_id DROP DEFAULT;
ALTER TABLE public.publication_galleys ALTER COLUMN galley_id DROP DEFAULT;
ALTER TABLE public.publication_galley_settings ALTER COLUMN publication_galley_setting_id DROP DEFAULT;
ALTER TABLE public.publication_categories ALTER COLUMN publication_category_id DROP DEFAULT;
ALTER TABLE public.plugin_settings ALTER COLUMN plugin_setting_id DROP DEFAULT;
ALTER TABLE public.oai_resumption_tokens ALTER COLUMN oai_resumption_token_id DROP DEFAULT;
ALTER TABLE public.notifications ALTER COLUMN notification_id DROP DEFAULT;
ALTER TABLE public.notification_subscription_settings ALTER COLUMN setting_id DROP DEFAULT;
ALTER TABLE public.notification_settings ALTER COLUMN notification_setting_id DROP DEFAULT;
ALTER TABLE public.notes ALTER COLUMN note_id DROP DEFAULT;
ALTER TABLE public.navigation_menus ALTER COLUMN navigation_menu_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_items ALTER COLUMN navigation_menu_item_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_item_settings ALTER COLUMN navigation_menu_item_setting_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id DROP DEFAULT;
ALTER TABLE public.navigation_menu_item_assignment_settings ALTER COLUMN navigation_menu_item_assignment_setting_id DROP DEFAULT;
ALTER TABLE public.metrics_submission_geo_monthly ALTER COLUMN metrics_submission_geo_monthly_id DROP DEFAULT;
ALTER TABLE public.metrics_submission_geo_daily ALTER COLUMN metrics_submission_geo_daily_id DROP DEFAULT;
ALTER TABLE public.metrics_submission ALTER COLUMN metrics_submission_id DROP DEFAULT;
ALTER TABLE public.metrics_counter_submission_monthly ALTER COLUMN metrics_counter_submission_monthly_id DROP DEFAULT;
ALTER TABLE public.metrics_counter_submission_institution_monthly ALTER COLUMN metrics_counter_submission_institution_monthly_id DROP DEFAULT;
ALTER TABLE public.metrics_counter_submission_institution_daily ALTER COLUMN metrics_counter_submission_institution_daily_id DROP DEFAULT;
ALTER TABLE public.metrics_counter_submission_daily ALTER COLUMN metrics_counter_submission_daily_id DROP DEFAULT;
ALTER TABLE public.metrics_context ALTER COLUMN metrics_context_id DROP DEFAULT;
ALTER TABLE public.library_files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.library_file_settings ALTER COLUMN library_file_setting_id DROP DEFAULT;
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.institutions ALTER COLUMN institution_id DROP DEFAULT;
ALTER TABLE public.institution_settings ALTER COLUMN institution_setting_id DROP DEFAULT;
ALTER TABLE public.institution_ip ALTER COLUMN institution_ip_id DROP DEFAULT;
ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
ALTER TABLE public.genre_settings ALTER COLUMN genre_setting_id DROP DEFAULT;
ALTER TABLE public.filters ALTER COLUMN filter_id DROP DEFAULT;
ALTER TABLE public.filter_settings ALTER COLUMN filter_setting_id DROP DEFAULT;
ALTER TABLE public.filter_groups ALTER COLUMN filter_group_id DROP DEFAULT;
ALTER TABLE public.files ALTER COLUMN file_id DROP DEFAULT;
ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.event_log_settings ALTER COLUMN event_log_setting_id DROP DEFAULT;
ALTER TABLE public.event_log ALTER COLUMN log_id DROP DEFAULT;
ALTER TABLE public.email_templates_settings ALTER COLUMN email_template_setting_id DROP DEFAULT;
ALTER TABLE public.email_templates_default_data ALTER COLUMN email_templates_default_data_id DROP DEFAULT;
ALTER TABLE public.email_templates ALTER COLUMN email_id DROP DEFAULT;
ALTER TABLE public.email_log_users ALTER COLUMN email_log_user_id DROP DEFAULT;
ALTER TABLE public.email_log ALTER COLUMN log_id DROP DEFAULT;
ALTER TABLE public.edit_decisions ALTER COLUMN edit_decision_id DROP DEFAULT;
ALTER TABLE public.dois ALTER COLUMN doi_id DROP DEFAULT;
ALTER TABLE public.doi_settings ALTER COLUMN doi_setting_id DROP DEFAULT;
ALTER TABLE public.data_object_tombstones ALTER COLUMN tombstone_id DROP DEFAULT;
ALTER TABLE public.data_object_tombstone_settings ALTER COLUMN tombstone_setting_id DROP DEFAULT;
ALTER TABLE public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id DROP DEFAULT;
ALTER TABLE public.controlled_vocabs ALTER COLUMN controlled_vocab_id DROP DEFAULT;
ALTER TABLE public.controlled_vocab_entry_settings ALTER COLUMN controlled_vocab_entry_setting_id DROP DEFAULT;
ALTER TABLE public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id DROP DEFAULT;
ALTER TABLE public.citations ALTER COLUMN citation_id DROP DEFAULT;
ALTER TABLE public.citation_settings ALTER COLUMN citation_setting_id DROP DEFAULT;
ALTER TABLE public.category_settings ALTER COLUMN category_setting_id DROP DEFAULT;
ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
ALTER TABLE public.authors ALTER COLUMN author_id DROP DEFAULT;
ALTER TABLE public.author_settings ALTER COLUMN author_setting_id DROP DEFAULT;
ALTER TABLE public.announcements ALTER COLUMN announcement_id DROP DEFAULT;
ALTER TABLE public.announcement_types ALTER COLUMN type_id DROP DEFAULT;
ALTER TABLE public.announcement_type_settings ALTER COLUMN announcement_type_setting_id DROP DEFAULT;
ALTER TABLE public.announcement_settings ALTER COLUMN announcement_setting_id DROP DEFAULT;
ALTER TABLE public.access_keys ALTER COLUMN access_key_id DROP DEFAULT;
DROP SEQUENCE public.versions_version_id_seq;
DROP TABLE public.versions;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.user_user_groups_user_user_group_id_seq;
DROP TABLE public.user_user_groups;
DROP SEQUENCE public.user_settings_user_setting_id_seq;
DROP TABLE public.user_settings;
DROP SEQUENCE public.user_interests_user_interest_id_seq;
DROP TABLE public.user_interests;
DROP SEQUENCE public.user_groups_user_group_id_seq;
DROP TABLE public.user_groups;
DROP SEQUENCE public.user_group_stage_user_group_stage_id_seq;
DROP TABLE public.user_group_stage;
DROP SEQUENCE public.user_group_settings_user_group_setting_id_seq;
DROP TABLE public.user_group_settings;
DROP SEQUENCE public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq;
DROP TABLE public.usage_stats_unique_item_requests_temporary_records;
DROP SEQUENCE public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq;
DROP TABLE public.usage_stats_unique_item_investigations_temporary_records;
DROP SEQUENCE public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq;
DROP TABLE public.usage_stats_total_temporary_records;
DROP SEQUENCE public.usage_stats_institution_tempo_usage_stats_temp_institution__seq;
DROP TABLE public.usage_stats_institution_temporary_records;
DROP SEQUENCE public.temporary_files_file_id_seq;
DROP TABLE public.temporary_files;
DROP SEQUENCE public.submissions_submission_id_seq;
DROP TABLE public.submissions;
DROP SEQUENCE public.submission_settings_submission_setting_id_seq;
DROP TABLE public.submission_settings;
DROP SEQUENCE public.submission_search_objects_object_id_seq;
DROP TABLE public.submission_search_objects;
DROP SEQUENCE public.submission_search_object_keyw_submission_search_object_keyw_seq;
DROP TABLE public.submission_search_object_keywords;
DROP SEQUENCE public.submission_search_keyword_list_keyword_id_seq;
DROP TABLE public.submission_search_keyword_list;
DROP SEQUENCE public.submission_files_submission_file_id_seq;
DROP TABLE public.submission_files;
DROP SEQUENCE public.submission_file_settings_submission_file_setting_id_seq;
DROP TABLE public.submission_file_settings;
DROP SEQUENCE public.submission_file_revisions_revision_id_seq;
DROP TABLE public.submission_file_revisions;
DROP SEQUENCE public.submission_comments_comment_id_seq;
DROP TABLE public.submission_comments;
DROP SEQUENCE public.subeditor_submission_group_subeditor_submission_group_id_seq;
DROP TABLE public.subeditor_submission_group;
DROP SEQUENCE public.stage_assignments_stage_assignment_id_seq;
DROP TABLE public.stage_assignments;
DROP SEQUENCE public.site_site_id_seq;
DROP SEQUENCE public.site_settings_site_setting_id_seq;
DROP TABLE public.site_settings;
DROP TABLE public.site;
DROP TABLE public.sessions;
DROP SEQUENCE public.servers_server_id_seq;
DROP TABLE public.servers;
DROP SEQUENCE public.server_settings_server_setting_id_seq;
DROP TABLE public.server_settings;
DROP SEQUENCE public.sections_section_id_seq;
DROP TABLE public.sections;
DROP SEQUENCE public.section_settings_section_setting_id_seq;
DROP TABLE public.section_settings;
DROP SEQUENCE public.scheduled_tasks_scheduled_task_id_seq;
DROP TABLE public.scheduled_tasks;
DROP SEQUENCE public.review_rounds_review_round_id_seq;
DROP TABLE public.review_rounds;
DROP SEQUENCE public.review_round_files_review_round_file_id_seq;
DROP TABLE public.review_round_files;
DROP SEQUENCE public.review_forms_review_form_id_seq;
DROP TABLE public.review_forms;
DROP SEQUENCE public.review_form_settings_review_form_setting_id_seq;
DROP TABLE public.review_form_settings;
DROP SEQUENCE public.review_form_responses_review_form_response_id_seq;
DROP TABLE public.review_form_responses;
DROP SEQUENCE public.review_form_elements_review_form_element_id_seq;
DROP TABLE public.review_form_elements;
DROP SEQUENCE public.review_form_element_settings_review_form_element_setting_id_seq;
DROP TABLE public.review_form_element_settings;
DROP SEQUENCE public.review_files_review_file_id_seq;
DROP TABLE public.review_files;
DROP SEQUENCE public.review_assignments_review_id_seq;
DROP TABLE public.review_assignments;
DROP SEQUENCE public.query_participants_query_participant_id_seq;
DROP TABLE public.query_participants;
DROP SEQUENCE public.queries_query_id_seq;
DROP TABLE public.queries;
DROP SEQUENCE public.publications_publication_id_seq;
DROP TABLE public.publications;
DROP SEQUENCE public.publication_settings_publication_setting_id_seq;
DROP TABLE public.publication_settings;
DROP SEQUENCE public.publication_galleys_galley_id_seq;
DROP TABLE public.publication_galleys;
DROP SEQUENCE public.publication_galley_settings_publication_galley_setting_id_seq;
DROP TABLE public.publication_galley_settings;
DROP SEQUENCE public.publication_categories_publication_category_id_seq;
DROP TABLE public.publication_categories;
DROP SEQUENCE public.plugin_settings_plugin_setting_id_seq;
DROP TABLE public.plugin_settings;
DROP SEQUENCE public.oai_resumption_tokens_oai_resumption_token_id_seq;
DROP TABLE public.oai_resumption_tokens;
DROP SEQUENCE public.notifications_notification_id_seq;
DROP TABLE public.notifications;
DROP SEQUENCE public.notification_subscription_settings_setting_id_seq;
DROP TABLE public.notification_subscription_settings;
DROP SEQUENCE public.notification_settings_notification_setting_id_seq;
DROP TABLE public.notification_settings;
DROP SEQUENCE public.notes_note_id_seq;
DROP TABLE public.notes;
DROP SEQUENCE public.navigation_menus_navigation_menu_id_seq;
DROP TABLE public.navigation_menus;
DROP SEQUENCE public.navigation_menu_items_navigation_menu_item_id_seq;
DROP TABLE public.navigation_menu_items;
DROP SEQUENCE public.navigation_menu_item_settings_navigation_menu_item_setting__seq;
DROP TABLE public.navigation_menu_item_settings;
DROP SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq;
DROP TABLE public.navigation_menu_item_assignments;
DROP SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1;
DROP TABLE public.navigation_menu_item_assignment_settings;
DROP SEQUENCE public.metrics_submission_metrics_submission_id_seq;
DROP SEQUENCE public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq;
DROP TABLE public.metrics_submission_geo_monthly;
DROP SEQUENCE public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq;
DROP TABLE public.metrics_submission_geo_daily;
DROP TABLE public.metrics_submission;
DROP SEQUENCE public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq;
DROP TABLE public.metrics_counter_submission_monthly;
DROP SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_in_seq;
DROP TABLE public.metrics_counter_submission_institution_daily;
DROP SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_i_seq1;
DROP TABLE public.metrics_counter_submission_institution_monthly;
DROP SEQUENCE public.metrics_counter_submission_da_metrics_counter_submission_da_seq;
DROP TABLE public.metrics_counter_submission_daily;
DROP SEQUENCE public.metrics_context_metrics_context_id_seq;
DROP TABLE public.metrics_context;
DROP SEQUENCE public.library_files_file_id_seq;
DROP TABLE public.library_files;
DROP SEQUENCE public.library_file_settings_library_file_setting_id_seq;
DROP TABLE public.library_file_settings;
DROP SEQUENCE public.jobs_id_seq;
DROP TABLE public.jobs;
DROP TABLE public.job_batches;
DROP SEQUENCE public.institutions_institution_id_seq;
DROP TABLE public.institutions;
DROP SEQUENCE public.institution_settings_institution_setting_id_seq;
DROP TABLE public.institution_settings;
DROP SEQUENCE public.institution_ip_institution_ip_id_seq;
DROP TABLE public.institution_ip;
DROP SEQUENCE public.genres_genre_id_seq;
DROP TABLE public.genres;
DROP SEQUENCE public.genre_settings_genre_setting_id_seq;
DROP TABLE public.genre_settings;
DROP SEQUENCE public.filters_filter_id_seq;
DROP TABLE public.filters;
DROP SEQUENCE public.filter_settings_filter_setting_id_seq;
DROP TABLE public.filter_settings;
DROP SEQUENCE public.filter_groups_filter_group_id_seq;
DROP TABLE public.filter_groups;
DROP SEQUENCE public.files_file_id_seq;
DROP TABLE public.files;
DROP SEQUENCE public.failed_jobs_id_seq;
DROP TABLE public.failed_jobs;
DROP SEQUENCE public.event_log_settings_event_log_setting_id_seq;
DROP TABLE public.event_log_settings;
DROP SEQUENCE public.event_log_log_id_seq;
DROP TABLE public.event_log;
DROP SEQUENCE public.email_templates_settings_email_template_setting_id_seq;
DROP TABLE public.email_templates_settings;
DROP SEQUENCE public.email_templates_email_id_seq;
DROP SEQUENCE public.email_templates_default_data_email_templates_default_data_i_seq;
DROP TABLE public.email_templates_default_data;
DROP TABLE public.email_templates;
DROP SEQUENCE public.email_log_users_email_log_user_id_seq;
DROP TABLE public.email_log_users;
DROP SEQUENCE public.email_log_log_id_seq;
DROP TABLE public.email_log;
DROP SEQUENCE public.edit_decisions_edit_decision_id_seq;
DROP TABLE public.edit_decisions;
DROP SEQUENCE public.dois_doi_id_seq;
DROP TABLE public.dois;
DROP SEQUENCE public.doi_settings_doi_setting_id_seq;
DROP TABLE public.doi_settings;
DROP SEQUENCE public.data_object_tombstones_tombstone_id_seq;
DROP TABLE public.data_object_tombstones;
DROP SEQUENCE public.data_object_tombstone_settings_tombstone_setting_id_seq;
DROP TABLE public.data_object_tombstone_settings;
DROP SEQUENCE public.data_object_tombstone_oai_set_objects_object_id_seq;
DROP TABLE public.data_object_tombstone_oai_set_objects;
DROP SEQUENCE public.controlled_vocabs_controlled_vocab_id_seq;
DROP TABLE public.controlled_vocabs;
DROP SEQUENCE public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq;
DROP TABLE public.controlled_vocab_entry_settings;
DROP SEQUENCE public.controlled_vocab_entries_controlled_vocab_entry_id_seq;
DROP TABLE public.controlled_vocab_entries;
DROP SEQUENCE public.citations_citation_id_seq;
DROP TABLE public.citations;
DROP SEQUENCE public.citation_settings_citation_setting_id_seq;
DROP TABLE public.citation_settings;
DROP SEQUENCE public.category_settings_category_setting_id_seq;
DROP TABLE public.category_settings;
DROP SEQUENCE public.categories_category_id_seq;
DROP TABLE public.categories;
DROP SEQUENCE public.authors_author_id_seq;
DROP TABLE public.authors;
DROP SEQUENCE public.author_settings_author_setting_id_seq;
DROP TABLE public.author_settings;
DROP SEQUENCE public.announcements_announcement_id_seq;
DROP TABLE public.announcements;
DROP SEQUENCE public.announcement_types_type_id_seq;
DROP TABLE public.announcement_types;
DROP SEQUENCE public.announcement_type_settings_announcement_type_setting_id_seq;
DROP TABLE public.announcement_type_settings;
DROP SEQUENCE public.announcement_settings_announcement_setting_id_seq;
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
-- Name: TABLE access_keys; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.access_keys IS 'Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';


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
    announcement_setting_id bigint NOT NULL,
    announcement_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.announcement_settings OWNER TO "ops-ci";

--
-- Name: TABLE announcement_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.announcement_settings IS 'More data about announcements, including localized properties like names and contents.';


--
-- Name: announcement_settings_announcement_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.announcement_settings_announcement_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.announcement_settings_announcement_setting_id_seq OWNER TO "ops-ci";

--
-- Name: announcement_settings_announcement_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.announcement_settings_announcement_setting_id_seq OWNED BY public.announcement_settings.announcement_setting_id;


--
-- Name: announcement_type_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcement_type_settings (
    announcement_type_setting_id bigint NOT NULL,
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.announcement_type_settings OWNER TO "ops-ci";

--
-- Name: TABLE announcement_type_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.announcement_type_settings IS 'More data about announcement types, including localized properties like their names.';


--
-- Name: announcement_type_settings_announcement_type_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.announcement_type_settings_announcement_type_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.announcement_type_settings_announcement_type_setting_id_seq OWNER TO "ops-ci";

--
-- Name: announcement_type_settings_announcement_type_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.announcement_type_settings_announcement_type_setting_id_seq OWNED BY public.announcement_type_settings.announcement_type_setting_id;


--
-- Name: announcement_types; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcement_types (
    type_id bigint NOT NULL,
    context_id bigint NOT NULL
);


ALTER TABLE public.announcement_types OWNER TO "ops-ci";

--
-- Name: TABLE announcement_types; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.announcement_types IS 'Announcement types allow for announcements to optionally be categorized.';


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
-- Name: TABLE announcements; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.announcements IS 'Announcements are messages that can be presented to users e.g. on the homepage.';


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
-- Name: author_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.author_settings (
    author_setting_id bigint NOT NULL,
    author_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.author_settings OWNER TO "ops-ci";

--
-- Name: TABLE author_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.author_settings IS 'More data about authors, including localized properties such as their name and affiliation.';


--
-- Name: author_settings_author_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.author_settings_author_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.author_settings_author_setting_id_seq OWNER TO "ops-ci";

--
-- Name: author_settings_author_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.author_settings_author_setting_id_seq OWNED BY public.author_settings.author_setting_id;


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
-- Name: TABLE authors; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.authors IS 'The authors of a publication.';


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
    parent_id bigint,
    seq bigint,
    path character varying(255) NOT NULL,
    image text
);


ALTER TABLE public.categories OWNER TO "ops-ci";

--
-- Name: TABLE categories; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.categories IS 'Categories permit the organization of submissions into a heirarchical structure.';


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
    category_setting_id bigint NOT NULL,
    category_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.category_settings OWNER TO "ops-ci";

--
-- Name: TABLE category_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.category_settings IS 'More data about categories, including localized properties such as names.';


--
-- Name: category_settings_category_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.category_settings_category_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_settings_category_setting_id_seq OWNER TO "ops-ci";

--
-- Name: category_settings_category_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.category_settings_category_setting_id_seq OWNED BY public.category_settings.category_setting_id;


--
-- Name: citation_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.citation_settings (
    citation_setting_id bigint NOT NULL,
    citation_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.citation_settings OWNER TO "ops-ci";

--
-- Name: TABLE citation_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.citation_settings IS 'Additional data about citations, including localized content.';


--
-- Name: citation_settings_citation_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.citation_settings_citation_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citation_settings_citation_setting_id_seq OWNER TO "ops-ci";

--
-- Name: citation_settings_citation_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.citation_settings_citation_setting_id_seq OWNED BY public.citation_settings.citation_setting_id;


--
-- Name: citations; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.citations (
    citation_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    raw_citation text NOT NULL,
    seq bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.citations OWNER TO "ops-ci";

--
-- Name: TABLE citations; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.citations IS 'A citation made by an associated publication.';


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
-- Name: TABLE controlled_vocab_entries; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.controlled_vocab_entries IS 'The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';


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
    controlled_vocab_entry_setting_id bigint NOT NULL,
    controlled_vocab_entry_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.controlled_vocab_entry_settings OWNER TO "ops-ci";

--
-- Name: TABLE controlled_vocab_entry_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.controlled_vocab_entry_settings IS 'More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';


--
-- Name: controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq OWNER TO "ops-ci";

--
-- Name: controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq OWNED BY public.controlled_vocab_entry_settings.controlled_vocab_entry_setting_id;


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
-- Name: TABLE controlled_vocabs; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.controlled_vocabs IS 'Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';


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
-- Name: TABLE data_object_tombstone_oai_set_objects; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.data_object_tombstone_oai_set_objects IS 'Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';


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
    tombstone_setting_id bigint NOT NULL,
    tombstone_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.data_object_tombstone_settings OWNER TO "ops-ci";

--
-- Name: TABLE data_object_tombstone_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.data_object_tombstone_settings IS 'More data about data object tombstones, including localized content.';


--
-- Name: COLUMN data_object_tombstone_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.data_object_tombstone_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: data_object_tombstone_settings_tombstone_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.data_object_tombstone_settings_tombstone_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_object_tombstone_settings_tombstone_setting_id_seq OWNER TO "ops-ci";

--
-- Name: data_object_tombstone_settings_tombstone_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.data_object_tombstone_settings_tombstone_setting_id_seq OWNED BY public.data_object_tombstone_settings.tombstone_setting_id;


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
-- Name: TABLE data_object_tombstones; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.data_object_tombstones IS 'Entries for published data that has been removed. Usually used in the OAI endpoint.';


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
-- Name: doi_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.doi_settings (
    doi_setting_id bigint NOT NULL,
    doi_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.doi_settings OWNER TO "ops-ci";

--
-- Name: TABLE doi_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.doi_settings IS 'More data about DOIs, including the registration agency.';


--
-- Name: doi_settings_doi_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.doi_settings_doi_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doi_settings_doi_setting_id_seq OWNER TO "ops-ci";

--
-- Name: doi_settings_doi_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.doi_settings_doi_setting_id_seq OWNED BY public.doi_settings.doi_setting_id;


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
-- Name: TABLE dois; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.dois IS 'Stores all DOIs used in the system.';


--
-- Name: dois_doi_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.dois_doi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dois_doi_id_seq OWNER TO "ops-ci";

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
    review_round_id bigint,
    stage_id bigint,
    round smallint,
    editor_id bigint NOT NULL,
    decision smallint NOT NULL,
    date_decided timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.edit_decisions OWNER TO "ops-ci";

--
-- Name: TABLE edit_decisions; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.edit_decisions IS 'Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';


--
-- Name: COLUMN edit_decisions.decision; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.edit_decisions.decision IS 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.';


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
-- Name: TABLE email_log; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.email_log IS 'A record of email messages that are sent in relation to an associated entity, such as a submission.';


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
    email_log_user_id bigint NOT NULL,
    email_log_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.email_log_users OWNER TO "ops-ci";

--
-- Name: TABLE email_log_users; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.email_log_users IS 'A record of users associated with an email log entry.';


--
-- Name: email_log_users_email_log_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.email_log_users_email_log_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_log_users_email_log_user_id_seq OWNER TO "ops-ci";

--
-- Name: email_log_users_email_log_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.email_log_users_email_log_user_id_seq OWNED BY public.email_log_users.email_log_user_id;


--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates (
    email_id bigint NOT NULL,
    email_key character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    alternate_to character varying(255)
);


ALTER TABLE public.email_templates OWNER TO "ops-ci";

--
-- Name: TABLE email_templates; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.email_templates IS 'Custom email templates created by each context, and overrides of the default templates.';


--
-- Name: COLUMN email_templates.email_key; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.email_templates.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default_data; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.email_templates_default_data (
    email_templates_default_data_id bigint NOT NULL,
    email_key character varying(255) NOT NULL,
    locale character varying(14) DEFAULT 'en'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    body text
);


ALTER TABLE public.email_templates_default_data OWNER TO "ops-ci";

--
-- Name: TABLE email_templates_default_data; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.email_templates_default_data IS 'Default email templates created for every installed locale.';


--
-- Name: COLUMN email_templates_default_data.email_key; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.email_templates_default_data.email_key IS 'Unique identifier for this email.';


--
-- Name: email_templates_default_data_email_templates_default_data_i_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.email_templates_default_data_email_templates_default_data_i_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_templates_default_data_email_templates_default_data_i_seq OWNER TO "ops-ci";

--
-- Name: email_templates_default_data_email_templates_default_data_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.email_templates_default_data_email_templates_default_data_i_seq OWNED BY public.email_templates_default_data.email_templates_default_data_id;


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
    email_template_setting_id bigint NOT NULL,
    email_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.email_templates_settings OWNER TO "ops-ci";

--
-- Name: TABLE email_templates_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.email_templates_settings IS 'More data about custom email templates, including localized properties such as the subject and body.';


--
-- Name: email_templates_settings_email_template_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.email_templates_settings_email_template_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_templates_settings_email_template_setting_id_seq OWNER TO "ops-ci";

--
-- Name: email_templates_settings_email_template_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.email_templates_settings_email_template_setting_id_seq OWNED BY public.email_templates_settings.email_template_setting_id;


--
-- Name: event_log; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.event_log (
    log_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    user_id bigint,
    date_logged timestamp(0) without time zone NOT NULL,
    event_type bigint,
    message text,
    is_translated boolean
);


ALTER TABLE public.event_log OWNER TO "ops-ci";

--
-- Name: TABLE event_log; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.event_log IS 'A log of all events related to an object like a submission.';


--
-- Name: COLUMN event_log.user_id; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.event_log.user_id IS 'NULL if it''s system or automated event';


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
    event_log_setting_id bigint NOT NULL,
    log_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.event_log_settings OWNER TO "ops-ci";

--
-- Name: TABLE event_log_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.event_log_settings IS 'Data about an event log entry. This data is commonly used to display information about an event to a user.';


--
-- Name: event_log_settings_event_log_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.event_log_settings_event_log_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_log_settings_event_log_setting_id_seq OWNER TO "ops-ci";

--
-- Name: event_log_settings_event_log_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.event_log_settings_event_log_setting_id_seq OWNED BY public.event_log_settings.event_log_setting_id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO "ops-ci";

--
-- Name: TABLE failed_jobs; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.failed_jobs IS 'A log of all failed jobs.';


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO "ops-ci";

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
-- Name: TABLE files; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.files IS 'Records information in the database about files tracked by the system, linking them to the local filesystem.';


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
-- Name: TABLE filter_groups; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.filter_groups IS 'Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';


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
    filter_setting_id bigint NOT NULL,
    filter_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.filter_settings OWNER TO "ops-ci";

--
-- Name: TABLE filter_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.filter_settings IS 'More data about filters, including localized content.';


--
-- Name: filter_settings_filter_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.filter_settings_filter_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.filter_settings_filter_setting_id_seq OWNER TO "ops-ci";

--
-- Name: filter_settings_filter_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.filter_settings_filter_setting_id_seq OWNED BY public.filter_settings.filter_setting_id;


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
-- Name: TABLE filters; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.filters IS 'Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';


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
    genre_setting_id bigint NOT NULL,
    genre_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.genre_settings OWNER TO "ops-ci";

--
-- Name: TABLE genre_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.genre_settings IS 'More data about file genres, including localized properties such as the genre name.';


--
-- Name: COLUMN genre_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.genre_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: genre_settings_genre_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.genre_settings_genre_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_settings_genre_setting_id_seq OWNER TO "ops-ci";

--
-- Name: genre_settings_genre_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.genre_settings_genre_setting_id_seq OWNED BY public.genre_settings.genre_setting_id;


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
    required smallint DEFAULT '0'::smallint NOT NULL,
    entry_key character varying(30)
);


ALTER TABLE public.genres OWNER TO "ops-ci";

--
-- Name: TABLE genres; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.genres IS 'The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';


--
-- Name: COLUMN genres.required; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.genres.required IS 'Whether or not at least one file of this genre is required for a new submission.';


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
-- Name: institution_ip; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.institution_ip (
    institution_ip_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    ip_string character varying(40) NOT NULL,
    ip_start bigint NOT NULL,
    ip_end bigint
);


ALTER TABLE public.institution_ip OWNER TO "ops-ci";

--
-- Name: TABLE institution_ip; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.institution_ip IS 'Records IP address ranges and associates them with institutions.';


--
-- Name: institution_ip_institution_ip_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.institution_ip_institution_ip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institution_ip_institution_ip_id_seq OWNER TO "ops-ci";

--
-- Name: institution_ip_institution_ip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.institution_ip_institution_ip_id_seq OWNED BY public.institution_ip.institution_ip_id;


--
-- Name: institution_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.institution_settings (
    institution_setting_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.institution_settings OWNER TO "ops-ci";

--
-- Name: TABLE institution_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.institution_settings IS 'More data about institutions, including localized properties like names.';


--
-- Name: institution_settings_institution_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.institution_settings_institution_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institution_settings_institution_setting_id_seq OWNER TO "ops-ci";

--
-- Name: institution_settings_institution_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.institution_settings_institution_setting_id_seq OWNED BY public.institution_settings.institution_setting_id;


--
-- Name: institutions; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.institutions (
    institution_id bigint NOT NULL,
    context_id bigint NOT NULL,
    ror character varying(255),
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.institutions OWNER TO "ops-ci";

--
-- Name: TABLE institutions; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.institutions IS 'Institutions for statistics and subscriptions.';


--
-- Name: COLUMN institutions.ror; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.institutions.ror IS 'ROR (Research Organization Registry) ID';


--
-- Name: institutions_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.institutions_institution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institutions_institution_id_seq OWNER TO "ops-ci";

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.institutions_institution_id_seq OWNED BY public.institutions.institution_id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: ops-ci
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


ALTER TABLE public.job_batches OWNER TO "ops-ci";

--
-- Name: TABLE job_batches; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.job_batches IS 'Job batches allow jobs to be collected into groups for managed processing.';


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
-- Name: TABLE jobs; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.jobs IS 'All pending or in-progress jobs.';


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
-- Name: library_file_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.library_file_settings (
    library_file_setting_id bigint NOT NULL,
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.library_file_settings OWNER TO "ops-ci";

--
-- Name: TABLE library_file_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.library_file_settings IS 'More data about library files, including localized content such as names.';


--
-- Name: COLUMN library_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.library_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: library_file_settings_library_file_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.library_file_settings_library_file_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.library_file_settings_library_file_setting_id_seq OWNER TO "ops-ci";

--
-- Name: library_file_settings_library_file_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.library_file_settings_library_file_setting_id_seq OWNED BY public.library_file_settings.library_file_setting_id;


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
    submission_id bigint,
    public_access smallint DEFAULT '0'::smallint
);


ALTER TABLE public.library_files OWNER TO "ops-ci";

--
-- Name: TABLE library_files; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.library_files IS 'Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';


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
-- Name: metrics_context; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_context (
    metrics_context_id bigint NOT NULL,
    load_id character varying(50) NOT NULL,
    context_id bigint NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL
);


ALTER TABLE public.metrics_context OWNER TO "ops-ci";

--
-- Name: TABLE metrics_context; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_context IS 'Daily statistics for views of the homepage.';


--
-- Name: metrics_context_metrics_context_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_context_metrics_context_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_context_metrics_context_id_seq OWNER TO "ops-ci";

--
-- Name: metrics_context_metrics_context_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_context_metrics_context_id_seq OWNED BY public.metrics_context.metrics_context_id;


--
-- Name: metrics_counter_submission_daily; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_counter_submission_daily (
    metrics_counter_submission_daily_id bigint NOT NULL,
    load_id character varying(50) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    date date NOT NULL,
    metric_investigations integer NOT NULL,
    metric_investigations_unique integer NOT NULL,
    metric_requests integer NOT NULL,
    metric_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_daily OWNER TO "ops-ci";

--
-- Name: TABLE metrics_counter_submission_daily; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_counter_submission_daily IS 'Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';


--
-- Name: metrics_counter_submission_da_metrics_counter_submission_da_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_counter_submission_da_metrics_counter_submission_da_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_counter_submission_da_metrics_counter_submission_da_seq OWNER TO "ops-ci";

--
-- Name: metrics_counter_submission_da_metrics_counter_submission_da_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_counter_submission_da_metrics_counter_submission_da_seq OWNED BY public.metrics_counter_submission_daily.metrics_counter_submission_daily_id;


--
-- Name: metrics_counter_submission_institution_monthly; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_counter_submission_institution_monthly (
    metrics_counter_submission_institution_monthly_id bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    month integer NOT NULL,
    metric_investigations integer NOT NULL,
    metric_investigations_unique integer NOT NULL,
    metric_requests integer NOT NULL,
    metric_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_institution_monthly OWNER TO "ops-ci";

--
-- Name: TABLE metrics_counter_submission_institution_monthly; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_counter_submission_institution_monthly IS 'Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';


--
-- Name: metrics_counter_submission_in_metrics_counter_submission_i_seq1; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_i_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_i_seq1 OWNER TO "ops-ci";

--
-- Name: metrics_counter_submission_in_metrics_counter_submission_i_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_i_seq1 OWNED BY public.metrics_counter_submission_institution_monthly.metrics_counter_submission_institution_monthly_id;


--
-- Name: metrics_counter_submission_institution_daily; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_counter_submission_institution_daily (
    metrics_counter_submission_institution_daily_id bigint NOT NULL,
    load_id character varying(50) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    date date NOT NULL,
    metric_investigations integer NOT NULL,
    metric_investigations_unique integer NOT NULL,
    metric_requests integer NOT NULL,
    metric_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_institution_daily OWNER TO "ops-ci";

--
-- Name: TABLE metrics_counter_submission_institution_daily; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_counter_submission_institution_daily IS 'Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';


--
-- Name: metrics_counter_submission_in_metrics_counter_submission_in_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_in_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_in_seq OWNER TO "ops-ci";

--
-- Name: metrics_counter_submission_in_metrics_counter_submission_in_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_in_seq OWNED BY public.metrics_counter_submission_institution_daily.metrics_counter_submission_institution_daily_id;


--
-- Name: metrics_counter_submission_monthly; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_counter_submission_monthly (
    metrics_counter_submission_monthly_id bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    month integer NOT NULL,
    metric_investigations integer NOT NULL,
    metric_investigations_unique integer NOT NULL,
    metric_requests integer NOT NULL,
    metric_requests_unique integer NOT NULL
);


ALTER TABLE public.metrics_counter_submission_monthly OWNER TO "ops-ci";

--
-- Name: TABLE metrics_counter_submission_monthly; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_counter_submission_monthly IS 'Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';


--
-- Name: metrics_counter_submission_mo_metrics_counter_submission_mo_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq OWNER TO "ops-ci";

--
-- Name: metrics_counter_submission_mo_metrics_counter_submission_mo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq OWNED BY public.metrics_counter_submission_monthly.metrics_counter_submission_monthly_id;


--
-- Name: metrics_submission; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_submission (
    metrics_submission_id bigint NOT NULL,
    load_id character varying(50) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    representation_id bigint,
    submission_file_id bigint,
    file_type bigint,
    assoc_type bigint NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL
);


ALTER TABLE public.metrics_submission OWNER TO "ops-ci";

--
-- Name: TABLE metrics_submission; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_submission IS 'Daily statistics for views and downloads of published submissions and galleys.';


--
-- Name: metrics_submission_geo_daily; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_submission_geo_daily (
    metrics_submission_geo_daily_id bigint NOT NULL,
    load_id character varying(50) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    date date NOT NULL,
    metric integer NOT NULL,
    metric_unique integer NOT NULL
);


ALTER TABLE public.metrics_submission_geo_daily OWNER TO "ops-ci";

--
-- Name: TABLE metrics_submission_geo_daily; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_submission_geo_daily IS 'Daily statistics by country, region and city for views and downloads of published submissions and galleys.';


--
-- Name: metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq OWNER TO "ops-ci";

--
-- Name: metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq OWNED BY public.metrics_submission_geo_daily.metrics_submission_geo_daily_id;


--
-- Name: metrics_submission_geo_monthly; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_submission_geo_monthly (
    metrics_submission_geo_monthly_id bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    month integer NOT NULL,
    metric integer NOT NULL,
    metric_unique integer NOT NULL
);


ALTER TABLE public.metrics_submission_geo_monthly OWNER TO "ops-ci";

--
-- Name: TABLE metrics_submission_geo_monthly; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.metrics_submission_geo_monthly IS 'Monthly statistics by country, region and city for views and downloads of published submissions and galleys.';


--
-- Name: metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq OWNER TO "ops-ci";

--
-- Name: metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq OWNED BY public.metrics_submission_geo_monthly.metrics_submission_geo_monthly_id;


--
-- Name: metrics_submission_metrics_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.metrics_submission_metrics_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metrics_submission_metrics_submission_id_seq OWNER TO "ops-ci";

--
-- Name: metrics_submission_metrics_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_submission_metrics_submission_id_seq OWNED BY public.metrics_submission.metrics_submission_id;


--
-- Name: navigation_menu_item_assignment_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menu_item_assignment_settings (
    navigation_menu_item_assignment_setting_id bigint NOT NULL,
    navigation_menu_item_assignment_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_assignment_settings OWNER TO "ops-ci";

--
-- Name: TABLE navigation_menu_item_assignment_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.navigation_menu_item_assignment_settings IS 'More data about navigation menu item assignments to navigation menus, including localized content.';


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignm_seq1; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1 OWNER TO "ops-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignm_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1 OWNED BY public.navigation_menu_item_assignment_settings.navigation_menu_item_assignment_setting_id;


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
-- Name: TABLE navigation_menu_item_assignments; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.navigation_menu_item_assignments IS 'Links navigation menu items to navigation menus.';


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
-- Name: navigation_menu_item_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.navigation_menu_item_settings (
    navigation_menu_item_setting_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.navigation_menu_item_settings OWNER TO "ops-ci";

--
-- Name: TABLE navigation_menu_item_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.navigation_menu_item_settings IS 'More data about navigation menu items, including localized content such as names.';


--
-- Name: navigation_menu_item_settings_navigation_menu_item_setting__seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.navigation_menu_item_settings_navigation_menu_item_setting__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigation_menu_item_settings_navigation_menu_item_setting__seq OWNER TO "ops-ci";

--
-- Name: navigation_menu_item_settings_navigation_menu_item_setting__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.navigation_menu_item_settings_navigation_menu_item_setting__seq OWNED BY public.navigation_menu_item_settings.navigation_menu_item_setting_id;


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
-- Name: TABLE navigation_menu_items; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.navigation_menu_items IS 'Navigation menu items are single elements within a navigation menu.';


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
-- Name: TABLE navigation_menus; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.navigation_menus IS 'Navigation menus on the website are installed with the software as a default set, and can be customized.';


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
-- Name: TABLE notes; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.notes IS 'Notes allow users to annotate associated entities, such as submissions.';


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
-- Name: notification_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notification_settings (
    notification_setting_id bigint NOT NULL,
    notification_id bigint NOT NULL,
    locale character varying(14),
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_settings OWNER TO "ops-ci";

--
-- Name: TABLE notification_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.notification_settings IS 'More data about notifications, including localized properties.';


--
-- Name: COLUMN notification_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.notification_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: notification_settings_notification_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.notification_settings_notification_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_settings_notification_setting_id_seq OWNER TO "ops-ci";

--
-- Name: notification_settings_notification_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.notification_settings_notification_setting_id_seq OWNED BY public.notification_settings.notification_setting_id;


--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.notification_subscription_settings (
    setting_id bigint NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text NOT NULL,
    user_id bigint NOT NULL,
    context bigint,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.notification_subscription_settings OWNER TO "ops-ci";

--
-- Name: TABLE notification_subscription_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.notification_subscription_settings IS 'Which email notifications a user has chosen to unsubscribe from.';


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
    context_id bigint,
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
-- Name: TABLE notifications; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.notifications IS 'User notifications created during certain operations.';


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
    oai_resumption_token_id bigint NOT NULL,
    token character varying(32) NOT NULL,
    expire bigint NOT NULL,
    record_offset integer NOT NULL,
    params text
);


ALTER TABLE public.oai_resumption_tokens OWNER TO "ops-ci";

--
-- Name: TABLE oai_resumption_tokens; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.oai_resumption_tokens IS 'OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';


--
-- Name: oai_resumption_tokens_oai_resumption_token_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.oai_resumption_tokens_oai_resumption_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oai_resumption_tokens_oai_resumption_token_id_seq OWNER TO "ops-ci";

--
-- Name: oai_resumption_tokens_oai_resumption_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.oai_resumption_tokens_oai_resumption_token_id_seq OWNED BY public.oai_resumption_tokens.oai_resumption_token_id;


--
-- Name: plugin_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.plugin_settings (
    plugin_setting_id bigint NOT NULL,
    plugin_name character varying(80) NOT NULL,
    context_id bigint NOT NULL,
    setting_name character varying(80) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.plugin_settings OWNER TO "ops-ci";

--
-- Name: TABLE plugin_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.plugin_settings IS 'More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';


--
-- Name: COLUMN plugin_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.plugin_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: plugin_settings_plugin_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.plugin_settings_plugin_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plugin_settings_plugin_setting_id_seq OWNER TO "ops-ci";

--
-- Name: plugin_settings_plugin_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.plugin_settings_plugin_setting_id_seq OWNED BY public.plugin_settings.plugin_setting_id;


--
-- Name: publication_categories; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publication_categories (
    publication_category_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.publication_categories OWNER TO "ops-ci";

--
-- Name: TABLE publication_categories; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.publication_categories IS 'Associates publications (and thus submissions) with categories.';


--
-- Name: publication_categories_publication_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.publication_categories_publication_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publication_categories_publication_category_id_seq OWNER TO "ops-ci";

--
-- Name: publication_categories_publication_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.publication_categories_publication_category_id_seq OWNED BY public.publication_categories.publication_category_id;


--
-- Name: publication_galley_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.publication_galley_settings (
    publication_galley_setting_id bigint NOT NULL,
    galley_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_galley_settings OWNER TO "ops-ci";

--
-- Name: TABLE publication_galley_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.publication_galley_settings IS 'More data about publication galleys, including localized properties such as labels.';


--
-- Name: publication_galley_settings_publication_galley_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.publication_galley_settings_publication_galley_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publication_galley_settings_publication_galley_setting_id_seq OWNER TO "ops-ci";

--
-- Name: publication_galley_settings_publication_galley_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.publication_galley_settings_publication_galley_setting_id_seq OWNED BY public.publication_galley_settings.publication_galley_setting_id;


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
-- Name: TABLE publication_galleys; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.publication_galleys IS 'Publication galleys are representations of publications in a particular format, such as a PDF file.';


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
    publication_setting_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.publication_settings OWNER TO "ops-ci";

--
-- Name: TABLE publication_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.publication_settings IS 'More data about publications, including localized properties such as the title and abstract.';


--
-- Name: publication_settings_publication_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.publication_settings_publication_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publication_settings_publication_setting_id_seq OWNER TO "ops-ci";

--
-- Name: publication_settings_publication_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.publication_settings_publication_setting_id_seq OWNED BY public.publication_settings.publication_setting_id;


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
-- Name: TABLE publications; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.publications IS 'Each publication is one version of a submission.';


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
-- Name: TABLE queries; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.queries IS 'Discussions, usually related to a submission, created by editors, authors and other editorial staff.';


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
    query_participant_id bigint NOT NULL,
    query_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.query_participants OWNER TO "ops-ci";

--
-- Name: TABLE query_participants; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.query_participants IS 'The users assigned to a discussion.';


--
-- Name: query_participants_query_participant_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.query_participants_query_participant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.query_participants_query_participant_id_seq OWNER TO "ops-ci";

--
-- Name: query_participants_query_participant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.query_participants_query_participant_id_seq OWNED BY public.query_participants.query_participant_id;


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
    date_rated timestamp(0) without time zone,
    date_reminded timestamp(0) without time zone,
    quality smallint,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    review_method smallint DEFAULT '1'::smallint NOT NULL,
    round smallint DEFAULT '1'::smallint NOT NULL,
    step smallint DEFAULT '1'::smallint NOT NULL,
    review_form_id bigint,
    considered smallint,
    request_resent smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.review_assignments OWNER TO "ops-ci";

--
-- Name: TABLE review_assignments; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_assignments IS 'Data about peer review assignments for all submissions.';


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
    review_file_id bigint NOT NULL,
    review_id bigint NOT NULL,
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_files OWNER TO "ops-ci";

--
-- Name: TABLE review_files; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_files IS 'A list of the submission files made available to each assigned reviewer.';


--
-- Name: review_files_review_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_files_review_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_files_review_file_id_seq OWNER TO "ops-ci";

--
-- Name: review_files_review_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_files_review_file_id_seq OWNED BY public.review_files.review_file_id;


--
-- Name: review_form_element_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_form_element_settings (
    review_form_element_setting_id bigint NOT NULL,
    review_form_element_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_element_settings OWNER TO "ops-ci";

--
-- Name: TABLE review_form_element_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_form_element_settings IS 'More data about review form elements, including localized content such as question text.';


--
-- Name: review_form_element_settings_review_form_element_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_form_element_settings_review_form_element_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_form_element_settings_review_form_element_setting_id_seq OWNER TO "ops-ci";

--
-- Name: review_form_element_settings_review_form_element_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_form_element_settings_review_form_element_setting_id_seq OWNED BY public.review_form_element_settings.review_form_element_setting_id;


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
-- Name: TABLE review_form_elements; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_form_elements IS 'Each review form element represents a single question on a review form.';


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
    review_form_response_id bigint NOT NULL,
    review_form_element_id bigint NOT NULL,
    review_id bigint NOT NULL,
    response_type character varying(6),
    response_value text
);


ALTER TABLE public.review_form_responses OWNER TO "ops-ci";

--
-- Name: TABLE review_form_responses; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_form_responses IS 'Each review form response records a reviewer''s answer to a review form element associated with a peer review.';


--
-- Name: review_form_responses_review_form_response_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_form_responses_review_form_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_form_responses_review_form_response_id_seq OWNER TO "ops-ci";

--
-- Name: review_form_responses_review_form_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_form_responses_review_form_response_id_seq OWNED BY public.review_form_responses.review_form_response_id;


--
-- Name: review_form_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.review_form_settings (
    review_form_setting_id bigint NOT NULL,
    review_form_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.review_form_settings OWNER TO "ops-ci";

--
-- Name: TABLE review_form_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_form_settings IS 'More data about review forms, including localized content such as names.';


--
-- Name: review_form_settings_review_form_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_form_settings_review_form_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_form_settings_review_form_setting_id_seq OWNER TO "ops-ci";

--
-- Name: review_form_settings_review_form_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_form_settings_review_form_setting_id_seq OWNED BY public.review_form_settings.review_form_setting_id;


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
-- Name: TABLE review_forms; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_forms IS 'Review forms provide custom templates for peer reviews with several types of questions.';


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
    review_round_file_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    submission_file_id bigint NOT NULL
);


ALTER TABLE public.review_round_files OWNER TO "ops-ci";

--
-- Name: TABLE review_round_files; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_round_files IS 'Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';


--
-- Name: review_round_files_review_round_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.review_round_files_review_round_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_round_files_review_round_file_id_seq OWNER TO "ops-ci";

--
-- Name: review_round_files_review_round_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.review_round_files_review_round_file_id_seq OWNED BY public.review_round_files.review_round_file_id;


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
-- Name: TABLE review_rounds; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.review_rounds IS 'Peer review assignments are organized into multiple rounds on a submission.';


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
    scheduled_task_id bigint NOT NULL,
    class_name character varying(255) NOT NULL,
    last_run timestamp(0) without time zone
);


ALTER TABLE public.scheduled_tasks OWNER TO "ops-ci";

--
-- Name: TABLE scheduled_tasks; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.scheduled_tasks IS 'The last time each scheduled task was run.';


--
-- Name: scheduled_tasks_scheduled_task_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.scheduled_tasks_scheduled_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scheduled_tasks_scheduled_task_id_seq OWNER TO "ops-ci";

--
-- Name: scheduled_tasks_scheduled_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.scheduled_tasks_scheduled_task_id_seq OWNED BY public.scheduled_tasks.scheduled_task_id;


--
-- Name: section_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.section_settings (
    section_setting_id bigint NOT NULL,
    section_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.section_settings OWNER TO "ops-ci";

--
-- Name: TABLE section_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.section_settings IS 'More data about sections, including localized properties such as section titles.';


--
-- Name: section_settings_section_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.section_settings_section_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.section_settings_section_setting_id_seq OWNER TO "ops-ci";

--
-- Name: section_settings_section_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.section_settings_section_setting_id_seq OWNED BY public.section_settings.section_setting_id;


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
-- Name: TABLE sections; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.sections IS 'Submissions can be organized into sections, which determine the front-end presentation and provide options for selective harvesting in the OAI-PMH interface.';


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
-- Name: server_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.server_settings (
    server_setting_id bigint NOT NULL,
    server_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.server_settings OWNER TO "ops-ci";

--
-- Name: TABLE server_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.server_settings IS 'More data about server settings, including localized properties such as policies.';


--
-- Name: server_settings_server_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.server_settings_server_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_settings_server_setting_id_seq OWNER TO "ops-ci";

--
-- Name: server_settings_server_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.server_settings_server_setting_id_seq OWNED BY public.server_settings.server_setting_id;


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
-- Name: TABLE servers; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.servers IS 'A list of preprint servers managed by the installation.';


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


ALTER SEQUENCE public.servers_server_id_seq OWNER TO "ops-ci";

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
-- Name: TABLE sessions; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.sessions IS 'Session data for logged-in users.';


--
-- Name: site; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.site (
    site_id bigint NOT NULL,
    redirect bigint DEFAULT '0'::bigint NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT '6'::smallint NOT NULL,
    installed_locales character varying(1024) DEFAULT 'en'::character varying NOT NULL,
    supported_locales character varying(1024),
    original_style_file_name character varying(255)
);


ALTER TABLE public.site OWNER TO "ops-ci";

--
-- Name: TABLE site; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.site IS 'A singleton table describing basic information about the site.';


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
    site_setting_id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_value text
);


ALTER TABLE public.site_settings OWNER TO "ops-ci";

--
-- Name: TABLE site_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.site_settings IS 'More data about the site, including localized properties such as its name.';


--
-- Name: site_settings_site_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.site_settings_site_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_settings_site_setting_id_seq OWNER TO "ops-ci";

--
-- Name: site_settings_site_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.site_settings_site_setting_id_seq OWNED BY public.site_settings.site_setting_id;


--
-- Name: site_site_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.site_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_site_id_seq OWNER TO "ops-ci";

--
-- Name: site_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.site_site_id_seq OWNED BY public.site.site_id;


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
-- Name: TABLE stage_assignments; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.stage_assignments IS 'Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';


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
    subeditor_submission_group_id bigint NOT NULL,
    context_id bigint NOT NULL,
    assoc_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    user_id bigint NOT NULL,
    user_group_id bigint NOT NULL
);


ALTER TABLE public.subeditor_submission_group OWNER TO "ops-ci";

--
-- Name: TABLE subeditor_submission_group; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.subeditor_submission_group IS 'Subeditor assignments to e.g. sections and categories';


--
-- Name: subeditor_submission_group_subeditor_submission_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.subeditor_submission_group_subeditor_submission_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subeditor_submission_group_subeditor_submission_group_id_seq OWNER TO "ops-ci";

--
-- Name: subeditor_submission_group_subeditor_submission_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.subeditor_submission_group_subeditor_submission_group_id_seq OWNED BY public.subeditor_submission_group.subeditor_submission_group_id;


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
-- Name: TABLE submission_comments; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_comments IS 'Comments on a submission, e.g. peer review comments';


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
-- Name: TABLE submission_file_revisions; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_file_revisions IS 'Revisions map submission_file entries to files on the data store.';


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
    submission_file_setting_id bigint NOT NULL,
    submission_file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.submission_file_settings OWNER TO "ops-ci";

--
-- Name: TABLE submission_file_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_file_settings IS 'Localized data about submission files like published metadata.';


--
-- Name: submission_file_settings_submission_file_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_file_settings_submission_file_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submission_file_settings_submission_file_setting_id_seq OWNER TO "ops-ci";

--
-- Name: submission_file_settings_submission_file_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_file_settings_submission_file_setting_id_seq OWNED BY public.submission_file_settings.submission_file_setting_id;


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
-- Name: TABLE submission_files; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_files IS 'All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';


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
-- Name: TABLE submission_search_keyword_list; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_search_keyword_list IS 'A list of all keywords used in the search index';


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
    submission_search_object_keyword_id bigint NOT NULL,
    object_id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    pos integer NOT NULL
);


ALTER TABLE public.submission_search_object_keywords OWNER TO "ops-ci";

--
-- Name: TABLE submission_search_object_keywords; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_search_object_keywords IS 'Relationships between search objects and keywords in the search index';


--
-- Name: COLUMN submission_search_object_keywords.pos; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.submission_search_object_keywords.pos IS 'Word position of the keyword in the object.';


--
-- Name: submission_search_object_keyw_submission_search_object_keyw_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_search_object_keyw_submission_search_object_keyw_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submission_search_object_keyw_submission_search_object_keyw_seq OWNER TO "ops-ci";

--
-- Name: submission_search_object_keyw_submission_search_object_keyw_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_search_object_keyw_submission_search_object_keyw_seq OWNED BY public.submission_search_object_keywords.submission_search_object_keyword_id;


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
-- Name: TABLE submission_search_objects; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_search_objects IS 'A list of all search objects indexed in the search index';


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
    submission_setting_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.submission_settings OWNER TO "ops-ci";

--
-- Name: TABLE submission_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_settings IS 'Localized data about submissions';


--
-- Name: submission_settings_submission_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_settings_submission_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submission_settings_submission_setting_id_seq OWNER TO "ops-ci";

--
-- Name: submission_settings_submission_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.submission_settings_submission_setting_id_seq OWNED BY public.submission_settings.submission_setting_id;


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
    stage_id bigint DEFAULT '5'::bigint NOT NULL,
    locale character varying(14),
    status smallint DEFAULT '1'::smallint NOT NULL,
    submission_progress character varying(50) DEFAULT 'start'::character varying NOT NULL,
    work_type smallint DEFAULT '0'::smallint
);


ALTER TABLE public.submissions OWNER TO "ops-ci";

--
-- Name: TABLE submissions; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submissions IS 'All submissions submitted to the context, including incomplete, declined and unpublished submissions.';


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
-- Name: TABLE temporary_files; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.temporary_files IS 'Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';


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
-- Name: usage_stats_institution_temporary_records; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.usage_stats_institution_temporary_records (
    usage_stats_temp_institution_id bigint NOT NULL,
    load_id character varying(50) NOT NULL,
    line_number bigint NOT NULL,
    institution_id bigint NOT NULL
);


ALTER TABLE public.usage_stats_institution_temporary_records OWNER TO "ops-ci";

--
-- Name: TABLE usage_stats_institution_temporary_records; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.usage_stats_institution_temporary_records IS 'Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';


--
-- Name: usage_stats_institution_tempo_usage_stats_temp_institution__seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.usage_stats_institution_tempo_usage_stats_temp_institution__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usage_stats_institution_tempo_usage_stats_temp_institution__seq OWNER TO "ops-ci";

--
-- Name: usage_stats_institution_tempo_usage_stats_temp_institution__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.usage_stats_institution_tempo_usage_stats_temp_institution__seq OWNED BY public.usage_stats_institution_temporary_records.usage_stats_temp_institution_id;


--
-- Name: usage_stats_total_temporary_records; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.usage_stats_total_temporary_records (
    usage_stats_temp_total_id bigint NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    ip character varying(64) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    canonical_url character varying(255) NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(50) NOT NULL
);


ALTER TABLE public.usage_stats_total_temporary_records OWNER TO "ops-ci";

--
-- Name: TABLE usage_stats_total_temporary_records; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.usage_stats_total_temporary_records IS 'Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';


--
-- Name: usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq OWNER TO "ops-ci";

--
-- Name: usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq OWNED BY public.usage_stats_total_temporary_records.usage_stats_temp_total_id;


--
-- Name: usage_stats_unique_item_investigations_temporary_records; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.usage_stats_unique_item_investigations_temporary_records (
    usage_stats_temp_unique_item_id bigint NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    ip character varying(64) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(50) NOT NULL
);


ALTER TABLE public.usage_stats_unique_item_investigations_temporary_records OWNER TO "ops-ci";

--
-- Name: TABLE usage_stats_unique_item_investigations_temporary_records; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.usage_stats_unique_item_investigations_temporary_records IS 'Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';


--
-- Name: usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq OWNER TO "ops-ci";

--
-- Name: usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq OWNED BY public.usage_stats_unique_item_investigations_temporary_records.usage_stats_temp_unique_item_id;


--
-- Name: usage_stats_unique_item_requests_temporary_records; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.usage_stats_unique_item_requests_temporary_records (
    usage_stats_temp_item_id bigint NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    ip character varying(64) NOT NULL,
    user_agent character varying(255) NOT NULL,
    line_number bigint NOT NULL,
    context_id bigint NOT NULL,
    submission_id bigint NOT NULL,
    representation_id bigint,
    submission_file_id bigint,
    assoc_type bigint NOT NULL,
    file_type smallint,
    country character varying(2) DEFAULT ''::character varying NOT NULL,
    region character varying(3) DEFAULT ''::character varying NOT NULL,
    city character varying(255) DEFAULT ''::character varying NOT NULL,
    load_id character varying(50) NOT NULL
);


ALTER TABLE public.usage_stats_unique_item_requests_temporary_records OWNER TO "ops-ci";

--
-- Name: TABLE usage_stats_unique_item_requests_temporary_records; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.usage_stats_unique_item_requests_temporary_records IS 'Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';


--
-- Name: usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq OWNER TO "ops-ci";

--
-- Name: usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq OWNED BY public.usage_stats_unique_item_requests_temporary_records.usage_stats_temp_item_id;


--
-- Name: user_group_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_group_settings (
    user_group_setting_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.user_group_settings OWNER TO "ops-ci";

--
-- Name: TABLE user_group_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.user_group_settings IS 'More data about user groups, including localized properties such as the name.';


--
-- Name: user_group_settings_user_group_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.user_group_settings_user_group_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_group_settings_user_group_setting_id_seq OWNER TO "ops-ci";

--
-- Name: user_group_settings_user_group_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.user_group_settings_user_group_setting_id_seq OWNED BY public.user_group_settings.user_group_setting_id;


--
-- Name: user_group_stage; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_group_stage (
    user_group_stage_id bigint NOT NULL,
    context_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    stage_id bigint NOT NULL
);


ALTER TABLE public.user_group_stage OWNER TO "ops-ci";

--
-- Name: TABLE user_group_stage; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.user_group_stage IS 'Which stages of the editorial workflow the user_groups can access.';


--
-- Name: user_group_stage_user_group_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.user_group_stage_user_group_stage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_group_stage_user_group_stage_id_seq OWNER TO "ops-ci";

--
-- Name: user_group_stage_user_group_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.user_group_stage_user_group_stage_id_seq OWNED BY public.user_group_stage.user_group_stage_id;


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
-- Name: TABLE user_groups; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.user_groups IS 'All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';


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
    user_interest_id bigint NOT NULL,
    user_id bigint NOT NULL,
    controlled_vocab_entry_id bigint NOT NULL
);


ALTER TABLE public.user_interests OWNER TO "ops-ci";

--
-- Name: TABLE user_interests; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.user_interests IS 'Associates users with user interests (which are stored in the controlled vocabulary tables).';


--
-- Name: user_interests_user_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.user_interests_user_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_interests_user_interest_id_seq OWNER TO "ops-ci";

--
-- Name: user_interests_user_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.user_interests_user_interest_id_seq OWNED BY public.user_interests.user_interest_id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_settings (
    user_setting_id bigint NOT NULL,
    user_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.user_settings OWNER TO "ops-ci";

--
-- Name: TABLE user_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.user_settings IS 'More data about users, including localized properties like their name and affiliation.';


--
-- Name: user_settings_user_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.user_settings_user_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_settings_user_setting_id_seq OWNER TO "ops-ci";

--
-- Name: user_settings_user_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.user_settings_user_setting_id_seq OWNED BY public.user_settings.user_setting_id;


--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.user_user_groups (
    user_user_group_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO "ops-ci";

--
-- Name: TABLE user_user_groups; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.user_user_groups IS 'Maps users to their assigned user_groups.';


--
-- Name: user_user_groups_user_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.user_user_groups_user_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_user_groups_user_user_group_id_seq OWNER TO "ops-ci";

--
-- Name: user_user_groups_user_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.user_user_groups_user_user_group_id_seq OWNED BY public.user_user_groups.user_user_group_id;


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


ALTER TABLE public.users OWNER TO "ops-ci";

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.users IS 'All registered users, including authentication data and profile data.';


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
    version_id bigint NOT NULL,
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
-- Name: TABLE versions; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.versions IS 'Describes the installation and upgrade version history for the application and all installed plugins.';


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

COMMENT ON COLUMN public.versions.product_type IS 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself';


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
-- Name: versions_version_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.versions_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.versions_version_id_seq OWNER TO "ops-ci";

--
-- Name: versions_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.versions_version_id_seq OWNED BY public.versions.version_id;


--
-- Name: access_keys access_key_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('public.access_keys_access_key_id_seq'::regclass);


--
-- Name: announcement_settings announcement_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings ALTER COLUMN announcement_setting_id SET DEFAULT nextval('public.announcement_settings_announcement_setting_id_seq'::regclass);


--
-- Name: announcement_type_settings announcement_type_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings ALTER COLUMN announcement_type_setting_id SET DEFAULT nextval('public.announcement_type_settings_announcement_type_setting_id_seq'::regclass);


--
-- Name: announcement_types type_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types ALTER COLUMN type_id SET DEFAULT nextval('public.announcement_types_type_id_seq'::regclass);


--
-- Name: announcements announcement_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcements_announcement_id_seq'::regclass);


--
-- Name: author_settings author_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.author_settings ALTER COLUMN author_setting_id SET DEFAULT nextval('public.author_settings_author_setting_id_seq'::regclass);


--
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: category_settings category_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.category_settings ALTER COLUMN category_setting_id SET DEFAULT nextval('public.category_settings_category_setting_id_seq'::regclass);


--
-- Name: citation_settings citation_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citation_settings ALTER COLUMN citation_setting_id SET DEFAULT nextval('public.citation_settings_citation_setting_id_seq'::regclass);


--
-- Name: citations citation_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations ALTER COLUMN citation_id SET DEFAULT nextval('public.citations_citation_id_seq'::regclass);


--
-- Name: controlled_vocab_entries controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocab_entry_settings controlled_vocab_entry_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings ALTER COLUMN controlled_vocab_entry_setting_id SET DEFAULT nextval('public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq'::regclass);


--
-- Name: controlled_vocabs controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('public.controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: data_object_tombstone_oai_set_objects object_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('public.data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: data_object_tombstone_settings tombstone_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings ALTER COLUMN tombstone_setting_id SET DEFAULT nextval('public.data_object_tombstone_settings_tombstone_setting_id_seq'::regclass);


--
-- Name: data_object_tombstones tombstone_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('public.data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: doi_settings doi_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.doi_settings ALTER COLUMN doi_setting_id SET DEFAULT nextval('public.doi_settings_doi_setting_id_seq'::regclass);


--
-- Name: dois doi_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.dois ALTER COLUMN doi_id SET DEFAULT nextval('public.dois_doi_id_seq'::regclass);


--
-- Name: edit_decisions edit_decision_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('public.edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: email_log log_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log ALTER COLUMN log_id SET DEFAULT nextval('public.email_log_log_id_seq'::regclass);


--
-- Name: email_log_users email_log_user_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log_users ALTER COLUMN email_log_user_id SET DEFAULT nextval('public.email_log_users_email_log_user_id_seq'::regclass);


--
-- Name: email_templates email_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN email_id SET DEFAULT nextval('public.email_templates_email_id_seq'::regclass);


--
-- Name: email_templates_default_data email_templates_default_data_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default_data ALTER COLUMN email_templates_default_data_id SET DEFAULT nextval('public.email_templates_default_data_email_templates_default_data_i_seq'::regclass);


--
-- Name: email_templates_settings email_template_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_settings ALTER COLUMN email_template_setting_id SET DEFAULT nextval('public.email_templates_settings_email_template_setting_id_seq'::regclass);


--
-- Name: event_log log_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log ALTER COLUMN log_id SET DEFAULT nextval('public.event_log_log_id_seq'::regclass);


--
-- Name: event_log_settings event_log_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log_settings ALTER COLUMN event_log_setting_id SET DEFAULT nextval('public.event_log_settings_event_log_setting_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: files file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.files ALTER COLUMN file_id SET DEFAULT nextval('public.files_file_id_seq'::regclass);


--
-- Name: filter_groups filter_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('public.filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filter_settings filter_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_settings ALTER COLUMN filter_setting_id SET DEFAULT nextval('public.filter_settings_filter_setting_id_seq'::regclass);


--
-- Name: filters filter_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters ALTER COLUMN filter_id SET DEFAULT nextval('public.filters_filter_id_seq'::regclass);


--
-- Name: genre_settings genre_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genre_settings ALTER COLUMN genre_setting_id SET DEFAULT nextval('public.genre_settings_genre_setting_id_seq'::regclass);


--
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: institution_ip institution_ip_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_ip ALTER COLUMN institution_ip_id SET DEFAULT nextval('public.institution_ip_institution_ip_id_seq'::regclass);


--
-- Name: institution_settings institution_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_settings ALTER COLUMN institution_setting_id SET DEFAULT nextval('public.institution_settings_institution_setting_id_seq'::regclass);


--
-- Name: institutions institution_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: library_file_settings library_file_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_file_settings ALTER COLUMN library_file_setting_id SET DEFAULT nextval('public.library_file_settings_library_file_setting_id_seq'::regclass);


--
-- Name: library_files file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files ALTER COLUMN file_id SET DEFAULT nextval('public.library_files_file_id_seq'::regclass);


--
-- Name: metrics_context metrics_context_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_context ALTER COLUMN metrics_context_id SET DEFAULT nextval('public.metrics_context_metrics_context_id_seq'::regclass);


--
-- Name: metrics_counter_submission_daily metrics_counter_submission_daily_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily ALTER COLUMN metrics_counter_submission_daily_id SET DEFAULT nextval('public.metrics_counter_submission_da_metrics_counter_submission_da_seq'::regclass);


--
-- Name: metrics_counter_submission_institution_daily metrics_counter_submission_institution_daily_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily ALTER COLUMN metrics_counter_submission_institution_daily_id SET DEFAULT nextval('public.metrics_counter_submission_in_metrics_counter_submission_in_seq'::regclass);


--
-- Name: metrics_counter_submission_institution_monthly metrics_counter_submission_institution_monthly_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly ALTER COLUMN metrics_counter_submission_institution_monthly_id SET DEFAULT nextval('public.metrics_counter_submission_in_metrics_counter_submission_i_seq1'::regclass);


--
-- Name: metrics_counter_submission_monthly metrics_counter_submission_monthly_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly ALTER COLUMN metrics_counter_submission_monthly_id SET DEFAULT nextval('public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq'::regclass);


--
-- Name: metrics_submission metrics_submission_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission ALTER COLUMN metrics_submission_id SET DEFAULT nextval('public.metrics_submission_metrics_submission_id_seq'::regclass);


--
-- Name: metrics_submission_geo_daily metrics_submission_geo_daily_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily ALTER COLUMN metrics_submission_geo_daily_id SET DEFAULT nextval('public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq'::regclass);


--
-- Name: metrics_submission_geo_monthly metrics_submission_geo_monthly_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly ALTER COLUMN metrics_submission_geo_monthly_id SET DEFAULT nextval('public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq'::regclass);


--
-- Name: navigation_menu_item_assignment_settings navigation_menu_item_assignment_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings ALTER COLUMN navigation_menu_item_assignment_setting_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1'::regclass);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_item_settings navigation_menu_item_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings ALTER COLUMN navigation_menu_item_setting_id SET DEFAULT nextval('public.navigation_menu_item_settings_navigation_menu_item_setting__seq'::regclass);


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
-- Name: notification_settings notification_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_settings ALTER COLUMN notification_setting_id SET DEFAULT nextval('public.notification_settings_notification_setting_id_seq'::regclass);


--
-- Name: notification_subscription_settings setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: oai_resumption_tokens oai_resumption_token_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens ALTER COLUMN oai_resumption_token_id SET DEFAULT nextval('public.oai_resumption_tokens_oai_resumption_token_id_seq'::regclass);


--
-- Name: plugin_settings plugin_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.plugin_settings ALTER COLUMN plugin_setting_id SET DEFAULT nextval('public.plugin_settings_plugin_setting_id_seq'::regclass);


--
-- Name: publication_categories publication_category_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories ALTER COLUMN publication_category_id SET DEFAULT nextval('public.publication_categories_publication_category_id_seq'::regclass);


--
-- Name: publication_galley_settings publication_galley_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galley_settings ALTER COLUMN publication_galley_setting_id SET DEFAULT nextval('public.publication_galley_settings_publication_galley_setting_id_seq'::regclass);


--
-- Name: publication_galleys galley_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys ALTER COLUMN galley_id SET DEFAULT nextval('public.publication_galleys_galley_id_seq'::regclass);


--
-- Name: publication_settings publication_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_settings ALTER COLUMN publication_setting_id SET DEFAULT nextval('public.publication_settings_publication_setting_id_seq'::regclass);


--
-- Name: publications publication_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);


--
-- Name: queries query_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.queries ALTER COLUMN query_id SET DEFAULT nextval('public.queries_query_id_seq'::regclass);


--
-- Name: query_participants query_participant_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.query_participants ALTER COLUMN query_participant_id SET DEFAULT nextval('public.query_participants_query_participant_id_seq'::regclass);


--
-- Name: review_assignments review_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments ALTER COLUMN review_id SET DEFAULT nextval('public.review_assignments_review_id_seq'::regclass);


--
-- Name: review_files review_file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files ALTER COLUMN review_file_id SET DEFAULT nextval('public.review_files_review_file_id_seq'::regclass);


--
-- Name: review_form_element_settings review_form_element_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_element_settings ALTER COLUMN review_form_element_setting_id SET DEFAULT nextval('public.review_form_element_settings_review_form_element_setting_id_seq'::regclass);


--
-- Name: review_form_elements review_form_element_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('public.review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_form_responses review_form_response_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_responses ALTER COLUMN review_form_response_id SET DEFAULT nextval('public.review_form_responses_review_form_response_id_seq'::regclass);


--
-- Name: review_form_settings review_form_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_settings ALTER COLUMN review_form_setting_id SET DEFAULT nextval('public.review_form_settings_review_form_setting_id_seq'::regclass);


--
-- Name: review_forms review_form_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('public.review_forms_review_form_id_seq'::regclass);


--
-- Name: review_round_files review_round_file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files ALTER COLUMN review_round_file_id SET DEFAULT nextval('public.review_round_files_review_round_file_id_seq'::regclass);


--
-- Name: review_rounds review_round_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('public.review_rounds_review_round_id_seq'::regclass);


--
-- Name: scheduled_tasks scheduled_task_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.scheduled_tasks ALTER COLUMN scheduled_task_id SET DEFAULT nextval('public.scheduled_tasks_scheduled_task_id_seq'::regclass);


--
-- Name: section_settings section_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.section_settings ALTER COLUMN section_setting_id SET DEFAULT nextval('public.section_settings_section_setting_id_seq'::regclass);


--
-- Name: sections section_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- Name: server_settings server_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.server_settings ALTER COLUMN server_setting_id SET DEFAULT nextval('public.server_settings_server_setting_id_seq'::regclass);


--
-- Name: servers server_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.servers ALTER COLUMN server_id SET DEFAULT nextval('public.servers_server_id_seq'::regclass);


--
-- Name: site site_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site ALTER COLUMN site_id SET DEFAULT nextval('public.site_site_id_seq'::regclass);


--
-- Name: site_settings site_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN site_setting_id SET DEFAULT nextval('public.site_settings_site_setting_id_seq'::regclass);


--
-- Name: stage_assignments stage_assignment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('public.stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: subeditor_submission_group subeditor_submission_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group ALTER COLUMN subeditor_submission_group_id SET DEFAULT nextval('public.subeditor_submission_group_subeditor_submission_group_id_seq'::regclass);


--
-- Name: submission_comments comment_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('public.submission_comments_comment_id_seq'::regclass);


--
-- Name: submission_file_revisions revision_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions ALTER COLUMN revision_id SET DEFAULT nextval('public.submission_file_revisions_revision_id_seq'::regclass);


--
-- Name: submission_file_settings submission_file_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_settings ALTER COLUMN submission_file_setting_id SET DEFAULT nextval('public.submission_file_settings_submission_file_setting_id_seq'::regclass);


--
-- Name: submission_files submission_file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN submission_file_id SET DEFAULT nextval('public.submission_files_submission_file_id_seq'::regclass);


--
-- Name: submission_search_keyword_list keyword_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('public.submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: submission_search_object_keywords submission_search_object_keyword_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords ALTER COLUMN submission_search_object_keyword_id SET DEFAULT nextval('public.submission_search_object_keyw_submission_search_object_keyw_seq'::regclass);


--
-- Name: submission_search_objects object_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('public.submission_search_objects_object_id_seq'::regclass);


--
-- Name: submission_settings submission_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_settings ALTER COLUMN submission_setting_id SET DEFAULT nextval('public.submission_settings_submission_setting_id_seq'::regclass);


--
-- Name: submissions submission_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions ALTER COLUMN submission_id SET DEFAULT nextval('public.submissions_submission_id_seq'::regclass);


--
-- Name: temporary_files file_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.temporary_files ALTER COLUMN file_id SET DEFAULT nextval('public.temporary_files_file_id_seq'::regclass);


--
-- Name: usage_stats_institution_temporary_records usage_stats_temp_institution_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_institution_temporary_records ALTER COLUMN usage_stats_temp_institution_id SET DEFAULT nextval('public.usage_stats_institution_tempo_usage_stats_temp_institution__seq'::regclass);


--
-- Name: usage_stats_total_temporary_records usage_stats_temp_total_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records ALTER COLUMN usage_stats_temp_total_id SET DEFAULT nextval('public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq'::regclass);


--
-- Name: usage_stats_unique_item_investigations_temporary_records usage_stats_temp_unique_item_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records ALTER COLUMN usage_stats_temp_unique_item_id SET DEFAULT nextval('public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq'::regclass);


--
-- Name: usage_stats_unique_item_requests_temporary_records usage_stats_temp_item_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records ALTER COLUMN usage_stats_temp_item_id SET DEFAULT nextval('public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq'::regclass);


--
-- Name: user_group_settings user_group_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_settings ALTER COLUMN user_group_setting_id SET DEFAULT nextval('public.user_group_settings_user_group_setting_id_seq'::regclass);


--
-- Name: user_group_stage user_group_stage_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage ALTER COLUMN user_group_stage_id SET DEFAULT nextval('public.user_group_stage_user_group_stage_id_seq'::regclass);


--
-- Name: user_groups user_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('public.user_groups_user_group_id_seq'::regclass);


--
-- Name: user_interests user_interest_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_interests ALTER COLUMN user_interest_id SET DEFAULT nextval('public.user_interests_user_interest_id_seq'::regclass);


--
-- Name: user_settings user_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_settings ALTER COLUMN user_setting_id SET DEFAULT nextval('public.user_settings_user_setting_id_seq'::regclass);


--
-- Name: user_user_groups user_user_group_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN user_user_group_id SET DEFAULT nextval('public.user_user_groups_user_user_group_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: versions version_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.versions ALTER COLUMN version_id SET DEFAULT nextval('public.versions_version_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


--
-- Data for Name: announcement_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcement_settings (announcement_setting_id, announcement_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: announcement_type_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcement_type_settings (announcement_type_setting_id, type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_types; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcement_types (type_id, context_id) FROM stdin;
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Data for Name: author_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.author_settings (author_setting_id, author_id, locale, setting_name, setting_value) FROM stdin;
1	1	en	affiliation	University of Bologna
2	1		country	IT
3	1	en	familyName	Corino
4	1	en	givenName	Carlo
14	3	fr_CA	familyName	\N
16	3	fr_CA	givenName	\N
95	21	en	affiliation	University of Wolverhampton
96	21		country	GB
97	21	en	familyName	Daniel
98	21	en	givenName	Patricia
99	22	en	affiliation	University of Nairobi
100	22		country	KE
101	22	en	familyName	Baiyewu
5	2	en	affiliation	University of Windsor
6	2		country	CA
7	2	en	familyName	Kwantes
8	2	en	givenName	Catherine
13	3		country	FI
15	3	en	familyName	Kekkonen
17	3	en	givenName	Urho
31	5	en	affiliation	University of Alberta
32	5		country	CA
33	5	en	familyName	Montgomerie
34	5	en	givenName	Craig
35	6	en	affiliation	University of Victoria
36	6		country	CA
37	6	en	familyName	Irvine
38	6	en	givenName	Mark
39	7	en	affiliation	University of Alberta
40	7		country	CA
41	7	en	familyName	Montgomerie
42	7	en	givenName	Craig
43	8	en	affiliation	University of Victoria
44	8		country	CA
45	8	en	familyName	Irvine
46	8	en	givenName	Mark
47	9	en	affiliation	Alexandria University
48	9		country	EG
49	9	en	familyName	Diouf
50	9	en	givenName	Diaga
51	10	en	affiliation	University of Toronto
52	10		country	CA
53	10	en	familyName	Phillips
54	10	en	givenName	Dana
55	11	en	affiliation	University College Cork
56	11		country	IE
57	11	en	familyName	Sokoloff
58	11	en	givenName	Domatilia
59	12	en	affiliation	Indiana University
60	12		country	US
61	12	en	familyName	Ostrom
62	12	en	givenName	Elinor
63	13	en	affiliation	Indiana University
64	13		country	US
65	13	en	familyName	van Laerhoven
66	13	en	givenName	Frank
67	14	en	affiliation	University of Rome
68	14		country	IT
69	14	en	familyName	Paglieri
70	14	en	givenName	Fabio
71	15	en	affiliation	University of Cape Town
72	15		country	ZA
73	15	en	familyName	Mwandenga
74	15	en	givenName	John
75	16	en	affiliation	Aalborg University
76	16		country	DK
77	16	en	familyName	Novak
78	16	en	givenName	John
79	17	en	affiliation	Stanford University
80	17		country	US
81	17	en	familyName	Al-Khafaji
82	17	en	givenName	Karim
83	18	en	affiliation	Stanford University
84	18		country	US
85	18	en	familyName	Morse
86	18	en	givenName	Margaret
87	19	en	affiliation	Australian National University
88	19		country	AU
89	19	en	familyName	Christopher
90	19	en	givenName	Leo
91	20	en	affiliation	University of Cape Town
92	20		country	ZA
93	20	en	familyName	Kumiega
94	20	en	givenName	Lise
102	22	en	givenName	Rana
103	23	en	affiliation	Barcelona University
104	23		country	ES
105	23	en	familyName	Rossi
106	23	en	givenName	Rosanna
107	24	en	affiliation	University of Tehran
108	24		country	IR
109	24	en	familyName	Karbasizaed
110	24	en	givenName	Vajiheh
111	25	en	affiliation	University of Windsor
112	25		country	CA
113	25	en	familyName	Williamson
114	25	en	givenName	Valerie
115	26	en	affiliation	CUNY
116	26		country	US
117	26	en	familyName	Woods
118	26	en	givenName	Zita
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.authors (author_id, email, include_in_browse, publication_id, seq, user_group_id) FROM stdin;
1	ccorino@mailinator.com	1	1	0	4
2	ckwantes@mailinator.com	1	2	0	4
3	notanemailukk@mailinator.com	1	2	1	4
5	cmontgomerie@mailinator.com	1	3	0	4
6	mirvine@mailinator.com	1	3	0	4
7	cmontgomerie@mailinator.com	1	4	0	4
8	mirvine@mailinator.com	1	4	0	4
9	ddiouf@mailinator.com	1	5	0	4
10	dphillips@mailinator.com	1	6	0	4
11	dsokoloff@mailinator.com	1	7	0	4
12	eostrom@mailinator.com	1	8	0	4
13	fvanlaerhoven@mailinator.com	1	8	0	4
14	fpaglieri@mailinator.com	1	9	0	4
15	jmwandenga@mailinator.com	1	10	0	4
16	jnovak@mailinator.com	1	11	0	4
17	kalkhafaji@mailinator.com	1	12	0	4
18	mmorse@mailinator.com	1	12	0	4
19	lchristopher@mailinator.com	1	13	0	4
20	lkumiega@mailinator.com	1	14	0	4
21	pdaniel@mailinator.com	1	15	0	4
22	rbaiyewu@mailinator.com	1	16	0	4
23	rrossi@mailinator.com	1	17	0	4
24	vkarbasizaed@mailinator.com	1	18	0	4
25	vwilliamson@mailinator.com	1	19	0	4
26	zwoods@mailinator.com	1	20	0	4
\.


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
-- Data for Name: category_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.category_settings (category_setting_id, category_id, locale, setting_name, setting_value) FROM stdin;
1	1		sortOption	title-ASC
2	1	en	title	History
3	1	fr_CA	title	
4	1	en	description	
5	1	fr_CA	description	
6	2		sortOption	title-ASC
7	2	en	title	Biology
8	2	fr_CA	title	
9	2	en	description	
10	2	fr_CA	description	
11	3		sortOption	title-ASC
12	3	en	title	Social sciences
13	3	fr_CA	title	
14	3	en	description	
15	3	fr_CA	description	
16	4		sortOption	title-ASC
17	4	en	title	Mathematics
18	4	fr_CA	title	
19	4	en	description	
20	4	fr_CA	description	
21	5		sortOption	title-ASC
22	5	en	title	Cultural History
23	5	fr_CA	title	
24	5	en	description	
25	5	fr_CA	description	
\.


--
-- Data for Name: citation_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.citation_settings (citation_setting_id, citation_id, locale, setting_name, setting_value, setting_type) FROM stdin;
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
3	7	1
4	7	2
76	32	1
77	32	2
81	37	1
82	37	2
83	37	3
85	52	1
90	57	1
91	57	2
92	57	3
93	57	4
96	62	1
97	62	2
99	67	1
34	12	1
35	12	2
36	12	3
37	12	4
38	12	5
39	12	6
40	12	7
41	12	8
110	72	1
111	72	2
112	72	3
113	72	4
114	72	5
115	72	6
116	72	7
117	72	8
118	72	9
119	72	10
122	82	1
123	82	2
127	92	1
128	92	2
66	17	1
67	17	2
68	17	3
69	17	4
70	17	5
71	17	6
72	17	7
73	17	8
129	92	3
132	97	1
133	97	2
\.


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_setting_id, controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
3	3	en	submissionKeyword	employees	string
4	4	en	submissionKeyword	survey	string
76	76	en	submissionKeyword	education	string
77	77	en	submissionKeyword	citizenship	string
81	81	en	submissionKeyword	Common pool resource	string
82	82	en	submissionKeyword	common property	string
83	83	en	submissionKeyword	intellectual developments	string
85	85	en	submissionKeyword	water	string
90	90	en	submissionKeyword	Development	string
91	91	en	submissionKeyword	engineering education	string
92	92	en	submissionKeyword	service learning	string
93	93	en	submissionKeyword	sustainability	string
96	96	en	submissionKeyword	pigs	string
97	97	en	submissionKeyword	food security	string
99	99	en	submissionKeyword	water	string
34	34	en	submissionKeyword	Integrating Technology	string
35	35	en	submissionKeyword	Computer Skills	string
36	36	en	submissionKeyword	Survey	string
37	37	en	submissionKeyword	Alberta	string
38	38	en	submissionKeyword	National	string
39	39	en	submissionKeyword	Provincial	string
40	40	en	submissionKeyword	Professional Development	string
41	41	en	submissionKeyword	employees	string
110	110	en	submissionKeyword	21st Century	string
111	111	en	submissionKeyword	Diversity	string
112	112	en	submissionKeyword	Multilingual	string
113	113	en	submissionKeyword	Multiethnic	string
114	114	en	submissionKeyword	Participatory Pedagogy	string
115	115	en	submissionKeyword	Language	string
116	116	en	submissionKeyword	Culture	string
117	117	en	submissionKeyword	Gender	string
118	118	en	submissionKeyword	Egalitarianism	string
119	119	en	submissionKeyword	Social Transformation	string
122	122	en	submissionKeyword	cattle	string
123	123	en	submissionKeyword	food security	string
127	127	en	submissionKeyword	Self-Organization	string
128	128	en	submissionKeyword	Multi-Level Institutions	string
66	66	en	submissionKeyword	Integrating Technology	string
67	67	en	submissionKeyword	Computer Skills	string
68	68	en	submissionKeyword	Survey	string
69	69	en	submissionKeyword	Alberta	string
70	70	en	submissionKeyword	National	string
71	71	en	submissionKeyword	Provincial	string
72	72	en	submissionKeyword	Professional Development	string
73	73	en	submissionKeyword	employees	string
129	129	en	submissionKeyword	Goverance	string
132	132	en	submissionKeyword	education	string
133	133	en	submissionKeyword	citizenship	string
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

COPY public.data_object_tombstone_settings (tombstone_setting_id, tombstone_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: data_object_tombstones; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.data_object_tombstones (tombstone_id, data_object_id, date_deleted, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Data for Name: doi_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.doi_settings (doi_setting_id, doi_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: dois; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.dois (doi_id, context_id, doi, status) FROM stdin;
\.


--
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
1	4	\N	5	\N	3	8	2026-01-19 05:40:18
2	4	\N	5	\N	3	16	2026-01-19 05:40:21
3	4	\N	5	\N	3	8	2026-01-19 05:40:24
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	0	2026-01-19 05:38:24	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
2	1048585	1	0	2026-01-19 05:38:24	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
3	1048585	1	0	2026-01-19 05:38:24	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Carlo Corino" <ccorino@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/1">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
4	1048585	2	0	2026-01-19 05:39:12	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
27	1048585	7	0	2026-01-19 05:41:32	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank van Laerhoven" <fvanlaerhoven@mailinator.com>			Submission Acknowledgement	<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br>Elinor Ostrom, Indiana University<br>Frank van Laerhoven, Indiana University</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
5	1048585	2	0	2026-01-19 05:39:12	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
6	1048585	2	0	2026-01-19 05:39:12	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/2">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
7	1048585	2	0	2026-01-19 05:39:12	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Urho Kekkonen" <notanemailukk@mailinator.com>			Submission Acknowledgement	<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br>Catherine Kwantes, University of Windsor<br>Urho Kekkonen, </p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
8	1048585	3	0	2026-01-19 05:39:36	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
9	1048585	3	0	2026-01-19 05:39:36	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
10	1048585	3	0	2026-01-19 05:39:36	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Craig Montgomerie" <cmontgomerie@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/3">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
11	1048585	3	0	2026-01-19 05:39:36	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Irvine" <mirvine@mailinator.com>			Submission Acknowledgement	<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br>Craig Montgomerie, University of Alberta<br>Mark Irvine, University of Victoria</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
12	1048585	4	0	2026-01-19 05:40:13	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
13	1048585	4	0	2026-01-19 05:40:13	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
14	1048585	4	0	2026-01-19 05:40:13	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
15	1048585	4	3	2026-01-19 05:40:18	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
16	1048585	4	3	2026-01-19 05:40:21	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			We have reversed the decision to decline your submission	<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>\n
17	1048585	4	3	2026-01-19 05:40:24	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
18	1048585	5	0	2026-01-19 05:40:42	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
19	1048585	5	0	2026-01-19 05:40:42	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
20	1048585	5	0	2026-01-19 05:40:42	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
21	1048585	6	0	2026-01-19 05:41:10	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
28	1048585	8	0	2026-01-19 05:41:53	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
22	1048585	6	0	2026-01-19 05:41:10	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
23	1048585	6	0	2026-01-19 05:41:10	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Domatilia Sokoloff" <dsokoloff@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/6">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
24	1048585	7	0	2026-01-19 05:41:32	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
25	1048585	7	0	2026-01-19 05:41:32	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
26	1048585	7	0	2026-01-19 05:41:32	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Elinor Ostrom" <eostrom@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/7">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
29	1048585	8	0	2026-01-19 05:41:53	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
30	1048585	8	0	2026-01-19 05:41:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/8">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
31	1048585	9	0	2026-01-19 05:42:15	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
32	1048585	9	0	2026-01-19 05:42:15	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
33	1048585	9	0	2026-01-19 05:42:15	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/9">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
43	1048585	12	0	2026-01-19 05:43:19	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Leo Christopher" <lchristopher@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/12">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
34	1048585	10	0	2026-01-19 05:42:36	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
35	1048585	10	0	2026-01-19 05:42:36	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
36	1048585	10	0	2026-01-19 05:42:36	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Novak" <jnovak@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/10">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
37	1048585	11	0	2026-01-19 05:42:58	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
44	1048585	13	0	2026-01-19 05:43:40	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
45	1048585	13	0	2026-01-19 05:43:40	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
64	1048585	19	0	2026-01-19 05:45:49	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/19">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
38	1048585	11	0	2026-01-19 05:42:58	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
39	1048585	11	0	2026-01-19 05:42:58	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Karim Al-Khafaji" <kalkhafaji@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
40	1048585	11	0	2026-01-19 05:42:58	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Margaret Morse" <mmorse@mailinator.com>			Submission Acknowledgement	<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br>Karim Al-Khafaji, Stanford University<br>Margaret Morse, Stanford University</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
41	1048585	12	0	2026-01-19 05:43:19	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
42	1048585	12	0	2026-01-19 05:43:19	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
46	1048585	13	0	2026-01-19 05:43:40	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
47	1048585	14	0	2026-01-19 05:44:02	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
48	1048585	14	0	2026-01-19 05:44:02	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
49	1048585	14	0	2026-01-19 05:44:02	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Patricia Daniel" <pdaniel@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
50	1048585	15	0	2026-01-19 05:44:23	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
51	1048585	15	0	2026-01-19 05:44:23	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
52	1048585	15	0	2026-01-19 05:44:23	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/15">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
53	1048585	16	0	2026-01-19 05:44:45	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
54	1048585	16	0	2026-01-19 05:44:45	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
55	1048585	16	0	2026-01-19 05:44:45	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rosanna Rossi" <rrossi@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/16">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
56	1048585	17	0	2026-01-19 05:45:06	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
57	1048585	17	0	2026-01-19 05:45:06	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
58	1048585	17	0	2026-01-19 05:45:06	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/17">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
59	1048585	18	0	2026-01-19 05:45:28	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
60	1048585	18	0	2026-01-19 05:45:28	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
61	1048585	18	0	2026-01-19 05:45:28	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/18">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
62	1048585	19	0	2026-01-19 05:45:49	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
63	1048585	19	0	2026-01-19 05:45:49	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
\.


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log_users (email_log_user_id, email_log_id, user_id) FROM stdin;
1	1	5
2	2	4
3	3	7
4	4	5
5	5	4
6	6	8
7	8	5
8	9	4
9	10	9
10	12	5
11	13	4
12	14	10
13	15	10
14	16	10
15	17	10
16	18	5
17	19	4
18	20	11
19	21	5
20	22	4
21	23	12
22	24	5
23	25	4
24	26	13
25	28	5
26	29	4
27	30	14
28	31	5
29	32	4
30	33	15
31	34	5
32	35	4
33	36	16
34	37	5
35	38	4
36	39	17
37	41	4
38	42	5
39	43	18
40	44	4
41	45	5
42	46	19
43	47	4
44	48	5
45	49	20
46	50	4
47	51	5
48	52	21
49	53	4
50	54	5
51	55	22
52	56	4
53	57	5
54	58	23
55	59	4
56	60	5
57	61	24
58	62	4
59	63	5
60	64	25
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates (email_id, email_key, context_id, alternate_to) FROM stdin;
1	EDITOR_ASSIGN_PRODUCTION	1	DISCUSSION_NOTIFICATION_PRODUCTION
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_default_data (email_templates_default_data_id, email_key, locale, name, subject, body) FROM stdin;
1	PASSWORD_RESET_CONFIRM	en	Password Reset Confirm	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}
3	USER_REGISTER	en	User Created	Server Registration	{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server's list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}
5	USER_VALIDATE_CONTEXT	en	Validate Email (Server Registration)	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$serverSignature}
7	USER_VALIDATE_SITE	en	Validate Email (Site)	Validate Your Account	{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}
9	SUBMISSION_ACK	en	Submission Acknowledgement (Pending Moderation)	Thank you for your submission to {$serverName}	<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}
11	POSTED_ACK	en	Posted Acknowledgement	Preprint Posted Acknowledgement	{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}
13	POSTED_NEW_VERSION_ACK	en	New Version Posted	New Version Posted Acknowledgement	<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$serverName}. The new version is now <a href="{$submissionPublishedUrl}">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}
15	SUBMISSION_ACK_CAN_POST	en	Submission Acknowledgement (No Moderation Required)	Thank you for your submission to {$serverName}	<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href="{$authorSubmissionUrl}">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}
17	SUBMISSION_ACK_NOT_USER	en	Submission Confirmation (Other Authors)	Submission Acknowledgement	<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$serverName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$serverSignature}
19	EDITOR_ASSIGN	en	Editor Assigned	You have been assigned as a moderator on a submission to {$serverName}	<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href="{$submissionUrl}">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}
21	EDITOR_DECISION_ACCEPT	en	Submission Accepted	Your submission has passed moderation at {$serverName}	<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$serverName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$serverName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}
23	EDITOR_DECISION_INITIAL_DECLINE	en	Submission Declined	Your submission has been declined	<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}
25	EDITOR_DECISION_REVERT_INITIAL_DECLINE	en	Reinstate Submission Declined Without Review	We have reversed the decision to decline your submission	<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="{$authorSubmissionUrl}">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n
27	EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	en	Notify Other Authors	An update regarding your submission	<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}
29	STATISTICS_REPORT_NOTIFICATION	en	Statistics Report Notification	Preprint Server activity for {$month}, {$year}	\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n\t<li>New submissions this month: {$newSubmissions}</li>\n\t<li>Declined submissions this month: {$declinedSubmissions}</li>\n\t<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n\t<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href="{$editorialStatsLink}">trends</a> and <a href="{$publicationStatsLink}">posted preprint stats</a>. A full copy of this month's trends is attached.<br />\n<br />\nSincerely,<br />\n{$serverSignature}
31	ANNOUNCEMENT	en	New Announcement	{$announcementTitle}	<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href="{$announcementUrl}">full announcement</a>.
33	DISCUSSION_NOTIFICATION_PRODUCTION	en	Discussion (Production)	A message regarding {$serverName}	Please enter your message.
35	EDITOR_ASSIGN_PRODUCTION	en	Editor Assigned	You have been assigned as a moderator on a submission to {$serverName}	<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href="{$submissionUrl}">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}
37	VERSION_CREATED	en	Version Created	A new version was created for {$submissionTitle}	<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href="{$submissionUrl}">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href="{$serverUrl}">{$serverName}</a>.</p>
39	SUBMISSION_SAVED_FOR_LATER	en	Submission Saved for Later	Resume your submission to {$serverName}	<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href="{$submissionWizardUrl}">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href="{$serverUrl}">{$serverName}</a>.</p>
41	SUBMISSION_NEEDS_EDITOR	en	Submission Needs Editor	A new submission needs an editor to be assigned: {$submissionTitle}	<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href="{$serverUrl}">{$serverName}</a>.</p>
43	ORCID_COLLECT_AUTHOR_ID	en	orcidCollectAuthorId	Submission ORCID	Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href="{$orcidAboutUrl}">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
45	ORCID_REQUEST_AUTHOR_AUTHORIZATION	en	orcidRequestAuthorAuthorization	Requesting ORCID record access	Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission "{$submissionTitle}" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href="{$orcidAboutUrl}">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n
47	PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de la réinitialisation du mot de passe	Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}
48	USER_REGISTER	fr_CA	Création de l'utilisateur-trice	Inscription au serveur	{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu'utilisateur-trice pour {$serverName}. Votre nom d'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}
49	USER_VALIDATE_CONTEXT	fr_CA		Valider votre compte	{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l'utiliser vous devez d'abord valider votre compte de courriel. Pour ce faire, vous n'avez qu'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}
50	USER_VALIDATE_SITE	fr_CA	Valider le courriel (site)		
51	SUBMISSION_ACK	fr_CA	Confirmation de soumission	Accusé de réception de la soumission à {$serverName}	<p>{$recipientName},</p><p>Nous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Nous l'avons bien reçu et un membre de notre équipe éditorial le prendre en charge sous peu. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition en accédant au site Web de la revue :</p>\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}
52	POSTED_ACK	fr_CA			
53	POSTED_NEW_VERSION_ACK	fr_CA			
54	SUBMISSION_ACK_CAN_POST	fr_CA		Accusé de réception de la soumission à {$serverName}	
55	SUBMISSION_ACK_NOT_USER	fr_CA	Confirmation de soumission (autres auteur-es)	Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}
56	EDITOR_ASSIGN	fr_CA	Rédacteur-trice assigné		
57	EDITOR_DECISION_ACCEPT	fr_CA	Soumission acceptée		
58	EDITOR_DECISION_INITIAL_DECLINE	fr_CA	Soumission refusée avant évaluation	Décision du rédacteur	<p>{$recipientName},</p><p>Nous avons le regret de vous informer qu'après avoir évaluer votre manuscrit, {$submissionTitle}, le-la rédacteur-trice en a conclue qu'il ne rencontre pas les exigences nécessaires pour être publier dans {$serverName}.</p><p>Cordialement,</p>{$signature}
59	EDITOR_DECISION_REVERT_INITIAL_DECLINE	fr_CA	Rétablir une soumission refusée sans évaluation	Nous avons renversé la décision de rejeter votre soumission	<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e modérateur-trice évaluera votre soumission dans les détails afin de décider si votre soumission sera rejetée ou pourra être envoyée en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href="{$authorSubmissionUrl}">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n
60	EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	fr_CA	Envoyer une notification aux autres auteur-es	Mise à jour concernant votre soumission	<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$serverName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l'intention de l'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}
61	STATISTICS_REPORT_NOTIFICATION	fr_CA	Notification sur les rapports statistiques		
62	ANNOUNCEMENT	fr_CA	Nouvelle annonce		
63	DISCUSSION_NOTIFICATION_PRODUCTION	fr_CA	Discussion (production)	Un message à propos de la revue {$serverName}	Prière de saisir votre message.
64	EDITOR_ASSIGN_PRODUCTION	fr_CA	Rédacteur-trice assigné		
65	VERSION_CREATED	fr_CA	Version créée	Une nouvelle version a été créée pour {$submissionTitle}	<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href="{$serverUrl}">{$serverName}</a> pour vous informer qu'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href="{$submissionUrl}">{$submissionTitle}</a></p><hr>
66	SUBMISSION_SAVED_FOR_LATER	fr_CA	Soumission incomplète sauvegardée	Reprendre votre soumission à {$serverName}	<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href="{$submissionWizardUrl}">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href="{$serverUrl}">{$serverName}</a>.</p>
67	SUBMISSION_NEEDS_EDITOR	fr_CA	Soumission en attente de rédacteur-trice	Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}	<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href="{$serverUrl}">{$serverName}</a>.</p>
68	ORCID_COLLECT_AUTHOR_ID	fr_CA	orcidCollectAuthorId	Soumission ORCID	{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d'auteur ou d'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
69	ORCID_REQUEST_AUTHOR_AUTHORIZATION	fr_CA	orcidRequestAuthorAuthorization	Demande d'accès au dossier ORCID	{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l'accès en suivant les instructions.<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
\.


--
-- Data for Name: email_templates_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_templates_settings (email_template_setting_id, email_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log (log_id, assoc_type, assoc_id, user_id, date_logged, event_type, message, is_translated) FROM stdin;
1	1048585	1	7	2026-01-19 05:38:12	268435458	submission.event.general.metadataUpdated	f
2	1048585	1	7	2026-01-19 05:38:12	268435458	submission.event.general.metadataUpdated	f
3	515	1	7	2026-01-19 05:38:21	1342177281	submission.event.fileUploaded	f
4	1048585	1	7	2026-01-19 05:38:21	1342177288	submission.event.fileRevised	f
5	515	1	7	2026-01-19 05:38:23	1342177296	submission.event.fileEdited	f
6	1048585	1	7	2026-01-19 05:38:24	268435457	submission.event.submissionSubmitted	f
7	1048585	2	8	2026-01-19 05:38:31	268435458	submission.event.general.metadataUpdated	f
8	1048585	2	8	2026-01-19 05:38:31	268435458	submission.event.general.metadataUpdated	f
9	1048585	2	8	2026-01-19 05:38:48	268435458	submission.event.general.metadataUpdated	f
10	515	2	8	2026-01-19 05:38:56	1342177281	submission.event.fileUploaded	f
11	1048585	2	8	2026-01-19 05:38:56	1342177288	submission.event.fileRevised	f
12	515	2	8	2026-01-19 05:38:58	1342177296	submission.event.fileEdited	f
13	1048585	2	8	2026-01-19 05:39:12	268435457	submission.event.submissionSubmitted	f
14	1048585	2	3	2026-01-19 05:39:18	268435462	publication.event.published	f
15	1048585	3	9	2026-01-19 05:39:23	268435458	submission.event.general.metadataUpdated	f
16	1048585	3	9	2026-01-19 05:39:24	268435458	submission.event.general.metadataUpdated	f
17	515	3	9	2026-01-19 05:39:32	1342177281	submission.event.fileUploaded	f
18	1048585	3	9	2026-01-19 05:39:32	1342177288	submission.event.fileRevised	f
19	515	3	9	2026-01-19 05:39:35	1342177296	submission.event.fileEdited	f
20	1048585	3	9	2026-01-19 05:39:35	268435457	submission.event.submissionSubmitted	f
21	1048585	3	3	2026-01-19 05:39:40	268435462	publication.event.published	f
22	1048585	3	3	2026-01-19 05:39:45	268435463	publication.event.unpublished	f
23	1048585	3	3	2026-01-19 05:39:47	268435458	submission.event.general.metadataUpdated	f
24	1048585	3	3	2026-01-19 05:39:49	268435462	publication.event.published	f
25	1048585	3	3	2026-01-19 05:39:52	268435458	submission.event.general.metadataUpdated	f
26	1048585	3	3	2026-01-19 05:39:52	268435464	publication.event.versionCreated	f
27	1048585	3	3	2026-01-19 05:39:54	268435458	submission.event.general.metadataUpdated	f
28	1048585	3	3	2026-01-19 05:39:56	268435462	publication.event.versionPublished	f
29	1048585	4	10	2026-01-19 05:40:01	268435458	submission.event.general.metadataUpdated	f
30	1048585	4	10	2026-01-19 05:40:01	268435458	submission.event.general.metadataUpdated	f
31	515	4	10	2026-01-19 05:40:10	1342177281	submission.event.fileUploaded	f
32	1048585	4	10	2026-01-19 05:40:10	1342177288	submission.event.fileRevised	f
33	515	4	10	2026-01-19 05:40:12	1342177296	submission.event.fileEdited	f
34	1048585	4	10	2026-01-19 05:40:13	268435457	submission.event.submissionSubmitted	f
35	1048585	4	3	2026-01-19 05:40:18	805306371	editor.submission.decision.decline.log	f
36	1048585	4	3	2026-01-19 05:40:21	805306371	editor.submission.decision.revertDecline.log	f
37	1048585	4	3	2026-01-19 05:40:24	805306371	editor.submission.decision.decline.log	f
38	1048585	5	11	2026-01-19 05:40:30	268435458	submission.event.general.metadataUpdated	f
39	1048585	5	11	2026-01-19 05:40:30	268435458	submission.event.general.metadataUpdated	f
40	515	5	11	2026-01-19 05:40:39	1342177281	submission.event.fileUploaded	f
41	1048585	5	11	2026-01-19 05:40:39	1342177288	submission.event.fileRevised	f
42	515	5	11	2026-01-19 05:40:41	1342177296	submission.event.fileEdited	f
43	1048585	5	11	2026-01-19 05:40:42	268435457	submission.event.submissionSubmitted	f
44	1048585	5	3	2026-01-19 05:40:46	268435462	publication.event.published	f
45	1048585	5	3	2026-01-19 05:40:49	268435463	publication.event.unpublished	f
46	1048585	5	3	2026-01-19 05:40:54	268435462	publication.event.published	f
47	1048585	6	12	2026-01-19 05:40:59	268435458	submission.event.general.metadataUpdated	f
48	1048585	6	12	2026-01-19 05:40:59	268435458	submission.event.general.metadataUpdated	f
49	515	6	12	2026-01-19 05:41:07	1342177281	submission.event.fileUploaded	f
50	1048585	6	12	2026-01-19 05:41:07	1342177288	submission.event.fileRevised	f
51	515	6	12	2026-01-19 05:41:10	1342177296	submission.event.fileEdited	f
52	1048585	6	12	2026-01-19 05:41:10	268435457	submission.event.submissionSubmitted	f
53	1048585	6	3	2026-01-19 05:41:15	268435462	publication.event.published	f
54	1048585	7	13	2026-01-19 05:41:20	268435458	submission.event.general.metadataUpdated	f
55	1048585	7	13	2026-01-19 05:41:20	268435458	submission.event.general.metadataUpdated	f
56	515	7	13	2026-01-19 05:41:29	1342177281	submission.event.fileUploaded	f
57	1048585	7	13	2026-01-19 05:41:29	1342177288	submission.event.fileRevised	f
58	515	7	13	2026-01-19 05:41:31	1342177296	submission.event.fileEdited	f
59	1048585	7	13	2026-01-19 05:41:32	268435457	submission.event.submissionSubmitted	f
60	1048585	7	3	2026-01-19 05:41:36	268435462	publication.event.published	f
61	1048585	8	14	2026-01-19 05:41:41	268435458	submission.event.general.metadataUpdated	f
62	1048585	8	14	2026-01-19 05:41:42	268435458	submission.event.general.metadataUpdated	f
63	515	8	14	2026-01-19 05:41:50	1342177281	submission.event.fileUploaded	f
64	1048585	8	14	2026-01-19 05:41:50	1342177288	submission.event.fileRevised	f
65	515	8	14	2026-01-19 05:41:53	1342177296	submission.event.fileEdited	f
66	1048585	8	14	2026-01-19 05:41:53	268435457	submission.event.submissionSubmitted	f
67	1048585	8	3	2026-01-19 05:41:58	268435462	publication.event.published	f
68	1048585	9	15	2026-01-19 05:42:03	268435458	submission.event.general.metadataUpdated	f
69	1048585	9	15	2026-01-19 05:42:03	268435458	submission.event.general.metadataUpdated	f
70	515	9	15	2026-01-19 05:42:12	1342177281	submission.event.fileUploaded	f
71	1048585	9	15	2026-01-19 05:42:12	1342177288	submission.event.fileRevised	f
72	515	9	15	2026-01-19 05:42:14	1342177296	submission.event.fileEdited	f
73	1048585	9	15	2026-01-19 05:42:14	268435457	submission.event.submissionSubmitted	f
74	1048585	9	3	2026-01-19 05:42:19	268435462	publication.event.published	f
75	1048585	10	16	2026-01-19 05:42:24	268435458	submission.event.general.metadataUpdated	f
76	1048585	10	16	2026-01-19 05:42:24	268435458	submission.event.general.metadataUpdated	f
77	515	10	16	2026-01-19 05:42:33	1342177281	submission.event.fileUploaded	f
78	1048585	10	16	2026-01-19 05:42:33	1342177288	submission.event.fileRevised	f
79	515	10	16	2026-01-19 05:42:35	1342177296	submission.event.fileEdited	f
80	1048585	10	16	2026-01-19 05:42:36	268435457	submission.event.submissionSubmitted	f
81	1048585	10	3	2026-01-19 05:42:40	268435462	publication.event.published	f
82	1048585	11	17	2026-01-19 05:42:46	268435458	submission.event.general.metadataUpdated	f
83	1048585	11	17	2026-01-19 05:42:46	268435458	submission.event.general.metadataUpdated	f
84	515	11	17	2026-01-19 05:42:55	1342177281	submission.event.fileUploaded	f
85	1048585	11	17	2026-01-19 05:42:55	1342177288	submission.event.fileRevised	f
86	515	11	17	2026-01-19 05:42:57	1342177296	submission.event.fileEdited	f
87	1048585	11	17	2026-01-19 05:42:58	268435457	submission.event.submissionSubmitted	f
88	1048585	11	3	2026-01-19 05:43:02	268435462	publication.event.published	f
89	1048585	12	18	2026-01-19 05:43:07	268435458	submission.event.general.metadataUpdated	f
90	1048585	12	18	2026-01-19 05:43:08	268435458	submission.event.general.metadataUpdated	f
91	515	12	18	2026-01-19 05:43:16	1342177281	submission.event.fileUploaded	f
92	1048585	12	18	2026-01-19 05:43:16	1342177288	submission.event.fileRevised	f
93	515	12	18	2026-01-19 05:43:18	1342177296	submission.event.fileEdited	f
94	1048585	12	18	2026-01-19 05:43:19	268435457	submission.event.submissionSubmitted	f
95	1048585	12	3	2026-01-19 05:43:23	268435462	publication.event.published	f
96	1048585	13	19	2026-01-19 05:43:29	268435458	submission.event.general.metadataUpdated	f
97	1048585	13	19	2026-01-19 05:43:29	268435458	submission.event.general.metadataUpdated	f
98	515	13	19	2026-01-19 05:43:37	1342177281	submission.event.fileUploaded	f
99	1048585	13	19	2026-01-19 05:43:37	1342177288	submission.event.fileRevised	f
100	515	13	19	2026-01-19 05:43:40	1342177296	submission.event.fileEdited	f
101	1048585	13	19	2026-01-19 05:43:40	268435457	submission.event.submissionSubmitted	f
102	1048585	13	3	2026-01-19 05:43:45	268435462	publication.event.published	f
103	1048585	14	20	2026-01-19 05:43:50	268435458	submission.event.general.metadataUpdated	f
104	1048585	14	20	2026-01-19 05:43:50	268435458	submission.event.general.metadataUpdated	f
105	515	14	20	2026-01-19 05:43:59	1342177281	submission.event.fileUploaded	f
106	1048585	14	20	2026-01-19 05:43:59	1342177288	submission.event.fileRevised	f
107	515	14	20	2026-01-19 05:44:01	1342177296	submission.event.fileEdited	f
108	1048585	14	20	2026-01-19 05:44:02	268435457	submission.event.submissionSubmitted	f
109	1048585	14	3	2026-01-19 05:44:06	268435462	publication.event.published	f
110	1048585	15	21	2026-01-19 05:44:12	268435458	submission.event.general.metadataUpdated	f
111	1048585	15	21	2026-01-19 05:44:12	268435458	submission.event.general.metadataUpdated	f
112	515	15	21	2026-01-19 05:44:20	1342177281	submission.event.fileUploaded	f
113	1048585	15	21	2026-01-19 05:44:20	1342177288	submission.event.fileRevised	f
114	515	15	21	2026-01-19 05:44:23	1342177296	submission.event.fileEdited	f
115	1048585	15	21	2026-01-19 05:44:23	268435457	submission.event.submissionSubmitted	f
116	1048585	15	3	2026-01-19 05:44:28	268435462	publication.event.published	f
117	1048585	16	22	2026-01-19 05:44:33	268435458	submission.event.general.metadataUpdated	f
118	1048585	16	22	2026-01-19 05:44:33	268435458	submission.event.general.metadataUpdated	f
119	515	16	22	2026-01-19 05:44:42	1342177281	submission.event.fileUploaded	f
120	1048585	16	22	2026-01-19 05:44:42	1342177288	submission.event.fileRevised	f
121	515	16	22	2026-01-19 05:44:44	1342177296	submission.event.fileEdited	f
122	1048585	16	22	2026-01-19 05:44:45	268435457	submission.event.submissionSubmitted	f
123	1048585	16	3	2026-01-19 05:44:49	268435462	publication.event.published	f
124	1048585	17	23	2026-01-19 05:44:54	268435458	submission.event.general.metadataUpdated	f
125	1048585	17	23	2026-01-19 05:44:55	268435458	submission.event.general.metadataUpdated	f
126	515	17	23	2026-01-19 05:45:03	1342177281	submission.event.fileUploaded	f
127	1048585	17	23	2026-01-19 05:45:03	1342177288	submission.event.fileRevised	f
128	515	17	23	2026-01-19 05:45:06	1342177296	submission.event.fileEdited	f
129	1048585	17	23	2026-01-19 05:45:06	268435457	submission.event.submissionSubmitted	f
130	1048585	17	3	2026-01-19 05:45:11	268435462	publication.event.published	f
131	1048585	18	24	2026-01-19 05:45:16	268435458	submission.event.general.metadataUpdated	f
132	1048585	18	24	2026-01-19 05:45:16	268435458	submission.event.general.metadataUpdated	f
133	515	18	24	2026-01-19 05:45:25	1342177281	submission.event.fileUploaded	f
134	1048585	18	24	2026-01-19 05:45:25	1342177288	submission.event.fileRevised	f
135	515	18	24	2026-01-19 05:45:27	1342177296	submission.event.fileEdited	f
136	1048585	18	24	2026-01-19 05:45:28	268435457	submission.event.submissionSubmitted	f
137	1048585	18	3	2026-01-19 05:45:32	268435462	publication.event.published	f
138	1048585	19	25	2026-01-19 05:45:38	268435458	submission.event.general.metadataUpdated	f
139	1048585	19	25	2026-01-19 05:45:38	268435458	submission.event.general.metadataUpdated	f
140	515	19	25	2026-01-19 05:45:46	1342177281	submission.event.fileUploaded	f
141	1048585	19	25	2026-01-19 05:45:46	1342177288	submission.event.fileRevised	f
142	515	19	25	2026-01-19 05:45:49	1342177296	submission.event.fileEdited	f
143	1048585	19	25	2026-01-19 05:45:49	268435457	submission.event.submissionSubmitted	f
144	1048585	19	3	2026-01-19 05:45:54	268435462	publication.event.published	f
\.


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log_settings (event_log_setting_id, log_id, locale, setting_name, setting_value) FROM stdin;
1	3		fileId	1
2	3	en	filename	The influence of lactation on the quantity and quality of cashmere production.pdf
3	3		fileStage	10
4	3		submissionFileId	1
5	3		submissionId	1
6	3		username	ccorino
7	4		fileId	1
8	4	en	filename	The influence of lactation on the quantity and quality of cashmere production.pdf
9	4		fileStage	10
10	4		submissionFileId	1
11	4		submissionId	1
12	4		username	ccorino
13	5		fileId	1
14	5	en	filename	The influence of lactation on the quantity and quality of cashmere production.pdf
15	5		fileStage	10
16	5		submissionFileId	1
17	5		submissionId	1
18	5		username	ccorino
19	10		fileId	2
20	10	en	filename	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf
21	10		fileStage	10
22	10		submissionFileId	2
23	10		submissionId	2
24	10		username	ckwantes
25	11		fileId	2
26	11	en	filename	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf
27	11		fileStage	10
28	11		submissionFileId	2
29	11		submissionId	2
30	11		username	ckwantes
31	12		fileId	2
32	12	en	filename	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf
33	12		fileStage	10
34	12		submissionFileId	2
35	12		submissionId	2
36	12		username	ckwantes
37	17		fileId	3
38	17	en	filename	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf
39	17		fileStage	10
40	17		submissionFileId	3
41	17		submissionId	3
42	17		username	cmontgomerie
43	18		fileId	3
44	18	en	filename	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf
45	18		fileStage	10
46	18		submissionFileId	3
47	18		submissionId	3
48	18		username	cmontgomerie
49	19		fileId	3
50	19	en	filename	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf
51	19		fileStage	10
52	19		submissionFileId	3
53	19		submissionId	3
54	19		username	cmontgomerie
55	31		fileId	4
56	31	en	filename	Genetic transformation of forest trees.pdf
57	31		fileStage	10
58	31		submissionFileId	4
59	31		submissionId	4
60	31		username	ddiouf
61	32		fileId	4
62	32	en	filename	Genetic transformation of forest trees.pdf
63	32		fileStage	10
64	32		submissionFileId	4
65	32		submissionId	4
66	32		username	ddiouf
67	33		fileId	4
68	33	en	filename	Genetic transformation of forest trees.pdf
69	33		fileStage	10
70	33		submissionFileId	4
71	33		submissionId	4
72	33		username	ddiouf
73	35		editorName	Daniel Barnes
74	36		editorName	Daniel Barnes
75	37		editorName	Daniel Barnes
76	40		fileId	5
77	40	en	filename	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf
78	40		fileStage	10
79	40		submissionFileId	5
80	40		submissionId	5
81	40		username	dphillips
82	41		fileId	5
83	41	en	filename	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf
84	41		fileStage	10
85	41		submissionFileId	5
86	41		submissionId	5
87	41		username	dphillips
88	42		fileId	5
89	42	en	filename	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf
90	42		fileStage	10
91	42		submissionFileId	5
92	42		submissionId	5
93	42		username	dphillips
94	49		fileId	6
95	49	en	filename	Developing efficacy beliefs in the classroom.pdf
96	49		fileStage	10
97	49		submissionFileId	6
98	49		submissionId	6
99	49		username	dsokoloff
100	50		fileId	6
101	50	en	filename	Developing efficacy beliefs in the classroom.pdf
102	50		fileStage	10
103	50		submissionFileId	6
104	50		submissionId	6
105	50		username	dsokoloff
106	51		fileId	6
107	51	en	filename	Developing efficacy beliefs in the classroom.pdf
108	51		fileStage	10
109	51		submissionFileId	6
110	51		submissionId	6
111	51		username	dsokoloff
112	56		fileId	7
113	56	en	filename	Developing efficacy beliefs in the classroom.pdf
114	56		fileStage	10
115	56		submissionFileId	7
116	56		submissionId	7
117	56		username	eostrom
118	57		fileId	7
119	57	en	filename	Developing efficacy beliefs in the classroom.pdf
120	57		fileStage	10
121	57		submissionFileId	7
122	57		submissionId	7
123	57		username	eostrom
124	58		fileId	7
125	58	en	filename	Developing efficacy beliefs in the classroom.pdf
126	58		fileStage	10
127	58		submissionFileId	7
128	58		submissionId	7
129	58		username	eostrom
130	63		fileId	8
131	63	en	filename	Hansen & Pinto: Reason Reclaimed.pdf
132	63		fileStage	10
133	63		submissionFileId	8
134	63		submissionId	8
135	63		username	fpaglieri
136	64		fileId	8
137	64	en	filename	Hansen & Pinto: Reason Reclaimed.pdf
138	64		fileStage	10
139	64		submissionFileId	8
140	64		submissionId	8
141	64		username	fpaglieri
142	65		fileId	8
143	65	en	filename	Hansen & Pinto: Reason Reclaimed.pdf
144	65		fileStage	10
145	65		submissionFileId	8
146	65		submissionId	8
147	65		username	fpaglieri
148	70		fileId	9
149	70	en	filename	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf
150	70		fileStage	10
151	70		submissionFileId	9
152	70		submissionId	9
153	70		username	jmwandenga
154	71		fileId	9
155	71	en	filename	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf
156	71		fileStage	10
157	71		submissionFileId	9
158	71		submissionId	9
159	71		username	jmwandenga
160	72		fileId	9
161	72	en	filename	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf
162	72		fileStage	10
163	72		submissionFileId	9
164	72		submissionId	9
165	72		username	jmwandenga
166	77		fileId	10
167	77	en	filename	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf
168	77		fileStage	10
169	77		submissionFileId	10
170	77		submissionId	10
171	77		username	jnovak
172	78		fileId	10
173	78	en	filename	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf
174	78		fileStage	10
175	78		submissionFileId	10
176	78		submissionId	10
177	78		username	jnovak
178	79		fileId	10
179	79	en	filename	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf
180	79		fileStage	10
181	79		submissionFileId	10
182	79		submissionId	10
183	79		username	jnovak
184	84		fileId	11
185	84	en	filename	Learning Sustainable Design through Service.pdf
186	84		fileStage	10
187	84		submissionFileId	11
188	84		submissionId	11
189	84		username	kalkhafaji
190	85		fileId	11
191	85	en	filename	Learning Sustainable Design through Service.pdf
192	85		fileStage	10
193	85		submissionFileId	11
194	85		submissionId	11
195	85		username	kalkhafaji
196	86		fileId	11
197	86	en	filename	Learning Sustainable Design through Service.pdf
198	86		fileStage	10
199	86		submissionFileId	11
200	86		submissionId	11
201	86		username	kalkhafaji
202	91		fileId	12
203	91	en	filename	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf
204	91		fileStage	10
205	91		submissionFileId	12
206	91		submissionId	12
207	91		username	lchristopher
208	92		fileId	12
209	92	en	filename	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf
210	92		fileStage	10
211	92		submissionFileId	12
212	92		submissionId	12
213	92		username	lchristopher
214	93		fileId	12
215	93	en	filename	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf
216	93		fileStage	10
217	93		submissionFileId	12
218	93		submissionId	12
219	93		username	lchristopher
220	98		fileId	13
221	98	en	filename	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf
222	98		fileStage	10
223	98		submissionFileId	13
224	98		submissionId	13
225	98		username	lkumiega
226	99		fileId	13
227	99	en	filename	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf
228	99		fileStage	10
229	99		submissionFileId	13
230	99		submissionId	13
231	99		username	lkumiega
232	100		fileId	13
233	100	en	filename	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf
234	100		fileStage	10
235	100		submissionFileId	13
236	100		submissionId	13
237	100		username	lkumiega
238	105		fileId	14
239	105	en	filename	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf
240	105		fileStage	10
241	105		submissionFileId	14
242	105		submissionId	14
243	105		username	pdaniel
244	106		fileId	14
245	106	en	filename	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf
246	106		fileStage	10
247	106		submissionFileId	14
248	106		submissionId	14
249	106		username	pdaniel
250	107		fileId	14
251	107	en	filename	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf
252	107		fileStage	10
253	107		submissionFileId	14
254	107		submissionId	14
255	107		username	pdaniel
256	112		fileId	15
257	112	en	filename	Yam diseases and its management in Nigeria.pdf
258	112		fileStage	10
259	112		submissionFileId	15
260	112		submissionId	15
261	112		username	rbaiyewu
262	113		fileId	15
263	113	en	filename	Yam diseases and its management in Nigeria.pdf
264	113		fileStage	10
265	113		submissionFileId	15
266	113		submissionId	15
267	113		username	rbaiyewu
268	114		fileId	15
269	114	en	filename	Yam diseases and its management in Nigeria.pdf
270	114		fileStage	10
271	114		submissionFileId	15
272	114		submissionId	15
273	114		username	rbaiyewu
274	119		fileId	16
275	119	en	filename	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf
276	119		fileStage	10
277	119		submissionFileId	16
278	119		submissionId	16
279	119		username	rrossi
280	120		fileId	16
281	120	en	filename	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf
282	120		fileStage	10
283	120		submissionFileId	16
284	120		submissionId	16
285	120		username	rrossi
286	121		fileId	16
287	121	en	filename	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf
288	121		fileStage	10
289	121		submissionFileId	16
290	121		submissionId	16
291	121		username	rrossi
292	126		fileId	17
293	126	en	filename	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf
294	126		fileStage	10
295	126		submissionFileId	17
296	126		submissionId	17
297	126		username	vkarbasizaed
298	127		fileId	17
299	127	en	filename	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf
300	127		fileStage	10
301	127		submissionFileId	17
302	127		submissionId	17
303	127		username	vkarbasizaed
304	128		fileId	17
305	128	en	filename	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf
306	128		fileStage	10
307	128		submissionFileId	17
308	128		submissionId	17
309	128		username	vkarbasizaed
310	133		fileId	18
311	133	en	filename	Self-Organization in Multi-Level Institutions in Networked Environments.pdf
312	133		fileStage	10
313	133		submissionFileId	18
314	133		submissionId	18
315	133		username	vwilliamson
316	134		fileId	18
317	134	en	filename	Self-Organization in Multi-Level Institutions in Networked Environments.pdf
318	134		fileStage	10
319	134		submissionFileId	18
320	134		submissionId	18
321	134		username	vwilliamson
322	135		fileId	18
323	135	en	filename	Self-Organization in Multi-Level Institutions in Networked Environments.pdf
324	135		fileStage	10
325	135		submissionFileId	18
326	135		submissionId	18
327	135		username	vwilliamson
328	140		fileId	19
329	140	en	filename	Finocchiaro: Arguments About Arguments.pdf
330	140		fileStage	10
331	140		submissionFileId	19
332	140		submissionId	19
333	140		username	zwoods
334	141		fileId	19
335	141	en	filename	Finocchiaro: Arguments About Arguments.pdf
336	141		fileStage	10
337	141		submissionFileId	19
338	141		submissionId	19
339	141		username	zwoods
340	142		fileId	19
341	142	en	filename	Finocchiaro: Arguments About Arguments.pdf
342	142		fileStage	10
343	142		submissionFileId	19
344	142		submissionId	19
345	142		username	zwoods
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	contexts/1/submissions/1/696dc34d2853c.pdf	application/pdf
2	contexts/1/submissions/2/696dc37006ceb.pdf	application/pdf
3	contexts/1/submissions/3/696dc394babb5.pdf	application/pdf
4	contexts/1/submissions/4/696dc3ba55a58.pdf	application/pdf
5	contexts/1/submissions/5/696dc3d78b70f.pdf	application/pdf
6	contexts/1/submissions/6/696dc3f3e1612.pdf	application/pdf
7	contexts/1/submissions/7/696dc40952a7b.pdf	application/pdf
8	contexts/1/submissions/8/696dc41ecbaf7.pdf	application/pdf
9	contexts/1/submissions/9/696dc4341e08f.pdf	application/pdf
10	contexts/1/submissions/10/696dc4497c411.pdf	application/pdf
11	contexts/1/submissions/11/696dc45f1cb19.pdf	application/pdf
12	contexts/1/submissions/12/696dc474ae099.pdf	application/pdf
13	contexts/1/submissions/13/696dc489dd478.pdf	application/pdf
14	contexts/1/submissions/14/696dc49f81901.pdf	application/pdf
15	contexts/1/submissions/15/696dc4b4e7349.pdf	application/pdf
16	contexts/1/submissions/16/696dc4ca5f7fa.pdf	application/pdf
17	contexts/1/submissions/17/696dc4dfbef8c.pdf	application/pdf
18	contexts/1/submissions/18/696dc4f546755.pdf	application/pdf
19	contexts/1/submissions/19/696dc50ae66ee.pdf	application/pdf
\.


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	preprint=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.submission.Submission[]	xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)
2	preprint=>dc11	plugins.metadata.dc11.preprintAdapter.displayName	plugins.metadata.dc11.preprintAdapter.description	class::classes.submission.Submission	metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PREPRINT)
3	preprint=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.submission.Submission[]	xml::schema(plugins/importexport/native/native.xsd)
4	native-xml=>preprint	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.submission.Submission[]
5	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.author.Author[]	xml::schema(plugins/importexport/native/native.xsd)
6	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.author.Author[]
7	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submissionFile.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
8	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submissionFile.SubmissionFile[]
9	preprint-galley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.galley.Galley	xml::schema(plugins/importexport/native/native.xsd)
10	native-xml=>PreprintGalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.galley.Galley[]
11	publication=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.publication.Publication	xml::schema(plugins/importexport/native/native.xsd)
12	native-xml=>Publication	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.publication.Publication[]
\.


--
-- Data for Name: filter_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filter_settings (filter_setting_id, filter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.filters (filter_id, filter_group_id, context_id, display_name, class_name, is_template, parent_filter_id, seq) FROM stdin;
1	1	0	Crossref XML preprint export	APP\\plugins\\generic\\crossref\\filter\\PreprintCrossrefXmlFilter	0	0	0
2	2	0	Extract metadata from a(n) Submission	APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPreprintAdapter	0	0	0
3	3	0	Native XML submission export	APP\\plugins\\importexport\\native\\filter\\PreprintNativeXmlFilter	0	0	0
4	4	0	Native XML submission import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFilter	0	0	0
5	5	0	Native XML author export	APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter	0	0	0
6	6	0	Native XML author import	APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter	0	0	0
7	8	0	Native XML submission file import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFileFilter	0	0	0
8	7	0	Native XML submission file export	PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter	0	0	0
9	9	0	Native XML representation export	APP\\plugins\\importexport\\native\\filter\\PreprintGalleyNativeXmlFilter	0	0	0
10	10	0	Native XML representation import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintGalleyFilter	0	0	0
11	11	0	Native XML Publication export	APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter	0	0	0
12	12	0	Native XML publication import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter	0	0	0
\.


--
-- Data for Name: genre_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.genre_settings (genre_setting_id, genre_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	1	en	name	Preprint Text	string
2	1	fr_CA	name	Texte de la prépublication	string
3	2	en	name	Research Instrument	string
4	2	fr_CA	name	##default.genres.researchInstrument##	string
5	3	en	name	Research Materials	string
6	3	fr_CA	name	##default.genres.researchMaterials##	string
7	4	en	name	Research Results	string
8	4	fr_CA	name	##default.genres.researchResults##	string
9	5	en	name	Transcripts	string
10	5	fr_CA	name	##default.genres.transcripts##	string
11	6	en	name	Data Analysis	string
12	6	fr_CA	name	##default.genres.dataAnalysis##	string
13	7	en	name	Data Set	string
14	7	fr_CA	name	##default.genres.dataSet##	string
15	8	en	name	Source Texts	string
16	8	fr_CA	name	##default.genres.sourceTexts##	string
17	9	en	name	Multimedia	string
18	9	fr_CA	name	Multimédias	string
19	10	en	name	Image	string
20	10	fr_CA	name	Image	string
21	11	en	name	HTML Stylesheet	string
22	11	fr_CA	name	Feuille de style HTML	string
23	12	en	name	Other	string
24	12	fr_CA	name	Autre	string
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.genres (genre_id, context_id, seq, enabled, category, dependent, supplementary, required, entry_key) FROM stdin;
1	1	0	1	1	0	0	1	SUBMISSION
2	1	1	1	3	0	1	0	RESEARCHINSTRUMENT
3	1	2	1	3	0	1	0	RESEARCHMATERIALS
4	1	3	1	3	0	1	0	RESEARCHRESULTS
5	1	4	1	3	0	1	0	TRANSCRIPTS
6	1	5	1	3	0	1	0	DATAANALYSIS
7	1	6	1	3	0	1	0	DATASET
8	1	7	1	3	0	1	0	SOURCETEXTS
9	1	8	1	1	1	1	0	MULTIMEDIA
10	1	9	1	2	1	0	0	IMAGE
11	1	10	1	1	1	0	0	STYLE
12	1	11	1	3	0	1	0	OTHER
\.


--
-- Data for Name: institution_ip; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.institution_ip (institution_ip_id, institution_id, ip_string, ip_start, ip_end) FROM stdin;
\.


--
-- Data for Name: institution_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.institution_settings (institution_setting_id, institution_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.institutions (institution_id, context_id, ror, deleted_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
a0df1b71-2074-49d1-8a76-72721ff92160		0	0	0	[]	YTowOnt9	\N	1768800985	\N
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: library_file_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.library_file_settings (library_file_setting_id, file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: library_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.library_files (file_id, context_id, file_name, original_file_name, file_type, file_size, type, date_uploaded, date_modified, submission_id, public_access) FROM stdin;
\.


--
-- Data for Name: metrics_context; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_context (metrics_context_id, load_id, context_id, date, metric) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_daily; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_counter_submission_daily (metrics_counter_submission_daily_id, load_id, context_id, submission_id, date, metric_investigations, metric_investigations_unique, metric_requests, metric_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_institution_daily; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_counter_submission_institution_daily (metrics_counter_submission_institution_daily_id, load_id, context_id, submission_id, institution_id, date, metric_investigations, metric_investigations_unique, metric_requests, metric_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_institution_monthly; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_counter_submission_institution_monthly (metrics_counter_submission_institution_monthly_id, context_id, submission_id, institution_id, month, metric_investigations, metric_investigations_unique, metric_requests, metric_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_counter_submission_monthly; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_counter_submission_monthly (metrics_counter_submission_monthly_id, context_id, submission_id, month, metric_investigations, metric_investigations_unique, metric_requests, metric_requests_unique) FROM stdin;
\.


--
-- Data for Name: metrics_submission; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_submission (metrics_submission_id, load_id, context_id, submission_id, representation_id, submission_file_id, file_type, assoc_type, date, metric) FROM stdin;
\.


--
-- Data for Name: metrics_submission_geo_daily; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_submission_geo_daily (metrics_submission_geo_daily_id, load_id, context_id, submission_id, country, region, city, date, metric, metric_unique) FROM stdin;
\.


--
-- Data for Name: metrics_submission_geo_monthly; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.metrics_submission_geo_monthly (metrics_submission_geo_monthly_id, context_id, submission_id, country, region, city, month, metric, metric_unique) FROM stdin;
\.


--
-- Data for Name: navigation_menu_item_assignment_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menu_item_assignment_settings (navigation_menu_item_assignment_setting_id, navigation_menu_item_assignment_id, locale, setting_name, setting_value, setting_type) FROM stdin;
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

COPY public.navigation_menu_item_settings (navigation_menu_item_setting_id, navigation_menu_item_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	1		titleLocaleKey	navigation.register	string
2	2		titleLocaleKey	navigation.login	string
3	3		titleLocaleKey	{$loggedInUsername}	string
4	4		titleLocaleKey	navigation.dashboard	string
5	5		titleLocaleKey	common.viewProfile	string
6	6		titleLocaleKey	navigation.admin	string
7	7		titleLocaleKey	user.logOut	string
8	8		titleLocaleKey	navigation.register	string
9	9		titleLocaleKey	navigation.login	string
10	10		titleLocaleKey	{$loggedInUsername}	string
11	11		titleLocaleKey	navigation.dashboard	string
12	12		titleLocaleKey	common.viewProfile	string
13	13		titleLocaleKey	navigation.admin	string
14	14		titleLocaleKey	user.logOut	string
15	15		titleLocaleKey	manager.announcements	string
16	16		titleLocaleKey	navigation.archives	string
17	17		titleLocaleKey	navigation.about	string
18	18		titleLocaleKey	about.aboutContext	string
19	19		titleLocaleKey	about.submissions	string
20	20		titleLocaleKey	about.editorialTeam	string
21	21		titleLocaleKey	manager.setup.privacyStatement	string
22	22		titleLocaleKey	about.contact	string
23	23		titleLocaleKey	common.search	string
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
-- Data for Name: notification_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.notification_settings (notification_setting_id, notification_id, locale, setting_name, setting_value, setting_type) FROM stdin;
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
78	1	\N	2	16777243	2026-01-19 05:43:19	\N	1048585	12
79	1	\N	2	16777245	2026-01-19 05:43:19	\N	1048585	12
3	1	\N	3	16777222	2026-01-19 05:38:24	\N	1048585	1
4	1	\N	3	16777223	2026-01-19 05:38:24	\N	1048585	1
5	1	4	2	16777217	2026-01-19 05:38:24	\N	1048585	1
6	1	5	2	16777217	2026-01-19 05:38:24	\N	1048585	1
7	1	\N	2	16777243	2026-01-19 05:38:24	\N	1048585	1
8	1	\N	2	16777245	2026-01-19 05:38:24	\N	1048585	1
9	1	\N	3	16777222	2026-01-19 05:39:12	\N	1048585	2
10	1	\N	3	16777223	2026-01-19 05:39:12	\N	1048585	2
11	1	4	2	16777217	2026-01-19 05:39:12	\N	1048585	2
12	1	5	2	16777217	2026-01-19 05:39:12	\N	1048585	2
13	1	\N	2	16777243	2026-01-19 05:39:12	\N	1048585	2
14	1	\N	2	16777245	2026-01-19 05:39:12	\N	1048585	2
15	1	\N	3	16777222	2026-01-19 05:39:35	\N	1048585	3
16	1	\N	3	16777223	2026-01-19 05:39:35	\N	1048585	3
17	1	4	2	16777217	2026-01-19 05:39:35	\N	1048585	3
18	1	5	2	16777217	2026-01-19 05:39:35	\N	1048585	3
19	1	\N	2	16777243	2026-01-19 05:39:36	\N	1048585	3
20	1	\N	2	16777245	2026-01-19 05:39:36	\N	1048585	3
21	1	4	3	16777259	2026-01-19 05:39:52	\N	1048585	3
22	1	5	3	16777259	2026-01-19 05:39:52	\N	1048585	3
23	1	9	3	16777259	2026-01-19 05:39:52	\N	1048585	3
24	1	\N	3	16777222	2026-01-19 05:40:13	\N	1048585	4
25	1	\N	3	16777223	2026-01-19 05:40:13	\N	1048585	4
26	1	4	2	16777217	2026-01-19 05:40:13	\N	1048585	4
27	1	5	2	16777217	2026-01-19 05:40:13	\N	1048585	4
28	1	\N	2	16777243	2026-01-19 05:40:13	\N	1048585	4
29	1	\N	2	16777245	2026-01-19 05:40:13	\N	1048585	4
31	1	10	2	16777234	2026-01-19 05:40:24	\N	1048585	4
32	1	\N	3	16777222	2026-01-19 05:40:42	\N	1048585	5
33	1	\N	3	16777223	2026-01-19 05:40:42	\N	1048585	5
34	1	4	2	16777217	2026-01-19 05:40:42	\N	1048585	5
35	1	5	2	16777217	2026-01-19 05:40:42	\N	1048585	5
36	1	\N	2	16777243	2026-01-19 05:40:42	\N	1048585	5
37	1	\N	2	16777245	2026-01-19 05:40:42	\N	1048585	5
38	1	\N	3	16777222	2026-01-19 05:41:10	\N	1048585	6
39	1	\N	3	16777223	2026-01-19 05:41:10	\N	1048585	6
40	1	4	2	16777217	2026-01-19 05:41:10	\N	1048585	6
41	1	5	2	16777217	2026-01-19 05:41:10	\N	1048585	6
42	1	\N	2	16777243	2026-01-19 05:41:11	\N	1048585	6
43	1	\N	2	16777245	2026-01-19 05:41:11	\N	1048585	6
44	1	\N	3	16777222	2026-01-19 05:41:32	\N	1048585	7
45	1	\N	3	16777223	2026-01-19 05:41:32	\N	1048585	7
46	1	4	2	16777217	2026-01-19 05:41:32	\N	1048585	7
47	1	5	2	16777217	2026-01-19 05:41:32	\N	1048585	7
48	1	\N	2	16777243	2026-01-19 05:41:32	\N	1048585	7
49	1	\N	2	16777245	2026-01-19 05:41:32	\N	1048585	7
50	1	\N	3	16777222	2026-01-19 05:41:53	\N	1048585	8
51	1	\N	3	16777223	2026-01-19 05:41:53	\N	1048585	8
52	1	4	2	16777217	2026-01-19 05:41:53	\N	1048585	8
53	1	5	2	16777217	2026-01-19 05:41:53	\N	1048585	8
54	1	\N	2	16777243	2026-01-19 05:41:53	\N	1048585	8
55	1	\N	2	16777245	2026-01-19 05:41:53	\N	1048585	8
56	1	\N	3	16777222	2026-01-19 05:42:14	\N	1048585	9
57	1	\N	3	16777223	2026-01-19 05:42:14	\N	1048585	9
58	1	4	2	16777217	2026-01-19 05:42:14	\N	1048585	9
59	1	5	2	16777217	2026-01-19 05:42:14	\N	1048585	9
60	1	\N	2	16777243	2026-01-19 05:42:15	\N	1048585	9
61	1	\N	2	16777245	2026-01-19 05:42:15	\N	1048585	9
62	1	\N	3	16777222	2026-01-19 05:42:36	\N	1048585	10
63	1	\N	3	16777223	2026-01-19 05:42:36	\N	1048585	10
64	1	4	2	16777217	2026-01-19 05:42:36	\N	1048585	10
65	1	5	2	16777217	2026-01-19 05:42:36	\N	1048585	10
66	1	\N	2	16777243	2026-01-19 05:42:36	\N	1048585	10
67	1	\N	2	16777245	2026-01-19 05:42:36	\N	1048585	10
68	1	\N	3	16777222	2026-01-19 05:42:58	\N	1048585	11
69	1	\N	3	16777223	2026-01-19 05:42:58	\N	1048585	11
70	1	4	2	16777217	2026-01-19 05:42:58	\N	1048585	11
71	1	5	2	16777217	2026-01-19 05:42:58	\N	1048585	11
72	1	\N	2	16777243	2026-01-19 05:42:58	\N	1048585	11
73	1	\N	2	16777245	2026-01-19 05:42:58	\N	1048585	11
74	1	\N	3	16777222	2026-01-19 05:43:19	\N	1048585	12
75	1	\N	3	16777223	2026-01-19 05:43:19	\N	1048585	12
76	1	4	2	16777217	2026-01-19 05:43:19	\N	1048585	12
77	1	5	2	16777217	2026-01-19 05:43:19	\N	1048585	12
80	1	\N	3	16777222	2026-01-19 05:43:40	\N	1048585	13
81	1	\N	3	16777223	2026-01-19 05:43:40	\N	1048585	13
82	1	4	2	16777217	2026-01-19 05:43:40	\N	1048585	13
83	1	5	2	16777217	2026-01-19 05:43:40	\N	1048585	13
84	1	\N	2	16777243	2026-01-19 05:43:41	\N	1048585	13
85	1	\N	2	16777245	2026-01-19 05:43:41	\N	1048585	13
86	1	\N	3	16777222	2026-01-19 05:44:02	\N	1048585	14
87	1	\N	3	16777223	2026-01-19 05:44:02	\N	1048585	14
88	1	4	2	16777217	2026-01-19 05:44:02	\N	1048585	14
89	1	5	2	16777217	2026-01-19 05:44:02	\N	1048585	14
90	1	\N	2	16777243	2026-01-19 05:44:02	\N	1048585	14
91	1	\N	2	16777245	2026-01-19 05:44:02	\N	1048585	14
92	1	\N	3	16777222	2026-01-19 05:44:23	\N	1048585	15
93	1	\N	3	16777223	2026-01-19 05:44:23	\N	1048585	15
94	1	4	2	16777217	2026-01-19 05:44:23	\N	1048585	15
95	1	5	2	16777217	2026-01-19 05:44:23	\N	1048585	15
96	1	\N	2	16777243	2026-01-19 05:44:24	\N	1048585	15
97	1	\N	2	16777245	2026-01-19 05:44:24	\N	1048585	15
98	1	\N	3	16777222	2026-01-19 05:44:45	\N	1048585	16
99	1	\N	3	16777223	2026-01-19 05:44:45	\N	1048585	16
100	1	4	2	16777217	2026-01-19 05:44:45	\N	1048585	16
101	1	5	2	16777217	2026-01-19 05:44:45	\N	1048585	16
102	1	\N	2	16777243	2026-01-19 05:44:45	\N	1048585	16
103	1	\N	2	16777245	2026-01-19 05:44:45	\N	1048585	16
104	1	\N	3	16777222	2026-01-19 05:45:06	\N	1048585	17
105	1	\N	3	16777223	2026-01-19 05:45:06	\N	1048585	17
106	1	4	2	16777217	2026-01-19 05:45:06	\N	1048585	17
107	1	5	2	16777217	2026-01-19 05:45:06	\N	1048585	17
108	1	\N	2	16777243	2026-01-19 05:45:06	\N	1048585	17
109	1	\N	2	16777245	2026-01-19 05:45:06	\N	1048585	17
110	1	\N	3	16777222	2026-01-19 05:45:28	\N	1048585	18
111	1	\N	3	16777223	2026-01-19 05:45:28	\N	1048585	18
112	1	4	2	16777217	2026-01-19 05:45:28	\N	1048585	18
113	1	5	2	16777217	2026-01-19 05:45:28	\N	1048585	18
114	1	\N	2	16777243	2026-01-19 05:45:28	\N	1048585	18
115	1	\N	2	16777245	2026-01-19 05:45:28	\N	1048585	18
116	1	\N	3	16777222	2026-01-19 05:45:49	\N	1048585	19
117	1	\N	3	16777223	2026-01-19 05:45:49	\N	1048585	19
118	1	4	2	16777217	2026-01-19 05:45:49	\N	1048585	19
119	1	5	2	16777217	2026-01-19 05:45:49	\N	1048585	19
120	1	\N	2	16777243	2026-01-19 05:45:49	\N	1048585	19
121	1	\N	2	16777245	2026-01-19 05:45:49	\N	1048585	19
\.


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.oai_resumption_tokens (oai_resumption_token_id, token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.plugin_settings (plugin_setting_id, plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
1	defaultthemeplugin	0	enabled	1	bool
2	acronplugin	0	enabled	1	bool
3	acronplugin	0	crontab	[{"className":"PKP\\\\task\\\\StatisticsReport","frequency":{"day":"1"},"args":[]},{"className":"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers","frequency":{"day":"1"},"args":[]},{"className":"PKP\\\\task\\\\UpdateIPGeoDB","frequency":{"day":"10"},"args":[]},{"className":"APP\\\\tasks\\\\UsageStatsLoader","frequency":{"hour":24},"args":[]},{"className":"PKP\\\\task\\\\ProcessQueueJobs","frequency":{"hour":24},"args":[]},{"className":"PKP\\\\task\\\\RemoveFailedJobs","frequency":{"day":"1"},"args":[]}]	object
4	tinymceplugin	0	enabled	1	bool
5	usageeventplugin	0	enabled	1	bool
6	developedbyblockplugin	0	enabled	0	bool
7	developedbyblockplugin	0	seq	0	int
8	languagetoggleblockplugin	0	enabled	1	bool
9	languagetoggleblockplugin	0	seq	4	int
10	tinymceplugin	1	enabled	1	bool
11	defaultthemeplugin	1	enabled	1	bool
12	developedbyblockplugin	1	enabled	0	bool
13	developedbyblockplugin	1	seq	0	int
14	languagetoggleblockplugin	1	enabled	1	bool
15	languagetoggleblockplugin	1	seq	4	int
16	pdfjsviewerplugin	1	enabled	1	bool
17	webfeedplugin	1	enabled	1	bool
18	webfeedplugin	1	displayPage	homepage	string
19	webfeedplugin	1	displayItems	1	bool
20	webfeedplugin	1	recentItems	30	int
21	webfeedplugin	1	includeIdentifiers	0	bool
22	googlescholarplugin	1	enabled	1	bool
23	defaultthemeplugin	1	typography	notoSans	string
24	defaultthemeplugin	1	baseColour	#1E6292	string
25	defaultthemeplugin	1	showDescriptionInServerIndex	false	string
26	defaultthemeplugin	1	useHomepageImageAsHeader	false	string
27	defaultthemeplugin	1	displayStats	none	string
\.


--
-- Data for Name: publication_categories; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_categories (publication_category_id, publication_id, category_id) FROM stdin;
\.


--
-- Data for Name: publication_galley_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_galley_settings (publication_galley_setting_id, galley_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: publication_galleys; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_galleys (galley_id, locale, publication_id, label, submission_file_id, seq, remote_url, is_approved, url_path, doi_id) FROM stdin;
1	en	1	PDF	1	0	\N	0	\N	\N
2	en	2	PDF	2	0	\N	0	\N	\N
3	en	3	PDF	3	0	\N	0	\N	\N
4	en	4	PDF	3	0	\N	0	\N	\N
5	en	5	PDF	4	0	\N	0	\N	\N
6	en	6	PDF	5	0	\N	0	\N	\N
7	en	7	PDF	6	0	\N	0	\N	\N
8	en	8	PDF	7	0	\N	0	\N	\N
9	en	9	PDF	8	0	\N	0	\N	\N
10	en	10	PDF	9	0	\N	0	\N	\N
11	en	11	PDF	10	0	\N	0	\N	\N
12	en	12	PDF	11	0	\N	0	\N	\N
13	en	13	PDF	12	0	\N	0	\N	\N
14	en	14	PDF	13	0	\N	0	\N	\N
15	en	15	PDF	14	0	\N	0	\N	\N
16	en	16	PDF	15	0	\N	0	\N	\N
17	en	17	PDF	16	0	\N	0	\N	\N
18	en	18	PDF	17	0	\N	0	\N	\N
19	en	19	PDF	18	0	\N	0	\N	\N
20	en	20	PDF	19	0	\N	0	\N	\N
\.


--
-- Data for Name: publication_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publication_settings (publication_setting_id, publication_id, locale, setting_name, setting_value) FROM stdin;
1	1	en	abstract	The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.
2	1		categoryIds	[]
3	1	en	title	The influence of lactation on the quantity and quality of cashmere production
6	2	en	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
4	2		categoryIds	[]
7	2	en	copyrightHolder	Public Knowledge Preprint Server
8	2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
9	2		copyrightYear	2026
5	2	en	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
10	3	en	abstract	The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.
11	3		categoryIds	[]
13	3	en	copyrightHolder	Public Knowledge Preprint Server
14	3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
15	3		copyrightYear	2026
12	3	en	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
31	7	en	abstract	A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.
32	7		categoryIds	[]
34	7	en	copyrightHolder	Public Knowledge Preprint Server
35	7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16	4	en	abstract	The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.
17	4		categoryIds	[]
18	4	en	copyrightHolder	Craig Montgomerie
19	4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
20	4		copyrightYear	2026
21	4	en	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
22	5	en	abstract	In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.
23	5		categoryIds	[]
24	5	en	title	Genetic transformation of forest trees
36	7		copyrightYear	2026
33	7	en	title	Developing efficacy beliefs in the classroom
25	6	en	abstract	Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.
26	6		categoryIds	[]
28	6	en	copyrightHolder	Public Knowledge Preprint Server
29	6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
30	6		copyrightYear	2026
27	6	en	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
37	8	en	abstract	The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.
38	8		categoryIds	[]
40	8	en	copyrightHolder	Public Knowledge Preprint Server
41	8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
42	8		copyrightYear	2026
39	8	en	title	Developing efficacy beliefs in the classroom
43	9	en	abstract	None.
44	9		categoryIds	[]
46	9	en	copyrightHolder	Public Knowledge Preprint Server
47	9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
48	9		copyrightYear	2026
45	9	en	title	Hansen & Pinto: Reason Reclaimed
49	10	en	abstract	The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.
50	10		categoryIds	[]
52	10	en	copyrightHolder	Public Knowledge Preprint Server
53	10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
54	10		copyrightYear	2026
51	10	en	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
55	11	en	abstract	The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.
56	11		categoryIds	[]
58	11	en	copyrightHolder	Public Knowledge Preprint Server
59	11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
60	11		copyrightYear	2026
57	11	en	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
61	12	en	abstract	Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.
62	12		categoryIds	[]
64	12	en	copyrightHolder	Public Knowledge Preprint Server
65	12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
66	12		copyrightYear	2026
63	12	en	title	Learning Sustainable Design through Service
67	13	en	abstract	The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.
68	13		categoryIds	[]
70	13	en	copyrightHolder	Public Knowledge Preprint Server
71	13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
72	13		copyrightYear	2026
69	13	en	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
74	14		categoryIds	[]
75	14	en	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
73	14	en	abstract	The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.
76	14	en	copyrightHolder	Public Knowledge Preprint Server
77	14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
78	14		copyrightYear	2026
79	15	en	abstract	One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.
80	15		categoryIds	[]
82	15	en	copyrightHolder	Public Knowledge Preprint Server
83	15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
84	15		copyrightYear	2026
81	15	en	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
85	16	en	abstract	This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.
86	16		categoryIds	[]
88	16	en	copyrightHolder	Public Knowledge Preprint Server
89	16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
90	16		copyrightYear	2026
87	16	en	title	Yam diseases and its management in Nigeria
92	17		categoryIds	[]
93	17	en	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
91	17	en	abstract	Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.
94	17	en	copyrightHolder	Public Knowledge Preprint Server
95	17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
96	17		copyrightYear	2026
97	18	en	abstract	The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.
98	18		categoryIds	[]
100	18	en	copyrightHolder	Public Knowledge Preprint Server
101	18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
102	18		copyrightYear	2026
99	18	en	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
103	19	en	abstract	We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.
104	19		categoryIds	[]
106	19	en	copyrightHolder	Public Knowledge Preprint Server
107	19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
108	19		copyrightYear	2026
105	19	en	title	Self-Organization in Multi-Level Institutions in Networked Environments
109	20	en	abstract	None.
110	20		categoryIds	[]
112	20	en	copyrightHolder	Public Knowledge Preprint Server
113	20	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
114	20		copyrightYear	2026
111	20	en	title	Finocchiaro: Arguments About Arguments
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, primary_contact_id, section_id, submission_id, status, url_path, version, doi_id) FROM stdin;
1	0	\N	2026-01-19 05:38:12	1	1	1	1	\N	1	\N
18	0	2026-01-19	2026-01-19 05:45:11	24	1	17	3	\N	1	\N
2	0	2026-01-19	2026-01-19 05:39:18	2	1	2	3	\N	1	\N
19	0	2026-01-19	2026-01-19 05:45:32	25	1	18	3	\N	1	\N
3	0	2026-01-19	2026-01-19 05:39:49	5	1	3	3	\N	1	\N
4	0	2026-01-19	2026-01-19 05:39:56	7	1	3	3	\N	2	\N
5	0	\N	2026-01-19 05:40:01	9	1	4	1	\N	1	\N
20	0	2026-01-19	2026-01-19 05:45:54	26	1	19	3	\N	1	\N
6	0	2026-01-19	2026-01-19 05:40:54	10	1	5	3	\N	1	\N
7	0	2026-01-19	2026-01-19 05:41:15	11	1	6	3	\N	1	\N
8	0	2026-01-19	2026-01-19 05:41:36	12	1	7	3	\N	1	\N
9	0	2026-01-19	2026-01-19 05:41:57	14	1	8	3	\N	1	\N
10	0	2026-01-19	2026-01-19 05:42:19	15	1	9	3	\N	1	\N
11	0	2026-01-19	2026-01-19 05:42:40	16	1	10	3	\N	1	\N
12	0	2026-01-19	2026-01-19 05:43:02	17	1	11	3	\N	1	\N
13	0	2026-01-19	2026-01-19 05:43:23	19	1	12	3	\N	1	\N
14	0	2026-01-19	2026-01-19 05:43:45	20	1	13	3	\N	1	\N
15	0	2026-01-19	2026-01-19 05:44:06	21	1	14	3	\N	1	\N
16	0	2026-01-19	2026-01-19 05:44:28	22	1	15	3	\N	1	\N
17	0	2026-01-19	2026-01-19 05:44:49	23	1	16	3	\N	1	\N
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
\.


--
-- Data for Name: query_participants; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.query_participants (query_participant_id, query_id, user_id) FROM stdin;
\.


--
-- Data for Name: review_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, considered, request_resent) FROM stdin;
\.


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_files (review_file_id, review_id, submission_file_id) FROM stdin;
\.


--
-- Data for Name: review_form_element_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_element_settings (review_form_element_setting_id, review_form_element_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_form_elements; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_elements (review_form_element_id, review_form_id, seq, element_type, required, included) FROM stdin;
\.


--
-- Data for Name: review_form_responses; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_responses (review_form_response_id, review_form_element_id, review_id, response_type, response_value) FROM stdin;
\.


--
-- Data for Name: review_form_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_form_settings (review_form_setting_id, review_form_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_forms; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_forms (review_form_id, assoc_type, assoc_id, seq, is_active) FROM stdin;
\.


--
-- Data for Name: review_round_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_round_files (review_round_file_id, submission_id, review_round_id, stage_id, submission_file_id) FROM stdin;
\.


--
-- Data for Name: review_rounds; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.review_rounds (review_round_id, submission_id, stage_id, round, review_revision, status) FROM stdin;
\.


--
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.scheduled_tasks (scheduled_task_id, class_name, last_run) FROM stdin;
1	PKP\\task\\StatisticsReport	2026-01-19 05:36:25
2	PKP\\task\\RemoveUnvalidatedExpiredUsers	2026-01-19 05:36:25
3	PKP\\task\\UpdateIPGeoDB	2026-01-19 05:36:25
4	APP\\tasks\\UsageStatsLoader	2026-01-19 05:36:26
5	PKP\\task\\ProcessQueueJobs	2026-01-19 05:36:26
6	PKP\\task\\RemoveFailedJobs	2026-01-19 05:36:26
\.


--
-- Data for Name: section_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.section_settings (section_setting_id, section_id, locale, setting_name, setting_value) FROM stdin;
1	1	en	title	Preprints
5	1	fr_CA	title	
2	1	en	abbrev	PRE
6	1	fr_CA	abbrev	
7	1	en	description	
8	1	fr_CA	description	
9	1	en	identifyType	
10	1	fr_CA	identifyType	
3	1		path	preprints
4	1	en	policy	<p>Section default policy</p>
11	1	fr_CA	policy	
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sections (section_id, server_id, review_form_id, seq, editor_restricted, meta_indexed, meta_reviewed, abstracts_not_required, hide_title, hide_author, is_inactive, abstract_word_count) FROM stdin;
1	1	\N	0	0	1	1	0	0	0	0	0
\.


--
-- Data for Name: server_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.server_settings (server_setting_id, server_id, locale, setting_name, setting_value) FROM stdin;
32	1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##
33	1	en	name	Public Knowledge Preprint Server
6	1	fr_CA	authorInformation	##default.contextSettings.forAuthors##
7	1	en	beginSubmissionHelp	<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href="http://localhost/index.php/publicknowledge/about/submissions" target="_blank">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>
10	1		contactName	Ramiro Vaca
11	1	en	contributorsHelp	<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>
12	1	fr_CA	contributorsHelp	<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu'il ou elle doit demeurer anonyme ou n'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>
13	1		country	IS
14	1		defaultReviewMode	2
15	1	en	description	<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>
19	1		copySubmissionAckPrimaryContact	0
20	1		copySubmissionAckAddress	
21	1		emailSignature	<br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
22	1		enableDois	1
28	1	fr_CA	forTheEditorsHelp	<p>S'il vous plaît, fournissez les détails suivants afin d'aider l'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>
29	1		itemsPerPage	25
30	1		keywords	request
31	1	en	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source system is suitable for libraries to host for their faculty members to use (see <a href="https://pkp.sfu.ca">Public Knowledge Project</a>).
34	1	fr_CA	name	Serveur de prépublication de la connaissance du public
35	1		notifyAllAuthors	1
9	1		contactEmail	rvaca@mailinator.com
16	1	fr_CA	description	<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l'accès du public à la science.</p>
17	1	en	detailsHelp	<p>Please provide the following details to help us manage your submission in our system.</p>
18	1	fr_CA	detailsHelp	<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>
23	1		doiSuffixType	default
24	1		registrationAgency	
36	1		numPageLinks	10
37	1		numWeeksPerResponse	4
38	1		numWeeksPerReview	4
1	1	en	acronym	JPKPKP
4	1	fr_CA	authorGuidelines	##default.contextSettings.authorGuidelines##
25	1		disableSubmissions	0
26	1		editorialStatsEmail	1
27	1	en	forTheEditorsHelp	<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>
5	1	en	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.
39	1	en	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.
40	1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##
41	1	en	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>
42	1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##
43	1	en	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.
44	1	fr_CA	readerInformation	##default.contextSettings.forReaders##
45	1	en	reviewHelp	<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>
46	1	fr_CA	reviewHelp	<p>Révisez l'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l'équipe éditoriale lui sera assigné afin de l'évaluer. S'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>
47	1		submissionAcknowledgement	allAuthors
48	1	en	submissionChecklist	<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href="http://localhost/index.php/publicknowledge/about/submissions">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>
49	1	fr_CA	submissionChecklist	##default.contextSettings.checklist##
50	1		submitWithCategories	0
51	1		supportedFormLocales	["en","fr_CA"]
52	1		supportedLocales	["en","fr_CA"]
55	1	en	uploadFilesHelp	<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>
56	1	fr_CA	uploadFilesHelp	<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>
57	1		enableGeoUsageStats	disabled
58	1		enableInstitutionUsageStats	0
59	1		isSushiApiPublic	1
62	1		enableAuthorScreening	0
63	1		enabledDoiTypes	["publication"]
64	1		postedAcknowledgement	1
65	1		enableOai	1
53	1		supportedSubmissionLocales	["en","fr_CA"]
54	1		themePluginPath	default
3	1	en	authorGuidelines	<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study's country.</p><p> When you're satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>
66	1		doiVersioning	1
67	1		doiCreationTime	copyEditCreationTime
70	1	en	abbreviation	publicknowledgePub Know Pre
8	1	fr_CA	beginSubmissionHelp	<p>Merci de votre soumission à la revue Public Knowledge Preprint Server. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l'avez pas encore fait, merci de consulter nos <a href="http://localhost/index.php/publicknowledge/about/submissions" target="_blank">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>
68	1	en	customHeaders	<meta name="pkp" content="Test metatag.">
71	1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada
69	1	en	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.
72	1		supportEmail	rvaca@mailinator.com
73	1		supportName	Ramiro Vaca
\.


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.servers (server_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en	1
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
e2t6036ti4k4rcbq71vp194b93	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801088	1768801103	0	csrf|a:2:{s:9:"timestamp";i:1768801103;s:5:"token";s:32:"5c7af5184e9fdb3306b312041dd2a93a";}username|s:7:"ccorino";userId|i:7;	localhost
befch1011rinv8jd31o25nqpmm	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801002	1768801011	1	csrf|a:2:{s:9:"timestamp";i:1768801011;s:5:"token";s:32:"363dabc5d9197885911d05264e596845";}userId|i:1;username|s:5:"admin";	localhost
a2h524mbfvh2rvebmh1mod3rpl	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801012	1768801017	1	csrf|a:2:{s:9:"timestamp";i:1768801017;s:5:"token";s:32:"929a6ffc84b21da7a3f0c5b11399831a";}userId|i:1;username|s:5:"admin";	localhost
99a28p4ntmj3i5tk3kdtpqi0jc	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768800985	1768801002	1	csrf|a:2:{s:9:"timestamp";i:1768801002;s:5:"token";s:32:"d89095a013083bd5816ff7eb505b7320";}userId|i:1;username|s:5:"admin";	localhost
re3i4r8thitkhn9pa95pr168f5	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801018	1768801022	1	csrf|a:2:{s:9:"timestamp";i:1768801022;s:5:"token";s:32:"088767f7f8e7d9caff87f3ed107829e2";}userId|i:1;username|s:5:"admin";	localhost
pmf5p28fm0tujigkani9q95a3s	8	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801106	1768801154	0	csrf|a:2:{s:9:"timestamp";i:1768801154;s:5:"token";s:32:"709f51d7d4a83b9d721cd42bbf2aa894";}username|s:8:"ckwantes";userId|i:8;	localhost
rgt12d5lfa5qi4i6djgfho24kt	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801025	1768801055	0	csrf|a:2:{s:9:"timestamp";i:1768801054;s:5:"token";s:32:"4ce31ff8443ab05c1560723b233e7c82";}username|s:5:"admin";	localhost
rm4b8pc2gn4sskevk9gn8nrsfa	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801176	1768801181	0	csrf|a:2:{s:9:"timestamp";i:1768801181;s:5:"token";s:32:"b178cffb14a055c9e9f3cb34c484a3d2";}username|s:7:"dbarnes";	localhost
rsii9vj28jpa4c38iipj52vf9e	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801067	1768801086	1	csrf|a:2:{s:9:"timestamp";i:1768801086;s:5:"token";s:32:"47abc56962519ef9cc50084a5f3c990a";}userId|i:1;username|s:5:"admin";	localhost
mv2veeln906v170bpsr5bej34p	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801061	1768801066	1	csrf|a:2:{s:9:"timestamp";i:1768801066;s:5:"token";s:32:"9cb6252a410bc38fa70b7a6ed3fb744d";}userId|i:1;username|s:5:"admin";	localhost
gvcom6kvoqjibj27jtdo4q314e	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801055	1768801059	0	csrf|a:2:{s:9:"timestamp";i:1768801059;s:5:"token";s:32:"814b76f21542f089a53e970531aa3d21";}username|s:5:"rvaca";	localhost
1vhbtknhtljj7hummn5ao7pm7v	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801154	1768801159	1	csrf|a:2:{s:9:"timestamp";i:1768801159;s:5:"token";s:32:"abdc571e7b995dd91874457057d10f95";}userId|i:3;username|s:7:"dbarnes";	localhost
cckrd2kh3jrpcivr6a4iia67pp	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801160	1768801176	0	csrf|a:2:{s:9:"timestamp";i:1768801176;s:5:"token";s:32:"a32d1cc9e8138051c6de445acbbca7ea";}username|s:12:"cmontgomerie";	localhost
5ulf2597m0qfpuhm49clsrtu26	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801181	1768801196	1	csrf|a:2:{s:9:"timestamp";i:1768801196;s:5:"token";s:32:"093084f1955aabef29e8b4e384dc7c16";}userId|i:3;username|s:7:"dbarnes";	localhost
fg46r8mn03cqh8htch7mj26jgh	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801213	1768801226	1	csrf|a:2:{s:9:"timestamp";i:1768801226;s:5:"token";s:32:"40b5883b98802fc4afd1eeab0cb38d9a";}userId|i:3;username|s:7:"dbarnes";	localhost
899r13gol86jmk3quml5hrskg6	10	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801198	1768801213	0	csrf|a:2:{s:9:"timestamp";i:1768801213;s:5:"token";s:32:"517d926b37f9f526f6c9767960c5bc91";}username|s:6:"ddiouf";userId|i:10;	localhost
r5nucbnvrh36eg3o35k2rg7i8e	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801227	1768801242	0	csrf|a:2:{s:9:"timestamp";i:1768801242;s:5:"token";s:32:"ffaa11223402a827a0fc6907fc656d06";}username|s:9:"dphillips";	localhost
1s62n2uma8c15lunf9h0gpicns	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801243	1768801247	1	csrf|a:2:{s:9:"timestamp";i:1768801247;s:5:"token";s:32:"eebe1a41e475a28a72fe699904d42e4a";}userId|i:3;username|s:7:"dbarnes";	localhost
3spjeudmgluoekjc4pf5kmnbm6	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801247	1768801251	0	csrf|a:2:{s:9:"timestamp";i:1768801251;s:5:"token";s:32:"5b239d6a6fc39e2ca7746eb57e11af52";}username|s:7:"dbarnes";	localhost
ft459t5v6n4c15d7rpve3qo8vj	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801251	1768801254	1	csrf|a:2:{s:9:"timestamp";i:1768801254;s:5:"token";s:32:"9c0982d4add7731262536ff4d92b0271";}userId|i:3;username|s:7:"dbarnes";	localhost
nd11jo89h214mpe7nft2s54lat	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801255	1768801271	0	csrf|a:2:{s:9:"timestamp";i:1768801271;s:5:"token";s:32:"7182ad79828ff08f1356c36c37ca500b";}username|s:9:"dsokoloff";	localhost
gc3t15oc1lgccloj4oa0o1d6na	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801341	1768801356	0	csrf|a:2:{s:9:"timestamp";i:1768801356;s:5:"token";s:32:"1c59f914ef1504c477c1fe68a2aa12a9";}username|s:6:"jnovak";	localhost
a3949fj12ua463vsu7a2t0i9ck	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801293	1768801297	1	csrf|a:2:{s:9:"timestamp";i:1768801297;s:5:"token";s:32:"092197368d7c5e0542bfee4b3fedb337";}userId|i:3;username|s:7:"dbarnes";	localhost
7gjeeofdsmoduotu30ndoakcka	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801384	1768801399	0	csrf|a:2:{s:9:"timestamp";i:1768801399;s:5:"token";s:32:"00c1ded11f5ad738d58217e4d064b767";}username|s:12:"lchristopher";	localhost
ofsd653doi08jsmq5lnnc9igmg	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801319	1768801335	0	csrf|a:2:{s:9:"timestamp";i:1768801335;s:5:"token";s:32:"cc20bcf7c7a1dcb20960e25c235fbcc1";}username|s:10:"jmwandenga";	localhost
lr8u9khbanv7qa449vrl61tdal	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801298	1768801314	0	csrf|a:2:{s:9:"timestamp";i:1768801314;s:5:"token";s:32:"a6454a54356409e7eb035aff97665902";}username|s:9:"fpaglieri";	localhost
v60hlm8pn0k9b456bpoph81ife	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801421	1768801425	1	csrf|a:2:{s:9:"timestamp";i:1768801425;s:5:"token";s:32:"62832abf06c9fb2328c827b9a04bacf0";}userId|i:3;username|s:7:"dbarnes";	localhost
9lk2c9bq3fcprbegfq67ecgqtp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801271	1768801275	1	csrf|a:2:{s:9:"timestamp";i:1768801275;s:5:"token";s:32:"da5157795eff766ba7fb822b1bbda521";}userId|i:3;username|s:7:"dbarnes";	localhost
mpqgg997cl115up7hn5m2qjhk8	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801378	1768801383	1	csrf|a:2:{s:9:"timestamp";i:1768801383;s:5:"token";s:32:"16f9418537c7e63e7d8f7bad4bbc03ff";}userId|i:3;username|s:7:"dbarnes";	localhost
b14sq22itd5s8an5357v4dvj38	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801335	1768801339	1	csrf|a:2:{s:9:"timestamp";i:1768801339;s:5:"token";s:32:"844c5888db3893183ccf94e681ac43a3";}userId|i:3;username|s:7:"dbarnes";	localhost
3t1aj62t95d20pbm1698hhdugv	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801277	1768801292	0	csrf|a:2:{s:9:"timestamp";i:1768801292;s:5:"token";s:32:"34c86c2f3765bef0e0fa9d7d6e99a746";}username|s:7:"eostrom";	localhost
p4m42c9v4dlo2sup94vs9k5u6c	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801314	1768801318	1	csrf|a:2:{s:9:"timestamp";i:1768801318;s:5:"token";s:32:"3ed91e413242b79c6607d995ea113a98";}userId|i:3;username|s:7:"dbarnes";	localhost
lflir1nsvh9etov7sa8520dumq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801356	1768801361	1	csrf|a:2:{s:9:"timestamp";i:1768801361;s:5:"token";s:32:"e33d53e820b32abdaf3cefa9ecabf487";}userId|i:3;username|s:7:"dbarnes";	localhost
rnq943avqe35s6vpv1fee6v402	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801362	1768801378	0	csrf|a:2:{s:9:"timestamp";i:1768801378;s:5:"token";s:32:"699e1ac162a67d83c34971a9feacea63";}username|s:10:"kalkhafaji";	localhost
30qif52plq499si3eel2i152kd	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801400	1768801404	1	csrf|a:2:{s:9:"timestamp";i:1768801404;s:5:"token";s:32:"d0cefae3fdd1cb710b1e55e04ea5c332";}userId|i:3;username|s:7:"dbarnes";	localhost
bice9j5n3o95i8crav4dtactei	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801405	1768801421	0	csrf|a:2:{s:9:"timestamp";i:1768801421;s:5:"token";s:32:"8d5ef78cc30a2e6ac1fe95f5e3c53f8b";}username|s:8:"lkumiega";	localhost
3p3lc67bdrb7rqdf0ta490bol4	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801442	1768801447	1	csrf|a:2:{s:9:"timestamp";i:1768801447;s:5:"token";s:32:"9252c5acdb46933385563a042f82d87c";}userId|i:3;username|s:7:"dbarnes";	localhost
925o09nmi8ipftopvllsf8t21o	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801427	1768801442	0	csrf|a:2:{s:9:"timestamp";i:1768801442;s:5:"token";s:32:"fe4f2bf91bf9f6638e8df2e772bc2d7e";}username|s:7:"pdaniel";	localhost
mukv32u08eh47nrnpd7bhk30df	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801464	1768801468	1	csrf|a:2:{s:9:"timestamp";i:1768801468;s:5:"token";s:32:"a76509d64c5373619e64c38810976724";}userId|i:3;username|s:7:"dbarnes";	localhost
emvc5lmfka7vmvf4grvj19c9p5	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801448	1768801464	0	csrf|a:2:{s:9:"timestamp";i:1768801464;s:5:"token";s:32:"b2aeb3e85bc96f1d1c6ef0f12885a30e";}username|s:8:"rbaiyewu";	localhost
acdj5m4pe585at7ro517gfkna0	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801470	1768801485	0	csrf|a:2:{s:9:"timestamp";i:1768801485;s:5:"token";s:32:"24e178d0226fac875de937256b8766f0";}username|s:6:"rrossi";	localhost
artmja2udv90dl4e74hukcmv3l	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801485	1768801490	1	csrf|a:2:{s:9:"timestamp";i:1768801490;s:5:"token";s:32:"98b963954b3dc183407ac8adce076f2b";}userId|i:3;username|s:7:"dbarnes";	localhost
5fsp3sdqhstfmu6ebchi8t7pjr	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801491	1768801507	0	csrf|a:2:{s:9:"timestamp";i:1768801506;s:5:"token";s:32:"9caf4304b4c0279c5cfb215652f7cdb3";}username|s:12:"vkarbasizaed";	localhost
46uient16cao42rdjpj67p8360	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801534	1768801550	0	csrf|a:2:{s:9:"timestamp";i:1768801550;s:5:"token";s:32:"8c3cef8b07488fb7b046a2528596be94";}username|s:6:"zwoods";	localhost
rsho2pc9abmspu4ntgv8oo3ies	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801513	1768801528	0	csrf|a:2:{s:9:"timestamp";i:1768801528;s:5:"token";s:32:"27c482b6823c34d3330702456a99863a";}username|s:11:"vwilliamson";	localhost
ekfg11ni244bsgma0ue9hp1ata	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801528	1768801533	1	csrf|a:2:{s:9:"timestamp";i:1768801533;s:5:"token";s:32:"fa4aef14910cdd14efcda27a61ad166a";}userId|i:3;username|s:7:"dbarnes";	localhost
ta13os1s6ph2hronqvdk6vnccp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801507	1768801511	1	csrf|a:2:{s:9:"timestamp";i:1768801511;s:5:"token";s:32:"be333842348f4d09779487a56a391b2b";}userId|i:3;username|s:7:"dbarnes";	localhost
90tvtd3p0a3qciv84dsrsrfmdt	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36	1768801550	1768801554	1	csrf|a:2:{s:9:"timestamp";i:1768801554;s:5:"token";s:32:"b7bd7732e42dd660487a89f17712e532";}userId|i:3;username|s:7:"dbarnes";	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.site (site_id, redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
1	0	en	6	["en","fr_CA"]	["en","fr_CA"]	\N
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.site_settings (site_setting_id, setting_name, locale, setting_value) FROM stdin;
1	contactEmail	en	pkpadmin@mailinator.com
2	contactName	en	Open Preprint Systems
3	contactName	fr_CA	Open Preprint Systems
4	compressStatsLogs		0
5	enableGeoUsageStats		disabled
6	enableInstitutionUsageStats		0
7	keepDailyUsageStats		0
8	isSiteSushiPlatform		0
9	isSushiApiPublic		1
10	disableSharedReviewerStatistics		0
11	themePluginPath		default
12	uniqueSiteId		8F81E122-F568-448F-AA9D-93C3C4BB6AFD
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
1	1	4	7	2026-01-19 05:38:24	0	1
2	1	3	4	2026-01-19 05:38:24	0	1
3	1	3	5	2026-01-19 05:38:24	0	1
49	17	4	23	2026-01-19 05:45:06	0	1
50	17	3	4	2026-01-19 05:45:06	0	1
4	2	4	8	2026-01-19 05:39:12	0	1
5	2	3	4	2026-01-19 05:39:12	0	1
6	2	3	5	2026-01-19 05:39:12	0	1
51	17	3	5	2026-01-19 05:45:06	0	1
7	3	4	9	2026-01-19 05:39:35	0	1
8	3	3	4	2026-01-19 05:39:35	0	1
9	3	3	5	2026-01-19 05:39:35	0	1
10	4	4	10	2026-01-19 05:40:13	0	1
11	4	3	4	2026-01-19 05:40:13	0	1
12	4	3	5	2026-01-19 05:40:13	0	1
52	18	4	24	2026-01-19 05:45:28	0	1
53	18	3	4	2026-01-19 05:45:28	0	1
13	5	4	11	2026-01-19 05:40:42	0	1
14	5	3	4	2026-01-19 05:40:42	0	1
15	5	3	5	2026-01-19 05:40:42	0	1
54	18	3	5	2026-01-19 05:45:28	0	1
16	6	4	12	2026-01-19 05:41:10	0	1
17	6	3	4	2026-01-19 05:41:10	0	1
18	6	3	5	2026-01-19 05:41:10	0	1
19	7	4	13	2026-01-19 05:41:32	0	1
20	7	3	4	2026-01-19 05:41:32	0	1
21	7	3	5	2026-01-19 05:41:32	0	1
55	19	4	25	2026-01-19 05:45:49	0	1
56	19	3	4	2026-01-19 05:45:49	0	1
22	8	4	14	2026-01-19 05:41:53	0	1
23	8	3	4	2026-01-19 05:41:53	0	1
24	8	3	5	2026-01-19 05:41:53	0	1
57	19	3	5	2026-01-19 05:45:49	0	1
25	9	4	15	2026-01-19 05:42:14	0	1
26	9	3	4	2026-01-19 05:42:14	0	1
27	9	3	5	2026-01-19 05:42:14	0	1
28	10	4	16	2026-01-19 05:42:36	0	1
29	10	3	4	2026-01-19 05:42:36	0	1
30	10	3	5	2026-01-19 05:42:36	0	1
31	11	4	17	2026-01-19 05:42:58	0	1
32	11	3	4	2026-01-19 05:42:58	0	1
33	11	3	5	2026-01-19 05:42:58	0	1
34	12	4	18	2026-01-19 05:43:19	0	1
35	12	3	4	2026-01-19 05:43:19	0	1
36	12	3	5	2026-01-19 05:43:19	0	1
37	13	4	19	2026-01-19 05:43:40	0	1
38	13	3	4	2026-01-19 05:43:40	0	1
39	13	3	5	2026-01-19 05:43:40	0	1
40	14	4	20	2026-01-19 05:44:02	0	1
41	14	3	4	2026-01-19 05:44:02	0	1
42	14	3	5	2026-01-19 05:44:02	0	1
43	15	4	21	2026-01-19 05:44:23	0	1
44	15	3	4	2026-01-19 05:44:23	0	1
45	15	3	5	2026-01-19 05:44:23	0	1
46	16	4	22	2026-01-19 05:44:45	0	1
47	16	3	4	2026-01-19 05:44:45	0	1
48	16	3	5	2026-01-19 05:44:45	0	1
\.


--
-- Data for Name: subeditor_submission_group; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.subeditor_submission_group (subeditor_submission_group_id, context_id, assoc_id, assoc_type, user_id, user_group_id) FROM stdin;
1	1	1	530	4	3
2	1	1	530	5	3
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

COPY public.submission_file_settings (submission_file_setting_id, submission_file_id, locale, setting_name, setting_value) FROM stdin;
1	1	en	name	The influence of lactation on the quantity and quality of cashmere production.pdf
2	1	fr_CA	name	
3	2	en	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf
4	2	fr_CA	name	
5	3	en	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf
6	3	fr_CA	name	
7	4	en	name	Genetic transformation of forest trees.pdf
8	4	fr_CA	name	
9	5	en	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf
10	5	fr_CA	name	
11	6	en	name	Developing efficacy beliefs in the classroom.pdf
12	6	fr_CA	name	
13	7	en	name	Developing efficacy beliefs in the classroom.pdf
14	7	fr_CA	name	
15	8	en	name	Hansen & Pinto: Reason Reclaimed.pdf
16	8	fr_CA	name	
17	9	en	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf
18	9	fr_CA	name	
19	10	en	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf
20	10	fr_CA	name	
21	11	en	name	Learning Sustainable Design through Service.pdf
22	11	fr_CA	name	
23	12	en	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf
24	12	fr_CA	name	
25	13	en	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf
26	13	fr_CA	name	
27	14	en	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf
28	14	fr_CA	name	
29	15	en	name	Yam diseases and its management in Nigeria.pdf
30	15	fr_CA	name	
31	16	en	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf
32	16	fr_CA	name	
33	17	en	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf
34	17	fr_CA	name	
35	18	en	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf
36	18	fr_CA	name	
37	19	en	name	Finocchiaro: Arguments About Arguments.pdf
38	19	fr_CA	name	
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	1	\N	1	10	\N	\N	\N	2026-01-19 05:38:21	2026-01-19 05:38:23	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2026-01-19 05:38:56	2026-01-19 05:38:58	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2026-01-19 05:39:32	2026-01-19 05:39:35	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2026-01-19 05:40:10	2026-01-19 05:40:12	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2026-01-19 05:40:39	2026-01-19 05:40:41	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2026-01-19 05:41:07	2026-01-19 05:41:10	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2026-01-19 05:41:29	2026-01-19 05:41:31	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2026-01-19 05:41:50	2026-01-19 05:41:53	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2026-01-19 05:42:12	2026-01-19 05:42:14	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2026-01-19 05:42:33	2026-01-19 05:42:35	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2026-01-19 05:42:55	2026-01-19 05:42:57	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2026-01-19 05:43:16	2026-01-19 05:43:18	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2026-01-19 05:43:37	2026-01-19 05:43:40	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2026-01-19 05:43:59	2026-01-19 05:44:01	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2026-01-19 05:44:20	2026-01-19 05:44:23	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2026-01-19 05:44:42	2026-01-19 05:44:44	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2026-01-19 05:45:03	2026-01-19 05:45:06	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2026-01-19 05:45:25	2026-01-19 05:45:27	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2026-01-19 05:45:46	2026-01-19 05:45:49	25	521	20
\.


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	bologna
2	university
3	corino
4	carlo
5	production
6	cashmere
7	quality
8	influence
9	quantity
10	lactation
11	pbps
12	acid
13	homogeneously
14	dry
15	day
16	beet
17	dairy
18	values
19	pig
20	pressed
21	regard
22	effects
23	ing
24	average
25	prob
26	composition
27	beginning
28	semimembranosus
29	period
30	fatty
31	ratio
32	experimental
33	basis
34	whey
35	133rd
36	matter
37	areas
38	readily
39	significant
40	significantly
41	replacing
42	percentages
43	sweet
44	diet
45	weight
46	fat
47	economical
48	adg
49	fcr
50	heavy
51	interest
52	control
53	lean
54	receiving
55	studied
56	view
57	groups
58	traditional
59	barley
60	gilts
61	initial
62	seasoning
63	losses
64	feed
65	concluded
66	exper
67	allocated
68	consequence
69	unaffected
70	adiposity
71	partially
72	replaced
73	products
74	pigs
75	point
76	moderate
77	higher
78	colour
79	cuts
80	marked
81	imental
82	ham
83	growth
84	degree
85	showed
86	differences
87	hypor
88	diets
89	barrows
90	trial
91	parameters
92	diluted
93	group
94	observed
95	fed
96	silage
97	lower
98	pulp
99	chroma
100	windsor
101	catherine
102	kwantes
103	equivalence
104	construct
105	satisfaction
106	nation
107	comparative
108	job
109	facets
110	study
111	attitude
112	responses
113	compared
114	factor
115	effectiveness
116	effect
117	examine
118	benchmark
119	previous
120	consistent
121	culture
122	nature
123	brazil
124	single
125	individually
126	organization
127	revealed
128	countries
129	nations
130	affects
131	compiled
132	multinational
133	exerts
134	report
135	exhibited
136	china
137	factors
138	personal
139	communication
140	support
141	cultural
142	archival
143	comparisons
144	organizational
145	satisfied
146	benefit
147	data
148	employees
149	survey
150	suggest
151	analysis
152	national
153	structures
154	individuals
155	research
156	context
157	efficiency
158	collectivistic
159	findings
160	create
161	urho
162	kekkonen
163	montgomerie
164	craig
165	alberta
166	policy
167	requirements
168	skill
169	computer
170	teachers
171	practice
172	existing
173	implications
174	grade
175	education
176	response
177	infused
178	canada
179	summarizes
180	specifies
181	provincial
182	rate
183	issue
184	school
185	required
186	turning
187	mandated
188	government
189	jurisdictions
190	began
191	province
192	employed
193	integration
194	skills
195	core
196	implement
197	initiatives
198	professional
199	information
200	demonstrate
201	telephone
202	administered
203	students
204	curriculum
205	newly
206	hiring
207	development
208	hired
209	level
210	called
211	expected
212	results
213	goal
214	implementation
215	learning
216	standards
217	courses
218	public
219	upgrade
220	require
221	today
222	technology
223	classroom
224	strategies
225	paper
226	major
227	september
228	respect
229	meet
230	examined
231	integrating
232	mark
233	irvine
234	victoria
235	alexandria
236	diaga
237	diouf
238	genetic
239	forest
240	transformation
241	trees
242	recent
243	review
244	expression
245	plants
246	woody
247	improving
248	engineering
249	genes
250	mechanisms
251	understanding
252	governing
253	progress
254	applications
255	discussed
256	toronto
257	dana
258	phillips
259	thesis
260	disagreement
261	shared
262	fogelin
263	background
264	argument
265	critique
266	deep
267	investigating
268	widely
269	supporters
270	beliefs
271	find
272	pro
273	topic
274	common
275	mitments
276	share
277	procedural
278	claims
279	cedural
280	interlocutors
281	order
282	framework
283	productive
284	consists
285	people
286	competencies
287	part
288	hand
289	fruitfully
290	mistakenly
291	pursue
292	diverge
293	uphold
294	refute
295	claim
296	robert
297	difficult
298	commitments
299	domatilia
300	sokoloff
301	cork
302	college
303	developing
304	efficacy
305	knowledge
306	enhance
307	cps
308	taught
309	involve
310	learn
311	creative
312	graduation
313	conducted
314	making
315	participate
316	motivate
317	key
318	shown
319	valuable
320	means
321	informed
322	decision
323	studies
324	learners
325	action
326	motivation
327	role
328	confident
329	positive
330	instruction
331	showing
332	social
333	strategy
334	presented
335	children
336	enhancing
337	problem
338	equip
339	society
340	belief
341	solving
342	continue
343	leads
344	nurturing
345	citizens
346	citizenship
347	ostrom
348	indiana
349	elinor
350	substantial
351	managed
352	reyes
353	decades
354	distinguished
355	coward
356	mid
357	regions
358	mackenzie
359	resources
360	scholars
361	colleagues
362	contemporary
363	disciplines
364	sec
365	region
366	work
367	los
368	times
369	wittfogel
370	1980s
371	long
372	commons
373	places
374	tors
375	world
376	expe
377	researchers
378	rienced
379	specific
380	mismanaged
381	past
382	developments
383	property
384	pool
385	intellectual
386	resource
387	van
388	frank
389	laerhoven
390	fabio
391	rome
392	paglieri
393	pinto
394	reason
395	hansen
396	reclaimed
397	town
398	cape
399	mwandenga
400	john
401	dividends
402	signalling
403	literature
404	empirical
405	theory
406	evidence
407	dividend
408	shareholding
409	signaling
410	firm
411	economists
412	future
413	offer
414	practical
415	investors
416	evaluation
417	rely
418	decisions
419	financial
420	potential
421	financing
422	continuous
423	signal
424	intuitive
425	suggests
426	conflicting
427	prospects
428	investment
429	distribution
430	management
431	conclusive
432	corporate
433	function
434	guidance
435	novak
436	aalborg
437	condensing
438	water
439	models
440	focus
441	availability
442	systems
443	simplifying
444	reservoirs
445	complex
446	expanding
447	planning
448	river
449	added
450	large
451	applied
452	flows
453	routinely
454	modifying
455	removed
456	basins
457	capabilities
458	input
459	reservoir
460	texas
461	authority
462	simulation
463	enhanced
464	necessarily
465	impacts
466	streamflows
467	contained
468	original
469	datasets
470	statewide
471	represents
472	types
473	state
474	model
475	complete
476	selected
477	included
478	developed
479	dataset
480	accompanying
481	permits
482	growing
483	provide
484	condensed
485	basin
486	based
487	modeling
488	permit
489	regional
490	brazos
491	administration
492	variety
493	develop
494	set
495	methodology
496	rights
497	reflects
498	endeavors
499	features
500	system
501	karim
502	khafaji
503	stanford
504	sustainable
505	design
506	service
507	failed
508	experiences
509	environmental
510	projects
511	present
512	chapter
513	address
514	successful
515	topics
516	setting
517	sustainability
518	largely
519	engineers
520	project
521	academic
522	principles
523	leveraged
524	coordinated
525	identification
526	vital
527	tool
528	limitations
529	involves
530	challenges
531	led
532	exist
533	emerging
534	organizations
535	teach
536	directions
537	integrates
538	student
539	partner
540	internships
541	morse
542	margaret
543	australian
544	christopher
545	leo
546	weaning
547	butyrate
548	piglets
549	improves
550	weaned
551	performance
552	sodium
553	increases
554	supplement
555	reflected
556	levels
557	treatment
558	assess
559	pufa
560	healthy
561	matched
562	close
563	lowest
564	adipose
565	monounsaturated
566	rapeseed
567	mufa
568	isoenergetic
569	cis
570	nutritional
571	averaging
572	differed
573	saturated
574	linolenic
575	result
576	polyunsaturated
577	iodine
578	supplemented
579	treatments
580	acids
581	weights
582	animals
583	technological
584	c18
585	maize
586	sfa
587	slaughter
588	assessed
589	c20
590	linoleic
591	index
592	subcutaneous
593	analyzed
594	samples
595	aim
596	profile
597	content
598	white
599	fifty
600	backfat
601	oil
602	supplementation
603	randomized
604	cured
605	ecosenoic
606	consortium
607	show
608	dietary
609	carefully
610	tissue
611	unsaturation
612	fats
613	parma
614	proportion
615	slaughtering
616	accepted
617	collected
618	term
619	ten
620	highest
621	layers
622	tallow
623	food
624	security
625	lise
626	kumiega
627	hydrologic
628	san
629	marcos
630	barton
631	edwards
632	aquifer
633	drought
634	connectivity
635	springs
636	conditions
637	antonio
638	gradient
639	dynamic
640	normal
641	change
642	potentiometric
643	flowing
644	dramatic
645	longer
646	extensive
647	flow
648	north
649	bearings
650	endangered
651	cfs
652	unknown
653	onion
654	inherent
655	species
656	buda
657	downstream
658	continual
659	population
660	properties
661	assessments
662	structural
663	analyses
664	creek
665	dissipated
666	divide
667	appears
668	necessitates
669	rapid
670	drainage
671	south
672	kyle
673	supply
674	surface
675	questions
676	increased
677	hydraulic
678	demands
679	serves
680	hydrogeologic
681	established
682	wet
683	concept
684	separated
685	plan
686	variation
687	vicinity
688	connection
689	recharge
690	program
691	gradients
692	hydrologically
693	influences
694	collection
695	blanco
696	trend
697	droughts
698	raised
699	groundwater
700	source
701	extended
702	periods
703	shows
704	exists
705	monitoring
706	slopes
707	pumping
708	immediately
709	protect
710	primary
711	central
712	discontinuity
713	simulations
714	influenced
715	numerical
716	segments
717	low
718	vulnerable
719	wolverhampton
720	patricia
721	daniel
722	intercultural
723	case
724	atlantic
725	coast
726	nicaragua
727	designing
728	barriers
729	militate
730	ethnic
731	relations
732	overcome
733	discussions
734	delivering
735	individual
736	uraccan
737	participatory
738	language
739	multiethnic
740	carried
741	wales
742	belonging
743	promoting
744	interculturality
745	emphasises
746	highlights
747	describes
748	genuinely
749	egalitarianism
750	met
751	include
752	achieving
753	country
754	pedagogy
755	council
756	time
757	ethno
758	takes
759	diversity
760	examines
761	community
762	supporting
763	century
764	21st
765	embracing
766	gender
767	power
768	intention
769	staff
770	importance
771	involvement
772	cultures
773	linguistic
774	lasting
775	multilingual
776	communities
777	defining
778	contributing
779	nairobi
780	rana
781	baiyewu
782	nigeria
783	yam
784	diseases
785	presents
786	rotation
787	tubers
788	destruction
789	ash
790	disease
791	severe
792	fallowing
793	fungal
794	processing
795	found
796	wood
797	tecto
798	edible
799	cubes
800	thiabendazole
801	regarded
802	combating
803	devastating
804	advocated
805	material
806	finally
807	anthracnose
808	menace
809	made
810	infected
811	portions
812	yams
813	field
814	crop
815	months
816	adopted
817	resistant
818	rot
819	considered
820	includes
821	marketable
822	chips
823	reductions
824	year
825	mosaic
826	spread
827	storage
828	infection
829	cultivars
830	reduction
831	shelf
832	locally
833	virus
834	planting
835	stored
836	live
837	gins
838	barcelona
839	rossi
840	rosanna
841	nutrition
842	lungs
843	thoracis
844	represent
845	organs
846	beef
847	savannah
848	longissimus
849	pre
850	trade
851	encountered
852	tuberculosis
853	cows
854	ectoparasites
855	fulani
856	category
857	completely
858	nodes
859	authorities
860	lesions
861	african
862	toughest
863	abattoir
864	draw
865	enlarged
866	lameness
867	aid
868	characteristics
869	breeds
870	cameroon
871	origin
872	predominant
873	carcasses
874	carcass
875	lymph
876	varied
877	similar
878	programmes
879	transhumance
880	bulls
881	promote
882	january
883	recorded
884	abnormal
885	respiratory
886	safety
887	improve
888	prevent
889	march
890	gudali
891	rearing
892	affected
893	representative
894	high
895	due
896	fatigue
897	markedly
898	yaoundé
899	distress
900	situation
901	meat
902	slaughtered
903	mbororo
904	liver
905	skin
906	guinea
907	cattle
908	flukes
909	condemned
910	largest
911	red
912	general
913	strengthen
914	nodular
915	pregnant
916	karbasizaed
917	vajiheh
918	tehran
919	metal
920	hospital
921	plasmid
922	coliforms
923	isolated
924	iran
925	isfahan
926	infections
927	antimicrobial
928	nosocomial
929	resistance
930	kelebsiella
931	clinical
932	percent
933	difference
934	possess
935	conjugative
936	pneumoniae
937	mic
938	isolates
939	faeces
940	identified
941	inhibitory
942	tolerant
943	seventy
944	coli
945	strains
946	escherichia
947	encoding
948	minimal
949	relationship
950	human
951	fifteen
952	multiple
953	multidrug
954	recovered
955	profiles
956	pattern
957	persons
958	antibiotics
959	concentration
960	enterobacteriacea
961	patterns
962	metals
963	remaining
964	cases
965	valerie
966	williamson
967	networked
968	environments
969	multi
970	institutions
971	implemented
972	ruled
973	decide
974	perverse
975	sanction
976	reaching
977	actors
978	consensus
979	agree
980	sanctions
981	actor
982	punishing
983	difficulty
984	contributors
985	problematic
986	collectively
987	sanctioning
988	collective
989	sanctioned
990	compare
991	goverance
992	cuny
993	woods
994	zita
995	arguments
996	finocchiaro
\.


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_object_keywords (submission_search_object_keyword_id, object_id, keyword_id, pos) FROM stdin;
1	1	4	0
2	1	3	1
3	1	2	2
4	1	1	3
5	2	8	0
6	2	10	1
7	2	9	2
8	2	7	3
9	2	6	4
10	2	5	5
11	3	22	0
12	3	20	1
13	3	16	2
14	3	98	3
15	3	96	4
16	3	11	5
17	3	41	6
18	3	59	7
19	3	33	8
20	3	55	9
21	3	50	10
22	3	74	11
23	3	95	12
24	3	17	13
25	3	34	14
26	3	92	15
27	3	88	16
28	3	87	17
29	3	74	18
30	3	24	19
31	3	61	20
32	3	45	21
33	3	89	22
34	3	60	23
35	3	13	24
36	3	67	25
37	3	66	26
38	3	81	27
39	3	57	28
40	3	52	29
41	3	74	30
42	3	95	31
43	3	58	32
44	3	43	33
45	3	34	34
46	3	92	35
47	3	44	36
48	3	31	37
49	3	34	38
50	3	14	39
51	3	36	40
52	3	11	41
53	3	72	42
54	3	59	43
55	3	33	44
56	3	29	45
57	3	27	46
58	3	35	47
59	3	15	48
60	3	90	49
61	3	33	50
62	3	11	51
63	3	72	52
64	3	59	53
65	3	33	54
66	3	32	55
67	3	29	56
68	3	88	57
69	3	64	58
70	3	17	59
71	3	34	60
72	3	92	61
73	3	93	62
74	3	39	63
75	3	86	64
76	3	94	65
77	3	83	66
78	3	91	67
79	3	48	68
80	3	49	69
81	3	74	70
82	3	88	71
83	3	23	72
84	3	11	73
85	3	85	74
86	3	40	75
87	3	77	76
88	3	42	77
89	3	53	78
90	3	79	79
91	3	97	80
92	3	42	81
93	3	46	82
94	3	79	83
95	3	82	84
96	3	45	85
97	3	63	86
98	3	62	87
99	3	76	88
100	3	40	89
101	3	80	90
102	3	11	91
103	3	95	92
104	3	74	93
105	3	25	94
106	3	68	95
107	3	97	96
108	3	70	97
109	3	84	98
110	3	30	99
111	3	12	100
112	3	26	101
113	3	82	102
114	3	46	103
115	3	69	104
116	3	88	105
117	3	21	106
118	3	28	107
119	3	78	108
120	3	74	109
121	3	54	110
122	3	11	111
123	3	85	112
124	3	97	113
125	3	99	114
126	3	18	115
127	3	47	116
128	3	75	117
129	3	56	118
130	3	65	119
131	3	11	120
132	3	71	121
133	3	41	122
134	3	59	123
135	3	17	124
136	3	34	125
137	3	50	126
138	3	19	127
139	3	5	128
140	3	51	129
141	3	37	130
142	3	73	131
143	3	38	132
760	33	236	0
761	33	237	1
762	33	235	2
763	33	2	3
764	34	238	0
765	34	240	1
766	34	239	2
767	34	241	3
768	35	243	0
769	35	242	1
770	35	253	2
771	35	238	3
772	35	240	4
773	35	239	5
774	35	241	6
775	35	255	7
776	35	254	8
777	35	238	9
778	35	248	10
779	35	247	11
780	35	239	12
781	35	241	13
782	35	251	14
783	35	250	15
784	35	252	16
785	35	249	17
786	35	244	18
787	35	246	19
788	35	245	20
230	9	101	0
231	9	102	1
232	9	2	2
233	9	100	3
234	9	161	4
235	9	162	5
236	10	109	0
237	10	108	1
238	10	105	2
239	10	106	3
240	10	107	4
241	10	110	5
242	10	104	6
243	10	103	7
244	11	142	0
245	11	147	1
246	11	111	2
247	11	149	3
248	11	148	4
249	11	124	5
250	11	132	6
251	11	126	7
252	11	117	8
253	11	84	9
254	11	152	10
255	11	121	11
256	11	130	12
257	11	122	13
258	11	108	14
259	11	105	15
260	11	112	16
261	11	128	17
262	11	131	18
263	11	160	19
264	11	118	20
265	11	129	21
266	11	125	22
267	11	113	23
268	11	114	24
269	11	151	25
270	11	127	26
271	11	137	27
272	11	144	28
273	11	139	29
274	11	144	30
275	11	157	31
276	11	115	32
277	11	144	33
278	11	140	34
279	11	138	35
280	11	146	36
281	11	143	37
282	11	114	38
283	11	153	39
284	11	144	40
285	11	139	41
286	11	135	42
287	11	104	43
288	11	103	44
289	11	138	45
290	11	146	46
291	11	145	47
292	11	148	48
293	11	136	49
294	11	145	50
295	11	123	51
296	11	120	52
297	11	119	53
298	11	159	54
299	11	154	55
300	11	158	56
301	11	129	57
302	11	134	58
303	11	77	59
304	11	105	60
305	11	155	61
306	11	159	62
307	11	150	63
308	11	152	64
309	11	141	65
310	11	156	66
311	11	133	67
312	11	116	68
313	11	122	69
314	11	108	70
315	11	105	71
316	13	148	0
317	13	149	1
1358	81	400	0
1359	81	399	1
1360	81	2	2
1361	81	398	3
1362	81	397	4
1363	82	402	0
1364	82	405	1
1365	82	401	2
1366	82	243	3
1367	82	403	4
1368	82	404	5
1369	82	406	6
1370	83	409	0
1371	83	405	1
1372	83	425	2
1373	83	401	3
1374	83	423	4
1375	83	412	5
1376	83	427	6
1377	83	410	7
1378	83	242	8
1379	83	404	9
1380	83	406	10
1381	83	413	11
1382	83	431	12
1383	83	406	13
1384	83	183	14
1225	65	349	0
1226	65	347	1
1227	65	348	2
1228	65	2	3
1229	65	388	4
1230	65	387	5
1231	65	389	6
1232	65	348	7
1233	65	2	8
1234	66	303	0
1235	66	304	1
1236	66	270	2
1237	66	223	3
1238	67	110	0
1239	67	372	1
1240	67	376	2
1241	67	378	3
1242	67	350	4
1243	67	83	5
1244	67	207	6
1245	67	381	7
1246	67	353	8
1247	67	354	9
1248	67	360	10
1249	67	363	11
1250	67	371	12
1251	67	55	13
1252	67	379	14
1253	67	359	15
1254	67	351	16
1255	67	380	17
1256	67	368	18
1257	67	373	19
1258	67	355	20
1259	67	367	21
1260	67	352	22
1261	67	358	23
1262	67	369	24
1263	67	377	25
1264	67	55	26
1265	67	379	27
1266	67	372	28
1267	67	356	29
1268	67	370	30
1269	67	362	31
1270	67	361	32
1271	67	321	33
1272	67	366	34
1273	67	360	35
1274	67	363	36
1275	67	364	37
1276	67	374	38
1277	67	365	39
1278	67	51	40
1279	67	357	41
1280	67	375	42
1281	69	274	0
1282	69	384	1
1283	69	386	2
1284	69	274	3
1285	69	383	4
1286	69	385	5
1287	69	382	6
1385	83	426	15
1083	57	299	0
1084	57	300	1
1085	57	2	2
1086	57	302	3
1087	57	301	4
1088	58	303	0
1089	58	304	1
1090	58	270	2
1091	58	223	3
1092	59	226	0
1093	59	213	1
1094	59	175	2
1095	59	338	3
1096	59	335	4
1097	59	305	5
1098	59	194	6
1099	59	340	7
1100	59	328	8
1101	59	321	9
1102	59	345	10
1103	59	345	11
1104	59	342	12
1105	59	324	13
1106	59	312	14
1107	59	225	15
1108	59	317	16
1109	59	327	17
1110	59	344	18
1111	59	304	19
1112	59	270	20
1113	59	281	21
1114	59	310	22
1115	59	315	23
1116	59	184	24
1117	59	339	25
1118	59	155	26
1119	59	159	27
1120	59	313	28
1121	59	332	29
1122	59	323	30
1123	59	156	31
1124	59	334	32
1125	59	331	33
1126	59	333	34
1127	59	330	35
1128	59	306	36
1129	59	304	37
1130	59	215	38
1131	59	287	39
1132	59	155	40
1133	59	311	41
1134	59	337	42
1135	59	341	43
1136	59	307	44
1137	59	308	45
1138	59	335	46
1139	59	320	47
1140	59	316	48
1141	59	140	49
1142	59	215	50
1143	59	318	51
1144	59	307	52
1145	59	329	53
1146	59	22	54
1147	59	304	55
1148	59	215	56
1149	59	319	57
1150	59	282	58
1151	59	309	59
1152	59	335	60
1153	59	322	61
1154	59	314	62
1155	59	343	63
1156	59	332	64
1157	59	325	65
1158	59	173	66
1159	59	336	67
1160	59	304	68
1161	59	326	69
1162	59	310	70
1163	59	223	71
1164	59	255	72
1165	61	175	0
1166	61	346	1
1386	83	166	16
1387	83	173	17
1388	83	419	18
1389	83	411	19
1390	83	414	20
1391	83	407	21
1392	83	166	22
1393	83	434	23
1394	83	430	24
1395	83	172	25
1396	83	420	26
1397	83	415	27
1398	83	408	28
1399	83	432	29
1400	83	428	30
1401	83	421	31
1402	83	429	32
1403	83	418	33
1404	83	422	34
1405	83	433	35
1406	83	430	36
1407	83	407	37
1408	83	418	38
1409	83	417	39
1410	83	424	40
1411	83	416	41
929	49	257	0
930	49	258	1
931	49	2	2
932	49	256	3
933	50	267	0
934	50	261	1
935	50	263	2
936	50	185	3
937	50	264	4
938	50	265	5
939	50	262	6
940	50	259	7
941	50	266	8
942	50	260	9
943	51	296	0
944	51	262	1
945	51	278	2
946	51	280	3
947	51	276	4
948	51	282	5
949	51	263	6
950	51	270	7
951	51	298	8
952	51	281	9
953	51	289	10
954	51	291	11
955	51	264	12
956	51	294	13
957	51	262	14
958	51	295	15
959	51	267	16
960	51	261	17
961	51	263	18
962	51	185	19
963	51	283	20
964	51	264	21
965	51	271	22
966	51	263	23
967	51	284	24
968	51	274	25
969	51	270	26
970	51	273	27
971	51	288	28
972	51	261	29
973	51	272	30
974	51	279	31
975	51	298	32
976	51	286	33
977	51	150	34
978	51	262	35
979	51	269	36
980	51	290	37
981	51	56	38
982	51	261	39
983	51	270	40
984	51	287	41
985	51	185	42
986	51	263	43
987	51	283	44
988	51	264	45
989	51	277	46
990	51	275	47
991	51	297	48
992	51	293	49
993	51	285	50
994	51	270	51
995	51	292	52
996	51	268	53
997	51	273	54
998	51	288	55
648	25	164	0
649	25	163	1
650	25	2	2
651	25	165	3
652	25	232	4
653	25	233	5
654	25	2	6
655	25	234	7
656	26	169	0
657	26	168	1
658	26	167	2
659	26	172	3
660	26	170	4
661	26	173	5
662	26	166	6
663	26	171	7
664	27	193	0
665	27	222	1
666	27	223	2
667	27	226	3
668	27	183	4
669	27	175	5
670	27	221	6
671	27	152	7
672	27	181	8
673	27	197	9
674	27	222	10
675	27	194	11
676	27	203	12
677	27	200	13
678	27	174	14
679	27	209	15
680	27	188	16
681	27	191	17
682	27	165	18
683	27	178	19
684	27	187	20
685	27	214	21
686	27	204	22
687	27	190	23
688	27	227	24
689	27	210	25
690	27	199	26
691	27	139	27
692	27	222	28
693	27	204	29
694	27	177	30
695	27	195	31
696	27	217	32
697	27	180	33
698	27	203	34
699	27	211	35
700	27	228	36
701	27	222	37
702	27	165	38
703	27	215	39
704	27	170	40
705	27	185	41
706	27	196	42
707	27	204	43
708	27	184	44
709	27	189	45
710	27	186	46
711	27	198	47
712	27	207	48
713	27	224	49
714	27	206	50
715	27	216	51
716	27	219	52
717	27	170	53
718	27	169	54
719	27	194	55
720	27	229	56
721	27	213	57
722	27	225	58
723	27	179	59
724	27	212	60
725	27	201	61
726	27	149	62
727	27	202	63
728	27	218	64
729	27	184	65
730	27	189	66
731	27	191	67
732	27	165	68
733	27	176	69
734	27	182	70
735	27	230	71
736	27	169	72
737	27	194	73
738	27	184	74
739	27	189	75
740	27	220	76
741	27	205	77
742	27	208	78
743	27	170	79
744	27	140	80
745	27	224	81
746	27	192	82
747	27	192	83
748	27	170	84
749	29	231	0
750	29	222	1
751	29	169	2
752	29	194	3
753	29	149	4
754	29	165	5
755	29	152	6
756	29	181	7
757	29	198	8
758	29	207	9
759	29	148	10
1296	73	390	0
1297	73	392	1
1298	73	2	2
1299	73	391	3
1300	74	395	0
1301	74	393	1
1302	74	394	2
1303	74	396	3
2054	107	30	43
2055	107	12	44
2056	107	26	45
2057	107	600	46
2058	107	562	47
2059	107	555	48
2060	107	30	49
2061	107	12	50
2062	107	26	51
2063	107	578	52
2064	107	612	53
2065	107	600	54
2066	107	74	55
2067	107	95	56
2068	107	620	57
2069	107	573	58
2070	107	30	59
2071	107	12	60
2072	107	597	61
2073	107	586	62
2074	107	95	63
2075	107	620	64
2076	107	597	65
2077	107	576	66
2078	107	30	67
2079	107	12	68
2080	107	559	69
2081	107	563	70
2082	107	565	71
2083	107	30	72
2084	107	12	73
2085	107	567	74
2086	107	597	75
2087	107	95	76
2088	107	620	77
2089	107	597	78
2090	107	574	79
2091	107	12	80
2092	107	584	81
2093	107	569	82
2094	107	605	83
2095	107	12	84
2096	107	589	85
2097	107	557	86
2098	107	116	87
2099	107	590	88
2100	107	12	89
2101	107	556	90
2102	107	577	91
2103	107	600	92
2104	107	575	93
2105	107	23	94
2106	107	556	95
2107	107	77	96
2108	107	584	97
2109	107	616	98
2110	107	613	99
1997	105	545	0
1998	105	544	1
1999	105	543	2
2000	105	152	3
2001	105	2	4
2002	106	552	0
2003	106	547	1
1541	89	400	0
1542	89	435	1
1543	89	436	2
1544	89	2	3
1545	90	437	0
1546	90	438	1
1547	90	441	2
1548	90	439	3
1549	90	440	4
1550	90	379	5
1551	90	438	6
1552	90	430	7
1553	90	442	8
1554	91	460	0
1555	91	438	1
1556	91	441	2
1557	91	487	3
1558	91	500	4
1559	91	453	5
1560	91	451	6
1561	91	491	7
1562	91	438	8
1563	91	496	9
1564	91	488	10
1565	91	500	11
1566	91	489	12
1567	91	470	13
1568	91	447	14
1569	91	446	15
1570	91	492	16
1571	91	498	17
1572	91	487	18
1573	91	438	19
1574	91	430	20
1575	91	448	21
1576	91	456	22
1577	91	473	23
1578	91	497	24
1579	91	438	25
1580	91	481	26
1581	91	444	27
1582	91	469	28
1583	91	464	29
1584	91	450	30
1585	91	445	31
1586	91	483	32
1587	91	322	33
1588	91	140	34
1589	91	457	35
1590	91	487	36
1591	91	500	37
1592	91	478	38
1593	91	487	39
1594	91	499	40
1595	91	449	41
1596	91	472	42
1597	91	254	43
1598	91	482	44
1599	91	254	45
1600	91	463	46
1601	91	443	47
1602	91	462	48
1603	91	458	49
1604	91	469	50
1605	91	440	51
1606	91	438	52
1607	91	430	53
1608	91	442	54
1609	91	495	55
1610	91	334	56
1611	91	303	57
1612	91	484	58
1613	91	479	59
1614	91	476	60
1615	91	459	61
1616	91	500	62
1617	91	497	63
1618	91	465	64
1619	91	438	65
1620	91	496	66
1621	91	480	67
1622	91	444	68
1623	91	455	69
1624	91	468	70
1625	91	475	71
1626	91	479	72
1627	91	494	73
1628	91	466	74
1629	91	478	75
1630	91	471	76
1631	91	452	77
1632	91	476	78
1633	91	500	79
1634	91	22	80
1635	91	438	81
1636	91	496	82
1637	91	448	83
1638	91	485	84
1639	91	467	85
1640	91	468	86
1641	91	475	87
1642	91	474	88
1643	91	458	89
1644	91	479	90
1645	91	477	91
1646	91	484	92
1647	91	479	93
1648	91	495	94
1649	91	451	95
1650	91	493	96
1651	91	484	97
1652	91	474	98
1653	91	490	99
1654	91	448	100
1655	91	461	101
1656	91	459	102
1657	91	500	103
1658	91	486	104
1659	91	454	105
1660	91	460	106
1661	91	438	107
1662	91	441	108
1663	91	487	109
1664	91	500	110
1665	91	479	111
1666	91	490	112
1667	91	448	113
1668	91	485	114
1669	93	438	0
2004	106	549	2
2005	106	83	3
2006	106	551	4
2007	106	550	5
2008	106	548	6
2009	106	29	7
2010	106	546	8
2011	107	595	0
2012	107	110	1
2013	107	558	2
2014	107	8	3
2015	107	371	4
2016	107	618	5
2017	107	46	6
2018	107	602	7
2019	107	30	8
2020	107	12	9
2021	107	596	10
2022	107	50	11
2023	107	19	12
2024	107	564	13
2025	107	610	14
2026	107	599	15
2027	107	450	16
2028	107	598	17
2029	107	89	18
2030	107	571	19
2031	107	603	20
2032	107	561	21
2033	107	581	22
2034	107	568	23
2035	107	88	24
2036	107	578	25
2037	107	622	26
2038	107	585	27
2039	107	601	28
2040	107	566	29
2041	107	601	30
2042	107	612	31
2043	107	554	32
2044	107	95	33
2045	107	615	34
2046	107	587	35
2047	107	600	36
2048	107	594	37
2049	107	617	38
2050	107	619	39
2051	107	582	40
2052	107	557	41
2053	107	593	42
1750	97	501	0
1751	97	502	1
1752	97	503	2
1753	97	2	3
1754	97	542	4
1755	97	541	5
1756	97	503	6
1757	97	2	7
1758	98	215	0
1759	98	504	1
1760	98	505	2
1761	98	506	3
1762	99	509	0
1763	99	517	1
1764	99	504	2
1765	99	207	3
1766	99	522	4
1767	99	526	5
1768	99	515	6
1769	99	248	7
1770	99	175	8
1771	99	518	9
1772	99	507	10
1773	99	513	11
1774	99	506	12
1775	99	215	13
1776	99	537	14
1777	99	332	15
1778	99	506	16
1779	99	521	17
1780	99	516	18
1781	99	533	19
1782	99	527	20
1783	99	523	21
1784	99	535	22
1785	99	504	23
1786	99	505	24
1787	99	412	25
1788	99	519	26
1789	99	511	27
1790	99	474	28
1791	99	506	29
1792	99	215	30
1793	99	535	31
1794	99	504	32
1795	99	505	33
1796	99	486	34
1797	99	508	35
1798	99	503	36
1799	99	512	37
1800	99	519	38
1801	99	504	39
1802	99	375	40
1803	99	474	41
1804	99	529	42
1805	99	525	43
1806	99	510	44
1807	99	539	45
1808	99	534	46
1809	99	538	47
1810	99	531	48
1811	99	520	49
1812	99	486	50
1813	99	505	51
1814	99	540	52
1815	99	524	53
1816	99	539	54
1817	99	534	55
1818	99	474	56
1819	99	514	57
1820	99	528	58
1821	99	530	59
1822	99	532	60
1823	99	255	61
1824	99	412	62
1825	99	536	63
1826	99	446	64
1827	99	474	65
1828	101	207	0
1829	101	248	1
1830	101	175	2
1831	101	506	3
1832	101	215	4
1833	101	517	5
2111	107	606	100
2112	107	14	101
2113	107	604	102
2114	107	82	103
2115	107	611	104
2116	107	591	105
2117	107	621	106
2118	107	592	107
2119	107	600	108
2120	107	610	109
2121	107	572	110
2122	107	40	111
2123	107	579	112
2124	107	212	113
2125	107	607	114
2126	107	371	115
2127	107	618	116
2128	107	608	117
2129	107	602	118
2130	107	612	119
2131	107	30	120
2132	107	12	121
2133	107	596	122
2134	107	50	123
2135	107	19	124
2136	107	564	125
2137	107	610	126
2138	107	602	127
2139	107	566	128
2140	107	601	129
2141	107	553	130
2142	107	614	131
2143	107	560	132
2144	107	30	133
2145	107	580	134
2146	107	19	135
2147	107	46	136
2148	107	247	137
2149	107	570	138
2150	107	7	139
2151	107	22	140
2152	107	583	141
2153	107	7	142
2154	107	46	143
2155	107	609	144
2156	107	588	145
2157	109	74	0
2158	109	623	1
2159	109	624	2
3217	137	840	0
3218	137	839	1
3219	137	838	2
3220	137	2	3
3221	138	8	0
3222	138	371	1
3223	138	618	2
3224	138	841	3
3225	138	608	4
3226	138	612	5
3227	138	30	6
3228	138	12	7
3229	138	26	8
3230	138	50	9
3231	138	74	10
3232	138	600	11
3233	139	595	0
3234	139	155	1
3235	139	483	2
3236	139	912	3
3237	139	900	4
3238	139	907	5
3239	139	902	6
3240	139	870	7
3241	139	893	8
3242	139	711	9
3243	139	861	10
3244	139	365	11
3245	139	7	12
3246	139	886	13
3247	139	846	14
3248	139	863	15
3249	139	898	16
3250	139	910	17
3251	139	870	18
3252	139	819	19
3253	139	882	20
3254	139	889	21
3255	139	849	22
3256	139	587	23
3257	139	636	24
3258	139	868	25
3259	139	907	26
3260	139	873	27
3261	139	883	28
3262	139	848	29
3263	139	843	30
3264	139	587	31
3265	139	873	32
3266	139	476	33
3267	139	844	34
3268	139	880	35
3269	139	902	36
3270	139	7	37
3271	139	91	38
3272	139	26	39
3273	139	848	40
3274	139	843	41
3275	139	740	42
3276	139	871	43
3277	139	907	44
3278	139	906	45
3279	139	894	46
3280	139	847	47
3281	139	879	48
3282	139	274	49
3283	139	5	50
3284	139	500	51
3285	139	890	52
3286	139	598	53
3287	139	855	54
3288	139	911	55
3289	139	903	56
3290	139	869	57
3291	139	872	58
3292	139	874	59
3293	139	45	60
3294	139	892	61
3295	139	891	62
3296	139	500	63
3297	139	907	64
3298	139	856	65
3299	139	897	66
3300	139	876	67
2961	129	780	0
2962	129	781	1
2963	129	2	2
2964	129	779	3
2965	130	783	0
2966	130	784	1
2967	130	430	2
2968	130	782	3
2969	131	243	0
2970	131	785	1
2971	131	784	2
2972	131	783	3
2973	131	430	4
2974	131	224	5
2975	131	192	6
2976	131	802	7
2977	131	808	8
2978	131	782	9
2979	131	813	10
2980	131	827	11
2981	131	784	12
2982	131	334	13
2983	131	807	14
2984	131	801	15
2985	131	268	16
2986	131	826	17
2987	131	813	18
2988	131	784	19
2989	131	783	20
2990	131	825	21
2991	131	833	22
2992	131	790	23
2993	131	819	24
2994	131	791	25
2995	131	63	26
2996	131	812	27
2997	131	14	28
2998	131	818	29
2999	131	819	30
3000	131	803	31
3001	131	827	32
3002	131	784	33
3003	131	783	34
3004	131	14	35
3005	131	818	36
3006	131	812	37
3007	131	80	38
3008	131	830	39
3009	131	9	40
3010	131	821	41
3011	131	798	42
3012	131	811	43
3013	131	787	44
3014	131	823	45
3015	131	791	46
3016	131	835	47
3017	131	812	48
3018	131	430	49
3019	131	224	50
3020	131	816	51
3021	131	804	52
3022	131	802	53
3023	131	813	54
3024	131	784	55
3025	131	820	56
3026	131	814	57
3027	131	786	58
3028	131	792	59
3029	131	834	60
3030	131	560	61
3031	131	805	62
3032	131	788	63
3033	131	810	64
3034	131	814	65
3035	131	829	66
3036	131	817	67
3037	131	829	68
3038	131	827	69
3039	131	784	70
3040	131	797	71
3041	131	800	72
3042	131	832	73
3043	131	809	74
3044	131	14	75
3045	131	837	76
3046	131	796	77
3047	131	789	78
3048	131	827	79
3049	131	795	80
3050	131	709	81
3051	131	783	82
3052	131	787	83
3053	131	793	84
3054	131	828	85
3055	131	827	86
3056	131	806	87
3057	131	794	88
3058	131	783	89
3059	131	787	90
3060	131	822	91
3061	131	799	92
3062	131	553	93
3063	131	831	94
3064	131	836	95
3065	131	29	96
3066	131	815	97
3067	131	824	98
3301	139	824	68
3302	139	901	69
3303	139	7	70
3304	139	46	71
3305	139	597	72
3306	139	717	73
3307	139	877	74
3308	139	869	75
3309	139	890	76
3310	139	85	77
3311	139	862	78
3312	139	901	79
3313	139	853	80
3314	139	902	81
3315	139	915	82
3316	139	274	83
3317	139	884	84
3318	139	636	85
3319	139	851	86
3320	139	854	87
3321	139	896	88
3322	139	866	89
3323	139	793	90
3324	139	905	91
3325	139	860	92
3326	139	865	93
3327	139	875	94
3328	139	858	95
3329	139	885	96
2388	113	625	0
2389	113	626	1
2390	113	2	2
2391	113	398	3
2392	113	397	4
2393	114	627	0
2394	114	634	1
2395	114	631	2
2396	114	632	3
2397	114	628	4
2398	114	629	5
2399	114	635	6
2400	114	630	7
2401	114	635	8
2402	114	633	9
2403	114	636	10
2404	115	631	0
2405	115	632	1
2406	115	679	2
2407	115	710	3
2408	115	438	4
2409	115	673	5
2410	115	671	6
2411	115	711	7
2412	115	460	8
2413	115	700	9
2414	115	226	10
2415	115	635	11
2416	115	303	12
2417	115	685	13
2418	115	709	14
2419	115	650	15
2420	115	655	16
2421	115	708	17
2422	115	657	18
2423	115	628	19
2424	115	629	20
2425	115	635	21
2426	115	675	22
2427	115	698	23
2428	115	681	24
2429	115	683	25
2430	115	627	26
2431	115	666	27
2432	115	628	28
2433	115	637	29
2434	115	630	30
2435	115	635	31
2436	115	716	32
2437	115	631	33
2438	115	632	34
2439	115	633	35
2440	115	636	36
2441	115	513	37
2442	115	675	38
2443	115	438	39
2444	115	209	40
2445	115	147	41
2446	115	694	42
2447	115	690	43
2448	115	680	44
2449	115	110	45
2450	115	313	46
2451	115	151	47
2452	115	699	48
2453	115	209	49
2454	115	147	50
2455	115	699	51
2456	115	666	52
2457	115	704	53
2458	115	687	54
2459	115	674	55
2460	115	670	56
2461	115	666	57
2462	115	653	58
2463	115	664	59
2464	115	695	60
2465	115	448	61
2466	115	682	62
2467	115	640	63
2468	115	627	64
2469	115	636	65
2470	115	151	66
2471	115	147	67
2472	115	617	68
2473	115	633	69
2474	115	425	70
2475	115	699	71
2476	115	666	72
2477	115	665	73
2478	115	645	74
2479	115	692	75
2480	115	684	76
2481	115	716	77
2482	115	575	78
2483	115	420	79
2484	115	699	80
2485	115	647	81
2486	115	381	82
2487	115	628	83
2488	115	629	84
2489	115	635	85
2490	115	630	86
2491	115	635	87
2492	115	226	88
2493	115	697	89
2494	115	173	90
2495	115	649	91
2496	115	430	92
2497	115	441	93
2498	115	699	94
2499	115	631	95
2500	115	632	96
2501	115	661	97
2502	115	713	98
2503	115	715	99
2504	115	474	100
2505	115	150	101
2506	115	651	102
2507	115	643	103
2508	115	381	104
2509	115	628	105
2510	115	629	106
2511	115	630	107
2512	115	635	108
2513	115	633	109
2514	115	636	110
2515	115	699	111
2516	115	666	112
2517	115	667	113
2518	115	714	114
2519	115	689	115
2520	115	653	116
2521	115	664	117
2522	115	695	118
2523	115	448	119
2524	115	667	120
2525	115	718	121
2526	115	701	122
2527	115	702	123
2528	115	689	124
2529	115	646	125
2530	115	707	126
2531	115	687	127
2532	115	672	128
2533	115	656	129
2534	115	147	130
2535	115	494	131
2536	115	703	132
2537	115	717	133
2538	115	638	134
2539	115	642	135
2540	115	674	136
2541	115	628	137
2542	115	629	138
2543	115	635	139
2544	115	672	140
2545	115	686	141
2546	115	556	142
2547	115	633	143
2548	115	633	144
2549	115	702	145
2550	115	672	146
2551	115	630	147
2552	115	635	148
2553	115	642	149
2554	115	674	150
2555	115	706	151
2556	115	40	152
2557	115	648	153
2558	115	644	154
2559	115	556	155
2560	115	633	156
2561	115	633	157
2562	115	702	158
2563	115	700	159
2564	115	122	160
2565	115	712	161
2566	115	641	162
2567	115	642	163
2568	115	691	164
2569	115	639	165
2570	115	438	166
2571	115	209	167
2572	115	176	168
2573	115	672	169
2574	115	652	170
2575	115	662	171
2576	115	693	172
2577	115	677	173
2578	115	660	174
2579	115	654	175
2580	115	632	176
2581	115	712	177
2582	115	8	178
2583	115	84	179
2584	115	627	180
2585	115	688	181
2586	115	628	182
2587	115	629	183
2588	115	630	184
2589	115	635	185
2590	115	669	186
2591	115	659	187
2592	115	83	188
2593	115	676	189
2594	115	438	190
2595	115	678	191
2596	115	672	192
2597	115	656	193
2598	115	37	194
2599	115	668	195
2600	115	658	196
2601	115	699	197
2602	115	209	198
2603	115	705	199
2604	115	690	200
2605	115	628	201
2606	115	629	202
2607	115	635	203
2608	115	656	204
2609	115	483	205
2610	115	147	206
2611	115	412	207
2612	115	680	208
2613	115	696	209
2614	115	663	210
2615	117	438	0
2735	121	720	0
2736	121	721	1
2737	121	2	2
2738	121	719	3
2739	122	727	0
2740	122	722	1
2741	122	204	2
2742	122	723	3
2743	122	110	4
2744	122	724	5
2745	122	725	6
2746	122	726	7
2747	123	530	0
2748	123	750	1
2749	123	764	2
2750	123	763	3
2751	123	748	4
2752	123	765	5
2753	123	759	6
2754	123	175	7
2755	123	732	8
2756	123	728	9
2757	123	342	10
2758	123	532	11
2759	123	285	12
2760	123	33	13
2761	123	738	14
2762	123	121	15
2763	123	766	16
2764	123	723	17
2765	123	110	18
2766	123	758	19
2767	123	724	20
2768	123	725	21
2769	123	726	22
2770	123	775	23
2771	123	739	24
2772	123	365	25
2773	123	760	26
2774	123	761	27
2775	123	2	28
2776	123	736	29
2777	123	778	30
2778	123	207	31
2779	123	744	32
2780	123	747	33
2781	123	737	34
2782	123	155	35
2783	123	740	36
2784	123	2	37
2785	123	769	38
2786	123	203	39
2787	123	768	40
2788	123	777	41
2789	123	722	42
2790	123	204	43
2791	123	224	44
2792	123	734	45
2793	123	474	46
2794	123	33	47
2795	123	733	48
2796	123	474	49
2797	123	761	50
2798	123	251	51
2799	123	741	52
2800	123	204	53
2801	123	755	54
2802	123	745	55
2803	123	742	56
2804	123	735	57
2805	123	776	58
2806	123	772	59
2807	123	756	60
2808	123	137	61
2809	123	762	62
2810	123	207	63
2811	123	722	64
2812	123	204	65
2813	123	751	66
2814	123	2	67
2815	123	562	68
2816	123	771	69
2817	123	730	70
2818	123	776	71
2819	123	679	72
2820	123	757	73
2821	123	773	74
2822	123	767	75
2823	123	731	76
2824	123	365	77
2825	123	753	78
2826	123	729	79
2827	123	749	80
2828	123	2	81
2829	123	155	82
2830	123	746	83
2831	123	770	84
2832	123	737	85
2833	123	754	86
2834	123	33	87
2835	123	743	88
2836	123	744	89
2837	123	752	90
2838	123	774	91
2839	123	332	92
2840	123	240	93
2841	125	764	0
2842	125	763	1
2843	125	759	2
2844	125	775	3
2845	125	739	4
2846	125	737	5
2847	125	754	6
2848	125	738	7
2849	125	121	8
2850	125	766	9
2851	125	749	10
2852	125	332	11
2853	125	240	12
3330	139	899	97
3331	139	914	98
3332	139	860	99
3333	139	873	100
3334	139	845	101
3335	139	909	102
3336	139	904	103
3337	139	908	104
3338	139	857	105
3339	139	909	106
3340	139	895	107
3341	139	852	108
3342	139	892	109
3343	139	842	110
3344	139	147	111
3345	139	867	112
3346	139	859	113
3347	139	864	114
3348	139	878	115
3349	139	595	116
3350	139	913	117
3351	139	907	118
3352	139	5	119
3353	139	887	120
3354	139	846	121
3355	139	673	122
3356	139	52	123
3357	139	888	124
3358	139	94	125
3359	139	784	126
3360	139	881	127
3361	139	489	128
3362	139	850	129
3363	141	907	0
3364	141	623	1
3365	141	624	2
3473	145	917	0
3474	145	916	1
3475	145	2	2
3476	145	918	3
3477	146	927	0
3478	146	50	1
3479	146	919	2
3480	146	929	3
3481	146	921	4
3482	146	596	5
3483	146	922	6
3484	146	923	7
3485	146	928	8
3486	146	926	9
3487	146	920	10
3488	146	925	11
3489	146	924	12
3490	147	927	0
3491	147	50	1
3492	147	919	2
3493	147	929	3
3494	147	961	4
3495	147	921	5
3496	147	955	6
3497	147	922	7
3498	147	960	8
3499	147	923	9
3500	147	928	10
3501	147	926	11
3502	147	560	12
3503	147	950	13
3504	147	939	14
3505	147	113	15
3506	147	951	16
3507	147	938	17
3508	147	928	18
3509	147	926	19
3510	147	940	20
3511	147	946	21
3512	147	944	22
3513	147	963	23
3514	147	930	24
3515	147	936	25
3516	147	943	26
3517	147	932	27
3518	147	945	28
3519	147	923	29
3520	147	928	30
3521	147	926	31
3522	147	934	32
3523	147	952	33
3524	147	929	34
3525	147	958	35
3526	147	113	36
3527	147	945	37
3528	147	560	38
3529	147	950	39
3530	147	939	40
3531	147	933	41
3532	147	948	42
3533	147	941	43
3534	147	959	44
3535	147	937	45
3536	147	18	46
3537	147	945	47
3538	147	931	48
3539	147	964	49
3540	147	939	50
3541	147	50	51
3542	147	962	52
3543	147	39	53
3544	147	945	54
3545	147	923	55
3546	147	920	56
3547	147	942	57
3548	147	50	58
3549	147	919	59
3550	147	560	60
3551	147	957	61
3552	147	120	62
3553	147	949	63
3554	147	921	64
3555	147	596	65
3556	147	93	66
3557	147	927	67
3558	147	929	68
3559	147	956	69
3560	147	935	70
3561	147	921	71
3562	147	947	72
3563	147	929	73
3564	147	50	74
3565	147	962	75
3566	147	958	76
3567	147	954	77
3568	147	945	78
3569	147	923	79
3570	147	928	80
3571	147	926	81
3572	147	212	82
3573	147	953	83
3574	147	929	84
3575	147	922	85
3576	147	420	86
3577	147	928	87
3578	147	828	88
3579	147	365	89
3633	153	965	0
3634	153	966	1
3635	153	2	2
3636	153	100	3
3637	154	126	0
3638	154	969	1
3639	154	209	2
3640	154	970	3
3641	154	967	4
3642	154	968	5
3643	155	990	0
3644	155	516	1
3645	155	977	2
3646	155	125	3
3647	155	973	4
3648	155	975	5
3649	155	516	6
3650	155	980	7
3651	155	971	8
3652	155	977	9
3653	155	986	10
3654	155	979	11
3655	155	981	12
3656	155	989	13
3657	155	988	14
3658	155	987	15
3659	155	418	16
3660	155	985	17
3661	155	895	18
3662	155	983	19
3663	155	976	20
3664	155	978	21
3665	155	322	22
3666	155	809	23
3667	155	986	24
3668	155	974	25
3669	155	987	26
3670	155	982	27
3671	155	894	28
3672	155	984	29
3673	155	735	30
3674	155	977	31
3675	155	972	32
3676	155	988	33
3677	155	987	34
3678	155	418	35
3679	155	51	36
3680	155	93	37
3681	157	126	0
3682	157	969	1
3683	157	209	2
3684	157	970	3
3685	157	991	4
3694	161	994	0
3695	161	993	1
3696	161	992	2
3697	162	996	0
3698	162	995	1
3699	162	995	2
3700	165	175	0
3701	165	346	1
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
1	1	1	\N
2	1	2	\N
3	1	4	\N
4	1	16	\N
5	1	17	\N
6	1	8	\N
7	1	32	\N
8	1	64	\N
9	2	1	\N
10	2	2	\N
11	2	4	\N
12	2	16	\N
13	2	17	\N
14	2	8	\N
15	2	32	\N
16	2	64	\N
25	3	1	\N
26	3	2	\N
27	3	4	\N
28	3	16	\N
29	3	17	\N
30	3	8	\N
31	3	32	\N
32	3	64	\N
33	4	1	\N
34	4	2	\N
35	4	4	\N
36	4	16	\N
37	4	17	\N
38	4	8	\N
39	4	32	\N
40	4	64	\N
49	5	1	\N
50	5	2	\N
51	5	4	\N
52	5	16	\N
53	5	17	\N
54	5	8	\N
55	5	32	\N
56	5	64	\N
57	6	1	\N
58	6	2	\N
59	6	4	\N
60	6	16	\N
61	6	17	\N
62	6	8	\N
63	6	32	\N
64	6	64	\N
65	7	1	\N
66	7	2	\N
67	7	4	\N
68	7	16	\N
69	7	17	\N
70	7	8	\N
71	7	32	\N
72	7	64	\N
73	8	1	\N
74	8	2	\N
75	8	4	\N
76	8	16	\N
77	8	17	\N
78	8	8	\N
79	8	32	\N
80	8	64	\N
81	9	1	\N
82	9	2	\N
83	9	4	\N
84	9	16	\N
85	9	17	\N
86	9	8	\N
87	9	32	\N
88	9	64	\N
89	10	1	\N
90	10	2	\N
91	10	4	\N
92	10	16	\N
93	10	17	\N
94	10	8	\N
95	10	32	\N
96	10	64	\N
97	11	1	\N
98	11	2	\N
99	11	4	\N
100	11	16	\N
101	11	17	\N
102	11	8	\N
103	11	32	\N
104	11	64	\N
105	12	1	\N
106	12	2	\N
107	12	4	\N
108	12	16	\N
109	12	17	\N
110	12	8	\N
111	12	32	\N
112	12	64	\N
113	13	1	\N
114	13	2	\N
115	13	4	\N
116	13	16	\N
117	13	17	\N
118	13	8	\N
119	13	32	\N
120	13	64	\N
121	14	1	\N
122	14	2	\N
123	14	4	\N
124	14	16	\N
125	14	17	\N
126	14	8	\N
127	14	32	\N
128	14	64	\N
129	15	1	\N
130	15	2	\N
131	15	4	\N
132	15	16	\N
133	15	17	\N
134	15	8	\N
135	15	32	\N
136	15	64	\N
137	16	1	\N
138	16	2	\N
139	16	4	\N
140	16	16	\N
141	16	17	\N
142	16	8	\N
143	16	32	\N
144	16	64	\N
145	17	1	\N
146	17	2	\N
147	17	4	\N
148	17	16	\N
149	17	17	\N
150	17	8	\N
151	17	32	\N
152	17	64	\N
153	18	1	\N
154	18	2	\N
155	18	4	\N
156	18	16	\N
157	18	17	\N
158	18	8	\N
159	18	32	\N
160	18	64	\N
161	19	1	\N
162	19	2	\N
163	19	4	\N
164	19	16	\N
165	19	17	\N
166	19	8	\N
167	19	32	\N
168	19	64	\N
\.


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_settings (submission_setting_id, submission_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submissions (submission_id, context_id, current_publication_id, date_last_activity, date_submitted, last_modified, stage_id, locale, status, submission_progress, work_type) FROM stdin;
18	1	19	2026-01-19 05:45:32	2026-01-19 05:45:28	2026-01-19 05:45:28	5	en	3		0
6	1	7	2026-01-19 05:41:15	2026-01-19 05:41:10	2026-01-19 05:41:10	5	en	3		0
1	1	1	2026-01-19 05:38:24	2026-01-19 05:38:24	2026-01-19 05:38:24	5	en	1		0
12	1	13	2026-01-19 05:43:23	2026-01-19 05:43:19	2026-01-19 05:43:19	5	en	3		0
7	1	8	2026-01-19 05:41:36	2026-01-19 05:41:32	2026-01-19 05:41:32	5	en	3		0
2	1	2	2026-01-19 05:39:18	2026-01-19 05:39:12	2026-01-19 05:39:12	5	en	3		0
13	1	14	2026-01-19 05:43:45	2026-01-19 05:43:40	2026-01-19 05:43:40	5	en	3		0
19	1	20	2026-01-19 05:45:54	2026-01-19 05:45:49	2026-01-19 05:45:49	5	en	3		0
8	1	9	2026-01-19 05:41:58	2026-01-19 05:41:53	2026-01-19 05:41:53	5	en	3		0
14	1	15	2026-01-19 05:44:06	2026-01-19 05:44:02	2026-01-19 05:44:02	5	en	3		0
9	1	10	2026-01-19 05:42:19	2026-01-19 05:42:14	2026-01-19 05:42:14	5	en	3		0
3	1	4	2026-01-19 05:39:56	2026-01-19 05:39:35	2026-01-19 05:39:35	5	en	3		0
15	1	16	2026-01-19 05:44:28	2026-01-19 05:44:23	2026-01-19 05:44:23	5	en	3		0
10	1	11	2026-01-19 05:42:40	2026-01-19 05:42:36	2026-01-19 05:42:36	5	en	3		0
4	1	5	2026-01-19 05:40:13	2026-01-19 05:40:13	2026-01-19 05:40:13	5	en	4		0
11	1	12	2026-01-19 05:43:02	2026-01-19 05:42:58	2026-01-19 05:42:58	5	en	3		0
16	1	17	2026-01-19 05:44:49	2026-01-19 05:44:45	2026-01-19 05:44:45	5	en	3		0
5	1	6	2026-01-19 05:40:54	2026-01-19 05:40:42	2026-01-19 05:40:42	5	en	3		0
17	1	18	2026-01-19 05:45:11	2026-01-19 05:45:06	2026-01-19 05:45:06	5	en	3		0
\.


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
\.


--
-- Data for Name: usage_stats_institution_temporary_records; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.usage_stats_institution_temporary_records (usage_stats_temp_institution_id, load_id, line_number, institution_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_total_temporary_records; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.usage_stats_total_temporary_records (usage_stats_temp_total_id, date, ip, user_agent, line_number, canonical_url, context_id, submission_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_unique_item_investigations_temporary_records; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.usage_stats_unique_item_investigations_temporary_records (usage_stats_temp_unique_item_id, date, ip, user_agent, line_number, context_id, submission_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: usage_stats_unique_item_requests_temporary_records; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.usage_stats_unique_item_requests_temporary_records (usage_stats_temp_item_id, date, ip, user_agent, line_number, context_id, submission_id, representation_id, submission_file_id, assoc_type, file_type, country, region, city, load_id) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_group_settings (user_group_setting_id, user_group_id, locale, setting_name, setting_value) FROM stdin;
1	1	en	name	Site Admin
2	1	fr_CA	name	Administrateur-trice du site
5	2	en	abbrev	PSM
7	2	fr_CA	abbrev	##default.groups.abbrev.manager##
6	2	en	name	Preprint Server manager
8	2	fr_CA	name	##default.groups.name.manager##
3	2		nameLocaleKey	default.groups.name.manager
4	2		abbrevLocaleKey	default.groups.abbrev.manager
11	3	en	abbrev	MOD
13	3	fr_CA	abbrev	##default.groups.abbrev.sectionEditor##
12	3	en	name	Moderator
14	3	fr_CA	name	##default.groups.name.sectionEditor##
9	3		nameLocaleKey	default.groups.name.sectionEditor
10	3		abbrevLocaleKey	default.groups.abbrev.sectionEditor
17	4	en	abbrev	AU
19	4	fr_CA	abbrev	AU
18	4	en	name	Author
20	4	fr_CA	name	Auteur-e
15	4		nameLocaleKey	default.groups.name.author
16	4		abbrevLocaleKey	default.groups.abbrev.author
23	5	en	abbrev	Read
25	5	fr_CA	abbrev	Lect
24	5	en	name	Reader
26	5	fr_CA	name	Lecteur-trice
21	5		nameLocaleKey	default.groups.name.reader
22	5		abbrevLocaleKey	default.groups.abbrev.reader
\.


--
-- Data for Name: user_group_stage; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_group_stage (user_group_stage_id, context_id, user_group_id, stage_id) FROM stdin;
1	1	2	1
2	1	2	5
3	1	3	1
4	1	3	5
5	1	4	1
6	1	4	5
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_groups (user_group_id, context_id, role_id, is_default, show_title, permit_self_registration, permit_metadata_edit) FROM stdin;
1	0	1	1	1	0	0
2	1	16	1	1	0	1
3	1	17	1	1	0	1
4	1	65536	1	1	1	1
5	1	1048576	1	1	1	0
\.


--
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_interests (user_interest_id, user_id, controlled_vocab_entry_id) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_settings (user_setting_id, user_id, locale, setting_name, setting_value) FROM stdin;
8	2	fr_CA	familyName	
9	2	en	givenName	Ramiro
10	2	fr_CA	givenName	
11	2		orcid	
12	2	en	preferredPublicName	
13	2	fr_CA	preferredPublicName	
14	2	en	signature	
15	2	fr_CA	signature	
74	9	en	affiliation	University of Alberta
75	9	en	familyName	Montgomerie
29	4	en	affiliation	University of Chicago
30	4	fr_CA	affiliation	
31	4	en	biography	
32	4	fr_CA	biography	
33	4	en	familyName	Buskins
34	4	fr_CA	familyName	
35	4	en	givenName	David
36	4	fr_CA	givenName	
37	4		orcid	
38	4	en	preferredPublicName	
39	4	fr_CA	preferredPublicName	
40	4	en	signature	
41	4	fr_CA	signature	
42	5	en	affiliation	University of Toronto
43	5	fr_CA	affiliation	
44	5	en	biography	
45	5	fr_CA	biography	
46	5	en	familyName	Berardo
47	5	fr_CA	familyName	
48	5	en	givenName	Stephanie
49	5	fr_CA	givenName	
50	5		orcid	
51	5	en	preferredPublicName	
52	5	fr_CA	preferredPublicName	
53	5	en	signature	
54	5	fr_CA	signature	
55	6	en	affiliation	Kyoto University
56	6	fr_CA	affiliation	
57	6	en	biography	
58	6	fr_CA	biography	
59	6	en	familyName	Inoue
60	6	fr_CA	familyName	
61	6	en	givenName	Minoti
62	6	fr_CA	givenName	
63	6		orcid	
64	6	en	preferredPublicName	
65	6	fr_CA	preferredPublicName	
66	6	en	signature	
67	6	fr_CA	signature	
76	9	en	givenName	Craig
77	10	en	affiliation	Alexandria University
1	1	en	familyName	admin
2	1	en	givenName	admin
68	7	en	affiliation	University of Bologna
69	7	en	familyName	Corino
70	7	en	givenName	Carlo
71	8	en	affiliation	University of Windsor
72	8	en	familyName	Kwantes
73	8	en	givenName	Catherine
78	10	en	familyName	Diouf
79	10	en	givenName	Diaga
92	15	en	affiliation	University of Cape Town
26	3	fr_CA	preferredPublicName	
28	3	fr_CA	signature	
93	15	en	familyName	Mwandenga
94	15	en	givenName	John
21	3	fr_CA	familyName	
22	3	en	givenName	Daniel
3	2	en	affiliation	Universidad Nacional Autónoma de México
4	2	fr_CA	affiliation	
5	2	en	biography	
6	2	fr_CA	biography	
7	2	en	familyName	Vaca
16	3	en	affiliation	University of Melbourne
101	18	en	affiliation	Australian National University
80	11	en	affiliation	University of Toronto
81	11	en	familyName	Phillips
82	11	en	givenName	Dana
83	12	en	affiliation	University College Cork
84	12	en	familyName	Sokoloff
85	12	en	givenName	Domatilia
89	14	en	affiliation	University of Rome
90	14	en	familyName	Paglieri
98	17	en	affiliation	Stanford University
95	16	en	affiliation	Aalborg University
96	16	en	familyName	Novak
97	16	en	givenName	John
19	3	fr_CA	biography	
86	13	en	affiliation	Indiana University
87	13	en	familyName	Ostrom
88	13	en	givenName	Elinor
18	3	en	biography	
99	17	en	familyName	Al-Khafaji
100	17	en	givenName	Karim
91	14	en	givenName	Fabio
23	3	fr_CA	givenName	
17	3	fr_CA	affiliation	
20	3	en	familyName	Barnes
102	18	en	familyName	Christopher
103	18	en	givenName	Leo
104	19	en	affiliation	University of Cape Town
105	19	en	familyName	Kumiega
106	19	en	givenName	Lise
27	3	en	signature	
107	20	en	affiliation	University of Wolverhampton
108	20	en	familyName	Daniel
109	20	en	givenName	Patricia
25	3	en	preferredPublicName	
111	21	en	familyName	Baiyewu
112	21	en	givenName	Rana
24	3		orcid	
110	21	en	affiliation	University of Nairobi
113	22	en	affiliation	Barcelona University
114	22	en	familyName	Rossi
115	22	en	givenName	Rosanna
116	23	en	affiliation	University of Tehran
117	23	en	familyName	Karbasizaed
118	23	en	givenName	Vajiheh
119	24	en	affiliation	University of Windsor
120	24	en	familyName	Williamson
121	24	en	givenName	Valerie
122	25	en	affiliation	CUNY
123	25	en	familyName	Woods
124	25	en	givenName	Zita
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_user_groups (user_user_group_id, user_group_id, user_id) FROM stdin;
1	1	1
2	2	1
3	2	2
4	2	3
5	3	4
6	3	5
7	3	6
8	5	7
9	4	7
10	5	8
11	4	8
12	5	9
13	4	9
14	5	10
15	4	10
16	5	11
17	4	11
18	5	12
19	4	12
20	5	13
21	4	13
22	5	14
23	4	14
24	5	15
25	4	15
26	5	16
27	4	16
28	5	17
29	4	17
30	5	18
31	4	18
32	5	19
33	4	19
34	5	20
35	4	20
36	5	21
37	4	21
38	5	22
39	4	22
40	5	23
41	4	23
42	5	24
43	4	24
44	5	25
45	4	25
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.users (user_id, username, password, email, url, phone, mailing_address, billing_address, country, locales, gossip, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help) FROM stdin;
16	jnovak	$2y$10$LvaBj3canLxplEeE3xhtU.6..BPoDpi9U1VkB4wvvQRE2W.gYb1Py	jnovak@mailinator.com	\N	\N	\N	\N	DK	[]	\N	\N	2026-01-19 05:42:23	\N	2026-01-19 05:42:23	\N	\N	\N	0	\N	1
25	zwoods	$2y$10$chxMJ64kfks1rmBp92NVouBXZ7VrLhHZcOu1x3MUHaGTJHjpJd.Ya	zwoods@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2026-01-19 05:45:36	\N	2026-01-19 05:45:37	\N	\N	\N	0	\N	1
4	dbuskins	$2y$10$CqvI14hGe7IAPnwUhqLc1uBEJE2IChyEiyE9NR0a0/VesHUOa6Hy6	dbuskins@mailinator.com				\N	US	[]	\N	\N	2026-01-19 05:37:22	\N	\N	0	\N	\N	0	\N	1
5	sberardo	$2y$10$8t.mEcWe2EY.zTpGsm7BTOzB.XJ7wR0RYZd8sHZuoBejg0ZIqu4ai	sberardo@mailinator.com				\N	CA	[]	\N	\N	2026-01-19 05:37:28	\N	\N	0	\N	\N	0	\N	1
6	minoue	$2y$10$PSIN3UKwQws/xSBYYMVHF.3ukXMzxSXeOnA0PJuw9Z1XVlGrwZJPm	minoue@mailinator.com				\N	JP	[]	\N	\N	2026-01-19 05:37:34	\N	\N	0	\N	\N	0	\N	1
17	kalkhafaji	$2y$10$6RjAee3CP3SADi7Py8U0outQDjO2v/hzHPiygKpbUa7YfG7dOkC5.	kalkhafaji@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2026-01-19 05:42:45	\N	2026-01-19 05:42:45	\N	\N	\N	0	\N	1
3	dbarnes	$2y$10$nkSpPjhc00whZn8rn/GzyOKctFBKEqfUa/2mFGo3De6jYDULdtywe	dbarnes@mailinator.com				\N	AU	[]	\N	\N	2026-01-19 05:37:17	\N	2026-01-19 05:45:51	0	\N	\N	0	\N	1
2	rvaca	$2y$10$6vpF6wlrKK23uaBbQnbIIe.gPELtJxU9bJYhCbdyzuRd6GaLvSVPS	rvaca@mailinator.com				\N	MX	[]	\N	\N	2026-01-19 05:37:12	\N	2026-01-19 05:37:38	0	\N	\N	0	\N	1
1	admin	$2y$10$RjBnVz7yECnZvOkriKVzle9Dicrog9JfoAgUVUyIjzGWrZeGGmwOG	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	[]	\N	\N	2026-01-19 05:36:22	\N	2026-01-19 05:37:47	\N	\N	\N	0	\N	1
7	ccorino	$2y$10$YTN5vs15YmBiFQjx7D7WVOx..6ODSLS8Kcl.veVA9AFKahpHA3bWC	ccorino@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2026-01-19 05:38:10	\N	2026-01-19 05:38:10	\N	\N	\N	0	\N	1
8	ckwantes	$2y$10$gWmT3sku92NQjOCG8kCNh.vO4Kn6bKkwc.zr97Wdzpfv735u1XSzO	ckwantes@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2026-01-19 05:38:28	\N	2026-01-19 05:38:28	\N	\N	\N	0	\N	1
18	lchristopher	$2y$10$XPjeZanZXp1Fi6M3fDq7zOByBcAv.wF63phFs0cAUYTHmN/bqlEui	lchristopher@mailinator.com	\N	\N	\N	\N	AU	[]	\N	\N	2026-01-19 05:43:06	\N	2026-01-19 05:43:06	\N	\N	\N	0	\N	1
9	cmontgomerie	$2y$10$xZ9gzGfcoqYuH/OQAjzqcuyt2QjdbVWQszso3v6xrZ9B66h.IfqVu	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2026-01-19 05:39:22	\N	2026-01-19 05:39:22	\N	\N	\N	0	\N	1
10	ddiouf	$2y$10$tARkO7bnmeNFDA4cZ.VuzOVdkmGKK3OYlVP04Z9ZjwWDXwgYUTEz.	ddiouf@mailinator.com	\N	\N	\N	\N	EG	[]	\N	\N	2026-01-19 05:40:00	\N	2026-01-19 05:40:00	\N	\N	\N	0	\N	1
19	lkumiega	$2y$10$kUHrwsDhxfYT91nOuZmfhuRVeCdLi.ZP9XeX0uvXpXgX8K4Cxvo0a	lkumiega@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2026-01-19 05:43:27	\N	2026-01-19 05:43:28	\N	\N	\N	0	\N	1
11	dphillips	$2y$10$1RUKroR017XcHZJe29HaLOHSVil1X6qONjQt.SAct.LI0ZY2xelLy	dphillips@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2026-01-19 05:40:29	\N	2026-01-19 05:40:29	\N	\N	\N	0	\N	1
20	pdaniel	$2y$10$naD34T.fHJcMDXibEXQvDe1gc69bIWwGInbCv0O7sFT.z3djxM56.	pdaniel@mailinator.com	\N	\N	\N	\N	GB	[]	\N	\N	2026-01-19 05:43:49	\N	2026-01-19 05:43:49	\N	\N	\N	0	\N	1
12	dsokoloff	$2y$10$VOXBobNoMgPlwkHY0Qk4murNE28j6v1zr6yJG1/d084SpqZDSle/6	dsokoloff@mailinator.com	\N	\N	\N	\N	IE	[]	\N	\N	2026-01-19 05:40:57	\N	2026-01-19 05:40:57	\N	\N	\N	0	\N	1
13	eostrom	$2y$10$148tlOS1zpe7a0A4wPMbP.LyTXVGPDidzuPYJuu3/HUfVE8jHuhxu	eostrom@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2026-01-19 05:41:19	\N	2026-01-19 05:41:19	\N	\N	\N	0	\N	1
14	fpaglieri	$2y$10$mgei1y/y.rEI7tCaU3uZNuV1eitHuALLZh1Wqgr5WHoXmnwq/505G	fpaglieri@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2026-01-19 05:41:40	\N	2026-01-19 05:41:40	\N	\N	\N	0	\N	1
15	jmwandenga	$2y$10$OCVtX1zCmXp4DrnHF9ET3egnWsURHbwssqVoc7JTno2ZVf/N2edjS	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2026-01-19 05:42:02	\N	2026-01-19 05:42:02	\N	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$CSxYlPbeKuPG65UJLbDGIuCznn6DvuTTe/7uUWz62N5H.L47UeEYK	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE	[]	\N	\N	2026-01-19 05:44:10	\N	2026-01-19 05:44:11	\N	\N	\N	0	\N	1
22	rrossi	$2y$10$PmgXQiNOZzZO/2zir29wSevI1j6t9Ep55X4GyUGyRFFzLnHT/6mem	rrossi@mailinator.com	\N	\N	\N	\N	ES	[]	\N	\N	2026-01-19 05:44:32	\N	2026-01-19 05:44:32	\N	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$KvtLbzFKE67RXQbWtjMRWeL.WItAJYz4BiGrl4ACCG8F7jffF6OiG	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR	[]	\N	\N	2026-01-19 05:44:53	\N	2026-01-19 05:44:53	\N	\N	\N	0	\N	1
24	vwilliamson	$2y$10$xp.ZUOhPHsN16kKd3RoHveI99pHTCOLSpmHtlDhw./f0tzMPo/u5q	vwilliamson@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2026-01-19 05:45:15	\N	2026-01-19 05:45:15	\N	\N	\N	0	\N	1
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (version_id, major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	1	0	0	0	2026-01-19 05:36:22	1	plugins.metadata	dc11		0	0
2	1	0	0	0	2026-01-19 05:36:22	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
3	1	0	1	0	2026-01-19 05:36:22	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
4	1	0	0	0	2026-01-19 05:36:22	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
5	1	0	1	0	2026-01-19 05:36:22	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
6	1	3	0	0	2026-01-19 05:36:22	1	plugins.generic	acron	AcronPlugin	1	1
7	1	0	0	0	2026-01-19 05:36:22	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
8	1	3	4	9	2026-01-19 05:36:22	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
9	1	0	0	0	2026-01-19 05:36:22	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
10	2	2	0	0	2026-01-19 05:36:22	1	plugins.generic	crossref		0	0
11	0	1	0	0	2026-01-19 05:36:22	1	plugins.generic	citationStyleLanguage	CitationStyleLanguagePlugin	1	0
12	1	0	0	0	2026-01-19 05:36:22	1	plugins.generic	usageEvent		0	0
13	1	0	0	0	2026-01-19 05:36:22	1	plugins.generic	webFeed	WebFeedPlugin	1	0
14	1	1	0	0	2026-01-19 05:36:22	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
15	1	2	0	0	2026-01-19 05:36:22	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
16	1	0	0	0	2026-01-19 05:36:22	1	plugins.importexport	native		0	0
17	1	0	0	0	2026-01-19 05:36:22	1	plugins.oaiMetadataFormats	dc		0	0
18	1	0	0	0	2026-01-19 05:36:22	1	plugins.themes	default	DefaultThemePlugin	1	0
19	3	4	0	10	2026-01-19 05:36:21	1	core	ops		0	1
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.access_keys_access_key_id_seq', 1, false);


--
-- Name: announcement_settings_announcement_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcement_settings_announcement_setting_id_seq', 1, false);


--
-- Name: announcement_type_settings_announcement_type_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcement_type_settings_announcement_type_setting_id_seq', 1, false);


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcement_types_type_id_seq', 1, false);


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.announcements_announcement_id_seq', 1, false);


--
-- Name: author_settings_author_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.author_settings_author_setting_id_seq', 118, true);


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 26, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Name: category_settings_category_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.category_settings_category_setting_id_seq', 25, true);


--
-- Name: citation_settings_citation_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.citation_settings_citation_setting_id_seq', 1, false);


--
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.citations_citation_id_seq', 1, false);


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entries_controlled_vocab_entry_id_seq', 133, true);


--
-- Name: controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq', 133, true);


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 101, true);


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_oai_set_objects_object_id_seq', 4, true);


--
-- Name: data_object_tombstone_settings_tombstone_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstone_settings_tombstone_setting_id_seq', 1, false);


--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.data_object_tombstones_tombstone_id_seq', 2, true);


--
-- Name: doi_settings_doi_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.doi_settings_doi_setting_id_seq', 1, false);


--
-- Name: dois_doi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.dois_doi_id_seq', 1, false);


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.edit_decisions_edit_decision_id_seq', 3, true);


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_log_log_id_seq', 64, true);


--
-- Name: email_log_users_email_log_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_log_users_email_log_user_id_seq', 60, true);


--
-- Name: email_templates_default_data_email_templates_default_data_i_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_default_data_email_templates_default_data_i_seq', 69, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_email_id_seq', 1, true);


--
-- Name: email_templates_settings_email_template_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.email_templates_settings_email_template_setting_id_seq', 1, false);


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_log_id_seq', 144, true);


--
-- Name: event_log_settings_event_log_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_settings_event_log_setting_id_seq', 345, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.files_file_id_seq', 19, true);


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filter_groups_filter_group_id_seq', 12, true);


--
-- Name: filter_settings_filter_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filter_settings_filter_setting_id_seq', 1, false);


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.filters_filter_id_seq', 12, true);


--
-- Name: genre_settings_genre_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.genre_settings_genre_setting_id_seq', 24, true);


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 12, true);


--
-- Name: institution_ip_institution_ip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.institution_ip_institution_ip_id_seq', 1, false);


--
-- Name: institution_settings_institution_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.institution_settings_institution_setting_id_seq', 1, false);


--
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 41, true);


--
-- Name: library_file_settings_library_file_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.library_file_settings_library_file_setting_id_seq', 1, false);


--
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.library_files_file_id_seq', 1, false);


--
-- Name: metrics_context_metrics_context_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_context_metrics_context_id_seq', 1, false);


--
-- Name: metrics_counter_submission_da_metrics_counter_submission_da_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_counter_submission_da_metrics_counter_submission_da_seq', 1, false);


--
-- Name: metrics_counter_submission_in_metrics_counter_submission_i_seq1; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_counter_submission_in_metrics_counter_submission_i_seq1', 1, false);


--
-- Name: metrics_counter_submission_in_metrics_counter_submission_in_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_counter_submission_in_metrics_counter_submission_in_seq', 1, false);


--
-- Name: metrics_counter_submission_mo_metrics_counter_submission_mo_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq', 1, false);


--
-- Name: metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq', 1, false);


--
-- Name: metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq', 1, false);


--
-- Name: metrics_submission_metrics_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.metrics_submission_metrics_submission_id_seq', 1, false);


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignm_seq1; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1', 1, false);


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 22, true);


--
-- Name: navigation_menu_item_settings_navigation_menu_item_setting__seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.navigation_menu_item_settings_navigation_menu_item_setting__seq', 23, true);


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
-- Name: notification_settings_notification_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_settings_notification_setting_id_seq', 1, true);


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 19, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 121, true);


--
-- Name: oai_resumption_tokens_oai_resumption_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.oai_resumption_tokens_oai_resumption_token_id_seq', 1, false);


--
-- Name: plugin_settings_plugin_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.plugin_settings_plugin_setting_id_seq', 27, true);


--
-- Name: publication_categories_publication_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_categories_publication_category_id_seq', 1, false);


--
-- Name: publication_galley_settings_publication_galley_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galley_settings_publication_galley_setting_id_seq', 1, false);


--
-- Name: publication_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_galleys_galley_id_seq', 20, true);


--
-- Name: publication_settings_publication_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publication_settings_publication_setting_id_seq', 114, true);


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.publications_publication_id_seq', 20, true);


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.queries_query_id_seq', 1, false);


--
-- Name: query_participants_query_participant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.query_participants_query_participant_id_seq', 1, false);


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_assignments_review_id_seq', 1, false);


--
-- Name: review_files_review_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_files_review_file_id_seq', 1, false);


--
-- Name: review_form_element_settings_review_form_element_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_form_element_settings_review_form_element_setting_id_seq', 1, false);


--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_form_elements_review_form_element_id_seq', 1, false);


--
-- Name: review_form_responses_review_form_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_form_responses_review_form_response_id_seq', 1, false);


--
-- Name: review_form_settings_review_form_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_form_settings_review_form_setting_id_seq', 1, false);


--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_forms_review_form_id_seq', 1, false);


--
-- Name: review_round_files_review_round_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_round_files_review_round_file_id_seq', 1, false);


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.review_rounds_review_round_id_seq', 1, false);


--
-- Name: scheduled_tasks_scheduled_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.scheduled_tasks_scheduled_task_id_seq', 6, true);


--
-- Name: section_settings_section_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.section_settings_section_setting_id_seq', 11, true);


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 1, true);


--
-- Name: server_settings_server_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.server_settings_server_setting_id_seq', 73, true);


--
-- Name: servers_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.servers_server_id_seq', 1, true);


--
-- Name: site_settings_site_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.site_settings_site_setting_id_seq', 12, true);


--
-- Name: site_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.site_site_id_seq', 1, true);


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.stage_assignments_stage_assignment_id_seq', 57, true);


--
-- Name: subeditor_submission_group_subeditor_submission_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.subeditor_submission_group_subeditor_submission_group_id_seq', 2, true);


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_comments_comment_id_seq', 1, false);


--
-- Name: submission_file_revisions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_file_revisions_revision_id_seq', 19, true);


--
-- Name: submission_file_settings_submission_file_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_file_settings_submission_file_setting_id_seq', 38, true);


--
-- Name: submission_files_submission_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_files_submission_file_id_seq', 19, true);


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 996, true);


--
-- Name: submission_search_object_keyw_submission_search_object_keyw_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_object_keyw_submission_search_object_keyw_seq', 3701, true);


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 168, true);


--
-- Name: submission_settings_submission_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_settings_submission_setting_id_seq', 1, false);


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submissions_submission_id_seq', 19, true);


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.temporary_files_file_id_seq', 1, false);


--
-- Name: usage_stats_institution_tempo_usage_stats_temp_institution__seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.usage_stats_institution_tempo_usage_stats_temp_institution__seq', 1, false);


--
-- Name: usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq', 1, false);


--
-- Name: usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq', 1, false);


--
-- Name: usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq', 1, false);


--
-- Name: user_group_settings_user_group_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_group_settings_user_group_setting_id_seq', 26, true);


--
-- Name: user_group_stage_user_group_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_group_stage_user_group_stage_id_seq', 6, true);


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 5, true);


--
-- Name: user_interests_user_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_interests_user_interest_id_seq', 1, false);


--
-- Name: user_settings_user_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_settings_user_setting_id_seq', 124, true);


--
-- Name: user_user_groups_user_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_user_groups_user_user_group_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Name: versions_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.versions_version_id_seq', 19, true);


--
-- Name: access_keys access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_settings announcement_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_pkey PRIMARY KEY (announcement_setting_id);


--
-- Name: announcement_settings announcement_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_unique UNIQUE (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings announcement_type_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_pkey PRIMARY KEY (announcement_type_setting_id);


--
-- Name: announcement_type_settings announcement_type_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_unique UNIQUE (type_id, locale, setting_name);


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
-- Name: author_settings author_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_pkey PRIMARY KEY (author_setting_id);


--
-- Name: author_settings author_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_unique UNIQUE (author_id, locale, setting_name);


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
    ADD CONSTRAINT category_settings_pkey PRIMARY KEY (category_setting_id);


--
-- Name: category_settings category_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_unique UNIQUE (category_id, locale, setting_name);


--
-- Name: citation_settings citation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_pkey PRIMARY KEY (citation_setting_id);


--
-- Name: citation_settings citation_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_unique UNIQUE (citation_id, locale, setting_name);


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
-- Name: controlled_vocab_entry_settings controlled_vocab_entry_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT controlled_vocab_entry_settings_pkey PRIMARY KEY (controlled_vocab_entry_setting_id);


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
    ADD CONSTRAINT data_object_tombstone_settings_pkey PRIMARY KEY (tombstone_setting_id);


--
-- Name: data_object_tombstone_settings data_object_tombstone_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_unique UNIQUE (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstones data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: doi_settings doi_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_pkey PRIMARY KEY (doi_setting_id);


--
-- Name: doi_settings doi_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_unique UNIQUE (doi_id, locale, setting_name);


--
-- Name: dois dois_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_pkey PRIMARY KEY (doi_id);


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
-- Name: email_log_users email_log_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_users_pkey PRIMARY KEY (email_log_user_id);


--
-- Name: email_templates_default_data email_templates_default_data_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_pkey PRIMARY KEY (email_templates_default_data_id);


--
-- Name: email_templates_default_data email_templates_default_data_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_default_data
    ADD CONSTRAINT email_templates_default_data_unique UNIQUE (email_key, locale);


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
-- Name: email_templates_settings email_templates_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_templates_settings_pkey PRIMARY KEY (email_template_setting_id);


--
-- Name: email_templates_settings email_templates_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_templates_settings_unique UNIQUE (email_id, locale, setting_name);


--
-- Name: event_log event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: event_log_settings event_log_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_pkey PRIMARY KEY (event_log_setting_id);


--
-- Name: event_log_settings event_log_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_unique UNIQUE (log_id, setting_name, locale);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


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
    ADD CONSTRAINT filter_settings_pkey PRIMARY KEY (filter_setting_id);


--
-- Name: filter_settings filter_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_unique UNIQUE (filter_id, locale, setting_name);


--
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genre_settings genre_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_pkey PRIMARY KEY (genre_setting_id);


--
-- Name: genre_settings genre_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_unique UNIQUE (genre_id, locale, setting_name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: institution_ip institution_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_ip
    ADD CONSTRAINT institution_ip_pkey PRIMARY KEY (institution_ip_id);


--
-- Name: institution_settings institution_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_settings
    ADD CONSTRAINT institution_settings_pkey PRIMARY KEY (institution_setting_id);


--
-- Name: institution_settings institution_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_settings
    ADD CONSTRAINT institution_settings_unique UNIQUE (institution_id, locale, setting_name);


--
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (institution_id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: library_file_settings library_file_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_pkey PRIMARY KEY (library_file_setting_id);


--
-- Name: library_file_settings library_file_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_unique UNIQUE (file_id, locale, setting_name);


--
-- Name: library_files library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: metrics_context metrics_context_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_context
    ADD CONSTRAINT metrics_context_pkey PRIMARY KEY (metrics_context_id);


--
-- Name: metrics_counter_submission_daily metrics_counter_submission_daily_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT metrics_counter_submission_daily_pkey PRIMARY KEY (metrics_counter_submission_daily_id);


--
-- Name: metrics_counter_submission_institution_daily metrics_counter_submission_institution_daily_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT metrics_counter_submission_institution_daily_pkey PRIMARY KEY (metrics_counter_submission_institution_daily_id);


--
-- Name: metrics_counter_submission_institution_monthly metrics_counter_submission_institution_monthly_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT metrics_counter_submission_institution_monthly_pkey PRIMARY KEY (metrics_counter_submission_institution_monthly_id);


--
-- Name: metrics_counter_submission_monthly metrics_counter_submission_monthly_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT metrics_counter_submission_monthly_pkey PRIMARY KEY (metrics_counter_submission_monthly_id);


--
-- Name: metrics_submission_geo_daily metrics_submission_geo_daily_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT metrics_submission_geo_daily_pkey PRIMARY KEY (metrics_submission_geo_daily_id);


--
-- Name: metrics_submission_geo_monthly metrics_submission_geo_monthly_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT metrics_submission_geo_monthly_pkey PRIMARY KEY (metrics_submission_geo_monthly_id);


--
-- Name: metrics_submission metrics_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_pkey PRIMARY KEY (metrics_submission_id);


--
-- Name: metrics_counter_submission_daily msd_uc_load_id_context_id_submission_id_date; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT msd_uc_load_id_context_id_submission_id_date UNIQUE (load_id, context_id, submission_id, date);


--
-- Name: metrics_submission_geo_daily msgd_uc_load_context_submission_c_r_c_date; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT msgd_uc_load_context_submission_c_r_c_date UNIQUE (load_id, context_id, submission_id, country, region, city, date);


--
-- Name: metrics_submission_geo_monthly msgm_uc_context_submission_c_r_c_month; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT msgm_uc_context_submission_c_r_c_month UNIQUE (context_id, submission_id, country, region, city, month);


--
-- Name: metrics_counter_submission_institution_daily msid_uc_load_id_context_id_submission_id_institution_id_date; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_uc_load_id_context_id_submission_id_institution_id_date UNIQUE (load_id, context_id, submission_id, institution_id, date);


--
-- Name: metrics_counter_submission_institution_monthly msim_uc_context_id_submission_id_institution_id_month; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_uc_context_id_submission_id_institution_id_month UNIQUE (context_id, submission_id, institution_id, month);


--
-- Name: metrics_counter_submission_monthly msm_uc_context_id_submission_id_month; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT msm_uc_context_id_submission_id_month UNIQUE (context_id, submission_id, month);


--
-- Name: navigation_menu_item_assignment_settings navigation_menu_item_assignment_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_pkey PRIMARY KEY (navigation_menu_item_assignment_setting_id);


--
-- Name: navigation_menu_item_assignment_settings navigation_menu_item_assignment_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT navigation_menu_item_assignment_settings_unique UNIQUE (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_settings navigation_menu_item_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_pkey PRIMARY KEY (navigation_menu_item_setting_id);


--
-- Name: navigation_menu_item_settings navigation_menu_item_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_unique UNIQUE (navigation_menu_item_id, locale, setting_name);


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
-- Name: notification_settings notification_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_pkey PRIMARY KEY (notification_setting_id);


--
-- Name: notification_settings notification_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_unique UNIQUE (notification_id, locale, setting_name);


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
    ADD CONSTRAINT oai_resumption_tokens_pkey PRIMARY KEY (oai_resumption_token_id);


--
-- Name: oai_resumption_tokens oai_resumption_tokens_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.oai_resumption_tokens
    ADD CONSTRAINT oai_resumption_tokens_unique UNIQUE (token);


--
-- Name: plugin_settings plugin_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_pkey PRIMARY KEY (plugin_setting_id);


--
-- Name: plugin_settings plugin_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_unique UNIQUE (plugin_name, context_id, setting_name);


--
-- Name: publication_categories publication_categories_id; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_id UNIQUE (publication_id, category_id);


--
-- Name: publication_categories publication_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_pkey PRIMARY KEY (publication_category_id);


--
-- Name: publication_galley_settings publication_galley_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galley_settings
    ADD CONSTRAINT publication_galley_settings_pkey PRIMARY KEY (publication_galley_setting_id);


--
-- Name: publication_galley_settings publication_galley_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galley_settings
    ADD CONSTRAINT publication_galley_settings_unique UNIQUE (galley_id, locale, setting_name);


--
-- Name: publication_galleys publication_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: publication_settings publication_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_pkey PRIMARY KEY (publication_setting_id);


--
-- Name: publication_settings publication_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_unique UNIQUE (publication_id, locale, setting_name);


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
    ADD CONSTRAINT query_participants_pkey PRIMARY KEY (query_participant_id);


--
-- Name: query_participants query_participants_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_unique UNIQUE (query_id, user_id);


--
-- Name: review_assignments review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_files review_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_pkey PRIMARY KEY (review_file_id);


--
-- Name: review_files review_files_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_unique UNIQUE (review_id, submission_file_id);


--
-- Name: review_form_element_settings review_form_element_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_pkey PRIMARY KEY (review_form_element_setting_id);


--
-- Name: review_form_element_settings review_form_element_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_unique UNIQUE (review_form_element_id, locale, setting_name);


--
-- Name: review_form_elements review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_form_responses review_form_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_responses
    ADD CONSTRAINT review_form_responses_pkey PRIMARY KEY (review_form_response_id);


--
-- Name: review_form_settings review_form_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_pkey PRIMARY KEY (review_form_setting_id);


--
-- Name: review_form_settings review_form_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_unique UNIQUE (review_form_id, locale, setting_name);


--
-- Name: review_forms review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_round_files review_round_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_pkey PRIMARY KEY (review_round_file_id);


--
-- Name: review_round_files review_round_files_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_unique UNIQUE (submission_id, review_round_id, submission_file_id);


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
    ADD CONSTRAINT scheduled_tasks_pkey PRIMARY KEY (scheduled_task_id);


--
-- Name: scheduled_tasks scheduled_tasks_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.scheduled_tasks
    ADD CONSTRAINT scheduled_tasks_unique UNIQUE (class_name);


--
-- Name: subeditor_submission_group section_editors_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_unique UNIQUE (context_id, assoc_id, assoc_type, user_id, user_group_id);


--
-- Name: section_settings section_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.section_settings
    ADD CONSTRAINT section_settings_pkey PRIMARY KEY (section_setting_id);


--
-- Name: section_settings section_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.section_settings
    ADD CONSTRAINT section_settings_unique UNIQUE (section_id, locale, setting_name);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: server_settings server_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.server_settings
    ADD CONSTRAINT server_settings_pkey PRIMARY KEY (server_setting_id);


--
-- Name: server_settings server_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.server_settings
    ADD CONSTRAINT server_settings_unique UNIQUE (server_id, locale, setting_name);


--
-- Name: servers servers_path; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_path UNIQUE (path);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (server_id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey UNIQUE (session_id);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (site_id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (site_setting_id);


--
-- Name: site_settings site_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_unique UNIQUE (setting_name, locale);


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
-- Name: subeditor_submission_group subeditor_submission_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT subeditor_submission_group_pkey PRIMARY KEY (subeditor_submission_group_id);


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
    ADD CONSTRAINT submission_file_settings_pkey PRIMARY KEY (submission_file_setting_id);


--
-- Name: submission_file_settings submission_file_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_unique UNIQUE (submission_file_id, locale, setting_name);


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
    ADD CONSTRAINT submission_search_object_keywords_pkey PRIMARY KEY (submission_search_object_keyword_id);


--
-- Name: submission_search_object_keywords submission_search_object_keywords_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_unique UNIQUE (object_id, pos);


--
-- Name: submission_search_objects submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_settings submission_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_pkey PRIMARY KEY (submission_setting_id);


--
-- Name: submission_settings submission_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_unique UNIQUE (submission_id, locale, setting_name);


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
-- Name: usage_stats_institution_temporary_records usage_stats_institution_temporary_records_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_institution_temporary_records
    ADD CONSTRAINT usage_stats_institution_temporary_records_pkey PRIMARY KEY (usage_stats_temp_institution_id);


--
-- Name: usage_stats_total_temporary_records usage_stats_total_temporary_records_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT usage_stats_total_temporary_records_pkey PRIMARY KEY (usage_stats_temp_total_id);


--
-- Name: usage_stats_unique_item_investigations_temporary_records usage_stats_unique_item_investigations_temporary_records_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usage_stats_unique_item_investigations_temporary_records_pkey PRIMARY KEY (usage_stats_temp_unique_item_id);


--
-- Name: usage_stats_unique_item_requests_temporary_records usage_stats_unique_item_requests_temporary_records_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usage_stats_unique_item_requests_temporary_records_pkey PRIMARY KEY (usage_stats_temp_item_id);


--
-- Name: user_group_settings user_group_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_pkey PRIMARY KEY (user_group_setting_id);


--
-- Name: user_group_settings user_group_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_unique UNIQUE (user_group_id, locale, setting_name);


--
-- Name: user_group_stage user_group_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_pkey PRIMARY KEY (user_group_stage_id);


--
-- Name: user_group_stage user_group_stage_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_unique UNIQUE (context_id, user_group_id, stage_id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: user_interests user_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT user_interests_pkey PRIMARY KEY (user_interest_id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (user_setting_id);


--
-- Name: user_settings user_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_unique UNIQUE (user_id, locale, setting_name);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (user_user_group_id);


--
-- Name: user_user_groups user_user_groups_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_unique UNIQUE (user_group_id, user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: usage_stats_institution_temporary_records usitr_load_id_line_number_institution_id; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_institution_temporary_records
    ADD CONSTRAINT usitr_load_id_line_number_institution_id UNIQUE (load_id, line_number, institution_id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (version_id);


--
-- Name: versions versions_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_unique UNIQUE (product_type, product, major, minor, revision, build);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX access_keys_hash ON public.access_keys USING btree (key_hash, user_id, context);


--
-- Name: access_keys_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX access_keys_user_id ON public.access_keys USING btree (user_id);


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
-- Name: announcements_type_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX announcements_type_id ON public.announcements USING btree (type_id);


--
-- Name: author_settings_author_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX author_settings_author_id ON public.author_settings USING btree (author_id);


--
-- Name: authors_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX authors_user_group_id ON public.authors USING btree (user_group_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX c_v_e_s_entry_id ON public.controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: category_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX category_context_id ON public.categories USING btree (context_id);


--
-- Name: category_context_parent_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX category_context_parent_id ON public.categories USING btree (context_id, parent_id);


--
-- Name: category_parent_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX category_parent_id ON public.categories USING btree (parent_id);


--
-- Name: category_settings_category_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX category_settings_category_id ON public.category_settings USING btree (category_id);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX citation_settings_citation_id ON public.citation_settings USING btree (citation_id);


--
-- Name: citations_publication; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX citations_publication ON public.citations USING btree (publication_id);


--
-- Name: controlled_vocab_entries_controlled_vocab_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX controlled_vocab_entries_controlled_vocab_id ON public.controlled_vocab_entries USING btree (controlled_vocab_id);


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
-- Name: dois_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX dois_context_id ON public.dois USING btree (context_id);


--
-- Name: edit_decisions_editor_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX edit_decisions_editor_id ON public.edit_decisions USING btree (editor_id);


--
-- Name: edit_decisions_review_round_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX edit_decisions_review_round_id ON public.edit_decisions USING btree (review_round_id);


--
-- Name: edit_decisions_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX edit_decisions_submission_id ON public.edit_decisions USING btree (submission_id);


--
-- Name: email_log_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_log_assoc ON public.email_log USING btree (assoc_type, assoc_id);


--
-- Name: email_log_users_email_log_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_log_users_email_log_id ON public.email_log_users USING btree (email_log_id);


--
-- Name: email_log_users_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_log_users_user_id ON public.email_log_users USING btree (user_id);


--
-- Name: email_templates_alternate_to; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_templates_alternate_to ON public.email_templates USING btree (alternate_to);


--
-- Name: email_templates_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_templates_context_id ON public.email_templates USING btree (context_id);


--
-- Name: email_templates_settings_email_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_templates_settings_email_id ON public.email_templates_settings USING btree (email_id);


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
-- Name: event_log_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX event_log_user_id ON public.event_log USING btree (user_id);


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filter_settings_id ON public.filter_settings USING btree (filter_id);


--
-- Name: filters_filter_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filters_filter_group_id ON public.filters USING btree (filter_group_id);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX genre_settings_genre_id ON public.genre_settings USING btree (genre_id);


--
-- Name: genres_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX genres_context_id ON public.genres USING btree (context_id);


--
-- Name: institution_ip_end; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX institution_ip_end ON public.institution_ip USING btree (ip_end);


--
-- Name: institution_ip_institution_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX institution_ip_institution_id ON public.institution_ip USING btree (institution_id);


--
-- Name: institution_ip_start; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX institution_ip_start ON public.institution_ip USING btree (ip_start);


--
-- Name: institution_settings_institution_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX institution_settings_institution_id ON public.institution_settings USING btree (institution_id);


--
-- Name: institutions_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX institutions_context_id ON public.institutions USING btree (context_id);


--
-- Name: jobs_queue_reserved_at_index; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX jobs_queue_reserved_at_index ON public.jobs USING btree (queue, reserved_at);


--
-- Name: library_file_settings_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_file_settings_file_id ON public.library_file_settings USING btree (file_id);


--
-- Name: library_files_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_files_context_id ON public.library_files USING btree (context_id);


--
-- Name: library_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX library_files_submission_id ON public.library_files USING btree (submission_id);


--
-- Name: metrics_context_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_context_context_id ON public.metrics_context USING btree (context_id);


--
-- Name: metrics_context_load_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_context_load_id ON public.metrics_context USING btree (load_id);


--
-- Name: metrics_counter_submission_daily_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_counter_submission_daily_context_id ON public.metrics_counter_submission_daily USING btree (context_id);


--
-- Name: metrics_counter_submission_daily_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_counter_submission_daily_submission_id ON public.metrics_counter_submission_daily USING btree (submission_id);


--
-- Name: metrics_counter_submission_monthly_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_counter_submission_monthly_context_id ON public.metrics_counter_submission_monthly USING btree (context_id);


--
-- Name: metrics_counter_submission_monthly_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_counter_submission_monthly_submission_id ON public.metrics_counter_submission_monthly USING btree (submission_id);


--
-- Name: metrics_submission_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_submission_context_id ON public.metrics_submission USING btree (context_id);


--
-- Name: metrics_submission_representation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_submission_representation_id ON public.metrics_submission USING btree (representation_id);


--
-- Name: metrics_submission_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_submission_submission_file_id ON public.metrics_submission USING btree (submission_file_id);


--
-- Name: metrics_submission_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX metrics_submission_submission_id ON public.metrics_submission USING btree (submission_id);


--
-- Name: ms_context_id_submission_id_assoc_type_file_type; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ms_context_id_submission_id_assoc_type_file_type ON public.metrics_submission USING btree (context_id, submission_id, assoc_type, file_type);


--
-- Name: ms_load_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ms_load_id ON public.metrics_submission USING btree (load_id);


--
-- Name: msd_context_id_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msd_context_id_submission_id ON public.metrics_counter_submission_daily USING btree (context_id, submission_id);


--
-- Name: msd_load_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msd_load_id ON public.metrics_counter_submission_daily USING btree (load_id);


--
-- Name: msgd_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgd_context_id ON public.metrics_submission_geo_daily USING btree (context_id);


--
-- Name: msgd_context_id_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgd_context_id_submission_id ON public.metrics_submission_geo_daily USING btree (context_id, submission_id);


--
-- Name: msgd_load_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgd_load_id ON public.metrics_submission_geo_daily USING btree (load_id);


--
-- Name: msgd_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgd_submission_id ON public.metrics_submission_geo_daily USING btree (submission_id);


--
-- Name: msgm_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgm_context_id ON public.metrics_submission_geo_monthly USING btree (context_id);


--
-- Name: msgm_context_id_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgm_context_id_submission_id ON public.metrics_submission_geo_monthly USING btree (context_id, submission_id);


--
-- Name: msgm_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msgm_submission_id ON public.metrics_submission_geo_monthly USING btree (submission_id);


--
-- Name: msid_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msid_context_id ON public.metrics_counter_submission_institution_daily USING btree (context_id);


--
-- Name: msid_context_id_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msid_context_id_submission_id ON public.metrics_counter_submission_institution_daily USING btree (context_id, submission_id);


--
-- Name: msid_institution_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msid_institution_id ON public.metrics_counter_submission_institution_daily USING btree (institution_id);


--
-- Name: msid_load_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msid_load_id ON public.metrics_counter_submission_institution_daily USING btree (load_id);


--
-- Name: msid_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msid_submission_id ON public.metrics_counter_submission_institution_daily USING btree (submission_id);


--
-- Name: msim_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msim_context_id ON public.metrics_counter_submission_institution_monthly USING btree (context_id);


--
-- Name: msim_context_id_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msim_context_id_submission_id ON public.metrics_counter_submission_institution_monthly USING btree (context_id, submission_id);


--
-- Name: msim_institution_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msim_institution_id ON public.metrics_counter_submission_institution_monthly USING btree (institution_id);


--
-- Name: msim_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msim_submission_id ON public.metrics_counter_submission_institution_monthly USING btree (submission_id);


--
-- Name: msm_context_id_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX msm_context_id_submission_id ON public.metrics_counter_submission_monthly USING btree (context_id, submission_id);


--
-- Name: navigation_menu_item_assignment_settings_n_m_i_a_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_assignment_settings_n_m_i_a_id ON public.navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_item_assignments_navigation_menu_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_assignments_navigation_menu_id ON public.navigation_menu_item_assignments USING btree (navigation_menu_id);


--
-- Name: navigation_menu_item_assignments_navigation_menu_item_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_assignments_navigation_menu_item_id ON public.navigation_menu_item_assignments USING btree (navigation_menu_item_id);


--
-- Name: navigation_menu_item_settings_navigation_menu_item_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_item_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notes_assoc ON public.notes USING btree (assoc_type, assoc_id);


--
-- Name: notes_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notes_user_id ON public.notes USING btree (user_id);


--
-- Name: notification_settings_notification_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notification_settings_notification_id ON public.notification_settings USING btree (notification_id);


--
-- Name: notification_subscription_settings_context; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notification_subscription_settings_context ON public.notification_subscription_settings USING btree (context);


--
-- Name: notification_subscription_settings_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notification_subscription_settings_user_id ON public.notification_subscription_settings USING btree (user_id);


--
-- Name: notifications_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_assoc ON public.notifications USING btree (assoc_type, assoc_id);


--
-- Name: notifications_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_context_id ON public.notifications USING btree (context_id);


--
-- Name: notifications_context_id_level; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_context_id_level ON public.notifications USING btree (context_id, level);


--
-- Name: notifications_context_id_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_context_id_user_id ON public.notifications USING btree (context_id, user_id, level);


--
-- Name: notifications_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_user_id ON public.notifications USING btree (user_id);


--
-- Name: notifications_user_id_level; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX notifications_user_id_level ON public.notifications USING btree (user_id, level);


--
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX plugin_settings_plugin_name ON public.plugin_settings USING btree (plugin_name);


--
-- Name: publication_categories_category_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_categories_category_id ON public.publication_categories USING btree (category_id);


--
-- Name: publication_categories_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_categories_publication_id ON public.publication_categories USING btree (publication_id);


--
-- Name: publication_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galley_settings_galley_id ON public.publication_galley_settings USING btree (galley_id);


--
-- Name: publication_galley_settings_name_value; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galley_settings_name_value ON public.publication_galley_settings USING btree (setting_name, setting_value);


--
-- Name: publication_galleys_doi_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_doi_id ON public.publication_galleys USING btree (doi_id);


--
-- Name: publication_galleys_publication_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_publication_id ON public.publication_galleys USING btree (publication_id);


--
-- Name: publication_galleys_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_submission_file_id ON public.publication_galleys USING btree (submission_file_id);


--
-- Name: publication_galleys_url_path; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_galleys_url_path ON public.publication_galleys USING btree (url_path);


--
-- Name: publication_settings_name_value; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publication_settings_name_value ON public.publication_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['indexingState'::character varying, 'medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying, 'pub-id::publisher-id'::character varying])::text[]));


--
-- Name: publications_author_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publications_author_id ON public.publications USING btree (primary_contact_id);


--
-- Name: publications_doi_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX publications_doi_id ON public.publications USING btree (doi_id);


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
-- Name: query_participants_query_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX query_participants_query_id ON public.query_participants USING btree (query_id);


--
-- Name: query_participants_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX query_participants_user_id ON public.query_participants USING btree (user_id);


--
-- Name: review_assignment_reviewer_round; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_assignment_reviewer_round ON public.review_assignments USING btree (review_round_id, reviewer_id);


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
-- Name: review_files_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_files_submission_file_id ON public.review_files USING btree (submission_file_id);


--
-- Name: review_form_element_settings_review_form_element_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_element_settings_review_form_element_id ON public.review_form_element_settings USING btree (review_form_element_id);


--
-- Name: review_form_elements_review_form_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_elements_review_form_id ON public.review_form_elements USING btree (review_form_id);


--
-- Name: review_form_responses_review_form_element_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_responses_review_form_element_id ON public.review_form_responses USING btree (review_form_element_id);


--
-- Name: review_form_responses_review_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_responses_review_id ON public.review_form_responses USING btree (review_id);


--
-- Name: review_form_responses_unique; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_responses_unique ON public.review_form_responses USING btree (review_form_element_id, review_id);


--
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_form_settings_review_form_id ON public.review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_review_round_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_round_files_review_round_id ON public.review_round_files USING btree (review_round_id);


--
-- Name: review_round_files_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_round_files_submission_file_id ON public.review_round_files USING btree (submission_file_id);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_round_files_submission_id ON public.review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX review_rounds_submission_id ON public.review_rounds USING btree (submission_id);


--
-- Name: section_settings_section_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX section_settings_section_id ON public.section_settings USING btree (section_id);


--
-- Name: sections_review_form_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sections_review_form_id ON public.sections USING btree (review_form_id);


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
-- Name: subeditor_submission_group_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX subeditor_submission_group_context_id ON public.subeditor_submission_group USING btree (context_id);


--
-- Name: subeditor_submission_group_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX subeditor_submission_group_user_group_id ON public.subeditor_submission_group USING btree (user_group_id);


--
-- Name: subeditor_submission_group_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX subeditor_submission_group_user_id ON public.subeditor_submission_group USING btree (user_id);


--
-- Name: submission_comments_author_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_comments_author_id ON public.submission_comments USING btree (author_id);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_comments_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: submission_file_revisions_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_file_revisions_file_id ON public.submission_file_revisions USING btree (file_id);


--
-- Name: submission_file_revisions_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_file_revisions_submission_file_id ON public.submission_file_revisions USING btree (submission_file_id);


--
-- Name: submission_file_settings_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_file_settings_submission_file_id ON public.submission_file_settings USING btree (submission_file_id);


--
-- Name: submission_files_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_file_id ON public.submission_files USING btree (file_id);


--
-- Name: submission_files_genre_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_genre_id ON public.submission_files USING btree (genre_id);


--
-- Name: submission_files_source_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_source_submission_file_id ON public.submission_files USING btree (source_submission_file_id);


--
-- Name: submission_files_stage_assoc; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_stage_assoc ON public.submission_files USING btree (file_stage, assoc_type, assoc_id);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: submission_files_uploader_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_files_uploader_user_id ON public.submission_files USING btree (uploader_user_id);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_object_keywords_keyword_id ON public.submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_keywords_object_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_object_keywords_object_id ON public.submission_search_object_keywords USING btree (object_id);


--
-- Name: submission_search_objects_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_search_objects_submission_id ON public.submission_search_objects USING btree (submission_id);


--
-- Name: submission_settings_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submission_settings_submission_id ON public.submission_settings USING btree (submission_id);


--
-- Name: submissions_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX submissions_context_id ON public.submissions USING btree (context_id);


--
-- Name: temporary_files_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX temporary_files_user_id ON public.temporary_files USING btree (user_id);


--
-- Name: user_group_settings_user_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_group_settings_user_group_id ON public.user_group_settings USING btree (user_group_id);


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
-- Name: user_interests_controlled_vocab_entry_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_interests_controlled_vocab_entry_id ON public.user_interests USING btree (controlled_vocab_entry_id);


--
-- Name: user_interests_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX user_interests_user_id ON public.user_interests USING btree (user_id);


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
-- Name: users_email; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX users_email ON public.users USING btree (lower((email)::text));


--
-- Name: users_username; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE UNIQUE INDEX users_username ON public.users USING btree (lower((username)::text));


--
-- Name: usi_institution_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usi_institution_id ON public.usage_stats_institution_temporary_records USING btree (institution_id);


--
-- Name: usii_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usii_context_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (context_id);


--
-- Name: usii_load_id_context_id_ip_ua; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usii_load_id_context_id_ip_ua ON public.usage_stats_unique_item_investigations_temporary_records USING btree (load_id, context_id, ip, user_agent);


--
-- Name: usii_representation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usii_representation_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (representation_id);


--
-- Name: usii_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usii_submission_file_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (submission_file_id);


--
-- Name: usii_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usii_submission_id ON public.usage_stats_unique_item_investigations_temporary_records USING btree (submission_id);


--
-- Name: usir_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usir_context_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (context_id);


--
-- Name: usir_load_id_context_id_ip_ua; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usir_load_id_context_id_ip_ua ON public.usage_stats_unique_item_requests_temporary_records USING btree (load_id, context_id, ip, user_agent);


--
-- Name: usir_representation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usir_representation_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (representation_id);


--
-- Name: usir_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usir_submission_file_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (submission_file_id);


--
-- Name: usir_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usir_submission_id ON public.usage_stats_unique_item_requests_temporary_records USING btree (submission_id);


--
-- Name: ust_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ust_context_id ON public.usage_stats_total_temporary_records USING btree (context_id);


--
-- Name: ust_load_id_context_id_ip_ua_url; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ust_load_id_context_id_ip_ua_url ON public.usage_stats_total_temporary_records USING btree (load_id, context_id, ip, user_agent, canonical_url);


--
-- Name: ust_representation_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ust_representation_id ON public.usage_stats_total_temporary_records USING btree (representation_id);


--
-- Name: ust_submission_file_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ust_submission_file_id ON public.usage_stats_total_temporary_records USING btree (submission_file_id);


--
-- Name: ust_submission_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ust_submission_id ON public.usage_stats_total_temporary_records USING btree (submission_id);


--
-- Name: access_keys access_keys_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.access_keys
    ADD CONSTRAINT access_keys_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: announcement_settings announcement_settings_announcement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_settings
    ADD CONSTRAINT announcement_settings_announcement_id_foreign FOREIGN KEY (announcement_id) REFERENCES public.announcements(announcement_id) ON DELETE CASCADE;


--
-- Name: announcement_type_settings announcement_type_settings_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_type_settings
    ADD CONSTRAINT announcement_type_settings_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id) ON DELETE CASCADE;


--
-- Name: announcement_types announcement_types_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcement_types
    ADD CONSTRAINT announcement_types_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: announcements announcements_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.announcement_types(type_id) ON DELETE SET NULL;


--
-- Name: navigation_menu_item_assignment_settings assignment_settings_navigation_menu_item_assignment_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignment_settings
    ADD CONSTRAINT assignment_settings_navigation_menu_item_assignment_id FOREIGN KEY (navigation_menu_item_assignment_id) REFERENCES public.navigation_menu_item_assignments(navigation_menu_item_assignment_id) ON DELETE CASCADE;


--
-- Name: author_settings author_settings_author_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.author_settings
    ADD CONSTRAINT author_settings_author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id) ON DELETE CASCADE;


--
-- Name: authors authors_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_publication_id FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: authors authors_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: controlled_vocab_entry_settings c_v_e_s_entry_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entry_settings
    ADD CONSTRAINT c_v_e_s_entry_id FOREIGN KEY (controlled_vocab_entry_id) REFERENCES public.controlled_vocab_entries(controlled_vocab_entry_id) ON DELETE CASCADE;


--
-- Name: categories categories_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.categories(category_id) ON DELETE SET NULL;


--
-- Name: category_settings category_settings_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.category_settings
    ADD CONSTRAINT category_settings_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;


--
-- Name: citation_settings citation_settings_citation_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citation_settings
    ADD CONSTRAINT citation_settings_citation_id FOREIGN KEY (citation_id) REFERENCES public.citations(citation_id) ON DELETE CASCADE;


--
-- Name: citations citations_publication; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_publication FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: controlled_vocab_entries controlled_vocab_entries_controlled_vocab_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_controlled_vocab_id_foreign FOREIGN KEY (controlled_vocab_id) REFERENCES public.controlled_vocabs(controlled_vocab_id) ON DELETE CASCADE;


--
-- Name: data_object_tombstone_oai_set_objects data_object_tombstone_oai_set_objects_tombstone_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_tombstone_id FOREIGN KEY (tombstone_id) REFERENCES public.data_object_tombstones(tombstone_id) ON DELETE CASCADE;


--
-- Name: data_object_tombstone_settings data_object_tombstone_settings_tombstone_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.data_object_tombstone_settings
    ADD CONSTRAINT data_object_tombstone_settings_tombstone_id FOREIGN KEY (tombstone_id) REFERENCES public.data_object_tombstones(tombstone_id) ON DELETE CASCADE;


--
-- Name: doi_settings doi_settings_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.doi_settings
    ADD CONSTRAINT doi_settings_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE CASCADE;


--
-- Name: dois dois_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.dois
    ADD CONSTRAINT dois_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: edit_decisions edit_decisions_editor_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_editor_id FOREIGN KEY (editor_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: edit_decisions edit_decisions_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id) ON DELETE CASCADE;


--
-- Name: edit_decisions edit_decisions_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.edit_decisions
    ADD CONSTRAINT edit_decisions_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: email_log_users email_log_users_email_log_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_users_email_log_id_foreign FOREIGN KEY (email_log_id) REFERENCES public.email_log(log_id) ON DELETE CASCADE;


--
-- Name: email_log_users email_log_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log_users
    ADD CONSTRAINT email_log_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: email_templates email_templates_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: email_templates_settings email_templates_settings_email_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_templates_settings
    ADD CONSTRAINT email_templates_settings_email_id FOREIGN KEY (email_id) REFERENCES public.email_templates(email_id) ON DELETE CASCADE;


--
-- Name: event_log_settings event_log_settings_log_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log_settings
    ADD CONSTRAINT event_log_settings_log_id FOREIGN KEY (log_id) REFERENCES public.event_log(log_id) ON DELETE CASCADE;


--
-- Name: event_log event_log_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.event_log
    ADD CONSTRAINT event_log_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: filter_settings filter_settings_filter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filter_settings
    ADD CONSTRAINT filter_settings_filter_id_foreign FOREIGN KEY (filter_id) REFERENCES public.filters(filter_id) ON DELETE CASCADE;


--
-- Name: filters filters_filter_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_filter_group_id_foreign FOREIGN KEY (filter_group_id) REFERENCES public.filter_groups(filter_group_id) ON DELETE CASCADE;


--
-- Name: genre_settings genre_settings_genre_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genre_settings
    ADD CONSTRAINT genre_settings_genre_id_foreign FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id) ON DELETE CASCADE;


--
-- Name: genres genres_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: institution_ip institution_ip_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_ip
    ADD CONSTRAINT institution_ip_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: institution_settings institution_settings_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institution_settings
    ADD CONSTRAINT institution_settings_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: institutions institutions_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: library_file_settings library_file_settings_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_file_settings
    ADD CONSTRAINT library_file_settings_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.library_files(file_id) ON DELETE CASCADE;


--
-- Name: library_files library_files_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: library_files library_files_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT library_files_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_context metrics_context_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_context
    ADD CONSTRAINT metrics_context_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_submission metrics_submission_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_submission metrics_submission_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_galleys(galley_id) ON DELETE CASCADE;


--
-- Name: metrics_submission metrics_submission_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: metrics_submission metrics_submission_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission
    ADD CONSTRAINT metrics_submission_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_daily msd_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT msd_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_daily msd_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_daily
    ADD CONSTRAINT msd_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_geo_daily msgd_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT msgd_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_geo_daily msgd_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_daily
    ADD CONSTRAINT msgd_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_geo_monthly msgm_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT msgm_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_submission_geo_monthly msgm_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_submission_geo_monthly
    ADD CONSTRAINT msgm_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_institution_daily msid_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_institution_daily msid_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_institution_daily msid_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_daily
    ADD CONSTRAINT msid_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_institution_monthly msim_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_institution_monthly msim_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_institution_monthly msim_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_institution_monthly
    ADD CONSTRAINT msim_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_monthly msm_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT msm_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: metrics_counter_submission_monthly msm_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.metrics_counter_submission_monthly
    ADD CONSTRAINT msm_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_navigation_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_navigation_menu_id_foreign FOREIGN KEY (navigation_menu_id) REFERENCES public.navigation_menus(navigation_menu_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_navigation_menu_item_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_navigation_menu_item_id_foreig FOREIGN KEY (navigation_menu_item_id) REFERENCES public.navigation_menu_items(navigation_menu_item_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_settings navigation_menu_item_settings_navigation_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_navigation_menu_id FOREIGN KEY (navigation_menu_item_id) REFERENCES public.navigation_menu_items(navigation_menu_item_id) ON DELETE CASCADE;


--
-- Name: notes notes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: notification_settings notification_settings_notification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_settings
    ADD CONSTRAINT notification_settings_notification_id_foreign FOREIGN KEY (notification_id) REFERENCES public.notifications(notification_id) ON DELETE CASCADE;


--
-- Name: notification_subscription_settings notification_subscription_settings_context_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_context_foreign FOREIGN KEY (context) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: notification_subscription_settings notification_subscription_settings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: notifications notifications_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: publication_categories publication_categories_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;


--
-- Name: publication_categories publication_categories_publication_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_categories
    ADD CONSTRAINT publication_categories_publication_id_foreign FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: publication_galley_settings publication_galley_settings_galley_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galley_settings
    ADD CONSTRAINT publication_galley_settings_galley_id_foreign FOREIGN KEY (galley_id) REFERENCES public.publication_galleys(galley_id);


--
-- Name: publication_galleys publication_galleys_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: publication_galleys publication_galleys_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_publication_id FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: publication_galleys publication_galleys_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_galleys
    ADD CONSTRAINT publication_galleys_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE SET NULL;


--
-- Name: publication_settings publication_settings_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publication_settings
    ADD CONSTRAINT publication_settings_publication_id FOREIGN KEY (publication_id) REFERENCES public.publications(publication_id) ON DELETE CASCADE;


--
-- Name: publications publications_author_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_author_id FOREIGN KEY (primary_contact_id) REFERENCES public.authors(author_id) ON DELETE SET NULL;


--
-- Name: publications publications_doi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_doi_id_foreign FOREIGN KEY (doi_id) REFERENCES public.dois(doi_id) ON DELETE SET NULL;


--
-- Name: publications publications_section_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_section_id_foreign FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;


--
-- Name: publications publications_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: query_participants query_participants_query_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_query_id_foreign FOREIGN KEY (query_id) REFERENCES public.queries(query_id) ON DELETE CASCADE;


--
-- Name: query_participants query_participants_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.query_participants
    ADD CONSTRAINT query_participants_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: review_assignments review_assignments_review_form_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_review_form_id_foreign FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id);


--
-- Name: review_assignments review_assignments_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id);


--
-- Name: review_assignments review_assignments_reviewer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_reviewer_id_foreign FOREIGN KEY (reviewer_id) REFERENCES public.users(user_id);


--
-- Name: review_assignments review_assignments_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_assignments
    ADD CONSTRAINT review_assignments_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id);


--
-- Name: review_files review_files_review_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_review_id_foreign FOREIGN KEY (review_id) REFERENCES public.review_assignments(review_id) ON DELETE CASCADE;


--
-- Name: review_files review_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_files
    ADD CONSTRAINT review_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: review_form_element_settings review_form_element_settings_review_form_element_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_element_settings
    ADD CONSTRAINT review_form_element_settings_review_form_element_id FOREIGN KEY (review_form_element_id) REFERENCES public.review_form_elements(review_form_element_id) ON DELETE CASCADE;


--
-- Name: review_form_elements review_form_elements_review_form_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_elements
    ADD CONSTRAINT review_form_elements_review_form_id FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id) ON DELETE CASCADE;


--
-- Name: review_form_responses review_form_responses_review_form_element_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_responses
    ADD CONSTRAINT review_form_responses_review_form_element_id_foreign FOREIGN KEY (review_form_element_id) REFERENCES public.review_form_elements(review_form_element_id) ON DELETE CASCADE;


--
-- Name: review_form_responses review_form_responses_review_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_responses
    ADD CONSTRAINT review_form_responses_review_id_foreign FOREIGN KEY (review_id) REFERENCES public.review_assignments(review_id) ON DELETE CASCADE;


--
-- Name: review_form_settings review_form_settings_review_form_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_form_settings
    ADD CONSTRAINT review_form_settings_review_form_id FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id) ON DELETE CASCADE;


--
-- Name: review_round_files review_round_files_review_round_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_review_round_id_foreign FOREIGN KEY (review_round_id) REFERENCES public.review_rounds(review_round_id) ON DELETE CASCADE;


--
-- Name: review_round_files review_round_files_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: review_round_files review_round_files_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_round_files
    ADD CONSTRAINT review_round_files_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: review_rounds review_rounds_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.review_rounds
    ADD CONSTRAINT review_rounds_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id);


--
-- Name: subeditor_submission_group section_editors_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT section_editors_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: section_settings section_settings_section_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.section_settings
    ADD CONSTRAINT section_settings_section_id_foreign FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE CASCADE;


--
-- Name: sections sections_review_form_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_review_form_id_foreign FOREIGN KEY (review_form_id) REFERENCES public.review_forms(review_form_id) ON DELETE SET NULL;


--
-- Name: sections sections_server_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_server_id_foreign FOREIGN KEY (server_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: server_settings server_settings_server_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.server_settings
    ADD CONSTRAINT server_settings_server_id FOREIGN KEY (server_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: stage_assignments stage_assignments_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: stage_assignments stage_assignments_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_user_group_id FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: stage_assignments stage_assignments_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.stage_assignments
    ADD CONSTRAINT stage_assignments_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: subeditor_submission_group subeditor_submission_group_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT subeditor_submission_group_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: subeditor_submission_group subeditor_submission_group_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.subeditor_submission_group
    ADD CONSTRAINT subeditor_submission_group_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: submission_comments submission_comments_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_author_id_foreign FOREIGN KEY (author_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: submission_comments submission_comments_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submission_file_revisions submission_file_revisions_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON DELETE CASCADE;


--
-- Name: submission_file_revisions submission_file_revisions_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_revisions
    ADD CONSTRAINT submission_file_revisions_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: submission_file_settings submission_file_settings_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_file_settings
    ADD CONSTRAINT submission_file_settings_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: submission_files submission_files_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(file_id) ON DELETE CASCADE;


--
-- Name: submission_files submission_files_genre_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_genre_id_foreign FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id) ON DELETE SET NULL;


--
-- Name: submission_files submission_files_source_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_source_submission_file_id_foreign FOREIGN KEY (source_submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: submission_files submission_files_submission_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_submission_id FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submission_files submission_files_uploader_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_uploader_user_id_foreign FOREIGN KEY (uploader_user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- Name: submission_search_object_keywords submission_search_object_keywords_keyword_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_keyword_id FOREIGN KEY (keyword_id) REFERENCES public.submission_search_keyword_list(keyword_id) ON DELETE CASCADE;


--
-- Name: submission_search_object_keywords submission_search_object_keywords_object_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_object_keywords
    ADD CONSTRAINT submission_search_object_keywords_object_id_foreign FOREIGN KEY (object_id) REFERENCES public.submission_search_objects(object_id) ON DELETE CASCADE;


--
-- Name: submission_search_objects submission_search_object_submission; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_search_objects
    ADD CONSTRAINT submission_search_object_submission FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submission_settings submission_settings_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submission_settings
    ADD CONSTRAINT submission_settings_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: submissions submissions_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: submissions submissions_current_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_current_publication_id FOREIGN KEY (current_publication_id) REFERENCES public.publications(publication_id) ON DELETE SET NULL;


--
-- Name: temporary_files temporary_files_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.temporary_files
    ADD CONSTRAINT temporary_files_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_group_settings user_group_settings_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_settings
    ADD CONSTRAINT user_group_settings_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: user_group_stage user_group_stage_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: user_group_stage user_group_stage_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_group_stage
    ADD CONSTRAINT user_group_stage_user_group_id FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: user_interests user_interests_controlled_vocab_entry_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT user_interests_controlled_vocab_entry_id_foreign FOREIGN KEY (controlled_vocab_entry_id) REFERENCES public.controlled_vocab_entries(controlled_vocab_entry_id) ON DELETE CASCADE;


--
-- Name: user_interests user_interests_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT user_interests_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_settings user_settings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: user_user_groups user_user_groups_user_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_group_id_foreign FOREIGN KEY (user_group_id) REFERENCES public.user_groups(user_group_id) ON DELETE CASCADE;


--
-- Name: user_user_groups user_user_groups_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: usage_stats_institution_temporary_records usi_institution_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_institution_temporary_records
    ADD CONSTRAINT usi_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES public.institutions(institution_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_investigations_temporary_records usii_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_investigations_temporary_records usii_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_galleys(galley_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_investigations_temporary_records usii_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_investigations_temporary_records usii_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_investigations_temporary_records
    ADD CONSTRAINT usii_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_requests_temporary_records usir_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_requests_temporary_records usir_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_galleys(galley_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_requests_temporary_records usir_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: usage_stats_unique_item_requests_temporary_records usir_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_unique_item_requests_temporary_records
    ADD CONSTRAINT usir_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- Name: usage_stats_total_temporary_records ust_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: usage_stats_total_temporary_records ust_representation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_representation_id_foreign FOREIGN KEY (representation_id) REFERENCES public.publication_galleys(galley_id) ON DELETE CASCADE;


--
-- Name: usage_stats_total_temporary_records ust_submission_file_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_submission_file_id_foreign FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(submission_file_id) ON DELETE CASCADE;


--
-- Name: usage_stats_total_temporary_records ust_submission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.usage_stats_total_temporary_records
    ADD CONSTRAINT ust_submission_id_foreign FOREIGN KEY (submission_id) REFERENCES public.submissions(submission_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict psTP9uhR6VWIwc96dIm1yh9ai2mWuoVEJUf1rRx4a2wpKPS9bb2lIIGkqcESwEu

