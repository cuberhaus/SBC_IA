(defmodule MAIN "MAIN del programa" (export ?ALL))

(defrule saltar-siguiente-modulo "Iniciamos el programa en el modulo MENU"
  (declare (salience 10))
 =>
  (focus MENU)
 )

;---------------------------------------------------------------------------------------
;                                 MODULO DE MENU                                       -
;---------------------------------------------------------------------------------------

;; defmodule has to go below saltar-siguiente-modulo
(defmodule MENU "Inicio del programa" (export ?ALL))

;; deftemplate has to be at the top
(deftemplate MENU::usuario "Contiene informacion sobre el usuario que pide el viaje"
  (slot ninos (type SYMBOL) (allowed-values TRUE FALSE) (default FALSE))
  (slot adolescentes (type SYMBOL) (allowed-values TRUE FALSE) (default FALSE))
  (slot numero-integrantes (type INTEGER) )
  (slot dias-minimo (type INTEGER) )
  (slot dias-maximo (type INTEGER) )
  (slot diasporciudad-minimo (type INTEGER) )
  (slot diasporciudad-maximo (type INTEGER) )
  (slot ciudades-minimo (type INTEGER) )
  (slot ciudades-maximo (type INTEGER) )
  (slot presupuesto (type INTEGER FLOAT) (range 100 100000000))
  (slot calidad-alojamiento (type INTEGER)  (range 1 5))
  (slot lugares_poco_conocidos (type SYMBOL) (allowed-values TRUE FALSE))
  (slot duracion-o-calidad (type STRING) (allowed-strings "duracion" "calidad" "mixto"))
  (slot tipo-viaje (type STRING)
	(allowed-strings "descanso" "diversion" "romantico" "trabajo" "aventura" "cultural"))
  (slot tipo-usuario (type STRING) (allowed-strings "individual" "pareja" "grupo" "familia"))
  (multislot edades (type INTEGER) (range 0 100))
  (multislot medios-de-transporte (type STRING) (allowed-values "Avion" "Tren" "Barco"))
  (multislot not-tipo-viaje (type STRING)
	     (allowed-strings "descanso" "diversion" "romantico" "trabajo" "aventura" "cultural"))
  )

(deftemplate MENU::viaje "Nos permite almacenar el viaje que veremos como resultado"
  (slot continentes (type SYMBOL) (allowed-values TRUE FALSE) )
  (slot duracion (type INTEGER))
  (slot coste (type INTEGER))
  (slot continente (type STRING) (default "placeholder"))
  (multislot dias_por_ciudad)
  (multislot ciudades (type INSTANCE))
  (multislot alojamientos)
  (multislot transporte)
  (multislot actividades)
  )

(deffacts MENU::inicialitzacio "Inicializamos las clases donde guardaremos la informacion"
  (usuario)
  (viaje)
  )

;; ###########################################################
;; ## FUNCTIONS
;; ###########################################################

(deffunction MENU::pregunta-llista (?pregunta ?min ?max)
  (format t "%s: %n" ?pregunta)
 ; Llegim una línea sencera (Ex. "Pasta Marisc Fruita")
 (bind ?resposta (readline))
 ; Separem l'string (Ex. "Pasta" "Marisc" "Fruita")
 (bind ?res (str-explode ?resposta))
 ; Retornem els diferents camps (Ex. "Pasta" "Marisc" "Fruita")
 ?res
 )

(deffunction MENU::pregunta-float(?pregunta ?min ?max)
  (printout t ?pregunta crlf "Introduzca su respuesta: ")
  (bind ?param (read))
  (while(not (and (or(floatp ?param) (integerp ?param)) (and (>= ?param ?min) (<= ?param ?max)))) do
    (printout t "Parámetro en formato incorrecto o fuera de rango" crlf crlf)
    (printout t ?pregunta crlf "Introduzca su respuesta: ")
    (bind ?param (read))
  )
  ?param
)

(deffunction MENU::pregunta-int(?pregunta ?min ?max)
  (printout t ?pregunta crlf "Introduzca su respuesta: ")
  (bind ?param (read))
  (while(not (and (integerp ?param) (and (>= ?param ?min) (<= ?param ?max)))) do
    (printout t "Parámetro en formato incorrecto o fuera de rango" crlf crlf)
    (printout t ?pregunta crlf "Introduzca su respuesta: ")
    (bind ?param (read))
  )
  ?param
)

