FROM alpine/helm:3.8.1

# setup AWS CLI
RUN apk add --no-cache curl python3 py3-pip && pip3 install --upgrade pip && pip3 install awscli && rm -rf /var/cache/apk/*

# setup authenticator
RUN mkdir -p /root/.aws && \
  curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x ./aws-iam-authenticator && \
  mv ./aws-iam-authenticator /usr/local/bin && \
  aws-iam-authenticator help

ARG KUBECTL_VERSION=v1.18.0

# setup kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && mv ./kubectl /usr/local/bin

  # - echo -n ${aws_credentials} | base64 -d > /root/.aws/credentials
  # - echo -n ${aws_config} | base64 -d > /root/.aws/config
  # - aws --region eu-west-2 eks update-kubeconfig --name ${CLUSTER}