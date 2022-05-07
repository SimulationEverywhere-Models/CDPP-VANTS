% VANTS MODEL version 2
% by Javier Ameghino jameghino@dc.uba.ar
% 08/22/2000

[top]
components : vants

[vants]
type : cell
dim : (10,10,2)
delay : transport
defaultDelayTime  : 100
border : wrapped

neighbors :				  vants(-2,0,0)
neighbors :                vants(-1,-1,0) vants(-1,0,0) vants(-1,1,0)
neighbors : vants(0,-2,0)  vants(0,-1,0)  vants(0,0,0)  vants(0,1,0)  vants(0,2,0)
neighbors :                vants(1,-1,0)  vants(1,0,0)  vants(1,1,0)
neighbors :				  vants(2,0,0)
neighbors : 		                  vants(0,0,1)

initialvalue : 1
initialCellsValue : vantsII.val
localtransition : calculus

[calculus]

% Paso 1
% Busco donde hay Hormigas y lo que hago es cambiar el color de donde la misma esta parada y Rotarla
% Cada valor de la celda posee dos digitos, las decenas representan al color y las unidades a la direccion
% a saber los colores son 1=verde, 2=Rojo, 3 y 4=blanco
% las direcciones son 1=arriba, 2=derecha, 3=abajo, 4=izquierda
% uso como direccion auxiliar a 5=arriba, 6=derecha, 7=abajo, 8=izquierda como valores auxiliares
% para luego saber que celda vecina ocupara la hormiga

rule : 26 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=11 }
rule : 27 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=12 }
rule : 28 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=13 }
rule : 25 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=14 }

rule : 38 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=21 }
rule : 35 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=22 }
rule : 36 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=23 }
rule : 37 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=24 }

rule : 45 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=31 }
rule : 46 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=32 }
rule : 47 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=33 }
rule : 48 100 { cellpos(2)=0 and (0,0,1)=1 and (0,0,0)=34 }

% Paso 2
% Tengo que analizar si existen Hormigas que van a querer ocupar la misma posicion a la que voy a ir, si eso sucede
% lo que voy haciendo es rotando en el sentido de las agujas del reloj y voy verificando si realmente puedo moverme
% llegado el caso que no pueda rotar la hormiga debe quedarse quieta

rule : { (trunc(((0,0,0)/10))*10) + 6 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=25 or (0,0,0)=35 or (0,0,0)=45) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,1,0)/10)=0.8 or fractional((-1,-1,0)/10)=0.6) and (fractional((0,2,0)/10)!=0.8 and fractional((-1,1,0)/10)!=0.7 and fractional((1,1,0)/10)!=0.5)}
rule : { (trunc(((0,0,0)/10))*10) + 7 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=25 or (0,0,0)=35 or (0,0,0)=45) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,1,0)/10)=0.8 or fractional((-1,-1,0)/10)=0.6) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)!=0.5 and fractional((1,1,0)/10)!=0.8 and fractional((1,-1,0)/10)!=0.7)}
rule : { (trunc(((0,0,0)/10))*10) + 8 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=25 or (0,0,0)=35 or (0,0,0)=45) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,1,0)/10)=0.8 or fractional((-1,-1,0)/10)=0.6) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)=0.5 or fractional((1,1,0)/10)=0.8 or fractional((1,-1,0)/10)=0.7) and (fractional((0,-2,0)/10)!=0.6 and fractional((1,-1,0)/10)!=0.5 and fractional((-1,-1,0)/10)!=0.7)}
rule : { (trunc(((0,0,0)/10))*10) + 1 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=25 or (0,0,0)=35 or (0,0,0)=45) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,1,0)/10)=0.8 or fractional((-1,-1,0)/10)=0.6) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)=0.5 or fractional((1,1,0)/10)=0.8 or fractional((1,-1,0)/10)=0.7) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7)}

rule : { (trunc(((0,0,0)/10))*10) + 7 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=26 or (0,0,0)=36 or (0,0,0)=46) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)!=0.5 and fractional((1,1,0)/10)!=0.8 and fractional((1,-1,0)/10)!=0.6)}
rule : { (trunc(((0,0,0)/10))*10) + 8 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=26 or (0,0,0)=36 or (0,0,0)=46) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)=0.5 or fractional((1,1,0)/10)=0.8 or fractional((1,-1,0)/10)=0.6) and (fractional((0,-2,0)/10)!=0.6 and fractional((1,-1,0)/10)!=0.5 and fractional((-1,-1,0)/10)!=0.7)}
rule : { (trunc(((0,0,0)/10))*10) + 5 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=26 or (0,0,0)=36 or (0,0,0)=46) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)=0.5 or fractional((1,1,0)/10)=0.8 or fractional((1,-1,0)/10)=0.6) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)!=0.7 and fractional((-1,-1,0)/10)!=0.6 and fractional((-1,1,0)/10)!=0.8)}
rule : { (trunc(((0,0,0)/10))*10) + 2 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=26 or (0,0,0)=36 or (0,0,0)=46) and (fractional((0,2,0)/10)=0.8 or fractional((-1,1,0)/10)=0.7 or fractional((1,1,0)/10)=0.5) and (fractional((2,0,0)/10)=0.5 or fractional((1,1,0)/10)=0.8 or fractional((1,-1,0)/10)=0.6) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,-1,0)/10)=0.6 or fractional((-1,1,0)/10)=0.8)}