(deffunction MENU::pregunta-restri(?pregunta $?valores-permitidos)
  (progn$
  (?var ?valores-permitidos)
  (lowcase ?var))
  (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
  (bind ?respuesta (read))
  (while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
    (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
    (bind ?respuesta (read))
  )
  ?respuesta
 )

(deffunction MENU::pregunta (?pregunta $?valores-permitidos)
   (progn$
       (?var ?valores-permitidos)
     (lowcase ?var))
   (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
   (bind ?respuesta (read))
   (while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
	  (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
	  (bind ?respuesta (read))
	  )
   ?respuesta
   )

(deffunction MENU::si-o-no-p (?pregunta)
  (bind ?respuesta (pregunta ?pregunta si no s n))
  (if (or (eq (lowcase ?respuesta) si) (eq (lowcase ?respuesta) s))
   then TRUE
   else FALSE
 )
  )

;; ###########################################################
;; ## RULES
;; ###########################################################

(defrule MENU::preguntar-edades
  (not (preguntas-acabadas))
  (not (preguntado-edad))
  ?user <- (usuario)
 =>
  (bind ?edades (pregunta-llista "Escriba las edades de los participantes separados por espacios" 0 100))
  (printout t "Su edad es: " ?edades crlf)
  (modify ?user (edades ?edades))
  (assert(preguntado-edad))
)


(defrule MENU::preguntar-nivel-cultural ;; TODO:
  (not (preguntas-acabadas))
  (not (preguntado-nivel-cultural))
 =>
  (assert(preguntado-nivel-cultural))
)


(defrule MENU::preguntar-tipo-de-viaje
  (not (preguntas-acabadas))
  (not (preguntado-tipo-de-viaje))
  ?user <- (usuario)
 =>
(bind ?tipoviaje (pregunta-restri "Que tipo de viaje se quiere realizar"
				    (create$ descanso diversion romantico trabajo aventura cultural)))
  (printout t "Se realiza un viaje de tipo " ?tipoviaje crlf)
  (modify ?user (tipo-viaje ?tipoviaje))
  (assert(preguntado-tipo-de-viaje))
)

(defrule MENU::preguntar-ciudades-preferidas ;;TODO
  (not (preguntas-acabadas))
  (not (preguntado-ciudades-preferidas))
 =>
  (assert(preguntado-ciudades-preferidas))
)

(defrule MENU::preguntar-dias
  (not (preguntas-acabadas))
  (not (preguntado-dias))
 ?user <- (usuario)
 =>
  (bind ?min (pregunta-int "¿Cuál es el minimo de dias que quereis de viaje?" 1 365))
  (bind ?max (pregunta-int "¿Cuál es el maximo de dias que quereis de viaje?" 1 365))
  (while (not(<= ?min ?max )) do
    (printout t "Maximo no puede ser menor que el minimo" crlf)
    (bind ?max (pregunta-int "¿Cuál es el maximo de dias que quereis de viaje?" 1 365))
  )
  (modify ?user (dias-minimo ?min) (dias-maximo ?max))
  (printout t "Dias seleccionados, se viajará minimo " ?min " dias y maximo " ?max " dias" crlf)
  (assert(preguntado-dias))
)

(defrule MENU::preguntar-ndias-ciudad
  (not (preguntas-acabadas))
  (not (preguntado-ndiasciudades))
  (preguntado-dias)
  ?user <- (usuario (dias-minimo ?dias-minimo) (dias-maximo ?dias-maximo))
 =>
  (bind ?min (pregunta-int "¿Cuál es el minimo de dias que quereis estar en cada ciudad?" 1 (fact-slot-value ?user dias-maximo)))
  (bind ?max (pregunta-int "¿Cuál es el maximo de dias que quereis estar en cada ciudad?" 1 (fact-slot-value ?user dias-maximo)))
  (while (not(<= ?min ?max )) do
	 (printout t "Maximo no puede ser menor que el minimo" crlf)
	 (bind ?max (pregunta-int "¿Cuál es el maximo de dias que quereis de viaje?" 1 365))
  )
  (modify ?user (diasporciudad-minimo ?min) (diasporciudad-maximo ?max))
  (printout t "Dias seleccionados, se viajará minimo " ?min " dias por ciudad y maximo " ?max " dias por ciudad" crlf)
  (assert(preguntado-ndiasciudades))
)

(defrule MENU::preguntar-nciudades
  (not (preguntas-acabadas))
  (not (preguntado-nciudades))
  ?user <- (usuario)
 =>
  (bind ?min (pregunta-int "¿Cuál es el minimo de ciudades que quereis visitar?" 1 (fact-slot-value ?user dias-maximo)))
  (bind ?max (pregunta-int "¿Cuál es el maximo de ciudades que quereis visitar?" 1 (fact-slot-value ?user dias-maximo)))
  (while (not(<= ?min ?max )) do
    (printout t "Maximo no puede ser menor que el minimo" crlf)
    (bind ?max (pregunta-int "¿Cuál es el maximo de ciudades que quereis visitar?" 1 (fact-slot-value ?user dias-maximo)))
  )
  (modify ?user (ciudades-minimo ?min) (ciudades-maximo ?max))
  (printout t "Dias seleccionados, se viajará a minimo " ?min " ciudades y maximo " ?max " ciudades" crlf)
  (assert(preguntado-nciudades))
)

(defrule MENU::preguntar-presupuesto
  (not (preguntas-acabadas))
  (not (preguntado-presupuesto))
  ?user <- (usuario)
 =>
  (bind ?presupuesto (pregunta-float "De cuanto presupuesto disponeis (en euros €)" 100 100000000))
  (modify ?user (presupuesto ?presupuesto))
  (printout t "Su presupuesto es de " ?presupuesto  "€"crlf)
  (assert(preguntado-presupuesto))
)
(defrule MENU::preguntar-medios-de-transporte
  (not (preguntas-acabadas))
  (not (preguntado-medios-de-transporte))
  ?user <- (usuario)
 =>
 ; 0 y 1 sonvalores basura de momento, habra que hacer una funcion bien
  (bind ?tipoviaje (pregunta-llista "Que medios de transporte se desean evitar" 0 1)) 
  (modify ?user (medios-de-transporte ?tipoviaje))
  (printout t "Se intentaran evitar los siguientes medios de transporte " ?tipoviaje crlf)
  (assert(preguntado-medios-de-transporte))
)

(defrule MENU::preguntar-calidad-alojamiento
  (not (preguntas-acabadas))
  (not (preguntado-calidad-alojamiento))
  ?user <- (usuario)
 =>
  (bind ?tipocalidadalojamiento (pregunta-int "Que calidad de alojamiento se prefiere (de minimo)" 1 5))
  (modify ?user (calidad-alojamiento ?tipocalidadalojamiento))
  (printout t "Se buscaran alojamientos de calidad: " ?tipocalidadalojamiento crlf)
  (assert(preguntado-calidad-alojamiento))
)

(defrule MENU::preguntar-popularidad-ciudad
  (not (preguntas-acabadas))
  (not (preguntado-popularidad-ciudad))
  ?user <- (usuario)
 =>
  (bind ?respuesta (si-o-no-p "Prefiere visitar ciudades/lugares poco conocidos")) 
  (printout t "Respuesta " ?respuesta crlf)
  (modify ?user (lugares_poco_conocidos ?respuesta))
  (assert(preguntado-popularidad-ciudad))
)

(defrule MENU::preguntar-duracion-o-calidad
  (not (preguntas-acabadas))
  (not (preguntado-duracion-o-calidad))
  ?user <- (usuario)
 =>
  (bind ?respuesta (pregunta-restri "Prefiere duracion, calidad o un mixto" (create$ duracion calidad mixto)))
  (modify ?user (duracion-o-calidad ?respuesta))
  (printout t "Se priorizara la: " ?respuesta crlf)
  (assert(preguntado-duracion-o-calidad))
)

(defrule MENU::acaban-las-preguntas
  (preguntado-edad)
  (preguntado-nivel-cultural)
  (preguntado-tipo-de-viaje)
  (preguntado-ciudades-preferidas)
  (preguntado-dias)
  (preguntado-ndiasciudades)
  (preguntado-nciudades)
  (preguntado-presupuesto)
  (preguntado-medios-de-transporte)
  (preguntado-calidad-alojamiento)
  (preguntado-popularidad-ciudad)
  (preguntado-duracion-o-calidad)
  (not (preguntas-acabadas))
 =>
  (assert (preguntas-acabadas))
  (focus INFERENCIA)
)

;---------------------------------------------------------------------------------------
;                                 MODULO DE INFERENCIA                                 -
;---------------------------------------------------------------------------------------

(defmodule INFERENCIA "Inferir propiedades de los usuarios con los datos obtenidos"
  (import MENU ?ALL) (import MAIN ?ALL) (export ?ALL))

(deftemplate INFERENCIA::fix_dias_por_ciudad
  (slot dias_por_ciudad (type INTEGER) ) 
  )

(deftemplate INFERENCIA::ciudad_puntuada
  (slot fitness (type INTEGER) (range 0 100) (default 0))
  (slot ciudad (type STRING) )
  (slot Continente (type STRING) )
  )

(defrule INFERENCIA::con-ninos "Inferimos si hay niños con las edades introducidas"
  (not (inferencia_acabada))
  (not (preguntado-con-ninos))
  ?user <- (usuario (edades $?edades))
 =>
  (bind ?i 1)
  (while (<= ?i (length$ ?edades))
    do
    (bind ?edad (nth$ ?i ?edades))
    (if (<= ?edad 12)
     then (modify ?user (ninos TRUE)))
    (bind ?i (+ ?i 1))
    )
  (assert(preguntado-con-ninos))
)

(defrule INFERENCIA::con-adolescentes "Inferimos si hay adolescentes con las edades introducidas"
  (not (inferencia_acabada))
  (not (preguntado-con-adolescentes))
  ?user <- (usuario (edades $?edades))
  (preguntado-edad)
 =>
  (bind ?i 1)
  (while (<= ?i (length$ ?edades))
    do
    (bind ?edad (nth$ ?i ?edades))
    (if (and (<= ?edad 20) (>= ?edad 12))
     then (modify ?user (adolescentes TRUE)))
    (bind ?i (+ ?i 1))
    )
  (assert(preguntado-con-adolescentes))
)

(defrule INFERENCIA::numero-integrantes "Inferimos el numero de integrantes por la cantidad de edades introducidas"
  (not (inferencia_acabada))
  (not (preguntado-con-numero-integrantes))
  (preguntado-edad)
 ?user <- (usuario (edades $?edades))
 =>
 (bind ?num_integrantes (length$ ?edades) )
  (modify ?user (numero-integrantes ?num_integrantes))
  (assert(preguntado-con-numero-integrantes))
)


(defrule INFERENCIA::obtenertipousuarios
  (not (inferencia_acabada))
  (not (inferencia_tipo_usuario_asked))
  (preguntado-con-numero-integrantes)
  ?user <- (usuario (ninos ?n) (numero-integrantes ?num_integrantes))
  =>
  (if (eq ?num_integrantes 1) then (modify ?user (tipo-usuario "individual"))) 
  (if (eq ?num_integrantes 2) then (modify ?user (tipo-usuario "pareja")))
  (if (and (and (>= ?num_integrantes 3) (<  ?num_integrantes 10)) (eq ?n TRUE))
   then (modify ?user (tipo-usuario  "familia")))
  (if (and (and (>= ?num_integrantes 3) (<  ?num_integrantes 10)) (eq ?n FALSE))
   then (modify ?user (tipo-usuario  "grupo")))
  (if (>= ?num_integrantes 10) then then (modify ?user (tipo-usuario  "grupo")))
  (assert (inferencia_tipo_usuario_asked))
)

(defrule INFERENCIA::longitud_viaje
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  ?vi <- (viaje (continentes ?cont))
  (not(longitud_viaje)) 
 =>
  (if (< ?max 6) then (bind $?cont TRUE ) else (bind $?cont FALSE) )
  (assert (longitud_viaje)) 
)


(defrule INFERENCIA::ciudades_romanticas
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-viaje ?tviaje) )
  ?city <- (object  (is-a Ciudad) (Nombre ?nom) (Continente ?cont))
  (test (eq (str-cat ?tviaje) "romantico"))
 =>
  (bind ?puntuacion 50)
  (bind ?puntuacionmala 10)
  (bind ?ciudadesromanticas (create$ "paris" "venecia" "barcelona" "nueva_york" "granada" "praga" "amsterdam" "kioto"))
  (if (member (lowcase ?nom) $?ciudadesromanticas)
   then
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacion) (Continente ?cont)))
   else
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacionmala) (Continente ?cont)))	
  )
  )

