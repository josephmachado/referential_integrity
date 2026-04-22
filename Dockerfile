FROM python:3.13-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    openjdk-17-jdk \
    wget \
    make \
    procps \
    gcc \
    g++ \
    cmake \
    pkg-config \
    libssl-dev \
    libzstd-dev \
    libffi-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s $(ls -d /usr/lib/jvm/java-17-openjdk-* | grep -v current | head -1) \
    /usr/lib/jvm/java-17-openjdk-current

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-current

# Install uv
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

RUN uv init
RUN uv add jupyterlab duckdb jupysql psycopg2-binary pandas pyarrow duckdb-engine prettytable

ENV DATABASE_URL="postgresql://dataengineer:datapipeline@postgres:5432/ecommerce"
COPY ./ipython_scripts/startup/ /root/.ipython/profile_default/startup/

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

ENV PATH="/app/.local/bin/:$PATH"

CMD ["/startup.sh"]
