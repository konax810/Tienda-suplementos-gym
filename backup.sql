--
-- PostgreSQL database dump
--

\restrict F3XOQuIPbmBlYOrFIn0YOCalUiCihAYLlGvdhHiia0X978bZ7vXTGHKQ7OJlhhl

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

-- Started on 2026-10-27 16:15:03

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
-- TOC entry 218 (class 1259 OID 41160)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(100) NOT NULL,
    descripcion text DEFAULT 'Sin descripción'::text
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41159)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;


--
-- TOC entry 222 (class 1259 OID 41181)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41180)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 221
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 224 (class 1259 OID 41190)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying(150) NOT NULL,
    precio numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    id_categoria integer NOT NULL,
    id_proveedor integer NOT NULL,
    CONSTRAINT productos_precio_check CHECK ((precio > (0)::numeric)),
    CONSTRAINT productos_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41189)
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_producto_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 223
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- TOC entry 220 (class 1259 OID 41172)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id_proveedor integer NOT NULL,
    nombre_empresa character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(150) NOT NULL
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41171)
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_id_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedores_id_proveedor_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 219
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_proveedor_seq OWNED BY public.proveedores.id_proveedor;


--
-- TOC entry 226 (class 1259 OID 41209)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id_venta integer NOT NULL,
    fecha_venta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cantidad integer NOT NULL,
    total_pagado numeric(10,2) NOT NULL,
    id_cliente integer NOT NULL,
    id_producto integer NOT NULL,
    CONSTRAINT ventas_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT ventas_total_pagado_check CHECK ((total_pagado >= (0)::numeric))
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 41208)
-- Name: ventas_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ventas_id_venta_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 225
-- Name: ventas_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_id_venta_seq OWNED BY public.ventas.id_venta;


--
-- TOC entry 4762 (class 2604 OID 41163)
-- Name: categorias id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 41184)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 41193)
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 41175)
-- Name: proveedores id_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id_proveedor SET DEFAULT nextval('public.proveedores_id_proveedor_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 41212)
-- Name: ventas id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.ventas_id_venta_seq'::regclass);


--
-- TOC entry 4939 (class 0 OID 41160)
-- Dependencies: 218
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, nombre_categoria, descripcion) FROM stdin;
1	Proteínas	Proteína de suero de leche, aislada y vegetal para recuperación muscular
2	Creatinas	Creatina monohidratada y micronizada para aumento de fuerza y potencia
3	Pre-entrenos	Fórmulas de energía, enfoque y bombeo para entrenamientos intensos
4	Aminoácidos	BCAA y EAA para prevenir el catabolismo y mejorar la síntesis de proteína
5	Multivitamínicos	Vitaminas y minerales esenciales para la salud general del deportista
6	Quemadores de Grasa	Suplementos lipotrópicos y termogénicos para acelerar el metabolismo
7	Accesorios	Cinturones, correas de agarre, shakers y vendas para entrenamiento
8	Ropa Deportiva	Camisetas, pantalonetas y gorras optimizadas para el gimnasio
9	Snacks Proteicos	Barras, galletas y mantequillas de maní enriquecidas con proteína
10	Recuperadores	Fórmulas post-entrenamiento con carbohidratos simples y electrolitos
\.


--
-- TOC entry 4943 (class 0 OID 41181)
-- Dependencies: 222
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, nombre_cliente, correo, telefono) FROM stdin;
1	Juan Sebastián Escobar	juan.escobar@mail.com	+573101234567
2	Carlos Andrés Pérez	carlos.perez@mail.com	+573112345678
3	María Fernanda Gómez	maria.gomez@mail.com	+573123456789
4	Laura Daniela Rodríguez	laura.rodriguez@mail.com	+573134567890
5	Andrés Felipe Martínez	andres.martinez@mail.com	+573145678901
6	Sofía Elena Torres	sofia.torres@mail.com	+573156789012
7	Diego Alejandro López	diego.lopez@mail.com	+573167890123
8	Camila Andrea Vargas	camila.vargas@mail.com	+573178901234
9	Gimnasio Smart Fit Central	contacto@smartfitcentral.com	+573189012345
10	Gimnasio Bodytech Neiva	recepcion@bodytechneiva.com	+573190123456
\.


