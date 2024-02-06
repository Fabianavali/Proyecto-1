
#1#Cómo identificar la clave primaria y los registros únicos:
#select id, count(*)
#from learndata_crudo.raw_productos_wocommerce
#GROUP BY id;
#Cómo determinar la longitud de una cadena de caracteres:
#select length(tipo)
#from learndata_crudo.raw_productos_wocommerce;
#--Tipos de ndicarores: Yes/No, TRUE or False--


CREATE TABLE learndata.dim_producto (
pk_idproducto int,
tipo_producto varchar(50),
nombre_producto varchar(100),
ind_publicado int,
ind_visibilidad_catalogo int,
ind_impuesto int,
tipo_impuesto varchar(10),
ind_inventario int,
ind_vendido_indv int,
imp_venta decimal(10,2),
primary key (pk_idproducto)
);

INSERT INTO learndata.dim_producto
SELECT 
id,
tipo,
nombre,
publicado,
case 
	when visibilidad_catalogo ='visible' then 1
    else 0
end ind_visibilidad_catalogo,
case 
	when estado_impuesto ='none' then 0
    else 1
end ind_vend_indv,
clase_impuesto,
en_inventario,
vendido_individualmente,
precio_normal
from 
learndata_crudo.raw_productos_wocommerce
where id is not null
;

SELECT date_created,
#Casteo: string-->date
STR_TO_DATE(date_created,"%d/%m/%Y %H:%i:%s") fecha,
billing from learndata_crudo.raw_clientes_wocommerce;






