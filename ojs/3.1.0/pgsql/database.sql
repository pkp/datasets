--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET client_min_messages = warning;

--
-- Name: access_keys; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE access_keys (
    access_key_id integer NOT NULL,
    context character varying(40) NOT NULL,
    key_hash character varying(40) NOT NULL,
    user_id bigint NOT NULL,
    assoc_id bigint,
    expiry_date timestamp without time zone NOT NULL
);


ALTER TABLE access_keys OWNER TO "ojs-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE access_keys_access_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE access_keys_access_key_id_seq OWNER TO "ojs-ci";

--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE access_keys_access_key_id_seq OWNED BY access_keys.access_key_id;


--
-- Name: announcement_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE announcement_settings (
    announcement_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE announcement_settings OWNER TO "ojs-ci";

--
-- Name: announcement_type_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE announcement_type_settings (
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE announcement_type_settings OWNER TO "ojs-ci";

--
-- Name: announcement_types; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE announcement_types (
    type_id integer NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL
);


ALTER TABLE announcement_types OWNER TO "ojs-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE announcement_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE announcement_types_type_id_seq OWNER TO "ojs-ci";

--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE announcement_types_type_id_seq OWNED BY announcement_types.type_id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE announcements (
    announcement_id integer NOT NULL,
    assoc_type smallint,
    assoc_id bigint NOT NULL,
    type_id bigint,
    date_expire timestamp without time zone,
    date_posted timestamp without time zone NOT NULL
);


ALTER TABLE announcements OWNER TO "ojs-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE announcements_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE announcements_announcement_id_seq OWNER TO "ojs-ci";

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE announcements_announcement_id_seq OWNED BY announcements.announcement_id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE auth_sources (
    auth_id integer NOT NULL,
    title character varying(60) NOT NULL,
    plugin character varying(32) NOT NULL,
    auth_default smallint DEFAULT 0 NOT NULL,
    settings text
);


ALTER TABLE auth_sources OWNER TO "ojs-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE auth_sources_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_sources_auth_id_seq OWNER TO "ojs-ci";

--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE auth_sources_auth_id_seq OWNED BY auth_sources.auth_id;


--
-- Name: author_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE author_settings (
    author_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE author_settings OWNER TO "ojs-ci";

--
-- Name: authors; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE authors (
    author_id integer NOT NULL,
    submission_id bigint NOT NULL,
    primary_contact smallint DEFAULT 0 NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    first_name character varying(40) NOT NULL,
    middle_name character varying(40),
    last_name character varying(90) NOT NULL,
    suffix character varying(40),
    country character varying(90),
    email character varying(90) NOT NULL,
    url character varying(2047),
    user_group_id bigint,
    include_in_browse smallint DEFAULT 1 NOT NULL
);


ALTER TABLE authors OWNER TO "ojs-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_author_id_seq OWNER TO "ojs-ci";

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE authors_author_id_seq OWNED BY authors.author_id;


--
-- Name: citation_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE citation_settings (
    citation_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE citation_settings OWNER TO "ojs-ci";

--
-- Name: citations; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE citations (
    citation_id integer NOT NULL,
    assoc_type bigint DEFAULT 0 NOT NULL,
    assoc_id bigint DEFAULT 0 NOT NULL,
    citation_state bigint NOT NULL,
    raw_citation text,
    seq bigint DEFAULT 0 NOT NULL,
    lock_id character varying(23)
);


ALTER TABLE citations OWNER TO "ojs-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE citations_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE citations_citation_id_seq OWNER TO "ojs-ci";

--
-- Name: citations_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE citations_citation_id_seq OWNED BY citations.citation_id;


--
-- Name: completed_payments; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE completed_payments (
    completed_payment_id integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    payment_type bigint NOT NULL,
    context_id bigint NOT NULL,
    user_id bigint,
    assoc_id bigint,
    amount double precision NOT NULL,
    currency_code_alpha character varying(3),
    payment_method_plugin_name character varying(80)
);


ALTER TABLE completed_payments OWNER TO "ojs-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE completed_payments_completed_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE completed_payments_completed_payment_id_seq OWNER TO "ojs-ci";

--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE completed_payments_completed_payment_id_seq OWNED BY completed_payments.completed_payment_id;


--
-- Name: controlled_vocab_entries; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE controlled_vocab_entries (
    controlled_vocab_entry_id integer NOT NULL,
    controlled_vocab_id bigint NOT NULL,
    seq double precision
);


ALTER TABLE controlled_vocab_entries OWNER TO "ojs-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE controlled_vocab_entries_controlled_vocab_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE controlled_vocab_entries_controlled_vocab_entry_id_seq OWNER TO "ojs-ci";

--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE controlled_vocab_entries_controlled_vocab_entry_id_seq OWNED BY controlled_vocab_entries.controlled_vocab_entry_id;


--
-- Name: controlled_vocab_entry_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE controlled_vocab_entry_settings (
    controlled_vocab_entry_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE controlled_vocab_entry_settings OWNER TO "ojs-ci";

--
-- Name: controlled_vocabs; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE controlled_vocabs (
    controlled_vocab_id integer NOT NULL,
    symbolic character varying(64) NOT NULL,
    assoc_type bigint DEFAULT 0 NOT NULL,
    assoc_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE controlled_vocabs OWNER TO "ojs-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE controlled_vocabs_controlled_vocab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE controlled_vocabs_controlled_vocab_id_seq OWNER TO "ojs-ci";

--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE controlled_vocabs_controlled_vocab_id_seq OWNED BY controlled_vocabs.controlled_vocab_id;


--
-- Name: custom_issue_orders; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE custom_issue_orders (
    issue_id bigint NOT NULL,
    journal_id bigint NOT NULL,
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE custom_issue_orders OWNER TO "ojs-ci";

--
-- Name: custom_section_orders; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE custom_section_orders (
    issue_id bigint NOT NULL,
    section_id bigint NOT NULL,
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE custom_section_orders OWNER TO "ojs-ci";

--
-- Name: data_object_tombstone_oai_set_objects; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE data_object_tombstone_oai_set_objects (
    object_id integer NOT NULL,
    tombstone_id bigint NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL
);


ALTER TABLE data_object_tombstone_oai_set_objects OWNER TO "ojs-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE data_object_tombstone_oai_set_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_object_tombstone_oai_set_objects_object_id_seq OWNER TO "ojs-ci";

--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE data_object_tombstone_oai_set_objects_object_id_seq OWNED BY data_object_tombstone_oai_set_objects.object_id;


--
-- Name: data_object_tombstone_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE data_object_tombstone_settings (
    tombstone_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE data_object_tombstone_settings OWNER TO "ojs-ci";

--
-- Name: data_object_tombstones; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE data_object_tombstones (
    tombstone_id integer NOT NULL,
    data_object_id bigint NOT NULL,
    date_deleted timestamp without time zone NOT NULL,
    set_spec character varying(255) NOT NULL,
    set_name character varying(255) NOT NULL,
    oai_identifier character varying(255) NOT NULL
);


ALTER TABLE data_object_tombstones OWNER TO "ojs-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE data_object_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_object_tombstones_tombstone_id_seq OWNER TO "ojs-ci";

--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE data_object_tombstones_tombstone_id_seq OWNED BY data_object_tombstones.tombstone_id;


--
-- Name: edit_decisions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE edit_decisions (
    edit_decision_id integer NOT NULL,
    submission_id bigint NOT NULL,
    review_round_id bigint,
    stage_id bigint,
    round smallint NOT NULL,
    editor_id bigint NOT NULL,
    decision smallint NOT NULL,
    date_decided timestamp without time zone NOT NULL
);


ALTER TABLE edit_decisions OWNER TO "ojs-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE edit_decisions_edit_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE edit_decisions_edit_decision_id_seq OWNER TO "ojs-ci";

--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE edit_decisions_edit_decision_id_seq OWNED BY edit_decisions.edit_decision_id;


--
-- Name: email_log; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE email_log (
    log_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    sender_id bigint NOT NULL,
    date_sent timestamp without time zone NOT NULL,
    ip_address character varying(39),
    event_type bigint,
    from_address character varying(255),
    recipients text,
    cc_recipients text,
    bcc_recipients text,
    subject character varying(255),
    body text
);


ALTER TABLE email_log OWNER TO "ojs-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE email_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_log_log_id_seq OWNER TO "ojs-ci";

--
-- Name: email_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE email_log_log_id_seq OWNED BY email_log.log_id;


--
-- Name: email_log_users; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE email_log_users (
    email_log_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE email_log_users OWNER TO "ojs-ci";

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE email_templates (
    email_id integer NOT NULL,
    email_key character varying(64) NOT NULL,
    assoc_type bigint DEFAULT 0,
    assoc_id bigint DEFAULT 0,
    enabled smallint DEFAULT 1 NOT NULL
);


ALTER TABLE email_templates OWNER TO "ojs-ci";

--
-- Name: email_templates_data; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE email_templates_data (
    email_key character varying(64) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying NOT NULL,
    assoc_type bigint DEFAULT 0,
    assoc_id bigint DEFAULT 0,
    subject character varying(120) NOT NULL,
    body text
);


ALTER TABLE email_templates_data OWNER TO "ojs-ci";

--
-- Name: email_templates_default; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE email_templates_default (
    email_id integer NOT NULL,
    email_key character varying(64) NOT NULL,
    can_disable smallint DEFAULT 1 NOT NULL,
    can_edit smallint DEFAULT 1 NOT NULL,
    from_role_id bigint,
    to_role_id bigint
);


ALTER TABLE email_templates_default OWNER TO "ojs-ci";

--
-- Name: email_templates_default_data; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE email_templates_default_data (
    email_key character varying(64) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying NOT NULL,
    subject character varying(120) NOT NULL,
    body text,
    description text
);


ALTER TABLE email_templates_default_data OWNER TO "ojs-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE email_templates_default_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_templates_default_email_id_seq OWNER TO "ojs-ci";

--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE email_templates_default_email_id_seq OWNED BY email_templates_default.email_id;


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE email_templates_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_templates_email_id_seq OWNER TO "ojs-ci";

--
-- Name: email_templates_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE email_templates_email_id_seq OWNED BY email_templates.email_id;


--
-- Name: event_log; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE event_log (
    log_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    user_id bigint NOT NULL,
    date_logged timestamp without time zone NOT NULL,
    ip_address character varying(39) NOT NULL,
    event_type bigint,
    message text,
    is_translated smallint
);


ALTER TABLE event_log OWNER TO "ojs-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE event_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE event_log_log_id_seq OWNER TO "ojs-ci";

--
-- Name: event_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE event_log_log_id_seq OWNED BY event_log.log_id;


--
-- Name: event_log_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE event_log_settings (
    log_id bigint NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE event_log_settings OWNER TO "ojs-ci";

--
-- Name: external_feed_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE external_feed_settings (
    feed_id bigint NOT NULL,
    locale character varying(5) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE external_feed_settings OWNER TO "ojs-ci";

--
-- Name: external_feeds; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE external_feeds (
    feed_id integer NOT NULL,
    journal_id bigint NOT NULL,
    url character varying(2047) NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    display_homepage smallint DEFAULT 0 NOT NULL,
    display_block smallint DEFAULT 0 NOT NULL,
    limit_items smallint DEFAULT 0,
    recent_items smallint
);


ALTER TABLE external_feeds OWNER TO "ojs-ci";

--
-- Name: external_feeds_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE external_feeds_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE external_feeds_feed_id_seq OWNER TO "ojs-ci";

--
-- Name: external_feeds_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE external_feeds_feed_id_seq OWNED BY external_feeds.feed_id;


--
-- Name: filter_groups; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE filter_groups (
    filter_group_id integer NOT NULL,
    symbolic character varying(255),
    display_name character varying(255),
    description character varying(255),
    input_type character varying(255),
    output_type character varying(255)
);


ALTER TABLE filter_groups OWNER TO "ojs-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE filter_groups_filter_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filter_groups_filter_group_id_seq OWNER TO "ojs-ci";

--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE filter_groups_filter_group_id_seq OWNED BY filter_groups.filter_group_id;


--
-- Name: filter_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE filter_settings (
    filter_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE filter_settings OWNER TO "ojs-ci";

--
-- Name: filters; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE filters (
    filter_id integer NOT NULL,
    filter_group_id bigint DEFAULT 0 NOT NULL,
    context_id bigint DEFAULT 0 NOT NULL,
    display_name character varying(255),
    class_name character varying(255),
    is_template smallint DEFAULT 0 NOT NULL,
    parent_filter_id bigint DEFAULT 0 NOT NULL,
    seq bigint DEFAULT 0 NOT NULL
);


ALTER TABLE filters OWNER TO "ojs-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE filters_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filters_filter_id_seq OWNER TO "ojs-ci";

--
-- Name: filters_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE filters_filter_id_seq OWNED BY filters.filter_id;


--
-- Name: genre_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE genre_settings (
    genre_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE genre_settings OWNER TO "ojs-ci";

--
-- Name: genres; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    context_id bigint NOT NULL,
    seq bigint,
    sortable smallint DEFAULT 1 NOT NULL,
    enabled smallint DEFAULT 1 NOT NULL,
    category bigint DEFAULT 1 NOT NULL,
    dependent smallint DEFAULT 0 NOT NULL,
    supplementary smallint DEFAULT 0,
    entry_key character varying(30)
);


ALTER TABLE genres OWNER TO "ojs-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genre_id_seq OWNER TO "ojs-ci";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE genres_genre_id_seq OWNED BY genres.genre_id;


--
-- Name: institutional_subscription_ip; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE institutional_subscription_ip (
    institutional_subscription_ip_id integer NOT NULL,
    subscription_id bigint NOT NULL,
    ip_string character varying(40) NOT NULL,
    ip_start bigint NOT NULL,
    ip_end bigint
);


ALTER TABLE institutional_subscription_ip OWNER TO "ojs-ci";

--
-- Name: institutional_subscription_ip_institutional_subscription_ip_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE institutional_subscription_ip_institutional_subscription_ip_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE institutional_subscription_ip_institutional_subscription_ip_seq OWNER TO "ojs-ci";

--
-- Name: institutional_subscription_ip_institutional_subscription_ip_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE institutional_subscription_ip_institutional_subscription_ip_seq OWNED BY institutional_subscription_ip.institutional_subscription_ip_id;


--
-- Name: institutional_subscriptions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE institutional_subscriptions (
    institutional_subscription_id integer NOT NULL,
    subscription_id bigint NOT NULL,
    institution_name character varying(255) NOT NULL,
    mailing_address character varying(255),
    domain character varying(255)
);


ALTER TABLE institutional_subscriptions OWNER TO "ojs-ci";

--
-- Name: institutional_subscriptions_institutional_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE institutional_subscriptions_institutional_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE institutional_subscriptions_institutional_subscription_id_seq OWNER TO "ojs-ci";

--
-- Name: institutional_subscriptions_institutional_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE institutional_subscriptions_institutional_subscription_id_seq OWNED BY institutional_subscriptions.institutional_subscription_id;


--
-- Name: issue_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE issue_files (
    file_id integer NOT NULL,
    issue_id bigint NOT NULL,
    file_name character varying(90) NOT NULL,
    file_type character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    content_type bigint NOT NULL,
    original_file_name character varying(127),
    date_uploaded timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE issue_files OWNER TO "ojs-ci";

--
-- Name: issue_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE issue_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: issue_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE issue_files_file_id_seq OWNED BY issue_files.file_id;


--
-- Name: issue_galley_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE issue_galley_settings (
    galley_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE issue_galley_settings OWNER TO "ojs-ci";

--
-- Name: issue_galleys; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE issue_galleys (
    galley_id integer NOT NULL,
    locale character varying(14),
    issue_id bigint NOT NULL,
    file_id bigint NOT NULL,
    label character varying(32),
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE issue_galleys OWNER TO "ojs-ci";

--
-- Name: issue_galleys_galley_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE issue_galleys_galley_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_galleys_galley_id_seq OWNER TO "ojs-ci";

--
-- Name: issue_galleys_galley_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE issue_galleys_galley_id_seq OWNED BY issue_galleys.galley_id;


--
-- Name: issue_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE issue_settings (
    issue_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE issue_settings OWNER TO "ojs-ci";

--
-- Name: issues; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE issues (
    issue_id integer NOT NULL,
    journal_id bigint NOT NULL,
    volume smallint,
    number character varying(10),
    year smallint,
    published smallint DEFAULT 0 NOT NULL,
    current smallint DEFAULT 0 NOT NULL,
    date_published timestamp without time zone,
    date_notified timestamp without time zone,
    last_modified timestamp without time zone,
    access_status smallint DEFAULT 1 NOT NULL,
    open_access_date timestamp without time zone,
    show_volume smallint DEFAULT 0 NOT NULL,
    show_number smallint DEFAULT 0 NOT NULL,
    show_year smallint DEFAULT 0 NOT NULL,
    show_title smallint DEFAULT 0 NOT NULL,
    style_file_name character varying(90),
    original_style_file_name character varying(255)
);


ALTER TABLE issues OWNER TO "ojs-ci";

--
-- Name: issues_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE issues_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issues_issue_id_seq OWNER TO "ojs-ci";

--
-- Name: issues_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE issues_issue_id_seq OWNED BY issues.issue_id;


--
-- Name: item_views; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE item_views (
    assoc_type bigint NOT NULL,
    assoc_id character varying(32) NOT NULL,
    user_id bigint,
    date_last_viewed timestamp without time zone
);


ALTER TABLE item_views OWNER TO "ojs-ci";

--
-- Name: journal_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE journal_settings (
    journal_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE journal_settings OWNER TO "ojs-ci";

--
-- Name: journals; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE journals (
    journal_id integer NOT NULL,
    path character varying(32) NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    primary_locale character varying(14) NOT NULL,
    enabled smallint DEFAULT 1 NOT NULL
);


ALTER TABLE journals OWNER TO "ojs-ci";

--
-- Name: journals_journal_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE journals_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE journals_journal_id_seq OWNER TO "ojs-ci";

--
-- Name: journals_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE journals_journal_id_seq OWNED BY journals.journal_id;


--
-- Name: library_file_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE library_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE library_file_settings OWNER TO "ojs-ci";

--
-- Name: library_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE library_files (
    file_id integer NOT NULL,
    context_id bigint NOT NULL,
    file_name character varying(255) NOT NULL,
    original_file_name character varying(255) NOT NULL,
    file_type character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    type smallint NOT NULL,
    date_uploaded timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    submission_id bigint NOT NULL
);


ALTER TABLE library_files OWNER TO "ojs-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE library_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE library_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: library_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE library_files_file_id_seq OWNED BY library_files.file_id;


--
-- Name: markup_jobinfos; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE markup_jobinfos (
    id character varying(15) NOT NULL,
    journal_id integer NOT NULL,
    user_id integer NOT NULL,
    file_id integer NOT NULL,
    xml_job_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE markup_jobinfos OWNER TO "ojs-ci";

--
-- Name: metadata_description_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE metadata_description_settings (
    metadata_description_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE metadata_description_settings OWNER TO "ojs-ci";

--
-- Name: metadata_descriptions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE metadata_descriptions (
    metadata_description_id integer NOT NULL,
    assoc_type bigint DEFAULT 0 NOT NULL,
    assoc_id bigint DEFAULT 0 NOT NULL,
    schema_namespace character varying(255) NOT NULL,
    schema_name character varying(255) NOT NULL,
    display_name character varying(255),
    seq bigint DEFAULT 0 NOT NULL
);


ALTER TABLE metadata_descriptions OWNER TO "ojs-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE metadata_descriptions_metadata_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metadata_descriptions_metadata_description_id_seq OWNER TO "ojs-ci";

--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE metadata_descriptions_metadata_description_id_seq OWNED BY metadata_descriptions.metadata_description_id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE metrics (
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


ALTER TABLE metrics OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_assignments; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE navigation_menu_item_assignments (
    navigation_menu_item_assignment_id integer NOT NULL,
    navigation_menu_id bigint NOT NULL,
    navigation_menu_item_id bigint NOT NULL,
    parent_id bigint,
    seq bigint DEFAULT 0
);


ALTER TABLE navigation_menu_item_assignments OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE navigation_menu_item_assignme_navigation_menu_item_assignme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE navigation_menu_item_assignme_navigation_menu_item_assignme_seq OWNED BY navigation_menu_item_assignments.navigation_menu_item_assignment_id;


--
-- Name: navigation_menu_item_assignment_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE navigation_menu_item_assignment_settings (
    navigation_menu_item_assignment_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE navigation_menu_item_assignment_settings OWNER TO "ojs-ci";

--
-- Name: navigation_menu_item_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE navigation_menu_item_settings (
    navigation_menu_item_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE navigation_menu_item_settings OWNER TO "ojs-ci";

--
-- Name: navigation_menu_items; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE navigation_menu_items (
    navigation_menu_item_id integer NOT NULL,
    context_id bigint NOT NULL,
    url character varying(255) DEFAULT ''::character varying,
    path character varying(255) DEFAULT ''::character varying,
    type character varying(255) DEFAULT ''::character varying
);


ALTER TABLE navigation_menu_items OWNER TO "ojs-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE navigation_menu_items_navigation_menu_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE navigation_menu_items_navigation_menu_item_id_seq OWNER TO "ojs-ci";

--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE navigation_menu_items_navigation_menu_item_id_seq OWNED BY navigation_menu_items.navigation_menu_item_id;


--
-- Name: navigation_menus; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE navigation_menus (
    navigation_menu_id integer NOT NULL,
    context_id bigint NOT NULL,
    area_name character varying(255) DEFAULT ''::character varying,
    title character varying(255) NOT NULL
);


ALTER TABLE navigation_menus OWNER TO "ojs-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE navigation_menus_navigation_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE navigation_menus_navigation_menu_id_seq OWNER TO "ojs-ci";

--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE navigation_menus_navigation_menu_id_seq OWNED BY navigation_menus.navigation_menu_id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE notes (
    note_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    user_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone,
    title character varying(255),
    contents text
);


ALTER TABLE notes OWNER TO "ojs-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE notes_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notes_note_id_seq OWNER TO "ojs-ci";

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE notes_note_id_seq OWNED BY notes.note_id;


--
-- Name: notification_mail_list; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE notification_mail_list (
    notification_mail_list_id integer NOT NULL,
    email character varying(90) NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL,
    token character varying(40) NOT NULL,
    context bigint NOT NULL
);


ALTER TABLE notification_mail_list OWNER TO "ojs-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE notification_mail_list_notification_mail_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notification_mail_list_notification_mail_list_id_seq OWNER TO "ojs-ci";

--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE notification_mail_list_notification_mail_list_id_seq OWNED BY notification_mail_list.notification_mail_list_id;


--
-- Name: notification_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE notification_settings (
    notification_id bigint NOT NULL,
    locale character varying(14),
    setting_name character varying(64) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE notification_settings OWNER TO "ojs-ci";

--
-- Name: notification_subscription_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE notification_subscription_settings (
    setting_id integer NOT NULL,
    setting_name character varying(64) NOT NULL,
    setting_value text,
    user_id bigint NOT NULL,
    context bigint NOT NULL,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE notification_subscription_settings OWNER TO "ojs-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE notification_subscription_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notification_subscription_settings_setting_id_seq OWNER TO "ojs-ci";

--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE notification_subscription_settings_setting_id_seq OWNED BY notification_subscription_settings.setting_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE notifications (
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


ALTER TABLE notifications OWNER TO "ojs-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_notification_id_seq OWNER TO "ojs-ci";

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE notifications_notification_id_seq OWNED BY notifications.notification_id;


--
-- Name: oai_resumption_tokens; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE oai_resumption_tokens (
    token character varying(32) NOT NULL,
    expire bigint NOT NULL,
    record_offset integer NOT NULL,
    params text
);


ALTER TABLE oai_resumption_tokens OWNER TO "ojs-ci";

--
-- Name: plugin_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE plugin_settings (
    plugin_name character varying(80) NOT NULL,
    context_id bigint NOT NULL,
    setting_name character varying(80) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE plugin_settings OWNER TO "ojs-ci";

--
-- Name: published_submissions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE published_submissions (
    published_submission_id integer NOT NULL,
    submission_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    date_published timestamp without time zone,
    seq double precision DEFAULT 0 NOT NULL,
    access_status smallint DEFAULT 0 NOT NULL
);


ALTER TABLE published_submissions OWNER TO "ojs-ci";

--
-- Name: published_submissions_published_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE published_submissions_published_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE published_submissions_published_submission_id_seq OWNER TO "ojs-ci";

--
-- Name: published_submissions_published_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE published_submissions_published_submission_id_seq OWNED BY published_submissions.published_submission_id;


--
-- Name: queries; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE queries (
    query_id integer NOT NULL,
    assoc_type bigint NOT NULL,
    assoc_id bigint NOT NULL,
    stage_id smallint DEFAULT 1 NOT NULL,
    seq double precision DEFAULT 0 NOT NULL,
    date_posted timestamp without time zone,
    date_modified timestamp without time zone,
    closed smallint DEFAULT 0 NOT NULL
);


ALTER TABLE queries OWNER TO "ojs-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE queries_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE queries_query_id_seq OWNER TO "ojs-ci";

--
-- Name: queries_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE queries_query_id_seq OWNED BY queries.query_id;


--
-- Name: query_participants; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE query_participants (
    query_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE query_participants OWNER TO "ojs-ci";

--
-- Name: queued_payments; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE queued_payments (
    queued_payment_id integer NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    expiry_date date,
    payment_data text
);


ALTER TABLE queued_payments OWNER TO "ojs-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE queued_payments_queued_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE queued_payments_queued_payment_id_seq OWNER TO "ojs-ci";

--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE queued_payments_queued_payment_id_seq OWNED BY queued_payments.queued_payment_id;


--
-- Name: review_assignments; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_assignments (
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
    replaced smallint DEFAULT 0 NOT NULL,
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


ALTER TABLE review_assignments OWNER TO "ojs-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE review_assignments_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE review_assignments_review_id_seq OWNER TO "ojs-ci";

--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE review_assignments_review_id_seq OWNED BY review_assignments.review_id;


--
-- Name: review_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_files (
    review_id bigint NOT NULL,
    file_id bigint NOT NULL
);


ALTER TABLE review_files OWNER TO "ojs-ci";

--
-- Name: review_form_element_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_form_element_settings (
    review_form_element_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE review_form_element_settings OWNER TO "ojs-ci";

--
-- Name: review_form_elements; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_form_elements (
    review_form_element_id integer NOT NULL,
    review_form_id bigint NOT NULL,
    seq double precision,
    element_type bigint,
    required smallint,
    included smallint
);


ALTER TABLE review_form_elements OWNER TO "ojs-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE review_form_elements_review_form_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE review_form_elements_review_form_element_id_seq OWNER TO "ojs-ci";

--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE review_form_elements_review_form_element_id_seq OWNED BY review_form_elements.review_form_element_id;


--
-- Name: review_form_responses; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_form_responses (
    review_form_element_id bigint NOT NULL,
    review_id bigint NOT NULL,
    response_type character varying(6),
    response_value text
);


ALTER TABLE review_form_responses OWNER TO "ojs-ci";

--
-- Name: review_form_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_form_settings (
    review_form_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE review_form_settings OWNER TO "ojs-ci";

--
-- Name: review_forms; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_forms (
    review_form_id integer NOT NULL,
    assoc_type bigint,
    assoc_id bigint,
    seq double precision,
    is_active smallint
);


ALTER TABLE review_forms OWNER TO "ojs-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE review_forms_review_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE review_forms_review_form_id_seq OWNER TO "ojs-ci";

--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE review_forms_review_form_id_seq OWNED BY review_forms.review_form_id;


--
-- Name: review_round_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_round_files (
    submission_id bigint NOT NULL,
    review_round_id bigint NOT NULL,
    stage_id smallint NOT NULL,
    file_id bigint NOT NULL,
    revision bigint DEFAULT 1 NOT NULL
);


ALTER TABLE review_round_files OWNER TO "ojs-ci";

--
-- Name: review_rounds; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE review_rounds (
    review_round_id integer NOT NULL,
    submission_id bigint NOT NULL,
    stage_id bigint,
    round smallint NOT NULL,
    review_revision bigint,
    status bigint
);


ALTER TABLE review_rounds OWNER TO "ojs-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE review_rounds_review_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE review_rounds_review_round_id_seq OWNER TO "ojs-ci";

--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE review_rounds_review_round_id_seq OWNED BY review_rounds.review_round_id;


--
-- Name: rt_contexts; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE rt_contexts (
    context_id integer NOT NULL,
    version_id bigint NOT NULL,
    title character varying(120) NOT NULL,
    abbrev character varying(32) NOT NULL,
    description text,
    cited_by smallint DEFAULT 0 NOT NULL,
    author_terms smallint DEFAULT 0 NOT NULL,
    define_terms smallint DEFAULT 0 NOT NULL,
    geo_terms smallint DEFAULT 0 NOT NULL,
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE rt_contexts OWNER TO "ojs-ci";

--
-- Name: rt_contexts_context_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE rt_contexts_context_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rt_contexts_context_id_seq OWNER TO "ojs-ci";

--
-- Name: rt_contexts_context_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE rt_contexts_context_id_seq OWNED BY rt_contexts.context_id;


--
-- Name: rt_searches; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE rt_searches (
    search_id integer NOT NULL,
    context_id bigint NOT NULL,
    title character varying(120) NOT NULL,
    description text,
    url text,
    search_url text,
    search_post text,
    seq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE rt_searches OWNER TO "ojs-ci";

--
-- Name: rt_searches_search_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE rt_searches_search_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rt_searches_search_id_seq OWNER TO "ojs-ci";

--
-- Name: rt_searches_search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE rt_searches_search_id_seq OWNED BY rt_searches.search_id;


--
-- Name: rt_versions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE rt_versions (
    version_id integer NOT NULL,
    journal_id bigint NOT NULL,
    version_key character varying(40) NOT NULL,
    locale character varying(14) DEFAULT 'en_US'::character varying,
    title character varying(120) NOT NULL,
    description text
);


ALTER TABLE rt_versions OWNER TO "ojs-ci";

--
-- Name: rt_versions_version_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE rt_versions_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rt_versions_version_id_seq OWNER TO "ojs-ci";

--
-- Name: rt_versions_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE rt_versions_version_id_seq OWNED BY rt_versions.version_id;


--
-- Name: scheduled_tasks; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE scheduled_tasks (
    class_name character varying(255) NOT NULL,
    last_run timestamp without time zone
);


ALTER TABLE scheduled_tasks OWNER TO "ojs-ci";

--
-- Name: section_editors; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE section_editors (
    context_id bigint NOT NULL,
    section_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE section_editors OWNER TO "ojs-ci";

--
-- Name: section_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE section_settings (
    section_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE section_settings OWNER TO "ojs-ci";

--
-- Name: sections; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE sections (
    section_id integer NOT NULL,
    journal_id bigint NOT NULL,
    review_form_id bigint,
    seq double precision DEFAULT 0 NOT NULL,
    editor_restricted smallint DEFAULT 0 NOT NULL,
    meta_indexed smallint DEFAULT 0 NOT NULL,
    meta_reviewed smallint DEFAULT 1 NOT NULL,
    abstracts_not_required smallint DEFAULT 0 NOT NULL,
    hide_title smallint DEFAULT 0 NOT NULL,
    hide_author smallint DEFAULT 0 NOT NULL,
    abstract_word_count bigint
);


ALTER TABLE sections OWNER TO "ojs-ci";

--
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE sections_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sections_section_id_seq OWNER TO "ojs-ci";

--
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE sections_section_id_seq OWNED BY sections.section_id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE sessions (
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


ALTER TABLE sessions OWNER TO "ojs-ci";

--
-- Name: site; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE site (
    redirect bigint DEFAULT 0 NOT NULL,
    primary_locale character varying(14) NOT NULL,
    min_password_length smallint DEFAULT 6 NOT NULL,
    installed_locales character varying(255) DEFAULT 'en_US'::character varying NOT NULL,
    supported_locales character varying(255),
    original_style_file_name character varying(255)
);


ALTER TABLE site OWNER TO "ojs-ci";

--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE site_settings (
    setting_name character varying(255) NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE site_settings OWNER TO "ojs-ci";

--
-- Name: stage_assignments; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE stage_assignments (
    stage_assignment_id integer NOT NULL,
    submission_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_assigned timestamp without time zone NOT NULL,
    recommend_only smallint DEFAULT 0 NOT NULL
);


ALTER TABLE stage_assignments OWNER TO "ojs-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE stage_assignments_stage_assignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stage_assignments_stage_assignment_id_seq OWNER TO "ojs-ci";

--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE stage_assignments_stage_assignment_id_seq OWNED BY stage_assignments.stage_assignment_id;


--
-- Name: static_page_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE static_page_settings (
    static_page_id bigint NOT NULL,
    locale character varying(5) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE static_page_settings OWNER TO "ojs-ci";

--
-- Name: static_pages; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE static_pages (
    static_page_id integer NOT NULL,
    path character varying(255) NOT NULL,
    context_id bigint NOT NULL
);


ALTER TABLE static_pages OWNER TO "ojs-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE static_pages_static_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE static_pages_static_page_id_seq OWNER TO "ojs-ci";

--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE static_pages_static_page_id_seq OWNED BY static_pages.static_page_id;


--
-- Name: submission_artwork_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_artwork_files (
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


ALTER TABLE submission_artwork_files OWNER TO "ojs-ci";

--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_comments (
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


ALTER TABLE submission_comments OWNER TO "ojs-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submission_comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submission_comments_comment_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submission_comments_comment_id_seq OWNED BY submission_comments.comment_id;


--
-- Name: submission_file_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_file_settings (
    file_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE submission_file_settings OWNER TO "ojs-ci";

--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_files (
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
    user_group_id bigint,
    uploader_user_id bigint,
    assoc_type bigint,
    assoc_id bigint
);


ALTER TABLE submission_files OWNER TO "ojs-ci";

--
-- Name: submission_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submission_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submission_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submission_files_file_id_seq OWNED BY submission_files.file_id;


--
-- Name: submission_galley_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_galley_settings (
    galley_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE submission_galley_settings OWNER TO "ojs-ci";

--
-- Name: submission_galleys; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_galleys (
    galley_id integer NOT NULL,
    locale character varying(14),
    submission_id bigint NOT NULL,
    label character varying(255),
    file_id bigint,
    seq double precision DEFAULT 0 NOT NULL,
    remote_url character varying(2047),
    is_approved smallint DEFAULT 0 NOT NULL
);


ALTER TABLE submission_galleys OWNER TO "ojs-ci";

--
-- Name: submission_galleys_galley_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submission_galleys_galley_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submission_galleys_galley_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_galleys_galley_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submission_galleys_galley_id_seq OWNED BY submission_galleys.galley_id;


--
-- Name: submission_search_keyword_list; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_search_keyword_list (
    keyword_id integer NOT NULL,
    keyword_text character varying(60) NOT NULL
);


ALTER TABLE submission_search_keyword_list OWNER TO "ojs-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submission_search_keyword_list_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submission_search_keyword_list_keyword_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submission_search_keyword_list_keyword_id_seq OWNED BY submission_search_keyword_list.keyword_id;


--
-- Name: submission_search_object_keywords; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_search_object_keywords (
    object_id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    pos integer NOT NULL
);


ALTER TABLE submission_search_object_keywords OWNER TO "ojs-ci";

--
-- Name: submission_search_objects; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_search_objects (
    object_id integer NOT NULL,
    submission_id bigint NOT NULL,
    type integer NOT NULL,
    assoc_id bigint
);


ALTER TABLE submission_search_objects OWNER TO "ojs-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submission_search_objects_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submission_search_objects_object_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submission_search_objects_object_id_seq OWNED BY submission_search_objects.object_id;


--
-- Name: submission_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_settings (
    submission_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE submission_settings OWNER TO "ojs-ci";

--
-- Name: submission_supplementary_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_supplementary_files (
    file_id bigint NOT NULL,
    revision bigint NOT NULL
);


ALTER TABLE submission_supplementary_files OWNER TO "ojs-ci";

--
-- Name: submission_tombstones; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submission_tombstones (
    tombstone_id integer NOT NULL,
    submission_id bigint NOT NULL,
    date_deleted timestamp without time zone NOT NULL,
    journal_id bigint NOT NULL,
    section_id bigint NOT NULL,
    set_spec character varying(255) NOT NULL,
    set_name character varying(255) NOT NULL,
    oai_identifier character varying(255) NOT NULL
);


ALTER TABLE submission_tombstones OWNER TO "ojs-ci";

--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submission_tombstones_tombstone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submission_tombstones_tombstone_id_seq OWNER TO "ojs-ci";

--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submission_tombstones_tombstone_id_seq OWNED BY submission_tombstones.tombstone_id;


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE submissions (
    submission_id integer NOT NULL,
    locale character varying(14),
    context_id bigint NOT NULL,
    section_id bigint,
    language character varying(10) DEFAULT 'en'::character varying,
    citations text,
    date_submitted timestamp without time zone,
    last_modified timestamp without time zone,
    date_status_modified timestamp without time zone,
    status smallint DEFAULT 1 NOT NULL,
    submission_progress smallint DEFAULT 1 NOT NULL,
    pages character varying(255),
    hide_author smallint DEFAULT 0 NOT NULL,
    stage_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE submissions OWNER TO "ojs-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE submissions_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submissions_submission_id_seq OWNER TO "ojs-ci";

--
-- Name: submissions_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE submissions_submission_id_seq OWNED BY submissions.submission_id;


--
-- Name: subscription_type_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE subscription_type_settings (
    type_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE subscription_type_settings OWNER TO "ojs-ci";

--
-- Name: subscription_types; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE subscription_types (
    type_id integer NOT NULL,
    journal_id bigint NOT NULL,
    cost double precision NOT NULL,
    currency_code_alpha character varying(3) NOT NULL,
    non_expiring smallint DEFAULT 0 NOT NULL,
    duration smallint,
    format smallint NOT NULL,
    institutional smallint DEFAULT 0 NOT NULL,
    membership smallint DEFAULT 0 NOT NULL,
    disable_public_display smallint NOT NULL,
    seq double precision NOT NULL
);


ALTER TABLE subscription_types OWNER TO "ojs-ci";

--
-- Name: subscription_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE subscription_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscription_types_type_id_seq OWNER TO "ojs-ci";

--
-- Name: subscription_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE subscription_types_type_id_seq OWNED BY subscription_types.type_id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE subscriptions (
    subscription_id integer NOT NULL,
    journal_id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_id bigint NOT NULL,
    date_start date,
    date_end timestamp without time zone,
    status smallint DEFAULT 1 NOT NULL,
    membership character varying(40),
    reference_number character varying(40),
    notes text
);


ALTER TABLE subscriptions OWNER TO "ojs-ci";

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE subscriptions_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscriptions_subscription_id_seq OWNER TO "ojs-ci";

--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE subscriptions_subscription_id_seq OWNED BY subscriptions.subscription_id;


--
-- Name: temporary_files; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE temporary_files (
    file_id integer NOT NULL,
    user_id bigint NOT NULL,
    file_name character varying(90) NOT NULL,
    file_type character varying(255),
    file_size bigint NOT NULL,
    original_file_name character varying(127),
    date_uploaded timestamp without time zone NOT NULL
);


ALTER TABLE temporary_files OWNER TO "ojs-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE temporary_files_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE temporary_files_file_id_seq OWNER TO "ojs-ci";

--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE temporary_files_file_id_seq OWNED BY temporary_files.file_id;


--
-- Name: usage_stats_temporary_records; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE usage_stats_temporary_records (
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


ALTER TABLE usage_stats_temporary_records OWNER TO "ojs-ci";

--
-- Name: user_group_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE user_group_settings (
    user_group_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE user_group_settings OWNER TO "ojs-ci";

--
-- Name: user_group_stage; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE user_group_stage (
    context_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    stage_id bigint NOT NULL
);


ALTER TABLE user_group_stage OWNER TO "ojs-ci";

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE user_groups (
    user_group_id integer NOT NULL,
    context_id bigint NOT NULL,
    role_id bigint NOT NULL,
    is_default smallint DEFAULT 0 NOT NULL,
    show_title smallint DEFAULT 1 NOT NULL,
    permit_self_registration smallint DEFAULT 0 NOT NULL
);


ALTER TABLE user_groups OWNER TO "ojs-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE user_groups_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_groups_user_group_id_seq OWNER TO "ojs-ci";

--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE user_groups_user_group_id_seq OWNED BY user_groups.user_group_id;


--
-- Name: user_interests; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE user_interests (
    user_id bigint NOT NULL,
    controlled_vocab_entry_id bigint NOT NULL
);


ALTER TABLE user_interests OWNER TO "ojs-ci";

--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE user_settings (
    user_id bigint NOT NULL,
    locale character varying(14) DEFAULT ''::character varying NOT NULL,
    setting_name character varying(255) NOT NULL,
    assoc_type bigint DEFAULT 0,
    assoc_id bigint DEFAULT 0,
    setting_value text,
    setting_type character varying(6) NOT NULL
);


ALTER TABLE user_settings OWNER TO "ojs-ci";

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE user_user_groups (
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE user_user_groups OWNER TO "ojs-ci";

--
-- Name: users; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(255) NOT NULL,
    salutation character varying(255),
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    last_name character varying(255) NOT NULL,
    suffix character varying(255),
    gender character varying(1),
    initials character varying(5),
    email character varying(255) NOT NULL,
    url character varying(2047),
    phone character varying(32),
    mailing_address character varying(255),
    billing_address character varying(255),
    country character varying(90),
    locales character varying(255),
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


ALTER TABLE users OWNER TO "ojs-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ojs-ci
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO "ojs-ci";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ojs-ci
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE TABLE versions (
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


ALTER TABLE versions OWNER TO "ojs-ci";

--
-- Name: access_key_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY access_keys ALTER COLUMN access_key_id SET DEFAULT nextval('access_keys_access_key_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY announcement_types ALTER COLUMN type_id SET DEFAULT nextval('announcement_types_type_id_seq'::regclass);


--
-- Name: announcement_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY announcements ALTER COLUMN announcement_id SET DEFAULT nextval('announcements_announcement_id_seq'::regclass);


--
-- Name: auth_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY auth_sources ALTER COLUMN auth_id SET DEFAULT nextval('auth_sources_auth_id_seq'::regclass);


--
-- Name: author_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY authors ALTER COLUMN author_id SET DEFAULT nextval('authors_author_id_seq'::regclass);


--
-- Name: citation_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY citations ALTER COLUMN citation_id SET DEFAULT nextval('citations_citation_id_seq'::regclass);


--
-- Name: completed_payment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY completed_payments ALTER COLUMN completed_payment_id SET DEFAULT nextval('completed_payments_completed_payment_id_seq'::regclass);


--
-- Name: controlled_vocab_entry_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY controlled_vocab_entries ALTER COLUMN controlled_vocab_entry_id SET DEFAULT nextval('controlled_vocab_entries_controlled_vocab_entry_id_seq'::regclass);


--
-- Name: controlled_vocab_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY controlled_vocabs ALTER COLUMN controlled_vocab_id SET DEFAULT nextval('controlled_vocabs_controlled_vocab_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY data_object_tombstone_oai_set_objects ALTER COLUMN object_id SET DEFAULT nextval('data_object_tombstone_oai_set_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY data_object_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('data_object_tombstones_tombstone_id_seq'::regclass);


--
-- Name: edit_decision_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY edit_decisions ALTER COLUMN edit_decision_id SET DEFAULT nextval('edit_decisions_edit_decision_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY email_log ALTER COLUMN log_id SET DEFAULT nextval('email_log_log_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY email_templates ALTER COLUMN email_id SET DEFAULT nextval('email_templates_email_id_seq'::regclass);


--
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY email_templates_default ALTER COLUMN email_id SET DEFAULT nextval('email_templates_default_email_id_seq'::regclass);


--
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY event_log ALTER COLUMN log_id SET DEFAULT nextval('event_log_log_id_seq'::regclass);


--
-- Name: feed_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY external_feeds ALTER COLUMN feed_id SET DEFAULT nextval('external_feeds_feed_id_seq'::regclass);


--
-- Name: filter_group_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY filter_groups ALTER COLUMN filter_group_id SET DEFAULT nextval('filter_groups_filter_group_id_seq'::regclass);


--
-- Name: filter_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY filters ALTER COLUMN filter_id SET DEFAULT nextval('filters_filter_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY genres ALTER COLUMN genre_id SET DEFAULT nextval('genres_genre_id_seq'::regclass);


--
-- Name: institutional_subscription_ip_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY institutional_subscription_ip ALTER COLUMN institutional_subscription_ip_id SET DEFAULT nextval('institutional_subscription_ip_institutional_subscription_ip_seq'::regclass);


--
-- Name: institutional_subscription_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY institutional_subscriptions ALTER COLUMN institutional_subscription_id SET DEFAULT nextval('institutional_subscriptions_institutional_subscription_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY issue_files ALTER COLUMN file_id SET DEFAULT nextval('issue_files_file_id_seq'::regclass);


--
-- Name: galley_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY issue_galleys ALTER COLUMN galley_id SET DEFAULT nextval('issue_galleys_galley_id_seq'::regclass);


--
-- Name: issue_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY issues ALTER COLUMN issue_id SET DEFAULT nextval('issues_issue_id_seq'::regclass);


--
-- Name: journal_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY journals ALTER COLUMN journal_id SET DEFAULT nextval('journals_journal_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY library_files ALTER COLUMN file_id SET DEFAULT nextval('library_files_file_id_seq'::regclass);


--
-- Name: metadata_description_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY metadata_descriptions ALTER COLUMN metadata_description_id SET DEFAULT nextval('metadata_descriptions_metadata_description_id_seq'::regclass);


--
-- Name: navigation_menu_item_assignment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY navigation_menu_item_assignments ALTER COLUMN navigation_menu_item_assignment_id SET DEFAULT nextval('navigation_menu_item_assignme_navigation_menu_item_assignme_seq'::regclass);


--
-- Name: navigation_menu_item_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY navigation_menu_items ALTER COLUMN navigation_menu_item_id SET DEFAULT nextval('navigation_menu_items_navigation_menu_item_id_seq'::regclass);


--
-- Name: navigation_menu_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY navigation_menus ALTER COLUMN navigation_menu_id SET DEFAULT nextval('navigation_menus_navigation_menu_id_seq'::regclass);


--
-- Name: note_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY notes ALTER COLUMN note_id SET DEFAULT nextval('notes_note_id_seq'::regclass);


--
-- Name: notification_mail_list_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY notification_mail_list ALTER COLUMN notification_mail_list_id SET DEFAULT nextval('notification_mail_list_notification_mail_list_id_seq'::regclass);


--
-- Name: setting_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY notification_subscription_settings ALTER COLUMN setting_id SET DEFAULT nextval('notification_subscription_settings_setting_id_seq'::regclass);


--
-- Name: notification_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY notifications ALTER COLUMN notification_id SET DEFAULT nextval('notifications_notification_id_seq'::regclass);


--
-- Name: published_submission_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY published_submissions ALTER COLUMN published_submission_id SET DEFAULT nextval('published_submissions_published_submission_id_seq'::regclass);


--
-- Name: query_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY queries ALTER COLUMN query_id SET DEFAULT nextval('queries_query_id_seq'::regclass);


--
-- Name: queued_payment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY queued_payments ALTER COLUMN queued_payment_id SET DEFAULT nextval('queued_payments_queued_payment_id_seq'::regclass);


--
-- Name: review_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY review_assignments ALTER COLUMN review_id SET DEFAULT nextval('review_assignments_review_id_seq'::regclass);


--
-- Name: review_form_element_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY review_form_elements ALTER COLUMN review_form_element_id SET DEFAULT nextval('review_form_elements_review_form_element_id_seq'::regclass);


--
-- Name: review_form_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY review_forms ALTER COLUMN review_form_id SET DEFAULT nextval('review_forms_review_form_id_seq'::regclass);


--
-- Name: review_round_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY review_rounds ALTER COLUMN review_round_id SET DEFAULT nextval('review_rounds_review_round_id_seq'::regclass);


--
-- Name: context_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY rt_contexts ALTER COLUMN context_id SET DEFAULT nextval('rt_contexts_context_id_seq'::regclass);


--
-- Name: search_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY rt_searches ALTER COLUMN search_id SET DEFAULT nextval('rt_searches_search_id_seq'::regclass);


--
-- Name: version_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY rt_versions ALTER COLUMN version_id SET DEFAULT nextval('rt_versions_version_id_seq'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY sections ALTER COLUMN section_id SET DEFAULT nextval('sections_section_id_seq'::regclass);


--
-- Name: stage_assignment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY stage_assignments ALTER COLUMN stage_assignment_id SET DEFAULT nextval('stage_assignments_stage_assignment_id_seq'::regclass);


--
-- Name: static_page_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY static_pages ALTER COLUMN static_page_id SET DEFAULT nextval('static_pages_static_page_id_seq'::regclass);


--
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submission_comments ALTER COLUMN comment_id SET DEFAULT nextval('submission_comments_comment_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submission_files ALTER COLUMN file_id SET DEFAULT nextval('submission_files_file_id_seq'::regclass);


--
-- Name: galley_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submission_galleys ALTER COLUMN galley_id SET DEFAULT nextval('submission_galleys_galley_id_seq'::regclass);


--
-- Name: keyword_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submission_search_keyword_list ALTER COLUMN keyword_id SET DEFAULT nextval('submission_search_keyword_list_keyword_id_seq'::regclass);


--
-- Name: object_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submission_search_objects ALTER COLUMN object_id SET DEFAULT nextval('submission_search_objects_object_id_seq'::regclass);


--
-- Name: tombstone_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submission_tombstones ALTER COLUMN tombstone_id SET DEFAULT nextval('submission_tombstones_tombstone_id_seq'::regclass);


--
-- Name: submission_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY submissions ALTER COLUMN submission_id SET DEFAULT nextval('submissions_submission_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY subscription_types ALTER COLUMN type_id SET DEFAULT nextval('subscription_types_type_id_seq'::regclass);


--
-- Name: subscription_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY subscriptions ALTER COLUMN subscription_id SET DEFAULT nextval('subscriptions_subscription_id_seq'::regclass);


--
-- Name: file_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY temporary_files ALTER COLUMN file_id SET DEFAULT nextval('temporary_files_file_id_seq'::regclass);


--
-- Name: user_group_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY user_groups ALTER COLUMN user_group_id SET DEFAULT nextval('user_groups_user_group_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: ojs-ci
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: access_keys; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY access_keys (access_key_id, context, key_hash, user_id, assoc_id, expiry_date) FROM stdin;
\.


--
-- Name: access_keys_access_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('access_keys_access_key_id_seq', 1, false);


--
-- Data for Name: announcement_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY announcement_settings (announcement_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_type_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY announcement_type_settings (type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: announcement_types; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY announcement_types (type_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: announcement_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('announcement_types_type_id_seq', 1, false);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY announcements (announcement_id, assoc_type, assoc_id, type_id, date_expire, date_posted) FROM stdin;
\.


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('announcements_announcement_id_seq', 1, false);


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY auth_sources (auth_id, title, plugin, auth_default, settings) FROM stdin;
\.


--
-- Name: auth_sources_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('auth_sources_auth_id_seq', 1, false);


--
-- Data for Name: author_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY author_settings (author_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	affiliation	University of Bologna	string
7	en_US	affiliation	University College Cork	string
26	en_US	affiliation	University of Tehran	string
2	en_US	affiliation	University of Windsor	string
19	en_US	affiliation	Stanford University	string
20	en_US	biography		string
20	en_US	affiliation	Stanford University	string
20		orcid		string
8	en_US	affiliation	Indiana University	string
9	en_US	biography		string
3	en_US	affiliation	University of Alberta	string
4	en_US	biography		string
4	en_US	affiliation	University of Victoria	string
4		orcid		string
9	en_US	affiliation	Indiana University	string
9		orcid		string
27	en_US	affiliation	University of Windsor	string
5	en_US	affiliation	Alexandria University	string
21	en_US	affiliation	Australian National University	string
10	en_US	affiliation	University of Rome	string
11	en_US	affiliation	Colorado State University	string
12	en_US	affiliation	University of Oslo	string
13	en_US	affiliation	Chapman University	string
6	en_US	affiliation	University of Toronto	string
14	en_US	affiliation	Universidade Aberta Lisboa	string
15	en_US	affiliation	Keele University	string
16	en_US	affiliation	Bangalore University	string
28	en_US	affiliation	CUNY	string
22	en_US	affiliation	University of Cape Town	string
17	en_US	affiliation	University of Cape Town	string
23	en_US	affiliation	University of Wolverhampton	string
18	en_US	affiliation	Aalborg University	string
24	en_US	affiliation	University of Nairobi	string
25	en_US	affiliation	Barcelona University	string
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY authors (author_id, submission_id, primary_contact, seq, first_name, middle_name, last_name, suffix, country, email, url, user_group_id, include_in_browse) FROM stdin;
28	25	1	1	Zita		Woods		US	zwoods@mailinator.com	\N	14	1
19	17	1	1	Karim		Al-Khafaji		US	kalkhafaji@mailinator.com	\N	14	1
20	17	0	2	Margaret		Morse		US	mmorse@mailinator.com		14	1
2	2	1	1	Catherine		Kwantes		CA	ckwantes@mailinator.com	\N	14	1
6	5	1	1	Dana		Phillips		CA	dphillips@mailinator.com	\N	14	1
10	8	1	1	Fabio		Paglieri		IT	fpaglieri@mailinator.com	\N	14	1
8	7	1	1	Elinor		Ostrom		US	eostrom@mailinator.com	\N	14	1
9	7	0	2	Frank		van Laerhoven		US	fvanlaerhoven@mailinator.com		14	1
5	4	1	1	Diaga		Diouf		EG	ddiouf@mailinator.com	\N	14	1
11	9	1	1	June		Forcht		US	jforcht@mailinator.com	\N	14	1
23	20	1	1	Patricia		Daniel		GB	pdaniel@mailinator.com	\N	14	1
1	1	1	1	Carlo		Corino		IT	ccorino@mailinator.com	\N	14	1
12	10	1	1	Brian		Vemer		NO	bvemer@mailinator.com	\N	14	1
3	3	1	1	Craig		Montgomerie		CA	cmontgomerie@mailinator.com	\N	14	1
4	3	0	2	Mark		Irvine		CA	mirvine@mailinator.com		14	1
26	23	1	1	Vajiheh		Karbasizaed		IR	vkarbasizaed@mailinator.com	\N	14	1
13	11	1	1	Karen		Bauman		US	kbauman@mailinator.com	\N	14	1
14	12	1	1	Roy		Cerpa		PT	rcerpa@mailinator.com	\N	14	1
15	13	1	1	Narciso		Pierson		GB	npierson@mailinator.com	\N	14	1
24	21	1	1	Rana		Baiyewu		KE	rbaiyewu@mailinator.com	\N	14	1
18	16	1	1	John		Novak		DK	jnovak@mailinator.com	\N	14	1
16	14	1	1	Raj		Yagna		IN	ryagna@mailinator.com	\N	14	1
7	6	1	1	Domatilia		Sokoloff		IE	dsokoloff@mailinator.com	\N	14	1
17	15	1	1	John		Mwandenga		ZA	jmwandenga@mailinator.com	\N	14	1
21	18	1	1	Leo		Christopher		AU	lchristopher@mailinator.com	\N	14	1
22	19	1	1	Lise		Kumiega		ZA	lkumiega@mailinator.com	\N	14	1
27	24	1	1	Valerie		Williamson		CA	vwilliamson@mailinator.com	\N	14	1
25	22	1	1	Rosanna		Rossi		ES	rrossi@mailinator.com	\N	14	1
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('authors_author_id_seq', 28, true);


--
-- Data for Name: citation_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY citation_settings (citation_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: citations; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY citations (citation_id, assoc_type, assoc_id, citation_state, raw_citation, seq, lock_id) FROM stdin;
\.


--
-- Name: citations_citation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('citations_citation_id_seq', 1, false);


--
-- Data for Name: completed_payments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY completed_payments (completed_payment_id, "timestamp", payment_type, context_id, user_id, assoc_id, amount, currency_code_alpha, payment_method_plugin_name) FROM stdin;
\.


--
-- Name: completed_payments_completed_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('completed_payments_completed_payment_id_seq', 1, false);


--
-- Data for Name: controlled_vocab_entries; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY controlled_vocab_entries (controlled_vocab_entry_id, controlled_vocab_id, seq) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	1
6	2	2
7	2	3
8	2	4
9	2	5
10	2	6
11	2	7
12	3	1
13	3	2
14	3	3
15	3	4
16	3	5
17	3	6
18	3	7
19	4	1
20	4	2
21	4	3
22	5	1
23	5	2
24	5	3
25	5	4
26	5	5
27	5	6
28	5	7
29	6	1
30	6	2
31	6	3
32	7	1
33	7	2
34	7	3
35	7	4
36	7	5
37	7	6
38	7	7
39	7	8
40	7	9
41	7	10
42	7	11
43	7	12
44	8	1
45	8	2
46	26	1
47	26	2
48	37	1
49	37	2
50	66	1
51	66	2
52	66	3
53	66	4
54	66	5
55	66	6
56	66	7
57	135	1
58	135	2
59	170	1
60	170	2
61	170	3
62	245	1
63	274	1
64	274	2
65	274	3
66	274	4
67	285	1
68	285	2
69	314	1
70	349	1
71	349	2
72	349	3
73	349	4
74	349	5
75	349	6
76	349	7
77	349	8
78	349	9
79	349	10
80	389	1
81	389	2
82	429	1
83	429	2
84	429	3
\.


--
-- Name: controlled_vocab_entries_controlled_vocab_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('controlled_vocab_entries_controlled_vocab_entry_id_seq', 84, true);


--
-- Data for Name: controlled_vocab_entry_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY controlled_vocab_entry_settings (controlled_vocab_entry_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		name	journal	string
2		name	book	string
3		name	conf-proc	string
4		name	thesis	string
5		name	journal	string
6		name	issue	string
7		name	article	string
8		name	proceeding	string
9		name	conference	string
10		name	preprint	string
11		name	unknown	string
12		name	book	string
13		name	bookitem	string
14		name	proceeding	string
15		name	conference	string
16		name	report	string
17		name	document	string
18		name	unknown	string
19		name	personal	string
20		name	corporate	string
21		name	conference	string
22		name	aut	string
22		description	Author	string
23		name	ctb	string
23		description	Contributor	string
24		name	edt	string
24		description	Editor	string
25		name	ill	string
25		description	Illustrator	string
26		name	pht	string
26		description	Photographer	string
27		name	spn	string
27		description	Sponsor	string
28		name	trl	string
28		description	Translator	string
29		name	multimedia	string
30		name	still image	string
31		name	text	string
32		name	article	string
33		name	book	string
34		name	conference publication	string
35		name	issue	string
36		name	journal	string
37		name	newspaper	string
38		name	picture	string
39		name	review	string
40		name	periodical	string
41		name	series	string
42		name	thesis	string
43		name	web site	string
44		name	electronic	string
45		name	print	string
46	en_US	submissionKeyword	pigs	string
47	en_US	submissionKeyword	food security	string
48	en_US	submissionKeyword	employees	string
49	en_US	submissionKeyword	survey	string
50	en_US	submissionKeyword	Integrating Technology	string
51	en_US	submissionKeyword	Computer Skills	string
52	en_US	submissionKeyword	Survey	string
53	en_US	submissionKeyword	Alberta	string
54	en_US	submissionKeyword	National	string
55	en_US	submissionKeyword	Provincial	string
56	en_US	submissionKeyword	Professional Development	string
57	en_US	submissionKeyword	education	string
58	en_US	submissionKeyword	citizenship	string
59	en_US	submissionKeyword	Common pool resource	string
60	en_US	submissionKeyword	common property	string
61	en_US	submissionKeyword	intellectual developments	string
62	en_US	submissionKeyword	water	string
63	en_US	submissionKeyword	Development	string
64	en_US	submissionKeyword	engineering education	string
65	en_US	submissionKeyword	service learning	string
66	en_US	submissionKeyword	sustainability	string
67	en_US	submissionKeyword	pigs	string
68	en_US	submissionKeyword	food security	string
69	en_US	submissionKeyword	water	string
70	en_US	submissionKeyword	21st Century	string
71	en_US	submissionKeyword	Diversity	string
72	en_US	submissionKeyword	Multilingual	string
73	en_US	submissionKeyword	Multiethnic	string
74	en_US	submissionKeyword	Participatory Pedagogy	string
75	en_US	submissionKeyword	Language	string
76	en_US	submissionKeyword	Culture	string
77	en_US	submissionKeyword	Gender	string
78	en_US	submissionKeyword	Egalitarianism	string
79	en_US	submissionKeyword	Social Transformation	string
80	en_US	submissionKeyword	cattle	string
81	en_US	submissionKeyword	food security	string
82	en_US	submissionKeyword	Self-Organization	string
83	en_US	submissionKeyword	Multi-Level Institutions	string
84	en_US	submissionKeyword	Goverance	string
\.


--
-- Data for Name: controlled_vocabs; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY controlled_vocabs (controlled_vocab_id, symbolic, assoc_type, assoc_id) FROM stdin;
1	nlm30-publication-types	0	0
2	openurl10-journal-genres	0	0
3	openurl10-book-genres	0	0
4	mods34-name-types	0	0
5	mods34-name-role-roleTerms-marcrelator	0	0
6	mods34-typeOfResource	0	0
7	mods34-genre-marcgt	0	0
8	mods34-physicalDescription-form-marcform	0	0
9	interest	0	0
439	submissionSubject	1048585	25
169	submissionSubject	1048585	7
170	submissionKeyword	1048585	7
171	submissionDiscipline	1048585	7
172	submissionAgency	1048585	7
173	submissionLanguage	1048585	7
244	submissionSubject	1048585	16
245	submissionKeyword	1048585	16
246	submissionDiscipline	1048585	16
247	submissionAgency	1048585	16
248	submissionLanguage	1048585	16
440	submissionKeyword	1048585	25
180	submissionSubject	1048585	8
181	submissionKeyword	1048585	8
182	submissionDiscipline	1048585	8
25	submissionSubject	1048585	1
26	submissionKeyword	1048585	1
27	submissionDiscipline	1048585	1
28	submissionAgency	1048585	1
29	submissionLanguage	1048585	1
183	submissionAgency	1048585	8
184	submissionLanguage	1048585	8
441	submissionDiscipline	1048585	25
442	submissionAgency	1048585	25
105	submissionSubject	1048585	5
106	submissionKeyword	1048585	5
36	submissionSubject	1048585	2
37	submissionKeyword	1048585	2
38	submissionDiscipline	1048585	2
39	submissionAgency	1048585	2
40	submissionLanguage	1048585	2
107	submissionDiscipline	1048585	5
108	submissionAgency	1048585	5
109	submissionLanguage	1048585	5
443	submissionLanguage	1048585	25
359	submissionSubject	1048585	21
360	submissionKeyword	1048585	21
361	submissionDiscipline	1048585	21
362	submissionAgency	1048585	21
363	submissionLanguage	1048585	21
467	submissionKeyword	1048585	9
65	submissionSubject	1048585	3
66	submissionKeyword	1048585	3
67	submissionDiscipline	1048585	3
68	submissionAgency	1048585	3
69	submissionLanguage	1048585	3
273	submissionSubject	1048585	17
209	submissionSubject	1048585	15
210	submissionKeyword	1048585	15
134	submissionSubject	1048585	6
135	submissionKeyword	1048585	6
136	submissionDiscipline	1048585	6
76	submissionSubject	1048585	4
77	submissionKeyword	1048585	4
78	submissionDiscipline	1048585	4
79	submissionAgency	1048585	4
80	submissionLanguage	1048585	4
137	submissionAgency	1048585	6
138	submissionLanguage	1048585	6
211	submissionDiscipline	1048585	15
212	submissionAgency	1048585	15
213	submissionLanguage	1048585	15
274	submissionKeyword	1048585	17
275	submissionDiscipline	1048585	17
276	submissionAgency	1048585	17
277	submissionLanguage	1048585	17
284	submissionSubject	1048585	18
285	submissionKeyword	1048585	18
286	submissionDiscipline	1048585	18
287	submissionAgency	1048585	18
288	submissionLanguage	1048585	18
399	submissionSubject	1048585	23
400	submissionKeyword	1048585	23
401	submissionDiscipline	1048585	23
402	submissionAgency	1048585	23
403	submissionLanguage	1048585	23
348	submissionSubject	1048585	20
313	submissionSubject	1048585	19
314	submissionKeyword	1048585	19
315	submissionDiscipline	1048585	19
316	submissionAgency	1048585	19
317	submissionLanguage	1048585	19
349	submissionKeyword	1048585	20
350	submissionDiscipline	1048585	20
351	submissionAgency	1048585	20
352	submissionLanguage	1048585	20
388	submissionSubject	1048585	22
389	submissionKeyword	1048585	22
390	submissionDiscipline	1048585	22
391	submissionAgency	1048585	22
392	submissionLanguage	1048585	22
428	submissionSubject	1048585	24
429	submissionKeyword	1048585	24
430	submissionDiscipline	1048585	24
431	submissionAgency	1048585	24
432	submissionLanguage	1048585	24
\.


--
-- Name: controlled_vocabs_controlled_vocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('controlled_vocabs_controlled_vocab_id_seq', 469, true);


--
-- Data for Name: custom_issue_orders; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY custom_issue_orders (issue_id, journal_id, seq) FROM stdin;
\.


--
-- Data for Name: custom_section_orders; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY custom_section_orders (issue_id, section_id, seq) FROM stdin;
\.


--
-- Data for Name: data_object_tombstone_oai_set_objects; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY data_object_tombstone_oai_set_objects (object_id, tombstone_id, assoc_type, assoc_id) FROM stdin;
\.


--
-- Name: data_object_tombstone_oai_set_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('data_object_tombstone_oai_set_objects_object_id_seq', 1, false);


--
-- Data for Name: data_object_tombstone_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY data_object_tombstone_settings (tombstone_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: data_object_tombstones; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY data_object_tombstones (tombstone_id, data_object_id, date_deleted, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Name: data_object_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('data_object_tombstones_tombstone_id_seq', 1, false);


--
-- Data for Name: edit_decisions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY edit_decisions (edit_decision_id, submission_id, review_round_id, stage_id, round, editor_id, decision, date_decided) FROM stdin;
1	1	0	1	0	3	8	2017-10-24 17:44:00
2	1	1	3	1	6	11	2017-10-24 17:44:29
3	2	0	1	0	3	8	2017-10-24 17:45:31
4	2	2	3	1	3	1	2017-10-24 17:45:56
5	4	0	1	0	3	8	2017-10-24 17:47:32
6	4	3	3	1	3	1	2017-10-24 17:48:01
7	4	0	4	0	3	7	2017-10-24 17:48:17
8	5	0	1	0	3	8	2017-10-24 17:49:13
9	5	4	3	1	3	1	2017-10-24 17:49:35
10	5	0	4	0	3	7	2017-10-24 17:49:48
11	6	0	1	0	3	8	2017-10-24 17:50:39
12	8	0	1	0	3	8	2017-10-24 17:52:48
13	8	6	3	1	3	1	2017-10-24 17:53:10
14	8	0	4	0	3	7	2017-10-24 17:53:27
15	15	0	1	0	3	8	2017-10-24 17:54:45
16	15	7	3	1	3	1	2017-10-24 17:55:12
17	15	0	4	0	3	7	2017-10-24 17:55:25
18	16	0	1	0	3	8	2017-10-24 17:56:47
19	18	0	1	0	3	8	2017-10-24 17:59:25
20	19	0	1	0	3	8	2017-10-24 18:01:03
21	19	10	3	1	3	2	2017-10-24 18:03:50
22	21	0	1	0	3	8	2017-10-24 18:05:19
23	21	11	3	1	3	1	2017-10-24 18:05:42
24	21	0	4	0	3	7	2017-10-24 18:05:58
25	23	0	1	0	3	8	2017-10-24 18:07:37
26	23	12	3	1	3	1	2017-10-24 18:07:59
27	23	0	4	0	3	7	2017-10-24 18:08:17
28	24	0	1	0	3	9	2017-10-24 18:09:54
29	25	0	1	0	3	8	2017-10-24 18:10:48
30	25	13	3	1	3	1	2017-10-24 18:11:17
\.


--
-- Name: edit_decisions_edit_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('edit_decisions_edit_decision_id_seq', 30, true);


--
-- Data for Name: email_log; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY email_log (log_id, assoc_type, assoc_id, sender_id, date_sent, ip_address, event_type, from_address, recipients, cc_recipients, bcc_recipients, subject, body) FROM stdin;
1	1048585	1	17	2017-10-24 17:43:40	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Carlo Corino" <ccorino@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Carlo Corino:<br />\n<br />\nThank you for submitting the manuscript, &quot;The influence of lactation on the quantity and quality of cashmere production&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/1' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/1</a><br />\nUsername: ccorino<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
2	1048585	1	6	2017-10-24 17:44:29	::1	805306372	"Minoti Inoue" <minoue@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>	\N	\N	[publicknowledge] Editor Recommendation	<p>Daniel Barnes, David Buskins, Stephanie Berardo:<br> <br> The recommendation regarding the submission to Journal of Public Knowledge, "The influence of lactation on the quantity and quality of cashmere production" is: Accept Submission<br> <br> Minoti Inoue<br>Kyoto University<br>minoue@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
3	1048585	2	18	2017-10-24 17:45:15	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Catherine Kwantes:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/2' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/2</a><br />\nUsername: ckwantes<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
4	1048585	2	3	2017-10-24 17:45:43	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=2' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence"<br> </p>\r\n<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
5	1048585	2	3	2017-10-24 17:45:51	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=2' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence"<br> </p>\r\n<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
6	1048585	2	3	2017-10-24 17:45:56	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Catherine Kwantes" <ckwantes@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Catherine Kwantes:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
68	1048585	24	3	2017-10-24 18:09:55	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Valerie Williamson:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Self-Organization in Multi-Level Institutions in Networked Environments".<br> <br> Our decision is to: Decline Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
7	1048585	3	19	2017-10-24 17:46:48	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Craig Montgomerie" <cmontgomerie@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Craig Montgomerie:<br />\n<br />\nThank you for submitting the manuscript, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/3' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/3</a><br />\nUsername: cmontgomerie<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
8	1048585	3	19	2017-10-24 17:46:48	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Mark Irvine" <mirvine@mailinator.com>	\N	\N	[publicknowledge] Submission Acknowledgement	Hello,<br />\n<br />\nCraig Montgomerie has submitted the manuscript, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; to Journal of Public Knowledge. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
9	1048585	4	20	2017-10-24 17:47:17	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Diaga Diouf:<br />\n<br />\nThank you for submitting the manuscript, &quot;Genetic transformation of forest trees&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/4' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/4</a><br />\nUsername: ddiouf<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
10	1048585	4	3	2017-10-24 17:47:50	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Paul Hudson:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Genetic transformation of forest trees," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=4' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Genetic transformation of forest trees"<br> </p>\r\n<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
11	1048585	4	3	2017-10-24 17:47:57	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Genetic transformation of forest trees," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=4' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Genetic transformation of forest trees"<br> </p>\r\n<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
12	1048585	4	3	2017-10-24 17:48:01	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Diaga Diouf:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Genetic transformation of forest trees".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
13	1048585	4	3	2017-10-24 17:48:17	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Diaga Diouf" <ddiouf@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Diaga Diouf:<br> <br> The editing of your submission, "Genetic transformation of forest trees," is complete. We are now sending it to production.<br> <br> Submission URL: <a class="submissionUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/4">http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/4</a><br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
14	1048585	5	21	2017-10-24 17:48:57	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Dana Phillips:<br />\n<br />\nThank you for submitting the manuscript, &quot;Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/5' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/5</a><br />\nUsername: dphillips<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
15	1048585	5	3	2017-10-24 17:49:24	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Julie Janssen:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=5' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement"<br> </p>\r\n<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
16	1048585	5	3	2017-10-24 17:49:30	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=5' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement"<br> </p>\r\n<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
17	1048585	5	3	2017-10-24 17:49:35	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Dana Phillips:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
18	1048585	5	3	2017-10-24 17:49:48	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Dana Phillips" <dphillips@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Dana Phillips:<br> <br> The editing of your submission, "Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement," is complete. We are now sending it to production.<br> <br> Submission URL: <a class="submissionUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/5">http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/5</a><br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
19	1048585	6	22	2017-10-24 17:50:25	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Domatilia Sokoloff" <dsokoloff@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Domatilia Sokoloff:<br />\n<br />\nThank you for submitting the manuscript, &quot;Developing efficacy beliefs in the classroom&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/6' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/6</a><br />\nUsername: dsokoloff<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
20	1048585	6	3	2017-10-24 17:50:50	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Paul Hudson:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Developing efficacy beliefs in the classroom," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=6' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=6</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Developing efficacy beliefs in the classroom"<br> </p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
21	1048585	6	3	2017-10-24 17:50:56	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Developing efficacy beliefs in the classroom," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=6' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=6</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Developing efficacy beliefs in the classroom"<br> </p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
22	1048585	6	3	2017-10-24 17:51:03	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Developing efficacy beliefs in the classroom," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=6' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=6</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Developing efficacy beliefs in the classroom"<br> </p>\r\n<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
23	1048585	6	8	2017-10-24 17:51:16	::1	1073741829	"Paul Hudson" <phudson@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>	\N	\N	[publicknowledge] Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Developing efficacy beliefs in the classroom,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2017-11-21, if not before.<br />\n<br />\nPaul Hudson<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
24	1048585	7	23	2017-10-24 17:51:55	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Elinor Ostrom" <eostrom@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Elinor Ostrom:<br />\n<br />\nThank you for submitting the manuscript, &quot;Traditions and Trends in the Study of the Commons&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/7' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/7</a><br />\nUsername: eostrom<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
25	1048585	7	23	2017-10-24 17:51:55	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Frank van Laerhoven" <fvanlaerhoven@mailinator.com>	\N	\N	[publicknowledge] Submission Acknowledgement	Hello,<br />\n<br />\nElinor Ostrom has submitted the manuscript, &quot;Traditions and Trends in the Study of the Commons&quot; to Journal of Public Knowledge. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
26	1048585	8	24	2017-10-24 17:52:31	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>	\N	minoue@mailinator.com	[publicknowledge] Submission Acknowledgement	Fabio Paglieri:<br />\n<br />\nThank you for submitting the manuscript, &quot;Hansen & Pinto: Reason Reclaimed&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/8' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/8</a><br />\nUsername: fpaglieri<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
27	1048585	8	3	2017-10-24 17:52:59	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Julie Janssen:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Hansen &amp; Pinto: Reason Reclaimed," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=8' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=8</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Hansen &amp; Pinto: Reason Reclaimed"<br> </p>\r\n<p>None.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
28	1048585	8	3	2017-10-24 17:53:06	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Hansen &amp; Pinto: Reason Reclaimed," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=8' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=8</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Hansen &amp; Pinto: Reason Reclaimed"<br> </p>\r\n<p>None.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
29	1048585	8	3	2017-10-24 17:53:11	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Fabio Paglieri:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Hansen &amp; Pinto: Reason Reclaimed".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
30	1048585	8	3	2017-10-24 17:53:27	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Fabio Paglieri" <fpaglieri@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Fabio Paglieri:<br> <br> The editing of your submission, "Hansen &amp; Pinto: Reason Reclaimed," is complete. We are now sending it to production.<br> <br> Submission URL: <a class="submissionUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/8">http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/8</a><br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
31	1048585	15	25	2017-10-24 17:54:29	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	John Mwandenga:<br />\n<br />\nThank you for submitting the manuscript, &quot;Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/15' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/15</a><br />\nUsername: jmwandenga<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
32	1048585	15	3	2017-10-24 17:54:56	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Julie Janssen:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=15' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=15</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence"<br> </p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
33	1048585	15	3	2017-10-24 17:55:02	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=15' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=15</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence"<br> </p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
34	1048585	15	3	2017-10-24 17:55:07	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=15' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=15</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence"<br> </p>\r\n<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
35	1048585	15	3	2017-10-24 17:55:12	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>John Mwandenga:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
36	1048585	15	3	2017-10-24 17:55:26	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"John Mwandenga" <jmwandenga@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>John Mwandenga:<br> <br> The editing of your submission, "Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence," is complete. We are now sending it to production.<br> <br> Submission URL: <a class="submissionUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/15">http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/15</a><br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
37	1048585	16	26	2017-10-24 17:56:28	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"John Novak" <jnovak@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	John Novak:<br />\n<br />\nThank you for submitting the manuscript, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/16' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/16</a><br />\nUsername: jnovak<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
38	1048585	16	3	2017-10-24 17:56:59	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Condensing Water Availability Models to Focus on Specific Water Management Systems," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=16' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Condensing Water Availability Models to Focus on Specific Water Management Systems"<br> </p>\r\n<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
39	1048585	16	3	2017-10-24 17:57:08	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Condensing Water Availability Models to Focus on Specific Water Management Systems," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=16' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Condensing Water Availability Models to Focus on Specific Water Management Systems"<br> </p>\r\n<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
40	1048585	16	9	2017-10-24 17:57:26	::1	1073741829	"Aisla McCrae" <amccrae@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>	\N	\N	[publicknowledge] Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2017-11-21, if not before.<br />\n<br />\nAisla McCrae<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
41	1048585	16	10	2017-10-24 17:57:47	::1	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>	\N	\N	[publicknowledge] Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2017-11-21, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
42	1048585	17	27	2017-10-24 17:58:33	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Karim Al-Khafaji" <kalkhafaji@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Karim Al-Khafaji:<br />\n<br />\nThank you for submitting the manuscript, &quot;Learning Sustainable Design through Service&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/17' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/17</a><br />\nUsername: kalkhafaji<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
43	1048585	17	27	2017-10-24 17:58:33	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Margaret Morse" <mmorse@mailinator.com>	\N	\N	[publicknowledge] Submission Acknowledgement	Hello,<br />\n<br />\nKarim Al-Khafaji has submitted the manuscript, &quot;Learning Sustainable Design through Service&quot; to Journal of Public Knowledge. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
44	1048585	18	28	2017-10-24 17:59:05	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Leo Christopher" <lchristopher@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Leo Christopher:<br />\n<br />\nThank you for submitting the manuscript, &quot;Sodium butyrate improves growth performance of weaned piglets during the first period after weaning&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/18' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/18</a><br />\nUsername: lchristopher<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
45	1048585	18	3	2017-10-24 17:59:43	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Julie Janssen:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Sodium butyrate improves growth performance of weaned piglets during the first period after weaning," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=18' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=18</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Sodium butyrate improves growth performance of weaned piglets during the first period after weaning"<br> </p>\r\n<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
46	1048585	18	3	2017-10-24 17:59:55	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Paul Hudson:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Sodium butyrate improves growth performance of weaned piglets during the first period after weaning," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=18' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=18</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Sodium butyrate improves growth performance of weaned piglets during the first period after weaning"<br> </p>\r\n<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
47	1048585	19	29	2017-10-24 18:00:34	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Lise Kumiega:<br />\n<br />\nThank you for submitting the manuscript, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/19' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/19</a><br />\nUsername: lkumiega<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
48	1048585	19	3	2017-10-24 18:01:21	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Julie Janssen:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=19' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=19</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions"<br> </p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
49	1048585	19	3	2017-10-24 18:01:30	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=19' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=19</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions"<br> </p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
50	1048585	19	3	2017-10-24 18:01:41	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Adela Gallego" <agallego@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Adela Gallego:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=19' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=19</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions"<br> </p>\r\n<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
51	1048585	19	7	2017-10-24 18:02:01	::1	1073741829	"Julie Janssen" <jjanssen@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>	\N	\N	[publicknowledge] Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2017-11-21, if not before.<br />\n<br />\nJulie Janssen<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
52	1048585	19	9	2017-10-24 18:02:32	::1	1073741829	"Aisla McCrae" <amccrae@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>	\N	\N	[publicknowledge] Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2017-11-21, if not before.<br />\n<br />\nAisla McCrae<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
53	1048585	19	10	2017-10-24 18:03:06	::1	1073741829	"Adela Gallego" <agallego@mailinator.com>	"Daniel Barnes" <dbarnes@mailinator.com>, "Stephanie Berardo" <sberardo@mailinator.com>, "David Buskins" <dbuskins@mailinator.com>	\N	\N	[publicknowledge] Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2017-11-21, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
54	1048585	19	3	2017-10-24 18:03:50	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Lise Kumiega" <lkumiega@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Lise Kumiega:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions".<br> <br> Our decision is: Revisions Required<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
55	1048585	20	30	2017-10-24 18:04:30	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Patricia Daniel" <pdaniel@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Patricia Daniel:<br />\n<br />\nThank you for submitting the manuscript, &quot;Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/20' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/20</a><br />\nUsername: pdaniel<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
56	1048585	21	31	2017-10-24 18:04:59	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Rana Baiyewu:<br />\n<br />\nThank you for submitting the manuscript, &quot;Yam diseases and its management in Nigeria&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/21' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/21</a><br />\nUsername: rbaiyewu<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
57	1048585	21	3	2017-10-24 18:05:31	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Paul Hudson:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Yam diseases and its management in Nigeria," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=21' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=21</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Yam diseases and its management in Nigeria"<br> </p>\r\n<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
58	1048585	21	3	2017-10-24 18:05:37	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Yam diseases and its management in Nigeria," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=21' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=21</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Yam diseases and its management in Nigeria"<br> </p>\r\n<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
59	1048585	21	3	2017-10-24 18:05:42	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Rana Baiyewu:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Yam diseases and its management in Nigeria".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
60	1048585	21	3	2017-10-24 18:05:58	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Rana Baiyewu" <rbaiyewu@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Rana Baiyewu:<br> <br> The editing of your submission, "Yam diseases and its management in Nigeria," is complete. We are now sending it to production.<br> <br> Submission URL: <a class="submissionUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/21">http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/21</a><br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
61	1048585	22	32	2017-10-24 18:06:39	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Rosanna Rossi" <rrossi@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Rosanna Rossi:<br />\n<br />\nThank you for submitting the manuscript, &quot;Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/22' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/22</a><br />\nUsername: rrossi<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
62	1048585	23	33	2017-10-24 18:07:18	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Vajiheh Karbasizaed:<br />\n<br />\nThank you for submitting the manuscript, &quot;Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/23' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/23</a><br />\nUsername: vkarbasizaed<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
63	1048585	23	3	2017-10-24 18:07:48	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Julie Janssen" <jjanssen@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Julie Janssen:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=23' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=23</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran"<br> </p>\r\n<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
64	1048585	23	3	2017-10-24 18:07:54	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Paul Hudson:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=23' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=23</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran"<br> </p>\r\n<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
65	1048585	23	3	2017-10-24 18:07:59	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Vajiheh Karbasizaed:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
66	1048585	23	3	2017-10-24 18:08:17	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Vajiheh Karbasizaed" <vkarbasizaed@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Vajiheh Karbasizaed:<br> <br> The editing of your submission, "Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran," is complete. We are now sending it to production.<br> <br> Submission URL: <a class="submissionUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/23">http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/23</a><br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
67	1048585	24	34	2017-10-24 18:09:33	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Valerie Williamson" <vwilliamson@mailinator.com>	\N	dbuskins@mailinator.com, sberardo@mailinator.com	[publicknowledge] Submission Acknowledgement	Valerie Williamson:<br />\n<br />\nThank you for submitting the manuscript, &quot;Self-Organization in Multi-Level Institutions in Networked Environments&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/24' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/24</a><br />\nUsername: vwilliamson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
69	1048585	25	35	2017-10-24 18:10:29	::1	\N	"Ramiro Vaca" <rvaca@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>	\N	minoue@mailinator.com	[publicknowledge] Submission Acknowledgement	Zita Woods:<br />\n<br />\nThank you for submitting the manuscript, &quot;Finocchiaro: Arguments About Arguments&quot; to Journal of Public Knowledge. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/25' class='submissionUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/authorDashboard/submission/25</a><br />\nUsername: zwoods<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
70	1048585	25	3	2017-10-24 18:11:04	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Paul Hudson" <phudson@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Paul Hudson:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Finocchiaro: Arguments About Arguments," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=25' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=25</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Finocchiaro: Arguments About Arguments"<br> </p>\r\n<p>None.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
71	1048585	25	3	2017-10-24 18:11:12	::1	\N	"Daniel Barnes" <dbarnes@mailinator.com>	"Aisla McCrae" <amccrae@mailinator.com>	\N	\N	[publicknowledge] Article Review Request	<p>Aisla McCrae:<br> <br> I believe that you would serve as an excellent reviewer of the manuscript, "Finocchiaro: Arguments About Arguments," which has been submitted to Journal of Public Knowledge. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br> <br> Please log into the journal web site by 2017-11-14 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is <a class="contextUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge">http://localhost/git/ojs/index.php/publicknowledge</a><br> <br> The review itself is due 2017-11-21.<br> <br> If you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). <a class="passwordResetUrl-style-class" href="http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword">http://localhost/git/ojs/index.php/publicknowledge/login/lostPassword</a><br> <br> Submission URL: <a href='http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=25' class='submissionReviewUrl-style-class'>http://localhost/git/ojs/index.php/publicknowledge/reviewer/submission?submissionId=25</a><br> <br> Thank you for considering this request.<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com<br> <br> "Finocchiaro: Arguments About Arguments"<br> </p>\r\n<p>None.</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
72	1048585	25	3	2017-10-24 18:11:17	::1	805306369	"Daniel Barnes" <dbarnes@mailinator.com>	"Zita Woods" <zwoods@mailinator.com>	\N	\N	[publicknowledge] Editor Decision	<p>Zita Woods:<br> <br> We have reached a decision regarding your submission to Journal of Public Knowledge, "Finocchiaro: Arguments About Arguments".<br> <br> Our decision is to: Accept Submission<br> <br> Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
\.


--
-- Name: email_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('email_log_log_id_seq', 72, true);


--
-- Data for Name: email_log_users; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY email_log_users (email_log_id, user_id) FROM stdin;
1	17
2	3
2	4
2	5
3	18
4	9
5	10
6	18
7	19
9	20
10	8
11	10
12	20
13	20
14	21
15	7
16	10
17	21
18	21
19	22
20	8
21	9
22	10
23	3
23	4
23	5
24	23
26	24
27	7
28	10
29	24
30	24
31	25
32	7
33	9
34	10
35	25
36	25
37	26
38	9
39	10
40	3
40	4
40	5
41	3
41	4
41	5
42	27
44	28
45	7
46	8
47	29
48	7
49	9
50	10
51	3
51	5
51	4
52	3
52	5
52	4
53	3
53	5
53	4
54	29
55	30
56	31
57	8
58	9
59	31
60	31
61	32
62	33
63	7
64	8
65	33
66	33
67	34
68	34
69	35
70	8
71	9
72	35
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY email_templates (email_id, email_key, assoc_type, assoc_id, enabled) FROM stdin;
\.


--
-- Data for Name: email_templates_data; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY email_templates_data (email_key, locale, assoc_type, assoc_id, subject, body) FROM stdin;
\.


--
-- Data for Name: email_templates_default; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY email_templates_default (email_id, email_key, can_disable, can_edit, from_role_id, to_role_id) FROM stdin;
1	NOTIFICATION	0	1	\N	\N
2	NOTIFICATION_MAILLIST	0	1	\N	\N
3	NOTIFICATION_MAILLIST_WELCOME	0	1	\N	\N
4	NOTIFICATION_CENTER_DEFAULT	0	1	\N	\N
5	PASSWORD_RESET_CONFIRM	0	1	\N	\N
6	PASSWORD_RESET	0	1	\N	\N
7	USER_REGISTER	0	1	\N	\N
8	USER_VALIDATE	0	1	\N	\N
9	REVIEWER_REGISTER	0	1	\N	\N
10	PUBLISH_NOTIFY	0	1	\N	\N
11	LOCKSS_EXISTING_ARCHIVE	0	1	\N	\N
12	LOCKSS_NEW_ARCHIVE	0	1	\N	\N
13	SUBMISSION_ACK	1	1	\N	65536
14	SUBMISSION_ACK_NOT_USER	1	1	\N	65536
15	SUBMISSION_UNSUITABLE	1	1	512	65536
16	EDITOR_ASSIGN	1	1	256	512
17	REVIEW_CANCEL	1	1	512	4096
18	REVIEW_REQUEST	1	1	512	4096
19	REVIEW_REQUEST_SUBSEQUENT	1	1	512	4096
20	REVIEW_REQUEST_ONECLICK	1	1	512	4096
21	REVIEW_REQUEST_ONECLICK_SUBSEQUENT	1	1	512	4096
22	REVIEW_REQUEST_ATTACHED	0	1	512	4096
23	REVIEW_REQUEST_ATTACHED_SUBSEQUENT	0	1	512	4096
24	REVIEW_REQUEST_REMIND_AUTO	0	1	\N	4096
25	REVIEW_REQUEST_REMIND_AUTO_ONECLICK	0	1	\N	4096
26	REVIEW_CONFIRM	1	1	4096	512
27	REVIEW_DECLINE	1	1	4096	512
28	REVIEW_ACK	1	1	512	4096
29	REVIEW_REMIND	0	1	512	4096
30	REVIEW_REMIND_AUTO	0	1	\N	4096
31	REVIEW_REMIND_ONECLICK	0	1	512	4096
32	REVIEW_REMIND_AUTO_ONECLICK	0	1	\N	4096
33	EDITOR_DECISION_ACCEPT	0	1	512	65536
34	EDITOR_DECISION_SEND_TO_EXTERNAL	0	1	17	65536
35	EDITOR_DECISION_SEND_TO_PRODUCTION	0	1	17	65536
36	EDITOR_DECISION_REVISIONS	0	1	512	65536
37	EDITOR_DECISION_RESUBMIT	0	1	512	65536
38	EDITOR_DECISION_DECLINE	0	1	512	65536
39	EDITOR_DECISION_INITIAL_DECLINE	0	1	512	65536
40	EDITOR_RECOMMENDATION	0	1	17	16
41	COPYEDIT_REQUEST	1	1	512	8192
42	LAYOUT_REQUEST	1	1	512	768
43	LAYOUT_COMPLETE	1	1	768	512
44	EMAIL_LINK	0	1	1048576	\N
45	SUBSCRIPTION_NOTIFY	0	1	\N	1048576
46	OPEN_ACCESS_NOTIFY	0	1	\N	1048576
47	SUBSCRIPTION_BEFORE_EXPIRY	0	1	\N	1048576
48	SUBSCRIPTION_AFTER_EXPIRY	0	1	\N	1048576
49	SUBSCRIPTION_AFTER_EXPIRY_LAST	0	1	\N	1048576
50	SUBSCRIPTION_PURCHASE_INDL	0	1	\N	2097152
51	SUBSCRIPTION_PURCHASE_INSTL	0	1	\N	2097152
52	SUBSCRIPTION_RENEW_INDL	0	1	\N	2097152
53	SUBSCRIPTION_RENEW_INSTL	0	1	\N	2097152
54	CITATION_EDITOR_AUTHOR_QUERY	0	1	\N	\N
55	REVISED_VERSION_NOTIFY	0	1	\N	512
56	ORCID_COLLECT_AUTHOR_ID	0	1	\N	\N
57	PAYPAL_INVESTIGATE_PAYMENT	0	1	\N	\N
58	MANUAL_PAYMENT_NOTIFICATION	0	1	\N	\N
\.


--
-- Data for Name: email_templates_default_data; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY email_templates_default_data (email_key, locale, subject, body, description) FROM stdin;
NOTIFICATION	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}	The email is sent to registered users that have selected to have this type of notification emailed to them.
NOTIFICATION_MAILLIST	en_US	New notification from {$siteTitle}	You have a new notification from {$siteTitle}:<br />\n--<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n--<br />\n<br />\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.<br />\n<br />\n{$principalContactSignature}	This email is sent to unregistered users on the notification mailing list.
NOTIFICATION_MAILLIST_WELCOME	en_US	Welcome to the the {$siteTitle} mailing list!	You have signed up to receive notifications from {$siteTitle}.<br />\n<br />\nPlease click on this link to confirm your request and add your email address to the mailing list: {$confirmLink}<br />\n<br />\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.<br />\n<br />\n{$principalContactSignature}	This email is sent to an unregistered user who just registered with the notification mailing list.
PASSWORD_RESET_CONFIRM	en_US	Password Reset Confirmation	We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.
PASSWORD_RESET	en_US	Password Reset	Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}	This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.
USER_REGISTER	en_US	Journal Registration	{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal's list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.
USER_VALIDATE	en_US	Validate Your Account	{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered user to validate their email account.
REVIEWER_REGISTER	en_US	Registration as Reviewer with {$contextName}	In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you'll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.
PUBLISH_NOTIFY	en_US	New Issue Published	Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers via the "Notify Users" link in the Editor's User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.
LOCKSS_EXISTING_ARCHIVE	en_US	Archiving Request for {$contextName}	Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal's LOCKSS Publisher Manifest.
LOCKSS_NEW_ARCHIVE	en_US	Archiving Request for {$contextName}	Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}	This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.
SUBMISSION_ACK	en_US	Submission Acknowledgement	{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.
SUBMISSION_ACK_NOT_USER	en_US	Submission Acknowledgement	Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}	This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.
SUBMISSION_UNSUITABLE	en_US	Unsuitable Submission	{$authorName}:<br />\n<br />\nAn initial review of &quot;{$submissionTitle}&quot; has made it clear that this submission does not fit within the scope and focus of {$contextName}. I recommend that you consult the description of this journal under About, as well as its current contents, to learn more about the work that we publish. You might also consider submitting this manuscript to another, more suitable journal.<br />\n<br />\n{$editorialContactSignature}	
EDITOR_ASSIGN	en_US	Editorial Assignment	{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,<br />\n{$editorialContactSignature}	This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.
REVIEW_REQUEST	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)
REVIEW_REQUEST_REMIND_AUTO	en_US	Article Review Request	{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REQUEST_ONECLICK	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.
REVIEW_DECLINE	en_US	Unable to Review	Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}	This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.
REVIEW_ACK	en_US	Article Review Acknowledgement	{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.
REVIEW_REQUEST_REMIND_AUTO_ONECLICK	en_US	Article Review Request	{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date. \n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission's abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email is automatically sent when a reviewer's confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REQUEST_ATTACHED	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n	This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)
REVIEW_REQUEST_SUBSEQUENT	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)
REVIEW_REQUEST_ONECLICK_SUBSEQUENT	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.
REVIEW_REQUEST_ATTACHED_SUBSEQUENT	en_US	Article Review Request	{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n	This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)
REVIEW_CANCEL	en_US	Request for Review Cancelled	{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal's review process in the future.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}	This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.
REVIEW_CONFIRM	en_US	Able to Review	Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}	This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.
REVIEW_REMIND	en_US	Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Section Editor to remind a reviewer that their review is due.
REVIEW_REMIND_ONECLICK	en_US	Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Section Editor to remind a reviewer that their review is due.
REVIEW_REMIND_AUTO	en_US	Automated Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal's web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).
REVIEW_REMIND_AUTO_ONECLICK	en_US	Automated Submission Review Reminder	{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent when a reviewer's due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).
EDITOR_DECISION_ACCEPT	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the Editor or Section Editor to an Author notifies them of a final "accept submission" decision regarding their submission.
EDITOR_DECISION_SEND_TO_EXTERNAL	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.
EDITOR_DECISION_SEND_TO_PRODUCTION	en_US	Editor Decision	{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.
EDITOR_DECISION_REVISIONS	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the Editor or Section Editor to an Author notifies them of a final "revisions required" decision regarding their submission.
EDITOR_DECISION_RESUBMIT	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the Editor or Section Editor to an Author notifies them of a final "resubmit" decision regarding their submission.
EDITOR_DECISION_DECLINE	en_US	Editor Decision	{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the Editor or Section Editor to an Author notifies them of a final "decline" decision regarding their submission.
EDITOR_RECOMMENDATION	en_US	Editor Recommendation	{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}<br />\n<br />\n{$editorialContactSignature}<br />\n	This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.
COPYEDIT_REQUEST	en_US	Copyediting Request	{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\n{$editorialContactSignature}	This email is sent by a Section Editor to a submission's Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.
LAYOUT_REQUEST	en_US	Request Galleys	{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal's standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionLayoutUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.<br />\n<br />\n{$editorialContactSignature}	This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.
LAYOUT_COMPLETE	en_US	Galleys Complete	{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}	This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.
EMAIL_LINK	en_US	Article of Possible Interest	Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.	This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.
SUBSCRIPTION_NOTIFY	en_US	Subscription Notification	{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal's URL along with instructions for access.
OPEN_ACCESS_NOTIFY	en_US	Issue Now Open Access	Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}	This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.
SUBSCRIPTION_BEFORE_EXPIRY	en_US	Notice of Subscription Expiry	{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a subscriber that their subscription will soon expire. It provides the journal's URL along with instructions for access.
SUBSCRIPTION_AFTER_EXPIRY	en_US	Subscription Expired	{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a subscriber that their subscription has expired. It provides the journal's URL along with instructions for access.
SUBSCRIPTION_AFTER_EXPIRY_LAST	en_US	Subscription Expired - Final Reminder	{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}	This email notifies a subscriber that their subscription has expired. It provides the journal's URL along with instructions for access.
SUBSCRIPTION_PURCHASE_INDL	en_US	Subscription Purchase: Individual	An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.
SUBSCRIPTION_PURCHASE_INSTL	en_US	Subscription Purchase: Institutional	An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to 'Active'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.
USER_VALIDATE	fr_CA	Valider votre compte	{$userFullName}<br />\n<br />\nVous avez créé un compte avec {$contextName}, mais avant de pouvoir commencer à l'utiliser, vous devez valider votre compte de courriel. Pour ce faire, suivre simplement le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un utilisateur nouvellement inscrit, afin de l'accueillir dans le système et lui offrir un enregistrement de son nom d'utilisateur et de son mot de passe.
SUBSCRIPTION_RENEW_INDL	en_US	Subscription Renewal: Individual	An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.
SUBSCRIPTION_RENEW_INSTL	en_US	Subscription Renewal: Institutional	An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n	This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.
CITATION_EDITOR_AUTHOR_QUERY	en_US	Citation Editing	{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n	This email allows copyeditors to request additional information about references from authors.
REVISED_VERSION_NOTIFY	en_US	Revised Version Uploaded	{$editorialContactName}:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}	This email is automatically sent to the assigned editor when author uploads a revised version of an article.
NOTIFICATION_CENTER_DEFAULT	en_US	A message regarding {$contextName}	Please enter your message.	The default (blank) message used in the Notification Center Message Listbuilder.
EDITOR_DECISION_INITIAL_DECLINE	en_US	Editor Decision	\n\t\t\t{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />	This email is send to the author if the editor declines his submission initially, before the review stage
PASSWORD_RESET_CONFIRM	fr_CA	Confirmation de la réinitialisation du mot de passe	Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous voulez réinitialiser votre mot de passe, cliquer sur l'URL et un nouveau mot de passe vous sera envoyé par courriel sous peu.<br />\n<br />\nRéinitialisation du mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs qui nous signalent avoir oublié leur mot de passe ou qui sont incapables d'ouvrir une session. Il fournit le lien URL pour réinitialiser leur mot de passe.
PASSWORD_RESET	fr_CA	Réinitialisation du mot de passe	Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver précieusement votre nom d'utilisateur ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec la revue.<br />\n<br />\nVotre nom d'utilisateur : {$username}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs inscrits lorsqu'ils ont réussi à réinitialiser leur mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».
USER_REGISTER	fr_CA	Inscription d'un nouvel utilisateur	{$userFullName}<br />\n<br />\nVous êtes désormais inscrit en tant qu'utilisateur pour {$contextName}. Veuillez conserver précieusement votre nom d'utilisateur et votre mot de passe.  Vous en aurez besoin pour toutes vos interactions avec la revue. À n'importe quel moment, vous pouvez demander à être retiré de la liste des utilisateurs de la revue en me contactant.<br />\n<br />\nNom d'utilisateur : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs nouvellement inscrits pour leur souhaiter la bienvenue à la revue et leur faire connaître leur nom d'utilisateur et leur mot de passe.
PUBLISH_NOTIFY	fr_CA	Parution du dernier numéro	Lecteurs:<br />\n<br />\nLe plus récent numéro de {$contextName} vient d'être publié à l'adresse suivante : {$contextUrl}. Nous vous invitons à consulter la table des matières, puis à visiter notre site Web pour y lire les articles qui vous intéressent.<br />\n<br />\nNous vous remercions de l'intérêt que vous portez à notre revue,<br />\n{$editorialContactSignature}	Ce courriel est envoyé à tous les lecteurs inscrits, via le lien « Aviser les utilisateurs » sur la page d'accueil du rédacteur. Il avise les lecteurs qu'un nouveau numéro est publié et les invite à visiter la revue en cliquant sur le URL fourni.
LOCKSS_EXISTING_ARCHIVE	fr_CA	Demande d'archivage pour {$contextName}	Cher [Bibliothécaire universitaire]<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; est une revue pour laquelle un membre de votre faculté, [nom du membre], agit à titre de [titre de la position occupée]. La revue désire mettre en place un système d'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe - Plusieurs exemplaires qui assurent la sécurité) avec votre bibliothèque universitaire ainsi que celles d'autres universités.<br />\n<br />\n[Brève description de la revue]<br />\n<br />\nL'adresse URL pour le LOCKSS Publisher Manifest pour notre revue est: {$contextUrl}/gateway/lockss<br />\n<br />\nNous savons que vous participez déjà à LOCKSS. Si nous pouvons vous fournir des métadonnées supplémentaires afin d'inscrire notre revue avec votre version de LOCKSS, il nous fera plaisir de vous les fournir.<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel demande à un conservateur d'archives LOCKSS d'envisager d'inclure cette revue dans leurs archives. Il fournit l'adresse URL du LOCKSS Publisher Manifest de la revue.
PROOFREAD_AUTHOR_ACK	fr_CA	Accusé de réception de la correction d'épreuves (Auteur)	{$authorName}:<br />\n<br />\nNous vous remercions d'avoir accepté de corriger les épreuves de votre manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Nous sommes heureux de publier vos travaux dans notre revue.<br />\n<br />\nSi vous êtes inscrit à notre service d'avis, vous recevrez par courriel la table des matières dès que votre article sera publié. Si vous avez des questions, n'hésitez pas à communiquer avec nous.<br />\n<br />\n{$editorialContactSignature}	Ce courriel du Rédacteur de rubrique à l'Auteur reconnaît que le processus de correction d'épreuves initiale est terminé et le remercie de sa contribution.
LOCKSS_NEW_ARCHIVE	fr_CA	Demande d'archivage pour {$contextName}	Cher [Bibliothécaire universitaire]<br />\n<br />\n{$contextName}, &lt;{$contextUrl}&gt;, est une revue pour laquelle un membre de votre faculté, [nom du membre], agit à titre de [titre de la fonction occupée]. La revue désire mettre en place un système d'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe) avec votre bibliothèque universitaire et celles d'autres universités.<br />\n<br />\n[Brève description de la revue]<br />\n<br />\nLe programme LOCKSS &lt;http://lockss.org/&gt;, une initiative de bibliothécaires et d'éditeurs internationaux, est une belle démonstration d'un dépôt d'archives assurant la préservation des documents. Voir les détails ci-dessous. Le logiciel est gratuit et fonctionne sur tout ordinateur personnel. Il est facile de le mettre en ligne et ne requiert que très peu de maintenance.<br />\n<br />\nPour nous aider dans le processus d'archivage de notre revue, nous vous invitons à devenir membre de la communauté LOCKSS, pour aider la collection et la préservation des titres produits par votre faculté et par les autres chercheurs à travers le monde. Pour ce faire, veuillez demander à quelqu'un de votre personnel de visiter le site Internet de LOCKSS pour voir les informations sur le fonctionnement du système.<br />\n<br />\nNous attendons de vos nouvelles pour savoir s'il est possible pour vous de fournir un support d'archivage pour cette revue.<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel encourage le destinaire à participer à l'initiative LOCKSS et à inclure cette revue dans leur archives. Il fournit de l'information au sujet de LOCKSS et des façons de s'impliquer dans le projet.
SUBMISSION_ACK	fr_CA	Accusé de réception de la soumission	{$authorName}:<br />\n<br />\nNous vous remercions d'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$contextName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d'édition simplement en accédant au site Web de la revue.<br />\n<br />\nURL du manuscrit : {$submissionUrl}<br />\nNom d'utilisateur : {$authorUsername}<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}	Ce courriel, lorsqu'activé, est envoyé automatiquement à un auteur quand il ou elle a complété le processus de soumission d'un manuscrit à la revue. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l'auteur de sa soumission.
SUBMISSION_UNSUITABLE	fr_CA	Soumission non conforme	{$authorName}:<br />\n<br />\nUne évaluation initiale de votre manuscrit intitulé « {$submissionTitle} » a démontré que votre soumission ne se conforme pas aux orientations de la revue {$contextName}. Nous vous suggérons de consulter la description de cette revue en cliquant sur l'onglet « À propos de la revue » et en lisant le contenu de la revue pour en apprendre davantage sur les articles que nous publions. Vous pourriez aussi considérer soumettre votre manuscrit à une revue plus appropriée.<br />\n<br />\n{$editorialContactSignature}	
SUBMISSION_COMMENT	fr_CA	Commentaires sur une soumission	{$name}:<br />\n<br />\n{$commentName} a ajouté un commentaire à la soumission intitulée « {$submissionTitle} » dans la revue {$contextName}:<br />\n<br />\n{$comments}	Ce courriel avise plusieurs personnes impliquées dans le processus éditorial qu'un nouveau commentaire a été ajouté.
SUBMISSION_DECISION_REVIEWERS	fr_CA	Décision concernant le manuscrit intitulé « {$submissionTitle} »	Puisque vous avez été l'un des évaluateurs de la soumission intitulé « {$submissionTitle} » pour la revue {$contextName}, nous vous faisons parvenir les évaluations et la décision du rédacteur.  À nouveau, nous vous remercions pour votre contribution importante à notre processus éditorial.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n{$comments}	Ce courriel avise les évaluateurs d'une soumission que le processus d'évaluation est complété. Il inclut de l'information au sujet de l'article et de la décision prise, et remercie les évaluateurs de leur contribution.
EDITOR_ASSIGN	fr_CA	Assignation d'une soumission	{$editorialContactName}:<br />\n<br />\nLa soumission intitulée « {$submissionTitle} » pour la revue {$contextName} vous a été attribuée. Vous êtes conséquemment responsable, en tant que Rédacteur de rubrique, de faire cheminer cet article à travers le processus d'évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur : {$editorUsername}<br />\n<br />\nMerci,<br />\n{$editorialContactSignature}	Ce courriel avise un Rédacteur de rubrique que le Rédacteur lui a assigné la tâche de suivre une soumission durant le processus éditorial. Il fournit de l'information sur la soumission, et comment accéder au site Web de la revue.
REVIEW_REQUEST	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\n<br />\nNous croyons que vous seriez un excellent évaluateur pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$contextName}. Vous trouverez un résumé de la soumission ci-dessous.  Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation. Le site Web se trouve à l'adresse suivante : {$contextUrl}<br />\n<br />\nLa date d'échéance de l'évaluation a été fixée au {$reviewDueDate}.<br />\n<br />\nSi vous n'avez pas de nom d'utilisateur et de mot de passe pour le site Web de la revue, cliquer sur le lien ci-dessous pour réinitialiser votre mot de passe (qui vous sera envoyé par courriel avec votre nom d'utilisateur). {$psasswordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nEn espérant que vous accepterez notre demande, veuillez agréer l'expression de notre considération distinguée.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}	Ce courriel du Rédacteur de rubrique à un Évaluateur demande que l'évaluateur accepte ou refuse la tâche d'évaluation d'une soumission. Il fournit de l'information sur la soumission, tel son titre et un résumé, la date d'échéance pour l'évaluation, et comment accéder à la soumission elle-même. Ce message est utilisé quand « Processus d'évaluation standard » est sélectionné à l'Étape 2, dans la Configuration de la revue. (Autrement voir « Demande d'évaluation », en pièce jointe).
SUBSCRIPTION_AFTER_EXPIRY	fr_CA	Abonnement expiré	{$subscriberName}:<br />\n<br />\nVotre abonnement à la revue {$contextName} est expiré.<br />\n<br />\n{$subscriptionType}<br />\nDate d'expiration: {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez aller sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d'utilisateur, &quot;{$username}&quot;.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec moi.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un abonné que son abonnement est expiré. Il fournit l'adresse URL de la revue, ainsi que les instructions pour y accéder.
REVIEW_REQUEST_ONECLICK	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\n<br />\nNous croyons que vous seriez un excellent évaluateur pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$contextName}. Vous trouverez un résumé de la soumission ci-dessous.  Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous informer si vous acceptez de faire l'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation. Le site Web se trouve à l'adresse suivante : {$contextUrl}<br />\n<br />\nDate limite pour l'évaluation {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}.<br />\n<br />\nEn espérant que vous accepterez notre demande, veuillez agréer l'expression de notre considération distinguée.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}	Ce courriel du Rédacteur de rubrique à un Évaluateur demande que l'évaluateur accepte ou décline la tâche d'évaluation d'une soumission. Il contient des informations sur la soumission tel que son titre et un résumé, la date d'échéance pour faire l'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d'évaluation standard » a été sélectionné à l'Étape 2  de la Configuration de la revue, et que l'accès en « un clic » de l'évaluateur a été activé.
REVIEW_REQUEST_ATTACHED	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\n<br />\nNous croyons que vous feriez un excellent évaluateur pour le manuscrit intitulé « {$submissionTitle} ».  Nous espérons que vous accepterez ce travail important pour notre revue. Les Directives pour l'évaluation se trouvent ci-dessous et la soumission est jointe au présent courriel.<br />\n<br />\nVeuillez nous faire savoir par courriel d'ici le {$responseDueDate} si vous acceptez ou non d'effectuer cette évaluation.<br />\n<br />\nEn espérant que vous accepterez notre demande, veuillez agréer l'expression de notre considération distinguée.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDirectives pour l'évaluation<br />\n<br />\n{$reviewGuidelines}	Ce courriel est envoyé par le Rédacteur de rubrique à un Évaluateur pour lui demander s'il accepte ou refuse la tâche d'évaluation d'une soumission. Il inclut la soumission en pièce jointe. Ce message est utilisé quand le processus de « Demande d'évaluation par courriel » est sélectionné à l'Étape 2 de la Configuration de la revue. (Autrement, voir « Demande d'évaluation ».)
REVIEW_CANCEL	fr_CA	Annulation de la demande d'évaluation	{$reviewerName}:<br />\n<br />\nNous avons décidé d'annuler notre demande concernant l'évaluation du manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Nous sommes désolés des inconvénients que cela pourrait vous causer et nous espérons que nous pourrons compter sur votre collaboration pour un autre projet.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le Rédacteur de rubrique à un Évaluateur qui a une évaluation en cours, pour l'aviser que celle-ci a été annulée.
REVIEW_CONFIRM	fr_CA	Acceptation d'évaluation	Rédacteur,\n<br />\nJe suis en mesure d'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Je vous remercie d'avoir pensé à moi. Je devrais être en mesure de compléter l'évaluation pour la date du {$reviewDueDate}.<br />\n<br />\n{$reviewerName}	Ce courriel est envoyé par l'évaluateur au rédacteur de rubrique en réponse à une demande d'évaluation, pour aviser ce dernier que la demande a été acceptée et que l'évaluation sera complétée au plus tard à la date spécifiée.
REVIEW_DECLINE	fr_CA	Refus d'évaluation	Éditeurs:<br />\n<br />\nPour le moment, il m'est impossible d'évaluer la soumission intitulée « {$submissionTitle} » pour {$contextName}. Je vous remercie d'avoir pensé à moi. N'hésitez pas à communiquer avec moi pour un autre projet.<br />\n<br />\n{$reviewerName}	Ce courriel est envoyé par l'évaluateur au rédacteur de rubrique en réponse à la demande d'évaluation, pour aviser ce dernier qu'il ne peut effectuer l'évaluation.
REVIEW_ACK	fr_CA	Accusé de réception de l'évaluation d'une soumission	{$reviewerName}:<br />\n<br />\nNous vous remercions d'avoir évalué la soumission intitulée « {$submissionTitle} » pour {$contextName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le Rédacteur de rubrique, pour accuser réception d'une évaluation terminée et remercier l'évaluateur de sa contribution.
REVIEW_REMIND	fr_CA	Rappel d'évaluation d'une soumission	{$reviewerName}:<br />\n<br />\nJuste un petit mot pour vous rappeler notre demande d'évaluation de la soumission intitulée « {$submissionTitle} » pour {$contextName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}, et nous serions heureux de la recevoir dès que possible.<br />\n<br />\nSi vous n'avez pas de nom d'utilisateur ni de mot de passe pour le site Web de la revue, cliquer sur le lien ci-dessous pour réinitialiser votre mot de passe (qui vous sera alors envoyé par courriel avec votre nom d'utilisateur). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le Rédacteur de rubrique pour rappeler à un évaluateur que son évaluation est due.
REVIEW_REMIND_ONECLICK	fr_CA	Rappel d'évaluation d'une soumission	{$reviewerName}:<br />\n<br />\nJuste un petit mot pour vous rappeler notre demande d'évaluation de la soumission intitulée « {$submissionTitle} », pour {$contextName}. Nous espérions recevoir votre évaluation le {$reviewDueDate} et nous serions heureux de la recevoir aussitôt qu'il vous sera possible de le faire.<br />\n<br />\nAdresse URL de la soumission: {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer si vous êtes en mesure de compléter ce travail essentiel pour la publication de la revue. Espérant avoir de vos nouvelles sous peu.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le Rédacteur de rubrique à un évaluateur pour lui rappeler que son évaluation est due.
SUBSCRIPTION_AFTER_EXPIRY_LAST	fr_CA	Abonnement expiré - Dernier rappel	{$subscriberName}:<br />\n<br />\nVotre abonnement à la revue {$contextName} est expiré. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoyé.<br />\n<br />\n{$subscriptionType}<br />\nDate d'expiration: {$expiryDate}<br />\n<br />\nPour renouveller votre abonnement, aller sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d'utilisateur, &quot;{$username}&quot;.<br />\n<br />\nSi vous avez des questions, ne hésitez pas à communiquer avec moi.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un abonné que son abonnement est expiré. Il donne l'adresse URL de la revue ainsi que les instructions pour y accéder.
REVIEW_REMIND_AUTO	fr_CA	Rappel automatique d'évaluation d'une soumission	{$reviewerName},<br />\n<br />\nJuste un petit mot pour vous rappeler notre demande à propos de l'évaluation de la soumission intitulée « {$submissionTitle} » pour {$contextName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Ce courriel a été envoyé automatiquement parce que la date d'échéance est passée. Nous serions quand même heureux de recevoir votre évaluation dès que possible.<br />\n<br />\nSi vous n'avez pas de nom d'utilisateur ni de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe (qui vous sera envoyé par courriel avec votre nom d'utilisateur). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d'effectuer ce travail important pour notre revue. J'espère avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement quand la date due d'un évaluateur est dépassée. (Voir Options d'évaluation à l'Étape 2 de la Configuration de la revue) et que l'accès en « un clic » est désactivé. Les tâches planifiées doivent être activées et configurées (voir le fichier de Configuration du site).
REVIEW_REMIND_AUTO_ONECLICK	fr_CA	Rappel automatique d'évaluation d'une soumission	{$reviewerName}:<br />\n<br />\nJuste un petit mot au sujet de notre demande d'évaluation de la soumission « {$submissionTitle} », pour {$contextName}. Nous espérions avoir cette évaluation avant le {$reviewDueDate}, et ce courriel vous a été envoyé automatiquement parce que la date d'échéance est passée. Nous serions heureux de la recevoir dès qu'il vous sera possible de nous l'envoyer.<br />\n<br />\nL'adresse URL de la soumission: {$submissionReviewUrl}<br />\n<br />\nS.V.P. veuillez nous confirmer votre disponibilité à compléter cette contribution importante à notre revue. Espérant recevoir de vos nouvelles bientôt.<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement quand la date d'échéance de l'évaluation est dépassée (voir Options d'évaluation à l'Étape 2 de Configuration de la revue) et que l'accès en « un clic » à un évaluateur est activé. Les Tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).
COPYEDIT_REQUEST	fr_CA	Demande de révision d'une soumission	{$participantName}:<br />\n<br />\nJ'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour {$contextName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Se connecter sur le site de la revue et cliquer sur le fichier qui apparaît à l'Étape 1.<br />\n3. Consulter les instructions de révision affichés sur la page Web.<br />\n4. Ouvrir le fichier téléchargé et effectuer la révision, tout en ajoutant des Requêtes à l'auteur, le cas échéant.<br />\n5. Enregistrer le fichier révisé, et télécharger à l'Étape 1 de la révision.<br />\n6. Envoyer le courriel TERMINÉ au rédacteur.<br />\n<br />\nURL de {$contextName} : {$contextUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d'utilisateur : {$participantUsername}<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé par le Rédacteur de rubrique à un Réviseur, pour lui demander de commencer le processus de révision. Il fournit l'information sur la soumission et comment accéder à celle-ci.
LAYOUT_REQUEST	fr_CA	Demande de mise en page des épreuves	{$participantName}:<br />\n<br />\nJ'aimerais que vous prépariez les épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et utiliser la version de mise en page du fichier pour créer les épreuves en fonction des normes de la revue.<br />\n3. Envoyer le courriel TERMINÉ au rédacteur.<br />\n<br />\nURL de {$contextName} : {$contextUrl}<br />\nURL du manuscrit : {$submissionLayoutUrl}<br />\nNom d'utilisateur : {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.<br />\n<br />\n{$editorialContactSignature}	Ce courriel envoyé par le Rédacteur de rubrique au Responsable de la mise en page, avise ce dernier qu'il a été assigné à la tâche de faire la mise en page de la soumission. Il fournit de l'information sur la soumission et comment y accéder.
LAYOUT_COMPLETE	fr_CA	Mise en page des épreuves terminée	{$editorialContactName}:<br />\n<br />\nLes épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName} sont maintenant prêtes pour la révision.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec moi.<br />\n<br />\n{$participantName}	Ce courriel du Responsable de la mise en page au Rédacteur de rubrique l'avise que le processus de la mise en page est terminé.
LAYOUT_ACK	fr_CA	Accusé de réception de la mise en page	{$participantName}:<br />\n<br />\nNous vous remercions d'avoir accepté de préparer les épreuves pour le manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Il s'agit d'une contribution importante au processus de publication.<br />\n<br />\n{$editorialContactSignature}	Ce courriel du Rédacteur de rubrique au Responsable de la mise en page reconnaît que le processus de la mise en page a été complété et remercie le responsable de la mise en page de sa contribution.
PROOFREAD_AUTHOR_REQUEST	fr_CA	Demande de correction d'épreuves (Auteur)	{$authorName}:<br />\n<br />\nNous aimerions que vous procédiez à la correction d'épreuves du manuscrit intitulé « {$submissionTitle} » dans {$contextName}.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et afficher les INSTRUCTIONS POUR LA CORRECTION D'ÉPREUVES<br />\n3. Cliquer sur AFFICHER LES ÉPREUVES dans la Mise en page et corriger les épreuves dans le (ou les) format(s) utilisé(s).<br />\n4. Saisir les corrections (typographiques et de mise en page) dans les Corrections d'épreuves.<br />\n5. Enregistrer et envoyer par courriel les corrections au Responsable de la mise en page et au Correcteur d'épreuves.<br />\n6. Envoyer le courriel TERMINÉ au rédacteur.<br />\n<br />\nURL du manuscrit : {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}	Ce courriel du Rédacteur de rubrique à l'Auteur avise ce dernier que les épreuves de la soumission sont prêtes pour la correction d'épreuves. Il fournit de l'information sur la soumission et comment y accéder.
PROOFREAD_AUTHOR_COMPLETE	fr_CA	Correction d'épreuves terminée (Auteur)	{$editorialContactName},<br />\n<br />\nJ'ai terminé la correction d'épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Les épreuves peuvent maintenant être relues par le correcteur d'épreuves et le responsable de la mise en page.<br />\n<br />\n{$authorName}	Ce courriel de l'Auteur au Correcteur d'épreuves et au Rédacteur les avise que le cycle de correction d'épreuves est terminé et que les détails peuvent être consultés dans les commentaires de l'article.
PROOFREAD_REQUEST	fr_CA	Demande de correction d'épreuves	{$authorName}:<br />\n<br />\nNous aimerions que vous procédiez à la correction d'épreuves du manuscrit intitulé « {$submissionTitle} » dans {$contextName}.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et afficher les INSTRUCTIONS POUR LA CORRECTION D'ÉPREUVES<br />\n3. Cliquer sur AFFICHER LES ÉPREUVES dans la Mise en page et corriger les épreuves dans le (ou les) format(s) utilisé(s).<br />\n4. Saisir les corrections (typographiques et de mise en page) dans les Corrections d'épreuves.<br />\n5. Enregistrer et envoyer par courriel les corrections au Responsable de la mise en page et au Correcteur d'épreuves.<br />\n6. Envoyer le courriel TERMINÉ au rédacteur.<br />\n<br />\nURL du manuscrit : {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}	Ce courriel du Rédacteur de rubrique au Correcteur d'épreuves demande que ce dernier fasse la correction des épreuves de l'article. Il fournit de l'information sur l'article, et comment y accéder.
PROOFREAD_COMPLETE	fr_CA	Correction d'épreuves terminée	{$editorialContactName}:<br />\n<br />\nJ'ai terminé la correction d'épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Les corrections peuvent maintenant être insérées dans le texte par le Responsable de la mise en page.<br />\n<br />\n{$proofreaderName}	Ce courriel du Correcteur d'épreuves au Rédacteur de rubrique avise ce dernier que le Correcteur d'épreuves a fini le processus de correction d'épreuves.
PROOFREAD_ACK	fr_CA	Accusé de réception de la correction d'épreuves	{$proofreaderName},<br />\n<br />\nNous vous remercions d'avoir accepté de corriger les épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Votre collaboration contribue grandement à la qualité de la revue.<br />\n<br />\n{$editorialContactSignature}	Ce courriel du Rédacteur de rubrique au Correcteur d'épreuves confirme à ce dernier que le processus de la lecture d'épreuves a été complété et le remercie de sa contribution.
PROOFREAD_LAYOUT_REQUEST	fr_CA	Demande de correction d'épreuves (Responsable de la mise en page)	{$participantName},<br />\n<br />\nNous aimerions que vous insériez les modifications nécessaires à la suite de la correction d'épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName} à l'aide des étapes suivantes.<br />\n1. Cliquer sur l'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et consulter les corrections à apporter pour créer les épreuves corrigées.<br />\n3.Télécharger les épreuves corrigées.<br />\n4. Envoyer le courriel TERMINÉ de l'Étape 3 de Correction d'épreuves au rédacteur.<br />\n<br />\nURL de {$contextName} : {$contextUrl}<br />\nURL du manuscrit : {$submissionUrl}<br />\nNom d'utilisateur : {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.<br />\n<br />\n{$editorialContactSignature}	Ce courriel venant du Rédacteur de rubrique au Responsable de la mise en page avise ce dernier que les épreuves sont prêtes pour une évaluation finale. Il contient de l'information sur l'article et comment y accéder.
PROOFREAD_LAYOUT_COMPLETE	fr_CA	Correction d'épreuves terminée (Responsable de la mise en page)	{$editorialContactName},<br />\n<br />\nLes corrections d'épreuves ont été effectuées dans le manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Ce document est prêt à être publié.<br />\n<br />\n{$participantName}	Ce courriel  du Responsable de la mise en page au Rédacteur de rubrique avise ce dernier que l'étape finale de correction d'épreuves est terminé et que l'article est maintenant prêt à être publié.
PROOFREAD_LAYOUT_ACK	fr_CA	Accusé de réception de la correction d'épreuves (Responsable de la mise en page)	{$participantName}:<br />\n<br />\nNous vous remercions d'avoir corrigé les épreuves du manuscrit intitulé « {$submissionTitle} » pour {$contextName}. Votre contribution est importante pour la revue.<br />\n<br />\n{$editorialContactSignature}	Ce courriel du Rédacteur de rubrique au Responsable de la mise en page reconnaît l'achèvement par ce dernier de l'étape finale de la correction d'épreuves et le remercie de sa contribution.
EMAIL_LINK	fr_CA	Article potentiellement intéressant	Je pense que l'article suivant pourrait vous intéresser : « {$submissionTitle} » par {$authorName}, publié dans le volume {$volume}, numéro {$number} de ({$year}) de la revue {$contextName}. Vous le trouverez à l'adresse suivante : {$articleUrl}.	Ce courriel type donne à un lecteur inscrit l'occasion d'envoyer de l'information à quelqu'un qui peut être intéressé par un article en particulier. Il est disponible via Outils de lecture et doit être activé par le Directeur de la revue à la page Gestion des outils de lecture.
SUBSCRIPTION_NOTIFY	fr_CA	Avis d'abonnement	{$subscriberName},<br />\n<br />\nVous êtes maintenant abonné à notre système de gestion en ligne pour {$contextName}, avec le type d'abonnement suivant :<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour accéder au contenu destiné seulement aux abonnés, entrez dans le système à l'aide de votre nom d'utilisateur : {$username}.<br />\n<br />\nUne fois dans le système, vous pouvez modifier les détails de votre profil et votre mot de passe en tout temps.<br />\n<br />\nVeuillez prendre note que si vous disposez d'un abonnement institutionnel, les utilisateurs n'ont pas à entrer de nom d'utilisateur puisque le système authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec moi.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un lecteur inscrit que le directeur de la revue a créé un abonnement pour lui. Il fournit l'adresse URL de la revue ainsi que les instructions pour y accéder.
OPEN_ACCESS_NOTIFY	fr_CA	Le numéro est maintenant à accès libre	Chers lecteurs et lectrices :<br />\n<br />\n{$contextName} vient de rendre disponible en format libre accès le numéro suivant. Nous vous invitons à lire la table des matières ici puis visiter notre site Web ({$contextUrl}) pour lire les articles et autres textes qui pourraient vous intéresser.<br />\n<br />\nMerci de votre intérêt continu pour notre travail,<br />\n{$editorialContactSignature}	Nous envoyons ce courriel aux lecteurs inscrits qui ont demandé à recevoir un avis par courriel quand un numéro devient disponible à accès libre.
SUBSCRIPTION_BEFORE_EXPIRY	fr_CA	Rappel de l'expiration de l'abonnement	{$subscriberName}:<br />\n<br />\nVotre abonnement à {$contextName} expirera bientôt.<br />\n<br />\n{$subscriptionType}<br />\nDate d'expiration: {$expiryDate}<br />\n<br />\nAfin d'assurer la continuité de votre accès à cette revue, nous vous prions d'aller sur le site Web de la revue et de renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d'utilisateur, &quot;{$username}&quot;.<br />\n<br />\nSi vous avez des questions, ne pas hésiter à communiquer avec moi.<br />\n<br />\n{$subscriptionContactSignature}	Ce courriel avise un abonné que son abonnement expiera sous peu. Il fournit l'adresse URL de la revue, ainsi que les instructions pour y accéder.
REVIEWER_REGISTER	fr_CA	Inscription en tant qu'évaluateur de {$contextName}	Compte tenu de votre expertise, nous avons pris l'initiative d'inscrire votre nom dans la base de données des évaluateurs de {$contextName}. Cela ne vous engage d'aucune façon, mais nous permet simplement de solliciter vos services pour l'évaluation d'une soumission. Si vous êtes invité à effectuer une évaluation, vous recevrez le titre et le résumé de l'article en question, et serez toujours libre d'accepter ou de refuser une telle invitation. À tout moment, il vous est également possible de demander à ce que votre nom soit retiré de la liste des évaluateurs.<br />\n<br />\nNous vous acheminons un nom d'utilisateur et un mot de passe, car tous deux sont requis pour tout échange avec la revue, par l'intermédiaire de ce site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise à jour de votre profil, y compris vos intérêts en matière d'évaluation.<br />\n<br />\nNom d'utilisateur : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}	Ce courriel est envoyé à un évaluateur nouvellement inscrit, afin de l'accueillir dans le système et lui offrir un enregistrement de son nom d'utilisateur et mot de passe.
NOTIFICATION	fr_CA	Nouvel avis de {$siteTitle}	Vous avez un nouvel avis de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs inscrits qui ont choisi de recevoir par courriel ce type d'avis.
NOTIFICATION_MAILLIST	fr_CA	Nouvel avis de {$siteTitle}	Vous avez un avis de {$siteTitle}:<br />\n--<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n--<br />\n<br />\nSi vous souhaitez ne plus recevoir d'avis par courriel, veuillez aller à {$unsubscribeLink} et saisir votre adresse de courriel et mot de passe.<br />\n<br />\n{$principalContactSignature}	Ce courriel est envoyé aux utilisateurs non inscrits sur la liste de diffusion d'avis.
NOTIFICATION_MAILLIST_WELCOME	fr_CA	Bienvenue à la liste de diffusion de {$siteTitle}!	Vous vous êtes inscrits pour recevoir des avis de {$siteTitle}.<br />\n<br />\nVeuillez cliquer sur ce lien pour confirmer votre demande et ajouter votre adresse de courriel à la liste de diffusion : {$confirmLink}<br />\n<br />\nSi vous souhaitez  arrêter l'envoi d'avis par courriels, veuillez aller à {$unsubscribeLink} et saisir votre adresse de courriel et votre mot de passe.<br />\n<br />\n{$principalContactSignature}	Cet courriel est envoyé à un utilisateur non enregistré qui vient de s'inscrire à la liste de diffusion des notifications.
EDITOR_DECISION_ACCEPT	fr_CA	Décision du rédacteur	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNotre décision est de :<br />\n<br />\n{$editorialContactSignature}	Cet courriel de l'éditeur ou du chef de rubrique à un auteur les notifie d'une décision finale de «soumission acceptée» concernant leur soumission.
EDITOR_DECISION_REVISIONS	fr_CA	Décision du rédacteur	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNotre décision est de :<br />\n<br />\n{$editorialContactSignature}	Cet courriel de l'éditeur ou du chef de rubrique à un auteur les notifie d'une décision finale de «révision requise» concernant leur soumission.
EDITOR_DECISION_RESUBMIT	fr_CA	Décision du rédacteur	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNotre décision est de :<br />\n<br />\n{$editorialContactSignature}	Cet courriel de l'éditeur ou du chef de rubrique à un auteur les notifie d'une décision finale de «soumission à redéposer» concernant leur soumission.
EDITOR_DECISION_DECLINE	fr_CA	Décision du rédacteur	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNotre décision est de :<br />\n<br />\n{$editorialContactSignature}	Cet courriel de l'éditeur ou du chef de rubrique à un auteur les notifie d'une décision finale de «soumission refusée» concernant leur soumission.
SUBSCRIPTION_PURCHASE_INDL	fr_CA	Souscription à un abonnement: Individuel	Souscription en ligne à un abonnement individuel pour {$contextName} avec les détails suivants :<br />\n<br />\nType d'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur :<br />\n{$userDetails}<br />\n<br />\nInformation d'adhésion (si fournie):<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivante.<br />\n<br />\nURL d'abonnement: {$subscriptionUrl}	
SUBSCRIPTION_PURCHASE_INSTL	fr_CA	Souscription à un abonnement: Institutionnel	Souscription en ligne à un abonnement institutionnel pour {$contextName} avec les informations suivantes. Pour activer cet abonnement, veuillez utiliser l'URL d'abonnement fourni et fixer le statut de l'abonnement à 'Actif'.<br />\n<br />\nType d'abonnement:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni):<br />\n{$domain}<br />\n<br />\nIntervalle d'adresses IP (si fourni):<br />\n{$ipRanges}<br />\n<br />\nPersonne contact:<br />\n{$userDetails}<br />\n<br />\nInformation d'adhésion (si fourni):<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivant :<br />\n<br />\nURL de l'abonnement : {$subscriptionUrl}	
SUBSCRIPTION_RENEW_INDL	fr_CA	Renouvellement d'abonnement : Individuel	Un abonnement individuel a été renouvelé en ligne pour {$contextName} avec les détails suivants.<br />\n<br />\nType d'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur :<br />\n{$userDetails}<br />\n<br />\nInformation d'adhésion (si fourni):<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivant.<br />\n<br />\nURL de l'abonnement : {$subscriptionUrl}	
SUBSCRIPTION_RENEW_INSTL	fr_CA	Renouvellement d'abonnement : Institutionnel	Un abonnement institutionnel a été renouvelé en ligne pour {$contextName} avec les informations suivantes.<br />\n<br />\nType d'abonnement:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni):<br />\n{$domain}<br />\n<br />\nIntervalle d'adresses IP (si fourni):<br />\n{$ipRanges}<br />\n<br />\nPersonne contact:<br />\n{$userDetails}<br />\n<br />\nInformation d'adhésion (si fourni):<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l'URL suivant.<br />\n<br />\nURL de l'abonnement : {$subscriptionUrl}	
CITATION_EDITOR_AUTHOR_QUERY	fr_CA	Modification des références	{$authorFirstName},<br />\n<br />\nPourriez-vous vérifier ou nous fournir la référence complète pour la référence suivante, provenant de votre article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nMerci!<br />\n<br />\n{$userFirstName}<br />\nRéviseur, {$contextName}	
EDITOR_DECISION_SEND_TO_EXTERNAL	fr_CA	Décision du rédacteur	{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNotre décision est de : Envoyé pour l'évaluation<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />	Cet courriel de l'éditeur ou du chef de rubrique à un auteur les notifie que leur soumission a été envoyé à une source externe pour son évaluation.
EDITOR_DECISION_SEND_TO_PRODUCTION	fr_CA	Décision du rédacteur		
NOTIFICATION_CENTER_DEFAULT	fr_CA	Un message à propos de {$contextName}		Message blanc par défaut utilisé pour concevoir d'autres messages.
REVIEW_REQUEST_ONECLICK_SUBSEQUENT	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\n<br />\nCeci concerne le manuscrit "{$submissionTitle}", qui est présentement  évalué par{$contextName}.<br />\n<br />\nSuivant l'évaluation de la dernière version du manuscrit, l'auteur a soumis une version révisé de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou simplement indiquer les recommandations suivant votre évaluation.<br />\n<br />\nL'évaluation est dû pour le  {$reviewDueDate}.<br />\n<br />\nHyperlien de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de considérer cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	Ce courriel de l'éditeur de section à un réviseur demande que l'examinateur accepte ou refuse la tâche d'examiner une soumission pour une deuxième ou une plus grande série d'examen. Il fournit des informations sur la soumission, comme le titre et l'abrégé, la date d'échéance de l'examen et la façon d'accéder à la soumission elle-même. Ce message est utilisé lorsque le processus de révision standard est sélectionné dans Administration> Paramètres> Flux des travaux> Révision et que l'accès d'un relecteur est activé.
REVISED_VERSION_NOTIFY	fr_CA	Version révisée téléversée	*{$editorialContactName}:<br />\n<br />\nUne version révisée de &quot;{$submissionTitle}&quot; a été téléversée par {$authorName}.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}	Ce courriel est envoyé automatiquement au rédacteur attribué quand un auteur téléverse une version révisée d'un article.
REVIEW_REQUEST_REMIND_AUTO	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\nCeci est un rappel concernant notre demande d'évaluation de &quot;{$submissionTitle},&quot; pour {$contextName}. Nous espérions recevoir une réponse avant le {$responseDueDate}. Ce courriel est envoyé automatiquement après dépassement du délais.\n<br />\nNous pensons que vous seriez un excellent évaluateur pour le manuscrit. Vous trouverez un résumé de la soumission en suivant l'hyperlien plus bas.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou simplement indiquer les recommandations suivant votre évaluation. Le site web est  {$contextUrl}<br />\n<br />\nL'évaluation est dû pour le  {$reviewDueDate}.<br />\n<br />\nSi vous n'avez pas votre identifiant pour le site de la revue, vous pouvez utiliser l'hyperlien suivant pour entrer un nouveau mot de passe.\n{$passwordResetUrl}<br />\n<br />\nHyperlien de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de considérer cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	Ce courriel est automatiquement envoyé lorsque la date d'échéance de confirmation d'un évaluateur est écoulée (voir Options de révision sous Paramètres> Flux des travaux> Révision) et l'accès de l'évaluateur en un clic est désactivé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).
REVIEW_REQUEST_REMIND_AUTO_ONECLICK	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\nCeci est un rappel concernant notre demande d'évaluation de &quot;{$submissionTitle},&quot; pour {$contextName}. Nous espérions recevoir une réponse avant le {$responseDueDate}. Ce courriel est envoyé automatiquement après dépassement du délais.\n<br />\nNous pensons que vous seriez un excellent évaluateur pour le manuscrit. Vous trouverez un résumé de la soumission en suivant l'hyperlien plus bas.<br />\n<br />\nVous seriez aimable de vous authentifier sur la page de la revue en nous indiquant si vous participerez à cette évaluation ou non, ou mieux, indiquer les recommandations suivant l'évaluation de ce manuscrit.<br />\n<br />\nL'évaluation est dû pour le  {$reviewDueDate}.<br />\n<br />\nSi vous n'avez pas votre identifiant pour le site de la revue, vous pouvez utiliser l'hyperlien suivant pour entrer un nouveau mot de passe.\n{$passwordResetUrl}<br />\n<br />\nHyperlien de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de considérer cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	Ce courriel est automatiquement envoyé lorsque la date d'échéance de confirmation d'un évaluateur est écoulée (voir Options de révision sous Paramètres> Flux des travaux> Révision) et l'accès de l'évaluateur en un clic est activé. Les tâches planifiées doivent être configurées et activées (voir le fichier de configuration du site).
REVIEW_REQUEST_SUBSEQUENT	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\n<br />\nCeci concerne le manuscrit "{$submissionTitle}", qui est présentement  évalué par{$contextName}.<br />\n<br />\nSuivant l'évaluation de la dernière version du manuscrit, l'auteur a soumis une version révisé de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou simplement indiquer les recommandations suivant votre évaluation.<br />\n<br />\nL'évaluation est dû pour le  {$reviewDueDate}.<br />\n<br />\nHyperlien de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de considérer cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}	Ce courriel de l'éditeur de section à un réviseur demande que l'évaluateur accepte ou refuse la tâche d'examiner une soumission pour une deuxième fois ou plus. Il fournit des informations sur la soumission, comme le titre et le résumé, la date d'échéance de l'examen et la façon d'accéder à la soumission elle-même. Ce message est utilisé lorsque le processus de révision standard est sélectionné dans Administration> Paramètres> Flux des travaux> Révision et que l'accès d'un relecteur est activé. (Autrement voir REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)
REVIEW_REQUEST_ATTACHED_SUBSEQUENT	fr_CA	Demande d'évaluation d'un article	{$reviewerName}:<br />\n<br />\nCeci concerne le manuscrit "{$submissionTitle}", qui est présentement  évalué par{$contextName}.<br />\n<br />\nSuivant l'évaluation de la dernière version du manuscrit, l'auteur a soumis une version révisé de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nLes critères d'évaluation sont inclus plus bas (en suivant le l'hyperlien) et la soumission en pièce attachée. Votre évaluation du manuscrit ainsi que vos recommandations doivent être envoyés par courriel avant le {$reviewDueDate}.<br />\n<br />\nIndiquez dans un courriel avant le {$responseDueDate} si vous voulez participer à l'évaluation.<br />\n<br />\nMerci de considérer cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\nCritères pour l'évaluation<br />\n<br />\n{$reviewGuidelines}<br />	Ce courriel de l'éditeur de section à un réviseur demande que l'évaluateur accepte ou refuse la tâche d'examiner une soumission pour une deuxième fois ou plus. Il fournit des informations sur la soumission, comme le titre et le résumé, la date d'échéance de l'évaluation et la façon d'accéder à la soumission elle-même. Ce message est utilisé lorsque le processus de révision avec pièce jointe est sélectionné dans Administration> Paramètres> Flux des travaux> Révision.(Autrement voir REVIEW_REQUEST_SUBSEQUENT.)
SUBMISSION_ACK_NOT_USER	fr_CA	Accusé de réception de la soumission	Bonjour,<br />\n<br />\nLe manuscrit intitulé , &quot;{$submissionTitle}&quot;, a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n'hésitez pas à communiquer avec nous. Nous vous remercions d'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}	Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteurs, i.e. ceux qui ne sont pas l'utilisateur enregistré faisant la soumission.
ORCID_COLLECT_AUTHOR_ID	en_US	Submission ORCID	Dear {$authorName},\n\nYou have been listed as a co-author on the manuscript submission "{$articleTitle}" to {$journalName}. \n\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.\n\n{$authorOrcidUrl}\n\nIf you have any questions, please contact me.\n\n{$editorialContactSignature}\n\n\n	This email template is used to collect the ORCID id's from co-authors.
PAYPAL_INVESTIGATE_PAYMENT	en_US	Unusual PayPal Activity	Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n	This email template is used to notify a journal's primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.
PAYPAL_INVESTIGATE_PAYMENT	fr_CA	Activité inhabituelle de PayPal	L'Open Journal Systems a remarqué une activité inhabituelle concernant la prise en charge du paiement PayPal pour la revue {$contextName}. Cette activité pourrait nécessiter une attention particulière ou une intervention manuelle.<br />\n                       <br />\nCe courriel a été généré par le plugiciel PayPal du Open Journal Systems.<br />\n<br />\nInformation complète de la demande :<br />\n{$postInfo}<br />\n<br />\nInformation supplémentaire (si fournie) :<br />\n{$additionalInfo}<br />\n<br />\nVariables serveur :<br />\n{$serverVars}<br />\n	Ce modèle de courriel est utilisé pour aviser un contact principal d'une revue qu'une activité inhabituelle ou requérant une intervention manuelle a été remarquée par le plugiciel PayPal.
MANUAL_PAYMENT_NOTIFICATION	en_US	Manual Payment Notification	A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems' Manual Payment plugin.	This email template is used to notify a journal manager contact that a manual payment was requested.
MANUAL_PAYMENT_NOTIFICATION	fr_CA	Avis de paiement manuel	Un paiement manuel doit être traité pour la revue {$contextName} et l'utilisateur {$userFullName} (nom d'utilisateur &quot;{$userName}&quot;).<br />\n<br />\nL'élément facturé est &quot;{$itemName}&quot;.<br />\nLe coût est de {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.	Ce modèle de courriel est utilisé pour aviser un directeur de revue que le paiement manuel a été demandé.
\.


--
-- Name: email_templates_default_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('email_templates_default_email_id_seq', 58, true);


--
-- Name: email_templates_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('email_templates_email_id_seq', 1, false);


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY event_log (log_id, assoc_type, assoc_id, user_id, date_logged, ip_address, event_type, message, is_translated) FROM stdin;
1	515	1	17	2017-10-24 17:43:26	::1	1342177281	submission.event.fileUploaded	0
2	1048585	1	17	2017-10-24 17:43:28	::1	1342177281	submission.event.fileUploaded	0
3	1048585	1	17	2017-10-24 17:43:40	::1	268435457	submission.event.submissionSubmitted	0
4	1048585	1	3	2017-10-24 17:44:00	::1	805306371	log.editor.decision	0
5	1048585	1	3	2017-10-24 17:44:10	::1	268435459	submission.event.participantAdded	0
6	1048585	1	6	2017-10-24 17:44:29	::1	805306372	log.editor.recommendation	0
7	515	3	18	2017-10-24 17:45:01	::1	1342177281	submission.event.fileUploaded	0
8	1048585	2	18	2017-10-24 17:45:03	::1	1342177281	submission.event.fileUploaded	0
9	1048585	2	18	2017-10-24 17:45:15	::1	268435457	submission.event.submissionSubmitted	0
10	1048585	2	3	2017-10-24 17:45:31	::1	805306371	log.editor.decision	0
11	1048585	2	3	2017-10-24 17:45:43	::1	1073741825	log.review.reviewerAssigned	0
12	1048585	2	3	2017-10-24 17:45:51	::1	1073741825	log.review.reviewerAssigned	0
13	1048585	2	3	2017-10-24 17:45:56	::1	805306371	log.editor.decision	0
14	1048585	2	3	2017-10-24 17:46:08	::1	268435459	submission.event.participantAdded	0
15	515	5	19	2017-10-24 17:46:34	::1	1342177281	submission.event.fileUploaded	0
16	1048585	3	19	2017-10-24 17:46:36	::1	1342177281	submission.event.fileUploaded	0
17	1048585	3	19	2017-10-24 17:46:48	::1	268435457	submission.event.submissionSubmitted	0
18	515	6	20	2017-10-24 17:47:06	::1	1342177281	submission.event.fileUploaded	0
19	1048585	4	20	2017-10-24 17:47:09	::1	1342177281	submission.event.fileUploaded	0
20	1048585	4	20	2017-10-24 17:47:17	::1	268435457	submission.event.submissionSubmitted	0
21	1048585	4	3	2017-10-24 17:47:32	::1	805306371	log.editor.decision	0
22	1048585	4	3	2017-10-24 17:47:50	::1	1073741825	log.review.reviewerAssigned	0
23	1048585	4	3	2017-10-24 17:47:57	::1	1073741825	log.review.reviewerAssigned	0
24	1048585	4	3	2017-10-24 17:48:01	::1	805306371	log.editor.decision	0
25	1048585	4	3	2017-10-24 17:48:11	::1	268435459	submission.event.participantAdded	0
26	1048585	4	3	2017-10-24 17:48:17	::1	805306371	log.editor.decision	0
27	1048585	4	3	2017-10-24 17:48:24	::1	268435459	submission.event.participantAdded	0
28	1048585	4	3	2017-10-24 17:48:29	::1	268435459	submission.event.participantAdded	0
29	515	8	21	2017-10-24 17:48:47	::1	1342177281	submission.event.fileUploaded	0
30	1048585	5	21	2017-10-24 17:48:50	::1	1342177281	submission.event.fileUploaded	0
31	1048585	5	21	2017-10-24 17:48:57	::1	268435457	submission.event.submissionSubmitted	0
32	1048585	5	3	2017-10-24 17:49:13	::1	805306371	log.editor.decision	0
33	1048585	5	3	2017-10-24 17:49:24	::1	1073741825	log.review.reviewerAssigned	0
34	1048585	5	3	2017-10-24 17:49:30	::1	1073741825	log.review.reviewerAssigned	0
35	1048585	5	3	2017-10-24 17:49:35	::1	805306371	log.editor.decision	0
36	1048585	5	3	2017-10-24 17:49:43	::1	268435459	submission.event.participantAdded	0
37	1048585	5	3	2017-10-24 17:49:48	::1	805306371	log.editor.decision	0
38	1048585	5	3	2017-10-24 17:49:56	::1	268435459	submission.event.participantAdded	0
39	515	10	22	2017-10-24 17:50:16	::1	1342177281	submission.event.fileUploaded	0
40	1048585	6	22	2017-10-24 17:50:18	::1	1342177281	submission.event.fileUploaded	0
41	1048585	6	22	2017-10-24 17:50:25	::1	268435457	submission.event.submissionSubmitted	0
42	1048585	6	3	2017-10-24 17:50:39	::1	805306371	log.editor.decision	0
43	1048585	6	3	2017-10-24 17:50:50	::1	1073741825	log.review.reviewerAssigned	0
44	1048585	6	3	2017-10-24 17:50:56	::1	1073741825	log.review.reviewerAssigned	0
45	1048585	6	3	2017-10-24 17:51:02	::1	1073741825	log.review.reviewerAssigned	0
46	1048585	6	8	2017-10-24 17:51:16	::1	1073741830	log.review.reviewAccepted	0
47	515	12	23	2017-10-24 17:51:41	::1	1342177281	submission.event.fileUploaded	0
48	1048585	7	23	2017-10-24 17:51:44	::1	1342177281	submission.event.fileUploaded	0
49	1048585	7	23	2017-10-24 17:51:55	::1	268435457	submission.event.submissionSubmitted	0
50	515	13	24	2017-10-24 17:52:20	::1	1342177281	submission.event.fileUploaded	0
51	1048585	8	24	2017-10-24 17:52:22	::1	1342177281	submission.event.fileUploaded	0
52	1048585	8	24	2017-10-24 17:52:31	::1	268435457	submission.event.submissionSubmitted	0
53	1048585	8	3	2017-10-24 17:52:48	::1	805306371	log.editor.decision	0
54	1048585	8	3	2017-10-24 17:52:59	::1	1073741825	log.review.reviewerAssigned	0
55	1048585	8	3	2017-10-24 17:53:06	::1	1073741825	log.review.reviewerAssigned	0
56	1048585	8	3	2017-10-24 17:53:10	::1	805306371	log.editor.decision	0
57	1048585	8	3	2017-10-24 17:53:21	::1	268435459	submission.event.participantAdded	0
58	1048585	8	3	2017-10-24 17:53:27	::1	805306371	log.editor.decision	0
59	1048585	8	3	2017-10-24 17:53:37	::1	268435459	submission.event.participantAdded	0
60	1048585	8	3	2017-10-24 17:53:44	::1	268435459	submission.event.participantAdded	0
61	515	27	25	2017-10-24 17:54:19	::1	1342177281	submission.event.fileUploaded	0
62	1048585	15	25	2017-10-24 17:54:21	::1	1342177281	submission.event.fileUploaded	0
63	1048585	15	25	2017-10-24 17:54:29	::1	268435457	submission.event.submissionSubmitted	0
64	1048585	15	3	2017-10-24 17:54:45	::1	805306371	log.editor.decision	0
65	1048585	15	3	2017-10-24 17:54:56	::1	1073741825	log.review.reviewerAssigned	0
66	1048585	15	3	2017-10-24 17:55:02	::1	1073741825	log.review.reviewerAssigned	0
67	1048585	15	3	2017-10-24 17:55:07	::1	1073741825	log.review.reviewerAssigned	0
68	1048585	15	3	2017-10-24 17:55:12	::1	805306371	log.editor.decision	0
69	1048585	15	3	2017-10-24 17:55:20	::1	268435459	submission.event.participantAdded	0
70	1048585	15	3	2017-10-24 17:55:26	::1	805306371	log.editor.decision	0
71	1048585	15	3	2017-10-24 17:55:34	::1	268435459	submission.event.participantAdded	0
72	1048585	15	3	2017-10-24 17:55:42	::1	268435459	submission.event.participantAdded	0
73	515	29	3	2017-10-24 17:55:53	::1	1342177281	submission.event.fileUploaded	0
74	1048585	15	3	2017-10-24 17:55:56	::1	1342177281	submission.event.fileUploaded	0
75	515	30	26	2017-10-24 17:56:17	::1	1342177281	submission.event.fileUploaded	0
76	1048585	16	26	2017-10-24 17:56:19	::1	1342177281	submission.event.fileUploaded	0
77	1048585	16	26	2017-10-24 17:56:28	::1	268435457	submission.event.submissionSubmitted	0
78	1048585	16	3	2017-10-24 17:56:47	::1	805306371	log.editor.decision	0
79	1048585	16	3	2017-10-24 17:56:59	::1	1073741825	log.review.reviewerAssigned	0
80	1048585	16	3	2017-10-24 17:57:08	::1	1073741825	log.review.reviewerAssigned	0
81	1048585	16	9	2017-10-24 17:57:26	::1	1073741830	log.review.reviewAccepted	0
82	1048585	16	10	2017-10-24 17:57:47	::1	1073741830	log.review.reviewAccepted	0
83	515	32	27	2017-10-24 17:58:15	::1	1342177281	submission.event.fileUploaded	0
84	1048585	17	27	2017-10-24 17:58:18	::1	1342177281	submission.event.fileUploaded	0
85	1048585	17	27	2017-10-24 17:58:33	::1	268435457	submission.event.submissionSubmitted	0
86	515	33	28	2017-10-24 17:58:51	::1	1342177281	submission.event.fileUploaded	0
87	1048585	18	28	2017-10-24 17:58:54	::1	1342177281	submission.event.fileUploaded	0
88	1048585	18	28	2017-10-24 17:59:05	::1	268435457	submission.event.submissionSubmitted	0
89	1048585	18	3	2017-10-24 17:59:25	::1	805306371	log.editor.decision	0
90	1048585	18	3	2017-10-24 17:59:43	::1	1073741825	log.review.reviewerAssigned	0
91	1048585	18	3	2017-10-24 17:59:54	::1	1073741825	log.review.reviewerAssigned	0
92	515	35	29	2017-10-24 18:00:21	::1	1342177281	submission.event.fileUploaded	0
93	1048585	19	29	2017-10-24 18:00:23	::1	1342177281	submission.event.fileUploaded	0
94	1048585	19	29	2017-10-24 18:00:34	::1	268435457	submission.event.submissionSubmitted	0
95	1048585	19	3	2017-10-24 18:01:03	::1	805306371	log.editor.decision	0
96	1048585	19	3	2017-10-24 18:01:21	::1	1073741825	log.review.reviewerAssigned	0
97	1048585	19	3	2017-10-24 18:01:30	::1	1073741825	log.review.reviewerAssigned	0
98	1048585	19	3	2017-10-24 18:01:40	::1	1073741825	log.review.reviewerAssigned	0
99	1048585	19	7	2017-10-24 18:02:01	::1	1073741830	log.review.reviewAccepted	0
100	1048585	19	9	2017-10-24 18:02:32	::1	1073741830	log.review.reviewAccepted	0
101	1048585	19	10	2017-10-24 18:03:06	::1	1073741830	log.review.reviewAccepted	0
102	1048585	19	3	2017-10-24 18:03:50	::1	805306371	log.editor.decision	0
103	515	37	30	2017-10-24 18:04:18	::1	1342177281	submission.event.fileUploaded	0
104	1048585	20	30	2017-10-24 18:04:20	::1	1342177281	submission.event.fileUploaded	0
105	1048585	20	30	2017-10-24 18:04:30	::1	268435457	submission.event.submissionSubmitted	0
106	515	38	31	2017-10-24 18:04:46	::1	1342177281	submission.event.fileUploaded	0
107	1048585	21	31	2017-10-24 18:04:49	::1	1342177281	submission.event.fileUploaded	0
108	1048585	21	31	2017-10-24 18:04:59	::1	268435457	submission.event.submissionSubmitted	0
109	1048585	21	3	2017-10-24 18:05:19	::1	805306371	log.editor.decision	0
110	1048585	21	3	2017-10-24 18:05:31	::1	1073741825	log.review.reviewerAssigned	0
111	1048585	21	3	2017-10-24 18:05:37	::1	1073741825	log.review.reviewerAssigned	0
112	1048585	21	3	2017-10-24 18:05:42	::1	805306371	log.editor.decision	0
113	1048585	21	3	2017-10-24 18:05:52	::1	268435459	submission.event.participantAdded	0
114	1048585	21	3	2017-10-24 18:05:58	::1	805306371	log.editor.decision	0
115	1048585	21	3	2017-10-24 18:06:09	::1	268435459	submission.event.participantAdded	0
116	515	40	32	2017-10-24 18:06:29	::1	1342177281	submission.event.fileUploaded	0
117	1048585	22	32	2017-10-24 18:06:31	::1	1342177281	submission.event.fileUploaded	0
118	1048585	22	32	2017-10-24 18:06:39	::1	268435457	submission.event.submissionSubmitted	0
119	515	41	33	2017-10-24 18:07:06	::1	1342177281	submission.event.fileUploaded	0
120	1048585	23	33	2017-10-24 18:07:08	::1	1342177281	submission.event.fileUploaded	0
121	1048585	23	33	2017-10-24 18:07:19	::1	268435457	submission.event.submissionSubmitted	0
122	1048585	23	3	2017-10-24 18:07:37	::1	805306371	log.editor.decision	0
123	1048585	23	3	2017-10-24 18:07:47	::1	1073741825	log.review.reviewerAssigned	0
124	1048585	23	3	2017-10-24 18:07:54	::1	1073741825	log.review.reviewerAssigned	0
125	1048585	23	3	2017-10-24 18:07:59	::1	805306371	log.editor.decision	0
126	1048585	23	3	2017-10-24 18:08:11	::1	268435459	submission.event.participantAdded	0
127	1048585	23	3	2017-10-24 18:08:17	::1	805306371	log.editor.decision	0
128	1048585	23	3	2017-10-24 18:08:29	::1	268435459	submission.event.participantAdded	0
129	1048585	23	3	2017-10-24 18:08:36	::1	268435459	submission.event.participantAdded	0
130	515	43	3	2017-10-24 18:08:48	::1	1342177281	submission.event.fileUploaded	0
131	1048585	23	3	2017-10-24 18:08:50	::1	1342177281	submission.event.fileUploaded	0
132	515	44	34	2017-10-24 18:09:19	::1	1342177281	submission.event.fileUploaded	0
133	1048585	24	34	2017-10-24 18:09:22	::1	1342177281	submission.event.fileUploaded	0
134	1048585	24	34	2017-10-24 18:09:33	::1	268435457	submission.event.submissionSubmitted	0
135	1048585	24	3	2017-10-24 18:09:54	::1	805306371	log.editor.decision	0
136	515	45	35	2017-10-24 18:10:16	::1	1342177281	submission.event.fileUploaded	0
137	1048585	25	35	2017-10-24 18:10:19	::1	1342177281	submission.event.fileUploaded	0
138	1048585	25	35	2017-10-24 18:10:29	::1	268435457	submission.event.submissionSubmitted	0
139	1048585	25	3	2017-10-24 18:10:48	::1	805306371	log.editor.decision	0
140	1048585	25	3	2017-10-24 18:11:04	::1	1073741825	log.review.reviewerAssigned	0
141	1048585	25	3	2017-10-24 18:11:12	::1	1073741825	log.review.reviewerAssigned	0
142	1048585	25	3	2017-10-24 18:11:17	::1	805306371	log.editor.decision	0
143	1048585	25	3	2017-10-24 18:11:28	::1	268435459	submission.event.participantAdded	0
\.


--
-- Name: event_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('event_log_log_id_seq', 143, true);


--
-- Data for Name: event_log_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY event_log_settings (log_id, setting_name, setting_value, setting_type) FROM stdin;
1	fileStage	2	int
1	revisedFileId	\N	string
1	fileId	1	string
1	fileRevision	1	int
1	originalFileName	theinfluenceoflactationonthequantityandqualityofcashmereproduction.pdf	string
1	submissionId	1	int
1	username	ccorino	string
2	fileStage	2	int
2	fileId	1	int
2	fileRevision	1	int
2	originalFileName	theinfluenceoflactationonthequantityandqualityofcashmereproduction.pdf	string
2	submissionId	1	int
2	username	ccorino	string
2	name	The influence of lactation on the quantity and quality of cashmere production	string
4	editorName	Daniel Barnes	string
4	submissionId	1	string
4	decision	Send to Review	string
5	name	Minoti Inoue	string
5	username	minoue	string
5	userGroupName	Section editor	string
6	editorName	Minoti Inoue	string
6	submissionId	1	string
6	decision	Accept Submission	string
7	fileStage	2	int
7	revisedFileId	\N	string
7	fileId	3	string
7	fileRevision	1	int
7	originalFileName	thefacetsofjobsatisfactionaninenationcomparativestudyofconstructequivalence.pdf	string
7	submissionId	2	int
7	username	ckwantes	string
8	fileStage	2	int
8	fileId	3	int
8	fileRevision	1	int
8	originalFileName	thefacetsofjobsatisfactionaninenationcomparativestudyofconstructequivalence.pdf	string
8	submissionId	2	int
8	username	ckwantes	string
8	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence	string
10	editorName	Daniel Barnes	string
10	submissionId	2	string
10	decision	Send to Review	string
11	reviewerName	Aisla McCrae	string
11	submissionId	2	string
11	stageId	3	int
11	round	1	int
12	reviewerName	Adela Gallego	string
12	submissionId	2	string
12	stageId	3	int
12	round	1	int
13	editorName	Daniel Barnes	string
13	submissionId	2	string
13	decision	Accept and Skip Review	string
14	name	Maria Fritz	string
14	username	mfritz	string
14	userGroupName	Copyeditor	string
15	fileStage	2	int
15	revisedFileId	\N	string
15	fileId	5	string
15	fileRevision	1	int
15	originalFileName	computerskillrequirementsfornewandexistingteachersimplicationsforpolicyandpractice.pdf	string
15	submissionId	3	int
15	username	cmontgomerie	string
16	fileStage	2	int
16	fileId	5	int
16	fileRevision	1	int
16	originalFileName	computerskillrequirementsfornewandexistingteachersimplicationsforpolicyandpractice.pdf	string
16	submissionId	3	int
16	username	cmontgomerie	string
16	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice	string
18	fileStage	2	int
18	revisedFileId	\N	string
18	fileId	6	string
18	fileRevision	1	int
18	originalFileName	genetictransformationofforesttrees.pdf	string
18	submissionId	4	int
18	username	ddiouf	string
19	fileStage	2	int
19	fileId	6	int
19	fileRevision	1	int
19	originalFileName	genetictransformationofforesttrees.pdf	string
19	submissionId	4	int
19	username	ddiouf	string
19	name	Genetic transformation of forest trees	string
21	editorName	Daniel Barnes	string
21	submissionId	4	string
21	decision	Send to Review	string
22	reviewerName	Paul Hudson	string
22	submissionId	4	string
22	stageId	3	int
22	round	1	int
23	reviewerName	Adela Gallego	string
23	submissionId	4	string
23	stageId	3	int
23	round	1	int
24	editorName	Daniel Barnes	string
24	submissionId	4	string
24	decision	Accept and Skip Review	string
25	name	Maria Fritz	string
25	username	mfritz	string
25	userGroupName	Copyeditor	string
26	editorName	Daniel Barnes	string
26	submissionId	4	string
26	decision	Send To Production	string
27	name	Graham Cox	string
27	username	gcox	string
27	userGroupName	Layout Editor	string
28	name	Catherine Turner	string
28	username	cturner	string
28	userGroupName	Proofreader	string
29	fileStage	2	int
29	revisedFileId	\N	string
29	fileId	8	string
29	fileRevision	1	int
29	originalFileName	investigatingthesharedbackgroundrequiredforargumentacritiqueoffogelinsthesisondeepdisagreement.pdf	string
29	submissionId	5	int
29	username	dphillips	string
30	fileStage	2	int
30	fileId	8	int
30	fileRevision	1	int
30	originalFileName	investigatingthesharedbackgroundrequiredforargumentacritiqueoffogelinsthesisondeepdisagreement.pdf	string
30	submissionId	5	int
30	username	dphillips	string
30	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement	string
32	editorName	Daniel Barnes	string
32	submissionId	5	string
32	decision	Send to Review	string
33	reviewerName	Julie Janssen	string
33	submissionId	5	string
33	stageId	3	int
33	round	1	int
34	reviewerName	Adela Gallego	string
34	submissionId	5	string
34	stageId	3	int
34	round	1	int
35	editorName	Daniel Barnes	string
35	submissionId	5	string
35	decision	Accept and Skip Review	string
36	name	Maria Fritz	string
36	username	mfritz	string
36	userGroupName	Copyeditor	string
37	editorName	Daniel Barnes	string
37	submissionId	5	string
37	decision	Send To Production	string
38	name	Graham Cox	string
38	username	gcox	string
38	userGroupName	Layout Editor	string
39	fileStage	2	int
39	revisedFileId	\N	string
39	fileId	10	string
39	fileRevision	1	int
39	originalFileName	developingefficacybeliefsintheclassroom.pdf	string
39	submissionId	6	int
39	username	dsokoloff	string
40	fileStage	2	int
40	fileId	10	int
40	fileRevision	1	int
40	originalFileName	developingefficacybeliefsintheclassroom.pdf	string
40	submissionId	6	int
40	username	dsokoloff	string
40	name	Developing efficacy beliefs in the classroom	string
42	editorName	Daniel Barnes	string
42	submissionId	6	string
42	decision	Send to Review	string
43	reviewerName	Paul Hudson	string
43	submissionId	6	string
43	stageId	3	int
43	round	1	int
44	reviewerName	Aisla McCrae	string
44	submissionId	6	string
44	stageId	3	int
44	round	1	int
45	reviewerName	Adela Gallego	string
45	submissionId	6	string
45	stageId	3	int
45	round	1	int
46	reviewerName	Paul Hudson	string
46	submissionId	6	string
46	round	1	string
47	fileStage	2	int
47	revisedFileId	\N	string
47	fileId	12	string
47	fileRevision	1	int
47	originalFileName	traditionsandtrendsinthestudyofthecommons.pdf	string
47	submissionId	7	int
47	username	eostrom	string
48	fileStage	2	int
48	fileId	12	int
48	fileRevision	1	int
48	originalFileName	traditionsandtrendsinthestudyofthecommons.pdf	string
48	submissionId	7	int
48	username	eostrom	string
48	name	Traditions and Trends in the Study of the Commons	string
50	fileStage	2	int
50	revisedFileId	\N	string
50	fileId	13	string
50	fileRevision	1	int
50	originalFileName	hansenpintoreasonreclaimed.pdf	string
50	submissionId	8	int
50	username	fpaglieri	string
51	fileStage	2	int
51	fileId	13	int
51	fileRevision	1	int
51	originalFileName	hansenpintoreasonreclaimed.pdf	string
51	submissionId	8	int
51	username	fpaglieri	string
51	name	Hansen & Pinto: Reason Reclaimed	string
53	editorName	Daniel Barnes	string
53	submissionId	8	string
53	decision	Send to Review	string
54	reviewerName	Julie Janssen	string
54	submissionId	8	string
54	stageId	3	int
54	round	1	int
55	reviewerName	Adela Gallego	string
55	submissionId	8	string
55	stageId	3	int
55	round	1	int
56	editorName	Daniel Barnes	string
56	submissionId	8	string
56	decision	Accept and Skip Review	string
57	name	Sarah Vogt	string
57	username	svogt	string
57	userGroupName	Copyeditor	string
58	editorName	Daniel Barnes	string
58	submissionId	8	string
58	decision	Send To Production	string
59	name	Stephen Hellier	string
59	username	shellier	string
59	userGroupName	Layout Editor	string
60	name	Sabine Kumar	string
60	username	skumar	string
60	userGroupName	Proofreader	string
61	fileStage	2	int
61	revisedFileId	\N	string
61	fileId	27	string
61	fileRevision	1	int
61	originalFileName	signallingtheorydividendsareviewoftheliteratureandempiricalevidence.pdf	string
61	submissionId	15	int
61	username	jmwandenga	string
62	fileStage	2	int
62	fileId	27	int
62	fileRevision	1	int
62	originalFileName	signallingtheorydividendsareviewoftheliteratureandempiricalevidence.pdf	string
62	submissionId	15	int
62	username	jmwandenga	string
93	fileRevision	1	int
62	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence	string
64	editorName	Daniel Barnes	string
64	submissionId	15	string
64	decision	Send to Review	string
65	reviewerName	Julie Janssen	string
65	submissionId	15	string
65	stageId	3	int
65	round	1	int
66	reviewerName	Aisla McCrae	string
66	submissionId	15	string
66	stageId	3	int
66	round	1	int
67	reviewerName	Adela Gallego	string
67	submissionId	15	string
67	stageId	3	int
67	round	1	int
68	editorName	Daniel Barnes	string
68	submissionId	15	string
68	decision	Accept and Skip Review	string
69	name	Sarah Vogt	string
69	username	svogt	string
69	userGroupName	Copyeditor	string
70	editorName	Daniel Barnes	string
70	submissionId	15	string
70	decision	Send To Production	string
71	name	Stephen Hellier	string
71	username	shellier	string
71	userGroupName	Layout Editor	string
72	name	Sabine Kumar	string
72	username	skumar	string
72	userGroupName	Proofreader	string
73	fileStage	10	int
73	revisedFileId	\N	string
73	fileId	29	string
73	fileRevision	1	int
73	originalFileName	pdf.pdf	string
73	submissionId	15	int
73	username	dbarnes	string
74	fileStage	10	int
74	fileId	29	int
74	fileRevision	1	int
74	originalFileName	pdf.pdf	string
74	submissionId	15	int
74	username	dbarnes	string
74	name	PDF	string
75	fileStage	2	int
75	revisedFileId	\N	string
75	fileId	30	string
75	fileRevision	1	int
75	originalFileName	condensingwateravailabilitymodelstofocusonspecificwatermanagementsystems.pdf	string
75	submissionId	16	int
75	username	jnovak	string
76	fileStage	2	int
76	fileId	30	int
76	fileRevision	1	int
76	originalFileName	condensingwateravailabilitymodelstofocusonspecificwatermanagementsystems.pdf	string
76	submissionId	16	int
76	username	jnovak	string
76	name	Condensing Water Availability Models to Focus on Specific Water Management Systems	string
78	editorName	Daniel Barnes	string
78	submissionId	16	string
78	decision	Send to Review	string
79	reviewerName	Aisla McCrae	string
79	submissionId	16	string
79	stageId	3	int
79	round	1	int
80	reviewerName	Adela Gallego	string
80	submissionId	16	string
80	stageId	3	int
80	round	1	int
81	reviewerName	Aisla McCrae	string
81	submissionId	16	string
81	round	1	string
82	reviewerName	Adela Gallego	string
82	submissionId	16	string
82	round	1	string
83	fileStage	2	int
83	revisedFileId	\N	string
83	fileId	32	string
83	fileRevision	1	int
83	originalFileName	learningsustainabledesignthroughservice.pdf	string
83	submissionId	17	int
83	username	kalkhafaji	string
84	fileStage	2	int
84	fileId	32	int
84	fileRevision	1	int
84	originalFileName	learningsustainabledesignthroughservice.pdf	string
84	submissionId	17	int
84	username	kalkhafaji	string
84	name	Learning Sustainable Design through Service	string
86	fileStage	2	int
86	revisedFileId	\N	string
86	fileId	33	string
86	fileRevision	1	int
86	originalFileName	sodiumbutyrateimprovesgrowthperformanceofweanedpigletsduringthefirstperiodafterweaning.pdf	string
86	submissionId	18	int
86	username	lchristopher	string
87	fileStage	2	int
87	fileId	33	int
87	fileRevision	1	int
87	originalFileName	sodiumbutyrateimprovesgrowthperformanceofweanedpigletsduringthefirstperiodafterweaning.pdf	string
87	submissionId	18	int
87	username	lchristopher	string
87	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning	string
89	editorName	Daniel Barnes	string
89	submissionId	18	string
89	decision	Send to Review	string
90	reviewerName	Julie Janssen	string
90	submissionId	18	string
90	stageId	3	int
90	round	1	int
91	reviewerName	Paul Hudson	string
91	submissionId	18	string
91	stageId	3	int
91	round	1	int
92	fileStage	2	int
92	revisedFileId	\N	string
92	fileId	35	string
92	fileRevision	1	int
92	originalFileName	hydrologicconnectivityintheedwardsaquiferbetweensanmarcosspringsandbartonspringsduring2009droughtconditions.pdf	string
92	submissionId	19	int
92	username	lkumiega	string
93	fileStage	2	int
93	fileId	35	int
93	originalFileName	hydrologicconnectivityintheedwardsaquiferbetweensanmarcosspringsandbartonspringsduring2009droughtconditions.pdf	string
93	submissionId	19	int
93	username	lkumiega	string
93	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions	string
95	editorName	Daniel Barnes	string
95	submissionId	19	string
95	decision	Send to Review	string
96	reviewerName	Julie Janssen	string
96	submissionId	19	string
96	stageId	3	int
96	round	1	int
97	reviewerName	Aisla McCrae	string
97	submissionId	19	string
97	stageId	3	int
97	round	1	int
98	reviewerName	Adela Gallego	string
98	submissionId	19	string
98	stageId	3	int
98	round	1	int
99	reviewerName	Julie Janssen	string
99	submissionId	19	string
99	round	1	string
100	reviewerName	Aisla McCrae	string
100	submissionId	19	string
100	round	1	string
101	reviewerName	Adela Gallego	string
101	submissionId	19	string
101	round	1	string
102	editorName	Daniel Barnes	string
102	submissionId	19	string
102	decision	Request Revisions	string
103	fileStage	2	int
103	revisedFileId	\N	string
103	fileId	37	string
103	fileRevision	1	int
103	originalFileName	towardsdesigninganinterculturalcurriculumacasestudyfromtheatlanticcoastofnicaragua.pdf	string
103	submissionId	20	int
103	username	pdaniel	string
104	fileStage	2	int
104	fileId	37	int
104	fileRevision	1	int
104	originalFileName	towardsdesigninganinterculturalcurriculumacasestudyfromtheatlanticcoastofnicaragua.pdf	string
104	submissionId	20	int
104	username	pdaniel	string
104	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua	string
106	fileStage	2	int
106	revisedFileId	\N	string
106	fileId	38	string
106	fileRevision	1	int
106	originalFileName	yamdiseasesanditsmanagementinnigeria.pdf	string
106	submissionId	21	int
106	username	rbaiyewu	string
107	fileStage	2	int
107	fileId	38	int
107	fileRevision	1	int
107	originalFileName	yamdiseasesanditsmanagementinnigeria.pdf	string
107	submissionId	21	int
107	username	rbaiyewu	string
107	name	Yam diseases and its management in Nigeria	string
109	editorName	Daniel Barnes	string
109	submissionId	21	string
109	decision	Send to Review	string
110	reviewerName	Paul Hudson	string
110	submissionId	21	string
110	stageId	3	int
110	round	1	int
111	reviewerName	Aisla McCrae	string
111	submissionId	21	string
111	stageId	3	int
111	round	1	int
112	editorName	Daniel Barnes	string
112	submissionId	21	string
112	decision	Accept and Skip Review	string
113	name	Sarah Vogt	string
113	username	svogt	string
113	userGroupName	Copyeditor	string
114	editorName	Daniel Barnes	string
114	submissionId	21	string
114	decision	Send To Production	string
115	name	Stephen Hellier	string
115	username	shellier	string
115	userGroupName	Layout Editor	string
116	fileStage	2	int
116	revisedFileId	\N	string
116	fileId	40	string
116	fileRevision	1	int
116	originalFileName	influenceoflongtermnutritionwithdifferentdietaryfatsonfattyacidcompositionofheavypigsbackfat.pdf	string
116	submissionId	22	int
116	username	rrossi	string
117	fileStage	2	int
117	fileId	40	int
117	fileRevision	1	int
117	originalFileName	influenceoflongtermnutritionwithdifferentdietaryfatsonfattyacidcompositionofheavypigsbackfat.pdf	string
117	submissionId	22	int
117	username	rrossi	string
117	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat	string
119	fileStage	2	int
119	revisedFileId	\N	string
119	fileId	41	string
119	fileRevision	1	int
119	originalFileName	antimicrobialheavymetalresistanceandplasmidprofileofcoliformsisolatedfromnosocomialinfectionsinahospitalinisfahaniran.pdf	string
119	submissionId	23	int
119	username	vkarbasizaed	string
120	fileStage	2	int
120	fileId	41	int
120	fileRevision	1	int
120	originalFileName	antimicrobialheavymetalresistanceandplasmidprofileofcoliformsisolatedfromnosocomialinfectionsinahospitalinisfahaniran.pdf	string
120	submissionId	23	int
120	username	vkarbasizaed	string
120	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran	string
122	editorName	Daniel Barnes	string
122	submissionId	23	string
122	decision	Send to Review	string
123	reviewerName	Julie Janssen	string
123	submissionId	23	string
123	stageId	3	int
123	round	1	int
124	reviewerName	Paul Hudson	string
124	submissionId	23	string
124	stageId	3	int
124	round	1	int
125	editorName	Daniel Barnes	string
125	submissionId	23	string
125	decision	Accept and Skip Review	string
126	name	Maria Fritz	string
126	username	mfritz	string
126	userGroupName	Copyeditor	string
127	editorName	Daniel Barnes	string
127	submissionId	23	string
127	decision	Send To Production	string
128	name	Graham Cox	string
128	username	gcox	string
128	userGroupName	Layout Editor	string
129	name	Catherine Turner	string
129	username	cturner	string
129	userGroupName	Proofreader	string
130	fileStage	10	int
130	revisedFileId	\N	string
130	fileId	43	string
130	fileRevision	1	int
130	originalFileName	pdf.pdf	string
130	submissionId	23	int
130	username	dbarnes	string
131	fileStage	10	int
131	fileId	43	int
131	fileRevision	1	int
131	originalFileName	pdf.pdf	string
131	submissionId	23	int
131	username	dbarnes	string
131	name	PDF	string
132	fileStage	2	int
132	revisedFileId	\N	string
132	fileId	44	string
132	fileRevision	1	int
132	originalFileName	selforganizationinmultilevelinstitutionsinnetworkedenvironments.pdf	string
132	submissionId	24	int
132	username	vwilliamson	string
133	fileStage	2	int
133	fileId	44	int
133	fileRevision	1	int
133	originalFileName	selforganizationinmultilevelinstitutionsinnetworkedenvironments.pdf	string
133	submissionId	24	int
133	username	vwilliamson	string
133	name	Self-Organization in Multi-Level Institutions in Networked Environments	string
135	editorName	Daniel Barnes	string
135	submissionId	24	string
135	decision	Decline Submission	string
136	fileStage	2	int
136	revisedFileId	\N	string
136	fileId	45	string
136	fileRevision	1	int
136	originalFileName	finocchiaroargumentsaboutarguments.pdf	string
136	submissionId	25	int
136	username	zwoods	string
137	fileStage	2	int
137	fileId	45	int
137	fileRevision	1	int
137	originalFileName	finocchiaroargumentsaboutarguments.pdf	string
137	submissionId	25	int
137	username	zwoods	string
137	name	Finocchiaro: Arguments About Arguments	string
139	editorName	Daniel Barnes	string
139	submissionId	25	string
139	decision	Send to Review	string
140	reviewerName	Paul Hudson	string
140	submissionId	25	string
140	stageId	3	int
140	round	1	int
141	reviewerName	Aisla McCrae	string
141	submissionId	25	string
141	stageId	3	int
141	round	1	int
142	editorName	Daniel Barnes	string
142	submissionId	25	string
142	decision	Accept and Skip Review	string
143	name	Sarah Vogt	string
143	username	svogt	string
143	userGroupName	Copyeditor	string
\.


--
-- Data for Name: external_feed_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY external_feed_settings (feed_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: external_feeds; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY external_feeds (feed_id, journal_id, url, seq, display_homepage, display_block, limit_items, recent_items) FROM stdin;
\.


--
-- Name: external_feeds_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('external_feeds_feed_id_seq', 1, false);


--
-- Data for Name: filter_groups; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY filter_groups (filter_group_id, symbolic, display_name, description, input_type, output_type) FROM stdin;
1	citation=>nlm30	plugins.metadata.nlm30.citationAdapter.displayName	plugins.metadata.nlm30.citationAdapter.description	class::lib.pkp.classes.citation.Citation	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)
2	nlm30=>citation	plugins.metadata.nlm30.citationAdapter.displayName	plugins.metadata.nlm30.citationAdapter.description	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)	class::lib.pkp.classes.citation.Citation
3	plaintext=>nlm30-element-citation	plugins.metadata.nlm30.citationParsers.displayName	plugins.metadata.nlm30.citationParsers.description	primitive::string	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)
4	nlm30-element-citation=>nlm30-element-citation	plugins.metadata.nlm30.citationLookup.displayName	plugins.metadata.nlm30.citationLookup.description	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)
5	nlm30-element-citation=>plaintext	plugins.metadata.nlm30.citationOutput.displayName	plugins.metadata.nlm30.citationOutput.description	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)	primitive::string
6	nlm30-element-citation=>nlm30-xml	plugins.metadata.nlm30Xml.citationOutput.displayName	plugins.metadata.nlm30Xml.citationOutput.description	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)	xml::*
7	submission=>nlm30-article-xml	plugins.metadata.nlm30.nlm30XmlOutput.displayName	plugins.metadata.nlm30.nlm30XmlOutput.description	class::lib.pkp.classes.submission.Submission	xml::*
8	submission=>nlm23-article-xml	plugins.metadata.nlm30.nlm23XmlOutput.displayName	plugins.metadata.nlm30.nlm23XmlOutput.description	class::lib.pkp.classes.submission.Submission	xml::*
9	nlm30-article-xml=>nlm23-article-xml	plugins.metadata.nlm30.nlm30ToNlm23Xml.displayName	plugins.metadata.nlm30.nlm30ToNlm23Xml.description	xml::*	xml::*
10	submission=>reference-list	plugins.metadata.nlm30.refList.displayName	plugins.metadata.nlm30.refList.description	class::lib.pkp.classes.submission.Submission	class::lib.pkp.classes.citation.PlainTextReferencesList
11	mods34=>mods34-xml	plugins.metadata.mods34.mods34XmlOutput.displayName	plugins.metadata.mods34.mods34XmlOutput.description	metadata::plugins.metadata.mods34.schema.Mods34Schema(*)	xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)
12	article=>mods34	plugins.metadata.mods34.articleAdapter.displayName	plugins.metadata.mods34.articleAdapter.description	class::classes.article.Article	metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)
13	mods34=>article	plugins.metadata.mods34.articleAdapter.displayName	plugins.metadata.mods34.articleAdapter.description	metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)	class::classes.article.Article
14	article=>dc11	plugins.metadata.dc11.articleAdapter.displayName	plugins.metadata.dc11.articleAdapter.description	class::classes.article.Article	metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)
15	nlm30-element-citation=>isbn	plugins.citationLookup.isbndbExtraction.displayName	plugins.citationLookup.isbndbExtraction.description	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)	primitive::string
16	isbn=>nlm30-element-citation	plugins.citationLookup.isbndbLookup.displayName	plugins.citationLookup.isbndbLookup.description	primitive::string	metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)
17	article=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.article.Article[]	xml::schema(plugins/importexport/native/native.xsd)
18	native-xml=>article	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.article.Article[]
19	issue=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.issue.Issue[]	xml::schema(plugins/importexport/native/native.xsd)
20	native-xml=>issue	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.issue.Issue[]
21	issuegalley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.issue.IssueGalley[]	xml::schema(plugins/importexport/native/native.xsd)
22	native-xml=>issuegalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.issue.IssueGalley[]
23	author=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.article.Author[]	xml::schema(plugins/importexport/native/native.xsd)
24	native-xml=>author	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.article.Author[]
25	SubmissionFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SubmissionFile	xml::schema(plugins/importexport/native/native.xsd)
26	SubmissionArtworkFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SubmissionArtworkFile	xml::schema(plugins/importexport/native/native.xsd)
27	SupplementaryFile=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::lib.pkp.classes.submission.SupplementaryFile	xml::schema(plugins/importexport/native/native.xsd)
28	native-xml=>SubmissionFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SubmissionFile
29	native-xml=>SubmissionArtworkFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SubmissionArtworkFile
30	native-xml=>SupplementaryFile	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::lib.pkp.classes.submission.SupplementaryFile
31	article-galley=>native-xml	plugins.importexport.native.displayName	plugins.importexport.native.description	class::classes.article.ArticleGalley	xml::schema(plugins/importexport/native/native.xsd)
32	native-xml=>ArticleGalley	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(plugins/importexport/native/native.xsd)	class::classes.article.ArticleGalley[]
33	user=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::classes.user.User[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
34	user-xml=>user	plugins.importexport.users.displayName	plugins.importexport.users.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::classes.users.User[]
35	usergroup=>user-xml	plugins.importexport.users.displayName	plugins.importexport.users.description	class::lib.pkp.classes.security.UserGroup[]	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)
36	user-xml=>usergroup	plugins.importexport.native.displayName	plugins.importexport.native.description	xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)	class::lib.pkp.classes.security.UserGroup[]
37	article=>doaj-xml	plugins.importexport.doaj.displayName	plugins.importexport.doaj.description	class::classes.article.Article[]	xml::schema(plugins/importexport/doaj/doajArticles.xsd)
38	article=>doaj-json	plugins.importexport.doaj.displayName	plugins.importexport.doaj.description	class::classes.article.Article	primitive::string
39	issue=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.issue.Issue[]	xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)
40	article=>crossref-xml	plugins.importexport.crossref.displayName	plugins.importexport.crossref.description	class::classes.article.Article[]	xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)
41	issue=>datacite-xml	plugins.importexport.datacite.displayName	plugins.importexport.datacite.description	class::classes.issue.Issue	xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)
42	article=>datacite-xml	plugins.importexport.datacite.displayName	plugins.importexport.datacite.description	class::classes.article.Article	xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)
43	galley=>datacite-xml	plugins.importexport.datacite.displayName	plugins.importexport.datacite.description	class::classes.article.ArticleGalley	xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)
44	article=>pubmed-xml	plugins.importexport.pubmed.displayName	plugins.importexport.pubmed.description	class::classes.article.Article[]	xml::dtd
45	issue=>medra-xml	plugins.importexport.medra.displayName	plugins.importexport.medra.description	class::classes.issue.Issue[]	xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)
46	article=>medra-xml	plugins.importexport.medra.displayName	plugins.importexport.medra.description	class::classes.article.Article[]	xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)
47	galley=>medra-xml	plugins.importexport.medra.displayName	plugins.importexport.medra.description	class::classes.article.ArticleGalley[]	xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)
\.


--
-- Name: filter_groups_filter_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('filter_groups_filter_group_id_seq', 47, true);


--
-- Data for Name: filter_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY filter_settings (filter_id, locale, setting_name, setting_value, setting_type) FROM stdin;
4		citationOutputFilterName	lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter	string
4		metadataSchemaName	lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema	string
5		settingsMapping	a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}	object
6		citationOutputFilterName	lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter	string
6		metadataSchemaName	lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema	string
7		xsl	lib/pkp/plugins/metadata/nlm30/filter/nlm30-to-23-ref-list.xsl	string
7		xslType	2	int
12		phpVersionMin	5.0.0	string
13		settingsMapping	a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}	object
14		phpVersionMin	5.0.0	string
15		phpVersionMin	5.0.0	string
16		phpVersionMin	5.0.0	string
17		phpVersionMin	5.0.0	string
18		phpVersionMin	5.0.0	string
19		phpVersionMin	5.0.0	string
20		phpVersionMin	5.0.0	string
21		phpVersionMin	5.0.0	string
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY filters (filter_id, filter_group_id, context_id, display_name, class_name, is_template, parent_filter_id, seq) FROM stdin;
1	1	0	Extract metadata from a(n) Citation	lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter	0	0	0
2	2	0	Inject metadata into a(n) Citation	lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter	0	0	0
3	6	0	NLM 3.0 XML Citation Output	lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter	0	0	0
4	7	0	NLM Journal Publishing V3.0 ref-list	lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter	0	0	0
5	8	0	NLM Journal Publishing V2.3 ref-list	lib.pkp.classes.filter.GenericSequencerFilter	0	0	0
6	7	0	NLM 2.3: NLM 3.0	lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter	0	5	1
7	9	0	NLM 2.3: NLM 3.0 to 2.3	lib.pkp.classes.xslt.XSLTransformationFilter	0	5	2
8	11	0	MODS 3.4	lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter	0	0	0
9	12	0	Extract metadata from a(n) Article	plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter	0	0	0
10	13	0	Inject metadata into a(n) Article	plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter	0	0	0
11	14	0	Extract metadata from a(n) Article	plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter	0	0	0
12	4	0	CrossRef	lib.pkp.plugins.citationLookup.crossref.filter.CrossrefNlm30CitationSchemaFilter	1	0	0
13	4	0	ISBNdb	lib.pkp.classes.filter.GenericSequencerFilter	1	0	0
14	15	0	ISBNdb (from NLM)	lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbNlm30CitationSchemaIsbnFilter	0	13	1
15	16	0	ISBNdb	lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbIsbnNlm30CitationSchemaFilter	0	13	2
16	4	0	PubMed	lib.pkp.plugins.citationLookup.pubmed.filter.PubmedNlm30CitationSchemaFilter	1	0	0
17	4	0	WorldCat	lib.pkp.plugins.citationLookup.worldcat.filter.WorldcatNlm30CitationSchemaFilter	1	0	0
18	3	0	ParsCit	lib.pkp.plugins.citationParser.parscit.filter.ParscitRawCitationNlm30CitationSchemaFilter	1	0	0
19	3	0	FreeCite	lib.pkp.plugins.citationParser.freecite.filter.FreeciteRawCitationNlm30CitationSchemaFilter	1	0	0
20	3	0	RegEx	lib.pkp.plugins.citationParser.regex.filter.RegexRawCitationNlm30CitationSchemaFilter	1	0	0
21	3	0	ParaCite	lib.pkp.plugins.citationParser.paracite.filter.ParaciteRawCitationNlm30CitationSchemaFilter	1	0	0
22	17	0	Native XML submission export	plugins.importexport.native.filter.ArticleNativeXmlFilter	0	0	0
23	18	0	Native XML submission import	plugins.importexport.native.filter.NativeXmlArticleFilter	0	0	0
24	19	0	Native XML issue export	plugins.importexport.native.filter.IssueNativeXmlFilter	0	0	0
25	20	0	Native XML issue import	plugins.importexport.native.filter.NativeXmlIssueFilter	0	0	0
26	21	0	Native XML issue galley export	plugins.importexport.native.filter.IssueGalleyNativeXmlFilter	0	0	0
27	22	0	Native XML issue galley import	plugins.importexport.native.filter.NativeXmlIssueGalleyFilter	0	0	0
28	23	0	Native XML author export	plugins.importexport.native.filter.AuthorNativeXmlFilter	0	0	0
29	24	0	Native XML author import	plugins.importexport.native.filter.NativeXmlAuthorFilter	0	0	0
30	28	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlArticleFileFilter	0	0	0
31	29	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlArtworkFileFilter	0	0	0
32	30	0	Native XML submission file import	plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter	0	0	0
33	25	0	Native XML submission file export	lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter	0	0	0
34	26	0	Native XML submission file export	plugins.importexport.native.filter.ArtworkFileNativeXmlFilter	0	0	0
35	27	0	Native XML submission file export	plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter	0	0	0
36	31	0	Native XML representation export	plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter	0	0	0
37	32	0	Native XML representation import	plugins.importexport.native.filter.NativeXmlArticleGalleyFilter	0	0	0
38	33	0	User XML user export	lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter	0	0	0
39	34	0	User XML user import	lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter	0	0	0
40	35	0	Native XML user group export	lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter	0	0	0
41	36	0	Native XML user group import	lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter	0	0	0
42	37	0	DOAJ XML export	plugins.importexport.doaj.filter.DOAJXmlFilter	0	0	0
43	38	0	DOAJ JSON export	plugins.importexport.doaj.filter.DOAJJsonFilter	0	0	0
44	39	0	Crossref XML issue export	plugins.importexport.crossref.filter.IssueCrossrefXmlFilter	0	0	0
45	40	0	Crossref XML issue export	plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter	0	0	0
46	41	0	DataCite XML export	plugins.importexport.datacite.filter.DataciteXmlFilter	0	0	0
47	42	0	DataCite XML export	plugins.importexport.datacite.filter.DataciteXmlFilter	0	0	0
48	43	0	DataCite XML export	plugins.importexport.datacite.filter.DataciteXmlFilter	0	0	0
49	44	0	ArticlePubMedXmlFilter	plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter	0	0	0
50	45	0	mEDRA XML issue export	plugins.importexport.medra.filter.IssueMedraXmlFilter	0	0	0
51	46	0	mEDRA XML article export	plugins.importexport.medra.filter.ArticleMedraXmlFilter	0	0	0
52	47	0	mEDRA XML article export	plugins.importexport.medra.filter.GalleyMedraXmlFilter	0	0	0
\.


--
-- Name: filters_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('filters_filter_id_seq', 52, true);


--
-- Data for Name: genre_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY genre_settings (genre_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	Article Text	string
1	fr_CA	name	Texte de l'article	string
2	en_US	name	Research Instrument	string
2	fr_CA	name	Instruments de recherche	string
3	en_US	name	Research Materials	string
3	fr_CA	name	Matériels de recherche	string
4	en_US	name	Research Results	string
4	fr_CA	name	Résultats de recherche	string
5	en_US	name	Transcripts	string
5	fr_CA	name	Transcriptions	string
6	en_US	name	Data Analysis	string
6	fr_CA	name	Analyse de données	string
7	en_US	name	Data Set	string
7	fr_CA	name	Ensemble de données	string
8	en_US	name	Source Texts	string
8	fr_CA	name	Sources textuelles	string
9	en_US	name	Multimedia	string
9	fr_CA	name	Multimedia	string
10	en_US	name	Image	string
10	fr_CA	name	Image	string
11	en_US	name	HTML Stylesheet	string
11	fr_CA	name	HTML Stylesheet	string
12	en_US	name	Other	string
12	fr_CA	name	Autre	string
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY genres (genre_id, context_id, seq, sortable, enabled, category, dependent, supplementary, entry_key) FROM stdin;
1	1	0	0	1	1	0	0	SUBMISSION
2	1	1	0	1	3	0	1	RESEARCHINSTRUMENT
3	1	2	0	1	3	0	1	RESEARCHMATERIALS
4	1	3	0	1	3	0	1	RESEARCHRESULTS
5	1	4	0	1	3	0	1	TRANSCRIPTS
6	1	5	0	1	3	0	1	DATAANALYSIS
7	1	6	0	1	3	0	1	DATASET
8	1	7	0	1	3	0	1	SOURCETEXTS
9	1	8	0	1	1	1	1	MULTIMEDIA
10	1	9	0	1	2	1	0	IMAGE
11	1	10	0	1	1	1	0	STYLE
12	1	11	1	1	3	0	1	OTHER
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('genres_genre_id_seq', 12, true);


--
-- Data for Name: institutional_subscription_ip; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY institutional_subscription_ip (institutional_subscription_ip_id, subscription_id, ip_string, ip_start, ip_end) FROM stdin;
\.


--
-- Name: institutional_subscription_ip_institutional_subscription_ip_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('institutional_subscription_ip_institutional_subscription_ip_seq', 1, false);


--
-- Data for Name: institutional_subscriptions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY institutional_subscriptions (institutional_subscription_id, subscription_id, institution_name, mailing_address, domain) FROM stdin;
\.


--
-- Name: institutional_subscriptions_institutional_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('institutional_subscriptions_institutional_subscription_id_seq', 1, false);


--
-- Data for Name: issue_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY issue_files (file_id, issue_id, file_name, file_type, file_size, content_type, original_file_name, date_uploaded, date_modified) FROM stdin;
\.


--
-- Name: issue_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('issue_files_file_id_seq', 1, false);


--
-- Data for Name: issue_galley_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY issue_galley_settings (galley_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: issue_galleys; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY issue_galleys (galley_id, locale, issue_id, file_id, label, seq) FROM stdin;
\.


--
-- Name: issue_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('issue_galleys_galley_id_seq', 1, false);


--
-- Data for Name: issue_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY issue_settings (issue_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title		string
1	en_US	description		string
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY issues (issue_id, journal_id, volume, number, year, published, current, date_published, date_notified, last_modified, access_status, open_access_date, show_volume, show_number, show_year, show_title, style_file_name, original_style_file_name) FROM stdin;
1	1	1	2	2014	1	1	2017-10-24 17:42:38	\N	2017-10-24 17:42:38	1	\N	1	1	1	0	\N	\N
2	1	1	1	2014	1	1	2016-02-11 00:00:00	\N	2017-10-24 17:54:03	1	\N	1	1	1	0	\N	\N
\.


--
-- Name: issues_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('issues_issue_id_seq', 2, true);


--
-- Data for Name: item_views; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY item_views (assoc_type, assoc_id, user_id, date_last_viewed) FROM stdin;
\.


--
-- Data for Name: journal_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY journal_settings (journal_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		numPageLinks	10	int
1		itemsPerPage	25	int
1		numWeeksPerReview	4	int
1		defaultReviewMode	2	int
1	en_US	privacyStatement	The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.	string
1	en_US	openAccessPolicy	This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.	string
1	en_US	authorSelfArchivePolicy	This journal permits and encourages authors to post items submitted to the journal on personal websites or institutional repositories both prior to and after publication, while providing bibliographic details that credit, if applicable, its publication in this journal.	string
1	en_US	copyeditInstructions	The copyediting stage is intended to improve the flow, clarity, grammar, wording, and formatting of the article. It represents the last chance for the author to make any substantial changes to the text because the next stage is restricted to typos and formatting corrections.\n\nThe file to be copyedited is in Word or .rtf format and therefore can easily be edited as a word processing document. The set of instructions displayed here proposes two approaches to copyediting. One is based on Microsoft Word's Track Changes feature and requires that the copy editor, editor, and author have access to this program. A second system, which is software independent, has been borrowed, with permission, from the Harvard Educational Review. The journal editor is in a position to modify these instructions, so suggestions can be made to improve the process for this journal.\n\n\n<h4>Copyediting Systems</h4>\n\n<strong>1. Microsoft Word's Track Changes</strong>\n\nUnder Tools in the menu bar, the feature Track Changes enables the copy editor to make insertions (text appears in color) and deletions (text appears crossed out in color or in the margins as deleted). The copy editor can posit queries to both the author (Author Queries) and to the editor (Editor Queries) by inserting these queries in square brackets. The copyedited version is then uploaded, and the editor is notified. The editor then reviews the text and notifies the author.\n\nThe editor and author should leave those changes with which they are satisfied. If further changes are necessary, the editor and author can make changes to the initial insertions or deletions, as well as make new insertions or deletions elsewhere in the text. Authors and editors should respond to each of the queries addressed to them, with responses placed inside the square brackets.\n\nAfter the text has been reviewed by editor and author, the copy editor will make a final pass over the text accepting the changes in preparation for the layout and galley stage.\n\n\n<strong>2. Harvard Educational Review</strong>\n\n<strong>Instructions for Making Electronic Revisions to the Manuscript</strong>\n\nPlease follow the following protocol for making electronic revisions to your manuscript:\n\n<strong>Responding to suggested changes.</strong>\n&nbsp; For each of the suggested changes that you accept, unbold the text.\n&nbsp; For each of the suggested changes that you do not accept, re-enter the original text and <strong>bold</strong> it.\n\n<strong>Making additions and deletions.</strong>\n&nbsp; Indicate additions by <strong>bolding</strong> the new text.\n&nbsp; Replace deleted sections with: <strong>[deleted text]</strong>.\n&nbsp; If you delete one or more sentence, please indicate with a note, e.g., <strong>[deleted 2 sentences]</strong>.\n\n<strong>Responding to Queries to the Author (QAs).</strong>\n&nbsp; Keep all QAs intact and bolded within the text. Do not delete them.\n&nbsp; To reply to a QA, add a comment after it. Comments should be delimited using:\n<strong>[Comment:]</strong>\n&nbsp; e.g., <strong>[Comment: Expanded discussion of methodology as you suggested]</strong>.\n\n<strong>Making comments.</strong>\n&nbsp; Use comments to explain organizational changes or major revisions\n&nbsp; e.g., <strong>[Comment: Moved the above paragraph from p. 5 to p. 7].</strong>\n&nbsp; Note: When referring to page numbers, please use the page numbers from the printed copy of the manuscript that was sent to you. This is important since page numbers may change as a document is revised electronically.\n\n<h4>An Illustration of an Electronic Revision</h4>\n\n<ol>\n<li><strong>Initial copyedit.</strong> The journal copy editor will edit the text to improve flow, clarity, grammar, wording, and formatting, as well as including author queries as necessary. Once the initial edit is complete, the copy editor will upload the revised document through the journal Web site and notify the author that the edited manuscript is available for review.</li>\n<li><strong>Author copyedit.</strong> Before making dramatic departures from the structure and organization of the edited manuscript, authors must check in with the editors who are co-chairing the piece. Authors should accept/reject any changes made during the initial copyediting, as appropriate, and respond to all author queries. When finished with the revisions, authors should rename the file from AuthorNameQA.doc to AuthorNameQAR.doc (e.g., from LeeQA.doc to LeeQAR.doc) and upload the revised document through the journal Web site as directed.</li>\n<li><strong>Final copyedit.</strong> The journal copy editor will verify changes made by the author and incorporate the responses to the author queries to create a final manuscript. When finished, the copy editor will upload the final document through the journal Web site and alert the layout editor to complete formatting.</li>\n</ol>	string
1		emailSignature	<br/>\n________________________________________________________________________<br/>\n<a href="{$contextUrl}">{$contextName}</a>	string
1	en_US	proofInstructions	<p>The proofreading stage is intended to catch any errors in the galley's spelling, grammar, and formatting. More substantial changes cannot be made at this stage, unless discussed with the Section Editor. In Layout, click on VIEW PROOF to see the HTML, PDF, and other available file formats used in publishing this item.</p>\n\t<h4>For Spelling and Grammar Errors</h4>\n\n\t<p>Copy the problem word or groups of words and paste them into the Proofreading Corrections box with "CHANGE-TO" instructions to the editor as follows:</p>\n\n\t<pre>1. CHANGE...\n\tthen the others\n\tTO...\n\tthan the others</pre>\n\t<br />\n\t<pre>2. CHANGE...\n\tMalinowsky\n\tTO...\n\tMalinowski</pre>\n\t<br />\n\n\t<h4>For Formatting Errors</h4>\n\n\t<p>Describe the location and nature of the problem in the Proofreading Corrections box after typing in the title "FORMATTING" as follows:</p>\n\t<br />\n\t<pre>3. FORMATTING\n\tThe numbers in Table 3 are not aligned in the third column.</pre>\n\t<br />\n\t<pre>4. FORMATTING\n\tThe paragraph that begins "This last topic..." is not indented.</pre>	string
1	en_US	refLinkInstructions	<h4>To Add Reference Linking to the Layout Process</h4>\n\t<p>When turning a submission into HTML or PDF, make sure that all hyperlinks in the submission are active.</p>\n\t<h4>A. When the Author Provides a Link with the Reference</h4>\n\t<ol>\n\t<li>While the submission is still in its word processing format (e.g., Word), add the phrase VIEW ITEM to the end of the reference that has a URL.</li>\n\t<li>Turn that phrase into a hyperlink by highlighting it and using Word's Insert Hyperlink tool and the URL prepared in #2.</li>\n\t</ol>\n\t<h4>B. Enabling Readers to Search Google Scholar For References</h4>\n\t<ol>\n\t\t<li>While the submission is still in its word processing format (e.g., Word), copy the title of the work referenced in the References list (if it appears to be too common a title—e.g., "Peace"—then copy author and title).</li>\n\t\t<li>Paste the reference's title between the %22's, placing a + between each word: http://scholar.google.com/scholar?q=%22PASTE+TITLE+HERE%22&hl=en&lr=&btnG=Search.</li>\n\n\t<li>Add the phrase GS SEARCH to the end of each citation in the submission's References list.</li>\n\t<li>Turn that phrase into a hyperlink by highlighting it and using Word's Insert Hyperlink tool and the URL prepared in #2.</li>\n\t</ol>\n\t<h4>C. Enabling Readers to Search for References with a DOI</h4>\n\t<ol>\n\t<li>While the submission is still in Word, copy a batch of references into CrossRef Text Query http://www.crossref.org/freeTextQuery/.</li>\n\t<li>Paste each DOI that the Query provides in the following URL (between = and &): http://www.cmaj.ca/cgi/external_ref?access_num=PASTE DOI#HERE&link_type=DOI.</li>\n\t<li>Add the phrase CrossRef to the end of each citation in the submission's References list.</li>\n\t<li>Turn that phrase into a hyperlink by highlighting the phrase and using Word's Insert Hyperlink tool and the appropriate URL prepared in #2.</li>\n\t</ol>	string
1	en_US	readerInformation	We encourage readers to sign up for the publishing notification service for this journal. Use the <a href="http://localhost/git/ojs/index.php/publicknowledge/user/register">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal's <a href="http://localhost/git/ojs/index.php/publicknowledge/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.	string
1	en_US	authorInformation	Interested in submitting to this journal? We recommend that you review the <a href="http://localhost/git/ojs/index.php/publicknowledge/about">About the Journal</a> page for the journal's section policies, as well as the <a href="http://localhost/git/ojs/index.php/publicknowledge/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://localhost/git/ojs/index.php/publicknowledge/user/register">register</a> with the journal prior to submitting or, if already registered, can simply <a href="http://localhost/git/ojs/index.php/index/login">log in</a> and begin the five-step process.	string
1	en_US	librarianInformation	We encourage research librarians to list this journal among their library's electronic journal holdings. As well, it may be worth noting that this journal's open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href="http://pkp.sfu.ca/ojs">Open Journal Systems</a>).	string
1	en_US	lockssLicense	This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://www.lockss.org/">More...</a>	string
1	en_US	clockssLicense	This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://clockss.org/">More...</a>	string
1		supportedFormLocales	a:1:{i:0;s:5:"en_US";}	object
1		supportedSubmissionLocales	a:1:{i:0;s:5:"en_US";}	object
1	en_US	submissionChecklist	a:5:{i:0;a:2:{s:7:"content";s:165:"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).";s:5:"order";s:1:"1";}i:1;a:2:{s:7:"content";s:82:"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.";s:5:"order";s:1:"2";}i:2;a:2:{s:7:"content";s:60:"Where available, URLs for the references have been provided.";s:5:"order";s:1:"3";}i:3;a:2:{s:7:"content";s:239:"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.";s:5:"order";s:1:"4";}i:4;a:2:{s:7:"content";s:99:"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.";s:5:"order";s:1:"5";}}	object
1		rtAbstract	1	bool
1		rtCaptureCite	1	bool
1		rtViewMetadata	1	bool
1		rtSupplementaryFiles	1	bool
1		rtPrinterFriendly	1	bool
1		rtDefineTerms	1	bool
1		rtAddComment	1	bool
1		rtEmailAuthor	1	bool
1		rtEmailOthers	1	bool
1		publicationFee	0	int
1		purchaseArticleFee	0	int
1		membershipFee	0	int
1	en_US	metaCitations	1	string
1		themePluginPath	default	string
1		keywordsEnabledSubmission	1	bool
1		keywordsEnabledWorkflow	1	bool
1		supportedLocales	a:2:{i:0;s:5:"en_US";i:1;s:5:"fr_CA";}	object
1	fr_CA	name	Journal de la connaissance du public	string
1	fr_CA	description	<p>Le Journal de Public Knowledge est une publication trimestrielle évaluée par les pairs sur le thème de l'accès du public à la science.</p>	string
1	en_US	name	Journal of Public Knowledge	string
1	en_US	acronym	publicknowledge	string
1	en_US	abbreviation	PK	string
1		publisherInstitution		string
1		printIssn		string
1		onlineIssn		string
1	en_US	description	<p>The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.</p>	string
1		mailingAddress	123 456th Street\r\nBurnaby, British Columbia\r\nCanada	string
1		contactName	Ramiro Vaca	string
1		contactEmail	rvaca@mailinator.com	string
1		contactPhone		string
1		supportName	Ramiro Vaca	string
1		supportEmail	rvaca@mailinator.com	string
1		supportPhone		string
\.


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY journals (journal_id, path, seq, primary_locale, enabled) FROM stdin;
1	publicknowledge	1	en_US	1
\.


--
-- Name: journals_journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('journals_journal_id_seq', 1, true);


--
-- Data for Name: library_file_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY library_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: library_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY library_files (file_id, context_id, file_name, original_file_name, file_type, file_size, type, date_uploaded, date_modified, submission_id) FROM stdin;
\.


--
-- Name: library_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('library_files_file_id_seq', 1, false);


--
-- Data for Name: markup_jobinfos; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY markup_jobinfos (id, journal_id, user_id, file_id, xml_job_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metadata_description_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY metadata_description_settings (metadata_description_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: metadata_descriptions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY metadata_descriptions (metadata_description_id, assoc_type, assoc_id, schema_namespace, schema_name, display_name, seq) FROM stdin;
\.


--
-- Name: metadata_descriptions_metadata_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('metadata_descriptions_metadata_description_id_seq', 1, false);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY metrics (load_id, context_id, pkp_section_id, assoc_object_type, assoc_object_id, submission_id, representation_id, assoc_type, assoc_id, day, month, file_type, country_id, region, city, metric_type, metric) FROM stdin;
\.


--
-- Name: navigation_menu_item_assignme_navigation_menu_item_assignme_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('navigation_menu_item_assignme_navigation_menu_item_assignme_seq', 22, true);


--
-- Data for Name: navigation_menu_item_assignment_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY navigation_menu_item_assignment_settings (navigation_menu_item_assignment_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Register	string
1	fr_CA	title	navigation.register	string
2	en_US	title	Login	string
2	fr_CA	title	navigation.login	string
3	en_US	title	{$loggedInUsername}	string
3	fr_CA	title	{$loggedInUsername}	string
4	en_US	title	Dashboard	string
4	fr_CA	title	navigation.dashboard	string
5	en_US	title	View Profile	string
5	fr_CA	title	common.viewProfile	string
6	en_US	title	Administration	string
6	fr_CA	title	navigation.admin	string
7	en_US	title	Logout	string
7	fr_CA	title	Se déconnecter	string
8	en_US	title	Register	string
9	en_US	title	Login	string
10	en_US	title	{$loggedInUsername}	string
11	en_US	title	Dashboard	string
12	en_US	title	View Profile	string
13	en_US	title	Administration	string
14	en_US	title	Logout	string
15	en_US	title	Current	string
16	en_US	title	Archives	string
17	en_US	title	Announcements	string
18	en_US	title	About	string
19	en_US	title	About the Journal	string
20	en_US	title	Submissions	string
21	en_US	title	Editorial Team	string
22	en_US	title	Contact	string
\.


--
-- Data for Name: navigation_menu_item_assignments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY navigation_menu_item_assignments (navigation_menu_item_assignment_id, navigation_menu_id, navigation_menu_item_id, parent_id, seq) FROM stdin;
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
\.


--
-- Data for Name: navigation_menu_item_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY navigation_menu_item_settings (navigation_menu_item_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1		titleLocaleKey	navigation.register	string
2		titleLocaleKey	navigation.login	string
3		titleLocaleKey	{$loggedInUsername}	string
4		titleLocaleKey	navigation.dashboard	string
5		titleLocaleKey	common.viewProfile	string
6		titleLocaleKey	navigation.admin	string
7		titleLocaleKey	user.logOut	string
1	en_US	title	Register	string
2	en_US	title	Login	string
3	en_US	title	{$loggedInUsername}	string
4	en_US	title	Dashboard	string
5	en_US	title	View Profile	string
6	en_US	title	Administration	string
7	en_US	title	Logout	string
1	fr_CA	title	navigation.register	string
2	fr_CA	title	navigation.login	string
3	fr_CA	title	{$loggedInUsername}	string
4	fr_CA	title	navigation.dashboard	string
5	fr_CA	title	common.viewProfile	string
6	fr_CA	title	navigation.admin	string
7	fr_CA	title	Se déconnecter	string
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
20		titleLocaleKey	navigation.submissions	string
21		titleLocaleKey	about.editorialTeam	string
22		titleLocaleKey	about.contact	string
8	en_US	title	Register	string
9	en_US	title	Login	string
10	en_US	title	{$loggedInUsername}	string
11	en_US	title	Dashboard	string
12	en_US	title	View Profile	string
13	en_US	title	Administration	string
14	en_US	title	Logout	string
15	en_US	title	Current	string
16	en_US	title	Archives	string
17	en_US	title	Announcements	string
18	en_US	title	About	string
19	en_US	title	About the Journal	string
20	en_US	title	Submissions	string
21	en_US	title	Editorial Team	string
22	en_US	title	Contact	string
\.


--
-- Data for Name: navigation_menu_items; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY navigation_menu_items (navigation_menu_item_id, context_id, url, path, type) FROM stdin;
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
15	1	\N	\N	NMI_TYPE_CURRENT
16	1	\N	\N	NMI_TYPE_ARCHIVES
17	1	\N	\N	NMI_TYPE_ANNOUNCEMENTS
18	1	\N	\N	NMI_TYPE_ABOUT
19	1	\N	\N	NMI_TYPE_ABOUT
20	1	\N	\N	NMI_TYPE_SUBMISSIONS
21	1	\N	\N	NMI_TYPE_EDITORIAL_TEAM
22	1	\N	\N	NMI_TYPE_CONTACT
\.


--
-- Name: navigation_menu_items_navigation_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('navigation_menu_items_navigation_menu_item_id_seq', 22, true);


--
-- Data for Name: navigation_menus; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY navigation_menus (navigation_menu_id, context_id, area_name, title) FROM stdin;
1	0	user	User
2	1	user	User
3	1	primary	Primary
\.


--
-- Name: navigation_menus_navigation_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('navigation_menus_navigation_menu_id_seq', 3, true);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY notes (note_id, assoc_type, assoc_id, user_id, date_created, date_modified, title, contents) FROM stdin;
1	1048586	1	6	2017-10-24 17:44:29	2017-10-24 17:44:29	Recommendation	<p>Daniel Barnes, David Buskins, Stephanie Berardo:<br> <br> The recommendation regarding the submission to Journal of Public Knowledge, "The influence of lactation on the quantity and quality of cashmere production" is: Accept Submission<br> <br> Minoti Inoue<br>Kyoto University<br>minoue@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href="http://localhost/git/ojs/index.php/publicknowledge">Journal of Public Knowledge</a>
\.


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('notes_note_id_seq', 1, true);


--
-- Data for Name: notification_mail_list; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY notification_mail_list (notification_mail_list_id, email, confirmed, token, context) FROM stdin;
\.


--
-- Name: notification_mail_list_notification_mail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('notification_mail_list_notification_mail_list_id_seq', 1, false);


--
-- Data for Name: notification_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY notification_settings (notification_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: notification_subscription_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY notification_subscription_settings (setting_id, setting_name, setting_value, user_id, context, setting_type) FROM stdin;
\.


--
-- Name: notification_subscription_settings_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('notification_subscription_settings_setting_id_seq', 1, false);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY notifications (notification_id, context_id, user_id, level, type, date_created, date_read, assoc_type, assoc_id) FROM stdin;
163	1	0	2	16777243	2017-10-24 18:00:34	\N	1048585	19
2	1	0	2	16777244	2017-10-24 17:39:40	\N	256	1
61	1	3	2	16777254	2017-10-24 17:48:17	2017-10-24 17:48:21	1048585	4
86	1	0	2	16777236	2017-10-24 17:50:39	2017-10-24 17:50:44	523	5
6	1	1	2	268435477	2017-10-24 17:42:38	\N	0	0
7	1	3	2	268435477	2017-10-24 17:42:38	\N	0	0
8	1	5	2	268435477	2017-10-24 17:42:38	\N	0	0
9	1	4	2	268435477	2017-10-24 17:42:38	\N	0	0
10	1	13	2	268435477	2017-10-24 17:42:38	\N	0	0
11	1	11	2	268435477	2017-10-24 17:42:38	\N	0	0
12	1	10	2	268435477	2017-10-24 17:42:38	\N	0	0
13	1	14	2	268435477	2017-10-24 17:42:38	\N	0	0
14	1	8	2	268435477	2017-10-24 17:42:38	\N	0	0
15	1	6	2	268435477	2017-10-24 17:42:38	\N	0	0
16	1	7	2	268435477	2017-10-24 17:42:38	\N	0	0
17	1	16	2	268435477	2017-10-24 17:42:38	\N	0	0
18	1	9	2	268435477	2017-10-24 17:42:38	\N	0	0
19	1	15	2	268435477	2017-10-24 17:42:38	\N	0	0
20	1	2	2	268435477	2017-10-24 17:42:38	\N	0	0
21	1	12	2	268435477	2017-10-24 17:42:38	\N	0	0
22	1	0	2	268435477	2017-10-24 17:42:38	\N	0	0
23	1	0	2	16777243	2017-10-24 17:43:40	\N	1048585	1
24	1	0	2	16777245	2017-10-24 17:43:40	\N	1048585	1
26	1	17	2	16777231	2017-10-24 17:44:00	\N	1048585	1
25	1	0	2	16777236	2017-10-24 17:44:00	2017-10-24 17:44:07	523	1
28	1	3	3	16777249	2017-10-24 17:44:29	\N	1048586	1
29	1	4	3	16777249	2017-10-24 17:44:29	\N	1048586	1
30	1	5	3	16777249	2017-10-24 17:44:29	\N	1048586	1
31	1	0	2	16777243	2017-10-24 17:45:15	\N	1048585	2
32	1	0	2	16777245	2017-10-24 17:45:15	\N	1048585	2
33	1	0	2	16777236	2017-10-24 17:45:31	2017-10-24 17:45:37	523	2
35	1	9	3	16777227	2017-10-24 17:45:43	\N	517	1
66	1	0	2	16777243	2017-10-24 17:48:57	\N	1048585	5
37	1	10	3	16777227	2017-10-24 17:45:51	\N	517	2
67	1	0	2	16777245	2017-10-24 17:48:57	\N	1048585	5
39	1	18	2	16777230	2017-10-24 17:45:56	\N	1048585	2
41	1	4	2	16777251	2017-10-24 17:45:56	\N	1048585	2
42	1	5	2	16777251	2017-10-24 17:45:56	\N	1048585	2
40	1	3	2	16777251	2017-10-24 17:45:56	2017-10-24 17:46:03	1048585	2
45	1	0	2	16777243	2017-10-24 17:46:48	\N	1048585	3
46	1	0	2	16777245	2017-10-24 17:46:48	\N	1048585	3
47	1	0	2	16777243	2017-10-24 17:47:16	\N	1048585	4
48	1	0	2	16777245	2017-10-24 17:47:16	\N	1048585	4
49	1	0	2	16777236	2017-10-24 17:47:32	2017-10-24 17:47:41	523	3
51	1	8	3	16777227	2017-10-24 17:47:50	\N	517	3
68	1	0	2	16777236	2017-10-24 17:49:13	2017-10-24 17:49:18	523	4
53	1	10	3	16777227	2017-10-24 17:47:57	\N	517	4
70	1	7	3	16777227	2017-10-24 17:49:24	\N	517	5
60	1	20	2	16777235	2017-10-24 17:48:17	\N	1048585	4
62	1	4	2	16777254	2017-10-24 17:48:17	\N	1048585	4
63	1	5	2	16777254	2017-10-24 17:48:17	\N	1048585	4
72	1	10	3	16777227	2017-10-24 17:49:30	\N	517	6
90	1	9	3	16777227	2017-10-24 17:50:56	\N	517	8
79	1	21	2	16777235	2017-10-24 17:49:48	\N	1048585	5
81	1	4	2	16777254	2017-10-24 17:49:48	\N	1048585	5
82	1	5	2	16777254	2017-10-24 17:49:48	\N	1048585	5
80	1	3	2	16777254	2017-10-24 17:49:48	2017-10-24 17:49:53	1048585	5
102	1	0	2	16777236	2017-10-24 17:52:48	2017-10-24 17:52:53	523	6
84	1	0	2	16777243	2017-10-24 17:50:25	\N	1048585	6
85	1	0	2	16777245	2017-10-24 17:50:25	\N	1048585	6
87	1	22	2	16777231	2017-10-24 17:50:39	\N	1048585	6
92	1	10	3	16777227	2017-10-24 17:51:02	\N	517	9
104	1	7	3	16777227	2017-10-24 17:52:59	\N	517	10
94	1	3	2	16777219	2017-10-24 17:51:23	\N	517	7
95	1	4	2	16777219	2017-10-24 17:51:23	\N	517	7
96	1	5	2	16777219	2017-10-24 17:51:24	\N	517	7
98	1	0	2	16777243	2017-10-24 17:51:55	\N	1048585	7
99	1	0	2	16777245	2017-10-24 17:51:55	\N	1048585	7
100	1	0	2	16777243	2017-10-24 17:52:31	\N	1048585	8
101	1	0	2	16777245	2017-10-24 17:52:31	\N	1048585	8
106	1	10	3	16777227	2017-10-24 17:53:06	\N	517	11
114	1	6	2	16777254	2017-10-24 17:53:27	\N	1048585	8
113	1	3	2	16777254	2017-10-24 17:53:27	2017-10-24 17:53:33	1048585	8
112	1	24	2	16777235	2017-10-24 17:53:27	\N	1048585	8
117	1	0	2	16777243	2017-10-24 17:54:29	\N	1048585	15
119	1	0	2	16777236	2017-10-24 17:54:45	2017-10-24 17:54:50	523	7
118	1	0	2	16777245	2017-10-24 17:54:29	\N	1048585	15
121	1	7	3	16777227	2017-10-24 17:54:56	\N	517	12
123	1	9	3	16777227	2017-10-24 17:55:02	\N	517	13
125	1	10	3	16777227	2017-10-24 17:55:07	\N	517	14
132	1	25	2	16777235	2017-10-24 17:55:26	\N	1048585	15
138	1	0	2	16777243	2017-10-24 17:56:28	\N	1048585	16
139	1	0	2	16777245	2017-10-24 17:56:28	\N	1048585	16
141	1	26	2	16777231	2017-10-24 17:56:47	\N	1048585	16
140	1	0	2	16777236	2017-10-24 17:56:47	2017-10-24 17:56:53	523	8
164	1	0	2	16777245	2017-10-24 18:00:34	\N	1048585	19
165	1	0	2	16777236	2017-10-24 18:01:03	2017-10-24 18:01:11	523	10
146	1	3	2	16777219	2017-10-24 17:57:32	\N	517	15
147	1	4	2	16777219	2017-10-24 17:57:32	\N	517	15
148	1	5	2	16777219	2017-10-24 17:57:33	\N	517	15
149	1	3	2	16777219	2017-10-24 17:57:53	\N	517	16
150	1	4	2	16777219	2017-10-24 17:57:53	\N	517	16
151	1	5	2	16777219	2017-10-24 17:57:53	\N	517	16
153	1	0	2	16777243	2017-10-24 17:58:33	\N	1048585	17
154	1	0	2	16777245	2017-10-24 17:58:33	\N	1048585	17
155	1	0	2	16777243	2017-10-24 17:59:05	\N	1048585	18
156	1	0	2	16777245	2017-10-24 17:59:05	\N	1048585	18
158	1	28	2	16777231	2017-10-24 17:59:25	\N	1048585	18
157	1	0	2	16777236	2017-10-24 17:59:25	2017-10-24 17:59:32	523	9
159	1	7	3	16777227	2017-10-24 17:59:43	\N	517	17
161	1	8	3	16777227	2017-10-24 17:59:54	\N	517	18
173	1	3	2	16777219	2017-10-24 18:02:10	\N	517	19
174	1	5	2	16777219	2017-10-24 18:02:10	\N	517	19
175	1	4	2	16777219	2017-10-24 18:02:10	\N	517	19
176	1	3	2	16777219	2017-10-24 18:02:41	\N	517	20
177	1	5	2	16777219	2017-10-24 18:02:41	\N	517	20
178	1	4	2	16777219	2017-10-24 18:02:41	\N	517	20
179	1	3	2	16777219	2017-10-24 18:03:15	\N	517	21
180	1	5	2	16777219	2017-10-24 18:03:15	\N	517	21
181	1	4	2	16777219	2017-10-24 18:03:15	\N	517	21
182	1	29	3	16777232	2017-10-24 18:03:50	\N	1048585	19
183	1	0	2	16777243	2017-10-24 18:04:30	\N	1048585	20
184	1	0	2	16777245	2017-10-24 18:04:30	\N	1048585	20
185	1	0	2	16777243	2017-10-24 18:04:58	\N	1048585	21
186	1	0	2	16777245	2017-10-24 18:04:58	\N	1048585	21
187	1	0	2	16777236	2017-10-24 18:05:19	2017-10-24 18:05:25	523	11
189	1	8	3	16777227	2017-10-24 18:05:31	\N	517	22
191	1	9	3	16777227	2017-10-24 18:05:37	\N	517	23
218	1	33	2	16777235	2017-10-24 18:08:17	\N	1048585	23
198	1	31	2	16777235	2017-10-24 18:05:58	\N	1048585	21
200	1	5	2	16777254	2017-10-24 18:05:59	\N	1048585	21
201	1	4	2	16777254	2017-10-24 18:05:59	\N	1048585	21
199	1	3	2	16777254	2017-10-24 18:05:59	2017-10-24 18:06:05	1048585	21
203	1	0	2	16777243	2017-10-24 18:06:39	\N	1048585	22
204	1	0	2	16777245	2017-10-24 18:06:39	\N	1048585	22
205	1	0	2	16777243	2017-10-24 18:07:18	\N	1048585	23
206	1	0	2	16777245	2017-10-24 18:07:18	\N	1048585	23
207	1	0	2	16777236	2017-10-24 18:07:37	2017-10-24 18:07:42	523	12
209	1	7	3	16777227	2017-10-24 18:07:47	\N	517	24
211	1	8	3	16777227	2017-10-24 18:07:54	\N	517	25
224	1	0	2	16777243	2017-10-24 18:09:33	\N	1048585	24
225	1	0	2	16777245	2017-10-24 18:09:33	\N	1048585	24
226	1	34	2	16777234	2017-10-24 18:09:55	\N	1048585	24
227	1	0	2	16777243	2017-10-24 18:10:29	\N	1048585	25
228	1	0	2	16777245	2017-10-24 18:10:29	\N	1048585	25
229	1	0	2	16777236	2017-10-24 18:10:48	2017-10-24 18:10:55	523	13
231	1	8	3	16777227	2017-10-24 18:11:04	\N	517	26
233	1	9	3	16777227	2017-10-24 18:11:12	\N	517	27
235	1	35	2	16777230	2017-10-24 18:11:17	\N	1048585	25
237	1	6	2	16777251	2017-10-24 18:11:18	\N	1048585	25
236	1	3	2	16777251	2017-10-24 18:11:18	2017-10-24 18:11:23	1048585	25
\.


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('notifications_notification_id_seq', 238, true);


--
-- Data for Name: oai_resumption_tokens; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY oai_resumption_tokens (token, expire, record_offset, params) FROM stdin;
\.


--
-- Data for Name: plugin_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY plugin_settings (plugin_name, context_id, setting_name, setting_value, setting_type) FROM stdin;
usagestatsplugin	0	enabled	1	bool
usagestatsplugin	0	createLogFiles	1	bool
usagestatsplugin	0	accessLogFileParseRegex	/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/	string
usagestatsplugin	0	optionalColumns	a:2:{i:0;s:4:"city";i:1;s:6:"region";}	object
usagestatsplugin	0	chartType	bar	string
usagestatsplugin	0	datasetMaxCount	4	string
tinymceplugin	0	enabled	1	bool
usageeventplugin	0	enabled	1	bool
coinsplugin	0	enabled	1	bool
acronplugin	0	enabled	1	bool
acronplugin	0	crontab	a:6:{i:0;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:1;a:3:{s:9:"className";s:40:"plugins.importexport.doaj.DOAJInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:2;a:3:{s:9:"className";s:48:"plugins.importexport.crossref.CrossrefInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:3;a:3:{s:9:"className";s:48:"plugins.importexport.datacite.DataciteInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:4;a:3:{s:9:"className";s:42:"plugins.importexport.medra.MedraInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:5;a:3:{s:9:"className";s:35:"lib.pkp.classes.task.ReviewReminder";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}}	object
defaultthemeplugin	0	enabled	1	bool
developedbyblockplugin	0	enabled	0	bool
developedbyblockplugin	0	seq	0	int
developedbyblockplugin	0	context	1	int
languagetoggleblockplugin	0	enabled	1	bool
languagetoggleblockplugin	0	seq	4	int
languagetoggleblockplugin	0	context	1	int
tinymceplugin	1	enabled	1	bool
subscriptionblockplugin	1	enabled	1	bool
subscriptionblockplugin	1	seq	2	int
subscriptionblockplugin	1	context	1	int
informationblockplugin	1	enabled	1	bool
informationblockplugin	1	seq	7	int
informationblockplugin	1	context	1	int
developedbyblockplugin	1	enabled	0	bool
developedbyblockplugin	1	seq	0	int
developedbyblockplugin	1	context	1	int
languagetoggleblockplugin	1	enabled	1	bool
languagetoggleblockplugin	1	seq	4	int
languagetoggleblockplugin	1	context	1	int
resolverplugin	1	enabled	1	bool
addthisplugin	1	enabled	1	bool
markupplugin	1	wantedFormats	a:3:{i:0;s:3:"xml";i:1;s:3:"pdf";i:2;s:4:"epub";}	object
lensgalleyplugin	1	enabled	1	bool
pdfjsviewerplugin	1	enabled	1	bool
dublincoremetaplugin	1	enabled	1	bool
webfeedplugin	1	enabled	1	bool
webfeedplugin	1	displayPage	homepage	string
webfeedplugin	1	displayItems	1	bool
htmlarticlegalleyplugin	1	enabled	1	bool
googlescholarplugin	1	enabled	1	bool
defaultthemeplugin	1	enabled	1	bool
usageeventplugin	0	uniqueSiteId	59ef7ae4b3692	string
\.


--
-- Data for Name: published_submissions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY published_submissions (published_submission_id, submission_id, issue_id, date_published, seq, access_status) FROM stdin;
1	9	2	2016-02-11 00:00:00	1	0
2	10	2	2016-02-11 00:00:00	1	0
3	11	2	2016-02-11 00:00:00	2	0
4	12	2	2016-02-11 00:00:00	2	0
5	13	2	2016-02-11 00:00:00	3	0
6	14	2	2016-02-11 00:00:00	4	0
\.


--
-- Name: published_submissions_published_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('published_submissions_published_submission_id_seq', 6, true);


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY queries (query_id, assoc_type, assoc_id, stage_id, seq, date_posted, date_modified, closed) FROM stdin;
1	1048585	1	3	1	\N	\N	0
\.


--
-- Name: queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('queries_query_id_seq', 1, true);


--
-- Data for Name: query_participants; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY query_participants (query_id, user_id) FROM stdin;
1	3
1	4
1	5
\.


--
-- Data for Name: queued_payments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY queued_payments (queued_payment_id, date_created, date_modified, expiry_date, payment_data) FROM stdin;
\.


--
-- Name: queued_payments_queued_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('queued_payments_queued_payment_id_seq', 1, false);


--
-- Data for Name: review_assignments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_assignments (review_id, submission_id, reviewer_id, competing_interests, recommendation, date_assigned, date_notified, date_confirmed, date_completed, date_acknowledged, date_due, date_response_due, last_modified, reminder_was_automatic, declined, replaced, reviewer_file_id, date_rated, date_reminded, quality, review_round_id, stage_id, review_method, round, step, review_form_id, unconsidered) FROM stdin;
1	2	9	\N	\N	2017-10-24 17:45:43	2017-10-24 17:45:43	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:45:43	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
2	2	10	\N	\N	2017-10-24 17:45:51	2017-10-24 17:45:51	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:45:51	0	0	0	\N	\N	\N	\N	2	3	2	1	1	\N	0
18	18	8	\N	\N	2017-10-24 17:59:54	2017-10-24 17:59:54	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:59:54	0	0	0	\N	\N	\N	\N	9	3	2	1	1	\N	0
3	4	8	\N	\N	2017-10-24 17:47:50	2017-10-24 17:47:50	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:47:50	0	0	0	\N	\N	\N	\N	3	3	2	1	1	\N	0
4	4	10	\N	\N	2017-10-24 17:47:57	2017-10-24 17:47:57	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:47:57	0	0	0	\N	\N	\N	\N	3	3	2	1	1	\N	0
5	5	7	\N	\N	2017-10-24 17:49:24	2017-10-24 17:49:24	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:49:24	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
6	5	10	\N	\N	2017-10-24 17:49:30	2017-10-24 17:49:30	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:49:30	0	0	0	\N	\N	\N	\N	4	3	2	1	1	\N	0
8	6	9	\N	\N	2017-10-24 17:50:56	2017-10-24 17:50:56	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:50:56	0	0	0	\N	\N	\N	\N	5	3	2	1	1	\N	0
9	6	10	\N	\N	2017-10-24 17:51:02	2017-10-24 17:51:02	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:51:02	0	0	0	\N	\N	\N	\N	5	3	2	1	1	\N	0
7	6	8	\N	5	2017-10-24 17:50:50	2017-10-24 17:50:50	2017-10-24 17:51:16	2017-10-24 17:51:24	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:51:24	0	0	0	\N	\N	\N	0	5	3	2	1	4	\N	0
10	8	7	\N	\N	2017-10-24 17:52:59	2017-10-24 17:52:59	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:52:59	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
11	8	10	\N	\N	2017-10-24 17:53:06	2017-10-24 17:53:06	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:53:06	0	0	0	\N	\N	\N	\N	6	3	2	1	1	\N	0
19	19	7	\N	2	2017-10-24 18:01:21	2017-10-24 18:01:21	2017-10-24 18:02:01	2017-10-24 18:02:10	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:02:10	0	0	0	\N	\N	\N	0	10	3	2	1	4	\N	0
12	15	7	\N	\N	2017-10-24 17:54:55	2017-10-24 17:54:56	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:54:56	0	0	0	\N	\N	\N	\N	7	3	2	1	1	\N	0
13	15	9	\N	\N	2017-10-24 17:55:01	2017-10-24 17:55:02	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:55:02	0	0	0	\N	\N	\N	\N	7	3	2	1	1	\N	0
14	15	10	\N	\N	2017-10-24 17:55:07	2017-10-24 17:55:07	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:55:07	0	0	0	\N	\N	\N	\N	7	3	2	1	1	\N	0
20	19	9	\N	2	2017-10-24 18:01:30	2017-10-24 18:01:30	2017-10-24 18:02:32	2017-10-24 18:02:41	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:02:41	0	0	0	\N	\N	\N	0	10	3	2	1	4	\N	0
21	19	10	\N	3	2017-10-24 18:01:40	2017-10-24 18:01:40	2017-10-24 18:03:06	2017-10-24 18:03:15	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:03:15	0	0	0	\N	\N	\N	0	10	3	2	1	4	\N	0
15	16	9	\N	2	2017-10-24 17:56:59	2017-10-24 17:56:59	2017-10-24 17:57:26	2017-10-24 17:57:33	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:57:33	0	0	0	\N	\N	\N	0	8	3	2	1	4	\N	0
22	21	8	\N	\N	2017-10-24 18:05:31	2017-10-24 18:05:31	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:05:31	0	0	0	\N	\N	\N	\N	11	3	2	1	1	\N	0
16	16	10	\N	3	2017-10-24 17:57:08	2017-10-24 17:57:08	2017-10-24 17:57:47	2017-10-24 17:57:54	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:57:54	0	0	0	\N	\N	\N	0	8	3	2	1	4	\N	0
17	18	7	\N	\N	2017-10-24 17:59:42	2017-10-24 17:59:43	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 17:59:43	0	0	0	\N	\N	\N	\N	9	3	2	1	1	\N	0
23	21	9	\N	\N	2017-10-24 18:05:37	2017-10-24 18:05:37	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:05:37	0	0	0	\N	\N	\N	\N	11	3	2	1	1	\N	0
24	23	7	\N	\N	2017-10-24 18:07:47	2017-10-24 18:07:47	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:07:47	0	0	0	\N	\N	\N	\N	12	3	2	1	1	\N	0
25	23	8	\N	\N	2017-10-24 18:07:54	2017-10-24 18:07:54	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:07:54	0	0	0	\N	\N	\N	\N	12	3	2	1	1	\N	0
26	25	8	\N	\N	2017-10-24 18:11:04	2017-10-24 18:11:04	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:11:04	0	0	0	\N	\N	\N	\N	13	3	2	1	1	\N	0
27	25	9	\N	\N	2017-10-24 18:11:12	2017-10-24 18:11:12	\N	\N	\N	2017-11-21 00:00:00	2017-11-14 00:00:00	2017-10-24 18:11:12	0	0	0	\N	\N	\N	\N	13	3	2	1	1	\N	0
\.


--
-- Name: review_assignments_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('review_assignments_review_id_seq', 27, true);


--
-- Data for Name: review_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_files (review_id, file_id) FROM stdin;
1	4
2	4
3	7
4	7
5	9
6	9
7	11
8	11
9	11
10	14
11	14
12	28
13	28
14	28
15	31
16	31
17	34
18	34
19	36
20	36
21	36
22	39
23	39
24	42
25	42
26	46
27	46
\.


--
-- Data for Name: review_form_element_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_form_element_settings (review_form_element_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_form_elements; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_form_elements (review_form_element_id, review_form_id, seq, element_type, required, included) FROM stdin;
\.


--
-- Name: review_form_elements_review_form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('review_form_elements_review_form_element_id_seq', 1, false);


--
-- Data for Name: review_form_responses; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_form_responses (review_form_element_id, review_id, response_type, response_value) FROM stdin;
\.


--
-- Data for Name: review_form_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_form_settings (review_form_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: review_forms; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_forms (review_form_id, assoc_type, assoc_id, seq, is_active) FROM stdin;
\.


--
-- Name: review_forms_review_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('review_forms_review_form_id_seq', 1, false);


--
-- Data for Name: review_round_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_round_files (submission_id, review_round_id, stage_id, file_id, revision) FROM stdin;
1	1	3	2	1
2	2	3	4	1
4	3	3	7	1
5	4	3	9	1
6	5	3	11	1
8	6	3	14	1
15	7	3	28	1
16	8	3	31	1
18	9	3	34	1
19	10	3	36	1
21	11	3	39	1
23	12	3	42	1
25	13	3	46	1
\.


--
-- Data for Name: review_rounds; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY review_rounds (review_round_id, submission_id, stage_id, round, review_revision, status) FROM stdin;
1	1	3	1	\N	6
2	2	3	1	\N	4
12	23	3	1	\N	4
3	4	3	1	\N	4
13	25	3	1	\N	4
4	5	3	1	\N	4
5	6	3	1	\N	8
6	8	3	1	\N	4
7	15	3	1	\N	4
8	16	3	1	\N	8
9	18	3	1	\N	7
10	19	3	1	\N	1
11	21	3	1	\N	4
\.


--
-- Name: review_rounds_review_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('review_rounds_review_round_id_seq', 13, true);


--
-- Data for Name: rt_contexts; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY rt_contexts (context_id, version_id, title, abbrev, description, cited_by, author_terms, define_terms, geo_terms, seq) FROM stdin;
\.


--
-- Name: rt_contexts_context_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('rt_contexts_context_id_seq', 1, false);


--
-- Data for Name: rt_searches; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY rt_searches (search_id, context_id, title, description, url, search_url, search_post, seq) FROM stdin;
\.


--
-- Name: rt_searches_search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('rt_searches_search_id_seq', 1, false);


--
-- Data for Name: rt_versions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY rt_versions (version_id, journal_id, version_key, locale, title, description) FROM stdin;
\.


--
-- Name: rt_versions_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('rt_versions_version_id_seq', 1, false);


--
-- Data for Name: scheduled_tasks; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY scheduled_tasks (class_name, last_run) FROM stdin;
plugins.generic.usageStats.UsageStatsLoader	2017-10-24 17:39:19
plugins.importexport.doaj.DOAJInfoSender	2017-10-24 17:39:19
plugins.importexport.crossref.CrossrefInfoSender	2017-10-24 17:39:19
plugins.importexport.datacite.DataciteInfoSender	2017-10-24 17:39:19
plugins.importexport.medra.MedraInfoSender	2017-10-24 17:39:19
lib.pkp.classes.task.ReviewReminder	2017-10-24 17:39:19
\.


--
-- Data for Name: section_editors; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY section_editors (context_id, section_id, user_id) FROM stdin;
1	1	4
1	1	5
1	2	6
\.


--
-- Data for Name: section_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY section_settings (section_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	title	Articles	string
1	en_US	abbrev	ART	string
1	en_US	policy		string
1	en_US	identifyType		string
2	en_US	title	Reviews	string
2	en_US	abbrev	REV	string
2	en_US	policy		string
2	en_US	identifyType	Review Article	string
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY sections (section_id, journal_id, review_form_id, seq, editor_restricted, meta_indexed, meta_reviewed, abstracts_not_required, hide_title, hide_author, abstract_word_count) FROM stdin;
1	1	0	1	0	1	1	0	0	0	\N
2	1	0	2	0	1	1	1	0	0	0
\.


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('sections_section_id_seq', 2, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY sessions (session_id, user_id, ip_address, user_agent, created, last_used, remember, data, domain) FROM stdin;
rks2apk2tt363629ep1mj5poe6	\N	192.168.1.3	Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0	1508868819	1508868819	0	csrf|a:2:{s:9:"timestamp";i:1508868820;s:5:"token";s:32:"14e86b87a41ae492c688603e13461eeb";}	192.168.1.3
jtc6jg2b46te5om4gpeo7tsdo1	3	::1	Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0	1508867799	1508867838	1	csrf|a:2:{s:9:"timestamp";i:1508867839;s:5:"token";s:32:"7e4738cd0c039b147813e177643e4fd6";}userId|s:1:"3";username|s:7:"dbarnes";	localhost
qqs9t7475hlerld3u7idsgkg01	\N	::1	Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0	1508866757	1508868693	0	csrf|a:2:{s:9:"timestamp";i:1508868693;s:5:"token";s:32:"5d7af7ce18f713ba71a58654128159e3";}username|s:7:"dbarnes";	localhost
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY site (redirect, primary_locale, min_password_length, installed_locales, supported_locales, original_style_file_name) FROM stdin;
0	en_US	6	en_US:fr_CA	en_US:fr_CA	\N
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY site_settings (setting_name, locale, setting_value, setting_type) FROM stdin;
showThumbnail		1	bool
showTitle		1	bool
showDescription		1	bool
contactName	en_US	Open Journal Systems	string
contactEmail	en_US	pkpadmin@mailinator.com	string
themePluginPath		default	string
\.


--
-- Data for Name: stage_assignments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY stage_assignments (stage_assignment_id, submission_id, user_group_id, user_id, date_assigned, recommend_only) FROM stdin;
1	1	14	17	2017-10-24 17:43:17	0
2	1	3	3	2017-10-24 17:43:40	0
3	1	5	5	2017-10-24 17:43:40	0
4	1	5	4	2017-10-24 17:43:40	0
5	1	5	6	2017-10-24 17:44:10	1
6	2	14	18	2017-10-24 17:44:52	0
7	2	3	3	2017-10-24 17:45:15	0
8	2	5	5	2017-10-24 17:45:15	0
9	2	5	4	2017-10-24 17:45:15	0
10	2	7	11	2017-10-24 17:46:08	0
11	3	14	19	2017-10-24 17:46:24	0
12	3	3	3	2017-10-24 17:46:48	0
13	3	5	5	2017-10-24 17:46:48	0
14	3	5	4	2017-10-24 17:46:48	0
15	4	14	20	2017-10-24 17:47:00	0
16	4	3	3	2017-10-24 17:47:16	0
17	4	5	5	2017-10-24 17:47:16	0
18	4	5	4	2017-10-24 17:47:16	0
19	4	7	11	2017-10-24 17:48:11	0
20	4	11	13	2017-10-24 17:48:24	0
21	4	13	15	2017-10-24 17:48:29	0
22	5	14	21	2017-10-24 17:48:41	0
23	5	3	3	2017-10-24 17:48:57	0
24	5	5	5	2017-10-24 17:48:57	0
25	5	5	4	2017-10-24 17:48:57	0
26	5	7	11	2017-10-24 17:49:43	0
27	5	11	13	2017-10-24 17:49:56	0
28	6	14	22	2017-10-24 17:50:09	0
29	6	3	3	2017-10-24 17:50:25	0
30	6	5	5	2017-10-24 17:50:25	0
31	6	5	4	2017-10-24 17:50:25	0
32	7	14	23	2017-10-24 17:51:35	0
33	7	3	3	2017-10-24 17:51:55	0
34	7	5	5	2017-10-24 17:51:55	0
35	7	5	4	2017-10-24 17:51:55	0
36	8	14	24	2017-10-24 17:52:12	0
37	8	3	3	2017-10-24 17:52:31	0
38	8	5	6	2017-10-24 17:52:31	0
39	8	7	12	2017-10-24 17:53:21	0
40	8	11	14	2017-10-24 17:53:37	0
41	8	13	16	2017-10-24 17:53:44	0
42	15	14	25	2017-10-24 17:54:13	0
43	15	3	3	2017-10-24 17:54:29	0
44	15	5	5	2017-10-24 17:54:29	0
45	15	5	4	2017-10-24 17:54:29	0
46	15	7	12	2017-10-24 17:55:20	0
47	15	11	14	2017-10-24 17:55:34	0
48	15	13	16	2017-10-24 17:55:42	0
49	16	14	26	2017-10-24 17:56:10	0
50	16	3	3	2017-10-24 17:56:28	0
51	16	5	5	2017-10-24 17:56:28	0
52	16	5	4	2017-10-24 17:56:28	0
53	17	14	27	2017-10-24 17:58:07	0
54	17	3	3	2017-10-24 17:58:33	0
55	17	5	5	2017-10-24 17:58:33	0
56	17	5	4	2017-10-24 17:58:33	0
57	18	14	28	2017-10-24 17:58:44	0
58	18	3	3	2017-10-24 17:59:05	0
59	18	5	5	2017-10-24 17:59:05	0
60	18	5	4	2017-10-24 17:59:05	0
61	19	14	29	2017-10-24 18:00:13	0
62	19	3	3	2017-10-24 18:00:34	0
63	19	5	5	2017-10-24 18:00:34	0
64	19	5	4	2017-10-24 18:00:34	0
65	20	14	30	2017-10-24 18:04:10	0
66	20	3	3	2017-10-24 18:04:30	0
67	20	5	5	2017-10-24 18:04:30	0
68	20	5	4	2017-10-24 18:04:30	0
69	21	14	31	2017-10-24 18:04:40	0
70	21	3	3	2017-10-24 18:04:58	0
71	21	5	5	2017-10-24 18:04:58	0
72	21	5	4	2017-10-24 18:04:58	0
73	21	7	12	2017-10-24 18:05:52	0
74	21	11	14	2017-10-24 18:06:09	0
75	22	14	32	2017-10-24 18:06:23	0
76	22	3	3	2017-10-24 18:06:39	0
77	22	5	5	2017-10-24 18:06:39	0
78	22	5	4	2017-10-24 18:06:39	0
79	23	14	33	2017-10-24 18:06:59	0
80	23	3	3	2017-10-24 18:07:18	0
81	23	5	5	2017-10-24 18:07:18	0
82	23	5	4	2017-10-24 18:07:18	0
83	23	7	11	2017-10-24 18:08:11	0
84	23	11	13	2017-10-24 18:08:28	0
85	23	13	15	2017-10-24 18:08:36	0
86	24	14	34	2017-10-24 18:09:09	0
87	24	3	3	2017-10-24 18:09:33	0
88	24	5	5	2017-10-24 18:09:33	0
89	24	5	4	2017-10-24 18:09:33	0
90	25	14	35	2017-10-24 18:10:08	0
91	25	3	3	2017-10-24 18:10:29	0
92	25	5	6	2017-10-24 18:10:29	0
93	25	7	12	2017-10-24 18:11:28	0
\.


--
-- Name: stage_assignments_stage_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('stage_assignments_stage_assignment_id_seq', 93, true);


--
-- Data for Name: static_page_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY static_page_settings (static_page_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY static_pages (static_page_id, path, context_id) FROM stdin;
\.


--
-- Name: static_pages_static_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('static_pages_static_page_id_seq', 1, false);


--
-- Data for Name: submission_artwork_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_artwork_files (file_id, revision, caption, credit, copyright_owner, copyright_owner_contact, permission_terms, permission_file_id, chapter_id, contact_author) FROM stdin;
\.


--
-- Data for Name: submission_comments; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_comments (comment_id, comment_type, role_id, submission_id, assoc_id, author_id, comment_title, comments, date_posted, date_modified, viewable) FROM stdin;
1	1	4096	6	7	8		<p>Here are my review comments.</p>	2017-10-24 17:51:23	\N	1
2	1	4096	16	15	9		<p>Here are my review comments.</p>	2017-10-24 17:57:32	\N	1
3	1	4096	16	16	10		<p>Here are my review comments.</p>	2017-10-24 17:57:53	\N	1
4	1	4096	19	19	7		<p>Here are my review comments.</p>	2017-10-24 18:02:10	\N	1
5	1	4096	19	20	9		<p>Here are my review comments.</p>	2017-10-24 18:02:41	\N	1
6	1	4096	19	21	10		<p>Here are my review comments.</p>	2017-10-24 18:03:15	\N	1
\.


--
-- Name: submission_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submission_comments_comment_id_seq', 6, true);


--
-- Data for Name: submission_file_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_file_settings (file_id, locale, setting_name, setting_value, setting_type) FROM stdin;
1	en_US	name	The influence of lactation on the quantity and quality of cashmere production	string
2	en_US	name	Author, theinfluenceoflactationonthequantityandqualityofcashmereproduction.pdf	string
3	en_US	name	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence	string
4	en_US	name	Author, thefacetsofjobsatisfactionaninenationcomparativestudyofconstructequivalence.pdf	string
5	en_US	name	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice	string
6	en_US	name	Genetic transformation of forest trees	string
7	en_US	name	Author, genetictransformationofforesttrees.pdf	string
8	en_US	name	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement	string
9	en_US	name	Author, investigatingthesharedbackgroundrequiredforargumentacritiqueoffogelinsthesisondeepdisagreement.pdf	string
10	en_US	name	Developing efficacy beliefs in the classroom	string
11	en_US	name	Author, developingefficacybeliefsintheclassroom.pdf	string
12	en_US	name	Traditions and Trends in the Study of the Commons	string
13	en_US	name	Hansen & Pinto: Reason Reclaimed	string
14	en_US	name	Author, hansenpintoreasonreclaimed.pdf	string
15	en_US	name	Cyclomatic Complexity: theme and variations	string
16	en_US	name	Cyclomatic Complexity: theme and variations	string
17	en_US	name	A Review of Information Systems and Corporate Memory: design for staff turn-over	string
18	en_US	name	A Review of Information Systems and Corporate Memory: design for staff turn-over	string
19	en_US	name	Data Modelling and Conceptual Modelling: a comparative analysis of functionality and roles	string
20	en_US	name	Data Modelling and Conceptual Modelling: a comparative analysis of functionality and roles	string
21	en_US	name	A Review of Object Oriented Database Concepts and their Implementation	string
22	en_US	name	A Review of Object Oriented Database Concepts and their Implementation	string
23	en_US	name	Cyberspace Versus Citizenship: IT and emerging non space communities	string
24	en_US	name	Cyberspace Versus Citizenship: IT and emerging non space communities	string
25	en_US	name	Whistleblowing: an ethical dilemma	string
26	en_US	name	Whistleblowing: an ethical dilemma	string
27	en_US	name	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence	string
28	en_US	name	Author, signallingtheorydividendsareviewoftheliteratureandempiricalevidence.pdf	string
29	en_US	name	PDF	string
30	en_US	name	Condensing Water Availability Models to Focus on Specific Water Management Systems	string
31	en_US	name	Author, condensingwateravailabilitymodelstofocusonspecificwatermanagementsystems.pdf	string
32	en_US	name	Learning Sustainable Design through Service	string
33	en_US	name	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning	string
34	en_US	name	Author, sodiumbutyrateimprovesgrowthperformanceofweanedpigletsduringthefirstperiodafterweaning.pdf	string
35	en_US	name	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions	string
36	en_US	name	Author, hydrologicconnectivityintheedwardsaquiferbetweensanmarcosspringsandbartonspringsduring2009droughtconditions.pdf	string
37	en_US	name	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua	string
38	en_US	name	Yam diseases and its management in Nigeria	string
39	en_US	name	Author, yamdiseasesanditsmanagementinnigeria.pdf	string
40	en_US	name	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat	string
41	en_US	name	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran	string
42	en_US	name	Author, antimicrobialheavymetalresistanceandplasmidprofileofcoliformsisolatedfromnosocomialinfectionsinahospitalinisfahaniran.pdf	string
43	en_US	name	PDF	string
44	en_US	name	Self-Organization in Multi-Level Institutions in Networked Environments	string
45	en_US	name	Finocchiaro: Arguments About Arguments	string
46	en_US	name	Author, finocchiaroargumentsaboutarguments.pdf	string
\.


--
-- Data for Name: submission_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_files (file_id, revision, source_file_id, source_revision, submission_id, file_type, genre_id, file_size, original_file_name, file_stage, direct_sales_price, sales_type, viewable, date_uploaded, date_modified, user_group_id, uploader_user_id, assoc_type, assoc_id) FROM stdin;
1	1	\N	\N	1	application/pdf	1	14572	theinfluenceoflactationonthequantityandqualityofcashmereproduction.pdf	2	\N	\N	1	2017-10-24 17:43:26	2017-10-24 17:43:26	14	17	\N	\N
2	1	1	1	1	application/pdf	1	14572	theinfluenceoflactationonthequantityandqualityofcashmereproduction.pdf	4	\N	\N	1	2017-10-24 17:43:26	2017-10-24 17:44:00	14	17	\N	\N
3	1	\N	\N	2	application/pdf	1	14572	thefacetsofjobsatisfactionaninenationcomparativestudyofconstructequivalence.pdf	2	\N	\N	1	2017-10-24 17:45:01	2017-10-24 17:45:01	14	18	\N	\N
4	1	3	1	2	application/pdf	1	14572	thefacetsofjobsatisfactionaninenationcomparativestudyofconstructequivalence.pdf	4	\N	\N	1	2017-10-24 17:45:01	2017-10-24 17:45:31	14	18	\N	\N
5	1	\N	\N	3	application/pdf	1	14572	computerskillrequirementsfornewandexistingteachersimplicationsforpolicyandpractice.pdf	2	\N	\N	1	2017-10-24 17:46:34	2017-10-24 17:46:34	14	19	\N	\N
6	1	\N	\N	4	application/pdf	1	14572	genetictransformationofforesttrees.pdf	2	\N	\N	1	2017-10-24 17:47:06	2017-10-24 17:47:06	14	20	\N	\N
7	1	6	1	4	application/pdf	1	14572	genetictransformationofforesttrees.pdf	4	\N	\N	1	2017-10-24 17:47:06	2017-10-24 17:47:33	14	20	\N	\N
8	1	\N	\N	5	application/pdf	1	14572	investigatingthesharedbackgroundrequiredforargumentacritiqueoffogelinsthesisondeepdisagreement.pdf	2	\N	\N	1	2017-10-24 17:48:47	2017-10-24 17:48:47	14	21	\N	\N
9	1	8	1	5	application/pdf	1	14572	investigatingthesharedbackgroundrequiredforargumentacritiqueoffogelinsthesisondeepdisagreement.pdf	4	\N	\N	1	2017-10-24 17:48:47	2017-10-24 17:49:13	14	21	\N	\N
10	1	\N	\N	6	application/pdf	1	14572	developingefficacybeliefsintheclassroom.pdf	2	\N	\N	1	2017-10-24 17:50:15	2017-10-24 17:50:15	14	22	\N	\N
11	1	10	1	6	application/pdf	1	14572	developingefficacybeliefsintheclassroom.pdf	4	\N	\N	1	2017-10-24 17:50:15	2017-10-24 17:50:39	14	22	\N	\N
12	1	\N	\N	7	application/pdf	1	14572	traditionsandtrendsinthestudyofthecommons.pdf	2	\N	\N	1	2017-10-24 17:51:41	2017-10-24 17:51:41	14	23	\N	\N
13	1	\N	\N	8	application/pdf	1	14572	hansenpintoreasonreclaimed.pdf	2	\N	\N	1	2017-10-24 17:52:20	2017-10-24 17:52:20	14	24	\N	\N
14	1	13	1	8	application/pdf	1	14572	hansenpintoreasonreclaimed.pdf	4	\N	\N	1	2017-10-24 17:52:20	2017-10-24 17:52:48	14	24	\N	\N
15	1	\N	\N	9	application/pdf	1	14572	cyclomaticcomplexitythemeandvariations.pdf	2	\N	\N	0	2017-10-24 17:54:02	2017-10-24 17:54:02	3	3	\N	\N
16	1	\N	\N	9	application/pdf	1	14572	cyclomaticcomplexitythemeandvariations.pdf	10	\N	\N	0	2017-10-24 17:54:02	2017-10-24 17:54:02	3	3	521	1
17	1	\N	\N	10	application/pdf	1	14572	areviewofinformationsystemsandcorporatememorydesignforstaffturnover.pdf	2	\N	\N	0	2017-10-24 17:54:02	2017-10-24 17:54:02	3	3	\N	\N
18	1	\N	\N	10	application/pdf	1	14572	areviewofinformationsystemsandcorporatememorydesignforstaffturnover.pdf	10	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	521	2
19	1	\N	\N	11	application/pdf	1	14572	datamodellingandconceptualmodellingacomparativeanalysisoffunctionalityandroles.pdf	2	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	\N	\N
20	1	\N	\N	11	application/pdf	1	14572	datamodellingandconceptualmodellingacomparativeanalysisoffunctionalityandroles.pdf	10	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	521	3
21	1	\N	\N	12	application/pdf	1	14572	areviewofobjectorienteddatabaseconceptsandtheirimplementation.pdf	2	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	\N	\N
22	1	\N	\N	12	application/pdf	1	14572	areviewofobjectorienteddatabaseconceptsandtheirimplementation.pdf	10	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	521	4
23	1	\N	\N	13	application/pdf	1	14572	cyberspaceversuscitizenshipitandemergingnonspacecommunities.pdf	2	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	\N	\N
24	1	\N	\N	13	application/pdf	1	14572	cyberspaceversuscitizenshipitandemergingnonspacecommunities.pdf	10	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	521	5
25	1	\N	\N	14	application/pdf	1	14572	whistleblowinganethicaldilemma.pdf	2	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	\N	\N
26	1	\N	\N	14	application/pdf	1	14572	whistleblowinganethicaldilemma.pdf	10	\N	\N	0	2017-10-24 17:54:03	2017-10-24 17:54:03	3	3	521	6
27	1	\N	\N	15	application/pdf	1	14572	signallingtheorydividendsareviewoftheliteratureandempiricalevidence.pdf	2	\N	\N	1	2017-10-24 17:54:19	2017-10-24 17:54:19	14	25	\N	\N
28	1	27	1	15	application/pdf	1	14572	signallingtheorydividendsareviewoftheliteratureandempiricalevidence.pdf	4	\N	\N	1	2017-10-24 17:54:19	2017-10-24 17:54:45	14	25	\N	\N
29	1	\N	\N	15	application/pdf	1	14572	pdf.pdf	10	\N	\N	0	2017-10-24 17:55:53	2017-10-24 17:55:53	3	3	521	7
30	1	\N	\N	16	application/pdf	1	14572	condensingwateravailabilitymodelstofocusonspecificwatermanagementsystems.pdf	2	\N	\N	1	2017-10-24 17:56:17	2017-10-24 17:56:17	14	26	\N	\N
31	1	30	1	16	application/pdf	1	14572	condensingwateravailabilitymodelstofocusonspecificwatermanagementsystems.pdf	4	\N	\N	1	2017-10-24 17:56:17	2017-10-24 17:56:47	14	26	\N	\N
32	1	\N	\N	17	application/pdf	1	14572	learningsustainabledesignthroughservice.pdf	2	\N	\N	1	2017-10-24 17:58:15	2017-10-24 17:58:15	14	27	\N	\N
33	1	\N	\N	18	application/pdf	1	14572	sodiumbutyrateimprovesgrowthperformanceofweanedpigletsduringthefirstperiodafterweaning.pdf	2	\N	\N	1	2017-10-24 17:58:51	2017-10-24 17:58:51	14	28	\N	\N
34	1	33	1	18	application/pdf	1	14572	sodiumbutyrateimprovesgrowthperformanceofweanedpigletsduringthefirstperiodafterweaning.pdf	4	\N	\N	1	2017-10-24 17:58:51	2017-10-24 17:59:25	14	28	\N	\N
35	1	\N	\N	19	application/pdf	1	14572	hydrologicconnectivityintheedwardsaquiferbetweensanmarcosspringsandbartonspringsduring2009droughtconditions.pdf	2	\N	\N	1	2017-10-24 18:00:21	2017-10-24 18:00:21	14	29	\N	\N
36	1	35	1	19	application/pdf	1	14572	hydrologicconnectivityintheedwardsaquiferbetweensanmarcosspringsandbartonspringsduring2009droughtconditions.pdf	4	\N	\N	1	2017-10-24 18:00:21	2017-10-24 18:01:03	14	29	\N	\N
37	1	\N	\N	20	application/pdf	1	14572	towardsdesigninganinterculturalcurriculumacasestudyfromtheatlanticcoastofnicaragua.pdf	2	\N	\N	1	2017-10-24 18:04:18	2017-10-24 18:04:18	14	30	\N	\N
38	1	\N	\N	21	application/pdf	1	14572	yamdiseasesanditsmanagementinnigeria.pdf	2	\N	\N	1	2017-10-24 18:04:46	2017-10-24 18:04:46	14	31	\N	\N
39	1	38	1	21	application/pdf	1	14572	yamdiseasesanditsmanagementinnigeria.pdf	4	\N	\N	1	2017-10-24 18:04:46	2017-10-24 18:05:19	14	31	\N	\N
40	1	\N	\N	22	application/pdf	1	14572	influenceoflongtermnutritionwithdifferentdietaryfatsonfattyacidcompositionofheavypigsbackfat.pdf	2	\N	\N	1	2017-10-24 18:06:29	2017-10-24 18:06:29	14	32	\N	\N
41	1	\N	\N	23	application/pdf	1	14572	antimicrobialheavymetalresistanceandplasmidprofileofcoliformsisolatedfromnosocomialinfectionsinahospitalinisfahaniran.pdf	2	\N	\N	1	2017-10-24 18:07:06	2017-10-24 18:07:06	14	33	\N	\N
42	1	41	1	23	application/pdf	1	14572	antimicrobialheavymetalresistanceandplasmidprofileofcoliformsisolatedfromnosocomialinfectionsinahospitalinisfahaniran.pdf	4	\N	\N	1	2017-10-24 18:07:06	2017-10-24 18:07:37	14	33	\N	\N
43	1	\N	\N	23	application/pdf	1	14572	pdf.pdf	10	\N	\N	0	2017-10-24 18:08:48	2017-10-24 18:08:48	3	3	521	8
44	1	\N	\N	24	application/pdf	1	14572	selforganizationinmultilevelinstitutionsinnetworkedenvironments.pdf	2	\N	\N	1	2017-10-24 18:09:19	2017-10-24 18:09:19	14	34	\N	\N
45	1	\N	\N	25	application/pdf	1	14572	finocchiaroargumentsaboutarguments.pdf	2	\N	\N	1	2017-10-24 18:10:16	2017-10-24 18:10:16	14	35	\N	\N
46	1	45	1	25	application/pdf	1	14572	finocchiaroargumentsaboutarguments.pdf	4	\N	\N	1	2017-10-24 18:10:16	2017-10-24 18:10:48	14	35	\N	\N
\.


--
-- Name: submission_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submission_files_file_id_seq', 46, true);


--
-- Data for Name: submission_galley_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_galley_settings (galley_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: submission_galleys; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_galleys (galley_id, locale, submission_id, label, file_id, seq, remote_url, is_approved) FROM stdin;
1	en_US	9	PDF	16	0	\N	0
2	en_US	10	PDF	18	0	\N	0
3	en_US	11	PDF	20	0	\N	0
4	en_US	12	PDF	22	0	\N	0
5	en_US	13	PDF	24	0	\N	0
6	en_US	14	PDF	26	0	\N	0
7	en_US	15	PDF	29	0		0
8	en_US	23	PDF	43	0		0
\.


--
-- Name: submission_galleys_galley_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submission_galleys_galley_id_seq', 8, true);


--
-- Data for Name: submission_search_keyword_list; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_search_keyword_list (keyword_id, keyword_text) FROM stdin;
\.


--
-- Name: submission_search_keyword_list_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submission_search_keyword_list_keyword_id_seq', 1, false);


--
-- Data for Name: submission_search_object_keywords; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_search_object_keywords (object_id, keyword_id, pos) FROM stdin;
\.


--
-- Data for Name: submission_search_objects; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_search_objects (object_id, submission_id, type, assoc_id) FROM stdin;
\.


--
-- Name: submission_search_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submission_search_objects_object_id_seq', 1, false);


--
-- Data for Name: submission_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_settings (submission_id, locale, setting_name, setting_value, setting_type) FROM stdin;
3	en_US	prefix		string
3	en_US	subtitle		string
1	en_US	title	The influence of lactation on the quantity and quality of cashmere production	string
2	en_US	title	The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence	string
2	en_US	cleanTitle	The Facets Of Job Satisfaction: A NineNation Comparative Study Of Construct Equivalence	string
2	en_US	abstract	<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>	string
2	en_US	prefix		string
2	en_US	subtitle		string
1	en_US	cleanTitle	The influence of lactation on the quantity and quality of cashmere production	string
1	en_US	abstract	<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) "L", "a" and "Chroma" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>	string
1	en_US	prefix		string
1	en_US	subtitle		string
3	en_US	title	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice	string
3	en_US	cleanTitle	Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice	string
3	en_US	abstract	<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>	string
6	en_US	cleanTitle	Developing efficacy beliefs in the classroom	string
5	en_US	abstract	<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>	string
5	en_US	prefix		string
5	en_US	subtitle		string
14	en_US	title	Whistleblowing: an ethical dilemma	string
5	en_US	title	Investigating the Shared Background Required for Argument: A Critique of Fogelin's Thesis on Deep Disagreement	string
5	en_US	cleanTitle	Investigating the Shared Background Required for Argument: A Critique of Fogelins Thesis on Deep Disagreement	string
4	en_US	title	Genetic transformation of forest trees	string
4	en_US	cleanTitle	Genetic transformation of forest trees	string
4	en_US	abstract	<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>	string
4	en_US	prefix		string
4	en_US	subtitle		string
14	en_US	cleanTitle	Whistleblowing: an ethical dilemma	string
6	en_US	title	Developing efficacy beliefs in the classroom	string
14	en_US	abstract	<p>Because most organizations depend on computer systems that electronically store important data to perform crucial business functions, the integrity of these information systems is paramount. Securing company systems, however, is not always an easy task. More sophisticated systems often provide widespread access to computer resources and increased user knowledge, which may lead to added difficulties in maintaining security. This paper explores whistleblowing employees' exposing illegal or unethical computer practices taking place in the organization as a method of computer security and the support for whistleblowing found in codes of ethical conduct formulated by professional societies.</p>	string
12	en_US	abstract	<p>Object Oriented design and databases has attracted a great deal of attention in recent years. This article outlines and discusses the semantic data principles used inter alia in understanding Object Oriented concepts. To illustrate and lend substance to this discussion a list is presented of OODBMS implementations. Their weaknesses and strengths are analysed. And their suitability for specific applications is assessed. Finally we offer some conclusions about research in this area and the directions in which further development should proceed.</p>	string
13	en_US	title	Cyberspace Versus Citizenship: IT and emerging non space communities	string
6	en_US	abstract	<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>	string
6	en_US	prefix		string
6	en_US	subtitle		string
13	en_US	cleanTitle	Cyberspace Versus Citizenship: IT and emerging non space communities	string
13	en_US	abstract	<p>In 1964 Melvin Webber challenged the notions of community and centrality used in urban studies by demonstrating that "community without propinquity" was emerging within certain social networks. He argued that individuals were enmeshed in an overlapping range of groups, and that increasingly these social networks were not limited by physical or geographical location. His definition of community acknowledges a differentiated range of "non-place" cultures. It reflects a change to a process, rather than product oriented view of urban form, triggered in part by the influence of general systems theory. Webber influenced and was influenced by the emergence of an orientation towards non-physical aspects of community, and a participatory approach to design which emerged strongly during the seventies. Reexamination of Webber's work in the light of current information technology offers some insight into the nature of the globalisation of the world economy, and consequent impacts on nationality and sovereignty. The technologies that will be commonplace by the end of the century can both empower and disempower and it will be necessary to reconsider our current notions of both citizenship and of access to and control of such crucial resources. Opportunities offered by IT for marginalised or peripheral groups, whether at the level of nation, region or local community, will challenge existing definitions of centre and periphery. The moral panics surrounding such activities as "hacking" and its supporting "cyberpunk" sub culture demonstrate a growing awareness of the importance of emerging non-space communities.</p>	string
7	en_US	title	Traditions and Trends in the Study of the Commons	string
7	en_US	cleanTitle	Traditions and Trends in the Study of the Commons	string
7	en_US	abstract	<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>	string
7	en_US	prefix		string
7	en_US	subtitle		string
8	en_US	title	Hansen & Pinto: Reason Reclaimed	string
8	en_US	cleanTitle	Hansen & Pinto: Reason Reclaimed	string
8	en_US	abstract	<p>None.</p>	string
8	en_US	prefix		string
8	en_US	subtitle		string
9	en_US	title	Cyclomatic Complexity: theme and variations	string
9	en_US	cleanTitle	Cyclomatic Complexity: theme and variations	string
9	en_US	abstract	<p>Focussing on the "McCabe family" of measures for the decision/logic structure of a program, leads to an evaluation of extensions to modularization, nesting and, potentially, to object-oriented program structures. A comparison of rated, operating and essential complexities of programs suggests two new metrics: "inessential complexity" as a measure of unstructuredness and "product complexity" as a potential objective measure of structural complexity. Finally, nesting and abstraction levels are considered, especially as to how metrics from the "McCabe family" might be applied in an object-oriented systems development environment.</p>	string
10	en_US	title	A Review of Information Systems and Corporate Memory: design for staff turn-over	string
10	en_US	cleanTitle	A Review of Information Systems and Corporate Memory: design for staff turnover	string
11	en_US	title	Data Modelling and Conceptual Modelling: a comparative analysis of functionality and roles	string
11	en_US	cleanTitle	Data Modelling and Conceptual Modelling: a comparative analysis of functionality and roles	string
11	en_US	abstract	<p>This paper reviews the functionality associated "data modelling" and "conceptual modelling". The history and origins of each term are considered, together with the current interpretation of each term. The term "information modelling" is also taken into account. Alternative representation forms are presented and reviewed. The merit of diagrams as a basis for a dialogue with a subject area expert is indicated. The paper suggests that a clear distinction is needed between data modelling and conceptual modelling. Both analytic modelling and prescriptive modelling are reviewed. The requirements for a conceptual schema modelling facility over and above the functionality provided by currently available data modelling facilities are presented. The need is emphasized for a conceptual schema modelling facility to support a representation form easily assimilatable by a subject area expert not familiar with information system. Based on the distinctions made, the paper suggests a way in which a data modelling facility and a conceptual schema modelling facility can be positioned in an information systems life cycle.</p>	string
12	en_US	title	A Review of Object Oriented Database Concepts and their Implementation	string
12	en_US	cleanTitle	A Review of Object Oriented Database Concepts and their Implementation	string
21	en_US	abstract	<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>	string
16	en_US	title	Condensing Water Availability Models to Focus on Specific Water Management Systems	string
16	en_US	cleanTitle	Condensing Water Availability Models to Focus on Specific Water Management Systems	string
15	en_US	title	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence	string
15	en_US	cleanTitle	Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence	string
15	en_US	abstract	<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>	string
15	en_US	prefix		string
15	en_US	subtitle		string
16	en_US	prefix		string
16	en_US	subtitle		string
16	en_US	abstract	<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>	string
23	en_US	abstract	<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>	string
17	en_US	title	Learning Sustainable Design through Service	string
17	en_US	cleanTitle	Learning Sustainable Design through Service	string
17	en_US	abstract	<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>	string
17	en_US	prefix		string
17	en_US	subtitle		string
18	en_US	title	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning	string
18	en_US	cleanTitle	Sodium butyrate improves growth performance of weaned piglets during the first period after weaning	string
18	en_US	prefix		string
18	en_US	subtitle		string
18	en_US	abstract	<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>	string
19	en_US	title	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions	string
19	en_US	cleanTitle	Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions	string
19	en_US	abstract	<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>	string
20	en_US	prefix		string
20	en_US	subtitle		string
19	en_US	prefix		string
19	en_US	subtitle		string
21	en_US	cleanTitle	Yam diseases and its management in Nigeria	string
21	en_US	prefix		string
20	en_US	title	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua	string
20	en_US	cleanTitle	Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua	string
20	en_US	abstract	<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>	string
21	en_US	subtitle		string
22	en_US	title	Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat	string
22	en_US	cleanTitle	Influence of longterm nutrition with different dietary fats on fatty acid composition of heavy pigs backfat	string
21	en_US	title	Yam diseases and its management in Nigeria	string
22	en_US	abstract	<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>	string
22	en_US	prefix		string
22	en_US	subtitle		string
24	en_US	title	Self-Organization in Multi-Level Institutions in Networked Environments	string
24	en_US	cleanTitle	SelfOrganization in MultiLevel Institutions in Networked Environments	string
24	en_US	abstract	<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>	string
24	en_US	prefix		string
24	en_US	subtitle		string
23	en_US	title	Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran	string
23	en_US	cleanTitle	Antimicrobial heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan Iran	string
23	en_US	prefix		string
23	en_US	subtitle		string
25	en_US	title	Finocchiaro: Arguments About Arguments	string
25	en_US	cleanTitle	Finocchiaro: Arguments About Arguments	string
25	en_US	abstract	<p>None.</p>	string
25	en_US	prefix		string
25	en_US	subtitle		string
\.


--
-- Data for Name: submission_supplementary_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_supplementary_files (file_id, revision) FROM stdin;
\.


--
-- Data for Name: submission_tombstones; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submission_tombstones (tombstone_id, submission_id, date_deleted, journal_id, section_id, set_spec, set_name, oai_identifier) FROM stdin;
\.


--
-- Name: submission_tombstones_tombstone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submission_tombstones_tombstone_id_seq', 1, false);


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY submissions (submission_id, locale, context_id, section_id, language, citations, date_submitted, last_modified, date_status_modified, status, submission_progress, pages, hide_author, stage_id) FROM stdin;
7	en_US	1	1		\N	2017-10-24 17:51:55	2017-10-24 17:51:55	2017-10-24 17:51:55	1	0	\N	0	1
1	en_US	1	1		\N	2017-10-24 17:43:40	2017-10-24 17:44:29	2017-10-24 17:44:29	1	0	\N	0	3
17	en_US	1	1		\N	2017-10-24 17:58:32	2017-10-24 17:58:32	2017-10-24 17:58:32	1	0	\N	0	1
23	en_US	1	1		\N	2017-10-24 18:07:18	2017-10-24 18:08:17	2017-10-24 18:08:17	1	0	\N	0	5
2	en_US	1	1		\N	2017-10-24 17:45:14	2017-10-24 17:45:56	2017-10-24 17:45:56	1	0	\N	0	4
24	en_US	1	1		\N	2017-10-24 18:09:33	2017-10-24 18:09:54	2017-10-24 18:09:54	4	0	\N	0	1
18	en_US	1	1		\N	2017-10-24 17:59:05	2017-10-24 17:59:54	2017-10-24 17:59:54	1	0	\N	0	3
8	en_US	1	2		\N	2017-10-24 17:52:31	2017-10-24 17:53:27	2017-10-24 17:53:27	1	0	\N	0	5
3	en_US	1	1		\N	2017-10-24 17:46:48	2017-10-24 17:46:48	2017-10-24 17:46:48	1	0	\N	0	1
9	en_US	1	1	\N	\N	2016-02-11 00:00:00	2017-10-24 17:54:02	\N	3	0	\N	0	1
10	en_US	1	2	\N	\N	2016-02-11 00:00:00	2017-10-24 17:54:03	\N	3	0	\N	0	1
4	en_US	1	1		\N	2017-10-24 17:47:16	2017-10-24 17:48:17	2017-10-24 17:48:17	1	0	\N	0	5
11	en_US	1	1	\N	\N	2016-02-11 00:00:00	2017-10-24 17:54:03	\N	3	0	\N	0	1
12	en_US	1	2	\N	\N	2016-02-11 00:00:00	2017-10-24 17:54:03	\N	3	0	\N	0	1
13	en_US	1	1	\N	\N	2016-02-11 00:00:00	2017-10-24 17:54:03	\N	3	0	\N	0	1
19	en_US	1	1		\N	2017-10-24 18:00:34	2017-10-24 18:03:50	2017-10-24 18:03:50	1	0	\N	0	3
5	en_US	1	1		\N	2017-10-24 17:48:57	2017-10-24 17:49:48	2017-10-24 17:49:48	1	0	\N	0	5
14	en_US	1	1	\N	\N	2016-02-11 00:00:00	2017-10-24 17:54:03	\N	3	0	\N	0	1
25	en_US	1	2		\N	2017-10-24 18:10:28	2017-10-24 18:11:17	2017-10-24 18:11:17	1	0	\N	0	4
20	en_US	1	1		\N	2017-10-24 18:04:30	2017-10-24 18:04:30	2017-10-24 18:04:30	1	0	\N	0	1
6	en_US	1	1		\N	2017-10-24 17:50:25	2017-10-24 17:51:02	2017-10-24 17:51:02	1	0	\N	0	3
15	en_US	1	1		\N	2017-10-24 17:54:29	2017-10-24 17:55:26	2017-10-24 17:55:25	1	0	\N	0	5
21	en_US	1	1		\N	2017-10-24 18:04:58	2017-10-24 18:05:58	2017-10-24 18:05:58	1	0	\N	0	5
16	en_US	1	1		\N	2017-10-24 17:56:28	2017-10-24 17:57:08	2017-10-24 17:57:08	1	0	\N	0	3
22	en_US	1	1		\N	2017-10-24 18:06:39	2017-10-24 18:06:39	2017-10-24 18:06:39	1	0	\N	0	1
\.


--
-- Name: submissions_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('submissions_submission_id_seq', 25, true);


--
-- Data for Name: subscription_type_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY subscription_type_settings (type_id, locale, setting_name, setting_value, setting_type) FROM stdin;
\.


--
-- Data for Name: subscription_types; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY subscription_types (type_id, journal_id, cost, currency_code_alpha, non_expiring, duration, format, institutional, membership, disable_public_display, seq) FROM stdin;
\.


--
-- Name: subscription_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('subscription_types_type_id_seq', 1, false);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY subscriptions (subscription_id, journal_id, user_id, type_id, date_start, date_end, status, membership, reference_number, notes) FROM stdin;
\.


--
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('subscriptions_subscription_id_seq', 1, false);


--
-- Data for Name: temporary_files; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY temporary_files (file_id, user_id, file_name, file_type, file_size, original_file_name, date_uploaded) FROM stdin;
1	3	xmlqz4B4c	application/xml	254010	issue.xml	2017-10-24 17:54:01
\.


--
-- Name: temporary_files_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('temporary_files_file_id_seq', 1, true);


--
-- Data for Name: usage_stats_temporary_records; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY usage_stats_temporary_records (assoc_id, assoc_type, day, entry_time, metric, country_id, region, city, load_id, file_type) FROM stdin;
\.


--
-- Data for Name: user_group_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY user_group_settings (user_group_id, locale, setting_name, setting_value, setting_type) FROM stdin;
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
2	fr_CA	name	Directeur de la revue	string
2	fr_CA	abbrev	DIR	string
3	fr_CA	name	Rédacteur	string
3	fr_CA	abbrev	RÉD	string
4	fr_CA	name	Directeur de production	string
4	fr_CA	abbrev	DirProd	string
5	fr_CA	name	Rédacteur de rubrique	string
5	fr_CA	abbrev	RÉDRUB	string
6	fr_CA	name	Rédacteur invité	string
6	fr_CA	abbrev	RÉDINV	string
7	fr_CA	name	Réviseur	string
7	fr_CA	abbrev	RÉV	string
8	fr_CA	name	Designer	string
8	fr_CA	abbrev	Design	string
9	fr_CA	name	Coordonnateur du financement	string
9	fr_CA	abbrev	CF	string
10	fr_CA	name	Indexeur	string
10	fr_CA	abbrev	Indx	string
11	fr_CA	name	Responsable de la mise en page	string
11	fr_CA	abbrev	RespMP	string
12	fr_CA	name	Coordonnateur des ventes et du marketing	string
12	fr_CA	abbrev	CVM	string
13	fr_CA	name	Correcteur d’épreuves	string
13	fr_CA	abbrev	CorEp	string
14	fr_CA	name	Auteur	string
14	fr_CA	abbrev	AU	string
15	fr_CA	name	Traducteur	string
15	fr_CA	abbrev	Trad	string
16	fr_CA	name	Évaluateur	string
16	fr_CA	abbrev	ÉVAL	string
17	fr_CA	name	Lecteur	string
17	fr_CA	abbrev	Lect	string
18	fr_CA	name	Responsable des abonnements	string
18	fr_CA	abbrev	RespAB	string
\.


--
-- Data for Name: user_group_stage; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY user_group_stage (context_id, user_group_id, stage_id) FROM stdin;
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

COPY user_groups (user_group_id, context_id, role_id, is_default, show_title, permit_self_registration) FROM stdin;
1	0	1	1	0	0
2	1	16	1	0	0
3	1	16	1	0	0
4	1	16	1	0	0
5	1	17	1	0	0
6	1	17	1	0	0
7	1	4097	1	0	0
8	1	4097	1	0	0
9	1	4097	1	0	0
10	1	4097	1	0	0
11	1	4097	1	0	0
12	1	4097	1	0	0
13	1	4097	1	0	0
14	1	65536	1	0	1
15	1	65536	1	0	0
16	1	4096	1	0	1
17	1	1048576	1	0	1
18	1	2097152	1	0	0
\.


--
-- Name: user_groups_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('user_groups_user_group_id_seq', 18, true);


--
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY user_interests (user_id, controlled_vocab_entry_id) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY user_settings (user_id, locale, setting_name, assoc_type, assoc_id, setting_value, setting_type) FROM stdin;
2	en_US	biography	0	0		string
2	en_US	signature	0	0		string
2	en_US	affiliation	0	0	Universidad Nacional Autónoma de México	string
2		orcid	0	0		string
4	en_US	biography	0	0		string
4	en_US	signature	0	0		string
4	en_US	affiliation	0	0	University of Chicago	string
4		orcid	0	0		string
5	en_US	biography	0	0		string
5	en_US	signature	0	0		string
5	en_US	affiliation	0	0	University of Toronto	string
5		orcid	0	0		string
11	en_US	biography	0	0		string
11	en_US	signature	0	0		string
11	en_US	affiliation	0	0	Ghent University	string
11		orcid	0	0		string
12	en_US	biography	0	0		string
12	en_US	signature	0	0		string
12	en_US	affiliation	0	0	Universidad de Chile	string
12		orcid	0	0		string
13	en_US	biography	0	0		string
13	en_US	signature	0	0		string
13	en_US	affiliation	0	0	Duke University	string
13		orcid	0	0		string
14	en_US	biography	0	0		string
14	en_US	signature	0	0		string
14	en_US	affiliation	0	0	University of Cape Town	string
14		orcid	0	0		string
15	en_US	biography	0	0		string
15	en_US	signature	0	0		string
15	en_US	affiliation	0	0	Imperial College London	string
15		orcid	0	0		string
16	en_US	biography	0	0		string
16	en_US	signature	0	0		string
16	en_US	affiliation	0	0	National University of Singapore	string
16		orcid	0	0		string
17	en_US	affiliation	0	0	University of Bologna	string
21	en_US	affiliation	0	0	University of Toronto	string
9	en_US	biography	0	0		string
9	en_US	signature	0	0		string
9	en_US	affiliation	0	0	University of Manitoba	string
6	en_US	biography	0	0		string
6	en_US	signature	0	0		string
6	en_US	affiliation	0	0	Kyoto University	string
6		orcid	0	0		string
9		orcid	0	0		string
22	en_US	affiliation	0	0	University College Cork	string
10	en_US	biography	0	0		string
18	en_US	affiliation	0	0	University of Windsor	string
30	en_US	affiliation	0	0	University of Wolverhampton	string
31	en_US	affiliation	0	0	University of Nairobi	string
8	en_US	biography	0	0		string
19	en_US	affiliation	0	0	University of Alberta	string
20	en_US	affiliation	0	0	Alexandria University	string
25	en_US	affiliation	0	0	University of Cape Town	string
8	en_US	signature	0	0		string
8	en_US	affiliation	0	0	McGill University	string
8		orcid	0	0		string
23	en_US	affiliation	0	0	Indiana University	string
34	en_US	affiliation	0	0	University of Windsor	string
24	en_US	affiliation	0	0	University of Rome	string
27	en_US	affiliation	0	0	Stanford University	string
10	en_US	signature	0	0		string
26	en_US	affiliation	0	0	Aalborg University	string
10	en_US	affiliation	0	0	State University of New York	string
10		orcid	0	0		string
28	en_US	affiliation	0	0	Australian National University	string
29	en_US	affiliation	0	0	University of Cape Town	string
32	en_US	affiliation	0	0	Barcelona University	string
35	en_US	affiliation	0	0	CUNY	string
7	en_US	biography	0	0		string
7	en_US	signature	0	0		string
7	en_US	affiliation	0	0	Utrecht University	string
7		orcid	0	0		string
33	en_US	affiliation	0	0	University of Tehran	string
3	en_US	biography	0	0		string
3	en_US	signature	0	0		string
3	en_US	affiliation	0	0	University of Melbourne	string
3		orcid	0	0		string
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY user_user_groups (user_group_id, user_id) FROM stdin;
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
14	17
17	17
14	18
17	18
14	19
17	19
14	20
17	20
14	21
17	21
14	22
17	22
14	23
17	23
14	24
17	24
14	25
17	25
14	26
17	26
14	27
17	27
14	28
17	28
14	29
17	29
14	30
17	30
14	31
17	31
14	32
17	32
14	33
17	33
14	34
17	34
14	35
17	35
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY users (user_id, username, password, salutation, first_name, middle_name, last_name, suffix, gender, initials, email, url, phone, mailing_address, billing_address, country, locales, date_last_email, date_registered, date_validated, date_last_login, must_change_password, auth_id, auth_str, disabled, disabled_reason, inline_help) FROM stdin;
1	admin	$2y$10$e3nt9DJfzhjhWcIvFLWhNOp8OuYYoDjFpvA6VVMK9uigg1N3ckGs.	\N	admin	\N		\N	\N	a	pkpadmin@mailinator.com	\N	\N	\N	\N	\N		\N	2017-10-24 17:39:16	\N	2017-10-24 17:39:24	0	\N	\N	0	\N	1
2	rvaca	$2y$10$8PFz1SsXvINURQvziCHA9.hn0C5ZMBt/waR/0rCdClkmgEWS1Lxxm		Ramiro		Vaca			RV	rvaca@mailinator.com				\N	MX		\N	2017-10-24 17:40:12	\N	2017-10-24 17:40:12	0	\N	\N	0	\N	1
4	dbuskins	$2y$10$CwWIZlQk/3IKN2CKv5gi1eV7B1/U11CpnZ47hK4j.risPtMgp9VEa		David		Buskins			DB	dbuskins@mailinator.com				\N	US		\N	2017-10-24 17:40:29	\N	2017-10-24 17:40:29	0	\N	\N	0	\N	1
5	sberardo	$2y$10$1H0jLjFd499hg.8CXLFepeY3ysaEOPTq4QOBNnSBzYwoGUDdy.6UW		Stephanie		Berardo			SB	sberardo@mailinator.com				\N	CA		\N	2017-10-24 17:40:38	\N	2017-10-24 17:40:38	0	\N	\N	0	\N	1
11	mfritz	$2y$10$VbCAZH/jamBOPyqvFMaWP.SH5v9OFyzXdymgJG3qiELvfDX/jc9qu		Maria		Fritz			MF	mfritz@mailinator.com				\N	BE		\N	2017-10-24 17:41:39	\N	2017-10-24 17:41:39	0	\N	\N	0	\N	1
12	svogt	$2y$10$33w8K.cHcx5.67e5ocSbtOTW3aL6VhrQbBLRBzWji4TfBpL6TNejK		Sarah		Vogt			SV	svogt@mailinator.com				\N	CL		\N	2017-10-24 17:41:47	\N	2017-10-24 17:41:47	0	\N	\N	0	\N	1
13	gcox	$2y$10$B7nOaz.OUJLmq98/gP37r.c/990kHvWBD7h/9dqCuqjVKsKbh4Ox.		Graham		Cox			GC	gcox@mailinator.com				\N	US		\N	2017-10-24 17:41:54	\N	2017-10-24 17:41:54	0	\N	\N	0	\N	1
14	shellier	$2y$10$IRt48Hi//CvLVFYhPbkNFuhEFJpNhM4grGRamH0qcg.D1HjYnDXZ.		Stephen		Hellier			SH	shellier@mailinator.com				\N	ZA		\N	2017-10-24 17:42:02	\N	2017-10-24 17:42:02	0	\N	\N	0	\N	1
15	cturner	$2y$10$EUC5aXGCGzZP9rWAGYygCO9k1ZZr904YHbXiNNnO2y8RgedyD1Yfm		Catherine		Turner			CT	cturner@mailinator.com				\N	GB		\N	2017-10-24 17:42:12	\N	2017-10-24 17:42:12	0	\N	\N	0	\N	1
16	skumar	$2y$10$WSnESwGlmmO7OtFUfw.lbuVI9n9LbrHvEDYlPjU/48nrHCWEmQlwq		Sabine		Kumar			SK	skumar@mailinator.com				\N	SG		\N	2017-10-24 17:42:23	\N	2017-10-24 17:42:23	0	\N	\N	0	\N	1
17	ccorino	$2y$10$PdBFag4HwSXUBBcqrYT5OOFSRRIL27blZILVf6qwIf8z.kRZ39UmG	\N	Carlo		Corino	\N	\N	CC	ccorino@mailinator.com	\N	\N	\N	\N	IT		\N	2017-10-24 17:43:11	\N	2017-10-24 17:43:11	0	\N	\N	0	\N	1
24	fpaglieri	$2y$10$uLqOH1Pb8ft8x8C6o7Ye1uQomatty2Wi.DQhi/CSco5KJ3P8kdqt6	\N	Fabio		Paglieri	\N	\N	FP	fpaglieri@mailinator.com	\N	\N	\N	\N	IT		\N	2017-10-24 17:52:08	\N	2017-10-24 17:52:08	0	\N	\N	0	\N	1
6	minoue	$2y$10$0tgidk1B/WHwKHzraKWfhOYz81S60P/2TjrLsf.bw2tFDYc.ET4kG		Minoti		Inoue			MI	minoue@mailinator.com				\N	JP		\N	2017-10-24 17:40:54	\N	2017-10-24 17:44:19	0	\N	\N	0	\N	1
18	ckwantes	$2y$10$A54kfdJC8RSSADZHxw/qPe5GcrM40dO1S79vzSJwSpwE1CXOXGA6K	\N	Catherine		Kwantes	\N	\N	CK	ckwantes@mailinator.com	\N	\N	\N	\N	CA		\N	2017-10-24 17:44:48	\N	2017-10-24 17:44:48	0	\N	\N	0	\N	1
29	lkumiega	$2y$10$d4CkZJrsXMQN55Mu6P/A4ewPp4DYyJ.2S0LP.yph9F24TQFFZoI12	\N	Lise		Kumiega	\N	\N	LK	lkumiega@mailinator.com	\N	\N	\N	\N	ZA		\N	2017-10-24 18:00:06	\N	2017-10-24 18:00:07	0	\N	\N	0	\N	1
19	cmontgomerie	$2y$10$RZNb6bVUjLOsmxhnP0tZJePfMmRiei6rhGterrprrJVMBD3gPNf1q	\N	Craig		Montgomerie	\N	\N	CM	cmontgomerie@mailinator.com	\N	\N	\N	\N	CA		\N	2017-10-24 17:46:19	\N	2017-10-24 17:46:19	0	\N	\N	0	\N	1
20	ddiouf	$2y$10$knGWt2rw7PczXUvEDsCcMekdjU4wvnmctjfWMUwaBWT.4xAZXZqPu	\N	Diaga		Diouf	\N	\N	DD	ddiouf@mailinator.com	\N	\N	\N	\N	EG		\N	2017-10-24 17:46:54	\N	2017-10-24 17:46:55	0	\N	\N	0	\N	1
21	dphillips	$2y$10$7kHJ4Ap915wWgYkCrMCxaukWXMsi9utP2MBjMTxEGXyV1gnWrQrM.	\N	Dana		Phillips	\N	\N	DP	dphillips@mailinator.com	\N	\N	\N	\N	CA		\N	2017-10-24 17:48:37	\N	2017-10-24 17:48:37	0	\N	\N	0	\N	1
25	jmwandenga	$2y$10$a0cdDc7YpFRwafpdZ7rs..LtBzgh.17iAWXBBgkBKP/wUs9uPnEe2	\N	John		Mwandenga	\N	\N	JM	jmwandenga@mailinator.com	\N	\N	\N	\N	ZA		\N	2017-10-24 17:54:09	\N	2017-10-24 17:54:09	0	\N	\N	0	\N	1
22	dsokoloff	$2y$10$f2u4k8paSu699cx.YoMnKeRqlDD/KfX13/jnaHc9zXbcleR1QeIYm	\N	Domatilia		Sokoloff	\N	\N	DS	dsokoloff@mailinator.com	\N	\N	\N	\N	IE		\N	2017-10-24 17:50:04	\N	2017-10-24 17:50:05	0	\N	\N	0	\N	1
32	rrossi	$2y$10$1ULmKxFhLH95qpfMchAd3.17gxA.9uinaBJLUa.0zBP0tT/e1DBX2	\N	Rosanna		Rossi	\N	\N	RR	rrossi@mailinator.com	\N	\N	\N	\N	ES		\N	2017-10-24 18:06:18	\N	2017-10-24 18:06:18	0	\N	\N	0	\N	1
8	phudson	$2y$10$D/co1m6UDsANbtRmTahNxe3okiyKD9qcOiz7IAxgIEOW4VZ5Lr9qG		Paul		Hudson			PH	phudson@mailinator.com				\N	CA		\N	2017-10-24 17:41:14	\N	2017-10-24 17:51:09	0	\N	\N	0	\N	1
23	eostrom	$2y$10$TF.9DmOHHdVUCdYijn4M5Ou06j8bHQ4Sk/wthStv05OTs1JlUiCHi	\N	Elinor		Ostrom	\N	\N	EO	eostrom@mailinator.com	\N	\N	\N	\N	US		\N	2017-10-24 17:51:30	\N	2017-10-24 17:51:30	0	\N	\N	0	\N	1
7	jjanssen	$2y$10$KUcJwJ4wywg71dPVIHpAFOaHnrbGBAmf02Nwn5NfSXhhxeAfuv4eO		Julie		Janssen			JJ	jjanssen@mailinator.com				\N	NL		\N	2017-10-24 17:41:05	\N	2017-10-24 18:01:51	0	\N	\N	0	\N	1
26	jnovak	$2y$10$wTRR1XeqUTzQNDzGosFaeOUD0crDcqxjrOWfZs48qWYGAheyOSqfW	\N	John		Novak	\N	\N	JN	jnovak@mailinator.com	\N	\N	\N	\N	DK		\N	2017-10-24 17:56:05	\N	2017-10-24 17:56:05	0	\N	\N	0	\N	1
9	amccrae	$2y$10$mDuNaISBOPr7NEur.u2ytOivXOC3RT2RJiwHqWTWCvBCoRKaxXYKq		Aisla		McCrae			AM	amccrae@mailinator.com				\N	CA		\N	2017-10-24 17:41:23	\N	2017-10-24 18:02:21	0	\N	\N	0	\N	1
10	agallego	$2y$10$pcFm5jc..hVZdanQgWEn3ecGASmJmn9BrsiBi.J4nllQkvGSLgnpC		Adela		Gallego			AG	agallego@mailinator.com				\N	US		\N	2017-10-24 17:41:30	\N	2017-10-24 18:02:51	0	\N	\N	0	\N	1
35	zwoods	$2y$10$9SnQbHLE9oYltXWIw9t60.Bq5ogOnN2lcfxT7zkSABk5USwHRoWfm	\N	Zita		Woods	\N	\N	ZW	zwoods@mailinator.com	\N	\N	\N	\N	US		\N	2017-10-24 18:10:03	\N	2017-10-24 18:10:03	0	\N	\N	0	\N	1
27	kalkhafaji	$2y$10$3TTMGtImjiDrW5IXJHNE2OYN81lTtVs.9GogQXnshPpufh564Nkl6	\N	Karim		Al-Khafaji	\N	\N	KA	kalkhafaji@mailinator.com	\N	\N	\N	\N	US		\N	2017-10-24 17:58:01	\N	2017-10-24 17:58:01	0	\N	\N	0	\N	1
28	lchristopher	$2y$10$JQ9gVx.POGU6yIYqRa3oj.pUCA2JzNkasSPxL1aRX2zVtA3PL1ptC	\N	Leo		Christopher	\N	\N	LC	lchristopher@mailinator.com	\N	\N	\N	\N	AU		\N	2017-10-24 17:58:40	\N	2017-10-24 17:58:40	0	\N	\N	0	\N	1
33	vkarbasizaed	$2y$10$8Lz3mVb8Kic4V1ML.hRxbORzrJO4/mHxyMcUS02NkC1DJQtrcwALS	\N	Vajiheh		Karbasizaed	\N	\N	VK	vkarbasizaed@mailinator.com	\N	\N	\N	\N	IR		\N	2017-10-24 18:06:54	\N	2017-10-24 18:06:55	0	\N	\N	0	\N	1
3	dbarnes	$2y$10$0jrAv.sFGOfoCRvrP0nTSeYwLzyaOY3z94gBK.YMuSwZO.X9D2OGS		Daniel		Barnes			DB	dbarnes@mailinator.com				\N	AU		\N	2017-10-24 17:40:20	\N	2017-10-24 18:10:34	0	\N	\N	0	\N	1
30	pdaniel	$2y$10$fka.MWbattPLw.TovtNVw.mM9KWuLlzmKkV1mYiX2Eoz5tdJPYdEq	\N	Patricia		Daniel	\N	\N	PD	pdaniel@mailinator.com	\N	\N	\N	\N	GB		\N	2017-10-24 18:04:04	\N	2017-10-24 18:04:04	0	\N	\N	0	\N	1
31	rbaiyewu	$2y$10$QN8icZslTPhpiEpY8gZXWutcMRqcYLKvc27a9xJh74Ix67RNGz0l6	\N	Rana		Baiyewu	\N	\N	RB	rbaiyewu@mailinator.com	\N	\N	\N	\N	KE		\N	2017-10-24 18:04:36	\N	2017-10-24 18:04:36	0	\N	\N	0	\N	1
34	vwilliamson	$2y$10$NXKBk/lyI/qTbPfy2/ikRuOIbAiRvPBfsJs6PvHaXY92ZRvP1iHWa	\N	Valerie		Williamson	\N	\N	VW	vwilliamson@mailinator.com	\N	\N	\N	\N	CA		\N	2017-10-24 18:09:02	\N	2017-10-24 18:09:03	0	\N	\N	0	\N	1
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ojs-ci
--

SELECT pg_catalog.setval('users_user_id_seq', 35, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: ojs-ci
--

COPY versions (major, minor, revision, build, date_installed, current, product_type, product, product_class_name, lazy_load, sitewide) FROM stdin;
1	0	0	0	2017-10-24 17:39:16	1	plugins.metadata	nlm30		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.metadata	openurl10		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.metadata	mods34		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.metadata	dc11		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.auth	ldap		0	0
1	1	0	0	2017-10-24 17:39:16	1	plugins.blocks	subscription	SubscriptionBlockPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.blocks	makeSubmission	MakeSubmissionBlockPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.blocks	information	InformationBlockPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.blocks	developedBy	DevelopedByBlockPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.blocks	languageToggle	LanguageToggleBlockPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationLookup	crossref		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationLookup	isbndb		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationLookup	pubmed		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationLookup	worldcat		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationParser	parscit		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationParser	freecite		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationParser	regex		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.citationParser	paracite		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.gateways	resolver		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	hypothesis	HypothesisPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	addThis	AddThisPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	recommendByAuthor	RecommendByAuthorPlugin	1	1
1	0	2	0	2017-10-24 17:39:16	1	plugins.generic	markup	MarkupPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	usageStats		0	1
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	lensGalley	LensGalleyPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	backup	BackupPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	browse	BrowsePlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	piwik	PiwikPlugin	1	0
1	2	0	0	2017-10-24 17:39:16	1	plugins.generic	staticPages	StaticPagesPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	googleAnalytics	GoogleAnalyticsPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	fidusWriter	FidusWriterPlugin	1	0
1	2	0	0	2017-10-24 17:39:16	1	plugins.generic	openAIRE	OpenAIREPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	driver	DRIVERPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	exampleGenericPlugin	ExampleGenericPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	tinymce	TinyMCEPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	pdfJsViewer	PdfJsViewerPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	dublinCoreMeta	DublinCoreMetaPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	usageEvent		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	orcidProfile	OrcidProfilePlugin	1	0
1	2	0	0	2017-10-24 17:39:16	1	plugins.generic	customBlockManager	CustomBlockManagerPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	externalFeed	ExternalFeedPlugin	1	0
2	0	0	0	2017-10-24 17:39:16	1	plugins.generic	translator	TranslatorPlugin	1	1
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	webFeed	WebFeedPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	htmlArticleGalley	HtmlArticleGalleyPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	googleScholar	GoogleScholarPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	announcementFeed	AnnouncementFeedPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	phpMyVisites	PhpMyVisitesPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	coins	CoinsPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.generic	recommendBySimilarity	RecommendBySimilarityPlugin	1	1
1	2	0	0	2017-10-24 17:39:16	1	plugins.generic	acron	AcronPlugin	1	1
1	0	0	0	2017-10-24 17:39:16	1	plugins.importexport	native		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.importexport	users		0	0
1	1	0	0	2017-10-24 17:39:16	1	plugins.importexport	doaj		0	0
2	1	0	0	2017-10-24 17:39:16	1	plugins.importexport	crossref		0	0
2	0	0	0	2017-10-24 17:39:16	1	plugins.importexport	datacite		0	0
1	0	1	0	2017-10-24 17:39:16	1	plugins.importexport	quickSubmit		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.importexport	pubmed		0	0
2	0	0	0	2017-10-24 17:39:16	1	plugins.importexport	medra		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.oaiMetadataFormats	dc		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.oaiMetadataFormats	jats		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.oaiMetadataFormats	rfc1807		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.oaiMetadataFormats	marc		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.oaiMetadataFormats	marcxml		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.paymethod	paypal		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.paymethod	manual		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.pubIds	urn	URNPubIdPlugin	1	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.pubIds	doi	DOIPubIdPlugin	1	0
2	0	0	0	2017-10-24 17:39:16	1	plugins.reports	reviewReport		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.reports	articles		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.reports	views		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.reports	subscriptions		0	0
1	1	0	0	2017-10-24 17:39:16	1	plugins.reports	counterReport		0	0
1	0	0	0	2017-10-24 17:39:16	1	plugins.themes	default	DefaultThemePlugin	1	0
3	1	0	0	2017-10-24 17:39:14	1	core	ojs2		0	1
\.


--
-- Name: access_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY access_keys
    ADD CONSTRAINT access_keys_pkey PRIMARY KEY (access_key_id);


--
-- Name: announcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY announcement_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (type_id);


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcement_id);


--
-- Name: auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (auth_id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citation_id);


--
-- Name: completed_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY completed_payments
    ADD CONSTRAINT completed_payments_pkey PRIMARY KEY (completed_payment_id);


--
-- Name: controlled_vocab_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY controlled_vocab_entries
    ADD CONSTRAINT controlled_vocab_entries_pkey PRIMARY KEY (controlled_vocab_entry_id);


--
-- Name: controlled_vocabs_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY controlled_vocabs
    ADD CONSTRAINT controlled_vocabs_pkey PRIMARY KEY (controlled_vocab_id);


--
-- Name: data_object_tombstone_oai_set_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY data_object_tombstone_oai_set_objects
    ADD CONSTRAINT data_object_tombstone_oai_set_objects_pkey PRIMARY KEY (object_id);


--
-- Name: data_object_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY data_object_tombstones
    ADD CONSTRAINT data_object_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: edit_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY edit_decisions
    ADD CONSTRAINT edit_decisions_pkey PRIMARY KEY (edit_decision_id);


--
-- Name: email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY email_log
    ADD CONSTRAINT email_log_pkey PRIMARY KEY (log_id);


--
-- Name: email_templates_default_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY email_templates_default
    ADD CONSTRAINT email_templates_default_pkey PRIMARY KEY (email_id);


--
-- Name: email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (email_id);


--
-- Name: event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (log_id);


--
-- Name: external_feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY external_feeds
    ADD CONSTRAINT external_feeds_pkey PRIMARY KEY (feed_id);


--
-- Name: filter_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY filter_groups
    ADD CONSTRAINT filter_groups_pkey PRIMARY KEY (filter_group_id);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: institutional_subscription_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY institutional_subscription_ip
    ADD CONSTRAINT institutional_subscription_ip_pkey PRIMARY KEY (institutional_subscription_ip_id);


--
-- Name: institutional_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY institutional_subscriptions
    ADD CONSTRAINT institutional_subscriptions_pkey PRIMARY KEY (institutional_subscription_id);


--
-- Name: issue_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY issue_files
    ADD CONSTRAINT issue_files_pkey PRIMARY KEY (file_id);


--
-- Name: issue_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY issue_galleys
    ADD CONSTRAINT issue_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (issue_id);


--
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (journal_id);


--
-- Name: library_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY library_files
    ADD CONSTRAINT library_files_pkey PRIMARY KEY (file_id);


--
-- Name: markup_jobinfos_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY markup_jobinfos
    ADD CONSTRAINT markup_jobinfos_pkey PRIMARY KEY (id);


--
-- Name: metadata_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY metadata_descriptions
    ADD CONSTRAINT metadata_descriptions_pkey PRIMARY KEY (metadata_description_id);


--
-- Name: navigation_menu_item_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY navigation_menu_item_assignments
    ADD CONSTRAINT navigation_menu_item_assignments_pkey PRIMARY KEY (navigation_menu_item_assignment_id);


--
-- Name: navigation_menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY navigation_menu_items
    ADD CONSTRAINT navigation_menu_items_pkey PRIMARY KEY (navigation_menu_item_id);


--
-- Name: navigation_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY navigation_menus
    ADD CONSTRAINT navigation_menus_pkey PRIMARY KEY (navigation_menu_id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: notification_mail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY notification_mail_list
    ADD CONSTRAINT notification_mail_list_pkey PRIMARY KEY (notification_mail_list_id);


--
-- Name: notification_subscription_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY notification_subscription_settings
    ADD CONSTRAINT notification_subscription_settings_pkey PRIMARY KEY (setting_id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: published_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY published_submissions
    ADD CONSTRAINT published_submissions_pkey PRIMARY KEY (published_submission_id);


--
-- Name: queries_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (query_id);


--
-- Name: queued_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY queued_payments
    ADD CONSTRAINT queued_payments_pkey PRIMARY KEY (queued_payment_id);


--
-- Name: review_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY review_assignments
    ADD CONSTRAINT review_assignments_pkey PRIMARY KEY (review_id);


--
-- Name: review_form_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY review_form_elements
    ADD CONSTRAINT review_form_elements_pkey PRIMARY KEY (review_form_element_id);


--
-- Name: review_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY review_forms
    ADD CONSTRAINT review_forms_pkey PRIMARY KEY (review_form_id);


--
-- Name: review_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY review_rounds
    ADD CONSTRAINT review_rounds_pkey PRIMARY KEY (review_round_id);


--
-- Name: rt_contexts_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY rt_contexts
    ADD CONSTRAINT rt_contexts_pkey PRIMARY KEY (context_id);


--
-- Name: rt_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY rt_searches
    ADD CONSTRAINT rt_searches_pkey PRIMARY KEY (search_id);


--
-- Name: rt_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY rt_versions
    ADD CONSTRAINT rt_versions_pkey PRIMARY KEY (version_id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: stage_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY stage_assignments
    ADD CONSTRAINT stage_assignments_pkey PRIMARY KEY (stage_assignment_id);


--
-- Name: static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (static_page_id);


--
-- Name: submission_artwork_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_artwork_files
    ADD CONSTRAINT submission_artwork_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_galleys_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_galleys
    ADD CONSTRAINT submission_galleys_pkey PRIMARY KEY (galley_id);


--
-- Name: submission_search_keyword_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_search_keyword_list
    ADD CONSTRAINT submission_search_keyword_list_pkey PRIMARY KEY (keyword_id);


--
-- Name: submission_search_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_search_objects
    ADD CONSTRAINT submission_search_objects_pkey PRIMARY KEY (object_id);


--
-- Name: submission_supplementary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_supplementary_files
    ADD CONSTRAINT submission_supplementary_files_pkey PRIMARY KEY (file_id, revision);


--
-- Name: submission_tombstones_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submission_tombstones
    ADD CONSTRAINT submission_tombstones_pkey PRIMARY KEY (tombstone_id);


--
-- Name: submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (submission_id);


--
-- Name: subscription_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY subscription_types
    ADD CONSTRAINT subscription_types_pkey PRIMARY KEY (type_id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- Name: temporary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY temporary_files
    ADD CONSTRAINT temporary_files_pkey PRIMARY KEY (file_id);


--
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_group_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ojs-ci; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: access_keys_hash; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX access_keys_hash ON access_keys USING btree (key_hash, user_id, context);


--
-- Name: announcement_settings_announcement_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX announcement_settings_announcement_id ON announcement_settings USING btree (announcement_id);


--
-- Name: announcement_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX announcement_settings_pkey ON announcement_settings USING btree (announcement_id, locale, setting_name);


--
-- Name: announcement_type_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX announcement_type_settings_pkey ON announcement_type_settings USING btree (type_id, locale, setting_name);


--
-- Name: announcement_type_settings_type_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX announcement_type_settings_type_id ON announcement_type_settings USING btree (type_id);


--
-- Name: announcement_types_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX announcement_types_assoc ON announcement_types USING btree (assoc_type, assoc_id);


--
-- Name: announcements_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX announcements_assoc ON announcements USING btree (assoc_type, assoc_id);


--
-- Name: assignment_settings_navigation_menu_item_assignment_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX assignment_settings_navigation_menu_item_assignment_id ON navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id);


--
-- Name: author_settings_author_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX author_settings_author_id ON author_settings USING btree (author_id);


--
-- Name: author_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX author_settings_pkey ON author_settings USING btree (author_id, locale, setting_name);


--
-- Name: authors_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX authors_submission_id ON authors USING btree (submission_id);


--
-- Name: c_v_e_s_entry_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX c_v_e_s_entry_id ON controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id);


--
-- Name: c_v_e_s_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX c_v_e_s_pkey ON controlled_vocab_entry_settings USING btree (controlled_vocab_entry_id, locale, setting_name);


--
-- Name: citation_settings_citation_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX citation_settings_citation_id ON citation_settings USING btree (citation_id);


--
-- Name: citation_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX citation_settings_pkey ON citation_settings USING btree (citation_id, locale, setting_name);


--
-- Name: citations_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX citations_assoc ON citations USING btree (assoc_type, assoc_id);


--
-- Name: citations_assoc_seq; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX citations_assoc_seq ON citations USING btree (assoc_type, assoc_id, seq);


--
-- Name: controlled_vocab_entries_cv_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX controlled_vocab_entries_cv_id ON controlled_vocab_entries USING btree (controlled_vocab_id, seq);


--
-- Name: controlled_vocab_symbolic; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX controlled_vocab_symbolic ON controlled_vocabs USING btree (symbolic, assoc_type, assoc_id);


--
-- Name: custom_issue_orders_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX custom_issue_orders_pkey ON custom_issue_orders USING btree (issue_id);


--
-- Name: custom_section_orders_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX custom_section_orders_pkey ON custom_section_orders USING btree (issue_id, section_id);


--
-- Name: data_object_tombstone_oai_set_objects_tombstone_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX data_object_tombstone_oai_set_objects_tombstone_id ON data_object_tombstone_oai_set_objects USING btree (tombstone_id);


--
-- Name: data_object_tombstone_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX data_object_tombstone_settings_pkey ON data_object_tombstone_settings USING btree (tombstone_id, locale, setting_name);


--
-- Name: data_object_tombstone_settings_tombstone_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX data_object_tombstone_settings_tombstone_id ON data_object_tombstone_settings USING btree (tombstone_id);


--
-- Name: data_object_tombstones_data_object_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX data_object_tombstones_data_object_id ON data_object_tombstones USING btree (data_object_id);


--
-- Name: edit_decisions_editor_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX edit_decisions_editor_id ON edit_decisions USING btree (editor_id);


--
-- Name: edit_decisions_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX edit_decisions_submission_id ON edit_decisions USING btree (submission_id);


--
-- Name: email_log_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX email_log_assoc ON email_log USING btree (assoc_type, assoc_id);


--
-- Name: email_log_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX email_log_user_id ON email_log_users USING btree (email_log_id, user_id);


--
-- Name: email_templates_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX email_templates_assoc ON email_templates USING btree (assoc_type, assoc_id);


--
-- Name: email_templates_data_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX email_templates_data_pkey ON email_templates_data USING btree (email_key, locale, assoc_type, assoc_id);


--
-- Name: email_templates_default_data_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX email_templates_default_data_pkey ON email_templates_default_data USING btree (email_key, locale);


--
-- Name: email_templates_default_email_key; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX email_templates_default_email_key ON email_templates_default USING btree (email_key);


--
-- Name: email_templates_email_key; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX email_templates_email_key ON email_templates USING btree (email_key, assoc_type, assoc_id);


--
-- Name: event_log_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX event_log_assoc ON event_log USING btree (assoc_type, assoc_id);


--
-- Name: event_log_settings_log_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX event_log_settings_log_id ON event_log_settings USING btree (log_id);


--
-- Name: event_log_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX event_log_settings_pkey ON event_log_settings USING btree (log_id, setting_name);


--
-- Name: external_feed_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX external_feed_settings_pkey ON external_feed_settings USING btree (feed_id, locale, setting_name);


--
-- Name: external_feeds_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX external_feeds_journal_id ON external_feeds USING btree (journal_id);


--
-- Name: filter_groups_symbolic; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX filter_groups_symbolic ON filter_groups USING btree (symbolic);


--
-- Name: filter_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX filter_settings_id ON filter_settings USING btree (filter_id);


--
-- Name: filter_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX filter_settings_pkey ON filter_settings USING btree (filter_id, locale, setting_name);


--
-- Name: genre_settings_genre_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX genre_settings_genre_id ON genre_settings USING btree (genre_id);


--
-- Name: genre_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX genre_settings_pkey ON genre_settings USING btree (genre_id, locale, setting_name);


--
-- Name: institutional_subscription_ip_end; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX institutional_subscription_ip_end ON institutional_subscription_ip USING btree (ip_end);


--
-- Name: institutional_subscription_ip_start; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX institutional_subscription_ip_start ON institutional_subscription_ip USING btree (ip_start);


--
-- Name: institutional_subscription_ip_subscription_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX institutional_subscription_ip_subscription_id ON institutional_subscription_ip USING btree (subscription_id);


--
-- Name: institutional_subscriptions_domain; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX institutional_subscriptions_domain ON institutional_subscriptions USING btree (domain);


--
-- Name: institutional_subscriptions_subscription_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX institutional_subscriptions_subscription_id ON institutional_subscriptions USING btree (subscription_id);


--
-- Name: issue_files_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX issue_files_issue_id ON issue_files USING btree (issue_id);


--
-- Name: issue_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX issue_galley_settings_galley_id ON issue_galley_settings USING btree (galley_id);


--
-- Name: issue_galley_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX issue_galley_settings_pkey ON issue_galley_settings USING btree (galley_id, locale, setting_name);


--
-- Name: issue_galleys_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX issue_galleys_issue_id ON issue_galleys USING btree (issue_id);


--
-- Name: issue_settings_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX issue_settings_issue_id ON issue_settings USING btree (issue_id);


--
-- Name: issue_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX issue_settings_name_value ON issue_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying])::text[]));


--
-- Name: issue_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX issue_settings_pkey ON issue_settings USING btree (issue_id, locale, setting_name);


--
-- Name: issues_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX issues_journal_id ON issues USING btree (journal_id);


--
-- Name: item_views_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX item_views_pkey ON item_views USING btree (assoc_type, assoc_id, user_id);


--
-- Name: journal_settings_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX journal_settings_journal_id ON journal_settings USING btree (journal_id);


--
-- Name: journal_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX journal_settings_pkey ON journal_settings USING btree (journal_id, locale, setting_name);


--
-- Name: journals_path; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX journals_path ON journals USING btree (path);


--
-- Name: library_file_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX library_file_settings_id ON library_file_settings USING btree (file_id);


--
-- Name: library_file_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX library_file_settings_pkey ON library_file_settings USING btree (file_id, locale, setting_name);


--
-- Name: library_files_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX library_files_submission_id ON library_files USING btree (submission_id);


--
-- Name: markup_jobinfos_file_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX markup_jobinfos_file_id ON markup_jobinfos USING btree (file_id);


--
-- Name: markup_jobinfos_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX markup_jobinfos_id ON markup_jobinfos USING btree (id);


--
-- Name: metadata_description_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX metadata_description_settings_id ON metadata_description_settings USING btree (metadata_description_id);


--
-- Name: metadata_descriptions_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX metadata_descriptions_assoc ON metadata_descriptions USING btree (assoc_type, assoc_id);


--
-- Name: metadata_descripton_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX metadata_descripton_settings_pkey ON metadata_description_settings USING btree (metadata_description_id, locale, setting_name);


--
-- Name: metrics_load_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX metrics_load_id ON metrics USING btree (load_id);


--
-- Name: metrics_metric_type_context_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX metrics_metric_type_context_id ON metrics USING btree (metric_type, context_id);


--
-- Name: metrics_metric_type_submission_id_assoc_type; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX metrics_metric_type_submission_id_assoc_type ON metrics USING btree (metric_type, submission_id, assoc_type);


--
-- Name: navigation_menu_item_assignment_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX navigation_menu_item_assignment_settings_pkey ON navigation_menu_item_assignment_settings USING btree (navigation_menu_item_assignment_id, locale, setting_name);


--
-- Name: navigation_menu_item_settings_navigation_menu_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX navigation_menu_item_settings_navigation_menu_id ON navigation_menu_item_settings USING btree (navigation_menu_item_id);


--
-- Name: navigation_menu_item_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX navigation_menu_item_settings_pkey ON navigation_menu_item_settings USING btree (navigation_menu_item_id, locale, setting_name);


--
-- Name: notes_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX notes_assoc ON notes USING btree (assoc_type, assoc_id);


--
-- Name: notification_mail_list_email_context; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX notification_mail_list_email_context ON notification_mail_list USING btree (email, context);


--
-- Name: notification_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX notification_settings_pkey ON notification_settings USING btree (notification_id, locale, setting_name);


--
-- Name: notifications_assoc; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX notifications_assoc ON notifications USING btree (assoc_type, assoc_id);


--
-- Name: notifications_context_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX notifications_context_id ON notifications USING btree (context_id, level);


--
-- Name: notifications_context_id_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX notifications_context_id_user_id ON notifications USING btree (context_id, user_id, level);


--
-- Name: oai_resumption_tokens_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX oai_resumption_tokens_pkey ON oai_resumption_tokens USING btree (token);


--
-- Name: plugin_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX plugin_settings_pkey ON plugin_settings USING btree (plugin_name, context_id, setting_name);


--
-- Name: plugin_settings_plugin_name; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX plugin_settings_plugin_name ON plugin_settings USING btree (plugin_name);


--
-- Name: published_submissions_issue_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX published_submissions_issue_id ON published_submissions USING btree (issue_id);


--
-- Name: published_submissions_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX published_submissions_submission_id ON published_submissions USING btree (submission_id);


--
-- Name: queries_assoc_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX queries_assoc_id ON queries USING btree (assoc_type, assoc_id);


--
-- Name: query_participants_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX query_participants_pkey ON query_participants USING btree (query_id, user_id);


--
-- Name: review_assignments_form_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_assignments_form_id ON review_assignments USING btree (review_form_id);


--
-- Name: review_assignments_reviewer_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_assignments_reviewer_id ON review_assignments USING btree (reviewer_id);


--
-- Name: review_assignments_reviewer_review; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_assignments_reviewer_review ON review_assignments USING btree (reviewer_id, review_id);


--
-- Name: review_assignments_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_assignments_submission_id ON review_assignments USING btree (submission_id);


--
-- Name: review_files_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX review_files_pkey ON review_files USING btree (review_id, file_id);


--
-- Name: review_files_review_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_files_review_id ON review_files USING btree (review_id);


--
-- Name: review_form_element_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX review_form_element_settings_pkey ON review_form_element_settings USING btree (review_form_element_id, locale, setting_name);


--
-- Name: review_form_element_settings_review_form_element_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_form_element_settings_review_form_element_id ON review_form_element_settings USING btree (review_form_element_id);


--
-- Name: review_form_elements_review_form_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_form_elements_review_form_id ON review_form_elements USING btree (review_form_id);


--
-- Name: review_form_responses_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_form_responses_pkey ON review_form_responses USING btree (review_form_element_id, review_id);


--
-- Name: review_form_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX review_form_settings_pkey ON review_form_settings USING btree (review_form_id, locale, setting_name);


--
-- Name: review_form_settings_review_form_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_form_settings_review_form_id ON review_form_settings USING btree (review_form_id);


--
-- Name: review_round_files_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX review_round_files_pkey ON review_round_files USING btree (submission_id, review_round_id, file_id, revision);


--
-- Name: review_round_files_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_round_files_submission_id ON review_round_files USING btree (submission_id);


--
-- Name: review_rounds_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX review_rounds_submission_id ON review_rounds USING btree (submission_id);


--
-- Name: review_rounds_submission_id_stage_id_round_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX review_rounds_submission_id_stage_id_round_pkey ON review_rounds USING btree (submission_id, stage_id, round);


--
-- Name: rt_contexts_version_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX rt_contexts_version_id ON rt_contexts USING btree (version_id);


--
-- Name: rt_searches_context_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX rt_searches_context_id ON rt_searches USING btree (context_id);


--
-- Name: rt_versions_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX rt_versions_journal_id ON rt_versions USING btree (journal_id);


--
-- Name: rt_versions_version_key; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX rt_versions_version_key ON rt_versions USING btree (version_key);


--
-- Name: scheduled_tasks_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX scheduled_tasks_pkey ON scheduled_tasks USING btree (class_name);


--
-- Name: section_editors_context_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX section_editors_context_id ON section_editors USING btree (context_id);


--
-- Name: section_editors_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX section_editors_pkey ON section_editors USING btree (context_id, section_id, user_id);


--
-- Name: section_editors_section_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX section_editors_section_id ON section_editors USING btree (section_id);


--
-- Name: section_editors_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX section_editors_user_id ON section_editors USING btree (user_id);


--
-- Name: section_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX section_settings_pkey ON section_settings USING btree (section_id, locale, setting_name);


--
-- Name: section_settings_section_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX section_settings_section_id ON section_settings USING btree (section_id);


--
-- Name: sections_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX sections_journal_id ON sections USING btree (journal_id);


--
-- Name: sessions_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX sessions_pkey ON sessions USING btree (session_id);


--
-- Name: sessions_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX sessions_user_id ON sessions USING btree (user_id);


--
-- Name: site_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX site_settings_pkey ON site_settings USING btree (setting_name, locale);


--
-- Name: stage_assignment; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX stage_assignment ON stage_assignments USING btree (submission_id, user_group_id, user_id);


--
-- Name: stage_assignments_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX stage_assignments_submission_id ON stage_assignments USING btree (submission_id);


--
-- Name: stage_assignments_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX stage_assignments_user_group_id ON stage_assignments USING btree (user_group_id);


--
-- Name: stage_assignments_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX stage_assignments_user_id ON stage_assignments USING btree (user_id);


--
-- Name: static_page_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX static_page_settings_pkey ON static_page_settings USING btree (static_page_id, locale, setting_name);


--
-- Name: static_page_settings_static_page_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX static_page_settings_static_page_id ON static_page_settings USING btree (static_page_id);


--
-- Name: submission_comments_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_comments_submission_id ON submission_comments USING btree (submission_id);


--
-- Name: submission_file_settings_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_file_settings_id ON submission_file_settings USING btree (file_id);


--
-- Name: submission_file_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX submission_file_settings_pkey ON submission_file_settings USING btree (file_id, locale, setting_name);


--
-- Name: submission_files_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_files_submission_id ON submission_files USING btree (submission_id);


--
-- Name: submission_galley_settings_galley_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_galley_settings_galley_id ON submission_galley_settings USING btree (galley_id);


--
-- Name: submission_galley_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_galley_settings_name_value ON submission_galley_settings USING btree (setting_name, setting_value);


--
-- Name: submission_galley_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX submission_galley_settings_pkey ON submission_galley_settings USING btree (galley_id, locale, setting_name);


--
-- Name: submission_galleys_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_galleys_submission_id ON submission_galleys USING btree (submission_id);


--
-- Name: submission_search_keyword_text; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX submission_search_keyword_text ON submission_search_keyword_list USING btree (keyword_text);


--
-- Name: submission_search_object_keywords_keyword_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_search_object_keywords_keyword_id ON submission_search_object_keywords USING btree (keyword_id);


--
-- Name: submission_search_object_keywords_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX submission_search_object_keywords_pkey ON submission_search_object_keywords USING btree (object_id, pos);


--
-- Name: submission_settings_name_value; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_settings_name_value ON submission_settings USING btree (setting_name, setting_value) WHERE ((setting_name)::text = ANY ((ARRAY['indexingState'::character varying, 'medra::registeredDoi'::character varying, 'datacite::registeredDoi'::character varying])::text[]));


--
-- Name: submission_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX submission_settings_pkey ON submission_settings USING btree (submission_id, locale, setting_name);


--
-- Name: submission_settings_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_settings_submission_id ON submission_settings USING btree (submission_id);


--
-- Name: submission_tombstones_journal_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_tombstones_journal_id ON submission_tombstones USING btree (journal_id);


--
-- Name: submission_tombstones_submission_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submission_tombstones_submission_id ON submission_tombstones USING btree (submission_id);


--
-- Name: submissions_section_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX submissions_section_id ON submissions USING btree (section_id);


--
-- Name: subscription_type_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX subscription_type_settings_pkey ON subscription_type_settings USING btree (type_id, locale, setting_name);


--
-- Name: subscription_type_settings_type_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX subscription_type_settings_type_id ON subscription_type_settings USING btree (type_id);


--
-- Name: temporary_files_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX temporary_files_user_id ON temporary_files USING btree (user_id);


--
-- Name: u_e_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX u_e_pkey ON user_interests USING btree (user_id, controlled_vocab_entry_id);


--
-- Name: user_group_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX user_group_settings_pkey ON user_group_settings USING btree (user_group_id, locale, setting_name);


--
-- Name: user_group_stage_context_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_group_stage_context_id ON user_group_stage USING btree (context_id);


--
-- Name: user_group_stage_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX user_group_stage_pkey ON user_group_stage USING btree (context_id, user_group_id, stage_id);


--
-- Name: user_group_stage_stage_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_group_stage_stage_id ON user_group_stage USING btree (stage_id);


--
-- Name: user_group_stage_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_group_stage_user_group_id ON user_group_stage USING btree (user_group_id);


--
-- Name: user_groups_context_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_groups_context_id ON user_groups USING btree (context_id);


--
-- Name: user_groups_role_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_groups_role_id ON user_groups USING btree (role_id);


--
-- Name: user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_groups_user_group_id ON user_groups USING btree (user_group_id);


--
-- Name: user_settings_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX user_settings_pkey ON user_settings USING btree (user_id, locale, setting_name, assoc_type, assoc_id);


--
-- Name: user_settings_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_settings_user_id ON user_settings USING btree (user_id);


--
-- Name: user_user_groups_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX user_user_groups_pkey ON user_user_groups USING btree (user_group_id, user_id);


--
-- Name: user_user_groups_user_group_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_user_groups_user_group_id ON user_user_groups USING btree (user_group_id);


--
-- Name: user_user_groups_user_id; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE INDEX user_user_groups_user_id ON user_user_groups USING btree (user_id);


--
-- Name: users_email; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX users_email ON users USING btree (email);


--
-- Name: users_username; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX users_username ON users USING btree (username);


--
-- Name: versions_pkey; Type: INDEX; Schema: public; Owner: ojs-ci; Tablespace: 
--

CREATE UNIQUE INDEX versions_pkey ON versions USING btree (product_type, product, major, minor, revision, build);


--
-- PostgreSQL database dump complete
--

