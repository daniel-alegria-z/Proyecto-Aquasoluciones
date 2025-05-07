--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    cedula character varying NOT NULL,
    nombre_completo character varying NOT NULL,
    direccion character varying,
    celular character varying NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: contrato_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato_empleado (
    id_contrato integer NOT NULL,
    id_empleado integer NOT NULL,
    tipo_contrato character varying NOT NULL,
    fecha_inicio character varying NOT NULL,
    fecha_fin character varying NOT NULL,
    sueldo character varying NOT NULL
);


ALTER TABLE public.contrato_empleado OWNER TO postgres;

--
-- Name: contrato_empleado_id_contrato_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_empleado_id_contrato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contrato_empleado_id_contrato_seq OWNER TO postgres;

--
-- Name: contrato_empleado_id_contrato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_empleado_id_contrato_seq OWNED BY public.contrato_empleado.id_contrato;


--
-- Name: contrato_empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contrato_empleado_id_empleado_seq OWNER TO postgres;

--
-- Name: contrato_empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_empleado_id_empleado_seq OWNED BY public.contrato_empleado.id_empleado;


--
-- Name: contrato_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato_servicio (
    id_servicio integer NOT NULL,
    id_cliente integer NOT NULL,
    tipo_servicio character varying NOT NULL,
    fecha_inicio character varying NOT NULL,
    fecha_fin character varying NOT NULL
);


ALTER TABLE public.contrato_servicio OWNER TO postgres;

--
-- Name: contrato_servicio_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_servicio_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contrato_servicio_id_cliente_seq OWNER TO postgres;

--
-- Name: contrato_servicio_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_servicio_id_cliente_seq OWNED BY public.contrato_servicio.id_cliente;


--
-- Name: contrato_servicio_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_servicio_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contrato_servicio_id_servicio_seq OWNER TO postgres;

--
-- Name: contrato_servicio_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_servicio_id_servicio_seq OWNED BY public.contrato_servicio.id_servicio;


--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id integer NOT NULL,
    cedula character varying NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    celular character varying NOT NULL,
    email character varying,
    cargo character varying NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleado_id_seq OWNER TO postgres;

--
-- Name: empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_id_seq OWNED BY public.empleado.id;


--
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    id_cliente integer NOT NULL,
    fecha_vencimiento character varying NOT NULL,
    fecha_aviso character varying,
    total character varying NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- Name: factura_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factura_id_cliente_seq OWNER TO postgres;

--
-- Name: factura_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_cliente_seq OWNED BY public.factura.id_cliente;


--
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factura_id_factura_seq OWNER TO postgres;

--
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_factura_seq OWNED BY public.factura.id_factura;


--
-- Name: lectura_medidor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectura_medidor (
    id_lectura integer NOT NULL,
    id_medidor integer NOT NULL,
    fecha_lectura character varying NOT NULL,
    lectura_actual character varying NOT NULL,
    lectura_anterior character varying NOT NULL
);


ALTER TABLE public.lectura_medidor OWNER TO postgres;

--
-- Name: lectura_medidor_id_lectura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectura_medidor_id_lectura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectura_medidor_id_lectura_seq OWNER TO postgres;

--
-- Name: lectura_medidor_id_lectura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectura_medidor_id_lectura_seq OWNED BY public.lectura_medidor.id_lectura;


--
-- Name: lectura_medidor_id_medidor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectura_medidor_id_medidor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectura_medidor_id_medidor_seq OWNER TO postgres;

--
-- Name: lectura_medidor_id_medidor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectura_medidor_id_medidor_seq OWNED BY public.lectura_medidor.id_medidor;


--
-- Name: medidor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medidor (
    id_medidor integer NOT NULL,
    id_cliente integer NOT NULL,
    numero_serie character varying NOT NULL
);


ALTER TABLE public.medidor OWNER TO postgres;

--
-- Name: medidor_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medidor_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medidor_id_cliente_seq OWNER TO postgres;

--
-- Name: medidor_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medidor_id_cliente_seq OWNED BY public.medidor.id_cliente;


--
-- Name: medidor_id_medidor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medidor_id_medidor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medidor_id_medidor_seq OWNER TO postgres;

--
-- Name: medidor_id_medidor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medidor_id_medidor_seq OWNED BY public.medidor.id_medidor;


--
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id_pago integer NOT NULL,
    id_factura integer NOT NULL,
    fecha character varying NOT NULL,
    monto character varying NOT NULL
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- Name: pagos_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagos_id_factura_seq OWNER TO postgres;

--
-- Name: pagos_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_id_factura_seq OWNED BY public.pagos.id_factura;


--
-- Name: pagos_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagos_id_pago_seq OWNER TO postgres;

--
-- Name: pagos_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_id_pago_seq OWNED BY public.pagos.id_pago;


--
-- Name: reporte_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporte_servicio (
    id_reporte integer NOT NULL,
    id_cliente integer NOT NULL,
    problema character varying NOT NULL,
    fecha_reporte character varying NOT NULL,
    estado character varying NOT NULL
);


