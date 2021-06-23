--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adresse; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.adresse (
    id_utilisateur integer NOT NULL,
    numero_de_rue integer,
    rue character varying,
    complement_adresse character varying,
    code_postal integer NOT NULL,
    ville character varying NOT NULL,
    id_adresse integer NOT NULL
);


ALTER TABLE public.adresse OWNER TO arnaudboulanger;

--
-- Name: adresse_id_adresse_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.adresse_id_adresse_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresse_id_adresse_seq OWNER TO arnaudboulanger;

--
-- Name: adresse_id_adresse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.adresse_id_adresse_seq OWNED BY public.adresse.id_adresse;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.articles (
    id_article integer NOT NULL,
    nom character varying NOT NULL,
    prix_unitaire numeric NOT NULL
);


ALTER TABLE public.articles OWNER TO arnaudboulanger;

--
-- Name: articles_num_article_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.articles_num_article_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_num_article_seq OWNER TO arnaudboulanger;

--
-- Name: articles_num_article_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.articles_num_article_seq OWNED BY public.articles.id_article;


--
-- Name: commandes; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.commandes (
    id_commande integer NOT NULL,
    id_utilisateur integer NOT NULL,
    date date NOT NULL,
    id_adresse integer
);


ALTER TABLE public.commandes OWNER TO arnaudboulanger;

--
-- Name: commandes_num_commande_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.commandes_num_commande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commandes_num_commande_seq OWNER TO arnaudboulanger;

--
-- Name: commandes_num_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.commandes_num_commande_seq OWNED BY public.commandes.id_commande;


--
-- Name: commentaires; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.commentaires (
    id_commande integer NOT NULL,
    note integer,
    commentaire character varying
);


