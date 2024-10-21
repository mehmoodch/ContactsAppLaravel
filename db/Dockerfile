# Use an official MySQL base image from Docker Hub
FROM mysql:8.0

# Set environment variables (these are optional and can be customized)
ENV MYSQL_ROOT_PASSWORD=Admin.123?
ENV MYSQL_DATABASE=laravel
ENV MYSQL_USER=laravel_user
ENV MYSQL_PASSWORD=laravel_password

# If you want to add any custom initialization SQL scripts, copy them into the container
#COPY ./init.sql /docker-entrypoint-initdb.d/

# Expose MySQL default port
EXPOSE 3306