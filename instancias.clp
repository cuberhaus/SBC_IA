(definstances instances
    ([Venecia] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  261905)
      (Nombre "Venecia")
    )

    ([Hotel_Carlton_On_The_Grand_Canal] of Hotel
	 (Estrellas  4)
	 (esta_en [Venecia])
	 (Distancia_a_centro  1.5)
	 (precio  200)
    (Nombre "Hotel_Carlton_On_The_Grand_Canal")
    )

    ([Ca_San_Polo] of Hotel
	 (Estrellas  2)
	 (esta_en [Venecia])
	 (Distancia_a_centro  0.9)
	 (precio  100)
    (Nombre "Ca_San_Polo")
    )
    
    ([Paseo_en_gondola] of Relax
         (se_hacen_en [Venecia])
         (Duracion_actividad  30)
         (precio 100)
    (Nombre "Paseo_en_gondola")
    )

    ([Murano_Burano_Torcello] of Cultural
         (se_hacen_en [Venecia])
         (Duracion_actividad  100)
         (precio 25)
    (Nombre "Murano_Burano_Torcello")
    )

     ([Cena_junto_al_canal] of Gastronomica
         (se_hacen_en [Venecia])
         (Duracion_actividad  20)
         (precio 60)
    (Nombre "Cena_junto_al_canal")
    )

    ([Granada] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  232208)
      (Nombre "Granada")
    )

    ([Hotel_Andalucia_Center] of Hotel
	 (Estrellas  1)
	 (esta_en [Granada])
	 (Distancia_a_centro  6)
	 (precio  100)
    (Nombre "Hotel_Andalucia_Center")
    )

    ([Candil_suite_Realejo] of Hotel
	 (Estrellas  3)
	 (esta_en [Granada])
	 (Distancia_a_centro  0.5)
	 (precio  150)
    (Nombre "Candil_suite_Realejo")
    )
    
    ([Visita_alhambra] of Cultural
         (se_hacen_en [Granada])
         (Duracion_actividad  40)
         (precio 20)
    (Nombre "Visita_alhambra")
    )

    ([Sierra_nevada] of Naturaleza
         (se_hacen_en [Granada])
         (Duracion_actividad  100)
         (precio 85)
    (Nombre "Murano_Burano_Torcello")
    )

     ([Cena_en_el_centro] of Gastronomica
         (se_hacen_en [Granada])
         (Duracion_actividad  20)
         (precio 60)
    (Nombre "Cena_en_el_centro")
    )

    ([Praga] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  1309000)
      (Nombre "Praga")
    )

    ([Hotel_Royal_Prague] of Hotel
	 (Estrellas  3)
	 (esta_en [Praga])
	 (Distancia_a_centro  2.3)
	 (precio  150)
    (Nombre "Hotel_Royal_Prague")
    )

    ([Hotel_Oya] of Hotel
	 (Estrellas  2)
	 (esta_en [Praga])
	 (Distancia_a_centro  3.9)
	 (precio  100)
    (Nombre "Hotel_Oya")
    )
    
    ([Visita_al_castillo] of Visita_monumento
         (se_hacen_en [Praga])
         (Duracion_actividad  20)
         (precio 7)
    (Nombre "Visita_al_castillo")
    )

    ([Crucero_con_cena] of Gastronomica
         (se_hacen_en [Venecia])
         (Duracion_actividad  30)
         (precio 60)
    (Nombre "Murano_Burano_Torcello")
    )

    ([Tour_de_pubs] of Gastronomica
         (se_hacen_en [Venecia])
         (Duracion_actividad  30)
         (precio 35)
    (Nombre "Cena_junto_al_canal")
    )
    
    ([Amsterdam] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  821752)
      (Nombre "Amsterdam")
    )

    ([Joy_hotel] of Hotel
	 (Estrellas  1)
	 (esta_en [Amsterdam])
	 (Distancia_a_centro  8.5)
	 (precio  100)
    (Nombre "Joy_hotel")
    )

    ([Innside_Melia_Amsterdam] of Hotel
	 (Estrellas  4)
	 (esta_en [Amsterdam])
	 (Distancia_a_centro  4)
	 (precio  200)
    (Nombre "Innside_Melia_Amsterdam")
    )
    
    ([Museo_van_gogh] of Visita_museo
         (se_hacen_en [Amsterdam])
         (Duracion_actividad  20)
         (precio 20)
    (Nombre "Museo_van_gogh")
    )

    ([Crucero_por_los_canales] of Relax
         (se_hacen_en [Amsterdam])
         (Duracion_actividad  100)
         (precio 20)
    (Nombre "Murano_Burano_Torcello")
    )

    ([Paseo_por_el_barrio_rojo] of Relax
         (se_hacen_en [Amsterdam])
         (Duracion_actividad  30)
         (precio 0)
    (Nombre "Paseo_por_el_barrio_rojo")
    )
    
    
    ([Kioto] of Ciudad
	 (Continente  "Asia")
	 (Numero_de_habitantes  1475000)
      (Nombre "Kioto")
    )

    ([Piece_Hostel_Sanjo] of Hotel
	 (Estrellas  3)
	 (esta_en [Kioto])
	 (Distancia_a_centro  1.6)
	 (precio  150)
    (Nombre "Piece_Hostel_Sanjo")
    )

    ([Hotel_the_m_kyoto] of Hotel
	 (Estrellas  2)
	 (esta_en [Kioto])
	 (Distancia_a_centro  2.2)
	 (precio  100)
    (Nombre "Hotel_the_m_kyoto")
    )
    
    ([Espectaculo_Maiko_tradicional] of Cultural
         (se_hacen_en [Kioto])
         (Duracion_actividad  40)
         (precio 80)
    (Nombre "Espectaculo_Maiko_tradicional")
    )

    ([Tour_nocturno] of Ocio_Nocturno
         (se_hacen_en [Kioto])
         (Duracion_actividad  30)
         (precio 60)
    (Nombre "Murano_Burano_Torcello")
    )

    ([Tour_gastronomico_kioto] of Gastronomica
         (se_hacen_en [Kioto])
         (Duracion_actividad  40)
         (precio 80)
    (Nombre "Tour_gastronomico_kioto")
    )
    
    ([Tahiti] of Ciudad
	 (Continente  "Oceania")
	 (Numero_de_habitantes  275000)
      (Nombre "Tahiti")
    )

    ([Intercontiental_tahiti_resort] of Resort
	 (esta_en [Tahiti])
	 (Distancia_a_centro  0)
	 (precio  300)
    (Nombre "Piece_Hostel_Sanjo")
    )

    ([Vanira_Lodge] of Casa_Rural
	 (esta_en [Tahiti])
	 (Distancia_a_centro  0)
	 (precio  150)
    (Nombre "Vanira_Lodge")
    )
    
    ([Excursion_a_moorea] of Naturaleza
         (se_hacen_en [Tahiti])
         (Duracion_actividad  100)
         (precio 100)
    (Nombre "Excursion_a_moorea")
    )

    ([Dia_playa] of Relax
         (se_hacen_en [Tahiti])
         (Duracion_actividad  100)
         (precio 10)
    (Nombre "Dia_playa")
    )

    ([Tour_gastronomico_moorea] of Gastronomica
         (se_hacen_en [Tahiti])
         (Duracion_actividad  50)
         (precio 120)
    (Nombre "Tour_gastronomico_moorea")
    )

    ([Cancun] of Ciudad
	 (Continente  "America")
	 (Numero_de_habitantes  888797)
      (Nombre "Cancun")
    )

    ([Arrecifes_house] of Hotel
	 (Estrellas  4)
	 (esta_en [Cancun])
	 (Distancia_a_centro  5.6)
	 (precio  200)
    (Nombre "Arrecifes_house")
    )

    ([Dreams_visita_cancun_resort] of Resort
	 (Estrellas  5)
	 (esta_en [Cancun])
	 (Distancia_a_centro  13.7)
	 (precio  300)
    (Nombre "Dreams_visita_cancun_resort")
    )
    
    ([Excursion_chichen_itza] of Visita_monumento
         (se_hacen_en [Cancun])
         (Duracion_actividad  100)
         (precio 30)
    (Nombre "Excursion_a_moorea")
    )

    ([Excursion_isla_mujeres] of Relax
         (se_hacen_en [Cancun])
         (Duracion_actividad  100)
         (precio 40)
    (Nombre "Excursion_isla_mujeres")
    )

    ([Crucero_cena_barco_pirata] of Gastronomica
         (se_hacen_en [Cancun])
         (Duracion_actividad  40)
         (precio 90)
    (Nombre "Crucero_cena_barco_pirata")
    )

    ([Punta_cana] of Ciudad
	 (Continente  "America")
	 (Numero_de_habitantes  43982)
      (Nombre "Punta_cana")
    )

    ([Best_family_vacation_resort] of Resort
	 (esta_en [Punta_cana])
	 (Distancia_a_centro  8)
	 (precio  300)
    (Nombre "Best_family_vacation_resort")
    )

    ([Gran_bavaro_princess] of Hotel
	 (Estrellas  4)
	 (esta_en [Punta_cana])
	 (Distancia_a_centro  10.7)
	 (precio  200)
    (Nombre "Gran_bavaro_princess")
    )
    
    ([Tour_en_buggy] of Aventura
         (se_hacen_en [Punta_cana])
         (Duracion_actividad  40)
         (precio 40)
    (Nombre "Tour_en_buggy")
    )

    ([tour_por_playas] of Relax
         (se_hacen_en [Punta_cana])
         (Duracion_actividad  100)
         (precio 100)
    (Nombre "tour_por_playas")
    )

    ([Truck_safari] of Aventura
         (se_hacen_en [Punta_cana])
         (Duracion_actividad  80)
         (precio 80)
    (Nombre "Truck_safari")
    )

    ([Las_vegas] of Ciudad
	 (Continente  "America")
	 (Numero_de_habitantes  644594)
      (Nombre "Las_vegas")
    )

    ([Polo_towers] of Hotel
	 (Estrellas  4)
	 (esta_en [Las_vegas])
	 (Distancia_a_centro  1.4)
	 (precio  200)
    (Nombre "Polo_towers")
    )

    ([Sahara_las_vegas] of Hotel
	 (Estrellas  5)
	 (esta_en [Las_vegas])
	 (Distancia_a_centro  2.8)
	 (precio  300)
    (Nombre "Sahara_las_vegas")
    )
    
    ([Gran_canon] of Excursion
         (se_hacen_en [Las_vegas])
         (Duracion_actividad  90)
         (precio 160)
    (Nombre "Gran_canon")
    )

    ([Tour_nocturno] of Ocio_Nocturno
         (se_hacen_en [Las_vegas])
         (Duracion_actividad  40)
         (precio 60)
    (Nombre "Tour_nocturno")
    )

    ([Boda_Elvis] of Ocio_Nocturno
         (se_hacen_en [Las_vegas])
         (Duracion_actividad  20)
         (precio 200)
    (Nombre "Truck_safari")
    )
    
    ([Las_vegas] of Ciudad
	 (Continente  "America")
	 (Numero_de_habitantes  644594)
      (Nombre "Las_vegas")
    )

    ([Polo_towers] of Hotel
	 (Estrellas  4)
	 (esta_en [Las_vegas])
	 (Distancia_a_centro  1.4)
	 (precio  200)
    (Nombre "Polo_towers")
    )

    ([Sahara_las_vegas] of Hotel
	 (Estrellas  5)
	 (esta_en [Las_vegas])
	 (Distancia_a_centro  2.8)
	 (precio  300)
    (Nombre "Sahara_las_vegas")
    )
    
    ([Gran_canon] of Excursion
         (se_hacen_en [Las_vegas])
         (Duracion_actividad  90)
         (precio 160)
    (Nombre "Gran_canon")
    )

    ([Tour_nocturno] of Ocio_Nocturno
         (se_hacen_en [Las_vegas])
         (Duracion_actividad  40)
         (precio 60)
    (Nombre "Tour_nocturno")
    )

    ([Boda_Elvis] of Ocio_Nocturno
         (se_hacen_en [Las_vegas])
         (Duracion_actividad  20)
         (precio 200)
    (Nombre "Truck_safari")
    )

    ([Miami] of Ciudad
	 (Continente  "America")
	 (Numero_de_habitantes  644594)
      (Nombre "Miami")
    )

    ([Modern_home] of Hotel
	 (Estrellas  3)
	 (esta_en [Miami])
	 (Distancia_a_centro  13.1)
	 (precio  150)
    (Nombre "Modern_home")
    )

    ([Hampton_miami] of Hotel
	 (Estrellas  4)
	 (esta_en [Miami])
	 (Distancia_a_centro  4.1)
	 (precio  250)
    (Nombre "Hampton_miami")
    )
    
    ([Tour_miami_paseo_barco] of Excursion
         (se_hacen_en [Miami])
         (Duracion_actividad  60)
         (precio 80)
    (Nombre "Gran_canon")
    )

    ([Orlando_parques] of Aventura
         (se_hacen_en [Miami])
         (Duracion_actividad  200)
         (precio 60)
    (Nombre "230")
    )

    ([Alquiler_yate] of Relax
         (se_hacen_en [Miami])
         (Duracion_actividad  70)
         (precio 1100)
    (Nombre "Alquiler_yate")
    )

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
	 (Estrellas  2)
	 (esta_en [Santiago_de_Compostela])
	 (Distancia_a_centro  2.9)
	 (precio  150)
    (Nombre "Casa_de_Afora")
    )

    ([Visita_Catedral_Santiago] of Visita_monumento
         (se_hacen_en [Santiago_de_Compostela])
         (Duracion_actividad  30)
         (precio 10)
    (Nombre "Visita_Catedral_Santiago")
    )

    ([Casa_Marcelo] of Gastronomica
         (se_hacen_en [Santiago_de_Compostela])
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
         (se_hacen_en [Barcelona])
         (Duracion_actividad  40)
         (precio 25)
    (Nombre "Visita_Sagrada_Familia")
    )


    ([PortAventura] of Aventura
         (se_hacen_en [Barcelona])
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
         (se_hacen_en [Roma])
         (Duracion_actividad  30)
         (precio  40)
    (Nombre "Visita_Coliseo")
    )


    ([Visita_Museo_Vaticano] of Visita_museo
         (se_hacen_en [Roma])
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
         (se_hacen_en [Paris])
         (Duracion_actividad  50)
         (precio  17)
	 (Nombre "Visita_Louvre")
    )


    ([Paseo_Campos_Eliseos] of Relax
         (se_hacen_en [Paris])
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
         (se_hacen_en [Berlin])
         (Duracion_actividad  20)
         (precio  0)
    (Nombre "Puerta_de_Brandeburgo")
    )


    ([Visita_Catedral_Berlin] of Visita_monumento
         (se_hacen_en [Berlin])
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
         (se_hacen_en [Nueva_York])
         (Duracion_actividad  40)
         (precio 25)
    (Nombre "Visita_MET")
    )


    ([Visita_Central_Park] of Naturaleza
         (se_hacen_en [Nueva_York])
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
         (se_hacen_en [Chicago])
         (Duracion_actividad  30)
         (precio  0)
    (Nombre "Millenium_Park")
    )


    ([The_Field_Museum] of Visita_museo
         (se_hacen_en [Chicago])
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
         (se_hacen_en [LA])
         (Duracion_actividad  15)
         (precio  0)
    (Nombre "Paseo_de_la_fama")
    )


    ([Santa_Monica] of Naturaleza
         (se_hacen_en [LA])
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
         (se_hacen_en [San_Diego])
         (Duracion_actividad  60)
         (precio 70)
    (Nombre "San_Diego_Zoo")
    )


    ([Parque_Balboa] of Naturaleza
         (se_hacen_en [San_Diego])
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
         (se_hacen_en [Houston])
         (Duracion_actividad  30)
         (precio  25)
    (Nombre "Visita_Museo_Infantil")
    )


    ([Visita_Museo_Ciencias_Naturales] of Visita_museo
         (se_hacen_en [Houston])
         (Duracion_actividad  30)
         (precio  25)
    (Nombre "Visita_Museo_Ciencias_Naturales")
    )

    ([SQC_BCN_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Barcelona])
    (Nombre  "SQC_BCN_avion")
    (duracion_transporte  5)
    (precio  50)
)


