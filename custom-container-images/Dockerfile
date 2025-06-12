FROM ultramcu/ubuntu4bbb

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    python3-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
# Install Python packages
RUN pip3 install \
    Flask \
    Flask-SocketIO \
    eventlet \
    requests \
    numpy \
    opencv-python-headless \
    Pillow
    