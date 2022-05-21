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

(deftemplate MENU::estructura "Estructura que nos permite asociar ciudades con los dias que van a ocupar y como de ocupada esta la estancia en esa ciudad (por las actividades que se hacen alli)"
  (slot dias (type INTEGER))
  (slot ocupacion (type INTEGER))
  (multislot ciudad (type STRING))
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

(deftemplate MENU::alojamiento_puntuado "Puntuacion que nos permite saber cual es el mejor alojamiento para el usuario"
  (slot fitness (type INTEGER) (range 0 100) (default 0))
  (slot alojamiento-nom (type STRING) )
  )

(deftemplate MENU::nextciudad "Permite saber el orden en que visitamos las ciudades"
  (slot desde (type STRING))
  (slot hacia (type STRING))
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
  (not (preguntado-edad))
  ?user <- (usuario)
 =>
  (bind ?edades (pregunta-llista "Escriba las edades de los participantes separados por espacios" 0 100))
  (printout t "Su edad es: " ?edades crlf)
  (modify ?user (edades ?edades))
  (assert(preguntado-edad))
)


(defrule MENU::preguntar-nivel-cultural ;; TODO:
  (not (preguntado-nivel-cultural))
 =>
  (assert(preguntado-nivel-cultural))
)


(defrule MENU::preguntar-tipo-de-viaje
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
  (not (preguntado-ciudades-preferidas))
 =>
  (assert(preguntado-ciudades-preferidas))
)

(defrule MENU::preguntar-dias
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
  (not (preguntado-presupuesto))
  ?user <- (usuario)
 =>
  (bind ?presupuesto (pregunta-float "De cuanto presupuesto disponeis (en euros €)" 100 100000000))
  (modify ?user (presupuesto ?presupuesto))
  (printout t "Su presupuesto es de " ?presupuesto  "€"crlf)
  (assert(preguntado-presupuesto))
)
(defrule MENU::preguntar-medios-de-transporte
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
  (not (preguntado-calidad-alojamiento))
  ?user <- (usuario)
 =>
  (bind ?tipocalidadalojamiento (pregunta-int "Que calidad de alojamiento se prefiere (de minimo)" 1 5))
  (modify ?user (calidad-alojamiento ?tipocalidadalojamiento))
  (printout t "Se buscaran alojamientos de calidad: " ?tipocalidadalojamiento crlf)
  (assert(preguntado-calidad-alojamiento))
)

(defrule MENU::preguntar-popularidad-ciudad
  (not (preguntado-popularidad-ciudad))
  ?user <- (usuario)
 =>
  (bind ?respuesta (si-o-no-p "Prefiere visitar ciudades/lugares poco conocidos")) 
  (printout t "Respuesta " ?respuesta crlf)
  (modify ?user (lugares_poco_conocidos ?respuesta))
  (assert(preguntado-popularidad-ciudad))
)

(defrule MENU::preguntar-duracion-o-calidad
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
 =>
  (assert (preguntas-acabadas))
  (focus INFERENCIA)
)

;---------------------------------------------------------------------------------------
;                                 MODULO DE INFERENCIA                                 -
;---------------------------------------------------------------------------------------

(defmodule INFERENCIA "Inferir propiedades de los usuarios con los datos obtenidos"
  (import MENU ?ALL) (import MAIN ?ALL) (export ?ALL))

(defrule INFERENCIA::con-ninos "Inferimos si hay niños con las edades introducidas"
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
  (not (preguntado-con-numero-integrantes))
  (preguntado-edad)
 ?user <- (usuario (edades $?edades))
 =>
 (bind ?num_integrantes (length$ ?edades) )
  (modify ?user (numero-integrantes ?num_integrantes))
  (assert(preguntado-con-numero-integrantes))
)


(defrule INFERENCIA::obtenertipousuarios
  (not (inferencia_tipo_usuario_asked))
  (preguntado-con-numero-integrantes)
  ?user <- (usuario (ninos ?n) (numero-integrantes ?num_integrantes))
  =>
  (printout t ?num_integrantes crlf) 
  (if (eq ?num_integrantes 1) then (modify ?user (tipo-usuario "individual"))) 
  (if (eq ?num_integrantes 2) then (modify ?user (tipo-usuario "pareja")))
  (if (and (and (>= ?num_integrantes 3) (<  ?num_integrantes 10)) (eq ?n TRUE))
   then (modify ?user (tipo-usuario  "familia")))
  (if (and (and (>= ?num_integrantes 3) (<  ?num_integrantes 10)) (eq ?n FALSE))
   then (modify ?user (tipo-usuario  "grupo")))
  (if (>= ?num_integrantes 10) then then (modify ?user (tipo-usuario  "grupo")))
  (assert (inferencia_tipo_usuario_asked))
)

;(defrule INFERENCIA::longitud_viaje
;  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
;  ?vi <- (viaje (continentes $?cont))

;  (not(longitud_viaje)) 
;=>

;  (if (< ?max 6) then (bind $?cont TRUE ) else (bind $?cont FALSE) )

           ; (bind $?escog_ciudades (insert$ $?escog_ciudades (+ (length$ $?escog_ciudades) 1 ) ?ciudad))
;)


(deftemplate MENU::ciudad_puntuada
  (slot fitness (type INTEGER) (range 0 100) (default 0))
  (slot ciudad (type STRING) )
  (slot Continente (type STRING) )
  )

(defrule INFERENCIA::ciudades_romanticas
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
  ?user <- (usuario (tipo-usuario ?tuser))
  (not (tipo_viaje_inferido))
  =>
  (if (eq ?tuser "individual") then (printout t "No será romantico"))
  (if (eq ?tuser "pareja") then (printout t "será romanatico")) 
  (if (eq ?tuser "familia") then (printout t "No será de descanso"))
  (assert (tipo_viaje_inferido))
)

(deftemplate INFERENCIA::fix_dias_por_ciudad
  (slot dias_por_ciudad (type INTEGER) ) 
  )

(defrule INFERENCIA::initialize_dias_por_ciudad
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
  ; (longitud_viaje)
  (tipo_viaje_inferido)

  (preguntado-con-ninos)
  (preguntado-con-adolescentes)
  (preguntado-con-numero-integrantes)
  =>
   (focus LOGIC)
)

;---------------------------------------------------------------------------------------
;                                   MODULO DE LOGICA                                   -
;---------------------------------------------------------------------------------------


(defmodule LOGIC "logica del programa" (import MENU ?ALL) (import MAIN ?ALL) (import INFERENCIA ?ALL) (export ?ALL))

(deftemplate LOGIC::fix_aloj
  (slot nom_ciudad (type STRING) ) 
  )

(defrule LOGIC::escoger-ciudades-rule
  (declare (salience 50))
  ?vi <- (viaje (ciudades $?ciudades) (duracion ?dur) (dias_por_ciudad $?dpor) (continentes ?use_cont) (continente ?cont))
;?todosv <- (object (is-a Ciudad) (Nombre ?nomc))
  ?ciupunt <- (ciudad_puntuada (fitness ?fit) (ciudad ?nom) (Continente ?cont2))
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  (test (>= ?fit 40))
  (test (not (member ?nom $?ciudades)))
  ;; unificamos con todos los dias por ciudad posibles
  ?fix <- (fix_dias_por_ciudad (dias_por_ciudad ?dias_por))
  (test (>= ?max (+ ?dur ?dias_por) ) )
  (test (<= (+ (length$ $?ciudades) 1) ?ciumax))
  (test (<= (+ ?dur ?dias_por) ?max) )
  (test (and (eq ?use_cont TRUE) (or (eq ?cont "placeholder") (eq ?cont ?cont2)) ) ) 
=>
  (printout t "debug 1")
  (printout t ?nom " amb fitness: " ?fit)
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
  ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
  ?vi <- (viaje (ciudades $?ciudades) (duracion ?dur))
 =>
  (if (<=  ?min ?dur)
   then (if not(<= ?ciumin (length$ ?ciudades) ) ) then ("No se puede programar un viaje") (focus ERROR)
  )
)

; (defrule LOGIC::escoger-ciudades-rule
;   (not (escoger-ciudades))
; ?user <- (usuario (dias-minimo ?min) (dias-maximo ?max) (diasporciudad-minimo ?diasciumin) (diasporciudad-maximo ?diasciumax) (ciudades-minimo ?ciumin) (ciudades-maximo ?ciumax))
; ?vi <- (viaje (ciudades $?ciudades))
; ; ?vi <- (viaje (ciudades $?ciudades) )
; =>
;   (bind ?dies  (/ (+ ?min ?max) 2))
;   (bind $?escog_ciudades (create$ ))
;   (bind $?escog_dias_ciudades (create$ ))
;   (bind ?llista_ciutats (find-all-instances ((?instancia Ciudad)) TRUE))
;   (bind ?i 0)
;   (bind ?tomodify 0)
;   (bind ?j 1)
;   (bind ?nciu 0)
;   (while (and (< ?i ?dies) (<= ?j (length$ ?llista_ciutats)) (< ?nciu ?ciumax))
;      do
;        (bind ?diasciu (+ (mod (random) ?diasciumax) ?diasciumin))
;        (bind ?ciudad (nth$ ?j ?llista_ciutats))
;        (bind ?nomciudad (send ?ciudad get-Nombre))
;        (bind ?suma (+ ?diasciu ?i))
;        (if (<= ?suma ?dies) then
;            (bind $?escog_ciudades (insert$ $?escog_ciudades (+ (length$ $?escog_ciudades) 1 ) ?nomciudad))
;            (bind $?escog_dias_ciudades (insert$ $?escog_dias_ciudades (+ (length$ $?escog_dias_ciudades) 1 ) ?diasciu))

; 	   ;(bind ?estruct (assert (estructura (dias ?diasciu) (ciudad ?nomciudad) (ocupacion 0) )) )
;      ;(bind $?est (insert$ $?est (+ (length$ $?est) 1 ) ?estruct))
;           (printout t ?nomciudad)
;           (assert (estructura (ciudad ?nomciudad) (dias ?diasciu) (ocupacion 0) ))
;            (bind ?i (+ ?i ?diasciu))
;            (bind ?j (+ ?j 1))
;            (bind ?nciu (+ ?nciu 1))
	    
;            (bind ?tomodify ?i)
;        )
;        (if (> ?suma ?dies) then 
;         (bind ?i (+ ?i ?diasciu))
;        (bind ?j (+ ?j 1))
;        (bind ?nciu (+ ?nciu 1))
;        )
       
;   )
;   (printout t $?escog_ciudades crlf)
;   (modify ?vi (ciudades $?escog_ciudades) (dias_por_ciudad $?escog_dias_ciudades) (duracion ?tomodify))
;   ;bind ?llista_ciutats (find-all-instances ((?instancia Ciudad)) TRUE))
;   ;(bind ?aux (send ?ciudad get-Nombre))
;   (assert (escoger-ciudades))

;   (printout t "debug 2" )
; ) 

