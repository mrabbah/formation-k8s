# Create a Service Account
kubectl -n kube-system create serviceaccount reader
# create secret for the service account
kubectl apply -f reader-secret.yaml
# Create a ClusterRole
kubectl apply -f reader-cr.yaml
# Create a ClusterRoleBinding
kubectl apply -f reader-crb.yaml

# Retreive token
kubectl -n kube-system get secret reader-secret -o jsonpath='{.data.token}' | base64 --decode

# change the value of token in kubeconfig-example.yaml

# test
kubectl get nodes --kubeconfig=kubeconfig-example.yaml

kubectl get ns --kubeconfig=kubeconfig-example.yaml

cd ../tp5

kubectl apply -f pgadmin-deployment.yaml --kubeconfig=../tp4/kubeconfig-example.yaml