([BCN_SQC_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "BCN_SQC_avion")
    (duracion_transporte  5)
    (precio  50)
)


([SQC_ROM_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Roma])
    (Nombre  "SQC_ROM_avion")
    (duracion_transporte  10)
    (precio  60)
)


([ROM_SQC_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "ROM_SQC_avion")
    (duracion_transporte  10)
    (precio  60)
)


([SQC_PAR_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Paris])
    (Nombre  "SQC_PAR_avion")
    (duracion_transporte  10)
    (precio  65)
)


([PAR_SQC_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "PAR_SQC_avion")
    (duracion_transporte  10)
    (precio  65)
)


([SQC_BER_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Berlin])
    (Nombre  "SQC_BER_avion")
    (duracion_transporte  15)
    (precio  65)
)


([BER_SQC_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "BER_SQC_avion")
    (duracion_transporte  15)
    (precio  65)
)


([SQC_NY_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Nueva_York])
    (Nombre  "SQC_NY_avion")
    (duracion_transporte  60)
    (precio  150)
)


([NY_SQC_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "NY_SQC_avion")
    (duracion_transporte  60)
    (precio  150)
)




([SQC_CCG_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Chicago])
    (Nombre  "SQC_CCG_avion")
    (duracion_transporte  65)
    (precio  160)
)


([CCG_SQC_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "CCG_SQC_avion")
    (duracion_transporte  65)
    (precio  160)
)


([SQC_LA_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [LA])
    (Nombre  "SQC_LA_avion")
    (duracion_transporte  80)
    (precio  200)
)


([LA_SQC_avion] of Avion
    (parte_de  [LA])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "LA_SQC_avion")
    (duracion_transporte  80)
    (precio  200)
)


([SQC_SD_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [San_Diego])
    (Nombre  "SQC_SD_avion")
    (duracion_transporte  80)
    (precio  200)
)


([SD_SQC_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "SD_SQC_avion")
    (duracion_transporte  80)
    (precio  200)
)


([SQC_HTN_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Houston])
    (Nombre  "SQC_HTN_avion")
    (duracion_transporte  75)
    (precio  180)
)


([HTN_SQC_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "HTN_SQC_avion")
    (duracion_transporte  75)
    (precio  180)
)


