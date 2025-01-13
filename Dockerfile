FROM python:3.12-slim


RUN pip install poetry

WORKDIR /app

COPY pyproject.toml poetry.lock* ./
COPY py_cli_app/ ./py_cli_app/
COPY docker-entrypoint.sh /

# Configure poetry to not create a virtual environment in the container
RUN poetry config virtualenvs.create false

# Install dependencies
RUN poetry install --without dev

RUN chmod +x /docker-entrypoint.sh
# Create an entrypoint script
# RUN echo '#!/bin/sh\n\
#     if [ $# -eq 0 ]; then\n\
#     echo "Please provide a command. Available commands: hello, show-tasks"\n\
#     exit 1\n\
#     fi\n\
#     py-cli "$@"' > /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]