--
-- TOC entry 4945 (class 0 OID 41190)
-- Dependencies: 224
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, nombre_producto, precio, stock, id_categoria, id_proveedor) FROM stdin;
1	Gold Standard 100% Whey 5lbs	340000.00	25	1	1
2	Creatina Monohidratada Drive 300g	120000.00	40	2	6
3	C4 Original Pre-Workout 30 serv	150000.00	15	3	4
4	Best Protein 5lbs ProScience	290000.00	20	1	5
5	AminoX BCAA 435g	110000.00	30	4	7
6	Opti-Men Multivitaminico 90 tab	95000.00	18	5	1
7	Shaker Mezclador Pro 700ml	25000.00	50	7	3
8	Cinturón de Cuero para Levantamiento	85000.00	12	7	8
9	Barra Proteica Quest Bar Caja x12	135000.00	10	9	10
10	ISO100 Hydrolyzed Whey 5lbs	380000.00	8	1	9
\.


--
-- TOC entry 4941 (class 0 OID 41172)
-- Dependencies: 220
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id_proveedor, nombre_empresa, telefono, correo) FROM stdin;
1	Optimum Nutrition Colombia	+573001112233	contacto@oncolombia.com
2	Muscletech Distribución	+573002223344	ventas@muscletech.co
3	Smart Nutrition S.A.S.	+573003334455	pedidos@smartnutrition.com
4	FitLab Importaciones	+573004445566	distribucion@fitlab.com
5	ProScience Suplementos	+573005556677	info@proscience.com.co
6	Nutrex Research Latam	+573006667788	contacto@nutrex.lat
7	BSN Nutrition Direct	+573007778899	ventas@bsnnutrition.co
8	Universal Nutrition CO	+573008889900	servicio@universal.com.co
9	Dymatize Colombia	+573009990011	soporte@dymatize.co
10	GNC Colombia S.A.	+573010001122	compras@gnc.com.co
\.


--
-- TOC entry 4947 (class 0 OID 41209)
-- Dependencies: 226
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id_venta, fecha_venta, cantidad, total_pagado, id_cliente, id_producto) FROM stdin;
1	2026-10-01 10:15:00	1	340000.00	1	1
2	2026-10-02 11:30:00	2	240000.00	2	2
3	2026-10-03 15:45:00	1	150000.00	3	3
4	2026-10-04 09:20:00	1	290000.00	4	4
5	2026-10-05 16:10:00	3	75000.00	5	7
6	2026-10-06 14:00:00	1	95000.00	6	6
7	2026-10-07 18:30:00	2	270000.00	7	9
8	2026-10-08 08:50:00	1	380000.00	8	10
9	2026-10-09 12:15:00	5	600000.00	9	2
10	2026-10-10 17:05:00	2	170000.00	10	8
\.


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 10, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 221
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 10, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 223
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 10, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 219
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_proveedor_seq', 10, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 225
-- Name: ventas_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_id_venta_seq', 10, true);


--
-- TOC entry 4774 (class 2606 OID 41170)
-- Name: categorias categorias_nombre_categoria_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_categoria_key UNIQUE (nombre_categoria);


--
-- TOC entry 4776 (class 2606 OID 41168)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4782 (class 2606 OID 41188)
-- Name: clientes clientes_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_correo_key UNIQUE (correo);


--
-- TOC entry 4784 (class 2606 OID 41186)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4786 (class 2606 OID 41197)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4778 (class 2606 OID 41179)
-- Name: proveedores proveedores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_correo_key UNIQUE (correo);


--
-- TOC entry 4780 (class 2606 OID 41177)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 4788 (class 2606 OID 41217)
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 4789 (class 2606 OID 41198)
-- Name: productos fk_productos_categorias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4790 (class 2606 OID 41203)
-- Name: productos fk_productos_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4791 (class 2606 OID 41218)
-- Name: ventas fk_ventas_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4792 (class 2606 OID 41223)
-- Name: ventas fk_ventas_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2026-10-27 16:15:04

--
-- PostgreSQL database dump complete
--

\unrestrict F3XOQuIPbmBlYOrFIn0YOCalUiCihAYLlGvdhHiia0X978bZ7vXTGHKQ7OJlhhl