([BCN_ROM_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Roma])
    (Nombre  "BCN_ROM_avion")
    (duracion_transporte  5)
    (precio  60)
)


([ROM_BCN_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Barcelona])
    (Nombre  "ROM_BCN_avion")
    (duracion_transporte  5)
    (precio  60)
)


([BCN_PAR_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Paris])
    (Nombre  "BCN_PAR_avion")
    (duracion_transporte  10)
    (precio  55)
)


([PAR_BCN_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Barcelona])
    (Nombre  "PAR_BCN_avion")
    (duracion_transporte  10)
    (precio  55)
)


([BCN_BER_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Berlin])
    (Nombre  "BCN_BER_avion")
    (duracion_transporte  15)
    (precio  60)
)


([BER_BCN_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Barcelona])
    (Nombre  "BER_BCN_avion")
    (duracion_transporte  15)
    (precio  60)
)


([BCN_NY_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Nueva_York])
    (Nombre  "BCN_NY_avion")
    (duracion_transporte  60)
    (precio  150)
)


([NY_BCN_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Barcelona])
    (Nombre  "NY_BCN_avion")
    (duracion_transporte  60)
    (precio  150)
)




([BCN_CCG_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Chicago])
    (Nombre  "BCN_CCG_avion")
    (duracion_transporte  65)
    (precio  160)
)


([CCG_BCN_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Barcelona])
    (Nombre  "CCG_BCN_avion")
    (duracion_transporte  65)
    (precio  160)
)


([BCN_LA_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [LA])
    (Nombre  "BCN_LA_avion")
    (duracion_transporte  80)
    (precio  210)
)


([LA_BCN_avion] of Avion
    (parte_de  [LA])
    (va_a  [Barcelona])
    (Nombre  "LA_BCN_avion")
    (duracion_transporte  80)
    (precio  210)
)


([BCN_SD_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [San_Diego])
    (Nombre  "BCN_SD_avion")
    (duracion_transporte  75)
    (precio  200)
)


([SD_BCN_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Barcelona])
    (Nombre  "SD_BCN_avion")
    (duracion_transporte  75)
    (precio  200)
)


([BCN_HTN_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Houston])
    (Nombre  "BCN_HTN_avion")
    (duracion_transporte  70)
    (precio  170)
)


([HTN_BCN_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Barcelona])
    (Nombre  "HTN_BCN_avion")
    (duracion_transporte  70)
    (precio  170)
)


([ROM_PAR_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Paris])
    (Nombre  "ROM_PAR_avion")
    (duracion_transporte  15)
    (precio  70)
)


([PAR_ROM_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Roma])
    (Nombre  "PAR_ROM_avion")
    (duracion_transporte  15)
    (precio  70)
)


([ROM_BER_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Berlin])
    (Nombre  "ROM_BER_avion")
    (duracion_transporte  15)
    (precio  65)
)


([BER_ROM_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Roma])
    (Nombre  "BER_ROM_avion")
    (duracion_transporte  15)
    (precio  65)
)


([ROM_NY_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Nueva_York])
    (Nombre  "ROM_NY_avion")
    (duracion_transporte  70)
    (precio  170)
)


([NY_ROM_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Roma])
    (Nombre  "NY_ROM_avion")
    (duracion_transporte  70)
    (precio  170)
)




([ROM_CCG_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Chicago])
    (Nombre  "ROM_CCG_avion")
    (duracion_transporte  75)
    (precio  180)
)


([CCG_ROM_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Roma])
    (Nombre  "CCG_ROM_avion")
    (duracion_transporte  75)
    (precio  180)
)


([ROM_LA_avion] of Avion
    (parte_de  [Roma])
    (va_a  [LA])
    (Nombre  "ROM_LA_avion")
    (duracion_transporte  85)
    (precio  250)
)


([LA_ROM_avion] of Avion
    (parte_de  [LA])
    (va_a  [Roma])
    (Nombre  "LA_ROM_avion")
    (duracion_transporte  85)
    (precio  250)
)


([ROM_SD_avion] of Avion
    (parte_de  [Roma])
    (va_a  [San_Diego])
    (Nombre  "ROM_SD_avion")
    (duracion_transporte  80)
    (precio  240)
)


([SD_ROM_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Roma])
    (Nombre  "SD_ROM_avion")
    (duracion_transporte  80)
    (precio  240)
)


([ROM_HTN_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Houston])
    (Nombre  "ROM_HTN_avion")
    (duracion_transporte  70)
    (precio  150)
)


([HTN_ROM_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Roma])
    (Nombre  "HTN_ROM_avion")
    (duracion_transporte  70)
    (precio  150)
)


([PAR_BER_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Berlin])
    (Nombre  "PAR_BER_avion")
    (duracion_transporte  5)
    (precio  60)
)


([BER_PAR_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Paris])
    (Nombre  "BER_PAR_avion")
    (duracion_transporte  5)
    (precio  60)
)


([PAR_NY_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Nueva_York])
    (Nombre  "PAR_NY_avion")
    (duracion_transporte  65)
    (precio  160)
)


([NY_PAR_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Paris])
    (Nombre  "NY_PAR_avion")
    (duracion_transporte  65)
    (precio  160)
)




([PAR_CCG_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Chicago])
    (Nombre  "PAR_CCG_avion")
    (duracion_transporte  70)
    (precio  170)
)


([CCG_PAR_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Paris])
    (Nombre  "CCG_PAR_avion")
    (duracion_transporte  70)
    (precio  170)
)


([PAR_LA_avion] of Avion
    (parte_de  [Paris])
    (va_a  [LA])
    (Nombre  "PAR_LA_avion")
    (duracion_transporte  80)
    (precio  230)
)


([LA_PAR_avion] of Avion
    (parte_de  [LA])
    (va_a  [Paris])
    (Nombre  "LA_PAR_avion")
    (duracion_transporte  80)
    (precio  230)
)


([PAR_SD_avion] of Avion
    (parte_de  [Paris])
    (va_a  [San_Diego])
    (Nombre  "PAR_SD_avion")
    (duracion_transporte  70)
    (precio  210)
)


([SD_PAR_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Paris])
    (Nombre  "SD_PAR_avion")
    (duracion_transporte  70)
    (precio  210)
)


([PAR_HTN_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Houston])
    (Nombre  "PAR_HTN_avion")
    (duracion_transporte  65)
    (precio  190)
)


([HTN_PAR_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Paris])
    (Nombre  "HTN_PAR_avion")
    (duracion_transporte  65)
    (precio  190)
)


([BER_NY_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Nueva_York])
    (Nombre  "BER_NY_avion")
    (duracion_transporte  80)
    (precio  160)
)


([NY_BER_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Berlin])
    (Nombre  "NY_BER_avion")
    (duracion_transporte  80)
    (precio  160)
)




([BER_CCG_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Chicago])
    (Nombre  "BER_CCG_avion")
    (duracion_transporte  85)
    (precio  170)
)


([CCG_BER_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Berlin])
    (Nombre  "CCG_BER_avion")
    (duracion_transporte  85)
    (precio  170)
)


([BER_LA_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [LA])
    (Nombre  "BER_LA_avion")
    (duracion_transporte  90)
    (precio  230)
)


([LA_BER_avion] of Avion
    (parte_de  [LA])
    (va_a  [Berlin])
    (Nombre  "LA_BER_avion")
    (duracion_transporte  90)
    (precio  230)
)


([BER_SD_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [San_Diego])
    (Nombre  "BER_SD_avion")
    (duracion_transporte  85)
    (precio  220)
)


([SD_BER_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Berlin])
    (Nombre  "SD_BER_avion")
    (duracion_transporte  85)
    (precio  220)
)


([BER_HTN_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Houston])
    (Nombre  "BER_HTN_avion")
    (duracion_transporte  75)
    (precio  175)
)


([HTN_BER_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Berlin])
    (Nombre  "HTN_BER_avion")
    (duracion_transporte  75)
    (precio  175)
)


([NY_CCG_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Chicago])
    (Nombre  "NY_CCG_avion")
    (duracion_transporte  10)
    (precio  100)
)


([CCG_NY_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Nueva_York])
    (Nombre  "CCG_NY_avion")
    (duracion_transporte  10)
    (precio  100)
)


([NY_LA_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [LA])
    (Nombre  "NY_LA_avion")
    (duracion_transporte  50)
    (precio  150)
)


([LA_NY_avion] of Avion
    (parte_de  [LA])
    (va_a  [Nueva_York])
    (Nombre  "LA_NY_avion")
    (duracion_transporte  50)
    (precio  150)
)


([NY_SD_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [San_Diego])
    (Nombre  "NY_SD_avion")
    (duracion_transporte  45)
    (precio  140)
)


([SD_NY_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Nueva_York])
    (Nombre  "SD_NY_avion")
    (duracion_transporte  45)
    (precio  140)
)


([NY_HTN_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Houston])
    (Nombre  "NY_HTN_avion")
    (duracion_transporte  45)
    (precio  120)
)


([HTN_NY_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Nueva_York])
    (Nombre  "HTN_NY_avion")
    (duracion_transporte  45)
    (precio  120)
)


([CCG_LA_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [LA])
    (Nombre  "CCG_LA_avion")
    (duracion_transporte  50)
    (precio  160)
)