(defrule LOGIC::initialize_alojamiento_puntuado
  (declare (salience 10))
  ?user <- (usuario (calidad-alojamiento ?cal))
  ?aloj <- (object (is-a Alojamiento) (Nombre ?nom) (Distancia_a_centro ?dist) (Estrellas ?est))
=>
  (printout t "aloj_puntuado" crlf)
  (bind ?fit 0)
  (if (< ?dist 5) then (bind ?fit (+ ?fit 10)) )
  (if (< ?cal ?est) then (bind ?fit (+ ?fit 90)) )
(assert (alojamiento_puntuado (alojamiento-nom ?nom) (fitness ?fit) ) )
  (printout t "debug 3" )
)

; (defrule LOGIC::evaluate-alojamiento
;  ; (declare (salience 40))
;   (escoger-ciudades)
;   ; (ini_alojamientos)
;   ; ?user <- (usuario)
;  ;?aloj <- (object  (is-a Alojamiento) (Distancia_a_centro ?dist) (Nombre ?nom) )
;  ?aloj_punt <- (alojamiento_puntuado (alojamiento-nom ?aloj2) (fitness ?fit))	    
;  ;(test (eq (str-cat ?nom) (str-cat ?aloj2)))
; ; (test (eq ?nom ?aloj2))
; => 
;  (bind ?puntuacion (+ ?fit 10) ) 
;  (modify ?aloj_punt (fitness ?puntuacion))
;  (printout t "funciona: " ?aloj2 crlf)
; )

