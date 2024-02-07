# Masterportal-docker

This builds a docker image that runs [Masterportal](https://bitbucket.org/geowerkstatt-hamburg/masterportal) (dev or prod) along with a minimal [nginx](https://hub.docker.com/_/nginx/) image to serve the portal via https and a mapfish print servlet.

### Development 👩‍💻

**Requirements:**
- `node`

1. Adapt MASTERPORTAL_VERSION in `setup.sh` to your needs, cf. [tags](https://bitbucket.org/geowerkstatt-hamburg/masterportal/src/dev/)
2. Run `setup.sh` to set environment variables.
3. `docker compose build -d`
4. App runs on `https://localhost/portal/start-config`, print servlet: `https://localhost/print/`

### Production Example

- TODO: 🚧
<!-- integrate build mechanism of masterportal resources in workflow -->

## Environment variables
- `MASTERPORTAL_VERSION`= Tag of the Masterportal version you would like to build.
- `CONTAINER_NAME_PREFIX`= Prefix for docker containers, e.g. your project name

## Embed addons 🤸🏼

TODO 🚧
<!-- integrate addons folder to repo -->
