# prerender.io implementation as docker image/container
## for more info look https://github.com/prerender/prerender

## to publish the changes
```sh
docker build . -t dasmeta/aws-deployer:0.3.0 --no-cache --platform linux/amd64
docker push dasmeta/aws-deployer:0.3.0
```