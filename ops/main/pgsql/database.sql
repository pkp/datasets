--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-1.pgdg24.04+1)

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
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_context_id;
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
ALTER TABLE ONLY public.site DROP CONSTRAINT site_redirect_context_id_foreign;
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
ALTER TABLE ONLY public.plugin_settings DROP CONSTRAINT plugin_settings_context_id;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_user_id_foreign;
ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_context_id_foreign;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_user_id_foreign;
ALTER TABLE ONLY public.notification_subscription_settings DROP CONSTRAINT notification_subscription_settings_context_id_foreign;
ALTER TABLE ONLY public.notification_settings DROP CONSTRAINT notification_settings_notification_id_foreign;
ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_user_id_foreign;
ALTER TABLE ONLY public.navigation_menus DROP CONSTRAINT navigation_menus_context_id;
ALTER TABLE ONLY public.navigation_menu_items DROP CONSTRAINT navigation_menu_items_context_id;
ALTER TABLE ONLY public.navigation_menu_item_settings DROP CONSTRAINT navigation_menu_item_settings_navigation_menu_id;
ALTER TABLE ONLY public.navigation_menu_item_assignments DROP CONSTRAINT navigation_menu_item_assignments_parent_id;
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
ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_user_id_foreign;
ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_inviter_id_foreign;
ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_context_id;
ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_context_id_foreign;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_institution_id_foreign;
ALTER TABLE ONLY public.institution_ip DROP CONSTRAINT institution_ip_institution_id_foreign;
ALTER TABLE ONLY public.highlights DROP CONSTRAINT highlights_context_id_foreign;
ALTER TABLE ONLY public.highlight_settings DROP CONSTRAINT highlight_settings_highlight_id_foreign;
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_context_id_foreign;
ALTER TABLE ONLY public.genre_settings DROP CONSTRAINT genre_settings_genre_id_foreign;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_parent_filter_id_foreign;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_filter_group_id_foreign;
ALTER TABLE ONLY public.filters DROP CONSTRAINT filters_context_id;
ALTER TABLE ONLY public.filter_settings DROP CONSTRAINT filter_settings_filter_id_foreign;
ALTER TABLE ONLY public.event_log DROP CONSTRAINT event_log_user_id_foreign;
ALTER TABLE ONLY public.event_log_settings DROP CONSTRAINT event_log_settings_log_id;
ALTER TABLE ONLY public.email_templates_settings DROP CONSTRAINT email_templates_settings_email_id;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_context_id_foreign;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_users_user_id_foreign;
ALTER TABLE ONLY public.email_log_users DROP CONSTRAINT email_log_users_email_log_id_foreign;
ALTER TABLE ONLY public.email_log DROP CONSTRAINT email_log_sender_id_foreign;
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
DROP INDEX public.ust_submission_id;
DROP INDEX public.ust_submission_file_id;
DROP INDEX public.ust_representation_id;
DROP INDEX public.ust_load_id_context_id_ip;
DROP INDEX public.ust_context_id;
DROP INDEX public.usir_submission_id;
DROP INDEX public.usir_submission_file_id;
DROP INDEX public.usir_representation_id;
DROP INDEX public.usir_load_id_context_id_ip;
DROP INDEX public.usir_context_id;
DROP INDEX public.usii_submission_id;
DROP INDEX public.usii_submission_file_id;
DROP INDEX public.usii_representation_id;
DROP INDEX public.usii_load_id_context_id_ip;
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
DROP INDEX public.site_context_id;
DROP INDEX public.sessions_user_id;
DROP INDEX public.sessions_last_activity_index;
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
DROP INDEX public.plugin_settings_context_id;
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
DROP INDEX public.navigation_menus_context_id;
DROP INDEX public.navigation_menu_items_context_id;
DROP INDEX public.navigation_menu_item_settings_navigation_menu_item_id;
DROP INDEX public.navigation_menu_item_assignments_parent_id;
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
DROP INDEX public.invitations_user_id;
DROP INDEX public.invitations_status_context_id_user_id_type_index;
DROP INDEX public.invitations_inviter_id;
DROP INDEX public.invitations_expiry_date_index;
DROP INDEX public.institutions_context_id;
DROP INDEX public.institution_settings_institution_id;
DROP INDEX public.institution_ip_start;
DROP INDEX public.institution_ip_institution_id;
DROP INDEX public.institution_ip_end;
DROP INDEX public.highlights_context_id;
DROP INDEX public.highlight_settings_highlight_id;
DROP INDEX public.genres_context_id;
DROP INDEX public.genre_settings_genre_id;
DROP INDEX public.filters_parent_filter_id;
DROP INDEX public.filters_filter_group_id;
DROP INDEX public.filters_context_id;
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
DROP INDEX public.email_log_sender_id;
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
ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_unique;
ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_pkey;
ALTER TABLE ONLY public.usage_stats_institution_temporary_records DROP CONSTRAINT usitr_load_id_line_number_institution_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
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
ALTER TABLE ONLY public.invitations DROP CONSTRAINT invitations_pkey;
ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_pkey;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_unique;
ALTER TABLE ONLY public.institution_settings DROP CONSTRAINT institution_settings_pkey;
ALTER TABLE ONLY public.institution_ip DROP CONSTRAINT institution_ip_pkey;
ALTER TABLE ONLY public.highlights DROP CONSTRAINT highlights_pkey;
ALTER TABLE ONLY public.highlight_settings DROP CONSTRAINT highlight_settings_unique;
ALTER TABLE ONLY public.highlight_settings DROP CONSTRAINT highlight_settings_pkey;
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
ALTER TABLE public.invitations ALTER COLUMN invitation_id DROP DEFAULT;
ALTER TABLE public.institutions ALTER COLUMN institution_id DROP DEFAULT;
ALTER TABLE public.institution_settings ALTER COLUMN institution_setting_id DROP DEFAULT;
ALTER TABLE public.institution_ip ALTER COLUMN institution_ip_id DROP DEFAULT;
ALTER TABLE public.highlights ALTER COLUMN highlight_id DROP DEFAULT;
ALTER TABLE public.highlight_settings ALTER COLUMN highlight_setting_id DROP DEFAULT;
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
DROP SEQUENCE public.invitations_invitation_id_seq;
DROP TABLE public.invitations;
DROP SEQUENCE public.institutions_institution_id_seq;
DROP TABLE public.institutions;
DROP SEQUENCE public.institution_settings_institution_setting_id_seq;
DROP TABLE public.institution_settings;
DROP SEQUENCE public.institution_ip_institution_ip_id_seq;
DROP TABLE public.institution_ip;
DROP SEQUENCE public.highlights_highlight_id_seq;
DROP TABLE public.highlights;
DROP SEQUENCE public.highlight_settings_highlight_setting_id_seq;
DROP TABLE public.highlight_settings;
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
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: announcement_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.announcement_settings (
    announcement_setting_id bigint NOT NULL,
    announcement_id bigint NOT NULL,
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    context_id bigint
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
    assoc_id bigint,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
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
    assoc_id bigint
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    sender_id bigint,
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
    locale character varying(28) DEFAULT 'en'::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    filter_group_id bigint NOT NULL,
    context_id bigint,
    display_name character varying(255),
    class_name character varying(255),
    is_template smallint DEFAULT '0'::smallint NOT NULL,
    parent_filter_id bigint,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
-- Name: highlight_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.highlight_settings (
    highlight_setting_id bigint NOT NULL,
    highlight_id bigint NOT NULL,
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text
);


ALTER TABLE public.highlight_settings OWNER TO "ops-ci";

--
-- Name: TABLE highlight_settings; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.highlight_settings IS 'More data about highlights, including localized properties like title and description.';


--
-- Name: highlight_settings_highlight_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.highlight_settings_highlight_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highlight_settings_highlight_setting_id_seq OWNER TO "ops-ci";

--
-- Name: highlight_settings_highlight_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.highlight_settings_highlight_setting_id_seq OWNED BY public.highlight_settings.highlight_setting_id;


--
-- Name: highlights; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.highlights (
    highlight_id bigint NOT NULL,
    context_id bigint,
    sequence bigint NOT NULL,
    url character varying(2047) NOT NULL
);


ALTER TABLE public.highlights OWNER TO "ops-ci";

--
-- Name: TABLE highlights; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.highlights IS 'Highlights are featured items that can be presented to users, for example on the homepage.';


--
-- Name: highlights_highlight_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.highlights_highlight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highlights_highlight_id_seq OWNER TO "ops-ci";

--
-- Name: highlights_highlight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.highlights_highlight_id_seq OWNED BY public.highlights.highlight_id;


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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
-- Name: invitations; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.invitations (
    invitation_id bigint NOT NULL,
    key_hash character varying(255),
    type character varying(255) NOT NULL,
    user_id bigint,
    inviter_id bigint,
    expiry_date timestamp(0) without time zone,
    payload json,
    status character varying(255) NOT NULL,
    email character varying(255),
    context_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT invitations_status_check CHECK (((status)::text = ANY ((ARRAY['INITIALIZED'::character varying, 'PENDING'::character varying, 'ACCEPTED'::character varying, 'DECLINED'::character varying, 'CANCELLED'::character varying])::text[])))
);


ALTER TABLE public.invitations OWNER TO "ops-ci";

--
-- Name: TABLE invitations; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON TABLE public.invitations IS 'Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';


--
-- Name: COLUMN invitations.email; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.invitations.email IS 'When present, the email address of the invitation recipient; when null, user_id must be set and the email can be fetched from the users table.';


--
-- Name: invitations_invitation_id_seq; Type: SEQUENCE; Schema: public; Owner: ops-ci
--

CREATE SEQUENCE public.invitations_invitation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invitations_invitation_id_seq OWNER TO "ops-ci";

--
-- Name: invitations_invitation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ops-ci
--

ALTER SEQUENCE public.invitations_invitation_id_seq OWNED BY public.invitations.invitation_id;


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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    context_id bigint,
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
    context_id bigint,
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
    locale character varying(28),
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
    context_id bigint,
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
    context_id bigint,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28),
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    date_cancelled timestamp(0) without time zone,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
-- Name: section_settings; Type: TABLE; Schema: public; Owner: ops-ci
--

