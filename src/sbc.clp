;;; ---------------------------------------------------------
;;; sbc.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology sbc.owl
;;; :Date 22/05/2022 16:19:36

(defclass ViajeOnto
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot esta_formado_por
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Descanso
    (is-a ViajeOnto)
    (role concrete)
    (pattern-match reactive)
)

(defclass Diversion
    (is-a ViajeOnto)
    (role concrete)
    (pattern-match reactive)
)

(defclass Romantico
    (is-a ViajeOnto)
    (role concrete)
    (pattern-match reactive)
)

(defclass Trabajo
    (is-a ViajeOnto)
    (role concrete)
    (pattern-match reactive)
)

(defclass VAventura
    (is-a ViajeOnto)
    (role concrete)
    (pattern-match reactive)
)

(defclass VCultural
    (is-a ViajeOnto)
    (role concrete)
    (pattern-match reactive)
)

(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Ciudad en la que está el alojamiento
    (slot esta_en
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que indica si un alojamiento dispone de piscina
    (multislot Con_piscina
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que representa la distancia al centro de la ciudad de un alojamiento en dihca ciudad.
    (slot Distancia_a_centro
        (type FLOAT)
        (create-accessor read-write))
    ;;; Atributo que indica quan bueno es un hotel, de 1 a 5.
    (slot Estrellas
        (type INTEGER)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Precio de un servicio específico.
    (slot precio
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

(defclass Transporte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Ciudad de donde parte el transporte
    (slot parte_de
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Ciudad a donde va el transporte
    (slot va_a
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que representa la duración de un medio de transporte.
    (slot duracion_transporte
        (type INTEGER)
        (create-accessor read-write))
    ;;; Precio de un servicio específico.
    (slot precio
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

(defclass Actividad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Ciudad donde se realiza una actividad
    (slot se_hacen_en
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Atributo que representa la duración de una actividad respecto al porcentaje que ocupa de un dia, ejemplo:  visita a PortAventura: 100%, visita a un museo: 15%.
    (slot Duracion_actividad
        (type INTEGER)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Precio de un servicio específico.
    (slot precio
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
    (slot Continente
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que indica el numero de habitaciones en un alojamiento.
    (slot Numero_de_habitantes
        (type INTEGER)
        (create-accessor read-write))
)

(defclass UsuarioOnto
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
    ;;; Atributo que identifica si una familia o grupo contiene adolescentes
    (multislot Con_adolescentes
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que identifica si cualquier tipo de usuario tiene gente mayor.
    (multislot Con_gente_mayor
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que identifica si una familia o grupo contiene niños
    (multislot Con_niños
        (type SYMBOL)
        (create-accessor read-write))
    ;;; Atributo que indica el nombre de la instancia
    (slot Nombre
        (type STRING)
        (create-accessor read-write))
    ;;; Atributo que indica la preferencia de metodo de transporte para un usuario.
    (multislot preferencia_viaje
        (type STRING)
        (create-accessor read-write))
    (multislot tipo_usuario
        (type STRING)
        (create-accessor read-write))
)

(definstances instances
)
