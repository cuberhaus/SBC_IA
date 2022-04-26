;;; ---------------------------------------------------------
;;; pol.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology pol.owl
;;; :Date 26/04/2022 21:00:28

(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Albergue
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Camping
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Casa_Rural
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Hotel
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Estrellas
        (type SYMBOL)
        (create-accessor read-write))
    (slot Precio_por_noche
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Resort
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Precio_por_noche
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Numero_de_habitantes
        (type SYMBOL)
        (create-accessor read-write))
)

(definstances instances
    ([Camping_las_morenas] of Camping
    )

    ([Hotel_Vela] of Hotel
         (Precio_por_noche  400)
    )

)
