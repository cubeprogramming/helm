# Usefull HELM commands

## Preparing

### Checking available commands
`helm`
`kubectl --help`
`kubectl options`

### Checking cluster info
`kubectl cluster-info`

### Display cluster nodes internall IP
`kubectl get nodes -o wide`

### Creating chart structure
`helm create <directory_name>`

## Deploying

### Installing chart from the current dir
`helm install <CHART_NAME> .`

### Installing chart from the current dir by using custom values file
`helm install <CHART_NAME> . -f custom_values.yaml`

### Upgrading chart
`helm upgrade  <CHART_NAME> .`

### List all deployments
`kubectl get deployment`

### List all services
`kubectl get service`

### List all deployments and services together
`kubectl get deploy,svc`

### List all objects
`kubectl get all`

### Display metrics for pods and nodes
`kubectl top node`
`kubectl top pod -l <deployment_name> -A`

### Display service LoadBalance ingress and other info
`kubectl describe service <service_name>`

### List deployed charts
`helm list` or `helm ls`

## Removing

### Removing chart
`helm uninstall <CHART_NAME>`

### Removing deployment
`kubectl delete deployment <deployment_name>`

### Removing service
`kubectl delete service <service_name>`

## Troubleshooting

### Shows generated chart from current chart dir
`helm template .`

### Shows error in generated chart
`helm lint`

### Shows error in generated chart by using help from kubectl
`helm template . | kubectl apply -f -` 

## Working with Chart repositories

### Listing registered repositories
`helm repo list`

### Adding repository
`helm repo add chartmuseum https://chartmuseum.github.io/charts`

### Updating repository
`helm repo update`

### Removing repository
`helm repo remove chartmuseum`

### Install Chart form repository
`helm install chartmuseum/chartmuseum --generate-name`

### Pull Chart form the repo
`helm pull chartmuseum/chartmuseum` -- provides chart in .tgz format

### Unpack and install chartmuseum
```bash
tar -xvf chartmuseum-3.9.3.tgz 
# Change following values in  values.yaml
DISABLE_API: false
service:
  type: NodePort
  #externalTrafficPolicy: Local
  nodePort: 30005

helm install chartmuseum chartmusemum
```

### Adding localy running chartmuseum to a list of repositories
`helm repo add our-repo http://localhost:30005`

### Package the chart from current dir
`helm package .` -- creates package in .tgz format in the same dir.

### Pushing chart to repository
`curl --data-binary "@my-chart-0.1.0.tgz" http://localhost:30005/api/charts`

### Sarching the repo
`helm search repo my-chart`

### Installing chart form specific repo
`helm install our-repo/my-chart --generate-name` or
`helm install my-chart our-repo/my-chart`