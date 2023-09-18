# Why
Contains preconfigured base images for different situations.

## How to build
`make build-php-fpm TAG=0.1.1 `
`make build IMAGE=php-fpm TAG=0.1.1 `

Those will build and push images under dasmeta/${IMAGE} in docker hub.

## Note
You will need to manually create docker repository.
