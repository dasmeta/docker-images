IMAGE=aws-deployer
TAG=0.1.0

build:
	cd ${IMAGE} && docker build --platform linux/amd64 -t dasmeta/${IMAGE}:${TAG} .
	docker push dasmeta/${IMAGE}:${TAG}

build-php-fpm: IMAGE=php-fpm
build-php-fpm: build
