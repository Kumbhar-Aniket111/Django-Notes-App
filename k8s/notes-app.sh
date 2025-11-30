#!/bin/bash

kubectl apply -f notes-app.yml
kubectl config set-context --current --namespace=notes-app
kubectl apply -f volume.yml
kubectl apply -f dbSecret.yml
kubectl apply -f dbConfigmap.yml
kubectl apply -f mysql.yml
kubectl apply -f django.yml
kubectl apply -f nginx.yml
kubectl apply -f nginxIngress.yml

# kubectl port-forward svc/ingress-nginx-controller -n ingress-nginx 80:80 --address=0.0.0.0 &