# Parameterizable Static Demo Page
Parameterizable static nginx-based website Docker Image. A Docker image is available at [Docker Hub](https://hub.docker.com/r/mmianl/static-demo-page)

```sh
export HEADER='Hello World'
export TEXT='This is an example text'
export IMAGE='ales-krivec'

docker build -t mmianl/static-demo-page:nginx-1.22.1 .
docker run --env HEADER=${HEADER} --env TEXT=${TEXT} --env IMAGE=${IMAGE} -p 8080:80 mmianl/static-demo-page:nginx-1.22.1
```

## Available Background Images
| Photographer     | Value for env var  |
|------------------|--------------------|
| Ales Krivec      | `ales-krivec`      |
| Yf Wu            | `yf-wu`            |
| Lerone Pieters   | `lerone-pieters`   |
| Maëva Vigier     | `maeva-vigier`     |
| Tal Berkovich    | `tal-berkovich`    |
| Irfan Simsar     | `irfan-simsar`     |
| Eugene Golovesov | `eugene-golovesov` |

## Screenshot
![screenshot](docs/screenshot.png)
