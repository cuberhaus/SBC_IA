(defmodule MENU "Inicio del programa")

  ; (assert (preguntado-edad) )
  ; (assert (preguntado-nivel-cultural) )
  ; (assert (preguntado-con-ninos) )
  ; (assert (preguntado-con-adolescentes) )
  ; (assert (preguntado-con-numero-integrantes) )
  ; (assert (preguntado-tipo-de-viaje) )
  ; (assert (preguntado-ciudades-preferidas) )

  ; (assert (preguntado-dias-minimo) )
  ; (assert (preguntado-dias-maximo) )
  ; (assert (preguntado-ciudades-minimo) )
  ; (assert (preguntado-ciudades-maximo) )
  ; (assert (preguntado-presupuesto) )
  ; (assert (preguntado-medios-de-transporte) )
  ; (assert (preguntado-calidad-alojamiento) )
 
  ; (assert (preguntado-popularidad-ciudad) )
  ; (assert (preguntado-duracion-o-calidad) )
(defrule MENU::preguntar-edad
  (not (preguntado-edad))
 =>
  (assert(preguntado-edad))
)

(defrule MENU::preguntar-nivel-cultural
  (not (preguntado-nivel-cultural))
 =>
  (assert(preguntado-nivel-cultural))
)

(defrule MENU::preguntar-con-ninos
  (not (preguntado-con-ninos))
 =>
  (assert(preguntado-con-ninos))
)

(defrule MENU::preguntar-con-adolescentes
  (not (preguntado-con-adolescentes))
 =>
  (assert(preguntado-con-adolescentes))
)

(defrule MENU::preguntar-con-numero-integrantes
  (not (preguntado-con-numero-integrantes))
 =>
  (assert(preguntado-con-numero-integrantes))
)

(defrule MENU::preguntar-tipo-de-viaje
  (not (preguntado-tipo-de-viaje))
 =>
  (assert(preguntado-tipo-de-viaje))
)

(defrule MENU::preguntar-ciudades-preferidas
  (not (preguntado-ciudades-preferidas))
 =>
  (assert(preguntado-ciudades-preferidas))
)

(defrule MENU::preguntar-dias-minimo
  (not (preguntado-dias-minimo))
 =>
  (assert(preguntado-dias-minimo))
)

(defrule MENU::preguntar-dias-maximo
  (not (preguntado-dias-maximo))
 =>
  (assert(preguntado-dias-maximo))
)

(defrule MENU::preguntar-ciudades-minimo
  (not (preguntado-ciudades-minimo))
 =>
  (assert(preguntado-ciudades-minimo))
)

(defrule MENU::preguntar-ciudades-maximo
  (not (preguntado-ciudades-maximo))
 =>
  (assert(preguntado-ciudades-maximo))
)

(defrule MENU::preguntar-presupuesto
  (not (preguntado-presupuesto))
 =>
  (assert(preguntado-presupuesto))
)

(defrule MENU::preguntar-medios-de-transporte
  (not (preguntado-medios-de-transporte))
 =>
  (assert(preguntado-medios-de-transporte))
)

(defrule MENU::preguntar-calidad-alojamiento
  (not (preguntado-calidad-alojamiento))
 =>
  (assert(preguntado-calidad-alojamiento))
)

(defrule MENU::preguntar-popularidad-ciudad
  (not (preguntado-popularidad-ciudad))
 =>
  (assert(preguntado-popularidad-ciudad))
)

(defrule MENU::preguntar-duracion-o-calidad
  (not (preguntado-duracion-o-calidad))
 =>
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
