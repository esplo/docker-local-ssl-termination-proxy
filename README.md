# Docker Local SSL Termination Proxy

A simple SSL Termination Proxy for localhost.

This proxy is easy to use (1 command to launch) and nothing is installed in your local machine (thanks for docker).

## Requirement

- Docker (1.10.0+)
- Docker Compose (1.6.0+)

I only checked this program on Docker for Mac.
Maybe you have to modify some code if you run this on a Linux/Windows machine.

## Usage

### Launch

```bash
$ ./run.sh YOUR_APP_PORT
```

### Test connection

```bash
$ curl -k https://localhost/
```

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).

