Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip: source.zip practica.pdf
	zip Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip $^

source.zip: sbc.owl sbc.clp main.clp instancias.clp
	zip source.zip $^

clean: 
	rm Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip source.zip

