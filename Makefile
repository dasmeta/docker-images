IMAGE=aws-deployer
TAG=0.1.0

build:
	cd ${IMAGE} && docker build -t dasmeta/${IMAGE}:${TAG} .
	docker push dasmeta/${IMAGE}:${TAG}

build-php-fpm: IMAGE=php-fpm
build-php-fpm: build
