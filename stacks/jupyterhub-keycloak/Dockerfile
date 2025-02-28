# docker build -t oci.stackable.tech/sandbox/spark:3.5.2-python311 -f Dockerfile .
# kind load docker-image oci.stackable.tech/sandbox/spark:3.5.2-python311 -n stackable-data-platform
# or:
# docker push oci.stackable.tech/sandbox/spark:3.5.2-python311

FROM spark:3.5.2-scala2.12-java17-ubuntu

USER root

RUN set -ex; \
    apt-get update; \
    # Install dependencies for Python 3.11
    apt-get install -y \
    software-properties-common \
    && apt-get update && apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev \
    && rm -rf /var/lib/apt/lists/*; \
    # Install pip manually for Python 3.11
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.11 get-pip.py && \
    rm get-pip.py

# Make Python 3.11 the default Python version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
    && update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3 1

USER spark
