## Create secret for container registry
kubectl create secret -n pyats generic registrypassword --from-file=password.txt
## Create secret for git access
kubectl create secret -n pyats generic gitkeys --from-file=id_rsa --from-file=id_rsa.pub

