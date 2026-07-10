FROM prefecthq/prefect:3.7.7-python3.12

# Install prefect-kubernetes package
RUN pip install --no-cache-dir prefect-kubernetes

# Switch to prefect user
USER prefect

WORKDIR /home/prefect
