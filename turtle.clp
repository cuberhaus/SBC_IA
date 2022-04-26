;;; ---------------------------------------------------------
;;; turtle.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology turtle.owl
;;; :Date 26/04/2022 19:42:46

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
    ([Barcelona] of Ciudad
    )

    ([Camping_sa_caleta] of Camping
    )

