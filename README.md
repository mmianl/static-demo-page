# Parameterizable Static Demo Page
Parameterizable static nginx-based website Docker Image. A Docker image is available at [Docker Hub](https://hub.docker.com/r/mmianl/static-demo-page)

```sh
export HEADER='Hello World'
export TEXT='This is an example text'
export IMAGE='ales-krivec'

docker build -t mmianl/static-demo-page:nginx-1.23.3 .
docker run --env HEADER=${HEADER} --env TEXT=${TEXT} --env IMAGE=${IMAGE} -p 8080:80 mmianl/static-demo-page:nginx-1.23.3
```

## Available Paths
* `/`
* `/index.html`
* `/status.json`

## Available Background Images
| Photographer     | Value for env var  |
|------------------|--------------------|
| Ales Krivec      | `ales-krivec`      |
| Yf Wu            | `yf-wu`            |
| Lerone Pieters   | `lerone-pieters`   |
| Maëva Vigier     | `maeva-vigier`     |
| Irfan Simsar     | `irfan-simsar`     |

## Screenshot
![screenshot](docs/screenshot.png)

## Example Manifest
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: static-demo-page-deployment
  namespace: default
  labels:
    app: static-demo-page
spec:
  replicas: 2
  selector:
    matchLabels:
      app: static-demo-page
  template:
    metadata:
      labels:
        app: static-demo-page
    spec:
      containers:
        - name: static-demo-page
          image: mmianl/static-demo-page:nginx-1.23.3
          env:
            - name: HEADER
              value: "Hello World"
            - name: TEXT
              value: "This is an example text"
            - name: IMAGE
              value: "ales-krivec"
          ports:
            - containerPort: 80
              name: http-web
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /status.json
              port: 80
              httpHeaders:
            initialDelaySeconds: 1
            periodSeconds: 3
          readinessProbe:
            httpGet:
              path: /status.json
              port: 80
            initialDelaySeconds: 1
            periodSeconds: 3
          resources:
            requests:
              memory: "64Mi"
              cpu: "100m"
            limits:
              memory: "64Mi"
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: static-demo-page
  name: static-demo-page
  namespace: default
spec:
  internalTrafficPolicy: Cluster
  ports:
    - name: http-web
      port: 80
      protocol: TCP
      targetPort: 80
  selector:
    app: static-demo-page
  type: ClusterIP
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: demo-ingress
  namespace: default
spec:
  ingressClassName: ingress-nginx
  rules:
    - host: static-demo-page.example.com
      http:
        paths:
        - backend:
            service:
              name: static-demo-page
              port:
                number: 80
          pathType: ImplementationSpecific
```
