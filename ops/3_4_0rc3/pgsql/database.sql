--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10 (Ubuntu 13.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.10 (Ubuntu 13.10-1.pgdg20.04+1)

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
DROP INDEX public.ust_context_id;
DROP INDEX public.usir_submission_id;
DROP INDEX public.usir_submission_file_id;
DROP INDEX public.usir_representation_id;
DROP INDEX public.usir_context_id;
DROP INDEX public.usii_submission_id;
DROP INDEX public.usii_submission_file_id;
DROP INDEX public.usii_representation_id;
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


ALTER TABLE public.access_keys_access_key_id_seq OWNER TO "ops-ci";

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
    setting_value text,
    setting_type character varying(6)
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


ALTER TABLE public.announcement_settings_announcement_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.announcement_type_settings_announcement_type_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.announcements_announcement_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.author_settings_author_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.categories_category_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.category_settings_category_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.citation_settings_citation_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.controlled_vocab_entry_settin_controlled_vocab_entry_settin_seq OWNER TO "ops-ci";

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


ALTER TABLE public.data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.data_object_tombstone_settings_tombstone_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.data_object_tombstones_tombstone_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.doi_settings_doi_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.email_log_log_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.email_log_users_email_log_user_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.email_templates_default_data_email_templates_default_data_i_seq OWNER TO "ops-ci";

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


ALTER TABLE public.email_templates_email_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.email_templates_settings_email_template_setting_id_seq OWNER TO "ops-ci";

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
    user_id bigint NOT NULL,
    date_logged timestamp(0) without time zone NOT NULL,
    event_type bigint,
    message text,
    is_translated smallint
);


ALTER TABLE public.event_log OWNER TO "ops-ci";

--
-- Name: TABLE event_log; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.event_log IS 'A log of all events related to an object like a submission.';


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
    event_log_setting_id bigint NOT NULL,
    log_id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE public.event_log_settings OWNER TO "ops-ci";

--
-- Name: TABLE event_log_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.event_log_settings IS 'Data about an event log entry. This data is commonly used to display information about an event to a user.';


--
-- Name: COLUMN event_log_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.event_log_settings.setting_type IS '(bool|int|float|string|object)';


--
-- Name: event_log_settings_event_log_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.event_log_settings_event_log_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_log_settings_event_log_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.filter_groups_filter_group_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.filter_settings_filter_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.filters_filter_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.genre_settings_genre_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.genres_genre_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.institution_ip_institution_ip_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.institution_settings_institution_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.institutions_institution_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.jobs_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.library_file_settings_library_file_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.library_files_file_id_seq OWNER TO "ops-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.library_files_file_id_seq OWNED BY public.library_files.file_id;


