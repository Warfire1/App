kapply = kubectl apply -f yaml_files/
kdelete = kubectl delete -f yaml_files/

run:
	@$(kapply)back-service.yaml
	@$(kapply)front-service.yaml
	@$(kapply)back-deployment.yaml
	@$(kapply)front-deployment.yaml
	@$(kapply)data-deployment.yaml
	@$(kapply)data-script-job.yaml
	@$(kapply)myapp-networkpolicy.yaml
	@$(kapply)secret.yaml
	@$(kapply)storageClass.yaml
	@$(kapply)data-pvc.yaml
	@$(kapply)secret-org.yaml

fill-db:
	@$(kapply)data-service.yaml

stop:
	@$(kdelete)back-service.yaml
	@$(kdelete)front-service.yaml
	@$(kdelete)data-service.yaml
	@$(kdelete)back-deployment.yaml
	@$(kdelete)front-deployment.yaml
	@$(kdelete)data-deployment.yaml
	@$(kdelete)data-script-job.yaml
	@$(kdelete)myapp-networkpolicy.yaml
	@$(kdelete)secret.yaml
	@$(kapply)secret-org.yaml
clean:
	@$(kdelete)data-pvc.yaml