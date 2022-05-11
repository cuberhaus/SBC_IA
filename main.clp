; (defmodule MENU "Inicio del programa")
; (focus MENU)
 ; Fa una pregunta sobre una llista d'elements

 (deffunction pregunta-llista (?pregunta ?min ?max)
 (format t "%s: %n" ?pregunta)
 ; Llegim una línea sencera (Ex. "Pasta Marisc Fruita")
 (bind ?resposta (readline))
 ; Separem l'string (Ex. "Pasta" "Marisc" "Fruita")
 (bind ?res (str-explode ?resposta))
 ; Retornem els diferents camps (Ex. "Pasta" "Marisc" "Fruita")
 ?res
 )

(defrule preguntar-edades
  (not (preguntado-edad))
 =>
  (bind ?edades (pregunta-llista "Escriba las edades de los participantes separados por espacios" 0 100))
  (printout t "Su edad es: " ?edades crlf)

  ; (if (and (>= ?edad 10) (< ?edad 17)) then (printout t "Eres adolescente" crlf))
  ; (if (< ?edad 10) then (printout t "Eres un niño" crlf))

  (assert(preguntado-edad))
)

(deffunction pregunta-float(?pregunta ?min ?max)
  (printout t ?pregunta crlf "Introduzca su respuesta: ")
  (bind ?param (read))
  (while(not (and (or(floatp ?param) (integerp ?param)) (and (>= ?param ?min) (<= ?param ?max)))) do
    (printout t "Parámetro en formato incorrecto o fuera de rango" crlf crlf)
    (printout t ?pregunta crlf "Introduzca su respuesta: ")
    (bind ?param (read))
  )
  ?param
)

(deffunction pregunta-int(?pregunta ?min ?max)
  (printout t ?pregunta crlf "Introduzca su respuesta: ")
  (bind ?param (read))
  (while(not (and (integerp ?param) (and (>= ?param ?min) (<= ?param ?max)))) do
    (printout t "Parámetro en formato incorrecto o fuera de rango" crlf crlf)
    (printout t ?pregunta crlf "Introduzca su respuesta: ")
    (bind ?param (read))
  )
  ?param
)

