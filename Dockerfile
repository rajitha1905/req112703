# Use the official Python image as a base
FROM python:3.12-slim

# Install system dependencies required for psycopg2 and Poetry
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libpq-dev \
    git

# Set environment variables for Poetry and Python
ENV PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.8.3 \
    POETRY_HOME=/opt/poetry \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH=/application \
    VENV_PATH=/application/.venv \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/application/app/src

# Install Poetry using pip
RUN pip install poetry==${POETRY_VERSION}

# Add Poetry to PATH
ENV PATH="$POETRY_HOME/bin:$PATH"

# Set the working directory
WORKDIR /application

# Copy the project files
COPY . .

# Install Python dependencies using Poetry
RUN poetry install --no-root

# Expose the application port
EXPOSE 3000

# Command to run your application
CMD ["poetry", "run", "uvicorn", "src.sample_api.main:app", "--host", "0.0.0.0", "--port", "3000"]
