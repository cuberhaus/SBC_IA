;;; ---------------------------------------------------------
;;; sbc.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology sbc.owl
;;; :Date 02/05/2022 19:43:55

(defclass Viaje
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot esta_formado_por
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Descanso
    (is-a Viaje)
    (role concrete)
    (pattern-match reactive)
)

(defclass Diversion
    (is-a Viaje)
    (role concrete)
    (pattern-match reactive)
)

(defclass Romantico
    (is-a Viaje)
    (role concrete)
    (pattern-match reactive)
)

(defclass Trabajo
    (is-a Viaje)
    (role concrete)
    (pattern-match reactive)
)

(defclass VAventura
    (is-a Viaje)
    (role concrete)
    (pattern-match reactive)
)

(defclass VCultural
    (is-a Viaje)
    (role concrete)
    (pattern-match reactive)
)

(defclass Transporte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot parte_de
        (type INSTANCE)
        (create-accessor read-write))
    (multislot va_a
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que representa la duración de un medio de transporte.
    (multislot duracion_transporte
        (type INTEGER)
        (create-accessor read-write))
    ;;; Precio de un servicio específico.
    (multislot precio
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Avion
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Barco
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Tren
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot esta_en
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que indica si un alojamiento dispone de piscina
    (multislot Con_piscina
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que representa la distancia al centro de la ciudad de un alojamiento en dihca ciudad.
    (multislot Distancia_a_centro
        (type FLOAT)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Precio de un servicio específico.
    (multislot precio
        (type FLOAT)
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
    ;;; Atributo que indica quan bueno es un hotel, de 1 a 5.
    (slot Estrellas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que indica si un hotel es exclusivamente para adultos o no.
    (multislot Para_adultos
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Resort
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    ;;; Atributo que indica si un hotel es exclusivamente para adultos o no.
    (multislot Para_adultos
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Usuario
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot participa_en
        (type INSTANCE)
        (create-accessor read-write))
    (multislot se_aloja_en
        (type INSTANCE)
        (create-accessor read-write))
    (multislot va_en
        (type INSTANCE)
        (create-accessor read-write))
    (multislot viaja
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que identifica si cualquier tipo de usuario tiene gente mayor.
    (multislot Con_gente_mayor
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que indica la preferencia de metodo de transporte para un usuario.
    (multislot preferencia_viaje
        (type STRING)
        (create-accessor read-write))
)

(defclass Familia
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
    ;;; Atributo que identifica si una familia o grupo contiene adolescentes
    (multislot Con_adolescentes
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que identifica si una familia o grupo contiene niños
    (multislot Con_niños
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Grupo
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
    ;;; Atributo que identifica si una familia o grupo contiene adolescentes
    (multislot Con_adolescentes
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que identifica si una familia o grupo contiene niños
    (multislot Con_niños
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que representa el número de integrantes de un grupo
    (multislot Numero_integrantes
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Individuo
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
)

(defclass Pareja
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
)

(defclass Actividad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot las_hacen
        (type INSTANCE)
        (create-accessor read-write))
    (multislot se_hacen_en
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que representa la duración de una actividad respecto al porcentaje que ocupa de un dia, ejemplo:  visita a PortAventura: 100%, visita a un museo: 15%.
    (multislot Duracion_actividad
        (type INTEGER)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Precio de un servicio específico.
    (multislot precio
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Cultural
    (is-a Actividad)
    (role concrete)
    (pattern-match reactive)
)

(defclass Visita_monumento
    (is-a Cultural)
    (role concrete)
    (pattern-match reactive)
)

(defclass Visita_museo
    (is-a Cultural)
    (role concrete)
    (pattern-match reactive)
)

(defclass Excursion
    (is-a Actividad)
    (role concrete)
    (pattern-match reactive)
    ;;; Atributo que representa la dificultad de una excursión
    (multislot Dificultad
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Aventura
    (is-a Excursion)
    (role concrete)
    (pattern-match reactive)
)

(defclass Naturaleza
    (is-a Excursion)
    (role concrete)
    (pattern-match reactive)
)

(defclass Gastronomica
    (is-a Actividad)
    (role concrete)
    (pattern-match reactive)
)

(defclass Ocio_Nocturno
    (is-a Actividad)
    (role concrete)
    (pattern-match reactive)
)

(defclass Relax
    (is-a Actividad)
    (role concrete)
    (pattern-match reactive)
)

(defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Atributo que indica el nombre de la instancia
    (multislot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que indica el numero de habitaciones en un alojamiento.
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
         (esta_en  [Barcelona])
         (Distancia_a_centro  1.0)
         (precio  60)
    )

    ([Camping_las_morenas] of Camping
    )

    ([H10_Madison] of Hotel
         (Estrellas  4)
         (Para_adultos  "false")
         (esta_en  [Barcelona])
         (Distancia_a_centro  0.5)
         (precio  100)
    )

    ([Hotel_Vela] of Hotel
         (Estrellas  5)
         (Para_adultos  "false")
         (esta_en  [Barcelona])
         (Distancia_a_centro  3.3)
         (precio  200)
    )

    ([Napoleon_Hotel_Roma] of Hotel
         (Estrellas  4)
         (Para_adultos  "false")
         (esta_en  [Roma])
         (Distancia_a_centro  2.4)
         (precio  70)
    )

    ([Roma] of Ciudad
         (Numero_de_habitantes  2873000)
    )

)