ALTER TABLE public.reporte_servicio OWNER TO postgres;

--
-- Name: reporte_servicio_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reporte_servicio_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reporte_servicio_id_cliente_seq OWNER TO postgres;

--
-- Name: reporte_servicio_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reporte_servicio_id_cliente_seq OWNED BY public.reporte_servicio.id_cliente;


--
-- Name: reporte_servicio_id_reporte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reporte_servicio_id_reporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reporte_servicio_id_reporte_seq OWNER TO postgres;

--
-- Name: reporte_servicio_id_reporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reporte_servicio_id_reporte_seq OWNED BY public.reporte_servicio.id_reporte;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_completo character varying NOT NULL,
    correo character varying NOT NULL,
    contrasena character varying NOT NULL,
    usuario character varying NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: contrato_empleado id_contrato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_empleado ALTER COLUMN id_contrato SET DEFAULT nextval('public.contrato_empleado_id_contrato_seq'::regclass);


--
-- Name: contrato_empleado id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.contrato_empleado_id_empleado_seq'::regclass);


--
-- Name: contrato_servicio id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_servicio ALTER COLUMN id_servicio SET DEFAULT nextval('public.contrato_servicio_id_servicio_seq'::regclass);


--
-- Name: contrato_servicio id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_servicio ALTER COLUMN id_cliente SET DEFAULT nextval('public.contrato_servicio_id_cliente_seq'::regclass);


--
-- Name: empleado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN id SET DEFAULT nextval('public.empleado_id_seq'::regclass);


--
-- Name: factura id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id_factura SET DEFAULT nextval('public.factura_id_factura_seq'::regclass);


--
-- Name: factura id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id_cliente SET DEFAULT nextval('public.factura_id_cliente_seq'::regclass);


--
-- Name: lectura_medidor id_lectura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_medidor ALTER COLUMN id_lectura SET DEFAULT nextval('public.lectura_medidor_id_lectura_seq'::regclass);


--
-- Name: lectura_medidor id_medidor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_medidor ALTER COLUMN id_medidor SET DEFAULT nextval('public.lectura_medidor_id_medidor_seq'::regclass);


--
-- Name: medidor id_medidor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medidor ALTER COLUMN id_medidor SET DEFAULT nextval('public.medidor_id_medidor_seq'::regclass);


--
-- Name: medidor id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medidor ALTER COLUMN id_cliente SET DEFAULT nextval('public.medidor_id_cliente_seq'::regclass);


--
-- Name: pagos id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id_pago SET DEFAULT nextval('public.pagos_id_pago_seq'::regclass);


--
-- Name: pagos id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id_factura SET DEFAULT nextval('public.pagos_id_factura_seq'::regclass);


--
-- Name: reporte_servicio id_reporte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_servicio ALTER COLUMN id_reporte SET DEFAULT nextval('public.reporte_servicio_id_reporte_seq'::regclass);


--
-- Name: reporte_servicio id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_servicio ALTER COLUMN id_cliente SET DEFAULT nextval('public.reporte_servicio_id_cliente_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, cedula, nombre_completo, direccion, celular) FROM stdin;
1	64556465456	Daniel Alegria	Calle 13	3152451224
2	456465465	Yurani Marcela Riascos	Lille 12	3162563224
3	89865464	Oscar Chamorro	Delta 12	3252541425
4	14525546	Luisa Velasco	Calle 21321	3215465878
5	652356846	Osvaldo García	Calle 12	3022562114
\.


--
-- Data for Name: contrato_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrato_empleado (id_contrato, id_empleado, tipo_contrato, fecha_inicio, fecha_fin, sueldo) FROM stdin;
1	1	Indefinido	2024-01-15	2030-12-31	3000
2	2	Temporal	2024-03-01	2024-09-01	2500
3	3	Por Obra	2024-02-10	2025-02-10	2800
4	4	Indefinido	2023-11-20	2033-11-20	3200
5	5	Practicas	2024-06-01	2024-12-01	1200
\.


--
-- Data for Name: contrato_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contrato_servicio (id_servicio, id_cliente, tipo_servicio, fecha_inicio, fecha_fin) FROM stdin;
1	1	Suministro de Agua Potable	2015-01-01	2025-12-31
2	2	Mantenimiento de Red de Distribucion	2015-02-15	2025-11-30
3	3	Instalacion de Medidor	2015-03-10	2025-10-15
4	4	Servicio de Desinfeccion	2015-04-20	2025-09-30
5	5	Control de Calidad del Agua	2015-05-05	2025-08-20
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (id, cedula, nombre, apellido, celular, email, cargo) FROM stdin;
4	5566778899	Ana	Martinez	0998765432	ana.martinez@example.com	Contadora
2	0987654321	Maria	Gomez	0912345678	maria.gomez@example.com	Administradora
3	1122334455	Carlos	Rodriguez	0954321876	carlos.rodriguez@example.com	Supervisor
5	6677889900	Martin	Lopez	0943216789	pedro.lopez@example.com	Vendedor
1	1234567890	Juan	Perez	0987654321	juan.perez@example.com	Gerente
\.


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (id_factura, id_cliente, fecha_vencimiento, fecha_aviso, total) FROM stdin;
1	1	2025-04-15	2025-04-10	250.75
2	2	2025-05-01	2025-04-26	180.50
3	3	2025-03-30	2025-03-25	320.00
4	4	2025-04-20	2025-04-15	150.25
5	5	2025-04-10	\N	500.00
\.


--
-- Data for Name: lectura_medidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectura_medidor (id_lectura, id_medidor, fecha_lectura, lectura_actual, lectura_anterior) FROM stdin;
1	1	2025-03-01	1500	1450
2	2	2025-03-01	1800	1750
3	3	2025-03-01	2100	2050
4	4	2025-03-01	1300	1210
5	5	2025-03-01	1750	1650
\.


--
-- Data for Name: medidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medidor (id_medidor, id_cliente, numero_serie) FROM stdin;
1	1	MD-001-2024
2	2	MD-002-2024
3	3	MD-003-2024
4	4	MD-004-2024
5	5	MD-005-2024
\.


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id_pago, id_factura, fecha, monto) FROM stdin;
1	1	2015-12-26	15000
2	2	2016-12-20	18000
3	3	2018-01-03	21000
4	4	2018-12-28	24000
5	5	2020-01-03	25500
\.


