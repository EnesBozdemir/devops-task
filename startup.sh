#!/bin/bash

# Build images
docker-compose build

# Start containers
docker-compose up -d

# Wait for MSSQL server to start
sleep 30

# Run database initialization script
docker exec -it <db_container_name> /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Un!q@to2023' -i /path/to/init.sql
