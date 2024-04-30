# DevOps Engineer Challenge
# Docker swarm
1. Check if Docker and Docker compose installed: `docker --version && docker-compose --version`
2. Launch the stack: `docker-compose up -d`
3. Open the browser and access the web app: `http://localhost:3000`
4. Open the browser and access the Grafana: `http://localhost:3001`, you can see the HTTP blackbox exporter and Redis dashboards with all the metrics.

## Kubernetes:
1. Install Minikube: Get Minikube from their website and follow the installation instructions.
2. Start Minikube: Open your terminal and type `minikube start` to start the local Kubernetes cluster. Ensure it's up and running: `minikube kubectl -- get pods -A`
3. Allow minikube accessing local images: `minikube -p minikube docker-env`
4. Install Helm: Download and install Helm following their instructions.
5. Install the chart: `helm install mychart ./mychart --namespace=default`
6. Test the web app by port-forwarding the port 3000 to your computer, you can use Lens app for that. Access it using web browser or curl.
7. Port-forward grafana, access it using default credentials admin/admin and see the dashboards with all the metrics.
8. Scale down the web app deployment to zero by modifying values.yaml and upgrading helm release or manually: `minikube kubectl -- scale --current-replicas=2 
--replicas=0 deployment/mychart-mychart-web`. Observe the metrics and graphs in the Grafana UI.

## Screenshots
![This is an alt text.](/grafana1.png "Grafana 1.")
![This is an alt text.](/grafana2.png "Grafana 2.")
