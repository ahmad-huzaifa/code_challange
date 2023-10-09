# Code Challenge - 2-kubernetes

## Answers:

1. This application was not working properly, since the container is listening on port 8000 instead of 80. So updating the file `values.yaml` solves the issue.

To verify it, service is exposed via port forwarding and for that below command is used.
```
kubectl port-forward service/hello-world  3000:80
```
2. Deploy 3 times the same service+deployment (3 services + 3 deployments) but each of them should show a different string:
   - Hello Freund
   - Hello Amigo
   - Hello Friend

This is achieved by creating three `values-xx.yaml` files in which appropriate env variable value is passed to the container. Code updated for files `deployment.yaml` & `service.yaml`\
For deployment below helm commands are used:

**Note: You have to change the directory to `CODE-CHALLANGE-HUZAFA`**
```
helm install  de-hello-world  2-kubernetes/helm/ --values=2-kubernetes/helm/values-de.yaml
helm install  es-hello-world  2-kubernetes/helm/ --values=2-kubernetes/helm/values-es.yaml
helm install  en-hello-world  2-kubernetes/helm/ --values=2-kubernetes/helm/values-en.yaml
```
3. Add the necessary code to expose this service to outside of the cluster. Also, when querying different endpoints it should show each of the different services you created on the previous step:
   - `http://<address>/de` should show "Hello Freund"
   - `http://<address>/es` should show "Hello Amigo"
   - `http://<address>/en` should show "Hello Friend"

To achieve above below steps are performed:

1. Ingress controller needs to be enabled on minkube. For that use this command: 
```
minikube addons enable ingress
```
2. ingress resource is deployed on the cluster to access the services with following urls.

   - `http://<address>/de` should show "Hello Freund"
   - `http://<address>/es` should show "Hello Amigo"
   - `http://<address>/en` should show "Hello Friend"

Replace `<address>` with the ingress address and ingress address can get using command  
```
kubectl get ingress --namespace default
```
