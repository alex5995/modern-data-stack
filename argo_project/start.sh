minikube start
minikube kubectl -- create namespace argo || true
minikube kubectl -- apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.4.4/install.yaml
minikube kubectl -- patch deployment \
    argo-server \
    --namespace argo \
    --type='json' \
    -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/args", "value": [
    "server",
    "--auth-mode=server"
]}]'
