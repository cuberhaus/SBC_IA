(definstances instances
    ([Santiago_de_Compostela] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  98000)
    (Nombre "Santiago_de_Compostela")
    )

    ([Hostal_Reis_Catolicos] of Hotel
	 (Estrellas  5)
	 (Para_adultos  "false")
	 (esta_en  [Barcelona])
         (Distancia_a_centro  0.0)
         (precio  300)
    (Nombre "Hostal_Reis_Catolicos")
    )

    ([Casa_de_Afora] of Casa_Rural
	 (esta_en [Santiago_de_Compostela])
	 (Distancia_a_centro  2.9)
	 (precio  150)
    (Nombre "Casa_de_Afora")
    )

    ([Visita_Catedral_Santiago] of Visita_monumento
         (Duracion_actividad  30)
         (precio 10)
    (Nombre "Visita_Catedral_Santiago")
    )

    ([Casa_Marcelo] of Gastronomica
         (Duracion_actividad  15)
         (precio 75)
    (Nombre "Casa_Marcelo")
    )

    ([Barcelona] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  1620000)
    (Nombre "Barcelona")
    )

    ([Bird_House] of Hotel
         (Estrellas  3)
         (Para_adultos  "false")
         (esta_en  [Barcelona])
         (Distancia_a_centro  1.0)
         (precio  60)
    (Nombre "Bird_House")
    )

    ([Hotel_Vela] of Hotel
         (Estrellas  5)
         (Para_adultos  "false")
         (esta_en  [Barcelona])
         (Distancia_a_centro  3.3)
         (precio  200)
    (Nombre "Hotel_Vela")
    )


    ([Visita_Sagrada_Familia] of Visita_monumento
         (Duracion_actividad  40)
         (precio 25)
    (Nombre "Visita_Sagrada_Familia")
    )


    ([PortAventura] of Aventura
         (Duracion_actividad  100)
         (precio 50)
    (Nombre "PortAventura")
    )

    ([Roma] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  2873000)
    (Nombre "Roma")
    )

    ([Napoleon_Hotel_Roma] of Hotel
         (Estrellas  4)
         (Para_adultos  "false")
         (esta_en  [Roma])
         (Distancia_a_centro  2.4)
         (precio  70)
    (Nombre "Napoleon_Hotel_Roma")
    )

    ([Vanity_Hotel_Navona] of Hotel
	 (Estrellas  2)
         (Para_adultos  "false")
	 (esta_en [Roma])
	 (Distancia_a_centro  1.1)
	 (precio  160)
    (Nombre "Vanity_Hotel_Navona")
    )

    ([Visita_Coliseo] of Visita_monumento
         (Duracion_actividad  30)
         (precio  40)
    (Nombre "Visita_Coliseo")
    )


    ([Visita_Museo_Vaticano] of Visita_museo
         (Duracion_actividad  40)
         (precio  17)
    (Nombre "Visita_Museo_Vaticano")
    )

    ([Paris] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  10516000)
    (Nombre "Paris")
    )

    ([Hotel_Lutetia] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Paris])
	 (Distancia_a_centro  1.5)
	 (precio  1400)
    (Nombre "Hotel_Lutetia")
    )

    ([Hotel_Darcet] of Hotel
	 (Estrellas  2)
         (Para_adultos  "false")
	 (esta_en [Paris])
	 (Distancia_a_centro  3.5)
	 (precio  140)
    (Nombre "Hotel_Darcet")
    )
     
    ([Visita_Louvre] of Visita_museo
         (Duracion_actividad  50)
         (precio  17)
    )


    ([Paseo_Campos_Eliseos] of Relax
         (Duracion_actividad  20)
         (precio 0)
    (Nombre "Paseo_Campos_Eliseos")
    )

    ([Berlín] of Ciudad
	 (Continente  "Europa")
         (Numero_de_habitantes  377000)
    (Nombre "Berlín")
    )

    ([Grand_Hyatt_Berlin] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Berlin])
	 (Distancia_a_centro  1.0)
	 (precio  250)
    (Nombre "Grand_Hyatt_Berlin")
    )

    ([Flottwell_Berlin_Hotel] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [Berlin])
	 (Distancia_a_centro  1.8)
	 (precio  80)
    (Nombre "Flottwell_Berlin_Hotel")
    )

    ([Puerta_de_Brandeburgo] of Visita_monumento
         (Duracion_actividad  20)
         (precio  0)
    (Nombre "Puerta_de_Brandeburgo")
    )


    ([Visita_Catedral_Berlin] of Visita_monumento
         (Duracion_actividad  30)
         (precio  7)
    (Nombre "Visita_Catedral_Berlin")
    )

    ([Nueva_York] of Ciudad
	 (Continente  "Norteamerica")
         (Numero_de_habitantes  8380000)
    (Nombre "Nueva_York")
    )

    ([The_Beekman] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Nueva_York])
	 (Distancia_a_centro  0.2)
	 (precio  600)
    (Nombre "The_Beekman")
    )

    ([SpringHill_Suites] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [Nueva_York])
	 (Distancia_a_centro  3.6)
	 (precio  340)
    (Nombre "SpringHill_Suites")
    )

    ([Visita_MET] of Visita_museo
         (Duracion_actividad  40)
         (precio 25)
    (Nombre "Visita_MET")
    )


    ([Visita_Central_Park] of Naturaleza
         (Duracion_actividad  30)
         (precio 0)
    (Nombre "Visita_Central_Park")
    )

    ([Chicago] of Ciudad
	 (Continente  "Norteamerica")
	 (Numero_de_habitantes  2699000)
    (Nombre "Chicago")
    )

    ([The_Langham_Chicago] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Chicago])
	 (Distancia_a_centro  0.8)
	 (precio  900)
    (Nombre "The_Langham_Chicago")
    )

    ([Hyatt_Place_Chicago_Wicker_Park] of Hotel
         (Estrellas  3)
         (Para_adultos  "false")
         (esta_en [Chicago])
         (Distancia_a_centro  4.7)
         (precio  300)
    (Nombre "Hyatt_Place_Chicago_Wicker_Park")
    )

    ([Millenium_Park] of Naturaleza
         (Duracion_actividad  30)
         (precio  0)
    (Nombre "Millenium_Park")
    )


    ([The_Field_Museum] of Visita_museo
         (Duracion_actividad  30)
         (precio  25)
    (Nombre "The_Field_Museum")
    )


    ([LA] of Ciudad
	 (Continente  "Norteamerica")
	 (Numero_de_habitantes  3973000)
    (Nombre "LA")
    )

    ([Downtown_Los_Angeles_Proper_Hotel] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [LA])
	 (Distancia_a_centro  2)
	 (precio  730)
    (Nombre "Downtown_Los_Angeles_Proper_Hotel")
    )

    ([The_Metric_Los_Angeles_Downtown] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [LA])
	 (Distancia_a_centro  1.9)
	 (precio  230)
    (Nombre "The_Metric_Los_Angeles_Downtown")
    )

    ([Paseo_de_la_fama] of Visita_monumento
         (Duracion_actividad  15)
         (precio  0)
    (Nombre "Paseo_de_la_fama")
    )


    ([Santa_Monica] of Naturaleza 
         (Duracion_actividad  30)
         (precio  0)
    (Nombre "Santa_Monica")
    )

    ([San_Diego] of Ciudad
	 (Continente  "Norteamerica")
         (Numero_de_habitantes  1415000)
    (Nombre "San_Diego")
    )

    ([Pendry_San_Diego] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [San_Diego])
	 (Distancia_a_centro  0.3)
	 (precio  725)
    (Nombre "Pendry_San_Diego")
    )

    ([Hotel_Marisol_Coronado] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [San_Diego])
	 (Distancia_a_centro  3.6)
	 (precio  350)
    (Nombre "Hotel_Marisol_Coronado")
    )

    ([Legacy_Resort_Hotel_and_Spa] of Resort
         (Para_adultos "false")
         (esta_en [San_Diego])
	 (Distancia_a_centro  5.3)
	 (precio  200)
    (Nombre "Legacy_Resort_Hotel_and_Spa")
    )

    ([San_Diego_Zoo] of Aventura
         (Duracion_actividad  60)
         (precio 70)
    (Nombre "San_Diego_Zoo")
    )


    ([Parque_Balboa] of Naturaleza
         (Duracion_actividad  20)
         (precio 20)
    (Nombre "Parque_Balboa")
    )

    ([Houston] of Ciudad
	 (Continente  "Norteamerica")
	 (Numero_de_habitantes  2313000)
    (Nombre "Houston")
    )

    ([JW_Marriott_Houston_Downtown] of Hotel
	 (Estrellas  5)
         (Para_adultos  "false")
	 (esta_en [Houston])
	 (Distancia_a_centro  0.2)
	 (precio  620)
    (Nombre "JW_Marriott_Houston_Downtown")
    )

    ([Holiday_Inn_Houston_Downtown] of Hotel
	 (Estrellas  3)
         (Para_adultos  "false")
	 (esta_en [Houston])
	 (Distancia_a_centro  1.1)
	 (precio  190)
    (Nombre "Holiday_Inn_Houston_Downtown")
    )

    ([Visita_Museo_Infantil] of Visita_museo
         (Duracion_actividad  30)
         (precio  25)
    (Nombre "Visita_Museo_Infantil")
    )


    ([Visita_Museo_Ciencias_Naturales] of Visita_museo
         (Duracion_actividad  30)
         (precio  25)
    (Nombre "Visita_Museo_Ciencias_Naturales")
    )
)
