# Masterportal-docker

This builds a docker image that runs [Masterportal](https://bitbucket.org/geowerkstatt-hamburg/masterportal) (dev or prod) along with a minimal [nginx](https://hub.docker.com/_/nginx/) image to serve the portal via https and a mapfish print servlet.

### Development 👩‍💻

**Requirements:**
- `NodeJS`
- `Docker Engine`

1. Adapt `MASTERPORTAL_VERSION` in `setup.sh` to your needs, cf. [tags](https://bitbucket.org/geowerkstatt-hamburg/masterportal/src/dev/).
2. Set your project name in `setup.sh` for the `CONTAINER_NAME_PREFIX` variable.
3. Run `setup.sh` to set environment variables.
4. `docker compose build -d`
5. App runs on `https://localhost/portal/start-config`, print servlet: `https://localhost/print/default/capabilities.json`

### Production Example

See `docker-compose-prod.yml`. The build resources of masterportal are needed for production. It's recommended to use CI/CD for the build process. Else it can be done manually (`npm run build`).

## Environment variables
- `MASTERPORTAL_VERSION`= Tag of the Masterportal version you would like to build.
- `CONTAINER_NAME_PREFIX`= Prefix for docker containers, e.g. your project name

## Embed addons 🤸🏼

TODO 🚧
<!-- integrate addons folder to repo -->
