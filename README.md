# Docker Local SSL Termination Proxy

A simple SSL Termination Proxy for localhost.

This proxy is easy to use (1 command to launch) and nothing is installed in your local machine (thanks for docker).

## Requirement

- Docker (1.10.0+)

## Usage

### Mac OSX

```bash
docker run -it \
  -e "HOST_IP=`ipconfig getifaddr en0`" \
  -e "PORT=8000" \
  -p 443:443 \
  --rm \
  esplo/docker-local-ssl-termination-proxy
```

### Linux

```bash
docker run -it \
  -e "HOST_IP=`hostname -I | awk '{print $1}'`" \
  -e "PORT=8000" \
  -p 443:443 \
  --rm \
  esplo/docker-local-ssl-termination-proxy
```

### Other platform

Only you have to do is to change the command for 'HOST_IP'.

### Test connection

```bash
$ curl -k https://localhost/
```

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).

