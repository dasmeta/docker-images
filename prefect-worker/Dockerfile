FROM prefecthq/prefect:3.4.23-python3.11

# Install prefect-kubernetes package
RUN pip install --no-cache-dir prefect-kubernetes

# Switch to prefect user
USER prefect

WORKDIR /home/prefect
