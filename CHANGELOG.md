# Changelog

## [Unreleased]
### Added
- Dockerfile to build the FastAPI application.
-  Created a GitHub Actions workflow (`docker-build.yaml`) in `.github/workflows/`:
  - Added steps to check out the code.
  - Set up Python 3.12 environment for running unit tests.
  - Installed `poetry` and its dependencies.
  - Ran unit tests using `pytest`.
  - Set up Docker Buildx for building multi-platform Docker images (`linux/amd64` and `linux/arm64`).
  - Built the Docker image and pushed it to the GitHub Container Registry (GHCR).
  - Ensured that the image is public and accessible by the review team.

### Changed
- Updated the PATH for Poetry in start-local.sh
- Updated README.md file to include CI workflow
