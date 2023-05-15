# prerender.io implementation as docker image/container
## for more info look https://github.com/prerender/prerender

## to publish the changes
```sh
docker build . -t dasmeta/prerender:0.0.4 --no-cache --platform linux/amd64
docker push dasmeta/prerender:0.0.4
```