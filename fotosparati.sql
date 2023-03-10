PGDMP         (                z            fotos    14.4    14.4 <    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    49161    fotos    DATABASE     i   CREATE DATABASE fotos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE fotos;
                postgres    false            ?            1259    73760    admin    TABLE     ?   CREATE TABLE public.admin (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    contrasena character varying(250) NOT NULL,
    activo boolean NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false            ?            1259    73759    admin_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.admin_id_seq;
       public          postgres    false    222            5           0    0    admin_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;
          public          postgres    false    221            ?            1259    49207    carro_compra    TABLE     ~   CREATE TABLE public.carro_compra (
    cliente_id integer NOT NULL,
    fotos_id integer NOT NULL,
    id integer NOT NULL
);
     DROP TABLE public.carro_compra;
       public         heap    postgres    false            ?            1259    49220    carro_compra_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.carro_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.carro_compra_id_seq;
       public          postgres    false    213            6           0    0    carro_compra_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.carro_compra_id_seq OWNED BY public.carro_compra.id;
          public          postgres    false    214            ?            1259    49162    cliente    TABLE     ?   CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    contrasena character varying(250) NOT NULL,
    activo boolean NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            ?            1259    49171    cliente_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    209            7           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    210            ?            1259    49184    fotos    TABLE     ?   CREATE TABLE public.fotos (
    id integer NOT NULL,
    contenido character varying(500) NOT NULL,
    titulo character varying(250) NOT NULL,
    activa boolean NOT NULL
);
    DROP TABLE public.fotos;
       public         heap    postgres    false            ?            1259    49183    foto_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.foto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.foto_id_seq;
       public          postgres    false    212            8           0    0    foto_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.foto_id_seq OWNED BY public.fotos.id;
          public          postgres    false    211            ?            1259    65568    lista_deseo    TABLE     |   CREATE TABLE public.lista_deseo (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    foto_id integer NOT NULL
);
    DROP TABLE public.lista_deseo;
       public         heap    postgres    false            ?            1259    65567    lista_deseo_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.lista_deseo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lista_deseo_id_seq;
       public          postgres    false    220            9           0    0    lista_deseo_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.lista_deseo_id_seq OWNED BY public.lista_deseo.id;
          public          postgres    false    219            ?            1259    57376    orden    TABLE     ?   CREATE TABLE public.orden (
    id integer NOT NULL,
    fecha character varying(250) NOT NULL,
    total numeric NOT NULL,
    cliente_id integer NOT NULL
);
    DROP TABLE public.orden;
       public         heap    postgres    false            ?            1259    57390    orden_detalle    TABLE     |   CREATE TABLE public.orden_detalle (
    id integer NOT NULL,
    foto_id integer NOT NULL,
    orden_id integer NOT NULL
);
 !   DROP TABLE public.orden_detalle;
       public         heap    postgres    false            ?            1259    57389    orden_detalle_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orden_detalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orden_detalle_id_seq;
       public          postgres    false    218            :           0    0    orden_detalle_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orden_detalle_id_seq OWNED BY public.orden_detalle.id;
          public          postgres    false    217            ?            1259    57375    orden_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orden_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.orden_id_seq;
       public          postgres    false    216            ;           0    0    orden_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.orden_id_seq OWNED BY public.orden.id;
          public          postgres    false    215            ?           2604    73763    admin id    DEFAULT     d   ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);
 7   ALTER TABLE public.admin ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            |           2604    49221    carro_compra id    DEFAULT     r   ALTER TABLE ONLY public.carro_compra ALTER COLUMN id SET DEFAULT nextval('public.carro_compra_id_seq'::regclass);
 >   ALTER TABLE public.carro_compra ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            z           2604    49172 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            {           2604    49187    fotos id    DEFAULT     c   ALTER TABLE ONLY public.fotos ALTER COLUMN id SET DEFAULT nextval('public.foto_id_seq'::regclass);
 7   ALTER TABLE public.fotos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212                       2604    65571    lista_deseo id    DEFAULT     p   ALTER TABLE ONLY public.lista_deseo ALTER COLUMN id SET DEFAULT nextval('public.lista_deseo_id_seq'::regclass);
 =   ALTER TABLE public.lista_deseo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            }           2604    57379    orden id    DEFAULT     d   ALTER TABLE ONLY public.orden ALTER COLUMN id SET DEFAULT nextval('public.orden_id_seq'::regclass);
 7   ALTER TABLE public.orden ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            ~           2604    57393    orden_detalle id    DEFAULT     t   ALTER TABLE ONLY public.orden_detalle ALTER COLUMN id SET DEFAULT nextval('public.orden_detalle_id_seq'::regclass);
 ?   ALTER TABLE public.orden_detalle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            .          0    73760    admin 
   TABLE DATA           F   COPY public.admin (id, nombre, email, contrasena, activo) FROM stdin;
    public          postgres    false    222   ?@       %          0    49207    carro_compra 
   TABLE DATA           @   COPY public.carro_compra (cliente_id, fotos_id, id) FROM stdin;
    public          postgres    false    213   FA       !          0    49162    cliente 
   TABLE DATA           H   COPY public.cliente (id, nombre, email, contrasena, activo) FROM stdin;
    public          postgres    false    209   cA       $          0    49184    fotos 
   TABLE DATA           >   COPY public.fotos (id, contenido, titulo, activa) FROM stdin;
    public          postgres    false    212   ?A       ,          0    65568    lista_deseo 
   TABLE DATA           >   COPY public.lista_deseo (id, cliente_id, foto_id) FROM stdin;
    public          postgres    false    220   B       (          0    57376    orden 
   TABLE DATA           =   COPY public.orden (id, fecha, total, cliente_id) FROM stdin;
    public          postgres    false    216   )B       *          0    57390    orden_detalle 
   TABLE DATA           >   COPY public.orden_detalle (id, foto_id, orden_id) FROM stdin;
    public          postgres    false    218   ?B       <           0    0    admin_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.admin_id_seq', 2, true);
          public          postgres    false    221            =           0    0    carro_compra_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.carro_compra_id_seq', 23, true);
          public          postgres    false    214            >           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 1, true);
          public          postgres    false    210            ?           0    0    foto_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.foto_id_seq', 7, true);
          public          postgres    false    211            @           0    0    lista_deseo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.lista_deseo_id_seq', 35, true);
          public          postgres    false    219            A           0    0    orden_detalle_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orden_detalle_id_seq', 18, true);
          public          postgres    false    217            B           0    0    orden_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.orden_id_seq', 8, true);
          public          postgres    false    215            ?           2606    73767    admin admin_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    222            ?           2606    49226    carro_compra carro_compra_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.carro_compra
    ADD CONSTRAINT carro_compra_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.carro_compra DROP CONSTRAINT carro_compra_pkey;
       public            postgres    false    213            ?           2606    49179    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    209            ?           2606    49191    fotos foto_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT foto_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.fotos DROP CONSTRAINT foto_pkey;
       public            postgres    false    212            ?           2606    65573    lista_deseo lista_deseo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lista_deseo
    ADD CONSTRAINT lista_deseo_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.lista_deseo DROP CONSTRAINT lista_deseo_pkey;
       public            postgres    false    220            ?           2606    57395     orden_detalle orden_detalle_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.orden_detalle
    ADD CONSTRAINT orden_detalle_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.orden_detalle DROP CONSTRAINT orden_detalle_pkey;
       public            postgres    false    218            ?           2606    57383    orden orden_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.orden DROP CONSTRAINT orden_pkey;
       public            postgres    false    216            ?           2606    49210    carro_compra cliente_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.carro_compra
    ADD CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 A   ALTER TABLE ONLY public.carro_compra DROP CONSTRAINT cliente_id;
       public          postgres    false    3202    209    213            ?           2606    57384    orden cliente_id    FK CONSTRAINT     t   ALTER TABLE ONLY public.orden
    ADD CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 :   ALTER TABLE ONLY public.orden DROP CONSTRAINT cliente_id;
       public          postgres    false    209    3202    216            ?           2606    65574    lista_deseo cliente_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.lista_deseo
    ADD CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 @   ALTER TABLE ONLY public.lista_deseo DROP CONSTRAINT cliente_id;
       public          postgres    false    209    220    3202            ?           2606    49215    carro_compra foto_id    FK CONSTRAINT     t   ALTER TABLE ONLY public.carro_compra
    ADD CONSTRAINT foto_id FOREIGN KEY (fotos_id) REFERENCES public.fotos(id);
 >   ALTER TABLE ONLY public.carro_compra DROP CONSTRAINT foto_id;
       public          postgres    false    3204    212    213            ?           2606    57396    orden_detalle foto_id    FK CONSTRAINT     t   ALTER TABLE ONLY public.orden_detalle
    ADD CONSTRAINT foto_id FOREIGN KEY (foto_id) REFERENCES public.fotos(id);
 ?   ALTER TABLE ONLY public.orden_detalle DROP CONSTRAINT foto_id;
       public          postgres    false    218    3204    212            ?           2606    65579    lista_deseo foto_id    FK CONSTRAINT     r   ALTER TABLE ONLY public.lista_deseo
    ADD CONSTRAINT foto_id FOREIGN KEY (foto_id) REFERENCES public.fotos(id);
 =   ALTER TABLE ONLY public.lista_deseo DROP CONSTRAINT foto_id;
       public          postgres    false    212    220    3204            ?           2606    57401    orden_detalle orden_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.orden_detalle
    ADD CONSTRAINT orden_id FOREIGN KEY (orden_id) REFERENCES public.orden(id);
 @   ALTER TABLE ONLY public.orden_detalle DROP CONSTRAINT orden_id;
       public          postgres    false    218    3208    216            .   ?   x?3??)?,??%??i?%??z?????&?@?Y?eș???VT	??T???? U??qqq Ҵ?      %      x?????? ? ?      !   ;   x?3?tI,?L?L?????9z??????&@?Y?e???X??ș"QXPA? ?      $   H   x?3?4??*H???I,?,?2?4s????<sNs0ϧ4/?5?4s???sRA?9?"a?E)?@~? ??o      ,      x?3?4?4?????? ?[      (   z   x?e??C!?3م(q?gN???Q???*=?۲P?W`B3???UP?pr??o??GZg(V????{YƸt?_?	???`???nU|B?5]???????ܴ?ڠq2R???`"zjW.?      *   Q   x???1??L1?? !???_?9B?`8K+(%s??SEߑQ|??[/???e?&V?Ž??I??C??????????Z     