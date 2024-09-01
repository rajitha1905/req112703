# Sample API

This is a sample api. 

## Technology Used
- [x] [Python](https://www.python.org)
- [x] [FastAPI](https://fastapi.tiangolo.com)
- [x] [SQLAlchemy](https://www.sqlalchemy.org)
- [x] [Poetry](https://python-poetry.org)
- [x] [Flyway](https://www.red-gate.com/products/flyway/community/)
- [x] [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### Environment variables

The following environment variables are expected:

- ORIGINS: comma separated list of [allowed origins](https://fastapi.tiangolo.com/tutorial/cors/).
- POSTGRES_SERVER: URL of db server
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_DB: postgres DB name

### DB adaptor

The [psycopg2](https://www.psycopg.org) adaptor is used. Note the [installation requirements](https://www.psycopg.org/docs/install.html) for the psycopg2 package. The [sample-api dependencies](pyproject.toml) use the psycopg2 package and not the psycopg2-binary package.
    
## Local Development

### Running locally

- Run `docker compose up` command from root directory to start the entire stack. The following will be started: 
  - Postgres server 
  - Flyway - it setups the postgres tables and inserts some dev data.
  - sample-api server
- Environment variables are defined in the docker-compose.yml
- The `sample-api` folder is volume mounted, so any changes to the code will be reflected in the container 
- The API's documentation is available at [http://localhost:3003/docs](http://localhost:3003/docs).


### Unit tests

- Run `docker compose --profile test up` command to run the unit tests from the root directory. This will run the above services as well as the unit tests.
- The folder is volume mounted, so any changes to the code will be reflected in the container and run the unit tests again.

## GitHub Actions CI/CD Workflow

### Overview

The GitHub Actions workflow automates the following tasks:

1. **Run Unit Tests**: Ensures the application code is functioning correctly.
2. **Build Docker Image**: Builds the Docker image for multiple architectures (`linux/amd64` and `linux/arm64`).
3. **Publish Docker Image**: Pushes the built Docker image to the GitHub Container Registry (GHCR).

### How to Trigger the Workflow

The workflow is automatically triggered on:

- **Pushes to the `main` branch**: Any changes pushed to the `main` branch will automatically run the workflow.

To manually trigger the workflow:

1. **Push a commit** to the `main` branch.
2. The workflow will start automatically, running the unit tests, building the Docker image, and pushing it to GHCR.

### How to Pull and Run the Docker Image

The Docker image is published to the GitHub Container Registry (GHCR) and is publicly accessible. You can pull and run the image using the following commands:

```bash
docker pull ghcr.io/rajitha1905/req112703:latest
docker run -p 8000:3000 ghcr.io/rajitha1905/req112703:latest
```
Port 8000 is exposed by default and can be accessed via http://localhost:8000.


## The API

This is a simple API. It is not production ready. 

The API is based on the table schema defined in [V1.0.0__init.sql](db/migrations/V1.0.0__init.sql) file. Note the foreign key constraint if you want to try the endpoints out.

The [http://localhost:3003/docs](http://localhost:3003/docs) page lists the available endpoints.
