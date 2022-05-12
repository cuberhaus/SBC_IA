; (defmodule MENU "Inicio del programa")
; (focus MENU)
 ; Fa una pregunta sobre una llista d'elements

;; (load main.clp)
;; (reset)
;; (run)

(defrule saltar-siguiente-modulo
 (declare (salience 10))
 =>
 (focus MENU)
 )
;; defmodule has to go below saltar-siguiente-modulo
(defmodule MENU "Inicio del programa" (export ?ALL))

;; deftemplate has to be at the top
(deftemplate MENU::usuario
  (multislot edades (type INTEGER))

  (slot ninos (type SYMBOL) (allowed-values TRUE FALSE) )
  (slot adolescentes (type SYMBOL) (allowed-values TRUE FALSE) )
  (slot numero-integrantes (type INTEGER) )

  (multislot medios-de-transporte (type STRING) (allowed-values "avion" "tren" "barco"))
  (slot dias-minimo (type INTEGER) )
  (slot dias-maximo (type INTEGER) )
  (slot diasporciudad-minimo (type INTEGER) )
  (slot diasporciudad-maximo (type INTEGER) )
  (slot ciudades-minimo (type INTEGER) )
  (slot ciudades-maximo (type INTEGER) )
  (slot presupuesto (type INTEGER FLOAT) )

  (slot calidad-alojamiento (type INTEGER) )
  (slot popularidad-ciudad (type INTEGER) )
  (multislot duracion-o-calidad (type STRING) (allowed-strings "duracion" "calidad" "mixto"))
  (multislot tipo-viaje (type STRING) (allowed-strings "descanso" "diversion" "romantico" "trabajo" "aventura" "cultural"))
  )

(deftemplate MENU::viaje
  (multislot dias)
  (multislot ciudades)
  )

