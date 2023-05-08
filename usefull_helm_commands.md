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

### List all deployments
`kubectl get deployment`

### List all services
`kubectl get service`

### List all deployments and services together
`kubectl get deploy,svc`

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

### Shows error in generated chart
`helm lint`

### Shows generated chart
`helm template .`

### Shows error in generated chart by using help from kubectl
`helm template . | kubectl apply -f -` 