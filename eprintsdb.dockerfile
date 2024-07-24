FROM mysql:5.7

# Set environment variables for MySQL
# Make shure to synchronise any changes in docker-compose
ENV MYSQL_ROOT_PASSWORD=tameness-peddling-humped
ENV MYSQL_DATABASE=eprints
ENV MYSQL_USER=eprints_user
ENV MYSQL_PASSWORD=wilder-landscape-chrome

# Expose the MySQL port
EXPOSE 3306

# Add a health check to ensure the database is ready
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD mysqladmin ping -h localhost -u root -p$MYSQL_ROOT_PASSWORD || exit 1