([LA_CCG_avion] of Avion
    (parte_de  [LA])
    (va_a  [Chicago])
    (Nombre  "LA_CCG_avion")
    (duracion_transporte  50)
    (precio  160)
)


([CCG_SD_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [San_Diego])
    (Nombre  "CCG_SD_avion")
    (duracion_transporte  45)
    (precio  150)
)


([SD_CCG_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Chicago])
    (Nombre  "SD_CCG_avion")
    (duracion_transporte  45)
    (precio  150)
)


([CCG_HTN_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Houston])
    (Nombre  "CCG_HTN_avion")
    (duracion_transporte  50)
    (precio  120)
)


([HTN_CCG_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Chicago])
    (Nombre  "HTN_CCG_avion")
    (duracion_transporte  50)
    (precio  120)
)


([LA_SD_avion] of Avion
    (parte_de  [LA])
    (va_a  [San_Diego])
    (Nombre  "LA_SD_avion")
    (duracion_transporte  20)
    (precio  100)
)


([SD_LA_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [LA])
    (Nombre  "SD_LA_avion")
    (duracion_transporte  20)
    (precio  100)
)


([LA_HTN_avion] of Avion
    (parte_de  [LA])
    (va_a  [Houston])
    (Nombre  "LA_HTN_avion")
    (duracion_transporte  30)
    (precio  130)
)


([HTN_LA_avion] of Avion
    (parte_de  [Houston])
    (va_a  [LA])
    (Nombre  "HTN_LA_avion")
    (duracion_transporte  30)
    (precio  130)
)


([SD_HTN_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Houston])
    (Nombre  "SD_HTN_avion")
    (duracion_transporte  40)
    (precio  140)
)


([HTN_SD_avion] of Avion
    (parte_de  [Houston])
    (va_a  [San_Diego])
    (Nombre  "HTN_SD_avion")
    (duracion_transporte  40)
    (precio  140)
)


([VEN_SQC_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "VEN_SQC_avion")
    (duracion_transporte  20)
    (precio  65)
)

([SQC_VEN_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Venecia])
    (Nombre  "SQC_VEN_avion")
    (duracion_transporte  20)
    (precio  65)
)

([VEN_BCN_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Barcelona])
    (Nombre  "VEN_BCN_avion")
    (duracion_transporte  20)
    (precio  60)
)

([BCN_VEN_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Venecia])
    (Nombre  "BCN_VEN_avion")
    (duracion_transporte  20)
    (precio  60)
)

([VEN_ROM_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Roma])
    (Nombre  "VEN_ROM_avion")
    (duracion_transporte  10)
    (precio  40)
)

([ROM_VEN_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Venecia])
    (Nombre  "ROM_VEN_avion")
    (duracion_transporte  10)
    (precio  40)
)

([VEN_PAR_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [dest])
    (Nombre  "VEN_PAR_avion")
    (duracion_transporte  20)
    (precio  70)
)

([PAR_VEN_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Venecia])
    (Nombre  "PAR_VEN_avion")
    (duracion_transporte  20)
    (precio  70)
)

([VEN_BER_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [dest])
    (Nombre  "VEN_BER_avion")
    (duracion_transporte  20)
    (precio  70)
)

([BER_VEN_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Venecia])
    (Nombre  "BER_VEN_avion")
    (duracion_transporte  20)
    (precio  70)
)

([VEN_NY_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Nueva_York])
    (Nombre  "VEN_NY_avion")
    (duracion_transporte  70)
    (precio  150)
)

([NY_VEN_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Venecia])
    (Nombre  "NY_VEN_avion")
    (duracion_transporte  70)
    (precio  150)
)


([VEN_CCG_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Chicago])
    (Nombre  "VEN_CCG_avion")
    (duracion_transporte  70)
    (precio  170)
)

([CCG_VEN_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Venecia])
    (Nombre  "CCG_VEN_avion")
    (duracion_transporte  70)
    (precio  170)
)

([VEN_LA_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [LA])
    (Nombre  "VEN_LA_avion")
    (duracion_transporte  70)
    (precio  250)
)

([LA_VEN_avion] of Avion
    (parte_de  [LA])
    (va_a  [Venecia])
    (Nombre  "LA_VEN_avion")
    (duracion_transporte  70)
    (precio  250)
)

([VEN_SD_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [San_Diego])
    (Nombre  "VEN_SD_avion")
    (duracion_transporte  70)
    (precio  230)
)

([SD_VEN_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Venecia])
    (Nombre  "SD_VEN_avion")
    (duracion_transporte  70)
    (precio  230)
)

([VEN_HTN_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Houston])
    (Nombre  "VEN_HTN_avion")
    (duracion_transporte  70)
    (precio  200)
)

([HTN_VEN_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Venecia])
    (Nombre  "HTN_VEN_avion")
    (duracion_transporte  70)
    (precio  200)
)

([VEN_GRA_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Granada])
    (Nombre  "VEN_GRA_avion")
    (duracion_transporte  20)
    (precio  60)
)

([GRA_VEN_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Venecia])
    (Nombre  "GRA_VEN_avion")
    (duracion_transporte  20)
    (precio  60)
)

([VEN_PRA_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Praga])
    (Nombre  "VEN_PRA_avion")
    (duracion_transporte  25)
    (precio  50)
)

([PRA_VEN_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Venecia])
    (Nombre  "PRA_VEN_avion")
    (duracion_transporte  25)
    (precio  50)
)

([VEN_AMS_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Amsterdam])
    (Nombre  "VEN_AMS_avion")
    (duracion_transporte  25)
    (precio  65)
)

([AMS_VEN_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Venecia])
    (Nombre  "AMS_VEN_avion")
    (duracion_transporte  25)
    (precio  65)
)

([VEN_KIO_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Kioto])
    (Nombre  "VEN_KIO_avion")
    (duracion_transporte  100)
    (precio  300)
)

([KIO_VEN_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Venecia])
    (Nombre  "KIO_VEN_avion")
    (duracion_transporte  100)
    (precio  280)
)


([VEN_TAH_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Tahiti])
    (Nombre  "VEN_TAH_avion")
    (duracion_transporte  100)
    (precio  1000)
)

([TAH_VEN_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Venecia])
    (Nombre  "TAH_VEN_avion")
    (duracion_transporte  100)
    (precio  800)
)

([VEN_CAN_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Cancun])
    (Nombre  "VEN_CAN_avion")
    (duracion_transporte  100)
    (precio  500)
)

([CAN_VEN_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Venecia])
    (Nombre  "CAN_VEN_avion")
    (duracion_transporte  100)
    (precio  500)
)

([VEN_PUN_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Punta_cana])
    (Nombre  "VEN_PUN_avion")
    (duracion_transporte  100)
    (precio  450)
)

([PUN_VEN_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Venecia])
    (Nombre  "PUN_VEN_avion")
    (duracion_transporte  100)
    (precio  400)
)

([VEN_VEG_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Las_vegas])
    (Nombre  "VEN_VEG_avion")
    (duracion_transporte  70)
    (precio  200)
)

([VEG_VEN_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Venecia])
    (Nombre  "VEG_VEN_avion")
    (duracion_transporte  70)
    (precio  200)
)

([VEN_MIA_avion] of Avion
    (parte_de  [Venecia])
    (va_a  [Miami])
    (Nombre  "VEN_MIA_avion")
    (duracion_transporte  70)
    (precio  200)
)

([MIA_VEN_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Venecia])
    (Nombre  "MIA_VEN_avion")
    (duracion_transporte  70)
    (precio  200)
)

([MIA_SQC_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "MIA_SQC_avion")
    (duracion_transporte  70)
    (precio  200)
)

([SQC_MIA_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Miami])
    (Nombre  "SQC_MIA_avion")
    (duracion_transporte  70)
    (precio  200)
)

([MIA_BCN_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Barcelona])
    (Nombre  "MIA_BCN_avion")
    (duracion_transporte  70)
    (precio  200)
)

([BCN_MIA_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Miami])
    (Nombre  "BCN_MIA_avion")
    (duracion_transporte  70)
    (precio  200)
)

([MIA_ROM_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Roma])
    (Nombre  "MIA_ROM_avion")
    (duracion_transporte  75)
    (precio  210)
)

([ROM_MIA_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Miami])
    (Nombre  "ROM_MIA_avion")
    (duracion_transporte  75)
    (precio  210)
)

([MIA_PAR_avion] of Avion
    (parte_de  [Miami])
    (va_a  [dest])
    (Nombre  "MIA_PAR_avion")
    (duracion_transporte  75)
    (precio  230)
)

([PAR_MIA_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Miami])
    (Nombre  "PAR_MIA_avion")
    (duracion_transporte  75)
    (precio  230)
)

([MIA_BER_avion] of Avion
    (parte_de  [Miami])
    (va_a  [dest])
    (Nombre  "MIA_BER_avion")
    (duracion_transporte  75)
    (precio  190)
)

([BER_MIA_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Miami])
    (Nombre  "BER_MIA_avion")
    (duracion_transporte  75)
    (precio  190)
)

([MIA_NY_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Nueva_York])
    (Nombre  "MIA_NY_avion")
    (duracion_transporte  40)
    (precio  120)
)

([NY_MIA_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Miami])
    (Nombre  "NY_MIA_avion")
    (duracion_transporte  40)
    (precio  120)
)