(deffacts MENU::inicialitzacio
  (usuario)
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
; (bind ?i 1)
 ; (while (<= ?i (length$ ?res))
 ;   do
 ;   (bind ?edad (nth$ ?i ?res))
 ;   (bind ?edad_num (format nil ?edad))
 ;   ; (printout t ?edad_num crlf)
 ;   (printout t ?edad crlf)
 ;   (bind ?i (+ ?i 1))
 ;   )

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

;; ###########################################################
;; ## RULES
;; ###########################################################

; (defrule preguntar-edad
;   (not (preguntado-edad))
;  =>
;   (bind ?edad (pregunta-int "¿Cuantos años tienes?" 0 100))
;   (printout t "Su edad es: " ?edad crlf)

;   (if (and (>= ?edad 10) (< ?edad 17)) then (printout t "Eres adolescente" crlf))
;   (if (< ?edad 10) then (printout t "Eres un niño" crlf))

;   (assert(preguntado-edad))
; )



(defrule MENU::preguntar-edades
  (declare (salience 5))
  (not (preguntado-edad))
  ?user <- (usuario)
 =>
  (bind ?edades (pregunta-llista "Escriba las edades de los participantes separados por espacios" 0 100))
  (printout t "Su edad es: " ?edades crlf)
  (modify ?user (edades ?edades))
  ; (if (and (>= ?edad 10) (< ?edad 17)) then (printout t "Eres adolescente" crlf))
  ; (if (< ?edad 10) then (printout t "Eres un niño" crlf))

  (assert(preguntado-edad))
)


(defrule MENU::preguntar-nivel-cultural
  (not (preguntado-nivel-cultural))
 =>
  (assert(preguntado-nivel-cultural))
)

; Esta realmente ya la he hecho en la de la edad?
(defrule MENU::preguntar-con-ninos
  (not (preguntado-con-ninos))
 ?user <- (usuario (edades $?edades))
 =>
  
  (assert(preguntado-con-ninos))
)

; 12<=x<=20
; Esta realmente ya la he hecho en la de los adolescentes?
(defrule MENU::preguntar-con-adolescentes
  (not (preguntado-con-adolescentes))
 ?user <- (usuario (edades $?edades))
 =>

(bind ?i 1)
 (while (<= ?i (length$ ?edades))
   do
   (bind ?edad (nth$ ?i ?edades))
   ; (bind ?edad_num (format nil ?edad))
   ; (printout t ?edad_num crlf)
   (if ((<= ?edad 20) and)
   (printout t ?edad crlf)
   (bind ?i (+ ?i 1))
   )
  (assert(preguntado-con-adolescentes))
)

(defrule MENU::preguntar-con-numero-integrantes
  (declare(salience 20))
  (not (preguntado-con-numero-integrantes))
  (preguntado-edad)
 ?user <- (usuario (edades $?edades))
 =>
 (bind ?num_integrantes (length$ ?edades) )
  (modify ?user (numero-integrantes ?num_integrantes))
  ; (printout t "PREGUNTA NUMERO" ?num_integrantes crlf)
;  (bind ?nintegrantes (pregunta-int "¿Cuántos integrantes realizareis el viaje?" 1 20))
;  (if (= ?nintegrantes 1) then (printout t "Es un viaje individual" crlf))
;  (if (= ?nintegrantes 2) then (printout t "Es un viaje en pareja" crlf))
 ; (if (and (>= ?nintegrantes 3) ( <= ?nintegrantes 20)) then ((bind ?respuesta (pregunta-restri "¿Sois una familia?" (create$ "si" "no")))
 ;                                                             (if (= ?respuesta "si") then (printout t "Viaje en familia" crlf))
 ;                                                             (if (= ?respuesta "no") then (printout t "V/iaje en grupo" crlf))
 ;                                                             ))
  (assert(preguntado-con-numero-integrantes))
)

(defrule MENU::preguntar-tipo-de-viaje
  (not (preguntado-tipo-de-viaje))
  ?user <- (usuario)
 =>
  (bind ?tipoviaje (pregunta-restri "Que tipo de viaje se quiere realizar" (create$ descanso diversion romantico trabajo aventura cultural)))
  (printout t "Se realiza un viaje de tipo " ?tipoviaje crlf)
  (modify ?user (tipo-viaje ?tipoviaje))
  (assert(preguntado-tipo-de-viaje))
)

(defrule MENU::preguntar-ciudades-preferidas
  (not (preguntado-ciudades-preferidas))
 =>
  (assert(preguntado-ciudades-preferidas))
)

(defrule MENU::preguntar-dias
  ; (declare (salience 20))
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
 ?user <- (usuario)
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
  (bind ?tipoviaje (pregunta-llista "Que medios de transporte se desean evitar" 0 1)) ; 0 y 1 sonvalores basura de momento, habra que hacer una funcion bien
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
 =>
  (bind ?ciudades (pregunta-llista "Que ciudades desean visitar" 0 1)) ; 0 y 1 son valores basura de momento, habra que hacer una funcion bien
  (printout t "Se buscaran rutas con las siguientes ciudades: " ?ciudades crlf)
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
  (preguntado-con-ninos)
  (preguntado-con-adolescentes)
  (preguntado-con-numero-integrantes)
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
    (focus LOGIC)
	  ; aqui seria un buen momento para cambiar el focus
)


(defmodule LOGIC "logica del programa" (import MENU ?ALL))

(defrule LOGIC::escoger-ciudades
?user <- (usuario (dias-minimo ?min) (dias-maximo ?max))
?ciudad <- (is-a USER)
=>
  (bind ?dies  (/ (+ ?min ?max) 2))
  (printout t ?dies crlf)
  (printout t "Ciudad: " (send ?ciudad Nombre) crlf)
)

;---------------------------------------------------------------------------------------
;                                 MODULO DE INFERENCIA                                 -
;---------------------------------------------------------------------------------------

(defmodule INFERENCIA "Inferir propiedades de los usuarios con los datos obtenidos" (import MENU ?ALL))

(defrule INFERENCIA::obtenertipousuarios
  ?user <- (usuario (ninos ?n) (edades $?ed))
  =>
  (printout t (length$ ?ed)) 
)

; (defrule print-user
;   (declare (salience -1))
; ?user <- (usuario)
; =>
;  ; (print t (?user (dias_minimo)) crlf)
; )
; (defrule no-ciudades-repetidas
; =>
; )

; (defrule alojamiento-en-ciudad
; =>
; )

; (defrule transporte-entre-ciudades
; =>
; )


