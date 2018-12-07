docker build -t kinano/multi-container-client:latest -t kinano/multi-container-client:$SHA  -f ./travis-google-cloud-k8s/client/Dockerfile ./travis-google-cloud-k8s/client
docker build -t kinano/multi-container-server:latest -t kinano/multi-container-server:$SHA -f ./travis-google-cloud-k8s/server/Dockerfile ./travis-google-cloud-k8s/server
docker build -t kinano/multi-container-worker:latest -t kinano/multi-container-worker:$SHA -f ./travis-google-cloud-k8s/worker/Dockerfile ./travis-google-cloud-k8s/worker

docker push kinano/multi-container-client:latest
docker push kinano/multi-container-server:latest
docker push kinano/multi-container-worker:latest

docker push kinano/multi-container-client:$SHA
docker push kinano/multi-container-server:$SHA
docker push kinano/multi-container-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=kinano/multi-container-server:$SHA
kubectl set image deployments/client-deployment client=kinano/multi-container-client:$SHA
kubectl set image deployments/worker-deployment worker=kinano/multi-container-worker:$SHA