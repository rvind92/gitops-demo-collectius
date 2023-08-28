# gitops-demo-collectius

Presentation
https://docs.google.com/presentation/d/1DbutyoNZWdzoeXGeP98yBQwrXdGVYIfoTgdMx4cO7-o/edit?usp=sharing

1. Install minikube or kind on your local machine (using minikube for this example)
2. Start minikube to create a local Kubernetes configuration and a single local cluster
3. Log into Azure CLI and connect to AKS cluster. This step will configure minikube to use the AKS cluster configuration
    1. az login
    2. az account set --subscription <redacted, ask me for this value>
    3. az aks get-credentials --resource-group Neo_Collectius_Group --name ak8s
4. Verify the new configuration by running
    1. kubectl get deployments --all-namespaces=true
5. Install ArgoCD tool on the cluster (can skip this since it is installed)
    1. kubectl create namespace argocd
    2. kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
6. Verify ArgoCD installation
    1. kubectl get all --namespace argocd
7. Since the ArgoCD server is of type ClusterIP, it needs to be changed to type LoadBalancer to allow for access from browser. (can skip this since it is already configured)
    1. kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
8. Verify you can access the ArgoCD UI in your browser by typing in https://localhost:8080.
9. Type in admin as the username.
10. For the password, execute this command on your open command line or terminal:
    1. kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
11. Copy the password and use it for the login.
12. You should see the list of apps that are deployed, in this case, there is only express-app.