--
-- Name: metrics_context; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_context (
    metrics_context_id bigint NOT NULL,
    load_id character varying(255) NOT NULL,
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


ALTER TABLE public.metrics_context_metrics_context_id_seq OWNER TO "ops-ci";

--
-- Name: metrics_context_metrics_context_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_context_metrics_context_id_seq OWNED BY public.metrics_context.metrics_context_id;


--
-- Name: metrics_counter_submission_daily; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_counter_submission_daily (
    metrics_counter_submission_daily_id bigint NOT NULL,
    load_id character varying(255) NOT NULL,
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


ALTER TABLE public.metrics_counter_submission_da_metrics_counter_submission_da_seq OWNER TO "ops-ci";

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


ALTER TABLE public.metrics_counter_submission_in_metrics_counter_submission_i_seq1 OWNER TO "ops-ci";

--
-- Name: metrics_counter_submission_in_metrics_counter_submission_i_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_counter_submission_in_metrics_counter_submission_i_seq1 OWNED BY public.metrics_counter_submission_institution_monthly.metrics_counter_submission_institution_monthly_id;


--
-- Name: metrics_counter_submission_institution_daily; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_counter_submission_institution_daily (
    metrics_counter_submission_institution_daily_id bigint NOT NULL,
    load_id character varying(255) NOT NULL,
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


ALTER TABLE public.metrics_counter_submission_in_metrics_counter_submission_in_seq OWNER TO "ops-ci";

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


ALTER TABLE public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq OWNER TO "ops-ci";

--
-- Name: metrics_counter_submission_mo_metrics_counter_submission_mo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.metrics_counter_submission_mo_metrics_counter_submission_mo_seq OWNED BY public.metrics_counter_submission_monthly.metrics_counter_submission_monthly_id;


--
-- Name: metrics_submission; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.metrics_submission (
    metrics_submission_id bigint NOT NULL,
    load_id character varying(255) NOT NULL,
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


ALTER TABLE public.metrics_submission_geo_daily_metrics_submission_geo_daily_i_seq OWNER TO "ops-ci";

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


ALTER TABLE public.metrics_submission_geo_monthl_metrics_submission_geo_monthl_seq OWNER TO "ops-ci";

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


ALTER TABLE public.metrics_submission_metrics_submission_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.navigation_menu_item_assignme_navigation_menu_item_assignm_seq1 OWNER TO "ops-ci";

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


ALTER TABLE public.navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "ops-ci";

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


ALTER TABLE public.navigation_menu_item_settings_navigation_menu_item_setting__seq OWNER TO "ops-ci";

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


ALTER TABLE public.notes_note_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.notification_settings_notification_setting_id_seq OWNER TO "ops-ci";

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
    context bigint NOT NULL,
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


ALTER TABLE public.notifications_notification_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.oai_resumption_tokens_oai_resumption_token_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.plugin_settings_plugin_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.publication_categories_publication_category_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.publication_galley_settings_publication_galley_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.publication_galleys_galley_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.publication_settings_publication_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.queries_query_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.query_participants_query_participant_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_assignments_review_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_files_review_file_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_form_element_settings_review_form_element_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_form_elements_review_form_element_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_form_responses_review_form_response_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_form_settings_review_form_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_forms_review_form_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_round_files_review_round_file_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.review_rounds_review_round_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.scheduled_tasks_scheduled_task_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.section_settings_section_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.sections_section_id_seq OWNER TO "ops-ci";

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
    setting_value text,
    setting_type character varying(6)
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


ALTER TABLE public.server_settings_server_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.site_settings_site_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.site_site_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.stage_assignments_stage_assignment_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.subeditor_submission_group_subeditor_submission_group_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.submission_file_revisions_revision_id_seq OWNER TO "ops-ci";

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
    setting_value text,
    setting_type character varying(6) DEFAULT 'string'::character varying NOT NULL
);


ALTER TABLE public.submission_file_settings OWNER TO "ops-ci";

--
-- Name: TABLE submission_file_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.submission_file_settings IS 'Localized data about submission files like published metadata.';


--
-- Name: COLUMN submission_file_settings.setting_type; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.submission_file_settings.setting_type IS '(bool|int|float|string|object|date)';


--
-- Name: submission_file_settings_submission_file_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.submission_file_settings_submission_file_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_file_settings_submission_file_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.submission_search_keyword_list_keyword_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.submission_search_object_keyw_submission_search_object_keyw_seq OWNER TO "ops-ci";

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


ALTER TABLE public.submission_search_objects_object_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.submission_settings_submission_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.temporary_files_file_id_seq OWNER TO "ops-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.temporary_files_file_id_seq OWNED BY public.temporary_files.file_id;


--
-- Name: usage_stats_institution_temporary_records; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.usage_stats_institution_temporary_records (
    usage_stats_temp_institution_id bigint NOT NULL,
    load_id character varying(255) NOT NULL,
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


ALTER TABLE public.usage_stats_institution_tempo_usage_stats_temp_institution__seq OWNER TO "ops-ci";

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
    ip character varying(255) NOT NULL,
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
    load_id character varying(255) NOT NULL
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


ALTER TABLE public.usage_stats_total_temporary_recor_usage_stats_temp_total_id_seq OWNER TO "ops-ci";

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
    ip character varying(255) NOT NULL,
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
    load_id character varying(255) NOT NULL
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


ALTER TABLE public.usage_stats_unique_item_inves_usage_stats_temp_unique_item__seq OWNER TO "ops-ci";

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
    ip character varying(255) NOT NULL,
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
    load_id character varying(255) NOT NULL
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


ALTER TABLE public.usage_stats_unique_item_requests_t_usage_stats_temp_item_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.user_group_settings_user_group_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.user_group_stage_user_group_stage_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.user_groups_user_group_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.user_interests_user_interest_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.user_settings_user_setting_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.user_user_groups_user_user_group_id_seq OWNER TO "ops-ci";

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


ALTER TABLE public.users_user_id_seq OWNER TO "ops-ci";

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
-- Name: versions_version_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.versions_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_version_id_seq OWNER TO "ops-ci";

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

COPY public.announcement_settings (announcement_setting_id, announcement_id, locale, setting_name, setting_value, setting_type) FROM stdin;
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
1	4	\N	5	\N	3	8	2023-04-15 05:30:46
2	4	\N	5	\N	3	16	2023-04-15 05:30:53
3	4	\N	5	\N	3	8	2023-04-15 05:31:01
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	0	2023-04-15 05:27:48	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
2	1048585	1	0	2023-04-15 05:27:48	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
3	1048585	1	0	2023-04-15 05:27:48	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Carlo Corino" <ccorino@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/1">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
4	1048585	2	0	2023-04-15 05:28:59	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
27	1048585	7	0	2023-04-15 05:32:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank van Laerhoven" <fvanlaerhoven@mailinator.com>			Submission Acknowledgement	<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
5	1048585	2	0	2023-04-15 05:29:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
6	1048585	2	0	2023-04-15 05:29:00	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/2">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
7	1048585	2	0	2023-04-15 05:29:00	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Urho Kekkonen" <notanemailukk@mailinator.com>			Submission Acknowledgement	<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
8	1048585	3	0	2023-04-15 05:29:39	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
9	1048585	3	0	2023-04-15 05:29:39	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
10	1048585	3	0	2023-04-15 05:29:39	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Craig Montgomerie" <cmontgomerie@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/3">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
11	1048585	3	0	2023-04-15 05:29:39	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Irvine" <mirvine@mailinator.com>			Submission Acknowledgement	<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
12	1048585	4	0	2023-04-15 05:30:35	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
13	1048585	4	0	2023-04-15 05:30:35	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
14	1048585	4	0	2023-04-15 05:30:35	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
15	1048585	4	3	2023-04-15 05:30:46	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
16	1048585	4	3	2023-04-15 05:30:53	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			We have reversed the decision to decline your submission	<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/4">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>\n
17	1048585	4	3	2023-04-15 05:31:01	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
18	1048585	5	0	2023-04-15 05:31:28	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
19	1048585	5	0	2023-04-15 05:31:28	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
20	1048585	5	0	2023-04-15 05:31:28	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/5">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
21	1048585	6	0	2023-04-15 05:32:12	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
28	1048585	8	0	2023-04-15 05:33:16	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
22	1048585	6	0	2023-04-15 05:32:12	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
23	1048585	6	0	2023-04-15 05:32:12	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Domatilia Sokoloff" <dsokoloff@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/6">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
24	1048585	7	0	2023-04-15 05:32:44	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
25	1048585	7	0	2023-04-15 05:32:44	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
26	1048585	7	0	2023-04-15 05:32:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Elinor Ostrom" <eostrom@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/7">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
29	1048585	8	0	2023-04-15 05:33:16	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
30	1048585	8	0	2023-04-15 05:33:16	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/8">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
31	1048585	9	0	2023-04-15 05:33:48	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
32	1048585	9	0	2023-04-15 05:33:48	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
33	1048585	9	0	2023-04-15 05:33:48	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/9">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
43	1048585	12	0	2023-04-15 05:35:27	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Leo Christopher" <lchristopher@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/12">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
34	1048585	10	0	2023-04-15 05:34:21	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
35	1048585	10	0	2023-04-15 05:34:21	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
36	1048585	10	0	2023-04-15 05:34:21	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Novak" <jnovak@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/10">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
37	1048585	11	0	2023-04-15 05:34:53	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
45	1048585	13	0	2023-04-15 05:36:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
46	1048585	13	0	2023-04-15 05:36:00	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/13">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
38	1048585	11	0	2023-04-15 05:34:53	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
39	1048585	11	0	2023-04-15 05:34:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Karim Al-Khafaji" <kalkhafaji@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/11">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
40	1048585	11	0	2023-04-15 05:34:53	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Margaret Morse" <mmorse@mailinator.com>			Submission Acknowledgement	<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
41	1048585	12	0	2023-04-15 05:35:27	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
42	1048585	12	0	2023-04-15 05:35:27	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
44	1048585	13	0	2023-04-15 05:36:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
47	1048585	14	0	2023-04-15 05:36:33	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
48	1048585	14	0	2023-04-15 05:36:33	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
49	1048585	14	0	2023-04-15 05:36:33	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Patricia Daniel" <pdaniel@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/14">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
50	1048585	15	0	2023-04-15 05:37:05	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
51	1048585	15	0	2023-04-15 05:37:05	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
52	1048585	15	0	2023-04-15 05:37:05	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/15">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
53	1048585	16	0	2023-04-15 05:37:38	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
54	1048585	16	0	2023-04-15 05:37:38	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
55	1048585	16	0	2023-04-15 05:37:38	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rosanna Rossi" <rrossi@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/16">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
56	1048585	17	0	2023-04-15 05:38:10	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
57	1048585	17	0	2023-04-15 05:38:10	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
58	1048585	17	0	2023-04-15 05:38:10	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/17">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
59	1048585	18	0	2023-04-15 05:38:42	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
60	1048585	18	0	2023-04-15 05:38:42	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
61	1048585	18	0	2023-04-15 05:38:42	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/18">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
62	1048585	19	0	2023-04-15 05:39:14	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
63	1048585	19	0	2023-04-15 05:39:14	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/workflow/access/19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/workflow/access/19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
64	1048585	19	0	2023-04-15 05:39:14	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/authorDashboard/submission/19">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
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
31	34	4
32	35	5
33	36	16
34	37	4
35	38	5
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
67	SUBMISSION_NEEDS_EDITOR	fr_CA			
68	ORCID_COLLECT_AUTHOR_ID	fr_CA		Soumission ORCID	{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d'auteur ou d'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
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
47	PASSWORD_RESET_CONFIRM	fr_CA		Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}
48	USER_REGISTER	fr_CA		Inscription au serveur	{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu'utilisateur-trice pour {$serverName}. Votre nom d'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}
49	USER_VALIDATE_CONTEXT	fr_CA		Valider votre compte	{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l'utiliser vous devez d'abord valider votre compte de courriel. Pour ce faire, vous n'avez qu'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}
50	USER_VALIDATE_SITE	fr_CA			
51	SUBMISSION_ACK	fr_CA		Accusé de réception de la soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}
52	POSTED_ACK	fr_CA			
53	POSTED_NEW_VERSION_ACK	fr_CA			
54	SUBMISSION_ACK_CAN_POST	fr_CA		Accusé de réception de la soumission	
55	SUBMISSION_ACK_NOT_USER	fr_CA		Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}
56	EDITOR_ASSIGN	fr_CA			
57	EDITOR_DECISION_ACCEPT	fr_CA			
58	EDITOR_DECISION_INITIAL_DECLINE	fr_CA		Décision du rédacteur	\n\t\t\t{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$serverName}.<br />\n<br />\nNotre décision est de refuser votre soumission.
59	EDITOR_DECISION_REVERT_INITIAL_DECLINE	fr_CA			
60	EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	fr_CA			
61	STATISTICS_REPORT_NOTIFICATION	fr_CA			
62	ANNOUNCEMENT	fr_CA			
63	DISCUSSION_NOTIFICATION_PRODUCTION	fr_CA		Un message à propos de la revue {$serverName}	Prière de saisir votre message.
64	EDITOR_ASSIGN_PRODUCTION	fr_CA			
65	VERSION_CREATED	fr_CA			
66	SUBMISSION_SAVED_FOR_LATER	fr_CA			
69	ORCID_REQUEST_AUTHOR_AUTHORIZATION	fr_CA		Demande d'accès au dossier ORCID	{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l'accès en suivant les instructions.<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
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
1	1048585	1	7	2023-04-15 05:27:33	268435458	submission.event.general.metadataUpdated	0
2	1048585	1	7	2023-04-15 05:27:33	268435458	submission.event.general.metadataUpdated	0
3	515	1	7	2023-04-15 05:27:44	1342177281	submission.event.fileUploaded	0
4	1048585	1	7	2023-04-15 05:27:44	1342177288	submission.event.fileRevised	0
5	515	1	7	2023-04-15 05:27:47	1342177296	submission.event.fileEdited	0
6	1048585	1	7	2023-04-15 05:27:47	1342177296	submission.event.fileEdited	0
7	1048585	1	7	2023-04-15 05:27:48	268435457	submission.event.submissionSubmitted	0
8	1048585	2	8	2023-04-15 05:28:01	268435458	submission.event.general.metadataUpdated	0
9	1048585	2	8	2023-04-15 05:28:01	268435458	submission.event.general.metadataUpdated	0
10	1048585	2	8	2023-04-15 05:28:23	268435458	submission.event.general.metadataUpdated	0
11	515	2	8	2023-04-15 05:28:31	1342177281	submission.event.fileUploaded	0
12	1048585	2	8	2023-04-15 05:28:31	1342177288	submission.event.fileRevised	0
13	515	2	8	2023-04-15 05:28:33	1342177296	submission.event.fileEdited	0
14	1048585	2	8	2023-04-15 05:28:33	1342177296	submission.event.fileEdited	0
15	1048585	2	8	2023-04-15 05:28:59	268435457	submission.event.submissionSubmitted	0
16	1048585	2	3	2023-04-15 05:29:14	268435462	publication.event.published	0
17	1048585	3	9	2023-04-15 05:29:23	268435458	submission.event.general.metadataUpdated	0
18	1048585	3	9	2023-04-15 05:29:24	268435458	submission.event.general.metadataUpdated	0
19	515	3	9	2023-04-15 05:29:35	1342177281	submission.event.fileUploaded	0
20	1048585	3	9	2023-04-15 05:29:35	1342177288	submission.event.fileRevised	0
21	515	3	9	2023-04-15 05:29:37	1342177296	submission.event.fileEdited	0
22	1048585	3	9	2023-04-15 05:29:37	1342177296	submission.event.fileEdited	0
23	1048585	3	9	2023-04-15 05:29:39	268435457	submission.event.submissionSubmitted	0
24	1048585	3	3	2023-04-15 05:29:47	268435462	publication.event.published	0
25	1048585	3	3	2023-04-15 05:29:56	268435463	publication.event.unpublished	0
26	1048585	3	3	2023-04-15 05:29:58	268435458	submission.event.general.metadataUpdated	0
27	1048585	3	3	2023-04-15 05:30:02	268435462	publication.event.published	0
28	1048585	3	3	2023-04-15 05:30:05	268435458	submission.event.general.metadataUpdated	0
29	1048585	3	3	2023-04-15 05:30:05	268435464	publication.event.versionCreated	0
30	1048585	3	3	2023-04-15 05:30:08	268435458	submission.event.general.metadataUpdated	0
31	1048585	3	3	2023-04-15 05:30:11	268435462	publication.event.versionPublished	0
32	1048585	4	10	2023-04-15 05:30:21	268435458	submission.event.general.metadataUpdated	0
33	1048585	4	10	2023-04-15 05:30:21	268435458	submission.event.general.metadataUpdated	0
34	515	4	10	2023-04-15 05:30:32	1342177281	submission.event.fileUploaded	0
35	1048585	4	10	2023-04-15 05:30:32	1342177288	submission.event.fileRevised	0
36	515	4	10	2023-04-15 05:30:34	1342177296	submission.event.fileEdited	0
37	1048585	4	10	2023-04-15 05:30:34	1342177296	submission.event.fileEdited	0
38	1048585	4	10	2023-04-15 05:30:35	268435457	submission.event.submissionSubmitted	0
39	1048585	4	3	2023-04-15 05:30:46	805306371	editor.submission.decision.decline.log	0
40	1048585	4	3	2023-04-15 05:30:53	805306371	editor.submission.decision.revertDecline.log	0
41	1048585	4	3	2023-04-15 05:31:01	805306371	editor.submission.decision.decline.log	0
42	1048585	5	11	2023-04-15 05:31:13	268435458	submission.event.general.metadataUpdated	0
43	1048585	5	11	2023-04-15 05:31:13	268435458	submission.event.general.metadataUpdated	0
44	515	5	11	2023-04-15 05:31:24	1342177281	submission.event.fileUploaded	0
45	1048585	5	11	2023-04-15 05:31:24	1342177288	submission.event.fileRevised	0
46	515	5	11	2023-04-15 05:31:27	1342177296	submission.event.fileEdited	0
47	1048585	5	11	2023-04-15 05:31:27	1342177296	submission.event.fileEdited	0
48	1048585	5	11	2023-04-15 05:31:28	268435457	submission.event.submissionSubmitted	0
49	1048585	5	3	2023-04-15 05:31:36	268435462	publication.event.published	0
50	1048585	5	3	2023-04-15 05:31:42	268435463	publication.event.unpublished	0
51	1048585	5	3	2023-04-15 05:31:48	268435462	publication.event.published	0
52	1048585	6	12	2023-04-15 05:31:57	268435458	submission.event.general.metadataUpdated	0
53	1048585	6	12	2023-04-15 05:31:58	268435458	submission.event.general.metadataUpdated	0
54	515	6	12	2023-04-15 05:32:09	1342177281	submission.event.fileUploaded	0
55	1048585	6	12	2023-04-15 05:32:09	1342177288	submission.event.fileRevised	0
56	515	6	12	2023-04-15 05:32:11	1342177296	submission.event.fileEdited	0
57	1048585	6	12	2023-04-15 05:32:11	1342177296	submission.event.fileEdited	0
58	1048585	6	12	2023-04-15 05:32:12	268435457	submission.event.submissionSubmitted	0
59	1048585	6	3	2023-04-15 05:32:20	268435462	publication.event.published	0
60	1048585	7	13	2023-04-15 05:32:29	268435458	submission.event.general.metadataUpdated	0
61	1048585	7	13	2023-04-15 05:32:30	268435458	submission.event.general.metadataUpdated	0
62	515	7	13	2023-04-15 05:32:40	1342177281	submission.event.fileUploaded	0
63	1048585	7	13	2023-04-15 05:32:40	1342177288	submission.event.fileRevised	0
64	515	7	13	2023-04-15 05:32:43	1342177296	submission.event.fileEdited	0
65	1048585	7	13	2023-04-15 05:32:43	1342177296	submission.event.fileEdited	0
66	1048585	7	13	2023-04-15 05:32:44	268435457	submission.event.submissionSubmitted	0
67	1048585	7	3	2023-04-15 05:32:53	268435462	publication.event.published	0
68	1048585	8	14	2023-04-15 05:33:02	268435458	submission.event.general.metadataUpdated	0
69	1048585	8	14	2023-04-15 05:33:02	268435458	submission.event.general.metadataUpdated	0
70	515	8	14	2023-04-15 05:33:13	1342177281	submission.event.fileUploaded	0
71	1048585	8	14	2023-04-15 05:33:13	1342177288	submission.event.fileRevised	0
72	515	8	14	2023-04-15 05:33:15	1342177296	submission.event.fileEdited	0
73	1048585	8	14	2023-04-15 05:33:15	1342177296	submission.event.fileEdited	0
74	1048585	8	14	2023-04-15 05:33:16	268435457	submission.event.submissionSubmitted	0
75	1048585	8	3	2023-04-15 05:33:24	268435462	publication.event.published	0
76	1048585	9	15	2023-04-15 05:33:34	268435458	submission.event.general.metadataUpdated	0
77	1048585	9	15	2023-04-15 05:33:34	268435458	submission.event.general.metadataUpdated	0
78	515	9	15	2023-04-15 05:33:45	1342177281	submission.event.fileUploaded	0
79	1048585	9	15	2023-04-15 05:33:45	1342177288	submission.event.fileRevised	0
80	515	9	15	2023-04-15 05:33:47	1342177296	submission.event.fileEdited	0
81	1048585	9	15	2023-04-15 05:33:47	1342177296	submission.event.fileEdited	0
82	1048585	9	15	2023-04-15 05:33:48	268435457	submission.event.submissionSubmitted	0
83	1048585	9	3	2023-04-15 05:33:57	268435462	publication.event.published	0
84	1048585	10	16	2023-04-15 05:34:06	268435458	submission.event.general.metadataUpdated	0
85	1048585	10	16	2023-04-15 05:34:06	268435458	submission.event.general.metadataUpdated	0
86	515	10	16	2023-04-15 05:34:17	1342177281	submission.event.fileUploaded	0
87	1048585	10	16	2023-04-15 05:34:17	1342177288	submission.event.fileRevised	0
88	515	10	16	2023-04-15 05:34:19	1342177296	submission.event.fileEdited	0
89	1048585	10	16	2023-04-15 05:34:19	1342177296	submission.event.fileEdited	0
90	1048585	10	16	2023-04-15 05:34:20	268435457	submission.event.submissionSubmitted	0
91	1048585	10	3	2023-04-15 05:34:29	268435462	publication.event.published	0
92	1048585	11	17	2023-04-15 05:34:38	268435458	submission.event.general.metadataUpdated	0
93	1048585	11	17	2023-04-15 05:34:39	268435458	submission.event.general.metadataUpdated	0
94	515	11	17	2023-04-15 05:34:49	1342177281	submission.event.fileUploaded	0
95	1048585	11	17	2023-04-15 05:34:49	1342177288	submission.event.fileRevised	0
96	515	11	17	2023-04-15 05:34:52	1342177296	submission.event.fileEdited	0
97	1048585	11	17	2023-04-15 05:34:52	1342177296	submission.event.fileEdited	0
98	1048585	11	17	2023-04-15 05:34:53	268435457	submission.event.submissionSubmitted	0
99	1048585	11	3	2023-04-15 05:35:02	268435462	publication.event.published	0
100	1048585	12	18	2023-04-15 05:35:12	268435458	submission.event.general.metadataUpdated	0
101	1048585	12	18	2023-04-15 05:35:12	268435458	submission.event.general.metadataUpdated	0
102	515	12	18	2023-04-15 05:35:23	1342177281	submission.event.fileUploaded	0
103	1048585	12	18	2023-04-15 05:35:23	1342177288	submission.event.fileRevised	0
104	515	12	18	2023-04-15 05:35:25	1342177296	submission.event.fileEdited	0
105	1048585	12	18	2023-04-15 05:35:25	1342177296	submission.event.fileEdited	0
106	1048585	12	18	2023-04-15 05:35:26	268435457	submission.event.submissionSubmitted	0
107	1048585	12	3	2023-04-15 05:35:35	268435462	publication.event.published	0
108	1048585	13	19	2023-04-15 05:35:45	268435458	submission.event.general.metadataUpdated	0
109	1048585	13	19	2023-04-15 05:35:45	268435458	submission.event.general.metadataUpdated	0
110	515	13	19	2023-04-15 05:35:56	1342177281	submission.event.fileUploaded	0
111	1048585	13	19	2023-04-15 05:35:56	1342177288	submission.event.fileRevised	0
112	515	13	19	2023-04-15 05:35:58	1342177296	submission.event.fileEdited	0
113	1048585	13	19	2023-04-15 05:35:58	1342177296	submission.event.fileEdited	0
114	1048585	13	19	2023-04-15 05:35:59	268435457	submission.event.submissionSubmitted	0
115	1048585	13	3	2023-04-15 05:36:08	268435462	publication.event.published	0
116	1048585	14	20	2023-04-15 05:36:18	268435458	submission.event.general.metadataUpdated	0
117	1048585	14	20	2023-04-15 05:36:18	268435458	submission.event.general.metadataUpdated	0
118	515	14	20	2023-04-15 05:36:29	1342177281	submission.event.fileUploaded	0
119	1048585	14	20	2023-04-15 05:36:29	1342177288	submission.event.fileRevised	0
120	515	14	20	2023-04-15 05:36:31	1342177296	submission.event.fileEdited	0
121	1048585	14	20	2023-04-15 05:36:31	1342177296	submission.event.fileEdited	0
122	1048585	14	20	2023-04-15 05:36:33	268435457	submission.event.submissionSubmitted	0
123	1048585	14	3	2023-04-15 05:36:41	268435462	publication.event.published	0
124	1048585	15	21	2023-04-15 05:36:51	268435458	submission.event.general.metadataUpdated	0
125	1048585	15	21	2023-04-15 05:36:51	268435458	submission.event.general.metadataUpdated	0
126	515	15	21	2023-04-15 05:37:02	1342177281	submission.event.fileUploaded	0
127	1048585	15	21	2023-04-15 05:37:02	1342177288	submission.event.fileRevised	0
128	515	15	21	2023-04-15 05:37:04	1342177296	submission.event.fileEdited	0
129	1048585	15	21	2023-04-15 05:37:04	1342177296	submission.event.fileEdited	0
130	1048585	15	21	2023-04-15 05:37:05	268435457	submission.event.submissionSubmitted	0
131	1048585	15	3	2023-04-15 05:37:14	268435462	publication.event.published	0
132	1048585	16	22	2023-04-15 05:37:23	268435458	submission.event.general.metadataUpdated	0
133	1048585	16	22	2023-04-15 05:37:23	268435458	submission.event.general.metadataUpdated	0
134	515	16	22	2023-04-15 05:37:34	1342177281	submission.event.fileUploaded	0
135	1048585	16	22	2023-04-15 05:37:34	1342177288	submission.event.fileRevised	0
136	515	16	22	2023-04-15 05:37:36	1342177296	submission.event.fileEdited	0
137	1048585	16	22	2023-04-15 05:37:36	1342177296	submission.event.fileEdited	0
138	1048585	16	22	2023-04-15 05:37:37	268435457	submission.event.submissionSubmitted	0
139	1048585	16	3	2023-04-15 05:37:46	268435462	publication.event.published	0
140	1048585	17	23	2023-04-15 05:37:55	268435458	submission.event.general.metadataUpdated	0
141	1048585	17	23	2023-04-15 05:37:56	268435458	submission.event.general.metadataUpdated	0
142	515	17	23	2023-04-15 05:38:06	1342177281	submission.event.fileUploaded	0
143	1048585	17	23	2023-04-15 05:38:06	1342177288	submission.event.fileRevised	0
144	515	17	23	2023-04-15 05:38:09	1342177296	submission.event.fileEdited	0
145	1048585	17	23	2023-04-15 05:38:09	1342177296	submission.event.fileEdited	0
146	1048585	17	23	2023-04-15 05:38:10	268435457	submission.event.submissionSubmitted	0
147	1048585	17	3	2023-04-15 05:38:18	268435462	publication.event.published	0
148	1048585	18	24	2023-04-15 05:38:28	268435458	submission.event.general.metadataUpdated	0
149	1048585	18	24	2023-04-15 05:38:28	268435458	submission.event.general.metadataUpdated	0
150	515	18	24	2023-04-15 05:38:39	1342177281	submission.event.fileUploaded	0
151	1048585	18	24	2023-04-15 05:38:39	1342177288	submission.event.fileRevised	0
152	515	18	24	2023-04-15 05:38:41	1342177296	submission.event.fileEdited	0
153	1048585	18	24	2023-04-15 05:38:41	1342177296	submission.event.fileEdited	0
154	1048585	18	24	2023-04-15 05:38:42	268435457	submission.event.submissionSubmitted	0
155	1048585	18	3	2023-04-15 05:38:51	268435462	publication.event.published	0
156	1048585	19	25	2023-04-15 05:39:00	268435458	submission.event.general.metadataUpdated	0
157	1048585	19	25	2023-04-15 05:39:00	268435458	submission.event.general.metadataUpdated	0
158	515	19	25	2023-04-15 05:39:11	1342177281	submission.event.fileUploaded	0
159	1048585	19	25	2023-04-15 05:39:11	1342177288	submission.event.fileRevised	0
160	515	19	25	2023-04-15 05:39:13	1342177296	submission.event.fileEdited	0
161	1048585	19	25	2023-04-15 05:39:13	1342177296	submission.event.fileEdited	0
162	1048585	19	25	2023-04-15 05:39:14	268435457	submission.event.submissionSubmitted	0
163	1048585	19	3	2023-04-15 05:39:23	268435462	publication.event.published	0
\.


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.event_log_settings (event_log_setting_id, log_id, setting_name, setting_value, setting_type) FROM stdin;
1	3	fileStage	10	int
2	3	sourceSubmissionFileId	\N	string
3	3	submissionFileId	1	int
4	3	fileId	1	int
5	3	submissionId	1	int
6	3	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
7	3	username	ccorino	string
8	4	fileStage	10	int
9	4	submissionFileId	1	int
10	4	fileId	1	int
11	4	submissionId	1	int
12	4	username	ccorino	string
13	4	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
14	5	fileStage	10	int
15	5	sourceSubmissionFileId	\N	string
16	5	submissionFileId	1	int
17	5	fileId	1	int
18	5	submissionId	1	int
19	5	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
20	5	username	ccorino	string
21	6	fileStage	10	int
22	6	sourceSubmissionFileId	\N	string
23	6	submissionFileId	1	int
24	6	fileId	1	int
25	6	submissionId	1	int
26	6	username	ccorino	string
27	6	originalFileName	The influence of lactation on the quantity and quality of cashmere production.pdf	string
28	6	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
29	11	fileStage	10	int
30	11	sourceSubmissionFileId	\N	string
31	11	submissionFileId	2	int
32	11	fileId	2	int
33	11	submissionId	2	int
34	11	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
35	11	username	ckwantes	string
36	12	fileStage	10	int
37	12	submissionFileId	2	int
38	12	fileId	2	int
39	12	submissionId	2	int
40	12	username	ckwantes	string
41	12	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
42	13	fileStage	10	int
43	13	sourceSubmissionFileId	\N	string
44	13	submissionFileId	2	int
45	13	fileId	2	int
46	13	submissionId	2	int
47	13	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
48	13	username	ckwantes	string
49	14	fileStage	10	int
50	14	sourceSubmissionFileId	\N	string
51	14	submissionFileId	2	int
52	14	fileId	2	int
53	14	submissionId	2	int
54	14	username	ckwantes	string
55	14	originalFileName	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
56	14	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
57	19	fileStage	10	int
58	19	sourceSubmissionFileId	\N	string
59	19	submissionFileId	3	int
60	19	fileId	3	int
61	19	submissionId	3	int
62	19	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
63	19	username	cmontgomerie	string
64	20	fileStage	10	int
65	20	submissionFileId	3	int
66	20	fileId	3	int
67	20	submissionId	3	int
68	20	username	cmontgomerie	string
69	20	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
70	21	fileStage	10	int
71	21	sourceSubmissionFileId	\N	string
72	21	submissionFileId	3	int
73	21	fileId	3	int
74	21	submissionId	3	int
75	21	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
76	21	username	cmontgomerie	string
77	22	fileStage	10	int
78	22	sourceSubmissionFileId	\N	string
79	22	submissionFileId	3	int
80	22	fileId	3	int
81	22	submissionId	3	int
82	22	username	cmontgomerie	string
83	22	originalFileName	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
84	22	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
85	34	fileStage	10	int
86	34	sourceSubmissionFileId	\N	string
87	34	submissionFileId	4	int
88	34	fileId	4	int
89	34	submissionId	4	int
90	34	originalFileName	Genetic transformation of forest trees.pdf	string
91	34	username	ddiouf	string
92	35	fileStage	10	int
93	35	submissionFileId	4	int
94	35	fileId	4	int
95	35	submissionId	4	int
96	35	username	ddiouf	string
97	35	name	Genetic transformation of forest trees.pdf	string
98	36	fileStage	10	int
99	36	sourceSubmissionFileId	\N	string
100	36	submissionFileId	4	int
101	36	fileId	4	int
102	36	submissionId	4	int
103	36	originalFileName	Genetic transformation of forest trees.pdf	string
104	36	username	ddiouf	string
105	37	fileStage	10	int
106	37	sourceSubmissionFileId	\N	string
107	37	submissionFileId	4	int
108	37	fileId	4	int
109	37	submissionId	4	int
110	37	username	ddiouf	string
111	37	originalFileName	Genetic transformation of forest trees.pdf	string
112	37	name	Genetic transformation of forest trees.pdf	string
113	39	editorId	3	int
114	39	editorName	Daniel Barnes	string
115	39	submissionId	4	int
116	39	decision	8	int
117	40	editorId	3	int
118	40	editorName	Daniel Barnes	string
119	40	submissionId	4	int
120	40	decision	16	int
121	41	editorId	3	int
122	41	editorName	Daniel Barnes	string
123	41	submissionId	4	int
124	41	decision	8	int
125	44	fileStage	10	int
126	44	sourceSubmissionFileId	\N	string
127	44	submissionFileId	5	int
128	44	fileId	5	int
129	44	submissionId	5	int
130	44	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
131	44	username	dphillips	string
132	45	fileStage	10	int
133	45	submissionFileId	5	int
134	45	fileId	5	int
135	45	submissionId	5	int
136	45	username	dphillips	string
137	45	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
138	46	fileStage	10	int
139	46	sourceSubmissionFileId	\N	string
140	46	submissionFileId	5	int
141	46	fileId	5	int
142	46	submissionId	5	int
143	46	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
144	46	username	dphillips	string
145	47	fileStage	10	int
146	47	sourceSubmissionFileId	\N	string
147	47	submissionFileId	5	int
148	47	fileId	5	int
149	47	submissionId	5	int
150	47	username	dphillips	string
151	47	originalFileName	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
152	47	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
153	54	fileStage	10	int
154	54	sourceSubmissionFileId	\N	string
155	54	submissionFileId	6	int
156	54	fileId	6	int
157	54	submissionId	6	int
158	54	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
159	54	username	dsokoloff	string
160	55	fileStage	10	int
161	55	submissionFileId	6	int
162	55	fileId	6	int
163	55	submissionId	6	int
164	55	username	dsokoloff	string
165	55	name	Developing efficacy beliefs in the classroom.pdf	string
166	56	fileStage	10	int
167	56	sourceSubmissionFileId	\N	string
168	56	submissionFileId	6	int
169	56	fileId	6	int
170	56	submissionId	6	int
171	56	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
172	56	username	dsokoloff	string
173	57	fileStage	10	int
174	57	sourceSubmissionFileId	\N	string
175	57	submissionFileId	6	int
176	57	fileId	6	int
177	57	submissionId	6	int
178	57	username	dsokoloff	string
179	57	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
180	57	name	Developing efficacy beliefs in the classroom.pdf	string
181	62	fileStage	10	int
182	62	sourceSubmissionFileId	\N	string
183	62	submissionFileId	7	int
184	62	fileId	7	int
185	62	submissionId	7	int
186	62	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
187	62	username	eostrom	string
188	63	fileStage	10	int
189	63	submissionFileId	7	int
190	63	fileId	7	int
191	63	submissionId	7	int
192	63	username	eostrom	string
193	63	name	Developing efficacy beliefs in the classroom.pdf	string
194	64	fileStage	10	int
195	64	sourceSubmissionFileId	\N	string
196	64	submissionFileId	7	int
197	64	fileId	7	int
198	64	submissionId	7	int
199	64	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
200	64	username	eostrom	string
201	65	fileStage	10	int
202	65	sourceSubmissionFileId	\N	string
203	65	submissionFileId	7	int
204	65	fileId	7	int
205	65	submissionId	7	int
206	65	username	eostrom	string
207	65	originalFileName	Developing efficacy beliefs in the classroom.pdf	string
208	65	name	Developing efficacy beliefs in the classroom.pdf	string
209	70	fileStage	10	int
210	70	sourceSubmissionFileId	\N	string
211	70	submissionFileId	8	int
212	70	fileId	8	int
213	70	submissionId	8	int
214	70	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
215	70	username	fpaglieri	string
216	71	fileStage	10	int
217	71	submissionFileId	8	int
218	71	fileId	8	int
219	71	submissionId	8	int
220	71	username	fpaglieri	string
221	71	name	Hansen & Pinto: Reason Reclaimed.pdf	string
222	72	fileStage	10	int
223	72	sourceSubmissionFileId	\N	string
224	72	submissionFileId	8	int
225	72	fileId	8	int
226	72	submissionId	8	int
227	72	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
228	72	username	fpaglieri	string
229	73	fileStage	10	int
230	73	sourceSubmissionFileId	\N	string
231	73	submissionFileId	8	int
232	73	fileId	8	int
233	73	submissionId	8	int
234	73	username	fpaglieri	string
235	73	originalFileName	Hansen & Pinto: Reason Reclaimed.pdf	string
236	73	name	Hansen & Pinto: Reason Reclaimed.pdf	string
237	78	fileStage	10	int
238	78	sourceSubmissionFileId	\N	string
239	78	submissionFileId	9	int
240	78	fileId	9	int
241	78	submissionId	9	int
242	78	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
243	78	username	jmwandenga	string
244	79	fileStage	10	int
245	79	submissionFileId	9	int
246	79	fileId	9	int
247	79	submissionId	9	int
248	79	username	jmwandenga	string
249	79	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
250	80	fileStage	10	int
251	80	sourceSubmissionFileId	\N	string
252	80	submissionFileId	9	int
253	80	fileId	9	int
254	80	submissionId	9	int
255	80	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
256	80	username	jmwandenga	string
257	81	fileStage	10	int
258	81	sourceSubmissionFileId	\N	string
259	81	submissionFileId	9	int
260	81	fileId	9	int
261	81	submissionId	9	int
262	81	username	jmwandenga	string
263	81	originalFileName	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
264	81	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
265	86	fileStage	10	int
266	86	sourceSubmissionFileId	\N	string
267	86	submissionFileId	10	int
268	86	fileId	10	int
269	86	submissionId	10	int
270	86	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
271	86	username	jnovak	string
272	87	fileStage	10	int
273	87	submissionFileId	10	int
274	87	fileId	10	int
275	87	submissionId	10	int
276	87	username	jnovak	string
277	87	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
278	88	fileStage	10	int
279	88	sourceSubmissionFileId	\N	string
280	88	submissionFileId	10	int
281	88	fileId	10	int
282	88	submissionId	10	int
283	88	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
284	88	username	jnovak	string
285	89	fileStage	10	int
286	89	sourceSubmissionFileId	\N	string
287	89	submissionFileId	10	int
288	89	fileId	10	int
289	89	submissionId	10	int
290	89	username	jnovak	string
291	89	originalFileName	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
292	89	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
293	94	fileStage	10	int
294	94	sourceSubmissionFileId	\N	string
295	94	submissionFileId	11	int
296	94	fileId	11	int
297	94	submissionId	11	int
298	94	originalFileName	Learning Sustainable Design through Service.pdf	string
299	94	username	kalkhafaji	string
300	95	fileStage	10	int
301	95	submissionFileId	11	int
302	95	fileId	11	int
303	95	submissionId	11	int
304	95	username	kalkhafaji	string
305	95	name	Learning Sustainable Design through Service.pdf	string
306	96	fileStage	10	int
307	96	sourceSubmissionFileId	\N	string
308	96	submissionFileId	11	int
309	96	fileId	11	int
310	96	submissionId	11	int
311	96	originalFileName	Learning Sustainable Design through Service.pdf	string
312	96	username	kalkhafaji	string
313	97	fileStage	10	int
314	97	sourceSubmissionFileId	\N	string
315	97	submissionFileId	11	int
316	97	fileId	11	int
317	97	submissionId	11	int
318	97	username	kalkhafaji	string
319	97	originalFileName	Learning Sustainable Design through Service.pdf	string
320	97	name	Learning Sustainable Design through Service.pdf	string
321	102	fileStage	10	int
322	102	sourceSubmissionFileId	\N	string
323	102	submissionFileId	12	int
324	102	fileId	12	int
325	102	submissionId	12	int
326	102	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
327	102	username	lchristopher	string
328	103	fileStage	10	int
329	103	submissionFileId	12	int
330	103	fileId	12	int
331	103	submissionId	12	int
332	103	username	lchristopher	string
333	103	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
334	104	fileStage	10	int
335	104	sourceSubmissionFileId	\N	string
336	104	submissionFileId	12	int
337	104	fileId	12	int
338	104	submissionId	12	int
339	104	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
340	104	username	lchristopher	string
341	105	fileStage	10	int
342	105	sourceSubmissionFileId	\N	string
343	105	submissionFileId	12	int
344	105	fileId	12	int
345	105	submissionId	12	int
346	105	username	lchristopher	string
347	105	originalFileName	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
348	105	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
349	110	fileStage	10	int
350	110	sourceSubmissionFileId	\N	string
351	110	submissionFileId	13	int
352	110	fileId	13	int
353	110	submissionId	13	int
354	110	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
355	110	username	lkumiega	string
356	111	fileStage	10	int
357	111	submissionFileId	13	int
358	111	fileId	13	int
359	111	submissionId	13	int
360	111	username	lkumiega	string
361	111	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
362	112	fileStage	10	int
363	112	sourceSubmissionFileId	\N	string
364	112	submissionFileId	13	int
365	112	fileId	13	int
366	112	submissionId	13	int
367	112	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
368	112	username	lkumiega	string
369	113	fileStage	10	int
370	113	sourceSubmissionFileId	\N	string
371	113	submissionFileId	13	int
372	113	fileId	13	int
373	113	submissionId	13	int
374	113	username	lkumiega	string
375	113	originalFileName	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
376	113	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
377	118	fileStage	10	int
378	118	sourceSubmissionFileId	\N	string
379	118	submissionFileId	14	int
380	118	fileId	14	int
381	118	submissionId	14	int
382	118	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
383	118	username	pdaniel	string
384	119	fileStage	10	int
385	119	submissionFileId	14	int
386	119	fileId	14	int
387	119	submissionId	14	int
388	119	username	pdaniel	string
389	119	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
390	120	fileStage	10	int
391	120	sourceSubmissionFileId	\N	string
392	120	submissionFileId	14	int
393	120	fileId	14	int
394	120	submissionId	14	int
395	120	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
396	120	username	pdaniel	string
397	121	fileStage	10	int
398	121	sourceSubmissionFileId	\N	string
399	121	submissionFileId	14	int
400	121	fileId	14	int
401	121	submissionId	14	int
402	121	username	pdaniel	string
403	121	originalFileName	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
404	121	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
405	126	fileStage	10	int
406	126	sourceSubmissionFileId	\N	string
407	126	submissionFileId	15	int
408	126	fileId	15	int
409	126	submissionId	15	int
410	126	originalFileName	Yam diseases and its management in Nigeria.pdf	string
411	126	username	rbaiyewu	string
412	127	fileStage	10	int
413	127	submissionFileId	15	int
414	127	fileId	15	int
415	127	submissionId	15	int
416	127	username	rbaiyewu	string
417	127	name	Yam diseases and its management in Nigeria.pdf	string
418	128	fileStage	10	int
419	128	sourceSubmissionFileId	\N	string
420	128	submissionFileId	15	int
421	128	fileId	15	int
422	128	submissionId	15	int
423	128	originalFileName	Yam diseases and its management in Nigeria.pdf	string
424	128	username	rbaiyewu	string
425	129	fileStage	10	int
426	129	sourceSubmissionFileId	\N	string
427	129	submissionFileId	15	int
428	129	fileId	15	int
429	129	submissionId	15	int
430	129	username	rbaiyewu	string
431	129	originalFileName	Yam diseases and its management in Nigeria.pdf	string
432	129	name	Yam diseases and its management in Nigeria.pdf	string
433	134	fileStage	10	int
434	134	sourceSubmissionFileId	\N	string
435	134	submissionFileId	16	int
436	134	fileId	16	int
437	134	submissionId	16	int
438	134	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
439	134	username	rrossi	string
440	135	fileStage	10	int
441	135	submissionFileId	16	int
442	135	fileId	16	int
443	135	submissionId	16	int
444	135	username	rrossi	string
445	135	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
446	136	fileStage	10	int
447	136	sourceSubmissionFileId	\N	string
448	136	submissionFileId	16	int
449	136	fileId	16	int
450	136	submissionId	16	int
451	136	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
452	136	username	rrossi	string
453	137	fileStage	10	int
454	137	sourceSubmissionFileId	\N	string
455	137	submissionFileId	16	int
456	137	fileId	16	int
457	137	submissionId	16	int
458	137	username	rrossi	string
459	137	originalFileName	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
460	137	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
461	142	fileStage	10	int
462	142	sourceSubmissionFileId	\N	string
463	142	submissionFileId	17	int
464	142	fileId	17	int
465	142	submissionId	17	int
466	142	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
467	142	username	vkarbasizaed	string
468	143	fileStage	10	int
469	143	submissionFileId	17	int
470	143	fileId	17	int
471	143	submissionId	17	int
472	143	username	vkarbasizaed	string
473	143	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
474	144	fileStage	10	int
475	144	sourceSubmissionFileId	\N	string
476	144	submissionFileId	17	int
477	144	fileId	17	int
478	144	submissionId	17	int
479	144	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
480	144	username	vkarbasizaed	string
481	145	fileStage	10	int
482	145	sourceSubmissionFileId	\N	string
483	145	submissionFileId	17	int
484	145	fileId	17	int
485	145	submissionId	17	int
486	145	username	vkarbasizaed	string
487	145	originalFileName	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
488	145	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
489	150	fileStage	10	int
490	150	sourceSubmissionFileId	\N	string
491	150	submissionFileId	18	int
492	150	fileId	18	int
493	150	submissionId	18	int
494	150	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
495	150	username	vwilliamson	string
496	151	fileStage	10	int
497	151	submissionFileId	18	int
498	151	fileId	18	int
499	151	submissionId	18	int
500	151	username	vwilliamson	string
501	151	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
502	152	fileStage	10	int
503	152	sourceSubmissionFileId	\N	string
504	152	submissionFileId	18	int
505	152	fileId	18	int
506	152	submissionId	18	int
507	152	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
508	152	username	vwilliamson	string
509	153	fileStage	10	int
510	153	sourceSubmissionFileId	\N	string
511	153	submissionFileId	18	int
512	153	fileId	18	int
513	153	submissionId	18	int
514	153	username	vwilliamson	string
515	153	originalFileName	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
516	153	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
517	158	fileStage	10	int
518	158	sourceSubmissionFileId	\N	string
519	158	submissionFileId	19	int
520	158	fileId	19	int
521	158	submissionId	19	int
522	158	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
523	158	username	zwoods	string
524	159	fileStage	10	int
525	159	submissionFileId	19	int
526	159	fileId	19	int
527	159	submissionId	19	int
528	159	username	zwoods	string
529	159	name	Finocchiaro: Arguments About Arguments.pdf	string
530	160	fileStage	10	int
531	160	sourceSubmissionFileId	\N	string
532	160	submissionFileId	19	int
533	160	fileId	19	int
534	160	submissionId	19	int
535	160	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
536	160	username	zwoods	string
537	161	fileStage	10	int
538	161	sourceSubmissionFileId	\N	string
539	161	submissionFileId	19	int
540	161	fileId	19	int
541	161	submissionId	19	int
542	161	username	zwoods	string
543	161	originalFileName	Finocchiaro: Arguments About Arguments.pdf	string
544	161	name	Finocchiaro: Arguments About Arguments.pdf	string
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
1	contexts/1/submissions/1/643a35d0a5b8e.pdf	application/pdf
2	contexts/1/submissions/2/643a35ff1fffa.pdf	application/pdf
3	contexts/1/submissions/3/643a363f557d2.pdf	application/pdf
4	contexts/1/submissions/4/643a36782af82.pdf	application/pdf
5	contexts/1/submissions/5/643a36ac97cd5.pdf	application/pdf
6	contexts/1/submissions/6/643a36d9227ab.pdf	application/pdf
7	contexts/1/submissions/7/643a36f8d8718.pdf	application/pdf
8	contexts/1/submissions/8/643a371923e32.pdf	application/pdf
9	contexts/1/submissions/9/643a37395edf6.pdf	application/pdf
10	contexts/1/submissions/10/643a37598206a.pdf	application/pdf
11	contexts/1/submissions/11/643a3779bf9f8.pdf	application/pdf
12	contexts/1/submissions/12/643a379b6461a.pdf	application/pdf
13	contexts/1/submissions/13/643a37bc547f2.pdf	application/pdf
14	contexts/1/submissions/14/643a37dd730e9.pdf	application/pdf
15	contexts/1/submissions/15/643a37fe211e5.pdf	application/pdf
16	contexts/1/submissions/16/643a381e60924.pdf	application/pdf
17	contexts/1/submissions/17/643a383ee3be8.pdf	application/pdf
18	contexts/1/submissions/18/643a385f00c42.pdf	application/pdf
19	contexts/1/submissions/19/643a387f66e1c.pdf	application/pdf
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
98ef5132-b05a-41c8-a547-27ea3057d539		0	0	0	[]	YTowOnt9	\N	1681536268	\N
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
76	1	\N	3	16777222	2023-04-15 05:38:42	\N	1048585	18
77	1	\N	3	16777223	2023-04-15 05:38:42	\N	1048585	18
3	1	\N	3	16777222	2023-04-15 05:27:48	\N	1048585	1
4	1	\N	3	16777223	2023-04-15 05:27:48	\N	1048585	1
5	1	4	2	16777217	2023-04-15 05:27:48	\N	1048585	1
6	1	5	2	16777217	2023-04-15 05:27:48	\N	1048585	1
7	1	\N	3	16777222	2023-04-15 05:28:59	\N	1048585	2
8	1	\N	3	16777223	2023-04-15 05:28:59	\N	1048585	2
9	1	4	2	16777217	2023-04-15 05:28:59	\N	1048585	2
10	1	5	2	16777217	2023-04-15 05:28:59	\N	1048585	2
11	1	\N	3	16777222	2023-04-15 05:29:39	\N	1048585	3
12	1	\N	3	16777223	2023-04-15 05:29:39	\N	1048585	3
13	1	4	2	16777217	2023-04-15 05:29:39	\N	1048585	3
14	1	5	2	16777217	2023-04-15 05:29:39	\N	1048585	3
15	1	4	3	16777259	2023-04-15 05:30:05	\N	1048585	3
16	1	5	3	16777259	2023-04-15 05:30:05	\N	1048585	3
17	1	9	3	16777259	2023-04-15 05:30:05	\N	1048585	3
18	1	\N	3	16777222	2023-04-15 05:30:35	\N	1048585	4
19	1	\N	3	16777223	2023-04-15 05:30:35	\N	1048585	4
20	1	4	2	16777217	2023-04-15 05:30:35	\N	1048585	4
21	1	5	2	16777217	2023-04-15 05:30:35	\N	1048585	4
23	1	10	2	16777234	2023-04-15 05:31:01	\N	1048585	4
24	1	\N	3	16777222	2023-04-15 05:31:28	\N	1048585	5
25	1	\N	3	16777223	2023-04-15 05:31:28	\N	1048585	5
26	1	4	2	16777217	2023-04-15 05:31:28	\N	1048585	5
27	1	5	2	16777217	2023-04-15 05:31:28	\N	1048585	5
28	1	\N	3	16777222	2023-04-15 05:32:12	\N	1048585	6
29	1	\N	3	16777223	2023-04-15 05:32:12	\N	1048585	6
30	1	4	2	16777217	2023-04-15 05:32:12	\N	1048585	6
31	1	5	2	16777217	2023-04-15 05:32:12	\N	1048585	6
32	1	\N	3	16777222	2023-04-15 05:32:44	\N	1048585	7
33	1	\N	3	16777223	2023-04-15 05:32:44	\N	1048585	7
34	1	4	2	16777217	2023-04-15 05:32:44	\N	1048585	7
35	1	5	2	16777217	2023-04-15 05:32:44	\N	1048585	7
36	1	\N	3	16777222	2023-04-15 05:33:16	\N	1048585	8
37	1	\N	3	16777223	2023-04-15 05:33:16	\N	1048585	8
38	1	4	2	16777217	2023-04-15 05:33:16	\N	1048585	8
39	1	5	2	16777217	2023-04-15 05:33:16	\N	1048585	8
40	1	\N	3	16777222	2023-04-15 05:33:48	\N	1048585	9
41	1	\N	3	16777223	2023-04-15 05:33:48	\N	1048585	9
42	1	4	2	16777217	2023-04-15 05:33:48	\N	1048585	9
43	1	5	2	16777217	2023-04-15 05:33:48	\N	1048585	9
44	1	\N	3	16777222	2023-04-15 05:34:21	\N	1048585	10
45	1	\N	3	16777223	2023-04-15 05:34:21	\N	1048585	10
46	1	4	2	16777217	2023-04-15 05:34:21	\N	1048585	10
47	1	5	2	16777217	2023-04-15 05:34:21	\N	1048585	10
48	1	\N	3	16777222	2023-04-15 05:34:53	\N	1048585	11
49	1	\N	3	16777223	2023-04-15 05:34:53	\N	1048585	11
50	1	4	2	16777217	2023-04-15 05:34:53	\N	1048585	11
51	1	5	2	16777217	2023-04-15 05:34:53	\N	1048585	11
52	1	\N	3	16777222	2023-04-15 05:35:26	\N	1048585	12
53	1	\N	3	16777223	2023-04-15 05:35:26	\N	1048585	12
54	1	4	2	16777217	2023-04-15 05:35:26	\N	1048585	12
55	1	5	2	16777217	2023-04-15 05:35:27	\N	1048585	12
56	1	\N	3	16777222	2023-04-15 05:35:59	\N	1048585	13
57	1	\N	3	16777223	2023-04-15 05:35:59	\N	1048585	13
58	1	4	2	16777217	2023-04-15 05:35:59	\N	1048585	13
59	1	5	2	16777217	2023-04-15 05:35:59	\N	1048585	13
60	1	\N	3	16777222	2023-04-15 05:36:33	\N	1048585	14
61	1	\N	3	16777223	2023-04-15 05:36:33	\N	1048585	14
62	1	4	2	16777217	2023-04-15 05:36:33	\N	1048585	14
63	1	5	2	16777217	2023-04-15 05:36:33	\N	1048585	14
64	1	\N	3	16777222	2023-04-15 05:37:05	\N	1048585	15
65	1	\N	3	16777223	2023-04-15 05:37:05	\N	1048585	15
66	1	4	2	16777217	2023-04-15 05:37:05	\N	1048585	15
67	1	5	2	16777217	2023-04-15 05:37:05	\N	1048585	15
68	1	\N	3	16777222	2023-04-15 05:37:37	\N	1048585	16
69	1	\N	3	16777223	2023-04-15 05:37:37	\N	1048585	16
70	1	4	2	16777217	2023-04-15 05:37:37	\N	1048585	16
71	1	5	2	16777217	2023-04-15 05:37:37	\N	1048585	16
72	1	\N	3	16777222	2023-04-15 05:38:10	\N	1048585	17
73	1	\N	3	16777223	2023-04-15 05:38:10	\N	1048585	17
74	1	4	2	16777217	2023-04-15 05:38:10	\N	1048585	17
75	1	5	2	16777217	2023-04-15 05:38:10	\N	1048585	17
78	1	4	2	16777217	2023-04-15 05:38:42	\N	1048585	18
79	1	5	2	16777217	2023-04-15 05:38:42	\N	1048585	18
80	1	\N	3	16777222	2023-04-15 05:39:14	\N	1048585	19
81	1	\N	3	16777223	2023-04-15 05:39:14	\N	1048585	19
82	1	4	2	16777217	2023-04-15 05:39:14	\N	1048585	19
83	1	5	2	16777217	2023-04-15 05:39:14	\N	1048585	19
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
4	usageeventplugin	0	enabled	1	bool
5	usageeventplugin	0	uniqueSiteId		string
6	tinymceplugin	0	enabled	1	bool
7	languagetoggleblockplugin	0	enabled	1	bool
8	languagetoggleblockplugin	0	seq	4	int
9	developedbyblockplugin	0	enabled	0	bool
10	developedbyblockplugin	0	seq	0	int
11	defaultthemeplugin	1	enabled	1	bool
12	tinymceplugin	1	enabled	1	bool
13	languagetoggleblockplugin	1	enabled	1	bool
14	languagetoggleblockplugin	1	seq	4	int
15	developedbyblockplugin	1	enabled	0	bool
16	developedbyblockplugin	1	seq	0	int
17	webfeedplugin	1	enabled	1	bool
18	webfeedplugin	1	displayPage	homepage	string
19	webfeedplugin	1	displayItems	1	bool
20	webfeedplugin	1	recentItems	30	int
21	webfeedplugin	1	includeIdentifiers	0	bool
22	pdfjsviewerplugin	1	enabled	1	bool
23	googlescholarplugin	1	enabled	1	bool
24	defaultthemeplugin	1	typography	notoSans	string
25	defaultthemeplugin	1	baseColour	#1E6292	string
26	defaultthemeplugin	1	showDescriptionInServerIndex	false	string
27	defaultthemeplugin	1	useHomepageImageAsHeader	false	string
28	defaultthemeplugin	1	displayStats	none	string
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
1	en	1	PDF	1	0		0		\N
2	en	2	PDF	2	0		0		\N
3	en	3	PDF	3	0		0		\N
4	en	4	PDF	3	0		0		\N
5	en	5	PDF	4	0		0		\N
6	en	6	PDF	5	0		0		\N
7	en	7	PDF	6	0		0		\N
8	en	8	PDF	7	0		0		\N
9	en	9	PDF	8	0		0		\N
10	en	10	PDF	9	0		0		\N
11	en	11	PDF	10	0		0		\N
12	en	12	PDF	11	0		0		\N
13	en	13	PDF	12	0		0		\N
14	en	14	PDF	13	0		0		\N
15	en	15	PDF	14	0		0		\N
16	en	16	PDF	15	0		0		\N
17	en	17	PDF	16	0		0		\N
18	en	18	PDF	17	0		0		\N
19	en	19	PDF	18	0		0		\N
20	en	20	PDF	19	0		0		\N
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
8	2	en	copyrightHolder	Public Knowledge Preprint Server
9	2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
10	2		copyrightYear	2023
5	2	en	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
7	2	fr_CA	title	
11	3	en	abstract	The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.
12	3		categoryIds	[]
14	3	en	copyrightHolder	Public Knowledge Preprint Server
15	3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16	3		copyrightYear	2023
13	3	en	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
32	7	en	abstract	A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.
33	7		categoryIds	[]
35	7	en	copyrightHolder	Public Knowledge Preprint Server
36	7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
17	4	en	abstract	The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.
18	4		categoryIds	[]
19	4	en	copyrightHolder	Craig Montgomerie
20	4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
21	4		copyrightYear	2023
22	4	en	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
23	5	en	abstract	In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.
24	5		categoryIds	[]
25	5	en	title	Genetic transformation of forest trees
37	7		copyrightYear	2023
34	7	en	title	Developing efficacy beliefs in the classroom
26	6	en	abstract	Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.
27	6		categoryIds	[]
29	6	en	copyrightHolder	Public Knowledge Preprint Server
30	6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
31	6		copyrightYear	2023
28	6	en	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
38	8	en	abstract	The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.
39	8		categoryIds	[]
41	8	en	copyrightHolder	Public Knowledge Preprint Server
42	8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
43	8		copyrightYear	2023
40	8	en	title	Developing efficacy beliefs in the classroom
44	9	en	abstract	None.
45	9		categoryIds	[]
47	9	en	copyrightHolder	Public Knowledge Preprint Server
48	9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
49	9		copyrightYear	2023
46	9	en	title	Hansen & Pinto: Reason Reclaimed
50	10	en	abstract	The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.
51	10		categoryIds	[]
53	10	en	copyrightHolder	Public Knowledge Preprint Server
54	10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
55	10		copyrightYear	2023
52	10	en	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
56	11	en	abstract	The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.
57	11		categoryIds	[]
59	11	en	copyrightHolder	Public Knowledge Preprint Server
60	11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
61	11		copyrightYear	2023
58	11	en	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
62	12	en	abstract	Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.
63	12		categoryIds	[]
65	12	en	copyrightHolder	Public Knowledge Preprint Server
66	12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
67	12		copyrightYear	2023
64	12	en	title	Learning Sustainable Design through Service
68	13	en	abstract	The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P<0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.
69	13		categoryIds	[]
71	13	en	copyrightHolder	Public Knowledge Preprint Server
72	13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
73	13		copyrightYear	2023
70	13	en	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
75	14		categoryIds	[]
76	14	en	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
74	14	en	abstract	The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.
77	14	en	copyrightHolder	Public Knowledge Preprint Server
78	14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
79	14		copyrightYear	2023
80	15	en	abstract	One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.
81	15		categoryIds	[]
83	15	en	copyrightHolder	Public Knowledge Preprint Server
84	15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
85	15		copyrightYear	2023
82	15	en	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
86	16	en	abstract	This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.
87	16		categoryIds	[]
89	16	en	copyrightHolder	Public Knowledge Preprint Server
90	16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
91	16		copyrightYear	2023
88	16	en	title	Yam diseases and its management in Nigeria
93	17		categoryIds	[]
94	17	en	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
92	17	en	abstract	Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.
95	17	en	copyrightHolder	Public Knowledge Preprint Server
96	17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
97	17		copyrightYear	2023
98	18	en	abstract	The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.
99	18		categoryIds	[]
101	18	en	copyrightHolder	Public Knowledge Preprint Server
102	18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
103	18		copyrightYear	2023
100	18	en	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
104	19	en	abstract	We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.
105	19		categoryIds	[]
107	19	en	copyrightHolder	Public Knowledge Preprint Server
108	19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
109	19		copyrightYear	2023
106	19	en	title	Self-Organization in Multi-Level Institutions in Networked Environments
110	20	en	abstract	None.
111	20		categoryIds	[]
113	20	en	copyrightHolder	Public Knowledge Preprint Server
114	20	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
115	20		copyrightYear	2023
112	20	en	title	Finocchiaro: Arguments About Arguments
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, primary_contact_id, section_id, submission_id, status, url_path, version, doi_id) FROM stdin;
1	0	\N	2023-04-15 05:27:33	1	1	1	1	\N	1	\N
18	0	2023-04-15	2023-04-15 05:38:18	24	1	17	3	\N	1	\N
2	0	2023-04-15	2023-04-15 05:29:14	2	1	2	3	\N	1	\N
19	0	2023-04-15	2023-04-15 05:38:51	25	1	18	3	\N	1	\N
3	0	2023-04-15	2023-04-15 05:30:01	5	1	3	3	\N	1	\N
4	0	2023-04-15	2023-04-15 05:30:11	7	1	3	3	\N	2	\N
5	0	\N	2023-04-15 05:30:21	9	1	4	1	\N	1	\N
20	0	2023-04-15	2023-04-15 05:39:23	26	1	19	3	\N	1	\N
6	0	2023-04-15	2023-04-15 05:31:48	10	1	5	3	\N	1	\N
7	0	2023-04-15	2023-04-15 05:32:20	11	1	6	3	\N	1	\N
8	0	2023-04-15	2023-04-15 05:32:52	12	1	7	3	\N	1	\N
9	0	2023-04-15	2023-04-15 05:33:24	14	1	8	3	\N	1	\N
10	0	2023-04-15	2023-04-15 05:33:56	15	1	9	3	\N	1	\N
11	0	2023-04-15	2023-04-15 05:34:29	16	1	10	3	\N	1	\N
12	0	2023-04-15	2023-04-15 05:35:02	17	1	11	3	\N	1	\N
13	0	2023-04-15	2023-04-15 05:35:35	19	1	12	3	\N	1	\N
14	0	2023-04-15	2023-04-15 05:36:08	20	1	13	3	\N	1	\N
15	0	2023-04-15	2023-04-15 05:36:41	21	1	14	3	\N	1	\N
16	0	2023-04-15	2023-04-15 05:37:13	22	1	15	3	\N	1	\N
17	0	2023-04-15	2023-04-15 05:37:46	23	1	16	3	\N	1	\N
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

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, considered, request_resent) FROM stdin;
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
1	PKP\\task\\StatisticsReport	2023-04-15 05:24:28
2	PKP\\task\\RemoveUnvalidatedExpiredUsers	2023-04-15 05:24:28
3	PKP\\task\\UpdateIPGeoDB	2023-04-15 05:24:28
4	APP\\tasks\\UsageStatsLoader	2023-04-15 05:24:30
5	PKP\\task\\ProcessQueueJobs	2023-04-15 05:24:30
6	PKP\\task\\RemoveFailedJobs	2023-04-15 05:24:30
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

