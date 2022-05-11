(definstances instances
    ([Santiago_de_Compostela] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  98000)
    )

    ([Hostal_Reis_Catolicos] of Hotel
	 (Estrellas  5)
	 (Para_adultos  "false")
	 (esta_en  [Barcelona])
         (Distancia_a_centro  0.0)
         (precio  300)
    )

    ([Casa_de_Afora] of Casa_Rural
	 (esta_en [Santiago_de_Compostela])
	 (Distancia_a_centro  2.9)
	 (precio  150)
    )

    ([Visita_Catedral_Santiago] of Visita_monumento
         (Duracion_actividad  30)
         (precio 10)
    )

    ([Casa_Marcelo] of Gastronomica
         (Duracion_actividad  15)
         (precio 75)
    )

    ([Barcelona] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  1620000)
    )

    ([Bird_House] of Hotel
         (Estrellas  3)
         (Para_adultos  "false")
         (esta_en  [Barcelona])
         (Distancia_a_centro  1.0)
         (precio  60)
    )

    ([Hotel_Vela] of Hotel
         (Estrellas  5)
         (Para_adultos  "false")
         (esta_en  [Barcelona])
         (Distancia_a_centro  3.3)
         (precio  200)
    )


    ([Visita_Sagrada_Familia] of Visita_monumento
         (Duracion_actividad  40)
         (precio 25)
    )


    ([PortAventura] of Aventura
         (Duracion_actividad  100)
         (precio 50)
    )

    ([Roma] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  2873000)
    )

    ([Napoleon_Hotel_Roma] of Hotel
         (Estrellas  4)
         (Para_adultos  "false")
         (esta_en  [Roma])
         (Distancia_a_centro  2.4)
         (precio  70)


    ([Vanity Hotel Navona] of Hotel
	 (Estrellas  2)
         (Para_adultos  "false")
	 (esta_en [Roma])
	 (Distancia_a_centro  1.1)
	 (precio  160)
    )

    ([Visita_Coliseo] of Visita_monumento
         (Duracion_actividad  30)
         (precio  40)
    )


    ([Visita_Museo_Vaticano] of Visita_museo
         (Duracion_actividad  40)
         (precio  17)
    )

    ([Paris] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  10516000)
    )

    ([Hotel_Lutetia] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Paris])
	 (Distancia_a_centro  1.5)
	 (precio  1400)
    )

    ([Hotel Darcet] of Hotel
	 (Estrellas  2)
         (Para_adultos  "false")
	 (esta_en [Paris])
	 (Distancia_a_centro  3.5)
	 (precio  140)
    )

    )

    ([Visita_Louvre] of Visita_museo
         (Duracion_actividad  50)
         (precio  17)
    )


    ([Paseo_Campos_Eliseos] of Relax
         (Duracion_actividad  20)
         (precio 0)
    )

    ([Berlín] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  377000)
    )

    ([Grand Hyatt Berlin] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Berlin])
	 (Distancia_a_centro  1.0)
	 (precio  250)
    )

    ([Flottwell_Berlin_Hotel] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [Berlin])
	 (Distancia_a_centro  1.8)
	 (precio  80)
    )

    ([Puerta_de_Brandeburgo] of Visita_monumento
         (Duracion_actividad  20)
         (precio  0)
    )


    ([Visita_Catedral_Berlin] of Visita_monumento
         (Duracion_actividad  30)
         (precio  7)
    )
    ([Nueva York] of Ciudad
	 (Continente  "Norteamerica")
         (Numero_de_habitantes  8380000)
    )

    ([The Beekman] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Nueva York])
	 (Distancia_a_centro  0.2)
	 (precio  600)
    )

    ([SpringHill Suites] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [Nueva York])
	 (Distancia_a_centro  3.6)
	 (precio  340)
    )

    ([Visita_MET] of Visita_museo
         (Duracion_actividad  40)
         (precio 25)
    )


    ([Visita_Central_Park] of Naturaleza
         (Duracion_actividad  30)
         (precio 0)
    )

    ([Chicago] of Ciudad
	 (Continente  "Norteamerica")
	 (Numero_de_habitantes  2699000)
    )

    ([The_Langham_Chicago] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Chicago])
	 (Distancia_a_centro  0.8)
	 (precio  900)
    )

    ([Hyatt_Place_Chicago_Wicker_Park] of Hotel
         (Estrellas  3)
         (Para_adultos  "false")
         (esta_en [Chicago])
         (Distancia_a_centro  4.7)
         (precio  300)
    )

    ([Millenium_Park] of Naturaleza
         (Duracion_actividad  30)
         (precio  0)
    )


    ([The_Field_Museum] of Visita_museo
         (Duracion_actividad  30)
         (precio  25)
    )


    ([LA] of Ciudad
	 (Continente  "Norteamerica")
	 (Numero_de_habitantes  3973000)
    )

    ([Downtown_Los_Angeles_Proper_Hotel] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [LA])
	 (Distancia_a_centro  2)
	 (precio  730)
    )

    ([The_Metric_Los_Angeles_Downtown] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [LA])
	 (Distancia_a_centro  1.9)
	 (precio  230)
    )

    ([Paseo_de_la_fama] of Visita_monumento
         (Duracion_actividad  15)
         (precio  0)
    )


    ([Santa_Monica] of Naturaleza 
         (Duracion_actividad  30)
         (precio  0)
    )

    ([San_Diego] of Ciudad
	 (Continente  "Norteamerica")
         (Numero_de_habitantes  1415000)
    )

    ([Pendry_San_Diego] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [San_Diego])
	 (Distancia_a_centro  0.3)
	 (precio  725)
    )

    ([Hotel_Marisol_Coronado] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [San_Diego])
	 (Distancia_a_centro  3.6)
	 (precio  350)
    )

    ([Legacy_Resort_Hotel_&_Spa] of Resort
         (Para_adultos "false")
         (esta_en [San_Diego])
	 (Distancia_a_centro  5.3)
	 (precio  200)
    )

    ([San_Diego_Zoo] of Aventura
         (Duracion_actividad  60)
         (precio 70)
    )


    ([Parque_Balboa] of Naturaleza
         (Duracion_actividad  20)
         (precio 20)
    )

    ([Houston] of Ciudad
	 (Continente  "Norteamerica")
	 (Numero_de habitantes  2313000)
    )

    ([JW_Marriott_Houston_Downtown] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Houston])
	 (Distancia_a_centro  0.2)
	 (precio  620)
    )

    ([Holiday_Inn_Houston_Downtown] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [Houston])
	 (Distancia_a_centro  1.1)
	 (precio  190)
    )
)

    ([Visita_Museo_Infantil] of Visita_museo
         (Duracion_actividad  30)
         (precio  25)
    )


    ([Visita_Museo_Ciencias_Naturales] of Visita_museo
         (Duracion_actividad  30)
         (precio  25)
    )