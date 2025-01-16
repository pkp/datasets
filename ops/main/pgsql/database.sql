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
1	4	\N	5	\N	3	8	2025-01-16 05:20:19
2	4	\N	5	\N	3	16	2025-01-16 05:20:24
3	4	\N	5	\N	3	8	2025-01-16 05:20:29
\.


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	\N	2025-01-16 05:18:02	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
2	1048585	1	\N	2025-01-16 05:18:02	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
3	1048585	1	\N	2025-01-16 05:18:02	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Carlo Corino" <ccorino@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
4	1048585	2	\N	2025-01-16 05:19:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
10	1048585	3	\N	2025-01-16 05:19:28	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Craig Montgomerie" <cmontgomerie@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
5	1048585	2	\N	2025-01-16 05:19:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
6	1048585	2	\N	2025-01-16 05:19:00	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
7	1048585	2	\N	2025-01-16 05:19:00	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Urho Kekkonen" <notanemailukk@mailinator.com>			Submission Acknowledgement	<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
8	1048585	3	\N	2025-01-16 05:19:28	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
9	1048585	3	\N	2025-01-16 05:19:28	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
11	1048585	3	\N	2025-01-16 05:19:28	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Irvine" <mirvine@mailinator.com>			Submission Acknowledgement	<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
12	1048585	4	\N	2025-01-16 05:20:13	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
13	1048585	4	\N	2025-01-16 05:20:13	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
14	1048585	4	\N	2025-01-16 05:20:13	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
15	1048585	4	3	2025-01-16 05:20:19	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
16	1048585	4	3	2025-01-16 05:20:24	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			We have reversed the decision to decline your submission	<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>
17	1048585	4	3	2025-01-16 05:20:29	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>			Your submission has been declined	<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>
18	1048585	5	\N	2025-01-16 05:20:51	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
44	1048585	13	\N	2025-01-16 05:24:13	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
19	1048585	5	\N	2025-01-16 05:20:51	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
20	1048585	5	\N	2025-01-16 05:20:51	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
21	1048585	6	\N	2025-01-16 05:21:23	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
22	1048585	6	\N	2025-01-16 05:21:23	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
45	1048585	13	\N	2025-01-16 05:24:13	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
23	1048585	6	\N	2025-01-16 05:21:23	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Domatilia Sokoloff" <dsokoloff@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
24	1048585	7	\N	2025-01-16 05:21:47	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
25	1048585	7	\N	2025-01-16 05:21:47	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
26	1048585	7	\N	2025-01-16 05:21:47	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Elinor Ostrom" <eostrom@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
27	1048585	7	\N	2025-01-16 05:21:47	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank van Laerhoven" <fvanlaerhoven@mailinator.com>			Submission Acknowledgement	<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
28	1048585	8	\N	2025-01-16 05:22:11	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
29	1048585	8	\N	2025-01-16 05:22:11	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
30	1048585	8	\N	2025-01-16 05:22:11	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
31	1048585	9	\N	2025-01-16 05:22:35	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
32	1048585	9	\N	2025-01-16 05:22:36	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
33	1048585	9	\N	2025-01-16 05:22:36	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
63	1048585	19	\N	2025-01-16 05:26:38	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
34	1048585	10	\N	2025-01-16 05:23:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
35	1048585	10	\N	2025-01-16 05:23:00	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
36	1048585	10	\N	2025-01-16 05:23:00	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"John Novak" <jnovak@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
37	1048585	11	\N	2025-01-16 05:23:24	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
43	1048585	12	\N	2025-01-16 05:23:49	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Leo Christopher" <lchristopher@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
38	1048585	11	\N	2025-01-16 05:23:24	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
39	1048585	11	\N	2025-01-16 05:23:25	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Karim Al-Khafaji" <kalkhafaji@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
40	1048585	11	\N	2025-01-16 05:23:25	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Margaret Morse" <mmorse@mailinator.com>			Submission Acknowledgement	<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
41	1048585	12	\N	2025-01-16 05:23:49	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
42	1048585	12	\N	2025-01-16 05:23:49	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
46	1048585	13	\N	2025-01-16 05:24:13	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
47	1048585	14	\N	2025-01-16 05:24:37	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
48	1048585	14	\N	2025-01-16 05:24:37	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
49	1048585	14	\N	2025-01-16 05:24:37	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Patricia Daniel" <pdaniel@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
50	1048585	15	\N	2025-01-16 05:25:01	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
51	1048585	15	\N	2025-01-16 05:25:01	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
52	1048585	15	\N	2025-01-16 05:25:01	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
53	1048585	16	\N	2025-01-16 05:25:26	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
54	1048585	16	\N	2025-01-16 05:25:26	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
55	1048585	16	\N	2025-01-16 05:25:26	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Rosanna Rossi" <rrossi@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
56	1048585	17	\N	2025-01-16 05:25:50	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
57	1048585	17	\N	2025-01-16 05:25:50	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
58	1048585	17	\N	2025-01-16 05:25:50	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
59	1048585	18	\N	2025-01-16 05:26:14	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
60	1048585	18	\N	2025-01-16 05:26:14	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"Stephanie Berardo" <sberardo@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
61	1048585	18	\N	2025-01-16 05:26:14	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
62	1048585	19	\N	2025-01-16 05:26:38	805306370	"Ramiro Vaca" <rvaca@mailinator.com>	"David Buskins" <dbuskins@mailinator.com>			You have been assigned as a moderator on a submission to Public Knowledge Preprint Server	<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href="http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
64	1048585	19	\N	2025-01-16 05:26:38	536870914	"Ramiro Vaca" <rvaca@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>			Thank you for your submission to Public Knowledge Preprint Server	<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href="http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href="http://localhost/index.php/publicknowledge">Public Knowledge Preprint Server</a>.</p>
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
1	1048585	1	7	2025-01-16 05:17:48	268435458	submission.event.general.metadataUpdated	f
2	1048585	1	7	2025-01-16 05:17:49	268435458	submission.event.general.metadataUpdated	f
3	515	1	7	2025-01-16 05:17:59	1342177281	submission.event.fileUploaded	f
4	1048585	1	7	2025-01-16 05:17:59	1342177288	submission.event.fileRevised	f
5	515	1	7	2025-01-16 05:18:01	1342177296	submission.event.fileEdited	f
6	1048585	1	7	2025-01-16 05:18:02	268435457	submission.event.submissionSubmitted	f
7	1048585	2	8	2025-01-16 05:18:10	268435458	submission.event.general.metadataUpdated	f
8	1048585	2	8	2025-01-16 05:18:10	268435458	submission.event.general.metadataUpdated	f
9	1048585	2	8	2025-01-16 05:18:26	268435458	submission.event.general.metadataUpdated	f
10	515	2	8	2025-01-16 05:18:33	1342177281	submission.event.fileUploaded	f
11	1048585	2	8	2025-01-16 05:18:33	1342177288	submission.event.fileRevised	f
12	515	2	8	2025-01-16 05:18:35	1342177296	submission.event.fileEdited	f
13	1048585	2	8	2025-01-16 05:19:00	268435457	submission.event.submissionSubmitted	f
14	1048585	2	3	2025-01-16 05:19:08	268435462	publication.event.published	f
15	1048585	3	9	2025-01-16 05:19:14	268435458	submission.event.general.metadataUpdated	f
16	1048585	3	9	2025-01-16 05:19:15	268435458	submission.event.general.metadataUpdated	f
17	515	3	9	2025-01-16 05:19:25	1342177281	submission.event.fileUploaded	f
18	1048585	3	9	2025-01-16 05:19:25	1342177288	submission.event.fileRevised	f
19	515	3	9	2025-01-16 05:19:27	1342177296	submission.event.fileEdited	f
20	1048585	3	9	2025-01-16 05:19:28	268435457	submission.event.submissionSubmitted	f
21	1048585	3	3	2025-01-16 05:19:33	268435462	publication.event.published	f
22	1048585	3	3	2025-01-16 05:19:37	268435463	publication.event.unpublished	f
23	1048585	3	3	2025-01-16 05:19:39	268435458	submission.event.general.metadataUpdated	f
24	1048585	3	3	2025-01-16 05:19:42	268435462	publication.event.published	f
25	1048585	3	3	2025-01-16 05:19:45	268435458	submission.event.general.metadataUpdated	f
26	1048585	3	3	2025-01-16 05:19:45	268435464	publication.event.versionCreated	f
27	1048585	3	3	2025-01-16 05:19:51	268435458	submission.event.general.metadataUpdated	f
28	1048585	3	3	2025-01-16 05:19:53	268435462	publication.event.versionPublished	f
29	1048585	4	10	2025-01-16 05:20:00	268435458	submission.event.general.metadataUpdated	f
30	1048585	4	10	2025-01-16 05:20:00	268435458	submission.event.general.metadataUpdated	f
31	515	4	10	2025-01-16 05:20:10	1342177281	submission.event.fileUploaded	f
32	1048585	4	10	2025-01-16 05:20:10	1342177288	submission.event.fileRevised	f
33	515	4	10	2025-01-16 05:20:12	1342177296	submission.event.fileEdited	f
34	1048585	4	10	2025-01-16 05:20:13	268435457	submission.event.submissionSubmitted	f
35	1048585	4	3	2025-01-16 05:20:19	805306371	editor.submission.decision.decline.log	f
36	1048585	4	3	2025-01-16 05:20:24	805306371	editor.submission.decision.revertDecline.log	f
37	1048585	4	3	2025-01-16 05:20:29	805306371	editor.submission.decision.decline.log	f
38	1048585	5	11	2025-01-16 05:20:38	268435458	submission.event.general.metadataUpdated	f
39	1048585	5	11	2025-01-16 05:20:38	268435458	submission.event.general.metadataUpdated	f
40	515	5	11	2025-01-16 05:20:48	1342177281	submission.event.fileUploaded	f
41	1048585	5	11	2025-01-16 05:20:48	1342177288	submission.event.fileRevised	f
42	515	5	11	2025-01-16 05:20:50	1342177296	submission.event.fileEdited	f
43	1048585	5	11	2025-01-16 05:20:51	268435457	submission.event.submissionSubmitted	f
44	1048585	5	3	2025-01-16 05:20:55	268435462	publication.event.published	f
45	1048585	5	3	2025-01-16 05:20:59	268435463	publication.event.unpublished	f
46	1048585	5	3	2025-01-16 05:21:04	268435462	publication.event.published	f
47	1048585	6	12	2025-01-16 05:21:10	268435458	submission.event.general.metadataUpdated	f
48	1048585	6	12	2025-01-16 05:21:10	268435458	submission.event.general.metadataUpdated	f
49	515	6	12	2025-01-16 05:21:20	1342177281	submission.event.fileUploaded	f
50	1048585	6	12	2025-01-16 05:21:20	1342177288	submission.event.fileRevised	f
51	515	6	12	2025-01-16 05:21:22	1342177296	submission.event.fileEdited	f
52	1048585	6	12	2025-01-16 05:21:23	268435457	submission.event.submissionSubmitted	f
53	1048585	6	3	2025-01-16 05:21:28	268435462	publication.event.published	f
54	1048585	7	13	2025-01-16 05:21:34	268435458	submission.event.general.metadataUpdated	f
55	1048585	7	13	2025-01-16 05:21:34	268435458	submission.event.general.metadataUpdated	f
56	515	7	13	2025-01-16 05:21:44	1342177281	submission.event.fileUploaded	f
57	1048585	7	13	2025-01-16 05:21:44	1342177288	submission.event.fileRevised	f
58	515	7	13	2025-01-16 05:21:46	1342177296	submission.event.fileEdited	f
59	1048585	7	13	2025-01-16 05:21:47	268435457	submission.event.submissionSubmitted	f
60	1048585	7	3	2025-01-16 05:21:52	268435462	publication.event.published	f
61	1048585	8	14	2025-01-16 05:21:58	268435458	submission.event.general.metadataUpdated	f
62	1048585	8	14	2025-01-16 05:21:58	268435458	submission.event.general.metadataUpdated	f
63	515	8	14	2025-01-16 05:22:08	1342177281	submission.event.fileUploaded	f
64	1048585	8	14	2025-01-16 05:22:08	1342177288	submission.event.fileRevised	f
65	515	8	14	2025-01-16 05:22:11	1342177296	submission.event.fileEdited	f
66	1048585	8	14	2025-01-16 05:22:11	268435457	submission.event.submissionSubmitted	f
67	1048585	8	3	2025-01-16 05:22:16	268435462	publication.event.published	f
68	1048585	9	15	2025-01-16 05:22:22	268435458	submission.event.general.metadataUpdated	f
69	1048585	9	15	2025-01-16 05:22:23	268435458	submission.event.general.metadataUpdated	f
70	515	9	15	2025-01-16 05:22:32	1342177281	submission.event.fileUploaded	f
71	1048585	9	15	2025-01-16 05:22:32	1342177288	submission.event.fileRevised	f
72	515	9	15	2025-01-16 05:22:35	1342177296	submission.event.fileEdited	f
73	1048585	9	15	2025-01-16 05:22:36	268435457	submission.event.submissionSubmitted	f
74	1048585	9	3	2025-01-16 05:22:40	268435462	publication.event.published	f
75	1048585	10	16	2025-01-16 05:22:46	268435458	submission.event.general.metadataUpdated	f
76	1048585	10	16	2025-01-16 05:22:47	268435458	submission.event.general.metadataUpdated	f
77	515	10	16	2025-01-16 05:22:57	1342177281	submission.event.fileUploaded	f
78	1048585	10	16	2025-01-16 05:22:57	1342177288	submission.event.fileRevised	f
79	515	10	16	2025-01-16 05:22:59	1342177296	submission.event.fileEdited	f
80	1048585	10	16	2025-01-16 05:23:00	268435457	submission.event.submissionSubmitted	f
81	1048585	10	3	2025-01-16 05:23:04	268435462	publication.event.published	f
82	1048585	11	17	2025-01-16 05:23:11	268435458	submission.event.general.metadataUpdated	f
83	1048585	11	17	2025-01-16 05:23:11	268435458	submission.event.general.metadataUpdated	f
84	515	11	17	2025-01-16 05:23:21	1342177281	submission.event.fileUploaded	f
85	1048585	11	17	2025-01-16 05:23:21	1342177288	submission.event.fileRevised	f
86	515	11	17	2025-01-16 05:23:23	1342177296	submission.event.fileEdited	f
87	1048585	11	17	2025-01-16 05:23:24	268435457	submission.event.submissionSubmitted	f
88	1048585	11	3	2025-01-16 05:23:29	268435462	publication.event.published	f
89	1048585	12	18	2025-01-16 05:23:36	268435458	submission.event.general.metadataUpdated	f
90	1048585	12	18	2025-01-16 05:23:36	268435458	submission.event.general.metadataUpdated	f
91	515	12	18	2025-01-16 05:23:46	1342177281	submission.event.fileUploaded	f
92	1048585	12	18	2025-01-16 05:23:46	1342177288	submission.event.fileRevised	f
93	515	12	18	2025-01-16 05:23:48	1342177296	submission.event.fileEdited	f
94	1048585	12	18	2025-01-16 05:23:49	268435457	submission.event.submissionSubmitted	f
95	1048585	12	3	2025-01-16 05:23:53	268435462	publication.event.published	f
96	1048585	13	19	2025-01-16 05:24:00	268435458	submission.event.general.metadataUpdated	f
97	1048585	13	19	2025-01-16 05:24:00	268435458	submission.event.general.metadataUpdated	f
98	515	13	19	2025-01-16 05:24:10	1342177281	submission.event.fileUploaded	f
99	1048585	13	19	2025-01-16 05:24:10	1342177288	submission.event.fileRevised	f
100	515	13	19	2025-01-16 05:24:12	1342177296	submission.event.fileEdited	f
101	1048585	13	19	2025-01-16 05:24:13	268435457	submission.event.submissionSubmitted	f
102	1048585	13	3	2025-01-16 05:24:17	268435462	publication.event.published	f
103	1048585	14	20	2025-01-16 05:24:24	268435458	submission.event.general.metadataUpdated	f
104	1048585	14	20	2025-01-16 05:24:24	268435458	submission.event.general.metadataUpdated	f
105	515	14	20	2025-01-16 05:24:34	1342177281	submission.event.fileUploaded	f
106	1048585	14	20	2025-01-16 05:24:34	1342177288	submission.event.fileRevised	f
107	515	14	20	2025-01-16 05:24:36	1342177296	submission.event.fileEdited	f
108	1048585	14	20	2025-01-16 05:24:37	268435457	submission.event.submissionSubmitted	f
109	1048585	14	3	2025-01-16 05:24:42	268435462	publication.event.published	f
110	1048585	15	21	2025-01-16 05:24:48	268435458	submission.event.general.metadataUpdated	f
111	1048585	15	21	2025-01-16 05:24:48	268435458	submission.event.general.metadataUpdated	f
112	515	15	21	2025-01-16 05:24:58	1342177281	submission.event.fileUploaded	f
113	1048585	15	21	2025-01-16 05:24:58	1342177288	submission.event.fileRevised	f
114	515	15	21	2025-01-16 05:25:01	1342177296	submission.event.fileEdited	f
115	1048585	15	21	2025-01-16 05:25:01	268435457	submission.event.submissionSubmitted	f
116	1048585	15	3	2025-01-16 05:25:06	268435462	publication.event.published	f
117	1048585	16	22	2025-01-16 05:25:12	268435458	submission.event.general.metadataUpdated	f
118	1048585	16	22	2025-01-16 05:25:13	268435458	submission.event.general.metadataUpdated	f
119	515	16	22	2025-01-16 05:25:22	1342177281	submission.event.fileUploaded	f
120	1048585	16	22	2025-01-16 05:25:23	1342177288	submission.event.fileRevised	f
121	515	16	22	2025-01-16 05:25:25	1342177296	submission.event.fileEdited	f
122	1048585	16	22	2025-01-16 05:25:26	268435457	submission.event.submissionSubmitted	f
123	1048585	16	3	2025-01-16 05:25:30	268435462	publication.event.published	f
124	1048585	17	23	2025-01-16 05:25:37	268435458	submission.event.general.metadataUpdated	f
125	1048585	17	23	2025-01-16 05:25:37	268435458	submission.event.general.metadataUpdated	f
126	515	17	23	2025-01-16 05:25:47	1342177281	submission.event.fileUploaded	f
127	1048585	17	23	2025-01-16 05:25:47	1342177288	submission.event.fileRevised	f
128	515	17	23	2025-01-16 05:25:49	1342177296	submission.event.fileEdited	f
129	1048585	17	23	2025-01-16 05:25:50	268435457	submission.event.submissionSubmitted	f
130	1048585	17	3	2025-01-16 05:25:54	268435462	publication.event.published	f
131	1048585	18	24	2025-01-16 05:26:01	268435458	submission.event.general.metadataUpdated	f
132	1048585	18	24	2025-01-16 05:26:01	268435458	submission.event.general.metadataUpdated	f
133	515	18	24	2025-01-16 05:26:11	1342177281	submission.event.fileUploaded	f
134	1048585	18	24	2025-01-16 05:26:11	1342177288	submission.event.fileRevised	f
135	515	18	24	2025-01-16 05:26:13	1342177296	submission.event.fileEdited	f
136	1048585	18	24	2025-01-16 05:26:14	268435457	submission.event.submissionSubmitted	f
137	1048585	18	3	2025-01-16 05:26:19	268435462	publication.event.published	f
138	1048585	19	25	2025-01-16 05:26:25	268435458	submission.event.general.metadataUpdated	f
139	1048585	19	25	2025-01-16 05:26:25	268435458	submission.event.general.metadataUpdated	f
140	515	19	25	2025-01-16 05:26:35	1342177281	submission.event.fileUploaded	f
141	1048585	19	25	2025-01-16 05:26:35	1342177288	submission.event.fileRevised	f
142	515	19	25	2025-01-16 05:26:37	1342177296	submission.event.fileEdited	f
143	1048585	19	25	2025-01-16 05:26:38	268435457	submission.event.submissionSubmitted	f
144	1048585	19	3	2025-01-16 05:26:43	268435462	publication.event.published	f
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
1	database	queue	{"uuid":"8a757c65-9df5-4db8-8acf-236b9ca506e3","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:1;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:18:12
2	database	queue	{"uuid":"cec3231f-caed-481a-a0d4-264a81f590c7","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:2;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:18:46
3	database	queue	{"uuid":"06ef2b19-2542-4e29-a777-f6d4e7eb61fb","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:2;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:19:22
4	database	queue	{"uuid":"3b44ebfd-6c30-49a7-8234-22c278108bc2","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:3;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:19:37
5	database	queue	{"uuid":"4707a61b-bd06-4fc1-89ff-f5b6f5dd9763","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:3;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:19:55
6	database	queue	{"uuid":"39d11964-69ed-4f0f-9ce5-9ace9d5a701b","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:3;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:20:08
7	database	queue	{"uuid":"9a109fa3-7a5d-49a9-97c9-005d87b6f09d","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:4;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:20:23
8	database	queue	{"uuid":"5d2159a1-dc46-4353-a9af-11cdc4e2137b","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:5;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:21:00
9	database	queue	{"uuid":"8cd528b3-193f-4d92-a655-6f606ddef175","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:5;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:21:18
10	database	queue	{"uuid":"a78c42b9-9e80-4648-9017-919bc7f95ba7","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:6;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:21:32
11	database	queue	{"uuid":"d7bfce00-2694-4942-a488-9ae2d5d988fc","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:6;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:21:42
12	database	queue	{"uuid":"70926e4b-3a4e-4d20-a772-590ab2c77b6c","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:7;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:21:56
13	database	queue	{"uuid":"bafd9730-2c17-4aa9-af7d-b74978d694f7","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:7;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:22:06
14	database	queue	{"uuid":"6cc8c9ad-e1c6-4f21-bcd8-f02565c08a7e","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:8;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:22:21
15	database	queue	{"uuid":"a6f20eff-2d0f-44e1-9230-06e14b6e8792","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:8;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:22:30
16	database	queue	{"uuid":"ef036387-492c-44c2-8b04-0fa8c02833c2","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:9;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:22:45
17	database	queue	{"uuid":"f09ee0af-7d61-4a22-a21a-b9e1ac74fb7a","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:9;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:22:55
18	database	queue	{"uuid":"190ea435-b1f6-4ce0-96c0-f0705df81e55","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:10;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:23:09
19	database	queue	{"uuid":"801a98c5-960d-4ba4-9337-703ea7184724","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:10;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:23:19
20	database	queue	{"uuid":"739ecc41-31ca-4481-b03a-d4dbe0d04db3","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:11;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:23:33
21	database	queue	{"uuid":"f10591af-f532-4140-a0d1-44a397403879","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:11;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:23:44
22	database	queue	{"uuid":"70dee4be-8645-4004-8d0d-cf2fb1ff8ab1","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:12;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:23:58
23	database	queue	{"uuid":"500acf3b-270e-4e8d-b918-b0c0c5aa0657","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:12;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:24:08
24	database	queue	{"uuid":"b944b4f5-7e22-441e-b7b6-e53e08d8b448","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:13;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:24:22
25	database	queue	{"uuid":"be68ecdd-7b09-455b-a1ff-a092df688f73","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:13;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:24:32
26	database	queue	{"uuid":"53bfb0f9-1f84-4791-8a46-e59fc33d6949","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:14;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:24:46
27	database	queue	{"uuid":"99b64aaf-5e4d-433b-9af6-4654e3847508","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:14;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:24:56
28	database	queue	{"uuid":"819e3ef5-e9b7-4780-8d76-c9611aac359b","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:15;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:25:11
29	database	queue	{"uuid":"04bdb94f-3205-4bd4-b429-3ff053082a28","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:15;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:25:20
30	database	queue	{"uuid":"d3cf2a39-cdee-4de9-9d51-d92c01f3ec56","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:16;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:25:35
31	database	queue	{"uuid":"355e7bd7-9a09-4f8c-bf98-6ef8a628e0a1","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:16;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:25:45
32	database	queue	{"uuid":"d359ca34-fd4a-4c54-95ba-446dcf1fc475","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:17;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:25:59
33	database	queue	{"uuid":"81b9e087-9f82-4a5c-b9fd-473f5299ab9e","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:17;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:26:09
34	database	queue	{"uuid":"25425eba-9f31-415c-aefb-a57b59e39979","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:18;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php","line":57,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:26:23
35	database	queue	{"uuid":"73c4867c-b8eb-4455-adb1-7a20bfa46190","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:18;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	{"message":"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned","code":0,"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":363,"trace":[{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php","line":211,"function":"getApiType","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php","line":40,"function":"isMemberApiEnabled","class":"PKP\\\\orcid\\\\OrcidManager","type":"::"},{"file":"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php","line":82,"function":"execute","class":"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php","line":66,"function":"submissionMetadataChanged","class":"APP\\\\search\\\\PreprintSearchIndex","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36,"function":"handle","class":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43,"function":"Illuminate\\\\Container\\\\{closure}","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95,"function":"unwrapIfClosure","class":"Illuminate\\\\Container\\\\Util","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35,"function":"callBoundMethod","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":694,"function":"call","class":"Illuminate\\\\Container\\\\BoundMethod","type":"::"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":126,"function":"call","class":"Illuminate\\\\Container\\\\Container","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Bus\\\\{closure}","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php","line":130,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":124,"function":"dispatchNow","class":"Illuminate\\\\Bus\\\\Dispatcher","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":144,"function":"Illuminate\\\\Queue\\\\{closure}","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php","line":119,"function":"Illuminate\\\\Pipeline\\\\{closure}","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":123,"function":"then","class":"Illuminate\\\\Pipeline\\\\Pipeline","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php","line":71,"function":"dispatchThroughMiddleware","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php","line":102,"function":"call","class":"Illuminate\\\\Queue\\\\CallQueuedHandler","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":441,"function":"fire","class":"Illuminate\\\\Queue\\\\Jobs\\\\Job","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":391,"function":"process","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php","line":335,"function":"runJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":101,"function":"runNextJob","class":"Illuminate\\\\Queue\\\\Worker","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php","line":220,"function":"runJobInQueue","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"},{"file":"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php","line":139,"function":"processJobs","class":"PKP\\\\queue\\\\JobRunner","type":"->"},{"function":"PKP\\\\core\\\\{closure}","class":"PKP\\\\core\\\\PKPQueueProvider","type":"->"}]}	2025-01-16 05:26:33
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.files (file_id, path, mimetype) FROM stdin;
1	contexts/1/submissions/1/67889687104d0.pdf	application/pdf
2	contexts/1/submissions/2/678896a985531.pdf	application/pdf
3	contexts/1/submissions/3/678896dd0ffab.pdf	application/pdf
4	contexts/1/submissions/4/6788970a50591.pdf	application/pdf
5	contexts/1/submissions/5/6788973024add.pdf	application/pdf
6	contexts/1/submissions/6/67889750777d2.pdf	application/pdf
7	contexts/1/submissions/7/678897684df2f.pdf	application/pdf
8	contexts/1/submissions/8/67889780b729d.pdf	application/pdf
9	contexts/1/submissions/9/67889798d1685.pdf	application/pdf
10	contexts/1/submissions/10/678897b132cd9.pdf	application/pdf
11	contexts/1/submissions/11/678897c9725d8.pdf	application/pdf
12	contexts/1/submissions/12/678897e23cf5b.pdf	application/pdf
13	contexts/1/submissions/13/678897fa58106.pdf	application/pdf
14	contexts/1/submissions/14/678898127e3ca.pdf	application/pdf
15	contexts/1/submissions/15/6788982aaecc6.pdf	application/pdf
16	contexts/1/submissions/16/67889842f19d0.pdf	application/pdf
17	contexts/1/submissions/17/6788985b4e849.pdf	application/pdf
18	contexts/1/submissions/18/678898737a0d9.pdf	application/pdf
19	contexts/1/submissions/19/6788988ba10b8.pdf	application/pdf
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
4	$2y$10$rdKxl3jaD447MjTzDE6O/OzF8zCDOIfMAGkm88LEAYaIsC1jL4AS.	userRoleAssignment	\N	1	2025-01-19 05:15:51	{"userOrcid":null,"givenName":{"en":"Daniel","fr_CA":"Daniel"},"familyName":{"en":"Barnes","fr_CA":"Barnes"},"affiliation":{"en":"University of Melbourne","fr_CA":"Australia"},"userCountry":"AU","username":"dbarnes","password":"$2y$10$e5fHZh\\/yNZYSKicYriqPkeNTu.UBIm7XsfyvEX7\\/wgQgZBmJqJqOu","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"dbarnes@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"dbarnes@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	dbarnes@mailinator.com	1	2025-01-16 05:15:51	2025-01-16 05:16:01
2	$2y$10$kaqiiP0SY14PJzec52DzQeI.tsuYjfvC9k7kmFWPUgSvN/5yVB7dy	userRoleAssignment	\N	1	2025-01-19 05:15:30	{"userOrcid":null,"givenName":{"en":"Ramiro","fr_CA":"Ramiro"},"familyName":{"en":"Vaca","fr_CA":"Vaca"},"affiliation":{"en":"Universidad Nacional Aut\\u00f3noma de M\\u00e9xico","fr_CA":"Mexico"},"userCountry":"MX","username":"rvaca","password":"$2y$10$TM2eTq9goyWwL1xh1UxVdOrH1W.M7PMH\\/9hnON5uMVpFcb0LPFYx2","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"rvaca@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":2,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"rvaca@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	rvaca@mailinator.com	1	2025-01-16 05:15:30	2025-01-16 05:15:40
6	$2y$10$D3fIXOTeYkscJInNV4eIPujuiBiRg/594v0HtynF84.MoaUDYvtGO	userRoleAssignment	\N	1	2025-01-19 05:16:13	{"userOrcid":null,"givenName":{"en":"David","fr_CA":"David"},"familyName":{"en":"Buskins","fr_CA":"Buskins"},"affiliation":{"en":"University of Chicago","fr_CA":"United States"},"userCountry":"US","username":"dbuskins","password":"$2y$10$x2aCSPEcsHbpVMAZLMeB.eszngdllyThmRxJFue23ycqvnrDMFJfS","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"dbuskins@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"dbuskins@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	dbuskins@mailinator.com	1	2025-01-16 05:16:12	2025-01-16 05:16:23
8	$2y$10$ZeoS6BtU7KUbTJIpJ4roTO1sSy1WhigNMIB.708FNM8QBo6I0GLUm	userRoleAssignment	\N	1	2025-01-19 05:16:35	{"userOrcid":null,"givenName":{"en":"Stephanie","fr_CA":"Stephanie"},"familyName":{"en":"Berardo","fr_CA":"Berardo"},"affiliation":{"en":"University of Toronto","fr_CA":"Canada"},"userCountry":"CA","username":"sberardo","password":"$2y$10$1IcSqf67ksYYJIiXbITD6.nlPukJaSnU.vvEp34I4FZyR0f9j9otq","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"sberardo@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"sberardo@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	sberardo@mailinator.com	1	2025-01-16 05:16:34	2025-01-16 05:16:46
10	$2y$10$vG7K3b.5W/eIgXxIeFLSB.j5h8.hkG6ScJlbfYD1aT8.yEk2XgdyS	userRoleAssignment	\N	1	2025-01-19 05:16:58	{"userOrcid":null,"givenName":{"en":"Minoti","fr_CA":"Minoti"},"familyName":{"en":"Inoue","fr_CA":"Inoue"},"affiliation":{"en":"Kyoto University","fr_CA":"Japan"},"userCountry":"JP","username":"minoue","password":"$2y$10$0Z599JzgYD4US\\/9QpRH2VOU6o8vy7rTfiFACjvB7l1joZ.1p5m\\/0m","emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":true,"sendEmailAddress":"minoue@mailinator.com","inviteStagePayload":{"userOrcid":null,"givenName":null,"familyName":null,"affiliation":null,"userCountry":null,"username":null,"password":null,"emailSubject":null,"emailBody":null,"userGroupsToAdd":[{"userGroupId":3,"dateStart":"2025-01-16","dateEnd":null,"masthead":true}],"passwordHashed":null,"sendEmailAddress":"minoue@mailinator.com","inviteStagePayload":null,"shouldUseInviteData":null},"shouldUseInviteData":null}	ACCEPTED	minoue@mailinator.com	1	2025-01-16 05:16:58	2025-01-16 05:17:10
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
115	queue	{"uuid":"3d115357-57f9-4f87-8677-01e144918076","displayName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":60,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob","command":"O:36:\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:19;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	2	\N	1737005208	1737005203
116	queue	{"uuid":"ffe3e059-d104-442a-bae7-c4d58ea00645","displayName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":3,"maxExceptions":3,"failOnTimeout":true,"backoff":"5","timeout":180,"retryUntil":null,"data":{"commandName":"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob","command":"O:46:\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\":3:{s:15:\\"\\u0000*\\u0000submissionId\\";i:19;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:5:\\"queue\\";}"}}	1	\N	1737005208	1737005203
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
75	1	\N	2	16777245	2025-01-16 05:23:25	\N	1048585	11
76	1	\N	3	16777222	2025-01-16 05:23:49	\N	1048585	12
77	1	\N	3	16777223	2025-01-16 05:23:49	\N	1048585	12
78	1	4	2	16777217	2025-01-16 05:23:49	\N	1048585	12
5	1	\N	3	16777222	2025-01-16 05:18:02	\N	1048585	1
6	1	\N	3	16777223	2025-01-16 05:18:02	\N	1048585	1
7	1	4	2	16777217	2025-01-16 05:18:02	\N	1048585	1
8	1	5	2	16777217	2025-01-16 05:18:02	\N	1048585	1
9	1	\N	2	16777243	2025-01-16 05:18:02	\N	1048585	1
10	1	\N	2	16777245	2025-01-16 05:18:02	\N	1048585	1
11	1	\N	3	16777222	2025-01-16 05:19:00	\N	1048585	2
12	1	\N	3	16777223	2025-01-16 05:19:00	\N	1048585	2
13	1	4	2	16777217	2025-01-16 05:19:00	\N	1048585	2
14	1	5	2	16777217	2025-01-16 05:19:00	\N	1048585	2
15	1	\N	2	16777243	2025-01-16 05:19:00	\N	1048585	2
16	1	\N	2	16777245	2025-01-16 05:19:00	\N	1048585	2
17	1	\N	3	16777222	2025-01-16 05:19:28	\N	1048585	3
18	1	\N	3	16777223	2025-01-16 05:19:28	\N	1048585	3
19	1	4	2	16777217	2025-01-16 05:19:28	\N	1048585	3
20	1	5	2	16777217	2025-01-16 05:19:28	\N	1048585	3
21	1	\N	2	16777243	2025-01-16 05:19:28	\N	1048585	3
22	1	\N	2	16777245	2025-01-16 05:19:28	\N	1048585	3
23	1	4	3	16777259	2025-01-16 05:19:45	\N	1048585	3
24	1	5	3	16777259	2025-01-16 05:19:45	\N	1048585	3
25	1	9	3	16777259	2025-01-16 05:19:45	\N	1048585	3
26	1	\N	3	16777222	2025-01-16 05:20:13	\N	1048585	4
27	1	\N	3	16777223	2025-01-16 05:20:13	\N	1048585	4
28	1	4	2	16777217	2025-01-16 05:20:13	\N	1048585	4
29	1	5	2	16777217	2025-01-16 05:20:13	\N	1048585	4
30	1	\N	2	16777243	2025-01-16 05:20:13	\N	1048585	4
31	1	\N	2	16777245	2025-01-16 05:20:13	\N	1048585	4
33	1	10	2	16777234	2025-01-16 05:20:29	\N	1048585	4
34	1	\N	3	16777222	2025-01-16 05:20:51	\N	1048585	5
35	1	\N	3	16777223	2025-01-16 05:20:51	\N	1048585	5
36	1	4	2	16777217	2025-01-16 05:20:51	\N	1048585	5
37	1	5	2	16777217	2025-01-16 05:20:51	\N	1048585	5
38	1	\N	2	16777243	2025-01-16 05:20:51	\N	1048585	5
39	1	\N	2	16777245	2025-01-16 05:20:51	\N	1048585	5
40	1	\N	3	16777222	2025-01-16 05:21:23	\N	1048585	6
41	1	\N	3	16777223	2025-01-16 05:21:23	\N	1048585	6
42	1	4	2	16777217	2025-01-16 05:21:23	\N	1048585	6
43	1	5	2	16777217	2025-01-16 05:21:23	\N	1048585	6
44	1	\N	2	16777243	2025-01-16 05:21:23	\N	1048585	6
45	1	\N	2	16777245	2025-01-16 05:21:23	\N	1048585	6
46	1	\N	3	16777222	2025-01-16 05:21:47	\N	1048585	7
47	1	\N	3	16777223	2025-01-16 05:21:47	\N	1048585	7
48	1	4	2	16777217	2025-01-16 05:21:47	\N	1048585	7
49	1	5	2	16777217	2025-01-16 05:21:47	\N	1048585	7
50	1	\N	2	16777243	2025-01-16 05:21:47	\N	1048585	7
51	1	\N	2	16777245	2025-01-16 05:21:48	\N	1048585	7
52	1	\N	3	16777222	2025-01-16 05:22:11	\N	1048585	8
53	1	\N	3	16777223	2025-01-16 05:22:11	\N	1048585	8
54	1	4	2	16777217	2025-01-16 05:22:11	\N	1048585	8
55	1	5	2	16777217	2025-01-16 05:22:11	\N	1048585	8
56	1	\N	2	16777243	2025-01-16 05:22:11	\N	1048585	8
57	1	\N	2	16777245	2025-01-16 05:22:11	\N	1048585	8
58	1	\N	3	16777222	2025-01-16 05:22:35	\N	1048585	9
59	1	\N	3	16777223	2025-01-16 05:22:35	\N	1048585	9
60	1	4	2	16777217	2025-01-16 05:22:35	\N	1048585	9
61	1	5	2	16777217	2025-01-16 05:22:35	\N	1048585	9
62	1	\N	2	16777243	2025-01-16 05:22:36	\N	1048585	9
63	1	\N	2	16777245	2025-01-16 05:22:36	\N	1048585	9
64	1	\N	3	16777222	2025-01-16 05:23:00	\N	1048585	10
65	1	\N	3	16777223	2025-01-16 05:23:00	\N	1048585	10
66	1	4	2	16777217	2025-01-16 05:23:00	\N	1048585	10
67	1	5	2	16777217	2025-01-16 05:23:00	\N	1048585	10
68	1	\N	2	16777243	2025-01-16 05:23:00	\N	1048585	10
69	1	\N	2	16777245	2025-01-16 05:23:00	\N	1048585	10
70	1	\N	3	16777222	2025-01-16 05:23:24	\N	1048585	11
71	1	\N	3	16777223	2025-01-16 05:23:24	\N	1048585	11
72	1	4	2	16777217	2025-01-16 05:23:24	\N	1048585	11
73	1	5	2	16777217	2025-01-16 05:23:24	\N	1048585	11
74	1	\N	2	16777243	2025-01-16 05:23:25	\N	1048585	11
79	1	5	2	16777217	2025-01-16 05:23:49	\N	1048585	12
80	1	\N	2	16777243	2025-01-16 05:23:49	\N	1048585	12
81	1	\N	2	16777245	2025-01-16 05:23:49	\N	1048585	12
82	1	\N	3	16777222	2025-01-16 05:24:13	\N	1048585	13
83	1	\N	3	16777223	2025-01-16 05:24:13	\N	1048585	13
84	1	4	2	16777217	2025-01-16 05:24:13	\N	1048585	13
85	1	5	2	16777217	2025-01-16 05:24:13	\N	1048585	13
86	1	\N	2	16777243	2025-01-16 05:24:13	\N	1048585	13
87	1	\N	2	16777245	2025-01-16 05:24:13	\N	1048585	13
88	1	\N	3	16777222	2025-01-16 05:24:37	\N	1048585	14
89	1	\N	3	16777223	2025-01-16 05:24:37	\N	1048585	14
90	1	4	2	16777217	2025-01-16 05:24:37	\N	1048585	14
91	1	5	2	16777217	2025-01-16 05:24:37	\N	1048585	14
92	1	\N	2	16777243	2025-01-16 05:24:37	\N	1048585	14
93	1	\N	2	16777245	2025-01-16 05:24:37	\N	1048585	14
94	1	\N	3	16777222	2025-01-16 05:25:01	\N	1048585	15
95	1	\N	3	16777223	2025-01-16 05:25:01	\N	1048585	15
96	1	4	2	16777217	2025-01-16 05:25:01	\N	1048585	15
97	1	5	2	16777217	2025-01-16 05:25:01	\N	1048585	15
98	1	\N	2	16777243	2025-01-16 05:25:01	\N	1048585	15
99	1	\N	2	16777245	2025-01-16 05:25:01	\N	1048585	15
100	1	\N	3	16777222	2025-01-16 05:25:26	\N	1048585	16
101	1	\N	3	16777223	2025-01-16 05:25:26	\N	1048585	16
102	1	4	2	16777217	2025-01-16 05:25:26	\N	1048585	16
103	1	5	2	16777217	2025-01-16 05:25:26	\N	1048585	16
104	1	\N	2	16777243	2025-01-16 05:25:26	\N	1048585	16
105	1	\N	2	16777245	2025-01-16 05:25:26	\N	1048585	16
106	1	\N	3	16777222	2025-01-16 05:25:50	\N	1048585	17
107	1	\N	3	16777223	2025-01-16 05:25:50	\N	1048585	17
108	1	4	2	16777217	2025-01-16 05:25:50	\N	1048585	17
109	1	5	2	16777217	2025-01-16 05:25:50	\N	1048585	17
110	1	\N	2	16777243	2025-01-16 05:25:50	\N	1048585	17
111	1	\N	2	16777245	2025-01-16 05:25:50	\N	1048585	17
112	1	\N	3	16777222	2025-01-16 05:26:14	\N	1048585	18
113	1	\N	3	16777223	2025-01-16 05:26:14	\N	1048585	18
114	1	4	2	16777217	2025-01-16 05:26:14	\N	1048585	18
115	1	5	2	16777217	2025-01-16 05:26:14	\N	1048585	18
116	1	\N	2	16777243	2025-01-16 05:26:14	\N	1048585	18
117	1	\N	2	16777245	2025-01-16 05:26:14	\N	1048585	18
118	1	\N	3	16777222	2025-01-16 05:26:38	\N	1048585	19
119	1	\N	3	16777223	2025-01-16 05:26:38	\N	1048585	19
120	1	4	2	16777217	2025-01-16 05:26:38	\N	1048585	19
121	1	5	2	16777217	2025-01-16 05:26:38	\N	1048585	19
122	1	\N	2	16777243	2025-01-16 05:26:38	\N	1048585	19
123	1	\N	2	16777245	2025-01-16 05:26:38	\N	1048585	19
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
17	0	2025-01-16	2025-01-16 05:25:30	23	1	16	3	\N	1	\N
1	0	\N	2025-01-16 05:17:49	1	1	1	1	\N	1	\N
2	0	2025-01-16	2025-01-16 05:19:08	2	1	2	3	\N	1	\N
18	0	2025-01-16	2025-01-16 05:25:54	24	1	17	3	\N	1	\N
19	0	2025-01-16	2025-01-16 05:26:19	25	1	18	3	\N	1	\N
3	0	2025-01-16	2025-01-16 05:19:42	5	1	3	3	\N	1	\N
4	0	2025-01-16	2025-01-16 05:19:53	7	1	3	3	\N	2	\N
5	0	\N	2025-01-16 05:20:00	9	1	4	1	\N	1	\N
20	0	2025-01-16	2025-01-16 05:26:43	26	1	19	3	\N	1	\N
6	0	2025-01-16	2025-01-16 05:21:04	10	1	5	3	\N	1	\N
7	0	2025-01-16	2025-01-16 05:21:27	11	1	6	3	\N	1	\N
8	0	2025-01-16	2025-01-16 05:21:52	12	1	7	3	\N	1	\N
9	0	2025-01-16	2025-01-16 05:22:16	14	1	8	3	\N	1	\N
10	0	2025-01-16	2025-01-16 05:22:40	15	1	9	3	\N	1	\N
11	0	2025-01-16	2025-01-16 05:23:04	16	1	10	3	\N	1	\N
12	0	2025-01-16	2025-01-16 05:23:29	17	1	11	3	\N	1	\N
13	0	2025-01-16	2025-01-16 05:23:53	19	1	12	3	\N	1	\N
14	0	2025-01-16	2025-01-16 05:24:17	20	1	13	3	\N	1	\N
15	0	2025-01-16	2025-01-16 05:24:42	21	1	14	3	\N	1	\N
16	0	2025-01-16	2025-01-16 05:25:06	22	1	15	3	\N	1	\N
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
vH2NFzl0XmDApShB78mDOmKp6oWsfhtgQ2iRvqLu	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004464	YToyOntzOjY6Il90b2tlbiI7czo0MDoiaERRN1A0cFJLRzZDQkNuUkpNU1gwVlZPdHpGanlrbm55YldmT1lzZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
df6t39aNvrRCT2NebFeg6bxUGVJVWgrfMDqJeydZ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004464	YToyOntzOjY6Il90b2tlbiI7czo0MDoiaUc1Q0FnSjZLanU4VzRPVklpbGs4ZnZQTDExYU0zUEdFcGRXY3hxbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
xPP7m15qjezuEzxwqPH2f6jCiGGL6lTIjd4i1X4N	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004583	YTozOntzOjY6Il90b2tlbiI7czo0MDoidlg2NVFrTERUZVhkMGRpWHE5QU9MblBCT0F6aEp4WVR3dGdaTTkzMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
OfvP7ogoIxuCKhJYeNbdyKkXzNDo2rh8RuTQZEol	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004484	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTTBHaXNheHNvd3A0QXJ5NkRHUkE5N1owOXJJWnN5YlBQQm1LdDk4ZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDB5M3NIV2duT3lqM0FHUG9uZVVaMHVNRU9UWEpkc1Eyc3V4VnVuZFNPS1UwR3FjVk9pUzJTIjt9
o65gqjBmVrSGMpG1ulR6cNdjjxonEKWWa5ESFsdr	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004597	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS1VZV3hiM05KVHNRSjN1aVlzcTBiM2xZaUVwNGdjb0Zuc1ZjR1VESyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
DwBessS2dkP6hXyqaSXaT7UGC6mqclP5bnzlDZw8	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004500	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZGtNV0FlT1c0ZHVYRkxwY3J0RWp2VzNwSEtNZWVWRkxSYzBoWWpRWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJE41eVQuQmVDTjd2dDg4b0FnbXp3MGU4U1RjZUU2VFl4Q1R5VHo3MXE1OFQ5Ykt0UVpxWHYuIjt9
JrjxW6cwDgBAflIhQOih9BgzXUFCQy6iJ3PDetB9	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004606	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnRNNzVuSmIwMEFjdU1lalFTdXBNR1psT2NETjRnZmNQeElBVDhQbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
KkWECO7RfiuxBJLjncXw1BvhK7ouebjMUfJ83RiB	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004507	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRTRmdk55U3lCQ3NDMG1IRFhXV282UUlMNzBpUlFwTTRxQXlPUGpLYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9yTWY3cmlBNy5zQ1VEUmlDZ1luR3U4TkZtbHJ4enc5T25BdC9nVjZuam4uTVFEQUouOWNTIjt9
Rh9TtnI8gF4HpJjn3HWlKHkvyfsWrWuhPWi1oqZx	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004514	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiWnpjT2pmTjBuanRDRnhXWGx2TzNGY1pMak9CQXdmMDY0aEllY3VheSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHRtQTdmemhxS2VOc1FSVUw5eEFlaU9LQzdIMHZXTG53YjMzQlFHNmpURmlzM0EwUzY4TkVlIjt9
0ktqV1IlrEP4MW2erCGUAc03gcA2woiErIbkK4on	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004533	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaXJSVnlMdDdYZjdSY1JQSmtETWhiaFFpOVplcEN5VnZXaWJXa001MiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
NJrBN2hm8qhAf6Tnw0uwrs5h2r5o9UJeZxC7xIcY	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004541	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1pNYlJzR3dBakRySVhaR2FIOElqRDZGNmpQc2dJUzFpQ2lLNzFsMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
r0cask3FTyLrexqouygqH66xzJHHy7H7CFxvDEPC	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004554	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRUQ0bXJGMmVoRmNQZDk4eElsb1VDRndTT3prajluN1JWMm9DcER2QiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
iUqS98hBB9vIKMrRX8tZpEoeRiSImNZlglv1IWVB	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004562	YTozOntzOjY6Il90b2tlbiI7czo0MDoid3ZGWkRud2xJMDRIT3poWk9QRlhidG5GRTh0ZFhjeUNJdjhRYzdXRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
5daamvpvS4cArjlbES6pQ3MfIoDyn3KpkpwihmSW	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004575	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUXZPQ1NWUU80Q2VFQkpTMGlXRERzbnN2dUlneGZyTDk0NUxSNFR2cyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
XFcHtoeyzPt33Hz0zndbFEUgWPcXhmX1y3rqitjb	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004956	YTo1OntzOjY6Il90b2tlbiI7czo0MDoicDJEeWEwclhCRVk4U1JwWXpMM1QyYjFrTnlJUDFQWVVFaWt0eTlUeCI7czo4OiJ1c2VybmFtZSI7czoxMDoiam13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiam13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
B26IcUEre2oYRKP354XBLvycOp7m9pnjBKqOReM3	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004748	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiT1dJNEI1ckw0UVBodnh5THp0akJJS2lTU2hBY0d5RUxBT1BNZDdNSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRlSVpTeUp3OHhDNEp4SHpZUDFkSk9lRU02OGx3TWxTUHNrYTNGeDAySzN1VnVpdUptZW9CSyI7fQ==
PBeIInZYqh0T9kfMCGw9yu0tIa6rWGmqBno8ZmmG	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004851	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNTlPTHhPeHNuQkR4c0ZxRDdxTUVBRFlQeGEyaU9XbjYxZUs5WjdwdyI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
RkodAsJL3jcTyhkC5paSRAhjgyFXStkYwd76lbQC	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004621	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRG00V1E5MktUY09RT0R5cDZaeWNyYUxxaXczdWZQSVpnS2pwQUNXRCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
ogkKxJ8Bzv9P8O9YaYzdcPHytFnTNmdnlyaZhRcX	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004860	YToyOntzOjY6Il90b2tlbiI7czo0MDoiTTR6cTYyd0UxSjcyZmJuNVowNXZkWUJCdHQzRjBadHFBYmpSZWI2SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
exhpTAsl5XX8OoCWZltyxfv0yBTVXPiUSIAWCVcE	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004864	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUWlKTXVXTGNXQk16WXY1a1pBT3JWS2p6bGdEcmYydkY4elhDYWhEYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR2R1VPLjljalN1TjZOS1NGb0hXZ2tPbC93YnYxT0dlUmFFaEhqNy8wWE42dUg4NUFrbER1QyI7fQ==
xWZB53ayNr8AN5DZZdGfY42Z6Nred0bE6nENk3NC	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004888	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZlc1cE9hSWRaVGlZZjlCVDc0MFdvNUpPWG1PcWltMWNxQngxeTNXMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRzTjQxSmhrQXNVNFYxQXE4VnlpZmZPakFRbG1RNmRnNmE3blhxeWRGZ0Noa29jbnFUNlJIQyI7fQ==
vTjd18Fxl7zfjHASXmnc8J1tt0eUrcit3PY8tbEH	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004794	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVWFsN0ZXdDZHMzIxZk50anV4UDhOUURJUEFsaUh3RkYxNGdFdGdUQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQvVjBLRTYubXBNY0t1NkhpRElJamtlQ3JpUUd5SWZmMVNuSTR0ajdLZzFTRGtjbVVtSVlobSI7fQ==
I3Btebs5IisITOQBmvYA9Tkd4Y6sUZ8xgacWJ7TL	10	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004813	YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWGRCckhsSnE3d2R3c0pyaWo5ZERYbDdoV0ZLUEY4MkhjaGQ1NHZ4bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjEwO3M6NjoidXNlcklkIjtpOjEwO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRpUzd5bEQ3VjNRdzZGN1J3eDBaSnguNi9SYS9NSks3eUxBekFhbTRFQVZ0M05nTTRHa1FvdSI7fQ==
Gptpzmt9inTW7vs7gk72ymFZjSsynmlZTVgrwuXE	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004912	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZWlQaENQV0hyQW9ib1NIeVhhSUlkcjB2VkMydmMwQlpEZ2JudEoxcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ1QmdDWU9SaFMucDd3R2p6eElvTUwub01JelZMbnJFZGdPYnhrUGFvSXlxeVc0ZVhzdmRJcSI7fQ==
1YiTZLzmo56A15oc9sR6i1jdPk5ugc9FyVWpLCd0	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004908	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiREsyeHlIS3haRzlQNDc4eXluMGY1blN3Zmg2SnBpVm5pcjJKcmRaVyI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
ORtsEJ0YVlnLItnIDjuaySGDpRirpoiQ7Eyz9kSf	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004932	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNng5cUpjY2E3STdRVVpVYzJ5MGhnMUJabTcySWJrVkhBeVQ2TWh5VCI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
sK8H4536jmEZPgbXNQpjRTLecweCpgzxWrOsg2wj	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004631	YTozOntzOjY6Il90b2tlbiI7czo0MDoidmZMQU9ZT3R1MFc4SklCOUhoRHB1aWlFalpHMXhZS3czSG5zMU5NUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
mgYx6SPh8zDEFApb7CiX3VWXrvJlYySBivZRULW4	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004831	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiOXFOVTJjdHdNcDV4ZEF4cFFvb25NU0Iwa3ZjV0kwUk1vVVJ5UVA1NCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRNSkVaNHMzNmY5eFd6b3ZVOEVhYmUuSVZaaUYyMlVUMkxESDlQUEpMUC5ObFVFOUQvcmxHSyI7fQ==
43I92utGhNMybrNEgvbojApffT139eWOmSem44HA	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004632	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlk3OTNZNkttSVhObGxNTG5EbjBOVVdCZW1taG1GSVZEVkNDSVF3MSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ==
b6OETFf6BGMOXv1cGZCtCgaCsfISfYaLIwDolhtj	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004641	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZGQ3U2N3amhaNWhhYWQ3MFV1SERReUhRRkJpa2l4YW8yUEtUR3VNViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFlMZTd3VzdQb2xLZ0VFTktWdmFTZk95eU9sVVBkcEhGdi4xbXNRTDlWM2NQQkxNYWdVOTdxIjt9
kSNVJvQ70mxSNT6HSr8FCg7NQIFQuEC9zLBqBNMp	8	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004744	YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSElyTGNLb1hpRUM4N3l2aEhwUWZKdjBCN2VLM29OYW5OZnRPaTg4eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJja3dhbnRlcyI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6ODtzOjY6InVzZXJJZCI7aTo4O3M6NToiZW1haWwiO3M6MjM6ImNrd2FudGVzQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGtld2ltempFbUZaZVNGU1BmVjlEbi5NUkdrdWFMbmZ1MXp6NjhzU3hpYWlldG96cFVTUlhDIjt9
CIVNchdLSEaR3NODrIqsHwb3qtAC0vUnOUH05M06	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004773	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVDV4NFd1QTRnNVgzN2JVZWc3akp4NUJYczloTUp6OVgwTDFQT2JFRiI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
6eAzAQpRyEv2jLX3FSy20LuyKGXVheBWmRGRKEFk	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004769	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZDVzQmdIVjY2VjljMXF3bE1lSTZDMklEd1cweU5RaUp5SWlDVUtjaCI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
QdI7t64hgBldwXzLtfHVk7KxjPVmZa8t1ifkaYA2	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004662	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUnVNbXpERWdGRFhTdjRTYTlvMzVCaktlcHB6RWRvNUFWajNwT0NhViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJC5DdnFZaC52N2tSRnhubHhHUk9sanVUcDZrU2tmNVd3d0dKWFRsbVgzTW9DeU1uN3RpNVRtIjt9
CGNbxgjSdjwTiMxO0n4FGJODJ310li1x0LYDQXUq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004855	YTo3OntzOjY6Il90b2tlbiI7czo0MDoic2JrTnM1bHp2eTk1NkNZMzdDTU5LWkl6dkFrbk0yWVNGa3FUcXRXVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRUcTJQN2VMVDRZWUpGZ21xT3pwUUNlYm5hR0RtLlVlM2VtUy43cC53OTVGNEFnVjBLTWo3MiI7fQ==
Cgc38HaiFFigRrNQOSIOQTzSa46X1tUoLIrA0a08	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004860	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSHVwaFBaN1FzWElxY3Zqb0Zqc3hMVTBzeTR4TTJranBTbDBBemZZZyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
ATiwS5r3J54lqMAtOfKuaEYFvuWrGk9fqdXYnIeE	7	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004682	YTo4OntzOjY6Il90b2tlbiI7czo0MDoiR3VKMzJYbVVZRW05bmMyZENiUFJ2aXhMRFlIZFh3U0M4eWNIc0Y4ZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJjY29yaW5vIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTo3O3M6NjoidXNlcklkIjtpOjc7czo1OiJlbWFpbCI7czoyMjoiY2Nvcmlub0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRyVkNFSHguT01XZnVwaDN1UDdVdkouNC9iZ0VmRGNjR1ZtOHdvT3M5c3RsckxGVkIudjhlMiI7fQ==
xiXp7F1M6rf2pEUiapwcvrdHK4Vpoc7MgmHtMyst	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004884	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV3AyUzV6NmswaTBETFpCOGVKajNvQXpPZWNWY0tSZ1VtbldOU3VNZSI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
HdCytrgmvqoiPG0EfmXuL1enaGQpSzWR6EqDRNcA	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005078	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ2ZiaGE2dW94bWVHMVVGMEdOaTBGUzN4NHF0bXdkSGhMQ2c0TnRMaiI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
IOolH6t6R3qFrzjTBdBN64wGS06ZgiytsgXAKPym	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004936	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiR29ycTZtNUNBNjJNQXNESkhFYks4em05ck81WU9YT2Y1V1hKSktEWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRqektsZWMuWGpJZWxjb1ZWWDBIWHlPYlNYZmpQcG9PTnguaHdubmc4SmMwSEoweDlCWG01ZSI7fQ==
Y0akHdp39qxsGFdIipav9lSWiMA9P7lRTwZGhugz	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004960	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQkhLaXJEeWk5T2VodXlLVWN4UU16VEtJZjdXc0ZFYlhEeEt1ZWo1ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR2UmZnUUNCalo2N3NNRXNaZ3RZNmVlNHZEcS5DSDExeGUyUzY3Qk56LjJORUg2MmpreTlzcSI7fQ==
Hm95vhZOaP9YgQcl32hgk3iR6kWRecuETU0LkUxp	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004980	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY1ZLNGh5bWJ5OGZMUkdJS0pLSWZyWlB3dTFNdWQ0WGRrZTdUbzlkdCI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
UEoDApPl5afWvlEutnKWgLJZwUcVAX9zRTnfQaH6	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737004985	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiOGdwTWJZS2xDUUw1dmJpWlRVTGRRUldOd3F2NklDSHQwWGttUGd4OSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRqSG8uaUJWVFlmVzdiRzhoOGJSSUkuUWJXZUE1dDRwLjlIa001NDgvaXROTC9JSXZ3TUgxMiI7fQ==
hZdJvw3ONgR4F5rIlyCmUopvxETBljLVmB3FhBRR	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005005	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ3VLSG5yVFlXZldiWWhLZURxMkxxVnlnZXpHVEhMR2IyQlpXSWc3RCI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
JNxhmEP6ripEmMt8Vkq3BXgzOveZKfZSyHPddvmc	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005009	YTo3OntzOjY6Il90b2tlbiI7czo0MDoid0RnNXhqZGRGajRvNEc2WW5lOG9WMUZ3dmp2MG9hZEtNQkIyblgzRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRkeFVQcVZwcUQwbHN1bUdCTnMycFp1U3RycWdTZXdsc1NCeS9pTmNVQmxZSkZDNExXQXZlSyI7fQ==
IfPYxVF0PX4O0oo9zV8u1gLIt969uOuY2F2Aqp1y	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005029	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMzBzeVZTRURLRDVmdGtjTENyUnRtdEpCZVhYYUxka2dPcUR3eGhvTyI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
u0dTNkRq6v2GbqxOoFUxdQLoJ0mnZ2ngtp6BXXLn	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005034	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTVNVckdsWFljaVVKRTgwVmZvOGg0TFdPbW1DcWRtdHdWanh6WTk3ZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRkcWduM2ZBUXZGeXNuREVyeklaM3p1VVhWc1B2dXVPbS4uQVNTTXFxNVpVUjZHLzBzSlM3eSI7fQ==
JrUhThgLFdsrAhr5wry9hK5BMrEVEkEcqnUyV62H	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005053	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWDkzak9aRXA5WDBYcTVWU093UEk0eXJVeFFnSVN2SjFCcndEQjUyQSI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
7GlqitT7gG3CWG5NOBoD9AwJH3g8nC4LyQQbR6lZ	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005058	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRm8xNDU3T0NadkNaQ29mTkRadE5COEt5ZEFoTm5hTzVZNmxLa0FHRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCROdXJzbkRONFphRTVNVEhnblBtZWtldjNSSHRZSVRoa3YzdFc3anJnRDhpREtkS21rZHBoSyI7fQ==
ViPM0Wj7cIgDnSugVIUmk4RLm5WW1JKB6LpJDikq	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005082	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiOVdVVFRBejRJZXI5dVFJNUNPNFFGajd6TGM4cFM2TVlDOEpLUUY2QSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvNHh2SlFZOVU3WU5mYWovSUxGUUMudmhPSk9RaUtXSE13ZmZtMnB1VThyeTdOVEk0WW03MiI7fQ==
qzGBhZWWRoAefizIeIrkXUr0CSzVglvV37OHValm	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005203	YTo3OntzOjY6Il90b2tlbiI7czo0MDoialREbW9lRjRUYUtUNllQRFBHcHhrV2doemdzSjhybWp4OTIyR0lDMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRGZjR6NEVPL0xCQVhLd0MyMGpvQUJ1ZXZiVnZodXNGaFNqeUFTL0JxcmFXdWM2UkZ4d2FPQyI7fQ==
mQ6O0CKzVxsfAUObRhvXcxhIE4sxqReATiPb8u6d	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005199	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMUs4RmZ5OE93bVozN0RWU1NsWWx4WHZWWVBRdUFlREJZdlhiRFdjdiI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
hf9Z4drcnpIyY8QfuLXmlDkyWJ1aoJFCfbT7WcuW	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005102	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiekNsV1BLempEOE9lb05rMzBvS0dnMHBScFhoMUI1QWtEVWJwa2p4cSI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
Jc8EKcBKKx1UFbZGpzNj7y6TJ8WUSU3FWJe5Gu3R	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005106	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZTRteWx1Tml4QVptdm9sN2ZPRHdQbTUwTEJXbnc1WUE3Yllzb0V0NyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRiay5KTEtVR0JoSXdZSDk4OGdxUFZlR0dHTkhhWGM3ZkJYbnNNNGc1aFYySUxtV0kuMS9FLiI7fQ==
mq61reDBg2TOtJAeaM5hE8aKjl2Yc4E24vNBudBe	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005126	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRmdPSDNybFlIQVhxNkkxZXo0RlVPTjZhdlV1V2x3eHFZNWtOdXlvdiI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==
Ni7tJ3S0rFMjLJ3UcujFqmbjBMl3kEz5Qosu1mtB	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005155	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiajdmQzJYd2RiNTFkWjNyT01kU1lzVG40SHpXVDVkZHk4THM2Nnp5RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRVMFpkUzBVaHNFSUJVUzVlYWh4RTJlT3p6QTNhNXpIN05HV1FDbXdGdFVRSjRCamZqM1E5cSI7fQ==
fOWchTcFD1XztAfqpXXi9itIt8dwWOkqnLwQqROY	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005130	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiY3dHVzBtZVBGNGlFcEVvTlEyQ3RjZWdKeGVGT0F3N3RsNmxucTRUeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRNZkxmaHVuZjdhYUprVG9sZk42R1llNE13UW5HUlFZWENMcVQ3QXg2MUhhT0FHNnlWWGNCTyI7fQ==
ClW0H1ZpWWXSmX4LowoQhcgyAvQvi0ToBCyzkH8M	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005150	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaFVhVVNlQjRRd1BkTTMxeTFxNjB3TjdpamZwTlRvOUMzcUh1U0JWNiI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=
d0Ye3it0NRPvX1UlVBblVcM43omotvioP8ktPSZG	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005175	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMXpJSGJENU9YbkFDMXJYbExLeEJDSGNmT1NoRmprUTN1OUJDNmN0TSI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19
mzAK1xDue7OX9lYMAir4usYJZ3w8cXd7c7FBcgkH	3	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36	1737005179	YTo3OntzOjY6Il90b2tlbiI7czo0MDoicHBob2JJaEN2aUdJZVhDbkU5NjJQems0STd4S2lSN0JMd2d0U2ZaNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRsUGR5Ni9vL2d5b1FRZi5iWW9hQjBPNXZJcXlzVm5SUkY3cEw5dS9IanJTclpHR2F6MkRucSI7fQ==
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
15	uniqueSiteId		A55B2129-D104-4E94-A4B4-82CF5D5E73F0
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only, can_change_metadata) FROM stdin;
2	1	3	4	2025-01-16 05:18:02	0	1
3	1	3	5	2025-01-16 05:18:02	0	1
1	1	4	7	2025-01-16 05:17:48	0	1
5	2	3	4	2025-01-16 05:19:00	0	1
6	2	3	5	2025-01-16 05:19:00	0	1
4	2	4	8	2025-01-16 05:18:10	0	1
8	3	3	4	2025-01-16 05:19:28	0	1
9	3	3	5	2025-01-16 05:19:28	0	1
7	3	4	9	2025-01-16 05:19:14	0	1
11	4	3	4	2025-01-16 05:20:13	0	1
12	4	3	5	2025-01-16 05:20:13	0	1
10	4	4	10	2025-01-16 05:20:00	0	1
14	5	3	4	2025-01-16 05:20:51	0	1
15	5	3	5	2025-01-16 05:20:51	0	1
13	5	4	11	2025-01-16 05:20:38	0	1
17	6	3	4	2025-01-16 05:21:23	0	1
18	6	3	5	2025-01-16 05:21:23	0	1
16	6	4	12	2025-01-16 05:21:10	0	1
20	7	3	4	2025-01-16 05:21:47	0	1
21	7	3	5	2025-01-16 05:21:47	0	1
19	7	4	13	2025-01-16 05:21:34	0	1
23	8	3	4	2025-01-16 05:22:11	0	1
24	8	3	5	2025-01-16 05:22:11	0	1
22	8	4	14	2025-01-16 05:21:58	0	1
26	9	3	4	2025-01-16 05:22:35	0	1
27	9	3	5	2025-01-16 05:22:35	0	1
25	9	4	15	2025-01-16 05:22:22	0	1
29	10	3	4	2025-01-16 05:23:00	0	1
30	10	3	5	2025-01-16 05:23:00	0	1
28	10	4	16	2025-01-16 05:22:46	0	1
32	11	3	4	2025-01-16 05:23:24	0	1
33	11	3	5	2025-01-16 05:23:24	0	1
31	11	4	17	2025-01-16 05:23:11	0	1
35	12	3	4	2025-01-16 05:23:49	0	1
36	12	3	5	2025-01-16 05:23:49	0	1
34	12	4	18	2025-01-16 05:23:36	0	1
38	13	3	4	2025-01-16 05:24:13	0	1
39	13	3	5	2025-01-16 05:24:13	0	1
37	13	4	19	2025-01-16 05:24:00	0	1
41	14	3	4	2025-01-16 05:24:37	0	1
42	14	3	5	2025-01-16 05:24:37	0	1
40	14	4	20	2025-01-16 05:24:24	0	1
44	15	3	4	2025-01-16 05:25:01	0	1
45	15	3	5	2025-01-16 05:25:01	0	1
43	15	4	21	2025-01-16 05:24:48	0	1
47	16	3	4	2025-01-16 05:25:26	0	1
48	16	3	5	2025-01-16 05:25:26	0	1
46	16	4	22	2025-01-16 05:25:12	0	1
50	17	3	4	2025-01-16 05:25:50	0	1
51	17	3	5	2025-01-16 05:25:50	0	1
49	17	4	23	2025-01-16 05:25:37	0	1
53	18	3	4	2025-01-16 05:26:14	0	1
54	18	3	5	2025-01-16 05:26:14	0	1
52	18	4	24	2025-01-16 05:26:01	0	1
56	19	3	4	2025-01-16 05:26:38	0	1
57	19	3	5	2025-01-16 05:26:38	0	1
55	19	4	25	2025-01-16 05:26:25	0	1
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
1	1	1	\N	1	10	\N	\N	\N	2025-01-16 05:17:59	2025-01-16 05:18:01	7	521	1
2	2	2	\N	1	10	\N	\N	\N	2025-01-16 05:18:33	2025-01-16 05:18:35	8	521	2
3	3	3	\N	1	10	\N	\N	\N	2025-01-16 05:19:25	2025-01-16 05:19:27	9	521	3
4	4	4	\N	1	10	\N	\N	\N	2025-01-16 05:20:10	2025-01-16 05:20:12	10	521	5
5	5	5	\N	1	10	\N	\N	\N	2025-01-16 05:20:48	2025-01-16 05:20:50	11	521	6
6	6	6	\N	1	10	\N	\N	\N	2025-01-16 05:21:20	2025-01-16 05:21:22	12	521	7
7	7	7	\N	1	10	\N	\N	\N	2025-01-16 05:21:44	2025-01-16 05:21:46	13	521	8
8	8	8	\N	1	10	\N	\N	\N	2025-01-16 05:22:08	2025-01-16 05:22:11	14	521	9
9	9	9	\N	1	10	\N	\N	\N	2025-01-16 05:22:32	2025-01-16 05:22:35	15	521	10
10	10	10	\N	1	10	\N	\N	\N	2025-01-16 05:22:57	2025-01-16 05:22:59	16	521	11
11	11	11	\N	1	10	\N	\N	\N	2025-01-16 05:23:21	2025-01-16 05:23:23	17	521	12
12	12	12	\N	1	10	\N	\N	\N	2025-01-16 05:23:46	2025-01-16 05:23:48	18	521	13
13	13	13	\N	1	10	\N	\N	\N	2025-01-16 05:24:10	2025-01-16 05:24:12	19	521	14
14	14	14	\N	1	10	\N	\N	\N	2025-01-16 05:24:34	2025-01-16 05:24:36	20	521	15
15	15	15	\N	1	10	\N	\N	\N	2025-01-16 05:24:58	2025-01-16 05:25:01	21	521	16
16	16	16	\N	1	10	\N	\N	\N	2025-01-16 05:25:22	2025-01-16 05:25:25	22	521	17
17	17	17	\N	1	10	\N	\N	\N	2025-01-16 05:25:47	2025-01-16 05:25:49	23	521	18
18	18	18	\N	1	10	\N	\N	\N	2025-01-16 05:26:11	2025-01-16 05:26:13	24	521	19
19	19	19	\N	1	10	\N	\N	\N	2025-01-16 05:26:35	2025-01-16 05:26:37	25	521	20
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
868	9	101	0
869	9	102	1
870	9	2	2
871	9	100	3
872	9	161	4
873	9	162	5
874	10	109	0
875	10	108	1
876	10	105	2
877	10	106	3
878	10	107	4
879	10	110	5
880	10	104	6
881	10	103	7
882	11	111	0
883	11	112	1
884	11	113	2
885	11	114	3
886	11	115	4
887	11	116	5
888	11	117	6
889	11	118	7
890	11	119	8
891	11	84	9
892	11	120	10
893	11	121	11
894	11	122	12
895	11	123	13
896	11	108	14
897	11	105	15
898	11	124	16
899	11	125	17
900	11	126	18
901	11	127	19
902	11	128	20
903	11	129	21
904	11	130	22
905	11	131	23
906	11	132	24
907	11	133	25
908	11	134	26
909	11	135	27
910	11	136	28
911	11	137	29
912	11	136	30
913	11	138	31
914	11	139	32
915	11	136	33
916	11	140	34
917	11	141	35
918	11	142	36
919	11	143	37
920	11	132	38
921	11	144	39
922	11	136	40
923	11	137	41
924	11	145	42
925	11	104	43
926	11	103	44
927	11	141	45
928	11	142	46
929	11	146	47
930	11	115	48
931	11	147	49
932	11	146	50
933	11	148	51
934	11	149	52
935	11	150	53
936	11	151	54
937	11	152	55
938	11	153	56
939	11	129	57
940	11	154	58
941	11	77	59
942	11	105	60
943	11	155	61
944	11	151	62
945	11	156	63
946	11	120	64
947	11	157	65
948	11	158	66
949	11	159	67
950	11	160	68
951	11	123	69
952	11	108	70
953	11	105	71
954	13	115	0
955	13	114	1
2126	33	236	0
2127	33	237	1
2128	33	235	2
2129	33	2	3
2130	34	238	0
2131	34	240	1
2132	34	239	2
2133	34	241	3
2134	35	243	0
2135	35	242	1
2136	35	253	2
2137	35	238	3
2138	35	240	4
2139	35	239	5
2140	35	241	6
2141	35	255	7
2142	35	254	8
2143	35	238	9
2144	35	248	10
2145	35	247	11
2146	35	239	12
2147	35	241	13
2148	35	251	14
2149	35	250	15
2150	35	252	16
2151	35	249	17
2152	35	244	18
2153	35	246	19
2154	35	245	20
3493	73	390	0
3494	73	392	1
3495	73	2	2
3496	73	391	3
3497	74	395	0
3498	74	393	1
3499	74	394	2
3500	74	396	3
10259	147	560	12
10260	147	950	13
10261	147	939	14
10262	147	131	15
10263	147	951	16
10264	147	938	17
10265	147	928	18
10266	147	926	19
10267	147	940	20
10268	147	946	21
10269	147	944	22
10270	147	963	23
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
10271	147	930	24
10272	147	936	25
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
2506	49	257	0
2507	49	258	1
2508	49	2	2
2509	49	256	3
2510	50	267	0
2511	50	261	1
2512	50	263	2
2513	50	185	3
2514	50	264	4
2515	50	265	5
2516	50	262	6
2517	50	259	7
2518	50	266	8
2519	50	260	9
2520	51	296	0
2521	51	262	1
2522	51	278	2
2523	51	280	3
2524	51	276	4
2525	51	282	5
2526	51	263	6
2527	51	270	7
2528	51	298	8
2529	51	281	9
2530	51	289	10
2531	51	291	11
2532	51	264	12
2533	51	294	13
2534	51	262	14
2535	51	295	15
2536	51	267	16
2537	51	261	17
2538	51	263	18
2539	51	185	19
2540	51	283	20
2541	51	264	21
2542	51	271	22
2543	51	263	23
2544	51	284	24
2545	51	274	25
2546	51	270	26
2547	51	273	27
2548	51	288	28
2549	51	261	29
2550	51	272	30
2551	51	279	31
2552	51	298	32
2553	51	286	33
2554	51	156	34
2555	51	262	35
2556	51	269	36
2557	51	290	37
2558	51	56	38
2559	51	261	39
2560	51	270	40
2561	51	287	41
2562	51	185	42
2563	51	263	43
2564	51	283	44
2565	51	264	45
2566	51	277	46
2567	51	275	47
2568	51	297	48
2569	51	293	49
2570	51	285	50
2571	51	270	51
2572	51	292	52
2573	51	268	53
2574	51	273	54
2575	51	288	55
10273	147	943	26
10274	147	932	27
10275	147	945	28
10276	147	923	29
10277	147	928	30
10278	147	926	31
10279	147	934	32
10280	147	952	33
10281	147	929	34
10282	147	958	35
10283	147	131	36
10284	147	945	37
10285	147	560	38
10286	147	950	39
10287	147	939	40
10288	147	933	41
10289	147	948	42
10290	147	941	43
10291	147	959	44
10292	147	937	45
10293	147	18	46
10294	147	945	47
10295	147	931	48
10296	147	964	49
10297	147	939	50
10298	147	50	51
10299	147	962	52
10300	147	39	53
10301	147	945	54
10302	147	923	55
10303	147	920	56
10304	147	942	57
10602	153	965	0
10603	153	966	1
10604	153	2	2
10605	153	100	3
10606	154	118	0
10607	154	969	1
10608	154	209	2
10609	154	970	3
10610	154	967	4
10611	154	968	5
10612	155	990	0
10613	155	516	1
10614	155	977	2
10615	155	130	3
10616	155	973	4
10617	155	975	5
10618	155	516	6
10619	155	980	7
10620	155	971	8
10621	155	977	9
10622	155	986	10
10623	155	979	11
10624	155	981	12
10625	155	989	13
10626	155	988	14
10627	155	987	15
10628	155	418	16
10629	155	985	17
10630	155	895	18
10631	155	983	19
10632	155	976	20
10633	155	978	21
10634	155	322	22
10635	155	809	23
10636	155	986	24
10637	155	974	25
10638	155	987	26
10639	155	982	27
10640	155	894	28
10641	155	984	29
10642	155	735	30
10643	155	977	31
10644	155	972	32
10645	155	988	33
10646	155	987	34
10647	155	418	35
10648	155	51	36
10649	155	93	37
10650	157	118	0
10651	157	969	1
10652	157	209	2
10653	157	970	3
10654	157	991	4
2996	57	299	0
2997	57	300	1
2998	57	2	2
2999	57	302	3
3000	57	301	4
3001	58	303	0
3002	58	304	1
3003	58	270	2
3004	58	223	3
3005	59	226	0
3006	59	213	1
3007	59	175	2
3008	59	338	3
3009	59	335	4
3010	59	305	5
3011	59	194	6
3012	59	340	7
3013	59	328	8
3014	59	321	9
3015	59	345	10
3016	59	345	11
3017	59	342	12
3018	59	324	13
3019	59	312	14
3020	59	225	15
3021	59	317	16
3022	59	327	17
3023	59	344	18
3024	59	304	19
3025	59	270	20
3026	59	281	21
3027	59	310	22
3028	59	315	23
3029	59	184	24
3030	59	339	25
3031	59	155	26
3032	59	151	27
3033	59	313	28
3034	59	332	29
3035	59	323	30
3036	59	158	31
3037	59	334	32
3038	59	331	33
3039	59	333	34
3040	59	330	35
3041	59	306	36
3042	59	304	37
3043	59	215	38
3044	59	287	39
3045	59	155	40
3046	59	311	41
3047	59	337	42
10305	147	50	58
10306	147	919	59
10307	147	560	60
10308	147	957	61
10309	147	149	62
10310	147	949	63
10311	147	921	64
10312	147	596	65
10313	147	93	66
10314	147	927	67
10315	147	929	68
10316	147	956	69
10317	147	935	70
10318	147	921	71
10319	147	947	72
10320	147	929	73
10321	147	50	74
10322	147	962	75
1956	25	164	0
1957	25	163	1
1958	25	2	2
1959	25	165	3
1960	25	232	4
1961	25	233	5
1962	25	2	6
1963	25	234	7
1964	26	169	0
1965	26	168	1
1966	26	167	2
1967	26	172	3
1968	26	170	4
1969	26	173	5
1970	26	166	6
1971	26	171	7
1972	27	193	0
1973	27	222	1
1974	27	223	2
1975	27	226	3
1976	27	183	4
1977	27	175	5
1978	27	221	6
1979	27	120	7
1980	27	181	8
1981	27	197	9
1982	27	222	10
1983	27	194	11
1984	27	203	12
1985	27	200	13
1986	27	174	14
1987	27	209	15
1988	27	188	16
1989	27	191	17
1990	27	165	18
1991	27	178	19
1992	27	187	20
1993	27	214	21
1994	27	204	22
1995	27	190	23
1996	27	227	24
1997	27	210	25
1998	27	199	26
1999	27	137	27
2000	27	222	28
2001	27	204	29
2002	27	177	30
2003	27	195	31
2004	27	217	32
2005	27	180	33
2006	27	203	34
2007	27	211	35
2008	27	228	36
2009	27	222	37
2010	27	165	38
2011	27	215	39
2012	27	170	40
2013	27	185	41
2014	27	196	42
2015	27	204	43
2016	27	184	44
2017	27	189	45
2018	27	186	46
2019	27	198	47
2020	27	207	48
2021	27	224	49
2022	27	206	50
2023	27	216	51
2024	27	219	52
2025	27	170	53
2026	27	169	54
2027	27	194	55
2028	27	229	56
2029	27	213	57
2030	27	225	58
2031	27	179	59
2032	27	212	60
2033	27	201	61
2034	27	114	62
2035	27	202	63
2036	27	218	64
2037	27	184	65
2038	27	189	66
2039	27	191	67
2040	27	165	68
2041	27	176	69
2042	27	182	70
2043	27	230	71
2044	27	169	72
2045	27	194	73
2046	27	184	74
2047	27	189	75
2048	27	220	76
2049	27	205	77
2050	27	208	78
2051	27	170	79
2052	27	140	80
2053	27	224	81
2054	27	192	82
2055	27	192	83
2056	27	170	84
2057	29	231	0
2058	29	222	1
2059	29	169	2
2060	29	194	3
2061	29	114	4
2062	29	165	5
2063	29	120	6
2064	29	181	7
2065	29	198	8
2066	29	207	9
2067	29	115	10
3048	59	341	43
3049	59	307	44
3050	59	308	45
3051	59	335	46
3052	59	320	47
3053	59	316	48
3054	59	140	49
3055	59	215	50
3056	59	318	51
3057	59	307	52
3058	59	329	53
3059	59	22	54
3060	59	304	55
3061	59	215	56
3062	59	319	57
3063	59	282	58
3064	59	309	59
3065	59	335	60
3066	59	322	61
3067	59	314	62
3068	59	343	63
3069	59	332	64
3070	59	325	65
3071	59	173	66
3072	59	336	67
3073	59	304	68
3074	59	326	69
3075	59	310	70
3076	59	223	71
3077	59	255	72
3078	61	175	0
3079	61	346	1
3771	81	400	0
3772	81	399	1
3773	81	2	2
3774	81	398	3
3775	81	397	4
3776	82	402	0
3777	82	405	1
3778	82	401	2
3779	82	243	3
3780	82	403	4
3781	82	404	5
3782	82	406	6
3783	83	409	0
3784	83	405	1
3785	83	425	2
3786	83	401	3
3787	83	423	4
3788	83	412	5
3789	83	427	6
3790	83	410	7
3791	83	242	8
3792	83	404	9
3793	83	406	10
3794	83	413	11
3795	83	431	12
3796	83	406	13
3797	83	183	14
3798	83	426	15
3799	83	166	16
3800	83	173	17
3801	83	419	18
3802	83	411	19
3803	83	414	20
3804	83	407	21
3805	83	166	22
3806	83	434	23
3807	83	430	24
3808	83	172	25
3809	83	420	26
3810	83	415	27
3811	83	408	28
3812	83	432	29
3813	83	428	30
3814	83	421	31
3815	83	429	32
3816	83	418	33
3817	83	422	34
3818	83	433	35
3819	83	430	36
3820	83	407	37
3821	83	418	38
3822	83	417	39
3823	83	424	40
3824	83	416	41
10671	161	994	0
10672	161	993	1
10673	161	992	2
10674	162	996	0
10675	162	995	1
10676	162	995	2
10677	165	175	0
10678	165	346	1
3390	65	349	0
3391	65	347	1
3392	65	348	2
3393	65	2	3
3394	65	388	4
3395	65	387	5
3396	65	389	6
3397	65	348	7
3398	65	2	8
3399	66	303	0
3400	66	304	1
3401	66	270	2
3402	66	223	3
3403	67	110	0
3404	67	372	1
3405	67	376	2
3406	67	378	3
3407	67	350	4
3408	67	83	5
3409	67	207	6
3410	67	381	7
3411	67	353	8
3412	67	354	9
3413	67	360	10
3414	67	363	11
3415	67	371	12
3416	67	55	13
3417	67	379	14
3418	67	359	15
3419	67	351	16
3420	67	380	17
3421	67	368	18
3422	67	373	19
3423	67	355	20
3424	67	367	21
3425	67	352	22
3426	67	358	23
3427	67	369	24
3428	67	377	25
3429	67	55	26
3430	67	379	27
3431	67	372	28
3432	67	356	29
3433	67	370	30
3434	67	362	31
3435	67	361	32
3436	67	321	33
3437	67	366	34
3438	67	360	35
3439	67	363	36
3440	67	364	37
3441	67	374	38
3442	67	365	39
3443	67	51	40
3444	67	357	41
3445	67	375	42
3446	69	274	0
3447	69	384	1
3448	69	386	2
3449	69	274	3
3450	69	383	4
3451	69	385	5
3452	69	382	6
5015	97	501	0
5016	97	502	1
5017	97	503	2
5018	97	2	3
5019	97	542	4
5020	97	541	5
5021	97	503	6
5022	97	2	7
5023	98	215	0
5024	98	504	1
5025	98	505	2
5026	98	506	3
4470	89	400	0
4471	89	435	1
4472	89	436	2
4473	89	2	3
4474	90	437	0
4475	90	438	1
4476	90	441	2
4477	90	439	3
4478	90	440	4
4479	90	379	5
4480	90	438	6
4481	90	430	7
4482	90	442	8
4483	91	460	0
4484	91	438	1
4485	91	441	2
4486	91	487	3
4487	91	500	4
4488	91	453	5
4489	91	451	6
4490	91	491	7
4491	91	438	8
4492	91	496	9
4493	91	488	10
4494	91	500	11
4495	91	489	12
4496	91	470	13
4497	91	447	14
4498	91	446	15
4499	91	492	16
4500	91	498	17
4501	91	487	18
4502	91	438	19
4503	91	430	20
4504	91	448	21
4505	91	456	22
4506	91	473	23
4507	91	497	24
4508	91	438	25
4509	91	481	26
4510	91	444	27
4511	91	469	28
4512	91	464	29
4513	91	450	30
4514	91	445	31
4515	91	483	32
4516	91	322	33
4517	91	140	34
4518	91	457	35
4519	91	487	36
4520	91	500	37
4521	91	478	38
4522	91	487	39
4523	91	499	40
4524	91	449	41
4525	91	472	42
4526	91	254	43
4527	91	482	44
4528	91	254	45
4529	91	463	46
4530	91	443	47
4531	91	462	48
4532	91	458	49
4533	91	469	50
4534	91	440	51
4535	91	438	52
4536	91	430	53
4537	91	442	54
4538	91	495	55
4539	91	334	56
4540	91	303	57
4541	91	484	58
4542	91	479	59
4543	91	476	60
4544	91	459	61
4545	91	500	62
4546	91	497	63
4547	91	465	64
4548	91	438	65
4549	91	496	66
4550	91	480	67
4551	91	444	68
4552	91	455	69
4553	91	468	70
4554	91	475	71
4555	91	479	72
4556	91	494	73
4557	91	466	74
4558	91	478	75
4559	91	471	76
4560	91	452	77
4561	91	476	78
4562	91	500	79
4563	91	22	80
4564	91	438	81
4565	91	496	82
4566	91	448	83
4567	91	485	84
4568	91	467	85
4569	91	468	86
4570	91	475	87
4571	91	474	88
4572	91	458	89
4573	91	479	90
4574	91	477	91
4575	91	484	92
4576	91	479	93
4577	91	495	94
4578	91	451	95
4579	91	493	96
4580	91	484	97
4581	91	474	98
4582	91	490	99
4583	91	448	100
4584	91	461	101
4585	91	459	102
4586	91	500	103
4587	91	486	104
4588	91	454	105
4589	91	460	106
4590	91	438	107
4591	91	441	108
4592	91	487	109
4593	91	500	110
4594	91	479	111
4595	91	490	112
4596	91	448	113
4597	91	485	114
4598	93	438	0
5027	99	509	0
5028	99	517	1
5029	99	504	2
5030	99	207	3
5031	99	522	4
5032	99	526	5
5033	99	515	6
5034	99	248	7
5035	99	175	8
5036	99	518	9
5037	99	507	10
5038	99	513	11
5039	99	506	12
5040	99	215	13
5041	99	537	14
5042	99	332	15
5043	99	506	16
5044	99	521	17
5045	99	516	18
5046	99	533	19
5047	99	527	20
5048	99	523	21
5049	99	535	22
5050	99	504	23
5051	99	505	24
5052	99	412	25
5053	99	519	26
5054	99	511	27
5055	99	474	28
5056	99	506	29
5057	99	215	30
5058	99	535	31
5059	99	504	32
5060	99	505	33
5061	99	486	34
5062	99	508	35
5063	99	503	36
5064	99	512	37
5065	99	519	38
5066	99	504	39
5067	99	375	40
5068	99	474	41
5069	99	529	42
5070	99	525	43
5071	99	510	44
5072	99	539	45
5073	99	534	46
5074	99	538	47
5075	99	531	48
5076	99	520	49
5077	99	486	50
5078	99	505	51
5079	99	540	52
5080	99	524	53
5081	99	539	54
5082	99	534	55
5083	99	474	56
5084	99	514	57
5085	99	528	58
5086	99	530	59
5087	99	532	60
5088	99	255	61
5089	99	412	62
5090	99	536	63
5091	99	446	64
5092	99	474	65
5093	101	207	0
5094	101	248	1
5095	101	175	2
5096	101	506	3
5097	101	215	4
5098	101	517	5
7217	113	625	0
7218	113	626	1
7219	113	2	2
7220	113	398	3
7221	113	397	4
7222	114	627	0
7223	114	634	1
7224	114	631	2
7225	114	632	3
7226	114	628	4
7227	114	629	5
7228	114	635	6
7229	114	630	7
7230	114	635	8
7231	114	633	9
7232	114	636	10
7233	115	631	0
7234	115	632	1
7235	115	679	2
7236	115	710	3
7237	115	438	4
7238	115	673	5
7239	115	671	6
7240	115	711	7
7241	115	460	8
7242	115	700	9
7243	115	226	10
7244	115	635	11
7245	115	303	12
7246	115	685	13
7247	115	709	14
7248	115	650	15
7249	115	655	16
7250	115	708	17
7251	115	657	18
7252	115	628	19
7253	115	629	20
7254	115	635	21
7255	115	675	22
7256	115	698	23
7257	115	681	24
7258	115	683	25
7259	115	627	26
7260	115	666	27
7261	115	628	28
7262	115	637	29
7263	115	630	30
7264	115	635	31
7265	115	716	32
7266	115	631	33
7267	115	632	34
7268	115	633	35
7269	115	636	36
7270	115	513	37
7271	115	675	38
7272	115	438	39
7273	115	209	40
7274	115	112	41
7275	115	694	42
7276	115	690	43
7277	115	680	44
7278	115	110	45
7279	115	313	46
7280	115	133	47
7281	115	699	48
7282	115	209	49
7283	115	112	50
7284	115	699	51
7285	115	666	52
7286	115	704	53
7287	115	687	54
7288	115	674	55
7289	115	670	56
7290	115	666	57
7291	115	653	58
7292	115	664	59
7293	115	695	60
7294	115	448	61
7295	115	682	62
7296	115	640	63
7297	115	627	64
7298	115	636	65
7299	115	133	66
7300	115	112	67
7301	115	617	68
7302	115	633	69
7303	115	425	70
7304	115	699	71
7305	115	666	72
7306	115	665	73
7307	115	645	74
7308	115	692	75
7309	115	684	76
7310	115	716	77
7311	115	575	78
7312	115	420	79
7313	115	699	80
7314	115	647	81
7315	115	381	82
7316	115	628	83
7317	115	629	84
7318	115	635	85
7319	115	630	86
7320	115	635	87
7321	115	226	88
7322	115	697	89
7323	115	173	90
7324	115	649	91
7325	115	430	92
7326	115	441	93
7327	115	699	94
7328	115	631	95
7329	115	632	96
7330	115	661	97
7331	115	713	98
7332	115	715	99
7333	115	474	100
7334	115	156	101
7335	115	651	102
7336	115	643	103
7337	115	381	104
7338	115	628	105
7339	115	629	106
7340	115	630	107
7341	115	635	108
7342	115	633	109
7343	115	636	110
7344	115	699	111
7345	115	666	112
7346	115	667	113
7347	115	714	114
7348	115	689	115
7349	115	653	116
7350	115	664	117
7351	115	695	118
7352	115	448	119
7353	115	667	120
7354	115	718	121
7355	115	701	122
7356	115	702	123
7357	115	689	124
7358	115	646	125
7359	115	707	126
7360	115	687	127
7361	115	672	128
7362	115	656	129
7363	115	112	130
7364	115	494	131
7365	115	703	132
7366	115	717	133
7367	115	638	134
7368	115	642	135
7369	115	674	136
7370	115	628	137
7371	115	629	138
7372	115	635	139
7373	115	672	140
7374	115	686	141
7375	115	556	142
7376	115	633	143
7377	115	633	144
7378	115	702	145
7379	115	672	146
7380	115	630	147
7381	115	635	148
7382	115	642	149
7383	115	674	150
7384	115	706	151
7385	115	40	152
7386	115	648	153
7387	115	644	154
7388	115	556	155
7389	115	633	156
7390	115	633	157
7391	115	702	158
7392	115	700	159
7393	115	123	160
7394	115	712	161
7395	115	641	162
7396	115	642	163
7397	115	691	164
7398	115	639	165
7399	115	438	166
7400	115	209	167
7401	115	176	168
7402	115	672	169
7403	115	652	170
7404	115	662	171
7405	115	693	172
7406	115	677	173
7407	115	660	174
7408	115	654	175
7409	115	632	176
7410	115	712	177
7411	115	8	178
7412	115	84	179
7413	115	627	180
7414	115	688	181
7415	115	628	182
7416	115	629	183
7417	115	630	184
7418	115	635	185
7419	115	669	186
7420	115	659	187
7421	115	83	188
7422	115	676	189
7423	115	438	190
7424	115	678	191
7425	115	672	192
7426	115	656	193
7427	115	37	194
7428	115	668	195
7429	115	658	196
7430	115	699	197
7431	115	209	198
7432	115	705	199
7433	115	690	200
7434	115	628	201
7435	115	629	202
7436	115	635	203
7437	115	656	204
7438	115	483	205
7439	115	112	206
7440	115	412	207
7441	115	680	208
7442	115	696	209
7443	115	663	210
7444	117	438	0
8040	121	720	0
8041	121	721	1
8042	121	2	2
8043	121	719	3
8044	122	727	0
8045	122	722	1
8046	122	204	2
8047	122	723	3
8048	122	110	4
8049	122	724	5
8050	122	725	6
8051	122	726	7
8052	123	530	0
8053	123	750	1
8054	123	764	2
8055	123	763	3
8056	123	748	4
8057	123	765	5
8058	123	759	6
8059	123	175	7
8060	123	732	8
8061	123	728	9
8062	123	342	10
8063	123	532	11
8064	123	285	12
8065	123	33	13
8066	123	738	14
8067	123	121	15
8068	123	766	16
8069	123	723	17
8070	123	110	18
8071	123	758	19
8072	123	724	20
8073	123	725	21
8074	123	726	22
8075	123	775	23
8076	123	739	24
8077	123	365	25
8078	123	760	26
8079	123	761	27
8080	123	2	28
8081	123	736	29
8082	123	778	30
8083	123	207	31
8084	123	744	32
8085	123	747	33
8086	123	737	34
8087	123	155	35
8088	123	740	36
8089	123	2	37
8090	123	769	38
8091	123	203	39
8092	123	768	40
8093	123	777	41
8094	123	722	42
8095	123	204	43
8096	123	224	44
8097	123	734	45
8098	123	474	46
8099	123	33	47
8100	123	733	48
8101	123	474	49
8102	123	761	50
8103	123	251	51
8104	123	741	52
8105	123	204	53
8106	123	755	54
8107	123	745	55
8108	123	742	56
8109	123	735	57
8110	123	776	58
8111	123	772	59
8112	123	756	60
8113	123	135	61
8114	123	762	62
8115	123	207	63
8116	123	722	64
8117	123	204	65
8118	123	751	66
8119	123	2	67
8120	123	562	68
8121	123	771	69
8122	123	730	70
8123	123	776	71
8124	123	679	72
8125	123	757	73
8126	123	773	74
8127	123	767	75
8128	123	731	76
8129	123	365	77
8130	123	753	78
8131	123	729	79
8132	123	749	80
8133	123	2	81
8134	123	155	82
8135	123	746	83
8136	123	770	84
8137	123	737	85
8138	123	754	86
8139	123	33	87
8140	123	743	88
8141	123	744	89
8142	123	752	90
5914	105	545	0
5915	105	544	1
5916	105	543	2
5917	105	120	3
5918	105	2	4
5919	106	552	0
5920	106	547	1
5921	106	549	2
5922	106	83	3
5923	106	551	4
5924	106	550	5
5925	106	548	6
5926	106	29	7
5927	106	546	8
5928	107	595	0
5929	107	110	1
5930	107	558	2
5931	107	8	3
5932	107	371	4
5933	107	618	5
5934	107	46	6
5935	107	602	7
5936	107	30	8
5937	107	12	9
5938	107	596	10
5939	107	50	11
5940	107	19	12
5941	107	564	13
5942	107	610	14
5943	107	599	15
5944	107	450	16
5945	107	598	17
5946	107	89	18
5947	107	571	19
5948	107	603	20
5949	107	561	21
5950	107	581	22
5951	107	568	23
5952	107	88	24
5953	107	578	25
5954	107	622	26
5955	107	585	27
5956	107	601	28
5957	107	566	29
5958	107	601	30
5959	107	612	31
5960	107	554	32
5961	107	95	33
5962	107	615	34
5963	107	587	35
5964	107	600	36
5965	107	594	37
5966	107	617	38
5967	107	619	39
5968	107	582	40
5969	107	557	41
5970	107	593	42
5971	107	30	43
5972	107	12	44
5973	107	26	45
5974	107	600	46
5975	107	562	47
5976	107	555	48
5977	107	30	49
5978	107	12	50
5979	107	26	51
5980	107	578	52
5981	107	612	53
5982	107	600	54
5983	107	74	55
5984	107	95	56
5985	107	620	57
5986	107	573	58
5987	107	30	59
5988	107	12	60
5989	107	597	61
5990	107	586	62
5991	107	95	63
5992	107	620	64
5993	107	597	65
5994	107	576	66
5995	107	30	67
5996	107	12	68
5997	107	559	69
5998	107	563	70
5999	107	565	71
6000	107	30	72
6001	107	12	73
6002	107	567	74
6003	107	597	75
6004	107	95	76
6005	107	620	77
6006	107	597	78
6007	107	574	79
6008	107	12	80
6009	107	584	81
6010	107	569	82
6011	107	605	83
6012	107	12	84
6013	107	589	85
6014	107	557	86
6015	107	160	87
6016	107	590	88
6017	107	12	89
6018	107	556	90
6019	107	577	91
6020	107	600	92
6021	107	575	93
6022	107	23	94
6023	107	556	95
6024	107	77	96
6025	107	584	97
6026	107	616	98
6027	107	613	99
6028	107	606	100
6029	107	14	101
6030	107	604	102
6031	107	82	103
6032	107	611	104
6033	107	591	105
6034	107	621	106
6035	107	592	107
6036	107	600	108
6037	107	610	109
6038	107	572	110
6039	107	40	111
6040	107	579	112
6041	107	212	113
6042	107	607	114
6043	107	371	115
6044	107	618	116
6045	107	608	117
6046	107	602	118
6047	107	612	119
6048	107	30	120
6049	107	12	121
6050	107	596	122
6051	107	50	123
6052	107	19	124
6053	107	564	125
6054	107	610	126
6055	107	602	127
6056	107	566	128
6057	107	601	129
6058	107	553	130
6059	107	614	131
6060	107	560	132
6061	107	30	133
6062	107	580	134
6063	107	19	135
6064	107	46	136
6065	107	247	137
6066	107	570	138
6067	107	7	139
6068	107	22	140
6069	107	583	141
6070	107	7	142
6071	107	46	143
6072	107	609	144
6073	107	588	145
6074	109	74	0
6075	109	623	1
6076	109	624	2
10323	147	958	76
10324	147	954	77
10325	147	945	78
10326	147	923	79
10327	147	928	80
10328	147	926	81
10329	147	212	82
10330	147	953	83
8143	123	774	91
8144	123	332	92
8145	123	240	93
8146	125	764	0
8147	125	763	1
8148	125	759	2
8149	125	775	3
8150	125	739	4
8151	125	737	5
8152	125	754	6
8153	125	738	7
8154	125	121	8
8155	125	766	9
8156	125	749	10
8157	125	332	11
8158	125	240	12
10331	147	929	84
10332	147	922	85
10333	147	420	86
10334	147	928	87
10335	147	828	88
10336	147	365	89
9546	137	840	0
9547	137	839	1
9548	137	838	2
9549	137	2	3
9550	138	8	0
9551	138	371	1
9552	138	618	2
9553	138	841	3
9554	138	608	4
9555	138	612	5
9556	138	30	6
9557	138	12	7
9558	138	26	8
9559	138	50	9
9560	138	74	10
9561	138	600	11
9562	139	595	0
9563	139	155	1
9564	139	483	2
9565	139	912	3
9566	139	900	4
9567	139	907	5
9568	139	902	6
9569	139	870	7
9570	139	893	8
9571	139	711	9
9572	139	861	10
9573	139	365	11
9574	139	7	12
9575	139	886	13
9576	139	846	14
9577	139	863	15
9578	139	898	16
9579	139	910	17
9580	139	870	18
9581	139	819	19
9582	139	882	20
9583	139	889	21
9584	139	849	22
9585	139	587	23
9586	139	636	24
9587	139	868	25
9588	139	907	26
9589	139	873	27
9590	139	883	28
9591	139	848	29
9592	139	843	30
9593	139	587	31
9594	139	873	32
9595	139	476	33
9596	139	844	34
9597	139	880	35
9598	139	902	36
9599	139	7	37
9600	139	91	38
9601	139	26	39
9602	139	848	40
9603	139	843	41
9604	139	740	42
9605	139	871	43
9606	139	907	44
9607	139	906	45
9608	139	894	46
9609	139	847	47
9610	139	879	48
9611	139	274	49
9612	139	5	50
9613	139	500	51
9614	139	890	52
9615	139	598	53
9616	139	855	54
9617	139	911	55
9618	139	903	56
9619	139	869	57
9620	139	872	58
9621	139	874	59
9622	139	45	60
9623	139	892	61
9624	139	891	62
9625	139	500	63
9626	139	907	64
9627	139	856	65
9628	139	897	66
9629	139	876	67
9630	139	824	68
9631	139	901	69
9632	139	7	70
9633	139	46	71
9634	139	597	72
9635	139	717	73
9636	139	877	74
9637	139	869	75
9638	139	890	76
9639	139	85	77
9640	139	862	78
9641	139	901	79
9642	139	853	80
9643	139	902	81
9644	139	915	82
9645	139	274	83
9646	139	884	84
9647	139	636	85
9648	139	851	86
9649	139	854	87
9650	139	896	88
9651	139	866	89
9652	139	793	90
9653	139	905	91
9654	139	860	92
9655	139	865	93
9656	139	875	94
9657	139	858	95
9658	139	885	96
9659	139	899	97
9660	139	914	98
9661	139	860	99
9662	139	873	100
9663	139	845	101
9664	139	909	102
9665	139	904	103
9666	139	908	104
9667	139	857	105
9668	139	909	106
9669	139	895	107
9670	139	852	108
9671	139	892	109
9672	139	842	110
9673	139	112	111
9674	139	867	112
9675	139	859	113
9676	139	864	114
9677	139	878	115
9678	139	595	116
9679	139	913	117
9680	139	907	118
9681	139	5	119
9682	139	887	120
9683	139	846	121
9684	139	673	122
9685	139	52	123
9686	139	888	124
9687	139	94	125
9688	139	784	126
9689	139	881	127
9690	139	489	128
9691	139	850	129
9692	141	907	0
9693	141	623	1
9694	141	624	2
10230	145	917	0
10231	145	916	1
10232	145	2	2
10233	145	918	3
10234	146	927	0
10235	146	50	1
10236	146	919	2
10237	146	929	3
10238	146	921	4
10239	146	596	5
10240	146	922	6
10241	146	923	7
10242	146	928	8
10243	146	926	9
10244	146	920	10
10245	146	925	11
10246	146	924	12
10247	147	927	0
10248	147	50	1
10249	147	919	2
10250	147	929	3
10251	147	961	4
10252	147	921	5
10253	147	955	6
10254	147	922	7
8694	129	780	0
8695	129	781	1
8696	129	2	2
8697	129	779	3
8698	130	783	0
8699	130	784	1
8700	130	430	2
8701	130	782	3
8702	131	243	0
8703	131	785	1
8704	131	784	2
8705	131	783	3
8706	131	430	4
8707	131	224	5
8708	131	192	6
8709	131	802	7
8710	131	808	8
8711	131	782	9
8712	131	813	10
8713	131	827	11
8714	131	784	12
8715	131	334	13
8716	131	807	14
8717	131	801	15
8718	131	268	16
8719	131	826	17
8720	131	813	18
8721	131	784	19
8722	131	783	20
8723	131	825	21
8724	131	833	22
8725	131	790	23
8726	131	819	24
8727	131	791	25
8728	131	63	26
8729	131	812	27
8730	131	14	28
8731	131	818	29
8732	131	819	30
8733	131	803	31
8734	131	827	32
8735	131	784	33
8736	131	783	34
8737	131	14	35
8738	131	818	36
8739	131	812	37
8740	131	80	38
8741	131	830	39
8742	131	9	40
8743	131	821	41
8744	131	798	42
8745	131	811	43
8746	131	787	44
8747	131	823	45
8748	131	791	46
8749	131	835	47
8750	131	812	48
8751	131	430	49
8752	131	224	50
8753	131	816	51
8754	131	804	52
8755	131	802	53
8756	131	813	54
8757	131	784	55
8758	131	820	56
8759	131	814	57
8760	131	786	58
8761	131	792	59
8762	131	834	60
8763	131	560	61
8764	131	805	62
8765	131	788	63
8766	131	810	64
8767	131	814	65
8768	131	829	66
8769	131	817	67
8770	131	829	68
8771	131	827	69
8772	131	784	70
8773	131	797	71
8774	131	800	72
8775	131	832	73
8776	131	809	74
8777	131	14	75
8778	131	837	76
8779	131	796	77
8780	131	789	78
8781	131	827	79
8782	131	795	80
8783	131	709	81
8784	131	783	82
8785	131	787	83
8786	131	793	84
8787	131	828	85
8788	131	827	86
8789	131	806	87
8790	131	794	88
8791	131	783	89
8792	131	787	90
8793	131	822	91
8794	131	799	92
8795	131	553	93
8796	131	831	94
8797	131	836	95
8798	131	29	96
8799	131	815	97
8800	131	824	98
10255	147	960	8
10256	147	923	9
10257	147	928	10
10258	147	926	11
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
6	1	7	2025-01-16 05:21:28	2025-01-16 05:21:23	2025-01-16 05:21:23	5	en	3		0
1	1	1	2025-01-16 05:18:02	2025-01-16 05:18:02	2025-01-16 05:18:02	5	en	1		0
13	1	14	2025-01-16 05:24:17	2025-01-16 05:24:13	2025-01-16 05:24:13	5	en	3		0
19	1	20	2025-01-16 05:26:43	2025-01-16 05:26:38	2025-01-16 05:26:38	5	en	3		0
7	1	8	2025-01-16 05:21:52	2025-01-16 05:21:47	2025-01-16 05:21:47	5	en	3		0
2	1	2	2025-01-16 05:19:08	2025-01-16 05:19:00	2025-01-16 05:19:00	5	en	3		0
14	1	15	2025-01-16 05:24:42	2025-01-16 05:24:37	2025-01-16 05:24:37	5	en	3		0
8	1	9	2025-01-16 05:22:16	2025-01-16 05:22:11	2025-01-16 05:22:11	5	en	3		0
15	1	16	2025-01-16 05:25:06	2025-01-16 05:25:01	2025-01-16 05:25:01	5	en	3		0
9	1	10	2025-01-16 05:22:40	2025-01-16 05:22:35	2025-01-16 05:22:35	5	en	3		0
3	1	4	2025-01-16 05:19:53	2025-01-16 05:19:28	2025-01-16 05:19:28	5	en	3		0
10	1	11	2025-01-16 05:23:04	2025-01-16 05:23:00	2025-01-16 05:23:00	5	en	3		0
16	1	17	2025-01-16 05:25:30	2025-01-16 05:25:25	2025-01-16 05:25:25	5	en	3		0
4	1	5	2025-01-16 05:20:13	2025-01-16 05:20:13	2025-01-16 05:20:13	5	en	4		0
11	1	12	2025-01-16 05:23:29	2025-01-16 05:23:24	2025-01-16 05:23:24	5	en	3		0
17	1	18	2025-01-16 05:25:54	2025-01-16 05:25:50	2025-01-16 05:25:50	5	en	3		0
5	1	6	2025-01-16 05:21:04	2025-01-16 05:20:51	2025-01-16 05:20:51	5	en	3		0
12	1	13	2025-01-16 05:23:53	2025-01-16 05:23:49	2025-01-16 05:23:49	5	en	3		0
18	1	19	2025-01-16 05:26:19	2025-01-16 05:26:14	2025-01-16 05:26:14	5	en	3		0
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
1	1	1	2025-01-16 05:14:24	\N	\N
2	2	1	\N	\N	\N
3	2	2	2025-01-16 00:00:00	\N	1
4	2	3	2025-01-16 00:00:00	\N	1
5	3	4	2025-01-16 00:00:00	\N	1
6	3	5	2025-01-16 00:00:00	\N	1
7	3	6	2025-01-16 00:00:00	\N	1
8	5	7	2025-01-16 05:17:46	\N	\N
9	4	7	2025-01-16 05:17:48	\N	\N
10	5	8	2025-01-16 05:18:06	\N	\N
11	4	8	2025-01-16 05:18:10	\N	\N
12	5	9	2025-01-16 05:19:12	\N	\N
13	4	9	2025-01-16 05:19:14	\N	\N
14	5	10	2025-01-16 05:19:57	\N	\N
15	4	10	2025-01-16 05:20:00	\N	\N
16	5	11	2025-01-16 05:20:35	\N	\N
17	4	11	2025-01-16 05:20:38	\N	\N
18	5	12	2025-01-16 05:21:08	\N	\N
19	4	12	2025-01-16 05:21:10	\N	\N
20	5	13	2025-01-16 05:21:32	\N	\N
21	4	13	2025-01-16 05:21:34	\N	\N
22	5	14	2025-01-16 05:21:56	\N	\N
23	4	14	2025-01-16 05:21:58	\N	\N
24	5	15	2025-01-16 05:22:20	\N	\N
25	4	15	2025-01-16 05:22:22	\N	\N
26	5	16	2025-01-16 05:22:44	\N	\N
27	4	16	2025-01-16 05:22:46	\N	\N
28	5	17	2025-01-16 05:23:09	\N	\N
29	4	17	2025-01-16 05:23:11	\N	\N
30	5	18	2025-01-16 05:23:33	\N	\N
31	4	18	2025-01-16 05:23:35	\N	\N
32	5	19	2025-01-16 05:23:58	\N	\N
33	4	19	2025-01-16 05:24:00	\N	\N
34	5	20	2025-01-16 05:24:22	\N	\N
35	4	20	2025-01-16 05:24:24	\N	\N
36	5	21	2025-01-16 05:24:46	\N	\N
37	4	21	2025-01-16 05:24:48	\N	\N
38	5	22	2025-01-16 05:25:10	\N	\N
39	4	22	2025-01-16 05:25:12	\N	\N
40	5	23	2025-01-16 05:25:34	\N	\N
41	4	23	2025-01-16 05:25:37	\N	\N
42	5	24	2025-01-16 05:25:58	\N	\N
43	4	24	2025-01-16 05:26:01	\N	\N
44	5	25	2025-01-16 05:26:23	\N	\N
45	4	25	2025-01-16 05:26:25	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.users (user_id, username, password, email, url, phone, mailing_address, billing_address, country, locales, gossip, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help, remember_token) FROM stdin;
10	ddiouf	$2y$10$iS7ylD7V3Qw6F7Rwx0ZJx.6/Ra/MJK7yLAzAam4EAVt3NgM4GkQou	ddiouf@mailinator.com	\N	\N	\N	\N	EG	[]	\N	\N	2025-01-16 05:19:57	\N	2025-01-16 05:19:57	\N	\N	\N	0	\N	1	\N
16	jnovak	$2y$10$lRvhwH4nlS3L6DmYu6IbAu1UVGnIdxKe59oEVLWp7DM1UDwbh5C7.	jnovak@mailinator.com	\N	\N	\N	\N	DK	[]	\N	\N	2025-01-16 05:22:44	\N	2025-01-16 05:22:44	\N	\N	\N	0	\N	1	\N
11	dphillips	$2y$10$NIdLclorCsa0auzAiIX3xez.7KwO6xXUVR1LXYmjdZfspvkIDHNz2	dphillips@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-16 05:20:35	\N	2025-01-16 05:20:36	\N	\N	\N	0	\N	1	\N
22	rrossi	$2y$10$066D5MSJFb8SVMNyuM.QGuTvGrUW5FWSniOg6CMlPPVjBqx9SnSHO	rrossi@mailinator.com	\N	\N	\N	\N	ES	[]	\N	\N	2025-01-16 05:25:10	\N	2025-01-16 05:25:10	\N	\N	\N	0	\N	1	\N
17	kalkhafaji	$2y$10$Pn0DnYlm3xvI5zqBcCT.JeJosKvZDDg4Fy5rIIIUI8/2aZUnm7e7K	kalkhafaji@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-16 05:23:08	\N	2025-01-16 05:23:09	\N	\N	\N	0	\N	1	\N
2	rvaca	$2y$10$TM2eTq9goyWwL1xh1UxVdOrH1W.M7PMH/9hnON5uMVpFcb0LPFYx2	rvaca@mailinator.com	\N	\N	\N	\N	MX	[]	\N	\N	2025-01-16 05:15:40	\N	\N	\N	\N	\N	0	\N	1	\N
4	dbuskins	$2y$10$x2aCSPEcsHbpVMAZLMeB.eszngdllyThmRxJFue23ycqvnrDMFJfS	dbuskins@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-16 05:16:23	\N	\N	\N	\N	\N	0	\N	1	\N
12	dsokoloff	$2y$10$MF6IpxyRMYo8/MuaInGtX.iXsPO2eyfulsP0opwTTu4PqewLG.oXS	dsokoloff@mailinator.com	\N	\N	\N	\N	IE	[]	\N	\N	2025-01-16 05:21:08	\N	2025-01-16 05:21:08	\N	\N	\N	0	\N	1	\N
18	lchristopher	$2y$10$wdYfOcmSAOQiun/ekLaaAezbapH2C/ffAEmch09x48mb.6o/SL8Wq	lchristopher@mailinator.com	\N	\N	\N	\N	AU	[]	\N	\N	2025-01-16 05:23:33	\N	2025-01-16 05:23:33	\N	\N	\N	0	\N	1	\N
5	sberardo	$2y$10$1IcSqf67ksYYJIiXbITD6.nlPukJaSnU.vvEp34I4FZyR0f9j9otq	sberardo@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-16 05:16:46	\N	\N	\N	\N	\N	0	\N	1	\N
6	minoue	$2y$10$0Z599JzgYD4US/9QpRH2VOU6o8vy7rTfiFACjvB7l1joZ.1p5m/0m	minoue@mailinator.com	\N	\N	\N	\N	JP	[]	\N	\N	2025-01-16 05:17:10	\N	\N	\N	\N	\N	0	\N	1	\N
23	vkarbasizaed	$2y$10$nu9EWQGZaQdo59JzHwltUu1H6xAq3sFAoLq9hoXuTfkHAQhIU8vAa	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR	[]	\N	\N	2025-01-16 05:25:34	\N	2025-01-16 05:25:35	\N	\N	\N	0	\N	1	\N
13	eostrom	$2y$10$q0pC7AwiEkFuO0.ueXj3/uklKPnnJGL4T0e8tBW2mqi5D5vgBf6Yq	eostrom@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-16 05:21:31	\N	2025-01-16 05:21:32	\N	\N	\N	0	\N	1	\N
1	admin	$2y$10$.CvqYh.v7kRFxnlxGROljuTp6kSkf5WwwGJXTlmX3MoCyMn7ti5Tm	pkpadmin@mailinator.com	\N	\N	\N	\N	\N	[]	\N	\N	2025-01-16 05:14:24	\N	2025-01-16 05:17:21	\N	\N	\N	0	\N	1	\N
7	ccorino	$2y$10$rVCEHx.OMWfuph3uP7UvJ.4/bgEfDccGVm8woOs9stlrLFVB.v8e2	ccorino@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2025-01-16 05:17:46	\N	2025-01-16 05:17:46	\N	\N	\N	0	\N	1	\N
8	ckwantes	$2y$10$kewimzjEmFZeSFSPfV9Dn.MRGkuaLnfu1zz68sSxiaietozpUSRXC	ckwantes@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-16 05:18:06	\N	2025-01-16 05:18:06	\N	\N	\N	0	\N	1	\N
19	lkumiega	$2y$10$s0s8qM3XcMhn7wWUa5JbN.hDww72nVqUheG1n0CBqVLTSmmAZ5IqK	lkumiega@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2025-01-16 05:23:57	\N	2025-01-16 05:23:58	\N	\N	\N	0	\N	1	\N
14	fpaglieri	$2y$10$76QIEpXzhot2gNcGctrXmuOlFmnx6RXgrDWNHG2LtgtVINrteC.Em	fpaglieri@mailinator.com	\N	\N	\N	\N	IT	[]	\N	\N	2025-01-16 05:21:56	\N	2025-01-16 05:21:56	\N	\N	\N	0	\N	1	\N
9	cmontgomerie	$2y$10$kCEBjJVWv6bjlTTK7/gSr.3Jza2vLM/J.XR2UQz/jQww7tn6qk5Z.	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-16 05:19:12	\N	2025-01-16 05:19:12	\N	\N	\N	0	\N	1	\N
20	pdaniel	$2y$10$jj.c7fKpvqvCMNeUiGCcuOrUSoqDfChu7fplAbR/bgJ2eIiAbttQW	pdaniel@mailinator.com	\N	\N	\N	\N	GB	[]	\N	\N	2025-01-16 05:24:21	\N	2025-01-16 05:24:22	\N	\N	\N	0	\N	1	\N
15	jmwandenga	$2y$10$IDb/09qgBL6IzdXww6QbLuSI8dZGxRzRcfoHkehFfc0p9AB0kEkSW	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA	[]	\N	\N	2025-01-16 05:22:20	\N	2025-01-16 05:22:20	\N	\N	\N	0	\N	1	\N
24	vwilliamson	$2y$10$I8lah5xJ20PgPRMmc6XQ0.QnLqaPpvT/CZUJVQNjp5hy5IE/97XQ.	vwilliamson@mailinator.com	\N	\N	\N	\N	CA	[]	\N	\N	2025-01-16 05:25:58	\N	2025-01-16 05:25:59	\N	\N	\N	0	\N	1	\N
21	rbaiyewu	$2y$10$fpw3sVtKQBvf91ZMkYReSOUsOPqIgQWdZYIyM7Q0Ys1vTkxh8HSoq	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE	[]	\N	\N	2025-01-16 05:24:46	\N	2025-01-16 05:24:46	\N	\N	\N	0	\N	1	\N
25	zwoods	$2y$10$4yH.uV4XWayz7cofHHxk8.HYgCUV0t9sMM0FLp20j8910qtJt0dSW	zwoods@mailinator.com	\N	\N	\N	\N	US	[]	\N	\N	2025-01-16 05:26:23	\N	2025-01-16 05:26:23	\N	\N	\N	0	\N	1	\N
3	dbarnes	$2y$10$Ff4z4EO/LBAXKwC20joABuevbVvhusFhSjyAS/BqraWuc6RFxwaOC	dbarnes@mailinator.com	\N	\N	\N	\N	AU	[]	\N	\N	2025-01-16 05:16:01	\N	2025-01-16 05:26:39	\N	\N	\N	0	\N	1	\N
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ops-ci
--

COPY public.versions (version_id, major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	1	0	0	0	2025-01-16 05:14:24	1	plugins.metadata	dc11		0	0
2	1	0	0	0	2025-01-16 05:14:24	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
3	1	0	1	0	2025-01-16 05:14:24	1	plugins.blocks	browse	BrowseBlockPlugin	1	0
4	1	0	0	0	2025-01-16 05:14:24	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
5	0	1	0	0	2025-01-16 05:14:24	1	plugins.generic	citationStyleLanguage	CitationStyleLanguagePlugin	1	0
6	1	0	1	0	2025-01-16 05:14:24	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
7	1	0	0	0	2025-01-16 05:14:24	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
8	1	2	0	0	2025-01-16 05:14:24	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
9	1	1	0	0	2025-01-16 05:14:24	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
10	1	0	0	0	2025-01-16 05:14:24	1	plugins.generic	usageEvent		0	0
11	1	0	0	0	2025-01-16 05:14:24	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
12	2	2	0	0	2025-01-16 05:14:24	1	plugins.generic	crossref		0	0
13	1	0	0	0	2025-01-16 05:14:24	1	plugins.generic	webFeed	WebFeedPlugin	1	0
14	1	0	0	0	2025-01-16 05:14:24	1	plugins.importexport	native		0	0
15	1	0	0	0	2025-01-16 05:14:24	1	plugins.oaiMetadataFormats	dc		0	0
16	1	0	0	0	2025-01-16 05:14:24	1	plugins.themes	default	DefaultThemePlugin	1	0
17	3	5	0	0	2025-01-16 05:14:23	1	core	ops		0	1
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

SELECT pg_catalog.setval('public.submission_search_keyword_list_keyword_id_seq', 996, true);


--
-- Name: submission_search_object_keyw_submission_search_object_keyw_seq; Type: SEQUENCE SET; Schema: public; Owner: ops-ci
--

SELECT pg_catalog.setval('public.submission_search_object_keyw_submission_search_object_keyw_seq', 10678, true);


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