COPY public.server_settings (server_setting_id, server_id, locale, setting_name, setting_value, setting_type) FROM stdin;
8	1	fr_CA	beginSubmissionHelp	##default.submission.step.beforeYouBegin##	\N
11	1	en	contributorsHelp	<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>	\N
12	1	fr_CA	contributorsHelp	##default.submission.step.contributors##	\N
13	1		country	IS	\N
14	1		defaultReviewMode	2	\N
15	1	en	description	<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>	\N
16	1	fr_CA	description	<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l'accès du public à la science.</p>	\N
17	1	en	detailsHelp	<p>Please provide the following details to help us manage your submission in our system.</p>	\N
18	1	fr_CA	detailsHelp	##default.submission.step.details##	\N
19	1		copySubmissionAckPrimaryContact	0	\N
20	1		copySubmissionAckAddress		\N
21	1		emailSignature	<br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>	\N
22	1		enableDois	1	\N
23	1		doiSuffixType	default	\N
24	1		registrationAgency		\N
25	1		disableSubmissions	0	\N
26	1		editorialStatsEmail	1	\N
27	1	en	forTheEditorsHelp	<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>	\N
28	1	fr_CA	forTheEditorsHelp	##default.submission.step.forTheEditors##	\N
29	1		itemsPerPage	25	\N
30	1		keywords	request	\N
31	1	en	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source system is suitable for libraries to host for their faculty members to use (see <a href="https://pkp.sfu.ca">Public Knowledge Project</a>).	\N
32	1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##	\N
33	1	en	name	Public Knowledge Preprint Server	\N
34	1	fr_CA	name	Serveur de prépublication de la connaissance du public	\N
35	1		notifyAllAuthors	1	\N
36	1		numPageLinks	10	\N
37	1		numWeeksPerResponse	4	\N
38	1		numWeeksPerReview	4	\N
39	1	en	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	\N
40	1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##	\N
41	1	en	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>	\N
42	1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##	\N
43	1	en	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	\N
44	1	fr_CA	readerInformation	##default.contextSettings.forReaders##	\N
45	1	en	reviewHelp	<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>	\N
1	1	en	acronym	JPKPKP	\N
4	1	fr_CA	authorGuidelines	##default.contextSettings.authorGuidelines##	\N
5	1	en	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.	\N
6	1	fr_CA	authorInformation	##default.contextSettings.forAuthors##	\N
7	1	en	beginSubmissionHelp	<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href="http://localhost/index.php/publicknowledge/about/submissions" target="_blank">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>	\N
9	1		contactEmail	rvaca@mailinator.com	\N
10	1		contactName	Ramiro Vaca	\N
72	1		supportName	Ramiro Vaca	\N
54	1		themePluginPath	default	\N
55	1	en	uploadFilesHelp	<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>	\N
56	1	fr_CA	uploadFilesHelp	##default.submission.step.uploadFiles##	\N
57	1		enableGeoUsageStats	disabled	\N
58	1		enableInstitutionUsageStats	0	\N
59	1		isSushiApiPublic	1	\N
69	1	en	abbreviation	publicknowledgePub Know Pre	\N
62	1		enableAuthorScreening	0	\N
63	1		enabledDoiTypes	["publication"]	\N
64	1		postedAcknowledgement	1	\N
65	1		enableOai	1	\N
66	1		doiVersioning	1	\N
3	1	en	authorGuidelines	<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study's country.</p><p> When you're satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>	\N
67	1	en	customHeaders	<meta name="pkp" content="Test metatag.">	\N
70	1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada	\N
46	1	fr_CA	reviewHelp	##default.submission.step.review##	\N
68	1	en	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.	\N
47	1		submissionAcknowledgement	allAuthors	\N
49	1	fr_CA	submissionChecklist	##default.contextSettings.checklist##	\N
48	1	en	submissionChecklist	<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href="http://localhost/index.php/publicknowledge/about/submissions">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>	\N
50	1		submitWithCategories	0	\N
51	1		supportedFormLocales	["en","fr_CA"]	\N
52	1		supportedLocales	["en","fr_CA"]	\N
53	1		supportedSubmissionLocales	["en","fr_CA"]	\N
71	1		supportEmail	rvaca@mailinator.com	\N
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
aeflnd0fbtp8f4prriq054ca87	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536289	1681536314	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536314;s:5:"token";s:32:"b9cf34bcf322d9ed4635332490c135cd";}	localhost
m9jh3h36dv0pc9m24ttp9ru05k	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536396	1681536407	0	username|s:5:"rvaca";csrf|a:2:{s:9:"timestamp";i:1681536406;s:5:"token";s:32:"6577bd69d4cfdb1d7cb35a658ca7126e";}	localhost
kfr9tbo4fjhf5srs4ol68j7shs	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536268	1681536288	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536289;s:5:"token";s:32:"6b75225d76c8f20488b1c616204b1fe8";}	localhost
93295nceb071vjeoua17ts35ej	8	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536471	1681536546	0	csrf|a:2:{s:9:"timestamp";i:1681536546;s:5:"token";s:32:"ba7ca21ae66c39a187d4f4c729e07d37";}username|s:8:"ckwantes";userId|i:8;	localhost
ik3ff8ual8pgi5bo1al2hjeu2n	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536420	1681536444	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536444;s:5:"token";s:32:"6cdb1b45c94c223dc3e5acb79c8f5bca";}	localhost
nq62bms82ivm0v9aiiit03bdha	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536317	1681536343	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536343;s:5:"token";s:32:"8aa934f4dd4ca3fd44484e64434f0197";}	localhost
8unv2gb4n24i5g2jgs8u2fauth	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536345	1681536353	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536353;s:5:"token";s:32:"2d5ebe00b052561f2440c65374a7c5a6";}	localhost
8u6pnst29bdncj8304rt567tf7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536356	1681536396	0	username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536395;s:5:"token";s:32:"5dced64b7d925f42232036cd2ce961d1";}	localhost
25d8lr6nsoaq6l4sd4f7gv9r36	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536410	1681536419	0	userId|i:1;username|s:5:"admin";csrf|a:2:{s:9:"timestamp";i:1681536419;s:5:"token";s:32:"97def02f1ed8cb9d2812ecdb5cab8cdc";}	localhost
2v4s8hm9rctccu9b3j2t4nists	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536547	1681536555	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536555;s:5:"token";s:32:"a0ac5880bc957b243db2773ee200faa8";}	localhost
mk1hagj57dm4v0v1m6ckn39ejh	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536447	1681536468	0	csrf|a:2:{s:9:"timestamp";i:1681536468;s:5:"token";s:32:"d98fbb665744fb8783464d88cad2dd89";}username|s:7:"ccorino";userId|i:7;	localhost
ija44kmkan8cdhv7tniucmgmis	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536580	1681536588	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536588;s:5:"token";s:32:"51619e7673e44144f6713ab27cf94fd4";}	localhost
739tadraq0rvgu9b2lgdr5kpj9	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536558	1681536580	0	csrf|a:2:{s:9:"timestamp";i:1681536579;s:5:"token";s:32:"19b586a3fd85272c6f11ab9f75aff8f3";}username|s:12:"cmontgomerie";	localhost
gpchtvcdf08c0rojll83sl54np	10	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536615	1681536635	0	csrf|a:2:{s:9:"timestamp";i:1681536635;s:5:"token";s:32:"55af1d3246800a7ecae39d8093794a6e";}username|s:6:"ddiouf";userId|i:10;	localhost
2vf2ibr6iimpor04ecomsfo8o4	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536589	1681536612	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536613;s:5:"token";s:32:"7217bc47d76a3a54b42894aee1d0294b";}	localhost
ulm8vmvimkkp0pd68d0pd1qbln	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536636	1681536665	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536665;s:5:"token";s:32:"70c5253e1a320cd3dbb4634cb08fe8ba";}	localhost
lfu8i9gu68vi7hoogucnuri3vt	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536668	1681536688	0	csrf|a:2:{s:9:"timestamp";i:1681536688;s:5:"token";s:32:"fb7e380c5539c9a5dc8658eed5762f8e";}username|s:9:"dphillips";	localhost
900j0p6mt7soo44hf39tepgopb	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536688	1681536697	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536697;s:5:"token";s:32:"3e8f18b6fa02981b9cc5a0ab9c66d009";}	localhost
hvjcb0as6vsbd9g07q1b1ppjke	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536697	1681536703	0	username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536703;s:5:"token";s:32:"6f61e07e6fac583a0b1876899394a76a";}	localhost
6n94ek56p8j3ioraivhlvu379p	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536704	1681536709	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536710;s:5:"token";s:32:"2032f12e4a96f15eb35f2e646c755232";}	localhost
tggp2o0ib6p9fbp9v609nn90pm	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536712	1681536733	0	csrf|a:2:{s:9:"timestamp";i:1681536732;s:5:"token";s:32:"b18fbb6bb0fdd74d8162aee27d8edd8d";}username|s:9:"dsokoloff";	localhost
558v4jfsp62kee9rqr9ouiirg5	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536765	1681536773	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536774;s:5:"token";s:32:"bdb353b3749e0f940679e756ab03b6da";}	localhost
7upbl1catl3lq2ivvghqki7gui	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536906	1681536927	0	csrf|a:2:{s:9:"timestamp";i:1681536927;s:5:"token";s:32:"03dd73f8dca86dbf9dfcbe2250fa859d";}username|s:12:"lchristopher";	localhost
p2okg85376f6i0fhudq7g0m6ca	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536808	1681536829	0	csrf|a:2:{s:9:"timestamp";i:1681536829;s:5:"token";s:32:"664601f04589e65a0dffadaa818ddaa8";}username|s:10:"jmwandenga";	localhost
8t114k5c7rqn35dq7go9nfc19m	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536840	1681536861	0	csrf|a:2:{s:9:"timestamp";i:1681536861;s:5:"token";s:32:"670df43960551db9167e9afcea683ea2";}username|s:6:"jnovak";	localhost
qatfoc6ths4090hmnfovefamua	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536776	1681536797	0	csrf|a:2:{s:9:"timestamp";i:1681536796;s:5:"token";s:32:"c7aab881669aa9296e629e209316375c";}username|s:9:"fpaglieri";	localhost
apfgg706q2tvfrlbaab03ng936	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536733	1681536741	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536742;s:5:"token";s:32:"f610eb3d1ab32e99dcc21a12335e77ca";}	localhost
8go71dkfkh589nrdlmt1ij11cr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536894	1681536903	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536903;s:5:"token";s:32:"c219a2baf5c572bd40bbcb14bb7a61cd";}	localhost
63vjpi325frgcg0flv8e2gtlm4	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536744	1681536765	0	csrf|a:2:{s:9:"timestamp";i:1681536765;s:5:"token";s:32:"23670e0d8cc70508ca43fa58f916317e";}username|s:7:"eostrom";	localhost
6j9eh18sad0pkn9r36jr5te9va	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536829	1681536837	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536837;s:5:"token";s:32:"8301a1755d8130c341bedeadb263e290";}	localhost
6q2m2nv73i59ltlb5fu74s1fsp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536797	1681536805	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536805;s:5:"token";s:32:"71d9171b41ba658ecca09b256490fe8e";}	localhost
qqi7o53pb7aojtv9jjoi8htqte	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536873	1681536894	0	csrf|a:2:{s:9:"timestamp";i:1681536894;s:5:"token";s:32:"33e6e62bca2a832a20702f78cf449a94";}username|s:10:"kalkhafaji";	localhost
qqns935bvihrn09nj70gfkrnrv	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537005	1681537026	0	csrf|a:2:{s:9:"timestamp";i:1681537025;s:5:"token";s:32:"14939c01d853e33199f0fe5e91188d69";}username|s:8:"rbaiyewu";	localhost
qi8ra2qltr351ai20j8fsg125h	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536862	1681536870	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536870;s:5:"token";s:32:"310b86291ab1addf7bed4cb3fd6436ad";}	localhost
457if9r44ft4op3k5lt3kkhdi1	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536939	1681536960	0	csrf|a:2:{s:9:"timestamp";i:1681536960;s:5:"token";s:32:"4b36ba609a08e39fcfac89295b8861df";}username|s:8:"lkumiega";	localhost
msudfcj98d1v7bkjeafadt3mef	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536927	1681536936	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536936;s:5:"token";s:32:"ca3b4820068cfa52902cb990aa031a91";}	localhost
m4otj0mioejvahd434umasou0o	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536960	1681536969	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681536969;s:5:"token";s:32:"15e5c982c6dabfc44e7c2c14e28609ce";}	localhost
hqk5tuj1mkr88uvf95u0phbgrh	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536993	1681537002	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681537002;s:5:"token";s:32:"213b6141eeafd9cd92d81627c6527e5d";}	localhost
gb005ccp9m6snkftbd5m3mrudv	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681536972	1681536993	0	csrf|a:2:{s:9:"timestamp";i:1681536993;s:5:"token";s:32:"cf7b337cf2716ea444b5c5e05e4963cc";}username|s:7:"pdaniel";	localhost
3esjl3inn7m4csoo05rcsnu1qo	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537026	1681537035	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681537035;s:5:"token";s:32:"19e3d6a7bea616d5fb67e209376fac9a";}	localhost
v3k109g9ivv5ksoimuk1jaspgd	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537037	1681537058	0	csrf|a:2:{s:9:"timestamp";i:1681537058;s:5:"token";s:32:"6df8da4c0ce9c7780224f77e9f767575";}username|s:6:"rrossi";	localhost
7rgq4aq7hfldiu3476dskqu3rb	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537058	1681537067	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681537067;s:5:"token";s:32:"39282632fd9d54b159a3089fc3510d67";}	localhost
thbp4sir1q64n8do9g3fuard5v	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537070	1681537090	0	csrf|a:2:{s:9:"timestamp";i:1681537090;s:5:"token";s:32:"e98018155aa82acee02aa28a73d83e1c";}username|s:12:"vkarbasizaed";	localhost
9kp0r91c05p3rgun0mfuhq3usi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537134	1681537155	0	csrf|a:2:{s:9:"timestamp";i:1681537155;s:5:"token";s:32:"ef23e4d035d16a9e6662ce1d12948ba5";}username|s:6:"zwoods";	localhost
t84faob6hhfnbnail8fjjd3an9	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537102	1681537122	0	csrf|a:2:{s:9:"timestamp";i:1681537122;s:5:"token";s:32:"69fec8ed778fc7389ad29b087431b651";}username|s:11:"vwilliamson";	localhost
5lf6oj8gm4tb4stm56l6h6cv5d	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537155	1681537164	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681537164;s:5:"token";s:32:"1959105b16fbca97c549c08656e01778";}	localhost
74mpijc33a6ds7p1sqvp46po53	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537091	1681537099	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681537099;s:5:"token";s:32:"93f5c5ff450a8472e8fa5f5d27851823";}	localhost
mglf6dctqruegk8rp1hmudvsb0	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36	1681537123	1681537132	0	userId|i:3;username|s:7:"dbarnes";csrf|a:2:{s:9:"timestamp";i:1681537132;s:5:"token";s:32:"f5c755b9449fc60ec8b124d96225c6f9";}	localhost
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
10	themePluginPath		default
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
1	1	4	7	2023-04-15 05:27:48	0	1
2	1	3	4	2023-04-15 05:27:48	0	1
3	1	3	5	2023-04-15 05:27:48	0	1
49	17	4	23	2023-04-15 05:38:10	0	1
50	17	3	4	2023-04-15 05:38:10	0	1
4	2	4	8	2023-04-15 05:28:59	0	1
5	2	3	4	2023-04-15 05:28:59	0	1
6	2	3	5	2023-04-15 05:28:59	0	1
51	17	3	5	2023-04-15 05:38:10	0	1
7	3	4	9	2023-04-15 05:29:39	0	1
8	3	3	4	2023-04-15 05:29:39	0	1
9	3	3	5	2023-04-15 05:29:39	0	1
10	4	4	10	2023-04-15 05:30:35	0	1
11	4	3	4	2023-04-15 05:30:35	0	1
12	4	3	5	2023-04-15 05:30:35	0	1
52	18	4	24	2023-04-15 05:38:42	0	1
53	18	3	4	2023-04-15 05:38:42	0	1
13	5	4	11	2023-04-15 05:31:28	0	1
14	5	3	4	2023-04-15 05:31:28	0	1
15	5	3	5	2023-04-15 05:31:28	0	1
54	18	3	5	2023-04-15 05:38:42	0	1
16	6	4	12	2023-04-15 05:32:12	0	1
17	6	3	4	2023-04-15 05:32:12	0	1
18	6	3	5	2023-04-15 05:32:12	0	1
19	7	4	13	2023-04-15 05:32:44	0	1
20	7	3	4	2023-04-15 05:32:44	0	1
21	7	3	5	2023-04-15 05:32:44	0	1
55	19	4	25	2023-04-15 05:39:14	0	1
56	19	3	4	2023-04-15 05:39:14	0	1
22	8	4	14	2023-04-15 05:33:16	0	1
23	8	3	4	2023-04-15 05:33:16	0	1
24	8	3	5	2023-04-15 05:33:16	0	1
57	19	3	5	2023-04-15 05:39:14	0	1
25	9	4	15	2023-04-15 05:33:48	0	1
26	9	3	4	2023-04-15 05:33:48	0	1
27	9	3	5	2023-04-15 05:33:48	0	1
28	10	4	16	2023-04-15 05:34:20	0	1
29	10	3	4	2023-04-15 05:34:21	0	1
30	10	3	5	2023-04-15 05:34:21	0	1
31	11	4	17	2023-04-15 05:34:53	0	1
32	11	3	4	2023-04-15 05:34:53	0	1
33	11	3	5	2023-04-15 05:34:53	0	1
34	12	4	18	2023-04-15 05:35:26	0	1
35	12	3	4	2023-04-15 05:35:26	0	1
36	12	3	5	2023-04-15 05:35:26	0	1
37	13	4	19	2023-04-15 05:35:59	0	1
38	13	3	4	2023-04-15 05:35:59	0	1
39	13	3	5	2023-04-15 05:35:59	0	1
40	14	4	20	2023-04-15 05:36:33	0	1
41	14	3	4	2023-04-15 05:36:33	0	1
42	14	3	5	2023-04-15 05:36:33	0	1
43	15	4	21	2023-04-15 05:37:05	0	1
44	15	3	4	2023-04-15 05:37:05	0	1
45	15	3	5	2023-04-15 05:37:05	0	1
46	16	4	22	2023-04-15 05:37:37	0	1
47	16	3	4	2023-04-15 05:37:37	0	1
48	16	3	5	2023-04-15 05:37:37	0	1
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

