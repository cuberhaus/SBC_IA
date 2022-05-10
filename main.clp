; (defmodule MENU "Inicio del programa")
; (focus MENU)

(defrule preguntar-edad
  (not (preguntado-edad))
 =>
  (assert(preguntado-edad))
)

(defrule preguntar-nivel-cultural
  (not (preguntado-nivel-cultural))
 =>
  (assert(preguntado-nivel-cultural))
)

(defrule preguntar-con-ninos
  (not (preguntado-con-ninos))
 =>
  (assert(preguntado-con-ninos))
)

(defrule preguntar-con-adolescentes
  (not (preguntado-con-adolescentes))
 =>
  (assert(preguntado-con-adolescentes))
)

(defrule preguntar-con-numero-integrantes
  (not (preguntado-con-numero-integrantes))
 =>
  (assert(preguntado-con-numero-integrantes))
)

(defrule preguntar-tipo-de-viaje
  (not (preguntado-tipo-de-viaje))
 =>
  (assert(preguntado-tipo-de-viaje))
)

(defrule preguntar-ciudades-preferidas
  (not (preguntado-ciudades-preferidas))
 =>
  (assert(preguntado-ciudades-preferidas))
)

(defrule preguntar-dias-minimo
  (not (preguntado-dias-minimo))
 =>
  (assert(preguntado-dias-minimo))
)

(defrule preguntar-dias-maximo
  (not (preguntado-dias-maximo))
 =>
  (assert(preguntado-dias-maximo))
)

(defrule preguntar-ciudades-minimo
  (not (preguntado-ciudades-minimo))
 =>
  (assert(preguntado-ciudades-minimo))
)

(defrule preguntar-ciudades-maximo
  (not (preguntado-ciudades-maximo))
 =>
  (assert(preguntado-ciudades-maximo))
)

(defrule preguntar-presupuesto
  (not (preguntado-presupuesto))
 =>
  (assert(preguntado-presupuesto))
)

(defrule preguntar-medios-de-transporte
  (not (preguntado-medios-de-transporte))
 =>
  (assert(preguntado-medios-de-transporte))
)

(defrule preguntar-calidad-alojamiento
  (not (preguntado-calidad-alojamiento))
 =>
  (assert(preguntado-calidad-alojamiento))
)

(defrule preguntar-popularidad-ciudad
  (not (preguntado-popularidad-ciudad))
 =>
  (assert(preguntado-popularidad-ciudad))
)

(defrule preguntar-duracion-o-calidad
  (not (preguntado-duracion-o-calidad))
 =>
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
  (preguntado-dias-minimo)
  (preguntado-dias-maximo)
  (preguntado-ciudades-minimo)
  (preguntado-ciudades-maximo)
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
  (slot edat (type INTEGER))

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