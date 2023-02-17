# Masterportal-docker

This builds a docker image that runs [Masterportal](https://bitbucket.org/geowerkstatt-hamburg/masterportal) (dev or prod) along with a minimal [nginx](https://hub.docker.com/_/nginx/) image to serve the portal.

## Getting the image

### Trusted builds

TODO 🚧 

### Local builds

#### Development 👩‍💻

1. Adapt MASTERPORTAL_VERSION in `startDev.sh` to your needs, cf. [tags](https://bitbucket.org/geowerkstatt-hamburg/masterportal/src/dev/)
2. Run `startDev.sh` to set environment variables.
3. `docker compose build -d`
4. App runs on `localhost/masterportal`

#### Production

- TODO: 🚧
  - production build
  - example `docker-compose` files that uses `mapfish-print`, e.g.

## Environment variables
- `MASTERPORTAL_VERSION`=Tag of the Masterportal version you would like to build.

## Embed addons 🤸🏼

TODO 🚧
