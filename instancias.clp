(definstances instances
    ([Venecia] of Ciudad
	 (Continente  "Europa")
	 (Numero_de_habitantes  261905)
      (Nombre "Venecia")
    )

    ([Hotel_Carlton_On_The_Grand_Canal] of Hotel
	 (esta_en [Venecia])
	 (Distancia_a_centro  1.5)
	 (precio  200)
    (Nombre "Hotel_Carlton_On_The_Grand_Canal")
    )

    ([Ca_San_Polo] of Hotel
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
	 (esta_en [Granada])
	 (Distancia_a_centro  6)
	 (precio  100)
    (Nombre "Hotel_Andalucia_Center")
    )

    ([Candil_suite_Realejo] of Hotel
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
	 (esta_en [Praga])
	 (Distancia_a_centro  2.3)
	 (precio  150)
    (Nombre "Hotel_Royal_Prague")
    )

    ([Hotel_Oya] of Hotel
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
	 (esta_en [Amsterdam])
	 (Distancia_a_centro  8.5)
	 (precio  100)
    (Nombre "Joy_hotel")
    )

    ([Innside_Melia_Amsterdam] of Hotel
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
	 (esta_en [Kioto])
	 (Distancia_a_centro  1.6)
	 (precio  150)
    (Nombre "Piece_Hostel_Sanjo")
    )

    ([Hotel_the_m_kyoto] of Hotel
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
	 (esta_en [Cancun])
	 (Distancia_a_centro  5.6)
	 (precio  200)
    (Nombre "Arrecifes_house")
    )

    ([Dreams_visita_cancun_resort] of Resort
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
	 (esta_en [Las_vegas])
	 (Distancia_a_centro  1.4)
	 (precio  200)
    (Nombre "Polo_towers")
    )

    ([Sahara_las_vegas] of Hotel
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
	 (esta_en [Las_vegas])
	 (Distancia_a_centro  1.4)
	 (precio  200)
    (Nombre "Polo_towers")
    )

    ([Sahara_las_vegas] of Hotel
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
	 (esta_en [Miami])
	 (Distancia_a_centro  13.1)
	 (precio  150)
    (Nombre "Modern_home")
    )

    ([Hampton_miami] of Hotel
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
    asdads

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

)