([MIA_CCG_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Chicago])
    (Nombre  "MIA_CCG_avion")
    (duracion_transporte  40)
    (precio  110)
)

([CCG_MIA_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Miami])
    (Nombre  "CCG_MIA_avion")
    (duracion_transporte  40)
    (precio  110)
)

([MIA_LA_avion] of Avion
    (parte_de  [Miami])
    (va_a  [LA])
    (Nombre  "MIA_LA_avion")
    (duracion_transporte  10)
    (precio  50)
)

([LA_MIA_avion] of Avion
    (parte_de  [LA])
    (va_a  [Miami])
    (Nombre  "LA_MIA_avion")
    (duracion_transporte  10)
    (precio  50)
)

([MIA_SD_avion] of Avion
    (parte_de  [Miami])
    (va_a  [San_Diego])
    (Nombre  "MIA_SD_avion")
    (duracion_transporte  10)
    (precio  60)
)

([SD_MIA_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Miami])
    (Nombre  "SD_MIA_avion")
    (duracion_transporte  10)
    (precio  60)
)

([MIA_HTN_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Houston])
    (Nombre  "MIA_HTN_avion")
    (duracion_transporte  20)
    (precio  80)
)

([HTN_MIA_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Miami])
    (Nombre  "HTN_MIA_avion")
    (duracion_transporte  20)
    (precio  80)
)

([MIA_GRA_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Granada])
    (Nombre  "MIA_GRA_avion")
    (duracion_transporte  70)
    (precio  190)
)

([GRA_MIA_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Miami])
    (Nombre  "GRA_MIA_avion")
    (duracion_transporte  70)
    (precio  190)
)

([MIA_PRA_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Praga])
    (Nombre  "MIA_PRA_avion")
    (duracion_transporte  75)
    (precio  200)
)

([PRA_MIA_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Miami])
    (Nombre  "PRA_MIA_avion")
    (duracion_transporte  75)
    (precio  200)
)

([MIA_AMS_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Amsterdam])
    (Nombre  "MIA_AMS_avion")
    (duracion_transporte  75)
    (precio  210)
)

([AMS_MIA_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Miami])
    (Nombre  "AMS_MIA_avion")
    (duracion_transporte  75)
    (precio  210)
)

([MIA_KIO_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Kioto])
    (Nombre  "MIA_KIO_avion")
    (duracion_transporte  100)
    (precio  500)
)

([KIO_MIA_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Miami])
    (Nombre  "KIO_MIA_avion")
    (duracion_transporte  100)
    (precio  500)
)


([MIA_TAH_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Tahiti])
    (Nombre  "MIA_TAH_avion")
    (duracion_transporte  90)
    (precio  800)
)

([TAH_MIA_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Miami])
    (Nombre  "TAH_MIA_avion")
    (duracion_transporte  90)
    (precio  600)
)

([MIA_CAN_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Cancun])
    (Nombre  "MIA_CAN_avion")
    (duracion_transporte  90)
    (precio  700)
)

([CAN_MIA_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Miami])
    (Nombre  "CAN_MIA_avion")
    (duracion_transporte  90)
    (precio  700)
)

([MIA_PUN_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Punta_cana])
    (Nombre  "MIA_PUN_avion")
    (duracion_transporte  90)
    (precio  650)
)

([PUN_MIA_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Miami])
    (Nombre  "PUN_MIA_avion")
    (duracion_transporte  90)
    (precio  650)
)

([MIA_VEG_avion] of Avion
    (parte_de  [Miami])
    (va_a  [Las_vegas])
    (Nombre  "MIA_VEG_avion")
    (duracion_transporte  20)
    (precio  50)
)

([VEG_MIA_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Miami])
    (Nombre  "VEG_MIA_avion")
    (duracion_transporte  20)
    (precio  50)
)

([VEG_SQC_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "VEG_SQC_avion")
    (duracion_transporte  70)
    (precio  150)
)

([SQC_VEG_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Las_vegas])
    (Nombre  "SQC_VEG_avion")
    (duracion_transporte  70)
    (precio  150)
)

([VEG_BCN_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Barcelona])
    (Nombre  "VEG_BCN_avion")
    (duracion_transporte  70)
    (precio  160)
)

([BCN_VEG_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Las_vegas])
    (Nombre  "BCN_VEG_avion")
    (duracion_transporte  70)
    (precio  160)
)

([VEG_ROM_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Roma])
    (Nombre  "VEG_ROM_avion")
    (duracion_transporte  70)
    (precio  170)
)

([ROM_VEG_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Las_vegas])
    (Nombre  "ROM_VEG_avion")
    (duracion_transporte  70)
    (precio  170)
)

([VEG_PAR_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [dest])
    (Nombre  "VEG_PAR_avion")
    (duracion_transporte  70)
    (precio  170)
)

([PAR_VEG_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Las_vegas])
    (Nombre  "PAR_VEG_avion")
    (duracion_transporte  70)
    (precio  170)
)

([VEG_BER_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [dest])
    (Nombre  "VEG_BER_avion")
    (duracion_transporte  75)
    (precio  160)
)

([BER_VEG_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Las_vegas])
    (Nombre  "BER_VEG_avion")
    (duracion_transporte  75)
    (precio  160)
)

([VEG_NY_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Nueva_York])
    (Nombre  "VEG_NY_avion")
    (duracion_transporte  40)
    (precio  100)
)

([NY_VEG_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Las_vegas])
    (Nombre  "NY_VEG_avion")
    (duracion_transporte  40)
    (precio  100)
)


([VEG_CCG_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Chicago])
    (Nombre  "VEG_CCG_avion")
    (duracion_transporte  40)
    (precio  80)
)

([CCG_VEG_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Las_vegas])
    (Nombre  "CCG_VEG_avion")
    (duracion_transporte  40)
    (precio  80)
)

([VEG_LA_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [LA])
    (Nombre  "VEG_LA_avion")
    (duracion_transporte  15)
    (precio  60)
)

([LA_VEG_avion] of Avion
    (parte_de  [LA])
    (va_a  [Las_vegas])
    (Nombre  "LA_VEG_avion")
    (duracion_transporte  15)
    (precio  60)
)

([VEG_SD_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [San_Diego])
    (Nombre  "VEG_SD_avion")
    (duracion_transporte  20)
    (precio  55)
)

([SD_VEG_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Las_vegas])
    (Nombre  "SD_VEG_avion")
    (duracion_transporte  20)
    (precio  55)
)

([VEG_HTN_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Houston])
    (Nombre  "VEG_HTN_avion")
    (duracion_transporte  20)
    (precio  55)
)

([HTN_VEG_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Las_vegas])
    (Nombre  "HTN_VEG_avion")
    (duracion_transporte  20)
    (precio  55)
)

([VEG_GRA_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Granada])
    (Nombre  "VEG_GRA_avion")
    (duracion_transporte  65)
    (precio  170)
)

([GRA_VEG_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Las_vegas])
    (Nombre  "GRA_VEG_avion")
    (duracion_transporte  65)
    (precio  170)
)

([VEG_PRA_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Praga])
    (Nombre  "VEG_PRA_avion")
    (duracion_transporte  70)
    (precio  200)
)

([PRA_VEG_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Las_vegas])
    (Nombre  "PRA_VEG_avion")
    (duracion_transporte  70)
    (precio  200)
)

([VEG_AMS_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Amsterdam])
    (Nombre  "VEG_AMS_avion")
    (duracion_transporte  70)
    (precio  180)
)

([AMS_VEG_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Las_vegas])
    (Nombre  "AMS_VEG_avion")
    (duracion_transporte  70)
    (precio  180)
)

([VEG_KIO_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Kioto])
    (Nombre  "VEG_KIO_avion")
    (duracion_transporte  100)
    (precio  600)
)

([KIO_VEG_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Las_vegas])
    (Nombre  "KIO_VEG_avion")
    (duracion_transporte  100)
    (precio  600)
)


([VEG_TAH_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Tahiti])
    (Nombre  "VEG_TAH_avion")
    (duracion_transporte  100)
    (precio  800)
)

([TAH_VEG_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Las_vegas])
    (Nombre  "TAH_VEG_avion")
    (duracion_transporte  100)
    (precio  800)
)

([VEG_CAN_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Cancun])
    (Nombre  "VEG_CAN_avion")
    (duracion_transporte  90)
    (precio  600)
)

([CAN_VEG_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Las_vegas])
    (Nombre  "CAN_VEG_avion")
    (duracion_transporte  90)
    (precio  600)
)

([VEG_PUN_avion] of Avion
    (parte_de  [Las_vegas])
    (va_a  [Punta_cana])
    (Nombre  "VEG_PUN_avion")
    (duracion_transporte  90)
    (precio  450)
)

([PUN_VEG_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Las_vegas])
    (Nombre  "PUN_VEG_avion")
    (duracion_transporte  90)
    (precio  450)
)

([PUN_SQC_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "PUN_SQC_avion")
    (duracion_transporte  100)
    (precio  500)
)

([SQC_PUN_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Punta_cana])
    (Nombre  "SQC_PUN_avion")
    (duracion_transporte  100)
    (precio  500)
)

([PUN_BCN_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Barcelona])
    (Nombre  "PUN_BCN_avion")
    (duracion_transporte  80)
    (precio  600)
)