ALTER TABLE public.commentaires OWNER TO arnaudboulanger;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.utilisateur (
    id_utilisateur integer NOT NULL,
    id_role integer NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    numero_de_telephone bigint NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO arnaudboulanger;

--
-- Name: fichier_client_num_client_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.fichier_client_num_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fichier_client_num_client_seq OWNER TO arnaudboulanger;

--
-- Name: fichier_client_num_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.fichier_client_num_client_seq OWNED BY public.utilisateur.id_utilisateur;


--
-- Name: historique_statut_commande; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.historique_statut_commande (
    id_commande integer NOT NULL,
    id_statut character varying NOT NULL,
    date date NOT NULL,
    heure time without time zone NOT NULL
);


ALTER TABLE public.historique_statut_commande OWNER TO arnaudboulanger;

--
-- Name: ligne_commande; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.ligne_commande (
    id_article integer NOT NULL,
    id_commande integer NOT NULL,
    quantite character varying NOT NULL
);


ALTER TABLE public.ligne_commande OWNER TO arnaudboulanger;

--
-- Name: memos_recette; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.memos_recette (
    id_ingredient integer NOT NULL,
    id_article integer NOT NULL,
    quantite numeric NOT NULL
);


ALTER TABLE public.memos_recette OWNER TO arnaudboulanger;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.roles (
    id_role integer NOT NULL,
    role character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO arnaudboulanger;

--
-- Name: roles_num_role_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.roles_num_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_num_role_seq OWNER TO arnaudboulanger;

--
-- Name: roles_num_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.roles_num_role_seq OWNED BY public.roles.id_role;


--
-- Name: statut_commande; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.statut_commande (
    id_statut character varying NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.statut_commande OWNER TO arnaudboulanger;

--
-- Name: statut_commande_numstatut_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.statut_commande_numstatut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statut_commande_numstatut_seq OWNER TO arnaudboulanger;

--
-- Name: statut_commande_numstatut_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.statut_commande_numstatut_seq OWNED BY public.statut_commande.id_statut;


--
-- Name: stock_ingredients; Type: TABLE; Schema: public; Owner: arnaudboulanger
--

CREATE TABLE public.stock_ingredients (
    id_ingredient integer NOT NULL,
    nom character varying NOT NULL,
    stock numeric NOT NULL
);


ALTER TABLE public.stock_ingredients OWNER TO arnaudboulanger;

--
-- Name: stock_ingredients_num_ingredient_seq; Type: SEQUENCE; Schema: public; Owner: arnaudboulanger
--

CREATE SEQUENCE public.stock_ingredients_num_ingredient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_ingredients_num_ingredient_seq OWNER TO arnaudboulanger;

--
-- Name: stock_ingredients_num_ingredient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arnaudboulanger
--

ALTER SEQUENCE public.stock_ingredients_num_ingredient_seq OWNED BY public.stock_ingredients.id_ingredient;


--
-- Name: adresse id_adresse; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.adresse ALTER COLUMN id_adresse SET DEFAULT nextval('public.adresse_id_adresse_seq'::regclass);


--
-- Name: articles id_article; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.articles ALTER COLUMN id_article SET DEFAULT nextval('public.articles_num_article_seq'::regclass);


--
-- Name: commandes id_commande; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.commandes ALTER COLUMN id_commande SET DEFAULT nextval('public.commandes_num_commande_seq'::regclass);


--
-- Name: roles id_role; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.roles ALTER COLUMN id_role SET DEFAULT nextval('public.roles_num_role_seq'::regclass);


--
-- Name: statut_commande id_statut; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.statut_commande ALTER COLUMN id_statut SET DEFAULT nextval('public.statut_commande_numstatut_seq'::regclass);


--
-- Name: stock_ingredients id_ingredient; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.stock_ingredients ALTER COLUMN id_ingredient SET DEFAULT nextval('public.stock_ingredients_num_ingredient_seq'::regclass);


--
-- Name: utilisateur id_utilisateur; Type: DEFAULT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.fichier_client_num_client_seq'::regclass);


--
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.adresse (id_utilisateur, numero_de_rue, rue, complement_adresse, code_postal, ville, id_adresse) FROM stdin;
3	3	Rue Colette	Appartement B22	31200	Toulouse	1
4	79	Rue de la République	\N	31290	Villefranche	2
10	79	Rue de la République	\N	31290	Villefranche	3
12	1	Rue broca	Appartement 25	31300	Toulouse	4
11	5	Allee de Brienne	Appartement 36	31300	Toulouse	5
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.articles (id_article, nom, prix_unitaire) FROM stdin;
1	Margharita	8
2	Gallina	8
3	Reine	10
4	Buffalo	10.50
5	Calzone	12.50
\.


--
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.commandes (id_commande, id_utilisateur, date, id_adresse) FROM stdin;
1	3	2021-04-02	1
9	4	2021-04-20	2
10	11	2021-04-21	4
11	12	2021-04-17	5
\.


--
-- Data for Name: commentaires; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.commentaires (id_commande, note, commentaire) FROM stdin;
1	5	Commande parfaite
9	3	Livraison un peu longue, mais commande bien reçue
10	4	Trés bien
\.


--
-- Data for Name: historique_statut_commande; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.historique_statut_commande (id_commande, id_statut, date, heure) FROM stdin;
1	1	2021-04-02	20:00:00
1	2	2021-04-02	20:10:00
1	3	2021-04-02	20:30:00
1	4	2021-04-02	20:45:00
9	1	2021-04-20	19:10:00
9	6	2021-04-20	19:20:00
9	2	2021-04-20	19:30:00
9	3	2021-04-20	20:00:00
9	4	2021-04-20	20:45:00
11	1	2021-04-17	19:10:00
11	7	2021-04-17	19:20:10
\.


--
-- Data for Name: ligne_commande; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.ligne_commande (id_article, id_commande, quantite) FROM stdin;
5	1	2
4	9	2
2	9	1
1	10	3
3	10	2
5	11	1
2	11	1
\.


--
-- Data for Name: memos_recette; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.memos_recette (id_ingredient, id_article, quantite) FROM stdin;
3	1	5
7	1	5
2	1	5
5	1	1
3	2	5
1	2	5
7	2	5
2	2	5
6	2	1
5	2	1
1	3	5
7	3	5
2	3	5
4	3	5
3	3	5
5	3	1
9	4	5
1	4	5
3	4	5
7	4	5
2	4	5
1	5	5
7	5	5
3	5	5
2	5	5
6	5	5
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.roles (id_role, role) FROM stdin;
1	visiteur
2	client
3	pizzaiolo
4	livreur
5	manager
\.


--
-- Data for Name: statut_commande; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.statut_commande (id_statut, nom) FROM stdin;
1	Enregistrée
2	En cours de préparation
3	En cours de livraison
4	Livrée
5	Non livrée
6	Modifiée
7	Annulée
\.


--
-- Data for Name: stock_ingredients; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.stock_ingredients (id_ingredient, nom, stock) FROM stdin;
1	jambon	50
2	sauce tomate	50
3	mozzarella	50
4	champignons	50
5	olives	50
6	oeufs	50
7	pâte à pizza	50
8	crème fraîche	50
9	viande hâchée	50
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: arnaudboulanger
--

COPY public.utilisateur (id_utilisateur, id_role, nom, prenom, numero_de_telephone, email) FROM stdin;
3	2	Boulanger	Arnaud	33666245501	arnoboulanger@icloud.com
4	2	Boulanger	Paul	33607561072	paul.boulanger@ymail.com
5	3	Dupont	Jean	33612345678	jeandupont@pizza.fr
6	3	Dugrand	Kevin	33687654321	kevindurand@pizza.fr
7	4	Durand	Marc	33666666666	marcdurand@pizza.fr
8	4	Figuier	Jacques	33777777777	jacquesfiguier@pizza.fr
9	5	Duplantier	Sophie	33688888888	sophieduplantier@pizza.fr
10	1	Boulanger	Françoise	33607561070	francoise_boulanger@y.fr
11	2	Michu	Louise	33632165465	michulouise@icloud.com
12	2	Kepen	Marie	33625361478	louise.kepen@ymail.com
\.


--
-- Name: adresse_id_adresse_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.adresse_id_adresse_seq', 5, true);


--
-- Name: articles_num_article_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.articles_num_article_seq', 5, true);


--
-- Name: commandes_num_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.commandes_num_commande_seq', 13, true);


--
-- Name: fichier_client_num_client_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.fichier_client_num_client_seq', 12, true);


--
-- Name: roles_num_role_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.roles_num_role_seq', 5, true);


--
-- Name: statut_commande_numstatut_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.statut_commande_numstatut_seq', 7, true);


--
-- Name: stock_ingredients_num_ingredient_seq; Type: SEQUENCE SET; Schema: public; Owner: arnaudboulanger
--

SELECT pg_catalog.setval('public.stock_ingredients_num_ingredient_seq', 9, true);


--
-- Name: adresse adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (id_adresse);


--
-- Name: articles articles_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pk PRIMARY KEY (id_article);


--
-- Name: commandes commandes_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_pk PRIMARY KEY (id_commande);


--
-- Name: historique_statut_commande historique_statut_commande_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.historique_statut_commande
    ADD CONSTRAINT historique_statut_commande_pk PRIMARY KEY (id_commande, id_statut);


--
-- Name: ligne_commande ligne_commande_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT ligne_commande_pk PRIMARY KEY (id_article, id_commande);


--
-- Name: memos_recette memos_recette_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.memos_recette
    ADD CONSTRAINT memos_recette_pk PRIMARY KEY (id_ingredient, id_article);


--
-- Name: roles roles_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id_role);


--
-- Name: statut_commande statut_commande_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.statut_commande
    ADD CONSTRAINT statut_commande_pk PRIMARY KEY (id_statut);


--
-- Name: stock_ingredients stock_ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.stock_ingredients
    ADD CONSTRAINT stock_ingredients_pk PRIMARY KEY (id_ingredient);


--
-- Name: utilisateur utilisateur_pk; Type: CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id_utilisateur, id_role);


--
-- Name: ligne_commande article_ligne_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT article_ligne_commande_fk FOREIGN KEY (id_article) REFERENCES public.articles(id_article);


--
-- Name: memos_recette article_memos_recette_fk; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.memos_recette
    ADD CONSTRAINT article_memos_recette_fk FOREIGN KEY (id_article) REFERENCES public.articles(id_article);


--
-- Name: commandes fk_adresse_commande; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT fk_adresse_commande FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- Name: commandes fk_id_adresse; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT fk_id_adresse FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- Name: historique_statut_commande historique_statut_commande_statut_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.historique_statut_commande
    ADD CONSTRAINT historique_statut_commande_statut_commande_fk FOREIGN KEY (id_statut) REFERENCES public.statut_commande(id_statut);


--
-- Name: utilisateur role_fichier_utilisateur_fk; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT role_fichier_utilisateur_fk FOREIGN KEY (id_role) REFERENCES public.roles(id_role);


--
-- Name: memos_recette stock_ingredients_memos_recette_fk; Type: FK CONSTRAINT; Schema: public; Owner: arnaudboulanger
--

ALTER TABLE ONLY public.memos_recette
    ADD CONSTRAINT stock_ingredients_memos_recette_fk FOREIGN KEY (id_ingredient) REFERENCES public.stock_ingredients(id_ingredient);


--
-- PostgreSQL database dump complete
--

