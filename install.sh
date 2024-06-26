helm repo add k8up-io https://k8up-io.github.io/k8up
helm repo update
helm install k8up-io/k8up --generate-name
kubectl apply -f https://github.com/k8up-io/k8up/releases/download/v2.10.0/k8up-crd.yaml