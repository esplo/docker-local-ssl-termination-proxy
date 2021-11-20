# Docker Local SSL Termination Proxy

A simple SSL Termination Proxy for accessing https://localhost.

This proxy is easy to use (1 command to launch) and nothing is installed on your local machine thanks to Docker.

## Requirement

- Docker (20.10.0+)

## Usage

Assume that your application is running on `http://localhost:8000`, the following command makes us accept requests to `https://localhost`.

### Mac OSX

```bash
docker run -it \
  -e "PORT=8000" \
  -p 443:443 \
  --rm \
  esplo/docker-local-ssl-termination-proxy
```

### Linux

```bash
docker run -it \
  --add-host=host.docker.internal:host-gateway
  -e "PORT=8000" \
  -p 443:443 \
  --rm \
  esplo/docker-local-ssl-termination-proxy
```

### Other platform

You need to make sure that `host.docker.internal` is resolved properly inside docker containers. For majority of platforms that don't resolve it automatically (like Docker Desktop for Mac), setting `--add-host=host.docker.internal:host-gateway` is enough.

### Test connection

```bash
$ curl -k https://localhost/
```

## Troubleshoot

### "Your connection is not private" in Chrome

Click "Advanced" button, then click "Proceed anyway".

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).