CREATE TABLE public.section_settings (
    section_setting_id bigint NOT NULL,
    section_id bigint NOT NULL,
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    primary_locale character varying(28) NOT NULL,
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
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    last_activity integer NOT NULL,
    payload text NOT NULL
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
    redirect_context_id bigint,
    primary_locale character varying(28) NOT NULL,
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
-- Name: COLUMN site.redirect_context_id; Type: COMMENT; Schema: public; Owner: ops-ci
--

COMMENT ON COLUMN public.site.redirect_context_id IS 'If not null, redirect to the specified journal/conference/... site.';


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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    locale character varying(28),
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    context_id bigint,
    role_id bigint NOT NULL,
    is_default smallint DEFAULT '0'::smallint NOT NULL,
    show_title smallint DEFAULT '1'::smallint NOT NULL,
    permit_self_registration smallint DEFAULT '0'::smallint NOT NULL,
    permit_metadata_edit smallint DEFAULT '0'::smallint NOT NULL,
    permit_settings smallint DEFAULT '0'::smallint NOT NULL,
    masthead smallint DEFAULT '0'::smallint NOT NULL
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
    locale character varying(28) DEFAULT ''::character varying NOT NULL,
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
    user_id bigint NOT NULL,
    date_start timestamp(0) without time zone,
    date_end timestamp(0) without time zone,
    masthead smallint
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
    inline_help smallint,
    remember_token character varying(100)
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
-- Name: highlight_settings highlight_setting_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlight_settings ALTER COLUMN highlight_setting_id SET DEFAULT nextval('public.highlight_settings_highlight_setting_id_seq'::regclass);


--
-- Name: highlights highlight_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlights ALTER COLUMN highlight_id SET DEFAULT nextval('public.highlights_highlight_id_seq'::regclass);


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
-- Name: invitations invitation_id; Type: DEFAULT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.invitations ALTER COLUMN invitation_id SET DEFAULT nextval('public.invitations_invitation_id_seq'::regclass);


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
9	3	en	affiliation	\N
10	3	fr_CA	affiliation	\N
11	3	en	biography	\N
12	3	fr_CA	biography	\N
15	3	fr_CA	familyName	\N
17	3	fr_CA	givenName	\N
18	3	en	preferredPublicName	\N
19	3	fr_CA	preferredPublicName	\N
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
14	3	en	familyName	Kekkonen
16	3	en	givenName	Urho
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
3	6	1
4	6	2
76	26	1
77	26	2
81	30	1
82	30	2
83	30	3
85	42	1
90	46	1
91	46	2
92	46	3
93	46	4
96	50	1
97	50	2
99	54	1
34	10	1
35	10	2
36	10	3
37	10	4
38	10	5
39	10	6
40	10	7
41	10	8
110	58	1
111	58	2
112	58	3
113	58	4
114	58	5
115	58	6
116	58	7
117	58	8
118	58	9
119	58	10
122	66	1
123	66	2
127	74	1
128	74	2
66	14	1
67	14	2
68	14	3
69	14	4
70	14	5
71	14	6
72	14	7
73	14	8
129	74	3
132	78	1
133	78	2
\.


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocab_entry_settings (controlled_vocab_entry_setting_id, controlled_vocab_entry_id, locale, setting_name, setting_value) FROM stdin;
3	3	en	name	employees
4	4	en	name	survey
76	76	en	name	education
77	77	en	name	citizenship
81	81	en	name	Common pool resource
82	82	en	name	common property
83	83	en	name	intellectual developments
85	85	en	name	water
90	90	en	name	Development
91	91	en	name	engineering education
92	92	en	name	service learning
93	93	en	name	sustainability
96	96	en	name	pigs
97	97	en	name	food security
99	99	en	name	water
34	34	en	name	Integrating Technology
35	35	en	name	Computer Skills
36	36	en	name	Survey
37	37	en	name	Alberta
38	38	en	name	National
39	39	en	name	Provincial
40	40	en	name	Professional Development
41	41	en	name	employees
110	110	en	name	21st Century
111	111	en	name	Diversity
112	112	en	name	Multilingual
113	113	en	name	Multiethnic
114	114	en	name	Participatory Pedagogy
115	115	en	name	Language
116	116	en	name	Culture
117	117	en	name	Gender
118	118	en	name	Egalitarianism
119	119	en	name	Social Transformation
122	122	en	name	cattle
123	123	en	name	food security
127	127	en	name	Self-Organization
128	128	en	name	Multi-Level Institutions
66	66	en	name	Integrating Technology
67	67	en	name	Computer Skills
68	68	en	name	Survey
69	69	en	name	Alberta
70	70	en	name	National
71	71	en	name	Provincial
72	72	en	name	Professional Development
73	73	en	name	employees
129	129	en	name	Goverance
132	132	en	name	education
133	133	en	name	citizenship
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.controlled_vocabs (controlled_vocab_id, symbolic, assoc_type, assoc_id) FROM stdin;
1	interest	0	\N
2	submissionKeyword	1048588	1
3	submissionSubject	1048588	1
4	submissionDiscipline	1048588	1
5	submissionAgency	1048588	1
6	submissionKeyword	1048588	2
7	submissionSubject	1048588	2
8	submissionDiscipline	1048588	2
9	submissionAgency	1048588	2
10	submissionKeyword	1048588	3
11	submissionSubject	1048588	3
12	submissionDiscipline	1048588	3
13	submissionAgency	1048588	3
14	submissionKeyword	1048588	4
15	submissionSubject	1048588	4
16	submissionDiscipline	1048588	4
17	submissionAgency	1048588	4
18	submissionKeyword	1048588	5
19	submissionSubject	1048588	5
20	submissionDiscipline	1048588	5
21	submissionAgency	1048588	5
22	submissionKeyword	1048588	6
23	submissionSubject	1048588	6
24	submissionDiscipline	1048588	6
25	submissionAgency	1048588	6
26	submissionKeyword	1048588	7
27	submissionSubject	1048588	7
28	submissionDiscipline	1048588	7
29	submissionAgency	1048588	7
30	submissionKeyword	1048588	8
31	submissionSubject	1048588	8
32	submissionDiscipline	1048588	8
33	submissionAgency	1048588	8
34	submissionKeyword	1048588	9
35	submissionSubject	1048588	9
36	submissionDiscipline	1048588	9
37	submissionAgency	1048588	9
38	submissionKeyword	1048588	10
39	submissionSubject	1048588	10
40	submissionDiscipline	1048588	10
41	submissionAgency	1048588	10
42	submissionKeyword	1048588	11
43	submissionSubject	1048588	11
44	submissionDiscipline	1048588	11
45	submissionAgency	1048588	11
46	submissionKeyword	1048588	12
47	submissionSubject	1048588	12
48	submissionDiscipline	1048588	12
49	submissionAgency	1048588	12
50	submissionKeyword	1048588	13
51	submissionSubject	1048588	13
52	submissionDiscipline	1048588	13
53	submissionAgency	1048588	13
54	submissionKeyword	1048588	14
55	submissionSubject	1048588	14
56	submissionDiscipline	1048588	14
57	submissionAgency	1048588	14
58	submissionKeyword	1048588	15
59	submissionSubject	1048588	15
60	submissionDiscipline	1048588	15
61	submissionAgency	1048588	15
62	submissionKeyword	1048588	16
63	submissionSubject	1048588	16
64	submissionDiscipline	1048588	16
65	submissionAgency	1048588	16
66	submissionKeyword	1048588	17
67	submissionSubject	1048588	17
68	submissionDiscipline	1048588	17
69	submissionAgency	1048588	17
70	submissionKeyword	1048588	18
71	submissionSubject	1048588	18
72	submissionDiscipline	1048588	18
73	submissionAgency	1048588	18
74	submissionKeyword	1048588	19
75	submissionSubject	1048588	19
76	submissionDiscipline	1048588	19
77	submissionAgency	1048588	19
78	submissionKeyword	1048588	20
79	submissionSubject	1048588	20
80	submissionDiscipline	1048588	20
81	submissionAgency	1048588	20
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
1	4	\N	5	\N	3	8	2025-01-23 05:20:40
2	4	\N	5	\N	3	16	2025-01-23 05:20:46
3	4	\N	5	\N	3	8	2025-01-23 05:20:51
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	\N	2025-01-23 05:18:23	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
2	1048585	1	\N	2025-01-23 05:18:23	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
3	1048585	1	\N	2025-01-23 05:18:23	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Carlo Corino" <ccorino@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
4	1048585	2	\N	2025-01-23 05:19:22	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
10	1048585	3	\N	2025-01-23 05:19:51	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Craig Montgomerie" <cmontgomerie@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
5	1048585	2	\N	2025-01-23 05:19:22	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
6	1048585	2	\N	2025-01-23 05:19:22	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
7	1048585	2	\N	2025-01-23 05:19:22	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Urho Kekkonen" <notanemailukk@mailinator.com>			Submission Acknowledgement	<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
8	1048585	3	\N	2025-01-23 05:19:50	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
9	1048585	3	\N	2025-01-23 05:19:50	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
11	1048585	3	\N	2025-01-23 05:19:51	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Irvine" <mirvine@mailinator.com>			Submission Acknowledgement	<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
12	1048585	4	\N	2025-01-23 05:20:35	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
13	1048585	4	\N	2025-01-23 05:20:35	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
14	1048585	4	\N	2025-01-23 05:20:35	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
15	1048585	4	3	2025-01-23 05:20:41	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
16	1048585	4	3	2025-01-23 05:20:46	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			We have reversed the decision to decline your submission	<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>
17	1048585	4	3	2025-01-23 05:20:51	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
18	1048585	5	\N	2025-01-23 05:21:12	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
44	1048585	13	\N	2025-01-23 05:24:32	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
19	1048585	5	\N	2025-01-23 05:21:12	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
20	1048585	5	\N	2025-01-23 05:21:12	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
21	1048585	6	\N	2025-01-23 05:21:44	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
22	1048585	6	\N	2025-01-23 05:21:44	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
45	1048585	13	\N	2025-01-23 05:24:32	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
23	1048585	6	\N	2025-01-23 05:21:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Domatilia Sokoloff" <dsokoloff@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
24	1048585	7	\N	2025-01-23 05:22:08	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
25	1048585	7	\N	2025-01-23 05:22:08	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
26	1048585	7	\N	2025-01-23 05:22:08	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Elinor Ostrom" <eostrom@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
27	1048585	7	\N	2025-01-23 05:22:08	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank van Laerhoven" <fvanlaerhoven@mailinator.com>			Submission Acknowledgement	<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
28	1048585	8	\N	2025-01-23 05:22:32	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
29	1048585	8	\N	2025-01-23 05:22:32	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
30	1048585	8	\N	2025-01-23 05:22:32	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
31	1048585	9	\N	2025-01-23 05:22:55	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
32	1048585	9	\N	2025-01-23 05:22:55	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
33	1048585	9	\N	2025-01-23 05:22:56	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
63	1048585	19	\N	2025-01-23 05:26:57	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
34	1048585	10	\N	2025-01-23 05:23:19	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
35	1048585	10	\N	2025-01-23 05:23:19	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
36	1048585	10	\N	2025-01-23 05:23:19	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Novak" <jnovak@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
37	1048585	11	\N	2025-01-23 05:23:44	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
43	1048585	12	\N	2025-01-23 05:24:08	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Leo Christopher" <lchristopher@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
38	1048585	11	\N	2025-01-23 05:23:44	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
39	1048585	11	\N	2025-01-23 05:23:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Karim Al-Khafaji" <kalkhafaji@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
40	1048585	11	\N	2025-01-23 05:23:44	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Margaret Morse" <mmorse@mailinator.com>			Submission Acknowledgement	<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
41	1048585	12	\N	2025-01-23 05:24:08	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
42	1048585	12	\N	2025-01-23 05:24:08	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
46	1048585	13	\N	2025-01-23 05:24:32	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
47	1048585	14	\N	2025-01-23 05:24:56	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
48	1048585	14	\N	2025-01-23 05:24:56	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
49	1048585	14	\N	2025-01-23 05:24:56	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Patricia Daniel" <pdaniel@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
50	1048585	15	\N	2025-01-23 05:25:20	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
51	1048585	15	\N	2025-01-23 05:25:20	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
52	1048585	15	\N	2025-01-23 05:25:20	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
53	1048585	16	\N	2025-01-23 05:25:46	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
54	1048585	16	\N	2025-01-23 05:25:46	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
55	1048585	16	\N	2025-01-23 05:25:46	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rosanna Rossi" <rrossi@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
56	1048585	17	\N	2025-01-23 05:26:10	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
57	1048585	17	\N	2025-01-23 05:26:10	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
58	1048585	17	\N	2025-01-23 05:26:10	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
59	1048585	18	\N	2025-01-23 05:26:33	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
60	1048585	18	\N	2025-01-23 05:26:33	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
61	1048585	18	\N	2025-01-23 05:26:33	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
62	1048585	19	\N	2025-01-23 05:26:57	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
64	1048585	19	\N	2025-01-23 05:26:57	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
\.


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log_users (email_log_user_id, email_log_id, user_id) FROM stdin;
1	1	4
2	2	5
3	3	7
4	4	4
5	5	5
6	6	8
7	8	4
8	9	5
9	10	9
10	12	4
11	13	5
12	14	10
13	15	10
14	16	10
15	17	10
16	18	4
17	19	5
18	20	11
19	21	4
20	22	5
21	23	12
22	24	4
23	25	5
24	26	13
25	28	4
26	29	5
27	30	14
28	31	4
29	32	5
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
43	CHANGE_EMAIL	en	Change Email Address Invitation	Confirm account contact email change request	<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href="{$acceptInvitationUrl}">confirm</a> the email change.</p><p>You can always <a href="{$declineInvitationUrl}">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}
45	ORCID_COLLECT_AUTHOR_ID	en		Submission ORCID	Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href="{$orcidAboutUrl}">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
47	ORCID_REQUEST_AUTHOR_AUTHORIZATION	en		Requesting ORCID record access	Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission "{$submissionTitle}" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href="{$authorOrcidUrl}" style="display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="ORCID iD icon" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href="{$authorOrcidUrl}">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href="{$orcidAboutUrl}">More about ORCID at {$serverName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n
98	SUBMISSION_SAVED_FOR_LATER	fr_CA	Soumission incomplète sauvegardée		<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href="{$submissionWizardUrl}">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href="{$serverUrl}">{$serverName}</a>.</p>
99	SUBMISSION_NEEDS_EDITOR	fr_CA	Soumission en attente de rédacteur-trice	Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}	<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href="{$submissionUrl}">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href="{$serverUrl}">{$serverName}</a>.</p>
100	CHANGE_EMAIL	fr_CA			
101	ORCID_COLLECT_AUTHOR_ID	fr_CA		Soumission ORCID	{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d'auteur ou d'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
102	ORCID_REQUEST_AUTHOR_AUTHORIZATION	fr_CA		Demande d'accès au dossier ORCID	{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l'accès en suivant les instructions.<br/>\n<a href="{$authorOrcidUrl}"><img id="orcid-id-logo" src="https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png" width='16' height='16' alt="icône identifiant ORCID" style="display: block; margin: 0 .5em 0 0; padding: 0; float: left;"/>Se connecter avec votre identifiant ORCID ou s'inscrire</a><br/>\n<br/>\n<br/>\n<a href="{$orcidAboutUrl}">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n
103	USER_ROLE_ASSIGNMENT_INVITATION	fr_CA			
104	USER_ROLE_END	fr_CA			
49	USER_ROLE_ASSIGNMENT_INVITATION	en		You are invited to new roles	<div class='email-container'>    <div class='email-header'>        <h2>Invitation to New Role</h2>    </div>    <div class='email-content'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$serverName}</p>        <p>At {$serverName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$serverName}</p>        <p>Feel free to contact me with any questions about the process.</p>        <p><a href='{$acceptUrl}' class='btn btn-accept'>Accept Invitation</a></p>        <p><a href='{$declineUrl}' class='btn btn-decline'>Decline Invitation</a></p>        <p>Kind regards,</p>        <p>{$serverName}</p>    </div></div><style>{$emailTemplateStyle}</style>
51	USER_ROLE_END	en	User Role Ended Notification	You have been removed from a role	<div class='email-container'>    <div class='email-header'>        <h2>Removed from a Role</h2>    </div>    <div class='email-content'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$serverName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$serverName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$serverName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$serverName}</p>    </div></div><style>{$emailTemplateStyle}</style>
95	DISCUSSION_NOTIFICATION_PRODUCTION	fr_CA	Discussion (production)	Un message à propos de la revue {$serverName}	Prière de saisir votre message.
96	EDITOR_ASSIGN_PRODUCTION	fr_CA	Rédacteur-trice assigné		
97	VERSION_CREATED	fr_CA	Version créée	Une nouvelle version a été créée pour {$submissionTitle}	<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href="{$serverUrl}">{$serverName}</a> pour vous informer qu'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href="{$submissionUrl}">{$submissionTitle}</a></p><hr>
79	PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de la réinitialisation du mot de passe	Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}
80	USER_REGISTER	fr_CA	Création de l'utilisateur-trice	Inscription au serveur	{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu'utilisateur-trice pour {$serverName}. Votre nom d'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}
81	USER_VALIDATE_CONTEXT	fr_CA		Valider votre compte	{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l'utiliser vous devez d'abord valider votre compte de courriel. Pour ce faire, vous n'avez qu'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}
82	USER_VALIDATE_SITE	fr_CA	Valider le courriel (site)		
83	SUBMISSION_ACK	fr_CA	Confirmation de soumission	Accusé de réception de la soumission	{$recipientName},<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}
84	POSTED_ACK	fr_CA			
85	POSTED_NEW_VERSION_ACK	fr_CA			
86	SUBMISSION_ACK_CAN_POST	fr_CA		Accusé de réception de la soumission	
87	SUBMISSION_ACK_NOT_USER	fr_CA	Confirmation de soumission (autres auteur-es)	Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}
88	EDITOR_ASSIGN	fr_CA	Rédacteur-trice assigné		
89	EDITOR_DECISION_ACCEPT	fr_CA	Soumission acceptée		
90	EDITOR_DECISION_INITIAL_DECLINE	fr_CA	Soumission refusée avant évaluation	Décision du rédacteur	\n\t\t\t{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$serverName}.<br />\n<br />\nNotre décision est de refuser votre soumission.
91	EDITOR_DECISION_REVERT_INITIAL_DECLINE	fr_CA	Rétablir une soumission refusée sans évaluation	Nous avons renversé la décision de rejeter votre soumission	<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e modérateur-trice évaluera votre soumission dans les détails afin de décider si votre soumission sera rejetée ou pourra être envoyée en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href="{$authorSubmissionUrl}">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n
92	EDITOR_DECISION_NOTIFY_OTHER_AUTHORS	fr_CA	Envoyer une notification aux autres auteur-es	Mise à jour concernant votre soumission	<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$serverName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l'intention de l'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}
93	STATISTICS_REPORT_NOTIFICATION	fr_CA	Notification sur les rapports statistiques		
94	ANNOUNCEMENT	fr_CA	Nouvelle annonce		
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
1	1048585	1	7	2025-01-23 05:18:09	268435458	submission.event.general.metadataUpdated	f
2	1048585	1	7	2025-01-23 05:18:10	268435458	submission.event.general.metadataUpdated	f
3	515	1	7	2025-01-23 05:18:20	1342177281	submission.event.fileUploaded	f
4	1048585	1	7	2025-01-23 05:18:20	1342177288	submission.event.fileRevised	f
5	515	1	7	2025-01-23 05:18:22	1342177296	submission.event.fileEdited	f
6	1048585	1	7	2025-01-23 05:18:23	268435457	submission.event.submissionSubmitted	f
7	1048585	2	8	2025-01-23 05:18:31	268435458	submission.event.general.metadataUpdated	f
8	1048585	2	8	2025-01-23 05:18:31	268435458	submission.event.general.metadataUpdated	f
9	1048585	2	8	2025-01-23 05:18:47	268435458	submission.event.general.metadataUpdated	f
10	515	2	8	2025-01-23 05:18:55	1342177281	submission.event.fileUploaded	f
11	1048585	2	8	2025-01-23 05:18:55	1342177288	submission.event.fileRevised	f
12	515	2	8	2025-01-23 05:18:57	1342177296	submission.event.fileEdited	f
13	1048585	2	8	2025-01-23 05:19:22	268435457	submission.event.submissionSubmitted	f
14	1048585	2	3	2025-01-23 05:19:31	268435462	publication.event.published	f
15	1048585	3	9	2025-01-23 05:19:37	268435458	submission.event.general.metadataUpdated	f
16	1048585	3	9	2025-01-23 05:19:37	268435458	submission.event.general.metadataUpdated	f
17	515	3	9	2025-01-23 05:19:47	1342177281	submission.event.fileUploaded	f
18	1048585	3	9	2025-01-23 05:19:47	1342177288	submission.event.fileRevised	f
19	515	3	9	2025-01-23 05:19:49	1342177296	submission.event.fileEdited	f
20	1048585	3	9	2025-01-23 05:19:51	268435457	submission.event.submissionSubmitted	f
21	1048585	3	3	2025-01-23 05:19:55	268435462	publication.event.published	f
22	1048585	3	3	2025-01-23 05:19:59	268435463	publication.event.unpublished	f
23	1048585	3	3	2025-01-23 05:20:02	268435458	submission.event.general.metadataUpdated	f
24	1048585	3	3	2025-01-23 05:20:04	268435462	publication.event.published	f
25	1048585	3	3	2025-01-23 05:20:07	268435458	submission.event.general.metadataUpdated	f
26	1048585	3	3	2025-01-23 05:20:07	268435464	publication.event.versionCreated	f
27	1048585	3	3	2025-01-23 05:20:13	268435458	submission.event.general.metadataUpdated	f
28	1048585	3	3	2025-01-23 05:20:15	268435462	publication.event.versionPublished	f
29	1048585	4	10	2025-01-23 05:20:22	268435458	submission.event.general.metadataUpdated	f
30	1048585	4	10	2025-01-23 05:20:22	268435458	submission.event.general.metadataUpdated	f
31	515	4	10	2025-01-23 05:20:32	1342177281	submission.event.fileUploaded	f
32	1048585	4	10	2025-01-23 05:20:32	1342177288	submission.event.fileRevised	f
33	515	4	10	2025-01-23 05:20:34	1342177296	submission.event.fileEdited	f
34	1048585	4	10	2025-01-23 05:20:35	268435457	submission.event.submissionSubmitted	f
35	1048585	4	3	2025-01-23 05:20:40	805306371	editor.submission.decision.decline.log	f
36	1048585	4	3	2025-01-23 05:20:46	805306371	editor.submission.decision.revertDecline.log	f
37	1048585	4	3	2025-01-23 05:20:51	805306371	editor.submission.decision.decline.log	f
38	1048585	5	11	2025-01-23 05:20:59	268435458	submission.event.general.metadataUpdated	f
39	1048585	5	11	2025-01-23 05:20:59	268435458	submission.event.general.metadataUpdated	f
40	515	5	11	2025-01-23 05:21:09	1342177281	submission.event.fileUploaded	f
41	1048585	5	11	2025-01-23 05:21:09	1342177288	submission.event.fileRevised	f
42	515	5	11	2025-01-23 05:21:11	1342177296	submission.event.fileEdited	f
43	1048585	5	11	2025-01-23 05:21:12	268435457	submission.event.submissionSubmitted	f
44	1048585	5	3	2025-01-23 05:21:16	268435462	publication.event.published	f
45	1048585	5	3	2025-01-23 05:21:20	268435463	publication.event.unpublished	f
46	1048585	5	3	2025-01-23 05:21:25	268435462	publication.event.published	f
47	1048585	6	12	2025-01-23 05:21:31	268435458	submission.event.general.metadataUpdated	f
48	1048585	6	12	2025-01-23 05:21:31	268435458	submission.event.general.metadataUpdated	f
49	515	6	12	2025-01-23 05:21:41	1342177281	submission.event.fileUploaded	f
50	1048585	6	12	2025-01-23 05:21:41	1342177288	submission.event.fileRevised	f
51	515	6	12	2025-01-23 05:21:43	1342177296	submission.event.fileEdited	f
52	1048585	6	12	2025-01-23 05:21:44	268435457	submission.event.submissionSubmitted	f
53	1048585	6	3	2025-01-23 05:21:48	268435462	publication.event.published	f
54	1048585	7	13	2025-01-23 05:21:55	268435458	submission.event.general.metadataUpdated	f
55	1048585	7	13	2025-01-23 05:21:55	268435458	submission.event.general.metadataUpdated	f
56	515	7	13	2025-01-23 05:22:05	1342177281	submission.event.fileUploaded	f
57	1048585	7	13	2025-01-23 05:22:05	1342177288	submission.event.fileRevised	f
58	515	7	13	2025-01-23 05:22:07	1342177296	submission.event.fileEdited	f
59	1048585	7	13	2025-01-23 05:22:08	268435457	submission.event.submissionSubmitted	f
60	1048585	7	3	2025-01-23 05:22:13	268435462	publication.event.published	f
61	1048585	8	14	2025-01-23 05:22:19	268435458	submission.event.general.metadataUpdated	f
62	1048585	8	14	2025-01-23 05:22:19	268435458	submission.event.general.metadataUpdated	f
63	515	8	14	2025-01-23 05:22:29	1342177281	submission.event.fileUploaded	f
64	1048585	8	14	2025-01-23 05:22:29	1342177288	submission.event.fileRevised	f
65	515	8	14	2025-01-23 05:22:31	1342177296	submission.event.fileEdited	f
66	1048585	8	14	2025-01-23 05:22:32	268435457	submission.event.submissionSubmitted	f
67	1048585	8	3	2025-01-23 05:22:36	268435462	publication.event.published	f
68	1048585	9	15	2025-01-23 05:22:42	268435458	submission.event.general.metadataUpdated	f
69	1048585	9	15	2025-01-23 05:22:43	268435458	submission.event.general.metadataUpdated	f
70	515	9	15	2025-01-23 05:22:52	1342177281	submission.event.fileUploaded	f
71	1048585	9	15	2025-01-23 05:22:52	1342177288	submission.event.fileRevised	f
72	515	9	15	2025-01-23 05:22:55	1342177296	submission.event.fileEdited	f
73	1048585	9	15	2025-01-23 05:22:56	268435457	submission.event.submissionSubmitted	f
74	1048585	9	3	2025-01-23 05:23:00	268435462	publication.event.published	f
75	1048585	10	16	2025-01-23 05:23:06	268435458	submission.event.general.metadataUpdated	f
76	1048585	10	16	2025-01-23 05:23:07	268435458	submission.event.general.metadataUpdated	f
77	515	10	16	2025-01-23 05:23:16	1342177281	submission.event.fileUploaded	f
78	1048585	10	16	2025-01-23 05:23:16	1342177288	submission.event.fileRevised	f
79	515	10	16	2025-01-23 05:23:18	1342177296	submission.event.fileEdited	f
80	1048585	10	16	2025-01-23 05:23:19	268435457	submission.event.submissionSubmitted	f
81	1048585	10	3	2025-01-23 05:23:24	268435462	publication.event.published	f
82	1048585	11	17	2025-01-23 05:23:30	268435458	submission.event.general.metadataUpdated	f
83	1048585	11	17	2025-01-23 05:23:31	268435458	submission.event.general.metadataUpdated	f
84	515	11	17	2025-01-23 05:23:40	1342177281	submission.event.fileUploaded	f
85	1048585	11	17	2025-01-23 05:23:40	1342177288	submission.event.fileRevised	f
86	515	11	17	2025-01-23 05:23:43	1342177296	submission.event.fileEdited	f
87	1048585	11	17	2025-01-23 05:23:44	268435457	submission.event.submissionSubmitted	f
88	1048585	11	3	2025-01-23 05:23:48	268435462	publication.event.published	f
89	1048585	12	18	2025-01-23 05:23:55	268435458	submission.event.general.metadataUpdated	f
90	1048585	12	18	2025-01-23 05:23:55	268435458	submission.event.general.metadataUpdated	f
91	515	12	18	2025-01-23 05:24:05	1342177281	submission.event.fileUploaded	f
92	1048585	12	18	2025-01-23 05:24:05	1342177288	submission.event.fileRevised	f
93	515	12	18	2025-01-23 05:24:07	1342177296	submission.event.fileEdited	f
94	1048585	12	18	2025-01-23 05:24:08	268435457	submission.event.submissionSubmitted	f
95	1048585	12	3	2025-01-23 05:24:13	268435462	publication.event.published	f
96	1048585	13	19	2025-01-23 05:24:19	268435458	submission.event.general.metadataUpdated	f
97	1048585	13	19	2025-01-23 05:24:19	268435458	submission.event.general.metadataUpdated	f
98	515	13	19	2025-01-23 05:24:29	1342177281	submission.event.fileUploaded	f
99	1048585	13	19	2025-01-23 05:24:29	1342177288	submission.event.fileRevised	f
100	515	13	19	2025-01-23 05:24:31	1342177296	submission.event.fileEdited	f
101	1048585	13	19	2025-01-23 05:24:32	268435457	submission.event.submissionSubmitted	f
102	1048585	13	3	2025-01-23 05:24:37	268435462	publication.event.published	f
103	1048585	14	20	2025-01-23 05:24:43	268435458	submission.event.general.metadataUpdated	f
104	1048585	14	20	2025-01-23 05:24:43	268435458	submission.event.general.metadataUpdated	f
105	515	14	20	2025-01-23 05:24:53	1342177281	submission.event.fileUploaded	f
106	1048585	14	20	2025-01-23 05:24:53	1342177288	submission.event.fileRevised	f
107	515	14	20	2025-01-23 05:24:55	1342177296	submission.event.fileEdited	f
108	1048585	14	20	2025-01-23 05:24:56	268435457	submission.event.submissionSubmitted	f
109	1048585	14	3	2025-01-23 05:25:01	268435462	publication.event.published	f
110	1048585	15	21	2025-01-23 05:25:07	268435458	submission.event.general.metadataUpdated	f
111	1048585	15	21	2025-01-23 05:25:07	268435458	submission.event.general.metadataUpdated	f
112	515	15	21	2025-01-23 05:25:17	1342177281	submission.event.fileUploaded	f
113	1048585	15	21	2025-01-23 05:25:17	1342177288	submission.event.fileRevised	f
114	515	15	21	2025-01-23 05:25:19	1342177296	submission.event.fileEdited	f
115	1048585	15	21	2025-01-23 05:25:20	268435457	submission.event.submissionSubmitted	f
116	1048585	15	3	2025-01-23 05:25:25	268435462	publication.event.published	f
117	1048585	16	22	2025-01-23 05:25:33	268435458	submission.event.general.metadataUpdated	f
118	1048585	16	22	2025-01-23 05:25:33	268435458	submission.event.general.metadataUpdated	f
119	515	16	22	2025-01-23 05:25:43	1342177281	submission.event.fileUploaded	f
120	1048585	16	22	2025-01-23 05:25:43	1342177288	submission.event.fileRevised	f
121	515	16	22	2025-01-23 05:25:45	1342177296	submission.event.fileEdited	f
122	1048585	16	22	2025-01-23 05:25:46	268435457	submission.event.submissionSubmitted	f
123	1048585	16	3	2025-01-23 05:25:50	268435462	publication.event.published	f
124	1048585	17	23	2025-01-23 05:25:57	268435458	submission.event.general.metadataUpdated	f
125	1048585	17	23	2025-01-23 05:25:57	268435458	submission.event.general.metadataUpdated	f
126	515	17	23	2025-01-23 05:26:06	1342177281	submission.event.fileUploaded	f
127	1048585	17	23	2025-01-23 05:26:06	1342177288	submission.event.fileRevised	f
128	515	17	23	2025-01-23 05:26:09	1342177296	submission.event.fileEdited	f
129	1048585	17	23	2025-01-23 05:26:10	268435457	submission.event.submissionSubmitted	f
130	1048585	17	3	2025-01-23 05:26:14	268435462	publication.event.published	f
131	1048585	18	24	2025-01-23 05:26:20	268435458	submission.event.general.metadataUpdated	f
132	1048585	18	24	2025-01-23 05:26:21	268435458	submission.event.general.metadataUpdated	f
133	515	18	24	2025-01-23 05:26:30	1342177281	submission.event.fileUploaded	f
134	1048585	18	24	2025-01-23 05:26:30	1342177288	submission.event.fileRevised	f
135	515	18	24	2025-01-23 05:26:33	1342177296	submission.event.fileEdited	f
136	1048585	18	24	2025-01-23 05:26:33	268435457	submission.event.submissionSubmitted	f
137	1048585	18	3	2025-01-23 05:26:38	268435462	publication.event.published	f
138	1048585	19	25	2025-01-23 05:26:44	268435458	submission.event.general.metadataUpdated	f
139	1048585	19	25	2025-01-23 05:26:44	268435458	submission.event.general.metadataUpdated	f
140	515	19	25	2025-01-23 05:26:54	1342177281	submission.event.fileUploaded	f
141	1048585	19	25	2025-01-23 05:26:54	1342177288	submission.event.fileRevised	f
142	515	19	25	2025-01-23 05:26:56	1342177296	submission.event.fileEdited	f
143	1048585	19	25	2025-01-23 05:26:57	268435457	submission.event.submissionSubmitted	f
144	1048585	19	3	2025-01-23 05:27:01	268435462	publication.event.published	f
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
1	database	queue	{"uuid":"fb8bce46-a633-4b02-9095-43a42e31410c","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:1;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:18:33
2	database	queue	{"uuid":"33661d08-6557-41bc-bb94-5597765391ab","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:2;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:19:13
3	database	queue	{"uuid":"037ff0d9-5d4b-4595-8bf1-5da64868f8b5","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:2;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:19:45
4	database	queue	{"uuid":"44511caa-b8eb-45af-902c-a8b5a53dd46a","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:3;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:20:00
5	database	queue	{"uuid":"aa60b318-5d24-4cc0-917f-152e0eae05bc","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:3;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:20:17
6	database	queue	{"uuid":"57f3aa1b-48bd-4402-8d60-ecc217688dcb","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:3;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:20:29
7	database	queue	{"uuid":"9bed675d-708b-4dc2-9761-b979422a0be9","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:4;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:20:45
8	database	queue	{"uuid":"3db83851-b3f9-4156-8ca1-577296881f4b","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:5;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:21:21
9	database	queue	{"uuid":"f2b9736f-f2e2-401b-a256-0c21bd86209a","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:5;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:21:39
10	database	queue	{"uuid":"97b80822-bb39-460e-a441-4d75d2eaa47a","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:6;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:21:53
11	database	queue	{"uuid":"13ea1cdd-b470-41fc-b7f7-d888b8bdbea7","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:6;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:22:02
12	database	queue	{"uuid":"6d5b9cb3-dd8e-4f99-b1f8-aabb96e7c240","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:7;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:22:17
13	database	queue	{"uuid":"d41541fc-2612-4590-9c57-6defebad64f8","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:7;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:22:27
14	database	queue	{"uuid":"008ecc25-3c86-4775-b6f7-d8e48f34158b","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:8;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:22:41
15	database	queue	{"uuid":"7a0dec49-8bc9-403a-98f9-19b733b9786a","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:8;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:22:50
16	database	queue	{"uuid":"7b78b172-b3ed-4a66-9905-f41709e20a06","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:9;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:23:05
17	database	queue	{"uuid":"eb07ed3b-8244-4792-8780-6b8cb450962b","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:9;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:23:14
18	database	queue	{"uuid":"7e776d82-f991-4c83-ae47-0431b715e723","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:10;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:23:29
19	database	queue	{"uuid":"34078825-0589-4b43-bb06-d514e8999d79","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:10;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:23:38
20	database	queue	{"uuid":"aeae5569-98d6-49f2-ad22-e411e510b440","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:11;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:23:53
21	database	queue	{"uuid":"92e3c5ae-be71-41cc-8a35-21586de6c41e","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:11;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:24:03
22	database	queue	{"uuid":"45b33831-3321-4e4c-b2e4-d73d7fb1d5ef","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:12;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:24:17
23	database	queue	{"uuid":"f0f16494-374d-4386-afb2-6dab30bbfa68","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:12;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:24:27
24	database	queue	{"uuid":"3a9abce7-e783-47b0-95df-60798e87d6ed","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:13;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:24:41
25	database	queue	{"uuid":"8d5493af-1045-43c5-9833-5f849b1c65c7","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:13;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:24:51
26	database	queue	{"uuid":"7da2113b-9ad0-4921-84b9-453ae0bbccfd","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:14;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:25:05
27	database	queue	{"uuid":"c539dd8b-19a6-40b1-b7f0-750a32f9d7c0","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:14;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:25:15
28	database	queue	{"uuid":"9e297413-377d-4a1d-9c45-0d09aae223af","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:15;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:25:29
29	database	queue	{"uuid":"b54f0673-9ecc-4265-bae0-deaf096e7662","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:15;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:25:35
30	database	queue	{"uuid":"5d2a1139-adfc-4b77-a18d-25f9cc062937","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:16;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:25:55
31	database	queue	{"uuid":"f968d9fa-4c6e-485a-9f91-a261a72189ce","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:16;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:26:04
32	database	queue	{"uuid":"24a8d987-1b7a-4fa9-a2bf-e3ee525f8ea8","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:17;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:26:19
33	database	queue	{"uuid":"a6241c8d-2066-4e68-965d-1ccecec131cf","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:17;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:26:28
34	database	queue	{"uuid":"0acbfb1b-227b-4092-bd17-e86c49f699a4","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:18;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:26:44
35	database	queue	{"uuid":"737f5441-4a7a-4aca-a097-af2f37e92a24","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:18;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-23 05:26:52
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	contexts/1/submissions/1/6791d11c019e4.pdf	application/pdf
2	contexts/1/submissions/2/6791d13f1f839.pdf	application/pdf
3	contexts/1/submissions/3/6791d1736ebe4.pdf	application/pdf
4	contexts/1/submissions/4/6791d1a015fc0.pdf	application/pdf
5	contexts/1/submissions/5/6791d1c539e2a.pdf	application/pdf
6	contexts/1/submissions/6/6791d1e53d194.pdf	application/pdf
7	contexts/1/submissions/7/6791d1fd0d0a9.pdf	application/pdf
8	contexts/1/submissions/8/6791d2152d7f8.pdf	application/pdf
9	contexts/1/submissions/9/6791d22cd4d1f.pdf	application/pdf
10	contexts/1/submissions/10/6791d244aae7b.pdf	application/pdf
11	contexts/1/submissions/11/6791d25cb5ba6.pdf	application/pdf
12	contexts/1/submissions/12/6791d27536c95.pdf	application/pdf
13	contexts/1/submissions/13/6791d28d633b9.pdf	application/pdf
14	contexts/1/submissions/14/6791d2a58a764.pdf	application/pdf
15	contexts/1/submissions/15/6791d2bd76e12.pdf	application/pdf
16	contexts/1/submissions/16/6791d2d70fb06.pdf	application/pdf
17	contexts/1/submissions/17/6791d2eedf40e.pdf	application/pdf
18	contexts/1/submissions/18/6791d306a321a.pdf	application/pdf
19	contexts/1/submissions/19/6791d31e6c813.pdf	application/pdf
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
1	1	\N	Crossref XML preprint export	APP\\plugins\\generic\\crossref\\filter\\PreprintCrossrefXmlFilter	0	\N	0
2	2	\N	Extract metadata from a(n) Submission	APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPreprintAdapter	0	\N	0
3	3	\N	Native XML submission export	APP\\plugins\\importexport\\native\\filter\\PreprintNativeXmlFilter	0	\N	0
4	4	\N	Native XML submission import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFilter	0	\N	0
5	5	\N	Native XML author export	APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter	0	\N	0
6	6	\N	Native XML author import	APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter	0	\N	0
7	8	\N	Native XML submission file import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFileFilter	0	\N	0
8	7	\N	Native XML submission file export	PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter	0	\N	0
9	9	\N	Native XML representation export	APP\\plugins\\importexport\\native\\filter\\PreprintGalleyNativeXmlFilter	0	\N	0
10	10	\N	Native XML representation import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintGalleyFilter	0	\N	0
11	11	\N	Native XML Publication export	APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter	0	\N	0
12	12	\N	Native XML publication import	APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter	0	\N	0
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
-- Data for Name: highlight_settings; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.highlight_settings (highlight_setting_id, highlight_id, locale, setting_name, setting_value) FROM stdin;
\.


--
-- Data for Name: highlights; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.highlights (highlight_id, context_id, sequence, url) FROM stdin;
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
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.invitations (invitation_id, key_hash, type, user_id, inviter_id, expiry_date, payload, status, email, context_id, created_at, updated_at) FROM stdin;
4	$2y$10$TL0TdrA0DHVbWO1tw6aKbu7MVQNNkIZc00yP6yv66.HjxTodxi/V6	userRoleAssignment	\N	1	2025-01-26 05:16:11	{"userOrcid":null,"givenName":{"en":"Daniel","fr_CA":"Daniel"},"familyName":{"en":"Barnes","fr_CA":"Barnes"},"affiliation":{"en":"University of Melbourne","fr_CA":"Australia"},"userCountry":"AU","username":"dbarnes","password":"$2y$10$IIuJt.ONamwh4FnDpQHdi.Mc7XiYIqbkNQ2UNuh7i\\/ypOU\\/.B9UOG","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"dbarnes@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"dbarnes@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	dbarnes@mailinator.com	1	2025-01-23 05:16:11	2025-01-23 05:16:21
2	$2y$10$dz5fGGt6w2.Fuj1wVUoNqeNtR3mMr7D7k.De0w.KRH1Oz7TxxvsDC	userRoleAssignment	\N	1	2025-01-26 05:15:50	{"userOrcid":null,"givenName":{"en":"Ramiro","fr_CA":"Ramiro"},"familyName":{"en":"Vaca","fr_CA":"Vaca"},"affiliation":{"en":"Universidad Nacional Aut\\u00f3noma de M\\u00e9xico","fr_CA":"Mexico"},"userCountry":"MX","username":"rvaca","password":"$2y$10$WG1q2oPIR7.9tuTuSR1hDuzwtx6Udlb0SOxukah0.Vtmm3vLe66Am","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"rvaca@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"rvaca@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	rvaca@mailinator.com	1	2025-01-23 05:15:50	2025-01-23 05:16:00
6	$2y$10$lM5bo4L18i9nTM5uVjMikeVQrnVyG0RvYB40E13Zbzm5ZHm/WsI8e	userRoleAssignment	\N	1	2025-01-26 05:16:32	{"userOrcid":null,"givenName":{"en":"David","fr_CA":"David"},"familyName":{"en":"Buskins","fr_CA":"Buskins"},"affiliation":{"en":"University of Chicago","fr_CA":"United States"},"userCountry":"US","username":"dbuskins","password":"$2y$10$B1i4Wp8b9ff1CFbeJ.huFOdY2MQrS\\/GaTBzU5LWJ7ykIW6PPWl1xi","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"dbuskins@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"dbuskins@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	dbuskins@mailinator.com	1	2025-01-23 05:16:32	2025-01-23 05:16:43
8	$2y$10$75USs0M4R73VbcPqxbuCE.A8Qo4WMrY.zJnD5DIh3Zc22y.FgvH4W	userRoleAssignment	\N	1	2025-01-26 05:16:55	{"userOrcid":null,"givenName":{"en":"Stephanie","fr_CA":"Stephanie"},"familyName":{"en":"Berardo","fr_CA":"Berardo"},"affiliation":{"en":"University of Toronto","fr_CA":"Canada"},"userCountry":"CA","username":"sberardo","password":"$2y$10$SDEP7MrlGZnX9MA4jf9kXuDRafvfDKsVUqI631jRCI3HRcKPcd3qG","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"sberardo@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"sberardo@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	sberardo@mailinator.com	1	2025-01-23 05:16:55	2025-01-23 05:17:06
10	$2y$10$HeXGd2PQlzklI3GAKIwAn.G3aYIxPlpP8ZbKkDLwypTiqaW1xzjaa	userRoleAssignment	\N	1	2025-01-26 05:17:19	{"userOrcid":null,"givenName":{"en":"Minoti","fr_CA":"Minoti"},"familyName":{"en":"Inoue","fr_CA":"Inoue"},"affiliation":{"en":"Kyoto University","fr_CA":"Japan"},"userCountry":"JP","username":"minoue","password":"$2y$10$41wKiIe1ucpXjJDCo6lxFule32iq0Ezok1YMhXjv6r9tS1UQuVMMW","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"minoue@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-23","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"minoue@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	minoue@mailinator.com	1	2025-01-23 05:17:19	2025-01-23 05:17:31
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
114	queue	{"uuid":"1b21fe1a-93da-4322-b4fb-f691c96ef019","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:19;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	2	\N	1737610026	1737610021
116	queue	{"uuid":"910efe1c-e0b1-401e-988d-5ed57ce3c555","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:19;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	1	\N	1737610027	1737610022
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
1	1	1	\N	0
2	1	2	\N	1
3	1	3	\N	2
4	1	4	3	0
5	1	5	3	1
6	1	6	3	2
7	1	7	3	3
8	2	8	\N	0
9	2	9	\N	1
10	2	10	\N	2
11	2	11	10	0
12	2	12	10	1
13	2	13	10	2
14	2	14	10	3
15	3	15	\N	0
16	3	16	\N	1
17	3	17	\N	2
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
20	20		titleLocaleKey	common.editorialMasthead	string
21	21		titleLocaleKey	manager.setup.privacyStatement	string
22	22		titleLocaleKey	about.contact	string
23	23		titleLocaleKey	common.search	string
\.


--
-- Data for Name: navigation_menu_items; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menu_items (navigation_menu_item_id, context_id, path, type) FROM stdin;
1	\N	\N	NMI_TYPE_USER_REGISTER
2	\N	\N	NMI_TYPE_USER_LOGIN
3	\N	\N	NMI_TYPE_USER_DASHBOARD
4	\N	\N	NMI_TYPE_USER_DASHBOARD
5	\N	\N	NMI_TYPE_USER_PROFILE
6	\N	\N	NMI_TYPE_ADMINISTRATION
7	\N	\N	NMI_TYPE_USER_LOGOUT
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
20	1	\N	NMI_TYPE_MASTHEAD
21	1	\N	NMI_TYPE_PRIVACY
22	1	\N	NMI_TYPE_CONTACT
23	1	\N	NMI_TYPE_SEARCH
\.


--
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	\N	user	User Navigation Menu
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

COPY public.notification_subscription_settings (setting_id, setting_name, setting_value, user_id, context_id, setting_type) FROM stdin;
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
75	1	\N	2	16777245	2025-01-23 05:23:44	\N	1048585	11
76	1	\N	3	16777222	2025-01-23 05:24:08	\N	1048585	12
77	1	\N	3	16777223	2025-01-23 05:24:08	\N	1048585	12
78	1	4	2	16777217	2025-01-23 05:24:08	\N	1048585	12
5	1	\N	3	16777222	2025-01-23 05:18:22	\N	1048585	1
6	1	\N	3	16777223	2025-01-23 05:18:22	\N	1048585	1
7	1	4	2	16777217	2025-01-23 05:18:22	\N	1048585	1
8	1	5	2	16777217	2025-01-23 05:18:23	\N	1048585	1
9	1	\N	2	16777243	2025-01-23 05:18:23	\N	1048585	1
10	1	\N	2	16777245	2025-01-23 05:18:23	\N	1048585	1
11	1	\N	3	16777222	2025-01-23 05:19:22	\N	1048585	2
12	1	\N	3	16777223	2025-01-23 05:19:22	\N	1048585	2
13	1	4	2	16777217	2025-01-23 05:19:22	\N	1048585	2
14	1	5	2	16777217	2025-01-23 05:19:22	\N	1048585	2
15	1	\N	2	16777243	2025-01-23 05:19:22	\N	1048585	2
16	1	\N	2	16777245	2025-01-23 05:19:22	\N	1048585	2
17	1	\N	3	16777222	2025-01-23 05:19:50	\N	1048585	3
18	1	\N	3	16777223	2025-01-23 05:19:50	\N	1048585	3
19	1	4	2	16777217	2025-01-23 05:19:50	\N	1048585	3
20	1	5	2	16777217	2025-01-23 05:19:50	\N	1048585	3
21	1	\N	2	16777243	2025-01-23 05:19:51	\N	1048585	3
22	1	\N	2	16777245	2025-01-23 05:19:51	\N	1048585	3
23	1	4	3	16777259	2025-01-23 05:20:07	\N	1048585	3
24	1	5	3	16777259	2025-01-23 05:20:07	\N	1048585	3
25	1	9	3	16777259	2025-01-23 05:20:07	\N	1048585	3
26	1	\N	3	16777222	2025-01-23 05:20:35	\N	1048585	4
27	1	\N	3	16777223	2025-01-23 05:20:35	\N	1048585	4
28	1	4	2	16777217	2025-01-23 05:20:35	\N	1048585	4
29	1	5	2	16777217	2025-01-23 05:20:35	\N	1048585	4
30	1	\N	2	16777243	2025-01-23 05:20:35	\N	1048585	4
31	1	\N	2	16777245	2025-01-23 05:20:35	\N	1048585	4
33	1	10	2	16777234	2025-01-23 05:20:51	\N	1048585	4
34	1	\N	3	16777222	2025-01-23 05:21:12	\N	1048585	5
35	1	\N	3	16777223	2025-01-23 05:21:12	\N	1048585	5
36	1	4	2	16777217	2025-01-23 05:21:12	\N	1048585	5
37	1	5	2	16777217	2025-01-23 05:21:12	\N	1048585	5
38	1	\N	2	16777243	2025-01-23 05:21:12	\N	1048585	5
39	1	\N	2	16777245	2025-01-23 05:21:12	\N	1048585	5
40	1	\N	3	16777222	2025-01-23 05:21:44	\N	1048585	6
41	1	\N	3	16777223	2025-01-23 05:21:44	\N	1048585	6
42	1	4	2	16777217	2025-01-23 05:21:44	\N	1048585	6
43	1	5	2	16777217	2025-01-23 05:21:44	\N	1048585	6
44	1	\N	2	16777243	2025-01-23 05:21:44	\N	1048585	6
45	1	\N	2	16777245	2025-01-23 05:21:44	\N	1048585	6
46	1	\N	3	16777222	2025-01-23 05:22:08	\N	1048585	7
47	1	\N	3	16777223	2025-01-23 05:22:08	\N	1048585	7
48	1	4	2	16777217	2025-01-23 05:22:08	\N	1048585	7
49	1	5	2	16777217	2025-01-23 05:22:08	\N	1048585	7
50	1	\N	2	16777243	2025-01-23 05:22:08	\N	1048585	7
51	1	\N	2	16777245	2025-01-23 05:22:08	\N	1048585	7
52	1	\N	3	16777222	2025-01-23 05:22:32	\N	1048585	8
53	1	\N	3	16777223	2025-01-23 05:22:32	\N	1048585	8
54	1	4	2	16777217	2025-01-23 05:22:32	\N	1048585	8
55	1	5	2	16777217	2025-01-23 05:22:32	\N	1048585	8
56	1	\N	2	16777243	2025-01-23 05:22:32	\N	1048585	8
57	1	\N	2	16777245	2025-01-23 05:22:32	\N	1048585	8
58	1	\N	3	16777222	2025-01-23 05:22:55	\N	1048585	9
59	1	\N	3	16777223	2025-01-23 05:22:55	\N	1048585	9
60	1	4	2	16777217	2025-01-23 05:22:55	\N	1048585	9
61	1	5	2	16777217	2025-01-23 05:22:55	\N	1048585	9
62	1	\N	2	16777243	2025-01-23 05:22:56	\N	1048585	9
63	1	\N	2	16777245	2025-01-23 05:22:56	\N	1048585	9
64	1	\N	3	16777222	2025-01-23 05:23:19	\N	1048585	10
65	1	\N	3	16777223	2025-01-23 05:23:19	\N	1048585	10
66	1	4	2	16777217	2025-01-23 05:23:19	\N	1048585	10
67	1	5	2	16777217	2025-01-23 05:23:19	\N	1048585	10
68	1	\N	2	16777243	2025-01-23 05:23:19	\N	1048585	10
69	1	\N	2	16777245	2025-01-23 05:23:19	\N	1048585	10
70	1	\N	3	16777222	2025-01-23 05:23:44	\N	1048585	11
71	1	\N	3	16777223	2025-01-23 05:23:44	\N	1048585	11
72	1	4	2	16777217	2025-01-23 05:23:44	\N	1048585	11
73	1	5	2	16777217	2025-01-23 05:23:44	\N	1048585	11
74	1	\N	2	16777243	2025-01-23 05:23:44	\N	1048585	11
79	1	5	2	16777217	2025-01-23 05:24:08	\N	1048585	12
80	1	\N	2	16777243	2025-01-23 05:24:08	\N	1048585	12
81	1	\N	2	16777245	2025-01-23 05:24:08	\N	1048585	12
82	1	\N	3	16777222	2025-01-23 05:24:32	\N	1048585	13
83	1	\N	3	16777223	2025-01-23 05:24:32	\N	1048585	13
84	1	4	2	16777217	2025-01-23 05:24:32	\N	1048585	13
85	1	5	2	16777217	2025-01-23 05:24:32	\N	1048585	13
86	1	\N	2	16777243	2025-01-23 05:24:32	\N	1048585	13
87	1	\N	2	16777245	2025-01-23 05:24:32	\N	1048585	13
88	1	\N	3	16777222	2025-01-23 05:24:56	\N	1048585	14
89	1	\N	3	16777223	2025-01-23 05:24:56	\N	1048585	14
90	1	4	2	16777217	2025-01-23 05:24:56	\N	1048585	14
91	1	5	2	16777217	2025-01-23 05:24:56	\N	1048585	14
92	1	\N	2	16777243	2025-01-23 05:24:56	\N	1048585	14
93	1	\N	2	16777245	2025-01-23 05:24:56	\N	1048585	14
94	1	\N	3	16777222	2025-01-23 05:25:20	\N	1048585	15
95	1	\N	3	16777223	2025-01-23 05:25:20	\N	1048585	15
96	1	4	2	16777217	2025-01-23 05:25:20	\N	1048585	15
97	1	5	2	16777217	2025-01-23 05:25:20	\N	1048585	15
98	1	\N	2	16777243	2025-01-23 05:25:20	\N	1048585	15
99	1	\N	2	16777245	2025-01-23 05:25:20	\N	1048585	15
100	1	\N	3	16777222	2025-01-23 05:25:46	\N	1048585	16
101	1	\N	3	16777223	2025-01-23 05:25:46	\N	1048585	16
102	1	4	2	16777217	2025-01-23 05:25:46	\N	1048585	16
103	1	5	2	16777217	2025-01-23 05:25:46	\N	1048585	16
104	1	\N	2	16777243	2025-01-23 05:25:46	\N	1048585	16
105	1	\N	2	16777245	2025-01-23 05:25:46	\N	1048585	16
106	1	\N	3	16777222	2025-01-23 05:26:09	\N	1048585	17
107	1	\N	3	16777223	2025-01-23 05:26:09	\N	1048585	17
108	1	4	2	16777217	2025-01-23 05:26:09	\N	1048585	17
109	1	5	2	16777217	2025-01-23 05:26:09	\N	1048585	17
110	1	\N	2	16777243	2025-01-23 05:26:10	\N	1048585	17
111	1	\N	2	16777245	2025-01-23 05:26:10	\N	1048585	17
112	1	\N	3	16777222	2025-01-23 05:26:33	\N	1048585	18
113	1	\N	3	16777223	2025-01-23 05:26:33	\N	1048585	18
114	1	4	2	16777217	2025-01-23 05:26:33	\N	1048585	18
115	1	5	2	16777217	2025-01-23 05:26:33	\N	1048585	18
116	1	\N	2	16777243	2025-01-23 05:26:33	\N	1048585	18
117	1	\N	2	16777245	2025-01-23 05:26:33	\N	1048585	18
118	1	\N	3	16777222	2025-01-23 05:26:57	\N	1048585	19
119	1	\N	3	16777223	2025-01-23 05:26:57	\N	1048585	19
120	1	4	2	16777217	2025-01-23 05:26:57	\N	1048585	19
121	1	5	2	16777217	2025-01-23 05:26:57	\N	1048585	19
122	1	\N	2	16777243	2025-01-23 05:26:57	\N	1048585	19
123	1	\N	2	16777245	2025-01-23 05:26:57	\N	1048585	19
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
1	defaultthemeplugin	\N	enabled	1	bool
2	usageeventplugin	\N	enabled	1	bool
3	tinymceplugin	\N	enabled	1	bool
4	languagetoggleblockplugin	\N	enabled	1	bool
5	languagetoggleblockplugin	\N	seq	4	int
6	developedbyblockplugin	\N	enabled	0	bool
7	developedbyblockplugin	\N	seq	0	int
8	tinymceplugin	1	enabled	1	bool
9	defaultthemeplugin	1	enabled	1	bool
10	languagetoggleblockplugin	1	enabled	1	bool
11	languagetoggleblockplugin	1	seq	4	int
12	developedbyblockplugin	1	enabled	0	bool
13	developedbyblockplugin	1	seq	0	int
14	pdfjsviewerplugin	1	enabled	1	bool
15	googlescholarplugin	1	enabled	1	bool
16	webfeedplugin	1	enabled	1	bool
17	webfeedplugin	1	displayPage	homepage	string
18	webfeedplugin	1	displayItems	1	bool
19	webfeedplugin	1	recentItems	30	int
20	webfeedplugin	1	includeIdentifiers	0	bool
21	defaultthemeplugin	1	typography	notoSans	string
22	defaultthemeplugin	1	baseColour	#1E6292	string
23	defaultthemeplugin	1	showDescriptionInServerIndex	false	string
24	defaultthemeplugin	1	useHomepageImageAsHeader	false	string
25	defaultthemeplugin	1	displayStats	none	string
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
2	1	en	title	The influence of lactation on the quantity and quality of cashmere production
13	4	en	abstract	The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.
4	2	en	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>
5	2	en	copyrightHolder	Public Knowledge Preprint Server
6	2	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
7	2		copyrightYear	2025
3	2	en	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence
14	4	en	copyrightHolder	Craig Montgomerie
8	3	en	abstract	The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.
10	3	en	copyrightHolder	Public Knowledge Preprint Server
11	3	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
12	3		copyrightYear	2025
9	3	en	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
25	7	en	abstract	A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.
27	7	en	copyrightHolder	Public Knowledge Preprint Server
28	7	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
29	7		copyrightYear	2025
26	7	en	title	Developing efficacy beliefs in the classroom
15	4	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
16	4		copyrightYear	2025
17	4	en	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice
18	5	en	abstract	In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.
19	5	en	title	Genetic transformation of forest trees
30	8	en	abstract	The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.
32	8	en	copyrightHolder	Public Knowledge Preprint Server
33	8	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
34	8		copyrightYear	2025
31	8	en	title	Developing efficacy beliefs in the classroom
20	6	en	abstract	Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.
22	6	en	copyrightHolder	Public Knowledge Preprint Server
23	6	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
24	6		copyrightYear	2025
21	6	en	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement
35	9	en	abstract	None.
37	9	en	copyrightHolder	Public Knowledge Preprint Server
38	9	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
39	9		copyrightYear	2025
36	9	en	title	Hansen & Pinto: Reason Reclaimed
40	10	en	abstract	The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.
42	10	en	copyrightHolder	Public Knowledge Preprint Server
43	10	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
44	10		copyrightYear	2025
41	10	en	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence
46	11	en	title	Condensing Water Availability Models to Focus on Specific Water Management Systems
45	11	en	abstract	The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.
47	11	en	copyrightHolder	Public Knowledge Preprint Server
48	11	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
49	11		copyrightYear	2025
50	12	en	abstract	Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.
52	12	en	copyrightHolder	Public Knowledge Preprint Server
53	12	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
54	12		copyrightYear	2025
51	12	en	title	Learning Sustainable Design through Service
55	13	en	abstract	The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.
57	13	en	copyrightHolder	Public Knowledge Preprint Server
58	13	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
59	13		copyrightYear	2025
56	13	en	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning
61	14	en	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions
60	14	en	abstract	The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.
62	14	en	copyrightHolder	Public Knowledge Preprint Server
63	14	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
64	14		copyrightYear	2025
65	15	en	abstract	One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.
67	15	en	copyrightHolder	Public Knowledge Preprint Server
68	15	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
69	15		copyrightYear	2025
66	15	en	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua
70	16	en	abstract	This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.
72	16	en	copyrightHolder	Public Knowledge Preprint Server
73	16	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
74	16		copyrightYear	2025
71	16	en	title	Yam diseases and its management in Nigeria
76	17	en	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat
75	17	en	abstract	Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.
77	17	en	copyrightHolder	Public Knowledge Preprint Server
78	17	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
79	17		copyrightYear	2025
80	18	en	abstract	The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.
82	18	en	copyrightHolder	Public Knowledge Preprint Server
83	18	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
84	18		copyrightYear	2025
81	18	en	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran
85	19	en	abstract	We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.
87	19	en	copyrightHolder	Public Knowledge Preprint Server
88	19	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
89	19		copyrightYear	2025
86	19	en	title	Self-Organization in Multi-Level Institutions in Networked Environments
90	20	en	abstract	None.
92	20	en	copyrightHolder	Public Knowledge Preprint Server
93	20	fr_CA	copyrightHolder	Serveur de prépublication de la connaissance du public
94	20		copyrightYear	2025
91	20	en	title	Finocchiaro: Arguments About Arguments
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.publications (publication_id, access_status, date_published, last_modified, primary_contact_id, section_id, submission_id, status, url_path, version, doi_id) FROM stdin;
17	0	2025-01-23	2025-01-23 05:25:50	23	1	16	3	\N	1	\N
1	0	\N	2025-01-23 05:18:10	1	1	1	1	\N	1	\N
2	0	2025-01-23	2025-01-23 05:19:30	2	1	2	3	\N	1	\N
18	0	2025-01-23	2025-01-23 05:26:14	24	1	17	3	\N	1	\N
19	0	2025-01-23	2025-01-23 05:26:38	25	1	18	3	\N	1	\N
3	0	2025-01-23	2025-01-23 05:20:04	5	1	3	3	\N	1	\N
4	0	2025-01-23	2025-01-23 05:20:15	7	1	3	3	\N	2	\N
5	0	\N	2025-01-23 05:20:22	9	1	4	1	\N	1	\N
20	0	2025-01-23	2025-01-23 05:27:01	26	1	19	3	\N	1	\N
6	0	2025-01-23	2025-01-23 05:21:25	10	1	5	3	\N	1	\N
7	0	2025-01-23	2025-01-23 05:21:48	11	1	6	3	\N	1	\N
8	0	2025-01-23	2025-01-23 05:22:12	12	1	7	3	\N	1	\N
9	0	2025-01-23	2025-01-23 05:22:36	14	1	8	3	\N	1	\N
10	0	2025-01-23	2025-01-23 05:23:00	15	1	9	3	\N	1	\N
11	0	2025-01-23	2025-01-23 05:23:24	16	1	10	3	\N	1	\N
12	0	2025-01-23	2025-01-23 05:23:48	17	1	11	3	\N	1	\N
13	0	2025-01-23	2025-01-23 05:24:12	19	1	12	3	\N	1	\N
14	0	2025-01-23	2025-01-23 05:24:37	20	1	13	3	\N	1	\N
15	0	2025-01-23	2025-01-23 05:25:01	21	1	14	3	\N	1	\N
16	0	2025-01-23	2025-01-23 05:25:25	22	1	15	3	\N	1	\N
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

COPY public.review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, cancelled, date_cancelled, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, considered, request_resent) FROM stdin;
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
10	1		contactName	Ramiro Vaca
11	1	en	contributorsHelp	<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>
13	1		country	IS
14	1		defaultReviewMode	2
15	1	en	description	<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>
19	1		copySubmissionAckPrimaryContact	0
28	1	fr_CA	forTheEditorsHelp	<p>S'il vous plaît, fournissez les détails suivants afin d'aider l'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>
29	1		itemsPerPage	25
32	1	fr_CA	librarianInformation	##default.contextSettings.forLibrarians##
33	1	en	name	Public Knowledge Preprint Server
34	1	fr_CA	name	Serveur de prépublication de la connaissance du public
35	1		notifyAllAuthors	1
6	1	fr_CA	authorInformation	##default.contextSettings.forAuthors##
7	1	en	beginSubmissionHelp	<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href="http://localhost/index.php/publicknowledge/about/submissions" target="_blank">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>
9	1		contactEmail	rvaca@mailinator.com
12	1	fr_CA	contributorsHelp	<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu'il ou elle doit demeurer anonyme ou n'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>
16	1	fr_CA	description	<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l'accès du public à la science.</p>
20	1		copySubmissionAckAddress	
21	1		emailSignature	<br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
22	1		enableDois	1
30	1		keywords	request
31	1	en	librarianInformation	We encourage research librarians to list this server among their library's holdings. As well, it may be worth noting that this server's open source system is suitable for libraries to host for their faculty members to use (see <a href="https://pkp.sfu.ca">Public Knowledge Project</a>).
36	1		numPageLinks	10
37	1		numWeeksPerResponse	4
17	1	en	detailsHelp	<p>Please provide the following details to help us manage your submission in our system.</p>
18	1	fr_CA	detailsHelp	<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>
23	1		doiSuffixType	default
24	1		registrationAgency	
38	1		numWeeksPerReview	4
1	1	en	acronym	JPKPKP
4	1	fr_CA	authorGuidelines	##default.contextSettings.authorGuidelines##
25	1		disableSubmissions	0
26	1		editorialStatsEmail	1
27	1	en	forTheEditorsHelp	<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>
5	1	en	authorInformation	Interested in submitting to this server? We recommend that you review the <a href="http://localhost/index.php/publicknowledge/about">About</a> page for the policies, as well as the <a href="http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/index.php/publicknowledge/user/register">register</a> prior to submitting or, if already registered, can simply <a href="http://localhost/index.php/index/login">log in</a> and begin the process.
53	1	fr_CA	reviewHelp	<p>Révisez l'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l'équipe éditoriale lui sera assigné afin de l'évaluer. S'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>
54	1		submissionAcknowledgement	allAuthors
66	1	fr_CA	uploadFilesHelp	<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>
67	1		enableGeoUsageStats	disabled
3	1	en	authorGuidelines	<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study's country.</p><p> When you're satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>
39	1		numReviewersPerSubmission	0
40	1	en	openAccessPolicy	This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.
41	1	fr_CA	openAccessPolicy	##default.contextSettings.openAccessPolicy##
42	1		orcidCity	
43	1		orcidClientId	
49	1	fr_CA	privacyStatement	##default.contextSettings.privacyStatement##
50	1	en	readerInformation	We encourage readers to sign up for the posting notification service for this server. Use the <a href="http://localhost/index.php/publicknowledge/user/register">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href="http://localhost/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.
51	1	fr_CA	readerInformation	##default.contextSettings.forReaders##
52	1	en	reviewHelp	<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>
55	1	en	submissionChecklist	<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href="http://localhost/index.php/publicknowledge/about/submissions">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>
56	1	fr_CA	submissionChecklist	##default.contextSettings.checklist##
57	1		submitWithCategories	0
58	1		supportedAddedSubmissionLocales	["en","fr_CA"]
59	1		supportedDefaultSubmissionLocale	en
60	1		supportedFormLocales	["en","fr_CA"]
68	1		enableInstitutionUsageStats	0
69	1		isSushiApiPublic	1
72	1		enableAuthorScreening	0
73	1		enabledDoiTypes	["publication"]
74	1		postedAcknowledgement	1
75	1		enableOai	1
76	1		doiVersioning	1
44	1		orcidClientSecret	
45	1		orcidEnabled	0
46	1		orcidLogLevel	ERROR
47	1		orcidSendMailToAuthorsOnPublication	0
48	1	en	privacyStatement	<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>
61	1		supportedLocales	["en","fr_CA"]
62	1		supportedSubmissionLocales	["en","fr_CA"]
63	1		supportedSubmissionMetadataLocales	["en","fr_CA"]
64	1		themePluginPath	default
65	1	en	uploadFilesHelp	<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>
8	1	fr_CA	beginSubmissionHelp	<p>Merci de votre soumission à la revue Public Knowledge Preprint Server. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l'avez pas encore fait, merci de consulter nos <a href="http://localhost/index.php/publicknowledge/about/submissions" target="_blank">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>
77	1	en	customHeaders	<meta name="pkp" content="Test metatag.">
80	1		mailingAddress	123 456th Street\nBurnaby, British Columbia\nCanada
78	1	en	searchDescription	The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.
81	1		supportEmail	rvaca@mailinator.com
82	1		supportName	Ramiro Vaca
79	1	en	abbreviation	publicknowledgePub Know Pre
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

COPY public.sessions (id, user_id, ip_address, user_agent, last_activity, payload) FROM stdin;
dmQ7DQrGcEEzZgGurYBmGVuXoeT1heXCre9Dlfee	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609286	YToyOntzOjY6Il90b2tlbiI7czo0MDoiOFJQS1B2MFludkoyMEVkWU1oak1Zclp2V1JnWW51ZEhzVmRVckM4YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
RxGUUVfmhtABLsPlSZV9jMKyMFkJncMxE1s82M7c	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609286	YToyOntzOjY6Il90b2tlbiI7czo0MDoicUE0Q1VDNWQ2OE5kT1RrczdhUmtEM2htRjFGdGFGYUZOMTRFczQwSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
rng4DgDMCwjuXiD1ti3E2eXnZlNoDCuzHhnihp1o	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609403	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTndxb3BqWlNwcmhxZTRJN285VGN5TjRHQ3hWVjRMbnFEa1k2VVVKaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
JH4gEhK9ArBvLDscZUPKPy9kjrLmP0OWi31fO8DY	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609320	YTo3OntzOjY6Il90b2tlbiI7czo0MDoielpDeGRvekRPRGc0bzNnOGJsblRDRzhrV2xaUHkyNkczYXo3UEdsdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHRxbTZaa3BUQTFZcllVUnVFR0FQN3VwUm15amNOc01zeG83eHRkY2NRN2J2U2I1NXR6MXhPIjt9
XyQUqNpHW6zNm5oN8mvwg0Llji7zGuAq1dY8y0k7	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609305	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTndKZmtadTR2aG5qNUdSandCbDBYb2gxMzduSENjbTlLcUNpYk5PRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHFEU2E3NlBmWE0zRjNJVDhSYTlaR3U0Ny80NVlkODFWdzdLdURtOWVENFI3UGp0UE1YRVIuIjt9
R5o23e9gKYHEAeJPQf7sJLFg8a1A5MR3cQcCvK49	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609417	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSnJXN0VPMm9ZZXBVaXhsYjE5RVJPZDFRNGo1SWM0QnJSSzB3QzhlcyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
1WgIW0gogKL3JE5vSRv3vPi9l5X0FMyBnTDKmYWN	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609427	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFB2RmFRVU9kbHd3Y3VkNm51emh1bjFVVTJlUDNuSkl3T0JkdjFoeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
GsnNrfTCwkv9hM3ncatZQSEf957GUwXgV3VePDvf	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609327	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQklNNk1xeXFKcmc0dUZLeHZzZ2VNZnlYR0s5NE1ZRFRIaVVNTWF2NCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEV3T1lkVjJ3NWZOMHp5UERlYS9FVC41SHhYWjUxcjhzdDFaNjE3SFBBT1RCNkdwNkJmNEdlIjt9
fBpFECNY26dkfqlkgT8ADw8JiPlgiWO0hdOFGLxt	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609334	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNU5kUmZ0RjYwNWpLN1NhQ3FDaVZiT0h0UzcxMlU2Q0FYbkdsZzF2QyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG1BS3A0dUlyT3lJYlZ6NHhGcXc4Uy4vZXNjRWlHU1NyR2J5VzdlU0NGcVhaS3JrSDNHa0I2Ijt9
EQwoyfqkj6HkN5f5o2NoNcg3BNWTxzHzDcSiRFwN	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609353	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOExYS2luaWc4U0sxbTJSaWpCV2VGeVZQb0t2djlTOUs1YUxSZVA5UCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
yB5BEcReSwl9DsRkqvy5k6xRtSKqcYXyyGzj5kkO	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609361	YTozOntzOjY6Il90b2tlbiI7czo0MDoidFB0TWFBb2NoMFJ1elE1Z1dGOEltVHlDTE1iaVZKMThPSGJCZ3R6aSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
uHkq9suy6G8TfApIc9pE6tJgIeNJkfTYff9k1QHR	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609374	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSDJ2UWhKYnkwcHJISmNvaVJFSFVSVWRhRFN1TjBiMnZLQm5TME5lZiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
3S9fFAhLUbXVL73h6Om6O4dkTUlwz98tLzKJb2Pd	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609381	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVBmQkxaNFlzbnpyclVNeWdzaVZJcGpsem1XMjhTd2Y5SlJmRWhudyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
SdZcFme1LPhCeMNKezAcrCRD83QRhdsyfXa18pkq	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609395	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVW1RSWpDNUF1bXdCNG9yOUNkdzdsT1J2R1VEblhQNmdhYUtUejZ6TSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
omg9lXNwu9iteQInY8KbJ25Arz2zsX8nzM6bT7R4	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609704	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQUs4UlVYbWtGUGFpQUVBY3huNlNTTHF0YldUMGRsTkZqbzJhWE94SyI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
7ztB2DhLrYm1cVcHmEIYbE3zoQzTi1rETYsJHD84	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609591	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUk1Jc1FwaGN5UzVpRlB6aWwxMnVxTmNUY0YyMjJLQ2V6R0JPSWo2aCI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
gD4FE6PcColrzedsu2b7xKjH48zUFiD8p8mXhhjl	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609595	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMGFiR1dxdXloQ0U4SWlvcXFtUGtzbFprNEtlamprd0hWZVZHWU9DTCI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
IUeEZExnKBzTjo7A0fOcOfnGfj7w07iZi0kxC4ri	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609442	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSms2ZjZUNFQ2VGlWYWlWYVM2cDR4Wm5kWEJVWjY3RjBwQkxPVWR4NCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
H1ey7AqvSgJmx1rULOPqr6pkh2TPzwI7DJAXrwpz	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609483	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTFBkSXo1M0g2bHRKbUxQS1RXZ1FMNEVwY3Y1MUgyUUFyc00zVWZGOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFdZTURmMEdBcXBUZHVRTm9EUjRwVXVrTFpycVA5UkpJMzdKWjZyTGxzRWxqRHFTMEhBZlFlIjt9
3pjekKi0bp9g5lSBkQEZK6qvzsUPFuc4aCZHzNfX	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609653	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYUFqTUhFSmdIT3RlaEZMT1ZvWklkRUhrU3VtREdRS3FkTnE3Zk1ENCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRTMGttRkkveFVQbGZMWUxQZGlRN2UuR2VaR3BxYWZGbnpWV1N0RnRUakZwbDZzMUZtLk1CNiI7fQ==
njqtgb7nYsCVp1DfLEcIy72DVNRQcAjlks9yWS4z	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609503	YTo4OntzOjY6Il90b2tlbiI7czo0MDoiemhRVlRLOUtyeXFSdnV0bTh2WmhIaXJraWJ2eVkxN3duYU1XVktvTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJjY29yaW5vIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTo3O3M6NjoidXNlcklkIjtpOjc7czo1OiJlbWFpbCI7czoyMjoiY2Nvcmlub0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQzbXVtU1pLanh2dHBUV3ZEbDVWUXF1NjlHSnQxcW92VTJVZUViNE56MDJZSGE1V1BhM1U4NiI7fQ==
9C3xaBM5GSQrotWMO7BmyeoaGRhJec0hAcrHieQL	8	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609566	YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNnpxN2p3ZTcwc29wVzdlYnVGTk1WdkVsSkFhMmowdjZROURVa29VMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJja3dhbnRlcyI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6ODtzOjY6InVzZXJJZCI7aTo4O3M6NToiZW1haWwiO3M6MjM6ImNrd2FudGVzQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHNxWUk4eHdBalppbk9zbEZZOGxWdC5OanlOeVVldGR5MkJqWndHMDBKYXhQbTJ1Q1hVQ3IuIjt9
ptju0jtXElCzixuqW5a69uiSVZffxctwHdiNv9nU	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609676	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiOWloTVN3eDdWSHpub0p2Nlg1a3dxSlNpWk5LeXVmc0ZZeGVDQnlQaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ0ai9zYXZ5VzZVSkZTZTlPZkRzODZ1MXYybnRKWXVQcHJublFUd29raGdIN1pZVUdKWi5UbSI7fQ==
ahMQ9Daf7iKMN31ywMeLnmfzFi3qksUq9ShLBIva	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609681	YTo1OntzOjY6Il90b2tlbiI7czo0MDoibHB3ZzRUd2RrU3k3YmVEQXUwNjBIbUJscXowRXlkcjI5VnBqSkN0bSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
FebnM0zDJLjHGrpyYp05hbS6A26ORvvfYQw0dYVu	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609685	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV096UGZ3OXJWbUNHeFlGMjZnck1raVhZZlFNekVvRVRHWE14R0Y2eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRGVjdPOWJvbWNBY2tLOURiVy95Z0YudGdicnhOa3NzWUYyWDdRTXNWWlpOTzNGTGlWZFYyLiI7fQ==
8oOsEjtUoWDcbyqCrdl5K2URoYfDqqIT4ghffYJr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609571	YTo3OntzOjY6Il90b2tlbiI7czo0MDoidThaOXdnRVc0U0NXR1Y0SEhBbFJvemJwdllDZ2ZCTjg5OVdwQjVyaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRpemxXMGFKVVhTa2FDUHNVV0hIYUVPd1J6WkhDMWloc28uNVZGRzlvRVpqSmlweW1RdVhTcSI7fQ==
4KEASrSv51Yoj2z4Usz2uVHcl5ZNFQ7hIf9U03Ei	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609462	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTml2WTBkNHhMazZ6TEVRMVlDT1pwb0dvM1pXQ3JRUXJQUjF0dHZLQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDJCcXZGNW0va0ozMG85ODAwOFBoaGVlSFhJVlJZNTJ3ajhxaEdkUmZ1NXFXZEFuRWN5dXZXIjt9
FFiBs9EtgeVv7Yu55Y8eZN4a7QAABrT9IA0doDiH	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609708	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiamJHN0tlR1I4SnNEc01FVmVqbk9neFZHVnVYVUdQRzl6UnZmYklVbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRjM0U3ZWVsc3ppTDR2WGI2SThaRW9lMnlSYVEyTlluNS5jdEVxWGtzZEY4c002ekpwQm1uYSI7fQ==
tUohUhLf7WaTU1wksUg9q840GPo0xCHgtJQRLc54	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609453	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEsxdEQxTGE0YTJJQUhPT09uWExrSjBSRUJPcTl1bEJzQTVjRjhrZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
sjBcPI4k6DZPAQ6OIvLiwObAtlP0JMcLa9RE5erh	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609453	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXF5b3g4WFpBcjZZaXQzdzFNSGt5OW93R1BNOThVMmN0TzBzOXN3VSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
ajPJFgKrKPWjsF7d36xHcE3hIjcqh8yeOYLs36Jr	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609729	YTo1OntzOjY6Il90b2tlbiI7czo0MDoidzJOWjlJZGtUTEhmUTAzWDh6M1BydWxvelI4R25rWTFBVWp2ZGZpZiI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
O6ue9nQVg3d1JXHf9a2K6I0VZkqVyrwlujIJ48xn	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609733	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTzVxMTJGdkROQ2RzSlNqUnpKZHpCQnFSZVJoa0NBVTFzS3paamtnVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRCMS9yWWNCLmxqSk5LcGNIajI4TnB1QjRvUG5VeElRd1o1TUd2SFJ6RE1SQVN3N0NBQklWZSI7fQ==
LmM8gm0SrjFpCWVqWL1oYAwZj8gDYCRkyALvi0ld	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609616	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiWWdwTDYwVXJ1OVBXU2sxSFFwUDVMaTdnaWtybGx1N2dlT1hXMURPNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRmVUJzejNhajlLZURuRTRtaDh0QzZ1YU55WklOVFFjTjdwMDVEZTBIQWhSVlZjdDVWT0l0RyI7fQ==
DDgR2WGI5r7SgTIMG9W7UkWnqz90XVqCfUexHaJv	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609752	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWXJHamgwa0N6MHlFclJoWkRHWlNFYlU1cERSYVQ3OXFKb1J5T3l1NCI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
YhiHZ42mkAwV3oYyEJxoFhx13fFnn6bah1HXCsRb	10	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609635	YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWWg2QUNGRXhuMVRaYkoycHZMU3pLcXdQb0lLaUVrQlIwc1pqd0Q3RCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjEwO3M6NjoidXNlcklkIjtpOjEwO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRLaUNaeEowb0t5aFRsUU93VXU5QmcuaDVOSFNvNWZZVGxqOGE0T1d0NDg2RFZlWEwxSEh4SyI7fQ==
X38NJlfSDNNo621FAx1eE0YxHy6G1YHG0Y05Gd6h	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609672	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTUI4d0pVZEx6VHVTNDV1YUVBeFRYaWx5SUpHSVFIOVFYUkpsSkNucCI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
MjpouwVzxaB4XuEfaevXMFB5rvsOJ7uSOGD4qOSD	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609681	YToyOntzOjY6Il90b2tlbiI7czo0MDoiUXRsYmNpNEtMSEF2MVEwVzJ6WXRCelNHSUZpeVVQbXFJNGlqUXM1USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
PzGCFqfOxRaB4cdlranGN2bnIi5r6zW3zotXvFag	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609756	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTVJ0U083UGVQVHkwQ1Z1b0FmUzhCckZTQk44TTQ1ejNCc3dwd3hndCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRZOEdJYmRmQlhWS0ZISWRPQ1l4VDhPcWQuUG5TYVkwRnVzZUFISG00UENldURXZHlvblRPNiI7fQ==
AK7cM7b60oxdg8Xa57VlfeQozaApIBOy43k1Bsqp	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609780	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZFlycVdKWUZ0R3lncm12TXVTdlV3VnJiZU5ESFVLNjNpdzYzZ3JFeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR2WUJ4SUo1Q2pLajI1OU9BYzExODRPQmlkZzNEdU9rZG1aSS8zR1U4V29qUllpSEJjeFNQYSI7fQ==
azuyJBziitbviDCmuHOTIkSQR90MqteAnTkN1azY	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609776	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNldCZzdBOXU0TUJabTlTUUE3QVR6RDQ4ZkRPS2ZqYW9hNndNRlh3SSI7czo4OiJ1c2VybmFtZSI7czoxMDoiam13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiam13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
v7R6vRTorV5NrIkQ13x4YXT4id42Acvagri1nz8l	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609804	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYk1lTXlnRVhQeHJyZVVMRkV3VFk1RmhLWk1ybEE2NGlBV3hiY2s3TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ0SEpaVVNtRk9hL1VVajk5emNtRTRPRFBJcGJocjBOTXBYbG9IZDJCeElwQVNPYXd0QmhhVyI7fQ==
U7RtOPWHfgNF6bLemcwyTstXmUR6lFrkJp3L57mp	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609800	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNGNPdUVXU05Wa0dKUWRIYVMwZE5PcXZUSU1lZkhwWkVmb2JxQXRpYiI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
YPNvnf13iKK7e7jSqqLNdzCnokVq8wPYBgGVESU3	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609824	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTVVTalBPNXZRZlU3WHpLd2ZjQ2Y3dFYwdDZvUzkxdElxRFV6UVU4dCI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
04jpHhIuDTadKH6WeiP6nbYLlLrOjvCJih9933xA	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609829	YTo3OntzOjY6Il90b2tlbiI7czo0MDoid1VmSjVmbUY2Y2x6S0xVOGtHbU1BdFFmNVE2UmFWZUFaUXFwdmhrRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRtZHpxVEN6dVJBR0ZnQnU5aTZpb2cuRWR5bGouNUZMWTVPQWJBLm1ZMHJqdkdQaWJqT09mZSI7fQ==
FX8MkxunPLUgHXgq5p8nUbchRfW5jnn9K0XYAESx	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609848	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSG84b1duQkhITUdXWmJpRmpIT3IyeDdIeVBwenVkVmoyd1hCZ3FUOCI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
WdbTSc6iJe6tuChO8yW0SpypHgyOQ7wjRN4vrXsF	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609853	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQUNhZlplTTZKUnVKcGsxOVVHRkhtbHBBVG1WSzBCbEFhY0xFNlg1SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRhRkQvWjQyQksyZkcuRS5lOTk4UjN1VFA4ekdpRTBFQjY5cGhpVVFPekI4N0NIcDhEYUl0VyI7fQ==
s4HYwI9zNDMMNcVdMbv4cQKIBGagsEdjdjUlDUwQ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609873	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVnZ2V0UyWjV3ZnhMZE5mNGRlN3lkRjFvU1pGb3dDUlRWSW9idGJLNCI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
KCj6IneHi6OsQNzGf6MVNDvg9Qygx0L91QOseuCr	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609877	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiM0MxVHRnZzByWmVZZ1ZrdG1aYVdGNGRKNDAwSlRNNGgxMkM4aVFOdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRUS3o3eUlPMVVLY2JsdHZQLlc3Lml1RVZFN2hVT3MzbE5jVVo5M1kwQ0JZL1VTWkVPRExqSyI7fQ==
6Kor26lcAtYFHnWBSh53CyLHLEhwHBawmtjzDVib	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737610017	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSjhVV3NzaEp5dUxCYzFuOUNmYUljMXFIc3htZmdQall1QmY0em1CMCI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
mSO9xe038EzNMOYU5fyQ0LUhSv8UdOmekHAUVAUR	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609901	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiT2J2NzJsQllIVzB4YklnTDM1OVk1WkFUT1o2TXZuZzlCTnh2ZmpXTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR5M090dzBiNFpLY29NcTU1N2ZkZWFlTFlRLk1OWGx2VndkNENDVmRZRGlEVmhDYnFFZ256ZSI7fQ==
MQKtUefCovDKdCRxRkkXTUn00RASJ3KMulnpbmpQ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609897	YTo1OntzOjY6Il90b2tlbiI7czo0MDoib0VWRXRGMWc3dXFseXVhSk9DZ1g2aDgxMkhqQVFKTGtoWU4xRnFKMiI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
FHLCjWdsuXkekvYa6g3gwdgpsQS7Als8EFDv7Mbs	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609921	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZFhDd3AyaENkaEVRRlk0NVFZT2NIV3Q5OTgxWTFJMkVJNjNUeG83TSI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
XfOmnPMgDOxIQkoWhg4GBPz0nJvJlrm4Ay7AjOb8	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609925	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiU3FsSkZ0Sm9qdWdVTVJjY2o4bXNUU2xzU2FFQlFtNzdVdzdLYXRzUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRySDZXcGxaYU81ZWhPemxOZjdERHVPem5IVHhkNlo4Uno5aXZBc28zaC5qRk5VYzYvUGFxTyI7fQ==
iehWCJ7hs9bTwJVhIh8aJSkHWCaf5yShtpRL8o8c	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609950	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiN2E5UlJCcmxPZTRvNXBNUVVGWUZBMFQ5bDhJMkZseHFrclI0cVlQdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRYOGdKMGFNeXhISnoyVTUzcFZKL3RlNTRnWDN3N3JPWjB4Sm00elBudzQ4S0VDQlFFUTN5RyI7fQ==
Iklr7szhj3fk2GQ3HllamGBnGgeePP1V1N5M5uto	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609946	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRm1SUGhLc3VyajIyd0NLQnJlN1A4eWlwb0VBa2Z0R3NPa09CSkhQQiI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
cdQ5mH91aOpwfoykAJvmSYpVvpX25EEpPCWKMIFT	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609970	YTo1OntzOjY6Il90b2tlbiI7czo0MDoia3dGVHh4clF2S090bnIxaXoxY25IaDc1M1h5a0dUMUhtR0M3NngyViI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
R0X0K9XbARqWr6zpMTNvygwPg0N3El9MWTNioAkJ	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609974	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiT0ZHNzRkYkg2WmRVMno5TnBLNWk5c1g0ZFNZUlNYeFJHdUhuWFEwSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRCWHhqRUtZd3A1SEZGWktmTm5rREx1WC5lc3ZaTkc0Lll6Q3g0a2lEcEI4MlNPOHR3b01pTyI7fQ==
nkADGHjziKrNUO2Vh3RUaQCLJV6zobZP1GCT5Lsg	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609994	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTzlFWjVzWU9TTHRQMUpOUlVlTFg3OEdCZm5rT1N5Tmp0S1BoNll4QyI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
pE9FyVte4a6ngao0XTjXARLhH9M26mz6NJo80lII	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737609998	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTjl1V0p6SVZzWDduaGhBb3Y3RGNqSUNKWm05eExmNW9yQ0RjbjVwSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRheFlmcHpIT0tWY1RuZFpBNThoQUZPcmgwMTN2Ly5rSXIublVmN25lSkJNbU80ZnZhc2FzcSI7fQ==
hGfneFGsB08Rg8Sxkriv77zzqZE4lCGKeWxcJ5T7	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737610022	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTm5zRVFUWE00SE1XSFA2NEF2OUhGc0Q5UmNNeW5JdjVMMlRteXZ5ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQzQUJpTEdGRW5IcXVyNGdNQy5PSzhPNVN5UWQwY3VWeTdqL1VBMkhoTTRHWnJKT2s1YTFUZSI7fQ==
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.site (site_id, redirect_context_id, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
1	\N	en	6	["en","fr_CA"]	["en","fr_CA"]	\N
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
11	orcidClientId		
12	orcidClientSecret		
13	orcidEnabled		0
14	themePluginPath		default
15	uniqueSiteId		EBF899E5-E7B2-443C-A383-2547EA40986D
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
2	1	3	4	2025-01-23 05:18:22	0	1
3	1	3	5	2025-01-23 05:18:22	0	1
1	1	4	7	2025-01-23 05:18:09	0	1
5	2	3	4	2025-01-23 05:19:22	0	1
6	2	3	5	2025-01-23 05:19:22	0	1
4	2	4	8	2025-01-23 05:18:31	0	1
8	3	3	4	2025-01-23 05:19:50	0	1
9	3	3	5	2025-01-23 05:19:50	0	1
7	3	4	9	2025-01-23 05:19:37	0	1
11	4	3	4	2025-01-23 05:20:35	0	1
12	4	3	5	2025-01-23 05:20:35	0	1
10	4	4	10	2025-01-23 05:20:22	0	1
14	5	3	4	2025-01-23 05:21:12	0	1
15	5	3	5	2025-01-23 05:21:12	0	1
13	5	4	11	2025-01-23 05:20:59	0	1
17	6	3	4	2025-01-23 05:21:44	0	1
18	6	3	5	2025-01-23 05:21:44	0	1
16	6	4	12	2025-01-23 05:21:31	0	1
20	7	3	4	2025-01-23 05:22:08	0	1
21	7	3	5	2025-01-23 05:22:08	0	1
19	7	4	13	2025-01-23 05:21:55	0	1
23	8	3	4	2025-01-23 05:22:32	0	1
24	8	3	5	2025-01-23 05:22:32	0	1
22	8	4	14	2025-01-23 05:22:19	0	1
26	9	3	4	2025-01-23 05:22:55	0	1
27	9	3	5	2025-01-23 05:22:55	0	1
25	9	4	15	2025-01-23 05:22:42	0	1
29	10	3	4	2025-01-23 05:23:19	0	1
30	10	3	5	2025-01-23 05:23:19	0	1
28	10	4	16	2025-01-23 05:23:06	0	1
32	11	3	4	2025-01-23 05:23:44	0	1
33	11	3	5	2025-01-23 05:23:44	0	1
31	11	4	17	2025-01-23 05:23:30	0	1
35	12	3	4	2025-01-23 05:24:08	0	1
36	12	3	5	2025-01-23 05:24:08	0	1
34	12	4	18	2025-01-23 05:23:55	0	1
38	13	3	4	2025-01-23 05:24:32	0	1
39	13	3	5	2025-01-23 05:24:32	0	1
37	13	4	19	2025-01-23 05:24:19	0	1
41	14	3	4	2025-01-23 05:24:56	0	1
42	14	3	5	2025-01-23 05:24:56	0	1
40	14	4	20	2025-01-23 05:24:43	0	1
44	15	3	4	2025-01-23 05:25:20	0	1
45	15	3	5	2025-01-23 05:25:20	0	1
43	15	4	21	2025-01-23 05:25:07	0	1
47	16	3	4	2025-01-23 05:25:46	0	1
48	16	3	5	2025-01-23 05:25:46	0	1
46	16	4	22	2025-01-23 05:25:33	0	1
50	17	3	4	2025-01-23 05:26:09	0	1
51	17	3	5	2025-01-23 05:26:09	0	1
49	17	4	23	2025-01-23 05:25:56	0	1
53	18	3	4	2025-01-23 05:26:33	0	1
54	18	3	5	2025-01-23 05:26:33	0	1
52	18	4	24	2025-01-23 05:26:20	0	1
56	19	3	4	2025-01-23 05:26:57	0	1
57	19	3	5	2025-01-23 05:26:57	0	1
55	19	4	25	2025-01-23 05:26:44	0	1
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
1	1	1	\N	1	10	\N	\N	\N	2025-01-23 05:18:20	2025-01-23 05:18:22	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2025-01-23 05:18:55	2025-01-23 05:18:57	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2025-01-23 05:19:47	2025-01-23 05:19:49	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2025-01-23 05:20:32	2025-01-23 05:20:34	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2025-01-23 05:21:09	2025-01-23 05:21:11	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2025-01-23 05:21:41	2025-01-23 05:21:43	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2025-01-23 05:22:05	2025-01-23 05:22:07	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2025-01-23 05:22:29	2025-01-23 05:22:31	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2025-01-23 05:22:52	2025-01-23 05:22:55	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2025-01-23 05:23:16	2025-01-23 05:23:18	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2025-01-23 05:23:40	2025-01-23 05:23:43	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2025-01-23 05:24:05	2025-01-23 05:24:07	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2025-01-23 05:24:29	2025-01-23 05:24:31	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2025-01-23 05:24:53	2025-01-23 05:24:55	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2025-01-23 05:25:17	2025-01-23 05:25:19	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2025-01-23 05:25:43	2025-01-23 05:25:45	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2025-01-23 05:26:06	2025-01-23 05:26:09	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2025-01-23 05:26:30	2025-01-23 05:26:32	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2025-01-23 05:26:54	2025-01-23 05:26:56	25	521	20
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
111	archival
112	data
113	attitude
114	survey
115	employees
116	single
117	multinational
118	organization
119	examine
120	national
121	culture
122	affects
123	nature
124	responses
125	countries
126	compiled
127	create
128	benchmark
129	nations
130	individually
131	compared
132	factor
133	analysis
134	revealed
135	factors
136	organizational
137	communication
138	efficiency
139	effectiveness
140	support
141	personal
142	benefit
143	comparisons
144	structures
145	exhibited
146	satisfied
147	china
148	brazil
149	consistent
150	previous
151	findings
152	individuals
153	collectivistic
154	report
155	research
156	suggest
157	cultural
158	context
159	exerts
160	effect
161	urho
162	kekkonen
163	author
164	fake
165	montgomerie
166	craig
167	alberta
168	policy
169	requirements
170	skill
171	computer
172	teachers
173	practice
174	existing
175	implications
176	grade
177	education
178	response
179	infused
180	canada
181	summarizes
182	specifies
183	provincial
184	rate
185	issue
186	school
187	required
188	turning
189	mandated
190	government
191	jurisdictions
192	began
193	province
194	employed
195	integration
196	skills
197	core
198	implement
199	initiatives
200	professional
201	information
202	demonstrate
203	telephone
204	administered
205	students
206	curriculum
207	newly
208	hiring
209	development
210	hired
211	level
212	called
213	expected
214	results
215	goal
216	implementation
217	learning
218	standards
219	courses
220	public
221	upgrade
222	require
223	today
224	technology
225	classroom
226	strategies
227	paper
228	major
229	september
230	respect
231	meet
232	examined
233	integrating
234	mark
235	irvine
236	victoria
237	alexandria
238	diaga
239	diouf
240	genetic
241	forest
242	transformation
243	trees
244	recent
245	review
246	expression
247	plants
248	woody
249	improving
250	engineering
251	genes
252	mechanisms
253	understanding
254	governing
255	progress
256	applications
257	discussed
258	toronto
259	dana
260	phillips
261	thesis
262	disagreement
263	shared
264	fogelin
265	background
266	argument
267	critique
268	deep
269	investigating
270	widely
271	supporters
272	beliefs
273	find
274	pro
275	topic
276	common
277	mitments
278	share
279	procedural
280	claims
281	cedural
282	interlocutors
283	order
284	framework
285	productive
286	consists
287	people
288	competencies
289	part
290	hand
291	fruitfully
292	mistakenly
293	pursue
294	diverge
295	uphold
296	refute
297	claim
298	robert
299	difficult
300	commitments
301	domatilia
302	sokoloff
303	cork
304	college
305	developing
306	efficacy
307	knowledge
308	enhance
309	cps
310	taught
311	involve
312	learn
313	creative
314	graduation
315	conducted
316	making
317	participate
318	motivate
319	key
320	shown
321	valuable
322	means
323	informed
324	decision
325	studies
326	learners
327	action
328	motivation
329	role
330	confident
331	positive
332	instruction
333	showing
334	social
335	strategy
336	presented
337	children
338	enhancing
339	problem
340	equip
341	society
342	belief
343	solving
344	continue
345	leads
346	nurturing
347	citizens
348	citizenship
349	ostrom
350	indiana
351	elinor
352	substantial
353	managed
354	reyes
355	decades
356	distinguished
357	coward
358	mid
359	regions
360	mackenzie
361	resources
362	scholars
363	colleagues
364	contemporary
365	disciplines
366	sec
367	region
368	work
369	los
370	times
371	wittfogel
372	1980s
373	long
374	commons
375	places
376	tors
377	world
378	expe
379	researchers
380	rienced
381	specific
382	mismanaged
383	past
384	developments
385	property
386	pool
387	intellectual
388	resource
389	van
390	frank
391	laerhoven
392	fabio
393	rome
394	paglieri
395	pinto
396	reason
397	hansen
398	reclaimed
399	town
400	cape
401	mwandenga
402	john
403	dividends
404	signalling
405	literature
406	empirical
407	theory
408	evidence
409	dividend
410	shareholding
411	signaling
412	firm
413	economists
414	future
415	offer
416	practical
417	investors
418	evaluation
419	rely
420	decisions
421	financial
422	potential
423	financing
424	continuous
425	signal
426	intuitive
427	suggests
428	conflicting
429	prospects
430	investment
431	distribution
432	management
433	conclusive
434	corporate
435	function
436	guidance
437	novak
438	aalborg
439	condensing
440	water
441	models
442	focus
443	availability
444	systems
445	simplifying
446	reservoirs
447	complex
448	expanding
449	planning
450	river
451	added
452	large
453	applied
454	flows
455	routinely
456	modifying
457	removed
458	basins
459	capabilities
460	input
461	reservoir
462	texas
463	authority
464	simulation
465	enhanced
466	necessarily
467	impacts
468	streamflows
469	contained
470	original
471	datasets
472	statewide
473	represents
474	types
475	state
476	model
477	complete
478	selected
479	included
480	developed
481	dataset
482	accompanying
483	permits
484	growing
485	provide
486	condensed
487	basin
488	based
489	modeling
490	permit
491	regional
492	brazos
493	administration
494	variety
495	develop
496	set
497	methodology
498	rights
499	reflects
500	endeavors
501	features
502	system
503	karim
504	khafaji
505	stanford
506	sustainable
507	design
508	service
509	failed
510	experiences
511	environmental
512	projects
513	present
514	chapter
515	address
516	successful
517	topics
518	setting
519	sustainability
520	largely
521	engineers
522	project
523	academic
524	principles
525	leveraged
526	coordinated
527	identification
528	vital
529	tool
530	limitations
531	involves
532	challenges
533	led
534	exist
535	emerging
536	organizations
537	teach
538	directions
539	integrates
540	student
541	partner
542	internships
543	morse
544	margaret
545	australian
546	christopher
547	leo
548	weaning
549	butyrate
550	piglets
551	improves
552	weaned
553	performance
554	sodium
555	increases
556	supplement
557	reflected
558	levels
559	treatment
560	assess
561	pufa
562	healthy
563	matched
564	close
565	lowest
566	adipose
567	monounsaturated
568	rapeseed
569	mufa
570	isoenergetic
571	cis
572	nutritional
573	averaging
574	differed
575	saturated
576	linolenic
577	result
578	polyunsaturated
579	iodine
580	supplemented
581	treatments
582	acids
583	weights
584	animals
585	technological
586	c18
587	maize
588	sfa
589	slaughter
590	assessed
591	c20
592	linoleic
593	index
594	subcutaneous
595	analyzed
596	samples
597	aim
598	profile
599	content
600	white
601	fifty
602	backfat
603	oil
604	supplementation
605	randomized
606	cured
607	ecosenoic
608	consortium
609	show
610	dietary
611	carefully
612	tissue
613	unsaturation
614	fats
615	parma
616	proportion
617	slaughtering
618	accepted
619	collected
620	term
621	ten
622	highest
623	layers
624	tallow
625	food
626	security
627	lise
628	kumiega
629	hydrologic
630	san
631	marcos
632	barton
633	edwards
634	aquifer
635	drought
636	connectivity
637	springs
638	conditions
639	antonio
640	gradient
641	dynamic
642	normal
643	change
644	potentiometric
645	flowing
646	dramatic
647	longer
648	extensive
649	flow
650	north
651	bearings
652	endangered
653	cfs
654	unknown
655	onion
656	inherent
657	species
658	buda
659	downstream
660	continual
661	population
662	properties
663	assessments
664	structural
665	analyses
666	creek
667	dissipated
668	divide
669	appears
670	necessitates
671	rapid
672	drainage
673	south
674	kyle
675	supply
676	surface
677	questions
678	increased
679	hydraulic
680	demands
681	serves
682	hydrogeologic
683	established
684	wet
685	concept
686	separated
687	plan
688	variation
689	vicinity
690	connection
691	recharge
692	program
693	gradients
694	hydrologically
695	influences
696	collection
697	blanco
698	trend
699	droughts
700	raised
701	groundwater
702	source
703	extended
704	periods
705	shows
706	exists
707	monitoring
708	slopes
709	pumping
710	immediately
711	protect
712	primary
713	central
714	discontinuity
715	simulations
716	influenced
717	numerical
718	segments
719	low
720	vulnerable
721	wolverhampton
722	patricia
723	daniel
724	intercultural
725	case
726	atlantic
727	coast
728	nicaragua
729	designing
730	barriers
731	militate
732	ethnic
733	relations
734	overcome
735	discussions
736	delivering
737	individual
738	uraccan
739	participatory
740	language
741	multiethnic
742	carried
743	wales
744	belonging
745	promoting
746	interculturality
747	emphasises
748	highlights
749	describes
750	genuinely
751	egalitarianism
752	met
753	include
754	achieving
755	country
756	pedagogy
757	council
758	time
759	ethno
760	takes
761	diversity
762	examines
763	community
764	supporting
765	century
766	21st
767	embracing
768	gender
769	power
770	intention
771	staff
772	importance
773	involvement
774	cultures
775	linguistic
776	lasting
777	multilingual
778	communities
779	defining
780	contributing
781	nairobi
782	rana
783	baiyewu
784	nigeria
785	yam
786	diseases
787	presents
788	rotation
789	tubers
790	destruction
791	ash
792	disease
793	severe
794	fallowing
795	fungal
796	processing
797	found
798	wood
799	tecto
800	edible
801	cubes
802	thiabendazole
803	regarded
804	combating
805	devastating
806	advocated
807	material
808	finally
809	anthracnose
810	menace
811	made
812	infected
813	portions
814	yams
815	field
816	crop
817	months
818	adopted
819	resistant
820	rot
821	considered
822	includes
823	marketable
824	chips
825	reductions
826	year
827	mosaic
828	spread
829	storage
830	infection
831	cultivars
832	reduction
833	shelf
834	locally
835	virus
836	planting
837	stored
838	live
839	gins
840	barcelona
841	rossi
842	rosanna
843	nutrition
844	lungs
845	thoracis
846	represent
847	organs
848	beef
849	savannah
850	longissimus
851	pre
852	trade
853	encountered
854	tuberculosis
855	cows
856	ectoparasites
857	fulani
858	category
859	completely
860	nodes
861	authorities
862	lesions
863	african
864	toughest
865	abattoir
866	draw
867	enlarged
868	lameness
869	aid
870	characteristics
871	breeds
872	cameroon
873	origin
874	predominant
875	carcasses
876	carcass
877	lymph
878	varied
879	similar
880	programmes
881	transhumance
882	bulls
883	promote
884	january
885	recorded
886	abnormal
887	respiratory
888	safety
889	improve
890	prevent
891	march
892	gudali
893	rearing
894	affected
895	representative
896	high
897	due
898	fatigue
899	markedly
900	yaoundé
901	distress
902	situation
903	meat
904	slaughtered
905	mbororo
906	liver
907	skin
908	guinea
909	cattle
910	flukes
911	condemned
912	largest
913	red
914	general
915	strengthen
916	nodular
917	pregnant
918	karbasizaed
919	vajiheh
920	tehran
921	metal
922	hospital
923	plasmid
924	coliforms
925	isolated
926	iran
927	isfahan
928	infections
929	antimicrobial
930	nosocomial
931	resistance
932	kelebsiella
933	clinical
934	percent
935	difference
936	possess
937	conjugative
938	pneumoniae
939	mic
940	isolates
941	faeces
942	identified
943	inhibitory
944	tolerant
945	seventy
946	coli
947	strains
948	escherichia
949	encoding
950	minimal
951	relationship
952	human
953	fifteen
954	multiple
955	multidrug
956	recovered
957	profiles
958	pattern
959	persons
960	antibiotics
961	concentration
962	enterobacteriacea
963	patterns
964	metals
965	remaining
966	cases
967	valerie
968	williamson
969	networked
970	environments
971	multi
972	institutions
973	implemented
974	ruled
975	decide
976	perverse
977	sanction
978	reaching
979	actors
980	consensus
981	agree
982	sanctions
983	actor
984	punishing
985	difficulty
986	contributors
987	problematic
988	collectively
989	sanctioning
990	collective
991	sanctioned
992	compare
993	goverance
994	cuny
995	woods
996	zita
997	arguments
998	finocchiaro
\.


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.submission_search_object_keywords (submission_search_object_keyword_id, object_id, keyword_id, pos) FROM stdin;
870	9	101	0
871	9	102	1
872	9	2	2
873	9	100	3
874	9	161	4
875	9	162	5
876	10	109	0
877	10	108	1
878	10	105	2
879	10	106	3
880	10	107	4
881	10	110	5
882	10	104	6
883	10	103	7
884	11	111	0
885	11	112	1
886	11	113	2
887	11	114	3
888	11	115	4
889	11	116	5
890	11	117	6
891	11	118	7
892	11	119	8
893	11	84	9
894	11	120	10
895	11	121	11
896	11	122	12
897	11	123	13
898	11	108	14
899	11	105	15
900	11	124	16
901	11	125	17
902	11	126	18
903	11	127	19
904	11	128	20
905	11	129	21
906	11	130	22
907	11	131	23
908	11	132	24
909	11	133	25
910	11	134	26
911	11	135	27
912	11	136	28
913	11	137	29
914	11	136	30
915	11	138	31
916	11	139	32
917	11	136	33
918	11	140	34
919	11	141	35
920	11	142	36
921	11	143	37
922	11	132	38
923	11	144	39
924	11	136	40
925	11	137	41
926	11	145	42
927	11	104	43
928	11	103	44
929	11	141	45
930	11	142	46
931	11	146	47
932	11	115	48
933	11	147	49
934	11	146	50
935	11	148	51
936	11	149	52
937	11	150	53
938	11	151	54
939	11	152	55
940	11	153	56
941	11	129	57
942	11	154	58
943	11	77	59
944	11	105	60
945	11	155	61
946	11	151	62
947	11	156	63
948	11	120	64
949	11	157	65
950	11	158	66
951	11	159	67
952	11	160	68
953	11	123	69
954	11	108	70
955	11	105	71
956	13	115	0
957	13	114	1
2128	33	238	0
2129	33	239	1
2130	33	237	2
2131	33	2	3
2132	34	240	0
2133	34	242	1
2134	34	241	2
2135	34	243	3
2136	35	245	0
2137	35	244	1
2138	35	255	2
2139	35	240	3
2140	35	242	4
2141	35	241	5
2142	35	243	6
2143	35	257	7
2144	35	256	8
2145	35	240	9
2146	35	250	10
2147	35	249	11
2148	35	241	12
2149	35	243	13
2150	35	253	14
2151	35	252	15
2152	35	254	16
2153	35	251	17
2154	35	246	18
2155	35	248	19
2156	35	247	20
3564	81	392	0
3565	81	394	1
3566	81	2	2
3567	81	393	3
3568	82	397	0
3569	82	395	1
3570	82	396	2
3571	82	398	3
5092	105	505	6
5093	105	2	7
5094	106	217	0
5095	106	506	1
5096	106	507	2
5097	106	508	3
5098	107	511	0
5099	107	519	1
5100	107	506	2
5101	107	209	3
5102	107	524	4
5103	107	528	5
5104	107	517	6
5105	107	250	7
5106	107	177	8
5107	107	520	9
5108	107	509	10
5109	107	515	11
5110	107	508	12
5111	107	217	13
5112	107	539	14
5113	107	334	15
5114	107	508	16
5115	107	523	17
5116	107	518	18
5117	107	535	19
5118	107	529	20
5119	107	525	21
5120	107	537	22
5121	107	506	23
5122	107	507	24
5123	107	414	25
5124	107	521	26
5125	107	513	27
5126	107	476	28
5127	107	508	29
5128	107	217	30
5129	107	537	31
5130	107	506	32
5131	107	507	33
5132	107	488	34
5133	107	510	35
5134	107	505	36
5135	107	514	37
5136	107	521	38
5137	107	506	39
5138	107	377	40
5139	107	476	41
5140	107	531	42
5141	107	527	43
5142	107	512	44
5143	107	541	45
5144	107	536	46
5145	107	540	47
5146	107	533	48
5147	107	522	49
5148	107	488	50
5149	107	507	51
5150	107	542	52
5151	107	526	53
5152	107	541	54
5153	107	536	55
5154	107	476	56
5155	107	516	57
5156	107	530	58
5157	107	532	59
5158	107	534	60
287	1	4	0
288	1	3	1
289	1	2	2
290	1	1	3
291	2	8	0
292	2	10	1
293	2	9	2
294	2	7	3
295	2	6	4
296	2	5	5
297	3	22	0
298	3	20	1
299	3	16	2
300	3	98	3
301	3	96	4
302	3	11	5
303	3	41	6
304	3	59	7
305	3	33	8
306	3	55	9
307	3	50	10
308	3	74	11
309	3	95	12
310	3	17	13
311	3	34	14
312	3	92	15
313	3	88	16
314	3	87	17
315	3	74	18
316	3	24	19
317	3	61	20
318	3	45	21
319	3	89	22
320	3	60	23
321	3	13	24
322	3	67	25
323	3	66	26
324	3	81	27
325	3	57	28
326	3	52	29
327	3	74	30
328	3	95	31
329	3	58	32
330	3	43	33
331	3	34	34
332	3	92	35
333	3	44	36
334	3	31	37
335	3	34	38
336	3	14	39
337	3	36	40
338	3	11	41
339	3	72	42
340	3	59	43
341	3	33	44
342	3	29	45
343	3	27	46
344	3	35	47
345	3	15	48
346	3	90	49
347	3	33	50
348	3	11	51
349	3	72	52
350	3	59	53
351	3	33	54
352	3	32	55
353	3	29	56
354	3	88	57
355	3	64	58
356	3	17	59
357	3	34	60
358	3	92	61
359	3	93	62
360	3	39	63
361	3	86	64
362	3	94	65
363	3	83	66
364	3	91	67
365	3	48	68
366	3	49	69
367	3	74	70
368	3	88	71
369	3	23	72
370	3	11	73
371	3	85	74
372	3	40	75
373	3	77	76
374	3	42	77
375	3	53	78
376	3	79	79
377	3	97	80
378	3	42	81
379	3	46	82
380	3	79	83
381	3	82	84
382	3	45	85
383	3	63	86
384	3	62	87
385	3	76	88
386	3	40	89
387	3	80	90
388	3	11	91
389	3	95	92
390	3	74	93
391	3	25	94
392	3	68	95
393	3	97	96
394	3	70	97
395	3	84	98
396	3	30	99
397	3	12	100
398	3	26	101
399	3	82	102
400	3	46	103
401	3	69	104
402	3	88	105
403	3	21	106
404	3	28	107
405	3	78	108
406	3	74	109
407	3	54	110
408	3	11	111
409	3	85	112
410	3	97	113
411	3	99	114
412	3	18	115
413	3	47	116
414	3	75	117
415	3	56	118
416	3	65	119
417	3	11	120
418	3	71	121
419	3	41	122
420	3	59	123
421	3	17	124
422	3	34	125
423	3	50	126
424	3	19	127
425	3	5	128
426	3	51	129
427	3	37	130
428	3	73	131
429	3	38	132
2577	57	259	0
2578	57	260	1
2579	57	2	2
2580	57	258	3
2581	58	269	0
2582	58	263	1
2583	58	265	2
2584	58	187	3
2585	58	266	4
2586	58	267	5
2587	58	264	6
2588	58	261	7
2589	58	268	8
2590	58	262	9
2591	59	298	0
2592	59	264	1
2593	59	280	2
2594	59	282	3
2595	59	278	4
2596	59	284	5
2597	59	265	6
2598	59	272	7
2599	59	300	8
2600	59	283	9
2601	59	291	10
2602	59	293	11
2603	59	266	12
2604	59	296	13
2605	59	264	14
2606	59	297	15
2607	59	269	16
2608	59	263	17
2609	59	265	18
2610	59	187	19
2611	59	285	20
2612	59	266	21
2613	59	273	22
2614	59	265	23
2615	59	286	24
2616	59	276	25
2617	59	272	26
2618	59	275	27
2619	59	290	28
2620	59	263	29
2621	59	274	30
2622	59	281	31
2623	59	300	32
2624	59	288	33
2625	59	156	34
2626	59	264	35
2627	59	271	36
2628	59	292	37
2629	59	56	38
2630	59	263	39
2631	59	272	40
2632	59	289	41
2633	59	187	42
2634	59	265	43
2635	59	285	44
10673	161	967	0
10674	161	968	1
10675	161	2	2
10676	161	100	3
10677	162	118	0
10678	162	971	1
10679	162	211	2
10680	162	972	3
10681	162	969	4
10682	162	970	5
10683	163	992	0
10684	163	518	1
10685	163	979	2
10686	163	130	3
5159	107	257	61
5160	107	414	62
5161	107	538	63
5162	107	448	64
5163	107	476	65
5164	109	209	0
5165	109	250	1
5166	109	177	2
5167	109	508	3
5168	109	217	4
5169	109	519	5
10687	163	975	4
10688	163	977	5
10689	163	518	6
10690	163	982	7
10691	163	973	8
10692	163	979	9
10693	163	988	10
10694	163	981	11
10695	163	983	12
10696	163	991	13
10697	163	990	14
10698	163	989	15
10699	163	420	16
10700	163	987	17
10701	163	897	18
10702	163	985	19
10703	163	978	20
10704	163	980	21
10705	163	324	22
10706	163	811	23
10707	163	988	24
10708	163	976	25
10709	163	989	26
10710	163	984	27
10711	163	896	28
10712	163	986	29
10713	163	737	30
10714	163	979	31
10715	163	974	32
10716	163	990	33
10717	163	989	34
10718	163	420	35
10719	163	51	36
10720	163	93	37
10721	165	118	0
10722	165	971	1
10723	165	211	2
10724	165	972	3
10725	165	993	4
2636	59	266	45
2637	59	279	46
2638	59	277	47
2639	59	299	48
2640	59	295	49
2641	59	287	50
2642	59	272	51
2643	59	294	52
2644	59	270	53
2645	59	275	54
2646	59	290	55
7288	121	627	0
7289	121	628	1
7290	121	2	2
7291	121	400	3
7292	121	399	4
7293	122	629	0
7294	122	636	1
7295	122	633	2
7296	122	634	3
7297	122	630	4
7298	122	631	5
7299	122	637	6
7300	122	632	7
7301	122	637	8
7302	122	635	9
7303	122	638	10
7304	123	633	0
7305	123	634	1
7306	123	681	2
7307	123	712	3
7308	123	440	4
7309	123	675	5
7310	123	673	6
7311	123	713	7
7312	123	462	8
7313	123	702	9
7314	123	228	10
7315	123	637	11
7316	123	305	12
7317	123	687	13
7318	123	711	14
7319	123	652	15
7320	123	657	16
7321	123	710	17
7322	123	659	18
7323	123	630	19
7324	123	631	20
7325	123	637	21
7326	123	677	22
7327	123	700	23
7328	123	683	24
7329	123	685	25
7330	123	629	26
7331	123	668	27
7332	123	630	28
7333	123	639	29
7334	123	632	30
7335	123	637	31
7336	123	718	32
7337	123	633	33
7338	123	634	34
7339	123	635	35
7340	123	638	36
7341	123	515	37
7342	123	677	38
7343	123	440	39
7344	123	211	40
7345	123	112	41
7346	123	696	42
7347	123	692	43
7348	123	682	44
7349	123	110	45
7350	123	315	46
7351	123	133	47
7352	123	701	48
7353	123	211	49
7354	123	112	50
7355	123	701	51
7356	123	668	52
7357	123	706	53
7358	123	689	54
7359	123	676	55
7360	123	672	56
7361	123	668	57
7362	123	655	58
7363	123	666	59
7364	123	697	60
7365	123	450	61
7366	123	684	62
7367	123	642	63
7368	123	629	64
7369	123	638	65
7370	123	133	66
7371	123	112	67
3067	65	301	0
3068	65	302	1
3069	65	2	2
3070	65	304	3
3071	65	303	4
3072	66	305	0
3073	66	306	1
3074	66	272	2
3075	66	225	3
3076	67	228	0
3077	67	215	1
3078	67	177	2
3079	67	340	3
3080	67	337	4
3081	67	307	5
3082	67	196	6
3083	67	342	7
3084	67	330	8
3085	67	323	9
3086	67	347	10
3087	67	347	11
3088	67	344	12
3089	67	326	13
3090	67	314	14
3091	67	227	15
3092	67	319	16
3093	67	329	17
3094	67	346	18
3095	67	306	19
3096	67	272	20
3097	67	283	21
3098	67	312	22
3099	67	317	23
3100	67	186	24
3101	67	341	25
3102	67	155	26
3103	67	151	27
3104	67	315	28
3105	67	334	29
3106	67	325	30
3107	67	158	31
3108	67	336	32
3109	67	333	33
3110	67	335	34
3111	67	332	35
3112	67	308	36
3113	67	306	37
3114	67	217	38
3115	67	289	39
3116	67	155	40
3117	67	313	41
3118	67	339	42
7372	123	619	68
7373	123	635	69
7374	123	427	70
7375	123	701	71
7376	123	668	72
7377	123	667	73
7378	123	647	74
7379	123	694	75
7380	123	686	76
7381	123	718	77
7382	123	577	78
7383	123	422	79
7384	123	701	80
7385	123	649	81
7386	123	383	82
7387	123	630	83
7388	123	631	84
7389	123	637	85
7390	123	632	86
7391	123	637	87
7392	123	228	88
7393	123	699	89
7394	123	175	90
7395	123	651	91
7396	123	432	92
7397	123	443	93
7398	123	701	94
7399	123	633	95
7400	123	634	96
7401	123	663	97
7402	123	715	98
7403	123	717	99
7404	123	476	100
7405	123	156	101
7406	123	653	102
7407	123	645	103
7408	123	383	104
7409	123	630	105
7410	123	631	106
7411	123	632	107
7412	123	637	108
7413	123	635	109
7414	123	638	110
7415	123	701	111
7416	123	668	112
7417	123	669	113
7418	123	716	114
7419	123	691	115
7420	123	655	116
7421	123	666	117
7422	123	697	118
7423	123	450	119
7424	123	669	120
7425	123	720	121
7426	123	703	122
7427	123	704	123
7428	123	691	124
7429	123	648	125
7430	123	709	126
7431	123	689	127
7432	123	674	128
7433	123	658	129
7434	123	112	130
7435	123	496	131
7436	123	705	132
7437	123	719	133
7438	123	640	134
7439	123	644	135
7440	123	676	136
7441	123	630	137
7442	123	631	138
7443	123	637	139
7444	123	674	140
7445	123	688	141
7446	123	558	142
7447	123	635	143
7448	123	635	144
7449	123	704	145
7450	123	674	146
7451	123	632	147
7452	123	637	148
7453	123	644	149
7454	123	676	150
1958	25	166	0
1959	25	165	1
1960	25	2	2
1961	25	167	3
1962	25	234	4
1963	25	235	5
1964	25	2	6
1965	25	236	7
1966	26	171	0
1967	26	170	1
1968	26	169	2
1969	26	174	3
1970	26	172	4
1971	26	175	5
1972	26	168	6
1973	26	173	7
1974	27	195	0
1975	27	224	1
1976	27	225	2
1977	27	228	3
1978	27	185	4
1979	27	177	5
1980	27	223	6
1981	27	120	7
1982	27	183	8
1983	27	199	9
1984	27	224	10
1985	27	196	11
1986	27	205	12
1987	27	202	13
1988	27	176	14
1989	27	211	15
1990	27	190	16
1991	27	193	17
1992	27	167	18
1993	27	180	19
1994	27	189	20
1995	27	216	21
1996	27	206	22
1997	27	192	23
1998	27	229	24
1999	27	212	25
2000	27	201	26
2001	27	137	27
2002	27	224	28
2003	27	206	29
2004	27	179	30
2005	27	197	31
2006	27	219	32
2007	27	182	33
2008	27	205	34
2009	27	213	35
2010	27	230	36
2011	27	224	37
2012	27	167	38
2013	27	217	39
2014	27	172	40
2015	27	187	41
2016	27	198	42
2017	27	206	43
2018	27	186	44
2019	27	191	45
2020	27	188	46
2021	27	200	47
2022	27	209	48
2023	27	226	49
2024	27	208	50
2025	27	218	51
2026	27	221	52
2027	27	172	53
2028	27	171	54
2029	27	196	55
2030	27	231	56
2031	27	215	57
2032	27	227	58
2033	27	181	59
2034	27	214	60
2035	27	203	61
2036	27	114	62
2037	27	204	63
2038	27	220	64
2039	27	186	65
2040	27	191	66
2041	27	193	67
2042	27	167	68
2043	27	178	69
2044	27	184	70
2045	27	232	71
2046	27	171	72
2047	27	196	73
2048	27	186	74
2049	27	191	75
2050	27	222	76
2051	27	207	77
2052	27	210	78
2053	27	172	79
2054	27	140	80
2055	27	226	81
2056	27	194	82
2057	27	194	83
2058	27	172	84
2059	29	233	0
2060	29	224	1
2061	29	171	2
2062	29	196	3
2063	29	114	4
2064	29	167	5
2065	29	120	6
2066	29	183	7
2067	29	200	8
2068	29	209	9
2069	29	115	10
3842	89	402	0
3119	67	343	43
3120	67	309	44
3121	67	310	45
3122	67	337	46
3123	67	322	47
3124	67	318	48
3125	67	140	49
3126	67	217	50
3127	67	320	51
3128	67	309	52
3129	67	331	53
3130	67	22	54
3131	67	306	55
3132	67	217	56
3133	67	321	57
3134	67	284	58
3135	67	311	59
3136	67	337	60
3137	67	324	61
3138	67	316	62
3139	67	345	63
3140	67	334	64
3141	67	327	65
3142	67	175	66
3143	67	338	67
3144	67	306	68
3145	67	328	69
3146	67	312	70
3147	67	225	71
3148	67	257	72
3149	69	177	0
3150	69	348	1
3843	89	401	1
3844	89	2	2
3845	89	400	3
3846	89	399	4
3847	90	404	0
3848	90	407	1
3849	90	403	2
3850	90	245	3
3851	90	405	4
3852	90	406	5
3853	90	408	6
3854	91	411	0
3855	91	407	1
3856	91	427	2
3857	91	403	3
3858	91	425	4
3859	91	414	5
3860	91	429	6
3861	91	412	7
3862	91	244	8
3863	91	406	9
3864	91	408	10
3865	91	415	11
3866	91	433	12
3867	91	408	13
3868	91	185	14
3869	91	428	15
3870	91	168	16
3871	91	175	17
3872	91	421	18
3873	91	413	19
3874	91	416	20
3875	91	409	21
3876	91	168	22
3877	91	436	23
3878	91	432	24
3879	91	174	25
3880	91	422	26
3881	91	417	27
3882	91	410	28
3883	91	434	29
3884	91	430	30
3885	91	423	31
3886	91	431	32
3887	91	420	33
3888	91	424	34
3889	91	435	35
3890	91	432	36
3891	91	409	37
3892	91	420	38
3893	91	419	39
3894	91	426	40
3895	91	418	41
7455	123	708	151
7456	123	40	152
7457	123	650	153
7458	123	646	154
3461	73	351	0
3462	73	349	1
3463	73	350	2
3464	73	2	3
3465	73	390	4
3466	73	389	5
3467	73	391	6
3468	73	350	7
3469	73	2	8
3470	74	305	0
3471	74	306	1
3472	74	272	2
3473	74	225	3
3474	75	110	0
3475	75	374	1
3476	75	378	2
3477	75	380	3
3478	75	352	4
3479	75	83	5
3480	75	209	6
3481	75	383	7
3482	75	355	8
3483	75	356	9
3484	75	362	10
3485	75	365	11
3486	75	373	12
3487	75	55	13
3488	75	381	14
3489	75	361	15
3490	75	353	16
3491	75	382	17
3492	75	370	18
3493	75	375	19
3494	75	357	20
3495	75	369	21
3496	75	354	22
3497	75	360	23
3498	75	371	24
3499	75	379	25
3500	75	55	26
3501	75	381	27
3502	75	374	28
3503	75	358	29
3504	75	372	30
3505	75	364	31
3506	75	363	32
3507	75	323	33
3508	75	368	34
3509	75	362	35
3510	75	365	36
3511	75	366	37
3512	75	376	38
3513	75	367	39
3514	75	51	40
3515	75	359	41
3516	75	377	42
3517	77	276	0
3518	77	386	1
3519	77	388	2
3520	77	276	3
3521	77	385	4
3522	77	387	5
3523	77	384	6
7459	123	558	155
7460	123	635	156
7461	123	635	157
7462	123	704	158
7463	123	702	159
7464	123	123	160
7465	123	714	161
7466	123	643	162
7467	123	644	163
7468	123	693	164
7469	123	641	165
7470	123	440	166
7471	123	211	167
7472	123	178	168
7473	123	674	169
7474	123	654	170
7475	123	664	171
7476	123	695	172
7477	123	679	173
7478	123	662	174
7479	123	656	175
7480	123	634	176
7481	123	714	177
7482	123	8	178
7483	123	84	179
7484	123	629	180
7485	123	690	181
7486	123	630	182
7487	123	631	183
7488	123	632	184
7489	123	637	185
7490	123	671	186
7491	123	661	187
7492	123	83	188
7493	123	678	189
7494	123	440	190
7495	123	680	191
7496	123	674	192
7497	123	658	193
7498	123	37	194
7499	123	670	195
7500	123	660	196
7501	123	701	197
7502	123	211	198
7503	123	707	199
7504	123	692	200
7505	123	630	201
7506	123	631	202
7507	123	637	203
7508	123	658	204
7509	123	485	205
7510	123	112	206
7511	123	414	207
7512	123	682	208
7513	123	698	209
7514	123	665	210
7515	125	440	0
8765	137	782	0
8766	137	783	1
8767	137	2	2
8768	137	781	3
8769	138	785	0
8770	138	786	1
8771	138	432	2
8772	138	784	3
8773	139	245	0
8774	139	787	1
8775	139	786	2
8776	139	785	3
8777	139	432	4
8778	139	226	5
8779	139	194	6
8780	139	804	7
8781	139	810	8
8782	139	784	9
8783	139	815	10
8784	139	829	11
8785	139	786	12
8786	139	336	13
8787	139	809	14
8788	139	803	15
8789	139	270	16
8790	139	828	17
8791	139	815	18
8792	139	786	19
8793	139	785	20
8794	139	827	21
8795	139	835	22
8796	139	792	23
8797	139	821	24
8798	139	793	25
8799	139	63	26
8800	139	814	27
8801	139	14	28
8802	139	820	29
8803	139	821	30
8804	139	805	31
8805	139	829	32
8806	139	786	33
8807	139	785	34
8808	139	14	35
8809	139	820	36
8810	139	814	37
8811	139	80	38
8812	139	832	39
8813	139	9	40
8814	139	823	41
8815	139	800	42
8816	139	813	43
8817	139	789	44
8818	139	825	45
8819	139	793	46
8820	139	837	47
8821	139	814	48
5086	105	503	0
5087	105	504	1
5088	105	505	2
5089	105	2	3
5090	105	544	4
5091	105	543	5
4541	97	402	0
4542	97	437	1
4543	97	438	2
4544	97	2	3
4545	98	439	0
4546	98	440	1
4547	98	443	2
4548	98	441	3
4549	98	442	4
4550	98	381	5
4551	98	440	6
4552	98	432	7
4553	98	444	8
4554	99	462	0
4555	99	440	1
4556	99	443	2
4557	99	489	3
4558	99	502	4
4559	99	455	5
4560	99	453	6
4561	99	493	7
4562	99	440	8
4563	99	498	9
4564	99	490	10
4565	99	502	11
4566	99	491	12
4567	99	472	13
4568	99	449	14
4569	99	448	15
4570	99	494	16
4571	99	500	17
4572	99	489	18
4573	99	440	19
4574	99	432	20
4575	99	450	21
4576	99	458	22
4577	99	475	23
4578	99	499	24
4579	99	440	25
4580	99	483	26
4581	99	446	27
4582	99	471	28
4583	99	466	29
4584	99	452	30
4585	99	447	31
4586	99	485	32
4587	99	324	33
4588	99	140	34
4589	99	459	35
4590	99	489	36
4591	99	502	37
4592	99	480	38
4593	99	489	39
4594	99	501	40
4595	99	451	41
4596	99	474	42
4597	99	256	43
4598	99	484	44
4599	99	256	45
4600	99	465	46
4601	99	445	47
4602	99	464	48
4603	99	460	49
4604	99	471	50
4605	99	442	51
4606	99	440	52
4607	99	432	53
4608	99	444	54
4609	99	497	55
4610	99	336	56
4611	99	305	57
4612	99	486	58
4613	99	481	59
4614	99	478	60
4615	99	461	61
4616	99	502	62
4617	99	499	63
4618	99	467	64
4619	99	440	65
4620	99	498	66
4621	99	482	67
4622	99	446	68
4623	99	457	69
4624	99	470	70
4625	99	477	71
4626	99	481	72
4627	99	496	73
4628	99	468	74
4629	99	480	75
4630	99	473	76
4631	99	454	77
4632	99	478	78
4633	99	502	79
4634	99	22	80
4635	99	440	81
4636	99	498	82
4637	99	450	83
4638	99	487	84
4639	99	469	85
4640	99	470	86
4641	99	477	87
4642	99	476	88
4643	99	460	89
4644	99	481	90
4645	99	479	91
4646	99	486	92
4647	99	481	93
4648	99	497	94
4649	99	453	95
4650	99	495	96
4651	99	486	97
4652	99	476	98
4653	99	492	99
4654	99	450	100
4655	99	463	101
4656	99	461	102
4657	99	502	103
4658	99	488	104
4659	99	456	105
4660	99	462	106
4661	99	440	107
4662	99	443	108
4663	99	489	109
4664	99	502	110
4665	99	481	111
4666	99	492	112
4667	99	450	113
4668	99	487	114
4669	101	440	0
10742	169	996	0
10743	169	995	1
10744	169	994	2
10745	170	998	0
10746	170	997	1
10747	170	997	2
10748	173	177	0
10749	173	348	1
5985	113	547	0
5986	113	546	1
5987	113	545	2
5988	113	120	3
5989	113	2	4
5990	114	554	0
5991	114	549	1
5992	114	551	2
5993	114	83	3
5994	114	553	4
5995	114	552	5
5996	114	550	6
5997	114	29	7
5998	114	548	8
5999	115	597	0
6000	115	110	1
6001	115	560	2
6002	115	8	3
6003	115	373	4
6004	115	620	5
6005	115	46	6
6006	115	604	7
6007	115	30	8
6008	115	12	9
6009	115	598	10
6010	115	50	11
6011	115	19	12
6012	115	566	13
6013	115	612	14
6014	115	601	15
6015	115	452	16
6016	115	600	17
6017	115	89	18
6018	115	573	19
6019	115	605	20
6020	115	563	21
6021	115	583	22
6022	115	570	23
6023	115	88	24
6024	115	580	25
6025	115	624	26
6026	115	587	27
6027	115	603	28
6028	115	568	29
6029	115	603	30
6030	115	614	31
6031	115	556	32
6032	115	95	33
6033	115	617	34
6034	115	589	35
6035	115	602	36
6036	115	596	37
6037	115	619	38
6038	115	621	39
6039	115	584	40
6040	115	559	41
6041	115	595	42
6042	115	30	43
6043	115	12	44
6044	115	26	45
6045	115	602	46
6046	115	564	47
6047	115	557	48
6048	115	30	49
6049	115	12	50
6050	115	26	51
6051	115	580	52
6052	115	614	53
6053	115	602	54
6054	115	74	55
6055	115	95	56
6056	115	622	57
6057	115	575	58
6058	115	30	59
6059	115	12	60
6060	115	599	61
6061	115	588	62
6062	115	95	63
6063	115	622	64
6064	115	599	65
6065	115	578	66
6066	115	30	67
6067	115	12	68
6068	115	561	69
6069	115	565	70
6070	115	567	71
6071	115	30	72
6072	115	12	73
6073	115	569	74
6074	115	599	75
6075	115	95	76
6076	115	622	77
6077	115	599	78
6078	115	576	79
6079	115	12	80
6080	115	586	81
6081	115	571	82
6082	115	607	83
6083	115	12	84
6084	115	591	85
6085	115	559	86
6086	115	160	87
6087	115	592	88
6088	115	12	89
6089	115	558	90
6090	115	579	91
6091	115	602	92
6092	115	577	93
6093	115	23	94
6094	115	558	95
6095	115	77	96
6096	115	586	97
6097	115	618	98
6098	115	615	99
6099	115	608	100
6100	115	14	101
6101	115	606	102
6102	115	82	103
6103	115	613	104
6104	115	593	105
6105	115	623	106
6106	115	594	107
6107	115	602	108
6108	115	612	109
6109	115	574	110
6110	115	40	111
6111	115	581	112
6112	115	214	113
6113	115	609	114
6114	115	373	115
6115	115	620	116
6116	115	610	117
6117	115	604	118
6118	115	614	119
6119	115	30	120
6120	115	12	121
6121	115	598	122
6122	115	50	123
6123	115	19	124
6124	115	566	125
6125	115	612	126
6126	115	604	127
6127	115	568	128
6128	115	603	129
6129	115	555	130
6130	115	616	131
6131	115	562	132
6132	115	30	133
6133	115	582	134
6134	115	19	135
6135	115	46	136
6136	115	249	137
6137	115	572	138
6138	115	7	139
6139	115	22	140
6140	115	585	141
6141	115	7	142
6142	115	46	143
6143	115	611	144
6144	115	590	145
6145	117	74	0
6146	117	625	1
6147	117	626	2
8822	139	432	49
8823	139	226	50
8824	139	818	51
8825	139	806	52
8826	139	804	53
8827	139	815	54
8828	139	786	55
8829	139	822	56
8830	139	816	57
8831	139	788	58
8832	139	794	59
8833	139	836	60
8834	139	562	61
8835	139	807	62
8836	139	790	63
8837	139	812	64
8838	139	816	65
8839	139	831	66
8840	139	819	67
8841	139	831	68
8842	139	829	69
8843	139	786	70
8844	139	799	71
8845	139	802	72
8846	139	834	73
8847	139	811	74
8848	139	14	75
8849	139	839	76
8850	139	798	77
8851	139	791	78
8852	139	829	79
8853	139	797	80
8854	139	711	81
8855	139	785	82
8856	139	789	83
8857	139	795	84
8858	139	830	85
8859	139	829	86
8860	139	808	87
8861	139	796	88
8862	139	785	89
8863	139	789	90
8864	139	824	91
8865	139	801	92
8866	139	555	93
8867	139	833	94
8868	139	838	95
8869	139	29	96
8870	139	817	97
8871	139	826	98
9617	145	842	0
9618	145	841	1
9619	145	840	2
9620	145	2	3
9621	146	8	0
9622	146	373	1
9623	146	620	2
9624	146	843	3
9625	146	610	4
9626	146	614	5
9627	146	30	6
9628	146	12	7
9629	146	26	8
9630	146	50	9
9631	146	74	10
9632	146	602	11
9633	147	597	0
9634	147	155	1
9635	147	485	2
9636	147	914	3
9637	147	902	4
9638	147	909	5
9639	147	904	6
9640	147	872	7
9641	147	895	8
9642	147	713	9
9643	147	863	10
9644	147	367	11
9645	147	7	12
9646	147	888	13
9647	147	848	14
9648	147	865	15
9649	147	900	16
9650	147	912	17
9651	147	872	18
9652	147	821	19
9653	147	884	20
9654	147	891	21
9655	147	851	22
9656	147	589	23
9657	147	638	24
9658	147	870	25
9659	147	909	26
9660	147	875	27
9661	147	885	28
9662	147	850	29
9663	147	845	30
9664	147	589	31
9665	147	875	32
9666	147	478	33
9667	147	846	34
9668	147	882	35
9669	147	904	36
9670	147	7	37
9671	147	91	38
9672	147	26	39
9673	147	850	40
9674	147	845	41
9675	147	742	42
9676	147	873	43
9677	147	909	44
9678	147	908	45
9679	147	896	46
9680	147	849	47
9681	147	881	48
9682	147	276	49
9683	147	5	50
9684	147	502	51
9685	147	892	52
9686	147	600	53
9687	147	857	54
9688	147	913	55
9689	147	905	56
9690	147	871	57
9691	147	874	58
9692	147	876	59
9693	147	45	60
9694	147	894	61
9695	147	893	62
9696	147	502	63
9697	147	909	64
9698	147	858	65
9699	147	899	66
9700	147	878	67
9701	147	826	68
9702	147	903	69
9703	147	7	70
9704	147	46	71
9705	147	599	72
9706	147	719	73
9707	147	879	74
9708	147	871	75
9709	147	892	76
9710	147	85	77
9711	147	864	78
9712	147	903	79
9713	147	855	80
9714	147	904	81
9715	147	917	82
9716	147	276	83
9717	147	886	84
9718	147	638	85
9719	147	853	86
9720	147	856	87
9721	147	898	88
9722	147	868	89
9723	147	795	90
9724	147	907	91
9725	147	862	92
9726	147	867	93
9727	147	877	94
9728	147	860	95
9729	147	887	96
9730	147	901	97
9731	147	916	98
9732	147	862	99
9733	147	875	100
9734	147	847	101
9735	147	911	102
9736	147	906	103
9737	147	910	104
9738	147	859	105
9739	147	911	106
9740	147	897	107
9741	147	854	108
9742	147	894	109
9743	147	844	110
9744	147	112	111
9745	147	869	112
9746	147	861	113
9747	147	866	114
9748	147	880	115
9749	147	597	116
9750	147	915	117
9751	147	909	118
9752	147	5	119
8111	129	722	0
8112	129	723	1
8113	129	2	2
8114	129	721	3
8115	130	729	0
8116	130	724	1
8117	130	206	2
8118	130	725	3
8119	130	110	4
8120	130	726	5
8121	130	727	6
8122	130	728	7
8123	131	532	0
8124	131	752	1
8125	131	766	2
8126	131	765	3
8127	131	750	4
8128	131	767	5
8129	131	761	6
8130	131	177	7
8131	131	734	8
8132	131	730	9
8133	131	344	10
8134	131	534	11
8135	131	287	12
8136	131	33	13
8137	131	740	14
8138	131	121	15
8139	131	768	16
8140	131	725	17
8141	131	110	18
8142	131	760	19
8143	131	726	20
8144	131	727	21
8145	131	728	22
8146	131	777	23
8147	131	741	24
8148	131	367	25
8149	131	762	26
8150	131	763	27
8151	131	2	28
8152	131	738	29
8153	131	780	30
8154	131	209	31
8155	131	746	32
8156	131	749	33
8157	131	739	34
8158	131	155	35
8159	131	742	36
8160	131	2	37
8161	131	771	38
8162	131	205	39
8163	131	770	40
8164	131	779	41
8165	131	724	42
8166	131	206	43
8167	131	226	44
8168	131	736	45
8169	131	476	46
8170	131	33	47
8171	131	735	48
8172	131	476	49
8173	131	763	50
8174	131	253	51
8175	131	743	52
8176	131	206	53
8177	131	757	54
8178	131	747	55
8179	131	744	56
8180	131	737	57
8181	131	778	58
8182	131	774	59
8183	131	758	60
8184	131	135	61
8185	131	764	62
8186	131	209	63
8187	131	724	64
8188	131	206	65
8189	131	753	66
8190	131	2	67
8191	131	564	68
8192	131	773	69
8193	131	732	70
8194	131	778	71
8195	131	681	72
8196	131	759	73
8197	131	775	74
8198	131	769	75
8199	131	733	76
8200	131	367	77
8201	131	755	78
8202	131	731	79
8203	131	751	80
8204	131	2	81
8205	131	155	82
8206	131	748	83
8207	131	772	84
8208	131	739	85
8209	131	756	86
8210	131	33	87
8211	131	745	88
8212	131	746	89
8213	131	754	90
8214	131	776	91
8215	131	334	92
8216	131	242	93
8217	133	766	0
8218	133	765	1
8219	133	761	2
8220	133	777	3
8221	133	741	4
8222	133	739	5
8223	133	756	6
8224	133	740	7
8225	133	121	8
8226	133	768	9
8227	133	751	10
8228	133	334	11
8229	133	242	12
9753	147	889	120
9754	147	848	121
9755	147	675	122
9756	147	52	123
9757	147	890	124
9758	147	94	125
9759	147	786	126
9760	147	883	127
9761	147	491	128
9762	147	852	129
9763	149	909	0
9764	149	625	1
9765	149	626	2
10301	153	919	0
10302	153	918	1
10303	153	2	2
10304	153	920	3
10305	154	929	0
10306	154	50	1
10307	154	921	2
10308	154	931	3
10309	154	923	4
10310	154	598	5
10311	154	924	6
10312	154	925	7
10313	154	930	8
10314	154	928	9
10315	154	922	10
10316	154	927	11
10317	154	926	12
10318	155	929	0
10319	155	50	1
10320	155	921	2
10321	155	931	3
10322	155	963	4
10323	155	923	5
10324	155	957	6
10325	155	924	7
10326	155	962	8
10327	155	925	9
10328	155	930	10
10329	155	928	11
10330	155	562	12
10331	155	952	13
10332	155	941	14
10333	155	131	15
10334	155	953	16
10335	155	940	17
10336	155	930	18
10337	155	928	19
10338	155	942	20
10339	155	948	21
10340	155	946	22
10341	155	965	23
10342	155	932	24
10343	155	938	25
10344	155	945	26
10345	155	934	27
10346	155	947	28
10347	155	925	29
10348	155	930	30
10349	155	928	31
10350	155	936	32
10351	155	954	33
10352	155	931	34
10353	155	960	35
10354	155	131	36
10355	155	947	37
10356	155	562	38
10357	155	952	39
10358	155	941	40
10359	155	935	41
10360	155	950	42
10361	155	943	43
10362	155	961	44
10363	155	939	45
10364	155	18	46
10365	155	947	47
10366	155	933	48
10367	155	966	49
10368	155	941	50
10369	155	50	51
10370	155	964	52
10371	155	39	53
10372	155	947	54
10373	155	925	55
10374	155	922	56
10375	155	944	57
10376	155	50	58
10377	155	921	59
10378	155	562	60
10379	155	959	61
10380	155	149	62
10381	155	951	63
10382	155	923	64
10383	155	598	65
10384	155	93	66
10385	155	929	67
10386	155	931	68
10387	155	958	69
10388	155	937	70
10389	155	923	71
10390	155	949	72
10391	155	931	73
10392	155	50	74
10393	155	964	75
10394	155	960	76
10395	155	956	77
10396	155	947	78
10397	155	925	79
10398	155	930	80
10399	155	928	81
10400	155	214	82
10401	155	955	83
10402	155	931	84
10403	155	924	85
10404	155	422	86
10405	155	930	87
10406	155	830	88
10407	155	367	89
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
57	5	1	\N
58	5	2	\N
59	5	4	\N
60	5	16	\N
61	5	17	\N
62	5	8	\N
63	5	32	\N
64	5	64	\N
65	6	1	\N
66	6	2	\N
67	6	4	\N
68	6	16	\N
69	6	17	\N
70	6	8	\N
71	6	32	\N
72	6	64	\N
73	7	1	\N
74	7	2	\N
75	7	4	\N
76	7	16	\N
77	7	17	\N
78	7	8	\N
79	7	32	\N
80	7	64	\N
81	8	1	\N
82	8	2	\N
83	8	4	\N
84	8	16	\N
85	8	17	\N
86	8	8	\N
87	8	32	\N
88	8	64	\N
89	9	1	\N
90	9	2	\N
91	9	4	\N
92	9	16	\N
93	9	17	\N
94	9	8	\N
95	9	32	\N
96	9	64	\N
97	10	1	\N
98	10	2	\N
99	10	4	\N
100	10	16	\N
101	10	17	\N
102	10	8	\N
103	10	32	\N
104	10	64	\N
105	11	1	\N
106	11	2	\N
107	11	4	\N
108	11	16	\N
109	11	17	\N
110	11	8	\N
111	11	32	\N
112	11	64	\N
113	12	1	\N
114	12	2	\N
115	12	4	\N
116	12	16	\N
117	12	17	\N
118	12	8	\N
119	12	32	\N
120	12	64	\N
121	13	1	\N
122	13	2	\N
123	13	4	\N
124	13	16	\N
125	13	17	\N
126	13	8	\N
127	13	32	\N
128	13	64	\N
129	14	1	\N
130	14	2	\N
131	14	4	\N
132	14	16	\N
133	14	17	\N
134	14	8	\N
135	14	32	\N
136	14	64	\N
137	15	1	\N
138	15	2	\N
139	15	4	\N
140	15	16	\N
141	15	17	\N
142	15	8	\N
143	15	32	\N
144	15	64	\N
145	16	1	\N
146	16	2	\N
147	16	4	\N
148	16	16	\N
149	16	17	\N
150	16	8	\N
151	16	32	\N
152	16	64	\N
153	17	1	\N
154	17	2	\N
155	17	4	\N
156	17	16	\N
157	17	17	\N
158	17	8	\N
159	17	32	\N
160	17	64	\N
161	18	1	\N
162	18	2	\N
163	18	4	\N
164	18	16	\N
165	18	17	\N
166	18	8	\N
167	18	32	\N
168	18	64	\N
169	19	1	\N
170	19	2	\N
171	19	4	\N
172	19	16	\N
173	19	17	\N
174	19	8	\N
175	19	32	\N
176	19	64	\N
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
6	1	7	2025-01-23 05:21:48	2025-01-23 05:21:44	2025-01-23 05:21:44	5	en	3		0
1	1	1	2025-01-23 05:18:23	2025-01-23 05:18:22	2025-01-23 05:18:22	5	en	1		0
13	1	14	2025-01-23 05:24:37	2025-01-23 05:24:32	2025-01-23 05:24:32	5	en	3		0
19	1	20	2025-01-23 05:27:01	2025-01-23 05:26:57	2025-01-23 05:26:57	5	en	3		0
7	1	8	2025-01-23 05:22:13	2025-01-23 05:22:08	2025-01-23 05:22:08	5	en	3		0
2	1	2	2025-01-23 05:19:31	2025-01-23 05:19:22	2025-01-23 05:19:22	5	en	3		0
14	1	15	2025-01-23 05:25:01	2025-01-23 05:24:56	2025-01-23 05:24:56	5	en	3		0
8	1	9	2025-01-23 05:22:36	2025-01-23 05:22:32	2025-01-23 05:22:32	5	en	3		0
15	1	16	2025-01-23 05:25:25	2025-01-23 05:25:20	2025-01-23 05:25:20	5	en	3		0
9	1	10	2025-01-23 05:23:00	2025-01-23 05:22:55	2025-01-23 05:22:55	5	en	3		0
3	1	4	2025-01-23 05:20:15	2025-01-23 05:19:50	2025-01-23 05:19:50	5	en	3		0
10	1	11	2025-01-23 05:23:24	2025-01-23 05:23:19	2025-01-23 05:23:19	5	en	3		0
16	1	17	2025-01-23 05:25:50	2025-01-23 05:25:46	2025-01-23 05:25:46	5	en	3		0
4	1	5	2025-01-23 05:20:35	2025-01-23 05:20:34	2025-01-23 05:20:34	5	en	4		0
11	1	12	2025-01-23 05:23:48	2025-01-23 05:23:44	2025-01-23 05:23:44	5	en	3		0
17	1	18	2025-01-23 05:26:14	2025-01-23 05:26:09	2025-01-23 05:26:09	5	en	3		0
5	1	6	2025-01-23 05:21:25	2025-01-23 05:21:12	2025-01-23 05:21:12	5	en	3		0
12	1	13	2025-01-23 05:24:13	2025-01-23 05:24:08	2025-01-23 05:24:08	5	en	3		0
18	1	19	2025-01-23 05:26:38	2025-01-23 05:26:33	2025-01-23 05:26:33	5	en	3		0
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
1	2		nameLocaleKey	default.groups.name.manager
2	2		abbrevLocaleKey	default.groups.abbrev.manager
7	3		nameLocaleKey	default.groups.name.sectionEditor
8	3		abbrevLocaleKey	default.groups.abbrev.sectionEditor
13	4		nameLocaleKey	default.groups.name.author
14	4		abbrevLocaleKey	default.groups.abbrev.author
19	5		nameLocaleKey	default.groups.name.reader
20	5		abbrevLocaleKey	default.groups.abbrev.reader
25	6		nameLocaleKey	default.groups.name.editorialBoardMember
26	6		abbrevLocaleKey	default.groups.abbrev.editorialBoardMember
3	2	en	name	Preprint Server manager
4	2	en	abbrev	PSM
9	3	en	name	Moderator
10	3	en	abbrev	MOD
15	4	en	name	Author
16	4	en	abbrev	AU
21	5	en	name	Reader
22	5	en	abbrev	Read
27	6	en	name	Editorial Board Member
28	6	en	abbrev	EBM
5	2	fr_CA	name	##default.groups.name.manager##
6	2	fr_CA	abbrev	##default.groups.abbrev.manager##
11	3	fr_CA	name	##default.groups.name.sectionEditor##
12	3	fr_CA	abbrev	##default.groups.abbrev.sectionEditor##
17	4	fr_CA	name	Auteur-e
18	4	fr_CA	abbrev	AU
23	5	fr_CA	name	Lecteur-trice
24	5	fr_CA	abbrev	Lect
29	6	fr_CA	name	##default.groups.name.editorialBoardMember##
30	6	fr_CA	abbrev	##default.groups.abbrev.editorialBoardMember##
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

COPY public.user_groups (user_group_id, context_id, role_id, is_default, show_title, permit_self_registration, permit_metadata_edit, permit_settings, masthead) FROM stdin;
1	\N	1	1	1	0	0	1	0
2	1	16	1	1	0	1	1	0
3	1	17	1	1	0	1	0	1
4	1	65536	1	1	1	1	0	0
5	1	1048576	1	1	1	0	0	0
6	1	4097	1	1	0	0	0	1
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
46	11	en	familyName	Phillips
47	11	en	givenName	Dana
75	21	en	affiliation	University of Nairobi
76	21	en	familyName	Baiyewu
77	21	en	givenName	Rana
39	9	en	affiliation	University of Alberta
40	9	en	familyName	Montgomerie
41	9	en	givenName	Craig
57	15	en	affiliation	University of Cape Town
58	15	en	familyName	Mwandenga
59	15	en	givenName	John
63	17	en	affiliation	Stanford University
64	17	en	familyName	Al-Khafaji
65	17	en	givenName	Karim
3	2	en	affiliation	Universidad Nacional Autónoma de México
4	2	fr_CA	affiliation	Mexico
5	2	en	familyName	Vaca
6	2	fr_CA	familyName	Vaca
7	2	en	givenName	Ramiro
8	2	fr_CA	givenName	Ramiro
51	13	en	affiliation	Indiana University
52	13	en	familyName	Ostrom
53	13	en	givenName	Elinor
72	20	en	affiliation	University of Wolverhampton
73	20	en	familyName	Daniel
74	20	en	givenName	Patricia
15	4	en	affiliation	University of Chicago
16	4	fr_CA	affiliation	United States
17	4	en	familyName	Buskins
18	4	fr_CA	familyName	Buskins
19	4	en	givenName	David
20	4	fr_CA	givenName	David
78	22	en	affiliation	Barcelona University
79	22	en	familyName	Rossi
80	22	en	givenName	Rosanna
21	5	en	affiliation	University of Toronto
22	5	fr_CA	affiliation	Canada
23	5	en	familyName	Berardo
24	5	fr_CA	familyName	Berardo
25	5	en	givenName	Stephanie
26	5	fr_CA	givenName	Stephanie
27	6	en	affiliation	Kyoto University
28	6	fr_CA	affiliation	Japan
29	6	en	familyName	Inoue
30	6	fr_CA	familyName	Inoue
31	6	en	givenName	Minoti
32	6	fr_CA	givenName	Minoti
42	10	en	affiliation	Alexandria University
1	1	en	familyName	admin
2	1	en	givenName	admin
43	10	en	familyName	Diouf
44	10	en	givenName	Diaga
69	19	en	affiliation	University of Cape Town
33	7	en	affiliation	University of Bologna
34	7	en	familyName	Corino
35	7	en	givenName	Carlo
70	19	en	familyName	Kumiega
71	19	en	givenName	Lise
54	14	en	affiliation	University of Rome
36	8	en	affiliation	University of Windsor
37	8	en	familyName	Kwantes
38	8	en	givenName	Catherine
55	14	en	familyName	Paglieri
56	14	en	givenName	Fabio
60	16	en	affiliation	Aalborg University
61	16	en	familyName	Novak
62	16	en	givenName	John
48	12	en	affiliation	University College Cork
66	18	en	affiliation	Australian National University
67	18	en	familyName	Christopher
45	11	en	affiliation	University of Toronto
49	12	en	familyName	Sokoloff
50	12	en	givenName	Domatilia
68	18	en	givenName	Leo
81	23	en	affiliation	University of Tehran
82	23	en	familyName	Karbasizaed
83	23	en	givenName	Vajiheh
13	3	en	givenName	Daniel
14	3	fr_CA	givenName	Daniel
87	25	en	affiliation	CUNY
88	25	en	familyName	Woods
89	25	en	givenName	Zita
9	3	en	affiliation	University of Melbourne
84	24	en	affiliation	University of Windsor
85	24	en	familyName	Williamson
86	24	en	givenName	Valerie
10	3	fr_CA	affiliation	Australia
11	3	en	familyName	Barnes
12	3	fr_CA	familyName	Barnes
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.user_user_groups (user_user_group_id, user_group_id, user_id, date_start, date_end, masthead) FROM stdin;
1	1	1	2025-01-23 05:14:45	\N	\N
2	2	1	\N	\N	\N
3	2	2	2025-01-23 00:00:00	\N	1
4	2	3	2025-01-23 00:00:00	\N	1
5	3	4	2025-01-23 00:00:00	\N	1
6	3	5	2025-01-23 00:00:00	\N	1
7	3	6	2025-01-23 00:00:00	\N	1
8	5	7	2025-01-23 05:18:07	\N	\N
9	4	7	2025-01-23 05:18:09	\N	\N
10	5	8	2025-01-23 05:18:27	\N	\N
11	4	8	2025-01-23 05:18:31	\N	\N
12	5	9	2025-01-23 05:19:35	\N	\N
13	4	9	2025-01-23 05:19:37	\N	\N
14	5	10	2025-01-23 05:20:19	\N	\N
15	4	10	2025-01-23 05:20:22	\N	\N
16	5	11	2025-01-23 05:20:57	\N	\N
17	4	11	2025-01-23 05:20:59	\N	\N
18	5	12	2025-01-23 05:21:29	\N	\N
19	4	12	2025-01-23 05:21:31	\N	\N
20	5	13	2025-01-23 05:21:52	\N	\N
21	4	13	2025-01-23 05:21:55	\N	\N
22	5	14	2025-01-23 05:22:17	\N	\N
23	4	14	2025-01-23 05:22:19	\N	\N
24	5	15	2025-01-23 05:22:40	\N	\N
25	4	15	2025-01-23 05:22:42	\N	\N
26	5	16	2025-01-23 05:23:04	\N	\N
27	4	16	2025-01-23 05:23:06	\N	\N
28	5	17	2025-01-23 05:23:28	\N	\N
29	4	17	2025-01-23 05:23:30	\N	\N
30	5	18	2025-01-23 05:23:52	\N	\N
31	4	18	2025-01-23 05:23:55	\N	\N
32	5	19	2025-01-23 05:24:17	\N	\N
33	4	19	2025-01-23 05:24:19	\N	\N
34	5	20	2025-01-23 05:24:41	\N	\N
35	4	20	2025-01-23 05:24:43	\N	\N
36	5	21	2025-01-23 05:25:05	\N	\N
37	4	21	2025-01-23 05:25:07	\N	\N
38	5	22	2025-01-23 05:25:30	\N	\N
39	4	22	2025-01-23 05:25:32	\N	\N
40	5	23	2025-01-23 05:25:54	\N	\N
41	4	23	2025-01-23 05:25:56	\N	\N
42	5	24	2025-01-23 05:26:18	\N	\N
43	4	24	2025-01-23 05:26:20	\N	\N
44	5	25	2025-01-23 05:26:42	\N	\N
45	4	25	2025-01-23 05:26:44	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.users (user_id, username, password, email, url, phone, mailing_address, billing_address, country, locales, gossip, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help, remember_token) FROM stdin;
10	ddiouf	$2y$10$KiCZxJ0oKyhTlQOwUu9Bg.h5NHSo5fYTlj8a4OWt486DVeXL1HHxK	ddiouf@mailinator.com	\N	\N	\N	\N	EG	[]	\N	\N	2025-01-23 05:20:19	\N	2025-01-23 05:20:19	\N	\N	\N	0	\N	1	\N
16	jnovak	$2y$10$R7JRAYMIcMWaOvDQK/18I.Huc30Nu/kN2YKKhgMArPQlSZuT2DhSK	jnovak@mailinator.com	\N	\N	\N	\N	DK	[]	\N	\N	2025-01-23 05:23:04	\N	2025-01-23 05:23:04	\N	\N	\N	0	\N	1	\N
11	dphillips	$2y$10$fpIt6smPjspENoM14/VvouRLVJ/hBjV8RuC33lqmxZfvxl/EV7Sa.	dphillips@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-23 05:20:56	\N	2025-01-23 05:20:57	\N	\N	\N	0	\N	1	\N
22	rrossi	$2y$10$o70QXWruwVKS/1CXZR9DK.o2ymUTWaTEfZaklRV6jLwQAz91F8jjS	rrossi@mailinator.com	\N	\N	\N	\N	ES	[]	\N	\N	2025-01-23 05:25:30	\N	2025-01-23 05:25:30	\N	\N	\N	0	\N	1	\N
17	kalkhafaji	$2y$10$ewS0mdaA1.LVmuMZYivXGOdRc04LyhNQkbik73z2BR8WZSrtm/GY2	kalkhafaji@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-23 05:23:28	\N	2025-01-23 05:23:28	\N	\N	\N	0	\N	1	\N
2	rvaca	$2y$10$WG1q2oPIR7.9tuTuSR1hDuzwtx6Udlb0SOxukah0.Vtmm3vLe66Am	rvaca@mailinator.com	\N	\N	\N	\N	MX	[]	\N	\N	2025-01-23 05:16:00	\N	\N	\N	\N	\N	0	\N	1	\N
4	dbuskins	$2y$10$B1i4Wp8b9ff1CFbeJ.huFOdY2MQrS/GaTBzU5LWJ7ykIW6PPWl1xi	dbuskins@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-23 05:16:43	\N	\N	\N	\N	\N	0	\N	1	\N
12	dsokoloff	$2y$10$WithhKMPxOVGqt2XK3ORp.dEVHldfdsE3I922Qi8nfGN6Z5i7fKr2	dsokoloff@mailinator.com	\N	\N	\N	\N	IE	[]	\N	\N	2025-01-23 05:21:29	\N	2025-01-23 05:21:29	\N	\N	\N	0	\N	1	\N
18	lchristopher	$2y$10$nRQXB01IE7j0zMHSfbsISeQu9YdIWJhuxNRg5bfhsMcAGPoROQfya	lchristopher@mailinator.com	\N	\N	\N	\N	AU	[]	\N	\N	2025-01-23 05:23:52	\N	2025-01-23 05:23:53	\N	\N	\N	0	\N	1	\N
5	sberardo	$2y$10$SDEP7MrlGZnX9MA4jf9kXuDRafvfDKsVUqI631jRCI3HRcKPcd3qG	sberardo@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-23 05:17:06	\N	\N	\N	\N	\N	0	\N	1	\N
6	minoue	$2y$10$41wKiIe1ucpXjJDCo6lxFule32iq0Ezok1YMhXjv6r9tS1UQuVMMW	minoue@mailinator.com	\N	\N	\N	\N	JP	[]	\N	\N	2025-01-23 05:17:31	\N	\N	\N	\N	\N	0	\N	1	\N
23	vkarbasizaed	$2y$10$/ONH89Rdbvjfktz7IPDyAuHSych3MRevghaNUmfzb.co1IArBNs8a	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR	[]	\N	\N	2025-01-23 05:25:54	\N	2025-01-23 05:25:54	\N	\N	\N	0	\N	1	\N
13	eostrom	$2y$10$xuFu/elMKAQ9od0RXOpJnOPKQsZ2MWJUT2t2Sjq3yT6JRR4aSR35G	eostrom@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-23 05:21:52	\N	2025-01-23 05:21:52	\N	\N	\N	0	\N	1	\N
1	admin	$2y$10$WYMDf0GAqpTduQNoDR4pUukLZrqP9RJI37JZ6rLlsEljDqS0HAfQe	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	[]	\N	\N	2025-01-23 05:14:45	\N	2025-01-23 05:17:42	\N	\N	\N	0	\N	1	\N
7	ccorino	$2y$10$3mumSZKjxvtpTWvDl5VQqu69GJt1qovU2UeEb4Nz02YHa5WPa3U86	ccorino@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2025-01-23 05:18:07	\N	2025-01-23 05:18:07	\N	\N	\N	0	\N	1	\N
8	ckwantes	$2y$10$sqYI8xwAjZinOslFY8lVt.NjyNyUetdy2BjZwG00JaxPm2uCXUCr.	ckwantes@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-23 05:18:27	\N	2025-01-23 05:18:27	\N	\N	\N	0	\N	1	\N
19	lkumiega	$2y$10$mTAlGNX4H2Zjg.KiumW/.Oa6t5Xv6HsPS9ELsNECJC08mQl0yLzUy	lkumiega@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2025-01-23 05:24:17	\N	2025-01-23 05:24:17	\N	\N	\N	0	\N	1	\N
14	fpaglieri	$2y$10$fK9hgZ6Kq57inXv1J0KYz.ouivta.mwjN9mEzT/mKgpCqOusYhpP2	fpaglieri@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2025-01-23 05:22:16	\N	2025-01-23 05:22:17	\N	\N	\N	0	\N	1	\N
9	cmontgomerie	$2y$10$91.0.Q.4F9fnGfk16F.25u6mfrfX9QmvQY9i70712PeE4YcBnbYY2	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-23 05:19:34	\N	2025-01-23 05:19:35	\N	\N	\N	0	\N	1	\N
20	pdaniel	$2y$10$.X4CeJy8r8cJbzbqfoqVyu8d3WVtNIvA6oYDFwcQZdOpPDLHp2dam	pdaniel@mailinator.com	\N	\N	\N	\N	GB	[]	\N	\N	2025-01-23 05:24:41	\N	2025-01-23 05:24:41	\N	\N	\N	0	\N	1	\N
15	jmwandenga	$2y$10$mzeLX.fR08hQMRU2s3uUGeeaWmebcOL.0AGYDFN1Gmd./yuGSdHbq	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2025-01-23 05:22:40	\N	2025-01-23 05:22:40	\N	\N	\N	0	\N	1	\N
24	vwilliamson	$2y$10$Bg8jO5tGedGaGAtQuzh4Du6kKvjJBrUNAcDxrd8zr6kh6KWirfI8C	vwilliamson@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-23 05:26:18	\N	2025-01-23 05:26:18	\N	\N	\N	0	\N	1	\N
21	rbaiyewu	$2y$10$iTL5MxqpQMYp0Cp.AKCYue0QRJ6lxam.MKf4B0WeadGvo0Q0UGCkK	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE	[]	\N	\N	2025-01-23 05:25:05	\N	2025-01-23 05:25:05	\N	\N	\N	0	\N	1	\N
25	zwoods	$2y$10$nc7nrkEJ8zBZj5I2M/saT.sdkoS2MzqMFpI7c9GqqXpKoGPt2Isba	zwoods@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-23 05:26:42	\N	2025-01-23 05:26:42	\N	\N	\N	0	\N	1	\N
3	dbarnes	$2y$10$3ABiLGFEnHqur4gMC.OK8O5SyQd0cuVy7j/UA2HhM4GZrJOk5a1Te	dbarnes@mailinator.com	\N	\N	\N	\N	AU	[]	\N	\N	2025-01-23 05:16:21	\N	2025-01-23 05:26:58	\N	\N	\N	0	\N	1	\N
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (version_id, major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	1	0	0	0	2025-01-23 05:14:46	1	plugins.metadata	dc11		0	0
2	1	0	0	0	2025-01-23 05:14:46	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
3	1	0	1	0	2025-01-23 05:14:46	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
4	1	0	0	0	2025-01-23 05:14:46	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
5	0	1	0	0	2025-01-23 05:14:46	1	plugins.generic	citationStyleLanguage	CitationStyleLanguagePlugin	1	0
6	1	0	1	0	2025-01-23 05:14:46	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
7	1	0	0	0	2025-01-23 05:14:46	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
8	1	2	0	0	2025-01-23 05:14:46	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
9	1	1	0	0	2025-01-23 05:14:46	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
10	1	0	0	0	2025-01-23 05:14:46	1	plugins.generic	usageEvent		0	0
11	1	0	0	0	2025-01-23 05:14:46	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
12	2	2	0	0	2025-01-23 05:14:46	1	plugins.generic	crossref		0	0
13	1	0	0	0	2025-01-23 05:14:46	1	plugins.generic	webFeed	WebFeedPlugin	1	0
14	1	0	0	0	2025-01-23 05:14:46	1	plugins.importexport	native		0	0
15	1	0	0	0	2025-01-23 05:14:46	1	plugins.oaiMetadataFormats	dc		0	0
16	1	0	0	0	2025-01-23 05:14:46	1	plugins.themes	default	DefaultThemePlugin	1	0
17	3	5	0	0	2025-01-23 05:14:44	1	core	ops		0	1
\.


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

SELECT pg_catalog.setval('public.controlled_vocabs_controlled_vocab_id_seq', 81, true);


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

SELECT pg_catalog.setval('public.email_templates_default_data_email_templates_default_data_i_seq', 104, true);


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

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 35, true);


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
-- Name: highlight_settings_highlight_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.highlight_settings_highlight_setting_id_seq', 1, false);


--
-- Name: highlights_highlight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.highlights_highlight_id_seq', 1, false);


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
-- Name: invitations_invitation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.invitations_invitation_id_seq', 10, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.jobs_id_seq', 116, true);


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

SELECT pg_catalog.setval('public.notification_settings_notification_setting_id_seq', 3, true);


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notification_subscription_settings_setting_id_seq', 19, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 123, true);


--
-- Name: oai_resumption_tokens_oai_resumption_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.oai_resumption_tokens_oai_resumption_token_id_seq', 1, false);


--
-- Name: plugin_settings_plugin_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.plugin_settings_plugin_setting_id_seq', 25, true);


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

SELECT pg_catalog.setval('public.publication_settings_publication_setting_id_seq', 94, true);


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

SELECT pg_catalog.setval('public.server_settings_server_setting_id_seq', 82, true);


--
-- Name: servers_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.servers_server_id_seq', 1, true);


--
-- Name: site_settings_site_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.site_settings_site_setting_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 998, true);


--
-- Name: submission_search_object_keyw_submission_search_object_keyw_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_object_keyw_submission_search_object_keyw_seq', 10749, true);


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_objects_object_id_seq', 176, true);


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

SELECT pg_catalog.setval('public.user_group_settings_user_group_setting_id_seq', 30, true);


--
-- Name: user_group_stage_user_group_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_group_stage_user_group_stage_id_seq', 6, true);


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_groups_user_group_id_seq', 6, true);


--
-- Name: user_interests_user_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_interests_user_interest_id_seq', 1, false);


--
-- Name: user_settings_user_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.user_settings_user_setting_id_seq', 89, true);


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

SELECT pg_catalog.setval('public.versions_version_id_seq', 17, true);


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
-- Name: highlight_settings highlight_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlight_settings
    ADD CONSTRAINT highlight_settings_pkey PRIMARY KEY (highlight_setting_id);


--
-- Name: highlight_settings highlight_settings_unique; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlight_settings
    ADD CONSTRAINT highlight_settings_unique UNIQUE (highlight_id, locale, setting_name);


--
-- Name: highlights highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlights
    ADD CONSTRAINT highlights_pkey PRIMARY KEY (highlight_id);


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
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (invitation_id);


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
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


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
-- Name: email_log_sender_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX email_log_sender_id ON public.email_log USING btree (sender_id);


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
-- Name: filters_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filters_context_id ON public.filters USING btree (context_id);


--
-- Name: filters_filter_group_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filters_filter_group_id ON public.filters USING btree (filter_group_id);


--
-- Name: filters_parent_filter_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX filters_parent_filter_id ON public.filters USING btree (parent_filter_id);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX genre_settings_genre_id ON public.genre_settings USING btree (genre_id);


--
-- Name: genres_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX genres_context_id ON public.genres USING btree (context_id);


--
-- Name: highlight_settings_highlight_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX highlight_settings_highlight_id ON public.highlight_settings USING btree (highlight_id);


--
-- Name: highlights_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX highlights_context_id ON public.highlights USING btree (context_id);


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
-- Name: invitations_expiry_date_index; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX invitations_expiry_date_index ON public.invitations USING btree (expiry_date);


--
-- Name: invitations_inviter_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX invitations_inviter_id ON public.invitations USING btree (inviter_id);


--
-- Name: invitations_status_context_id_user_id_type_index; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX invitations_status_context_id_user_id_type_index ON public.invitations USING btree (status, context_id, user_id, type);


--
-- Name: invitations_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX invitations_user_id ON public.invitations USING btree (user_id);


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
-- Name: navigation_menu_item_assignments_parent_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_assignments_parent_id ON public.navigation_menu_item_assignments USING btree (parent_id);


--
-- Name: navigation_menu_item_settings_navigation_menu_item_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_item_id ON public.navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: navigation_menu_items_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menu_items_context_id ON public.navigation_menu_items USING btree (context_id);


--
-- Name: navigation_menus_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX navigation_menus_context_id ON public.navigation_menus USING btree (context_id);


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

CREATE INDEX notification_subscription_settings_context ON public.notification_subscription_settings USING btree (context_id);


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
-- Name: plugin_settings_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX plugin_settings_context_id ON public.plugin_settings USING btree (context_id);


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
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX sessions_user_id ON public.sessions USING btree (user_id);


--
-- Name: site_context_id; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX site_context_id ON public.site USING btree (redirect_context_id);


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
-- Name: usii_load_id_context_id_ip; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usii_load_id_context_id_ip ON public.usage_stats_unique_item_investigations_temporary_records USING btree (load_id, context_id, ip);


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
-- Name: usir_load_id_context_id_ip; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX usir_load_id_context_id_ip ON public.usage_stats_unique_item_requests_temporary_records USING btree (load_id, context_id, ip);


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
-- Name: ust_load_id_context_id_ip; Type: INDEX; Schema: public; Owner: ops-ci
--

CREATE INDEX ust_load_id_context_id_ip ON public.usage_stats_total_temporary_records USING btree (load_id, context_id, ip);


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
-- Name: email_log email_log_sender_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.email_log
    ADD CONSTRAINT email_log_sender_id_foreign FOREIGN KEY (sender_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


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
-- Name: filters filters_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: filters filters_filter_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_filter_group_id_foreign FOREIGN KEY (filter_group_id) REFERENCES public.filter_groups(filter_group_id) ON DELETE CASCADE;


--
-- Name: filters filters_parent_filter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_parent_filter_id_foreign FOREIGN KEY (parent_filter_id) REFERENCES public.filters(filter_id) ON DELETE CASCADE;


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
-- Name: highlight_settings highlight_settings_highlight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlight_settings
    ADD CONSTRAINT highlight_settings_highlight_id_foreign FOREIGN KEY (highlight_id) REFERENCES public.highlights(highlight_id) ON DELETE CASCADE;


--
-- Name: highlights highlights_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.highlights
    ADD CONSTRAINT highlights_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


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
-- Name: invitations invitations_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: invitations invitations_inviter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_inviter_id_foreign FOREIGN KEY (inviter_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: invitations invitations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


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
-- Name: navigation_menu_item_assignments navigation_menu_item_assignments_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_parent_id FOREIGN KEY (parent_id) REFERENCES public.navigation_menu_items(navigation_menu_item_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_item_settings navigation_menu_item_settings_navigation_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_item_settings
    ADD CONSTRAINT navigation_menu_item_settings_navigation_menu_id FOREIGN KEY (navigation_menu_item_id) REFERENCES public.navigation_menu_items(navigation_menu_item_id) ON DELETE CASCADE;


--
-- Name: navigation_menu_items navigation_menu_items_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


--
-- Name: navigation_menus navigation_menus_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.navigation_menus
    ADD CONSTRAINT navigation_menus_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


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
-- Name: notification_subscription_settings notification_subscription_settings_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_context_id_foreign FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


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
-- Name: plugin_settings plugin_settings_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.plugin_settings
    ADD CONSTRAINT plugin_settings_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


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
-- Name: site site_redirect_context_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_redirect_context_id_foreign FOREIGN KEY (redirect_context_id) REFERENCES public.servers(server_id) ON DELETE SET NULL;


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
-- Name: user_groups user_groups_context_id; Type: FK CONSTRAINT; Schema: public; Owner: ops-ci
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_context_id FOREIGN KEY (context_id) REFERENCES public.servers(server_id) ON DELETE CASCADE;


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