--
-- Data for Name: reporte_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reporte_servicio (id_reporte, id_cliente, problema, fecha_reporte, estado) FROM stdin;
1	1	Baja presi¢n de agua en la zona residencial	2018-05-15	Solucionado
2	2	Fuga detectada en la red de distribuci¢n	2018-10-10	Pendiente
3	3	Problema con la calidad del agua potable	2018-04-25	Solucionado
4	4	Contador de agua da¤ado en domicilio	2018-04-30	Solucionado
5	5	Deben limpiar los tanques de almacenamiento, llega agua con part¡culas	2018-05-05	Pendiente
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre_completo, correo, contrasena, usuario) FROM stdin;
8	Daniel	daniel@xmail.com	1234	dann
\.


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 9, true);


--
-- Name: contrato_empleado_id_contrato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrato_empleado_id_contrato_seq', 7, true);


--
-- Name: contrato_empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrato_empleado_id_empleado_seq', 1, false);


--
-- Name: contrato_servicio_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrato_servicio_id_cliente_seq', 1, false);


--
-- Name: contrato_servicio_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrato_servicio_id_servicio_seq', 9, true);


--
-- Name: empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_id_seq', 17, true);


--
-- Name: factura_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_cliente_seq', 1, false);


--
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_factura_seq', 8, true);


--
-- Name: lectura_medidor_id_lectura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectura_medidor_id_lectura_seq', 6, true);


--
-- Name: lectura_medidor_id_medidor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectura_medidor_id_medidor_seq', 1, false);


--
-- Name: medidor_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medidor_id_cliente_seq', 1, false);


--
-- Name: medidor_id_medidor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medidor_id_medidor_seq', 6, true);


--
-- Name: pagos_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_factura_seq', 1, false);


--
-- Name: pagos_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_pago_seq', 7, true);


--
-- Name: reporte_servicio_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reporte_servicio_id_cliente_seq', 1, false);


--
-- Name: reporte_servicio_id_reporte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reporte_servicio_id_reporte_seq', 7, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 8, true);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: contrato_empleado contrato_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_empleado
    ADD CONSTRAINT contrato_empleado_pkey PRIMARY KEY (id_contrato);


--
-- Name: contrato_servicio contrato_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_servicio
    ADD CONSTRAINT contrato_servicio_pkey PRIMARY KEY (id_servicio);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- Name: lectura_medidor lectura_medidor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_medidor
    ADD CONSTRAINT lectura_medidor_pkey PRIMARY KEY (id_lectura);


--
-- Name: medidor medidor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medidor
    ADD CONSTRAINT medidor_pkey PRIMARY KEY (id_medidor);


--
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id_pago);


--
-- Name: reporte_servicio reporte_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_servicio
    ADD CONSTRAINT reporte_servicio_pkey PRIMARY KEY (id_reporte);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: contrato_empleado contrato_empleado_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_empleado
    ADD CONSTRAINT contrato_empleado_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id) NOT VALID;


--
-- Name: contrato_servicio contrato_servicio_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato_servicio
    ADD CONSTRAINT contrato_servicio_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id) NOT VALID;


--
-- Name: factura factura_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: lectura_medidor lectura_medidor_id_medidor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_medidor
    ADD CONSTRAINT lectura_medidor_id_medidor_fkey FOREIGN KEY (id_medidor) REFERENCES public.medidor(id_medidor);


--
-- Name: medidor medidor_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medidor
    ADD CONSTRAINT medidor_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- Name: pagos pagos_id_factura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura);


--
-- Name: reporte_servicio reporte_servicio_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte_servicio
    ADD CONSTRAINT reporte_servicio_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- PostgreSQL database dump complete
--

