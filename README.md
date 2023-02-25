# Parameterizable Static Demo Page
Parameterizable static nginx-based website Docker Image

```sh
export HEADER='Hello World'
export TEXT='This is an example text'
export IMAGE='ales-krivec'

docker build -t demo-page .
docker run --env HEADER=${HEADER} --env TEXT=${TEXT} --env IMAGE=${IMAGE} -p 8080:80 demo-page
```

## Available Background Images
| Author           | Value for env var  |
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