(deffunction pregunta-restri(?pregunta $?valores-permitidos)
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

(defrule preguntar-edad
  (not (preguntado-edad))
 =>
  (bind ?edad (pregunta-int "¿Cuantos años tienes?" 0 100))
  (printout t "Su edad es: " ?edad crlf)

  (if (and (>= ?edad 10) (< ?edad 17)) then (printout t "Eres adolescente" crlf))
  (if (< ?edad 10) then (printout t "Eres un niño" crlf))

  (assert(preguntado-edad))
)

(defrule preguntar-nivel-cultural
  (not (preguntado-nivel-cultural))
 =>
  (assert(preguntado-nivel-cultural))
)

; Esta realmente ya la he hecho en la de la edad?
(defrule preguntar-con-ninos
  (not (preguntado-con-ninos))
 =>
  (assert(preguntado-con-ninos))
)

; Esta realmente ya la he hecho en la de los adolescentes?
(defrule preguntar-con-adolescentes
  (not (preguntado-con-adolescentes))
 =>
  (assert(preguntado-con-adolescentes))
)

(defrule preguntar-con-numero-integrantes
  (not (preguntado-con-numero-integrantes))
 =>
;  (bind ?nintegrantes (pregunta-int "¿Cuántos integrantes realizareis el viaje?" 1 20))
;  (if (= ?nintegrantes 1) then (printout t "Es un viaje individual" crlf))
;  (if (= ?nintegrantes 2) then (printout t "Es un viaje en pareja" crlf))
 ; (if (and (>= ?nintegrantes 3) ( <= ?nintegrantes 20)) then ((bind ?respuesta (pregunta-restri "¿Sois una familia?" (create$ "si" "no")))
 ;                                                             (if (= ?respuesta "si") then (printout t "Viaje en familia" crlf))
 ;                                                             (if (= ?respuesta "no") then (printout t "Viaje en grupo" crlf))
 ;                                                             ))
  (assert(preguntado-con-numero-integrantes))
)

(defrule preguntar-tipo-de-viaje
  (not (preguntado-tipo-de-viaje))
 =>
  (bind ?tipoviaje (pregunta-restri "Que tipo de viaje se quiere realizar" (create$ descanso diversion romantico trabajo aventura cultural)))
  (printout t "Se realiza un viaje de tipo " ?tipoviaje crlf)
  (assert(preguntado-tipo-de-viaje))
)

(defrule preguntar-ciudades-preferidas
  (not (preguntado-ciudades-preferidas))
 =>
  (assert(preguntado-ciudades-preferidas))
)

(defrule preguntar-dias
  (not (preguntado-dias))
 =>
  (bind ?min (pregunta-int "¿Cuál es el minimo de dias que quereis de viaje?" 1 365))
  (bind ?max (pregunta-int "¿Cuál es el maximo de dias que quereis de viaje?" 1 365))
  (while (not(<= ?min ?max )) do
    (printout t "Maximo no puede ser menor que el minimo" crlf)
    (bind ?max (pregunta-int "¿Cuál es el maximo de dias que quereis de viaje?" 1 365))
  )
  (printout t "Dias seleccionados, se viajará minimo " ?min " dias y maximo " ?max " dias" crlf)
  (assert(preguntado-dias))
)

(defrule preguntar-nciudades
  (not (preguntado-nciudades))
 =>
  (bind ?min (pregunta-int "¿Cuál es el minimo de ciudades que quereis visitar?" 1 365))
  (bind ?max (pregunta-int "¿Cuál es el maximo de ciudades que quereis visitar?" 1 365))
  (while (not(<= ?min ?max )) do
    (printout t "Maximo no puede ser menor que el minimo" crlf)
    (bind ?max (pregunta-int "¿Cuál es el maximo de ciudades que quereis visitar?" 1 365))
  )
  (printout t "Dias seleccionados, se viajará a minimo " ?min " ciudades y maximo " ?max " ciudades" crlf)
  (assert(preguntado-nciudades))
)

(defrule preguntar-presupuesto
  (not (preguntado-presupuesto))
 =>
  (bind ?presupuesto (pregunta-float "De cuanto presupuesto disponeis (en euros €)" 100 100000000))
  (printout t "Su presupuesto es de " ?presupuesto  "€"crlf)
  (assert(preguntado-presupuesto))
)

(defrule preguntar-medios-de-transporte
  (not (preguntado-medios-de-transporte))
 =>
  (bind ?tipoviaje (pregunta-llista "Que medios de transporte se desean evitar" 0 1)) ; 0 y 1 sonvalores basura de momento, habra que hacer una funcion bien
  (printout t "Se intentaran evitar los siguientes medios de transporte " ?tipoviaje crlf)
  (assert(preguntado-medios-de-transporte))
)

(defrule preguntar-calidad-alojamiento
  (not (preguntado-calidad-alojamiento))
 =>
  (bind ?tipocalidadalojamiento (pregunta-int "Que calidad de alojamiento se prefiere (de minimo)" 1 5))
  (printout "Se buscaran alojamientos de calidad: " ?tipocalidadalojamiento crlf)
  (assert(preguntado-calidad-alojamiento))
)

(defrule preguntar-popularidad-ciudad
  (not (preguntado-popularidad-ciudad))
 =>
  (bind ?ciudades (pregunta-llista "Que ciudades desean visitar" 0 1)) ; 0 y 1 son valores basura de momento, habra que hacer una funcion bien
  (printout "Se buscaran rutas con las siguientes ciudades: " ?ciudades crlf)
  (assert(preguntado-popularidad-ciudad))
)

(defrule preguntar-duracion-o-calidad
  (not (preguntado-duracion-o-calidad))
 =>
  (bind ?respuesta (pregunta-restri "Prefiere duracion, calidad o un mixto" (create$ duracion calidad mixto)))
  (printout "Se priorizara la: " ?respuesta crlf)
  (assert(preguntado-duracion-o-calidad))
)

(defrule acaban-las-preguntas
  (preguntado-edad)
  (preguntado-nivel-cultural)
  (preguntado-con-ninos)
  (preguntado-con-adolescentes)
  (preguntado-con-numero-integrantes)
  (preguntado-tipo-de-viaje)
  (preguntado-ciudades-preferidas)
  (preguntado-dias)
  (preguntado-nciudades)
  (preguntado-presupuesto)
  (preguntado-medios-de-transporte)
  (preguntado-calidad-alojamiento)
  (preguntado-popularidad-ciudad)
  (preguntado-duracion-o-calidad)

 =>
  
  (assert (preguntas-acabadas))
	  ; aqui seria un buen momento para cambiar el focus
)

(deftemplate usuario
  (multislot edades (type INTEGER))

  (slot ninos (type SYMBOL) (allowed-values TRUE FALSE))
  (slot adolescentes (type SYMBOL) (allowed-values TRUE FALSE))
  (slot numero-integrantes (type INTEGER) )


  (slot dias-minimo (type INTEGER) )
  (slot dias-maximo (type INTEGER) )
  (slot ciudades-minimo (type INTEGER) )
  (slot ciudades-maximo (type INTEGER) )
  (slot presupuesto (type INTEGER) )

  (slot calidad-alojamiento (type INTEGER) )
  (slot popularidad-ciudad (type INTEGER) )
  (slot duracion-o-calidad (type SYMBOL) (allowed-values DURACION CALIDAD))

  )

(deffacts inicialitzacio
  (usuario)
  )