# Kubernetes Labor

## Ülesanne
Luua K3s klaster, juurutada sinna NGINX ja PostgreSQL konteinerid ning expose'ida need teenustena.

## Sammud
1. Paigalda K3s
2. Kontrolli `kubectl get nodes`
3. Loo nginx-pod.yaml
4. Loo nginx-deployment.yaml
5. Loo nginx-service.yaml
6. Loo nginx-nodeport.yaml
7. Loo postgres.yaml
8. Rakenda need `kubectl apply -f .`
9. Kontrolli `kubectl get pods`, `kubectl get svc`
10. Ava brauseris NodePort kaudu NGINX leht