(defrule INFERENCIA::ciudades_descanso
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-viaje ?tviaje) )
  ?city <- (object  (is-a Ciudad) (Nombre ?nom) (Continente ?cont))
  (test (eq (str-cat ?tviaje) "descanso"))
=>
  (bind ?puntuacion 50)
  (bind ?puntuacionmala 10)
  (bind $?ciudades_descanso (create$ "tahiti" "cancun" "punta_cana" "las_vegas" "miami"))
  (if (member (lowcase ?nom) $?ciudades_descanso)
   then 
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacion) (Continente ?cont) ))
   else
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacionmala) (Continente ?cont)))	
    )
)

(defrule INFERENCIA::ciudades_diversion
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-viaje ?tviaje) )
  ?city <- (object  (is-a Ciudad) (Nombre ?nom) (Continente ?cont))
  (test (eq (str-cat ?tviaje) "diversion"))
=>
  (bind ?puntuacion 50)
  (bind ?puntuacionmala 10)
    (bind ?ciudadesdiversion (create$ "paris" "venezia" "las_vegas" "barcelona" "roma"))
  (if (member (lowcase ?nom) $?ciudadesdiversion)
   then 
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacion) (Continente ?cont)))
   else
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacionmala) (Continente ?cont)))						    
  )
  )

