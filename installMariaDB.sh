#!/bin/bash

# Database and user information
DB_NAME="DB-name"
DB_USER="user-name"
DB_PASSWORD="password"

# MariaDB root user credentials
ROOT_USER="root"
ROOT_PASSWORD="root-password"

# Install MariaDB client if not already installed
apt update
apt install -y mariadb-server

# Create a SQL script for database and user creation
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db_setup.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';" >> db_setup.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';" >> db_setup.sql
echo "FLUSH PRIVILEGES;" >> db_setup.sql
# Run the SQL script using the MariaDB root user credentials - Validation
mariadb -u $ROOT_USER -p$ROOT_PASSWORD < db_setup.sql 

# Clean up the SQL script
   rm db_setup.sql

echo "Database and user setup complete!"
