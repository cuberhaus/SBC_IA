Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip: source.zip Practica_de_representacion_del_conocimiento.pdf README.md
	zip Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip $^

# source.zip: sbc.owl sbc.clp main.clp instancias.clp
# 	zip source.zip $^
source.zip: src/
	zip -r -j source.zip $^

clean: 
	rm Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip source.zip