(defrule INFERENCIA::ciudades_trabajo
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-viaje ?tviaje) )
  ?city <- (object  (is-a Ciudad) (Nombre ?nom) (Continente ?cont))
  (test (eq (str-cat ?tviaje) "trabajo"))
 =>
  (bind ?puntuacion 50)
  (bind ?puntuacionmala 10)
  (bind ?ciudadestrabajo (create$ "barcelona" "nueva_york" "roma" "amsterdam" "paris" ))
  (if (member (lowcase ?nom) $?ciudadestrabajo)
   then 
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacion) (Continente ?cont)))
   else
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacionmala) (Continente ?cont)))				      
  )
  )

(defrule INFERENCIA::ciudades_aventura
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-viaje ?tviaje) )
  ?city <- (object  (is-a Ciudad) (Nombre ?nom) (Continente ?cont))
  (test (eq (str-cat ?tviaje) "aventura"))
 =>
  (bind ?puntuacion 50)
  (bind ?puntuacionmala 10)
  (bind ?ciudadesaventura (create$ "miami" "barcelona" "cancun" "las_vegas" ))
  (if (member (lowcase ?nom) $?ciudadesaventura)
   then 
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacion) (Continente ?cont)))
   else
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacionmala) (Continente ?cont)))				       
  )
  )

(defrule INFERENCIA::ciudades_cultural
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-viaje ?tviaje) )
  ?city <- (object  (is-a Ciudad) (Nombre ?nom) (Continente ?cont))
  (test (eq (str-cat ?tviaje) "cultural"))
=>
  (bind ?puntuacion 50)
  (bind ?puntuacionmala 10)
  (bind ?ciudadescultural (create$ "paris" "roma" "barcelona" "paris" "granada" "kioto" ))
  (if (member (lowcase ?nom) $?ciudadescultural)
   then 
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacion) (Continente ?cont)))			       
   else
     (assert (ciudad_puntuada (ciudad ?nom ) (fitness ?puntuacionmala) (Continente ?cont)))	
  )
  )


