# How to Use
```
deploy:
  stage: deploy
  image:
    name: dasmeta/aws-deployer:0.1.0
    entrypoint: ['/bin/sh', '-c']
  before_script:
    - aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
    - aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
    - aws configure set region $AWS_DEFAULT_REGION
    - aws --region ${AWS_DEFAULT_REGION} eks update-kubeconfig --name ${CLUSTER}
  script:
    - cd helm/${CI_PROJECT_NAME}
    - helm dep build
    - helm upgrade --install ${CI_PROJECT_NAME} .
      -f values.yaml
      --set image.tag=$CI_COMMIT_SHA
      --wait

# How to build/publish
```sh
docker build . -t dasmeta/aws-deployer:0.3.0 --no-cache --platform linux/amd64
docker push dasmeta/aws-deployer:0.3.0
```