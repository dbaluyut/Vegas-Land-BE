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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    username character varying(50),
    password character varying(255),
    salt character varying(50)
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: galleries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galleries (
    id integer NOT NULL,
    venue_id integer,
    image text
);


ALTER TABLE public.galleries OWNER TO postgres;

--
-- Name: galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galleries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galleries_id_seq OWNER TO postgres;

--
-- Name: galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galleries_id_seq OWNED BY public.galleries.id;


--
-- Name: happy_hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.happy_hr (
    id integer NOT NULL,
    venue_id integer,
    happy_hr_start integer,
    happy_hr_stop integer,
    day integer
);


ALTER TABLE public.happy_hr OWNER TO postgres;

--
-- Name: happy_hr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.happy_hr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.happy_hr_id_seq OWNER TO postgres;

--
-- Name: happy_hr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.happy_hr_id_seq OWNED BY public.happy_hr.id;


--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labels (
    id integer NOT NULL,
    "desc" character varying(255),
    icon text
);


ALTER TABLE public.labels OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labels_id_seq OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.labels_id_seq OWNED BY public.labels.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    street_1 character varying(50),
    street_2 character varying(50),
    city character varying(50),
    state character varying(50),
    zip integer,
    lat numeric(9,6),
    lng numeric(9,6)
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    id integer NOT NULL,
    name character varying(50),
    email character varying(50),
    "desc" character varying(255)
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recommendations_id_seq OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recommendations_id_seq OWNED BY public.recommendations.id;


--
-- Name: venue_labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venue_labels (
    venue_id integer,
    label_id integer
);


ALTER TABLE public.venue_labels OWNER TO postgres;

--
-- Name: venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venues (
    id integer NOT NULL,
    title character varying(50),
    "desc" text,
    location_id integer,
    type text,
    link character varying(255),
    CONSTRAINT venues_type_check CHECK ((type = ANY (ARRAY['bar'::text, 'restaurant'::text, 'shop'::text, 'experience'::text])))
);


ALTER TABLE public.venues OWNER TO postgres;

--
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venues_id_seq OWNER TO postgres;

--
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venues_id_seq OWNED BY public.venues.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: galleries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galleries ALTER COLUMN id SET DEFAULT nextval('public.galleries_id_seq'::regclass);


