import os

# Secret key for Flask sessions and CSRF protection
SECRET_KEY = os.environ.get(
    "SUPERSET_SECRET_KEY",
    "fallback-key-for-local-testing"  # Only used if env variable not set
)

# SQLAlchemy connection string to your Postgres database on Render
SQLALCHEMY_DATABASE_URI = os.environ.get(
    "DATABASE_URL",
    "postgresql+psycopg2://zaga_admin:Y1hfxNhumANyST9BcyjxO0RC4m2KXOA2@dpg-d3n1av49c44c73cgjts0-a/used_car_dealership_db"
)

# Enable CSRF protection
WTF_CSRF_ENABLED = True

# Optional: Superset feature flags (adjust as needed)
FEATURE_FLAGS = {
    "ALERT_REPORTS": True,
    "DASHBOARD_NATIVE_FILTERS": True,
}

# Optional: You can add other settings here if needed
# Example: DEFAULT_TIMEZONE, THUMBNAIL_SIZE, MAPBOX_API_KEY, etc.

