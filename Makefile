deploy_ingress:
	kubectl apply -f kubernetes/ingress/ingress.yml
	kubectl apply -f traefik/role.yml
	kubectl apply -f traefik/role-binding.yml
	kubectl apply -f traefik/serviceaccount.yml
	kubectl apply -f traefik/traefik-services.yml
	kubectl apply -f traefik/traefik.yml

delete_ingress:
	kubectl delete -f traefik/role.yml
	kubectl delete -f traefik/role-binding.yml
	kubectl delete -f traefik/serviceaccount.yml
	kubectl delete -f traefik/traefik-services.yml
	kubectl delete -f traefik/traefik.yml


deploy_liferay:
	kubectl apply -f kubernetes/secrets/postgres_secret.yml
	kubectl apply -f kubernetes/services/liferay_service.yml
	kubectl apply -f kubernetes/services/postgres_service.yml 
	kubectl apply -f kubernetes/volumes/postgres_volume.yml 
	kubectl apply -f kubernetes/volumes/liferay_volumes.yml
	kubectl apply -f kubernetes/deployments/postgres.yml
	kubectl apply -f kubernetes/deployments/liferay.yml

delete_liferay:
	kubectl delete -f kubernetes/deployments/liferay.yml
	kubectl delete -f kubernetes/deployments/postgres.yml
	kubectl delete -f kubernetes/secrets/postgres_secret.yml
	kubectl delete -f kubernetes/services/liferay_service.yml
	kubectl delete -f kubernetes/services/postgres_service.yml 
	kubectl delete -f kubernetes/volumes/postgres_volume.yml 
	kubectl delete -f kubernetes/volumes/liferay_volumes.yml
	
deploy_keycloak:
	kubectl apply -f kubernetes/secrets/mariadb_secret.yml
	kubectl apply -f kubernetes/services/keycloak_service.yml
	kubectl apply -f kubernetes/services/mariadb_service.yml 
	kubectl apply -f kubernetes/volumes/mariadb_volumes.yml 
	kubectl apply -f kubernetes/deployments/keycloak.yml
	kubectl apply -f kubernetes/deployments/mariadb.yml

delete_keycloak:
	kubectl delete -f kubernetes/secrets/mariadb_secret.yml
	kubectl delete -f kubernetes/services/keycloak_service.yml
	kubectl delete -f kubernetes/services/mariadb_service.yml 
	kubectl delete -f kubernetes/volumes/mariadb_volume.yml 
	kubectl delete -f kubernetes/deployments/keycloak.yml
	kubectl delete -f kubernetes/deployments/mariadb.yml



#Liferay require heavy resources to start. it's best to deploy it first
	