(defrule INFERENCIA::inferir_tipo_viaje
  (not (inferencia_acabada))
  ?user <- (usuario (tipo-usuario ?tuser))
  (not (tipo_viaje_inferido))
  =>
  (if (eq ?tuser "individual") then (printout t "No será romantico" crlf))
  (if (eq ?tuser "pareja") then (printout t "Será romanatico" crlf)) 
  (if (eq ?tuser "familia") then (printout t "No será de descanso" crlf))
  (assert (tipo_viaje_inferido))
)

(defrule INFERENCIA::initialize_dias_por_ciudad
  (not (inferencia_acabada))
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
 =>
  (bind ?i ?diasciumin)
  (bind ?n ?diasciumax)
  (while (<= ?i ?n)
    do
    (assert (fix_dias_por_ciudad (dias_por_ciudad ?i)) 
	    )
    (bind ?i (+ ?i 1))
    )
  )

(defrule INFERENCIA::acabainferencia
  (declare (salience -5))
  (inferencia_tipo_usuario_asked)
  (longitud_viaje)
  (tipo_viaje_inferido)

  (preguntado-con-ninos)
  (preguntado-con-adolescentes)
  (preguntado-con-numero-integrantes)
  (not (inferencia_acabada))
  =>
  (assert (inferencia_acabada))
   (focus LOGIC)
)

;---------------------------------------------------------------------------------------
;                                   MODULO DE LOGICA                                   -
;---------------------------------------------------------------------------------------


(defmodule LOGIC "logica del programa" (import MENU ?ALL) (import MAIN ?ALL) (import INFERENCIA ?ALL) (export ?ALL))

(deftemplate LOGIC::fix_aloj
  (slot nom_ciudad (type STRING) ) 
  )

(deftemplate LOGIC::ciudad_escogida
  (slot nom_ciudad (type STRING))
  )

(deftemplate LOGIC::fix_trans
  (slot nom_ciudad (type STRING))
  )

(deftemplate LOGIC::alojamiento_puntuado "Puntuacion que nos permite saber cual es el mejor alojamiento para el usuario"
  (slot fitness (type INTEGER) (range 0 100) (default 0))
  (slot alojamiento-nom (type STRING) )
  )

(deftemplate LOGIC::nextciudad "Permite saber el orden en que visitamos las ciudades"
  (slot desde (type STRING))
  (slot hacia (type STRING))
  )

(deftemplate LOGIC::estructura "Estructura que nos permite asociar ciudades con los dias que van a ocupar y como de ocupada esta la estancia en esa ciudad (por las actividades que se hacen alli)"
  (slot dias (type INTEGER))
  (slot ocupacion (type INTEGER))
  (multislot ciudad (type STRING))
  )


(defrule LOGIC::escoger-ciudades-rule-high-fit
  (declare (salience 50))
 (not (logica-acabada))
  ?vi <- (viaje (ciudades $?ciudades) (duracion ?dur) (dias_por_ciudad $?dpor) (continentes ?use_cont) (continente ?cont))
  ?ciupunt <- (ciudad_puntuada (fitness ?fit) (ciudad ?nom) (Continente ?cont2))
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  (test (>= ?fit 40))
  (test (not (member ?nom $?ciudades)))
  ;; unificamos con todos los dias por ciudad posibles
  ?fix <- (fix_dias_por_ciudad (dias_por_ciudad ?dias_por))
  (test (>= ?max (+ ?dur ?dias_por) ) )
  (test (<= (+ (length$ $?ciudades) 1) ?ciumax))
  (test (<= (+ ?dur ?dias_por) ?max) )
  (test (or (eq ?use_cont FALSE) (or (eq ?cont "placeholder") (eq ?cont ?cont2)) ) ) 
  (not (exists (and (ciudad_escogida (nom_ciudad ?nomc2)) (test (eq ?nomc2 ?nom))))) 
=>
  (assert (ciudad_escogida (nom_ciudad ?nom)))
  (bind $?aux (insert$ $?ciudades (+ (length$ ?ciudades) 1 ) ?nom))
  (bind $?aux2 (insert$ $?dpor (+ (length$ ?dpor) 1 ) ?dias_por))
  (assert (estructura (ciudad ?nom) (dias ?dias_por) (ocupacion 0) ))
  (if (eq "placeholder" ?cont)
   then (modify ?vi (ciudades ?aux) (duracion (+ ?dur ?dias_por)) (dias_por_ciudad ?aux2) (continente ?cont2))
   else
     (modify ?vi (ciudades ?aux) (duracion (+ ?dur ?dias_por)) (dias_por_ciudad ?aux2) )
   )
)