(defrule LOGIC::escoger-alojamiento
  (declare (salience 9) )
  (not (escoger-alojamiento))
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

   (test (<= (+ ?costev ?costea) ?pres))
 =>
  (assert (fix_aloj (nom_ciudad ?nomc2) ))
  (bind $?aux (insert$ $?alojs (+ (length$ ?alojs) 1 ) ?nom_p))
  (modify ?vi (alojamientos ?aux) (coste (+ ?costev ?costea)))
  (printout t "debug 4")
   )

;  (defrule LOGIC::escoger-alojamiento
;  ?vi <- (viaje (ciudades $?ciu))
;  (escoger-ciudades)
;  (not (escoger-alojamiento))
;  =>
;  (bind ?i 1)
;  (bind $?escog_aloj (create$ ))
;  (while (<= ?i (length$ ?ciu))
;    do
;    (bind ?ciuaux (nth$ ?i ?ciu))
;    ;(bind ?aux (send ?ciuaux get-Nombre))
;    ;(printout t ?ciuaux crlf)
;    (bind ?llista_aloja (find-all-instances ((?inst Alojamiento)) (eq ?inst:esta_en ?ciuaux)))
;    (bind ?alojamiento (nth$ 1 ?llista_aloja))
;    ;(bind ?aloj_name (send (nth$ 1 (find-instance ((?inst Alojamiento)) (eq ?inst:esta_en ?ciuaux))) get-Nombre))

;    (bind ?aloj_name (send ?alojamiento get-Nombre))
;    (bind $?escog_aloj (insert$ $?escog_aloj (+ (length$ $?escog_aloj) 1 ) ?aloj_name))

;    (bind ?i (+ ?i 1))
;  )
;    (modify ?vi (alojamientos $?escog_aloj))
; (assert (escoger-alojamiento))
;   (printout t "funciona: " ?nom crlf)
;  )


 ;(defrule LOGIC::escoger-actividades
 ;  ?vi <- (viaje (ciudades $?ciu) (dias_por_ciudad $?c_dia_i))
 ; (escoger-ciudades)
 ; (not (escoger-actividades))
 ;=>
 ;  (bind ?i 1)
 ;  (bind $?escog_activ (create$ ))
 ;  (while (<= ?i (length$ ?ciu))
 ;  do
 ;    (bind ?ciuactual (nth$ ?i ?ciu))
 ;    (bind ?nciuactual (send ?ciuactual get-Nombre))
 ;    (bind ?ciudad_dia (nth$ ?i ?c_dia_i))
 ;   (bind $?escog_activ (insert$ $?escog_activ (+ (length$ ?escog_activ) 1 ) ?nciuactual))

 ;    (bind ?aux (* ?ciudad_dia 100))

 ;     (bind ?actividades (find-all-instances ((?inst Actividad)) (eq ?inst:se_hacen_en ?ciuactual)) )
 ;     (bind ?j 0)
 ;     (bind ?k 1)
 ;     (while (and (<= ?j ?aux) (<= ?k (length$ ?actividades)))
 ;     do
 ;       (bind ?activ (nth$ ?k ?actividades))
 ;       (bind ?nomactiv (send ?activ get-Nombre))
 ;       (bind ?tempsactiv (send ?activ get-Duracion_actividad))
 ;       (printout t ?activ crlf)
 ;       (bind ?suma (+ ?j ?tempsactiv))
 ;       (if (<= ?suma ?aux) then 
 ;         (bind $?escog_activ (insert$ $?escog_activ (+ (length$ ?escog_activ) 1 ) ?nomactiv))
 ;       )
 ;       (bind ?j ?suma)
 ;       (bind ?k (+ ?k 1))
 ;     )
 ;     (bind ?i (+ ?i 1))   
 ;  )
 ;     (modify ?vi (actividades $?escog_activ))
 ;     (assert (escoger-actividades))
 ; )

