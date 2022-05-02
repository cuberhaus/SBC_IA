; (defrule mi-regla
; ?hotel <- (Hotel (nombre juan))
; =>
; (retract ?x)
; )

; (defrule welcome ""
; (declare(salience))
; )

(defrule welcome_message ""
   (declare (salience 4))
   =>
   (printout t "###################################################" crlf )
   (printout t "## Agencia de viajes al fin del mundo y mas allá ##" crlf )
   (printout t "###################################################" crlf )
)

; (defrule print_hotels ;; prints all hotel names
; (object (is-a Hotel) (Precio ?x))
; =>
; (printout t ?x crlf)
; )

; (defrule mindist "regladistancia"
;     ?Alojamiento <- (object (esta_en Barcelona))
;     =>
;     (printout "a")
; )

