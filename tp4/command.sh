# Create a Service Account
kubectl -n kube-system create serviceaccount reader
# create secret for the service account
kubectl apply -f reader-secret.yaml
# Create a ClusterRole
kubectl apply -f reader-cr.yaml
# Create a ClusterRoleBinding
kubectl apply -f reader-crb.yaml