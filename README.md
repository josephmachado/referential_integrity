# Referential Integrity Checks for Data Pipelines

Sample code for the blog post: [How to prevent missing data with referential integrity checks](https://www.startdataengineering.com/post/why-referential-integrity-matters/)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/josephmachado/referential_integrity)

## Setup

### Codespaces (recommended)

1. Click the button above to open in GitHub Codespaces
2. Wait a few minutes for `docker compose up -d --build` to run automatically
3. Wait another 2 minutes, then click the `Ports` tab and the `world` icon next to port `8888` to open JupyterLab

Once done, delete the Codespace instance to avoid charges.

### Local setup

**Prerequisites**

1. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/)

> **Windows users**: Use WSL with Ubuntu — [install guide](https://documentation.ubuntu.com/wsl/stable/howto/install-ubuntu-wsl2/)

```bash
docker compose up -d --build
sleep 30
```

## Start

Open JupyterLab at <http://localhost:8888/> and follow the notebooks in order.

## Spin down

```bash
docker compose down -v
```
