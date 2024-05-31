FROM nodejs

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*