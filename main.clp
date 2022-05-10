(defmodule MAIN "Inicio del programa")

(defrule MAIN::preguntar-edad
(not preguntado-edad)
=>
(assert(preguntado-edad))
)

(defrule MAIN::preguntar-nivel-cultural
(not preguntado-nivel-cultural)
=>
(assert(preguntado-nivel-cultural))
)

(defrule MAIN::preguntar-con-ninos
(not preguntado-con-ninos)
=>
(assert(preguntado-con-ninos))
)

(defrule MAIN::preguntar-con-adolescentes
(not preguntado-con-adolescentes)
=>
(assert(preguntado-con-adolescentes))
)

(defrule MAIN::preguntar-con-numero-integrantes
(not preguntado-con-numero-integrantes)
=>
(assert(preguntado-con-numero-integrantes))
)

(defrule MAIN::preguntar-tipo-de-viaje
(not preguntado-tipo-de-viaje)
=>
(assert(preguntado-tipo-de-viaje))
)

(defrule MAIN::preguntar-ciudades-preferidas
(not preguntado-ciudades-preferidas)
=>
(assert(preguntado-ciudades-preferidas))
)

(defrule MAIN::preguntar-dias-minimo
(not preguntado-dias-minimo)
=>
(assert(preguntado-dias-minimo))
)

(defrule MAIN::preguntar-dias-maximo
(not preguntado-dias-maximo)
=>
(assert(preguntado-dias-maximo))
)

(defrule MAIN::preguntar-ciudades-minimo
(not preguntado-ciudades-minimo)
=>
(assert(preguntado-ciudades-minimo))
)

(defrule MAIN::preguntar-ciudades-maximo
(not preguntado-ciudades-maximo)
=>
(assert(preguntado-ciudades-maximo))
)

(defrule MAIN::preguntar-presupuesto
(not preguntado-presupuesto)
=>
(assert(preguntado-presupuesto))
)

(defrule MAIN::preguntar-medios-de-transporte
(not preguntado-medios-de-transporte)
=>
(assert(preguntado-medios-de-transporte))
)

(defrule MAIN::preguntar-calidad-alojamiento
(not preguntado-calidad-alojamiento)
=>
(assert(preguntado-calidad-alojamiento))
)

(defrule MAIN::preguntar-popularidad-ciudad
(not preguntado-popularidad-ciudad)
=>
(assert(preguntado-popularidad-ciudad))
)

(defrule MAIN::preguntar-duracion-o-calidad
(not preguntado-duracion-o-calidad)
=>
(assert(preguntado-duracion-o-calidad))
)

(defrule MAIN::acaban-las-preguntas
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
  
  (assert (preguntas-acabadas)
	  ; aqui seria un buen momento para cambiar el focus
)