([BCN_PUN_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Punta_cana])
    (Nombre  "BCN_PUN_avion")
    (duracion_transporte  80)
    (precio  600)
)

([PUN_ROM_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Roma])
    (Nombre  "PUN_ROM_avion")
    (duracion_transporte  100)
    (precio  650)
)

([ROM_PUN_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Punta_cana])
    (Nombre  "ROM_PUN_avion")
    (duracion_transporte  100)
    (precio  650)
)

([PUN_PAR_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [dest])
    (Nombre  "PUN_PAR_avion")
    (duracion_transporte  85)
    (precio  650)
)

([PAR_PUN_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Punta_cana])
    (Nombre  "PAR_PUN_avion")
    (duracion_transporte  85)
    (precio  650)
)

([PUN_BER_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [dest])
    (Nombre  "PUN_BER_avion")
    (duracion_transporte  85)
    (precio  600)
)

([BER_PUN_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Punta_cana])
    (Nombre  "BER_PUN_avion")
    (duracion_transporte  85)
    (precio  600)
)

([PUN_NY_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Nueva_York])
    (Nombre  "PUN_NY_avion")
    (duracion_transporte  100)
    (precio  700)
)

([NY_PUN_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Punta_cana])
    (Nombre  "NY_PUN_avion")
    (duracion_transporte  100)
    (precio  700)
)


([PUN_CCG_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Chicago])
    (Nombre  "PUN_CCG_avion")
    (duracion_transporte  100)
    (precio  700)
)

([CCG_PUN_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Punta_cana])
    (Nombre  "CCG_PUN_avion")
    (duracion_transporte  100)
    (precio  700)
)

([PUN_LA_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [LA])
    (Nombre  "PUN_LA_avion")
    (duracion_transporte  85)
    (precio  500)
)

([LA_PUN_avion] of Avion
    (parte_de  [LA])
    (va_a  [Punta_cana])
    (Nombre  "LA_PUN_avion")
    (duracion_transporte  85)
    (precio  500)
)

([PUN_SD_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [San_Diego])
    (Nombre  "PUN_SD_avion")
    (duracion_transporte  85)
    (precio  550)
)

([SD_PUN_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Punta_cana])
    (Nombre  "SD_PUN_avion")
    (duracion_transporte  85)
    (precio  550)
)

([PUN_HTN_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Houston])
    (Nombre  "PUN_HTN_avion")
    (duracion_transporte  100)
    (precio  550)
)

([HTN_PUN_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Punta_cana])
    (Nombre  "HTN_PUN_avion")
    (duracion_transporte  100)
    (precio  550)
)

([PUN_GRA_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Granada])
    (Nombre  "PUN_GRA_avion")
    (duracion_transporte  100)
    (precio  600)
)

([GRA_PUN_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Punta_cana])
    (Nombre  "GRA_PUN_avion")
    (duracion_transporte  100)
    (precio  600)
)

([PUN_PRA_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Praga])
    (Nombre  "PUN_PRA_avion")
    (duracion_transporte  90)
    (precio  650)
)

([PRA_PUN_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Punta_cana])
    (Nombre  "PRA_PUN_avion")
    (duracion_transporte  90)
    (precio  650)
)

([PUN_AMS_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Amsterdam])
    (Nombre  "PUN_AMS_avion")
    (duracion_transporte  85)
    (precio  550)
)

([AMS_PUN_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Punta_cana])
    (Nombre  "AMS_PUN_avion")
    (duracion_transporte  85)
    (precio  550)
)

([PUN_KIO_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Kioto])
    (Nombre  "PUN_KIO_avion")
    (duracion_transporte  100)
    (precio  1000)
)

([KIO_PUN_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Punta_cana])
    (Nombre  "KIO_PUN_avion")
    (duracion_transporte  100)
    (precio  1000)
)


([PUN_TAH_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Tahiti])
    (Nombre  "PUN_TAH_avion")
    (duracion_transporte  60)
    (precio  900)
)

([TAH_PUN_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Punta_cana])
    (Nombre  "TAH_PUN_avion")
    (duracion_transporte  60)
    (precio  900)
)

([PUN_CAN_avion] of Avion
    (parte_de  [Punta_cana])
    (va_a  [Cancun])
    (Nombre  "PUN_CAN_avion")
    (duracion_transporte  60)
    (precio  400)
)

([CAN_PUN_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Punta_cana])
    (Nombre  "CAN_PUN_avion")
    (duracion_transporte  60)
    (precio  400)
)

([CAN_SQC_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "CAN_SQC_avion")
    (duracion_transporte  70)
    (precio  600)
)

([SQC_CAN_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Cancun])
    (Nombre  "SQC_CAN_avion")
    (duracion_transporte  70)
    (precio  600)
)

([CAN_BCN_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Barcelona])
    (Nombre  "CAN_BCN_avion")
    (duracion_transporte  70)
    (precio  550)
)

([BCN_CAN_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Cancun])
    (Nombre  "BCN_CAN_avion")
    (duracion_transporte  70)
    (precio  550)
)

([CAN_ROM_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Roma])
    (Nombre  "CAN_ROM_avion")
    (duracion_transporte  80)
    (precio  700)
)

([ROM_CAN_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Cancun])
    (Nombre  "ROM_CAN_avion")
    (duracion_transporte  80)
    (precio  700)
)

([CAN_PAR_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [dest])
    (Nombre  "CAN_PAR_avion")
    (duracion_transporte  80)
    (precio  700)
)

([PAR_CAN_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Cancun])
    (Nombre  "PAR_CAN_avion")
    (duracion_transporte  80)
    (precio  700)
)

([CAN_BER_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [dest])
    (Nombre  "CAN_BER_avion")
    (duracion_transporte  80)
    (precio  650)
)

([BER_CAN_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Cancun])
    (Nombre  "BER_CAN_avion")
    (duracion_transporte  80)
    (precio  650)
)

([CAN_NY_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Nueva_York])
    (Nombre  "CAN_NY_avion")
    (duracion_transporte  80)
    (precio  850)
)

([NY_CAN_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Cancun])
    (Nombre  "NY_CAN_avion")
    (duracion_transporte  80)
    (precio  850)
)


([CAN_CCG_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Chicago])
    (Nombre  "CAN_CCG_avion")
    (duracion_transporte  85)
    (precio  750)
)

([CCG_CAN_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Cancun])
    (Nombre  "CCG_CAN_avion")
    (duracion_transporte  85)
    (precio  750)
)

([CAN_LA_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [LA])
    (Nombre  "CAN_LA_avion")
    (duracion_transporte  75)
    (precio  750)
)

([LA_CAN_avion] of Avion
    (parte_de  [LA])
    (va_a  [Cancun])
    (Nombre  "LA_CAN_avion")
    (duracion_transporte  75)
    (precio  750)
)

([CAN_SD_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [San_Diego])
    (Nombre  "CAN_SD_avion")
    (duracion_transporte  75)
    (precio  800)
)

([SD_CAN_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Cancun])
    (Nombre  "SD_CAN_avion")
    (duracion_transporte  75)
    (precio  800)
)

([CAN_HTN_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Houston])
    (Nombre  "CAN_HTN_avion")
    (duracion_transporte  75)
    (precio  650)
)

([HTN_CAN_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Cancun])
    (Nombre  "HTN_CAN_avion")
    (duracion_transporte  75)
    (precio  650)
)

([CAN_GRA_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Granada])
    (Nombre  "CAN_GRA_avion")
    (duracion_transporte  65)
    (precio  650)
)

([GRA_CAN_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Cancun])
    (Nombre  "GRA_CAN_avion")
    (duracion_transporte  65)
    (precio  650)
)

([CAN_PRA_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Praga])
    (Nombre  "CAN_PRA_avion")
    (duracion_transporte  80)
    (precio  700)
)

([PRA_CAN_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Cancun])
    (Nombre  "PRA_CAN_avion")
    (duracion_transporte  80)
    (precio  700)
)

([CAN_AMS_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Amsterdam])
    (Nombre  "CAN_AMS_avion")
    (duracion_transporte  70)
    (precio  700)
)

([AMS_CAN_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Cancun])
    (Nombre  "AMS_CAN_avion")
    (duracion_transporte  70)
    (precio  700)
)

([CAN_KIO_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Kioto])
    (Nombre  "CAN_KIO_avion")
    (duracion_transporte  100)
    (precio  1000)
)

([KIO_CAN_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Cancun])
    (Nombre  "KIO_CAN_avion")
    (duracion_transporte  100)
    (precio  1000)
)


([CAN_TAH_avion] of Avion
    (parte_de  [Cancun])
    (va_a  [Tahiti])
    (Nombre  "CAN_TAH_avion")
    (duracion_transporte  55)
    (precio  400)
)

([TAH_CAN_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Cancun])
    (Nombre  "TAH_CAN_avion")
    (duracion_transporte  55)
    (precio  400)
)

([TAH_SQC_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "TAH_SQC_avion")
    (duracion_transporte  90)
    (precio  850)
)

([SQC_TAH_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Tahiti])
    (Nombre  "SQC_TAH_avion")
    (duracion_transporte  90)
    (precio  850)
)

([TAH_BCN_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Barcelona])
    (Nombre  "TAH_BCN_avion")
    (duracion_transporte  90)
    (precio  900)
)

([BCN_TAH_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Tahiti])
    (Nombre  "BCN_TAH_avion")
    (duracion_transporte  90)
    (precio  900)
)