(defrule LOGIC::escoger-ciudades-rule-low-fit
  (declare (salience 50))
 (not (logica-acabada))
  ?vi <- (viaje (ciudades $?ciudades) (duracion ?dur) (dias_por_ciudad $?dpor) (continentes ?use_cont) (continente ?cont))
  ?ciupunt <- (ciudad_puntuada (fitness ?fit) (ciudad ?nom) (Continente ?cont2))
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  (test (>= ?fit 0))
  (test (not (member ?nom $?ciudades)))
  ;; unificamos con todos los dias por ciudad posibles
  ?fix <- (fix_dias_por_ciudad (dias_por_ciudad ?dias_por))
  (test (>= ?max (+ ?dur ?dias_por) ) )
  (test (<= (+ (length$ $?ciudades) 1) ?ciumax))
  (test (<= (+ ?dur ?dias_por) ?max) )
  (test (or (eq ?use_cont FALSE) (or (eq ?cont "placeholder") (eq ?cont ?cont2)) ) ) 
  (not (exists (and (ciudad_escogida (nom_ciudad ?nomc2)) (test (eq ?nomc2 ?nom))))) 
=>
  (assert (ciudad_escogida (nom_ciudad ?nom)))
  (bind $?aux (insert$ $?ciudades (+ (length$ ?ciudades) 1 ) ?nom))
  (bind $?aux2 (insert$ $?dpor (+ (length$ ?dpor) 1 ) ?dias_por))
  (assert (estructura (ciudad ?nom) (dias ?dias_por) (ocupacion 0) ))
  (if (eq "placeholder" ?cont)
   then (modify ?vi (ciudades ?aux) (duracion (+ ?dur ?dias_por)) (dias_por_ciudad ?aux2) (continente ?cont2))
   else
     (modify ?vi (ciudades ?aux) (duracion (+ ?dur ?dias_por)) (dias_por_ciudad ?aux2) )
   )
)

(defrule LOGIC::escoger-ciudades-rule-low-fit-no-continent
  (declare (salience 50))
 (not (logica-acabada))
  ?vi <- (viaje (ciudades $?ciudades) (duracion ?dur) (dias_por_ciudad $?dpor) (continentes ?use_cont) (continente ?cont))
  ?ciupunt <- (ciudad_puntuada (fitness ?fit) (ciudad ?nom) (Continente ?cont2))
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  (test (>= ?fit 0))
  (test (not (member ?nom $?ciudades)))
  ;; unificamos con todos los dias por ciudad posibles
  ?fix <- (fix_dias_por_ciudad (dias_por_ciudad ?dias_por))
  (test (>= ?max (+ ?dur ?dias_por) ) )
  (test (<= (+ (length$ $?ciudades) 1) ?ciumax))
  (test (<= (+ ?dur ?dias_por) ?max) )
  (not (exists (and (ciudad_escogida (nom_ciudad ?nomc2)) (test (eq ?nomc2 ?nom))))) 
=>
  (assert (continent_rule_not_respected))
  (assert (ciudad_escogida (nom_ciudad ?nom)))
  (bind $?aux (insert$ $?ciudades (+ (length$ ?ciudades) 1 ) ?nom))
  (bind $?aux2 (insert$ $?dpor (+ (length$ ?dpor) 1 ) ?dias_por))
  (assert (estructura (ciudad ?nom) (dias ?dias_por) (ocupacion 0) ))
  (if (eq "placeholder" ?cont)
   then (modify ?vi (ciudades ?aux) (duracion (+ ?dur ?dias_por)) (dias_por_ciudad ?aux2) (continente ?cont2))
   else
     (modify ?vi (ciudades ?aux) (duracion (+ ?dur ?dias_por)) (dias_por_ciudad ?aux2) )
   )
)

(defrule LOGIC::comprovar
  (declare (salience 40))
 (not (logica-acabada))
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  ?vi <- (viaje (ciudades $?ciudades) (duracion ?dur))
 =>
  (if (<=  ?min ?dur)
   then (printout t "No se puede programar un viaje" crlf) (focus ERROR)
 )
  (if (not (<= ?ciumin (length$ ?ciudades) ))
   then (printout t "No se puede programar un viaje" crlf) (focus ERROR)
  )
  )

(defrule LOGIC::assertsciudades
  (declare (salience 25))
 (not (logica-acabada))
  (not (assertsciudades))
  ?vi <- (viaje (ciudades $?ciu))
  =>
  (bind ?i 1)
  (while (< ?i (length$ ?ciu)) 
    ;; bucle hasta < para que no pete con la ultima iter (usamos i y i+1, habra que añadir vuelo del origen a la primera y de la ultima al origen!)
  do
      (bind ?ciuA (nth$ ?i ?ciu))
      (bind ?ciuB (nth$ (+ ?i 1) ?ciu))
      (assert (nextciudad (desde ?ciuA) (hacia ?ciuB)))
      (bind ?i (+ ?i 1)) 
  )
  (assert (assertsciudades))
)

(defrule LOGIC::initialize_alojamiento_puntuado
  (declare (salience 10))
 (not (logica-acabada))
  ?user <- (usuario (calidad-alojamiento ?cal))
  ?aloj <- (object (is-a Alojamiento) (Nombre ?nom) (Distancia_a_centro ?dist) (Estrellas ?est))
=>
  (bind ?fit 0)
  (if (< ?dist 5) then (bind ?fit (+ ?fit 10)) )
  (if (< ?cal ?est) then (bind ?fit (+ ?fit 90)) )
(assert (alojamiento_puntuado (alojamiento-nom ?nom) (fitness ?fit) ) )
)


