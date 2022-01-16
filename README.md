 

# yacd-docker

## Quick Start

Start yacd listening on port 8000 with custom default backend.

```shell
docker run -d -p 8000:80 -e YACD_DEFAULT="http://127.0.0.1:7892" kaaass/yacd
```

## Config

- YACD_DEFAULT：Default backend address
