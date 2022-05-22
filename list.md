# Module MENU
Templates:
- usuario
- viaje
Rules:
- preguntar-edades
- preguntar-tipo-de-viaje
- preguntar-nivel-cultural NOT WORKING
- preguntar-ciudades-preferidas NOT WORKING
- preguntar-tipo-de-viaje
- preguntar-dias
- preguntar-ndias-ciudad
- preguntar-nciudades
- preguntar-presupuesto
- preguntar-medios-de-transporte
- preguntar-calidad-alojamiento
- preguntar-popularidad-ciudad
- preguntar-duracion-o-calidad
- acaban-las-preguntas
Facts:
- inicialitzacio
Functions:
- pregunta-llista
- pregunta-float
- pregunta-int
- pregunta-restri
- pregunta
- si-o-no-p

# Module INFERENCIA
Templates:
- fix_dias_por_ciudad
- ciudad_puntuada
Rules:
- con-ninos
- con-adolescentes
- numero-integrantes
- obtenertipousuarios
- longitud_viaje
- ciudades_romanticas
- ciudades_descanso
- ciudades_diversion
- ciudades_trabajo
- ciudades_aventura
- ciudades_cultural
- inferir_tipo_viaje
- initialize_dias_por_ciudad
- acabainferencia
# Module LOGIC
Templates:
- fix_aloj
- ciudad_escogida
- fix_trans
- alojamiento_puntuado
- nextciudad
- estructura
Rules:
- escoger-ciudades-rule-high-fit
- escoger-ciudades-rule-low-fit
- escoger-ciudades-rule-low-fit-no-continent
- comprovar
- assertsciudades
- initialize_alojamiento_puntuado
- escoger_alojamiento
- escoger_transporte
- escoger_actividades
- acaba-la-logica

# Module RESULTADOS
Rules:
- printar_plantilla_rule
- printar_viaje_rule
- not_continente
- acaba-resultados
- printar_plantilla_rule2
- preparar_segundo_viaje_aloj_punt
- preparar_segundo_viaje_next_ciudad
- preparar_segundo_viaje_fix_trans
- preparar_segundo_viaje_fix_aloj
- preparar_segundo_viaje_estr
- preparar_segundo_viaje

# Module ERROR