(defrule LOGIC::escoger-alojamiento
  (declare (salience 9) )
 (not (logica-acabada))
  ?todosv <- (object (is-a Ciudad) (Nombre ?nomc2))
  ?vi <- (viaje (alojamientos $?alojs) (ciudades $?ciu) (coste ?costev))
  (test (member ?nomc2 $?ciu))
  (not (exists (fix_aloj (nom_ciudad ?nomc2))))
  ?aloj <- (object (is-a Alojamiento) (Nombre ?nom) (Estrellas ?est) (precio ?costea) (esta_en ?ciu2))
  ?aloj_p <- (alojamiento_puntuado (alojamiento-nom ?nom_p) (fitness ?fit))
  (test (eq ?nom ?nom_p))
  (test (not (member ?nom $?alojs) ) )
  ?u <- (usuario (presupuesto ?pres) (calidad-alojamiento ?cal))
  (test (>= ?fit 10) )
  (test (>= ?est ?cal) )
  (test (eq ?nomc2 (str-cat ?ciu2) ))
  
  ?estruct <- (estructura (ciudad ?c) (dias ?d) (ocupacion ?o))

  (test (eq ?c ?nomc2))
  (test (<= (+ ?costev (* ?costea ?d)) ?pres))
 =>
  (assert (fix_aloj (nom_ciudad ?nomc2) ))
  (bind $?aux (insert$ $?alojs (+ (length$ ?alojs) 1 ) ?nom_p))
  (modify ?vi (alojamientos ?aux) (coste (+ ?costev (* ?costea ?d)) ))
   )


(defrule LOGIC::escoger-transporte
  (declare (salience 10))
 (not (logica-acabada))
  (assertsciudades)
  ?vi <- (viaje (ciudades $?ciu) (transporte $?medios) (coste ?costev))
  ?todosv <- (object (is-a Ciudad) (Nombre ?nomc2))
  ?todosv2 <- (object (is-a Ciudad) (Nombre ?nomc3))
  (test (not(eq ?nomc2 ?nomc3)))
  (test (member ?nomc2 $?ciu))
  (test (member ?nomc3 $?ciu))
  ?next <- (nextciudad (desde ?c1) (hacia ?c2))
  (test (and (eq ?c1 ?nomc2) (eq ?c2 ?nomc3)))
  ?u <- (usuario (medios-de-transporte $?trans) (presupuesto ?pres))
  ?transporte <- (object (is-a Transporte) (Nombre ?nomt) (va_a ?va) (parte_de ?parte) (precio ?costet))
  (test (and (eq ?nomc2 (str-cat ?va)) (eq ?nomc3 (str-cat ?parte))))
  (test (not( member (lowcase (class ?transporte)) $?trans)))
  (test (not(member ?nomt $?medios)))
  (test (<= (+ ?costev ?costet) ?pres))
  (not (exists (fix_trans (nom_ciudad ?nomc2))))
  =>
  (bind ?xd (eq ?nomc2 ?parte))
  (bind $?aux (insert$ $?medios (+ (length$ ?medios) 1 ) ?nomt))
  (modify ?vi (transporte $?aux) (coste (+ ?costev ?costet)))
  (assert (fix_trans (nom_ciudad ?nomc2) ))
)


 (defrule LOGIC::escoger-actividades
   (not (logica-acabada))
   ?vi <- (viaje (ciudades $?ciu) (actividades $?actividade) (coste ?costev))
   ?est <- (estructura (ciudad ?c) (dias ?d) (ocupacion ?o))
   ?todosv <- (object (is-a Ciudad) (Nombre ?nomc))
   (test (member ?c $?ciu))
   ?u <- (usuario (presupuesto ?pres))
   ?activ <- (object (is-a Actividad) (Nombre ?nactiv)
		     (Duracion_actividad ?duracion) (se_hacen_en ?nhacen) (precio ?costea))
   (test (not (member ?nactiv $?actividade)))
   (test (<= (+ ?o ?duracion) (* ?d 100)))
   (test (eq ?c (str-cat ?nhacen)))
   (test (<= (+ ?costev ?costea) ?pres))
  =>
   (if (not (member ?c $?actividade))
    then (bind ?firstactiv (create$ ?c ?nactiv))
	 (bind $?aux2 (insert$ $?actividade (+ (length$ ?actividade) 1 ) ?firstactiv))
	 (modify ?vi (actividades ?aux2) (coste (+ ?costev ?costea)))
    else
      (bind $?aux (insert$ $?actividade (+ (length$ ?actividade) 1 ) ?nactiv))
      (modify ?vi (actividades ?aux) (coste (+ ?costev ?costea)))
  )
   (modify ?est (ocupacion (+ ?o ?duracion)))
 )

(defrule LOGIC::acaba-la-logica "Ultima funcion que se ejecuta de la logica"
  (declare (salience -5))
 (assertsciudades)
 (not (logica-acabada))
 =>
  (assert (logica-acabada))
  (focus RESULTADOS)
)
;---------------------------------------------------------------------------------------
;                                 MODULO DE RESULTADOS                                 -
;---------------------------------------------------------------------------------------
;; rules from other modules can be activated if they are imported
(defmodule RESULTADOS "Printar resultados obtenidos" (import MENU ?ALL)
  (import MAIN ?ALL) (import LOGIC ?ALL) (import INFERENCIA ?ALL)
    )

(defrule RESULTADOS:printar_plantilla_rule
  (not (printar_plantilla))
  =>
  (printout t "----------------------------------------------------------------------------------------------" crlf
              "-                                        PRIMER VIAJE                                        -" crlf
              "----------------------------------------------------------------------------------------------" crlf 
              crlf
  )
  (assert (printar_plantilla))
)

