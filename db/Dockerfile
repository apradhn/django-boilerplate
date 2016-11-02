FROM postgres:9.4
RUN apt-get update && apt-get install -y curl
ADD init-database.sh /docker-entrypoint-initdb.d/
