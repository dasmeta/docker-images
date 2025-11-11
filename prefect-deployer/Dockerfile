FROM atlassian/default-image:3

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

#Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install python & pip and upgrade to Python 3.9
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.9 python3.9-dev python3.9-distutils && \
    ln -sf /usr/bin/python3.9 /usr/bin/python3 && \
    ln -sf /usr/bin/python3.9 /usr/bin/python && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.9 get-pip.py && \
    ln -sf /usr/local/bin/pip3.9 /usr/bin/pip && \
    rm get-pip.py

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm get_helm.sh

# Install yq
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && \
    chmod a+x /usr/local/bin/yq


# Upgrade pip and install prefect 3.4.23
RUN pip install --upgrade pip && \
    pip install -U "prefect==3.4.23" && \
    pip install s3fs && \
    pip install gcsfs && \
    pip install adlfs


RUN apt-get update &&  \
    apt-get install -y curl jq

RUN curl -sL https://git.io/autotag-install | sh -- && \
    curl -sL https://git.io/autotag-install | sh -s -- -b /usr/bin


COPY ./requirements.txt ./requirements.txt

RUN pip install -r ./requirements.txt