([TAH_ROM_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Roma])
    (Nombre  "TAH_ROM_avion")
    (duracion_transporte  90)
    (precio  900)
)

([ROM_TAH_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Tahiti])
    (Nombre  "ROM_TAH_avion")
    (duracion_transporte  90)
    (precio  900)
)

([TAH_PAR_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [dest])
    (Nombre  "TAH_PAR_avion")
    (duracion_transporte  90)
    (precio  850)
)

([PAR_TAH_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Tahiti])
    (Nombre  "PAR_TAH_avion")
    (duracion_transporte  90)
    (precio  850)
)

([TAH_BER_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [dest])
    (Nombre  "TAH_BER_avion")
    (duracion_transporte  100)
    (precio  850)
)

([BER_TAH_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Tahiti])
    (Nombre  "BER_TAH_avion")
    (duracion_transporte  100)
    (precio  850)
)

([TAH_NY_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Nueva_York])
    (Nombre  "TAH_NY_avion")
    (duracion_transporte  90)
    (precio  1000)
)

([NY_TAH_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Tahiti])
    (Nombre  "NY_TAH_avion")
    (duracion_transporte  90)
    (precio  1000)
)


([TAH_CCG_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Chicago])
    (Nombre  "TAH_CCG_avion")
    (duracion_transporte  100)
    (precio  1000)
)

([CCG_TAH_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Tahiti])
    (Nombre  "CCG_TAH_avion")
    (duracion_transporte  100)
    (precio  1000)
)

([TAH_LA_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [LA])
    (Nombre  "TAH_LA_avion")
    (duracion_transporte  85)
    (precio  800)
)

([LA_TAH_avion] of Avion
    (parte_de  [LA])
    (va_a  [Tahiti])
    (Nombre  "LA_TAH_avion")
    (duracion_transporte  85)
    (precio  800)
)

([TAH_SD_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [San_Diego])
    (Nombre  "TAH_SD_avion")
    (duracion_transporte  85)
    (precio  750)
)

([SD_TAH_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Tahiti])
    (Nombre  "SD_TAH_avion")
    (duracion_transporte  85)
    (precio  750)
)

([TAH_HTN_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Houston])
    (Nombre  "TAH_HTN_avion")
    (duracion_transporte  100)
    (precio  750)
)

([HTN_TAH_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Tahiti])
    (Nombre  "HTN_TAH_avion")
    (duracion_transporte  100)
    (precio  750)
)

([TAH_GRA_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Granada])
    (Nombre  "TAH_GRA_avion")
    (duracion_transporte  100)
    (precio  800)
)

([GRA_TAH_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Tahiti])
    (Nombre  "GRA_TAH_avion")
    (duracion_transporte  100)
    (precio  800)
)

([TAH_PRA_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Praga])
    (Nombre  "TAH_PRA_avion")
    (duracion_transporte  100)
    (precio  900)
)

([PRA_TAH_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Tahiti])
    (Nombre  "PRA_TAH_avion")
    (duracion_transporte  100)
    (precio  900)
)

([TAH_AMS_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Amsterdam])
    (Nombre  "TAH_AMS_avion")
    (duracion_transporte  90)
    (precio  800)
)

([AMS_TAH_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Tahiti])
    (Nombre  "AMS_TAH_avion")
    (duracion_transporte  90)
    (precio  800)
)

([TAH_KIO_avion] of Avion
    (parte_de  [Tahiti])
    (va_a  [Kioto])
    (Nombre  "TAH_KIO_avion")
    (duracion_transporte  100)
    (precio  1000)
)

([KIO_TAH_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Tahiti])
    (Nombre  "KIO_TAH_avion")
    (duracion_transporte  100)
    (precio  1000)
)


([KIO_SQC_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "KIO_SQC_avion")
    (duracion_transporte  100)
    (precio  400)
)

([SQC_KIO_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Kioto])
    (Nombre  "SQC_KIO_avion")
    (duracion_transporte  100)
    (precio  400)
)

([KIO_BCN_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Barcelona])
    (Nombre  "KIO_BCN_avion")
    (duracion_transporte  100)
    (precio  450)
)

([BCN_KIO_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Kioto])
    (Nombre  "BCN_KIO_avion")
    (duracion_transporte  100)
    (precio  450)
)

([KIO_ROM_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Roma])
    (Nombre  "KIO_ROM_avion")
    (duracion_transporte  100)
    (precio  500)
)

([ROM_KIO_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Kioto])
    (Nombre  "ROM_KIO_avion")
    (duracion_transporte  100)
    (precio  500)
)

([KIO_PAR_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [dest])
    (Nombre  "KIO_PAR_avion")
    (duracion_transporte  100)
    (precio  450)
)

([PAR_KIO_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Kioto])
    (Nombre  "PAR_KIO_avion")
    (duracion_transporte  100)
    (precio  450)
)

([KIO_BER_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [dest])
    (Nombre  "KIO_BER_avion")
    (duracion_transporte  100)
    (precio  480)
)

([BER_KIO_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Kioto])
    (Nombre  "BER_KIO_avion")
    (duracion_transporte  100)
    (precio  480)
)

([KIO_NY_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Nueva_York])
    (Nombre  "KIO_NY_avion")
    (duracion_transporte  100)
    (precio  750)
)

([NY_KIO_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Kioto])
    (Nombre  "NY_KIO_avion")
    (duracion_transporte  100)
    (precio  750)
)


([KIO_CCG_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Chicago])
    (Nombre  "KIO_CCG_avion")
    (duracion_transporte  100)
    (precio  800)
)

([CCG_KIO_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Kioto])
    (Nombre  "CCG_KIO_avion")
    (duracion_transporte  100)
    (precio  800)
)

([KIO_LA_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [LA])
    (Nombre  "KIO_LA_avion")
    (duracion_transporte  100)
    (precio  800)
)

([LA_KIO_avion] of Avion
    (parte_de  [LA])
    (va_a  [Kioto])
    (Nombre  "LA_KIO_avion")
    (duracion_transporte  100)
    (precio  800)
)

([KIO_SD_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [San_Diego])
    (Nombre  "KIO_SD_avion")
    (duracion_transporte  100)
    (precio  800)
)

([SD_KIO_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Kioto])
    (Nombre  "SD_KIO_avion")
    (duracion_transporte  100)
    (precio  800)
)

([KIO_HTN_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Houston])
    (Nombre  "KIO_HTN_avion")
    (duracion_transporte  100)
    (precio  750)
)

([HTN_KIO_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Kioto])
    (Nombre  "HTN_KIO_avion")
    (duracion_transporte  100)
    (precio  750)
)

([KIO_GRA_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Granada])
    (Nombre  "KIO_GRA_avion")
    (duracion_transporte  100)
    (precio  400)
)

([GRA_KIO_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Kioto])
    (Nombre  "GRA_KIO_avion")
    (duracion_transporte  100)
    (precio  400)
)

([KIO_PRA_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Praga])
    (Nombre  "KIO_PRA_avion")
    (duracion_transporte  100)
    (precio  500)
)

([PRA_KIO_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Kioto])
    (Nombre  "PRA_KIO_avion")
    (duracion_transporte  100)
    (precio  500)
)

([KIO_AMS_avion] of Avion
    (parte_de  [Kioto])
    (va_a  [Amsterdam])
    (Nombre  "KIO_AMS_avion")
    (duracion_transporte  100)
    (precio  450)
)

([AMS_KIO_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Kioto])
    (Nombre  "AMS_KIO_avion")
    (duracion_transporte  100)
    (precio  450)
)


([AMS_SQC_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "AMS_SQC_avion")
    (duracion_transporte  20)
    (precio  75)
)

([SQC_AMS_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Amsterdam])
    (Nombre  "SQC_AMS_avion")
    (duracion_transporte  20)
    (precio  75)
)

([AMS_BCN_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Barcelona])
    (Nombre  "AMS_BCN_avion")
    (duracion_transporte  20)
    (precio  70)
)

([BCN_AMS_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Amsterdam])
    (Nombre  "BCN_AMS_avion")
    (duracion_transporte  20)
    (precio  70)
)

([AMS_ROM_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Roma])
    (Nombre  "AMS_ROM_avion")
    (duracion_transporte  25)
    (precio  60)
)

([ROM_AMS_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Amsterdam])
    (Nombre  "ROM_AMS_avion")
    (duracion_transporte  25)
    (precio  60)
)

([AMS_PAR_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [dest])
    (Nombre  "AMS_PAR_avion")
    (duracion_transporte  15)
    (precio  60)
)

([PAR_AMS_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Amsterdam])
    (Nombre  "PAR_AMS_avion")
    (duracion_transporte  15)
    (precio  60)
)

([AMS_BER_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [dest])
    (Nombre  "AMS_BER_avion")
    (duracion_transporte  20)
    (precio  60)
)

([BER_AMS_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Amsterdam])
    (Nombre  "BER_AMS_avion")
    (duracion_transporte  20)
    (precio  60)
)

([AMS_NY_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Nueva_York])
    (Nombre  "AMS_NY_avion")
    (duracion_transporte  65)
    (precio  170)
)

([NY_AMS_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Amsterdam])
    (Nombre  "NY_AMS_avion")
    (duracion_transporte  65)
    (precio  170)
)