(defrule RESULTADOS:printar_viaje_rule
  (not (printar_viaje))
  (printar_plantilla)
  ?vi <- (viaje (duracion ?d) (ciudades $?ciu) (dias_por_ciudad $?diasciu)
		(actividades $?activ) (alojamientos $?aloj) (transporte $?trans) (coste ?costev))
  =>
  (printout t "Duracion del viaje: " ?d  " dias" crlf crlf)

  (printout t "Ciudades visitadas: ")
  (bind ?i 1)
  (while (<= ?i (length$ ?ciu))
    (bind ?ciudad (nth$ ?i ?ciu))

    (bind ?diasporciu (nth ?i ?diasciu))

    (printout t ?ciudad "(" ?diasporciu "), " )
    (bind ?i (+ ?i 1)) 
  )
  (printout t crlf crlf "Visitas: ")
  (bind ?j (length$ ?activ))
  (while (>= ?j 1)
    (bind ?nactiv (nth$ ?j ?activ))
    (printout t ?nactiv ", ")
     (bind ?j (- ?j 1)) 
  )

  (printout t crlf crlf "Alojamientos: ")
  (bind ?k (length$ ?aloj))
  (while (>= ?k 1)
    (bind ?naloj (nth$ ?k ?aloj))
    (printout t ?naloj ", ")
     (bind ?k (- ?k 1)) 
  )

  (printout t crlf crlf "Transporte: ")
  (bind ?l (length$ ?trans))
  (while (>= ?l 1)
    (bind ?ntrans (nth$ ?l ?trans))
    (printout t ?ntrans ", ")
     (bind ?l (- ?l 1)) 
     )
  (printout t crlf crlf "Coste total del viaje: " ?costev crlf)
  (printout t crlf)
  (assert (printar_viaje))
)

(defrule RESULTADOS::not_continente ""
  (printar_plantilla)
  ?est <- (continent_rule_not_respected)
 =>
  (printout t  "Los viajes no pueden ser del mismo continente" crlf)
  (retract ?est)
  )

(defrule RESULTADOS::acaba-resultados
  (declare (salience -5))
 (printar_plantilla)
 (printar_viaje)
 (not (preparar_segundo_viaje))
 =>
 (assert (preparar_segundo_viaje))
)

(defrule RESULTADOS::printar_plantilla_rule2
  (preparar_segundo_viaje)
  (not (printar_plantilla2))
  (not (segundo_viaje))
  =>
  (printout t "----------------------------------------------------------------------------------------------" crlf
              "-                                        SEGUNDO VIAJE                                       -" crlf
              "----------------------------------------------------------------------------------------------" crlf 
              crlf
  )
  (assert (printar_plantilla2))
)

(defrule RESULTADOS::preparar_segundo_viaje_aloj_punt ""
  ?est <- (alojamiento_puntuado)
  (preparar_segundo_viaje)
  (not (segundo_viaje))
  (printar_plantilla2)
=>
  (retract ?est)
  )

(defrule RESULTADOS::preparar_segundo_viaje_next_ciudad ""
  ?est <- (nextciudad)
  (preparar_segundo_viaje)
  (not (segundo_viaje))
  (printar_plantilla2)
=>
  (retract ?est)
  )
(defrule RESULTADOS::preparar_segundo_viaje_fix_trans ""
  ?est <- (fix_trans)
  (preparar_segundo_viaje)
  (not (segundo_viaje))
  (printar_plantilla2)
=>
  (retract ?est)
  )

(defrule RESULTADOS::preparar_segundo_viaje_fix_aloj ""
  ?est <- (fix_aloj)
  (preparar_segundo_viaje)
  (not (segundo_viaje))
  (printar_plantilla2)
=>
  (retract ?est)
  )

(defrule RESULTADOS::preparar_segundo_viaje_estr ""
  ?est <- (estructura)
  (preparar_segundo_viaje)
  (not (segundo_viaje))
  (printar_plantilla2)
 =>
  (retract ?est)
  )

(defrule RESULTADOS::preparar_segundo_viaje "Busca el viaje de nuevo, pero con ciudades distintas"
  ?vi <- (viaje)
  (preparar_segundo_viaje) 
  (not (segundo_viaje))
  ?pri <- (printar_viaje)
  ?asciu <- (assertsciudades)
  ?logic <- (logica-acabada)
 =>
  (bind ?ciud (create$))
  (bind ?alojs (create$))
  (bind ?trans (create$))
  (bind ?act (create$))
  (bind ?dias_por (create$))
  (modify ?vi (duracion 0) (coste 0)
	  (continente "placeholder") (ciudades ?ciud) (alojamientos ?alojs)
	  (transporte ?trans) (actividades ?act) (dias_por_ciudad ?dias_por)
	  )
  (retract ?pri)
  (retract ?asciu)
  (retract ?logic)
  (assert (segundo_viaje))
  (focus LOGIC)
)


;---------------------------------------------------------------------------------------
;                                 MODULO DE ERROR                                      -
;---------------------------------------------------------------------------------------

(defmodule ERROR "No se ha podido programar un viaje")