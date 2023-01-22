FROM atlassian/default-image:3

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

#Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install python & pip
RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    ln -s /usr/bin/python3 /usr/bin/python

RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
    apt-get install apt-transport-https --yes && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install helm

# Install yq
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && \
    chmod a+x /usr/local/bin/yq


# Install prefect
RUN pip install -U "prefect==2.7.3" && \
    pip install s3fs && \
    pip install gcsfs && \
    pip install adlfs


RUN apt-get update &&  \
    apt-get install -y curl jq

RUN curl -sL https://git.io/autotag-install | sh -- && \
    curl -sL https://git.io/autotag-install | sh -s -- -b /usr/bin


COPY ./requirements.txt ./requirements.txt

RUN pip install -r ./requirements.txt