([AMS_CCG_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Chicago])
    (Nombre  "AMS_CCG_avion")
    (duracion_transporte  65)
    (precio  175)
)

([CCG_AMS_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Amsterdam])
    (Nombre  "CCG_AMS_avion")
    (duracion_transporte  65)
    (precio  175)
)

([AMS_LA_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [LA])
    (Nombre  "AMS_LA_avion")
    (duracion_transporte  75)
    (precio  200)
)

([LA_AMS_avion] of Avion
    (parte_de  [LA])
    (va_a  [Amsterdam])
    (Nombre  "LA_AMS_avion")
    (duracion_transporte  75)
    (precio  200)
)

([AMS_SD_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [San_Diego])
    (Nombre  "AMS_SD_avion")
    (duracion_transporte  75)
    (precio  190)
)

([SD_AMS_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Amsterdam])
    (Nombre  "SD_AMS_avion")
    (duracion_transporte  75)
    (precio  190)
)

([AMS_HTN_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Houston])
    (Nombre  "AMS_HTN_avion")
    (duracion_transporte  70)
    (precio  180)
)

([HTN_AMS_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Amsterdam])
    (Nombre  "HTN_AMS_avion")
    (duracion_transporte  70)
    (precio  180)
)

([AMS_GRA_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Granada])
    (Nombre  "AMS_GRA_avion")
    (duracion_transporte  30)
    (precio  70)
)

([GRA_AMS_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Amsterdam])
    (Nombre  "GRA_AMS_avion")
    (duracion_transporte  30)
    (precio  70)
)

([AMS_PRA_avion] of Avion
    (parte_de  [Amsterdam])
    (va_a  [Praga])
    (Nombre  "AMS_PRA_avion")
    (duracion_transporte  30)
    (precio  50)
)

([PRA_AMS_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Amsterdam])
    (Nombre  "PRA_AMS_avion")
    (duracion_transporte  30)
    (precio  50)
)

([PRA_SQC_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "PRA_SQC_avion")
    (duracion_transporte  30)
    (precio  70)
)

([SQC_PRA_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Praga])
    (Nombre  "SQC_PRA_avion")
    (duracion_transporte  30)
    (precio  70)
)

([PRA_BCN_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Barcelona])
    (Nombre  "PRA_BCN_avion")
    (duracion_transporte  30)
    (precio  60)
)

([BCN_PRA_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Praga])
    (Nombre  "BCN_PRA_avion")
    (duracion_transporte  30)
    (precio  60)
)

([PRA_ROM_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Roma])
    (Nombre  "PRA_ROM_avion")
    (duracion_transporte  35)
    (precio  70)
)

([ROM_PRA_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Praga])
    (Nombre  "ROM_PRA_avion")
    (duracion_transporte  35)
    (precio  70)
)

([PRA_PAR_avion] of Avion
    (parte_de  [Praga])
    (va_a  [dest])
    (Nombre  "PRA_PAR_avion")
    (duracion_transporte  25)
    (precio  70)
)

([PAR_PRA_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Praga])
    (Nombre  "PAR_PRA_avion")
    (duracion_transporte  25)
    (precio  70)
)

([PRA_BER_avion] of Avion
    (parte_de  [Praga])
    (va_a  [dest])
    (Nombre  "PRA_BER_avion")
    (duracion_transporte  25)
    (precio  70)
)

([BER_PRA_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Praga])
    (Nombre  "BER_PRA_avion")
    (duracion_transporte  25)
    (precio  70)
)

([PRA_NY_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Nueva_York])
    (Nombre  "PRA_NY_avion")
    (duracion_transporte  70)
    (precio  170)
)

([NY_PRA_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Praga])
    (Nombre  "NY_PRA_avion")
    (duracion_transporte  70)
    (precio  170)
)


([PRA_CCG_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Chicago])
    (Nombre  "PRA_CCG_avion")
    (duracion_transporte  70)
    (precio  180)
)

([CCG_PRA_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Praga])
    (Nombre  "CCG_PRA_avion")
    (duracion_transporte  70)
    (precio  180)
)

([PRA_LA_avion] of Avion
    (parte_de  [Praga])
    (va_a  [LA])
    (Nombre  "PRA_LA_avion")
    (duracion_transporte  80)
    (precio  210)
)

([LA_PRA_avion] of Avion
    (parte_de  [LA])
    (va_a  [Praga])
    (Nombre  "LA_PRA_avion")
    (duracion_transporte  80)
    (precio  210)
)

([PRA_SD_avion] of Avion
    (parte_de  [Praga])
    (va_a  [San_Diego])
    (Nombre  "PRA_SD_avion")
    (duracion_transporte  80)
    (precio  200)
)

([SD_PRA_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Praga])
    (Nombre  "SD_PRA_avion")
    (duracion_transporte  80)
    (precio  200)
)

([PRA_HTN_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Houston])
    (Nombre  "PRA_HTN_avion")
    (duracion_transporte  75)
    (precio  180)
)

([HTN_PRA_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Praga])
    (Nombre  "HTN_PRA_avion")
    (duracion_transporte  75)
    (precio  180)
)

([PRA_GRA_avion] of Avion
    (parte_de  [Praga])
    (va_a  [Granada])
    (Nombre  "PRA_GRA_avion")
    (duracion_transporte  30)
    (precio  60)
)

([GRA_PRA_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Praga])
    (Nombre  "GRA_PRA_avion")
    (duracion_transporte  30)
    (precio  60)
)


([GRA_SQC_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Santiago_de_Compostela])
    (Nombre  "GRA_SQC_avion")
    (duracion_transporte  10)
    (precio  40)
)

([SQC_GRA_avion] of Avion
    (parte_de  [Santiago_de_Compostela])
    (va_a  [Granada])
    (Nombre  "SQC_GRA_avion")
    (duracion_transporte  10)
    (precio  40)
)

([GRA_BCN_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Barcelona])
    (Nombre  "GRA_BCN_avion")
    (duracion_transporte  10)
    (precio  50)
)

([BCN_GRA_avion] of Avion
    (parte_de  [Barcelona])
    (va_a  [Granada])
    (Nombre  "BCN_GRA_avion")
    (duracion_transporte  10)
    (precio  50)
)

([GRA_ROM_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Roma])
    (Nombre  "GRA_ROM_avion")
    (duracion_transporte  20)
    (precio  65)
)

([ROM_GRA_avion] of Avion
    (parte_de  [Roma])
    (va_a  [Granada])
    (Nombre  "ROM_GRA_avion")
    (duracion_transporte  20)
    (precio  65)
)

([GRA_PAR_avion] of Avion
    (parte_de  [Granada])
    (va_a  [dest])
    (Nombre  "GRA_PAR_avion")
    (duracion_transporte  20)
    (precio  75)
)

([PAR_GRA_avion] of Avion
    (parte_de  [Paris])
    (va_a  [Granada])
    (Nombre  "PAR_GRA_avion")
    (duracion_transporte  20)
    (precio  75)
)

([GRA_BER_avion] of Avion
    (parte_de  [Granada])
    (va_a  [dest])
    (Nombre  "GRA_BER_avion")
    (duracion_transporte  25)
    (precio  80)
)

([BER_GRA_avion] of Avion
    (parte_de  [Berlin])
    (va_a  [Granada])
    (Nombre  "BER_GRA_avion")
    (duracion_transporte  25)
    (precio  80)
)

([GRA_NY_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Nueva_York])
    (Nombre  "GRA_NY_avion")
    (duracion_transporte  65)
    (precio  180)
)

([NY_GRA_avion] of Avion
    (parte_de  [Nueva_York])
    (va_a  [Granada])
    (Nombre  "NY_GRA_avion")
    (duracion_transporte  65)
    (precio  180)
)


([GRA_CCG_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Chicago])
    (Nombre  "GRA_CCG_avion")
    (duracion_transporte  65)
    (precio  170)
)

([CCG_GRA_avion] of Avion
    (parte_de  [Chicago])
    (va_a  [Granada])
    (Nombre  "CCG_GRA_avion")
    (duracion_transporte  65)
    (precio  170)
)

([GRA_LA_avion] of Avion
    (parte_de  [Granada])
    (va_a  [LA])
    (Nombre  "GRA_LA_avion")
    (duracion_transporte  80)
    (precio  200)
)

([LA_GRA_avion] of Avion
    (parte_de  [LA])
    (va_a  [Granada])
    (Nombre  "LA_GRA_avion")
    (duracion_transporte  80)
    (precio  200)
)

([GRA_SD_avion] of Avion
    (parte_de  [Granada])
    (va_a  [San_Diego])
    (Nombre  "GRA_SD_avion")
    (duracion_transporte  80)
    (precio  190)
)

([SD_GRA_avion] of Avion
    (parte_de  [San_Diego])
    (va_a  [Granada])
    (Nombre  "SD_GRA_avion")
    (duracion_transporte  80)
    (precio  190)
)

([GRA_HTN_avion] of Avion
    (parte_de  [Granada])
    (va_a  [Houston])
    (Nombre  "GRA_HTN_avion")
    (duracion_transporte  75)
    (precio  190)
)

([HTN_GRA_avion] of Avion
    (parte_de  [Houston])
    (va_a  [Granada])
    (Nombre  "HTN_GRA_avion")
    (duracion_transporte  75)
    (precio  190)
)

)
