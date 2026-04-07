Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip: source.zip Practica_de_representacion_del_conocimiento.pdf README.md
	zip Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip $^

# source.zip: sbc.owl sbc.clp main.clp instancias.clp
# 	zip source.zip $^
source.zip: src/
	zip -r -j source.zip $^

clean: 
	rm Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip source.zip

# ─── Web app targets ───────────────────────────────────
.PHONY: web-dev docker-build docker-up docker-down web-help

web-dev: ## Start FastAPI dev server
	cd web && uvicorn backend.app:app --host 127.0.0.1 --port 8088 --reload

docker-build: ## Build Docker image
	docker compose build

docker-up: ## Start Docker container
	docker compose up -d

docker-down: ## Stop Docker container
	docker compose down

web-help: ## Show web targets
	@grep -E '^(web-|docker-)[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*##"}; {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'
