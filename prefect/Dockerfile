FROM atlassian/default-image:3

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Install python & pip
RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    ln -s /usr/bin/python3 /usr/bin/python

# Install prefect
RUN pip install -U "prefect==2.6.7" && \
    pip install s3fs && \
    pip install gcsfs && \
    pip install adlfs

COPY ./requirements.txt ./requirements.txt

RUN pip install -r ./requirements.txt
