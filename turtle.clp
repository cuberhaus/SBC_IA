;;; ---------------------------------------------------------
;;; turtle.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology turtle.owl
;;; :Date 25/04/2022 19:58:03

(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot is_in_a
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Albergue
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Camping
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Casa_Rural
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Hotel
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot Estrellas
        (type INTEGER)
        (create-accessor read-write))
    (slot Número_de_habitantes
        (type INTEGER)
        (create-accessor read-write))
    (slot Precio/noche
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Resort
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(definstances instances
    ([Barcelona] of None
    )

    ([Camping_sa_caleta] of None
    )

    ([Hotel_Wela] of None
    )

    ([Paris] of None
    )

    ([Resort_grancanaria] of None
    )

    ([Roma] of None
    )

    ([Rural1] of None
    )

    ([Santiago_de_compostela] of None
    )

    ([albergue_caminosantiago1] of None
    )

)
