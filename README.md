# Docker Local SSL Termination Proxy

A simple SSL Termination Proxy for accessing https://localhost.

This proxy is easy to use (1 command to launch) and nothing is installed on your local machine thanks to Docker.

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

## Troubleshoot

### NET::ERR_CERT_INVALID in Chrome on MacOS

Check [this SO post](https://stackoverflow.com/questions/58802767/no-proceed-anyway-option-on-neterr-cert-invalid-in-chrome-on-macos) to bypass this. My recommendation is to type "thisisunsafe".

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).

