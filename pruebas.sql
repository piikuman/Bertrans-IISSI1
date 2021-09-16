
-- ////////////////////     PRUEBAS     ////////////////////

SET SERVEROUTPUT ON

/


DECLARE
salida BOOLEAN :=true;salidaEsperada BOOLEAN :=true;pedido pedidos%ROWTYPE;

b BOOLEAN :=true;
m BOOLEAN:= false;
id_u INTEGER;
id_u1 INTEGER;
id_e INTEGER;
id_t INTEGER;
id_t1 INTEGER;
id_p INTEGER;
id_p1 INTEGER;
id_f INTEGER;
id_d INTEGER;
id_d1 INTEGER;
id_pd INTEGER;
id_pd1 INTEGER;
id_pd2 INTEGER;
id_pd3 INTEGER;
id_pd4 INTEGER;
id_des INTEGER;
id_lp INTEGER;

q NUMBER;

BEGIN

--INICIALIZAR TODAS LAS TABLAS
PRUEBAS_LINEASPEDIDO.INICIALIZAR;
PRUEBAS_DESCUENTOS.INICIALIZAR;
PRUEBAS_PRODUCTOS.INICIALIZAR;
PRUEBAS_DISTRIBUIDORES.INICIALIZAR;
PRUEBAS_FACTURAS.INICIALIZAR;
PRUEBAS_PEDIDOS.INICIALIZAR;
PRUEBAS_TRANSPORTISTAS.INICIALIZAR;
PRUEBAS_EMPLEADOS.INICIALIZAR;
PRUEBAS_USUARIOS.INICIALIZAR;
PRUEBAS_PERSONAS.INICIALIZAR;
PRUEBAS_TRANSPORTISTAS.INICIALIZAR;



--                             PRUEBAS 



--TABLA PERSONAS

 DBMS_OUTPUT.put_line('//////////////////////TABLA PERSONAS////////////////////');

 
