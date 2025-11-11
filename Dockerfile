# Use the official Apache Superset image
FROM apache/superset:latest

# Switch to root to install system dependencies
USER root

# Install build tools and PostgreSQL drivers
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev && \
    pip install --no-cache-dir psycopg2-binary && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to the superset user
USER superset

# Set environment variables
ENV SUPERSET_HOME=/app
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

# Copy your Superset config file into the container
COPY superset_config.py /app/superset_config.py

# Expose Superset port
EXPOSE 8088

# Start Superset with Gunicorn
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8088", "superset.app:create_app()"]