COPY public.submission_file_settings (submission_file_setting_id, submission_file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	1	en	name	The influence of lactation on the quantity and quality of cashmere production.pdf	string
2	1	fr_CA	name		string
3	2	en	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf	string
4	2	fr_CA	name		string
5	3	en	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf	string
6	3	fr_CA	name		string
7	4	en	name	Genetic transformation of forest trees.pdf	string
8	4	fr_CA	name		string
9	5	en	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement.pdf	string
10	5	fr_CA	name		string
11	6	en	name	Developing efficacy beliefs in the classroom.pdf	string
12	6	fr_CA	name		string
13	7	en	name	Developing efficacy beliefs in the classroom.pdf	string
14	7	fr_CA	name		string
15	8	en	name	Hansen & Pinto: Reason Reclaimed.pdf	string
16	8	fr_CA	name		string
17	9	en	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf	string
18	9	fr_CA	name		string
19	10	en	name	Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf	string
20	10	fr_CA	name		string
21	11	en	name	Learning Sustainable Design through Service.pdf	string
22	11	fr_CA	name		string
23	12	en	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf	string
24	12	fr_CA	name		string
25	13	en	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf	string
26	13	fr_CA	name		string
27	14	en	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf	string
28	14	fr_CA	name		string
29	15	en	name	Yam diseases and its management in Nigeria.pdf	string
30	15	fr_CA	name		string
31	16	en	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf	string
32	16	fr_CA	name		string
33	17	en	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf	string
34	17	fr_CA	name		string
35	18	en	name	Self-Organization in Multi-Level Institutions in Networked Environments.pdf	string
36	18	fr_CA	name		string
37	19	en	name	Finocchiaro: Arguments About Arguments.pdf	string
38	19	fr_CA	name		string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_files (submission_file_id, submission_id, file_id, source_submission_file_id, genre_id, file_stage, direct_sales_price, sales_type, viewable, created_at, updated_at, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	1	\N	1	10	\N	\N	\N	2023-04-15 05:27:44	2023-04-15 05:27:47	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2023-04-15 05:28:31	2023-04-15 05:28:33	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2023-04-15 05:29:35	2023-04-15 05:29:37	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2023-04-15 05:30:32	2023-04-15 05:30:34	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2023-04-15 05:31:24	2023-04-15 05:31:27	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2023-04-15 05:32:09	2023-04-15 05:32:11	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2023-04-15 05:32:40	2023-04-15 05:32:43	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2023-04-15 05:33:13	2023-04-15 05:33:15	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2023-04-15 05:33:45	2023-04-15 05:33:47	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2023-04-15 05:34:17	2023-04-15 05:34:19	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2023-04-15 05:34:49	2023-04-15 05:34:52	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2023-04-15 05:35:23	2023-04-15 05:35:25	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2023-04-15 05:35:56	2023-04-15 05:35:58	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2023-04-15 05:36:29	2023-04-15 05:36:31	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2023-04-15 05:37:02	2023-04-15 05:37:04	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2023-04-15 05:37:34	2023-04-15 05:37:36	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2023-04-15 05:38:06	2023-04-15 05:38:09	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2023-04-15 05:38:39	2023-04-15 05:38:41	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2023-04-15 05:39:11	2023-04-15 05:39:13	25	521	20
\.


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
1	carlo
2	corino
3	university
4	bologna
5	influence
6	lactation
7	quantity
8	quality
9	cashmere
10	production
11	effects
12	pressed
13	beet
14	pulp
15	silage
16	pbps
17	replacing
18	barley
19	basis
20	studied
21	heavy
22	pigs
23	fed
24	dairy
25	whey-diluted
26	diets
27	hypor
28	average
29	initial
30	weight
31	barrows
32	gilts
33	homogeneously
34	allocated
35	exper-
36	imental
37	groups
38	control
39	traditional
40	sweet
41	whey-
42	diluted
43	diet
44	ratio
45	whey
46	dry
47	matter
48	replaced
49	period
50	beginning
51	133rd
52	day
53	trial
54	experimental
55	feed
56	group
57	significant
58	differences
59	observed
60	growth
61	parameters
62	adg
63	fcr
64	contain-
65	ing
66	showed
67	significantly
68	higher
69	percentages
70	lean
71	cuts
72	lower
73	fat
74	ham
75	losses
76	seasoning
77	moderate
78	marked
79	pbps-fed
80	prob-
81	consequence
82	adiposity
83	degree
84	fatty
85	acid
86	composition
87	unaffected
88	regard
89	semimembranosus
90	colour
91	receiving
92	chroma
93	values
94	economical
95	point
96	view
97	concluded
98	partially
99	pig
100	interest
101	areas
102	products
103	readily
104	catherine
105	kwantes
106	windsor
107	facets
108	job
109	satisfaction
110	nine-nation
111	comparative
112	study
113	construct
114	equivalence
115	archival
116	data
117	attitude
118	survey
119	employees
120	single
121	multinational
122	organization
123	examine
124	national
125	culture
126	affects
127	nature
128	responses
129	countries
130	compiled
131	create
132	benchmark
133	nations
134	individually
135	compared
136	factor
137	analysis
138	revealed
139	factors
140	organizational
141	communication
142	efficiency
143	effectiveness
144	support
145	personal
146	benefit
147	comparisons
148	structures
149	exhibited
150	satisfied
151	china
152	brazil
153	consistent
154	previous
155	findings
156	individuals
157	collectivistic
158	report
159	research
160	suggest
161	cultural
162	context
163	exerts
164	effect
165	urho
166	kekkonen
167	craig
168	montgomerie
169	alberta
170	computer
171	skill
172	requirements
173	existing
174	teachers
175	implications
176	policy
177	practice
178	integration
179	technology
180	classroom
181	major
182	issue
183	education
184	today
185	provincial
186	initiatives
187	skills
188	students
189	demonstrate
190	grade
191	level
192	government
193	province
194	canada
195	mandated
196	implementation
197	curriculum
198	began
199	september
200	called
201	information
202	infused
203	core
204	courses
205	specifies
206	“expected
207	respect
208	technology”
209	learning
210	required
211	implement
212	school
213	jurisdictions
214	turning
215	professional
216	development
217	strategies
218	hiring
219	standards
220	upgrade
221	teachers’
222	meet
223	goal
224	paper
225	summarizes
226	results
227	telephone
228	administered
229	public
230	response
231	rate
232	examined
233	require
234	newly
235	hired
236	employed
237	integrating
238	mark
239	irvine
240	victoria
241	diaga
242	diouf
243	alexandria
244	genetic
245	transformation
246	forest
247	trees
248	review
249	recent
250	progress
251	discussed
252	applications
253	engineering
254	improving
255	understanding
256	mechanisms
257	governing
258	genes
259	expression
260	woody
261	plants
262	dana
263	phillips
264	toronto
265	investigating
266	shared
267	background
268	argument
269	critique
270	fogelins
271	thesis
272	deep
273	disagreement
274	robert
275	fogelin
276	claims
277	interlocutors
278	share
279	framework
280	beliefs
281	commitments
282	order
283	fruitfully
284	pursue
285	refute
286	fogelin’s
287	claim
288	productive
289	find
290	consists
291	common
292	topic
293	hand
294	pro-cedural
295	competencies
296	supporters
297	mistakenly
298	part
299	procedural
300	com-mitments
301	difficult
302	uphold
303	people’s
304	diverge
305	widely
306	domatilia
307	sokoloff
308	college
309	cork
310	developing
311	efficacy
312	equip
313	children
314	knowledge
315	self-belief
316	confident
317	informed
318	citizens
319	continue
320	learners
321	graduation
322	key
323	role
324	nurturing
325	learn
326	participate
327	society
328	conducted
329	social
330	studies
331	presented
332	showing
333	strategy
334	instruction
335	enhance
336	self-efficacy
337	creative
338	problem
339	solving
340	cps
341	taught
342	means
343	motivate
344	shown
345	positive
346	valuable
347	involve
348	decision-making
349	leads
350	action
351	enhancing
352	motivation
353	citizenship
354	elinor
355	ostrom
356	indiana
357	commons
358	expe-
359	rienced
360	substantial
361	past
362	decades1
363	distinguished
364	scholars
365	disciplines
366	long
367	specific
368	resources
369	managed
370	mismanaged
371	times
372	places
373	coward
374	los
375	reyes
376	mackenzie
377	wittfogel
378	researchers
379	mid-1980s
380	contemporary
381	colleagues
382	work
383	sec-
384	tors
385	region
386	regions
387	world
388	pool
389	resource
390	property
391	intellectual
392	developments
393	frank
394	van
395	laerhoven
396	fabio
397	paglieri
398	rome
399	hansen
400	pinto
401	reason
402	reclaimed
403	john
404	mwandenga
405	cape
406	town
407	signalling
408	theory
409	dividends
410	literature
411	empirical
412	evidence
413	signaling
414	suggests
415	signal
416	future
417	prospects
418	firm
419	offer
420	conclusive
421	conflicting
422	financial
423	economists
424	practical
425	dividend
426	guidance
427	management
428	potential
429	investors
430	shareholding
431	corporate
432	investment
433	financing
434	distribution
435	decisions
436	continuous
437	function
438	rely
439	intuitive
440	evaluation
441	novak
442	aalborg
443	condensing
444	water
445	availability
446	models
447	focus
448	systems
449	texas
450	modeling
451	system
452	routinely
453	applied
454	administration
455	rights
456	permit
457	regional
458	statewide
459	planning
460	expanding
461	variety
462	endeavors
463	river
464	basins
465	state
466	reflects
467	permits
468	reservoirs
469	datasets
470	necessarily
471	large
472	complex
473	provide
474	decision-support
475	capabilities
476	developed
477	features
478	added
479	types
480	growing
481	enhanced
482	simplifying
483	simulation
484	input
485	methodology
486	condensed
487	dataset
488	selected
489	reservoir
490	impacts
491	accompanying
492	removed
493	original
494	complete
495	set
496	streamflows
497	represents
498	flows
499	basin
500	contained
501	model
502	included
503	develop
504	brazos
505	authority
506	based
507	modifying
508	karim
509	al-khafaji
510	stanford
511	sustainable
512	design
513	service
514	environmental
515	sustainability
516	principles
517	vital
518	topics
519	largely
520	failed
521	address
522	service-learning
523	integrates
524	academic
525	setting
526	emerging
527	tool
528	leveraged
529	teach
530	engineers
531	present
532	experiences
533	chapter
534	involves
535	identification
536	projects
537	partner
538	organizations
539	student
540	led
541	project-based
542	internships
543	coordinated
544	successful
545	limitations
546	challenges
547	exist
548	directions
549	margaret
550	morse
551	leo
552	christopher
553	australian
554	sodium
555	butyrate
556	improves
557	performance
558	weaned
559	piglets
560	weaning
561	aim
562	assess
563	long-term
564	supplementation
565	profile
566	adipose
567	tissue
568	fifty-four
569	white
570	averaging
571	randomized
572	matched
573	weights
574	isoenergetic
575	supplemented
576	tallow
577	maize
578	oil
579	rapeseed
580	fats
581	supplement-
582	slaughtering
583	slaughter
584	backfat
585	samples
586	collected
587	ten
588	animals
589	treatment
590	analyzed
591	close-
592	reflected
593	highest
594	saturated
595	content
596	sfa
597	polyunsaturated
598	pufa
599	lowest
600	monounsaturated
601	mufa
602	linolenic
603	c18
604	cis
605	11-
606	ecosenoic
607	c20
608	linoleic
609	levels
610	iodine
611	result-
612	accepted
613	parma
614	consortium
615	dry-cured
616	unsaturation
617	index
618	layers
619	subcutaneous
620	differed
621	treatments
622	show
623	dietary
624	increases
625	proportion
626	“healthy”
627	acids
628	nutritional
629	technological
630	carefully
631	assessed
632	food
633	security
634	lise
635	kumiega
636	hydrologic
637	connectivity
638	edwards
639	aquifer
640	san
641	marcos
642	springs
643	barton
644	drought
645	conditions
646	serves
647	primary
648	supply
649	south-central
650	source
651	plan
652	protect
653	endangered
654	species
655	immediately
656	downstream
657	questions
658	raised
659	established
660	concept
661	divide
662	antonio
663	segments
664	water-level
665	collection
666	program
667	hydrogeologic
668	groundwater-level
669	groundwater
670	exists
671	vicinity
672	surface
673	drainage
674	onion
675	creek
676	blanco
677	wet
678	normal
679	dissipated
680	longer
681	hydrologically
682	separated
683	result
684	flow
685	droughts
686	bearings
687	assessments
688	simulations
689	numerical
690	cfs
691	flowing
692	appears
693	influenced
694	recharge
695	vulnerable
696	extended
697	periods
698	extensive
699	pumping
700	kyle
701	buda
702	shows
703	low
704	gradient
705	potentiometric
706	variation
707	non-drought
708	slopes
709	north
710	dramatic
711	discontinuity
712	change
713	gradients
714	dynamic
715	unknown
716	structural
717	influences
718	hydraulic
719	properties
720	inherent
721	connection
722	rapid
723	population
724	increased
725	demands
726	necessitates
727	continual
728	monitoring
729	trend
730	analyses
731	patricia
732	daniel
733	wolverhampton
734	designing
735	intercultural
736	case
737	atlantic
738	coast
739	nicaragua
740	met
741	21st
742	century
743	genuinely
744	embracing
745	diversity
746	overcome
747	barriers
748	people
749	language
750	gender
751	takes
752	multilingual
753	multiethnic
754	examines
755	community
756	uraccan
757	contributing
758	interculturality
759	describes
760	participatory
761	carried
762	staff
763	intention
764	defining
765	delivering
766	discussions
767	wales
768	council
769	emphasises
770	belonging
771	individual
772	communities
773	cultures
774	time
775	supporting
776	include
777	university’s
778	close
779	involvement
780	ethnic
781	ethno-linguistic
782	power
783	relations
784	country
785	militate
786	egalitarianism
787	highlights
788	importance
789	pedagogy
790	promoting
791	achieving
792	lasting
793	rana
794	baiyewu
795	nairobi
796	yam
797	diseases
798	nigeria
799	presents
800	combating
801	menace
802	field
803	storage
804	anthracnose
805	regarded
806	spread
807	mosaic
808	virus
809	disease
810	considered
811	severe
812	yams
813	rot
814	devastating
815	reduction
816	marketable
817	edible
818	portions
819	tubers
820	reductions
821	stored
822	adopted
823	advocated
824	includes
825	crop
826	rotation
827	fallowing
828	planting
829	healthy
830	material
831	destruction
832	infected
833	cultivars
834	resistant
835	tecto
836	thiabendazole
837	locally
838	made
839	gins
840	wood
841	ash
842	found
843	fungal
844	infection
845	finally
846	processing
847	chips
848	cubes
849	shelf
850	live
851	months
852	year
853	rosanna
854	rossi
855	barcelona
856	nutrition
857	general
858	situation
859	cattle
860	slaughtered
861	cameroon
862	representative
863	central
864	african
865	sub-region
866	safety
867	beef
868	abattoir
869	yaoundé
870	largest
871	january
872	march
873	pre-slaughter
874	characteristics
875	carcasses
876	recorded
877	longissimus
878	thoracis
879	represent
880	bulls
881	origin
882	guinea
883	high
884	savannah
885	transhumance
886	gudali
887	fulani
888	red
889	mbororo
890	breeds
891	predominant
892	carcass
893	affected
894	rearing
895	category
896	markedly
897	varied
898	meat
899	similar
900	toughest
901	cows
902	pregnant
903	abnormal
904	encountered
905	ectoparasites
906	fatigue
907	lameness
908	fungal-like
909	skin
910	lesions
911	enlarged
912	lymph
913	nodes
914	respiratory
915	distress
916	nodular
917	organs
918	condemned
919	liver
920	flukes
921	completely
922	due
923	tuberculosis
924	lungs
925	aid
926	authorities
927	draw
928	programmes
929	strengthen
930	improve
931	prevent
932	promote
933	trade
934	vajiheh
935	karbasizaed
936	tehran
937	antimicrobial
938	metal
939	resistance
940	plasmid
941	coliforms
942	isolated
943	nosocomial
944	infections
945	hospital
946	isfahan
947	iran
948	patterns
949	profiles
950	enterobacteriacea
951	human
952	faeces
953	fifteen
954	isolates
955	identified
956	escherichia
957	coli
958	remaining
959	kelebsiella
960	pneumoniae
961	seventy
962	percent
963	strains
964	possess
965	multiple
966	antibiotics
967	difference
968	minimal
969	inhibitory
970	concentration
971	mic
972	clinical
973	cases
974	metals
975	tolerant
976	persons
977	relationship
978	pattern
979	conjugative
980	encoding
981	recovered
982	multidrug-resistance
983	valerie
984	williamson
985	self-organization
986	multi-level
987	institutions
988	networked
989	environments
990	compare
991	actors
992	decide
993	sanction
994	sanctions
995	implemented
996	collectively
997	agree
998	actor
999	sanctioned
1000	collective
1001	sanctioning
1002	problematic
1003	difficulty
1004	reaching
1005	consensus
1006	decision
1007	perverse
1008	punishing
1009	contributors
1010	ruled
1011	goverance
1012	zita
1013	woods
1014	cuny
1015	finocchiaro
1016	arguments
\.


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_object_keywords (submission_search_object_keyword_id, object_id, keyword_id, pos) FROM stdin;
1	1	1	0
2	1	2	1
3	1	3	2
4	1	4	3
5	2	5	0
6	2	6	1
7	2	7	2
8	2	8	3
9	2	9	4
10	2	10	5
11	3	11	0
12	3	12	1
13	3	13	2
14	3	14	3
15	3	15	4
16	3	16	5
17	3	17	6
18	3	18	7
19	3	19	8
20	3	20	9
21	3	21	10
22	3	22	11
23	3	23	12
24	3	24	13
25	3	25	14
26	3	26	15
27	3	27	16
28	3	22	17
29	3	28	18
30	3	29	19
31	3	30	20
32	3	31	21
33	3	32	22
34	3	33	23
35	3	34	24
36	3	35	25
37	3	36	26
38	3	37	27
39	3	38	28
40	3	22	29
41	3	23	30
42	3	39	31
43	3	40	32
44	3	41	33
45	3	42	34
46	3	43	35
47	3	44	36
48	3	45	37
49	3	46	38
50	3	47	39
51	3	16	40
52	3	48	41
53	3	18	42
54	3	19	43
55	3	49	44
56	3	50	45
57	3	51	46
58	3	52	47
59	3	53	48
60	3	19	49
61	3	16	50
62	3	48	51
63	3	18	52
64	3	19	53
65	3	54	54
66	3	49	55
67	3	26	56
68	3	55	57
69	3	24	58
70	3	25	59
71	3	56	60
72	3	57	61
73	3	58	62
74	3	59	63
75	3	60	64
76	3	61	65
77	3	62	66
78	3	63	67
79	3	22	68
80	3	26	69
81	3	64	70
82	3	65	71
83	3	16	72
84	3	66	73
85	3	67	74
86	3	68	75
87	3	69	76
88	3	70	77
89	3	71	78
90	3	72	79
91	3	69	80
92	3	73	81
93	3	71	82
94	3	74	83
95	3	30	84
96	3	75	85
97	3	76	86
98	3	77	87
99	3	67	88
100	3	78	89
101	3	79	90
102	3	22	91
103	3	80	92
104	3	81	93
105	3	72	94
106	3	82	95
107	3	83	96
108	3	84	97
109	3	85	98
110	3	86	99
111	3	74	100
112	3	73	101
113	3	87	102
114	3	26	103
115	3	88	104
116	3	89	105
117	3	90	106
118	3	22	107
119	3	91	108
120	3	16	109
121	3	66	110
122	3	72	111
123	3	92	112
124	3	93	113
125	3	94	114
126	3	95	115
127	3	96	116
128	3	97	117
129	3	16	118
130	3	98	119
131	3	17	120
132	3	18	121
133	3	24	122
134	3	45	123
135	3	21	124
136	3	99	125
137	3	10	126
138	3	100	127
139	3	101	128
140	3	102	129
141	3	103	130
758	33	241	0
759	33	242	1
760	33	243	2
761	33	3	3
762	34	244	0
763	34	245	1
764	34	246	2
765	34	247	3
766	35	248	0
767	35	249	1
768	35	250	2
769	35	244	3
770	35	245	4
771	35	246	5
772	35	247	6
773	35	251	7
774	35	252	8
775	35	244	9
776	35	253	10
777	35	254	11
778	35	246	12
779	35	247	13
780	35	255	14
781	35	256	15
782	35	257	16
783	35	258	17
784	35	259	18
785	35	260	19
786	35	261	20
944	51	279	5
945	51	267	6
946	51	280	7
947	51	281	8
948	51	282	9
949	51	283	10
950	51	284	11
951	51	268	12
952	51	285	13
953	51	286	14
954	51	287	15
955	51	265	16
956	51	266	17
957	51	267	18
958	51	210	19
959	51	288	20
960	51	268	21
961	51	289	22
962	51	267	23
963	51	290	24
964	51	291	25
965	51	280	26
966	51	292	27
967	51	293	28
968	51	266	29
969	51	294	30
970	51	281	31
971	51	295	32
972	51	160	33
973	51	275	34
974	51	296	35
975	51	297	36
976	51	96	37
977	51	266	38
978	51	280	39
979	51	298	40
980	51	210	41
981	51	267	42
982	51	288	43
983	51	268	44
984	51	299	45
985	51	300	46
986	51	301	47
987	51	302	48
988	51	303	49
989	51	280	50
990	51	304	51
991	51	305	52
992	51	292	53
993	51	293	54
1077	57	306	0
1078	57	307	1
1079	57	3	2
1080	57	308	3
1081	57	309	4
1082	58	310	0
1083	58	311	1
228	9	104	0
229	9	105	1
230	9	3	2
231	9	106	3
232	9	165	4
233	9	166	5
234	10	107	0
235	10	108	1
236	10	109	2
237	10	110	3
238	10	111	4
239	10	112	5
240	10	113	6
241	10	114	7
242	11	115	0
243	11	116	1
244	11	117	2
245	11	118	3
246	11	119	4
247	11	120	5
248	11	121	6
249	11	122	7
250	11	123	8
251	11	83	9
252	11	124	10
253	11	125	11
254	11	126	12
255	11	127	13
256	11	108	14
257	11	109	15
258	11	128	16
259	11	129	17
260	11	130	18
261	11	131	19
262	11	132	20
263	11	133	21
264	11	134	22
265	11	135	23
266	11	136	24
267	11	137	25
268	11	138	26
269	11	139	27
270	11	140	28
271	11	141	29
272	11	140	30
273	11	142	31
274	11	143	32
275	11	140	33
276	11	144	34
277	11	145	35
278	11	146	36
279	11	147	37
280	11	136	38
281	11	148	39
282	11	140	40
283	11	141	41
284	11	149	42
285	11	113	43
286	11	114	44
287	11	145	45
288	11	146	46
289	11	150	47
290	11	119	48
291	11	151	49
292	11	150	50
293	11	152	51
294	11	153	52
295	11	154	53
296	11	155	54
297	11	156	55
298	11	157	56
299	11	133	57
300	11	158	58
301	11	68	59
302	11	109	60
303	11	159	61
304	11	155	62
305	11	160	63
306	11	124	64
307	11	161	65
308	11	162	66
309	11	163	67
310	11	164	68
311	11	127	69
312	11	108	70
313	11	109	71
314	13	119	0
315	13	118	1
1084	58	280	2
1085	58	180	3
1086	59	181	0
1087	59	223	1
1088	59	183	2
1089	59	312	3
1090	59	313	4
1091	59	314	5
1092	59	187	6
1093	59	315	7
1094	59	316	8
1095	59	317	9
1096	59	318	10
1097	59	318	11
1098	59	319	12
1099	59	320	13
1100	59	321	14
1101	59	224	15
1102	59	322	16
1103	59	323	17
1104	59	324	18
1105	59	311	19
1106	59	280	20
1107	59	282	21
1108	59	325	22
1109	59	326	23
1110	59	212	24
1111	59	327	25
1112	59	159	26
1113	59	155	27
1114	59	328	28
1115	59	329	29
1116	59	330	30
1117	59	162	31
1118	59	331	32
1119	59	332	33
1120	59	333	34
1121	59	334	35
1122	59	335	36
1123	59	336	37
1124	59	209	38
1125	59	298	39
1126	59	159	40
1127	59	337	41
1128	59	338	42
1129	59	339	43
1130	59	340	44
1131	59	341	45
1132	59	313	46
1133	59	342	47
1134	59	343	48
1135	59	144	49
1136	59	209	50
1137	59	344	51
1138	59	340	52
1139	59	345	53
1140	59	11	54
1141	59	336	55
1142	59	209	56
1143	59	346	57
1144	59	279	58
1145	59	347	59
1146	59	313	60
1147	59	348	61
1148	59	349	62
1149	59	329	63
1150	59	350	64
1151	59	175	65
1152	59	351	66
3439	145	934	0
3440	145	935	1
3441	145	3	2
3442	145	936	3
3443	146	937	0
3444	146	21	1
3445	146	938	2
3446	146	939	3
3447	146	940	4
3448	146	565	5
3449	146	941	6
3450	146	942	7
3451	146	943	8
3452	146	944	9
3453	146	945	10
3454	146	946	11
3455	146	947	12
3456	147	937	0
3457	147	21	1
3458	147	938	2
3459	147	939	3
3460	147	948	4
3461	147	940	5
3462	147	949	6
1153	59	336	67
1154	59	352	68
1155	59	325	69
1156	59	180	70
1157	59	251	71
1158	61	183	0
1159	61	353	1
3463	147	941	7
3464	147	950	8
3465	147	942	9
3466	147	943	10
3467	147	944	11
3468	147	829	12
3469	147	951	13
3470	147	952	14
3471	147	135	15
3472	147	953	16
3473	147	954	17
3474	147	943	18
3475	147	944	19
3476	147	955	20
3477	147	956	21
3478	147	957	22
3479	147	958	23
3480	147	959	24
3481	147	960	25
3482	147	961	26
3483	147	962	27
3484	147	963	28
3485	147	942	29
3486	147	943	30
3487	147	944	31
3488	147	964	32
3489	147	965	33
3490	147	939	34
3491	147	966	35
3492	147	135	36
3493	147	963	37
3494	147	829	38
3495	147	951	39
3496	147	952	40
3497	147	967	41
3498	147	968	42
3499	147	969	43
3500	147	970	44
3501	147	971	45
3502	147	93	46
3503	147	963	47
3504	147	972	48
3505	147	973	49
3506	147	952	50
3507	147	21	51
3508	147	974	52
3509	147	57	53
3510	147	963	54
3511	147	942	55
3512	147	945	56
3513	147	975	57
1217	65	354	0
1218	65	355	1
1219	65	356	2
1220	65	3	3
1221	65	393	4
1222	65	394	5
1223	65	395	6
1224	65	356	7
1225	65	3	8
1226	66	310	0
1227	66	311	1
1228	66	280	2
1229	66	180	3
1230	67	112	0
1231	67	357	1
1232	67	358	2
1233	67	359	3
1234	67	360	4
1235	67	60	5
1236	67	216	6
1237	67	361	7
1238	67	362	8
1239	67	363	9
1240	67	364	10
1241	67	365	11
1242	67	366	12
1243	67	20	13
1244	67	367	14
1245	67	368	15
1246	67	369	16
1247	67	370	17
1248	67	371	18
1249	67	372	19
1250	67	373	20
1251	67	374	21
1252	67	375	22
1253	67	376	23
1254	67	377	24
1255	67	378	25
1256	67	20	26
1257	67	367	27
1258	67	357	28
1259	67	379	29
1260	67	380	30
1261	67	381	31
1262	67	317	32
1263	67	382	33
1264	67	364	34
1265	67	365	35
1266	67	383	36
1267	67	384	37
1268	67	385	38
1269	67	100	39
1270	67	386	40
1271	67	387	41
1272	69	291	0
1273	69	388	1
1274	69	389	2
1275	69	291	3
1276	69	390	4
1277	69	391	5
1278	69	392	6
1287	73	396	0
1288	73	397	1
1289	73	3	2
1290	73	398	3
1291	74	399	0
1292	74	400	1
1293	74	401	2
1294	74	402	3
925	49	262	0
926	49	263	1
927	49	3	2
928	49	264	3
929	50	265	0
930	50	266	1
931	50	267	2
932	50	210	3
933	50	268	4
934	50	269	5
935	50	270	6
936	50	271	7
937	50	272	8
938	50	273	9
939	51	274	0
940	51	275	1
941	51	276	2
942	51	277	3
943	51	278	4
646	25	167	0
647	25	168	1
648	25	3	2
649	25	169	3
650	25	238	4
651	25	239	5
652	25	3	6
653	25	240	7
654	26	170	0
655	26	171	1
656	26	172	2
657	26	173	3
658	26	174	4
659	26	175	5
660	26	176	6
661	26	177	7
662	27	178	0
663	27	179	1
664	27	180	2
665	27	181	3
666	27	182	4
667	27	183	5
668	27	184	6
669	27	124	7
670	27	185	8
671	27	186	9
672	27	179	10
673	27	187	11
674	27	188	12
675	27	189	13
676	27	190	14
677	27	191	15
678	27	192	16
679	27	193	17
680	27	169	18
681	27	194	19
682	27	195	20
683	27	196	21
684	27	197	22
685	27	198	23
686	27	199	24
687	27	200	25
688	27	201	26
689	27	141	27
690	27	179	28
691	27	197	29
692	27	202	30
693	27	203	31
694	27	204	32
695	27	205	33
696	27	188	34
697	27	206	35
698	27	207	36
699	27	208	37
700	27	169	38
701	27	209	39
702	27	174	40
703	27	210	41
704	27	211	42
705	27	197	43
706	27	212	44
707	27	213	45
708	27	214	46
709	27	215	47
710	27	216	48
711	27	217	49
712	27	218	50
713	27	219	51
714	27	220	52
715	27	221	53
716	27	170	54
717	27	187	55
718	27	222	56
719	27	223	57
720	27	224	58
721	27	225	59
722	27	226	60
723	27	227	61
724	27	118	62
725	27	228	63
726	27	229	64
727	27	212	65
728	27	213	66
729	27	193	67
730	27	169	68
731	27	230	69
732	27	231	70
733	27	232	71
734	27	170	72
735	27	187	73
736	27	212	74
737	27	213	75
738	27	233	76
739	27	234	77
740	27	235	78
741	27	174	79
742	27	144	80
743	27	217	81
744	27	236	82
745	27	236	83
746	27	174	84
747	29	237	0
748	29	179	1
749	29	170	2
750	29	187	3
751	29	118	4
752	29	169	5
753	29	124	6
754	29	185	7
755	29	215	8
756	29	216	9
757	29	119	10
3514	147	21	58
3515	147	938	59
3516	147	829	60
3517	147	976	61
3518	147	153	62
3519	147	977	63
3520	147	940	64
3521	147	565	65
3522	147	56	66
3523	147	937	67
3524	147	939	68
3525	147	978	69
3526	147	979	70
3527	147	940	71
3528	147	980	72
3529	147	939	73
3530	147	21	74
3531	147	974	75
1349	81	403	0
1350	81	404	1
1351	81	3	2
1352	81	405	3
1353	81	406	4
1354	82	407	0
1355	82	408	1
1356	82	409	2
1357	82	248	3
1358	82	410	4
1359	82	411	5
1360	82	412	6
1361	83	413	0
1362	83	408	1
1363	83	414	2
1364	83	409	3
1365	83	415	4
1366	83	416	5
1367	83	417	6
1368	83	418	7
1369	83	249	8
1370	83	411	9
1371	83	412	10
1372	83	419	11
1373	83	420	12
1374	83	412	13
1375	83	182	14
1376	83	421	15
1377	83	176	16
1378	83	175	17
1379	83	422	18
1380	83	423	19
1381	83	424	20
1382	83	425	21
1383	83	176	22
1384	83	426	23
1385	83	427	24
1386	83	173	25
1387	83	428	26
1388	83	429	27
1389	83	430	28
1390	83	431	29
1391	83	432	30
1392	83	433	31
1393	83	434	32
1394	83	435	33
1395	83	436	34
1396	83	437	35
1397	83	427	36
1398	83	425	37
1399	83	435	38
1400	83	438	39
1401	83	439	40
1402	83	440	41
3532	147	966	76
3533	147	981	77
3534	147	963	78
3535	147	942	79
3536	147	943	80
3537	147	944	81
3538	147	226	82
3539	147	982	83
3540	147	941	84
3541	147	428	85
3542	147	943	86
3543	147	844	87
3544	147	385	88
1531	89	403	0
1532	89	441	1
1533	89	442	2
1534	89	3	3
1535	90	443	0
1536	90	444	1
1537	90	445	2
1538	90	446	3
1539	90	447	4
1540	90	367	5
1541	90	444	6
1542	90	427	7
1543	90	448	8
1544	91	449	0
1545	91	444	1
1546	91	445	2
1547	91	450	3
1548	91	451	4
1549	91	452	5
1550	91	453	6
1551	91	454	7
1552	91	444	8
1553	91	455	9
1554	91	456	10
1555	91	451	11
1556	91	457	12
1557	91	458	13
1558	91	459	14
1559	91	460	15
1560	91	461	16
1561	91	462	17
1562	91	450	18
1563	91	444	19
1564	91	427	20
1565	91	463	21
1566	91	464	22
1567	91	465	23
1568	91	466	24
1569	91	444	25
1570	91	467	26
1571	91	468	27
1572	91	469	28
1573	91	470	29
1574	91	471	30
1575	91	472	31
1576	91	473	32
1577	91	474	33
1578	91	475	34
1579	91	450	35
1580	91	451	36
1581	91	476	37
1582	91	450	38
1583	91	477	39
1584	91	478	40
1585	91	479	41
1586	91	252	42
1587	91	480	43
1588	91	252	44
1589	91	481	45
1590	91	482	46
1591	91	483	47
1592	91	484	48
1593	91	469	49
1594	91	447	50
1595	91	444	51
1596	91	427	52
1597	91	448	53
1598	91	485	54
1599	91	331	55
1600	91	310	56
1601	91	486	57
1602	91	487	58
1603	91	488	59
1604	91	489	60
1605	91	451	61
1606	91	466	62
1607	91	490	63
1608	91	444	64
1609	91	455	65
1610	91	491	66
1611	91	468	67
1612	91	492	68
1613	91	493	69
1614	91	494	70
1615	91	487	71
1616	91	495	72
1617	91	496	73
1618	91	476	74
1619	91	497	75
1620	91	498	76
1621	91	488	77
1622	91	451	78
1623	91	11	79
1624	91	444	80
1625	91	455	81
1626	91	463	82
1627	91	499	83
1628	91	500	84
1629	91	493	85
1630	91	494	86
1631	91	501	87
1632	91	484	88
1633	91	487	89
1634	91	502	90
1635	91	486	91
1636	91	487	92
1637	91	485	93
1638	91	453	94
1639	91	503	95
1640	91	486	96
1641	91	501	97
1642	91	504	98
1643	91	463	99
1644	91	505	100
1645	91	489	101
1646	91	451	102
1647	91	506	103
1648	91	507	104
1649	91	449	105
1650	91	444	106
1651	91	445	107
1652	91	450	108
1653	91	451	109
1654	91	487	110
1655	91	504	111
1656	91	463	112
1657	91	499	113
1658	93	444	0
2707	121	731	0
2708	121	732	1
2709	121	3	2
2033	107	590	41
2034	107	84	42
2035	107	85	43
2036	107	86	44
2037	107	584	45
2038	107	591	46
2039	107	592	47
2040	107	84	48
2041	107	85	49
2042	107	86	50
2043	107	575	51
2044	107	580	52
2045	107	584	53
2046	107	22	54
2047	107	23	55
2048	107	593	56
2049	107	594	57
2050	107	84	58
2051	107	85	59
2052	107	595	60
2053	107	596	61
2054	107	23	62
2055	107	593	63
2056	107	595	64
2057	107	597	65
2058	107	84	66
2059	107	85	67
2060	107	598	68
2061	107	599	69
2062	107	600	70
2063	107	84	71
2064	107	85	72
1978	105	551	0
1979	105	552	1
1980	105	553	2
1981	105	124	3
1982	105	3	4
1983	106	554	0
1984	106	555	1
1985	106	556	2
1986	106	60	3
1987	106	557	4
1988	106	558	5
1989	106	559	6
1990	106	49	7
1991	106	560	8
1992	107	561	0
1993	107	112	1
1994	107	562	2
1995	107	5	3
1996	107	563	4
1997	107	73	5
1998	107	564	6
1999	107	84	7
2000	107	85	8
2001	107	565	9
2002	107	21	10
2003	107	99	11
2004	107	566	12
2005	107	567	13
2006	107	568	14
2007	107	471	15
2008	107	569	16
2009	107	31	17
2010	107	570	18
2011	107	571	19
2012	107	572	20
2013	107	573	21
2014	107	574	22
2015	107	26	23
2016	107	575	24
2017	107	576	25
1736	97	508	0
1737	97	509	1
1738	97	510	2
1739	97	3	3
1740	97	549	4
1741	97	550	5
1742	97	510	6
1743	97	3	7
1744	98	209	0
1745	98	511	1
1746	98	512	2
1747	98	513	3
1748	99	514	0
1749	99	515	1
1750	99	511	2
1751	99	216	3
1752	99	516	4
1753	99	517	5
1754	99	518	6
1755	99	253	7
1756	99	183	8
1757	99	519	9
1758	99	520	10
1759	99	521	11
1760	99	522	12
1761	99	523	13
1762	99	329	14
1763	99	513	15
1764	99	524	16
1765	99	525	17
1766	99	526	18
1767	99	527	19
1768	99	528	20
1769	99	529	21
1770	99	511	22
1771	99	512	23
1772	99	416	24
1773	99	530	25
1774	99	531	26
1775	99	501	27
1776	99	522	28
1777	99	529	29
1778	99	511	30
1779	99	512	31
1780	99	506	32
1781	99	532	33
1782	99	510	34
1783	99	533	35
1784	99	530	36
1785	99	511	37
1786	99	387	38
1787	99	501	39
1788	99	534	40
1789	99	535	41
1790	99	536	42
1791	99	537	43
1792	99	538	44
1793	99	539	45
1794	99	540	46
1795	99	541	47
1796	99	512	48
1797	99	542	49
1798	99	543	50
1799	99	537	51
1800	99	538	52
1801	99	501	53
1802	99	544	54
1803	99	545	55
1804	99	546	56
1805	99	547	57
1806	99	251	58
1807	99	416	59
1808	99	548	60
1809	99	460	61
1810	99	501	62
1811	101	216	0
1812	101	253	1
1813	101	183	2
1814	101	513	3
1815	101	209	4
1816	101	515	5
2018	107	577	26
2019	107	578	27
2020	107	579	28
2021	107	578	29
2022	107	580	30
2023	107	581	31
2024	107	23	32
2025	107	582	33
2026	107	583	34
2027	107	584	35
2028	107	585	36
2029	107	586	37
2030	107	587	38
2031	107	588	39
2032	107	589	40
2065	107	601	73
2066	107	595	74
2067	107	23	75
2068	107	593	76
2069	107	595	77
2070	107	602	78
2071	107	85	79
2072	107	603	80
2073	107	604	81
2074	107	605	82
2075	107	606	83
2076	107	85	84
2077	107	607	85
2078	107	589	86
2079	107	164	87
2080	107	608	88
2081	107	85	89
2082	107	609	90
2083	107	610	91
2084	107	584	92
2085	107	611	93
2086	107	65	94
2087	107	609	95
2088	107	68	96
2089	107	603	97
2090	107	612	98
2091	107	613	99
2092	107	614	100
2093	107	615	101
2094	107	74	102
2095	107	616	103
2096	107	617	104
2097	107	618	105
2098	107	619	106
2099	107	584	107
2100	107	567	108
2101	107	620	109
2102	107	67	110
2103	107	621	111
2104	107	226	112
2105	107	622	113
2106	107	563	114
2107	107	623	115
2108	107	564	116
2109	107	580	117
2110	107	84	118
2111	107	85	119
2112	107	565	120
2113	107	21	121
2114	107	99	122
2115	107	566	123
2116	107	567	124
2117	107	564	125
2118	107	579	126
2119	107	578	127
2120	107	624	128
2121	107	625	129
2122	107	626	130
2123	107	84	131
2124	107	627	132
2125	107	99	133
2126	107	73	134
2127	107	254	135
2128	107	628	136
2129	107	8	137
2130	107	11	138
2131	107	629	139
2132	107	8	140
2133	107	73	141
2134	107	630	142
2135	107	631	143
2136	109	22	0
2137	109	632	1
2138	109	633	2
2710	121	733	3
2711	122	734	0
2712	122	735	1
2713	122	197	2
2714	122	736	3
2715	122	112	4
2716	122	737	5
2717	122	738	6
2718	122	739	7
2719	123	546	0
2720	123	740	1
2721	123	741	2
2722	123	742	3
2723	123	743	4
2724	123	744	5
2725	123	745	6
2726	123	183	7
2727	123	746	8
2728	123	747	9
2729	123	319	10
2730	123	547	11
2731	123	748	12
2732	123	19	13
2733	123	749	14
2734	123	125	15
2735	123	750	16
2736	123	736	17
2737	123	112	18
2738	123	751	19
2739	123	737	20
2740	123	738	21
2741	123	739	22
2742	123	752	23
2743	123	753	24
2744	123	385	25
2745	123	754	26
2746	123	755	27
2747	123	3	28
2748	123	756	29
2749	123	757	30
2750	123	216	31
2751	123	758	32
2752	123	759	33
2753	123	760	34
2754	123	159	35
2755	123	761	36
2756	123	3	37
2757	123	762	38
2758	123	188	39
2759	123	763	40
2760	123	764	41
2761	123	735	42
2762	123	197	43
2763	123	217	44
2764	123	765	45
2765	123	501	46
2766	123	19	47
2767	123	766	48
2768	123	501	49
2769	123	755	50
2770	123	255	51
2771	123	767	52
2772	123	197	53
2773	123	768	54
2774	123	769	55
2775	123	770	56
2776	123	771	57
2777	123	772	58
2778	123	773	59
2779	123	774	60
2780	123	139	61
2781	123	775	62
2782	123	216	63
2783	123	735	64
2784	123	197	65
2785	123	776	66
2786	123	777	67
2787	123	778	68
2788	123	779	69
2789	123	780	70
2790	123	772	71
2791	123	646	72
2792	123	781	73
2793	123	782	74
2794	123	783	75
2795	123	385	76
2796	123	784	77
2797	123	785	78
2798	123	786	79
2799	123	3	80
2800	123	159	81
2801	123	787	82
2802	123	788	83
2803	123	760	84
2804	123	789	85
2805	123	19	86
2806	123	790	87
2807	123	758	88
2808	123	791	89
2809	123	792	90
2810	123	329	91
2811	123	245	92
2812	125	741	0
2813	125	742	1
2814	125	745	2
2815	125	752	3
2816	125	753	4
2817	125	760	5
2818	125	789	6
2819	125	749	7
2820	125	125	8
2821	125	750	9
2822	125	786	10
2823	125	329	11
2824	125	245	12
2932	129	793	0
2933	129	794	1
2934	129	3	2
2935	129	795	3
2936	130	796	0
2937	130	797	1
2938	130	427	2
2939	130	798	3
2940	131	248	0
2941	131	799	1
2942	131	797	2
2943	131	796	3
2944	131	427	4
2945	131	217	5
2946	131	236	6
2947	131	800	7
2948	131	801	8
2949	131	798	9
2950	131	802	10
2951	131	803	11
2952	131	797	12
2953	131	331	13
2954	131	804	14
2955	131	805	15
2956	131	305	16
2957	131	806	17
2958	131	802	18
2959	131	797	19
2960	131	796	20
2961	131	807	21
2962	131	808	22
2963	131	809	23
2964	131	810	24
2965	131	811	25
2966	131	75	26
2967	131	812	27
2968	131	46	28
2969	131	813	29
2970	131	810	30
2971	131	814	31
2972	131	803	32
2973	131	797	33
2974	131	796	34
2975	131	46	35
2976	131	813	36
2977	131	812	37
2978	131	78	38
2979	131	815	39
2980	131	7	40
2981	131	816	41
2982	131	817	42
2983	131	818	43
2984	131	819	44
2985	131	820	45
2986	131	811	46
2987	131	821	47
2988	131	812	48
2989	131	427	49
2990	131	217	50
2991	131	822	51
2992	131	823	52
2364	113	634	0
2365	113	635	1
2366	113	3	2
2367	113	405	3
2368	113	406	4
2369	114	636	0
2370	114	637	1
2371	114	638	2
2372	114	639	3
2373	114	640	4
2374	114	641	5
2375	114	642	6
2376	114	643	7
2377	114	642	8
2378	114	644	9
2379	114	645	10
2380	115	638	0
2381	115	639	1
2382	115	646	2
2383	115	647	3
2384	115	444	4
2385	115	648	5
2386	115	649	6
2387	115	449	7
2388	115	650	8
2389	115	181	9
2390	115	642	10
2391	115	310	11
2392	115	651	12
2393	115	652	13
2394	115	653	14
2395	115	654	15
2396	115	655	16
2397	115	656	17
2398	115	640	18
2399	115	641	19
2400	115	642	20
2401	115	657	21
2402	115	658	22
2403	115	659	23
2404	115	660	24
2405	115	636	25
2406	115	661	26
2407	115	640	27
2408	115	662	28
2409	115	643	29
2410	115	642	30
2411	115	663	31
2412	115	638	32
2413	115	639	33
2414	115	644	34
2415	115	645	35
2416	115	521	36
2417	115	657	37
2418	115	664	38
2419	115	116	39
2420	115	665	40
2421	115	666	41
2422	115	667	42
2423	115	112	43
2424	115	328	44
2425	115	137	45
2426	115	668	46
2427	115	116	47
2428	115	669	48
2429	115	661	49
2430	115	670	50
2431	115	671	51
2432	115	672	52
2433	115	673	53
2434	115	661	54
2435	115	674	55
2436	115	675	56
2437	115	676	57
2438	115	463	58
2439	115	677	59
2440	115	678	60
2441	115	636	61
2442	115	645	62
2443	115	137	63
2444	115	116	64
2445	115	586	65
2446	115	644	66
2447	115	414	67
2448	115	669	68
2449	115	661	69
2450	115	679	70
2451	115	680	71
2452	115	681	72
2453	115	682	73
2454	115	663	74
2455	115	683	75
2456	115	428	76
2457	115	669	77
2458	115	684	78
2459	115	361	79
2460	115	640	80
2461	115	641	81
2462	115	642	82
2463	115	643	83
2464	115	642	84
2465	115	181	85
2466	115	685	86
2467	115	175	87
2468	115	686	88
2469	115	427	89
2470	115	445	90
2471	115	669	91
2472	115	638	92
2473	115	639	93
2474	115	687	94
2475	115	688	95
2476	115	689	96
2477	115	501	97
2478	115	160	98
2479	115	690	99
2480	115	691	100
2481	115	361	101
2482	115	640	102
2483	115	641	103
2484	115	643	104
2485	115	642	105
2486	115	644	106
2487	115	645	107
2488	115	669	108
2489	115	661	109
2490	115	692	110
2491	115	693	111
2492	115	694	112
2493	115	674	113
2494	115	675	114
2495	115	676	115
2496	115	463	116
2497	115	692	117
2498	115	695	118
2499	115	696	119
2500	115	697	120
2501	115	694	121
2502	115	698	122
2503	115	699	123
2504	115	671	124
2505	115	700	125
2506	115	701	126
2507	115	116	127
2508	115	495	128
2509	115	702	129
2510	115	703	130
2511	115	704	131
2512	115	705	132
2513	115	672	133
2514	115	640	134
2515	115	641	135
2516	115	642	136
2517	115	700	137
2518	115	706	138
2519	115	609	139
2520	115	644	140
2521	115	707	141
2522	115	697	142
2523	115	700	143
2524	115	643	144
2525	115	642	145
2526	115	705	146
2527	115	672	147
2528	115	708	148
2529	115	67	149
2530	115	709	150
2531	115	710	151
2532	115	609	152
2533	115	644	153
2534	115	707	154
2535	115	697	155
2536	115	650	156
2537	115	127	157
2538	115	711	158
2539	115	712	159
2540	115	705	160
2541	115	713	161
2542	115	714	162
2543	115	444	163
2544	115	191	164
2545	115	230	165
2546	115	700	166
2547	115	715	167
2548	115	716	168
2549	115	717	169
2550	115	718	170
2551	115	719	171
2552	115	720	172
2553	115	639	173
2554	115	711	174
2555	115	5	175
2556	115	83	176
2557	115	636	177
2558	115	721	178
2559	115	640	179
2560	115	641	180
2561	115	643	181
2562	115	642	182
2563	115	722	183
2564	115	723	184
2565	115	60	185
2566	115	724	186
2567	115	444	187
2568	115	725	188
2569	115	700	189
2570	115	701	190
2571	115	101	191
2572	115	726	192
2573	115	727	193
2574	115	669	194
2575	115	191	195
2576	115	728	196
2577	115	666	197
2578	115	640	198
2579	115	641	199
2580	115	642	200
2581	115	701	201
2582	115	473	202
2583	115	116	203
2584	115	416	204
2585	115	667	205
2586	115	729	206
2587	115	730	207
2588	117	444	0
2993	131	800	53
2994	131	802	54
2995	131	797	55
2996	131	824	56
2997	131	825	57
2998	131	826	58
2999	131	827	59
3000	131	828	60
3001	131	829	61
3002	131	830	62
3003	131	831	63
3004	131	832	64
3005	131	825	65
3006	131	833	66
3007	131	834	67
3008	131	833	68
3009	131	803	69
3010	131	797	70
3011	131	835	71
3012	131	836	72
3013	131	837	73
3014	131	838	74
3015	131	46	75
3016	131	839	76
3017	131	840	77
3018	131	841	78
3019	131	803	79
3020	131	842	80
3021	131	652	81
3022	131	796	82
3023	131	819	83
3024	131	843	84
3025	131	844	85
3026	131	803	86
3027	131	845	87
3028	131	846	88
3029	131	796	89
3030	131	819	90
3031	131	847	91
3032	131	848	92
3033	131	624	93
3034	131	849	94
3035	131	850	95
3036	131	49	96
3037	131	851	97
3038	131	852	98
3596	153	983	0
3597	153	984	1
3598	153	3	2
3599	153	106	3
3600	154	985	0
3601	154	986	1
3602	154	987	2
3603	154	988	3
3604	154	989	4
3605	155	990	0
3606	155	525	1
3607	155	991	2
3608	155	134	3
3609	155	992	4
3610	155	993	5
3611	155	525	6
3612	155	994	7
3613	155	995	8
3614	155	991	9
3615	155	996	10
3616	155	997	11
3617	155	998	12
3618	155	999	13
3619	155	1000	14
3620	155	1001	15
3621	155	435	16
3622	155	1002	17
3623	155	922	18
3624	155	1003	19
3625	155	1004	20
3626	155	1005	21
3627	155	1006	22
3628	155	838	23
3629	155	996	24
3630	155	1007	25
3631	155	1001	26
3632	155	1008	27
3633	155	883	28
3634	155	1009	29
3635	155	771	30
3636	155	991	31
3637	155	1010	32
3638	155	1000	33
3639	155	1001	34
3640	155	435	35
3641	155	100	36
3642	155	56	37
3643	157	985	0
3644	157	986	1
3645	157	987	2
3646	157	1011	3
3186	137	853	0
3187	137	854	1
3188	137	855	2
3189	137	3	3
3190	138	5	0
3191	138	563	1
3192	138	856	2
3193	138	623	3
3194	138	580	4
3195	138	84	5
3196	138	85	6
3197	138	86	7
3198	138	21	8
3199	138	22	9
3200	138	584	10
3201	139	561	0
3202	139	159	1
3203	139	473	2
3204	139	857	3
3205	139	858	4
3206	139	859	5
3207	139	860	6
3208	139	861	7
3209	139	862	8
3210	139	863	9
3211	139	864	10
3212	139	865	11
3213	139	8	12
3214	139	866	13
3215	139	867	14
3216	139	868	15
3217	139	869	16
3218	139	870	17
3219	139	861	18
3220	139	810	19
3221	139	871	20
3222	139	872	21
3223	139	873	22
3224	139	645	23
3225	139	874	24
3226	139	859	25
3227	139	875	26
3228	139	876	27
3229	139	877	28
3230	139	878	29
3231	139	583	30
3232	139	875	31
3233	139	488	32
3234	139	879	33
3235	139	880	34
3236	139	860	35
3237	139	8	36
3238	139	61	37
3239	139	86	38
3240	139	877	39
3241	139	878	40
3242	139	761	41
3243	139	881	42
3244	139	859	43
3245	139	882	44
3246	139	883	45
3247	139	884	46
3248	139	885	47
3249	139	291	48
3250	139	10	49
3251	139	451	50
3252	139	886	51
3253	139	569	52
3254	139	887	53
3255	139	888	54
3256	139	889	55
3257	139	890	56
3258	139	891	57
3259	139	892	58
3260	139	30	59
3261	139	893	60
3262	139	894	61
3263	139	451	62
3264	139	859	63
3265	139	895	64
3266	139	896	65
3267	139	897	66
3268	139	852	67
3269	139	898	68
3270	139	8	69
3271	139	73	70
3272	139	595	71
3273	139	703	72
3274	139	899	73
3275	139	890	74
3276	139	886	75
3277	139	66	76
3278	139	900	77
3279	139	898	78
3280	139	901	79
3281	139	860	80
3282	139	902	81
3283	139	291	82
3284	139	903	83
3285	139	645	84
3286	139	904	85
3287	139	905	86
3288	139	906	87
3289	139	907	88
3290	139	908	89
3291	139	909	90
3292	139	910	91
3293	139	911	92
3294	139	912	93
3295	139	913	94
3296	139	914	95
3297	139	915	96
3298	139	916	97
3299	139	910	98
3300	139	875	99
3301	139	917	100
3302	139	918	101
3303	139	919	102
3304	139	920	103
3305	139	921	104
3306	139	918	105
3307	139	922	106
3308	139	923	107
3309	139	893	108
3310	139	924	109
3311	139	116	110
3312	139	925	111
3313	139	926	112
3314	139	927	113
3315	139	928	114
3316	139	561	115
3317	139	929	116
3318	139	859	117
3319	139	10	118
3320	139	930	119
3321	139	867	120
3322	139	648	121
3323	139	38	122
3324	139	931	123
3325	139	59	124
3326	139	797	125
3327	139	932	126
3328	139	457	127
3329	139	933	128
3330	141	859	0
3331	141	632	1
3332	141	633	2
3655	161	1012	0
3656	161	1013	1
3657	161	1014	2
3658	162	1015	0
3659	162	1016	1
3660	162	1016	2
3661	165	183	0
3662	165	353	1
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
49	5	1	0
50	5	2	0
51	5	4	0
52	5	16	0
53	5	17	0
54	5	8	0
55	5	32	0
56	5	64	0
57	6	1	0
58	6	2	0
59	6	4	0
60	6	16	0
61	6	17	0
62	6	8	0
63	6	32	0
64	6	64	0
65	7	1	0
66	7	2	0
67	7	4	0
68	7	16	0
69	7	17	0
70	7	8	0
71	7	32	0
72	7	64	0
73	8	1	0
74	8	2	0
75	8	4	0
76	8	16	0
77	8	17	0
78	8	8	0
79	8	32	0
80	8	64	0
81	9	1	0
82	9	2	0
83	9	4	0
84	9	16	0
85	9	17	0
86	9	8	0
87	9	32	0
88	9	64	0
89	10	1	0
90	10	2	0
91	10	4	0
92	10	16	0
93	10	17	0
94	10	8	0
95	10	32	0
96	10	64	0
97	11	1	0
98	11	2	0
99	11	4	0
100	11	16	0
101	11	17	0
102	11	8	0
103	11	32	0
104	11	64	0
105	12	1	0
106	12	2	0
107	12	4	0
108	12	16	0
109	12	17	0
110	12	8	0
111	12	32	0
112	12	64	0
113	13	1	0
114	13	2	0
115	13	4	0
116	13	16	0
117	13	17	0
118	13	8	0
119	13	32	0
120	13	64	0
121	14	1	0
122	14	2	0
123	14	4	0
124	14	16	0
125	14	17	0
126	14	8	0
127	14	32	0
128	14	64	0
129	15	1	0
130	15	2	0
131	15	4	0
132	15	16	0
133	15	17	0
134	15	8	0
135	15	32	0
136	15	64	0
137	16	1	0
138	16	2	0
139	16	4	0
140	16	16	0
141	16	17	0
142	16	8	0
143	16	32	0
144	16	64	0
145	17	1	0
146	17	2	0
147	17	4	0
148	17	16	0
149	17	17	0
150	17	8	0
151	17	32	0
152	17	64	0
153	18	1	0
154	18	2	0
155	18	4	0
156	18	16	0
157	18	17	0
158	18	8	0
159	18	32	0
160	18	64	0
161	19	1	0
162	19	2	0
163	19	4	0
164	19	16	0
165	19	17	0
166	19	8	0
167	19	32	0
168	19	64	0
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
15	1	16	2023-04-15 05:37:14	2023-04-15 05:37:05	2023-04-15 05:37:05	5	en	3		0
10	1	11	2023-04-15 05:34:29	2023-04-15 05:34:20	2023-04-15 05:34:20	5	en	3		0
1	1	1	2023-04-15 05:27:48	2023-04-15 05:27:48	2023-04-15 05:27:48	5	en	1		0
5	1	6	2023-04-15 05:31:48	2023-04-15 05:31:27	2023-04-15 05:31:27	5	en	3		0
16	1	17	2023-04-15 05:37:46	2023-04-15 05:37:37	2023-04-15 05:37:37	5	en	3		0
2	1	2	2023-04-15 05:29:14	2023-04-15 05:28:59	2023-04-15 05:28:59	5	en	3		0
11	1	12	2023-04-15 05:35:02	2023-04-15 05:34:53	2023-04-15 05:34:53	5	en	3		0
6	1	7	2023-04-15 05:32:20	2023-04-15 05:32:12	2023-04-15 05:32:12	5	en	3		0
12	1	13	2023-04-15 05:35:35	2023-04-15 05:35:26	2023-04-15 05:35:26	5	en	3		0
17	1	18	2023-04-15 05:38:18	2023-04-15 05:38:10	2023-04-15 05:38:10	5	en	3		0
7	1	8	2023-04-15 05:32:53	2023-04-15 05:32:44	2023-04-15 05:32:44	5	en	3		0
3	1	4	2023-04-15 05:30:11	2023-04-15 05:29:39	2023-04-15 05:29:39	5	en	3		0
13	1	14	2023-04-15 05:36:08	2023-04-15 05:35:59	2023-04-15 05:35:59	5	en	3		0
8	1	9	2023-04-15 05:33:24	2023-04-15 05:33:16	2023-04-15 05:33:16	5	en	3		0
4	1	5	2023-04-15 05:31:01	2023-04-15 05:30:35	2023-04-15 05:30:35	5	en	4		0
18	1	19	2023-04-15 05:38:51	2023-04-15 05:38:42	2023-04-15 05:38:42	5	en	3		0
9	1	10	2023-04-15 05:33:57	2023-04-15 05:33:48	2023-04-15 05:33:48	5	en	3		0
14	1	15	2023-04-15 05:36:41	2023-04-15 05:36:32	2023-04-15 05:36:32	5	en	3		0
19	1	20	2023-04-15 05:39:23	2023-04-15 05:39:14	2023-04-15 05:39:14	5	en	3		0
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
16	jnovak	$2y$10$mjWAolwMleOpx9hrxFRJgeM4khlvq4b480.iPujgdZS7KAnQmMIwK	jnovak@mailinator.com	\N	\N	\N	\N	DK	[]	\N	\N	2023-04-15 05:34:03	\N	2023-04-15 05:34:03	\N	\N	\N	0	\N	1
25	zwoods	$2y$10$JtEdgiFuyhO.PjO7GqoOO.284aTnMyg9NgwlZjVrjmCL0FeDBV6Gm	zwoods@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2023-04-15 05:38:57	\N	2023-04-15 05:38:57	\N	\N	\N	0	\N	1
4	dbuskins	$2y$10$p43RQaL3KvpN38AVQvZJueVlq7s31tssAGGnBuCCUp6MlXjvsXYem	dbuskins@mailinator.com				\N	US	[]	\N	\N	2023-04-15 05:26:19	\N	\N	0	\N	\N	0	\N	1
5	sberardo	$2y$10$abfeRE4MC/laomxdeXlUhuh8uqmdihp3gaiCSPnKoFei4DLwR0nQm	sberardo@mailinator.com				\N	CA	[]	\N	\N	2023-04-15 05:26:26	\N	\N	0	\N	\N	0	\N	1
6	minoue	$2y$10$s6/nm1zNfuBQM3J4nCmW4eI12Bchn.Xm0t.tCj.3kw/OwBxEsyude	minoue@mailinator.com				\N	JP	[]	\N	\N	2023-04-15 05:26:33	\N	\N	0	\N	\N	0	\N	1
17	kalkhafaji	$2y$10$HLrZifvpmftXxL1LxZd2s.IPwJtYdiWraA6xf2AmsJkamwDnnzBsa	kalkhafaji@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2023-04-15 05:34:35	\N	2023-04-15 05:34:36	\N	\N	\N	0	\N	1
3	dbarnes	$2y$10$e3tIKJ1YrahqDEDyMA7iGeurcA1q8CLVuXyEgkFsXo1WQHG4Yrdi.	dbarnes@mailinator.com				\N	AU	[]	\N	\N	2023-04-15 05:26:13	\N	2023-04-15 05:39:15	0	\N	\N	0	\N	1
2	rvaca	$2y$10$oNWhXUIDtjEBtmVQMhmNoeQo9RQtJYXnu3Q9mj9griEl9qy0XDxSe	rvaca@mailinator.com				\N	MX	[]	\N	\N	2023-04-15 05:26:06	\N	2023-04-15 05:26:44	0	\N	\N	0	\N	1
1	admin	$2y$10$gm4woTLwof2s/mGieKaFW.lZaZkiRPmcOrGbvKdbTTPZtSorDje66	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	[]	\N	\N	2023-04-15 05:24:22	\N	2023-04-15 05:27:00	\N	\N	\N	0	\N	1
7	ccorino	$2y$10$lV4ObaeKtqpwVJ67emA.g.k9O7lVEpPlDaeUxwpFTKWZFrkVpSmB2	ccorino@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2023-04-15 05:27:30	\N	2023-04-15 05:27:30	\N	\N	\N	0	\N	1
8	ckwantes	$2y$10$0OnRvcrx6TpNqbb4WnH/Qe8J3IeBcBz6N.5Z99kbCaxpXN2gNy.Hm	ckwantes@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2023-04-15 05:27:53	\N	2023-04-15 05:27:54	\N	\N	\N	0	\N	1
18	lchristopher	$2y$10$/RUTjfTvVXGSqxgPvVeEtOw2EK1EsdmfSLu9rBU.vY6xNBtGGEZqm	lchristopher@mailinator.com	\N	\N	\N	\N	AU	[]	\N	\N	2023-04-15 05:35:09	\N	2023-04-15 05:35:09	\N	\N	\N	0	\N	1
9	cmontgomerie	$2y$10$eBaT2kWRLfMzsPvxc0VkyuwaRtMEQHh1u6Nqy8AwrceuUculPpvIe	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2023-04-15 05:29:21	\N	2023-04-15 05:29:21	\N	\N	\N	0	\N	1
10	ddiouf	$2y$10$rk1f3WwTroT5BA61ouwC6eqX4R8BomHNagJR5ZvcrPFVbdCJoWfye	ddiouf@mailinator.com	\N	\N	\N	\N	EG	[]	\N	\N	2023-04-15 05:30:18	\N	2023-04-15 05:30:18	\N	\N	\N	0	\N	1
19	lkumiega	$2y$10$EAqJimRlTNbdrMhzBUsaT.QnrKiY0rUVi49OkUnL1ftcoVfmq90oa	lkumiega@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2023-04-15 05:35:42	\N	2023-04-15 05:35:42	\N	\N	\N	0	\N	1
11	dphillips	$2y$10$eZ4jmhfHmm3WRkareSqPIeSf9TUn9aD2fQE9kTg6kZfoyeh5mb6qK	dphillips@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2023-04-15 05:31:10	\N	2023-04-15 05:31:10	\N	\N	\N	0	\N	1
20	pdaniel	$2y$10$k41Ui3scW9ILZwWvPDCHfebGANtH.mCDot2OZ.ceQAK9yepnHrTEC	pdaniel@mailinator.com	\N	\N	\N	\N	GB	[]	\N	\N	2023-04-15 05:36:15	\N	2023-04-15 05:36:15	\N	\N	\N	0	\N	1
12	dsokoloff	$2y$10$bcaCdVyxsIHntGiHdDW3b.K9gDT.Jv263IZAWug9lUQQLJ4.4UG.O	dsokoloff@mailinator.com	\N	\N	\N	\N	IE	[]	\N	\N	2023-04-15 05:31:55	\N	2023-04-15 05:31:55	\N	\N	\N	0	\N	1
13	eostrom	$2y$10$xIyyBmvOLzow4OTZLlButuY6FGbvgJrordoiY7LB9v2mdNdXvKRiS	eostrom@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2023-04-15 05:32:26	\N	2023-04-15 05:32:27	\N	\N	\N	0	\N	1
14	fpaglieri	$2y$10$EffVCJKbkdtcjPAzI./fcuiMAYEBA8D1QSntWd5sK6Z43kTOb17I.	fpaglieri@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2023-04-15 05:32:59	\N	2023-04-15 05:32:59	\N	\N	\N	0	\N	1
15	jmwandenga	$2y$10$K4HBSNoC6fLr7SH6c.hR2eg8lNJBEKZ6K7efvgFdLWL1juHKVyi0m	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2023-04-15 05:33:31	\N	2023-04-15 05:33:31	\N	\N	\N	0	\N	1
21	rbaiyewu	$2y$10$td7JvatvwsftKw/lIninJOmouqU8tEO63KhDUy2N/AYJOzvc93l8W	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE	[]	\N	\N	2023-04-15 05:36:48	\N	2023-04-15 05:36:48	\N	\N	\N	0	\N	1
22	rrossi	$2y$10$5vat3XL7LrEZNYHD2Vheg.qYLKHFwCcejwl4/S6waickfWLnT0sjC	rrossi@mailinator.com	\N	\N	\N	\N	ES	[]	\N	\N	2023-04-15 05:37:20	\N	2023-04-15 05:37:20	\N	\N	\N	0	\N	1
23	vkarbasizaed	$2y$10$ZrN5ra2efoG1upV6lFayg.gWY.UW4dEJ0PFkkiqzXnVQ7DA1c7FLq	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR	[]	\N	\N	2023-04-15 05:37:53	\N	2023-04-15 05:37:53	\N	\N	\N	0	\N	1
24	vwilliamson	$2y$10$VT2WgA/I4JO2996/2hhjgObbOuJS7C5BSa4CB2F5pdgk5J9iWVvPm	vwilliamson@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2023-04-15 05:38:25	\N	2023-04-15 05:38:25	\N	\N	\N	0	\N	1
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (version_id, major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	1	0	0	0	2023-04-15 05:24:22	1	plugins.metadata	dc11		0	0
2	1	0	1	0	2023-04-15 05:24:22	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
3	1	0	0	0	2023-04-15 05:24:22	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
4	1	0	0	0	2023-04-15 05:24:22	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
5	2	2	0	0	2023-04-15 05:24:22	1	plugins.generic	crossref		0	0
6	1	2	0	0	2023-04-15 05:24:22	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
7	1	0	0	0	2023-04-15 05:24:22	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
8	1	0	0	0	2023-04-15 05:24:22	1	plugins.generic	webFeed	WebFeedPlugin	1	0
9	1	3	0	0	2023-04-15 05:24:22	1	plugins.generic	acron	AcronPlugin	1	1
10	0	1	0	0	2023-04-15 05:24:22	1	plugins.generic	citationStyleLanguage	CitationStyleLanguagePlugin	1	0
11	1	0	1	0	2023-04-15 05:24:22	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
12	1	3	4	3	2023-04-15 05:24:22	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
13	1	0	0	0	2023-04-15 05:24:22	1	plugins.generic	usageEvent		0	0
14	1	1	0	0	2023-04-15 05:24:22	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
15	1	0	0	0	2023-04-15 05:24:22	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
16	1	0	0	0	2023-04-15 05:24:22	1	plugins.importexport	native		0	0
17	1	0	0	0	2023-04-15 05:24:22	1	plugins.oaiMetadataFormats	dc		0	0
18	1	0	0	0	2023-04-15 05:24:22	1	plugins.themes	default	DefaultThemePlugin	1	0
19	3	4	0	0	2023-04-15 05:24:20	1	core	ops		0	1
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

SELECT pg_catalog.setval('public.event_log_log_id_seq', 163, true);


--
-- Name: event_log_settings_event_log_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.event_log_settings_event_log_setting_id_seq', 544, true);


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

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 83, true);


--
-- Name: oai_resumption_tokens_oai_resumption_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.oai_resumption_tokens_oai_resumption_token_id_seq', 1, false);


--
-- Name: plugin_settings_plugin_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.plugin_settings_plugin_setting_id_seq', 28, true);


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

SELECT pg_catalog.setval('public.publication_settings_publication_setting_id_seq', 115, true);


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

SELECT pg_catalog.setval('public.server_settings_server_setting_id_seq', 72, true);


--
-- Name: servers_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.servers_server_id_seq', 1, true);


--
-- Name: site_settings_site_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.site_settings_site_setting_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 1016, true);


--
-- Name: submission_search_object_keyw_submission_search_object_keyw_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_object_keyw_submission_search_object_keyw_seq', 3662, true);


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
    ADD CONSTRAINT event_log_settings_unique UNIQUE (log_id, setting_name);


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

