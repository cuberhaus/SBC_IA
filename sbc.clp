;;; ---------------------------------------------------------
;;; sbc.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology sbc.owl
;;; :Date 27/04/2022 18:34:35

(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot esta_en
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Distancia_a_centro
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Albergue
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Camping
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Casa_Rural
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Hotel
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Estrellas
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Para_adultos
        (type SYMBOL)
        (create-accessor read-write))
    (slot Precio_por_noche
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Resort
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (multislot Para_adultos
        (type SYMBOL)
        (create-accessor read-write))
    (slot Precio_por_noche
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Numero_de_habitantes
        (type INTEGER)
        (create-accessor read-write))
)

(definstances instances
    ([Barcelona] of Ciudad
         (Numero_de_habitantes  1620000)
    )

    ([Bird_House] of Hotel
         (Estrellas  3)
         (Para_adultos  "false")
         (Precio_por_noche  98)
         (esta_en  [Barcelona])
         (Distancia_a_centro  1.0)
    )

    ([Camping_las_morenas] of Camping
    )

    ([H10_Madison] of Hotel
         (Estrellas  4)
         (Para_adultos  "false")
         (Precio_por_noche  298)
         (esta_en  [Barcelona])
         (Distancia_a_centro  0.5)
    )

    ([Hotel_Vela] of Hotel
         (Estrellas  5)
         (Para_adultos  "false")
         (Precio_por_noche  400)
         (esta_en  [Barcelona])
         (Distancia_a_centro  3.3)
    )

    ([Napoleon_Hotel_Roma] of Hotel
         (Estrellas  4)
         (Para_adultos  "false")
         (Precio_por_noche  135)
         (esta_en  [Roma])
         (Distancia_a_centro  2.4)
    )

    ([Roma] of Ciudad
         (Numero_de_habitantes  2873000)
    )

)
(esta_en Barcelona Hotel_Vela)

(defrule mindist "regladistancia"
    ?Alojamiento <- (object (esta_en Barcelona))
    =>
    (printout "a")

)
