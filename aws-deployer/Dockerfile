FROM alpine/helm:3.10.1

# setup AWS CLI
RUN apk add --no-cache curl python3 py3-pip && pip3 install --upgrade pip
RUN pip3 install awscli
RUN rm -rf /var/cache/apk/*
# RUN alias aws='awsv2'

# ENV AWS_CLI_VER=2.7.5

# RUN apk update && apk add --no-cache curl gcompat zip &&  \
#     curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip -o awscliv2.zip && \
#     unzip awscliv2.zip && ./aws/install


# setup authenticator
RUN mkdir -p /root/.aws && \
  curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x ./aws-iam-authenticator && \
  mv ./aws-iam-authenticator /usr/local/bin && \
  aws-iam-authenticator help

ARG KUBECTL_VERSION=v1.22.2

# setup kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && mv ./kubectl /usr/local/bin

  # - echo -n ${aws_credentials} | base64 -d > /root/.aws/credentials
  # - echo -n ${aws_config} | base64 -d > /root/.aws/config
  # - aws --region eu-west-2 eks update-kubeconfig --name ${CLUSTER}