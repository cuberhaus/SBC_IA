
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

;(defrule mi-regla
;?hotel <- (Hotel (nombre juan))
;=>
;(retract ?x)
;)


(defrule print_hotels ;; prints all hotel names
(object (is-a Hotel) (precio ?x))
=>
(printout t ?x crlf)
)

; (defrule mindist "regladistancia"
;     ?Alojamiento <- (object (esta_en Barcelona))
;     =>
;     (printout "a")
; )

(defrule tienen_gentemayor ;;prints all users with elder people
(object (is-a Usuario) (Con_gente_mayor ?x))
=>
(printout t ?x crlf)
)
