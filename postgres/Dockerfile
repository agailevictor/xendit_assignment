# Derived from official postgres image (our base image)
FROM postgres:10.10

# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./init-scripts/ /docker-entrypoint-initdb.d/