--
-- Name: happy_hr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.happy_hr ALTER COLUMN id SET DEFAULT nextval('public.happy_hr_id_seq'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels ALTER COLUMN id SET DEFAULT nextval('public.labels_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations ALTER COLUMN id SET DEFAULT nextval('public.recommendations_id_seq'::regclass);


--
-- Name: venues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues ALTER COLUMN id SET DEFAULT nextval('public.venues_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, username, password, salt) FROM stdin;
1	will_stoddard	1037ff091da764ff66e19290d92a6f53176ca455fd9e3d59271707a905ac15a4260686022920d523c93a7ec2dd24e0f4bd1c058d50c6fcb5d9902bb4775de0da	OwdIZsHjWFYqTYqvNmBQ
2	derrique_baluyut	cd937f4a40909f228d944b220bfd1273983aa7e80db491ed40aaac8190e5827712c51b8aa65d91ca385ced8821157f425ed82621256df09a919266e3587a1ca6	OwdIZsHjWFYqTYqvNmBQ
3	bereket_girma	bc56a6c69ab39d4b67aa46d4b235a60c198b5cb7b3d1246e810eafe6eb09061949cf66ee0a32c3d885186ef5e77ee3280383654ebcb36cc4aa6ebbeb66e29164	OwdIZsHjWFYqTYqvNmBQ
\.


--
-- Data for Name: galleries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galleries (id, venue_id, image) FROM stdin;
1	1	https://roadfood.com/wp-content/uploads/2018/06/The-Goodwhich-Reubenish.jpeg
2	2	https://bestoflasvegas.com/custom/domain_1/image_files/sitemgr_photo_9883.jpg
3	3	https://www.cornishpastyco.com/wp-content/uploads/2018/11/home2.jpg
4	4	https://media.lasvegassun.com/media/img/photos/2014/11/24/1124MakersFindersCoffee10.JPG
5	5	https://media-cdn.tripadvisor.com/media/photo-s/0d/84/77/5d/devil-s-eggs.jpg
6	6	https://media.cntraveler.com/photos/5a81c39286e4b63c297d479e/4:5/w_767,c_limit/Eat-Downtown-Las-Vegas__2018_2015_05_28_Eat_Again-143-Killer_Grilled_Cheese_Tomato_Soup_Photo_By_Brad_Swonetz.jpg
7	7	https://secureservercdn.net/198.71.233.51/wkd.2a2.myftpupload.com/wp-content/uploads/2020/06/le_thai_awesome_noodles_15_1310x1287-750x750.jpg
8	8	https://media.lasvegassun.com/media/img/photos/2015/04/08/IMG_9736_t1000.jpg?c76bf34eada957f64a0b14990027a576ff9bf379
9	9	https://s3-media0.fl.yelpcdn.com/bphoto/nuLnbCe6E3chgGPuqJSULg/o.jpg
10	10	https://www.reviewjournal.com/wp-content/uploads/2017/01/web1_matcha-latte_7760993.jpg?crop=1
11	11	https://media.lasvegasweekly.com/img/photos/2019/10/22/_7thCarson-by-Christopher-DeVargas_t1000.png?c76bf34eada957f64a0b14990027a576ff9bf379
12	12	https://pizzarocklasvegas.com/wp-content/uploads/sites/2/2019/10/pr-food-6.jpg
13	13	https://img1.10bestmedia.com/Images/Photos/372846/MTO-Cafe-Blueberry-Pancakes_55_660x440.jpg
14	14	https://assets.bonappetit.com/photos/578e48fd0150278b02e3920c/2:1/w_880,c_limit/VELVETEEN-RABBIT-vegas-restaurant-communion-wafer-cocktail.jpg?mbid=social_retweet
15	15	https://media.lasvegasweekly.com/img/photos/2015/01/27/Hop_Nuts_by_Steve_Marcus_2_t1000.jpg?c76bf34eada957f64a0b14990027a576ff9bf379
16	16	https://modtraveler.net/wp-content/uploads/2015/06/Atomic-Liquors-Twilight1.jpg
17	17	https://media.lasvegasweekly.com/img/photos/2020/10/28/1029_FoodDrink2_Nevad-Brew-Works_Credit_Christopher-DeVargas_Staff_t1000.jpg?c76bf34eada957f64a0b14990027a576ff9bf379
18	18	https://static01.nyt.com/images/2019/02/17/travel/17vegas-arts-district2/merlin_149473734_1c764407-491d-419e-8ef7-dd1341274217-jumbo.jpg
19	19	https://assets.simpleviewcms.com/simpleview/image/fetch/c_fill,g_center,h_610,q_75,w_814/https://lasvegas.simpleviewcrm.com/images/listings/original_crafthaus-brewery.jpg
20	20	https://cdn.usarestaurants.info/assets/uploads/4a634f39a89e9ebc5b5722263a8a8a39_-united-states-nevada-clark-county-las-vegas-jammyland-cocktail-bar-reggae-kitchen-702-800-9098htm.jpg
21	21	https://www.reviewjournal.com/wp-content/uploads/2020/08/14017554_web1_RJ-MAG-WINE-BAR_072420cs_010.jpg
22	22	https://cdn.usarestaurants.info/assets/uploads/0e7518c24067a061cd0a5509440eb1fe_-united-states-nevada-clark-county-las-vegas-banger-brewing-702-456-2739htm.jpg
23	23	https://bunkhousedowntown.com/wp-content/uploads/2019/05/SocialShare-Bunkhouse1200630.jpg
24	24	https://media.lasvegasweekly.com/img/photos/2017/04/05/0406_Intersection_TheNerd.jpg
25	25	https://thingstodoinlasvegas.com/wp-content/uploads/2016/10/Artifice_nightlife.jpg
26	26	https://media.lasvegasweekly.com/img/photos/2009/09/30/scaled.dinos_by_clay_heximer_01.jpg
27	27	https://i.pinimg.com/originals/d9/1b/03/d91b03f8955c140a26eef6667e75fd30.jpg
28	28	https://media.lasvegasweekly.com/img/photos/2012/09/12/neonopolis_by_steve_marcus.jpg
29	29	https://i.ytimg.com/vi/Lbcvb6sUeE4/maxresdefault.jpg
30	30	https://themobmuseum.org/wp-content/themes/newmob/assets/insidethemuseum.jpg
31	31	https://asuevents.asu.edu/sites/default/files/styles/asu_event_image/public/neonmus1.jpg?itok=iiezF4In
32	32	https://images.squarespace-cdn.com/content/v1/5dcd930ca512176033fed49d/1603141280749-31R3ZYK2MIP0HI6HGGSR/ke17ZwdGBToddI8pDm48kB6N0s8PWtX2k_eW8krg04V7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UUPKOmO-J47BDGPeAjKBgw7xgmaTgorvVRLpehS4Q8s3pC969RuPXvt2ZwyzUXQf7Q/POUR+GIFT+CARD+FINAL.png?format=1000w
33	33	https://i.pinimg.com/originals/ea/2c/9b/ea2c9b9f34230dea55b7737e70e358ac.png
34	34	https://nevadamagazine.com/wp-content/uploads/PP10.jpg
35	35	https://www.reviewjournal.com/wp-content/uploads/2018/06/10743989_web1_PAWN-STAR-MEMORIAL-JUN26-18bt03.jpg?crop=1
36	36	https://www.reviewjournal.com/wp-content/uploads/2017/09/9218162_web1_hauntedmuseum-sep14-17-bh-001.jpg?crop=1
37	37	https://lh3.googleusercontent.com/proxy/Cl2_tjKM2kR-tEaOA-Ac7UC_l--vgjupLKazNey2-2H2nGP0pxZYgdnvjNFCCjghcmnsPKXkYyD0g1iySdVbLiyvj9_APq8yjRnc9c_RD9Hjxtu9Rki-UhYkBrRgLXhiWYzuMbYkrNTx
38	38	https://www.casino.org/news/wp-content/uploads/2018/03/rawImage-2.jpg
39	39	https://i1.wp.com/wanderlustyle.com/wp-content/uploads/2016/09/48539620221_f2f4f36cdd_k.jpg?fit=2048%2C1365&ssl=1
40	40	https://1pg6x1158j2c3wpy0512zgcs-wpengine.netdna-ssl.com/wp-content/uploads/2014/04/viva-vision-flower@2x.jpg
41	41	https://miro.medium.com/max/2000/1*Ca88KGqNZUpd1orpL6Xo1g.jpeg
42	42	https://pbs.twimg.com/media/DevNRZ1UcAAP1KI.jpg
43	43	https://cannabition-staging.firebaseapp.com/images/jpg/harvest-4.jpg
44	44	https://images.squarespace-cdn.com/content/v1/56cf54142fe1312f24f8f04d/1458231806566-F5GO4UM3T2XSDL9YVPPS/ke17ZwdGBToddI8pDm48kFmKdAJFcOk5fsAfzma6oat7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0ro8siOxa7KOjEXaZRk24Q56mUDAg7BAm91VGqgkLdX3NOdT9hRlG3rX4NNR3uCrgw/bigrigjig_01.jpg?format=1500w
45	45	https://lh3.googleusercontent.com/p/AF1QipMvFdsg662-ZqqhteXMYjNXkUoRbIkFssGBcVo-=s1600-w1600
46	46	https://travelnevada.com/wp-content/uploads/2020/04/original-vintagevegas9-sm.jpg
47	47	https://modtraveler.net/wp-content/uploads/2015/06/IMG_1257.jpg
48	48	https://sawebfilesprod001.blob.core.windows.net/images/18b.jpg?sv=2017-04-17&sr=b&si=DNNFileManagerPolicy&sig=VwnDYOp4jLQDrt3QZcEp46hfmoB5QReSw%2B8Yt2ph8kE%3D
49	49	https://i.pinimg.com/originals/21/e7/8a/21e78a4059c852713cb16af2b8754595.jpg
50	50	https://www.factoryofdreams.com/galeria/big/3.jpg
51	51	https://2ab9pu2w8o9xpg6w26xnz04d-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/bender-jamboree-2018-glory-1480x832.jpg
\.


--
-- Data for Name: happy_hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.happy_hr (id, venue_id, happy_hr_start, happy_hr_stop, day) FROM stdin;
7	1	900	2300	1
8	1	1500	1800	1
9	1	1500	1800	2
10	1	1500	1800	3
11	1	1500	1800	4
12	1	1500	1800	5
13	2	900	1900	5
14	2	1700	1900	2
15	2	1700	1900	3
16	2	1700	1900	4
17	2	1700	1900	5
18	2	1700	1900	6
19	2	1700	1900	7
20	2	2100	2300	1
21	2	2100	2300	2
22	2	2100	2300	3
23	2	2100	2300	4
24	2	2100	2300	5
25	2	2100	2300	6
26	2	2100	2300	7
27	3	900	1800	1
28	3	1500	1800	2
29	3	1500	1800	3
30	3	1500	1800	4
31	3	1500	1800	5
32	3	2100	2300	7
33	3	2100	2300	1
34	3	2100	2300	2
35	3	2100	2300	3
36	3	2100	2300	4
37	3	2100	0	5
38	3	2100	0	6
39	4	1600	1800	1
40	4	1600	1800	2
41	4	1600	1800	3
42	4	1600	1800	4
43	4	1600	1800	5
44	4	1600	1800	6
45	4	1600	1800	7
46	7	1500	1800	1
47	7	1500	1800	2
48	7	1500	1800	3
49	7	1500	1800	4
50	7	1500	1800	5
51	12	1500	1800	1
52	12	1500	1800	2
53	12	1500	1800	3
54	12	1500	1800	4
55	12	1500	1800	5
56	14	1700	1900	1
57	14	1700	1900	2
58	14	1700	1900	3
59	14	1700	1900	4
60	14	1700	1900	5
61	14	1700	1900	6
62	14	1700	1900	7
63	15	1600	1900	1
64	15	1600	1900	2
65	15	1600	1900	3
66	15	1600	1900	4
67	15	1600	1900	5
68	15	1600	1900	6
69	15	1600	1900	7
70	22	1800	2100	1
71	22	1800	2100	2
72	22	1300	1500	3
73	22	1300	1500	4
74	22	1300	1500	5
75	22	1300	1500	6
76	22	1300	1500	7
77	22	2100	2300	3
78	22	2100	2300	4
79	22	2100	2300	5
80	22	2100	2300	6
81	22	2100	2300	7
1	3	900	2300	2
2	6	900	2300	2
3	23	900	2300	2
4	25	900	2300	2
5	20	900	2300	2
6	24	900	2300	2
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.labels (id, "desc", icon) FROM stdin;
1	Masks Required	./assets/mask.svg
2	Takeout	./assets/take-out.svg
3	Sit-down	./assets/sit-down.svg
4	Curbside Pickup	./assets/curb-side.svg
5	Limited Capacity	./assets/socialdistance.svg
6	Social Distancing Enforced	./assets/socialdistance.svg
7	Sanitize	./assets/sanitize.svg
8	Outdoor Seating	./assets/outdoor-seating.svg
9	Pet-Friendly	/assets/pet-friendly.svg
10	Delivery	./assets/delivery.svg
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, street_1, street_2, city, state, zip, lat, lng) FROM stdin;
1	900 S Las Vegas Blvd	\N	Las Vegas	NV	89101	36.159950	-115.147460
2	1130 S Casino Center Blvd	#110	Las Vegas	NV	89104	36.157650	-115.152700
3	10 E Charleston Blvd	\N	Las Vegas	NV	89104	36.158480	-115.152910
4	1120 S Main St	Suite 110	Las Vegas	NV	89104	36.701120	-86.572190
5	124 S 6th St	#100	Las Vegas	NV	89101	44.016030	-107.961530
6	707 E Carson Ave	\N	Las Vegas	NV	89101	36.166720	-115.138940
7	523 Fremont St	\N	Las Vegas	NV	89101	36.168749	-115.139889
8	1126 Fremont St	\N	Las Vegas	NV	89101	36.165687	-115.132961
9	1108 S 3rd St	\N	Las Vegas	NV	89104	36.158556	-115.151092
10	1114 S Casino Center Blvd	#1	Las Vegas	NV	89104	36.158140	-115.152538
11	616 E Carson Ave	#110	Las Vegas	NV	89101	\N	\N
12	201 N 3rd St	\N	Las Vegas	NV	89101	36.171596	-115.142248
13	500 S Main St	\N	Las Vegas	NV	89101	36.166338	-115.149967
14	1218 S Main St	\N	Las Vegas	NV	89104	36.157121	-115.153777
15	1120 S Main St	#150	Las Vegas	NV	89104	36.157838	-115.153847
16	917 Fremont St	\N	Las Vegas	NV	89101	36.166785	-115.135525
17	1327 S Main St	Ste 160	Las Vegas	NV	89104	36.155696	-115.153679
18	1225 S Main St	\N	Las Vegas	NV	89104	36.157044	-115.153578
19	197 E California Ave	#130	Las Vegas	NV	89104	36.157459	-115.152529
20	1121 S Main St	\N	Las Vegas	NV	89104	36.158425	-115.153474
21	197 E California Ave	#140	Las Vegas	NV	89104	36.157459	-115.152529
22	450 Fremont St	#135	Las Vegas	NV	89101	36.169519	-115.140945
23	124 S 11th St	\N	Las Vegas	NV	89101	36.165992	-115.134118
24	450 Fremont St	#250	Las Vegas	NV	89101	36.169519	-115.140945
25	1025 S 1st St	#100	Las Vegas	NV	89101	36.160336	-115.152188
26	1516 S Las Vegas Blvd	\N	Las Vegas	NV	89104	36.153039	115.151503
27	707 Fremont St	\N	Las Vegas	NV	89101	\N	\N
28	450 Fremont St	\N	Las Vegas	NV	89101	\N	\N
29	450 Fremont St	\N	Las Vegas	NV	89101	\N	\N
30	300 Stewart Ave	\N	Las Vegas	NV	89101	\N	\N
31	770 Las Vegas Blvd N	\N	Las Vegas	NV	89101	\N	\N
32	1031 Fremont St	\N	Las Vegas	NV	89101	\N	\N
33	1031 Fremont St	\N	Las Vegas	NV	89101	\N	\N
34	725 S Las Vegas Blvd	\N	Las Vegas	NV	89101	\N	\N
35	713 S Las Vegas Blvd	\N	Las Vegas	NV	89101	\N	\N
36	600 E Charlseton Blvd	\N	Las Vegas	NV	89104	\N	\N
37	1023 Fremont St	\N	Las Vegas	NV	89101	\N	\N
38	Fremont St	\N	Las Vegas	NV	89101	\N	\N
39	425 Fremont St	#160	Las Vegas	NV	89101	\N	\N
40	Fremont St	\N	Las Vegas	NV	89101	\N	\N
41	450 Fremont St	#270	Las Vegas	NV	89101	\N	\N
42	450 Fremont St	Suite 163	Las Vegas	NV	89101	\N	\N
43	450 Fremont St	#140	Las Vegas	NV	89101	\N	\N
44	1028 NV-582	\N	Las Vegas	NV	89101	\N	\N
45	450 Fremont St	\N	Las Vegas	NV	89101	\N	\N
46	1229 S Main St	\N	Las Vegas	NV	89104	\N	\N
47	1131 S Main St	\N	Las Vegas	NV	89104	\N	\N
48	1001 S 1st St	\N	Las Vegas	NV	89101	\N	\N
49	818 S Main St	\N	Las Vegas	NV	89101	\N	\N
50	723 S 1st St	\N	Las Vegas	NV	89101	\N	\N
51	1 N Main St	\N	Las Vegas	NV	89101	\N	\N
\.


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommendations (id, name, email, "desc") FROM stdin;
\.


--
-- Data for Name: venue_labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venue_labels (venue_id, label_id) FROM stdin;
1	2
1	10
2	1
2	2
2	3
2	5
2	8
2	10
3	1
3	2
3	3
3	4
3	5
3	6
3	7
4	2
4	4
4	5
4	8
4	10
5	1
5	2
5	3
5	4
5	6
5	7
5	8
6	1
6	2
6	3
6	4
6	5
6	6
6	7
6	8
7	1
7	2
7	3
7	4
7	5
7	6
7	7
7	8
8	2
8	3
8	4
8	5
9	1
9	2
9	3
9	5
9	6
9	7
9	8
9	10
10	2
10	3
10	4
10	5
10	10
11	1
11	2
11	3
11	4
11	5
11	7
11	8
11	10
12	1
12	2
12	3
12	4
12	5
12	6
12	8
12	10
13	1
13	2
13	3
13	4
13	5
13	6
13	7
13	10
14	\N
15	2
15	4
16	\N
17	3
17	8
18	1
18	3
18	4
18	5
18	6
18	7
18	8
19	1
19	2
19	3
19	4
19	5
19	6
19	7
20	1
20	2
20	3
20	4
20	6
20	7
20	8
21	8
22	1
22	6
22	7
23	\N
24	6
25	1
25	3
25	5
25	6
25	7
26	\N
\.


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venues (id, title, "desc", location_id, type, link) FROM stdin;
1	The Goodwich Downtown	 The original Goodwich was created in an 8’ x 12’ kiosk in the parking lot of Dino’s, one of Las Vegas’ oldest dive bars. It was founded by two friends in 2014 that shared an undeniable passion for the restaurant industry. With the realization and combined years of experience, much of it in fine dining, they created a sandwich concept based on the foundation of great restaurant food; flavor, texture and balance. All of this between two slices of bread wasn’t good enough for them. It had to be Stacked-rite so every bite of their sandwiches had the same tasty qualities. It was and still is their dream to show each and every guest their passion for great food that brought them together to create the Goodwich.	1	restaurant	https://thegoodwich.com/
2	Esther's Kitchen	Esther's Kitchen is a seasonal Farm to Table Italian Restaurant located in the Las Vegas Arts District. They serve fresh Pasta, Pizzas, Vegetables, Proteins, Wine, Beer, Cocktails. Lunch, Dinner and Brunch.	2	restaurant	https://www.estherslv.com/
3	Cornish Pasty Co.	The Cornish pasty (pronounced “pastee”) is a nourishing, and cleverly devised, handheld meal, its heritage is closely associated with the miners from the Cornwall, the rugged peninsula in the south west of England. The Cornish Pasty Company serves a quality meal, made from scratch and prepared with the freshest of ingredients in a unpretentious unique warehouse in the Arts District. Our restaurant is a welcoming place to drop in with friends, grab a pint of local beer, shoot some pool and, maybe if they are really good friends, share a bite of your Cornish pasty!	3	restaurant	https://www.cornishpastyco.com/
4	Makers & Finders Coffee	Makers & Finders is a vibrant, upbeat restaurant-coffee-bar where specialty coffee, inspired Latin food, & hospitality are the program pillars. The setting is brightly lit with unique murals & positive affirmations throughout the lively space that attracts a large fan base. The full service experience transforms a coffee shop into a bustling café. Coffee can be handcrafted during dine-in or to-go, depending on the visit. All syrups are handmade by trained baristas making it the most unique specialty latte menu in Las Vegas. Communal connections, co-working & networking are strongly encouraged.	4	restaurant	https://www.makerslv.com/
5	Carson Kitchen	Specializing in creative American cuisine and thoughtfully crafted cocktails, Carson Kitchen is a cornerstone of the Downtown Las Vegas dining scene. Carson Kitchen is built on a philosophy of reimagined comfort food prepared with approachable fine-dining ingredients. The restaurant opened in 2014, a partnership between chef and restaurateur Cory Harwell and his dear friend, the late Chef Kerry Simon. Designed to bring a carefully curated experience to our unique neighborhood, Carson Kitchen features a contemporary bar, open kitchen expo counter, community tables, and an outdoor rooftop and bar. Guests can also take in a cocktail and relax in the courtyard of our home in the repurposed mid-century John E. Carson Hotel.	5	restaurant	https://www.carsonkitchen.com/las/index.html
6	eat.	The most hotly-anticipated new eatery in downtown Las Vegas, eat is the culinary brainchild of professional chef, Natalie Young. With 20+ years experience under her toque, Chef Natalie is delighted to bring the skills she honed pleasing the palates of top chefs, critics and other discerning foodies home to her friends and neighbors.Located at the corner of Carson and 7th Streets, eat is perfectly poised to serve downtown’s business and residential communities, as well as adventurous suburbanites, tourists and any and all hungry people. What will “Downtown’s New Comfort-Cuisine Queen” be cookin’ up? Check the menu.	6	restaurant	https://eatdtlv.chefnatalieyoung.com/
7	Le Thai	Established in late 2011, Le That offers a full-service restaurant with a causal and fun atmosphere in the heart of downtown Las Vegas. Enjoy a classic Thai dish, or a fusion of a Chef Dan’s own creation, before or after bar hopping on the famous Fremont Street. Le Thai showcases Chef Dan Coughlin’s famous 3 color curry (a blend of red, yellow and green curry’s), homemade Thai noodle soup and our always fresh signature Waterfall Sauce. Le Thai also offers a daily-weekly special board along with a traditional Thai menu inspired by Dan’s Thailand-born mom and grandma.	7	restaurant	https://lethaivegas.com/
8	PublicUs	PublicUs (pūb-li-cus) is a canteen-style, neighborhood restaurant and coffee bar located in the Fremont East District of Downtown Las Vegas. Featuring an award winning coffee program as well as a seasonal food program utilizing local and / or organic produce where possible. They also have homemade bread, pastries and desserts.	8	restaurant	http://www.publicuslv.com/
9	D E Thai Kitchen	 A  new Thai restaurant inspired by traditional flavors of Thailand’s best food from around the country. Our chef and owner was born in Bangkok, but his father was from Trang ( southern Thailand close by Phuket ).	9	restaurant	https://www.dethaikitchen.com/
10	Vesta Coffee Roasters	Vesta Coffee Roasters started out of necessity.  A love... nay, passion for coffee, and the drive to share something great with the local community.  They strive to provide the finest quality, not because it's something that will make them successful, but because it's the right thing to do. At Vesta Coffee Roasters, they strive to source beautiful specialty coffees from around the world.  Highlighting exceptional producers, while working with trusted exporters, importers, and sometimes, the farmers directly.  All of their traceable, fresh-crop coffees are roasted to their individual "sweet spot" aiming to highlight the rewards of hard work, terroir, and processing that make each coffee unique.  They can't wait to share these coffees with you!	10	restaurant	https://vestacoffee.com/
11	7th & Carson	7th and Carson's menu consists of simple, approachable ingredients combined to create fun flavors in an assortment of shareable plates. Guests are invited to come in for a few pints or a cocktail, have a few great plates and enjoy the neighborhood vibe. Open now and located at its namesake crossroads, 7th and Carson Downtown Kitchen and Bar brings new life to DTLV!	11	restaurant	https://www.7thandcarson.com/
12	Pizza Rock	Taking pizza to the next level, Pizza Rock was born from the creative minds of three best friends: George Karpaty, Tony Gemignani, and Trevor Hewitt. Additionally, a selection of pastas, calzones, Stromboli, antipasti and salads are offered, all with a focus on authentic Italian ingredients and organically-grown produce. All fresh pasta is made on-premises, as is the Sicilian and Calabrese link and bulk sausages. Pizza Rock also offers an array of New York slices, calzones, strombolis, meatball subs, perfect for a quick, convenient bite on the way to work, from a bar, or just enjoyed while strolling the streets of downtown Las Vegas. Pizza Rock’s full bar focuses on hand-crafted artisan cocktails, an extensive draft and bottled beer list and a collection of wines with a focus on California and Italy. An Acoustic Sunday Brunch will feature specialty breakfast pizzas but also a twist on classics like meatball hash and eggs, eggs Benedict with pancetta and French toast made with focaccia bread.	12	restaurant	https://pizzarocklasvegas.com/
13	MTO Café	Think classic breakfast, lunch, brunch and dinner favorites - but better. MTO Café is serving up comfort food made from fresh, quality ingredients in the heart of downtown Las Vegas and the newly opened Downtown Summerlin. Focusing on high-quality, local and seasonal ingredients, MTO is always fresh and made to order.	13	restaurant	https://mtocafe.com/
14	Velveteen Rabbit	Velveteen Rabbit is a craft cocktail and beer bar situated in the heart of the Arts District. Each seasonal cocktail menu is the product of innovation, creativity, and care, boasting of fresh produce and house-made ingredients. They offer a range of specialty beers with a rotating selection of twelve taps, as well as 18-20 bottled beers. Their eclectic space features local art, boutique spirits, vintage furniture, and a magical pink outdoor patio.  The intimacy of the space allows for celebrations of all kinds, including wedding receptions! Contact them to reserve a date.	14	bar	https://velveteenrabbitlv.com/
15	Hop Nuts Brewing	Established in 2013, Hop Nuts Brewing provides a craft beer experience in a relaxed atmosphere. Hop Nuts Brewing is a brewery with a full bar located in the Arts District in Downtown Las Vegas. They have 20 beers on tap! 15 of them are brewed in house with 5 guest taps. They specialize in brewing unique craft beers especially IPA's	15	bar	http://www.hopnutsbrewing.com/
16	Atomic Liquors	Atomic Liquors is the oldest free standing bar in Las Vegas, obtaining the #7 liquor license in the city (the six prior being all casinos). Originally founded by Joe & Stella Sobchik in 1952, it was named for a time when customers watched atomic blasts from the roof. Like much of old-time Vegas, Atomic has showbiz in its veins - The Rat Pack and the Smothers Brothers drank here after their nightly shows, and Barbra Streisand even had her own seat, which has been restored and is on display. History, atmosphere, free parking and great drinks.	16	bar	http://atomic.vegas/
17	Nevada Brew Works	At Nevada Brew Works, we believe everything starts with great beer. Our brewers have years of experience and are expertly trained at the World Famous Siebel Institute of Technology. The result is creative, great tasting beers to enjoy with friends.	17	bar	https://nevadabrewworks.com/
18	ReBAR	ReBAR was named 10 Best Bars in Las Vegas by USA Today, voted Best Downtown Hangout by Las Vegas Weekly and recognized as Cheap Eats 2017 by Vegas Seven Magazine for it's gourmet sausages and vegan kielbasas. ReBAR has a full bar which doubles as an Antique Store and is the only bar of it's kind - where everything's for sale! - Literally everything, the glass you're drinking out of, the stool you're sitting on, or the tchotchkes you're looking at on the wall can all go home with you for a thrift store price. Enjoy ReBAR's Award Winning Vegan Kielbasas, Gourmet Hot Dogs and Sausage Pretzel Dogs which were featured on Diners, Drive-Ins and Dives with Guy Fieri - or simply imbibe with one of ReBAR's Charitable Cocktails which raise money for local non-profits with every purchase. Enjoy a Downtown deal with $3 Draft Beers, $4 Well Drinks or $4 White Wines all night long, as you shop all the way up until last call.	18	bar	https://rebarlv.com/
19	CraftHaus Brewery	They specialize in brewing craft beer that is of the highest quality for our community. Welcoming tourists and residents is our pleasure. We feature 24 taps of our beers, guest beers, cold brew, cider and wine. Established in 2014. CraftHaus Brewery is passionate about building a community around quality driven beers. Owners, Wyndee and Dave Forrest successfully changed licensing for the city of Henderson and Las Vegas to a more craft friendly license. Named Favorite Local Brewery, Reader's Choice, Las Vegas Weekly 2018 and Best of Winner 2015, 2016 and 2017. Winner, Top 100 Businesses Coast to Coast, Yelp! Nevada's Greenest Brewery 2018 and Best Family Owned Business, Nevada Entrepreneur Magazine 2016.	19	bar	https://www.crafthausbrewery.com/home
20	Jammyland Cocktail Bar & Reggae Kitchen	Jammyland Cocktail Bar & Reggae Kitchen is proud to join the LV cocktail scene, offering refined drinks in a shanty chic converted garage with dual patios in the heart of Antique Alley. Established in 2018. Jammyland Cocktail Bar & Reggae Kitchen opened in Spring of 2018 in the downtown Las Vegas Arts District. We've got over 1500 cuts of ska, rocksteady, dancehall and more in multiple languages. We serve food all night, cocktails with fresh ingredients, good vibes and genuine hospitality.	20	bar	https://jammy.land/
21	Garagiste Wine Room & Merchant	Garagiste Wine Room | Merchant began as an idea born of the mutual passion for wine of its two founders, Mario Enriquez and Eric Prato.  The goal of Garagiste Wine Room | Merchant is to be a leader in the evolution and growth of wine culture in Las Vegas.  Garagiste Wine Room | Merchant strives to provide world-wine experiences from grower-producers to the classics alike.  Guests are invited to enjoy, discuss and immerse themselves in the world of wine as seen through the eyes of professional Sommeliers.	21	bar	http://garagistelv.com/
22	Banger Brewing	They are a Las Vegas microbrewery with a tasting room. We feature a 3.5 BBL brewhouse with 5 fermenters using the freshest ingredients to craft the finest beers while featuring other local breweries on tap.	22	bar	http://bangerbrewing.com/
23	Bunkhouse Saloon	The Bunkhouse Saloon is a live music venue, bar, and restaurant in Downtown Las Vegas. Established in 1953, The Bunkhouse Saloon has earned a reputation as one of Vegas’ best places to see both established and emerging bands. Recently-renovated while maintaining the charm and personality of the original, Bunkhouse now features a state-of-the-art sound & lighting system as well as a brand-new stage.	23	bar	https://bunkhousedowntown.com/
24	The NERD	Comic-con meets bar & nightclub. Modern bar with comic book–centric decor, plus free bowling lanes, billiard tables & video games.	24	bar	https://thenerd.com/
25	Artifice	The longest standing bar & lounge in the las vegas arts district, Artifice is home to First Friday, Scarlet Deepest Red Goth Night, Soul State, Darker, and many other diverse and inclusive community events.	25	bar	https://www.artificebarlv.com/
26	Dino's Lounge	Dino's is one of Vegas' oldest dive bars. It is smoky, it's not fancy, but it's a whole lot of fun. This is a place where the bartenders vote on a "Drunk of the Month" from amongst their regulars. The bar is a Vegas institution and has always been a family business. Purchased in 1960 by Dean "Dino" Bartolo, the neighborhood bar and liquor store was originally called Ringside Liquors (named for the boxing murals on the ceiling), but after becoming a popular local hangout, the bar was renamed "Dino's Lounge" after its owner.The clientele and staff became a sort-of extended family, starting traditions like the weekly "99" card game on Friday nights. Dino's son Chuck took over the business when he advanced in age, and after Chuck died a few years ago, his daughter Kristin took over the reins. After more than 40 years, Dino's still considers its regulars family, and keeps drawing new generations of visitors to the downtown bar. The monthly First Friday block party held in the nearby Arts District brings the valley's hipsters into the bar to check out hot bands and Dino's packs 'em in for its legendary karaoke nights with Danny G. Some things never change. And downtown Las Vegas is far better for it.	26	bar	https://www.facebook.com/DinosLV/
27	Downtown Container Park	Downtown Container Park is an open-air shopping and entertainment venue featuring 38 unique retail shops, restaurants, and bars. Located in Las Vegas’ flourishing Downtown neighborhood, the innovative center is built from 43 repurposed shipping containers and 41 locally manufactured Xtreme cubes. Upon arrival, guests are greeted by a 35-foot-tall praying mantis sculpture that shoots flames from its antennae. After entering the park, guests discover a whimsical world of one-of-a-kind boutiques, restaurants, and bars. The park also includes a stage for presentations and live music performances, as well as The Treehouse, an interactive play area featuring a 33-foot-tall slide, NEOS play system, oversized foam building blocks and much more. Container Park is a 21+ facility after 9 p.m. daily.	27	experience	https://downtowncontainerpark.com/
28	Neonopolis	The Neonopolis is a one-of-a-kind dining, entertainment, and shopping experience located in the heart of Downtown Las Vegas.  Featuring everything from axe-throwing to vibrant video-game nightlife, everyone can find something at the Neonopolis.	28	experience	https://www.neonopolislv.com/
29	Toy Shack	Probably the only reason to visit Neonopolis (besides parking), The Toy Shack is where Jimmy Jiminez, a toy expert who makes frequent appearance on the History Channel’s Pawn Stars, actually works. The story carries everything from pristine collectibles to new-fangled toys, dolls, and action figures. Comic book nerds (and the people who love them) use the goods here for superhero cosplay parties; the country’s biggest collection of Hot Wheels is a big draw for those sorts of aficionados. Who says you can’t play with toys when you’re an adult? The Toy Shack is open Mondays through Saturdays from 11am until 10pm.	29	shop	https://www.facebook.com/lasvegastoyshack/
30	Mob Museum	The Mob Museum provides a world-class, interactive journey through true stories. From the birth of the Mob, to today’s headlines. Shadows and whispers. G-Men and Made Men. Whether you like it or not, this is American history. Located steps from Fremont Street, the Museum provides an experience unlike any other.	30	experience	https://themobmuseum.org/
31	Neon Museum	Founded in 1996, The Neon Museum is a non-profit 501 (c) 3 organization dedicated to collecting, preserving, studying and exhibiting iconic Las Vegas signs for educational, historic, arts and cultural enrichment. The Neon Museum campus includes the outdoor exhibition space known as the Neon Boneyard, a visitors’ center hou`sed inside the former La Concha Motel lobby and the Neon Boneyard North Gallery which houses additional rescued signs and is available for weddings, special events, photo shoots and educational programs. 	31	experience	https://www.neonmuseum.org/
32	Pour in the Alley	In Fergusons Downtown's newest tasting you will get two 750ml bottles of Mezcal: the infamous 400 Conejos and delicious Creyente! Fergusons Downtown has also teamed up with Tacotarian, a booming plant-based bar and restaurant in the Arts District that is creating a delicious tasting meal to complement each one of these special mezcals! Join Tacotarian's owner Carlos Corral and brand ambassador Breelyn Shekley of 400 Conejos & Creyente as they taste with you and educate you on all things Mezcal with plant-based Mexican food! 	32	experience	https://www.fergusonsdowntown.com/pour-in-the-alley
33	Market in the Alley	In 2017, Fergusons Downtown Co-Founder, Jen Taler, created   Market in the Alley that would showcase local artisans and vintage curators. While working on renovating the historic 1940’s Fergusons Motel, Jen started hosting an outdoor Market to bring together the community and support for the creators around Las Vegas before the opening of the renovated motel. Her vision was when the renovated motel opened, the old hotel rooms would be small shops owned by locals, embracing the building’s original architecture and design but outfitted to fit each business’s personality.	33	experience	https://www.fergusonsdowntown.com/market-in-the-alley
34	Pawn Plaza	Rick Harrison’s Pawn Plaza is a 2 story retail center in Downtown Las Vegas right next door to the World Famous Gold & Silver Pawn Shop, home of “Pawn Stars!” Home to restaurants, attractions and the best place to go to see Rick Harrison and Chumlee!	34	experience	https://pawnplaza.com/
35	Gold & Silver Pawn Shop	The shop is open every day from 10am - 5pm, we are only closed on Christmas and Thanksgiving, and our Pawn Window for selling is open 24 hours a day. It is always free to visit the Pawn Shop and parking is also free. We are one of the top non-gaming tourist attractions so you can easily just take a cab or ride share here as well. Feel free to take as many pictures as you wish, however due to state law we ask that you refrain from taking pictures toward the pawn counter on your immediate left as you enter and no videos in the shop.	35	shop	https://gspawn.com/
36	Zak Bagan's The Haunted Museum	Zak Bagans developed a profound interest in the paranormal when he was just 10 years old, scouring nearby garage sales with his mom in search of odd and spooky collectibles. His fascination with the unusual evolved into a life-long pursuit for answers about the afterlife, not merely through the study of earth-bound energy, but also through years of science-based research using a multitude of specially engineered equipment to measure fluctuations in the environment… more specifically, to communicate with the dead.Now a pioneer in the paranormal field, Bagans is giving everyone a chance to experience the spine-chilling vibe of the spirit world at the new Zak Bagans’ The Haunted Museum located in downtown Las Vegas.	36	experience	https://thehauntedmuseum.com/
37	11th St Records	Located at the corner of Fremont and 11th in Downtown Las Vegas, 11th Street Records is a hub for music fans, vinyl collectors, musicians and their audiences. We love records. Everything about them. We buy them, sell them, trade them, and, in our in-store studio, record them. We believe record stores are important because of what they’ve meant to any music scene that ever meant anything to us. We seek to be a resource that engages both sides of the musical equation, artists and audiences alike. We are evangelists for vinyl, for what it provides to the listener, and for what it provides to the artists. We want to help sell records for independent labels and bands, and help independent bands make records. We support bands coming through town on tour, and do what we can to make sure they come back. We host vinyl listening parties, in-store performances, stream in-studio performances on our 11th Street Sessions webcast, and seek to do anything and everything we can to return the record store to its traditional, rightful place at the center of any thriving musical community. When you buy records at 11th Street you are part of those efforts, as well as supporting an industry of creative people producing art you can own and collect affordably, most of which is manufactured in the USA. There are lots of reasons to feel good about every vinyl record purchase you make, and there aren’t many things you can buy these days that deliver on so many levels.38. Fremont Street Experience	37	shop	http://www.11thstreetrecords.com/
38	Fremont Street Experience	null	38	experience	https://vegasexperience.com/
39	Slotzilla Zipline	SlotZilla is a 11-story slot machine-inspired zip line attraction and is one of the best things to do in Las Vegas. The multi-million-dollar SlotZilla is the world’s largest slot machine and features Las Vegas icons such as over-sized dice, a martini glass, pink flamingo, coins, video reels, a giant arm and two showgirls.	39	experience	https://vegasexperience.com/slotzilla-zip-line/?utm_source=google&utm_medium=organic
40	Viva Vision Lightshow	The free light shows at Fremont Street Experience are a must-see in Las Vegas! More than 24 million Las Vegas visitors a year take in the Viva Vision light shows at Fremont Street Experience. Guests can enjoy a variety of light shows with high-resolution imagery and state-of-the-art, 600,000-watt, concert-quality sound. The newly-upgraded Viva Vision screen is made up of 49.3 million energy-efficient LED lamps. Viva Vision light shows feature music from The Killers, Imagine Dragons, Tiesto, Steve Aoki, Green Day, Linkin Park and others.	40	experience	https://vegasexperience.com/viva-vision-light-show/
41	Metropolitan Gallery/Art Museum	The Metropolitan Gallery Art Museum offers a great place for creatives to network and obtain services. The Museum hosts over 17,000 square feet of presentable exhibition space for visitors to enjoy and creatives to showcase their work. The museum also offers fine art services such as framing, printing, exhibiting, electronic and imaging services for creative professionals. 	41	experience	https://www.mglv.org/
42	Axehole	Our professional trainers can teach you how to throw an axe, spear, or ninja stars, then arrange a game for you and your friends. Its good fun...Come throw with us! We would be thrilled to meet you. Ages 10 and up are welcome. Mark it off your Bucket List or add it, either way when you leave hands down you will love it! Downtown on Fremont Street, Las Vegas No experience needed. Professional trainers will get anyone hitting Bulls Eye's in no time! Covid 19: Axehole trainers are highly qualified and committed to keeping the thrill of axe throwing as safe as possible. Here's how: Social distancing of 6 feet between groups, trainers, Axe lanes and tables. We are temporarily reducing our capacity by 50%. Lanes extend out 27 FT Hand sanitizer at every lane for customers and staff. Masks for customers are available upon request. Axes and all other equipment will be washed and sanitized between sessions. Compliance with all governmental COVID-19 regulations and best practices.	42	experience	https://axeholevegas.com/
43	Cannabition Cannabis Museum	Cannabition will be a 10,000 square-foot journey featuring more than 20 unique, cannabis inspired art installations celebrating the arts, culture, history, and celebration of the medical and recreational cannabis experience. Whether you’re a local cannabis lover, visiting with friends, or taking your team on a fun trip, Cannabition is the perfect place to learn, explore, and embrace the mainstreaming of cannabis culture.Cannabition cannabis museum provides an immersive, “Instagrammable” experience designed for education, entertainment and hundreds of unique photo opportunities in spaces designed for great picture taking.    	43	experience	https://cannabition.com/visit/
44	Big Rig Jig	Big Rig Jig is constructed from two discarded tanker trucks. The work serves both as a sculpture and an architectural space: visitors may enter the lower truck, climb through the tankers, and emerge to a viewing platform between the rear axles, forty-two feet in the air. Most recently exhibited in the U.K. for Banksy’s Dismaland show, it is now permanently installed in Las Vegas by Tony Hsieh. The work was made possible by a grant from Burning Man, as well as generous gifts from Peter and Gwen Norton, Todd Koons, and numerous donations received over the internet.	44	experience	\N
45	Southern Nevada Museum of Fine Art	Founded in 2002, the Metropolitan Gallery Art Museum is a non-profit 501c3 organization which moved downtown to the Neonopolis in 2008. It presently features over 20,000 square feet of exhibit area, with a main gallery, a special exhibitions gallery, and a small works gallery. The Metropolitan Gallery and Art Museum (formerly The Southern Nevada Museum of Fine Art) provides exhibit space for local, regional and International artists to display their current work.	45	experience	http://snmfa.com/
46	Vintage Vegas Antiques and Collectibles	The New Vintage Vegas has a great selection of: Antiques Mantiques Vintage Clothing Oddities Collectibles Mid Century Furnishings Military Items Casino Items Vintage Toys And just cool stuff. Established in 2012, they have been in business for just a few years and have a great customer following. They have been in and provided props for major motion pictures such as The Hangover 3 and Last Vegas. They are also in a few TV shows such as American Restoration and Spike TV's new antique hunters show, Thrift Hunters. 	46	shop	https://vintagevegas.com/
47	Retro Vegas LLC	This is the home of mid-century modern history, style and all that’s fabulous about Las Vegas. Retro Vegas is full of vintage art, lighting and mid-mod furnishings and accessories. There are treasures and objet d’art to fit every budget and space. We have many pieces that are full of historical significance from some of the most spectacular homes in town. From Danish Modern to Hollywood Regency, our inventory changes all the time. For glitz, glamour and fun, check out Retro Vegas. 	47	shop	http://www.retro-vegas.com/
48	Art District	Some of our neighborhood shops have already begun the road to recovery with social distancing in place. In addition to our restaurants, who have managed to remain open for curbside pickup and delivery, we can now welcome the following retailers back to the new normal	48	experience	https://www.18b.org/
49	Fabrizio Banquet Hall	The story of how we came to be was born out of necessity. We saw that there was a real need in the Las Vegas community for a venue that possessed extreme opulence off the strip but still conveniently located to where all the action was. Creating a unique and charming experience using your imagination is the key to our success. Possibilities and not imitations is why we like to say that at Fabrizio we are the place where events are without any limitations. We are centrally located in the valley, residing in the heart of the arts district in downtown Las Vegas. Fabrizio has a modern decor with Italian finishes and lavishly adorned crystal chandeliers that playfully light up the ballroom and welcome you in the foyer. Creating memories requires the right amount of taste, elegance and style. Don’t just organize a party to remember. Indulge in an unforgettable experience that will leave an imprint on the hearts and minds of your friends and loved ones forever.	49	experience	https://www.fabriziovegas.com/
50	Las Vegas Dream Factory	\N	50	experience	https://lasvegasdreamfactory.com/
51	Bender Jamboree	This decision does not come easy for us. We had hoped to see all your smiling faces sooner than later. Our goal has always been to find a venue for the Jamboree with the ideal combination of venue quality, hotel size & amenities, and overall affordability. We were unable to find the perfect home in time for a 2020 event. Rather than produce an event that does not meet our standards, we have decided to return strong with the best Bender Jamboree ever in 2021	51	experience	http://benderjamboree.com/
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 3, true);


--
-- Name: galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galleries_id_seq', 51, true);


--
-- Name: happy_hr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.happy_hr_id_seq', 81, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labels_id_seq', 10, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 51, true);


--
-- Name: recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recommendations_id_seq', 1, false);


--
-- Name: venues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venues_id_seq', 51, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: galleries galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_pkey PRIMARY KEY (id);


--
-- Name: happy_hr happy_hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.happy_hr
    ADD CONSTRAINT happy_hr_pkey PRIMARY KEY (id);


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: galleries galleries_venue_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_venue_id_foreign FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: happy_hr happy_hr_venue_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.happy_hr
    ADD CONSTRAINT happy_hr_venue_id_foreign FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: venue_labels venue_labels_label_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue_labels
    ADD CONSTRAINT venue_labels_label_id_foreign FOREIGN KEY (label_id) REFERENCES public.labels(id);


--
-- Name: venue_labels venue_labels_venue_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue_labels
    ADD CONSTRAINT venue_labels_venue_id_foreign FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: venues venues_location_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_location_id_foreign FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- PostgreSQL database dump complete
--

