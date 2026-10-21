# Why
Contains preconfigured base images for different situations.

## How to build
`make build-php-fpm TAG=0.1.1 `
`make build IMAGE=php-fpm TAG=0.1.1 `

Those will build and push images under dasmeta/${IMAGE} in docker hub.

### Last time built by

cd php-fpm
docker login --username dasmetadeployer

docker build --pull --platform linux/amd64 -t dasmeta/php-fpm:0.1.6-8.2 .
docker run --rm dasmeta/php-fpm:0.1.6-8.2 php -v
docker push dasmeta/php-fpm:0.1.6-8.2

## Note
You will need to manually create docker repository.
