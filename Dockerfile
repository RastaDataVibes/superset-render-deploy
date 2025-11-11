# Use the official Apache Superset image
FROM apache/superset:latest

# Optional: set Superset home directory
ENV SUPERSET_HOME=/app/superset_home
ENV SUPERSET_CONFIG_PATH=/app/superset_home/superset_config.py

# Copy your custom Superset configuration
COPY superset_config.py /app/superset_home/superset_config.py

# Expose Superset port
EXPOSE 8088

# Start Superset using Gunicorn
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8088", "superset.app:create_app()"]

