#!/bin/bash

kubectl apply -f notes-app.yml
kubectl config set-context --current --namespace=notes-app
kubectl apply -f volume.yml
kubectl apply -f dbSecret.yml
sleep 10
kubectl apply -f dbConfigmap.yml
kubectl apply -f mysql.yml
kubectl apply -f django.yml
kubectl apply -f nginx.yml
kubectl apply -f nginxIngress.yml

kubectl port-forward svc/ingress-nginx-controller -n ingress-nginx 8080:80 --address=0.0.0.0 &