FROM hashicorp/tfc-agent:latest

USER root

RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates gnupg && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/awscliv2.zip && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip

# optional: install kubectl
RUN curl -L -o /usr/local/bin/kubectl https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

# optional: install helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

USER tfc-agent