(defrule mi-regla
?hotel <- (Hotel (nombre juan))
=>
(retract ?x)
)

(defrule print_hotels ;; prints all hotel names
(object (is-a Hotel) (Precio_por_noche ?x))
=>
(printout t ?x crlf)
)

(defrule mindist "regladistancia"
    ?Alojamiento <- (object (esta_en Barcelona))
    =>
    (printout "a")
)

