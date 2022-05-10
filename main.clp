(defmodule MAIN "Inicio del programa")

(defrule MAIN::acaban_las_preguntas
  (preguntado-edad)
  (preguntado-nivel-cultural)
  (preguntado-con-niños)
  (preguntado-con-adolescentes)
  (preguntado-con-numero_integrantes)
  (preguntado-tipo-de-viaje)
  (preguntado-ciudades-preferidas)

  (preguntado-dias-minimo)
  (preguntado-dias-maximo)
  (preguntado-ciudades-minimo)
  (preguntado-ciudades-maximo)
  (preguntado-presupuesto)
  (preguntado-medios-de-transporte)
  (preguntado-calidad-alojamiento)

  (preguntado-ciudades-por-popularidad)
  (preguntado-duracion-o-calidad)

 =>
  
  (assert (preguntas-acabadas)
)