rule : { (trunc(((0,0,0)/10))*10) + 8 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=27 or (0,0,0)=37 or (0,0,0)=47) and (fractional((2,0,0)/10)=0.5 or fractional((1,-1,0)/10)=0.6 or fractional((1,1,0)/10)=0.8) and (fractional((0,-2,0)/10)!=0.6 and fractional((1,-1,0)/10)!=0.5 and fractional((-1,-1,0)/10)!=0.7)}
rule : { (trunc(((0,0,0)/10))*10) + 5 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=27 or (0,0,0)=37 or (0,0,0)=47) and (fractional((2,0,0)/10)=0.5 or fractional((1,-1,0)/10)=0.6 or fractional((1,1,0)/10)=0.8) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)!=0.7 and fractional((-1,-1,0)/10)!=0.6 and fractional((-1,1,0)/10)!=0.8)}
rule : { (trunc(((0,0,0)/10))*10) + 6 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=27 or (0,0,0)=37 or (0,0,0)=47) and (fractional((2,0,0)/10)=0.5 or fractional((1,-1,0)/10)=0.6 or fractional((1,1,0)/10)=0.8) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,-1,0)/10)=0.6 or fractional((-1,1,0)/10)=0.8) and (fractional((0,2,0)/10)!=0.8 and fractional((1,1,0)/10)!=0.5 and fractional((-1,1,0)/10)!=0.7)}
rule : { (trunc(((0,0,0)/10))*10) + 3 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=27 or (0,0,0)=37 or (0,0,0)=47) and (fractional((2,0,0)/10)=0.5 or fractional((1,-1,0)/10)=0.6 or fractional((1,1,0)/10)=0.8) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,-1,0)/10)=0.6 or fractional((-1,1,0)/10)=0.8) and (fractional((0,2,0)/10)=0.8 or fractional((1,1,0)/10)=0.5 or fractional((-1,1,0)/10)=0.7)}

rule : { (trunc(((0,0,0)/10))*10) + 5 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=28 or (0,0,0)=38 or (0,0,0)=48) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)!=0.7 and fractional((-1,-1,0)/10)!=0.6 and fractional((-1,1,0)/10)!=0.8)}
rule : { (trunc(((0,0,0)/10))*10) + 6 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=28 or (0,0,0)=38 or (0,0,0)=48) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,-1,0)/10)=0.6 or fractional((-1,1,0)/10)=0.8) and (fractional((0,2,0)/10)!=0.8 and fractional((1,1,0)/10)!=0.5 and fractional((-1,1,0)/10)!=0.7)}
rule : { (trunc(((0,0,0)/10))*10) + 7 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=28 or (0,0,0)=38 or (0,0,0)=48) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,-1,0)/10)=0.6 or fractional((-1,1,0)/10)=0.8) and (fractional((0,2,0)/10)=0.8 or fractional((1,1,0)/10)!=0.5 or fractional((-1,1,0)/10)=0.7) and (fractional((2,0,0)/10)!=0.5 and fractional((1,-1,0)/10)!=0.6 and fractional((1,1,0)/10)!=0.8)}
rule : { (trunc(((0,0,0)/10))*10) + 4 } 100 {cellpos(2)=0 and (0,0,1)=2 and ((0,0,0)=28 or (0,0,0)=38 or (0,0,0)=48) and (fractional((0,-2,0)/10)=0.6 or fractional((1,-1,0)/10)=0.5 or fractional((-1,-1,0)/10)=0.7) and (fractional((-2,0,0)/10)=0.7 or fractional((-1,-1,0)/10)=0.6 or fractional((-1,1,0)/10)=0.8) and (fractional((0,2,0)/10)=0.8 or fractional((1,1,0)/10)!=0.5 or fractional((-1,1,0)/10)=0.7) and (fractional((2,0,0)/10)=0.5 or fractional((1,-1,0)/10)=0.6 or fractional((1,1,0)/10)=0.8)}

% Paso 5
% Lo que hago ahora es mover a la Hormiga a la celda que tiene que ocupar
rule : { (trunc(((0,0,0)/10))*10) + 1 } 100 {cellpos(2)=0 and (0,0,1)=3 and ((1,0,0)=25 or (1,0,0)=35 or (1,0,0)=45)}
rule : { (trunc(((0,0,0)/10))*10) + 2 } 100 {cellpos(2)=0 and (0,0,1)=3 and ((0,-1,0)=26 or (0,-1,0)=36 or (0,-1,0)=46)}
rule : { (trunc(((0,0,0)/10))*10) + 3 } 100 {cellpos(2)=0 and (0,0,1)=3 and ((-1,0,0)=27 or (-1,0,0)=37 or (-1,0,0)=47)}
rule : { (trunc(((0,0,0)/10))*10) + 4 } 100 {cellpos(2)=0 and (0,0,1)=3 and ((0,1,0)=28 or (0,1,0)=38 or (0,1,0)=48)}

% Paso 4
% Borro a la Hormiga "fantasma" que quedo del movimiento anterior
% la ultima regla de esta seccion esta referida a cuando las hormigas deben quedarse quietas
% por que estan rodeadas y no pueden avanzar y ya estaban en color blancas (30) pasan a color 
% blanco (40). Entonces debo volverlas al color original blanco que es el (30)
rule : 20 100 {cellpos(2)=0 and (0,0,1)=4 and (0,0,0)>=25 and (0,0,0)<=28 }
rule : 30 100 {cellpos(2)=0 and (0,0,1)=4 and (0,0,0)>=35 and (0,0,0)<=38 }
rule : 30 100 {cellpos(2)=0 and (0,0,1)=4 and (0,0,0)>=45 and (0,0,0)<=48}
rule : {30 + fractional((0,0,0)/10)*10} 100 {cellpos(2)=0 and (0,0,1)=4 and (0,0,0)>=41 and (0,0,0)<=44}

% Sumo las celdas del segundo plano que uso de contador
rule : { (0,0,0) + 1 } 100 {cellpos(2)=1 and (0,0,0)<5}
rule : 1 100 {cellpos(2)=1 and (0,0,0)>=5}
rule : { (0,0,0) } 100 { t }
