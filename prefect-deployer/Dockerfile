# Dockerfile with Prefect 3.4.23 and all required tools
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y curl wget unzip gpg jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm get_helm.sh

# Install yq
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && \
    chmod a+x /usr/local/bin/yq

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws/

# Install autotag
RUN curl -sL https://git.io/autotag-install | sh -- && \
    curl -sL https://git.io/autotag-install | sh -s -- -b /usr/bin

# Install prefect 3.4.23 and essential dependencies
RUN pip install --no-cache-dir --index-url https://pypi.org/simple/ "prefect==3.4.23" && \
    pip install --no-cache-dir s3fs && \
    pip install --no-cache-dir gcsfs && \
    pip install --no-cache-dir adlfs && \
    pip cache purge

# Copy and install additional requirements
COPY ./requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt
