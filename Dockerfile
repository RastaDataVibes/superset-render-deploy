# Use the official Apache Superset image
FROM apache/superset:latest

# Install PostgreSQL driver for SQLAlchemy
USER root
RUN pip install psycopg2-binary
USER superset

# Set environment variables
ENV SUPERSET_HOME=/app
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

# Copy your custom Superset configuration
COPY superset_config.py /app/superset_config.py

# Expose Superset port
EXPOSE 8088

# Start Superset using Gunicorn
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8088", "superset.app:create_app()"]