PRUEBAS_PERSONAS.insertar('Prueba personas 1: Insertar todo OK','30648008L','Antonio tramos', TO_DATE('1990-05-06', 'YYYY-MM-DD'),'ag45@hotmail.com','954258147',b);
PRUEBAS_PERSONAS.insertar('Prueba personas 2: Insertar DNI no valido','30896354','Adolfo Ramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolf@hotmail.com','955789456',m);
PRUEBAS_PERSONAS.insertar('Prueba personas 3: Insertar email no valido','30896354E','Adolfo Ramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolfhotmail.com','955789456',m);
PRUEBAS_PERSONAS.insertar('Prueba personas 4: Insertar telefono no valido','30896354E','Adolfo Ramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolf@hotmail.com','255789456',m);
PRUEBAS_PERSONAS.actualizar('Prueba personas 5: Actualizar todo OK','30648008L','Antonio tramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'anton@hotmail.com','655789456',b);
PRUEBAS_PERSONAS.actualizar('Prueba personas 6: Actualizar DNI no valido','30A48008L','Antonio tramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolf@hotmail.com','655789456',m);
PRUEBAS_PERSONAS.actualizar('Prueba personas 7: Actualizar email no valido','30648008L','Adolfo Ramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolf@hotmailcom','655789456',m);
PRUEBAS_PERSONAS.actualizar('Prueba personas 8: Actualizar telefono no valido','30648008L','Adolfo Ramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolf@hotmailcom','5789456',m);
PRUEBAS_PERSONAS.insertar('Prueba personas 9: Insertar todo OK','30896354E','Adolfo Ramos', TO_DATE('1955-04-04', 'YYYY-MM-DD'),'adolf@hotmail.com','955789456',b);
PRUEBAS_PERSONAS.eliminar ('Prueba personas 10: Eliminar todo OK','30896354E' ,true);
PRUEBAS_PERSONAS.insertar('Prueba personas 11: Insertar todo OK','30896354E','Adolfo Ramos', TO_DATE('1960-09-04', 'YYYY-MM-DD'),'adolf@hotmail.com','955459786',b);
PRUEBAS_PERSONAS.insertar('Prueba personas 12: Insertar todo OK','30896355E','ALFONSO GUERRA', TO_DATE('1970-07-08', 'YYYY-MM-DD'),'aGUERRA@hotmail.com','678459786',b);
PRUEBAS_PERSONAS.insertar('Prueba personas 12: Insertar todo OK','30896356E','MIGUEL PEREZ', TO_DATE('1990-05-08', 'YYYY-MM-DD'),'migueR@hotmail.com','600059786',b);



--TABLA USUARIO

DBMS_OUTPUT.put_line('//////////////////////TABLA USUARIOS/////////////////////');

PRUEBAS_USUARIOS.insertar ('Prueba usuarios 1: Insertar todo OK','password','calle vaticano nº4','30648008L',b);
id_u1:=SECUENCIA_ID_USUARIO.currval;
PRUEBAS_USUARIOS.insertar ('Prueba usuarios 2: Insertar todo OK','password','calle vaticano nº4','30896354E',b);
id_u:=SECUENCIA_ID_USUARIO.currval;
PRUEBAS_USUARIOS.ACTUALIZAR('Prueba usuarios 3: Actualizar todo OK',id_u,'password2','calle emilio lemos nº6','30896354E',b);
PRUEBAS_USUARIOS.ELIMINAR('Prueba usuarios 4: Eliminar todo OK',id_u,b);
PRUEBAS_USUARIOS.insertar ('Prueba usuarios 5: Insertar todo OK','password','calle vaticano nº4','30896354E',b);
id_u:=SECUENCIA_ID_USUARIO.currval;


--TABLA EMPLEADO

DBMS_OUTPUT.put_line('//////////////////////TABLA EMPLEADO////////////////////');

PRUEBAS_EMPLEADOS.INSERTAR ('Prueba empleados 1 : Insertar todo OK',700,TO_DATE('2010-05-08', 'YYYY-MM-DD'),null,0,'30896356E',b);
PRUEBAS_EMPLEADOS.INSERTAR ('Prueba empleados 2 : Insertar sueldo negativo',-300,TO_DATE('1990-05-08', 'YYYY-MM-DD'),TO_DATE('2015-05-10', 'YYYY-MM-DD'),1,'30896355E',m);
PRUEBAS_EMPLEADOS.INSERTAR ('Prueba empleados 3 : Insertar esAdministrador distinto de 1 o 0',1200.50,TO_DATE('1990-05-08', 'YYYY-MM-DD'),TO_DATE('2015-05-10', 'YYYY-MM-DD'),4,'30896355E',m);
PRUEBAS_EMPLEADOS.INSERTAR ('Prueba empleados 4 : Insertar todo OK',1200.50,TO_DATE('1990-05-08', 'YYYY-MM-DD'),TO_DATE('2015-05-10', 'YYYY-MM-DD'),0,'30896355E',b);
id_e:=secuencia_id_empleado.currval;
PRUEBAS_EMPLEADOS.ACTUALizaR ('Prueba empleados 5 : Actualizar todo OK',id_e,1500.50,TO_DATE('1990-05-08', 'YYYY-MM-DD'),TO_DATE('2015-05-10', 'YYYY-MM-DD'),1,'30896355E',b);
PRUEBAS_EMPLEADOS.ACTUALizaR ('Prueba empleados 6 : Actualizar sueldo negativo',id_e,-1500.50,TO_DATE('1990-05-08', 'YYYY-MM-DD'),TO_DATE('2015-05-10', 'YYYY-MM-DD'),1,'30896355E',m);
PRUEBAS_EMPLEADOS.ACTUALizaR ('Prueba empleados 6 : Actualizar esAdministrador distinto de 1 o 0',id_e,1500.50,TO_DATE('1990-05-08', 'YYYY-MM-DD'),TO_DATE('2015-05-10', 'YYYY-MM-DD'),9,'30896355E',m);
PRUEBAS_EMPLEADOS.eliminar ('Prueba empleados  : eliminar todo OK',id_e,b);

--TABLA TRANSPORTISTA

DBMS_OUTPUT.put_line('//////////////////////TABLA TRANSPORTISTAS////////////////////');

PRUEBAS_TRANSPORTISTAS.insertar ('Prueba transportistas 1 : Insertar todo OK','john tadeo','A78945612',b);
id_t1:=SECUENCIA_ID_TRANSPORTISTA.currval;
PRUEBAS_TRANSPORTISTAS.insertar ('Prueba transportistas 2 : Insertar todo OK','javier camara','Y35794621',b);
id_t:=SECUENCIA_ID_TRANSPORTISTA.currval;
PRUEBAS_TRANSPORTISTAS.actualizar ('Prueba transportistas 3 : Actualizar todo OK',id_t,'javier camara','Y12345678',b);
PRUEBAS_TRANSPORTISTAS.actualizar ('Prueba transportistas 4 : Actualizar cif no valido',id_t,'javier camara','Y3579462A',m);
PRUEBAS_TRANSPORTISTAS.ELIMINAR('Prueba transportistas 5 : Eliminar todo OK',id_t1,b);
PRUEBAS_TRANSPORTISTAS.insertar ('Prueba transportistas 6 : Insertar todo OK','john tadeo','A78945612',b);
id_t1:=SECUENCIA_ID_TRANSPORTISTA.currval;


--TABLA PEDIDOS

DBMS_OUTPUT.put_line('//////////////////////TABLA PEDIDOS////////////////////');

PRUEBAS_PEDIDOS.insertar ('Prueba pedidos 1  : Insertar todo OK','no confirmado',23.55,'en efectivo','calle pili nº8',id_u,id_t ,b);
id_p:=SECUENCIA_ID_PEDIDO.currval;
PRUEBAS_PEDIDOS.ACTUALIZAR('Prueba pedidos 2 : Entregar pedido no confimado(trigger)',id_p,'entregado',50,'en efectivo','calle pili nº8',m);
PRUEBAS_PEDIDOS.insertar ('Prueba pedidos 3 : Insertar estado no válido','p',50,'en efectivo','calle pili nº8',id_u1,id_t1 ,m);
PRUEBAS_PEDIDOS.insertar ('Prueba pedidos 4 : Insertar forma de pago no válida','no confirmado',50,'billetes','calle pili nº8',id_u1,id_t1 ,m);
PRUEBAS_PEDIDOS.insertar ('Prueba pedidos 5 : Insertar pedido ya entregado(trigger)','entregado',50,'en efectivo','calle pili nº8',id_u1,id_t1 ,m);
PRUEBAS_PEDIDOS.insertar ('Prueba pedidos 6 : Insertar pago tarjeta y dirección null(trigger)','no confirmado',50,'tarjeta de crédito',null,id_u1,id_t1 ,m);
PRUEBAS_PEDIDOS.ACTUALIZAR('Prueba pedidos 7 : actualizar a confirmado(trigger)',id_p,'confirmado y no entregado',23.55,'en efectivo','calle pili nº8',b);
PRUEBAS_PEDIDOS.ACTUALIZAR('Prueba pedidos 8 : actualizar algo del pedido confirmado(trigger)',id_p,'confirmado y no entregado',24.55,'en efectivo','calle pili nº8',m);
PRUEBAS_PEDIDOS.insertar ('Prueba pedidos 9 : Insertar todo OK','no confirmado',23.55,'en efectivo','calle pili nº8',id_u,id_t ,b);
id_p1:=SECUENCIA_ID_PEDIDO.currval;
PRUEBAS_PEDIDOS.eliminar('Prueba pedidos 10 : Eliminar todo OK',id_p1,b);
--TABLA FACTURAS

DBMS_OUTPUT.put_line('//////////////////////TABLA FACTURAS////////////////////');

PRUEBAS_FACTURAS.INSERTAR('Prueba fecturas 1: Insertar factura con pedido no confirmado',SYSDATE,23.55,id_p,b);
id_f:=secuencia_id_factura.currval;
pruebas_facturas.eliminar('Prueba fecturas 1: Eliminar todo OK',id_f,b);

--TABLA DISTRIBUIDORES

DBMS_OUTPUT.put_line('//////////////////////TABLA DISTRIBUIDORES////////////////////');


PRUEBAS_DISTRIBUIDORES.insertar('Pruebas distribuidores 1 : Insertar todo OK','Pepe Botella','Z85273694',b);
id_d:=SECUENCIA_ID_DISTRIBUIDOR.currval;
PRUEBAS_DISTRIBUIDORES.insertar('Pruebas distribuidores 2 : Insertar cif no válido','Jose Oliva','78527P694',m);
PRUEBAS_DISTRIBUIDORES.actualizar('Pruebas distribuidores 3 : Actualizar todo OK',id_d,'Jose Oliva','Z85277894',b);
PRUEBAS_DISTRIBUIDORES.actualizar('Pruebas distribuidores 4 : Actualizar cif no válido',id_d,'Jose Oliva','Z878P7894',m);
PRUEBAS_DISTRIBUIDORES.insertar('Pruebas distribuidores 5 : Insertar todo OK','Juan Caminante','P78527694',b);
id_d1:=SECUENCIA_ID_DISTRIBUIDOR.currval;
PRUEBAS_DISTRIBUIDORES.ELIMINAR('Pruebas distribuidores 6 : Eliminar todo OK',id_t1,b);
PRUEBAS_DISTRIBUIDORES.insertar('Pruebas distribuidores 7 : Insertar todo OK','Juan Caminante','P78527694',b);
id_d1:=SECUENCIA_ID_DISTRIBUIDOR.currval;


--TABLA PRODUCTOS

DBMS_OUTPUT.put_line('//////////////////////TABLA PRODUCTOS////////////////////');

PRUEBAS_PRODUCTOS.insertar('Pruebas productos 1 : Insertar todo OK',1.1,'tres barras de pan',TO_DATE('2018-05-15', 'YYYY-MM-DD'),'alimentación',5,id_d,b);
id_pd1:= SECUENCIA_ID_PRODUCTO.CURRVAL;
PRUEBAS_PRODUCTOS.insertar('Pruebas productos 2 : Insertar fecha de caducidad no válida(trigger)',0.8,'cacahuetes',TO_DATE('2018-05-11', 'YYYY-MM-DD'),'alimentación',5,id_d1,m);
PRUEBAS_PRODUCTOS.insertar('Pruebas productos 3 : Insertar todo OK',0.8,'cacahuetes',TO_DATE('2018-05-13', 'YYYY-MM-DD'),'alimentación',3,id_d1,b);
id_pd:= SECUENCIA_ID_PRODUCTO.CURRVAL;
PRUEBAS_PRODUCTOS.ACTUALIZAR('Pruebas productos 4 : Actualizar todo OK',ID_PD,0.95,'cacahuetes',TO_DATE('2018-05-13', 'YYYY-MM-DD'),'alimentación',10,id_d1,b);
PRUEBAS_PRODUCTOS.ACTUALIZAR('Pruebas productos 5 : Actualizar fecha de caducidad no válida(trigger)',id_pd,0.95,'cacahuetes',TO_DATE('2018-05-11', 'YYYY-MM-DD'),'alimentación',10,id_d1,m);
PRUEBAS_PRODUCTOS.eliminar('Pruebas productos 6 : Eliminar todo OK',id_pd,b);
PRUEBAS_PRODUCTOS.insertar('Pruebas productos 7 : Insertar todo OK',14.55,'Ron Barceló',TO_DATE('2028-05-30', 'YYYY-MM-DD'),'alimentación',10,id_d1,b);
id_pd:= SECUENCIA_ID_PRODUCTO.CURRVAL;
PRUEBAS_PRODUCTOS.insertar('Pruebas productos 8 : Insertar todo OK',0.55,'lechuga',TO_DATE('2018-05-14', 'YYYY-MM-DD'),'alimentación',5,id_d,b);
id_pd2:= SECUENCIA_ID_PRODUCTO.CURRVAL;
PRUEBAS_PRODUCTOS.insertar('Pruebas productos 9 : Insertar todo OK',0.15,'tomate',TO_DATE('2018-05-14', 'YYYY-MM-DD'),'alimentación',20,id_d,b);
id_pd3:= SECUENCIA_ID_PRODUCTO.CURRVAL;
PRUEBAS_PRODUCTOS.insertar('Pruebas productos 10 : Insertar todo OK',13.99,'Puerto de India',TO_DATE('2018-05-14', 'YYYY-MM-DD'),'alimentación',3,id_d1,b);
id_pd4:= SECUENCIA_ID_PRODUCTO.CURRVAL;


--TABLA DESCUENTOS

DBMS_OUTPUT.put_line('//////////////////////TABLA DESCUENTOS////////////////////');

PRUEBAS_DESCUENTOS.INSERTAR('Pruebas descuentos 1 : Insertar todo OK',0.10,TO_DATE('2018-05-14', 'YYYY-MM-DD'),id_pd,b);
id_des:= SECUENCIA_ID_DESCUENTO.CURRVAL;
PRUEBAS_DESCUENTOS.ACTUALIZAR('Pruebas descuentos 2 : Actualizar todo OK',id_des,0.15,TO_DATE('2018-05-15', 'YYYY-MM-DD'),id_pd,b);
PRUEBAS_DESCUENTOS.INSERTAR('Pruebas descuentos 3 : Insertar descuento no válido',20,TO_DATE('2018-05-14', 'YYYY-MM-DD'),id_pd,m);
PRUEBAS_DESCUENTOS.INSERTAR('Pruebas descuentos 4 : Insertar fecha cad. no válida',0.20,TO_DATE('2018-05-10', 'YYYY-MM-DD'),id_pd,m);
PRUEBAS_DESCUENTOS.ACTUALIZAR('Pruebas descuentos 5 : Actualizar descuento no válido',id_des,20,TO_DATE('2018-05-14', 'YYYY-MM-DD'),id_pd,m);
PRUEBAS_DESCUENTOS.ACTUALIZAR('Pruebas descuentos 6 : Actualizar fecha cad. no válida',id_des,0.20,TO_DATE('2018-05-10', 'YYYY-MM-DD'),id_pd,m);
PRUEBAS_DESCUENTOS.INSERTAR('Pruebas descuentos 7 : Insertar todo OK',0.20,TO_DATE('2018-05-14', 'YYYY-MM-DD'),id_pd4,b);
id_des:= SECUENCIA_ID_DESCUENTO.CURRVAL;
PRUEBAS_DESCUENTOS.ELIMINAR('Pruebas descuentos 8 : Eliminar todo OK',id_des,b);
PRUEBAS_DESCUENTOS.INSERTAR('Pruebas descuentos 9 : Insertar todo OK',0.20,TO_DATE('2018-05-14', 'YYYY-MM-DD'),id_pd4,b);

--TABLA LINEAS DE PEDIDO

DBMS_OUTPUT.put_line('//////////////////////TABLA LINEAS DE PEDIDO////////////////////');

PRUEBAS_LINEASPEDIDO.INSERTAR('Pruebas lineas de pedido 1 : Insertar todo OK',1,0,id_p,id_pd4,b);
PRUEBAS_LINEASPEDIDO.INSERTAR('Pruebas lineas de pedido 2 : Insertar cantidad no válida',-1,0,id_p,id_pd,m);
id_lp:= SECUENCIA_ID_LINEA_DE_PEDIDO.CURRVAL;
PRUEBAS_LINEASPEDIDO.ACTUALIZAR('Pruebas lineas de pedido 3 : Actualizar cantidad no válida',id_lp,-1,0,id_p,id_pd,m);
PRUEBAS_LINEASPEDIDO.INSERTAR('Pruebas lineas de pedido 4 : Insertar todo OK',1,0,id_p,id_pd,b);
PRUEBAS_LINEASPEDIDO.ACTUALIZAR('Pruebas lineas de pedido 5 : Actualizar linea pedido confirmado(trigger)',id_lp,1,0,id_p,id_pd,m);
PRUEBAS_LINEASPEDIDO.INSERTAR('Pruebas lineas de pedido 6 : Insertar todo OK',1,0,id_p,id_pd2,b);
id_lp:= SECUENCIA_ID_LINEA_DE_PEDIDO.CURRVAL;
PRUEBAS_LINEASPEDIDO.ELIMINAR('Pruebas lineas de pedido 7 : Eliminar todo OK',id_lp,b);


END;
/

SHOW ERRORS;