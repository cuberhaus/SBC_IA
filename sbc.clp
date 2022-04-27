;;; ---------------------------------------------------------
;;; sbc.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology sbc.owl
;;; :Date 27/04/2022 18:04:36

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
    ([Camping_las_morenas] of Camping
    )

    ([Hotel_Vela] of Hotel
         (Estrellas  5)
         (Para_adultos  "false")
         (Precio_por_noche  400)
         (Distancia_a_centro  3.3)
    )

)
