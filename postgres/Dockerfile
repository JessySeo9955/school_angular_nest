# Use the official PostgreSQL image as the base image
FROM postgres:17

# Set the working directory in the container
WORKDIR /docker-entrypoint-initdb.d

# Copy the SQL files from the host machine into the container's /docker-entrypoint-initdb.d/
# COPY ddl.sql /docker-entrypoint-initdb.d/
# COPY dml.sql /docker-entrypoint-initdb.d/

# By default, PostgreSQL will automatically execute any .sql files found in /docker-entrypoint-initdb.d/
# when the container is initialized for the first time.