(defrule LOGIC::assertsciudades
  (declare (salience 25))
  (not (assertsciudades))
  ?vi <- (viaje (ciudades $?ciu))
  =>
  (printout t "assert_cities" crlf)
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
  (printout t "debug 6")
)

(deftemplate LOGIC::fix_trans
  (slot nom_ciudad (type STRING))
  )

(defrule LOGIC::escoger-transporte
  (declare (salience 10))
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
  (printout t "escoger_transporte" crlf)
  (bind ?xd (eq ?nomc2 ?parte))
  (printout t (lowcase (class ?transporte)) crlf)
  (printout t ?nomc2 "   and   " ?nomc3 "   and   " ?nomt crlf)
  (bind $?aux (insert$ $?medios (+ (length$ ?medios) 1 ) ?nomt))
  (modify ?vi (transporte $?aux) (coste (+ ?costev ?costet)))
  (assert (fix_trans (nom_ciudad ?nomc2) ))
  (printout t "debug 7" )
)


; (defrule LOGIC::escoger-transporte
;    ?vi <- (viaje (ciudades $?ciu))
;    ?u <- (usuario (medios-de-transporte $?trans))
;   (escoger-ciudades)
;   (not (escoger-transporte))
;  =>
;    (bind ?i 1)
;    (bind $?escog_transporte (create$ ))
;    (while (< ?i (length$ ?ciu)) 
;    ;; bucle hasta < para que no pete con la ultima iter (usamos i y i+1, habra que añadir vuelo del origen a la primera y de la ultima al origen!)
;    do
;      (bind ?ciuA (nth$ ?i ?ciu))
;      (bind ?ciuB (nth$ (+ ?i 1) ?ciu))
;      ;(bind ?auxA (send $?ciuA get-Nombre))
;      ;(bind ?auxB (send $?ciuB get-Nombre))

;      (bind ?opciontransporte (find-all-instances ((?inst Transporte)) (and (eq ?inst:parte_de ?ciuA) (eq ?inst:va_a ?ciuB) (not(eq (str-cat (class ?inst)) ?trans))))) 

;      (do-for-instance ((?trans Transporte)) TRUE  (printout t (str-cat (class ?trans)) crlf ) )
     
;      (bind ?optrans (nth$ 1 ?opciontransporte))
;      (bind ?trans_name (send ?optrans get-Nombre))
;      (bind $?escog_transporte (insert$ $?escog_transporte (+ (length$ $?escog_transporte) 1 ) ?trans_name)) 

;      (bind ?i (+ ?i 1)) 
;    )
;    (modify ?vi (transporte $?escog_transporte))
;    (assert (escoger-transporte))
;  )

 (defrule LOGIC::escoger-actividades
   ?vi <- (viaje (ciudades $?ciu) (actividades $?actividade) (coste ?costev))
   ?est <- (estructura (ciudad ?c) (dias ?d) (ocupacion ?o))
   ?todosv <- (object (is-a Ciudad) (Nombre ?nomc))
   (test (member ?c $?ciu))
   ?u <- (usuario (presupuesto ?pres))
   ?activ <- (object (is-a Actividad) (Nombre ?nactiv) (Duracion_actividad ?duracion) (se_hacen_en ?nhacen) (precio ?costea))
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
   (printout t "works " ?c "  activity: " ?nactiv crlf)
   (modify ?est (ocupacion (+ ?o ?duracion)))
   (printout t "debug 5" )
 )

