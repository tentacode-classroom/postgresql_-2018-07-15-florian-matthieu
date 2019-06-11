--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.3 (Debian 11.3-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    id bigint NOT NULL,
    login character varying(255),
    display_login character varying(255),
    url character varying(255),
    avatar_url character varying(255)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    id_actor bigint,
    id_repo bigint,
    public_status boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: issue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue (
    id bigint NOT NULL,
    title character varying(255),
    state character varying(255)
);


ALTER TABLE public.issue OWNER TO postgres;

--
-- Name: issue_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_events (
    id_issue bigint,
    action character varying(255)
)
INHERITS (public.events);


ALTER TABLE public.issue_events OWNER TO postgres;

--
-- Name: push_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_events (
    branch character varying(255),
    commit_count integer
)
INHERITS (public.events);


ALTER TABLE public.push_events OWNER TO postgres;

--
-- Name: repo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo (
    id bigint NOT NULL,
    name character varying(255),
    url character varying(255)
);


ALTER TABLE public.repo OWNER TO postgres;

--
-- Name: watch_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watch_events (
    action character varying(255)
)
INHERITS (public.events);


ALTER TABLE public.watch_events OWNER TO postgres;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (id, login, display_login, url, avatar_url) FROM stdin;
1	Zywoo	Zywoo	hltv.org	hltv.org
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, id_actor, id_repo, public_status, created_at) FROM stdin;
\.


--
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue (id, title, state) FROM stdin;
1	Issue random	open
\.


--
-- Data for Name: issue_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_events (id, id_actor, id_repo, public_status, created_at, id_issue, action) FROM stdin;
1	1	1	t	2018-07-15 12:00:01	1	opened
\.


--
-- Data for Name: push_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_events (id, id_actor, id_repo, public_status, created_at, branch, commit_count) FROM stdin;
1	1	1	t	2018-07-15 12:00:01	branch-example	5
\.


--
-- Data for Name: repo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repo (id, name, url) FROM stdin;
1	Zinedine	hltv.org
\.


--
-- Data for Name: watch_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watch_events (id, id_actor, id_repo, public_status, created_at, action) FROM stdin;
1	1	1	t	2018-07-15 12:00:01	started
\.


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- Name: repo repo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo
    ADD CONSTRAINT repo_pkey PRIMARY KEY (id);


--
-- Name: events events_id_actor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_actor_fkey FOREIGN KEY (id_actor) REFERENCES public.actor(id);


--
-- Name: events events_id_repo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_repo_fkey FOREIGN KEY (id_repo) REFERENCES public.repo(id);


--
-- Name: issue_events issue_events_id_issue_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_events
    ADD CONSTRAINT issue_events_id_issue_fkey FOREIGN KEY (id_issue) REFERENCES public.issue(id);


--
-- PostgreSQL database dump complete
--