(defrule LOGIC::acaba-la-logica "Ultima funcion que se ejecuta de la logica"
  (declare (salience -5))
 (assertsciudades)
 =>
  (printout t "acaba_logica" crlf)
  (assert (logica-acabada))
  (focus RESULTADOS)
)
;---------------------------------------------------------------------------------------
;                                 MODULO DE RESULTADOS                                 -
;---------------------------------------------------------------------------------------

(defmodule RESULTADOS "Printar resultados obtenidos" (import MENU ?ALL) (import MAIN ?ALL) )

(defrule RESULTADOS::acaba-resultados
 (printar_plantilla)
 (printar_viaje)
 =>
 ; aqui seria un buen momento para cambiar el focus
)

(defrule RESULTADOS:printar_plantilla-rule
  (not (printar_plantilla))
  =>
  (printout t "----------------------------------------------------------------------------------------------" crlf
              "-                                        VIAJE OBTENIDO                                       -" crlf
              "----------------------------------------------------------------------------------------------" crlf 
              crlf
  )
  (assert (printar_plantilla))
)

(defrule RESULTADOS:printar_viaje-rule
  (not (printar_viaje))
  (printar_plantilla)
  ?vi <- (viaje (duracion ?d) (ciudades $?ciu) (dias_por_ciudad $?diasciu) (actividades $?activ) (alojamientos $?aloj) (transporte $?trans) (coste ?costev))
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
  (bind ?j 1)
  (while (<= ?j (length$ ?activ))
    (bind ?nactiv (nth$ ?j ?activ))
    (printout t ?nactiv ", ")
     (bind ?j (+ ?j 1)) 
  )

  (printout t crlf crlf "Alojamientos: ")
  (bind ?k 1)
  (while (<= ?k (length$ ?aloj))
    (bind ?naloj (nth$ ?k ?aloj))
    (printout t ?naloj ", ")
     (bind ?k (+ ?k 1)) 
  )

  (printout t crlf crlf "Transporte: ")
  (bind ?l 1)
  (while (<= ?l (length$ ?trans))
    (bind ?ntrans (nth$ ?l ?trans))
    (printout t ?ntrans ", ")
     (bind ?l (+ ?l 1)) 
     )
  (printout t "Coste total del viaje: " ?costev crlf)
  (printout t crlf)
  (assert (printar_viaje))
)

 
;---------------------------------------------------------------------------------------
;                                 MODULO DE ERROR                                      -
;---------------------------------------------------------------------------------------

(defmodule ERROR "No se ha podido programar un viaje")